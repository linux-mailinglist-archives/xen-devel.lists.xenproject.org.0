Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 226C07593FE
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 13:12:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565769.884250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM55r-0004Te-SL; Wed, 19 Jul 2023 11:11:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565769.884250; Wed, 19 Jul 2023 11:11:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM55r-0004Rh-OW; Wed, 19 Jul 2023 11:11:43 +0000
Received: by outflank-mailman (input) for mailman id 565769;
 Wed, 19 Jul 2023 11:11:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Hz6=DF=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qM55q-0004RW-3F
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 11:11:42 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0782fbd5-2625-11ee-8611-37d641c3527e;
 Wed, 19 Jul 2023 13:11:37 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4fba1288bbdso11069831e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jul 2023 04:11:37 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 i14-20020a17090671ce00b0098866a94f14sm2174938ejk.125.2023.07.19.04.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 04:11:36 -0700 (PDT)
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
X-Inumbo-ID: 0782fbd5-2625-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1689765097; x=1690369897;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5Y7iNeASOLCAHxlLBaWvcbKrGIMRiUrIQIuv2nh6jgQ=;
        b=O7m403z+KTV1yb2zkJq5jWbDBVjIh6WMqEQtyfFkymBDZzMQG6oYW2omdJXB0vx0Th
         t2wDIfDHYKxG5zJafROmrK6rvXzHonJHFVlY3LdaploVuQ++IYlyt1tEQZRtJZkR4EKO
         R64C/mlrAWW4x7bw+GxJXh+Rb5r0z7FKf66kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689765097; x=1690369897;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Y7iNeASOLCAHxlLBaWvcbKrGIMRiUrIQIuv2nh6jgQ=;
        b=kknUbsCF2yodBT02OUn4+HmlvwY5BQL1xhsV9grCCAwMkYm0CjV/FZ6iwhBCdADCVt
         Leezjianb1nY/8Ggka+WavYe3Dwse8qU0XPt52y2z79AWq+PK1qS94czUHIkFMN/9SAB
         KIUJn9fO3QiAvBUo+Yuc/4Of1LSopgc5GwgYEGbj6ws5/UTme/opQZgB1d0mGNDBSmpc
         SyrCYLpeJ4GCUovAmEjnyUXaU+IoSBtYud3NULUwt8gD4xX9bpc/o6IbOjxePKFi4plH
         2UV8KSks7mjVwllYpWsYD/+qUdabUrUOr2QkwU+sxkTFtj134F0MWwSQ1heiLBG0UE7B
         ETnA==
X-Gm-Message-State: ABy/qLYTHT8AadJRGaBR2jkfvr5NaXMAY8t5mt2V6VZ8u9tCChDlyfoM
	vofmV5NOSMHBBDsRWF7lLvHzbXLXCh1XCYY1SDI=
X-Google-Smtp-Source: APBJJlFFHbZG/CximVedQvjBFlBk0OC9ddRPGdcLYwD7c0Pl6oJC0paQ5fUE5cKMbMFUyzuicM7Qhw==
X-Received: by 2002:a2e:9583:0:b0:2b5:1b80:263a with SMTP id w3-20020a2e9583000000b002b51b80263amr16566192ljh.47.1689765097264;
        Wed, 19 Jul 2023 04:11:37 -0700 (PDT)
Message-ID: <64b7c4e8.170a0220.4baaf.8ea6@mx.google.com>
X-Google-Original-Message-ID: <ZLfE55y9cjWT689L@EMEAENGAAD19049.>
Date: Wed, 19 Jul 2023 12:11:35 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 3/3] x86: Add Kconfig option to require NX bit support
References: <20230629121713.1211-1-alejandro.vallejo@cloud.com>
 <20230629121713.1211-4-alejandro.vallejo@cloud.com>
 <386eb540-8688-1a95-1e75-133bb21223fc@suse.com>
 <3c087e81-73f2-b284-d035-807f64b78e6d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c087e81-73f2-b284-d035-807f64b78e6d@suse.com>

On Wed, Jul 19, 2023 at 08:13:27AM +0200, Jan Beulich wrote:
> On 18.07.2023 15:19, Jan Beulich wrote:
> > On 29.06.2023 14:17, Alejandro Vallejo wrote:
> >> --- a/xen/arch/x86/boot/head.S
> >> +++ b/xen/arch/x86/boot/head.S
> >> @@ -123,6 +123,7 @@ multiboot2_header:
> >>  .Lbad_ldr_nih: .asciz "ERR: EFI ImageHandle is not provided by bootloader!"
> >>  .Lbad_efi_msg: .asciz "ERR: EFI IA-32 platforms are not supported!"
> >>  .Lbag_alg_msg: .asciz "ERR: Xen must be loaded at a 2Mb boundary!"
> >> +.Lno_nx_msg:   .asciz "ERR: Not an NX-capable CPU!"
> >>  
> >>          .section .init.data, "aw", @progbits
> >>          .align 4
> >> @@ -153,6 +154,11 @@ early_error: /* Here to improve the disassembly. */
> >>  .Lnot_aligned:
> >>          add     $sym_offs(.Lbag_alg_msg), %esi
> >>          jmp     .Lget_vtb
> >> +#ifdef CONFIG_REQUIRE_NX
> >> +.Lno_nx:
> >> +        add     $sym_offs(.Lno_nx_msg), %esi
> >> +        jmp     .Lget_vtb
> >> +#endif
> > 
> > Since I'm in the process of introducing more such paths (for the x86-64-v<N>
> > series), I'm curious: Have you actually had success with getting any output
> > from this code path? I see unreadable output come through serial (provided
> > it's the normal com1 I/O port location where the serial port is), which
> > likely is because baud rate wasn't configured yet, and hence I might have
> > success by changing the config of the receiving side. And I see nothing at
> > all on the screen. While kind of expected when in graphics mode, I wonder
> > whether this ever worked, or whether this has simply bitrotted because of
> > never actually coming into play.
I hacked the code to exercise the XD_DISABLE code path, but didn't try to
exercise the failure paths, I'm afraid. Sorry.
> 
> Pretty clearly this was broken in the course of adding MB2 support, by
> b28044226e1c using %esi as the "relocation base" after already having
> clobbered it. I'm working on a fix.
> 
> Jan
Uh-oh. Good catch.

Alejandro

