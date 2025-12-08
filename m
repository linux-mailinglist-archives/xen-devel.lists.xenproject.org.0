Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D52CAD567
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 14:52:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180620.1503775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSbfI-0004Xq-3X; Mon, 08 Dec 2025 13:52:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180620.1503775; Mon, 08 Dec 2025 13:52:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSbfI-0004VO-0B; Mon, 08 Dec 2025 13:52:36 +0000
Received: by outflank-mailman (input) for mailman id 1180620;
 Mon, 08 Dec 2025 13:52:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSbfG-0004VI-2E
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 13:52:34 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24e8d5b3-d43d-11f0-9d1b-b5c5bf9af7f9;
 Mon, 08 Dec 2025 14:52:32 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso42448435e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 05:52:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbe9065sm25699159f8f.8.2025.12.08.05.52.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 05:52:31 -0800 (PST)
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
X-Inumbo-ID: 24e8d5b3-d43d-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765201952; x=1765806752; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5OGmuY/s70Mm4N3lbFLxhswtbQorlbGFNiJTXxcG4js=;
        b=PpJjy5NmesKnsrRmgZFWXJ3zBr4HCYAchBU5w65yi+bwpDBCsWrpa0bR0VWzgp2DFG
         oLK5rcMtBa0nnZMkR+5shy8jc5mbh9EjGwIypFfC26BWzG/MrXPZn3a2UkAbcatKJiUf
         tFCrvYbSR4SPQow4+TxBS+QDAk1TIB997MH1mbq5NqR+RsbRitErFnhBVthJzqqf91En
         kYhS0XMTjJ5QY+GJuKlslFs76Re4ji5QkvEFUckh2dEtupymMHaXJKWU+jkG8Eq/Xu+M
         tx5P8IPqNSCeL0lfgMvnBYST22syKcmFFv6GXQDzDae+D8J3QrDMVK0gnJQ047kQzs4O
         RR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765201952; x=1765806752;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OGmuY/s70Mm4N3lbFLxhswtbQorlbGFNiJTXxcG4js=;
        b=dliY4nEq8HdxYVWe0TkQIqjJDW/nnnAq8xOibS0bBxZKPIadncv6exu0eFGPpf7Dmp
         84WsG9l16buB1IVkKtooTKFRM57GHBozYor3RINr88Lbl4on0Ky60WKAVfNh57wMS9ii
         qSZazwxI7H0jhW5+8AmuEaeKpcj/depyboUkFnK7K/vyHgYpVv6cnVe3eDOl58q9Sjsr
         iX0nHGKoRAF+bZr5QVmcjSuq3OthPU7SE/FwSoVCs8KCSKC7sgfowJTPL5b4Kwr13Xwq
         QM9C6iFWZKDVKiwPI8xzm2GCQh0DtbAANj9yuQ7IUii6zb2hyxDE5kq8A2rPCSLHtOAX
         afEg==
X-Forwarded-Encrypted: i=1; AJvYcCUFZ6cpzIgirX1ZbJ6RzVF2PG6LM13EjTX+7ctmUs2FTByGBinsdU4W1XW01TWI+zugLMXSsreZc/A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz8mNNvJ8WwZ9VVKO15FsEqeHTNmA4jldf7pvsDOWtop2EwMX4y
	s7S04CfJNpXcz2n8Y2Jcbsqryvz7elJtr4yeeYja3r57qXmc19Jdc6FTe1iI8OANTg==
X-Gm-Gg: ASbGncv2pprXvDr9Olr7Ch+vUoU3M9jF7FyW6YPn9icNUwxm4fBUIjbpLT1wjvbo6fr
	ckwbrSsoxKpRKn/PtXdz07L9Gjwv9yGRsAia2GH0Y0HPK43QiS69hxn5zuPxX2qoRWOiD3gSlSi
	2NvHg7USS1VYmP2S1U0nEl+C4XQOgJsDONdVX2+463kC2e1g2A4knhc2L1/kI0lbFy7DXzbdhZQ
	VCYU8g49TwsmJ7PdBIG4feVV9C7nr+6qyRhqb1DXvv+6nRfNvCzIwOWeYHLk0W/No0qXjEdWGRF
	QqAvXiHfWZ/faFmSPzypOxCVosRGptDUtw2OzmfCuMysuf6z2Q/Lzm9CPvJlUYfVMj1y2OehAWP
	WC7IzEZSVQoagiKhA8agnioZA+2NyXFn4Exm7v++p3ebTxToigG4YkJ9ge4O1Q+fZ1yuJjxVl3W
	++sgxFsKpuNXkBaOjvYR+8ezeZEcx+LCWarbXM4iSOaIRU3ykGi9WTcYJ28ZDRFr25Hkl4mogtK
	6w=
X-Google-Smtp-Source: AGHT+IFbTVflKuHtWSIcvPacuZ5q/7XObo00Ic1zRCZBP1rsS/Xerx7ph6ge7jlg0wYmbxpgV+wg1w==
X-Received: by 2002:a05:600c:8718:b0:477:a289:d854 with SMTP id 5b1f17b1804b1-47939df9a42mr83850305e9.5.1765201952097;
        Mon, 08 Dec 2025 05:52:32 -0800 (PST)
Message-ID: <4881f062-66d0-40ea-9da3-86451de1d780@suse.com>
Date: Mon, 8 Dec 2025 14:52:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/page_alloc: Much more concise
 domain_adjust_tot_pages()
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <a5adbc25d18c34eb6d46120989d379862cd721bd.1764669686.git.bernhard.kaindl@cloud.com>
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
In-Reply-To: <a5adbc25d18c34eb6d46120989d379862cd721bd.1764669686.git.bernhard.kaindl@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.12.2025 11:02, Bernhard Kaindl wrote:
> Non-functional change to make consuming claims more concise:

"Much more concise" in the title suggests a significant (i.e. functional)
change, contrary to what is being said here.

> When we limit the consumption of claims to the remaining claims
> of the domain, we can make the code more concise by limiting the
> adjustment to it instead of carrying a special case for it.

This wording in turn suggests a functional change when, afaict, there is
none.

> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
> Co-authored-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> ---
> Changes
> - Use min_t(unsigned long, a, b) as the tool of the trade (Roger Pau Monné)
> - Reviewed by Andrew Cooper and Roger Pau Monné(Excluding comments, commit message)
> - Regression-tested and included as part of te NUMA work for XenServer 9
> - Improved comments and the commit message (non-functional change, comment cleanup)

If there was a previous version, why does this submission not have a
version number > 1? Having looked back - what was wrong with the
original title?

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -510,8 +510,11 @@ static unsigned long avail_heap_pages(
>      return free_pages;
>  }
>  
> +/* Adjust the tot_pages and remaining outstanding claims of the domain. */

Nit: Why once a field name and once a verbal description?

>  unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
>  {
> +    unsigned long adjustment;
> +
>      ASSERT(rspin_is_locked(&d->page_alloc_lock));
>      d->tot_pages += pages;
>  
> @@ -519,23 +522,19 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
>       * can test d->outstanding_pages race-free because it can only change
>       * if d->page_alloc_lock and heap_lock are both held, see also
>       * domain_set_outstanding_pages below
> +     *
> +     * skip claims adjustment when the domain has no outstanding claims
> +     * or we unassigned pages from it.

Nit: Comment style.

>       */
>      if ( !d->outstanding_pages || pages <= 0 )
>          goto out;
>  
>      spin_lock(&heap_lock);
>      BUG_ON(outstanding_claims < d->outstanding_pages);
> -    if ( d->outstanding_pages < pages )
> -    {
> -        /* `pages` exceeds the domain's outstanding count. Zero it out. */
> -        outstanding_claims -= d->outstanding_pages;
> -        d->outstanding_pages = 0;
> -    }
> -    else
> -    {
> -        outstanding_claims -= pages;
> -        d->outstanding_pages -= pages;
> -    }
> +    /* consume claims until the domain's outstanding_claims are exhausted */

Again: Comment style.

> +    adjustment = min_t(unsigned long, d->outstanding_pages, pages);

I may have expressed before that any use of min_t() is worrying to a certain
degree, due to the involved casting. The use here may well be appropriate,
but I'd expect a word to be said towards this in the description then. After
all alternatives exist (and I even pointed out one during v3 review) ...

Jan

