Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A192CA5FD9A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 18:21:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913196.1319306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsmFD-0006Eg-5q; Thu, 13 Mar 2025 17:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913196.1319306; Thu, 13 Mar 2025 17:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsmFD-0006C7-2h; Thu, 13 Mar 2025 17:21:19 +0000
Received: by outflank-mailman (input) for mailman id 913196;
 Thu, 13 Mar 2025 17:21:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2IX=WA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tsmFB-0006Ac-99
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 17:21:17 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9173fc92-002f-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 18:21:15 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-39133f709f5so803310f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 10:21:15 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a8c5cbfsm59264775e9.30.2025.03.13.10.21.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 10:21:14 -0700 (PDT)
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
X-Inumbo-ID: 9173fc92-002f-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741886475; x=1742491275; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pX7wc8U4+Fgb1mawaqBgjRggQr6QnkqSkEFNcohXYeI=;
        b=cRtamqPRS/bQwKLg/acR484EdUrOnI1JPv8VLbhwAJdo7caW/TFP4JjqGmXayO5mMZ
         xrdmQuHXV+RTzlzVSngPrHh+orcgbSUInzU39BqnO5Rno8LVXpA1+w5ojSlvNUtsgcBk
         Ovr8iLP6U+mhDF1b1nyaAHwpUEX+MB9on8S8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741886475; x=1742491275;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pX7wc8U4+Fgb1mawaqBgjRggQr6QnkqSkEFNcohXYeI=;
        b=xUFT473AFenjBaaojIWXzn3DsxHcl0kw98y/9GRO/gbJR+TRltuI2ZsGaHvekq9k4P
         dbkO608JFOd3kWilDwXGhyOFKf9Ray+XtQ6VxZWw4JJ09h655IanUvC+HRl3XRWlvRHU
         Vbrvps0gjMQ+CsZyeycMKsdFhuqLMGewi1RQue6M3FhBcnwx1i30I/+z1hZFzoHyzrfW
         iFnqOOTgTtpKPLl3MEzoWgzDi6oWKvIDLMyPFtaIIquGSB6rqTLaCukDkq39nE0sRK6K
         GqVFQRkacAnS9qgS4EXnzUuV10Ud6RoKeU3xMdz4xAuLz/RsOmbBxVCG4CNxvz/uAcGp
         KaLw==
X-Forwarded-Encrypted: i=1; AJvYcCUeBC7htLxbNcG0ZIPddPadDSHoAlfzlqdmNbykZwpKO2atClJlxU84yFduP+e2quBL4tm4jnzBqMM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw7HLKjMoR5VMIH1gaT6jw/drx7/Zf40lMhASk2bBgUAz4eNLmh
	cuiJv+d4R2ZUGPtzFiBR9ECJZXGQczYVo2CZrsYfYo5xFFx1dk1szW0M1Hzq9wg=
X-Gm-Gg: ASbGncsFbFsC4oZ1iG9O9Nd3PuDqWgz3wX661+VOJx6CS6rfZPqlI7fjvxwyrqXp15C
	pU+onvx9/k7qBrYlVErjvxJFPUD1BuMcn1xoYd56beV8fYs+qGoJNJYJXWyH80/kOs+D+nfdjMP
	q5JY1Y8WpeNEku7UZp8kQ/N5+x5InnGAfC7y35Z8UaY7r5+8DZbaXWzPT3Q0rCCaRaUEZXbC6Mq
	PZW+NlXw1YJM4ogwYRAIdE93U8/AoKydUQM939/hYdbUlmdSWvtdqxTrQJS2N0FK1DHi2Szlqcj
	ebUAg1315pxm+UxPlgmMxr/U9qgDgSzZkaE1f1lv8kNW8ZQPSEvaU/IMc7PY6+j0zwSRoQyy6hd
	CYhcUtBVT
X-Google-Smtp-Source: AGHT+IHRH9t1CBbaRWWq+A1+zBLU/GPCuVguo7u1CPINZduFoUere3BphV49cBwwNN251OkFUsPiJA==
X-Received: by 2002:a5d:6488:0:b0:38f:5057:5810 with SMTP id ffacd0b85a97d-396c1e1f319mr441033f8f.25.1741886474799;
        Thu, 13 Mar 2025 10:21:14 -0700 (PDT)
Message-ID: <ad26bb49-4025-4190-ba69-c03584cf2229@citrix.com>
Date: Thu, 13 Mar 2025 17:21:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] x86/ioremap: prevent additions against the NULL
 pointer
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20250313153029.93347-1-roger.pau@citrix.com>
 <20250313153029.93347-6-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250313153029.93347-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/03/2025 3:30 pm, Roger Pau Monne wrote:
> This was reported by clang UBSAN as:
>
> UBSAN: Undefined behaviour in arch/x86/mm.c:6297:40
> applying zero offset to null pointer
> [...]
> Xen call trace:
>     [<ffff82d040303662>] R common/ubsan/ubsan.c#ubsan_epilogue+0xa/0xc0
>     [<ffff82d040304aa3>] F __ubsan_handle_pointer_overflow+0xcb/0x100
>     [<ffff82d0406ebbc0>] F ioremap_wc+0xc8/0xe0
>     [<ffff82d0406c3728>] F video_init+0xd0/0x180
>     [<ffff82d0406ab6f5>] F console_init_preirq+0x3d/0x220
>     [<ffff82d0406f1876>] F __start_xen+0x68e/0x5530
>     [<ffff82d04020482e>] F __high_start+0x8e/0x90
>
> Fix bt_ioremap() and ioremap{,_wc}() to not add the offset if the returned
> pointer from __vmap() is NULL.
>
> Fixes: d0d4635d034f ('implement vmap()')
> Fixes: f390941a92f1 ('x86/DMI: fix table mapping when one lives above 1Mb')
> Fixes: 81d195c6c0e2 ('x86: introduce ioremap_wc()')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, with one style fix.

It's unfortunate, because C23 makes this one case (add 0 to NULL
pointer) explicitly well defined to avoid corner cases like this.  Oh well.

> diff --git a/xen/arch/x86/dmi_scan.c b/xen/arch/x86/dmi_scan.c
> index 2fcc485295eb..a05492037519 100644
> --- a/xen/arch/x86/dmi_scan.c
> +++ b/xen/arch/x86/dmi_scan.c
> @@ -119,8 +120,10 @@ static const void *__init bt_ioremap(paddr_t addr, unsigned int len)
>      if ( system_state < SYS_STATE_boot )
>          return __acpi_map_table(addr, len);
>  
> -    return __vmap(&mfn, PFN_UP(offs + len), 1, 1, PAGE_HYPERVISOR_RO,
> -                  VMAP_DEFAULT) + offs;
> +    va = __vmap(&mfn, PFN_UP(offs + len), 1, 1, PAGE_HYPERVISOR_RO,
> +	        VMAP_DEFAULT);

You've got mixed tabs/spaces here.

~Andrew

