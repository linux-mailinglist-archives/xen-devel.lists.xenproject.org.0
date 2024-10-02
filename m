Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E478798DF09
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 17:27:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808897.1220964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw1GH-0007Tj-CC; Wed, 02 Oct 2024 15:27:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808897.1220964; Wed, 02 Oct 2024 15:27:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw1GH-0007RJ-9U; Wed, 02 Oct 2024 15:27:33 +0000
Received: by outflank-mailman (input) for mailman id 808897;
 Wed, 02 Oct 2024 15:27:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i1FR=Q6=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sw1GG-00070n-MP
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 15:27:32 +0000
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [2001:4860:4864:20::32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d72d1ff1-80d2-11ef-a0ba-8be0dac302b0;
 Wed, 02 Oct 2024 17:27:32 +0200 (CEST)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-286f0dcead5so562473fac.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 08:27:32 -0700 (PDT)
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
X-Inumbo-ID: d72d1ff1-80d2-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727882851; x=1728487651; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDcKdH3ZCQXr4hCeS6SQ+kbPq5YMkFyq93jfMv0LjVQ=;
        b=B0UnMzqr37ZbkVbbX+InKSu+YPUdFTUi49mTxLORKr2KzUSt5LujrT0EByaP+3JWFg
         990TADrezqO3gGBGbjZDrmPf/I1UutuBWNI/7EaTYHT+SMM5GiPPbRaSX5OT+Obb7GrZ
         06F1DBSQVof2Gd97NdfWJPYcLVNaWiRGREWtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727882851; x=1728487651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rDcKdH3ZCQXr4hCeS6SQ+kbPq5YMkFyq93jfMv0LjVQ=;
        b=GzshRJJkEbgrTu/lN1WY/QkZ9NR3Lu4Lub2SrLxfCASzcd4F1uOllKTTXlxoys+T+R
         Jd5L+PHbQGo0AXtceBUPv7WSOu3W5V0VQXTForOVuqEzt9P40pOtf5qP5ZVl4S+XcaPw
         gsmkM62HHyO5a7gPNpfHKx41daWMId2tAhbJs1HzjeU7c2OAV2LhJ7+m4zmgU8G/y8ol
         UwuleBsTSdsesyZNdsXx+mtyw9LwZk1ztAV5cxcKqZuIPr0SxIUXDfBVt976/pV6rKl3
         k7CcPBzrn1MPsmtyWlStcZAM2hj7wuqZY2glV38lKdL1YazDY7JKc7olWqEVQSsbg/Fz
         S3mg==
X-Gm-Message-State: AOJu0Ywi+UC5mraLDhC2Q5QjOYcBN/AzFAb16Om357cpYTDoZCC8DS88
	KuizW6B5qhcCheEi8vdl5kInushVZ+fkERGeF8zawQQHYXnNM7mPLZRViNYtnF7RVLwADwlUDPC
	RQ06iq8wRgIzPBkbUYuiR4NCeB0P1rOcROcfaUQ==
X-Google-Smtp-Source: AGHT+IHeDZfVhD2/pUIl4ebalEfh7C5fRGcR+7m/RJw5vjn3kunsmHHALJsZ3GwQmKb0aL9+s0s/SaZV0L9s6QU+kzQ=
X-Received: by 2002:a05:6871:4147:b0:259:8858:a330 with SMTP id
 586e51a60fabf-287879b1fa8mr1744396fac.22.1727882850642; Wed, 02 Oct 2024
 08:27:30 -0700 (PDT)
MIME-Version: 1.0
References: <20241001102239.2609631-1-frediano.ziglio@cloud.com> <Zv1S88isxSSMuqqk@mail-itl>
In-Reply-To: <Zv1S88isxSSMuqqk@mail-itl>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Wed, 2 Oct 2024 16:27:19 +0100
Message-ID: <CACHz=ZhmsA_7eiV+MXi6=3NRzro_sZZK+-Kt-PJ_FS6RfZPZ6g@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] x86/boot: Reduce assembly code
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 2, 2024 at 3:04=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Tue, Oct 01, 2024 at 11:22:37AM +0100, Frediano Ziglio wrote:
> > This series came from part of the work of removing duplications between
> > boot code and rewriting part of code from assembly to C.
> > Rewrites EFI code in pure C.
>
> The MB2+EFI tests on Adler Lake fail with this series:
> https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1478766782
> Looking at the VGA output (unfortunately not collected by the test
> itself) it hangs just after bootloader, before printing anything on the
> screen (or even clearing it after bootloader). The serial is silent too.
>

I tried multiple times to take a look at the logs, but I keep getting error=
 500.

> It does pass on Zen 3+ runners.
>
> Since there were some issues with the ADL runner today on plain staging,
> I'm not 100% sure if it isn't some infrastructure issue yet. But the
> symptoms look different than usual infra issues (and different than
> todays failures on staging), so I think it's more likely an issue with
> the patches here.
>
> > Changes since v1, more details in specific commits:
> > - style updates;
> > - comments and descriptions improvements;
> > - other improvements.
> >
> > Changes since v2:
> > - rebased on master, resolved conflicts;
> > - add comment on trampoline section.
> >
> > Changes since v3:
> > - changed new function name;
> > - declare efi_multiboot2 in a separate header;
> > - distinguish entry point from using magic number;
> > - other minor changes (see commens in commits).
> >
> > Changes since v4:
> > - rebase on staging;
> > - set %fs and %gs as other segment registers;
> > - style and other changes.
> >
> > Changes since v5:
> > - fixed a typo.
> >
> > Changes since v6:
> > - remove merged patch;
> > - comment and style;
> > - change some pointer checks to avoid overflows;
> > - rename parse-mbi2.c to mbi2.c.
> >
> > Frediano Ziglio (2):
> >   x86/boot: Rewrite EFI/MBI2 code partly in C
> >   x86/boot: Improve MBI2 structure check
> >
> >  xen/arch/x86/boot/head.S       | 146 +++++++--------------------------
> >  xen/arch/x86/efi/Makefile      |   1 +
> >  xen/arch/x86/efi/efi-boot.h    |   7 +-
> >  xen/arch/x86/efi/mbi2.c        |  66 +++++++++++++++
> >  xen/arch/x86/efi/stub.c        |  10 +--
> >  xen/arch/x86/include/asm/efi.h |  18 ++++
> >  6 files changed, 123 insertions(+), 125 deletions(-)
> >  create mode 100644 xen/arch/x86/efi/mbi2.c
> >  create mode 100644 xen/arch/x86/include/asm/efi.h
> >

Frediano

