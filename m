Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C87804B4E
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 08:43:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647437.1010563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAQ5A-0002gE-7V; Tue, 05 Dec 2023 07:43:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647437.1010563; Tue, 05 Dec 2023 07:43:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAQ5A-0002dN-4U; Tue, 05 Dec 2023 07:43:04 +0000
Received: by outflank-mailman (input) for mailman id 647437;
 Tue, 05 Dec 2023 07:43:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kfJ1=HQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAQ58-0002dD-7H
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 07:43:02 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e983994c-9341-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 08:42:59 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40b397793aaso32649015e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 23:42:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c444b00b003fefaf299b6sm17683643wmn.38.2023.12.04.23.42.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Dec 2023 23:42:58 -0800 (PST)
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
X-Inumbo-ID: e983994c-9341-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701762179; x=1702366979; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D+t/k016g3pSBuQKs00qMwpTb2MZJX5koZcrx9Uib58=;
        b=eLPCDMS6+gtgwjy348Ni+qBMb3DnS5/jAQcBRqVEtIFzb3v1uvAMMXAIRXF6Q6uvtp
         LonAy2aga3A7Qcn+gnY9QnzSOVV8CNRB+KgZPMWwYHlVJgKvEfl0J6uwKSIcX+V4sOis
         Z3sUU9SFOKLU/q/CdUXc0FBe7hm+uTAgc+F2aYR4JpOHkq9BV1hNajylEnEY7kHUznjQ
         PSxSezptWWiO14jYuTbP1071uXklrWHP0c/Hs8jTFnRPhjZQBrEWwyGIgKMxb6/R5qp2
         07qQz9VuG3RqqqU4jCUmpV8PfxStgyZvaNTywhAbQt/KVNSSVbzOFHQlcWxULVStmkfd
         RAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701762179; x=1702366979;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D+t/k016g3pSBuQKs00qMwpTb2MZJX5koZcrx9Uib58=;
        b=n9E3j9Jv+Nn06RfzX3EfUui/ycT7Z2CqcqUvcuYeRUZf1Z9sc9m5xC3ADIPHoykjX8
         xNyZ8AUJVHhdvreeg4Kd7p/jXyzBHPD8/hadqsEnsu6D/CGgLIz/CXhWrTO3wNGX5EKC
         umcnMHR40RnPgGdu7qu5yNSjAhDGO1AcGx1hd7gVuTKG379Ogw7PHh77Qv0Fb771c/ap
         1oe0Ybq0nnqE80/OhH6ae82eQBt6cJ8z/wvnMjP53UMcgMb9XysbWiXVxhqaFdU049oB
         7P2yUqtr90TPNU7U5ruKpJ9YoVTr6CDJcLLWgr3wO/obL96Q0bnkaQFrtW06j6ouDU4c
         XRPA==
X-Gm-Message-State: AOJu0YwkFPBgVUwvpd7z4kWk7mLQ+68sO2mG7a4wc1PLylpYM0nrwAF2
	v1SA/tU83ltRHfu3nhM/+6cJ
X-Google-Smtp-Source: AGHT+IGfAzefKgv9PZBW6/Lfv2yfBDJ3ope/hExUGeTwmFa+3GtLu/9dYd6YinIS8HTyvtPD5knSPg==
X-Received: by 2002:a7b:cd09:0:b0:40b:5e56:7b41 with SMTP id f9-20020a7bcd09000000b0040b5e567b41mr241933wmj.138.1701762179146;
        Mon, 04 Dec 2023 23:42:59 -0800 (PST)
Message-ID: <4e9dce92-9cd4-4031-9440-40ac0a627413@suse.com>
Date: Tue, 5 Dec 2023 08:42:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 06/17] vpci/header: rework exit path in init_bars
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
 <20231202012556.2012281-7-volodymyr_babchuk@epam.com>
 <11ee03e0-9de9-4179-bb4e-4ea2510122ef@suse.com> <87lea9sc4u.fsf@epam.com>
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
In-Reply-To: <87lea9sc4u.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.12.2023 01:53, Volodymyr Babchuk wrote:
> Jan Beulich <jbeulich@suse.com> writes:
>> On 02.12.2023 02:27, Volodymyr Babchuk wrote:
>>> Introduce "fail" label in init_bars() function to have the centralized
>>> error return path. This is the pre-requirement for the future changes
>>> in this function.
>>>
>>> This patch does not introduce functional changes.
>>>
>>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
>>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Nit: Tags in chronological order please.
> 
> Just to be clarify, it should be
> 
> Suggested-by
> Signed-off-by
> Acked-by
> 
> Correct?

Yes.

Jan

