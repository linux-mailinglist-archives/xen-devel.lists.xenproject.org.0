Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3D26BD465
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 16:54:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510687.788839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcpvI-0005Hd-W7; Thu, 16 Mar 2023 15:53:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510687.788839; Thu, 16 Mar 2023 15:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcpvI-0005Fv-TJ; Thu, 16 Mar 2023 15:53:48 +0000
Received: by outflank-mailman (input) for mailman id 510687;
 Thu, 16 Mar 2023 15:53:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hbW7=7I=gmail.com=bobbyeshleman@srs-se1.protection.inumbo.net>)
 id 1pcpvH-0005Fl-U6
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 15:53:47 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb6c7f26-c412-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 16:53:46 +0100 (CET)
Received: by mail-pl1-x632.google.com with SMTP id v21so2206005ple.9
 for <xen-devel@lists.xenproject.org>; Thu, 16 Mar 2023 08:53:46 -0700 (PDT)
Received: from localhost (c-73-164-155-12.hsd1.wa.comcast.net. [73.164.155.12])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a17090a538400b00233ebcb52a6sm3316476pjh.36.2023.03.16.08.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 08:53:44 -0700 (PDT)
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
X-Inumbo-ID: bb6c7f26-c412-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678982024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+UDMozFfeUR88M0TZxg7YsaEyPR2kVSV9EQT/QTwkbc=;
        b=evXuV2aPbSk18UnqUrpEsdy/KfjKwfioSxuVpS7EzfM8VAID+xSr6R5QSb20s4ixJU
         v1Hzh9W7DKdWy+wNjYeDvYxf0Thxig23/7mym0W9sNRj7QpI9rKyXdK5erRuR8o37lfv
         sZ/v2i9k6tMf7Yi8BuW9M8bI1nF8gt1fkcGD+e6gDlmeRWd43ib+gZzjKBSyBC9Imiv4
         VoF7jd+5e9Df69Wl86b8vrrc04Q6bz83MmkgpPJERWeiWFyzfHZRFfYH3Eb4NTnZz73g
         360Mxm/nXRbZB4l+c4XEUGGK1Uep/7Pe1YMmMjnY4qYIPrqkwj9l6V1eTScHmVM+1XMY
         qW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678982024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UDMozFfeUR88M0TZxg7YsaEyPR2kVSV9EQT/QTwkbc=;
        b=l0CKtS+EoH/wMiiCYKaoDFxmPZBGHE1ODsyaNrW4F3Pzq3cim+LB6LkSndNyNRf41d
         jK9LVDLVTMsfDE/c9YZw0z6/6D4SB26v4VScKzBv9j5zEfpfvsWLRnKkhPFql8MATEn1
         r6kAPN8j3OFyRwpxr1VaX+n9ruIhi/hdaMcMhZhSY6hYeAOlh3dCaNcVp4zmk1wxBvz/
         iM/vDbt5cI8LDOmseu6daV+aSr+4coX/eqgIxKKPCcRqfaWZH1voUOYQ7kYDtUdPrZEN
         muLNPt/bGpqPzh2PSXrjMEOmG1WgIG7/z8NhvdFT4YAJW/ordpBj+DCgwo/mKchSpZ0o
         +rrg==
X-Gm-Message-State: AO0yUKWZZJbLxBvcDte6XHcp0RTpuTWEFNFMVMk2TdA5EXrOSWqdYe5C
	6UbSa4H0iEDjZTl/6fmcu7E=
X-Google-Smtp-Source: AK7set+KqLYyY2QLwdA+LPNhoOzNpffvlYvsbc1MQVFl69f1eTjILzk8cc+bXqHcnzqjVVJu5qIBrw==
X-Received: by 2002:a17:90b:1e43:b0:23e:fa90:ba37 with SMTP id pi3-20020a17090b1e4300b0023efa90ba37mr4230152pjb.49.1678982024560;
        Thu, 16 Mar 2023 08:53:44 -0700 (PDT)
Date: Thu, 9 Mar 2023 10:42:34 +0000
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v3 1/3] xen/riscv: disable fpu
Message-ID: <ZAm4GuOmz7fhKF3X@bullseye>
References: <cover.1677838213.git.oleksii.kurochko@gmail.com>
 <1fe0c827b9e5c2fef569e25ad7ca377111228d29.1677838213.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1fe0c827b9e5c2fef569e25ad7ca377111228d29.1677838213.git.oleksii.kurochko@gmail.com>

On Fri, Mar 03, 2023 at 12:24:22PM +0200, Oleksii Kurochko wrote:
> Disable FPU to detect illegal usage of floating point in kernel
> space.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/riscv/riscv64/head.S | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
> index ffd95f9f89..52fa41c778 100644
> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -6,6 +6,13 @@ ENTRY(start)
>          /* Mask all interrupts */
>          csrw    CSR_SIE, zero
>  
> +        /*
> +         * Disable FPU to detect illegal usage of
> +         * floating point in kernel space
> +         */
> +        li      t0, SSTATUS_FS
> +        csrc    CSR_SSTATUS, t0
> +
>          la      sp, cpu0_boot_stack
>          li      t0, STACK_SIZE
>          add     sp, sp, t0
> -- 
> 2.39.0
> 
> 

My last email had the wrong trailer:

Reviewed-by: Bobby Eshleman <bobbyeshleman@gmail.com>

