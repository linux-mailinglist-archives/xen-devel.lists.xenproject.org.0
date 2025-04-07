Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE28EA7D562
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 09:20:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939253.1339429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1gls-0004C2-0g; Mon, 07 Apr 2025 07:19:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939253.1339429; Mon, 07 Apr 2025 07:19:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1glr-00049W-Tr; Mon, 07 Apr 2025 07:19:51 +0000
Received: by outflank-mailman (input) for mailman id 939253;
 Mon, 07 Apr 2025 07:19:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u1glq-00049Q-Qo
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 07:19:50 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b076c6aa-1380-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 09:19:48 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso43387385e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 00:19:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec34be2ffsm120213855e9.22.2025.04.07.00.19.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 00:19:47 -0700 (PDT)
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
X-Inumbo-ID: b076c6aa-1380-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744010388; x=1744615188; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7eiM7SYmUchJxNaX7VHU6I0hy9HDCwzEhfwkJKwW7Lw=;
        b=EKAXozk+TPBWWoMtI7796pYihcwt2mENwUEdCzzK6xwBozsJbDjFRGqW7QJd/2HgP8
         DgP3skc6yXQSXLKzy0gPwJH8IkeQBCfgtO7rnxmncFXWTjIh9L4SrD1648IsM5fMrZSM
         w1i2xO6RVts7l2yOcK43wPSMrq9a9d4y4lAOzDaBIdPlpVYZBLsetlGltws0JnfkdfvE
         zS66u5RXsqZVrQtjaPHJmcfjcZbERNPz+YRZd091HFBBxJ9TT9u10SqR7Ndpu8qLqddl
         0HZMxDcGRslxdbeIhfMaTsCg9b+2qe4ptzVf0OLSfQSJOwNpgojCAiZ1su19n9HxvBDT
         1t9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010388; x=1744615188;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7eiM7SYmUchJxNaX7VHU6I0hy9HDCwzEhfwkJKwW7Lw=;
        b=ej7EaZ0VwCsT2zvOHV2tvvZolRRYqJ5c5CAJp1jeZ3oGIPlnldz7W5D91iytNQM42N
         MdHfQdGWJQoE+YKBFMDdLewZ3w5EYGONNzy3wF8/AKbfK+N1+qMzlVlKoBJytsNAbLkX
         BLpRL9u0kv7SnFjbRc1Fkv7piwLNz2t3BUenATKdC+CMUL0K3cpRdVjPzHLWE20FN6Ps
         qF+h1/sGzKJOHezUovntcmatFXnqIK/Ii4hU2P7OyElm1ay9DZE0BaJqUReVwepOyBEh
         ChztAgv9jYdpkIl9yv6Xy8SFcaeod8Q4yi5FaGejFXdVOvKSNUVgBHxivAMylygF4rXu
         R5hw==
X-Forwarded-Encrypted: i=1; AJvYcCXWJ6m142SYvYHaoOn5CWw80EzGsz2lnNhWyYUC7t+SPkfAs/KxHAgXGHMjykyZFj4z4/G4DrLXQWQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzgttS5vD651t/ys1ry9wA55jKOsjd9SswT9BQpoYSYoeT/Q4Hp
	LXdSpWzx8natangog4nZ2YUKE1/5992HXr3e2gowN6UaPJOdrUKwgsZpmZRxbQ==
X-Gm-Gg: ASbGncu5duoLx6U6f3GumTniwrvD5hYn+Lou8AJztrq+WgfpeSci7/Pq1/bt8LLlluV
	XLSiR1yJIHgcdOHhhQTq55zuRyRbkCO+2+/Y+3hvpLH2oh8ijzIsYXnSLwFPTr5j4tIBzYJMJ0L
	Pmh8/NJy3ckuv0TtJv4uWvD6wdoXFEap/NGXKrGGtSXHLNPI4Xr+RrYnJjlvwyaUWqzbD5ojK86
	xCNUQ8PnsNMWyTtI4QdUiI1JSgoAX1PDVHRp6bNphtbKSGftsyZKwAwY3Muc2ZASVmFgh8IkvYw
	LCu/QBr2QrhlKBZpk5X+P5OTenx9Uqp45v+irAxq5/llBbGLLSYxrGWwzEMCHnqWUgCw93wky9X
	bUEYrrwFaqf5DzogpMUTvVJywMgyeKg==
X-Google-Smtp-Source: AGHT+IEWtd08Ose2uXR2GNb4gXa21xoXBArCfT0TEgYD/6egMbh9SgFRq6mUd10Z+Pevq2DEew1PIA==
X-Received: by 2002:a05:600c:8711:b0:43d:2230:300f with SMTP id 5b1f17b1804b1-43ed07ad502mr120443135e9.0.1744010388089;
        Mon, 07 Apr 2025 00:19:48 -0700 (PDT)
Message-ID: <6918af30-26de-420a-a19c-5687c16c8f29@suse.com>
Date: Mon, 7 Apr 2025 09:19:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] xen: debug: gcov: add condition coverage support
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250401011744.2267367-1-volodymyr_babchuk@epam.com>
 <20250401011744.2267367-4-volodymyr_babchuk@epam.com>
 <7281b7d8-ba7b-4658-82f1-a63d66c1baff@suse.com> <87mscvffo8.fsf@epam.com>
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
In-Reply-To: <87mscvffo8.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.04.2025 05:30, Volodymyr Babchuk wrote:
> Jan Beulich <jbeulich@suse.com> writes:
> 
>> On 01.04.2025 03:17, Volodymyr Babchuk wrote:
>>> --- a/xen/Kconfig
>>> +++ b/xen/Kconfig
>>> @@ -41,6 +41,11 @@ config CC_SPLIT_SECTIONS
>>>  config CC_HAS_UBSAN
>>>  	def_bool $(cc-option,-fsanitize=undefined)
>>>  
>>> +# Compiler supports -fcondition-coverage aka MC/DC
>>> +config CC_HAS_MCDC
>>> +	def_bool $(cc-option,-fcondition-coverage)
>>> +
>>> +
>>
>> Nit: No double blank lines please.
>>
>> Also, just to clarify - until the use of Kconfig (alone) for things like
>> this is properly resolved one way or another, I'm not going to approve
>> such changes (but I'm also not going to veto them). My proposal [1] is
>> still pending with no resolution, nor any counter-proposals.
> 
> I checked your proposal, but I am not sure how it maps for this
> particular use case. In your example
> 
>> config XEN_SHSTK
>>        bool "Supervisor Shadow Stacks"
>>        default HAS_AS_CET_SS
> 
> The default value will be "y" which is desired, but in case
> of CONDITION_COVERAGE, the default value should be "n". Are you
> suggesting to put
> 
> ifeq ($(CONFIG_CONDITION_COVERAGE)x$(CONFIG_CC_HAS_MCDC), yx)
>    $(warning Your compiler does not support condition coverage)
> endif
> 
> somewhere in Rules.mk ?

Perhaps. Ideally abstracted by a suitable, easy to use construct.

FTAOD - if you meant to include something like this in the next version of
the patch, you'll probably face resistance by Andrew (and/or maybe others).
We really need to decide on what model to use. I simply got tired of
reminding people that this discussion needs to happen (without pre-
determined outcome), for the matter to then be settled, and for the mix of
approaches presently taken to then be straightened.

>>> --- a/xen/Rules.mk
>>> +++ b/xen/Rules.mk
>>> @@ -138,6 +138,9 @@ ifeq ($(CONFIG_CC_IS_CLANG),y)
>>>      COV_FLAGS := -fprofile-instr-generate -fcoverage-mapping
>>>  else
>>>      COV_FLAGS := -fprofile-arcs -ftest-coverage
>>> +ifeq ($(CONFIG_CONDITION_COVERAGE),y)
>>> +    COV_FLAGS += -fcondition-coverage
>>> +endif
>>>  endif
>>
>> Personally I find ifeq() uses like this unhelpful, and would prefer
>>
>> COV_FLAGS-$(CONFIG_CONDITION_COVERAGE) += -fcondition-coverage
>> together with an eventual
>>
>> COV_FLAGS += $(COV_FLAGS-y)
>>
>> (if we don't already have one).
> 
> I did in this way:
> 
> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -133,18 +133,19 @@ $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): CFLAGS-y += -DINIT_SECTIONS
>  
>  non-init-objects = $(filter-out %.init.o, $(obj-y) $(obj-bin-y) $(extra-y))
>  
> -ifeq ($(CONFIG_COVERAGE),y)
>  ifeq ($(CONFIG_CC_IS_CLANG),y)
> -    COV_FLAGS := -fprofile-instr-generate -fcoverage-mapping
> +    cov-flags-$(CONFIG_COVERAGE) := -fprofile-instr-generate -fcoverage-mapping
>  else
> -    COV_FLAGS := -fprofile-arcs -ftest-coverage
> +    cov-flags-$(CONFIG_COVERAGE) := -fprofile-arcs -ftest-coverage
> +    cov-flags-$(CONFIG_CONDITION_COVERAGE) += -fcondition-coverage
>  endif
>  
> -# Reset COV_FLAGS in cases where an objects has another one as prerequisite
> +# Reset cov-flags-y in cases where an objects has another one as prerequisite
>  $(nocov-y) $(filter %.init.o, $(obj-y) $(obj-bin-y) $(extra-y)): \
> -    COV_FLAGS :=
> +    cov-flags-y :=
>  
> -$(non-init-objects): _c_flags += $(COV_FLAGS)
> +$(non-init-objects): _c_flags += $(cov-flags-y)
>  endif
>  
> 
> I hope you don't mind having both changes (COV_FLAGS -> cov_flags-y and
> introduction of CONFIG_CONDITION_COVERAGE) in the same patch. With
> correct commit message, of course.

If that doesn't entail too many changes elsewhere, it's probably going to be
okay.

Jan

