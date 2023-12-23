Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9381C81D6A5
	for <lists+xen-devel@lfdr.de>; Sat, 23 Dec 2023 22:36:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659774.1029518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rH9fB-00049o-BH; Sat, 23 Dec 2023 21:36:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659774.1029518; Sat, 23 Dec 2023 21:36:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rH9fB-00047t-8X; Sat, 23 Dec 2023 21:36:05 +0000
Received: by outflank-mailman (input) for mailman id 659774;
 Sat, 23 Dec 2023 21:36:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rcCX=IC=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1rH9f9-00047n-KJ
 for xen-devel@lists.xenproject.org; Sat, 23 Dec 2023 21:36:03 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44f7a1f3-a1db-11ee-98ed-6d05b1d4d9a1;
 Sat, 23 Dec 2023 22:36:02 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5542106d393so3029168a12.1
 for <xen-devel@lists.xenproject.org>; Sat, 23 Dec 2023 13:36:02 -0800 (PST)
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
X-Inumbo-ID: 44f7a1f3-a1db-11ee-98ed-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703367362; x=1703972162; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p51stket9prOiCFx5//IqKgnbwCEfz6b8oIv+vzWE+c=;
        b=Eb9JKd4GWTjjjjL/PTBlzW9R0fEKfZSdw+uDNQBbkaT+7xx5QeXyijlhxILcMIwpAR
         D/edoESOrLkVEMu9y0N0+BFk25awH6faf2Cr/mbsDJwm3eWB9h5tw4HiIHjLbcvRYucX
         uo1JyYR4rGV9u1oQ39HHf3ZijEeK92BP1L+JNpgOUR04OjFCFW45tKJeIycUiz1pi9Uk
         y557jj2KSb2TU2xnoj+oswcjzfwiy0F5g1e1QtkRZic7hh1QZiWlFKwK1QvMnPEnXy+g
         xWbMxZAb0asokoZcC5XW3jbklrAhV/AxvSDCd9evx6FNLYvGKPA6z1A5205Z/+uipaOX
         etMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703367362; x=1703972162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p51stket9prOiCFx5//IqKgnbwCEfz6b8oIv+vzWE+c=;
        b=IoNV+fezdoeTZ96JZbhcMFvZQHXFjyVuexVPahoDQ5fUs7Ot/w8IlS8uLxywKpLRsH
         sJgW7fpa72jpWxfp8/An/LLDaKq4Pcqp9HaCRNiVp5BM0ULZWeXNUKoO8CR3RCQjAAk/
         JLYN6CcKZs54tG2Tqdt9t8t3P2FPrbnVKRPjAS2XZs/cFTYasNppcx2z1uqFxn7VBJq1
         efU+HGCjNrECP6a9nU4PF4U0a1zs/iV+j6ArO8WHrHEIk8gGMbyzdv3RyMPkvekorKxU
         oL/Go/POFu5BCrjytBQ9+B03dB6jd7ZI7YvqbyZXXn21A4831frHsrSnV+MW8q+VIM5Q
         v/oQ==
X-Gm-Message-State: AOJu0YwWyR9AbQuwtFJMTgRg6Uz2veZfDUZs1kxltTUaPkdSOXW2hPh7
	ygQqBgQTLILmINx/HRvfVnu1EdU53AGTEJONYUSeB3Nz
X-Google-Smtp-Source: AGHT+IG9OnL3xeRKN1gvdyCsw4IHOhUWPaTVrdtOpiLLTh9ufo/ze+oPMZTTHwtHqcHY9iVfpkbXxcyzQIeZijKU4wQ=
X-Received: by 2002:aa7:d787:0:b0:553:bd7c:569 with SMTP id
 s7-20020aa7d787000000b00553bd7c0569mr2239636edq.24.1703367361600; Sat, 23 Dec
 2023 13:36:01 -0800 (PST)
MIME-Version: 1.0
References: <580c6c48-9dd5-4296-8696-2b40beac2bc3@suse.com>
 <5d76295f-0438-4c5d-8b2e-73a1abcc96e6@suse.com> <CACMJ4GbvMhDdgOp=kUeL_+_j2yS_NVU69P8Xh9QYDLUwJ31Eow@mail.gmail.com>
In-Reply-To: <CACMJ4GbvMhDdgOp=kUeL_+_j2yS_NVU69P8Xh9QYDLUwJ31Eow@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Sat, 23 Dec 2023 13:35:49 -0800
Message-ID: <CACMJ4GbNJgsg7tts=9UQPUr9ofsXajuHz7wYO1r5LnevWEL4_g@mail.gmail.com>
Subject: Re: Ping: [PATCH] Argo: drop meaningless mfn_valid() check
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 23, 2023 at 12:47=E2=80=AFPM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> On Sun, Dec 17, 2023 at 11:55=E2=80=AFPM Jan Beulich <jbeulich@suse.com> =
wrote:
> >
> > Christopher,
> >
> > On 27.11.2023 14:55, Jan Beulich wrote:
> > > Holding a valid struct page_info * in hands already means the referen=
ced
> > > MFN is valid; there's no need to check that again. Convert the checki=
ng
> > > logic to a switch(), to help keeping the extra (and questionable) x86=
-
> > > only check in somewhat tidy shape.
> > >
> > > Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>

I'd like to hold off on this just yet, sorry -- the change does look
ok as far as a transform being applied the prior logic and the
necessity of the check, but with it applied, it's not obvious that it
handles all the page types as best that it could there, so I'd like to
look at this (and the previously submitted patch again) please.

Christopher

