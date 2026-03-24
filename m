Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WE8lKTyswmkyggQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 16:22:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D29317EC6
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 16:22:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260972.1554122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w53ZV-0001cE-Hu; Tue, 24 Mar 2026 15:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260972.1554122; Tue, 24 Mar 2026 15:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w53ZV-0001a6-FK; Tue, 24 Mar 2026 15:21:33 +0000
Received: by outflank-mailman (input) for mailman id 1260972;
 Tue, 24 Mar 2026 15:21:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w53ZT-0001a0-UT
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 15:21:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w53ZT-00DC0T-66
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 16:21:31 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c2abf3-5cb7-0a2a0a5109dd-0a2a450cedda-36
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 16:21:30 +0100
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c2abfa-f93d-0a2a450c0019-d155dd36ddc0-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 16:21:30 +0100
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-43a03cb1df9so1549823f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 08:21:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b6470b243sm39568431f8f.26.2026.03.24.08.21.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 08:21:29 -0700 (PDT)
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
        d=suse.com; s=google; t=1774365690; x=1774970490; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5L1sTj3Vr+ZG58jSmqe7T9ByzXbgZJUiuRPRTwWT/30=;
        b=d1Zs1e/1vYaeiE8Ig7lEO5aptSYaFvx6r27UNvNs4iO4OBqYOiqnzOJG0MVM8buXQf
         NOqAx34yllL9uP6SrphUk6ts7d//rqDuYwg6No/yRCEkOADgi51/O+7wVWNNt/ySxCgn
         NYAj2U9EwXxGGr1sRrDz7nkH/VtzJhM74BnrglnXUfK+ysBmUq9b9IVTLrvm/aJdkElO
         O5otjpJzNAq3l6jLmAewp+hxW3YhTkA7T0ZLmerimyikffzXDdRpiD+s3A0sFdvEtHtj
         GCV2rBMPKxkc8UdKMqwqaZev2yaOau8P73lpvh3l5DgH4EC63JE67qRANgDZAfxnoWuP
         Zggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774365690; x=1774970490;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5L1sTj3Vr+ZG58jSmqe7T9ByzXbgZJUiuRPRTwWT/30=;
        b=XnqKvZwZsyWF+E/zJsHNKwt8crccza9STiLDlZp5cv1QHbLjd0Xf0tt7wC0ZtbnBu/
         EAqaAJc8yxeJ2Fi5i0V67WcICdyMpYjSdzIPkb51UXKGnE8Y/inLOjoa622923qGsdGk
         +gklSo2s+pS07yqarHgS8vX/NQCbvy261X8KY2k5hvDgdJ0/6x17A0K52oOq5ssJ+6M/
         g1KDOO8x7Xnvf7HRTwJ1/HK0Y5a8yQhXka6VL8+umWciJO6jHS84+a4gjMQ2QPqoMD7d
         8uF50LuYBUtwKwpuZLL54MB3YXtI3lL+mVu8JYo1yP/2KpZ+WluO5TLjpv9/Ed3hbbod
         +10g==
X-Forwarded-Encrypted: i=1; AJvYcCUFxetkngEuQN7G+8zHXSlqLeLGJ7DGgJwCSv4gBATVCLNwRrvFuxXif7MOlfyeakAx15kP+Q821ic=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzu6C3Je+Ah7yod/Ev8+QfmOX2jAJU5vVZ1ssX6BGJINAnZdl4k
	SoDoeLm6R5aSMUS0pwaCWZl912HSkgzCIpDoPRrTnP5XQ1WAYW0UcUoIO6grANlhVw==
X-Gm-Gg: ATEYQzy6ZK2M6KdKlRiaNAtAKKOABkM5rZyBU/fLPd2o2v2jfhEixeLn/loFUqvwzHb
	9ov3NzE4H3ITjaRKIOgo3D83JdLrhiKKpMw8Rpp3GjpT5FYDauv6GiF6veJUsZVHLo9hHdrbrMb
	O42KX120qpDxHgDmLggO8YsfMpXiWRA2uK35AoI70D/2mwk0dOsOnh7k/cU7HPqHyb4OmAHNio8
	9e6UP4BJZjTgZWS8JTjcGBxqGsYHUvi+qiWVbtj+2B9eohVoULyj4Rn9YiZ8xxvi16GaqgfjWea
	BASpKqmLSrgrmWxov3K8pZ59NojyXaWoB2xWay2hhYHthBsCZnOxDI60tvR50QWYL65qJmHK3as
	Fb8xlnZWfqplwVMmYEQYEn584ItktGQtWzSJNKlXiewN2NFNucUGWfIGAdy53qat1iSBKE1ydrj
	wF8BDw/+9Y2VtEct1wl8UP42YNsJqquJrY9DzWnYyZ3598rFJk9Fh5kgOuvOzllxQu2RZrhep48
	FN6uGF2OFgnn+M=
X-Received: by 2002:a05:6000:2906:b0:43b:498f:b039 with SMTP id ffacd0b85a97d-43b642388bcmr25822861f8f.9.1774365690198;
        Tue, 24 Mar 2026 08:21:30 -0700 (PDT)
Message-ID: <f17c9579-fb91-41bf-b4e8-faf5b79c7c6a@suse.com>
Date: Tue, 24 Mar 2026 16:21:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] ioreq: Unify buf and non-buf ioreq page management
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260316111653.178104-1-julian.vetter@vates.tech>
 <20260316111653.178104-2-julian.vetter@vates.tech>
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
In-Reply-To: <20260316111653.178104-2-julian.vetter@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1774365690-F54B6734-2E1DB27D/0/0
X-purgate-type: clean
X-purgate-size: 4391
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,vates.tech:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 12D29317EC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16.03.2026 12:17, Julian Vetter wrote:
> Switch the ioreq page mapping in hvm_map_ioreq_gfn() from
> prepare_ring_for_helper() / __map_domain_page_global() to explicit
> vmap(), aligning it with ioreq_server_alloc_mfn() which already
> allocates domain-heap pages and will now also map them via vmap().

In debug builds it did so before already, just indirectly through
map_domain_page_global(). You may want to adjust the wording slightly.

> With both paths using vmap(), vmap_to_page() can recover the struct
> page_info * uniformly during teardown, removing the need to cache the
> page pointer in struct ioreq_page. So, drop the 'page' field from struct
> ioreq_page and update all callers accordingly.
> 
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>

What's missing is _why_ you actually want to make this change. Without
that info, one may want to reject the change for adding overhead for no
gain. This would then also help with naming choices like "base_gfn".

> @@ -128,8 +129,9 @@ static void hvm_unmap_ioreq_gfn(struct ioreq_server *s, bool buf)
>      if ( gfn_eq(iorp->gfn, INVALID_GFN) )
>          return;
>  
> -    destroy_ring_for_helper(&iorp->va, iorp->page);
> -    iorp->page = NULL;
> +    put_page_and_type(vmap_to_page(iorp->va));
> +    vunmap(iorp->va);
> +    iorp->va = NULL;

In ioreq_server_deinit() you alter a comment regarding
arch_ioreq_server_unmap_pages(), which calls the function here. The
property described there looks to be lost.

Here (and in the counterpart function below) I think you also want to
leave a comment that this is effectively
{destroy,prepare}_ring_for_helper(), merely using vmap(). That'll
increase the chance of noticing a change is needed here as well in
case those functions are modified.

> @@ -157,17 +163,45 @@ static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
>      if ( d->is_dying )
>          return -EINVAL;
>  
> -    iorp->gfn = hvm_alloc_ioreq_gfn(s);
> +    base_gfn = hvm_alloc_ioreq_gfn(s);
>  
> -    if ( gfn_eq(iorp->gfn, INVALID_GFN) )
> +    if ( gfn_eq(base_gfn, INVALID_GFN) )
>          return -ENOMEM;
>  
> -    rc = prepare_ring_for_helper(d, gfn_x(iorp->gfn), &iorp->page,
> -                                 &iorp->va);
> -
> +    /*
> +     * vmap() is used for the Xen-side mapping so that vmap_to_page() can
> +     * recover the struct page_info * during teardown, consistent with
> +     * ioreq_server_alloc_mfn().
> +     */
> +    rc = check_get_page_from_gfn(d, base_gfn, false, &p2mt, &page);
>      if ( rc )
> -        hvm_unmap_ioreq_gfn(s, buf);

With the comment above addressed, I think this should be possible to keep.
(FTAOD the same isn't true for the other error paths further down.)

> @@ -262,8 +262,9 @@ static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
>  {
>      struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;

This is a good place to comment on the patch title: Here we're dealing (in
unified manner) with both buffered and non-buffered ioreq-s. There's nothing
being further unified in this regard. I think you must mean something else.

> @@ -309,14 +310,13 @@ static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
>  static void ioreq_server_free_mfn(struct ioreq_server *s, bool buf)
>  {
>      struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
> -    struct page_info *page = iorp->page;
> +    struct page_info *page;
>  
> -    if ( !page )
> +    if ( !iorp->va )
>          return;
>  
> -    iorp->page = NULL;
> -
> -    unmap_domain_page_global(iorp->va);
> +    page = vmap_to_page(iorp->va);
> +    vunmap(iorp->va);
>      iorp->va = NULL;
>  
>      put_page_alloc_ref(page);

Operations want re-ordering a little, to retain the prior property of what
the if() at the top is checking for getting cleared _before_ freeing /
unmapping anything.

> @@ -819,12 +821,12 @@ int ioreq_server_get_frame(struct domain *d, ioservid_t id,
>          if ( !HANDLE_BUFIOREQ(s) )
>              goto out;
>  
> -        *mfn = page_to_mfn(s->bufioreq.page);
> +        *mfn = page_to_mfn(vmap_to_page(s->bufioreq.va));

You did look at what vmap_to_page() expands to, didn't you? If you did, didn't
it occur to you to use vmap_to_mfn() directly? (Applies elsewhere as well.)

Jan

