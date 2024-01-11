Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2553382A86F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 08:35:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665955.1036315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNpb5-0001AS-Fe; Thu, 11 Jan 2024 07:35:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665955.1036315; Thu, 11 Jan 2024 07:35:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNpb5-00018g-D5; Thu, 11 Jan 2024 07:35:27 +0000
Received: by outflank-mailman (input) for mailman id 665955;
 Thu, 11 Jan 2024 07:35:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNpb4-00018Y-PB
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 07:35:26 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc2a3a49-b053-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 08:35:25 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-336755f1688so4272290f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 23:35:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d6-20020a056000114600b003366a9cb0d1sm444087wrx.92.2024.01.10.23.35.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 23:35:24 -0800 (PST)
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
X-Inumbo-ID: fc2a3a49-b053-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704958525; x=1705563325; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TMrbBvkZhskVDNFDVa776VDzvxg6i1Meo4j2L0PFpIY=;
        b=Ka9lgTFDG9SrMk16tJKPHQIDGylIVs1SfFFFHNdG1s55miL2E9asJCyQSskcL5kUjn
         GbDzflDaGE2UzXEzT96SOHoeXnbX5ijireGrDtkpXy9hskQ55eD1anddNAelOE5tQV2q
         Iz8Qbw3/EHt+AwCYS0KlwirEsIIH98cl0jC8iNITHW7Dwx0Ctb7BWpzz0h/HNIr1192j
         es576RCLuZRmUMEtQb4irLw/rpDxn2fNueP5pojLqB2kQsTPUraDwI4Q3xhxQ9+mWpIy
         glcTJ08WnRzMjxbZ0EVuuQrbfByuRMPvO0v1MnDZFFQYR/KhD0QIMpZcQ86UofMSODXf
         gsdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704958525; x=1705563325;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TMrbBvkZhskVDNFDVa776VDzvxg6i1Meo4j2L0PFpIY=;
        b=tRI64Z/tFgDiqRLX4hT6ZiediXAfd12I++zd5w/gt+F5nHuNNSSVDx0/lfXNmsTlEh
         6hsv7XM8OaG6iU5RDQMBAdlmL6hVp8YHcxWVLgiZuoIRpHE2nvYIi1UxERqO87xy86VY
         nb3Tp9D4bH3Sj9mEb4vVUdzBbpdaPVvR4A9W+ePH6z1+gE50LVQHGaSRna5uzIJrmBsV
         /xctGBh5nR1h0aPO4khNazyPkamCJMS+xcmYAPl5/MhPEOVX5SfsZJ8sXJ0BWp+92fj9
         qtmcnrXAKCl1woRbT37hxNPdNSrYViflLrG712kB1NLr777bG+ZYUT7KIgQSiQeKuL1g
         7D3w==
X-Gm-Message-State: AOJu0YyfTRzdePQ4ldgktcfQyZIAv03yZCn0GAOhHRvjsddSCYWKA7EQ
	0UOhwA32l++RKBzE+qDsLaqtMXycM1W3ETXo0B5dcTiaZg==
X-Google-Smtp-Source: AGHT+IGvxnj4i0FkUHie6I9iC/M+vw+/zXVrk6qxwayAQIhoCucG+Q4PXg7/4v+ZtPGxmp/Qn/crhA==
X-Received: by 2002:a5d:440e:0:b0:336:779b:97a1 with SMTP id z14-20020a5d440e000000b00336779b97a1mr298049wrq.74.1704958525128;
        Wed, 10 Jan 2024 23:35:25 -0800 (PST)
Message-ID: <c6926627-aeb6-40dd-a85a-1be0b324bf49@suse.com>
Date: Thu, 11 Jan 2024 08:35:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 6/8] IRQ: drop register parameter from handler functions
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Kevin Tian <kevin.tian@intel.com>
References: <1ab231ec-5e3c-4662-8530-2213bc52bb7c@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <1ab231ec-5e3c-4662-8530-2213bc52bb7c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

It's simply not needed anymore. Note how Linux made this change many
years ago already, in 2.6.19 (late 2006, see [1]).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=7d12e780e003f93433d49ce78cfedf4b4c52adc5

--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -397,7 +397,7 @@ void gic_interrupt(struct cpu_user_regs
     } while (1);
 }
 
-static void maintenance_interrupt(int irq, void *dev_id, struct cpu_user_regs *regs)
+static void maintenance_interrupt(int irq, void *dev_id)
 {
     /*
      * This is a dummy interrupt handler.
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -182,8 +182,7 @@ void irq_set_affinity(struct irq_desc *d
 }
 
 int request_irq(unsigned int irq, unsigned int irqflags,
-                void (*handler)(int irq, void *dev_id,
-                                struct cpu_user_regs *regs),
+                void (*handler)(int irq, void *dev_id),
                 const char *devname, void *dev_id)
 {
     struct irqaction *action;
@@ -276,7 +275,7 @@ void do_IRQ(struct cpu_user_regs *regs,
 
     do
     {
-        action->handler(irq, action->dev_id, regs);
+        action->handler(irq, action->dev_id);
         action = action->next;
     } while ( action );
 
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -241,7 +241,7 @@ int reprogram_timer(s_time_t timeout)
 }
 
 /* Handle the firing timer */
-static void htimer_interrupt(int irq, void *dev_id, struct cpu_user_regs *regs)
+static void htimer_interrupt(int irq, void *dev_id)
 {
     if ( unlikely(!(READ_SYSREG(CNTHP_CTL_EL2) & CNTx_CTL_PENDING)) )
         return;
@@ -255,7 +255,7 @@ static void htimer_interrupt(int irq, vo
     WRITE_SYSREG(0, CNTHP_CTL_EL2);
 }
 
-static void vtimer_interrupt(int irq, void *dev_id, struct cpu_user_regs *regs)
+static void vtimer_interrupt(int irq, void *dev_id)
 {
     /*
      * Edge-triggered interrupts can be used for the virtual timer. Even
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -962,7 +962,7 @@ static int __init cf_check irq_ratelimit
 __initcall(irq_ratelimit_init);
 
 int __init request_irq(unsigned int irq, unsigned int irqflags,
-        void (*handler)(int irq, void *dev_id, struct cpu_user_regs *regs),
+        void (*handler)(int irq, void *dev_id),
         const char * devname, void *dev_id)
 {
     struct irqaction * action;
@@ -2009,7 +2009,7 @@ void do_IRQ(struct cpu_user_regs *regs)
         spin_unlock_irq(&desc->lock);
 
         tsc_in = tb_init_done ? get_cycles() : 0;
-        action->handler(irq, action->dev_id, regs);
+        action->handler(irq, action->dev_id);
         TRACE_3D(TRC_HW_IRQ_HANDLED, irq, tsc_in, get_cycles());
 
         spin_lock_irq(&desc->lock);
--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -237,8 +237,7 @@ again:
     }
 }
 
-static void cf_check hpet_interrupt_handler(
-    int irq, void *data, struct cpu_user_regs *regs)
+static void cf_check hpet_interrupt_handler(int irq, void *data)
 {
     struct hpet_event_channel *ch = data;
 
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -198,8 +198,7 @@ static void smp_send_timer_broadcast_ipi
     }
 }
 
-static void cf_check timer_interrupt(
-    int irq, void *dev_id, struct cpu_user_regs *regs)
+static void cf_check timer_interrupt(int irq, void *dev_id)
 {
     ASSERT(local_irq_is_enabled());
 
--- a/xen/common/irq.c
+++ b/xen/common/irq.c
@@ -29,7 +29,7 @@ int init_one_irq_desc(struct irq_desc *d
     return err;
 }
 
-void cf_check no_action(int cpl, void *dev_id, struct cpu_user_regs *regs)
+void cf_check no_action(int cpl, void *dev_id)
 {
 }
 
--- a/xen/drivers/char/cadence-uart.c
+++ b/xen/drivers/char/cadence-uart.c
@@ -40,7 +40,7 @@ static struct cuart {
 #define cuart_read(uart, off)           readl((uart)->regs + (off))
 #define cuart_write(uart, off,val)      writel((val), (uart)->regs + (off))
 
-static void cuart_interrupt(int irq, void *data, struct cpu_user_regs *regs)
+static void cuart_interrupt(int irq, void *data)
 {
     struct serial_port *port = data;
     struct cuart *uart = port->uart;
--- a/xen/drivers/char/exynos4210-uart.c
+++ b/xen/drivers/char/exynos4210-uart.c
@@ -45,7 +45,7 @@ static struct exynos4210_uart {
 #define exynos4210_read(uart, off)          readl((uart)->regs + off)
 #define exynos4210_write(uart, off, val)    writel(val, (uart->regs) + off)
 
-static void exynos4210_uart_interrupt(int irq, void *data, struct cpu_user_regs *regs)
+static void exynos4210_uart_interrupt(int irq, void *data)
 {
     struct serial_port *port = data;
     struct exynos4210_uart *uart = port->uart;
--- a/xen/drivers/char/imx-lpuart.c
+++ b/xen/drivers/char/imx-lpuart.c
@@ -37,8 +37,7 @@ static struct imx_lpuart {
     struct vuart_info vuart;
 } imx8_com;
 
-static void imx_lpuart_interrupt(int irq, void *data,
-                                 struct cpu_user_regs *regs)
+static void imx_lpuart_interrupt(int irq, void *data)
 {
     struct serial_port *port = data;
     struct imx_lpuart *uart = port->uart;
--- a/xen/drivers/char/meson-uart.c
+++ b/xen/drivers/char/meson-uart.c
@@ -61,8 +61,7 @@ static struct meson_uart {
     struct vuart_info vuart;
 } meson_com;
 
-static void meson_uart_interrupt(int irq, void *data,
-                                 struct cpu_user_regs *regs)
+static void meson_uart_interrupt(int irq, void *data)
 {
     struct serial_port *port = data;
     struct meson_uart *uart = port->uart;
--- a/xen/drivers/char/mvebu-uart.c
+++ b/xen/drivers/char/mvebu-uart.c
@@ -67,8 +67,7 @@ static struct mvebu3700_uart {
 #define mvebu3700_read(uart, off)           readl((uart)->regs + (off))
 #define mvebu3700_write(uart, off, val)     writel(val, (uart)->regs + (off))
 
-static void mvebu3700_uart_interrupt(int irq, void *data,
-                                     struct cpu_user_regs *regs)
+static void mvebu3700_uart_interrupt(int irq, void *data)
 {
     struct serial_port *port = data;
     struct mvebu3700_uart *uart = port->uart;
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -175,8 +175,7 @@ static void handle_dw_usr_busy_quirk(str
     }
 }
 
-static void cf_check ns16550_interrupt(
-    int irq, void *dev_id, struct cpu_user_regs *regs)
+static void cf_check ns16550_interrupt(int irq, void *dev_id)
 {
     struct serial_port *port = dev_id;
     struct ns16550 *uart = port->uart;
--- a/xen/drivers/char/omap-uart.c
+++ b/xen/drivers/char/omap-uart.c
@@ -59,7 +59,7 @@ static struct omap_uart {
     struct vuart_info vuart;
 } omap_com = {0};
 
-static void omap_uart_interrupt(int irq, void *data, struct cpu_user_regs *regs)
+static void omap_uart_interrupt(int irq, void *data)
 {
     struct serial_port *port = data;
     struct omap_uart *uart = port->uart;
--- a/xen/drivers/char/pl011.c
+++ b/xen/drivers/char/pl011.c
@@ -82,7 +82,7 @@ static unsigned int pl011_intr_status(st
     return (pl011_read(uart, RIS) & pl011_read(uart, IMSC));
 }
 
-static void pl011_interrupt(int irq, void *data, struct cpu_user_regs *regs)
+static void pl011_interrupt(int irq, void *data)
 {
     struct serial_port *port = data;
     struct pl011 *uart = port->uart;
--- a/xen/drivers/char/scif-uart.c
+++ b/xen/drivers/char/scif-uart.c
@@ -102,7 +102,7 @@ static const struct port_params port_par
     },
 };
 
-static void scif_uart_interrupt(int irq, void *data, struct cpu_user_regs *regs)
+static void scif_uart_interrupt(int irq, void *data)
 {
     struct serial_port *port = data;
     struct scif_uart *uart = port->uart;
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -718,8 +718,7 @@ static void cf_check do_amd_iommu_irq(vo
 
 static DECLARE_SOFTIRQ_TASKLET(amd_iommu_irq_tasklet, do_amd_iommu_irq, NULL);
 
-static void cf_check iommu_interrupt_handler(
-    int irq, void *dev_id, struct cpu_user_regs *regs)
+static void cf_check iommu_interrupt_handler(int irq, void *dev_id)
 {
     unsigned long flags;
     struct amd_iommu *iommu = dev_id;
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -1097,16 +1097,14 @@ static irqreturn_t arm_smmu_global_fault
 }
 
 /* Xen: Interrupt handlers wrapper */
-static void arm_smmu_context_fault_xen(int irq, void *dev,
-				       struct cpu_user_regs *regs)
+static void arm_smmu_context_fault_xen(int irq, void *dev)
 {
 	arm_smmu_context_fault(irq, dev);
 }
 
 #define arm_smmu_context_fault arm_smmu_context_fault_xen
 
-static void arm_smmu_global_fault_xen(int irq, void *dev,
-				      struct cpu_user_regs *regs)
+static void arm_smmu_global_fault_xen(int irq, void *dev)
 {
 	arm_smmu_global_fault(irq, dev);
 }
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -880,8 +880,7 @@ static void arm_smmu_priq_tasklet(void *
 
 static int arm_smmu_device_disable(struct arm_smmu_device *smmu);
 
-static void arm_smmu_gerror_handler(int irq, void *dev,
-				struct cpu_user_regs *regs)
+static void arm_smmu_gerror_handler(int irq, void *dev)
 {
 	u32 gerror, gerrorn, active;
 	struct arm_smmu_device *smmu = dev;
@@ -926,8 +925,7 @@ static void arm_smmu_gerror_handler(int
 	writel(gerror, smmu->base + ARM_SMMU_GERRORN);
 }
 
-static void arm_smmu_combined_irq_handler(int irq, void *dev,
-				struct cpu_user_regs *regs)
+static void arm_smmu_combined_irq_handler(int irq, void *dev)
 {
 	struct arm_smmu_device *smmu = dev;
 
@@ -945,16 +943,14 @@ static void arm_smmu_combined_irq_taskle
 		arm_smmu_priq_tasklet(dev);
 }
 
-static void arm_smmu_evtq_irq_tasklet(int irq, void *dev,
-				struct cpu_user_regs *regs)
+static void arm_smmu_evtq_irq_tasklet(int irq, void *dev)
 {
 	struct arm_smmu_device *smmu = dev;
 
 	tasklet_schedule(&(smmu->evtq_irq_tasklet));
 }
 
-static void arm_smmu_priq_irq_tasklet(int irq, void *dev,
-				struct cpu_user_regs *regs)
+static void arm_smmu_priq_irq_tasklet(int irq, void *dev)
 {
 	struct arm_smmu_device *smmu = dev;
 
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1119,8 +1119,7 @@ static void cf_check do_iommu_page_fault
         __do_iommu_page_fault(drhd->iommu);
 }
 
-static void cf_check iommu_page_fault(
-    int irq, void *dev_id, struct cpu_user_regs *regs)
+static void cf_check iommu_page_fault(int irq, void *dev_id)
 {
     /*
      * Just flag the tasklet as runnable. This is fine, according to VT-d
--- a/xen/include/xen/irq.h
+++ b/xen/include/xen/irq.h
@@ -18,7 +18,7 @@
     ASSERT(!in_irq() && (local_irq_is_enabled() || num_online_cpus() <= 1))
 
 struct irqaction {
-    void (*handler)(int irq, void *dev_id, struct cpu_user_regs *regs);
+    void (*handler)(int irq, void *dev_id);
     const char *name;
     void *dev_id;
     bool free_on_release;
@@ -119,12 +119,11 @@ extern int setup_irq(unsigned int irq, u
                      struct irqaction *new);
 extern void release_irq(unsigned int irq, const void *dev_id);
 extern int request_irq(unsigned int irq, unsigned int irqflags,
-               void (*handler)(int irq, void *dev_id,
-                     struct cpu_user_regs *regs),
+               void (*handler)(int irq, void *dev_id),
                const char *devname, void *dev_id);
 
 extern hw_irq_controller no_irq_type;
-void cf_check no_action(int cpl, void *dev_id, struct cpu_user_regs *regs);
+void cf_check no_action(int cpl, void *dev_id);
 unsigned int cf_check irq_startup_none(struct irq_desc *desc);
 void cf_check irq_actor_none(struct irq_desc *desc);
 #define irq_shutdown_none irq_actor_none


