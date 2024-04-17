Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A5B8A86FB
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 17:05:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707622.1105708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx6r0-0000kZ-Ts; Wed, 17 Apr 2024 15:05:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707622.1105708; Wed, 17 Apr 2024 15:05:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx6r0-0000iv-QO; Wed, 17 Apr 2024 15:05:42 +0000
Received: by outflank-mailman (input) for mailman id 707622;
 Wed, 17 Apr 2024 15:05:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YbRu=LW=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rx6qy-0000Ph-Rt
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 15:05:40 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f317863d-fccb-11ee-94a3-07e782e9044d;
 Wed, 17 Apr 2024 17:05:39 +0200 (CEST)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1e3f17c6491so49011145ad.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 08:05:39 -0700 (PDT)
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
X-Inumbo-ID: f317863d-fccb-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713366337; x=1713971137; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ehegoM7m+I2AbPpzin6M9mzfX1KLG2nSWHjxBMMBm0=;
        b=pu7PMQprSMQvOJHzMVvFzZQSUSCNHm4W7CRGXPaEAaErg3bleKlOI0myJ6JKzEXFsr
         5jWreJ4oUti2fxf8vsvcplr4njidXwMD1uC1cDG+GaC6xT1zrxNrAOddhvWlWwUl489Q
         EsTvvba3u2SZ3YuNmBhJPWf3rhvzUVRMhxxfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713366337; x=1713971137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ehegoM7m+I2AbPpzin6M9mzfX1KLG2nSWHjxBMMBm0=;
        b=gwc2GLdFU9EVeYHAFOMO7mdzFgA3Lv8Cls0ivxk6uaD+uT0donGv0KHZAYxr1tXfNO
         a9SDcEg7qdOZQU6DyQ0sujmUS9hgjGSdh3CHb9EN6bxWLgksZn+01KDXajTA1qFULn4M
         Jq86ETfM57zQwInK46g7hBsPJsbCq+6HiF6ItTsJgyS/i/V6F/UqOr5MmuMnvoJt2s88
         6NebrcB2QAMr9ykICPyGEpByJSmclYoTTwivvqTN4H8YmjiMTjccVCghElH6VgwQIFSC
         jypjbyHjH6bamnK2cKVp2+zca0Dxo9QZug45K5nuAh0M63wzG96gSw2jxudfxkhrhhL4
         jRwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUM+F3OCLpokHwjTcgisyGgU5RpO3XAfJ9jt6HZmvzzPoib3zAbmhHecn1cOMo3aY9t4QpijceKNEMG9xcygT9WTUb4XQi/YQ+j4q1ZO98=
X-Gm-Message-State: AOJu0YxqBvYlUFnBLLTjW+TJPfyUJK/TTwoI23bqMaG/i0L/yjdHzbdD
	lC4/a/TlGTBuLsIY+n6CgvAxipFIvp2AJIgBXsAtD8BJkQY0CdzaF0+0v7JrBxDOYVxSgMXGCaP
	53hnN2NgNqLhQIk23uR+NXaLQxQoZn0m++Mad
X-Google-Smtp-Source: AGHT+IE4vl2IFTPUztnNeSnUDiE7Dg9mUAW6bPiLBVHocCBUjoglzwjqhH1K2vCnlpCQljieF1hyeVN5uIin5twUZ34=
X-Received: by 2002:a17:902:d512:b0:1e4:3dd0:8ce0 with SMTP id
 b18-20020a170902d51200b001e43dd08ce0mr18603565plg.20.1713366337479; Wed, 17
 Apr 2024 08:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240328151106.1451104-1-ross.lagerwall@citrix.com>
 <20240328151106.1451104-2-ross.lagerwall@citrix.com> <c3c2ce12-0699-42b3-bcaf-5bddf0616566@suse.com>
 <CAG7k0EroeA=cRRDWnJqzH8esoaSmtg8-xjTwc-01og5R9JwPzg@mail.gmail.com> <0d84a96a-c1ec-4c4e-9cb5-44a6542e0d43@suse.com>
In-Reply-To: <0d84a96a-c1ec-4c4e-9cb5-44a6542e0d43@suse.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Wed, 17 Apr 2024 16:05:25 +0100
Message-ID: <CAG7k0EpKRVpbfBOSA9tsQsGM9_nLCmrZNYzV6G9u5g46oZWKwQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] x86: Add support for building a multiboot2 PE binary
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2024 at 3:15=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 10.04.2024 11:41, Ross Lagerwall wrote:
> > On Mon, Apr 8, 2024 at 11:25=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >> On 28.03.2024 16:11, Ross Lagerwall wrote:
> >>> * The image base address is set to 0 since it must necessarily be bel=
ow
> >>>   4 GiB and the loader will relocate it anyway.
> >>
> >> While technically okay, what is the reason for this adjustment?
> >
> > The multiboot2 spec generally uses 32 bit addresses for everything and
> > says:
> >
> > "The bootloader must not load any part of the kernel, the modules, the
> > Multiboot2 information structure, etc. higher than 4 GiB - 1."
> >
> > An image base address above 4 GiB causes trouble because multiboot2
> > wasn't designed for this.
>
> Yet mb2 doesn't care about that PE header field at all, does it? In which
> case my question remains: What purpose does this particular modification
> of the image have?
>

With the currently published version of mb2, it doesn't look at the PE
header field since it has no knowledge about PE binaries.

With the proposal on the grub-devel list [1], mb2 would use the PE
header to load the new xen-mbi binary in which case, the image base
address is indeed relevant.

Ross

[1] https://lists.gnu.org/archive/html/grub-devel/2024-03/msg00081.html

