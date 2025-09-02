Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CD3B4015D
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 14:54:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106372.1457069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utQWg-0007aB-ML; Tue, 02 Sep 2025 12:54:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106372.1457069; Tue, 02 Sep 2025 12:54:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utQWg-0007YP-Jf; Tue, 02 Sep 2025 12:54:18 +0000
Received: by outflank-mailman (input) for mailman id 1106372;
 Tue, 02 Sep 2025 12:54:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0Jg=3N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1utQWf-0007YC-OW
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 12:54:17 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef1650bd-87fb-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 14:54:16 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b042cc39551so297910666b.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 05:54:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b04189de5b5sm637834166b.10.2025.09.02.05.54.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 05:54:15 -0700 (PDT)
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
X-Inumbo-ID: ef1650bd-87fb-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756817656; x=1757422456; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FBpFRyVjoau3Kw2UF9dSgF1MxEK2RGEvMrrnNFGzYhU=;
        b=K4xp8XuRevip0++WB4jomUuoGBtAieiZvXChyQMIfbMEr0fuqV+BBoUcICRU4j1Fz7
         KCP0xoCgPOm5aqfgmCHayxgu8/cieRsdNScYOcfQhsxbUq04pw2l9vJoc6P/w8ZQ/iuL
         z2VFz9jGBUxX7GUWTvXzoOJB8jHEbTkih4zZcESeWOuBAJnSDqL1WFg9N/Ek+vZqd1+f
         RzX1+GZ4L+tv7+psmDNrg0xDMWvyC+8WvkcYlA1v2SGT2S4KqniYFsbe/e4MtMAWEfWj
         eg83GFBac/Fd4/CDQ1d17nIygL6p85M56AwMgn8gUS0+n58fqoVVMWeu5EN4E5aWrcOg
         nqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756817656; x=1757422456;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBpFRyVjoau3Kw2UF9dSgF1MxEK2RGEvMrrnNFGzYhU=;
        b=pTpVupF8ZJdNg0MhaEDrrPml7L8ByKn3eXnrO2BNX6kpntm5O+zMGlZx4+ir5q8HHU
         KSXO94uaDy9ussKP7LzZMJe5bBQOmL6LZrZrPMM192OJ23Y8UI9rdYo2b8I8vWb3Fypx
         3C9LJbPZoLyl7b7cmwEfN+VFlfJV3fyVpVX/61Z9jr2DNFIlpqTgpr4AjNLNqd16XNWr
         09/tciLW9DB+EckQ/x+2YdXA9IADNNyTx4YgmsolnFjK6MnB30MEnORX+gsO4xHwMe88
         lFapduqn5ceW9+u+FVZ4S3pNUyLQtzkaQb1q9LlLay6/RCWk5GsJPpGHIYRXbnDuwOLI
         ZsWQ==
X-Gm-Message-State: AOJu0Yy3ywcIMuSXW1wcp8HfsAfwDYtpXT7GqFQUU3Jf4vflWFpAxYSn
	V2kyBtKLXvl0lpZ6VhsYnAX8ve9YeLZuNlUT1tlTzAOTPAGT/DwqbjwQxGePIMN5IA==
X-Gm-Gg: ASbGncsCncUELEV7j6Hm0mt3xfJBChkTDlg357t/KNDxHXCpnhorovQ0Ey3elkXx8IG
	5C7H38JZy9rzZDQHVGyt59bZk2i9g68M7cXpSM6ET4eTydHcSVLOjB8xw/qmXUXE3efLhQEVNCj
	JLBIljVkMmmgnJjE8QN/3sQyEASieXSxg9Q2SPQRJ+eL5q1deFejWIJHvLxEYYx8f4yMe9KSyLi
	yj/268TU7R23rUWtRf6zMf5fLagS9BsOZQMQeb+LZ8EX6czwNMyVmJnnHkOQ+U0HeF4AWppKyUX
	b96HWh3N2WNAV9GxUQHdlZDl0kKFXd1xfONQUPgqyPpVI6Z4TCyml1kXwOrmzhgoCwR65XUgf9y
	YZ4jOByYEpJxmFtxxHMiP6I/++jQhzrp0CWNDs1REi+m11SiAVf17GyXFQPS6b3fWx3/lyfgXRr
	+geQ5nA9iTosb3MpQyRg==
X-Google-Smtp-Source: AGHT+IFBJKJz/+j3DKyAjspzHHjTCAc/LVaxMHtUfyZpagPm5fuUb1CX0uz6torfHTyusEZc9MmBnw==
X-Received: by 2002:a17:907:1c97:b0:ade:198c:4b6f with SMTP id a640c23a62f3a-b01d8a277e7mr1140143466b.1.1756817656079;
        Tue, 02 Sep 2025 05:54:16 -0700 (PDT)
Message-ID: <4d1beced-02a5-4cd3-bfe2-1a7c3220a85f@suse.com>
Date: Tue, 2 Sep 2025 14:54:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: issue with dom0_pvh on Xen 4.20
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <aLbEQ7Bav8seazP1@mail.soc.lip6.fr>
 <68988b80-f642-4fcf-a624-49ad9fdd685c@citrix.com>
 <aLbNbiHLntX13E46@mail.soc.lip6.fr>
 <79612dd8-2d12-4f69-9371-8a788db3873f@suse.com>
 <aLbemSW87Cj94T1p@mail.soc.lip6.fr>
Content-Language: en-US
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
In-Reply-To: <aLbemSW87Cj94T1p@mail.soc.lip6.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.09.2025 14:10, Manuel Bouyer wrote:
> On Tue, Sep 02, 2025 at 02:00:35PM +0200, Jan Beulich wrote:
>> On 02.09.2025 12:56, Manuel Bouyer wrote:
>>> On Tue, Sep 02, 2025 at 11:44:36AM +0100, Andrew Cooper wrote:
>>>> On 02/09/2025 11:17 am, Manuel Bouyer wrote:
>>>>> Hello,
>>>>> I'm trying to boot a NetBSD PVH dom0 on Xen 4.20.
>>>>> The same NetBSD kernel works fine with Xen 4.18
>>>>>
>>>>> The boot options are:
>>>>> menu=Boot netbsd-current PVH Xen420:dev hd0f:;load /netbsd-PVH console=com0 root=wd0f; multiboot /xen420-debug.gz dom0_mem=1024M console=com1 com1=38400,8n1 loglvl=all guest_loglvl=all gnttab_max_nr_frames=64 sync_console=1 dom0=pvh
>>>>>
>>>>> and the full log from serial console is attached.
>>>>>
>>>>> With 4.20 the boot fails with:
>>>>>
>>>>> (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
>>>>> (XEN) Freed 664kB init memory
>>>>> (XEN) d0v0 Triple fault - invoking HVM shutdown action 1
>>>>> (XEN) *** Dumping Dom0 vcpu#0 state: ***
>>>>> (XEN) ----[ Xen-4.20.2-pre_20250821nb0  x86_64  debug=y  Tainted:   C    ]----
>>>>> (XEN) CPU:    7
>>>>> (XEN) RIP:    0008:[<000000000020e268>]
>>>>> (XEN) RFLAGS: 0000000000010006   CONTEXT: hvm guest (d0v0)
>>>>> (XEN) rax: 000000002024c003   rbx: 000000000020e260   rcx: 00000000000dfeb7
>>>>> (XEN) rdx: 0000000000100000   rsi: 0000000000103000   rdi: 000000000013e000
>>>>> (XEN) rbp: 0000000080000000   rsp: 00000000014002e4   r8:  0000000000000000
>>>>> (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000000
>>>>> (XEN) r12: 0000000000000000   r13: 0000000000000000   r14: 0000000000000000
>>>>> (XEN) r15: 0000000000000000   cr0: 0000000000000011   cr4: 0000000000000000
>>>>> (XEN) cr3: 0000000000000000   cr2: 0000000000000000
>>>>> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
>>>>> (XEN) ds: 0010   es: 0010   fs: 0000   gs: 0000   ss: 0010   cs: 0008
>>>>>
>>>>> because of the triple fault the RIP above doens't point to the code.
>>>>>
>>>>> I tracked it down to this code:
>>>>>         cmpl    $0,%ecx                 ;       /* zero-sized? */       \
>>>>>         je      2f                      ; \
>>>>>         pushl   %ebp                    ; \
>>>>>         movl    RELOC(nox_flag),%ebp    ; \
>>>>> 1:      movl    %ebp,(PDE_SIZE-4)(%ebx) ;       /* upper 32 bits: NX */ \
>>>>>         movl    %eax,(%ebx)             ;       /* store phys addr */   \
>>>>>         addl    $PDE_SIZE,%ebx          ;       /* next PTE/PDE */      \
>>>>>         addl    $PAGE_SIZE,%eax         ;       /* next phys page */    \
>>>>>         loop    1b                      ; \
>>>>>         popl    %ebp                    ; \
>>>>> 2:                                      ;
>>>>>
>>>>> there are others pushl/popl before so I don't think that's the problem
>>>>> (in fact the exact same fragment is called just before with different
>>>>> inputs and it doesn't fault). So the culprit it probably the write to (%ebx),
>>>>> which would be 0x20e260
>>>>> This is in the range:
>>>>> (XEN)  [0000000000100000, 0000000040068e77] (usable)
>>>>> so I can't see why this would be a problem.
>>>>>
>>>>> Any idea, including how to debug this further, welcome
>>>>
>>>> Even though triple fault's are aborts, they're generally accurate under
>>>> virt, so 0x20e268 is most likely where things die.
>>>
>>> but that's the RIP of the last fault, not the first one, right ?
>>> 0x20e268 isn't in the text segment of the kernel, my guess is that the
>>> first fault triggers an exception, but the exeption handler isn't set up yet
>>> so we end up jumping to some random value.
>>
>> Can you perhaps check this guess against the %esp value seen? From the
>> hypervisor's triple fault handling, you may want to actually log stack
>> contents as well (in addition to what Andrew suggested), assuming %esp
>> looks sane to you.
> 
> %esp is sane. I forgot to mention, this happens very early, while we're still
> in 32bits real mode. No function call did happen at this point, and on the
> stack there's only one 32bit value: the %ebp that we just pushed

Which by implication means no earlier exception(s).

Jan

