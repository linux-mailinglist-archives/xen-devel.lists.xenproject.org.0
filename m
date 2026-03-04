Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLo3N3xeqGmZtgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 17:31:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8242044D5
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 17:31:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245771.1545158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxp8I-0003fB-K9; Wed, 04 Mar 2026 16:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245771.1545158; Wed, 04 Mar 2026 16:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxp8I-0003d5-Gm; Wed, 04 Mar 2026 16:31:34 +0000
Received: by outflank-mailman (input) for mailman id 1245771;
 Wed, 04 Mar 2026 16:31:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xh4z=BE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vxp8H-0003cx-JE
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 16:31:33 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9773717d-17e7-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 17:31:27 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-439b2965d4bso3461439f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2026 08:31:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b4e771basm30370129f8f.0.2026.03.04.08.31.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 08:31:26 -0800 (PST)
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
X-Inumbo-ID: 9773717d-17e7-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772641886; x=1773246686; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cho1gBbzdAzbi5aNRaJ7Aduz2iliIVIo2vn0mUgOkJo=;
        b=KW6nYc4xe+PeGitlnpLpnSAdwSg2ZuxwXKvBDCBZ4sAMjId5L52CaaXNRKiXwokwTc
         lvNR3+rXZ48Z2w3jBDCoknAFpp3APhF28PNuQQF3OBaLAoQGabWDaauqIkxkJqWOmAtL
         xJwBKz2/ZIHyseesKBimVZ3h9loz1fOU46ZOEt+B2uswn5dkkmbt/JplJximnoIEUJ10
         U3oPMYPKd0NN1Q1adFE+2XAurXH711VdI0iaZQEWo5eL51dTp9YpZoXVBrXZaRT4LCFE
         ApPPn/8dNsjlYr3jwV3b1URVYGHp7Y9ry7UvH0hVE//d96LpaYqv3pMd30UE4T2rQC5Z
         J5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772641886; x=1773246686;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cho1gBbzdAzbi5aNRaJ7Aduz2iliIVIo2vn0mUgOkJo=;
        b=vCv/L4dkih5zUrUSk2za+/1N+QqGwBXWN+Ll94GNxAiOng0voxLYAkDaJubL4YQif7
         e7du5KXq2S31rOGsFRBoRb912SP6BH3UsWVy/n6zwtS5+XO1mzY7kA5W3M3HNnjc43hS
         4uQ84NPDt3chrlN2nNhnOJXFrnAlxgGZdnUS2qzz1U9vUg3AjrfUP9RH7WZBTsyz8IKk
         q9s4eZh7Rv1CrJFhYiqUGw6UNvfeBoNJYXdOhwYmp9c9qUfZckZfMrA/7/29AYdhDI1I
         0Q/bCyWx/1FHiys9GPCfIygz7RkchD0WJAezlAlRYr2mI5cvPXqlvqrf4DwYD2M81i7R
         xJMw==
X-Forwarded-Encrypted: i=1; AJvYcCXBqsBwvoZOa/ezaA9PyGyzoWec+0K53lmwPZAiZ3kX3yqXtI2ltxsHhVXQc1YNWB8VsBCnug/SFO4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxPQ02Lz0DJIsO1T+/3b0Tuh44taK1nCzi1hprfz6iCuzFc5cvp
	bKYdzVxoQkMcO3vGpdOSah6g9WaNt/dOATwumsBtydGZB3VTJ79tf2Zpwd0xcKBCeg==
X-Gm-Gg: ATEYQzyqgejZUAvaC/9kZVb+HUo17XMwnyRJfwlfLBAGzG2ADZTfv7aEelFojjGpg39
	OmyT0+WZpab1U5KgbuLi1vwYAkEHXAjcy8Fej3VclNl1764hjWcpDwlSeI94gIkHzGA+PUE75US
	mGYne+WOgnbAuKBdW5kIRN5qusdEojUcYiEAKhqNSZttYzbgciGuUixVKqRkl2pU+uKdP5P9yDL
	04uB/wIKnn5REy6LqeJoueqb0ad4ONF3eagOTEi+rGzPKtXn+diLAPVTTr7ysWLY9hQ/eGf4I3D
	cuu7QDl8h2D/BFgnR/4KS95NF5qHD6KJLk+cpYK/QY7Hd8Lulioxk4Zyqm3ozX7AcCa/v16aoC1
	+8zBB3lw6cgwc96DXbGnqSt9lvO7z/UIwp/jZmA5TayYHXsC+dPRT+han2xztiAol0DPOZr0O/I
	nC89o/R/CSo07NpCc3mAQdzIj4+Gxytk0CVGekHSkXEhz8H1dr3AGHR6v41Zp0Fe3EYq3T09Djl
	FuRxHbA52UtB9g=
X-Received: by 2002:a05:6000:1373:b0:439:ca9b:1f61 with SMTP id ffacd0b85a97d-439ca9b1fe5mr2735480f8f.17.1772641886481;
        Wed, 04 Mar 2026 08:31:26 -0800 (PST)
Message-ID: <5e4d4674-1e1a-4902-bcd0-a24fbd13dc8e@suse.com>
Date: Wed, 4 Mar 2026 17:31:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/10] xen/page_alloc: Optimize getting per-NUMA-node
 free page counts
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1772098423.git.bernhard.kaindl@citrix.com>
 <c56658d1248660543fdba162810b0629c081bd94.1772098423.git.bernhard.kaindl@citrix.com>
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
In-Reply-To: <c56658d1248660543fdba162810b0629c081bd94.1772098423.git.bernhard.kaindl@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4F8242044D5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,cloud.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 26.02.2026 15:29, Bernhard Kaindl wrote:
> From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> 
> Add per-node free page counters (node_avail_pages[]), protected by
> heap_lock, updated in real-time in lockstep with total_avail_pages
> as pages are allocated and freed.
> 
> This replaces the avail_heap_pages() loop over all online nodes and
> zones in avail_node_heap_pages() with a direct O(1) array lookup,
> making it efficient to get the total free pages for a given NUMA node.
> 
> The per-node counts are currently provided using sysctl for NUMA
> placement decisions of domain builders and monitoring, and for
> debugging with the debug-key 'u' to print NUMA info to the printk buffer.
> 
> They will also be used for checking if a NUMA node may be able to
> satisfy a NUMA-node-specific allocation by comparing node availability
> against node-specific claims before looking for pages in the zones
> of the node.
> 
> Also change total_avail_pages and outstanding_claims to unsigned long:
> 
> Those never become negative (we protect that with ASSERT/BUG_ON already),
> and converting them to unsigned long makes that explicit, and also
> fixes signed/unsigned comparison warnings.

This wants to be a separate commit. It hasn't got anything to do in here.

> This only needs moving the ASSERT to before the subtraction.
> See the previous commit moving the BUG_ON for outstanding_claims.

Please can you avoid such statements? You won't know in which order the
patches are committed: Patch 01 may go in weeks or months before patch
02.

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -483,11 +483,32 @@ static heap_by_zone_and_order_t *_heap[MAX_NUMNODES];
>  
>  static unsigned long node_need_scrub[MAX_NUMNODES];
>  
> +/* avail[node][zone] is the number of free pages on that node and zone. */
>  static unsigned long *avail[MAX_NUMNODES];
> -static long total_avail_pages;
> +/* Global available pages, updated in real-time, protected by heap_lock */
> +static unsigned long total_avail_pages;
>  
> +/* The global heap lock, protecting access to the heap and related structures */
>  static DEFINE_SPINLOCK(heap_lock);
> -static long outstanding_claims; /* total outstanding claims by all domains */
> +
> +/*
> + * Per-node count of available pages, protected by heap_lock, updated in
> + * lockstep with total_avail_pages as pages are allocated and freed.
> + *
> + * Each entry holds the sum of avail[node][zone] across all zones, used for
> + * efficiently checking node-local availability for allocation requests.
> + * Also provided via sysctl for NUMA placement decisions of domain builders
> + * and monitoring, and logged with debug-key 'u' for NUMA debugging.
> + *
> + * Maintaining this under heap_lock does not reduce scalability, as the
> + * allocator is already serialized on it. The accessor macro abstracts the
> + * storage to ease future changes (e.g. moving to per-node lock granularity).
> + */
> +#define node_avail_pages(node) (node_avail_pages[node])

This isn't really needed when ...

> +static unsigned long node_avail_pages[MAX_NUMNODES];

... it's a static array anyway. Plus you may want to talk to Andrew regarding
the use of such a macro as an lvalue.

> +/* total outstanding claims by all domains */
> +static unsigned long outstanding_claims;

As you touch it, comment style wants correcting.

Jan

