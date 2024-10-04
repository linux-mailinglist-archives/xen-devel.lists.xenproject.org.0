Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B875998FFDA
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 11:36:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810232.1222930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swejE-0001Zy-Dh; Fri, 04 Oct 2024 09:36:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810232.1222930; Fri, 04 Oct 2024 09:36:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swejE-0001Xm-Ai; Fri, 04 Oct 2024 09:36:04 +0000
Received: by outflank-mailman (input) for mailman id 810232;
 Fri, 04 Oct 2024 09:36:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IKoM=RA=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1swejD-0001Xg-4K
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 09:36:03 +0000
Received: from fforwardh-a2-smtp.messagingengine.com
 (fforwardh-a2-smtp.messagingengine.com [103.168.172.197])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10f01525-8234-11ef-99a2-01e77a169b0f;
 Fri, 04 Oct 2024 11:36:01 +0200 (CEST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfforwardh.phl.internal (Postfix) with ESMTP id 26AE92920282;
 Fri,  4 Oct 2024 05:36:00 -0400 (EDT)
Received: from phl-frontend-02 ([10.202.2.161])
 by phl-compute-12.internal (MEProxy); Fri, 04 Oct 2024 05:36:00 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Oct 2024 05:35:59 -0400 (EDT)
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
X-Inumbo-ID: 10f01525-8234-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728034560;
	 x=1728120960; bh=Zpz7DTxxwwyi4PDkAnWSolffL9IcWSA0k17jMTulmTw=; b=
	L5HiRpmbbsb6DEEzBMsOoBzzSBJZo5/3112OA+BdOY4CiwgAZ7Wv9rRvQRDU71jV
	EZSRGRZHAoVO7Te8zXsQJiorO6uxGLdJqCpLTEF2zkZODPYwakRpoRS72r8/EL+R
	x4nOe5B0W09L/ekMXrgd2k9lQmZUpRN8WVjYpLPaDjdSvG0IHCpz8sYQvViPmHpx
	jHqUaPBXxXWctj2lX79UWPd3sLIkxjOUrT1Aor5yNuUguRLjcYsG9GyOUMCx0mYW
	i+dOFW+G7tlnCCAOaOBwSvYAyfAxtKDA0/mE1KFCqvx4yvmYl6S636RzQn309Mxw
	2+opq5roWkCiA9D0/vz92Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728034560; x=
	1728120960; bh=Zpz7DTxxwwyi4PDkAnWSolffL9IcWSA0k17jMTulmTw=; b=Y
	GBP+r6zQSpwJXHsJ7giAfMwPLPf3+INDt3kguJYl2EdGSdyfDAhPg0wrcw6TQJXY
	Ek5CNtpJbmFSviIVlu8wvNndOcuQ7NbckFIJZFsXXl/rkxoo/t50D38ytt5C4LZj
	rjgTDcX0i381xu8luhcOR08zwro7u8gMw/OZ+RCuIyOV7kXHKu3Kvu+NW3FogsPO
	yGaR3wcaTf9TETYsye7KWniESuRIwt1QlI1L8lL98sxA0iewrnUTm3JQ0jqkik3q
	isWdhZiokKsKEphCjzOTrsbvqz8yDZKu93vUCxU0f4lS7uJBeaSmbqUM/74Ct707
	CC/VMvKcKa6RzRRBHvzdA==
X-ME-Sender: <xms:_7b_ZhTpm_mzkR0VNzCJl0rqEKLs6MMLVp-i6Qyak0ZAsg4nhtD5pA>
    <xme:_7b_ZqxRMNk7l9D3qs4ZHdqddZPy73ZmcciNmMx-MSL6AKaXxPGDFqn3WoxueAfiU
    aWvovkQqqGDP87ohYk>
X-ME-Received: <xmr:_7b_Zm2m40w5HZ8wh_K7AomN_9lA76m-ki9LKpSCbn8mRsqJxK-D4GniG7OD24-24xcAoUKkWeK-sockNfAYCWAf9NBunA4Vlxo5yjnJBgExalDb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvfedgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpefuvghrghhihicumfhisghrihhkuceoufgvrhhgihihpgfmihgsrhhikh
    esvghprghmrdgtohhmqeenucggtffrrghtthgvrhhnpeeigfdvjeduieefveefudegvdel
    gfehjedttdeifffhlefgudetudetheduleevueenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehsrghkihgssegurghrkhhsthgrrhdrshhithgv
    pdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeigvg
    hnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthho
    pehsvghrghhihigpkhhisghrihhksegvphgrmhdrtghomhdprhgtphhtthhopehjsggvuh
    hlihgthhesshhushgvrdgtohhmpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhef
    segtihhtrhhigidrtghomhdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigi
    drtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:_7b_ZpA203t4L8-E6xTL8Ypb0ZlvpSg5f6qrDRFO8RwvDmZsYvny6g>
    <xmx:_7b_Zqhf9-SjVxd0MQrZzAuuGgsAffnJ0D9Cvm3JKsmB6xEk8FyjpQ>
    <xmx:_7b_ZtpGCx1TYqliW6axLihgVs7tD0cfIKiKgMPPOyZqljvgxOwnRA>
    <xmx:_7b_ZliYCk9lISND_4EELlfLq2I1J-E-3qg8tm5QyUzj6ebilriIfQ>
    <xmx:ALf_ZifapcZsH9Lhdsv1W1Q-T6w9vXHjG4_In-wh5lH4_0D1OsAer-0Zvjze>
Feedback-ID: iddf78192:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1 3/3] x86/hvm: make ACPI PM & stdvga emulation optional
Date: Fri,  4 Oct 2024 12:35:57 +0300
Message-Id: <9b27c594b3a63b75826a864dea08d902fd8702c3.1728032664.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1728032664.git.Sergiy_Kibrik@epam.com>
References: <cover.1728032664.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Make it possible to build a configuration without code for PM timer or stdvga
drivers. This may help to reduce code's footprint a bit for systems that don't
run HVM guests and also don't need these devices emulated.

Introduced additional check of domain's emulation flags, to cover the case
when user explicitly states the requirement of emulated devices that are
disabled in the build. HVM always require these devices to be present so domains
of this type can't be created when stdvga or pmtimer are disabled.

Options X86_STDVGA & X86_PMTIMER are dependant on HVM option, because these
drivers are part of HVM support code.

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/Kconfig  | 21 +++++++++++++++++++--
 xen/arch/x86/domain.c |  6 ++++++
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 89c42ff6da..05551bd722 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -144,11 +144,28 @@ config INTEL_VMX
 	  If your system includes a processor with Intel VT-x support, say Y.
 	  If in doubt, say Y.
 
+menu "Emulated devices support"
+	visible if EXPERT
+	depends on HVM
+
 config X86_PMTIMER
-	def_bool HVM
+	bool "ACPI PM timer emulation support"
+	default y
+	help
+	  Build pmtimer driver that emulates ACPI PM timer for HVM/PVH guests.
+
+	  If unsure, say Y.
 
 config X86_STDVGA
-	def_bool HVM
+	bool "Standard VGA card emulation support"
+	default y
+	help
+	  Build stdvga driver that emulates standard VGA card with VESA BIOS
+	  Extensions for HVM/PVH guests.
+
+	  If unsure, say Y.
+
+endmenu
 
 config XEN_SHSTK
 	bool "Supervisor Shadow Stacks"
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 89aad7e897..32dd3f84cd 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -742,11 +742,17 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 
 static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
 {
+    const uint32_t disabled_emu_mask =
+        (IS_ENABLED(CONFIG_X86_PMTIMER) ? 0 : X86_EMU_PM) |
+        (IS_ENABLED(CONFIG_X86_STDVGA)  ? 0 : X86_EMU_VGA);
 #ifdef CONFIG_HVM
     /* This doesn't catch !CONFIG_HVM case but it is better than nothing */
     BUILD_BUG_ON(X86_EMU_ALL != XEN_X86_EMU_ALL);
 #endif
 
+    if ( emflags & disabled_emu_mask )
+        return false;
+
     if ( is_hvm_domain(d) )
     {
         if ( is_hardware_domain(d) &&
-- 
2.25.1


