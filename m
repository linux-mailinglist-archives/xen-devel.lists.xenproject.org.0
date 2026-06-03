Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fgy7HEEeIGqCwAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 14:29:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D32F6637825
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 14:29:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=TqYZUISU;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1326147.1591581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUkiF-0004Lh-Qv; Wed, 03 Jun 2026 12:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326147.1591581; Wed, 03 Jun 2026 12:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUkiF-0004JL-OL; Wed, 03 Jun 2026 12:28:47 +0000
Received: by outflank-mailman (input) for mailman id 1326147;
 Wed, 03 Jun 2026 12:28:46 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUkiE-0004JF-EJ
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 12:28:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUkiD-006dL6-Cb
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 14:28:45 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a201def-2eae-0a2a0a5409dd-0a2a450c88b0-38
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 14:28:45 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a201dfc-62f1-0a2a450c0019-d155802ac166-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 14:28:45 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-490b2b037d2so16070895e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 05:28:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2ed944sm7528208f8f.13.2026.06.03.05.28.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 05:28:43 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780489724; x=1781094524; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rP22kDExa/ctfuohdGJtotFhk/gyIcpq1jo8pcUKPWY=;
        b=TqYZUISUizgM584nmrTEYKEPgO0e1CZJEbG1B7Mw4RYxKhgR5dO4eF2ELZiJOAkcNx
         Wl6l2FfnuO14WEyfXo0qfvZvNhxOiD5pBsIGUA2DP2RSUpBGSOqwJuS418YC9Vv+cx7C
         2w5bWS2dltWtbDVn5uwAnzDtuwhqtRKTf6ZClV/E5y8AJDmJ7oCcYdns+U96Oo/SokLl
         R6ypDt9yjpH3eMQPYLJhLe8ZMlHuM4Xqz+W/PD944n3ddOCw/b+r505yE3HCVBziN66e
         2d10PKb4BdjHqm5hFPkgOlCKUIqgH2nijQyL32fi9nzOkWqu1cK3mvcJkcOtR4c7p8V9
         SwuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780489724; x=1781094524;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rP22kDExa/ctfuohdGJtotFhk/gyIcpq1jo8pcUKPWY=;
        b=Iep1J++FTJDQ+/vsxGOExfqoZjAdbjOif96QMkUHC6qqf0BITUm56Cmgj9wstBD8QO
         7WmNKwZKMQ97iuIU0VLPWAOrD1IC1813ee8D9VaeHCsPbVbzedhzj0rkUvkvyZB4kQXc
         As6v21fyy9QIsy6CCP2VW+gO5UrgB/yLHkhmaVXPB88Ws5n+dFfbokOgG7S0uMK0gPiD
         k6ztv6f4oFOHmjgu1RjoLbBbDwl0OW4jZJXycyP4OTsRrk/7Au48sTmkie9br5gOW7dk
         LepgfCMQwNg251jsBHztV18eJ6OL03hUKl7qWrayLVdv5ob8ADmVPFD7NF+u4QTqb900
         qRHQ==
X-Forwarded-Encrypted: i=1; AFNElJ9AUKb4JRFt+rme2kKdV5VR4iBM7lPlYhr5zQMXEaJ4eKdfy2n73BXxH6pwqRLrKNEg1esoTYbRcBM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxzufov6PHEJGd+6qVDXKL3Ys1WHEb4obh+0wIwtSeVmblVAXAU
	o1AKfojc9GJNEVw0818Vgv7TC7lQwI31gWcuHmYaZGSkDAsmKYtUJ0e3vg8RSS2gcA==
X-Gm-Gg: Acq92OGRYf2B0K2Wq2QUqzWi/L8uufB0/qXdJbXNeft+zjoMw0vhtX8qJHbeDd9lW18
	0UwNIZB5dAGlqAHOvhnHtP+esq7XtOg5zeGpsaRbLf+wPq2B/ZpyGz1dXj4RzP94KKwMVv0x7A2
	jBABHt2K95IAOp5aCTVDINFr9riU5PCWXqMVY4pE9PM0fCMnle09XWOIpNjosxnjRGYCdAnvf6f
	GB5Q6v+GaxTWeGgMjl3vCXIIaUcyD/VUcp/4Y/xSQBg6lmf3sYXvgWH4y7jN0Vzk12vDJ6AR5ra
	UwGXUe5Gkch314KRyNiILsSnk/ryHIfJCKZ4ou0PUEAlREfjGTPzof9mV1FvWInUDbT6XVAXq//
	SIahsaYt7O/CmF/ZpNips7KpK02/7KfW9lH5u3tbIJLzdAKp8S9cshi4koJtaeTe5zboPonEnrq
	IudztEbVHrbNE0vmC9ad4E+stWYwkYRvXYGozYRmeaCX0C28JMFolVFuXda/kJ1MoKmHG5+u0RI
	BUT5QmEb47Uxk+Jgsg4q+hKKg==
X-Received: by 2002:a05:600c:1392:b0:490:b202:4772 with SMTP id 5b1f17b1804b1-490b5e95f69mr53422555e9.2.1780489724215;
        Wed, 03 Jun 2026 05:28:44 -0700 (PDT)
Message-ID: <4f03728e-22a2-435c-8d80-eeccefdf3a31@suse.com>
Date: Wed, 3 Jun 2026 14:28:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] xen/mm: Recall claims when offlining pages if
 needed
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1776690702.git.bernhard.kaindl@citrix.com>
 <ebc02ab7b6fe81946ccf5833a44d57fb4a3239a4.1776690702.git.bernhard.kaindl@citrix.com>
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
In-Reply-To: <ebc02ab7b6fe81946ccf5833a44d57fb4a3239a4.1776690702.git.bernhard.kaindl@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1780489725-E0766CF5-5528F1A8/0/0
X-purgate-type: clean
X-purgate-size: 4027
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:from_mime,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D32F6637825

On 20.04.2026 15:19, Bernhard Kaindl wrote:
> Fix a bug where offlining pages could cause an unsigned underflow
> in total_avail_pages - outstanding_claims, leading to incorrect
> claim behavior.
> 
> This issue arises when outstanding claims are close to the total
> available pages. It occurse when domain_set_outstanding_claims()
> and domain_install_claim_set effectively do this:
> 
>  unsigned long avail_pages = total_avail_pages - outstanding_claims;
> 
> When this unsigned subtraction underflows, staking claims can succeed
> even when there is insufficient unclaimed memory for the new claim.
> This leads to a state where claims always succeed, regardless of
> actual memory availability.
> 
> To prevent this, recall claims when offlining pages if needed to maintain
> equilibrium between `total_avail_pages` and outstanding claims for global
> and for per-NUMA-node claims.
> 
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>

First: This patch being a bug fix (which, btw, lacks a Fixes: tag), it wants
to move ahead of the NUMA claims series, to facilitate backporting.

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1575,6 +1575,48 @@ static int reserve_offlined_page(struct page_info *head)
>          count++;
>      }
>  
> +    if ( count )

Why did you decide to put this in reserve_offlined_page()? The function has
two callers, yet in one case the extra checking is entirely unneeded afaict.
While in the other case we further know that it's exactly one page which is
being offlined.

> +    {
> +        long recall_pages;
> +        struct domain *d;
> +
> +        /* Ensure that claims on the node are in line with its free memory. */
> +        recall_pages = node_outstanding_claims[node] - node_avail_pages[node];
> +        if ( recall_pages > 0 )
> +            /*
> +             * node_avail_pages slipped below node_outstanding_claims.
> +             * We need to recall claimed pages until the amount of claimed
> +             * memory is in line with the amount of available memory again.
> +             */
> +            for_each_domain ( d )

Such loops need serializing against domain list modifications. Also we really
don't want to loop over all domains twice.

> +            {
> +                if ( d->claims[node] )
> +                {
> +                    recall_pages -= deduct_node_claims(d, node, recall_pages);
> +                    if ( recall_pages <= 0 )
> +                        break;
> +                }
> +            }

So domains early on the list are penalized over ones later on the list? The
only truly fair approach I can think of right away looks to be to discard all
claims, requiring the toolstack to re-establish them. With the observation
above the next best approach might be to cycle through domains, removing one
page from their claim and recording where we left off (the per-node part
would be slightly more involved). However, any reduction of a claim is likely
to render that claim useless altogether. Hence requiring admin action (to
re-establish claims) may still be the least bad option.

Jan

> +        /* Ensure that outstanding claims are in line with available memory. */
> +        recall_pages = outstanding_claims - total_avail_pages;
> +        if ( recall_pages > 0 )
> +            /*
> +             * total_avail_pages slipped below outstanding_claims.
> +             * We need to recall claimed pages until the amount of claimed
> +             * memory is in line with the amount of available memory again.
> +             */
> +            for_each_domain ( d )
> +            {
> +                if ( d->global_claims )
> +                {
> +                    recall_pages -= deduct_global_claims(d, recall_pages);
> +                    if ( recall_pages <= 0 )
> +                        break;
> +                }
> +            }
> +    }
> +
>      return count;
>  }
>  


