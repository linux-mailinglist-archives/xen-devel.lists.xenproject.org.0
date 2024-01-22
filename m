Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C3F8364BB
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 14:49:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669913.1042456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRufg-0001bB-0S; Mon, 22 Jan 2024 13:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669913.1042456; Mon, 22 Jan 2024 13:49:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRuff-0001YN-Ta; Mon, 22 Jan 2024 13:49:03 +0000
Received: by outflank-mailman (input) for mailman id 669913;
 Mon, 22 Jan 2024 13:49:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VPlZ=JA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rRufe-0007Lx-Lp
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 13:49:02 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff5cc492-b92c-11ee-9b0f-b553b5be7939;
 Mon, 22 Jan 2024 14:49:01 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2cddb2c2b54so29739741fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 05:49:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cw13-20020a05663849cd00b0046e627dbc4csm3035114jab.121.2024.01.22.05.48.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 05:49:00 -0800 (PST)
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
X-Inumbo-ID: ff5cc492-b92c-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705931340; x=1706536140; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ozjB5J6HgFQRbYi1xrcNJWW3dzIQpHOtBsFN5IPmgeU=;
        b=AmmVygo/CZDpNNYwne3iqjpqKGlfPkj3QXiSh4K/lOkYQo1yva/OK0gpNDDMGVzO35
         +qd/vVY/gkRXc7ByIgPZFAOzPdzfrxTDjVYPNTVwtFqaTsa4dX2w1TznF6/BsO0t04U8
         +6XEtPtyKpmp9acvcE0ZmXr/3dww4sM5t1rjsI4kbitJ03+mr6/0JBx4Dbl3HonUngU1
         Z4hxh8nHDdm2Rguzr31jyevYCbAkvzUnECPQxRJrx8dPbyQY3DS5rJ4WH4+AY3u9cKVN
         PualTACx86V+99qCnEwdW/8WiQE+hhJEAxCSFGfRxwuhD9Hum1wTKiSaKgVuayoFwV6Z
         b1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705931340; x=1706536140;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ozjB5J6HgFQRbYi1xrcNJWW3dzIQpHOtBsFN5IPmgeU=;
        b=PE9otAvDwFSNj1sdZwFX+vlbAsniI20H8U9Xdzz3L2qFR1TfWvFXafxPH5VGRI5h2u
         VKQEpn3BFZKa5ATCwUE4xhTz5jlIXlNrTL1EdA500MkJYC9nskwHmPJEpiiiHZNiJmTN
         MbOxsp/1w1NI6C0MnnNfkqTch62jUx0BW1XAIiw8lJiw3eqBTfgHVxsp0Ra1RhDAxTKZ
         k0X48KAp/UiT2NHlXcuNzf2Z2cOfrfkamRcY8DfVlrb2qH4kv3zCr0ErCeiBvDN9m6/t
         Q13uT2r1X20OyXBZ44FbdDomSiSR965JExbQ2VXfoZ3MmSYKv8BJTO1zitXTY/Of4CQL
         z09Q==
X-Gm-Message-State: AOJu0Yx5mn9Xiq3jfB40UnrqKH+Ir3g1309Zvd75SNRlgII+kCbwqKZy
	p7VI1AkgaKg70DEWowbLmiG/roc90dobo5rOskkQ9ao+Uyx2LWEKoQyhy3+10K3QLeYj+6Q1tPU
	=
X-Google-Smtp-Source: AGHT+IFKt7nIuw0Mpt1DPTm+e+/wh44JMrTgeYWpK7fTmq9NxDSx1vv6RLdBKm/+/ANeQip6xgkt3A==
X-Received: by 2002:a2e:a992:0:b0:2cc:7814:11b with SMTP id x18-20020a2ea992000000b002cc7814011bmr2504641ljq.65.1705931340676;
        Mon, 22 Jan 2024 05:49:00 -0800 (PST)
Message-ID: <058e0b9f-51f8-4e20-a328-20b968e8ebb0@suse.com>
Date: Mon, 22 Jan 2024 14:48:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/8] serial: fake IRQ-regs context in poll handlers
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <33db57a2-b569-4fa8-b0b0-36ea92528d7b@suse.com>
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
In-Reply-To: <33db57a2-b569-4fa8-b0b0-36ea92528d7b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

In preparation of dropping the register parameters from
serial_[rt]x_interrupt() and in turn from IRQ handler functions,
register state needs making available another way for the few key
handlers which need it. Fake IRQ-like state.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The use of guest_cpu_user_regs() in dbc_uart_poll() is inconsistent with
other console poll functions we have, and it's unclear whether that's
actually generally correct.

Andrew suggested to move set_irq_regs() to BUGFRAME_run_fn handling;
it's not clear to me whether that would be (a) correct from an abstract
pov (that's exception, not interrupt context after all) and (b) really
beneficial.
---
v2: New.

--- a/xen/drivers/char/ehci-dbgp.c
+++ b/xen/drivers/char/ehci-dbgp.c
@@ -1253,6 +1253,7 @@ static void cf_check _ehci_dbgp_poll(str
     unsigned long flags;
     unsigned int timeout = MICROSECS(DBGP_CHECK_INTERVAL);
     bool empty = false;
+    struct cpu_user_regs *old_regs;
 
     if ( !dbgp->ehci_debug )
         return;
@@ -1268,12 +1269,17 @@ static void cf_check _ehci_dbgp_poll(str
         spin_unlock_irqrestore(&port->tx_lock, flags);
     }
 
+    /* Mimic interrupt context. */
+    old_regs = set_irq_regs(regs);
+
     if ( dbgp->in.chunk )
         serial_rx_interrupt(port, regs);
 
     if ( empty )
         serial_tx_interrupt(port, regs);
 
+    set_irq_regs(old_regs);
+
     if ( spin_trylock_irqsave(&port->tx_lock, flags) )
     {
         if ( dbgp->state == dbgp_idle && !dbgp->in.chunk &&
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -211,10 +211,14 @@ static void cf_check __ns16550_poll(stru
 {
     struct serial_port *port = this_cpu(poll_port);
     struct ns16550 *uart = port->uart;
+    struct cpu_user_regs *old_regs;
 
     if ( uart->intr_works )
         return; /* Interrupts work - no more polling */
 
+    /* Mimic interrupt context. */
+    old_regs = set_irq_regs(regs);
+
     while ( ns_read_reg(uart, UART_LSR) & UART_LSR_DR )
     {
         if ( ns16550_ioport_invalid(uart) )
@@ -227,6 +231,7 @@ static void cf_check __ns16550_poll(stru
         serial_tx_interrupt(port, regs);
 
 out:
+    set_irq_regs(old_regs);
     set_timer(&uart->timer, NOW() + MILLISECS(uart->timeout_ms));
 }
 
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -1164,6 +1164,7 @@ static void cf_check dbc_uart_poll(void
     struct dbc_uart *uart = port->uart;
     struct dbc *dbc = &uart->dbc;
     unsigned long flags = 0;
+    struct cpu_user_regs *old_regs;
 
     if ( spin_trylock_irqsave(&port->tx_lock, flags) )
     {
@@ -1175,10 +1176,15 @@ static void cf_check dbc_uart_poll(void
         spin_unlock_irqrestore(&port->tx_lock, flags);
     }
 
+    /* Mimic interrupt context. */
+    old_regs = set_irq_regs(guest_cpu_user_regs());
+
     while ( dbc_work_ring_size(&dbc->dbc_iwork) )
         serial_rx_interrupt(port, guest_cpu_user_regs());
 
     serial_tx_interrupt(port, guest_cpu_user_regs());
+
+    set_irq_regs(old_regs);
     set_timer(&uart->timer, NOW() + MICROSECS(DBC_POLL_INTERVAL));
 }
 


