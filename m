Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 402264D112A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 08:40:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286557.486115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRURc-0001Mf-Lg; Tue, 08 Mar 2022 07:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286557.486115; Tue, 08 Mar 2022 07:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRURc-0001K4-I1; Tue, 08 Mar 2022 07:39:44 +0000
Received: by outflank-mailman (input) for mailman id 286557;
 Tue, 08 Mar 2022 07:39:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BmU2=TT=gmail.com=trigger.huang@srs-se1.protection.inumbo.net>)
 id 1nRURb-0001Ju-Dr
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 07:39:43 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eaa948d8-9eb2-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 08:39:42 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id s25so23849442lji.5
 for <xen-devel@lists.xenproject.org>; Mon, 07 Mar 2022 23:39:42 -0800 (PST)
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
X-Inumbo-ID: eaa948d8-9eb2-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H6k1ygCh1H/HBxvkWCzBhrRDkuZ3jxNEmoVJooKWgWY=;
        b=RWy04UADJru3nZwM9Uqb67wlbVt+vZrttsH4z+LPIAIF+z0yvL3w75UDiCgJ8fWsfX
         ywi9rIYynupejXiWX5qNbc0TQ3KOOx2BLIOaZbVQafwdWS5rgE/cGWLsSYmxHCguZnAb
         cKRYQ2oPrstVKykzFiNE6+uzWWU5h28PFw7cyOAKmWRgq6Xy/YQZ7yI1t935aEhwMlzr
         w4NwUx81mon729J++xoARS89BkvA+6zxeTPkswYxsBPhWpsTlPFEdaFmQOmgrnqDa88e
         Bhx0b8sC0ynxqv4TbIN8dHmwAwZIcrOcFuRabX+ldUWdDbWdM9ryq4Uyu8nVROh57eau
         /Wgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H6k1ygCh1H/HBxvkWCzBhrRDkuZ3jxNEmoVJooKWgWY=;
        b=2gqTUIh/KbpX7/E8VST3UJMlRdfYoBKlVpAv8AKVppreoeXC8Oyr/8dUn9cYldeXhP
         /EsFBcxLxcuLIQZYbgNta07UKfFHnIbCjSkwN2XTbsCjPAn6v0LY8lYKDo7Ms6jEM93Z
         d9aD2gJ8NO1uuk7sFLrQbVyJGTuydMoeO+kyyT5VquH70McVUMpFIIAE55sxyKEuO0SK
         u0LIEdEhRv64RrTt3JYMXTLhOo0OWo/hwWliu2YT0Waav6fnWky0AXILVxXKEwfmwNBh
         rHaLAQRLnD/OWESlSIMIMvJKsyLy6VQqqjqQ0TfNBvH1ZDVKkvKuKLsKRNI2noEuWQUT
         vLGQ==
X-Gm-Message-State: AOAM533kfpGjTgMbJSaeNhbQZ3DhQQfOm4KxnujZ7OHbhM4RwFMt4JeH
	FCCAuMVJKEuVoVCQNQ5vn01HMZyLSKbTyQmFRAU=
X-Google-Smtp-Source: ABdhPJxcDF36d2wsMqbxXi8KHNReX2SgKj63WsRLRBb4noQwiwNpvfCq7lg1XGv8ICnuyuVN0kM9bXS8NlliXOEo37E=
X-Received: by 2002:a2e:9f56:0:b0:246:4d12:1652 with SMTP id
 v22-20020a2e9f56000000b002464d121652mr10361102ljk.258.1646725181559; Mon, 07
 Mar 2022 23:39:41 -0800 (PST)
MIME-Version: 1.0
References: <CANH0Q9k6SJQ+EXNZz+-ZPnPtsxHXthYcx1E6z8euSDEt7XhLQg@mail.gmail.com>
 <871qzhiwqg.fsf@linaro.org> <CANH0Q9mF-vmW6gNDWnkMKR-VGQ2YbT+_55p=8F-N_L67Wuv5NQ@mail.gmail.com>
 <CAKf6xpub8XNd+AGhcQEsQQmxvDQQDLyNYns1hoBikgijQ27C-w@mail.gmail.com>
In-Reply-To: <CAKf6xpub8XNd+AGhcQEsQQmxvDQQDLyNYns1hoBikgijQ27C-w@mail.gmail.com>
From: Trigger Huang <trigger.huang@gmail.com>
Date: Tue, 8 Mar 2022 15:39:28 +0800
Message-ID: <CANH0Q9k2+snmuPEkywn+6uR79y-rzKH3dZfKKPbXSy2qLMCRxQ@mail.gmail.com>
Subject: Re: How to create and start Xen guest VM by qemu-system-x86_64
 command line
To: Jason Andryuk <jandryuk@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="0000000000007d562305d9b015ee"

--0000000000007d562305d9b015ee
Content-Type: text/plain; charset="UTF-8"

Hi Jason,

Thanks for sharing.

Yesterday I added some hard code in libxl__build_device_model_args_new()
and it worked. :)
I think your method is much more flexible, I will have a try at it.

Regards,
Trigger



My draft patch:
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 9a8ddbe188..74961d0218 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -1346,7 +1346,7 @@ static int
libxl__build_device_model_args_new(libxl__gc *gc,
      * Ensure that by default no display backend is created. Further
      * options given below might then enable more.
      */
-    flexarray_append_pair(dm_args, "-display", "none");
+   flexarray_append_pair(dm_args, "-display", "sdl,gl=on");

     if (sdl && !is_stubdom) {
         flexarray_append(dm_args, "-sdl");
@@ -1449,9 +1449,9 @@ static int
libxl__build_device_model_args_new(libxl__gc *gc,
                 libxl__sizekb_to_mb(b_info->video_memkb)));
             break;
         case LIBXL_VGA_INTERFACE_TYPE_CIRRUS:
-            flexarray_append_pair(dm_args, "-device",
-                GCSPRINTF("cirrus-vga,vgamem_mb=%d",
-                libxl__sizekb_to_mb(b_info->video_memkb)));
+               flexarray_append_pair(dm_args, "-device", "virtio-vga-gl");
+               flexarray_append_pair(dm_args, "-vga", "none");
+               printf("Delete cirrus-vga, and add sdl display and
virtio-vga-gl!\n");
             break;
         case LIBXL_VGA_INTERFACE_TYPE_NONE:
             break;

On Tue, Mar 8, 2022 at 10:19 AM Jason Andryuk <jandryuk@gmail.com> wrote:

> On Sun, Mar 6, 2022 at 7:47 PM Trigger Huang <trigger.huang@gmail.com>
> wrote:
> >
> > Hi Alex,
> >
> > Thanks for the response.
> >
> > Actually my target is trying to enable virglrenderer on Xen based Qemu.
> Before, I have successfully enabled it on KVM based Qemu by the Qemu
> command line. Such as 'qemu-system-x86_64 -device virtio-vga-gl  xxxxxxx'
> > If change to use xl, I don't know how to set this kind of special
> option(-device virtio-vga-gl ) to qemu after I checked the xl's arguments.
> Or do you have any idea? :)
>
> You can use device_model_args in your xl.cfg:
>
>        device_model_args=[ "ARG", "ARG", ...]
>            Pass additional arbitrary options on the device-model command
> line.
>            Each element in the list is passed as an option to the device-
>            model.
>
> Regards,
> Jason
>

--0000000000007d562305d9b015ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Jason,</div><div><br></div><div>Thanks for sharing=
.</div><div><br></div><div>Yesterday I added some hard code in=20
libxl__build_device_model_args_new() and it worked. :)</div><div>I think yo=
ur method is much more flexible, I will have a try at it.<br></div><div><br=
></div><div>
Regards,

</div><div>Trigger<br></div><div><br></div><div><br></div><div><br></div><d=
iv>My draft patch:<br></div><div>diff --git a/tools/libs/light/libxl_dm.c b=
/tools/libs/light/libxl_dm.c<br>index 9a8ddbe188..74961d0218 100644<br>--- =
a/tools/libs/light/libxl_dm.c<br>+++ b/tools/libs/light/libxl_dm.c<br>@@ -1=
346,7 +1346,7 @@ static int libxl__build_device_model_args_new(libxl__gc *g=
c,<br>=C2=A0 =C2=A0 =C2=A0 * Ensure that by default no display backend is c=
reated. Further<br>=C2=A0 =C2=A0 =C2=A0 * options given below might then en=
able more.<br>=C2=A0 =C2=A0 =C2=A0 */<br>- =C2=A0 =C2=A0flexarray_append_pa=
ir(dm_args, &quot;-display&quot;, &quot;none&quot;);<br>+ =C2=A0 flexarray_=
append_pair(dm_args, &quot;-display&quot;, &quot;sdl,gl=3Don&quot;);<br><br=
>=C2=A0 =C2=A0 =C2=A0if (sdl &amp;&amp; !is_stubdom) {<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0flexarray_append(dm_args, &quot;-sdl&quot;);<br>@@ -1449,9=
 +1449,9 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libxl__sizek=
b_to_mb(b_info-&gt;video_memkb)));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0break;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case LIBXL_VGA_INT=
ERFACE_TYPE_CIRRUS:<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flexarray=
_append_pair(dm_args, &quot;-device&quot;,<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0GCSPRINTF(&quot;cirrus-vga,vgamem_mb=3D%d&quot;=
,<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libxl__sizekb=
_to_mb(b_info-&gt;video_memkb)));<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 flexarray_append_pair(dm_args, &quot;-device&quot;, &quot;vir=
tio-vga-gl&quot;);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fl=
exarray_append_pair(dm_args, &quot;-vga&quot;, &quot;none&quot;);<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;Delete cirrus-vg=
a, and add sdl display and virtio-vga-gl!\n&quot;);<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cas=
e LIBXL_VGA_INTERFACE_TYPE_NONE:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Tue, Mar 8, 2022 at 10:19 AM Jason Andryuk &lt=
;<a href=3D"mailto:jandryuk@gmail.com">jandryuk@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, Mar 6, 202=
2 at 7:47 PM Trigger Huang &lt;<a href=3D"mailto:trigger.huang@gmail.com" t=
arget=3D"_blank">trigger.huang@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Alex,<br>
&gt;<br>
&gt; Thanks for the response.<br>
&gt;<br>
&gt; Actually my target is trying to enable virglrenderer on Xen based Qemu=
. Before, I have successfully enabled it on KVM based Qemu by the Qemu comm=
and line. Such as &#39;qemu-system-x86_64 -device virtio-vga-gl=C2=A0 xxxxx=
xx&#39;<br>
&gt; If change to use xl, I don&#39;t know how to set this kind of special =
option(-device virtio-vga-gl ) to qemu after I checked the xl&#39;s argumen=
ts. Or do you have any idea? :)<br>
<br>
You can use device_model_args in your xl.cfg:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0device_model_args=3D[ &quot;ARG&quot;, &quot;ARG=
&quot;, ...]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Pass additional arbitrary options =
on the device-model command line.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Each element in the list is passed=
 as an option to the device-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0model.<br>
<br>
Regards,<br>
Jason<br>
</blockquote></div>

--0000000000007d562305d9b015ee--

