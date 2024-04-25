Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 665E98B22FB
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 15:40:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712106.1112519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzzKN-0001Mp-86; Thu, 25 Apr 2024 13:39:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712106.1112519; Thu, 25 Apr 2024 13:39:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzzKN-0001K2-4o; Thu, 25 Apr 2024 13:39:55 +0000
Received: by outflank-mailman (input) for mailman id 712106;
 Thu, 25 Apr 2024 13:39:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5azX=L6=gmail.com=dunlapg@srs-se1.protection.inumbo.net>)
 id 1rzzKL-0001Js-Cc
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 13:39:53 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a0e8304-0309-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 15:39:50 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-344047ac7e4so1195724f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 06:39:50 -0700 (PDT)
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
X-Inumbo-ID: 4a0e8304-0309-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1714052390; x=1714657190; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3nta+frtegX3gSGEVXbekqghpwVBbX0diUeg2T951Kw=;
        b=iPhpQdueiiAZkngHoDJS69/JxwCs7FaAyFHzqY5JomZxLDXRb3lu2Cb9Jzizj5pe6O
         W+AFVJBEQeoiUqvUPPgolMSkpoiAZl1akRIBPpDVmE3C61g2kxN9m0ocP1VieFvHQHgW
         eD7py4sYhtbiwefq7aE2ly57aQ9ePAn9AhVm2++lPYZCezvt2qgYShbSsVDyv07pn59V
         9idWntMpcwf9jV886UfuUUV9jmdhUDZUhf7DWDxVxy5tArYVm1xFKDCCHoYUi15cl96+
         KZ3QBJksSjuYtkvqOEsezB05DBHHzc7Dzn2qv+NSLdlyhMR68jj2VPTzsrY3aVcw5GAh
         u5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714052390; x=1714657190;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3nta+frtegX3gSGEVXbekqghpwVBbX0diUeg2T951Kw=;
        b=q6nOlmI6EHmmAAccAUbH7EmU1SDpDYn5fqi7FDzidmPPEOw78OzugUc8na/eF+lfbh
         1pDeb092JsmWxPT18MfYUkbIL+xKzLwi5LxG1YGFyqXalqeIwEhGtEPyYfa3O99bIkwU
         804Yzci50QQ3yfitLF6OHeklXuVemmCqHbYeBI7CM0TPtRAzDlLd1KkmzlwMxbtGYPFd
         OmF6jx1oXm7h04G7/mxJcYZ4BeJx1EgTBGli3WbhPHLSkaOalZl56N51Mhvm5y3CHKFy
         fln37PDXE/AL9kvEa1ygKpBWcTbytPdfCu/Qqb9+Q/gRBmOubH659aHedjFQF19A2pfP
         wKkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxgA+zjLH46otdBLzk2Lc4h3gAO9zcUWPe6h9NqL0t3ETsIuXRc9LLzxBxTJL1U1z6B2ODpjKlnEPLjb7vIVVdwW2XxadKYmUT7XcAXMw=
X-Gm-Message-State: AOJu0YxQVKQtDpeh02E81i7weU0kubiFWqAHa86o/nT3iJhySZMegqP4
	ibX07cBloy4Wcygjn1H770sSDCqGL2ngEh6fEYXiG/EQE2R/oVQ6ZSknB7UR+v1+AwJSp3kdryN
	+RzGCEzwkvW2xakRIGkalNWpiWvM=
X-Google-Smtp-Source: AGHT+IHKsg/6gn6eEWhorBMcGRrhq4cy3P5qvWZMl4gjiyLQZSLA321E3jNfQ1HwihLkBvWbkC0EurMZPivX3XCWfyY=
X-Received: by 2002:adf:e945:0:b0:34c:765:7657 with SMTP id
 m5-20020adfe945000000b0034c07657657mr1453656wrn.24.1714052389686; Thu, 25 Apr
 2024 06:39:49 -0700 (PDT)
MIME-Version: 1.0
References: <171154167446.2671062.9127105384591237363.stgit@firesoul>
 <CALUcmU=xOR1j9Asdv0Ny7x=o4Ckz80mDjbuEnJC0Z_Aepu0Zzw@mail.gmail.com>
 <CALUcmUkvpnq+CKSCn=cuAfxXOGU22fkBx4QD4u2nZYGM16DD6A@mail.gmail.com> <CALUcmUn0__izGAS-8gDL2h2Ceg9mdkFnLmdOgvAfO7sqxXK1-Q@mail.gmail.com>
In-Reply-To: <CALUcmUn0__izGAS-8gDL2h2Ceg9mdkFnLmdOgvAfO7sqxXK1-Q@mail.gmail.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Thu, 25 Apr 2024 14:39:38 +0100
Message-ID: <CAFLBxZaLKGgrZRUDMQ+kCAYKD7ypzsjO55mWvkZHtMTBxdw51A@mail.gmail.com>
Subject: Re: [PATCH net] xen-netfront: Add missing skb_mark_for_recycle
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Jesper Dangaard Brouer <hawk@kernel.org>, netdev@vger.kernel.org, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, wei.liu@kernel.org, paul@xen.org, 
	Jakub Kicinski <kuba@kernel.org>, kirjanov@gmail.com, dkirjanov@suse.de, 
	kernel-team@cloudflare.com, security@xenproject.org, 
	andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000d056be0616ebebe8"

--000000000000d056be0616ebebe8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Greg,

We're issuing an XSA for this; can you issue a CVE?

Thanks,
 -George Dunlap

On Tue, Apr 2, 2024 at 9:25=E2=80=AFPM Arthur Borsboom <arthurborsboom@gmai=
l.com>
wrote:

> After having a better look, I have found the patch in linux-next
>
>
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3D0cd74ffcf4fb0536718241d59d2c124578624d83
>
> On Tue, 2 Apr 2024 at 10:20, Arthur Borsboom <arthurborsboom@gmail.com>
> wrote:
> >
> > On Fri, 29 Mar 2024 at 10:47, Arthur Borsboom <arthurborsboom@gmail.com=
>
> wrote:
> > >
> > > On Wed, 27 Mar 2024 at 13:15, Jesper Dangaard Brouer <hawk@kernel.org=
>
> wrote:
> > > >
> > > > Notice that skb_mark_for_recycle() is introduced later than fixes
> tag in
> > > > 6a5bcd84e886 ("page_pool: Allow drivers to hint on SKB recycling").
> > > >
> > > > It is believed that fixes tag were missing a call to
> page_pool_release_page()
> > > > between v5.9 to v5.14, after which is should have used
> skb_mark_for_recycle().
> > > > Since v6.6 the call page_pool_release_page() were removed (in
> 535b9c61bdef
> > > > ("net: page_pool: hide page_pool_release_page()") and remaining
> callers
> > > > converted (in commit 6bfef2ec0172 ("Merge branch
> > > > 'net-page_pool-remove-page_pool_release_page'")).
> > > >
> > > > This leak became visible in v6.8 via commit dba1b8a7ab68
> ("mm/page_pool: catch
> > > > page_pool memory leaks").
> > > >
> > > > Fixes: 6c5aa6fc4def ("xen networking: add basic XDP support for
> xen-netfront")
> > > > Reported-by: Arthur Borsboom <arthurborsboom@gmail.com>
> > > > Signed-off-by: Jesper Dangaard Brouer <hawk@kernel.org>
> > > > ---
> > > > Compile tested only, can someone please test this
> > >
> > > I have tested this patch on Xen 4.18.1 with VM (Arch Linux) kernel
> 6.9.0-rc1.
> > >
> > > Without the patch there are many trace traces and cloning the Linux
> > > mainline git repository resulted in failures (same with kernel 6.8.1)=
.
> > > The patched kernel 6.9.0-rc1 performs as expected; cloning the git
> > > repository was successful and no kernel traces observed.
> > > Hereby my tested by:
> > >
> > > Tested-by: Arthur Borsboom <arthurborsboom@gmail.com>
> > >
> > >
> > >
> > > >  drivers/net/xen-netfront.c |    1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.=
c
> > > > index ad29f370034e..8d2aee88526c 100644
> > > > --- a/drivers/net/xen-netfront.c
> > > > +++ b/drivers/net/xen-netfront.c
> > > > @@ -285,6 +285,7 @@ static struct sk_buff
> *xennet_alloc_one_rx_buffer(struct netfront_queue *queue)
> > > >                 return NULL;
> > > >         }
> > > >         skb_add_rx_frag(skb, 0, page, 0, 0, PAGE_SIZE);
> > > > +       skb_mark_for_recycle(skb);
> > > >
> > > >         /* Align ip header to a 16 bytes boundary */
> > > >         skb_reserve(skb, NET_IP_ALIGN);
> > > >
> > > >
> >
> > I don't see this patch yet in linux-next.
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log
> >
> > Any idea in which kernel release this patch will be included?
>

--000000000000d056be0616ebebe8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Greg,<div><br></div><div>We&#39;re issuing an XSA for this=
; can you issue a CVE?</div><div><br></div><div>Thanks,</div><div>=C2=A0-Ge=
orge Dunlap</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Tue, Apr 2, 2024 at 9:25=E2=80=AFPM Arthur Borsboom &lt=
;<a href=3D"mailto:arthurborsboom@gmail.com">arthurborsboom@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">After =
having a better look, I have found the patch in linux-next<br>
<br>
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.=
git/commit/?id=3D0cd74ffcf4fb0536718241d59d2c124578624d83" rel=3D"noreferre=
r" target=3D"_blank">https://git.kernel.org/pub/scm/linux/kernel/git/next/l=
inux-next.git/commit/?id=3D0cd74ffcf4fb0536718241d59d2c124578624d83</a><br>
<br>
On Tue, 2 Apr 2024 at 10:20, Arthur Borsboom &lt;<a href=3D"mailto:arthurbo=
rsboom@gmail.com" target=3D"_blank">arthurborsboom@gmail.com</a>&gt; wrote:=
<br>
&gt;<br>
&gt; On Fri, 29 Mar 2024 at 10:47, Arthur Borsboom &lt;<a href=3D"mailto:ar=
thurborsboom@gmail.com" target=3D"_blank">arthurborsboom@gmail.com</a>&gt; =
wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Wed, 27 Mar 2024 at 13:15, Jesper Dangaard Brouer &lt;<a href=
=3D"mailto:hawk@kernel.org" target=3D"_blank">hawk@kernel.org</a>&gt; wrote=
:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Notice that skb_mark_for_recycle() is introduced later than =
fixes tag in<br>
&gt; &gt; &gt; 6a5bcd84e886 (&quot;page_pool: Allow drivers to hint on SKB =
recycling&quot;).<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; It is believed that fixes tag were missing a call to page_po=
ol_release_page()<br>
&gt; &gt; &gt; between v5.9 to v5.14, after which is should have used skb_m=
ark_for_recycle().<br>
&gt; &gt; &gt; Since v6.6 the call page_pool_release_page() were removed (i=
n 535b9c61bdef<br>
&gt; &gt; &gt; (&quot;net: page_pool: hide page_pool_release_page()&quot;) =
and remaining callers<br>
&gt; &gt; &gt; converted (in commit 6bfef2ec0172 (&quot;Merge branch<br>
&gt; &gt; &gt; &#39;net-page_pool-remove-page_pool_release_page&#39;&quot;)=
).<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This leak became visible in v6.8 via commit dba1b8a7ab68 (&q=
uot;mm/page_pool: catch<br>
&gt; &gt; &gt; page_pool memory leaks&quot;).<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Fixes: 6c5aa6fc4def (&quot;xen networking: add basic XDP sup=
port for xen-netfront&quot;)<br>
&gt; &gt; &gt; Reported-by: Arthur Borsboom &lt;<a href=3D"mailto:arthurbor=
sboom@gmail.com" target=3D"_blank">arthurborsboom@gmail.com</a>&gt;<br>
&gt; &gt; &gt; Signed-off-by: Jesper Dangaard Brouer &lt;<a href=3D"mailto:=
hawk@kernel.org" target=3D"_blank">hawk@kernel.org</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt; Compile tested only, can someone please test this<br>
&gt; &gt;<br>
&gt; &gt; I have tested this patch on Xen 4.18.1 with VM (Arch Linux) kerne=
l 6.9.0-rc1.<br>
&gt; &gt;<br>
&gt; &gt; Without the patch there are many trace traces and cloning the Lin=
ux<br>
&gt; &gt; mainline git repository resulted in failures (same with kernel 6.=
8.1).<br>
&gt; &gt; The patched kernel 6.9.0-rc1 performs as expected; cloning the gi=
t<br>
&gt; &gt; repository was successful and no kernel traces observed.<br>
&gt; &gt; Hereby my tested by:<br>
&gt; &gt;<br>
&gt; &gt; Tested-by: Arthur Borsboom &lt;<a href=3D"mailto:arthurborsboom@g=
mail.com" target=3D"_blank">arthurborsboom@gmail.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 drivers/net/xen-netfront.c |=C2=A0 =C2=A0 1 +<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-ne=
tfront.c<br>
&gt; &gt; &gt; index ad29f370034e..8d2aee88526c 100644<br>
&gt; &gt; &gt; --- a/drivers/net/xen-netfront.c<br>
&gt; &gt; &gt; +++ b/drivers/net/xen-netfront.c<br>
&gt; &gt; &gt; @@ -285,6 +285,7 @@ static struct sk_buff *xennet_alloc_one_=
rx_buffer(struct netfront_queue *queue)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return NULL;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0skb_add_rx_frag(skb, 0, pag=
e, 0, 0, PAGE_SIZE);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0skb_mark_for_recycle(skb);<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Align ip header to a 16 =
bytes boundary */<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0skb_reserve(skb, NET_IP_ALI=
GN);<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt;<br>
&gt; I don&#39;t see this patch yet in linux-next.<br>
&gt;<br>
&gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-=
next.git/log" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.org/p=
ub/scm/linux/kernel/git/next/linux-next.git/log</a><br>
&gt;<br>
&gt; Any idea in which kernel release this patch will be included?<br>
</blockquote></div>

--000000000000d056be0616ebebe8--

