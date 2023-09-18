Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAA27A4501
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 10:43:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603821.940902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qi9qd-0002Cc-ST; Mon, 18 Sep 2023 08:43:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603821.940902; Mon, 18 Sep 2023 08:43:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qi9qd-00029T-PZ; Mon, 18 Sep 2023 08:43:15 +0000
Received: by outflank-mailman (input) for mailman id 603821;
 Mon, 18 Sep 2023 08:43:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pP1k=FC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qi9qc-00029L-Nh
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 08:43:14 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66deb130-55ff-11ee-9b0d-b553b5be7939;
 Mon, 18 Sep 2023 10:43:12 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50079d148aeso6936275e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Sep 2023 01:43:12 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 r13-20020ac25a4d000000b004ff9bfda9d6sm1713117lfn.212.2023.09.18.01.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 01:43:11 -0700 (PDT)
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
X-Inumbo-ID: 66deb130-55ff-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695026592; x=1695631392; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sNh+8aGIG6+Vd8reRK1569GS372PTFUt9nPjdKhR0Po=;
        b=N3SO1xu1l45yGfKHdaibayqiKgEZLp3wvzEHmVZozIUP9OMBNWh9xnpB6glpeyDQO+
         An3eIp4nO1M6LsERn2XbDuc0NDFNvRwDI+DO+WOZSs5dZqccqcU7TbufvyL+ac35P9Tz
         OkWGhzthcC8cpnFykjRvqszWbEmNKtwCXiAa2e82+nmYGFxwUmmFx7c9tZKT9sfq99yu
         EPyu3Yu6yrl0hTLA0+RmdJDwCLArBPp8OpTNyWj4XScWAU1iLbySL3SP/0mtFsdBqG1b
         1b0P97VCk87CuVrJq9B251HiMANduktTZc4nTh6mFIgJs+KWCzJovpbrr5bvvZxHURyt
         0eOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695026592; x=1695631392;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sNh+8aGIG6+Vd8reRK1569GS372PTFUt9nPjdKhR0Po=;
        b=gKhxTHdYVOXjHdXDSuoZiS8QyRPeQFh+qr+G+bo6XQmwUQLzrFsycEeJ//NyLc9tcg
         5H5pf7zYgKYG7eD0+YLMfJU/Fn7nIUuKmrM9nwXtntxJml5fGGtEpjqjFhgPLuzBR1pU
         sVn+XKMSxWaKUmVvwZlx2Z/KpqOdcIunSrDoQ5B5bSpK9nxq5708RuVBpy0Jve7Bu5NH
         LC/JuZPoYWMLsoyFKIwDalWF3yThCkNPLE9wel0XRSNDszc5qHl1vnCLnH4n/2Pv2bHJ
         IbJ3OEPGe8BrIbL0v8imd0mg4ry69LQCsLhYPWio04KOqCQx5cUcrohiHBY3nGp3G0A3
         upZA==
X-Gm-Message-State: AOJu0YwUz3AHMRPS2xDIYmLFMPUFFjiIgpGKWJrO6B8Tm6np6oxkqwkB
	ng4CtgAbCbDnbSQrVpg+p8BAv/b/Hq8=
X-Google-Smtp-Source: AGHT+IHQ6/zfkx7mYHZ/NQ/A9Pu7xz7BLqJoC8ROtYb5A/rgRuV6lD7IAhVOWxLRwSfocHhkLE6TDA==
X-Received: by 2002:a05:6512:2214:b0:503:175e:f005 with SMTP id h20-20020a056512221400b00503175ef005mr2157970lfu.38.1695026591815;
        Mon, 18 Sep 2023 01:43:11 -0700 (PDT)
Message-ID: <f249f33acf10c3ac8a35fa92c10ddf7f8618d63d.camel@gmail.com>
Subject: Re: [PATCH v1 01/29] xen/asm-generic: introduce stub header
 spinlock.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Mon, 18 Sep 2023 11:43:09 +0300
In-Reply-To: <bffaf38c-551d-b9f4-5060-3803e73bee70@suse.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
	 <30743e7391ad474724258441b7ec83affcf6b230.1694702259.git.oleksii.kurochko@gmail.com>
	 <bffaf38c-551d-b9f4-5060-3803e73bee70@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-09-14 at 17:35 +0200, Jan Beulich wrote:
> On 14.09.2023 16:56, Oleksii Kurochko wrote:
> > The patch introduces stub header needed for full Xen build.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Hmm, looking here I think I need to take back what I said in reply
> to the cover letter, taking this as an example.
>=20
> > --- /dev/null
> > +++ b/xen/include/asm-generic/spinlock.h
> > @@ -0,0 +1,23 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ASM_GENERIC_SPINLOCK_H__
> > +#define __ASM_GENERIC_SPINLOCK_H__
> > +
> > +#define arch_lock_acquire_barrier() smp_mb()
> > +#define arch_lock_release_barrier() smp_mb()
> > +
> > +#define arch_lock_relax() cpu_relax()
> > +#define arch_lock_signal() do { \
> > +} while(0)
>=20
> Slightly easier (and without style violation) as ((void)0)?
Thanks. It is much easier.

>=20
> > +#define arch_lock_signal_wmb() arch_lock_signal()
>=20
> How's the WMB aspect represented in here? I think you need the x86
> variant as the generic fallback.

Agree. I'll take x86 version in the next patch series.

~ Oleksii

