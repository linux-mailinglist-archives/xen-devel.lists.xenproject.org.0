Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOO8Jc8Rl2n7uAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 14:36:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0665715F20B
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 14:36:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236292.1539033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt4CF-0000SO-Sr; Thu, 19 Feb 2026 13:35:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236292.1539033; Thu, 19 Feb 2026 13:35:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt4CF-0000Pq-Q7; Thu, 19 Feb 2026 13:35:59 +0000
Received: by outflank-mailman (input) for mailman id 1236292;
 Thu, 19 Feb 2026 13:35:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vt4CE-0000Ph-Gt
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 13:35:58 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb32ea59-0d97-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Feb 2026 14:35:56 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-480706554beso10908065e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Feb 2026 05:35:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31d82a8sm4958685e9.15.2026.02.19.05.35.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 05:35:55 -0800 (PST)
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
X-Inumbo-ID: eb32ea59-0d97-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771508156; x=1772112956; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gFzgYxvag7MDRMRK3Z1V5Twe11RKfvKZUqtM8sK6bf8=;
        b=eevVJY/aJBHF7PNRlxT+5MKUipc5FGsI6bnR6XZZnnQ+WJcWIvC/2u7VHX09I1jZyN
         aycFLwabbUyyjUcbABC8J3Mn91+ocnlhumKucyDCVsAatQpsTd4+42D3Q38+w4JRFfic
         Cl4z5ulANwyj5sQWSN8ezFV1Brw4lpl9wtLKcctFCxZuyQcWLpUQAqIjiB7N2aHNfUY8
         2s7ajak5rkTC7Mf5rM7AkdcVVQasA19WYr4gkZyhdNgcEnqim8Yyhoc4hFrOcYaQyjNj
         V4fK3kCf2KXD1PdsclO0STcyCJhpzGbD8AihnV97OvOHMiTTNvLigM45TAMuowWbwhci
         AgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771508156; x=1772112956;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFzgYxvag7MDRMRK3Z1V5Twe11RKfvKZUqtM8sK6bf8=;
        b=wc+rRwEZPWTkMLJnbPW5NQ0eADZHW0Sc2poPIt3o3ycbqTY5V0fNsy1RHioqRP7rsf
         kaCBmPV4YrKvQBh6RVtrqLJMMAgTZUU4dx/NL8b+CV/4+HWYQfTKgKmRblOsz3IpXd6i
         JShyT7aMuuvAGdZR1VXedtEdMPRbefVnPYNm1WppN3jNFq421mz/KEGFiZBAQI1HdeOC
         O3FQ8F5cIQL3EN+Ui/ztRwrzQ9VdeWESbVrrPxZmXKKUtfePskqfGrYGwbJyfXcE5/1T
         RThwS+MvFTwvn9KMXpCRv4zTT7J5dNPCKUFfx/cnSfAtcauWyeFNZiXm4C/RRlm0nqKV
         U/dA==
X-Forwarded-Encrypted: i=1; AJvYcCVRNWY967K0s6S9wJ+hFEwbkW9cNnnYbfX2iL8iFInv4oNMV983+CzvmfMwGSY61pOd5iy0ZFP7XSQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyV7snDdtPIXL9/0/rtGFd+7lZwTGCGvfpAu4xRZzjUTsQ7Gf3s
	wBDZ1fj9/VpU9m4LivmE6XMhVyBQ/apI2WxvFwYKyyxwNgFEP+SpU8PnPxPU412ymA==
X-Gm-Gg: AZuq6aJ39WlF4/55IMnAXO+GgCBNVTNXVjxtnU1n2q6V7FojW3CtlvjbLzmcHD5Vzdv
	1evM4jScYlEi/y+BU25OKSUvXXZCtMp5P+gD7J8Sdamj/Lo2RTQ9GP+HtRuGIoFoKg/WkQk4hbc
	ORWjQvtudIvLVtdFn+3nUI9vYR2fLW4Fq57eFZutB3+olZ7OJ2dSGSSTRfBda0sKNCk1wagKPnx
	fnEEM9+ZM3Q4o54h9ii7yse387dRsVXcC3BtXmscO5jg8fYerLuoiW1X65mJIGKo0qGjuPcA6ih
	a8puf7R7kJ1Gm0BaWgmLrHRa4caxLRvI++wVCBytHllBCE6iw9zj2D1Jonbw9Y1QFJy/qqzsMl+
	CL1qgQkhVweX/SwvAR4FVI8sgizw5Stschzodemdlw/YlXe7S8/x2eiOkxwzqM4gY2aB8oGlnF+
	5ayFvKJeFG9AHtwneiGBXby77GBLOTk6+honoBmM5BhEj1V+IBT8WGRSkQQrcUZVvezs3wmqhYQ
	fX0qhWmjEuaE80=
X-Received: by 2002:a05:600c:37cc:b0:477:58af:a91d with SMTP id 5b1f17b1804b1-48379b93370mr299706525e9.5.1771508155692;
        Thu, 19 Feb 2026 05:35:55 -0800 (PST)
Message-ID: <2eba7de1-a8e2-4c45-affb-8ecb91278707@suse.com>
Date: Thu, 19 Feb 2026 14:35:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] xen/console: add build-time rate-limiting controls
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
References: <20260206202424.2054758-1-dmukhin@ford.com>
 <20260206202424.2054758-4-dmukhin@ford.com>
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
In-Reply-To: <20260206202424.2054758-4-dmukhin@ford.com>
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
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,ford.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0665715F20B
X-Rspamd-Action: no action

On 06.02.2026 21:24, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Introduce CONFIG_PRINTK_RATELIMIT_MS and CONFIG_PRINTK_RATELIMIT_BURST
> for configuring rate-limiting policy at the compile time.
> 
> Use symbols for global rate-limiting initialization in the console driver.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

I'm not sure this is a direction we want to move into, so just one formal
remark below.

> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -103,3 +103,28 @@ config XHCI
>  	  Enabling this option makes Xen use extra ~230KiB memory, even if XHCI UART
>  	  is not selected.
>  	  If you have an x86 based system with USB3, say Y.
> +
> +config PRINTK_RATELIMIT_MS
> +	int "printk rate-limiting time window (milliseconds)"
> +	default 5000
> +	help
> +	  Specifies the time window, in milliseconds, for rate-limited printk
> +	  messages. No more than `CONFIG_PRINTK_RATELIMIT_BURST` messages will be
> +	  printed within this window.
> +
> +	  Setting this value to 0 disables rate-limiting entirely.
> +
> +	  Rate-limited messages are those controlled by the `loglvl` and
> +	  `guest_loglvl` command-line parameters.
> +
> +config PRINTK_RATELIMIT_BURST
> +	int "printk rate-limited message burst size"
> +	default 10
> +	help
> +	  Defines the maximum number of rate-limited printk messages that may be
> +	  printed within each `CONFIG_PRINTK_RATELIMIT_MS` time window.
> +
> +	  Setting this value to 0 disables rate-limiting entirely.
> +
> +	  Rate-limited messages are those controlled by the `loglvl` and
> +	  `guest_loglvl` command-line parameters.

printk() is implemented under drivers/char/, but I'm unconvinced of placing such
pretty much global controls here (rather than in common/Kconfig).

Jan

