Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A98618C812F
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 09:12:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723860.1128991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7rkw-0001BF-Qp; Fri, 17 May 2024 07:11:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723860.1128991; Fri, 17 May 2024 07:11:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7rkw-00018i-O4; Fri, 17 May 2024 07:11:54 +0000
Received: by outflank-mailman (input) for mailman id 723860;
 Fri, 17 May 2024 07:11:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bw27=MU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7rkv-00017n-US
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 07:11:53 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcaac4a5-141c-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 09:11:53 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-574b3d6c0f3so4449237a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 00:11:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574ea5d755bsm4554916a12.51.2024.05.17.00.11.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 May 2024 00:11:52 -0700 (PDT)
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
X-Inumbo-ID: bcaac4a5-141c-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715929912; x=1716534712; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mq6i4DzkB4Dc/X42+OKA6whNauQKkseIsPXHgnpnpVo=;
        b=bYAfR+Ch6B5u47ZshPoOaEg+d3UY+3vemklcvVb8YKRm/Hiv0SO0mwi1pSczjmm4A8
         K6uK328gquA52QtFLvtbA9JTHcaftAgqQH7I6MDAjuXMsih1KXKTUbvwZkChUG5XKkPB
         fBMjG9/BZGMcRmluydSfBc0wo4prfGVFtSmkEOSIZogOr+SfjWbQye5DvMwzp9wxy9gz
         a7LEmQud44WG0dc0N/k/9ylqcEgW00ua3Iv60NiklWGhofW+Ze6I0tDyYPviLQBqyRIZ
         iOK4RjfmIcfSg8pbQ74aNmLrqWtRui8nHSM/91WwdIwY+IoJBUl/gEclVGpDR0Qu4h1l
         3uag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715929912; x=1716534712;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mq6i4DzkB4Dc/X42+OKA6whNauQKkseIsPXHgnpnpVo=;
        b=wjKbVKvPAB28/zVMWNkyB+9khDkBzN8JA1hXF1BiXkjgti2ZR6D9BwgphoWEUlIq0x
         nP2sl0TgoLOlGeNIyHyREnv9ZZaBuXt6oNL9HVnKDz2PI6UyFrYrYkyIDUocmPPZYLt4
         ud+3fNNphrkKCQvo0zNIQ+CdFbweIKGQPASzieEuakhAAKugIfZiWz2Sh7Ru26+1k62L
         i2fW4JTh/xIDnabLfTRh/8BCSgRarB9LMQsSluNBlSbhGzg4tdd7vJ0PqGSRe91jEPM9
         HuYc1UJ6+2pI0Zvcc5iTnJV7JlSi6EE9LOAWSEAcwcL8sE57YukzNblhRH0ZiAM85i9a
         1NvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPW2dPLkcWWkC8EdTADc9X+6PX1khHJhqGZYUi1vKcpbA53el+duDInl3b+ZxMlyM58y827gLwzPoKTF4x26FHCNKLyLqTmC1S5iZIrx0=
X-Gm-Message-State: AOJu0YzpOQcTWE4UM9lJVQyhoalRNJI00mhZLCf14eq6UZyuI0BGrnIP
	VHf5J84Z17TYKsStBm16C/blwIPWVpxvD+GenBdIix5zwqYz99ihhKmvFpB5JA==
X-Google-Smtp-Source: AGHT+IEIUrzqOFbJxxYCYchsoxhDvpeHH+aiBmXSEt7Ii4MXzMMB8rJFNbYmT9TkGsPLqhAuXp1EiA==
X-Received: by 2002:a50:9b42:0:b0:568:c6a2:f427 with SMTP id 4fb4d7f45d1cf-5734d67aa84mr14606663a12.27.1715929912490;
        Fri, 17 May 2024 00:11:52 -0700 (PDT)
Message-ID: <5a979a5b-51c0-4359-813e-d9307932d8f9@suse.com>
Date: Fri, 17 May 2024 09:11:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] xen/arm: Add XEN_DOMCTL_dt_overlay DOMCTL and
 related operations
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20240516100330.1433265-1-xin.wang2@amd.com>
 <20240516100330.1433265-7-xin.wang2@amd.com>
 <28138e7d-26c7-4faa-86f1-a1c7b175114b@suse.com>
 <1f02615c-916c-4ab8-babc-17a117c56e87@amd.com>
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
In-Reply-To: <1f02615c-916c-4ab8-babc-17a117c56e87@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.05.2024 03:36, Henry Wang wrote:
> On 5/16/2024 8:31 PM, Jan Beulich wrote:
>> On 16.05.2024 12:03, Henry Wang wrote:
>>> --- a/xen/include/public/domctl.h
>>> +++ b/xen/include/public/domctl.h
>>> @@ -1190,6 +1190,17 @@ struct xen_domctl_vmtrace_op {
>>>   typedef struct xen_domctl_vmtrace_op xen_domctl_vmtrace_op_t;
>>>   DEFINE_XEN_GUEST_HANDLE(xen_domctl_vmtrace_op_t);
>>>   
>>> +#if defined(__arm__) || defined (__aarch64__)
>> Nit: Consistent use of blanks please (also again below).
> 
> Good catch. Will fix it.
> 
>>> +struct xen_domctl_dt_overlay {
>>> +    XEN_GUEST_HANDLE_64(const_void) overlay_fdt;  /* IN: overlay fdt. */
>>> +    uint32_t overlay_fdt_size;              /* IN: Overlay dtb size. */
>>> +#define XEN_DOMCTL_DT_OVERLAY_ATTACH                3
>>> +#define XEN_DOMCTL_DT_OVERLAY_DETACH                4
>> While the numbers don't really matter much, picking 3 and 4 rather than,
>> say, 1 and 2 still looks a little odd.
> 
> Well although I agree with you it is indeed a bit odd, the problem of 
> this is that, in current implementation I reused the libxl_dt_overlay() 
> (with proper backward compatible) to deliver the sysctl and domctl 
> depend on the op, and we have:
> #define LIBXL_DT_OVERLAY_ADD                   1
> #define LIBXL_DT_OVERLAY_REMOVE                2
> #define LIBXL_DT_OVERLAY_ATTACH                3
> #define LIBXL_DT_OVERLAY_DETACH                4
> 
> Then the op-number is passed from the toolstack to Xen, and checked in 
> dt_overlay_domctl(). So with this implementation the attach/detach op 
> number should be 3 and 4 since 1 and 2 have different meanings.
> 
> But I realized that I can also implement a similar API, say 
> libxl_dt_overlay_domain() and that way we can reuse 1 and 2 and there is 
> not even need to provide backward compatible of libxl_dt_overlay(). So 
> would you mind sharing your preference on which approach would you like 
> more? Thanks!

While I think tying together libxl and domctl values isn't a very good idea,
if you really want to do so, you'll want to add suitable checking somewhere,
alongside comments. The comments ought to keep people from changing the
values then, while the checks would need to be there for people not paying
attention.

Jan

