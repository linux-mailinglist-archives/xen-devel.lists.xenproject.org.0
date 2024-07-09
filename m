Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D3E92AF90
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 07:48:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755735.1164181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR3iG-0007Lc-IW; Tue, 09 Jul 2024 05:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755735.1164181; Tue, 09 Jul 2024 05:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR3iG-0007JL-Fp; Tue, 09 Jul 2024 05:48:28 +0000
Received: by outflank-mailman (input) for mailman id 755735;
 Tue, 09 Jul 2024 05:48:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SGp0=OJ=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sR3iF-0007JF-0s
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 05:48:27 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9db6e13-3db6-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 07:48:24 +0200 (CEST)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 5376820012;
 Tue,  9 Jul 2024 01:48:21 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 3EB5220011;
 Tue,  9 Jul 2024 01:48:21 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id C9C0D20010;
 Tue,  9 Jul 2024 01:48:17 -0400 (EDT)
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
X-Inumbo-ID: d9db6e13-3db6-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=ar8Sud9602ZOgj0pi1k8W2AaU
	4FGR+7Cpmq6PiXLXn4=; b=IhRN2hib2pG6Cl24zRkpYiMw9SYV7kAPpTPocuxbD
	o4mzgmfDTnzRhRlkVHFuz5L+L1jxiyFwMoMieJ0DnV7TiV1aybkvILFA93zXjHrb
	zBrIUJyg3F8ZcY2UFXXvG86nun1w8ieG9xnlQOwwcVUXpKj3Jl5c73SpKP5R1eLO
	7E=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: [XEN PATCH v4 02/14] x86/altp2m: add static inline stub for altp2m_vcpu_idx()
Date: Tue,  9 Jul 2024 08:48:13 +0300
Message-Id: <952cb307528f16fc36a3fadbe26d83bc6805f81e.1720501197.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
References: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 D75F0E6C-3DB6-11EF-AE0E-DFF1FEA446E2-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

The stub just returns 0 due to implementation of  p2m_get_mem_access() fo=
r
x86 & ARM expects it to be 0 when altp2m not active or not implemented.

The separate stub is favoured over dynamic check for alt2pm availability
inside regular altp2m_vcpu_idx() because this way we retain the possibili=
ty
to later put the whole struct altp2mvcpu under CONFIG_ALTP2M.

The purpose of the change is later to be able to disable altp2m support a=
nd
exclude its code from the build completely, when not supported by target
platform (as of now it's implemented for Intel EPT only).

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Tamas K Lengyel <tamas@tklengyel.com>
CC: Jan Beulich <jbeulich@suse.com>
---
changes in v4:
 - add static inline stub for altp2m_vcpu_idx() instead of using
   altp2m_active() check inside altp2m_vcpu_idx() as suggested by Jan
 - changed patch description
changes in v3:
 - move altp2m_active() check inside altp2m_vcpu_idx()
 - drop changes to monitor.c
 - changed patch description
changes in v2:
 - patch description changed, removed VMX mentioning
 - guard by altp2m_active() instead of hvm_altp2m_supported()
---
 xen/arch/x86/include/asm/altp2m.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm=
/altp2m.h
index e5e59cbd68..c655b8a34e 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -37,8 +37,12 @@ static inline bool altp2m_active(const struct domain *=
d)
     return false;
 }
=20
+static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
+{
+    return 0;
+}
+
 /* Only declaration is needed. DCE will optimise it out when linking. */
-uint16_t altp2m_vcpu_idx(const struct vcpu *v);
 void altp2m_vcpu_disable_ve(struct vcpu *v);
=20
 #endif
--=20
2.25.1


