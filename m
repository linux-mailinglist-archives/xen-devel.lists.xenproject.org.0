Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A08D09BC0
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 13:35:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198699.1515547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veBhZ-0007rj-EZ; Fri, 09 Jan 2026 12:34:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198699.1515547; Fri, 09 Jan 2026 12:34:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veBhZ-0007qH-Ax; Fri, 09 Jan 2026 12:34:49 +0000
Received: by outflank-mailman (input) for mailman id 1198699;
 Fri, 09 Jan 2026 12:34:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1veBhY-0007qB-3a
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 12:34:48 +0000
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [2a00:1450:4864:20::343])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 947b377b-ed57-11f0-9ccf-f158ae23cfc8;
 Fri, 09 Jan 2026 13:34:45 +0100 (CET)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-4775ae5684fso20075685e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 Jan 2026 04:34:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5fe67csm22080685f8f.40.2026.01.09.04.34.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 04:34:44 -0800 (PST)
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
X-Inumbo-ID: 947b377b-ed57-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767962085; x=1768566885; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D56jBZpJ8Xmrnu3z5qry1jMmpBw7OSTn5y05yZSJKwc=;
        b=ZzcFavtJJwI+y7Qtno5vDirP0e5Eo4XWSHmwR2IJlCPDNFwue5RZ6FMKkRGm7pmJM8
         4lHh6SgIpyvdP1oNZKMQkZqSPWjsX4ZAsVagdszmWhTqNMcgvXaEL9GO3yEvRhOBIf5+
         jhgiH6oknmAWfgkorBT18AoC/aZX2LlRG4VK+zP/NbYAlQmKSAmmtgGZo4V0bSpPqqAE
         FMjgHqrsBAYHJNh73GPW5U2bzY36w/aPv/jn8BXYIJSr9tFM+lf00M4cYoQIfEA7rAIi
         /BEITdz+x5SJ6U8JH9ruqq4ER+vOvHs6x5+3Dd12+nLBVc15yFbvuQTbKmeFX0VWDYr7
         Mg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767962085; x=1768566885;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D56jBZpJ8Xmrnu3z5qry1jMmpBw7OSTn5y05yZSJKwc=;
        b=TMOOotiTsexaFOjJApJ0mgMic8v7sEdYf7fMqG2GRnEWVcLUV4ALRsDavgT1N+kRw8
         fnsCoWPphQ/dDS4Bv4GQC3Dmud2NgKFDf/ChKqmRV6HYHjodXIiYywMmh4odMG8R1cV5
         jTGTwYqBjVWrQKRu8yHdiV/b4L6G2iVc47lkSmzX5yzvFYABRX+7zGNu0RZL9r8BfKKW
         OEBhyEK+iDyLYgYQuwqmF/4PPBWCQ4ymWfdbuYrgCp3nF4PmtnqV4rC91vSzjJV7+gWB
         lua3Mp31pZpz3w5Y67FwwSZ6FAFg6MnH9eLgOBgXkmrLdrFHyMl5d8KpcMLjhTnIjJmP
         xjzQ==
X-Gm-Message-State: AOJu0YxIq45vCIZttlmGwe7rg/sVOwSwmmjyjc50Rf5PWJmChY/42DvD
	T+nWU+SkJlRdGMv0i0H7pnBfpg9jJMHtz2NIlNVHVrsCnjxcz3L53wi8BT+Ht8BCKb1BEDPbjBD
	/FOGOxQ==
X-Gm-Gg: AY/fxX7wTL5csNumh9EBeAlWkGdq+Yw8RJRlq8RdPNqcNU6ml3NenSHIgW5vRCDoEuE
	1Csx2R8UuiiK3kIdSb3GeIKyGfsXD44LKTmRcEUKNkx6BIfm7Kh/xoGrlStuRe98BuCI86grG/B
	iaV8p0qbNyUJc74TW1tlaP5BJzYm1r9qzWPhhh7UE/VWbU5dmYb5MFPtkYr92dxQHbL45dajUCK
	Qurk4j/uhyoXYpu6mL0PC0Hrvrox55GWHGJ8aMHw0/OB5tKtD9dNKVtOt00BUcOcHpQ+ZZ9tg0U
	g870pi3grtb+5Im52kcHm2Cd4nKugtz7vZrXLjjeV5DGmYjSFp3GjGvqh4HvPOLYx1KxAe5bhL0
	aRAZFIDFvnbhc/n+GZ7J9BXs/iPZB/cDPy0v/VfvularFspKFryRHDSJZiNRtu+29gndWe6MWCr
	XsSwZJQlIUwF0s6Q2PmpAKeADbIB2zYo27LsWLmqopaixVzHSx3yAZLCsAEJ4P7YAQhDQt8iFvG
	YTkBeZ162reTQ==
X-Google-Smtp-Source: AGHT+IFoBhfh9vxrvbjS6kZEBUjlFvtP56OJG+LvBDHAvyK0eLB5B5JGnDv2MlgYxQ934ikWqbqGgw==
X-Received: by 2002:a05:600c:890b:b0:47a:8088:439c with SMTP id 5b1f17b1804b1-47d84b3fa84mr87098405e9.35.1767962085246;
        Fri, 09 Jan 2026 04:34:45 -0800 (PST)
Message-ID: <77e8a4ec-9e94-42fd-8bce-443e985a2f76@suse.com>
Date: Fri, 9 Jan 2026 13:34:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] INSTALL: remove unsupported XEN_CONFIG_EXPERT from
 documentation
To: dmukhin@xen.org
References: <20260108141641.506534-2-dmukhin@ford.com>
 <df81c33c-5d97-489f-a768-25cef8293921@suse.com>
 <4e14f1c5-bd85-4ac5-a2a3-613f9673252f@suse.com> <aWDx9WaBzuT74v3g@kraken>
Content-Language: en-US
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
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
In-Reply-To: <aWDx9WaBzuT74v3g@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

(re-adding xen-devel@)

On 09.01.2026 13:17, dmukhin@xen.org wrote:
> On Thu, Jan 08, 2026 at 03:27:39PM +0100, Jan Beulich wrote:
>> On 08.01.2026 15:24, Jan Beulich wrote:
>>> On 08.01.2026 15:16, dmukhin@xen.org wrote:
>>>> From: Denis Mukhin <dmukhin@ford.com> 
>>>>
>>>> Amends: 37339ba9ef46 ("automation: Remove XEN_CONFIG_EXPERT leftovers")
>>>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>>>
>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>> Actually no, I withdraw this. It makes little sense to update ...
>>
>>> However, ...
>>>
>>>> --- a/INSTALL
>>>> +++ b/INSTALL
>>>> @@ -33,8 +33,8 @@ small subset of the options.  Attempts to change other options will be
>>>>  silently overridden.  The only way to find which configuration options
>>>>  are available is to run `make menuconfig' or the like.
>>>
>>> ... I don't think what is said up from here is quite right. As a result, ...
>>>
>>>> -You can counter-override this behaviour by setting XEN_CONFIG_EXPERT=y
>>>> -in your environment.  However, doing this is not supported and the
>>>> +You can counter-override this behaviour by setting CONFIG_EXPERT=y
>>
>> ... just this reference, when things also work differently now (?). (IOW
>> the original description ...
>>
>>>> +in your Kconfig file.  However, doing this is not supported and the
>>>>  resulting configurations do not receive security support.  If you set
>>>>  this variable there is nothing stopping you setting dangerously
>>>>  experimental combinations of features - not even any warnings.
>>>
>>> ... some of this is also in need of updating / correcting.
>>
>> ... may or may not have been correct when it was still an env var.)
> 
> Thanks for taking time to review this.
> 
> Perhaps it will be better to remove the entire paragraph w/ original
> XEN_CONFIG_EXPERT then?
> 
> E.g. there's a brief note on EXPERT in SUPPORT.md wrt security support
> and it feels that there's no need to explain that EXPERT mode may lead
> to some bad config in general...

I wouldn't mind if this and the earlier paragraphs were dropped, but
others may disagree and prefer them to be brought up-to-date. Give
them a few days to voice opinions.

> I just wanted to resolve dangling reference to XEN_CONFIG_EXPERT which
> I hit after reading through upstream xen yocto recipe.

I understand this, but leaving incorrect information isn't the way to
address this.

Jan

