Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6302585B3C6
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 08:19:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683179.1062560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcKOu-0007pn-T4; Tue, 20 Feb 2024 07:18:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683179.1062560; Tue, 20 Feb 2024 07:18:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcKOu-0007mv-Ph; Tue, 20 Feb 2024 07:18:48 +0000
Received: by outflank-mailman (input) for mailman id 683179;
 Tue, 20 Feb 2024 07:18:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSgb=J5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rcKOt-0007mm-TS
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 07:18:47 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47237d12-cfc0-11ee-98f5-efadbce2ee36;
 Tue, 20 Feb 2024 08:18:43 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4127077ee20so382485e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 23:18:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b1-20020a05600c11c100b00410cc2f5550sm13295465wmi.19.2024.02.19.23.18.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 23:18:42 -0800 (PST)
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
X-Inumbo-ID: 47237d12-cfc0-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708413522; x=1709018322; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=30BNUS+5ObDbWYlvV4vCUl/bgFcqsUNuCVaytBgIjo0=;
        b=Sg8cZyChtDfkOolE7z4bXoyIEIyeWdgK/JOjJD+HWUe4sf9UPXflEKZ5zFGIQbAJnB
         Qo+klvh0SopaUiMjOw8TuUc3RmhHhtDP6hjrMs/41REko4oFORTkzHTLhD0rjMeHFDkf
         eUjA+z6VEJXI/wQ5XJEZLQqZsbEJco046ZujFWrgOqtoOwaw0rdppBMJDP37BI5EL80u
         n9sHhDvkdhRkRQpWIfnrM8BPUeyTu/ynyIclVjQ/4Kgnm2yzFk4JARDYQcL2SYu0d6mQ
         1R2e0VuAENlNiUEQmVbVrevZ8fSQrai8Sqc7oCvRBCqY33ILbL1MmTJM57BXvIX6SlF2
         N6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708413522; x=1709018322;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=30BNUS+5ObDbWYlvV4vCUl/bgFcqsUNuCVaytBgIjo0=;
        b=g2iIb6bnGgNviXEIX8Tt0arXyvF8SMCjRp0XLw8xO56z7b6XOw0fpdepEZKmGtBJgw
         +fkVWMfcu97gLLfy3JFaWDlLUUPeVebmdL1Ql9pl79H0H1MLn2I8DvEW1tZ9NhF+MSM5
         adCQXaNtdEO+1LdtTYnOiGKq/gdOxCE739PX+VK0tMOQshmC3hAYil77iKjdH3+hiLID
         V+ZTIFJwniS/ypR3odmHbJL5FcgZ5wzk9knmQse2NSI1anFejdjRWJLVXpZNFJZlLfPS
         NHsXh+izc8dyKc3M2l1hYYD5T8nZzAWYV6IziJYzNcDkUu5/v4KQZ+sL2UXD/tVimojq
         QRAg==
X-Forwarded-Encrypted: i=1; AJvYcCVoDyFP9oSNuGTAPIWjbOdpsgfWeU2Ma69ziUPwmzXvnfkRI2cd7cIO6R+E/61pX+YQnCtASmy/uEHUlkza5Vhn+QQDkxpQqxGlq5aw/Uw=
X-Gm-Message-State: AOJu0YxhieDZHzJm9Xz4ww1wbv7j59lNf/5pIchJ7FrTVKBvhBKDrg4r
	wDdHbYRaceAeKWT3TYhfrqbpvUus8k3hvQ6Ed/DTm+logkLhfNKF8izD9rh+2g==
X-Google-Smtp-Source: AGHT+IFy5rGYcDgjhWYry3W5VheY3OY35thZRmxgZXRXF3bcGp6xjW6Xg11JbBYcnSNh1BaJlM4CuA==
X-Received: by 2002:a05:600c:3545:b0:412:65e7:3639 with SMTP id i5-20020a05600c354500b0041265e73639mr3553337wmq.27.1708413522567;
        Mon, 19 Feb 2024 23:18:42 -0800 (PST)
Message-ID: <dda63b1e-648c-4f11-896c-0359b4099a56@suse.com>
Date: Tue, 20 Feb 2024 08:18:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 2/3] x86/uaccess: replace __{get,put}_user_bad()
 with STATIC_ASSERT_UNREACHABLE()
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1706259490.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2402061707520.1925432@ubuntu-linux-20-04-desktop>
 <22ee2311-1e6b-4f2e-86e4-12d20b5ba4a2@suse.com>
 <6451696b-0366-4069-b82b-094e63eced8d@bugseng.com>
 <0b0b5a50-7692-4500-baa4-68df8f1c5d7a@suse.com>
 <d7812cd9-7d06-493b-b8a8-d2353f148e8b@bugseng.com>
 <a5d9b91d-4e56-4512-9b15-d6868a383923@suse.com>
 <04a2c7b2-07e5-46fd-835e-42b3c6307547@bugseng.com>
 <a4c2f7c0-66bc-436f-bc99-8f8ba4ec822e@suse.com>
 <fffaa145-16ff-4969-bf4c-cfe0be98b66a@bugseng.com>
 <2117bb4e-94a3-4990-945b-6fb141ae1e63@suse.com>
 <3ed651c3-4ed3-4237-bf57-3a99a790df1a@bugseng.com>
 <3edafece-f15e-4a28-9f17-a4b08d3e0215@suse.com>
 <35249e32-9eb2-4c51-868d-de2cd2d8230b@bugseng.com>
 <45c19a87-5833-4350-a374-3a70fd3aa9ae@suse.com>
 <d735e980-c5a5-46b1-a511-cc2d666dac23@bugseng.com>
 <123c446c-e56f-457e-9cf4-58a43a3b069a@suse.com>
 <56b4a4bb-d3e8-4a21-8c0d-d4ee10c8f9b3@bugseng.com>
 <alpine.DEB.2.22.394.2402191243090.155645@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2402191243090.155645@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.02.2024 21:43, Stefano Stabellini wrote:
> On Mon, 19 Feb 2024, Federico Serafini wrote:
>> On 15/02/24 11:32, Jan Beulich wrote:
>>> The important difference is: Here we're told that there was a use of
>>> __put_user_bad, which is easy to grep for, and thus see how the
>>> supplied function / file / line(?) relate to the ultimate problem.
>>>
>>> I'm afraid I'm meanwhile confused enough by the various replies
>>> containing results of experimentation that I can't really tell
>>> anymore what case is best. Hence I can only restate my expectation for
>>> an eventual v3: Diagnosing what the issue is, no matter whether the new
>>> macro is used in another macro or in an inline function, should not
>>> become meaningfully more difficult. In how far this is the case wants
>>> clarifying in the description of the change.
>>
>> I think the best thing at the moment is to deviate
>> __{get,put}_user_bad() for Rule 16.3.
>> I'll let maintainers further explore the possibility of having a
>> compile-time assertion based on the assembler error.
> 
> OK. I hope Jan is OK to deviate by in-code comment.

Hmm, the follow-on suggestion was to add break statements? Followed
by me asking whether adding noreturn to the decls wouldn't also help.
(Then again I was under the impression that there was more than just
the "missing" break statements which Misra thought was an issue here.)

Jan

