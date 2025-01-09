Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A44A07C02
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 16:30:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868800.1280304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVuUU-0005jC-7j; Thu, 09 Jan 2025 15:30:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868800.1280304; Thu, 09 Jan 2025 15:30:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVuUU-0005gZ-4U; Thu, 09 Jan 2025 15:30:34 +0000
Received: by outflank-mailman (input) for mailman id 868800;
 Thu, 09 Jan 2025 15:30:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OfsQ=UB=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tVuUS-0005gT-C8
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 15:30:32 +0000
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [2001:4860:4864:20::2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a85f4310-ce9e-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 16:30:31 +0100 (CET)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-2a3a40c69e3so581909fac.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 07:30:31 -0800 (PST)
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
X-Inumbo-ID: a85f4310-ce9e-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736436629; x=1737041429; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTqkaJeSjH6ii8cl868aBE/9efm05NFc8SMXqdeIGvs=;
        b=Qqm/5MEBqLAKCpw42xyDKfiuGVdqqEBOw2bsq5GXGLQGn1LJL4N8yqa1SIEUiTJQIm
         02otp+Lmm0Vuf740dkUmLwqbLbca/vy8J3d9C9xAI+OP8qCfkahUxMgmxq+CCKAosPLF
         z6bEADEey0OhoGo17qXnRmqZ2qtV+ETuG2vII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736436629; x=1737041429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YTqkaJeSjH6ii8cl868aBE/9efm05NFc8SMXqdeIGvs=;
        b=H5nl9pszT7XdPcvOKacr70WAJQh7sDs5lpfLHyMFnu3UpYg38N3279OhGje97aG4E1
         6yWQf+FtZuiXfdsbUIVxOxcMipHDuZlsO2yN0hNLh0ohRM7yAyZZqB1J2QChxS0Pl4E0
         tsRVcEyCgp4m6LJaqn2lnT9ghFN8Ompwg45bMbK/yDFhOaYTIqVreyRvYmCv5MIDDnOD
         bufpkFMTH2v//NiTEHQbtu0gwpy1I5boo+mNApLQU+xiKKQVQbHduf7x2Z9/P+9/s86T
         Aj72jQR0/qzpX+vRP0U2WTqU3Im4A59aL1czrsRIWmLkpLpWDfTF4vSYh9axRJvcdVZl
         Vqpg==
X-Forwarded-Encrypted: i=1; AJvYcCXHnIXc/VgXyDR/aVYQU1ygeg094VeRqQylQXDEnWmLUQyFhoX27JGSlCYPXqt5k/pMFlbpzivIB08=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJql5Mc4ymMNgnVw67btVSeigvQUTlvETwisfLcCw0TZ/OUEwQ
	Ey9xc0MPYmS3eXGLawVDeNNWqtnplDI41gB3HCkWIglbhpOAP031gIzturoK3avQY8TaXX8IGbM
	SXKCUCj06lbrs4e/7B+6qkLQKbbIT+OUuYcQlBw==
X-Gm-Gg: ASbGnctsDjNUOH+m10ykuL3Qg0lN3bvHrxA+YL+TxtdlE2EwNS+FFZpgIUc/wkDY34k
	Kzuqghki82Js2hW3uTXE+vC7nzCDYA/knQWBK
X-Google-Smtp-Source: AGHT+IEDj4eRUf2qfd1XC67F1wiWGrszpuCEh/KahbAP7gBO4euqu6w/HNUuSDmbIckUjUy9MObojvgL5RjFCDkxKsc=
X-Received: by 2002:a05:6870:6e87:b0:29e:4ba5:4ddc with SMTP id
 586e51a60fabf-2aa0673901dmr3618444fac.24.1736436629164; Thu, 09 Jan 2025
 07:30:29 -0800 (PST)
MIME-Version: 1.0
References: <20250109131515.1757764-1-marmarek@invisiblethingslab.com>
 <d7421558-c2d6-485b-96bf-927992c5c066@suse.com> <47378338-ac05-4041-a055-56045e5ba131@citrix.com>
In-Reply-To: <47378338-ac05-4041-a055-56045e5ba131@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 9 Jan 2025 15:30:18 +0000
X-Gm-Features: AbW1kvaJNCGU_fqbt_IeEkewgFAx4IlA-fmf6cQyL5X62d7uRzwuiYTWJfwMo_k
Message-ID: <CACHz=ZjR6dSy_NsrXkhf_VfZpGYE4et6VkQvU_cO9DdAnXBzxQ@mail.gmail.com>
Subject: Re: [PATCH] x86/boot: adjust text gap/diff to work with 64-bytes
 alignment too
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 1:44=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> On 09/01/2025 1:23 pm, Jan Beulich wrote:
> > On 09.01.2025 14:15, Marek Marczykowski-G=C3=B3recki wrote:
> >> Xen compiled with -mtune=3Dgeneric has .text alignment set to 64-bytes=
.
> >> Having text_diff non-64-bytes-aligned breaks stuff:
> >>
> >>     Traceback (most recent call last):
> >>       File "/builddir/build/BUILD/xen-4.20.0-build/xen-4.20.0-rc0/xen/=
./tools/combine_two_binaries.py", line 96, in <module>
> >>         raise Exception('File sizes do not match')
> >>     Exception: File sizes do not match: 70160 !=3D 4080 + 66048
> >>
> >> Adjust the numbers as suggested by Frediano to work with 64-bytes and
> >> even 128-bytes alignment.
> > And then breaking at 256? As indicated on Matrix, imo we should be able=
 to
> > cope with anything up to at least PAGE_SIZE. Or we should reduce .text
> > alignment before linking.
>
> Do you have a concrete proposal on how to do this?
>
> Because if not, we've had 2 downstreams hit by this build failure, and
> we probably ought to take this patch as a stopgap fix, and see about
> doing the better fix for 4.20.
>

I agree with this, merge this and then leave the improvements for follow up=
(s).

Yesterday I checked the output object file (built-in-32.o) to find
that the output alignment is 1 byte, which is obviously wrong!

There's no current requirement for page alignment. As page management
is done in both 32 and 64 bit code, pages are allocated in other parts
of the sources and handled correctly.

Personally I prefer incremental development with sensible and
self-contained improvements kept separate, instead of adding changes
and changes because somebody touches a piece of code that can be
improved. Usually any piece of code can be improved.

Frediano

