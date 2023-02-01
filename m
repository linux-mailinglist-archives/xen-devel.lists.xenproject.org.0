Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA12686A74
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 16:34:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488320.756351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNF7i-0007fp-ED; Wed, 01 Feb 2023 15:34:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488320.756351; Wed, 01 Feb 2023 15:34:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNF7i-0007de-BG; Wed, 01 Feb 2023 15:34:10 +0000
Received: by outflank-mailman (input) for mailman id 488320;
 Wed, 01 Feb 2023 15:34:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0kk=55=tibco.com=clindig@srs-se1.protection.inumbo.net>)
 id 1pNF7h-0007dI-AA
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 15:34:09 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd0daf19-a245-11ed-b63b-5f92e7d2e73a;
 Wed, 01 Feb 2023 16:34:06 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso1765810wmq.5
 for <xen-devel@lists.xenproject.org>; Wed, 01 Feb 2023 07:34:06 -0800 (PST)
Received: from smtpclient.apple (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f31-20020a05600c491f00b003dc3d9fb09asm2072405wmp.47.2023.02.01.07.34.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 Feb 2023 07:34:06 -0800 (PST)
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
X-Inumbo-ID: dd0daf19-a245-11ed-b63b-5f92e7d2e73a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmru7z6DNxabZ+7LeeevMB28YXFl7Ld5NjLT+3YrBUU=;
        b=F2EHC15HNiw32S7SlueGiSWDfGzcdoyfq6yb34HBZ0hvnmXvab1QWNzE3NAso2FtUY
         EX3svebRlAJ/l7c13EqBoZaMxg2ogVIKYMwAT5Oy4gpOhrl2JhdX9rH3Tld38HWUzIcN
         w8Im6PlqnmJs3I5z6114smK1MyMn2+4Qdwpfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pmru7z6DNxabZ+7LeeevMB28YXFl7Ld5NjLT+3YrBUU=;
        b=WQANcj4rEkHAEr0N0K+lXwP3Ez4Gu9Vgvs07UeK00VzDWwlW7RD+zXLnw07321LGIV
         uHx+xdjyVXRSwUkp5hyewMwx9mX0nboWGAM6ZO4dT+HYIbQYHyqX6fGNfJn6mNqNk78P
         sLWr96bDpQ/zd8BB+EXEV5FpfveUG1wGt3Rs0Kcvr4Ly2XLG4pyG3C4px9llMay/l8Cq
         xUWd85CUscg0cL1nJ3UUlvo47r+N0Kj+DPWZhDUHd4K46x7gVxS31D70JSNCkak40HYA
         M/m4pB9iOzbsD3C66zC0TSjKfdOwWUp/w+bK41SsU3TXr40Y/R8lXJ5Npy17bbeAglnz
         9u4Q==
X-Gm-Message-State: AO0yUKW0qK4fLa4iGV0xGcoVZdfuBkOy8y4fOUVsV9eywN34HlwvEzpU
	wq725gvoXRffR7ssnZyGipUhdQ==
X-Google-Smtp-Source: AK7set/UnIcy0ea0yzVVqftCsucuQhKgEK49RhXevmX/sbrqnHC4Z2Z+yOOOODZUl6L/Vd3mDb2OHA==
X-Received: by 2002:a05:600c:538e:b0:3dc:2c7c:6616 with SMTP id hg14-20020a05600c538e00b003dc2c7c6616mr2332323wmb.21.1675265646535;
        Wed, 01 Feb 2023 07:34:06 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH] tools/ocaml/libs: Fix memory/resource leaks with
 caml_alloc_custom()
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <20230201132924.28711-1-andrew.cooper3@citrix.com>
Date: Wed, 1 Feb 2023 15:34:05 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 Rob Hoes <Rob.Hoes@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3F433EFB-199F-44F8-AE80-C3AFCF5159C0@cloud.com>
References: <20230201132924.28711-1-andrew.cooper3@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)



> On 1 Feb 2023, at 13:29, Andrew Cooper <andrew.cooper3@citrix.com> =
wrote:
>=20
> All caml_alloc_*() functions can throw exceptions, and longjump out of
> context.  If this happens, we leak the xch/xce handle.
>=20
> Reorder the logic to allocate the the Ocaml object first.
>=20
> Fixes: 8b3c06a3e545 ("tools/ocaml/xenctrl: OCaml 5 support, fix =
use-after-free")
> Fixes: 22d5affdf0ce ("tools/ocaml/evtchn: OCaml 5 support, fix =
potential resource leak")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Christian Lindig <christian.lindig@citrix.com>
> CC: David Scott <dave@recoil.org>
> CC: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>
> CC: Rob Hoes <Rob.Hoes@citrix.com>
> ---
> tools/ocaml/libs/eventchn/xeneventchn_stubs.c | 6 ++++--
> tools/ocaml/libs/xc/xenctrl_stubs.c           | 3 ++-
> 2 files changed, 6 insertions(+), 3 deletions(-)

Acked-by: Christian Lindig <christian.lindig@citrix.com>


