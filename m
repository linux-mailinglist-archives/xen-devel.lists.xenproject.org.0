Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD9181B618
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 13:41:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658868.1028292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGIN4-0007rK-SK; Thu, 21 Dec 2023 12:41:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658868.1028292; Thu, 21 Dec 2023 12:41:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGIN4-0007oX-Pb; Thu, 21 Dec 2023 12:41:50 +0000
Received: by outflank-mailman (input) for mailman id 658868;
 Thu, 21 Dec 2023 12:41:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vttA=IA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rGIN3-0007mb-NZ
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 12:41:49 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ee5ba30-9ffe-11ee-98eb-6d05b1d4d9a1;
 Thu, 21 Dec 2023 13:41:49 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3365f1326e4so644490f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 04:41:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 c18-20020a5d4152000000b0033609b71825sm1956258wrq.35.2023.12.21.04.41.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Dec 2023 04:41:48 -0800 (PST)
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
X-Inumbo-ID: 4ee5ba30-9ffe-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703162508; x=1703767308; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FXA+kcgLAhRm1PSgpQRh2NMEj3762XXZm9bn8UOaIGg=;
        b=F3xmLoUh+DD4nqAckW3HXmvD2EEpAQYg+v+FPYvtRLROTOtVgA/rqn3lxd0L+Ba68G
         kNVsJ3cBHbabsZAD2HxRUobUfg6JsVKxBmarTXrKA1E9MeICUCg0sHCWDRAgWf7GKyde
         cLcTq7dKpbOxkMwo8uYeBPx3V0kilh50UIIe4qFZHdh+reBwf/3YFzH3+gR3cBRn1FM+
         bk1RWEaXaOedBqsg2koSQjRGr8s2v28sbkFpntTQCyfz78ynofmTF0A/Wh3T57vUy0Oy
         6z+SBnqbeh4l+nb2VTRZtbSHiyDZUKpTYJ97zvQMJeZ33PPTN0F1XkXnBFlNR1a+XIHY
         5vmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703162508; x=1703767308;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FXA+kcgLAhRm1PSgpQRh2NMEj3762XXZm9bn8UOaIGg=;
        b=acEhkymBr65yLy+UQEnj1WLEcPAOxHH8AFDke40z0TrFAHEIRQlOwGz8mqHcTEZjtT
         4DOT7341CL5L3jS/1qnjrksgv/TWoXSFqDMBXlyBmRYW2ReBmVxCfGsBT3jzJslEyNYQ
         aCzIzqibMjs402U812CACTtXFJqt6Lv/qlIVD3YYFYsm6G8K7n77GLOS/QAIuKZ90iKl
         HPlLoFrn/eBHzv+oJQakKsV/Y+Ar/7dVR3Mb3tD2R6RoMtjlYqfLZ69HFBDeKOdHHVss
         PqNUEKIfE48qgPJm0h8Xpjv4nAG1zFx7dK01BBals/fICNSyQ6EimVC0qrdsLnmXsHaH
         DAsQ==
X-Gm-Message-State: AOJu0YxIiJw0bhj3pX8xYDepSwLB7ofTqeps5whcxMsPYIZEtxmL5muI
	2AFRDjiqE5dyhWOD5ECoxGJZZe0/QmxTmQGJ5Dr1
X-Google-Smtp-Source: AGHT+IG/TgTa8FlpjrBAinzcs/pfzUPZpu2buE8xmRv/sip5Me/C2/fl4qXuPY9S618lLElCk8553Q==
X-Received: by 2002:adf:ce09:0:b0:333:12a3:644a with SMTP id p9-20020adfce09000000b0033312a3644amr699812wrn.18.1703162508525;
        Thu, 21 Dec 2023 04:41:48 -0800 (PST)
Message-ID: <1330c757-1ca3-4b07-898b-799cbfa67e8a@suse.com>
Date: Thu, 21 Dec 2023 13:41:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN RFC] x86/uaccess: remove __{put,get}_user_bad()
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 consulting@bugseng.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <9cf852da1c03b614bf5010132c58a18adc2a4161.1703155225.git.federico.serafini@bugseng.com>
 <a2050ac1-e205-4d7f-b9b1-aa625136e63a@suse.com>
 <0c5bbfde-4cf0-4878-b1ee-ccc8eb775464@citrix.com>
 <eb53449bd6595ea0931460e62dd57b9c@bugseng.com>
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
In-Reply-To: <eb53449bd6595ea0931460e62dd57b9c@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.12.2023 13:01, Nicola Vetrini wrote:
> Hi Andrew,
> 
> On 2023-12-21 12:03, Andrew Cooper wrote:
>> On 21/12/2023 10:58 am, Jan Beulich wrote:
>>> On 21.12.2023 11:53, Federico Serafini wrote:
>>>> Remove declarations of __put_user_bad() and __get_user_bad()
>>>> since they have no definition.
>>>> Replace their uses with a break statement to address violations of
>>>> MISRA C:2012 Rule 16.3 ("An unconditional `break' statement shall
>>>> terminate every switch-clause").
>>>> No functional change.
>>>>
>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>>> ---
>>>> Several violations of Rule 16.3 come from uses of macros
>>>> get_unsafe_size() and put_unsafe_size().
>>>> Looking at the macro definitions I found __get_user_bad() and 
>>>> __put_user_bad().
>>>> I was wondering if instead of just adding the break statement I can 
>>>> also remove
>>>> such functions which seem to not have a definition.
>>> No, you can't. Try introducing a caller which "accidentally" uses the
>>> wrong size. Without your change you'll observe the build failing (in
>>> a somewhat obscure way, but still), while with your change bad code
>>> will silently be generated.
>>
>> The construct here is deliberate.  It's a build time assertion that bad
>> sizes aren't used.
>>
>> __bitop_bad_size() and __xsm_action_mismatch_detected() are the same
>> pattern in other areas of code too, with the latter being more explicit
>> because of how it's wrapped by LINKER_BUG_ON().
>>
>>
>> It is slightly horrible, and not the most obvious construct for
>> newcomers.  If there's an alternative way to get a build assertion, we
>> could consider switching to a new pattern.
> 
> would you be in favour of a solution with a BUILD_BUG_ON in the default 
> branch followed by a break?
> 
> default:
>      BUILD_BUG_ON(!size || size >=8 || (size & (size - 1)));
>      break;

I don't think this would compile - BUILD_BUG_ON() wants a compile-time
constant passed.

Jan

