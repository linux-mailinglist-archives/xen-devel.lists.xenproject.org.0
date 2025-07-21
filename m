Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A88AEB0C816
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 17:51:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051614.1419976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udsnt-0005lU-Ae; Mon, 21 Jul 2025 15:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051614.1419976; Mon, 21 Jul 2025 15:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udsnt-0005j0-6p; Mon, 21 Jul 2025 15:51:49 +0000
Received: by outflank-mailman (input) for mailman id 1051614;
 Mon, 21 Jul 2025 15:51:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=focZ=2C=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1udsns-0005iu-9P
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 15:51:48 +0000
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [2001:4860:4864:20::2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b509ed1-664a-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 17:51:47 +0200 (CEST)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-2f77591f208so1953919fac.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 08:51:47 -0700 (PDT)
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
X-Inumbo-ID: 9b509ed1-664a-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753113106; x=1753717906; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OB0C4kK6K1QcztnLdzFas316ytdm4MLTW/oigjuCB0=;
        b=anRyj0cacD4dr7tSl8LGlhRf4F4YQO0OE7Y+QZpj8NxC7s7bFUXVMM/kE+3g/bYGHz
         zW9EGUk49F5WYE6ItwGOmegdxRErn0kAPGXLC+rhkEf3AM0a4aSxhhnXeYXfn9qubR3G
         ZLeYz68pP6Az34GnLqR+OLalbjolTEXbT4epo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753113106; x=1753717906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2OB0C4kK6K1QcztnLdzFas316ytdm4MLTW/oigjuCB0=;
        b=PApv03xABKO2cvGVRELB2/Fx7iOwg/YoLkjNN4nInfuuKVKt0uN8BUQU1Vy1xVQLJy
         su6Tij2ib2RiW2k2gm36ngbK0cU5RoYQTxiWFbkSoC7pkuN81xZKYOkvgS2toQTwqTOf
         rH8YTFKlxW1JNMoW5GuUBhohNA7JG3Irufm0qS2hz8Ayd5jK2fBd/MtoTseKjS2sI1jf
         HxGJsv1k/g7va/F8Dh3tIqiPxxNHw6Y2jcZFl7gcvm7beVP5urBjT2idwopuELuTrb/9
         KaUh91p2bK36y4EcmKNgungui+sPvUDQ8wWOPflQgoQyIvIOLPcK+Y/522/R/Fj0Xe47
         +vdw==
X-Gm-Message-State: AOJu0Yx3VTFZ9oy1fhLinfS3XYZkjlPoIg3bdCqzOdH3wyueAXkyPZnP
	nGTqbQ7mykUhi2+5Cy9HeN2OueiozVYvoNnZ38lsFauBUuQ0l0voIc9Xz2skrYW6k51jjuYfbze
	gP1qQLQL1wYPA78dm/BQlerzesNo9aeE+USIlDuVG
X-Gm-Gg: ASbGncuwcEVTyt4vKcY1hPMa8Tz31EdO3tzvYDDaLUCpmyoA4TM36PbK2w2CXZg4Dg4
	SzIqo8aQaFqXawlFY7+KNZbVpSJZSOsdzLJTelQp4zE8cgkkuVcrFUx0M7sY5FsUwtgLKFfdYmt
	hz3tz7GP30aIEWNf2l+tDG5RdIXVHrKxRgXy9iSdYy+Z/oSYg3NWCJw2BP1zFDVrGfwnHv5o9T5
	BOGqOvvNHEG0PMW
X-Google-Smtp-Source: AGHT+IG/GZRBCObq1oIgCVltvUmL+is4v6vwCV+0BN+euB5yjxIyAunQLUeMAUAbRgZNyJwjWQDTXDUe986N/OvMjmc=
X-Received: by 2002:a05:6870:1707:b0:2d4:c1f4:4309 with SMTP id
 586e51a60fabf-306a7445382mr73658fac.0.1753113106044; Mon, 21 Jul 2025
 08:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250716160007.92461-1-roger.pau@citrix.com>
In-Reply-To: <20250716160007.92461-1-roger.pau@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Mon, 21 Jul 2025 16:51:33 +0100
X-Gm-Features: Ac12FXx_T3sPjnG-C-wCWz4hj3UlyilSJTG2Cnl9V3qEVh9hVeRjMNe25kR76hc
Message-ID: <CAG7k0Epu6XomC=b7eG8xgcVvXpmoTOUQdC7yD9LsmEHOKTv-gg@mail.gmail.com>
Subject: Re: [PATCH] xen/livepatch: fixup relocations to replaced symbols
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 5:00=E2=80=AFPM Roger Pau Monne <roger.pau@citrix.c=
om> wrote:
>
> In a livepatch payload relocations will refer to included functions.  If
> that function happens to be a replacement for an existing Xen function, t=
he
> relocations on the livepatch payload will use the newly introduced symbol=
,
> rather than the old one.  This is usually fine, but if the result of the
> relocation is stored for later use (for example in the domain struct),
> usages of this address will lead to a page-fault once the livepatch is
> reverted.
>
> Implement a second pass over relocations once the list of replaced
> functions has been loaded, and fixup any references to replaced functions
> to use the old symbol address instead of the new one.  There are some
> sections that must be special cased to continue using the new symbol
> address, as those instances must reference the newly added livepatch
> content (for example the alternative patch sites).
>

Would it be possible to fix this at build time instead by generating the
payload such that relocations to changed functions always point at the
Xen function rather than the included function?

This seems preferable to me rather than making the runtime code more
complicated.

Of course, neither approach would fix all cases - if the function is
completely new calling it would still page-fault after reverting the
live patch - so the usual care needs to be taken when creating live
patches.

Ross

