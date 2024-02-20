Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D88A85B5EA
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 09:53:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683258.1062700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLrx-0002HV-2D; Tue, 20 Feb 2024 08:52:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683258.1062700; Tue, 20 Feb 2024 08:52:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLrw-0002FB-VI; Tue, 20 Feb 2024 08:52:52 +0000
Received: by outflank-mailman (input) for mailman id 683258;
 Tue, 20 Feb 2024 08:52:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSgb=J5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rcLrv-0002F1-Gq
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 08:52:51 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6cb49d55-cfcd-11ee-98f5-efadbce2ee36;
 Tue, 20 Feb 2024 09:52:49 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33d066f8239so2400258f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 00:52:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w14-20020adfcd0e000000b0033d14c96ec1sm12607957wrm.45.2024.02.20.00.52.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 00:52:48 -0800 (PST)
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
X-Inumbo-ID: 6cb49d55-cfcd-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708419169; x=1709023969; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WRod7K1c22IPHMjkp91uZ7nODYMwBBoK3lXCfwDbDuI=;
        b=aip4Y3F4NXVJyTTIb7c3oEiYSHFXiNPPMpPIodVp2NvONU59jEPhAPeSaFufdP4Ycf
         n9CMY4agsSxSchxxvFGKbhpgtBHpAkyJBW2LanWGbxIstkAbNzY7zk8WyLmqHJGS19Yn
         qUmN+mnxkWyDsQhqZ+fLykn/EVKzpxefFIvKbxlGYmLWCYIbWemLa73uQ17PDBHCTu3m
         2DT+lW6CTSAJfa+b0X2FnhLg8zQCn8vOo6R3oytd/eRM4o5TPiSmp8dPD4TimbvuUHJ6
         Rj2fi4ohng09hYDr16M8a204AWYPOcDTbPQ+lJ0XbSRAogYEon0qd/F/YNvLFWKGNxTn
         4sJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708419169; x=1709023969;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WRod7K1c22IPHMjkp91uZ7nODYMwBBoK3lXCfwDbDuI=;
        b=nVOkmC3rAmBAnua82VXcDik0rLfBcOgft4ZVaMT4P9w6vDWioZ0MMgtDVYSnUHloDJ
         g+5PIvP1ekKCyeZP/TIJrBOAFbe8J6OfET91ywpufwX/BWMDtJh5oGPLzTYB27kGn1gW
         3ZOXG67dtbRhwxA02zMSIw8gcc/ZjWNtBW76eA2MavNiVB2SRuTis7lvXPGbjUyAGK0O
         EOy4hbZY1+sHnXnnxenBmzabiQNWjFzbdl3TnIeGGBKcwyhkMadvx5gJFGew2kEg5p2P
         UoA09iYmqmhVmp5TAVc/1Mozi++3hHVZIOnzV42RSA3wI7lVnSAHnvNGN7wBMGFfAqfK
         uo9Q==
X-Gm-Message-State: AOJu0YwDyq5YVUi42HJEV9VhgyCWu7fxa/ddB33WEZlt/nhs1cH5LtuD
	RHHjiRUJjfkRFTfXSZqshWUS1PE76g8rpcGL4yEMENm7L2WJqUpGCu5fsgK7XZ4AyF/NOkF2PoA
	=
X-Google-Smtp-Source: AGHT+IEpHdJFuqVJhMhY5pj5+YOKKSzQlBfKrUOA5rRUTJ7UfOR2TR9gjLx4gSRka+z2g1v92KZ+7w==
X-Received: by 2002:adf:e450:0:b0:33b:60ca:269f with SMTP id t16-20020adfe450000000b0033b60ca269fmr9573558wrm.43.1708419169003;
        Tue, 20 Feb 2024 00:52:49 -0800 (PST)
Message-ID: <a3644326-7514-40f9-939c-2b6294dc5a8b@suse.com>
Date: Tue, 20 Feb 2024 09:52:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 1/8] serial: fake IRQ-regs context in poll handlers
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <e5f62a45-5b68-404d-908e-909f84f87b44@suse.com>
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
In-Reply-To: <e5f62a45-5b68-404d-908e-909f84f87b44@suse.com>
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
actually generally correct. It is only for this reason that it doesn't
need changing here.

Andrew suggested to move set_irq_regs() to BUGFRAME_run_fn handling;
it's not clear to me whether that would be (a) correct from an abstract
pov (that's exception, not interrupt context after all) and (b) really
beneficial.
---
v4: Drop xhci-dbc.c change as unnecessary with dump_registers() falling
    back to using guest_cpu_user_regs() as of patch 2, i.e. ahead of
    serial_rx_interrupt() having its 2nd parameter dropped.
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
 


