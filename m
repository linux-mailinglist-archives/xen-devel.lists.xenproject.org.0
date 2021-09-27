Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D6C4199D3
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 18:59:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197113.350064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUtye-0006F5-CJ; Mon, 27 Sep 2021 16:59:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197113.350064; Mon, 27 Sep 2021 16:59:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUtye-0006CP-9A; Mon, 27 Sep 2021 16:59:40 +0000
Received: by outflank-mailman (input) for mailman id 197113;
 Mon, 27 Sep 2021 16:59:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pp17=OR=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1mUtyc-0006C9-1Y
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 16:59:38 +0000
Received: from mail-ed1-x52d.google.com (unknown [2a00:1450:4864:20::52d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42feefc6-c1d8-4741-b91d-c24351cb3b58;
 Mon, 27 Sep 2021 16:59:36 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id s17so53289943edd.8
 for <xen-devel@lists.xenproject.org>; Mon, 27 Sep 2021 09:59:36 -0700 (PDT)
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
X-Inumbo-ID: 42feefc6-c1d8-4741-b91d-c24351cb3b58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+WLDGAQMdDej50CKean/med2vGPwv60xNujIKfagY/Y=;
        b=i5g4rVd+YZCv1hubU9Ey4s2NmIJnA5dyXIRA1oW5o1qVboJLCfhX4SAIIQ0Qc4U6jW
         AbI6jyXBfQA/RXBB1E+G0tZyJtyIhovKY1D1XRhulDc6kaOpuchvT2wu7L5ek1viy0nv
         ScE4Trf/nQXLVLy997ThWqZYXHudsMt1I7e/YVwteg39mw2guJ2QpUXpZYhgD+QjV2/x
         nTEstu1K5nZkKqJSNwqHyhe1PgYPaDDc5HCbT+BD8ZlIHG8jUC26KGAjShqKvAJBbH+6
         bZsuPWzRu8SUuQ2KBIYtZZIvhkuyr01jh6aEdJlqY0TSY+OjDQMx/HNm5Va2POEU+ucI
         yGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+WLDGAQMdDej50CKean/med2vGPwv60xNujIKfagY/Y=;
        b=ZZ5OjhtGiARJ70XAuEI1AL7UrM4noacBHTt17cdrfEmgstywSywbuLQS9kC9uRf7LT
         uyuw3cbicOIBTsES617bLQmzlVhxs/gF9f5oeVb1+Q2maZh//AioQxJlSF/Um4B29nFw
         /cUYc+lkLKsfZsepL5CndgNuAtm4idgklyS05g4mXQ74ORNt0xU6aGtslfB5iTllyeAO
         xvU2zu52n+jmS7VUlibNY5nD9t77yPu8AwxZuB2lUYd0BEdMA+uHSaE6f5QXyr85dnjl
         u1xzW12flbffZ1/N8rlUUk/1ln4lDm7f+aUOZb3KxnHPBFoxDBLMBPAyoBECWQQodF1A
         vF3Q==
X-Gm-Message-State: AOAM533rrur2mkpTFMrueph9HwjNgdYwgRk/bj3namA5t3yptxTBi9Kh
	x9k+PClpFZ47VnxJGye/b1snVMSX1WPm7A1IgaI=
X-Google-Smtp-Source: ABdhPJyonwJT+jaa4bgFc4Q16DpMAwV/K2uxET5ibvPmkfRxJFEiraJ/ppNmQUwao+vDTC4e6e1KNAmX/yQnIEniYug=
X-Received: by 2002:a50:cfcb:: with SMTP id i11mr1127843edk.347.1632761975817;
 Mon, 27 Sep 2021 09:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1632307952.git.rahul.singh@arm.com> <c837d73b1fc8953ab48d36609482cf84832b7827.1632307952.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109221836190.17979@sstabellini-ThinkPad-T480s>
 <F87F4A4E-D6CC-4341-88CF-2DD52A1FD503@arm.com> <alpine.DEB.2.21.2109231206120.17979@sstabellini-ThinkPad-T480s>
 <1E52C080-6913-4009-997D-A9C0988B5A09@arm.com> <alpine.DEB.2.21.2109241422170.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109241422170.17979@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Mon, 27 Sep 2021 18:59:24 +0200
Message-ID: <CAJ=z9a3J7xgEJu8waQpnORO4=gcucK1oHrcjpzBrW1Fs0HY3oQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/17] xen/arm: PCI host bridge discovery within XEN on ARM
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Rahul Singh <Rahul.Singh@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Andre Przywara <Andre.Przywara@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: multipart/alternative; boundary="00000000000092495705ccfd0589"

--00000000000092495705ccfd0589
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Sep 2021, 23:42 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> On Fri, 24 Sep 2021, Rahul Singh wrote:
> > Hi Stefano,
> >
> > > On 23 Sep 2021, at 8:12 pm, Stefano Stabellini <sstabellini@kernel.org>
> wrote:
> > >
> > > On Thu, 23 Sep 2021, Rahul Singh wrote:
> > >>>> +            goto err_exit;
> > >>>> +    }
> > >>>
> > >>> This is unnecessary at the moment, right? Can we get rid of
> ops->init ?
> > >>
> > >> No this is required for N1SDP board. Please check below patch.
> > >>
> https://gitlab.com/rahsingh/xen-integration/-/commit/6379ba5764df33d57547087cff4ffc078dc515d5
> > >
> > > OK
> > >
> > >
> > >>>> +int pci_host_common_probe(struct dt_device_node *dev, const void
> *data)
> > >>>> +{
> > >>>> +    struct pci_host_bridge *bridge;
> > >>>> +    struct pci_config_window *cfg;
> > >>>> +    struct pci_ecam_ops *ops;
> > >>>> +    const struct dt_device_match *of_id;
> > >>>> +    int err;
> > >>>> +
> > >>>> +    if ( dt_device_for_passthrough(dev) )
> > >>>> +        return 0;
> > >>>> +
> > >>>> +    of_id = dt_match_node(dev->dev.of_match_table,
> dev->dev.of_node);
> > >>>> +    ops = (struct pci_ecam_ops *) of_id->data;
> > >>>
> > >>> Do we really need dt_match_node and dev->dev.of_match_table to get
> > >>> dt_device_match.data?
> > >>>
> > >>
> > >>> data is passed as a parameter to pci_host_common_probe, isn't it
> enough
> > >>> to do:
> > >>>
> > >>> ops = (struct pci_ecam_ops *) data;
> > >>
> > >> As of now not required but in future we might need it if we implement
> other ecam supported bridge
> > >>
> > >> static const struct dt_device_match gen_pci_dt_match[] = {
>
> > >>    { .compatible = "pci-host-ecam-generic",
>
> > >>      .data =       &pci_generic_ecam_ops },
> > >>
> > >>    { .compatible = "pci-host-cam-generic",
> > >>      .data = &gen_pci_cfg_cam_bus_ops },
>
> > >>
> > >>    { },
>
> > >> };
> > >
> > > Even if we add another ECAM-supported bridge, the following:
> > >
> > > ops = (struct pci_ecam_ops *) data;
> > >
> > > could still work, right? The probe function will directly receive as
> > > parameter the .data pointer. You shouldn't need the indirection via
> > > dt_match_node?
> >
> > As per my understanding probe function will not get .data pointer.Probe
> data argument is NULL in most of the cases in XEN
> > Please have a look once dt_pci_init() -> device_init(..) call flow
> implementation.
>
> You are right. Looking at the code, nobody is currently using
> dt_device_match.data and it is clear why: it is not passed to the
> device_desc.init function at all. As it is today, it is basically
> useless.
>

IIRC it is used by the SMMU driver. But you need to lookup for the desc
manually in each init callback.

If I am not mistaken, this is how Linux is dealing with it as well.
However...


> And there is only one case where device_init has a non-NULL data
> parameter and it is in xen/drivers/char/arm-uart.c. All the others are
> not even using the data parameter of device_init.


> I think we need to change device_init so that dt_device_match.data can
> be useful. Sorry for the scope-creep but I think we should do the
> following:
>
> - do not add of_match_table to struct device
>
> - add one more parameter to device_desc.init:
>   int (*init)(struct dt_device_node *dev, struct device_desc *desc, const
> void *data);
>
> - change device_init to call desc->init with the right parameters:
>   desc->init(dev, desc, data);
>
> This way pci_host_common_probe is just going to get a desc directly as
> parameter. I think it would make a lot more sense from an interface
> perspective. It does require a change in all the DT_DEVICE_START.init
> functions adding a struct device_desc *desc parameter, but it should be
> a mechanical change.
>
> Alternatively we could just change device_init to pass
> device_desc.dt_match.data when the data parameter is NULL but it feels
> like a hack.
>
>
> What do you think?


... I like the idea of passing desc parameter (we could also simply pass
desc.data in an argument named "priv").

Cheers,

>

--00000000000092495705ccfd0589
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, 24 Sep 2021, 23:42 Stefano Stabellini, &lt;<a =
href=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Fri, 24 Sep 2021, Rahul Singh =
wrote:<br>
&gt; Hi Stefano,<br>
&gt; <br>
&gt; &gt; On 23 Sep 2021, at 8:12 pm, Stefano Stabellini &lt;<a href=3D"mai=
lto:sstabellini@kernel.org" target=3D"_blank" rel=3D"noreferrer">sstabellin=
i@kernel.org</a>&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; On Thu, 23 Sep 2021, Rahul Singh wrote:<br>
&gt; &gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_e=
xit;<br>
&gt; &gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt; This is unnecessary at the moment, right? Can we get rid =
of ops-&gt;init ?<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt; No this is required for N1SDP board. Please check below patch=
.<br>
&gt; &gt;&gt; <a href=3D"https://gitlab.com/rahsingh/xen-integration/-/comm=
it/6379ba5764df33d57547087cff4ffc078dc515d5" rel=3D"noreferrer noreferrer" =
target=3D"_blank">https://gitlab.com/rahsingh/xen-integration/-/commit/6379=
ba5764df33d57547087cff4ffc078dc515d5</a><br>
&gt; &gt; <br>
&gt; &gt; OK<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt;&gt;&gt;&gt; +int pci_host_common_probe(struct dt_device_node *dev=
, const void *data)<br>
&gt; &gt;&gt;&gt;&gt; +{<br>
&gt; &gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 struct pci_host_bridge *bridge;<br>
&gt; &gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 struct pci_config_window *cfg;<br>
&gt; &gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 struct pci_ecam_ops *ops;<br>
&gt; &gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 const struct dt_device_match *of_id;<b=
r>
&gt; &gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 int err;<br>
&gt; &gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 if ( dt_device_for_passthrough(dev) )<=
br>
&gt; &gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; &gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 of_id =3D dt_match_node(dev-&gt;dev.of=
_match_table, dev-&gt;dev.of_node);<br>
&gt; &gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 ops =3D (struct pci_ecam_ops *) of_id-=
&gt;data;<br>
&gt; &gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt; Do we really need dt_match_node and dev-&gt;dev.of_match_=
table to get<br>
&gt; &gt;&gt;&gt; dt_device_match.data?<br>
&gt; &gt;&gt;&gt; <br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt;&gt; data is passed as a parameter to pci_host_common_probe, i=
sn&#39;t it enough<br>
&gt; &gt;&gt;&gt; to do:<br>
&gt; &gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt; ops =3D (struct pci_ecam_ops *) data;<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt; As of now not required but in future we might need it if we i=
mplement other ecam supported bridge<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt; static const struct dt_device_match gen_pci_dt_match[] =3D {=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 <br>
&gt; &gt;&gt;=C2=A0 =C2=A0 { .compatible =3D &quot;pci-host-ecam-generic&qu=
ot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 .data =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
pci_generic_ecam_ops },<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt;=C2=A0 =C2=A0 { .compatible =3D &quot;pci-host-cam-generic&quo=
t;,<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 .data =3D &amp;gen_pci_cfg_cam_bus_ops },=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt;=C2=A0 =C2=A0 { },=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt;&gt; };<br>
&gt; &gt; <br>
&gt; &gt; Even if we add another ECAM-supported bridge, the following:<br>
&gt; &gt; <br>
&gt; &gt; ops =3D (struct pci_ecam_ops *) data;<br>
&gt; &gt; <br>
&gt; &gt; could still work, right? The probe function will directly receive=
 as<br>
&gt; &gt; parameter the .data pointer. You shouldn&#39;t need the indirecti=
on via<br>
&gt; &gt; dt_match_node?<br>
&gt; <br>
&gt; As per my understanding probe function will not get .data pointer.Prob=
e data argument is NULL in most of the cases in XEN<br>
&gt; Please have a look once dt_pci_init() -&gt; device_init(..) call flow =
implementation.<br>
<br>
You are right. Looking at the code, nobody is currently using<br>
dt_device_match.data and it is clear why: it is not passed to the<br>
device_desc.init function at all. As it is today, it is basically<br>
useless.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">IIRC it is used by the SMMU driver. But you need to lookup for th=
e desc manually in each init callback.</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">If I am not mistaken, this is how Linux is dealing with it a=
s well. However...</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
And there is only one case where device_init has a non-NULL data<br>
parameter and it is in xen/drivers/char/arm-uart.c. All the others are<br>
not even using the data parameter of device_init.</blockquote></div></div><=
div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
I think we need to change device_init so that dt_device_match.data can<br>
be useful. Sorry for the scope-creep but I think we should do the<br>
following:<br>
<br>
- do not add of_match_table to struct device<br>
<br>
- add one more parameter to device_desc.init:<br>
=C2=A0 int (*init)(struct dt_device_node *dev, struct device_desc *desc, co=
nst void *data);<br>
<br>
- change device_init to call desc-&gt;init with the right parameters:<br>
=C2=A0 desc-&gt;init(dev, desc, data);<br>
<br>
This way pci_host_common_probe is just going to get a desc directly as<br>
parameter. I think it would make a lot more sense from an interface<br>
perspective. It does require a change in all the DT_DEVICE_START.init<br>
functions adding a struct device_desc *desc parameter, but it should be<br>
a mechanical change.<br>
<br>
Alternatively we could just change device_init to pass<br>
device_desc.dt_match.data when the data parameter is NULL but it feels<br>
like a hack.<br>
<br>
<br>
What do you think?</blockquote></div></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">... I like the idea of passing desc parameter (we could also =
simply pass desc.data in an argument named &quot;priv&quot;).</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Cheers,</div><div dir=3D"auto"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--00000000000092495705ccfd0589--

