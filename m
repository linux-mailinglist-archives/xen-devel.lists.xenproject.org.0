Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCE682EAE0
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 09:31:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667659.1039135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPeqI-0007Dn-KU; Tue, 16 Jan 2024 08:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667659.1039135; Tue, 16 Jan 2024 08:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPeqI-0007Br-Gu; Tue, 16 Jan 2024 08:30:42 +0000
Received: by outflank-mailman (input) for mailman id 667659;
 Tue, 16 Jan 2024 08:30:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MjSB=I2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPeqH-0007Bl-31
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 08:30:41 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86d7e1f2-b449-11ee-9b0f-b553b5be7939;
 Tue, 16 Jan 2024 09:30:38 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-336788cb261so7887139f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2024 00:30:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k6-20020adfb346000000b0033671314440sm14068395wrd.3.2024.01.16.00.30.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jan 2024 00:30:37 -0800 (PST)
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
X-Inumbo-ID: 86d7e1f2-b449-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705393838; x=1705998638; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RtFoBhIyYM1gd4kJx0zYuQLT/8IqznXLoG7zBOemV1c=;
        b=CykC6ZcEgGhujsRVFqa6EOC9ygeHJOKsS1iArRbySfpV3tkwRF/yVgEaMVzqWLw9d2
         FISg3KSJfUyE4edEb3TO5wcXDsknOpWMsI/B5aIowWPq8lzj4HOjTEBhQI1BVcjc56Hh
         FXFuz68kXvqTgOpw1OkilgQvnifQJQRW+rQhYxh8b9ZVoD6BAgE6xGtrBebnXudXFFii
         Y8Gm/KCDVrendZwlbc0z5Uja+IRlXNHpXBplGW6/DTC2v9ivQYLRLYra9IPdXWinVJT1
         QXIL9H5PYmz2TrjHJkoPInEihYUOPeLxhXgUN6TnWmbDbSqrq5peUY+hwzy0jubQEwrp
         OuYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705393838; x=1705998638;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RtFoBhIyYM1gd4kJx0zYuQLT/8IqznXLoG7zBOemV1c=;
        b=hQagTPRK9K1+cM0EdP/kRuI8MMqY9Tv+t+5ip8/NQ3mq5t2N0tNL+KIauuyaPNPXx8
         E2ufY2jbGqV7HTHktWX/8sAO/rDWFPbvMB0jCWtR3jMvuslTN/qCykbJuxJsYlEvTtOB
         Mq/Tdj4pQO1U0Haj2sxtCcTI9hks2bOgVLO4TFXz4kWYZk4C/oyImWpXbr68mj5abUSv
         VjeSrPL3i2WSaWiKuMfCy/r7lWalStubaI8rRnenzd5id1mentDWL6MmmUatwTTAyb/R
         tLjzJhWk23fU8wY7J9Y76EHkE+zgPa8VCoz2IZ+8SiCke8vRd7Zdj2lBG56Uq5vqsfpj
         2EuA==
X-Gm-Message-State: AOJu0Yw31p84UmD5FGVRZ7o4tYj0QkG9Ig1tA0nK9PMZ36luiRtS+ZE9
	Vo2Zy43h2UOb90f6xLJabsp1XnG18hrZ
X-Google-Smtp-Source: AGHT+IESh+7+KZF5W4ImTgiOOQVgZvZbJl0AZl1RChva1WfIqjtsEISFArpm7M4TVk4CBvN+tWp2Aw==
X-Received: by 2002:a5d:608b:0:b0:337:3ed6:869d with SMTP id w11-20020a5d608b000000b003373ed6869dmr3347712wrt.93.1705393837971;
        Tue, 16 Jan 2024 00:30:37 -0800 (PST)
Message-ID: <a70b5e14-1158-4366-a65d-9f6f56d82e7a@suse.com>
Date: Tue, 16 Jan 2024 09:30:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/22] x86: add a boot option to enable and disable the
 direct map
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-12-julien@xen.org>
 <fc70f967-34bb-9569-f514-7a3208e746c6@suse.com>
 <bc989828-69b9-4919-9ff3-fdd53fb2def1@amazon.com>
 <c736e4d9-5262-4adf-9e74-9b1be5ab13db@suse.com>
 <4ab710c3-c628-4bbe-9533-88af75a9b9ec@xen.org>
 <ba63d435-e26f-4c76-aedc-c027e8b03a6d@suse.com>
 <0dcc54dd-b729-4e20-95af-fa4907a550c6@amazon.com>
 <6926f363-3994-4059-b7e1-cb8e45367be8@suse.com>
 <fcfb79c5-0509-4ed3-be58-bd3d0935a21e@amazon.com>
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
In-Reply-To: <fcfb79c5-0509-4ed3-be58-bd3d0935a21e@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.01.2024 15:50, Elias El Yandouzi wrote:
> On 12/01/2024 07:47, Jan Beulich wrote:
>> On 11.01.2024 19:25, Elias El Yandouzi wrote:
>>> How would you proceed? Calling vmap() seems to be a bit overkill for
>>> just a temporary mapping and I don't really want to rework this function
>>> to use map_domain_page().
>>>
>>> In such case, how would you proceed? What do you suggest?
>>
>> fixmap may be an option to consider, but I also don't see why you
>> apparently think using vmap() would be a possibility while at the
>> same time making use of map_domain_page() is too much effort.
> 
> I thought about using vmap() as it allows to map a contiguous region 
> easily. It is also used in the follow-up patch 17/22, so I thought it 
> could be viable.
> 
> I was reluctant to use map_domain_page() for two reasons. 1) it only 
> allows to map one page at the time, so I'd need to rework more deeply 
> the function dmi_iterate() 2) because the mapcache wouldn't be ready to 
> use at that time, the mapping would end up in PMAP which is meant to map 
> the page tables, nothing else.

Oh, right, this makes sense of course.

Jan

