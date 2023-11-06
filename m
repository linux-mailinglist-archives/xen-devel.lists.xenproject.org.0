Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 651897E22CD
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 14:05:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627966.978919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzzHk-0004tR-0X; Mon, 06 Nov 2023 13:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627966.978919; Mon, 06 Nov 2023 13:04:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzzHj-0004q6-S7; Mon, 06 Nov 2023 13:04:55 +0000
Received: by outflank-mailman (input) for mailman id 627966;
 Mon, 06 Nov 2023 13:04:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H3DI=GT=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qzzHi-0004q0-H2
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 13:04:54 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1257b9f3-7ca5-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 14:04:51 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-53e3b8f906fso7374202a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 05:04:51 -0800 (PST)
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
X-Inumbo-ID: 1257b9f3-7ca5-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699275891; x=1699880691; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6G3kfz4ehKniPbbIVtZsVpSce3D5iXid7MrLz4n+S8=;
        b=Q3JTeW2U3uMhD4RU2aBNJWN7POmQZm0UwqU+Zh21AIMfRvboOhg1/+RdW4IFcSZvrF
         XTRAcJFOzfSx9+2Fwlbtm4Zp8NNn5/UXX4e+57JtpEW9fkEoR2cWvXht9+X6BB820qBy
         eqy5D88iH/uphxznLWXGFh2n/ODbqM5myAgGNU9UReR5oExori+EJ59YTXqM/BRQXcXz
         Rujh4qmdurLUy5UTSrWhSSX4Yl1W99mZ42dNP8uRJ4t7gifVE9oYPjQ6X+lSJC6J+Fyu
         slXVFaSr9/JXF/qz1pVfUgbb9F0xktbyCllxg1bC2rtNTI8iQ7lReNywWYVqH7dbSv2u
         WoIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699275891; x=1699880691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6G3kfz4ehKniPbbIVtZsVpSce3D5iXid7MrLz4n+S8=;
        b=ppaFpB4/J3+JqEQQ3rAdcoyrFL2Opwuk9hYay07ilkEIEEFXVQZSAqh9VYmqvo5B4C
         YhuaqlYUbrhmYEqlsQXuFRuoDJK3CPn5kWLT5he3VAAXAr2ESR9M9CpgKrK46EFJux+e
         o9dLPKV/vhV93ZutkkLj3ESgtV97pRUPe4YiUIJkL6Xud7cgScJk/o1ujtSWRgq02sN1
         CmTKnlFiXk/dbVkz6+X1Lw7ic0psCLzycZ2EG8gqKteI6VoWQh36OePZ/TbdzpV7obOi
         HwEznKmIzCYFykk8q6HEI1uAfrQZBvG+9oSucQ20YK3zGFW+W8GoIgVuDfIRFgB4uEzn
         YKaQ==
X-Gm-Message-State: AOJu0YwidXu8nvMVmQ4IbBidC0YwmTKo7Y1XTZGS/H/2PHcdILTyux8p
	FiIA6CzR8xrQYNwY0cGBOLGaqW8Eui8hX8kndic=
X-Google-Smtp-Source: AGHT+IHNTIqP6ToEdeqngXDCOEEAnsMCVUqjZ+aX7lAtXPd6HynR+mVj6N6VhZOT9LS/RfowLB+PJlOoot9Uzd/3tHQ=
X-Received: by 2002:a50:d583:0:b0:53e:ec17:c885 with SMTP id
 v3-20020a50d583000000b0053eec17c885mr25193224edi.10.1699275890837; Mon, 06
 Nov 2023 05:04:50 -0800 (PST)
MIME-Version: 1.0
References: <20231103194551.64448-1-jandryuk@gmail.com> <CA+zSX=aoRoGY3--7uLZjvVeGQbQ+ns+Lio=voWr88o4j8j-d6A@mail.gmail.com>
In-Reply-To: <CA+zSX=aoRoGY3--7uLZjvVeGQbQ+ns+Lio=voWr88o4j8j-d6A@mail.gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 6 Nov 2023 08:04:38 -0500
Message-ID: <CAKf6xpvmQuNP9=zR1mZbEiJ_no_ehcU_FVZsnExoz0gpJjT8Ug@mail.gmail.com>
Subject: Re: [PATCH for-4.18 0/2] golang: Binding fixes
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>, 
	Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 6, 2023 at 6:52=E2=80=AFAM George Dunlap <george.dunlap@cloud.c=
om> wrote:
>
> On Fri, Nov 3, 2023 at 7:46=E2=80=AFPM Jason Andryuk <jandryuk@gmail.com>=
 wrote:
> >
> > These two patches refresh the bindings which have gone a little stale.
> > I used two separate patches since the XSA-443 one may want backporting.
>
> Thanks for these.  Out of curiosity, do you use the golang bindings,
> and if so, are you happy with how you're consuming them now?  We had
> talked at some point about exposing the bindings somewhere on xenbits
> (or maybe gitlab) such that people should simply add the path to their
> golang projects and have it download & build like "normal".  Is that
> something you'd find useful?

Hi George,

No, I do not use the bindings, so I cannot answer your questions.  I
just noticed the bindings were stale when doing a rebase.

I think Andrew's idea to check these via gitlab is a good one.  They
seem to often be missed.  I only noticed because I had installed go,
and I only installed go to check binding generation for a previous
patch series.

Since the bindings are auto generated, do they really need to be
checked into the tree?  If gitlab checks their generation, then maybe
they don't need to be checked in?

Regards,
Jason

