Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C7B1F7F5D
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2020 00:56:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjsZv-00011d-0o; Fri, 12 Jun 2020 22:55:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CO7z=7Z=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jjsZt-00011Y-8W
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 22:55:13 +0000
X-Inumbo-ID: c57dc22a-acff-11ea-b7bb-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c57dc22a-acff-11ea-b7bb-bc764e2007e4;
 Fri, 12 Jun 2020 22:55:12 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r7so11555232wro.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2020 15:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dy1aaxvtcuz3mnfTAC2yz+cvULYV+C1JJaaRRKPziOQ=;
 b=ZC8ITsYj/qpLOUiQqonDHkkHEX628REBBL1p5zXMaqWhFiJqX3MjIQVz85ObEOGb4X
 FJfUep/LzfTIvw23OesoS1Rq4lLgEY2yCL5SvTY+uduuXuosGeis6j300Z8j/0gSY4yz
 hjFLsQB6KH8l+0Iu/vnxtWtG4rg7QQU164F2WQvMFWoIBov9zASMifQKssJziG8jj+ky
 6VQLh+XpHMj9GJdGTJU5aSGzL185afYoIOL9IkgdzjEEQW7Dwcj6OBk5nuuV996R6xld
 IqtE96tyx0/sNll7NL9PJjOwSJCT74HQ1mq+F39uYlrV0cRtpM0tWoPHxFtqVqQs5sGn
 sMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dy1aaxvtcuz3mnfTAC2yz+cvULYV+C1JJaaRRKPziOQ=;
 b=gWdfhIZV4nYibbJuZ2DN2KuK1QNGBmCYKmyh4Sk58O4/uIVUnwVyjsQJqOke/io+tu
 zDJS/QsFUpx3QeT1V2kRhWVfqaksYiwzTNcO47jAUSoto/IxqVj50s8tJKdXNQ9RGlF3
 /O1iMRnBZRwZyrcUSYGjscROINfcIaLTBOQQi0OhoqY15vRoxzUo7e+PtM+IHjxCoZA0
 soGcv58mUIo3U/IWX+gjnZy3cCvNPw+LwOShyLQ8m/35FTwj7xsiMlc4EAbJcJTlFwMg
 OyHO92qp+V4Q/iTf+B4Qh9ks8jsEPxE2g069NDCIGouSTg1JE7lftiboOXyeae8BGAZT
 pHTQ==
X-Gm-Message-State: AOAM532kF8ByjkI+3Zwhvo3xaaaZxwERgqKOI8ua7YTbaHGQLETjHThI
 16RhJlYl4opQZOypw0EDQSkV1e5z+ZlJfi7avro=
X-Google-Smtp-Source: ABdhPJzI8DPRPPsqQXLiJSeicdIJBq0mgLRlQ5KlW7ZQvZayvtkIWn18k9v9fgDzt13Qkl/gwG/kzcu3UEZ+fQp2ZlU=
X-Received: by 2002:adf:f790:: with SMTP id q16mr17657632wrp.399.1592002511356; 
 Fri, 12 Jun 2020 15:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
 <20200612002205.174295-2-volodymyr_babchuk@epam.com>
 <0ce0bbf8-fd15-e87b-727c-56dd7c09cdcb@suse.com>
 <7ec7b6568afb3df41f8407015c198b1ccb341c5b.camel@epam.com>
 <fcedf156-4ed6-c56a-482d-df2f867f7b3e@xen.org>
 <5bd54018f5e045816d25f686124395a1f27a2122.camel@epam.com>
 <51fce146-f2bd-6098-bef9-2fd925ec7f96@xen.org>
 <0fc7034d696bbc601ccf2bd563ef9fb435499eea.camel@suse.com>
In-Reply-To: <0fc7034d696bbc601ccf2bd563ef9fb435499eea.camel@suse.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Fri, 12 Jun 2020 23:54:59 +0100
Message-ID: <CAJ=z9a2efn4jvfdjavaE-mkF0nRj5XijcBJX1b+RokcQuBjjsA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/6] sched: track time spent in IRQ handler
To: Dario Faggioli <dfaggioli@suse.com>
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>, "wl@xen.org" <wl@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 12 Jun 2020 at 21:08, Dario Faggioli <dfaggioli@suse.com> wrote:
>
> On Fri, 2020-06-12 at 13:21 +0100, Julien Grall wrote:
> > On 12/06/2020 12:33, Volodymyr Babchuk wrote:
> > > On Fri, 2020-06-12 at 12:29 +0100, Julien Grall wrote:
> > > > > Basically, this value holds time span between calls to
> > > > > schedule(). This
> > > > > variable gets zeroed out every time scheduler requests for time
> > > > > adjustment value. So, it should not depend on total VM run
> > > > > time.
> > > > This is assuming that the scheduler will be called. With the NULL
> > > > scheduler in place, there is a fair chance this may never be
> > > > called.
> > > >
> >
> Yeah, this is a good point. I mean, I wouldn't be sure about "never",
> as even there, we'd probably have softirqs, tasklets, etc... And I
> still have to look at these patches in more details to figure out
> properly whether they'd help for this.

Unlike x86, Xen doesn't prod another pCPU consistently. :) This was
already discussed in multiple threads in the past (see [1] which not
resolved yet).

So yes, I am pretty confident I can recreate a case where the
scheduling function may never be called on Arm :).

Cheers,

[1] 315740e1-3591-0e11-923a-718e06c36445@arm.com

