Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B87B264E4E0
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 00:58:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463947.722296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5y7H-0002QV-6b; Thu, 15 Dec 2022 23:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463947.722296; Thu, 15 Dec 2022 23:58:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5y7H-0002LP-0d; Thu, 15 Dec 2022 23:58:19 +0000
Received: by outflank-mailman (input) for mailman id 463947;
 Thu, 15 Dec 2022 23:58:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t+b5=4N=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5y7G-0001Aq-4J
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 23:58:18 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57981c3b-7cd4-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 00:58:17 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 0ECFC320091F;
 Thu, 15 Dec 2022 18:58:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 15 Dec 2022 18:58:15 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Dec 2022 18:58:13 -0500 (EST)
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
X-Inumbo-ID: 57981c3b-7cd4-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1671148694; x=1671235094; bh=uxmdOs+lCg3lNRcLgLV7XD5izHM7UdEv5Kn
	bujPlCxE=; b=E2ZKNjSY9+k6+Fc4D8cTiFT356yz6g51hgAwpd9TJIdSt+3L6N0
	KBlJPkKChEWhEFXWb0G+nkXeK1LF4SVs73RxzVGyRGmUHPZq1EX2Ggp7X5gUCm2q
	9r5Nx0aKZF+JGH3SVIlsBISZZBwr1FX6vPfyAYIhQnX2iTUPMbfVskUUwY7NfiAS
	ur22TFN5eevqtc0yowyp7SBdu/dXmbc8fYh6VCWmgga8GMrUQf3UTf+hE+yN/9Zy
	DJtMS1Ie2jyGVPcls5ygk1N4uEIsteFGuinen4cvGl8nz9fU+suFAM7lVagfRtMS
	voax01AFpRpWf61MiOb6+M+/omjPHsHPLuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1671148694; x=1671235094; bh=uxmdOs+lCg3lN
	RcLgLV7XD5izHM7UdEv5KnbujPlCxE=; b=drJkkzrRc7VW+8CplLloTORiOmyVS
	1iouo/pW4Ud6IrNq+lENcyfci8Ml6vGhMOvmR6y8np9nBArV9PP0g4k21XPmzOrp
	fAUdaSBMYz66/4xry0c0ey9ge/e84c9c71kp4jfuCTFhT4sF8QfZcC4420vLzcsN
	HAI7B/hqkaIMUb+oVh5iVam1V2c2Zz1T+Q/SCsIK+04yCuqKGCjV/FQj+svealQq
	Twy4YhDR98pE+grL5+ZPM1+R/P4npfGdd1FbfX8FnYPoyYPH6GtGY+MVyagpFl+6
	Sj6CsJCCb+IxNrcu++6T0K3SSlddhVRBP3IaBw0MwNDHD9CNeLjk7byYw==
X-ME-Sender: <xms:lrSbY8KnfxTn0ptrthgSDp5cjxHnnZoI_y42BxUzXX9ttNKFdGAm1A>
    <xme:lrSbY8LV4JUNdeE6s3gAl5_5w5CKRLX_8NJSppycTSKjLnepEknBNHrHD4E4GxgLC
    eAgkfA3ugQn8qI>
X-ME-Received: <xmr:lrSbY8un_xL74mW9zyDGiKtYUnHryIeaCBFQIhhcWM3FkQjjKuIrsz6WT8NUV4BklY8b6NP-i7_0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeigddugecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:lrSbY5Y_osUeKUSrYa0W_vGrwJu8XYaUDPqgMxxg7LHxFVfBo3W9ew>
    <xmx:lrSbYzabwdmdIo01tdF0kdbxyWC5J37TvbpLRh7fcWAzVv4-8t2Rtg>
    <xmx:lrSbY1A2kBN1H_YZ8po0SARC9WAtpArcYUSgHv_dZ-AcscMNM96ILg>
    <xmx:lrSbYxMZ5DG15UBvZm_rv78ZgjAongDj7yCCkHat2I9AjE7OXhEm_w>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Tim Deegan <tim@xen.org>
Subject: [PATCH v4 05/10] x86: Replace EPT_EMT_* constants with X86_MT_*
Date: Thu, 15 Dec 2022 18:57:47 -0500
Message-Id: <3d84416023dacbc87dae0d67ad930ee5b1b7e544.1671139149.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671139149.git.demi@invisiblethingslab.com>
References: <cover.1671139149.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows eliminating the former.  No functional change intended.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 9 ---------
 xen/arch/x86/mm/hap/nested_ept.c       | 4 ++--
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 8eedf59155e01ec1ca84dcc6b30961f9c884cb3b..49fe9822fac5eae15b67f0cfd3d0cb96347dc7ed 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -80,15 +80,6 @@ typedef enum {
 #define EPTE_RWX_MASK           0x7
 #define EPTE_FLAG_MASK          0x7f
 
-#define EPT_EMT_UC              0
-#define EPT_EMT_WC              1
-#define EPT_EMT_RSV0            2
-#define EPT_EMT_RSV1            3
-#define EPT_EMT_WT              4
-#define EPT_EMT_WP              5
-#define EPT_EMT_WB              6
-#define EPT_EMT_RSV2            7
-
 #define PI_xAPIC_NDST_MASK      0xFF00
 
 void vmx_asm_vmexit_handler(struct cpu_user_regs);
diff --git a/xen/arch/x86/mm/hap/nested_ept.c b/xen/arch/x86/mm/hap/nested_ept.c
index 1cb7fefc37091bf7d92a277203e652add5611871..23fb3889b7605be62805731218c314819d5027b5 100644
--- a/xen/arch/x86/mm/hap/nested_ept.c
+++ b/xen/arch/x86/mm/hap/nested_ept.c
@@ -84,8 +84,8 @@ static bool_t nept_emt_bits_check(ept_entry_t e, uint32_t level)
 {
     if ( e.sp || level == 1 )
     {
-        if ( e.emt == EPT_EMT_RSV0 || e.emt == EPT_EMT_RSV1 ||
-             e.emt == EPT_EMT_RSV2 )
+        if ( e.emt == X86_MT_RSVD_2 || e.emt == X86_MT_RSVD_3 ||
+             e.emt == X86_MT_UCM )
             return 1;
     }
     return 0;
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


