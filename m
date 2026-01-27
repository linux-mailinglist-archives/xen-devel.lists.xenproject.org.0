Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4M4NKjXceGnbtgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 16:39:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D40696E61
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 16:39:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214975.1525228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkl9d-00081E-JD; Tue, 27 Jan 2026 15:38:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214975.1525228; Tue, 27 Jan 2026 15:38:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkl9d-0007zS-GP; Tue, 27 Jan 2026 15:38:57 +0000
Received: by outflank-mailman (input) for mailman id 1214975;
 Tue, 27 Jan 2026 15:38:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkl9b-0007zM-Vy
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 15:38:55 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48e5ef88-fb96-11f0-b15f-2bf370ae4941;
 Tue, 27 Jan 2026 16:38:53 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47ee301a06aso66633275e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jan 2026 07:38:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804d3fda30sm138784495e9.1.2026.01.27.07.38.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 07:38:53 -0800 (PST)
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
X-Inumbo-ID: 48e5ef88-fb96-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769528333; x=1770133133; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MwJXR8XvquumI/9h72Dz525DVMDvJUaf5Fto9urwqvk=;
        b=ETY+k9lBFhfWv5SJ1Gk8k2aeVgPpizSoW7z7Ia920T/apqpeA+NJsgc2ckEs73tVPm
         J6k8GV0uU+udh627G76rTvL0qCEchXdaMYhhi6saS0F1+/rmxZUwb3+vh2Q4QMCLOb20
         sKVhKnlSKR6pq37b/FpMwlMp9iOC/roO2NB2aXwj1gOp0nBe9NFdbGfze2wMMiOKe9JT
         dKSvUDY8YCJpj7BrD5DPNYnmNGHz+MiSMX5FjfyrUeYe6QQVICFvussy9YT8adQ039MN
         A8JK6eCcYsHZbLf1jo8+3mUez43tPK/ClbI409LQoMfX84Q440iFbpdddKhi6Dqz9gg5
         xTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769528333; x=1770133133;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MwJXR8XvquumI/9h72Dz525DVMDvJUaf5Fto9urwqvk=;
        b=VkFtkmumAk0jiso976Rj6rD9Q9tdDHwPigMSuxUFxq1IxqprirQ1TIhyaKpyISsBjS
         vDlNjKwukTdevU4pF47OcFhlsyCVe9yppyZdaBIhZ/xepcxJBHRHURvbAa0OXsBxQUC5
         0dA0ly0bnopeyuIp8SAZo01PKuNFfMwiBoppzr7AwUbDQSEQjsdlivl6wGRV+5pzvNAT
         akUtp/PdH7M10QETg5N04a217XGy7yaIM71UMzbikVKs+kG963so6kFDKIUX4Abzzp1i
         RY7tIoXspBEGEGZ8e3TsEds76LM2WP39tfyhP7O33H6iRPHGQ/4AeI6+Uy6AGOSsWM1K
         FQrA==
X-Forwarded-Encrypted: i=1; AJvYcCVGaNRkSke0hbBJKWO/wsYj5K7dGnCtp2JLZo5k4tnQ5XUMPkx2zNKcnVAD5SQ3Jvbiw+XMfTKdwaw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXJyGrNOsd13eIKcpirj+J48GRpEx513MYefEGpaopNOBgSbfl
	JSfyeZcG6rJPqfOvQzx9n63LFEMflxABL6wtN8lhCcthnYpIdw8BnrLg8Wt36f48FA==
X-Gm-Gg: AZuq6aLZuFwHZC6cuHDQ8+pdVTMCQcqabmN9Sui9OnCQIjkSb40vkS2vlBsUIyY3iq7
	z3ttS4jtb8Cs36bqxhfrC42bNNWWXm5CUBRBSXcd1F+FPU+mxYOL+ymY3IJYRcbQq62yMc04RmM
	ndQQ3oPVxZeXaQGm+5E+JbHdsIBv8WKKbIDjD2OvO1ljTrpsBbgXQnVA/4YNj/BkS/ZAJfRlqhz
	qTJ1YJ9F1pnQVE4M/4Cmkx1dp4Qnv1RlzlvHPTTX6YLmUMU5owZlzrEmTWeUuCHPYiafXC9lEU/
	SPG6L1cthmyJY6+D/5Rx/1/8tP9hF8vsl0Pp+PCXp9P1sjngH1oyM/TrXC8G8DnjopZ4KsPjXNG
	U+FSrkEeBFIQ0ZVS4ap/H1JnaKN/TfGt9Yjul02ahRoUEQrJd0bOZ243eR1zNVwDn5Gb3YYA4v3
	RFpxxO0NL00ccN3z9HAIZr+SXIEPWMb6gKiFwQ3vw1/oEiC824kvHyaP8lMhUD7pMMnA7bNUt/k
	HU=
X-Received: by 2002:a05:600d:8445:20b0:47d:3ffa:5f03 with SMTP id 5b1f17b1804b1-48069c54b8bmr23359115e9.21.1769528333264;
        Tue, 27 Jan 2026 07:38:53 -0800 (PST)
Message-ID: <617d4ded-7da2-4075-82c6-7be61d151a41@suse.com>
Date: Tue, 27 Jan 2026 16:38:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/16] x86/amd: Fix re-activation of TopoExt on Fam15h
 CPUs
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julian Vetter <julian.vetter@vates.tech>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
 <20260126175345.2078371-12-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260126175345.2078371-12-andrew.cooper3@citrix.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,citrix.com:email];
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
X-Rspamd-Queue-Id: 0D40696E61
X-Rspamd-Action: no action

On 26.01.2026 18:53, Andrew Cooper wrote:
> init_amd() tries to re-activate TOPOEXT on certain systems, but only after
> amd_init_levelling() has calculated the levelling defaults, meaning that the
> re-activation will be lost on the next context switch.
> 
> Move the logic into early_init_amd() so it takes effect before calculating the
> levelling defaults.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'm sorry, but as this is being moved and tidied some, I've got some remarks:

> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -620,9 +620,32 @@ void amd_process_freq(const struct cpuinfo_x86 *c,
>  		*low_mhz = amd_parse_freq(c->x86, lo);
>  }
>  
> +static void amd_early_adjust_cpuid_extd(void)

__init?

> +{
> +    struct cpuinfo_x86 *c = &boot_cpu_data;
> +    uint64_t val;
> +
> +    /* Re-enable TopologyExtensions if switched off by BIOS */
> +    if ( c->family == 0x15 && c->model >= 0x10 && c->model <= 0x1f &&

If this is done by BIOSes, why would it be constrained to a certain model
range of a certain family?

> +         !boot_cpu_has(X86_FEATURE_TOPOEXT) &&
> +         !rdmsr_safe(MSR_K8_EXT_FEATURE_MASK, &val) )
> +    {
> +        val |= 1ULL << 54;
> +        wrmsr_safe(MSR_K8_EXT_FEATURE_MASK, val);
> +        val = rdmsr(MSR_K8_EXT_FEATURE_MASK);
> +        if ( val & (1ULL << 54) )
> +        {
> +            __set_bit(X86_FEATURE_TOPOEXT, c->x86_capability);

This shouldn't be needed, as identify_cpu() will obtain the updated value
anyway.

Jan

