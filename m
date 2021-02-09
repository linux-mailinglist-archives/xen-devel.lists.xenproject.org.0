Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9A7315578
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 18:59:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83374.155018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9XID-0007g5-1i; Tue, 09 Feb 2021 17:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83374.155018; Tue, 09 Feb 2021 17:59:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9XIC-0007fG-KM; Tue, 09 Feb 2021 17:59:16 +0000
Received: by outflank-mailman (input) for mailman id 83374;
 Tue, 09 Feb 2021 17:59:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l9XIA-0007dh-LS
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:59:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l9XIA-0003yv-Km
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:59:14 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l9XIA-0004dP-JD
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:59:14 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1l9XI8-00065Y-M7; Tue, 09 Feb 2021 17:59:12 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=7ptVHVv6hSaLUTOmQvRCmHGiTbV+rGIqKIYD1ZJ897I=; b=Uf6AjtirZWVDuiNlWJEiz0Cjjy
	M4h4JY1qy4daDHN8uF5lX9ckO5XK99gdLtdZqCE3E1nkF48MdTluyWXQPmPvQIRArF727dkCCU84T
	X+hEwuKcvhvwyZafykJad7ktpYWMCXK0VWEG9GW2s94Zfxq63g4y0cmjUQ1EGmrm52vk=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 3/7] Debian mirror selection: Provide debian_archive_url_suite_arch
Date: Tue,  9 Feb 2021 17:59:00 +0000
Message-Id: <20210209175904.28282-3-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209175904.28282-1-iwj@xenproject.org>
References: <20210209175904.28282-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mg-debian-installer-update is going to want this.  NFC.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 Osstest/Debian.pm | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index 05cc6e1f..dee52b3d 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -814,12 +814,8 @@ chmod 600 $subdir/etc/ssh/ssh_host_*_key ||:
 END
 }
 
-sub debian_mirror_url ($) {
-    # I think ideally this should handle, and be used for, backports too.
-    # It would need an optional suite suffix which could be "-backports"?
-    my ($ho) = @_;
-    my $suite = $ho->{Suite};
-    my $arch = $ho->{Arch};
+sub debian_mirror_url_suite_arch ($$) {
+    my ($suite, $arch) = @_;
     my $url =
       $c{"DebianMirror_${suite}_${arch}"} //
       $c{"DebianMirror_${suite}"} //
@@ -830,6 +826,13 @@ sub debian_mirror_url ($) {
     return $url;
 }
 
+sub debian_mirror_url ($) {
+    # I think ideally this should handle, and be used for, backports too.
+    # It would need an optional suite suffix which could be "-backports"?
+    my ($ho) = @_;
+    return debian_mirror_url_suite_arch($ho->{Suite}, $ho->{Arch});
+}
+
 sub debian_mirror_host_path ($) {
     my ($ho) = @_;
     my $url = debian_mirror_url($ho);
-- 
2.20.1


