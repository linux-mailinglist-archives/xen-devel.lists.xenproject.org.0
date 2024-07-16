Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5705A9320CF
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 08:57:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759325.1168991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTc88-0004SC-Mk; Tue, 16 Jul 2024 06:57:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759325.1168991; Tue, 16 Jul 2024 06:57:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTc88-0004Pm-JQ; Tue, 16 Jul 2024 06:57:44 +0000
Received: by outflank-mailman (input) for mailman id 759325;
 Tue, 16 Jul 2024 06:57:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I1NN=OQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sTc86-0004Pg-Ub
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2024 06:57:42 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b21ff24b-4340-11ef-bbfb-fd08da9f4363;
 Tue, 16 Jul 2024 08:57:41 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2eedea0fd88so32108851fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2024 23:57:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7ecabae5sm5502257b3a.180.2024.07.15.23.57.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 23:57:40 -0700 (PDT)
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
X-Inumbo-ID: b21ff24b-4340-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721113061; x=1721717861; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VI8xrafdUJpOrYduOP39Vh9LDhKCH8Y+YZpMK3X4/r8=;
        b=TODBtECZXFtjOwQBgfkp8p3MADbl7BV8cpkLJ4jkxBa0KS/NaLCkNlQqBKJ9LJY67L
         XTli0EexEclbjk7Py//DmfurYD/JueSdisaob5HZkMeT6gM0q7UZNYihfJeSCldixLDr
         8se7sINLrPmBRgCKo1QiYgsJ7CBgmlp9z9NTw4WaFq0wRd4yAp0SzG46HUIgpdq+XkRQ
         DYDkjemdL4xC6SrgD28mq2miQ8Uq9DfDY03KRecQgvadqmcTcTHS9d8hLI05E0TdnEos
         7kzTvDW8TEcfXAy9XUIF5T6og75IUxJ7RZkq4iz3De/toMqBfXcTD61gk2h0/5094gFZ
         gPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721113061; x=1721717861;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VI8xrafdUJpOrYduOP39Vh9LDhKCH8Y+YZpMK3X4/r8=;
        b=fLqfkZg5vDnw0u54JjgfFdNqjFMj38J3Fq+WGmF5a582KbI7/ITjN7GLYiuaQm3YUb
         aBRoe0lHDsqa0ibtGcUaDLGBZp7H2Dorsq8szUaeBJbztd3KecVn8MryuEKwmxsMSMx0
         eigD5GORK0H1130kpYIDfjLpep9oFDU52p3bQfaMQDl48PEwIQ7Cc+IjCoIAWNubMJ8k
         Q0urvOhKvvluOOXltkDA2nQKf4JdBIdcdWJUqtk390kbUapqRZsEi1ri4UI8pCG+YawT
         6n8yQ81Pivzi7Z66HBN2UutaBfv1E3GoAU1JWW2X7LMZ+eeT2x1avtEJgUGl1w2uABNy
         bIgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQz5mDtxRe+9qod9ywFiB5DadlSb9/UZcH3EZh4OHk7JXn6bnVwQbwuh1ZVOlqwOueas/VC8yeVPtN8Wn2jBZoRneur6cGqvXhbeDUqk0=
X-Gm-Message-State: AOJu0Yylvdk0Fn+9dgcECbfHMZWldL7aBXpOUr5tdmbT0FoGBWpBIKCx
	lKl+gfsCY45+LA2wbgUMCAdxfFq7x5FuIl+Sk33qOUDFXQ2L8/vbUtp9Q31OdA==
X-Google-Smtp-Source: AGHT+IH+AfNUomn/3C/CyyHUghh2Csz+1VOfUoUWNkoGD82at838A6MD8vjG67XOn/BH8+RY9f9QjA==
X-Received: by 2002:a2e:7a12:0:b0:2ea:7d8f:8d12 with SMTP id 38308e7fff4ca-2eef41ea8d7mr7555421fa.48.1721113061314;
        Mon, 15 Jul 2024 23:57:41 -0700 (PDT)
Message-ID: <81c65915-cecc-4edf-8636-3be56a411c50@suse.com>
Date: Tue, 16 Jul 2024 08:57:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC for-4.19] docs/checklist: Start tagging new dev
 windows
To: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240715164639.3378294-1-andrew.cooper3@citrix.com>
 <7db0879f-93a3-4690-8ba5-1f0897027e47@xen.org>
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
In-Reply-To: <7db0879f-93a3-4690-8ba5-1f0897027e47@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.07.2024 18:58, Julien Grall wrote:
> On 15/07/2024 17:46, Andrew Cooper wrote:
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> With one remark below:
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>
> 
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Julien Grall <julien@xen.org>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> This is about figuring out when a change was first introduced.  Take
>> 10b719dc88 for example (completely random pick).
>>
>> The right answer is `git tag --contains $sha` and look for the oldest
>> RELEASE-$X.  In this case it's Xen 4.6, but the tags are not numerically
>> sorted so the answer is towards the end of the list of 166 tags.
>>
>> The better answer would be to `git describe $sha` because git has an algorithm
>> to do this nicely.  In this case, it's 4.5.0-rc4-934-g10b719dc8830 because we
>> branch first and tag RELEASE-4.6.0 on the branch, rather than releasing off
>> master.
>>
>> With 0082626f35af (opening of the 4.6 tree) containing an annotated tag of
>> 4.6-dev, git describe now gives 4.6-dev-902-g10b719dc8830 which far more
>> helpful when doing code archeology.
> 
> I think some of this explanation should be in the commit message.

Imo it could even be moved up verbatim.

Jan

