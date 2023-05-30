Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51168715B49
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 12:17:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541060.843383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3wPt-0000nM-Oc; Tue, 30 May 2023 10:17:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541060.843383; Tue, 30 May 2023 10:17:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3wPt-0000kw-Lm; Tue, 30 May 2023 10:17:25 +0000
Received: by outflank-mailman (input) for mailman id 541060;
 Tue, 30 May 2023 10:17:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Ox2=BT=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q3wPs-0000kl-JT
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 10:17:24 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a8f393d-fed3-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 12:17:22 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f6e13940daso45204065e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 May 2023 03:17:22 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l9-20020adfe589000000b00307c8d6b4a0sm2797762wrm.26.2023.05.30.03.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 03:17:21 -0700 (PDT)
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
X-Inumbo-ID: 2a8f393d-fed3-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1685441841; x=1688033841;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bIVTLqmO7KKzS9DWVhRdiRP4b6om65+r3YY+mErbdJE=;
        b=Vbn5wEsq+ZgNLVS2MDIKvLyrCNzMKbD79XHAqvmiyd8cqnHZMw71jr7MIGEEt7YVQS
         d8pRoONkA4ExhQdYh5i2c4v8TLQ5FWH7oPeV/TeUPDzQl0i7q45cLdI6sR03Mi46DMA4
         J8jF7Qbeh3dB0X4vgQtaVT2UugLy64tsRQCEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685441841; x=1688033841;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bIVTLqmO7KKzS9DWVhRdiRP4b6om65+r3YY+mErbdJE=;
        b=IQ4QE6rXl/ryo6KbeThPHN0w9jP4eDhVxm4TfGOKTDCh4KLsHw4s5P9B87fHrWZQOA
         +PgPrikYNIAIwY75HmcZumy4F/bkot+RQGpW/8O2G5FDDx90ktM3zgieLrAwIylPfgZ6
         mG57AbZdXFX9VlOiPZ6X2uz9+Z8VtilqarLkJQuX4RCP7xyyI7dPsP/MOK9RV0aRgtCr
         Iy94B647ph7inzymwhFAeTo8Fgdzrcf/VZwoLIx+puFhZvL1w2taSBjkiL/eatwI07w1
         8nHkXwzRvcI4EltfXRKQGWUmlbrTU8jEyA53z2m2etyyeRRRvWQJ3jfLxTlhgp5xBEtG
         EBmw==
X-Gm-Message-State: AC+VfDypiCe4wm+bxV2eq/WfkGrPYNW+Z5Bqmi6GMrB6HTeVcr7RFJo3
	gTiRi4Hj19y8pBzRK2zBlSJCy2Cg9KJA1+TXGUk=
X-Google-Smtp-Source: ACHHUZ4zEbxDixjeBxJed2ybv/xVyJumc98wd8grgHFyQNRHYLYPgoNWIQLp5kYn6+1kJNuTt1VveA==
X-Received: by 2002:a7b:c853:0:b0:3f6:45d:28a1 with SMTP id c19-20020a7bc853000000b003f6045d28a1mr1243411wml.14.1685441841378;
        Tue, 30 May 2023 03:17:21 -0700 (PDT)
Message-ID: <6475cd31.df0a0220.7b8e8.ab11@mx.google.com>
X-Google-Original-Message-ID: <ZHXNL0Hz7dnkALMC@EMEAENGAAD19049.>
Date: Tue, 30 May 2023 11:17:19 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/3] x86: Add support for AMD's Automatic IBRS
References: <20230526150044.31553-1-alejandro.vallejo@cloud.com>
 <20230526150044.31553-3-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230526150044.31553-3-alejandro.vallejo@cloud.com>

On Fri, May 26, 2023 at 04:00:43PM +0100, Alejandro Vallejo wrote:
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 74e3915a4d..09cfef2676 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -2036,6 +2036,9 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>          barrier();
>          wrmsrl(MSR_SPEC_CTRL, default_xen_spec_ctrl);
>          info->last_spec_ctrl = default_xen_spec_ctrl;
> +
> +        if ( cpu_has_auto_ibrs && (default_xen_spec_ctrl & SPEC_CTRL_IBRS) )
> +            write_efer(read_efer() | EFER_AIBRSE);
>      }
After thinking things through I think I'll get rid of this "delay AutoIBRS"
setting. I initially thought there might have been some handshake between
the newly created dom0 and Xen on this path, but that doesn't seem to be
the case. If so, I can remove some of this disjoint logic by setting AIBRSE
on the local EFER and trampoline_efer during init_speculation_mitigation.
Then the BSP will have the correct setting, the APs will pick it up on boot
and S3 wakeups will do the right thing too.

I'm assuming then bsp_delay_spec_ctrl is there mostly to delay STIBP for as
long as possible?

Alejandro

