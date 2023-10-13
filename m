Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0B17C89E7
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 18:07:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616748.958974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrKgC-0003GU-9l; Fri, 13 Oct 2023 16:06:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616748.958974; Fri, 13 Oct 2023 16:06:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrKgC-0003DU-6C; Fri, 13 Oct 2023 16:06:24 +0000
Received: by outflank-mailman (input) for mailman id 616748;
 Fri, 13 Oct 2023 16:06:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=36VQ=F3=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qrKgA-0003DO-Qg
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 16:06:22 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73840420-69e2-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 18:06:21 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c4fe37f166so19095761fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Oct 2023 09:06:21 -0700 (PDT)
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
X-Inumbo-ID: 73840420-69e2-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1697213181; x=1697817981; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LFJmM5LPfdrCIKWWItu79waf0ykdubt6FliyM+HtTYU=;
        b=b6LeimaNGBNp8ljILwHPsCCV/3Y+qVux+J4OEEuRtY5XcvykQmhx+fYg37XuS6HhW4
         EpDzeT4JnbpTMUuNTkjHvxnDPCzpKvsfU2dxyG44YXz9Y1QsEto13d9w7vJ51aPw5++G
         0n124hbvKEolOuAmIlPy1dUpc6Vua5j8Om5EY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697213181; x=1697817981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LFJmM5LPfdrCIKWWItu79waf0ykdubt6FliyM+HtTYU=;
        b=lEpAnINky5IpqgHgMixL58mTj3SlS/TFmYOyQ/7+fIodQVop3HRkNVWpNv1SIopFhH
         KBEXX3ZF2WQ9Cn9Bx1YoQKRt6OcTuHfI/j0ichJjxkE1dXJ+hFxl6rVHocdyYdafTJty
         WScAshgvY7CNVuntbZtBbN1ADLq4Y03koQ7VhILURwG+MQN9ECCti+H9eYyy0x33j5fF
         GMAtQ57Esl5ZY6/tvZhq1fwRTALEwG0BXm4kK5MkAH7mrSKMN8aaGZ/r6R6DyMX/jose
         3LZPiK/Kv+7XV8csnZsFEjpp5fawK1rX/x2s4S9hutNiJQaZGlF6ihnmsHWEBDCfz/TZ
         GInQ==
X-Gm-Message-State: AOJu0YwOeGdleFlf1eueaXDaeq3Xri/Ms2rPuPUgNzJhrKIiux19uZkx
	GC+u+evNtPSzorl23Pkz8E84Bw4bMUdgzlzuoPNMgg==
X-Google-Smtp-Source: AGHT+IE7f3XF2YTL7EuTwVLwXJGeBLEa+MVPjNDo5/XvsS6e0z9TZeVjqHdelzxRnI5wU/hWH+Snu/qcfF1DDwscKVY=
X-Received: by 2002:a19:791b:0:b0:507:9ae3:6ba7 with SMTP id
 u27-20020a19791b000000b005079ae36ba7mr1552676lfc.67.1697213181246; Fri, 13
 Oct 2023 09:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2309271603590.1403502@ubuntu-linux-20-04-desktop>
 <a31ce6cb-6234-5e7f-5cd4-ed190f029811@citrix.com> <alpine.DEB.2.22.394.2309271658500.1403502@ubuntu-linux-20-04-desktop>
 <CA+zSX=ZbeUFrfAUJShooJFJ+d89f4xdXfJJ9HoJKRh4UStkTFQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2310121535580.3431292@ubuntu-linux-20-04-desktop>
 <CA+zSX=Y5dMVFM6dVNgBRHxKc0C1e5WGgweQ0FaXXCfAFGH1aPA@mail.gmail.com>
 <a93839b8-932a-4634-9549-081df950afb2@xen.org> <CA+zSX=a972GC=_FKK2eGkArPb6RszCHDN0+6JKFJiMjoMpAySQ@mail.gmail.com>
 <f973db5f-da72-4aa2-a35e-1e6652b181bf@xen.org> <CA+zSX=bpq6sJmP7TzC+3vgTJyZcCdZc5M-BGEaOkkXt7BoQZJg@mail.gmail.com>
 <a1c3de32-7fcb-4c3d-a95b-7aa58c493f52@xen.org>
In-Reply-To: <a1c3de32-7fcb-4c3d-a95b-7aa58c493f52@xen.org>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 13 Oct 2023 17:06:10 +0100
Message-ID: <CA+zSX=ad_g5CWkFjs0Cu1=HaTYTLmRpUE8gFVZ+4AJ3meG-0Yw@mail.gmail.com>
Subject: Re: Xen 4.18 release: Reminder about code freeze
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Henry Wang <Henry.Wang@arm.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>, 
	"jgross@suse.com" <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@citrix.com>, 
	"community.manager@xenproject.org" <community.manager@xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 13, 2023 at 4:56=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:
> > The initial patch that
> > introduced it didn't mention wanting to include dom0 specifically; on
> > the contrary it said:
> >
> > "The extra notification is harmless for domains that don't require it."
>
> ... even if this is what the commit message says, we can't tell whether
> someone would start to rely on it. I definitely see use-cases for it.
>
> But I agree that the chance they are actualy used is slim as we didn't
> document it.

If a dom0 kernel started relying on the behavior, it would be a bug,
since it would be incompatible with releases before 4.16.  So I think
the only risk here would be if some bit of a system's userspace
tooling relied on it; but I can't really see how that would come to
be.

If someone reports a bug, we can always add the reporting back, when
we're not under time pressure.

> Your reasoning makes sense. I don't fully agree with it, but at the end
> of the day we need to have a solution for dom0less guests... So if the
> others agree with you, then I will disagree and commit.
>
> That said, I think the commit message should explain why removing dom0
> notification is ok.

Yes, absolutely.

Do you or Stefano want to pick it up?  I think you'd be able to test
it more thoroughly.  I can build-test it and send it to gitlab-CI, but
anything more will take a lot more setup.

 -George

