Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0107B419014
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 09:36:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196415.349255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUlBN-0002ZJ-UB; Mon, 27 Sep 2021 07:36:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196415.349255; Mon, 27 Sep 2021 07:36:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUlBN-0002WO-P1; Mon, 27 Sep 2021 07:36:13 +0000
Received: by outflank-mailman (input) for mailman id 196415;
 Mon, 27 Sep 2021 07:36:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pp17=OR=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1mUlBM-0002Ut-0k
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 07:36:12 +0000
Received: from mail-ed1-x532.google.com (unknown [2a00:1450:4864:20::532])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83070884-0034-48df-a105-50da553ea5e7;
 Mon, 27 Sep 2021 07:36:09 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id ee50so65432656edb.13
 for <xen-devel@lists.xenproject.org>; Mon, 27 Sep 2021 00:36:09 -0700 (PDT)
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
X-Inumbo-ID: 83070884-0034-48df-a105-50da553ea5e7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AyOb/yB1i5HlOX5zI/WRQXD6X2rbNnjVSkFRlNH62ss=;
        b=qdZmSa8ut5PUpPvuP54SLEe9L8+4XSBCUHAMQRws5IvMRaoHj3n9fDaUaBhCQ0zaQX
         BtzJxbM2lFJiQaulaJkfm9DZ5v8ESKT7fSjyY7LT8IdzgMXCap5gRg0vfTvTsR8sZJ+K
         HSTgVTaHDiEfw8TB3NN/jvDu1uFbWX3a8uQCSEPAN30XagdGYcdt32KRK0PR3SA4TUMI
         F4FdbdcvJdiDPObBMvSPrvhripiyyidcN7dwCQwymHyRGtm4X/DwFOfoEeLiVEnzIJRR
         C3r7sYmuXtvXfN2Bz86nOp/P9w9xhPHA7hy4qIVmpAfgr9cQdRAk2seC8UOJB/lwCX2Y
         fLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AyOb/yB1i5HlOX5zI/WRQXD6X2rbNnjVSkFRlNH62ss=;
        b=3gGWAdo4WqYD6thMxNEaSsPyYA0Cqcid+CHGWujWGAGbhYmajIszX0zD12Jf4immHT
         R5NyP/Y3FzjKA9/1kvV+fNk5Ig7B7AKoElbccmSQD6mo7B3C2uWLjOz9xKjzM7Iz+V+L
         AMNYk9mPoLh369BR1geHru54cAs3fcoSpr26nkfE77L4ROgBY6/TrGJNLbvTFhsFsgWR
         LbETEk0EHy8XdzaQ8SiXsU3gf1OnzslZuFh4sLN+ZROs9NwTfAdlmdUjXO2gu6VlC4Kc
         o8GA9sF8KYldVnYQ5A3vwNCiKilbvAuteogkqW2xgJloI4QaCP+uTFCmrGq2O4uIVAHr
         p8YQ==
X-Gm-Message-State: AOAM532j3ER6mMsQQ3I13r5DHE85yULhbBUxOwlxFx982ond58R4x6pP
	HnLh7VVBJcF/gYq+PTe027RO48es+b5YrKWXbJo=
X-Google-Smtp-Source: ABdhPJx2YVwPwSdHk/ZSxNuJDz7nw+l/QnRStNjMxMJar6RdXnBlLI0ewpi3So1EyVe5x3gPx7C2FsZnmAQp88cMmOk=
X-Received: by 2002:a17:906:781:: with SMTP id l1mr25706464ejc.289.1632728168470;
 Mon, 27 Sep 2021 00:36:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-23-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231828310.17979@sstabellini-ThinkPad-T480s>
 <DB9PR08MB685744A06D7C014DAE9BE73F9EA69@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2109262021200.5022@sstabellini-ThinkPad-T480s>
 <DB9PR08MB6857AD295D692F962AD76C219EA79@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2109262123140.5022@sstabellini-ThinkPad-T480s>
 <DB9PR08MB6857603316C2C808BAD8CD709EA79@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <DB9PR08MB685744B09307DFCA38C0635C9EA79@DB9PR08MB6857.eurprd08.prod.outlook.com>
In-Reply-To: <DB9PR08MB685744B09307DFCA38C0635C9EA79@DB9PR08MB6857.eurprd08.prod.outlook.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Mon, 27 Sep 2021 11:35:57 +0400
Message-ID: <CAJ=z9a1D2ROHRyvRM7=kgnU_J2RkuHC_htYEWtqznUxtq=vZHA@mail.gmail.com>
Subject: Re: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to override default NR_NODE_MEMBLKS
To: Wei Chen <Wei.Chen@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: multipart/alternative; boundary="0000000000007f1af905ccf5263f"

--0000000000007f1af905ccf5263f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 27 Sep 2021, 08:53 Wei Chen, <Wei.Chen@arm.com> wrote:

> Hi Julien,
>
> > -----Original Message-----
> > From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
> Wei
> > Chen
> > Sent: 2021=E5=B9=B49=E6=9C=8827=E6=97=A5 14:46
> > To: Stefano Stabellini <sstabellini@kernel.org>
> > Cc: xen-devel@lists.xenproject.org; julien@xen.org; Bertrand Marquis
> > <Bertrand.Marquis@arm.com>; jbeulich@suse.com; roger.pau@citrix.com;
> > andrew.cooper3@citrix.com
> > Subject: RE: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to override defaul=
t
> > NR_NODE_MEMBLKS
> >
> > Hi Stefano, Julien,
> >
> > > -----Original Message-----
> > > From: Stefano Stabellini <sstabellini@kernel.org>
> > > Sent: 2021=E5=B9=B49=E6=9C=8827=E6=97=A5 13:00
> > > To: Wei Chen <Wei.Chen@arm.com>
> > > Cc: Stefano Stabellini <sstabellini@kernel.org>; xen-
> > > devel@lists.xenproject.org; julien@xen.org; Bertrand Marquis
> > > <Bertrand.Marquis@arm.com>; jbeulich@suse.com; roger.pau@citrix.com;
> > > andrew.cooper3@citrix.com
> > > Subject: RE: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to override
> default
> > > NR_NODE_MEMBLKS
> > >
> > > +x86 maintainers
> > >
> > > On Mon, 27 Sep 2021, Wei Chen wrote:
> > > > > -----Original Message-----
> > > > > From: Stefano Stabellini <sstabellini@kernel.org>
> > > > > Sent: 2021=E5=B9=B49=E6=9C=8827=E6=97=A5 11:26
> > > > > To: Wei Chen <Wei.Chen@arm.com>
> > > > > Cc: Stefano Stabellini <sstabellini@kernel.org>; xen-
> > > > > devel@lists.xenproject.org; julien@xen.org; Bertrand Marquis
> > > > > <Bertrand.Marquis@arm.com>
> > > > > Subject: RE: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to override
> > > default
> > > > > NR_NODE_MEMBLKS
> > > > >
> > > > > On Sun, 26 Sep 2021, Wei Chen wrote:
> > > > > > > -----Original Message-----
> > > > > > > From: Stefano Stabellini <sstabellini@kernel.org>
> > > > > > > Sent: 2021=E5=B9=B49=E6=9C=8824=E6=97=A5 9:35
> > > > > > > To: Wei Chen <Wei.Chen@arm.com>
> > > > > > > Cc: xen-devel@lists.xenproject.org; sstabellini@kernel.org;
> > > > > julien@xen.org;
> > > > > > > Bertrand Marquis <Bertrand.Marquis@arm.com>
> > > > > > > Subject: Re: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to
> override
> > > > > default
> > > > > > > NR_NODE_MEMBLKS
> > > > > > >
> > > > > > > On Thu, 23 Sep 2021, Wei Chen wrote:
> > > > > > > > As a memory range described in device tree cannot be split
> > > across
> > > > > > > > multiple nodes. So we define NR_NODE_MEMBLKS as NR_MEM_BANK=
S
> > in
> > > > > > > > arch header.
> > > > > > >
> > > > > > > This statement is true but what is the goal of this patch? Is
> it
> > > to
> > > > > > > reduce code size and memory consumption?
> > > > > > >
> > > > > >
> > > > > > No, when Julien and I discussed this in last version[1], we
> hadn't
> > > > > thought
> > > > > > so deeply. We just thought a memory range described in DT canno=
t
> > be
> > > > > split
> > > > > > across multiple nodes. So NR_MEM_BANKS should be equal to
> > > NR_MEM_BANKS.
> > > > > >
> > > > > > https://lists.xenproject.org/archives/html/xen-devel/2021-
> > > > > 08/msg00974.html
> > > > > >
> > > > > > > I am asking because NR_MEM_BANKS is 128 and
> > > > > > > NR_NODE_MEMBLKS=3D2*MAX_NUMNODES which is 64 by default so ag=
ain
> > > > > > > NR_NODE_MEMBLKS is 128 before this patch.
> > > > > > >
> > > > > > > In other words, this patch alone doesn't make any difference;
> at
> > > least
> > > > > > > doesn't make any difference unless CONFIG_NR_NUMA_NODES is
> > > increased.
> > > > > > >
> > > > > > > So, is the goal to reduce memory usage when
> CONFIG_NR_NUMA_NODES
> > > is
> > > > > > > higher than 64?
> > > > > > >
> > > > > >
> > > > > > I also thought about this problem when I was writing this patch=
.
> > > > > > CONFIG_NR_NUMA_NODES is increasing, but NR_MEM_BANKS is a fixed
> > > > > > value, then NR_MEM_BANKS can be smaller than CONFIG_NR_NUMA_NOD=
ES
> > > > > > at one point.
> > > > > >
> > > > > > But I agree with Julien's suggestion, NR_MEM_BANKS and
> > > NR_NODE_MEMBLKS
> > > > > > must be aware of each other. I had thought to add some ASSERT
> > check,
> > > > > > but I don't know how to do it better. So I post this patch for
> > more
> > > > > > suggestion.
> > > > >
> > > > > OK. In that case I'd say to get rid of the previous definition of
> > > > > NR_NODE_MEMBLKS as it is probably not necessary, see below.
> > > > >
> > > > >
> > > > >
> > > > > > >
> > > > > > > > And keep default NR_NODE_MEMBLKS in common header
> > > > > > > > for those architectures NUMA is disabled.
> > > > > > >
> > > > > > > This last sentence is not accurate: on x86 NUMA is enabled an=
d
> > > > > > > NR_NODE_MEMBLKS is still defined in xen/include/xen/numa.h
> > (there
> > > is
> > > > > no
> > > > > > > x86 definition of it)
> > > > > > >
> > > > > >
> > > > > > Yes.
> > > > > >
> > > > > > >
> > > > > > > > Signed-off-by: Wei Chen <wei.chen@arm.com>
> > > > > > > > ---
> > > > > > > >  xen/include/asm-arm/numa.h | 8 +++++++-
> > > > > > > >  xen/include/xen/numa.h     | 2 ++
> > > > > > > >  2 files changed, 9 insertions(+), 1 deletion(-)
> > > > > > > >
> > > > > > > > diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-
> > > arm/numa.h
> > > > > > > > index 8f1c67e3eb..21569e634b 100644
> > > > > > > > --- a/xen/include/asm-arm/numa.h
> > > > > > > > +++ b/xen/include/asm-arm/numa.h
> > > > > > > > @@ -3,9 +3,15 @@
> > > > > > > >
> > > > > > > >  #include <xen/mm.h>
> > > > > > > >
> > > > > > > > +#include <asm/setup.h>
> > > > > > > > +
> > > > > > > >  typedef u8 nodeid_t;
> > > > > > > >
> > > > > > > > -#ifndef CONFIG_NUMA
> > > > > > > > +#ifdef CONFIG_NUMA
> > > > > > > > +
> > > > > > > > +#define NR_NODE_MEMBLKS NR_MEM_BANKS
> > > > > > > > +
> > > > > > > > +#else
> > > > > > > >
> > > > > > > >  /* Fake one node for now. See also node_online_map. */
> > > > > > > >  #define cpu_to_node(cpu) 0
> > > > > > > > diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.=
h
> > > > > > > > index 1978e2be1b..1731e1cc6b 100644
> > > > > > > > --- a/xen/include/xen/numa.h
> > > > > > > > +++ b/xen/include/xen/numa.h
> > > > > > > > @@ -12,7 +12,9 @@
> > > > > > > >  #define MAX_NUMNODES    1
> > > > > > > >  #endif
> > > > > > > >
> > > > > > > > +#ifndef NR_NODE_MEMBLKS
> > > > > > > >  #define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
> > > > > > > > +#endif
> > > > >
> > > > > This one we can remove it completely right?
> > > >
> > > > How about define NR_MEM_BANKS to:
> > > > #ifdef CONFIG_NR_NUMA_NODES
> > > > #define NR_MEM_BANKS (CONFIG_NR_NUMA_NODES * 2)
> > > > #else
> > > > #define NR_MEM_BANKS 128
> > > > #endif
> > > > for both x86 and Arm. For those architectures do not support or
> enable
> > > > NUMA, they can still use "NR_MEM_BANKS 128". And replace all
> > > NR_NODE_MEMBLKS
> > > > in NUMA code to NR_MEM_BANKS to remove NR_NODE_MEMBLKS completely.
> > > > In this case, NR_MEM_BANKS can be aware of the changes of
> > > CONFIG_NR_NUMA_NODES.
> > >
> > > x86 doesn't have NR_MEM_BANKS as far as I can tell. I guess you also
> > > meant to rename NR_NODE_MEMBLKS to NR_MEM_BANKS?
> > >
> >
> > Yes.
> >
> > > But NR_MEM_BANKS is not directly related to CONFIG_NR_NUMA_NODES
> because
> > > there can be many memory banks for each numa node, certainly more tha=
n
> > > 2. The existing definition on x86:
> > >
> > > #define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
> > >
> > > Doesn't make a lot of sense to me. Was it just an arbitrary limit for
> > > the lack of a better way to set a maximum?
> > >
> >
> > At that time, this was probably the most cost-effective approach.
> > Enough and easy. But, if more nodes need to be supported in the
> > future, it may bring more memory blocks. And this maximum value
> > might not apply. The maximum may need to support dynamic extension.
> >
> > >
> > > On the other hand, NR_MEM_BANKS and NR_NODE_MEMBLKS seem to be relate=
d.
> > > In fact, what's the difference?
> > >
> > > NR_MEM_BANKS is the max number of memory banks (with or without
> > > numa-node-id).
> > >
> > > NR_NODE_MEMBLKS is the max number of memory banks with NUMA support
> > > (with numa-node-id)?
> > >
> > > They are basically the same thing. On ARM I would just do:
> > >
> >
> > Probably not, NR_MEM_BANKS will count those memory ranges without
> > numa-node-id in boot memory parsing stage (process_memory_node or
> > EFI parser). But NR_NODE_MEMBLKS will only count those memory ranges
> > with numa-node-id.
> >
> > > #define NR_NODE_MEMBLKS MAX(NR_MEM_BANKS, (CONFIG_NR_NUMA_NODES * 2))
> > >
> > >
>
> Quote Julien's comment from HTML email to here:
> " As you wrote above, the second part of the MAX is totally arbitrary.
> In fact, it is very likely than if you have more than 64 nodes, you may
> need a lot more than 2 regions per node.
>
> So, for Arm, I would just define NR_NODE_MEMBLKS as an alias to
> NR_MEM_BANKS
> so it can be used by common code.
> "
>
> But here comes the problem:
> How can we set the NR_MEM_BANKS maximum value, 128 seems an arbitrary too=
?
>

This is based on hardware we currently support (the last time we bumped the
value was, IIRC, for Thunder-X). In the case of booting UEFI, we can get a
lot of small ranges as we discover the RAM using the UEFI memory map.

If #define NR_MEM_BANKS (CONFIG_NR_NUMA_NODES * N)? And what N should be.


N would have to be the maximum number of ranges you can find in a NUMA node=
.

We would also need to make sure this doesn't break existing platforms. So N
would have to be quite large or we need a MAX as Stefano suggested.

But I would prefer to keep the existing 128 and allow to configure it at
build time (not necessarily in this series). This avoid to have different
way to define the value based NUMA vs non-NUMA.


> > > And maybe the definition could be common with x86 if we define
> > > NR_MEM_BANKS to 128 on x86 too.
> >
> > Julien had comment here, I will continue in that email.
>

--0000000000007f1af905ccf5263f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, 27 Sep 2021, 08:53 Wei Chen, &lt;<a href=3D"ma=
ilto:Wei.Chen@arm.com">Wei.Chen@arm.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">Hi Julien,<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Xen-devel &lt;<a href=3D"mailto:xen-devel-bounces@lists.xenproje=
ct.org" target=3D"_blank" rel=3D"noreferrer">xen-devel-bounces@lists.xenpro=
ject.org</a>&gt; On Behalf Of Wei<br>
&gt; Chen<br>
&gt; Sent: 2021=E5=B9=B49=E6=9C=8827=E6=97=A5 14:46<br>
&gt; To: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org" t=
arget=3D"_blank" rel=3D"noreferrer">sstabellini@kernel.org</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:xen-devel@lists.xenproject.org" target=3D"_blank=
" rel=3D"noreferrer">xen-devel@lists.xenproject.org</a>; <a href=3D"mailto:=
julien@xen.org" target=3D"_blank" rel=3D"noreferrer">julien@xen.org</a>; Be=
rtrand Marquis<br>
&gt; &lt;<a href=3D"mailto:Bertrand.Marquis@arm.com" target=3D"_blank" rel=
=3D"noreferrer">Bertrand.Marquis@arm.com</a>&gt;; <a href=3D"mailto:jbeulic=
h@suse.com" target=3D"_blank" rel=3D"noreferrer">jbeulich@suse.com</a>; <a =
href=3D"mailto:roger.pau@citrix.com" target=3D"_blank" rel=3D"noreferrer">r=
oger.pau@citrix.com</a>;<br>
&gt; <a href=3D"mailto:andrew.cooper3@citrix.com" target=3D"_blank" rel=3D"=
noreferrer">andrew.cooper3@citrix.com</a><br>
&gt; Subject: RE: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to override defau=
lt<br>
&gt; NR_NODE_MEMBLKS<br>
&gt; <br>
&gt; Hi Stefano, Julien,<br>
&gt; <br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel=
.org" target=3D"_blank" rel=3D"noreferrer">sstabellini@kernel.org</a>&gt;<b=
r>
&gt; &gt; Sent: 2021=E5=B9=B49=E6=9C=8827=E6=97=A5 13:00<br>
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
 rel=3D"noreferrer">Bertrand.Marquis@arm.com</a>&gt;; <a href=3D"mailto:jbe=
ulich@suse.com" target=3D"_blank" rel=3D"noreferrer">jbeulich@suse.com</a>;=
 <a href=3D"mailto:roger.pau@citrix.com" target=3D"_blank" rel=3D"noreferre=
r">roger.pau@citrix.com</a>;<br>
&gt; &gt; <a href=3D"mailto:andrew.cooper3@citrix.com" target=3D"_blank" re=
l=3D"noreferrer">andrew.cooper3@citrix.com</a><br>
&gt; &gt; Subject: RE: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to override =
default<br>
&gt; &gt; NR_NODE_MEMBLKS<br>
&gt; &gt;<br>
&gt; &gt; +x86 maintainers<br>
&gt; &gt;<br>
&gt; &gt; On Mon, 27 Sep 2021, Wei Chen wrote:<br>
&gt; &gt; &gt; &gt; -----Original Message-----<br>
&gt; &gt; &gt; &gt; From: Stefano Stabellini &lt;<a href=3D"mailto:sstabell=
ini@kernel.org" target=3D"_blank" rel=3D"noreferrer">sstabellini@kernel.org=
</a>&gt;<br>
&gt; &gt; &gt; &gt; Sent: 2021=E5=B9=B49=E6=9C=8827=E6=97=A5 11:26<br>
&gt; &gt; &gt; &gt; To: Wei Chen &lt;<a href=3D"mailto:Wei.Chen@arm.com" ta=
rget=3D"_blank" rel=3D"noreferrer">Wei.Chen@arm.com</a>&gt;<br>
&gt; &gt; &gt; &gt; Cc: Stefano Stabellini &lt;<a href=3D"mailto:sstabellin=
i@kernel.org" target=3D"_blank" rel=3D"noreferrer">sstabellini@kernel.org</=
a>&gt;; xen-<br>
&gt; &gt; &gt; &gt; <a href=3D"mailto:devel@lists.xenproject.org" target=3D=
"_blank" rel=3D"noreferrer">devel@lists.xenproject.org</a>; <a href=3D"mail=
to:julien@xen.org" target=3D"_blank" rel=3D"noreferrer">julien@xen.org</a>;=
 Bertrand Marquis<br>
&gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:Bertrand.Marquis@arm.com" target=
=3D"_blank" rel=3D"noreferrer">Bertrand.Marquis@arm.com</a>&gt;<br>
&gt; &gt; &gt; &gt; Subject: RE: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to=
 override<br>
&gt; &gt; default<br>
&gt; &gt; &gt; &gt; NR_NODE_MEMBLKS<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Sun, 26 Sep 2021, Wei Chen wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; -----Original Message-----<br>
&gt; &gt; &gt; &gt; &gt; &gt; From: Stefano Stabellini &lt;<a href=3D"mailt=
o:sstabellini@kernel.org" target=3D"_blank" rel=3D"noreferrer">sstabellini@=
kernel.org</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Sent: 2021=E5=B9=B49=E6=9C=8824=E6=97=A5 9:35=
<br>
&gt; &gt; &gt; &gt; &gt; &gt; To: Wei Chen &lt;<a href=3D"mailto:Wei.Chen@a=
rm.com" target=3D"_blank" rel=3D"noreferrer">Wei.Chen@arm.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Cc: <a href=3D"mailto:xen-devel@lists.xenproj=
ect.org" target=3D"_blank" rel=3D"noreferrer">xen-devel@lists.xenproject.or=
g</a>; <a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank" rel=3D"n=
oreferrer">sstabellini@kernel.org</a>;<br>
&gt; &gt; &gt; &gt; <a href=3D"mailto:julien@xen.org" target=3D"_blank" rel=
=3D"noreferrer">julien@xen.org</a>;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Bertrand Marquis &lt;<a href=3D"mailto:Bertra=
nd.Marquis@arm.com" target=3D"_blank" rel=3D"noreferrer">Bertrand.Marquis@a=
rm.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Subject: Re: [PATCH 22/37] xen/arm: use NR_ME=
M_BANKS to override<br>
&gt; &gt; &gt; &gt; default<br>
&gt; &gt; &gt; &gt; &gt; &gt; NR_NODE_MEMBLKS<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; On Thu, 23 Sep 2021, Wei Chen wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; As a memory range described in device tr=
ee cannot be split<br>
&gt; &gt; across<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; multiple nodes. So we define NR_NODE_MEM=
BLKS as NR_MEM_BANKS<br>
&gt; in<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; arch header.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; This statement is true but what is the goal o=
f this patch? Is it<br>
&gt; &gt; to<br>
&gt; &gt; &gt; &gt; &gt; &gt; reduce code size and memory consumption?<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; No, when Julien and I discussed this in last versi=
on[1], we hadn&#39;t<br>
&gt; &gt; &gt; &gt; thought<br>
&gt; &gt; &gt; &gt; &gt; so deeply. We just thought a memory range describe=
d in DT cannot<br>
&gt; be<br>
&gt; &gt; &gt; &gt; split<br>
&gt; &gt; &gt; &gt; &gt; across multiple nodes. So NR_MEM_BANKS should be e=
qual to<br>
&gt; &gt; NR_MEM_BANKS.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; <a href=3D"https://lists.xenproject.org/archives/h=
tml/xen-devel/2021-" rel=3D"noreferrer noreferrer" target=3D"_blank">https:=
//lists.xenproject.org/archives/html/xen-devel/2021-</a><br>
&gt; &gt; &gt; &gt; 08/msg00974.html<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; I am asking because NR_MEM_BANKS is 128 and<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; NR_NODE_MEMBLKS=3D2*MAX_NUMNODES which is 64 =
by default so again<br>
&gt; &gt; &gt; &gt; &gt; &gt; NR_NODE_MEMBLKS is 128 before this patch.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; In other words, this patch alone doesn&#39;t =
make any difference; at<br>
&gt; &gt; least<br>
&gt; &gt; &gt; &gt; &gt; &gt; doesn&#39;t make any difference unless CONFIG=
_NR_NUMA_NODES is<br>
&gt; &gt; increased.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; So, is the goal to reduce memory usage when C=
ONFIG_NR_NUMA_NODES<br>
&gt; &gt; is<br>
&gt; &gt; &gt; &gt; &gt; &gt; higher than 64?<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I also thought about this problem when I was writi=
ng this patch.<br>
&gt; &gt; &gt; &gt; &gt; CONFIG_NR_NUMA_NODES is increasing, but NR_MEM_BAN=
KS is a fixed<br>
&gt; &gt; &gt; &gt; &gt; value, then NR_MEM_BANKS can be smaller than CONFI=
G_NR_NUMA_NODES<br>
&gt; &gt; &gt; &gt; &gt; at one point.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; But I agree with Julien&#39;s suggestion, NR_MEM_B=
ANKS and<br>
&gt; &gt; NR_NODE_MEMBLKS<br>
&gt; &gt; &gt; &gt; &gt; must be aware of each other. I had thought to add =
some ASSERT<br>
&gt; check,<br>
&gt; &gt; &gt; &gt; &gt; but I don&#39;t know how to do it better. So I pos=
t this patch for<br>
&gt; more<br>
&gt; &gt; &gt; &gt; &gt; suggestion.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; OK. In that case I&#39;d say to get rid of the previous=
 definition of<br>
&gt; &gt; &gt; &gt; NR_NODE_MEMBLKS as it is probably not necessary, see be=
low.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; And keep default NR_NODE_MEMBLKS in comm=
on header<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; for those architectures NUMA is disabled=
.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; This last sentence is not accurate: on x86 NU=
MA is enabled and<br>
&gt; &gt; &gt; &gt; &gt; &gt; NR_NODE_MEMBLKS is still defined in xen/inclu=
de/xen/numa.h<br>
&gt; (there<br>
&gt; &gt; is<br>
&gt; &gt; &gt; &gt; no<br>
&gt; &gt; &gt; &gt; &gt; &gt; x86 definition of it)<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Yes.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Signed-off-by: Wei Chen &lt;<a href=3D"m=
ailto:wei.chen@arm.com" target=3D"_blank" rel=3D"noreferrer">wei.chen@arm.c=
om</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 xen/include/asm-arm/numa.h | 8 +++=
++++-<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 xen/include/xen/numa.h=C2=A0 =C2=
=A0 =C2=A0| 2 ++<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 2 files changed, 9 insertions(+), =
1 deletion(-)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; diff --git a/xen/include/asm-arm/numa.h =
b/xen/include/asm-<br>
&gt; &gt; arm/numa.h<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; index 8f1c67e3eb..21569e634b 100644<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; --- a/xen/include/asm-arm/numa.h<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +++ b/xen/include/asm-arm/numa.h<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; @@ -3,9 +3,15 @@<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 #include &lt;xen/mm.h&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +#include &lt;asm/setup.h&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 typedef u8 nodeid_t;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; -#ifndef CONFIG_NUMA<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +#ifdef CONFIG_NUMA<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +#define NR_NODE_MEMBLKS NR_MEM_BANKS<br=
>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +#else<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 /* Fake one node for now. See also=
 node_online_map. */<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 #define cpu_to_node(cpu) 0<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; diff --git a/xen/include/xen/numa.h b/xe=
n/include/xen/numa.h<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; index 1978e2be1b..1731e1cc6b 100644<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; --- a/xen/include/xen/numa.h<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +++ b/xen/include/xen/numa.h<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; @@ -12,7 +12,9 @@<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 #define MAX_NUMNODES=C2=A0 =C2=A0 =
1<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 #endif<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +#ifndef NR_NODE_MEMBLKS<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 #define NR_NODE_MEMBLKS (MAX_NUMNO=
DES*2)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; +#endif<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; This one we can remove it completely right?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; How about define NR_MEM_BANKS to:<br>
&gt; &gt; &gt; #ifdef CONFIG_NR_NUMA_NODES<br>
&gt; &gt; &gt; #define NR_MEM_BANKS (CONFIG_NR_NUMA_NODES * 2)<br>
&gt; &gt; &gt; #else<br>
&gt; &gt; &gt; #define NR_MEM_BANKS 128<br>
&gt; &gt; &gt; #endif<br>
&gt; &gt; &gt; for both x86 and Arm. For those architectures do not support=
 or enable<br>
&gt; &gt; &gt; NUMA, they can still use &quot;NR_MEM_BANKS 128&quot;. And r=
eplace all<br>
&gt; &gt; NR_NODE_MEMBLKS<br>
&gt; &gt; &gt; in NUMA code to NR_MEM_BANKS to remove NR_NODE_MEMBLKS compl=
etely.<br>
&gt; &gt; &gt; In this case, NR_MEM_BANKS can be aware of the changes of<br=
>
&gt; &gt; CONFIG_NR_NUMA_NODES.<br>
&gt; &gt;<br>
&gt; &gt; x86 doesn&#39;t have NR_MEM_BANKS as far as I can tell. I guess y=
ou also<br>
&gt; &gt; meant to rename NR_NODE_MEMBLKS to NR_MEM_BANKS?<br>
&gt; &gt;<br>
&gt; <br>
&gt; Yes.<br>
&gt; <br>
&gt; &gt; But NR_MEM_BANKS is not directly related to CONFIG_NR_NUMA_NODES =
because<br>
&gt; &gt; there can be many memory banks for each numa node, certainly more=
 than<br>
&gt; &gt; 2. The existing definition on x86:<br>
&gt; &gt;<br>
&gt; &gt; #define NR_NODE_MEMBLKS (MAX_NUMNODES*2)<br>
&gt; &gt;<br>
&gt; &gt; Doesn&#39;t make a lot of sense to me. Was it just an arbitrary l=
imit for<br>
&gt; &gt; the lack of a better way to set a maximum?<br>
&gt; &gt;<br>
&gt; <br>
&gt; At that time, this was probably the most cost-effective approach.<br>
&gt; Enough and easy. But, if more nodes need to be supported in the<br>
&gt; future, it may bring more memory blocks. And this maximum value<br>
&gt; might not apply. The maximum may need to support dynamic extension.<br=
>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; On the other hand, NR_MEM_BANKS and NR_NODE_MEMBLKS seem to be re=
lated.<br>
&gt; &gt; In fact, what&#39;s the difference?<br>
&gt; &gt;<br>
&gt; &gt; NR_MEM_BANKS is the max number of memory banks (with or without<b=
r>
&gt; &gt; numa-node-id).<br>
&gt; &gt;<br>
&gt; &gt; NR_NODE_MEMBLKS is the max number of memory banks with NUMA suppo=
rt<br>
&gt; &gt; (with numa-node-id)?<br>
&gt; &gt;<br>
&gt; &gt; They are basically the same thing. On ARM I would just do:<br>
&gt; &gt;<br>
&gt; <br>
&gt; Probably not, NR_MEM_BANKS will count those memory ranges without<br>
&gt; numa-node-id in boot memory parsing stage (process_memory_node or<br>
&gt; EFI parser). But NR_NODE_MEMBLKS will only count those memory ranges<b=
r>
&gt; with numa-node-id.<br>
&gt; <br>
&gt; &gt; #define NR_NODE_MEMBLKS MAX(NR_MEM_BANKS, (CONFIG_NR_NUMA_NODES *=
 2))<br>
&gt; &gt;<br>
&gt; &gt;<br>
<br>
Quote Julien&#39;s comment from HTML email to here:<br>
&quot; As you wrote above, the second part of the MAX is totally arbitrary.=
<br>
In fact, it is very likely than if you have more than 64 nodes, you may<br>
need a lot more than 2 regions per node.<br>
<br>
So, for Arm, I would just define NR_NODE_MEMBLKS as an alias to NR_MEM_BANK=
S<br>
so it can be used by common code.<br>
&quot;<br>
<br>
But here comes the problem:<br>
How can we set the NR_MEM_BANKS maximum value, 128 seems an arbitrary too?<=
br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">T=
his is based on hardware we currently support (the last time we bumped the =
value was, IIRC, for Thunder-X). In the case of booting UEFI, we can get a =
lot of small ranges as we discover the RAM using the UEFI memory map.</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">
If #define NR_MEM_BANKS (CONFIG_NR_NUMA_NODES * N)? And what N should be.</=
blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">N woul=
d have to be the maximum number of ranges you can find in a NUMA node.</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">We would also need to make s=
ure this doesn&#39;t break existing platforms. So N would have to be quite =
large or we need a MAX as Stefano suggested.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">But I would prefer to keep the existing 128 and allow =
to configure it at build time (not necessarily in this series). This avoid =
to have different way to define the value based NUMA vs non-NUMA.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
<br>
&gt; &gt; And maybe the definition could be common with x86 if we define<br=
>
&gt; &gt; NR_MEM_BANKS to 128 on x86 too.<br>
&gt; <br>
&gt; Julien had comment here, I will continue in that email.<br>
</blockquote></div></div></div>

--0000000000007f1af905ccf5263f--

