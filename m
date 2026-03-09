Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DGgNZu9rmlEIgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 13:31:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E988238DE9
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 13:31:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249407.1546876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzZlN-0005gD-4W; Mon, 09 Mar 2026 12:31:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249407.1546876; Mon, 09 Mar 2026 12:31:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzZlM-0005af-WF; Mon, 09 Mar 2026 12:31:09 +0000
Received: by outflank-mailman (input) for mailman id 1249407;
 Mon, 09 Mar 2026 12:31:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aJJ9=BJ=bounce.vates.tech=bounce-md_30504962.69aebd87.v1-7632bac910874125b6f28e7074afe0a8@srs-se1.protection.inumbo.net>)
 id 1vzZlL-0005Rm-81
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 12:31:07 +0000
Received: from mail133-21.atl131.mandrillapp.com
 (mail133-21.atl131.mandrillapp.com [198.2.133.21])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d65d34a9-1bb3-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Mar 2026 13:31:04 +0100 (CET)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-21.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4fTxFM1TNbz1XLF7d
 for <xen-devel@lists.xenproject.org>; Mon,  9 Mar 2026 12:31:03 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 7632bac910874125b6f28e7074afe0a8; Mon, 09 Mar 2026 12:31:03 +0000
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
X-Inumbo-ID: d65d34a9-1bb3-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773059463; x=1773329463;
	bh=jYo3ibCaaXE6o3VshQXsD68O/WvKsje9Jyl33S4ybjc=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=jlUk3StiwCUfMddo7aJqdYhPn/7b1GgHWCpg8BVaaHVLlzegSLS+0WSqvQ5rcU4U/
	 TMLixJbD8qAlNKnkI+sf0x3Bgr+QLg7CL8tNuhRL0j5gfOLT8s3OL8XkhxDxHNgAea
	 EpL8C2qOLsHf0TvQKC4IP5vLwuU1gUM8N+VygHYLJdr0eU4CrttxO+S1Z9R5E2hzV7
	 kV05q7+9BgHWUjXPN8cxPpQnpMVdy77FCGH0G5NWuJjqfXvXWV4xzDYlWuwGP4NS75
	 iYe1b32t+gaEv44TPIxp3DKubIBU4mDQ2M01ObhQ/7X4n7WMFCstVvaLE7knVuaqrG
	 eUXdMcyvSB37Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773059463; x=1773319963; i=julian.vetter@vates.tech;
	bh=jYo3ibCaaXE6o3VshQXsD68O/WvKsje9Jyl33S4ybjc=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=MeN2GrZoOwok5InfyDmVIlwaghm/gDenRVb9V4tRw9NzSxVw3+zPu/XURKTAmANOR
	 +va0zwayQHZAsR2i3crmziHqrscnXYw8AS2GorETTl4pI8imarWetI59ADga6S8pcY
	 BkjSrSZg0TAJWSdsfb1VRkYddO6P3Cc/qlIe9jyEWVdgnnRlbr0/VzPBDaKITIBY+A
	 n5wRHkVB3Z/e1AncrJo+ZGEw6tw9N8kItN2IQIhCKbmihBgpXEuvXCshZn8BffNtT1
	 C2F9/KDQr0Lha27aHZPcSIyRMjWfss3iqq04+QHjbasctWoDDGDy83cyrt0cXeTxUD
	 CO+t1xS5/ib8A==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v3=202/7]=20x86/msi:=20Define=20extended=20destination=20ID=20masks=20and=20IO-APIC=20RTE=20fields?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773059461979
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Juergen Gross" <jgross@suse.com>, "Julien Grall" <julien@xen.org>, "Julian Vetter" <julian.vetter@vates.tech>
Message-Id: <20260309123055.880050-2-julian.vetter@vates.tech>
In-Reply-To: <20260309123055.880050-1-julian.vetter@vates.tech>
References: <20260309123055.880050-1-julian.vetter@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.7632bac910874125b6f28e7074afe0a8?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260309:md
Date: Mon, 09 Mar 2026 12:31:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 8E988238DE9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,vates.tech:dkim,vates.tech:email,vates.tech:url,vates.tech:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:julien@xen.org,m:julian.vetter@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	NEURAL_HAM(-0.00)[-0.355];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

x2APIC guests with more than 128 vCPUs need destination IDs beyond the
8-bit range provided by the standard MSI address and IO-APIC RTE fields.
The Intel spec allows bits 11:5 of the MSI address and bits 55:49 of the
IO-APIC RTE to carry the high 7 bits of the destination ID when the
platform advertises support, expanding the range to 15 bits total.
Add MSI_ADDR_EXT_DEST_ID_MASK for the extended MSI address bits, and
IO_APIC_REDIR_{DEST,EXT_DEST}_MASK with a VIOAPIC_RTE_DEST() helper to
extract the combined 15-bit destination from an IO-APIC RTE. Extend the
IO-APIC RTE save/restore struct with an ext_dest_id field, and add
XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK plus
XEN_DOMCTL_VMSI_X86_FULL_DEST() to the domctl MSI gflags interface so
callers can pass and extract the full destination ID through the
existing pt_irq_bind path.

Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
---
Changes in V3:
- Addressed comments from Jan
  - Replaced reserved field by generically named reserved2
  - Added proper constants for the shift of the upper bits of the
    MSI/RTE IDs
  - Added reference for the MSI_ADDR_EXT_DEST_ID_MASK
---
 xen/arch/x86/hvm/vioapic.c             |  2 +-
 xen/arch/x86/include/asm/hvm/vioapic.h | 13 +++++++++++++
 xen/arch/x86/include/asm/msi.h         | 10 +++++++++-
 xen/include/public/arch-x86/hvm/save.h |  4 +++-
 xen/include/public/domctl.h            | 18 ++++++++++++------
 5 files changed, 38 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index b9acdd8af6..d7a4105a57 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -616,7 +616,7 @@ static int cf_check ioapic_check(const struct domain *d, hvm_domain_context_t *h
          */
         if ( e->fields.reserve ||
              e->fields.reserved[0] || e->fields.reserved[1] ||
-             e->fields.reserved[2] || e->fields.reserved[3] )
+             e->fields.reserved[2] || e->fields.reserved2 )
             return -EINVAL;
     }
 
diff --git a/xen/arch/x86/include/asm/hvm/vioapic.h b/xen/arch/x86/include/asm/hvm/vioapic.h
index 68af6dce79..5d7da5a092 100644
--- a/xen/arch/x86/include/asm/hvm/vioapic.h
+++ b/xen/arch/x86/include/asm/hvm/vioapic.h
@@ -32,6 +32,19 @@
 #define VIOAPIC_EDGE_TRIG  0
 #define VIOAPIC_LEVEL_TRIG 1
 
+/*
+ * Extract the destination ID from a 64-bit IO-APIC RTE, including the
+ * extended bits (55:49) used when XEN_HVM_CPUID_EXT_DEST_ID is advertised.
+ */
+#define IO_APIC_REDIR_DEST_MASK         (0xffULL << 56)
+#define IO_APIC_REDIR_EXT_DEST_MASK     (0x7fULL << 49)
+
+#define VIOAPIC_RTE_DEST_ID_UPPER_BITS  8
+#define VIOAPIC_RTE_DEST(rte) \
+    (MASK_EXTR((rte), IO_APIC_REDIR_DEST_MASK) | \
+     (MASK_EXTR((rte), IO_APIC_REDIR_EXT_DEST_MASK) << \
+      VIOAPIC_RTE_DEST_ID_UPPER_BITS))
+
 #define VIOAPIC_DEFAULT_BASE_ADDRESS  0xfec00000U
 #define VIOAPIC_MEM_LENGTH            0x100
 
diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
index 00059d4a3a..8d87d0c10d 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -51,9 +51,17 @@
 #define MSI_ADDR_REDIRECTION_MASK   (1 << MSI_ADDR_REDIRECTION_SHIFT)
 
 #define MSI_ADDR_DEST_ID_SHIFT		12
-#define	 MSI_ADDR_DEST_ID_MASK		0x00ff000
+#define MSI_ADDR_DEST_ID_UPPER_BITS	8
+#define MSI_ADDR_DEST_ID_MASK		0x00ff000
 #define  MSI_ADDR_DEST_ID(dest)		(((dest) << MSI_ADDR_DEST_ID_SHIFT) & MSI_ADDR_DEST_ID_MASK)
 
+/*
+ * Per the Intel x2APIC specification, in physical destination mode bits 11:5
+ * of the MSI address carry APIC ID bits [14:8] (the "Extended Destination ID"),
+ * extending the addressable range from 8 to 15 bits.
+ */
+#define MSI_ADDR_EXT_DEST_ID_MASK	0x0000fe0
+
 /* MAX fixed pages reserved for mapping MSIX tables. */
 #define FIX_MSIX_MAX_PAGES              512
 
diff --git a/xen/include/public/arch-x86/hvm/save.h b/xen/include/public/arch-x86/hvm/save.h
index 9c4bfc7ebd..483097d940 100644
--- a/xen/include/public/arch-x86/hvm/save.h
+++ b/xen/include/public/arch-x86/hvm/save.h
@@ -359,7 +359,9 @@ union vioapic_redir_entry
         uint8_t trig_mode:1;
         uint8_t mask:1;
         uint8_t reserve:7;
-        uint8_t reserved[4];
+        uint8_t reserved[3];
+        uint8_t reserved2:1;
+        uint8_t ext_dest_id:7;
         uint8_t dest_id;
     } fields;
 };
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 8f6708c0a7..6d425e34ac 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -615,12 +615,14 @@ struct xen_domctl_bind_pt_irq {
         struct {
             uint8_t gvec;
             uint32_t gflags;
-#define XEN_DOMCTL_VMSI_X86_DEST_ID_MASK 0x0000ff
-#define XEN_DOMCTL_VMSI_X86_RH_MASK      0x000100
-#define XEN_DOMCTL_VMSI_X86_DM_MASK      0x000200
-#define XEN_DOMCTL_VMSI_X86_DELIV_MASK   0x007000
-#define XEN_DOMCTL_VMSI_X86_TRIG_MASK    0x008000
-#define XEN_DOMCTL_VMSI_X86_UNMASKED     0x010000
+#define XEN_DOMCTL_VMSI_X86_DEST_ID_MASK        0x0000ff
+#define XEN_DOMCTL_VMSI_X86_DEST_ID_BITS        8
+#define XEN_DOMCTL_VMSI_X86_RH_MASK             0x000100
+#define XEN_DOMCTL_VMSI_X86_DM_MASK             0x000200
+#define XEN_DOMCTL_VMSI_X86_DELIV_MASK          0x007000
+#define XEN_DOMCTL_VMSI_X86_TRIG_MASK           0x008000
+#define XEN_DOMCTL_VMSI_X86_UNMASKED            0x010000
+#define XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK    0xfe0000
 
             uint64_aligned_t gtable;
         } msi;
@@ -630,6 +632,10 @@ struct xen_domctl_bind_pt_irq {
     } u;
 };
 
+#define XEN_DOMCTL_VMSI_X86_FULL_DEST(gflags) \
+        (MASK_EXTR((gflags), XEN_DOMCTL_VMSI_X86_DEST_ID_MASK) | \
+        (MASK_EXTR((gflags), XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK) << \
+         XEN_DOMCTL_VMSI_X86_DEST_ID_BITS))
 
 /* Bind machine I/O address range -> HVM address range. */
 /* XEN_DOMCTL_memory_mapping */
-- 
2.51.0



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


