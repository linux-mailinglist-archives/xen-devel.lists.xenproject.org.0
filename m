Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2F920A1AE
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2020 17:16:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joTbh-0004eA-Ux; Thu, 25 Jun 2020 15:16:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bi8a=AG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1joTbg-0004e5-P0
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2020 15:16:04 +0000
X-Inumbo-ID: c75a6138-b6f6-11ea-81ed-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c75a6138-b6f6-11ea-81ed-12813bfff9fa;
 Thu, 25 Jun 2020 15:16:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 73E21AF49;
 Thu, 25 Jun 2020 15:16:00 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] scripts: don't rely on "stat -" support
Message-ID: <691aebb4-87af-60df-b6ad-07cb6fef4167@suse.com>
Date: Thu, 25 Jun 2020 17:16:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Durrant <paul@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

While commit b72682c602b8 ("scripts: Use stat to check lock claim")
validly indicates that stat has gained support for the special "-"
command line option in 2009, we should still try to avoid breaking being
able to run on even older distros. As it has been determined, contary to
the comment in the script using /dev/stdin (/proc/self/fd/$_lockfd) is
fine here, as Linux specially treats these /proc inodes.

Suggested-by: Ian Jackson <ian.jackson@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/hotplug/Linux/locking.sh
+++ b/tools/hotplug/Linux/locking.sh
@@ -45,18 +45,14 @@ claim_lock()
     while true; do
         eval "exec $_lockfd<>$_lockfile"
         flock -x $_lockfd || return $?
-        # We can't just stat /dev/stdin or /proc/self/fd/$_lockfd or
-        # use bash's test -ef because those all go through what is
-        # actually a synthetic symlink in /proc and we aren't
-        # guaranteed that our stat(2) won't lose the race with an
-        # rm(1) between reading the synthetic link and traversing the
-        # file system to find the inum.  stat(1) translates '-' into an
-        # fstat(2) of FD 0.  So we just need to arrange the FDs properly
-        # to get the fstat(2) we need.  stat will output two lines like:
+        # Although /dev/stdin (i.e. /proc/self/fd/0) looks like a symlink,
+        # stat(2) bypasses the synthetic symlink and directly accesses the
+        # underlying open-file.  So this works correctly even if the file
+        # has been renamed or unlinked.  stat will output two lines like:
         # WW.XXX
         # YY.ZZZ
         # which need to be separated and compared.
-        if stat=$( stat -L -c '%D.%i' - $_lockfile 0<&$_lockfd 2>/dev/null )
+        if stat=$( stat -L -c '%D.%i' /dev/stdin $_lockfile 0<&$_lockfd 2>/dev/null )
         then
             local file_stat
             local fd_stat

