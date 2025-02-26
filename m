Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA55A45313
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 03:30:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896108.1304777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn7B9-0001g2-4u; Wed, 26 Feb 2025 02:29:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896108.1304777; Wed, 26 Feb 2025 02:29:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn7B9-0001fJ-22; Wed, 26 Feb 2025 02:29:43 +0000
Received: by outflank-mailman (input) for mailman id 896108;
 Wed, 26 Feb 2025 02:29:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+Z1=VR=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1tn7B8-0001fD-Ai
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 02:29:42 +0000
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [2001:4860:4864:20::32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8579fab5-f3e9-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 03:29:37 +0100 (CET)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-2a94159cd5cso479609fac.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 18:29:37 -0800 (PST)
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
X-Inumbo-ID: 8579fab5-f3e9-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740536976; x=1741141776; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpKolSqnr5hUSDPq6oLDCjDKaUv0tHATb/WZDazeYFk=;
        b=e5d/jFcZXgCU/EyjhrCRoaKDHWwdmSD6Jhxb2Qs7bwEYwFT4A3P9KY89GPx1ydtiEa
         LQnywwPdGsCG0asM7X/pmhjOB66fkLmHIASS7cvP1G8aTPzcpnNuNY6GLYqVBuruXL3o
         wdRxuvkQpM3IoOwhl8jJF21z5hy+BGkJRk3M612vk0auBwbse0kpfSc4D87ot9BW0//0
         a6lwc/AdPVcWuorPUZBnX8cYwzzNVH/I6Ujd4K3WTvHKmE+/F3gK158v5SKFFiNDKwPw
         dTAapRy1YQO7FjNp8YTrVWR2Gfdp3PWsWHGjs8l/BZBUxniCbFbCziabKvoUrYJwSprE
         5KVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740536976; x=1741141776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tpKolSqnr5hUSDPq6oLDCjDKaUv0tHATb/WZDazeYFk=;
        b=HOH5f438y8snbcLay2ft6ErRkmRlrcBD5su/oCxeoGdbIdcdCGFuoYscWrEC/22QfI
         eRp88aRQwvMIuLqcWK1QZpA82Yc984W47bbdq1dfGARlSnI6CRntnlz6Xn/TdGgqBu/H
         tAjpz/2lBM/CeAj8v98s/F90AC4j77AnF5YrJJ++GSwNgIzY4k7iE/5Vrd1enemfA0eF
         SxH+Y86DSOGJLRv92TJvgArjalgHXupszBfAfIoJBJZyymPAxuko1aKrHhZpsYxTRP3F
         aK7LWlh+cRN7r2yQtXrI/cef/vtQkHNgANaTAevRNK7dnI2FrZkmQYuVGBJa04bHEdyW
         +GzA==
X-Forwarded-Encrypted: i=1; AJvYcCV3B8MCuOAOBSAUqBCsJsngZqyQmQPZ1bEEVYW9HOCK2f3T3AgNTcw9NcQg+3Vg7TqxwY4v+kr6bpw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxl9QN31WQgNeshg0RZoWsAvVnizCGPrlbFA5XmmH5xzLSIfZHh
	u0MCgsS2g6SVPawgc+u7weu24ZVOGF43WLWuNCn/ZLqafp5STUdn4E31zAhyknuyPHZwOaM7l8V
	N3Hh6zakEUH+8qqe0Zm1H9bCO/H8=
X-Gm-Gg: ASbGncu3PA04tWIkyU48sccs+1ExJEIvujR54DBl3bO8orS+tRam8x5BWZ//UJEHtFl
	CV/+VnPu0JEZGICb2FV7LmeA/1tHD6LihfBfSX9hG3WvbtTkJGppIz9xK9Nsj81ZGA7f7mn/lwx
	uPauJmIcw=
X-Google-Smtp-Source: AGHT+IENsU5aaECndYk8duZc0Wr7Fk1vvJBz3xswadsCc1kVQU7kIoiVNUhTTG8Rvvs/H4+Wk9KqNy87BsWOQJPBQ9U=
X-Received: by 2002:a05:6808:178f:b0:3f4:104e:f11a with SMTP id
 5614622812f47-3f4247b6f52mr5548233b6e.6.1740536975774; Tue, 25 Feb 2025
 18:29:35 -0800 (PST)
MIME-Version: 1.0
References: <CAKBKdXhaQLj01Kn06xMBsHExT1xNMKnHxTB+Hu33jtpySr-few@mail.gmail.com>
 <be2314bd-d212-4b9b-a50c-1b86b42ab861@suse.com> <CAKBKdXgMn90_R6_rKWAzrQdkpPXL1-ZxAKM8n8RPXiOeY7VtJQ@mail.gmail.com>
 <Z75lN_ShrXUGiT5e@mail-itl>
In-Reply-To: <Z75lN_ShrXUGiT5e@mail-itl>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Wed, 26 Feb 2025 03:29:24 +0100
X-Gm-Features: AQ5f1JrdrhTm0P2oI25MC7d1lurXUKgCxWNKxFVog_81gT519Wt_r_-Av2L7OyM
Message-ID: <CAKBKdXh0ANyMnB2VbB8ayp64DmOnHTw8WwB4VNQ7NxjpbfV2oQ@mail.gmail.com>
Subject: Re: xl create/save throwing errors
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 1:50=E2=80=AFAM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> This is domain crash.
> Anything interesting on the console log of that domain (if it has some
> debug logs there...), or maybe in xl dmesg?
>
> --
> Best Regards,
> Marek Marczykowski-G=C3=B3recki
> Invisible Things Lab

I figured. The domain simply crashes (bugchecks) and frustratingly,
the generated MEMORY.DMP is corrupted.

xl dmesg shows:

(XEN) d157: VIRIDIAN GUEST_OS_ID: vendor: 0x1 os: 0x4 major: 0xa
minor: 0 sp: 0 build: 0x271b
(XEN) d157: VIRIDIAN HYPERCALL: enabled: 1 pfn: 0x20e
(XEN) d157v0: VIRIDIAN VP_ASSIST: pfn: 0xc
(XEN) d157: VIRIDIAN HVCALL_NOTIFY_LONG_SPIN_WAIT
(XEN) d157: VIRIDIAN MSR_TIME_REF_COUNT: accessed
(XEN) d157v1: VIRIDIAN VP_ASSIST: pfn: 0x3ffff
(XEN) d157v2: VIRIDIAN VP_ASSIST: pfn: 0x3fffe
(XEN) d157v3: VIRIDIAN VP_ASSIST: pfn: 0x3fffd
(XEN) arch/x86/hvm/irq.c:368: Dom157 PCI link 0 changed 5 -> 0
(XEN) arch/x86/hvm/irq.c:368: Dom157 PCI link 1 changed 10 -> 0
(XEN) arch/x86/hvm/irq.c:368: Dom157 PCI link 2 changed 11 -> 0
(XEN) arch/x86/hvm/irq.c:368: Dom157 PCI link 3 changed 5 -> 0
(XEN) arch/x86/hvm/vmx/vmx.c:3413:d157v0 RDMSR 0x0000019a unimplemented
(XEN) arch/x86/hvm/vmx/vmx.c:3413:d157v0 RDMSR 0x0000019b unimplemented
(XEN) arch/x86/hvm/vmx/vmx.c:3413:d157v2 RDMSR 0x0000019a unimplemented
(XEN) arch/x86/hvm/vmx/vmx.c:3413:d157v2 RDMSR 0x0000019b unimplemented
(XEN) d157v3 VIRIDIAN GUEST_CRASH: 0xa 0xffffffffffffffff 0xe 0
0xfffff80648bbd2b3

So... it just confirms the bugcheck.

P.

