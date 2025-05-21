Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 947EAABEFC5
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 11:29:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991651.1375500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHflV-0007va-3S; Wed, 21 May 2025 09:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991651.1375500; Wed, 21 May 2025 09:29:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHflV-0007u9-0i; Wed, 21 May 2025 09:29:33 +0000
Received: by outflank-mailman (input) for mailman id 991651;
 Wed, 21 May 2025 09:29:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fb4M=YF=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1uHflT-0007u3-Nv
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 09:29:31 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17bb9fce-3626-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 11:29:28 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-550e2ac6bc9so7161496e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 02:29:28 -0700 (PDT)
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
X-Inumbo-ID: 17bb9fce-3626-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747819768; x=1748424568; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=juu3MSergNi56rWxVd5yr7cNodLo8FHyvOwVr8d04mo=;
        b=FEKFz31IKKtnk+WmbARvosok6bMYMht/MwUCQme4WrS7EQrHxg+XuhSHHrObEvBvCo
         IaqWGss31OBRxjAkZr/FmpqWYlWy1e3MmITQP68KoRy8y6jf0UZ7/t2a9sLzDTReSpzB
         3dGBfDQQQuVSbHk2OeeLFmC7kM76hJwpqtRTuZQXM3kDmwEfPULsPEHoRsFCaG+IOC+s
         1QIy31M9ydaHHICwx0MatixAWR1GzLoQjT3WBWzoeVEjJArpR7sANlb/jCAMWqFDXfaQ
         NMhOaZZaBslUajeChAA0wWwmg0GjXgy2PfVLpk2+t8DCDWxDvf762Lj+qNZ4RUWScGp7
         Yb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747819768; x=1748424568;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=juu3MSergNi56rWxVd5yr7cNodLo8FHyvOwVr8d04mo=;
        b=RKmrCZi6go1LY6eytl+ueodKQDVC38wihqqsbVunl1spkYIfe49oYu88ylTjuwqAE1
         n3p1HeChpixJiBfIHRPyhn/IILeUbF9USdmIngK7KAwY5wDWdCwt3zFyp2YEhikcJ7+3
         eAcxPqXTkOjO6fZa8vrkuBJuaKVmLHkJ41L82zuUDJRwnzLA/IKAmzXn9OFOQpMEPN//
         PuWEqqQ6gHILRzFNi18hgdzeIzL72Kf8Qw2spv0G1YJutK4oIVwjbxq24inUx9pGyB6y
         RmUdjlYl4bHJAjF2bdKugAsnkoRhsB/dOALklPLVZP8vYgvoEOEUJHt+Ud1Je/AuIQls
         zgmA==
X-Forwarded-Encrypted: i=1; AJvYcCWcJ/Yh98B/btpEWFuMKNAFBcuePHXIPpOh+nNRnQtf2TRlGyVh0lW/DXG5yL+6ntB8E+m4t1LLf10=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwziRDke0mKSPM1QV41z+w/kFilXMD5abCYBKlG+xdWsaUrq1cE
	+5mEfhPz+kDoeYquqCph66mIWJBYyGgqI+HpMQUmVMUZEo5i2R4Qg5e2wQXPZnsubkFpjDimDpq
	kVEE7aVCbbbDMkYe57HqiTmVm8PV5njw=
X-Gm-Gg: ASbGncs0gC8+TfDeZWhihNRbf4eINiFR3WoBDdcY96hXXQNiMvZgD3ArDltkC8swgjE
	zX6Dz4SPbVjG6MdxPv5wHXDAwFOOUOw7tVpCQjoqQHB9tTGryx5sG95DggSKeyl+x5eSQ9hoLrG
	vWtTDGMidcgKUfytR871O2UJNrKOmgRC0=
X-Google-Smtp-Source: AGHT+IERJ7pDGRhfYzgkKoZU76MviPfXRS5aqHrqdsVnzErX+rA2vaHjeRegPhsRtaMqlQUrAzIR8fxJCWNJhSL/O+U=
X-Received: by 2002:a05:6512:4389:b0:54f:c33c:a5eb with SMTP id
 2adb3069b0e04-550e7230510mr5521975e87.44.1747819767611; Wed, 21 May 2025
 02:29:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250520233220.868258-1-christopher.w.clark@gmail.com> <528bd2ae-d33b-4038-92c1-c9ab1ccf0bb7@suse.com>
In-Reply-To: <528bd2ae-d33b-4038-92c1-c9ab1ccf0bb7@suse.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Wed, 21 May 2025 10:29:15 +0100
X-Gm-Features: AX0GCFvLk1oWLloQBLvPjiNOituCHoeEd4Vu3s_Z6jKPKJRB9wvk4z7YqexDjtE
Message-ID: <CACMJ4GZ7UOUx6uYFUV+9JiT3=85eWM0QHTNFMN7BtGSUw2GUXA@mail.gmail.com>
Subject: Re: [PATCH 1/2] MAINTAINERS: include Argo documentation in the ARGO section
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Daniel Smith <dpsmith@apertussolutions.com>, 
	Rich Persaud <persaur@gmail.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000061440c0635a200fe"

--00000000000061440c0635a200fe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 8:12=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:

> On 21.05.2025 01:32, Christopher Clark wrote:
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -226,6 +226,7 @@ S:        Maintained
> >  F:   xen/include/public/argo.h
> >  F:   xen/include/xen/argo.h
> >  F:   xen/common/argo.c
> > +F:   docs/designs/argo.pandoc
>
> The list of F: isn't alphabetically sorted here, yes, but please let's
> at least not make that problem worse.
>

Apologies, thanks for the review.

Christopher



>
> Jan
>

--00000000000061440c0635a200fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote gmail=
_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 21, 202=
5 at 8:12=E2=80=AFAM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">j=
beulich@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On 21.05.2025 01:32, Christopher Clark wrote:<br>
&gt; --- a/MAINTAINERS<br>
&gt; +++ b/MAINTAINERS<br>
&gt; @@ -226,6 +226,7 @@ S:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Maintained<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0xen/include/public/argo.h<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0xen/include/xen/argo.h<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0xen/common/argo.c<br>
&gt; +F:=C2=A0 =C2=A0docs/designs/argo.pandoc<br>
<br>
The list of F: isn&#39;t alphabetically sorted here, yes, but please let&#3=
9;s<br>
at least not make that problem worse.<br></blockquote><div><br></div><div>A=
pologies, thanks for the review.</div><div><br></div><div>Christopher</div>=
<div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
Jan<br>
</blockquote></div></div>

--00000000000061440c0635a200fe--

