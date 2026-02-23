Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qxFPGvcMnGly/QMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 09:16:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD570172F82
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 09:16:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1238480.1540085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuR7O-00032h-VY; Mon, 23 Feb 2026 08:16:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1238480.1540085; Mon, 23 Feb 2026 08:16:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuR7O-00031B-Si; Mon, 23 Feb 2026 08:16:38 +0000
Received: by outflank-mailman (input) for mailman id 1238480;
 Mon, 23 Feb 2026 08:16:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dhnJ=A3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuR7N-000315-9A
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 08:16:37 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f81972e9-108f-11f1-b164-2bf370ae4941;
 Mon, 23 Feb 2026 09:16:35 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-4359a302794so2953819f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 00:16:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d3ff6dsm18522950f8f.25.2026.02.23.00.16.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 00:16:34 -0800 (PST)
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
X-Inumbo-ID: f81972e9-108f-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771834595; x=1772439395; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q8jtXG9gZuoR+dpetmGcm/+lifa8BdKtAHjm2uAehoE=;
        b=Zc+CBVdvQFahtw6UJRUG2FjgfW0yCmoBi40p5F+QFQHQledWfq8tIy2VsC/0gE58uR
         sm7uAEqmYBKiH+kLVpDuMbQe1ue1aZJZBrIJxdxk98onzWPeY3fD6L3KSD08t5556m4F
         uDU2VuuT7HbAdGakyQiNjTqlIV/7VgNwtOchcFbv4+8pZLTiHJs0DY9dCRzc7uh4ATbZ
         02PrzdTuKt9Vc2/jsPgilVKxqu/vLdj3Nph1HcuwKYBm9I9m5sIRcqrE+jyX8bzHSFgR
         kqA6NGdH5OsykaZ1eehCsti1mk+6UJ46KMf8omoMRsKEIswelkX9k2YTq3OWUQ2Pq9pl
         lAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771834595; x=1772439395;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8jtXG9gZuoR+dpetmGcm/+lifa8BdKtAHjm2uAehoE=;
        b=jOtLXHMzcz+KDYzbzwIJxYmJF/HZ824lOv/IrRq+JAAuA5v90927OJFfU5i9ZT1k03
         4WELuuVt+427RdxVZOBorBVlJMgwWu9ZJCHjVQPtnf1p6Ak39ceawAeuwwf8liNAqHWE
         oHpvTOpz4nZ+u02gCgyDxCo1XcYMyck4uwr3wqbHpe1eQhT9nst7haemqlzZegcvAR97
         7z9A8PpBmcG0jiqLFKA7VNo8UErlZ+wyd4Sofuz+CxwmIQMMyaT/EPkWwIrZ3jIygABt
         zkxXZvqhiktyw3rd8Av9pr3JvgGzwY21DuKL189v366BcI09BBuIXEPwwgg4MkjwUMZA
         h2dA==
X-Forwarded-Encrypted: i=1; AJvYcCX0T69S6uJo7NtnUB10hMRkAP+IqbiS6PQCVe8spB5wEgEDZdL+bPrGrOO2r2QnesREIOxY66MMrgo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDmF1fEMeXrPmxGknVN5/OQX90OA5fHuTP8O0AM9Sfc3DAGSLm
	pO0+b3cxXrhu53/f16vCsmfAez8RMCBtus1YefbOEflwD9QiQzXb4fUYKtmpLaLqdw==
X-Gm-Gg: ATEYQzzy7i8QkD/hoLv41HFZfZUo2DjXTdY6A4xI9JXmKJKClv5TljuMMvl0U+eFJ3R
	dP78qIZNufulComNfuIPYaXpHPxOy0rTeBAX3UZpjyQWNOkPA1Cgm8jJLA/2Y9Rbsad6m0i/qJT
	DPgruL5KnXqcBaVaJp0tGGQQdN7l/RxFc/RSFhdU4fViPuLVqraVKAI1N8Q1VG6FHOAEKVbhW2s
	ofWdIpcA7peAEOGT8RcLS5Ku15RUdXUXIbdWnbd6+/dvhxHhSXPOtVB04VSATT0ktcySFNVrXAl
	iEHLZ/sahjxDNXkTLQtUMJkfSSQ3OO+6eUWMIOWiTQ32UUHiGp8qmqgSaLyWAodeMgGM2J4yy7j
	uzAiDTAnUCCz5UokIF61E/Crnb6l858nX+t3dCH+7auDMKy6/RsDXFy7kZLMiA3qpZeoIdFrqu+
	dIqQi/E7hTWyxYc6i4G8E8cayLU4Kqj5WcCTcpCEL6JevgNd6uKJKSL4GEU8lxC5eONUNwJZ+Nq
	inQ7nqqvTOtQkZRL46ITki9/Q==
X-Received: by 2002:a05:6000:2884:b0:437:6e0b:7147 with SMTP id ffacd0b85a97d-4396f156312mr13609447f8f.7.1771834595072;
        Mon, 23 Feb 2026 00:16:35 -0800 (PST)
Message-ID: <e3ea3088-9e7a-4d83-95b2-21154473e1bb@suse.com>
Date: Mon, 23 Feb 2026 09:16:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/12] x86/shadow: restrict OOS allocation to when it's
 really needed
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
 <3c05fb6c-f71e-1b86-6146-96f2b3f3c9ae@suse.com>
 <abae3741-d866-4816-8744-6721183f35e6@citrix.com>
 <101686ff-36d6-4a96-803b-57a6ddd03559@suse.com>
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
In-Reply-To: <101686ff-36d6-4a96-803b-57a6ddd03559@suse.com>
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:wl@xen.org,m:roger.pau@citrix.com,m:tim@xen.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BD570172F82
X-Rspamd-Action: no action

On 23.02.2026 09:11, Jan Beulich wrote:
> On 20.02.2026 16:06, Andrew Cooper wrote:
>> On 16/05/2023 8:40 am, Jan Beulich wrote:
>>> --- a/xen/arch/x86/mm/shadow/common.c
>>> +++ b/xen/arch/x86/mm/shadow/common.c
>>> @@ -61,7 +61,9 @@ const uint8_t sh_type_to_size[] = {
>>>      [SH_type_l4_64_shadow]   = 1,
>>>      [SH_type_p2m_table]      = 1,
>>>      [SH_type_monitor_table]  = 1,
>>> +#if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
>>>      [SH_type_oos_snapshot]   = 1,
>>> +#endif
>>>  };
>>>  #endif /* CONFIG_HVM */
>>>  
>>> @@ -1771,7 +1773,8 @@ static void sh_update_paging_modes(struc
>>>  #endif /* (SHADOW_OPTIMIZATIONS & SHOPT_VIRTUAL_TLB) */
>>>  
>>>  #if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
>>> -    if ( mfn_eq(v->arch.paging.shadow.oos_snapshot[0], INVALID_MFN) )
>>> +    if ( !(d->options & XEN_DOMCTL_CDF_oos_off) &&
>>> +         mfn_eq(v->arch.paging.shadow.oos_snapshot[0], INVALID_MFN) )
>>>      {
>>>          int i;
>>
>> I've never seen XEN_DOMCTL_CDF_oos_off used.  Xapi has no plumbing for
>> this, and xl only inherited it from xend.
>>
>> At this point, OOS is the tested path and OOS_OFF is the untested path. 
>> I think we should remove the flag and let OOS be unconditional like all
>> the other shadow optimisations.
> 
> It being a guest config setting, I'm hesitant. Maybe we should actually make
> sure it's tested, so that in the case it's needed it could be named as a
> mitigation for an XSA?

Also, ftaod, this change had gone in already long ago, with Roger's ack.

Jan

