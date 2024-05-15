Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E51858C666C
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 14:41:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722302.1126132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7DvN-0004hp-MS; Wed, 15 May 2024 12:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722302.1126132; Wed, 15 May 2024 12:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7DvN-0004f4-Ig; Wed, 15 May 2024 12:40:01 +0000
Received: by outflank-mailman (input) for mailman id 722302;
 Wed, 15 May 2024 12:40:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EWeN=MS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7DvL-0004di-Vr
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 12:40:00 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cd1bdcf-12b8-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 14:39:57 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56e69888a36so1644309a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 05:39:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c7da8sm858312266b.99.2024.05.15.05.39.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 05:39:56 -0700 (PDT)
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
X-Inumbo-ID: 3cd1bdcf-12b8-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715776797; x=1716381597; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RRZIdD1PNnstrzGUpN0wWe5cyhSUkt1nQ1HDw0F7er0=;
        b=deS54PoYealClqpwQ9KesEi6VZhxPaBPU9CFdVerowozzQ1gcLXW2G7Ti3dudHpvY6
         F0Kd8HAxnCBt2EBP70YEm+ZCVjUx0sOdLGCBktIXp0e8EtZmdKTZZuQb2yWR0Ovbm2v6
         G3rncWED6ay5VnAs/W6WW77Hz8Cv9OKNBqMRXXjb8DODIOZPjVZzVZ3YuKsR5HIkoHfM
         TQ30KbRLEsOm2OqZ7lhCU+bXO43qGxYQiSbU4tM4Umcbai126IJ345eTLdogh/zehx7D
         pUCMy02IV41KaUFTj9rm3ql4Uw0reV92uoOYHZjTxpaGJ8B4QenVRRsOMshsxmuFslwk
         zC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715776797; x=1716381597;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RRZIdD1PNnstrzGUpN0wWe5cyhSUkt1nQ1HDw0F7er0=;
        b=RYr0h+xC/2C2fd08FfXrw0pZYXfiiIGwiLtZsTmz8Jjmax359A5AAZusOekh69hMCO
         QHK71ZUEVz+cIEsUV8mZ9JAQkWz7CByF71OIlkLESu5WCEqzSh6zdOtGNUbP8AftFnZQ
         bT+xFwvL4HU1v9iEJ1NVn3/BdCwlTsb+Cda9ymP8qAa5m1cpbs+jaBbVY/nWWX+19U4x
         el4L7SuUtuIyhdKCDk+mEHUsISp4Ftrg3F17IfbfdpR7fUOPMbucNGBI0KY3RYV+qUS6
         /g09L0LUX1RhtLqkmLYuA5+y82sEzqfhcSYLJWWm9Ng5wdGC6H1ZiholaBjUexEdWOVs
         VtPw==
X-Gm-Message-State: AOJu0YzOYT9P+rhZ0RBUmLETVmgli3JlKrAfu6Kdz4dQQAakrGVHPWi0
	ypxS81U7/zT81OGUxouduYCg9YA2+7YQXeXhE3YeOPZXFDUh3TpS//v9V2kK1g==
X-Google-Smtp-Source: AGHT+IGiCYxA5YQhPYvH/pavad0RaXapzzlqWb6hs8VTH/x8Ulix++6eOwCQ0kj9ySY+IsPimKZD/A==
X-Received: by 2002:a17:906:6944:b0:a55:a895:46ae with SMTP id a640c23a62f3a-a5a2d67db94mr990392866b.63.1715776797094;
        Wed, 15 May 2024 05:39:57 -0700 (PDT)
Message-ID: <7553291c-f88d-49c7-a1bd-5f8dbd21fd2b@suse.com>
Date: Wed, 15 May 2024 14:39:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen crash in scheduler during cpu hotplug
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <41ae17df-fb06-40b3-a98a-02f6f495f169@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <41ae17df-fb06-40b3-a98a-02f6f495f169@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.05.2024 13:58, Andrew Cooper wrote:
> Just so it doesn't get lost.  In XenRT, we've found:
> 
>> (XEN) ----[ Xen-4.19.0-1-d  x86_64  debug=y  Tainted:     H  ]----
>> (XEN) CPU:    45
>> (XEN) RIP:    e008:[<ffff82d040244cbf>]
>> common/sched/credit.c#csched_load_balance+0x41/0x877
>> (XEN) RFLAGS: 0000000000010092   CONTEXT: hypervisor
>> (XEN) rax: ffff82d040981618   rbx: ffff82d040981618   rcx:
>> 0000000000000000
>> (XEN) rdx: 0000003ff68cd000   rsi: 000000000000002d   rdi:
>> ffff83103723d450
>> (XEN) rbp: ffff83207caa7d48   rsp: ffff83207caa7b98   r8: 
>> 0000000000000000
>> (XEN) r9:  ffff831037253cf0   r10: ffff83103767c3f0   r11:
>> 0000000000000009
>> (XEN) r12: ffff831037237990   r13: ffff831037237990   r14:
>> ffff831037253720
>> (XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4:
>> 0000000000f526e0
>> (XEN) cr3: 000000005bc2f000   cr2: 0000000000000010
>> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss:
>> 0000000000000000
>> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
>> (XEN) Xen code around <ffff82d040244cbf>
>> (common/sched/credit.c#csched_load_balance+0x41/0x877):
>> (XEN)  48 8b 0c 10 48 8b 49 08 <48> 8b 79 10 48 89 bd b8 fe ff ff 49
>> 8b 4e 28 48
>> <snip>
>> (XEN) Xen call trace:
>> (XEN)    [<ffff82d040244cbf>] R
>> common/sched/credit.c#csched_load_balance+0x41/0x877

While this is of course pretty little information, I've still tried to
decipher it, first noticing it's credit1 that's being used here. Once
forcing csched_load_balance() non-inline (no idea why it is a separate
function in your build), I can see a sufficiently matching pattern at
approximately the same offset into the function. That's

    const struct cpupool *c = get_sched_res(cpu)->cpupool;
    ...
    const cpumask_t *online = c->res_valid;
    ...
    BUG_ON(get_sched_res(cpu) != snext->unit->res);

overlapping, with the crash being on the middle of the quoted lines.
IOW the CPU pool is still NULL for this sched resource. Cc-ing
Jürgen for possible clues ...

Jan

>> (XEN)    [<ffff82d040245a18>] F
>> common/sched/credit.c#csched_schedule+0x36a/0x69f
>> (XEN)    [<ffff82d040252644>] F common/sched/core.c#do_schedule+0xe8/0x433
>> (XEN)    [<ffff82d0402572dd>] F common/sched/core.c#schedule+0x2e5/0x2f9
>> (XEN)    [<ffff82d040232f35>] F common/softirq.c#__do_softirq+0x94/0xbe
>> (XEN)    [<ffff82d040232fc8>] F do_softirq+0x13/0x15
>> (XEN)    [<ffff82d0403075ef>] F arch/x86/domain.c#idle_loop+0x92/0xe6
>> (XEN)
>> (XEN) Pagetable walk from 0000000000000010:
>> (XEN)  L4[0x000] = 000000103ffca063 ffffffffffffffff
>> (XEN)  L3[0x000] = 000000103ffc9063 ffffffffffffffff
>> (XEN)  L2[0x000] = 000000103ffc8063 ffffffffffffffff
>> (XEN)  L1[0x000] = 0000000000000000 ffffffffffffffff
>> (XEN)
>> (XEN) ****************************************
>> (XEN) Panic on CPU 45:
>> (XEN) FATAL PAGE FAULT
>> (XEN) [error_code=0000]
>> (XEN) Faulting linear address: 0000000000000010
>> (XEN) ****************************************
> 
> which we can reproduce reliably enough with a shell script doing
> xen-hptool cpu-{off,on}line.
> 
> ~Andrew
> 


