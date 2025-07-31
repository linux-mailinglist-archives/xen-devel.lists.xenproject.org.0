Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18015B16D2A
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 10:06:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064978.1430323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhOIr-0005i2-88; Thu, 31 Jul 2025 08:06:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064978.1430323; Thu, 31 Jul 2025 08:06:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhOIr-0005hC-44; Thu, 31 Jul 2025 08:06:17 +0000
Received: by outflank-mailman (input) for mailman id 1064978;
 Thu, 31 Jul 2025 08:06:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhOIq-0004IO-Ln
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 08:06:16 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b0f977e-6de5-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 10:06:15 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3b782cca9a0so488737f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 01:06:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bccfbce84sm932779b3a.71.2025.07.31.01.06.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 01:06:14 -0700 (PDT)
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
X-Inumbo-ID: 3b0f977e-6de5-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753949175; x=1754553975; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iM8YK0f3EQUgdUZGSgXrFYU1Gr3W2OrJlXwWsYkNLJ0=;
        b=HGfJI8+AR/+ouAHNg7vN+CLJYd2xW7SFveI+MqJ+AC8xhT4CUNmffgAQiF7YEZ/7x9
         C3SzNSIaJNvUgmOBBfNigvkcZk7pkITcL7Pu/SoEFoVNpqTFzyTZNVBxIexjvgGvVOcv
         3Gh6797QHuw3FMroupLjH/bBA+/0Uq1OnMMOGCqNoS5UArbwbI9VG7SJIz2zg0WD0NFl
         YM2I/ppZ4TfskV7ehFSjyjUU73TtqWm4YRS/HA28JHLT8OZdy80hppl7Z12Xcb/Fd5zm
         Myg4bAhF9GuY0LjznpZxr99/j9fUSiLYwzf1x1SKo1U/La14LQgD/hS6JlshhEx0XvMy
         V1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753949175; x=1754553975;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iM8YK0f3EQUgdUZGSgXrFYU1Gr3W2OrJlXwWsYkNLJ0=;
        b=NcCV+flltad+YbL3HjlFEqCMe5+guPjB9sZ3oyuoxYztZSJUBjG5iY9FO8ZpTn0Ce8
         b2Dt1IiTrioxjQvfLJ+gXBPh6jec7ibcPDKE7fQ+B1bWcKDuglPOMN3U6Egx57qu2JV6
         gt9COFVGqnca8MIpTzQtaeCasVkQdvIh2J7GzqR2P7O3LMwS2SB0g90NtGaWaSeB+4yn
         AunVz/Hyt9RYwHjd/aKXOX7cHPY5wfv+qKYs/rvbnwWLHYoTA45KBJfKDbTq0C6D+GRT
         mFOO9/5+nB4/thFz2BRfT5498WiDxSPn0T/bGZ7Z3WVUurHWNhbrZfxWayW+y0HuJgRH
         BnIw==
X-Forwarded-Encrypted: i=1; AJvYcCUP/wjAFuoH/pQiiClnXnj6bgEb4qLR/QcxgqCggZZb8CmYdbBioKj73kmynS+cLQxuYH817eKXqAY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzyIOXCjexPpFreklRQdATQcQGghngRk4juwKsyPgTx58Hc4NcV
	27RlcXalAGDvnYor/aeCqJJDgndOzQlL5sm1GVYbfsK5jZ1BkvqT7IpQg4pbEax6IwZOdPKcTxI
	ftyE=
X-Gm-Gg: ASbGncsDaLli6eQZeB1Z2bJtOwesDEEeVon+b40mvULV2WVxxOOeupC6A8GqlAy3q3o
	saQk+WQzB54wdHZ5K+k3IPSaj2yo1P8b6845BbaYftt5skH5WdyoPY5k5TTVfbSpbVG7QSQ7FXe
	L2gZnXciU02J3Bj2f86hW8EtS/wn1J/ac5wpZgRMy1ranxVmAyPNTI7B7OO4HccgucyBKMHCBsl
	PJNgYxlezZTcsdXp8smUIByEL8Jbecuc83W2kunitLhqJ/63oooCFG9IismGLCejxStV9pusx1E
	72lO5OtYyPReFoA8Zq0IL2NVcQIAKbrgsh1GVrqcMEqaIrQIiMl6R6vteD8tuon4T4ljeaaZKQM
	IRJgbM5c5Z4od6oUSpi4QsYJqLGvkvYVa1MqaorzD7Z5OYeU4CUGmJFRNZk7LIwLSmnQ0d3sfLH
	q+P5Ll/DY=
X-Google-Smtp-Source: AGHT+IH9/J6pj1+o6m+1m14tnsGaT/5DLQqobgLnWCVN4jv7qFRxVunRyS4JVlZ/Q9OW3RlNAoFR+g==
X-Received: by 2002:a5d:5f54:0:b0:3b4:990a:a0d6 with SMTP id ffacd0b85a97d-3b794fd5a7bmr4592739f8f.19.1753949174723;
        Thu, 31 Jul 2025 01:06:14 -0700 (PDT)
Message-ID: <8a2554ef-a648-473d-bd1a-1735fae7d473@suse.com>
Date: Thu, 31 Jul 2025 10:06:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/17] xsm/silo: Support hardware & xenstore domains
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-3-jason.andryuk@amd.com>
 <90d5df6c-b431-4256-b39b-4567ab5bf8c9@suse.com>
 <6d46aed3-6c55-4aa8-8a21-bf8b3edaa2dd@amd.com>
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
In-Reply-To: <6d46aed3-6c55-4aa8-8a21-bf8b3edaa2dd@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.07.2025 23:05, Jason Andryuk wrote:
> On 2025-07-30 06:17, Jan Beulich wrote:
>> On 16.07.2025 23:14, Jason Andryuk wrote:
>>> In a disaggregated environment, dom0 is split into Control, Hardware,
>>> and Xenstore domains, along with domUs.
>>
>> Here we are with terminology again. In a truly disaggregated env, yet
>> more (service) domains would come into play. What you mean here is
>> only coarse disaggregation, as you're trying to get away without using
>> Flask.
> 
> If disaggregation only means, fine grain disaggregation, then I'm not 
> sure how to differentiate coarse.  I could write "split control and 
> hardware domain".

IMO that would be better here.

>>>   The is_control_domain() check
>>> is not sufficient to handle all these cases.  Add is_priv_domain() to
>>> support allowing for the various domains.
>>>
>>> The purpose of SILO mode is to prevent domUs from interacting with each
>>> other.  But dom0 was allowed to communicate with domUs to provide
>>> services.
>>>
>>> To provide xenstore connections, the Xenstore domain must be allowed to
>>> connect via grants and event channels.  Xenstore domain must also be
>>> allowed to connect to Control and Hardware to provide xenstore to them.
>>>
>>> Hardware domain will provide PV devices to domains, so it must be
>>> allowed to connect to domains.
>>>
>>> That leaves Control.  Xenstore and Hardware would already allow access
>>> to Control, so it can obtain services that way.  Control should be
>>> "privileged", which would mean it can make the connections.  But with
>>> Xenstore and Hardware providing their services to domUs, there may not
>>> be a reason to allow Control to use grants or event channels with domUs.
>>
>> "may not be" is too weak for my taste to forbid such.
> 
> I can't come up with a concrete example of why Control needs to directly 
> communicate with a domU.  Originally I allowed it, but it was your 
> previous feedback which made me remove Control.
> 
> I don't have a strong opinion on the handling of Control.  I can see it 
> argued either way.

My comment was merely on the wording: If Control is to be excluded, the
wording imo wants to be firm.

>>> This silo check is for grants, event channels and argo.  The dummy
>>> policy handles other calls, so Hardware is prevented from foreign
>>> mapping Control's memory with that.
>>
>> By "foreign mapping" you only mean what would result in p2m_foreign
>> entries? But grant mapping is okay?
> 
> Yes, "foreign mapping" = p2m_foreign.
> 
> Using grants requires explicit actions on both sides. 
> silo_mode_dom_check() passing still requires action by both sides to 
> establish a communication channel.
> 
> This is different from a foreign mapping, which is a unilateral action 
> by the privileged side.

Right, yet protecting from interference may want to extend to Control
e.g. having some forgotten code path installing a grant entry, which
some other domain may then map.

>>> @@ -29,8 +40,8 @@ static bool silo_mode_dom_check(const struct domain *ldom,
>>>   {
>>>       const struct domain *currd = current->domain;
>>>   
>>> -    return (is_control_domain(currd) || is_control_domain(ldom) ||
>>> -            is_control_domain(rdom) || ldom == rdom);
>>> +    return (is_priv_domain(currd) || is_priv_domain(ldom) ||
>>> +            is_priv_domain(rdom) || ldom == rdom);
>>>   }
>>
>> IOW we're turning by 180°? Interesting ...
> 
> While the previous code is written "is_control_domain()" its use in silo 
> mode is really "is_dom0()".
> 
> (Working on this, I've been thinking about how dom0 is like the god 
> Janus with two faces.  A single entity with two faces.  We use 
> is_control_domain() and is_hardware_domain(), but often it is just a 
> different name for the single dom0)
> 
> As stated above, domU <-> Xenstore and domU <-> Hardware (for PV 
> devices) are needed to allow those services.  So while it looks like a 
> 180°, maybe is_control_domain() was the wrong name for dom0?

The mix was - imo - a direct result of the boundaries never having been
drawn properly. That's necessary now, first in an abstract way, then
carried through to actual code. (Right here my remark really was just a
remark anyway, because the move looked particularly heavy on the
surface.)

Jan

