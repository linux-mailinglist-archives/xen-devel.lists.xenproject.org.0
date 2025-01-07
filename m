Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 894C0A039A9
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 09:20:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866091.1277355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV4or-0000E3-Eo; Tue, 07 Jan 2025 08:20:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866091.1277355; Tue, 07 Jan 2025 08:20:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV4or-0000Bb-C8; Tue, 07 Jan 2025 08:20:09 +0000
Received: by outflank-mailman (input) for mailman id 866091;
 Tue, 07 Jan 2025 08:20:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tV4oq-0000BV-0I
 for xen-devel@lists.xen.org; Tue, 07 Jan 2025 08:20:08 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 337a5ff4-ccd0-11ef-a0df-8be0dac302b0;
 Tue, 07 Jan 2025 09:20:06 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-385df53e559so11921505f8f.3
 for <xen-devel@lists.xen.org>; Tue, 07 Jan 2025 00:20:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436612008b1sm585836795e9.15.2025.01.07.00.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 00:20:04 -0800 (PST)
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
X-Inumbo-ID: 337a5ff4-ccd0-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736238005; x=1736842805; darn=lists.xen.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3SAzjJU45zokvdIvr/YBIOeVDaVE6dnyKjwDMBCfDmQ=;
        b=SvDKiZsFfFUcdc8SqcKL7TC0d7Ll8pBUfGdnnuBpHYqfzqaU4lrrqW/omtnFla9UmW
         MJYJAxDI7antlh0OAbh7CyF1ZmZOnFmuS+aibQx+63BAJ0mGm/K8emZR1/OI8DpOsY9+
         0H4zbU6l1WKsw18tfRNDHELoRmhYCwvCMbGk5fmV9pUS8+XW2Qfi8esLR1/i7sJZYGjR
         J2haXkmLRmuayfQo51Ml8jrTsvQFcu+CHHr/SCW0KVq0t7kUcVrOILOWFu2JMXODchtv
         F25zXrYQyLic2O+eM0t181sATYI2Q2rAqCg4q8Z1HqPXnmXm8t9K14CYTxNCgQP3BJD2
         ApZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736238005; x=1736842805;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3SAzjJU45zokvdIvr/YBIOeVDaVE6dnyKjwDMBCfDmQ=;
        b=KwOZiqwDVver38okwR0UIHKTQ694Zu6SlTYAEU8PDy0MVmNNoXTqGICSJyLt1IrzsS
         zwWtOD1iG5oNBdHFXX/gwLUZTvqHNzz1m0Y1HHYX4HPPjIMOknJF35QzUk1/jeYN1bVK
         4kyPo0XEAUTBsrZsvrEbA4lLB/gZ/jhs/iUYuHg0PDPu2OQQi0U/4RxLfjxaPd0xo/z3
         LbZNzPU0ozM+vW/trGFXOJ81Q8Os+TvxzJtVumXhMTel93Wwbmgsi7NZoacWrWUDLTuB
         qxigKf3uY/wpzm31ul/+R0/H1nD3JAPsznhh+MpSAPYmcKuR8Vmhk3AyXswIDuwCXdiT
         M3PA==
X-Forwarded-Encrypted: i=1; AJvYcCUTlxMJkXDP1BBb8Dp9RSDLv0Ih8L7iT5zmJdYYx6ihaLpBKN8sXr8UKnXa8LN9+8Snnd40cQiU6kk=@lists.xen.org
X-Gm-Message-State: AOJu0YwhTFNwsr2492G2RuMcppjo+zclKwLJBHbzYL5n/p9iHmHMfn8x
	b4WqXj/DdZMfZi09ef0HYBi5xN+AW7A3GzXp1N8JzERo07WdEZ+dqYrfQJny7A==
X-Gm-Gg: ASbGncvVWH/amJjo/ByKTRb2kVyM7LDd+ZAwAUHI/DnLO32uBGbbxVRwszsMGyHNhIw
	AcqgL5guCHDkDo2iSEBRglbCI0JP579q2BrFy5BPJx92vgWTRjxIuNAk8s8B+sLvrVF3XWMbO+F
	oPDHU3I8aAlJ0+bVahpEdXQ3PjNU5vOVIhDTgboWgy1YLE+xw9EJ7ZWjoohvLdv1XHWrvIpYZnj
	SyUWg7n9h/qjw1S/eRId/IWamPyfqM/crvTYx5nHFPfSZosmDH0FwfaQNQQsQzJxQyMs3+HFf9W
	pSJge1qXdTTi1jryhl/qjSxjs7bpJSIGKzSwf852tA==
X-Google-Smtp-Source: AGHT+IFBJ/sppT+eSbPG87lzQnG5tumQBfCAp04l9XFxNwALIh7UxBMqrWwRlPcvCARCrH2pdcfNqA==
X-Received: by 2002:a5d:64a3:0:b0:385:f527:be6d with SMTP id ffacd0b85a97d-38a2240074fmr50270317f8f.36.1736238005589;
        Tue, 07 Jan 2025 00:20:05 -0800 (PST)
Message-ID: <a9ee291f-469b-418c-8936-789849714ff3@suse.com>
Date: Tue, 7 Jan 2025 09:20:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen Security Advisory 466 v3 (CVE-2024-53241) - Xen hypercall
 page unsafe against speculative attacks
To: David Woodhouse <dwmw2@infradead.org>
References: <E1tNWXG-00E268-2p@xenbits.xenproject.org>
 <54c892eded2b4ebdda8ee1085c383178f44414ad.camel@infradead.org>
 <a3031e7d-fe9d-4db8-8ccd-923165c9af72@suse.com>
 <fc4c45ea86567ef0c46d7e5a20e8abffa75cc4ec.camel@infradead.org>
 <fd993f8d-280f-439a-a6a0-506e2815f281@suse.com>
 <b7323a9fa5239443b9b6f3daa423196de1051748.camel@infradead.org>
 <40734e79-fb55-4712-aae1-3ef350af4f3c@suse.com>
 <f9b4ae8af70b8b5136b59237c7925f57220b3d5b.camel@infradead.org>
 <fc4170ed-d238-4e1c-817e-3695a7112d9d@suse.com>
 <ffea2b8edd4455b8d04a3c25afaaffc98ed40540.camel@infradead.org>
Content-Language: en-US
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xen.org
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
In-Reply-To: <ffea2b8edd4455b8d04a3c25afaaffc98ed40540.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.01.2025 18:19, David Woodhouse wrote:
> On Thu, 2025-01-02 at 15:16 +0100, Jürgen Groß wrote:
>> On 02.01.25 15:06, David Woodhouse wrote:
>>> On Thu, 2025-01-02 at 15:02 +0100, Jürgen Groß wrote:
>>>>> Are you suggesting that you're able to enable the CPU-specific CFI
>>>>> protections before you even know whether it's an Intel or AMD CPU?
>>>>
>>>> Not before that, but maybe rather soon afterwards. And the hypercall page
>>>> needs to be decommissioned before the next hypercall is happening. The question
>>>> is whether we have a hook in place to do that switch between cpu identification
>>>> and CFI enabling.
>>>
>>> Not sure that's how I'd phrase it. Even if we have to add a hook at the
>>> right time to switch from the Xen-populated hypercall page to the one
>>> filled in by Linux, the question is whether adding that hook is simpler
>>> than all this early static_call stuff that's been thrown together, and
>>> the open questions about the 64-bit latching.
>>
>> This is a valid question, yes. My first version of these patches didn't
>> work with static_call, but used the paravirt call patching mechanism
>> replacing an indirect call with a direct one via ALTERNATIVEs. That
>> version was disliked by some involved x86 maintainers, resulting in the
>> addition of the early static_call update mechanism.
>>
>> One thing to mention regarding the 64-bit latching: what would you do
>> with HVM domains? Those are setting up the hypercall page rather late.
>> In case the kernel would use CFI, enabling would happen way before the
>> guest would issue any hypercall, so I guess the latching needs to happen
>> by other means anyway. Or would you want to register the hypercall page
>> without ever intending to use it?
> 
> With xen_no_vector_callback on the command line, the hypervisor doesn't
> realise that the guest is 64-bit until long after all the CPUs are
> brought up.
> 
> It does boot (and hey, QEMU does get this right!) but I'm still
> concerned that all those shared structures are 32-bit for that long. I
> do think the guest kernel should either set the hypercall page, or
> HVM_PARAM_CALLBACK_IRQ, as early as possible.

How about we adjust the behavior in Xen instead: We could latch the size
on every hypercall, making sure to invoke update_domain_wallclock_time()
only when the size actually changed (to not incur the extra overhead),
unless originating from the two places the latching is currently done at
(to avoid altering existing behavior)?

Then again latching more frequently (as suggested above or by any other
model) also comes with the risk of causing issues, at the very least for
"exotic" guests. E.g. with two vCPU-s in different modes, we'd ping-pong
the guest between both formats then.

Jan

