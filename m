Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9134974DCC
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 11:01:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796287.1205795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soJDA-0005dg-Ro; Wed, 11 Sep 2024 09:00:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796287.1205795; Wed, 11 Sep 2024 09:00:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soJDA-0005bC-Od; Wed, 11 Sep 2024 09:00:28 +0000
Received: by outflank-mailman (input) for mailman id 796287;
 Wed, 11 Sep 2024 09:00:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soJD9-0005b6-BY
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 09:00:27 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 486b1c3b-701c-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 11:00:25 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5c26b5f1ea6so8219181a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 02:00:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd46909sm5426132a12.25.2024.09.11.02.00.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 02:00:23 -0700 (PDT)
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
X-Inumbo-ID: 486b1c3b-701c-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726045224; x=1726650024; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MtAww5OZ7Vsvkujnb4zKxUwVfLAG3B12fWbfPwzoGA8=;
        b=Pgl+ygywl0z1Uh22DuPP3422KypM7cOzHuMi0EA0A+PB8b0h6lgIM7eWPVu9g8nkbM
         EMt9W3Q4gbG37wHqnwzuoxfSmCbTAckwAA3b/Jzwkjo9IXeZoHloD9xDrqicQPhPJJ/0
         no7ubeMPomNbnzIQyoB+5sm0zizz8CbqjCEiHzixB9Ya6vEIrFmorRnFXssMlKJojUSX
         b+M+wAwzD/xI4tjWq/k+4MBuhzxbU6DgO0BWm0PkNn6wFQ6NEwwsSI93j297M7sxgOgp
         mK6IrnC3eQYzDfCdqPwzDegsuTSi1JZuFuN1jlqyaPIghD5KZVD5mXn22LywkEinpMlM
         oMfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726045224; x=1726650024;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MtAww5OZ7Vsvkujnb4zKxUwVfLAG3B12fWbfPwzoGA8=;
        b=BR9SibF1cwspuIBML0DH8xalB2Mdoc74jKnPV7T0WuIIyn8gvdDyeZUx+mM6Z0ODN/
         R6Orc+x3mR+L4Q5mCT6gh0N07i5FlzTn60L42419/wgffD94ax0nrEvZiEkqBvtfn6JP
         wxjlo1tRwoZMzTbwJpnK87rrqz/gfCZ++ZK1LMEap+0rb8F0ysS2gOmfbGcwmxMIvcrp
         KdmWTBi6tVlx4ZlOSTuM3RYK1QSGHxs3bc90c4ZKP2B6skjM9aSy/hpc+DuWujyBqntd
         lGKnGwF4g7UZBkr3gvuk2QxQGhYIWQ1GWDmwY3mhxZyQq1ejYZNmtcgxxATonoCqqPcF
         pbzw==
X-Forwarded-Encrypted: i=1; AJvYcCW9RNh1khpXg6jJ6wBOpi+fLZzKgATj+fKnn/eKaACkrwxzCbvvq4VMNX2EnJ0rCOdtQpiRoSm6JQc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIeBUXhGZ/Id2HLUa3P5RHhzvAi9x0UilktoXXg7Db5Kh5V10O
	tjg0ZOXjuVifvIG0GiKxjiwslsVPQXzMUQX0wL3+1lWKFlMsAL1N+F2VMph/lA==
X-Google-Smtp-Source: AGHT+IFMfY1OfkHdqvy5eudlHqoF0qocagIv0mSotBNSnCfZ911gFdb+DLGFl4VOayIYrNS+HM5EWQ==
X-Received: by 2002:a05:6402:34c4:b0:5be:cdaf:1c09 with SMTP id 4fb4d7f45d1cf-5c3dc7baef3mr13852058a12.28.1726045223964;
        Wed, 11 Sep 2024 02:00:23 -0700 (PDT)
Message-ID: <40d0ae33-057a-4fb0-a6ce-181cdc1713e1@suse.com>
Date: Wed, 11 Sep 2024 11:00:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] x86/HVM: drop stdvga's "cache" struct member
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cd97dd61-c75c-4ab6-b36f-b2b035c4a564@suse.com>
 <cfbeff6c-569f-4f3b-8ea1-fc3ca36dbc65@suse.com>
 <91d36015-227e-4708-b1a0-6f2d01e750c8@citrix.com>
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
In-Reply-To: <91d36015-227e-4708-b1a0-6f2d01e750c8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.09.2024 18:44, Andrew Cooper wrote:
> On 10/09/2024 3:39 pm, Jan Beulich wrote:
>> As of 68e1183411be ("libxc: introduce a xc_dom_arch for hvm-3.0-x86_32
>> guests") caching mode is disabled for HVM domains from start-of-day, due
>> the disabling being unconditional in hvm/save.c:arch_hvm_load(). With
>> that the field is useless, and can be dropped. Drop the helper functions
>> manipulating / checking as well right away, but leave the use sites of
>> stdvga_cache_is_enabled() with the hard-coded result the function would
>> have produced, to aid validation of subsequent dropping of further code.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> This only applies to VMs constructed with libxenguest, which isn't all
> VMs.  But, it's probably close enough to ~100% of VMs to count.
> 
> Personally I think it would be clearer to say "Since 68e1183411be, HVM
> guests are built using XEN_DOMCTL_sethvmcontext, which intentionally
> disables stdvga caching in arch_hvm_load()".

I'll derive something intermediate. I don't think it was intentional that
caching got disabled this way. It's just that no-one noticed or paid
attention.

> As a minor tangent, this is yet another casualty of nothing being wired
> into the migration stream.  Rightly or wrongly, that mindset has caused
> an immense amount of problems in Xen.

Indeed.

> How does this interact with X86_EMU_VGA?
> 
> stdvga_init() is called unconditionally for HVM domains, exiting early
> for !EMU_VGA (skipping the pointless re-zero of the structure). 
> Nevertheless, the cache is UNINITIALISED for all configurations at this
> point.
> 
> And we won't hit the stdvga_try_cache_enable() calls in any of
> stdvga_{outb,mem_{write,accept}}() prior to XEN_DOMCTL_sethvmcontext,
> which will unconditionally set DISABLED.
> 
> So yes, I think this is for-all-intents-and-purposes dead logic.
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

Jan

