Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GuqD9JOnWkROgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 08:10:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A448C182C82
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 08:10:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239441.1540848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vumY6-0007uj-3l; Tue, 24 Feb 2026 07:09:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239441.1540848; Tue, 24 Feb 2026 07:09:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vumY6-0007rm-0W; Tue, 24 Feb 2026 07:09:38 +0000
Received: by outflank-mailman (input) for mailman id 1239441;
 Tue, 24 Feb 2026 07:09:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vumY4-0007rg-K9
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 07:09:36 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c39bc682-114f-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Feb 2026 08:09:30 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-4377174e1ebso3939168f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 23:09:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43986aa2f84sm2168087f8f.7.2026.02.23.23.09.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 23:09:29 -0800 (PST)
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
X-Inumbo-ID: c39bc682-114f-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771916970; x=1772521770; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6obWbUe9NXRXbPUKlTjb4bP6VzgrGD5LSdYUSNe6moU=;
        b=JtGXpPjaeG9b8wlsXYl/nzQHYg/gWKRyjaTU4EpBMu40CBm8xAYXp6k9UlvhKyaUAL
         /zN3WTKTpFmfxjjDW07S8Vts704QhhqYIQsrvYL5XOrzgTcTHROlGlcsS9ZJbeOk9nPn
         CzHDnXX7wca8zYlINgcPWIfmAm4ezxHsABk3TVl/noS4noMxZ8cr8TgmbXgdL8tPvWeh
         UPhUfozWOQFReCwSvcma+jqC3Z4sVmCexPOoN9kd5fOZ1kBVLcSzqNlCpzLPHU675xDH
         DqAE8nvPyipGrIyCH7EW71GdYnhAp2609MwEdya9o1lW9WDNEo7l/QWVkKGuPBaN8AlC
         Vu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771916970; x=1772521770;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6obWbUe9NXRXbPUKlTjb4bP6VzgrGD5LSdYUSNe6moU=;
        b=XDce6UhiOqNF4dh4lQuEI6AnK7C0/wLUh+CJL7zCSfBCf8LiIu1WajVv9CTfU4hNKG
         QR8asq/FThXDSYa69SVppY7iOz9KaY1UPH2D/LhWQjgeisOulRPXh98Ui82p/EIuagjT
         wk8KiyI0KB7/9E4ncDkNWCo0QNgzFNHRjljm7uFITZV81x84QcLnmROGKxOX//gCesM4
         DDJT5pje56FmoHJWZB35ogEPGU4KVfIrhXSiwgU02Qm81icUNMeu9dkciOly6bCqFHFr
         qrgWzrUg7L7KPilXb8Itq0Silc/iQ5wUBV6uRpXKLfX/NtwE8J7lGl+a05KqdgxPlqqh
         sOzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOE3pKKHunwC3khwJTSUufaUFppQZbtNmzI83AQ5iY/h77q76GlmXkq9yuqGvu+Hf8zOpWL96rFtc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMrz3nuwFJhyZJMC4dZYHKqYxI5XLq1k/Kv7q50Yg91gDWi4D9
	GsMCvX3ATBszXKmvdK7Ijv8HKuhcfOaRTbmGSWwu3F8pcZqdPGC8AB3UKTKqlUMGuQ==
X-Gm-Gg: ATEYQzyqjjhm3LP+gQ0m295df3JJetKEdrYNp9YcviunpSa4D4oThBXElGSTDk1jtJX
	GJciwHyNRsg0Pz9eLRT/NLUGYhi9wo7bDLMe2sEF0gxFX/pS3dJ5DpC+aqfh93AuQ6BpHhH/rPb
	0DRZZ/dkEMMy6EOALAsnE3xXTwqiK6wlJ6qjmtwwduV+EZ8BAIqND/sEStj2nHllcSUog7OHM5F
	cLwOyO3kEMJjT6R/SGLgKB1dQSGSe8/X3nko1AlVNgkWpTaEvxN79wqBQhsCLvVcLx3Msk2ekFz
	1hv7LryItEpXlqHyoVcpiqnDbxpqR/LTNBn3x90yTIH81oPUhUNrVvzz6/O+bsitIX+2y/Frjwh
	oS8KMTUX33/xcZYU030eEGm28RdEtadcTJSWLHWkSQv8U50wl6NiVlSJKVK7/dQ6E3N7JZ5WVr9
	ZnMFvcrWOo3AzJqR9JOu02Hbm/5Oo3fL51SWGjWiqKsHFlfmAC1mfCLfBih6Yhjx2S/UNy9E2CF
	EsY3tAkSa9d268=
X-Received: by 2002:a05:6000:26c3:b0:437:67b5:9bab with SMTP id ffacd0b85a97d-4396f1954b4mr21673714f8f.56.1771916970296;
        Mon, 23 Feb 2026 23:09:30 -0800 (PST)
Message-ID: <671d83d0-fe8a-4da1-af06-a09221a8442f@suse.com>
Date: Tue, 24 Feb 2026 08:09:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xsm: move the console read properly under xsm
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260219184503.21918-1-dpsmith@apertussolutions.com>
 <43a90b6f-683d-48e3-b7cc-4b8c6dae087c@suse.com>
 <6ec4a310-884e-4004-b56f-1810f028e355@apertussolutions.com>
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
In-Reply-To: <6ec4a310-884e-4004-b56f-1810f028e355@apertussolutions.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dpsmith@apertussolutions.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A448C182C82
X-Rspamd-Action: no action

On 23.02.2026 19:49, Daniel P. Smith wrote:
> On 2/23/26 10:22, Jan Beulich wrote:
>> On 19.02.2026 19:45, Daniel P. Smith wrote:
>>> --- a/xen/drivers/char/console.c
>>> +++ b/xen/drivers/char/console.c
>>> @@ -554,7 +554,7 @@ struct domain *console_get_domain(void)
>>>       if ( !d )
>>>           return NULL;
>>>   
>>> -    if ( d->console->input_allowed )
>>> +    if ( !xsm_console_io(XSM_OTHER, d, CONSOLEIO_read) )
>>>           return d;
>>>   
>>>       rcu_unlock_domain(d);
>>> @@ -595,7 +595,7 @@ static void console_switch_input(void)
>>>           d = rcu_lock_domain_by_id(domid);
>>>           if ( d )
>>>           {
>>> -            if ( !d->console->input_allowed )
>>> +            if ( xsm_console_io(XSM_OTHER, d, CONSOLEIO_read) )
>>>               {
>>>                   rcu_unlock_domain(d);
>>>                   continue;
>>
>> At least the latter of these two can be called from an IRQ handler, and can
>> be called with IRQs off. Flask's avc_audit() looks to be using a spinlock,
>> which isn't IRQ-safe. (There may be other lock involved; I merely went as far
>> as I needed to to find the first one.) IOW I fear you can't call
>> xsm_console_io() from here.
> 
> Apologies that I didn't consider the IRQ context. With that said, we 
> can't be wiring non-XSM access control paths that circumvent FLASK's 
> ability to control domain access to a resource.

I feel like I can interpret this last sentence in different ways. Are you
suggesting that this effort needs to be dropped, and the situation needs
leaving as is? If so, aren't there options to move at least a little
closer to what is wanted?

Jan

