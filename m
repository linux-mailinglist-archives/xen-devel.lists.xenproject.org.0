Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC388167E8
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 09:18:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655695.1023410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rF8pB-0003YZ-Vm; Mon, 18 Dec 2023 08:18:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655695.1023410; Mon, 18 Dec 2023 08:18:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rF8pB-0003We-TB; Mon, 18 Dec 2023 08:18:05 +0000
Received: by outflank-mailman (input) for mailman id 655695;
 Mon, 18 Dec 2023 08:18:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rF8p9-0003WY-V3
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 08:18:03 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f680f39b-9d7d-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 09:18:02 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40c824b199fso16830125e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 00:18:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l39-20020a05600c1d2700b0040c2c5f5844sm41142067wms.21.2023.12.18.00.18.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 00:18:02 -0800 (PST)
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
X-Inumbo-ID: f680f39b-9d7d-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702887482; x=1703492282; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9rpGK4FKMjSoKDVcFG2fZXFsDN1EVeVcSGyQ8JgVQYs=;
        b=XPwx1CouMzKGytDSiH8yCCkwzJO+Rx6tIj4G34UirKAW1ZokYns8ARn6ulSbu1Q+bK
         eUUzv4BlplYm3jMVZWPJzg2wDb9T/4jK9vQFVQS9X6Q1EzZvFFVHQqRlEdkVC5rtf7FK
         /JBnnh2S8dUTmMjSqVr4p2/EMeckjtJDSGlrw5LGLi8J805pFcqB+pyr3P0IX1SiBZch
         lajn3NgEMlS4nOq7XH7VC9G4RBVE92mcr+iL+eEQ/R0fdBkAXHJcchay3UtgXaas3BUR
         bz8E1JfaHdJd5Q2cEctBuBhsAQZworgafE0tcI/13acnnWAi1yt4IekFRJnwNMpygJXo
         H2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702887482; x=1703492282;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9rpGK4FKMjSoKDVcFG2fZXFsDN1EVeVcSGyQ8JgVQYs=;
        b=tP7rlOIZ74ynC39tjcBAAqDGM946Ti1C6rumFvSshTCb2I8b9GtXRu9+FoROQ2KXUy
         vKe+VW8mll3TFPQ/bGLZDpeENn6zf6CfmlFdwG8WyjuBbQrX3OwDdJCuiyu6RetD+rBE
         4u7jpofxyX1sGLtMj9eFo3M0sL+3ES1Sc/7qCyqvptf+nD3dbZMfoY1Tqjdx8P8v37QM
         hc7ubs+LtfUgqUEq1fX+fXYhesD5cTlVDxHu89/P4NT8BC93p0jz9BlfgH7rK2DT1prw
         nojd+UUczwqu2yCqndR8rNZeH/TnG69PvtuVo0VACF3zFCFPEzwLYacMymkxMShHqoiZ
         RcHg==
X-Gm-Message-State: AOJu0YwuAuURv1Kooe5nEKPZdIgtKky+puPp6iHgtUlFTQjFIbThh/fT
	7W+WE1DLmEnbYwUgElv/ETsF
X-Google-Smtp-Source: AGHT+IHqoN1AddQzOK1JbWHSC4RUr0EQBMogHPchpUB6RY56oCFDprGkuHSLM7hLAJ2m8JdFpiNOKQ==
X-Received: by 2002:a05:600c:458d:b0:40b:5e1c:af2a with SMTP id r13-20020a05600c458d00b0040b5e1caf2amr7804720wmo.48.1702887482413;
        Mon, 18 Dec 2023 00:18:02 -0800 (PST)
Message-ID: <a9db3cb0-f085-47c2-bcaa-aa4f7351d586@suse.com>
Date: Mon, 18 Dec 2023 09:18:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] xen: add SAF deviation for safe cast removal.
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Simone Ballarin <simone.ballarin@bugseng.com>,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1702555386.git.maria.celeste.cesario@bugseng.com>
 <36e996b864853dba26a9c9fb9c9c674e92cc935e.1702555387.git.maria.celeste.cesario@bugseng.com>
 <b93417c7-1375-4bf4-ace2-d36bd63c8b0b@suse.com>
 <alpine.DEB.2.22.394.2312141355391.3175268@ubuntu-linux-20-04-desktop>
 <698cb944-3e91-498c-99ba-ff0849723285@suse.com>
 <alpine.DEB.2.22.394.2312151127450.3175268@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2312151127450.3175268@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.12.2023 22:02, Stefano Stabellini wrote:
> On Fri, 15 Dec 2023, Jan Beulich wrote:
>> On 14.12.2023 23:04, Stefano Stabellini wrote:
>>> On Thu, 14 Dec 2023, Jan Beulich wrote:
>>>> On 14.12.2023 13:07, Simone Ballarin wrote:
>>>>> --- a/docs/misra/safe.json
>>>>> +++ b/docs/misra/safe.json
>>>>> @@ -28,6 +28,14 @@
>>>>>          },
>>>>>          {
>>>>>              "id": "SAF-3-safe",
>>>>> +            "analyser": {
>>>>> +                "eclair": "MC3R1.R11.8"
>>>>> +            },
>>>>> +            "name": "MC3R1.R11.8: removal of const qualifier to comply with function signature",
>>>>> +            "text": "It is safe to cast away const qualifiers to comply with function signature if the function does not modify the pointee."
>>>>
>>>> I'm not happy with this description, as it invites for all sorts of abuse.
>>>> Yet I'm also puzzled that ...
>>>
>>> We can improve the language but the concept would still be the same. For
>>> instance:
>>>
>>> A single function might or might not modify the pointee depending on
>>> other function parameters (for instance a single function that could
>>> either read or write depending on how it is called). It is safe to cast
>>> away const qualifiers when passing a parameter to a function of this
>>> type when the other parameters are triggering a read-only operation.
>>
>> Right, but I think the next here needs to be setting as tight boundaries
>> as possible: It should cover only this one specific pattern. Anything
>> else would better get its own deviation, imo.
> 
> OK. What about:
> 
> A single function might or might not modify the pointee depending on
> other function parameters, for instance a common pattern is to implement
> one function that could either read or write depending on how it is
> called. It is safe to cast away const qualifiers when passing a
> parameter to a function following this pattern when the other parameters
> are triggering a read-only operation.
> 
> Feel free to suggest a better wording.

Well, my point was to get rid of "for instance" and "common pattern" (and
anything alike). E.g.:

"A single function could either read or write through a passed in pointer,
 depending on how it is called. It is deemed safe to cast away a const
 qualifier when passing a pointer to such a function, when the other
 parameters guarantee read-only operation."

Jan

