Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPGPGnndeGnytgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 16:44:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4F796FB9
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 16:44:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214995.1525247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vklFG-0001dH-H9; Tue, 27 Jan 2026 15:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214995.1525247; Tue, 27 Jan 2026 15:44:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vklFG-0001bN-ER; Tue, 27 Jan 2026 15:44:46 +0000
Received: by outflank-mailman (input) for mailman id 1214995;
 Tue, 27 Jan 2026 15:44:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vklFF-0001Ph-66
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 15:44:45 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1958445d-fb97-11f0-9ccf-f158ae23cfc8;
 Tue, 27 Jan 2026 16:44:43 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-48068127f00so7223705e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jan 2026 07:44:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1f74b15sm38612832f8f.35.2026.01.27.07.44.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 07:44:42 -0800 (PST)
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
X-Inumbo-ID: 1958445d-fb97-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769528683; x=1770133483; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WjE2ojfQ+bQT7F9VzxjRPMNn4rFs09LKxqqw5uPGYC8=;
        b=Zk9a7Ty8jed2S5K0ckc0RiZnQeqQGyvl3jsEDhuj/fHmuDldndw/7jvnXyynQbJaFv
         vJYVQS0p+KZKM4+hOKvtJcTtTrRmNScbQmsh/8Kbj16q5jRyprvQYQF1mXkfmiAlL4Wt
         qnJjSyGGEY4vwo1HUIqZJPWMywYsNC+l1SpZy6JtA9F76c5t5Cuhi20tfsmOQenfVPJv
         Wa++JAfYQHoyYfiED3MENX4E2tBRVZS3CNoiOEWjVgkozJwtxEme3al4LVgt/9TYx3Sn
         RSgzN8HIDwuQnFqd4ZQZ0WE3cFVAnz4tqtFlw5J92lfOQvqsS/oiKNz4V5tiFEqiBw3w
         kmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769528683; x=1770133483;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjE2ojfQ+bQT7F9VzxjRPMNn4rFs09LKxqqw5uPGYC8=;
        b=T0UaahzAolWgbw3hjodXt92kvZGc9VYyaEaR482ojinZ9w99IL4OIiRb4cgzYWeOLf
         06+/EAKaeU1k0XLnqlVIadrJIWrXnJKtuMrqzRA7HuvQfsdT50v4uYrJrO8OFAOIFmcr
         Heh6LrEadCv71wJluGwTviUJpzHJrHTpX1XofubHNqJn6FxFVpBBvdjjT9dETA8htvrn
         W3G3T04vYePGOEmulDc7ugk4Z4iAvLxdNnCRr8FqTD+L8bVam8cpyeJKvljMXlsoPVcx
         /sMYjmtM5PbHxO0TgpzSHUnybV9U4W7HwGrhhMS46AT0dwaS8d6/Jk2ksAnCJr9XFVO7
         W7uQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3XhMzmjlQhLFt0MvZ4ks2rAkScJpJu86oA9fnbasmHsZCcy9CDW3A6ncRH24QwM5ZuHAaDQOEBFY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyMTolLkQnMyK1qeavkWJctGlVWX5dhmqHWCXvG/N7zVbwiiLiY
	vcv1obwWqzCTdUEKa9ZdjsgzY5WG9xur9iu55qD0JKBljGUmMFihLpjjCfgUQOhzCw==
X-Gm-Gg: AZuq6aJEQd6AoVcRGrPpOugwhyQhvV/CizkTk9kcLco7GF89r++YJnrpaSR+qXqhWP4
	xM5n6rjtZjvWFvTT+w3GeUpz1GYdkd91mq5rDVwP2NTNlmvAnPZTLNyOGmhfATAAqkfX/yB9BkQ
	+Oxri3ik+cMmYcdvU3fFg4fgMNl7pkawY3ticMaZ1PjZFmCBCmyK4Dh5cUzwVYjlETBVhwBmebU
	aRKzmGHXSWT4pQbh0l45+ZwQXxZK62B/2Y1MaSwQPTp3SULNIHwCgIGvl7/rtONNfAHBusBqknc
	DAp70CcxBO1fgcGmpAjosenmY7H2LBzsfMEWeCsxtCxgi/DfY5C/qyFRO1/KKzP4OqJaAGYAZEq
	mpILKaZTBMG0+P7rFKBGovBuyx2OBfutWSUsA3yWFNxjpL11UMc2mSxPHxCMeSMv1swvCRySjE9
	qgUSYe7UKWQyDNeKmW5skiIBVjPXvQXi3lZjS2xIxdcpQV/VaPij3zwXVkUlpMlfApyFVQXjSsW
	jA=
X-Received: by 2002:a05:600c:8117:b0:47f:b737:5ce0 with SMTP id 5b1f17b1804b1-48069c5a468mr28270365e9.23.1769528682728;
        Tue, 27 Jan 2026 07:44:42 -0800 (PST)
Message-ID: <1c894d22-697f-4f96-90dc-4d0101fee7e4@suse.com>
Date: Tue, 27 Jan 2026 16:44:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/16] x86/amd: Probe for NX support and re-activate if
 possible
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julian Vetter <julian.vetter@vates.tech>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
 <20260126175345.2078371-13-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260126175345.2078371-13-andrew.cooper3@citrix.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid,citrix.com:email,vates.tech:email];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
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
X-Rspamd-Queue-Id: CF4F796FB9
X-Rspamd-Action: no action

On 26.01.2026 18:53, Andrew Cooper wrote:
> An AMD Ryzen system has been found with a firmware option to disable NX.  Like
> we do on Intel systems, try to detect and undo this stupidity.
> 
> Link: https://xcp-ng.org/forum/post/80714
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Julian Vetter <julian.vetter@vates.tech>
> CC: Teddy Astie <teddy.astie@vates.tech>
> 
> Somewhat RFC.  I don't particularly like the double handling of
> MSR_K8_EXT_FEATURE_MASK in this function, but I can't find any way of making
> the logic legible while trying to dedup the MSR accesses.

Looks reasonable to me as is. If later someone has a neat idea for de-duplication,
it can always be done incrementally.

> @@ -639,6 +640,40 @@ static void amd_early_adjust_cpuid_extd(void)
>              printk(XENLOG_INFO "CPU: Re-enabling disabled Topology Extensions Support\n");
>          }
>      }
> +
> +    /*
> +     * Probe for NX support if it appears to be unavailable.  All 64-bit
> +     * capable AMD CPUs support it, but some firmwares have an option to hide
> +     * it in CPUID, apparently for "feature parity" with Intel platforms.
> +     *
> +     * Unlike Intel, there's no active indication that this has been done.  A
> +     * conversation with AMD suggests that if we can set EFER.NXE, then NX
> +     * will work.  Use this as a heuristic to probe for support, coping with
> +     * the fact that a hypervisor might have really disabled and blocked NX,
> +     * and not emulate the mask MSRs either.
> +     */
> +    if ( !boot_cpu_has(X86_FEATURE_NX) )
> +    {
> +        uint64_t *this_efer = &this_cpu(efer);
> +
> +        if ( wrmsr_safe(MSR_EFER, *this_efer | EFER_NXE) == 0 )

Would you mind using ! here, just like you do ...

> +        {
> +            *this_efer |= EFER_NXE;
> +
> +            if ( !rdmsr_safe(MSR_K8_EXT_FEATURE_MASK, &val) )

... here?

> +            {
> +                val |= 1ULL << cpufeat_bit(X86_FEATURE_NX);
> +                wrmsr_safe(MSR_K8_EXT_FEATURE_MASK, val);
> +                val = rdmsr(MSR_K8_EXT_FEATURE_MASK);
> +                if ( val & (1ULL << cpufeat_bit(X86_FEATURE_NX)) )
> +                {
> +                    __set_bit(X86_FEATURE_NX, c->x86_capability);

Again this shouldn't be needed, as identify_cpu() takes care. Unless in this
case it matters for the time in between?

Jan

