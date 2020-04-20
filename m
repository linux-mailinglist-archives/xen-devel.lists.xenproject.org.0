Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AFE1B0C77
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 15:21:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQWMC-0007vY-2F; Mon, 20 Apr 2020 13:21:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=c3QN=6E=gmail.com=brendank310@srs-us1.protection.inumbo.net>)
 id 1jQWMA-0007vS-WE
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 13:21:03 +0000
X-Inumbo-ID: c5adc6e8-8309-11ea-b4f4-bc764e2007e4
Received: from mail-ua1-x944.google.com (unknown [2607:f8b0:4864:20::944])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5adc6e8-8309-11ea-b4f4-bc764e2007e4;
 Mon, 20 Apr 2020 13:20:58 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id i22so3581748uak.6
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2020 06:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VpcsqAlQlp7qXVfTlVL/05yjiCd41tZkoCGHDj0/oIg=;
 b=SDBMgZMBMQiUhjqjoRYdHTSfW35pmmUTaN3+a+Kq/dpf9w1HQINbDts+dCFue2++v9
 mFquXPXHcnNQX/YfKjKXT95U1918HP3SI679T3kBy4wzZuOZmoTC7v9/D1kQ0F3I9GK3
 7D5mQfr7aestjxLHUUxYQW20rcITTOh8HqZ8gNHmrxZZcGCAgeH1ziyOQsg1iAx0SFhY
 FKAH2ssxhV6XEsTrD5hbGMNPiPL+TlO9JJ7jmUKFm9kxlDvUu+n27aGvjuNxXMi0tixc
 hDW0YosOI+oCJjx6bAjo2jVSJk52snubwTozoe/cd7UYhgHcQfQKr0OUimr05tVXHask
 uvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VpcsqAlQlp7qXVfTlVL/05yjiCd41tZkoCGHDj0/oIg=;
 b=Jg+DUA3GT06lmZJi++81uRt2AbHDDy1faIo66fPHK6W0/lHD5VCjnHT/kVt0QtBy+d
 oNu9bmQO0I7ztSDpL/6+WdkvvoEQll1fX4Ra3me2X+u9d/HWsPnX4eK7InRP+9o69Phz
 0MZwwy8QsPMISIPGAAr6fslKV0QYpTTNm2Damsr/pkdjtnNmkGTFS+0Y2SH4P1wxNXyz
 VXgwxRQYNSTFwjptkoMdPIp6BOJV2AKcvchT6k7JPzln+LbdT3DxT4yDHZ1eACmcZCNn
 vEB6VnuzTqnJo150HF7+PTU4CqcimdEThu1e0/2eUoqfgVV9lxvKFttAGzVyXjXEpsyi
 w8+A==
X-Gm-Message-State: AGi0PuaIyBOGi5EEyfvPEI9Z2pU9WOK3+OpOEOlBycjhDT5RVIv64Tru
 qkjDdNV1fHQLTnP9gu91770jlxQhy0Uz1XstspA=
X-Google-Smtp-Source: APiQypIacDoPrZtqodsBs9S8OPRC8LOLQEWyIt9K+7I5gWva8YiFgsYuOv3zEWP9LgyTQMq7Wr5dfDyjMypyGhCiD/s=
X-Received: by 2002:ab0:705:: with SMTP id h5mr7844656uah.74.1587388857926;
 Mon, 20 Apr 2020 06:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200417133626.72302-1-brendank310@gmail.com>
 <20200417133626.72302-2-brendank310@gmail.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D84C3FA@SHSMSX104.ccr.corp.intel.com>
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D84C3FA@SHSMSX104.ccr.corp.intel.com>
From: Brendan Kerrigan <brendank310@gmail.com>
Date: Mon, 20 Apr 2020 09:20:46 -0400
Message-ID: <CAKPa3c1fsGctG9+P2VNYQez8TWndc=qpa6-O+=LC4dB5qHRLig@mail.gmail.com>
Subject: Re: [PATCH 1/1] x86/vtd: Mask DMAR faults for IGD devices
To: "Tian, Kevin" <kevin.tian@intel.com>
Content-Type: multipart/alternative; boundary="000000000000ff4c2205a3b8c467"
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Brendan Kerrigan <kerriganb@ainfosec.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--000000000000ff4c2205a3b8c467
Content-Type: text/plain; charset="UTF-8"

While it's described as errata for gen8/9, the previous reporting was from
2015 which predates those generations. I tested it on a gen 7 box (which
was causing me the grief of consuming my Xen console buffer). It could be
the case that the FPD code isn't implemented (which wouldn't matter for
gen8/9 because it is broken), and the original problem of faulty firmware
reporting bad ranges is the ultimate culprit. As far as the last two
questions, I was testing on an older version of Xen (4.9.x) and ported it
to master. Happy to hear a better approach to solving the original problem.

-Brendan

On Sun, Apr 19, 2020 at 11:28 PM Tian, Kevin <kevin.tian@intel.com> wrote:

> > From: Brendan Kerrigan <brendank310@gmail.com>
> > Sent: Friday, April 17, 2020 9:36 PM
> >
> > From: Brendan Kerrigan <kerriganb@ainfosec.com>
> >
> > The Intel graphics device records DMAR faults regardless
> > of the Fault Process Disable bit being set. When this fault
>
> Since this is an errata for specific generations, let's describe
> this way instead of stating it as a generic problem.
>
> > occurs, enable the Interrupt Mask (IM) bit in the Fault
> > Event Control (FECTL) register to prevent the continued
> > recording of the fault.
> >
> > Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
> > ---
> >  xen/drivers/passthrough/vtd/iommu.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/xen/drivers/passthrough/vtd/iommu.c
> > b/xen/drivers/passthrough/vtd/iommu.c
> > index 07d40b37fe..288399d816 100644
> > --- a/xen/drivers/passthrough/vtd/iommu.c
> > +++ b/xen/drivers/passthrough/vtd/iommu.c
> > @@ -41,6 +41,8 @@
> >  #include "vtd.h"
> >  #include "../ats.h"
> >
> > +#define IS_IGD(seg, id) (0 == seg && 0 == PCI_BUS(id) && 2 ==
> PCI_SLOT(id)
> > && 0 == PCI_FUNC(id))
> > +
> >  struct mapped_rmrr {
> >      struct list_head list;
> >      u64 base, end;
> > @@ -872,6 +874,13 @@ static int iommu_page_fault_do_one(struct
> > vtd_iommu *iommu, int type,
> >      printk(XENLOG_G_WARNING VTDPREFIX "%s: reason %02x - %s\n",
> >             kind, fault_reason, reason);
> >
> > +    if ( DMA_REMAP == fault_type && type && IS_IGD(seg, source_id) ) {
> > +        u32 fectl = dmar_readl(iommu->reg, DMAR_FECTL_REG);
> > +        fectl |= DMA_FECTL_IM;
> > +        dmar_writel(iommu->reg, DMAR_FECTL_REG, fectl);
> > +        printk(XENLOG_G_WARNING VTDPREFIX "Disabling DMAR faults for
> > IGD\n");
> > +    }
> > +
>
> Several questions. First, I just note that FPD is not touched by any code
> today. then how is this errata being caught? Second, we already have
> pci_check_disable_device in place which stops DMAs from the problematic
> device if it triggers excessive fault reports. why doesn't it work for your
> case? Last, dma_msi_end just forces clearing the mask bit at end of
> handling
> the fault interrupt, making above fix meaningless. Those questions just
> make me wonder how you actually test this patch and whether it's
> necessary...
>
> Thanks
> Kevin
>
> >      if ( iommu_verbose && fault_type == DMA_REMAP )
> >          print_vtd_entries(iommu, PCI_BUS(source_id),
> PCI_DEVFN2(source_id),
> >                            addr >> PAGE_SHIFT);
> > --
> > 2.17.1
>
>

--000000000000ff4c2205a3b8c467
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>While it&#39;s described as errata for gen8/9, the pr=
evious reporting was from 2015 which predates those generations. I tested i=
t on a gen 7 box (which was causing me the grief of consuming my Xen consol=
e buffer). It could be the case that the FPD code isn&#39;t implemented (wh=
ich wouldn&#39;t matter for gen8/9 because it is broken), and the original =
problem of faulty firmware reporting bad ranges is the ultimate culprit. As=
 far as the last two questions, I was testing on an older version of Xen (4=
.9.x) and ported it to master. Happy to hear a better approach to solving t=
he original problem.</div><div><br></div><div>-Brendan<br></div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Apr=
 19, 2020 at 11:28 PM Tian, Kevin &lt;<a href=3D"mailto:kevin.tian@intel.co=
m">kevin.tian@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">&gt; From: Brendan Kerrigan &lt;<a href=3D"mailto:br=
endank310@gmail.com" target=3D"_blank">brendank310@gmail.com</a>&gt;<br>
&gt; Sent: Friday, April 17, 2020 9:36 PM<br>
&gt; <br>
&gt; From: Brendan Kerrigan &lt;<a href=3D"mailto:kerriganb@ainfosec.com" t=
arget=3D"_blank">kerriganb@ainfosec.com</a>&gt;<br>
&gt; <br>
&gt; The Intel graphics device records DMAR faults regardless<br>
&gt; of the Fault Process Disable bit being set. When this fault<br>
<br>
Since this is an errata for specific generations, let&#39;s describe<br>
this way instead of stating it as a generic problem.<br>
<br>
&gt; occurs, enable the Interrupt Mask (IM) bit in the Fault<br>
&gt; Event Control (FECTL) register to prevent the continued<br>
&gt; recording of the fault.<br>
&gt; <br>
&gt; Signed-off-by: Brendan Kerrigan &lt;<a href=3D"mailto:kerriganb@ainfos=
ec.com" target=3D"_blank">kerriganb@ainfosec.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 xen/drivers/passthrough/vtd/iommu.c | 9 +++++++++<br>
&gt;=C2=A0 1 file changed, 9 insertions(+)<br>
&gt; <br>
&gt; diff --git a/xen/drivers/passthrough/vtd/iommu.c<br>
&gt; b/xen/drivers/passthrough/vtd/iommu.c<br>
&gt; index 07d40b37fe..288399d816 100644<br>
&gt; --- a/xen/drivers/passthrough/vtd/iommu.c<br>
&gt; +++ b/xen/drivers/passthrough/vtd/iommu.c<br>
&gt; @@ -41,6 +41,8 @@<br>
&gt;=C2=A0 #include &quot;vtd.h&quot;<br>
&gt;=C2=A0 #include &quot;../ats.h&quot;<br>
&gt; <br>
&gt; +#define IS_IGD(seg, id) (0 =3D=3D seg &amp;&amp; 0 =3D=3D PCI_BUS(id)=
 &amp;&amp; 2 =3D=3D PCI_SLOT(id)<br>
&gt; &amp;&amp; 0 =3D=3D PCI_FUNC(id))<br>
&gt; +<br>
&gt;=C2=A0 struct mapped_rmrr {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct list_head list;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 u64 base, end;<br>
&gt; @@ -872,6 +874,13 @@ static int iommu_page_fault_do_one(struct<br>
&gt; vtd_iommu *iommu, int type,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 printk(XENLOG_G_WARNING VTDPREFIX &quot;%s: reason=
 %02x - %s\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kind, fault_reason, rea=
son);<br>
&gt; <br>
&gt; +=C2=A0 =C2=A0 if ( DMA_REMAP =3D=3D fault_type &amp;&amp; type &amp;&=
amp; IS_IGD(seg, source_id) ) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 fectl =3D dmar_readl(iommu-&gt;reg, D=
MAR_FECTL_REG);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fectl |=3D DMA_FECTL_IM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dmar_writel(iommu-&gt;reg, DMAR_FECTL_REG=
, fectl);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(XENLOG_G_WARNING VTDPREFIX &quot;D=
isabling DMAR faults for<br>
&gt; IGD\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
<br>
Several questions. First, I just note that FPD is not touched by any code<b=
r>
today. then how is this errata being caught? Second, we already have<br>
pci_check_disable_device in place which stops DMAs from the problematic<br>
device if it triggers excessive fault reports. why doesn&#39;t it work for =
your<br>
case? Last, dma_msi_end just forces clearing the mask bit at end of handlin=
g<br>
the fault interrupt, making above fix meaningless. Those questions just<br>
make me wonder how you actually test this patch and whether it&#39;s necess=
ary...<br>
<br>
Thanks<br>
Kevin<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ( iommu_verbose &amp;&amp; fault_type =3D=3D DM=
A_REMAP )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print_vtd_entries(iommu, PCI_BUS(sou=
rce_id), PCI_DEVFN2(source_id),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr &gt;&gt; PAGE_SHIFT);<br>
&gt; --<br>
&gt; 2.17.1<br>
<br>
</blockquote></div>

--000000000000ff4c2205a3b8c467--

