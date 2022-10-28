Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 770656115D3
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 17:27:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.432141.684892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooRGj-0005Uf-Gj; Fri, 28 Oct 2022 15:27:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432141.684892; Fri, 28 Oct 2022 15:27:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooRGj-0005Rg-Dc; Fri, 28 Oct 2022 15:27:37 +0000
Received: by outflank-mailman (input) for mailman id 432141;
 Fri, 28 Oct 2022 15:27:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yvsd=25=gmail.com=dunlapg@srs-se1.protection.inumbo.net>)
 id 1ooRGh-0005LA-QP
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 15:27:35 +0000
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [2607:f8b0:4864:20::92f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b354736-56d5-11ed-8fd0-01056ac49cbb;
 Fri, 28 Oct 2022 17:27:34 +0200 (CEST)
Received: by mail-ua1-x92f.google.com with SMTP id c12so1919103uat.13
 for <xen-devel@lists.xenproject.org>; Fri, 28 Oct 2022 08:27:34 -0700 (PDT)
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
X-Inumbo-ID: 0b354736-56d5-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mF/SditKV00XS5Xvar+K/S/BfS9x863TyTptR2UvUUg=;
        b=QnB2jMTBvaKQeI4HJ5BX1fUWbnEfpu+qVuJZuDeHwXfbY+UcZKuB4mTLhE1nYqEK/j
         7al6V4kQI+ZVcxj5vMqjn2EUolfk5Yf/8LVI7ZWgUfxR2pV/ZF5HD5ZFKpAfuhOvvGsQ
         c5x+cNpvglzqDVsG6Fr1ETSOuBrl8vzLIH0SaW+IV3kA5x7XS5MwfVa+JznJZ9xwulOS
         fIR04CwQKxW/nqOnbfOcw6c5KojiCKOyzccbbSNDH7qQYxE4Bpc8733s3Xes6Rk/rz4x
         V/nosSBCniSns705Dj8bHk9WawzpjrypmMH0Qodg3XeF9obFqMGyg/KExrH1h98uUPV4
         lzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mF/SditKV00XS5Xvar+K/S/BfS9x863TyTptR2UvUUg=;
        b=UBAWmXxMmiR//TDOONvR6Lq2ajQfOdAEsq/eqjljnNsyBfy/+gWrAYdkVZPQQ5YC/k
         8a+6Z0NJBu44m+CowZq/wZhqdbBSqE/yOhWT+xKAtUWJQL5EWLN3qezF4X3CWDcAeaJC
         6TMBqG3R7limLci88Ry3JiawXrje0roScYdIEdfWG2br4G7oVxl7DeEMt1rSMGShayn6
         snTK2u46TwuldtUb8unmhIUP1JKYjHQRLqg0OEhFx0DUmT7W+OQalGHGg2sNbMi4OWDd
         ZqvOeUNLBfvIp5w+4/OLaRgaAb1Y2FZ7HcTZpkpLzfiw9mlw4is3em30Uu3RNur0WOgx
         n95A==
X-Gm-Message-State: ACrzQf1GFrYZSq9oDghBRH5aqfnrQAtH8ZkuLlzub3BWt+a1I+BIx3KG
	+Na8NyYb+2qTUJ22WhOdrctUPPvabnEmHS1KZT8=
X-Google-Smtp-Source: AMsMyM5rXw5n8LqY1V8Rco1arTg/MAzPNOdpvzQ99TsRjn7p3vxre+yfwkrd9fTjJFDvk7tMVl4b9AvE8gDFc/3tqeU=
X-Received: by 2002:a9f:350c:0:b0:3e4:1518:7e8b with SMTP id
 o12-20020a9f350c000000b003e415187e8bmr120960uao.34.1666970852991; Fri, 28 Oct
 2022 08:27:32 -0700 (PDT)
MIME-Version: 1.0
References: <20221026102018.4144-1-andrew.cooper3@citrix.com>
 <20221026102018.4144-2-andrew.cooper3@citrix.com> <ffb8bdb8-f54b-2107-ce1a-775337c172ac@suse.com>
 <0f048bd2-d08c-8bd5-2a20-7e49e794c679@citrix.com> <8a8bc184-6237-ed24-8d9f-daa3c36df915@suse.com>
In-Reply-To: <8a8bc184-6237-ed24-8d9f-daa3c36df915@suse.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Fri, 28 Oct 2022 16:27:21 +0100
Message-ID: <CAFLBxZbWkLSMxXAYRGYc9Z3Vvj6bT+m7nvdiZgWRdr+_nF0BfQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] xen: Introduce non-broken hypercalls for the p2m pool size
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Henry Wang <Henry.Wang@arm.com>, Anthony Perard <anthony.perard@citrix.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap <george.dunlap@citrix.com>
Content-Type: multipart/alternative; boundary="0000000000008b280f05ec19e56c"

--0000000000008b280f05ec19e56c
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 27, 2022 at 8:12 AM Jan Beulich <jbeulich@suse.com> wrote:

> On 26.10.2022 21:22, Andrew Cooper wrote:
> > On 26/10/2022 14:42, Jan Beulich wrote:
>


> > paging isn't a great name.  While it's what we call the infrastructure
> > in x86, it has nothing to do with paging things out to disk (the thing
> > everyone associates the name with), nor the xenpaging infrastructure
> > (Xen's version of what OS paging supposedly means).
>
> Okay, "paging" can be somewhat misleading. But "p2m" also doesn't fit
> the use(s) on x86. Yet we'd like to use a name clearly better than the
> previous (and yet more wrong/misleading) "shadow". I have to admit that
> I can't think of any other sensible name, and among the ones discussed
> I still think "paging" is the one coming closest despite the
> generally different meaning of the word elsewhere.
>

Inside the world of operating systems / hypervisors, "paging" has always
meant "things related to a pagetable"; this includes "paging out to disk".
In fact, the latter already has a perfectly good name -- "swap" (e.g., swap
file, swappiness, hypervisor swap).

Grep for "paging" inside of Xen.  We have the paging lock, paging modes,
nested paging, and so on.  There's absolutely no reason to start thinking
of "paging" as exclusively meaning "hypervisor swap".

[ A bunch of stuff about using bytes as a unit size]

> This is going to be a reoccurring theme through fixing the ABIs.  Its
> > one of a several areas where there is objectively one right answer, both
> > in terms of ease of use, and compatibility to future circumstances.
>
> Well, I wouldn't say using whatever base granularity as a unit is
> "objectively" less right.
>

Personally I don't think bytes or pages either have a particular advantage:

* Using bytes
 - Advantage: Can always use the same number regardless of the underlying
page size
 - Disadvantage: "Trap" where if you forget to check the page size, you
might accidentally pass an invalid input.  Or to put it differently, most
"reasonable-looking" numbers are actually invalid (since most numbers
aren't page-aligned)/
* Using pages
 - Advantage: No need to check page alignment in HV, no accidentally
invalid input
 - Disadvantage: Caller must check page size and do a shift on every call

What would personally tip me one way or the other is consistency with other
hypercalls.  If most of our hypercalls (or even most of our MM hypercalls)
use bytes, then I'd lean towards bytes.  Whereas if most of our hypercalls
use pages, I'd lean towards pages.

 -George

--0000000000008b280f05ec19e56c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 27, 2022 at 8:12 AM Jan B=
eulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 26.10.2=
022 21:22, Andrew Cooper wrote:<br>
&gt; On 26/10/2022 14:42, Jan Beulich wrote:<br></blockquote><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; paging isn&#39;t a great name.=C2=A0 While it&#39;s what we call the i=
nfrastructure<br>
&gt; in x86, it has nothing to do with paging things out to disk (the thing=
<br>
&gt; everyone associates the name with), nor the xenpaging infrastructure<b=
r>
&gt; (Xen&#39;s version of what OS paging supposedly means).<br>
<br>
Okay, &quot;paging&quot; can be somewhat misleading. But &quot;p2m&quot; al=
so doesn&#39;t fit<br>
the use(s) on x86. Yet we&#39;d like to use a name clearly better than the<=
br>
previous (and yet more wrong/misleading) &quot;shadow&quot;. I have to admi=
t that<br>
I can&#39;t think of any other sensible name, and among the ones discussed<=
br>
I still think &quot;paging&quot; is the one coming closest despite the<br>
generally different meaning of the word elsewhere.<br></blockquote><div><br=
></div><div>Inside the world of operating systems / hypervisors, &quot;pagi=
ng&quot; has always meant &quot;things related to a pagetable&quot;; this i=
ncludes &quot;paging out to disk&quot;.=C2=A0 In fact, the latter already h=
as a perfectly good name -- &quot;swap&quot; (e.g., swap file, swappiness, =
hypervisor swap).</div><div><br></div><div>Grep for &quot;paging&quot; insi=
de of Xen.=C2=A0 We have the paging lock, paging modes, nested paging, and =
so on.=C2=A0 There&#39;s absolutely no reason to start thinking of &quot;pa=
ging&quot; as exclusively meaning &quot;hypervisor swap&quot;.</div><div>=
=C2=A0</div><div>[ A bunch of stuff about using bytes as a unit size]</div>=
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; This is going to be a reoccurring theme through fixing the ABIs.=C2=A0=
 Its<br>
&gt; one of a several areas where there is objectively one right answer, bo=
th<br>
&gt; in terms of ease of use, and compatibility to future circumstances.<br=
>
<br>
Well, I wouldn&#39;t say using whatever base granularity as a unit is<br>
&quot;objectively&quot; less right.<br></blockquote><div><br></div><div>Per=
sonally I don&#39;t think bytes or pages either have a particular advantage=
:</div><div><br></div><div>* Using bytes</div><div>=C2=A0- Advantage: Can a=
lways use the same number regardless of the underlying page size</div><div>=
=C2=A0- Disadvantage: &quot;Trap&quot; where if you forget to check the pag=
e size, you might accidentally pass an invalid input.=C2=A0 Or to put it di=
fferently, most &quot;reasonable-looking&quot; numbers are actually invalid=
 (since most numbers aren&#39;t page-aligned)/</div><div>* Using pages</div=
><div>=C2=A0- Advantage: No need to check page alignment in HV, no accident=
ally invalid input</div><div>=C2=A0- Disadvantage: Caller must check page s=
ize and do a shift on every call</div><div><br></div><div>What would person=
ally tip me one way or the other is consistency with other hypercalls.=C2=
=A0 If most of our hypercalls (or even most of our MM hypercalls) use bytes=
, then I&#39;d lean towards bytes.=C2=A0 Whereas if most of our hypercalls =
use pages, I&#39;d lean towards pages.</div><div><br></div><div>=C2=A0-Geor=
ge</div></div></div>

--0000000000008b280f05ec19e56c--

