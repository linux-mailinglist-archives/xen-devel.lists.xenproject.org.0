Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 065065987CB
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 17:50:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389657.626735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOhmA-000288-FG; Thu, 18 Aug 2022 15:49:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389657.626735; Thu, 18 Aug 2022 15:49:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOhmA-00026C-BG; Thu, 18 Aug 2022 15:49:42 +0000
Received: by outflank-mailman (input) for mailman id 389657;
 Thu, 18 Aug 2022 15:49:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3bNE=YW=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1oOhm9-000266-75
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 15:49:41 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5db157bf-1f0d-11ed-bd2e-47488cf2e6aa;
 Thu, 18 Aug 2022 17:49:39 +0200 (CEST)
Received: by mail-pj1-x1029.google.com with SMTP id g18so2112764pju.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Aug 2022 08:49:39 -0700 (PDT)
Received: from leoy-yangtze.lan
 (ec2-54-176-161-147.us-west-1.compute.amazonaws.com. [54.176.161.147])
 by smtp.gmail.com with ESMTPSA id
 i1-20020aa796e1000000b00528669a770esm1831536pfq.90.2022.08.18.08.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 08:49:36 -0700 (PDT)
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
X-Inumbo-ID: 5db157bf-1f0d-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=/OeE267ROVI0HXixUhlktfpxlQeHv6fRFQWJOEumgfo=;
        b=L60lgyeqGLIIr0KP0OTpWkCOty6+qVsoB+LwYj1SMilDpptQM6J4AfJJLXDK3sbDRK
         Q6HdM/2bRPV9pIRhryl6MP99tr5tBpy+MZsQqjifqGZ/5FuI84y1t4EI3DsQ64Wd27Wc
         XqXCef1/Q2gBMaKbH1qnArYEHzcscW+uNfXINJoCJLqZinwB+8oqJmoY1RI/6Q3zWK6i
         5i5/YRuO6j98hygHIoZfH9Lm8cVJHaKzbAFh56X9tkDfc/QQ2xYuFiZerilGSGDnldhr
         BoocT0XCTG8+Zjb3ifYXxw+KOsNR7w3gfInnPcoXypbCu3QRpda8eix0cL5Oy0AeGYx8
         reSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=/OeE267ROVI0HXixUhlktfpxlQeHv6fRFQWJOEumgfo=;
        b=RMAL7EY8S+ZbzLNds0tlYBTDEYYD/PWNqM229owHfiC3XTbDO9mzCL8B4RGM9sKCHX
         yrkICISZpBpZ+J4KbpOOCcxYhATasbLAwAu/zS6cEUiDPfFSZHmbevhfc5P70Zvcwowp
         xl4TNh2jVjDXOnq8cnr1YSdxrtcH7mkO8IEC+ruH0AHoEgnWCA1n+trWyWroulmUm5Px
         p5QAqewy2YoamustuCOrx3mKnWtAKnXI2YbkUwMLDYVuRSrGtSMAzicap/CSvXBvr9Lq
         Y08CYArowEkyBfcNwFNFrZt2J7y64RjSbRS5uH2YX+BbW8HlG6Ko50mqLqvpfcyz6oUJ
         Qmtw==
X-Gm-Message-State: ACgBeo1KnzBhQyH8rKY2hUt3VxaNYVqAhS0n0Lnvu/iRq9UlP6jqMVgH
	Ecj3tUHUmO9adBoIwW9nMgH9Dw==
X-Google-Smtp-Source: AA6agR6jhvMLI/rL9nxUb97LiscOx5M5m1mnrklyFCqYJ3NCdBgLlihrrnoY7H1aKRmfJAxptzvlGw==
X-Received: by 2002:a17:902:f610:b0:172:990e:33cd with SMTP id n16-20020a170902f61000b00172990e33cdmr3099909plg.145.1660837777619;
        Thu, 18 Aug 2022 08:49:37 -0700 (PDT)
Date: Thu, 18 Aug 2022 23:49:30 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Jan Beulich <jbeulich@suse.com>,
	Marc Zyngier <maz@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Rahul Singh <Rahul.Singh@arm.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH] xen/arm: acpi: Support memory reserve configuration table
Message-ID: <Yv5fii2GvIeHEHZX@leoy-yangtze.lan>
References: <20220817105720.111618-1-leo.yan@linaro.org>
 <fd24b049-abf2-34e8-e0b0-2c2d2d1e1b0f@suse.com>
 <CAMj1kXEDxHC6RgKfcmpXGDxwQ0mTKG146D8dJnrwJ1cWWXZ=3g@mail.gmail.com>
 <Yv4DMuQHbGNhqAP4@leoy-yangtze.lan>
 <CAMj1kXHkWH7tkpuPLLjWszOVTQ-Cr3Zcbj8w0bogSd0Y_hso0g@mail.gmail.com>
 <99e460f1-ca5f-b520-69e0-b250915fd591@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99e460f1-ca5f-b520-69e0-b250915fd591@xen.org>

On Thu, Aug 18, 2022 at 11:04:48AM +0100, Julien Grall wrote:

[...]

> > > Seems it's broken for kdump/kexec if kernel boots with using DT?
> > > 
> > 
> > EFI supports both DT and ACPI boot, but only ACPI *requires* EFI.
> > 
> > So DT boot on hardware with affected GICv3 implementations works fine
> > with kdump/kexec as long as EFI is being used. Using non-EFI boot and
> > kexec on such systems will likely result in a splat on the second
> > kernel, unless there is another mechanism being used to reserve the
> > memory in DT as well.
> > 
> > Maybe we should wire up the EFI_PARAVIRT flag for Xen dom0 on arm64,
> > so that we can filter out the call above. That would mean that
> > Xen/arm64/dom0/kexec on affected hardware would result in a splat in
> > the second kernel as well, but whether that matters depends on your
> > support scope.
>
> In the context of Xen, dom0 doesn't have direct access to the host ITS
> because we are emulating it. So I think it doesn't matter for us because we
> can fix our implementation if it is affected.
> 
> That said, kexec-ing dom0 (or any other domain) on Xen on Arm would require
> some work to be supported. OOI, @leo is it something you are investigating?


Now I am working on automative reference platform; the first thing for
me is to resolve the kernel oops.

For long term, I think the kexec/kdump would be important to be
supported, to be clear, so far supporting kexec/kdump for Xen/Linux is
not priority for my work.

Also thanks a lot for Ard and Mark's replying. To be honest, I missed
many prerequisites (e.g. redistributor configurations for GIC in
hypervisor) and seems Xen uses a different way by emulating GICv3
controller for guest OS.  So now I am bit puzzle what's for next step
or just keep as it is?

Thanks,
Leo

