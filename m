Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B09F91DB55E
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 15:43:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbP06-0004WZ-TH; Wed, 20 May 2020 13:43:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PdaM=7C=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jbP05-0004WU-7V
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 13:43:13 +0000
X-Inumbo-ID: d913194c-9a9f-11ea-ae69-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d913194c-9a9f-11ea-ae69-bc764e2007e4;
 Wed, 20 May 2020 13:43:12 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id l25so3108370edj.4
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2020 06:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RUIKCU/ZJORNs0A4gvnhf+OWb3nG8Xn3Lrmx2o7yhTs=;
 b=W/FT6hw/8kMejKs/XUDm0f2KSG6asWYRqRJHTzuh+Oo8E0kkNZiJytnpKTEVh6hU4m
 Ee7BHmvi3pf3Zr/t71AALly+Y/PN0R1NGvjkxZQHpxiRAQK3e9IituX6GMQRluCHwGgV
 sGYkIlZp+eti6Bxnqb+qf/xSfgXrmzwH3Oio4TWOouwecKL1HQQZgTa10J59nOwHZcun
 Y3NPgCYbDkiftL253etdrSemOcMz7OWKE0kPja4WUXCQMVvdcMafJ+9kSyhu1VFcSCxr
 VwaxIT++kfJVzKz/Zy3BAJJrtt5wTUGUoRPlv39PspCnP9+S+q8pzCAIltY7m+ehdXiT
 vRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RUIKCU/ZJORNs0A4gvnhf+OWb3nG8Xn3Lrmx2o7yhTs=;
 b=kTLL9xhIuePGKd/VA1XqGxSGycUNMqz1//+z10+2OFc8/LfgJklAxG+ZEfIQ1iABwt
 nO4Wqju13pBKj6siVFr1BEASsNnWxJQeS9ffqMQ8Lm9Dk0nneCs38Z4ze/TIXZhxxyWm
 Sc6HgBXe70fAfqSL/oJSfzRkqknsxDJZzMzC9huqeq7xsTwAjhtN3u9s+k9a9nvWQLnY
 HMfj0PdcqKvFaSOEpBJcZ3hTykL0TK/WzYJbqm7gTW2SXaeaeKx2+P0ZeozCKtAuWYmF
 ZLEBLtWQ3wOVWG27FoyXczi5PkerzJUWn+baSJKMwiR1YFoCBswVRxbawxKmFouLyyZJ
 SgCA==
X-Gm-Message-State: AOAM531AO7cMDZOBaHL+NsqBDxSxOXyX/4PXGP14obfBqUjFsV71aJmX
 FXY129miAlr0yBtjat92H4Zxq4YBdVw=
X-Google-Smtp-Source: ABdhPJznjXfUyzWjbAAdS3E5rmJl153LX5+vjbc/Z59yjB0MUn/5pbJnPg+twZ4/tGLpnNa4rVRDzg==
X-Received: by 2002:a05:6402:31b5:: with SMTP id
 dj21mr3668236edb.160.1589982191493; 
 Wed, 20 May 2020 06:43:11 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51])
 by smtp.gmail.com with ESMTPSA id b11sm2034885ejl.3.2020.05.20.06.43.09
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2020 06:43:09 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id l11so3242260wru.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2020 06:43:09 -0700 (PDT)
X-Received: by 2002:adf:fccd:: with SMTP id f13mr4464584wrs.386.1589982189358; 
 Wed, 20 May 2020 06:43:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589561218.git.tamas@tklengyel.com>
 <72d4d282dd20b79ebdbaf1f70865ea38b075c5c0.1589561218.git.tamas@tklengyel.com>
 <ec19beb2-6e69-4e62-b260-0d76b2a7f5a7@suse.com>
In-Reply-To: <ec19beb2-6e69-4e62-b260-0d76b2a7f5a7@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 20 May 2020 07:42:33 -0600
X-Gmail-Original-Message-ID: <CABfawhmg+ZtzKvJecAJE8=C+rnPiywUy8vO81Yz9dC4j2h-feg@mail.gmail.com>
Message-ID: <CABfawhmg+ZtzKvJecAJE8=C+rnPiywUy8vO81Yz9dC4j2h-feg@mail.gmail.com>
Subject: Re: [PATCH 1/3] xen/monitor: Control register values
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

On Wed, May 20, 2020 at 7:36 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 15.05.2020 18:53, Tamas K Lengyel wrote:
> > Extend the monitor_op domctl to include option that enables
> > controlling what values certain registers are permitted to hold
> > by a monitor subscriber.
>
> This needs a bit more explanation, especially for those of us
> who aren't that introspection savvy. For example, from the text
> here I didn't expect a simple bool control, but something where
> actual (register) values get passed back and forth.
>
> > --- a/xen/arch/x86/hvm/hvm.c
> > +++ b/xen/arch/x86/hvm/hvm.c
> > @@ -2263,9 +2263,10 @@ int hvm_set_cr0(unsigned long value, bool may_defer)
> >      {
> >          ASSERT(v->arch.vm_event);
> >
> > -        if ( hvm_monitor_crX(CR0, value, old_value) )
> > +        if ( hvm_monitor_crX(CR0, value, old_value) &&
> > +             v->domain->arch.monitor.control_register_values )
> >          {
> > -            /* The actual write will occur in hvm_do_resume(), if permitted. */
> > +            /* The actual write will occur in hvm_do_resume, if permitted. */
>
> Please can you leave alone this and the similar comments below.
> And for consistency _add_ parentheses to the one new instance
> you add?

I changed to because now it doesn't fit into the 80-line limit below,
and then changed it everywhere _for_ consistency.

>
> > --- a/xen/arch/x86/monitor.c
> > +++ b/xen/arch/x86/monitor.c
> > @@ -144,7 +144,15 @@ int arch_monitor_domctl_event(struct domain *d,
> >                                struct xen_domctl_monitor_op *mop)
> >  {
> >      struct arch_domain *ad = &d->arch;
> > -    bool requested_status = (XEN_DOMCTL_MONITOR_OP_ENABLE == mop->op);
> > +    bool requested_status;
> > +
> > +    if ( XEN_DOMCTL_MONITOR_OP_CONTROL_REGISTERS == mop->op )
> > +    {
> > +        ad->monitor.control_register_values = true;
>
> And there's no way to clear this flag again?

There is. Disable the monitor vm_event interface and reinitialize.

Tamas

