Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8F372C857
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 16:26:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547177.854457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8iUo-0001hm-3a; Mon, 12 Jun 2023 14:26:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547177.854457; Mon, 12 Jun 2023 14:26:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8iUn-0001Zd-St; Mon, 12 Jun 2023 14:26:13 +0000
Received: by outflank-mailman (input) for mailman id 547177;
 Mon, 12 Jun 2023 14:26:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AcHT=CA=bombadil.srs.infradead.org=BATV+33f57c12507318cbaa86+7232+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1q8iUm-0001S1-99
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 14:26:12 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ff87eb8-092d-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 16:26:05 +0200 (CEST)
Received: from
 2a02-8389-2341-5b80-8c8c-28f8-1274-e038.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:8c8c:28f8:1274:e038] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q8iUQ-004I8Z-1u; Mon, 12 Jun 2023 14:25:50 +0000
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
X-Inumbo-ID: 0ff87eb8-092d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=xk7UcK2JitL8EW9ZuelDDstRDKvC7QWgJZaUJF9iY8U=; b=gi/Nxa/zQEPmiix7WWxiDcuGaQ
	UXWNUHjwEt1uV9G92Cki/tGyE4Fxl9h7Uw5/VW0QgnJaASa9uwWV+jTL1gGuqDpKpZSeQCnal1E5J
	qEv0DtE4DOdI2krZd7P/X4lJwG0qNpuqNQ/o25wL+x7eif+U1SXUWZb60We+k49zNk8r/rmi/Tl4E
	SoZuJ+wCJxNYD4SRNiAsgCiNftC3faUgZS/u0LJDBvs8x175TAWPm0lP2tjb4Cswk2u4xkFViVI4h
	PPfk9D+URfM35VS9Ur/NWziYDFfRS0b4rQtJX0lZUcaXERtO1ykJfsTkvpjcFifFd0gsamVHI2h6y
	NlYvrHJA==;
From: Christoph Hellwig <hch@lst.de>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: xen-devel@lists.xenproject.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] xen/pci: add flag for PCI passthrough being possible
Date: Mon, 12 Jun 2023 16:25:40 +0200
Message-Id: <20230612142542.111581-2-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612142542.111581-1-hch@lst.de>
References: <20230612142542.111581-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

From: Juergen Gross <jgross@suse.com>

When running as a Xen PV guests passed through PCI devices only have a
chance to work if the Xen supplied memory map has some PCI space
reserved.

Add a flag xen_pv_pci_possible which will be set in early boot in case
the memory map has at least one area with the type E820_TYPE_RESERVED.

Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/x86/xen/setup.c | 6 ++++++
 include/xen/xen.h    | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/x86/xen/setup.c b/arch/x86/xen/setup.c
index c2be3efb2ba0fa..716f76c4141651 100644
--- a/arch/x86/xen/setup.c
+++ b/arch/x86/xen/setup.c
@@ -43,6 +43,9 @@ struct xen_memory_region xen_extra_mem[XEN_EXTRA_MEM_MAX_REGIONS] __initdata;
 /* Number of pages released from the initial allocation. */
 unsigned long xen_released_pages;
 
+/* Memory map would allow PCI passthrough. */
+bool xen_pv_pci_possible;
+
 /* E820 map used during setting up memory. */
 static struct e820_table xen_e820_table __initdata;
 
@@ -804,6 +807,9 @@ char * __init xen_memory_setup(void)
 		chunk_size = size;
 		type = xen_e820_table.entries[i].type;
 
+		if (type == E820_TYPE_RESERVED)
+			xen_pv_pci_possible = true;
+
 		if (type == E820_TYPE_RAM) {
 			if (addr < mem_end) {
 				chunk_size = min(size, mem_end - addr);
diff --git a/include/xen/xen.h b/include/xen/xen.h
index 0efeb652f9b8fb..5eb0a974a11e7e 100644
--- a/include/xen/xen.h
+++ b/include/xen/xen.h
@@ -29,6 +29,12 @@ extern bool xen_pvh;
 
 extern uint32_t xen_start_flags;
 
+#ifdef CONFIG_XEN_PV
+extern bool xen_pv_pci_possible;
+#else
+#define xen_pv_pci_possible	0
+#endif
+
 #include <xen/interface/hvm/start_info.h>
 extern struct hvm_start_info pvh_start_info;
 
-- 
2.39.2


