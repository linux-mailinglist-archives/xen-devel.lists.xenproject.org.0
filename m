Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A44E79547A9
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 13:13:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778547.1188604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seut7-0007Gs-FC; Fri, 16 Aug 2024 11:12:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778547.1188604; Fri, 16 Aug 2024 11:12:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seut7-0007FM-Cc; Fri, 16 Aug 2024 11:12:57 +0000
Received: by outflank-mailman (input) for mailman id 778547;
 Fri, 16 Aug 2024 11:12:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0eKx=PP=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1seut5-0007FE-Ri
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 11:12:55 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b37e106-5bc0-11ef-8776-851b0ebba9a2;
 Fri, 16 Aug 2024 13:12:54 +0200 (CEST)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id B5CB31AE7F;
 Fri, 16 Aug 2024 07:12:52 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id AECE81AE7E;
 Fri, 16 Aug 2024 07:12:52 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 2D6301AE7D;
 Fri, 16 Aug 2024 07:12:48 -0400 (EDT)
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
X-Inumbo-ID: 7b37e106-5bc0-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=jjmqvyUqyJfIGrS4f+TrQFvun
	Q78NoLP29D4JepiAmo=; b=shUH7MPAYLzOTjQiHky6yVpIBMv11b4GqhQh0zHYl
	44mLjLb75TqVpnPW7FxaXxLgVA1AkvkS49UUik4syQsmi8zea7hdCwTMT3zXvul2
	CddQspko9iXte9cxRCPhsrlt9ijiTLPQdWvNz9Ksxnb+6Vu+JD32crOMoNc0fgs/
	Ng=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v2 2/5] x86/amd: configurable handling of AMD-specific MSRs access
Date: Fri, 16 Aug 2024 14:12:44 +0300
Message-Id: <917d2186db56c6f4c820f6b9e26b29fbe93301d6.1723806405.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1723806405.git.Sergiy_Kibrik@epam.com>
References: <cover.1723806405.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 784DA14A-5BC0-11EF-81D0-E92ED1CD468F-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

Do not compile handlers of guest access to AMD-specific MSRs when CONFIG_=
AMD=3Dn.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/msr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 289cf10b78..4567de7fc8 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -219,6 +219,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_=
t *val)
         *val =3D msrs->tsc_aux;
         break;
=20
+#ifdef CONFIG_AMD
     case MSR_K8_SYSCFG:
     case MSR_K8_TOP_MEM1:
     case MSR_K8_TOP_MEM2:
@@ -281,6 +282,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_=
t *val)
                                    ? 0 : (msr - MSR_AMD64_DR1_ADDRESS_MA=
SK + 1),
                                    ARRAY_SIZE(msrs->dr_mask))];
         break;
+#endif /* CONFIG_AMD */
=20
         /*
          * TODO: Implement when we have better topology representation.
@@ -552,6 +554,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_=
t val)
             wrmsr_tsc_aux(val);
         break;
=20
+#ifdef CONFIG_AMD
     case MSR_VIRT_SPEC_CTRL:
         if ( !cp->extd.virt_ssbd )
             goto gp_fault;
@@ -598,6 +601,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_=
t val)
         if ( v =3D=3D curr && (curr->arch.dr7 & DR7_ACTIVE_MASK) )
             wrmsrl(msr, val);
         break;
+#endif /* CONFIG_AMD */
=20
     default:
         return X86EMUL_UNHANDLEABLE;
--=20
2.25.1


