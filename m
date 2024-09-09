Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 328709713F3
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 11:38:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794091.1202789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snaqO-0008BH-R5; Mon, 09 Sep 2024 09:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794091.1202789; Mon, 09 Sep 2024 09:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snaqO-000886-O5; Mon, 09 Sep 2024 09:38:00 +0000
Received: by outflank-mailman (input) for mailman id 794091;
 Mon, 09 Sep 2024 09:37:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p3F2=QH=gmail.com=arthurborsboom@srs-se1.protection.inumbo.net>)
 id 1snaqN-000880-Os
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 09:37:59 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31f1e3be-6e8f-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 11:37:57 +0200 (CEST)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-206aee4073cso41950125ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 02:37:57 -0700 (PDT)
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
X-Inumbo-ID: 31f1e3be-6e8f-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725874676; x=1726479476; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8pjMY1AeAQj7ozKiZxS3lREYdynSr0uSPF9g4x2rCk8=;
        b=VS0yUTQ9JWuduouwkEGfFlolVP8mjr0XqG2idX0kJD8agKjZmsLdy9Y8JJstjjQt+F
         k0SEv7wBy4OD+LsbdP8jaRbzNlI/MXUuwXs4N8q4coUvAsssHkqOjQVWY2SvPty73OYU
         24YmyDO+8ROhBNTgQRuKudibiIDDqugITIPZmGSiaTIUggPkRYcM2YQ0gzMmMeWPZeYV
         Gky52EFiwmGUyLYbz53dzLmCt8WpvLabh4p/CQWELhRGB4zZIctz0iCkoCKbeG14tS/c
         yBGe7RUY11mZali0yBMioWOkc2CUNm1tcP7O7yGRsgbgA3Yagm1sNfFUZBeHWj8CL7F6
         CzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725874676; x=1726479476;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8pjMY1AeAQj7ozKiZxS3lREYdynSr0uSPF9g4x2rCk8=;
        b=L8ttoYpV9jjeBTGkUmByTLvr/yCKGNMjAqmMMciLOYDX4jq8LOfRLC+TqxCOUL57Wm
         tlmnvnvuVfnuXZW8nEPVnd0Ws2RqdSMda0NCljU8MVD5v4QYTQLoKKiN74AX0+iFsQwk
         wHQ1GC+2DbpTIEoS5RTsjJSxSzZNwFElkmomu9+oi+EL90es5Ers3w8SQhTnPIu9T8sj
         SI760+F2d0sjtmmqE7WMFZ8CCiucfIEGSto+KBFkESqIYpiIp+5nSoEZYcVV+ukF8r28
         J0dLMDuhGfGmtnCTS5TamfBAlSXwdLdDXFr4Id/wwWGJiUNjoFjhMnpBEjbNQUM5xdeX
         oyPw==
X-Forwarded-Encrypted: i=1; AJvYcCVMeyTJIS1Xo4/gM4M95pAeLKb/R8GR4jrJnI7eIBy/a6+5Mmtib/qRsXrl+6oayia6jGVAd9DK3/o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUPGrR30H1lLjPFfvQRlQrb8CNZ6sOt7DWpicYouxkTSmdn6mN
	J9GlctzmxOoLctamCsGA5T32ApkAsotsMI+9cPsr3Fh/oACqepscgDEhJFd5SGeUPgmgJQrLbnC
	ED1r0xlHW4yXAmxmr/XeysXjT0ZE=
X-Google-Smtp-Source: AGHT+IGG6H/G4Y3Gw9aKn1lFgTq2XLx19blEzoQcArHtKdOyFagWXiwBJO0m6NMxjB+Rk32TFp0CJWltIDVWKvkMltU=
X-Received: by 2002:a17:903:2306:b0:203:a279:a144 with SMTP id
 d9443c01a7336-206f0530d8dmr175641935ad.25.1725874676090; Mon, 09 Sep 2024
 02:37:56 -0700 (PDT)
MIME-Version: 1.0
References: <CALUcmUncX=LkXWeiSiTKsDY-cOe8QksWhFvcCneOKfrKd0ZajA@mail.gmail.com>
 <20240907134756.46949-1-jandryuk@gmail.com>
In-Reply-To: <20240907134756.46949-1-jandryuk@gmail.com>
From: Arthur Borsboom <arthurborsboom@gmail.com>
Date: Mon, 9 Sep 2024 11:37:39 +0200
Message-ID: <CALUcmU=xAi+fiwk5FpQd7hH2WbHYVaiiWnm_-yBkkLJBCm0tmA@mail.gmail.com>
Subject: Re: [xen_fbfront] - Xen PVH VM: kernel upgrade 6.9.10 > 6.10.7
 results in crash
To: Jason Andryuk <jandryuk@gmail.com>
Cc: oleksandr_andrushchenko@epam.com, xen-devel@lists.xenproject.org, 
	Jason Andryuk <jason.andryuk@amd.com>, stable@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000fed36a0621ac8201"

--000000000000fed36a0621ac8201
Content-Type: text/plain; charset="UTF-8"

Hi Jason,

JA> Can you give the patch below a try?  If it works, please respond with a
Tested-by.

I have tested the following.

- Built and installed the Arch Linux AUR package linux-mainline:
6.11.0-rc6-1-mainline.
- Booted in PVH > failure: VM is inaccessible.
- Booted in HVM > success: VM is accessible.
- Applied the patch to the build above.
- Booted in PVH > success: VM is accessible.

From my point of view this patch works and resolves the issue.
Hereby:

Tested-by: Arthur Borsboom <arthurborsboom@gmail.com>

Do you have an estimation in which kernel version this will land?

On Sat, 7 Sept 2024 at 15:48, Jason Andryuk <jandryuk@gmail.com> wrote:

> From: Jason Andryuk <jason.andryuk@amd.com>
>
> Hi Arthur,
>
> Can you give the patch below a try?  If it works, please respond with a
> Tested-by.  I'll then submit it with your Reported-by and Tested-by.
>
> Thanks,
> Jason
>
> [PATCH] fbdev/xen-fbfront: Assign fb_info->device
>
> Probing xen-fbfront faults in video_is_primary_device().  The passed-in
> struct device is NULL since xen-fbfront doesn't assign it and the
> memory is kzalloc()-ed.  Assign fb_info->device to avoid this.
>
> This was exposed by the conversion of fb_is_primary_device() to
> video_is_primary_device() which dropped a NULL check for struct device.
>
> Fixes: f178e96de7f0 ("arch: Remove struct fb_info from video helpers")
> CC: stable@vger.kernel.org
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> The other option would be to re-instate the NULL check in
> video_is_primary_device()
> ---
>  drivers/video/fbdev/xen-fbfront.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/video/fbdev/xen-fbfront.c
> b/drivers/video/fbdev/xen-fbfront.c
> index 66d4628a96ae..c90f48ebb15e 100644
> --- a/drivers/video/fbdev/xen-fbfront.c
> +++ b/drivers/video/fbdev/xen-fbfront.c
> @@ -407,6 +407,7 @@ static int xenfb_probe(struct xenbus_device *dev,
>         /* complete the abuse: */
>         fb_info->pseudo_palette = fb_info->par;
>         fb_info->par = info;
> +       fb_info->device = &dev->dev;
>
>         fb_info->screen_buffer = info->fb;
>
> --
> 2.43.0
>
>

--000000000000fed36a0621ac8201
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Jason,</div><div dir=3D"ltr"><br></div=
><div dir=3D"ltr">JA&gt; Can you give the patch below a try?=C2=A0 If it wo=
rks, please respond with a Tested-by.</div><div dir=3D"ltr"><br></div><div =
dir=3D"ltr">I have tested the following.</div><div dir=3D"ltr"><br></div><d=
iv dir=3D"ltr">- Built and installed the Arch Linux AUR package linux-mainl=
ine:=C2=A0<span style=3D"color:rgb(0,0,0);font-family:monospace">6.11.0-rc6=
-1-mainline.</span></div><div>- Booted in PVH &gt; failure: VM is inaccessi=
ble.<br></div><div>- Booted in HVM &gt; success: VM is accessible.</div><di=
v>- Applied the patch to the build above.</div><div>- Booted in PVH &gt;=C2=
=A0success: VM is accessible.</div><div><br></div><div>From my point of vie=
w this patch works and resolves the=C2=A0issue.</div><div>Hereby:</div><div=
><br></div><div>Tested-by: Arthur Borsboom &lt;<a href=3D"mailto:arthurbors=
boom@gmail.com">arthurborsboom@gmail.com</a>&gt;<br></div><div><br></div><d=
iv>Do you have an estimation in which kernel version this will land?</div><=
div dir=3D"ltr"><div><br></div><div>On Sat, 7 Sept 2024 at 15:48, Jason And=
ryuk &lt;<a href=3D"mailto:jandryuk@gmail.com">jandryuk@gmail.com</a>&gt; w=
rote:<br></div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">From: Jason Andryuk &lt;<a href=3D"mailto:jason.andr=
yuk@amd.com" target=3D"_blank">jason.andryuk@amd.com</a>&gt;<br>
<br>
Hi Arthur,<br>
<br>
Can you give the patch below a try?=C2=A0 If it works, please respond with =
a<br>
Tested-by.=C2=A0 I&#39;ll then submit it with your Reported-by and Tested-b=
y.<br>
<br>
Thanks,<br>
Jason<br>
<br>
[PATCH] fbdev/xen-fbfront: Assign fb_info-&gt;device<br>
<br>
Probing xen-fbfront faults in video_is_primary_device().=C2=A0 The passed-i=
n<br>
struct device is NULL since xen-fbfront doesn&#39;t assign it and the<br>
memory is kzalloc()-ed.=C2=A0 Assign fb_info-&gt;device to avoid this.<br>
<br>
This was exposed by the conversion of fb_is_primary_device() to<br>
video_is_primary_device() which dropped a NULL check for struct device.<br>
<br>
Fixes: f178e96de7f0 (&quot;arch: Remove struct fb_info from video helpers&q=
uot;)<br>
CC: <a href=3D"mailto:stable@vger.kernel.org" target=3D"_blank">stable@vger=
.kernel.org</a><br>
Signed-off-by: Jason Andryuk &lt;<a href=3D"mailto:jason.andryuk@amd.com" t=
arget=3D"_blank">jason.andryuk@amd.com</a>&gt;<br>
---<br>
The other option would be to re-instate the NULL check in<br>
video_is_primary_device()<br>
---<br>
=C2=A0drivers/video/fbdev/xen-fbfront.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/drivers/video/fbdev/xen-fbfront.c b/drivers/video/fbdev/xen-fb=
front.c<br>
index 66d4628a96ae..c90f48ebb15e 100644<br>
--- a/drivers/video/fbdev/xen-fbfront.c<br>
+++ b/drivers/video/fbdev/xen-fbfront.c<br>
@@ -407,6 +407,7 @@ static int xenfb_probe(struct xenbus_device *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* complete the abuse: */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fb_info-&gt;pseudo_palette =3D fb_info-&gt;par;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fb_info-&gt;par =3D info;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fb_info-&gt;device =3D &amp;dev-&gt;dev;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fb_info-&gt;screen_buffer =3D info-&gt;fb;<br>
<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div></div>

--000000000000fed36a0621ac8201--

