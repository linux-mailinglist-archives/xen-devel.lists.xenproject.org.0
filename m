Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6356491C0
	for <lists+xen-devel@lfdr.de>; Sun, 11 Dec 2022 03:11:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458708.716525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4BnU-0002v1-O1; Sun, 11 Dec 2022 02:10:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458708.716525; Sun, 11 Dec 2022 02:10:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4BnU-0002l6-EU; Sun, 11 Dec 2022 02:10:32 +0000
Received: by outflank-mailman (input) for mailman id 458708;
 Sun, 11 Dec 2022 02:10:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=97oD=4J=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1p4BnS-0002cH-Jv
 for xen-devel@lists.xenproject.org; Sun, 11 Dec 2022 02:10:30 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbe4a1da-78f8-11ed-8fd2-01056ac49cbb;
 Sun, 11 Dec 2022 03:10:29 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 02FE35C00B3;
 Sat, 10 Dec 2022 21:10:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 10 Dec 2022 21:10:29 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 Dec 2022 21:10:27 -0500 (EST)
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
X-Inumbo-ID: fbe4a1da-78f8-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1670724628; x=1670811028; bh=of27AYkTAg
	+gV39hHVFtMa/D9CLpVwIBhoS3TGwZ7fc=; b=TU3Gd7HHM9eaLznkoXXzD9Pyoz
	icKaP5MlSCu/xjyyvQeXuV0pUiHNXqZM3G3znHyIAyeY10HQ30Q918Ui+T+btq1n
	z8bXduZuPd/LJ3nKFb27B0hxIegrcdqNVDocIrjHWB0kbBbYf/Vwh3XjrV62Xrnh
	SZZ3Iko5qWeFE1H51dOM23kom6Cle8JEYlgeRO4fAozZKJNQ15nW3PZOxhZxVSkT
	yLbkV/7ruV7vVUgAR+QsT30cUS19K6S0gn3DFWnl7gkzsIsBY/Imen+lM79WstzJ
	Bl8v8iBmX/N66ElOK5cDHeFiRxOrt+zzI6ug1yONCgHmFTZYy7MAB5K782cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1670724628; x=
	1670811028; bh=of27AYkTAg+gV39hHVFtMa/D9CLpVwIBhoS3TGwZ7fc=; b=k
	e+oi1Q8Xp9XYjNBLsdk8u/ZWSRREbdxYQ2FyfVLd+0mCytqzMXmfdFa0TvMt3pTs
	J5v+8kIDEDj0K6iNbnNKTy3sXnVaFUxhBgQXD9FTbHT13ZcHPCHPV74Uz6FSrvEw
	7TO4v11COCQRdawHYHQT4gybR7l8paHkfrHsbDqXiTIV/HAGJv9VZ4S+Kr4am0n+
	11BRSfTv582DS58eaxNjAV0DFrzAgbHP2yqKnUk7iWCfziX6Kmv9iiuaQUoeXtbg
	IhW7j1R6PXIna45HgcupGvfK/cm0sQtnY8Denap0Cv1M2oaAUyvvy3hodzInT6El
	VyXXdvCvSEUn6qbFZ8+xQ==
X-ME-Sender: <xms:FDyVYwYIKIHfGEJGeULSdwMgDcGAH6ivQ2GQBsMuHYbgtdDzBw6xBQ>
    <xme:FDyVY7bqvtZaK4bui1y9fzFNoZKBDK-44n7M8rJl_U3xIyRGx7GTuLZmIHdZvkIBx
    gXfsh51ujUm_w>
X-ME-Received: <xmr:FDyVY6_LUSGrtlqcv8_2HzoABk0msu9kuMINNmxi0HzxtRENaRK4vxUMqRF58I1CxqzBxGcoBpchlWqlhzRAUhbp16pkdRJjDBMakfhwu7tuWGZPEJw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehgdeggecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeu
    udehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:FDyVY6pfCnkW_EFX8XvBjgHkMtz9G5H-PCPD_7LP6ozGI19Fu1k30A>
    <xmx:FDyVY7o7WbQlXF9Tov5-akNstL8jb6L39HGqiFJOXV7Oa6trU65x7Q>
    <xmx:FDyVY4QmBtJc58HeZioGsyoSZpLSK2kVkVgNxfjvodAPoFT9HVWo2g>
    <xmx:FDyVY8Dgfa-1r7yhzGgyvykGaDCIbDC3i_-rsPz4lz1terY2Do6Hcg>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 3/3] DEBUG: dump xhci state on connection timeout
Date: Sun, 11 Dec 2022 03:10:06 +0100
Message-Id: <823ad3165bbcfa61561ff4aac17f41d08e1e91f8.1670724490.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.932f486c1b08268190342f8918b09fa6a7c3f149.1670724490.git-series.marmarek@invisiblethingslab.com>
References: <cover.932f486c1b08268190342f8918b09fa6a7c3f149.1670724490.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Debug patch that shows xhci state after some arbitrary (and not very
smart) timeout.

DO NOT MERGE.
The timeout doesn't actually prevent registering the console.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 xen/drivers/char/xhci-dbc.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index 62b0ce88b6bf..cb209332a4be 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -33,7 +33,7 @@
 #include <asm/system.h>
 
 /* uncomment to have dbc_uart_dump() debug function */
-/* #define DBC_DEBUG 1 */
+#define DBC_DEBUG 1
 
 #define DBC_POLL_INTERVAL 100 /* us */
 
@@ -264,6 +264,10 @@ struct dbc {
     uint16_t pci_cr;
 };
 
+#ifdef DBC_DEBUG
+static void dbc_uart_dump(void);
+#endif
+
 static void *dbc_sys_map_xhc(uint64_t phys, size_t size)
 {
     size_t i;
@@ -900,13 +904,23 @@ static void dbc_reset_debug_port(struct dbc *dbc)
 static void dbc_enable_dbc(struct dbc *dbc)
 {
     struct dbc_reg *reg = dbc->dbc_reg;
+    unsigned long timeout = 10000000;
 
     wmb();
     writel(readl(&reg->ctrl) | (1U << DBC_CTRL_DCE), &reg->ctrl);
     wmb();
 
     while ( (readl(&reg->ctrl) & (1U << DBC_CTRL_DCE)) == 0 )
+    {
         cpu_relax();
+        if (!--timeout)
+            break;
+    }
+    if (!timeout)
+    {
+        dbc_error("timeout 1\n");
+        dbc_uart_dump();
+    }
 
     /* reset ports on initial open, to force re-enumerating by the host */
     if ( !dbc->open )
@@ -916,8 +930,18 @@ static void dbc_enable_dbc(struct dbc *dbc)
     writel(readl(&reg->portsc) | (1U << DBC_PSC_PED), &reg->portsc);
     wmb();
 
+    timeout = 1000000;
     while ( (readl(&reg->ctrl) & (1U << DBC_CTRL_DCR)) == 0 )
+    {
         cpu_relax();
+        if (!--timeout)
+            break;
+    }
+    if (!timeout)
+    {
+        dbc_error("timeout 2\n");
+        dbc_uart_dump();
+    }
 }
 
 static void dbc_disable_dbc(struct dbc *dbc)
-- 
git-series 0.9.1

