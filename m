Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADDBA46372
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 15:47:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896778.1305529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnIgU-0000Ua-DT; Wed, 26 Feb 2025 14:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896778.1305529; Wed, 26 Feb 2025 14:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnIgU-0000SS-AK; Wed, 26 Feb 2025 14:46:50 +0000
Received: by outflank-mailman (input) for mailman id 896778;
 Wed, 26 Feb 2025 14:46:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnIgS-0000SM-Ma
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 14:46:48 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8142911d-f450-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 15:46:47 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-390dd3654aeso377224f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 06:46:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab2cb1063sm33812225e9.2.2025.02.26.06.46.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 06:46:45 -0800 (PST)
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
X-Inumbo-ID: 8142911d-f450-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740581207; x=1741186007; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=slBCSaOYME0SzLYpwhlehlNcgghQwY2vcUSLClG6HsM=;
        b=Oq9eKMMz5Vlx0NeMfwM8bFtSVEFOpuGCsL45yb3TKZ6wS/j2JNPP+AivoQCoWj3yzh
         N1AvOXwmcgaIxqzY3tiQBQ2OjKHqTSXMlPGORYFeM4syBKFBnW/OohMe9c4C0R9Qhag1
         6woWcjVu4pE5a+drApE4ClusR4ZOI15yqTczxkGu+Zo9d8+d5OPoGXrTxgCxAiiP2AjS
         eWqaD1eZuZk+mf2Sg+1ry0LMRgNIKHLl2aa126QxBMpHSBEhL7NTrVkbb1ue4suD5x1r
         bgP0jjpi58Xq2B+nlAMI575GlyK4Fgdm0THv2CdZYFUZzFumtC1R+CTwXy4MdpaO9rwf
         gJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740581207; x=1741186007;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slBCSaOYME0SzLYpwhlehlNcgghQwY2vcUSLClG6HsM=;
        b=YQTmEfrRNam55XTfH+pnZ7FSlnA5Sf4bMB0BIU0LrYJ2JZ5geOtraeKOIlXjeiikwU
         9zy2Y1M+kwCQDk5GmOeOvE8hhFW2aMnXag9bA+4fLbavcIkylOtfLg0j09h7y6lJDB9W
         t3kwuX2pcxIYdJx1Fzdll0cakR2n9H+jJsk4xIENLh7C+Y3bF4MMt8nobfovsazTR6eN
         BnjlPmL5n1m3h4YwFtSj6PDgTfJaw5CGrPyF9EWQwZ998QM3gs499NBoe/40FmMIlwW9
         uap+DLGphII1WJLzMMlHlAvmZ8o6Sus7oRIVrIXzXXazuA9ZvuLJ908S6pkAisVZhDSl
         N0CA==
X-Forwarded-Encrypted: i=1; AJvYcCW8cVgaGTxLdmpR5JPup8jyiHT+ijiP/qF3nkiBZhSgeCeTrzM7JlJTutF+/q2RPK6orvP8Ub8Ieg4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwnIWDObLH2Pez+sMyJaOP3f6HgA7ZnMxqTO8CD87jtFsvDvj2P
	BUgC7cvOttUb7eXCmWd4xSgM2wU49mMExtd2df4wh/BPXA0HLCENE7EZEURVXg==
X-Gm-Gg: ASbGncsNivPB9gJEq/+7VPT0TNCxCtCT+u5GjafVkB7x+H0ckDlEAQi37rQvCM0vqOE
	Q/WIqM2Ojj9ZSowFlv2TJHt7xDQoLYZViFhscTQ55MvRcG5j7zan+GfQpJeDg3sPzpLHOZjfTJI
	SuibM/baEMba2vQRZoX8DXAPiNmhOq+XFGhlNXnBHojsO5B4xbVsQmgVB7Q+aQXJQQsCpna6egb
	0p72fdTxLY0ztU80kSCz5qETLSLhXzfNn+Qg1P35iykd0G01PBQmQkw2BSx9iswgzECHCenvaiQ
	tLZWnQDNLpsLHBKxVz/SoUBFIidH4uJaeErbPt0zaBvFB3m4QysRFpUste86EabGZqROukX3uD3
	AwKA2vpII/7U=
X-Google-Smtp-Source: AGHT+IH1ky2quYdMrfcJ0JjbSBhaZ2ZjN47v9yMhvKX4vLG/qV310sTbe8afDhs6razrQJDFq4GhBw==
X-Received: by 2002:a5d:5f83:0:b0:38f:6697:af9c with SMTP id ffacd0b85a97d-390cc5f7049mr4988756f8f.6.1740581205495;
        Wed, 26 Feb 2025 06:46:45 -0800 (PST)
Message-ID: <4de478dc-fecf-4112-8e2b-a7f7a62344bd@suse.com>
Date: Wed, 26 Feb 2025 15:46:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/ucode: Drop the ucode=nmi option
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250225222905.1182374-1-andrew.cooper3@citrix.com>
 <20250225222905.1182374-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250225222905.1182374-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.02.2025 23:29, Andrew Cooper wrote:
> This option is active by default, and despite what the documentation suggests
> about choosing ucode=no-nmi, it only controls whether the primary threads move
> into NMI context.
> 
> Sibling threads unconditionally move into NMI context, which is confirmed by
> an in-code comment.
> 
> Not discussed is the fact that the BSP never enters NMI context, which works
> only by luck (AMD CPUs, where we reload on sibling threads too, has working
> in-core rendezvous and doesn't require NMI cover on the primary thread for
> safety).  This does want addressing, but requires more untangling first.
> 
> Overall, `ucode=no-nmi` is a misleading and pretty useless option.  Drop it,
> and simplify the two users.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> Despite the reasonably large diff in primary_thread_fn(), it's mostly just
> unindenting the block, and dropping the final call to primary_thread_work()
> which is made dead by this change.
> ---
>  docs/misc/xen-command-line.pandoc |  8 ++-----
>  xen/arch/x86/cpu/microcode/core.c | 38 +++++++++++--------------------
>  2 files changed, 15 insertions(+), 31 deletions(-)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 47674025249a..9702c36b8c39 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2721,10 +2721,10 @@ performance.
>     Alternatively, selecting `tsx=1` will re-enable TSX at the users own risk.
>  
>  ### ucode
> -> `= List of [ <integer>, scan=<bool>, nmi=<bool> ]`
> +> `= List of [ <integer>, scan=<bool ]`

With this (taking my comment on patch 1 into account as well) I think ...

> @@ -123,9 +120,7 @@ static int __init cf_check parse_ucode(const char *s)
>          if ( !ss )
>              ss = strchr(s, '\0');
>  
> -        if ( (val = parse_boolean("nmi", s, ss)) >= 0 )
> -            ucode_in_nmi = val;
> -        else if ( (val = parse_boolean("scan", s, ss)) >= 0 )
> +        if ( (val = parse_boolean("scan", s, ss)) >= 0 )
>          {
>              if ( ucode_mod_forced )
>                  printk(XENLOG_WARNING

... this function will want to transition back to what it was prior to
the addition of the sub-option, preferably adjusted to account for the
possibility of multiple "ucode=" on the command line, i.e. along the
lines of

    if ( !strncmp(s, "scan", 4) )
    {
        ucode_scan = 1;
        ucode_mod_idx = 0;
    }
    else
    {
        ucode_scan = 0;
        ucode_mod_idx = simple_strtol(s, &q, 0);
    }

That would then make patch 1 kind of unnecessary.
    
Jan

