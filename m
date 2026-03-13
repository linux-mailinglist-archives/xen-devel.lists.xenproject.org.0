Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HMGIZ0/tGlljgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:47:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7120528760F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:47:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1254164.1550164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15fT-0007XN-IR; Fri, 13 Mar 2026 16:47:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1254164.1550164; Fri, 13 Mar 2026 16:47:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15fT-0007VV-En; Fri, 13 Mar 2026 16:47:19 +0000
Received: by outflank-mailman (input) for mailman id 1254164;
 Fri, 13 Mar 2026 16:47:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lzbp=BN=bounce.vates.tech=bounce-md_30504962.69b43f94.v1-e6b761e1b1f7448687105735495f9699@srs-se1.protection.inumbo.net>)
 id 1w15fS-0006fv-9B
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:47:18 +0000
Received: from mail134-15.atl141.mandrillapp.com
 (mail134-15.atl141.mandrillapp.com [198.2.134.15])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b4cbd9d-1efc-11f1-b164-2bf370ae4941;
 Fri, 13 Mar 2026 17:47:17 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-15.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4fXVl84knrzPm0PqM
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 16:47:16 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e6b761e1b1f7448687105735495f9699; Fri, 13 Mar 2026 16:47:16 +0000
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
X-Inumbo-ID: 4b4cbd9d-1efc-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773420436; x=1773690436;
	bh=tBqT15VgX6aHPkE4gLQnkO0oJx1PmUhyS6eAmAg6IcA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=GX5lVS29RUTKr/vbIVOLwFzgCUUFqxSTOIUfJoV4hu8dmQbu4bIFWZvsVBzTHy705
	 c7CbqOt5zCXc+RADwUEFKsp7IhgxU4LszeIRGWb04GkkMdzeMtWgY3BUhlKenWhGU+
	 ckx68gKYyJvt/kvLkjh7u432Br5QvCD1DnZAM8zIYYHVDaAtoccCow8c1w24rTJEc+
	 L1GTcfQu567K9NAIDHe1cuC14Sn2Zsx0fQIQuEIgE0X+1ME6n5Y6Hwni4cg6qzidNe
	 MCD3mW3jj4q8jnINAFrR1TE/7MYUmQNDgZvyairJ0wY4g0Vj460xeC+m9cktaHeHGM
	 KlvQMXMDfLcHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773420436; x=1773680936; i=thierry.escande@vates.tech;
	bh=tBqT15VgX6aHPkE4gLQnkO0oJx1PmUhyS6eAmAg6IcA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=IKvtfnlQuiiJnkVOazyhGMevNQOw1IbmwXhVJ+rkVMRg8YN18RLN3qm6mN6H5FJzo
	 GVjDkvZRx8JWrq2jL4IiuPKUTWsrmYgO8WeaAV+6wt9Gm5paIBDh9X6u/Pjo5TVVeQ
	 FnHiM6+siNRiJgZ3bC+N4RYkY2aWkPXBt0FWc0woKXD4IlMuE2iJICHJtMM5jnDor7
	 9xaMX12kSskk4dQyohROhI5GC4IIbnWIDsk3fMl8ConzdyjBI9hgOBpjXYOkFsm++L
	 e6febQyGMYropNNEGkfGa5XnPI261xljXJ+gg8hoxgEDX/hyYIi/qVOvBu0QH5zYBY
	 kv62fwCxdzYOA==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[PATCH=203/4]=20q35:=20Fix=20incorrect=20values=20for=20PCIEXBAR=20masks?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773420435540
To: qemu-devel@nongnu.org
Cc: "Alexey Gerasimenko" <x1917x@gmail.com>, "Paolo Bonzini" <pbonzini@redhat.com>, "Richard Henderson" <richard.henderson@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, "Eduardo Habkost" <eduardo@habkost.net>, "Anthony PERARD" <anthony@xenproject.org>, xen-devel@lists.xenproject.org, "Thierry Escande" <thierry.escande@vates.tech>
Message-Id: <20260313164649.794591-4-thierry.escande@vates.tech>
In-Reply-To: <20260313164649.794591-1-thierry.escande@vates.tech>
References: <20260313164649.794591-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e6b761e1b1f7448687105735495f9699?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260313:md
Date: Fri, 13 Mar 2026 16:47:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:x1917x@gmail.com,m:pbonzini@redhat.com,m:richard.henderson@linaro.org,m:mst@redhat.com,m:eduardo@habkost.net,m:anthony@xenproject.org,m:xen-devel@lists.xenproject.org,m:thierry.escande@vates.tech,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,redhat.com,linaro.org,habkost.net,xenproject.org,lists.xenproject.org,vates.tech];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:dkim,vates.tech:mid,vates.tech:email,vates.tech:url,mandrillapp.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[0.087];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7120528760F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Alexey Gerasimenko <x1917x@gmail.com>

There are two small issues in PCIEXBAR address mask handling:
- wrong bit positions for address mask bits (see PCIEXBAR description
  in Q35 datasheet)
- incorrect usage of 64ADR_MASK

Due to this, attempting to write a valid PCIEXBAR address may cause it
to shift to another address, causing memory layout corruption where
emulated MMIO regions may overlap real (passed through) MMIO ranges. Fix
this by providing correct values.

Signed-off-by: Alexey Gerasimenko <x1917x@gmail.com>
Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
---
 hw/pci-host/q35.c         | 6 +++---
 include/hw/pci-host/q35.h | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index e85e4227b3..7368e3c598 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -306,12 +306,12 @@ static void mch_update_pciexbar(MCHPCIState *mch)
         break;
     case MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_128M:
         length = 128 * 1024 * 1024;
-        addr_mask |= MCH_HOST_BRIDGE_PCIEXBAR_128ADMSK |
-            MCH_HOST_BRIDGE_PCIEXBAR_64ADMSK;
+        addr_mask |= MCH_HOST_BRIDGE_PCIEXBAR_128ADMSK;
         break;
     case MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_64M:
         length = 64 * 1024 * 1024;
-        addr_mask |= MCH_HOST_BRIDGE_PCIEXBAR_64ADMSK;
+        addr_mask |= MCH_HOST_BRIDGE_PCIEXBAR_64ADMSK |
+            MCH_HOST_BRIDGE_PCIEXBAR_128ADMSK;
         break;
     case MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_RVD:
         qemu_log_mask(LOG_GUEST_ERROR, "Q35: Reserved PCIEXBAR LENGTH\n");
diff --git a/include/hw/pci-host/q35.h b/include/hw/pci-host/q35.h
index ddafc3f2e3..f31a71010b 100644
--- a/include/hw/pci-host/q35.h
+++ b/include/hw/pci-host/q35.h
@@ -100,8 +100,8 @@ struct Q35PCIHost {
 #define MCH_HOST_BRIDGE_PCIEXBAR_DEFAULT       0xb0000000
 #define MCH_HOST_BRIDGE_PCIEXBAR_MAX           (0x10000000) /* 256M */
 #define MCH_HOST_BRIDGE_PCIEXBAR_ADMSK         Q35_MASK(64, 35, 28)
-#define MCH_HOST_BRIDGE_PCIEXBAR_128ADMSK      ((uint64_t)(1 << 26))
-#define MCH_HOST_BRIDGE_PCIEXBAR_64ADMSK       ((uint64_t)(1 << 25))
+#define MCH_HOST_BRIDGE_PCIEXBAR_128ADMSK      ((uint64_t)(1 << 27))
+#define MCH_HOST_BRIDGE_PCIEXBAR_64ADMSK       ((uint64_t)(1 << 26))
 #define MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_MASK   ((uint64_t)(0x3 << 1))
 #define MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_256M   ((uint64_t)(0x0 << 1))
 #define MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_128M   ((uint64_t)(0x1 << 1))
-- 
2.51.0



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


