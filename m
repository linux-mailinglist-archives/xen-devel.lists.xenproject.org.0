Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F1244A833
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 09:14:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223787.386664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkMGG-0006qA-Cr; Tue, 09 Nov 2021 08:13:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223787.386664; Tue, 09 Nov 2021 08:13:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkMGG-0006nP-9h; Tue, 09 Nov 2021 08:13:44 +0000
Received: by outflank-mailman (input) for mailman id 223787;
 Tue, 09 Nov 2021 08:13:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nz9x=P4=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mkMGE-0006nJ-Pw
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 08:13:43 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f29195ac-4134-11ec-a9d2-d9f7a1cc8784;
 Tue, 09 Nov 2021 09:13:40 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 b2-20020a1c8002000000b0032fb900951eso1196519wmd.4
 for <xen-devel@lists.xenproject.org>; Tue, 09 Nov 2021 00:13:40 -0800 (PST)
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
X-Inumbo-ID: f29195ac-4134-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jpmXVyrn6nlBR/3K4cvQlgcFaHExfRoZmR8Q1Mbt6sM=;
        b=YW9G8Za3cuQ4NqSv8beNBb3ORx5AGbe36xfOrkEpPX+v+dfL8oWaoCZCzW629B9aMK
         CFB7damptFqLrEUvuNnmZa5yMDfUXUEwIzR4WuN6N+sZEEoT4fC2+wgk/gnyaFeFFcqr
         oe80oiRRvqPt1606UQ6DluZEIRC6W4FtfdKw+d66O/MyjNhEc5tGQZ5rwWKbmoSWyAO5
         JOi9tiNFDSKTEbrDt62z2kcn0ICe/7IR0TjKhPeD6J5DLwXn/YsPhV8RQlaaP+d26WLo
         Kjnq1TTRm+UJyzRQQDRhlyni0Vs3w54VrTN9f7LbdcONHXiYPF8fbKdSeYNlf0+S0kf4
         wvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jpmXVyrn6nlBR/3K4cvQlgcFaHExfRoZmR8Q1Mbt6sM=;
        b=IFkibTbUzve41Qp013L57fxM3v0CdHFuj2EOPkoN7PuKGb75OZg8gf6+2HWhtpdD8v
         myUGBGG72bf1HMZvLfMOc2HzDDxDFKP/rnAjn2hFVnBlHVIuWqO74aXZ8ey/j4O3jNqu
         AVfhYOQMlo0/IPcclnVG6NalXBf6POjO+GMPb/bGUwfB9FeB9wy9JzEw38hkfUmM0Hcm
         LBB5dmSh/Onv5L/3n7d3Wz6eJBrYA/ZKwYM8jV0EmxCC28GcVNFHnf+61eLS9G7krr+z
         BzGiWU2IslWTw/27v/4bnG7rNwiyd1jkYS3b6KagkKPdekNvVfOhYAx3JvyXH6Au+ERk
         hE7g==
X-Gm-Message-State: AOAM530ONDYG2lzEWLDckp2r96DBG0M7HjIUckFZcAy+d+6nUWv/nWll
	Snlx9MqMSW2syqrJuWP0NvLkwcsuDUhuI8mhReg=
X-Google-Smtp-Source: ABdhPJzIEuDSaCGSRf8U51gqFPEkw47ZxB2mZYPHTYhSCaZhF5aj0U0tpBUMYlcil+Hi4lAOdRVnfRy9KbUo7hEeNrc=
X-Received: by 2002:a1c:9ad4:: with SMTP id c203mr5074964wme.23.1636445620149;
 Tue, 09 Nov 2021 00:13:40 -0800 (PST)
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2111081430090.3317@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2111081430090.3317@ubuntu-linux-20-04-desktop>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Tue, 9 Nov 2021 10:13:29 +0200
Message-ID: <CAPD2p-no4bkMoc92PmovoienB7NzOLTxU7Y91uPM-z=kd_f2aQ@mail.gmail.com>
Subject: Re: ASSERT in rangeset_remove_range
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Ian Jackson <iwj@xenproject.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000e2219d05d056af71"

--000000000000e2219d05d056af71
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 9, 2021 at 12:45 AM Stefano Stabellini <sstabellini@kernel.org>
wrote:

> Hi Oleksandr, Julien,
>

Hi Stefano, Julien.

[Sorry for the possible format issues]


>
> I discovered a bug caused by the recent changes to introduce extended
> regions in make_hypervisor_node (more logs appended):
>
>
> (XEN) d1 BANK[0] 0x00000040000000-0x0000007e800000 (1000MB)
> (XEN) d1 BANK[1] 0x00000200000000-0x00000200000000 (0MB)
> (XEN) DEBUG find_unallocated_memory 994 s=40000000 e=7e7fffff
> (XEN) DEBUG find_unallocated_memory 994 s=200000000 e=1ffffffff
> (XEN) Assertion 's <= e' failed at rangeset.c:189
>
>
> When a bank of memory is zero in size, then rangeset_remove_range is
> called with end < start, triggering an ASSERT in rangeset_remove_range.
>
> One solution is to avoid creating 0 size banks. The following change
> does that:
>
>
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 49b4eb2b13..3efe542d0f 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -459,9 +459,12 @@ static void __init allocate_memory(struct domain *d,
> struct kernel_info *kinfo)
>          goto fail;
>
>      bank_size = MIN(GUEST_RAM1_SIZE, kinfo->unassigned_mem);
> -    if ( !allocate_bank_memory(d, kinfo, gaddr_to_gfn(GUEST_RAM1_BASE),
> +    if ( bank_size > 0 )
> +    {
> +        if ( !allocate_bank_memory(d, kinfo,
> gaddr_to_gfn(GUEST_RAM1_BASE),
>                                 bank_size) )
> -        goto fail;
> +            goto fail;
> +    }
>
>      if ( kinfo->unassigned_mem )
>          goto fail;
>
>
>
> We have a couple of other options too:
>
> - remove the ASSERT in rangeset_remove_range
> There is an argument that we should simply return error
> fromrangeset_remove_range, rather than a full assert.
>
> - add a if (end > start) check before calling rangeset_remove_range
> We could check that end > start before calling rangeset_remove_range at
> all the call sites in domain_build.c. There are 5 call sites at the
> moment.
>
> Any other ideas or suggestions?
>


Personally I would avoid creating zero-sized banks (your first solution) as
I don't see any point in taking them into the account and exposing them to
the guest.

What I don't understand is how this assert is triggered by upstream Xen
(how the make_hypervisor_node() gets called for DomU)? Do you have some
changes on top?



>
> Cheers,
>
> Stefano
>
>
>
> (XEN) DEBUG find_memory_holes 1126 s=ff990000 e=ff990fff
> (XEN) DEBUG find_memory_holes 1126 s=ff990000 e=ff990fff
> (XEN) DEBUG find_memory_holes 1126 s=ff990000 e=ff990fff
> (XEN) DEBUG find_memory_holes 1126 s=ff990000 e=ff990fff
> (XEN) DEBUG find_memory_holes 1126 s=f9010000 e=f901ffff
> (XEN) DEBUG find_memory_holes 1126 s=f9020000 e=f903ffff
> (XEN) DEBUG find_memory_holes 1126 s=f9040000 e=f905ffff
> (XEN) DEBUG find_memory_holes 1126 s=f9060000 e=f907ffff
> (XEN) DEBUG find_memory_holes 1126 s=fd800000 e=fd81ffff
> (XEN) DEBUG find_memory_holes 1126 s=ff060000 e=ff060fff
> (XEN) DEBUG find_memory_holes 1126 s=ff070000 e=ff070fff
> (XEN) DEBUG find_memory_holes 1126 s=fd6e0000 e=fd6e8fff
> (XEN) DEBUG find_memory_holes 1126 s=fd6e9000 e=fd6edfff
> (XEN) DEBUG find_memory_holes 1126 s=fd500000 e=fd500fff
> (XEN) DEBUG find_memory_holes 1126 s=fd510000 e=fd510fff
> (XEN) DEBUG find_memory_holes 1126 s=fd520000 e=fd520fff
> (XEN) DEBUG find_memory_holes 1126 s=fd530000 e=fd530fff
> (XEN) DEBUG find_memory_holes 1126 s=fd540000 e=fd540fff
> (XEN) DEBUG find_memory_holes 1126 s=fd550000 e=fd550fff
> (XEN) DEBUG find_memory_holes 1126 s=fd560000 e=fd560fff
> (XEN) DEBUG find_memory_holes 1126 s=fd570000 e=fd570fff
> (XEN) DEBUG find_memory_holes 1126 s=fd4b0000 e=fd4bffff
> (XEN) DEBUG find_memory_holes 1126 s=ffa80000 e=ffa80fff
> (XEN) DEBUG find_memory_holes 1126 s=ffa90000 e=ffa90fff
> (XEN) DEBUG find_memory_holes 1126 s=ffaa0000 e=ffaa0fff
> (XEN) DEBUG find_memory_holes 1126 s=ffab0000 e=ffab0fff
> (XEN) DEBUG find_memory_holes 1126 s=ffac0000 e=ffac0fff
> (XEN) DEBUG find_memory_holes 1126 s=ffad0000 e=ffad0fff
> (XEN) DEBUG find_memory_holes 1126 s=ffae0000 e=ffae0fff
> (XEN) DEBUG find_memory_holes 1126 s=ffaf0000 e=ffaf0fff
> (XEN) DEBUG find_memory_holes 1126 s=fd070000 e=fd09ffff
> (XEN) DEBUG find_memory_holes 1126 s=ff100000 e=ff100fff
> (XEN) DEBUG find_memory_holes 1126 s=ff0b0000 e=ff0b0fff
> (XEN) DEBUG find_memory_holes 1126 s=ff0c0000 e=ff0c0fff
> (XEN) DEBUG find_memory_holes 1126 s=ff0d0000 e=ff0d0fff
> (XEN) DEBUG find_memory_holes 1126 s=ff0e0000 e=ff0e0fff
> (XEN) DEBUG find_memory_holes 1126 s=ff0a0000 e=ff0a0fff
> (XEN) DEBUG find_memory_holes 1126 s=ff020000 e=ff020fff
> (XEN) DEBUG find_memory_holes 1126 s=ff030000 e=ff030fff
> (XEN) DEBUG find_memory_holes 1126 s=ff960000 e=ff960fff
> (XEN) DEBUG find_memory_holes 1126 s=ffa00000 e=ffa0ffff
> (XEN) DEBUG find_memory_holes 1126 s=fd0b0000 e=fd0bffff
> (XEN) DEBUG find_memory_holes 1126 s=fd490000 e=fd49ffff
> (XEN) DEBUG find_memory_holes 1126 s=ffa10000 e=ffa1ffff
> (XEN) DEBUG find_memory_holes 1126 s=fd0e0000 e=fd0e0fff
> (XEN) DEBUG find_memory_holes 1126 s=fd480000 e=fd480fff
> (XEN) DEBUG find_memory_holes 1126 s=8000000000 e=8000ffffff
> (XEN) DEBUG handle_pci_range 1056 s=e0000000 e=efffffff
> (XEN) DEBUG handle_pci_range 1056 s=600000000 e=7ffffffff
> (XEN) DEBUG find_memory_holes 1126 s=ff0f0000 e=ff0f0fff
> (XEN) DEBUG find_memory_holes 1126 s=c0000000 e=c7ffffff
> (XEN) DEBUG find_memory_holes 1126 s=ffa60000 e=ffa60fff
> (XEN) DEBUG find_memory_holes 1126 s=fd400000 e=fd43ffff
> (XEN) DEBUG find_memory_holes 1126 s=fd3d0000 e=fd3d0fff
> (XEN) DEBUG find_memory_holes 1126 s=fd0c0000 e=fd0c1fff
> (XEN) DEBUG find_memory_holes 1126 s=ff160000 e=ff160fff
> (XEN) DEBUG find_memory_holes 1126 s=ff170000 e=ff170fff
> (XEN) DEBUG find_memory_holes 1126 s=ff040000 e=ff040fff
> (XEN) DEBUG find_memory_holes 1126 s=ff050000 e=ff050fff
> (XEN) DEBUG find_memory_holes 1126 s=ff110000 e=ff110fff
> (XEN) DEBUG find_memory_holes 1126 s=ff120000 e=ff120fff
> (XEN) DEBUG find_memory_holes 1126 s=ff130000 e=ff130fff
> (XEN) DEBUG find_memory_holes 1126 s=ff140000 e=ff140fff
> (XEN) DEBUG find_memory_holes 1126 s=ff000000 e=ff000fff
> (XEN) DEBUG find_memory_holes 1126 s=ff010000 e=ff010fff
> (XEN) DEBUG find_memory_holes 1126 s=ff9d0000 e=ff9d0fff
> (XEN) DEBUG find_memory_holes 1126 s=fe200000 e=fe23ffff
> (XEN) DEBUG find_memory_holes 1126 s=ff9e0000 e=ff9e0fff
> (XEN) DEBUG find_memory_holes 1126 s=fe300000 e=fe33ffff
> (XEN) DEBUG find_memory_holes 1126 s=fd4d0000 e=fd4d0fff
> (XEN) DEBUG find_memory_holes 1126 s=ff150000 e=ff150fff
> (XEN) DEBUG find_memory_holes 1126 s=ffa50000 e=ffa50fff
> (XEN) DEBUG find_memory_holes 1126 s=ffa50000 e=ffa50fff
> (XEN) DEBUG find_memory_holes 1126 s=ffa50000 e=ffa50fff
> (XEN) DEBUG find_memory_holes 1126 s=fd4c0000 e=fd4c0fff
> (XEN) DEBUG find_memory_holes 1126 s=fd4a0000 e=fd4a0fff
> (XEN) DEBUG find_memory_holes 1126 s=fd4aa000 e=fd4aafff
> (XEN) DEBUG find_memory_holes 1126 s=fd4ab000 e=fd4abfff
> (XEN) DEBUG find_memory_holes 1126 s=fd4ac000 e=fd4acfff
> (XEN) DEBUG find_memory_holes 1126 s=0 e=7fefffff
> (XEN) DEBUG find_memory_holes 1126 s=800000000 e=87fffffff
> (XEN) Extended region 0: 0x80000000->0xc0000000
> (XEN) Extended region 1: 0xc8000000->0xe0000000
> (XEN) Extended region 2: 0xf0000000->0xf9000000
> (XEN) Extended region 3: 0xffc00000->0x600000000
> (XEN) Extended region 4: 0x880000000->0x8000000000
> (XEN) Extended region 5: 0x8001000000->0x10000000000
> (XEN) Loading zImage from 0000000000e00000 to
> 0000000020000000-0000000021367a00
> (XEN) Loading d0 initrd from 0000000002200000 to
> 0x0000000028200000-0x00000000293f936d
> (XEN) Loading d0 DTB to 0x0000000028000000-0x0000000028009604
> (XEN) *** LOADING DOMU cpus=1 memory=fa000KB ***
> (XEN) Loading d1 kernel from boot module @ 0000000003400000
> (XEN) Loading ramdisk from boot module @ 0000000004800000
> (XEN) Allocating mappings totalling 1000MB for d1:
> (XEN) d1 BANK[0] 0x00000040000000-0x0000007e800000 (1000MB)
> (XEN) d1 BANK[1] 0x00000200000000-0x00000200000000 (0MB)
> (XEN) DEBUG find_unallocated_memory 994 s=40000000 e=7e7fffff
> (XEN) DEBUG find_unallocated_memory 994 s=200000000 e=1ffffffff
> (XEN) Assertion 's <= e' failed at rangeset.c:189
> (XEN) ----[ Xen-4.16-rc  arm64  debug=y  Not tainted ]----
> (XEN) CPU:    0
> (XEN) PC:     0000000000220e6c rangeset_remove_range+0xbc/0x2bc
> (XEN) LR:     00000000002cd508
> (XEN) SP:     0000000000306f60
> (XEN) CPSR:   0000000020000249 MODE:64-bit EL2h (Hypervisor, handler)
> (XEN)      X0: 00008000fbf61e70  X1: 0000000200000000  X2: 00000001ffffffff
> (XEN)      X3: 0000000000000005  X4: 0000000000000000  X5: 0000000000000028
> (XEN)      X6: 0000000000000080  X7: fefefefefefeff09  X8: 7f7f7f7f7f7f7f7f
> (XEN)      X9: 717164616f726051 X10: 7f7f7f7f7f7f7f7f X11: 0101010101010101
> (XEN)     X12: 0000000000000008 X13: 0000000000000009 X14: 0000000000306cb8
> (XEN)     X15: 0000000000000020 X16: 000000000028c5a8 X17: 0000000000000000
> (XEN)     X18: 0180000000000000 X19: 00000001ffffffff X20: 0000000000000001
> (XEN)     X21: 0000000200000000 X22: 0000000200000000 X23: 0000000000000002
> (XEN)     X24: 0000000000000002 X25: 00000000003070e0 X26: 00000000002d9e68
> (XEN)     X27: 00000000002d8d18 X28: 00008000fbf40000  FP: 0000000000306f60
> (XEN)
> (XEN)   VTCR_EL2: 0000000080023558
> (XEN)  VTTBR_EL2: 0000000000000000
> (XEN)
> (XEN)  SCTLR_EL2: 0000000030cd183d
> (XEN)    HCR_EL2: 0000000000000038
> (XEN)  TTBR0_EL2: 0000000004b45000
> (XEN)
> (XEN)    ESR_EL2: 00000000f2000001
> (XEN)  HPFAR_EL2: 0000000000000000
> (XEN)    FAR_EL2: 0000000000000000
> (XEN)
> (XEN) Xen stack trace from sp=0000000000306f60:
> (XEN)    0000000000307040 00000000002cf2a8 00008000fbf5a000
> 0000000000000000
> (XEN)    00008000fbf40000 00000000003070a8 0000000000307de4
> 00000000002aa078
> (XEN)    0000000880000000 0000000000000002 00000000002e8d08
> 00000000000fff00
> (XEN)    00008000fbf61e70 00008000fbf5a000 00008000fbf61220
> 0000000000000000
> (XEN)    0000000000307040 00000000002cf288 00008000fbf5a000
> 0000000000000000
> (XEN)    00008000fbf40000 00000000003070a8 0000000000307de4
> 65782c32766e6578
> (XEN)    000000000030006e 2d6e65782c6e6578 6e65780036312e34
> 000000006e65782c
> (XEN)    0000000000307d80 00000000002d0440 00008000fbfd95a0
> 0000000000307dc8
> (XEN)    00000000002d99b8 00000000002da338 0000000000307de4
> 00000000002aa078
> (XEN)    000000000000000f 0000000000307110 0000000000000001
> 00c2010000000002
> (XEN)    00000000003070c8 0000000000000000 6d933f29040f0000
> 0000002200000000
> (XEN)    0010000000000000 0020000300000000 0020000000000000
> 00000000000fa000
> (XEN)    0000000000000001 00008000fbf5a000 00008000fbf40000
> 0000000000000000
> (XEN)    0000000000000002 0000000040000000 000000003e800000
> 0000000000000000
> (XEN)    0000000200000000 0000000000000000 0000000000000000
> 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000
> 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000
> 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000
> 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000
> 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000
> 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000
> 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000
> 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000
> 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000
> 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000
> 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000
> 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000
> 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000
> 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000
> 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000
> 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000
> 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000
> 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000
> 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000
> 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000
> 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000
> 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000
> 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000
> 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000
> 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000
> 0000000000000000
> (XEN) Xen call trace:
> (XEN)    [<0000000000220e6c>] rangeset_remove_range+0xbc/0x2bc (PC)
> (XEN)    [<00000000002cd508>]
> domain_build.c#make_hypervisor_node+0x258/0x7f4 (LR)
> (XEN)    [<00000000002cf2a8>] domain_build.c#construct_domU+0x9cc/0xa8c
> (XEN)    [<00000000002d0440>] create_domUs+0xe8/0x224
> (XEN)    [<00000000002d4988>] start_xen+0xafc/0xbf0
> (XEN)    [<00000000002001a0>] arm64/head.o#primary_switched+0xc/0x1c
> (XEN)
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) Assertion 's <= e' failed at rangeset.c:189
> (XEN) ****************************************
>
>

-- 
Regards,

Oleksandr Tyshchenko

--000000000000e2219d05d056af71
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 9, 2021 at 12:45 AM Stefa=
no Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabellini@ker=
nel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Hi Oleksandr, Julien,<br></blockquote><div><br></div><div>Hi Stefano=
, Julien.</div><div><br></div><div>[Sorry for the possible format issues]</=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I discovered a bug caused by the recent changes to introduce extended<br>
regions in make_hypervisor_node (more logs appended):<br>
<br>
<br>
(XEN) d1 BANK[0] 0x00000040000000-0x0000007e800000 (1000MB)<br>
(XEN) d1 BANK[1] 0x00000200000000-0x00000200000000 (0MB)<br>
(XEN) DEBUG find_unallocated_memory 994 s=3D40000000 e=3D7e7fffff<br>
(XEN) DEBUG find_unallocated_memory 994 s=3D200000000 e=3D1ffffffff<br>
(XEN) Assertion &#39;s &lt;=3D e&#39; failed at rangeset.c:189<br>
<br>
<br>
When a bank of memory is zero in size, then rangeset_remove_range is<br>
called with end &lt; start, triggering an ASSERT in rangeset_remove_range.<=
br>
<br>
One solution is to avoid creating 0 size banks. The following change<br>
does that:<br>
<br>
<br>
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c<br>
index 49b4eb2b13..3efe542d0f 100644<br>
--- a/xen/arch/arm/domain_build.c<br>
+++ b/xen/arch/arm/domain_build.c<br>
@@ -459,9 +459,12 @@ static void __init allocate_memory(struct domain *d, s=
truct kernel_info *kinfo)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
<br>
=C2=A0 =C2=A0 =C2=A0bank_size =3D MIN(GUEST_RAM1_SIZE, kinfo-&gt;unassigned=
_mem);<br>
-=C2=A0 =C2=A0 if ( !allocate_bank_memory(d, kinfo, gaddr_to_gfn(GUEST_RAM1=
_BASE),<br>
+=C2=A0 =C2=A0 if ( bank_size &gt; 0 )<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( !allocate_bank_memory(d, kinfo, gaddr_to_=
gfn(GUEST_RAM1_BASE),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bank_size) )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0if ( kinfo-&gt;unassigned_mem )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
<br>
<br>
<br>
We have a couple of other options too:<br>
<br>
- remove the ASSERT in rangeset_remove_range<br>
There is an argument that we should simply return error<br>
fromrangeset_remove_range, rather than a full assert.<br>
<br>
- add a if (end &gt; start) check before calling rangeset_remove_range<br>
We could check that end &gt; start before calling rangeset_remove_range at<=
br>
all the call sites in domain_build.c. There are 5 call sites at the<br>
moment.<br>
<br>
Any other ideas or suggestions?<br></blockquote><div><br></div><div><br></d=
iv><div>Personally I would avoid creating zero-sized banks (your first solu=
tion) as I don&#39;t see any point in taking them into the account and expo=
sing them to the guest.</div><div><br>What I don&#39;t understand is how th=
is assert=C2=A0is triggered by upstream=C2=A0Xen (how the make_hypervisor_n=
ode() gets called for DomU)? Do you have some changes on top?<br></div><div=
><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
Cheers,<br>
<br>
Stefano<br>
<br>
<br>
<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dff990000 e=3Dff990fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dff990000 e=3Dff990fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dff990000 e=3Dff990fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dff990000 e=3Dff990fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Df9010000 e=3Df901ffff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Df9020000 e=3Df903ffff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Df9040000 e=3Df905ffff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Df9060000 e=3Df907ffff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dfd800000 e=3Dfd81ffff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dff060000 e=3Dff060fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dff070000 e=3Dff070fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dfd6e0000 e=3Dfd6e8fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dfd6e9000 e=3Dfd6edfff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dfd500000 e=3Dfd500fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dfd510000 e=3Dfd510fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dfd520000 e=3Dfd520fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dfd530000 e=3Dfd530fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dfd540000 e=3Dfd540fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dfd550000 e=3Dfd550fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dfd560000 e=3Dfd560fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dfd570000 e=3Dfd570fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dfd4b0000 e=3Dfd4bffff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dffa80000 e=3Dffa80fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dffa90000 e=3Dffa90fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dffaa0000 e=3Dffaa0fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dffab0000 e=3Dffab0fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dffac0000 e=3Dffac0fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dffad0000 e=3Dffad0fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dffae0000 e=3Dffae0fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dffaf0000 e=3Dffaf0fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dfd070000 e=3Dfd09ffff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dff100000 e=3Dff100fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dff0b0000 e=3Dff0b0fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dff0c0000 e=3Dff0c0fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dff0d0000 e=3Dff0d0fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dff0e0000 e=3Dff0e0fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dff0a0000 e=3Dff0a0fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dff020000 e=3Dff020fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dff030000 e=3Dff030fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dff960000 e=3Dff960fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dffa00000 e=3Dffa0ffff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dfd0b0000 e=3Dfd0bffff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dfd490000 e=3Dfd49ffff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dffa10000 e=3Dffa1ffff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dfd0e0000 e=3Dfd0e0fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dfd480000 e=3Dfd480fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3D8000000000 e=3D8000ffffff<br>
(XEN) DEBUG handle_pci_range 1056 s=3De0000000 e=3Defffffff<br>
(XEN) DEBUG handle_pci_range 1056 s=3D600000000 e=3D7ffffffff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dff0f0000 e=3Dff0f0fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dc0000000 e=3Dc7ffffff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dffa60000 e=3Dffa60fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dfd400000 e=3Dfd43ffff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dfd3d0000 e=3Dfd3d0fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dfd0c0000 e=3Dfd0c1fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dff160000 e=3Dff160fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dff170000 e=3Dff170fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dff040000 e=3Dff040fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dff050000 e=3Dff050fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dff110000 e=3Dff110fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dff120000 e=3Dff120fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dff130000 e=3Dff130fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dff140000 e=3Dff140fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dff000000 e=3Dff000fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dff010000 e=3Dff010fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dff9d0000 e=3Dff9d0fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dfe200000 e=3Dfe23ffff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dff9e0000 e=3Dff9e0fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dfe300000 e=3Dfe33ffff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dfd4d0000 e=3Dfd4d0fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dff150000 e=3Dff150fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dffa50000 e=3Dffa50fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dffa50000 e=3Dffa50fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dffa50000 e=3Dffa50fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dfd4c0000 e=3Dfd4c0fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dfd4a0000 e=3Dfd4a0fff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dfd4aa000 e=3Dfd4aafff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dfd4ab000 e=3Dfd4abfff<br>
(XEN) DEBUG find_memory_holes 1126 s=3Dfd4ac000 e=3Dfd4acfff<br>
(XEN) DEBUG find_memory_holes 1126 s=3D0 e=3D7fefffff<br>
(XEN) DEBUG find_memory_holes 1126 s=3D800000000 e=3D87fffffff<br>
(XEN) Extended region 0: 0x80000000-&gt;0xc0000000<br>
(XEN) Extended region 1: 0xc8000000-&gt;0xe0000000<br>
(XEN) Extended region 2: 0xf0000000-&gt;0xf9000000<br>
(XEN) Extended region 3: 0xffc00000-&gt;0x600000000<br>
(XEN) Extended region 4: 0x880000000-&gt;0x8000000000<br>
(XEN) Extended region 5: 0x8001000000-&gt;0x10000000000<br>
(XEN) Loading zImage from 0000000000e00000 to 0000000020000000-000000002136=
7a00<br>
(XEN) Loading d0 initrd from 0000000002200000 to 0x0000000028200000-0x00000=
000293f936d<br>
(XEN) Loading d0 DTB to 0x0000000028000000-0x0000000028009604<br>
(XEN) *** LOADING DOMU cpus=3D1 memory=3Dfa000KB ***<br>
(XEN) Loading d1 kernel from boot module @ 0000000003400000<br>
(XEN) Loading ramdisk from boot module @ 0000000004800000<br>
(XEN) Allocating mappings totalling 1000MB for d1:<br>
(XEN) d1 BANK[0] 0x00000040000000-0x0000007e800000 (1000MB)<br>
(XEN) d1 BANK[1] 0x00000200000000-0x00000200000000 (0MB)<br>
(XEN) DEBUG find_unallocated_memory 994 s=3D40000000 e=3D7e7fffff<br>
(XEN) DEBUG find_unallocated_memory 994 s=3D200000000 e=3D1ffffffff<br>
(XEN) Assertion &#39;s &lt;=3D e&#39; failed at rangeset.c:189<br>
(XEN) ----[ Xen-4.16-rc=C2=A0 arm64=C2=A0 debug=3Dy=C2=A0 Not tainted ]----=
<br>
(XEN) CPU:=C2=A0 =C2=A0 0<br>
(XEN) PC:=C2=A0 =C2=A0 =C2=A00000000000220e6c rangeset_remove_range+0xbc/0x=
2bc<br>
(XEN) LR:=C2=A0 =C2=A0 =C2=A000000000002cd508<br>
(XEN) SP:=C2=A0 =C2=A0 =C2=A00000000000306f60<br>
(XEN) CPSR:=C2=A0 =C2=A00000000020000249 MODE:64-bit EL2h (Hypervisor, hand=
ler)<br>
(XEN)=C2=A0 =C2=A0 =C2=A0 X0: 00008000fbf61e70=C2=A0 X1: 0000000200000000=
=C2=A0 X2: 00000001ffffffff<br>
(XEN)=C2=A0 =C2=A0 =C2=A0 X3: 0000000000000005=C2=A0 X4: 0000000000000000=
=C2=A0 X5: 0000000000000028<br>
(XEN)=C2=A0 =C2=A0 =C2=A0 X6: 0000000000000080=C2=A0 X7: fefefefefefeff09=
=C2=A0 X8: 7f7f7f7f7f7f7f7f<br>
(XEN)=C2=A0 =C2=A0 =C2=A0 X9: 717164616f726051 X10: 7f7f7f7f7f7f7f7f X11: 0=
101010101010101<br>
(XEN)=C2=A0 =C2=A0 =C2=A0X12: 0000000000000008 X13: 0000000000000009 X14: 0=
000000000306cb8<br>
(XEN)=C2=A0 =C2=A0 =C2=A0X15: 0000000000000020 X16: 000000000028c5a8 X17: 0=
000000000000000<br>
(XEN)=C2=A0 =C2=A0 =C2=A0X18: 0180000000000000 X19: 00000001ffffffff X20: 0=
000000000000001<br>
(XEN)=C2=A0 =C2=A0 =C2=A0X21: 0000000200000000 X22: 0000000200000000 X23: 0=
000000000000002<br>
(XEN)=C2=A0 =C2=A0 =C2=A0X24: 0000000000000002 X25: 00000000003070e0 X26: 0=
0000000002d9e68<br>
(XEN)=C2=A0 =C2=A0 =C2=A0X27: 00000000002d8d18 X28: 00008000fbf40000=C2=A0 =
FP: 0000000000306f60<br>
(XEN) <br>
(XEN)=C2=A0 =C2=A0VTCR_EL2: 0000000080023558<br>
(XEN)=C2=A0 VTTBR_EL2: 0000000000000000<br>
(XEN) <br>
(XEN)=C2=A0 SCTLR_EL2: 0000000030cd183d<br>
(XEN)=C2=A0 =C2=A0 HCR_EL2: 0000000000000038<br>
(XEN)=C2=A0 TTBR0_EL2: 0000000004b45000<br>
(XEN) <br>
(XEN)=C2=A0 =C2=A0 ESR_EL2: 00000000f2000001<br>
(XEN)=C2=A0 HPFAR_EL2: 0000000000000000<br>
(XEN)=C2=A0 =C2=A0 FAR_EL2: 0000000000000000<br>
(XEN) <br>
(XEN) Xen stack trace from sp=3D0000000000306f60:<br>
(XEN)=C2=A0 =C2=A0 0000000000307040 00000000002cf2a8 00008000fbf5a000 00000=
00000000000<br>
(XEN)=C2=A0 =C2=A0 00008000fbf40000 00000000003070a8 0000000000307de4 00000=
000002aa078<br>
(XEN)=C2=A0 =C2=A0 0000000880000000 0000000000000002 00000000002e8d08 00000=
000000fff00<br>
(XEN)=C2=A0 =C2=A0 00008000fbf61e70 00008000fbf5a000 00008000fbf61220 00000=
00000000000<br>
(XEN)=C2=A0 =C2=A0 0000000000307040 00000000002cf288 00008000fbf5a000 00000=
00000000000<br>
(XEN)=C2=A0 =C2=A0 00008000fbf40000 00000000003070a8 0000000000307de4 65782=
c32766e6578<br>
(XEN)=C2=A0 =C2=A0 000000000030006e 2d6e65782c6e6578 6e65780036312e34 00000=
0006e65782c<br>
(XEN)=C2=A0 =C2=A0 0000000000307d80 00000000002d0440 00008000fbfd95a0 00000=
00000307dc8<br>
(XEN)=C2=A0 =C2=A0 00000000002d99b8 00000000002da338 0000000000307de4 00000=
000002aa078<br>
(XEN)=C2=A0 =C2=A0 000000000000000f 0000000000307110 0000000000000001 00c20=
10000000002<br>
(XEN)=C2=A0 =C2=A0 00000000003070c8 0000000000000000 6d933f29040f0000 00000=
02200000000<br>
(XEN)=C2=A0 =C2=A0 0010000000000000 0020000300000000 0020000000000000 00000=
000000fa000<br>
(XEN)=C2=A0 =C2=A0 0000000000000001 00008000fbf5a000 00008000fbf40000 00000=
00000000000<br>
(XEN)=C2=A0 =C2=A0 0000000000000002 0000000040000000 000000003e800000 00000=
00000000000<br>
(XEN)=C2=A0 =C2=A0 0000000200000000 0000000000000000 0000000000000000 00000=
00000000000<br>
(XEN)=C2=A0 =C2=A0 0000000000000000 0000000000000000 0000000000000000 00000=
00000000000<br>
(XEN)=C2=A0 =C2=A0 0000000000000000 0000000000000000 0000000000000000 00000=
00000000000<br>
(XEN)=C2=A0 =C2=A0 0000000000000000 0000000000000000 0000000000000000 00000=
00000000000<br>
(XEN)=C2=A0 =C2=A0 0000000000000000 0000000000000000 0000000000000000 00000=
00000000000<br>
(XEN)=C2=A0 =C2=A0 0000000000000000 0000000000000000 0000000000000000 00000=
00000000000<br>
(XEN)=C2=A0 =C2=A0 0000000000000000 0000000000000000 0000000000000000 00000=
00000000000<br>
(XEN)=C2=A0 =C2=A0 0000000000000000 0000000000000000 0000000000000000 00000=
00000000000<br>
(XEN)=C2=A0 =C2=A0 0000000000000000 0000000000000000 0000000000000000 00000=
00000000000<br>
(XEN)=C2=A0 =C2=A0 0000000000000000 0000000000000000 0000000000000000 00000=
00000000000<br>
(XEN)=C2=A0 =C2=A0 0000000000000000 0000000000000000 0000000000000000 00000=
00000000000<br>
(XEN)=C2=A0 =C2=A0 0000000000000000 0000000000000000 0000000000000000 00000=
00000000000<br>
(XEN)=C2=A0 =C2=A0 0000000000000000 0000000000000000 0000000000000000 00000=
00000000000<br>
(XEN)=C2=A0 =C2=A0 0000000000000000 0000000000000000 0000000000000000 00000=
00000000000<br>
(XEN)=C2=A0 =C2=A0 0000000000000000 0000000000000000 0000000000000000 00000=
00000000000<br>
(XEN)=C2=A0 =C2=A0 0000000000000000 0000000000000000 0000000000000000 00000=
00000000000<br>
(XEN)=C2=A0 =C2=A0 0000000000000000 0000000000000000 0000000000000000 00000=
00000000000<br>
(XEN)=C2=A0 =C2=A0 0000000000000000 0000000000000000 0000000000000000 00000=
00000000000<br>
(XEN)=C2=A0 =C2=A0 0000000000000000 0000000000000000 0000000000000000 00000=
00000000000<br>
(XEN)=C2=A0 =C2=A0 0000000000000000 0000000000000000 0000000000000000 00000=
00000000000<br>
(XEN)=C2=A0 =C2=A0 0000000000000000 0000000000000000 0000000000000000 00000=
00000000000<br>
(XEN)=C2=A0 =C2=A0 0000000000000000 0000000000000000 0000000000000000 00000=
00000000000<br>
(XEN)=C2=A0 =C2=A0 0000000000000000 0000000000000000 0000000000000000 00000=
00000000000<br>
(XEN)=C2=A0 =C2=A0 0000000000000000 0000000000000000 0000000000000000 00000=
00000000000<br>
(XEN)=C2=A0 =C2=A0 0000000000000000 0000000000000000 0000000000000000 00000=
00000000000<br>
(XEN)=C2=A0 =C2=A0 0000000000000000 0000000000000000 0000000000000000 00000=
00000000000<br>
(XEN) Xen call trace:<br>
(XEN)=C2=A0 =C2=A0 [&lt;0000000000220e6c&gt;] rangeset_remove_range+0xbc/0x=
2bc (PC)<br>
(XEN)=C2=A0 =C2=A0 [&lt;00000000002cd508&gt;] domain_build.c#make_hyperviso=
r_node+0x258/0x7f4 (LR)<br>
(XEN)=C2=A0 =C2=A0 [&lt;00000000002cf2a8&gt;] domain_build.c#construct_domU=
+0x9cc/0xa8c<br>
(XEN)=C2=A0 =C2=A0 [&lt;00000000002d0440&gt;] create_domUs+0xe8/0x224<br>
(XEN)=C2=A0 =C2=A0 [&lt;00000000002d4988&gt;] start_xen+0xafc/0xbf0<br>
(XEN)=C2=A0 =C2=A0 [&lt;00000000002001a0&gt;] arm64/head.o#primary_switched=
+0xc/0x1c<br>
(XEN) <br>
(XEN) <br>
(XEN) ****************************************<br>
(XEN) Panic on CPU 0:<br>
(XEN) Assertion &#39;s &lt;=3D e&#39; failed at rangeset.c:189<br>
(XEN) ****************************************<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><span style=3D"background-color:rgb(255,255,255)"><font size=
=3D"2"><span style=3D"color:rgb(51,51,51);font-family:Arial,sans-serif">Reg=
ards,</span></font></span></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"=
><div><span style=3D"background-color:rgb(255,255,255)"><font size=3D"2">Ol=
eksandr Tyshchenko</font></span></div></div></div></div></div></div></div><=
/div>

--000000000000e2219d05d056af71--

