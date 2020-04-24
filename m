Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D8F1B8109
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 22:40:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jS57E-0004oV-RY; Fri, 24 Apr 2020 20:40:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6uIs=6I=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jS57D-0004iM-Np
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 20:40:03 +0000
X-Inumbo-ID: c585e4ba-866b-11ea-b4f4-bc764e2007e4
Received: from mail-lf1-x131.google.com (unknown [2a00:1450:4864:20::131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c585e4ba-866b-11ea-b4f4-bc764e2007e4;
 Fri, 24 Apr 2020 20:40:02 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id 198so8841575lfo.7
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2020 13:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pFbhnWzBLpaJPFlQc/+IRV69nBOHleJ4A4cSCs2wfmM=;
 b=Xlr4StzVdtZzRsrMnDLKbpyYZSkP3TfTONBzjrqq0r8O2MfEnvxHDQLpB2AH+XBqwz
 xe9nxjROOrUemQ0NQdNeWfGr+dQortGORwSMDAFN1lcbnHAUabDXXphlZeqFXNkn6EDs
 7B90WXlGYt5/Un8Kr9f0kgqXYXmxXs/bhqPn3pupBzGd6DTH3xj2bHeFLwIPrXr31zYv
 qZVhKwPkZ3CVhDD67z36XF8/ZSLwAx0+b1dj6erSfN3YoT70v4bsogCQRViXgc7Sd+9w
 twudF6w2hFPOc6towN4jfWVBJ/LvSt3CE0lAR2NZin7CogA6NzcMEujR7mH1OPexGbhU
 VHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pFbhnWzBLpaJPFlQc/+IRV69nBOHleJ4A4cSCs2wfmM=;
 b=LRmGVhBiNB7fAHGtu5fnerljzW/QD9PxSla0bEDLTQxT7GZZMMOmlyYexTP/vqAtHZ
 zqXvX2GBvqC6L0BYjB18UA2xFG4ysjBdzJTKpKHm0tEkVRe9+p1WvTmtTYR8eSS951Q7
 YEYwvFBVlDs+L3hNnZExSiq+WfeLnVGlggBcCld5VZvaJ5LTsGIgx6t89U7zB45e8WxI
 y8+PJ5iJHNjM6QY4UiknKlsqnTtQkIiSo84CR/nSRyhseJrzb85ttNPT0YccHViUdQ6n
 XPYi4OpqEmCTeOQJPg5MTrv71oROTAETxC42YxkDeD8GJiwp1pZbMS1S5FxspuJSqvWj
 ZgUA==
X-Gm-Message-State: AGi0PubeRNcW6ZDidrlEgMF6CFfiIqowrLymo+FIm2FOrYTSft/ZrCz9
 w81YMWkzqxWqQNHt1W35V5SYPT1tCDDQML/+Yi8=
X-Google-Smtp-Source: APiQypLXmpbqAkeK/1NiIuDZujC/yxivhIssaxfwX0uJFv0T4zMgE++bC+Sash6JhBjObnyKYsXPXfcCG2pEnq+YRlk=
X-Received: by 2002:a19:1c3:: with SMTP id 186mr7474814lfb.191.1587760801306; 
 Fri, 24 Apr 2020 13:40:01 -0700 (PDT)
MIME-Version: 1.0
References: <FC32A2FB-F339-4F3A-8237-0A4334ADF3D2@citrix.com>
 <24225.31493.220592.722565@mariner.uk.xensource.com>
 <24225.31669.536258.56822@mariner.uk.xensource.com>
 <4085F05B-ABEC-446A-8BB1-06DEE57D71A5@citrix.com>
 <C10E07AB-FDE8-4588-95E7-6109F0FDB5E2@citrix.com>
 <CAEBZRSfUysyGhnsXDEAJiVDBeX-Kb836V-uT6Qrtomte1LKgsA@mail.gmail.com>
 <E0DEA134-CB69-4992-B949-7233BFF3A1E4@citrix.com>
In-Reply-To: <E0DEA134-CB69-4992-B949-7233BFF3A1E4@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Fri, 24 Apr 2020 16:39:50 -0400
Message-ID: <CAEBZRSe4O9ahFHViCJ9K63imUbYZA+sSe9XyNfopXGtL8DJsWw@mail.gmail.com>
Subject: Re: Golang Xen packages and the golang packaging system
To: George Dunlap <George.Dunlap@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Apr 24, 2020 at 7:26 AM George Dunlap <George.Dunlap@citrix.com> wr=
ote:
>
>
>
> > On Apr 24, 2020, at 5:04 AM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
> >
> > On Thu, Apr 23, 2020 at 1:22 PM George Dunlap <George.Dunlap@citrix.com=
> wrote:
> >>
> >>
> >>> On Apr 23, 2020, at 12:49 PM, George Dunlap <george.dunlap@citrix.com=
> wrote:
> >>>
> >>>
> >>>
> >>>> On Apr 23, 2020, at 12:27 PM, Ian Jackson <ian.jackson@citrix.com> w=
rote:
> >>>>
> >>>> Ian Jackson writes ("Re: Golang Xen packages and the golang packagin=
g system"):
> >>>>> This is quite unpleasant.  In particular, it makes a git tree out o=
f
> >>>>> output files.  What will we do when someone sends us patches to the
> >>>>> bindings ?
> >>>>
> >>>> Also, anyone who redistributes your proposed golang package is
> >>>> violating our licence unless they ship a copy of xen.git[1] too, sin=
ce
> >>>> the golang package is not source code.
> >>>>
> >>>> [1] Technically, a copy of the relevant parts will do.
> >>>
> >>> The =E2=80=9Crelevant parts=E2=80=9D would primarily be gengotypes.py=
, right?  Oh, and I guess libxl_test.idl and friends.  libxl_test.idl isn=
=E2=80=99t included in the distribution either.
> >>>
> >>> I=E2=80=99m not an expert in the golang build system, but they genera=
lly seem to be trying to keep the functionality simple (which of course, me=
ans if you want to do anything non-basic, it=E2=80=99s incredibly complicat=
ed or completely impossible).
> >>>
> >>> There=E2=80=99s a command, `go generate`, which we could use to run g=
engotypes.py to generate the appropriate files.  But I=E2=80=99m not sure h=
ow to use that in a practical way for this sort of package: it might end up=
 that people wanting to use the package would need to manually clone it, th=
en manually run `go generate` before manually building the package.
> >>>
> >>> Checking in the generated files means that someone can simply add `go=
lang.xenproject.org/xenlight` as a dependency (perhaps with a specific vers=
ion tag, like v4.14), and everything Just Works.
> >>>
> >>> Nick may have some ideas on how to use the golang build system more e=
ffectively.
> >>
> >> So, the following seems to work quite well actually:
> >>
> >> mkdir vendor
> >> ln -s vendor/golang.xenproject.org /usr/share/gocode/src/golang.xenpro=
ject.org
> >> echo =E2=80=9Cgolang.xenproject.org/xenlight=E2=80=9D >> vendor/module=
s.txt
> >> go build -mod=3Dvendor
> >>
> >> Using the above method, (say) redctl.git would build exactly the same =
on Xen 4.14 as on Xen 4.15 (assuming redctl wasn=E2=80=99t using anything n=
ot available in 4.14).
> >>
> >> I=E2=80=99m inclined to say we should start with just telling people t=
o do that, and look at doing something else if we discover that=E2=80=99s n=
ot suitable for some reason.
> >
> > If it's not viable to create another repo for the xenlight package, I
> > think we should should just initialize the go module, i.e. go.mod, at
> > xen.git/tools/golang. The downside is that tags cannot be independent
> > from the rest of xen.git, so users need to have `require <module
> > path>/xenlight@RELEASE-4.14.0` in their go.mod, but at least its `go
> > get`-able. And, this does not fetch the entire git tree.
> >
> > This would also mean that we actually track the generated code (which
> > isn't really a big deal IMO, it's expected that people track their
> > generated gRPC code, for example).
>
> Yes, I was playing with this yesterday and it seems to work OK.
>
> The thing I didn=E2=80=99t necessarily like about this was that suppose y=
ou had a public project that used the xenlight bindings, and you upgraded t=
o Xen 4.15, but some of your users hadn=E2=80=99t.  If you updated this to =
RELEASE-4.15.0, then all your downstreams would stop working, even if you w=
eren=E2=80=99t using any functionality specific to Xen 4.15.

The go.mod is really just a way of specifying dependencies. Definig a
module for xenlight does not take away the ability of downstreams to
do `go build -mod=3Dvendor`, where their preferred version of xenlight
is vendored.

> But I suppose what that would really mean is that:
> 1) We should make sure that xenlight@RELEASE-$V works on > $V as well
> 2) Projects depending on the bindings should use the oldest version of th=
e Xen bindings suitable for their use case.
>
> Both of those are probably reasonable.

I agree.

> Another issue that happens with checking in generated code is that the id=
l changes and nobody re-generates the code.  We=E2=80=99d probably want an =
osstest check that would refuse to push from staging -> master if re-runnin=
g the code generator produced a different output.  (But that has its own an=
noyances: it seems that different versions of python sort things in differe=
nt orders, so I often have to throw away spurious changes to the generated =
files because our two versions of python seem to order some things differen=
tly.)

Yeah, I have noticed that on my machine as well. I guess we could just
sort the cases by value or alphabetically before writing the switch
statements. Have you seen the re-ordering happen in other places too?

[...]

> Anyway, do you want to submit a patch adding a `go.mod` in the appropriat=
e place?  I=E2=80=99ve always had a hard time figuring out how go.mod actua=
lly works; there seems to be no *manual*, only *howtos*.

Yes, I can do that. I'm going to keep tinkering with the remote import
path and module proxy so that users could still just do `import
"golang.xenproject.org/xenlight"`, but if I can't get something like
that working I'll define the module "canonically."

Thanks,
-NR

