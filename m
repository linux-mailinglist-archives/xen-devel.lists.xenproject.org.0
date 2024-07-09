Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2AE92B88F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 13:42:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756205.1164745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR9Dd-0006Je-Lg; Tue, 09 Jul 2024 11:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756205.1164745; Tue, 09 Jul 2024 11:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR9Dd-0006GW-Ih; Tue, 09 Jul 2024 11:41:13 +0000
Received: by outflank-mailman (input) for mailman id 756205;
 Tue, 09 Jul 2024 11:41:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uARp=OJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sR9Db-0006GQ-LV
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 11:41:11 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21dfb946-3de8-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 13:41:08 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ee9b098bd5so42957451fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 04:41:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ca34e6a583sm1696600a91.17.2024.07.09.04.41.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 04:41:06 -0700 (PDT)
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
X-Inumbo-ID: 21dfb946-3de8-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720525268; x=1721130068; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1DflZ0Naq4r0LPN/np7peLyersVhp8qXKUkUz7jyC/s=;
        b=brMLOpUPXKOPWul7NwRY/UZTnP+GsqcLQGP+RN37/85uXotOuHjh8h0Rv48ODENBbj
         1PwoNDYKZNEpMqTgpOzINKWRWxhd9lQDuAeks9GLwYrI0iAkm6W6Oog4L+jcVZ/QaRKK
         yrPTcqj2q+XzOG0PJWpq13yJR4RnhCjdfv1UfH77NT9mZY6tL92uwXK9M8WmD4WYAB1+
         HmOrCyxhkHalgq02C9yvd2IY9+MGrYx8VycBio95CRZZ5IMJ6WgOtHfBSmxts3S+DQAe
         0JjhceTlxwuu9+3jUuwRcoP/4d8guIr/YocfqZ2DQ8AzjcPlC0izxYgkBAN9c3hRdRip
         WQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720525268; x=1721130068;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DflZ0Naq4r0LPN/np7peLyersVhp8qXKUkUz7jyC/s=;
        b=VjtUrOAfL8Kgp/SrXNOPRAdMZ2xBw990QaeO6xWBuM532VL5Mxv0D1RHGsuC5cHFwO
         jyEnbQU6XyTLcOIDoMaFvjLfk6jBnJp1MTxu2cfeYSWhCO5a57pgNw1VvW/FboTM8jO6
         +ZEImsigZpHyzB/RuDcjDT1KfUDpP8UR0DrcfXlR/PQK76rOProX7lEVk+4A/cYjkr8z
         1uVtlm+E+H4dC9Dh7TGc/zwQV7/Xif9MseVj1R1uciYfjSOkTqHvNdibFyhnYIO/0fkw
         jXfHrrHsoKMRNmFHK3D9GUFPUjPgK4eFndnMjrbB9T9Czx/wUOMfcEK8EpvXWzLJ1o9B
         fewQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgzSs3mNwHVkMTXn9VwY94m7AbuNgQ95S8xV37WDooHCIrdoiSzDMrYUmBM745FxvGy+f3wTy/ML9g9+SdccpEHYnKVhYWYGd6Z703PfA=
X-Gm-Message-State: AOJu0YwMq+bFV6oNIqTvBe4TCQelY2McwVTrHw5759YmiMh3ZowvUUtJ
	BdfLmbvGLVB3APpZbT3o++em4/+5qF5gGgzv0Fxaqn6mlMQgLcZYVwF4HtVlyQ==
X-Google-Smtp-Source: AGHT+IEeFwBzK+hNvLsDIVQSx/BNZSQp/9qYE44qfIAh38PfTIesVadGDoTRU/YaBbS8T/UFCz1sLw==
X-Received: by 2002:a2e:c4a:0:b0:2ec:3d74:88c8 with SMTP id 38308e7fff4ca-2eeb30e3a81mr18785641fa.18.1720525266719;
        Tue, 09 Jul 2024 04:41:06 -0700 (PDT)
Message-ID: <1536da44-fd30-4363-b716-802e0c009d44@suse.com>
Date: Tue, 9 Jul 2024 13:40:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 09/12] x86/mm: add defensive return
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: consulting@bugseng.com, xen-devel@lists.xenproject.org
References: <cover.1719383180.git.federico.serafini@bugseng.com>
 <acb26329a980809dda100825f52b05d0cc295315.1719383180.git.federico.serafini@bugseng.com>
 <4cc9a5c7-df57-4a90-8164-cf3002596870@suse.com>
 <D2KYW63EJC2X.2BK8GEXKZW2N@cloud.com>
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
In-Reply-To: <D2KYW63EJC2X.2BK8GEXKZW2N@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.07.2024 13:21, Alejandro Vallejo wrote:
> On Mon Jul 1, 2024 at 9:57 AM BST, Jan Beulich wrote:
>> On 26.06.2024 11:28, Federico Serafini wrote:
>>> --- a/xen/arch/x86/mm.c
>>> +++ b/xen/arch/x86/mm.c
>>> @@ -916,6 +916,7 @@ get_page_from_l1e(
>>>                  return 0;
>>>              default:
>>>                  ASSERT_UNREACHABLE();
>>> +                return -EPERM;
>>>              }
>>>          }
>>>          else if ( l1f & _PAGE_RW )
>>
>> I don't like the use of -EPERM here very much, but I understand that there's
>> no really suitable errno value. I wonder though whether something far more
>> "exotic" wouldn't be better in such a case, say -EBADMSG or -EADDRNOTAVAIL.
>> Just to mention it: -EPERM is what failed XSM checks would typically yield,
>> so from that perspective alone even switching to -EACCES might be a little
>> bit better.
> 
> fwiw: EACCES, being typically used for interface version mismatches, would
> confuse me a lot.

There's no interface version check anywhere in hypercalls involving
get_page_from_l1e(), I don't think. So I see little room for confusion.

Jan

