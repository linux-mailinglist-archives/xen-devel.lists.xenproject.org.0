Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF0C891054
	for <lists+xen-devel@lfdr.de>; Fri, 29 Mar 2024 02:27:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699223.1091934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rq10N-000572-8d; Fri, 29 Mar 2024 01:26:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699223.1091934; Fri, 29 Mar 2024 01:26:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rq10N-00054O-5W; Fri, 29 Mar 2024 01:26:03 +0000
Received: by outflank-mailman (input) for mailman id 699223;
 Fri, 29 Mar 2024 01:26:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bTkM=LD=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rq10L-00054I-81
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2024 01:26:01 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c1a93b3-ed6b-11ee-a1ef-f123f15fe8a2;
 Fri, 29 Mar 2024 02:25:59 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-56829f41f81so2212908a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 18:25:59 -0700 (PDT)
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
X-Inumbo-ID: 4c1a93b3-ed6b-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711675558; x=1712280358; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NbXeEGBrLDr/vK47Zm+PMLx78MZW3W2r+enlXWtyjMQ=;
        b=gHznhC0VncXZr7LNRjXyzMuVwCCa3FcElo1zLdnBLS02o58x29jmckf5PfwjIpevlH
         bXlXn5kFAxQFtbklObVvDFWZTfVfcOd9jSB4TeimsYNbFIBheQ0YMvDvCYtb6BMDPv69
         G4rOAHSLbRUPQQrk/ijV5WI0/QxsL3+SDfrJ2w/RjN2aLbbpX7H5+hecXrev6ROWv0kT
         30AmwJ7fMWC58lIr7i1q8Yrl+Kb++o1zQGu1gRhUe+RrI+Dk9pMcV6NJ4/c4fCzY6e+E
         jjOUTy65dcdVnXzqYOK35H5YVUqCVQ7YESmkyyE86IQ6TYlBQTAr2dLqoV9PUkLn1vST
         q0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711675558; x=1712280358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NbXeEGBrLDr/vK47Zm+PMLx78MZW3W2r+enlXWtyjMQ=;
        b=VaPIyIoiCvcCAlGKbP6GbEgJ9yZIMOgVolZSNSzjil1CADdY+gedz68ZNVkXqOUlVh
         ERlKmBns5M0drNrkQCP+f9IFGXfb+a/BE3DFIAYK6TnRFzHb1i45n5ITyIdLf1dwiARR
         VeXSAkxQa+nO0RC/aBXwnvFKXrFqc3Y+QjyVTs2vF/XiifDzBbcD2jst6zH83eU26Y7Q
         bRF+/dtjKAJNCuswPGgkJEOG3t8mgl33bB39q0RYm5q5s39uGmgmsXP3te9vL3kz/+eY
         E9sB00cWHEL+JCOQWVfCqiojfmud605JC7rbARBxAjxivtCLJaVjrpX4vpZxz9roQaZk
         5vMA==
X-Gm-Message-State: AOJu0Yxy7DFGZlGqCa4guaLRGah5NCh1/FDHAt8AbfDnq9bO/Se/qGLe
	fJGCiOK+dspeGFptzn1Xg9hpZIn1Udo1vOkaz9x0H6YmpVRNI0S2NvD0ra6/Mil3TUoRWWR8VBt
	h+YA8tecmbaVsvg8A2MguR7xXJFiND/6o
X-Google-Smtp-Source: AGHT+IH88YaL6t3Nj4JFKNn0/wwoBUA5UztW00BsTIgojkwj25BzqaCRyhbAk3hrZUhUkJffbgvn0jA+3TNJ6CQRiak=
X-Received: by 2002:a50:aad5:0:b0:568:260b:e502 with SMTP id
 r21-20020a50aad5000000b00568260be502mr436366edc.13.1711675558320; Thu, 28 Mar
 2024 18:25:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240124165401.35784-1-jandryuk@gmail.com> <a2246242-627a-493b-9cd4-c76b0cb301ee@suse.com>
 <CAKf6xps9X=6GYxuk9u2cPYh_pzpLu2MQ00smydRQ40TjxDhgEQ@mail.gmail.com> <9b5a105a-650c-4b33-9f4e-03612fb6701c@suse.com>
In-Reply-To: <9b5a105a-650c-4b33-9f4e-03612fb6701c@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 28 Mar 2024 21:25:46 -0400
Message-ID: <CAKf6xps5wpFxbsdWmLayV5NBg_8aaZPTHhsGNcnLeSpoC=ofAA@mail.gmail.com>
Subject: Re: Linux Xen PV CPA W^X violation false-positives
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 9:00=E2=80=AFAM J=C3=BCrgen Gro=C3=9F <jgross@suse.=
com> wrote:
>
> Hi Jason,
>
> On 28.03.24 02:24, Jason Andryuk wrote:
> > On Wed, Mar 27, 2024 at 7:46=E2=80=AFAM J=C3=BCrgen Gro=C3=9F <jgross@s=
use.com> wrote:
> >>
> >> On 24.01.24 17:54, Jason Andryuk wrote:
> >>> +
> >>> +                     return new;
> >>> +             }
> >>> +     }
> >>> +
> >>>        end =3D start + npg * PAGE_SIZE - 1;
> >>>        WARN_ONCE(1, "CPA detected W^X violation: %016llx -> %016llx r=
ange: 0x%016lx - 0x%016lx PFN %lx\n",
> >>>                  (unsigned long long)pgprot_val(old),
> >>
> >> Jason, do you want to send a V2 with your Signed-off, or would you lik=
e me to
> >> try upstreaming the patch?
> >
> > Hi J=C3=BCrgen,
> >
> > Yes, please upstream your approach.  I wasn't sure how to deal with
> > it, so it was more of a bug report.
>
> The final solution was a bit more complicated, as there are some
> corner cases to be considered. OTOH it is now complete by looking
> at all used translation entries.
>
> Are you able to test the attached patch? I don't see the original
> issue and can only verify the patch doesn't cause any regression.

I'm no longer involved with OpenXT, but I reached out to some of the
developers.  Hopefully they try this out and respond here.

The backtrace in this thread is from BPF - I don't know how that was
triggered.  The other case I saw was in dom0.  That looked like it was
from freeing a module's (nouveau) .init section.  I don't seem to be
able to reproduce that on a non-OpenXT box.

Thanks,
Jason

