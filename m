Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CC29D9FDC
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 00:57:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844456.1259965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG5Qs-0004n5-O8; Tue, 26 Nov 2024 23:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844456.1259965; Tue, 26 Nov 2024 23:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG5Qs-0004lC-L4; Tue, 26 Nov 2024 23:57:26 +0000
Received: by outflank-mailman (input) for mailman id 844456;
 Tue, 26 Nov 2024 23:57:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zdLj=SV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tG5Qq-0004ko-Kq
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 23:57:24 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ba763ef-ac52-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 00:57:19 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-38232c6311fso4154153f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 15:57:19 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fafe207sm14655667f8f.36.2024.11.26.15.57.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 15:57:17 -0800 (PST)
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
X-Inumbo-ID: 2ba763ef-ac52-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzAiLCJoZWxvIjoibWFpbC13cjEteDQzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjJiYTc2M2VmLWFjNTItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjY1NDM5LjQ2NDY4Nywic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732665438; x=1733270238; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t+C3y/3deXe5FvWAbGkxXZsARH4fUV6hi+SPx0ceH6Q=;
        b=tsbtJR5dWFhmbLR4R0z7pxBk83rzrk/KGEzXK9T3HqCAQXwjXZb4692pD+Rk8jSJB7
         D/h5OBvqFF1iCqPHkCk4ZLuVOgkvAQhe255V7ocgV1suwo2yGZ3c1Unt8izhNuqzj1qU
         Hv4BYq6c2drO7vG/W4w7CCgY9WvlY2IRuftiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732665438; x=1733270238;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+C3y/3deXe5FvWAbGkxXZsARH4fUV6hi+SPx0ceH6Q=;
        b=KaQFrdGdK50wbMuD3fprtP0M51zRX/v/coIz7RPlNkg1trF6etPk3OE4bt5ouu0Pd8
         MEanMRdXGkNvbhw7XjoUytax58dMB/m1xqw1lB8MI49PAQwt8H1rBESeiy3eut+cqAj8
         YghSHXqGe6ENIvIs2ZmGCKP65i2pTLo6Lju8ub+dWF0Am4pjDiQy1UUR5u0Wz3NmbOzo
         3nHuhYI6qQsbXAc+7H2xRvIYjgkpxk+rlBhzcM61SPVZA6p6VcaRSsqZtlogQMqpls69
         kya1OFqiBqKeQKCJ6Pt20EZm9CbmHqAHpFxAxDbc3xO7wtoohw/S03l6Ix/LY+/no05p
         Ntmg==
X-Gm-Message-State: AOJu0Yzz3a8W7hNkVVTpbiBR7EfYFQAjf/W+HVjIyDkGkkLvatEAhim/
	Nx1S7VInnyCb9+LG3iwnqy5+VK0DkX+iiBsJEUoloHalZWz0qMpSKXjjgwwTPxw=
X-Gm-Gg: ASbGnctbPxk2IMMtnd9mOL7HOv35yOBFSlQ+m53qzAdHhOyNZgi5u82EvNK695ezR4Y
	GjhcTuCCmMXDk6IJNIUv1e8JJYDHyBNhK0U2Yt1Fo5Fc0hH0aWA3ofwQ2PDQ/v5gmjwGhNycQdM
	khNGz7TK/Pg/lAkOEjdn3uO+l9eAU10gfD+71o4YZVSOak+Mc9c5iTM/ba3TQJHKsp2TuzsryYj
	V9ze/B3T8tWMt/N6E06on3bgHZhYbpshKmRHrSMaAe1cqZ8L6JA/F3txsL3cUruVKEAmmWxwcQC
	OHg6kz2IkX+CkA==
X-Google-Smtp-Source: AGHT+IH34HGTrZhgHynb4PwHxCnqR+bEOTY/Xpaw1qrIRNkhiEnHiAF+8gjfKixH+15dMuXGj7woug==
X-Received: by 2002:a5d:64c6:0:b0:37d:4706:f728 with SMTP id ffacd0b85a97d-385c6ef476fmr482019f8f.50.1732665438579;
        Tue, 26 Nov 2024 15:57:18 -0800 (PST)
Message-ID: <c08bd940-a2eb-4fb8-9f8d-2c5f3f1fab54@citrix.com>
Date: Tue, 26 Nov 2024 23:57:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/36] Introduce NS8250 UART emulator
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Connor Davis <connojdavis@gmail.com>, Juergen Gross <jgross@suse.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 David Scott <dave@recoil.org>, Rahul Singh <rahul.singh@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/11/2024 11:21 pm, Denis Mukhin via B4 Relay wrote:
> The patch series introduces initial in-hypervisor emulator for
> NS8250/NS16x50-compatible UARTs under CONFIG_HAS_VUART_NS8250.
>
> In parallel domain creation scenario (hyperlaunch), NS8520 emulator helps
> early guest OS bringup debugging, because it eliminates dependency on the
> external emulator being operational by the time domains are created. Also,
> there's no early console facility similar to vpl011 to support x86 guest OS
> bring up.
>
> The NS8250 emulator is disabled by default.
>
> Series
> ======
> - patches 1-2: some miscellaneous random fixes, added into the series
>   because I stepped into those while debugging NS8250 emulator.
>
> - patches 3-14: preparation fixes for xen console and NS8250 emulator.
>
> - patches 15-29: xen console driver cleanup and preparation for enabling
>   physical serial console focus assignment to the guest VM w/ virtual NS8250.
>
> - patches 30-36: initial NS8250 emulator. That adds the I/O port emulator
>   for legacy PC COM UARTs, Kconfig option, enabling emulator and libxl
>   plumbing.
>
> Limitations
> ===========
> - Only x86;
> - Only Linux guest tested so far;
> - Only legacy COM{1,2,3,4} resources, no customization;
> - Only Xen console as a backend, no inter-domain communication (similar to
>   vpl011 on Arm);
> - Only 8-bit characters;
> - Baud rate is not emulated;
> - FIFO-less mode is not emulated properly;
> - RX FIFO interrupt moderation (FCR) is not emulated properly, TL16C750
>   has special FCR handling;
> - No integration w/ VM snapshotting (HVM_REGISTER_SAVE_RESTORE() and
>   friends);
> - Assumes no ISA-device IRQ sharing;
> - MMIO-based UART is not supported.
>
> Testing
> =======
>
> I tested boot of HVM linux guest w/ OVMF as the virtual firmware.
>
> The emulator, if enabled via CONFIG_HAS_VUART_NS8250=y, will use COM1 (0x3f8)
> resources by default.
>
> To test w/ virtual COM1, the guest kernel parameters should contain
>   earlycon=uart,io,0x3f8,115200n8 console=uart,io,0x3f8,115200n8
>
> Xen is able to forward physical console input to the domain w/ virtual NS8250.
> To switch the console focus press Ctrl+aaa. If console= is given to the HVM
> kernel, then the user shall be able to see the login prompt on xen console once
> console focus is switched to the HVM guest.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Hello,

Thankyou for this.  It's an excellent start for first posting to the list.

Two things stand out at a glance.

First, xmalloc/free are the expected functions to use, and kmalloc/free
are not equivalent.  We have some drivers ported from Linux, hence the
compatibility, and if it needs to extend beyond smmu.c then there's
linux-compat.h where definitions can live, but we really don't want them
visible generally.

Second and more importantly, I'm afraid this won't pass CI right now. 
Your function pointees (e.g. ns8250_iir_check_lsi()/etc) need a cf_check
attribute on them, in order to function when running on CET-IBT capable
hardware.

From the root of the Xen tree, if you run:

CONTAINER=bookworm-x86_64-gcc-ibt ./automation/scripts/containerize

then you'll get a build environment with suitable diagnostics. 
Unfortunately we're still relying on an out-of-tree GCC patch to have a
compiler that can point out the problems at build time, as opposed to
encountering the #CP exceptions at runtime.


I'll try to have a closer look at the rest of the series tomorrow.

~Andrew

