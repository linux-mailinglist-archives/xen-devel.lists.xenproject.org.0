Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A5C690D72
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 16:46:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492652.762295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ97q-0004EC-NB; Thu, 09 Feb 2023 15:46:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492652.762295; Thu, 09 Feb 2023 15:46:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ97q-0004AR-JM; Thu, 09 Feb 2023 15:46:18 +0000
Received: by outflank-mailman (input) for mailman id 492652;
 Thu, 09 Feb 2023 15:46:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0kKO=6F=tibco.com=clindig@srs-se1.protection.inumbo.net>)
 id 1pQ97o-0002yh-G2
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 15:46:16 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e302cf95-a890-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 16:46:15 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id y1so2226628wru.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Feb 2023 07:46:15 -0800 (PST)
Received: from smtpclient.apple (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a6-20020a056000100600b0029a06f11022sm1488681wrx.112.2023.02.09.07.46.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Feb 2023 07:46:14 -0800 (PST)
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
X-Inumbo-ID: e302cf95-a890-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7QhE9VUwLzOQDNYqMHGbQCK/VEIqlKB/JKpOSEY7sw=;
        b=ac52u488UcMEug01OhTBIqrVKvpqSNM976Vfl5NgGL0+izEh2/tnzVo140TlQYAhZl
         v1MmdvzWq4kr9a4qjWIb+HIZRnwkoLm1SHYuR2vZYYg18qE4gF0QYYQNr32hrtxlSmAO
         n7dYX1JE0Nm1il6OLLFYQrUPAfKdMjEgIM6Ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7QhE9VUwLzOQDNYqMHGbQCK/VEIqlKB/JKpOSEY7sw=;
        b=OL8IEvt0xBy2I7oiDzYUizIQC7e5OYR82T2WcFES/1+dHBr77ElRFqXQycDuRyZx/3
         Ts33gTFM3MglN2mMcLaSNGQD8yq0SzwbbHKGuwYUNs6EVXgHFnS956xBQeiHDgdG3SOk
         Jb47zYqGK8rtPztnyrwcFKE12vElai3Eq0QJRbe+6LriwR7cTYD+95HYHyYv2sY0gjSm
         sfVkKOZDb9nYSRQKil2jrTIUQCNB+jhZdvc/VYtYe1cd8ti1XzfXwXhpHHJ/YUOM6FYH
         DBm1wdMq8upcb2dflWq1yt91D2CS8SNcNt3yz2dYJmb5TwenHjXdgr067pT8M9N2FKJJ
         o5Fw==
X-Gm-Message-State: AO0yUKWpfoeY+X/ncsatlMXRvma4lwO0HkG8uAUTB03a75yb/j4JrtzD
	KFttNqPBi5NQJSQ8iR0HlvCuKw==
X-Google-Smtp-Source: AK7set/SI8GY2juQyzVGn8z43LEFO8ZTJrS/ZgcSkAyOjbUjlNa/j0OgWe0NolSXpj774xHNsiUBAQ==
X-Received: by 2002:adf:fb03:0:b0:2bf:c09e:e7bc with SMTP id c3-20020adffb03000000b002bfc09ee7bcmr12698914wrr.7.1675957575302;
        Thu, 09 Feb 2023 07:46:15 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH] tools/ocaml: Drop libxl bindings
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <20230209154300.22130-1-andrew.cooper3@citrix.com>
Date: Thu, 9 Feb 2023 15:46:13 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 Rob Hoes <Rob.Hoes@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1DCF8B7B-2DF9-4C56-96A2-BBA6BEF749F3@cloud.com>
References: <20230209154300.22130-1-andrew.cooper3@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)



> On 9 Feb 2023, at 15:43, Andrew Cooper <andrew.cooper3@citrix.com> =
wrote:
>=20
> There are significant issues with these bindings, and their companion =
half in
> Xapi was deleted in 2018
>=20
>  =
https://github.com/xapi-project/xen-api/commit/203292ebe0c487d7ae4adb961a6=
d080f4fbe933d
>=20
> owing to there having been no development of these bindings since =
2014.
>=20
> In the unlikely event that we'd want to reinstate them, they'd need =
reworking
> basically from scratch anyway.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Christian Lindig <christian.lindig@citrix.com>
> CC: David Scott <dave@recoil.org>
> CC: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>
> CC: Rob Hoes <Rob.Hoes@citrix.com>
>=20
> I'm unsure whether to drop xentoollog.  They're technically orphaned =
by this
> change, but could be used in principle by the other bindings.
> ---
> tools/ocaml/Makefile                 |    4 -
> tools/ocaml/libs/Makefile            |    2 +-
> tools/ocaml/libs/xl/META.in          |    5 -
> tools/ocaml/libs/xl/Makefile         |   71 --
> tools/ocaml/libs/xl/genwrap.py       |  582 ------------
> tools/ocaml/libs/xl/xenlight.ml.in   |   94 --
> tools/ocaml/libs/xl/xenlight.mli.in  |   93 --
> tools/ocaml/libs/xl/xenlight_stubs.c | 1663 =
----------------------------------
> tools/ocaml/test/Makefile            |   55 --
> tools/ocaml/test/dmesg.ml            |   17 -
> tools/ocaml/test/list_domains.ml     |   26 -
> tools/ocaml/test/raise_exception.ml  |    9 -
> tools/ocaml/test/send_debug_keys.ml  |   13 -
> tools/ocaml/test/xtl.ml              |   39 -
> 14 files changed, 1 insertion(+), 2672 deletions(-)
> delete mode 100644 tools/ocaml/libs/xl/META.in
> delete mode 100644 tools/ocaml/libs/xl/Makefile
> delete mode 100644 tools/ocaml/libs/xl/genwrap.py
> delete mode 100644 tools/ocaml/libs/xl/xenlight.ml.in
> delete mode 100644 tools/ocaml/libs/xl/xenlight.mli.in
> delete mode 100644 tools/ocaml/libs/xl/xenlight_stubs.c
> delete mode 100644 tools/ocaml/test/Makefile
> delete mode 100644 tools/ocaml/test/dmesg.ml
> delete mode 100644 tools/ocaml/test/list_domains.ml
> delete mode 100644 tools/ocaml/test/raise_exception.ml
> delete mode 100644 tools/ocaml/test/send_debug_keys.ml
> delete mode 100644 tools/ocaml/test/xtl.ml
>=20

Acked-by: Christian Lindig <christian.lindig@citrix.com>



