Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1DE9444C0
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 08:50:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769350.1180218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZPd9-0006RW-MY; Thu, 01 Aug 2024 06:49:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769350.1180218; Thu, 01 Aug 2024 06:49:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZPd9-0006Pk-JM; Thu, 01 Aug 2024 06:49:43 +0000
Received: by outflank-mailman (input) for mailman id 769350;
 Thu, 01 Aug 2024 06:49:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4YK=PA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZPd8-0006Pb-4i
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 06:49:42 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 396be7cb-4fd2-11ef-8776-851b0ebba9a2;
 Thu, 01 Aug 2024 08:49:40 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a6265d3ba8fso621656266b.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 23:49:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab4f7aesm854926366b.53.2024.07.31.23.49.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 23:49:38 -0700 (PDT)
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
X-Inumbo-ID: 396be7cb-4fd2-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722494979; x=1723099779; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YjTq209aYTlC9q8ZTS+JkrpnIxI9RuX/H0fIKvIvHUE=;
        b=LirezZndcnJWPGqJLoYuyEji6a9MIQcGIMbvJ1TVCG9JvbN4JHN/5sjNLMgRcuEfZk
         H+99e6LQzBn3KVByuCCq5PiKsDfdi0YNkO/GvhTcph0jkEIfH4vozm0fjosGJm25N5YV
         kvGKDsGwEFk1na0tMNwq2TmORJhuHzMa3OP9O4n0jf1JCTOiqsDp4NbQeaaS6ah3Jh4D
         tiCLzx0I7wD4RSLcBoE93ZzBMZG4tCCx/MOCLwuvGUrj/yohXv2iHhi6V2ONs+5T5Fl9
         uwfAiT8VMbBKC1NarKXV3EfDMdSMQQmfZ63mGl9bafLNUcPE5hit60kspCXHIdH0ffsK
         +fTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722494979; x=1723099779;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjTq209aYTlC9q8ZTS+JkrpnIxI9RuX/H0fIKvIvHUE=;
        b=me+Z9N160aj4fICBHmj7YpbtVAZMwFczot/bJgQsZtaPR44rebqABHHdHNBxdZzZ02
         BL/63Sz3fg80TO91hm2qEFgFnFTw+ogErHRc4xfq+OlFb+3RGXz886tIazJuufgik1bR
         pbGJW7uufDC1mOKRvgoxfgwtFmBc5Nnq3oGqmr0C891AH1JqR9fpfKlBRGcMOK+oEaxs
         XSV+bzHKzqFVXBUSFJN7JGxR1GA93W615VqlcNe0qeixVDnRYA5Ra4esq5PIvnGt513Y
         oBkftGJBpz5EreM7OblDwDyW//9IvMxwk/inTvI5ytpv0oDWED60xXNZToqbijIJhxDp
         U5Hg==
X-Gm-Message-State: AOJu0Yz/YprQX5xE64ziUqGWw/dRFYolXsCsyq78W/TLsI8bENiy07Uz
	IZcOBx79e85OSy9YGGssC/pxdenAKwfs2p7GCuyjz8DrtZaLRLDcuBSrj4nlDA==
X-Google-Smtp-Source: AGHT+IE6BtnZgylyUonDzOmg6Wfz+1mTtuYNEHaxll+YVyUlSYaaYMpZwzTJqhScf+hhez4LgBO+gA==
X-Received: by 2002:a17:907:7249:b0:a72:41e7:fef4 with SMTP id a640c23a62f3a-a7daf65954bmr90631266b.68.1722494979167;
        Wed, 31 Jul 2024 23:49:39 -0700 (PDT)
Message-ID: <1a35b90d-969c-4ef2-8dd1-4dc36f56fa30@suse.com>
Date: Thu, 1 Aug 2024 08:49:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v12 1/7] xen/pci: Add hypercall to support reset of
 pcidev
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <ray.huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-2-Jiqian.Chen@amd.com> <ZqpeiWhuqPXiTeRZ@macbook>
 <23730906-f6c7-4a9a-bb2f-2969625c741e@suse.com> <ZqpiulPi3FbdpDoF@macbook>
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
In-Reply-To: <ZqpiulPi3FbdpDoF@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.07.2024 18:13, Roger Pau Monné wrote:
> On Wed, Jul 31, 2024 at 05:58:54PM +0200, Jan Beulich wrote:
>> On 31.07.2024 17:55, Roger Pau Monné wrote:
>>> On Mon, Jul 08, 2024 at 07:41:18PM +0800, Jiqian Chen wrote:
>>>> --- a/xen/drivers/vpci/vpci.c
>>>> +++ b/xen/drivers/vpci/vpci.c
>>>> @@ -172,6 +172,16 @@ int vpci_assign_device(struct pci_dev *pdev)
>>>>  
>>>>      return rc;
>>>>  }
>>>> +
>>>> +int vpci_reset_device_state(struct pci_dev *pdev,
>>>> +                            uint32_t reset_type)
>>>
>>> There's probably no use in passing reset_type to
>>> vpci_reset_device_state() if it's ignored?
>>
>> I consider this forward-looking. It seems rather unlikely that in the
>> longer run the reset type doesn't matter.
> 
> I'm fine with having it in the hypercall interface, but passing it to
> vpci_reset_device_state() can be done once there's a purpose for it,
> and it won't change any public facing interface.

Jiqian, just to clarify: I'm okay either way.

Jan

