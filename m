Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE6997EEBF
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 18:00:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802209.1212413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sslUO-00028W-Bp; Mon, 23 Sep 2024 16:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802209.1212413; Mon, 23 Sep 2024 16:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sslUO-00025H-7V; Mon, 23 Sep 2024 16:00:40 +0000
Received: by outflank-mailman (input) for mailman id 802209;
 Mon, 23 Sep 2024 16:00:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qfp8=QV=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sslUM-0001ma-N7
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 16:00:38 +0000
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [2607:f8b0:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f93bdaa5-79c4-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 18:00:38 +0200 (CEST)
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3e039f22274so2455849b6e.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 09:00:38 -0700 (PDT)
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
X-Inumbo-ID: f93bdaa5-79c4-11ef-a0b9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727107237; x=1727712037; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pSVU/O/o2QE+f7bmu+CsvCuhchDcd7LIstqNnKTtMYQ=;
        b=Xqyv8OlUpo+KulbKr3d5PA+6FwKl9H6je9zL7sKTrv1ITVqZo9PbflKhj/a3klNyZA
         o4Mj1BfUZlZlFLBMoqyQ2sU3pp4CheI50WkbvE/QMyd+2p91reqXkbogBni+BDiZpRU6
         G5u1eBexDhh87faqQEO4MfZ2XQANRQV4zTjyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727107237; x=1727712037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pSVU/O/o2QE+f7bmu+CsvCuhchDcd7LIstqNnKTtMYQ=;
        b=CwwN/K0JO0LnXsGMWEEBt7KOwi5m21ioaUQDJsXmzqlkfUQ048tZ+cBpf+DI9oqN80
         3Gt+//C8plTabdYLDegb9KRa6nv1WAoxREYVHiJ9tJ0Ii3rZCzuvxVgc4wVYMrlQZ/yP
         8n9K2jrq/z5mID8PtZ+LDJ6+1whIQM9vnvBhAro4nKS3lEr4HlgVaCmIrWcIQuLfNEZK
         a9eT3dkoBw5c/xpSHPByqXPyhXS5BNeZ3ae2sDJ5G2Z9wVvbxVdQA5kR/5d9hDWG875A
         LsnXAkPC22V2j3XKT7+lThlmBUZyhgE97uB/6/EbhvgVBnal14hsD+Q34/y4cDOfPMrY
         9QOw==
X-Gm-Message-State: AOJu0YzJ7qUf3ojaYyY4amaUlc+fur5Ozx5s7QA+Col+CU21JjyHc3xQ
	5VB2Hk42FjamkEtHYHe5DVjmTNrynm9pN6FdtN3XXdAO+B26IteiMAvORcreSWtwyweHJhW6eJF
	u0BsLJsGbFcbq8gBo7xWQke+7Rhk+9DwNqsYuYQ==
X-Google-Smtp-Source: AGHT+IG3u2LHJ+h8dSuw6ZPFcYFVNCdGrSS+Arj5kp1514R1GLrQbgLbNMnKTMfST0coVwHxIoOj/nzqID9lwjo0KGU=
X-Received: by 2002:a05:6808:309c:b0:3e0:5896:a0cf with SMTP id
 5614622812f47-3e2729a5865mr6632146b6e.35.1727107236629; Mon, 23 Sep 2024
 09:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <c075d5e8-5581-4bf5-9718-e5bfedb1dac0@suse.com>
In-Reply-To: <c075d5e8-5581-4bf5-9718-e5bfedb1dac0@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 23 Sep 2024 17:00:25 +0100
Message-ID: <CACHz=Zj8ERytWm6UXTNCMTpzsk3_T+Fuo+-6uOEpRDLKfnbWZw@mail.gmail.com>
Subject: Re: [PATCH] x86: enable long section names for xen.efi
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Marek Marczykowski <marmarek@invisiblethingslab.com>, 
	Daniel Smith <dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2024 at 4:39=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> While for our present .data.read_mostly it may be deemed tolerable that
> the name is truncated to .data.re, for the planned .init.trampoline an
> abbreviation to .init.tr would end up pretty meaningless. Engage the
> long section names extension that GNU ld has had support for already in
> 2.22 (which we consider the baseline release for xen.efi building).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Interestingly builds with debug info actually use long section names by
> default, at least with recent ld. Or I'm unaware of where we control
> that behavior.
>
> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -91,7 +91,7 @@ XEN_BUILD_EFI :=3D $(call if-success,$(CC)
>                                           -c $(srctree)/$(efi-check).c -o=
 $(efi-check).o,y)
>
>  # Check if the linker supports PE.
> -EFI_LDFLAGS :=3D $(patsubst -m%,-mi386pep,$(LDFLAGS)) --subsystem=3D10
> +EFI_LDFLAGS :=3D $(patsubst -m%,-mi386pep,$(LDFLAGS)) --subsystem=3D10 -=
-enable-long-section-names
>  LD_PE_check_cmd =3D $(call ld-option,$(EFI_LDFLAGS) --image-base=3D0x100=
000000 -o $(efi-check).efi $(efi-check).o)
>  XEN_BUILD_PE :=3D $(LD_PE_check_cmd)
>

Reviewed-by: Frediano Ziglio <frediano.ziglio@cloud.com>


Frediano

