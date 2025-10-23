Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8928C011D6
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 14:26:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149065.1480829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBuOp-0002Uj-EU; Thu, 23 Oct 2025 12:26:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149065.1480829; Thu, 23 Oct 2025 12:26:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBuOp-0002St-B6; Thu, 23 Oct 2025 12:26:35 +0000
Received: by outflank-mailman (input) for mailman id 1149065;
 Thu, 23 Oct 2025 12:26:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U0PU=5A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBuOn-0002Sn-Hs
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 12:26:33 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8155947a-b00b-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 14:26:31 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3ee130237a8so466866f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 05:26:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429898adf99sm3911772f8f.28.2025.10.23.05.26.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 05:26:30 -0700 (PDT)
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
X-Inumbo-ID: 8155947a-b00b-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761222390; x=1761827190; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cncieIrzetjLr9FZj4bT30h3vkukjMlMQSI8yAmBUNQ=;
        b=ZYoutIhTxP8eGvMJtrq3aoKSS0qJmBnDF9G5+ZRA2oofuR4oZOKrdkyhfiD7d3t6Yu
         MGqtYjrDureWis5THy9qERNb86rqJMmWrNlV99rUNnmKdmZ6wbz+AxGBI3DJbe+xV/P4
         d/VndEofu7ZozmJIsLQ1s10ZFsHRgknp0Asx8TMgk+gl+JGzJ5zZH53w1BpDCHvla9qN
         yuHIRXW+IdeRHckW8TGOnzBJ40SIZowts6G5H8DFQI+OwbIhG1g4vcS+/C6i8s/HZksv
         cnhGcKbzTKH6o1H9aA8dKJMEbo0ny6lyqW15TN+SWSVn6EB77LhH+BAMsFdC5QwIyOKX
         kXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761222390; x=1761827190;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cncieIrzetjLr9FZj4bT30h3vkukjMlMQSI8yAmBUNQ=;
        b=ZfaG5VPIwjsX/vIiIZcARoc5Zuygy65yzm7y5DHndEHvx+b2v0QG6EqsO8eV4zHifh
         YWXEfdYWVWAieXBESVDvHcS8vvaQCMgpFeI8r20EMvmt5+/Twa0yDzu+ssUHcWwNsAA2
         i3GR4EAwe2CHQC7APFqEg00D4/7pL+c38J7G94FnSn+mTkbLz5gul9aBGtmekNmAq+dK
         6ygkMIntK9QoBrsSpvAv4FHaCt2KSTiIllIt/GpNv+hNXRQ93VIVcVVhnV3IGI0XdyYX
         pXQJG6vzwld0nWAXj+/QJ2CgH0n4b21V5DK/emhkaBeQfqKuiNUN/tFvmSTEj+laaQ1b
         0HHQ==
X-Gm-Message-State: AOJu0Yz57ySZ6tUQ4DOVf0zegmaY/s2e4QedF+EQt1V2EO7QemTVg/0O
	Wfeo3BXnfNKVq/3EhiFbrgGkzXdJfe3mNl3Bi51v7R5Q7F2Z0iTAQzBRRBs+yyKK6w==
X-Gm-Gg: ASbGnct9t7SvDYJvqc8nI705kQ4cGEvV6WPojg02WRI1Q035iGyIM0F/LzLocq738mP
	TCg6XvkSgdw7Napyoz//EFZciQBCrG42t3JOruIvVZMggGfSAOyGUSdE8v4gdeIGicvK3ujGtJC
	0qcbNPDuzb9IKYbOJog0qONJyjgSrZpA00tDMR6zElLRkFbxK5eZt4kUdWbQkgib8rXa2+fDFR9
	0ym5kb3EMAxEevtVis6mC+YtyrLBktxYGxtutvVuCkRqKUVyWRRlQXpQ0kfVqbs77asiZnrkzE2
	JZ3s1rgofPyd1x5kpuP9VcJfAVpOyB2gKJs1D8P4O8QKHTVQ7yQ2Oy0zHQ/pWUS54LVVpF77UuS
	EOtyMXloxtyqoxiUzS1mNIqTqT41zA/4pUe5IthexrBUOQkRVCTKzjC2bAkcx0YnfPYCwwTj33D
	aPffX6+qdVah9QAi+5AWyLvAzMAuiAUrM7DRngZloi7M5nxLHsC9Al4FBAGyLh
X-Google-Smtp-Source: AGHT+IG5IHiiZqR6m8po0YRrtbVayMF7mZTnv7qq9u4khwK4QW2GK49pZuWAHuOhz722NIlAwbUCjA==
X-Received: by 2002:a5d:5f56:0:b0:3ed:f690:a390 with SMTP id ffacd0b85a97d-42704defec8mr16649023f8f.40.1761222390441;
        Thu, 23 Oct 2025 05:26:30 -0700 (PDT)
Message-ID: <a7df46ee-3153-4538-ae1c-ea4812e375a1@suse.com>
Date: Thu, 23 Oct 2025 14:26:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] vtd: Collapse x86 subdirectory
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jason.andryuk@amd.com>
References: <cover.1761209564.git.teddy.astie@vates.tech>
 <3e9e5ea80bb534b69bd315099da6b5d049852823.1761209564.git.teddy.astie@vates.tech>
 <63e5addb-d109-4c57-a94f-88968c6d9382@suse.com>
 <53649137-a6bd-485b-9499-7fbf429714b2@vates.tech>
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
In-Reply-To: <53649137-a6bd-485b-9499-7fbf429714b2@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.10.2025 14:23, Teddy Astie wrote:
> Le 23/10/2025 à 12:20, Jan Beulich a écrit :
>> On 23.10.2025 11:12, Teddy Astie wrote:
>>> The x86 subdirectory was originally meant to split x86-specific logic from
>>> general VT-d code. Today, Xen only supports VT-d on x86 and the code actually
>>> implemented in this subdirectory isn't x86-specific (e.g ATS code is not x86
>>> specific).
>>>
>>> As ats.c is the only remaining file in this directory, and isn't x86 specific,
>>> move it up to vtd directory and remove the now empty x86 subdirectory.
>>>
>>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>>> ---
>>> v2:
>>>   - reviewed commit description
>>>
>>>   xen/drivers/passthrough/vtd/Makefile        |  3 +--
>>>   xen/drivers/passthrough/vtd/{x86 => }/ats.c | 10 +++++-----
>>>   xen/drivers/passthrough/vtd/x86/Makefile    |  1 -
>>>   3 files changed, 6 insertions(+), 8 deletions(-)
>>>   rename xen/drivers/passthrough/vtd/{x86 => }/ats.c (97%)
>>>   delete mode 100644 xen/drivers/passthrough/vtd/x86/Makefile
>>
>> I should have remembered this when looking at v1 already: While some of your
>> other changes go farther (and hence are likely preferable), this one I'd rather
>> not see go in. I'd favor respective pieces of what's still pending from
>> https://lists.xen.org/archives/html/xen-devel/2024-02/msg00983.html. First and
>> foremost because ATS really is not only not x86-specific - it's not VT-d-
>> specific either.
> 
> CC-ing Jason Andryuk now reviewer of AMD-Vi code and likely interested 
> with https://lists.xen.org/archives/html/xen-devel/2024-02/msg00983.html 
> at least for the AMD part.
> 
> I wasn't aware of this pending series. And some of my patches overlap 
> with some of these ones, so I guess we need to complete it and then I 
> rebase mine on top of it.

It's going to be an intermix, I think. Your map/unmap changes are preferable
to mine, for example.

Jan

