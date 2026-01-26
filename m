Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IkxED1Od2n0dwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 12:21:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 773B987958
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 12:21:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213589.1524047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkKem-0006ju-7Z; Mon, 26 Jan 2026 11:21:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213589.1524047; Mon, 26 Jan 2026 11:21:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkKem-0006hS-4K; Mon, 26 Jan 2026 11:21:20 +0000
Received: by outflank-mailman (input) for mailman id 1213589;
 Mon, 26 Jan 2026 11:21:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fT7M=77=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkKel-0006hM-H7
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 11:21:19 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21cc5a2e-faa9-11f0-9ccf-f158ae23cfc8;
 Mon, 26 Jan 2026 12:21:17 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47ee2715254so22268055e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 03:21:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1f7474csm30252505f8f.37.2026.01.26.03.21.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 03:21:16 -0800 (PST)
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
X-Inumbo-ID: 21cc5a2e-faa9-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769426477; x=1770031277; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E43DcvrP5beWQgrbmajUhgvk0qNAxaHXNrsdJr5xH8U=;
        b=OQ6fUcUBJPApooxFwVfaaQzK76slc/u1+W8vBZve1gS9Lw6EfVi8iyK6a88Pe3vxxA
         VvTw6WoLHnOuSkEjyV0k/J1jOTye2Bzle+MI4WJPzeMHG4MJMovYRTLSuQ07xn/o3o1A
         fmfae01n4ETcUPbgt8ctM54fDsCA+/1rbZeFrQ9CgWicKOGVzAh5CHfeJhzi9/kzi1Ni
         8j9f+onVXx2ZPy9Ov4HwV7t5Rl8bC8iwYh9kjkVxnchFltZcvErGMt38B6k4IAD7xf7B
         vlc4JGlccfT45PDWYMzJUpaxQSB6fNwBv/+V30E3hFHb2KLMPPd8fpNk8mEkB7Lq/pe2
         BRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769426477; x=1770031277;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E43DcvrP5beWQgrbmajUhgvk0qNAxaHXNrsdJr5xH8U=;
        b=Jv/7vcIZeg4QWnsDb/ZGrqjKDvKoqJvdSdM2F5V4F1DnW35CMLhXL0zRzF6etA4YJ0
         Waq7LwLN+mXoBkLr0v12Y3EiiFhurhbDQQzZ7bzW8EkYJmkkjivFda5SeHVbIzvi9ICo
         IppKkTH4bE3igHcwP6I4bau2wZSeBTCxE8ToWqh9b2wqJxyR772C/C2Mmo//fiU6VpQq
         asLmzg4VhHd3UkRRNWjwEVt7Rcqw2uI90l8Hoe/3yv+y8+Yy+OjYeLmqeybYEvb6uIsQ
         IbgNuagGalJQMUp64fL4mgxGc1oHYO8ws+IetbAHW2pWZ/5NHwpglB6RMIaquABLqHv4
         Oy3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLEwZ4M4sSjPD3Fz2hUO502UUqxGJXwEd+F9CfWSfg5k/xi2r2UXiUem8D1etTPBOHTye8ifHrmco=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVVbZNUOdOWNQC4UkeuWONpCk62mmjx6NMsOSjvHk30ep5i8++
	VX9ZDyBltn54yTL5CGaTYqYQ+J1/w51uyA1kWNe+UDtBoXDTIZiz90pjmmSDmNUjLQ==
X-Gm-Gg: AZuq6aKSSOn2AF88EljGPEepmBjEwSspy5QuX43dS2CJuvlsi0ESriV5+YxYfdEySRm
	d9UyxUSH7TwpxULr9nuixLZ5ZHVOvynFd286m1gVIVd1mLqBxANd4zu+AAn5ZFEOdxTkgQuQOQc
	AMNlDXJYcdnDypc4FH0wVhzVQ5MUhlUZj2CVUMmW3x4aYY8APHQ7ZMjWUqHZqiiECRTuxmogqRK
	p8mZzOHxVESZmJ93MWkkCh6NYnl6f+UfUwQd0cqG3xLqYEGwuNZitRMKt131T5zeTNyLZ79MduA
	e6pk+LMAFwKzhvrjOCkoiXd24h3oNOBHjOa30Zq1M9j+MwG6vfSjW+audPKQF/pKi8TUDlCLpD6
	lg6Ov0VJ3pTa4LuJdyBwzVN5iQa346b6/1UD1I7iTGpxmg0edkdGh7JA1xCvxZjkmq6d7arLcLL
	ta3irxahuvWA/NzLEpRqj8XwePlZvzUBLaJc/oGnOVivmnNDsgQvaFK67kumM42llSxLxDIG48c
	mo=
X-Received: by 2002:a05:600c:6291:b0:480:20f1:7aa6 with SMTP id 5b1f17b1804b1-4805fa93271mr49848865e9.21.1769426476697;
        Mon, 26 Jan 2026 03:21:16 -0800 (PST)
Message-ID: <0ff49a6b-67d3-4b2e-bf9f-4b752cfc24aa@suse.com>
Date: Mon, 26 Jan 2026 12:21:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] xen/mm: limit non-scrubbed allocations to a
 specific order
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260122173857.83860-1-roger.pau@citrix.com>
 <20260122173857.83860-4-roger.pau@citrix.com>
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
In-Reply-To: <20260122173857.83860-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 773B987958
X-Rspamd-Action: no action

On 22.01.2026 18:38, Roger Pau Monne wrote:
> The current logic allows for up to 1G pages to be scrubbed in place, which
> can cause the watchdog to trigger in practice.  Reduce the limit for
> in-place scrubbed allocations to a newly introduced define:
> CONFIG_DIRTY_MAX_ORDER.  This currently defaults to CONFIG_PTDOM_MAX_ORDER
> on all architectures.  Also introduce a command line option to set the
> value.
> 
> Fixes: 74d2e11ccfd2 ("mm: Scrub pages in alloc_heap_pages() if needed")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Apart from a nit (see below) looks technically okay to me now. Still I have
an uneasy feeling about introducing such a restriction, so I'm (still)
hesitant to ack the change.

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -267,6 +267,13 @@ static PAGE_LIST_HEAD(page_offlined_list);
>  /* Broken page list, protected by heap_lock. */
>  static PAGE_LIST_HEAD(page_broken_list);
>  
> +/* Maximum order allowed for allocations with MEMF_no_scrub. */
> +#ifndef CONFIG_DIRTY_MAX_ORDER
> +# define CONFIG_DIRTY_MAX_ORDER CONFIG_PTDOM_MAX_ORDER
> +#endif
> +static unsigned int __ro_after_init dirty_max_order = CONFIG_DIRTY_MAX_ORDER;
> +integer_param("max-order-dirty", dirty_max_order);

The comment may want to mention "post-boot", to account for ...

> @@ -1008,7 +1015,13 @@ static struct page_info *alloc_heap_pages(
>  
>      pg = get_free_buddy(zone_lo, zone_hi, order, memflags, d);
>      /* Try getting a dirty buddy if we couldn't get a clean one. */
> -    if ( !pg && !(memflags & MEMF_no_scrub) )
> +    if ( !pg && !(memflags & MEMF_no_scrub) &&
> +         /*
> +          * Allow any order unscrubbed allocations during boot time, we
> +          * compensate by processing softirqs in the scrubbing loop below once
> +          * irqs are enabled.
> +          */
> +         (order <= dirty_max_order || system_state < SYS_STATE_active) )

... the system_state check here.

Jan

