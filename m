Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2A171EF2F
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 18:36:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542676.846808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4lHa-0001UE-CC; Thu, 01 Jun 2023 16:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542676.846808; Thu, 01 Jun 2023 16:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4lHa-0001SA-9L; Thu, 01 Jun 2023 16:36:14 +0000
Received: by outflank-mailman (input) for mailman id 542676;
 Thu, 01 Jun 2023 16:36:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=om5G=BV=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q4lHZ-0001S4-8m
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 16:36:13 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 689a8c59-009a-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 18:36:07 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-30af159b433so1073055f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Jun 2023 09:36:07 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 y10-20020a7bcd8a000000b003f4ecf1fcbcsm2868172wmj.22.2023.06.01.09.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 09:36:06 -0700 (PDT)
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
X-Inumbo-ID: 689a8c59-009a-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1685637367; x=1688229367;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iah28SeMegZsgxJEkqt971vHwWhkPQuGbC3bMiLoC08=;
        b=QHC3z1cTvIDg9F0IQ3QAjvRh9SP4BmflicjeJOt2LW0b9jLd7MEgnrfJAL0Kvd5kOB
         x7dro4coPWopa8tqTNcxp0+g7uxb7OhO1+Cl5tEWXhywWlHoXFKDBBAUlOurDvq0VFK8
         eCgCl0ix90eMTuhw00tqhHP4IUIQfREaWNyFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685637367; x=1688229367;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iah28SeMegZsgxJEkqt971vHwWhkPQuGbC3bMiLoC08=;
        b=YclaFh9jpmP4fcIpFgRs+jmTf33POO3OAqgpb+eqy10RLgK1HgWzhc89AHQfrqikDf
         XdZvyAjDl1Ez1oP2MO4Pyhgdv9JZ9JusXZaa0O/eFiL3D5XCYDkm8wFKvXmfbo29qckZ
         ElROziQ9Yv78b6BA8QOpSl/6DNIqua4+80zckva96bmln4cIiHVXltTGZpZcVa9zP7mG
         Rq1l4kBI7PKb9ykujRPN8N7j7DmUGOwX4iZifNsuNyi2yxf+IcV+qBYxrAoP4fKSzKZ9
         Ctu70Amvc+ZJxhb2ZDou6WKGkGlAEPS7xvcz+UYlCEoFOcFyzKwthQ5pn4mFGgpimlz/
         7x/w==
X-Gm-Message-State: AC+VfDzyvikBNhFdrd/DGexzbu9qIknCRhJ+oAiDt46ZHb0LiI2AFQn6
	BlEA1UMBQQqv68/OxHn7Y2oILw==
X-Google-Smtp-Source: ACHHUZ5SYigm6NWnzPQ9/AjR+UddaUI8I7RMfHNI5LP/ClRMqwV9fOv72f7/iVfSmsF39ecU7/yvDg==
X-Received: by 2002:a5d:4651:0:b0:306:35d2:c33a with SMTP id j17-20020a5d4651000000b0030635d2c33amr2453301wrs.50.1685637367177;
        Thu, 01 Jun 2023 09:36:07 -0700 (PDT)
Message-ID: <6478c8f6.7b0a0220.12968.ab68@mx.google.com>
X-Google-Original-Message-ID: <ZHjI9Ui+Ni64Zzfa@EMEAENGAAD19049.>
Date: Thu, 1 Jun 2023 17:36:05 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/ucode: Exit early from early_update_cache() if
 loading not available
References: <20230601143813.1553740-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601143813.1553740-1-andrew.cooper3@citrix.com>

On Thu, Jun 01, 2023 at 03:38:13PM +0100, Andrew Cooper wrote:
> If for any reason early_microcode_init() concludes that no microcode loading
> is available, early_update_cache() will fall over a NULL function pointer:
> 
>   (XEN) Xen call trace:
>   (XEN)    [<ffff82d04037372e>] R show_code+0x91/0x18f
>   (XEN)    [<ffff82d040373a49>] F show_execution_state+0x2d/0x1fc
>   (XEN)    [<ffff82d040374210>] F fatal_trap+0x87/0x19a
>   (XEN)    [<ffff82d040647f2c>] F init_idt_traps+0/0x1bd
>   (XEN)    [<ffff82d04063854f>] F early_page_fault+0x8f/0x94
>   (XEN)    [<0000000000000000>] F 0000000000000000
>   (XEN)    [<ffff82d040628c46>] F arch/x86/cpu/microcode/core.c#early_update_cache+0x11/0x74
>   (XEN)    [<ffff82d040628e5c>] F microcode_init_cache+0x5a/0x5c
>   (XEN)    [<ffff82d04064388f>] F __start_xen+0x1e11/0x27ee
>   (XEN)    [<ffff82d040206184>] F __high_start+0x94/0xa0
> 
> which is actually parse_blob()'s use of ucode_ops.collect_cpu_info.
> 
> Skip trying to cache anything if microcode loading is unavailable.
> [...]
> ---
>  xen/arch/x86/cpu/microcode/core.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
> index 5a5c0a8c70db..9029301107d6 100644
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -789,6 +789,9 @@ int __init microcode_init_cache(unsigned long *module_map,
>  {
>      int rc = 0;
>  
> +    if ( !ucode_ops.apply_microcode )
> +        return -ENODEV;
> +
>      if ( ucode_scan )
>          /* Need to rescan the modules because they might have been relocated */
>          microcode_scan_module(module_map, mbi);

Ugh. These bugs are forever. IMO, it would be helpful to have a default set
of stubs (ucode_ops_default?) that unconditionally return -ENODEV when
called. At least the whole system won't crash under our feet if we forgot
an "if ( !ucode_ops.foo ) return -1".

It's still imperfect but there's far less room for errors.

Alejandro


