Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7DF7F1A7A
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 18:36:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637140.992892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r58Bt-0005P2-JM; Mon, 20 Nov 2023 17:36:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637140.992892; Mon, 20 Nov 2023 17:36:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r58Bt-0005N5-GY; Mon, 20 Nov 2023 17:36:09 +0000
Received: by outflank-mailman (input) for mailman id 637140;
 Mon, 20 Nov 2023 17:36:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GG8d=HB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r58Bs-0005Mz-KD
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 17:36:08 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48b05f7e-87cb-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 18:36:06 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3316c6e299eso1931006f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Nov 2023 09:36:06 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 e16-20020a5d65d0000000b00332cc7c3aaasm343003wrw.21.2023.11.20.09.36.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 09:36:05 -0800 (PST)
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
X-Inumbo-ID: 48b05f7e-87cb-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700501766; x=1701106566; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U+zrxTSiv+mPwxPDQgt4Nc8fl93+JfhM0+yr6TnjwCI=;
        b=OJMeM6S7Xbx2uQ+1tt0B2g9dWh5S8h+3r1+ofuvijlQK4sZWekoSeh/eGYh3RzFm7Z
         Xksmza+zeR3rj3l/oLbRnydy2rlA7ZPDiZNJvQiiP3f0iWZyCyFbQtOdz0bGvRU4yPJc
         XXhxCULPNiNt6HvB9akO2oB9LkccNNGdE52tE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700501766; x=1701106566;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U+zrxTSiv+mPwxPDQgt4Nc8fl93+JfhM0+yr6TnjwCI=;
        b=auyAcRXOkxuc/2YZZwkaHR/3JkHoECEv/zafYx8kMHGt02HyCy/X6bPg8NvuLwgtR3
         cNKoI82A8iKW27gJyzCY41FPpYG2avptzVYrH4tktj8ZkdvJHafs8X1DJFj8ooXJv7eD
         ME+GvX4PnKV82N/JTv6tdk2n8n10nZe0vNCUUkHVBc7nT+g9rivnoE+VnttRetsvdJQg
         hXP+41g/MaO736cOEdLB2Y4G507SxNF8EhWmNnsEPO13gv9W2uDBEvN8N0pehS86d5/T
         nenrtGIMxUU7dh4TGVNhtW2qY50u/N7LOq0D2jHs2+hMWvuHphHiP1oXuos844V7a/uk
         dj3Q==
X-Gm-Message-State: AOJu0YxYmPKveVAL6nIWy1wytBk+dJCc+ewM/YI6eOSSO/lzk+Ym4xJC
	9xDWA6i38r3JhaxLokfKuKGY5A==
X-Google-Smtp-Source: AGHT+IGNEMtJh+6xdTcx2IvMF/C/h5IJBEo1fcQR83RLp4UIQtSER1eHXPQq2DfFmIIhWoUfgxkfjg==
X-Received: by 2002:a5d:6985:0:b0:32f:7d50:267e with SMTP id g5-20020a5d6985000000b0032f7d50267emr6290550wru.9.1700501765935;
        Mon, 20 Nov 2023 09:36:05 -0800 (PST)
Date: Mon, 20 Nov 2023 18:36:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/ioapic: Check 1k alignment for IO-APIC physical
 addresses
Message-ID: <ZVuZBGcbyZK8CESL@macbook.local>
References: <20231120151006.168773-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231120151006.168773-1-andrew.cooper3@citrix.com>

On Mon, Nov 20, 2023 at 03:10:06PM +0000, Andrew Cooper wrote:
> The MP spec requires a minimum of 1k alignment.  So too does Xen's use of a
> single fixmap page to map the IO-APIC.
> 
> Reject out-of-spec values so we don't end up in a position where a bad
> firmware value causes Xen to use the wrong mapping.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Wei Liu <wl@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/io_apic.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
> index 0ef61fb2f167..db1ea6e2f2ca 100644
> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -2589,10 +2589,11 @@ static void __init ioapic_init_mappings(void)
>          union IO_APIC_reg_01 reg_01;
>          paddr_t ioapic_phys = mp_ioapics[i].mpc_apicaddr;
>  
> -        if ( !ioapic_phys )
> +        if ( !ioapic_phys || (ioapic_phys & (KB(1) - 1)) )

Might be clearer to use !IS_ALIGNED(), otherwise:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

>          {
>              printk(KERN_ERR
> -                   "WARNING: bogus zero IO-APIC address found in MPTABLE, disabling IO/APIC support!\n");
> +                   "WARNING: bogus IO-APIC address %08lx found in MPTABLE, disabling IO/APIC support!\n",

FWIW, I think the '!' at the end is not useful, and I would adjust
the last 'IO/APIC' to 'IO-APIC' if already modifying the line.

Thanks, Roger.

