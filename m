Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96711A3C576
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 17:53:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893283.1302201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tknKN-0003ua-ST; Wed, 19 Feb 2025 16:53:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893283.1302201; Wed, 19 Feb 2025 16:53:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tknKN-0003tA-PY; Wed, 19 Feb 2025 16:53:39 +0000
Received: by outflank-mailman (input) for mailman id 893283;
 Wed, 19 Feb 2025 16:53:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lO3z=VK=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1tknKM-0003t4-Ho
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 16:53:38 +0000
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [2001:4860:4864:20::2e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f587570-eee2-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 17:53:36 +0100 (CET)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-2a8880c40fdso284596fac.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 08:53:36 -0800 (PST)
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
X-Inumbo-ID: 0f587570-eee2-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739984015; x=1740588815; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5LFrSvOIzwaN3lwLHmXira5Ktki7q9EDOPe0n/zn/I=;
        b=npTY0uuDAWum5ijqQthbEkY1FCJ5RLNbcqozN/teInt5F4CISPntwb7kSBSjx9cWay
         oe8/mdFNmOBODlMI9q3IiYM3NYssLPhGtQzEuGv3BiY2XDPnGXNearjjsud2c6/KXYJr
         iIEkOIdXRhMOECERkhNCpysO54Rpi+ddryX55T28IryGjN/FtVCe5BZnChQN4AHZxPZM
         bWT7PoQepd11eSZ51joiJeHuZ1JfHl/fefdV6yf7Qwj/Q520GV7oOAQ1LBkP251zpAab
         0Ut+sJMxsVwpyMxMAoQfjYTQ4KsOHc4eZSA+ko2nu6hqpqzmtjudF/ggHJT/kVYVOswL
         uAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739984015; x=1740588815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q5LFrSvOIzwaN3lwLHmXira5Ktki7q9EDOPe0n/zn/I=;
        b=ny1DpcTrHNSTUm8d9y0/TNDUDIj8iY+PgRgL5eufZgSRL8rbfBTWhDL0ziDe3+5gcY
         eLkweXLEwI32DKSfhIgz1wTZhXLPdUUpUEvIiH5Ybl12n2Z0hd2I+j0HX6T/m/h2cGE8
         2gA4TjFbDKPfBLlvsI+L9OzPlUiPRdpZaJQuX7U2wGQv9c1avcE2VMzo/vgjdTe2kktK
         XmoWCWCCTA42Ap5tmiTjiYERgOyJkS+8rUyidVJwbhefZMUyPJN7cy5aIozuFpSvFGoq
         ONekmflaJG+FtkNKQzfYRhVv/G1f1ei3QwJMZTE/MZtVvbKBQSSVR3uY6l+ZJNbVFVxu
         wy6w==
X-Gm-Message-State: AOJu0YyIUwoxqNES9QgNV9ommbexUTzN6yCVfB3+AO1uI0ZEbdo6Xr4M
	V3gCOJrf+dCLai7I/Mlq10rRMLQe6wIUpd+qmbmY/XH/OXzyHEkvHp3hBwaZUUeCfzf5zACVP81
	8IWtMcGSgr5CZlkcYc6Vih0KZGdLkKIbT
X-Gm-Gg: ASbGncvHrun1cySHDLeUP3P169Wc2ftibWRQ5SX3TbuuSJ7lqyNeYCZjGr0f2q6fUla
	I+BgKZiUk0CFnyyYCNaqvonM2jX0L4dtPOxxcTM2p1pXArF6EPz4lKYTqBu+dZna67oAMKiGfmQ
	C+mqqTd54z/fKZTeR7Wo2hjH/BozjOaDc=
X-Google-Smtp-Source: AGHT+IFKyDx/Ya4v16faWt5ccw9N00cvQdIVp7Hny39tRst+346wS7kV216p32OiiJEqfNOwbnxrNkzPb04bem65HIE=
X-Received: by 2002:a05:6870:8a2b:b0:2b7:f09b:d6fd with SMTP id
 586e51a60fabf-2bc995aa0camr4328802fac.0.1739984015171; Wed, 19 Feb 2025
 08:53:35 -0800 (PST)
MIME-Version: 1.0
References: <CAKBKdXhaQLj01Kn06xMBsHExT1xNMKnHxTB+Hu33jtpySr-few@mail.gmail.com>
In-Reply-To: <CAKBKdXhaQLj01Kn06xMBsHExT1xNMKnHxTB+Hu33jtpySr-few@mail.gmail.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Wed, 19 Feb 2025 17:53:24 +0100
X-Gm-Features: AWEUYZmC4dawuCKVDzFIVZM2urm4D7l0HBkV99uSHtD6yOWRypHAX9HI_asvOHY
Message-ID: <CAKBKdXgKqoqDr04TjZZa0uRd0UyPng9iRCz_5JpCh-Ub4H2TiQ@mail.gmail.com>
Subject: Re: xl create/save throwing errors
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 5:04=E2=80=AFPM Petr Bene=C5=A1 <w1benny@gmail.com>=
 wrote:
>
> Hello,
>

To add more information and observations:

I'm running Xen 4.20-rc on a MFF Dell Optiplex, CPU is i5-12500T (6
cores, 12 threads). I have allocated 8 cores for dom0. Now:

- xl saving 4 vms, each with 4 VCPUs tend to fail
- xl saving 4 vms, each with 2 VCPUs didn't fail so far
- xl saving 8 vms, each with 2 VCPUs didn't fail so far
- xl saving 12 vms, each with 2 VCPUs didn't fail either

Note that there's always enough memory for all the VMs + dom0.

Also, I have observed new error lines when xl create is being executed
in parallel:
```
libxl: error: libxl_qmp.c:1399:qmp_ev_fd_callback: Domain 89:error on
QMP socket: Connection reset by peer
libxl: error: libxl_qmp.c:1438:qmp_ev_fd_callback: Domain 89:Error
happened with the QMP connection to QEMU
```

