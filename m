Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B511FE94F
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 05:21:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jll78-0002AU-Bk; Thu, 18 Jun 2020 03:21:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FPuN=77=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jll76-00029t-8D
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 03:21:16 +0000
X-Inumbo-ID: c450daba-b112-11ea-bb8b-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c450daba-b112-11ea-bb8b-bc764e2007e4;
 Thu, 18 Jun 2020 03:21:15 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id x6so4416410wrm.13
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2020 20:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qvpzg+EGseIk50qngoPxiQumjg4bKxs079YWUd41tSE=;
 b=sUjVf736F+EGAL1puUx5HVQ/sgR1OF3km9e/uueJ5sz0w3xott1ck2oQXUEA7QuQaH
 Xs3yiY1DdoRRJ5ACl2pPV3xhQyVTml+wvY3sAxCDVyCanm4n62FzGuujP2XXO2x9Tpzj
 dcNy2//Fws8/wWmPW6G2fvdx3nfAulJybAUCsC4Dkhdag0HvKW55aQJ14hqg1JggLPPc
 uRj8wsbBvGSUhQ40QHjZRbbzvBUpAkztdecltHkjZpb/JqEKgsl11xTIsUzcqAm+UIzs
 QkNDr1wGHshsrUmJlkVhpZ97bqnf2T4pfLCrmrbzEupMAT64xe498HFf8duxRjpeBSKF
 PWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qvpzg+EGseIk50qngoPxiQumjg4bKxs079YWUd41tSE=;
 b=dVL11PaTjDyBTypTeF7gnG1em1yoENk6bQnSli4sRm9Io6idjKAOrcA9VmAhACvtXG
 DMITbwtZNNNtz0ocBwHIddF9GrFFpP0XIrK6NFLeks1ng7SVhaoDNLxgFcVG2sLF7U4B
 ORDRIyljgMbtWszNF1R5AV5ZROgjOs4Lb8vkYUvl4768UnSj6Jbl5P6fV8nO0fJ2e4u4
 0U4rcKBLmNBR8WVCLx9ck/rZgUQe8HVWVyzekqdbOl8x56dT5p91qLl3K8Eb3VyH2PiJ
 WLQsnCDzwga0+K2ZzWzdyNqMzroWCFjYEmX7gBUhUoZA6/Wqh7i6FcvesJ5AVA8QxhWj
 Tmeg==
X-Gm-Message-State: AOAM5301+MqJjr4frTJBRaEPM1N2PVHxduztLx+/tW8gaQH23CkbZI2T
 5o63k5CzSefptJ7S3WNYgKDJvzV3s5OcElBckzE=
X-Google-Smtp-Source: ABdhPJzinIel4mrPjxDli5yNbTMczS1/88+RN4zOEEnVLHS0xT21oDNbv+fkt/k4wM+CWVoEn9Bb2flNlPX0w88ZJfE=
X-Received: by 2002:adf:f707:: with SMTP id r7mr2451622wrp.390.1592450474521; 
 Wed, 17 Jun 2020 20:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <34833328.8766172.1592320926648.JavaMail.zimbra@cert.pl>
 <20200616172352.GT735@Air-de-Roger>
 <998292451.9258672.1592421185726.JavaMail.zimbra@cert.pl>
In-Reply-To: <998292451.9258672.1592421185726.JavaMail.zimbra@cert.pl>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 17 Jun 2020 21:20:39 -0600
Message-ID: <CABfawhmxUtuyBUYjVf9iOMvJop-_7SfciRNQThZt0sAqPsVqrg@mail.gmail.com>
Subject: Re: [PATCH v1 4/7] x86/vmx: add do_vmtrace_op
To: =?UTF-8?B?TWljaGHFgiBMZXN6Y3p5xYRza2k=?= <michal.leszczynski@cert.pl>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> >> +
> >> +        a.mfn = v->arch.hvm.vmx.ipt_state->output_base >> PAGE_SHIFT;
> >
> > This will not work for translated domains, ie: a PVH or HVM domain
> > won't be able to use this interface since it has no way to request the
> > mapping of a specific mfn into it's physmap. I think we need to take
> > this into account when deciding how the interface should be, so that
> > we don't corner ourselves with a PV only interface.
>
> Please be aware that this is only going to be used by Dom0. Is is well-supported case that somebody is using PVH/HVM Dom0?
>
> I think that all Virtual Machine Introspection stuff currently requires to have Dom0 PV. Our main goal is to have this working well in combo with VMI.

FYI the VMI interface doesn't require a PV domain. It works fine from
PVH dom0 or even from a secondary privileged HVM DomU as well,
provided you have the right XSM policy to allow that.

Tamas

