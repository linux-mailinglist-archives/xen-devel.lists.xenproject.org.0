Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BED71A9A109
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 08:11:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965813.1356225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7pnE-0002Iy-OT; Thu, 24 Apr 2025 06:10:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965813.1356225; Thu, 24 Apr 2025 06:10:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7pnE-0002GE-LH; Thu, 24 Apr 2025 06:10:40 +0000
Received: by outflank-mailman (input) for mailman id 965813;
 Thu, 24 Apr 2025 06:10:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7pnD-0002G8-Es
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 06:10:39 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d72d0822-20d2-11f0-9eb1-5ba50f476ded;
 Thu, 24 Apr 2025 08:10:37 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-39ee623fe64so533250f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 23:10:37 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b408:9d23:e5d:de25:e110?
 (p200300cab734b4089d230e5dde25e110.dip0.t-ipconnect.de.
 [2003:ca:b734:b408:9d23:e5d:de25:e110])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a06d54c105sm909209f8f.89.2025.04.23.23.10.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 23:10:36 -0700 (PDT)
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
X-Inumbo-ID: d72d0822-20d2-11f0-9eb1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745475037; x=1746079837; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eYzr4SI5PhZvTE6U2jT9PLNZHTiN0PWbevjfMFhOlgA=;
        b=LUbKbbwpU837XWuzDt22JZzoS9wG20bSGsIiCbp/taHDstxs3QKttmTqVk6Df5FFY8
         5HDJjHsla3lPWc8WLY79KpcbfQfA52Nd2EviYk3ZVQyrMgKewIBz9ConQMTtr8Y9YQgx
         PBzl3DO93OJIJh0if8MGE9jy2mS/KhFhqNJyLLxAfPk9i2QFU4I/nlFNcM/TD1oIhNZb
         0l2pSXWglDtz842Dn8qDcglb+K0QSVYTt8kmFNzDHAC8K9EsMl+/noqvImkoYdCmouEO
         RB8O3OgxpF7WCjNp08XGnbjd4Bdp+i7/OzZGM6NvzllI9lNGi1QoTjdRdMZVO53OWxo+
         2zLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475037; x=1746079837;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYzr4SI5PhZvTE6U2jT9PLNZHTiN0PWbevjfMFhOlgA=;
        b=mCdFG/j1MdWKqHVh/hiBfY14QNeBeOy6S+S+8kjNHOKtaSEBD+MK8MUCoGgMIs88OD
         VXxhI/zaXM/H38mRq4w2Euz9eLJ69WfsmsWqkatxrDDqi+HALk81y6rxnq+RNmt1jeT6
         Hdoa0jVyvMQYwI5Ml3z4BRb2cFs4C+SmWMFW2l/te/rdGokFK+oaI3hyjnUdHqvf98qJ
         oUjicGfU4i6S/YdY18RbHmiX2eoTpEBvPq0IBEVm0D6hPxbI0QspZH4cnNuiO0Oi52nc
         QPM34O50ejiO2kauyoyWqtLYGHVLqhtO7TC4kPCSBzjVb1ALrMq2KFaj31aQkHXjWSye
         4c6w==
X-Gm-Message-State: AOJu0Yw8EmYgumm815g/0uvHGe/f6vTzXxPN0EIsyMguk/AKziMRr1U6
	UWXJlSo90vojqRf17Aq2oI/pIjq6zr44mVDW12+QQf1ADK1VF8slm81Zn9QUxA==
X-Gm-Gg: ASbGnct8W4Ch+zYT8FDkPPjzh9zpjLcuDjU9ilRIJnxOGVpcLTlfqokBI9SFtUAk+gC
	tqAUBWFYaQrg7oUfKq7Pwsobl4WGx0xdfDANL/vXPLviaktlFwm3m04BCSDQEnzblIvl6OVzVqR
	5B+pQhQBsetGzRiLo8h7NsvW1X05qX+PInDUlONFpUBP3n0fvhp8GGOb/eZebTKSIb71v3XcUVu
	6Gqn3AqgntivMIIgZ+5NrKji4ytsZQ/Eqd5KxgZZgj9vR5f8RjUclG2g543ts2YfSkc8rbELLEN
	e3+RXoOjD8W+NFDEa9grlTpQ43lJM2Q3P5dQ68/PpVzspXAnIpu2vZoZttzAR1TATCrTBvA6fdh
	nfpEs1O/abQYHn1CM2/N/nXBElD1O8yWCTdm/UcaVN8oEP0vFJxP5kN1l2/ifmAbfTwsVjKmg
X-Google-Smtp-Source: AGHT+IEBqsTtw6lGozmGXu9bJmJjgSJJ71lQidPPBXbynYhRTCNxD7LnZanu5RHuQmtrQYexi/wIHQ==
X-Received: by 2002:a05:6000:40cd:b0:390:f9a5:bd79 with SMTP id ffacd0b85a97d-3a06cf5f3a2mr835540f8f.26.1745475036858;
        Wed, 23 Apr 2025 23:10:36 -0700 (PDT)
Message-ID: <c3531783-9d9f-4152-84a1-a87fddce4342@suse.com>
Date: Thu, 24 Apr 2025 08:10:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misra: add deviation of Rule 5.5
To: Stefano Stabellini <sstabellini@kernel.org>,
 "Lira, Victor M" <VictorM.Lira@amd.com>
Cc: xen-devel@lists.xenproject.org,
 Federico Serafini <federico.serafini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com>
 <48c7830931a98b2bf70ef1509f309b262b9e5792.1745427770.git.victorm.lira@amd.com>
 <d81178fe-82b8-434e-8610-e0ec71df6a28@amd.com>
 <alpine.DEB.2.22.394.2504231338140.785180@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2504231338140.785180@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.04.2025 22:41, Stefano Stabellini wrote:
> On Wed, 23 Apr 2025, Lira, Victor M wrote:
>> Continuing a discussion from before:
>>
>> On 4/22/2025 11:44 PM, Jan Beulich wrote:
>>> Caution: This message originated from an External Source. Use proper caution
>>> when opening attachments, clicking links, or responding.
>>>
>>>
>>> On 23.04.2025 01:43, victorm.lira@amd.com wrote:
>>>>          memmove.
>>>>        - Tagged as `deliberate` for ECLAIR.
>>>>
>>>> +   * - R5.5
>>>> +     - Clashes between function-like macros and function names are
>>>> +       deliberate
>>> They may or may not be deliberate, depending on context. I don't think it's
>>> a
>>> good move to deviate this more widely than necessary. If I get the
>>> expression
>>> above (in deviations.ecl) right, even
>>>
>>> void func1(int);
>>> void func2(int);
>>>
>>> #define func1() func2(0)
>>> #define func2() func1(0)
>>>
>>> would be deviated, which I don't think we want. Especially when, in a less
>>> contrived scenario, the clash may not easily be visible.
>>
>> OK, I see the issue for different functions. Does it make sense to say it's
>> deliberate when it's the same identifier?
>>
>> 	void func1(int);
>> 	...
>> 	#define func1() func1(0)
>>
>> Could this be deviated?
> 
> I think it makes sense to be clear in deviations.rst and the doc text in
> deviations.ecl that we are referring to the same identifier. That we can
> do.
> 
> I am not sure it is possible to change the ecl rule accordingly to
> narrow the check relaxation. If not possible, I'd keep it as it is in
> this patch.

Isn't it a matter of producing a suitable regex? If not, I don't think we
should put in too broad an Eclair rule, but then rather resort to e.g.
SAF comments.

Jan

