Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1977803E36
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 20:17:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647284.1010252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAERT-0006qf-CE; Mon, 04 Dec 2023 19:17:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647284.1010252; Mon, 04 Dec 2023 19:17:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAERT-0006oh-9f; Mon, 04 Dec 2023 19:17:19 +0000
Received: by outflank-mailman (input) for mailman id 647284;
 Mon, 04 Dec 2023 19:17:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JJkP=HP=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1rAERR-0006ob-He
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 19:17:17 +0000
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [2607:f8b0:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbf7a812-92d9-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 20:17:16 +0100 (CET)
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-5c66e7eafabso1598207a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 11:17:16 -0800 (PST)
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
X-Inumbo-ID: bbf7a812-92d9-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701717435; x=1702322235; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xu1dydmfdjg2ZqHXnRrl+/wMsmtepwWqFi5Gg8jzvBw=;
        b=hX2wnblQzFOlusXGJtcotFJmo1Lb1t391Pa0RZE1X8XFwkwgjeynSnxlCaLSEuKQDD
         LT94hjf8QfvZFwV+8YlhK7ATQIwyFGlSg06uSAnqni217P93vd0n/eZKGTvMZAAQ0JEW
         jpQORIQQqzTOkhth1SnwdgfcTyC+xWudYVbyNKrY4iPHqvFFO9IqVYYy+K71ZBVfAT4b
         ud7N5Ju37BQ7+r/eEWIFOWV3fJHlsPdrcbOs8gzy7lYrj2lw+3DtVzTDeoC7ApinKE4t
         L8A71PufgneRs/binp/L3wm4jjJTpmkAVeqe9qQids8bs3CP9w+gTMhsph1wfAb0Q4bD
         ddgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701717435; x=1702322235;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xu1dydmfdjg2ZqHXnRrl+/wMsmtepwWqFi5Gg8jzvBw=;
        b=nacz+G+l1Wy4mQCwcgH0KQx3EZqP5CRKU1jSae28Ue3DtCvl/QdAFGiTpIi/aG6BjY
         iUqxKvo/Psj2nQqgEvJbPWfP9h2g8DracWXUdlkIJqjE9clKXA7n+6uis6kQveuZfV7/
         3QTGx0k+6xVsAPWdT8LrtLcmSNtyC28qfp1W/5jVRGGl2JOfFb2Ara0kmPp1d5OBmBU3
         4+UPWpv7T+EzmtGb9C1DGGZaCqxrmTKRz1A7jUuqW6iUilma3aXV/WAGmsYcgJqNssAl
         NgGHO3nD6XOWgWb5pkuVThlM+UfzKc+gZiN2DHrUBzdDDr1F8CDmQHy8ZdiitTsOgpC3
         Da6g==
X-Gm-Message-State: AOJu0Yxo6sfHZ/iXI2DY1ClpzjtLE/3rm4ShsXkdugfOAPYr+FFoRQOX
	6tJk2Psh6KUjcH1lkx2OWlrAsC40WFjVFsqixtWbM1gA
X-Google-Smtp-Source: AGHT+IFCM0M7m9aM5X139KyNKfphwm8qLfg2xClXpoq1RsGvOgg+C10YW4Bk4r0Si/EZNCKQoj6DejJU8l/3Q4T9ask=
X-Received: by 2002:a17:90a:a016:b0:286:6cc0:cac6 with SMTP id
 q22-20020a17090aa01600b002866cc0cac6mr50502pjp.61.1701717434391; Mon, 04 Dec
 2023 11:17:14 -0800 (PST)
MIME-Version: 1.0
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <7f34d258-97fa-43e8-8d67-ac9dc93213af@suse.com>
In-Reply-To: <7f34d258-97fa-43e8-8d67-ac9dc93213af@suse.com>
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Mon, 4 Dec 2023 20:17:02 +0100
Message-ID: <CAKm-UmYGTLY0fTh4zvj-xrA3Tp+Oj+ES61pncG7ze0QnP4o=FQ@mail.gmail.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="0000000000002f8487060bb3f772"

--0000000000002f8487060bb3f772
Content-Type: multipart/alternative; boundary="0000000000002f8486060bb3f770"

--0000000000002f8486060bb3f770
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 4 d=C3=A9c. 2023 =C3=A0 10:06, Jan Beulich <jbeulich@suse.com> a =
=C3=A9crit :

> On 03.12.2023 10:56, S=C3=A9bastien Chaumat wrote:
> > Hello,
> >
> >  Trying to get the Framework Laptop 13 AMD to work with QubesOS I hit t=
he
> > following Xen issue :
> >
> > Xen version : 4.17.2
>
+ tested with 4.18.0


> > Kernel : 6.5.12-300.fc39.x86_64
> > CPU  model name : AMD Ryzen 7 7840U w/ Radeon  780M Graphics
>


> > [    2.464598] amd_gpio AMDI0030:00: failed to enable wake-up interrupt
>
> Possibly releated to this. You'll want to obtain a full-verbosity
> hypervisor
> log with a debug hypervisor, as there may be hypervisor debug messages
> telling us what Xen may not like.
>

xl dmesg with some traces attached.

--0000000000002f8486060bb3f770
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 4 d=C3=A9c. 2023 =C3=A0=
=C2=A010:06, Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=3D=
"_blank">jbeulich@suse.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On 03.12.2023 10:56, S=C3=A9bastien =
Chaumat wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt;=C2=A0 Trying to get the Framework Laptop 13 AMD to work with QubesOS I=
 hit the<br>
&gt; following Xen issue :<br>
&gt; <br>
&gt; Xen version : 4.17.2<br></blockquote><div>+ tested with 4.18.0</div><d=
iv>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; Kernel : 6.5.12-300.fc39.x86_64<br>
&gt; CPU=C2=A0 model name : AMD Ryzen 7 7840U w/ Radeon=C2=A0 780M Graphics=
<br></blockquote><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; [=C2=A0 =C2=A0 2.464598] amd_gpio AMDI0030:00: failed to enable wake-u=
p interrupt<br>
<br>
Possibly releated to this. You&#39;ll want to obtain a full-verbosity hyper=
visor<br>
log with a debug hypervisor, as there may be hypervisor debug messages<br>
telling us what Xen may not like.<br></blockquote><div>=C2=A0</div><div>xl =
dmesg with some traces attached.</div><div><br></div></div></div>

--0000000000002f8486060bb3f770--
--0000000000002f8487060bb3f772
Content-Type: application/gzip; name="xl-dmesg-4.18.txt.gz"
Content-Disposition: attachment; filename="xl-dmesg-4.18.txt.gz"
Content-Transfer-Encoding: base64
Content-ID: <f_lprajrnc0>
X-Attachment-Id: f_lprajrnc0

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
--0000000000002f8487060bb3f772--

