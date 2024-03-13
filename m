Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD5C87AA45
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 16:17:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692558.1079832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQLm-00069l-LG; Wed, 13 Mar 2024 15:17:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692558.1079832; Wed, 13 Mar 2024 15:17:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQLm-00066z-I2; Wed, 13 Mar 2024 15:17:02 +0000
Received: by outflank-mailman (input) for mailman id 692558;
 Wed, 13 Mar 2024 15:17:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WIWB=KT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rkQLl-00064u-ES
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 15:17:01 +0000
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com
 [103.168.172.146]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbe0fe38-e14c-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 16:16:59 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailfout.nyi.internal (Postfix) with ESMTP id 10DB9138009A;
 Wed, 13 Mar 2024 11:16:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 13 Mar 2024 11:16:58 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Mar 2024 11:16:56 -0400 (EDT)
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
X-Inumbo-ID: bbe0fe38-e14c-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1710343018; x=1710429418; bh=pRnc2ONRL/
	09dyz6m9s7vlkjBE0IxmuPAPPs7bOI7J0=; b=MQkO2ZK8/TD2NSfb5m2EqpQM06
	FsdmkCKynqUItmdWnUKk9aj2lCd+jfm5tyFVMw119Dxuo+ZB3znWigiZa8PkVGRg
	HxNH8LIA6yrUEiSlRg8sDHM+xLLqmdeTV61txYxkx6MUlN1/z/wcAHuNKApILYGO
	ZxehVKCO4EI8p9xqItOC0XBHdh5C/49GzMk2b32uZltRTI2nQckxKRbJujFKir9O
	uQS+vUjV63RdkqK9/XxN6vyvvtkovjdXsK2nZ/3ysnHADQRZuaQyzp98ZTiEcsR7
	UqTfDyK98WcpQf8R/Gs4e7iCx8txoXxSv/DWhFKddTgmmzkL/rh8xmPz2ogA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1710343018; x=
	1710429418; bh=pRnc2ONRL/09dyz6m9s7vlkjBE0IxmuPAPPs7bOI7J0=; b=N
	JPOhODajrRVYHIX4XAvRhvndUabjXWg/OfWz+LMH99uTPd37VOajgv5NIS3jQgln
	G06p7jvwh+rl/eRW4s0A9tC5ucCJyJIh02DAvFnpLxRZLQ1h6gSW9AfLZYFaVL/y
	mFIiTvn3D3w2JYT8JJqrF5U1z3lPqQ7nRiWsnpuncYLil8moN4VwyLhQVU6mPGYn
	cwvRT4rePAxsEoOvaIZQNUPnp8gL7fKqr0/76TX37wVjQ/tzJRQY1cE69Ec1FnnF
	wBsVRr+Vnp+rKcNaT0KZXXMMuB+HEBvX03BHyPGThd2Evbu9pmohEODYidRGqdvh
	U+BMvKibR7aXesuhD7QGA==
X-ME-Sender: <xms:acPxZSM1K7q8ztviTdi12Wp4RzdfmVxSoLplfm8--524zq8F5Igksg>
    <xme:acPxZQ8uXbQssY8F5HnOq58f2z4FFQpjP2nXWEbtWVIjn0Ve58gmo0bNES2hxvOdO
    dwGd_Fs_siXew>
X-ME-Received: <xmr:acPxZZRuQvKImNqkBLI-SZbtTCoo6Z7_Gz1-M9kgd6Fm6AY4cDzoeXOViBoq2G_oddx-PqfEKL6lcptizuJVts_vpUfL0A6Oo9Q9M3IvTH4GJDRpcN0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjeehgdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeu
    udehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:acPxZSt59WKw5kEO-_ejgHqLQtTQBZUHbhBacLtadVrJH85lR5CVcw>
    <xmx:acPxZaf9SOcCy8mOa69Y0Zs_yRcFEXsM8rr1FN6T1WAhwQTkInZSVA>
    <xmx:acPxZW2m0japEsrZLZFbxTTsvKrBNErkN54u9V1M82Jm0xDLeh-7Tw>
    <xmx:acPxZe9bUP6gWaG2oL9Drlbz_p6RARvzRJYM7j3fo86CC0acGIrcCg>
    <xmx:asPxZSQprHoah0sIACAxh2LZlKQnHXzadz6nRMzjccEnLVAM0qL4oQ>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 2/7] x86/msi: Extend per-domain/device warning mechanism
Date: Wed, 13 Mar 2024 16:16:07 +0100
Message-ID: <ec68ca290a207a3e191e470fb19254b7f6f887f8.1710342968.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.afa2d89161590f5193dd6bfd340c5e9347877aae.1710342968.git-series.marmarek@invisiblethingslab.com>
References: <cover.afa2d89161590f5193dd6bfd340c5e9347877aae.1710342968.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The arch_msix struct had a single "warned" field with a domid for which
warning was issued. Upcoming patch will need similar mechanism for few
more warnings, so change it to save a bit field of issued warnings.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Should I add also some helper for the boilerplate the handling requires
now? I tried some macro that also sets the bit field, but I couldn't get
it working. I guess I could make it working with a bitmask in a single
uint8_t - would that be preferred?

New in v5
---
 xen/arch/x86/include/asm/msi.h |  8 +++++++-
 xen/arch/x86/msi.c             |  9 +++++++--
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
index 997ccb87be0c..19b1e6631fdf 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -217,7 +217,13 @@ struct arch_msix {
     int table_idx[MAX_MSIX_TABLE_PAGES];
     spinlock_t table_lock;
     bool host_maskall, guest_maskall;
-    domid_t warned;
+    domid_t warned_domid;
+    union {
+        uint8_t all;
+        struct {
+            bool maskall                   : 1;
+        } u;
+    } warned_kind;
 };
 
 void early_msi_init(void);
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index e721aaf5c001..6433df30bd60 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -364,9 +364,14 @@ static bool msi_set_mask_bit(struct irq_desc *desc, bool host, bool guest)
             domid_t domid = pdev->domain->domain_id;
 
             maskall = true;
-            if ( pdev->msix->warned != domid )
+            if ( pdev->msix->warned_domid != domid )
             {
-                pdev->msix->warned = domid;
+                pdev->msix->warned_domid = domid;
+                pdev->msix->warned_kind.all = 0;
+            }
+            if ( !pdev->msix->warned_kind.u.maskall )
+            {
+                pdev->msix->warned_kind.u.maskall = true;
                 printk(XENLOG_G_WARNING
                        "cannot mask IRQ %d: masking MSI-X on Dom%d's %pp\n",
                        desc->irq, domid, &pdev->sbdf);
-- 
git-series 0.9.1

