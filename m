Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E20A9B9DE
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 23:28:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966937.1356982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u846o-0004DS-M8; Thu, 24 Apr 2025 21:27:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966937.1356982; Thu, 24 Apr 2025 21:27:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u846o-0004Av-J6; Thu, 24 Apr 2025 21:27:50 +0000
Received: by outflank-mailman (input) for mailman id 966937;
 Thu, 24 Apr 2025 21:27:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iZrJ=XK=gmail.com=trolle.selander@srs-se1.protection.inumbo.net>)
 id 1u846o-0004Ap-1z
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 21:27:50 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7ef7560-2152-11f0-9ffb-bf95429c2676;
 Thu, 24 Apr 2025 23:27:48 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ac2bb7ca40bso273353866b.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Apr 2025 14:27:48 -0700 (PDT)
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
X-Inumbo-ID: f7ef7560-2152-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745530067; x=1746134867; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yVJORT2KGUdz/ji3AIvuRYZnWV53wuE7d4tJ0N5ILrE=;
        b=P0V20rKeUPLFaLnC1k6N1c+1YFLaVq54ZZmmsCvcDdbORMJqLvzMB9ZBUYokw9+e92
         zMzn8SR/AypknBxeFXJFwV3Bi7IWsVUwy4N9cqXehVA5I937oRJ4SIPzqRWpD6wW11RJ
         rzjnMymUkLG79igA8slNLZS7t+fYxoprDMi84wrd04bNenZYcVGnWlamcIZPUERfYmJH
         vI5rnMOdHXWRB6J5Y8EwI+mi4cByOGsbciC705pmqXnAV1pS+MqyEgGEyUWEj4FHrqV4
         A5XyWadIMWXcw3j9OxfQHmdy9LWYNPvmXHuvkPiA0B9MgHGbB+ez70FxJOtpDccIXc9J
         kwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745530067; x=1746134867;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yVJORT2KGUdz/ji3AIvuRYZnWV53wuE7d4tJ0N5ILrE=;
        b=HQmu8xo5CkZXedRIEzkvvIn5peXWPoTerxhzKR7HycQN2o/WFex8vitTp9DLJN0R2y
         6unYCNalqUwgqoLKJIY4pUI+hQk2cQKN5BHpWH15do+LncRssvXLtJwrQKCxhSp0EP8p
         4XuHAHWASjcvauJJGlILNAqwuuMH1USwzcYcz2tt351fy5L/d7G5VvTQ9lg49WYcnTFI
         hhRH3mGPG7WR/JwEealLPKWt+BWySWfr+GJOG7+Q9NrQLJneeogy4jBRK3QVcSV+vqot
         7IyTXwoTjECqSF2LXlsrbeD+7QsV3fl9AUI89r5SosE/zGSLwiv9ns5V9LFj0Dkiu782
         hKMg==
X-Forwarded-Encrypted: i=1; AJvYcCXuuKSI5YWuIpNRNCxsppOoxi6tgT+YzKRis9DdyYUeKqECrxYo1w06TYu2aFaaRHhWBwsV/CDppqw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZpZrz/vhSabVtx2oMAFKjwL8pFeXHWRStp/cB8tWN71CYcUyv
	jeAtxrzlJamVdIbM2VUOsgn1E78SCaGBkTY3jVGawiWohuxoPQ18z6E9Eil9cUEfCN6loMw0hIr
	9ftiMQLMP1Rw87cjECYY0rUFTw9U=
X-Gm-Gg: ASbGncta91qOYCXfdnqjZERi8hZPKSzj4+Re1fmjWHAwsQxwZE+fIOIB3ixw7YOSgdC
	B4u//GwGO0cWhv2KiprxopNsPJUJURPeuUtuVIE2SYkO4lZKh4jwd4G9SMU2TgtgYFz9UIXLUMd
	RJ7WhgRg5gMqXiJUxFTiG+UwnnnNfvPcqfhu8=
X-Google-Smtp-Source: AGHT+IGfG6HYHzmfVZ3S0al3DSyrJnKeFONht1DMHassKVF+KiYhOqmFPX00SaCjvfnfldwyLYuwXuJA1Y4OFov/PVk=
X-Received: by 2002:a17:907:720e:b0:ac7:f3a6:5af0 with SMTP id
 a640c23a62f3a-ace71026097mr7054966b.10.1745530067251; Thu, 24 Apr 2025
 14:27:47 -0700 (PDT)
MIME-Version: 1.0
References: <D9EWZF0G7QUZ.2IDV470T7SYD0@amd.com> <002DF04C-A250-4EAD-9834-FC07EFC9D562@ariadne.space>
 <D9F5WA7ONX45.NTFNWPJS5MWU@amd.com>
In-Reply-To: <D9F5WA7ONX45.NTFNWPJS5MWU@amd.com>
From: Trolle Selander <trolle.selander@gmail.com>
Date: Thu, 24 Apr 2025 17:27:36 -0400
X-Gm-Features: ATxdqUHR8WKj_V1K1ilHh9ppTCkx0ihqMfCKqpV6OzWmzonFaedgag7C1sNXFvs
Message-ID: <CAMhw1543RpYCbOxCv_31qkv_s3cOdmeAf=PKhiMbpkbBvcGRDw@mail.gmail.com>
Subject: Re: [PATCH] x86/hyperv: Adjust hypercall page placement
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Ariadne Conill <ariadne@ariadne.space>, xen-devel@lists.xenproject.org, 
	Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Paul Durrant <paul@xen.org>
Content-Type: multipart/alternative; boundary="0000000000009a793c06338ce3fc"

--0000000000009a793c06338ce3fc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I worked on Xen-on-Azure last summer in my previous position. Allocating a
heap page was how we solved this particular issue in our branch as well.

I see you say you're still 'working on bringing Xen up on Azure', so I'm
not sure how far along your branch / patch set is, but for what it's worth,
we had "everything" working, including use of VMBus and passthrough devices
in dom0.

The Azure version of the product got put on ice, and the code wasn't in a
very 'upstreamable' state due to how patches/branches were managed, but
bottom line is I know every bump on the Xen-on-Azure road, so may be able
to help get an upstream version of this 'the rest of the way' if you start
pushing it to xen-devel.

Cheers,
Trolle

On Thu, Apr 24, 2025 at 4:47=E2=80=AFPM Alejandro Vallejo <agarciav@amd.com=
> wrote:

> On Thu Apr 24, 2025 at 7:22 PM BST, Ariadne Conill wrote:
> > Hi,
> >
> >> On Apr 24, 2025, at 6:48=E2=80=AFAM, Alejandro Vallejo <agarciav@amd.c=
om>
> wrote:
> >>
> >> =EF=BB=BFOn Thu Apr 24, 2025 at 1:45 PM BST, Alejandro Vallejo wrote:
> >>> Xen nowadays crashes under some Hyper-V configurations when
> >>> paddr_bits>36. At the 44bit boundary we reach an edge case in which t=
he
> >>> end of the guest physical address space is not representable using
> 32bit
> >>> MFNs. Furthermore, it's an act of faith that the tail of the physical
> >>> address space has no reserved regions already.
> >>>
> >>> This commit uses the first unused MFN rather than the last, thus
> >>> ensuring the hypercall page placement is more resilient against such
> >>> corner cases.
> >>>
> >>> While at this, add an extra BUG_ON() to explicitly test for the
> >>> hypercall page being correctly set, and mark hcall_page_ready as
> >>> __ro_after_init.
> >>>
> >>> Fixes: 620fc734f854("x86/hyperv: setup hypercall page")
> >>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> >>
> >> After a side discussion, this seems on the unsafe side of things due t=
o
> >> potential collision with MMIO. I'll resend (though not today) with the
> >> page overlapping a RAM page instead. Possibly the last page of actual
> >> RAM.
> >
> > We have been working on bringing Xen up on Azure over at Edera, and
> > have encountered this problem.  Our solution to this problem was to
> > change Xen to handle the hypercall trampoline page in the same way as
> > Linux: dynamically allocating a page from the heap and then marking it
> > as executable.
> >
> > This approach should avoid the issues with MMIO and page overlaps.
>
> Yes, that's what I meant by overlapping RAM. Overlaying the hypercall
> page on top of existing RAM rather than trying to find a suitable hole.
>
> > Would it be more interesting to start with our patch instead?
>
> If you have it ready to go, for sure. My ability to test any of this is
> fairly limited. I suspect the VM is just not getting 48 bits worth of
> guest-physical address space, and so making any hypercall turns into an
> EPT violation.
>
> I couldn't run the tests that would definitely prove it though
>
> From the little I saw of the dmesg going forward, I suspect there's more
> required (at least in time handling) to enable support in gen2
> insteances.
>
> Cheers,
> Alejandro
>
>
>

--0000000000009a793c06338ce3fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I worked on Xen-on-Azure last summer in my previous positi=
on. Allocating a heap page was how we solved this particular issue in our b=
ranch as well.<br><br>I see you say you&#39;re still &#39;working on bringi=
ng Xen up on Azure&#39;, so I&#39;m not sure how far along your branch / pa=
tch set is, but for what it&#39;s worth, we had &quot;everything&quot; work=
ing, including use of VMBus and passthrough devices in dom0.<div><br>The Az=
ure version of the product got put on ice, and the code wasn&#39;t in a ver=
y &#39;upstreamable&#39; state due to how patches/branches were managed, bu=
t bottom line is I know every bump on the Xen-on-Azure road, so may be able=
 to help get an upstream version of this &#39;the rest of the way&#39; if y=
ou start pushing it to xen-devel.<div><br></div><div>Cheers,</div><div>Trol=
le</div></div></div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 24, 2025 at 4:47=E2=80=AFPM=
 Alejandro Vallejo &lt;<a href=3D"mailto:agarciav@amd.com">agarciav@amd.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Thu Apr 24, 2025 at 7:22 PM BST, Ariadne Conill wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt;&gt; On Apr 24, 2025, at 6:48=E2=80=AFAM, Alejandro Vallejo &lt;<a href=
=3D"mailto:agarciav@amd.com" target=3D"_blank">agarciav@amd.com</a>&gt; wro=
te:<br>
&gt;&gt; <br>
&gt;&gt; =EF=BB=BFOn Thu Apr 24, 2025 at 1:45 PM BST, Alejandro Vallejo wro=
te:<br>
&gt;&gt;&gt; Xen nowadays crashes under some Hyper-V configurations when<br=
>
&gt;&gt;&gt; paddr_bits&gt;36. At the 44bit boundary we reach an edge case =
in which the<br>
&gt;&gt;&gt; end of the guest physical address space is not representable u=
sing 32bit<br>
&gt;&gt;&gt; MFNs. Furthermore, it&#39;s an act of faith that the tail of t=
he physical<br>
&gt;&gt;&gt; address space has no reserved regions already.<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; This commit uses the first unused MFN rather than the last, th=
us<br>
&gt;&gt;&gt; ensuring the hypercall page placement is more resilient agains=
t such<br>
&gt;&gt;&gt; corner cases.<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; While at this, add an extra BUG_ON() to explicitly test for th=
e<br>
&gt;&gt;&gt; hypercall page being correctly set, and mark hcall_page_ready =
as<br>
&gt;&gt;&gt; __ro_after_init.<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; Fixes: 620fc734f854(&quot;x86/hyperv: setup hypercall page&quo=
t;)<br>
&gt;&gt;&gt; Signed-off-by: Alejandro Vallejo &lt;<a href=3D"mailto:agarcia=
v@amd.com" target=3D"_blank">agarciav@amd.com</a>&gt;<br>
&gt;&gt; <br>
&gt;&gt; After a side discussion, this seems on the unsafe side of things d=
ue to<br>
&gt;&gt; potential collision with MMIO. I&#39;ll resend (though not today) =
with the<br>
&gt;&gt; page overlapping a RAM page instead. Possibly the last page of act=
ual<br>
&gt;&gt; RAM.<br>
&gt;<br>
&gt; We have been working on bringing Xen up on Azure over at Edera, and<br=
>
&gt; have encountered this problem.=C2=A0 Our solution to this problem was =
to<br>
&gt; change Xen to handle the hypercall trampoline page in the same way as<=
br>
&gt; Linux: dynamically allocating a page from the heap and then marking it=
<br>
&gt; as executable.<br>
&gt;<br>
&gt; This approach should avoid the issues with MMIO and page overlaps.<br>
<br>
Yes, that&#39;s what I meant by overlapping RAM. Overlaying the hypercall<b=
r>
page on top of existing RAM rather than trying to find a suitable hole.<br>
<br>
&gt; Would it be more interesting to start with our patch instead?<br>
<br>
If you have it ready to go, for sure. My ability to test any of this is<br>
fairly limited. I suspect the VM is just not getting 48 bits worth of<br>
guest-physical address space, and so making any hypercall turns into an<br>
EPT violation.<br>
<br>
I couldn&#39;t run the tests that would definitely prove it though<br>
<br>
From the little I saw of the dmesg going forward, I suspect there&#39;s mor=
e<br>
required (at least in time handling) to enable support in gen2<br>
insteances.<br>
<br>
Cheers,<br>
Alejandro<br>
<br>
<br>
</blockquote></div>

--0000000000009a793c06338ce3fc--

