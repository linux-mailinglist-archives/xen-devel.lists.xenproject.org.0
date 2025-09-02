Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB94FB400FF
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 14:45:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106335.1457040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utQNp-0004jP-Bx; Tue, 02 Sep 2025 12:45:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106335.1457040; Tue, 02 Sep 2025 12:45:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utQNp-0004gV-99; Tue, 02 Sep 2025 12:45:09 +0000
Received: by outflank-mailman (input) for mailman id 1106335;
 Tue, 02 Sep 2025 12:45:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0Jg=3N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1utQNo-0004gP-9r
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 12:45:08 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6b51d7b-87fa-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 14:45:05 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b0454d63802so99028566b.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 05:45:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b04148f95b5sm662861066b.92.2025.09.02.05.45.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 05:45:04 -0700 (PDT)
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
X-Inumbo-ID: a6b51d7b-87fa-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756817105; x=1757421905; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Uh1NgFBcXHgsIaFoT607qr9if5WG3cVwJrTdYRtE4p0=;
        b=V0VKqhm2Lza77PTcntvTI9Oe3PcFthSiUZ9V4SjpgVhFUgTSe1NvLaKnC+N1TekPMB
         EJUsiF8+YPjGgO8R0n8zAW0QXbu54JQem5O8gooh6xWJX0rW0TWzp9DNBUw8TdpuqJNj
         rOAX7nTxFt+bCiCamLfgaV8cLckOtJl9MkJp0WlEfS/kFxjCzQDjgTWsLiG92lnrBQHf
         E5KzmHhDWAX4FRtXFNZdX1+dko+67kQ9bc+DIRzKwwdP926TN5YNA6fjD2X6djrfshk3
         uccaH+MyB/41N0+/efvy4u4xHhti8TsAOtR1BfkJTlHK2HRgXiAsjD8oyIAYX1bM9Nqm
         C0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756817105; x=1757421905;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uh1NgFBcXHgsIaFoT607qr9if5WG3cVwJrTdYRtE4p0=;
        b=qOq9PsxXF1XW7xgGmZT4tJNbbNEw9n9ZGAr2sudmEvVxi8ndxEpKwstNF1pfA1RIFX
         BZNKE6pMdJG0Vhsbs7HQuFEBuTkQ2D1KSNng9DbiQZws2jRfdJXwXdZ6D5ivZiuIiWdh
         efxW4a9dY7gX/n5V8Yckcl2eU+n/h2gwwvpP+vkrVeaE5htDrd24bwPP+CDgaV7deZgN
         37LEp737X75esX+ukmnw9FTbSomWsl4+4tbCwyGaEAzrBQahx4BfjweCIrzNHN563upa
         dat9prCKJJ/66Z/N05I2Mq+88qQgb1S9yGZa0IUs8CkEmJOCBX7Me2pzgJH0lgZ5+RWs
         vorQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7pdwORTsQMbrLj5PTJuT/WHV/7GGtTYXMyCeNPRBYd16dwVI6GlI2TomTLaWvFkkqsCffmFsd62g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVNqr7H0hwtfILqBSc0fobEFNSSW0AQhFOApL4EisB+wOa60/l
	XOEg/YHkkwOG0LTjlHhMHK6gwdQdE/ym4Husmt/+hqxkUna0I/OESScO1Qsuid84RA==
X-Gm-Gg: ASbGncsXJzrS3Tu7cTjSPZimsRSwjYvO4ymJYc35xlSp4YYDdrAtE0aSdCLaLrc2oP9
	7xaAqsRNmm34UdcfWLD8tvzuz2qh3sGFtVDbcAvATYeiNYLUP0xBH/U6JYCQo6B1DWIt3g8tWGc
	cu2zXqRWEFbHj5IMyrExNLmfl6UfmGwfNy06kvKLUG5rgqnS1zoL6gxt1g38/jyZwH9aR8M52xf
	8TM298a5je/WDC36nDLkknbtukQ1NW7XyGw1skZd1qe9m2zxRRW9yyFDLw2pKEBNzuuNpn+9ojs
	MgsHYgl5CJKL6oPo3oK5+fH7/4Zi2EBBiioEx20Qd/L1kzQjDMHpx8R7doQTqaOn6gv2F8BpcEp
	LKKkhFSpQRdKntJuuGRexE4l56SSYttyK+W7e0lx8CHpBh/c1EeuyrH/tlkomOFCHuuyZCCYQw3
	mL9HhCzTI=
X-Google-Smtp-Source: AGHT+IEwRGmu8MzwMpS31kxE+pVv/EFPchFh3/wMO2ZekSbvqv2rJB9bDSb1ORXCGZHyN/BBtefaDg==
X-Received: by 2002:a17:907:724c:b0:afe:c1bd:b6d6 with SMTP id a640c23a62f3a-b01d8a327damr963924266b.5.1756817105168;
        Tue, 02 Sep 2025 05:45:05 -0700 (PDT)
Message-ID: <7d0fc0eb-52a4-4478-8c1b-9a359513abdd@suse.com>
Date: Tue, 2 Sep 2025 14:45:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: issue with dom0_pvh on Xen 4.20
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <aLbEQ7Bav8seazP1@mail.soc.lip6.fr>
 <68988b80-f642-4fcf-a624-49ad9fdd685c@citrix.com>
 <aLbNbiHLntX13E46@mail.soc.lip6.fr>
 <957429d8-ec8c-4327-b8fc-71fe9ddb2d33@suse.com>
 <aLbi7QhGy4QEH8E9@mail.soc.lip6.fr>
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
In-Reply-To: <aLbi7QhGy4QEH8E9@mail.soc.lip6.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.09.2025 14:28, Manuel Bouyer wrote:
> On Tue, Sep 02, 2025 at 02:22:29PM +0200, Juergen Gross wrote:
>> On 02.09.25 12:56, Manuel Bouyer wrote:
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
>>>>>          cmpl    $0,%ecx                 ;       /* zero-sized? */       \
>>>>>          je      2f                      ; \
>>>>>          pushl   %ebp                    ; \
>>>>>          movl    RELOC(nox_flag),%ebp    ; \
>>>>> 1:      movl    %ebp,(PDE_SIZE-4)(%ebx) ;       /* upper 32 bits: NX */ \
>>>>>          movl    %eax,(%ebx)             ;       /* store phys addr */   \
>>>>>          addl    $PDE_SIZE,%ebx          ;       /* next PTE/PDE */      \
>>>>>          addl    $PAGE_SIZE,%eax         ;       /* next phys page */    \
>>>>>          loop    1b                      ; \
>>>>>          popl    %ebp                    ; \
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
>>>
>>
>> What puzzles me is that:
>>
>> - %cr2 is 0, so probably the first fault wasn't a page fault
> 
> AFAIK it can't be as we're still in real mode

It's protected mode, but with paging still off.

>> - RIP is %ebx + 8, so maybe the code was just clobbered by the loop?
>>
>> Could it be the code has been moved to this location, or is about to
>> be moved away afterwards?
> 
> No. RIP shouldn't end up there in any way. the assembly code is quite simple,
> it's just a loop and I'm quite confident that we did enter the loop with
> sane values

Yet Jürgen has a point - entry point and what is being modified are on the
same page (and despite paging still being off, you writing page tables here
makes pages a relevant unit). Considering
- entry point @ 0x20e4d0
- %ecx = 0xdfeb7
- %ebx = 0x20e260
the loop continuing a little further will overwrite the entry point code.
And with the entry point not at an even (e.g page-aligned) address, other
code (like the one here) could conceivably live immediately ahead of it.
(Of course this overwriting may be intentional, but it looks suspicious in
this context.)

Jan

