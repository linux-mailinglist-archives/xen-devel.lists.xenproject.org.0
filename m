Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D02246F838C
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 15:11:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530344.825916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puvDm-0007By-Kv; Fri, 05 May 2023 13:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530344.825916; Fri, 05 May 2023 13:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puvDm-00079V-Hb; Fri, 05 May 2023 13:11:38 +0000
Received: by outflank-mailman (input) for mailman id 530344;
 Fri, 05 May 2023 13:11:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uJCN=A2=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1puvDl-00079P-4g
 for xen-devel@lists.xen.org; Fri, 05 May 2023 13:11:37 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c691316-eb46-11ed-b226-6b7b168915f2;
 Fri, 05 May 2023 15:11:35 +0200 (CEST)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1ab1ce53ca6so12546535ad.0
 for <xen-devel@lists.xen.org>; Fri, 05 May 2023 06:11:36 -0700 (PDT)
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
X-Inumbo-ID: 5c691316-eb46-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683292294; x=1685884294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kFXuBNBO1/GgAF8ppAIzcxSbDhbGubAz15oXF2l6RaU=;
        b=EmFSas1IcVTUjHuldQ2/6zNLezKywUWrBa9ONtWGtBr44Oh2n7g4qgPDHQfRrPVIf9
         gFU79gd1sYWfdZ2HqumFD0Gb4FhK64HSYt7hYh810wzM7DUttkDzTJifoX65Yh5ajKdL
         kN1AP9DB9XkXBMjWa3Hi6/Og9NQ2q5JnKcBRoLGw+DECydT49kl/2q7stAzYhqAXG6kr
         o5zg221k5noTVc/+Z/zq7yoriUvoPSF7aC3T4qtleMQmOnRnNiUTRc80IM6ddiJ8d1Vi
         V8GZkhebIZ01+0X5bO7bCmMGZhftmMTe2YW3oZv7cg/SKmCwEBKj8NZEH4w6KXY73pmS
         cQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683292294; x=1685884294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kFXuBNBO1/GgAF8ppAIzcxSbDhbGubAz15oXF2l6RaU=;
        b=htw9xHRfSArlVktpEFtSw/fsGeZC99YTB0uFkF6E0liXKPkJGYAo1qUqnx6hg5tuyP
         3No2b052UtLkzYKTvKrHjWoQzSx5gQIMlmkoiGrg5X+aPDZWIS4bAgNA9Yfaz5c3H2Oz
         auibYEMRK9jBprOglOcAhnIZCQx4v205kgDWtryKioPT2xJKdhjs97pqybkvfoHLJ1nk
         hIXQXg0C7HGyCAU0sVyM6A7tDA5ksWKnGviF/dtNhK3RgEdf6ZpQPMDx5TKtDZYdqVsG
         FbcwC7SU0LSkyjz3QBHL8M60MxoC5qPhv82z4VA3usRfRN57nf142TbTHEXg63qddohm
         Z2XQ==
X-Gm-Message-State: AC+VfDxW2H2q8bXdXaPBY3aKl8fLYM5jIHz5hQobye//vYlO2rcBreW+
	PlyThS0Ea3MyQbNbSm4KUDqtRr2FiVSZObg5Bm4=
X-Google-Smtp-Source: ACHHUZ4ocOAy1V5T9RjnZJ17ugGMfoiOcHse95/8gKexFyzq4yZczoV1WVOyAJTomSbTL+cXt7IoIs33gFSE/LLcw0Y=
X-Received: by 2002:a17:902:eb4b:b0:1a6:7632:2b20 with SMTP id
 i11-20020a170902eb4b00b001a676322b20mr1393189pli.40.1683292294302; Fri, 05
 May 2023 06:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <817f0320316dd144826add0ac834618026b91160.1680165772.git.viresh.kumar@linaro.org>
 <25fb2b71-b663-b712-01cd-5c75aa4ccf9b@gmail.com> <20230404234228.vghxrrj6auy7zw4c@vireshk-i7>
 <20230505061934.jm3bwjgsl5hf5rns@vireshk-i7>
In-Reply-To: <20230505061934.jm3bwjgsl5hf5rns@vireshk-i7>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Fri, 5 May 2023 16:11:23 +0300
Message-ID: <CAPD2p-nvLXdxkwik-UPjS1JAjz6z2FNuxb1JYrj4bNwusEZpPg@mail.gmail.com>
Subject: Re: [PATCH] libxl: arm: Allow grant mappings for backends running on Dom0
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, xen-devel@lists.xen.org, 
	stratos-dev@op-lists.linaro.org, Juergen Gross <jgross@suse.com>, 
	Julien Grall <julien@xen.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Mathieu Poirier <mathieu.poirier@linaro.com>, 
	Erik Schilling <erik.schilling@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000041518705faf207ed"

--00000000000041518705faf207ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Viresh

[sorry for the possible format issues]

On Fri, May 5, 2023 at 9:19=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.or=
g> wrote:

> On 05-04-23, 05:12, Viresh Kumar wrote:
> > On 04-04-23, 21:16, Oleksandr Tyshchenko wrote:
> > > ok, probably makes sense
> >
> > While testing both foreign and grant mappings I stumbled upon another
> > related problem. How do I control the creation of iommu node from
> > guest configuration file, irrespective of the domain backend is
> > running at ? This is what we have right now:
> >
> > - always create iommu nodes if backend-dom !=3D 0
> > - always create iommu nodes if forced_grant =3D=3D 1
> >
> > what I need to cover is
> > - don't create iommu nodes irrespective of the domain
> >
> > This is required if you want to test both foreign and grant memory
> > allocations, with different guests kernels. i.e. one guest kernel for
> > device with grant mappings and another guest for device with foreign
> > mappings. There is no way, that I know of, to disable the creation of
> > iommu nodes. Of course we would want to use the same images for kernel
> > and other stuff, so this needs to be controlled from guest
> > configuration file.
>
> Any input on this please ?
>


I was going to propose an idea, but I have just realized that you already
voiced it here [1] ))
So what you proposed there sounds reasonable to me.

I will just rephrase it according to my understanding:

We probably need to consider transforming your "forced_grant" to something
three-state, for example
"grant_usage" (or "use_grant" as you suggested) which could be "default
behaviour" or "always disabled", or "always enabled".

With "grant_usage=3Ddefault" we will get exact what we have at the moment
(only create iommu nodes if backend-domid !=3D 0)
With "grant_usage=3Ddisabled" we will force grants to be always disabled
(don't create iommu nodes irrespective of the domain)
With "grant_usage=3Denabled" we will force grants to be always enabled
(always create iommu nodes irrespective of the domain)


[1]
https://lore.kernel.org/xen-devel/20230505093835.jcbwo6zjk5hcjvsm@vireshk-i=
7/


>
> --
> viresh
>


--=20
Regards,

Oleksandr Tyshchenko

--00000000000041518705faf207ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello Viresh<br></div><div dir=3D"ltr"><b=
r></div><div>[sorry for the possible format issues]</div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 5, 2023 at 9=
:19=E2=80=AFAM Viresh Kumar &lt;<a href=3D"mailto:viresh.kumar@linaro.org" =
target=3D"_blank">viresh.kumar@linaro.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 05-04-23, 05:12, Viresh Kumar w=
rote:<br>
&gt; On 04-04-23, 21:16, Oleksandr Tyshchenko wrote:<br>
&gt; &gt; ok, probably makes sense<br>
&gt; <br>
&gt; While testing both foreign and grant mappings I stumbled upon another<=
br>
&gt; related problem. How do I control the creation of iommu node from<br>
&gt; guest configuration file, irrespective of the domain backend is<br>
&gt; running at ? This is what we have right now:<br>
&gt; <br>
&gt; - always create iommu nodes if backend-dom !=3D 0<br>
&gt; - always create iommu nodes if forced_grant =3D=3D 1<br>
&gt; <br>
&gt; what I need to cover is<br>
&gt; - don&#39;t create iommu nodes irrespective of the domain<br>
&gt; <br>
&gt; This is required if you want to test both foreign and grant memory<br>
&gt; allocations, with different guests kernels. i.e. one guest kernel for<=
br>
&gt; device with grant mappings and another guest for device with foreign<b=
r>
&gt; mappings. There is no way, that I know of, to disable the creation of<=
br>
&gt; iommu nodes. Of course we would want to use the same images for kernel=
<br>
&gt; and other stuff, so this needs to be controlled from guest<br>
&gt; configuration file.<br>
<br>
Any input on this please ?<br></blockquote><div><br></div><div><br></div><d=
iv>I was going to propose an idea, but I have just realized that you alread=
y voiced it here [1] ))<br>So what you proposed there sounds reasonable to =
me.<br><br>I will just rephrase it according to my understanding:<br><br>We=
 probably need to consider transforming your &quot;forced_grant&quot; to so=
mething three-state, for example<br>&quot;grant_usage&quot; (or &quot;use_g=
rant&quot; as you suggested) which could be &quot;default behaviour&quot; o=
r &quot;always disabled&quot;, or &quot;always enabled&quot;.<br><br>With &=
quot;grant_usage=3Ddefault&quot; we will get exact what we have at the mome=
nt (only create iommu nodes if backend-domid !=3D 0)<br>With &quot;grant_us=
age=3Ddisabled&quot; we will force grants to be always disabled (don&#39;t =
create iommu nodes irrespective of the domain)<br>With &quot;grant_usage=3D=
enabled&quot; we will force grants to be always enabled (always create iomm=
u nodes irrespective of the domain)<br></div><div><br></div><div><br></div>=
<div>[1] <a href=3D"https://lore.kernel.org/xen-devel/20230505093835.jcbwo6=
zjk5hcjvsm@vireshk-i7/">https://lore.kernel.org/xen-devel/20230505093835.jc=
bwo6zjk5hcjvsm@vireshk-i7/</a><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
-- <br>
viresh<br>
</blockquote></div><br clear=3D"all"><div><br></div><span>-- </span><br><di=
v dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr">=
<span style=3D"background-color:rgb(255,255,255)"><font size=3D"2"><span st=
yle=3D"color:rgb(51,51,51);font-family:Arial,sans-serif">Regards,</span></f=
ont></span></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div><span sty=
le=3D"background-color:rgb(255,255,255)"><font size=3D"2">Oleksandr Tyshche=
nko</font></span></div></div></div></div></div></div></div></div>

--00000000000041518705faf207ed--

