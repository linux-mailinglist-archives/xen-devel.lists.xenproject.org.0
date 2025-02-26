Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF8BA45421
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 04:47:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896155.1304828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn8NI-0006fx-BZ; Wed, 26 Feb 2025 03:46:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896155.1304828; Wed, 26 Feb 2025 03:46:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn8NI-0006de-8g; Wed, 26 Feb 2025 03:46:20 +0000
Received: by outflank-mailman (input) for mailman id 896155;
 Wed, 26 Feb 2025 03:46:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+Z1=VR=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1tn8NG-0006dV-IS
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 03:46:18 +0000
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [2607:f8b0:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3af31e54-f3f4-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 04:46:16 +0100 (CET)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-7272a4b685eso1063958a34.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 19:46:16 -0800 (PST)
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
X-Inumbo-ID: 3af31e54-f3f4-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740541575; x=1741146375; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUET80AIJLMls951De1llyiKKyjDF7mJwHg9NQi4Sgg=;
        b=nY73LtK4SHft9jHxsYRevoi8dbUJj9njtWZJBXUe9UG9tJkq8BJBku5o6ELGzg8klE
         6W45Jw2SwDrpvJaCF9ETXbhO/cDv5AsPPtmo5Xw1Z5VaYnRCTnXMFgDcHS/IfJu0f6rR
         slnnY7WJa7AJxezVNqRdSt4wOv0mx1p/+oqZlWrm2eGG0+CQhv9jm3xxPP4sR5lh8omk
         pgt7GfnxUwWXfh7iUrGLN9UJETM0NHBLWBuGBPT8NWWo/FFqOlqe9lcJmd9i6C5CIG0U
         Ni4IBdhZYQOMmMGrGYUGg9OY3SVEhvF3clK1XJ0FXwxWgfTMDTi/cLoWqYiUM+Xp2TKe
         pXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740541575; x=1741146375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUET80AIJLMls951De1llyiKKyjDF7mJwHg9NQi4Sgg=;
        b=Zh1eqYE5UQA4s3MGuqUzee79sBFJzT/TUObgNsCU64JT6KPl4VbUpsqLnJgAkbYSle
         fPQfm2rS4jyHc3oVDOhBySePanBkqaeK00uLfWI2UXiMn/QPVw2a8v/nBml5uKoPVkkc
         c1fsMJ6v8CXe7uBLBZqWfWRsJ0yHqeWweSExTdS1mLjndx5//CXxaQ0vA+sg1EIHrLRa
         q5mMofgwqGKvamPnb45hpxAA32TaPgYjA1YEU46ZOtFnBHWNSPpqi9lyfCNBeipQYqa8
         EeYPb7SbMd/vlh+FE7aFHPT5VSNic/BsPYS/+Tr3B7dp+248I9cMyy3TZf+T+XMAchNB
         99IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhjZIlUNP73Icv/7BvcmPbQ3y3+/AbyndhKj81bx8sdRhG4Psc8uePuIea06E3X6RZ9Y6tp0yEfsA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwwompfPT8t5GSq0kX/9/HH0dzfrWp3kQGN4ml0ByRKGQ2PZ1RI
	5WrSAUtNJon6b8fJJZC47dPBaiPzE6mDkUno0Z0pYJv1tYrH8B1YryMrpdstgv1OW8/p8ipiTg/
	GVzv3T6olka8Wj9UCms0/gRxnY6hAp+fE
X-Gm-Gg: ASbGncuE+43Iy07QHClCoIWDTFCReyAYfpEWoiWxt5gjSAsbgjh5OKXO2Bal+m038Qh
	Y7qrKiOTpRQmhL6AUpFTtVl3Ss/eXLAfaVAyxkkjP0yddu5kEkE5pZTvr0aUvsiBpjvPMw1IaR4
	oJGAJyqxhCvCD30ZttS2jR9Y3JI2E3z5bI8gtCimOZmg==
X-Google-Smtp-Source: AGHT+IF2LMwDQNOU1OMkEdU4Or2Ni29n61lrmF5tgMie2B1UFzyDJn153rxRx5ZaaSZp8E7aUddAPNRLqY+HRi4R/ho=
X-Received: by 2002:a54:478c:0:b0:3f4:2274:3cd0 with SMTP id
 5614622812f47-3f4247e445fmr4467846b6e.8.1740541575282; Tue, 25 Feb 2025
 19:46:15 -0800 (PST)
MIME-Version: 1.0
References: <CAKBKdXhaQLj01Kn06xMBsHExT1xNMKnHxTB+Hu33jtpySr-few@mail.gmail.com>
 <be2314bd-d212-4b9b-a50c-1b86b42ab861@suse.com> <CAKBKdXgMn90_R6_rKWAzrQdkpPXL1-ZxAKM8n8RPXiOeY7VtJQ@mail.gmail.com>
 <Z75lN_ShrXUGiT5e@mail-itl> <CAKBKdXh0ANyMnB2VbB8ayp64DmOnHTw8WwB4VNQ7NxjpbfV2oQ@mail.gmail.com>
 <CAKBKdXi=eufqCThU0Qf8mBqJ8zXbi9NtFKJN1c=H2ow4nFoo0w@mail.gmail.com>
In-Reply-To: <CAKBKdXi=eufqCThU0Qf8mBqJ8zXbi9NtFKJN1c=H2ow4nFoo0w@mail.gmail.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Wed, 26 Feb 2025 04:46:04 +0100
X-Gm-Features: AWEUYZk9Ip2FaZ4jUQMaMNatdr6_IlwUCYfHbHWEccCQQgebB2NE7gBaOAXcibo
Message-ID: <CAKBKdXgrRScJZ9LvOe2vbFbMyaJP4hGuFPsR=yubcicu6tAedQ@mail.gmail.com>
Subject: Re: xl create/save throwing errors
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 4:23=E2=80=AFAM Petr Bene=C5=A1 <w1benny@gmail.com>=
 wrote:
> I finally managed to capture a few non-corrupted crashdumps.
> The cause of crash always points to the same symbol:
> nt!KiIpiProcessRequests+0x193

It appears that the Windows likes to manage its own IPI - i.e.
KiIpiSendRequest stores the request packet to the
KPRCB->RequestMailbox, and then KiIpiProcessRequests takes that
request from the RequestMailbox.
If someone externally interferes with that (Xen?) and triggers IPI
that Windows doesn't expect, then Windows crashes - likely because it
takes some invalid/stale value from the RequestMailbox (which wasn't
set properly by KiIpiSendRequest).

This is just a wild guess and it might be wrong. But clearly,
something weird is happening around IPI during the xl save process
that Windows doesn't like.

P.

