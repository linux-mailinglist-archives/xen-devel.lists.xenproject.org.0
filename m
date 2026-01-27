Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AM8VFpLeeGnytgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 16:49:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD2997130
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 16:49:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215024.1525277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vklJb-0003YW-Iz; Tue, 27 Jan 2026 15:49:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215024.1525277; Tue, 27 Jan 2026 15:49:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vklJb-0003WI-Fz; Tue, 27 Jan 2026 15:49:15 +0000
Received: by outflank-mailman (input) for mailman id 1215024;
 Tue, 27 Jan 2026 15:49:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vklJa-0003WA-9U
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 15:49:14 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9bed607-fb97-11f0-b15f-2bf370ae4941;
 Tue, 27 Jan 2026 16:49:12 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4806bf39419so3150965e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jan 2026 07:49:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806cddffe9sm2756565e9.4.2026.01.27.07.49.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 07:49:11 -0800 (PST)
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
X-Inumbo-ID: b9bed607-fb97-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769528952; x=1770133752; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DjmZHlv3QHj/nQyTJTnkxKCd1txqbYrasXXX6umLMxA=;
        b=X1jQPrwFolg7EV4YMTawO+EciZaKGmMmYKgjhUeCc5nG3P5GjFw4gtJqg7uIXZVIs6
         sEzf/ekh/Gp7+lP6z6ewsjU99X4q6j3r3CNuHs0stpaxdECFgOnGVbwt9ykNqi1z5WI4
         HXct9/uXnURfeYBsCKjWNihpfRvrXh7k6JWf0lDR8Ka1Uc55+V/UCgvFRa/s49lMwDXy
         t/N2SMkoTR88dFyeOyetmL8Gk891YU7rJ7S3hSCA3PGh2AC97okTD6/Bdfu4knUeRh5o
         D/sFU/WivmuQ+Rf5DcWeb8sh6zsBl61fGiQmZraa6IgxbmAzlrB20QwA4pGOwHTZFpI4
         hHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769528952; x=1770133752;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjmZHlv3QHj/nQyTJTnkxKCd1txqbYrasXXX6umLMxA=;
        b=ee2Efnxr0ONwRa52QQyGNASjx2/7W8v1sVayAsZD2LQ1lKkz+5Y7NLa/LmyDXxfSc3
         TxE6BC/YmEPg4EUlBfSD1nz/kB7F3y2beLJP/oxnXglpQjwqnPGfldKRcLmiZC4Pb+Vk
         aYzXPQdXVgDQ1cHyVejeyHTulFVSk/FGf8HuMCv8QFNkEDGu7NUZTO/4cxDnDTcp5MGg
         7e4tw5aS/px9+tz7Cd2BgitIxzpogmctVwZkaUwoOIfp64SNQKYJwT9ap4hZo74guAis
         GmZoq3TF5/tuBI4myOk+5bfhtRcRopndE6y8yGvigkgu/1fTIFFvFBoCtFKsKUwiXMhn
         H49g==
X-Forwarded-Encrypted: i=1; AJvYcCWKO4ZUwhjN4QBNdnfOvZm2yRX052jxi1SmIPGnmo5tF+xxKHqctFIk6xGQ4qvbcYE8szn1bt56fwY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZ1hOlzdyKVf3zNZsRoYoMXKxSESr+YMzfAQSta3AB9xkmSKiD
	OJ2dpVEpqxqcvhVxVKGENqFYtv61UIkahLO5KjvmHegSSvcVmFnMiYtFdS3JPRkZcA==
X-Gm-Gg: AZuq6aJfzNPVHpj2EFxMPVWp1pn8FGZTTVvRsN0D0zPDyMJc+8G9XEqPKsvtqhqXTNB
	9k+nsNp5Teptl/R83v976X4iegygxn/K8qM0n3x8IgeWlNTzrzG1JhGQI62uypMBjMO4MtOjsFT
	YKz6zpljqRKIJb9S/pG/wAFQVxvQL26jSFN1h3zXILWq5fZrAVJhI3wZbZpF0t0qIhdzhh1X8Yd
	bdRypxwsIAy5wy8y7h9qtJlDIbghSXggc3qaoQMXFj06u9CYk0MPTBKYpRhCAYqJYMBJAP+8cE3
	9bP1rauCs1Ps6I/SLUohx8XoerUdgxRgoRvrTlIGG09ovuvZOkDbGqyMbPQV3vZflK2tgWt51xj
	iIRLnKXASNt+txjna1Vkp9nLnRuJl83UymiffjOeo6/qLn5391Fw64RSr/vOVfcHTpw3pgVTv4s
	ba/Ef04RZprF1aCUCloMdgqEKXNQLTaNJguMe4I13wGzAmKqlWCs1ajd4VAgO8h42FsaIbfAz1Q
	f4=
X-Received: by 2002:a05:600c:4ab0:b0:471:793:e795 with SMTP id 5b1f17b1804b1-48069d46808mr17120035e9.0.1769528951851;
        Tue, 27 Jan 2026 07:49:11 -0800 (PST)
Message-ID: <b993fa00-bf6f-490c-be1b-3341d41324a3@suse.com>
Date: Tue, 27 Jan 2026 16:49:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] xen/mm: allow deferred scrub of physmap populate
 allocated pages
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260122173857.83860-1-roger.pau@citrix.com>
 <20260122173857.83860-3-roger.pau@citrix.com>
 <69a64a89-af3f-47fe-8998-a3ff76e9484e@suse.com> <aXiVeAQFUMQkIK1_@Mac.lan>
 <f369f85d-6699-44f7-bf3e-589569767e65@suse.com> <aXjTTRvkCiE77uIt@Mac.lan>
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
In-Reply-To: <aXjTTRvkCiE77uIt@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BDD2997130
X-Rspamd-Action: no action

On 27.01.2026 16:01, Roger Pau Monné wrote:
> On Tue, Jan 27, 2026 at 12:06:32PM +0100, Jan Beulich wrote:
>> On 27.01.2026 11:40, Roger Pau Monné wrote:
>>> On Mon, Jan 26, 2026 at 12:14:35PM +0100, Jan Beulich wrote:
>>>> On 22.01.2026 18:38, Roger Pau Monne wrote:
>>>>> --- a/xen/common/memory.c
>>>>> +++ b/xen/common/memory.c
>>>>> @@ -159,6 +159,66 @@ static void increase_reservation(struct memop_args *a)
>>>>>      a->nr_done = i;
>>>>>  }
>>>>>  
>>>>> +/*
>>>>> + * Temporary storage for a domain assigned page that's not been fully scrubbed.
>>>>> + * Stored pages must be domheap ones.
>>>>> + *
>>>>> + * The stashed page can be freed at any time by Xen, the caller must pass the
>>>>> + * order and NUMA node requirement to the fetch function to ensure the
>>>>> + * currently stashed page matches it's requirements.
>>>>> + */
>>>>> +static void stash_allocation(struct domain *d, struct page_info *page,
>>>>> +                             unsigned int order, unsigned int scrub_index)
>>>>> +{
>>>>> +    rspin_lock(&d->page_alloc_lock);
>>>>> +
>>>>> +    /*
>>>>> +     * Drop any stashed allocation to accommodated the current one.  This
>>>>> +     * interface is designed to be used for single-threaded domain creation.
>>>>> +     */
>>>>> +    if ( d->pending_scrub )
>>>>> +        free_domheap_pages(d->pending_scrub, d->pending_scrub_order);
>>>>
>>>> Didn't you indicate you'd move the freeing ...
>>>>
>>>>> +    d->pending_scrub_index = scrub_index;
>>>>> +    d->pending_scrub_order = order;
>>>>> +    d->pending_scrub = page;
>>>>> +
>>>>> +    rspin_unlock(&d->page_alloc_lock);
>>>>> +}
>>>>> +
>>>>> +static struct page_info *get_stashed_allocation(struct domain *d,
>>>>> +                                                unsigned int order,
>>>>> +                                                nodeid_t node,
>>>>> +                                                unsigned int *scrub_index)
>>>>> +{
>>>>
>>>> ... into this function?
>>>
>>> I could add freeing to get_stashed_allocation(), but it seems
>>> pointless, because the freeing in stash_allocation() will have to stay
>>> to deal with concurrent callers.  Even if a context frees the stashed
>>> page in get_stashed_allocation() there's no guarantee the field will
>>> still be free when stash_allocation() is called, as another concurrent
>>> thread might have stashed a page in the meantime.
>>
>> Hmm, yes, yet still ...
>>
>>> I think it's best to consistently do it only in stash_allocation(), as
>>> that's clearer.
>>
>> ... no, as (to me) "clearer" is only a secondary criteria here. What I'm
>> worried of is potentially holding back a 1Gb page when the new request is,
>> say, a 2Mb one, and then not having enough memory available just because
>> of that detained huge page.
> 
> If that's really the case then either the caller is using a broken
> toolstack that's making bogus populate physmap calls, or the caller is
> attempting to populate the physmap in parallel and hasn't properly
> checked whether there's enough free memory in the system.  In the
> later case the physmap population would end up failing anyway.
> 
>> In fact, if stash_allocation() finds the field re-populated despite
>> get_stashed_allocation() having cleared it, it's not quite clear which
>> of the two allocations should actually be undone. The other vCPU may be
>> quicker in retrying, and to avoid ping-pong freeing the new (local)
>> allocation rather than stashing it might possibly be better. Thoughts?
> 
> TBH I didn't give it much thought, as in any case progression when
> attempting to populate the physmap in parallel will be far from
> optimal.  If you prefer I can switch to the approach where the freeing
> of the stashed page is done in get_stashed_allocation() and
> stash_allocation() instead frees the current one if it find the field
> is already in use.

I'd prefer that, yes. Of course if others were to agree with your take ...

Jan

