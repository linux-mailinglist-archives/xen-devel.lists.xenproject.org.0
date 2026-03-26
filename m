Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMkbF5odxWnr6QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 12:50:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF62C334B9F
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 12:50:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263830.1555657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5jEN-0002xZ-Um; Thu, 26 Mar 2026 11:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263830.1555657; Thu, 26 Mar 2026 11:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5jEN-0002w8-S4; Thu, 26 Mar 2026 11:50:31 +0000
Received: by outflank-mailman (input) for mailman id 1263830;
 Thu, 26 Mar 2026 11:50:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5jEM-0002vm-Nc
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 11:50:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5jEL-00GGfd-Vx
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 12:50:30 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c51d83-5cb7-0a2a0a5109dd-0a2a4509ea66-8
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 12:50:29 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c51d85-e484-0a2a45090019-d1558030a4ff-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 12:50:29 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-48538c5956bso7648095e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 04:50:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722c9f58fsm42493615e9.11.2026.03.26.04.50.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 04:50:28 -0700 (PDT)
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
        d=suse.com; s=google; t=1774525829; x=1775130629; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vtA1slz2tl9+esUZw3uwKOYvWjv+twSqUj92+LiXBA4=;
        b=XyTxUEh9konLt7lUqf4iHebmlMjDFZZO9vx1pW2cKf6euxJoiGSmnVU2rYEDQPYRSg
         7el3zLwda+2Q3ynj8p76tDMRMhG0odyouKnLlhrGzy2py8A8NHsBUQgFZparfWTUNkEy
         mDHy83qSVvqULrIXJMgMph9yC16dkcNdZont7EuiRWokxZDHC3ECpRWHkvqhxwLWbzU2
         2E2tc7+u0UinvkAogsXXLu5WVcf8UnJU2O2tbYkbVzR4oYfiFg7Uc7jP3LtkqH/mvac/
         WcrISoDku1Vs0yewIQoOQvaiunH7S2TdTJeMX9jr6tAtrpWRSEoS9q2nhjLhc1qZKFND
         ZUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774525829; x=1775130629;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtA1slz2tl9+esUZw3uwKOYvWjv+twSqUj92+LiXBA4=;
        b=BQqmFI7ACLV/MxrSTuJjifi6jMXuQ/5CYef3Y4XdvN12b7yyyO5scdTTYje0db1kKY
         2JCX9FeRdo93TAyY9puyAg6OsDjgnBeg6/2a4sDliM2mddlV9Gcp8edWoq/6htDlyxHF
         SeBbVUdGw07jgUDq3AQhL1EVRcOFDNw5yQ10kXqZKft4brDkqSievWq17yLJoC8NXbOE
         gmVifyjgzmad4zxUdzaa7LT0smSV4XVfYkfYRNN2nBbG/sna8cygJxix9rMc3Toxh/q3
         kQ0SQ4fvMUqaAOXAqSilVmP0dfBgKPUwY4gYBxz1RnxmfqTwJyVfvXkCRAvpV8UyA2cM
         Lj4w==
X-Forwarded-Encrypted: i=1; AJvYcCVNcOM+utucQ8l6yyEq0buecgjINMagi2qSkzSMooM00NGkdLpWqPj9P2/EW/vGU6uUtDChArXLhxQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzGQvOQCd/pEFiHZgNV0ZR3tMAxkkyWNwGFs4pA6ACskT6ytgA5
	ihAyO/e9MFAfs3VtaXMtz9BUbd0jv3o0taLK+6Bd1ikJJKcDA7U6zzvEBPOlo+wDPA==
X-Gm-Gg: ATEYQzzd1wZQce91tBq+P3uqLx8zLZIwmwpNVlOEe58DVVPRmjeuvzjCTs+yboj4LR0
	dD8GFy6lgZKJeWWQYAOQ4/fUIc8MBepPloPZCoCrGJnX4vE8U932dhM4z01t7YutyCSQEyi5lmV
	iTR4rdksAidq9aIXL/vu92tTsOxCkd49VpuQnRsALMXdUI17IacoUI8bX6IcSR70T5Cx7DDUsja
	xS8ImUWjr8r070MW8sNdEvAQa6aBee/+t7qRyHX1K0vucg4nI0h0wj48WXjYwwBWgIPBpeYp3gr
	lQCVtAbLAXlupLZPa87qKnslqYnmQtgwqUA2dYiu1z+2Hh3ma8eTMK2QH8TFZJ8yZ0OWjg/2e8/
	5q5KFROh7OSETe1groHhBOeWakMznJwJNvS3+HJIHBC3ogUgOJVPyhtoCsmdkNKMdtC0tNYCup3
	ku2/AUc+davPoPS4Ui03BwBapfx819HwDoAxlB8wf1dX1DYr1asHVuiYirbhS9pZu5rBNAu6i6C
	TKsaoyHbUiFN1Y=
X-Received: by 2002:a05:600c:608c:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-48722bbf747mr19843085e9.8.1774525829025;
        Thu, 26 Mar 2026 04:50:29 -0700 (PDT)
Message-ID: <77e3a765-39dd-4eea-898d-cf9e31912cfb@suse.com>
Date: Thu, 26 Mar 2026 12:50:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] xen/mm: improve freeing of partially scrubbed
 pages
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260326085145.61380-1-roger.pau@citrix.com>
 <20260326085145.61380-4-roger.pau@citrix.com>
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
In-Reply-To: <20260326085145.61380-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1774525829-5BAA4A73-956525AD/0/0
X-purgate-type: clean
X-purgate-size: 3017
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
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
X-Rspamd-Queue-Id: BF62C334B9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26.03.2026 09:51, Roger Pau Monne wrote:
> When freeing possibly partially scrubbed pages in populate_physmap() the
> whole page is marked as dirty, but that's not fully accurate.  Since the
> PGC_need_scrub bit is preserved for the populate_physmap() allocation we
> can use those when freeing to detect which pages need scrubbing instead of
> marking the whole page as dirty.
> 
> This requires exposing free_heap_pages() globally, and switching
> populate_physmap() to use it instead of free_domheap_pages().
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Jan: I'm not sure if that's what you suggested in the review of v1.  I've
> added your Suggested-by but I can drop it if that's not what you were
> thinking of.

You're going quite a bit farther. In my comment I really only meant the one
new use you add in patch 2 (in which case no changes to the body of
free_heap_pages() would have been needed, and hence why I thought that it
could maybe be done right there). Up to you whether to keep the tag.

> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -177,7 +177,7 @@ static void stash_allocation(struct domain *d, struct page_info *page,
>       * interface is designed to be used for single-threaded domain creation.
>       */
>      if ( d->pending_scrub || d->is_dying )
> -        free_domheap_pages(page, order);
> +        free_heap_pages(page, order, false);
>      else
>      {
>          d->pending_scrub_index = scrub_index;
> @@ -210,7 +210,7 @@ static struct page_info *get_stashed_allocation(struct domain *d,
>              *scrub_index = d->pending_scrub_index;
>          }
>          else
> -            free_domheap_pages(d->pending_scrub, d->pending_scrub_order);
> +            free_heap_pages(d->pending_scrub, d->pending_scrub_order, false);
>  
>          /*
>           * The caller now owns the page or it has been freed, clear stashed
> @@ -391,7 +391,7 @@ static void populate_physmap(struct memop_args *a)
>  
>                      if ( assign_page(page, a->extent_order, d, memflags) )
>                      {
> -                        free_domheap_pages(page, a->extent_order);
> +                        free_heap_pages(page, a->extent_order, false);
>                          goto out;
>                      }
>                  }

Along with all of these there's then also domain_pending_scrub_free().

> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -153,6 +153,12 @@ unsigned long avail_node_heap_pages(unsigned int nodeid);
>  } while ( false )
>  #define FREE_DOMHEAP_PAGE(p) FREE_DOMHEAP_PAGES(p, 0)
>  
> +/*
> + * Most callers should use free_{xen,dom}heap_pages() instead of directly
> + * calling free_heap_pages().
> + */
> +void free_heap_pages(struct page_info *pg, unsigned int order, bool need_scrub);

Might we better not put this here, but instead in a private header in common/?

Jan

