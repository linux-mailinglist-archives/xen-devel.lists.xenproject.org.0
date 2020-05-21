Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C46681DC51A
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 04:20:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbanf-0006wv-5w; Thu, 21 May 2020 02:19:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KCrj=7D=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jbane-0006wp-0W
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 02:19:10 +0000
X-Inumbo-ID: 73c1592c-9b09-11ea-b07b-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73c1592c-9b09-11ea-b07b-bc764e2007e4;
 Thu, 21 May 2020 02:19:09 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id g9so5492080edr.8
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2020 19:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tZDQejP2Uh/kuBZJ8hJtfh64z2Jug7j1tZWZWWhfToE=;
 b=LJKZMAkKz3K9MatJq3u4dRRMNmb8aJarYtW50F7bwNk5j2q8vHx6OCPhMXDPB6Idj2
 nLoANbkr3piMSnOfeFoS9aXJfvvTk3j/wXMwLm+IapkxRKbjJup834gep0X9S2KTgD+l
 VNb/fK7xkU4dwLQCwB1OOeJgDDmxMFkVt0e0hQGTMCRuATLsyLIJHDXrqWv3meHVIqK8
 i/IovH3nvVM1mOfAxcOxH6D4rePr66Nb2rFirqEWO8ze34LTi3Mzly/FO4aUvVH0+8SA
 6b1woAh5albYbqpAbm0IfAqHXpL6iL1LT3gYpsryAQsmzma4MbNKfikP5IwGbF9rgj2S
 8z5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tZDQejP2Uh/kuBZJ8hJtfh64z2Jug7j1tZWZWWhfToE=;
 b=jmGCd7bcgfga5IPgpstELlzZniNJsw20DLAfOGX6R8yP0H97N7Ojw5kjTIhWYo+L2F
 qx3Nt6v1+M7+NzuRlWh/etP1kDoiQLDJOMUlhlxsGTyAMZNCof24og8dHD3v4GpZv+Ij
 cR7zIfJ/hYsPQ8wG4aR/EudkxyJ/eTmvm9+aIYqfFH5Be4uSHvPMA6jtkCZJy0HA6qIa
 oADwfUg/hJbT9Ad1M0a843y2QjOGwVyEtvc+OUSgzHz0I0kyLkIl+MhCZVD5mpAP+DJ3
 9qsmkCd034v2YhzhxaB9by9qe5+BlIMqfYFgNghrtIc2Uk0hvUMe/cRDOZebl/zk5zbv
 D5vA==
X-Gm-Message-State: AOAM530mxxWHF0guWG6BYZDZdg6KPd8cR2NkX9QhMS8pcPYofuI2anPo
 NIllrceUcg+6lISy+VYVRdZoIO7j/Go=
X-Google-Smtp-Source: ABdhPJyu3X4vnsw6CZxBSTpViFnrfQB3f0TcDmaQrhqWjD62Ir4XbkzWOgTC398Fv5HCxx4NdrZt9g==
X-Received: by 2002:a05:6402:b06:: with SMTP id
 bm6mr6263568edb.17.1590027548179; 
 Wed, 20 May 2020 19:19:08 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53])
 by smtp.gmail.com with ESMTPSA id y10sm3316108ejw.25.2020.05.20.19.19.06
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2020 19:19:07 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id l18so5127817wrn.6
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2020 19:19:06 -0700 (PDT)
X-Received: by 2002:adf:fccd:: with SMTP id f13mr6753320wrs.386.1590027546599; 
 Wed, 20 May 2020 19:19:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589561218.git.tamas@tklengyel.com>
 <1168bacc61f655f559c236cdf63a6b2beccd4d6b.1589561218.git.tamas@tklengyel.com>
 <28e50e15-410e-096d-51f1-e304c9ef8cdb@suse.com>
In-Reply-To: <28e50e15-410e-096d-51f1-e304c9ef8cdb@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 20 May 2020 20:18:30 -0600
X-Gmail-Original-Message-ID: <CABfawhk36A0vtXVR+TkP3FL7_-zBMWgnPks34r1-XjZG+uBNJw@mail.gmail.com>
Message-ID: <CABfawhk36A0vtXVR+TkP3FL7_-zBMWgnPks34r1-XjZG+uBNJw@mail.gmail.com>
Subject: Re: [PATCH 3/3] xen/vm_event: Add safe to disable vm_event
To: Jan Beulich <jbeulich@suse.com>
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, May 20, 2020 at 7:45 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 15.05.2020 18:53, Tamas K Lengyel wrote:
> > --- a/xen/arch/x86/hvm/hvm.c
> > +++ b/xen/arch/x86/hvm/hvm.c
> > @@ -563,15 +563,41 @@ void hvm_do_resume(struct vcpu *v)
> >          v->arch.hvm.inject_event.vector = HVM_EVENT_VECTOR_UNSET;
> >      }
> >
> > -    if ( unlikely(v->arch.vm_event) && v->arch.monitor.next_interrupt_enabled )
> > +    if ( unlikely(v->arch.vm_event) )
> >      {
> > -        struct x86_event info;
> > +        struct domain *d = v->domain;
>
> const

This can't be const, we disable the safe_to_disable option below after
sending the one-shot async event.

Tamas

