Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 082B0852B88
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 09:45:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679792.1057490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZoPZ-0003Uy-NL; Tue, 13 Feb 2024 08:45:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679792.1057490; Tue, 13 Feb 2024 08:45:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZoPZ-0003Rl-JN; Tue, 13 Feb 2024 08:45:05 +0000
Received: by outflank-mailman (input) for mailman id 679792;
 Tue, 13 Feb 2024 08:45:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W/Jz=JW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZoPX-0003Ra-D0
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 08:45:03 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c234c44-ca4c-11ee-98f5-efadbce2ee36;
 Tue, 13 Feb 2024 09:45:00 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-51147d0abd1so4606517e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 00:45:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m27-20020a05600c3b1b00b00410794ddfc6sm11182448wms.35.2024.02.13.00.44.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 00:44:59 -0800 (PST)
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
X-Inumbo-ID: 2c234c44-ca4c-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707813899; x=1708418699; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RaA3YG3+iVtdQj6ISOklP2N0D5IWZSmrDFPfH5W5pOU=;
        b=CT4+9vKgWiHx3l1oCdQYUE7Cqpg9p6AiJUwf4kcc0q1HD6EwVBQhuilgeiPKg2MbjS
         oBS8pbcjRVoqAOJpXVkn5nTx0ENKJWKHTB8dPLTSDwV7Ow+pr2ROtGgwwreLZUAEpd3n
         WoDqMdLczd+jgEDj419XkeDPc5BoyV70pvjyyc5g4nTtxkv2AMUvk85gnZ6Hz1EDcOZ7
         Ufe4zLXpsVot5n6xSOUNzaFKTBVeNuHQM2faecktP1sO6RwIUwpvNdHZ2Lw8QjzcqnxO
         G2WR6FdDfq+JAyDQzAr9TARdc6JaIHPcdusc0knjVKMIogDFs61sY21yj9O2r5PqT4/n
         YmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707813899; x=1708418699;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RaA3YG3+iVtdQj6ISOklP2N0D5IWZSmrDFPfH5W5pOU=;
        b=ORhheAt+zMydio5y5xZwcic9JZnaf+o1eeImyKOPvFeM5OWU9r522rqnzAO9SXPLgh
         s9kdOAaNMZF/KymDp9D3DAUDNGJ9wd1ckggepQfd6PUCY8Y0cLVVnUDVnVs0G7kn/sTI
         cAcdMctRgdm4MV3xLBG/vlovEjGLdm3yaM5OzE7mbNyuKGAVwzU6UucLNJFjVm9ejE3w
         pkQyvAgy3JpytcRRjqCvBde1i4NmFfDbNNRnoCxPGLbUUaS3DHLgSCGN1Up2Ouxv0VAW
         Mv7It4I16RQNYhxNrHZ9HkktVk/bV29MkKnp1Ume3Fr/dA74yKYPVu7oiHkOFR+nVNGi
         e2Gg==
X-Gm-Message-State: AOJu0Yw3a0T55q//N18ab/j0HyqiqebjpYvv68854wUPhi+A1OJdMc/Q
	o2KgMIevtiWD4OYjdGG4fCV4QxYIKtRZn3f5hJOHjwuWOzHx10lRvrz9UzMPPA==
X-Google-Smtp-Source: AGHT+IGG5MSvMInP5gKdQmHKgK3+l2RLwuKnOzx/5X0XjqcDof/YSb+IWYTjo4fZrA9J9asFfup20A==
X-Received: by 2002:a05:6512:e83:b0:511:4e8c:7d02 with SMTP id bi3-20020a0565120e8300b005114e8c7d02mr7463008lfb.48.1707813899622;
        Tue, 13 Feb 2024 00:44:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX29TO1eHQlZIG2h4eomrkCqEQmXgqYgTPLf8ZfpFgsmrvBjrEUfZWtf520g/nO2Omy36yktZB9RAyHfULFq5As1Iov0uG4sEsD1Lsow795bz6TRL6MMxlD/VzchE0Q2wmlR/bHhAzKGf9cp1cIAGLV05KQm1zAjEaRSlQtJaHte2RwU+pue2glSWf/AkyiO1bK9keL2KABK78Jj8l0vqGVqP4C7EnldxmqJDH6FpPLCMXKuDlfyR+FLbOLw9kAyah4Upy5R8AAnLOsl/X7Orm7YruanwdqysjUYg7Yx2RilIdz7xvxIqvuZ7h64EjUkFeEwLZpgNMGQx19PwdglCdpmoIV5GrCMN2OKyWny1NPGb+7y8ld+NxBa79Cj9f4V+w0h4tnf5Ca/CZ9syhQ
Message-ID: <ec5d0c39-1559-4f10-9574-98cfa0542993@suse.com>
Date: Tue, 13 Feb 2024 09:44:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 01/14] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Paul Durrant <paul@xen.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
 <20240202213321.1920347-2-stewart.hildebrand@amd.com>
 <Zcsp15Aqve11Icjb@macbook>
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
In-Reply-To: <Zcsp15Aqve11Icjb@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.02.2024 09:35, Roger Pau Monné wrote:
> On Fri, Feb 02, 2024 at 04:33:05PM -0500, Stewart Hildebrand wrote:
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -462,7 +462,8 @@ struct domain
>>  #ifdef CONFIG_HAS_PCI
>>      struct list_head pdev_list;
>>      /*
>> -     * pci_lock protects access to pdev_list.
>> +     * pci_lock protects access to pdev_list. pci_lock also protects pdev->vpci
>> +     * structure from being removed.
>>       *
>>       * Any user *reading* from pdev_list, or from devices stored in pdev_list,
>>       * should hold either pcidevs_lock() or pci_lock in read mode. Optionally,
>> @@ -628,6 +629,18 @@ struct domain
>>      unsigned int cdf;
>>  };
>>  
>> +/*
>> + * Check for use in ASSERTs to ensure that:
>> + *   1. we can *read* d->pdev_list
>> + *   2. pdevs (belonging to this domain) do not go away
>> + *   3. pdevs (belonging to this domain) do not get assigned to other domains
> 
> I think you can just state that this check ensures there will be no
> changes to the entries in d->pdev_list, but not the contents of each
> entry.  No changes to d->pdev_list already ensures not devices can be
> deassigned or removed from the system, and obviously makes the list
> safe to iterate against.
> 
> I would also drop the explicitly mention this is intended for ASSERT
> usage: there's nothing specific in the code that prevents it from
> being used in other places (albeit I think that's unlikely).

But pcidevs_locked(), resolving to spin_is_locked(), isn't reliable. The
assertion usage is best-effort only, without a guarantee that all wrong
uses would be caught.

>> + * This check is not suitable for protecting other state or critical regions.
>> + */
>> +#define pdev_list_is_read_locked(d) ({                           \
> 
> I would be tempted to drop at least the '_read_' part from the name,
> the name is getting a bit too long for my taste.

While I agree with the long-ish aspect, I'm afraid the "read" part is
crucial. As a result I see no room for shortening.

>> +        struct domain *d_ = (d);                                 \
> 
> Why do you need this local domain variable?  Can't you use the d
> parameter directly?

It would be evaluated then somewhere between 0 and 2 times.

Jan

