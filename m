Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 531606F6495
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 07:57:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529560.824057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puRxM-0005VA-Ic; Thu, 04 May 2023 05:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529560.824057; Thu, 04 May 2023 05:56:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puRxM-0005Sz-Fx; Thu, 04 May 2023 05:56:44 +0000
Received: by outflank-mailman (input) for mailman id 529560;
 Thu, 04 May 2023 05:56:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iTNB=AZ=gmail.com=terryyang28@srs-se1.protection.inumbo.net>)
 id 1puRxL-0005Sq-CF
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 05:56:43 +0000
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com
 [2607:f8b0:4864:20::a33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7046a8fe-ea40-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 07:56:40 +0200 (CEST)
Received: by mail-vk1-xa33.google.com with SMTP id
 71dfb90a1353d-44f985f250aso28151e0c.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 May 2023 22:56:40 -0700 (PDT)
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
X-Inumbo-ID: 7046a8fe-ea40-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683179799; x=1685771799;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VK/HOsLMJbrMWPV7/oXJICeUdndI85E2By62v77+Wp4=;
        b=CVPuBUJ70jfuo+olUztYtGZHcgaT7XXOHxwsGCPcDKaXAZEina6PHhvYqVCD1+W6og
         m0Zo2g+9+K+W+90sghiFTQIkB7lNgChgexYKP8GaBlcct8FnvHAFOHewZtSL6JumaUDz
         V0Ls3s9JQNX3MYryDyAwfQipDXj5rtfvBzTiYvYU2W6H7/u2S3JHdz0hOwX8XcgsMOds
         N2SXNIA2Ow+kn2RLHelpzjOqXeNtd7KVFJ4FPo19hpFOkgCzUFTjNcI5p8HfYcQXqOWW
         n9xqXg7IVTmV0eY47YG2MojzgBTkG3QHi+E6a1iIZb2LnDUZK0w4BKAc7mOudrkjle/I
         z9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683179799; x=1685771799;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VK/HOsLMJbrMWPV7/oXJICeUdndI85E2By62v77+Wp4=;
        b=Qrb3VNpHF+mjqUYiIeY04FG5RZCUoRr16HQO3l8KM11Sj3nvI/KoetuGl+p1lLdeJP
         T01y6BFqPUVE3d9gxww5i+Kaffaw8ECwn94k4aHcdfHc1uNnRFyWXtaX2R90vQrKtkTT
         H+Zdb4dVIW6mfLWgGptWMBF9q4YH1lX2UHiXb53U5QQv6UibnX4tZxUeEkiI/CGTBGlF
         RfIrHvLuaYDHghPk3qc3ExTd8Bf5PLV8ueLVBrVh7r+zdpAeAhsZzJiks4nXe9I2LPib
         CXy/qd4p5YXmjH8a8SIZLEbNZmip7cDDcYdNVpE6wS2qfsLNpQJJrkdZaHqNubIOCPw8
         sMaA==
X-Gm-Message-State: AC+VfDxhafHjn8tDSBmnisdZIeIzElkdra3P3WiImhhDXZMxhITfEVJy
	rsED+AVkoHAvyLQypuebIKZnf1cXybZS4Qwwl5WQeU0J
X-Google-Smtp-Source: ACHHUZ7JaNJYTFJLwDI1ONQaLdQiWw35e54cEKfjeOHNm4IQg2S/uOx5yO3WSEwWNwWYCd0wsuZsW6T2rTceCOO7B+M=
X-Received: by 2002:a05:6102:40f:b0:430:76df:b03b with SMTP id
 d15-20020a056102040f00b0043076dfb03bmr2821153vsq.30.1683179799302; Wed, 03
 May 2023 22:56:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
 <20230502233650.20121-9-vikram.garhwal@amd.com> <AS8PR08MB79910CFF4439E503046660EF926D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To: <AS8PR08MB79910CFF4439E503046660EF926D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Terry Yang <terryyang28@gmail.com>
Date: Thu, 4 May 2023 13:56:27 +0800
Message-ID: <CABeCVi4p7S1=b0bHqFJ=MyY8Xy3nCOOC3-28wKmNSoNq=yj4fw@mail.gmail.com>
Subject: unsubscribe
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="00000000000007d79705fad7d633"

--00000000000007d79705fad7d633
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Henry Wang <Henry.Wang@arm.com>=E4=BA=8E2023=E5=B9=B45=E6=9C=884=E6=97=A5 =
=E5=91=A8=E5=9B=9B12:23=E5=86=99=E9=81=93=EF=BC=9A

> Hi Vikram,
>
> > -----Original Message-----
> > Subject: [XEN][PATCH v6 08/19] xen/device-tree: Add
> > device_tree_find_node_by_path() to find nodes in device tree
> >
> > Add device_tree_find_node_by_path() to find a matching node with path f=
or
> > a
> > dt_device_node.
> >
> > Reason behind this function:
> >     Each time overlay nodes are added using .dtbo, a new fdt(memcpy of
> >     device_tree_flattened) is created and updated with overlay nodes.
> This
> >     updated fdt is further unflattened to a dt_host_new. Next, we need
> to find
> >     the overlay nodes in dt_host_new, find the overlay node's parent in
> dt_host
> >     and add the nodes as child under their parent in the dt_host. Thus
> we need
> >     this function to search for node in different unflattened device
> trees.
> >
> > Also, make dt_find_node_by_path() static inline.
> >
> > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> > ---
> >  xen/common/device_tree.c      |  5 +++--
> >  xen/include/xen/device_tree.h | 17 +++++++++++++++--
> >  2 files changed, 18 insertions(+), 4 deletions(-)
> >
>
> [...]
>
> >  /**
> > - * dt_find_node_by_path - Find a node matching a full DT path
> > + * device_tree_find_node_by_path - Generic function to find a node
> > matching the
> > + * full DT path for any given unflatten device tree
> > + * @dt_node: The device tree to search
>
> I noticed that you missed Michal's comment here about renaming the
> "dt_node" here to "dt" to match below function prototype...
>
> >   * @path: The full path to match
> >   *
> >   * Returns a node pointer.
> >   */
> > -struct dt_device_node *dt_find_node_by_path(const char *path);
> > +struct dt_device_node *device_tree_find_node_by_path(struct
> > dt_device_node *dt,
>
> ...here. I personally agree with Michal so I think please fix the comment
> to keep consistency.
>
> The rest of the patch looks good to me, so as long as you fixed this, you
> can have my:
>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>
>
> Kind regards,
> Henry
>
>
>

--00000000000007d79705fad7d633
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Henry Wang &lt;<a href=3D"mailto:Henry.Wang@arm.com">Henry.=
Wang@arm.com</a>&gt;=E4=BA=8E2023=E5=B9=B45=E6=9C=884=E6=97=A5 =E5=91=A8=E5=
=9B=9B12:23=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">Hi Vikram,<br>
<br>
&gt; -----Original Message-----<br>
&gt; Subject: [XEN][PATCH v6 08/19] xen/device-tree: Add<br>
&gt; device_tree_find_node_by_path() to find nodes in device tree<br>
&gt; <br>
&gt; Add device_tree_find_node_by_path() to find a matching node with path =
for<br>
&gt; a<br>
&gt; dt_device_node.<br>
&gt; <br>
&gt; Reason behind this function:<br>
&gt;=C2=A0 =C2=A0 =C2=A0Each time overlay nodes are added using .dtbo, a ne=
w fdt(memcpy of<br>
&gt;=C2=A0 =C2=A0 =C2=A0device_tree_flattened) is created and updated with =
overlay nodes. This<br>
&gt;=C2=A0 =C2=A0 =C2=A0updated fdt is further unflattened to a dt_host_new=
. Next, we need to find<br>
&gt;=C2=A0 =C2=A0 =C2=A0the overlay nodes in dt_host_new, find the overlay =
node&#39;s parent in dt_host<br>
&gt;=C2=A0 =C2=A0 =C2=A0and add the nodes as child under their parent in th=
e dt_host. Thus we need<br>
&gt;=C2=A0 =C2=A0 =C2=A0this function to search for node in different unfla=
ttened device trees.<br>
&gt; <br>
&gt; Also, make dt_find_node_by_path() static inline.<br>
&gt; <br>
&gt; Signed-off-by: Vikram Garhwal &lt;<a href=3D"mailto:vikram.garhwal@amd=
.com" target=3D"_blank">vikram.garhwal@amd.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 xen/common/device_tree.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +++--<br>
&gt;=C2=A0 xen/include/xen/device_tree.h | 17 +++++++++++++++--<br>
&gt;=C2=A0 2 files changed, 18 insertions(+), 4 deletions(-)<br>
&gt; <br>
<br>
[...]<br>
<br>
&gt;=C2=A0 /**<br>
&gt; - * dt_find_node_by_path - Find a node matching a full DT path<br>
&gt; + * device_tree_find_node_by_path - Generic function to find a node<br=
>
&gt; matching the<br>
&gt; + * full DT path for any given unflatten device tree<br>
&gt; + * @dt_node: The device tree to search<br>
<br>
I noticed that you missed Michal&#39;s comment here about renaming the<br>
&quot;dt_node&quot; here to &quot;dt&quot; to match below function prototyp=
e...<br>
<br>
&gt;=C2=A0 =C2=A0* @path: The full path to match<br>
&gt;=C2=A0 =C2=A0*<br>
&gt;=C2=A0 =C2=A0* Returns a node pointer.<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt; -struct dt_device_node *dt_find_node_by_path(const char *path);<br>
&gt; +struct dt_device_node *device_tree_find_node_by_path(struct<br>
&gt; dt_device_node *dt,<br>
<br>
...here. I personally agree with Michal so I think please fix the comment<b=
r>
to keep consistency.<br>
<br>
The rest of the patch looks good to me, so as long as you fixed this, you<b=
r>
can have my:<br>
<br>
Reviewed-by: Henry Wang &lt;<a href=3D"mailto:Henry.Wang@arm.com" target=3D=
"_blank">Henry.Wang@arm.com</a>&gt;<br>
<br>
Kind regards,<br>
Henry<br>
<br>
<br>
</blockquote></div></div>

--00000000000007d79705fad7d633--

