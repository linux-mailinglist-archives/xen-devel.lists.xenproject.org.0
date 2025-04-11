Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC5DA85E37
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 15:08:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947386.1345010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3E79-0006Yp-78; Fri, 11 Apr 2025 13:08:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947386.1345010; Fri, 11 Apr 2025 13:08:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3E79-0006XB-4F; Fri, 11 Apr 2025 13:08:11 +0000
Received: by outflank-mailman (input) for mailman id 947386;
 Fri, 11 Apr 2025 13:08:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kzGk=W5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u3E78-0006X5-8b
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 13:08:10 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 038b2f41-16d6-11f0-9ead-5ba50f476ded;
 Fri, 11 Apr 2025 15:08:08 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso21616275e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 06:08:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f205ecb20sm87017995e9.3.2025.04.11.06.08.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 06:08:07 -0700 (PDT)
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
X-Inumbo-ID: 038b2f41-16d6-11f0-9ead-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744376888; x=1744981688; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bltsQqo6IjN4SSclRP/QkE61Yss6XiM5n42bQnovYkg=;
        b=PUrIOA767izTGjyreWcM6q1r/vbM7/+/b+tFeNuLhyd23eDgqBzu14QdzjnrVANnt7
         rpNbzzkm+iZqtKu8s9dWbu+X+OOhjju+LixAjljTjpD99ssk0o8VjulbxIyVYC5wRQ7t
         cOIsihC+Vr6YpWkMWWyYAjLRsPzqLicxL6AR5l2Vp94m2NmTMrJfWDA+33tMUgwR1kHa
         ndbljkRdsgxGIT9EuG6exoiBpo5lEwktEB6BCYo3LlDFTT8nK3zxCGGf7vnguTmbia+Q
         XvrtuFxO7WouQk/7z2uCaGNfzggGX5mqMtVCNmMR2L9M58066mR+avZYlxU9BcfzOhh+
         /AXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744376888; x=1744981688;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bltsQqo6IjN4SSclRP/QkE61Yss6XiM5n42bQnovYkg=;
        b=GxdKr5CtTEYeRTHUFkDO3CxAqX8d3HIgl8Ne4LD+BYMfTZaJX6kluFlItvoYWqFNeg
         DvHaPGk/vsIOtdjf+3RBTeW/W24jbkCwj/ptJ8A9RmbVZULR1N/nZ2LzTUcR8oWlEgtg
         yN5UazhEMS7BZ8sskCIZGhLWwUtAYEVcTCMMMDpvu7Pj9Xi/zFOm7jMrz5kjJayMuL9J
         OOrlQT5GI35OI//d2Hzik3fn06h9ZYKF5J2dxlx6Hl8tfTp8UO2FUsgERfPcFLx3/3J8
         PJAZqcQ0fLWHCOm9PIaxb/BvIbITCsvAWtQuc106T7bZ56WxARlTQgyBb1Ga/8tj2YUS
         v2wQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwQgZMlVAbPxajQaCvhppK9zPH6Bx/T+jzXw2+fJAIqSgesuTrutL7s8vWG/t69yI2cRPXuxckf20=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLdY8F0XkUXG5SulLgb2kDQjSiDnbzWPzSobfPXHJvPsDRL3yj
	hE0QhAiHFobYkn3kHP4X+BRJ8KYHZNO9qx2/Q1q/Ps/8bEKkP9tvg+K2MdTtpw==
X-Gm-Gg: ASbGncvJ8nXN5GVplQ+LLuKinyOVl12IMQDihMH0rHj6xp/9qcyxqRRwunzQmXa6wYL
	H7DLe3DJiaB1zQa20lNRcjRdaSH3ngHfklvDkpbM8qaIeCXsn3b0CSH1Qt5OoVECttJTHMmuQK/
	moRzYOjs16sTkSdJHanxLL3jFEzRSZiWzc6bvYmwAxdDh/IbZPvxevxG7+0F3p6AV8qr0eSj1fS
	pOCoKlavj55GrdhZ7F185n1rJsZA8wVFNVvvmNTSi3mMVgu+F0/86bK6TmxJ9NEf1cDr8CMSdNS
	/IiBrsDQcyZ32RSVH18MnMsAIbXCZ3VR0cMFHG39Yj9i4JfOPabzH0FsYMAArD7U8QzN7grjFxv
	+qLRx8zr5QmDCkltETAGu/plxvGTQuzNFhup2
X-Google-Smtp-Source: AGHT+IHbVcQXeejmdRKt7vJ18gEQ2jWq4Hw6F1EOg+12hm2gjHgwvvDiQlnxT0j7RwtsXcRFIovV3A==
X-Received: by 2002:a05:600c:1c91:b0:43c:f64c:447f with SMTP id 5b1f17b1804b1-43f3a9b4870mr19429805e9.29.1744376888114;
        Fri, 11 Apr 2025 06:08:08 -0700 (PDT)
Message-ID: <bdb04e97-07cd-4d31-8853-6aa5094aea0c@suse.com>
Date: Fri, 11 Apr 2025 15:08:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] x86/xen: Fix PVH dom0 xen_hypercall detection
To: Alejandro Vallejo <agarciav@amd.com>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 marmarek@invisiblethingslab.com, michal.orzel@amd.com, roger.pau@citrix.com,
 sstabellini@kernel.org, xen-devel@lists.xenproject.org,
 Jason Andryuk <jason.andryuk@amd.com>, jgross@suse.com
References: <D9366FPHFS9F.2OP8KH7C8OJTF@amd.com>
 <20250410195012.363658-1-jason.andryuk@amd.com>
 <D93TJIKWB1PN.3GQOSQV3KVT9F@amd.com>
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
In-Reply-To: <D93TJIKWB1PN.3GQOSQV3KVT9F@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.04.2025 14:46, Alejandro Vallejo wrote:
> On Thu Apr 10, 2025 at 8:50 PM BST, Jason Andryuk wrote:
>> A Xen PVH dom0 on an AMD processor triple faults early in boot on
>> 6.6.86.  CPU detection appears to fail, as the faulting instruction is
>> vmcall in xen_hypercall_intel() and not vmmcall in xen_hypercall_amd().
>>
>> Detection fails because __xen_hypercall_setfunc() returns the full
>> kernel mapped address of xen_hypercall_amd() or xen_hypercall_intel() -
>> e.g. 0xffffffff815b93f0.  But this is compared against the rip-relative
>> xen_hypercall_amd(%rip), which when running from identity mapping, is
>> only 0x015b93f0.
>>
>> Replace the rip-relative address with just loading the actual address to
>> restore the proper comparision.
>>
>> This only seems to affect PVH dom0 boot.  This is probably because the
>> XENMEM_memory_map hypercall is issued early on from the identity
>> mappings.  With a domU, the memory map is provided via hvm_start_info
>> and the hypercall is skipped.  The domU is probably running from the
>> kernel high mapping when it issues hypercalls.
>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>> I think this sort of address mismatch would be addresed by
>> e8fbc0d9cab6 ("x86/pvh: Call C code via the kernel virtual mapping")
>>
>> That could be backported instead, but it depends on a fair number of
>> patches.
>>
>> Not sure on how getting a patch just into 6.6 would work.  This patch
>> could go into upstream Linux though it's not strictly necessary when the
>> rip-relative address is a high address.
>> ---
>>  arch/x86/xen/xen-head.S | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
>> index 059f343da76d..71a0eda2da60 100644
>> --- a/arch/x86/xen/xen-head.S
>> +++ b/arch/x86/xen/xen-head.S
>> @@ -117,7 +117,7 @@ SYM_FUNC_START(xen_hypercall_hvm)
>>  	pop %ebx
>>  	pop %eax
>>  #else
>> -	lea xen_hypercall_amd(%rip), %rcx
>> +	mov $xen_hypercall_amd, %rcx
> 
> (Now that this is known to be the fix upstream) This probably wants to
> be plain lea without RIP-relative addressing, like the x86_32 branch
> above?

Why would you want to use LEA there? It's functionally identical, but the
MOV can be encoded without ModR/M byte.

Jan

