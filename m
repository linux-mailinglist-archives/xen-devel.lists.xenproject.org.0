Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1FD8C60BC
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 08:24:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721918.1125609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s783v-0007JS-Sk; Wed, 15 May 2024 06:24:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721918.1125609; Wed, 15 May 2024 06:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s783v-0007Hb-Pk; Wed, 15 May 2024 06:24:27 +0000
Received: by outflank-mailman (input) for mailman id 721918;
 Wed, 15 May 2024 06:24:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EWeN=MS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s783u-0007HT-3i
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 06:24:26 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c53ee473-1283-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 08:24:23 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a5a5cce2ce6so100670366b.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 23:24:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1781d1fcsm806891466b.35.2024.05.14.23.24.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 23:24:22 -0700 (PDT)
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
X-Inumbo-ID: c53ee473-1283-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715754263; x=1716359063; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aPkD0J+zCGO8fA4AkyUm6JIhM5BJ112JzDVD+5OrljA=;
        b=FTZBusEcqOLQAyoBnQnGPS7E2KQxYnP9k8EQJkI0kmidYgACnLQxbWEamg6lTA581o
         q/AnY+7nlQqQxw9H7yu/vmqD/7nJEGV5Y+/oGynLJRUp+xiCuTKCanwKs0tGE6yXmnnT
         6XZdkYxnYQT0FgD4h6cXl3GC16gymjZir4ctXrUPmWdlv05/mc7+VubXHkpmnGK/ZMK5
         wxAUShgvJ2qLLcafxqjNU0rRCIuDJE/OXm/2dXhAOdOaKkGKh2G2P2DcmrWHmk6/RG3W
         RDlBclKUU0b/IzlEPgy7e5EJqEj2ZK8CG6K7m9y14SYt0tr92Auu5HhfW+/RR5+67IcP
         8m3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715754263; x=1716359063;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aPkD0J+zCGO8fA4AkyUm6JIhM5BJ112JzDVD+5OrljA=;
        b=P5KWhYkD0Ok9IzK3qMNzB/w56JB0lWWOTTWgddaVzXEqr3FSiZh5zK5QZiKT64A6Nf
         rS2gTfNSaRbv9EepPzJujjAE/wj+OgBpGSYpvuu3FcLZlDhMeHj6bv2/TrcZzDiZm0LV
         lH3gwAFrGAGsqBOdNi7lyFULECKmfmMQO8L20KR+ndgwaSGRbKFm8On+YiKwonE9DHRc
         s5hk2p2YD235DI1StN81sUCn6vETex1XSQshFr5hC4ai5SWeFrw+QGnIqPDy8r4PugVK
         Wk79fqgOShwsqAJ7Hm1fccd7gQ0S6khid1iKy5uyOC1H0+BLj1fYBB1J9w144MOGv9V+
         xXWg==
X-Forwarded-Encrypted: i=1; AJvYcCWdV+iBkN4ezICJWsNm1oPXVbqjQiNe4laojErA5VZehoKDnYAZWhfbzJzfmMI40o/+NmYERHHQNjZM4V7cZibRxXrvBD2AapriALl4f1c=
X-Gm-Message-State: AOJu0YyyxIBOmZIDveLcEwhNTx47zHIy+qM6T3lm8SG1IDbpMSsh6kAf
	G0wCsapcSXvovStUg9B1OJNimHjR/BgSlhRZWNB+aPcsS3uy2Q9XHlVyGqUFuw==
X-Google-Smtp-Source: AGHT+IG0NqCFvafMi9ru/mwYoYrUvvFeEPP2+gEKS8HlPdFsqS7tZ9t5q/yNuc+X/o/9qZ9lTtIsag==
X-Received: by 2002:a17:906:ad97:b0:a59:c833:d275 with SMTP id a640c23a62f3a-a5a2d58a4e7mr937037366b.30.1715754262952;
        Tue, 14 May 2024 23:24:22 -0700 (PDT)
Message-ID: <a3fa7be4-48ce-4b68-a8f7-f94df58d97de@suse.com>
Date: Wed, 15 May 2024 08:24:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/strtoul: fix MISRA R10.2 violation
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org, nicola.vetrini@bugseng.com,
 consulting@bugseng.com
References: <alpine.DEB.2.22.394.2405131729180.2544314@ubuntu-linux-20-04-desktop>
 <16990192-aceb-408f-9247-45f3b1f58e0a@suse.com>
 <alpine.DEB.2.22.394.2405141540140.2544314@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2405141540140.2544314@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.05.2024 00:52, Stefano Stabellini wrote:
> On Tue, 14 May 2024, Jan Beulich wrote:
>> On 14.05.2024 02:32, Stefano Stabellini wrote:
>>> Fix last violation of R10.2 by casting the result of toupper to plain
>>> char. Note that we don't want to change toupper itself as it is a legacy
>>> interface and it would cause more issues.
>>
>> Can you point me at a single example where a new issue would arise? All
>> places I've spotted (including tolower() uses) would appear to benefit
>> from changing toupper() / tolower() themselves. Further, since they are
>> both wrapper macros only anyway, if any concern remained, fiddling with
>> the wrapper macros while leaving alone the underlying inline functions
>> would allow any such use site to simply be switched to using the inline
>> functions directly. As said, from looking at it I don't expect that
>> would be necessary, so instead I'd rather hope that eventually we can
>> do away with the wrapper macros, renaming the inline functions
>> accordingly.
> 
> If we change __toupper to return a plain char, then there are a few
> other things we need to change for consistency, see below. To be honest
> I thought it would cause more problems. I am OK to go with that if you
> all agree. (Nicola please have a look in case this introduces more
> issues elsewhere.)
> 
> 
> diff --git a/xen/include/xen/ctype.h b/xen/include/xen/ctype.h
> index 6dec944a37..6a6854e01c 100644
> --- a/xen/include/xen/ctype.h
> +++ b/xen/include/xen/ctype.h
> @@ -15,9 +15,9 @@
>  #define _X	0x40	/* hex digit */
>  #define _SP	0x80	/* hard space (0x20) */
>  
> -extern const unsigned char _ctype[];
> +extern const char _ctype[];

Why would this be needed? I can't see a connection to toupper() / tolower().

> -#define __ismask(x) (_ctype[(int)(unsigned char)(x)])
> +#define __ismask(x) (_ctype[(int)(char)(x)])

This almost certainly is wrong. Whether plain char is signed or unsigned is
left to the compiler, and it being signed would result in possibly negative
array indexes. Again I can't see a connection to the issue at hand.

> @@ -34,14 +34,14 @@ extern const unsigned char _ctype[];
>  #define isascii(c) (((unsigned char)(c))<=0x7f)
>  #define toascii(c) (((unsigned char)(c))&0x7f)
>  
> -static inline unsigned char __tolower(unsigned char c)
> +static inline char __tolower(char c)
>  {
>  	if (isupper(c))
>  		c -= 'A'-'a';
>  	return c;
>  }
>  
> -static inline unsigned char __toupper(unsigned char c)
> +static inline char __toupper(char c)
>  {
>  	if (islower(c))
>  		c -= 'a'-'A';

This isn't what I had suggested. First I said to leave alone the double-
underscore prefixed functions, and only touch the wrapper macros (as a
precaution in case any use site exists which relies on present behavior).
And then I didn't suggest to alter parameter types; only the return type
would need adjustment, I think, for what you're aiming at:

#define tolower(c) ((char)__tolower(c))
#define toupper(c) ((char)__toupper(c))

Jan

