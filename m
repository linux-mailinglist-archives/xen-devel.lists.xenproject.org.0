Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0147CAFE3D1
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 11:16:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037972.1410503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZQuW-00038F-2L; Wed, 09 Jul 2025 09:16:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037972.1410503; Wed, 09 Jul 2025 09:16:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZQuV-00036i-Vy; Wed, 09 Jul 2025 09:16:15 +0000
Received: by outflank-mailman (input) for mailman id 1037972;
 Wed, 09 Jul 2025 09:16:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6dDj=ZW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZQuU-00036Z-P4
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 09:16:14 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c57b816-5ca5-11f0-a317-13f23c93f187;
 Wed, 09 Jul 2025 11:16:13 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a4e742dc97so450522f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Jul 2025 02:16:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce359e90asm13129795b3a.6.2025.07.09.02.16.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jul 2025 02:16:12 -0700 (PDT)
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
X-Inumbo-ID: 5c57b816-5ca5-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752052573; x=1752657373; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oYcxrOXrMjxErUzGjogItwSxfez2Wo2VpMmdBPmtk28=;
        b=Ozka814z6pUpZNY/rLPQQDXmrs/LDD8sxqJcRMs5NcK+Ane7GGYZ7J4AlrfK6TuJtu
         9zWVTJDDw+CW+00aMAUlxK3Wy5t9FvWtLBLxSX9zLZ8wfd9wGFHsU2Z6wyD4u4UkaFu/
         117pC/fW0FnPdUBVlj4VKJeUxqgcrfvOwUS2dZzaj78bWbEDaKyrb3XUKapmnhxisvF9
         51B4xdhxQ79GpWpCnpT4I5Ieq3tPL6bskF9irXzmiP/6Jv4CsrYDy3x/M8m/uvyBK16a
         vBrac/Abc3Ekgb5XeWKmMTDJBhCkxmHuxfkGSxr5sW6mUHAUrH9WTrRz+jxLFaqRxaTz
         2BvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752052573; x=1752657373;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oYcxrOXrMjxErUzGjogItwSxfez2Wo2VpMmdBPmtk28=;
        b=xBq5UmVMg9N+u4nGHPqaagtsmBKmpwBoJ4esG05owCRnl1jtZipxYhzSfRdOGHbiyH
         PByL5htyUzgkoxA3S304lsjho6BkhsOmfdOj8B2o7EcmU6zdL9VWKEbQbS3iJRoqDV7j
         h9PUofTWfaauOqZg4BFAAB30qgKZs1fuqbh12RiXerxg3U9idj6DZEoXNDuXpBXN5Wp6
         rFwDhPIyKzX/Ezcxt1u7UYnLzxKNlQl0xk9jW0LIDFxX4SJaumtOMXU68QtrBAcS26fs
         ClWNlHnGApsGKsQ87iDV2k6tpQ611gMtqcQVbwZTvoKlKoxL8OFIk84VFLaTvEDnko5B
         s1Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUqLPkNHkSo/EgeqsxV+W+hIF9VD3R/gyl61lEhU03JxmlCshya/HdKW6AY0xrdxm60bKDAwGt4EqA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxB1bGy0lbL08RTVJ2h9kAX6szohwnkWNs1IG++DcH7U9QYFWSO
	WI1KgNq+eR/0KQ6E5tR6CVeIH2z7PTOho2lWu67Zoe6UAcpx/s4crlvqbrJZdktHNw==
X-Gm-Gg: ASbGncvgVYfivhDO3BHtkqcluECqrD85kGhZxEFkjCQepONBzIiCWeu10h4GXRIRyyZ
	RbTXD/HHOLyDAkjmyVgn7dm2SfqfgST7iGwL786ax6LxfukjgDla6Qj/Dezb5kqKlRKR+w1/Bhe
	9EhjhzRDCuhHd3G/vfRZA0wafDXgSh93R3CRQJOKIbkK9VTxsFBLzMHNtcdojeLaN7PDDLUvy9x
	UG3aqSyijeL9S9lTLyC1eGpFZk6e/bxlcs+8oxjwMyqWyY8RyHaLlYEM6Xp4O1OzACOCXeebG59
	yp6IiElt45lhK5QGYvkR3Q11cCJsAb/EaCEpAv3Fgz00WtN6xV5A8/MeFrsD7BFMMJoK2/mPYBw
	sK2eEOoxdL7ekr/lkT+TVQuvOy+kviMxj7xPZztVwtv3gIJI6huair3l39g==
X-Google-Smtp-Source: AGHT+IFbGtLtSBs24rfLBc5CismwbGBfMO1B/y6f49XT4KgHypUDv0XZVQXSNbXH1CFjd8wD559b6w==
X-Received: by 2002:a05:6000:26d1:b0:3a4:eb7a:2ccb with SMTP id ffacd0b85a97d-3b5de01606fmr4717319f8f.16.1752052573177;
        Wed, 09 Jul 2025 02:16:13 -0700 (PDT)
Message-ID: <db37fd37-0896-4570-8002-834f0760353b@suse.com>
Date: Wed, 9 Jul 2025 11:16:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] xen/arm: Support ARM standard PV time for domains
 created via toolstack
To: Koichiro Den <den@valinux.co.jp>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250705142703.2769819-1-den@valinux.co.jp>
 <20250705142703.2769819-6-den@valinux.co.jp>
 <fd8ce200-320a-406f-85b1-8087b9cc90a2@suse.com>
 <csgkv2lsyinwlmffu5sdr7tivhkd5zfykk6wyadon4cdncedmd@bulrngfqh6qj>
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
In-Reply-To: <csgkv2lsyinwlmffu5sdr7tivhkd5zfykk6wyadon4cdncedmd@bulrngfqh6qj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.07.2025 10:04, Koichiro Den wrote:
> On Mon, Jul 07, 2025 at 10:01:47AM +0200, Jan Beulich wrote:
>> On 05.07.2025 16:27, Koichiro Den wrote:
>>> --- a/xen/arch/arm/mm.c
>>> +++ b/xen/arch/arm/mm.c
>>> @@ -180,7 +180,21 @@ int xenmem_add_to_physmap_one(
>>>      case XENMAPSPACE_dev_mmio:
>>>          rc = map_dev_mmio_page(d, gfn, _mfn(idx));
>>>          return rc;
>>> +    case XENMAPSPACE_pv_time:
>>> +#ifdef CONFIG_ARM_64
>>
>> These two lines want to change places, I think.
> 
> Will fix it, thank you.
> 
>>
>>> +        ASSERT(IS_POWER_OF_TWO(sizeof(struct pv_time_region)));
>>
>> BUILD_BUG_ON() please, so that an issue here can be spotted at build time
>> rather than only at runtime.
>>
>>> +        if ( idx >= DIV_ROUND_UP(d->max_vcpus * sizeof(struct pv_time_region),
>>> +                                 PAGE_SIZE) )
>>> +            return -EINVAL;
>>> +
>>> +        if ( idx == 0 )
>>> +            d->arch.pv_time_regions_gfn = gfn;
>>
>> This looks fragile, as it'll break once d->max_vcpus can grow large enough to
>> permit a non-zero idx by way of the earlier if() falling through. Imo you'll
>> need at least one further BUILD_BUG_ON() here.
> 
> get_pv_region() can legitimately call xc_domain_add_to_physmap(..,
> XENMAPSPACE_pv_time, ..) with idx > 0, but only if the preceding call with
> idx == 0 succeeded.

Can it? What's the intended effect then, when only the idx == 0 case is fully
handled here?

> So while this may look odd at first glance, I think
> this is not broken. What do you think?

The GFN not being recorded anywhere means the call has no effect, while giving
the caller the impression that there was one (by way of returning success).

>>> +        mfn = virt_to_mfn(d->arch.pv_time_regions[idx]);
>>> +        t = p2m_ram_ro;
>>
>> Is this the correct type to use here? That is, do you really mean guest write
>> attempts to be silently dropped, rather than being reported to the guest as a
>> fault? Then again I can't see such behavior being implemented on Arm, despite
>> the comment on the enumerator saying so (likely inherited from x86).
> 
> No I didn't intend the "silently drop" behavior. IIUC, we may as well
> correct the comment on the enum for Arm:
> 
>     diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
>     index 2d53bf9b6177..927c588dbcb0 100644
>     --- a/xen/arch/arm/include/asm/p2m.h
>     +++ b/xen/arch/arm/include/asm/p2m.h
>     @@ -123,7 +123,7 @@ struct p2m_domain {
>      typedef enum {
>          p2m_invalid = 0,    /* Nothing mapped here */
>          p2m_ram_rw,         /* Normal read/write guest RAM */
>     -    p2m_ram_ro,         /* Read-only; writes are silently dropped */
>     +    p2m_ram_ro,         /* Read-only */

Don't know whether that's a good idea, as it'll diverge Arm from the same-
name P2M type that x86 has. (Arguably x86'es type may better be named
p2m_ram_write_ignore or some such.)

Jan

