Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2732E78450A
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 17:09:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588585.920134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYT07-0004Pf-5g; Tue, 22 Aug 2023 15:08:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588585.920134; Tue, 22 Aug 2023 15:08:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYT07-0004NK-1n; Tue, 22 Aug 2023 15:08:59 +0000
Received: by outflank-mailman (input) for mailman id 588585;
 Tue, 22 Aug 2023 15:08:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uya+=EH=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qYT05-000408-DH
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 15:08:57 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d01174ed-40fd-11ee-9b0c-b553b5be7939;
 Tue, 22 Aug 2023 17:08:55 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5298e43bb67so8268422a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Aug 2023 08:08:55 -0700 (PDT)
Received: from [192.168.100.67] ([78.152.69.193])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a50fb8e000000b00523653295f9sm7808426edq.94.2023.08.22.08.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 08:08:54 -0700 (PDT)
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
X-Inumbo-ID: d01174ed-40fd-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692716935; x=1693321735;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FvSmEK7PSI6jrlAj0aRA1PIieG5kdHGSz+t9CsxkGlM=;
        b=N3nHErNaC8x2GmOcdI+3I69HRY/pQHqcWvEmBLu6ysbJDrEG3k8xyGzIqE2YJEnX0A
         oMiteVcWMLZbQ3IwNWMDMw0cbqULtSXEQqLI3YGEhkNhPhqFKeI1l5x1J5v6kiCaKgRo
         WtqDl0NmkQy4qH22TCmJp/Cf1ufyF7Ah/BX1nQmGmH0LgAKvkYPsJ78dUWPU+HnUPwvs
         9hCaiYB4jNcrBc50vuu7ht/2I7AhjnoZZ+IJPSnvK32EVF8WOTiV8RcmD8YDCUXL502b
         6DIE6SCGOUiIYMxK9oaDxBK1QP5DrBUdwEPkaKXQA7qLHsXsolnxJPX8CS1ch544bybd
         DSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692716935; x=1693321735;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FvSmEK7PSI6jrlAj0aRA1PIieG5kdHGSz+t9CsxkGlM=;
        b=Fvfe4yBZb8Vf5cF9YV9BGKB7rmEr3UpUM/wItGy3tUOb8T5uyx0TgrjApiVzj30KjX
         4ucH6R48jNoskfON7D9WIrXMykZVwzI8eCjszY5/KsoTs24Ykj7uU4l7RBsqBqc4Q03e
         L0/ssSQJ9upAYWxxLgLyX1g6ZSeQMZIcnaay3wv1JtIfo8Ucjburlwcf4aH02uVbE7Wq
         y1jVlHMU5lTa2BXitnivOHuFAExlFNCvVywTnGhzHvujAH7d2ugqCr/ZOXeX2BIEP9iQ
         Sg4GoefZuLQuWHfqnwMWppNHBwM5w9Hlw7fcqqC6EBjbK+IdnyXLhG9av+ZzWRXxu5w1
         hz4A==
X-Gm-Message-State: AOJu0YzenMJT4/hyfj6QcyBg4NuwIpantvVqNQyTfT5mnclYvh3+vFjD
	BvGEZCe+XuWK0fMjW9VURaY=
X-Google-Smtp-Source: AGHT+IEGGBwCYxNbpcwHRs2kO1TSCRAFeYalt1swJ02P4DHn9uncgZB4rkShjDvF9IboU3LtZusmLg==
X-Received: by 2002:aa7:d952:0:b0:528:9284:61c6 with SMTP id l18-20020aa7d952000000b00528928461c6mr12997074eds.0.1692716935047;
        Tue, 22 Aug 2023 08:08:55 -0700 (PDT)
Message-ID: <e208383afc3580ca8c0ca739128649912caea1e6.camel@gmail.com>
Subject: Re: [PATCH v1 44/57] xen/riscv: introduce asm/vm_event.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: xen-devel@lists.xenproject.org, Bob Eshleman <bobbyeshleman@gmail.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Connor Davis
 <connojdavis@gmail.com>
Date: Tue, 22 Aug 2023 18:08:54 +0300
In-Reply-To: <CABfawhm3NrjsNYK77uFNQZWS9a5nJQWo3+0VXvGkit2YzCdVQg@mail.gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
	 <5e9219fb6c5e3d0ad921d7d050abc2a802d1742b.1692181079.git.oleksii.kurochko@gmail.com>
	 <CABfawhm3NrjsNYK77uFNQZWS9a5nJQWo3+0VXvGkit2YzCdVQg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-08-21 at 18:43 +0200, Tamas K Lengyel wrote:
> On Wed, Aug 16, 2023 at 12:30=E2=80=AFPM Oleksii Kurochko
> <oleksii.kurochko@gmail.com> wrote:
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0xen/arch/riscv/include/asm/vm_event.h | 52
> > +++++++++++++++++++++++++++
> > =C2=A01 file changed, 52 insertions(+)
> > =C2=A0create mode 100644 xen/arch/riscv/include/asm/vm_event.h
>=20
> I don't think we ought to replicate this header for every arch when
> clearly the functions in them are only relevant for specific
> architectures. Would make more sense to me to just conditionalize the
> caller side to the specific archs where these functions are actually
> defined, which would largely just be CONFIG_X86.

Thanks. I'll take it into account.

~ Oleksii


