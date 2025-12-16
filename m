Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7A5CC6201
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 07:03:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188397.1509691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVkca-0006dT-UW; Wed, 17 Dec 2025 06:02:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188397.1509691; Wed, 17 Dec 2025 06:02:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVkca-0006bp-RM; Wed, 17 Dec 2025 06:02:48 +0000
Received: by outflank-mailman (input) for mailman id 1188397;
 Tue, 16 Dec 2025 19:59:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Tw9=6W=gmail.com=david.laight.linux@srs-se1.protection.inumbo.net>)
 id 1vVbCY-0001NB-Hg
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 19:59:18 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2e2fff8-dab9-11f0-9cce-f158ae23cfc8;
 Tue, 16 Dec 2025 20:59:16 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4779aa4f928so61206425e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 11:59:15 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4310ade7c3fsm779077f8f.26.2025.12.16.11.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 11:59:14 -0800 (PST)
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
X-Inumbo-ID: b2e2fff8-dab9-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765915155; x=1766519955; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjniS35+gFl94KgDPsESP+GSizMKZS5/qxbShY9gflU=;
        b=VRS67tdnTlTP1NEZZ7pi/wc3kfoOQ5J4IJSp333vb3IT2HWfopMWtZBlWmReVJZkIo
         /pIZpOhzgo8t7qbsMIaKn3N6ZuJ0Usfp3TnjJ+6OQuWSt30IjLGF9k8seifyJeGVZdD1
         psyVcNd8Es4gHjkKVNeMkIJ0Dy4bbF5UmKidIEiqCQZWC0eCJFdpVu2KlqamXYWSOIyB
         EC2PNTpepkUpJhfNxHczilvhoPMdf6RqTulillsMlIdIDS3P0Rz1PpoGQZWDCZfixvdD
         4C2Ft9keDA3f/UUqZVD+UeZPhVuYc0U3rhd4zbKFq+GsZd4avTTJsiyANeXKYABGDBOI
         3f+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765915155; x=1766519955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GjniS35+gFl94KgDPsESP+GSizMKZS5/qxbShY9gflU=;
        b=VWGPr8IQ6pQwjtgu2bBvSRuewu9D5RfI+IUooAf0DdNTCWP/6+M4HX5iptmPuw1pRE
         xDTtig4vRU5U4kbxprgtobNm34SoiEPaV91c8ZHnI3Q3MfqFp473vaMiNzyghFm38oVU
         bAdPbRu/LvNShKQgTVh0HKCEwKiuKCA6YA+azrqtLf7lncSaZNUc+BC35Hj77CxvOKgs
         kvGYn62H+MWGcOxoF9vvntBxoGep3Ryvc5vpONVBSmYgEFt0yiW3Kpv2T3NsIMGajQAc
         NM/Ja28vbduwUVRWTeqRU/ARWw8pifZeEXCkLZ6lAcwt9v/vecA222wzrdT4vvxCujXK
         7cSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEYWgZ8pm0LmsHyovWGm7d9sdgn4B8O2HCCoqeT7n+Fmvx7KXl4OEuJRVqALMn3IdQcoK54LlP3TQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzElvdsE1w6EEaPBaTynF3dYsgDINYkMb28mEFS6jNDJmIsCIFA
	vf9KiCPAdu6Ugu2UNJnqd6pA7sHkL6gzUonMz+Ll5TBdFtdUkhJqurYB
X-Gm-Gg: AY/fxX5qQFil6M3QMeV5xN3Nut9Pz67afNzKHhDimy8ax/F5B3I9z7BRhCUNohp1wVB
	U0DYcf19vHwixBdMHfGV7MayyAQ8OulfnVlxb5FkXCuxwxc9D8Mt6tlmrh7Ykvres8bdVVjTqFt
	XSFrh1rKollFU4B7t3k4u7qbWI1GlTtVnBf58lYZH3gXBwYb2lvidbtTHJyGAgIvFdSYTR0tPxc
	3k+5/dcUu/WOQ2bwdfMIQfhKirNl8pHX3+4Z4BWHYWgmIGyTCdhcLOwSml/8HXrMvt7UMwbrvHv
	ZLhgShUSfbDBrihFp3fVd2zboCE0QNkb9+lakz6dafzZA1Bd0pS0ZlzfLRRvG80Nt+ecwlsC43M
	IzJZulDnL1rkXQRGa4YIVl9o8k+H4SZSbnxFBHX9nvwu4RD8AV+75j4Sw0g14F/jVndjTMCs+cz
	E7WJB4I2Dig8Rm5AJ7Q1y9Kq3GNohNRPh/npN++KOKKsjbBYhlRkp6hsJ57WuBfPY=
X-Google-Smtp-Source: AGHT+IGkMCP0kONGgG89SYNUeIIN6orwCVUUHEl6uObTm3wydLwUSISgvgOvaVGUZQxtmSBHQ8CSsQ==
X-Received: by 2002:a05:600c:4595:b0:479:3a87:2092 with SMTP id 5b1f17b1804b1-47a8f9145edmr152180075e9.36.1765915154784;
        Tue, 16 Dec 2025 11:59:14 -0800 (PST)
Date: Tue, 16 Dec 2025 19:59:12 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Ingo Molnar
 <mingo@kernel.org>, linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux.dev, kvm@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-block@vger.kernel.org, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Ajay Kaher
 <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Denis
 Efremov <efremov@linux.com>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 0/5] x86: Cleanups around slow_down_io()
Message-ID: <20251216195912.0727cc0d@pumpkin>
In-Reply-To: <14EF14B1-8889-4037-8E7B-C8446299B1E9@zytor.com>
References: <20251126162018.5676-1-jgross@suse.com>
	<aT5vtaefuHwLVsqy@gmail.com>
	<bff8626d-161e-4470-9cbd-7bbda6852ec3@suse.com>
	<aUFjRDqbfWMsXvvS@gmail.com>
	<b969cff5-be11-4fd3-8356-95185ea5de4c@suse.com>
	<14EF14B1-8889-4037-8E7B-C8446299B1E9@zytor.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 16 Dec 2025 07:32:09 -0800
"H. Peter Anvin" <hpa@zytor.com> wrote:

> On December 16, 2025 5:55:54 AM PST, "J=C3=BCrgen Gro=C3=9F" <jgross@suse=
.com> wrote:
> >On 16.12.25 14:48, Ingo Molnar wrote: =20
> >>=20
> >> * J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wrote:
> >>  =20
> >>>> CPUs anymore. Should it cause any regressions, it's easy to bisect t=
o.
> >>>> There's been enough changes around all these facilities that the
> >>>> original timings are probably way off already, so we've just been
> >>>> cargo-cult porting these to newer kernels essentially. =20
> >>>=20
> >>> Fine with me.
> >>>=20
> >>> Which path to removal of io_delay would you (and others) prefer?
> >>>=20
> >>> 1. Ripping it out immediately. =20
> >>=20
> >> I'd just rip it out immediately, and see who complains. :-) =20
> >
> >I figured this might be a little bit too evil. :-)
> >
> >I've just sent V2 defaulting to have no delay, so anyone hit by that
> >can still fix it by applying the "io_delay" boot parameter.
> >
> >I'll do the ripping out for kernel 6.21 (or whatever it will be called).
> >
> >
> >Juergen =20
>=20
> Ok, I'm going to veto ripping it out from the real-mode init code,
> because I actually know why it is there :) ...

Pray tell.
One thing I can think of is the delay allows time for a level-sensitive
IRQ line to de-assert before an ISR exits.
Or, maybe more obscure, to avoid back to back accesses to some register
breaking the 'inter-cycle recovery time' for the device.
That was a good way to 'break' the Zilog SCC and the 8259 interrupt
controller (eg on any reference board with a '286 cpu).

	David

> and that code is pre-UEFI legacy these days anyway.
>=20
> Other places... I don't care :)
>=20


