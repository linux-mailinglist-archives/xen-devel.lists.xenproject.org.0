Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3002B9FFF38
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 20:04:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864409.1275618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTQUa-0007di-PW; Thu, 02 Jan 2025 19:04:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864409.1275618; Thu, 02 Jan 2025 19:04:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTQUa-0007bM-Ma; Thu, 02 Jan 2025 19:04:24 +0000
Received: by outflank-mailman (input) for mailman id 864409;
 Thu, 02 Jan 2025 19:04:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xoa/=T2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tTQUZ-0007bG-JG
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 19:04:23 +0000
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [2a00:1450:4864:20::443])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fcc4ff4-c93c-11ef-99a4-01e77a169b0f;
 Thu, 02 Jan 2025 20:04:21 +0100 (CET)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-385e2880606so8566968f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jan 2025 11:04:21 -0800 (PST)
Received: from [192.168.86.29] ([83.105.36.37])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c828e7asm38426846f8f.21.2025.01.02.11.04.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jan 2025 11:04:20 -0800 (PST)
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
X-Inumbo-ID: 5fcc4ff4-c93c-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1735844661; x=1736449461; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rb7FfLHcicmvieSspHR+ItqMa2mcY65KCqVAS5Vopqg=;
        b=st1ijp+zhAW31MJOkJXKoEaKNUiKiDCyJcg6J0ykC8qm93EMvgDtykFtAev1tJgp39
         152SVyv5qjIJ2fNX1EDYJK7SRO9xh9JflddD0x5KXfpV4nkzuntZTcOjaah5m5e+8JTm
         46vHDeWXrVf+MgruRNdGEx8gmR224CRpRjD90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735844661; x=1736449461;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rb7FfLHcicmvieSspHR+ItqMa2mcY65KCqVAS5Vopqg=;
        b=QMkW/SDbfNiDKqDz5e38V5RQF2YWx5pm6P4y9mWK5dgkuggqGDpri9KnW6HZbBWGnT
         QObbeHq4O8inNuthgBox4cDd1/eGY0mu85Yn6DP8f91tlmq3LTPEN/+mhFPPI8TqTptb
         Z531Jn0yIF0kolmtHdcrSrhLZCb6Fov2wp3hrRI7L8odRxVI3+2JDCysFDMfZqQULShH
         f+ABZqjh1dgxyghy85QRA771nbwDu5J6SmlzAQyHGLgUI0tGKoH4zdvdwcJB59uJ2qfV
         SQE1AamMoRVnL00YH7kCVw1Qk7JfhCJx69IYWpNaWcifWYv1nTSEtRxcc02XjZxQ13ts
         4fgA==
X-Gm-Message-State: AOJu0YwB3wnALUCbpG6g9eh+86GLxbb6D6vwr8ijxtlT7OtAzQUUQ4dx
	WjvTkB9151BJxNt3i9RIU05N1Rq7oCMRYyAngrwcDOMtLIqhRBmOeG+2O0EUjPo=
X-Gm-Gg: ASbGncsXTsy8ZHvGpYwNDBZ4HLnqLxQ8Lzdj594I+MIJcPg5jECERMKNaLxNam/lIgu
	R5Fu0IJXHDufYnkSxXkr/yHFhk2Xo/eFPFThNu6kr3EQsN/4XASXirAjK2M37dU+u+I2rItF2nz
	aQMEaowiiD4eguq94BAmqBSGHnqAa72fRN/DZI/2F7lB/pz6X+oiAt0P8RxEv3foWzcckJ8ILQ3
	jm2fmijjgo3AobHgZaNSNmH/djWBLB4fdQWqar8MCUtjS2x8jPyN8jVIRHcoD/GxYI=
X-Google-Smtp-Source: AGHT+IH019NJVRQMl8Gfpoo7RZvFdOINb0JTiHAUWV4JYtNxuTFwlzsz3joV82Pu42P06ZPwslMC+w==
X-Received: by 2002:a5d:6d84:0:b0:385:f66a:4271 with SMTP id ffacd0b85a97d-38a221e24f4mr39188851f8f.4.1735844660806;
        Thu, 02 Jan 2025 11:04:20 -0800 (PST)
Message-ID: <0be813be-b964-4ee7-b1c4-0d7da06d690a@citrix.com>
Date: Thu, 2 Jan 2025 19:04:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux 6.13-rc3 many different panics in Xen PV dom0
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <Z2RGfpJkO0z_nKV6@mail-itl>
 <ab9c27d5-f3f2-4b8a-960d-f880ec136199@suse.com>
 <6bb03333-74ca-4c2c-85a8-72549b85a5b4@suse.com> <Z3aFdrygLF9yK2EK@mail-itl>
 <Z3bg-gvaBEdSIuRW@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z3bg-gvaBEdSIuRW@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/01/2025 6:54 pm, Marek Marczykowski-Górecki wrote:
> On Thu, Jan 02, 2025 at 01:24:21PM +0100, Marek Marczykowski-Górecki wrote:
>> On Thu, Jan 02, 2025 at 12:30:10PM +0100, Juergen Gross wrote:
>>> On 02.01.25 11:20, Jürgen Groß wrote:
>>>> On 19.12.24 17:14, Marek Marczykowski-Górecki wrote:
>>>>> Hi,
>>>>>
>>>>> It crashes on boot like below, most of the times. But sometimes (rarely)
>>>>> it manages to stay alive. Below I'm pasting few of the crashes that look
>>>>> distinctly different, if you follow the links, you can find more of
>>>>> them. IMHO it looks like some memory corruption bug somewhere. I tested
>>>>> also Linux 6.13-rc2 before, and it had very similar issue.
>>>> ...
>>>>
>>>>> Full log:
>>>>> https://openqa.qubes-os.org/tests/122879/logfile?filename=serial0.txt
>>>> I can reproduce a crash with 6.13-rc5 PV dom0.
>>>>
>>>> What is really interesting in the logs: most crashes seem to happen right
>>>> after a module being loaded (in my reproducer it was right after loading
>>>> the first module).
>>>>
>>>> I need to go through the 6.13 commits, but I think I remember having seen
>>>> a patch optimizing module loading by using large pages for addressing the
>>>> loaded modules. Maybe the case of no large pages being available isn't
>>>> handled properly.
>>> Seems I was right.
>>>
>>> For me the following diff fixes the issue. Marek, can you please confirm
>>> it fixes your crashes, too?
>> Thanks for looking into it!
>> Will do, I've pushed it to
>> https://github.com/QubesOS/qubes-linux-kernel/pull/662, CI will build it
>> and then I'll post it to openQA.
> It is much better!
>
> Tests are still running, but I already see that many are green. There is
> one issue (likely unrelated to this change) - sys-usb (HVM domU with USB
> controllers passed through) crashes on a system with Raptor Lake CPU
> (only, others, including ADL and MTL look fine):
>
> [   75.770849] Bluetooth: Core ver 2.22
> [   75.770866] Oops: general protection fault, probably for non-canonical address 0xc9d2315bc82c3bbd: 0000 [#1] PREEMPT SMP NOPTI
> [   75.770880] CPU: 0 UID: 0 PID: 923 Comm: (udev-worker) Not tainted 6.13.0-0.rc5.2.qubes.1.fc41.x86_64 #1
> [   75.770890] Hardware name: Xen HVM domU, BIOS 4.19.0 01/02/2025
> [   75.770897] RIP: 0010:msft_monitor_device_del+0x93/0x170 [bluetooth]
> [   75.770924] Code: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 d0 65 21 <26> 2b 8b ad 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

es sub 0x3ad(%rbx),%ecx

I highly doubt that's an instruction that the compiler really put out
for this function.

The preceding bytes are "shlb 0x21(%rbp)" which isn't completely
implausible, but the surrounding 0's very much are.

This looks very fishy, and either looks like DMA hitting .text, or
module handling getting it's regions wrong.

~Andrew

