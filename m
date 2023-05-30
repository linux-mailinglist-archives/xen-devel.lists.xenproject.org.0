Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10200716A39
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 18:58:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541295.843904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q42g4-00025Z-B6; Tue, 30 May 2023 16:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541295.843904; Tue, 30 May 2023 16:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q42g4-00022L-7y; Tue, 30 May 2023 16:58:32 +0000
Received: by outflank-mailman (input) for mailman id 541295;
 Tue, 30 May 2023 16:58:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wXld=BT=gmail.com=bobbyeshleman@srs-se1.protection.inumbo.net>)
 id 1q42g2-000226-KF
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 16:58:30 +0000
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [2607:f8b0:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32723d64-ff0b-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 18:58:28 +0200 (CEST)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-64d293746e0so5412173b3a.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 May 2023 09:58:28 -0700 (PDT)
Received: from localhost (ec2-52-9-159-93.us-west-1.compute.amazonaws.com.
 [52.9.159.93]) by smtp.gmail.com with ESMTPSA id
 q15-20020a62ae0f000000b006352a6d56ebsm1852253pff.119.2023.05.30.09.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 09:58:26 -0700 (PDT)
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
X-Inumbo-ID: 32723d64-ff0b-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685465907; x=1688057907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MY8Y/d9lsGbkXeH0mbAldIGXI9dMfLGW5DQ5y2Q/oKA=;
        b=oYh++T9MEfPGcesW0TYAX3AjygxWHfXNqu6JsTMK20RJMuSC4xL0vV1KrX1t2GUCcD
         Y8J4IF/RzIQlQrWykzki74dVEveC6C99cjhu8Xo88nuH/qAjIKO0MBkA4OIL+4XFEqut
         nVK2W+THAUj8c6PB2XtzmJhUQG+GEn4TNlZolJgNmAht3jeJoyV7HLFUt6/vwQZw/5vj
         AArrC0g8XhAlGn7Cj/g7Ki0Y13SFvcTNQRLsqLk7Zl3ADmr9NYXiDfV0Sr+Ksgpr8qaH
         fLyLadwadLC+qr3Ix9x7bm2HtMDLzkLXPQTsUB9M34CV9+3i6MVlu78hFYqLWPU/W8WF
         jVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685465907; x=1688057907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MY8Y/d9lsGbkXeH0mbAldIGXI9dMfLGW5DQ5y2Q/oKA=;
        b=QG1DLljZoF10Jl2GRcsCFN/l2EQJ5mzVTF/yC43CXHiZP8P/qYUNFSPSAXSMUMlnTv
         hC6CCrEToH8N6aLLxkbLc5aWXJKwDxbIeVxjDc3qA1+uhJm5809oGmD6RUm/EKO7eOVx
         XXNnCbtNrvwA3nLYI8DjRn9CUsVznQXn01h7C1fDlEPLMzuDHuo7m+EYRRra+9+ajpcO
         tr90UJ5jiEFaNXYSf5nObWHaLQq7VsMk1RaN4rPRrgJYN94H7gLinbzpQXSEtRb0UowJ
         zVkplGWgxGEBz9c6h/IbSRN5jkMYLeVL+XvH7U2aK0ahIfSG6u1M5SNfECu4HQeyl7Co
         R7jw==
X-Gm-Message-State: AC+VfDzF9X4DdNMzBxgP8FFTOwCDV4EquasGMaMKr9uRzVeaMW12Dmrj
	B5r/gQei7kwnSlVB/n+wGEY=
X-Google-Smtp-Source: ACHHUZ6Z+arnZdewCNuJNBQwtNC5tAXevRO31iw+YolgNPvkEBcu1HefFHsW0StH7Z1dGupLU9DEog==
X-Received: by 2002:a05:6a00:3901:b0:64a:f730:154b with SMTP id fh1-20020a056a00390100b0064af730154bmr3849151pfb.5.1685465906813;
        Tue, 30 May 2023 09:58:26 -0700 (PDT)
Date: Tue, 30 May 2023 09:58:26 +0000
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v9 4/5] xen/riscv: setup initial pagetables
Message-ID: <ZHXIwmivNrgKiGeH@bullseye>
References: <cover.1685027257.git.oleksii.kurochko@gmail.com>
 <6ea28216df1c7f29ebd88e20adb05cdf75af20fe.1685027257.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ea28216df1c7f29ebd88e20adb05cdf75af20fe.1685027257.git.oleksii.kurochko@gmail.com>

On Thu, May 25, 2023 at 06:28:17PM +0300, Oleksii Kurochko wrote:
> The patch does two thing:
> 1. Setup initial pagetables.
> 2. Enable MMU which end up with code in
>    cont_after_mmu_is_enabled()
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V9:
>  - Nothing changed. Only rebase
> ---
> Changes in V8:
>  - Nothing changed. Only rebase
> ---
> Changes in V7:
>  - Nothing changed. Only rebase
> ---
> Changes in V6:
>  - Nothing changed. Only rebase
> ---
> Changes in V5:
>  - Nothing changed. Only rebase
> ---
> Changes in V4:
>  - Nothing changed. Only rebase
> ---
> Changes in V3:
>  - update the commit message that MMU is also enabled here
>  - remove early_printk("All set up\n") as it was moved to
>    cont_after_mmu_is_enabled() function after MMU is enabled.
> ---
> Changes in V2:
>  * Update the commit message
> ---
>  xen/arch/riscv/setup.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> index 315804aa87..cf5dc5824e 100644
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -21,7 +21,10 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>  {
>      early_printk("Hello from C env\n");
>  
> -    early_printk("All set up\n");
> +    setup_initial_pagetables();
> +
> +    enable_mmu();
> +
>      for ( ;; )
>          asm volatile ("wfi");
>  
> -- 
> 2.40.1
> 
> 

Acked-by: Bobby Eshleman <bobbyeshleman@gmail.com>

