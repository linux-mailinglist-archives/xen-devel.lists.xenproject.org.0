Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A977495EAE3
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2024 09:52:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783347.1192666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siUW0-0007nP-CS; Mon, 26 Aug 2024 07:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783347.1192666; Mon, 26 Aug 2024 07:51:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siUW0-0007kK-9o; Mon, 26 Aug 2024 07:51:52 +0000
Received: by outflank-mailman (input) for mailman id 783347;
 Mon, 26 Aug 2024 07:51:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SW9P=PZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1siUVz-0007kE-6A
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2024 07:51:51 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c278cbe-6380-11ef-8776-851b0ebba9a2;
 Mon, 26 Aug 2024 09:51:48 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5bf068aebe5so5180120a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Aug 2024 00:51:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c04a3ca46esm5283301a12.27.2024.08.26.00.51.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Aug 2024 00:51:47 -0700 (PDT)
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
X-Inumbo-ID: 0c278cbe-6380-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724658708; x=1725263508; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nQfTusO5nJzIzPnXsNYpcFkmNaNtLqVSB2phx596pB4=;
        b=Gxdsk4xMXHM+5bK7SF120ZMr0k9o6UiSAml0Xwnq/ZkMTPXKkUDJ8Xg43TMyozIVu9
         QaqLO6BAo3CgCid7KoeiQzAk5sRa6YVh/YgncA3EAHb6rnmKkmozkHHX/z81kBHcIJt3
         mip3WuPgPUyGJQ+Llny6/xXbbSrq25Joxr7vFq+jAk7UVKqBHuaIDm9AxwgX2+UWYZdb
         oTR6lvrqvfyUKfnYetBZ5mO61WyEbEzH9S/253a0B8uvwIVQ5G9se3kLNbGXtKQROfKS
         ZJQR/6GaHnMofPW0OvRrU28hStaegbI5iIl1VoT3WM3OzUQM5qT8RVLTv17hRzltnfox
         2k6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724658708; x=1725263508;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQfTusO5nJzIzPnXsNYpcFkmNaNtLqVSB2phx596pB4=;
        b=UoMF6d5a0LypjHNUMhjgA/fVl/i+14apteUPlb7Pz0fDGiEVE91cDYToXJHrQcOBRp
         BGfO3OzoOHXec2PnLLEwQEoVTS46XZ9oGCSa+CVV96l6dgPfwNajYxq9AM0OQMd/Toro
         6FzGQJ7IKBStqBjcMKo/TwD8oGUf+jrwIM6UY5QbnaCdiP7veCNzT0MV1QujeXFG/iJm
         2g/92ft894morqVFY3jtbZr7zW4x5nrKQbCXeoo9UF8QzVeSa9GDRVTvQKmTRtwppumo
         EBH9z1txq6oU/U58ASWrYz6c8UCN9I2umL0TtsBeHveOtf8N1rO4Snae6lw+PHfLO/Op
         m+Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUMaoiiOwBjcH0Bt3HB2s+OArQI+GYLO9DtQJe8f2MPeQu6gMGUZ1dlUGJUxg9vPePmlDWKksf9C2s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YycxxG+ZpkvL908WYnNKuJgQEd4jrXrPnDX3gyYRMTku+FDJIp2
	8pykTYmb/v1sFgBee5YANVUIZcTj9ujHia6HzWQKRw4j3KpnXpxRw1GV/9kfyA==
X-Google-Smtp-Source: AGHT+IHqv0vtX3UhnJ7kvoxjV8O0wKezYqzKW1wKn0TGgiB42nV7weu3oyi6JwbqGTrz5nglaP4IdQ==
X-Received: by 2002:a05:6402:5cd:b0:5c0:8ea7:3deb with SMTP id 4fb4d7f45d1cf-5c08ea73e93mr5512095a12.22.1724658707752;
        Mon, 26 Aug 2024 00:51:47 -0700 (PDT)
Message-ID: <0b49dff4-974a-4631-a403-bb5b0516d616@suse.com>
Date: Mon, 26 Aug 2024 09:51:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/boot: Preserve the value clobbered by the
 load-base calculation
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240823131029.1025984-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240823131029.1025984-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.08.2024 15:10, Andrew Cooper wrote:
> From: Frediano Ziglio <frediano.ziglio@cloud.com>
> 
> Right now, Xen clobbers the value at 0xffc when performing it's load-base
> calculation.  We've got plenty of free registers at this point, so the value
> can be preserved easily.
> 
> This fixes a real bug booting under Coreboot+SeaBIOS, where 0xffc happens to
> be the cbmem pointer (e.g. Coreboot's dmesg ring, among other things).
> 
> However, there's also a better choice of memory location to use than 0xffc, as
> all our supported boot protocols have a pointer to an info structure in %ebx.
> 
> Update the documentation to match.
> 
> Fixes: 1695e53851e5 ("x86/boot: Fix the boot time relocation calculations")
> Fixes: d96bb172e8c9 ("x86/entry: Early PVH boot code")
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with two nits:

> --- a/docs/hypervisor-guide/x86/how-xen-boots.rst
> +++ b/docs/hypervisor-guide/x86/how-xen-boots.rst
> @@ -96,6 +96,12 @@ Xen, once loaded into memory, identifies its position in order to relocate
>  system structures.  For 32bit entrypoints, this necessarily requires a call
>  instruction, and therefore a stack, but none of the ABIs provide one.
>  
> -Overall, given that on a BIOS-based system, the IVT and BDA occupy the first
> -5/16ths of the first page of RAM, with the rest free to use, Xen assumes the
> -top of the page is safe to use.
> +In each supported 32bit entry protocol, ``%ebx`` is a pointer to an info
> +structure, and it is highly likely that this structure does not overlap with
> +Xen.  Therefore we use this as as a temporary stack, preserving the prior

Double "as".

> @@ -460,21 +466,26 @@ __start:
>          /*
>           * Multiboot (both 1 and 2) specify the stack pointer as undefined
>           * when entering in BIOS circumstances.  This is unhelpful for
> -         * relocatable images, where one push/pop is required to calculate
> -         * images load address.
> +         * relocatable images, where one call (i.e. push) is required to
> +         * calculate images load address.

Perhaps "the" after "calculate" and (albeit you're the native speaker) isn't
it "image's" then?

Jan

