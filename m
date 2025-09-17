Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 176AFB7EEE3
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 15:06:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124905.1467055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyhpB-00022I-TP; Wed, 17 Sep 2025 02:23:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124905.1467055; Wed, 17 Sep 2025 02:23:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyhpB-000204-Nn; Wed, 17 Sep 2025 02:23:13 +0000
Received: by outflank-mailman (input) for mailman id 1124905;
 Wed, 17 Sep 2025 02:23:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s7FR=34=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uyhpA-0001zy-EF
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 02:23:12 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41c08876-936d-11f0-9d13-b5c5bf9af7f9;
 Wed, 17 Sep 2025 04:23:11 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-55f720ffe34so566151e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Sep 2025 19:23:11 -0700 (PDT)
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
X-Inumbo-ID: 41c08876-936d-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758075791; x=1758680591; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jw7CytErdaqG5NSkbJajOGN1sz+03T+CVp3e3RSNSUk=;
        b=RaeFmyQHAcaeY3fn412MnAaNec/ntVa0LeXcVd9BFeYA2acCtz+aXAsfK1hLdYwSDp
         +fbLQlQoFrDvULagvrhIqoGEsQJO8y5EDg+7vKjHHG5QZoxIC1+EhWv7wGP+v6FPnI0G
         mfUt4V8wc0zUSArKRNvvdDzeAfIoVz/aCEqjACYaQDot5LcynL/kae0AtXwjlmsY89KF
         25KOf9RKx5XcsqmFElv9v/+G+GhSTG6MflA0RoXkwHzvjSyAMI7psTn9M1bxLlerFaUg
         fMGVGRYdegIzEyqymVgxZxznwmwAPj8ZjbD5KUDYcyMcan5k5aaer/KPdf5wxFBuai1C
         bnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758075791; x=1758680591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jw7CytErdaqG5NSkbJajOGN1sz+03T+CVp3e3RSNSUk=;
        b=wG11aw/CSCi856WzJjx21MsuDN0CzNGnNKH0a2YmRMi08DOsMy8Odo+3GKlekzteYE
         bgW2TS6kY6ky8lg8wIirQUjy4VhH+WUySnIeAlJRlC043Hu/GdqTWjtJg3pqEqoNYxcw
         s3zM0Mh+wP4UoQxEZu/fuPE33Wcvt+6Ku5l9UBD1FsxwO/nmh8aCGRH5q7Z4EMt8NDu9
         fSIsVZOpObKWvkA4H7t02YSEeW9fuf6cudXKlwo6teiAvzB4B/tYEuucUfhIaAVPA0YS
         kaDBysn4DsCvIiADOXS9PwFwN5f8eKjSxWHK5zHO9LrRLhibSd7Cp3Jxq+2nrkJdqvhg
         lb6g==
X-Gm-Message-State: AOJu0Yy2VSAr7zK1FKrMem6Rxbi6IBV4b83TebeQwhv3PyOm7sMfkyKy
	D9i+3rWPHEbUT/G95vVWnXhWHwzwxsr+1hKLC1iuyCfKdKa6VBCxI5toyHkYaawCWOGtKFX2bdy
	2d93uENrycUtUfO+1CFRrd6fMAVX8Mdk=
X-Gm-Gg: ASbGnctwsiaDzU7qpBzh3MGtXeD6FgKPZALLBR0hyk7Zcy5n4Q2HYJ/4rD4AHpQyCTS
	/nP0rkaCFJIn3TGwvc76juLyaEI0HzJZPf46icjnQRixr0XoRcwHzOzudP5ZtoQ1Ym+Fn/EcRkF
	otdJOFfqYSlMwZ0BNcvdZ7u87SSuTaAVwwPaNbC6nI9cwNzXCkp1tuxLXLp94SeQdNQ9MIbsj2F
	kWMBw==
X-Google-Smtp-Source: AGHT+IEhxvccF/vkGpgGFJxHc+AU1HmBvcWAUY2LiRM5h21I/Ba6dpbehNAnKkEkGpPflfCs5j6EXA/vfhCTZ2DVAFY=
X-Received: by 2002:a05:6512:124d:b0:55f:3ae4:fe57 with SMTP id
 2adb3069b0e04-577a3edbaecmr129650e87.20.1758075790471; Tue, 16 Sep 2025
 19:23:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756763487.git.mykola_kvach@epam.com> <293acbb653b5f4d5bf71dc459f9de3e729bff3e1.1756763487.git.mykola_kvach@epam.com>
 <40480c61-0619-41b8-866a-85a219f5e157@xen.org>
In-Reply-To: <40480c61-0619-41b8-866a-85a219f5e157@xen.org>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 17 Sep 2025 05:22:59 +0300
X-Gm-Features: AS18NWCDEeAZIq3jwNJ6nj7I0qu-3pRtzUxEPEevGj9LxkrTTPMMn_vU9WYh4bI
Message-ID: <CAGeoDV_srnuGh_pT+SQ_5WfbbMZc9RVx3_4DZayCpk4v8o4oww@mail.gmail.com>
Subject: Re: [PATCH v6 04/13] xen/arm: Don't release IRQs on suspend
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

Thank you for the review.

On Sat, Sep 13, 2025 at 2:45=E2=80=AFAM Julien Grall <julien@xen.org> wrote=
:
>
> Hi Mykola,
>
> On 01/09/2025 23:10, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > If we call disable_nonboot_cpus on ARM64 with system_state set
> > to SYS_STATE_suspend, the following assertion will be triggered:
>
> Looking at the stack trace, I don't understand why this error would not
> happen when offlining a CPU. Can you clarify?
>
> Anyway, I am not very happy to special case suspend/resume in the IRQ
> code. So I would strongly prefer if we follow a different approach.
>
> The one that come to my mind is to switch from request_irq() to
> setup_irq() and allocate the action in a per-cpu variable. With that,
> there should be no free happening with the stop_machine helper.

Yes, this should help in my case and it also looks like a cleaner
solution, thank you.

Interestingly, my teammate Mykyta Poturai came up with the same idea a
few days ago when he faced a similar problem during CPU hotplug
implementation.

So I will just reuse his commits this is the one of the commits:

https://github.com/Deedone/xen/commit/3817601c2f437453035839f29e94c069a7708=
17d

>
> Cheers,
>
> --
> Julien Grall
>

Best regards,
Mykola

