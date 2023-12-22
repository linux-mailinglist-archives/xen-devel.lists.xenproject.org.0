Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBF281CB6D
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 15:38:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659397.1028983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGgfJ-0000KN-MN; Fri, 22 Dec 2023 14:38:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659397.1028983; Fri, 22 Dec 2023 14:38:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGgfJ-0000I4-Iw; Fri, 22 Dec 2023 14:38:17 +0000
Received: by outflank-mailman (input) for mailman id 659397;
 Fri, 22 Dec 2023 14:38:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EuIk=IB=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1rGgfH-0000Hq-LY
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 14:38:15 +0000
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [2607:f8b0:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bca54a3c-a0d7-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 15:38:14 +0100 (CET)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6d87eadc43fso945959b3a.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 06:38:14 -0800 (PST)
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
X-Inumbo-ID: bca54a3c-a0d7-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703255893; x=1703860693; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=74w1MpVPP2Pqrdjl8VcbipnfkmbPb7rCjVJczW69rpE=;
        b=N+ofPuPz0zgQKd1OR6eGqX6A4CQTtineWqcjtfTJl91LFtbfvlkWXlsz4FceDK3FDT
         GfDJCmN3Z4V576soQ3Z2NVm+nwcNg+IG6GUHkj3oh/7Zs6KJEUVNFAJvx6ubqoLGqkcx
         ug6pZT3jaVCVYW4sZkehKFDJpBa1Voa8M26SAMqVA0fFtuSk4gdMpW+J2cKV7nOOPDG4
         pREElT/TNiwNQQWQjTsTZDS7r3nNMrJWv2HgdRItxQ5yB9v3gb9WYcrIL0PeTv6W92YQ
         EMLEZPqA7XEYNGlvR6/a31JECdPjXNED3Q6mOFSAN7e+kOGnHgxT4eNdb3DSigQ1iw/N
         iAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703255893; x=1703860693;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=74w1MpVPP2Pqrdjl8VcbipnfkmbPb7rCjVJczW69rpE=;
        b=ZwueQ78JTrXtKIcSdsoFLnU0G2hZt7T53w8zG2BKkOcx2lnQ7WUOOaiGJzoMb/cih7
         yZSJnQtgAQeEUyjAtiJ+/QHlmlzGxfAhvvIRkcQw5Y67MgvAZjGO9Gqfdmnege5S7bIS
         q/uZMMYa78AUQGoFrKYfgXM8cuK6BMcnIOkbj+A5/ZEYPmo9pCGeeDt7WMpOhuorJWB+
         vqzwNQlTT869abiWUOdy6yJJUw0rRGUcaETQLMA03jH09n+VJuOPydS6n8qo31BDLasc
         2rEwHDujyNlr1ES1Rub7kMsD26PIZqkBJW8Htl9+t40v2eHrpQWsMFH45jY0pqTIihdo
         HcCQ==
X-Gm-Message-State: AOJu0YzoppaUWqkUuIJti49Jw/9Bvkt+iZt0N+lo2YQzDoDw6jIzCL50
	X/qkZ0WqcvukVmmg5Gxfp+6Yu7scLPwWQn31ON/wKAw7auEpbw==
X-Google-Smtp-Source: AGHT+IE7s79rjeiQnw31V61qhQi4jojZ7oMaR083/7wO/EM0SdD4xUqJnpQNUpPAIrryqkYXWg0kja+d5pSecnEhwlI=
X-Received: by 2002:a05:6a00:4b51:b0:6d9:35c3:e7b2 with SMTP id
 kr17-20020a056a004b5100b006d935c3e7b2mr1078644pfb.11.1703255892937; Fri, 22
 Dec 2023 06:38:12 -0800 (PST)
MIME-Version: 1.0
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <64d738b7-08c1-4b2c-a828-a137c870408e@suse.com> <CAKm-UmayUxd8F337g+BnR=_50_o__oV_PeUv9Z+9gNZ5MXYmrA@mail.gmail.com>
 <b4f46a91-b3b9-49b9-9a26-e2f962dee54c@suse.com> <CAKm-UmY9yYv2gOwm-O3DF7dBBNeNjs+3pDGuU+sYgJ+OHwcLNw@mail.gmail.com>
 <CAKm-UmZ1Q77EqUit9J6RX0-MCALdu4gjaU2zrX6oneW+45a+Kw@mail.gmail.com>
 <CAKm-UmYZcsY=C2Yhmy_EeZi0iAguVH0Eqy83upBLa_ikQtPwnw@mail.gmail.com>
 <CAKm-Umapq5LW9yhSOGk8TOg1iuvUogUDKbEXbUcE5T5-vVzW3w@mail.gmail.com>
 <CAKm-UmaUZ=rj-F3RvMoR7H3OvBHm1iy4PTRZAjyi=MQUVTuYVg@mail.gmail.com>
 <CAKm-Umat77MTh6=GEuH+bf1WRX+_B4-N5hY4xwADALfhj4QCPA@mail.gmail.com>
 <6ba9568a-ff8e-48ad-907f-74303e04d3a2@suse.com> <CAKm-UmZVoUhidEV15Xk+J_XN5a2GsBqMbXL9wqdFdoAFf_u5AA@mail.gmail.com>
 <bcbceba7-42ac-45be-80ab-e3dfe7741ec6@suse.com> <2eafe45b-fd97-472c-a173-459d6ff0b957@suse.com>
 <CAKm-Umbs2D7NHFE+NW2xKOu7-AZhFpH4uzE5QTuQusnGA_eNWA@mail.gmail.com>
 <f539144c-885a-461c-a506-bdb73e626a65@suse.com> <CAKm-UmY126AfdGhWcZ3s9vwN9+ksVRRFEhOu0ZFMoDvxrqOibw@mail.gmail.com>
In-Reply-To: <CAKm-UmY126AfdGhWcZ3s9vwN9+ksVRRFEhOu0ZFMoDvxrqOibw@mail.gmail.com>
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Fri, 22 Dec 2023 15:38:01 +0100
Message-ID: <CAKm-UmZ-td2Ow+Gg=dC+ksLvOtTFjEoKo+_9ueozELuoK5zXrg@mail.gmail.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: multipart/alternative; boundary="00000000000075cfa7060d1a2a3c"

--00000000000075cfa7060d1a2a3c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 22 d=C3=A9c. 2023 =C3=A0 15:37, S=C3=A9bastien Chaumat <euidzero@gm=
ail.com> a
=C3=A9crit :

> By request of the laptop vendor (Framework) I'm going to open the bug
> @fedora for them to jump in.
>
>

 https://bugzilla.redhat.com/show_bug.cgi?id=3D2255625

S=C3=A9bastien

--00000000000075cfa7060d1a2a3c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 22 d=C3=A9c. 2023 =C3=A0=
=C2=A015:37, S=C3=A9bastien Chaumat &lt;<a href=3D"mailto:euidzero@gmail.co=
m">euidzero@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>By request of the l=
aptop vendor (Framework) I&#39;m going to open the bug @fedora for them to =
jump in.</div><span><div>=C2=A0</div></span></div></blockquote><div><br></d=
iv><div>=C2=A0<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D2255=
625">https://bugzilla.redhat.com/show_bug.cgi?id=3D2255625</a></div><div><b=
r></div><div>S=C3=A9bastien<br></div></div></div>

--00000000000075cfa7060d1a2a3c--

