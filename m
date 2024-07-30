Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBB1940DCF
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 11:35:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767409.1178013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYjFj-0000ce-TG; Tue, 30 Jul 2024 09:34:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767409.1178013; Tue, 30 Jul 2024 09:34:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYjFj-0000aH-Pm; Tue, 30 Jul 2024 09:34:43 +0000
Received: by outflank-mailman (input) for mailman id 767409;
 Tue, 30 Jul 2024 09:34:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZYes=O6=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1sYjFi-0000a8-6x
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 09:34:42 +0000
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [2607:f8b0:4864:20::1033])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f124efc6-4e56-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 11:34:40 +0200 (CEST)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2cb5787b4a5so2675655a91.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 02:34:40 -0700 (PDT)
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
X-Inumbo-ID: f124efc6-4e56-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722332078; x=1722936878; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8NeC0x2vepROQfxqNt15Zwi79SYG3mwUmPegufzJ+8=;
        b=NImZUKE+d5vd3KgajUKTIPP6OVNrAcSVPnQG8t8N8bVrAlJpSAvb+MulVijrYHCFZ+
         91U/Jdjq4IjyuLqVzRVTytGJbNwo5JGtb9VtJWUZwjZncPreE3Fngfa1xhFshyiNicm3
         g7N480UEBF8ULJJtcpAbJHbUlIxCP9qs5tGAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722332078; x=1722936878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8NeC0x2vepROQfxqNt15Zwi79SYG3mwUmPegufzJ+8=;
        b=v2B71tF/JkC0H5Qt/LrQSm1NgWZJ7uISMDzUUXc1dEqBeYDXi/D+rQ7X4IYGTMn5gA
         WGeV8d9LKWyG7GvPxRUgNNa0N1ZsS0gneI7FiNN2SVsmXUGhOKygZ3tJbo/4gTf4/FN9
         Kjawh6b/JXHhstzotQeck+LfJoCBPQjHSEB1Mt/doc1+7O0YiXpBgi8MBJ0lz+RnbJf8
         QcsGTaVvljj5IydYuwvyngbACJgLFIC3vYQw3ymtl/3uyH980tTgOZ/sFUYu1sRWNjU2
         I+EPZXhzeyygyCj6M5PVzFJEUdGABxn48wjf/C+2RvBCQIcefBS1h1lVB9t7OzqFoFQ4
         SNyg==
X-Forwarded-Encrypted: i=1; AJvYcCWu73xDFlViNuz2iL4s13mtfgKDk7AD2cebsn1GQndrNXtdDk634OnwIh/xMqSMipLy8JdL9p6xu9JNYVGkgQo6O8hKpYjYs9HEj1sheZ4=
X-Gm-Message-State: AOJu0YwAdhx/+PYnTJp/H7mdPnZPLId0MCD3IvC7yPkyGcJbFx8XQjPo
	6fd4ic3maikMTnbCDiiBeAfuXMCPcKQJRMQTSyLx4Cka1BJP1syBEbBLoskmgLU4CVatq26I2AW
	7VTyJ5hvrbcjRTHY71qdV3uQRbEb+aW6tLBQP
X-Google-Smtp-Source: AGHT+IF6zr4nsGjuS66zyzczRh2l40B4sOZPgSXg5dnNxMHlPEHn6EXJjBPPFhp8oC2XzAr7b/QOt9bZ28FwsySCC0I=
X-Received: by 2002:a17:90b:915:b0:2cb:5455:8018 with SMTP id
 98e67ed59e1d1-2cf7e1fb9d1mr8620472a91.23.1722332078316; Tue, 30 Jul 2024
 02:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240730080342.1814470-1-ross.lagerwall@citrix.com> <a99a8fea-59d1-487d-ba40-cbdd88d30400@suse.com>
In-Reply-To: <a99a8fea-59d1-487d-ba40-cbdd88d30400@suse.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Tue, 30 Jul 2024 10:34:26 +0100
Message-ID: <CAG7k0EqMyZBFseyKey2sEaSL1JxFWtkQeJ=Xc_rfB339kN+S0Q@mail.gmail.com>
Subject: Re: [PATCH] bunzip2: fix rare decompression failure
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 10:25=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 30.07.2024 10:03, Ross Lagerwall wrote:
> > The decompression code parses a huffman tree and counts the number of
> > symbols for a given bit length.  In rare cases, there may be >=3D 256
> > symbols with a given bit length, causing the unsigned char to overflow.
> > This causes a decompression failure later when the code tries and fails=
 to
> > find the bit length for a given symbol.
> >
> > Since the maximum number of symbols is 258, use unsigned short instead.
> >
> > Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>
> Acked-by: Jan Beulich <jbeulich@suse.com>
>
> A Fixes: tag and maybe an Origin: one would have been nice; the latter ju=
st
> "maybe" because the Linux patch is one of yours anyway.
>

Indeed, I decided against an origin tag since I wasn't backporting
someone else's change from Linux, just fixing the same thing in
multiple places.

I should have added a fixes tag. Here it is:

Fixes: ab77e81f6521 ("x86/dom0: support bzip2 and lzma compressed
bzImage payloads")

Thanks,
Ross

