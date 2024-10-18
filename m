Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 629D39A4094
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 15:59:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821969.1235960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1nVB-0004j4-Qs; Fri, 18 Oct 2024 13:58:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821969.1235960; Fri, 18 Oct 2024 13:58:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1nVB-0004gs-Nz; Fri, 18 Oct 2024 13:58:49 +0000
Received: by outflank-mailman (input) for mailman id 821969;
 Fri, 18 Oct 2024 13:58:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SHZo=RO=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t1nVA-0004gg-Kl
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 13:58:48 +0000
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [2607:f8b0:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1825cb38-8d59-11ef-a0be-8be0dac302b0;
 Fri, 18 Oct 2024 15:58:47 +0200 (CEST)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3e5ef9e795bso1184534b6e.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2024 06:58:47 -0700 (PDT)
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
X-Inumbo-ID: 1825cb38-8d59-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729259926; x=1729864726; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNaz/Tu5QWDWGclW8gPyNnm7G2uCfGFowGZcOL34N3I=;
        b=gfLVN+XIQqf522lSqOnJ1FEUpLZtyv/UADR766JNwhaSqj+E8XJlXgjHq4rDV1wenI
         wKBAoxLCpiraRW2wP3k7eXVjIYHmB72bsQiK0qE+HGTCgh3bUh06JuZstvrzSXyRENR/
         u7J37Txpfbcm59Vl+LN13zBHM1YRU3Hmy1kzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729259926; x=1729864726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XNaz/Tu5QWDWGclW8gPyNnm7G2uCfGFowGZcOL34N3I=;
        b=gP/yeXOKvOfWcT0FJuFdJLFFFqR2mVu/lI0EQH28+vf0e8n9jN/8S39hWMfzH/2X2C
         6YwcNfWZcR3OabDpvu4wPENMqVVThrA5D+mJYspctE6A5mIbmr5IlGQNBFR8F+FSh6gE
         rYSK/UE09aLOE4gETxJtss1mk8pOQoJX05dp7czeaUcw9P8BlE3HeN1eZt6auutXGpwb
         PU6v5lo3k/1OxK4MYXRDhrt7GKJfk/6RSdDNeCqW+F+HRnidC1b8mIiuizSHmkbSj7Sc
         BWbbtziScDqJiTTpGuPy6EIgiXBXykSmUWNLaw4syXhpm6WZj+mbV9+OJc+H5N/ONzVL
         Ap9g==
X-Gm-Message-State: AOJu0YxQSlNn884EwY9vj56a7DMYn337Wugf8SJHDlRYZe/816VcGeYw
	OQnzRPfqFN3z8PAB13pD4kxzpn8HNLFQ2F543y2TwJrAi4+hy73jbkuGp+IT3Pprk4ej4oasUiG
	T2tS4i4T5pYUH6GmH+7vTXLdTxJfRm4deWiCj3A==
X-Google-Smtp-Source: AGHT+IHAFBU2I8JTI28taF26kJamIONYxEaZoUYYbHgZb5f7Jndphi6zQBTv7tBsF/EIOzYfOIW8ODGfp5lf7qiHuPg=
X-Received: by 2002:a05:6808:1818:b0:3e3:e592:7c24 with SMTP id
 5614622812f47-3e602dbbee2mr2011268b6e.40.1729259926247; Fri, 18 Oct 2024
 06:58:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240926095133.483619-1-frediano.ziglio@cloud.com>
 <CACHz=ZgwcejTF0Yz5vchVy18Hn15LYp_R8Y1LqOA=qAHK-HRiA@mail.gmail.com>
 <CACHz=Zh9r7xFSsq3vxdBfss1ozJC1neoTFs4Dvpw+xeQiUFTsg@mail.gmail.com>
 <6d5bad39-1a20-4cef-a1c5-aaa99c501941@xen.org> <CACHz=ZhGUG8tihk6vVTLk6fJOe1mFk=Mep-YOB0ci46JsKJKEw@mail.gmail.com>
 <8a57ee10-1440-4c9f-b961-fb9d1220b104@xen.org>
In-Reply-To: <8a57ee10-1440-4c9f-b961-fb9d1220b104@xen.org>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 18 Oct 2024 14:58:34 +0100
Message-ID: <CACHz=Zhpc-B3J+k7giDt8-T71cgga9JtcZUN0nvyCYe-dV1qjQ@mail.gmail.com>
Subject: Re: [PATCH] Update deprecated SPDX license identifiers
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Ross Lagerwall <ross.lagerwall@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Connor Davis <connojdavis@gmail.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, 
	Paul Durrant <paul@xen.org>, Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, 
	George Dunlap <gwd@xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2024 at 1:54=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:
>
> Hi,
>
> On 18/10/2024 13:28, Frediano Ziglio wrote:
> > On Fri, Oct 18, 2024 at 1:11=E2=80=AFPM Julien Grall <julien@xen.org> w=
rote:
> >>
> >> Hi Frediano,
> >>
> >> On 18/10/2024 13:07, Frediano Ziglio wrote:
> >>> On Fri, Oct 4, 2024 at 9:08=E2=80=AFAM Frediano Ziglio
> >>> <frediano.ziglio@cloud.com> wrote:
> >>>>
> >>>> On Thu, Sep 26, 2024 at 10:51=E2=80=AFAM Frediano Ziglio
> >>>> <frediano.ziglio@cloud.com> wrote:
> >>>>>
> >>>>> As specified in LICENSES/GPL-2.0:
> >>>>> - GPL-2.0 -> GPL-2.0-only;
> >>>>> - GPL-2.0+ -> GPL-2.0-or-later.
> >>>>>
> >>>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> >>>>
> >>>> ping
> >>>>
> >>>
> >>> ping
> >>
> >> Please try to be more specific.
> >>
> >> I see you already have an ack from Stefano (which would cover Arm +
> >> Common). What else are you missing? Is it committing? Do you need
> >> someone else to ack? If the latter, then please mention who you think
> >> need to ack...
> >>
> >> Cheers,
> >>
> >> --
> >> Julien Grall
> >>
> >
> > Hi,
> >     I'm not a mind reader, so I don't know what is missing.
>
> Committers are not mind reader either... ;) With such a large list of
> CC, how do you think someone will know what they need to do?
>
> You could have been more specific to what you expect.
>
>  > It's a style change with some updates which has been acked, so I
> would> expect it to be merged or people tell me what is missing.
> You probably use scripts/get_maintainers.pl to get a list of CC. You
> could also use it for figuring out who you are missing:
>
> 42sh> scripts/get_maintainer.pl
> 20240926_frediano_ziglio_update_deprecated_spdx_license_identifiers.mbx
> --roles
>

I used scripts/add_maintainers.pl, I suppose it uses the same list.

> But in this case, I think it would be ok to commit without all the
> relevant acks as this is only renaming. That said, this patch doesn't
> apply... So you will need to send a new version.
>

Oh... git rebase was happy. Sending a new version.

> Cheers,
>
> --
> Julien Grall
>

Frediano

