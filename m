Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAC3A3DB52
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 14:30:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893891.1302733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl6dW-0007lm-9V; Thu, 20 Feb 2025 13:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893891.1302733; Thu, 20 Feb 2025 13:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl6dW-0007jO-6U; Thu, 20 Feb 2025 13:30:42 +0000
Received: by outflank-mailman (input) for mailman id 893891;
 Thu, 20 Feb 2025 13:30:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YfIj=VL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tl6dU-0007ej-NP
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 13:30:40 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e045d4cc-ef8e-11ef-9aa8-95dc52dad729;
 Thu, 20 Feb 2025 14:30:40 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ab744d5e567so168676766b.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2025 05:30:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53232275sm1461068466b.31.2025.02.20.05.30.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2025 05:30:39 -0800 (PST)
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
X-Inumbo-ID: e045d4cc-ef8e-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740058239; x=1740663039; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b81DVl8DFv6DJQqzDoolbPGWqZTEgBTdUEWhITGvWa4=;
        b=DiunO9V9Byit2bFQgPtAq0PqSTEWHtQnM4Y5gCfclNloomDkDo6aLLq9Ip1GC/fa+B
         Wnx1ngrCEIZWXMJIA1RzRgFrkoFpzQEEhJ0aDbMQ7HqxrIFBxy5CoRErUL2+G2hu3Krl
         zchS9J7yd72tIjJXRxxzuP4qANu3ISXJ6B9bOVRVPEKpySDZAmkIBaHFaIqQtM7eB/sX
         CYFu9AQOm2bVxUh55+GVec7+vPJthyCmH6vsNE8k3gOFRuz69Lt7O9MwBTWV/XgRTj2H
         GXiAlAr+vTMoyI3BZ4nIt4jl7p1nlOPESiahtXqiIVXlGRFBucnC3QqZIDN5JPEapd1H
         O1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740058239; x=1740663039;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b81DVl8DFv6DJQqzDoolbPGWqZTEgBTdUEWhITGvWa4=;
        b=IQJx90SI7S3FACzfP2WpUcavrJckP/4HOUEImUtSjhHsTBEvHis6E9H0F604DZIkvK
         Z3WP5XWum+HnZ/VcWlFlvPe3oQfN1wxQyy4f3AAmNjv5vfUNzF6faPgiACiU/+XUHNxt
         msGQNjxOGzkWt27dQUDwy7OeLF5810+PYJyxocifSTLh9QUAx9J48lzf7rbebCgeaMAY
         7EkHDMPmYbwqEToTuDCXWyyGJ3Ci0ZzXd+AoUBT/SNJiwQQsOJ2SvDMdvP6LLcXeaIo5
         tCsHEQEIxAr0EDzLnrvkhf9jA6uIXQYyvPt1ENgyI8w+YEWD0FaPl7+BTNaOYf+R9/5m
         s/vg==
X-Forwarded-Encrypted: i=1; AJvYcCVMEL5pg3Atl1aru5W1ODeBCKCKk8NDj+IiRjRHr98sdgTE+96ZVXCas0Y18aqV+QQyOyxzkzjnmyM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YymQ2Inv0SHM2GDUOBwfIRcfifWEgoZ6093Ew8nXxivU7bbEzjv
	2pdYe4TPlLoeSB02wcD2LHmFmWr5K3aeOJXHAPzf7N1lEodDGzxqS26/vD5fiA==
X-Gm-Gg: ASbGnct6i5fJhYYXGsncAvcET63AV+GJhBBkd91wEKPwcoxlV0MI0KW489hb+Bzw2+O
	ERsLUDbcWo4QNcLS2WvqmV59wqxP3zZBmFmd5w8g8ZKA6wkNc4RG7C/CWEQC4jcVOBB0ueE/cxY
	RXpQgMkhvqa9OFe4dxQRwnFVTCptCDY4D0mv9HjfeH2WRWkJV0odZ3vhfyfm9PLO8R9caXvie10
	EP5QH+su2GvIlZ7S7fHakir0Gz+HC2vPs3LYGaIzi7vKbEmuV9QICcuaZQEuaoGZwH8zOfIjIrE
	vB0NmqqNeK+Kj2kNTCdxhxvJ3KjPlI0/sXCQzlCdyDqzSB7ixgJMJyocQetLj6HEtPNKRjhMsS+
	Z
X-Google-Smtp-Source: AGHT+IFmDHhJBzZWi8qOlSrsq2vrQELJfgsicTn/p9vaZXGZNUlVC8QLHCKJePlhwtfzb5guWbMlzg==
X-Received: by 2002:a17:906:6209:b0:abb:b602:6350 with SMTP id a640c23a62f3a-abbedf561d3mr299962566b.25.1740058239587;
        Thu, 20 Feb 2025 05:30:39 -0800 (PST)
Message-ID: <c8ce79c1-0d8a-45b3-868a-2b67b05d6aee@suse.com>
Date: Thu, 20 Feb 2025 14:30:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] x86/dom0: be less restrictive with the Interrupt
 Address Range
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?B?SsO8cmdlbiBHcm8=?=
 =?UTF-8?B?w58=?= <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20250219164840.94803-1-roger.pau@citrix.com>
 <20250219164840.94803-4-roger.pau@citrix.com>
 <1e8ef6d3-09db-4d53-b7c8-4b10a7f5d8f0@suse.com>
 <Z7buBc4yLtf-UpmB@macbook.local>
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
In-Reply-To: <Z7buBc4yLtf-UpmB@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.02.2025 09:55, Roger Pau Monné wrote:
> On Thu, Feb 20, 2025 at 09:33:46AM +0100, Jan Beulich wrote:
>> On 19.02.2025 17:48, Roger Pau Monne wrote:
>>> Note that the restriction to map the local APIC page is enforced
>>> separately, and that continues to be present.  Additionally make sure the
>>> emulated local APIC page is also not mapped, in case dom0 is using it.
>>
>> But that's in GFN space, not in MFN one. Why would that matter for iomem_caps?
> 
> It's required to avoid arch_iommu_hwdom_init() creating an identity
> mapping for APIC_DEFAULT_PHYS_BASE, which would prevent the local APIC
> emulation from being used.

Hmm, yes, on one hand such a mapping would be created by default, as we
default to "dom0-iommu=map-reserved". Otoh that mapping would be replaced
before Dom0 is actually started, via the domain_creation_finished() hook.
On (modern) VMX that is. So yes, on old VMX and on SVM the slot would need
to remain unpopulated. Otoh, when the physical LAPICs are elsewhere and
when the domain is in x2APIC mode, there would be no reason to disallow
Dom0 access to that page. That would apparently mean fiddling with
iomem_caps once all vCPU-s have entered x2APIC mode. With LAPICs not
normally being elsewhere, question is whether this corner case actually
needs dealing with. Yet even if not, commentary may want extending, just
to make clear the case was considered?

> Note that mp_lapic_addr can be zeor if the host local APICs are
> started in x2APIC mode, or it could (in theory) contain an address
> different than APIC_DEFAULT_PHYS_BASE.

Of course; I didn't mean to suggest what you do is simply redundant.

Jan

