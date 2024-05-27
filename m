Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C79268D06E3
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 17:55:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730882.1136154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBch8-0003ki-SY; Mon, 27 May 2024 15:55:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730882.1136154; Mon, 27 May 2024 15:55:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBch8-0003hy-Oz; Mon, 27 May 2024 15:55:30 +0000
Received: by outflank-mailman (input) for mailman id 730882;
 Mon, 27 May 2024 15:55:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O60l=M6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sBch7-0003hl-EO
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 15:55:29 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8943609b-1c41-11ef-b4bb-af5377834399;
 Mon, 27 May 2024 17:55:27 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2e724bc466fso101325001fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 08:55:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cc51a02sm502241066b.106.2024.05.27.08.55.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 08:55:26 -0700 (PDT)
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
X-Inumbo-ID: 8943609b-1c41-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716825327; x=1717430127; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OWcz2N3u29S4FPgRjETbFz7nerJVp+5gmcPdSqg682A=;
        b=em0BY+xXT1ry3WLsz/1J8WWRxcQsL+BgJc2Hwidxcfb9XVCmVxpgjWE6BIbbDT1gvl
         KW05khlKETC33qnfvVvcrpDVcfeNyS+zUBCYmAwoWusxr0Fck7U9ToQ/PM5J02Bf7Rvs
         CUjVEUq7DQtK4auIVdIWVxmqgaUK+vvGHtHS96okFPYbY4Rd+pVYr6HyAn5n6A2V7FAN
         ZTC+JUZU0AsIB1O/sT1lAFAkkJVS7HGyAiXUAuX8Z9s/RQu/x0V0M3GY1pyZx6mjpbm8
         PPw0Hwrn8hNlooW/0i292q3MQ/DvOG4NHtHh9TcTeKNv9hIvA+XElNUtJC/E5TIKG7nh
         fg0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716825327; x=1717430127;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OWcz2N3u29S4FPgRjETbFz7nerJVp+5gmcPdSqg682A=;
        b=AwLt1nYpIWg64Of1JMzDb+TwCV8+BdZzy+iR1KuHgNnc5q1gbF6/qsIicErM6Ee6UR
         eh6CA7Zra6S85qWOn8eJX6tORjVPXwYqCWzmZ9IRfYTf0XxOETigx4OEmWGc+atLIFTx
         Jr6E0lgJmSpsnwXzxayKqlRPQpCGSfuHxcd7Pt3JzmzDIVgW04SUoeXB/S4UZQ6z12hb
         v8A4Mk3IL6udt0ihApljsDn05vudXhfUtjXFGt35yP32hBbA+4BRKdbVpwuFvlC2rrsJ
         l+t+OMB+D62Sk/ykN/yhvUgHJ7/L1jwD6MDQK/MzfRif9ZAyJtzqk7DRb6L3wddEnmo3
         lHjA==
X-Forwarded-Encrypted: i=1; AJvYcCXUKLMsSofiD/unSUMTE/wxvX9YG61aQmpOzwcwu7szKMrF0i3GpZEeNv/zHtZJZODMEeS241gcUbNXxZ+tRoQDVklxw5G7u0zc1Z4G9xM=
X-Gm-Message-State: AOJu0Yy8/j2Ayj+yhfjAGIRhrmKHhwlex3+06/+XwUJe+pq/rtEzkebL
	WxKaRvmISs3qvqKM5cq/RrSWRkiLA/FbfSTmYL+O98smGxRABdx0XzMq692Ieg==
X-Google-Smtp-Source: AGHT+IFltXxPGB+H12n6mhEniu14tVABxmwB1itbOGn1BiOCF91gddOdX5nTMRnQMVMprglFUCD1yw==
X-Received: by 2002:a19:8c46:0:b0:516:cf23:588 with SMTP id 2adb3069b0e04-5296556fca3mr7248597e87.27.1716825326876;
        Mon, 27 May 2024 08:55:26 -0700 (PDT)
Message-ID: <2d0c1ebf-fecd-43a5-b616-9869e98ece5e@suse.com>
Date: Mon, 27 May 2024 17:55:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Code freeze date for Xen 4.19 is 31.05.2024
Content-Language: en-US
To: "Oleksii K." <oleksii.kurochko@gmail.com>
Cc: committers@xenproject.org, community.manager@xenproject.org,
 Kelly Choi <kelly.choi@cloud.com>, xen-devel@lists.xenproject.org
References: <6a4323b46dd3dbb170c48fa24e78a23fa030b2a2.camel@gmail.com>
 <a1e65a79-d8a4-4b8a-ad4d-a18544389e5a@suse.com>
 <48f5e40e1f13ef96e8448b59f76878b522876030.camel@gmail.com>
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
In-Reply-To: <48f5e40e1f13ef96e8448b59f76878b522876030.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2024 17:52, Oleksii K. wrote:
> On Mon, 2024-05-27 at 17:12 +0200, Jan Beulich wrote:
>> On 27.05.2024 15:58, Oleksii K. wrote:
>>> I would like to remind you that the code freeze date for Xen 4.19
>>> is
>>> May 31, 2024.
>>
>> I may be confused: With feature freeze having been last Friday aiui,
>> isn't
>> this a little too short a period? I was actually expecting a longer-
>> than-
>> normal one to account for the Xen Summit week.
> It makes sense to move the last day to June 14. Consequently, we would
> need to adjust the schedule as follows:
> 
> Hard Code Freeze: from June 21 to June 28
> Final commits: from July 5 to July 12
> Release: July 17
> 
> And this schedule also looks good to me.
> 
> However, another option is to combine the Code Freeze and Hard Code
> Freeze periods since both phases are about accepting only bug fixes,
> differing only in the severity of the fixes.

I'm okay with whichever way you want it. All I'm seeking is clarity.

Jan

