Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEN3BGdPDGrwegUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 13:54:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7398457E1A4
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 13:54:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312881.1583049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPJ1O-0003pF-II; Tue, 19 May 2026 11:54:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312881.1583049; Tue, 19 May 2026 11:54:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPJ1O-0003no-FJ; Tue, 19 May 2026 11:54:02 +0000
Received: by outflank-mailman (input) for mailman id 1312881;
 Tue, 19 May 2026 11:54:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPJ1N-0003nf-QI
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 11:54:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPJ1N-0041iS-6B
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 13:54:01 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c4f55-bab6-0a2a0a5309dd-0a2a450ca952-8
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 13:54:01 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c4f58-62f1-0a2a450c0019-d155dd2ae4ef-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 13:54:01 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-45d96d21e82so2023144f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 04:54:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ec3b18fsm41788784f8f.11.2026.05.19.04.53.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 04:54:00 -0700 (PDT)
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
        d=suse.com; s=google; t=1779191640; x=1779796440; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NeENzLIWUSD/UCabw8v2juabAhMzSRIwzqjwgW3ANo0=;
        b=KEPv1RSr7lv09BTxPoomB2Cu8y6cciszH1nx4YHs44uYybcmqKi3CuyTZBQboyKlqS
         56k9qZk0REQMsEqqSKHOQmqHaUrcYg+EtvYtf0wrbQxcZu9p/JyOjvnRZsdh8jw0owQg
         xFir+rzVunbSQZFJMoCPP6EM143SA1E5sRmdGOEHqbu8MjTVizGhsjAjbl0gxsGKewg3
         0X4RbD8Rs1FdFe9svaXloDh5uB8j1PCQ/FZEzyFXu9/RqxPHp6yqpKrz8Qmzek52UPHJ
         ReF7FWP4YDYRvNJIzgztVgUavfXkM4berqq1epEYNAslI+HmIK+NymS0oESwe4/iT80h
         xXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779191640; x=1779796440;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NeENzLIWUSD/UCabw8v2juabAhMzSRIwzqjwgW3ANo0=;
        b=jnf7UeBoi/95FIeDVNxWnOha2jvd3HZM/kQCbgs14ZRQlxAsyWb3+xW6rTlxHGEfwD
         7llJl3eWrSYdgb3ECHCWHhq894dlDPI3GZbD/Zj/1FsYYkzuHEHK0JbdLg62LmcufDsB
         rzPCNTsBi9ZUmIvmo9QAIUnhF9HOXQSshhTkQF2Orwy0XoZkr9rMMrKdc/w9ysYYwpU2
         FPKDICTT4gpx4Cv9VZ0EB/19g2IfrHTfqFmrDIgrOFWwa2dSDZHYBHT/1RLS7qfVzju6
         u2AMNz4w52h1C/Z60Bl5jqaqpXdrQ3orthFJeRGe+TkiTbfBVoE4aXCwcpDYBrcXvhs7
         CsTg==
X-Forwarded-Encrypted: i=1; AFNElJ/OfiCax+wbrOxFCxdo6IOoAnSeY8/xhJAjdDAjGW/ng1NtD+OkuSNZShMGP3k8CQXI/t/PS96gvUA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzq76iw+4lpdiLpEWc3f/TB27rlSNvcdwFeaxdkljQI2UuN8KKM
	wGeP8DAy++AhS0rhMtiouZ03hwUXgh2stAiuQPevgV4rHOmZXGg6dZpM96R2ItwxIg==
X-Gm-Gg: Acq92OHLAaS3EUshJE3KuC0BB4LPvZWFZcs6Qy4wPV2mtiZUxEZcPFdA90tLqelZugx
	5heE27WKuJ0M1T/CKB48j6t5ENyYFhs1iuZ/PlJK6l6vssb/wT1PYS0n/IWy45CT4oXekF2+8UL
	IXntEoqy4/ZIeknxz0citEKoA85NZEswj4V+QwikcMtfe7Tx/QTkBMLoTiGib2JsslXbPmf5NZn
	FXzwK4Ow6gorN6qj0Cp6Nmhnzpym0Dvi9luMtlGc931GRUnzA1QIIzMNxgVrm4vt79ZRIRlfTon
	r6nRrqnFt+7L9XAHNlqDEYeQxZVdl+FXYIhyaauHBBD0UvT4MnVcyB/xnCx01v/AYxozgsTW8sw
	mJQrCRBpy5QtHZpYrqquoZoHpMOs1CqNTF+RxtuHoKjaYYQAwRZQoTP67jYuDcSuWPBo9aBVFNL
	Rb7YckEGXTSFKwx+1Zoaj5heiMnEk0+Dvn2ulmyGwHgvj8chtfSAlyUB4MN01a2FYiProW3KrS4
	zURiwApoxwP11E=
X-Received: by 2002:a05:6000:400f:b0:43d:c95c:4259 with SMTP id ffacd0b85a97d-45e5c5dd488mr29964210f8f.30.1779191640475;
        Tue, 19 May 2026 04:54:00 -0700 (PDT)
Message-ID: <ea274abd-d7be-4fee-a147-936a8adc1c81@suse.com>
Date: Tue, 19 May 2026 13:53:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen/domain: fix UBSAN null pointer dereference in
 vcpu_info_reset()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1779179301.git.oleksii.kurochko@gmail.com>
 <09ae75638f9e7991163ed3633e7a60461d93da70.1779179301.git.oleksii.kurochko@gmail.com>
 <2be07ba3-879b-4c79-8103-b4951ab4cf53@suse.com>
 <bedfec37-4c74-40dc-904e-b80e33461be7@gmail.com>
 <e77cb8b3-35ce-4fc1-b98c-d4e889502acf@gmail.com>
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
In-Reply-To: <e77cb8b3-35ce-4fc1-b98c-d4e889502acf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1779191641-DB77ECF5-2A63CC90/10/73395122804
X-purgate-type: spam
X-purgate-size: 2940
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:baptiste.le-duc@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7398457E1A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19.05.2026 13:22, Oleksii Kurochko wrote:
> On 5/19/26 12:55 PM, Oleksii Kurochko wrote:
>> On 5/19/26 11:37 AM, Jan Beulich wrote:
>>> On 19.05.2026 10:39, Oleksii Kurochko wrote:
>>>> vcpu_info_reset() maps v->vcpu_info_area.map to the per-vcpu slot inside
>>>> the domain's shared_info page for vcpus with id < XEN_LEGACY_MAX_VCPUS,
>>>> and falls back to dummy_vcpu_info for vcpus beyond that limit.
>>>>
>>>> However, it does not guard against d->shared_info being NULL.  The
>>>> shared_info() macro expands to a member access through d->shared_info,
>>>> so when an architecture does not allocate a shared_info page the
>>>> dereference triggers UBSAN:
>>>>    UBSAN: Undefined behaviour in common/domain.c:325:10
>>>>    member access within null pointer of type 'struct shared_info_t'
>>>>
>>>> Extend the existing fallback condition to also cover the case where no
>>>> shared_info page has been allocated, mapping the vcpu to dummy_vcpu_info
>>>> instead. This is the correct behaviour: dummy_vcpu_info already serves
>>>> as the safe stand-in for vcpus that have no usable shared_info slot.
>>>>
>>>> Fixes: 295514ff75506 ("common: convert vCPU info area registration")
>>>
>>> I question this, largely (but not only) because I also ...
>>>
>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>>>> ---
>>>> RISC-V does not allocate a shared_info page at the momemnt because its
>>>> guests run in dom0less mode and do not use the Xen PV ABI, so
>>>> d->shared_info remains NULL throughout domain lifetime.
>>>
>>> ... question this mode of operation. Yes, you may (for now) be able to 
>>> get
>>> away without, but e.g. event channels will want supporting at some point.
>>> Which will require a shared info page. Better put that in place right 
>>> away,
>>> even if the guests you test with don't use it (yet). Certain other common
>>> code also assumes d->shared_info to never be NULL for an alive domain.
>>>
>>
>> Would it be fine than to allocate it in arch_domain_create() ... :
>>
>>      if ( (d->shared_info = alloc_xenheap_pages(0, 0)) == NULL )
>>          goto fail;
>>
>>      clear_page(d->shared_info);
>>
>> ... but without calling share_xen_page_with_guest() after that 
>> allocation as share_xen_page_with_guest() isn't implemented at the moment?

I would have said "yes" here, but ...

> Or could it be an option for all arch-s move allocation of 
> d->shared_info to domain_create() in common just after arch_domain_create()?

... Andrew's reply pretty much rules out not only this option, but the
shared-info-page concept as a whole (for RISC-V). See my reply there. In
the meantime, the change as suggested may then indeed be what we want to
go with, albeit (a) with a better description and (b) perhaps covering
all d->shared_info uses.

Jan

