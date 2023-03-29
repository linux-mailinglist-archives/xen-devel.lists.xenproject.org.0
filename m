Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B2F6CD4DA
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 10:39:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516111.799701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phRLF-0007kt-TR; Wed, 29 Mar 2023 08:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516111.799701; Wed, 29 Mar 2023 08:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phRLF-0007jC-PF; Wed, 29 Mar 2023 08:39:37 +0000
Received: by outflank-mailman (input) for mailman id 516111;
 Wed, 29 Mar 2023 08:39:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v9Kw=7V=tibco.com=clindig@srs-se1.protection.inumbo.net>)
 id 1phRLE-0007WO-OF
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 08:39:36 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b602877-ce0d-11ed-b464-930f4c7d94ae;
 Wed, 29 Mar 2023 10:39:35 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso9070857wmo.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 Mar 2023 01:39:35 -0700 (PDT)
Received: from smtpclient.apple (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 s17-20020a7bc391000000b003edd1c44b57sm1414068wmj.27.2023.03.29.01.39.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 Mar 2023 01:39:33 -0700 (PDT)
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
X-Inumbo-ID: 3b602877-ce0d-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1680079174;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=elhpBcVoieKJYr0KR2KfPLbxc1wcwzDWm2bmNPoHAlg=;
        b=i2lrEYaNEsZYF4P8sMgKfqkd1mVO64ml8eBoeRSU5StnX6VFcIW3zGbFhg3JSDYDTv
         +MBCNBlP1CgpFx6mLC8Z6CbvmyEZMSMzuXVfkteLgjkPIO5siP+TLoTXjDQ3pmJKRqPp
         roGa9Z92lqdomRKlcKgjs1WVH+sLFRfc6ZUuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680079174;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=elhpBcVoieKJYr0KR2KfPLbxc1wcwzDWm2bmNPoHAlg=;
        b=U3BbQpJbblBRKvb4tlbSdvM2xl0FbY4p23vUKtmkoFmUkmularrv4AdqsGPgriJ2Zj
         qwaTPs8RpbNBikC1Bs59Ohs1qyMK9vd+UJd/Vc6/7nZKp0bqkBgTPDLcvuo+IB3PmpS/
         rE65KYhoQZcAisDDxlagMsO3z7DbbfA+HrVIiMOb9U2rhz5m1Y0SUFsNR8Rv8Ddo25Hj
         K+PLN5v4kWqkJetGNzQTRhvJWJETuImi22bnN4VyGUxHVkYqUCSu6sxhqRC2vAgW6SUS
         sNQLptiZvQnsog7t0eNj1vdNKpsDMYmz+9gswPQBhmgvaZ79WFI6uh1rkGMc3gIIc6ns
         xUbw==
X-Gm-Message-State: AO0yUKW1AeIxTsC5lDpAoyuaMCP6bus6Nd+X37pm2f5OPgkWGhZMfEpZ
	9oIEykqsfZMy1teWzEMaCoCVpQ==
X-Google-Smtp-Source: AK7set94WvmicPOqKNiT0/wF1YtAp/qIKgjLnqQZ8X6HBppimSAxGvF0aKAntnCT7FSPufC+I0qMbw==
X-Received: by 2002:a1c:7219:0:b0:3eb:9822:f0 with SMTP id n25-20020a1c7219000000b003eb982200f0mr13953235wmc.30.1680079174146;
        Wed, 29 Mar 2023 01:39:34 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH] tools/ocaml/mmap: Drop the len parameter from
 Xenmmap.write
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <20230324202525.3256586-1-andrew.cooper3@citrix.com>
Date: Wed, 29 Mar 2023 09:39:32 +0100
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 Rob Hoes <Rob.Hoes@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <50DA727A-DBA1-4B87-AF7D-4C9D89BB6433@cloud.com>
References: <20230324202525.3256586-1-andrew.cooper3@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)



> On 24 Mar 2023, at 20:25, Andrew Cooper <Andrew.Cooper3@citrix.com> =
wrote:
>=20
> Strings in Ocaml carry their own length.  Absolutely nothing good can =
come
> from having caml_string_length(data) be different to len.
>=20
> Use the appropriate accessor, String_val(), but retain the workaround =
for the
> Ocaml -safe-string constness bug in the same way as we've done =
elsewhere in
> Xen.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Christian Lindig <christian.lindig@citrix.com>
> CC: David Scott <dave@recoil.org>
> CC: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>
> CC: Rob Hoes <Rob.Hoes@citrix.com>
> ---
> tools/ocaml/libs/mmap/xenmmap.ml      |  4 ++--
> tools/ocaml/libs/mmap/xenmmap.mli     |  2 +-
> tools/ocaml/libs/mmap/xenmmap_stubs.c | 11 +++++------
> 3 files changed, 8 insertions(+), 9 deletions(-)

Acked-by: Christian Lindig <christian.lindig@cloud.com>


