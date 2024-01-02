Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6227822273
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 21:17:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660831.1030467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKlBt-0002UD-06; Tue, 02 Jan 2024 20:16:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660831.1030467; Tue, 02 Jan 2024 20:16:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKlBs-0002Rf-Ti; Tue, 02 Jan 2024 20:16:44 +0000
Received: by outflank-mailman (input) for mailman id 660831;
 Tue, 02 Jan 2024 20:16:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BNED=IM=gmail.com=rosbrookn@srs-se1.protection.inumbo.net>)
 id 1rKlBs-0002RW-5h
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 20:16:44 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d81d3cc9-a9ab-11ee-98ef-6d05b1d4d9a1;
 Tue, 02 Jan 2024 21:16:42 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50e7e6283bdso6543404e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jan 2024 12:16:42 -0800 (PST)
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
X-Inumbo-ID: d81d3cc9-a9ab-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704226602; x=1704831402; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gG8DR5rZpNagP+W787Mka3E5XABWlS7AaAtnT6wDokk=;
        b=Drw4cbaoiguTbigtjWcd2BeO4x/+sHf2YKntF51+saQ757bwt2rKemeBYe/jATkLBB
         bbn/6GxyoVxVql7fRQd8g/iavra8Eb9df1271mjN4QokV5pggt48hUjOw1dy5pO3Sf82
         PWHzWXDEKMKym7ooh+7cPlCNRYD6QEAb1koW9oHrbyk4YHdX3MqWIEJHAJKGe0f7psIL
         CCd7Se0zrGfOngut3LjrvDdpFr34aWlMUDC/ZVg9F4igxLGndQJeUesap8Pnm91rV4Hl
         h6bnwjvrCmaBaP8+1vslQDVIz0vBBWigIKYWvsYDhKb4igrNq7CpVnc0NzQUhcPMBYCa
         Jvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704226602; x=1704831402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gG8DR5rZpNagP+W787Mka3E5XABWlS7AaAtnT6wDokk=;
        b=XqxuffUYtkX9/n7frfpG2mpquvkB96r0hhHQ5tjqsz/NCjE6OTLacfPNnSVzX071qA
         kMl57vIGvxXZu4rtwf02TLNCLiidALpieQZmKE/AobEy4gb+sInwdZxFpMtA6RDluqEL
         JCtiwchLEQISS6FPJv4E7o9F4rbtkOeIdRlqC+vJyKE72LlZ9qah/ey59XnzgpE7A8mQ
         6sLsg/RbQpFmQjKpZg8wD0N+6ovJJQLiSkDKlFAx2y4hYYmn5Gfj93WvhCMR6p7FqhUp
         /1A2RMWmLl4O6wCfS+BqYkdUlqrzBxQfFI3HvnD2uoFrs7aTBLki0gxu5ZAHmjpLyPMU
         ObNg==
X-Gm-Message-State: AOJu0YzUTujxL8lCVoJjO0OZN5uryqJAoSrR6CUQqgwiAzoezQozpuvl
	XHrExkRYOUP6i8kmg2Slw7NInkut9KKEcnN5lwU=
X-Google-Smtp-Source: AGHT+IGpeIgmAQgJeYkRE1kUnbYPBcRZAErv0zQOrWqSBJqnu3VhcQHXimxgCWVN0XgIiYlPfWZrIDrnefDzXHjl6hc=
X-Received: by 2002:a05:6512:3d08:b0:50e:791f:2b07 with SMTP id
 d8-20020a0565123d0800b0050e791f2b07mr3328264lfv.152.1704226601829; Tue, 02
 Jan 2024 12:16:41 -0800 (PST)
MIME-Version: 1.0
References: <20231110160804.29021-1-jgross@suse.com> <20231110160804.29021-16-jgross@suse.com>
 <CAKf6xpty3ENpuPgTf7=Gk1Q-Ekn+FjOx=-ySMQF6v3kx7zntrw@mail.gmail.com>
 <CAEBZRSdyoCH2CFP14imC9We+sTiGn8f-DWecQ1t+ftd0+=0xwg@mail.gmail.com> <CAKf6xpuamYUe_HPuw_m38PBO9cgLpq-H4f_1qjGt5C7ptSkCoA@mail.gmail.com>
In-Reply-To: <CAKf6xpuamYUe_HPuw_m38PBO9cgLpq-H4f_1qjGt5C7ptSkCoA@mail.gmail.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Tue, 2 Jan 2024 15:16:30 -0500
Message-ID: <CAEBZRSeWjivhLgjQ-9_MKAx6-dOqWLeFMsMoV54fdwhhtJLDjQ@mail.gmail.com>
Subject: Re: [PATCH v2 15/29] tools/libs/light: add backend type for 9pfs PV devices
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 6, 2023 at 1:53=E2=80=AFPM Jason Andryuk <jandryuk@gmail.com> w=
rote:
>
> On Wed, Dec 6, 2023 at 12:44=E2=80=AFPM Nick Rosbrook <rosbrookn@gmail.co=
m> wrote:
> >
> > On Wed, Dec 6, 2023 at 9:36=E2=80=AFAM Jason Andryuk <jandryuk@gmail.co=
m> wrote:
> > > FYI, these IDL changes will require golang binding regeneration.
> > > (Maybe we shouldn't have generated code checked in...)
> >
> > The generated code needs to be checked in for it to work as a go module=
.
>
> I don't follow. The build system generates the *.gen.go binding files
> if they are missing.  They can then be used, installed or packaged.
> Why do they need to be checked into the git repo?  Checked in, they
> have a tendency to go stale.
>

That's not how go modules are typically consumed. E.g., the Debian
packages with go source code are only there to satisfy Build-Depends
of other packages. One can use locally installed go modules as
overrides at build-time, but normally go modules are fetched via git
(internally by the go tooling) according to what is specified in a
project's go.mod file. See https://go.dev/blog/using-go-modules for
more.

-Nick

