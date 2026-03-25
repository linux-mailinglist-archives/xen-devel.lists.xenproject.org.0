Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBsjNN//w2lXvQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 16:31:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 424AF328064
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 16:31:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262630.1555063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5QCY-0004yn-Ud; Wed, 25 Mar 2026 15:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262630.1555063; Wed, 25 Mar 2026 15:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5QCY-0004wl-Rr; Wed, 25 Mar 2026 15:31:22 +0000
Received: by outflank-mailman (input) for mailman id 1262630;
 Wed, 25 Mar 2026 15:31:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5QCX-0004wf-KY
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 15:31:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5QCX-00DJL7-0C
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 16:31:21 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c3ffc2-bab6-0a2a0a5309dd-0a2a4502e030-26
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 16:31:20 +0100
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c3ffc8-63bb-0a2a45020019-d155802acc37-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 16:31:20 +0100
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-48540d21f7dso58142625e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 08:31:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4871665647csm23434115e9.12.2026.03.25.08.31.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2026 08:31:19 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774452680; x=1775057480; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z1PKMRpDzTliv2gbJ6J5rTaEcXgz20twQXnbHkvd9kI=;
        b=DB8TvHe7Wci/7LcGc8cn07dpOIQOewAUU1Wxf7xiYxSXdocOt9Su8HwCwXsFYSZfhF
         L4Uhsg22cAwB856RJ06X7K5pKk1ygQZqZ15KjEb2OxOMcf/MEtQUBeQtM6KGzrjN3s1M
         3xEml9cSLanneqx91NkRuYVPwXoe0pgHwguXLq6L4pP1+42Aej9VteSlGX2VtpkDapMh
         Ixh8cCrzmd0CTjoIUEReN/x6s9AwD5Jl8DYvSrDRUq0OD35z0RDsQva02KCUkJHc2lLy
         noRPUKzazPDoonG41iH2Dr3bhjazJEM6ye4zFJuHRVazX/0aMhjp+ck+rCd9AA8UDRsc
         1RKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774452680; x=1775057480;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1PKMRpDzTliv2gbJ6J5rTaEcXgz20twQXnbHkvd9kI=;
        b=gYatOghvZzvolOfpdXGLnZk1DeF0LLr4hNhiyT/zLwzRiX231FGqnOWAoZ33NnSU6P
         UIQMaPyS35+BOUvMN4xrEvi5nPz37bA0fQAGM8Q+f5hg3iTrvhiX35UELegKz6aMVmM9
         ZLvVEKAkX9Nb+mLNFlmVym3TLc+IRJVqdV9mz5IzC7L4y22hKS34GNg4d8JjV6rgKslt
         xIqIgUr+bBjePL8sjreivBF+3xG4Zf7u5tN1w9W/ShjBYKObUgo9NAZI/24Gik5QXORJ
         iXneLchLvqTfXKKyKqRq2memUcJafhqx4A45UKs09DCjh627HGyrplmteuOI5FYysXwR
         9x/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXoUpjZS6tUJ7TE/+TgMTcfpmwm56a975jCOP9wgSLId4SHc/CaqzBZlqJeOUrTFVCsHtJOMITvCRY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxqpMHerRS4Sg3sEKFiQdydDcjG2PB34SIbmrSEYOAnW5AjdleL
	SkGrMU0VFZOj1CrRx9mGMV5HDdBKWh7b4LAJuHsGvQGM3SstvNOyFm58ert8XgiE8Q==
X-Gm-Gg: ATEYQzwduOY0VkPFkz4TBf982Rsduhu0OIE5SLTqA45L6a6WA30e/If8Wb4zuiGIyys
	4DVUF56AdsatX4d2shAqHZgx2BRCMK7w+p4oxkJGmu7Df8tYeIuuNI5IRuMNYIyn2yPQ8SnSFy4
	AxnhiuyztuTAen8VCxevn7hvBe8W9VmVMofMmm08DP59cbiYwmnf/Im/gCWFk26W9X9KIJrZ3Pi
	eaFsQvm9+ihf24YPpuNNq1dw4eQXm52NFK0uvaca65vii3DGSW6TMn3LQJekyATq94YTFgj1ay5
	tUcOGEisPh0xl3GNXdot345vNxR2psPU0yxeglt0ijr502dWGR0K54gcGe6uNeMw0LWgDNLzkVg
	XkzO/9wMra8kxctsFgljJ18QWeJL3bmN9SNkPBI9zErFcqIORmlA7oJ/UIPr6Sp8Ny50hrtEy1c
	4KgZO8UlhcPlB1ILFS99XnNPoClMkluU5K085Q4OXvUp+wJDB10VDels2FEJLsSGqwH9cAIYbef
	6VUq0hbryyrfas=
X-Received: by 2002:a05:600c:8489:b0:485:5981:1423 with SMTP id 5b1f17b1804b1-48715fbfcc0mr58747455e9.3.1774452680145;
        Wed, 25 Mar 2026 08:31:20 -0700 (PDT)
Message-ID: <3cf55d51-1bbd-41d9-89c1-5ec4e53bc6be@suse.com>
Date: Wed, 25 Mar 2026 16:31:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] x86/efi: Add opt-out mechanism for BGRT
 preservation
To: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, sarkarsoumyajyoti23@gmail.com,
 xen-devel@lists.xenproject.org
References: <20260324123312.11076-1-soumyajyotisarkar23@gmail.com>
 <20260324123312.11076-4-soumyajyotisarkar23@gmail.com>
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
In-Reply-To: <20260324123312.11076-4-soumyajyotisarkar23@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1774452680-4169EDB8-C02FAEF3/0/0
X-purgate-type: clean
X-purgate-size: 1406
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,apertussolutions.com,invisiblethingslab.com,gmail.com,lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:soumyajyotisarkar23@gmail.com,m:andrew.cooper3@citrix.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:sarkarsoumyajyoti23@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 424AF328064
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24.03.2026 13:33, Soumyajyotii Ssarkar wrote:
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -897,6 +897,9 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle,
>          efi_arch_edid(gop_handle);
>      }
> 
> +    if ( cmdline && get_option(cmdline, "efi=no-bgrt") )
> +        opt_bgrt_disabled = true;

Had you updated docs/misc/xen-command-line.pandoc as necessary, it likely
would have occurred to you that it's not this simple.

"efi=" already is a known top-level option. Hence for one, its parsing
function (parse_efi_param()) needs updating to not choke on finding a
"no-bgrt" sub-option. And then combinations with other sub-options will
want to be permitted, e.g. "efi=no-rs,no-bgrt".

> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -170,6 +170,7 @@ static SIMPLE_TEXT_OUTPUT_INTERFACE *__initdata StdErr;
> 
>  static UINT32 __initdata mdesc_ver;
>  static bool __initdata map_bs;
> +static bool __initdata opt_bgrt_disabled = false;

Nit: No need for the initializer (as can be seen from the other two
variables in context).

I also consider the variable name problematic. The (sub-)option is "bgrt"
with its negative form "no-bgrt". We generally aim at having opt_<name>
match (in <name>) with the corresponding command line (sub)option. IOW I
think this wants to be opt_bgrt, initialized to true.

Jan

