Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2108C0563
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 22:14:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718949.1121515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4nfp-00076m-U1; Wed, 08 May 2024 20:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718949.1121515; Wed, 08 May 2024 20:13:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4nfp-00072e-Qo; Wed, 08 May 2024 20:13:57 +0000
Received: by outflank-mailman (input) for mailman id 718949;
 Wed, 08 May 2024 20:13:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jfQ8=ML=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1s4nfo-0006cD-Qo
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 20:13:56 +0000
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [2607:f8b0:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7edc3742-0d77-11ef-909c-e314d9c70b13;
 Wed, 08 May 2024 22:13:56 +0200 (CEST)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6f05c253669so63692a34.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 May 2024 13:13:56 -0700 (PDT)
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
X-Inumbo-ID: 7edc3742-0d77-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715199234; x=1715804034; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRggg1p/EbSSaYTs12aw4BJeQ5wwLzbWoK6Lvonni98=;
        b=MGZ4dbEIujxbOoHMbJvp069eh6TdVODBrVbJLSuCT1c/xFaiFEqfj0bCJqn56lzVMF
         x5XpiJlI22Cn2898oBQHuBOp1f59M1usXF27iiAgF1C43RE5IWBx4v/B/4OZpvxYdiYv
         kqj54Voy72hn8WsbsepWb9gSFjOIt/adqk935aojCjPEEgsuT6VREYXAKU5j2cSDp1Qj
         jqI96L0lYho0aAaE/STu/2Chz2UpWBIalsFy7QmvLQu5B6+ZWdW+qEHO+V+yyxeB6VbA
         zeZLWVQwvyuPN0aH9iqm8B1BOS1YjuU3RvUnLDDtBycCqpl35a/Ea+CLORAm90dRLGMd
         bXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715199234; x=1715804034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRggg1p/EbSSaYTs12aw4BJeQ5wwLzbWoK6Lvonni98=;
        b=qfZeLGQ9AKjArF7b9n6HfCZJrr/HuJ3quEUQzUYk75BlpsymPvEsbXFVxvrYyKqYFB
         1ZOCa7bTi/fMB371KAFW87fq5V6kE/9nsC7QsSskdua1F0aAUg/C6rdvfBKRKCv8NB4s
         2Xf4BH0q63Pn8//H4IjQR6uBh09Te+IT34rs06L3knXhkwlfj42purokvljEpiZcWgDQ
         OtEoxCmy05uQKqI1SMM6/aDV3E9a9pR3eBHFsvb+2Wq568dhBZl2JAVs3ybZUh1w69WZ
         PJZBXp2mcQOlK+ehgL0xMFJQDfKsSElOAkvzIvjnu0RZI8TmsdWkw9ii+tyWuPYskN6b
         M2Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXOviRRSy7MLbVImN1U3IYNbZHuwocaKtfzDc0CqYOZBhmcEcfXACQCxR8+8HJ8DCixSDn3QKXpf0R5oqhk9LbJuaJf8IxYxSGuayBmD1w=
X-Gm-Message-State: AOJu0YxbQso61m0cNGXUV45/AY2S+oDv1Qjcxp7sQfdxUfUiFaoJj44f
	CceDE0BtmY+m6AVvrBXz1h4OTQSPQabwwaa2us737eXRFTIb6gBW9PQq1Hi70PWxnTzwP+Bdd/B
	GvgdF7xqot3B4RFmRHVZvdOJFLHo=
X-Google-Smtp-Source: AGHT+IEe4eS8xFuTEwl8jPS+WU9ndSX+h6zDLmDeaWYPbe4GCu87M5JtEWMd490lMCuLVzYypMlXwFOaRbLRkxUyxtg=
X-Received: by 2002:a05:6870:724b:b0:229:7d01:7e03 with SMTP id
 586e51a60fabf-240985b7368mr4030866fac.43.1715199234609; Wed, 08 May 2024
 13:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240508112323.38946-1-roger.pau@citrix.com> <20240508112323.38946-3-roger.pau@citrix.com>
 <d43a704a-fd2a-4778-9250-a69b483016b4@citrix.com>
In-Reply-To: <d43a704a-fd2a-4778-9250-a69b483016b4@citrix.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Wed, 8 May 2024 22:13:43 +0200
Message-ID: <CAKBKdXjSvJMZb=Djd+DxObM311gwrZ4MkhzkSrx36spWnrd4-w@mail.gmail.com>
Subject: Re: [PATCH for-4.19 v2 2/3] xen/x86: enable altp2m at create domain domctl
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org, 
	Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Tamas K Lengyel <tamas@tklengyel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 8, 2024 at 9:38=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
> Both fields can reasonably share uint32_t, but could you work with Petr
> to make both halfs of this land cleanly.

Hi, I think creating a new anonymous struct "altp2m" within `struct
domain` would be a good fit. uint16_t for my MAX_ALTP2M replacement
field will be enough, so the other uint16_t could be used for various
altp2m modes/flags.

P.

