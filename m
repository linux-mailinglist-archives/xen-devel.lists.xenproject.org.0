Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C58286708
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:28:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3711.11094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEAT-0004BO-9U; Wed, 07 Oct 2020 18:28:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3711.11094; Wed, 07 Oct 2020 18:28:00 +0000
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
	id 1kQEAR-00046c-Nz; Wed, 07 Oct 2020 18:27:59 +0000
Received: by outflank-mailman (input) for mailman id 3711;
 Wed, 07 Oct 2020 18:27:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE2l-00072Q-I2
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:20:03 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7613705-b72b-4847-aaa2-3b430a1b5cf5;
 Wed, 07 Oct 2020 18:19:29 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDk3-0007CF-JV; Wed, 07 Oct 2020 19:00:43 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE2l-00072Q-I2
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:20:03 +0000
X-Inumbo-ID: a7613705-b72b-4847-aaa2-3b430a1b5cf5
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a7613705-b72b-4847-aaa2-3b430a1b5cf5;
	Wed, 07 Oct 2020 18:19:29 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDk3-0007CF-JV; Wed, 07 Oct 2020 19:00:43 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <Ian.Jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 40/82] ts-host-reuse: Do not depend on bios
Date: Wed,  7 Oct 2020 18:59:42 +0100
Message-Id: <20201007180024.7932-41-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

Weirdly, this is only used for guests.  Really, it should be a
target_var, not a raw runvar applying to all guests, since it can be
guest-specific.

Signed-off-by: Ian Jackson <Ian.Jackson@eu.citrix.com>
---
 ts-host-reuse | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ts-host-reuse b/ts-host-reuse
index 74ac94aa..67de480f 100755
--- a/ts-host-reuse
+++ b/ts-host-reuse
@@ -71,7 +71,7 @@ sub compute_test_sharetype () {
     sharetype_add('di', $ho->{DiVersion});
 
     foreach my $runvar (qw(freebsd_distpath freebsdbuildjob
-			   bios xenable_xsm toolstack kernkind)) {
+			   xenable_xsm toolstack kernkind)) {
 	my $val = $r{$runvar};
 	die "$runvar $val ?" if defined $val && $val =~ m{[,/\%\\]};
 	sharetype_add($runvar, $val);
-- 
2.20.1


