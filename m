Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0776418F05
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 08:27:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196330.349123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUk5Z-000461-5y; Mon, 27 Sep 2021 06:26:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196330.349123; Mon, 27 Sep 2021 06:26:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUk5Z-00042i-1j; Mon, 27 Sep 2021 06:26:09 +0000
Received: by outflank-mailman (input) for mailman id 196330;
 Mon, 27 Sep 2021 06:26:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pp17=OR=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1mUk5X-00042c-Gd
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 06:26:07 +0000
Received: from mail-ed1-x533.google.com (unknown [2a00:1450:4864:20::533])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8ec3c02-ddf9-4bee-a139-4a13784933f3;
 Mon, 27 Sep 2021 06:26:04 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id l8so17070407edw.2
 for <xen-devel@lists.xenproject.org>; Sun, 26 Sep 2021 23:26:04 -0700 (PDT)
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
X-Inumbo-ID: d8ec3c02-ddf9-4bee-a139-4a13784933f3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8UBUw9sPwa0hR2+hB7kSZJHo+WETZYtPt/5Hy4WHarQ=;
        b=ptPjq7BnviIrtwj0bdVa5z5CuE4ik5C9udM9UTUqGnrWz5RuNxktXGT4e4ZBjNsTQ2
         iJl6BHhqunFwQRi8xgChCrO87JkbG4WetDOI8qG4aaBgBiCs22BdY6C8ng+qKUzE2BD1
         XQXrn5uFaaY0mVpIvrnwBXIRMs4zq6F41ybo/0fhnEI+8VuYkgwFSaM5e+Wx3oHGSISP
         Wnptu/KVvkg130K4vJWazxW2BCx3YNyK7iTHSLiiHNok4BWUNgPV5m7+2bmbClYuOudr
         46y+Wm+CeSCakwNA0gYgQ0qHnj7OQ5symky/eAm74R6JP/zmQ/r/7+qnL9hv+JuHA32Q
         9CGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8UBUw9sPwa0hR2+hB7kSZJHo+WETZYtPt/5Hy4WHarQ=;
        b=RwyyOORu5yG4Khxh8fw67nC4/XA5wJ9NmqxylhY7SBIxLik2iUhzhVzLkRK5ljehL2
         MeJjopZRmO9uRfMee2GUsvZStHSNCe+FLCic9QTWNy/OMaRr32kZAo403HueD2cjBYJS
         geUYerj1txhKS/oA+Kigyc0koNasvayLfKH4fZD6Ao1RVwjCZeLRe4/BDXWCvx+fRrom
         ZuXdUOPg/jmLzseJJj6Z+K1m2o47/z1Ae3uFWMr2liaMto7J+IUoGtBKJ1vdDEfeL/v/
         KeMFZjwQS84v8+X5+47kTWIQszdvkOfCulVbAZRT7A9oem/cVtq6caPjKq8C8iM/tjvZ
         oVBw==
X-Gm-Message-State: AOAM531wDo7qKL0kwGpB2vbMMaEnIA1Bjc+G0P6rKZP+Mz5hyJsXr36g
	t6/ysEX55SUEn1u1nraKjty1+bQ3HVsYV8WLxTY2+bJ6E1w=
X-Google-Smtp-Source: ABdhPJyYOBMxkQcYIEgH8JksXbWHr8E7wZWMhtRI+6/Kg3gzGShvg6E7oxv0hInMBnAxoeeXLHpf77Tn61sUMBhHypY=
X-Received: by 2002:a17:907:2639:: with SMTP id aq25mr26193232ejc.138.1632723963481;
 Sun, 26 Sep 2021 23:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-23-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231828310.17979@sstabellini-ThinkPad-T480s>
 <DB9PR08MB685744A06D7C014DAE9BE73F9EA69@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2109262021200.5022@sstabellini-ThinkPad-T480s>
 <DB9PR08MB6857AD295D692F962AD76C219EA79@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2109262123140.5022@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109262123140.5022@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Mon, 27 Sep 2021 10:25:52 +0400
Message-ID: <CAJ=z9a1iWE=Ezwyv5jJH_jFhwLpahbVgD10j+jb_q_UPzGyKug@mail.gmail.com>
Subject: Re: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to override default NR_NODE_MEMBLKS
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Chen <Wei.Chen@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000dc13f905ccf42ba1"

--000000000000dc13f905ccf42ba1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 27 Sep 2021, 06:59 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> +x86 maintainers
>
> On Mon, 27 Sep 2021, Wei Chen wrote:
> > > -----Original Message-----
> > > From: Stefano Stabellini <sstabellini@kernel.org>
> > > Sent: 2021=E5=B9=B49=E6=9C=8827=E6=97=A5 11:26
> > > To: Wei Chen <Wei.Chen@arm.com>
> > > Cc: Stefano Stabellini <sstabellini@kernel.org>; xen-
> > > devel@lists.xenproject.org; julien@xen.org; Bertrand Marquis
> > > <Bertrand.Marquis@arm.com>
> > > Subject: RE: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to override
> default
> > > NR_NODE_MEMBLKS
> > >
> > > On Sun, 26 Sep 2021, Wei Chen wrote:
> > > > > -----Original Message-----
> > > > > From: Stefano Stabellini <sstabellini@kernel.org>
> > > > > Sent: 2021=E5=B9=B49=E6=9C=8824=E6=97=A5 9:35
> > > > > To: Wei Chen <Wei.Chen@arm.com>
> > > > > Cc: xen-devel@lists.xenproject.org; sstabellini@kernel.org;
> > > julien@xen.org;
> > > > > Bertrand Marquis <Bertrand.Marquis@arm.com>
> > > > > Subject: Re: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to override
> > > default
> > > > > NR_NODE_MEMBLKS
> > > > >
> > > > > On Thu, 23 Sep 2021, Wei Chen wrote:
> > > > > > As a memory range described in device tree cannot be split acro=
ss
> > > > > > multiple nodes. So we define NR_NODE_MEMBLKS as NR_MEM_BANKS in
> > > > > > arch header.
> > > > >
> > > > > This statement is true but what is the goal of this patch? Is it =
to
> > > > > reduce code size and memory consumption?
> > > > >
> > > >
> > > > No, when Julien and I discussed this in last version[1], we hadn't
> > > thought
> > > > so deeply. We just thought a memory range described in DT cannot be
> > > split
> > > > across multiple nodes. So NR_MEM_BANKS should be equal to
> NR_MEM_BANKS.
> > > >
> > > > https://lists.xenproject.org/archives/html/xen-devel/2021-
> > > 08/msg00974.html
> > > >
> > > > > I am asking because NR_MEM_BANKS is 128 and
> > > > > NR_NODE_MEMBLKS=3D2*MAX_NUMNODES which is 64 by default so again
> > > > > NR_NODE_MEMBLKS is 128 before this patch.
> > > > >
> > > > > In other words, this patch alone doesn't make any difference; at
> least
> > > > > doesn't make any difference unless CONFIG_NR_NUMA_NODES is
> increased.
> > > > >
> > > > > So, is the goal to reduce memory usage when CONFIG_NR_NUMA_NODES =
is
> > > > > higher than 64?
> > > > >
> > > >
> > > > I also thought about this problem when I was writing this patch.
> > > > CONFIG_NR_NUMA_NODES is increasing, but NR_MEM_BANKS is a fixed
> > > > value, then NR_MEM_BANKS can be smaller than CONFIG_NR_NUMA_NODES
> > > > at one point.
> > > >
> > > > But I agree with Julien's suggestion, NR_MEM_BANKS and
> NR_NODE_MEMBLKS
> > > > must be aware of each other. I had thought to add some ASSERT check=
,
> > > > but I don't know how to do it better. So I post this patch for more
> > > > suggestion.
> > >
> > > OK. In that case I'd say to get rid of the previous definition of
> > > NR_NODE_MEMBLKS as it is probably not necessary, see below.
> > >
> > >
> > >
> > > > >
> > > > > > And keep default NR_NODE_MEMBLKS in common header
> > > > > > for those architectures NUMA is disabled.
> > > > >
> > > > > This last sentence is not accurate: on x86 NUMA is enabled and
> > > > > NR_NODE_MEMBLKS is still defined in xen/include/xen/numa.h (there
> is
> > > no
> > > > > x86 definition of it)
> > > > >
> > > >
> > > > Yes.
> > > >
> > > > >
> > > > > > Signed-off-by: Wei Chen <wei.chen@arm.com>
> > > > > > ---
> > > > > >  xen/include/asm-arm/numa.h | 8 +++++++-
> > > > > >  xen/include/xen/numa.h     | 2 ++
> > > > > >  2 files changed, 9 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/xen/include/asm-arm/numa.h
> b/xen/include/asm-arm/numa.h
> > > > > > index 8f1c67e3eb..21569e634b 100644
> > > > > > --- a/xen/include/asm-arm/numa.h
> > > > > > +++ b/xen/include/asm-arm/numa.h
> > > > > > @@ -3,9 +3,15 @@
> > > > > >
> > > > > >  #include <xen/mm.h>
> > > > > >
> > > > > > +#include <asm/setup.h>
> > > > > > +
> > > > > >  typedef u8 nodeid_t;
> > > > > >
> > > > > > -#ifndef CONFIG_NUMA
> > > > > > +#ifdef CONFIG_NUMA
> > > > > > +
> > > > > > +#define NR_NODE_MEMBLKS NR_MEM_BANKS
> > > > > > +
> > > > > > +#else
> > > > > >
> > > > > >  /* Fake one node for now. See also node_online_map. */
> > > > > >  #define cpu_to_node(cpu) 0
> > > > > > diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
> > > > > > index 1978e2be1b..1731e1cc6b 100644
> > > > > > --- a/xen/include/xen/numa.h
> > > > > > +++ b/xen/include/xen/numa.h
> > > > > > @@ -12,7 +12,9 @@
> > > > > >  #define MAX_NUMNODES    1
> > > > > >  #endif
> > > > > >
> > > > > > +#ifndef NR_NODE_MEMBLKS
> > > > > >  #define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
> > > > > > +#endif
> > >
> > > This one we can remove it completely right?
> >
> > How about define NR_MEM_BANKS to:
> > #ifdef CONFIG_NR_NUMA_NODES
> > #define NR_MEM_BANKS (CONFIG_NR_NUMA_NODES * 2)
> > #else
> > #define NR_MEM_BANKS 128
> > #endif
> > for both x86 and Arm. For those architectures do not support or enable
> > NUMA, they can still use "NR_MEM_BANKS 128". And replace all
> NR_NODE_MEMBLKS
> > in NUMA code to NR_MEM_BANKS to remove NR_NODE_MEMBLKS completely.
> > In this case, NR_MEM_BANKS can be aware of the changes of
> CONFIG_NR_NUMA_NODES.
>
> x86 doesn't have NR_MEM_BANKS as far as I can tell. I guess you also
> meant to rename NR_NODE_MEMBLKS to NR_MEM_BANKS?
>
> But NR_MEM_BANKS is not directly related to CONFIG_NR_NUMA_NODES because
> there can be many memory banks for each numa node, certainly more than
> 2. The existing definition on x86:
>
> #define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
>
> Doesn't make a lot of sense to me. Was it just an arbitrary limit for
> the lack of a better way to set a maximum?
>
>
> On the other hand, NR_MEM_BANKS and NR_NODE_MEMBLKS seem to be related.
> In fact, what's the difference?
>
> NR_MEM_BANKS is the max number of memory banks (with or without
> numa-node-id).
>
> NR_NODE_MEMBLKS is the max number of memory banks with NUMA support
> (with numa-node-id)?
>
> They are basically the same thing. On ARM I would just do:
>
> #define NR_NODE_MEMBLKS MAX(NR_MEM_BANKS, (CONFIG_NR_NUMA_NODES * 2))
>

As you wrote above, the second part of the MAX is totally arbitrary. In
fact, it is very likely than if you have more than 64 nodes, you may need a
lot more than 2 regions per node.

So, for Arm, I would just define NR_NODE_MEMBLKS as an alias to
NR_MEM_BANKS so it can be used by common code.

--000000000000dc13f905ccf42ba1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, 27 Sep 2021, 06:59 Stefano Stabellini, &lt;<a =
href=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">+x86 maintainers<br>
<br>
On Mon, 27 Sep 2021, Wei Chen wrote:<br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel=
.org" target=3D"_blank" rel=3D"noreferrer">sstabellini@kernel.org</a>&gt;<b=
r>
&gt; &gt; Sent: 2021=E5=B9=B49=E6=9C=8827=E6=97=A5 11:26<br>
&gt; &gt; To: Wei Chen &lt;<a href=3D"mailto:Wei.Chen@arm.com" target=3D"_b=
lank" rel=3D"noreferrer">Wei.Chen@arm.com</a>&gt;<br>
&gt; &gt; Cc: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.o=
rg" target=3D"_blank" rel=3D"noreferrer">sstabellini@kernel.org</a>&gt;; xe=
n-<br>
&gt; &gt; <a href=3D"mailto:devel@lists.xenproject.org" target=3D"_blank" r=
el=3D"noreferrer">devel@lists.xenproject.org</a>; <a href=3D"mailto:julien@=
xen.org" target=3D"_blank" rel=3D"noreferrer">julien@xen.org</a>; Bertrand =
Marquis<br>
&gt; &gt; &lt;<a href=3D"mailto:Bertrand.Marquis@arm.com" target=3D"_blank"=
 rel=3D"noreferrer">Bertrand.Marquis@arm.com</a>&gt;<br>
&gt; &gt; Subject: RE: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to override =
default<br>
&gt; &gt; NR_NODE_MEMBLKS<br>
&gt; &gt; <br>
&gt; &gt; On Sun, 26 Sep 2021, Wei Chen wrote:<br>
&gt; &gt; &gt; &gt; -----Original Message-----<br>
&gt; &gt; &gt; &gt; From: Stefano Stabellini &lt;<a href=3D"mailto:sstabell=
ini@kernel.org" target=3D"_blank" rel=3D"noreferrer">sstabellini@kernel.org=
</a>&gt;<br>
&gt; &gt; &gt; &gt; Sent: 2021=E5=B9=B49=E6=9C=8824=E6=97=A5 9:35<br>
&gt; &gt; &gt; &gt; To: Wei Chen &lt;<a href=3D"mailto:Wei.Chen@arm.com" ta=
rget=3D"_blank" rel=3D"noreferrer">Wei.Chen@arm.com</a>&gt;<br>
&gt; &gt; &gt; &gt; Cc: <a href=3D"mailto:xen-devel@lists.xenproject.org" t=
arget=3D"_blank" rel=3D"noreferrer">xen-devel@lists.xenproject.org</a>; <a =
href=3D"mailto:sstabellini@kernel.org" target=3D"_blank" rel=3D"noreferrer"=
>sstabellini@kernel.org</a>;<br>
&gt; &gt; <a href=3D"mailto:julien@xen.org" target=3D"_blank" rel=3D"norefe=
rrer">julien@xen.org</a>;<br>
&gt; &gt; &gt; &gt; Bertrand Marquis &lt;<a href=3D"mailto:Bertrand.Marquis=
@arm.com" target=3D"_blank" rel=3D"noreferrer">Bertrand.Marquis@arm.com</a>=
&gt;<br>
&gt; &gt; &gt; &gt; Subject: Re: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to=
 override<br>
&gt; &gt; default<br>
&gt; &gt; &gt; &gt; NR_NODE_MEMBLKS<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Thu, 23 Sep 2021, Wei Chen wrote:<br>
&gt; &gt; &gt; &gt; &gt; As a memory range described in device tree cannot =
be split across<br>
&gt; &gt; &gt; &gt; &gt; multiple nodes. So we define NR_NODE_MEMBLKS as NR=
_MEM_BANKS in<br>
&gt; &gt; &gt; &gt; &gt; arch header.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; This statement is true but what is the goal of this pat=
ch? Is it to<br>
&gt; &gt; &gt; &gt; reduce code size and memory consumption?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; No, when Julien and I discussed this in last version[1], we =
hadn&#39;t<br>
&gt; &gt; thought<br>
&gt; &gt; &gt; so deeply. We just thought a memory range described in DT ca=
nnot be<br>
&gt; &gt; split<br>
&gt; &gt; &gt; across multiple nodes. So NR_MEM_BANKS should be equal to NR=
_MEM_BANKS.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; <a href=3D"https://lists.xenproject.org/archives/html/xen-de=
vel/2021-" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.xe=
nproject.org/archives/html/xen-devel/2021-</a><br>
&gt; &gt; 08/msg00974.html<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I am asking because NR_MEM_BANKS is 128 and<br>
&gt; &gt; &gt; &gt; NR_NODE_MEMBLKS=3D2*MAX_NUMNODES which is 64 by default=
 so again<br>
&gt; &gt; &gt; &gt; NR_NODE_MEMBLKS is 128 before this patch.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; In other words, this patch alone doesn&#39;t make any d=
ifference; at least<br>
&gt; &gt; &gt; &gt; doesn&#39;t make any difference unless CONFIG_NR_NUMA_N=
ODES is increased.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; So, is the goal to reduce memory usage when CONFIG_NR_N=
UMA_NODES is<br>
&gt; &gt; &gt; &gt; higher than 64?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I also thought about this problem when I was writing this pa=
tch.<br>
&gt; &gt; &gt; CONFIG_NR_NUMA_NODES is increasing, but NR_MEM_BANKS is a fi=
xed<br>
&gt; &gt; &gt; value, then NR_MEM_BANKS can be smaller than CONFIG_NR_NUMA_=
NODES<br>
&gt; &gt; &gt; at one point.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; But I agree with Julien&#39;s suggestion, NR_MEM_BANKS and N=
R_NODE_MEMBLKS<br>
&gt; &gt; &gt; must be aware of each other. I had thought to add some ASSER=
T check,<br>
&gt; &gt; &gt; but I don&#39;t know how to do it better. So I post this pat=
ch for more<br>
&gt; &gt; &gt; suggestion.<br>
&gt; &gt; <br>
&gt; &gt; OK. In that case I&#39;d say to get rid of the previous definitio=
n of<br>
&gt; &gt; NR_NODE_MEMBLKS as it is probably not necessary, see below.<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; And keep default NR_NODE_MEMBLKS in common header<=
br>
&gt; &gt; &gt; &gt; &gt; for those architectures NUMA is disabled.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; This last sentence is not accurate: on x86 NUMA is enab=
led and<br>
&gt; &gt; &gt; &gt; NR_NODE_MEMBLKS is still defined in xen/include/xen/num=
a.h (there is<br>
&gt; &gt; no<br>
&gt; &gt; &gt; &gt; x86 definition of it)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Yes.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Signed-off-by: Wei Chen &lt;<a href=3D"mailto:wei.=
chen@arm.com" target=3D"_blank" rel=3D"noreferrer">wei.chen@arm.com</a>&gt;=
<br>
&gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 xen/include/asm-arm/numa.h | 8 +++++++-<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 xen/include/xen/numa.h=C2=A0 =C2=A0 =C2=A0| =
2 ++<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 2 files changed, 9 insertions(+), 1 deletion=
(-)<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; diff --git a/xen/include/asm-arm/numa.h b/xen/incl=
ude/asm-arm/numa.h<br>
&gt; &gt; &gt; &gt; &gt; index 8f1c67e3eb..21569e634b 100644<br>
&gt; &gt; &gt; &gt; &gt; --- a/xen/include/asm-arm/numa.h<br>
&gt; &gt; &gt; &gt; &gt; +++ b/xen/include/asm-arm/numa.h<br>
&gt; &gt; &gt; &gt; &gt; @@ -3,9 +3,15 @@<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #include &lt;xen/mm.h&gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; +#include &lt;asm/setup.h&gt;<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 typedef u8 nodeid_t;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; -#ifndef CONFIG_NUMA<br>
&gt; &gt; &gt; &gt; &gt; +#ifdef CONFIG_NUMA<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +#define NR_NODE_MEMBLKS NR_MEM_BANKS<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +#else<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 /* Fake one node for now. See also node_onli=
ne_map. */<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #define cpu_to_node(cpu) 0<br>
&gt; &gt; &gt; &gt; &gt; diff --git a/xen/include/xen/numa.h b/xen/include/=
xen/numa.h<br>
&gt; &gt; &gt; &gt; &gt; index 1978e2be1b..1731e1cc6b 100644<br>
&gt; &gt; &gt; &gt; &gt; --- a/xen/include/xen/numa.h<br>
&gt; &gt; &gt; &gt; &gt; +++ b/xen/include/xen/numa.h<br>
&gt; &gt; &gt; &gt; &gt; @@ -12,7 +12,9 @@<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #define MAX_NUMNODES=C2=A0 =C2=A0 1<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #endif<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; +#ifndef NR_NODE_MEMBLKS<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 #define NR_NODE_MEMBLKS (MAX_NUMNODES*2)<br>
&gt; &gt; &gt; &gt; &gt; +#endif<br>
&gt; &gt; <br>
&gt; &gt; This one we can remove it completely right?<br>
&gt; <br>
&gt; How about define NR_MEM_BANKS to:<br>
&gt; #ifdef CONFIG_NR_NUMA_NODES<br>
&gt; #define NR_MEM_BANKS (CONFIG_NR_NUMA_NODES * 2)<br>
&gt; #else<br>
&gt; #define NR_MEM_BANKS 128<br>
&gt; #endif<br>
&gt; for both x86 and Arm. For those architectures do not support or enable=
<br>
&gt; NUMA, they can still use &quot;NR_MEM_BANKS 128&quot;. And replace all=
 NR_NODE_MEMBLKS<br>
&gt; in NUMA code to NR_MEM_BANKS to remove NR_NODE_MEMBLKS completely.<br>
&gt; In this case, NR_MEM_BANKS can be aware of the changes of CONFIG_NR_NU=
MA_NODES.<br>
<br>
x86 doesn&#39;t have NR_MEM_BANKS as far as I can tell. I guess you also<br=
>
meant to rename NR_NODE_MEMBLKS to NR_MEM_BANKS?<br>
<br>
But NR_MEM_BANKS is not directly related to CONFIG_NR_NUMA_NODES because<br=
>
there can be many memory banks for each numa node, certainly more than<br>
2. The existing definition on x86:<br>
<br>
#define NR_NODE_MEMBLKS (MAX_NUMNODES*2)<br>
<br>
Doesn&#39;t make a lot of sense to me. Was it just an arbitrary limit for<b=
r>
the lack of a better way to set a maximum?<br>
<br>
<br>
On the other hand, NR_MEM_BANKS and NR_NODE_MEMBLKS seem to be related.<br>
In fact, what&#39;s the difference?<br>
<br>
NR_MEM_BANKS is the max number of memory banks (with or without<br>
numa-node-id).<br>
<br>
NR_NODE_MEMBLKS is the max number of memory banks with NUMA support<br>
(with numa-node-id)?<br>
<br>
They are basically the same thing. On ARM I would just do:<br>
<br>
#define NR_NODE_MEMBLKS MAX(NR_MEM_BANKS, (CONFIG_NR_NUMA_NODES * 2))<br></=
blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">As you=
 wrote above, the second part of the MAX is totally arbitrary. In fact, it =
is very likely than if you have more than 64 nodes, you may need a lot more=
 than 2 regions per node.</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">So, for Arm, I would just define NR_NODE_MEMBLKS as an alias to NR_MEM_BA=
NKS so it can be used by common code.</div><div dir=3D"auto"></div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div=
><div dir=3D"auto"></div></div>

--000000000000dc13f905ccf42ba1--

