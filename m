Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EO4oGuYRimlrGAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:57:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A74112C23
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:57:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225866.1532509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUYz-0006qF-HI; Mon, 09 Feb 2026 16:56:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225866.1532509; Mon, 09 Feb 2026 16:56:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUYz-0006ov-EQ; Mon, 09 Feb 2026 16:56:41 +0000
Received: by outflank-mailman (input) for mailman id 1225866;
 Mon, 09 Feb 2026 16:56:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpUYy-0006op-4C
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 16:56:40 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c368811-05d8-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 17:56:37 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47edd9024b1so40269025e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 08:56:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5e1a8esm1585715e9.5.2026.02.09.08.56.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 08:56:36 -0800 (PST)
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
X-Inumbo-ID: 4c368811-05d8-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770656197; x=1771260997; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X15l9HnPsTBSttFTrabWCg4OqYezi+YSqBk5OWjvacs=;
        b=W8Rr4eh7moFC8rqlKGRmAQUv7W0opwbAoj5FygCn/Qt0BE5dEN0QpTuZZ2J6vwqI4R
         FGXXwCZ0aqcDYioXV8otbQ3FjXJS0B3iXvVcJ4qFoz0mO40pDoteLy5m73pqnWaV1w5v
         NJrS4MjjU0R30Wd6RjrC8Hbbou9LjVZI92TKttfoIgcD+ow7sNI9VDDpMGOUMR56vCgr
         bl9ZVec8SfGbp71nBXOFYkhy6kuXFKDLFFP8t0yaz1K5IVx49byUyiJ1ak+pEfJx8Azg
         vfH6o7uRUdCK+osiavFgaiODqcSriFR/eSOMFQgb9PjmmeeEaogk96S/2JuG1VWlcRV2
         2r1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770656197; x=1771260997;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X15l9HnPsTBSttFTrabWCg4OqYezi+YSqBk5OWjvacs=;
        b=aO1l1LKgNPTLbyp1MOmcxN9/jhpM1F1wSUk2h55ESzjrt9PFXst2wYX5ubhdREG3x1
         QpjwQPn75Kf0WyL+KcANewV0b89//XnB7bl2azjeFaNR5+EJw+syVYyp1COlRaCOYAi4
         YcuSS+76MLOeU1gBJIMnmxSXyNFvR8Ewe+lzPN+Eizd4+rYUFVAGHgRXlbhvpKiprNuB
         DADvvIvs8cMUl9EaEU/uSs3FoKAzAaYgg/MCWcP1449jP5JzbOQOece1SMksQp2j0EKA
         SqO9oLxpIBjU3hViFgMfiC4eN7+Os1qJ3tDTv3Z4fm5DMeeCbQW7pJbAlvdPF3A/W1z3
         Bbqg==
X-Forwarded-Encrypted: i=1; AJvYcCXzP82SXEksluQ/ZS0jgUv1r0hFq8GWhBjSRFmvM8NYdrHHivFtoUmveUXQ15qOgRo7nB0K6Wvl71Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzydspV7Hhj6WW2Kk0X8gKtV2DqzorT0JGzMfPexUF6dLCBFCET
	gSWXeair94CfZdYqrhXbm8WcBvOdViWRzAhW96Vw4GZeBveGA+oe6FL/dWhJT+UIaA==
X-Gm-Gg: AZuq6aJpuwjwQ5Fo4KY6/+/qfk9B8ObRy+SAHmvAoBf1r1sQXLdJA0cjH0nr+aTojhv
	JZI7Sj6SRMxiCU3KyYPNVy3ZsbcfwzZZ9zxAJSxLRdDmVrJSiCm4IPxUx67h5Ai9Jp1ThCwV9/7
	+ulctbj90ajc8OFs446e90u34oF3MZ1lPf3fW6NMg2n3Y5xW673hwIHyGFeS7TWkGxUjklR/MuX
	piQ7b/U4VJZ3PDdDru5gHRcapmZiyzh6IEWSIIDbdN+OOA/Kf5UZUs+r8TearRBTsVOV6cbCcb/
	So1y66lpPwX32iYMgWn+1VMsDTqBkSmoFJ4dxO5CrkkuiEwsZbiyGm6IZtWpK0w0XMWFab9qa8h
	yr3kwqjRzQ/Ztz6vtg3Cgg3SrK6HDd8qw0EpiN0TwOYbP3mRzf3FH21blhVFE+/Ex/0V7lCHlMz
	DAI3zwBTLy24ltgxdZzXkLKUnnFAGX/koZ3+oZWqV+Upm/m4QqPIYWyUB13y481391WnIJCAx3J
	5U=
X-Received: by 2002:a05:600c:8116:b0:480:1c10:5633 with SMTP id 5b1f17b1804b1-4832021c74cmr179417865e9.26.1770656197019;
        Mon, 09 Feb 2026 08:56:37 -0800 (PST)
Message-ID: <7e8669d4-d1b6-47c7-ad08-da14f14fb4a4@suse.com>
Date: Mon, 9 Feb 2026 17:56:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] xen/console: use memcpy() in console_init_ring()
To: dmukhin@xen.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20260205013606.3384798-1-dmukhin@ford.com>
 <20260205013606.3384798-5-dmukhin@ford.com>
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
In-Reply-To: <20260205013606.3384798-5-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@xen.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C8A74112C23
X-Rspamd-Action: no action

On 05.02.2026 02:36, dmukhin@xen.org wrote:
> @@ -479,11 +479,23 @@ void __init console_init_ring(void)
>      opt_conring_size = PAGE_SIZE << order;
>  
>      nrspin_lock_irqsave(&console_lock, flags);
> -    for ( i = conringc ; i != conringp; i++ )
> -        ring[i & (opt_conring_size - 1)] = conring[i & (conring_size - 1)];
> +
> +    start = conringc & (conring_size - 1);
> +    size = min(conringp - conringc, conring_size);

Is this correct when the ring size actually shrinks? In such a case you want
to copy the tail of the ring if not all of the original contents fits in the
new one. But ...

> +    chunk = min(size, conring_size - start);
> +
> +    memcpy(&ring[0], &conring[start], chunk);

... you start at its head.

> +    if ( size > chunk )
> +        memcpy(&ring[chunk], &conring[0], size - chunk);
> +
> +    /* Data is moved to [0..size), re-position conring pointers. */
> +    conringc = 0;
> +    conringp = size;

Why this unrelated change, which the description also doesn't mention? Since
this is in an __init function, there's no race with read_console_ring(), but
a static analysis tool may still (validly) spot one. Yet then there's also
conring_flush(), which doesn't look to be using any locking either. Have you
excluded that this function can run in a racing manner?

Jan

