Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id K2ZjGjgal2kEuwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 15:12:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC18B15F59E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 15:12:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236341.1539074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt4kn-0007zf-7D; Thu, 19 Feb 2026 14:11:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236341.1539074; Thu, 19 Feb 2026 14:11:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt4kn-0007x2-3t; Thu, 19 Feb 2026 14:11:41 +0000
Received: by outflank-mailman (input) for mailman id 1236341;
 Thu, 19 Feb 2026 14:11:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vt4kl-0007ww-Sv
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 14:11:39 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e77976f1-0d9c-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Feb 2026 15:11:37 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4837584120eso7333855e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Feb 2026 06:11:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4839f95a63esm32010755e9.6.2026.02.19.06.11.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 06:11:36 -0800 (PST)
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
X-Inumbo-ID: e77976f1-0d9c-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771510297; x=1772115097; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=juCmMlfipHI7Ml7/2ARQaO1msA7yqnayCJb2O14LALw=;
        b=FRD4N2az1PJES5wVoM/8OWICliPMpz8FrY8V8K52VuTnwtV+FYadOte7VfmNtH98nG
         2l5CFB38U+4FtDZWueXjINJquFud9VqDTbTqiIhb0rP5cgLD7fgBRRbGhpnDkVoPsDIf
         I6czQc9SAjnBzbY2L3M4Te0VRPOmk7vh+80SzWOiKW40IvlciSMrST4q/nePjM37sWoa
         WfQUrYH6BH/9hOxs+yq++Ut/HuDukgWGAM+FR8LynQqA8xscfmpASK+9VcMVmc4CfXEQ
         fM/8QZEyKH2cpvBjK0RNPuQLMUQ5p6qeeuh+yHY0koF5Yvq8tYq16IjNnw0NS3GjJUdA
         mv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771510297; x=1772115097;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juCmMlfipHI7Ml7/2ARQaO1msA7yqnayCJb2O14LALw=;
        b=VqepSdGPV1ACQlRs9Ow+AbDotNZVUkgkNthayNKY1H6AyHRivr0MPyhal7Q3SnayCc
         Wp/Uqt44KEJT3W4bAP7ttym1GbktPsyQNxZKWQQjxWesYCxLSntKg7GvtSqoEWIhRteF
         Ve42eWo33KaSIQJQcrOaUieeylTT46p5kQ5WrTbsSwHSEhjehJ7c9eEw6YyadKSAvTow
         3iDdPfEq83OJICItD1yFrDU+lgfiR40gamedLFJKag1eeTlaibUMPNwMh9q0X5FdMCvu
         OBxXktJN5ZgL9AKwm2UjVsGL8jbi2Jgv8rHCF96xmnLxOVyIuBNCcdf0uiuqPUMepK1y
         Uu+w==
X-Forwarded-Encrypted: i=1; AJvYcCXvLxuj9phP71io+MvsLSK0Jo3WzquEsAcRh2JO7rVsa2Nccpv5WVuMa8AIrnMvn3WjrZzQc9fqVJc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykSp418w4i+HOxcY3Jrm4qXED+xTxVg21flZxIHT0n8ONL216A
	LYCA/v/uEl4uK+lXPA32SfBk5FZYp0BGgAFLbb+YKgk9ntgWUrNtYM4hYNJkNRaeIw==
X-Gm-Gg: AZuq6aIgGL7uEIomFMXMDRz+mBx2iMCG4JxmkoveOxdlqotu4Phyh+tXQ+/PEbnqKpP
	wpt031Dxc/th45dYwnllkXOVFR7hedxNtnUdaQm/r6hxpXcUxmvJihT1OoI/fKnjPcXqcjzwl2o
	+cwNrzhmPwAuRMZc4hQHUtCrIoDxsXpkCjsGuJaFKqlxE25lAEnWfEaqiCpMjHejEYyEpYvQwyy
	6cfHAqB6+QpdsPRBkDKMTSatyqTUtlci8qFDp4HHkh3ewikrSjoUd/964rBzEDMfzApjQlU5Xwq
	9c3yVojih3IFx3E+aPrPr8slNiE34JrYxx2z2pVk27YX0IcQhcr2nyUiAW14Q1h4jz1FTVKQZPt
	rpFjhhiqMif5Mdf/PE+pi9FF1eub26R4U3ArUkThUdp2cjckRnyfhiax51bhxZJtD+CSX88S580
	zoSi6jESA2g2psalsw9SQTdYc1eb5eMKX3xNThGUMdCAlia81dxxSJGBqV8JzgBzTHqM6E66JTG
	+Mwm94puYB6zL0=
X-Received: by 2002:a05:600c:8288:b0:480:6bef:63a0 with SMTP id 5b1f17b1804b1-48379bd7114mr303092715e9.21.1771510296958;
        Thu, 19 Feb 2026 06:11:36 -0800 (PST)
Message-ID: <171f74cf-9456-4d55-b730-7f9016a09ff6@suse.com>
Date: Thu, 19 Feb 2026 15:11:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] xen/console: correct leaky-bucket rate limiter
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
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
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: AC18B15F59E
X-Rspamd-Action: no action

On 06.02.2026 21:24, dmukhin@ford.com wrote:
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -1291,21 +1291,27 @@ static bool do_printk_ratelimit(unsigned int ratelimit_ms,
>                                  unsigned int ratelimit_burst)
>  {
>      static DEFINE_SPINLOCK(ratelimit_lock);
> -    static unsigned long toks = 10 * 5 * 1000;
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

Btw, instead of this I wonder whether it wouldn't be neater to use the nested
functions extension of the compiler:

    void __constructor __init init(void)
    {
        toks = printk_ratelimit_burst * printk_ratelimit_ms;
    }

If we wanted this, we'd need to record the extension use in
docs/misra/C-language-toolchain.rst, though. Plus init_constructors() would
need invoking _far_ earlier (perhaps right after command line parsing).

Jan

