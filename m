Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6210FB0DDE5
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 16:20:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052736.1421494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueDrH-0003YF-Cs; Tue, 22 Jul 2025 14:20:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052736.1421494; Tue, 22 Jul 2025 14:20:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueDrH-0003Wo-A1; Tue, 22 Jul 2025 14:20:43 +0000
Received: by outflank-mailman (input) for mailman id 1052736;
 Tue, 22 Jul 2025 14:20:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=woe3=2D=bounce.vates.tech=bounce-md_30504962.687f9e36.v1-b0cf1700dfea4608afdd89a472ee1c36@srs-se1.protection.inumbo.net>)
 id 1ueDrF-0003VV-NC
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 14:20:41 +0000
Received: from mail13.wdc04.mandrillapp.com (mail13.wdc04.mandrillapp.com
 [205.201.139.13]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ac0c442-6707-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 16:20:39 +0200 (CEST)
Received: from pmta16.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail13.wdc04.mandrillapp.com (Mailchimp) with ESMTP id 4bmfYy2jMJzNCdKxR
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 14:20:38 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b0cf1700dfea4608afdd89a472ee1c36; Tue, 22 Jul 2025 14:20:38 +0000
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
X-Inumbo-ID: 0ac0c442-6707-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1753194038; x=1753464038;
	bh=bG3MYiiu5bmuSUKoM/GL1UomjZlx2CXeETFIctQZnoQ=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=I9gH7ghlxZSkQJhminRoYucVUfBcaD7hBBoZgrm3nMBQpjACx+OQT3YeTDK7Dnn49
	 nFZav3MS3xmgv4BzJFCFRQe651l5H12uVlYnj+1k5wMIxKBi5tscGXMjUgsI6RGOLb
	 9tz2RieeQju+Qe2nGzeXWhpF47BlYzs5WUwmviWUqAJWAQvj8YRcTKW0JBdcGig+Hb
	 dzW0A4Aw3H1gUSabWe0eryyh0knpgla/iNTVcRjTEEUkYosUoFaLTxuR/n5kcmHSSS
	 96dy/ipvcpj6oC50/Jx+peFfdbq2/L3ez6GpEmQrbgJ/U13hugijBs0xXNxHnoTQhS
	 sI4F3rCjtZ+pA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1753194038; x=1753454538; i=teddy.astie@vates.tech;
	bh=bG3MYiiu5bmuSUKoM/GL1UomjZlx2CXeETFIctQZnoQ=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=X5RaawYa1zelzQ+t1FGKfkIdKUtbOVGezruC3Jki+OsbS6j/IiCIfWWN98VszjE0x
	 /cwxSP+EjS1JPzIgAx+cUuMlkhAeNv/tUck3rs+D/uAskIBH6rqyN+Y7A7/NqyHxKd
	 lfZI6iz6KBu/fw6zkUDXwpQIRxGCmdzzHS1NuWSY/kp4j5Zi1x6BSo/hPEsAW+n1HX
	 ML/5BtYi0z4t6g6509KvKlOG1Q+4wcf1sxPjX6OjAXE+dbc87sG8/ZsrhaLOq2/fFY
	 udJDCzIcmu9GuNUazMzupI/3D7o3O1m8YylENYzPDXqPCMnDZIUOV7CRD+v4ZA8dEl
	 MgcTr+0KjzVEg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH]=20x86/svm:=20Always=20flush=20TLB=20using=20TLB=5FCTRL=5FFLUSH=5FALL?=
X-Mailer: git-send-email 2.50.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1753194037174
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <ead69886558e6c18662a4755f4a11382e66fa810.1753193439.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b0cf1700dfea4608afdd89a472ee1c36?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250722:md
Date: Tue, 22 Jul 2025 14:20:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Xen currently uses an ASID scheme where:
- ASIDs are cycled where a "TLB flush" is performed
- When ASIDs wrap around, perform a full TLB flush
- In exceptional cases, stop using ASIDs

However, the TLB control mode used only flushes the current active ASID of
the logical processor. Which mean that will supply "stale" ASIDs (not flushed),
because it hasn't been actually flushed (TLB_CTRL_FLUSH_ASID only performs a
TLB flush of the ASID set in VMCB).

This affects CPUs where flush-by-asid is available (Fam15h (2011) and later).

To fix this, always flush all ASIDs even when flush-by-asid is available.

Fixes: 64b1da5a2fcf ("x86/svm: Use flush-by-asid when available")
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
This patch has been sent first at the security mailing list (security@xenproject.org)
which asked me to publish it publicly due to it being actually safe in practice.

 xen/arch/x86/hvm/svm/asid.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/asid.c b/xen/arch/x86/hvm/svm/asid.c
index 7977a8e86b..b2ca639539 100644
--- a/xen/arch/x86/hvm/svm/asid.c
+++ b/xen/arch/x86/hvm/svm/asid.c
@@ -46,9 +46,8 @@ void svm_asid_handle_vmrun(void)
     if ( vmcb_get_asid(vmcb) != p_asid->asid )
         vmcb_set_asid(vmcb, p_asid->asid);
 
-    vmcb->tlb_control =
-        !need_flush ? TLB_CTRL_NO_FLUSH :
-        cpu_has_svm_flushbyasid ? TLB_CTRL_FLUSH_ASID : TLB_CTRL_FLUSH_ALL;
+    /* We can't rely on TLB_CTRL_FLUSH_ASID as all ASIDs are stale here. */
+    vmcb->tlb_control = need_flush ? TLB_CTRL_FLUSH_ALL : TLB_CTRL_NO_FLUSH;
 }
 
 /*
-- 
2.50.1



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


