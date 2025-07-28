Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A71F7B13CEA
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 16:21:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061626.1427230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugOjO-0002xP-Se; Mon, 28 Jul 2025 14:21:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061626.1427230; Mon, 28 Jul 2025 14:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugOjO-0002vt-PM; Mon, 28 Jul 2025 14:21:34 +0000
Received: by outflank-mailman (input) for mailman id 1061626;
 Mon, 28 Jul 2025 14:21:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ScRH=2J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugOjN-0002u8-Ri
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 14:21:33 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28814a30-6bbe-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 16:21:31 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-451d54214adso29068585e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 07:21:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76408c023absm5728044b3a.38.2025.07.28.07.21.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 07:21:30 -0700 (PDT)
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
X-Inumbo-ID: 28814a30-6bbe-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753712491; x=1754317291; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lYIjEX+MBzdtLGoYhZMBM1WM3fS5tlkBRgT15Psn4Kw=;
        b=E4SZ6Gxt9ZJyIKHD1vrMcGKuWpiWBzXDBlwnIZVwsjGhISUyDFxUhqmhNBCQeqsN41
         Pgx4xXVe3QdPNOtc+6ynCfdzBYQPTaLvsYj42ohliseLC7Tsu1oYB3thkQEMio03DcFL
         Peh0KxPkNIVRrvlIhxcpknQMkEiA4sc03IVYatYmiH2WOUGou6yImnVn0R0K7eLUMoI/
         2IZsQn8Hvh++o5mgqTBbam956wWOeEzW6SGRpK5Ca49kn/Kyv8Bs6pB0neCIffvMetwL
         eFOV5Fzz1iF5Oy8cS5619YrHMPq0BfcAOWrN8qvLKG/Ouh5M8P7aoKUO8Bt9fXoswqeR
         Ldxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753712491; x=1754317291;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYIjEX+MBzdtLGoYhZMBM1WM3fS5tlkBRgT15Psn4Kw=;
        b=ekHKF3mjBvNzD2xpsGCpq1fZ8jTbeiyrK7JiHiPUyoG3rRGzTgTtHzFlbroIFxRL+B
         XOykjR9iSzXKx3w8Pw1wl+3NIq2lhkygw+eDQ6YLRBKNbIlHhSJM6rlRMN/PoTHyuRop
         1fZ6nOsNJDi3GQgyd3P0R9wBG/a5DHS1WFezAs6wRjFGJWSvif7M4VgDbPt6wCtTQFMD
         ufTR/+DqO9CiWVKk6LA4Y0lkUgYklRtwLYObiP1jdRnA+bRNYIkeXFod84IGExqrrCe0
         WVJwpwuOkd+4jcGeYfcHtH/oLwzIrrzUVOdTUFV8qgQpekgfX1rzhV+Rh66z6Jlas9Bg
         SRqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbe5JlaAk4eXqyaoc40zKnv0EPjxnV2s5S2tLHEQjBoPPCzLUEV2Xf9v/DEMaR1+QDsgFvgxjDUeM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz22TDoTCtXm/XWNLxwN7YMKrnsZCGhranh5x/+nTNaZs5hpUaK
	ngByky5enDSuAxDr4UCPWT8v0vX/rjuL6W8aS81w5bfouTUiemLSHZE4UZE7gbI/sg==
X-Gm-Gg: ASbGncvAZwwwrcCzMBRoJFL+mct0FCK3/vAVkxLZLocwu0CpbKAQr4SVDo39Sc/6ucq
	YSA5sRWX3YpQymqocCuCVms/VRhoU7O/nTmjvOIEmgHuQv+P6IHEa6YVASdjXYORJVfyqdJ2dSi
	l88tkMUcrqb9QCTTb4ozOiICCWEuyCiCJgvAUkEc390O8crEtIhRvo+8dXCapR3zLIme+0LtUxn
	dMkmOeRJ/h4ll/lfaH3OjruDBhDS/S4vmPk9/vMtgK2tpyXQDdncrVyFJ0x74IYfsbZbxJ7qXrX
	VOTD2b9zJuHJoCfZoGMuLtjV5o+8ibJQqPRG00+D0yIXU2XDsiv3qjMz/0ik4nAb8c0DP3ZM5pr
	GGHRZEC649FxOv+tzP542F/QXR7kqXtxCpwtgwskI/SrWeY5MSW0cg8VU1Gk+MR5aPjI74wqP3U
	Iat9v1c+c=
X-Google-Smtp-Source: AGHT+IHPMNrua+8enMeQI7WALwWkoxVxMsZJJcULdk0R1b+HytsTPIeawBi4yypMhWPuuvatNSIIAg==
X-Received: by 2002:a05:6000:2083:b0:3b7:662a:b835 with SMTP id ffacd0b85a97d-3b77671d144mr8571486f8f.6.1753712491080;
        Mon, 28 Jul 2025 07:21:31 -0700 (PDT)
Message-ID: <d3934ed6-09c5-4bd1-b7a2-fb3f5725d0dd@suse.com>
Date: Mon, 28 Jul 2025 16:21:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 2/2] x86: don't use a memory page for mapping the
 shared info page
To: Juergen Gross <jgross@suse.com>
Cc: samuel.thibault@ens-lyon.org, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
References: <20250708063738.18994-1-jgross@suse.com>
 <20250708063738.18994-3-jgross@suse.com>
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
In-Reply-To: <20250708063738.18994-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.07.2025 08:37, Juergen Gross wrote:
> --- a/hypervisor.c
> +++ b/hypervisor.c
> @@ -27,8 +27,10 @@
>  
>  #include <mini-os/os.h>
>  #include <mini-os/lib.h>
> +#include <mini-os/e820.h>
>  #include <mini-os/hypervisor.h>
>  #include <mini-os/events.h>
> +#include <mini-os/mm.h>
>  #include <xen/memory.h>
>  
>  EXPORT_SYMBOL(hypercall_page);
> @@ -37,7 +39,8 @@ EXPORT_SYMBOL(hypercall_page);
>      ((sh)->evtchn_pending[idx] & ~(sh)->evtchn_mask[idx])
>  
>  #ifndef CONFIG_PARAVIRT
> -extern shared_info_t shared_info;
> +static unsigned long shinfo_pfn;
> +static unsigned long shinfo_va;
>  
>  int hvm_get_parameter(int idx, uint64_t *value)
>  {
> @@ -69,14 +72,16 @@ shared_info_t *map_shared_info(void)
>  {
>      struct xen_add_to_physmap xatp;
>  
> +    shinfo_pfn = e820_get_reserved_pfns(1);
>      xatp.domid = DOMID_SELF;
>      xatp.idx = 0;
>      xatp.space = XENMAPSPACE_shared_info;
> -    xatp.gpfn = virt_to_pfn(&shared_info);
> +    xatp.gpfn = shinfo_pfn;
>      if ( HYPERVISOR_memory_op(XENMEM_add_to_physmap, &xatp) != 0 )
>          BUG();
> +    shinfo_va = map_frame_virt(shinfo_pfn);

In the PV variant you first check whether you already have a VA. Why is
that needed there, but not here? (Originally I meant to ask why you don't
use map_frame_virt() there as well.)

Talking of map_frame_virt() - I take it its 2nd parameter being named
"mfn" is kind of stale (pre-dating the addition of PVH support)?

> @@ -84,9 +89,11 @@ void unmap_shared_info(void)
>      struct xen_remove_from_physmap xrtp;
>  
>      xrtp.domid = DOMID_SELF;
> -    xrtp.gpfn = virt_to_pfn(&shared_info);
> +    xrtp.gpfn = shinfo_pfn;
>      if ( HYPERVISOR_memory_op(XENMEM_remove_from_physmap, &xrtp) != 0 )
>          BUG();
> +    unmap_frames(shinfo_va, 1);

Better do this ahead of the hypercall?

Jan

