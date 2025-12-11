Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98764CB5EF4
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 13:51:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184025.1506573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTg7a-0003Uk-9c; Thu, 11 Dec 2025 12:50:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184025.1506573; Thu, 11 Dec 2025 12:50:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTg7a-0003TI-6Y; Thu, 11 Dec 2025 12:50:14 +0000
Received: by outflank-mailman (input) for mailman id 1184025;
 Thu, 11 Dec 2025 12:50:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oCI8=6R=gmail.com=samaan.dehghan@srs-se1.protection.inumbo.net>)
 id 1vTg7Y-0003TA-FD
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 12:50:12 +0000
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [2607:f8b0:4864:20::102c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edb18851-d68f-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 13:50:11 +0100 (CET)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-3436d6ca17bso19293a91.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 04:50:11 -0800 (PST)
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
X-Inumbo-ID: edb18851-d68f-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765457410; x=1766062210; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JhcjGGZKr5BHFycQfO4Gb8CtFfIXuan0DVFM27KhBo=;
        b=dDWKTUXg1EAtj1cC0fSoVfSmraLGcLWJM/ebePGdVlooKdBE9VRh5YpV1rA9ZmlrF+
         F38eyeNd6uThU4l+pGOAQpClDYi4hXciPhWc+6y4YSi33piIkMPoP3hjk7f5s8N76kO1
         1pba+QPO+H6wcD2+h/lLkOXb5e6h+At/m/H53aHpw2sXFMGpI7e6yIkMiPwsKxCS/GYd
         qarnLJj8iv/TGu1xDfCB6gwWXrGCcEDzN6YE49avPmk59OH77lseXOvNr4Dh1+9U8XAa
         gt3wPkCZjARh30WLqLdXpJk/YeUddMuJimnxsldrP7AGpyaz1vbj9w7rxBVNlc3hMljy
         cAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765457410; x=1766062210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5JhcjGGZKr5BHFycQfO4Gb8CtFfIXuan0DVFM27KhBo=;
        b=oT4UlU1MBzpglzcMc5CBgCW+99YLeOrrtMbEpoxfjZrv1v1/82ZvqUWfo4VTFUfwFI
         DjmwD6vhYlRFmBk1tuQq0/pVBYSjGY+gk541Wvztd0RdqPhWY/k2Vvr6vEdZRDO1TCh5
         zCyirrV1pCnEQJgHqyM+gczaA9ZDdfRF8vQNO6VPzPt837SXKc3Ssnks5ZwRTduWPbtg
         QOOecUgmhvymate6r9msTq6+ihjwnvqhOhKewh2eWRS8hPSDx+rHlEM6Gm6DUsZshipv
         vDRQeQsgBpkyOpJsCBmL33uwTrJnJrLz6zj2zYi45IM2m5GyNbK5ObSPYpuvAicP+vJR
         ly7Q==
X-Gm-Message-State: AOJu0YwajtEjrraJkmme8IpBYd24iKipma3GdguhPEXlYxhU2G5F6E5a
	3wnbC4AlFrmXIbtVfhROFp+VzAPt8hGTHqGOICaS6ey/++gqrdnJgH6Lp0vu0G6d1OJIeem4coC
	xxD6d6K61sJcTksGMvsAlDKposaYBYg==
X-Gm-Gg: AY/fxX7CNCD9n24JztJcvsUg5EGLh0IZeGz6EtQaNDd7JpvYx4xBVsp5uJ4DZy6xin6
	4eoDQlZIGaT7YXHD8HISwrzNlf451FN3JfDMqEqYl0dvB24B6Pj0cwQhsTj6blUUwt/8rCtoovh
	BK0DNV7BgBqO6dAfnVqMO1gCRnwKFrtzCLa1sBlZV0yHAZ3Wlt3TgogHnUH4XeZANdK3s06gd8Q
	AxlH+o8G8yr6BiJMxU60EPpPx/Y+fOq9iyfYxYLrRvTDlRtk4hW+zAqNisb6c+83woNKEXxUFgk
	oTj8D1YxysxBHxbSsu8WLW9W
X-Google-Smtp-Source: AGHT+IH4lqo9+pDbLn9iRBGO+9A8b/7AK577rirzGk8YaMJxQyD8DbaOqHkCOkbkZnKATNL3eWXS59RPub7XRM8Dyqg=
X-Received: by 2002:a17:90b:4d8d:b0:341:b5a2:3e7b with SMTP id
 98e67ed59e1d1-34a72808b3amr5798503a91.4.1765457409717; Thu, 11 Dec 2025
 04:50:09 -0800 (PST)
MIME-Version: 1.0
References: <bd6686e7fc0756e929334792b94ddd66bde125c4.1765239102.git.samaan.dehghan@gmail.com>
 <bb575726fe0ac783121e563b1c92f81f51e41f75.1765420376.git.samaan.dehghan@gmail.com>
 <f49dd123-32ca-46b2-a00e-751267667bd2@xen.org>
In-Reply-To: <f49dd123-32ca-46b2-a00e-751267667bd2@xen.org>
From: Saman Dehghan <samaan.dehghan@gmail.com>
Date: Thu, 11 Dec 2025 06:49:58 -0600
X-Gm-Features: AQt7F2qP_dF3HszUaSGYMVzeB_qCi1GeW2WXoN_BFugRMkis-k8FYOWpYz7iJUI
Message-ID: <CAHFNDNgUNg2zTvxweZndgWwZ9EJjFJr3YB7Ouk-4x3RqcKRnPA@mail.gmail.com>
Subject: Re: [PATCH v2] xen/arm64: Add support Clang build on arm64
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 3:35=E2=80=AFAM Julien Grall <julien@xen.org> wrote=
:
>
>
>
> On 11/12/2025 02:39, Saman Dehghan wrote:
> > This patch enables building Xen on arm64 architecture using the Clang c=
ompiler.
> > Changes include:
> > - Add explicit -march=3Darmv8 flag for arm64 builds.
> > - Add `__attribute__((target("fp-armv8")))` to `vfp_save_state` and
> >    `vfp_restore_state` functions when building with Clang to allow
> >    FP instructions despite `-mgeneral-regs-only`.
> >
> > Signed-off-by: Saman Dehghan <samaan.dehghan@gmail.com>
> > ---
> >   README                   | 2 ++
> >   xen/arch/arm/arch.mk     | 1 +
> >   xen/arch/arm/arm64/vfp.c | 6 ++++++
> >   3 files changed, 9 insertions(+)
> >
> > diff --git a/README b/README
> > index 889a4ea906..67c1aa7fe6 100644
> > --- a/README
> > +++ b/README
> > @@ -45,6 +45,8 @@ provided by your OS distributor:
> >         - For ARM:
> >           - GCC 5.1 or later
> >           - GNU Binutils 2.25 or later
> > +        or
> > +        - Clang/LLVM 11 or later
>
> I forgot to ask. Is this cross-compiling or native? Or both?
>
> And OOI, how did you chose Clang 11?

Hi Julien,

To be consistent with minimum requirements for Clang/LLVM on x86.

~Saman

>
> Cheers,
>
> --
> Julien Grall
>

