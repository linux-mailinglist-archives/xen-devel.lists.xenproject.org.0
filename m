Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DF38A84B0
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 15:31:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707521.1105518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx5Nk-0006hN-OQ; Wed, 17 Apr 2024 13:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707521.1105518; Wed, 17 Apr 2024 13:31:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx5Nk-0006fJ-Kl; Wed, 17 Apr 2024 13:31:24 +0000
Received: by outflank-mailman (input) for mailman id 707521;
 Wed, 17 Apr 2024 13:31:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rx5Ni-0006f3-Pk
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 13:31:22 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7a8043a-fcbe-11ee-b909-491648fe20b8;
 Wed, 17 Apr 2024 15:31:22 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-418c979dca2so2885945e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 06:31:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t7-20020adfe447000000b00343eac2acc4sm17604985wrm.111.2024.04.17.06.31.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Apr 2024 06:31:21 -0700 (PDT)
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
X-Inumbo-ID: c7a8043a-fcbe-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713360681; x=1713965481; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DWreDTf0xdSGqXTwEp122Iabm0W1giroMInLVGdk/e0=;
        b=PEHBj0SNL1eSFjcTXvMBhg70+LKQaIiH0Rte5lp/o8yvcGXuaEKK4TbE//D1WRpcAR
         ShVoa4m8eizHiHd/9z9Ug+z5WmAQRoU6y0mZfGIydXJismYA6S62IBZ2Yni9+9EIZzyy
         WZDycIehV9Lx0VmnwtxjMR9TLpvCnj4lcZj0XJGf8KVOm4T3hADUm5R70BG+j0ZOFcqC
         K2+kPXtuz9BBYmNgLhowVQguT7+uj8YHubY7Iu5/q313U6vXuyUEyfCspwr3lKA9DcHM
         Wp+vnFuTtwOA3LWt7zWdnYVIjacAQNQ5YNaPikTwcZuHezeeIu17Afn2uGLrkpypIehg
         tNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713360681; x=1713965481;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DWreDTf0xdSGqXTwEp122Iabm0W1giroMInLVGdk/e0=;
        b=aX0REByU8W0HpjtpiPebnPLnFE2oMmHp/n7ETNJ7ovlgYzD7OgEDxELx+tNNNoWKwF
         pq8lcNPZlZk7M71K9Of0EPgZkI14pB+XiDgSeKuKjHF/7IHPhB1k/KnSmiEJRYoGAWIY
         +Y2u6lefdeOBQiijs0JySsw7XR/KUgm9pQou+qNIzecMYgrZUaCBviXlO6e1OWtwgyzA
         t2oJ4UmdSNts9XNvtN1WLcCyT8BgMP17eyFQ9PJQOtIutbyh6OLSGiaTnpYOPBE+WsjM
         yhA79sSokSOAuUWnU+rmwQOgiIssRas4OfFZd/VpNYdU1hSs7VWaSU9vQRaUkjqav5jr
         NGhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFFkP08+0x1cVRlFWbG/qfSb+wcy/bXiueF0WtSU+cUagGDA2rxzJAQDZFPOerHkaAneSK7R71g9AhSixSgrvVTeSw8PZuP3S/cq40rfU=
X-Gm-Message-State: AOJu0YzLaSh+QcnbjmtZf0mYZoPObmaWtdaiNvR+dfBe9tLd154Vwn54
	rZ/8mNtOMqJOi+9/srdIdVjouQ7sQ9EzUPkYIMuwkxLC10FBPaL34qZMp/VOvg==
X-Google-Smtp-Source: AGHT+IHMIzkTz96PTTrmQH9bYPobLBWHLcce1ghoM0y7xFh3ut2y834OytfkVJWQiSFBAW59EoXl3g==
X-Received: by 2002:a05:6000:c44:b0:33e:363b:a7dd with SMTP id do4-20020a0560000c4400b0033e363ba7ddmr12343321wrb.20.1713360681436;
        Wed, 17 Apr 2024 06:31:21 -0700 (PDT)
Message-ID: <dbbba5d0-e74f-42e7-876f-b4128e7b5c97@suse.com>
Date: Wed, 17 Apr 2024 15:31:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/9] x86/vlapic: tidy switch statement and address
 MISRA violation
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1712305581.git.nicola.vetrini@bugseng.com>
 <81ecc35d04456771b1e48cb25155b0151e2225b8.1712305581.git.nicola.vetrini@bugseng.com>
 <36e84201-b31f-4204-8cff-ed50a01a47ed@suse.com>
 <e847ee06b76b816a62a555dfa6d52a4a@bugseng.com>
 <dd6ad7c5-bf99-42d4-9082-9ff87185705c@citrix.com>
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
In-Reply-To: <dd6ad7c5-bf99-42d4-9082-9ff87185705c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.04.2024 14:03, Andrew Cooper wrote:
> On 09/04/2024 8:45 pm, Nicola Vetrini wrote:
>> On 2024-04-08 09:32, Jan Beulich wrote:
>>> On 05.04.2024 11:14, Nicola Vetrini wrote:
>>>> Remove unneded blank lines between switch clauses.
>>>
>>> "Unneeded" based on what? We're carefully trying to improve
>>> readability of
>>> large switch() statements by adding such blank lines (at least)
>>> between non-
>>> fall-through case blocks, and you go and remove them?
>>>
>>> Jan
>>
>> I wrote that based on this earlier suggestion [1]. If I misunderstood
>> the suggestion, then I apologize and feel free to strip them if you want.
>>
>> [1]
>> https://lore.kernel.org/xen-devel/e40579ba-acae-4c11-bea1-a5b83208db10@suse.com/
> 
> I'm afraid I also can't figure out what that suggestion was supposed to
> be,

The main point of missing clarity there is that we still need to settle on
whether blank lines should also be between blocks where the earlier falls
through to the latter. Iirc you'd like to have blank lines in such cases
nevertheless, while I'd prefer to make the falling-through visually easy
to recognize by not putting blanks lines between the "fallthrough;" /
fall-through comment and the successive "case ...":.

Jan

> but we definitely do want to keep blank lines.  They're specifically
> for improved legibility.



