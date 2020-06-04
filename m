Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C75251EE8E0
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 18:51:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgt55-0005xg-Qn; Thu, 04 Jun 2020 16:51:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=06Bj=7R=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1jgt53-0005xa-Qo
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 16:51:01 +0000
X-Inumbo-ID: 9246fe94-a683-11ea-81bc-bc764e2007e4
Received: from mail-qk1-x72b.google.com (unknown [2607:f8b0:4864:20::72b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9246fe94-a683-11ea-81bc-bc764e2007e4;
 Thu, 04 Jun 2020 16:51:01 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id s1so6705518qkf.9
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2020 09:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FBGB4XsK5b1qj5WNIKaL17NGc9eizHT9b9nWp44b7S0=;
 b=b4Nyf2MCwPXFrZ1eEP7n0atGpyWQBuRDTmlpA95HMEbXKwC55juaHNBsZ5uGtqXr7o
 lJz/2eosZcZ+lfF4rGxnxMASeTSLQq8reM7aMrOzUkpnQA7vTuSmBf3ISmpm7lnll7Gj
 Y/V2gc61vDtLvD6sG1w4JKz9jBmIB7l95OrX54/GQtMxeLgb+1B0gmgfAq95OLgBwGn4
 iSCDrrOn1Ve89o6n5C7lkVnfqIcqlO3iKoOKSfCgarwH1c0p5C3tn+2p/EWlYnf0xgsj
 1LFQ1Z4H0+DPlDQl0/O6O6me5q6UJpUU5AHWYYFRcR5IOQTMLc+qKbf4P4I9TpTRzVgL
 B8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FBGB4XsK5b1qj5WNIKaL17NGc9eizHT9b9nWp44b7S0=;
 b=nZGNdnx1GLu0HPFhNPQCJraD7OZMl7B6l2b//KhZX5e0ofX4Lz0akJxTsrawIQ+d1L
 vgNLF2tNM9qPPr3zLouysh1E9XLw2tVygyiPk9kenqBjB7k1wCfNtH2Z37OHRFf69A/F
 wifpgxDl6YR7PKaNyepSXVOx8ptHeRktf9yEYVRPIKLLo4XjO/jpyRG7h1vVm2pWvjXc
 R7SdA4Q4AQpWSAHedBwilas099N1s3EovaN63YOzW7f/M+cH1tRCcrYG5txtWp/MTYlN
 6gov9AVXDzR7AVwV7HcvXQMcupBC4UqEHUQOK92CNW0cxsYg2n4w0GZoKbLBBqerHJXe
 4NAA==
X-Gm-Message-State: AOAM530XCc+34dgS+Tt6a8sPDAbA4+a8ZM3BF5YN4/T2LLSgJFHbytKG
 wB2ncel8Cc5YHdy9lngnGNcQT4Mdawb1MamV0Pb4BGa2
X-Google-Smtp-Source: ABdhPJzAbqgo59c7H+4t6SE1G8SLFOml6zn+IzzNnYc8yD5d35YErpAOwQBlgNGajibC/vrYXSxbiascXfVpNNBrEFY=
X-Received: by 2002:a05:620a:147:: with SMTP id
 e7mr5502750qkn.267.1591289461041; 
 Thu, 04 Jun 2020 09:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <DB6PR0402MB276072324DC3E1E9BD9A96BE88890@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <c3856c1f-52bf-92fd-5226-4b09229e2127@epam.com>
 <alpine.DEB.2.21.2006040829390.6774@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2006040829390.6774@sstabellini-ThinkPad-T480s>
From: Roman Shaposhnik <roman@zededa.com>
Date: Thu, 4 Jun 2020 09:50:50 -0700
Message-ID: <CAMmSBy-P8+NK=_kjHCYZoXhAAy8RVbNhFXxYMmK-FFmejefQnA@mail.gmail.com>
Subject: Re: UEFI support in ARM DomUs
To: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Peng Fan <peng.fan@nxp.com>,
 Julien Grall <julien@xen.org>, Nataliya Korovkina <malus.brandywine@gmail.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jun 4, 2020 at 8:31 AM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> On Thu, 4 Jun 2020, Oleksandr Andrushchenko wrote:
> > On 6/4/20 4:57 AM, Peng Fan wrote:
> > > Grall <julien@xen.org>;
> > >> Nataliya Korovkina <malus.brandywine@gmail.com>
> > >> Subject: UEFI support in ARM DomUs
> > > We have made U-Boot run inside XEN DomU, but just only PV console part,
> > > not implement other frontend drivers currently. Would this help for your
> > > case if enable EFI in U-Boot?
> >
> > Well, we have a working PV block implementation on top of that on iMX8
> >
> > platform, mostly ported from mini-os. Currently we are finalizing the work
> >
> > and cleaning up (it's going to take a week or so hopefully). Then, we we'll post
> >
> > it on our public github. We are also thinking about upstreaming the work, but it may
> >
> > take quite some time if the whole idea fits u-boot's view on such an extension at all.
>
> Yes please to both of you! :-)
>
> In the meantime, while we wait for those changes to go upstream in
> uboot, could you please post a branch on github and a link on this email
> thread?
>
> Maybe we should have a wikipage on wiki.xenproject.org about
> work-in-progress uboot items.

Yes!!! Speaking of which -- I've been meaning to update the wiki
for quite a few things already, but I'm still waiting on someone (George?)
to give user 'rvs' proper karma.

Thanks,
Roman.

