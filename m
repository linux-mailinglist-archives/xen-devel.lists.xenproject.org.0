Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C91282A847
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 08:25:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665901.1036215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNpR1-0002Xg-6l; Thu, 11 Jan 2024 07:25:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665901.1036215; Thu, 11 Jan 2024 07:25:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNpR1-0002V3-3I; Thu, 11 Jan 2024 07:25:03 +0000
Received: by outflank-mailman (input) for mailman id 665901;
 Thu, 11 Jan 2024 07:25:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNpQz-000200-HB
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 07:25:01 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85e7ffb2-b052-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 08:24:57 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40e5521dab6so17014645e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 23:24:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o10-20020a056000010a00b00336cbbf2e0fsm441141wrx.27.2024.01.10.23.24.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 23:24:57 -0800 (PST)
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
X-Inumbo-ID: 85e7ffb2-b052-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704957898; x=1705562698; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TMrbBvkZhskVDNFDVa776VDzvxg6i1Meo4j2L0PFpIY=;
        b=f9q3IunMP2mNKM30IDclIprKiUzhZkNca2qxAbspxbxWRajt3IPU010KerhZEhhMD4
         BdR/R5RUiQwD6YR/5z+ieDu/PEINUSRm4pKg8Kr5Nwgw1mq7bKnqZk5TjGqBD6YMcJxB
         NVrAgJHlY1fDjMwnCuI3wWHl2nl3JbaRrQDrWSj3Y3iSdESpJv8qUsTZmHH+BcZRj7Lb
         GbT1lrSpPurx1HrnJM1jxnRPWl9g292XvZ27azWwhc0JvJ0VxE5w/m0aX98yPYTE9NUZ
         9qWuGo/wsn7X99n6AQweVfdU2VONv5qDR6y5VsMR2jXMLMEcHLbAke5eezxkcSyMeTCk
         lenw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704957898; x=1705562698;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TMrbBvkZhskVDNFDVa776VDzvxg6i1Meo4j2L0PFpIY=;
        b=FfZ/JxGSRLlIexN+PcKGViVZjspXxkffOUlnilKFmLp48HBjRrq17q/KP1qr7K1f5W
         /tt8khXEl+kbaE9l+DcQSh7lN5oBU3dNTWlQqiLxAk1IYNRXt7ZzyG3jNC+YBcjvTkfP
         ejffNHog9zYyJLwHSBuXUK+/+tmrG+WbU8gv/0IC80+okQFm/tub8IdislHxcBJ7xHMu
         wPJr0vFcf4xuFj5mMD9DUlANbaScGS9X3vKH7+XnH8+mcSjwlo7DdsCNMz2nf29YQZxr
         +IW0uSh+ePIBosaca4cRNI8k1TgnpPq29lA7uztlubJ5vOysIpnPBVUm7YixPJk1JEIy
         dyUA==
X-Gm-Message-State: AOJu0YxarOeydYL76htBlcc5O1fL9Pcm2CySvX9OiN4w2a0Jt1A2Fpm8
	kfbnTKsIuzDMGczQUPRHHf6ZeC7gJuUNdvsI7sYSBmL/Rw==
X-Google-Smtp-Source: AGHT+IGeUfAWvi25VR9asNnMH2taWeWh7VmwFy1OrMb8DuOS6N7UX272NqHrAYOJ4l5AI/xKdCw5Bg==
X-Received: by 2002:a05:600c:3145:b0:40e:499d:5ce2 with SMTP id h5-20020a05600c314500b0040e499d5ce2mr145295wmo.1.1704957897927;
        Wed, 10 Jan 2024 23:24:57 -0800 (PST)
Message-ID: <086ab61f-fa9d-4b2e-b8b7-5a4d06effe5a@suse.com>
Date: Thu, 11 Jan 2024 08:24:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/8] IRQ: drop register parameter from handler functions
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <5d6089a4-c597-49ce-b042-24f13922f581@suse.com>
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
In-Reply-To: <5d6089a4-c597-49ce-b042-24f13922f581@suse.com>
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


