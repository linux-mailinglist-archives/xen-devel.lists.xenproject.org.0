Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 410D1A498E0
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 13:13:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898696.1307196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnzEt-00044B-FA; Fri, 28 Feb 2025 12:13:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898696.1307196; Fri, 28 Feb 2025 12:13:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnzEt-00042E-CL; Fri, 28 Feb 2025 12:13:11 +0000
Received: by outflank-mailman (input) for mailman id 898696;
 Fri, 28 Feb 2025 12:13:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yp8s=VT=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tnzEr-000428-Lb
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 12:13:09 +0000
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [2001:4860:4864:20::32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e37929c-f5cd-11ef-9aaf-95dc52dad729;
 Fri, 28 Feb 2025 13:13:08 +0100 (CET)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-2b199bb8af9so1975733fac.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Feb 2025 04:13:08 -0800 (PST)
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
X-Inumbo-ID: 5e37929c-f5cd-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1740744786; x=1741349586; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTnS4AT3Ykm/+LOlGj0/AefzuBNeKl7EmWjFY3jT+bg=;
        b=ZIIi1Hj2F2bLrr4dCI12G3jQSojew7b4/nyyrmInVGFSqjWr8/5pqfKfq3WU5EOWWC
         h3E+G9HSAEzqb/54Xnz3NHgxv3kmR33jrNHIjCWYRHyR/Riw6eRQp1CQhH8KLSeStvJi
         jRrUmwSCDz78KSNb2a6hbWyhpo03tAoepvS/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740744786; x=1741349586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZTnS4AT3Ykm/+LOlGj0/AefzuBNeKl7EmWjFY3jT+bg=;
        b=Mw8am5Bv4sjnCSeduedVAGffBd12XAkpBun/EG8fWL3VR1oMfNw8qc0zQB9y9uTtuc
         xBedloMRlo0gW7uXkjK4th90IbNp7niibhYXsT0olY/Te9TGGqgC1l+7m/2tmJD7JqP3
         Jt7BaOqU0kZ5eokiNp+BjEugYTWDgVtsR2ntWoff2KrtjRmkpvrGi4Nk5Dv9cHfX5zd2
         1N+360J8cAN6w66h9HsDI5zBQf1f0PHaxvlmDOcUtrydRYPVK7yJpfWMc3nNrYG7htx2
         ID27jQSBKpc1tEIblBGBO1voOuxIzogxt8l/pRPz8NqvG6xZTOA+DhAgSLJO5EkJa9S2
         gykQ==
X-Gm-Message-State: AOJu0YzlaUNeoSkyIrRzV9dvDZV+2dS9c2ugQAUU3nXuuStJ5S+KoRWm
	0EG56Rnl0HbHJ21qtgElRnGq4Ald8bo4oHBb9AxCjRHXtHeBC5gQWCGZrsyUG/APH0aD33qAhdj
	LDzOIXpT+jdBfwCDf2o0fEUNjabT3J2MLU4ouRw==
X-Gm-Gg: ASbGncuK1iBo9d74Im/rY9isj8tqV/10iWECU9En8XZgeNu9HAUH4e5Eh5YpW3TNweA
	oedSxSwTncN1ORo7Gfm5UT3njQSOxFilLN1S82L4jSZRD36w3Np3QSWF5dchrxXPXTz3J2vz1yx
	ln0r3k
X-Google-Smtp-Source: AGHT+IFoC5JZOWc1WhrzvGf/ZhvbLVUcjNnF8kIi0EhQzpdVsfrG6OS+XFRLxFDVnE+JcStJoQAtJmvVxTsuwQG/A6A=
X-Received: by 2002:a05:6870:d08:b0:2b8:5a6a:6f5f with SMTP id
 586e51a60fabf-2c1558aac6fmr3403069fac.19.1740744786443; Fri, 28 Feb 2025
 04:13:06 -0800 (PST)
MIME-Version: 1.0
References: <20250225140400.23992-1-frediano.ziglio@cloud.com>
 <20250227145016.25350-1-frediano.ziglio@cloud.com> <a14c6897-075c-4b2c-8906-75eb96d5c430@citrix.com>
In-Reply-To: <a14c6897-075c-4b2c-8906-75eb96d5c430@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 28 Feb 2025 12:12:55 +0000
X-Gm-Features: AQ5f1JryDg2N2hATeuCkNPfGX9h6MK4TS1xPsoZVRgxsUphCag4t-Oo4DcEbAQQ
Message-ID: <CACHz=Zj-PKj_svJaLe0DMW9U0FTvea3Es8n1ku_Fp4qzxi4zxQ@mail.gmail.com>
Subject: Re: [PATCH v2] xen: Add support for XenServer 6.1 platform device
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 3:41=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 27/02/2025 2:50 pm, Frediano Ziglio wrote:
> > On XenServer on Windows machine a platform device with ID 2 instead of
> > 1 is used.
> >
> > This device is mainly identical to device 1 but due to some Windows
> > update behaviour it was decided to use a device with a different ID.
> >
> > This causes compatibility issues with Linux which expects, if Xen
> > is detected, to find a Xen platform device (5853:0001) otherwise code
> > will crash due to some missing initialization (specifically grant
> > tables). Specifically from dmesg
> >
> >     RIP: 0010:gnttab_expand+0x29/0x210
> >     Code: 90 0f 1f 44 00 00 55 31 d2 48 89 e5 41 57 41 56 41 55 41 89 f=
d
> >           41 54 53 48 83 ec 10 48 8b 05 7e 9a 49 02 44 8b 35 a7 9a 49 0=
2
> >           <8b> 48 04 8d 44 39 ff f7 f1 45 8d 24 06 89 c3 e8 43 fe ff ff
> >           44 39
> >     RSP: 0000:ffffba34c01fbc88 EFLAGS: 00010086
> >     ...
> >
> > The device 2 is presented by Xapi adding device specification to
> > Qemu command line.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>
> I'm split about this.  It's just papering over the bugs that exist
> elsewhere in the Xen initialisation code.
>
> But, if we're going to take this approach, then 0xc000 needs adding too,
> which is the other device ID you might find when trying to boot Linux in
> a VM configured using a Windows template.
>
> Bjorn: to answer a prior question of yours, all 3 of these devices are
> identical, and exist in production for political reasons (bindings in
> Windows Updates) rather than technical reasons.
>

Hi,
   we got some internal conversation here at XenServer trying to
understand a bit the history and situation of these devices. I'll try
to sum up.

Devices 0001 and 0002 are both "Xen Platform" devices
(https://gitlab.com/qemu-project/qemu/-/blob/master/hw/i386/xen/xen_platfor=
m.c?ref_type=3Dheads).
Devices 0001 and 0002 are mutually exclusive. Usually on XenServer
templates for Windows present device 0002. In other words the xen
platform device is either presented as 0001 or 0002.
Device C000 is a "Xen PV Device"
(https://gitlab.com/qemu-project/qemu/-/blob/master/hw/i386/xen/xen_pvdevic=
e.c?ref_type=3Dheads)
which is mainly empty being a placeholder for Windows updates.

Back to this patch, as C000 is just for Windows update purpose, I
don't see the reason why Linux may care about it (I may be wrong). On
the other hand, if device 0001 is missing Linux will crash so it
should consider also device 0002 as an alternative.

I'll try to post an update for device reservations
(https://xenbits.xen.org/docs/unstable/man/xen-pci-device-reservations.7.ht=
ml)
to xen-devel.

Frediano

