Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNiHFEbAeGn6sgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 14:40:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B665D95014
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 14:40:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214743.1524984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkjIb-0006hc-KA; Tue, 27 Jan 2026 13:40:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214743.1524984; Tue, 27 Jan 2026 13:40:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkjIb-0006gi-H4; Tue, 27 Jan 2026 13:40:05 +0000
Received: by outflank-mailman (input) for mailman id 1214743;
 Tue, 27 Jan 2026 13:40:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkjIa-0005uz-Co
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 13:40:04 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af217a5e-fb85-11f0-b15f-2bf370ae4941;
 Tue, 27 Jan 2026 14:40:03 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4801d98cf39so43101185e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jan 2026 05:40:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066aaf235sm60512475e9.0.2026.01.27.05.40.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 05:40:02 -0800 (PST)
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
X-Inumbo-ID: af217a5e-fb85-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769521203; x=1770126003; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7rRQNrlmIRxjdUw9lRfNy6SvIKx40L+3N/LeibmJRzc=;
        b=SsmqqnJ1KYUkCNCRBktKE8Q12lzilfMCu8gWyYLyL2TvgqgE92YrIt4WUsTB+nGxlA
         Yx0WItbaL6Y/tuigLQZUPPmqKcGbQ+qr2HArM53f3d+XMZoY7qezFX/gjYmXH1SfGltj
         mjXRRvDuNFCHMELB/7QjojeyM0BXfbeU1+bA0GS3wEAkmCCo9XTcACc4/75V2C3MDUac
         0HKuVjz3cNEbwXkjz6kM6qBppYeelVluV9fQOvOKjrxy6wOASBrE9wnMfQljusWTzTrN
         9tQjYoEWsFbZozIJQhq8WgBCkvGPQuzL85PZJFYUmGlJuTv09hIQm7Y0R81FQzNYOGfX
         lr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769521203; x=1770126003;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7rRQNrlmIRxjdUw9lRfNy6SvIKx40L+3N/LeibmJRzc=;
        b=HBTpiSrX7is0ZQcvb7Rk0mM0EbI99MXBCYqsdC75RXWfOepxb3qYaZtZ+einsNNQDF
         Z0uQee8M8QPynGFF0H0TcwTpDmvl2YXLspiFBf1TwuqZz36jBxZNY7PqXm3V6mSGQjqB
         I+KaNm+aLuYEeDWCiumFBgPempZgtoK6Zl3DjuVl/08VUUMz9BJxGU1IcFk3r9zN9xeM
         0HLpEkL73t+/debRJ0ls7d8+Nf2ajFZQim5xUw9qNboG1OfSNvrveVhNKkXjocd8LHl4
         6e9E5Y4ZOjO5tLY4O34Mh+dQbMH3nJQZk7TFocokljKzsRKbKCsUF81H58x8zQ2GnAeh
         FRkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXP4ku5G+JcQn/XwVtPoe13gicBPiNAXC5viPt+Hur9eKJuO0IL5VM6uDsQn/BvEuIefdBmQcs8hqQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx0JlkKln2BE0ETiNShuiEBw573sVGnuFTvUGN8cSsaA6jWlTYj
	pWhSeMzVX5nLf9K0mi53x/wFca0RGwoCbfx7al0E6vNrR6OhSunIfbPhNuJyiCYHlA==
X-Gm-Gg: AZuq6aIssvJKe+jxM3w2lQLWk1047rob3sVsV/tfhN+glJBT+VuawpO7qqZDmNiQf0I
	9phVc1ZNk7n2YWAc98/cApX1TEaX+UiLEiIPNmSHOXPprMmtw7WoB3Lfgp9D1LyFwsBdB2xAdY/
	GKEXLwgk02NWbJt2LbvdUtOWG81vVXdVJM6/fohRUXIAn5TtkllDQOj/1Fr5kfunsFLmSgJzvyu
	qivm9gxW28JPqqDSomGVipsikvN2o6zTziSj/vf82DExzktEu8sFropp22BLCnpH28fGWtaFMvJ
	aH3Tn/55SVXpX8aZtRXp03pRnMl+/nV6ZzJXC2ga+pREB/oj+koI8x6XdGwVs9o+5Vw6pEBFp58
	DYhu6wx9BxOCyKzHrcsDUlXGetW39sZGTjSSCuwZQtM0RgTuRdHM2t7Q9pExalK6LK2JBY2C9yZ
	fd8kgM5MbFm4WD6PnvblmwtLPwRV+EjNLm2Qn6I6ih49CxJwd7c3ySJEf9MiabesMByQCIaFsLu
	SEzFZkgphCdyg==
X-Received: by 2002:a05:600c:820d:b0:477:7b16:5f77 with SMTP id 5b1f17b1804b1-48069c3fa76mr23509255e9.3.1769521203141;
        Tue, 27 Jan 2026 05:40:03 -0800 (PST)
Message-ID: <a0ce6e2c-f53a-48ee-959c-ea5447419a70@suse.com>
Date: Tue, 27 Jan 2026 14:40:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/shadow: suppress trace_emul_write_val hook when
 !TRACEBUFFER
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7982a813-0fda-447e-a0f1-c9357b85f264@suse.com>
 <48cca311-328e-46bf-b5e5-e22dd9264b84@citrix.com>
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
In-Reply-To: <48cca311-328e-46bf-b5e5-e22dd9264b84@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: B665D95014
X-Rspamd-Action: no action

On 27.01.2026 14:27, Andrew Cooper wrote:
> On 27/01/2026 1:20 pm, Jan Beulich wrote:
>> The hook is never invoked in that case, and hence needlessly offers an
>> extra valid indirect call target. With the hook suppressed, no consumer
>> of the three local per-CPU variables exists either, so they're
>> suppressed as well.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/include/asm/paging.h
>> +++ b/xen/arch/x86/include/asm/paging.h
>> @@ -90,10 +90,12 @@ struct shadow_paging_mode {
>>      int           (*guess_wrmap           )(struct vcpu *v, 
>>                                              unsigned long vaddr, mfn_t gmfn);
>>      void          (*pagetable_dying       )(paddr_t gpa);
>> +#ifdef CONFIG_TRACEBUFFER
>>      void          (*trace_emul_write_val  )(const void *ptr, unsigned long vaddr,
>>                                              const void *src, unsigned int bytes);
>>  #endif
>>  #endif
>> +#endif
> 
> Can we get some comments on these endifs, and ...

I can touch the pre-existing ones here, but the new one spanning just two
lines here and ...

>> --- a/xen/arch/x86/mm/shadow/multi.c
>> +++ b/xen/arch/x86/mm/shadow/multi.c
>> @@ -4130,7 +4142,9 @@ const struct paging_mode sh_paging_mode
>>      .shadow.guess_wrmap            = sh_guess_wrmap,
>>  #endif
>>      .shadow.pagetable_dying        = sh_pagetable_dying,
>> +#ifdef CONFIG_TRACEBUFFER
>>      .shadow.trace_emul_write_val   = trace_emulate_write_val,
>> +#endif
>>  #endif /* CONFIG_HVM */
> 
> ... this one too.

... one line here I didn't think would need comments?

> Otherwise, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

Jan

