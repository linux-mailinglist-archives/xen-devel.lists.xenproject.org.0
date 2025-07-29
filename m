Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D311B14A18
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 10:29:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062179.1427811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugfhJ-0006eC-TL; Tue, 29 Jul 2025 08:28:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062179.1427811; Tue, 29 Jul 2025 08:28:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugfhJ-0006cU-QY; Tue, 29 Jul 2025 08:28:33 +0000
Received: by outflank-mailman (input) for mailman id 1062179;
 Tue, 29 Jul 2025 08:28:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/H3U=2K=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ugfhI-0006cO-8s
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 08:28:32 +0000
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [2a00:1450:4864:20::443])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff715d82-6c55-11f0-a31e-13f23c93f187;
 Tue, 29 Jul 2025 10:28:26 +0200 (CEST)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-3b78b2c6ecfso949079f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 01:28:26 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b785258135sm7580334f8f.42.2025.07.29.01.28.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 01:28:25 -0700 (PDT)
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
X-Inumbo-ID: ff715d82-6c55-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753777706; x=1754382506; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HLPxGQBm01I9P9MpoHaupZskGUuu3lMVor+50lANu14=;
        b=I2eVgyeLS4H6FpL3oynUMgc2XwKLj0MjOgukWYyuIAVfjoarvO6FSpRGt5EY7NWDnb
         /5dsMrRjtZtRMf/YmLvoF8YKzN+hQCvX/IFIwghaNWf3HUnO2DHkJ+oLnTcsyIgMu4PJ
         rBS7wp2EuHynfzsmRQE/9NuAwr/Yv9XVQiPg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753777706; x=1754382506;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLPxGQBm01I9P9MpoHaupZskGUuu3lMVor+50lANu14=;
        b=b+fLRi2G6cPqC5QYQ6/fDn39McgwKMM3jiaj5OTPJmkQf3xsPiAdEM03BtwXrHzTcb
         MC9ula4ZS+GaVXr3mgN6gapDxLm5Hx2sHpJVyYwBR8Ta4DM9Tqbi7d4u3CIJAzJYx5Hl
         xeRiZQil/xh6z2vQpSiILRB34lDncpML5yANAtRTI52To/HB0RqV6qrturTQvpAbe8rc
         EUluEk7WKX2dxhRU7JywTRwoBBNg31Y0/IYLniHwH8QB/kAKVhkt+MhwetEaanq9fkTC
         mVMGCtKAPOhRJKn3sLdu79kzyVWlGJLKNdvEnRwKwsHJx/zHNqUaf4nmTDsyD78Jh2sH
         KJ2w==
X-Forwarded-Encrypted: i=1; AJvYcCWGFBC4bxdx0fB50ain7HA2OHIGtWtJBb/KVchABFxRuHwaknly9y/lZGI8hWuDEN6Qg0UC9UKGBe8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwmLtsvhwC0r2CuVGxuiW2uV2a7wD6NYFhmLJD8ew34DBWvVkPh
	LJtF3cHR9XNz9ljmylHIqScSVEqA7AvwLQL+utwARP7gMF9Nr3lOxEFKMywcNX7Q3qCJwHYN7jC
	IbHkieYdVQg==
X-Gm-Gg: ASbGnctIzzxgCNrABvzBUk28onkM5OGOOvRZxzc4+r/7Fr00tB3W3kiyjBsE1SjEOEd
	aD8PeNRpWZSz8DtNJUH9/eYAKej5BCJ7b9cn5Z1O4M0yXGes/lIUBe6ojtXtjQU869y9UL1roiR
	xwLr1o9Ngfv4qx5rTDuxJqvS+Oh49J/vsCQFpKJ9ekQVsk6OLaLRjkKbGOkyD1+dfvn8f0nV80I
	2oyW1yefpSesC8hO/ieFIprWq9jAVT4m31B2T/5CEawp/VlcQtTbwqq15TEDn+/7decxydFDZOZ
	gPaZtGIM29y/6o3T06O9hTzspAvwacztRyVJBzgCoiqjFhC5477Qqh5RJ14YkLBdhnq+UnxaWS+
	2oEXCE0ugzy+EkdroyW/NOa7OIqLlZAmP0WYq4AwTXUBisSRrG+nCFT3cGznCmKG0aKgT
X-Google-Smtp-Source: AGHT+IHGzn5e91+bqP4+gN/VeKY95pnVfdtqLHr9R4XkRQFnk4napHK8Nd6m1G80NZz/91BaYrJK/w==
X-Received: by 2002:a05:6000:4022:b0:3a4:d6ed:8df8 with SMTP id ffacd0b85a97d-3b7767765a2mr12164173f8f.39.1753777705801;
        Tue, 29 Jul 2025 01:28:25 -0700 (PDT)
Message-ID: <071099d1-5fe7-49ae-bd81-9362772c76d6@citrix.com>
Date: Tue, 29 Jul 2025 09:28:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] drivers/ns16550: remove use of
 run_in_exception_handler()
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com
References: <20250728202300.1017904-1-dmukhin@ford.com>
 <20250728202300.1017904-3-dmukhin@ford.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250728202300.1017904-3-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/07/2025 9:23 pm, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
>
> Polling is relevant for early boot only where facilities requiring
> run_in_exception_handler() are not used (e.g. 'd' keyhandler).
>
> Rework ns16550_poll() by droppping use of run_in_exception_handler().
>
> The ground work for run_in_exception_handler() removal was done under XSA-453:
> https://xenbits.xen.org/xsa/advisory-453.html
>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

I wanted to do a before/after comparison, but interestingly I can't even
get poll to trigger.

(XEN) Wallclock source: CMOS RTC
(XEN) 'd' pressed -> dumping registers
(XEN) 
(XEN) *** Dumping CPU0 host state: ***
(XEN) ----[ Xen-4.21-unstable  x86_64  debug=y  Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<ffff82d040203160>] __x86_return_thunk+0/0xea0
(XEN) RFLAGS: 0000000000000206   CONTEXT: hypervisor
...
(XEN) Xen call trace:
(XEN)    [<ffff82d040203160>] R __x86_return_thunk+0/0xea0
(XEN)    [<ffff82d040268e75>] S drivers/char/ns16550.c#ns16550_setup_postirq+0x3f/0x61
(XEN)    [<ffff82d0406175e6>] F drivers/char/ns16550.c#ns16550_init_postirq+0x15f/0x311
(XEN)    [<ffff82d0406199c6>] F serial_init_postirq+0x21/0x5f
(XEN)    [<ffff82d04061722b>] F console_init_postirq+0x9/0x59
(XEN)    [<ffff82d040641e5f>] F __start_xen+0x1bf0/0x23ba
(XEN)    [<ffff82d0402043be>] F __high_start+0x8e/0x90
(XEN) 
(XEN) Allocated console ring of 16 KiB.
(XEN) HVM: ASIDs enabled.


The backtrace is weird because of speculation fixes.  We're actually in
ns_write_reg() having just enabled receive interrupts.  (Maybe we should
have LER active by default in debug builds when retthunk enabled, so we
can see which function we were really in.)

Back to the stacktrace, this is as we're turning interrupts on, rather
than during preirq.  Digging into the code, the thing which starts
polling off is:

    init_timer(&uart->timer, ns16550_poll, port, 0);

in ns16550_init_postirq(), which seems wrong.

__ns16550_poll() (renamed in this patch) discards the timer as soon as
uart->intr_works is seen, and that's clearly coming through ahead of the
timer first firing.

So, polling is activated automatically in init_postirq(), and turns
itself off when the first interrupt is seen.  (This now explains the
weird behaviour I saw when working on the FRED series.)

Doesn't this mean that when there's no input to the console, we've just
got a timer firing every uart->timeout_ms?

Irrespective of ^, we should take the timer out of the timer list when
we're done with it.

~Andrew

