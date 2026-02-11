Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBmyChmpjGkusAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 17:06:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88934125F24
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 17:06:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227903.1534299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqCjd-0006YN-7k; Wed, 11 Feb 2026 16:06:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227903.1534299; Wed, 11 Feb 2026 16:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqCjd-0006VK-4s; Wed, 11 Feb 2026 16:06:37 +0000
Received: by outflank-mailman (input) for mailman id 1227903;
 Wed, 11 Feb 2026 16:06:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqCjb-0006VB-Iq
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 16:06:35 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a26bc90b-0763-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 17:06:33 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-48039fdc8aeso14221875e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 08:06:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783d30db4sm4993729f8f.4.2026.02.11.08.06.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 08:06:32 -0800 (PST)
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
X-Inumbo-ID: a26bc90b-0763-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770825993; x=1771430793; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EzMd84pXabHt4f5/MHN6T1tOM//izFtZ6iLR8lHidKs=;
        b=SkNZ5WUJzSvG5DadeIzS4waIRyyJLiIRNcpnthz8RlTJOAhTogZrzshV9HHvuGFdGZ
         DziY4pq2FOkZKxZMGCfZQ9Aivx6vgJU2KVFEImKnlL3+5whqZzrABrkvtdK7te/Hm85A
         oPx7dinPJUJulptsYBTaWaUoTOKZzeaYm+Tt6DGlCfnDloH8ODHMwm7AjUHpG8tPKMoh
         tOSSt4mrElBVe0k6/DbY6LNoE0HmvKHjiLlitQG/EeT1D1fSGUC4GpvymcXWePEwlFjk
         QgfNKotNmPZyujZoZf7FZxf/JXXnnMLdSTitfk1fqPiK1MqQ4v96gJFe1PTIBSSwrwXc
         0Ltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770825993; x=1771430793;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzMd84pXabHt4f5/MHN6T1tOM//izFtZ6iLR8lHidKs=;
        b=lYfOiICJ5qGHz4X6g1qoKVYVV7qzOnOHCRWLiThFH9K2IpGQndeBT67IrSWDJgW24s
         DX5fOZw+3ald0mBn/CN6UxRCSBMCEXk5BcKgNHpNEfLJqgs8zK2dEyIKJatuUJPlmPCW
         OjnpKvwN5eOOOL9mqNX2oHc796Hwu8Rrmt/IPXyf4VIgWObHyFlkDXFKT97+8TzV5WM0
         TOvX/bcdg5T3prhpbNYXpx8QvdfYqgNWzQIgLVaovitrkTrsKVpufcmzLD5h3twuCM3Z
         O+ZvfZvGMWYs2yFSU0rIEl4GwhRkNDCzjR3q9VfeQPY/0I08qBOOQIlt9kdeNb8YxguQ
         xWDw==
X-Forwarded-Encrypted: i=1; AJvYcCWM4ogsIFDcsDu76yk1c7oL53S87E0GvWbcWbgUdo+n+4zFW2b0FRu+N5VTu1r5e4ba8IFpukAI+Ms=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwshR98XqASqSIPGcxXdVcnNNCyPyDdhi+CZAdEMC6eDxBHUCxX
	8A4fksNYbrl+GqvAUH61LBCJwAgLGF+l65uC6cCqm2xXU3Jejgr421Vdw8vamaP3Gg==
X-Gm-Gg: AZuq6aIDs/4HTmNEZXP/DEcbVfDu1ZGWFF9+hD7hASJE/5Ug7s8IVXhqRs51SOxbDiD
	jQjdE5BnUs6IR70uNgs8uc/AM36aUk9RLuWGYV9Iwc2bxDtXe8TkFUahZBGnfy8wLQzN/oBApjK
	siSkThGyfC7kcvGQy06D1M9RanhnIJcutBvE24HUCr9bzjFkrHlfBiLELCt6S5JDhuQee+k4lL1
	hpb1DS2veSLjy1hRaxcOD0+xNXHpgvmZ2lsL3qOgmH4QQakEm1kr01HxxhIOSUiinCaZ6l07+ky
	cqVXGUGamrxOY8F/Xv0SuE91j4gDJVZ8bNSBStoyB1CvqtRJmpw/bSqRFtb8Wf13NHeVqcubWO0
	SkYwz1+evEc4iPiLAXIYKizB9O6NCNP43+wMZPNdA9eePcrw9mgA0MCP8PjVm5sCSSA9/MJXGy1
	lw3ndQKC5lNrIdmDmi5/T+aJeqLcXuFLHook4hCSkJzsvwYBGAfCjNSN1XiEeDt7QfER1xGlD4+
	cfhh4b5gkAcdyo=
X-Received: by 2002:a05:600c:6209:b0:45d:d97c:236c with SMTP id 5b1f17b1804b1-483202160cemr266311075e9.21.1770825992862;
        Wed, 11 Feb 2026 08:06:32 -0800 (PST)
Message-ID: <b284e16c-cd99-4595-8fcf-264c378fc57d@suse.com>
Date: Wed, 11 Feb 2026 17:06:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] x86: Add more granularity to the vendors in Kconfig
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-3-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260206161539.209922-3-alejandro.garciavallejo@amd.com>
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
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 88934125F24
X-Rspamd-Action: no action

On 06.02.2026 17:15, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/Kconfig.cpu
> +++ b/xen/arch/x86/Kconfig.cpu
> @@ -19,4 +19,47 @@ config INTEL
>  	  May be turned off in builds targetting other vendors.  Otherwise,
>  	  must be enabled for Xen to work suitably on Intel platforms.
>  
> +config HYGON
> +	bool "Support Hygon CPUs"
> +	select AMD
> +	default y
> +	help
> +	  Detection, tunings and quirks for Hygon platforms.
> +
> +	  May be turned off in builds targetting other vendors.  Otherwise,
> +	  must be enabled for Xen to work suitably on Hygon platforms.
> +
> +
> +config CENTAUR
> +	bool "Support Centaur CPUs"
> +	select INTEL
> +	default y
> +	help
> +	  Detection, tunings and quirks for Centaur platforms.
> +
> +	  May be turned off in builds targetting other vendors.  Otherwise,
> +	  must be enabled for Xen to work suitably on Centaur platforms.
> +
> +config SHANGHAI
> +	bool "Support Shanghai CPUs"
> +	select INTEL
> +	default y
> +	help
> +	  Detection, tunings and quirks for Shanghai platforms.
> +
> +	  May be turned off in builds targetting other vendors.  Otherwise,
> +	  must be enabled for Xen to work suitably on Shanghai platforms.
> +
> +config UNKNOWN_CPU_VENDOR
> +	bool "Support unknown CPU vendors"
> +	default y
> +	help
> +	  This option prevents a panic on boot when the host CPU vendor isn't
> +	  supported by going into a legacy compatibility mode and not applying
> +	  any relevant tunings or quirks.
> +
> +	  Not selecting this options while selecting multiple vendors doesn't have
> +	  any major effect on code size, but selecting a single vendor with this
> +	  option cleared produces a much smaller build.

Shouldn't this option's prompt be suppressed when all other vendors were
selected off? Else the degenerate case can result that I mentioned in
reply to patch 03.

Jan

