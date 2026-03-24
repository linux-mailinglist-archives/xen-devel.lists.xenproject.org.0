Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mL+NC1B0wmmncwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 12:24:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA2E3073C3
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 12:23:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260357.1553704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4zr2-00028n-DE; Tue, 24 Mar 2026 11:23:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260357.1553704; Tue, 24 Mar 2026 11:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4zr2-00025k-A6; Tue, 24 Mar 2026 11:23:24 +0000
Received: by outflank-mailman (input) for mailman id 1260357;
 Tue, 24 Mar 2026 11:23:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w4zr0-00025e-HE
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 11:23:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4zqz-00ClfL-9C
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 12:23:21 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c2741f-e002-0a2a0a5209dd-0a2a4504dc58-32
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 12:23:21 +0100
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c27428-c823-0a2a45040019-d155dd33d4ce-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 12:23:21 +0100
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-43b871dd06eso60399f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 04:23:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64703c7fsm37275928f8f.23.2026.03.24.04.23.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 04:23:20 -0700 (PDT)
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
        d=suse.com; s=google; t=1774351400; x=1774956200; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eS2Oeab6YQQDesQJGuIJnDMobNVjND33/+0xuBzkurk=;
        b=Hr5RG63pfRcpT43T4FiNgEmgnflDsZsmwh9SIvRXnIf50vuADmUzUQ7ClrgrKbU+JX
         telc96znFkWMXDvvBCAa28Jca6M9NB12lXapf1HaRi1ZHaM5Kz7RKJhII+WaSCvUnWrn
         nxELnmaCv9ZBo7FCwU4yBKnlQSA3XY1B5JwVmazJsbmkOWLlovEARrUfVGWjcFCiVA2F
         nLS2WMkZzF5lWeSBy3llZMN5BLeL6vg/vitK+57QaHQ0ngeRIMywkDmAFuT2NVt9AeF1
         kKWeSbjtPMniUFBhcuF01br6lX8JjZumKHleEjjH0L+n9SqFFhfNtWAUszUvOFbUcx/p
         WyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774351400; x=1774956200;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eS2Oeab6YQQDesQJGuIJnDMobNVjND33/+0xuBzkurk=;
        b=CP99X8mSEdYl4+efNM7Qs5Bjzc3Cw5e5sTncR7FHXhV2/fcX0uuM+8qeBMWD+9qGHp
         qiuANlaupDWRPvLh91pg8QCoLMIvsPyGDcqIJSngDV+DtxQXegoXS2tULx1/BU/8IPGf
         8mIZ9tkd1GkkEg+5oifZ/8VrtpOxDUGNCN68pBIp3aHVEl8B1zO8Y11EITYiyIv327Kg
         0lcErPgBZGTlSojPuse6vSzhFe2VaYl33eMFIo9lNXP3SDnr3X0Bhvi6kyu/348LfIX4
         ZFSl6icaGlZ5mC33QzMNKvmtQ5RT7aTy4nv20684rWWL7DJaLwsB43mq9TyGzljixzPm
         1Khw==
X-Gm-Message-State: AOJu0Yz0NxDJqPrX80pTH+kKy/Mo2kzdSNpXxhd8YsUiaidUh2HYczMf
	+2kYDdQ5ccLz7frp+kKWCfhnNf+r08yaekM41lhq9T5YFJ/4n0zkNhsyxtsfFPe9KA==
X-Gm-Gg: ATEYQzw8VKLeZfcX6ntZUkt1YjKmHlDDrCyh2biOWzo8WiJvnQaA6fHmQ5FUIjoNYzs
	4rCPkllXXOIzNPqyNWgmcCe0tUDFsLH3fghLnWdXZuSkmPyLFZ80ZeiRL3fSgLkryZJalGNY24J
	Db2SXPzwQWjZanZzfgLHVHR0dYhPLncF3/hWO06p9Obf6XvjAAS+WcKZZdvYrf6y8PKadPrv5b1
	pVzxEUrUmOB+QjW7VFuKzkmSwpAMeRCuyfEFNaCTB0NpNRBQ47iMe9Zvffd3kw/hRi56PKQ8DtM
	2Q22jdSRf9zAOni2CTD2Qt/8YuW1IASVW0j7l100e71W1B6TiZEWwAPOLLv1x+EESFrGsGbz4LE
	ZjXHWC1ZsFTdkhEBVhuI1x503C+8OqgbJ/KHofyVnqb4cfBgwLKasgFcGurXbhhcMoeZVI3iftk
	xTBRLhX5KPuMPsyNWlluL/nnHOh0EWHof31OFjhvOge5pPf0etBDzd78nr3Qc06D45zDxPTGMLR
	uwnmrn1TXmZCkGAMyXCMzgjBA==
X-Received: by 2002:a5d:5d86:0:b0:43b:3e0b:721e with SMTP id ffacd0b85a97d-43b64281744mr22841264f8f.40.1774351400472;
        Tue, 24 Mar 2026 04:23:20 -0700 (PDT)
Message-ID: <56fa4fd5-19a8-4c46-9524-0f41090a8857@suse.com>
Date: Tue, 24 Mar 2026 12:23:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] x86/efi: Add BGRT image preservation
 infrastructure
To: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Cc: xen-devel@lists.xenproject.org, sarkarsoumyajyoti23@gmail.com,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20260324101726.6929-1-soumyajyotisarkar23@gmail.com>
 <20260324101726.6929-2-soumyajyotisarkar23@gmail.com>
 <acJxoijDI6vhs5wo@mail-itl>
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
In-Reply-To: <acJxoijDI6vhs5wo@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1774351401-B3C919D1-3D3E77B8/0/0
X-purgate-type: clean
X-purgate-size: 951
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,gitlab.com:url];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,gmail.com,citrix.com,apertussolutions.com,invisiblethingslab.com];
	FORGED_RECIPIENTS(0.00)[m:soumyajyotisarkar23@gmail.com,m:xen-devel@lists.xenproject.org,m:sarkarsoumyajyoti23@gmail.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: BFA2E3073C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24.03.2026 12:12, Marek Marczykowski-Górecki wrote:
> On Tue, Mar 24, 2026 at 03:47:24PM +0530, Soumyajyotii Ssarkar wrote:
>> diff --git a/xen/common/efi/common-stub.c b/xen/common/efi/common-stub.c
>> index 77f138a6c5..9e595600d7 100644
>> --- a/xen/common/efi/common-stub.c
>> +++ b/xen/common/efi/common-stub.c
>> @@ -20,6 +20,7 @@ unsigned long efi_get_time(void)
>>
>>  void efi_halt_system(void) { }
>>  void efi_reset_system(bool warm) { }
>> +void __init efi_bgrt_status_info(void) { }
> 
> This has a minor conflict with the current staging,

In which case - against which tree was the submission? It shouldn't be
against anything else than current staging, and I don't think there were
any changes in this place recently.

Jan

> but then for __init
> you'd need include xen/init.h.
> See:
> https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/2405049544
> 
> Did it built for you without it?
> 


