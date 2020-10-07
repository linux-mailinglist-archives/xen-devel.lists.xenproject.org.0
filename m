Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 881522866F7
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:27:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3695.10919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE9v-0002cS-O3; Wed, 07 Oct 2020 18:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3695.10919; Wed, 07 Oct 2020 18:27:27 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE9v-0002ZD-BZ; Wed, 07 Oct 2020 18:27:27 +0000
Received: by outflank-mailman (input) for mailman id 3695;
 Wed, 07 Oct 2020 18:27:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE5V-00072Q-OH
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:22:53 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f414edb5-514b-4fae-969b-d7da8e64f6e4;
 Wed, 07 Oct 2020 18:21:12 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDk5-0007CF-Sz; Wed, 07 Oct 2020 19:00:45 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE5V-00072Q-OH
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:22:53 +0000
X-Inumbo-ID: f414edb5-514b-4fae-969b-d7da8e64f6e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f414edb5-514b-4fae-969b-d7da8e64f6e4;
	Wed, 07 Oct 2020 18:21:12 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDk5-0007CF-Sz; Wed, 07 Oct 2020 19:00:45 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 50/82] shared/reuse: Rely on @ for ts-host-ping-check
Date: Wed,  7 Oct 2020 18:59:52 +0100
Message-Id: <20201007180024.7932-51-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

Remove the check for SharedReady.

The existence of this check is perplexing.  It was introduced in
  ts-host-ping-check: Do not run if host is being reused
in 8f1dc3f7c401 (from 2015).

At that time we only share build hosts, and build hosts never ran this
script.  So I don't understand what that was hoping to achieve.  Maybe
it made some difference in a now-lost pre-rebase situation.

Anyway, in our current tree I think we want to rerun the
ts-host-ping-check when we reuse a test host.  My change to add @ to
parts of per-host-prep in sg-run-job deliberately omitted the step
with testid host-ping-check-xen/@.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 ts-host-ping-check | 2 --
 1 file changed, 2 deletions(-)

diff --git a/ts-host-ping-check b/ts-host-ping-check
index a670680c..512aaec3 100755
--- a/ts-host-ping-check
+++ b/ts-host-ping-check
@@ -27,8 +27,6 @@ our ($whhost) = @ARGV;
 $whhost ||= 'host';
 our $ho= selecthost($whhost);
 
-exit 0 if $ho->{SharedReady};
-
 $_ = `ping -D -i 0.2 -c 100 $ho->{Ip} | tee -a /dev/stderr`;
 
 m/\b([0-9.]+)% packet loss\b/ or die "$_ ?";
-- 
2.20.1


