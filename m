Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4646C98A8C7
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 17:40:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807503.1219006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svIUm-00061d-1P; Mon, 30 Sep 2024 15:39:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807503.1219006; Mon, 30 Sep 2024 15:39:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svIUl-0005zT-U7; Mon, 30 Sep 2024 15:39:31 +0000
Received: by outflank-mailman (input) for mailman id 807503;
 Mon, 30 Sep 2024 15:39:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1QIX=Q4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svIUk-0005zN-0F
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 15:39:30 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d488d29-7f42-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 17:39:27 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a93b2070e0cso550972666b.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 08:39:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2775d23sm551645766b.4.2024.09.30.08.39.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 08:39:26 -0700 (PDT)
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
X-Inumbo-ID: 2d488d29-7f42-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727710767; x=1728315567; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RDpsDsMzIMU0JimQFwYnQTitOSxoseTXNtAOfbrrflA=;
        b=glhYr80joplaKpnkpy+6V+PmnFx4+hTqLxMR1pNGI5jG4lBlTjNrafINc/VUQyPa0c
         aHHnQa59QzKSVWhmtF2+V3eVTogdyXNM87JvE96Df+wKMkb3WSDkEMrzqe9Xc78DGLTw
         OwJuBp9bmflbnT+P55V8R+SmKcygOka4lmbrNUyghsOxDk4c7986f2pDduM5+B6E2+Av
         skYXcoQg5BUIRFa87ztgHko3/VI3OZZ8WatU/0uCvf+dlX5wftX1euqxDl6CccWTiaGq
         JpTmjfutZF7oBdZyhphQXANHC1iFydfkNYgZnMkcXrh2mP2z6TfwweyloCSyzyER6NdG
         Kttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727710767; x=1728315567;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDpsDsMzIMU0JimQFwYnQTitOSxoseTXNtAOfbrrflA=;
        b=UTB/Zvx0qlnWPouTprPS3ZD0tJCLtKt75NH9rGfb2sW9pgdoWqVXx3mP3fQbtcBF5T
         J+gLQJyeAqmkJnFm/ynno2RW+1GNE/0p9Ce/m9hAybwI574Ds2+npi/g46Fe1hs8qIZ3
         4UcSLcKy3As5LK0nPe3fC7os8pp/Udh8dAsEr+A08HnGBzfOXQ9WeI2qSJoLv5pQgUS1
         rp7JU4WWJ3zo34o6a4lDFzcT4CvFxnOAh1V8We77AOb3FSb+QGbALX2X36rwIByqehyx
         O769LGb1CTuO7dvXedGPoZcOzNDUmWbkvbdy9l8Zgro6UjGM1eHDrgzSSZ/2conaBn8y
         GySg==
X-Forwarded-Encrypted: i=1; AJvYcCVFMKoJPmLGmxx7BmUXjvYSafnD3brmU7af/SGDJsDcF7Y2TqtWTYeiqoRxIQaz6U+vFfJwFBNmGPk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz5iMKzTVNBAu7pJ5yc3hSLHpaV6fz6T0tmeFjLSFKWrx3nOs5B
	XNoGEpAkStjIz/KkGAOdw6eRSdYWZLGQg/ZoJVY+l/l7DPd+3z1JwuAZU2OjHw==
X-Google-Smtp-Source: AGHT+IEEbFRnPWb04tCA94MWeTfmH4jTkc9Bg/xWlPtJbGWCRP85JYWhDJs2OV9BInntZi4GUGTMxA==
X-Received: by 2002:a17:907:7b8f:b0:a8a:792c:4116 with SMTP id a640c23a62f3a-a93c4ac91f3mr1450640466b.40.1727710767115;
        Mon, 30 Sep 2024 08:39:27 -0700 (PDT)
Message-ID: <768e57f0-5856-4213-992c-414f3fdc5430@suse.com>
Date: Mon, 30 Sep 2024 17:39:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: use alternative_input() in cache_flush()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <60fb1103-aef3-40dd-afd0-44f594753165@suse.com>
 <ec956d90-0ee6-43a6-9c6d-0f8b97a7c570@citrix.com>
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
In-Reply-To: <ec956d90-0ee6-43a6-9c6d-0f8b97a7c570@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.09.2024 17:27, Andrew Cooper wrote:
> On 30/09/2024 4:09 pm, Jan Beulich wrote:
>> There's no point using alternative_io() when there are no outputs.
>>
>> No functional change.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/flushtlb.c
>> +++ b/xen/arch/x86/flushtlb.c
>> @@ -286,11 +286,10 @@ void cache_flush(const void *addr, unsig
>>           * + prefix than a clflush + nop, and hence the prefix is added instead
>>           * of letting the alternative framework fill the gap by appending nops.
>>           */
>> -        alternative_io("ds; clflush %[p]",
>> -                       "data16 clflush %[p]", /* clflushopt */
>> -                       X86_FEATURE_CLFLUSHOPT,
>> -                       /* no outputs */,
>> -                       [p] "m" (*(const char *)(addr)));
>> +        alternative_input("ds; clflush %[p]",
> 
> Drop the ; as you're altering the line anyway?

Oh, sure.

> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

> However, switching to ds ds will avoid a trailing nop, so will be
> marginally better.

I don't think I understand, which may or may not be due to me not being
sure whether "ds ds" is a typo. What trailing NOP are you seeing? The
"ds" that's there already covers for the sole trailing NOP that would
otherwise result due to the "data16" prefix.

Jan

