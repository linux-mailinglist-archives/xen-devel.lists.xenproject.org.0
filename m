Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEAA9143F7
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 09:56:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746160.1153133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLeYv-0002pG-In; Mon, 24 Jun 2024 07:56:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746160.1153133; Mon, 24 Jun 2024 07:56:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLeYv-0002nr-Ey; Mon, 24 Jun 2024 07:56:29 +0000
Received: by outflank-mailman (input) for mailman id 746160;
 Mon, 24 Jun 2024 07:56:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wsRE=N2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sLeYu-0002Uz-Hw
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 07:56:28 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42271807-31ff-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 09:56:26 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ec3f875e68so45423481fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 00:56:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb5e166csm56580815ad.214.2024.06.24.00.56.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 00:56:25 -0700 (PDT)
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
X-Inumbo-ID: 42271807-31ff-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719215786; x=1719820586; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SXfjUaNlK4Pt9KYR1q+M5lgItmZhLaoA8CaGYZA+6sU=;
        b=U1BMH8Go3Bzqxtk81lKRaEQkFZojybhLSXAFELRlD6Ov7kGwkLlaB1NjJLp2qlX0Dw
         Ls120DpX3JAKxGzAWbpzGcOGX95HkmZ9+82+ccJzrJ6w1B3dIvmMH+8Q24QyFoeZhJQ1
         8jYApSGgINMFHZm1dxlTCDR0juUJch6Le8S9tKTGuJI0/uTycDCqNslndKLJyXjVfimR
         rbybjxcvS79NWwThT7PU8ObcOmp2Ck7Z0Qhpkv6aqkC5xqsQ05k52hglDIndug56sE3Z
         jh4sw21DYmZx0ERTtYX4NKdP7L9k6AKjxkJmJ2NPHzbuWsn3IF0zB/dHdaB7/L/jIi5L
         IByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719215786; x=1719820586;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXfjUaNlK4Pt9KYR1q+M5lgItmZhLaoA8CaGYZA+6sU=;
        b=DRcmTS0H+LW0MJi5lBpeZh+/JBGJX766emh4tgA/fIU2oF1l31P/aT6/MVXYpP+API
         LHIlz0Rha8EfbiPWX+6GVf3e7gcjBzz4NnrrptV0hDoZvPJtYApK9JF0gVX/hYAir30T
         Ee1PYxDny4RK0vgOGrIneZAWB6JqI6vNoT7yGfKnz9QcUxbFCxL3A8yTOUASDnwTB6/p
         oRinUOD5TmNeMiqsJF25vxhHhfemjQiHT92GmdDZRYAUqJ10nnrsmOHNn7lT4Rub9NBv
         fNZCg98W5arbokEdzNCEz2YnpRua+8utPtjN6XUy4n+6iz3tuuf7rOvF+o0trmY5AqLa
         DR0g==
X-Forwarded-Encrypted: i=1; AJvYcCVhRKOuONVwArGFgNyB+BzX08GxAfiDxAJfuPaattKBqbdli0uIubr2U1XBLD6Cgwmnof70b/p7l4t8eSrdGgIflNO7sl5KIjAl7UsffZM=
X-Gm-Message-State: AOJu0YwHpcBP/ozfibCOd8PGHy+ioGQ0yRVTaffvSvqxSjoOiTK5uKMe
	sdLTNdsoSJvBSc2Zsf7utOF8bwq/NF0xDNzg03Na1h16Samj3iG+uqzuR1JSPw==
X-Google-Smtp-Source: AGHT+IFnQoKdBmTNlFjhUqOfXmWyX5I8sdBrqGV+v53hEg6Dd0YIYmN2BA/ds3fLSgfWy4MdpyXfLQ==
X-Received: by 2002:a2e:9b55:0:b0:2eb:d9a3:2071 with SMTP id 38308e7fff4ca-2ec5b3e358dmr21166861fa.50.1719215786392;
        Mon, 24 Jun 2024 00:56:26 -0700 (PDT)
Message-ID: <660fc551-c6bc-456f-8e9e-80b3e592fece@suse.com>
Date: Mon, 24 Jun 2024 09:56:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/multicall: Change nr_calls to uniformly be
 unsigned long
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240621205800.329230-1-andrew.cooper3@citrix.com>
 <20240621205800.329230-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240621205800.329230-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.06.2024 22:58, Andrew Cooper wrote:
> Right now, the non-compat declaration and definition of do_multicall()
> differing types for the nr_calls parameter.
> 
> This is a MISRA rule 8.3 violation, but it's also time-bomb waiting for the
> first 128bit architecture (RISC-V looks as if it might get there first).
> 
> Worse, the type chosen here has a side effect of truncating the guest
> parameter, because Xen still doesn't have a clean hypercall ABI definition.
> 
> Switch uniformly to using unsigned long.

And re-raising all the same question again: Why not uniformly unsigned int?
Or uint32_t?

> This addresses the MISRA violation, and while it is a guest-visible ABI
> change, it's only in the corner case where the guest kernel passed a
> bogus-but-correct-when-truncated value.  I can't find any any users of
> mutilcall which pass a bad size to begin with, so this should have no
> practical effect on guests.
> 
> In fact, this brings the behaviour of multicalls more in line with the header
> description of how it behaves.

Which description? If you mean ...

> --- a/xen/include/public/xen.h
> +++ b/xen/include/public/xen.h
> @@ -623,7 +623,7 @@ DEFINE_XEN_GUEST_HANDLE(mmu_update_t);
>  /*
>   * ` enum neg_errnoval
>   * ` HYPERVISOR_multicall(multicall_entry_t call_list[],
> - * `                      uint32_t nr_calls);
> + * `                      unsigned long nr_calls);
>   *
>   * NB. The fields are logically the natural register size for this
>   * architecture. In cases where xen_ulong_t is larger than this then

... this comment here, note how is says "fields", i.e. talks about the
subsequent struct.

What you're doing is effectively an ABI change: All of the sudden the
upper bits of the incoming argument would be respected. Yes, it is
overwhelmingly likely that no-one would ever pass such a value. Yet
iirc on other similar hypercall handler adjustments in the past you
did raise a similar concern.

Jan

