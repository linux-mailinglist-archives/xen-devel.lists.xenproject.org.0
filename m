Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2979E40F6
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2024 18:14:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848672.1263506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIsx0-0003ao-4x; Wed, 04 Dec 2024 17:14:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848672.1263506; Wed, 04 Dec 2024 17:14:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIsx0-0003Xf-1t; Wed, 04 Dec 2024 17:14:10 +0000
Received: by outflank-mailman (input) for mailman id 848672;
 Wed, 04 Dec 2024 17:14:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ec8E=S5=bounce.vates.tech=bounce-md_30504962.67508ddc.v1-f99d86d7f05b44549852944f2c0e5649@srs-se1.protection.inumbo.net>)
 id 1tIswx-0003XZ-QZ
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2024 17:14:07 +0000
Received: from mail180-27.suw31.mandrillapp.com
 (mail180-27.suw31.mandrillapp.com [198.2.180.27])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a359ec9-b263-11ef-a0d4-8be0dac302b0;
 Wed, 04 Dec 2024 18:14:06 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-27.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4Y3PJD3NKXz6CQQJV
 for <xen-devel@lists.xenproject.org>; Wed,  4 Dec 2024 17:14:04 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f99d86d7f05b44549852944f2c0e5649; Wed, 04 Dec 2024 17:14:04 +0000
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
X-Inumbo-ID: 2a359ec9-b263-11ef-a0d4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1733332444; x=1733592944;
	bh=ha+PFFcK2rZoX5f3m0+6W/HqdkROKWb4ZcN5LYyjSAE=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=R99wySBm+4RO0EOvjoCRfxVj2jcHQOQs/aYkNBsDLWT8lsfnybnepq8uzZgnZ0tU9
	 UwzlNeH4zcVYXYHo+Tj5r5ZRuh/h9Kbk92PbG7pyK5vfIhl2XLaY/Z0kIpfNURrXNL
	 8+z022bReZHqeEF1q7YN1qtD5nLbVubsA2zdDbRQUnX2UP+1PNrB7Y70FKPGuiQNmf
	 p8FFxVv2J8FX0D00oqSFe952IrBdayt5HvpgFq+jx1cpH8SrFHQHwJHz1dF9wFbaBP
	 /UoAh4hfQ95CM30O05t8Qno6c7Msjm/JWULG/SKlZPHn92dYWMKNXXTG67EDUHivnY
	 PFtq0HMxhy1nA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1733332444; x=1733592944; i=thierry.escande@vates.tech;
	bh=ha+PFFcK2rZoX5f3m0+6W/HqdkROKWb4ZcN5LYyjSAE=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=zMV4Pef6dRp3DaRKEVvp1RLzzsIu+mefmcRZTMwIMjOWSgCo102KjytMSX2QBjhuM
	 84L8xmcEGVfNzlykQWiT4HHtIiqX4xQ5CYIPM8YJlyeqgJZeiYQ7N3x6rR0SSVZnG8
	 CceijJ/QQY8pcXocdFbifu4nWyu5IyJwA9FJEwfRoosvtGdJ7jri0yCjY53BhOii/z
	 spYMg64rMKFkiLwYoMI/a+8Shb/0OxpH5StwJEMcrl7sLN5QNT9XRLjyqOupdF/eRo
	 G6Ic6qbQovuiA2H3YL22fmZT7qzcGbVGjcfbut2V3Niv/a8ZoxcHUEp4Pp/zottoFT
	 dv8BwwmhjHzVw==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[PATCH]=20x86/xen/mmu:=20Increase=20MAX=5FCONTIG=5FORDER?=
X-Mailer: git-send-email 2.45.2
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1733332443466
To: "Juergen Gross" <jgross@suse.com>, linux-kernel@vger.kernel.org
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com, jbeulich@suse.com, xen-devel@lists.xenproject.org
Message-Id: <20241204171346.458105-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f99d86d7f05b44549852944f2c0e5649?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241204:md
Date: Wed, 04 Dec 2024 17:14:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

With change 9f40ec84a797 (xen/swiotlb: add alignment check for dma
buffers), the driver mpt3sas fails to load because it cannot allocate
its DMA pool for an allocation size of ~2,3 MBytes. This is because the
alignement check added by 9f40ec84a797 fails and
xen_swiotlb_alloc_coherent() ends up calling
xen_create_contiguous_region() with a size order of 10 which is too high
for the current max value.

This patch increases the MAX_CONTIG_ORDER from 9 to 10 (4MB) to allow
such allocations.

Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
---
 arch/x86/xen/mmu_pv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index 55a4996d0c04..7f110740e1a2 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -2200,7 +2200,7 @@ void __init xen_init_mmu_ops(void)
 }
 
 /* Protected by xen_reservation_lock. */
-#define MAX_CONTIG_ORDER 9 /* 2MB */
+#define MAX_CONTIG_ORDER 10 /* 4MB */
 static unsigned long discontig_frames[1<<MAX_CONTIG_ORDER];
 
 #define VOID_PTE (mfn_pte(0, __pgprot(0)))
-- 
2.45.2

