Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 859E5849BBD
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 14:27:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676035.1051796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWz0a-00020C-Eb; Mon, 05 Feb 2024 13:27:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676035.1051796; Mon, 05 Feb 2024 13:27:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWz0a-0001xp-Bf; Mon, 05 Feb 2024 13:27:36 +0000
Received: by outflank-mailman (input) for mailman id 676035;
 Mon, 05 Feb 2024 13:27:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rWz0Y-0001wW-CR
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 13:27:34 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 517f0cfd-c42a-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 14:27:33 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40efcb37373so40352735e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 05:27:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n10-20020a5d67ca000000b0033b3cf1ff09sm2278382wrw.29.2024.02.05.05.27.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 05:27:32 -0800 (PST)
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
X-Inumbo-ID: 517f0cfd-c42a-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707139652; x=1707744452; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ozjB5J6HgFQRbYi1xrcNJWW3dzIQpHOtBsFN5IPmgeU=;
        b=N75r1lEm7ZV9bxdme4uvOMyOHqMFOzF7yv2Tgdrszlyi/i5foX1lCjC/f3Au3suE81
         0092pC5hJqJm500JFPWSOb9aO3Q9BUVSArWmXKyzrgkmJIpt+BwLUoSpEHOZ1p2tAMH/
         jfTTRAb7HdnPG7qT8NuDsynUgR34iNKY7TbzlgLTPy9bX1DwxAl+S4KU9WUK/Oi0908f
         1rl6cone2cyWgvLIrSw/Rq+0MHAQySZmVu6F7jjGl+aTYLTgOG4Yz2zWjbcusiB/GBtB
         Lp5ywGM+AKPR/HDbr3Sbaa0mHxYyQP7Q8zhuyAV+o5gvksHTdBKydCk/62f9c2gSrzOw
         JObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707139652; x=1707744452;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ozjB5J6HgFQRbYi1xrcNJWW3dzIQpHOtBsFN5IPmgeU=;
        b=omVhkbYJRBt5CiVuwoX0P8eUKOxQ4aAhKkAQYP4PI+qvXtABuL5QTnP1neXeJliYqd
         HrzDwjUEkTzRT+3gHAUZZXoodOkRmimzQRfgcb7Ip460OriioHmwCk28UqfP6ZrNDPv5
         a6kgAueE5D1s/oumIAeyIULIDMUbV5kyTxgi2AbRSs4z/OuUamJLwrDlWusR3dUrj+SG
         RBBQ63rVmxtukxlnoXyWHLZMp3/W9oGIpeGXiTdOKHpc2mfls8qPH6tvgFZCKmzmEO6n
         L71TUdO5UwXUGGrIy8DN0hC3R6TgbTNIly8QKuvQpXfKLq5m9DpTzoIA5L9AXyqiod44
         VAOw==
X-Gm-Message-State: AOJu0YwKKh3z7hi9Pxcyjew9aJwx//e6qctGQD2IJfCJSfDQlP6Eoqd6
	IRSJc6EuzcZni2qNCzugWt5JoCEN7x95VCjmxp/5EswpWMxnPZvuHZjomBhliUrNtb+Q0Qp3kAM
	=
X-Google-Smtp-Source: AGHT+IGc3yD9tlPmWCc3rLBakfLjqIRUvsu9Jtp9Vlhp7n5P7rswL2RvRIzw6bwThJ4Qnw9t60xh9w==
X-Received: by 2002:adf:fccf:0:b0:33b:1bf4:de87 with SMTP id f15-20020adffccf000000b0033b1bf4de87mr6880273wrs.24.1707139652555;
        Mon, 05 Feb 2024 05:27:32 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWN/NZWe1fmN3Ql8B3HxMKepciFXQzWxSSKE0lF+fPsQqQGpFYQvehBVCvgG1cYu8iiDVvdRU6jC2HNAOMkMIL0I9j93NgMDarT8SBQIGFODpqRguKxjpMuEkhw1E/RAv1wT9iSG/tNGPj+T5Rs7xTtpEj7fQvh07ft0TkoLLiebm4kxcDKtVX41UpMYTR77p4xrBi8Wp5gW//wYsXO
Message-ID: <893be03d-22cc-4b8c-8a54-6479961c5aa2@suse.com>
Date: Mon, 5 Feb 2024 14:27:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 1/8] serial: fake IRQ-regs context in poll handlers
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <ebc330a9-eafa-4858-b5cf-5694c4da911d@suse.com>
Content-Language: en-US
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
In-Reply-To: <ebc330a9-eafa-4858-b5cf-5694c4da911d@suse.com>
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
 


