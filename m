Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0086A8C9066
	for <lists+xen-devel@lfdr.de>; Sat, 18 May 2024 12:19:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724728.1129885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8H8f-000618-97; Sat, 18 May 2024 10:18:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724728.1129885; Sat, 18 May 2024 10:18:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8H8f-0005y7-5P; Sat, 18 May 2024 10:18:05 +0000
Received: by outflank-mailman (input) for mailman id 724728;
 Sat, 18 May 2024 10:18:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v3Z6=MV=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1s8H8d-0005y1-Pm
 for xen-devel@lists.xenproject.org; Sat, 18 May 2024 10:18:03 +0000
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [2607:f8b0:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8183941-14ff-11ef-909f-e314d9c70b13;
 Sat, 18 May 2024 12:18:02 +0200 (CEST)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6f0ef6bee72so590521a34.0
 for <xen-devel@lists.xenproject.org>; Sat, 18 May 2024 03:18:02 -0700 (PDT)
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
X-Inumbo-ID: e8183941-14ff-11ef-909f-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716027481; x=1716632281; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1MdbXUXeDvckJAbagFPWhg2rYINBHeuo1GegK8vYnw=;
        b=lTiJPtmRWylMa3ZiQmzxWrSQaNN7uFNEzLBWbST6wJQjyIdT0AMst0NLNlgfl1ucc0
         ZBbUzCqylI58rA53ghRIc49rW/dZDdDaAEyqOqsRzcOaCppZ4iazxAcu/UzcfkOLchT0
         keKELxapqQ5fbXbK+MGQTGK8B99ZX/M6O0atm5Ccj45DZQCzg5cqzOKWFoiGKibgxedr
         yW7SrMlennAbEghdvK6VXXg2dryiEj9cDi4TCRm8lHYnLHeC8ljAmiIp0hYFpXFaMoa6
         prIZEoRxFOzwDwerKdWGTmDTLcpAZlypWJLk1QFLGRDaiarvBb3AdYV9wAHxAsvY7nfy
         m74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716027481; x=1716632281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1MdbXUXeDvckJAbagFPWhg2rYINBHeuo1GegK8vYnw=;
        b=qLPiLNiDLOiiK4hcFs5dzBtXReLuu9VPeuA08ScgHiIFlI4vzQJ/sx6CGFg7YL36jY
         sXNMLh177AigSr75QqTq44IiyRGN8Yg4eD3AtHTgJ1n0nJHjB7kvfLpiS5TWl9jzxvSL
         bYXnlRyWohnlBfOqGcDrhGYhSffR4v/B2gLqwvioc91FseClI8JrA8ovo4BOX1g3S+yF
         DWKIXgz4Ud/xxS3qyqQLi4epcyz9Lz1UUiVWYexAM3N4+WT5cDAFHycxtvbVtMaZ418r
         NyBr2GR49zz5noEgsLs9RTHAmSwnKjdVez/cX35JK6gFa1w+AZyQbbBur9NDvwkU3M+u
         4EWw==
X-Gm-Message-State: AOJu0YyJ8PEiMldaJzH0ju+ajj1XFJueh8PNIstrxk2ZNqLljZhlRoOV
	ml9eHL83rcGUrPMLICIowCSC3aOn5bimal3MxPhquOWLsFxAncWkUdv8E9nwBwsR6Wq/hkn/ZAv
	3X+XMsXLgPHJV1WwWjG6/F7XnmP0=
X-Google-Smtp-Source: AGHT+IHSpKUbM3Pc0cE7hQveNZdZbphdVrAuIJP9IQ1rBQuopVnrYRTYxVcI8uh3Dxn6FNHyUv4c6aAJ5vU23XyfI0U=
X-Received: by 2002:a05:6871:7246:b0:245:407f:96a6 with SMTP id
 586e51a60fabf-245408edb80mr8272524fac.36.1716027480867; Sat, 18 May 2024
 03:18:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1715858136.git.w1benny@gmail.com> <b6bf7e5ba0deab4550b9d15c327015fe7d94d463.1715858136.git.w1benny@gmail.com>
 <CABfawhmB+XND75WPJ_MjORyjUiV_h_NNmJQx2BaZ5WRmzkX79A@mail.gmail.com>
In-Reply-To: <CABfawhmB+XND75WPJ_MjORyjUiV_h_NNmJQx2BaZ5WRmzkX79A@mail.gmail.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Sat, 18 May 2024 12:17:49 +0200
Message-ID: <CAKBKdXh7rQ1x8vRZkXw1wC8M64Qk82mmz66XEa2gjjCZ+m7Arg@mail.gmail.com>
Subject: Re: [PATCH for-4.19? v3 4/6] x86: Make the maximum number of altp2m
 views configurable
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 18, 2024 at 3:18=E2=80=AFAM Tamas K Lengyel <tamas@tklengyel.co=
m> wrote:
>
> > -        ap2m =3D array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
> > +        ap2m =3D d->arch.altp2m_p2m[altp2m_idx];
>
> Why is it no longer necessary to use array_access_nospec?
>
> Tamas

I was under the impression that when the domain_create guarantees the
length of the array, and before each access to the altp2m_p2m there is
an explicit check if idx is within bounds of nr_altp2m, that the
array_access_nospec is not needed anymore. But apparently I
misunderstood how speculative execution works, when I now read about
it.

I'll put it back.

P.

