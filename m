Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A67F8A07F4A
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 18:51:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869064.1280569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVwgn-0004zS-FU; Thu, 09 Jan 2025 17:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869064.1280569; Thu, 09 Jan 2025 17:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVwgn-0004xV-Cu; Thu, 09 Jan 2025 17:51:25 +0000
Received: by outflank-mailman (input) for mailman id 869064;
 Thu, 09 Jan 2025 17:51:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OfsQ=UB=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tVwgm-0004xP-Dd
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 17:51:24 +0000
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [2001:4860:4864:20::35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55f1ad4e-ceb2-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 18:51:22 +0100 (CET)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-2a7ccb2c618so627958fac.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 09:51:22 -0800 (PST)
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
X-Inumbo-ID: 55f1ad4e-ceb2-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736445081; x=1737049881; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPqu2fRRv0rcK37Sh0o8ER+89uB3jH6MwdVNpQzD1Iw=;
        b=PeNZMgyCBu4RWGp5bUxEPjJnQVsHkqg96M150e7qmPyXggTYezjT6jWdkH0FjHi5KS
         dwYsytwjqUoMKCjavfdVy5zXCiF0OyamPbzts/Dd5Mapi5usM8PB1B02RBbX5XfEEy/H
         tjPejrQKty+AYOdwDpMBYcW2ZOf6jSdQ4kb6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736445081; x=1737049881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XPqu2fRRv0rcK37Sh0o8ER+89uB3jH6MwdVNpQzD1Iw=;
        b=cDR1riAIsHYqmFCPVtW0SE6IxJOb3ms8eiZEevBY6ZaOCmrXxj8Z+skxm4UYWvTY/L
         3tJbVQOFZlqDsnCrETsHHhrxnteTUGdsXwLoulVMdEA8nSsIrtqU57J71E7z/UFQO1SX
         cItAByY/PRfwYnDTpe5wBRTq1bwBQ6kCCpCQiIPEJWsoQmsVhgMV46NMlj8CT6hy2y3p
         Ir3YavFK5u/JiK0wX4qEnXV4CEy9zQ0S1ExQQcdQrpKZcRujofPql1eesfUk1QN5TObf
         fPYVR/q9hPyiYOQfue+Pn1lk3kyK8vDcpopTHDmWoHWspXshkZ1Xv/sOSt0K6F2U4MEA
         WxTg==
X-Forwarded-Encrypted: i=1; AJvYcCX5TO+pdtrHA/cPTvhTim3FdYkZjGuJQh0Y3sXrqDFUbvMSZFAHvOIMMCMVAfp6AvzG2xowKbzgZvQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzakQzoVUE6wervrqB1Xaw96/XGK31pHtYyB3vyXoVCHTIjGfVA
	XSQtKm/Udix+ludykp6V0OZURXc/W52HRflFKhXNbO9e1u52uykNu3ow4Xs6uQau+W1WUfKkW7Q
	l0LvR0P2aA7DfS7XiyzU2aS17/8JifJn+f0r5Cw==
X-Gm-Gg: ASbGncs2cjzFuhcOpvMrW0JrVjqSLWNeHSwJQG+Bl7z496mmBdoeTRBt22dRgo7skpI
	DBHzYx01g7jlc8mrspAjnkKd6VTn1V3h5uCG9
X-Google-Smtp-Source: AGHT+IFhT9u8LxvSlR8/dyau0g+emlJTE5xSPO4iK1LdQj7klaRnotVnc9NUHJuW9IACt3fVTPeiQdneFdSKXh9FOq4=
X-Received: by 2002:a05:6870:2dc9:b0:29e:5f1f:152d with SMTP id
 586e51a60fabf-2aa06523f1bmr4039766fac.8.1736445080785; Thu, 09 Jan 2025
 09:51:20 -0800 (PST)
MIME-Version: 1.0
References: <20250109131515.1757764-1-marmarek@invisiblethingslab.com>
 <d7421558-c2d6-485b-96bf-927992c5c066@suse.com> <47378338-ac05-4041-a055-56045e5ba131@citrix.com>
 <CACHz=ZjR6dSy_NsrXkhf_VfZpGYE4et6VkQvU_cO9DdAnXBzxQ@mail.gmail.com> <689e4152-b48b-4808-a407-6c33e6e071e0@citrix.com>
In-Reply-To: <689e4152-b48b-4808-a407-6c33e6e071e0@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 9 Jan 2025 17:51:09 +0000
X-Gm-Features: AbW1kvZISLWkjGml4zU4US40joRhgRBZiB67PQahw-3T6uJhjuBQN2eKM6WKhMc
Message-ID: <CACHz=ZgL8xnT1cX+mo-YG0opGvzPNpWQgmLL5XE0rTHA6AZuQw@mail.gmail.com>
Subject: Re: [PATCH] x86/boot: adjust text gap/diff to work with 64-bytes
 alignment too
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 4:03=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> On 09/01/2025 3:30 pm, Frediano Ziglio wrote:
> > On Thu, Jan 9, 2025 at 1:44=E2=80=AFPM Andrew Cooper <andrew.cooper3@ci=
trix.com> wrote:
> >> On 09/01/2025 1:23 pm, Jan Beulich wrote:
> >>> On 09.01.2025 14:15, Marek Marczykowski-G=C3=B3recki wrote:
> >>>> Xen compiled with -mtune=3Dgeneric has .text alignment set to 64-byt=
es.
> >>>> Having text_diff non-64-bytes-aligned breaks stuff:
> >>>>
> >>>>     Traceback (most recent call last):
> >>>>       File "/builddir/build/BUILD/xen-4.20.0-build/xen-4.20.0-rc0/xe=
n/./tools/combine_two_binaries.py", line 96, in <module>
> >>>>         raise Exception('File sizes do not match')
> >>>>     Exception: File sizes do not match: 70160 !=3D 4080 + 66048
> >>>>
> >>>> Adjust the numbers as suggested by Frediano to work with 64-bytes an=
d
> >>>> even 128-bytes alignment.
> >>> And then breaking at 256? As indicated on Matrix, imo we should be ab=
le to
> >>> cope with anything up to at least PAGE_SIZE. Or we should reduce .tex=
t
> >>> alignment before linking.
> >> Do you have a concrete proposal on how to do this?
> >>
> >> Because if not, we've had 2 downstreams hit by this build failure, and
> >> we probably ought to take this patch as a stopgap fix, and see about
> >> doing the better fix for 4.20.
> >>
> > I agree with this, merge this and then leave the improvements for follo=
w up(s).
> >
> > Yesterday I checked the output object file (built-in-32.o) to find
> > that the output alignment is 1 byte, which is obviously wrong!
>
> No so.  It's perfectly easy to end up with 1 byte alignment on .text,
> commonly with -Os.
>
> e.g. In my build, reloc-trampoline.32.o has:
>
> Sections:
> Idx Name          Size      VMA       LMA       File off  Algn
>   0 .group        00000008  00000000  00000000  00000034  2**2
>                   CONTENTS, READONLY, GROUP, LINK_ONCE_DISCARD
>   1 .text         00000076  00000000  00000000  0000003c  2**0
>                   CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
>   2 .data         00000000  00000000  00000000  000000b2  2**0
>                   CONTENTS, ALLOC, LOAD, DATA
>   3 .bss          00000000  00000000  00000000  000000b2  2**0
>                   ALLOC
>   4 .text.__x86.get_pc_thunk.bx 00000004  00000000  00000000  000000b2  2=
**0
>                   CONTENTS, ALLOC, LOAD, READONLY, CODE
>   5 .comment      00000020  00000000  00000000  000000b6  2**0
>                   CONTENTS, READONLY
>   6 .note.GNU-stack 00000000  00000000  00000000  000000d6  2**0
>                   CONTENTS, READONLY
>
> and this is entirely reasonable IMO.
>
> That said, the fact that built-in-32.S does not have at least one .align
> directive probably is an issue.
>
> x86 will cope, and there's nothing interesting in this code that's going
> to choke on being misaligned.
>

What about something like
https://github.com/freddy77/xen/commit/299a1fd70a84e9b52b84d59daff6878a3c42=
a595
?

Frediano

