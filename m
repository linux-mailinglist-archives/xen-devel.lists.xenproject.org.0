Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 175AC5AF6F3
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:37:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400070.641693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgFy-0002KJ-6N; Tue, 06 Sep 2022 21:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400070.641693; Tue, 06 Sep 2022 21:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgFy-0002Cc-1L; Tue, 06 Sep 2022 21:37:18 +0000
Received: by outflank-mailman (input) for mailman id 400070;
 Tue, 06 Sep 2022 21:37:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XS79=ZJ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oVgFw-0000Cs-Ir
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:37:16 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4200651a-2df7-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 17:19:10 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id gh9so2159634ejc.8
 for <xen-devel@lists.xenproject.org>; Tue, 06 Sep 2022 08:19:10 -0700 (PDT)
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
X-Inumbo-ID: 4200651a-2df7-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Ma2iDt0aE81Ahc9ZUJZycp2jvO5tJvy1n9qVt6gCQwI=;
        b=mZ+FcifZ+4aqabfna498JJgJVm7ZJdYQe8WPPtTpmukN0ltsFgbqVaNbL1sFWPnx0F
         +kFG3VCNFENVAovNsysmwpOZ9RuJ0ufsyH/pTm2Y0z5gRcOpO/R+heCj40VC0B/407ah
         gIy12X9ei8z3+szxvE4NyRdxrjANyShKAEl2/x/Zm5O/QSiE8OYXer9bdBZdxhHaAE7q
         f4tiV5HYLbiMy7AqJzsjwqwX5vSbICO2tfPlRmT+E50cm2MApRR8eNqmx5TuhyMcbdUY
         7WrJdlicqbcwsKebKLfXD1Wod6uRLkMhZP+32t59uXM5n6TIYOGjSb2jPimnfwACXEvM
         IUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Ma2iDt0aE81Ahc9ZUJZycp2jvO5tJvy1n9qVt6gCQwI=;
        b=eIjK40b8TuGirYNurrA5KVpn2mgDPMTrGX/lKCPlmZ7uk8QIj+a03u1dgqFcSsFwwa
         N44Ne/zpQ7DloC6QEiraz/DpHX/kBy6eAReBlKVTeZ+m/qjZC0OVAO9FgB3MdXvDMdHF
         autROhVzpfEEv4xlXgsZ8iOOEbhsVMhp4RJEY0UC0xHVB/ccYvO1uPJMplxB14hJVTVw
         SvA+/QkjEnMUQD+97kISqgWX3jt7wiQQFoj7Q0nEcqLfSWWh0ne/k/tnkknUqb5KN4P2
         K752DcRYBxcLeCAgV0H4spsxSxBFR/IjzGwv6HyhphQs2u6ySEsOtFL6W8sRUyBZJh8F
         BNPg==
X-Gm-Message-State: ACgBeo1Sk2RhRbyg4paAv96xj1o2tlPwpbp2wpbaBSzC5ShYUhm7i6FA
	GT39S0t1xenKET9rsD+78FYh+giehq37KUBdw+8=
X-Google-Smtp-Source: AA6agR5G9HfMrf0VgwjZaDpL+Bw3LD81rl/8ufqZpYLsPbGzQjkQjICo51PcirHskBDNf2s6ND3MqbShzMKHHJ8IDw0=
X-Received: by 2002:a17:907:2ce7:b0:741:6e62:4558 with SMTP id
 hz7-20020a1709072ce700b007416e624558mr31784827ejc.273.1662477550254; Tue, 06
 Sep 2022 08:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220829151536.8578-1-jandryuk@gmail.com> <20220902165921.GA354189@bhelgaas>
In-Reply-To: <20220902165921.GA354189@bhelgaas>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 6 Sep 2022 11:18:58 -0400
Message-ID: <CAKf6xpt9DDjQoMsu9e09Gq_Bb_VFe2gzU9faARTsfS6c45E0bg@mail.gmail.com>
Subject: Re: [PATCH] xen-pcifront: Handle missed Connected state
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, linux-pci@vger.kernel.org, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 2, 2022 at 12:59 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> The conventional style for subject (from "git log --oneline") is:
>
>   xen/pcifront: Handle ...
>
> On Mon, Aug 29, 2022 at 11:15:36AM -0400, Jason Andryuk wrote:
> > An HVM guest with linux stubdom and 2 PCI devices failed to start as
>
> "stubdom" might be handy shorthand in the Xen world, but I think
> it would be nice to consistently spell out "stubdomain" since you use
> both forms randomly in this commit log and newbies like me have to
> wonder whether they're the same or different.
>
> > libxl timed out waiting for the PCI devices to be added.  It happens
> > intermittently but with some regularity.  libxl wrote the two xenstore
> > entries for the devices, but then timed out waiting for backend state 4
> > (Connected) - the state stayed at 7 (Reconfiguring).  (PCI passthrough
> > to an HVM with stubdomain is PV passthrough to the stubdomain and then
> > HVM passthrough with the QEMU inside the stubdomain.)
> >
> > The stubdom kernel never printed "pcifront pci-0: Installing PCI
> > frontend", so it seems to have missed state 4 which would have
> > called pcifront_try_connect -> pcifront_connect_and_init_dma
>
> Add "()" after function names for clarity.
>
> > Have pcifront_detach_devices special-case state Initialised and call
> > pcifront_connect_and_init_dma.  Don't use pcifront_try_connect because
> > that sets the xenbus state which may throw off the backend.  After
> > connecting, skip the remainder of detach_devices since none have been
> > initialized yet.  When the backend switches to Reconfigured,
> > pcifront_attach_devices will pick them up again.

Thanks for taking a look, Bjorn.  That all sounds good.  I'll wait a
little longer to see if there is any more feedback before sending a
v2.

Regards,
Jason

