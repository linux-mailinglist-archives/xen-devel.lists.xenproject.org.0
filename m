Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 460449433C4
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 17:59:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768935.1179834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZBj9-0000Ur-5z; Wed, 31 Jul 2024 15:58:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768935.1179834; Wed, 31 Jul 2024 15:58:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZBj9-0000Ro-3A; Wed, 31 Jul 2024 15:58:59 +0000
Received: by outflank-mailman (input) for mailman id 768935;
 Wed, 31 Jul 2024 15:58:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZBj7-0000Rg-RS
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 15:58:57 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb078dcd-4f55-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 17:58:57 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a7ab5fc975dso517468466b.1
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 08:58:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7da0b63b09sm76882466b.85.2024.07.31.08.58.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 08:58:56 -0700 (PDT)
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
X-Inumbo-ID: cb078dcd-4f55-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722441536; x=1723046336; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y+Sm02097p/BKvvYL5YYjFMBiN7m9Nifumcg6FpdQwg=;
        b=FQNbIvG72MwJ2ztFXnb7TaNjYK0y6SY7D4iWVn4uo7JchvADfUsnaB2LS5jLsYqg/r
         TTt7ZIm3I6cNzQGDeXxeptv7oTmmYH4K4nNqIs4tqPqtiZuwHcXI9VUBt6N1tTgLfH11
         QdYdB62ZvOkx/aumQgWIKwTLXFG6sLzMzBy2oZxkqOsA2yMKqrv6//EGdjrQjoGtosDi
         ETQDuQjcbevOvmWQwsS17vg8fkIFQV3ciW36GtNx2SHuigec/99+S69WJCqPgy4ASw+9
         CBx9SyLTzmmDDWvOXXE7THkXQJQ9zAhWWUT0ZlVQ5BZmDrsj2I/CANacmWEdauadfbJb
         JlCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722441536; x=1723046336;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y+Sm02097p/BKvvYL5YYjFMBiN7m9Nifumcg6FpdQwg=;
        b=NaugLqVr0cebMS0qI0UyZq0KP5KWNR23sb0E5F/H8p1AuK4fuollrFr1TI3+5Q23ya
         4VW4e+ORPP4c5hPCnpMzc9+QLC9Ajy1ret+qNL8IPvf/Z82VfMEkLit0CTp7JXm5pNSh
         UyN+HHvIm84IFYxLsNcCB21EL+BKW4vUHYz0xYGVMYbvCof4517zZ3CZrP2zBQqYsTGF
         YVUwquaIOSP1IXSUwYUEYKXfBJyFLQlx7YST15OI/EyTpi7/0H8nuA8dLwitHF3+SFLq
         /2+12YbHcZp6t7v3qx4O7GakHaNXeHkdteMoCoK0a+LcTPIFf8j6afUo9XAkMtnsDRer
         SCtQ==
X-Gm-Message-State: AOJu0YyRqYOkMlXjy5ks16Jd3nQVDNNKrkDcSA0iQv9GQJmRCsaFx0dJ
	2gPXAm/0NePHQBTVN6tNk8cTfsnCmp/QAugLrtCGpXYFdJOjljP7SgJ7noH/4w==
X-Google-Smtp-Source: AGHT+IGLAqb/AEsoci8UAK5uJoUXye8GlERH1hoOKM/B8XD38CRkKGtrzXaBOLcls0lKS8T4zJQ1ig==
X-Received: by 2002:a17:906:6a2a:b0:a7a:8da1:eb00 with SMTP id a640c23a62f3a-a7d3ffc24ecmr1269678666b.7.1722441536266;
        Wed, 31 Jul 2024 08:58:56 -0700 (PDT)
Message-ID: <23730906-f6c7-4a9a-bb2f-2969625c741e@suse.com>
Date: Wed, 31 Jul 2024 17:58:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v12 1/7] xen/pci: Add hypercall to support reset of
 pcidev
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-2-Jiqian.Chen@amd.com> <ZqpeiWhuqPXiTeRZ@macbook>
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
In-Reply-To: <ZqpeiWhuqPXiTeRZ@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.07.2024 17:55, Roger Pau Monné wrote:
> On Mon, Jul 08, 2024 at 07:41:18PM +0800, Jiqian Chen wrote:
>> --- a/xen/drivers/vpci/vpci.c
>> +++ b/xen/drivers/vpci/vpci.c
>> @@ -172,6 +172,16 @@ int vpci_assign_device(struct pci_dev *pdev)
>>  
>>      return rc;
>>  }
>> +
>> +int vpci_reset_device_state(struct pci_dev *pdev,
>> +                            uint32_t reset_type)
> 
> There's probably no use in passing reset_type to
> vpci_reset_device_state() if it's ignored?

I consider this forward-looking. It seems rather unlikely that in the
longer run the reset type doesn't matter.

Jan

