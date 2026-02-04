Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJogOcv8gmm6gAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 09:01:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C835E2E44
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 09:01:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220168.1528879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnXod-0002Wi-Ce; Wed, 04 Feb 2026 08:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220168.1528879; Wed, 04 Feb 2026 08:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnXod-0002Ul-9V; Wed, 04 Feb 2026 08:00:47 +0000
Received: by outflank-mailman (input) for mailman id 1220168;
 Wed, 04 Feb 2026 08:00:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnXob-0002Uf-OG
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 08:00:45 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9acd1c0e-019f-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 09:00:43 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4801d7c72a5so50472245e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Feb 2026 00:00:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4830fe567b4sm19199035e9.5.2026.02.04.00.00.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 00:00:40 -0800 (PST)
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
X-Inumbo-ID: 9acd1c0e-019f-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770192043; x=1770796843; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hIoODnV6yK+3p8/aQj2ERCJXNed18iavaGUaPTnhxfc=;
        b=BcRQExzRMgHzJKINcJynHBZVWHMEBxJPf4nK5AWOs0hOV0f/Sa/RYQh412Nj7d8vxF
         pf+hDToGMWv3i7oQtcCYiEOALRbV2iaBluvSs25V8WAejF83CDlfF2Ppgm4YJtv+sMn+
         MV2vBxMkvjSVAkgk/7nsGpTRvx9vLeKOY8rx9hXB2t2EcBiRmPtHNsTT2srIE+iMrBOr
         FdiAQTQd52bijFNYEBTf9dcPS3jTsJTn2208+syrT+zo+MDNXHnYTQMy8yf+wpzDXVVj
         bG1quyNbWLU/uefrpdkAryF+sPUDgh5VLUH+oT0G10jFZ5PijQOc2fU2QpowT7E5X2QX
         fBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770192043; x=1770796843;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIoODnV6yK+3p8/aQj2ERCJXNed18iavaGUaPTnhxfc=;
        b=Q3evyH/ij2sPLlhPQ9VKVXjGC9fC69j9J+CdjYrFWzx+c5bgtZJCHO0uMeSd7ys43T
         p8jSlHs1fWE1Wg5zK77K0HAQVFDIF+QJLa+v6uXcNuqLLq8w5RqsihK26riPbKgdWebi
         iATVGC5Yga8NWbuon5/OC8KQoQqculVXYdqvmIpC647FSXkYQWPaRsbh0XSdqeBfwt2O
         SCHZ1R0ldQxJurIWtVBJcykWK3dgd+U6Lv9WxSXNJ7d58j9PxQk5/XkkCmSRXY8Ftgeg
         er6E7q3lPoFK3jx/p2+d+PfMljJTSai3zrgJFDz7Yob49O9mMOR+YuxAiK6NIOOi6ifI
         QUqw==
X-Gm-Message-State: AOJu0YwFfOfizITKNhghYpycs9Ga3jea8yxEtzV8UcD6lVoCmnh/p2DB
	3rJufeRCqc0M51ECTHyZl90ZwvDbfS/fIrkPH+MyaCHbfL+2YZrWbV9WQ/SoYBl7Ug==
X-Gm-Gg: AZuq6aI/tnfZGbkwhrN6CXPM79e8m4yR3RruVRcbXeH+LVnnWYShn8dg13AEYplaVYv
	fx3mSWCSkHZE2iAs+6uDFmlH7DC8Ha+K5yLjlQRfsYKTfFwF7vqbyVMmNs/2veHfzTGq0SCbUCp
	dJcYTcP6TzjTAygveFPrDpTNnvmfjIKBKqcQMqCuAC3eMXa4vlBMNNlK5IhQgSvVlZ1vGZYlzlN
	qUyVwvbLEthTH8hoHzM5X2PBjdpGZhbUz4O199F5HOF2dHHzyDSualX7AMF904uHHFKNCC7jLUU
	k6g8RtLRpRhphI2AS6x70dxSqkEQS7PSI6dWdmHNZTd3FS3XHrx6DkmuZ7A0FpvZrACAdA71Hlb
	qauTq+P0MJ7ex5Nvpqs1zp7tt7uXskUYx0Iqsk6+klikKFzwv6+iLm7buV5Ix7EyMnWWb6Md2D9
	PiQ+FpuGVYX9eLZdiSFy4+tfn3PY4+dWyLc6y/P0Z7h6mLq8ryiGDaYHUczv0PR9T2saU/utfI7
	DY=
X-Received: by 2002:a05:600c:34cb:b0:47e:e779:36d with SMTP id 5b1f17b1804b1-4830e96d019mr24044885e9.23.1770192042734;
        Wed, 04 Feb 2026 00:00:42 -0800 (PST)
Message-ID: <9675c989-3f25-4d8e-b16d-0fb27436ce1d@suse.com>
Date: Wed, 4 Feb 2026 09:00:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/P2M: correct type use in p2m_put_gfn()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <1ecefc98-f1c2-4116-95bf-a86c3b066843@suse.com>
 <aYL2yt0g8HGdpOTA@Mac.lan> <40707659-0365-469d-ac29-2b558d423b24@suse.com>
 <aYL7UPA6X4xoBKjT@Mac.lan>
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
In-Reply-To: <aYL7UPA6X4xoBKjT@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5C835E2E44
X-Rspamd-Action: no action

On 04.02.2026 08:54, Roger Pau Monné wrote:
> On Wed, Feb 04, 2026 at 08:49:53AM +0100, Jan Beulich wrote:
>> On 04.02.2026 08:35, Roger Pau Monné wrote:
>>> On Tue, Feb 03, 2026 at 03:01:27PM +0100, Jan Beulich wrote:
>>>> ---
>>>> Easy to spot by adding ASSERT(!gfn_eq(g, INVALID_GFN)) to the respective
>>>> macros. While imo that should be a correct thing to do (as with
>>>> hypothetical split locks a valid GFN would really need passing in, in
>>>> order to be able to figure out which lock to use), we can't do so right
>>>> now: The lock is acquired ahead of respective checking in a number of
>>>> places, e.g. in p2m_get_gfn_type_access().
>>>
>>> Could we convert those macros into static inlines?  It's dangerous to
>>> use macros like those when the parameters are dropped, as the
>>> parameter is not evaluated at all.
>>
>> It is. Seeing how the header is used, converting may be possible. There's
>> one slight concern I'd have with doing so: It would move us one step
>> closer to giving the impression that the arguments passed are correct at
>> all use sites (while as long as they're entirely ignored, that's kind of
>> a hint that they may need checking). I can't point at it right now, but
>> I'm pretty sure I had come across at least one place where they're pretty
>> clearly wrong.
> 
> Well, having at least the type check is better than not checking
> anything at all.  By clearly wrong you mean passing INVALID_GFN, or a
> random GFN that had something do to with the context?

What I seem to recall is a bogus order value being passed somewhere.

Jan

