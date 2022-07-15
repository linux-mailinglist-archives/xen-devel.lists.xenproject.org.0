Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB26757611B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 14:05:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368181.599381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCK4R-0004w9-Er; Fri, 15 Jul 2022 12:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368181.599381; Fri, 15 Jul 2022 12:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCK4R-0004uJ-BW; Fri, 15 Jul 2022 12:05:23 +0000
Received: by outflank-mailman (input) for mailman id 368181;
 Fri, 15 Jul 2022 12:00:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s6BD=XU=gmail.com=andrii.chepurnyi82@srs-se1.protection.inumbo.net>)
 id 1oCJzc-0004Bg-59
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 12:00:24 +0000
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [2001:4860:4864:20::2c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b445c550-0435-11ed-924f-1f966e50362f;
 Fri, 15 Jul 2022 14:00:23 +0200 (CEST)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-10c0e6dd55eso5918227fac.7
 for <xen-devel@lists.xenproject.org>; Fri, 15 Jul 2022 05:00:22 -0700 (PDT)
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
X-Inumbo-ID: b445c550-0435-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1AogFaIBNHLVxEl9g85HNQ6PNSYsmdEqrn/tB/pzrJs=;
        b=jX9Pf/0Ic5b/hkcNqf4c0vxLpp+ecwFm2Q8sd59jXQROio8GyzjPDi4d625IOJ16Tk
         Krn01+q7K+Z7V/uKcP98EzRgnuKWNqOTpqePd6QuX4+fc1fzFQ+cb3409JxLjnM3dddM
         RKj4krs/9XThI5DE+eHSyYCvnx3Zhq56PJIy2aA7bsQmufenm13s+0yN5fBtr8zRihcY
         gxb26CaMzz8ZmNTL6D/PysbMrPZ3xtQ8eUjj6ykzUk+Zyyw2cr57b6q79GazkAUn3+5E
         azX4wjlBG+m/o4u4++kh9s9fvtlLQEQFbVxEzvqNFKkn23kCnQJAB7dG7sajJCZVp0NJ
         QbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1AogFaIBNHLVxEl9g85HNQ6PNSYsmdEqrn/tB/pzrJs=;
        b=Ju+ibDEPciBp5pCCwxy4neNgHAED/U4eseC9wGBLJHUMYEuZuU8fzuquWfQFKJDv/3
         3v1PuJ74nwjkxYthKhTbGMyMGhYSgZNUNE9XvPZk8dA+0G2QUVuLF+ipnbAKFcmXq0IG
         7UEADjBi4GZwHMsBU3Wm+bMJqZ5tR+gMmRhbnc3u0OZ8TkijaYq5z9FWW8wC5SgNI0K1
         lCgfGNxBBC8uECeVBFAa9WnQOsDPxipBPDKqNflAlZuYI2+8/JOY3AP0mMwv36FHf9v5
         Rt5KIMwIgUocCshmM7HblKtA8ujRn8T3dfmakwd/sK/m17K0FpwYAjh41u5fmFcEEBF1
         db9A==
X-Gm-Message-State: AJIora+PyTK2QEy6ULgN1Vva/3Jk/r8lHZc0SDtNLFlsArsVPzpg945A
	KXimPSBUJH/URupUARhqVtssv77yAszYPPYkzxM=
X-Google-Smtp-Source: AGRyM1sVxfePi8rAk/gHeLL7GDiWUlgVMPRpqnyNhU5VBUmUNQmMziBE0Mt7b+vBBuJTGTDRSPVtGVwl86bQo4TspMk=
X-Received: by 2002:a05:6870:d610:b0:10c:692:668a with SMTP id
 a16-20020a056870d61000b0010c0692668amr7067435oaq.86.1657886421671; Fri, 15
 Jul 2022 05:00:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220714224410.51147-1-sj@kernel.org> <41207539-f621-1bb2-2f43-0b2b9e3f6866@gmail.com>
In-Reply-To: <41207539-f621-1bb2-2f43-0b2b9e3f6866@gmail.com>
From: Andrii Chepurnyi <andrii.chepurnyi82@gmail.com>
Date: Fri, 15 Jul 2022 15:00:10 +0300
Message-ID: <CAJwUmVB6H3iTs-C+U=v-pwJB7-_ZRHPxHzKRJZ22xEPW7z8a=g@mail.gmail.com>
Subject: Re: [PATCH v2] xen-blkback: fix persistent grants negotiation
To: Oleksandr <olekstysh@gmail.com>
Cc: SeongJae Park <sj@kernel.org>, roger.pau@citrix.com, jgross@suse.com, axboe@kernel.dk, 
	boris.ostrovsky@oracle.com, mheyne@amazon.de, xen-devel@lists.xenproject.org, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: multipart/alternative; boundary="0000000000003de32205e3d6c364"

--0000000000003de32205e3d6c364
Content-Type: text/plain; charset="UTF-8"

Hello All,

I faced the mentioned issue recently and just to bring more context here is
our setup:
We use pvblock backend for Android guest. It starts using u-boot with
pvblock support(which frontend doesn't support the persistent grants
feature), later it loads and starts the Linux kernel(which frontend
supports the persistent grants feature). So in total, we have sequent two
different frontends reconnection, the first of which doesn't support
persistent grants.
So the original patch [1] perfectly solves the original issue and provides
the ability to use persistent grants after the reconnection when Linux
frontend which supports persistent grants comes into play.
At the same time [2] will disable the persistent grants feature for the
first and second frontend.
Is it possible to keep [1]  as is?

[1]
https://lore.kernel.org/xen-devel/20220106091013.126076-1-mheyne@amazon.de/
[2] https://lore.kernel.org/xen-devel/20220714224410.51147-1-sj@kernel.org/

Best regards,
Andrii

On Fri, Jul 15, 2022 at 1:15 PM Oleksandr <olekstysh@gmail.com> wrote:

>
> On 15.07.22 01:44, SeongJae Park wrote:
>
>
> Hello all.
>
> Adding Andrii Chepurnyi to CC who have played with the use-case which
> required reconnect recently and faced some issues with
> feature_persistent handling.
>
>
>
>
> > Persistent grants feature can be used only when both backend and the
> > frontend supports the feature.  The feature was always supported by
> > 'blkback', but commit aac8a70db24b ("xen-blkback: add a parameter for
> > disabling of persistent grants") has introduced a parameter for
> > disabling it runtime.
> >
> > To avoid the parameter be updated while being used by 'blkback', the
> > commit caches the parameter into 'vbd->feature_gnt_persistent' in
> > 'xen_vbd_create()', and then check if the guest also supports the
> > feature and finally updates the field in 'connect_ring()'.
> >
> > However, 'connect_ring()' could be called before 'xen_vbd_create()', so
> > later execution of 'xen_vbd_create()' can wrongly overwrite 'true' to
> > 'vbd->feature_gnt_persistent'.  As a result, 'blkback' could try to use
> > 'persistent grants' feature even if the guest doesn't support the
> > feature.
> >
> > This commit fixes the issue by moving the parameter value caching to
> > 'xen_blkif_alloc()', which allocates the 'blkif'.  Because the struct
> > embeds 'vbd' object, which will be used by 'connect_ring()' later, this
> > should be called before 'connect_ring()' and therefore this should be
> > the right and safe place to do the caching.
> >
> > Fixes: aac8a70db24b ("xen-blkback: add a parameter for disabling of
> persistent grants")
> > Cc: <stable@vger.kernel.org> # 5.10.x
> > Signed-off-by: Maximilian Heyne <mheyne@amazon.de>
> > Signed-off-by: SeongJae Park <sj@kernel.org>
> > ---
> >
> > Changes from v1[1]
> > - Avoid the behavioral change[2]
> > - Rebase on latest xen/tip/linux-next
> > - Re-work by SeongJae Park <sj@kernel.org>
> > - Cc stable@
> >
> > [1]
> https://lore.kernel.org/xen-devel/20220106091013.126076-1-mheyne@amazon.de/
> > [2]
> https://lore.kernel.org/xen-devel/20220121102309.27802-1-sj@kernel.org/
> >
> >   drivers/block/xen-blkback/xenbus.c | 15 +++++++--------
> >   1 file changed, 7 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/block/xen-blkback/xenbus.c
> b/drivers/block/xen-blkback/xenbus.c
> > index 97de13b14175..16c6785d260c 100644
> > --- a/drivers/block/xen-blkback/xenbus.c
> > +++ b/drivers/block/xen-blkback/xenbus.c
> > @@ -157,6 +157,11 @@ static int xen_blkif_alloc_rings(struct xen_blkif
> *blkif)
> >       return 0;
> >   }
> >
> > +/* Enable the persistent grants feature. */
> > +static bool feature_persistent = true;
> > +module_param(feature_persistent, bool, 0644);
> > +MODULE_PARM_DESC(feature_persistent, "Enables the persistent grants
> feature");
> > +
> >   static struct xen_blkif *xen_blkif_alloc(domid_t domid)
> >   {
> >       struct xen_blkif *blkif;
> > @@ -181,6 +186,8 @@ static struct xen_blkif *xen_blkif_alloc(domid_t
> domid)
> >       __module_get(THIS_MODULE);
> >       INIT_WORK(&blkif->free_work, xen_blkif_deferred_free);
> >
> > +     blkif->vbd.feature_gnt_persistent = feature_persistent;
> > +
> >       return blkif;
> >   }
> >
> > @@ -472,12 +479,6 @@ static void xen_vbd_free(struct xen_vbd *vbd)
> >       vbd->bdev = NULL;
> >   }
> >
> > -/* Enable the persistent grants feature. */
> > -static bool feature_persistent = true;
> > -module_param(feature_persistent, bool, 0644);
> > -MODULE_PARM_DESC(feature_persistent,
> > -             "Enables the persistent grants feature");
> > -
> >   static int xen_vbd_create(struct xen_blkif *blkif, blkif_vdev_t handle,
> >                         unsigned major, unsigned minor, int readonly,
> >                         int cdrom)
> > @@ -520,8 +521,6 @@ static int xen_vbd_create(struct xen_blkif *blkif,
> blkif_vdev_t handle,
> >       if (bdev_max_secure_erase_sectors(bdev))
> >               vbd->discard_secure = true;
> >
> > -     vbd->feature_gnt_persistent = feature_persistent;
> > -
> >       pr_debug("Successful creation of handle=%04x (dom=%u)\n",
> >               handle, blkif->domid);
> >       return 0;
>
> --
> Regards,
>
> Oleksandr Tyshchenko
>
>

--0000000000003de32205e3d6c364
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello All,<br><br>I faced the mentioned issue recently and=
 just to bring more context here is our setup:<br>We use pvblock backend fo=
r Android guest. It starts using u-boot with pvblock support(which frontend=
 doesn&#39;t support the persistent grants feature), later it loads and sta=
rts the Linux kernel(which frontend supports the persistent grants feature)=
. So in total, we have sequent two different frontends reconnection, the fi=
rst of which doesn&#39;t support persistent grants.<br>So the original patc=
h [1] perfectly solves the original issue and provides the ability to use p=
ersistent grants after the reconnection when Linux frontend which supports =
persistent grants comes into play.<br>At the same time [2] will disable the=
 persistent grants feature for the first and second frontend.<br>Is it poss=
ible to keep [1] =C2=A0as is?<br><br>[1] <a href=3D"https://lore.kernel.org=
/xen-devel/20220106091013.126076-1-mheyne@amazon.de/">https://lore.kernel.o=
rg/xen-devel/20220106091013.126076-1-mheyne@amazon.de/</a><br>[2] <a href=
=3D"https://lore.kernel.org/xen-devel/20220714224410.51147-1-sj@kernel.org/=
">https://lore.kernel.org/xen-devel/20220714224410.51147-1-sj@kernel.org/</=
a><br><div><br></div><div>Best regards,</div><div>Andrii</div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 1=
5, 2022 at 1:15 PM Oleksandr &lt;<a href=3D"mailto:olekstysh@gmail.com">ole=
kstysh@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><br>
On 15.07.22 01:44, SeongJae Park wrote:<br>
<br>
<br>
Hello all.<br>
<br>
Adding Andrii Chepurnyi to CC who have played with the use-case which <br>
required reconnect recently and faced some issues with <br>
feature_persistent handling.<br>
<br>
<br>
<br>
<br>
&gt; Persistent grants feature can be used only when both backend and the<b=
r>
&gt; frontend supports the feature.=C2=A0 The feature was always supported =
by<br>
&gt; &#39;blkback&#39;, but commit aac8a70db24b (&quot;xen-blkback: add a p=
arameter for<br>
&gt; disabling of persistent grants&quot;) has introduced a parameter for<b=
r>
&gt; disabling it runtime.<br>
&gt;<br>
&gt; To avoid the parameter be updated while being used by &#39;blkback&#39=
;, the<br>
&gt; commit caches the parameter into &#39;vbd-&gt;feature_gnt_persistent&#=
39; in<br>
&gt; &#39;xen_vbd_create()&#39;, and then check if the guest also supports =
the<br>
&gt; feature and finally updates the field in &#39;connect_ring()&#39;.<br>
&gt;<br>
&gt; However, &#39;connect_ring()&#39; could be called before &#39;xen_vbd_=
create()&#39;, so<br>
&gt; later execution of &#39;xen_vbd_create()&#39; can wrongly overwrite &#=
39;true&#39; to<br>
&gt; &#39;vbd-&gt;feature_gnt_persistent&#39;.=C2=A0 As a result, &#39;blkb=
ack&#39; could try to use<br>
&gt; &#39;persistent grants&#39; feature even if the guest doesn&#39;t supp=
ort the<br>
&gt; feature.<br>
&gt;<br>
&gt; This commit fixes the issue by moving the parameter value caching to<b=
r>
&gt; &#39;xen_blkif_alloc()&#39;, which allocates the &#39;blkif&#39;.=C2=
=A0 Because the struct<br>
&gt; embeds &#39;vbd&#39; object, which will be used by &#39;connect_ring()=
&#39; later, this<br>
&gt; should be called before &#39;connect_ring()&#39; and therefore this sh=
ould be<br>
&gt; the right and safe place to do the caching.<br>
&gt;<br>
&gt; Fixes: aac8a70db24b (&quot;xen-blkback: add a parameter for disabling =
of persistent grants&quot;)<br>
&gt; Cc: &lt;<a href=3D"mailto:stable@vger.kernel.org" target=3D"_blank">st=
able@vger.kernel.org</a>&gt; # 5.10.x<br>
&gt; Signed-off-by: Maximilian Heyne &lt;<a href=3D"mailto:mheyne@amazon.de=
" target=3D"_blank">mheyne@amazon.de</a>&gt;<br>
&gt; Signed-off-by: SeongJae Park &lt;<a href=3D"mailto:sj@kernel.org" targ=
et=3D"_blank">sj@kernel.org</a>&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; Changes from v1[1]<br>
&gt; - Avoid the behavioral change[2]<br>
&gt; - Rebase on latest xen/tip/linux-next<br>
&gt; - Re-work by SeongJae Park &lt;<a href=3D"mailto:sj@kernel.org" target=
=3D"_blank">sj@kernel.org</a>&gt;<br>
&gt; - Cc stable@<br>
&gt;<br>
&gt; [1] <a href=3D"https://lore.kernel.org/xen-devel/20220106091013.126076=
-1-mheyne@amazon.de/" rel=3D"noreferrer" target=3D"_blank">https://lore.ker=
nel.org/xen-devel/20220106091013.126076-1-mheyne@amazon.de/</a><br>
&gt; [2] <a href=3D"https://lore.kernel.org/xen-devel/20220121102309.27802-=
1-sj@kernel.org/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.=
org/xen-devel/20220121102309.27802-1-sj@kernel.org/</a><br>
&gt;<br>
&gt;=C2=A0 =C2=A0drivers/block/xen-blkback/xenbus.c | 15 +++++++--------<br=
>
&gt;=C2=A0 =C2=A01 file changed, 7 insertions(+), 8 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-bl=
kback/xenbus.c<br>
&gt; index 97de13b14175..16c6785d260c 100644<br>
&gt; --- a/drivers/block/xen-blkback/xenbus.c<br>
&gt; +++ b/drivers/block/xen-blkback/xenbus.c<br>
&gt; @@ -157,6 +157,11 @@ static int xen_blkif_alloc_rings(struct xen_blkif=
 *blkif)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +/* Enable the persistent grants feature. */<br>
&gt; +static bool feature_persistent =3D true;<br>
&gt; +module_param(feature_persistent, bool, 0644);<br>
&gt; +MODULE_PARM_DESC(feature_persistent, &quot;Enables the persistent gra=
nts feature&quot;);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0static struct xen_blkif *xen_blkif_alloc(domid_t domid)<br=
>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct xen_blkif *blkif;<br>
&gt; @@ -181,6 +186,8 @@ static struct xen_blkif *xen_blkif_alloc(domid_t d=
omid)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0__module_get(THIS_MODULE);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0INIT_WORK(&amp;blkif-&gt;free_work, xen_blki=
f_deferred_free);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0blkif-&gt;vbd.feature_gnt_persistent =3D feature_=
persistent;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return blkif;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -472,12 +479,6 @@ static void xen_vbd_free(struct xen_vbd *vbd)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0vbd-&gt;bdev =3D NULL;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -/* Enable the persistent grants feature. */<br>
&gt; -static bool feature_persistent =3D true;<br>
&gt; -module_param(feature_persistent, bool, 0644);<br>
&gt; -MODULE_PARM_DESC(feature_persistent,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Enables the per=
sistent grants feature&quot;);<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0static int xen_vbd_create(struct xen_blkif *blkif, blkif_v=
dev_t handle,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0unsigned major, unsigned minor, int readonly,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0int cdrom)<br>
&gt; @@ -520,8 +521,6 @@ static int xen_vbd_create(struct xen_blkif *blkif,=
 blkif_vdev_t handle,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bdev_max_secure_erase_sectors(bdev))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vbd-&gt;discard_=
secure =3D true;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0vbd-&gt;feature_gnt_persistent =3D feature_persis=
tent;<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;Successful creation of handle=
=3D%04x (dom=3D%u)\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0handle, blkif-&g=
t;domid);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
<br>
-- <br>
Regards,<br>
<br>
Oleksandr Tyshchenko<br>
<br>
</blockquote></div>

--0000000000003de32205e3d6c364--

