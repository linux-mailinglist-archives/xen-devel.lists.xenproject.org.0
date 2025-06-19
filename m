Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FEFAE0843
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 16:06:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020156.1396544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSFtg-000493-5e; Thu, 19 Jun 2025 14:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020156.1396544; Thu, 19 Jun 2025 14:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSFtg-00046s-2J; Thu, 19 Jun 2025 14:05:44 +0000
Received: by outflank-mailman (input) for mailman id 1020156;
 Thu, 19 Jun 2025 14:05:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P6RS=ZC=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uSFtf-00046m-3I
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 14:05:43 +0000
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [2607:f8b0:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78453b22-4d16-11f0-b894-0df219b8e170;
 Thu, 19 Jun 2025 16:05:35 +0200 (CEST)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-735b2699d5dso526557a34.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jun 2025 07:05:35 -0700 (PDT)
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
X-Inumbo-ID: 78453b22-4d16-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750341934; x=1750946734; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jpI+lBADGKSORsEOZSxUO6bJWTslJG2ZsdZncnEW8U=;
        b=fsSMt6EiQL8Qt/b7xmkkCd+yHKPYIoHXIhq3TjJWJ6gfmSAFcRQ1nkujcmRtlBnXjC
         HFddJLp+htKlFCcHLST0vtmPVrlygaLSxd6N7EDlkX1x3qqrfT3kIU5JBuwt4saH4uRo
         B8781/3H8ms+9DrPXQcsyNvMA/xGk56Xi/UBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750341934; x=1750946734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0jpI+lBADGKSORsEOZSxUO6bJWTslJG2ZsdZncnEW8U=;
        b=qHYDUIn1W2sU5zG2DMmOt6879B1Gyw4nwN7vCG3+A2QwCA2S0WvAx71HPxKPckxKZC
         P9kYeB/HY8wIZFnilv/ulJUMdzhGoHwo4b9BEJ7TpXSjHZtQ9wBIoxCOrDpXfCzUfCLU
         i34sdeoqbDo0M7oH3DL5NqsdMx5T7zlT7xXQs3nbfjRuIAxGx2dRTcMabYcVUXhgUWiu
         Vdh6gofWibpmKjsd8fmJHFVxfP+NjJPuewH3lh+yaSuvNxiw+SXSsMb6GmXwhwwCbnIh
         bYVQO2qgJzmI+rdVwGv3ft8yP51e+4R/2U9fwKcCqnMG19/cFuqapB/E1DmYadt9RDMx
         ACGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfyPnXrndb+DC0QcfjWKtZXjxAlBOCq4liRj5TBykb+x0E73+gtTBUiRFMKOcZDOpwkVKbDAI5yQ0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyoXRSp/xu3wcJFSm7bPzAqwHm6TULayOEeqhxBdjxQSuEfM+m/
	vtsdpr8fPKja5kobKPzCVKbcAGnkemJY+4Gjt8ncea+RgmYedzCuVWccv0aIPNWhPZbv/epyhcW
	PXyGkTXqlSzITnOrG1sABFYv2DjpO/7jVT0ezduu3
X-Gm-Gg: ASbGnctF8/EhncGvlEDf9wlDbOiYILDjImyVtxIDxi/Y3g+AZBXgY7ot5JxXHDXNJJa
	cEt7tQVPcGor8CRyD+8kooi1q9/cXJNATlyZmv33czWpOtsfB7EQKpA8zeNZqmtOnyd/bToHQ+N
	v2KWD26qGxt70rR0Itxx4XydMD3k27tpQjOKu0uOepNw==
X-Google-Smtp-Source: AGHT+IF9DMx50fz5k856YqLJG2pQDkq+I75Pt4FQB6n7DN4pe70eUEwBKmgXiUuvDtesh7jb6qGNFWJ9lt7kKjlBNT8=
X-Received: by 2002:a05:6830:6c84:b0:73a:8a8a:5157 with SMTP id
 46e09a7af769-73a8a8a5a40mr733048a34.19.1750341934417; Thu, 19 Jun 2025
 07:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250611235851.167385-1-andrew.cooper3@citrix.com>
 <5aad2d39-31e1-44c6-b167-a3275dc6b747@suse.com> <d29861f0-2ea8-4519-8c39-3643bc027578@vates.tech>
In-Reply-To: <d29861f0-2ea8-4519-8c39-3643bc027578@vates.tech>
From: Ross Lagerwall <ross.lagerwall@cloud.com>
Date: Thu, 19 Jun 2025 15:05:21 +0100
X-Gm-Features: Ac12FXxUXIY_b9t-qw7RMZQgpeO47bNjQS7eaZkQX4XCmLE6Unl7VEIGAwg-kz0
Message-ID: <CAG7k0Ep7yjhV-Q1Qo+Y+hHkn2kwssG+9Lq_a7ssfBwF==9L0TQ@mail.gmail.com>
Subject: Re: [PATCH] docs: UEFI Secure Boot security policy
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Trammell Hudson <hudson@trmm.net>, Frediano Ziglio <frediano.ziglio@cloud.com>, 
	Gerald Elder-Vass <gerald.elder-vass@cloud.com>, Kevin Lampis <kevin.lampis@cloud.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>, 
	Samuel Verschelde <samuel.verschelde@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 1:21=E2=80=AFPM Teddy Astie <teddy.astie@vates.tech=
> wrote:
>
> Le 12/06/2025 =C3=A0 12:08, Jan Beulich a =C3=A9crit :
> > On 12.06.2025 01:58, Andrew Cooper wrote:
> >> +
> >> +Lockdown Mode
> >> +^^^^^^^^^^^^^
> >> +
> >> +A mode which causes the enforcement of the properties necessary to co=
nform to
> >> +the Secure Boot specification.  Lockdown Mode is forced active when S=
ecure
> >> +Boot is active in the platform, but may be activated independently to=
o for
> >> +development purposes with the ``lockdown`` command line option.
> >> +
> >> +TODO
> >> +^^^^
> >> +
> >> + * Command Line
> >> + * Livepatching
> >> + * Kexec
> >> + * Userspace hypercalls
> >
> > What about Dom0 being able to access almost(?) all memory, including al=
l MMIO?
> > In this context, isn't iommu=3Ddom0-strict a requirement for SB (while =
that's
> > still not the default mode of operation for PV Dom0, despite me keeping=
 to
> > suggest that we ought to change that default)?
> >
>
> Unless I missed something, the kernel is not a part of the TCB in this
> Secure Boot model. But at some point, we definitely want to reduce the
> TCB to just Xen, and put a more limited trust on the control domains.
>
> Yet, the current plan of hardening the privcmd device is going to be
> very hard for sure.
>
> dom0-iommu=3Dstrict is a good mitigations in case untrusted parties of th=
e
> dom0 get direct access to a devices. However, as it is now, it implies a
> IOTLB flush for each grant mapping done, which severely impede PV
> performance (PV-IOMMU patches can help solving this performance problem
> though).
>

The dom0 kernel is part of the TCB since it controls the hardware (along
with Xen). This is covered by the paragrah starting "Privileged code
shall include Xen and the kernel(s) of the control and hardware
domain...".

Dom0 being able to access all memory including MMIO is fine as long as
it does not get exposed to userspace. In general, the existing Linux
kernel lockdown mode would cover this by blocking /dev/mem, access to
resources in sysfs, etc.

Ross

