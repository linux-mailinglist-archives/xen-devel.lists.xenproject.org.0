Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6E88C28C1
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 18:28:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719974.1122880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5T5E-0006Xg-E9; Fri, 10 May 2024 16:26:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719974.1122880; Fri, 10 May 2024 16:26:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5T5E-0006UV-BU; Fri, 10 May 2024 16:26:56 +0000
Received: by outflank-mailman (input) for mailman id 719974;
 Fri, 10 May 2024 16:26:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ou8D=MN=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s5T5C-0006UP-U7
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 16:26:54 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c9620a1-0eea-11ef-909d-e314d9c70b13;
 Fri, 10 May 2024 18:26:53 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a59c5c9c6aeso550311466b.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 09:26:53 -0700 (PDT)
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
X-Inumbo-ID: 1c9620a1-0eea-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715358413; x=1715963213; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YencXVp0PeCkXZse6MjETaVRXLmeumikfkf3wsxusE=;
        b=T6elLqeco0wJrbZwySQe+LgwFSvdGzGuy/H+kZbJRr+6YzOWH3dY9C/n5VrctMiwlH
         c3wZiuzITiLmHS20mmAmruT1ebRp93x1/7i511SRmdWWMkN2ooSNhtTSDtAIc3XMYNiM
         l1HzoGcmJW5/j4Nq9fmmcZDTtmj5nQDtKDjGVhKcH1RI/bedYLNbjBP1WWHWDq8AO8CW
         FN1yASRwQKBoKDsX3aDTWb1FD5du4VapXmGPcClTwAqVb+sjHtJNv7FtNxnNy4gIp1zY
         ujlGvCHU8iQG+CsrSEEGd1MQ4b2pdQOrII5VidHXCux+42cIMq2OcqUXKJxHSWiT+w/1
         c1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715358413; x=1715963213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4YencXVp0PeCkXZse6MjETaVRXLmeumikfkf3wsxusE=;
        b=qBTkPK5a3a+u2W4vxHqbUkJ+Ci19tNICBwIzgRDbCBTNepiJri4byFLTh3xhtOzb8O
         xUwRn/ElywJhs5lFr2bppt4RrAazGiFp4pl1UU93iS91k8QgEIiSXTUkNcAYIcapeHRC
         nYVth4EPAWl3oz3zkSmGcL5XRC9K+mQwFLGwBQNayH+1HUvFAW0A9ANguiGYXDipZiyq
         Tq64NHmGQVIr2+tAQsvKzk5ockxIwks24/hPVL49kluRZ2m7Oba+XsiOdfzQLCkiHoTN
         pl7igWADNh2o/AFKsjV6kfVjoyc3B1QHTivmk68ooONHE6lt41Ej/oAoTDXYshy4ZLhG
         Ft1A==
X-Forwarded-Encrypted: i=1; AJvYcCUAJewOBU8NZc6h/swdHZTWwQ3MwD6z+pNgMtyaK66vjQgFJxehq1Oy+k84f7D9YrOoX5rqxudVkpwSSLBPlahhOYfBFLmGOeC4A34Td2o=
X-Gm-Message-State: AOJu0YxF5fvPzU2/CIyfI+kSvr0HorbLGAl9QW4JdE/ikdIlW18cguL3
	JpXIP3XNtEh94vxvOx/tf4M1Cqzi9blZU6FEfRivrPWGBa3a2iVn/vlYuh/oKv4QbwNPJbqpBLh
	ozE4C6g6fv36JJB57fmNuRPFJCdw=
X-Google-Smtp-Source: AGHT+IEmHnQyOSa++p0nsgPYr2jcAt9R09TE2w6ukXEp5RjofEYAQIxUz/WCMwpZPg22FtGWT1WlAAldAetkPX1L3dI=
X-Received: by 2002:a50:d51a:0:b0:56d:c722:93a3 with SMTP id
 4fb4d7f45d1cf-5734d5cccb2mr2330861a12.21.1715358413003; Fri, 10 May 2024
 09:26:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240501035448.964625-1-edgar.iglesias@gmail.com>
 <20240501035448.964625-7-edgar.iglesias@gmail.com> <alpine.DEB.2.22.394.2405031656490.1151289@ubuntu-linux-20-04-desktop>
 <CAJy5ezpgXVp838aA_E8vJDARoO5iQOh07D+Gpn0kMCLj_iXyLw@mail.gmail.com>
 <398afdf1-8a11-4584-bb07-cf6fc2373d21@xen.org> <CAJy5ezpNQP5q0NVaGdXtt5BbJSzCMfTfFt-0RRgVq3+DqMbKgA@mail.gmail.com>
 <35c8fbfb-8b09-4aae-8c98-402dcd65ca2e@xen.org>
In-Reply-To: <35c8fbfb-8b09-4aae-8c98-402dcd65ca2e@xen.org>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Fri, 10 May 2024 18:26:41 +0200
Message-ID: <CAJy5ezq7=jH2bzBqGG2qQMc4TJu5bw6wHAx+_RW63EaZv2wXVg@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] xen/arm64: bpi: Add missing code symbol annotations
To: Julien Grall <julien@xen.org>, jbeulich@suse.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, 
	bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
	andrew.cooper3@citrix.com, edgar.iglesias@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 7, 2024 at 7:37=E2=80=AFPM Julien Grall <julien@xen.org> wrote:
>
>
>
> On 07/05/2024 17:55, Edgar E. Iglesias wrote:
> > On Tue, May 7, 2024 at 11:57=E2=80=AFAM Julien Grall <julien@xen.org> w=
rote:
> > Hi Julien,
>
> Hi Edgar,
>
> >
> > The reason I choose FUNC for the start of the symbol is because these
> > symbols contain
> > executable code (not only a table of pointers to code somewhere else)
> > and the ELF spec
> > says that STT_FUNC means the symbol contains functions or other executa=
ble
> > code (not only callable functions IIUC):
> >
> > "STT_FUNC The symbol is associated with a function or other executable =
code."
> > https://refspecs.linuxbase.org/elf/elf.pdf
> > (Symbol Table 1-20).
>
> Thanks for the pointer. I originally did intend to suggest the change,
> but then I saw the use of LABEL in x86 (such as svm_stgi_label). There
> are a few others example with LABEL_LOCAL.
>
> AFAICT, this is also executable code which the only difference that it
> is not meant to be called by someone else. Furthermore, LABEL is using
> DO_CODE_ALIGN(...) for the alignment which imply that it is intended to
> be used by executable code. So I thought the only difference was whether
> the label was intended to be used as a function.
>

Thanks Julien, yes, good points.

> >
> > I think using LABEL instead of GLOBAL for the _end labels of these
> > code sequences makes sense.
> > I'm happy to change the _start labels to LABEL too if you guys feel
> > that's better.
>
> I have to admit I am little confused with the difference between LABEL
> vs FUNC. I think I will need some guidance from Jan (he introduced
> linkage.h).
>

Jan, do you have any guidance on this specific case using FUNC , LABEL
(or something else)?

Cheers,
Edgar

