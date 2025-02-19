Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2002A3C613
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 18:24:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893307.1302220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tknng-0001OD-Fm; Wed, 19 Feb 2025 17:23:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893307.1302220; Wed, 19 Feb 2025 17:23:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tknng-0001Lu-D8; Wed, 19 Feb 2025 17:23:56 +0000
Received: by outflank-mailman (input) for mailman id 893307;
 Wed, 19 Feb 2025 17:23:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lO3z=VK=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1tknnf-0001Lo-Bg
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 17:23:55 +0000
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [2607:f8b0:4864:20::c35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a08e6c6-eee6-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 18:23:53 +0100 (CET)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-5fd05d0c445so8477eaf.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 09:23:53 -0800 (PST)
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
X-Inumbo-ID: 4a08e6c6-eee6-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739985831; x=1740590631; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9BY8/aJj6CP9IPA/0OCwpBj1sKdoZnahq4iWgZKWMTs=;
        b=NQxveX3uIn3N93HWGPB6TcXruVnG4FdN2v4uWz8NfPShlgccI2V7vlfc6goZhUSWka
         R2Zst32wdmR5jhhc1jpPFyntRZGL91mQPpJ8TH3evQkoT8/3rT2e4uN1h8KqIBudy/nu
         JhHK43py8od+UPPoVPnnhimSRgv1Is6DQUoumb9N/i3bnDY5nFiw7UY5mOPcyEe/rMKB
         zKv1VhQ2jSF0eOycZnDzVfYL2wzPcQUIj+cg3bHHbOl+LaQ3Z3uLIe29LQ7qjchhqZwj
         zj6hywtJAztD2EZdh4MFuAzbiRI1g2ur/HUBiw4gnkZxfLT6t6OOD0+GWYh+nbrOuMmy
         Wraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739985831; x=1740590631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9BY8/aJj6CP9IPA/0OCwpBj1sKdoZnahq4iWgZKWMTs=;
        b=ppqTSl1VQ0FUVS0bo/iLLwQxAVpLCiIWFVl0oyN924Chp0hjhPTDcB8tvBfnbVJn2i
         Rl5XHCSRMizdxSfRnEFLvxhIJMPxxEXKNRsALFXZ2JJJh435jnsXBqym2hpjVMRACxfF
         F9T8BzXu3tO6zFL0FCL55ORkCCtIyQ2s+oiFBy1O97kMjkEpR4bjxucTipmQ+3MRLBlv
         jSjKJCw3ILNrU/nXy9LKuqz7T5nlGA/Uz7bz2xATOlQUFk8J1QNEe0AVq8IRHRdNIH1O
         0zTOvYcdtSph2djRC/QD2IzTy3cZx85aFPUoidf/h1jexK+nk9BKW9dApSY38Bfev55g
         t2BQ==
X-Gm-Message-State: AOJu0YxXgevL4x5VDCAfLerdQ5s/29bcsA2BpynwtDy25r85Gujm3Xub
	1elfXJglNIgFHI7nClh5L3fCm3eLum95qB0k4qa49Dnql5bgX4Ci4WDTGGJnfXx6lMbywL7X4FO
	gxZDeUJ2NeryHHOHKA3K5w/logWK3bYun
X-Gm-Gg: ASbGncsVp1qTQuZ7dgNUZzsu3+7LijPvP0s3wt3nZP2v1qlekk+/O4R2JJKJBiS0l1L
	ak7I7dT5S/ODSRv8eAs6RiDNveqcu9PQOgrzLsrYa1szIEBkNboyIwlXmPiKgvC9R4fIsvg/EJd
	TQdcTHsFsXiJm9sinxzIjdqGSjDGMY40I=
X-Google-Smtp-Source: AGHT+IGEYVqbEMGSH+vWJwbzGeZwRGystWH24qqBAQ4EkhyI7rSrAa7VFKa6eBq/gmCKMv6/XlJzPkreo8+PfVCDsK8=
X-Received: by 2002:a05:6870:6386:b0:2b7:fa16:4d26 with SMTP id
 586e51a60fabf-2bc99b5d783mr4591986fac.7.1739985831575; Wed, 19 Feb 2025
 09:23:51 -0800 (PST)
MIME-Version: 1.0
References: <CAKBKdXhaQLj01Kn06xMBsHExT1xNMKnHxTB+Hu33jtpySr-few@mail.gmail.com>
 <CAKBKdXgKqoqDr04TjZZa0uRd0UyPng9iRCz_5JpCh-Ub4H2TiQ@mail.gmail.com>
In-Reply-To: <CAKBKdXgKqoqDr04TjZZa0uRd0UyPng9iRCz_5JpCh-Ub4H2TiQ@mail.gmail.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Wed, 19 Feb 2025 18:23:41 +0100
X-Gm-Features: AWEUYZku7ezYr8oKtpfCek3JamG71Wo-MTTtrIiaHkA7GY4uJqLQtI7xrl9w7Og
Message-ID: <CAKBKdXgZ96_-U9udkPNoqHtrA7MEyq9Riv3o5zUSOBLiEr=tZw@mail.gmail.com>
Subject: Re: xl create/save throwing errors
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 5:53=E2=80=AFPM Petr Bene=C5=A1 <w1benny@gmail.com>=
 wrote:
>
> On Wed, Feb 19, 2025 at 5:04=E2=80=AFPM Petr Bene=C5=A1 <w1benny@gmail.co=
m> wrote:
> >
> > Hello,
> >
>
> To add more information and observations:

Even more observations. This is from a run where 4 vms (4 VCPUs each)
were being created in parallel:

```
Saving to /clones/win10-18362-102/state new xl format (info 0x3/0x0/1780)
xc: info: Saving domain 14, type x86 HVM
xc: error: save callback suspend() failed: 0: Internal error
xc: error: Save failed (0 =3D Success): Internal error
libxl: error: libxl_qmp.c:1334:qmp_ev_lock_aquired: Domain 14:Failed
to connect to QMP socket /var/run/xen/qmp-libxl-14: No such file or
directory
libxl: error: libxl_dom_save.c:246:switch_qemu_xen_logdirty_done:
Domain 14:logdirty switch failed (rc=3D-3), abandoning suspend
xc: error: Couldn't disable qemu log-dirty mode (0 =3D Success): Internal e=
rror
xc: error: Failed to clean up (0 =3D Success): Internal error
libxl: error: libxl_stream_write.c:347:libxl__xc_domain_save_done:
Domain 14:saving domain: domain responded to suspend request: Success
Failed to save domain, resuming domain
libxl: error: libxl_qmp.c:1334:qmp_ev_lock_aquired: Domain 14:Failed
to connect to QMP socket /var/run/xen/qmp-libxl-14: No such file or
directory
libxl: error: libxl_dom_suspend.c:610:dm_resume_done: Domain 14:Failed
to resume device model: rc=3D-3
```

But... running afterwards:

```
# xl list
Name                                        ID   Mem VCPUs      State   Tim=
e(s)
Domain-0                                     0 16384     6     r-----     4=
75.1
win10-18362-102                             17  2048     4     -b----      =
30.8
```

And:
```
# lsa /var/run/xen/
total 16K
drwxr-xr-x  2 root root  160 Feb 19 17:13 .
drwxr-xr-x 36 root root 1.1K Feb 19 17:07 ..
-rw-r--r--  1 root root   28 Feb 19 17:13 domid-history
-rw-------  1 root root    4 Feb 19 17:06 qemu-dom0.pid
srwxr-xr-x  1 root root    0 Feb 19 17:13 qmp-libxenstat-17
srwxr-xr-x  1 root root    0 Feb 19 17:13 qmp-libxl-17
-rw-------  1 root root    5 Feb 19 17:06 xenconsoled.pid
-rw-r-----  1 root root    4 Feb 19 17:06 xenstored.pid
```

The logs complain about a domain ID 14, however, the domain ID of the
win10-18362-102 is later observed to be 17.

P.

