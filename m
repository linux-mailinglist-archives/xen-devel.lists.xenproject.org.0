Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 544EBAF8930
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 09:24:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032890.1406298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXalq-00030u-3R; Fri, 04 Jul 2025 07:23:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032890.1406298; Fri, 04 Jul 2025 07:23:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXalp-0002yx-W6; Fri, 04 Jul 2025 07:23:41 +0000
Received: by outflank-mailman (input) for mailman id 1032890;
 Fri, 04 Jul 2025 07:23:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yJnJ=ZR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uXaln-0002yr-Vi
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 07:23:39 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdf47777-58a7-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 09:23:38 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-453643020bdso4117305e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jul 2025 00:23:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce42a2638sm1392638b3a.137.2025.07.04.00.23.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jul 2025 00:23:37 -0700 (PDT)
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
X-Inumbo-ID: cdf47777-58a7-11f0-a315-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751613818; x=1752218618; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+wRKv44Zc8tocj9SEWeMyg43NkxzIo/BmZJe9ZWvTF8=;
        b=gabFEbuqEm3Pokh/Clh2r55PYqbNyIwy+uO6parIhN3c3f/GvL815KElKDqUvYMSLS
         /oqkaXpPPtjZe04zj0W5JxdH8+DZ6l5i7WEGCBOSc4PzWebqw+xak9/kdjugmX6hh+E1
         Q9Q4h20VhFv+jdhHBxBq9NTL26sEgLsTBxw6CmyaOJHq2BwKJ0P63TAWKd1+GQXqyluT
         MXuVi6CCVZUosSJ1V0oC6AegPJ2DixtAJr/NFox+DybLBTAcSYKaHsZ66glSEEPPCxD5
         1BlGwhaJATnuMQO6k2i/m3ar65FE/twAj7tRJeyj38Feyzl/JheIW6LEkVkQogdBz497
         k/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751613818; x=1752218618;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wRKv44Zc8tocj9SEWeMyg43NkxzIo/BmZJe9ZWvTF8=;
        b=ve7sG9yi9YuWZd0TLzEOlNYtz+OSSR5JsQpwsP/vQNWNccdMR3Tp0tlvy1SCjdEfd9
         AvtcJnm3F6AzCbfeNM35Qg19yneMv0CJnWyNe4qJ+Hu2H0xCaaLhbNWIF9x4AukXSfAA
         qKg3eFBe5+Rktq2Q03vazsW9XeUvU4p8mt48LS6wwJW2euoVjemY5LjpKO6SAU5xhfw6
         fD/wdIqKH1ieSKFsp6Uq9HNPvqQY0UyWEWkGG7wSlJmGaacrpZzU7ah3tIALA/8ERd5W
         hE6vOmYTAvAHSzlhNOMiZfmHimmivfc77oruXdphUUxDso0AU43aUg/eL4rIYr835iM7
         NEQQ==
X-Gm-Message-State: AOJu0YxsjvZbaccU/dFtTX4e7xrGzEHUCmf1Dn5qWfIZ+oCFaHMmveO4
	5ctCYwSnczXSlRewricI4tbnnYoZuRhShrZcrjgnI6Y7JNGYJKxq1+RMGut4acjYyw==
X-Gm-Gg: ASbGncvpT7gI41gwMTDqJZW1o81rIBWomphH2O9E4UqmsqR1ZhafMSIxi1u9yhYakPM
	3u+GO9OcMk4heRc4Kw+mVUOPGyKHltTGmlPPQ/nrhR5wTm/EzjUQzf/jIFSfjPgagKW8HTAn6Nt
	gCKA9mEylvbhCxMrZykBBMPbf4t7MZ+woo+chQtzIGvp1ifjJI9SurSG4NIu3hPjHQQS++waNvw
	hXer+CSvqM/ElZNQ6ZKbeJN3Gpa+TjB/p1ACXIG/e3hY2zZf+oKWWoCj+J0lLw360pQfOnQQWrD
	okevb9ferHSlmybnKTH0ntq5QASrTUfpNA1DYzgu/1+H9o3HbHokVa7nmHiQxCqlfBZGZskH2P9
	byekzGdwNgRA7ZuwIg9velfLwXNrvfO0F6vGMlOt1gczKhc0=
X-Google-Smtp-Source: AGHT+IGEpn09B2lPu7UdpOI6Xm6TaaB9vY41zGlcOLL/0yR5/A/jG39Ojfx7LCqBK9siRhkfP8gkjw==
X-Received: by 2002:a05:6000:2409:b0:3a3:6e62:d8e8 with SMTP id ffacd0b85a97d-3b4964fc7d1mr1081435f8f.55.1751613818195;
        Fri, 04 Jul 2025 00:23:38 -0700 (PDT)
Message-ID: <86dde581-40ad-405e-8d98-0b4485529581@suse.com>
Date: Fri, 4 Jul 2025 09:23:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] xen/softirq: Rework arch_skip_send_event_check() into
 arch_pend_softirq()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
 <20250702144121.1096448-4-andrew.cooper3@citrix.com>
 <aGat-VxBF5jOErzy@macbook.local>
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
In-Reply-To: <aGat-VxBF5jOErzy@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.07.2025 18:21, Roger Pau Monné wrote:
> On Wed, Jul 02, 2025 at 03:41:18PM +0100, Andrew Cooper wrote:
>> --- a/xen/include/xen/softirq.h
>> +++ b/xen/include/xen/softirq.h
>> @@ -23,6 +23,22 @@ enum {
>>  
>>  #define NR_SOFTIRQS (NR_COMMON_SOFTIRQS + NR_ARCH_SOFTIRQS)
>>  
>> +/*
>> + * Ensure softirq @nr is pending on @cpu.  Return true if an IPI can be
>> + * skipped, false if the IPI cannot be skipped.
>> + */
>> +#ifndef arch_pend_softirq
>> +static always_inline bool arch_pend_softirq(unsigned int nr, unsigned int cpu)
> 
> Nit: I would maybe it arch_set_softirq(), I find `pend` not that clear
> (I would rather fully spell `pending` instead).

I, too, did wonder about the naming here. But using "pending" as you suggest
has the effect of giving the function a name we would normally associate with
a predicate ("Is it pending?"), whereas here the function is used to _mark_ a
softirq as pending. Hence in the end I didn't comment at all; I'd be fine
with "set", but I'm also okay with "pend".

Jan

