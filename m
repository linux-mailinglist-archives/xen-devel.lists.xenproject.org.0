Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILohNntJzmlRmgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 12:48:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7BE387E52
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 12:48:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271638.1559758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8Fb1-00026U-0f; Thu, 02 Apr 2026 10:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271638.1559758; Thu, 02 Apr 2026 10:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8Fb0-000246-Ss; Thu, 02 Apr 2026 10:48:18 +0000
Received: by outflank-mailman (input) for mailman id 1271638;
 Thu, 02 Apr 2026 10:48:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w8Faz-00021o-CY
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 10:48:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8Fax-004mWN-7H
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 12:48:16 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ce495b-5cb7-0a2a0a5109dd-0a2a4509bee0-48
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 12:48:16 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ce4970-bf79-0a2a45090019-d1558029dc9f-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 12:48:16 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-48557c8ad47so5649975e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 03:48:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e83682fsm206263625e9.7.2026.04.02.03.48.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2026 03:48:15 -0700 (PDT)
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
        d=suse.com; s=google; t=1775126896; x=1775731696; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8RfkRDBqm7zGX7zPvUe+Ek39HXEMr1cOqSz99rC/mTI=;
        b=AKSAI+N3uLbpruU1DInvyOw7hcnYFzD1tyvAKA0CqY6U88xpCNRbquk63GKFHsRx6T
         9o6X2kveuEqWMJRm0HVn7YMPJVMs5evmoAlGEHzvuiay4D1q2a+uFn7D4YOI2nBrdvap
         vXo8/CUOQp6DOLBjg0OtDo944izwkQdLktnCIpoqn4ESt1YvM0U5JUy4q+H1Ej2BKizb
         /CypNk9QuN2dWXVKD5Veic0et+p4XgFEomNBwLGIZsm5/ena08M0uevdrvbJBJeOl/xu
         fOw0CI/ySD9hehADpLhMy2CDssfl+CIP1Ol4IrImedcOuQp6XDVWDCnWGf7xYXAefRzp
         2UAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775126896; x=1775731696;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RfkRDBqm7zGX7zPvUe+Ek39HXEMr1cOqSz99rC/mTI=;
        b=g14wHvJXC378GSiL9HZHeTZXqzbFVNH0EVSHlOoYnu+dFUrJp+ZEuU7dzRVmwFK78W
         xBBC2sAPmjj5DNTjnC3/rKpGV3QPqdVWocUNbeEk1kR3U3TXg/CT4Zs9ZiCbxWiHfP7d
         1d17CcUyOkoNMRsjDPRX9uztWVkbjwG+hdfMBDEE8QO5lXxgbETbEoEImO7Xot5Sr1FR
         Abrqvkxcft+tNnBGcPe9EFTW/IEqQ2jcZJBpNS7TtsyrHRGQQ7ncNgBL1IodUy/d5d3r
         nCl2rHoDN+IsyaLUQzcloRoJxSfV+sANqvmf45KJ3vnIFDx+sx8zYpgsPui3kkVv84YV
         zT0g==
X-Gm-Message-State: AOJu0YyKxgv2lQ3l6uloivI6Uvp/RXNVql/2+yk2zHpOLMPzz1c/DQS1
	+sd163y9cXRHqbBMQOeGd6P9zya4qUQCWkDDiH0PEuRZ8RyLlDwnRUJHUksWzJZhiA==
X-Gm-Gg: ATEYQzzTRH809i6eh2uIAaX3SJ/12Q1oHCdyE6I1jtjUb1joIwI5yVWW4YVJuSldOvQ
	oiwWSnY4tZhPZ+ukdTKyMPp2OWWgEgBA419v43nk3ha9ulDYBbiADnvYRI7690XrOLcyurUD+iH
	FFoZ0bo04AIukWDZVp8T5XCJdZcZuq9LKqUqvBHXYIir5jnnmakHjV6DjMUVAmObhsbHWD7gnDz
	kztx3nch8mpYOO98MlI5JdPHbrL4/3mUatzAhyUp1g4OR8mYGFTRMjmsP4cGKOujU2GlTHiFr9t
	65ywdlrdGv2wJwxtRyIakYWUwDTmJ0XOVpqVhds+a72XqBSKyU+75O7bCXwNRTqNfwigp0jwUR7
	gzIp9G47VllL8LDRuoqx21Aqvc008Jj+lRHupFYmN8bzgI5/jQrlJhmrag+FRXb+hTxiOs93wbp
	HlXWRHtlQWU5eY7Bff4qUMH+7Rg4PQ9Nr8nfR+tPH9x4JLsdfgz9UKHM2uKghC4mcoCLSStdmun
	VdsTm1jzyKEPgEeMLG09wW5jA==
X-Received: by 2002:a05:600c:1389:b0:488:9439:881a with SMTP id 5b1f17b1804b1-48894398b65mr3879265e9.2.1775126895921;
        Thu, 02 Apr 2026 03:48:15 -0700 (PDT)
Message-ID: <2caff339-4ce9-42ea-9b78-afeac42b6f0f@suse.com>
Date: Thu, 2 Apr 2026 12:48:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: IOMMU faults after S3
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <acZZmGXIJlmN3KGm@mail-itl>
 <e8bbaae2-5cff-4549-9f27-fbbda7346f60@suse.com>
 <090b8b8f-141b-4a24-92eb-879c0a0c73e1@suse.com> <ac2nibFfvGm_7elv@mail-itl>
 <933a3e95-33d2-4e20-a4d5-2d8b20c2da7f@suse.com> <ac4kCq87SQSc6ddV@mail-itl>
 <aa6910f1-365a-4534-b229-9730b3aede02@suse.com> <ac44SVW1cPhKYFKU@mail-itl>
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
In-Reply-To: <ac44SVW1cPhKYFKU@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1775126896-55752152-FB4D72CC/0/0
X-purgate-type: clean
X-purgate-size: 2289
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 5A7BE387E52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 02.04.2026 11:35, Marek Marczykowski-Górecki wrote:
> On Thu, Apr 02, 2026 at 10:39:41AM +0200, Jan Beulich wrote:
>> On 02.04.2026 10:08, Marek Marczykowski-Górecki wrote:
>>> The xl dmesg output (from MTL this time):
>>>
>>>     (XEN) [  123.477511] Entering ACPI S3 state.
>>>     (XEN) [18446743903.571842] _disable_pit_irq:2649: using_pit: 0, cpu_has_apic: 1
>>>     (XEN) [18446743903.571856] _disable_pit_irq:2659: cpuidle_using_deep_cstate: 1, boot_cpu_has(X86_FEATURE_XEN_ARAT): 0
> 
>> Hmm, but what you didn't log is whether __hpet_setup_msi_irq() actually
>> succeeded everywhere. (And if it did, also logging HPET_Tn_ROUTE() values
>> might be a good idea, if only to double check.)
> 
> Updated output:
> 
>     (XEN) [18446743899.720395] _disable_pit_irq:2649: using_pit: 0, cpu_has_apic: 1
>     (XEN) [18446743899.720409] _disable_pit_irq:2659: cpuidle_using_deep_cstate: 1, boot_cpu_has(X86_FEATURE_XEN_ARAT): 0
>     (XEN) [18446743899.720420] _disable_pit_irq:2662: init: 0
>     (XEN) [18446743899.720431] hpet_broadcast_resume:663: hpet_events: ffff83046bc1f080
>     (XEN) [18446743899.720579] hpet_broadcast_resume:674: num_hpets_used: 8
>     (XEN) [18446743899.720587] hpet_broadcast_resume:692: cfg: 0x1
>     (XEN) [18446743899.720599] hpet_broadcast_resume:697: i:0, hpet_events[i].msi.irq: 122, hpet_events[i].flags: 0
>     (XEN) [18446743899.720612] hpet_msi_write:283: iommu_intremap: 2 (iommu_intremap_off: 0), HPET_Tn_ROUTE(ch->idx): 0x110
>     (XEN) [18446743899.720638] hpet_msi_write:287: iommu_update_ire_from_msi rc: 0

So it succeeds, and the low half of HPET_Tn_ROUTE also looks plausible. The high
half is, however, the address that the low half value is written to. It's hard
to imagine that it would be zero when the low half isn't, but it is about the
last thing I can think of which could explain observed behavior. (Yet then, all
of this is pretty meaningless; see below.)

> And the current debug diff attached.

Hmm, you log HPET_Tn_ROUTE _before_ our update. That's not very useful. You want
to move that part of logging to the bottom of hpet_msi_write(), or maybe to
where you also log the per-channel cfg value in hpet_broadcast_resume() (thus
making the logging overall less verbose).

Jan

