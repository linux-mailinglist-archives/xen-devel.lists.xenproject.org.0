Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCRECgGxjWmz5wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 11:52:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DCF12CB71
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 11:52:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228693.1534819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqUJL-0003P4-M8; Thu, 12 Feb 2026 10:52:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228693.1534819; Thu, 12 Feb 2026 10:52:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqUJL-0003Mp-Ix; Thu, 12 Feb 2026 10:52:39 +0000
Received: by outflank-mailman (input) for mailman id 1228693;
 Thu, 12 Feb 2026 10:52:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqUJK-0003Me-4J
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 10:52:38 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f10fab12-0800-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 11:52:36 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-43767807cf3so3365094f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 02:52:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783dfda71sm11800619f8f.18.2026.02.12.02.52.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 02:52:35 -0800 (PST)
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
X-Inumbo-ID: f10fab12-0800-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770893556; x=1771498356; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FDhD9KucPe7IZ7detfcPqHrcIF02/rztaSW6Y9t6xIM=;
        b=T3yXQ3YQMaqVr+NXTJRifdZxuCnAgaiEjGKaAlKiYhekr53rC3mlI0gYBAn0geW5Gw
         cqfJSI2V8BEZoqBC0EvCUbtbH3kDAyOyurD0vXnj07qJnpuE/ARdspzZFi313FAXTPQ7
         giOtamp8TCYW9cLLlwAYHIY/7xrvie1noYpPt74Od+oHwYoObN2DeSx/wXH5r2LyyMpK
         v/umljwXpkmw6d72lJ/03CLVFEdwi15zn0+E27DoLMUekzgxq0NmBtpEzTIW5mIMFutq
         zX/2vFydr4RSP7P0e499cgGWwdXpr2y3bvMN2NP76orC4MSEu8AdeAPQnKL0cCiHfrrP
         ubTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770893556; x=1771498356;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDhD9KucPe7IZ7detfcPqHrcIF02/rztaSW6Y9t6xIM=;
        b=ZIzXoonM4r8ImiWLKUYu8DUslxltAt76wHJXTEbDkbdD7QknJoVgg7okWhqvoyshJU
         YtLUu7OdQRWuKTdL/xY+m95UfXoes51z9mHBYOikTtgvuiazjxIIl9dhTrxKp2hh4MKS
         e7TMxVz3oIQ67G5jgvrCGYP5doHhf0eTr3be8wNGFVVWLvhthkVercL/GFQ9H4oMx/7Q
         bCqXy1B5t7LfBUVpqAIC7Fw3+V79EKFNarXYIx4Kjc5gGKBrXyxRW1R4k2F2CowWhgKD
         SKSnMK+/EDSZo/iL8U/BiA9XzeyJ9uU1IIGtEYgvvgS5yGx3AaNyuzfeqyyL1WuDGP48
         XSog==
X-Forwarded-Encrypted: i=1; AJvYcCWOw1fOoF45dtFpx/IrDLtiNQxptIvsi3IbT2rcu3J+BW7Wz17O17GRk1PrEjefNVDChp+029E1drE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwIgqYYmoRd+DyOQihcO5HDZSKfpFhbdvEdGF9q9hk9wAevfWMv
	FVbrwg7SlcwOZ7Nll8XwVl7MQRGXlXgX9byetn5ZmXcMxOxjf1TO7mulLNRa8lIB6w==
X-Gm-Gg: AZuq6aLg8Q0RxaAlQG8iyU7Z6odOwpTAsDhXlFkQli+vsPHwldupHCIhm1H/Ll0hOqX
	JHiTX7uNp1ZJrnODIbeyJxVL6VEKK0YfctlzujSL+GSHBuZqRqzS1sT5OZ79D6RrZOcgdQdJG5F
	D2fxmvF9f54WHNuPKv85n5ozBcuh3Q0FeVMDGK6S/2a3BxWsjfv6PMh7zXwp77KW/fMUAtxIG+1
	8CzycxsV65fsbSbx8UQhw7hYv/ztYOrZJRkAoFJ6W0zsEH+5du1cW0NY21aEgy92uLvMxkDLht2
	6UoqV1t9VxH6QmeubXPhVlDrjReKEfE70YB7bPqAAWy33D4gBlopJmF4OQORrcyasp99qu7Ywpz
	2t18DlxeOxhcN/LX4EMwfICfkEXr5QNP8u4FnDHJr1ZXiiedA9V7WatGQKgrz1DZXv3TufrmIMs
	X4XjyI+0aLP5/WGdS2i/RVahz22yU5jaf7UeD4Mgwj50qQk0EETNcQFEdk0KSSg/KZG1legwcBU
	B1RnNm+CxgbGKw=
X-Received: by 2002:a05:6000:2486:b0:435:b068:d3be with SMTP id ffacd0b85a97d-4378ac82bafmr3984164f8f.41.1770893555720;
        Thu, 12 Feb 2026 02:52:35 -0800 (PST)
Message-ID: <b861972e-1f31-4685-b83c-27670e561332@suse.com>
Date: Thu, 12 Feb 2026 11:52:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] x86: Add cpu_vendor() as a wrapper for the host's
 CPU vendor
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-4-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260206161539.209922-4-alejandro.garciavallejo@amd.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 93DCF12CB71
X-Rspamd-Action: no action

On 06.02.2026 17:15, Alejandro Vallejo wrote:
> Introduces various optimisations that rely on constant folding, Value
> Range Propagation (VRP), and Dead Code Elimination (DCE) to aggressively
> eliminate code surrounding the uses of the function.
> 
>   * For single-vendor+no-unknown-vendor builds returns a compile-time
>     constant.
>   * For all other cases it ANDs the result with the mask of compiled
>     vendors, with the effect of performing DCE in switch cases, removing
>     dead conditionals, etc.
> 
> It's difficult to reason about codegen in general in a project this big,
> but in this case the ANDed constant combines with the values typically
> checked against, folding into a comparison against zero. Thus, it's better
> for codegen to AND its result with the desired compared-against vendor,
> rather than using (in)equality operators. That way the comparison is
> always against zero.
> 
>   "cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON)"
> 
> turns into (cpu_vendor() & X86_VENDOR_AMD) in AMD-only builds (AND +
> cmp with zero). Whereas this...
> 
>   "cpu_vendor() == X86_VENDOR_AMD"
> 
> forces cpu_vendor() to be ANDed and then compared to a non-zero value.

Coming back to this: How does the value compared against being zero or
non-zero matter here? As long as cpu_vendor() yields a compile-time
constant, the compiler should be able to leverage that for DCE? And
even if it's not a compile time constant, bits masked off in principle
allow the compiler to leverage that, too. It may of course be that
even up-to-date compilers fall short of doing so.

Jan

