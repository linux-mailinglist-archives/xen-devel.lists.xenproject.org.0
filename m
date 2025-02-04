Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA39BA27296
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 14:20:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881451.1291593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfIqA-0000dT-Sb; Tue, 04 Feb 2025 13:19:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881451.1291593; Tue, 04 Feb 2025 13:19:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfIqA-0000b2-PS; Tue, 04 Feb 2025 13:19:46 +0000
Received: by outflank-mailman (input) for mailman id 881451;
 Tue, 04 Feb 2025 13:19:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yELw=U3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfIq9-0000aw-LC
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 13:19:45 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b30902d3-e2fa-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 14:19:44 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5dcca17340fso926749a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 05:19:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc724c93cesm9435742a12.75.2025.02.04.05.19.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 05:19:43 -0800 (PST)
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
X-Inumbo-ID: b30902d3-e2fa-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738675184; x=1739279984; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2E+0XRMgRTyxSOnHni78+rI09/Il8jsn/B88aVdhDyw=;
        b=JSY8YfGQO2xmadefHa5KdqfhL0aTRl4cDNUB9x+gH22EC07b1zqmJqj6Bkrqf/v/nG
         Q2d8TQJYUXhb87MTbgTT+lQtI61B67aaQ/xx2OWynxmaQieS6zOQSRf6JrqUlNVfPjus
         S0CBRPWsaxYQxTa4mb+JEtu8dDzt5ibwd1m9Buj4fgUNcJnSh8ALMSkD6T+03lK8q4Ew
         /3Y3GERHHQmW87AJCrZCdBUnAIndZTAEFksrl3x+ClfEyZTVTaECZvJMwZvGo5PjR9Mm
         ryyxl7rOZN0aiZXQuKbXmHfXku5T4uDIXYprBMc5SRYg5LvboIzrOtG7Zf6zANwjncF8
         k0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738675184; x=1739279984;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2E+0XRMgRTyxSOnHni78+rI09/Il8jsn/B88aVdhDyw=;
        b=ItbFOfr8ZDqWQjv000pLRk6xXFHZ27ULIN1uQvZB88wMt6mPldr+N/mL19PwwAe1i1
         EVZMepWIhJIXpBenPhsUb3BLWB9mQjPgElswevr1UgB0PWtq9YHwyt79JyftygNZJJ7l
         2bZy8IOmRSxG7c+kmYAqHoi4c0dM4qyBYqJXwu6SfBoJxVpx4eumQU5w1Uohf+ktLm8c
         KeekhyNqZVlTJQuVZvrvWZgr/neDYvqjDzQVX+2WyxYepNDLcyUjL6iiVWhwMVb05Cyl
         54RQ/9PROrmOTt2uJub6KfOs2/5uT6Y0yp/InzX1/KpRfkH3tkhWp6fh5jQWKvbjEFQL
         dmEw==
X-Forwarded-Encrypted: i=1; AJvYcCWh9J3/8DBBMgFaWctdCwbZCWPQPO5is5fmb0Jblm8vRC+hLucJLjTNHDAss2sv+LfUUHQrfO81ZXA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYV47NCwHycvjunUihBOkbGhHFTeuX6smPedqn6zrxWLA2oBUi
	LSkEa0LefXlAoFRecIIG/5231Mkxg64ZkqBAKg56UjCExE50iTM85mXJBtiF2A==
X-Gm-Gg: ASbGnct0Lodjrier3ifaPkki5f1gdkmbgwc+48TXZMI+3AlesAsdZc/u2TAfciMLuWh
	NAjQHBbFbbTTvLaG9d03GDciv/kX0XXt8SYe5n7iovOsh3zXZVSjFlHbzunsuj+1jDJVGiDShv5
	xMeFGRqdDkDvm3idLcUff9agPC5/J6Lx/eYhcPhoN4xq4FsbYIyAZuPnaRnAdp9wh48B7GdAsY7
	qTQtIhKHZ3AdZUNSP52sbLcj71rqGJ3GtpNMUa7+x66o/k27eolzoQJASmmsmjEhaufKf+lAiDf
	ded6oUaC5HHcyIyU4rgBkxwMu+aZ2tnyAHdiXBn6c/oLVnPoPGfE2cWJ37ElXvpoHpn5hNhidf6
	A
X-Google-Smtp-Source: AGHT+IGPgW/baxQnwaJPRFKPPrFJLUrItZw4xkmTKSEbdQdVA9w/VCAavrzXD1PUd2XG/h48KToHHw==
X-Received: by 2002:a05:6402:26c6:b0:5dc:c9ce:b01b with SMTP id 4fb4d7f45d1cf-5dcc9ceb110mr1792473a12.8.1738675184095;
        Tue, 04 Feb 2025 05:19:44 -0800 (PST)
Message-ID: <3be372f6-a102-419b-9022-750f0092f725@suse.com>
Date: Tue, 4 Feb 2025 14:19:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 for-4.20 2/4] radix-tree: introduce
 RADIX_TREE{,_INIT}()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0a006732-2b6e-46f0-a706-f432abd45d2c@suse.com>
 <e1114d64-61f9-47b9-a1ed-33b526d40089@suse.com>
 <8c0dc0bb-0fdc-425d-bbe6-796573bb7f61@citrix.com>
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
In-Reply-To: <8c0dc0bb-0fdc-425d-bbe6-796573bb7f61@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.02.2025 14:10, Andrew Cooper wrote:
> On 04/02/2025 1:03 pm, Jan Beulich wrote:
>> --- a/xen/include/xen/radix-tree.h
>> +++ b/xen/include/xen/radix-tree.h
>> @@ -72,6 +72,9 @@ struct radix_tree_root {
>>   *** radix-tree API starts here **
>>   */
>>  
>> +#define RADIX_TREE_INIT() {}
>> +#define RADIX_TREE(name) struct radix_tree_root name = RADIX_TREE_INIT()
> 
> We can still use this form in radix_tree_init(), can't we?

Only indirectly, and that's imo ugly:

void radix_tree_init(struct radix_tree_root *root)
{
	RADIX_TREE(init);

	*root = init;
}

RADIX_TREE_INIT() cannot (directly) be used because {} isn't an rvalue.

Jan

