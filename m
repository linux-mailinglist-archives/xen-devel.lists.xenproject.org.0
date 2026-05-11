Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOHsMkuyAWppigEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 12:41:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEE250C095
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 12:41:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1305990.1578093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMO4R-0002ru-UJ; Mon, 11 May 2026 10:41:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1305990.1578093; Mon, 11 May 2026 10:41:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMO4R-0002qC-RU; Mon, 11 May 2026 10:41:07 +0000
Received: by outflank-mailman (input) for mailman id 1305990;
 Mon, 11 May 2026 10:41:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wMO4Q-0002pf-H0
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 10:41:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMO4P-00HPCC-UF
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 12:41:05 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a01b224-2eae-0a2a0a5409dd-0a2a4508cac8-42
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 12:41:05 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a01b23f-63b5-0a2a45080019-d155802ca5a6-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 12:41:04 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-48a3e9862f0so27365245e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 03:41:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e6db10684sm62178105e9.26.2026.05.11.03.41.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2026 03:41:03 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778496063; x=1779100863; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WFnDQY3nl0rAn8uRDrd2NFIgR7luB1LYS5pBNgIoge0=;
        b=Hw21UskFjtbzAmp1MsiXjE6LTbzLwaOChmFcLFCW90OlPVh3mOw1KdDNPb22iVaMCW
         tbXsIbwScsAIUrLPhmMi6NC1SJ8CvXyGdvtKWJhTioQ1qli+LblL5nKNLYiSSVgIPfsj
         uwyU+6uFwFmwmnCdD49vgXBfTzIA6K8ef3DHrE5uTWHM5fMFjKSS/5Mtj1TNZpUnVWur
         RzbPTVcTJ1utzBVoT/Kq9WBWf4+u7L8ebrvS0n0/VVWwYszD6i++/4eJeEyFka9nF8wO
         cGQXcT3kJHXU2Cl5YZ6DBi+1lSnPQcmZhok6edXcgvrtfaTDKGo7yT/lrZ40rtFBEOey
         94YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496063; x=1779100863;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFnDQY3nl0rAn8uRDrd2NFIgR7luB1LYS5pBNgIoge0=;
        b=FdaEmzNx6yB+K/dUqJ5O5HVkiNqthFnoevbxBRfs8VjVAu+I/vTk/tcMK2+b09KN21
         VhSZbVY6dOYlZkG4OujIeIh9ni+Vd7jmv3T+e6NpJtXRJ48WhEHQujetiG6nfcwpth9C
         5oa1UHNncR7W9Jub2nqw0q9/CqiZuZndplH7YGWh6VhuRu3AkxhsEDPERFJse60YuGR8
         hpNBoiqvnbm1FYIm1jwyN/n8KLvKH40HaYsE07GvVwfpxJsOILbiY3JLxMgYOOiojdoo
         rfrDPYE1yQLCAE6Es8r4mPsY2uOBIVe618hWX9Bh0bkrpPjDnuzsuss0tvCK57Um5wAk
         uCAg==
X-Gm-Message-State: AOJu0Yx+p/yxSaJltLOnD5nNv9jQy+3iG6TdqL2QVDnah9uN1BGkhenu
	JpmTlQ5oqywIQ7ciXn1j5cz5wNO8sPDy1+BlbukI5tHDXHi/aRIw49E8qF5rtExI8NN6y5kA1b5
	XyZ4=
X-Gm-Gg: Acq92OEbw7BeelkQ2IUDpX9mMo2qU17y/X0ppDD6O9sPARvcVaXYN8+iWa2DdWwXyt4
	lt1mSVHKGEs1JOB7R3TB6UDDAYVPJzXadizTda/4kJ6zBvFP6lc+/OLMJd27GQQFMiVp6vJ7sdD
	gj9dxGh42C8uNQvRXcKBkdsXoyih/NhW+zOPzs2XCKt0nlB3IWf7XloS6LY1f1Juu2UGi3M2tr/
	vuL+BFxrBeH/ymA2toJdNT9YgZl3ne9Mmq3kOnGfkrdD4WQbhGm7eRlsjaoSxPMYuJxQ2req9cK
	V/OnMkhaXKAvff66WROLc+m9pUeldNRj3+0vzb7/6Kgege12AcWRkuQ67m7rp8HoICz0kNj8oZC
	p1wkEKqU2Bw467nI0gHRQFzDOROpLsQw4eJl3lZHYkGjPgkS4RMn1+QQPngHZrMqWkRInZfdsoP
	Q/nhQ3ZQSUiWLrNwi2+V8Y2TqZX4xwsrc++baxPjGYSgyEmjgJ7JYHl08Z0CUdAropZbcK3CSgZ
	KDlnJeccNdHdew=
X-Received: by 2002:a05:600c:4749:b0:488:aa33:dc8f with SMTP id 5b1f17b1804b1-48e5df8d7a7mr269771505e9.0.1778496063499;
        Mon, 11 May 2026 03:41:03 -0700 (PDT)
Message-ID: <eacdc304-d3f7-4f45-87b2-f533ca8fce03@suse.com>
Date: Mon, 11 May 2026 12:41:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] x86/mwait-idle: Add C-states validation
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <7b7a677e-a5b9-42c8-beec-3c506b4eac52@suse.com>
 <d13912c9-8820-44e7-8aad-d8ee9ea17980@suse.com>
 <aevBUh77IeMuXjw4@macbook.local>
 <57233a5d-3944-433c-a7c5-a1a491a2c1dd@suse.com>
 <af2TBOapUCCChHjg@macbook.local>
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
In-Reply-To: <af2TBOapUCCChHjg@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1778496064-C5784DB1-064AD845/0/0
X-purgate-type: clean
X-purgate-size: 2912
X-Rspamd-Queue-Id: 5BEE250C095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 08.05.2026 09:38, Roger Pau Monné wrote:
> On Mon, May 04, 2026 at 11:34:40AM +0200, Jan Beulich wrote:
>> On 24.04.2026 21:15, Roger Pau Monné wrote:
>>> On Thu, Mar 12, 2026 at 05:58:21PM +0100, Jan Beulich wrote:
>>>> @@ -1589,6 +1594,41 @@ static char *__init get_cmdline_field(ch
>>>>  }
>>>>  
>>>>  /**
>>>> + * validate_cmdline_cstate - Validate a C-state from cmdline.
>>>> + * @state: The C-state to validate.
>>>> + * @prev_state: The previous C-state in the table or NULL.
>>>> + *
>>>> + * Return: 0 if the C-state is valid or -EINVAL otherwise.
>>>
>>> Hm, I know we picked this up from upstream, but this function would
>>> better return a boolean, rather than 0 or -EINVAL.
>>
>> I agree, but I didn't want to deviate from their code purely for cosmetic
>> reasons.
>>
>>>> +static int __init validate_cmdline_cstate(struct cpuidle_state *state,
>>>> +					  struct cpuidle_state *prev_state)
>>>> +{
>>>> +	if (state->exit_latency == 0)
>>>> +		/* Exit latency 0 can only be used for the POLL state */
>>>> +		return -EINVAL;
>>>> +
>>>> +	if (state->exit_latency > MAX_CMDLINE_LATENCY_US)
>>>> +		return -EINVAL;
>>>> +
>>>> +	if (state->target_residency > MAX_CMDLINE_RESIDENCY_US)
>>>> +		return -EINVAL;
>>>> +
>>>> +	if (state->target_residency < state->exit_latency)
>>>> +		return -EINVAL;
>>>> +
>>>> +	if (!prev_state)
>>>> +		return 0;
>>>> +
>>>> +	if (state->exit_latency <= prev_state->exit_latency)
>>>> +		return -EINVAL;
>>>> +
>>>> +	if (state->target_residency <= prev_state->target_residency)
>>>> +		return -EINVAL;
>>>
>>> I'm not an expert on C-states, but isn't this checking against the
>>> previous value kind of defeating part of the purpose of the command
>>> line?
>>
>> I don't know. The question would need raising to the author.
>>
>>> Also, it might help to also write down those limits in the command
>>> line documentation.
>>
>> What do you mean there? Some of the values are universal, but some
>> checks are against model-specific values. I don't think you mean to
>> enumerate them all?
> 
> Maybe it's indeed not very useful.  What I referring to was something
> along the lines of: "the command line provided residency and latency
> values must be smaller than the default ones".  As noted above it
> seems weird to me than higher than current values cannot be set,
> albeit I have no idea what's the expected usage of this interface.

Hmm, while meaning to make this change I came to wonder: What exactly do
you refer to by "current values" and "default ones"? prev_state here
isn't "previous state" as in "before this option was parsed", but as in
"next lower C-state", as per

		prev_state = i ? &cmdline_states[i - 1] : NULL;

ahead of the call site.

Instead what I'm inclined to do (despite deviating from the original) is
to constify the function's parameters.

Jan

