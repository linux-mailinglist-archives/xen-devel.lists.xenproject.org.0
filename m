Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VExNNFTJH2qhpwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 08:27:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C3C634A45
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 08:27:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=EWw61Qfz;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1325725.1591042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUf4N-0004ut-QB; Wed, 03 Jun 2026 06:27:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325725.1591042; Wed, 03 Jun 2026 06:27:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUf4N-0004tW-NM; Wed, 03 Jun 2026 06:27:15 +0000
Received: by outflank-mailman (input) for mailman id 1325725;
 Wed, 03 Jun 2026 06:27:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUf4M-0004tQ-9U
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 06:27:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUf4L-00H36M-82
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 08:27:13 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1fc937-5cb7-0a2a0a5109dd-0a2a450482d6-34
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:27:13 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1fc940-1dec-0a2a45040019-d1558033f1de-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:27:12 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-490b64c8311so5388735e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 23:27:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0e76feasm116255165e9.9.2026.06.02.23.27.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 23:27:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1780468032; x=1781072832; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rBBsyBRPn4weISVeQ4wzn8yMIQR0+ErT+cxoO6HV6P8=;
        b=EWw61QfzkVS4l4JtiLkH0jaGDEFWfPCyoJLhho+ZH1hMHBhqyiclHWEDQAkrwH5lPX
         owDuHcSnzH3n76TMrGIj/TJhFta+M5WzUXfOOYAfdC05SY+btgYz/28ruRMpNmwdRDJj
         AOW2AZKhJUhTbDZQVRmtUkIGsvlB4wou/8MLKO3r52Sc5/Gv3VEYQzDnHtGBylJP9sve
         og578qhzzxXEIwUGR9Y1V+SvdmyRvXQ9kdU0G928Vx+NEdE9sMjnU3Uxh2vwX5lt8qv0
         +69OUCGhV96vz7JrKSHqGl0LKOhDvBs8iJVUgULh9qkyOtp8A3iMDL3ls5iQhQGRqEEz
         nI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780468032; x=1781072832;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBBsyBRPn4weISVeQ4wzn8yMIQR0+ErT+cxoO6HV6P8=;
        b=U7t8eMk2FG72KAA5mbwV+b35CxE+vEA6gp2FbQyHlEefw5IZmoP7JX0aDbZYYFOm4Z
         Tpda6B/a7zerEVn9apuA7xzCRSKJU9OQO1lX4Qviwk8kuO0A1xorjUucAxDnlP3b6mqu
         TUyTusB6NNFYauFD+K4J593ENOE4WSMMFKCAa2PPaQBzhFmQ+cfCJbw8+FJB1FQnle5J
         WkIhoTYZvh98k12idAr69zq+OAvcdftYR5b73G5yA4Z4KjbHxToAmCcI9EYylD+R5Zo6
         l0G8blEQm20bnpqclnVde//HMq+6f+azb8ownBH/2+3WngKOSq1HL2F0iOioauvU9RrK
         pmvg==
X-Forwarded-Encrypted: i=1; AFNElJ8ghSs2mslc9rbTbTA6Q0u2Fs8kICBZg5PBSsRlrRMSgZ+rI+ASP4PZsFAlBZVSwZBKsNn9/DH9DtQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz/n3gJzmfjXnuDoC5UJWoLZhpL0U9NGD3UN1fF/t9K6t3SYRM3
	Uw+HA2uimix6TLrxE5HoDEZJRBPr3wJZGcrJ6dwD8EwBfjYfOt2odjIDLxRmMJ9uiw==
X-Gm-Gg: Acq92OFhN87wemzySNH3Aww1xyngkl3Th9UHmOE828a9Cup3s2G6xhJUXup4fbntODQ
	f0vjSOzl5GarkdpOT3ZMzox8QM6Uge++MZMMrn6TzJQ8/GykoX2NCjGv1+2PkdDTp44szvoZnB6
	BwJd7jb4y5+mCc4z32VFLG1BqGuTC78HsF7nmNWB/Nv8pWLH1iLg6zbRuKAAgUR93rUEhT8wBQQ
	2GiWubXDgr0ZburB+8IZDPi19enIBfLYhOjAaA5tQcncf3Xlj2CtPEZJf4NPA6LN+DdPkSoas9y
	I4+5vEyldEu1cC2RmaerNcYU9ZR50xDq1h1ObzPbR4wq6Spa2qKJhun8SZFSwQsxUj+Y1SJTTio
	8605YBVvcfNf/CuxIAx0VofuKZYh+Us68oVDn/ZayuuC7M/kXzkNSMPri8ECoK4JQVq4h+rlstM
	26ME0QujEa5r/jrp8q0BWL3uX0zLNvg/atPoCFV1pgHQ0KsvABsXmuYWpQUb8NwQgeW3I6/ieH1
	ut3MUzvAFEYhshsTk95+mPrww==
X-Received: by 2002:a05:600c:19d2:b0:490:7136:ad02 with SMTP id 5b1f17b1804b1-490b5e94d63mr28187705e9.7.1780468032486;
        Tue, 02 Jun 2026 23:27:12 -0700 (PDT)
Message-ID: <ca4eafc3-8699-4903-aad5-5cb95ea6e409@suse.com>
Date: Wed, 3 Jun 2026 08:27:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] x86/fred: Enable FRED by default on AMD systems
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260602164519.2634144-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260602164519.2634144-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1780468032-43B6B3FF-57A76354/0/0
X-purgate-type: clean
X-purgate-size: 1449
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:from_mime,suse.com:email,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 30C3C634A45

On 02.06.2026 18:45, Andrew Cooper wrote:
> FRED is now believed to be complete for AMD systems, and has had its tyres
> kicked by both XenServer and AMD.  Enable FRED by default on capable AMD
> systems (Zen6 and later).
> 
> Support on Intel is still not yet complete.  Leave it as tech preview and not
> security supported.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with one remark:

> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1259,12 +1259,12 @@ does not provide `VM_ENTRY_LOAD_GUEST_PAT`.
>  ### fred (x86)
>  > `= <bool>`
>  
> -> Default: `false`
> +> Default: `true` on AMD, `false` otherwise
>  
>  Flexible Return and Event Delivery is an overhaul of interrupt, exception and
>  system call handling, fixing many corner cases in the x86 architecture, and
> -expected in hardware from 2025.  Support in Xen is a work in progress and
> -disabled by default.
> +expected in hardware from 2026.  FRED is fully supported on AMD hardware.
> +Intel hardware is still tech preview and not security supported.

Is having "security" here really appropriate? There's a functional issue to be
sorted. That's expressed by "tech preview", yes, but it still feels somewhat
odd. If you want to keep the word, may I suggest to insert "in particular"?

May I further suggest "On Intel hardware it is ..."?

Jan

