Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BC884CDB9
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 16:10:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677753.1054576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXjZ3-0005fp-0H; Wed, 07 Feb 2024 15:10:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677753.1054576; Wed, 07 Feb 2024 15:10:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXjZ2-0005d0-Tm; Wed, 07 Feb 2024 15:10:16 +0000
Received: by outflank-mailman (input) for mailman id 677753;
 Wed, 07 Feb 2024 15:10:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9378=JQ=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rXjZ1-0005bg-BM
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 15:10:15 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fed821be-c5ca-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 16:10:14 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5116a6fb076so313767e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 07:10:14 -0800 (PST)
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
X-Inumbo-ID: fed821be-c5ca-11ee-8a49-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707318614; x=1707923414; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G34MnWk3pe/7uEF/KUF82whwYiU9mlpjrdFqc2kuT6M=;
        b=n98CNTxk9feSIDUvtScvh1jWxU+JUjGaAbCzJmXbPUgkbyghPDssKrxYVrAdeWkBKq
         MDVvx3pG89hFn0kkraqimbKGRkaCSYIzDpQljG6tiaszCgtACL5mZvKvpN/WGSS4DrC6
         E0bYRhlpZxrskL2N0J17LhqnoRWDErY+32Ls4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707318614; x=1707923414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G34MnWk3pe/7uEF/KUF82whwYiU9mlpjrdFqc2kuT6M=;
        b=egcYraaP3ekyWqdIeZL291NlHMVsA2Y7XcrZ2ny4Tqhd3S3ftLKszOhysrXMTT5lAD
         5YkCfaE0RMlVjfHvvXza6QxwRpQYzegPntiYSmXG7wT54+mKyL8gacbJHFAR+bG+3ZAG
         LLYpOPCeabkjQS7k0Ed86cEkafkxds7KzBDwhT4zWFjpKGb9yThtyN+pLbXwDMXE8ZHI
         8p3iPs8tqypf0DTfBQ4EoRr/BCrdR+0oRShKVxzTnKxm5Us21Y5nWN223Bl6mz3IIU3P
         bxBNjrx1E2Z8+SGrhAddr3onA/aoSOrEG7xl3awRCXBqJwJJA6FFtfl5wcb1mFu3aTWa
         Jv9Q==
X-Gm-Message-State: AOJu0YytXKc0r0b0j0C5l1KO7m8wF9/d8grYwdipjPvtXDZ4/xaxslkL
	ahpPwO44jT7aTpCws+pDMdl2uJ8H9X45aiqw11mol2/BJPElAZ6dQlId9ng3brNW4b/eekIzfCI
	CoGa1jYCszlqJjOjXj8S//1gktSWYS1zbauV28g==
X-Google-Smtp-Source: AGHT+IFfKHlX57Q4POVz4oD5zc2AhMSRd7knfkjStPeBLj3w/EAUV51LDHlvqqmtM0E9nSgdSGoy9wSeF/5F/Xwl0hI=
X-Received: by 2002:a05:6512:3494:b0:511:64c2:8c0a with SMTP id
 v20-20020a056512349400b0051164c28c0amr1649805lfr.20.1707318614080; Wed, 07
 Feb 2024 07:10:14 -0800 (PST)
MIME-Version: 1.0
References: <65c38d7a7ea07_2d1b5321c96792@gitlab-sidekiq-catchall-v2-779bdffdc8-kp98w.mail>
 <115f10ac-a115-40d1-a444-50e960320557@suse.com> <65665f86-cbfc-4352-9d81-67ac0b21b161@citrix.com>
 <CAKoJhMROFw1w679U9xsW6s4p34Zzm6-gaHihUHtU1w5ZH9ViUQ@mail.gmail.com> <f1f74e69-8892-4615-8411-f7a1329dd76c@citrix.com>
In-Reply-To: <f1f74e69-8892-4615-8411-f7a1329dd76c@citrix.com>
From: Anthony PERARD <anthony.perard@citrix.com>
Date: Wed, 7 Feb 2024 15:10:02 +0000
Message-ID: <CAKoJhMTaO+LW0Mm3mn+XXgxxM-=T5QwGacG5oGKwF-egEmes0Q@mail.gmail.com>
Subject: Re: xen | Failed pipeline for staging | f4519ee8
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 7, 2024 at 2:55=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> On 07/02/2024 2:34 pm, Anthony PERARD wrote:
> > On Wed, Feb 7, 2024 at 2:24=E2=80=AFPM Andrew Cooper <andrew.cooper3@ci=
trix.com> wrote:
> >>>> Stage: test
> >>>> Name: qemu-smoke-riscv64-gcc
> >>> I have to admit that I can't connect what was pushed recently to this=
 job
> >>> failing.
> >> The qemu smoke tests for riscv and ppc intermittently fail on the
> >> OSSTest-lab infrastructure in Gitlab.
> >>
> >> We've never got to the bottom of it.
> > It's maybe because joubertin* and nocera* have more than one NUMA
> > nodes. It's look like 2 for nocera* and 4 for joubertin*.
> > Would that be enough of of an explanation about those tests taking a
> > bit longer than expected?
>
> That feels a bit like a blind guess.

Yes, but I think I did a test earlier, and the riscv test took more
like 10 seconds, but can also easily finish in less than a second. I
did the test a while ago, so I could misremember.

> What hardware are these?  They're rather old, I seem to recall?

nocera: http://logs.test-lab.xenproject.org/osstest/results/host/nocera1.ex=
amine/
joubertin: http://logs.test-lab.xenproject.org/osstest/results/host/joubert=
in0.examine/

nocera have been here for a while, since before 2015. I don't really
know how to find out how old the machine is. joubertin* have never
been used with osstest so far, but the first mention of it I can find
of it is from 2017.

--=20
Anthony PERARD

