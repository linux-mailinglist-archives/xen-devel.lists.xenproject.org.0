Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A09B3FEE3
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 14:00:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106198.1456940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utPgl-0002XU-Su; Tue, 02 Sep 2025 12:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106198.1456940; Tue, 02 Sep 2025 12:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utPgl-0002Vz-PY; Tue, 02 Sep 2025 12:00:39 +0000
Received: by outflank-mailman (input) for mailman id 1106198;
 Tue, 02 Sep 2025 12:00:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0Jg=3N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1utPgk-0002UF-8Q
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 12:00:38 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7014e837-87f4-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 14:00:37 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-61ded2712f4so3805630a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 05:00:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61eaf588377sm2613037a12.15.2025.09.02.05.00.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 05:00:36 -0700 (PDT)
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
X-Inumbo-ID: 7014e837-87f4-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756814437; x=1757419237; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EeCguA3zEelSa9l3otrauPOu6p28MDJ0IS+pQ6a844c=;
        b=TxHH/htUbKIVyIbjP0UWgAPy+4wzt0zB+2sAWO2M4LvqrB6bJs7SMJWe13yz5PBqVm
         Xaa8SP2z39BzuCGbkHzb6Nqiyrf/EXxtRt7hP3djvs+OG8DCxhcye1sVpiGZLhHZH796
         P5CJqMQTx/h50A+TxW1/GgB5a5yOa9U36LShxzRMMoAGGnW5K4DHxQI/YxtdwrfSFvfG
         QUV1lyhr9VLRmXqFlTrhGYjXbUZJeL2n75n/XkTh+9UVO0An/H7P02HjwV6SY3P6hLyD
         8UU0GRREvJb+Hk1fKC2tSg2rFWGi0Z8Yk+oqNYcBSTwbGHVNfP6ETdqdCDy418gvgoRb
         UAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814437; x=1757419237;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EeCguA3zEelSa9l3otrauPOu6p28MDJ0IS+pQ6a844c=;
        b=X8csketXxb4q00OHd5Mb2nOVUkEuxNUl998MzXql8Z9AgFMNEClRz1qaiKmFYQkZ4X
         RmVtmW6dh+RqnwoyhWbTOCRJ0jjoLXVbuMcM3hsLIKD7uZRpKH+DNB4F0hhgadJ9nFS6
         +MhSTqpcK6RkRjteI/5Y8cOrL7GpIQvQdKOz5zIMkGPq7zR251MHt9UB+VUU3DeS9Z6Y
         6LhxBNsi+nHDj5A7hi84gsuraYvnaz8PxkcFhxZWvp1TVyI/l1QKSxb/x1QOCCnYu/dw
         hLhTcHMR6PnpIsEvoMVl8Z3UQnyehW6/VYmYY8LZ68Hn0Oon35cS/Bm6keQIR8SP95qe
         Rrdg==
X-Gm-Message-State: AOJu0Yy11hGRywhVnApr8DJgL73lcxV1Mo/XqUws+3qeRiGpEcMfKiNz
	9YEGR0icLOJNXau841bFeTZkvDqE7FUBLTPON5jMJT6kDLSvrjXvyTAXfRFxFLBVZ9o70VqYZ8G
	w5YI=
X-Gm-Gg: ASbGncv9FObZv6CxwbYj61PoZ9W+KD1AMdQBdESdkvMW8VfmJPDnAwApZtj7FN1jDx8
	Dl+I+TTcR50tST0t7i5gC1TGGS9JeHnQ9tLXedGJjrHw5XT39CSv07tL9mHxpk7IdBI0HHkZd1h
	7xBpzNkjwy+sbX7ooPns2WztIbhGmKfxxF/s+gapEL2T5IqHxkpjrWfrVdYbryeFUfUDpPBu4oJ
	NqzpwO268cQWoBnmM0BRbzxOBJF80/6hECx0YSrJ315EN2qd30EAPEGLGvvGOJG5NUdwoa4Qtcf
	b+XLV991n+06g6i+DxMVoDtzLMRwUZjupRV7//dR6IsaSgvO/qfPU4yotvDCPewerTFaPDOCyKt
	+9ZFU/NAXxvlobAX3Rt31qd2/SMRCq+DiPwurcyWsV7fez479v5+5zOPkDf2dmmCWGC14/0dpzI
	bPo6Gj+nVtsLbhR9WCZUstzanJFo4A
X-Google-Smtp-Source: AGHT+IHIRTb8c38BBJJVa6dMybLPHer++wMBvFvoGBHIFnPJ7wQj9JGx1psv/6Qu4MCBznPfuNvOaw==
X-Received: by 2002:a05:6402:34d2:b0:61c:87da:4bf7 with SMTP id 4fb4d7f45d1cf-61d26c5351bmr9550181a12.17.1756814436484;
        Tue, 02 Sep 2025 05:00:36 -0700 (PDT)
Message-ID: <79612dd8-2d12-4f69-9371-8a788db3873f@suse.com>
Date: Tue, 2 Sep 2025 14:00:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: issue with dom0_pvh on Xen 4.20
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <aLbEQ7Bav8seazP1@mail.soc.lip6.fr>
 <68988b80-f642-4fcf-a624-49ad9fdd685c@citrix.com>
 <aLbNbiHLntX13E46@mail.soc.lip6.fr>
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
In-Reply-To: <aLbNbiHLntX13E46@mail.soc.lip6.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.09.2025 12:56, Manuel Bouyer wrote:
> On Tue, Sep 02, 2025 at 11:44:36AM +0100, Andrew Cooper wrote:
>> On 02/09/2025 11:17 am, Manuel Bouyer wrote:
>>> Hello,
>>> I'm trying to boot a NetBSD PVH dom0 on Xen 4.20.
>>> The same NetBSD kernel works fine with Xen 4.18
>>>
>>> The boot options are:
>>> menu=Boot netbsd-current PVH Xen420:dev hd0f:;load /netbsd-PVH console=com0 root=wd0f; multiboot /xen420-debug.gz dom0_mem=1024M console=com1 com1=38400,8n1 loglvl=all guest_loglvl=all gnttab_max_nr_frames=64 sync_console=1 dom0=pvh
>>>
>>> and the full log from serial console is attached.
>>>
>>> With 4.20 the boot fails with:
>>>
>>> (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
>>> (XEN) Freed 664kB init memory
>>> (XEN) d0v0 Triple fault - invoking HVM shutdown action 1
>>> (XEN) *** Dumping Dom0 vcpu#0 state: ***
>>> (XEN) ----[ Xen-4.20.2-pre_20250821nb0  x86_64  debug=y  Tainted:   C    ]----
>>> (XEN) CPU:    7
>>> (XEN) RIP:    0008:[<000000000020e268>]
>>> (XEN) RFLAGS: 0000000000010006   CONTEXT: hvm guest (d0v0)
>>> (XEN) rax: 000000002024c003   rbx: 000000000020e260   rcx: 00000000000dfeb7
>>> (XEN) rdx: 0000000000100000   rsi: 0000000000103000   rdi: 000000000013e000
>>> (XEN) rbp: 0000000080000000   rsp: 00000000014002e4   r8:  0000000000000000
>>> (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000000
>>> (XEN) r12: 0000000000000000   r13: 0000000000000000   r14: 0000000000000000
>>> (XEN) r15: 0000000000000000   cr0: 0000000000000011   cr4: 0000000000000000
>>> (XEN) cr3: 0000000000000000   cr2: 0000000000000000
>>> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
>>> (XEN) ds: 0010   es: 0010   fs: 0000   gs: 0000   ss: 0010   cs: 0008
>>>
>>> because of the triple fault the RIP above doens't point to the code.
>>>
>>> I tracked it down to this code:
>>>         cmpl    $0,%ecx                 ;       /* zero-sized? */       \
>>>         je      2f                      ; \
>>>         pushl   %ebp                    ; \
>>>         movl    RELOC(nox_flag),%ebp    ; \
>>> 1:      movl    %ebp,(PDE_SIZE-4)(%ebx) ;       /* upper 32 bits: NX */ \
>>>         movl    %eax,(%ebx)             ;       /* store phys addr */   \
>>>         addl    $PDE_SIZE,%ebx          ;       /* next PTE/PDE */      \
>>>         addl    $PAGE_SIZE,%eax         ;       /* next phys page */    \
>>>         loop    1b                      ; \
>>>         popl    %ebp                    ; \
>>> 2:                                      ;
>>>
>>> there are others pushl/popl before so I don't think that's the problem
>>> (in fact the exact same fragment is called just before with different
>>> inputs and it doesn't fault). So the culprit it probably the write to (%ebx),
>>> which would be 0x20e260
>>> This is in the range:
>>> (XEN)  [0000000000100000, 0000000040068e77] (usable)
>>> so I can't see why this would be a problem.
>>>
>>> Any idea, including how to debug this further, welcome
>>
>> Even though triple fault's are aborts, they're generally accurate under
>> virt, so 0x20e268 is most likely where things die.
> 
> but that's the RIP of the last fault, not the first one, right ?
> 0x20e268 isn't in the text segment of the kernel, my guess is that the
> first fault triggers an exception, but the exeption handler isn't set up yet
> so we end up jumping to some random value.

Can you perhaps check this guess against the %esp value seen? From the
hypervisor's triple fault handling, you may want to actually log stack
contents as well (in addition to what Andrew suggested), assuming %esp
looks sane to you.

Jan

