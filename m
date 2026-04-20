Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFepCeSL5mmbyAEAu9opvQ:T2
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69970433B07
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286524.1567759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBy-0002me-CT; Mon, 20 Apr 2026 20:26:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286524.1567759; Mon, 20 Apr 2026 20:26:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBw-0002PF-L7; Mon, 20 Apr 2026 20:26:00 +0000
Received: by outflank-mailman (input) for mailman id 1286524;
 Mon, 20 Apr 2026 20:20:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEv6h-0001fE-Ca
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 20:20:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEv6g-00C4rw-Px
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 22:20:34 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e68a71-2eae-0a2a0a5409dd-0a2a4504deec-40
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 22:20:34 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e68a91-1dec-0a2a45040019-22cac1c5a734-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 22:20:34 +0200
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1875363766; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 20:20:33 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=purelymail1 header.d=purelymail.com header.i="@purelymail.com" header.h="Feedback-ID:Received:From:To:Subject:Date"
DKIM-Signature: a=rsa-sha256; b=XrpheRDvgB46tE5EI6AUV9q6jqeSHTcLexgsVx4Q4It+SteGCzQ2BGNcIdXXUt4Gwfq33c+G3+NuIT5wrwWd9OD113QfmH4FjZeCJbHkHql0pd+zTCRlJodNCNp1m5xzOUUabZR4O/ZnPlu66u1eR+JFcujMn8UJCIEW56GnfeU3+i8bgz3GeJy7i8+EvfBWTz9XtxuCIWqQoZM/VXHmsv6d6PFFGb5Dk0z+GTzD7KFMDUVASIqnASJvfmNYUlGN4Rmk86LAYaoX0I4yNaGYnIBm+ZeHvrCNunPsyH2R2SKuFMIBlgYqcUyoIka15+jz+WhkKvyQOX+gjDid4ckZFQ==; s=purelymail1; d=purelymail.com; v=1; bh=J3AjVDX1lXR4hMM7xwvgtHJ0IKFDxOCh6rCV/eiLd40=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 685805:22403:null:purelymail
X-Pm-Original-To: xen-devel@lists.xenproject.org
From: Rose.Spangler@purelymail.com
To: xen-devel@lists.xenproject.org
Cc: Rose Spangler <Rose.Spangler@elektrobit.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Aqib Javaid <Aqib.Javaid@elektrobit.com>
Subject: [RFC PATCH v6 31/43] altp2m: Add altp2m_view_is_{valid,visible}
Date: Mon, 20 Apr 2026 16:20:14 -0400
Message-Id: <20260420202026.208110-3-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420202026.208110-1-Rose.Spangler@purelymail.com>
References: <20260420202026.208110-1-Rose.Spangler@purelymail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-ebf023/1776716434-2A37F3FF-05C10323/0/0
X-purgate-type: clean
X-purgate-size: 3592
X-Spamd-Result: default: False [3.51 / 15.00];
	DMARC_POLICY_REJECT(2.00)[purelymail.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[purelymail.com:s=purelymail1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:Aqib.Javaid@elektrobit.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[purelymail.com:-];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.893];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 69970433B07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rose Spangler <Rose.Spangler@elektrobit.com>

This commit adds arch independent helper functions to determine whether a
view is valid or visible. This makes it possible to determine whether a
view is valid and/or visible in common altp2m routines (namely,
altp2m_init_by_id).

This is commit 2/5 of the altp2m view validity/visibility phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
Signed-off-by: Aqib Javaid <Aqib.Javaid@elektrobit.com>
---
v6: Introduced this patch.

    These functions could be used to replace the equivalent calls in x86
    code if that would be preferred. For now, they are only used in common
    code.

    The altp2m_view_is_valid function also has overlap with the
    altp2m_is_ept_valid function, but that function has an additional
    ASSERT and check that idx < d->nr_altp2m, so I wasn't sure if that
    function should be repurposed for this. If renaming that function
    instead of introducing a new function on x86 would be preferred, then I
    can do that.

    Additionally, these functions don't have bounds checks since the
    functions are intended to replace code which don't have bounds checks
    currently. Bounds checks could be added here if that would be
    preferred.
---
 xen/arch/arm/altp2m.c             | 10 ++++++++++
 xen/arch/arm/include/asm/altp2m.h |  3 +++
 xen/arch/x86/include/asm/altp2m.h | 10 ++++++++++
 3 files changed, 23 insertions(+)

diff --git a/xen/arch/arm/altp2m.c b/xen/arch/arm/altp2m.c
index e741648ff5a1..0e19e197e826 100644
--- a/xen/arch/arm/altp2m.c
+++ b/xen/arch/arm/altp2m.c
@@ -27,6 +27,16 @@ void altp2m_set_vcpu_idx(struct vcpu *v, unsigned int id=
x)
     v->arch.ap2m_idx =3D idx;
 }
=20
+bool altp2m_view_is_valid(struct domain *d, unsigned int idx)
+{
+    return d->arch.altp2m_state[array_index_nospec(idx, d->nr_altp2m)] !=
=3D ALTP2M_INVALID;
+}
+
+bool altp2m_view_is_visible(struct domain *d, unsigned int idx)
+{
+    return d->arch.altp2m_state[array_index_nospec(idx, d->nr_altp2m)] =3D=
=3D ALTP2M_VISIBLE;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/altp2m.h b/xen/arch/arm/include/asm/a=
ltp2m.h
index 05beb7f698a7..fbe66ad5536d 100644
--- a/xen/arch/arm/include/asm/altp2m.h
+++ b/xen/arch/arm/include/asm/altp2m.h
@@ -30,6 +30,9 @@ static inline bool altp2m_supported(void)
 uint16_t altp2m_vcpu_idx(const struct vcpu *v);
 void altp2m_set_vcpu_idx(struct vcpu *v, unsigned int idx);
=20
+bool altp2m_view_is_valid(struct domain *d, unsigned int idx);
+bool altp2m_view_is_visible(struct domain *d, unsigned int idx);
+
 /* The current state of an altp2m view */
 enum altp2m_view_state {
     ALTP2M_INVALID,
diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/a=
ltp2m.h
index 43dd5d2acd9c..56ae19b24b42 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -65,6 +65,16 @@ static inline void altp2m_set_vcpu_idx(struct vcpu *v, u=
nsigned int idx)
     vcpu_altp2m(v).p2midx =3D idx;
 }
=20
+static inline bool altp2m_view_is_valid(struct domain *d, unsigned int idx=
)
+{
+    return d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] !=3D mfn=
_x(INVALID_MFN);
+}
+
+static inline bool altp2m_view_is_visible(struct domain *d, unsigned int i=
dx)
+{
+    return d->arch.altp2m_visible_eptp[array_index_nospec(idx, MAX_EPTP)] =
!=3D mfn_x(INVALID_MFN);
+}
+
 /*
  * Alternate p2m: shadow p2m tables used for alternate memory views
  */
--=20
2.34.1


