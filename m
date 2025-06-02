Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72791ACB890
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 17:42:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003634.1383226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM7JJ-0007eu-1J; Mon, 02 Jun 2025 15:42:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003634.1383226; Mon, 02 Jun 2025 15:42:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM7JI-0007dT-UX; Mon, 02 Jun 2025 15:42:48 +0000
Received: by outflank-mailman (input) for mailman id 1003634;
 Mon, 02 Jun 2025 15:42:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uM7JG-0007dI-Vr
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 15:42:46 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ab7e3bf-3fc8-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 17:42:46 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a4f89c6e61so1806195f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 08:42:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747affafba1sm7742560b3a.110.2025.06.02.08.42.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 08:42:44 -0700 (PDT)
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
X-Inumbo-ID: 3ab7e3bf-3fc8-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748878965; x=1749483765; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f9mH8227pMYWB5HdwXe+aKUpdQxLpQw8jSjD6kN34NM=;
        b=NNJVZ3KLpbCj/7U+vS30LIZg8uqwBLbocdfHyTK/0yXwkvuNd8hQ8mRj2HzWu0H1ZY
         DEmVqb2AImwPZxYWvlz048QVXjwXG/8pGL8ePeY+DExix+HWrViMtKb9OgJ/t1ORWI7U
         XW4rgkhIQM1AqVobquGTHPK+w/mlEf4Ijbgcmc/dbpBauFmOmFygLk4SWDfUlB050zx3
         8MRt/RC1gQix6nH51gJc/OqWeu0gLcKX5oZtkxX8/WFUaE2YHqHXgNhvz6g+HEfkN/7w
         w7FrxEuqkECUElvyHbas6gCKqO9s4mCenzTqvO6JT6wUvVXDL3I9WSlnGquhFKY8WYEJ
         gjvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748878965; x=1749483765;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f9mH8227pMYWB5HdwXe+aKUpdQxLpQw8jSjD6kN34NM=;
        b=vRwX9ohogK2DyTFUuv+Yi+dIIs/bFilmBT6PeXKOHVCDaHGBbtTaSMkToKtPyTAENQ
         bhyMTWliNaM8yqoI6qsdt79Ej7GGhxGgk1IdGGTCxprNAwJMYPNyuzSnVMjNfvtYcziT
         0RR/i0K3qoGkYOSunKRk++MmC7nBCKZmG0nHOXWNXNhqHyIsoCpqu/sPmBc3tn2viEAv
         BvZrGOvVI0BhaO6a0qU1hGS2MBCyk/Ze1HbE7bQSYReQ/cIQNBnSret4B2TV/xIk4BuK
         7ksh/mWwXXqllOxrB1KX/BtpReBZVzg3xufGE1vEo/+jzIj5uH6BvQiyCEp+K4QjaeqQ
         CIyA==
X-Gm-Message-State: AOJu0YzGwr4RrlSxWufdhzdEuKGz7yEJt3oyPZf0ed6qe/ok5tRtUAOs
	63ELuf/hnzyuoxzj9mqw3QC7O7EEz2aM/8c2l62+cY/9mrERgwfTg6dnZrCZ9Yv17w==
X-Gm-Gg: ASbGnctCVlPFG/CCMZ99NcZTtV2l9ZQ0vuo2asR4wr7anFDWGD+JxQGr8hCcvNAkFr/
	aH4W1pA91Nj1b82LUSGM7oSn1SMgPEyyk0tNuu6oz5t/t9Swabpe5bQ3ZCpuT6z+jOLTJNkL3Zd
	/lVBgDThLIoFJMKu5khvsduz3ZOqxKxwDDeBpAyuygrwfRECuk+nb0kaM1wdqO/IfBzPG6DOCYN
	rvu/txibkfERCHhWB3svdJC5Oqc695MT0nnYz686Rpw6xG0BFPV7/WVCm/XiDsk5JYeI8sP77tD
	TEXM65liQ5kKwMY1V80MxdG3CZH8fixjOqICL6WBN7PL9KE28ghmo5SFVOdkgnXUibrLnr0IAqo
	uIn5Tq3qMPevz0WXyY7+mounPc8HwQkA9gUdW
X-Google-Smtp-Source: AGHT+IFBsu44e5wPODsgaqdd45Tq3ZfQ4XBfpq/sE6r+b5bkDmgYld8qKzeIoMSmzKbU2Ou3TP1TFg==
X-Received: by 2002:a05:6000:26c3:b0:3a4:ed62:c7e2 with SMTP id ffacd0b85a97d-3a4fe394776mr6719290f8f.28.1748878965458;
        Mon, 02 Jun 2025 08:42:45 -0700 (PDT)
Message-ID: <cf307474-8404-41db-8fc5-8084b8671584@suse.com>
Date: Mon, 2 Jun 2025 17:42:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Nullptr dereference in nested VMX when shadow VMCS support is
 available
To: Manuel Andreas <manuel.andreas@tum.de>
Cc: xen-devel@lists.xenproject.org
References: <5f258e25-a4ed-4f9a-8ca6-9ea3400e2369@tum.de>
 <6d28eb0c-caed-4c58-a6ac-cbf8da357d22@tum.de>
 <21dcca4d-1c51-42f1-b73b-65702451de13@suse.com>
 <26f412e2-ba65-4e3f-8c5f-7e15f5f32491@tum.de>
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
In-Reply-To: <26f412e2-ba65-4e3f-8c5f-7e15f5f32491@tum.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.06.2025 16:52, Manuel Andreas wrote:
> On 6/2/25 4:12 PM, Jan Beulich wrote:
> 
>> On 02.06.2025 15:39, Manuel Andreas wrote:
>>> I've discovered an issue in the nested VMX implementation, where an
>>> unprivileged domain is able to force Xen to dereference a NULL pointer,
>>> resulting in a panic.
>> Sadly you provide no details on this NULL deref.
> Here's the respective dump:
> 
> ----[ Xen-4.20.0  x86_64  debug=y Tainted:     H  ]----
> (XEN) CPU:    1
> (XEN) RIP:    e008:[<ffff82d0402ae2b8>] nvmx_handle_vmx_insn+0x7ab/0xccb
> (XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor (d1v0)
> (XEN) rax: 0000000000000000   rbx: 0000000000000000   rcx: 8000000000000002
> (XEN) rdx: 0000000000000000   rsi: 01ffffffffffffff   rdi: ffff82e0020155e0
> (XEN) rbp: ffff830179407e68   rsp: ffff830179407e00   r8: ffff82c00023b000
> (XEN) r9:  ffff830179413c40   r10: 0000000000000000   r11: 0000000000000200
> (XEN) r12: ffff83010483d000  r13: ffff830179407ef8   r14: 0000000000000000
> (XEN) r15: 0000000000000000   cr0: 0000000080050033   cr4: 00000000003526e0
> (XEN) cr3: 000000010498f000   cr2: 0000000000000000
> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
> (XEN) Xen code around <ffff82d0402ae2b8> (nvmx_handle_vmx_insn+0x7ab/0xccb):
> (XEN)  75 b0 0f 86 12 05 00 00 <81> 08 00 00 00 80 41 8b 84 24 f4 05 00 
> 00 80 cc
> (XEN) Xen stack trace from rsp=ffff830179407e00:
> (XEN)    ffff83010483d000 000000000011e000 0000000000000000 0000000000000000
> (XEN)    ffff82d0402bfc4a 0000000100000000 0000000000119fa8 ffff82d000000008
> (XEN)    ffff830100000006 ffff830179407ef8 0000000000000015 ffff83010483d000
> (XEN)    0000000000000000 ffff830179407ee8 ffff82d0402a9a19 ffff82d04020361b
> (XEN)    0000000000000000 0000000000000000 0000000000000000 ffff830100997000
> (XEN)    ffff82d040203615 ffff82d04020361b ffff82d040203615 ffff82d04020361b
> (XEN)    ffff83010483d000 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 00007cfe86bf80e7 ffff82d040203673 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000001
> (XEN)    0000000000000000 0000000000000000 0000000000000043 000000000000007b
> (XEN)    0000000000000043 0000000000000000 0000000000000000 0000000011e57e00
> (XEN)    0000000000000000 0000000000000000 0000beef0000beef 0000000000103fa2
> (XEN)    000000bf0000beef 0000000000000046 0000000000119fa0 000000000000beef
> (XEN)    000000000000beef 000000000000beef 000000000000beef 000000000000beef
> (XEN)    0000e01000000001 ffff83010483d000 0000003136627000 00000000003526e0
> (XEN)    0000000000000000 0000000000000000 0000000300000001 0000004e00000003
> (XEN) Xen call trace:
> (XEN)    [<ffff82d0402ae2b8>] R nvmx_handle_vmx_insn+0x7ab/0xccb
> (XEN)    [<ffff82d0402a9a19>] F vmx_vmexit_handler+0xd97/0x1e14
> (XEN)    [<ffff82d040203673>] F vmx_asm_vmexit_handler+0x103/0x220
> (XEN)
> (XEN) Pagetable walk from 0000000000000000:
> 
> (XEN)  L4[0x000] = 0000000000000000 ffffffffffffffff
> 
> Where nvmx_handle_vmx_insn+0x7ab/0xccb resolves to 
> xen/arch/x86/hvm/vmx/vvmx.c:1169
> Specifically, in nvmx_handle_vmptrld we have:
> 
> 1830    if ( cpu_has_vmx_vmcs_shadowing )
> 1831        nvmx_set_vmcs_pointer(v, nvcpu->nv_vvmcx);

Ah yes, this is what I overlooked (as seemingly innocent).

>>> This is possible when:
>>>
>>>   1. The malicious domain has nested HVM capabilities.
>>>   2. The CPU is running on top of VMX and supports shadow VMCS.
>>>
>>> To trigger the bug, the domain must first enable VMX operation for
>>> itself, execute VMXON and then finally execute VMPTRLD on a guest
>>> physical address that is backed by a non-writable p2m mapping.
>>> In `nvmx_handle_vmptrld`, after attempting to map the nested VMCS, Xen
>>> will check whether or not this mapping is suitable for writing and if
>>> not immediately unmap the nested VMCS again and abort the setup of
>>> `nvcpu->nv_vvmcx`. However, Xen at this point erroneously continues
>>> emulation of the VMPTRLD. In particular, if VMCS shadowing is available,
>>> Xen will nonetheless attempt to link up the nested VMCS to its own VMCS
>>> in `nvmx_set_vmcs_pointer`. Importantly, Xen here attempts to
>>> dereference the presumably mapped nested VMCS (which now is merely a
>>> NULL pointer) in order to mark it as a shadow VMCS by applying the
>>> `VMCS_RID_TYPE_MASK` to its revision identifier. Following, the page
>>> fault handler will panic Xen.
>>>
>>> I've attached an XTF reproducer that triggers the bug. To setup such a
>>> non-writable p2m mapping for the malicious VMCS, I first setup an
>>> appropriate grant table entry. I've tested it on Xen version 4.20.0.
>> I expect this to not work anymore on current staging or 4.20.1-pre.
>> See a8325f981ce4 ("x86/P2M: synchronize fast and slow paths of
>> p2m_get_page_from_gfn()").
> On first glance I don't see how that would impact the type of the 
> established p2m mapping.

Thing is that with said change grant mappings will cause
hvm_map_guest_frame_rw() to simply fail, rather than returning a r/o
mapping for r/o grant entries.

>>> To fix the issue I believe the following patch should be suitable:
>>>
>>> --- a/xen/arch/x86/hvm/vmx/vvmx.c
>>> +++ b/xen/arch/x86/hvm/vmx/vvmx.c
>>> @@ -1817,7 +1817,9 @@ static int nvmx_handle_vmptrld(struct
>>> cpu_user_regs *regs)
>>>                else
>>>                {
>>>                    hvm_unmap_guest_frame(vvmcx, 1);
>>> -                vvmcx = NULL;
>>> +                vmfail(regs, VMX_INSN_VMPTRLD_INVALID_PHYADDR);
>>> +
>>> +                return X86EMUL_OKAY;
>>>                }
>>>            }
>>>            else
>>>
>>> The VMX error AFAICT does not strictly adhere to the Intel SDM, but
>>> providing the guest some indication on what went wrong is likely more
>>> sensible than silently failing.
>> Giving the guest some indication is certainly right. If we want to follow
>> the above route, I think the change would want doing a little differently,
>> to take the path that presently is the "else" at the bottom of the hunk
>> above. However, I can't presently see how invoking vmfail() would make a
>> difference as to the subsequent NULL deref: The guest could continue the
>> same irrespective of the failure. Hence why I'd like to understand what
>> NULL deref you did observe. (We may hence need two patches - one along
>> the above lines, and another one dealing with the NULL issue.)
> 
> The issue is really just in the latter part of nvmx_handle_vmptrld, 
> which attempts to initialize its shadow VMCS even though establishing a 
> mapping for the nested VMCS failed.
> An early exit from that function (as my patch suggests) should be 
> sufficient for that case.

In fact there was correct code earlier on, and then the if() there was
converted to "else". Which simply needs converting back; patch sent.

Jan

