Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F90A7137D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 10:21:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927358.1330108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txMxG-0007wP-7U; Wed, 26 Mar 2025 09:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927358.1330108; Wed, 26 Mar 2025 09:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txMxG-0007tb-3f; Wed, 26 Mar 2025 09:21:46 +0000
Received: by outflank-mailman (input) for mailman id 927358;
 Wed, 26 Mar 2025 09:21:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mf06=WN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1txMxE-0007tV-LS
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 09:21:44 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbb6283e-0a23-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 10:21:43 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ac2c663a3daso491360966b.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 02:21:43 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac3efb52bffsm974294866b.89.2025.03.26.02.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Mar 2025 02:21:42 -0700 (PDT)
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
X-Inumbo-ID: bbb6283e-0a23-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742980903; x=1743585703; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WMyyBKFVbbQ7OWzLqoqytRgnlb6Py9GZmeFnMpyWgqI=;
        b=sjZMpInBs9zbcaogjHS0rQ09golEjJMQrq4l9P+cWlQLTD1sKQ9Jv6iIh5xyjnyU3+
         xFWrzF4RPXr1F7q9G/vb2Gan8/qW3anfbrjmsrINWO1tFf6m7VOKnm9z1ommaZtnecey
         q1TGuhCglNq4+QN5H8j9u7rPouOp1YBkiIb/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742980903; x=1743585703;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WMyyBKFVbbQ7OWzLqoqytRgnlb6Py9GZmeFnMpyWgqI=;
        b=J3MmJ5a7C4fsgvVu8LhV46OPdnX0bEaLEU9vVX8V4Bpq0IqReBKo/XZzK7TIwOBepO
         v23Gy0CZrRRVO6MPlX5IMfDxzBOrrxZGhaJx3b0gMi4IJiizYfGeES/K4EqfmNf/MhT2
         7dLjxIX39mpdFxNZWDw0y7KQcwGXFrqui+yaLtE+Jih8fluhlcZsmvW7QqxkUAmHbY9P
         NftWh0WkOQh8mzV4STuIR5PXwoB3a8EkF5JVHXrqdLs83hcaio0TrKrCfQevv7tmCTG+
         ppc4XOmJ4WpgVRbzYAftyX22kozh2G4qd1vkrpDbKlBt3SxcQ01qKvk7DCRImKY5b5UM
         /EAQ==
X-Gm-Message-State: AOJu0YybS73SPM0LF8MI1B7sI+fzN6wQHP7jJYbA12B8wxRHyEOS8Z3G
	+g8V92V7S61uc3jy8dRUTpjfeOdzCADPx174eFNSPM3dBDrbC+4oh6uIfc0JF1w=
X-Gm-Gg: ASbGncvh6dxEpvROKz7lP7LsH/WzfhvRCdO6/0aqd328j8EmGmrFfG86JMdE5ZZeuNL
	DlxxEQWfVPRijLukyq2hWthQ5C8xa2uP+zq0EpFv8lxjNKc/GPElCKHiPn1/FT22xkJPtbSNVBD
	qu1xV2u7Foik+UqdcdPs90E8wwLbpUjfet4EUj/nMjgeKeA9vpATafE+ifadWzGUy7AboV7ElnO
	RMSsHDEVhk0ftT3ljc9rWNLxZYTjH6KCHu2y/AiYhmV4PzO071YZRVmuOEMkBHXTNWCi3umDfhL
	BOd5AF2nIta3SJFKD5F8MjBtl6PJNFqmuW+i3Ke20SiCZEJmjA==
X-Google-Smtp-Source: AGHT+IG8tE1mDvh/jNXUq39RbkqI8jyE0X+0F5WyrJq2L0/XE5ELIrUu/kEObGuqxpYOwlTvkKNGAw==
X-Received: by 2002:a17:907:d1c:b0:ac2:723a:670f with SMTP id a640c23a62f3a-ac3f2237bf5mr2008208466b.24.1742980903268;
        Wed, 26 Mar 2025 02:21:43 -0700 (PDT)
Date: Wed, 26 Mar 2025 10:21:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/PVH: expose OEMx ACPI tables to Dom0
Message-ID: <Z-PHJk8GT-y1NnHl@macbook.local>
References: <c9365d42-c15d-4d93-acd8-106ca46cb7f3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c9365d42-c15d-4d93-acd8-106ca46cb7f3@suse.com>

On Wed, Mar 26, 2025 at 09:45:09AM +0100, Jan Beulich wrote:
> What they contain we don't know, but we can't sensibly hide them. On my
> Skylake system OEM1 (with a description of "INTEL  CPU EIST") is what
> contains all the _PCT, _PPC, and _PSS methods, i.e. about everything
> needed for cpufreq. (_PSD interestingly are in an SSDT there.)
> 
> Further OEM2 there has a description of "INTEL  CPU  HWP", while OEM4
> has "INTEL  CPU  CST". Pretty clearly all three need exposing for
> cpufreq and cpuidle to work.
> 
> Fixes: 8b1a5268daf0 ("pvh/dom0: whitelist PVH Dom0 ACPI tables")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> Sadly the commit above says nothing at all about the criteria used by
> which tables would want to be whitelisted.

I think at that point it was mostly an allow list that enabled me to
boot PVH on the systems I was testing.  I don't think it was intended
to be complete, but rather something that we would expand as needed.
There where many and bigger missing pieces of PVH dom0 when that was
committed.

> Further tables on said system
> which weren't blacklisted prior to that commit, yet which also aren't
> whitelisted are DBGP, DBG2, FIDT, LPIT, MIGT, MSCT, NITR, PCCT, RASF,
> SVOS, UEFI, WDDT, and WSMT. Even without diving into the details of any
> of them it seems pretty clear to me that at least some would want
> whitelisting, too.

I cannot find any reference about: FIDT, MIGT, NITR, SVOS and WDDT in
the ACPI spec.

The MSCT I think we don't want to expose, as it's related to topology
data.

Regarding RASF I would be slightly worried about the patrol scrub
feature.  The memory map exposed to dom0 will be different from the
native one, and there's also the interposed p2m.

The rest are likely fine to expose.

> 
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -1010,12 +1010,20 @@ static bool __init pvh_acpi_table_allowe
>              return true;
>          else
>          {
> +    skip:
>              printk("Skipping table %.4s in non-ACPI non-reserved region\n",
>                     sig);
>              return false;
>          }
>      }
>  
> +    if ( !strncmp(sig, "OEM", 3) )
> +    {
> +        if ( acpi_memory_banned(address, size) )
> +            goto skip;
> +        return true;
> +    }

I may have put this ahead of the loop, so that the goto label doesn't
go backwards (which always feels weird to me).

> +

I wonder if additionally we should print tables filtered to dom0 here:

if ( opt_dom0_verbose )
    printk("Hidden ACPI Table %.4s\n", sig);

So that it's more obvious which tables are not exposed.

Thanks, Roger.

