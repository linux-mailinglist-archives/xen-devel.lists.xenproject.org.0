Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACBB84CC7A
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 15:17:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677677.1054425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXijJ-0000yc-Li; Wed, 07 Feb 2024 14:16:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677677.1054425; Wed, 07 Feb 2024 14:16:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXijJ-0000wE-Iz; Wed, 07 Feb 2024 14:16:49 +0000
Received: by outflank-mailman (input) for mailman id 677677;
 Wed, 07 Feb 2024 14:16:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXijI-0000w8-E5
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 14:16:48 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 868379c8-c5c3-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 15:16:46 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4101d096c92so2789795e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 06:16:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f18-20020a05600c4e9200b0040fe0bb761dsm5438894wmq.16.2024.02.07.06.16.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 06:16:45 -0800 (PST)
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
X-Inumbo-ID: 868379c8-c5c3-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707315406; x=1707920206; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u0h55+3hzBq5cmd5rCMnlrIJBOEVlByJPH9Vvdn2WXo=;
        b=cwqrd3VQQslY/HVCWyu8bRpQl6Pm0Ox9rmJWmP3ucFF0F0Y2ZVpIRw1GhN0U6I1T62
         K5AfhJAMPwaOMHGYqLctNVPTNQFoCq58aFmFpQTQNDnuWDFHjkUBJVX7O3nocLPDzmuW
         XXUkKF2s5x5Ed+/QDnfVMQ6+ffKqMUrAasM1CZiQig1AfnzP42pYbPKS2UwvwXwuv8/g
         GGbiuiwF0XoHwGV7SxbNz48zenyh1rLNUJiwlYyc1VVt2B1H6oUhPIgJ3xo6VyeQe3Sy
         awyQ9IKEwgjh0Zdyzi4zT9oIh0bpG2rdBaZgl3YGm0vkW08wrxpJIdbgzjayOxsKFHFG
         jdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707315406; x=1707920206;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0h55+3hzBq5cmd5rCMnlrIJBOEVlByJPH9Vvdn2WXo=;
        b=IoFTyjkoBfvrKLYtIm/6mniV5TgvikX+1Fnh9hHp0Je6NG+b35t9FQL7lWA/aNrQJY
         b073GyqGr6wmY1VUig6rWECThgqS64UHLt5aioihCPGan5HSbH9gW4LQNF+9DmyI3pH5
         Olg1nO7LGLdoRPlh9NQQBzKjo903eGvFQeK8B0avFkdnJbf0nExRMEM+0mmkdE52zyFE
         h5EyS8n6wowmOf+NED/URjBDpeisSMS0G7Z8IPae+xMuct7FIQr60vpXV66SilVyITO4
         QH8DlYVcsIJtfez1tSWGSfIGABAXcDxmVGLTe9t0BkROXeuzgiXFGT40Q701ar13TLKw
         qRpQ==
X-Gm-Message-State: AOJu0YxwJ6u+nA5c8+wvO6sJSmIIRQPI5KeACMNHryW6JvBmpKGMnH5d
	OjRcLaYdb45TqFYj6dGgCTF8BzMwTs/Hhz3yIfqbqXv5AjMsUaMJb2wY5D1Bqw==
X-Google-Smtp-Source: AGHT+IF4cyD38LO7MPpt/li4lyXfPo3ydSShEix60JMXhPLdd3TY+nJzPD0qInLdjjoh607ZeX6sFQ==
X-Received: by 2002:a05:600c:3595:b0:40f:d432:c4a0 with SMTP id p21-20020a05600c359500b0040fd432c4a0mr4832957wmq.27.1707315405641;
        Wed, 07 Feb 2024 06:16:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUxRKDFYEFxE8ZssylmnRrQe7NqJTu2T1ra3ELKnAtZn5F97JECWQHyH4DtaMPqmFGvuHtritR303BjHJ5VdghjiIcjP+9zrgGRQgDr/ri04rUarYDIiVWvXD5ymwavwfVp2C1lspQKTC4wr8SKXU/NIC6JXCMXkp4VlL8m8L5Y4+zhwl58RYQZYfRgL7HKWmIBR3K3kqI9cpPUsIvuC3R9BdsL
Message-ID: <0b0b5a50-7692-4500-baa4-68df8f1c5d7a@suse.com>
Date: Wed, 7 Feb 2024 15:16:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 2/3] x86/uaccess: replace __{get,put}_user_bad()
 with STATIC_ASSERT_UNREACHABLE()
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1706259490.git.federico.serafini@bugseng.com>
 <e28bb23a12fae3c8630f943b469137d367f20022.1706259490.git.federico.serafini@bugseng.com>
 <ec849d3a-4f6a-4afd-a7c4-418906eb909a@suse.com>
 <alpine.DEB.2.22.394.2402061707520.1925432@ubuntu-linux-20-04-desktop>
 <22ee2311-1e6b-4f2e-86e4-12d20b5ba4a2@suse.com>
 <6451696b-0366-4069-b82b-094e63eced8d@bugseng.com>
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
In-Reply-To: <6451696b-0366-4069-b82b-094e63eced8d@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.02.2024 14:51, Federico Serafini wrote:
> On 07/02/24 08:38, Jan Beulich wrote:
>> On 07.02.2024 02:08, Stefano Stabellini wrote:
>>> On Tue, 6 Feb 2024, Jan Beulich wrote:
>>>> On 26.01.2024 11:05, Federico Serafini wrote:
>>>>> @@ -208,7 +205,7 @@ do {                                                                       \
>>>>>       case 8:                                                                \
>>>>>           put_unsafe_asm(x, ptr, grd, retval, "q",  "", "ir", errret);       \
>>>>>           break;                                                             \
>>>>> -    default: __put_user_bad();                                             \
>>>>> +    default: STATIC_ASSERT_UNREACHABLE();                                  \
>>>>>       }                                                                      \
>>>>>       clac();                                                                \
>>>>>   } while ( false )
>>>>> @@ -227,7 +224,7 @@ do {                                                                       \
>>>>>       case 2: get_unsafe_asm(x, ptr, grd, retval, "w", "=r", errret); break; \
>>>>>       case 4: get_unsafe_asm(x, ptr, grd, retval, "k", "=r", errret); break; \
>>>>>       case 8: get_unsafe_asm(x, ptr, grd, retval,  "", "=r", errret); break; \
>>>>> -    default: __get_user_bad();                                             \
>>>>> +    default: STATIC_ASSERT_UNREACHABLE();                                  \
>>>>>       }                                                                      \
>>>>>       clac();                                                                \
>>>>>   } while ( false )
>>>>
>>>> Related to my remark on patch 1 - how is one to know the macro this was
>>>> invoked from, when seeing the resulting diagnostic?
>>>
>>> I am not sure what do you mean here... we do get an error like the
>>> following (I added a STATIC_ASSERT_UNREACHABLE for case 4):
>>>
>>> ./arch/x86/include/asm/uaccess.h:262: Error: static assertion failed: unreachable
>>
>> Right - and how do I know what _user_ of the macro actually triggered
>> it? ISTR suggesting to use one or more of __FILE__ / __LINE__ /
>> __FUNCTION__ here, for that specific purpose ...
> 
> To test the macro and its diagnostics,
> I modified the first "git grep" occurrence of ASSERT_UNREACHABLE()
> on the x86 code with STATIC_ASSERT_UNREACHABLE(),
> that is in file arch/x86/alternative.c, line 312,
> function _apply_alternatives().
> 
> What I got is the following build error:
> 
> ...
> arch/x86/alternative.c: Assembler messages:
> arch/x86/alternative.c:312: Error: static assertion failed: unreachable
>    CC      arch/x86/copy_page.o
> make[2]: *** [Rules.mk:247: arch/x86/alternative.o] Error 1

But that's not what my request was about. Here sufficient context is
given, even if it would be nice if the function was also visible right
away. But that's not the same as the case above, where the new macro
is used inside another macro.

> If I understood your requests correctly,
> the only thing missing is the function name but I didn't find a way
> to make __FUNCTION__ or __func__ work with the .error directive.
> Do you know any tricks to make it work?

I didn't think any tricks would be required:

asm ( ".error " __FILE__ ":" __LINE__ ": in function " __FUNCTION__ );

Yet it looks like I was under the wrong impression that __FUNCTION__
differed from __func__ and would be like __FILE__ / __LINE__. I have
to admit I have no good idea then how to achieve helpful diagnostics.

Jan

