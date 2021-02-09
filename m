Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 340CC3152CE
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 16:28:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83288.154627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9UwJ-0007Dq-6U; Tue, 09 Feb 2021 15:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83288.154627; Tue, 09 Feb 2021 15:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9UwJ-0007Cs-17; Tue, 09 Feb 2021 15:28:31 +0000
Received: by outflank-mailman (input) for mailman id 83288;
 Tue, 09 Feb 2021 15:28:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l9UwG-00078G-UV
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 15:28:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9UwG-0000u7-4T; Tue, 09 Feb 2021 15:28:28 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9UwF-0007gX-S3; Tue, 09 Feb 2021 15:28:28 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=Abq0PPrn9pqn8Kzw0uPNv4HuJCaFMRZ3qng4/qj2vjw=; b=55TSYWVkX0xe7FrDVESrW/6UE
	wGYnGSpzg5Qa+uVM5TPcDzoPUoP6QyOgp9vgW6Bshv81L+xdL8+69NptC7B67BfIXHVGZiSNOL1RA
	EwItmCZkQc/HmjFAqTOI3cIyuryUcWT65XgCp10viS6zdWAN9m+UZrVWqi9e/M1gQUgfs=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: hongyxia@amazon.co.uk,
	iwj@xenproject.org,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [for-4.15][PATCH v2 3/5] xen/iommu: iommu_map: Don't crash the domain if it is dying
Date: Tue,  9 Feb 2021 15:28:14 +0000
Message-Id: <20210209152816.15792-4-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210209152816.15792-1-julien@xen.org>
References: <20210209152816.15792-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

It is a bit pointless to crash a domain that is already dying. This will
become more an annoyance with a follow-up change where page-table
allocation will be forbidden when the domain is dying.

Security wise, there is no change as the devices would still have access
to the IOMMU page-tables even if the domain has crashed until Xen
start to relinquish the resources.

For x86, we rely on dom_iommu(d)->arch.mapping.lock to ensure
d->is_dying is correctly observed (a follow-up patch will held it in the
relinquish path).

For Arm, there is still a small race possible. But there is so far no
failure specific to a domain dying.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

This was spotted when trying to destroy IOREQ servers while the domain
is dying. The code will try to add the entry back in the P2M and
therefore update the P2M (see arch_ioreq_server_disable() ->
hvm_add_ioreq_gfn()).

It should be possible to skip the mappin in hvm_add_ioreq_gfn(), however
I didn't try a patch yet because checking d->is_dying can be racy (I
can't find a proper lock).

Changes in v2:
    - Patch added
---
 xen/drivers/passthrough/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 879d238bcd31..75419f20f76d 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -272,7 +272,7 @@ int iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
                             flush_flags) )
                 continue;
 
-        if ( !is_hardware_domain(d) )
+        if ( !is_hardware_domain(d) && !d->is_dying )
             domain_crash(d);
 
         break;
-- 
2.17.1


