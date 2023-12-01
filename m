Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6D580141B
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 21:12:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645712.1007979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r99s0-0005tH-SK; Fri, 01 Dec 2023 20:12:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645712.1007979; Fri, 01 Dec 2023 20:12:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r99s0-0005qk-P3; Fri, 01 Dec 2023 20:12:16 +0000
Received: by outflank-mailman (input) for mailman id 645712;
 Fri, 01 Dec 2023 20:12:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lSip=HM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r99ry-0005qc-V8
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 20:12:14 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9dedf7f-9085-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 21:12:12 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40b2ad4953cso23576315e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 01 Dec 2023 12:12:12 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l3-20020a5d5603000000b00333371c7382sm346242wrv.72.2023.12.01.12.12.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Dec 2023 12:12:11 -0800 (PST)
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
X-Inumbo-ID: e9dedf7f-9085-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701461532; x=1702066332; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4c9p1UzylfeOvsY3GAXGAElNqsAViAFy9WFT4KoI0Kc=;
        b=SYwEjaqoftjp1JbS/D1M8VDUsASNwMnG8YPXufyCQv4tiXe2cDygcBjXyd7+NQr2es
         vY8XUiwqBbaThj549cJeTR+5hekcLynx3ht/uw9WuXcz0hgI41y63CAfVhCVQFMWfxXk
         95l0ad044VUWVy5yBTVVY99YiywZCTp3cFBGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701461532; x=1702066332;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4c9p1UzylfeOvsY3GAXGAElNqsAViAFy9WFT4KoI0Kc=;
        b=iFpuknObuf1s1V872j+A1GYczxgJaYxDd0L18VI/asE96pGP9FyUNqdORKORZYCwBm
         vCvxqxLMfr1/eph/2hChhQ2yGbL13O7Zp5DBrEf4S2+EM9MkzkWqfrf/bVHLlpcLG8DN
         z4v2uNlg2nWy/jT2kTFMlSYbJkCkkF4Nng3HddqhakVRDJ5ZzWBceI9koZP6dk5OaYC6
         U/0ir7aU5u6EM4SUGh3g3F8b/O14U3rTpepkPEQHYQUpTbOpdDb8bkjXmD3JBbpavl6v
         Dw2caPNE71zcBFTwT2CC/BTkimV/D4xxz8JKkDpQtLcIR2w/Mh+sVeTH56CY9JOqhC2X
         osYw==
X-Gm-Message-State: AOJu0Yx0x/WxGoVXNyrr/ivpZANuo2STT9Nl55ik2Dd/AbnOLw1QILGN
	mD/tx8XLu5uU2SLg2u+gGsy22w==
X-Google-Smtp-Source: AGHT+IFqFZcJopuO8yFGi7+kEJsphLDQLX3h6TjVTJjZgi8uSU5T7sk6KD/9LzdO4Wz1NkZImLkrxA==
X-Received: by 2002:a05:600c:3581:b0:40b:5e1f:c383 with SMTP id p1-20020a05600c358100b0040b5e1fc383mr1049373wmq.25.1701461531968;
        Fri, 01 Dec 2023 12:12:11 -0800 (PST)
Message-ID: <987b03e9-7a16-434a-a060-538dd5a6f045@citrix.com>
Date: Fri, 1 Dec 2023 20:12:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Trying add smt=off disabled cores to cpupool crash xen
Content-Language: en-GB
To: =?UTF-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ImC5JB7OjNgCNtCixZSzBIyXAyR0qI-DKWcm-w5YtHP_5aH71GA_zJK2C4AmA4_GtaYAKK6wGEM8YZ2THj2qLe9kFhjO5bEl8qoqRY8o9p4=@proton.me>
Cc: Juergen Gross <jgross@suse.com>, George Dunlap
 <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ImC5JB7OjNgCNtCixZSzBIyXAyR0qI-DKWcm-w5YtHP_5aH71GA_zJK2C4AmA4_GtaYAKK6wGEM8YZ2THj2qLe9kFhjO5bEl8qoqRY8o9p4=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/12/2023 7:59 pm, René Winther Højgaard wrote:
> If I set smt=off and try to configure cpupools with credit(1) as if
> all cores are available, I get the following crash.  
>
> The crash happens when I try to use xl cpupool-add-cpu on the disabled
> HT sibling cores.
>
> Hyper-threading is enabled in the firmware, and only disabled with
> smt=off.

CC'ing some maintainers.

I expect this will also explode when a CPU is runtime offlined with
`xen-hptool cpu-offline` and then added to a cpupool.

Interestingly, the crash is mov (%rdx,%rax,1),%r13, and I think that's
the percpu posion value in %rdx.

I expect cpupools want to reject parked/offline CPUs.

~Andrew

>
> Software: Xen-4.17.3 / Qubes OS 4.2.0-RC5
> Firmware: Dasharo 0.9.0 - Z790P
> Hardware: 13900K
>
> (XEN) ----[ Xen-4.17.3-pre  x86_64  debug=y  Not tainted ]----
> (XEN) CPU:    6
> (XEN) RIP:    e008:[<ffff82d040248f89>] schedule_cpu_add+0x50/0x456
> (XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor (d0v3)
> (XEN) rax: ffff82d0405a9288   rbx: ffff83107f5a1980   rcx:
> 0000000000000020
> (XEN) rdx: 80007d2fbfa59000   rsi: ffff83107f5a1980   rdi:
> 0000000000000020
> (XEN) rbp: 0000000000000009   rsp: ffff831087d3fc68   r8:
>  0000000000000000
> (XEN) r9:  ffff82d0405b6b60   r10: ffff831087d22ab0   r11:
> 0000000000000003
> (XEN) r12: ffff831087d22ab0   r13: 0000000000000020   r14:
> ffff831087d22ab0
> (XEN) r15: ffff82d0405ae680   cr0: 0000000080050033   cr4:
> 0000000000b526e0
> (XEN) cr3: 0000000912e30000   cr2: 000072e5cb008375
> (XEN) fsb: 000072e5caac7380   gsb: ffff8881b9d80000   gss:
> 0000000000000000
> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
> (XEN) Xen code around <ffff82d040248f89> (schedule_cpu_add+0x50/0x456):
> (XEN)  db 8e 37 00 48 8b 14 ca <4c> 8b 2c 02 3b 3d 75 f0 1f 00 0f 83
> c9 01 00 00
> (XEN) Xen stack trace from rsp=ffff831087d3fc68:
> (XEN)    ffff83107f5a16e0 ffff82d040204c3b ffff831000000018
> ffff831087d3fd28
> (XEN)    ffff831087d3fcc8 3431831087d3fcd0 ffff83107f002033
> ffff831087d3fcd0
> (XEN)    0000000000000000 ffff831087d40d70 ffff82d040246d48
> 0000000000000000
> (XEN)    ffff83107f5a1980 0000000000000009 ffff831087d22ab0
> 0000000000000020
> (XEN)    ffff831087d22ab0 ffff82d0405ae680 ffff82d040235dec
> ffff831087d3fe20
> (XEN)    00000000ffffffed 0000000000000009 ffff83107f5a1980
> ffff82d040236b05
> (XEN)    0000000000000000 0000000000000000 000072e5cb098010
> ffff831087d3ffff
> (XEN)    0000000000000000 ffff82d04045d5d8 ffff82d040234763
> 00000000c0000102
> (XEN)    0000000000000000 0000000000000000 00000000c0000102
> 0000000d00000000
> (XEN)    ffffffff8101ede6 000000000000e033 0000000000011082
> ffffc90043c1fb00
> (XEN)    000000000000e02b 11e6f31d9b4cbeef 96994088d9fcbeef
> 7d897394f3ecbeef
> (XEN)    c501dd1632b4beef ffff82d040227cc6 ffff831087d3fe48
> 0000000000000000
> (XEN)    0000000000011082 0000000000000000 ffff831087d3ffff
> 0000000000000000
> (XEN)    ffffffff8101ede4 ffff82d0403495d0 0000001500000012
> 0000000200000004
> (XEN)    0000000000000000 0000000000000009 000072e5cad9cb60
> 7be382ddb0c16b00
> (XEN)    0000000000a97768 0000000000a97150 0000000000000000
> 00007ffe90589abc
> (XEN)    00007ffe9058a780 000000000043d990 000000000043d9b0
> 000072e5cad20434
> (XEN)    00007ffe90589ac0 000072e5cafa3f79 0000000000000008
> ffff831087d3fef8
> (XEN)    0000000000000023 ffff83107f52b000 0000000000000000
> 0000000000000000
> (XEN)    0000000000000000 ffff82d0402dd07f ffff83107f52b000
> 0000000000000000
> (XEN) Xen call trace:
> (XEN)    [<ffff82d040248f89>] R schedule_cpu_add+0x50/0x456
> (XEN)    [<ffff82d040204c3b>] S debugtrace_printk+0x119/0x2cc
> (XEN)    [<ffff82d040246d48>] S free_affinity_masks+0x15/0x17
> (XEN)    [<ffff82d040235dec>] S
> cpupool.c#cpupool_assign_cpu_locked+0x53/0x160
> (XEN)    [<ffff82d040236b05>] S cpupool_do_sysctl+0x367/0x760
> (XEN)    [<ffff82d040234763>] S do_sysctl+0x827/0x1269
> (XEN)    [<ffff82d040227cc6>] S timer.c#timer_lock+0x69/0x143
> (XEN)    [<ffff82d0403495d0>] S x86_emulate_wrapper+0x24/0x56
> (XEN)    [<ffff82d0402dd07f>] S pv_hypercall+0x3a2/0x4a9
> (XEN)    [<ffff82d0402012b7>] S lstar_enter+0x137/0x140
> (XEN)
> (XEN) debugtrace_dump() global buffer starting
> (XEN) wrap: 0
> (XEN) debugtrace_dump() global buffer finished
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 6:
> (XEN) GENERAL PROTECTION FAULT
> (XEN) [error_code=0000]
> (XEN) ****************************************
> (XEN)
> (XEN) Reboot in five seconds...
>
> /rene


