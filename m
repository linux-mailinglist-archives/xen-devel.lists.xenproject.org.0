Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88735772E8C
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 21:14:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578898.906638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5fj-0008Ac-FL; Mon, 07 Aug 2023 19:13:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578898.906638; Mon, 07 Aug 2023 19:13:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5fj-00088a-Bn; Mon, 07 Aug 2023 19:13:43 +0000
Received: by outflank-mailman (input) for mailman id 578898;
 Mon, 07 Aug 2023 19:13:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qk11=DY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qT5fi-000888-AU
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 19:13:42 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8423dd5c-3556-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 21:13:40 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-52328e96869so3623949a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 12:13:40 -0700 (PDT)
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
X-Inumbo-ID: 8423dd5c-3556-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691435619; x=1692040419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXxMEtzIXtzgrrtBXu1NPeueyjZJ8BAJ7BaiSiWCnkU=;
        b=OHkY0nOSdqh/FIrYL07zgHYHXA4M9yfec4cgL0/ZsTlcubZRB09Xmz7RAsFYTDvSUD
         AIrFcWGG8A1EHy8UX4+S0MunsXDXkcsZDmvFNO74lORRx0XcQwlvz/pq7DDVy7zEpkD4
         gGZ+kTuqRHu3cFAjgMbD1v+PAThmofi0mfUR9jlTq4dvC+/HjsdRiV/D8DGada/tUo3s
         m8RR103hx0vpw/WaC4KsXMSjfBOj6xKT6omnGTwlyERjSPFFw7y+WQlSYXugwR1InnCZ
         YDHb7moHW5qR5Ky+PlbDyhErLvnI/8lWqBRjrOTCmK0BTW7NeJcAOBOfGBKLjIABMwjO
         YkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691435619; x=1692040419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXxMEtzIXtzgrrtBXu1NPeueyjZJ8BAJ7BaiSiWCnkU=;
        b=CzcT+ZHPr9L/F6r0p5skN8Hy8+p4Nfhmv2gohABpk6RVh2zBsNgbDDZw0cKJgVaNjL
         m1pvv9bWAeYsfOrV3KpcsC3PylDLnz86vsUVb+YMZSY2qd8dQ8SOH+NKPe02/AdmmyKp
         /2KNvhuQWn0mbQ6IPpLZ9qh3LwmXOUcYMWM68ZYTiErA4knhLUecxiCSTBABGBbpb6Jm
         ku3AMgZEQUhQZ9SSKRyZno/dEeTsAvXcJznQkWPgB5TMS9PaUu/a+OBcvP7Rxw1L06/e
         wAz+L569o31PGKHZWBbeICTcOOAIJ0Iy0otsgkzxje6yL+3mrWYQB23Zyex9AvblwjQp
         N0IQ==
X-Gm-Message-State: AOJu0YzqWDloJEP3HTN0ukIlo1AZNdHQz4f3Qipx+6n028ARxLu/j76E
	3IsLopM2Rue+sn0vlyJXyZNLMG+t0BMjb3IdOGJWu6Ac
X-Google-Smtp-Source: AGHT+IGsJrdTF/VBHdSRUmI4G2FG/S8Tsgk5Kcx9xzUfrGQCqDzRZjKLnlj+b0BYpoyfSrQwCHwCYZlxGCEYBJuP6iM=
X-Received: by 2002:aa7:c2c9:0:b0:523:3e4f:1ff8 with SMTP id
 m9-20020aa7c2c9000000b005233e4f1ff8mr1983673edp.16.1691435619009; Mon, 07 Aug
 2023 12:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <10ce72fb-4fb7-67de-41ec-7291dbac0038@suse.com> <3c819879-d113-facd-b025-b062e68bb6a1@suse.com>
In-Reply-To: <3c819879-d113-facd-b025-b062e68bb6a1@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 7 Aug 2023 15:13:26 -0400
Message-ID: <CAKf6xpvGL-WNKeU6WvWgf0TGU9Kz0OVp+x7gYBKanHQq-O9c_g@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] x86: allow Kconfig control over psABI level
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 26, 2023 at 6:34=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> Newer hardware offers more efficient and/or flexible and/or capable
> instructions, some of which we can make good use of in the hypervisor
> as well. Allow a basic way (no alternatives patching) of enabling their
> use. Of course this means that hypervisors thus built won't work
> anymore on older, less capable hardware.
>
> Since older compilers (apparently gcc10 / clang11 and older) won't
> recognize -march=3Dx86-64-v2 etc, also addd fallback logic passing
> -mpopcnt and alike explicitly.
>
> Note that in efi_arch_cpu() the filling of 7c0 and 7d0 are forward-
> looking; we only require 7b0, but we need to use cpuid_count() anyway.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Thanks,
Jason

