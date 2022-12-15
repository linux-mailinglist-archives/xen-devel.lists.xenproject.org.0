Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA90664E4F1
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 01:05:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464019.722356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5yDt-00008V-FM; Fri, 16 Dec 2022 00:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464019.722356; Fri, 16 Dec 2022 00:05:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5yDt-00006Z-C7; Fri, 16 Dec 2022 00:05:09 +0000
Received: by outflank-mailman (input) for mailman id 464019;
 Fri, 16 Dec 2022 00:05:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t+b5=4N=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5y7R-0001Aq-1D
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 23:58:29 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d0de2db-7cd4-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 00:58:26 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 34B95320091F;
 Thu, 15 Dec 2022 18:58:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 15 Dec 2022 18:58:25 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Dec 2022 18:58:22 -0500 (EST)
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
X-Inumbo-ID: 5d0de2db-7cd4-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1671148703; x=1671235103; bh=sjEPz+zqPi
	TMR4O1DaVsBA1MdMjnSvNe33UG8SauJJ0=; b=vEwXb9u9/1kiHDbCN3tAu37Jvc
	op0CUFjS/SF1MbmT+PmTicbvkfutbrG9NfPbALYDymkD4Fel8PwN9yxxq4Z6a8bG
	AZ9h+1KP0PO8nzfJlTH+LOmsqP4msLxRRyZNRXgTb/VV2K2ZE5FhydeVhJiVO+6O
	yR6ds2O18EwEJmUm5QA6cfwhzPUdF6PrS/AA7BZdV5d5X2wc78C1nqYTnAPFPuMZ
	WVrUWXVQQ5GBQ+wkeb3jIk8oe49RnkC6DhcR34kiionfXrU16KdFW0bGTSpiuGlA
	eARGrB7pRYQTgeisNlgh9+And+NYa60TjEL/Ohg7hUX/T5sVsrx0H1zADhEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1671148703; x=
	1671235103; bh=sjEPz+zqPiTMR4O1DaVsBA1MdMjnSvNe33UG8SauJJ0=; b=X
	PDFD+JiT3CYP9oHa53ryy+BdTQsUuhw85J3z5HYfv6cUekF1rV66t2XOubEf80Ci
	mWOMFsfjIlbq9LoACCgAvUKCx4yFtFM9pC2F1Gt8byU1+TGOsqPHj+Kj8q/PGkgM
	eBYWz2vO01FA3XGsnFePKa4Z1or3PHREWFxSgMqXrbx0qJuNvUyzhItGY4R5gr2T
	pVF4uGsYx2IxwuzU9iD6FnMxUoCGkkhO3gipaIRZ3IPIqcEF8qMWfxuVspZFJNjt
	OB4/pRIzjDQ3oLYs7lbJE33J/k9VcqKqx68QZyR/STHiF2a1g3HqbkZvOxVNmmpN
	8gNZDle7dsGtdUGXq8/JA==
X-ME-Sender: <xms:n7SbY0FwExr8-8wdOODt-1aq7-AQpzXioJbuNr_WXqC7-264Wdi8DQ>
    <xme:n7SbY9VNA7OoCTbuRujlDSw9KEBErab2Nzt5ZzbpH0StXuJ-b8Iu3NehViA52vLrr
    lWhAcGKcF8pA6c>
X-ME-Received: <xmr:n7SbY-LZEZ7esDobiaZy2mbYnW1jUAx756EoxoWLLrD0i1yxMUB8d6JVdr5jRg2i73v4fIv59TSP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeigddugecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepledukeelleejkeevkeefgefhffeg
    vdeigeelieegjefffeeiveeivdejgeevteeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:n7SbY2E9lnRGnwqfX_w_UasSM1gSMOov3LUZg-6fyiZp_oVE-dYi3g>
    <xmx:n7SbY6UMzY44_ogASBrFcO-z-P7M-P_p2h14oyfJQWRNVfzXI4VKpA>
    <xmx:n7SbY5M8rUUGViQ89T56xD7OcjUQmW873r8ujq28GL9Nmgb6vaiI-w>
    <xmx:n7SbY-r-UvhPB96lRJr7a6U_mJ4ROvhsaOCYd9gI8cFwnLWQ7pizvA>
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
Subject: [PATCH v4 09/10] x86/mm: Reject invalid cacheability in PV guests by default
Date: Thu, 15 Dec 2022 18:57:51 -0500
Message-Id: <85f7a6a64f1577b27415e3bc569f1159b3b44cb3.1671139149.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671139149.git.demi@invisiblethingslab.com>
References: <cover.1671139149.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Setting cacheability flags that are not ones specified by Xen is a bug
in the guest.  By default, inject #GP into any guest that does this.
allow_invalid_cacheability can be used on the Xen command line to
disable this check.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
Changes since v3:
- Add Andrew Cooper’s Suggested-by

 xen/arch/x86/mm.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 1bba833aecf636079bb60c45e34cdce3d4ddbba5..80b767dfe3d1797198a08f216eb525503fe31771 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -145,6 +145,8 @@
 
 #ifdef CONFIG_PV
 #include "pv/mm.h"
+bool allow_invalid_cacheability;
+boolean_param("allow_invalid_cacheability", allow_invalid_cacheability);
 #endif
 
 /* Override macros from asm/page.h to make them work with mfn_t */
@@ -1348,7 +1350,28 @@ static int promote_l1_table(struct page_info *page)
         }
         else
         {
-            switch ( ret = get_page_from_l1e(pl1e[i], d, d) )
+            l1_pgentry_t l1e = pl1e[i];
+
+            BUILD_BUG_ON(PAGE_CACHE_ATTRS > 0xffff);
+            if ( !allow_invalid_cacheability )
+            {
+                switch ( l1e.l1 & PAGE_CACHE_ATTRS )
+                {
+                case _PAGE_WB:
+                case _PAGE_UC:
+                case _PAGE_UCM:
+                case _PAGE_WC:
+                case _PAGE_WT:
+                case _PAGE_WP:
+                    break;
+                default:
+                    pv_inject_hw_exception(TRAP_gp_fault, 0);
+                    ret = -EINVAL;
+                    goto fail;
+                }
+            }
+
+            switch ( ret = get_page_from_l1e(l1e, d, d) )
             {
             default:
                 goto fail;
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

