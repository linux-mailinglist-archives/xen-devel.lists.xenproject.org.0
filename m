Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D53940ED5
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 12:19:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767461.1178115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYjw8-0001XG-Gc; Tue, 30 Jul 2024 10:18:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767461.1178115; Tue, 30 Jul 2024 10:18:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYjw8-0001Vm-Do; Tue, 30 Jul 2024 10:18:32 +0000
Received: by outflank-mailman (input) for mailman id 767461;
 Tue, 30 Jul 2024 10:18:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f2k0=O6=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sYjw6-0001Vg-Ox
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 10:18:30 +0000
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f9d4f42-4e5d-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 12:18:28 +0200 (CEST)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id C71A6352CE;
 Tue, 30 Jul 2024 06:18:26 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id BDF61352CB;
 Tue, 30 Jul 2024 06:18:26 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 430E8352CA;
 Tue, 30 Jul 2024 06:18:22 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
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
X-Inumbo-ID: 0f9d4f42-4e5d-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=fZgepJ99FLaK7AHeqjTZAWTib
	QvdlwNx7oQOyRXLmVM=; b=PjYmm5j2TCZQntY56hr0kLmHYUa/aIkKBsNAOzSve
	K6iC8xwmrgGSKfX3X/a6oc2cC2D3ahdKPUfGKV4W+Qr12EH7h2HEG4UA7s6hv22l
	T2p6p/ChqOSnN0jtt65axxcAyn8cD6jXlSj01+C9WzZWI9mmHYIURWtDgxxiESJY
	Zk=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: [XEN PATCH v5 02/13] x86/monitor: guard altp2m usage
Date: Tue, 30 Jul 2024 13:18:18 +0300
Message-Id: <b0292af6629ad483dd0a437960585cf5aa3a03cd.1722333634.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1722333634.git.Sergiy_Kibrik@epam.com>
References: <cover.1722333634.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 0CA62FEA-4E5D-11EF-BF3D-92D9AF168FA5-90055647!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable

Explicitly check whether altp2m is on for domain when getting altp2m inde=
x.
If explicit call to altp2m_active() always returns false, DCE will remove
call to altp2m_vcpu_idx().

p2m_get_mem_access() expects 0 as altp2m_idx parameter when altp2m not ac=
tive
or not supported, so 0 is a fallback value then.

The puspose of that is later to be able to disable altp2m support and
exclude its code from the build completely, when not supported by target
platform (as of now it's supported for VT-d only).

Also all other calls to altp2m_vcpu_idx() are guarded by altp2m_active(),=
 so
this change puts usage of this routine in line with the rest of code.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Tamas K Lengyel <tamas@tklengyel.com>
CC: Jan Beulich <jbeulich@suse.com>
---
changes in v5:
 - changed patch description
changes in v2:
 - patch description changed, removed VMX mentioning
 - guard by altp2m_active() instead of hvm_altp2m_supported()
---
 xen/arch/x86/hvm/monitor.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
index 2a8ff07ec9..74621000b2 100644
--- a/xen/arch/x86/hvm/monitor.c
+++ b/xen/arch/x86/hvm/monitor.c
@@ -262,6 +262,8 @@ bool hvm_monitor_check_p2m(unsigned long gla, gfn_t g=
fn, uint32_t pfec,
     struct vcpu *curr =3D current;
     vm_event_request_t req =3D {};
     paddr_t gpa =3D (gfn_to_gaddr(gfn) | (gla & ~PAGE_MASK));
+    unsigned int altp2m_idx =3D altp2m_active(curr->domain) ?
+                              altp2m_vcpu_idx(curr) : 0;
     int rc;
=20
     ASSERT(curr->arch.vm_event->send_event);
@@ -270,7 +272,7 @@ bool hvm_monitor_check_p2m(unsigned long gla, gfn_t g=
fn, uint32_t pfec,
      * p2m_get_mem_access() can fail from a invalid MFN and return -ESRC=
H
      * in which case access must be restricted.
      */
-    rc =3D p2m_get_mem_access(curr->domain, gfn, &access, altp2m_vcpu_id=
x(curr));
+    rc =3D p2m_get_mem_access(curr->domain, gfn, &access, altp2m_idx);
=20
     if ( rc =3D=3D -ESRCH )
         access =3D XENMEM_access_n;
--=20
2.25.1


