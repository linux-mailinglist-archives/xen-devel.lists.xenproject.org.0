Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N5GoOeLCKmqNwQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 16:14:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E25E672A27
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 16:14:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=fBBvBDzi;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1335611.1597801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXgB6-0001M8-B1; Thu, 11 Jun 2026 14:14:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335611.1597801; Thu, 11 Jun 2026 14:14:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXgB6-0001Jx-8L; Thu, 11 Jun 2026 14:14:40 +0000
Received: by outflank-mailman (input) for mailman id 1335611;
 Thu, 11 Jun 2026 14:14:38 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wXgB4-0001Jp-Al
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 14:14:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXgB3-006lyS-Nb
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 16:14:37 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2ac2b3-5cb7-0a2a0a5109dd-0a2a4507d422-42
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:14:37 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2ac2cd-229c-0a2a45070019-d1558030bc02-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:14:37 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-490e1904089so12603005e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 07:14:37 -0700 (PDT)
Received: from ?IPV6:2003:ca:b70d:3054:345c:e2ed:ca23:72c4?
 (p200300cab70d3054345ce2edca2372c4.dip0.t-ipconnect.de.
 [2003:ca:b70d:3054:345c:e2ed:ca23:72c4])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e5314dedsm61733445e9.9.2026.06.11.07.14.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 07:14:36 -0700 (PDT)
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
        d=suse.com; s=google; t=1781187277; x=1781792077; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8c0UumPY++RY+GdKhUDJVlGKm6PQgjTrG5mmy4h4u4Q=;
        b=fBBvBDzibkrXLHfdVoaRmAaHrOJ+VKhxf4PGtRoddiTnF9mqnzBFg9pjMotC02hOGp
         RsU/HwOq8mwx47UbSAsCbi97y7uPrQw8SqxW2yOkvmm8JduDPxyUKVckW1cQe7juXkwm
         5QsNiQNH4vlViCa9fYFv8k+qdtfS5/P9ZGdVqlmI+DD5tF4m1LURNahNln33KTSqdoYF
         0Lp6xz+UVh5somjGpseV6GtLCcXoU7XwZWHrQ6YkILNPRWEH85tc4KXCHFwK2KieJQU+
         SlSpKh9pEz1rvuQnqelGBMqw5bX31P0e7kOsA6tATLNQYsFWNYW1CQvHFrBxA37h0wCc
         rh6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781187277; x=1781792077;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8c0UumPY++RY+GdKhUDJVlGKm6PQgjTrG5mmy4h4u4Q=;
        b=LjrUk7QCsCrZf9KzpIMiJyWewp/uG/1Puz3AkuRjDWFslktUq4IVpduBmjJFDxGmzI
         TRWjOv7d6PDCY+ziasyrMOvLL4nIQ/DhiYPoEO2uVXBdYPfo9B7QoRiZFmViZ78xXXgS
         2lPnzCs3qT2LrQCgxwzc4Udoh8oQ3D1c38X+kQVx2n6hukYfNGGRK9SR3HrgfNBJqfHz
         ag1gdZGsI/E1caMrgoTOQSHq0ExFpQaI4TCvh7cGN/wulmoQJJny4M/thJwuaeeSDsxH
         Kt8qfkjVdBq0sED70p44vx94sCBcqqaxuUIo++CEipFN2AVFfvqVDxRtoFwh3MA6XqfA
         UKOg==
X-Forwarded-Encrypted: i=1; AFNElJ+X+6nWM3bq/HdxH8QQVAPfCVjkZHyO79cWnxcu3k3ZUcz8b0LaGDV70FxC5JZy2l5aqOuGHgu1Z5k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykEzJ1BaoipAWzgk6W1xmgQ5KZaI7mnqfXgzNMCbXEjrTqTfmx
	wpIDgSuVhU6082u+dNyFpeQQks16VG41sZrpAFBPpBV5Te8ZqtR+qp1FBDrgGnsMHQ==
X-Gm-Gg: Acq92OH9gdDfACz6vOwXUKRVd8R1js2eMW13pZzFfm0Qm1Bge8C6f6pml7iD5PaBTum
	MnAtK6KnUBrSGv1GIgjal4UVfz5u/c6jMWErAp7mDHEfWw+u1q+0qiBhzIBsEWOyNnjH8bzHT6r
	oFa/o77eMN/ng/DAdx/c8potspx8oi5dir5WNdkj1CF+mYzvlQsqeiaOmiYA5hW/uh6QJd14b25
	ZRMkX3rslyv5szVRSXgCQlfCKFR75/EFLxERK5HmqcYnpg7//T9afSOO/TfgQ9yGHj1KoZ6wwYs
	TV6GtGa/AeIUCUUfhxGB4MjWB41ZKqtgEUXv4wTk1sY+s711eysWCgAQAsLeqrXnPAv1/esMVN9
	eqg4N4wgity0jIMShA84milVYej4+KlJPZzr7cPfvXz1vH7OgfvfyVec6WmGNDsBQEmlMq+jsCQ
	9f+aot5qKO/vT+YXntS5M3vX4TXcuYCBmNNLv13xIM/aDAAYkEzet5yIZ38vgjlRucNdnHTfGWw
	eNIIulPHp9k1/rkvZEQwKjsex65Oc39BESj2PkGFLROQfc//89OIfmcBeHvMbtbc61GLrY=
X-Received: by 2002:a05:600c:8b2b:b0:490:44eb:c1e7 with SMTP id 5b1f17b1804b1-490e561447fmr40603585e9.30.1781187276983;
        Thu, 11 Jun 2026 07:14:36 -0700 (PDT)
Message-ID: <188b21b9-dd46-4414-861c-20a0ff28c23a@suse.com>
Date: Thu, 11 Jun 2026 16:14:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] xen/sched: Make cpu_nr_siblings()
 architecture-specific
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: Mykyta_Poturai@epam.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <20260610111320.133784-1-taka@valinux.co.jp>
 <20260610111320.133784-4-taka@valinux.co.jp>
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
In-Reply-To: <20260610111320.133784-4-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1781187277-21F6EC48-F2815F6F/0/0
X-purgate-type: clean
X-purgate-size: 1701
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:mid,suse.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:taka@valinux.co.jp,m:Mykyta_Poturai@epam.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3E25E672A27

On 10.06.2026 13:13, Hirokazu Takahashi wrote:
> --- a/xen/common/sched/credit2.c
> +++ b/xen/common/sched/credit2.c
> @@ -29,22 +29,6 @@
>  /* #define d2printk printk */
>  #define d2printk(x...)
>  
> -/*
> - * TODO: Abstract this properly, and figure out what Credit2 wants to do with
> - *       the fact that x86_num_siblings doesn't even have the same meaning
> - *       between x86 vendors.
> - */
> -static unsigned int cpu_nr_siblings(unsigned int cpu)
> -{
> -#ifdef CONFIG_X86
> -    return cpu_data[cpu].x86_num_siblings;
> -#elif CONFIG_DT_CPU_TOPOLOGY
> -    return cpu_topology[cpu].num_siblings;
> -#else
> -    return 1;
> -#endif
> -}
> -
>  /*
>   * Credit2 tracing events ("only" 512 available!). Check
>   * include/public/trace.h for more details.
> @@ -884,8 +868,11 @@ cpu_runqueue_match(const struct csched2_runqueue_data *rqd, unsigned int cpu)
>   * Additional checks, to avoid separating siblings in different runqueues.
>   * This deals with both Intel's HTs and AMD's CUs. An arch that does not have
>   * any similar concept will just have cpu_nr_siblings() always return 1, and
> - * setup the cpu_sibling_mask-s acordingly (as currently does ARM), and things
> - * will just work as well.
> + * setup the cpu_sibling_mask-s acordingly, and things will just work as well.
> + *
> + * TODO: Abstract cpu_nr_siblings properly, and figure out what Credit2 wants
> + *       to do with the fact that x86_num_siblings doesn't even have the same
> + *       meaning between x86 vendors.

Hmm, the "abstract properly" part is being addressed by this patch. Why would
you keep saying it needs addressing in the comment you move?

Jan

