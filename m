Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9722280E595
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 09:12:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652696.1018715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCxs0-0008EP-1x; Tue, 12 Dec 2023 08:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652696.1018715; Tue, 12 Dec 2023 08:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCxrz-0008Cm-VS; Tue, 12 Dec 2023 08:11:59 +0000
Received: by outflank-mailman (input) for mailman id 652696;
 Tue, 12 Dec 2023 08:11:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A/PU=HX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rCxry-0008Cg-EY
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 08:11:58 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d7aca0f-98c6-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 09:11:56 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40c2c65e6aaso54957615e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 00:11:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t11-20020a05600c450b00b0040c495b1c90sm5211289wmo.11.2023.12.12.00.11.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Dec 2023 00:11:54 -0800 (PST)
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
X-Inumbo-ID: 1d7aca0f-98c6-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702368716; x=1702973516; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nUMzQdFlab6jT4sjQ9zoV8iRr7QqwOZwgU4qiSRltRw=;
        b=P8bcbUTme1p4M7PHw7e7+0sOjCBJ8oViO/h4GCwYqHvclVFE3mH8xZOkk04RoO9/Wo
         X9muoFvS5Ein53dOEXfkizQ4G2+KQbwvsDvZyEoM9cweHZqGNlntRykGdCU6dDthy6cO
         7hOuds0zeDLV/qnNIv4tCuAqznP2biKVSsFoFak6KfeV+BTNvfDvDUK5Pcf6YdNbEmTq
         /hbwtnzVtDAcMCeahw2So3w70t381pwGvgiQIH+xXujlmlghq/234fvwH9oMqJEqorM6
         kqhAvuUBsCytwyOgvrmMBwQw3nJ5W58DqzH4BGz9SDNCvAPa9Sd7uvbc3RwTwE9x2J9Y
         JP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702368716; x=1702973516;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nUMzQdFlab6jT4sjQ9zoV8iRr7QqwOZwgU4qiSRltRw=;
        b=mBUzVK2bnZtb/mWpt0jIsng8Uqt3uUrVi7TDSjgHyS0/vMkNbWG6HasaYs+k5/082w
         2C3tzkb3HK30Eqy70HZn/4KfuvAxWOExRZURFB3vJsgJhrcs86F6QT5DplUa5E+djh39
         zYyzrd3bVNpJvTA/l26d1A/zfakjjIch8HX8gM0yP3ZZqGvjavI7fPj/yZtsVxHyL/H7
         594635sPY8vmC8h5qnTUc0SPnpzVMZdEF5eg4TQfT+HMI6Udf6jaLNmmZHs6HU+nY1fR
         swL/B94PP616c649YFjU3hOb7aSVJoaGtjVKmt/ugDtCtRFBcOMg7GYsugxqU8KZezBw
         NNlA==
X-Gm-Message-State: AOJu0Yxd61K+xM9otejzUMGoHmfVVgptiQevWJWTgt0IizVL9Hg1EoN3
	IJwRAzJDJiCkd6CdBAZW4W3X
X-Google-Smtp-Source: AGHT+IFuOyJl7raMUETt+aF5CUOfrp+mNDe0FJnr45/1CITADHpXXyRUbf/HcXTWQwTC8RQIaKc24g==
X-Received: by 2002:a05:600c:2146:b0:40c:2b26:970f with SMTP id v6-20020a05600c214600b0040c2b26970fmr2835412wml.198.1702368715722;
        Tue, 12 Dec 2023 00:11:55 -0800 (PST)
Message-ID: <653443ab-eaa5-413e-b3eb-50740af8fc47@suse.com>
Date: Tue, 12 Dec 2023 09:11:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] xen: ifdef inclusion of <asm/grant_table.h> in
 <xen/grant_table.h>
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1701453087.git.oleksii.kurochko@gmail.com>
 <cdc20255540a66ba0b6946ac6d48c11029cd3385.1701453087.git.oleksii.kurochko@gmail.com>
 <050a57f5-7c04-4b4a-848d-fd2f0993a9a7@suse.com>
 <74222b30ec0ab589b18f97032bc8074023c89e2b.camel@gmail.com>
 <18660670-fd9d-4269-b00a-dd4258339a43@suse.com>
 <5af2573e588f76b8df3423fd13a1b4275cc18f33.camel@gmail.com>
 <abb8c26b-4c8c-4fcf-a8c8-4a15a5067fa0@suse.com>
 <a53707edfac7d8d959cfc858953a1d64c3149596.camel@gmail.com>
 <ed29735f-2d2e-4b29-b5d1-efa78480acd6@suse.com>
 <bad7c686af22aef9124891f5610976687452e784.camel@gmail.com>
 <6592eb30-a8eb-423b-81ae-89acccc4e751@suse.com>
 <54f05f88178a152b4f3b4ecb52933bc75d3a37a4.camel@gmail.com>
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
In-Reply-To: <54f05f88178a152b4f3b4ecb52933bc75d3a37a4.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.12.2023 20:40, Oleksii wrote:
> On Mon, 2023-12-11 at 18:49 +0100, Jan Beulich wrote:
>> On 11.12.2023 18:37, Oleksii wrote:
>>> On Mon, 2023-12-11 at 17:02 +0100, Jan Beulich wrote:
>>>>  In which case the approach taken here may be fine, but
>>>> it still wouldn't be what I suggested. It may then be Stefano or
>>>> Andrew
>>>> who you could consider for such a tag.
>>> I'm a bit confused again. In this case, it seems that both you
>>> andStefano or Andrew should be on the suggested list.
>>> You proposed the approach with "#ifdef CONFIG_GRANT_TABLE #include
>>> <asm/grant_table.h> #endif".
>>
>> But you're not meaning to use that approach anymore, are you?
> No, I am going to use it because there is still a need to use #ifdef
> for #include <asm/grant_table.h> in <xen/grant_table.h> to avoid
> providing a useless empty asm/grant_table.h header if
> CONFIG_GRANT_TABLE isn't supported.

Then _there_ keeping the tag is okay of course. But the CI change (or
whatever is come of it) will need treating in whichever way it is going
to move.

Jan

