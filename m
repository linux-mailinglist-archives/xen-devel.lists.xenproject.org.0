Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A688C13E5A
	for <lists+xen-devel@lfdr.de>; Tue, 28 Oct 2025 10:48:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152049.1482588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDgIW-0001BI-EH; Tue, 28 Oct 2025 09:47:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152049.1482588; Tue, 28 Oct 2025 09:47:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDgIW-00019C-BW; Tue, 28 Oct 2025 09:47:24 +0000
Received: by outflank-mailman (input) for mailman id 1152049;
 Tue, 28 Oct 2025 09:47:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LPue=5F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vDgIU-000196-LF
 for xen-devel@lists.xenproject.org; Tue, 28 Oct 2025 09:47:22 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1934c917-b3e3-11f0-9d16-b5c5bf9af7f9;
 Tue, 28 Oct 2025 10:47:21 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4710683a644so47954355e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Oct 2025 02:47:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47718493c61sm16768165e9.4.2025.10.28.02.47.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 02:47:20 -0700 (PDT)
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
X-Inumbo-ID: 1934c917-b3e3-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761644840; x=1762249640; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PcyigqMKRdi3qJxHJpbteoLb+W7d21/QCOkk2Rkxadg=;
        b=FEcTsmBZpSyKYnA09CqOpAEQ+3ygBEAiiVc30wsYf3x3cLIFOV1l7f+4su+Wx6+HGd
         xcOrDfxrAYPpn1FYBUdsKC7F44JdI9XbuI7MgzGZVpdG/PoPF99I71hao5oJBCV7ZYhb
         RUjjLT5uJPRalguuMPlQvqMQYouW8MUxQtztR78x+dGPtbiDfq2vLJnoafY9hiDl2Btj
         J04oCRjb651eWvWLZ13JqtFJXCvqDucZZsr1KPlTeCHfQVUH2zBVwbDdPodLtYegCOhT
         0KRPAa8iKE5XDh1Ln4OP+y8ZjIMBDnRI5AyGNcQnvjwF2B3U9l2aDQR3Gy1kfzhpCGbO
         iAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761644840; x=1762249640;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcyigqMKRdi3qJxHJpbteoLb+W7d21/QCOkk2Rkxadg=;
        b=wWQvN4tOcalTLcwy7vHDf0YGbaqud5s+9amWyPGDEONMHMw4RBsDIZs0CyWAT6WWHv
         cMtyJP7cJmB4TEmsKKGu0pv0rUxPtycfOuXMpvRxXlF9n9/Na7f6PC1yM1V+qTi5BU5B
         NJ0MsvW+Qpp0JfwbjcbDKkWVFQWiVjxHFG+KV3+5J7J8pxWwcSnvRuKNDeihLuuS4LBi
         ofse/xKmOtiSOZwn4i6B0MCjaVCA8FCvYfWAbFU+mAG12g1i+2t1Gyyg6S37m8YQthNq
         EKbdFB9FEbtYIWwXzvZWgjcVMEU1RQGNQwpW1xy7JGxRd6vvYt2Vu2r2nu88lBy65HLT
         eZvg==
X-Forwarded-Encrypted: i=1; AJvYcCXUaKMz8OmCEVHloAw89iPYLqgdOOYbxqjmab7A0/lKyYzJT2ipdYQLfN+Mf+Ao8Fh5Nsuk8RiheSE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyMTgKdW5Y2IAEOXNa/Axp2f3Q+MdE4UfvMUp75NxbtDtiwgZFZ
	viH1boPMtXlVEpFYSFLmarw+3eRB/ELL/rmToMMiMfNDyCLSYCUDQg5sHCQdKGG1pQ==
X-Gm-Gg: ASbGncttz0J1kpdsihEH+K1cYJUF3cNXQ3iIlPlcPrzgF8B1/u9Th4CzpH3pFJH4Hdl
	y8MYh0uq2J3HsrJIU1DGcWwuTKr/8tmYlkuvlPzKx7UsXxL9rlqQ58GGmaQQV5/sqGRONsnrNVJ
	kYEHITWsoi1QO4TrQVudByz/b9zlZoLLxQ1N4ZDcd8vrF78KAj5qWQ+lGUT5nhZBQ7PixqWiuty
	RaajG96iC8JJYD1uvSdxrgo9u/Kw2b8ekBCDUiCwrJL58WonNLoI7FQ50l/VE7ifV8xYMTwp53l
	zFr1GIvPw+T7ZTPhxNjH25xluFuR6mvNnYF9zynskN4AXWc9mJP5YwMqQ0G0og+evMmuw6LpazL
	Kpu6zb4FWgASrsNQUxQqweZctlskLwNhv5v5QzxGEL03CKVzmjSaxEiQDJxoggNWzniKu/ycgln
	Xp/zbUNR6f04huTeDdS4cmEnLkFRZ5jpJ6QwSe2U+DRp0EqGAfmtw4yapnRbi3pnm5o/MTcLo=
X-Google-Smtp-Source: AGHT+IEU6PttUnosivv5CdThcdlo6R/maDMVQjvMqevSXFE9DwzoXkUCHVFygS1y5M1PUTfB/olK+w==
X-Received: by 2002:a05:600c:8595:b0:475:d278:1ab8 with SMTP id 5b1f17b1804b1-477180f3b38mr14932755e9.2.1761644840517;
        Tue, 28 Oct 2025 02:47:20 -0700 (PDT)
Message-ID: <61fcf602-4a4f-4936-a346-a650115e838d@suse.com>
Date: Tue, 28 Oct 2025 10:47:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] x86/ucode: Relax digest check when Entrysign is
 fixed in firmware
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251027221702.3362552-1-andrew.cooper3@citrix.com>
 <20251027221702.3362552-6-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251027221702.3362552-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.10.2025 23:17, Andrew Cooper wrote:
> When Entrysign has been mitigated in firwmare, it is believed to be safe to
> rely on the CPU patchloader again.  This avoids us needing to maintain the
> digest table for all new microcode indefinitely.
> 
> Relax the digest check when firmware looks to be up to date, and leave behind
> a clear message when not.
> 
> This is best-effort only.  If a malicious microcode has been loaded prior to
> Xen running, then all bets are off.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Like for patch 4, adjustments for Zen6 are then going to be needed here too,
aiui. May be worth repeating that statement here.

> @@ -603,3 +604,82 @@ static void __init __constructor test_digests_sorted(void)
>      }
>  }
>  #endif /* CONFIG_SELF_TESTS */
> +
> +/*
> + * The Entrysign vulnerability affects all Zen1 thru Zen5 CPUs.  Firmware
> + * fixes were produced from Nov 2024.  Zen3 thru Zen5 can continue to take
> + * OS-loadable microcode updates using a new signature scheme, as long as
> + * firmware has been updated first.
> + */
> +void __init amd_check_entrysign(void)
> +{
> +    unsigned int curr_rev;
> +    uint8_t fixed_rev;
> +
> +    if ( boot_cpu_data.vendor != X86_VENDOR_AMD ||

Given the function name, might this check better live at the call site?

> +         boot_cpu_data.family < 0x17 ||
> +         boot_cpu_data.family > 0x1a )
> +        return;
> +
> +    /*
> +     * Table taken from Linux, which is the only known source of information
> +     * about client revisions.  Note, Linux expresses "last-vulnerable-rev"
> +     * while Xen wants "first-fixed-rev".
> +     */
> +    curr_rev = this_cpu(cpu_sig).rev;
> +    switch ( curr_rev >> 8 )
> +    {
> +    case 0x080012: fixed_rev = 0x78; break;
> +    case 0x080082: fixed_rev = 0x10; break;
> +    case 0x083010: fixed_rev = 0x7d; break;
> +    case 0x086001: fixed_rev = 0x0f; break;
> +    case 0x086081: fixed_rev = 0x09; break;
> +    case 0x087010: fixed_rev = 0x35; break;
> +    case 0x08a000: fixed_rev = 0x0b; break;
> +    case 0x0a0010: fixed_rev = 0x7b; break;
> +    case 0x0a0011: fixed_rev = 0xdb; break;
> +    case 0x0a0012: fixed_rev = 0x44; break;
> +    case 0x0a0082: fixed_rev = 0x0f; break;
> +    case 0x0a1011: fixed_rev = 0x54; break;
> +    case 0x0a1012: fixed_rev = 0x4f; break;
> +    case 0x0a1081: fixed_rev = 0x0a; break;
> +    case 0x0a2010: fixed_rev = 0x30; break;
> +    case 0x0a2012: fixed_rev = 0x13; break;
> +    case 0x0a4041: fixed_rev = 0x0a; break;
> +    case 0x0a5000: fixed_rev = 0x14; break;
> +    case 0x0a6012: fixed_rev = 0x0b; break;
> +    case 0x0a7041: fixed_rev = 0x0a; break;
> +    case 0x0a7052: fixed_rev = 0x09; break;
> +    case 0x0a7080: fixed_rev = 0x0a; break;
> +    case 0x0a70c0: fixed_rev = 0x0a; break;
> +    case 0x0aa001: fixed_rev = 0x17; break;
> +    case 0x0aa002: fixed_rev = 0x19; break;
> +    case 0x0b0021: fixed_rev = 0x47; break;
> +    case 0x0b1010: fixed_rev = 0x47; break;
> +    case 0x0b2040: fixed_rev = 0x32; break;
> +    case 0x0b4040: fixed_rev = 0x32; break;
> +    case 0x0b6000: fixed_rev = 0x32; break;
> +    case 0x0b7000: fixed_rev = 0x32; break;

Acked-by: Jan Beulich <jbeulich@suse.com>
(after cross checking with up-to-date Linux, i.e. including your recent
correction there)

Jan

