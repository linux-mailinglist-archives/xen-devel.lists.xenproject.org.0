Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OA3cH98bl2k/uwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 15:19:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E04BD15F67D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 15:19:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236360.1539094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt4rl-0000qL-39; Thu, 19 Feb 2026 14:18:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236360.1539094; Thu, 19 Feb 2026 14:18:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt4rl-0000nw-0L; Thu, 19 Feb 2026 14:18:53 +0000
Received: by outflank-mailman (input) for mailman id 1236360;
 Thu, 19 Feb 2026 14:18:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vt4rk-0000nn-2b
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 14:18:52 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e90ac25e-0d9d-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Feb 2026 15:18:49 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-43767807cf3so784274f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Feb 2026 06:18:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a74918sm49173914f8f.17.2026.02.19.06.18.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 06:18:48 -0800 (PST)
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
X-Inumbo-ID: e90ac25e-0d9d-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771510729; x=1772115529; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WNj+rtvXEIZCBJOhwzQMp8jg2RLlS4pMGg2U17DNiMY=;
        b=Qbsu0XmJ1ZypC6Z/9k+4p87Z7j9JzUtmQLaeKzLjj8D0zwh+79/o0fo4UPzkh/m/1L
         yJtNp2h/jSs2Kmeblas1/ozbU9sSOiHupyBwQiUwwiF3/cvH1F+NgaO08KF7EsDz0clC
         sZ5OEIK5xDzlvZKdd/WBwpjsRRCFa0S8H20bAMJKQw0u7/RkaS1eeEZXk51kWrdovlvX
         q0besmnp1zH9kDNPD72Ta1SG/6s+OA0M/L+pfVulT8kW46Kxf9sOxMInCEOo2k4O7S3w
         HbUoVu40iRP/6zQ4BJXLPt+ZtVgo/s6lz+E8m5KumYcrAIMger/w5aeOyDX+84pVFosm
         6/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771510729; x=1772115529;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNj+rtvXEIZCBJOhwzQMp8jg2RLlS4pMGg2U17DNiMY=;
        b=SmY+sZCTwCCi3kIXF5HBAlK3b/aEc749XaF8RzsId5cmNY2Tw90nSlzsCyKUwAaU8y
         BOlecWw+S79XcjuCxbNe2AoeMuI6T3Kb4ZBDsrrfKQxVQ4a844QlZ5JZlNZb2uJj5TEz
         L7omv5BrZINLOu1CCrw52AkXGGkhVEzYzOOOry5L2DZg6KiIGWpP9YDF1xsKTv47eMo2
         YFpDsVqaiIM4PgMgd1yz8qonHQRjuXWJv8ZTDdG/P4cYAKIbrB/LYKyrwK7ThSmqTiA6
         ocD/uEjavBQGNJ5zSc8YBbzjLoNc+ByuozlR6iZfKAonREfj2DVHYMrHKDYvMIkNXxuy
         Bj2g==
X-Forwarded-Encrypted: i=1; AJvYcCUBdz6iEYA7MJ5arItYBXwvCc8feqfw29a2tQNN7yyw/OSGgIqRC+nSpExige+Q604jG03bUGpqjYY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz7eXiH4yv46184YfZCHB2IIvndcg+AV4M4YO8Vz42DD3rY5h8L
	V53kDB+4I7aJVs4MCRhFoyuTQUeu5PPeqpORYiRF9HBNrXpCE1PKAALPCqyfplUYPA==
X-Gm-Gg: AZuq6aJRBFzduzxs/JjQuhBOp453wG4p8smN9clC6gm5PgO39QR9i5199cXBNLtOMMX
	IuM8svyjV5R5VLTW3QJWj3dwPrCN10YvKp2bML8Wpm/tVmfuzjEytAlnxdN3XIY4Qsc0Etwz/sK
	r3yDD0WGOKjbUy2U27LtosR2MaF2SzlOOkdSSy8no/jDGxu2HuzWF0n7+lt3elqy128dAwMjjZL
	ZF4n6CjYLscX0+25RZHwwrvV1KudZOds/XI7ahK8xNPwc2W+JzYouf0wk4UYzbwc/vboaXz1q9c
	zRl3Uc2MV0PHXJy8mfmvmVREz6n6tF0G7yEUJzftm6k92SaljF1aS9PK98U9OxtbbiZOfgnQWzT
	fXYYZ+yrUAzIXF7byR1k7Jbhfh2uspPVncUXZgDnv57yqKtC+RGV8ulHZm1SrxTQpH+88bSVkek
	v6J4KHmmhCefvP8JscI9Xs+izakQM/8vlBP0wmg4KxUVOpoOs0b75fzmE13lHKUT+R2fGS5B3QG
	PKM8/AXoz7JYmQ=
X-Received: by 2002:a05:6000:4010:b0:436:1b1:6cbd with SMTP id ffacd0b85a97d-4379db25b60mr27670269f8f.6.1771510729053;
        Thu, 19 Feb 2026 06:18:49 -0800 (PST)
Message-ID: <e5a16a40-ed00-435a-a096-2264e2e2f8dc@suse.com>
Date: Thu, 19 Feb 2026 15:18:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] xen/console: simplify printouts in
 do_printk_ratelimit()
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
References: <20260206202424.2054758-1-dmukhin@ford.com>
 <20260206202424.2054758-8-dmukhin@ford.com>
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
In-Reply-To: <20260206202424.2054758-8-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E04BD15F67D
X-Rspamd-Action: no action

On 06.02.2026 21:24, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Simplify the code around notification of how many messages have been
> rate-limited.

"Simplify" in what dimension?

> ---
>  xen/drivers/char/console.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Diffstat says there's no difference.

> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -1318,15 +1318,15 @@ static bool do_printk_ratelimit(unsigned int ratelimit_ms,
>          spin_unlock(&ratelimit_lock);
>          if ( lost )
>          {
> -            char lost_str[10];
> +            char msg[40];
> +
> +            snprintf(msg, sizeof(msg),
> +                     "printk: %u messages suppressed\n", lost);

Having snprintf() process a longer string means there's more runtime overhead.

> -            snprintf(lost_str, sizeof(lost_str), "%u", lost);
>              /* console_lock may already be acquired by printk(). */
>              rspin_lock(&console_lock);
>              printk_start_of_line(CONSOLE_PREFIX);
> -            __putstr("printk: ");
> -            __putstr(lost_str);
> -            __putstr(" messages suppressed.\n");
> +            __putstr(msg);
>              rspin_unlock(&console_lock);
>          }
>          local_irq_restore(flags);

The net win therefore looks to be one __putstr() where previously we had three.
While it's less obvious then that the array size is actually large enough.

Jan

