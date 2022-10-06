Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FC35F643B
	for <lists+xen-devel@lfdr.de>; Thu,  6 Oct 2022 12:15:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416812.661506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogNu3-0000AP-Dn; Thu, 06 Oct 2022 10:14:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416812.661506; Thu, 06 Oct 2022 10:14:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogNu3-00007E-Ax; Thu, 06 Oct 2022 10:14:55 +0000
Received: by outflank-mailman (input) for mailman id 416812;
 Thu, 06 Oct 2022 10:14:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y3UN=2H=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1ogNu2-000078-3Q
 for xen-devel@lists.xenproject.org; Thu, 06 Oct 2022 10:14:54 +0000
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [2607:f8b0:4864:20::1035])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b73cbb14-455f-11ed-964a-05401a9f4f97;
 Thu, 06 Oct 2022 12:14:52 +0200 (CEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 p3-20020a17090a284300b0020a85fa3ffcso3925172pjf.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Oct 2022 03:14:52 -0700 (PDT)
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
X-Inumbo-ID: b73cbb14-455f-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cuxvjCmNdZPr7Sj2qPmwq+yZEk2qpO5b4TWiZE0kSQ8=;
        b=NIm738FSTJ44NTtMD51cMuunDkOjl+WuP2Qs05qapjajATeJwLJMe8JkFYhkBFDdUg
         oXwYovMuKljBFW7/fafxkB9oh04QxvQaQzBVCTn9WSpfwnGEVJqi0hD+5wGgPDKyxgZD
         HczV0Xd5O49JmsMF0GEzT9Xh5/o8JlCU3nbsdnbEvEJKO5Mcc0DAyn4WYi8AVw6OVr0M
         +/m0AaLnS8Jf1N4ffKIpl38FJkPrB60EK2kxYGDYvnCACiR+6OKF2wxC/zu5wxBq291F
         e5/tm2CBLoUFYVlZxNrhduGLAfOYppMO61x4WHyDmv0+G2vnAxgfJqCKhvROSenKM0Wu
         y5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cuxvjCmNdZPr7Sj2qPmwq+yZEk2qpO5b4TWiZE0kSQ8=;
        b=iEwejtpHvXDhYTMIeXtZWz4ITd/zKaVJfzvHYBKFk4zX7ekNF5ceF+DH5XNaPwDSnx
         DMwwe/igERqTMtE2qNYsIBc03vKs52xPguXTevg9sSxBDIQD3Vr9vO4+10Bn47a9mBmh
         A7WDkCbrep8vzFwmzY5CQZsUiHqILBbZGWLq1upg1g5lMRdU9ucXCbpKsRgmNwlhP2hT
         a/68f0EPnp/xbLqMvasFn8A7Weu2oakBxS3O+6ayz2qKH3VRs2abiWyvWg9xMNzI1uxv
         ipylgtf2iOA4F7MqH6vFB5mrbyvuJggxvv1QzzHyZCVBnwdC9mzg8CftQr7Xns8L6FWA
         Gs7w==
X-Gm-Message-State: ACrzQf1Fyhbn+EYdJmXlNZRc67UhtoE3dKHi382SyeCiLbILpx2wuWnC
	rhW+qL9Ld15iNqtf/lUqWa4dZ4DKoCAGObR6JoE=
X-Google-Smtp-Source: AMsMyM62ls2pHIzwEujT5MyEJtqf4OT9tpKQTXfY1B+lLRVwUzHIpu3TGlI4HrK1P5jd8k2V4i9RxFoiEFye4wIlSCM=
X-Received: by 2002:a17:90a:641:b0:202:8568:4180 with SMTP id
 q1-20020a17090a064100b0020285684180mr4543933pje.227.1665051291012; Thu, 06
 Oct 2022 03:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221005174823.1800761-1-olekstysh@gmail.com> <20221005174823.1800761-2-olekstysh@gmail.com>
 <55a22602-3ae8-b09b-61c9-1fc7c01235fc@gmail.com> <85471e4e-086a-6229-7fd1-e1d5556b94ed@suse.com>
In-Reply-To: <85471e4e-086a-6229-7fd1-e1d5556b94ed@suse.com>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Thu, 6 Oct 2022 13:14:39 +0300
Message-ID: <CAPD2p-kuXfeQ8G63tSwi4H1Wz8ygwJnp3q1ZXFHi+k+knwT-EA@mail.gmail.com>
Subject: Re: [PATCH 1/2] xen/virtio: Fix n_pages calculation in xen_grant_dma_map(unmap)_page()
To: Juergen Gross <jgross@suse.com>, Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000bbd13205ea5af696"

--000000000000bbd13205ea5af696
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 6, 2022 at 11:05 AM Juergen Gross <jgross@suse.com> wrote:

> On 06.10.22 09:35, Xenia Ragiadakou wrote:
>


Hello Xenia, Juergen

[sorry for the possible format issues]



> >
> > On 10/5/22 20:48, Oleksandr Tyshchenko wrote:
> >> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >>
> >> Take page offset into the account when calculating the number of pages
> >> to be granted.
> >>
> >> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >> Fixes: d6aca3504c7d ("xen/grant-dma-ops: Add option to restrict memory
> access
> >> under Xen")
> >> ---
> >>   drivers/xen/grant-dma-ops.c | 5 +++--
> >>   1 file changed, 3 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
> >> index 8973fc1e9ccc..1998d0e8ce82 100644
> >> --- a/drivers/xen/grant-dma-ops.c
> >> +++ b/drivers/xen/grant-dma-ops.c
> >> @@ -153,7 +153,7 @@ static dma_addr_t xen_grant_dma_map_page(struct
> device
> >> *dev, struct page *page,
> >>                        unsigned long attrs)
> >>   {
> >>       struct xen_grant_dma_data *data;
> >> -    unsigned int i, n_pages = PFN_UP(size);
> >> +    unsigned int i, n_pages = PFN_UP(offset + size);
> >
> > Here, why do we use PFN_UP and not XEN_PFN_UP?
> > Also, since the variable 'n_pages' seems to refer to the number of
> grants
> > (unless I got it all entirely wrong ...), wouldn't it be more suitable
> to call
> > explicitly gnttab_count_grant()?
>
> Good point.
>

+1


>
> I think this will need another patch for switching grant-dma-ops.c to
> use XEN_PAGE_SIZE and XEN_PAGE_SHIFT.
>

+1

I can create a separate patch for converting on top of this series, it
would be nice to clarify one point.

So I will convert PAGE_SIZE/PAGE_SHIFT to XEN_PAGE_SIZE/XEN_PAGE_SHIFT
respectively (where appropriate).

Should the PFN_UP be converted to XEN_PFN_UP *or* use
gnttab_count_grant() explicitly? Personally I would prefer the former, but
would also be ok with the latter.



>
>
> Juergen
>
>

-- 
Regards,

Oleksandr Tyshchenko

--000000000000bbd13205ea5af696
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 6, 2022 at 11:05 AM Juerg=
en Gross &lt;<a href=3D"mailto:jgross@suse.com" target=3D"_blank">jgross@su=
se.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On 06.10.22 09:35, Xenia Ragiadakou wrote:<br></blockquote><div><br><=
/div><div><br></div><div>Hello=C2=A0Xenia,=C2=A0Juergen</div><div><br></div=
><div>[sorry for the possible format issues]</div><div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; On 10/5/22 20:48, Oleksandr Tyshchenko wrote:<br>
&gt;&gt; From: Oleksandr Tyshchenko &lt;<a href=3D"mailto:oleksandr_tyshche=
nko@epam.com" target=3D"_blank">oleksandr_tyshchenko@epam.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Take page offset into the account when calculating the number of p=
ages<br>
&gt;&gt; to be granted.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Oleksandr Tyshchenko &lt;<a href=3D"mailto:oleksand=
r_tyshchenko@epam.com" target=3D"_blank">oleksandr_tyshchenko@epam.com</a>&=
gt;<br>
&gt;&gt; Fixes: d6aca3504c7d (&quot;xen/grant-dma-ops: Add option to restri=
ct memory access <br>
&gt;&gt; under Xen&quot;)<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0 drivers/xen/grant-dma-ops.c | 5 +++--<br>
&gt;&gt; =C2=A0 1 file changed, 3 insertions(+), 2 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-o=
ps.c<br>
&gt;&gt; index 8973fc1e9ccc..1998d0e8ce82 100644<br>
&gt;&gt; --- a/drivers/xen/grant-dma-ops.c<br>
&gt;&gt; +++ b/drivers/xen/grant-dma-ops.c<br>
&gt;&gt; @@ -153,7 +153,7 @@ static dma_addr_t xen_grant_dma_map_page(struc=
t device <br>
&gt;&gt; *dev, struct page *page,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned=
 long attrs)<br>
&gt;&gt; =C2=A0 {<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xen_grant_dma_data *data;<br=
>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 unsigned int i, n_pages =3D PFN_UP(size);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 unsigned int i, n_pages =3D PFN_UP(offset + si=
ze);<br>
&gt; <br>
&gt; Here, why do we use PFN_UP and not XEN_PFN_UP?<br>
&gt; Also, since the variable &#39;n_pages&#39; seems to refer to the numbe=
r of grants <br>
&gt; (unless I got it all entirely wrong ...), wouldn&#39;t it be more suit=
able to call <br>
&gt; explicitly gnttab_count_grant()?<br>
<br>
Good point.<br></blockquote><div><br></div><div>+1<br></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I think this will need another patch for switching grant-dma-ops.c to<br>
use XEN_PAGE_SIZE and XEN_PAGE_SHIFT.<br></blockquote><div><br></div><div>+=
1<br></div><div><br></div><div>I can create a separate patch for converting=
 on top of this series, it would be nice to clarify one=C2=A0point.</div><d=
iv><br></div><div>So I will convert PAGE_SIZE/PAGE_SHIFT to XEN_PAGE_SIZE/X=
EN_PAGE_SHIFT respectively (where appropriate).</div><div><br></div><div>Sh=
ould the PFN_UP be=C2=A0converted to XEN_PFN_UP *or* use gnttab_count_grant=
()=C2=A0explicitly? Personally I would prefer the former, but would also be=
 ok with the latter.</div><div>=C2=A0</div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
<br>
<br>
Juergen<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><span style=
=3D"background-color:rgb(255,255,255)"><font size=3D"2"><span style=3D"colo=
r:rgb(51,51,51);font-family:Arial,sans-serif">Regards,</span></font></span>=
</div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div><span style=3D"backg=
round-color:rgb(255,255,255)"><font size=3D"2">Oleksandr Tyshchenko</font><=
/span></div></div></div></div></div></div></div></div>

--000000000000bbd13205ea5af696--

