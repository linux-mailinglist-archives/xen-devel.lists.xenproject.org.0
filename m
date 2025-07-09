Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17519AFDF79
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 07:46:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037694.1410247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZNcr-0005mF-IV; Wed, 09 Jul 2025 05:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037694.1410247; Wed, 09 Jul 2025 05:45:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZNcr-0005je-EM; Wed, 09 Jul 2025 05:45:49 +0000
Received: by outflank-mailman (input) for mailman id 1037694;
 Wed, 09 Jul 2025 05:45:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6dDj=ZW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZNcq-0005jY-Cp
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 05:45:48 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5edee81-5c87-11f0-a317-13f23c93f187;
 Wed, 09 Jul 2025 07:45:46 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a54700a46eso2826988f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 22:45:46 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f2be:e417:6234:73d2:3c23?
 (p200300cab711f2bee417623473d23c23.dip0.t-ipconnect.de.
 [2003:ca:b711:f2be:e417:6234:73d2:3c23])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47285d3bbsm14907099f8f.96.2025.07.08.22.45.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 22:45:45 -0700 (PDT)
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
X-Inumbo-ID: f5edee81-5c87-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752039946; x=1752644746; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Jx9J+vSwGmMhlFHUPsBNLaL8mQHw2ZnE/LiacSUTHlc=;
        b=ZkoIhoUhvTesjOw2yrlcn2kbEJqselZGkQoSDtgrncMKtzC3hU4BNdpWzSl2iOXHFX
         b62bX8QvSglkHaLN0Lt9jzP+YCsjJLSiD3pcn/vxC/ePCOnAEoN1m3+7wev/tkbxD/XO
         6xQbI9LLSsh+KhCiIqLa3ssWlcDTO4DfGLNgVF7z6NWH8t/ap36QuLPiRg5+yjhhN9lL
         jJSiHEhERJsJfjROO4V23B/BkFJn1hBqCNUgRqWyZfe6M3HHb7R7xqkhlGRK/e94Uz2l
         2VygY1egUP1h/+anVgsS/uJpM7mriHnLxqK05mbHphuSYkR9wX2VV9GldO055TZIHp0O
         XCKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752039946; x=1752644746;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jx9J+vSwGmMhlFHUPsBNLaL8mQHw2ZnE/LiacSUTHlc=;
        b=pubCvZlIwUHm/+EinF6olDem62jxfACxm8A1CIs6fRt6sVURqRt5Y+R+cSeI7F5zlU
         KHh03ggCx9xrdpgirATPt60KxMB+l3xhu4HX5/ApaAAuKwHKuutF+tKv9TZm9feP0JQ0
         24UidzJkH//mIfdCaIbj7zSjLcIxnhbTS/CJ5X1rcMm81WWoYLtaAjTrjoeQWQTs3JtI
         X1iQjkB/TUDbV6j4QlCYqB/WCG9fykgzj1sl7yNBcN7Y9lSOu6WO2fA3sgjl17/96hhY
         CcB7xjUK8DjBKwZCfPEZDQP3y08iX6YxTs6GhHp8YRGbrO4cAwjpFpxSUrqac+sH92Nd
         UItA==
X-Gm-Message-State: AOJu0YxKfuolHWHX/jfsSbpIA7M2L00J1M5KmP/kbbodmrumDrdEjxr7
	4j+GNKGcUocLu7kke14mIVlPT0X53e9iWdCqcIjX02ZSI5ZspFC80jLCP3vW1CruGg==
X-Gm-Gg: ASbGnctaHnejaqSSc09KCup7Z6JFSYYER5TbfT/c6THnTr5ec3lmRJb518z6MAyeAjH
	8Stw6X+GnkZ5mB7Kkb+HG2F+Ozc2srXFm2xRkpiOITl4RMnYlHkMSOQYRuU+uQiK9rZuuFvhLAU
	7YRnx+Irsf627QAIsYzIle3YUgThpABlmFwf9kyyvGeSO4dSq9443bcW1dyoLMqPQRNlDRylAXW
	qlex6Gih/WPCuOeTdkGD5o9hld2CXI8Bc1O2SFYepLa9uIbais8Z1c1Cp52gq8t7KbAdRBxA5pD
	xSwRvMfvwQFT0jNgpRhUsJZhAvEN3Po2HQ8dlXJ8eexj6yEj7avK+Jlt1qk4JpVbAQ2iaLl7PY+
	pvb46d0Uh0ngEtmp+vy5OtGAQ1FfSfru16SIq5lwv2woRGKNYppNS3CoEXdXgvU9QVceVTHNDlr
	s8w7klN0WLxdO+gj4OnWXF
X-Google-Smtp-Source: AGHT+IFIAMSLB2URle/mI4K3F/ARDM3DJ1/r1IOcxa+rxSn/kRVyHl/WIEvlQPElpK64lDbxXpUySA==
X-Received: by 2002:a05:6000:4211:b0:3a5:3b03:3bc6 with SMTP id ffacd0b85a97d-3b5e4529eafmr696264f8f.28.1752039945849;
        Tue, 08 Jul 2025 22:45:45 -0700 (PDT)
Message-ID: <44827eef-a4e1-423f-8b57-6598064e3877@suse.com>
Date: Wed, 9 Jul 2025 07:45:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen/console: introduce domain_console struct
To: dmkhn@proton.me
References: <20250625002956.408945-1-dmukhin@ford.com>
 <aG27Uas97Mwo+l2t@kraken>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
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
In-Reply-To: <aG27Uas97Mwo+l2t@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.07.2025 02:44, dmkhn@proton.me wrote:
> On Wed, Jun 25, 2025 at 12:30:03AM +0000, dmkhn@proton.me wrote:
>> From: Denis Mukhin <dmukhin@ford.com> 
>>
>> Introduce domain_console for grouping data structures used for integrating
>> domain's diagnostic console with Xen's console driver.
>>
>> Group all pbuf-related data structures under domain_console. Rename the moved
>> fields to plain .buf, .idx and .lock names, since all uses of the fields are
>> touched.
>>
>> Bump the domain console buffer size to the closest power of 2 (256) and
>> rename the symbol to DOMAIN_CONSOLE_BUF_SIZE.
>>
>> Finally, update the domain_console allocation and initialization code.
>>
>> No functional change.
>>
>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> 
> Can I ask for review?

I think I did give enough comments on earlier versions? I'm not entirely
comfortable actually ack-ing this change. One aspect is, that - despite
earlier comments - ...

>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -371,6 +371,25 @@ struct evtchn_port_ops;
>>  
>>  #define MAX_NR_IOREQ_SERVERS 8
>>  
>> +/*
>> + * Arbitrary value.
>> + * The buffer is part of the dynamically-allocated data structure, using an
>> + * even multiple of a cache line size may help to optimize the allocation
>> + * overhead.
>> + */
>> +#define DOMAIN_CONSOLE_BUF_SIZE 256

... the comment here still isn't quite accurate imo, and hence potentially
misleading. The overall size of ...

>> +/* Domain console settings. */
>> +struct domain_console {
>> +    /* Permission to take ownership of the physical console input. */
>> +    bool input_allowed;
>> +
>> +    /* hvm_print_line() and guest_console_write() logging. */
>> +    spinlock_t lock;
>> +    unsigned int idx;
>> +    char buf[DOMAIN_CONSOLE_BUF_SIZE];
>> +};

... this struct isn't necessarily guaranteeing minimal overhead just
becasue buf[] size is a multiple of the system cacheline size.

Jan

