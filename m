Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1C4ADB525
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 17:21:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017375.1394361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRBdo-0007eV-Ms; Mon, 16 Jun 2025 15:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017375.1394361; Mon, 16 Jun 2025 15:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRBdo-0007ci-KG; Mon, 16 Jun 2025 15:20:56 +0000
Received: by outflank-mailman (input) for mailman id 1017375;
 Mon, 16 Jun 2025 15:20:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRBdn-0007cc-JQ
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 15:20:55 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e9a727e-4ac5-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 17:20:54 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a361b8a664so4715099f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 08:20:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-748a0666b1asm4827962b3a.144.2025.06.16.08.20.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 08:20:53 -0700 (PDT)
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
X-Inumbo-ID: 7e9a727e-4ac5-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750087254; x=1750692054; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TT5s+oHcVGNzryxf6YZ1fu7yLxh41sfErOzsIMk8gCs=;
        b=BHif7o8BOr4dCM6p4PUCZH0Gy0gmaqFxrXvQFx1ajtmiADjkHc1vXjLHN9ouCNe6yV
         xTvjz0KT4AvwfcUUe226HgYqTU30noVlOzATYklZckqQ9sWZFbekvEzL2IgzsBzHH1GY
         NzJQAic00QbYGfuOtegrey5wP1ubT9MIARCMCGeOjlfvQs0ST22bqCP2IxH96fB+J6c5
         fU/egXcE5GaGkMhlDFW++iy/vWhNB/S15LnhhvASy+miIyAai1pRgLC7OgPa2THIJFQO
         Sq4MW7qJkJ7k5Z4QaQT0/HWkKbw9SZPfzlmqDfdsZrq4DBPdXyqDPS5qVgXjy9ZEPaSA
         vxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750087254; x=1750692054;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TT5s+oHcVGNzryxf6YZ1fu7yLxh41sfErOzsIMk8gCs=;
        b=iSuRCQWP//7/kBs/jjTirg23YsGiab0fud21iZk3+dDVMlIZwioDGIRvxL/WQ3la6u
         cTmkekUi1SReUhv8aAF5Zps9estd9z/Y/I60fp/mJqlOStsdFAtaXB7X8xAomya+9nXL
         e1CsUhOt8p7WVoqQKbCXseUIfDavc3F7dvIhNYboV8mrEMmywUgJK/BtPsRxxBM6gKCI
         uqed/K/J+uTlbFpuiKfYp7pgfGTWezXJMXu1uJXvBtXG6ssd1c0m/baSdpAs01VGnW0R
         t0hEZE8L4VNRHy1mPh0MSy7H3Ez3XmkuWyksbq4xDjjN3eGWl4zitiJ0YQxj5AKZaQg5
         stPQ==
X-Gm-Message-State: AOJu0YzMnA+EYY5UHGv13A+JZ3Nsh28GHY11zf3WnXg1EEJfL2OcOEj1
	O++KhZdjCN83TLCZ07uGhZ24gHCP1cwXARGwaZlztyBfe2NHhf6+fBcM3SqYPaqaBg==
X-Gm-Gg: ASbGncvDOnD8TAimtOmUnjOoNmZ5c9FtbEaXSjvic/DSYG3dDzc70XnV6cBJWE74rJu
	iTX2ebcBKc0lYOK4l9R3Ytn+7E/mx2g/1O8mpG6YxZKIxk94p8E/ONgabJQUtyvDaPW9VmTMYI7
	51NDTTGwPPAOmps13mqvqbWiOvI+Ytg9RTnAS4uNRU43buKCoWsd9GVAoyKh3Pf5geAIl8GPsNp
	kM4T3dxI/fxSIyhA9N3nJ2ULQIiqHfSTMVjqSRRnM6zfjPnR5WF82JPhv11OdFn4ECw5fTaNQ3B
	q+qw6TWiBmj94Ejk0Er01i+VyVIS3nODqFMRl7IwAZuX5fPuWveYQUUacvyytrXrCbunoCr4rmN
	TDneXcc98rIPpzT0tHAoxcprKIVKe5uJXefxNutI5iPO7T9U=
X-Google-Smtp-Source: AGHT+IEohTIro7OLRx0dRZJXCQqrUawQA4y0yGYEom+Y0W2oF5WpH+gPufMdjJH1TyByEoha/7mq9w==
X-Received: by 2002:a05:6000:288d:b0:3a4:e4ee:4c7b with SMTP id ffacd0b85a97d-3a5723a3ad5mr8307496f8f.15.1750087253647;
        Mon, 16 Jun 2025 08:20:53 -0700 (PDT)
Message-ID: <2969b5d8-5879-4674-8332-046898e17257@suse.com>
Date: Mon, 16 Jun 2025 17:20:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: arrange to conserve on DMA reservation
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
References: <6565e881-ec59-4db4-834a-f694bf1b9427@suse.com>
 <aFAbqhfmM_GBxjVC@macbook.local>
 <9b036f26-f275-48d0-9a33-7cef38b29f48@suse.com>
 <aFAuRXSryHKj3jVa@macbook.local>
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
In-Reply-To: <aFAuRXSryHKj3jVa@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.06.2025 16:46, Roger Pau Monné wrote:
> One question I have though, on systems with a low amount of memory
> (let's say 8GB), does this lead to an increase in domain construction
> time due to having to fallback to order 0 allocations when running out
> of non-DMA memory?

It'll likely be slower, yes, but I can't guesstimate by how much.

Jan

