Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 750EA830378
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 11:25:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668362.1040497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ36Z-0007CU-Tn; Wed, 17 Jan 2024 10:25:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668362.1040497; Wed, 17 Jan 2024 10:25:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ36Z-00079s-Qs; Wed, 17 Jan 2024 10:25:07 +0000
Received: by outflank-mailman (input) for mailman id 668362;
 Wed, 17 Jan 2024 10:25:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nKNn=I3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rQ36Y-00079g-Na
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 10:25:06 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae65a50d-b522-11ee-98f2-6d05b1d4d9a1;
 Wed, 17 Jan 2024 11:25:05 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-336c8ab0b20so9510439f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jan 2024 02:25:05 -0800 (PST)
Received: from localhost ([213.195.127.68]) by smtp.gmail.com with ESMTPSA id
 n5-20020adff085000000b00337b47ae539sm1326306wro.42.2024.01.17.02.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 02:25:04 -0800 (PST)
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
X-Inumbo-ID: ae65a50d-b522-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705487105; x=1706091905; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uG9FrMn8jAcHEgP71mtu/aFaa+6/OSS1qBkYLl6mAHU=;
        b=klA1e4YmyIY6FIxBNYXN0gW8TJsysFdABy/OOHDRk+5Oiv4f13SftzjFP8tSj6loXM
         L7F+Ny2CJQEpY8SV2ik55Nr/hnULeUl8fRTr+lXZsi0Hp2NPd2v8bRf6UL5qobCLrjn3
         FqAcDePIFFO4Msg0MAhPlmOgu8tAIfMlm7wng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705487105; x=1706091905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uG9FrMn8jAcHEgP71mtu/aFaa+6/OSS1qBkYLl6mAHU=;
        b=c9GijOe9bA/dKF2cO7ab/QyHaCx2oqVJr6Zo3Qk6caD9yjDHcO+Og8o3/awRdvJmLl
         Qq5x6mP9j3eTCmDKRQkxaolglE3FW3gmtvzkRvPCh3Zgt0W/Tc550xGvwkZU8I3K2eci
         WUtvxXopUNSq9mtiCnBM04iOb4odqxGFLonIFXcHaHf2+bTy7b0yGsmm8QWMEZ6hfWEj
         F4VJgNFHWtZMq6V3ZjhhkJIsQsQDP++oH3oYQHrnTL/je1uwlvlum+0xawWiL/F5nFYT
         3pzSR56xWtCPbjzlArY9dWcrsYllSqIv/ZChuIW2Ugb0jG6rnDv1ibE6J1mHBUy78z77
         8ZyA==
X-Gm-Message-State: AOJu0Ywn36yItkELIULlVSzbqvbNAbYyXLVIIDaydF3MLQgAyqClwvlp
	s9UyH+yTNQSVIApnQp5AgEhY6JjzEBdsWQ==
X-Google-Smtp-Source: AGHT+IFcL3Yl3bsSniuzcelDmUMX88SoFJfTrqpzqidvJZEw2ruz2d3EC4Ps9b+Llu074DiQGPWxgQ==
X-Received: by 2002:a5d:4b8b:0:b0:337:2acd:6260 with SMTP id b11-20020a5d4b8b000000b003372acd6260mr5076205wrt.95.1705487105046;
        Wed, 17 Jan 2024 02:25:05 -0800 (PST)
Date: Wed, 17 Jan 2024 11:25:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/PVH: Dom0 "broken ELF" reporting adjustments
Message-ID: <ZaerAAt1EnFAZpo3@macbook>
References: <fda7586f-a1d1-4500-a6c4-d0e010223ee2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fda7586f-a1d1-4500-a6c4-d0e010223ee2@suse.com>

On Wed, Jan 17, 2024 at 09:53:26AM +0100, Jan Beulich wrote:
> elf_load_binary() isn't the primary source of brokenness being
> indicated. Therefore make the respective log message there conditional
> (much like PV has it), and add another instance when elf_xen_parse()
> failed (again matching behavior in the PV case).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -570,6 +570,8 @@ static int __init pvh_load_kernel(struct
>      if ( (rc = elf_xen_parse(&elf, &parms, true)) != 0 )
>      {
>          printk("Unable to parse kernel for ELFNOTES\n");
> +        if ( elf_check_broken(&elf) )
> +            printk("Xen dom0 kernel broken ELF: %s\n", elf_check_broken(&elf));

I would rather use "%pd: kernel broken ELF: %s\n", in case this gets
used for loading more than dom0 in the dom0less case.  The 'Xen'
prefix is IMO useless here (I know it was here before).

Thanks, Roger.

