Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFB6CBCF1F
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 09:21:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186659.1508087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV3ok-0005iv-2r; Mon, 15 Dec 2025 08:20:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186659.1508087; Mon, 15 Dec 2025 08:20:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV3oj-0005gW-Vp; Mon, 15 Dec 2025 08:20:29 +0000
Received: by outflank-mailman (input) for mailman id 1186659;
 Mon, 15 Dec 2025 08:20:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vV3oj-0005gQ-3N
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 08:20:29 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e87a2398-d98e-11f0-9cce-f158ae23cfc8;
 Mon, 15 Dec 2025 09:20:25 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4777771ed1aso23563935e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 00:20:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f4f4150sm173924275e9.11.2025.12.15.00.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 00:20:24 -0800 (PST)
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
X-Inumbo-ID: e87a2398-d98e-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765786825; x=1766391625; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/YFLV4pXe8bVfA8YZOHvsyj2Qk1hXDlSxSc6Pp20XXE=;
        b=GB1mKjISO7liKO/LrUIvcwct4Pm+ZzNhRWfstjRSw2wtu8JTr1c2yRQUZprc9rzd0J
         SzDVSXcwMZGw9ZvEYU4509mAfDAScmPhvQWE+N7JBUSas7ntOGFy7NRr/AtF+2p4HWdA
         9gapziJ6X9CSI7n/+ZW5SpeDGNP4XkFfzAFa4SteC/7rOLODCDW0M8yKGkpIl9qG0KEn
         H4fwnnE8HxHQD9u3DmY6BDUFxxCh4geN99JLGSbCP4kZCppg0WTNguwoCsP6OPajv7aD
         03raVGyon2E4LlsVk+csbeySvVqkuiXTJESYjfeu9uo9cMntjb2TGgFQq+0PgxV8FTsA
         zR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765786825; x=1766391625;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YFLV4pXe8bVfA8YZOHvsyj2Qk1hXDlSxSc6Pp20XXE=;
        b=u9PX57RFulp+9p2a7fjDuxvW5rukA5Z4mhyj9ChxGu7zsbhHgxjQLzIwwj35azxMLh
         KV1pXdoLWBOHO/bdHxeHalVwhT5jHnwgWFVG/gF5FVWe8NO58qAVfUzwvfDVqpLKUaiP
         BxUHnb4atv1FIsLyUJBq1CiGtks6w1rvRnWndxJzsivigtAZia8XpYcqGekI/FwkgKwE
         nCu5QMwwHgv/vzwmx14QQV1ovQZJsql+iRUraJlyPYLGbr+WTh0B/dD+teUXnVyJN8OZ
         Gc217m6Lh7k0pOOEmswGBMQw+Dud0C9jaD1g+nhyVOMInaemNx1qgJPrUrpBc+DlS6ZG
         S44w==
X-Forwarded-Encrypted: i=1; AJvYcCVX1x47HavxWLLG/7n1rCYhHbXu2XodwdOzmcBo5u1ikKmtGFmrz604ij0e/nhya8SzPymLHzJHNKM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyvmheHrST5MGTP4esRdjXrWWrJsQHZ/UVkqQBwLgC5vvUa95fe
	9YQwm1wKY0lALsEVwg3J/jddxlxL4sKcITEn8i7xIbHPnFsKPYx1YrosAsaB5vX/Uw==
X-Gm-Gg: AY/fxX4v8sqyDjDz1zKy/xXM4FIez76NPYvkhW/wxMo6bvaXH2piAqhVzVixFkG8hrC
	YQky4UGgq6ytyn30drEdMtQ7OO1KAYNomBPbP3YVm1vAVgAw2jcrC/cJbmjc20xJkGBHfi1N9NZ
	bs8ooLzbw3JX/epvxbx49jV/Yynpo0cJy8z6Mc5dG9ynxsdtQ1gW1LZYtHX4aDNMJXE+AfOmvay
	NUrlqjHzdVuB9Kron6nuqEjV9odL+o6B13oYqcFUE3PZF1LA78hGoLwqhhNPT8hIXVB2ZiII2kS
	7LTYUuIuuqqSXyGIjXu6RHTMgf69pBFr2K1e77wWSaVpOhCktnuS+Je8IXeJIbBxg+nhsuwqmSk
	Xh8j6vFIhWEdnN9ql/Tocim6MyZTZ2OJEowCSfFO4xMqHh0ieosEP8yP9/EmeF7V5cpQ4RlJ72V
	6l/QtxbqAVuW5aiohIEGH2XxW2zxyGh2SBdp67VSDScoaDSJe+augMMMte9k7RPJmY3kJ3ozvm5
	3k=
X-Google-Smtp-Source: AGHT+IGPuKuMhgkWI4sdTPj+9tnZuwqtwO1lXKRFKdFUBAhGxcvAcyo58BBgpsKTQ9N5ppQatTJdzA==
X-Received: by 2002:a05:600c:1d2a:b0:477:9a28:b09a with SMTP id 5b1f17b1804b1-47a8f7039c3mr104435225e9.0.1765786825162;
        Mon, 15 Dec 2025 00:20:25 -0800 (PST)
Message-ID: <3cf7d382-3a05-401b-8483-41aa436079c5@suse.com>
Date: Mon, 15 Dec 2025 09:20:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] xen/riscv: add RISC-V virtual SBI base extension
 support for guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1764582112.git.oleksii.kurochko@gmail.com>
 <d17dcac47752681eed6703360389dd542433ab3e.1764582112.git.oleksii.kurochko@gmail.com>
 <275721bc-07c2-4f69-93c2-e6d3022fee4f@suse.com>
 <5154e129-675b-4027-b97f-257559c7ea50@gmail.com>
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
In-Reply-To: <5154e129-675b-4027-b97f-257559c7ea50@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.12.2025 16:25, Oleksii Kurochko wrote:
> On 12/8/25 4:15 PM, Jan Beulich wrote:
>> On 01.12.2025 11:24, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/vsbi/vsbi-base-extension.c
>>> @@ -0,0 +1,52 @@
>>> +
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#include <xen/lib.h>
>>> +#include <xen/sched.h>
>>> +
>>> +#include <asm/processor.h>
>>> +#include <asm/sbi.h>
>>> +#include <asm/vsbi.h>
>>> +
>>> +extern unsigned long __ro_after_init sbi_spec_version;
>>> +extern long __ro_after_init sbi_fw_id;
>>> +extern long __ro_after_init sbi_fw_version;
>>> +
>>> +static int vsbi_base_ecall_handler(struct vcpu *vcpu, unsigned long eid,
>>> +                                   unsigned long fid,
>>> +                                   struct cpu_user_regs *regs)
>>> +{
>>> +    int ret = 0;
>>> +    struct sbiret sbi_ret;
>>> +
>>> +    switch ( fid ) {
>>> +    case SBI_EXT_BASE_GET_SPEC_VERSION:
>>> +        regs->a1 = sbi_spec_version;
>> Wouldn't this need to be the minimum of what firmware supports and what Xen
>> supports / knows about? (Assuming backward compatibility among the spec
>> versions of course.)
> 
> The base extension is mandatory (according to the spec), and based on some Linux
> commits from contributors to the OpenSBI spec, it is also intended to allow
> backward compatibility and probing of future extensions (although I was not able
> to find this explicitly stated in the spec).
> 
> However, none of this guarantees that everything else is backward compatible.
> For example, the entire v0.1 SBI has been moved to the legacy extension, which
> is now an optional extension. This is technically a backwards-incompatible
> change because the legacy extension is optional, and v0.1 of the SBI does not
> allow probing.
> 
> Regarding what should be written to|regs->a1|, I think you are right: it should
> be the minimum of what the firmware provides and what Xen supports. Otherwise,
> if|sbi_spec_version| is set to 2.0 and we return 2.0 to the guest, the guest might
> try to probe the DBGN (which Xen does not currently support) extension and use
> it instead of the legacy extension for the early console.
> 
> 
>>> +        break;
>>> +    case SBI_EXT_BASE_GET_IMP_ID:
>>> +        regs->a1 = sbi_fw_id;
>>> +        break;
>>> +    case SBI_EXT_BASE_GET_IMP_VERSION:
>>> +        regs->a1 = sbi_fw_version;
>> Same concern here, but see also below.
> 
> For SBI_EXT_BASE_GET_IMP_ID, I think we want to return XEN id which is according
> to OpenSBI spec is 7.
> 
> Something similar for SBI_EXT_BASE_GET_IMP_VERSION, maybe we want to return Xen
> version code (XEN_FULLVERSION).
> 
>>
>>> +        break;
>>> +    case SBI_EXT_BASE_GET_MVENDORID:
>>> +    case SBI_EXT_BASE_GET_MARCHID:
>>> +    case SBI_EXT_BASE_GET_MIMPID:
>>> +        sbi_ret = sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0, 0, 0);
>> This may be okay to do for the hardware domain, but hardly for DomU-s.
> 
> I don’t see an issue with returning the vendor, microarchitecture, and
> processor ID. This is essentially what other hypervisors do.
> 
> What would be better to return? Returning 0 could be an option, and according
> to the RISC-V spec:
>    This register must be readable in any implementation, but a value of 0 can
>    be returned to indicate the field is not implemented.
> 
> So returning 0 would simply indicate that the field is not provided for case
> of DomUs, and provide it for hardware domain.
> 
> Would it be better?
> 
>>
>> Same concern for SBI_EXT_BASE_GET_IMP_ID.
>>
>>> +        ret = sbi_ret.error;
>>> +        regs->a1 = sbi_ret.value;
>>> +        break;
>>> +    case SBI_EXT_BASE_PROBE_EXT:
>>> +        regs->a1 = vsbi_find_extension(regs->a0) ? 1 : 0;
>> At least for hwdom doesn't this also need combining virtual and
>> underlying physical lookup, if for some extensions you may pass the
>> requests down to the physical one (as done above)?
> 
> I think I understand your intention, but I am not 100% sure that we need to
> perform a physical lookup. There may be implementation-specific cases where
> a call is emulated by the hypervisor instead of being passthroughed to
> OpenSBI.
> In other words, it could be the case that an extension is fully emulated
> without requiring support for the corresponding physical extension.

I don't have sufficient RISC-V knowledge to further comment on this. My main
concern is that we have to present (a) a consistent picture to both hwdom
and DomU-s while (b) presenting a properly virtualized view to DomU-s (i.e.
abstracting away hardware implementation details). In particular for DomU-s
you will already now need to think of what happens if a guest is migrated:
Data returned from vSBI probably shouldn't change across migration, or else
you may confuse the guest.

Jan

