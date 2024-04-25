Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 476E48B2027
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 13:25:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712026.1112404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzxEJ-000270-8y; Thu, 25 Apr 2024 11:25:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712026.1112404; Thu, 25 Apr 2024 11:25:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzxEJ-00025T-6D; Thu, 25 Apr 2024 11:25:31 +0000
Received: by outflank-mailman (input) for mailman id 712026;
 Thu, 25 Apr 2024 11:25:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzxEH-00025N-DA
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 11:25:29 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8466b283-02f6-11ef-909a-e314d9c70b13;
 Thu, 25 Apr 2024 13:25:28 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-349c4505058so598515f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 04:25:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e24-20020a5d5958000000b0034c0fefd7d2sm1303877wri.23.2024.04.25.04.25.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 04:25:27 -0700 (PDT)
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
X-Inumbo-ID: 8466b283-02f6-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714044328; x=1714649128; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bgmpc8+DwfmxtSdSueemKmUhrscLPJr+43GZFJilvlY=;
        b=Ttcgdb/myKZusqf8o/sIklzMbPEzkO+IL4j/TjE3IFb4GH7J1X+Sry/btUkZA5ZjOL
         PHH9kc6gSBK/lZk/gllIHOmuSJyqhVYRCXN8xLR6dfK+KSo4kcKZiMYbNYWoxIiA11CI
         xBJ/Umsxb4a41i5mlvL1LxP8a752WDET2u01HCtQfhcbFPdED7gpbxjuUPKPnEk6GIfU
         v9S4gbZCMmk3gilxzRT6nqh+tFOoDlqskf4+Iz2mJELjkK9Clmyrj5bcBJUghhH8bCcK
         3/sVEG+CwMRBIXxCGRsOs0fWRrytZMjV5V45BRs3aGRijZc5o7cDg2AWeIP009FPg5ks
         3zLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714044328; x=1714649128;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bgmpc8+DwfmxtSdSueemKmUhrscLPJr+43GZFJilvlY=;
        b=jQafiQDmNUeG+Bzf53SOkIVLjYyYP0UpJd8fEsP6FgBtWOgiTmANlLUgGQLKGjdV1e
         hzyPpifS6bBIuUUo6iB/aXI1UafMkGCE0Kd5WCfCDZtNFwrqyRRX+uj9mlOyDJk45ryf
         vXqKG3WxR7le7UcILvWoG+bDmKsStYZfUluuX8V+q0/XinmSjGlEBGkrzH+9cigDEIZ6
         /wATGzn6apiiIRUYY9LuPR2GZtD6ngI/ZQ/qL0CHottFUI8cgCC4XfturYkdCTqM14c0
         4aZ4U7Psy3UxhMZqVuznJGGiq/lwfa2AHiAl+6TjWQ7GQCdmKhrZajj/mqPQietnlDeB
         Kbug==
X-Forwarded-Encrypted: i=1; AJvYcCW+m1FQAnR9DqBoPq0LtegtqWgACeGJ87VfUso2k+8mpcYM9KLLCD2qi2ccRIrm0QBK9mT5O8pgITfm7HZFcjQ8AfGstwahi5fEMmOycgU=
X-Gm-Message-State: AOJu0YwRX+O3kL55Ibvjno4ZUR1w65OfTphpG3GePvpAhamiAqPIskdv
	4fidw4aYKK9BdjYJgGMz7IQAufrsEDcADKhFg7TVFx9I/trWnLkRd5IVQAgrkQ==
X-Google-Smtp-Source: AGHT+IFFgXF0/N+CIHtx4bAzSnnksLSSQij6neaSUU23fu1pjetsMN2WpctGvKSXgJr3W6U49C2mDA==
X-Received: by 2002:a05:6000:1a48:b0:347:70de:d3f5 with SMTP id t8-20020a0560001a4800b0034770ded3f5mr3580133wry.53.1714044327702;
        Thu, 25 Apr 2024 04:25:27 -0700 (PDT)
Message-ID: <72b6497e-1e1a-40e4-ba53-1120396214f6@suse.com>
Date: Thu, 25 Apr 2024 13:25:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] x86/msi: Extend per-domain/device warning
 mechanism
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.afa2d89161590f5193dd6bfd340c5e9347877aae.1710342968.git-series.marmarek@invisiblethingslab.com>
 <ec68ca290a207a3e191e470fb19254b7f6f887f8.1710342968.git-series.marmarek@invisiblethingslab.com>
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
In-Reply-To: <ec68ca290a207a3e191e470fb19254b7f6f887f8.1710342968.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.03.2024 16:16, Marek Marczykowski-Górecki wrote:
> The arch_msix struct had a single "warned" field with a domid for which
> warning was issued. Upcoming patch will need similar mechanism for few
> more warnings, so change it to save a bit field of issued warnings.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> Should I add also some helper for the boilerplate the handling requires
> now? I tried some macro that also sets the bit field, but I couldn't get
> it working. I guess I could make it working with a bitmask in a single
> uint8_t - would that be preferred?

Without you providing some hint as to where the problem was, it's hard to
see why something like this couldn't work:

#define MSIX_CHECK_WARN(msix, domid, which) ({ \
    if ( (msix)->warned_domid != (domid) ) \
    { \
        (msix)->warned_domid = (domid); \
        (msix)->warned_kind.all = 0; \
    } \
    (msix)->warned_kind.which ? false : ((msix)->warned_kind.which = true); \
})

> --- a/xen/arch/x86/include/asm/msi.h
> +++ b/xen/arch/x86/include/asm/msi.h
> @@ -217,7 +217,13 @@ struct arch_msix {
>      int table_idx[MAX_MSIX_TABLE_PAGES];
>      spinlock_t table_lock;
>      bool host_maskall, guest_maskall;
> -    domid_t warned;
> +    domid_t warned_domid;
> +    union {
> +        uint8_t all;
> +        struct {
> +            bool maskall                   : 1;
> +        } u;

No need for giving this struct a name, I don't think.

Jan

