Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC6D223653
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 09:57:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwLEq-00043h-HI; Fri, 17 Jul 2020 07:57:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YfW4=A4=redhat.com=mcascell@srs-us1.protection.inumbo.net>)
 id 1jwLCf-0003zk-6h
 for xen-devel@lists.xen.org; Fri, 17 Jul 2020 07:54:45 +0000
X-Inumbo-ID: c4f333ee-c802-11ea-bb8b-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c4f333ee-c802-11ea-bb8b-bc764e2007e4;
 Fri, 17 Jul 2020 07:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594972480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mCVsudiUaJnZfsa/Js80mZXCIgbfZRyKNbODyzDeHsc=;
 b=dDFq5leE4PegyJBPQ2PL/Sc8qZVh/IdIpJ/aEJ2va+4DJvxvmu1BO810e1DrgwasSYoibq
 LjJSjGGDtk3aRk2XHbX0Uq0mN+8G/0yscW5MEnLmyBhwaBowyIrKU83dBgowbr8dFQrEnb
 grxs2C4Hl67gspLJmz7TaciNkcZbXOo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-IB7N8f-FN0KslI3AfRGdPg-1; Fri, 17 Jul 2020 03:54:33 -0400
X-MC-Unique: IB7N8f-FN0KslI3AfRGdPg-1
Received: by mail-ed1-f71.google.com with SMTP id u25so5396655edq.1
 for <xen-devel@lists.xen.org>; Fri, 17 Jul 2020 00:54:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mCVsudiUaJnZfsa/Js80mZXCIgbfZRyKNbODyzDeHsc=;
 b=ICPnR83sorxmZEHOrFccK759XtqMVQ7Z3QFK71k76HncC+OgGVKaDTuWA3Y1hIwbbw
 zLKdU6FU4GhHX3AgHS+Gkfwy+GQvLthWzSMbl5ii3GrGsMuVrzwNFbsvb6UBpRWtkYYM
 hJJOZ7UX+isCXO9fKw0Qeui2jmlzM9y/zJPqPi8lIIkVgh5cQ7V9p0rIjjD8sXSEydzL
 aWUI9D9xzl+v7Fl9tpGh+Yf8M+77HaoTI+A3KBKv5gZKNKuXsdr/ItTcDeQKuuqDP/hR
 RbpqaGcVJE13VsUcHHgDpu4x89lAI5O+AG3UMltVjT4B4B6bk6VdZAgQ/2yVqs+ZwWdy
 PsQQ==
X-Gm-Message-State: AOAM530PU+P5PUK3ykSJllm2DnnBTh4XABZpVzJXod8x6uMICEuTStxW
 FxdBXZ/znOix5/lmR3CaPUFDN83VXUg2yGJUJtn0eR4uetkwAWfljie2a0EiyqMvGjFXdDAD1Ub
 EeT+MLaFnAeDMiPqZoRpeYYJmZDvYBA7JWg==
X-Received: by 2002:a05:6402:128c:: with SMTP id
 w12mr8386843edv.65.1594972472439; 
 Fri, 17 Jul 2020 00:54:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLKN6gyw2bSTiwmuJkYyGhJ40svEPXSZ9d0JZod1YuwomtXujKsvrP2uzhY6aXV7fbZddiMBwbXT37wvkoyuk=
X-Received: by 2002:a05:6402:128c:: with SMTP id
 w12mr8386835edv.65.1594972472226; 
 Fri, 17 Jul 2020 00:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <E1jw3ms-0006i6-Se@xenbits.xenproject.org>
In-Reply-To: <E1jw3ms-0006i6-Se@xenbits.xenproject.org>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Fri, 17 Jul 2020 09:54:21 +0200
Message-ID: <CAA8xKjVib9UERsMrAy3nNdVssNxLciXTmmhmXqq1gvhO16URew@mail.gmail.com>
Subject: Re: [oss-security] Xen Security Advisory 329 v2 - Linux ioperm bitmap
 context switching issues
To: oss-security@lists.openwall.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000a245b105aa9e773c"
X-Mailman-Approved-At: Fri, 17 Jul 2020 07:56:59 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-users@lists.xen.org, xen-announce@lists.xen.org,
 "Xen.org security team" <security-team-members@xen.org>,
 xen-devel@lists.xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--000000000000a245b105aa9e773c
Content-Type: text/plain; charset="UTF-8"

Hello,

Will a CVE be assigned to this flaw?

Thanks,

On Thu, Jul 16, 2020 at 3:21 PM Xen.org security team <security@xen.org>
wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA256
>
>                     Xen Security Advisory XSA-329
>                               version 2
>
>              Linux ioperm bitmap context switching issues
>
> UPDATES IN VERSION 2
> ====================
>
> Public release.
>
> ISSUE DESCRIPTION
> =================
>
> Linux 5.5 overhauled the internal state handling for the iopl() and
> ioperm()
> system calls.  Unfortunately, one aspect on context switch wasn't wired up
> correctly for the Xen PVOps case.
>
> IMPACT
> ======
>
> IO port permissions don't get rescinded when context switching to an
> unprivileged task.  Therefore, all userspace can use the IO ports granted
> to
> the most recently scheduled task with IO port permissions.
>
> VULNERABLE SYSTEMS
> ==================
>
> Only x86 guests are vulnerable.
>
> All versions of Linux from 5.5 are potentially vulnerable.
>
> Linux is only vulnerable when running as x86 PV guest.  Linux is not
> vulnerable when running as an x86 HVM/PVH guests.
>
> The vulnerability can only be exploited in domains which have been granted
> access to IO ports by Xen.  This is typically only the hardware domain, and
> guests configured with PCI Passthrough.
>
> MITIGATION
> ==========
>
> Running only HVM/PVH guests avoids the vulnerability.
>
> CREDITS
> =======
>
> This issue was discovered by Andy Lutomirski.
>
> RESOLUTION
> ==========
>
> Applying the appropriate attached patch resolves this issue.
>
> xsa329.patch           Linux 5.5 and later
>
> $ sha256sum xsa329*
> cdb5ac9bfd21192b5965e8ec0a1c4fcf12d0a94a962a8158cd27810e6aa362f0
> xsa329.patch
> $
>
> DEPLOYMENT DURING EMBARGO
> =========================
>
> Deployment of the patches and/or mitigations described above (or
> others which are substantially similar) is permitted during the
> embargo, even on public-facing systems with untrusted guest users and
> administrators.
>
> But: Distribution of updated software is prohibited (except to other
> members of the predisclosure list).
>
> Predisclosure list members who wish to deploy significantly different
> patches and/or mitigations, please contact the Xen Project Security
> Team.
>
>
> (Note: this during-embargo deployment notice is retained in
> post-embargo publicly released Xen Project advisories, even though it
> is then no longer applicable.  This is to enable the community to have
> oversight of the Xen Project Security Team's decisionmaking.)
>
> For more information about permissible uses of embargoed information,
> consult the Xen Project community's agreed Security Policy:
>   http://www.xenproject.org/security-policy.html
> -----BEGIN PGP SIGNATURE-----
>
> iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAl8QU6EMHHBncEB4ZW4u
> b3JnAAoJEIP+FMlX6CvZ/sEIAMiCOnz119KTlRU50HTwa4pvIgLphf9htTbPzHXS
> iEb8yINqMxmep8NRcAzwFREQP+Z4Tue1upt31Vx0RPkFZpUklLuuBSXsV0JA7+UM
> LSGyWhkzDdnfj6iPUHycGmFzRTzkbB7qfcMj7khCvuYtSNbTUdOgUq04ngZksrSJ
> UMhfgUNKXawULKvVe7572L/AQTmMXK8eaolb+eWtf1U2pFkZQR8GWoLmiFbKLks2
> X2tRUF4U4cHEBzxXRzYrD1ArWLajqK6hQmauwgkCCSowvCHoD1dTv55GlrlEo4od
> MSB6YOVLl7HJuUw1GmwlKjA8XqStHq1Fi0urvlKCfHfK2Wk=
> =MP+m
> -----END PGP SIGNATURE-----
>


-- 
Mauro Matteo Cascella, Red Hat Product Security
6F78 E20B 5935 928C F0A8  1A9D 4E55 23B8 BB34 10B0

--000000000000a245b105aa9e773c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>Will a CVE be assigned to this f=
law?</div><div><br></div><div>Thanks,</div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 16, 2020 at 3:21 PM =
Xen.org security team &lt;<a href=3D"mailto:security@xen.org">security@xen.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">-----BEGIN PGP SIGNED MESSAGE-----<br>
Hash: SHA256<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Xen S=
ecurity Advisory XSA-329<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 version 2<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Linux ioperm bitmap context=
 switching issues<br>
<br>
UPDATES IN VERSION 2<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
Public release.<br>
<br>
ISSUE DESCRIPTION<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
Linux 5.5 overhauled the internal state handling for the iopl() and ioperm(=
)<br>
system calls.=C2=A0 Unfortunately, one aspect on context switch wasn&#39;t =
wired up<br>
correctly for the Xen PVOps case.<br>
<br>
IMPACT<br>
=3D=3D=3D=3D=3D=3D<br>
<br>
IO port permissions don&#39;t get rescinded when context switching to an<br=
>
unprivileged task.=C2=A0 Therefore, all userspace can use the IO ports gran=
ted to<br>
the most recently scheduled task with IO port permissions.<br>
<br>
VULNERABLE SYSTEMS<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
Only x86 guests are vulnerable.<br>
<br>
All versions of Linux from 5.5 are potentially vulnerable.<br>
<br>
Linux is only vulnerable when running as x86 PV guest.=C2=A0 Linux is not<b=
r>
vulnerable when running as an x86 HVM/PVH guests.<br>
<br>
The vulnerability can only be exploited in domains which have been granted<=
br>
access to IO ports by Xen.=C2=A0 This is typically only the hardware domain=
, and<br>
guests configured with PCI Passthrough.<br>
<br>
MITIGATION<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
Running only HVM/PVH guests avoids the vulnerability.<br>
<br>
CREDITS<br>
=3D=3D=3D=3D=3D=3D=3D<br>
<br>
This issue was discovered by Andy Lutomirski.<br>
<br>
RESOLUTION<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
Applying the appropriate attached patch resolves this issue.<br>
<br>
xsa329.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Linux 5.5 and later<br=
>
<br>
$ sha256sum xsa329*<br>
cdb5ac9bfd21192b5965e8ec0a1c4fcf12d0a94a962a8158cd27810e6aa362f0=C2=A0 xsa3=
29.patch<br>
$<br>
<br>
DEPLOYMENT DURING EMBARGO<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
<br>
<br>
Deployment of the patches and/or mitigations described above (or<br>
others which are substantially similar) is permitted during the<br>
embargo, even on public-facing systems with untrusted guest users and<br>
administrators.<br>
<br>
But: Distribution of updated software is prohibited (except to other<br>
members of the predisclosure list).<br>
<br>
Predisclosure list members who wish to deploy significantly different<br>
patches and/or mitigations, please contact the Xen Project Security<br>
Team.<br>
<br>
<br>
(Note: this during-embargo deployment notice is retained in<br>
post-embargo publicly released Xen Project advisories, even though it<br>
is then no longer applicable.=C2=A0 This is to enable the community to have=
<br>
oversight of the Xen Project Security Team&#39;s decisionmaking.)<br>
<br>
For more information about permissible uses of embargoed information,<br>
consult the Xen Project community&#39;s agreed Security Policy:<br>
=C2=A0 <a href=3D"http://www.xenproject.org/security-policy.html" rel=3D"no=
referrer" target=3D"_blank">http://www.xenproject.org/security-policy.html<=
/a><br>
-----BEGIN PGP SIGNATURE-----<br>
<br>
iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAl8QU6EMHHBncEB4ZW4u<br>
b3JnAAoJEIP+FMlX6CvZ/sEIAMiCOnz119KTlRU50HTwa4pvIgLphf9htTbPzHXS<br>
iEb8yINqMxmep8NRcAzwFREQP+Z4Tue1upt31Vx0RPkFZpUklLuuBSXsV0JA7+UM<br>
LSGyWhkzDdnfj6iPUHycGmFzRTzkbB7qfcMj7khCvuYtSNbTUdOgUq04ngZksrSJ<br>
UMhfgUNKXawULKvVe7572L/AQTmMXK8eaolb+eWtf1U2pFkZQR8GWoLmiFbKLks2<br>
X2tRUF4U4cHEBzxXRzYrD1ArWLajqK6hQmauwgkCCSowvCHoD1dTv55GlrlEo4od<br>
MSB6YOVLl7HJuUw1GmwlKjA8XqStHq1Fi0urvlKCfHfK2Wk=3D<br>
=3DMP+m<br>
-----END PGP SIGNATURE-----<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Mauro Matteo Cascella, Red Hat =
Product Security<div>6F78 E20B 5935 928C F0A8=C2=A0 1A9D 4E55 23B8 BB34 10B=
0<br></div></div></div>

--000000000000a245b105aa9e773c--


