Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0906B9B44
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 17:24:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509736.786097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc7Qp-0005Gr-Nk; Tue, 14 Mar 2023 16:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509736.786097; Tue, 14 Mar 2023 16:23:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc7Qp-0005E2-Ks; Tue, 14 Mar 2023 16:23:23 +0000
Received: by outflank-mailman (input) for mailman id 509736;
 Tue, 14 Mar 2023 16:23:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2biy=7G=gmail.com=bobbyeshleman@srs-se1.protection.inumbo.net>)
 id 1pc7Qo-0005Dw-10
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 16:23:22 +0000
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [2607:f8b0:4864:20::102d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 889b8f2b-c284-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 17:23:21 +0100 (CET)
Received: by mail-pj1-x102d.google.com with SMTP id
 k18-20020a17090a591200b0023d36e30cb5so2823093pji.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Mar 2023 09:23:21 -0700 (PDT)
Received: from localhost (ec2-54-67-115-33.us-west-1.compute.amazonaws.com.
 [54.67.115.33]) by smtp.gmail.com with ESMTPSA id
 a16-20020a17090a6d9000b00234e6d2de3dsm1939453pjk.11.2023.03.14.09.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:23:19 -0700 (PDT)
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
X-Inumbo-ID: 889b8f2b-c284-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678810999;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyZOR7M0shknsR4NWPowbGfwBX4lUnbJT9Ylmftpbe0=;
        b=EyRhhgP7jlmu2KtI4xvqEhohRzcH5qkZp4kAY85eFs3yR6y1X70kzfuwGaxI+gtQnG
         cpR/9qODHb0VDzDAan71GqFcy3lkUWIfnn/B+nJ3Q4J15lqGDA9QvIJcbeQisM0CtfSc
         +Hp76FJ87xv50q9N2BqQni9oRejiT2NSqkD/XGeBRC0dNcFVFmIYDUblInAIUbiG3NNC
         h+6QycE9ZPO3WQ1FddHULfyzJAKEmcohjgf0NAifTFJDaQBhco2WyW69axkwTkE7mMkY
         8pWqHwRzLMyH/A6fSvIKcRy70QOYcyvVXSV8vz4vKNezBmKXAlZOJQOJjUQJzqO6YYbw
         KCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678810999;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZyZOR7M0shknsR4NWPowbGfwBX4lUnbJT9Ylmftpbe0=;
        b=usE5zn/daTe/C3AaHVEq437w8R9jID5WTp+aPadtxmd+TprsyOsp8ub0tYjyxNrSCV
         lRSADXQIMrbMP4OMW0u0RtkYkDwubG8TpaFILt7v/gbzdTlcjhnQZ1+6QFWpHEwVDjVx
         ZmtCh+kMZ45HbwVgRrr5FoCnRX51wSYnWDIvwAsv8rNnbyIpHJ+igcIpMNTLEA3hJfFm
         nZB+g+j11/IieZOHjysbmC6IbBZ7B/Vcy7VP5aRuqlin46siGcPih8zz6eLEVhJCqYqK
         qYD0naB2cxA2OsFCMBj2xb4+81RMuV8eBUtCgN0s5OjCjgu7NAFpNAw55pN1Jpuq0ajv
         Onlw==
X-Gm-Message-State: AO0yUKUOrfEeZ5pRiIJJOyfd/+id5WWMuANj42ATP7+e9jeR+sQu0W01
	tDR1vDLClKQTj4NJ4M8LYPE=
X-Google-Smtp-Source: AK7set/K25W/VpdXqlvlwU8EVJkLxPcVXlQACc5UCu9gpiKKVQ1nK71AUHZ7OpQTTMl3nmrS2ntumQ==
X-Received: by 2002:a17:90a:1982:b0:234:721e:51e5 with SMTP id 2-20020a17090a198200b00234721e51e5mr14332347pji.10.1678810999435;
        Tue, 14 Mar 2023 09:23:19 -0700 (PDT)
Date: Wed, 8 Mar 2023 15:26:28 +0000
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v1] xen/riscv: make calculation of stack address
 PC-relative
Message-ID: <ZAipJNBKzP1odgSm@bullseye>
References: <ad2249c1b5be01f99ef9c294a3264da0c9715bab.1678809641.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad2249c1b5be01f99ef9c294a3264da0c9715bab.1678809641.git.oleksii.kurochko@gmail.com>

On Tue, Mar 14, 2023 at 06:00:41PM +0200, Oleksii Kurochko wrote:
> The patch is needed to keep all addresses PC-relative.
> 
> Pseudoinstruction 'la' can be transformed to 'auipc/addi' or
> 'auipc/l{w|d}'. It depends on the .option directive: nopic and pic.
> 
> Right now, 'la' transforms to 'auipc/l{w|d}', which in case of
> cpu0_boot_stack[] will lead to the usage of _GLOBAL_OFFSET_TABLE_
> where all addresses will be without counting that it might happen
> that linker address != load address.
> 
> To be sure that SP is loaded always PC-relative address
> 'la' should be changed to 'lla', which always transforms to
> 'auipc/addi'.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/riscv/riscv64/head.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
> index 8887f0cbd4..e12d2a7cf3 100644
> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -27,7 +27,7 @@ ENTRY(start)
>          add     t3, t3, __SIZEOF_POINTER__
>          bltu    t3, t4, .L_clear_bss
>  
> -        la      sp, cpu0_boot_stack
> +        lla     sp, cpu0_boot_stack
>          li      t0, STACK_SIZE
>          add     sp, sp, t0
>  
> -- 
> 2.39.2
> 
> 

Reviewed-by: Bobby Eshleman <bobbyeshleman@gmail.com>

