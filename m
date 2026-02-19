Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KF1IAesTl2nWuQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 14:45:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A63015F34D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 14:45:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236312.1539055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt4Kn-0002wo-03; Thu, 19 Feb 2026 13:44:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236312.1539055; Thu, 19 Feb 2026 13:44:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt4Km-0002th-T8; Thu, 19 Feb 2026 13:44:48 +0000
Received: by outflank-mailman (input) for mailman id 1236312;
 Thu, 19 Feb 2026 13:44:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vt4Kl-0002tb-O3
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 13:44:47 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 266e9b9f-0d99-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Feb 2026 14:44:45 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-48370174e18so6098305e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Feb 2026 05:44:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31d1b0esm5431955e9.11.2026.02.19.05.44.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 05:44:44 -0800 (PST)
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
X-Inumbo-ID: 266e9b9f-0d99-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771508685; x=1772113485; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7e2Eo1My7gzNzfINDjJwh+EcilgpDKg4sO4ADet080=;
        b=KOVFFQMovIu9QHABnL4kxLeFHK/X+XdPxsV+HI5LTcw5vHV3Eieqm2e/GzBGYmadA9
         qqZTsfngymMWPN5Vxmp1+NeBFMQnVy11gvsXYul6y6rCWQZfqtDRiGkeMK1+hY4ACfGF
         AMmGDYQPfE/1/AMFfTsvIjrzbEg4iSdd4dzu6kPZue0tcsIGh18ODsWKXdmiiRV8y7KK
         8Hdir0ED62UuVk0VX51AMyl04CvWRTZWgFw1uL34+FMW/OKOKSmmUr2LUDWUEzo3rLFL
         Nkv0MBzeGhvH8RzWA72GYGYhq9ZUkmzTly+46VX4n0AWPvv5gOdpCFr33zwDTeLNJ/gQ
         tdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771508685; x=1772113485;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7e2Eo1My7gzNzfINDjJwh+EcilgpDKg4sO4ADet080=;
        b=iqjFEEE8aM06WLmyWSZIHp8TH2rhr0deD8NSha+t0LMsC98HwUS8dKo0tq6mtj2nMY
         bkZUtHI8GHf1eiFrH059oFyY/bNj15Exmn62As9Qs5hPv2aosdIXxsY2G6ueVt372SM2
         0g+yA7NoaHt00A8cbpeBDZGelNE/5Gmo81SyUDU5PxvTp5PAhyAMIn1wQg6CeQrRrrid
         Ar2+95haFM0tQFAaw7dqPGanvyEBPWmf2fV6/9DE7OjWJRvPL/OSPQ6kQ7ofsXQTduj2
         XXnC6rZJ3q6bUbknKzzvIjq5vQPEwivzAYy4TlczqDC+mksl5QWk60fsunla7xf7cclY
         QHGA==
X-Forwarded-Encrypted: i=1; AJvYcCXE/W5xKOMQkPsth1l7TS+HyMOTXwdvkyVxNjfrSg2bLMxXkYvw7vvMzrKKz6/YWJlEgr0GjLGjsnY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxbDm50i0khV/kwQoqr1PfuEIz/0JJrn1qsh1h6kNYnYLbWZ2sJ
	TMPEQ+5jHLvF2GdVrexZODdSRl/y6tqo/A0j3Zk/D2ClsL49rJh4y3dLGuBbdfA4oA==
X-Gm-Gg: AZuq6aLc9q3BGrVn7Lh4gBEQFpVG++qi3QcqOq85GU0OP42PWFUCoXEbiIGg+wcdDxp
	0KBD59/8vv5bzpdP3ku+OSqd/csQGUflp96qnnF+xVfGp6YJp1pmkw3/+v738CwGxkdVPXLbsZa
	GsPujCxKPtA6qfUp2Tzo+NkryB3/hbbUPNo2taI8pY8PsKr3a+7yGzTI+Zjky5XMY876zlSZn4t
	sbL9kz1rHWLSI8gexHJ9VJGEnBvv0MVlNVjSh6EGMFqx7wp4W5cqxSLY5bTKHD57pLPSh5GjYqS
	UqriEO0SB/+uRc3oBORZofEn3TNhZItqiNQk+emUg680IdtDFqnxO4yp250FIWp9488OuFXRBTV
	DYEXUIMred8xwAtN5qdk3Xe7QasTxZuhkOb3SjjaNHsusBPpDrh6gUJ/vMEQswq2e23ZOxQMZm8
	UCsHNu/KLAU5YkX75+N4K/AfVNHvZXHamQ1qlVOHZ/aS9Yf5PwsdzDDFaX2iVK4IpIUq9tU4t3e
	KLJCLF/eno4quQ=
X-Received: by 2002:a05:600c:310e:b0:480:4b5d:9ec with SMTP id 5b1f17b1804b1-48379bf4709mr333105275e9.33.1771508684606;
        Thu, 19 Feb 2026 05:44:44 -0800 (PST)
Message-ID: <6ad27357-277b-4236-8c82-2cf358aaadc6@suse.com>
Date: Thu, 19 Feb 2026 14:44:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] xen/console: correct leaky-bucket rate limiter
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org
References: <20260206202424.2054758-1-dmukhin@ford.com>
 <20260206202424.2054758-6-dmukhin@ford.com>
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
In-Reply-To: <20260206202424.2054758-6-dmukhin@ford.com>
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
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:email,suse.com:mid,suse.com:dkim];
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
X-Rspamd-Queue-Id: 4A63015F34D
X-Rspamd-Action: no action

On 06.02.2026 21:24, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Use existing printk_ratelimit_ms and printk_ratelimit_burst variables in
> do_printk_ratelimit() instead of hardcoded values 5000 and 10 respectively.
> 
> Ensure rate limiter is disabled if either printk_ratelimit_ms or
> printk_ratelimit_burst is 0. Make sure no unnecessary initialization is done
> in the corner case.
> 
> Also, simplify the limiter code by using min().
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v1:
> - new patch
> ---
>  xen/drivers/char/console.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index f607e8f84d7a..e3962512d282 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -1291,21 +1291,27 @@ static bool do_printk_ratelimit(unsigned int ratelimit_ms,
>                                  unsigned int ratelimit_burst)
>  {
>      static DEFINE_SPINLOCK(ratelimit_lock);
> -    static unsigned long toks = 10 * 5 * 1000;

Shouldn't this have been adjusted already in patches 3 and 4?

> +    static unsigned long toks;
>      static unsigned long last_msg;
>      static unsigned int missed;
>      unsigned long flags;
> -    unsigned long long now = NOW(); /* ns */
> +    unsigned long long now;
>      unsigned long ms;
>  
> +    if ( !printk_ratelimit_burst || !printk_ratelimit_burst )
> +        return true;
> +
> +    if ( !toks )
> +        toks = printk_ratelimit_burst * printk_ratelimit_ms;

This multiplication can overflow (which is avoidable on 64-bit arch-es, but
needs checking for on 32-bit ones in any event).

> +    now = NOW(); /* ns */
>      do_div(now, 1000000);
>      ms = (unsigned long)now;
>  
>      spin_lock_irqsave(&ratelimit_lock, flags);
>      toks += ms - last_msg;
>      last_msg = ms;
> -    if ( toks > (ratelimit_burst * ratelimit_ms))
> -        toks = ratelimit_burst * ratelimit_ms;
> +    toks = min(toks, (unsigned long)(ratelimit_burst * ratelimit_ms));

If you need the product anyway, calculate it once (correctly) and then you
won't need a cast here either.

Jan

