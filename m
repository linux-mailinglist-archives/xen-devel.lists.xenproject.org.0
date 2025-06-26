Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C5BAE9D90
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 14:34:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026307.1401487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUlnq-0006gN-Qn; Thu, 26 Jun 2025 12:34:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026307.1401487; Thu, 26 Jun 2025 12:34:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUlnq-0006eH-O2; Thu, 26 Jun 2025 12:34:06 +0000
Received: by outflank-mailman (input) for mailman id 1026307;
 Thu, 26 Jun 2025 12:34:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUlno-0006eB-KX
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 12:34:04 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d72cbbec-5289-11f0-b894-0df219b8e170;
 Thu, 26 Jun 2025 14:34:02 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a4f72cba73so1303454f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 05:34:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749c88730d9sm6944422b3a.171.2025.06.26.05.33.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 05:34:01 -0700 (PDT)
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
X-Inumbo-ID: d72cbbec-5289-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750941242; x=1751546042; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yzwRf7vEaSbj+tQj+ivMabI+UWE0BBbNilWBtKbn4yo=;
        b=WoPsjGWJj3UfsSshL9zclXWyg62sTYdADjg4YhyZpvba3BQEetQQdTbJ1K/A9QXGGI
         te2ceDaqWEyO0WA/rVaJtS4OhyN+z1MRf4XYjaALtDB1gq9HDLmkUjHgzm3Iyq6iJAqT
         ZxDy8x3NKBeiwDg598rxVbXFXx74aQNLPxAyCWYVlHukYD3kwFXq333nxZ83uxk5RZYP
         c0XFqpxgc784npRpVSioidbwEa6S6Ihb+5+1jbna6IH1ewqcW2XJIWA7d6to6TTMXxKw
         g+lz+lxanFiYqcVSTAWX84Qypmx6KBaHTfV8QVUzyEXe0H0atmrPoemLxLu8r9CO/IZQ
         0Qcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750941242; x=1751546042;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzwRf7vEaSbj+tQj+ivMabI+UWE0BBbNilWBtKbn4yo=;
        b=v2TG0sndGN0hJnA5/enMAf8mg2pOe762/aXy35HYuXCBzdtgM3H9IWjWdRxIUcp/q7
         xhLfrmvR0T8+/Z8U1efEVWRjobnI23U8NfY2Ycz/Oe0RgS6CF0dbRBNajjOI4BLDT7nI
         GBZtqlqAISe3fQu8FUd7eIwN3SQWtVZlKDyTo0S0kur8+Ea2+fS8CA17lf6/K6jcRwvu
         KhNLecly8os/JMtamFSqawJpWEqiJrMFY08K+PUnqx5mGNUrWYPyf85Na21KQjTIHZ9+
         J1G5n47FnuDb5wn7K6Ax81oRxuZCI5zp0zNX/FYw7qzufczH9CfX+j+ztuwjiueIczTs
         z8Yw==
X-Forwarded-Encrypted: i=1; AJvYcCUWuL0YeVCB/3mNvDSvzdyhUz7eI+I4VmCfQHxBBi57qQldc5MUynJpyPANA+9qPOcKUP6Z4ABt2MI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBsCEw8GTyhopaTj2BjZ6rNhkaecvTBiF1i7ll5ZRRrn55n228
	EMaNxXndDUp3lTMsVGmHJnXd63LfLcT1cd1SJrjx/XMvwE17UYpNcPdAsBJhxHPWMQ==
X-Gm-Gg: ASbGnctPpU0CU/1/dRF8gUi6TL4XeP7xsPziGXjNypfTqmenWKQDS2e9TkdBtje8xS3
	1Dul4IKYiRNK6+If3tP/GhF3hpw1BiNM1lEmcWCwMMF6iLmPxQEqU8UTmoL6V2Ju3SyI+vc8Wp/
	n8ZBn7QahfpyaKX2yAtg2nVSHCymCSUb/fcqwafLSfZ3S8zxBzVMr1TnJ/IrQq9MM8SGbKkUqxO
	wG1Tt5qsQjXiQfIp/xnllnbzuXOfDMLBxZNwBOqSk1vCbR0UtX57j9tavGFJ8kD8Kyp7DwxLHAE
	NtkLkZkCH0REjZHBqREHo+fiu+yuLQ25MpiCRvZJqBha8joxokuLvhclRAHwY9KnsqeXFoE1ozY
	20Yxci0Gy/50FINTC3QLudI3xWLAscEw2ZmhV695vGZjeio8=
X-Google-Smtp-Source: AGHT+IErYitMQtuFaoyPd/Pe6I3EqDgAtHsBtlkDN3viBKQ2Dmp0biKCYCwM7w1aXWsKQbwNhEoSMQ==
X-Received: by 2002:a5d:584b:0:b0:3a6:e2d5:f12d with SMTP id ffacd0b85a97d-3a6f3102cb4mr2923819f8f.11.1750941241696;
        Thu, 26 Jun 2025 05:34:01 -0700 (PDT)
Message-ID: <e4546406-ea82-4bb5-b222-4ea233e43ff6@suse.com>
Date: Thu, 26 Jun 2025 14:33:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] kconfig: turn PDX compression into a choice
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <20250620111130.29057-3-roger.pau@citrix.com>
 <bd844f21-ce43-41a2-baf0-db92ccef7c2c@suse.com>
 <aFz7gHfrXCta_r1W@macbook.local>
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
In-Reply-To: <aFz7gHfrXCta_r1W@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.06.2025 09:49, Roger Pau Monné wrote:
> On Tue, Jun 24, 2025 at 03:13:27PM +0200, Jan Beulich wrote:
>> On 20.06.2025 13:11, Roger Pau Monne wrote:
>>> Rename the current CONFIG_PDX_COMPRESSION to CONFIG_PDX_MASK_COMPRESSION,
>>> and make it part of the PDX compression choice block, in preparation for
>>> adding further PDX compression algorithms.
>>>
>>> No functional change intended as the PDX compression defaults should still
>>> be the same for all architectures, however the choice block cannot be
>>> protected under EXPERT and still have a default choice being
>>> unconditionally selected.  As a result, the new "PDX (Page inDeX)
>>> compression" item will be unconditionally visible in Kconfig.
>>
>> Just to mention it: Afaict there is a functional change, but one I actually
>> appreciate, at least in part. So far ...
>>
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -52,9 +52,10 @@ config EVTCHN_FIFO
>>>  
>>>  	  If unsure, say Y.
>>>  
>>> -config PDX_COMPRESSION
>>> -	bool "PDX (Page inDeX) compression" if EXPERT && !X86 && !RISCV
>>> -	default ARM || PPC
>>
>> ... for x86 (and RISC-V) this option couldn't be selected. Whereas ...
>>
>>> @@ -67,6 +68,17 @@ config PDX_COMPRESSION
>>>  	  If your platform does not have sparse RAM banks, do not enable PDX
>>>  	  compression.
>>>  
>>> +config PDX_MASK_COMPRESSION
>>> +	bool "Mask compression"
>>> +	help
>>> +	  Compression relying on all RAM addresses sharing a zeroed bit region.
>>
>> ... this option is now available, as the prior !X86 && !RISCV doesn't
>> re-appear here. (As the description mentions it, that dependency clearly
>> can't appear on the enclosing choice itself.) Since x86 actually still
>> should have mask compression implemented properly, that's fine (from my
>> pov; iirc I even asked that it would have remained available when the
>> earlier change was done), whereas I think for RISC-V it's not quite right
>> to offer the option. It also did escape me why the option was made
>> available for PPC, which I'm pretty sure also lacks the logic to determine
>> a suitable mask.
> 
> Yes, the only architectures that have functional PDX compression are
> x86 and ARM, as neither RISC-V nor PowerPC call the initialization
> functions.  AFAICT this is harmless apart from giving the wrong
> impression to the user that PDX compression might be implemented.
> 
> Would you prefer for me to introduce a new HAS_PDX config option
> that's selected by x86 and ARM, and is used to enable the choice PDX
> config?

Hmm, no, I don't think I want you to make any change to the code. I'm
actually happy with the slight relaxation for x86 (and RISC-V), and
aiui you don't alter behavior for PPC. The fact that behavior there
(and for RISC-V) doesn't look quite right isn't an effect of your
change.

A change may be wanted to the description, to avoid giving the wrong
(afaict) impression of this being "no functional change". Considering
how things ended up the way they are prior to this series, this
becoming explicit may cause _others_ to want you to make changes,
though. Hence I simply wanted to raise that aspect, to give others a
hint that they may need to chime in.

For the record, below is what I think would represent original
behavior ("help" parts omitted), albeit still leaving out the EXPERT
aspect (as it's not clear to me what a condition on a prompt means in
a choice element):

choice
	prompt "PDX (Page inDeX) compression"
	default PDX_MASK_COMPRESSION if !X86 && !RISCV
	default PDX_NONE

config PDX_MASK_COMPRESSION
	bool "Mask compression"
	depends on !X86 && !RISCV

config PDX_NONE
	bool "None"
endchoice

But again, specifically for x86 I'd prefer if PDX_MASK_COMPRESSION
became available (again), so the above is not a suggestion to change
the code, unless others insisted on restoring prior behavior.

Jan

