Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEfNN5Gf+GnlxAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 15:30:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 359F34BDE92
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 15:30:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299920.1574479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJtNf-0002JW-8d; Mon, 04 May 2026 13:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299920.1574479; Mon, 04 May 2026 13:30:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJtNf-0002Hj-5h; Mon, 04 May 2026 13:30:39 +0000
Received: by outflank-mailman (input) for mailman id 1299920;
 Mon, 04 May 2026 13:30:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJtNe-0002Hd-77
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 13:30:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJtNd-002Zyk-JK
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 15:30:37 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f89f79-2eae-0a2a0a5409dd-0a2a450a806e-36
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 15:30:37 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f89f7d-56b3-0a2a450a0019-d155dd31ad5e-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 15:30:37 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-44da2de25f3so714429f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 06:30:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44a8ea7d0e7sm24523595f8f.3.2026.05.04.06.30.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 06:30:35 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777901437; x=1778506237; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QOOkiFGObE6BjGpDRahVyzy6YvLgLYMk5N0pRRQKYb0=;
        b=UA4JIvb4HNNAX1YEZUktuG9H17XjnSWCFOh20HztY1hWN+mqL8ibgshWTr428PS2az
         V0rznFKd87xaivEVPJX/5cf1fA0lERfLq6ggAhdIA0i3VIQwWapJCYwbdh0oR1BKt2fg
         eKJnKlbTI4mhDkEpBOyRnxLlXMfodIgmxBEGdLg9+at6VQuxPqB7kEvJekaE9JSMXtDO
         95gaAOph8UCoJz7vsdWHcxpF1jvS3uCU+pn0KDrlSUkecmnazRAvusDJlrOxIQxBADMF
         +/MROI9nyxml3/634e8HrHaAVWbKUfsi/5h/0/0rVItUhTJbctMYHvuFy58Pfl9CZJFJ
         E62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777901437; x=1778506237;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOOkiFGObE6BjGpDRahVyzy6YvLgLYMk5N0pRRQKYb0=;
        b=lIiaEmlxTy9Fkv3HZQu7zaWvZHiCxQkMoI8nZRNjxmZMUDYYl0rrVjbBY/etMtgT7V
         zmBsWPnAH1AIHL/Hy2do0/XmdIoiPP91ekUKpiXqm8r4nvrWu8P69KWlkr61MnGQZVkG
         moZgH4BUGf06cjKo3am1PqsY/51GSKLLEPxwnbyiTKZQmDyx/VbS8SgdWddxboqZIAb3
         n2t7AYcmIXRglPMm6C16jJDDZ1G0ORzaVdAKlt4e6KFDsiUkU0UX8UNfM4H59w8I32x/
         Rd4VSd16tdNXIesD9FUw/vrmlVV/6Tk1B+bQce88Nfi+1Am4+Z4WCcc5tocl2XDA+HkQ
         E2Cg==
X-Forwarded-Encrypted: i=1; AFNElJ99EWeOAF4GYTqexylGjyHCdWtRJCAwBgWgTx4IzSY7rjzCsYipvynFY5Q3x/YZZcJwL95ZVTxOuv8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzV84xBihLcQjNafMBckdlv+31ooWuOJirt079QbnTDadwzIWeY
	ZfukWduKXx/vo74BWBpA7swVujkjWMQqPWXKcREFZoYhb3PjJwbmd6SORM7BN1PN0Q==
X-Gm-Gg: AeBDievZpKXV037XPhTb9i+ENujWL7TXVDnV8lYEWGJDxRhpoZwD7K75ULK2I8u+Od7
	s6wnrpJem8KpZfL3e6gY+JmP7LHAmTePzOtJaBbvJGVc9Mp57WROAdteBGCttU8eHghsxahELEJ
	XCl/rhk2Lryp+O84SNadaxDQbpp5JYN8wqTadQDBasBVLDMkoShagOVgvPJZnvkFrfAxiR/aPg6
	PSqzFTFVfnGy/UKPcmuLrb0CIWEG3zx1Bgm7jzEytkHFJQTGNMMsgtBrPfeKAZlHp9w56IhLU9v
	gSsHISxNip3oopo8GALCzFFuaGW05T69xIFYQ98IPCADo7kiviHGz0akdXeZeGIRDP7RtS6XLhr
	20A9mQKSj6LqzidE5wF/Lvkj3UOJpqh2k91IvySEO5DECnNwG3PNTXWUcbO/4+K6tKTl+ILxsb4
	EOQXrn1lIPSYGfT5W36Dy+RCjb+AfX1pUpuzOWJXVU//dUIvjq6k08Xc7P2fbzHOml2yA5h5gRv
	HtDHbPT99YDo+JVvI6QvAtqRw==
X-Received: by 2002:a05:6000:2088:b0:44a:b931:f32a with SMTP id ffacd0b85a97d-44bb586d065mr16610158f8f.27.1777901435408;
        Mon, 04 May 2026 06:30:35 -0700 (PDT)
Message-ID: <d22d841f-a694-4527-bc50-235e2525a0d3@suse.com>
Date: Mon, 4 May 2026 15:30:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Ping: [PATCH] EFI: adjust cfg file buffer freeing
From: Jan Beulich <jbeulich@suse.com>
To: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
Cc: Bernhard Kaindl <bernhard.kaindl@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bf990673-83c3-44c3-a76a-3b0c36108ec5@suse.com>
Content-Language: en-US
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
In-Reply-To: <bf990673-83c3-44c3-a76a-3b0c36108ec5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1777901437-4556C8B7-25AD20AB/0/0
X-purgate-type: clean
X-purgate-size: 2641
X-Rspamd-Queue-Id: 359F34BDE92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:bernhard.kaindl@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

On 22.04.2026 13:51, Jan Beulich wrote:
> The boot services FreePages() needs passing the size. Since we allocated
> one more byte to put a trailing nul there, we also need to bump the size
> passed there. Make a small helper function to centralize this.
> 
> Note that there's no permanent memory leak because of the oversight: The
> allocation is done using EfiLoaderData, and all memory of that type is
> later reclaimed anyway.
> 
> Fixes: df75f77092c1 ("EFI: avoid OOB config file reads")
> Reported-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Marek, Daniel?

Thanks, Jan

> ---
> This is an alternative proposal to
> https://lists.xen.org/archives/html/xen-devel/2026-04/msg01044.html.
> 
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -778,6 +778,16 @@ static void __init efi_relocate_esrt(EFI
>   */
>  #include "efi-boot.h"
>  
> +static void __init free_cfg(void)
> +{
> +    if ( !cfg.need_to_free )
> +        return;
> +
> +    /* One extra byte was allocated to put a nul character there. */
> +    efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size + 1));
> +    cfg.need_to_free = false;
> +}
> +
>  void __init noreturn blexit(const CHAR16 *str)
>  {
>      if ( str )
> @@ -787,8 +797,7 @@ void __init noreturn blexit(const CHAR16
>      if ( !efi_bs )
>          efi_arch_halt();
>  
> -    if ( cfg.need_to_free )
> -        efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
> +    free_cfg();
>      if ( kernel.need_to_free )
>          efi_bs->FreePages(kernel.addr, PFN_UP(kernel.size));
>      if ( ramdisk.need_to_free )
> @@ -1557,11 +1566,7 @@ void EFIAPI __init noreturn efi_start(EF
>              name.s = get_value(&cfg, "global", "chain");
>              if ( !name.s )
>                  break;
> -            if ( cfg.need_to_free )
> -            {
> -                efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
> -                cfg.need_to_free = false;
> -            }
> +            free_cfg();
>              if ( !read_file(dir_handle, s2w(&name), &cfg, NULL) )
>              {
>                  PrintStr(L"Chained configuration file '");
> @@ -1631,11 +1636,7 @@ void EFIAPI __init noreturn efi_start(EF
>  
>          efi_arch_cfg_file_late(loaded_image, dir_handle, section.s);
>  
> -        if ( cfg.need_to_free )
> -        {
> -            efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
> -            cfg.need_to_free = false;
> -        }
> +        free_cfg();
>  
>          if ( dir_handle )
>              dir_handle->Close(dir_handle);


