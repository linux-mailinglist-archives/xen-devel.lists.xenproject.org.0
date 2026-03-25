Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OVzOi3Mw2lKuAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 12:51:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4705B3243B7
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 12:51:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262103.1554765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Ml4-0006ba-LA; Wed, 25 Mar 2026 11:50:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262103.1554765; Wed, 25 Mar 2026 11:50:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Ml4-0006Yz-I4; Wed, 25 Mar 2026 11:50:46 +0000
Received: by outflank-mailman (input) for mailman id 1262103;
 Wed, 25 Mar 2026 11:50:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5Ml3-0006Yt-2x
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 11:50:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5Ml2-00E3je-E8
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 12:50:44 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c3cc12-2eae-0a2a0a5409dd-0a2a45038522-4
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 12:50:44 +0100
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c3cc14-1947-0a2a45030019-d155802eec8d-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 12:50:44 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-486507134e4so28693315e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 04:50:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48717341e29sm18769975e9.15.2026.03.25.04.50.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2026 04:50:42 -0700 (PDT)
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
        d=suse.com; s=google; t=1774439444; x=1775044244; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tn9KdA6knE2yrL+FHC4SIwpDMGXgGXscbEGwvd31e9Q=;
        b=JZygfRB+nvZ8FzWzAexXEHLqhzspM1AOzyJTcZ1szZAyTSZy9fz75+ikyHPj6Hzziv
         QTDRT9vFKZv0lsYrUpaMtNiMx1UXqPciikXCPiSeeSkpIUcr/TuDhjJsS1diGT25BcyR
         aJuntGwArDqpylbqCmu2dMSsxAwntUVFL3ye9Zn9wWflesEoG8+rRoXUykFYFOS6nV7t
         yfud3rVOKP/UPJrgONrMYXLqotBWkMdVWSkVdfp6rvgCsWmF6B92hjGNtlnVcYP1P+jU
         aw4fh26oruavqf1f7Dj+GPzhKAu5X0W0rQISwqZcHf1z64V6nWi5tGRQHs5CPhJz0xf9
         F9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774439444; x=1775044244;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tn9KdA6knE2yrL+FHC4SIwpDMGXgGXscbEGwvd31e9Q=;
        b=PXuIaY/HDQagJTA6wk6XHi0k/MVhipeZyAvgrbdEFoRcG9SDyAlqYoInClNYYuQq3N
         U6HVgkDPQnfkpYn5SlcXl784YjbTqga+ze4J12EYd5zJ60NdN6j1TbpZQ3PUVXrU2+G3
         hsAYGzXzMMDZIO0h020mbwQDMKzsDgf/IbOBlU3+bTUcEBH/RSNDJ47hyMYQHPCWKevO
         Gp7OK647HhnPAneCTbX8S5Th4p5IrsIFdUBYjXrHZUahHRrs3uO0h9mpfIVTHIEiMw8Z
         CqxXkcWsr62uPPDwBI5uVHLinhogfPlCYAoKIXQN9PsNkQC9yYJGQQcSBEdPyCN5muFP
         B5BQ==
X-Forwarded-Encrypted: i=1; AJvYcCVabhoISblOPtd4v+MCcu2fa0Bj+qzeWoCZ+ZQiIBDLiZm97n51XkDoE9I9Z0dib8Hrl2oPjsIcNO0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzSrAzFCUKrlDgYXifx2/JL1CSYfISbHGWUi2/B8/hNGN8fYlOA
	VVOGw5IhzFhJQ3TRwF1b2IZkpTOzZxLE3u4KvRfY+bLj6Gta1UDLqWcA0z6faqyE+A==
X-Gm-Gg: ATEYQzxIoagHxpTdB4z51mnAfrHGbTioXndTwCiAEkOO9cFzLLw2ykY9Dxx8qn7vhBa
	c1rNz6q0WZcMjQkgR10c+u+vFb2qmM0ZTqhDMHfJXc48KoOWUfYkc0yVmbVKdJ1HofUaAtSOT6z
	UAIjGIk31jH8g3I8D+duBaOMepKJ8Bg10mrJ2MM28TJ3rGVhXFtXjGcDFBdNX0gZ7I3HXtOIOAw
	C/Pq4jnfOlpK9WqOMytzokYh+Y1tIQ4kUFgrdm7/p9cTYIhCKeh3EbkF47U73sh2+QItWC+6Xqb
	DjP01akz8+tYoOMrMSmxN0IE+crCVZZ/8iedJFeDXEc5Q98qNhXWIBK2jTW5IgfEeOAhLfTtDWB
	1+P4yKh8Zn/j0ZCdqfp1NHZg1LB/E6XGLXJWn/x+G1IuWh8GaBR2WxXb6e4XW45gNKYHg4t9W6x
	XCQEDVkTyxNr7snNYf8quKL0AHvt50qelJ1D3a0Et09Pj6TLf4Z68R6EvTvaHFIh0ukfji1yAMr
	emSrZ9EnCTC+6LB95E1lTULIw==
X-Received: by 2002:a05:600c:3b12:b0:485:363b:fafe with SMTP id 5b1f17b1804b1-48715fc37f7mr51466725e9.1.1774439443108;
        Wed, 25 Mar 2026 04:50:43 -0700 (PDT)
Message-ID: <f49dcd5e-d905-4f43-8143-afd7209a1300@suse.com>
Date: Wed, 25 Mar 2026 12:50:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: validate RTDS putinfo period and budget
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Juergen Gross <jgross@suse.com>, Meng Xu <mengxu@cis.upenn.edu>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1a235cca6f37ee3d3f03132675247edfc19953cd.1774431761.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <1a235cca6f37ee3d3f03132675247edfc19953cd.1774431761.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1774439444-E909672C-C690DEC2/0/0
X-purgate-type: clean
X-purgate-size: 1767
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Oleksii_Moisieiev@epam.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:jgross@suse.com,m:mengxu@cis.upenn.edu,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4705B3243B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25.03.2026 10:43, Oleksii Moisieiev wrote:
> The RTDS domain-wide XEN_DOMCTL_SCHEDOP_putinfo path only checks for
> zero values before applying period and budget to all vCPUs in the
> domain.
> 
> This is weaker than the per-vCPU XEN_DOMCTL_SCHEDOP_putvcpuinfo path,
> which already rejects values below the minimum, above the maximum, and
> cases where budget exceeds period.
> 
> Use the same validation rules for putinfo as for putvcpuinfo, so
> invalid domain-wide updates are rejected with -EINVAL instead of being
> applied inconsistently.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
> 
>  xen/common/sched/rt.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
> index 7b1f64a779..62188f37c6 100644
> --- a/xen/common/sched/rt.c
> +++ b/xen/common/sched/rt.c
> @@ -1388,7 +1388,10 @@ rt_dom_cntl(
>          op->u.rtds.budget = RTDS_DEFAULT_BUDGET / MICROSECS(1);
>          break;
>      case XEN_DOMCTL_SCHEDOP_putinfo:
> -        if ( op->u.rtds.period == 0 || op->u.rtds.budget == 0 )
> +        if ( op->u.rtds.period > RTDS_MAX_PERIOD ||
> +            op->u.rtds.budget < RTDS_MIN_BUDGET ||
> +            op->u.rtds.budget > op->u.rtds.period ||
> +            op->u.rtds.period < RTDS_MIN_PERIOD )

Besides there being an indentation issue here, are the inputs of putinfo
really in different units than those of putvcpuinfo? The latter first
applies MICROSECS() before comparing against bounds. Assuming they are
using identical units (actually, they do, as putinfo uses MICROSECS()
when storing the values into the internal structure), I guess you'd best
make a small helper function used by both.

Jan

