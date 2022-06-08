Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4ED3542183
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jun 2022 08:42:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343702.569137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nypNb-0006zz-P3; Wed, 08 Jun 2022 06:41:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343702.569137; Wed, 08 Jun 2022 06:41:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nypNb-0006yD-Lv; Wed, 08 Jun 2022 06:41:23 +0000
Received: by outflank-mailman (input) for mailman id 343702;
 Wed, 08 Jun 2022 06:41:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Sw9=WP=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1nypNa-0006y7-VA
 for xen-devel@lists.xenproject.org; Wed, 08 Jun 2022 06:41:23 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01bb6ab8-e6f6-11ec-b605-df0040e90b76;
 Wed, 08 Jun 2022 08:41:21 +0200 (CEST)
Received: by mail-pj1-x1029.google.com with SMTP id
 w2-20020a17090ac98200b001e0519fe5a8so17486451pjt.4
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jun 2022 23:41:21 -0700 (PDT)
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
X-Inumbo-ID: 01bb6ab8-e6f6-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a/sCgo9v/efv0g+VDiQLZhtLiKBOj2X+pUuTz2zgxFs=;
        b=bEaIz2+5gq4CgE0nIzhKk7HytX9pUXUbNQmMS0giHUXeS+w1eZKGXfNlITgwaVMTVT
         6DzTFMp0t9ZVvV1O5Pu9cdyjVQCdBdzRZT2OQyMv/wYA3qPBFkRdSfZohQBsoeYmk5R0
         rd6eIZ5yglo4eX1EYW/eMGNqA0djmJzppLJeDUPay4i2MY2O1voxo0M4tdMt+4uC2O+i
         ePeXhgK9iMicrzUvARDYbxGgP2nP5POcor88KIyZWZICO+i7vYQDShS0CaYM8jPv6jbN
         QhYVJGxBol2tXyALVTbS4cWcPoXpAYZibZwNbp0rBmgEV+MKr4YAyMk/0TZJ2T+m/kqO
         m+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a/sCgo9v/efv0g+VDiQLZhtLiKBOj2X+pUuTz2zgxFs=;
        b=oAGba/6hLC3IKdNbIKHHZj7d2TMck88Gr5EH2e/RL11NhMK4GtEQLTtw3VCkF0z49F
         ZjSoc129yKnO3cMk7p7Zq7+ibXz22v0oiYNukO5tNaylb3yOhaAjKFhaqUjPIjpKTfDT
         mzHNOWV6pXUfvuBxBPZsaz+YmQCLyq17LsT1FZpug+O5r85/aEhae7EuvBnZLXARvQev
         Q46dDN2gJDXuNg6hupn9B2GNKl6yr//gSGDkjNK2H/XXKnuSVaDlvqZd3mVUteXAxaWN
         XmaCuInCtUStJirM8Hcsi6z1dK2NJi1qHG9XhCCGcYs9KqEn8UGSPA5XBMvhtGVKSjq0
         Q3Jw==
X-Gm-Message-State: AOAM532xUJRKjzxUxR2lXrVcXdUF0Aw8OZ82MjvXR9rAao4lLRRDK4lO
	GLTQxywhH7UoiV5axxsYlfxqLbEucs8j/zuTljLEAV+1Ul/H/w==
X-Google-Smtp-Source: ABdhPJz0shapgQITbxTI6b/BAtMb3pKcdHJgDK5/zKbirtbCi9sz7LDJeqY4WIREFx9+9Vvar5kFP6is37QCeH8kWt0=
X-Received: by 2002:a17:90b:388c:b0:1e2:f376:b8d with SMTP id
 mu12-20020a17090b388c00b001e2f3760b8dmr53598507pjb.148.1654670480104; Tue, 07
 Jun 2022 23:41:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220607101010.3136600-1-jens.wiklander@linaro.org>
 <alpine.DEB.2.22.394.2206071454020.21215@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2206071606550.21215@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2206071606550.21215@ubuntu-linux-20-04-desktop>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 8 Jun 2022 08:41:09 +0200
Message-ID: <CAHUa44E2jnPsm=hPKOd54PUwzLFEc8Zwjup1d0K5YKc6GkEmxQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Xen FF-A mediator
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 8, 2022 at 1:07 AM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> On Tue, 7 Jun 2022, Stefano Stabellini wrote:
> > On Tue, 7 Jun 2022, Jens Wiklander wrote:
> > > Hi,
> > >
> > > This patch sets add a FF-A [1] mediator modeled after the TEE mediator
> > > already present in Xen. The FF-A mediator implements the subset of the FF-A
> > > 1.1 specification needed to communicate with OP-TEE using FF-A as transport
> > > mechanism instead of SMC/HVC as with the TEE mediator. It allows a similar
> > > design in OP-TEE as with the TEE mediator where OP-TEE presents one virtual
> > > partition of itself to each guest in Xen.
> > >
> > > The FF-A mediator is generic in the sense it has nothing OP-TEE specific
> > > except that only the subset needed for OP-TEE is implemented so far. The
> > > hooks needed to inform OP-TEE that a guest is created or destroyed is part
> > > of the FF-A specification.
> > >
> > > It should be possible to extend the FF-A mediator to implement a larger
> > > portion of the FF-A 1.1 specification without breaking with the way OP-TEE
> > > is communicated with here. So it should be possible to support any TEE or
> > > Secure Partition using FF-A as transport with this mediator.
> > >
> > > [1] https://developer.arm.com/documentation/den0077/latest
> > >
> > > Thanks,
> > > Jens
> >
> > Hi Jens,
> >
> > Many thanks for the patches! I tried to apply them to the master branch
> > but unfortunately they don't apply any longer. Could you please rebase
> > them on master (or even better rebase them on staging) and resend?
> >
> > Thank you!
>
> One question without having looked at the patches in details. These
> patches are necessary to mediate OS (e.g. Linux) interactions with
> OPTEE. The difference between xen/arch/arm/ffa.c and
> xen/arch/arm/tee/optee.c is the transport mechanism: shared mem vs. SMC.
> Is that right?
>
> If only the transport is different, would it make sense to place ffa.c
> under xen/arch/arm/tee?

FF-A is a standard Arm service with a different range of SMC Function
Identifiers. FF-A is used to communicate with SPs, Secure Partitions.
An SP can be a TEE but also something different.

There are similarities between xen/arch/arm/ffa.c and
xen/arch/arm/tee/optee.c, but I believe it's more in broader terms on
the surface.

FF-A is a generic transport protocol that is generic enough that Xen
doesn't even need to know anything about the entity it's facilitating
communication with except what's provided by FF-A. The idea is that
it's only the end points that need to be aware of details of the
protocol run on top of FF-A. This means that EL2 (Xen), EL3
(SPMD/TF-A) and S-EL2 (SPMC/Hafnium) in principle can be kept
unchanged and agnostic to Trusted OSes and what not.

>
> Without having looked at the details of the transport or the FF-A
> protocol let me ask you a question. Do you think it would be possible to
> share part of the implementation with xen/arch/arm/tee/optee.c? I am
> asking because intuitively, if only the transport is differenti I would
> have thought that some things could be common. But it doesn't look like
> the current patches are reusing anything from xen/arch/arm/tee/optee.c.
> Are the two protocols too different?

The two protocols are quite different. So far I haven't been able to
identify suitable common helper functions.

Thanks,
Jens

