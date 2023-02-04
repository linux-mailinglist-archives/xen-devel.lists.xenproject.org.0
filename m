Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F49168A9B6
	for <lists+xen-devel@lfdr.de>; Sat,  4 Feb 2023 13:00:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489502.757832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOHD8-0001Rx-Ny; Sat, 04 Feb 2023 12:00:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489502.757832; Sat, 04 Feb 2023 12:00:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOHD8-0001Om-KB; Sat, 04 Feb 2023 12:00:02 +0000
Received: by outflank-mailman (input) for mailman id 489502;
 Sat, 04 Feb 2023 12:00:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qDi1=6A=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pOHD7-0001CV-GL
 for xen-devel@lists.xenproject.org; Sat, 04 Feb 2023 12:00:01 +0000
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com
 [2607:f8b0:4864:20::930])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 720a1cfe-a483-11ed-93b5-47a8fe42b414;
 Sat, 04 Feb 2023 12:59:59 +0100 (CET)
Received: by mail-ua1-x930.google.com with SMTP id g12so1409603uae.6
 for <xen-devel@lists.xenproject.org>; Sat, 04 Feb 2023 03:59:58 -0800 (PST)
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
X-Inumbo-ID: 720a1cfe-a483-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=npKOVDePKj/bCzuGpr6GKG9ommD7W1J+s+nLzWagcRI=;
        b=AJVmGIv7l+fhRALO+zba2OIMeIlEfsiKhmQUg4OQawLeWkW7q4RgOXuCly6AVh+i8z
         4X8l5v8RzLjafOlnNIfE/gGTaqoadnO5IpcgCYoHEyoOOWXg/TKI39so6zOWbF5ddXrs
         vNRhXcOGDqS2aGDvWUByvkqpkDpiGbe2o079ShjL3KaSoN5LRVpRnqGfb2gmGtl0BJPz
         61hEgm/HTKfk+kK25fkjMogvE1Se8FF44q6Cw21rmgTXS98T9b09up9aJT/Lqgo7JJ1w
         7yN+iYZSgGsZSGRyPomBbCP4wNom1/qbcHDqVTD3F1XPTXj8Gi3TdIvdVyz67ZrSN/E3
         7slQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=npKOVDePKj/bCzuGpr6GKG9ommD7W1J+s+nLzWagcRI=;
        b=0s2xFGyBMFT6MxFGd2uqLeGFj6Mo6XD/9A4Qp5UYYDDiAWuTXZ6OUH5wlbCdgWNJAI
         M1YlgjtLPIded7uwRFqzzxysAPO2ahEnVVV+a3ZErpHGOa5ITRyM5qlKHTM2qG040Msd
         7cwuMn9vGrxeVGIU/ry3xdTu4L4aqgaPoarQOrrsui/J9T5WIVvlMy+WMC485J/0xLO/
         VBdh4bbWQWbDDKDyp0B5x14Sr7c4yByZkMtj9PHe4R0oBLM9+IHe5/j353E+kr49WrRH
         2bVhvs+Vf1fBASveWn/+IVQXZ/PHW0Pdqfx3AxSfR0mJXMRMhsBjsBrYOKmsfjkaDBoU
         pbTg==
X-Gm-Message-State: AO0yUKXUsTQxKIC3x+OyI2aO/R/RZeHw4LkUCifAcV+ihsJ/bQZUGe51
	mepnixN5zq4+6kOLfJHYgiYmhtBSTKp6/tw4QoI=
X-Google-Smtp-Source: AK7set+fCuSjSSg2MUWcdViET9csRzRDeif8bwooqKV9K8ZyhHKXMLEBhzZFUAZeA6sXYr9H6aFfEQSE5AasO+0UOSA=
X-Received: by 2002:a9f:3f0c:0:b0:658:2091:77a4 with SMTP id
 h12-20020a9f3f0c000000b00658209177a4mr1886424uaj.74.1675511997462; Sat, 04
 Feb 2023 03:59:57 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674819203.git.oleksii.kurochko@gmail.com>
 <06c2c36bd68b2534c757dc4087476e855253680a.1674819203.git.oleksii.kurochko@gmail.com>
 <f5cd1bfb116bfcc86fc2848df7eead05cd1a24c0.camel@gmail.com>
 <CAKmqyKMGiDiPRZBekdKan=+YduSmkB2DoWo5btrtVQ8nS3KMAg@mail.gmail.com>
 <2f6a3b17-4e41-fe9a-1713-4942b3bd3585@xen.org> <CAKmqyKNwH4-D3dKGQEsW_Zup4OT32C1RwaA7_Sey4fo_jOzFcA@mail.gmail.com>
 <9d5841b2-5d0b-390f-6e95-cf492e99e5a2@srcf.net> <1a1e9b46-e665-f33a-b122-31a5af5b22da@xen.org>
 <Y9qih7mHbZBzAtUE@bullseye>
In-Reply-To: <Y9qih7mHbZBzAtUE@bullseye>
From: Alistair Francis <alistair23@gmail.com>
Date: Sat, 4 Feb 2023 21:59:31 +1000
Message-ID: <CAKmqyKPkMA4dgner-Zpw89xqVrFAUn3J0iC3HmCOgE4FVPBAaw@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] xen/riscv: introduce early_printk basic stuff
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <amc96@srcf.net>, Oleksii <oleksii.kurochko@gmail.com>, 
	xen-devel@lists.xenproject.org, Alistair Francis <alistair.francis@wdc.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, 
	Connor Davis <connojdavis@gmail.com>, Bobby Eshleman <bobby.eshleman@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 2, 2023 at 3:34 AM Bobby Eshleman <bobbyeshleman@gmail.com> wrote:
>
> On Wed, Feb 01, 2023 at 09:06:21AM +0000, Julien Grall wrote:
> > Hi Andrew,
> >
> > On 01/02/2023 00:21, Andrew Cooper wrote:
> > > On 31/01/2023 11:17 pm, Alistair Francis wrote:
> > > > On Tue, Jan 31, 2023 at 10:03 PM Julien Grall <julien@xen.org> wrote:
> > > > > On 31/01/2023 11:44, Alistair Francis wrote:
> > > > > > On Sat, Jan 28, 2023 at 12:15 AM Oleksii <oleksii.kurochko@gmail.com> wrote:
> > > > > >
> > > > >   From my understanding, on RISC-V, the use of PC-relative address is
> > > > > only guaranteed with medany. So if you were going to change the cmodel
> > > > > (Andrew suggested you would), then early_*() may end up to be broken.
> > > > >
> > > > > This check serve as a documentation of the assumption and also help the
> > > > > developer any change in the model and take the appropriate action to
> > > > > remediate it.
> > > > >
> > > > > > I think this is safe to remove.
> > > > > Based on what I wrote above, do you still think this is safe?
> > > > With that in mind it's probably worth leaving in then. Maybe the
> > > > comment should be updated to make it explicit why we want this check
> > > > (I find the current comment not very helpful).
> > >
> > > The presence of this check pre-supposes that Xen will always relocate
> > > itself, and this simply not true.  XIP for example typically does not
> > >
> > > Furthermore it's not checking the property wanted.  The way C is
> > > compiled has no bearing on what relocation head.S uses to call it.
> >
> > I think we are still cross-talking each other because this is not my point.
> > I am not sure how to explain differently...
> >
> > This check is not about how head.S call early_*() but making sure the C
> > function can be executed with the MMU off. In which case, you will likely
> > have VA != PA.
> >
> > In theory head.S could apply some relocations before hand, but it may be too
> > complicated to do it before calling early_*().
> >
> > >
> > > It is a given that we compile the hypervisor with a consistent code
> > > model, meaning that the properly actually making the check do what is
> > > wanted is also the property that means it is not needed in the first place.
> >
> > See above.
> >
> > >
> > > This check is literally not worth the bytes it's taking up on disk, and
> > > not worth the added compiler time, nor the wasted time of whoever comes
> > > to support something like XIP in the future finds it to be in the way.
> > > Xen as a whole will really genuinely function as intended in models
> > > other than medany, and it demonstrates a misunderstanding of the topic
> > > to put in such a check to begin with.
> >
> > Then enlight me :). So far it looks more like you are not understanding my
> > point: I am talking about C function call with MMU off (e.g. VA != PA) and
> > you are talking about Xen as a whole.
> >
> > I guess the only way to really know is to implement a different model. At
> > which point there are three possible outcome:
> >   1) We had the compiler check, it fired and the developper will take action
> > to fix it (if needed).
> >   2) We have no compiler check, the developper knew what to do it and fixed
> > it.
> >   3) We have no compiler check, the developper where not aware of the
> > problem and we will waste time.
> >
>
> I tend to favor the check because outcome #1 is so desirable, and I do
> think that checking for medany is sufficient for the bulk of future
> work. But that said, I do see Andrew's point now.
>
> If Xen were to a) not relocate itself, b) be executed under the 2GB
> range, c) be compiled under medlow, and d) the MMU is off or on but Xen
> is identity mapped, then C functions should still be safe to call in
> early boot. Checking medany does protect developers from accidental bad
> configuration now, but it is a somewhat imperfect proxy.

Yeah, I agree. It probably is worth leaving the check in for now, even
if it's imperfect. We can always remove it in the future if required.

Alistair

>
> One alternative that may be more long term is for the self relocation
> code to be Kconfig-able and to require/force medany. Anyone wanting to
> develop something like XIP could deselect relocation, which would allow
> them to use medlow if they wanted/needed. The early C functions would
> still be callable under both in this case. The help strings could offer
> explanation too.
>
> Thanks,
> Bobby
>
> > Even if you disagree with the check, then I think 1 is still the best
> > because it would explain our assumption. Yes it may waste a few minutes to
> > the developer switching the model. But that probably nothing compare to the
> > time you could waste if you don't notice it.
> >
> > Anyway, Alistair has now all the information to take an informative
> > decision.
> >
> > Cheers,
> >
> > --
> > Julien Grall
> >

