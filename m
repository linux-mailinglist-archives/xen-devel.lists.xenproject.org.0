Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNjmIpEi1WnK1AcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 17:28:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F633B0F8C
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 17:28:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275135.1561097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA8LV-00074V-CZ; Tue, 07 Apr 2026 15:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275135.1561097; Tue, 07 Apr 2026 15:28:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA8LV-00071y-9H; Tue, 07 Apr 2026 15:28:05 +0000
Received: by outflank-mailman (input) for mailman id 1275135;
 Tue, 07 Apr 2026 15:28:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wA8LT-00071q-JZ
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 15:28:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA8LS-00Gkd9-Vq
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 17:28:02 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d5227b-e002-0a2a0a5209dd-0a2a45018380-16
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 17:28:02 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d52282-6fc9-0a2a45010019-d1558032dd36-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 17:28:02 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4887f49ec5aso70240885e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 08:28:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4889f6843dfsm364034885e9.12.2026.04.07.08.28.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 08:28:01 -0700 (PDT)
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
        d=suse.com; s=google; t=1775575682; x=1776180482; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TLQeQCqk51d66U/YlA7wjNVsLDdjqDkwNcQb+H0Wc2s=;
        b=CKkOnM8v5XkBxNyyINwho+xL6YynMqguKRqr9jzojsSaQU1ITZpsJ1Vi+Bn7L2t8BQ
         tQ/7ZaU0l7859HPe5BaVh2drZlS6LidAzdhBDM+bhXKJns3a1V7qAcUOV1q4WhWSGrJl
         Bz6GsefRSUnDJsZ7QajAVB9LMj/8tUgTDhXhqOCuhEko3B1Q3TBL2NufPthuaa9omxfp
         /hrIeTh1ppx52ZMRwcdwwDWq9IwjbwCfXgKCRxqwymlPmsZe+lv0UxhRQWhRcNATsAzn
         jejxvOnsmXupCOyk3KY8sFCCqhgsVWi2uL/OG1W6peU4841apxpUCQTQ5WqGhe6ni1Kc
         C/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775575682; x=1776180482;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLQeQCqk51d66U/YlA7wjNVsLDdjqDkwNcQb+H0Wc2s=;
        b=ozP0ADABwkWA5ypWEbxAsX9eqjj74dKyLsU2p0aNVNr0ZMRjTeqNzQazQDHDFf9iSq
         Aw1OMd6FACwhhWIKgcxWccvgimhfmT8Q9cxVAdnVX5rZolgGE7A3FEBDxA3+2Fa89zZh
         4Y10X6NlUDB7cOhhubMrNJfD831on9DxUboebVYTDbRXHgRhfehnn90jMGUNHgpFp8Sa
         gXvAqwwo7wBKzikaDUK5F3cw/AZ1i0dvbX/nAiAGsTdJDc+gHW6TyY18F+K/2yAZpZMJ
         cnyz/Vgidf0BD2WaO/0LnR2ZzAjHSJ0j35vlpN8mdCgOkJYDjbE22ouW5iTXuKxCET49
         6OTw==
X-Forwarded-Encrypted: i=1; AJvYcCVQRd+xoeR2Tw5uwDkpk6HBops/LA5IjGJDr+ECrmBkDonqjjEOo4DlkJa8GoTUcCXV/+Swpx0WqmM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6OlaCsu0LbCYudgtQ1zXTLeZtZJxdqH0yXRpFv/VfNTfc77rV
	8l5+6K58kAVyhKhQuRqVo62jfE9M/JHsKYZBfKIt1A+2i7Zs/KJ6bxuNGfIZR5x34A==
X-Gm-Gg: AeBDietSrKPmaAmCxNaarI79uHYS7Pu6ldUI90UP/vJl/N8BQWqXJUeF4U3DyjurEfA
	zDIFJyDpUKcBwD5DHezS9GWmBpmpgpuWNslEpUfFocJF9kgD2wH/WlZlpPploUu6dmsJqnTSAAg
	F2nynqtA3cHZgwkcuv1/B3yCvT8oes3NBk+3th/1Tc9lv2pdBKwYt2LN9dASHuiReVJWC0tZtjy
	+T2iRlEKuNkowUqxyafJcwK6hpAgkZgktC2udn+2BW/qCSIEAoJga0pQQghQBF3/TFs05rk6wOt
	i9rkGndM7qjTWTk0+quGaFpO42Xv1uAkEmPctRl1RXlRAhj8ocgzTwc7d2UtPRonRzd4Ptet3J9
	klYrsNkCoNs5eFhE72EL1qC50WHbDthZLUoTy/RFXK6UWjCYOT1AHDNV8XgAptclGGuzqui0sbb
	oTG+UOziKoCfX+rc3cE0YdwLCfzp5CbvFvdGHR9SywfOQbj/m4+5u9We5+VtizZRuoeEKVckfor
	tlXg1hD6h2xiU0=
X-Received: by 2002:a05:600c:1553:b0:488:acbc:b2e with SMTP id 5b1f17b1804b1-488acbc0ca8mr125122075e9.17.1775575682233;
        Tue, 07 Apr 2026 08:28:02 -0700 (PDT)
Message-ID: <7411dd6c-5790-479a-8c13-51c3cd2e72d5@suse.com>
Date: Tue, 7 Apr 2026 17:28:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/HPET: channel handling in hpet_broadcast_resume()
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 xen-devel@lists.xenproject.org
References: <a77822d8-08f4-4c4f-b291-cc44a213cf9f@suse.com>
 <f1d850c9-e544-49a7-922a-dedce7b8c306@vates.tech>
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
In-Reply-To: <f1d850c9-e544-49a7-922a-dedce7b8c306@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1775575682-BCB64185-4B92CA64/0/0
X-purgate-type: clean
X-purgate-size: 2228
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
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
X-Rspamd-Queue-Id: F1F633B0F8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 07.04.2026 16:28, Teddy Astie wrote:
> Le 07/04/2026 à 15:35, Jan Beulich a écrit :
>> The per-channel ENABLE bit is to solely be driven by hpet_enable_channel()
>> and hpet_msi_{,un}mask(). It doesn't need setting immediately. Except for
>> the (possible) channel put in legacy mode we don't do so during boot
>> either.
>>
>> Instead reset ->arch.cpu_mask, to avoid msi_compose_msg() yielding an
>> all-zero message (when the passed in CPU mask has no online CPUs). Nothing
>> would later call msi_compose_msg() / hpet_msi_write(), and hence nothing
>> would later produce a well-formed message template in
>> hpet_events[].msi.msg.
>>
>> Fixes: 15aa6c67486c ("amd iommu: use base platform MSI implementation")
>> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> ---
>> As to the Fixes: tag: The issue for the HPET resume case is the
>> cpumask_intersects(desc->arch.cpu_mask, &cpu_online_map) check in
>> msi_compose_msg(). The earlier cpumask_empty() wasn't a problem, as
>> cpu_mask_to_apicid() returning a bogus (offline) value didn't have any bad
>> effect: Before use, a valid destination would have been put in place, but
>> other parts of .msg were properly set up. Furthermore we also didn't clear
>> the entire message prior to that change.
>>
>> Many thanks got to Marek for tirelessly trying out various debugging
>> suggestions.
>>
>> --- a/xen/arch/x86/hpet.c
>> +++ b/xen/arch/x86/hpet.c
>> @@ -685,12 +685,18 @@ void hpet_broadcast_resume(void)
>>       for ( i = 0; i < n; i++ )
>>       {
>>           if ( hpet_events[i].msi.irq >= 0 )
>> +        {
>> +            struct irq_desc *desc = irq_to_desc(hpet_events[i].msi.irq);
>> +
>> +            cpumask_copy(desc->arch.cpu_mask, cpumask_of(smp_processor_id()));
>> +
>>               __hpet_setup_msi_irq(irq_to_desc(hpet_events[i].msi.irq));
> 
> We can directly reuse "desc" here since irq_to_desc(...) isn't supposed 
> to change value with cpumask_copy().
> 
> i.e `__hpet_setup_msi_irq(desc);`

Oh, indeed - how did I not spot this?

Jan

