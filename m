Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AiyFF49tGlljgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:37:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 051032872BC
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:37:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1254064.1550084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15WB-0001QW-Iy; Fri, 13 Mar 2026 16:37:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1254064.1550084; Fri, 13 Mar 2026 16:37:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15WB-0001Nn-Bx; Fri, 13 Mar 2026 16:37:43 +0000
Received: by outflank-mailman (input) for mailman id 1254064;
 Fri, 13 Mar 2026 16:37:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=99UC=BN=bounce.vates.tech=bounce-md_30504962.69b43cb9.v1-0d58c467262f41fd83129dba59f499f8@srs-se1.protection.inumbo.net>)
 id 1w15Tq-0006Ek-OL
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:35:18 +0000
Received: from mail134-15.atl141.mandrillapp.com
 (mail134-15.atl141.mandrillapp.com [198.2.134.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a83c461-1efa-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 17:35:10 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-15.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4fXVT52z3lzPm0VQt
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 16:35:05 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 0d58c467262f41fd83129dba59f499f8; Fri, 13 Mar 2026 16:35:05 +0000
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
X-Inumbo-ID: 9a83c461-1efa-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773419705; x=1773689705;
	bh=7Tb9FoFWUrTG8bVI2BmSiKFAzIP/VrW/gdQM1MC0oms=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=tVTR8ZL+tGzsruvdEkBKwXPgUz58kYymfrscpoGZzQfkjym4/vkwPUmFlpPLnNSLM
	 DEgYLBS31r/pv1MzcJ+cmYvGeY2FiRxT+O3F2CkwCmPCWNB8nOSMd6DXbMBL4HIazj
	 grMJ4BxQ6kttNnlEb/zyNBI2CQfU4EBMG/mfo8CBHMb3uNYSMX8whGn/YjuqjJktqM
	 Bgq0K6D+GvFucvA4tj+mhmhjYkpr+HDqlw95UPFLdJYbIcgcysYX0nc+0txsTEw07a
	 u9/LVT6rytYUN248JbVKq7pCNOO047mRFdJfw2ESrpxi2xljvnnMVswnQPsiuTjzL4
	 PBqZNHLYYNIEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773419705; x=1773680205; i=thierry.escande@vates.tech;
	bh=7Tb9FoFWUrTG8bVI2BmSiKFAzIP/VrW/gdQM1MC0oms=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=n7hT4u57+/WziwtTPyLi72zdqfKdJdi+w4ywlBQDjtIBMzrlWuDnKpfDljbg3IpQl
	 OSJ7wMdvfGFt+zCxmgd7p5RXMFC/K1FVMxSoLhleX1h5vef/I8fZUsfigDVHjnIKw1
	 a50UV4tuBp4YU/eTScAnCikpsXCxE0ljkkBsS1kNFb/mUs8VuAab0ywgdyhdtO7xy8
	 PF6+rj1gdeCCfdJ5eh0LGvmAljng2+Zci7YjLYhfB0SNQ/qpp3kQtmFK8g5Pgwa208
	 HR1+ONeFHgjSmGZ3UaC77NOz33QwV/rFE+SSqdap+jbna1f3xsYh4sTxUWLWNOG6wH
	 yC08iq99W8UNw==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[PATCH=2015/17]=20hvmloader:=20Set=20MCFG=20in=20ACPI=20table?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773419704313
To: xen-devel@lists.xenproject.org
Cc: "Thierry Escande" <thierry.escande@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>
Message-Id: <20260313163455.790692-16-thierry.escande@vates.tech>
In-Reply-To: <20260313163455.790692-1-thierry.escande@vates.tech>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.0d58c467262f41fd83129dba59f499f8?=
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:thierry.escande@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:mid,vates.tech:email,vates.tech:url,mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[0.610];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 051032872BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch extends hvmloader_acpi_build_tables() to detect if MMCONFIG
is available by obtaining its base address and size from the hypercall
HVMOP_get_ecam_space and sets the flag ACPI_HAS_MCFG in the ACPI config
if needed.

This also sets the MMCONFIG area in E820 map using the same method.

Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
---
 tools/firmware/hvmloader/e820.c | 11 +++++++++++
 tools/firmware/hvmloader/util.c |  9 +++++++++
 2 files changed, 20 insertions(+)

diff --git a/tools/firmware/hvmloader/e820.c b/tools/firmware/hvmloader/e820.c
index 86d39544e8..ff5c270f57 100644
--- a/tools/firmware/hvmloader/e820.c
+++ b/tools/firmware/hvmloader/e820.c
@@ -158,6 +158,8 @@ int build_e820_table(struct e820entry *e820,
     unsigned long acpi_mem_end = acpi_enabled ?
         ACPI_MEMORY_DYNAMIC_START + (acpi_pages_allocated() << PAGE_SHIFT) :
         RESERVED_MEMBASE;
+    uint64_t mmconfig_addr;
+    uint32_t mmconfig_size;
 
     if ( !lowmem_reserved_base )
             lowmem_reserved_base = 0xA0000;
@@ -260,6 +262,15 @@ int build_e820_table(struct e820entry *e820,
         nr++;
     }
 
+    /* mark MMCONFIG area */
+    if ( ! hvm_get_ecam_space(&mmconfig_addr, &mmconfig_size) )
+    {
+        e820[nr].addr = mmconfig_addr;
+        e820[nr].size = mmconfig_size;
+        e820[nr].type = E820_RESERVED;
+        nr++;
+    }
+
     /* Low RAM goes here. Reserve space for special pages. */
     BUG_ON(low_mem_end < MB(2));
 
diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index ee7a09b5bc..2cd1cadfc3 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -903,6 +903,8 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
     struct acpi_ctxt ctxt;
     long long tpm_version;
     char *end;
+    uint64_t mmconfig_addr;
+    uint32_t mmconfig_size;
 
     /* Allocate and initialise the acpi info area. */
     mem_hole_populate_ram(ACPI_INFO_PHYSICAL_ADDRESS >> PAGE_SHIFT, 1);
@@ -953,6 +955,13 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
         config->pci_hi_len = pci_hi_mem_end - pci_hi_mem_start;
     }
 
+    if ( ! hvm_get_ecam_space(&mmconfig_addr, &mmconfig_size) )
+    {
+        config->table_flags |= ACPI_HAS_MCFG;
+        config->mmconfig_addr = mmconfig_addr;
+        config->mmconfig_size = mmconfig_size;
+    }
+
     s = xenstore_read("platform/generation-id", "0:0");
     if ( s )
     {
-- 
2.51.0



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


