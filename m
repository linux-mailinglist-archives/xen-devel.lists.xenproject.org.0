Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0FD86DEB
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 01:34:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvrtN-00054g-7a; Thu, 08 Aug 2019 23:32:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u8RY=WE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hvrtL-00054b-V9
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 23:32:20 +0000
X-Inumbo-ID: c213ccd2-ba34-11e9-8980-bc764e045a96
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c213ccd2-ba34-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 23:32:17 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id t16so6389508wra.6
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2019 16:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uzRaHhqqWxYZN1Nsm/5INUgwcw/eyGAMZvXuUlBK+AI=;
 b=r/yKLtu7ZVNGSCkjPPvnBduAbZuPvgeLhw3CAz7MoAxzbyPOsq0v1/gS5Iy3m5KHr0
 bzozfT1D9/z0JzjbACPa8usLRAvaAkOrf8ycBRM5FwpWgizge8iEifxjgEhnVhcMvaSt
 6a2euI4F69N2ROAijtyT4xVucFrCpMVMpU18p9PH+axocBWj7JNbm3mHlnqhDu2L7GT3
 xGDW0oLA/Z9XSaSqPX5Z/QeJTgX2eYwxD5QEOCkJ6oeb4DYmh52THl5+z9inraNAd0/X
 /FH3T/fqj+NetfWilWD6N1SZUpnvUtuDFWqT0Lg+kXR1A2MobTUkEz/APi3y636ZS33L
 ggRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uzRaHhqqWxYZN1Nsm/5INUgwcw/eyGAMZvXuUlBK+AI=;
 b=DqRy0ANtcAHXGA9Idr5336jIGJSFgguLIZiXx/ATtebJ6Jwr9JjJ5HY3YTFSdoFLDS
 fo7mejwXs+dXv26DsrbedF3Yspk4qi20PF697i+5TNwXh3QJcEvbKqITS98SLGTTYQqy
 CYA9oHKxVrtN77rFL29yFqfdSNnHRSIAUFF0fkybbW7P1H6vyzvJkO6iVg1Fb6XUxfeh
 pDFKaZ58gH+85nzaCrJ1ls6e02yDbG69KWkopopgPH67jXdmwTVObluJrLPTklXpocEw
 qlac3O9oD6ocFpTSB3F0eWWzlAvdWNKOf2ZQno6W9GZMI0c61053vaAw/daXHU34ulAK
 1BiA==
X-Gm-Message-State: APjAAAVEHW1jxAnD2+sLME7DA1+YNSwDqeHsMroESz/2V/O1iDByNBte
 T9Dz+K8I7agasi57spucRDUuDg/JMm6vWU4cgLc=
X-Google-Smtp-Source: APXvYqyhRUgs1cG80TDjQ13mCtdvjTzAHarVbOiLuOyYYZctYrxnaaY9mMWqzO6BT8UGP8PIMyBXbeRL/MXNu432HeY=
X-Received: by 2002:adf:ca0f:: with SMTP id o15mr19827747wrh.135.1565307136308; 
 Thu, 08 Aug 2019 16:32:16 -0700 (PDT)
MIME-Version: 1.0
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-7-git-send-email-olekstysh@gmail.com>
 <OSBPR01MB453664F7A6D6AA717761BC07D8D40@OSBPR01MB4536.jpnprd01.prod.outlook.com>
 <a49eccf6-935c-c87a-1fcc-fdc12a67d58e@gmail.com>
 <42cc28a7-5ab3-e24f-16d3-7a287f7f14e8@arm.com>
 <CAPD2p-kJe6=YZ_rPrdDpay-u+r3GDPp58LpxqLpBg0oN_3W1-g@mail.gmail.com>
 <7cecce50-31e9-0e3f-d41c-a051ea6f9971@arm.com>
 <11de4dee-2d2f-2578-57ae-4313c985e645@gmail.com>
 <03b1bac9-40ca-3bd4-d3fa-a4acc4e9e958@arm.com>
 <e2af5e18-2a95-0880-4acc-492848800b19@gmail.com>
 <cefcad8a-b6a5-9caa-0102-72951f9fcb7e@arm.com>
 <862f74f1-2039-8737-6d71-fe3fc07a06ff@gmail.com>
 <8d38df29-7314-02a8-94d7-5e317c8ea442@arm.com>
In-Reply-To: <8d38df29-7314-02a8-94d7-5e317c8ea442@arm.com>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Fri, 9 Aug 2019 02:32:04 +0300
Message-ID: <CAPD2p-nv27=4RH5RVMyzBdAfTXeSArW3nvKEydhKWgm-mRoBmg@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] [PATCH V2 6/6] iommu/arm: Add Renesas IPMMU-VMSA
 support
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
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: multipart/mixed; boundary="===============7403216060190056130=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7403216060190056130==
Content-Type: multipart/alternative; boundary="000000000000d2fd36058fa3772b"

--000000000000d2fd36058fa3772b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien.

Sorry for the possible format issues.

=D1=87=D1=82, 8 =D0=B0=D0=B2=D0=B3. 2019 =D0=B3., 23:32 Julien Grall <julie=
n.grall@arm.com>:

> Hi Oleksandr,
>
> On 8/8/19 8:29 PM, Oleksandr wrote:
> >>>>>>
> >>>>>>> Sorry for the possible format issues.
> >>>>>>>
> >>>>>>>
> >>>>>>>      > No, it is not disabled. But, ipmmu_irq() uses another
> >>>>>>> mmu->lock. So, I
> >>>>>>>      > think, there won't be a deadlock.
> >>>>>>>      >
> >>>>>>>      > Or I really missed something?
> >>>>>>>      >
> >>>>>>>      > If we worry about ipmmu_tlb_invalidate() which is called
> >>>>>>> here (to
> >>>>>>>      > perform a flush by request from P2M code, which manages a
> >>>>>>> page table)
> >>>>>>>      > and from the irq handler (to perform a flush to resume
> >>>>>>> address
> >>>>>>>      > translation), I could use a tasklet to schedule
> >>>>>>> ipmmu_tlb_invalidate()
> >>>>>>>      > from the irq handler then. This way we would get this
> >>>>>>> serialized. What
> >>>>>>>      > do you think?
> >>>>>>>
> >>>>>>>     I am afraid a tasklet is not an option. You need to perform
> >>>>>>> the TLB
> >>>>>>>     flush when requested otherwise you are introducing a security
> >>>>>>> issue.
> >>>>>>>
> >>>>>>>     This is because as soon as a region is unmapped in the page
> >>>>>>> table, we
> >>>>>>>     remove the drop the reference on any page backing that
> >>>>>>> region. When the
> >>>>>>>     reference is dropped to zero, the page can be reallocated to
> >>>>>>> another
> >>>>>>>     domain or even Xen. If the TLB flush happen after, then the
> >>>>>>> guest may
> >>>>>>>     still be able to access the page for a short time if the
> >>>>>>> translation has
> >>>>>>>     been cached by the any TLB (IOMMU, Processor).
> >>>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>> I understand this. I am not proposing to delay a requested by P2M
> >>>>>>> code TLB flush in any case. I just propose to issue TLB flush
> >>>>>>> (which we have to perform in case of page faults, to resolve
> >>>>>>> error condition and resume translations) from a tasklet rather
> >>>>>>> than from interrupt handler directly. This is the TLB flush I am
> >>>>>>> speaking about:
> >>>>>>>
> >>>>>>>
> https://github.com/otyshchenko1/xen/blob/ipmmu_upstream2/xen/drivers/pass=
through/arm/ipmmu-vmsa.c#L598
> >>>>>>>
> >>>>>>>
> >>>>>>> Sorry if I was unclear.
> >>>>>>
> >>>>>> My mistake, I misread what you wrote.
> >>>>>>
> >>>>>> I found the flush in the renesas-bsp and not Linux upstream but it
> >>>>>> is not clear why this is actually required. You are not fixing any
> >>>>>> translation error. So what this flush will do?
> >>>>>>
> >>>>>> Regarding the placement of the flush, then if you execute in a
> >>>>>> tasklet it will likely be done later on when the IRQ has been
> >>>>>> acknowledge. What's the implication to delay it?
> >>>>>
> >>>>>
> >>>>> Looks like, there is no need to put this flush into a tasklet. As I
> >>>>> understand from Shimoda-san's answer it is OK to call flush here.
> >>>>>
> >>>>> So, my worry about calling ipmmu_tlb_invalidate() directly from the
> >>>>> interrupt handler is not actual anymore.
> >>>>> ----------
> >>>>> This is my understanding regarding the flush purpose here. This
> >>>>> code, just follows the TRM, no more no less,
> >>>>> which mentions about a need to flush TLB after clearing error
> >>>>> status register and updating a page table entries (which, I assume,
> >>>>> means to resolve a reason why translation/page fault error actually
> >>>>> have happened) to resume address translation request.
> >>>>
> >>>> Well, I don't have the TRM... so my point of reference is Linux. Why
> >>>> does upstream not do the TLB flush?
> >>>
> >>> I have no idea regarding that. >
> >>>
> >>>>
> >>>>
> >>>> I have been told this is an errata on the IPMMU. Is it related to
> >>>> the series posted on linux-iommu [1]?
> >>>
> >>> I don't think, the TLB flush we are speaking about, is related to
> >>> that series [1] somehow. This TLB flush, I think, is just the last
> >>> step in a sequence of actions which should be performed when the
> >>> error occurs, no more no less. This is how I understand this.
> >>
> >> If you have to flush the TLBs in the IRQ context then something has
> >> gone really wrong.
> >>
> >> I don't deny that Break-Before-Make is an issue. However, if it is
> >> handled correctly in the P2M code. You should only be there because
> >> there are no mapping in the TLBs for the address accessed. So flushing
> >> the TLBs should be unnecessary, unless your TLB is also caching
> >> invalid entry?
> >
> > Sorry, I don't quite understand why we need to worry about this flush
> > too much for a case which won't occur in normal condition (if everythin=
g
> > is correct). Why we can't just consider this flush as a required action=
,
>
> A translation error can be easy to reach. For instance if the guest does
> not program the Device correctly and request to access an address that
> is not mapped.
>

Yes, I understand these bits. But, I wrote that error wouldn't occur in
normal condition (if everything was correct).



>
>
> > which needed to exit from the error state and resume stopped address
> > translation request. The same required action as "clearing error status
> > flags" before. We are not trying to understand, why is it so necessary
> > to clear error flags when error happens, or can we end up without
> > clearing it, for example. We just follow what described in document. Th=
e
> > same, I think, we have for that flush, if described, then should be
> > followed. Looks like this flush acts as a trigger to unblock stopped
> > transaction in that particular case.
>
> What will actually happen if the transaction fail again? For instance,
> if the IOVA was not mapped. Will you receive the interrupt again?
> If so, are you going to make the flush again and again until the guest
> is killed?
>

This is a good question. I think, if address is not mapped, the transaction
will fail again and we will get the interrupt again. Not sure, until the
guest is killed or until the driver in the guest detects timeout and
cancels DMA. Let's consider the worst case, until the guest is killed.

So my questions are what do you think would be the proper driver's behavior
in that case? Do nothing and don't even try to resolve error
condition/unblock translation at the first page fault, or give it a few
attempts, or unblock every time. How does the SMMU driver act in such
situation?

Quite clear, if we get a fault, then address is not mapped. I think, it can
be both: by issuing wrong address (baggy driver, malicious driver) or by
race (unlikely). If this is the real race (device hits brake-before-make,
for example), we could give it another attempt, for example. Looks like we
need some mechanism to deploy faulted address to P2M code (which manages
page table) to analyze? Or it is not worth doing that?


> >
> > Different H/W could have different restoring sequences. Some H/W
> > requires just clearing error status, other H/W requires full
> > re-initialization in a specific order to recover from the error state.
> >
> > Please correct me if I am wrong.
>
> I am not confident to accept any code that I don't understand or I don't
> find sensible. As I pointed out in my previous e-mail, this hasn't
> reached upstream so something looks quite fishy here.
>
>
As I answered in previous e-mail, I hope, we will be able to clarify a
reason why this hasn't reached upstream.

>

--000000000000d2fd36058fa3772b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Julien.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Sorry for the possible format issues.<br><br><div class=3D"gmail_=
quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">=D1=87=D1=82, 8 =
=D0=B0=D0=B2=D0=B3. 2019 =D0=B3., 23:32 Julien Grall &lt;<a href=3D"mailto:=
julien.grall@arm.com">julien.grall@arm.com</a>&gt;:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">Hi Oleksandr,<br>
<br>
On 8/8/19 8:29 PM, Oleksandr wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Sorry for the possible format issues.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; No, it is not di=
sabled. But, ipmmu_irq() uses another <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; mmu-&gt;lock. So, I<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; think, there won=
&#39;t be a deadlock.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; Or I really miss=
ed something?<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; If we worry abou=
t ipmmu_tlb_invalidate() which is called <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; here (to<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; perform a flush =
by request from P2M code, which manages a <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; page table)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; and from the irq=
 handler (to perform a flush to resume <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; address<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; translation), I =
could use a tasklet to schedule <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; ipmmu_tlb_invalidate()<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; from the irq han=
dler then. This way we would get this <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; serialized. What<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; do you think?<br=
>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 I am afraid a tasklet is no=
t an option. You need to perform <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; the TLB<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 flush when requested otherw=
ise you are introducing a security <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; issue.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 This is because as soon as =
a region is unmapped in the page <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; table, we<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 remove the drop the referen=
ce on any page backing that <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; region. When the<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 reference is dropped to zer=
o, the page can be reallocated to <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; another<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 domain or even Xen. If the =
TLB flush happen after, then the <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; guest may<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 still be able to access the=
 page for a short time if the <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; translation has<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 been cached by the any TLB =
(IOMMU, Processor).<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; I understand this. I=C2=A0am not proposing to =
delay a requested by P2M <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; code TLB flush in any case. I just propose to =
issue TLB flush <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; (which we have to perform in case of page faul=
ts, to resolve <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; error condition and resume translations) from =
a tasklet rather <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; than from interrupt handler directly. This is =
the TLB flush I am <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; speaking about:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"https://github.com/otyshchenko1/xen=
/blob/ipmmu_upstream2/xen/drivers/passthrough/arm/ipmmu-vmsa.c#L598" rel=3D=
"noreferrer noreferrer" target=3D"_blank">https://github.com/otyshchenko1/x=
en/blob/ipmmu_upstream2/xen/drivers/passthrough/arm/ipmmu-vmsa.c#L598</a> <=
br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Sorry if I was unclear.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; My mistake, I misread what you wrote.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; I found the flush in the renesas-bsp and not Linux=
 upstream but it <br>
&gt;&gt;&gt;&gt;&gt;&gt; is not clear why this is actually required. You ar=
e not fixing any <br>
&gt;&gt;&gt;&gt;&gt;&gt; translation error. So what this flush will do?<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Regarding the placement of the flush, then if you =
execute in a <br>
&gt;&gt;&gt;&gt;&gt;&gt; tasklet it will likely be done later on when the I=
RQ has been <br>
&gt;&gt;&gt;&gt;&gt;&gt; acknowledge. What&#39;s the implication to delay i=
t?<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Looks like, there is no need to put this flush into a =
tasklet. As I <br>
&gt;&gt;&gt;&gt;&gt; understand from Shimoda-san&#39;s answer it is OK to c=
all flush here.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; So, my worry about calling ipmmu_tlb_invalidate() dire=
ctly from the <br>
&gt;&gt;&gt;&gt;&gt; interrupt handler is not actual anymore.<br>
&gt;&gt;&gt;&gt;&gt; ----------<br>
&gt;&gt;&gt;&gt;&gt; This is my understanding regarding the flush purpose h=
ere. This <br>
&gt;&gt;&gt;&gt;&gt; code, just follows the TRM, no more no less,<br>
&gt;&gt;&gt;&gt;&gt; which mentions about a need to flush TLB after clearin=
g error <br>
&gt;&gt;&gt;&gt;&gt; status register and updating a page table entries (whi=
ch, I assume, <br>
&gt;&gt;&gt;&gt;&gt; means to resolve a reason why translation/page fault e=
rror actually <br>
&gt;&gt;&gt;&gt;&gt; have happened) to resume address translation request.<=
br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Well, I don&#39;t have the TRM... so my point of reference=
 is Linux. Why <br>
&gt;&gt;&gt;&gt; does upstream not do the TLB flush?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I have no idea regarding that. &gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I have been told this is an errata on the IPMMU. Is it rel=
ated to <br>
&gt;&gt;&gt;&gt; the series posted on linux-iommu [1]?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I don&#39;t think, the TLB flush we are speaking about, is rel=
ated to <br>
&gt;&gt;&gt; that series [1] somehow. This TLB flush, I think, is just the =
last <br>
&gt;&gt;&gt; step in a sequence of actions which should be performed when t=
he <br>
&gt;&gt;&gt; error occurs, no more no less. This is how I understand this.<=
br>
&gt;&gt;<br>
&gt;&gt; If you have to flush the TLBs in the IRQ context then something ha=
s <br>
&gt;&gt; gone really wrong.<br>
&gt;&gt;<br>
&gt;&gt; I don&#39;t deny that Break-Before-Make is an issue. However, if i=
t is <br>
&gt;&gt; handled correctly in the P2M code. You should only be there becaus=
e <br>
&gt;&gt; there are no mapping in the TLBs for the address accessed. So flus=
hing <br>
&gt;&gt; the TLBs should be unnecessary, unless your TLB is also caching <b=
r>
&gt;&gt; invalid entry?<br>
&gt; <br>
&gt; Sorry, I don&#39;t quite understand why we need to worry about this fl=
ush <br>
&gt; too much for a case which won&#39;t occur in normal condition (if ever=
ything <br>
&gt; is correct). Why we can&#39;t just consider this flush as a required a=
ction, <br>
<br>
A translation error can be easy to reach. For instance if the guest does <b=
r>
not program the Device correctly and request to access an address that <br>
is not mapped.<br></blockquote></div></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto"><div class=3D"gmail_quote" dir=3D"auto"><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"></blockquote></div></div><div dir=3D"auto">Yes, I understand thes=
e bits. But, I wrote that error wouldn&#39;t occur in normal condition (if =
everything was correct).</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
><br></div><div dir=3D"auto"><div class=3D"gmail_quote" dir=3D"auto"><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><br><br><br>
&gt; which needed to exit from the error state and resume stopped address <=
br>
&gt; translation request. The same required action as &quot;clearing error =
status <br>
&gt; flags&quot; before. We are not trying to understand, why is it so nece=
ssary <br>
&gt; to clear error flags when error happens, or can we end up without <br>
&gt; clearing it, for example. We just follow what described in document. T=
he <br>
&gt; same, I think, we have for that flush, if described, then should be <b=
r>
&gt; followed. Looks like this flush acts as a trigger to unblock stopped <=
br>
&gt; transaction in that particular case.<br>
<br>
What will actually happen if the transaction fail again? For instance, <br>
if the IOVA was not mapped. Will you receive the interrupt again?<br>
If so, are you going to make the flush again and again until the guest <br>
is killed?<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div class=3D"gmail_quote" dir=3D"auto"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"></blockquote></div></div><div dir=3D"auto">This is a good question. I=
 think, if address is not mapped, the transaction will fail again and we wi=
ll get the interrupt again. Not sure, until the guest is killed or until th=
e driver in the guest detects timeout and cancels DMA. Let&#39;s consider t=
he worst case, until the guest is killed.</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">So my questions are what do you think would be the proper=
 driver&#39;s behavior in that case? Do nothing and don&#39;t even try to r=
esolve error condition/unblock translation at the first page fault, or give=
 it a few attempts, or unblock every time. How does the SMMU driver act in =
such situation?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Quite cl=
ear, if we get a fault, then address is not mapped. I think, it can be both=
: by issuing wrong address (baggy driver, malicious driver) or by race (unl=
ikely). If this is the real race (device hits brake-before-make, for exampl=
e), we could give it another attempt, for example. Looks like we need some =
mechanism to deploy faulted address to P2M code (which manages page table) =
to analyze? Or it is not worth doing that?</div><div dir=3D"auto"><br></div=
><div dir=3D"auto"><div class=3D"gmail_quote" dir=3D"auto"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">
<br>
&gt; <br>
&gt; Different H/W could have different restoring sequences. Some H/W <br>
&gt; requires just clearing error status, other H/W requires full <br>
&gt; re-initialization in a specific order to recover from the error state.=
<br>
&gt; <br>
&gt; Please correct me if I am wrong.<br>
<br>
I am not confident to accept any code that I don&#39;t understand or I don&=
#39;t <br>
find sensible. As I pointed out in my previous e-mail, this hasn&#39;t <br>
reached upstream so something looks quite fishy here.<br><br></blockquote><=
/div></div><div dir=3D"auto"><br></div><div dir=3D"auto">As I answered in p=
revious e-mail, I hope, we will be able to clarify a reason why this hasn&#=
39;t reached upstream.</div><div dir=3D"auto"><div class=3D"gmail_quote" di=
r=3D"auto"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000d2fd36058fa3772b--


--===============7403216060190056130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7403216060190056130==--

