Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7E48C4AC
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 01:12:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxftl-0000eu-1s; Tue, 13 Aug 2019 23:08:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ScI+=WJ=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxftj-0000ep-Kf
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 23:08:11 +0000
X-Inumbo-ID: 38222d78-be1f-11e9-aea0-375d5db0300f
Received: from mail-ua1-x92c.google.com (unknown [2607:f8b0:4864:20::92c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38222d78-be1f-11e9-aea0-375d5db0300f;
 Tue, 13 Aug 2019 23:08:10 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id a97so68759uaa.9
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2019 16:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fgya/rUcG7KZZcdqYtRZ62/hKW62tvD+8sNjzJGLZcM=;
 b=ATvSQ7pNeQ0tl/QOtYkj6X2BiMFIGCj8tGmrrFAS9Z15E72im/J1MPPxuLpneVOXVG
 3SRCEfG5eEOKtP3CVXUptAbf3Z6wwA8XbKuuiFrxYsKT4GJk6nWhA57wk9zZ9HL94t4e
 J7lKHgp7w5g4RU28miII00WB50zuWQfFAdj063J3WiVpzHuXHZAxyFAZRx8JZ+dV4xqh
 +Z6QKNXmEgXuOs1+n9GuXUFrOQiPHKfXT+GIJUzaW4yytTNTRCr1qvbzlPsy0r3/ab2/
 x+x7zVKMcxVs4IYo/HPWckAb+r752K56pG1zHXi3ddFjcdn0S8LvnjBJhjrddd+ldc78
 BdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fgya/rUcG7KZZcdqYtRZ62/hKW62tvD+8sNjzJGLZcM=;
 b=tQGJTO0LyUNEzPSKJGs2TjuzOIcZq0rzvIaMUgkrwxyyCDXnosS6vquABTmvc0OgnY
 UMNtXP3UhL5qFV1dIKcilnl/IQusWxGSMVAVK50EFWrarmY1nWEC9+n4h+5QGX4iSr1K
 AlrTwjAfG0nNnV0rFxal8pFY7YX0hXF6CjBX9hLQt+w1tzt/YyVU0lXo+p7ZCYMTZKS1
 uYmph6obSm/M286kSyCQ+PXZbQwdMONwm8NBejEhyn93sRaV8cLAHh97hE9M8yu//oYY
 tgJV7HOFEUVI9vSPUryqDKpbwaLlaWJ6LaIe02WAMPlEanKfUW39Ji4P1CxS3muUTLkE
 kHnw==
X-Gm-Message-State: APjAAAXx15+U5EcRhc1sT7AvYlQQj+lrFN8fNeLKHPo9Ihd8a84HiH4n
 P4EOQgoCEYCMWtbZjB2OqQGVm+CX8UygFIQK5HY=
X-Google-Smtp-Source: APXvYqwuGmNr5kmfMD8VhDIlDZwiLxeO4jtJPMUdddUd7pvsEDG5lPclRFHPTKMlxK9LxI5j4EhUusv2TujD8iDW8pg=
X-Received: by 2002:ab0:6801:: with SMTP id z1mr85126uar.113.1565737690281;
 Tue, 13 Aug 2019 16:08:10 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.1908071119470.2451@sstabellini-ThinkPad-T480s>
 <f986544f59e1b2e9fddba5090fc3c706c38e1ad3.camel@suse.com>
 <alpine.DEB.2.21.1908091127080.7788@sstabellini-ThinkPad-T480s>
 <6bc0e21d79c4f02ad89c94fa732a32a57bdc8521.camel@suse.com>
 <bfcd8473-a73b-932c-3cdf-7ad41c14e4c0@arm.com>
 <6f44856f428c936f9c1913f3f35196dff6044509.camel@suse.com>
 <fdbf9a17-acbf-3402-6b69-d1af0193df53@arm.com>
 <e82af45e0841f9cf8f27ac93c698e4c4a2d4c44e.camel@suse.com>
In-Reply-To: <e82af45e0841f9cf8f27ac93c698e4c4a2d4c44e.camel@suse.com>
From: Julien Grall <julien.grall@gmail.com>
Date: Wed, 14 Aug 2019 00:07:57 +0100
Message-ID: <CAF3u54CpObhGqbWvgMHno3QUEVWtugKyD19L3N=PmQS45_SSUQ@mail.gmail.com>
To: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [Xen-devel] dom0less + sched=null => broken in staging
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: multipart/mixed; boundary="===============3255213137260254489=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3255213137260254489==
Content-Type: multipart/alternative; boundary="000000000000d73d67059007b65a"

--000000000000d73d67059007b65a
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Aug 2019, 23:39 Dario Faggioli, <dfaggioli@suse.com> wrote:

> On Tue, 2019-08-13 at 19:43 +0100, Julien Grall wrote:
> > On 8/13/19 6:34 PM, Dario Faggioli wrote:
> > > On Tue, 2019-08-13 at 17:52 +0100, Julien Grall wrote:
> > > >
> > > So, unless the flag gets cleared again, or something else happens
> > > that
> > > makes the vCPU(s) fail the vcpu_runnable() check in
> > > domain_unpause()->vcpu_wake(), I don't see why the wakeup that let
> > > the
> > > null scheduler start scheduling the vCPU doesn't happen... as it
> > > instead does on x86 or !dom0less ARM (because, as far as I've
> > > understood, it's only dom0less that doesn't work, it this correct?)
> >
> > Yes, I quickly tried to use NULL scheduler with just dom0 and it
> > boots.
> >
> Ok.
>
> > Interestingly, I can't see the log:
> >
> > (XEN) Freed 328kB init memory.
> >
> > This is called as part of init_done before CPU0 goes into the idle
> > loop.
> >
> > Adding more debug, it is getting stuck when calling
> > domain_unpause_by_controller for dom0. Specifically vcpu_wake on
> > dom0v0.
> >
> Wait... Is this also with just dom0, or when trying dom0less with some
> domUs?
>

Dom0 is unpaused after all the domUs. In other words, the scheduler will
see domUs first.



> > The loop to assign a pCPU in null_vcpu_wake() is turning into an
> > infinite loop. Indeed the loop is trying to pick CPU0 for dom0v0 that
> > is
> > already used by dom1v0. So the problem is in pick_cpu() or the data
> > used
> > by it.
> >
> Ah, interesting...
>
> > It feels to me this is an affinity problem. Note that I didn't
> > request
> > to pin dom0 vCPUs.
> >
> Yep, looking better, I think I've seen something suspicious now. I'll
> send another debug patch.
>

You may want to see my last e-mail first just in case it rings a bell. :) I
did more debugging during the evening.

Cheers,



> Regards
> --
> Dario Faggioli, Ph.D
> http://about.me/dario.faggioli
> Virtualization Software Engineer
> SUSE Labs, SUSE https://www.suse.com/
> -------------------------------------------------------------------
> <<This happens because _I_ choose it to happen!>> (Raistlin Majere)
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--000000000000d73d67059007b65a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, 13 Aug 2019, 23:39 Dario Faggioli, &lt;<a href=
=3D"mailto:dfaggioli@suse.com">dfaggioli@suse.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">On Tue, 2019-08-13 at 19:43 +0100, Julien Gra=
ll wrote:<br>
&gt; On 8/13/19 6:34 PM, Dario Faggioli wrote:<br>
&gt; &gt; On Tue, 2019-08-13 at 17:52 +0100, Julien Grall wrote:<br>
&gt; &gt; &gt; <br>
&gt; &gt; So, unless the flag gets cleared again, or something else happens=
<br>
&gt; &gt; that<br>
&gt; &gt; makes the vCPU(s) fail the vcpu_runnable() check in<br>
&gt; &gt; domain_unpause()-&gt;vcpu_wake(), I don&#39;t see why the wakeup =
that let<br>
&gt; &gt; the<br>
&gt; &gt; null scheduler start scheduling the vCPU doesn&#39;t happen... as=
 it<br>
&gt; &gt; instead does on x86 or !dom0less ARM (because, as far as I&#39;ve=
<br>
&gt; &gt; understood, it&#39;s only dom0less that doesn&#39;t work, it this=
 correct?)<br>
&gt; <br>
&gt; Yes, I quickly tried to use NULL scheduler with just dom0 and it<br>
&gt; boots.<br>
&gt; <br>
Ok.<br>
<br>
&gt; Interestingly, I can&#39;t see the log:<br>
&gt; <br>
&gt; (XEN) Freed 328kB init memory.<br>
&gt; <br>
&gt; This is called as part of init_done before CPU0 goes into the idle<br>
&gt; loop.<br>
&gt; <br>
&gt; Adding more debug, it is getting stuck when calling <br>
&gt; domain_unpause_by_controller for dom0. Specifically vcpu_wake on<br>
&gt; dom0v0.<br>
&gt; <br>
Wait... Is this also with just dom0, or when trying dom0less with some<br>
domUs?<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Dom0 is unpaused after all the domUs. In other words, the scheduler w=
ill see domUs first.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br=
></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
<br>
&gt; The loop to assign a pCPU in null_vcpu_wake() is turning into an <br>
&gt; infinite loop. Indeed the loop is trying to pick CPU0 for dom0v0 that<=
br>
&gt; is <br>
&gt; already used by dom1v0. So the problem is in pick_cpu() or the data<br=
>
&gt; used <br>
&gt; by it.<br>
&gt; <br>
Ah, interesting...<br>
<br>
&gt; It feels to me this is an affinity problem. Note that I didn&#39;t<br>
&gt; request <br>
&gt; to pin dom0 vCPUs.<br>
&gt; <br>
Yep, looking better, I think I&#39;ve seen something suspicious now. I&#39;=
ll<br>
send another debug patch.<br></blockquote></div></div><div dir=3D"auto"><br=
></div><div dir=3D"auto">You may want to see my last e-mail first just in c=
ase it rings a bell. :) I did more debugging during the evening.</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Cheers,</div><div dir=3D"auto"><br=
></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
<br>
Regards<br>
-- <br>
Dario Faggioli, Ph.D<br>
<a href=3D"http://about.me/dario.faggioli" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">http://about.me/dario.faggioli</a><br>
Virtualization Software Engineer<br>
SUSE Labs, SUSE <a href=3D"https://www.suse.com/" rel=3D"noreferrer norefer=
rer" target=3D"_blank">https://www.suse.com/</a><br>
-------------------------------------------------------------------<br>
&lt;&lt;This happens because _I_ choose it to happen!&gt;&gt; (Raistlin Maj=
ere)<br>
<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank" rel=3D"=
noreferrer">Xen-devel@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer noreferrer" target=3D"_blank">https://lists.xenproject.org/mailm=
an/listinfo/xen-devel</a></blockquote></div></div></div>

--000000000000d73d67059007b65a--


--===============3255213137260254489==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3255213137260254489==--

