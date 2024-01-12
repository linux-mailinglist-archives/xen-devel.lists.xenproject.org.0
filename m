Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F6082BD74
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 10:43:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666709.1037518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOE4e-0005bT-Ta; Fri, 12 Jan 2024 09:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666709.1037518; Fri, 12 Jan 2024 09:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOE4e-0005Z2-QY; Fri, 12 Jan 2024 09:43:36 +0000
Received: by outflank-mailman (input) for mailman id 666709;
 Fri, 12 Jan 2024 09:43:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OJSm=IW=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rOE4d-0005Yu-Ac
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 09:43:35 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0caa36b9-b12f-11ee-9b0f-b553b5be7939;
 Fri, 12 Jan 2024 10:43:33 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a26f73732c5so736815566b.3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jan 2024 01:43:33 -0800 (PST)
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
X-Inumbo-ID: 0caa36b9-b12f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1705052612; x=1705657412; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2QSHPKL0uDRekqreT9rA+JEVU2eVavDOd3CwdbQPKk=;
        b=epbzNm3GmqVj3gSU/S6UNaviUCB1JA3Qe8OH0tNcDU4vl0I0arVsM7ecqJmolgMb6C
         kP/WMOS07YN/Jha6TXS0dup0eNQDvR9eK0L/pje57RSF85G8dASVzG+8ERi74XoCsnhs
         7tZkLfeLk9R3zFYKmuVLsmOskRbj8/HGwWcVy0sRteS1kfucaYHplUtX/5FT7ED3yxJ5
         hPu8p4gKACz28SJ1+4XwmZrhGiWeNwDYYQBRVrXsw0Y6MlRujAv10r7LxgK8sE7H32Sp
         xO42uPEgp3mFn88o5MQbYjUnWr7KRzAGC1BETO8VhkCHLHbyJ83WJ4TDUeyy5rc4ry5J
         Q7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705052612; x=1705657412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p2QSHPKL0uDRekqreT9rA+JEVU2eVavDOd3CwdbQPKk=;
        b=kCmovS8LZcwieI0qLQQ1b6csqm8UpX+YjRiu4mJWOz2lhI+bv5LLspoltJX03XTtMO
         3GZYvVALK2N2bx7BuBgD72OJ22c52wQrytONMBcOshsREdfwGpu/noUb7LRdHStn6mbF
         lhkAaHJEk9Ue5mkkwkPzzloQjdC2GxuYwW+FQYbEbhBNJD4iOM1jePhE3p/xnk0NwI+U
         JaXvGNQ1QVEZhojIYQ0YtxM7dsEmfMFWnAz831yWxD3oSVd/RQ/X2nCnuZy5vTqY7cEq
         Ema+kDwwim9afQ5ZjhxIhj4C8V/dbp5Go95vFmnp2KRo9KZ/rxJkEO/Q1JCVONtaZeaT
         CE0A==
X-Gm-Message-State: AOJu0Yxq+CXWfY8yyeHSuVZMEEFFuG60ktCtxeCJGUcNIGxMXztMcD2J
	8z54nP+CQuxJRDyAD1B3mSdQMPFDQPfzSF7qbp/IyPD8GWR+lw==
X-Google-Smtp-Source: AGHT+IEZffuPOUm59yPVEeg3aZJWNEBTzm033fQlyMjGZe/EnpzxR5H7OqnzSLwDnrJ7goC4QvAo/6GF3epvUwqNNbg=
X-Received: by 2002:a17:906:79c4:b0:a23:482:ee74 with SMTP id
 m4-20020a17090679c400b00a230482ee74mr507816ejo.28.1705052612455; Fri, 12 Jan
 2024 01:43:32 -0800 (PST)
MIME-Version: 1.0
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-8-carlo.nonato@minervasys.tech> <8212c8c3-762b-4163-b734-2c759c8c3b12@suse.com>
In-Reply-To: <8212c8c3-762b-4163-b734-2c759c8c3b12@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Fri, 12 Jan 2024 10:43:21 +0100
Message-ID: <CAG+AhRXb0_ygh_D07bJiEOmn6LZdF0f=F8tmzVSx1Kn7cGh-pw@mail.gmail.com>
Subject: Re: [PATCH v5 07/13] xen/page_alloc: introduce init_free_page_fields()
 helper
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Tue, Jan 9, 2024 at 11:36=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 02.01.2024 10:51, Carlo Nonato wrote:
> > Introduce a new helper to initialize fields that have different uses fo=
r
> > free pages.
> >
> > Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> > Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
>
> I might in principle ack this change, but what's the deal with this 2nd
> S-o-b? The typical expectation is for yours to be last, and the 1st one
> being the original author's (which generally means you can't be the
> original author in such a case, yet the absence of a From: suggests
> you are).

You're right. I mistakenly copied it from other patches.
I did the same in #10. Will remove Marco Solieri from those.
But there are some patches where we are both authors, so I will leave both
Signed-off-by.

Thanks.

> Jan

