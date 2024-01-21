Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A51835415
	for <lists+xen-devel@lfdr.de>; Sun, 21 Jan 2024 02:28:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669510.1041911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRMcH-0003wy-3Q; Sun, 21 Jan 2024 01:27:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669510.1041911; Sun, 21 Jan 2024 01:27:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRMcG-0003tv-Ut; Sun, 21 Jan 2024 01:27:16 +0000
Received: by outflank-mailman (input) for mailman id 669510;
 Sun, 21 Jan 2024 01:27:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e41Y=I7=gmail.com=simonpatp@srs-se1.protection.inumbo.net>)
 id 1rRMcG-0003tp-EQ
 for xen-devel@lists.xenproject.org; Sun, 21 Jan 2024 01:27:16 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34fc3e50-b7fc-11ee-98f2-6d05b1d4d9a1;
 Sun, 21 Jan 2024 02:27:14 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2cd8bd6ce1bso20909751fa.1
 for <xen-devel@lists.xenproject.org>; Sat, 20 Jan 2024 17:27:14 -0800 (PST)
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
X-Inumbo-ID: 34fc3e50-b7fc-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705800434; x=1706405234; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e5N5MhRE9A3q+4lk83nXJY9wxZBH8rqK8tz/Skw+pHo=;
        b=ZGn4AoST9nRGZzo2PB6sF8c4pW10/mNlonw8/7YRQzxTy2qfz2YXZQ1xIQ1xw1Puy6
         45dx67RPkMrCArjU64+JsHhk4N9D+iZFawD1l6ePkOeY4Wpo5IPdpkQBvcTLuajtwgE3
         KB9WBcpdUk+QuSpjdJzg5M8xX94l0hO6uAriJII0xFkmVpEBMZgNlSPKJOnd/DOhRyKc
         bjd899yNXcBwcq8EHLyE0WsS9ZyvnIz5If93lErUewPjNflHnxlmVfaG1ENvwdMo4yZf
         LA0T3D72MFKfmVmcXqnMIHgu/PRvHO+ADiTxb2TY9tvdaQpqjz2afFmrIksDmmlVzrux
         /bkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705800434; x=1706405234;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e5N5MhRE9A3q+4lk83nXJY9wxZBH8rqK8tz/Skw+pHo=;
        b=G2COi8Yi/M/YlMWxjAczm/KzGya+7VTn7cUAcBDbwhno83V/suHCtKYDZH8u1eCam1
         kDo4ukYeMYRivqBET2MtKszow+tzUKYc5iQ4yew+lcNNeIOVe0DuIEBWfisY0ROdSQQi
         EyOKE7XitcU0CpuCs5Y/r49Cz9mjQ5X8ttnzIoSzFlKw6q/3usyQ0GeyE+Fxx19Wskhq
         gX2WXPnTXMRh69kvhJsdwSkQs77avc2zmSeHd+cDlziBu62X+LImxeN2HSfyjQpDQ3dy
         IkOhl3ZnH1gaCvZ0F40i6yTcit6xHzi5mnAuxuDi50lgLIJ5SxTR21Fv3ejn2I0Er2IF
         6Beg==
X-Gm-Message-State: AOJu0YwW3ULQNk1E2Xk4SL2jnIxy4Yjz4Z3A14l1UmvddOGgJ6HwO3sO
	wN1Hsq6Lthn84ejC3Q4G9QUEvWudeQxkXqb5V4h36kiW31FkvNcbGibhUbik+YHIQPSg4LqTMZE
	KIAvf8NM4gS7pZKjEB4a6b4dFI9M=
X-Google-Smtp-Source: AGHT+IEmjAwsb9SDCGFHnPBDm4rt2oYj++2abDDCC3cHaHKFKZaLAMurOOwXXgUubUr3+npcQf0Oe7tzEuGG50WK8V0=
X-Received: by 2002:a2e:b0ec:0:b0:2ce:c0f:4b6 with SMTP id h12-20020a2eb0ec000000b002ce0c0f04b6mr126657ljl.39.1705800433570;
 Sat, 20 Jan 2024 17:27:13 -0800 (PST)
MIME-Version: 1.0
References: <CAOCpoWeowZPuQTeBp9nu8p8CDtE=u++wN_UqRoABZtB57D50Qw@mail.gmail.com>
 <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com> <CAOCpoWfQmkhN3hms1xuotSUZzVzR99i9cNGGU2r=yD5PjysMiQ@mail.gmail.com>
 <fa23a590-5869-4e11-8998-1d03742c5919@suse.com> <CAOCpoWf4CMkCWx8uR2NbFrZrKSS78wj1-hFsAUqsjCfsmqooVA@mail.gmail.com>
 <Zajg1O7Z52VTBq31@macbook> <CAOCpoWeO9h7b_CjJb9jtKaEUVv_=XDSVkr55QSg3ArFc4n8G2w@mail.gmail.com>
 <ZajzcpArQYQhdj3T@macbook> <ZakcdfS3UwEb0oh2@macbook> <CAOCpoWdL3YnpitZxEoFgdvtZ6juy8oykYj6fX_tv4QLvj2Fv0g@mail.gmail.com>
 <ZapG1weSIJWOkT8m@amd.com>
In-Reply-To: <ZapG1weSIJWOkT8m@amd.com>
From: Patrick Plenefisch <simonpatp@gmail.com>
Date: Sat, 20 Jan 2024 20:27:02 -0500
Message-ID: <CAOCpoWeBe5LY-JkHdPfeJZSnXnBiLEWLvXosdH2fyPvJSoDxYw@mail.gmail.com>
Subject: Re: ACPI VFCT table too short on PVH dom0 (was: Re: E820 memory
 allocation issue on Threadripper platforms)
To: Huang Rui <ray.huang@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, 
	"Chen, Jiqian" <Jiqian.Chen@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Content-Type: multipart/alternative; boundary="000000000000e69938060f6a9cdb"

--000000000000e69938060f6a9cdb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 19, 2024 at 4:54=E2=80=AFAM Huang Rui <ray.huang@amd.com> wrote=
:

> Thanks Roger to involve us. The VFCT table is to expose video BIOS image =
by
> AMD GPUs. You can see details here:
>
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/gpu/drm/amd/include/atombios.h
>
> Did you apply this patch?
>
>
> https://lore.kernel.org/xen-devel/20230312075455.450187-2-ray.huang@amd.c=
om/


Yes, that appears to be in 4.18. I recompiled and confirmed that 4.18 fails
with the same symptoms as 4.17

>
>
> Thanks,
> Ray
>
>

--000000000000e69938060f6a9cdb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 19, 2024 at 4:54=E2=80=AF=
AM Huang Rui &lt;<a href=3D"mailto:ray.huang@amd.com">ray.huang@amd.com</a>=
&gt; wrote:</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Thanks Roger to involve us. The VFCT table is to expose video BIOS image by=
<br>
AMD GPUs. You can see details here:<br>
<br>
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/tree/drivers/gpu/drm/amd/include/atombios.h" rel=3D"noreferrer" target=
=3D"_blank">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/tree/drivers/gpu/drm/amd/include/atombios.h</a><br>
<br>
Did you apply this patch?<br>
<br>
<a href=3D"https://lore.kernel.org/xen-devel/20230312075455.450187-2-ray.hu=
ang@amd.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/=
xen-devel/20230312075455.450187-2-ray.huang@amd.com/</a></blockquote><div><=
br></div><div>Yes, that appears to be in 4.18. I recompiled and confirmed t=
hat 4.18 fails with the same symptoms as 4.17 <br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><br>
<br>
Thanks,<br>
Ray<br>
<br>
</blockquote></div></div>

--000000000000e69938060f6a9cdb--

