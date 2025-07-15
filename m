Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2027B0598F
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 14:04:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044035.1414085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubeOK-0001o3-3Y; Tue, 15 Jul 2025 12:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044035.1414085; Tue, 15 Jul 2025 12:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubeOK-0001lD-0L; Tue, 15 Jul 2025 12:04:12 +0000
Received: by outflank-mailman (input) for mailman id 1044035;
 Tue, 15 Jul 2025 12:04:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/5o=Z4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubeOH-0001l7-Rv
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 12:04:09 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfd43370-6173-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 14:04:08 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a522224582so2717397f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 05:04:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3bbe7281d5sm11892495a12.65.2025.07.15.05.04.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 05:04:06 -0700 (PDT)
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
X-Inumbo-ID: cfd43370-6173-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752581048; x=1753185848; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YBGaNYjvIcDa8b44F51BZuLzd/8z6NbPTXsvHdZymq8=;
        b=UDBXLwwupatRALVejWJAKfSl7aAOcCqVognz6gpOS8CFXnRyJJqjDZ/EChMWpQCVl5
         c48rWvv5E7pni+PL0fimSOwn2sNFQoMfG9Mg7UF86dKAJE4DNFFYBFSLkAuduDHXhERO
         aW8gJhloW9wlL0oHP4DoqjctEUApT+kCNFdw1pzSH1SrRtgs0aITd0m6e5whMW6rhley
         LEN9fKR+L9r4NKk7QcNTO/3l2XiOIKHNE1bLEUeQBQkKWZgPQDykaYPirPeC1/aONw3s
         N0txsVEXe9vapXeVL0sL2+PUT+atW4ARVgGPugq3R8hekuGRYIsSZHm5JrYXGedCf6Ff
         4hkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752581048; x=1753185848;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBGaNYjvIcDa8b44F51BZuLzd/8z6NbPTXsvHdZymq8=;
        b=fKg7Gks8OrPze8hwrdtMIcx+XqiBzrh9LalU0oTKfBZHcJzSnGUQTGeXMDXpO7qI7S
         4GXCvDZNqHzSKs9p0l59UlUMWoeMf0sGjSu4NU/mw4hZC0nmStJgoeM8N+kpkfFJpwtU
         U1S3VTGRRo0FMDW6U2UolxzmwWiO0EX36PGSdQFD4yZkKkMFkp/rHgg3ZQyfhsEFDIXB
         /+eUyuSInpMhGYAGbFzPipUSPiwX6wco6ybh7y7xzspDPGMZTTGLoVVn7FLOOrC9T2oo
         MGEjZdi8UES4hf17IvNhLuHwxkLFG3ULW1MUQrxVqaeoh+wIf5yxxyPkLcVCNpx80pvM
         mXrA==
X-Gm-Message-State: AOJu0YzgvoMf3w/VNwl4UfAhbh6geD0+v/+sAKAr5NPa8YVUMrL1qdBs
	F+NaDwrdY8K+t5T81GsD17zMlUAWbMmPnibH7tK6Z6VWFnXU/NadAAFV6JSG1ABiKg==
X-Gm-Gg: ASbGnctPrJrY+dzfCLRAoQVVujNKbOhhc3AaUMeYaToU6KYrevMTrQIpAkzUxpLGRxg
	mcHzv0BHgNmt4Q/xYvoGJRzSqZLHMfMEKnVH2k3+gEM7VB4ERNrOJzxBWfpr4f9IYQtxYMCXh3Y
	8SEwoLxK9iDMXZ0+mZks61ucJS0qrIcOwd9mWo/gUON//fagFQTJokhfzl9IGTGSqFPIYJWiVql
	ewgPI/zhY562EMU9lWDkhly8mJDa/FJ+kxQZQa3LiETKvxSwvIBL3b9lE/8O7LBtOh923d1QEyY
	f2jWFQ1thyasyX9tD+neBPnfMBILJZXpr/OZSDeMMXoqCm472r77L5vbaQPNMbtcngBhp3BPKD5
	EjTYQ7E9GiUVn0QYtyqapT4H41g63vRVI40r38Bl3gRy8NxOC7QIZwdv/pt6vBOfjSWWtjDuYj7
	yAbuCFuqE=
X-Google-Smtp-Source: AGHT+IH59JeQSrnHXDGPEJ/GcTWMbBzQ450ODJ2fpXKjkHL0o+0x+VX0Jm46gBO4ODdxCE0le3B5hg==
X-Received: by 2002:a05:6000:40cf:b0:3a6:f2da:7fe5 with SMTP id ffacd0b85a97d-3b5f359996cmr11803352f8f.55.1752581047304;
        Tue, 15 Jul 2025 05:04:07 -0700 (PDT)
Message-ID: <5bdfb833-99d3-4b91-9de8-53f8816a48fb@suse.com>
Date: Tue, 15 Jul 2025 14:03:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/PVH: modify permission checking in
 hwdom_fixup_p2m()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <8c610e0e-6778-4d94-92c8-35b280d05b46@suse.com>
 <aHYo4kLRj9LpdaTs@macbook.local>
 <01fb45a5-0e5a-4379-8d36-ec8002739b51@suse.com>
 <aHY1qZJXkKXi4bt5@macbook.local>
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
In-Reply-To: <aHY1qZJXkKXi4bt5@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.07.2025 13:04, Roger Pau Monné wrote:
> On Tue, Jul 15, 2025 at 12:47:15PM +0200, Jan Beulich wrote:
>> On 15.07.2025 12:09, Roger Pau Monné wrote:
>>> On Mon, Jul 14, 2025 at 06:09:27PM +0200, Jan Beulich wrote:
>>>> We're generally striving to minimize behavioral differences between PV
>>>> and PVH Dom0. Using is_memory_hole() in the PVH case looks quite a bit
>>>> weaker to me, compared to the page ownership check done in the PV case.
>>>> Change checking accordingly.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Thanks.
>>
>>> Kind of unrelated to this specific patch, but what's our opinion on
>>> turning on pf-fixup by default before the release?
>>
>> As far as the patch here goes, the relationship is very tight. I came to
>> make this patch only while investigating whether we couldn't have Dom0
>> report the resource (MMIO) ranges early enough for us to not even need
>> such fixing-up. Sadly, as per [1] that turned out pretty much impossible.
>> Which means that while I'm still pretty hesitant of us doing something
>> like this by default, I can't currently see a way around doing so. Hence
>> perhaps yes, we may want (or even need) to turn this on by default.
> 
> Sorry, wanted to reply to your previous commit alternative approach
> email, but got distracted with something else and forgot about it.
> 
> While I won't be opposed to having a way for dom0 to notify extra MMIO
> regions it wants added to the p2m, I think this is likely too much
> fuzz.  For example for FreeBSD I wouldn't consider adding such logic
> to the kernel, simply because I think it's likely to be too intrusive,
> and would rather rely on pf-fixup.  Overall the amount of p2m fixups
> that Xen ends up doing is always fairly small (I usually see maybe 4
> pages tops), and only as result of ACPI related accesses.  IMO it's an
> acceptable compromise to map those as individual 4K pages.

Yes, and my concern isn't so much what we map, or how many pages there
are, but that we do this behind the back of Dom0 (and also not ahead
of actually launching it).

As to the amount of accesses, these are the ranges that my SKL reports
through the temporary hypercall (as described on the v1 thread):

(XEN) sysmem: fed1c000 (24000 bytes)
(XEN) sysmem: fed45000 (47000 bytes)
(XEN) sysmem: ff000000 (1000000 bytes)
(XEN) sysmem: fed1b000 (1000 bytes)
(XEN) sysmem: fd000000 (ac0000 bytes)
(XEN) sysmem: fdad0000 (10000 bytes)
(XEN) sysmem: fe000000 (10000 bytes)
(XEN) sysmem: fe011000 (f000 bytes)
(XEN) sysmem: fe036000 (6000 bytes)
(XEN) sysmem: fe03d000 (3c3000 bytes)
(XEN) sysmem: fe410000 (3f0000 bytes)
(XEN) sysmem: fdaf0000 (10000 bytes)
(XEN) sysmem: fdae0000 (10000 bytes)
(XEN) sysmem: fdac0000 (10000 bytes)

Some of these ranges are also E820_RESERVED, so would (by default) be
mapped anyway. That's most notably the ff000000 one. The other regions
exceeding 2Mb in size aren't visible in E820, though.

As they're all reported by ACPI, they all could in principle be accessed.
Just requires the right drivers to be loaded, I expect.

> I would only consider the alternative approach of using a hypercall if
> we saw big regions being mapped by pf-fixup, because in that case it
> would better be using p2m superpage(s).
> 
> I think we want to enable pf-fixup by default at some point, the
> question is whether you would consider it appropriate to do now.
> Given it's limited to PVH dom0 only, I think we should enable for this
> release already.

As said, since I see no alternative, we can as well do it for 4.21. No
matter that I'm hesitant about it.

Jan

