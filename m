Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F2B8427C5
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 16:15:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673561.1047955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUpps-0008KS-JE; Tue, 30 Jan 2024 15:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673561.1047955; Tue, 30 Jan 2024 15:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUpps-0008Id-G2; Tue, 30 Jan 2024 15:15:40 +0000
Received: by outflank-mailman (input) for mailman id 673561;
 Tue, 30 Jan 2024 15:15:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFHt=JI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rUppq-0008H3-Vv
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 15:15:38 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6babd1b0-bf82-11ee-98f5-efadbce2ee36;
 Tue, 30 Jan 2024 16:15:37 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40ef64d8955so19980275e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 07:15:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l22-20020a05600c1d1600b0040ef95e1c78sm5374679wms.3.2024.01.30.07.15.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 07:15:36 -0800 (PST)
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
X-Inumbo-ID: 6babd1b0-bf82-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706627736; x=1707232536; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w+/TPHNAo5PpoFzjzPS+oeE0GdaVdCIMlqzzJjCizIo=;
        b=acA2oq4YVOYHaam2evKd1dIL1RRhT4Jg7F6Aev97F57AxEi6gZcOEdr4r4GpgowuZ9
         69DpNXatHEdJvv8e8HpL+XErErT1W8ayokivzlEhO/0z9Zm8/IFG3muDykpMZTxuGW3Z
         AUjfdczz7wSnwc9d3W+7aM+x5WXzrIbcEEjBQ3ISoqPh79E9UgdOFtQfUXIXHiJ/ELQP
         47sMwROf2J3BSjvSDLJfEI4AUkjG4eIXH8/4ET8+sQWogumls3B112ZOcnq5bMyQ6moU
         dTOrSkfbIlfLCTo4k38kpBmpbVo+YBxlI4VzXMXqgUnM4qstxU4Hcpb9UIduLP/sqLu3
         uExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706627736; x=1707232536;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w+/TPHNAo5PpoFzjzPS+oeE0GdaVdCIMlqzzJjCizIo=;
        b=LgPpedVwNAumSIp0jTjtWnL3HVvXxs0XdZ74YwwtFA8/nGL2al4SWybfUgp45CqYgw
         grjfLNo4KrIhzSj2FMYzZrJIAoQ1yDkwTA8dvlejr406tbyufxGLOTZh2uiHVzLssjvF
         QU2jYMAod7a1by+l/1T9F73fTgrEcbDVIFtWv6uiNcjv0LyBeQNzOX2QMIxs9TIxQ1kn
         E9y6AGYTT1R5t1ZCHWxK9oukrvNc8gzhKs12z6oh3PYECX5ErDL49eGqGRkqBUjthk+L
         LmJSnyaBp2syM2gDWqE617OXkX5ZkX/hX5teBgpCmAaqyXuxmFYLJNRSlQzdVb6gDRwz
         JEIQ==
X-Gm-Message-State: AOJu0Yzc0dpkYfZXLMPRaYVSwvcuKQKzIhDqqjDKBZCcjJ5CpmA3+mZE
	KjURjLHjGwZnjNrABjKSKp372zt1S/PyLnMaSjl1LpUiVK7ewfaOzOqxUTh3Qw==
X-Google-Smtp-Source: AGHT+IFYHXXQiqVJ4T2LQCGyn55ByMmy8igPHJ1SMKkI9ikMtWew+RvuBvmlYiwNOM3Dpb9C7xYXSQ==
X-Received: by 2002:a05:600c:3511:b0:40e:fbdd:23a4 with SMTP id h17-20020a05600c351100b0040efbdd23a4mr3426472wmq.26.1706627736444;
        Tue, 30 Jan 2024 07:15:36 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX25Nc+CRSTazqwoINvvEOXhFC3dgW3SKTMZOzAaln/be39FA496uE1ha7i8rzxAGJB2rkHXWHteOHcMXmtV8J79MdJZH5+LrsRTj/Cx/f9HEQqULKg5EQVQyI=
Message-ID: <1ca6bd31-41e8-4a81-9fac-49d2fbd5f089@suse.com>
Date: Tue, 30 Jan 2024 16:15:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/traps: Annotate {l,c}star_enter() as nocall
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240130150839.4130909-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240130150839.4130909-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.01.2024 16:08, Andrew Cooper wrote:
> ... as with other declarations which aren't legal to call from C.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



