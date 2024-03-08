Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5203D876975
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 18:17:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690362.1076268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ridqE-0001nC-Iq; Fri, 08 Mar 2024 17:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690362.1076268; Fri, 08 Mar 2024 17:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ridqE-0001l2-Fn; Fri, 08 Mar 2024 17:17:06 +0000
Received: by outflank-mailman (input) for mailman id 690362;
 Fri, 08 Mar 2024 17:17:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2yz0=KO=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ridqC-0001kk-RM
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 17:17:04 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aea0dd46-dd6f-11ee-afda-a90da7624cb6;
 Fri, 08 Mar 2024 18:17:03 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-51321e71673so2585585e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 Mar 2024 09:17:03 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 p19-20020a05600c419300b0041294d015fbsm6272422wmh.40.2024.03.08.09.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Mar 2024 09:17:02 -0800 (PST)
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
X-Inumbo-ID: aea0dd46-dd6f-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1709918223; x=1710523023; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pHT22q20LOhDsFUsysvtbs6WGw7zAZt1pm32ji4d6KY=;
        b=N+1MsWHiYGjj95okwPE+ju5n59NkLBKvmo/J+clz9U46IJGzt/YuoHzQcFePGPAnS5
         rDRYc4SHXgInl/AbEosnfUWdgq0pnBTZArT9B3OQKNwCqN/6Bv6FQn0g5lmFNcf1KX4x
         /8XDiTkauQlsfIVkCd2m5G2VPZBcAjGeWKu1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709918223; x=1710523023;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pHT22q20LOhDsFUsysvtbs6WGw7zAZt1pm32ji4d6KY=;
        b=nu8vY60EW08T9n88wINF6XLVRKv01azf/hxYq0foBvMAbDtB+KzVvS1cySqfe3a4x3
         M5iqMoP7J8tX5l7FWY/rga6C9T6l99jKyyhhQ5nkgyR+agDVic+bMlSAIgtC3X5246Xl
         O70LVZu+3DiU3OCNt+5QYzufhpeihL8yDUCZXB/cEIC+mibv8mHyG3DPJukSnxus6tLg
         mVMHzagPu8PYofm+/ivPh6sEw2BULo+bNLFF4r73SIKeoXl+fjvdbWmcX7w4Yu988aum
         M0anrvRewDJpQx9LBNjpxURQlx6sfl337KFrMkolKRl8v4YpsM0OSDTVLfvjw2UH99x9
         Er9g==
X-Forwarded-Encrypted: i=1; AJvYcCVJ1/Ln4plFXtMdsKhx4ZbCXG0H0qh3MrdcfemHdmjucUd/XA0EaOaxr2QV6fwAdM1Z7O1po2s5is17N2HiZ7cIyp7qfOWHMZgU5m/v/uM=
X-Gm-Message-State: AOJu0YzHNNhQUMjPaCoqbPxyK5iT0yPwjCw520LtYHibxzCEUPr4HH/i
	sFTylPXO+yqLo/+MzhCguUgzvs4ZAebaTM+/zPkbHGbkt1WOfgZQEJFiw1eMNB0=
X-Google-Smtp-Source: AGHT+IEU7Rdcx8SJgoLNA+lYk/KOZq6CeemPaCgTAadtIVoFsRgKcJ27c8QiP6HFeGa6On80nI0ddA==
X-Received: by 2002:a19:6904:0:b0:513:3106:ac63 with SMTP id e4-20020a196904000000b005133106ac63mr3497403lfc.17.1709918223066;
        Fri, 08 Mar 2024 09:17:03 -0800 (PST)
Date: Fri, 8 Mar 2024 17:17:02 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] i386: load kernel on xen using DMA
Message-ID: <5975d575-d800-4520-a1b9-278cf51d108c@perard>
References: <20210426034709.595432-1-marmarek@invisiblethingslab.com>
 <87sg1feemf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87sg1feemf.fsf@linaro.org>

On Fri, Jun 18, 2021 at 09:54:14AM +0100, Alex Bennée wrote:
> 
> Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com> writes:
> 
> > Kernel on Xen is loaded via fw_cfg. Previously it used non-DMA version,
> > which loaded the kernel (and initramfs) byte by byte. Change this
> > to DMA, to load in bigger chunks.
> > This change alone reduces load time of a (big) kernel+initramfs from
> > ~10s down to below 1s.
> >
> > This change was suggested initially here:
> > https://lore.kernel.org/xen-devel/20180216204031.000052e9@gmail.com/
> > Apparently this alone is already enough to get massive speedup.
> >
> > Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> > ---
> >  hw/i386/pc.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > index 8a84b25a03..14e43d4da4 100644
> > --- a/hw/i386/pc.c
> > +++ b/hw/i386/pc.c
> > @@ -839,7 +839,8 @@ void xen_load_linux(PCMachineState *pcms)
> >  
> >      assert(MACHINE(pcms)->kernel_filename != NULL);
> >  
> > -    fw_cfg = fw_cfg_init_io(FW_CFG_IO_BASE);
> > +    fw_cfg = fw_cfg_init_io_dma(FW_CFG_IO_BASE, FW_CFG_IO_BASE + 4,
> > +                                &address_space_memory);
> >      fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, x86ms->boot_cpus);
> >      rom_set_fw(fw_cfg);
> 
> Gentle ping. The fix looks perfectly sane to me but I don't have any x86
> Xen HW to test this one. Are the x86 maintainers happy to take this on?

Yes. It looks like it works well with both SeaBIOS and OVMF, so the
patch is good.

> FWIW:
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

