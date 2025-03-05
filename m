Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70372A5030C
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 16:03:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902451.1310420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpqGt-0000D7-48; Wed, 05 Mar 2025 15:02:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902451.1310420; Wed, 05 Mar 2025 15:02:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpqGt-0000CN-1K; Wed, 05 Mar 2025 15:02:55 +0000
Received: by outflank-mailman (input) for mailman id 902451;
 Wed, 05 Mar 2025 15:02:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tpqGs-0000BW-3f
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 15:02:54 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9b127e6-f9d2-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 16:02:53 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43bd87f7c2eso2628635e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 07:02:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd6530f26sm14217885e9.4.2025.03.05.07.02.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 07:02:52 -0800 (PST)
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
X-Inumbo-ID: e9b127e6-f9d2-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741186973; x=1741791773; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cYJfryi3uCgAHEybKeFZAQ7Zv3eRpV9dRlrTMaZBi0A=;
        b=BJjFZ8cRB6PIOWoQKBVY2+6dcRD30391K43rlt7vpw2wrF10QIpUU00hJkI5QAyFy2
         fuDztokGvdMSmAJph6KKu1FBXKttuzIOQa+B0EBEuQb2RIOYLIg94Rz6bOogQrY8VCJX
         HjolhigU5ZxRNAKIo+ZVnpldvyPtRGWGB+VLUj4LrBo4B9Hzrp3HekUu1mFSxzVYSLjR
         sZG7OsqXYHGtk30X2dh+BI1e/Vg6c6Z5OgrWs/xjTxoGqiBRu/acGA0DJhdPtHWYwtmh
         GVK3MssFNGpbjWCPUk0evtsR0peQuy4QHOSEjUqaDYsUSD2nx7c1RDdVlkWOWRYpjLlw
         Rl1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741186973; x=1741791773;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYJfryi3uCgAHEybKeFZAQ7Zv3eRpV9dRlrTMaZBi0A=;
        b=OT+IpmyPyhVymJoXGI70ZkOTv0yeWUNURJnN4tRbv1blzCGfi01DNBGj5AH1H8NFro
         RjM9Z1h8+PZPcMpNqJRO9J8i4Vh8Nnr/OSPPVlsi3M4L3Qt1C3F+rjm1fe1K2NPmjdr8
         /3lp6UE+D6uHWt7BzJsT86l2H4j2ZFC6Y3aHhHrhi/f0ce8gTMM5lkuty0QzCuJrPCPC
         UhMLCePmQ2+Fac9olWVThaoEB+B+E1L1fMak84l7lpcAOUj/fRPMry3ObjEJp2BLWgdi
         ryEdiAm2qP9eNLlWtIq0XWs4Aos/a2qTv8ETv0JUN7l/LcXhi+TmILjRRYMdipY6sSle
         kf7w==
X-Gm-Message-State: AOJu0Yw4FQcM07NW4zgQDCBdbeMDskfsVwbgJkvHYlaM7mYNCITI8yvX
	1MMM+kboIXTu8P75oIHuzYzh2UlQXN6JSodYBlNy2Jlb3HzBoJfVMooBZhN3rDHxu7BDjZHzNqg
	=
X-Gm-Gg: ASbGncvISh54B4/Pd/7l2xR2WdkLuQFfWax4yI6sOCe/PVrl/+IebJCSNUaiVv2s81e
	jJIXB2fv5EVEQs9fteb/f5rUYeJ+or5q4NLKctuBPddntSkYDekuQCCqkv2NuZDxLSU2Af/aDxw
	9qiBURXRPGO/SuavUbs2cfKnlL0yRYVs4b2Cce68iT20LggRg9+z4JzeMxtO4PAxpxcgLl3b1lO
	g0PuIIaNlq/4Tt3pw1ze9XzHB0RhGjOMe279txhlHpbgTkr2w9C5IVrTZLGh5GUFAnF0QygpGgK
	CGDCAaz/LqelvJ1I5VfdNbqwgU1PDHDN9dJn4FNmGnrnX5Asu5j3cp69I7FNXPuW/LksPdTDLNI
	nkaNM3vYefLQMGT2YeINvTLRBB7wvBg==
X-Google-Smtp-Source: AGHT+IHihhuz56KmP8lZvKL4xFruEC1c9RKQRLpGOAfK3cjhdr7guVSvMliwyWyWPZvcB8Z9lrXYyQ==
X-Received: by 2002:a05:600c:1c26:b0:439:9274:81db with SMTP id 5b1f17b1804b1-43bd292a806mr33993695e9.5.1741186972421;
        Wed, 05 Mar 2025 07:02:52 -0800 (PST)
Message-ID: <5978ed8d-ecef-41f7-adde-bc52312b483c@suse.com>
Date: Wed, 5 Mar 2025 16:02:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/11] x86/HVM: improve CET-IBT pruning of ENDBR
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <748548e8-79e5-4957-be16-c5ea4d202d21@suse.com>
 <29cc2974-a1d8-4123-83b0-b44a3151f900@suse.com>
 <Z8hkLjMAQfhBR2Cm@macbook.local>
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
In-Reply-To: <Z8hkLjMAQfhBR2Cm@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.03.2025 15:48, Roger Pau Monné wrote:
> On Tue, Feb 25, 2025 at 12:37:00PM +0100, Jan Beulich wrote:
>> __init{const,data}_cf_clobber can have an effect only for pointers
>> actually populated in the respective tables. While not the case for SVM
>> right now, VMX installs a number of pointers only under certain
>> conditions. Hence the respective functions would have their ENDBR purged
>> only when those conditions are met. Invoke "pruning" functions after
>> having copied the respective tables, for them to install any "missing"
>> pointers.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> However I find this filling slightly ugly, and prone to be forgotten
> when further hooks are added.

Indeed. Luckily, while undesirable, that wouldn't be an outright bug.

> Would it make sense to delay enabling of IBT until after alternatives
> have been applied, and thus simply not use the cf_clobber attribute on
> functions that are patched to not be indirectly called?
> 
> We could still enable IBT before starting the APs.

I'd prefer if Andrew answered this. It looks like it might be an option,
but it also feels as if this would (if only a little) complicate logic
overall.

Jan

