Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE3A8D8096
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 13:10:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734808.1140889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE5Za-0008BV-1C; Mon, 03 Jun 2024 11:09:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734808.1140889; Mon, 03 Jun 2024 11:09:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE5ZZ-000895-Ul; Mon, 03 Jun 2024 11:09:53 +0000
Received: by outflank-mailman (input) for mailman id 734808;
 Mon, 03 Jun 2024 11:09:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G0SM=NF=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sE5ZY-00086P-7s
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 11:09:52 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb617c31-2199-11ef-90a1-e314d9c70b13;
 Mon, 03 Jun 2024 13:09:51 +0200 (CEST)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 60E6031593;
 Mon,  3 Jun 2024 07:09:49 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 5887B31592;
 Mon,  3 Jun 2024 07:09:49 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 0E8263158F;
 Mon,  3 Jun 2024 07:09:45 -0400 (EDT)
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
X-Inumbo-ID: cb617c31-2199-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=sPIOjqAVFxujq+o241jW7icrs
	Sxi6WsPSyOt9m/OrS8=; b=anWlnWgXFC7YX/SHvzJnwB3j/H5i0sj4x3YM+JkVW
	HZnxk481sqaqdMsHrpwqwsVAc2D99tPEBiDt/zQF818QJlq0ZHCCLoKpHQM7Il9L
	bS2ukjBwHGUzPi3/UGF+uUs+Rp/U2tbH9PlxW86Qf16Zep9FST9CtWkvjUzXeF90
	qs=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: [XEN PATCH v3 02/16] x86/altp2m: check if altp2m active when giving away p2midx
Date: Mon,  3 Jun 2024 14:09:42 +0300
Message-Id: <9306d31184b8e714c3a10ccc6a2b2c6a80777ddb.1717410850.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 C92EAAC0-2199-11EF-B728-8F8B087618E4-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

Explicitly check whether altp2m is on for domain when getting altp2m inde=
x.

The puspose of that is later to be able to disable altp2m support and
exclude its code from the build completely, when not supported by target
platform (as of now it's implemented for Intel EPT only).

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Tamas K Lengyel <tamas@tklengyel.com>
CC: Jan Beulich <jbeulich@suse.com>
---
changes in v3:
 - move altp2m_active() check inside altp2m_vcpu_idx()
 - drop changes to monitor.c
 - changed patch description
changes in v2:
 - patch description changed, removed VMX mentioning
 - guard by altp2m_active() instead of hvm_altp2m_supported()
---
 xen/arch/x86/include/asm/altp2m.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm=
/altp2m.h
index e5e59cbd68..2d36c5aa9b 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -26,10 +26,6 @@ void altp2m_vcpu_destroy(struct vcpu *v);
 int altp2m_vcpu_enable_ve(struct vcpu *v, gfn_t gfn);
 void altp2m_vcpu_disable_ve(struct vcpu *v);
=20
-static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
-{
-    return vcpu_altp2m(v).p2midx;
-}
 #else
=20
 static inline bool altp2m_active(const struct domain *d)
@@ -38,9 +34,13 @@ static inline bool altp2m_active(const struct domain *=
d)
 }
=20
 /* Only declaration is needed. DCE will optimise it out when linking. */
-uint16_t altp2m_vcpu_idx(const struct vcpu *v);
 void altp2m_vcpu_disable_ve(struct vcpu *v);
=20
 #endif
=20
+static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
+{
+    return altp2m_active(v->domain) ? vcpu_altp2m(v).p2midx : 0;
+}
+
 #endif /* __ASM_X86_ALTP2M_H */
--=20
2.25.1


