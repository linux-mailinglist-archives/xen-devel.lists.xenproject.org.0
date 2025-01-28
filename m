Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E84B1A20D42
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 16:43:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878578.1288758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcnjj-0002d4-OI; Tue, 28 Jan 2025 15:42:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878578.1288758; Tue, 28 Jan 2025 15:42:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcnjj-0002ak-Kz; Tue, 28 Jan 2025 15:42:47 +0000
Received: by outflank-mailman (input) for mailman id 878578;
 Tue, 28 Jan 2025 15:42:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcnji-0002ae-1u
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 15:42:46 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83c64039-dd8e-11ef-99a4-01e77a169b0f;
 Tue, 28 Jan 2025 16:42:43 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5dc59303334so799624a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 07:42:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab675e64da5sm809223366b.60.2025.01.28.07.42.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 07:42:42 -0800 (PST)
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
X-Inumbo-ID: 83c64039-dd8e-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738078963; x=1738683763; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s5pSSj0wM3yX7/gPtKL4tkphE0jVweOmLAcWGt19sdU=;
        b=Ac/ZevFOth9lC1wuZJsOi/Yrj71IwSlxXdP4kXoaVRc1FL7bJNLSlKdMvbZAACIIsl
         7VVhMEu5rHI7tqTmRvRE4h1wOO+rPXEw3M8tI1jDqIz5S0eJFsTG1Z/nd7jSO9fmXzhb
         FtGX9VZ0dw0vWEDtCPGdxzcRNwxApcy1HwSAmtgN8Iix+fY0pApac9lhOUwa74s23ZHf
         ukHd2DCvnOwpDoElFj22dzhI5chuOeH/smWKrTJ7lBqinQzvi7uMQL+u40JzeNz7Q29T
         sPL8spuxKvescsWr+ocOfqOgTwB8Wc0nle+yCcxoysru+9mLoEGdWRYpAU7GBy/+UqI7
         WU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738078963; x=1738683763;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5pSSj0wM3yX7/gPtKL4tkphE0jVweOmLAcWGt19sdU=;
        b=C8PxBhKmxFJKfsGEfxh3Q9LTnkXsBhl7C9gxvCQWAuo3UvZn/KICovAe+PMo++8JfA
         qw44bR4p7CEOk9pIaFc5DCHNZmXxPTDZsWifLihu352W2yD16eDneut5bpr3EeRh2y1w
         EayyLEiG3r7vS7f4oiwDVLYeA3whUlUKEkflfWZkJNj7hRSspyetudOAbKIRytu2CmWE
         yMfrYFwsUsRFqJ63rny2xBzXbZSBKM6qQSG/lrSkshvZ2J5UUpo17tF92zN5uLDH+ymc
         Eq7SoAPvwi5qK9bjFxLMo8SopDzS1xOpJHQ5seqX7VExLoKRIb1iEhr6xK65Qbhcr0DN
         kobg==
X-Forwarded-Encrypted: i=1; AJvYcCVlDrqW0Z8jcfU0ezBDTqAU1zdDAq8IMusl090c+p96xWb1dG+fhJjJnAZE35PUFBc30r/i1u9cIKQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyjGOp90I1wUorVHAgSHwdkovlH8pdoHDTbBYHlzKRNCBSaTm3V
	y4mG4Q1cFi9eb3x5E50MeNPgto/U0p/wBkG+f/03zUw1HFW45bIRSgeuAuSFFA==
X-Gm-Gg: ASbGnctJYtn2ixVqVh1d1+E/proLlYOJoN1tFKEgqDOIKWO1RuDhzj1Yy29G4Uh6Oqq
	tj6p/5i2vFaSlK4krS3ms6+NnmaxB4rfY1AQ9TYjfXcYu/kDp+UJVvXZTrS1ER8P/WiBK9IUTIb
	4ybZ41ALLmUGncSniBuUbU/S9LszgDjHgQ8OGNJQCPtHOn+XBAHviWCLT7Ml4glq85i3blUL0Kc
	TexRTwo3GpAMh66pRdxzO0Xr9nDgGnPImcrOHb29d0EIjf/pwFYeM3AaBmuQYxe7fnnDBIYhsj8
	8XLS3ESE8XWwrcc1/zgXNk7Idi+YseFt11YuJ9YmpPHOFIVVAZJ4a5fcqo+wCJPD3Tc6Mpc4Wev
	6
X-Google-Smtp-Source: AGHT+IGbos06quQHLqfttwBUEwjQoBT5bq0yr2kUkmyqBiO8znBfOnOkpkdhksSCXmuBfK9zMR33gA==
X-Received: by 2002:a17:906:79a:b0:ab3:a0ad:17a9 with SMTP id a640c23a62f3a-ab3a0ad203cmr3352381366b.24.1738078963301;
        Tue, 28 Jan 2025 07:42:43 -0800 (PST)
Message-ID: <eebf89e0-7df7-4628-8b0f-814531c4e47e@suse.com>
Date: Tue, 28 Jan 2025 16:42:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/24] xen/console: introduce console_{get,set}_owner()
To: dmukhin@ford.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
 <20250103-vuart-ns8250-v3-v1-12-c5d36b31d66c@ford.com>
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
In-Reply-To: <20250103-vuart-ns8250-v3-v1-12-c5d36b31d66c@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.01.2025 02:58, Denis Mukhin via B4 Relay wrote:
> +domid_t console_get_owner(void)
> +{
> +    return console_owner;
> +}
> +
> +/*
> + * Switch console input focus.
> + * Rotates input focus among Xen, dom0 and boot-time created domUs while
> + * skipping switching serial input to non existing domains.
> + */
> +static void console_switch_input(void)

I'm afraid I'm irritated now: In the earlier patch you said you renamed
console_rx to console_owner because that's not just about input. Yet
here you actively _add_ "input" to a comment that you've moved an re-
worded some.

> @@ -1149,8 +1144,8 @@ void __init console_endboot(void)
>      register_irq_keyhandler('G', &do_toggle_guest,
>                              "toggle host/guest log level adjustment", 0);
>  
> -    /* Serial input is directed to DOM0 by default. */
> -    console_switch_input();
> +    if ( opt_conswitch[1] != 'x' )
> +        console_set_owner( get_initial_domain_id() );

Nit: No blanks like this inside the parentheses of a function call,
please.

Jan

