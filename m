Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDCB608153
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 00:07:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428026.677758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1om0Ap-0006vz-E6; Fri, 21 Oct 2022 22:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428026.677758; Fri, 21 Oct 2022 22:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1om0Ap-0006u0-BJ; Fri, 21 Oct 2022 22:07:27 +0000
Received: by outflank-mailman (input) for mailman id 428026;
 Fri, 21 Oct 2022 22:07:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jmp5=2W=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1om0Ao-0006tu-4K
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 22:07:26 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be0d59ee-518c-11ed-91b5-6bf2151ebd3b;
 Sat, 22 Oct 2022 00:07:24 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id j7so7086835wrr.3
 for <xen-devel@lists.xenproject.org>; Fri, 21 Oct 2022 15:07:24 -0700 (PDT)
Received: from [192.168.1.93] (adsl-70.109.242.225.tellas.gr. [109.242.225.70])
 by smtp.gmail.com with ESMTPSA id
 l34-20020a05600c1d2200b003c6edc05159sm792761wms.1.2022.10.21.15.07.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 15:07:23 -0700 (PDT)
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
X-Inumbo-ID: be0d59ee-518c-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0fWkAaj/64/KGu+nvR8DXTnwG0ewY89q8R5CdE5ZIdU=;
        b=IZh3S4JOy0AKzGnUnUZM/ZtQR48BvqSNa8bXbB00CceY2K1DlMuow+QRn33upujkz5
         RAv34Ti0tduCKv8hEasnZ7w4fywmKv31Om7tTgn1A7k42roO+bbxgajPhd5TyfFZuR8g
         Y/gWSo0oXDUwl8G4sGyc3tqqKHI+NwWrNOoDUACJcRZtu6z7T0d9eMeWmuGoLt5dLmfl
         SXPR03sO1UJChyYpcxdVKb+RvExnsQibrqHYucvAT5IrZSGu+OFO852gEDPplHAZKosv
         +dhzuSDyK6f4WPRoc6CgzEMXnuJnhwWpES2X3QJEN8idaJLreqr2l3+Kndmy6kFhWU1R
         DJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0fWkAaj/64/KGu+nvR8DXTnwG0ewY89q8R5CdE5ZIdU=;
        b=dZlOja77RCaOTYzRBI4R8jHgl/ZeABgZZs6EyVHtBIfwgxXBdiQxMf2FDEObkXXkby
         y+vBxPhb9ZtZ/W52hoCCOBSh7BxkSayq/UotVX/OSqplyKmRQ2V2ALjjryPQojZjXOML
         InCh5Ix2LQfV7LsJLUiu6XQ1Wug8U9sIsefTpHt7SGT8BGTatIRYcJxU0SKpN/KWvSu1
         EHMsgqPonsr7aS4QPM1E/0WAE6RTIv5tYUUIjLCh2TuAFSvF84dBmsVgMRZGwe54bsrJ
         T4EWzWmcMtKE9US88CYHwCNUO3HPaauoAEs3ibTNedLUrcgA2t4PIPMU8V7VwTAirYLE
         FGcQ==
X-Gm-Message-State: ACrzQf3yfa5+qsx+NC64tDcjWGlVTG0n3lD9aoLS4y9aM6pUCacdDQfr
	wvwehcFSrh7p/qczczEfJt4=
X-Google-Smtp-Source: AMsMyM4R4UY+On0MBm7AFMnZs3L12yFoJsWKlMS9Ojr90JLNCD+ori15UrkX00Rryx8rSmzr5PyASQ==
X-Received: by 2002:a05:6000:170b:b0:22e:44d0:6bae with SMTP id n11-20020a056000170b00b0022e44d06baemr13452403wrc.99.1666390044100;
        Fri, 21 Oct 2022 15:07:24 -0700 (PDT)
Message-ID: <24feccd2-c90e-2abd-ebc3-4219bd15e380@gmail.com>
Date: Sat, 22 Oct 2022 01:07:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH v1 04/12] Arm: GICv3: Emulate GICR_TYPER on AArch32
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20221021153128.44226-1-ayankuma@amd.com>
 <20221021153128.44226-5-ayankuma@amd.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <20221021153128.44226-5-ayankuma@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/22 18:31, Ayan Kumar Halder wrote:
Hi Ayan

> Refer Arm IHI 0069H ID020922,
> The upper 32 bits of GICR_TYPER represent the affinity
> whereas the lower 32 bits represent the other bits (eg processor
> number, etc).
> MPIDR_AFFINITY_LEVEL() returns a 32 bit number on aarch32. Thus, this
> is appended to return GICR_TYPER register.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> ---
>   xen/arch/arm/vgic-v3.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index c31140eb20..d86b41a39f 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -190,14 +190,18 @@ static int __vgic_v3_rdistr_rd_mmio_read(struct vcpu *v, mmio_info_t *info,
>   
>       case VREG64(GICR_TYPER):
>       {
> -        uint64_t typer, aff;
> +        uint64_t typer;
> +        uint32_t aff;
>   
>           if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
> -        aff = (MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 3) << 56 |
> -               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 2) << 48 |
> -               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 1) << 40 |
> -               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 0) << 32);
> +        aff = (MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 3) << 24 |
> +               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 2) << 16 |
> +               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 1) << 8 |
> +               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 0));
>           typer = aff;
> +
> +        typer = typer << 32;
> +
>           /* We use the VCPU ID as the redistributor ID in bits[23:8] */
>           typer |= v->vcpu_id << GICR_TYPER_PROC_NUM_SHIFT;
>   

I don't see an issue I just want to propose alternatives that I think 
would reduce the changes, hopefully without breaking it.
So, other ways would be either to assign v->arch.vmpidr to a new 
variable uint64_t vmpidr and operate on this (without changing the 
shifts), or to leave the type of aff uint64_t, adjust the shifts and do 
typer = aff << 32.

-- 
Xenia

