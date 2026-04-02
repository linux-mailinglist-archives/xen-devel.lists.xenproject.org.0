Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCEVIVAtzmnIlQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 10:48:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A3038644C
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 10:48:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271323.1559535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8DiW-00010G-R9; Thu, 02 Apr 2026 08:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271323.1559535; Thu, 02 Apr 2026 08:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8DiW-0000y0-OP; Thu, 02 Apr 2026 08:47:56 +0000
Received: by outflank-mailman (input) for mailman id 1271323;
 Thu, 02 Apr 2026 08:47:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w8DiV-0000xu-Hu
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 08:47:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8DiU-007MfG-SW
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 10:47:54 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ce2d2c-bab6-0a2a0a5309dd-0a2a45058858-34
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 10:47:54 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ce2d3a-3760-0a2a45050019-d155802ca8c1-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 10:47:54 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso18173545e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 01:47:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887eb5aff3sm248494055e9.15.2026.04.02.01.47.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2026 01:47:53 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775119674; x=1775724474; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+/dIpSUX6m9AHy1yu7JbuA+PtyXNUucVXR5mC8rj3HI=;
        b=JhfeVGDSgVz3cpPBJV8zYTqfBG6reeVoEghPU84RUHqR4PzswF1bU5ffoG92QB/kGR
         Brk01gVjJuDJMy5YDSQ9gc0Mb2aagWR96+5aAxtcNk0Uk3sCAf0uNBaUOEFozps4ARLV
         fdqBeZDnkrSGOdwkXHHcFe1L+ioH76/Mus9W39hVkSxX9CvT0KHD4pCWhHc9wuCSgyyE
         FJN9KhYWPtIzqeSl1+RG+lE84ItM68i9CCkP50+Q46OKDFJeCk01w2X8Q3VFLRsT7eni
         NPP+/NDwidtRmYqUjTFvCafoTlQRexB1n0P8QAARSB/rgrqr9CIb/5CWKt3kQXeI6UPZ
         Dw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775119674; x=1775724474;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/dIpSUX6m9AHy1yu7JbuA+PtyXNUucVXR5mC8rj3HI=;
        b=TQoaUG+M+JPZ4xSXb7Ic15HeTD8V9BYoNOw/wQ5PKr98K3jUrKl7P5fdFXxRWlpdci
         2Iw1TUduUwVVoxGXzeDBKcwm67PrUoeCSF6GsNDiztgOxKJ2ROfbLAKi/mfPV71kJWt0
         pIGsxgfoktjibUclA7aP7+JNnK4mzWv611DuwrOjkRfSSKU2MPByOfWdbxUlCv6So37z
         kXwhD3XqT3brfzL7fnbiu+pFeV7L9o4MRBMz1YGOrfH5K71QaV+wHSK0dqMSnB9TxvzT
         hUatLyPvZ+lEr1XqUxuE82Zq+d7q5arFETUOlcr1dtRTqJAtxucYZqvkxsqE5Q1wOwyQ
         Obow==
X-Gm-Message-State: AOJu0YzL3s6o1v6UhLwEYrN3BJ38TLnLj++laSxfPyBXzsASsLAgIdvR
	ZqW+YQRY0UbIioIwA1Lrvil0/GjLVsf5KL3D4nP8AJs8lAKRF4B+h7JZXorQXYSnsg==
X-Gm-Gg: ATEYQzwEL7/q4yrzgVFQTjxYROHdX+fCPpEiIqQb9IwadrjPnswMnisbQ9bbOP1x1Yn
	nm4+FCmbqAbm096JnPByO1njL6mdQQKL5lXZMKxC4d/4d6S65vQNbHut9YdgzFlhvs9yVzFy/qb
	RwwzKxcqAz9oSauWo6XLpXaREp4FH4l8EfOFaU+hGrHZ+HrPb0k57FMkOVilFsmRbruVfGev+Cw
	CLWI7f+88aEvxf93s+3U00xYDcqHIcZNGRYtmoAzUtkqh/+3XyTzPX7xaOXVOWVA2NDQH++QTIO
	rzzdfi83KjALrsfPn6Lq6i9wJ4HXbJlJFdu5PlRx43T93KJZQw1+n/eMVZjhGL9ipNOyqCwt/20
	INZ63V19eQ5QPD+ZKJ4vU9ODpKnG7WtTCot87uGh/Vu0Z4yDjFt7YqkT8LgDvC6SSjKQ9WBER3F
	13cCXEeuAkVxV2LXb/d1EzxIOEXjkg29/Ma00dQWuPnryPTduZ9CJkRodt+WOOKcR6MsPg7/fHn
	UTrWYPkY6gaqcw=
X-Received: by 2002:a05:600c:3b0a:b0:486:f893:56c6 with SMTP id 5b1f17b1804b1-4888e09ba82mr21701295e9.10.1775119674150;
        Thu, 02 Apr 2026 01:47:54 -0700 (PDT)
Message-ID: <97bfb299-a465-48a3-a036-f217de683c2c@suse.com>
Date: Thu, 2 Apr 2026 10:47:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: IOMMU faults after S3
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <acZZmGXIJlmN3KGm@mail-itl>
 <e8bbaae2-5cff-4549-9f27-fbbda7346f60@suse.com>
 <090b8b8f-141b-4a24-92eb-879c0a0c73e1@suse.com> <ac2nibFfvGm_7elv@mail-itl>
 <933a3e95-33d2-4e20-a4d5-2d8b20c2da7f@suse.com> <ac4kCq87SQSc6ddV@mail-itl>
 <aa6910f1-365a-4534-b229-9730b3aede02@suse.com>
Content-Language: en-US
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
In-Reply-To: <aa6910f1-365a-4534-b229-9730b3aede02@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1775119674-3153B96F-47482C8D/0/0
X-purgate-type: clean
X-purgate-size: 925
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E8A3038644C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 02.04.2026 10:39, Jan Beulich wrote:
> On 02.04.2026 10:08, Marek Marczykowski-Górecki wrote:
>> The xl dmesg output (from MTL this time):
>>
>>     (XEN) [  123.477511] Entering ACPI S3 state.
>>     (XEN) [18446743903.571842] _disable_pit_irq:2649: using_pit: 0, cpu_has_apic: 1
>>     (XEN) [18446743903.571856] _disable_pit_irq:2659: cpuidle_using_deep_cstate: 1, boot_cpu_has(X86_FEATURE_XEN_ARAT): 0
> 
> XEN_ARAT being off is the one odd aspect here. That'll want tracking down
> separately. As per xen-cpuid output (below) ARAT is available.

For this you may want to also add logging to intel_init_arat(): Since opt_arat
can be false only due to command line option use, it can only be the function
not being called (which looks impossible on plain staging code), or cpu_has_arat
being false despite the xen-cpuid output that you supplied earlier (inexplicable
as well, at least for now).

Jan

