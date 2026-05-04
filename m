Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIKAIPt2+GlavgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 12:37:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCBB4BBD53
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 12:37:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299665.1574216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJqgB-0005zN-KB; Mon, 04 May 2026 10:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299665.1574216; Mon, 04 May 2026 10:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJqgB-0005wm-HM; Mon, 04 May 2026 10:37:35 +0000
Received: by outflank-mailman (input) for mailman id 1299665;
 Mon, 04 May 2026 10:37:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJqgA-0005we-79
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 10:37:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJqg9-001yJ3-JF
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 12:37:33 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f876ed-bab6-0a2a0a5309dd-0a2a450ba2aa-0
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 12:37:33 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f876ed-212f-0a2a450b0019-d155802acc05-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 12:37:33 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-48984d29fe3so58396125e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 03:37:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a824f9f0dsm304990745e9.15.2026.05.04.03.37.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 03:37:32 -0700 (PDT)
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
        d=suse.com; s=google; t=1777891053; x=1778495853; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jFBFUxRRnx2d7iC3ohvdmBuZ958Fk6ZgZe3pZ58w8n0=;
        b=CoxgN7ncoahAlSzH/ZAIoNEcgt0WpTXu20kjauPZXpWrcOvi2tDuYM5Aq8wikLL11l
         MuODMOohrbOkHquI0L/QWBiub75PsnMDxiSkHcGpAPQWgknWjspPh9Wv8MSAaznX/7Xl
         a7V4ebEVqRb15vw5xf7xH1OwwqTHddLFRoF4SWLB/4IK7dSjvBSVRJgg8ruZqwq2ddxp
         MjrB/ksAer1aQ6gDslHyJMGlXd+dqpSldFb7gQMSUE5/HKuZb8Bo+1ZLC8iJx3Hvk8Us
         O+lTbzh1TMpiQVAzBnV4eAJSHyWgzwvm1bSCbyYi0GRM8D/US0lfCctxi6fyVzEMarng
         I6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777891053; x=1778495853;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFBFUxRRnx2d7iC3ohvdmBuZ958Fk6ZgZe3pZ58w8n0=;
        b=e2otKE2eRL+rATgfdYfrmqs3HZToX94ossVvHLLSteKpFtNHOa6d3rYwZvRtPxIkOQ
         sr4LoVlgF8gJ97uKVNn7rDO91X8By/zcxiomaRTJy2vZPhWn9Ngcd1YFyLZh661cG1z1
         0hL8xSYLt7cSrA6Kgn6ImjG55vzLDYoe9bUZLUtOwncvEajWLc97pCr9kEkbrNImBYSE
         /o8DF4QfNyyXc9m5b1A2+9SlN2pGvLIfOJdAsOm3i7/kvRcwaaYSW/aQUsWsRHHoHD6g
         LB94wx5n2UZtJ2s0DMJH9Kg0Jbt8v8JvhJL/lWrNZQzCek4mf/ykCTEH3/2x4Kn9ve6A
         hAYg==
X-Forwarded-Encrypted: i=1; AFNElJ8eiXi7gywoFzdSeRoqhCVdBnSO8P5ZxuYG/Ly0WUV7J96n46ra+qQdqmTlL3nt8qTt4/1AdfjzRiw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YylAO3AYzedHZQaKeWsjW59EAWulhsY0RRCvy4Sl7/XWIvRiKHk
	rY80wBMmh5Qr/PMIOyFKTJx+/B1E313VbJhQrZIeapScRReat2ltRm2jH6k+SFhL4g==
X-Gm-Gg: AeBDieuv4S5vwG6cBe6ir3n/KBK3QvrwGWIQAS1AR1og6QYpK0FUm2UM1Upu2sOAu4L
	UcG4oQalMEdRc9Av6vRt4PSdnlR5wclnjEQXEaRAky3G9NyB1wQSXKdXd8yBQXuQ54DaVNhUFdL
	Z0MWvUPa7zXY6teUEtDV+ZxvkFtDO9KrAceKG3ogl0DpUA4nOSp7/3IhK+QMBJMdB70S3iPvZPe
	wNfcZ8riOi+WdJ8hWkqUD+9rDxS9TO/g8CeMkeHW6n3PYQQWi8mJcEUsp6Qge91KPqhTC7KjNnV
	FNLIvFHCVWlrP2X4e0+QcdnpkqZxndKQ5j26TmxJ6amYQrpD9NSoNOYaUsBojgHxXBz+5R8wfU5
	auYFQzEBujAsXdZ5qzSAhj02kfp8W/qJwofm/ZKE1tqveflK0db/YTjR+0pZATcBK36eWjGiMPo
	K31oG4Pg8jW0aSoyj0DAKx37D2LrmINqODKoAKpaSAimQSk2mMQfYdvfrTYcfhYeRQNmXkkAk7G
	wjEBnbQJbL4gW5Syre2uyeLaA==
X-Received: by 2002:a05:600c:4445:b0:488:9ed3:1492 with SMTP id 5b1f17b1804b1-48a986360b6mr148808015e9.10.1777891053002;
        Mon, 04 May 2026 03:37:33 -0700 (PDT)
Message-ID: <fda8cb13-4ac6-4575-aba5-b2fcc3b4e1f9@suse.com>
Date: Mon, 4 May 2026 12:37:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/amd: Drop allow_unsafe parameter, tune down XSA-9
 mitigations
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <1776877188.8631fc262581453bbf619ec5b2062170.19db6223737000f373@vates.tech>
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
In-Reply-To: <1776877188.8631fc262581453bbf619ec5b2062170.19db6223737000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1777891053-7ED77F3B-DB7FA3D0/0/0
X-purgate-type: clean
X-purgate-size: 1244
X-Rspamd-Queue-Id: DDCBB4BBD53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

On 22.04.2026 18:58, Teddy Astie wrote:
> @@ -1205,19 +1201,12 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
>  	if (c->family == 0x10)
>  		__clear_bit(X86_FEATURE_MONITOR, c->x86_capability);
>  
> -	if (!cpu_has_amd_erratum(c, AMD_ERRATUM_121))
> -		opt_allow_unsafe = 1;
> -	else if (opt_allow_unsafe < 0)
> -		panic("Xen will not boot on this CPU for security reasons"
> -		      "Pass \"allow_unsafe\" if you're trusting all your"
> -		      " (PV) guest kernels.\n");
> -	else if (!opt_allow_unsafe && c == &boot_cpu_data)
> +	if (cpu_has_amd_erratum(c, AMD_ERRATUM_121))
> +	{

Nit: Misplaced brace (it's Linux style here). But really I don't see why
braces are added in the first place.

>  		printk(KERN_WARNING
> -		       "*** Xen will not allow creation of DomU-s on"
> -		       " this CPU for security reasons. ***\n"
> -		       KERN_WARNING
> -		       "*** Pass \"allow_unsafe\" if you're trusting"
> -		       " all your (PV) guest kernels. ***\n");
> +			   "*** This CPU is affected with erratum 121"
> +			   " 64-bits PV guests are able to cause a DoS (XSA-9) ***\n");

Why the change in indentation?

There's also punctuation missing between both parts of the log message.

Jan

