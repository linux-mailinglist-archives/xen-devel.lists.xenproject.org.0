Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F715F645C
	for <lists+xen-devel@lfdr.de>; Thu,  6 Oct 2022 12:31:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416828.661528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogO9q-0003Ai-7o; Thu, 06 Oct 2022 10:31:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416828.661528; Thu, 06 Oct 2022 10:31:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogO9q-00038u-3S; Thu, 06 Oct 2022 10:31:14 +0000
Received: by outflank-mailman (input) for mailman id 416828;
 Thu, 06 Oct 2022 10:31:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y3UN=2H=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1ogO9o-00038o-9x
 for xen-devel@lists.xenproject.org; Thu, 06 Oct 2022 10:31:12 +0000
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [2607:f8b0:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa1ec159-4561-11ed-9377-c1cf23e5d27e;
 Thu, 06 Oct 2022 12:31:03 +0200 (CEST)
Received: by mail-pf1-x435.google.com with SMTP id h13so223252pfr.7
 for <xen-devel@lists.xenproject.org>; Thu, 06 Oct 2022 03:31:03 -0700 (PDT)
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
X-Inumbo-ID: fa1ec159-4561-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1Ww3gjQttemMvIHddNRqftrl1gNSIGxQLuevdJrysL8=;
        b=HoIsPr/KBkYizk+hFXFzdwxnJlvI1M89/s8+FnuJkPVSQkAAv+FY8Ob/Cad3AeYWqj
         fCH+8GpdkSfYzMeTDz829E1JiupKJAi3Y2y18eGT17LcatoPN7GDcS9QQE43iTbCRKOq
         NTfizCD5eaeznd0J/KggGppR55BY3luq1u/7An+vu/Wg4p/SUBszfhsihl8lsC8fAs+J
         BNqKqxLDoTkEO9k4/Itqgsq7cgQbbUto486WFLXXhZZy+bA829Uq5IFj30kR12u9hmMK
         RXpNnlYwf20Bd8IXZRLr2UCuyzNkV09VQfvWCvRbDq94BSVer+qKKAbffwreOGgGs/Fc
         bmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Ww3gjQttemMvIHddNRqftrl1gNSIGxQLuevdJrysL8=;
        b=fSUeWGjBJM3zFxZaWJXnFfVsQdjpBMkbqsblyYjXFu5TW2l4ZbFRqlSKESvzglV7ol
         67dVWl/EZxAeuBya894WGetYQZI22azk4CTL/32/X7RlZx0qFB3IXNGxv+O6FSsIaoHK
         1cLrtLjdzYKrXjBX+kDwsDO1WvpGsIRWHthXcWMfZxi2axCq3G16RQUPCG4qENuaLNq2
         CJz5FxHXy0uRx4HSTJdMjxrgMAQpmXeBaZA2Vgq9Yyu5S4SUoC6ANwdVufJQXV1bJ1lr
         C8pyfHuIWMxNosldZL7SJBkoC+VRMbsaId3BCvG9NvP+0BqKaIstIrRR/mgNShEs6IBa
         P4Pw==
X-Gm-Message-State: ACrzQf1JPbpdU/Ip0Hl2Wvtns8c90GJriItAn1RiBseNmHjq9CX+XoeC
	2+1mYAs9CfL9jxc/pIcNVhbsfKQjsC/a9edl+rA=
X-Google-Smtp-Source: AMsMyM6L+DEpT48DS4gbf4t/3OiHw5sfQ2SvIdhlH+auuTw2ff8mBoWbGV6mdu6IIUFWaOHqTkXeU9RnFkT1tV6Mgyk=
X-Received: by 2002:a63:e806:0:b0:44b:d45b:b8a2 with SMTP id
 s6-20020a63e806000000b0044bd45bb8a2mr3893127pgh.14.1665052262206; Thu, 06 Oct
 2022 03:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <20221005174823.1800761-1-olekstysh@gmail.com> <20221005174823.1800761-2-olekstysh@gmail.com>
 <55a22602-3ae8-b09b-61c9-1fc7c01235fc@gmail.com> <85471e4e-086a-6229-7fd1-e1d5556b94ed@suse.com>
 <CAPD2p-kuXfeQ8G63tSwi4H1Wz8ygwJnp3q1ZXFHi+k+knwT-EA@mail.gmail.com> <df17af24-632c-6087-43e0-9e4079959437@suse.com>
In-Reply-To: <df17af24-632c-6087-43e0-9e4079959437@suse.com>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Thu, 6 Oct 2022 13:30:50 +0300
Message-ID: <CAPD2p-mgxSw+yoYa9tnabWDo6uJCjBjJ-6DncvwvXqP3HkEx6g@mail.gmail.com>
Subject: Re: [PATCH 1/2] xen/virtio: Fix n_pages calculation in xen_grant_dma_map(unmap)_page()
To: Juergen Gross <jgross@suse.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org, 
	linux-kernel@vger.kernel.org, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: multipart/alternative; boundary="0000000000009f0f4f05ea5b30c5"

--0000000000009f0f4f05ea5b30c5
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 6, 2022 at 1:24 PM Juergen Gross <jgross@suse.com> wrote:

Hello Juergen

[sorry for the possible format issues]

On 06.10.22 12:14, Oleksandr Tyshchenko wrote:
> >
> >
> > On Thu, Oct 6, 2022 at 11:05 AM Juergen Gross <jgross@suse.com
> > <mailto:jgross@suse.com>> wrote:
> >
> >     On 06.10.22 09:35, Xenia Ragiadakou wrote:
> >
> >
> >
> > Hello Xenia, Juergen
> >
> > [sorry for the possible format issues]
> >
> >      >
> >      > On 10/5/22 20:48, Oleksandr Tyshchenko wrote:
> >      >> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com
> >     <mailto:oleksandr_tyshchenko@epam.com>>
> >      >>
> >      >> Take page offset into the account when calculating the number of
> pages
> >      >> to be granted.
> >      >>
> >      >> Signed-off-by: Oleksandr Tyshchenko <
> oleksandr_tyshchenko@epam.com
> >     <mailto:oleksandr_tyshchenko@epam.com>>
> >      >> Fixes: d6aca3504c7d ("xen/grant-dma-ops: Add option to restrict
> memory
> >     access
> >      >> under Xen")
> >      >> ---
> >      >>   drivers/xen/grant-dma-ops.c | 5 +++--
> >      >>   1 file changed, 3 insertions(+), 2 deletions(-)
> >      >>
> >      >> diff --git a/drivers/xen/grant-dma-ops.c
> b/drivers/xen/grant-dma-ops.c
> >      >> index 8973fc1e9ccc..1998d0e8ce82 100644
> >      >> --- a/drivers/xen/grant-dma-ops.c
> >      >> +++ b/drivers/xen/grant-dma-ops.c
> >      >> @@ -153,7 +153,7 @@ static dma_addr_t
> xen_grant_dma_map_page(struct device
> >      >> *dev, struct page *page,
> >      >>                        unsigned long attrs)
> >      >>   {
> >      >>       struct xen_grant_dma_data *data;
> >      >> -    unsigned int i, n_pages = PFN_UP(size);
> >      >> +    unsigned int i, n_pages = PFN_UP(offset + size);
> >      >
> >      > Here, why do we use PFN_UP and not XEN_PFN_UP?
> >      > Also, since the variable 'n_pages' seems to refer to the number
> of grants
> >      > (unless I got it all entirely wrong ...), wouldn't it be more
> suitable to
> >     call
> >      > explicitly gnttab_count_grant()?
> >
> >     Good point.
> >
> >
> > +1
> >
> >
> >     I think this will need another patch for switching grant-dma-ops.c to
> >     use XEN_PAGE_SIZE and XEN_PAGE_SHIFT.
> >
> >
> > +1
> >
> > I can create a separate patch for converting on top of this series, it
> would be
> > nice to clarify one point.
> >
> > So I will convert PAGE_SIZE/PAGE_SHIFT to XEN_PAGE_SIZE/XEN_PAGE_SHIFT
> > respectively (where appropriate).
>
> Yes, that would be the idea.
>
> > Should the PFN_UP be converted to XEN_PFN_UP *or* use
> > gnttab_count_grant() explicitly? Personally I would prefer the former,
> but would
> > also be ok with the latter.
>
> I agree XEN_PFN_UP would be better, especially as
> XEN_PAGE_SIZE/XEN_PAGE_SHIFT
> will be used in the same functions.
>


Thanks for the clarification.



>
>
> Juergen
>


-- 
Regards,

Oleksandr Tyshchenko

--0000000000009f0f4f05ea5b30c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 6, 2022 at 1:24 PM Juerge=
n Gross &lt;<a href=3D"mailto:jgross@suse.com">jgross@suse.com</a>&gt; wrot=
e:<br></div><div dir=3D"ltr" class=3D"gmail_attr"><br></div><div dir=3D"ltr=
" class=3D"gmail_attr">Hello Juergen<br></div><div dir=3D"ltr" class=3D"gma=
il_attr"><br></div><div dir=3D"ltr" class=3D"gmail_attr">[sorry for the pos=
sible format issues]<br></div><div dir=3D"ltr" class=3D"gmail_attr"><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">On 06.10.22 12:14, Ole=
ksandr Tyshchenko wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Thu, Oct 6, 2022 at 11:05 AM Juergen Gross &lt;<a href=3D"mailto:jg=
ross@suse.com" target=3D"_blank">jgross@suse.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:jgross@suse.com" target=3D"_blank">jgross=
@suse.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 06.10.22 09:35, Xenia Ragiadakou wrote:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; Hello=C2=A0Xenia,=C2=A0Juergen<br>
&gt; <br>
&gt; [sorry for the possible format issues]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On 10/5/22 20:48, Oleksandr Tyshchenko wrote:=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; From: Oleksandr Tyshchenko &lt;<a href=3D=
"mailto:oleksandr_tyshchenko@epam.com" target=3D"_blank">oleksandr_tyshchen=
ko@epam.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:oleksandr_tyshchenko@e=
pam.com" target=3D"_blank">oleksandr_tyshchenko@epam.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Take page offset into the account when ca=
lculating the number of pages<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; to be granted.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Signed-off-by: Oleksandr Tyshchenko &lt;<=
a href=3D"mailto:oleksandr_tyshchenko@epam.com" target=3D"_blank">oleksandr=
_tyshchenko@epam.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:oleksandr_tyshchenko@e=
pam.com" target=3D"_blank">oleksandr_tyshchenko@epam.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Fixes: d6aca3504c7d (&quot;xen/grant-dma-=
ops: Add option to restrict memory<br>
&gt;=C2=A0 =C2=A0 =C2=A0access<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; under Xen&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0 drivers/xen/grant-dma-ops.c | 5 ++=
+--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0 1 file changed, 3 insertions(+), 2=
 deletions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; diff --git a/drivers/xen/grant-dma-ops.c =
b/drivers/xen/grant-dma-ops.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; index 8973fc1e9ccc..1998d0e8ce82 100644<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; --- a/drivers/xen/grant-dma-ops.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +++ b/drivers/xen/grant-dma-ops.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; @@ -153,7 +153,7 @@ static dma_addr_t xen=
_grant_dma_map_page(struct device<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; *dev, struct page *page,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 unsigned long attrs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xen=
_grant_dma_data *data;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; -=C2=A0=C2=A0=C2=A0 unsigned int i, n_pag=
es =3D PFN_UP(size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +=C2=A0=C2=A0=C2=A0 unsigned int i, n_pag=
es =3D PFN_UP(offset + size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Here, why do we use PFN_UP and not XEN_PFN_UP=
?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Also, since the variable &#39;n_pages&#39; se=
ems to refer to the number of grants<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; (unless I got it all entirely wrong ...), wou=
ldn&#39;t it be more suitable to<br>
&gt;=C2=A0 =C2=A0 =C2=A0call<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; explicitly gnttab_count_grant()?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Good point.<br>
&gt; <br>
&gt; <br>
&gt; +1<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I think this will need another patch for switching =
grant-dma-ops.c to<br>
&gt;=C2=A0 =C2=A0 =C2=A0use XEN_PAGE_SIZE and XEN_PAGE_SHIFT.<br>
&gt; <br>
&gt; <br>
&gt; +1<br>
&gt; <br>
&gt; I can create a separate patch for converting on top of this series, it=
 would be <br>
&gt; nice to clarify one=C2=A0point.<br>
&gt; <br>
&gt; So I will convert PAGE_SIZE/PAGE_SHIFT to XEN_PAGE_SIZE/XEN_PAGE_SHIFT=
 <br>
&gt; respectively (where appropriate).<br>
<br>
Yes, that would be the idea.<br>
<br>
&gt; Should the PFN_UP be=C2=A0converted to XEN_PFN_UP *or* use <br>
&gt; gnttab_count_grant()=C2=A0explicitly? Personally I would prefer the fo=
rmer, but would <br>
&gt; also be ok with the latter.<br>
<br>
I agree XEN_PFN_UP would be better, especially as XEN_PAGE_SIZE/XEN_PAGE_SH=
IFT<br>
will be used in the same functions.<br></blockquote><div>=C2=A0</div><div><=
br></div><div>Thanks for the clarification.</div><div><br></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
Juergen<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><span style=3D"background-color:rgb(255,255,255)"><font size=
=3D"2"><span style=3D"color:rgb(51,51,51);font-family:Arial,sans-serif">Reg=
ards,</span></font></span></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"=
><div><span style=3D"background-color:rgb(255,255,255)"><font size=3D"2">Ol=
eksandr Tyshchenko</font></span></div></div></div></div></div></div></div><=
/div>

--0000000000009f0f4f05ea5b30c5--

