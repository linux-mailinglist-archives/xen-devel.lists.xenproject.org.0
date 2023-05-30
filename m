Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B32716A6A
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 19:03:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541308.843943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q42kn-0005Bo-RM; Tue, 30 May 2023 17:03:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541308.843943; Tue, 30 May 2023 17:03:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q42kn-00059D-Nl; Tue, 30 May 2023 17:03:25 +0000
Received: by outflank-mailman (input) for mailman id 541308;
 Tue, 30 May 2023 17:03:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wXld=BT=gmail.com=bobbyeshleman@srs-se1.protection.inumbo.net>)
 id 1q42km-00046B-32
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 17:03:24 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1ca63af-ff0b-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 19:03:22 +0200 (CEST)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1b04706c85fso19090605ad.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 May 2023 10:03:22 -0700 (PDT)
Received: from localhost (ec2-52-9-159-93.us-west-1.compute.amazonaws.com.
 [52.9.159.93]) by smtp.gmail.com with ESMTPSA id
 c7-20020a170902d48700b001ab016e7916sm10523636plg.234.2023.05.30.10.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 10:03:20 -0700 (PDT)
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
X-Inumbo-ID: e1ca63af-ff0b-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685466201; x=1688058201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KxFPuHMrCG3+IAfjt5k3nuYstYdlhBbIyw3EgWmU16g=;
        b=N3kIsJTJHipusSfDM42iOIddQgUBU6RTqsQwmqbgr8lEAI0zjgVi0Rh3yILK3Va61o
         wvDiK6tnONA9ZrfyygDuXtglz+egKqvtZIlww4IBGtqOF/anjXcEDMRlv/It9Qhgf3Dz
         AGUZIJeegL9wZSqnkNSs4p3wx8el6MAKMkOezDoRpe+J60jMfE9kH+goboI7y6ReRggh
         zMh5zGpwyS/Vq5ZYZqwn5E7k+1fF8J9xypcAqooGBpr9JiuwBUpp2KHni6ysdu3SsUk3
         Zuwle03Bq7n3/WWA5o4pNTHKjnDPXQegBoLF2wtSguinbqUYwERT5NlxLRuqswVgPVoN
         3dxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685466201; x=1688058201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KxFPuHMrCG3+IAfjt5k3nuYstYdlhBbIyw3EgWmU16g=;
        b=PkFONL/3Wnp5tmIjoPPCEy9i+U2d7nA1E//yv2sUFA5p8ybxDzxDbPdVTwCGqrih2I
         lJJLC8qawhfv9AeDnxFyaPP3qDxfRM/hFRvH253o6YkqN8qT6G8baLqzhCQms1sMdxJW
         BTIR+cAxH0SO32HaZ+TY1jUgdSOGiZbMbTd4KhSrp5UoaqCf9w9C3Dgon3uizhafEm01
         pzDBVDUsG5VX3BuWqx2PPFTub7a8V57H986ML9ZQInxS2/fp6j3yWsyG+E5VYkN83Cml
         Zfz4VsZyiQxU2YAYUcXN+OzMSuP075EpAvweQI9Zgu01qzR7BZl4mjtGbz0dXk/pBbaP
         wwKA==
X-Gm-Message-State: AC+VfDyiTK9Ol+HVEjMcULh4nWRQaqsENISc/4lvtOLpYqeRAjnQ3SpP
	P0Z3j5/sm8oiDF3PEplYYnA=
X-Google-Smtp-Source: ACHHUZ7QJJXZloHwPyKOcrZtfG1Ro2AJkghZ8uwS7lcvMtpdNL1Eblp0pM70cXhI8Qls4v7fEwcvDQ==
X-Received: by 2002:a17:903:249:b0:1a6:82ac:f277 with SMTP id j9-20020a170903024900b001a682acf277mr3640748plh.14.1685466200997;
        Tue, 30 May 2023 10:03:20 -0700 (PDT)
Date: Tue, 30 May 2023 10:03:45 +0000
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v9 5/5] xen/riscv: remove dummy_bss variable
Message-ID: <ZHXKAVgBwZX9jnud@bullseye>
References: <cover.1685027257.git.oleksii.kurochko@gmail.com>
 <03151586ddd34f61a24809d11bcc0be5e847b384.1685027257.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03151586ddd34f61a24809d11bcc0be5e847b384.1685027257.git.oleksii.kurochko@gmail.com>

On Thu, May 25, 2023 at 06:28:18PM +0300, Oleksii Kurochko wrote:
> After introduction of initial pagetables there is no any sense
> in dummy_bss variable as bss section will not be empty anymore.
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
>  * patch was introduced in the current one patch series (v3).
> ---
> Changes in V2:
>  * patch was introduced in the current one patch series (v2).
> ---
>  xen/arch/riscv/setup.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> index cf5dc5824e..845d18d86f 100644
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -8,14 +8,6 @@
>  unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
>      __aligned(STACK_SIZE);
>  
> -/*  
> - * To be sure that .bss isn't zero. It will simplify code of
> - * .bss initialization.
> - * TODO:
> - *   To be deleted when the first real .bss user appears
> - */
> -int dummy_bss __attribute__((unused));
> -
>  void __init noreturn start_xen(unsigned long bootcpu_id,
>                                 paddr_t dtb_addr)
>  {
> -- 
> 2.40.1
> 
> 

Acked-by: Bobby Eshleman <bobbyeshleman@gmail.com>

