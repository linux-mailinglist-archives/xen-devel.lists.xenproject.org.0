Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD478A8432
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 15:20:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707504.1105484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx5CB-0002Ub-5r; Wed, 17 Apr 2024 13:19:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707504.1105484; Wed, 17 Apr 2024 13:19:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx5CB-0002Sx-2T; Wed, 17 Apr 2024 13:19:27 +0000
Received: by outflank-mailman (input) for mailman id 707504;
 Wed, 17 Apr 2024 13:19:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rx5C9-0002Sr-Ex
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 13:19:25 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bb61ec6-fcbd-11ee-b909-491648fe20b8;
 Wed, 17 Apr 2024 15:19:24 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-41879819915so20395535e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 06:19:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g18-20020a05600c4ed200b00417d624cffbsm2878656wmq.6.2024.04.17.06.19.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Apr 2024 06:19:23 -0700 (PDT)
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
X-Inumbo-ID: 1bb61ec6-fcbd-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713359963; x=1713964763; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nkQ8odfQAXubLpGe5gvgHqgA1PrWnw0+zR34CFp8i3g=;
        b=GoinMqP3fdajHtiW0qv0vL3xaP+aLTNRdKKnkZxSKnCLVBe7xhPXae7f0lWXuhQykG
         DeHpkesJ0irLmIucv24FrZdKBa6qdmwFQHZ1gUYJmjAZgjnGmvvfynPUDc5VYhM4b1tk
         qIV9tDT+lI5pySI1e3FzPhPfmWITBdH+J+UgC/I/u+xsOxL995WaFN2hl9HYL0V2yo1r
         8wxroxgRTEBlgIMYYbm6vlH6mBlHdgxUr+sLKQnHMJkidlJ9FsxGFPhXxdQklYDeurjM
         gefsyX7drjLqa952BrxbwCryGAq4lMGsv2Me1dIKOE+Yrt874xfSVuOHeTQR2GwNTJ8U
         A+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713359963; x=1713964763;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nkQ8odfQAXubLpGe5gvgHqgA1PrWnw0+zR34CFp8i3g=;
        b=OoMX8UIxmGwfo854of+iwBvRxu1TDpUkOIzy6Hi2m1e4ZD/NDRC97Mgx/7ZtRdzL9Y
         rCkcPQmQLJKrMfvHPhkYLCr8r7bHuGyPUpeEpevStg7ig45sj7kWN0jdhW3DpIxrLwXC
         4hMIm5jTseZuvPeIt02LZZy7vI/fLg8iQHNNqdu4mIPfq8WPkDJG40N7F2apxHr8xMF0
         dZkxiJ/pmUkkGFDa65ak19ME79ibdZFcNXlCyk4fJ3l/z7oUxoC+IW/5Dpd7ZYr3wI2m
         NNfngNmldMVx+Z83xFPPLkgYcfFA1K3i0T2Dl6a/jtQCqHlKRS1YAIWCB7PkMdF+qQEp
         9HaA==
X-Forwarded-Encrypted: i=1; AJvYcCXuHHBIL/ejJLmj+oXYd5VU7iFltJj33zvy8nqFuAiahSwil//yvMrNoXDZR/F9AYOeIn12Y9MDmOMGmHZWliAGPww1VpTtPOmn39wcroU=
X-Gm-Message-State: AOJu0Yxkbqc+lxvfZT79RBDqLk+Dnp3hJ4PNeWdt2qMKqtDLj2UMSyAb
	TWtApMVIMSho7Rv2gaJvwPycwExaq3tdIVDRU4MR07ZmAHsDAMstPEshkheclw==
X-Google-Smtp-Source: AGHT+IF75qUH4eCxni1ExkRGiDw//Jz6qyTQC92LKM482ntNE6wNbCdjMt7FgIIOu9Cj/LHIVr5Ngw==
X-Received: by 2002:a05:600c:1994:b0:418:93d1:ef15 with SMTP id t20-20020a05600c199400b0041893d1ef15mr4010448wmq.10.1713359963473;
        Wed, 17 Apr 2024 06:19:23 -0700 (PDT)
Message-ID: <1d8e72fc-0c46-4ddd-ad5c-06baebbfb237@suse.com>
Date: Wed, 17 Apr 2024 15:19:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 9/9] xen/ppc: mm-radix: Allocate all paging structures
 at runtime
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: tpearson@raptorengineering.com, xen-devel@lists.xenproject.org
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
 <00f22a6a08451614179219fd430539fbb1e6e8cf.1710443965.git.sanastasio@raptorengineering.com>
 <beab0b2a-b8ff-475c-885f-dec8518b9a8f@suse.com>
 <dec634ec-b028-42c9-a8b1-64e32c86dfbb@raptorengineering.com>
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
In-Reply-To: <dec634ec-b028-42c9-a8b1-64e32c86dfbb@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.04.2024 05:19, Shawn Anastasio wrote:
> On 3/25/24 10:39 AM, Jan Beulich wrote:
>> On 14.03.2024 23:15, Shawn Anastasio wrote:
>>> -static __init struct lvl2_pd *lvl2_pd_pool_alloc(void)
>>> -{
>>> -    if ( initial_lvl2_lvl3_pd_pool_used >= INITIAL_LVL2_LVL3_PD_COUNT )
>>> -    {
>>> -        early_printk("Ran out of space for LVL2/3 PD!\n");
>>> -        die();
>>> -    }
>>> +    min_alloc_mfn = _mfn(min(mfn_x(min_alloc_mfn), mfn_x(mfn_first)));
>>> +    max_alloc_mfn = _mfn(max(mfn_x(max_alloc_mfn), mfn_x(mfn_last)));
>>
>> Together with the comment ahead of the function - is there some kind of
>> assumption here that this range won't span almost all of system memory?
>> E.g. expecting allocations to be almost contiguous? If so, I wonder how
>> reliable this is, and whether using a rangeset wouldn't be better here.
> 
> You're right that this is only sane (i.e. not mapping almost all of
> system memory) when the assumption that alloc_boot_pages returns
> mostly-contiguous regions holds. I'm not super happy with this either,
> but I struggled to come up with a better solution that doesn't involve
> re-inventing a rangeset-like data structure.
> 
> Looking into your suggestion of using xen/common's rangeset, it looks
> like that won't work since it relies on xmalloc which is not yet set up.
> I suspect there is a chicken-and-egg problem here that would preclude
> xmalloc from sanely working this early on in the boot, but I might be
> wrong about that.
> 
> I could reinvent a basic statically-allocated rangeset data structure
> for this purpose if you think that's the best path forward.

Question is whether anything statically will actually be suitable.

Rather than re-inventing anything, I think it might be okay to keep
the logic as you have it, but with commentary added making explicit
what assumptions there are (and why, and why in the common case it is
acceptable to make such assumptions, and maybe even what to do when
any of the assumptions turns out wrong).

Jan

