Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B5B947EFB
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 18:08:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772308.1182758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sb0Fg-0007IO-Ls; Mon, 05 Aug 2024 16:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772308.1182758; Mon, 05 Aug 2024 16:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sb0Fg-0007GQ-J1; Mon, 05 Aug 2024 16:08:04 +0000
Received: by outflank-mailman (input) for mailman id 772308;
 Mon, 05 Aug 2024 16:08:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I4ub=PE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sb0Ff-0007GK-Mb
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 16:08:03 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e45d98f3-5344-11ef-bc03-fd08da9f4363;
 Mon, 05 Aug 2024 18:08:02 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a7ac469e4c4so987526766b.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Aug 2024 09:08:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc96c8b49sm465315166b.0.2024.08.05.09.08.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Aug 2024 09:08:01 -0700 (PDT)
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
X-Inumbo-ID: e45d98f3-5344-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722874082; x=1723478882; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9BeLD2yw9ngxAoRu/G9OxnIu35gemIMBK0FkFDCdWeE=;
        b=U5epyj7GIdkz90GPvu0m0mzcxRHOPg/ufM3KdhsGXoelAGztW41KYhMcsQmcNk31ce
         F8l8pwLTd9cWKguCvsg/r+PeLmL4QRUae+5I5fddUMLEXNs0WEFknDcxHzi/jER5eMSV
         gwgUHl1V96jN8e9bB/ZSgHwvN2VH0DDCDAwj+EVDzeIXgfSjkSA2OD/etiYUMC39nffa
         25UKivBGZlyGKbmGJoCq/iUSYaoM7QbMmEg++dyDht9hN9AauW7L/iQMiYOqtZryjSWq
         /Zul1d76bgqsVs2BNLef8kDMiMs9roHvCPobhXnGHfdcdWDlrMlxcC/uPqTR0sbvITnf
         sOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722874082; x=1723478882;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9BeLD2yw9ngxAoRu/G9OxnIu35gemIMBK0FkFDCdWeE=;
        b=tsQD8hFAZl3KEEcj8t+VLGlvsEQOaCv1dSdp3/cqR8lDFbjgN9JKfRRd38YWONQgUm
         hDnzQMPLPjK/E8c7i5DjpCZf7tC+nWKW8+MU8lJOJsrG4RxAzjLmuK6K0uKN1tCzlD6K
         8Yctdp2uCsPcvwgGO7Hk3CzbjzYS1cggcIBR8p/LcsSHU7kM7vEDN0uub00RVGAWJsyI
         Wf7Ndo1iR2c4bvH4nErTGqRdJU1LrArzmOveJBlfzodMpGgixHpvFJOMIFBnyj/0pEDK
         3CfKluvZYKnWOi5GbDxguV8REcbulY71gQjbrQeosadByh4hX2zNUOIxNco43rso+EOp
         PvYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUixuXJ/IdYmmsrPux9hWGzN6NWLMugbW5xb/BzSYuHun9XsyaFfar0D1m5gy9hDoimZtx9BpWrOUY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwL3kKE3ulk9Wl9n6WyNdY04zsFr0ujjt+7anIoF3Kftg3Jiaii
	Ex67etfFWTw0tEp7Y9Ev2Cpfp3sd4DuJJfc+eoAqsfoyqdRs87fY6NSdwMgosw==
X-Google-Smtp-Source: AGHT+IFioB2f2YKEN+6Pnqo4hgrKxU+KZGVoIoSjD0yYTI+w/zkAcZpv0S8ZB/dxwdEB7Oa4jKUUrw==
X-Received: by 2002:a17:907:868d:b0:a77:cdae:6a59 with SMTP id a640c23a62f3a-a7dbe6302e4mr1144738466b.21.1722874082007;
        Mon, 05 Aug 2024 09:08:02 -0700 (PDT)
Message-ID: <d9440569-037e-4b8e-b092-250c5eb569bc@suse.com>
Date: Mon, 5 Aug 2024 18:08:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] x86/emul: Fix misaligned IO breakpoint behaviour in
 PV guests
To: Matthew Barnes <matthew.barnes@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <88d0c78e7fecac79d4ef958962c59836c966cc91.1722871218.git.matthew.barnes@cloud.com>
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
In-Reply-To: <88d0c78e7fecac79d4ef958962c59836c966cc91.1722871218.git.matthew.barnes@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.08.2024 17:36, Matthew Barnes wrote:
> When hardware breakpoints are configured on misaligned IO ports, the
> hardware will mask the addresses based on the breakpoint width during
> comparison.
> 
> For PV guests, misaligned IO breakpoints do not behave the same way, and
> therefore yield different results.
> 
> This patch tweaks the emulation of IO breakpoints for PV guests such
> that they reproduce the same behaviour as hardware.
> 
> Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>

No Fixes: tag?

> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -324,7 +324,7 @@ static unsigned int check_guest_io_breakpoint(struct vcpu *v,
>                                                unsigned int len)
>  {
>      unsigned int width, i, match = 0;
> -    unsigned long start;
> +    unsigned long start, debug_mask;
>  
>      if ( !v->arch.pv.dr7_emul || !(v->arch.pv.ctrlreg[4] & X86_CR4_DE) )
>          return 0;
> @@ -346,7 +346,9 @@ static unsigned int check_guest_io_breakpoint(struct vcpu *v,
>          case DR_LEN_8: width = 8; break;
>          }
>  
> -        if ( (start < (port + len)) && ((start + width) > port) )
> +        debug_mask = (~(width - 1u));

Maybe simply alter "start" directly:

        start &= ~(width - 1UL);

I've switched to making the resulting mask an unsigned long quantity at the
same time, as I don't think we ought to masking off the top 32 bits.

Then ...

> +        if ( ((start & debug_mask) < (port + len)) && (((start & debug_mask) + width) > port) )

... I also won't need to complain that this line now is too long.

Jan

