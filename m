Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJKbIsqksmnwOQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:34:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 386BD271058
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:34:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252146.1548915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0eJ7-0003BD-1t; Thu, 12 Mar 2026 11:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252146.1548915; Thu, 12 Mar 2026 11:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0eJ6-00038z-Uz; Thu, 12 Mar 2026 11:34:24 +0000
Received: by outflank-mailman (input) for mailman id 1252146;
 Thu, 12 Mar 2026 11:34:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTts=BM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0eJ5-00038o-Bw
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 11:34:23 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a7acea6-1e07-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 12:34:22 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-485345e1013so15224365e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 04:34:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b65fd3dsm126827285e9.10.2026.03.12.04.34.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 04:34:21 -0700 (PDT)
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
X-Inumbo-ID: 6a7acea6-1e07-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773315262; x=1773920062; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SpPVNA9rnXMIJLYHdmj70bxry6tv0vKNhaFDLieBNkk=;
        b=D7fp2ummzJfrJT4/6uGKctjCERb9lC7jP2jjCEc1Fhfo7fqU7FwcLikzkmk8AmCKQp
         xal0/KDVF7GTa9BfSjzm6WTJ2Wjgnvxaht9E3qsZm8U/Q8fUhR/KWqDjg3dpg1m3AF6n
         axMVWFztCmtqGCsO9ScUEmcFShC2KxEyEL6OH79Heh6SGuGJ4LJ03BuqUm985b8VDhWK
         N8hTrAUezoaw/y87xszHIXj0y8O8n3P365OG6SPWEMYtJTOXRODQBNZSnsibpr4T2hSH
         1/JtpmcBWSwnccntH1CcYo62KYLQ2Gne0ztWkC8w0J0tI6SCSpybqfm599Ib6YSgKbAc
         SzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773315262; x=1773920062;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SpPVNA9rnXMIJLYHdmj70bxry6tv0vKNhaFDLieBNkk=;
        b=QX724tK2Hjj7qdsaj5QULN16I1jpECXIqhhR5nvbjluHkCM4EVIpcnnZyqk+uj1n45
         dS/d1abaMBxef1T5OjTfV46QbNGJW8EUCLsQ/SxUrLzrvgY95S93hHRWh3l78caIAPC/
         2/A8gxYK003/0MjKFRFRhunG7juOcV0SCmHZkbH+F8F+OnqrVnGAGKH5Tb+IwLW33OHu
         5IkbZalTSMw55xsUp1On6myWOeOsdvGSXgLQaSVazbQTGNB8kmky/qKMTB+i+IXTvj3S
         CcAzjnA4LOt9vp0yflWtTMRDAyBejIeM5eJ0Gj1snwvH15JYS/DZc61p3FCq5QNAfYIK
         Y4JA==
X-Forwarded-Encrypted: i=1; AJvYcCWStN6X3+8Hr4qLh8CzlLqS9VMsdeW2bYGwDZCqj9MJ/GkfYJasn1NcjPuMKEAIPbDWvv8/a4zEGpU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy9jWdffvpI5zNAppveT/54EFT8DNram5tSg4ZFEJci929gkyCc
	uDROl4U2BGCrrMKcqosWS3umZqYhjGK+oGJbtjVorhWB9t0fWedpRh5LRvuVlmKPJw==
X-Gm-Gg: ATEYQzzEWH9Wev9FZvmE70hateyjmOScYLS/8IBc32jVhiG6H9DyR9zoS8OeyW1BDEG
	GypTCUcMpfgf0XyPAXUh6rQ6bVhAk21mBkQHg6nOs/B733Qo0XsC9JsCXy6Bs+XfMjowly0esrK
	xQjZHcCzyJV7Hk7gjIg29ZvYcwByyALoRDy1YteSQyZ5GxpKMqEHbJ7NxXpI4um9hhQSswyh3av
	bD7fjQVH5M58EF6SID6l/VkWEwM7y7HCplmT/lWXNzhS2MPhPIqqiH2GsHDzSFdt0AtXhfIR9M9
	rgvwf0CL4h9f3wyqH2AhM2C/zoWQTQYYBhIplfbNb9a2hgdfsBX6mn3lDyasqiIByTs9ZikfagZ
	SaQiETZwVsta/M7slqllh/0q8z8ZN83rYmJmsQPw+k2HtzakkfKqZArhN02KUq/zOK7IFDhoHaX
	5X6y3nNkNQzeWSVX/bWYAvpDBuJC0ZeG6THHhft++Z1OMX8koXKNuCBC1uRy0Dx+7Lv0fBHGf1f
	ZpK8G6UMO7Z+gw=
X-Received: by 2002:a05:600c:c48f:b0:479:13e9:3d64 with SMTP id 5b1f17b1804b1-4854f59f1cdmr46459475e9.15.1773315262043;
        Thu, 12 Mar 2026 04:34:22 -0700 (PDT)
Message-ID: <6f464bd1-7ba9-4804-8eb8-af8f079ac936@suse.com>
Date: Thu, 12 Mar 2026 12:34:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] x86/hvm: Disable cross-vendor handling in #UD
 handler
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20260312112116.22563-1-alejandro.garciavallejo@amd.com>
 <20260312112116.22563-3-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260312112116.22563-3-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid,amd.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 386BD271058
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12.03.2026 12:21, Alejandro Vallejo wrote:
> Remove cross-vendor support now that VMs can no longer have a different
> vendor than the host.
> 
> No functional change intended.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


