Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F293E9766F7
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 12:51:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797276.1207182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sohQ7-0000tK-Fp; Thu, 12 Sep 2024 10:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797276.1207182; Thu, 12 Sep 2024 10:51:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sohQ7-0000qc-Cx; Thu, 12 Sep 2024 10:51:27 +0000
Received: by outflank-mailman (input) for mailman id 797276;
 Thu, 12 Sep 2024 10:51:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dRhM=QK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sohQ5-0000q8-B9
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 10:51:25 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3a85bce-70f4-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 12:51:23 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c3ca32974fso812424a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 03:51:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c62570sm723794566b.134.2024.09.12.03.51.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 03:51:22 -0700 (PDT)
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
X-Inumbo-ID: f3a85bce-70f4-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726138283; x=1726743083; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3bHPwwCyc7o9QGZG1tD5G4cQLFdZtCraoNoAq0Vkxlc=;
        b=OXz+gUyGbD0ecBZoPxEpkWy4kfJcM5p5uDUOyt4eAV0iZfMMACUmXBET44bZDhMjgP
         wSSozTBbmqjmJcNmN1GB3DrN8RwahDaNipd32eVUBk4+462dpLs7+kEtXSSfpQAWy88l
         jUrz2F52e3Lcc8IOGSHjwVDy9W9Yl/jWa8NZhtSsUKToPX9UXSIQOq50B5DsDguhadss
         ySyO8WKtGcb/bFrd1WNeuAF+h8kuxYhbZsv9PCpQHdCB2aaV81CSkp+PwJGMfc5yZPGb
         ZoyaROqYRyJw/mCCE3CKJDyx691oS1AXtdPL3sJmwMXxAiMo7gV/nNzo916pm6ZG9pq6
         Lw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726138283; x=1726743083;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3bHPwwCyc7o9QGZG1tD5G4cQLFdZtCraoNoAq0Vkxlc=;
        b=t90BE57FsP40pb/Slliz5snRc2QGAMareDblQMn7CGtui8MIMFoH8wrM08xz78Wekp
         6qe+UOTN4Bn+5SXo4oP+XT13a2pXibAqL2Nw3Al9HuJJFMmEMSJzxc8HhIDIS/ufNvct
         Z6wqbbE0Dsz53qjEur3U10tPxoHAybAu+uJdHpnHtKedbRCgoeENEx8xRSSR++RAQrMQ
         R8fsCEwrZ2AXjInyEYO+82sNuFSTsLpYfBTD654gRMtX9w892purBRvAN0okYzOmolbC
         J2oJH5xaFXw6ff7ZnKcKUAeJuRqLuSnhGnPfWdJ7nCQPTrEiMyf7rLnA1UVbOHjBJfeQ
         spiQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7MM/QbAOV1SKmlPbF2aJBGOclBb5f0QII5sJOJOch4zHkHk/uBU6UBDxGatPQhqQeW8eOs3YGR4U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/JyJzkLVQEgEBq9tycOKCLy6b8pOApBHwttKGevzdhkMe3Mqr
	EujFZvjJHv5BbmDD9yucL9mzC202x2bTbyk36Ky9NCmJNeJlJIS5bV3fU/Uywg==
X-Google-Smtp-Source: AGHT+IEcnX+bXnPQzR8oh2rM+ZTTTCjqkFe6y115zJa4cYNucJwpMMTwJEhlDwEi0EySRM7OEBGceQ==
X-Received: by 2002:a17:907:f712:b0:a7a:9ca6:527 with SMTP id a640c23a62f3a-a90293fc2camr219957266b.8.1726138282857;
        Thu, 12 Sep 2024 03:51:22 -0700 (PDT)
Message-ID: <5a3b43eb-6c98-42bf-8331-1112de9d888d@suse.com>
Date: Thu, 12 Sep 2024 12:51:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v15 2/4] x86/irq: allow setting IRQ permissions from
 GSI instead of pIRQ
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 Huang Rui <ray.huang@amd.com>, xen-devel@lists.xenproject.org
References: <20240911065832.1591273-1-Jiqian.Chen@amd.com>
 <20240911065832.1591273-3-Jiqian.Chen@amd.com>
 <971eba46-79e0-411f-8ae5-6b1f986f2ed0@apertussolutions.com>
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
In-Reply-To: <971eba46-79e0-411f-8ae5-6b1f986f2ed0@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.09.2024 12:34, Daniel P. Smith wrote:
> On 9/11/24 02:58, Jiqian Chen wrote:
>> @@ -237,6 +238,34 @@ long arch_do_domctl(
>>           break;
>>       }
>>   
>> +    case XEN_DOMCTL_gsi_permission:
>> +    {
>> +        int irq;
>> +        unsigned int gsi = domctl->u.gsi_permission.gsi;
>> +        uint32_t flags = domctl->u.gsi_permission.flags;
>> +
>> +        /* Check only valid bits are set */
>> +        ret = -EINVAL;
>> +        if ( flags & ~XEN_DOMCTL_GSI_ACTION_MASK )
>> +            break;
>> +
>> +        ret = irq = gsi_2_irq(gsi);
> 
> I was recently informed that a = b = c; form is not MISRA compliant. 
> Since you just overwrite ret after the check, why not drop the 
> assignment to ret and mae the next check against irq instead.

The Misra concern is valid, yet the suggestion doesn't look to be quite
matching what is needed. After all if we take ...

>> +        if ( ret <= 0 )
>> +            break;

... the "break" path, "ret" needs to be set. Plus there's the problem of
"ret" being zero when exiting the function indicates success, yet this
is an error path (requiring ret < 0). So overall perhaps

         irq = gsi_2_irq(gsi);
         if ( irq <= 0 )
         {
             ret = irq ?: -EACCES;
             break;
         }

?

Jan

