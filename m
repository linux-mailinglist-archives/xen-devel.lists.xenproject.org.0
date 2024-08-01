Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1F1944533
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 09:13:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769377.1180249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZPzN-0003mx-To; Thu, 01 Aug 2024 07:12:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769377.1180249; Thu, 01 Aug 2024 07:12:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZPzN-0003kW-QA; Thu, 01 Aug 2024 07:12:41 +0000
Received: by outflank-mailman (input) for mailman id 769377;
 Thu, 01 Aug 2024 07:12:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4YK=PA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZPzM-0003kQ-Si
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 07:12:40 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f63440a-4fd5-11ef-8776-851b0ebba9a2;
 Thu, 01 Aug 2024 09:12:38 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5b391c8abd7so5279253a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 00:12:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b64c074f9fsm1415119a12.97.2024.08.01.00.12.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Aug 2024 00:12:37 -0700 (PDT)
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
X-Inumbo-ID: 6f63440a-4fd5-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722496358; x=1723101158; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JCvBVunI7k6bNFY/+1qRSnA/qiHEmcNRmmy34+GfdY0=;
        b=CbRr21RRyHPqJU8b+CEiurQzt/Bn4Ya6ywcJI6O5aFdBoMuIW95sX9YO1GVYsk1J4F
         hxPgPheznnHNjJ8JvJYzJzA1eoaUkf9ZrD0TkQ3rQ0dfMnkqlVQFuoyoXXniIRusxWKF
         aKzoVtuGaeQKst66r5chQSu1jLXwLAjdFziUuREvrJ8DI8XWzDpa+IAPka7Z2qRoevqC
         +zTwh+OtOD9DJXdYLv/QYARBTAfy+1P/SY3WkjlI9JMqxJepztbUmE+UlnltsWBizaeH
         TmEpS2feJE1wd9NewvKlDMHR+OuLhyfHGWGUfVGI0mof1W8I0RDRdVY//VbM0pK2MgZ0
         xyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722496358; x=1723101158;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JCvBVunI7k6bNFY/+1qRSnA/qiHEmcNRmmy34+GfdY0=;
        b=frS2+OZKL2wKSTLGh5kmvfouW16LTLeXNUzOmPXoNosLmUrTUaXSd54oeUH/6yQtxI
         PQHReCIQ8VAqWA4lNcuvxfJH8UBvJWQvPy0m3EMCISJURXT3JPmUtGW5adcdAL7FonL7
         Ai6PHZYaUy9AjGw4NOKNax+/9AN+tI38FC825i+ulwtAgteFW/rESkcMBsoJquesugPU
         l08IFkuoN8bwjLdpm/D/Yq50XnlqOx0h3OfPFku3RgTGdgLWR9CRpaOKQ9n93Ng3zfe7
         a/vB46oYCMq7+AMUwmVDoZf63YvVtnysp5nU/bVOoHN/WVLIbBClU8JIl77scgXHEc59
         LXFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMqhBsgXkk4g13FZoyHM5I0Lp3FhASJ+Up6MTUSe7ZEgmgjTnLqRvxno7Aw9R4pe7bURqkZE7rizRD2pUR5eZyuYYDtpAuLTSQkjDkXbA=
X-Gm-Message-State: AOJu0YxzkujGGI7xwSkRSqBWMH83NtXY3A8eCQ3SlSrrV/maBkzUus+J
	Gl5z9vuTn6dVYCT45UFNHraStqITSVK8gQuyPyPMUEJsMlatqIrPjolm9ZFGjQ==
X-Google-Smtp-Source: AGHT+IFyPYTM556tBxEUe9ieQR8UiaO/hHkAeTOpdZjR8RslOjzrgVggrPijjYvHnFKJV/BeKuE+FQ==
X-Received: by 2002:a05:6402:742:b0:57c:d237:4fd with SMTP id 4fb4d7f45d1cf-5b6fe530a8amr904664a12.4.1722496358031;
        Thu, 01 Aug 2024 00:12:38 -0700 (PDT)
Message-ID: <9c0a102a-9031-4536-8a36-ab62812bc2c4@suse.com>
Date: Thu, 1 Aug 2024 09:12:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/dom0: only disable SMAP for the PV dom0 build
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240730152855.48745-1-roger.pau@citrix.com>
 <20240730152855.48745-3-roger.pau@citrix.com>
 <e560b170-b00f-415c-9e45-3c287ffd3b3b@citrix.com>
Content-Language: en-US
Cc: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
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
In-Reply-To: <e560b170-b00f-415c-9e45-3c287ffd3b3b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.07.2024 18:47, Andrew Cooper wrote:
> On 30/07/2024 4:28 pm, Roger Pau Monne wrote:
>> The PVH dom0 builder doesn't switch page tables and has no need to run with
>> SMAP disabled.
>>
>> Use stac() and clac(), as that's safe to use even if events would hit in the
>> middle of the region with SMAP disabled.  Nesting stac() and clac() calls is
>> not safe, so the stac() call is done strictly after elf_load_binary() because
>> that uses raw_{copy_to,clear}_guest() accessors which toggle SMAP.
>>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Summarising a discussion on Matrix.
> 
> There are 3 options.
> 
> 1) Simply reposition the write_cr4()/cr4_pv32_mask adjustments.
> 2) This form (use stac/clac instead of playing with cr4).
> 3) Delay the original set_in_cr4(SMAP).
> 
> As proved by the confusion thus far, cr4_pv32_mask adjustments are
> fragile and can go unnoticed in the general case (need a lucky watchdog
> NMI hit to trigger).  Hence I'd prefer to remove the adjustments.
> 
> Using stac()/clac() is much easier.  It is fragile because of nesting
> (no AC save/restore infrastructure), but any mistake here will be picked
> up reliably in Gitlab CI because both adl-* and zen3p-* support SMAP.
> 
> Personally I think option 2 is better than 1, hence why I suggested it. 
> It's got a fragile corner case but will be spotted reliably.

... when code paths in question are always taken. Any such operation on
a rarely taken code path quite likely won't be spotted by mere testing.

Jan

> However, it occurs to me that option 3 exists as well... just delay
> setting SMAP until after dom0 is made.  We have form now with only
> activating CET-SS on the way out of __start_xen().
> 
> Furthermore, option 3 would allow us to move the cr4_pv32_mask
> adjustment into set_in_cr4() and never need to opencode it.
> 
> (Although this is a bit tricky given the current code layout. 
> cr4_pv32_mask also wants to be __ro_after_init and non-existent in a
> !PV32 build.)
> 
> ~Andrew


