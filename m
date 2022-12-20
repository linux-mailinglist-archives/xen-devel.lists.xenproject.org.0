Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF65A651783
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 02:10:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466413.725375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7R9b-0007XK-6w; Tue, 20 Dec 2022 01:10:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466413.725375; Tue, 20 Dec 2022 01:10:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7R9a-0007Q7-SD; Tue, 20 Dec 2022 01:10:46 +0000
Received: by outflank-mailman (input) for mailman id 466413;
 Tue, 20 Dec 2022 01:10:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tFeQ=4S=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p7R9Y-0004T7-Uh
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 01:10:45 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 200739c9-8003-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 02:10:44 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id B20993200921;
 Mon, 19 Dec 2022 20:10:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 19 Dec 2022 20:10:42 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Dec 2022 20:10:40 -0500 (EST)
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
X-Inumbo-ID: 200739c9-8003-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1671498641; x=1671585041; bh=dQmXzlQNbA
	lNxQz0KfETxLEGBuchpoA/a77dyYWm3FQ=; b=ZYFv88AfVgir6MuG9l5M96lTM+
	zuWtK2zrRpgJXrnNC/GnSacaInFMlrz5gBNmmfhgrx4vfNWm98tNNw+Naam2ftdb
	8Lche4uyozSj4pm8VxhjPHp/j0Qwze4qXw2j8gG+eaYsoZypwoi+HXniy/3qT7B0
	kkAatIPLWaX2nZ/uPsMIROYnN+IQZYa9QlyicHxAEyTmsumxgYL7Y+NKZnyndZv/
	PnvrNSIT12XbQnudfkzKy5SSRj6ARmhQ/hjTUEdgKuz70v9dmF4zfRQR/dIzwyUy
	lAFCDGURkeoQro7tovPwkqYiEtL2iYZMx27RlXzy1/cpiZCPaYd7hMwdj7jw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1671498641; x=
	1671585041; bh=dQmXzlQNbAlNxQz0KfETxLEGBuchpoA/a77dyYWm3FQ=; b=V
	WwUzKhnFhCUIXcR9n0Llq5y6fK7FX/YGEXJ2h7naas/DJstEqbfst8jdsOoBmrZX
	Sb+y4Ny6DT3Z4SRIP2NACv/6DDCj/a/Vww42gbS4CgwX4gm1HQPR0tDdzMdSup7X
	PTqEDSghlpg4MxWamlAfQwzi6DcxjcOF6VHuYL7TlQiCXsp7occDpTxDutyISKgV
	yr/KnNRgIRRMD2alzWhwlAblxSCuDE36Gq84gKk23n+L2u/LABmc46C8tPeoltwZ
	RVHg7CyQTP/0lAVonx/Ub6faYO1/M9G9QzC0GcnnQDumWFOxRC5AYywcAKrtqFL8
	RuwV6geJxgN4wwILU0LQA==
X-ME-Sender: <xms:kQuhY5s1kh_FfCtt8xgb26p0JfodM97RrzruFZLm0DFG3K63OSYIaQ>
    <xme:kQuhYycxROrHL7JhjsEOATINIXpov2L0lLyAPq2ZSytczPzJ8UPzgtY7UZy6r309o
    9VyL0jhEUgmaM4>
X-ME-Received: <xmr:kQuhY8xPhhxhRDR-UIA_0P3h70O8VcSjAaHSordQge1RRpYirzUg2C0SAwDNCh_JigHFnWE8q2-3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeeggdefudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepledukeelleejkeevkeefgefhffeg
    vdeigeelieegjefffeeiveeivdejgeevteeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:kQuhYwOu1I2M-f7Gq0URRqZsrTA993XaNWyXVuFG5bnuUUHX-NZXkA>
    <xmx:kQuhY5-N7LhvpfwKhuogQgU5pEsfE80JVis1YfoKtN4FeKkzRRFKqQ>
    <xmx:kQuhYwXDbzUW-4m3mrjSNnGn_HGeoZQLr4bF9dPPYRqpLIidvkmfzg>
    <xmx:kQuhY1TD2CqV8borpE1wMB1iMihBiB2A2WVUS34I0GdDHi871vRW9Q>
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
Subject: [PATCH v5 09/10] x86/mm: Reject invalid cacheability in PV guests by default
Date: Mon, 19 Dec 2022 20:07:11 -0500
Message-Id: <64d81a49e5e00527ae01b707080f6f0e14ee667c.1671497984.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671497984.git.demi@invisiblethingslab.com>
References: <cover.1671497984.git.demi@invisiblethingslab.com>
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
Changes since v4:
- Remove pointless BUILD_BUG_ON().
- Add comment explaining why an exception is being injected.

Changes since v3:
- Add Andrew Cooper’s Suggested-by
---
 xen/arch/x86/mm.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index a72556668633ee57b77c9a57d3a13dd5a12d9bbf..69ce597c7cd5283ae4b5f3bc0a6dfa0bb3228d3d 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -145,6 +145,8 @@
 
 #ifdef CONFIG_PV
 #include "pv/mm.h"
+bool allow_invalid_cacheability;
+boolean_param("allow_invalid_cacheability", allow_invalid_cacheability);
 #endif
 
 /* Override macros from asm/page.h to make them work with mfn_t */
@@ -1343,7 +1345,33 @@ static int promote_l1_table(struct page_info *page)
         }
         else
         {
-            switch ( ret = get_page_from_l1e(pl1e[i], d, d) )
+            l1_pgentry_t l1e = pl1e[i];
+
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
+                    /*
+                     * If we get here, a PV guest tried to use one of the
+                     * reserved values in Xen's PAT.  This indicates a bug in
+                     * the guest, so inject #GP to cause the guest to log a
+                     * stack trace.
+                     */
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

