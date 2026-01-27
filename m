Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHoQL0jheGkGtwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 17:01:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA0697491
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 17:01:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215050.1525297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vklUe-0007Uz-OU; Tue, 27 Jan 2026 16:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215050.1525297; Tue, 27 Jan 2026 16:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vklUe-0007Sl-Li; Tue, 27 Jan 2026 16:00:40 +0000
Received: by outflank-mailman (input) for mailman id 1215050;
 Tue, 27 Jan 2026 16:00:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vklUd-0007Sf-Vq
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 16:00:39 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52755ef6-fb99-11f0-b15f-2bf370ae4941;
 Tue, 27 Jan 2026 17:00:38 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47ee76e8656so85685785e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jan 2026 08:00:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806ce4c3c6sm1099035e9.10.2026.01.27.08.00.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 08:00:37 -0800 (PST)
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
X-Inumbo-ID: 52755ef6-fb99-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769529638; x=1770134438; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GI6kJDuUgp3VEgDjX+Jq2NfFYB6eKRLZZ6CTc5DhEpE=;
        b=MXVhd3g6fZC4PpIM1p3qRRPAVG5IybOaODyvt5FmxlcJexc77x545OaJ8ncjR+Odwp
         G9ad9vFnNHuGbUW5FzobAoCSq43s28KYqFpACg7i7i41E82MEVPAZaLlwsdexIXs4uyB
         WPTvRmFryOFqaXfyRBJLlvnaQg76ASYPzNKKQeYmPwvgO86SlULgHgmbnI69VB4uVf20
         9Vzad71bRKhmtaaBd0nIYdtASpLm8HDXXY7cmdiBwXHWiiIfqxDyVi5PhOn3hZVm8YuO
         HMmzTofW6IcXIzwAfnnG26qm770MIXS+IEJa0lq2eX9Y/dQO3vGGW76c5nctdWvJMlwW
         uYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769529638; x=1770134438;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GI6kJDuUgp3VEgDjX+Jq2NfFYB6eKRLZZ6CTc5DhEpE=;
        b=BcXVKYnWfFzf0AQLTODemuVy8P7cZhQC0t6xX5HQTeo1YQyJeSERd/DNmpFujk+NmN
         uhWkXGlgQIduCAEr6rMfD4GvunNss3POLyXKeLxTXkiFy/spPGFrpsGCc/eqBXo2+lEt
         6/dXECDzJcIgMPL5FCZkBiBOgy+FR+e+YbHU4+KyNxRSLmR7SHMrYwEUutNrjL/h3xLo
         +tWcWYNjWetmFUhMw3Topvq56Uqq/YWMSktS1EvlBveMhIztupWW0UuoI9GbrYDaeGUw
         R1fDlFM5nqURoL4653hblT2gHt3JAigcOhl8gVQjARdWaeJnPv7WDs1PuFJ2R2yP6+SN
         TBYg==
X-Forwarded-Encrypted: i=1; AJvYcCWBJP0svsah9VvKolXHMrNndm92o85AWA0tId9Eonr4QZe09rmnjefIzDw/EhCgQ22cEJnKNIJxw0I=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5gzcoytKtrk3j1gYW65YcnMsERPEFSbX+BT809XsJIiC3whY8
	q03El3Fzsy5ffpl0NNsOFUonhZIZqGUpQFExSGBQpFQEResdiLHy07WT9y4a4odUJw==
X-Gm-Gg: AZuq6aKI4SKQqooZ3ndJ6+Ar5o6md9WhcTLg+c5i2BDV2zTU+TNUakOO5N3IPVc6OXX
	UpUfORu7VlaRuZqVoPcpuJ6ygCRoAdCt+bhey0CwAigN+aaYu1dlgCRWnteiiwUU+eD1M6t0wVP
	WREoKivmuZJMv4de0SFVJy5aYp39B9dZUYBML7uImLw/Rtd+LznzSQWrtqRxjqSu2c7H0P6ZLaY
	jSNdVdgm0A6WP8OE2V9tLo+cyzLhjg5tf/EkRcjaDRpvGTi8rt+vGYCZCNVpem/PIJynoF2FdEc
	VbnfbTEMdHyQuI2NImkInOE9leF8VyXZZ5h+J0drMf/nqLJ0z2mTckH+H8EOJ/PdeNI93fywQS4
	9K8WIs8BjgOVhfIrlFvHwlZKSbCl0x6AcToN4x3ZA7P0Ul2lWwY6dEVZL68AoeOarAGLBKdVb5v
	cB+G/4ktZzKxGrnNM6jZ74xBJGZiVAJZS/63U7orFGWvRL3lm8O4sjAcjg5cgQIxL2LVjOjFd3k
	Js=
X-Received: by 2002:a05:600c:1992:b0:477:79c7:8994 with SMTP id 5b1f17b1804b1-48069c789e8mr27507985e9.30.1769529637676;
        Tue, 27 Jan 2026 08:00:37 -0800 (PST)
Message-ID: <261128f5-1528-4a45-bded-8d18d6682a56@suse.com>
Date: Tue, 27 Jan 2026 17:00:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ucode: Support discrete modules being CPIO archives
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260127143456.2260369-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260127143456.2260369-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[cd.data:query timed out,suse.com:query timed out];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6BA0697491
X-Rspamd-Action: no action

On 27.01.2026 15:34, Andrew Cooper wrote:
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -760,6 +760,7 @@ static int __init early_microcode_load(struct boot_info *bi)
>      void *data = NULL;
>      size_t size;
>      struct microcode_patch *patch;
> +    struct cpio_data cd;
>      int idx = opt_mod_idx;
>      int rc;
>  
> @@ -776,7 +777,6 @@ static int __init early_microcode_load(struct boot_info *bi)
>          for ( idx = 0; idx < bi->nr_modules; ++idx )
>          {
>              const struct boot_module *bm = &bi->mods[idx];
> -            struct cpio_data cd;
>  
>              /* Search anything unclaimed or likely to be a CPIO archive. */
>              if ( bm->kind != BOOTMOD_UNKNOWN && bm->kind != BOOTMOD_RAMDISK )
> @@ -844,6 +844,18 @@ static int __init early_microcode_load(struct boot_info *bi)
>                     idx, size);
>              return -ENODEV;
>          }
> +
> +        /*
> +         * If this blob appears to be a CPIO archive, try interpreting it as
> +         * one.  Otherwise treat it as a raw vendor blob.
> +         */
> +        cd = find_cpio_data(ucode_ops.cpio_path, data, size);
> +        if ( cd.data )
> +        {
> +            data = cd.data;
> +            size = cd.size;
> +        }
> +
>          goto found;
>      }

Doesn't microcode_init_cache() then need similar adjustment?

Jan

