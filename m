Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A88B1E645
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 12:14:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074214.1436885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukK7H-0007We-VT; Fri, 08 Aug 2025 10:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074214.1436885; Fri, 08 Aug 2025 10:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukK7H-0007UY-Sf; Fri, 08 Aug 2025 10:14:27 +0000
Received: by outflank-mailman (input) for mailman id 1074214;
 Fri, 08 Aug 2025 10:14:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SvPY=2U=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1ukK7H-0006zF-6I
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 10:14:27 +0000
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [2001:4860:4864:20::35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75a4f747-7440-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 12:14:25 +0200 (CEST)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-2eb5cbe41e1so1948515fac.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 03:14:25 -0700 (PDT)
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
X-Inumbo-ID: 75a4f747-7440-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754648064; x=1755252864; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MfRw4khzjTmRDNJRDeCo93aHPdWkYyI70htnmoVSbI=;
        b=Rw0SrCNGyb+ik2z1N88MFiwYSrkS11zm/D9r4IMMQKK4XEL9ZuvD1a8Opi9crSnHxc
         Icz93zOpmwUpTPafy7IDgP1P9G3PA4T8x1nGRJy9sXfK96NI7DQJXyJlW3u9LaSFrA7v
         9PoBZQLA2xcKTuFYXj6eY9LPTCJ+ZogTJKKDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754648064; x=1755252864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/MfRw4khzjTmRDNJRDeCo93aHPdWkYyI70htnmoVSbI=;
        b=lghTjEMwj9KnMnxn4/U9an2+SxS2XPZFKzjWw9IkICe9Dk+tXb2RDRqiUdHkm7Wjx9
         Gm39NPyw1GSiEX63BE1XGJzLaR1k664fHzUAmcyi42iiaGmG9ijhH5URK/8+127lmlYW
         gzJRcc85f4LLSCfcMpJwQuvm57eNm04Cv7RYZjGNM86ov4MudAAajjdnHxCNv5L8w3ik
         vaL0hTmXHy3agSh3jDepS52Ix8dmBgC+GECGnSDejQp35r/DXqG1USVHu2Ky+x+KoLrP
         X9brsHv7vgXsMLAf4Gwbtma9bm2ZNcJdI8oNCfqWCXblYuVMFKGGgOeyPQ+Zk2nRjQtF
         k7NQ==
X-Forwarded-Encrypted: i=1; AJvYcCXA1YDqXlaZ+2ZBFeTWWcGOKLq78S0y9UPDj2XLHvCf6aS/p4SiVR8dkQYtpRr8RbLXQgUreWCWdvc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz9z8Yyvym3h2ARL2pot6EKEpiSVidgjgJoUyst2jTErqBE5uAb
	kAZi8TWToa864m2l1+lKb97ZLXBnev5JZipRhGzJc2zGVLcVD6BoZJxOGzo1ZExOAFlqakyJnHD
	eOBzVwUoPoo+JW/vFHP9jqLpThWHw/t8lML563FUiGcdg9mBrWm5LaQ==
X-Gm-Gg: ASbGncv8gflR1H7vu8H4d4EiX4qOJST1ZtNgVC9/bjwE3ZxXL/1yMoRiGhk6nj9Jb56
	+SREUmj+0mj5MdjPygCSGg5k6jdIqGhUsTrRTrxlnwVkxebw5zwVDT00DFK+6j6vgUNzpPvGwUL
	WMOVNAkR56qzzUtA8tcTKDw2tkPr2xgpMqL5AFk+F1yFdLTWIeP5mIzXGrIP3aXIiW4mboGb4S7
	GQ770QUiz8mF/lw
X-Google-Smtp-Source: AGHT+IEZGVoAX84V4g1iMqQpCH/bsX0hJM40PZ8Zta9YrEHn7s5JriImZr1xok7b4JomZRPfVT2WtRzcqJgMf1MRnvQ=
X-Received: by 2002:a05:6870:a449:b0:30b:a9d5:d475 with SMTP id
 586e51a60fabf-30c2114ee68mr1466873fac.28.1754648064319; Fri, 08 Aug 2025
 03:14:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250805163204.3631483-1-ross.lagerwall@citrix.com>
 <20250805163204.3631483-2-ross.lagerwall@citrix.com> <f4c2a251-146d-4121-88ff-8f6d7624d298@suse.com>
In-Reply-To: <f4c2a251-146d-4121-88ff-8f6d7624d298@suse.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Fri, 8 Aug 2025 11:14:13 +0100
X-Gm-Features: Ac12FXzCsrsoopuoYTyKYJ9EQP-ZzvyprqeK6Hi5rUaltyGxwSn1Egx6pQm1EcA
Message-ID: <CAG7k0Eo-CF0=EZTznDU2MYEv9ewB5GDHj9GBaUzCRHZYEZdO6g@mail.gmail.com>
Subject: Re: [PATCH 1/2] efi: Call FreePages only if needed
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 6, 2025 at 7:16=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 05.08.2025 18:32, Ross Lagerwall wrote:
> > If the config file is builtin, cfg.addr will be zero but Xen
> > unconditionally calls FreePages() on the address.
> >
> > Xen may also call FreePages() with a zero address if blexit() is called
> > after this point since cfg.need_to_free is not set to false.
> >
> > The UEFI specification does not say whether calling FreePages() with a
> > zero address is allowed so let's be cautious and use cfg.need_to_free
> > properly.
>
> Well, no, this paragraph makes no sense. Of course this is allowed, but
> not as no-op behavior (like free(NULL) would be), but to free memory
> starting at 0.

Fair enough. This paragraph could simply be dropped then.

>
> > Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>
> This pretty clearly wants a Fixes: tag, or maybe it even needs to be two.
> I've checked the original code in 4.2, and things were consistent there,
> afaics. So breakage was introduced perhaps in one or two of the many
> re-works.
>

Fixes: 8a71d50ed40b ("efi: Enable booting unified
hypervisor/kernel/initrd images")
Fixes: 04be2c3a0678 ("efi/boot.c: add file.need_to_free")

Do you want an updated patch or can these tweaks be done while committing?

Thanks,
Ross

