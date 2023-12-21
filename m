Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEFB81B36C
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 11:21:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658751.1028092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGGAU-0002Oe-8H; Thu, 21 Dec 2023 10:20:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658751.1028092; Thu, 21 Dec 2023 10:20:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGGAU-0002M8-53; Thu, 21 Dec 2023 10:20:42 +0000
Received: by outflank-mailman (input) for mailman id 658751;
 Thu, 21 Dec 2023 10:20:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vttA=IA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rGGAT-0002La-9t
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 10:20:41 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96cb9be8-9fea-11ee-98eb-6d05b1d4d9a1;
 Thu, 21 Dec 2023 11:20:39 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-32f8441dfb5so521068f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 02:20:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e25-20020adfa459000000b003365951cef9sm1697716wra.55.2023.12.21.02.20.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Dec 2023 02:20:39 -0800 (PST)
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
X-Inumbo-ID: 96cb9be8-9fea-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703154039; x=1703758839; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QkbK7rAhf24elMfHugp+uKo0w5y4uT5ZqG/DklLZh0E=;
        b=a7MLjDHH+GzpCTlT1n5wp/dSmBOhVXDiNPOuth9WFNasJJq7c+/qFLdcIYTY6MwuoP
         nZETKHZinch0AEWxGgS83emG9zH0fOeb5DNu2y6Mv+Kl8qcttP5vlu+ek5lxYtsqlIKw
         0iq7qRI7GggMqQRU8wS2oFPhyHgd+zuuujw0kFGn2fWzuJn1Q5yR/MulBarqUf7F7v+7
         UR0LorKjywApBbLVbE57vbl0I039p8aVvQjN/w0HwsZcoXZXJPSb2x2FmLgTfP07HEYe
         /5hSeZ6dfb/HmzC+xRawhyadMr7B6v0/1xT8JEgMm6mLX0JdZFkkts7HNLQ6q9PizTUi
         b1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703154039; x=1703758839;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QkbK7rAhf24elMfHugp+uKo0w5y4uT5ZqG/DklLZh0E=;
        b=ABIXqaoaUkIddgc4kPZGyQqUpMxHTq6YUsNx43OEOlyAi24ltE6Sy5g/9DnZjUz/8F
         wdFluEXmwdGqmXry0wi+JAKRRr9CeWKN0Tlk9pMsI4rSRabi4/m0DMVsxB34xkUorXlK
         b7zm0XTtB9QVKMqP1vprOvmIsms2DYoxKaN4kSSKjknK6ocT5WssDhymfHIJl03ayO0f
         rd0ZIDzenhQJwFf+d+EdRavevaPLylfHC+NjpQpCkeq1CtvfqcMs3A2eX7QJlFttE8lx
         cmwCwfJSISrvo7SvF5RlKvDxrTlhL3W2uPOvrZDVENoRxtvKFAnsWzFJDn6D9lvxgkSn
         XrDw==
X-Gm-Message-State: AOJu0Yy3Afq3PdvyxWRbuNPAYEetKnCSz5DYZz6ijNJdiBDfAqMzggnl
	TbqJ3B9JXttA2WnDot/jjamH
X-Google-Smtp-Source: AGHT+IEJ5HEs4ginJBrVKvWDTzWKjAVjE7azVL3J4x/4n1Ob+sU04qhDU04ibRTG5CQAXqmk7vgQEw==
X-Received: by 2002:adf:fc07:0:b0:336:5d1c:a9c8 with SMTP id i7-20020adffc07000000b003365d1ca9c8mr574190wrr.59.1703154039285;
        Thu, 21 Dec 2023 02:20:39 -0800 (PST)
Message-ID: <978e4603-f20b-481f-97bd-2a84de0800c8@suse.com>
Date: Thu, 21 Dec 2023 11:20:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/amd: extend CPU errata #1474 affected models
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20231221100831.25570-1-roger.pau@citrix.com>
 <213dc008-f8eb-4313-8b3e-17fc435416e1@citrix.com>
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
In-Reply-To: <213dc008-f8eb-4313-8b3e-17fc435416e1@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.12.2023 11:17, Andrew Cooper wrote:
> On 21/12/2023 10:08 am, Roger Pau Monne wrote:
>> Errata #1474has now been extended to cover models from family 17h ranges
> 
> Extra space needed.  Can be fixed on commit.

Also (not just here) - isn't it "erratum" when we talk of just one?

Jan

>> 00-2Fh, so the errata now covers all the models released under Family 17h (Zen,
>> Zen+ and Zen2).
>>
>> Additionally extend the workaround to Family 18h (Hygon), since it's based on
>> the Zen architecture and very likely affected.
>>
>> Rename all the zen2 related symbols to fam17, since the errata doesn't
>> exclusively affect Zen2 anymore.
>>
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> ~Andrew


