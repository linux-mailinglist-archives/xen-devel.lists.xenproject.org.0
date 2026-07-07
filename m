Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tyLbBKuYTGpGmwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 08:11:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52234717CD7
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 08:11:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=N2Vbe9ua;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355919.1610591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgz18-0002Mw-Et; Tue, 07 Jul 2026 06:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355919.1610591; Tue, 07 Jul 2026 06:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgz18-0002Kp-Bd; Tue, 07 Jul 2026 06:10:50 +0000
Received: by outflank-mailman (input) for mailman id 1355919;
 Tue, 07 Jul 2026 06:10:48 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wgz16-0002Ki-L9
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 06:10:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgz15-00AjSd-B8
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 08:10:47 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4c9850-2eae-0a2a0a5409dd-0a2a45059450-38
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 08:10:47 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4c9866-3cb2-0a2a45050019-d1558030c86d-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 08:10:47 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-493c19bad03so34719785e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 23:10:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e0faed92sm28870085e9.9.2026.07.06.23.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2026 23:10:46 -0700 (PDT)
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
        d=suse.com; s=google; t=1783404646; x=1784009446; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sbMyzZdJI3+X16RmRkVatSRCkjdkXIXtvyKX9TWwfec=;
        b=N2Vbe9uaY/inwlDtM4IizLd49Z1FtbGGnFmTeUcplWvnwUq+imq7MSXiIjjm5WlRP8
         Gi4Y6r4xzFO59P4cOx7jmXDfr5smzxOVVnN+KIj0xiAB3maVpPqOFHYkuLQde3UYQlvp
         jU/hayes3ZdiBDsq5Q9pE18/Ov4yfXHgxdU9UG5erA4Q3F6kHbNpUgt68YTKv2ScBI8G
         RXAusNycHWjNtK9Ca4hb0+wQIx2LxaLZdS2HueryEVkfOvSsiK6Nbz3xkoFLpwJ/JqBa
         gSQGc+qksPVkXaFo2v4U3F5GnGwiGmQscImCP++EaFajOUZv66NmudyEW7x+VMAi/mCx
         bbxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783404646; x=1784009446;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbMyzZdJI3+X16RmRkVatSRCkjdkXIXtvyKX9TWwfec=;
        b=gy+Bb7rIE/o2I0nc3+Uah7L8krwtb5xk4fCCrYStJYGsz5BtvN0cCd4KkGx8A0yxjX
         jZdrR3h+aVjWGZnbhWYRt+Rjsoh+Onydcoz5vEIsUTmwnaRGX0lKlmMEZRHGlj6Drr/P
         gbcd5rm6vMuC46gXMcXShR5Md9WTb5wF46gH5FVlL2J+DYVyVnkfTy7c0qBrjy0vYSRZ
         HWPaF883OAvL8U4tPJ0eHHfLGZPVoXFSLWvL58DJ6rWbGAy2kOxLDGsF+e/LJu3W3yb4
         o58M6hFaCceRy2kvrxovsXxvyuQhTSx03Aunchti//E1bS2QIZmiCA7gAc8qByWpUfXf
         f41g==
X-Forwarded-Encrypted: i=1; AHgh+Rp8S+UbUwc4zqGw3Beu/yyyFwT6ubPejRUDoyLLl4CQz6SdMS54/hkZ5zdY3vJ4N/zLXhanmJDrSoY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMhbQhpw2j/x9zKJDzqR/Cli8NgkB+xuiCeIVcSWSuaJr8xEGQ
	k4cQDqz73sm87mPIuRFYsEkWdpzoPJscjNFnPWA97egwjDn3tGHo+lOxWOxCAwsw3A==
X-Gm-Gg: AfdE7clZFCibGNKvZm7afa0+vRZCVtf/EZXtmFlnFNQZtOKfNHORze8/qg5iByoU/T1
	HLdOKZYQgyaUkO67k2AKI3bt0FOy02r3yXY+pkAYp+Du4kYE/U/5xaN8iJ0ry0IqcAKNI1ISmHS
	JzDrZnmVfV/V1GJFyeqaU2Uv0Wtq29PupM8CyK2G8LHQ7ehstiWHVkribJ26/1Ut+GRGfwEgv65
	JxZogRJWLiehRIw9uOiwabeXOgUaOnX9GtepTcfzjkdjoiH26aoY96fxkFr1ud+d4nkaH49wmpl
	xWvO1kwiMw7BQpBbHIp7zgMOpPpYJymPTE4rJb0/r/DYUg31ZaXaHcv3+zeT3YTO5hNFgeRmg7b
	kdvue4KiK3nYyRA73s0cGjDz5uJj4zxyUHp1aTxkpJw3WgstcwBOpSUqm4wlD35NkZyEA/dfPrO
	aD68h94Q+KSfGkj+hw9EKzfZVib0hbsEGRshQSnrDcyVKVXTEcVmpglbbgeEKhAh9RyRt4WFKmU
	kRY
X-Received: by 2002:a05:600c:8b27:b0:492:3d05:5639 with SMTP id 5b1f17b1804b1-493df083892mr38250605e9.36.1783404646603;
        Mon, 06 Jul 2026 23:10:46 -0700 (PDT)
Message-ID: <7bf889a4-bc59-4c53-914d-0f354ae23959@suse.com>
Date: Tue, 7 Jul 2026 08:10:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.22] x86/cpu-policy: set up host policy earlier
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b329e8d1-5f6b-445d-acbd-d60a2d644c1a@suse.com>
Content-Language: en-US
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
In-Reply-To: <b329e8d1-5f6b-445d-acbd-d60a2d644c1a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1783404647-54BE32B8-B4541BCF/0/0
X-purgate-type: clean
X-purgate-size: 1507
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,invisiblethingslab.com,vates.tech,gmail.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 52234717CD7

On 03.07.2026 08:26, Jan Beulich wrote:
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -66,8 +66,10 @@ void __init setup_clear_cpu_cap(unsigned
>  	__clear_bit(cap, boot_cpu_data.x86_capability);
>  	dfs = x86_cpu_policy_lookup_deep_deps(cap);
>  
> -	if (!dfs)
> +	if (!dfs) {
> +		calculate_host_cpu_policy();
>  		return;
> +	}
>  
>  	for (i = 0; i < FSCAPINTS; ++i) {
>  		cleared_caps[i] |= dfs[i];
> @@ -78,6 +80,8 @@ void __init setup_clear_cpu_cap(unsigned
>  		       __builtin_return_address(0),
>  		       i, forced_caps[i] & dfs[i]);
>  	}
> +
> +	calculate_host_cpu_policy();
>  }
>  
>  void __init setup_force_cpu_cap(unsigned int cap)
> @@ -92,6 +96,8 @@ void __init setup_force_cpu_cap(unsigned
>  	}
>  
>  	__set_bit(cap, boot_cpu_data.x86_capability);
> +
> +	calculate_host_cpu_policy();
>  }

During the call yesterday you raised concern over the overhead these calls
may cause. How about we make this call dependent upon cap < FSCAPINTS * 32?
Synthetic features and bug flags don't have dependencies, as they don't
have representation in the policies in the first place.

Whether something similar would make sense in setup_clear_cpu_cap() I'm
inclined to question. We typically "force" synthetic features and bug
flags, while we typically "clear" bits having representation in policy.
Plus if at all such a check would then likely better live ahead of the
call to x86_cpu_policy_lookup_deep_deps() anyway.

Jan

