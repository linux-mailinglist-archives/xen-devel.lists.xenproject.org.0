Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C22B93902A
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 15:52:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761994.1172082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVtSa-0006lp-2Q; Mon, 22 Jul 2024 13:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761994.1172082; Mon, 22 Jul 2024 13:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVtSZ-0006jI-W5; Mon, 22 Jul 2024 13:52:15 +0000
Received: by outflank-mailman (input) for mailman id 761994;
 Mon, 22 Jul 2024 13:52:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZPk=OW=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1sVtSY-0006jC-ID
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 13:52:14 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 987f354e-4831-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 15:52:13 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1721656330130922.7612174364122;
 Mon, 22 Jul 2024 06:52:10 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-6659e81bc68so44858747b3.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 06:52:09 -0700 (PDT)
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
X-Inumbo-ID: 987f354e-4831-11ef-bbfe-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; t=1721656330; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=O579i6ruDriWBCMmmQcV0hHLn2ZQAfxwlu+8KLl0YcXg6uf74ee0/mbxBRL+MUwvS578jm6G6bvKqWgWMbCl+KZ8MiTcCgVK4lLb8YtUjRYtR0a4Q9HPoKpI+MpQomSRPrBsrjUiGS4EtV/rUxg2e/Buv+7yMSf3ZEn8F5FoZAI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1721656330; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UWyLZ+rbKDcHujQTg+aeEEMLPQh3LsNe/noT9Sjxsf4=; 
	b=PoVTfsdclnStztFqkziTDWf24HYVtE+Xa9vXkQjInvlyyRohU+Z+hrsBmn+gxa8HFE5NYqYE2x1P4M3DkWYwiQS2gbC7jg6xY6Hc/wfMkY2k9IHMERLYx5D14Ncx5093ZOPnKCiSa6MONysEghGQfYXSFqYH55RxiTo1WpAb/m0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1721656330;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=UWyLZ+rbKDcHujQTg+aeEEMLPQh3LsNe/noT9Sjxsf4=;
	b=RkFh4FO1i0zv7O1VJVll+/M3bWZdT4B8d/dX23aIOCB5obU/yA0JYAmPHg+egtVn
	z6rsvlEqskKm61B9Ll2q+sdgtSsW5I+sezjKyMTy2IGZYtCdydddWcgO/giaa32uv4m
	iddl1utNwDRnjJ+16QgAIrZpXbjUgM9VKRfpx5tw=
X-Forwarded-Encrypted: i=1; AJvYcCXgwWCi4ajKF2pHh+KxXm3DaNH1kIAdhOBCCPAXfLcybOyZegCU2nCDYDviniMlnikWR2paWKt8v/Wz40DHj/7S3foTnbkqUQNnLEaq8PE=
X-Gm-Message-State: AOJu0YwJmA8d4r86OYTlqPKfO3YnqrZrgLR55tE+KCbq3yEPp3S8MEsv
	f9zg1ASaSJS0STmhKTO64QswSnpYZRAoVJ5jhUVfOwDlbhTdRtuEYiX84I8uPIRRxP5yxsaPfSo
	/FCnHFTAaHUpiWLjwyWD62WsD+7Y=
X-Google-Smtp-Source: AGHT+IFyLjdiPqIwzq3xtBmnD7XGgXLytFBMlU3YMNEYTPhBuPflPnZYGCfpcFj0rqYJYtxT75MN+suu5W9u+/yIbuw=
X-Received: by 2002:a05:690c:6187:b0:650:859b:ec8d with SMTP id
 00721157ae682-66ad830a00fmr92292477b3.10.1721656329371; Mon, 22 Jul 2024
 06:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240722112752.4981-1-tamas@tklengyel.com> <9013e512-2710-4492-8e60-8f25ba32bbe6@suse.com>
In-Reply-To: <9013e512-2710-4492-8e60-8f25ba32bbe6@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 22 Jul 2024 09:51:33 -0400
X-Gmail-Original-Message-ID: <CABfawhmPm18vuqVR6S6K2Rv0nCssUsrY0jgJthVF_y7TuKVx-w@mail.gmail.com>
Message-ID: <CABfawhmPm18vuqVR6S6K2Rv0nCssUsrY0jgJthVF_y7TuKVx-w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] Add libfuzzer target to fuzz/x86_instruction_emulator
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2024 at 8:24=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 22.07.2024 13:27, Tamas K Lengyel wrote:
> > This target enables integration into oss-fuzz. Changing invalid input r=
eturn
> > to -1 as values other then 0/-1 are reserved by libfuzzer. Also adding =
the
> > missing __wrap_vsnprintf wrapper which is required for successful oss-f=
uzz
> > build.
> >
> > Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> > ---
> > v3: don't include libfuzzer-harness in target 'all' as it requires spec=
ific cc
>
> With this, how is it going to be built at all? Only by invoking the speci=
al
> target "manually" as it seems? Which sets this up for easy bit-rotting. I
> wonder what others think here ...

Yes, by calling make with the specific target. It's not going to
bitrot because oss-fuzz will pick up any regression on a daily basis
to this target. I assume you would be interested in receiving the
fuzzing reports so it would show as a build failure in case something
broke it.

Tamas

