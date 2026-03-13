Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDj8Nc48tGk/jgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:35:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D21282871C7
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:35:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253912.1549904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15Tj-0007PC-CX; Fri, 13 Mar 2026 16:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253912.1549904; Fri, 13 Mar 2026 16:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15Tj-0007Jm-9K; Fri, 13 Mar 2026 16:35:11 +0000
Received: by outflank-mailman (input) for mailman id 1253912;
 Fri, 13 Mar 2026 16:35:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HapF=BN=bounce.vates.tech=bounce-md_30504962.69b43cb9.v1-f3d1f1e41b594d69b286bae8494a8c00@srs-se1.protection.inumbo.net>)
 id 1w15Tg-0006Ps-UM
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:35:08 +0000
Received: from mail179-36.suw41.mandrillapp.com
 (mail179-36.suw41.mandrillapp.com [198.2.179.36])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98bb3473-1efa-11f1-b164-2bf370ae4941;
 Fri, 13 Mar 2026 17:35:07 +0100 (CET)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-36.suw41.mandrillapp.com (Mailchimp) with ESMTP id 4fXVT52GHlzlfhqS
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 16:35:05 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f3d1f1e41b594d69b286bae8494a8c00; Fri, 13 Mar 2026 16:35:05 +0000
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
X-Inumbo-ID: 98bb3473-1efa-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773419705; x=1773689705;
	bh=z20eYvkhwyKw++a+c98wvdYw/gsjZHxgfR6V0/vLjGg=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=c2lhrOE3EcoU+EqduNWxBC4UypXSqQYjFiRydu7L4GjSJUyhHHxgFzNJ6l4az03c/
	 OYBjJMh8l3Nh8sDPLqZPhbRdJ5yJUr+YaUx9j7SDFlC0XKFtlFJCWFJq1nOuPBwEtr
	 V5eC1kjAvHVZufGS9CfvWEpIc/80X2R0kbQtYHM9FmqzXKav43vEKjA08hlzhys9hA
	 d64PDAuTvQAOd0sYFDwK9B4lt8VBWWRBYJgfJ6Jz7Qo+Jb8w3ethpTiIBFb40hApLd
	 MCBrSrXGZYpZgYa/hGUYaVjQvy72phdyE+K2QGlOR18gI9kwXhfP9Xl+SVJwVdxdca
	 E1mFLVoUKEruQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773419705; x=1773680205; i=thierry.escande@vates.tech;
	bh=z20eYvkhwyKw++a+c98wvdYw/gsjZHxgfR6V0/vLjGg=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=WeBWCsYS+nyPsnO9wjCuwyRnDA6FRr+o2IeHHhTkO42qeoVJOHN0IhNIViAOHnb5g
	 +f2eyy77/jJIj9Gg1dwJf8/iiyW2TVR5vedTpLqSyyGItdbc6oi7ai/ymtqx7+lzEP
	 Oy/bFqfy770baXYkhgXCvnwLmg4NCeH/eUHTLJuB3+qS5mMOzzUgjrFxcNnCftLrg+
	 JxU4vQFSLtqsuAoTkUBI0eJmmnGzJbxJCSjaB7M1EI9eP6Xrm4RDYlHyHKrEC3dwgM
	 pGtucqvZRfTKWv7Tu2JPryvGI9nrsD9bMSUDsC7u/I/Ae61lTNBqVO0jrkn8djijjP
	 s63ZCyLJZEr3Q==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[PATCH=2016/17]=20Handle=20PCIe=20ECAM=20space=20access=20from=20guests?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773419704539
To: xen-devel@lists.xenproject.org
Cc: "Thierry Escande" <thierry.escande@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <20260313163455.790692-17-thierry.escande@vates.tech>
In-Reply-To: <20260313163455.790692-1-thierry.escande@vates.tech>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f3d1f1e41b594d69b286bae8494a8c00?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260313:md
Date: Fri, 13 Mar 2026 16:35:05 +0000
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:thierry.escande@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,vates.tech:dkim,vates.tech:mid,vates.tech:email,vates.tech:url];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[0.441];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D21282871C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch adds the logic to decode MMIO-based PCIe ECAM accesses. If
the IOREQ_TYPE_COPY request is within the ECAM address space configured
by hvmloader, the ioreq type is set to XEN_DMOP_IO_RANGE_PCI and the
sbdf decoded from the accessed address.

Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
---
 xen/arch/x86/hvm/ioreq.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index a5fa97e149..022fe05222 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -268,6 +268,8 @@ bool arch_ioreq_server_get_type_addr(const struct domain *d,
                                      uint64_t *addr)
 {
     unsigned int cf8 = d->arch.hvm.pci_cf8;
+    unsigned long mmio_start = (p->type == IOREQ_TYPE_COPY) ?
+                                ioreq_mmio_first_byte(p) : 0;
 
     if ( p->type != IOREQ_TYPE_COPY && p->type != IOREQ_TYPE_PIO )
         return false;
@@ -298,6 +300,19 @@ bool arch_ioreq_server_get_type_addr(const struct domain *d,
                 *addr |= CF8_ADDR_HI(cf8);
         }
     }
+    else if ( p->type == IOREQ_TYPE_COPY &&
+              (mmio_start >= d->arch.ecam_addr &&
+               mmio_start < (d->arch.ecam_addr + d->arch.ecam_size)) )
+    {
+        pci_sbdf_t sbdf;
+        unsigned int reg = mmio_start & ~PAGE_MASK;
+
+        sbdf.bdf =  (((mmio_start - d->arch.ecam_addr) & 0x0ffff000) >> 12);
+        sbdf.seg = 0;
+
+        *type = XEN_DMOP_IO_RANGE_PCI;
+        *addr = ((uint64_t)sbdf.sbdf << 32) | reg;
+    }
     else
     {
         *type = (p->type == IOREQ_TYPE_PIO) ?
-- 
2.51.0



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


