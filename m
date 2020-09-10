Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C87B264CB1
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 20:20:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGRB4-0002Le-QH; Thu, 10 Sep 2020 18:20:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQLO=CT=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kGRB3-0002LZ-61
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 18:20:09 +0000
X-Inumbo-ID: 0303c03f-13dd-470d-bb1c-2891fd2d33d0
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0303c03f-13dd-470d-bb1c-2891fd2d33d0;
 Thu, 10 Sep 2020 18:20:07 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id m6so7956275wrn.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2020 11:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z7iR4EU3xEqUUdi0EQsJCd3CrJMczoiMmZvVKOsKuos=;
 b=s9Wx5iz/No6KUOl1Hbu8FjA02tRWXFdvN12OQCKzIUPv3hUt4g70DUk14Xiw7KFeEK
 XrpDL3bW0USz9qQrGdKedqLDXH+0jusNdnqXVbmDpu3P8Cezvlub+62QITX3Lq1I5F6O
 119tKd1olR9vw38HWlHdqP6M5J41nE7bonxMX50Og4zVja3g6t3MARdBFqfab5bNySS+
 USTj6m8nvEIi0ryOaSUlnNGa+mwCpkKfNW3PC49iAx0q/cSwsAYW3epozI2GzWFAx8an
 VX1hqiDZZgSLq9SeQnYR5D9o3eapAxKIy2LNe39QDXmxFWwCEAfWB8oYKqcA5W4tg7zx
 OlqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z7iR4EU3xEqUUdi0EQsJCd3CrJMczoiMmZvVKOsKuos=;
 b=i/IhM6ZgYuHtR8UBfdx5mBtktM3nSUGpqmlkXoC+Wys28dLk/wriqPg5qjyyymGIl+
 6aDH05SMRSgdmTOmEJxml8rHq+0YsAvD7SeQf2srCf/GQ/p/ix+R8gL+RzXvwT6SXe8c
 eUoXar5/19S89T8RJSbtyIxh10WtFWpSi3BRwx3vsI1mAAweLW8zQqrTL7V+HIxdstnm
 aoYnR+uJbk21/05y/ZJXB0T8A7jL7VMHnU2FT0Q3LTQNyZiPTE12PfaxlauvEbK/WNYb
 lBlusiPICZJkWBQuR8A8po76Y2gnzmgHKbi2xFRZFGB0DYfhNmKnkUGkmUklkAFr00wM
 fkUQ==
X-Gm-Message-State: AOAM533qIE/ob5mDIpavwBzhEEhRjJ5oQSfcH3ahQRr88NGi/2ynMS7p
 EN3JyrmqaP9ABuR+CpueXmmJQnirv01htc0gJvs=
X-Google-Smtp-Source: ABdhPJxScws3jJRDEbaR6dbYrjwOB1VdIUZ/msHqtIPF7qSxGVNhjx+JFqR9VzMHmwFvQBW5T2vQnK+/VriTnZ+h2EE=
X-Received: by 2002:a5d:4603:: with SMTP id t3mr9924014wrq.424.1599762006947; 
 Thu, 10 Sep 2020 11:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200910145007.14107-1-paul@xen.org>
 <20200910145007.14107-5-paul@xen.org>
 <797DD1A2-60EB-455C-943D-C515881A69CC@arm.com>
 <C9ADFBE4-D7C7-43EC-9F33-D658548CE98D@arm.com>
 <88fc2079ec3f452db02fb4148b69240a@EX13D32EUC003.ant.amazon.com>
In-Reply-To: <88fc2079ec3f452db02fb4148b69240a@EX13D32EUC003.ant.amazon.com>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Thu, 10 Sep 2020 21:19:56 +0300
Message-ID: <CAPD2p-nop-LF4-c9DDBaG6R1c7ZknPODdjsDeyg2opNN9KTQTQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/8] iommu: make map and unmap take a page count,
 similar to flush
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Paul Durrant <paul@xen.org>, 
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, 
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Content-Type: multipart/alternative; boundary="000000000000263ce405aef99e78"
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--000000000000263ce405aef99e78
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2020 at 8:49 PM Durrant, Paul <pdurrant@amazon.co.uk> wrote=
:

Hi Paul

[sorry for the possible format issue]

> -----Original Message-----
> > From: Bertrand Marquis <Bertrand.Marquis@arm.com>
> > Sent: 10 September 2020 17:46
> > To: Paul Durrant <paul@xen.org>
> > Cc: open list:X86 <xen-devel@lists.xenproject.org>; Durrant, Paul <
> pdurrant@amazon.co.uk>; Jan Beulich
> > <jbeulich@suse.com>; Andrew Cooper <andrew.cooper3@citrix.com>; Wei Liu
> <wl@xen.org>; Roger Pau Monn=C3=A9
> > <roger.pau@citrix.com>; George Dunlap <george.dunlap@citrix.com>; Ian
> Jackson
> > <ian.jackson@eu.citrix.com>; Julien Grall <julien@xen.org>; Stefano
> Stabellini
> > <sstabellini@kernel.org>; Jun Nakajima <jun.nakajima@intel.com>; Kevin
> Tian <kevin.tian@intel.com>
> > Subject: RE: [EXTERNAL] [PATCH v6 4/8] iommu: make map and unmap take a
> page count, similar to flush
> >
> > CAUTION: This email originated from outside of the organization. Do not
> click links or open
> > attachments unless you can confirm the sender and know the content is
> safe.
> >
> >
> >
> > >> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> > >> index 1831dc66b0..13f68dc93d 100644
> > >> --- a/xen/include/xen/iommu.h
> > >> +++ b/xen/include/xen/iommu.h
> > >> @@ -146,23 +146,23 @@ enum
> > >> #define IOMMU_FLUSHF_modified (1u << _IOMMU_FLUSHF_modified)
> > >>
> > >> int __must_check iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
> > >> -                           unsigned int page_order, unsigned int
> flags,
> > >> +                           unsigned long page_count, unsigned int
> flags,
> > >>                           unsigned int *flush_flags);
> > >> int __must_check iommu_unmap(struct domain *d, dfn_t dfn,
> > >> -                             unsigned int page_order,
> > >> +                             unsigned long page_count,
> > >>                             unsigned int *flush_flags);
> > >>
> > >> int __must_check iommu_legacy_map(struct domain *d, dfn_t dfn, mfn_t
> mfn,
> > >> -                                  unsigned int page_order,
> > >> +                                  unsigned long page_count,
> > >>                                  unsigned int flags);
> > >> int __must_check iommu_legacy_unmap(struct domain *d, dfn_t dfn,
> > >> -                                    unsigned int page_order);
> > >> +                                    unsigned long page_count);
> > >>
> > >> int __must_check iommu_lookup_page(struct domain *d, dfn_t dfn, mfn_=
t
> *mfn,
> > >>                                   unsigned int *flags);
> > >>
> > >> int __must_check iommu_iotlb_flush(struct domain *d, dfn_t dfn,
> > >> -                                   unsigned int page_count,
> > >> +                                   unsigned long page_count,
> > >>                                   unsigned int flush_flags);
> > >> int __must_check iommu_iotlb_flush_all(struct domain *d,
> > >>                                       unsigned int flush_flags);
> > >> @@ -281,7 +281,7 @@ struct iommu_ops {
> > >>    void (*share_p2m)(struct domain *d);
> > >>    void (*crash_shutdown)(void);
> > >>    int __must_check (*iotlb_flush)(struct domain *d, dfn_t dfn,
> > >> -                                    unsigned int page_count,
> > >> +                                    unsigned long page_count,
> > >
> > > This change will require to change the arm smmu code to have the righ=
t
> type for page count:
> > > xen/drivers/passthrough/smmu.c:2536
> > > static int __must_check arm_smmu_iotlb_flush(struct domain *d, dfn_t
> dfn,
> > >                         unsigned int page_count,
> > >                         unsigned int flush_flags)
> > >
> > > Otherwise compilation is failing for arm.
> > >
> > > With that fixed i could compile and start an arm system with the
> complete serie (but not one with an
> > arm SMMU).
> >
> > I should have specified because my test system right now does not have
> an SMMUv1.
> >
>
> Thanks for spotting that; I did run a cross compilation on arm a while ag=
o
> so not sure how I managed to miss this. Will fix and send v7.
>


 Probably ipmmu_iotlb_flush() in ipmmu-vmsa.c needs the same update as well
(I don't have the possibility to apply your series and re-check)? Please
note, it is still under CONFIG_EXPERT.

--=20
Regards,

Oleksandr Tyshchenko

--000000000000263ce405aef99e78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 10, 2020 at 8:49 PM Durra=
nt, Paul &lt;<a href=3D"mailto:pdurrant@amazon.co.uk">pdurrant@amazon.co.uk=
</a>&gt; wrote:<br></div><div dir=3D"ltr" class=3D"gmail_attr"><br></div><d=
iv class=3D"gmail_attr">Hi Paul</div><div class=3D"gmail_attr"><br></div><d=
iv class=3D"gmail_attr">[sorry for the possible format issue]</div><div dir=
=3D"ltr" class=3D"gmail_attr"><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">&gt; -----Original Message-----<br>
&gt; From: Bertrand Marquis &lt;<a href=3D"mailto:Bertrand.Marquis@arm.com"=
 target=3D"_blank">Bertrand.Marquis@arm.com</a>&gt;<br>
&gt; Sent: 10 September 2020 17:46<br>
&gt; To: Paul Durrant &lt;<a href=3D"mailto:paul@xen.org" target=3D"_blank"=
>paul@xen.org</a>&gt;<br>
&gt; Cc: open list:X86 &lt;<a href=3D"mailto:xen-devel@lists.xenproject.org=
" target=3D"_blank">xen-devel@lists.xenproject.org</a>&gt;; Durrant, Paul &=
lt;<a href=3D"mailto:pdurrant@amazon.co.uk" target=3D"_blank">pdurrant@amaz=
on.co.uk</a>&gt;; Jan Beulich<br>
&gt; &lt;<a href=3D"mailto:jbeulich@suse.com" target=3D"_blank">jbeulich@su=
se.com</a>&gt;; Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.c=
om" target=3D"_blank">andrew.cooper3@citrix.com</a>&gt;; Wei Liu &lt;<a hre=
f=3D"mailto:wl@xen.org" target=3D"_blank">wl@xen.org</a>&gt;; Roger Pau Mon=
n=C3=A9<br>
&gt; &lt;<a href=3D"mailto:roger.pau@citrix.com" target=3D"_blank">roger.pa=
u@citrix.com</a>&gt;; George Dunlap &lt;<a href=3D"mailto:george.dunlap@cit=
rix.com" target=3D"_blank">george.dunlap@citrix.com</a>&gt;; Ian Jackson<br=
>
&gt; &lt;<a href=3D"mailto:ian.jackson@eu.citrix.com" target=3D"_blank">ian=
.jackson@eu.citrix.com</a>&gt;; Julien Grall &lt;<a href=3D"mailto:julien@x=
en.org" target=3D"_blank">julien@xen.org</a>&gt;; Stefano Stabellini<br>
&gt; &lt;<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabe=
llini@kernel.org</a>&gt;; Jun Nakajima &lt;<a href=3D"mailto:jun.nakajima@i=
ntel.com" target=3D"_blank">jun.nakajima@intel.com</a>&gt;; Kevin Tian &lt;=
<a href=3D"mailto:kevin.tian@intel.com" target=3D"_blank">kevin.tian@intel.=
com</a>&gt;<br>
&gt; Subject: RE: [EXTERNAL] [PATCH v6 4/8] iommu: make map and unmap take =
a page count, similar to flush<br>
&gt; <br>
&gt; CAUTION: This email originated from outside of the organization. Do no=
t click links or open<br>
&gt; attachments unless you can confirm the sender and know the content is =
safe.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; &gt;&gt; diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.=
h<br>
&gt; &gt;&gt; index 1831dc66b0..13f68dc93d 100644<br>
&gt; &gt;&gt; --- a/xen/include/xen/iommu.h<br>
&gt; &gt;&gt; +++ b/xen/include/xen/iommu.h<br>
&gt; &gt;&gt; @@ -146,23 +146,23 @@ enum<br>
&gt; &gt;&gt; #define IOMMU_FLUSHF_modified (1u &lt;&lt; _IOMMU_FLUSHF_modi=
fied)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; int __must_check iommu_map(struct domain *d, dfn_t dfn, mfn_t=
 mfn,<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int page_order, unsigned int=
 flags,<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long page_count, unsigned in=
t flags,<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int *flush_flags);<br>
&gt; &gt;&gt; int __must_check iommu_unmap(struct domain *d, dfn_t dfn,<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int page_order,<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long page_count,<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int *flush_flags);<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; int __must_check iommu_legacy_map(struct domain *d, dfn_t dfn=
, mfn_t mfn,<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int pa=
ge_order,<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long p=
age_count,<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int flags=
);<br>
&gt; &gt;&gt; int __must_check iommu_legacy_unmap(struct domain *d, dfn_t d=
fn,<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned=
 int page_order);<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned=
 long page_count);<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; int __must_check iommu_lookup_page(struct domain *d, dfn_t df=
n, mfn_t *mfn,<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int=
 *flags);<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; int __must_check iommu_iotlb_flush(struct domain *d, dfn_t df=
n,<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned =
int page_count,<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned =
long page_count,<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int=
 flush_flags);<br>
&gt; &gt;&gt; int __must_check iommu_iotlb_flush_all(struct domain *d,<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0unsigned int flush_flags);<br>
&gt; &gt;&gt; @@ -281,7 +281,7 @@ struct iommu_ops {<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 void (*share_p2m)(struct domain *d);<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 void (*crash_shutdown)(void);<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 int __must_check (*iotlb_flush)(struct domain *d=
, dfn_t dfn,<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned=
 int page_count,<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned=
 long page_count,<br>
&gt; &gt;<br>
&gt; &gt; This change will require to change the arm smmu code to have the =
right type for page count:<br>
&gt; &gt; xen/drivers/passthrough/smmu.c:2536<br>
&gt; &gt; static int __must_check arm_smmu_iotlb_flush(struct domain *d, df=
n_t dfn,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0unsigned int page_count,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0unsigned int flush_flags)<br>
&gt; &gt;<br>
&gt; &gt; Otherwise compilation is failing for arm.<br>
&gt; &gt;<br>
&gt; &gt; With that fixed i could compile and start an arm system with the =
complete serie (but not one with an<br>
&gt; arm SMMU).<br>
&gt; <br>
&gt; I should have specified because my test system right now does not have=
 an SMMUv1.<br>
&gt; <br>
<br>
Thanks for spotting that; I did run a cross compilation on arm a while ago =
so not sure how I managed to miss this. Will fix and send v7.<br></blockquo=
te><div><br></div><div><br></div></div>=C2=A0Probably ipmmu_iotlb_flush() i=
n ipmmu-vmsa.c needs the same update as well (I don&#39;t have the possibil=
ity to apply your series and re-check)? Please note, it is still under CONF=
IG_EXPERT.<br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr" class=3D=
"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"l=
tr"><span style=3D"background-color:rgb(255,255,255)"><font size=3D"2"><spa=
n style=3D"color:rgb(51,51,51);font-family:Arial,sans-serif">Regards,</span=
></font></span></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div><span=
 style=3D"background-color:rgb(255,255,255)"><font size=3D"2">Oleksandr Tys=
hchenko</font></span></div></div></div></div></div></div></div></div>

--000000000000263ce405aef99e78--

