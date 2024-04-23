Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC1F8ADE9C
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 09:52:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710355.1109530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzAx8-0004qK-SJ; Tue, 23 Apr 2024 07:52:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710355.1109530; Tue, 23 Apr 2024 07:52:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzAx8-0004nD-P5; Tue, 23 Apr 2024 07:52:34 +0000
Received: by outflank-mailman (input) for mailman id 710355;
 Tue, 23 Apr 2024 07:52:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ck89=L4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzAx7-0004J6-LF
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 07:52:33 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 710d2e88-0146-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 09:52:32 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-34388753650so2741398f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 00:52:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g18-20020adfa492000000b0033e9d9f891csm14040548wrb.58.2024.04.23.00.52.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 00:52:32 -0700 (PDT)
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
X-Inumbo-ID: 710d2e88-0146-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713858752; x=1714463552; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G9rlE2qRcwklub8QM9wTuYkKaDz758AuROm+J1/Xnkg=;
        b=FfqkYB372sgHNxnDQq+Zdgn0Um9Eg8gBbMT41A1diK27OY0s+PCgElbMyQIvA7nHcY
         N1r5gVWClIBWwcVq/eOQogEmkIkdezNVEPp6PT4mlUGzBsf66X8xDhyiK/VKufUyIDZg
         xbUyLqYNi+3r0oLWAFFN/u636jgXGXWxo2eKQUR5zzp19Gt/jQEgmi1QMw2qZ5VixOud
         nosDTNJ8iX7bLrJADhKNUoISAoz4bgpHNlEhtX1Uabt76wtY3g2HK/nVSJv/usrWnJxd
         HuCBIURQJ0N4p5PePS5plxpaNMUbEPmuqNFPGlZrxP2JHeTxXuMm1RarzviOHPEiKwAu
         Kvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713858752; x=1714463552;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G9rlE2qRcwklub8QM9wTuYkKaDz758AuROm+J1/Xnkg=;
        b=P3oL7Vs9sYVArHYV5qTR/rXLcUW63guxtIVad1pXGt+Lg79HDj4i1YVOK82h3kk+oH
         3zcFC9ThHpvuL+B9XzH6IYhnpw7bZ5VCGreXAWGYBYp3knMcGcis5Y46EBMERnbGcdx6
         ZZi0vBTYp2iUftPvT2A2+dI9hN9fyhUN6hgOv+wtTL0NqLpOsqQ76YQyuvFx8DIaSkgW
         uAnEI5EiHhhb7NIRA+IgXMN4tq9j9VBlmAJWsuhgnGm+0V92bHyr4qhUE4qhHxNo8Wgy
         yKxXhiY0sz6gJm7W/rp84NmOFqAxl1W7xvhe3tzqH+6YaTizKG5rRoKJu+gXM0tAx9AS
         cxaw==
X-Gm-Message-State: AOJu0Yx79fkXtjlaMQ59jYiqudmw37IlMQvTbIak1MscUkz5giZ/XKHi
	bH6c8zXAUv27Ez4NCHvd6MHhLQTf1KwEI5gn7Gme851obBVKQAuRCdZ60UYAKQ==
X-Google-Smtp-Source: AGHT+IEeXODWcoco3SRVaAOgPhSIRd4Z+pDusmT2kM0JXQq15aKsJdfzuIba+/qliqZkNXSrKIDU+A==
X-Received: by 2002:adf:f1c2:0:b0:343:61bb:115d with SMTP id z2-20020adff1c2000000b0034361bb115dmr8255440wro.26.1713858752484;
        Tue, 23 Apr 2024 00:52:32 -0700 (PDT)
Message-ID: <63519cb9-58a3-4bc5-9973-6ae68557f1da@suse.com>
Date: Tue, 23 Apr 2024 09:52:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/MTRR: avoid several indirect calls
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <f5c8e38c-66cb-4f21-b66b-056061e37383@suse.com>
 <ZicMFtKob2e-ECxX@mail-itl>
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
In-Reply-To: <ZicMFtKob2e-ECxX@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.04.2024 03:17, Marek Marczykowski-Górecki wrote:
> On Wed, Jan 17, 2024 at 10:32:53AM +0100, Jan Beulich wrote:
>> --- a/xen/arch/x86/cpu/mtrr/main.c
>> +++ b/xen/arch/x86/cpu/mtrr/main.c
>> @@ -328,7 +316,7 @@ int mtrr_add_page(unsigned long base, un
>>  	}
>>  
>>  	/*  If the type is WC, check that this processor supports it  */
>> -	if ((type == X86_MT_WC) && !have_wrcomb()) {
>> +	if ((type == X86_MT_WC) && mtrr_have_wrcomb()) {
> 
> Is reversing the condition intentional here? 

Clearly not. Patch sent.

Jan


