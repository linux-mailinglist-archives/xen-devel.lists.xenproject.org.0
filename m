Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E6D419111
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 10:46:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196533.349432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUmGi-0003Lp-KD; Mon, 27 Sep 2021 08:45:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196533.349432; Mon, 27 Sep 2021 08:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUmGi-0003Hs-Gl; Mon, 27 Sep 2021 08:45:48 +0000
Received: by outflank-mailman (input) for mailman id 196533;
 Mon, 27 Sep 2021 08:45:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pp17=OR=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1mUmGg-0002zu-Gz
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 08:45:46 +0000
Received: from mail-ed1-x535.google.com (unknown [2a00:1450:4864:20::535])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6fa954c4-3c12-412c-98ab-0dd73b776962;
 Mon, 27 Sep 2021 08:45:41 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id s17so47433471edd.8
 for <xen-devel@lists.xenproject.org>; Mon, 27 Sep 2021 01:45:41 -0700 (PDT)
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
X-Inumbo-ID: 6fa954c4-3c12-412c-98ab-0dd73b776962
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o2SPdkuE1Epdr/lPUP2/nUJBK5SmDI2SytgdxN+W2f8=;
        b=UoxY9yC+uuxiqX1fbmgoezrxxBHJjUVl3gLH4s2kcWvm/4Q+ICyx5nImiGMlJk/97C
         uBtr9yN/3+SA8/zH1j9SzU7k+ST0HzxM2tJFmYBwuY/q39nqfN0qP9rbM3lzTHlmVrX3
         WE9EyK8WQNcvjEuZSoaV1ZUwyNk8dBtTv6Iqv0re/KmAsFzc3w/OgJ4CQsFQlAZCBZTJ
         CAeVqSv+BB6tOpGECAuDPPaAKtxjbbaaAbQSyHLgcQatFpIokBmj9ho2qNakRQaBOynA
         fB9bHY49ANVjoxy8zMbEIBJbbgfazFWph3s4pAjKbRUcky8hd77RldMmRbVt0b11G8OB
         n2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o2SPdkuE1Epdr/lPUP2/nUJBK5SmDI2SytgdxN+W2f8=;
        b=uEdg+fnO/eOWBsysu6iH9oPOHKFdAdlue+nHjfok4zO4v3RkLafiXXvne/YJZcsxKb
         GjeMtLfffSEKweLxqn/wCyOADudyV2Vsyo2xJO/hAi0x2QHyz7FRKx324UH1sp2tXLYj
         so/umAt9G/uQgNVt4BlJE0Hf0GbR2A2NA+xYtiOK4+bxCeNXemxvmCZ+W273glrexmn2
         czJ4/wtVeL0ZPF+ofZSPYWCOyakF9zHrx3HbcZ18h2CD4vxeU08lgR5ORN2n3geFRsjl
         m2UY/vg+Sq8adfHISN1WNjoPuG3sdFeO+cwAjsbRGYWZjEe/iN4/sJFNI58zs4qoqjhA
         Y0tA==
X-Gm-Message-State: AOAM531G+IBxBn1s0C7A34X9i8waNc2SGoJbCXtj0UxTIFzkzNC7NbIv
	kjZKU5h7X7ugnsgK/LBaoL7J+0KcrHx26VeeezU=
X-Google-Smtp-Source: ABdhPJzGXQuhhLI/jvUnszxKSrs+BQvYzIKUpP7DQCKPj1pPOT6sCYyjZeQWawcmxuOrsKsFz0xuF2TWoO6dhT9aqII=
X-Received: by 2002:aa7:df92:: with SMTP id b18mr21165119edy.47.1632732340888;
 Mon, 27 Sep 2021 01:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-37-wei.chen@arm.com>
 <alpine.DEB.2.21.2109232029450.17979@sstabellini-ThinkPad-T480s>
 <56e0cc0e-7405-74b0-eb4b-07cd9cdae225@arm.com> <alpine.DEB.2.21.2109241237210.17979@sstabellini-ThinkPad-T480s>
 <4e6f7222-59c8-7853-cf2c-076620efa244@suse.com>
In-Reply-To: <4e6f7222-59c8-7853-cf2c-076620efa244@suse.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Mon, 27 Sep 2021 12:45:30 +0400
Message-ID: <CAJ=z9a1wOd6Hct50O_3B5q3o-bvhgMFy+A95gYMPfz-YL8uFDQ@mail.gmail.com>
Subject: Re: [PATCH 36/37] xen/arm: Provide Kconfig options for Arm to enable NUMA
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>
Content-Type: multipart/alternative; boundary="00000000000031261505ccf61f83"

--00000000000031261505ccf61f83
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Sep 2021, 10:33 Jan Beulich, <jbeulich@suse.com> wrote:

> On 24.09.2021 21:39, Stefano Stabellini wrote:
> > On Fri, 24 Sep 2021, Wei Chen wrote:
> >> On 2021/9/24 11:31, Stefano Stabellini wrote:
> >>> On Thu, 23 Sep 2021, Wei Chen wrote:
> >>>> --- a/xen/arch/arm/Kconfig
> >>>> +++ b/xen/arch/arm/Kconfig
> >>>> @@ -34,6 +34,17 @@ config ACPI
> >>>>      Advanced Configuration and Power Interface (ACPI) support for
> Xen is
> >>>>      an alternative to device tree on ARM64.
> >>>>   + config DEVICE_TREE_NUMA
> >>>> +  def_bool n
> >>>> +  select NUMA
> >>>> +
> >>>> +config ARM_NUMA
> >>>> +  bool "Arm NUMA (Non-Uniform Memory Access) Support (UNSUPPORTED)"
> if
> >>>> UNSUPPORTED
> >>>> +  select DEVICE_TREE_NUMA if HAS_DEVICE_TREE
> >>>
> >>> Should it be: depends on HAS_DEVICE_TREE ?
> >>> (And eventually depends on HAS_DEVICE_TREE || ACPI)
> >>>
> >>
> >> As the discussion in RFC [1]. We want to make ARM_NUMA as a generic
> >> option can be selected by users. And depends on has_device_tree
> >> or ACPI to select DEVICE_TREE_NUMA or ACPI_NUMA.
> >>
> >> If we add HAS_DEVICE_TREE || ACPI as dependencies for ARM_NUMA,
> >> does it become a loop dependency?
> >>
> >>
> https://lists.xenproject.org/archives/html/xen-devel/2021-08/msg00888.html
> >
> > OK, I am fine with that. I was just trying to catch the case where a
> > user selects "ARM_NUMA" but actually neither ACPI nor HAS_DEVICE_TREE
> > are selected so nothing happens. I was trying to make it clear that
> > ARM_NUMA depends on having at least one between HAS_DEVICE_TREE or ACPI
> > because otherwise it is not going to work.
> >
> > That said, I don't think this is important because HAS_DEVICE_TREE
> > cannot be unselected. So if we cannot find a way to express the
> > dependency, I think it is fine to keep the patch as is.
>
> So how about doing things the other way around: ARM_NUMA has no prompt
> and defaults to ACPI_NUMA || DT_NUMA, and DT_NUMA gains a prompt instead
> (and, for Arm at least, ACPI_NUMA as well; this might even be worthwhile
> to have on x86 down the road).
>

As I wrote before, I don't think the user should say "I want to enable NUMA
with Device-Tree or ACPI". Instead, they say whether they want to use NUMA
and let Xen decide to enable the DT/ACPI support.

In other word, the prompt should stay on ARM_NUMA.

Cheers,


> Jan
>
>

--00000000000031261505ccf61f83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, 27 Sep 2021, 10:33 Jan Beulich, &lt;<a href=3D=
"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">On 24.09.2021 21:39, Stefano Stabellini wrote:<br>
&gt; On Fri, 24 Sep 2021, Wei Chen wrote:<br>
&gt;&gt; On 2021/9/24 11:31, Stefano Stabellini wrote:<br>
&gt;&gt;&gt; On Thu, 23 Sep 2021, Wei Chen wrote:<br>
&gt;&gt;&gt;&gt; --- a/xen/arch/arm/Kconfig<br>
&gt;&gt;&gt;&gt; +++ b/xen/arch/arm/Kconfig<br>
&gt;&gt;&gt;&gt; @@ -34,6 +34,17 @@ config ACPI<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Advanced Configuration and Power Inter=
face (ACPI) support for Xen is<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 an alternative to device tree on ARM64=
.<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0+ config DEVICE_TREE_NUMA<br>
&gt;&gt;&gt;&gt; +=C2=A0 def_bool n<br>
&gt;&gt;&gt;&gt; +=C2=A0 select NUMA<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +config ARM_NUMA<br>
&gt;&gt;&gt;&gt; +=C2=A0 bool &quot;Arm NUMA (Non-Uniform Memory Access) Su=
pport (UNSUPPORTED)&quot; if<br>
&gt;&gt;&gt;&gt; UNSUPPORTED<br>
&gt;&gt;&gt;&gt; +=C2=A0 select DEVICE_TREE_NUMA if HAS_DEVICE_TREE<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Should it be: depends on HAS_DEVICE_TREE ?<br>
&gt;&gt;&gt; (And eventually depends on HAS_DEVICE_TREE || ACPI)<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; As the discussion in RFC [1]. We want to make ARM_NUMA as a generi=
c<br>
&gt;&gt; option can be selected by users. And depends on has_device_tree<br=
>
&gt;&gt; or ACPI to select DEVICE_TREE_NUMA or ACPI_NUMA.<br>
&gt;&gt;<br>
&gt;&gt; If we add HAS_DEVICE_TREE || ACPI as dependencies for ARM_NUMA,<br=
>
&gt;&gt; does it become a loop dependency?<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://lists.xenproject.org/archives/html/xen-devel/20=
21-08/msg00888.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https:=
//lists.xenproject.org/archives/html/xen-devel/2021-08/msg00888.html</a><br=
>
&gt; <br>
&gt; OK, I am fine with that. I was just trying to catch the case where a<b=
r>
&gt; user selects &quot;ARM_NUMA&quot; but actually neither ACPI nor HAS_DE=
VICE_TREE<br>
&gt; are selected so nothing happens. I was trying to make it clear that<br=
>
&gt; ARM_NUMA depends on having at least one between HAS_DEVICE_TREE or ACP=
I<br>
&gt; because otherwise it is not going to work.<br>
&gt; <br>
&gt; That said, I don&#39;t think this is important because HAS_DEVICE_TREE=
<br>
&gt; cannot be unselected. So if we cannot find a way to express the<br>
&gt; dependency, I think it is fine to keep the patch as is.<br>
<br>
So how about doing things the other way around: ARM_NUMA has no prompt<br>
and defaults to ACPI_NUMA || DT_NUMA, and DT_NUMA gains a prompt instead<br=
>
(and, for Arm at least, ACPI_NUMA as well; this might even be worthwhile<br=
>
to have on x86 down the road).<br></blockquote></div></div><div dir=3D"auto=
"><br></div><div dir=3D"auto">As I wrote before, I don&#39;t think the user=
 should say &quot;I want to enable NUMA with Device-Tree or ACPI&quot;. Ins=
tead, they say whether they want to use NUMA and let Xen decide to enable t=
he DT/ACPI support.</div><div dir=3D"auto"><br></div><div dir=3D"auto">In o=
ther word, the prompt should stay on ARM_NUMA.</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Cheers,</div><div dir=3D"auto"><br></div><div dir=3D=
"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Jan<br>
<br>
</blockquote></div></div></div>

--00000000000031261505ccf61f83--

