Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F993773AB
	for <lists+xen-devel@lfdr.de>; Sat,  8 May 2021 20:38:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124415.234722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lfRpv-0004YP-Qk; Sat, 08 May 2021 18:37:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124415.234722; Sat, 08 May 2021 18:37:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lfRpv-0004Vg-Nl; Sat, 08 May 2021 18:37:59 +0000
Received: by outflank-mailman (input) for mailman id 124415;
 Sat, 08 May 2021 18:37:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sqKf=KD=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1lfRpt-0004VZ-Tu
 for xen-devel@lists.xenproject.org; Sat, 08 May 2021 18:37:57 +0000
Received: from mail-qk1-x72a.google.com (unknown [2607:f8b0:4864:20::72a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79f3ee9b-e0eb-4831-a470-1a29debc4a2f;
 Sat, 08 May 2021 18:37:56 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id k127so11803211qkc.6
 for <xen-devel@lists.xenproject.org>; Sat, 08 May 2021 11:37:56 -0700 (PDT)
Received: from smtpclient.apple ([199.33.71.18])
 by smtp.gmail.com with ESMTPSA id 28sm2619888qkr.36.2021.05.08.11.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 May 2021 11:37:56 -0700 (PDT)
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
X-Inumbo-ID: 79f3ee9b-e0eb-4831-a470-1a29debc4a2f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:message-id:date
         :cc:to;
        bh=GYEZwNqgXbl+DgKBwxyaj9ItIrgeS+e3z48vLMFgvdU=;
        b=kHjRvNPn61k8yLJgxnkBOjZenTSr7RToDiCO3CJssOxRZMXG5Eec0W0oZFCoWiZrLW
         Il6M3rf3JlPs7sVlPvQ3SdtMs4nCGS7sXjvvPu8B8gmi+9NjI/HMz0c/up0p7vUHxuMF
         iY1p08hEPHJ3z2J07WM11ayvNBB1xTKX8KrvpW5WLLh+3py6f+O9NLjKurBsvdApzlm5
         m9ikqSksGRdhCnkFfH5TfWuQ5tejSQmTr4e0sOr5LxbI/a70vsGwrucL7cr0rN3YpwVQ
         mvn5fJ7Naa/NrGvLibvurqEIfKHNvoGfbYlDZHWksj5xvQkTaxBzJF8HyiTWRhxFrnnu
         ko9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:message-id:date:cc:to;
        bh=GYEZwNqgXbl+DgKBwxyaj9ItIrgeS+e3z48vLMFgvdU=;
        b=UWk0+U7sOrxEDJkUtLhrskHg+lYetH22KKVEVsx/O+nZGLNnCgVVtSKzbYcxa7cSrx
         +c2x2S28qT+o88AM8f0EhcptVFN4tsFW1wRaR0URk+jZLmiW28LWF11i0Yr6WnQ1vPLw
         Yj6l6Bw+RHOVwXOqmd5/pFxUmOQTcnxyjbspu/cK5jwRf5qZsmqPGCbJx5I3By3uDdb5
         DtDrv5SplnI6UqHxLYM++5rrQndKZmmCal+zHSLITKvDsrH4rwPDkFOx7gNmDvF8dIG+
         JmiECQDwyoKAtO5hrzQjS+FNSM5ju6CcT6nZDHXWDsugm2W5PeNE7srCLUI6XWPRknYg
         fXcg==
X-Gm-Message-State: AOAM5311NflEkhC3UfP8C18UwDUDMUCWhwXa357WNSi3+FKC4CNzl25O
	mJx9UEaEtt7NDaklpWMSKXw=
X-Google-Smtp-Source: ABdhPJz70fBlJjDntjBTpu84IHM0i0r1Y47aQcVYf+xCRIVz8sH18nVZq8KdEajkgtGAuNOjZqffFw==
X-Received: by 2002:a37:5dc5:: with SMTP id r188mr16107436qkb.303.1620499076613;
        Sat, 08 May 2021 11:37:56 -0700 (PDT)
Content-Type: multipart/alternative; boundary=Apple-Mail-5BB23005-C8D5-4CD0-A64D-8522016ADBF6
Content-Transfer-Encoding: 7bit
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2 01/13] docs: Warn about incomplete vtpmmgr TPM 2.0 support
Message-Id: <D66E1606-7354-4B1E-9F20-DA9BB830FAFA@gmail.com>
Date: Sat, 8 May 2021 14:37:55 -0400
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
X-Mailer: iPad Mail (18E212)


--Apple-Mail-5BB23005-C8D5-4CD0-A64D-8522016ADBF6
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 6, 2021, at 10:00, Jason Andryuk <jandryuk@gmail.com> wrote:
> =EF=BB=BFThe vtpmmgr TPM 2.0 support is incomplete.  Add a warning about t=
hat to
> the documentation so others don't have to work through discovering it is
> broken.
>=20
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> docs/man/xen-vtpmmgr.7.pod | 11 +++++++++++
> 1 file changed, 11 insertions(+)
>=20
> diff --git a/docs/man/xen-vtpmmgr.7.pod b/docs/man/xen-vtpmmgr.7.pod
> index af825a7ffe..875dcce508 100644
> --- a/docs/man/xen-vtpmmgr.7.pod
> +++ b/docs/man/xen-vtpmmgr.7.pod
> @@ -222,6 +222,17 @@ XSM label, not the kernel.
>=20
> =3Dhead1 Appendix B: vtpmmgr on TPM 2.0
>=20
> +=3Dhead2 WARNING: Incomplete - cannot persist data
> +
> +TPM 2.0 support for vTPM manager is incomplete.  There is no support for
> +persisting an encryption key, so vTPM manager regenerates primary and sec=
ondary
> +key handles each boot.
> +
> +Also, the vTPM manger group command implementation hardcodes TPM 1.2 comm=
ands.
> +This means running manage-vtpmmgr.pl fails when the TPM 2.0 hardware reje=
cts
> +the TPM 1.2 commands.  vTPM manager with TPM 2.0 cannot create groups and=

> +therefore cannot persist vTPM contents.
> +
> =3Dhead2 Manager disk image setup:
>=20
> The vTPM Manager requires a disk image to store its encrypted data. The im=
age
> --=20
> 2.30.2

Should SUPPORT.md also be updated?

https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3DSUPPORT.md;hb=3Dref=
s/heads/master

Rich=

--Apple-Mail-5BB23005-C8D5-4CD0-A64D-8522016ADBF6
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr">On May 6, 2021, at 10:00, J=
ason Andryuk &lt;jandryuk@gmail.com&gt; wrote:<div dir=3D"ltr"><blockquote t=
ype=3D"cite"><br></blockquote></div><blockquote type=3D"cite"><div dir=3D"lt=
r">=EF=BB=BF<span>The vtpmmgr TPM 2.0 support is incomplete. &nbsp;Add a war=
ning about that to</span><br><span>the documentation so others don't have to=
 work through discovering it is</span><br><span>broken.</span><br><span></sp=
an><br><span>Signed-off-by: Jason Andryuk &lt;jandryuk@gmail.com&gt;</span><=
br><span>Acked-by: Andrew Cooper &lt;andrew.cooper3@citrix.com&gt;</span><br=
><span>---</span><br><span> docs/man/xen-vtpmmgr.7.pod | 11 +++++++++++</spa=
n><br><span> 1 file changed, 11 insertions(+)</span><br><span></span><br><sp=
an>diff --git a/docs/man/xen-vtpmmgr.7.pod b/docs/man/xen-vtpmmgr.7.pod</spa=
n><br><span>index af825a7ffe..875dcce508 100644</span><br><span>--- a/docs/m=
an/xen-vtpmmgr.7.pod</span><br><span>+++ b/docs/man/xen-vtpmmgr.7.pod</span>=
<br><span>@@ -222,6 +222,17 @@ XSM label, not the kernel.</span><br><span></=
span><br><span> =3Dhead1 Appendix B: vtpmmgr on TPM 2.0</span><br><span></sp=
an><br><span>+=3Dhead2 WARNING: Incomplete - cannot persist data</span><br><=
span>+</span><br><span>+TPM 2.0 support for vTPM manager is incomplete. &nbs=
p;There is no support for</span><br><span>+persisting an encryption key, so v=
TPM manager regenerates primary and secondary</span><br><span>+key handles e=
ach boot.</span><br><span>+</span><br><span>+Also, the vTPM manger group com=
mand implementation hardcodes TPM 1.2 commands.</span><br><span>+This means r=
unning manage-vtpmmgr.pl fails when the TPM 2.0 hardware rejects</span><br><=
span>+the TPM 1.2 commands. &nbsp;vTPM manager with TPM 2.0 cannot create gr=
oups and</span><br><span>+therefore cannot persist vTPM contents.</span><br>=
<span>+</span><br><span> =3Dhead2 Manager disk image setup:</span><br><span>=
</span><br><span> The vTPM Manager requires a disk image to store its encryp=
ted data. The image</span><br><span>-- </span><br><span>2.30.2</span><br></d=
iv></blockquote><br><div>Should SUPPORT.md also be updated?</div><div><br></=
div><div><a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3D=
SUPPORT.md;hb=3Drefs/heads/master">https://xenbits.xen.org/gitweb/?p=3Dxen.g=
it;a=3Dblob;f=3DSUPPORT.md;hb=3Drefs/heads/master</a></div><div><br></div><d=
iv>Rich</div></div></body></html>=

--Apple-Mail-5BB23005-C8D5-4CD0-A64D-8522016ADBF6--

