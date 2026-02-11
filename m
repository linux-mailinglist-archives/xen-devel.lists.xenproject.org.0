Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SYYXMzarjGl/sAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 17:15:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22425126053
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 17:15:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227917.1534309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqCsE-0000nK-1h; Wed, 11 Feb 2026 16:15:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227917.1534309; Wed, 11 Feb 2026 16:15:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqCsD-0000kb-UW; Wed, 11 Feb 2026 16:15:29 +0000
Received: by outflank-mailman (input) for mailman id 1227917;
 Wed, 11 Feb 2026 16:15:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqCsC-0000kV-Qy
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 16:15:28 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e03468a7-0764-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 17:15:26 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4806e0f6b69so54306535e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 08:15:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835ba1670fsm35919105e9.4.2026.02.11.08.15.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 08:15:25 -0800 (PST)
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
X-Inumbo-ID: e03468a7-0764-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770826526; x=1771431326; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mmb6FomwfN6gR6OPWswkwtS0FRF5fuWcj/337qYmjlc=;
        b=eq13CGGh5NxHNpo9ktOEh/xjaOovBduiflCI2J138KjmsfEucTk7YhqdMDtSpVMYva
         XaMf2+HQ8qZn2QKdOc1sA5NhfH0vZAh5WNio2gsuTb0dkp1ikGHGnwKNeQRAidJd56WO
         P1IZLLjpBIYQT3z6a+/Rr7PlzorjovR8pMEJKiIeJRjCAO3w1ATl+Mb5qZ9PYh4QzxTW
         EsEEUBvYuP3I1JWyxSMxGBP4of8vXhc5Y9+4X9X8K2AxXbNP6lrvRPq7LmDUjSk93oXt
         /6N9B7aJBYvS+lJmi1ISRW4Kmq5db3UFm+M5MGMc25dlg9HvSd1bIIgdyMw5hyeq5Fk4
         bojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770826526; x=1771431326;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmb6FomwfN6gR6OPWswkwtS0FRF5fuWcj/337qYmjlc=;
        b=xG5QClxeVbqPy3fXjHiqeO3tEi3eLLl1DeuTqUd/rI2tNnnttE6ipdMWaJbuW8tV6D
         Be68g4G77LJs2le3K/ygIwpGjENJ6yE4fjcAUv2L7LvHZQI+rxxTK4McNXg1Pn1ryX38
         e/xd56ciJvXpTGcKOETk29ThiWbxRoqTpRk/RTq2Ohkiot3TcNY/XBF9t0DpfzHZYKcc
         p6LZtutVtUq4I5drcIDum4loUr2g0md2iOvdCQoeqcZRVgmmICp1vMNa7wxUGMWpi7b9
         gWmH9Pg8YYAMo2+KM10XrWKo8TzJINE7BQ/xIRYf61mw/3wx9LEGb+IMRosX53x5F6XR
         5O8w==
X-Forwarded-Encrypted: i=1; AJvYcCUUlTt30I9jSW2krjVGZp0dA90jPdgYx4Tyh7JeElnCdIx7v+SA/zewk99L7dbQ0rZvbIFwZ3i7Ggs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNznMByLQ9VMGf5Axkp9SPY6X5Z+Bcj5eMmjzicCB7XJCyZHEd
	0jLVbcb/djNxWuIP82kjnDFaHU6DuvLWWHQ+dPf0N7LdybRrNVEzBiPBg0l1rtkfSQ==
X-Gm-Gg: AZuq6aIfsLAoi4Q3URsWYgwanbMHpmPhoJun/Vwe+ue67r5qE1GPdggpMQo3UX2oJKz
	RpYN7ncamUinP9keQ6BAjuBXvh5QkRCwkZD4lir5FdxBiFiOkw+J/0oflT5d6ROL8URkTw2+xXv
	FsfJwQsi7RgaEZtFMrLo1ye9u2d88w6i/FtDWvoXf4curpo7OK6mXjEhgbzqcSFYmdKV4KI/VkE
	qFvUn/VZNYWsm6zXCPBOwz4d6wyy5/+SRTyg8gaHtxn/qh2F0giX9hPriSU4RugiRYPwjh2zCEv
	qrCHVJTTIJLbqoM/6xGGwY2qHakNoS5EZzuJTYW24mZoBw5CLPlULLOEVsCnI832KRdzaPhzIJW
	F9bBGI7NqLCdho1MjZTX4eE68QQ+B9l4lqrbfjDO21avDno2hKlkeShD77nyGbYbiz60wBacj30
	frrdRrrhuT/0w6SZVkL5IikT23Mr5gRyr6dJNOvdCQWytoqzprb33x4IWxoQxcAgcHzHV3u9XRv
	dH5v3sPGOKmRBuxfmrnASqPaw==
X-Received: by 2002:a05:600c:4fc2:b0:479:3a86:dc1f with SMTP id 5b1f17b1804b1-4835e2cf364mr34705115e9.37.1770826525943;
        Wed, 11 Feb 2026 08:15:25 -0800 (PST)
Message-ID: <0a77d849-37b6-4015-815c-a572527313d0@suse.com>
Date: Wed, 11 Feb 2026 17:15:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] x86: Migrate MSR handler vendor checks to
 cpu_vendor()
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-5-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260206161539.209922-5-alejandro.garciavallejo@amd.com>
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
X-Rspamd-Queue-Id: 22425126053
X-Rspamd-Action: no action

On 06.02.2026 17:15, Alejandro Vallejo wrote:
> Many handlers are vendor-specific and are currently gated on runtime
> checks. If we migrate those to cpu_vendor() they will effectively
> cause the ellision of handling code for CPU vendors not compiled in.

This builds upon the still very new "cp->x86_vendor can't be different
from boot_cpu_data.vendor". This imo wants mentioning, not only for ...

> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -157,8 +157,8 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>           * The MSR has existed on all Intel parts since before the 64bit days,
>           * and is implemented by other vendors.
>           */
> -        if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_CENTAUR |
> -                                 X86_VENDOR_SHANGHAI)) )
> +        if ( !(cpu_vendor() & (X86_VENDOR_INTEL | X86_VENDOR_CENTAUR |
> +                               X86_VENDOR_SHANGHAI)) )

... this kind of transformation, but even more so ...

> @@ -169,8 +169,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>          break;
>  
>      case MSR_IA32_PLATFORM_ID:
> -        if ( !(cp->x86_vendor & X86_VENDOR_INTEL) ||
> -             !(boot_cpu_data.x86_vendor & X86_VENDOR_INTEL) )
> +        if ( !(cpu_vendor() & X86_VENDOR_INTEL) )

... when two checks are folded into a single one.

Yet as mentioned earlier - the UNKNOWN case still will want settling on
from an abstract perspective. (This isn't because there would be an issue
here, but to have a clear understanding where we're heading.)

Jan

