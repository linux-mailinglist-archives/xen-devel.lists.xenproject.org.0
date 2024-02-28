Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C83F86AFA2
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 13:58:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686594.1068792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfJW0-0002pm-S7; Wed, 28 Feb 2024 12:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686594.1068792; Wed, 28 Feb 2024 12:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfJW0-0002ma-PI; Wed, 28 Feb 2024 12:58:28 +0000
Received: by outflank-mailman (input) for mailman id 686594;
 Wed, 28 Feb 2024 12:58:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHog=KF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfJW0-0002mR-0G
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 12:58:28 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f78c292-d639-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 13:58:25 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-56647babfe6so2314123a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 04:58:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ij13-20020a056402158d00b00565ba75a739sm1726443edb.95.2024.02.28.04.58.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 04:58:25 -0800 (PST)
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
X-Inumbo-ID: 0f78c292-d639-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709125105; x=1709729905; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5A/wWjF3vVLCALEoYlfcnrvEaYFldWBjh5ULoDsqBgA=;
        b=AdphRkkmjky7+Ch94nalOgWjt6rz+FHlYruHRzMIz+TpEepoUmzAW1MxifpA6S0zd2
         39Dy7K03dLkG/CbCH6Z2GruOu8kxQnuHY660A1TwNq0GK/sruZ7FZ0MgbfDSkCai0rM0
         2QPA7xOjRMo/BTvp+zWhpCW9pR7dC7NQIkp5c1foSoAMH4XHZQi50kuLvm6r+4pj4zAC
         b9RxI3PGgfykcHw7bZv1reDwS1PwKhXJNgJvBwio0yTqHzcW1gE59nOhS4twyhSmV3Ye
         izu6x5q8sgQ0duUUoAHso/kirDwoKy4sAhwkilqvC7wpZJqlZ9F9/ejXDJ+dXUT1MQSw
         I9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709125105; x=1709729905;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5A/wWjF3vVLCALEoYlfcnrvEaYFldWBjh5ULoDsqBgA=;
        b=PpL1Zx8JGBxranXIYcVVsB29P5uBN6tR0azYzBSlhLt0yfs1dY/tQascsSNm1Ss4JG
         fnfO8KsCSbHsUkzXLJ7nuCC00bN1rHqQNPz91EtLjG2uqunnbEWJAIScxM+HeqY+Reiv
         n4Z4QF1mUYc+M44oZl908QR8WM4CzqJ8xE7OEAV4U2YJI/zeStR0g+1euICgdTBTDHhp
         nZ6pKu1595VdCOP3CTFFh1cEJhg6bME4S9H9qFOp0bjTGoJsO2KBpeyKMRyTONL3GMVo
         Fo8LGSlu9mPf1gmVGePRx15XFXg93DYywNJg5+FL1bvCknSVRKE9TxsdRSMwqBa1Xrow
         T5SQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqIn3JIAhgdAiUj/xfP9QnfUIieMYJNq6NM7GyzB87oPNduja7yS7YIwrfdAHpU3CLlOAda2Tgx0+uph3at67VOWtt3YiYZMzq6FvX1Yc=
X-Gm-Message-State: AOJu0YxfXeCWsEXpyD9NejOA3s3zoMagnBCqs7C1UkSsvhA8iFhAoGme
	4bNVylyZsclCE2c7aqaoRNQ/N6Q6VCtc0sxB0aGtj5QdDz8sCVPZRx73F/H4Hw==
X-Google-Smtp-Source: AGHT+IFMFeP6iaUs4q//IP3HDemMlPP+qy5KQbMyMvrtv40xQGp/eYwdFZAyYdIRDCARVyij+itmzA==
X-Received: by 2002:a05:6402:1487:b0:565:7ce5:abd5 with SMTP id e7-20020a056402148700b005657ce5abd5mr8378817edv.18.1709125105251;
        Wed, 28 Feb 2024 04:58:25 -0800 (PST)
Message-ID: <5a4e8583-7747-4f24-94f0-d040dabb5b04@suse.com>
Date: Wed, 28 Feb 2024 13:58:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: preparations for 4.18.1
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Kelly Choi <kelly.choi@cloud.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7dc621a0-924c-499c-86c1-c35ec1f34ec2@suse.com>
 <1f251f2e-91de-4f81-a93c-dcb95746d2e5@xen.org>
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
In-Reply-To: <1f251f2e-91de-4f81-a93c-dcb95746d2e5@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.02.2024 12:50, Julien Grall wrote:
> On 27/02/2024 13:19, Jan Beulich wrote:
>> All,
>>
>> the release is due in two to three weeks. Please point out backports you find
>> missing from the respective staging branch, but which you consider relevant.
> 
> For Arm:
> 
> e11f576650 ("xen/arm: Fix UBSAN failure in start_xen()")

Which I assume you or Stefano will take care of?

Jan

