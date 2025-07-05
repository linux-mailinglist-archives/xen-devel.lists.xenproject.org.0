Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6843AF9CE9
	for <lists+xen-devel@lfdr.de>; Sat,  5 Jul 2025 02:22:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033884.1407106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXqfQ-0006Lc-PR; Sat, 05 Jul 2025 00:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033884.1407106; Sat, 05 Jul 2025 00:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXqfQ-0006Ih-MQ; Sat, 05 Jul 2025 00:22:08 +0000
Received: by outflank-mailman (input) for mailman id 1033884;
 Sat, 05 Jul 2025 00:22:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3JhB=ZS=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uXqfO-0006Ib-G9
 for xen-devel@lists.xenproject.org; Sat, 05 Jul 2025 00:22:06 +0000
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [2001:4860:4864:20::2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13b5d9d4-5936-11f0-a315-13f23c93f187;
 Sat, 05 Jul 2025 02:22:05 +0200 (CEST)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-2eaeb27fa45so311846fac.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jul 2025 17:22:05 -0700 (PDT)
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
X-Inumbo-ID: 13b5d9d4-5936-11f0-a315-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751674924; x=1752279724; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bLYTarAZUlULFkbLXWfM+KVSU+GqYG/qveLHqQP5C8=;
        b=nhpfJ14nv9PiXAIwGxHs4dI2Zk9NGNZrQl1Oerzoi8Y88dS1SBybjCj4lH9e/T6ICv
         b4FnpxVWP0LzHpO/ztzz701pKOJoVe+pVFyftVNT/RzqqkadkJQZoEbJj6FpcdgetJY2
         6l0tS1BPURXfZMeOnDaKXwO/VungFpNGBufRpgwQcSkTkqpHQf3hMvXs7USmm0e9J6hK
         vZMJiOPf4NwnTSRKIYxZWYlWG+UWyD5qu0/M+vYLdeSnqzIndKJqOTMC8GsmCjXqi9K6
         jbcAxdMWV1/qErRnCWIrxEcWPjmjJnbEebFAL0v9a4Av6HsFlFlD7kLZuX/TkRSubTyh
         h8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751674924; x=1752279724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+bLYTarAZUlULFkbLXWfM+KVSU+GqYG/qveLHqQP5C8=;
        b=dRVF9OuVgrjXbFItaRQyCLZUM0aLNZxwhSW/Hboq4jV2y1CiMg5cHvJxaFC8yRgLs8
         EWM502Unat6S+F7A59E6+/k3K9yRmN9gfWXFCIYwblN4F7o/IC8hva4lPEUML0HyYyIt
         YmGkemjEvEfo6Dhvcah8jejQPIui+K0Y2y4zPwuVAs0z6OaPPVu3fmtH50RhfixUomBp
         tVO1nsdCIuTVuNpBkkTuBezLJXhJrLYwgkdT9IBZ1x6St1HVkR3BKbuL0JQNxsugpHT+
         gGkXOJ+ylPERwK7vsV6NypRgtzICbtaRkI1zdpGNpDB4f+mjgeOYlM7ojwtFkXg0Z3Yg
         EBbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh6s8Eh9eu/oko/5rBF8cIyQ6M7/NatZHUPk+/jqp6Wkec3oPgOtqXFYygbqC3KNlJahyQWDieuUs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxbqCnW9L6PRx1IbfdznV8UW1D9uTzGF3Vt4zeEokL8kKaef9dq
	vGltMdIhic/0rDLa/8Kq1h9KQt4xJGSnhFsZ73GhCdI5XctVufPgnJ5xH5tiNTE+OdEtqQWPBO1
	p3unIy5icM11HHBJxPl3qvByLMgSbUKw=
X-Gm-Gg: ASbGncthOuWIBPBTnQmYwLkguRufxLprVJArY+r3a586iH2zFrzp2C5TLRolwXUjmYk
	JQ4CXn2vZSBGRrUzzJEy8Ovu0eufLwq/NTVX6nxbF6z8/4GvGOohCACMI6XBuybVnYZ/JPm76qh
	4+r1lH3Jd/eNhYdztZIKB2p3Jr79dXRnUjMhjH/m49FrUA
X-Google-Smtp-Source: AGHT+IE+rSW1RzApD8Bg/rWj62wo2HUo2P7wCIAJyZBh4T9RC2z6AM5UzyYE+Bm9plQgtCr7HvXYPFYV2iQHJoxv0Us=
X-Received: by 2002:a05:6830:410d:b0:727:3bd1:7ba2 with SMTP id
 46e09a7af769-73ca4948f79mr1001778a34.5.1751674923547; Fri, 04 Jul 2025
 17:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1751397919.git.w1benny@gmail.com> <c67fa5eca61e1058615d79ba836a9decf8d0fc89.1751397919.git.w1benny@gmail.com>
 <8733c6f6-27a6-4b5a-b921-e7f587d9baa6@suse.com>
In-Reply-To: <8733c6f6-27a6-4b5a-b921-e7f587d9baa6@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Sat, 5 Jul 2025 02:21:52 +0200
X-Gm-Features: Ac12FXwmh5Kd6T_avWpzKNLgQdEcyKQjnUWAz7yk2gOOEodtpUdz7Gw2kIyleNE
Message-ID: <CAKBKdXjavJtAH7zbcqepopcu5wa+tk8xNWxWic+1F2ePJpbSsQ@mail.gmail.com>
Subject: Re: [PATCH v7 4/7] xen: Make the maximum number of altp2m views
 configurable for x86
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 4:11=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
> > --- a/xen/include/xen/sched.h
> > +++ b/xen/include/xen/sched.h
> > @@ -619,6 +619,8 @@ struct domain
> >          unsigned int guest_request_sync          : 1;
> >      } monitor;
> >
> > +    unsigned int nr_altp2m;    /* Number of altp2m tables. */
>
> We may have had that discussion earlier on, but it has been too long ago =
now:
> Why is this not an x86-only field (i.e. in struct arch_domain)? Or one
> dependent upon CONFIG_ALTP2M?

altp2m is not architecture specific. Though having it guarded with
CONFIG_ALTP2M is a good idea. Of course, each of its ~40 usages (that
is outside of altp2m.c) would have to be guarded, too.

P.

