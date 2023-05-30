Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AE4716A2C
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 18:58:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541290.843893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q42fN-0001Tz-VH; Tue, 30 May 2023 16:57:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541290.843893; Tue, 30 May 2023 16:57:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q42fN-0001RU-Qx; Tue, 30 May 2023 16:57:49 +0000
Received: by outflank-mailman (input) for mailman id 541290;
 Tue, 30 May 2023 16:57:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wXld=BT=gmail.com=bobbyeshleman@srs-se1.protection.inumbo.net>)
 id 1q42fM-0001RD-E2
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 16:57:48 +0000
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [2607:f8b0:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19aed878-ff0b-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 18:57:46 +0200 (CEST)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-64d2f99c8c3so3439286b3a.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 May 2023 09:57:46 -0700 (PDT)
Received: from localhost (ec2-52-9-159-93.us-west-1.compute.amazonaws.com.
 [52.9.159.93]) by smtp.gmail.com with ESMTPSA id
 k8-20020a635a48000000b0052cbd854927sm8830281pgm.18.2023.05.30.09.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 09:57:44 -0700 (PDT)
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
X-Inumbo-ID: 19aed878-ff0b-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685465865; x=1688057865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iuWqQbNxc4T0f/DD5bEBy0I3LDWfGOw8QZp3us3pmgE=;
        b=A9AvHKYUdzFNAqzJpECrFSlpog12ItecR62EC7N/160mH8oO/LuQof1MztDRk5ZlGP
         EvMiKoOoJhcTjrbStdshlQZXsAFeTamcUtvVxhNzFdKHGMuD0FNnQA0cgqXo//viZVA4
         mdrGfsDayef8NCSQVHWe5KjAR15R5qCAB494JPe9Lohd37WbSOZSQcoB7UoULy9SwrWN
         GWUJUGFLpHokW1d2XTye9RkbcjONc40tSbck382uhdiXBSSfdOkogXIdtOjRu6gv8KvW
         bTv5kWAeM338pA0ggXAoo3LHh+6mGoAxZZmkzNuCcmFDRvtkmodWW7n2DRYcEcMxCO0R
         t3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685465865; x=1688057865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iuWqQbNxc4T0f/DD5bEBy0I3LDWfGOw8QZp3us3pmgE=;
        b=dcMYtrWqylYxOpetn/lxRztKPicI0we+jsFlVlyuB/eXw4yDseHax/4wAXqzboe3GA
         yxodwCIl8HaX5o4DCUrbfcJifyaZNsoTLRNnQ9OaB5FVcL5NlyqWPKIisydjeH6PWWW1
         id+VVAZNuFs8cwwj15vLDSA5u5Stn0zZfIQxEQnxp/rDhl4+5+bEkn2RI7LjSJYbsKNx
         KCbXzbRX+KDSRqyxiQYkiZ6boKPV4G67pkfkSOKOmWhg3ma/H7BVgkCz3qtcifPPCgrI
         s00m0X13RRK5m0flM7yu+OjqbmmQOfu792Jg6aNOFfFyXmqRxrV/8/1ssyQp5yqLRBII
         qJ5A==
X-Gm-Message-State: AC+VfDxVr+cnZX1Pa5vEr6TRV4n+8IdhR/zb1ju/TSFBbZa0Zf7Sxwc/
	ZNQUXFlDI33zZsGss64OQoY=
X-Google-Smtp-Source: ACHHUZ4M9TQT1zLBpaeWEjnKr3UQ82+8kna3FkFH5W/yTFjYxZnzHn7aNfvFkFOw6DtihRA3RxdRBw==
X-Received: by 2002:a05:6a20:8e1d:b0:10e:96b5:45fa with SMTP id y29-20020a056a208e1d00b0010e96b545famr2942711pzj.43.1685465865016;
        Tue, 30 May 2023 09:57:45 -0700 (PDT)
Date: Tue, 30 May 2023 09:57:40 +0000
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v9 1/5] xen/riscv: add VM space layout
Message-ID: <ZHXIlG3bS437Dpow@bullseye>
References: <cover.1685027257.git.oleksii.kurochko@gmail.com>
 <1621fd09987d20b3233132d422e5c9dfe300e3f7.1685027257.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621fd09987d20b3233132d422e5c9dfe300e3f7.1685027257.git.oleksii.kurochko@gmail.com>

On Thu, May 25, 2023 at 06:28:14PM +0300, Oleksii Kurochko wrote:
> Also it was added explanation about ignoring of top VA bits
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V9:
>  - Update comment for VM layout description.
> ---
> Changes in V8:
>  - Add "#ifdef RV_STAGE1_MODE == SATP_MODE_SV39" instead of "#ifdef SV39"
>    in the comment to VM layout description.
>  - Update the upper bound of direct map area in VM layout description.
> ---
> Changes in V7:
>  - Fix range of frametable range in RV64 layout.
>  - Add ifdef SV39 to the RV64 layout comment to make it explicit that
>    description if for SV39 mode.
>  - Add missed row in the RV64 layout table.
> ---
> Changes in V6:
>  - update comment above the RISCV-64 layout table
>  - add Slot column to the table with RISCV-64 Layout
>  - update RV-64 layout table.
> ---
> Changes in V5:
> * the patch was introduced in the current patch series.
> ---
>  xen/arch/riscv/include/asm/config.h | 36 +++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
> index 763a922a04..9900d29dab 100644
> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -4,6 +4,42 @@
>  #include <xen/const.h>
>  #include <xen/page-size.h>
>  
> +/*
> + * RISC-V64 Layout:
> + *
> +#if RV_STAGE1_MODE == SATP_MODE_SV39
> + *
> + * From the riscv-privileged doc:
> + *   When mapping between narrower and wider addresses,
> + *   RISC-V zero-extends a narrower physical address to a wider size.
> + *   The mapping between 64-bit virtual addresses and the 39-bit usable
> + *   address space of Sv39 is not based on zero-extension but instead
> + *   follows an entrenched convention that allows an OS to use one or
> + *   a few of the most-significant bits of a full-size (64-bit) virtual
> + *   address to quickly distinguish user and supervisor address regions.
> + *
> + * It means that:
> + *   top VA bits are simply ignored for the purpose of translating to PA.
> + *
> + * ============================================================================
> + *    Start addr    |   End addr        |  Size  | Slot       |area description
> + * ============================================================================
> + * FFFFFFFFC0800000 |  FFFFFFFFFFFFFFFF |1016 MB | L2 511     | Unused
> + * FFFFFFFFC0600000 |  FFFFFFFFC0800000 |  2 MB  | L2 511     | Fixmap
> + * FFFFFFFFC0200000 |  FFFFFFFFC0600000 |  4 MB  | L2 511     | FDT
> + * FFFFFFFFC0000000 |  FFFFFFFFC0200000 |  2 MB  | L2 511     | Xen
> + *                 ...                  |  1 GB  | L2 510     | Unused
> + * 0000003200000000 |  0000007F80000000 | 309 GB | L2 200-509 | Direct map
> + *                 ...                  |  1 GB  | L2 199     | Unused
> + * 0000003100000000 |  00000031C0000000 |  3 GB  | L2 196-198 | Frametable
> + *                 ...                  |  1 GB  | L2 195     | Unused
> + * 0000003080000000 |  00000030C0000000 |  1 GB  | L2 194     | VMAP
> + *                 ...                  | 194 GB | L2 0 - 193 | Unused
> + * ============================================================================
> + *
> +#endif
> + */
> +
>  #if defined(CONFIG_RISCV_64)
>  # define LONG_BYTEORDER 3
>  # define ELFSIZE 64
> -- 
> 2.40.1
> 
> 

Acked-by: Bobby Eshleman <bobbyeshleman@gmail.com>

