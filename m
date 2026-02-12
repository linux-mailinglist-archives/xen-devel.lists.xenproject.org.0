Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gErsAoGFjWmx3gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 08:47:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9C312B01C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 08:47:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228438.1534618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqRPf-0002Ri-0k; Thu, 12 Feb 2026 07:46:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228438.1534618; Thu, 12 Feb 2026 07:46:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqRPe-0002Pt-UG; Thu, 12 Feb 2026 07:46:58 +0000
Received: by outflank-mailman (input) for mailman id 1228438;
 Thu, 12 Feb 2026 07:46:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqRPd-0002Pm-Jt
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 07:46:57 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 009bea05-07e7-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 08:46:55 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-48039fdc8aeso17936995e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 23:46:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d482480sm208790145e9.0.2026.02.11.23.46.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 23:46:54 -0800 (PST)
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
X-Inumbo-ID: 009bea05-07e7-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770882415; x=1771487215; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1N1gylRJjoEAV9Cpm/NewIJkcvqgPrpavRbUsM4il4A=;
        b=ZhUEXAIzAjKdGJ0I+mQdJsEPJbvJNdSjiIdfrle47fb7xNdFJf0owgOXBIvSCwaovg
         Fv1p7KDbnMSzMMkFaQ7r2mMmGiO4Ecx+nhxhQhD41whkgmhZjItIJnAp2x4fecBR5NFJ
         5Z7Iutq83xPnyQAmeF/6H9ZXHgu1dx7c5O5vQ74Qb6mjju+JthxMSAPfOoNmf0PyCNZQ
         BIGZ5UqffqXB1CrIr1/PVl/UitQ3nyzJQwvSci0uQfDwWNq/VC8MoEko9O9oARKZn1C2
         /6HIM5ztpgPZLXInA5P2ToY8n968HetdcGwmgcZeXxp0W16duKHbL0wgJeB84X0gDZ6/
         cujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770882415; x=1771487215;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1N1gylRJjoEAV9Cpm/NewIJkcvqgPrpavRbUsM4il4A=;
        b=CPzVEluLNC5QfKGGgG2KtJSjkmp0c6jXcedHfVodGkX6gdXhhBSxb1U9tWI7u9HDaY
         D9trUgRHhMNL4e4clfeiSzuB62XFz1/yduKm3dsdfDrS9fwJ907W8YdoVPqjM3zbkP7j
         s8Vuz0rLfBjuCU1FaumAEZz2UXNdMwp5PAsLEghuDEq+eZad7L8yC/1MlsTU/PPqrhky
         9fGMLjgK6hRBv3S/Qu8t3d29wgKWa94eIq05+ytqbfE8UTBUcSgxZIZBiYoMyRdk31u3
         cOzVCu2OVY17seyEJCadJVlbGZI0xZ2qJ3Ttqp0O08TFbsmRl4QV6IUH3znoZKiLtEpA
         a3qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYkH8kYSA6ubH9Q12cuYlIjHTaps7uRHWPBPxuGxYnkw96voJ7aYb3EerHitkpyH1Y5kwFgSt2KTc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxefdBMgzOyaKEehw04Np/dOW56TeBaebXdrH5nrn1eIrHJ4A/Y
	Ied3Kr6oDq2zAjifGt+kl91F4MNGYThKiDva0oRTi6XMMELOTgcKAx9MjCfhcyfkfp0hzgmVIVN
	CdNs=
X-Gm-Gg: AZuq6aJYSmPX5CXf/kAD2xR1ZaJh93F8LIHY7koTpj9HtoGAJpjfBIm7To0rUQ31mKr
	9ehKF+gvN9e6t06BFhUwSZ+Lg6QrZn1+aIKajlx5aD8tKeeYwO6zqbATo6+7ruK6TtQUbkqeUHn
	1ju80mal/duF4uIg6q4nCnn0TIaXhGkFLCmaOKkrn0w4KDPLOSeMfR3DiwIl6sonoFq8aHvEK9/
	h3FbC4Kvt0l4AqNBOcofk2xW3yKYqD8D04ONuWglAUxfVdc/woIgAKHrotZ9s5fLrHrNgsV6VHd
	gAvR7DuFSBgqNIlSgS7PapBG4q4u0rnftzEAYHRNV/mD2NDXSouLKcS8gVVEBDHek2os94ql81f
	xZubNHkba3If4rhwBRbg4JJRvjjcmJ4KUO0a2N8U/unyTImCepSDNzOArTCkn8aMMlVgNg4AlV1
	wz7YnPb1IJi/S0ubtBU/RPXedGYdJY2HmVaCYBZoJPtEh8bv2lb8Ihl8cA31rnbAgT+SXNNOV3l
	pSyuWQillwIcIA=
X-Received: by 2002:a05:600c:8216:b0:480:690e:f14a with SMTP id 5b1f17b1804b1-48367128f99mr14367915e9.14.1770882414861;
        Wed, 11 Feb 2026 23:46:54 -0800 (PST)
Message-ID: <308aa058-73aa-42fb-a68d-ff03ee979820@suse.com>
Date: Thu, 12 Feb 2026 08:46:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libxl: constify some local variables to appease gcc
 15.2.1
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD <anthony.perard@vates.tech>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20260212032334.1696248-1-marmarek@invisiblethingslab.com>
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
In-Reply-To: <20260212032334.1696248-1-marmarek@invisiblethingslab.com>
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
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
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
X-Rspamd-Queue-Id: 6C9C312B01C
X-Rspamd-Action: no action

On 12.02.2026 04:23, Marek Marczykowski-Górecki wrote:
> Archlinux just updated gcc to 15.2.1+r604+g0b99615a8aef-1 and that
> complains about libxl:
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

That's supposed to be happening in C23 mode only, isn't it? Looks like under
tools/ we don't set the mode we want to compile in.

> Add missing consts. Note in libxl_cpuid_parse_config_xend() non-const
> endptr still is needed, to be compatible with the second argument to
> strtoul(). Add second variable for this reason.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> When I say "just updated" I really mean it. The update hit me between my
> CI saying "ok" and release build few hours later. I guess Xen's CI will
> see that only after next refresh of the Arch container (next week?).

Hmm, and that would then affect not only stable trees, but also security-
only ones. In particular there I'd wonder whether enforcing mode (to be e.g.
C99) wouldn't be more appropriate. Anthony?

> --- a/tools/libs/light/libxl_cpuid.c
> +++ b/tools/libs/light/libxl_cpuid.c
> @@ -415,6 +415,7 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *policy,
>                                    const char* str)
>  {
>      char *endptr;
> +    const char *endptrc;

Don't know what the (perhaps unwritten) policy in libxl is, but in the
hypervisor I'd ask for the variable to be declared in the more narrow scope
it's solely used in.

> @@ -444,25 +445,25 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *policy,
>              return 4;
>          }
>          value = str[1] - 'a';
> -        endptr = strchr(str, '=');
> -        if (value > 3 || endptr == NULL) {
> +        endptrc = strchr(str, '=');
> +        if (value > 3 || endptrc == NULL) {
>              return 4;
>          }
> -        str = endptr + 1;
> -        endptr = strchr(str, ',');
> -        if (endptr == NULL) {
> -            endptr = strchr(str, 0);
> +        str = endptrc + 1;
> +        endptrc = strchr(str, ',');
> +        if (endptrc == NULL) {
> +            endptrc = strchr(str, 0);
>          }
> -        if (endptr - str != 32) {
> +        if (endptrc - str != 32) {
>              return 5;
>          }
>          entry->policy[value] = calloc(32 + 1, 1);
>          strncpy(entry->policy[value], str, 32);
>          entry->policy[value][32] = 0;
> -        if (*endptr == 0) {
> +        if (*endptrc == 0) {
>              break;
>          }
> -        for (str = endptr + 1; *str == ' ' || *str == '\n'; str++);
> +        for (str = endptrc + 1; *str == ' ' || *str == '\n'; str++);

I'd further ask for the semicolon to be moved to its own line.

Jan

