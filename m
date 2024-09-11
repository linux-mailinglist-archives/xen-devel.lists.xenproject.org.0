Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F18974B68
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 09:31:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796247.1205755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soHop-0000kR-Rn; Wed, 11 Sep 2024 07:31:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796247.1205755; Wed, 11 Sep 2024 07:31:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soHop-0000hV-P2; Wed, 11 Sep 2024 07:31:15 +0000
Received: by outflank-mailman (input) for mailman id 796247;
 Wed, 11 Sep 2024 07:31:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soHoo-0000hP-8Y
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 07:31:14 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfd2343e-700f-11ef-a0b5-8be0dac302b0;
 Wed, 11 Sep 2024 09:31:09 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a8d3cde1103so551348666b.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 00:31:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d258317e1sm582979466b.37.2024.09.11.00.31.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 00:31:07 -0700 (PDT)
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
X-Inumbo-ID: cfd2343e-700f-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726039868; x=1726644668; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KH/pZBb2pgKv/KeXvRNi+Qyz+Tv18/WQNMgyUCGsSjM=;
        b=AOnocO2GW9IRh7zKDCB3Ikyz64D9WHhhkGkiwTNCpyoBu7MeXqitaWTE0cOGf1BDv0
         h0ppgh310SVSNSw54t9Rbq5iBB+3ZtVVuUJkl9m7DfY2hnHknbZEqM+W5eF++SVCLcf3
         b3ulbJWICbOzEf47UmrUCHPqXkTA64IxqD9J3UYmV/w3Mk+z9kggyalWE/1ybQn+q92Z
         J1BLFwm7fwWh75JDtzEvsSX/SruJ9r9wI59Dh6W0Ig1FcMu/2wYHL9+crg+jfhpXrH7B
         eiEgiAQId1u5bPJmQSG9OnEcAgnJqzr+h5n7IvHCEyK7N+piHh/HKvuS9lewwvZxesuf
         4ylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726039868; x=1726644668;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KH/pZBb2pgKv/KeXvRNi+Qyz+Tv18/WQNMgyUCGsSjM=;
        b=E/HXBCF5Aw5cBh/6QD5Dy4TxV+iAquYca4ls/MeAlrJaPorjThrLrvjvKgIvOsDIf0
         gMych5RAwdxxrBmwTOmsmvRBwAr8FXYmT7uYHHtuloZeBWBCaPjDBJf33VjtdWoMdnIh
         3NAal+Jnlj4eBzYrLdBLT0Kiw7XEWNTM583lupABMQjsRf9p468BDxZ54HAxXuNZWdER
         dAYAxzme/+Ju0tFDSNw4PpIf5GRvU9xvXdT+7N2Wu9rKly1MxsAwlTiIYp2IZ5XUpchN
         ZY6XpubT7umrpLWJBZoB5BZDiCnus+LIZN5cV+TpysylBg49Q9Ny9Q9SD1H3C20csRpI
         LAHA==
X-Forwarded-Encrypted: i=1; AJvYcCUlwnWVJrjjbQgxOOHXZXHcU7sO4x79uorqskz1OleI3kDC/04y2fG1ADJZo85GD0659ShLtz1/gyY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw79UC9KDPMmzFoUuSwuflS+QU4PnqM+3KJrEhKhOWavocoyRN0
	/R8J907k3g2Z+ORR1e09cuhjCbN7FC7szKOtacg0RyLHn4WiJKWyobrln3teQQ==
X-Google-Smtp-Source: AGHT+IHnZzWza9LzWgOBm9bEDTuE72t8nSYRtZo63ves1E+MhuABu07PGxMm1n6nokfrde6ejLkghQ==
X-Received: by 2002:a17:907:7292:b0:a8b:ddf4:46f1 with SMTP id a640c23a62f3a-a8ffae24714mr314229466b.63.1726039867835;
        Wed, 11 Sep 2024 00:31:07 -0700 (PDT)
Message-ID: <94d75483-1644-4136-a202-05c1eb1ef5c1@suse.com>
Date: Wed, 11 Sep 2024 09:31:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 12/12] xen/pci: address a violation of MISRA C Rule
 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1725958416.git.federico.serafini@bugseng.com>
 <fd3bb0369cc1666a6c4ad79c54ee8772c1e561c2.1725958417.git.federico.serafini@bugseng.com>
 <e37247e7-3ffd-4c95-8b05-10662728724a@suse.com>
 <1d808a8f-1aa1-4bff-bfe2-09b39a48f96d@suse.com>
 <d8b4e697-97cf-42be-bc29-96b4befa7efa@bugseng.com>
 <c9b11661-7b63-4f9b-8cd3-c505a7c24aa1@bugseng.com>
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
In-Reply-To: <c9b11661-7b63-4f9b-8cd3-c505a7c24aa1@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.09.2024 19:46, Federico Serafini wrote:
> On 10/09/24 19:41, Federico Serafini wrote:
>> On 10/09/24 16:59, Jan Beulich wrote:
>>> On 10.09.2024 16:57, Jan Beulich wrote:
>>>> On 10.09.2024 12:09, Federico Serafini wrote:
>>>>> Address violations of MISRA C:2012 Rule 16.3:
>>>>> "An unconditional `break' statement shall terminate every
>>>>> switch-clause".
>>>>
>>>> Since in our interpretation "return" is okay too, why is not 
>>>> sufficient to
>>>> simply ...
>>>>
>>>>> --- a/xen/drivers/passthrough/pci.c
>>>>> +++ b/xen/drivers/passthrough/pci.c
>>>>> @@ -170,8 +170,10 @@ static int __init cf_check 
>>>>> parse_phantom_dev(const char *str)
>>>>>       {
>>>>>       case 1: case 2: case 4:
>>>>>           if ( *s )
>>>>> -    default:
>>>>>               return -EINVAL;
>>>>> +        break;
>>>>
>>>> ... insert just this one line here?
>>>
>>> I guess the problem is with the description: It's un-annotated 
>>> fall-through
>>> in this case, not so much the lack of a break (or alike).
>>>
>>> Jan
>>>
>>>>> +    default:
>>>>> +        return -EINVAL;
>>>>>       }
>>>>>       phantom_devs[nr_phantom_devs++] = phantom;
>>>>
>>>
>>
>> Do you prefer this?
>>
>> case 1: case 2: case 4:
>>      if ( *s )
>>          fallthrough;
>>      break;
>> default:
>>      return -EINVAL;
> 
> Oh no, sorry,
> this does not make sense.

First of all I'd prefer if we could leave such untouched. Moving to the
obvious replacement of what's there 

case 1: case 2: case 4:
     if ( *s )
     {
         fallthrough;
default:
         return -EINVAL;
     }
     break;

is arguably not necessarily better than what you were proposing. So I
guess the conclusion is that you're code change is okay(ish) (i.e. if
already we need to touch this), but the description wants changing to
make clear what the problem here is.

Jan

