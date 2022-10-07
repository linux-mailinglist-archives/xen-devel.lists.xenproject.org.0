Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E96155F73A1
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 06:51:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417370.662047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogfKo-0004aj-Vf; Fri, 07 Oct 2022 04:51:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417370.662047; Fri, 07 Oct 2022 04:51:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogfKo-0004YJ-T5; Fri, 07 Oct 2022 04:51:42 +0000
Received: by outflank-mailman (input) for mailman id 417370;
 Fri, 07 Oct 2022 04:51:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m9C0=2I=gmail.com=degakiran05@srs-se1.protection.inumbo.net>)
 id 1ogfKn-0004YD-9r
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 04:51:41 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb72fc47-45fb-11ed-964a-05401a9f4f97;
 Fri, 07 Oct 2022 06:51:40 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so1997290wmb.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Oct 2022 21:51:40 -0700 (PDT)
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
X-Inumbo-ID: bb72fc47-45fb-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pli7JPWy8ENMv4xCC2VAJwXYayvmjH1hfUTpvqISj1s=;
        b=aB+ZXT1/YOkVuMDnJyh7VryDP0CjxHvKff5oOUqWwSj3awNVUV/6tdqm2oKUHCMGZJ
         Dh4e1AHop6Rtj3NYoHOdg4Xr+eRaF/fRJENNCfOdifUDWWRSY589Q4TOqcZ3PAOcASE3
         FuxNLYxry/xO5h66kkr43Sz5T5zS/V26CLjpjor7FHYKTfIpkcJzzscWSKInT233XwK8
         5EcYIXTBZhG8jS405a+7uYwc1DR/lfpBpUHF2Pw/Jd5z7apuKhbORMENOqSoibIwtYkl
         zEeSJsjR/f92s+apvZsirJCYm8zhvcHSqR6B2pFobKAuXrzVdRWopKQwlCnRwUkzVKEz
         EWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pli7JPWy8ENMv4xCC2VAJwXYayvmjH1hfUTpvqISj1s=;
        b=aveSaGA9IOLJAf8g3I4ondJYANfvk6lfh7gS9WnWyuCqqoAjVErJ3X253AF2oR/VdQ
         HfjwZlvoRJqQWxq/utghEhrcqg5Xfs0jpe/APU24ylvtJ8kJ1DK9GEdAsbf81qqXxNZt
         S7mIJolTDTnncfWvAlkhhJY5jyippseECNePzSjYCC1qoguFd7XoLme1jEQ2WKMEY29s
         /r5XNoJR5znbRqz9WqSRKLupXod1YujM8+PTGLAy/zHi0BkcLbM6fadbps4BOHVcn8RA
         bQVrvq3JN3AHypVwWyg+bqYgTMhQLrrjD+Enq3a8eddHwSMV6uHhTQhsu+QODN5hIm/x
         yT9Q==
X-Gm-Message-State: ACrzQf3BrFwTRfblbFBokgI/N+hMzv78fkSWaOIWCwY+FGJXtnPM9W3O
	cVzq2ed61EmS6ozFRfVnM8B6u3IcWyOg9fG52hlYQwEn22E=
X-Google-Smtp-Source: AMsMyM74LrBussLZQo7ZCwsy6yJsFULNy4ok8+F3PqTPMr1InfF8dIbedUw36Mh4zOX720wz26KuPnnos1cQpzr29hk=
X-Received: by 2002:a05:600c:3781:b0:3a6:804a:afc with SMTP id
 o1-20020a05600c378100b003a6804a0afcmr8868349wmr.27.1665118299573; Thu, 06 Oct
 2022 21:51:39 -0700 (PDT)
MIME-Version: 1.0
References: <CADY+DPLf10UtUWE7Y9zZvN0NRFkGtV7ah3dg8t4wYWrF=8R2LQ@mail.gmail.com>
In-Reply-To: <CADY+DPLf10UtUWE7Y9zZvN0NRFkGtV7ah3dg8t4wYWrF=8R2LQ@mail.gmail.com>
From: dega kiran <degakiran05@gmail.com>
Date: Fri, 7 Oct 2022 10:21:00 +0530
Message-ID: <CADY+DPK7HQBYCPNoRf5KW6Zaqx6bF8fUrtywiR49zXiWkiC+zw@mail.gmail.com>
Subject: Re: Free Rtos porting on XEN
To: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>
Cc: ulien Grall <julien@xen.org>
Content-Type: multipart/alternative; boundary="000000000000c1520005ea6a906a"

--000000000000c1520005ea6a906a
Content-Type: text/plain; charset="UTF-8"

Hi Stefano Stabellini ,

Thanks for the reply.

We are currently working on *Raspberry PI 4* can you help us how we can
port *Xen with FreeRtos *on Raspberry PI4.

Is there any reference I can go through for porting Xen with FreeRtos on
Raspberry PI4.?


Thanks and regards,
Dega.

On Tue, Oct 4, 2022 at 9:48 AM dega kiran <degakiran05@gmail.com> wrote:

> Hi ,
>
> I am trying to port FREERtos on XEN . But not getting any
> concrete information for porting.
>
> I am following https://github.com/GaloisInc/FreeRTOS-Xen
>
> but getting a lot of errors.
>
> Please Let me know how to follow the porting process.
>
>
> Thank you,
> Dega.
>
>

--000000000000c1520005ea6a906a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Stefano Stabellini ,<div><br></div><div>Thanks for=
 the reply.</div><div><br></div><div>We are currently working on <b>Raspber=
ry=C2=A0PI 4</b> can you help us how we can port <b>Xen with FreeRtos </b>o=
n Raspberry=C2=A0PI4.</div><div><br></div><div>Is there any reference I can=
 go through for porting Xen with FreeRtos on Raspberry=C2=A0PI4.?</div><div=
><br></div><div><br></div><div>Thanks and regards,</div><div>Dega.=C2=A0</d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Tue, Oct 4, 2022 at 9:48 AM dega kiran &lt;<a href=3D"mailto:degakira=
n05@gmail.com">degakiran05@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi ,<div><br></div><di=
v>I am trying to port FREERtos=C2=A0on XEN . But not getting any concrete=
=C2=A0information for porting.</div><div><br></div><div>I am following=C2=
=A0<a href=3D"https://github.com/GaloisInc/FreeRTOS-Xen" dir=3D"ltr" rel=3D=
"noopener nofollow noreferrer" style=3D"text-decoration-line:none;backgroun=
d:rgba(32,33,36,0.04);font-size:14px;margin:0px;padding:0px;vertical-align:=
baseline;font-family:Roboto,sans-serif;white-space:pre-wrap" target=3D"_bla=
nk">https://github.com/GaloisInc/FreeRTOS-Xen</a></div><div><br></div><div>=
but getting a lot of errors.</div><div><br></div><div>Please Let me know ho=
w to follow the porting process.</div><div><br></div><div><br></div><div>Th=
ank you,</div><div>Dega.</div><div><br></div></div>
</blockquote></div>

--000000000000c1520005ea6a906a--

