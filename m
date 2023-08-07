Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A567722CF
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 13:39:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578296.905724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSyaB-0000sU-DK; Mon, 07 Aug 2023 11:39:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578296.905724; Mon, 07 Aug 2023 11:39:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSyaB-0000q5-A9; Mon, 07 Aug 2023 11:39:31 +0000
Received: by outflank-mailman (input) for mailman id 578296;
 Mon, 07 Aug 2023 11:39:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LmzZ=DY=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1qSyPu-00024C-KR
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 11:28:54 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94f2039a-3515-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 13:28:52 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id BA0DC3200948;
 Mon,  7 Aug 2023 07:28:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 07 Aug 2023 07:28:49 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Aug 2023 07:28:44 -0400 (EDT)
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
X-Inumbo-ID: 94f2039a-3515-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1691407728; x=1691494128; bh=V1p5A9ACqsnl2tgeoDxtsmzUi6y8s5WkawP
	sN/O3EGU=; b=pRpj3enyACb/haiSdwNnxdJ+CfbcUP2+lhuc2IGeMNLynwF0DPc
	SGtCvuZpUEST2aW4JF6Q+/aP+ol6dwSdKcV3OddWPfBKvWsgYl16oY4zxLEUwUec
	Pcs654y3N21UOJzNnTUUHEy2oRC6MTO6m7JpK/OOeH0vk5lbLC2o+roSVq7VmnUK
	jtTxJD309QKNk1CvJzKfe7ksl1oK5mixaLbFMCkL6Ulq+tGpq47ncz+YehE+qzR+
	YOQtqNafgFKKc8PHoZ4kKKNQVCa0UF+x7hL7EqvXdbs9id/hyLiy6jKX+jrfJLuK
	PQEJ3EGVS75PF/p5saqjFbhSfJr14JIFXIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1691407728; x=1691494128; bh=V1p5A9ACqsnl2
	tgeoDxtsmzUi6y8s5WkawPsN/O3EGU=; b=naXg0GIwmibCTbs1OcPrEs16htIJc
	kY0qVYxANqvGVM3+Mi9AbdDJDu1ojzOEo8d+rBtfxHxoerJxhdWYSrnzNrTTVk36
	FDjUi3lWaSfGceEQqwZ8axIEzXZw5pca/w3LsabJjYa9EA6mR4tafPgRk9Y8JXGX
	pkm9hPKohSezAseRAMCFiKFiC6jFod9dorqd78GAZs5mnsiLuaBVNBKZe7fpTUFB
	zNiahTPagtgSKOM2AicojV8oHwgmBq+ZJglhsx/pbCQvQskSdP0ECJ0Ofm2RJP6W
	HwSAC4IJKMi4Ypvs0226t7PS2w8U6xHi1lUbcPspwyDrbvcWy37/FGCsg==
X-ME-Sender: <xms:b9XQZKU7SbnVYnzoOjKjzl7Zjjky0CyBcSSWhTuFjvNZEIfhGaU34Q>
    <xme:b9XQZGm_1glR0eU73UwUk774mDXs-lVIJS9CRjmMtJgVl7HSKkDuylScpIBOzJ8xc
    mK6DOpaYrpDDeA>
X-ME-Received: <xmr:b9XQZOYtlJpWvke40tQRen0_QFRWSBukD0odwDBYGOb2rBfPqaPnI2zL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrledtgdeflecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuihhmohhnucfi
    rghishgvrhcuoehsihhmohhnsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    eqnecuggftrfgrthhtvghrnhepueevheegtdefgeefuddvfeduueduffffffejveeugeef
    udefiedugedugeevudfgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsihhmohhnsehinhhv
    ihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:b9XQZBWbP_s0r4tASYPqECq9Y0MLh5J2fJ0vVkLeib1adot-NmErRw>
    <xmx:b9XQZEmqCYkcUtcJLrSTv-unCPsLsAbT_tHKmscHHzepqtk1rTzoxw>
    <xmx:b9XQZGezTdJPOEL1oGn2mqNBtrDhkScHLn1ZCPDcId9eFG-1EQFpnQ>
    <xmx:cNXQZFAY-i3_vWVEVgEZyEQbG66JqCicS5X5SHqFP6bRmlxHJxk9Yw>
Feedback-ID: idc5945a3:Fastmail
From: Simon Gaiser <simon@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Simon Gaiser <simon@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [XEN PATCH v3] x86/hpet: Disable legacy replacement mode after IRQ test
Date: Mon,  7 Aug 2023 13:28:22 +0200
Message-Id: <a112f0fbbb333fc29a35d0a81853d59409a33fde.1690798460.git.simon@invisiblethingslab.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As far as I understand the HPET legacy mode is not required after the
timer IRQ test. For previous discussion see [1] and [2]. Keeping it
enabled prevents reaching deeper C-states on some systems and thereby
also S0ix residency. So disable it after the timer IRQ test worked. Note
that this code path is only reached when opt_hpet_legacy_replacement < 0,
so explicit user choice is still honored.

Link: https://lore.kernel.org/xen-devel/cb408368-077d-edb5-b4ad-f80086db48c1@invisiblethingslab.com/ # [1]
Link: https://lore.kernel.org/xen-devel/20230718122603.2002-1-simon@invisiblethingslab.com/ # [2]
Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
---

Changes in v3:

 - Edit log message and downgrade it to XENLOG_DEBUG.

Changes in v2:

 - Always disable legacy mode after test, not only when ARAT is
   available. See [3] for reasoning.

[3]: https://lore.kernel.org/xen-devel/ac77ecba-6804-1d16-60dc-f184e5d31dcb@invisiblethingslab.com/

---
 xen/arch/x86/io_apic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 041233b9b7..b4b4cd5939 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1967,6 +1967,8 @@ static void __init check_timer(void)
 
             if ( timer_irq_works() )
             {
+                printk(XENLOG_DEBUG "IRQ test with HPET Legacy Replacement Mode worked - disabling it again\n");
+                hpet_disable_legacy_replacement_mode();
                 local_irq_restore(flags);
                 return;
             }
-- 
2.40.1


