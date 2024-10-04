Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3586498FFCA
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 11:32:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810225.1222909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swefF-0000TX-OO; Fri, 04 Oct 2024 09:31:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810225.1222909; Fri, 04 Oct 2024 09:31:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swefF-0000R4-LY; Fri, 04 Oct 2024 09:31:57 +0000
Received: by outflank-mailman (input) for mailman id 810225;
 Fri, 04 Oct 2024 09:31:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IKoM=RA=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1swefE-0000Qy-Se
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 09:31:56 +0000
Received: from fforwardh-a2-smtp.messagingengine.com
 (fforwardh-a2-smtp.messagingengine.com [103.168.172.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7dbcee43-8233-11ef-a0bb-8be0dac302b0;
 Fri, 04 Oct 2024 11:31:54 +0200 (CEST)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfforwardh.phl.internal (Postfix) with ESMTP id 726B22920276;
 Fri,  4 Oct 2024 05:31:53 -0400 (EDT)
Received: from phl-frontend-01 ([10.202.2.160])
 by phl-compute-08.internal (MEProxy); Fri, 04 Oct 2024 05:31:53 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Oct 2024 05:31:52 -0400 (EDT)
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
X-Inumbo-ID: 7dbcee43-8233-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.com; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1728034313; x=
	1728120713; bh=69IFtkBSucFIbcgkPReVQNcoJr3WfIfUZOzP2zT3FK0=; b=r
	Wwygg+PiXT0BdLR06kzwxJWejxCkqvupaSH5MeI0fyjSbxt8pzIEd8Isy0RQXw5c
	rNtdpmBwc/QHBOrgeXN+dIH52yld8sPxOXTMfnkuCf/Jr782o52+/1/JmtCmDfPr
	O7B5gCHNlVIIR7sP1TP01opENyW/cVy3Q72LE0kkS16PQSzKtGIoYPoSo76benL4
	S3WFlY6jLrEEH+TTp+1/4CFVJ+4QcgXrm1oCAkFuEVUMGZpxTFXKD8tEGeHwiU2B
	ZNo+jdw7e9emtnEUT9Wlvt77KjvaFVTC3xVAuHXIVzoIrp3Ad4Lz4ocfbBfcnGA9
	jZ+XcHl4aVG9KopMsS7ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728034313; x=
	1728120713; bh=69IFtkBSucFIbcgkPReVQNcoJr3WfIfUZOzP2zT3FK0=; b=U
	OpgQFoQgK/LsE/Y+AK0fe+HJ2MOx3Oy4Olrua5zwzndzrUeVygi4F7z9yAg9ujcE
	8arS9w5GRrIvmZSq/jqWNwP6TvmocT+rwrkgijRulpqfLtD1SEo92x6rUX6le6pi
	WM1Kh4E4OijThCkMjs/pceRRRR5S9bfDPf/p5WIweYoVdbAbgk7UkM0QBmEiq4Et
	TXNxgrpjRP79LxALzsedAwbn1RcbH4X2RpNZGtVUX1+FGxkh2X/DKmif9ZtWuBIm
	5kYp6ydcfLdih8AF9gXizWTrI+EqE4MFT/VqIACErsSxPc49m8fZZesyLvkVQrTO
	XPiLP84YayeUh/2/Nsa4w==
X-ME-Sender: <xms:CLb_ZvsMXVbxkBR8Ge0OzRNJAKs5LT-pAlRZabw-0wkSKnWtVRS3Rw>
    <xme:CLb_ZgclokjdfVNlW3-FDjNbx9DJm7Sencr_c63sSa02PNKi1WmSVMWh-2rrdJM0W
    goEk3Uv9xaT3DTvUf0>
X-ME-Received: <xmr:CLb_ZixmIsZhH9YJs6_zd3mqhlevO3uTlrBHUEj3QrErFR7AG4DAZaU_vk840spgKixDURCafu_ZZdMxNKGsZ3_Rku-v7LXVum2uzKjehJ-_OgIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvfedgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomhepufgvrhhgihihucfmihgsrhhikhcuoefuvghrghhihigpmfhisghrihhkse
    gvphgrmhdrtghomheqnecuggftrfgrthhtvghrnheptdejgeegvdffkeekleefueevgfdu
    heevkedvhfdvkeeludehleegheeivedugfejnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepshgrkhhisgesuggrrhhkshhtrghrrdhsihhtvgdp
    nhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnh
    dquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohep
    shgvrhhgihihpghkihgsrhhikhesvghprghmrdgtohhmpdhrtghpthhtoheprghnughrvg
    ifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopehrohhgvghrrdhp
    rghusegtihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhm
X-ME-Proxy: <xmx:CLb_ZuN05OG3zhkeQI-QyQ0tqtqtCzskwwwTZrmptVt-MaQFARsluQ>
    <xmx:CLb_Zv960UaCFwJgLe8XwXG7WFd3j2yWZXMJEmFd2AIuYqLEsT26Tw>
    <xmx:CLb_ZuUUrWEzvU-sxgau8AChTqYVrMV0dCfDZAceh6s_5CXpImhilQ>
    <xmx:CLb_Zgc1MWOkIwLRsOXeJoIBzcRZONG8PRkZd9TpN3_JWGaLzvG_9A>
    <xmx:Cbb_Zra9O7FXL8A4ui6zodtIQTicBznIz66iRkqObpE_jl8uXwW1iYMEJ6CW>
Feedback-ID: iddd9dc1e:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v1 1/3] x86/hvm: introduce config option for ACPI PM timer
Date: Fri,  4 Oct 2024 12:31:50 +0300
Message-Id: <3ef3724e21b196edd277c94598ebe6624813ede4.1728032664.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1728032664.git.Sergiy_Kibrik@epam.com>
References: <cover.1728032664.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce config option X86_PMTIMER so that pmtimer emulation driver can later
be made configurable and be disabled on systems that don't need it.

As a first step the option is hidden from user, thus not making any functional
changes here.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/Kconfig               |  3 +++
 xen/arch/x86/hvm/Makefile          |  2 +-
 xen/arch/x86/include/asm/acpi.h    |  5 +++++
 xen/arch/x86/include/asm/domain.h  |  3 ++-
 xen/arch/x86/include/asm/hvm/vpt.h | 10 ++++++++++
 5 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 9cdd04721a..95275dc17e 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -144,6 +144,9 @@ config INTEL_VMX
 	  If your system includes a processor with Intel VT-x support, say Y.
 	  If in doubt, say Y.
 
+config X86_PMTIMER
+	def_bool HVM
+
 config XEN_SHSTK
 	bool "Supervisor Shadow Stacks"
 	depends on HAS_AS_CET_SS
diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
index 4c1fa5c6c2..321241f0bf 100644
--- a/xen/arch/x86/hvm/Makefile
+++ b/xen/arch/x86/hvm/Makefile
@@ -18,7 +18,7 @@ obj-y += irq.o
 obj-y += monitor.o
 obj-y += mtrr.o
 obj-y += nestedhvm.o
-obj-y += pmtimer.o
+obj-$(CONFIG_X86_PMTIMER) += pmtimer.o
 obj-y += quirks.o
 obj-y += rtc.o
 obj-y += save.o
diff --git a/xen/arch/x86/include/asm/acpi.h b/xen/arch/x86/include/asm/acpi.h
index 217819dd61..8d92014ae9 100644
--- a/xen/arch/x86/include/asm/acpi.h
+++ b/xen/arch/x86/include/asm/acpi.h
@@ -150,8 +150,13 @@ void acpi_mmcfg_init(void);
 /* Incremented whenever we transition through S3. Value is 1 during boot. */
 extern uint32_t system_reset_counter;
 
+#ifdef CONFIG_X86_PMTIMER
 void hvm_acpi_power_button(struct domain *d);
 void hvm_acpi_sleep_button(struct domain *d);
+#else
+static inline void hvm_acpi_power_button(struct domain *d) {}
+static inline void hvm_acpi_sleep_button(struct domain *d) {}
+#endif
 
 /* suspend/resume */
 void save_rest_processor_state(void);
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index bdcdb8de09..3f65bfd190 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -496,7 +496,8 @@ struct arch_domain
 
 #define has_vlapic(d)      (!!((d)->arch.emulation_flags & X86_EMU_LAPIC))
 #define has_vhpet(d)       (!!((d)->arch.emulation_flags & X86_EMU_HPET))
-#define has_vpm(d)         (!!((d)->arch.emulation_flags & X86_EMU_PM))
+#define has_vpm(d)         (IS_ENABLED(CONFIG_X86_PMTIMER) && \
+                            !!((d)->arch.emulation_flags & X86_EMU_PM))
 #define has_vrtc(d)        (!!((d)->arch.emulation_flags & X86_EMU_RTC))
 #define has_vioapic(d)     (!!((d)->arch.emulation_flags & X86_EMU_IOAPIC))
 #define has_vpic(d)        (!!((d)->arch.emulation_flags & X86_EMU_PIC))
diff --git a/xen/arch/x86/include/asm/hvm/vpt.h b/xen/arch/x86/include/asm/hvm/vpt.h
index 0b92b28625..333b346068 100644
--- a/xen/arch/x86/include/asm/hvm/vpt.h
+++ b/xen/arch/x86/include/asm/hvm/vpt.h
@@ -187,10 +187,20 @@ void rtc_deinit(struct domain *d);
 void rtc_reset(struct domain *d);
 void rtc_update_clock(struct domain *d);
 
+#ifdef CONFIG_X86_PMTIMER
 void pmtimer_init(struct vcpu *v);
 void pmtimer_deinit(struct domain *d);
 void pmtimer_reset(struct domain *d);
 int pmtimer_change_ioport(struct domain *d, uint64_t version);
+#else
+static inline void pmtimer_init(struct vcpu *v) {}
+static inline void pmtimer_deinit(struct domain *d) {}
+static inline void pmtimer_reset(struct domain *d) {}
+static inline int pmtimer_change_ioport(struct domain *d, uint64_t version)
+{
+    return -ENODEV;
+}
+#endif
 
 void hpet_init(struct domain *d);
 void hpet_deinit(struct domain *d);
-- 
2.25.1


