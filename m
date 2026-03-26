Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKm4CXxZxWkk9gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 17:06:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8CC3381EC
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 17:06:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1264467.1556018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5nDe-0006yy-2O; Thu, 26 Mar 2026 16:06:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1264467.1556018; Thu, 26 Mar 2026 16:06:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5nDd-0006wl-Vy; Thu, 26 Mar 2026 16:06:01 +0000
Received: by outflank-mailman (input) for mailman id 1264467;
 Thu, 26 Mar 2026 16:06:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5nDd-0006wf-3p
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 16:06:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5nDc-001Hfk-Fy
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 17:06:00 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c55968-2eae-0a2a0a5409dd-0a2a450bd40a-0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 17:06:00 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c55968-ef63-0a2a450b0019-d1558031cd26-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 17:06:00 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-486fda2a389so9330575e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 09:06:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722c845b8sm37225365e9.4.2026.03.26.09.05.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 09:05:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1774541160; x=1775145960; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XvDKUxnp63sk9ZHITRCSTf+wf8aqBXRHHagMNfACX7Q=;
        b=NBQOjtMauMU2iRjcWzvs133pIFL4qKT+IHvWB9GdnUbhJjJethQWkkvVA+RuP2Syh1
         ynhI0a73Da8tUOzT3YQOcwYuVcIWYzxeXPj0xX+FFL/Srx3RKsUQiV4xnrJ1h/NtvDO1
         GVbfwQmu10RedZmCgWoKz7nJ/bcWl8maqJqHC4cXHdPEzTHB/jTAOXGVWrqwIH8ZVjrk
         vmQoXReWVEEWMa67zIZFN3umnGLKJea7e2eL3hXTWOvxyjnUryQ987Fan+frSBSbV/MA
         aA5BrXfBkmutNHsct1Z5YacwlQdZu8IC4zexdnRNL8If5dIX4z7C3RTwPI/zMLhV6zMW
         mylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774541160; x=1775145960;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XvDKUxnp63sk9ZHITRCSTf+wf8aqBXRHHagMNfACX7Q=;
        b=iCbQ+M6CqYPhMJI88OQE96hRepQiMPSsIJ1oXKN5r2/iJ32tPTQgXkXgZid6vvbX9c
         cCCyinN36EsPDV8JJ4hYfZVchF1LhNBA4q47jZFizZtXjtxyl/CGllSBnwDN4Nj9z4G9
         q/g7s1jdVRpuo5qQLGI6vKKbWTEjVj9MwBd5nSyFTAsjUmdpF40n6V4AxwfEBE4HVNtj
         hLQ/nwKfgLkJ1MZdHORaAtmhdmMVjNCKxXz/rxhb4ZygKEL73rJPJ+RkAgcWkxLEZ0iH
         fZIqt9wrRpQlQCuXCLPb1a8lqqYEsnW5dbQczSfIJOxySJaJufNW4MsjNpHxmHGIBB/j
         aqqg==
X-Forwarded-Encrypted: i=1; AJvYcCWbHnmnPKe4GJ39f+FLn8A2apy58k13DE1VuytOlllBxCgDYSo6QvXjeY4k9EFb8HCi9XWlirmFFWk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+WTGfNA+jM9bEpyIi0tbn0VrH9K/AdI4fNeXTqWPp5HhYZJlu
	WuBMBvP6LNIUbBFeGH92ZsXIMGAijI+ZpfOIh4NH4qw6sgvfFLanovNzZZmYyKoSYA==
X-Gm-Gg: ATEYQzzqmCQRj+fI4kEx6Ykrptkl+vcjRJvwCaiEE3kXZaxV2pZc1rio6f9o333LfEU
	JjCRYt4Y2Xcroq1LYcUyq1JUM0lnKnjoKIHd/Jc1zlKjJ5pBf9bnYO4ynz7tnPcxdKKCzDcvpHs
	6CLwXQTirRdB8lwl+I6yQyqOrw+YbPCL1ItwSVHL9r+p1zs8VAYfwtHwKA1lxhquDMhm4mmlOnx
	RIdCjPrdW73VTU8VO+ZEVAFKPBGJlCquDK0WzrnG9o0WHub55nhwEKO04e9dhcU6KBxClqO86gz
	XqKm8apLbn7xYjgi4s6AATx1sT1N8aUh5beCetTKYWQEogANVVIsU3U5kqHeLx8Ct+tXMoDEd1h
	SNRY4doU3SkJ6WkacZhCKeNd8zjDiuWRWrkZNQQPDItBucKlP2qAn/Tnjsc8lZKFCn85bcUKetB
	TwWIzeYUGicYkNQqUBWxOYqELqxALvyGgkYMCEDqFeBfGIcxZw5ImLRbEa6B2RNuD10Q+GK1EEm
	VgzA25ZKZRuBrI=
X-Received: by 2002:a05:600c:46c6:b0:485:40c6:f507 with SMTP id 5b1f17b1804b1-4871609d044mr133530395e9.30.1774541159782;
        Thu, 26 Mar 2026 09:05:59 -0700 (PDT)
Message-ID: <8043652a-368a-4819-a680-4dbe64168c3b@suse.com>
Date: Thu, 26 Mar 2026 17:05:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] xen/mm: improve freeing of partially scrubbed
 pages
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260326085145.61380-1-roger.pau@citrix.com>
 <20260326085145.61380-4-roger.pau@citrix.com>
 <77e3a765-39dd-4eea-898d-cf9e31912cfb@suse.com>
 <acVWidFD7twir5od@macbook.local>
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
In-Reply-To: <acVWidFD7twir5od@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1774541160-9ACAB112-26B4F518/0/0
X-purgate-type: clean
X-purgate-size: 2508
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AE8CC3381EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26.03.2026 16:53, Roger Pau Monné wrote:
> On Thu, Mar 26, 2026 at 12:50:27PM +0100, Jan Beulich wrote:
>> On 26.03.2026 09:51, Roger Pau Monne wrote:
>>> When freeing possibly partially scrubbed pages in populate_physmap() the
>>> whole page is marked as dirty, but that's not fully accurate.  Since the
>>> PGC_need_scrub bit is preserved for the populate_physmap() allocation we
>>> can use those when freeing to detect which pages need scrubbing instead of
>>> marking the whole page as dirty.
>>>
>>> This requires exposing free_heap_pages() globally, and switching
>>> populate_physmap() to use it instead of free_domheap_pages().
>>>
>>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> Jan: I'm not sure if that's what you suggested in the review of v1.  I've
>>> added your Suggested-by but I can drop it if that's not what you were
>>> thinking of.
>>
>> You're going quite a bit farther. In my comment I really only meant the one
>> new use you add in patch 2 (in which case no changes to the body of
>> free_heap_pages() would have been needed, and hence why I thought that it
>> could maybe be done right there). Up to you whether to keep the tag.
> 
> I see, you meant to change the single usage in case assign_page()
> fails.  I think going a bit further is fine, seeing the adjustment to
> free_heap_pages() is very minimal?

Oh, yes, sure. I was merely trying to address your remark.

>>> --- a/xen/include/xen/mm.h
>>> +++ b/xen/include/xen/mm.h
>>> @@ -153,6 +153,12 @@ unsigned long avail_node_heap_pages(unsigned int nodeid);
>>>  } while ( false )
>>>  #define FREE_DOMHEAP_PAGE(p) FREE_DOMHEAP_PAGES(p, 0)
>>>  
>>> +/*
>>> + * Most callers should use free_{xen,dom}heap_pages() instead of directly
>>> + * calling free_heap_pages().
>>> + */
>>> +void free_heap_pages(struct page_info *pg, unsigned int order, bool need_scrub);
>>
>> Might we better not put this here, but instead in a private header in common/?
> 
> No strong opinion.  It could logically be used outside of common in
> principle, hence we might end up moving it anyway.  Would you prefer
> me to introduce a common/memory.h header with just this prototype?

It would help if others could voice an opinion. To me exposing this
supposedly internal (to the page allocator) function feels a little
risky. Yet of course any undue use would likely be spotted and objected
to during review.

Jan

