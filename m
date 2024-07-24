Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3070D93AC4F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 07:42:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763725.1174021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWUlS-0003IF-N3; Wed, 24 Jul 2024 05:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763725.1174021; Wed, 24 Jul 2024 05:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWUlS-0003GA-K3; Wed, 24 Jul 2024 05:42:14 +0000
Received: by outflank-mailman (input) for mailman id 763725;
 Wed, 24 Jul 2024 05:42:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D33k=OY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWUlQ-0003Fl-QI
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 05:42:12 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77b896b2-497f-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 07:42:09 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a7a843bef98so161408566b.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 22:42:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c7be0a3sm606234066b.73.2024.07.23.22.42.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 22:42:08 -0700 (PDT)
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
X-Inumbo-ID: 77b896b2-497f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721799728; x=1722404528; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NryCSaGRf3XeiYoOETz3tmz5rrNdBwS0AaGHaqvVdh4=;
        b=c8AWjJdXVNttq5fu6BkkqKwYPoRtjajcjwG6mtEEV+uW8lCpbhUiqokbqBZOfWE+yk
         Gha6dDCsk6/7NxUKV9bajMg1g6AiC3Pj/jeLtxHx+XKHwF/TLp82iobtyd9JuXHpUIkx
         G6wb+QW70iFJW2mQBgnqLt5oBMRMs06op/Ih6HS3BF8hXb+P/Bd8AihOaufzYDW+KR3z
         bP7KiP4e8WeGZa778v8iXHn/d8paKBJyH1Xa9FZzf0pBejdVtnpRoDZ4+UGGPCcigisU
         HM6dd4oSuU0OTTWIX23UZ7YLib8twDdQ3eDF6kyrrHiAvzwSLeyXrXW4Qcf6HijI/Y3u
         KCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721799728; x=1722404528;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NryCSaGRf3XeiYoOETz3tmz5rrNdBwS0AaGHaqvVdh4=;
        b=dOY2PuLgiyOkW6UHVicM+tOB0Yhl5+EbDmWnDfV1LPiWRTfMX6ESOvPiNbdQSqjWaP
         WEDk/xIUnPQdqKLIq5i6kSOU/kVMVN+SdNL2mLdQB6ER6EcMecGgvayxjh/386zHNiX4
         aDvLM98KnFC0htt6ZUZAXUMTh9P5RTSIFqZaaRKpbafjs4oWyAd4cZMUqidmACyG79HA
         NGTdAwpwCxm5SH+6l9nwM3be2+v9l+HV6R0VccFd8v6evf7Seho8T5C/BTSbV+oTd2DL
         dyQ10WtDVqs+OuFi5ngmQQfTM9/REacclUJf5ZL2zoMOyt0NfgJNAZGfyvogNa07b8Mh
         3ZfA==
X-Forwarded-Encrypted: i=1; AJvYcCXzE1fnNwTWRpe4fbXwqVGaCR9uvmajJhJaad6hqqbzYxiKd0/wiJypL5p0leGlMgJyag5rvlySNfaKr0/Znz1V3gTFMK6hepiJLeXTy1g=
X-Gm-Message-State: AOJu0Yz9O7LtJMYDi69PBywaVHg8DAJUwk4w4coY+mjRO2wJ4XJTPL+7
	dc2+5wywlzyIXh7gNwbvLp1GUfaBS2J8eDdzAvZbg4wyZHcSJfH4NGKeIwPTVw==
X-Google-Smtp-Source: AGHT+IGlBIgY5mkx16lRUKg3c4cVeyrstC0SJjQnQmD/xuXzHIf5sTBm1pJXT1SpDObAcuMMuozHAw==
X-Received: by 2002:a17:906:d54f:b0:a77:e140:a66d with SMTP id a640c23a62f3a-a7ab10aa1d5mr63078566b.67.1721799728439;
        Tue, 23 Jul 2024 22:42:08 -0700 (PDT)
Message-ID: <d4860b8f-8562-4987-bd1b-fdbeacc0a994@suse.com>
Date: Wed, 24 Jul 2024 07:42:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/efi: Simplify efi_arch_cpu() a little
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Gene Bright <gene@cyberlight.us>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240722101838.3946983-1-andrew.cooper3@citrix.com>
 <20240722101838.3946983-2-andrew.cooper3@citrix.com>
 <D2WYR6RSF2NH.3FCEH00B4ZRZ2@cloud.com>
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
In-Reply-To: <D2WYR6RSF2NH.3FCEH00B4ZRZ2@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2024 15:47, Alejandro Vallejo wrote:
> On Mon Jul 22, 2024 at 11:18 AM BST, Andrew Cooper wrote:
>> +    if ( (eax >> 16) != 0x8000 || eax < 0x80000000U )
>> +        blexit(L"In 64bit mode, but no extended CPUID leaves?!?");
> 
> I'm not sure about the condition even for the old code. If eax had 0x90000000
> (because new convention appeared 10y in the future), then there would be
> extended leaves but we would be needlessly bailing out. Why not simply check
> that eax < 0x80000001 in here?

eax = 0x90000000 is in leaf group 0x9000, not in the extended leaf group
(0x8000). The splitting into groups may not be written down very well,
but you can see the pattern in e.g. groups 0x8086 and 0xc000 also being
used (by non-Intel non-AMD hardware), without those really being extended
leaves in the sense that 0x8000xxxx are.

Jan

