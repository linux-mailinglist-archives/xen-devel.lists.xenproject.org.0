Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6BD19B47D
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 19:05:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJgl0-0002Pb-JL; Wed, 01 Apr 2020 17:02:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=N9LQ=5R=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1jJgkz-0002PW-37
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 17:02:25 +0000
X-Inumbo-ID: 8e5acf0c-743a-11ea-83d8-bc764e2007e4
Received: from mail-ed1-x533.google.com (unknown [2a00:1450:4864:20::533])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e5acf0c-743a-11ea-83d8-bc764e2007e4;
 Wed, 01 Apr 2020 17:02:23 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id a20so792663edj.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2020 10:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cQh6fYzXhvJNcO2hn+pkFEQjxvmHkAHYbfxx6QdgR/s=;
 b=UtWeoNn6IppFL4deq7SnmSTOp4zMnHlpZiM3hsczG9hnEp3OOAwhqLDb5IMpJZdOLl
 pR3oD+Q5HYQnnZ3d0qBklTKTzByJV5arKCjw3en3G+3u89SO9vJP6/JcVSVNhKDpyK4D
 N4yDP7U290s3abXCkjgO8t6LNWSvgpLpgVwvz9VC5SbhMOLnBprxj37/CYzoxFq97113
 UxmMr/0V0n0FcFAsp5D1hZS9LHqDBLS9EapVDL6G2BFwetuqav2MsUqFOYR+j0bWDITr
 7XMSB3uUvlf3pNbBkKarhqLxgVfcZs1sXgnnHGz87kGMqe0n0i+OsA25VnzZQEEajaA9
 TB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cQh6fYzXhvJNcO2hn+pkFEQjxvmHkAHYbfxx6QdgR/s=;
 b=mSbTznrF48NIo26tmm5v1fTVWlYrp6cRT6Pk5yIHAIRl8iRO7FVWmeqplUYjwjKWX2
 ZbG8vzFjB84SauXZDLlsPiZXhn0/inSfzOWkXh7qhVNh/UZlIkCMF3lCDngGcNtEJLaM
 H6WsCUWuyW7bAAi40CjShT6AloMkgRgjrMQk57W5T/gslItbNzu1qlO77d/AKJv1RBs4
 HKrjKkbGQO633EUa5OZu7UMkQ80ofUQdqhrkRt7NexQWKyfG2TSfVS71sNbp1bBSgqmx
 dcCu14hWg9IWxZFhDl1iV1RWUsgw1FQ7o1OTdQmv3CdbB0ia+NGwvRM8bBHtNuo/MVVu
 V+eQ==
X-Gm-Message-State: ANhLgQ3O8KTW6UV/CBxS8YEPTHNBHILJFkGbZt8Yu1+C1ANc8QdHiNmN
 UB2IK6k+Oajv0CFjtWKDNsxjDdBBjcPc5xGsyvQ=
X-Google-Smtp-Source: ADFU+vuXAkLwelVjzC+VwiQGabnAxVGQjnoYc12Qeu5R77A+f5AOkeCwuIF4sire6h0QTgErz0hloT9KeglR639oOhc=
X-Received: by 2002:a05:6402:31ad:: with SMTP id
 dj13mr9310871edb.60.1585760543001; 
 Wed, 01 Apr 2020 10:02:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200327023451.20271-1-sstabellini@kernel.org>
 <38f56c3e-8f7d-7aee-8216-73398f4543bb@xen.org>
 <alpine.DEB.2.21.2003300932430.4572@sstabellini-ThinkPad-T480s>
 <5deb3992-3cf5-2b00-8cef-af75ed83a1fd@xen.org>
 <alpine.DEB.2.21.2003311121120.4572@sstabellini-ThinkPad-T480s>
 <2bb21703-8078-cd92-0463-bea049413f32@xen.org>
 <A33FEB65-F844-4CA6-BAE0-F0C881CFD381@arm.com>
In-Reply-To: <A33FEB65-F844-4CA6-BAE0-F0C881CFD381@arm.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Wed, 1 Apr 2020 18:02:11 +0100
Message-ID: <CAFLBxZYYWOS8D2-YPFWZ2n4RdPTOjfmzMpYby4JYSQ_rJM_zBw@mail.gmail.com>
Subject: Re: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Content-Type: multipart/alternative; boundary="000000000000dd526205a23da5c2"
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
Cc: Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Wei Xu <xuwei5@hisilicon.com>, nd <nd@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--000000000000dd526205a23da5c2
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 1, 2020 at 10:54 AM Bertrand Marquis <Bertrand.Marquis@arm.com>
wrote:

>
>
> On 1 Apr 2020, at 09:30, Julien Grall <julien@xen.org> wrote:
>
>
>
> On 01/04/2020 01:57, Stefano Stabellini wrote:
>
> On Mon, 30 Mar 2020, Julien Grall wrote:
>
> Hi Stefano,
>
> On 30/03/2020 17:35, Stefano Stabellini wrote:
>
> On Sat, 28 Mar 2020, Julien Grall wrote:
>
> qHi Stefano,
>
> On 27/03/2020 02:34, Stefano Stabellini wrote:
>
> This is a simple implementation of GICD_ICACTIVER / GICD_ISACTIVER
> reads. It doesn't take into account the latest state of interrupts on
> other vCPUs. Only the current vCPU is up-to-date. A full solution is
> not possible because it would require synchronization among all vCPUs,
> which would be very expensive in terms or latency.
>
>
> Your sentence suggests you have number showing that correctly emulating
> the
> registers would be too slow. Mind sharing them?
>
>
> No, I don't have any numbers. Would you prefer a different wording or a
> better explanation? I also realized there is a typo in there (or/of).
>
> Let me start with I think correctness is more important than speed.
> So I would have expected your commit message to contain some fact why
> synchronization is going to be slow and why this is a problem.
>
> To give you a concrete example, the implementation of set/way instructions
> are
> really slow (it could take a few seconds depending on the setup). However,
> this was fine because not implementing them correctly would have a greater
> impact on the guest (corruption) and they are not used often.
>
> I don't think the performance in our case will be in same order magnitude.
> It
> is most likely to be in the range of milliseconds (if not less) which I
> think
> is acceptable for emulation (particularly for the vGIC) and the current
> uses.
>
> Writing on the mailing list some of our discussions today.
> Correctness is not just in terms of compliance to a specification but it
> is also about not breaking guests. Introducing latency in the range of
> milliseconds, or hundreds of microseconds, would break any latency
> sensitive workloads. We don't have numbers so we don't know for certain
> the effect that your suggestion would have.
>
>
> You missed part of the discussion. I don't disagree that latency is
> important. However, if an implementation is only 95% reliable, then it
> means 5% of the time your guest may break (corruption, crash, deadlock...).
> At which point the latency is the last of your concern.
>
> It would be interesting to have those numbers, and I'll add to my TODO
> list to run the experiments you suggested, but I'll put it on the
> back-burner (from a Xilinx perspective it is low priority as no
> customers are affected.)
>
>
> How about we get a correct implementation merge first and then discuss
> about optimization? This would allow the community to check whether there
> are actually noticeable latency in their workload.
>
>
> Hi,
>
> I am not sure that pushing something with a performance impact to later
> fix it is the right approach here.
>
> The patch is an improvement compared to the current code and it can be
> further improved later to handle more cases (other cores).
>
> If we really have to sync all vCPUs here, this will cost a lot and the
> result will still be the status in the past in fact because nothing will
> make sure that at the point the guest gets back the value it is still valid.
>

The same is true on real hardware, right?

Looking at this discussion as a non-ARM person, it sounds a bit like ARM
specified this in a way that was useless-but-easy-to-implement-so-why-not;
but it turns out to be useless-but-hard-to-implement virtualized.

On the one hand, I'm sympathetic to Julien's point of view; I very much
don't like the idea of silently changing behavior just because the
specified behavior is inconvenient for us.

On the other hand, I'm sympathetic to Stefano's point of view, that it's
pointless to introduce a load of overhead and jitter to implement behavior
which nobody in their right mind would even want to use (at least
virtualized).

What I think would be *ideal* would be for ARM to change the specification
to make it easier virtualize.  For instance:, by specifying that the
register *may* contain information about other cores, but may not; or, that
the register will contain information on other cores on real hardware, but
not virtualized.

Barring that, I think we should have a centralized place to document
deviations from the spec; and I think changes to this spec should be
coordinated with KVM (and maybe ACRN?), to minimize hypervisor-specific
deviations.

Thoughts?

 -George

--000000000000dd526205a23da5c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 1, 2020 at 10:54 AM Bertr=
and Marquis &lt;<a href=3D"mailto:Bertrand.Marquis@arm.com">Bertrand.Marqui=
s@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">



<div style=3D"overflow-wrap: break-word;">
<br>
<div><br>
<blockquote type=3D"cite">
<div>On 1 Apr 2020, at 09:30, Julien Grall &lt;<a href=3D"mailto:julien@xen=
.org" target=3D"_blank">julien@xen.org</a>&gt; wrote:</div>
<br>
<div><br style=3D"font-family:Helvetica;font-size:12px;font-style:normal;fo=
nt-variant-caps:normal;font-weight:normal;letter-spacing:normal;text-align:=
start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0=
px;text-decoration:none">
<br style=3D"font-family:Helvetica;font-size:12px;font-style:normal;font-va=
riant-caps:normal;font-weight:normal;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;te=
xt-decoration:none">
<span style=3D"font-family:Helvetica;font-size:12px;font-style:normal;font-=
variant-caps:normal;font-weight:normal;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
text-decoration:none;float:none;display:inline">On
 01/04/2020 01:57, Stefano Stabellini wrote:</span><br style=3D"font-family=
:Helvetica;font-size:12px;font-style:normal;font-variant-caps:normal;font-w=
eight:normal;letter-spacing:normal;text-align:start;text-indent:0px;text-tr=
ansform:none;white-space:normal;word-spacing:0px;text-decoration:none">
<blockquote type=3D"cite" style=3D"font-family:Helvetica;font-size:12px;fon=
t-style:normal;font-variant-caps:normal;font-weight:normal;letter-spacing:n=
ormal;text-align:start;text-indent:0px;text-transform:none;white-space:norm=
al;word-spacing:0px;text-decoration:none">
On Mon, 30 Mar 2020, Julien Grall wrote:<br>
<blockquote type=3D"cite">Hi Stefano,<br>
<br>
On 30/03/2020 17:35, Stefano Stabellini wrote:<br>
<blockquote type=3D"cite">On Sat, 28 Mar 2020, Julien Grall wrote:<br>
<blockquote type=3D"cite">qHi Stefano,<br>
<br>
On 27/03/2020 02:34, Stefano Stabellini wrote:<br>
<blockquote type=3D"cite">This is a simple implementation of GICD_ICACTIVER=
 / GICD_ISACTIVER<br>
reads. It doesn&#39;t take into account the latest state of interrupts on<b=
r>
other vCPUs. Only the current vCPU is up-to-date. A full solution is<br>
not possible because it would require synchronization among all vCPUs,<br>
which would be very expensive in terms or latency.<br>
</blockquote>
<br>
Your sentence suggests you have number showing that correctly emulating<br>
the<br>
registers would be too slow. Mind sharing them?<br>
</blockquote>
<br>
No, I don&#39;t have any numbers. Would you prefer a different wording or a=
<br>
better explanation? I also realized there is a typo in there (or/of).<br>
</blockquote>
Let me start with I think correctness is more important than speed.<br>
So I would have expected your commit message to contain some fact why<br>
synchronization is going to be slow and why this is a problem.<br>
<br>
To give you a concrete example, the implementation of set/way instructions =
are<br>
really slow (it could take a few seconds depending on the setup). However,<=
br>
this was fine because not implementing them correctly would have a greater<=
br>
impact on the guest (corruption) and they are not used often.<br>
<br>
I don&#39;t think the performance in our case will be in same order magnitu=
de. It<br>
is most likely to be in the range of milliseconds (if not less) which I thi=
nk<br>
is acceptable for emulation (particularly for the vGIC) and the current use=
s.<br>
</blockquote>
Writing on the mailing list some of our discussions today.<br>
Correctness is not just in terms of compliance to a specification but it<br=
>
is also about not breaking guests. Introducing latency in the range of<br>
milliseconds, or hundreds of microseconds, would break any latency<br>
sensitive workloads. We don&#39;t have numbers so we don&#39;t know for cer=
tain<br>
the effect that your suggestion would have.<br>
</blockquote>
<br style=3D"font-family:Helvetica;font-size:12px;font-style:normal;font-va=
riant-caps:normal;font-weight:normal;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;te=
xt-decoration:none">
<span style=3D"font-family:Helvetica;font-size:12px;font-style:normal;font-=
variant-caps:normal;font-weight:normal;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
text-decoration:none;float:none;display:inline">You
 missed part of the discussion. I don&#39;t disagree that latency is import=
ant. However, if an implementation is only 95% reliable, then it means 5% o=
f the time your guest may break (corruption, crash, deadlock...). At which =
point the latency is the last of your
 concern.</span><br style=3D"font-family:Helvetica;font-size:12px;font-styl=
e:normal;font-variant-caps:normal;font-weight:normal;letter-spacing:normal;=
text-align:start;text-indent:0px;text-transform:none;white-space:normal;wor=
d-spacing:0px;text-decoration:none">
<br style=3D"font-family:Helvetica;font-size:12px;font-style:normal;font-va=
riant-caps:normal;font-weight:normal;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;te=
xt-decoration:none">
<blockquote type=3D"cite" style=3D"font-family:Helvetica;font-size:12px;fon=
t-style:normal;font-variant-caps:normal;font-weight:normal;letter-spacing:n=
ormal;text-align:start;text-indent:0px;text-transform:none;white-space:norm=
al;word-spacing:0px;text-decoration:none">
It would be interesting to have those numbers, and I&#39;ll add to my TODO<=
br>
list to run the experiments you suggested, but I&#39;ll put it on the<br>
back-burner (from a Xilinx perspective it is low priority as no<br>
customers are affected.)<br>
</blockquote>
<br style=3D"font-family:Helvetica;font-size:12px;font-style:normal;font-va=
riant-caps:normal;font-weight:normal;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;te=
xt-decoration:none">
<span style=3D"font-family:Helvetica;font-size:12px;font-style:normal;font-=
variant-caps:normal;font-weight:normal;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
text-decoration:none;float:none;display:inline">How
 about we get a correct implementation merge first and then discuss about o=
ptimization? This would allow the community to check whether there are actu=
ally noticeable latency in their workload.</span><br style=3D"font-family:H=
elvetica;font-size:12px;font-style:normal;font-variant-caps:normal;font-wei=
ght:normal;letter-spacing:normal;text-align:start;text-indent:0px;text-tran=
sform:none;white-space:normal;word-spacing:0px;text-decoration:none">
</div>
</blockquote>
<div><br>
</div>
<div>Hi,</div>
<div><br>
</div>
<div>I am not sure that pushing something with a performance impact to late=
r fix it is the right approach here.</div>
<div><br>
</div>
<div>The patch is an improvement compared to the current code and it can be=
 further improved later to handle more cases (other cores).</div>
<div><br>
</div>
<div>If we really have to sync all vCPUs here, this will cost a lot and the=
 result will still be the status in the past in fact because nothing will m=
ake sure that at the point the guest gets back the value it is still valid.=
</div></div></div></blockquote><div><br></div><div>The same is true on real=
 hardware, right?</div><div><br></div><div>Looking at this discussion as a =
non-ARM person, it sounds a bit like ARM specified this in a way that was u=
seless-but-easy-to-implement-so-why-not; but it turns out to be useless-but=
-hard-to-implement virtualized.</div><div><br></div><div>On the one hand, I=
&#39;m sympathetic to Julien&#39;s point of view; I very much don&#39;t lik=
e the idea of silently changing behavior just because the specified behavio=
r is inconvenient for us.</div><div><br></div><div>On the other hand, I&#39=
;m sympathetic to Stefano&#39;s point of view, that it&#39;s pointless to i=
ntroduce a load of overhead and jitter to implement behavior which nobody i=
n their right mind would even want to use (at least virtualized).<br></div>=
<div><br></div><div>What I think would be *ideal* would be for ARM to chang=
e the specification to make it easier virtualize.=C2=A0 For instance:, by s=
pecifying that the register *may* contain information about other cores, bu=
t may not; or, that the register will contain information on other cores on=
 real hardware, but not virtualized.<br></div><div><br></div>Barring that, =
I think we should have a centralized place to document deviations from the =
spec; and I think changes to this spec should be coordinated with KVM (and =
maybe ACRN?), to minimize hypervisor-specific deviations.</div><div class=
=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Thoughts?</div><div c=
lass=3D"gmail_quote"><br></div><div class=3D"gmail_quote">=C2=A0-George<br>=
</div></div>

--000000000000dd526205a23da5c2--

