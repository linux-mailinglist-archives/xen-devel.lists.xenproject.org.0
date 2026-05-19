Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHM1HBwGDGojTwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 08:41:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F4E5783D7
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 08:41:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312415.1582509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPE8Q-0003aH-SC; Tue, 19 May 2026 06:40:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312415.1582509; Tue, 19 May 2026 06:40:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPE8Q-0003Yq-PX; Tue, 19 May 2026 06:40:58 +0000
Received: by outflank-mailman (input) for mailman id 1312415;
 Tue, 19 May 2026 06:40:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPE8P-0003Yk-7H
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 06:40:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPE8O-005ShI-JA
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 08:40:56 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c05ef-bab6-0a2a0a5309dd-0a2a4507e562-24
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 08:40:56 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c05f8-229c-0a2a45070019-d155dd32b1f4-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 08:40:56 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-448528f4e69so2023249f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 23:40:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ed30110sm47025205f8f.13.2026.05.18.23.40.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2026 23:40:54 -0700 (PDT)
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
        d=suse.com; s=google; t=1779172856; x=1779777656; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OUXgLVmBVPIiMSKfHXDS6jk0Qd0XP7lL+x1l1bwIrGM=;
        b=A9awz4hOxdrA+BC43hGYDz5019n+pFZG2MgbSbtbxUWK+Dzqoi0Js/g0RhWTubHhXs
         IGiEYScI4VPkG0aO7d+twu73n8A7LxtwA8usZLiwLeq1dsU0r7EU3Zvo3Qqp3LGE+McG
         cLutz++rp4qeEFzi7ZIr1lLhmw792WoiYlkVpvJS//tcUf8/M5gwnMaik2weftgjbm6z
         JzpiHCZ14ynXXWIRu7mtx/uHuIr2YL4WdOxg8SGR1VSH+80fFrRJlROM42/VIpz4dtDE
         SPKr3DuPtiuPo68SSDx7m3WXq1tjBW01yw7mUWlOkChTs/XKRnuQqvUpEgwy3UbDYMOj
         CnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779172856; x=1779777656;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUXgLVmBVPIiMSKfHXDS6jk0Qd0XP7lL+x1l1bwIrGM=;
        b=LocrRs/PRiHQ6fwPyhrvTJofQIpvYi00O5Z/WAHTq1v7Q1XggqCscolJ0t223ITGN1
         H2tNoX+4tBH2rPTR0ObxlxiB4YaMNUdM/B/e63EQWobyO/qwu4w48RmDfNchT+ftsTGU
         P0sIWCBo/whXdS7lpID6A4YY8J8UAPQVRGIvdZurZGIELhjMAJaZuqP43YHpc1+NJ5bw
         mDm8MoBkSdPjR2E4kC8ceeJ7k+WBTxElnFDwigvjECOaZ3Yj4WdwOskI9oO+RBh4bZc9
         kecYAfxZHgt7r2K4vutYNPOdl4noBh82H5AQLk31nAPKupxOhCg4/ad8alF/zbkKe/ki
         7MYw==
X-Forwarded-Encrypted: i=1; AFNElJ8ef7YVwS6r4arW+RWfZ9niSBZalelTS8Im/qvpoaMByIUeT/HUmIByHc161cG4gKAo+szK5LRlUoA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyCHFPIEKMw0tB2+6KmGLiVsyg48vHI1+/1ytqxrRRn7y2DOxfO
	djfgoLo2Pal3FRijXipqGrlExZKsQSRj4ggNBZHBxZtfjG8NkFv0D15lfq3AiDKbrw==
X-Gm-Gg: Acq92OE0nvtsAc7EqV6w17/91/hWo2iIvpp3LUjdp6Z8lPnZwxMmp/fP52wRAT9/PzO
	frsnOtsz7oWzDIIkMO97u5Ju0HuzmIesLW5CMFm+h4Xz+IyVRRD8Zo3u6R9GuslD+HXSdIoK5wO
	DOX4E6Mpn0KQ/ulzlFTY864Lvg/xjyWOHczSCGR0MqgZmNtqhg0ZNMRljK37/RzL5jYF/zFrlyQ
	arn7u9B3i3dOLCKN0cuvltFLcQcQnpMNwdW/uZnR+j03M/FNHT+TSKN4uCv4w5ZkfK6xzCAkOPG
	4vLtGyC1y+ISQJakjdFdm8rRTI1gHo7W26MKN3Nad22FnHasU/jKCoJ7NaTrKfZRw/wsIPKdOD+
	yA4GXfBmWIwBYATah67LV0WNfnOkMg1r54yh5f9aeMixKea0xMTGyFWKJTBB+lACklPJ8WZ1VRR
	jHJyCQSw3ynwfF4amnyCMgKfU23t0BF6ZCtbzTb2c09Sb24qigNF2BmVIsGx2k5XVM+/FygXqxw
	HIzIUkSCfeC/84=
X-Received: by 2002:a05:6000:2405:b0:448:5ec1:dcb5 with SMTP id ffacd0b85a97d-45e5c57d463mr29382650f8f.7.1779172855811;
        Mon, 18 May 2026 23:40:55 -0700 (PDT)
Message-ID: <9b8ec97f-02ae-4a1a-9abe-59873d574a64@suse.com>
Date: Tue, 19 May 2026 08:40:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] arm64: Fix strrchr() matching of null terminator
To: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
Cc: sstabellini@kernel.org, julien@xen.org, bertrand.marquis@arm.com,
 michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
 xen-devel@lists.xenproject.org
References: <20260518234353.453193-1-edgar.iglesias@amd.com>
 <20260518234353.453193-2-edgar.iglesias@amd.com>
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
In-Reply-To: <20260518234353.453193-2-edgar.iglesias@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1779172856-21165C48-D50F316C/0/0
X-purgate-type: clean
X-purgate-size: 1693
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:edgar.iglesias@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C4F4E5783D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19.05.2026 01:43, Edgar E. Iglesias wrote:
> The generic Xen strrchr() implementation returns a pointer to the string
> terminator when searching for '\0', matching the standard C semantics.
> 
> The ARM64 assembly version stopped as soon as it loaded the terminator and
> returned the previous match pointer instead.  This made strrchr("", '\0')
> return NULL.

I wonder though: Why would one pass '\0' to strrchr()? If you want to find
the end of a string, more efficient (at least in the general case) options
exist (strchr(), memchr(), strlen()).

> Compare the loaded byte against the requested character before deciding
> whether to stop at the terminator, so the terminator itself can be returned
> when it is the requested character.

Nit: "..., so a pointer to the terminator ...".

> Fixes: 42c4eb6a83 ("xen: arm64: assembly optimised mem* and str*")
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

However, the function having come from Linux, imo the patch wants to go to
Linux (ideally first, but at the very least also).

Additionally, looking at strchr() - couldn't the code here be written in a
similar way, allowing to get away with just a single branch? (Arm32's pair
of functions is also pretty similar in this regard.)

Jan

> --- a/xen/arch/arm/arm64/lib/strrchr.S
> +++ b/xen/arch/arm/arm64/lib/strrchr.S
> @@ -30,11 +30,10 @@ FUNC(strrchr)
>  	mov	x3, #0
>  	and	w1, w1, #0xff
>  1:	ldrb	w2, [x0], #1
> -	cbz	w2, 2f
>  	cmp	w2, w1
> -	b.ne	1b
> +	b.ne	2f
>  	sub	x3, x0, #1
> -	b	1b
> -2:	mov	x0, x3
> +2:	cbnz	w2, 1b
> +	mov	x0, x3
>  	ret
>  END(strrchr)


