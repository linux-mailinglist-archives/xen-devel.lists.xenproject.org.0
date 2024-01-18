Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EC8831D2B
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 17:04:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668841.1041335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQUsB-0000xo-EB; Thu, 18 Jan 2024 16:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668841.1041335; Thu, 18 Jan 2024 16:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQUsB-0000wD-BR; Thu, 18 Jan 2024 16:04:07 +0000
Received: by outflank-mailman (input) for mailman id 668841;
 Thu, 18 Jan 2024 16:04:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fErA=I4=gmail.com=simonpatp@srs-se1.protection.inumbo.net>)
 id 1rQUs9-0000w5-OR
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 16:04:05 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 338f1b1d-b61b-11ee-98f2-6d05b1d4d9a1;
 Thu, 18 Jan 2024 17:04:04 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2cceb5f0918so131364221fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jan 2024 08:04:04 -0800 (PST)
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
X-Inumbo-ID: 338f1b1d-b61b-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705593843; x=1706198643; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TKtKOWW1ww90uIePsRdVa5LNuR/oS4oGJ0D+giWI9AU=;
        b=T8L7RAisdNZbmv5+9JGG5iOwlhRq4qQQm/+5sGxO1xj5wcjfi7mBdVteoPhFuu4/gu
         JF3KgFZiWMEXTHdUIgjsQ2NExl2It9XniG+ILZy+GCAcaS9S7y1PFVURhJBtDdbaowvs
         SKQx1xoL9aNJkO+b6hAsFwL/il0FKELelOClqOvzCfiWU3ORzXD9xBoPbSOgNsbxkpDL
         igR08NPfe2ubBcHLyGmWKjeyYH0SrQTWW4FtPd5a4JEj9Okm9nVJ9NKnceBi8nRcK6Gy
         42QMWftACs2RYAexs389WETsedSSe8HJkfDjxs1Ti6uZ9z/GNa7gcLAckT7fWjPWSd91
         BB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705593843; x=1706198643;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TKtKOWW1ww90uIePsRdVa5LNuR/oS4oGJ0D+giWI9AU=;
        b=r+kqjM9kSD7HxFSCn6kr60+KtFmVsQf0iV2nmQUy98x1KkfQTM5BvDZN7KqS/oiYjV
         V11N38IwHDVkzbrFmVBgKesiivEDn70Nn1j6auKJNVglf7oYGaUqwPq9RayYKkrJGf4T
         KWEDBlqcZEt2qqzF4g6FnnEtrSv9Qumj0RDAllOViU5WwhrlcJINooQEtVGzPKyheKEI
         yNxr2GKz9DeKWyVDnqeuM/Ckle77F9hgXjMYm1jSppWlkb4A4OgNTgSQxgBa6zQVqrkF
         Kmnpatbb9Bv0jIvg7VmrjUnPnRJJQQskYjTw2YXeqGPR13jKuVNqR1TJPviswmo++AcP
         9JKA==
X-Gm-Message-State: AOJu0Yy8OtgUr8sVCh43io0g7pVP/Jts8NeGaYUX0BptF8Qn7vQ6OreH
	kwCtB02BCXmZDNM0NsFAe54QSW2Vt2JNNXblOcs8BxO+aDMiU4d+BD6LoE4Y2LPl9GMEHEAShER
	9dwuWf32BV3fFNivycblrPqAvKFc=
X-Google-Smtp-Source: AGHT+IHo4aD34Bivhv/cWMi1W1hGYTP7pQaj/qkbwZHfFramqRKnm74WFj7MpDhbUi30XIUMEatg/quapaOhg2VVGQo=
X-Received: by 2002:a2e:9c47:0:b0:2cc:d864:124e with SMTP id
 t7-20020a2e9c47000000b002ccd864124emr371952ljj.18.1705593843302; Thu, 18 Jan
 2024 08:04:03 -0800 (PST)
MIME-Version: 1.0
References: <CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com>
 <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com> <dcaf9d8d-ad5a-4714-936b-79ed0e587f9d@suse.com>
 <CAOCpoWeowZPuQTeBp9nu8p8CDtE=u++wN_UqRoABZtB57D50Qw@mail.gmail.com>
 <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com> <CAOCpoWfQmkhN3hms1xuotSUZzVzR99i9cNGGU2r=yD5PjysMiQ@mail.gmail.com>
 <fa23a590-5869-4e11-8998-1d03742c5919@suse.com> <CAOCpoWf4CMkCWx8uR2NbFrZrKSS78wj1-hFsAUqsjCfsmqooVA@mail.gmail.com>
 <Zajg1O7Z52VTBq31@macbook> <CAOCpoWeO9h7b_CjJb9jtKaEUVv_=XDSVkr55QSg3ArFc4n8G2w@mail.gmail.com>
 <ZajzcpArQYQhdj3T@macbook>
In-Reply-To: <ZajzcpArQYQhdj3T@macbook>
From: Patrick Plenefisch <simonpatp@gmail.com>
Date: Thu, 18 Jan 2024 11:03:51 -0500
Message-ID: <CAOCpoWdx=h-RDZ0j6tthaiGeZo_4GidLsic4Js1G-F+kswzuoQ@mail.gmail.com>
Subject: Re: E820 memory allocation issue on Threadripper platforms
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, 
	Juergen Gross <jgross@suse.com>
Content-Type: multipart/alternative; boundary="000000000000294764060f3a837a"

--000000000000294764060f3a837a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 4:46=E2=80=AFAM Roger Pau Monn=C3=A9 <roger.pau@cit=
rix.com>
wrote:

> >
> > Luckily linux logs are mercifully short. Append this to
> > xen-4.18p_grub_linuxoffset_pvh.log:
> >
> > [    0.778770] i2c_designware AMDI0010:00: Unknown Synopsys component
> type:
> > 0xffffffff
> > [    0.914664] amd_gpio AMDI0030:00: error -EINVAL: IRQ index 0 not fou=
nd
> > [    0.930112] xen_mcelog: Failed to get CPU numbers
> > [    8.324907] ccp 0000:06:00.5: pcim_iomap_regions failed (-16)
> > [    8.338604] sp5100-tco sp5100-tco: Watchdog hardware is disabled
> > [    8.909366] [drm:radeon_get_bios [radeon]] *ERROR* ACPI VFCT table
> > present but broken (too short #2)
>
> Hm, interesting.  I will have to add more debug in order to check
> what's going on here, seems like the table is corrupted somehow.
>
> Would you be able to build a new version of Xen if I provide you with
> an extra debug patch?
>

Yes, I now have a build env setup for testing xen and the linux kernel.


>
> Thanks, Roger.
>

--000000000000294764060f3a837a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 18, 2024 at 4:46=E2=80=AF=
AM Roger Pau Monn=C3=A9 &lt;<a href=3D"mailto:roger.pau@citrix.com">roger.p=
au@citrix.com</a>&gt; wrote:</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; <br>
&gt; Luckily linux logs are mercifully short. Append this to<br>
&gt; xen-4.18p_grub_linuxoffset_pvh.log:<br>
&gt; <br>
&gt; [=C2=A0 =C2=A0 0.778770] i2c_designware AMDI0010:00: Unknown Synopsys =
component type:<br>
&gt; 0xffffffff<br>
&gt; [=C2=A0 =C2=A0 0.914664] amd_gpio AMDI0030:00: error -EINVAL: IRQ inde=
x 0 not found<br>
&gt; [=C2=A0 =C2=A0 0.930112] xen_mcelog: Failed to get CPU numbers<br>
&gt; [=C2=A0 =C2=A0 8.324907] ccp 0000:06:00.5: pcim_iomap_regions failed (=
-16)<br>
&gt; [=C2=A0 =C2=A0 8.338604] sp5100-tco sp5100-tco: Watchdog hardware is d=
isabled<br>
&gt; [=C2=A0 =C2=A0 8.909366] [drm:radeon_get_bios [radeon]] *ERROR* ACPI V=
FCT table<br>
&gt; present but broken (too short #2)<br>
<br>
Hm, interesting.=C2=A0 I will have to add more debug in order to check<br>
what&#39;s going on here, seems like the table is corrupted somehow.<br>
<br>
Would you be able to build a new version of Xen if I provide you with<br>
an extra debug patch?<br></blockquote><div><br></div><div>Yes, I now have a=
 build env setup for testing xen and the linux kernel.</div><div>=C2=A0<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks, Roger.<br>
</blockquote></div></div>

--000000000000294764060f3a837a--

