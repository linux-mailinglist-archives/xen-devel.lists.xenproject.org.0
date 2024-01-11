Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 202EB82B484
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 19:08:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666467.1037125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNzSy-00032f-AG; Thu, 11 Jan 2024 18:07:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666467.1037125; Thu, 11 Jan 2024 18:07:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNzSy-000303-7U; Thu, 11 Jan 2024 18:07:44 +0000
Received: by outflank-mailman (input) for mailman id 666467;
 Thu, 11 Jan 2024 18:07:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YPRU=IV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rNzSw-0002yk-QE
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 18:07:42 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4dcea389-b0ac-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 19:07:38 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40b5155e154so72268745e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 10:07:38 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f1-20020a5d6641000000b0033609584b9dsm1788483wrw.74.2024.01.11.10.07.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 10:07:37 -0800 (PST)
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
X-Inumbo-ID: 4dcea389-b0ac-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1704996458; x=1705601258; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+iF8o0/xbuMuQ0SG4Z3/J+WbK7BiSrX1PdDKAboasaI=;
        b=RRRgoRudbGc/ARJlmnSvBC80ZPX/CNNTz/CxCKPPgbWegchoEk08rZmFOJEn6feqzq
         bUI2vFfWglIovPzsj9MyMxMqtNbmZXP6FdOB/DZ1x3BRrXQ8Onxl9GTJ/GFlMEiT+EEB
         /Hjcg3PYboFxTpy5nG7CYIZKCwCHmg3dC9Fd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704996458; x=1705601258;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+iF8o0/xbuMuQ0SG4Z3/J+WbK7BiSrX1PdDKAboasaI=;
        b=ecLaHiuWzOiA7wZRT5YhNJNgQMKx5IXFfPpFnxTPcOZ7VM69bftXpSTPTIxkIO/GBJ
         AIfWT6AS1lN+0u2Jghy3V+d0CUVpTzS4Y2jij66ryt21F0hG0cBtKT3snG0vPDLim9FQ
         4fpTXmcUn6PzWkLK8yC2I7Uc7svPmN9xZSjmCxdWzbjz31pT9J02lo/Vhvep3dninoqz
         Tm0tNxybyfa9C03PEo+afcgyLeDa4wtxwFIZPPij2oMSRqbdVpNaTWVsfjZ7OO8JTF2n
         yQL+uWfGZ/GQE2a4AC+5bNVuqlEBRV8uKShhLQizxx8pSR3myM86dz/U/UU0j3voyfvM
         8olA==
X-Gm-Message-State: AOJu0YxG1hux4A4/u1M+7v1FxabGHtXVlwa7mthvNJ7nfsN7co1kdySV
	Pw9eoDVGsDQjD+uXeIbC4cJQF0TtFgfsVg==
X-Google-Smtp-Source: AGHT+IGz8FcUfBAS2VgPqUcr3TMelgNYPXmvsXvmYLh8nwCDiP/jrtcYSqITZ5Aqxg7p+tLX+9JyiA==
X-Received: by 2002:a05:600c:4446:b0:40e:3654:29f4 with SMTP id v6-20020a05600c444600b0040e365429f4mr109047wmn.32.1704996457750;
        Thu, 11 Jan 2024 10:07:37 -0800 (PST)
Message-ID: <485553fc-b91f-4a35-b01f-8bbd5964276b@citrix.com>
Date: Thu, 11 Jan 2024 18:07:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] serial: drop serial_[rt]x_interrupt()'s regs
 parameter
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <1ab231ec-5e3c-4662-8530-2213bc52bb7c@suse.com>
 <05b1284a-988c-4f91-9cde-4751332aaa96@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <05b1284a-988c-4f91-9cde-4751332aaa96@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/01/2024 7:34 am, Jan Beulich wrote:
> In the the polling functions (ab)using set_irq_regs() is necessary
> to balance the change.

I have to admit that I don't know what "balance the change" is supposed
to refer to in this context.

> --- a/xen/drivers/char/ehci-dbgp.c
> +++ b/xen/drivers/char/ehci-dbgp.c
> @@ -1268,11 +1269,16 @@ static void cf_check _ehci_dbgp_poll(str
>          spin_unlock_irqrestore(&port->tx_lock, flags);
>      }
>  
> +    /* Mimic interrupt context. */
> +    old_regs = set_irq_regs(regs);
> +
>      if ( dbgp->in.chunk )
> -        serial_rx_interrupt(port, regs);
> +        serial_rx_interrupt(port);
>  
>      if ( empty )
> -        serial_tx_interrupt(port, regs);
> +        serial_tx_interrupt(port);
> +
> +    set_irq_regs(old_regs);

Looking at this logic, it has occured to me that patch 2 probably ought
to have ASSERT(!local_irqs_enabled()) in set_irq_regs().  While the main
arch irq dispatch can reasonably have it as an implicit expectation,
uses like this could do with the check.


This construct is very nasty.  What actually needs it?

If it's only handle_keypress(), isn't there a latent issue between patch
3 and 5, given that patch 3 uses set_irq_regs() before this patch sets
it up?

Might it be better to do this in the main handling of BUGFRAME_run_fn,
rather than at a few select users?  We're already abusing
BUGFRAME_run_fn to set up an IRQ-like context for these poll functions.

I suppose a different question is what it would take to get rid of
this.  Is it something a bit more cleanup would solve, or is there some
more fundamental untangling required?


> --- a/xen/drivers/char/xhci-dbc.c
> +++ b/xen/drivers/char/xhci-dbc.c
> @@ -1175,10 +1176,15 @@ static void cf_check dbc_uart_poll(void
>          spin_unlock_irqrestore(&port->tx_lock, flags);
>      }
>  
> +    /* Mimic interrupt context. */
> +    old_regs = set_irq_regs(guest_cpu_user_regs());

This is not a bug in your patch, but...

The use of guest_cpu_user_regs() here is different to all the other poll
functions.  Is this actually correct?

If we're really in interrupt context and then we fake up a poll like
this, then we don't have a total order of frames recorded in the
irq_regs pointer.  I can't see a specific issue, but it also doesn't
feel as if it is something we should allow.

~Andrew

