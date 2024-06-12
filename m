Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A0390569B
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 17:15:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739434.1146466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHPgS-0000tX-0x; Wed, 12 Jun 2024 15:14:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739434.1146466; Wed, 12 Jun 2024 15:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHPgR-0000rW-Tp; Wed, 12 Jun 2024 15:14:43 +0000
Received: by outflank-mailman (input) for mailman id 739434;
 Wed, 12 Jun 2024 15:14:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h1N0=NO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHPgQ-0000rO-7P
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 15:14:42 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d0a9310-28ce-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 17:14:39 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a6f3efa1cc7so185387066b.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 08:14:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f37662fa1sm239075366b.17.2024.06.12.08.14.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 08:14:38 -0700 (PDT)
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
X-Inumbo-ID: 7d0a9310-28ce-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718205279; x=1718810079; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8t3YgES7Gx6Zo2DxcW4yVljY/BB46w86dYTBiDFh8Lg=;
        b=fabjvoe2alei20ueGFmQ4gYPdGtQ2qUgYwrl/PXhtHklX7mbv0VYLtz7YgeU7Oi2Ap
         uqBcHYp1d6e5P28VYwQNefsLCyXCWzoh1M4aPmSp8tlHSXC2k/3xKj3LkE7mbxlUqaie
         ArtB7lOK6QQUb5Bf0TRZU7o9Un/j1US9E/thT5ZfXOm/VMmKHqRw1IYEUmx7L4rwo3iN
         08yoS7fv6L4GDDFSzgl3AzdebNAi3v14/+BGlvRZCIqnSsrlSYqlqNyiKzbbqistVpCg
         y0sjH8fxg8ITVUMGSmollyIZv0mjHDiCOmm1TQtt7dg8EBJtmyeo+JoD+NObFhw0HZh9
         i7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718205279; x=1718810079;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8t3YgES7Gx6Zo2DxcW4yVljY/BB46w86dYTBiDFh8Lg=;
        b=VAaRDmAelAycj65Dm5s9QE534IOhMuI97AtPjXDN9PMiOwuFeAAGR6SG12JTQ51ka/
         dL3r0PTr5jj5W9ujzojbO3ub+sV46JthsUrCabBPaobssqL+hRUU/E0cCAfEx/M/fQi6
         lpmCYyFnxRxTwTrzGXHnQZh2QXA/hFdeMZ+23Rus+QC/CHO9Cc0d42camRW1zBcx+wFM
         dCIm81XmFAJKb8JBgd7iKEufTuD7XTfQSvQlz1fnzXhAoMdq5I1sE1z8wAwr1XjZ8mGp
         t5H0PH6QFftdQxrE94uyDQZaWKjxDzGqDYGZjui6zPhXb5zwkaZLYUSULiVRxMTlAKSA
         lelw==
X-Gm-Message-State: AOJu0Ywggk8wVakrokdSon1p3vNwxwZ/FQAVLbFMN/yaib2jzzEVAoDr
	bfEoTNIBu37AcmLh8d/G8YW6VQq4xOSp2d40MY9eNGhw+dn3O5ggMIRWoid5MQ==
X-Google-Smtp-Source: AGHT+IHj53qtTbJ6mA9ykDH2xjaPQgBi+0moO+BoPjiXm3uVEsvnTThTKLbxUN8/VXXd2SWc+cRyew==
X-Received: by 2002:a17:907:bb93:b0:a6f:3996:517c with SMTP id a640c23a62f3a-a6f39965843mr361726766b.18.1718205279260;
        Wed, 12 Jun 2024 08:14:39 -0700 (PDT)
Message-ID: <07d38484-dda3-4494-9dbb-75d4d2dbc3c3@suse.com>
Date: Wed, 12 Jun 2024 17:14:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.19 3/3] x86/EPT: drop questionable mfn_valid()
 from epte_get_entry_emt()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <2936ffad-5395-45fd-877f-7fb2ca8b9dc8@suse.com>
 <7607c5f7-772a-4c49-b2df-19f32ec2180b@suse.com> <Zmm4JdaLL0oRALL_@macbook>
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
In-Reply-To: <Zmm4JdaLL0oRALL_@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.06.2024 17:00, Roger Pau Monné wrote:
> On Wed, Jun 12, 2024 at 03:17:38PM +0200, Jan Beulich wrote:
>> mfn_valid() is RAM-focused; it will often return false for MMIO. Yet
>> access to actual MMIO space should not generally be restricted to UC
>> only; especially video frame buffer accesses are unduly affected by such
>> a restriction.
>>
>> Since, as of ???????????? ("x86/EPT: avoid marking non-present entries
>> for re-configuring"), the function won't be called with INVALID_MFN or,
>> worse, truncated forms thereof anymore, we call fully drop that check.
>>
>> Fixes: 81fd0d3ca4b2 ("x86/hvm: simplify 'mmio_direct' check in epte_get_entry_emt()")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> I do think this is the way to go (removing quirks from
> epte_get_entry_emt()), however it's a risky change to make at this
> point in the release.
> 
> If this turns out to cause some unexpected damage, it would only
> affect HVM guests with PCI passthrough and PVH dom0, which I consider
> not great, but tolerable.
> 
> I would be more comfortable with making the change just not so close
> to the release, but that's where we are.

Certainly, and I could live with Oleksii revoking his R-a-b (or simply
not offering it for either of the two prereq changes). Main thing for
me is - PVH Dom0 finally isn't so horribly slow anymore. However, if it
doesn't go into the release, then I'd also be unsure about eventual
backporting.

> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> I wonder if you should explicitly mention that if adding the
> mfn_valid() check was done to ensure all mappings to MMIO are created
> with effective UC caching attribute it won't be fully correct either.
> Xen could map those using a different effective caching attribute by
> virtue of host MTRRs being in effect plus Xen chosen PAT attributes.

Well, the mfn_valid() can't have been there to cover _all_ MMIO. It was
maybe a flawed initial attempt at doing so, and then wasn't properly
adjusted / dropped. So overall - no, I don't think extending the
description with anything along the lines of the above would make a lot
of sense.

Jan

