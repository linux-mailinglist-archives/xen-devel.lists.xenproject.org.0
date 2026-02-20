Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uENaJ59qmGn4IAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 15:07:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9F216828D
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 15:07:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237147.1539562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtR9v-00013u-7t; Fri, 20 Feb 2026 14:07:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237147.1539562; Fri, 20 Feb 2026 14:07:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtR9v-00011z-4K; Fri, 20 Feb 2026 14:07:07 +0000
Received: by outflank-mailman (input) for mailman id 1237147;
 Fri, 20 Feb 2026 14:07:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vtR9u-00011t-8S
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 14:07:06 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b5ab050-0e65-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Feb 2026 15:06:58 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-4359108fd24so1318850f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 20 Feb 2026 06:06:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796abc9b2sm53090830f8f.21.2026.02.20.06.06.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Feb 2026 06:06:57 -0800 (PST)
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
X-Inumbo-ID: 6b5ab050-0e65-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771596417; x=1772201217; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ulmaBb6NIer21ZQ4qFoejIt+U0Qh8pKI77FDh1EF3bc=;
        b=IMIDtkBAq5JETi9bfgX/uRhrUhlAAgttcHjibL58GeP0y6SlzxCRer9E0O0mOOboOp
         Q0gbRb2v/saPE+ElGtR730HY06zO9R9iwLXm8K9pxasR8B3c+XsVU1S7cO/Agi7jRxxD
         x9WLDF5fo3+GsFZW8vX2SH9D6JETf8n3romO5Y6M3jZkzZaHfhH1XzCt3/bo7chzp2q3
         dZrdOb0D4BUIQ/FbwcybLchuFWaWzUFvnyS6546PPfBUJbHN9bFmvIGEOF561cbGduCz
         f1aiq1CGXcMc0TFgKXwM6ccz3302CfPwSTWxnmqaAnpQpuyNkTVS7AEt8fl7/c/K0Ir4
         /cbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771596417; x=1772201217;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ulmaBb6NIer21ZQ4qFoejIt+U0Qh8pKI77FDh1EF3bc=;
        b=RLXojC2vpWIxMQtnJvo1IAwyh0miXtGziA5ntfPalVSqDhly88Op/BQKP1ijVVV9M3
         FIq+ipc3rlLGDjdYHfFjP8Z6IWzRo1tZk/GFWIZMmq1TOiyB01DF4Lumbhuo8m138S0j
         sIe/8i1gobAc7Zr6Vhx2G7seN6TG0F63diz/bYrYxCpmoOO6Iqm5Wfbxf6vZxqxAaiFj
         LFxkMKn3kAywJlvPNK+uLON/h8t0wV8AChu2tPjcyEYs60ELReMCEjQgyYcdVRRFBXzB
         POXTZtpBxMkRBcgmX35EkKFiTUsYh5eczgvk0eWCSjdVyEnSN47kCRWUSKquCjW5gIQy
         H2AA==
X-Forwarded-Encrypted: i=1; AJvYcCWuLXjaUHdSOFitlkxBYB7nEUZW/ELcAXSLvGkssFl5WILZ+wnRv78eFli/Mn3zXAMYLVdhy8nBuWE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHNUHxmH40lpSQ53R6814ojY1UiX7kufQWA1oogIeFuWK5Z//q
	Z4G/fTF8ea/6L3tN1gmNUphjUVgrvOpmlR53SnGdlnGedWyBahHZUCULkMNH3NL7qQ==
X-Gm-Gg: AZuq6aLWz6WWd2lkG22I+5q0BI044g6BTkK3dRs9L7PL2/dzo1DZbkE7DJOgpEZkPNA
	zIKYzPEJOcTXraDshgYcSWfCG+GJWUk7l7PbRhoWWk2kVJeeT2wp7wkzzVLweMeFJ1IJDtVxS6x
	5I590c4WxqIEbwYb6tlxf0nFfnL5Qyq52oZr9/gWRoTllJtkGwrFkuj/IiFpfqc37vlGOraH1N2
	IgaNfJtfl7Bkn4rXvok2JkfuxEU3GeNZEHep92010LMD1lUG9PsDwixMS9cZt64Rt+KpaqNit+V
	vgPWiCVOq0HqR7VdB5iLuVSE6qcuc8X7tVU7ITUhq6lPimlGUB9KTxR4FRSKYBs3jbGp0/FQKmv
	qFFDTV1uw0B3lPl1uSFpPWrI1FTHjltoaBDKHS8g4uJjp8gx74fEjlUJBLm5dc4Nq1AsTWbhvZd
	RDRKs+78fxfqhE1ftTtnSlpsHRONWmGVCIg4+CEJ87p2TLCg6+RCo3VYWpvz6fUgBEOZG1sAPzd
	yFxPStxpVdfx9U=
X-Received: by 2002:a05:6000:2511:b0:42f:bb08:d1ef with SMTP id ffacd0b85a97d-4396f1677b4mr32408f8f.17.1771596417491;
        Fri, 20 Feb 2026 06:06:57 -0800 (PST)
Message-ID: <5ccdcb99-eeeb-4037-a253-3314f57b3368@suse.com>
Date: Fri, 20 Feb 2026 15:06:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] libxl: constify some local variables for building with
 glibc 2.43
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20260220121220.52078-1-marmarek@invisiblethingslab.com>
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
In-Reply-To: <20260220121220.52078-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,invisiblethingslab.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0D9F216828D
X-Rspamd-Action: no action

On 20.02.2026 13:12, Marek Marczykowski-Górecki wrote:
> Archlinux just updated glibc to 2.43+r5+g856c426a7534-1 and that
> causes libxl build failure:
> 
>     libxl_cpuid.c: In function ‘libxl_cpuid_parse_config_xend’:
>     libxl_cpuid.c:447:16: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
>       447 |         endptr = strchr(str, '=');
>           |                ^
>     libxl_cpuid.c:452:16: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
>       452 |         endptr = strchr(str, ',');
>           |                ^
>     libxl_cpuid.c:454:20: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
>       454 |             endptr = strchr(str, 0);
>           |                    ^
>     cc1: all warnings being treated as errors
> 
> Add missing consts. Note in libxl_cpuid_parse_config_xend() non-const
> endptr still is needed, to be compatible with the second argument to
> strtoul(). Add second variable for this reason.
> 
> And while at it, move semicolon to its own line
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I'd like to note though that this can't be all that's needed for tools/ to
build fine in such an environment. xenstored/core.c has two problematic uses
of strrchr(), for example.

Jan

