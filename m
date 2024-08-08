Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A7394BE25
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 15:06:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774096.1184588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc2pv-0000VW-90; Thu, 08 Aug 2024 13:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774096.1184588; Thu, 08 Aug 2024 13:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc2pv-0000Tp-6N; Thu, 08 Aug 2024 13:05:47 +0000
Received: by outflank-mailman (input) for mailman id 774096;
 Thu, 08 Aug 2024 13:05:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vpfq=PH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sc2pt-0000Tj-Ps
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 13:05:45 +0000
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [2607:f8b0:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb0feeb5-5586-11ef-8776-851b0ebba9a2;
 Thu, 08 Aug 2024 15:05:43 +0200 (CEST)
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-3db1956643bso710262b6e.3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 06:05:43 -0700 (PDT)
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
X-Inumbo-ID: eb0feeb5-5586-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723122342; x=1723727142; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UuzBqePRBVg6JlXG882Jdv6LFkF4h8QLEp7OIo+zHs8=;
        b=D+YoaZbQqXbsfv4WxKJdHke26xJBbvaC/0uNY3f5mL4Q6qCqof0v3gmotdSEy1Qt2V
         HPZ/X2wm+PK8+ULJuEQL1LxtLLZd2cHEwvfRSXXNa6bHPdXICLQx1XfciAJKJmw2vJHB
         v479boSY+VHD5wGJXKOJZGsRCuIjxjJ4rmoDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723122342; x=1723727142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UuzBqePRBVg6JlXG882Jdv6LFkF4h8QLEp7OIo+zHs8=;
        b=mYX7fxw5fzBLTwIwt6EybvVFSTdKnJvOncAX1tyIlMGQX+yYyPYG3dCQt5Pj875xLn
         c8sSK9wgljzct4aNG4og9uAdawy6EMTthef2HtR+2H1XVufhoAkH8uvQYIM9+0Yxm1RI
         WMGJbZr5GfeZcFB5FhNKYAT+5onZm0MLps5J6paOacvTgQdTsMBB1NPxIYBh8ah82knn
         iPuiC2Xcs4GY7ni5agcE4kKJ3K8GDgsPq+TR7SfnEDoFa9uCFPQuxs9TJmq7D27iLsfe
         ECml8Ou9SSptj30IYWWHjODq4X2Hhs462h9+VJbAso5EUJIgyIrYgbJL+TWiH9+fBOZa
         VDlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeoZf+qgymYwcLaFrLjhylmh4I3Kb3ZUrJVr+RB2ijpnVDtHEf2FodYOQ1Q+weulD2HWzQCi73g5UZBIDYaqJO3FV3D07Rz/oIG4YKT/k=
X-Gm-Message-State: AOJu0YycpETnPS/C8ZPbdlO+pHDKgZTh7NbkB3K+iVqNoEgrGqtiKPcZ
	HmSf9DqKnVPOWXJPqLduFNHVjtjCgVChamwblkccWEO3+Cj8uml5K7h4gMkG48c/fTooFml1YvY
	segXMrw+m4dcP6F9S0DwfrYYpos3PyOtxTfnwvQ==
X-Google-Smtp-Source: AGHT+IHvs5Hv9Gnq1NYHSXCAyfzK/r45jcLRpXWVlN5gvL+YrNmTzAyumfP7pPxIJSlXC57r1CKWf++JxdsrL35ff8k=
X-Received: by 2002:a05:6808:1481:b0:3da:a48b:d1e6 with SMTP id
 5614622812f47-3dc3b41ada9mr1922461b6e.16.1723122342315; Thu, 08 Aug 2024
 06:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240807134819.8987-1-alejandro.vallejo@cloud.com>
 <20240807134819.8987-2-alejandro.vallejo@cloud.com> <ad72cc97-b9dd-4e7e-93f6-333805e40785@suse.com>
 <CACHz=Zh7wK58mbB762fnevHEKW9qhp-NRJ6buNe1b-qLxP0qPg@mail.gmail.com> <b9b40658-ff13-4240-98a2-4811411e31b6@suse.com>
In-Reply-To: <b9b40658-ff13-4240-98a2-4811411e31b6@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 8 Aug 2024 14:05:31 +0100
Message-ID: <CACHz=ZhC7J_vEZJV9hpET_LONYDFpptYDGEt=U+a=htNA-vCLw@mail.gmail.com>
Subject: Re: [PATCH 1/5] x86: Put trampoline in .init.data section
To: Jan Beulich <jbeulich@suse.com>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(added again missing recipients)

On Thu, Aug 8, 2024 at 9:54=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 08.08.2024 10:00, Frediano Ziglio wrote:
> > On Thu, Aug 8, 2024 at 8:34=E2=80=AFAM Jan Beulich <jbeulich@suse.com> =
wrote:
> >>
> >> On 07.08.2024 15:48, Alejandro Vallejo wrote:
> >>> This change allows to put the trampoline in a separate, not executabl=
e
> >>> section. The trampoline contains a mix of code and data (data which
> >>> is modified from C code during early start so must be writable).
> >>> This is in preparation for W^X patch in order to satisfy UEFI CA
> >>> memory mitigation requirements.
> >>
> >> Which, aiui, has the downside of disassembly of the section no longer
> >> happening by default, when using objdump or similar tools, which go fr=
om
> >> section attributes. Why is it being in .init.text (and hence RX) not
> >> appropriate? It should - in principle at least - be possible to avoid
> >> all in-place writing to it, but instead only ever write to its relocat=
ed
> >> copy. Quite a bit more code churn of course.
> >>
> >> I wonder if we shouldn't put the trampoline in its own section, RWX in
> >> the object file, and switched to whatever appropriate in the binary
> >> (which really may be RX, not RW).
> >
> > We cannot have RWX to satisfy UEFI CA memory mitigation, that's why I
> > had to move it, code sections should not be writeable. We can mark
> > either RX or RW but we use the data very early so we are not able to
> > change the permissions (we can try with all complications that this
> > could bring like how to report an error at so early stages).
>
> The early writing could be done away with, as indicated. There's not
> really any strict requirement to write to the trampoline region within
> the Xen image. All updates to it could in principle be done after it
> was copied into low memory. Then (and of course only then) could it be
> part of an RX section in the image, maybe .init.text, maybe a separate
> .trampoline section.
>
> Jan

Not sure if I should be flattered or scared with that.
You are surely putting quite some trust on me. On the other hand you
are putting also some effort.
The change I proposed is just one line, you are asking to check all
reference, change them correctly and possibly testing them all.
I tried to do a small test (removing symbols from the trampoline) and
for instance head.S is writing to that section. That would require all
references to be made after the copy and to the copy. At the moment
the copy is done differently for different paths so it's less
straightforward than it seems.

Frediano

