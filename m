Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SaGfAbUOIGrgvAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 13:23:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6575E636FFA
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 13:23:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="H/pVU65S";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1326091.1591530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUjgl-0002UB-Oa; Wed, 03 Jun 2026 11:23:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326091.1591530; Wed, 03 Jun 2026 11:23:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUjgl-0002Tj-Hb; Wed, 03 Jun 2026 11:23:11 +0000
Received: by outflank-mailman (input) for mailman id 1326091;
 Wed, 03 Jun 2026 11:23:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUjgk-0002TY-9I
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 11:23:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUjgj-002ynR-Ki
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 13:23:09 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a200e9a-5cb7-0a2a0a5109dd-0a2a450baba4-14
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 13:23:09 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a200e9d-212f-0a2a450b0019-d155dd2fdd72-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 13:23:09 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-45ef779c1c2so3474425f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 04:23:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2dc294sm10564442f8f.7.2026.06.03.04.23.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 04:23:08 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780485789; x=1781090589; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rZXiM/cRgHFLw1WO+ko+u3xv60vgIIrlBb1bP0Nw9xM=;
        b=H/pVU65SXULSVl2/JedZxXLAbEHxx4UYpZg/ZhFAPSvhg1vDDvKPJxGQ94ZxMI71Zm
         /y6sAlCk5Qs+lqprKqBvNjxA3hfaA16KqPzJPf5n+J1qwEWdaq/QIN+I1BcaonedOBqC
         s8Vm10LY7n/67PlnlEbZXKSGS/RIHAY+ZXC8GZUTxSk10v3hvVv130QK+s8cmVbdulSR
         e4r6fFMmkx7UB+KckOb/eor26v2Yu0dZsMjPh6fRuDOGIhRq3b7QWFtuogep40dr33tx
         I04XXZMDM00Qy+AcodrTNBvw7VCWhg8aD1t8R78tuNwZh3sh3btTlBD1XNhV6OgI7rFo
         xAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780485789; x=1781090589;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZXiM/cRgHFLw1WO+ko+u3xv60vgIIrlBb1bP0Nw9xM=;
        b=faBWjSdJWyd25fofnNGugserG2aTC2UIp1L3oPxKP1D6TyDM5489JNHGXNlF0bhxoa
         ln7D2X/Mn4/rkxHqRbgQsJIn+ftI2PvfGgrA+A4mvv2fMsN0bYNwwn/46h7zfx62TTWt
         kJEZl8bOzoZecM2h6HPeclhUQj5TERNp35CqbYGlIFDO8hrzqIL0cc/Ams9n2+MmLdos
         L0halN6rzNVlSbtmt+xyUzkAVGtTy1N4j6Kmp22axULgtp2xUB/l+m6qKvdg6tHhzthn
         As2zM63v6EbfoRo6RGq86EiFtsgXHLbuEv6IcGSPbO4i0Hrq5Gq28Hjd56m1OkfWIwIO
         IiYw==
X-Forwarded-Encrypted: i=1; AFNElJ/nOHvlEVnYUDtajgAQYClRJ8MRMoyGPc6W7nQJF354YAgJl4SiVtV5YDdCAFsnMbwQvOmt+rMO7Tg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywfr7uStYHRR3YKDpPfPiHs0ZHkVtlMx+LcG6UDftYOsmzCRHtE
	FfCT4AxpFEcHQfjm8oZvFiU01jAo5Y9SSGU5cCnF5uSJjMPd/J+HXTkaQ1C1cDIYoA==
X-Gm-Gg: Acq92OFpDvaLsWfYb57lxt7+z/qhh1DCmZOjliyPyqRt/8DotVv0ikSnLbA947pNK1d
	xbjoEP9Kv1fo3KAzf/88dWaGiGEgs039OLQ99EiZdtkyKCuzV69pp4LtEydSxRMoglseZK1WNDp
	g30vRMMZCY4n7t+5MRHgiAHyIAq4SUGt5wv+KIpjrE6SACDyulujqlh3dVLV/wel5xz84OzVVcz
	UNHWwxFqxV3fOkeZOI4HFcJxCuPLwn9UsMSNG76D1woA5cBt16Vu11VaF3dBGXb1t0tDkQtwj5+
	QU8eDeXkKAyDmNEcj1tps37l5/FysmEemgOiObDhxfuhDVVsVxrdY3Rmr/0rGTl95AxjemW1Xcs
	zfMUj2JZ6gfDNdq8kIqO5eZEosbnhD/Z0nq4f0DRxF3OJbdiAqQrVyGL53hb0jnnM/iASKqwLUp
	y7DeWzo6+F63qrctIQfmjtEsCGevN7A+JS32KrCfUjQiBT5vYcVX2DeHR+bD6z9/VQ10PKxa0tW
	cqX80s0dRIyQFWL1eKdJlGYIw==
X-Received: by 2002:adf:f743:0:b0:460:1643:caf7 with SMTP id ffacd0b85a97d-46021849210mr2837122f8f.27.1780485788725;
        Wed, 03 Jun 2026 04:23:08 -0700 (PDT)
Message-ID: <dc622455-c20f-4b8a-8c80-1e4c0143e8e0@suse.com>
Date: Wed, 3 Jun 2026 13:23:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen/domain: fix UBSAN null pointer dereference of
 d->shared_info
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1779712171.git.oleksii.kurochko@gmail.com>
 <04dd784b6b9a4dfca9a313ea8802d8d514d65021.1779712171.git.oleksii.kurochko@gmail.com>
 <3aef7763-aea3-496a-8c18-d3659f590373@suse.com>
 <fb1b1194-5855-49d9-99fc-d35a3038833c@gmail.com>
 <3eb9ab3d-dc4d-4019-89c8-9f7dbdc528cd@suse.com>
 <9ae22210-6dd5-43e3-918e-f68b1294448d@gmail.com>
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
In-Reply-To: <9ae22210-6dd5-43e3-918e-f68b1294448d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1780485789-19D6FF3B-FACBC668/0/0
X-purgate-type: clean
X-purgate-size: 3581
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6575E636FFA

On 03.06.2026 13:05, Oleksii Kurochko wrote:
> 
> 
> On 6/3/26 7:54 AM, Jan Beulich wrote:
>>> --- a/xen/common/event_fifo.c
>>> +++ b/xen/common/event_fifo.c
>>> @@ -562,9 +562,10 @@ static void setup_ports(struct domain *d, unsigned
>>> int prev_evtchns)
>>>
>>>            evtchn = evtchn_from_port(d, port);
>>>
>>> -        if ( d->shared_info &&
>>> -             guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
>>> +#ifdef CONFIG_HAS_SHARED_INFO
>>> +        if ( guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
>>>                evtchn->pending = true;
>>> +#endif
>> While as per above shared_info() would best not exist when !HAS_SHARED_INFO
>> (in which case #ifdef may be unavoidable here), an alternative where
>> IS_ENABLED() could be used here may want at least considering. E.g.
>> causing a link-time failure when shared_info() is used (and not compiled
>> out).
> 
> We still want here to have #ifdef instead of IS_ENABLED() as 
> shared_info() shouldn't exist for arch without 2L support so it will end 
> with linkage error.

I don't understand this part.

> Considering that setup_ports() will be called for 
> such arch we have to avoid this part from compilation.
> 
> Alternative is that considering that I suggested in prev emails to 
> introduced stubs for arch which doesn't use 2L:
> 
> +#ifndef CONFIG_HAS_SHARED_INFO
> +static void cf_check evtchn_none_set_pending(
> +    struct vcpu *v, struct evtchn *evtchn) {}
> +static void cf_check evtchn_none_clear_pending(
> +    struct domain *d, struct evtchn *evtchn) {}
> +static void cf_check evtchn_none_unmask(
> +    struct domain *d, struct evtchn *evtchn) {}
> +static bool cf_check evtchn_none_is_pending(
> +    const struct domain *d, const struct evtchn *evtchn) { return false; }
> +static bool cf_check evtchn_none_is_masked(
> +    const struct domain *d, const struct evtchn *evtchn) { return true; }
> +static void cf_check evtchn_none_print_state(
> +    struct domain *d, const struct evtchn *evtchn) {}

This set can be shrunk. For example, the same stub can be used for
clear-pending and unmask. For is-pending and is-masked, considering
that the precise return value shouldn't matter, a single function
(returning false) would likely be good enough as well.

> +static const struct evtchn_port_ops evtchn_port_ops_none = {
> +    .set_pending   = evtchn_none_set_pending,
> +    .clear_pending = evtchn_none_clear_pending,
> +    .unmask        = evtchn_none_unmask,
> +    .is_pending    = evtchn_none_is_pending,
> +    .is_masked     = evtchn_none_is_masked,
> +    .print_state   = evtchn_none_print_state,
> +};
> +
> +static void evtchn_none_init(struct domain *d)
> +{
> +    d->evtchn_port_ops = &evtchn_port_ops_none;
> +}
> +#endif
> 
> For arch without 2L supports .is_pending() will return false we can just 
> do the following instead of ifdef:
> 
> -#ifdef CONFIG_HAS_SHARED_INFO
> -        if ( guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
> -            evtchn->pending = true;
> -#endif
> +        if ( evtchn_is_pending(d, evtchn) )
> +             evtchn->pending = true;
> 
> Would you be okay with this approach instead of ifdef?

I can't really say ahead of seeing the full result (and without it being
made clear why FIFO ops can't be put in place right away, with perhaps a
few small adjustments to the handlers). While this isn't going to be
used for x86, introduction of new cf_check functions always worries me,
at least some.

Jan

