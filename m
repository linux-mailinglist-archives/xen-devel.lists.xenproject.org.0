Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2ED5A3C709
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 19:09:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893365.1302260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkoVN-00019Q-GH; Wed, 19 Feb 2025 18:09:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893365.1302260; Wed, 19 Feb 2025 18:09:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkoVN-00017y-Dh; Wed, 19 Feb 2025 18:09:05 +0000
Received: by outflank-mailman (input) for mailman id 893365;
 Wed, 19 Feb 2025 18:09:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lO3z=VK=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1tkoVM-00017s-Fk
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 18:09:04 +0000
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [2607:f8b0:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99939b5b-eeec-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 19:09:03 +0100 (CET)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-724daedf8c3so8818a34.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 10:09:03 -0800 (PST)
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
X-Inumbo-ID: 99939b5b-eeec-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739988542; x=1740593342; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PA1DwNKHgzWnlLShMmTdAvBKFC5L4K3u45mTW/KDuXU=;
        b=HG1vajbnfQYFywlT83He5nvyNlV5zSN/7u6wtH5+I3ji+M6tuBKSzGJDZCAr4mFcaQ
         LtaKAjdkWsGGHKPqmR+SsXVlvfl08iBhSK74b+s6LybEEFWulFFSRuw/IP9QmaUf8vmU
         9KHXQQiDAv7QFDk0ZUetxSPnECrGgC9l2WW+XH5c/GU5Xqfiq0d2x4PKOvkan+IUcLU2
         YqUkjxTJwnGCi4lNd65RSgQDzCKnH3wfcQmNLlulrLSrgY7/2W4HrjSMhD2Jw6SyDYyV
         ZySEW0pe3h1OXaREws8zMy+ZU77w4C2dg7+wBjI3TCAsg5POM/JLBcotFgJYVwt/e+bH
         dneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739988542; x=1740593342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PA1DwNKHgzWnlLShMmTdAvBKFC5L4K3u45mTW/KDuXU=;
        b=k6xJoIftWt8jI4vKzD9daQhU6kyJgNjPTkHqzp1EQDhpDtNGzGg1vtYp7m6tyNpNlm
         ys3pflkSEE/GUdQFGdIZg4LS0I3+W2vLbUWHnkKmMWovWYzuyqFDiCzDFVkzg1RZ1j7B
         Wegdw80d1lQ3YrZn518e0/dq6tgqPQHRBYTaxAyBdGfFAGCC7nLR2ILQP/1p4cOZVO/b
         M/8F5TgljwqYrpBax3jkvecTBDPhMPS7lfATpM2LAQ49rd1kKzYdhyeu6k4qMiOz1Axv
         Iwq9VbXLOiRTkm8X/O6xUSpQ8VLp28heGZc0wj8sz3hI+PbLdWR+jaE7mf4vsx6c28Kh
         imwg==
X-Gm-Message-State: AOJu0Yy+/o1V/B8heUDEZ1yIqmjSyIZM+cpd60sE2WiA2VYsxyDmx2zC
	8GoNPbi2r8Nw2stYNFS3+yim65f/CJi5kOTioITVW8qLKz36jJ25eInlo8MZfMC51bHvxu2C/qn
	ah/GujsvyDZEzunxu1h6LPNi8kC4xdQ==
X-Gm-Gg: ASbGnctRWzh9XLyj2QeYQhhvJxUWdUJlG2eVvUB4jK2qcu+WLXocCmjVAXfEPVio8jJ
	vgb5NO4Nis2+0L+cW+w70JkC/zjciRMMr1qQuQWI9aUCYYg5ty83QVVxhozYMi0JfspG3RtDbAS
	iYhLS7uFlS51aLhb8hFY66Gt4KcTEdr9c=
X-Google-Smtp-Source: AGHT+IFWcNKhjs1TeASNBah8ngCmjWANT8s9xlb67fSLclShZCG4/ecoDVGmKVkB3A0b8MMabhM6SVXAx1VrhuPNL8Y=
X-Received: by 2002:a05:6870:ed98:b0:29e:4ba5:4de3 with SMTP id
 586e51a60fabf-2bc99adc7d9mr4437511fac.6.1739988542117; Wed, 19 Feb 2025
 10:09:02 -0800 (PST)
MIME-Version: 1.0
References: <CAKBKdXhaQLj01Kn06xMBsHExT1xNMKnHxTB+Hu33jtpySr-few@mail.gmail.com>
 <CAKBKdXgKqoqDr04TjZZa0uRd0UyPng9iRCz_5JpCh-Ub4H2TiQ@mail.gmail.com> <CAKBKdXgZ96_-U9udkPNoqHtrA7MEyq9Riv3o5zUSOBLiEr=tZw@mail.gmail.com>
In-Reply-To: <CAKBKdXgZ96_-U9udkPNoqHtrA7MEyq9Riv3o5zUSOBLiEr=tZw@mail.gmail.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Wed, 19 Feb 2025 19:08:51 +0100
X-Gm-Features: AWEUYZlGY9sn1MzpdodUl9zkhw840Y5uXaR3FGe2u7H22-kIo1MGm131Jbrca7A
Message-ID: <CAKBKdXi1tF_bcbswXiXQKcKBgUw=YQVjdGJe6oQJozQ5KfSotA@mail.gmail.com>
Subject: Re: xl create/save throwing errors
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 6:23=E2=80=AFPM Petr Bene=C5=A1 <w1benny@gmail.com>=
 wrote:
>
> On Wed, Feb 19, 2025 at 5:53=E2=80=AFPM Petr Bene=C5=A1 <w1benny@gmail.co=
m> wrote:
> >
> > On Wed, Feb 19, 2025 at 5:04=E2=80=AFPM Petr Bene=C5=A1 <w1benny@gmail.=
com> wrote:
> > >
> > > Hello,
> > >
> >
> > To add more information and observations:
>
> Even more observations.

Next observations:
The Dom ID mismatch seems to be caused by the fact that the VM crashes
(bugcheck) and is rebooted at the time of "xl save". Therefore, its
Dom ID changes.

At this point I'm quite baffled and I am wondering, whether the "xl
save" randomly causes my VMs to crash, or whether my image.qcow2 is
corrupted.

I'll try with different images.

P.

