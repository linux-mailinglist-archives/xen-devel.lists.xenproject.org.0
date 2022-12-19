Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C236509D0
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 11:12:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465930.724772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7D8D-0002ki-JF; Mon, 19 Dec 2022 10:12:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465930.724772; Mon, 19 Dec 2022 10:12:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7D8D-0002hz-DW; Mon, 19 Dec 2022 10:12:25 +0000
Received: by outflank-mailman (input) for mailman id 465930;
 Mon, 19 Dec 2022 09:06:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S2HB=4R=tibco.com=etorok@srs-se1.protection.inumbo.net>)
 id 1p7C6J-0002sv-1D
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 09:06:23 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68107f26-7f7c-11ed-8fd4-01056ac49cbb;
 Mon, 19 Dec 2022 10:06:22 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id a17so6756434wrt.11
 for <xen-devel@lists.xenproject.org>; Mon, 19 Dec 2022 01:06:22 -0800 (PST)
Received: from smtpclient.apple (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 x13-20020a5d6b4d000000b00241ce5d605dsm9425932wrw.110.2022.12.19.01.06.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Dec 2022 01:06:21 -0800 (PST)
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
X-Inumbo-ID: 68107f26-7f7c-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCWBF3OEWnvUfBoDUtVk5E5Q1StbfyUlhDtoAnaiiVc=;
        b=kIJh+eYOmDL4M43Yuath/69GPWnBBAkC8gKHWT4SOvKJycj2v2iMAmfROtNFe2Pa0y
         hUvlQO/ilqZWeVXCY36+us+YB2YhYsNcI8IyVpIXcLdFYRlX8OrkT5NwwFdF2QSvQhrk
         2gusNCfF/gYC2f/ayZWrLRC4MGkSTnLxpm9RA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TCWBF3OEWnvUfBoDUtVk5E5Q1StbfyUlhDtoAnaiiVc=;
        b=lgeFdqlY9BB0xvmQorbFe135UBQuW7l/YCbPYPDWJat4+9wSsIQFKmxROlUbyzGONV
         I6s+3VeTBpJOHTsrmzQtWCGJVuU4mSQKd3R24OV8v++YKLRu4mD679mX2ksilkw/wD5b
         axSaXA54uUVnHp4bEZXQH2L/43n1q/cMsHq7VIR0Axmp7UoZXe173F+gTFpobiB0/ntF
         3mj1x1JZTrxTAW78GmIPg0lMY2LvrlC50a5rD7GZX4Mond0NK8xiNkBP0/1J8p2u0mNW
         gmGy8ICBwGQ1ZREzuzwS60Oc2NBggmIG/Cr2h3qnOCM5ylqPoeJRD9+r22G48R3fJdH5
         zU8w==
X-Gm-Message-State: ANoB5pm5/UQ8R/1JUtbKqTFlZBYYUQnVutFfcOsVLqHB7fWtvqG1B4sW
	X9IIkyKgdKY/hbWsnj5gMI8qeQ==
X-Google-Smtp-Source: AA0mqf5tNFToqCvTiC1b9oRy+23umWSsCjrZkrE48uHSFxALXJM8TTKEp3Ej6l4/ySmBLF6OunZoCA==
X-Received: by 2002:a5d:4566:0:b0:242:782c:f397 with SMTP id a6-20020a5d4566000000b00242782cf397mr27806490wrc.25.1671440781315;
        Mon, 19 Dec 2022 01:06:21 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [PATCH v4 01/11] tools/ocaml/libs/{xb, mmap}: use
 Data_abstract_val wrapper
From: Edwin Torok <edwin.torok@cloud.com>
In-Reply-To: <bd686c65-dbf6-4ec0-9094-1c561cd6ee1d@citrix.com>
Date: Mon, 19 Dec 2022 09:06:10 +0000
Cc: Edwin Torok <edvin.torok@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <AA814D6B-617C-4B3E-84F3-71D2A3EB1BC8@cloud.com>
References: <cover.1671214525.git.edwin.torok@cloud.com>
 <4eb53994bcc3548e8da6e8ab9c50acf822b85702.1671214525.git.edwin.torok@cloud.com>
 <bd686c65-dbf6-4ec0-9094-1c561cd6ee1d@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
X-Mailer: Apple Mail (2.3731.200.110.1.12)



> On 16 Dec 2022, at 22:40, Andrew Cooper <Andrew.Cooper3@citrix.com> =
wrote:
>=20
> On 16/12/2022 6:25 pm, Edwin T=C3=B6r=C3=B6k wrote:
>> diff --git a/tools/ocaml/libs/mmap/mmap_stubs.h =
b/tools/ocaml/libs/mmap/mmap_stubs.h
>> index 65e4239890..66f18d4406 100644
>> --- a/tools/ocaml/libs/mmap/mmap_stubs.h
>> +++ b/tools/ocaml/libs/mmap/mmap_stubs.h
>> @@ -30,4 +30,8 @@ struct mmap_interface
>> int len;
>> };
>>=20
>> +#ifndef Data_abstract_val
>> +#define Data_abstract_val(x) ((void*)(value*)(x))
>=20
> ((void *)(x))
>=20
> I take it this has come from the Ocaml headers?  The cast to (value *)
> in the middle is entirely cancelled out.
>=20
> Can be fixed on commit.
>=20


In the OCaml headers it looks like:
+#define Data_abstract_val(v) ((void*) Op_val(v))

where Op_val is:
+#define Op_val(x) ((value *) (x))

However I haven't realized that Op_val has been in OCaml for a long time =
(at least 1995), so we can safely use it, and do this instead:

diff --git a/tools/ocaml/libs/mmap/mmap_stubs.h =
b/tools/ocaml/libs/mmap/mmap_stubs.h
index 65e4239890..6c33f14138 100644
--- a/tools/ocaml/libs/mmap/mmap_stubs.h
+++ b/tools/ocaml/libs/mmap/mmap_stubs.h
@@ -30,4 +30,8 @@ struct mmap_interface
    int len;
 };

+#ifndef Data_abstract_val
+#define Data_abstract_val(v) ((void*) Op_val(v))
+#endif
+
 #endif


There is an updated commit here for convenience: =
https://github.com/edwintorok/xen/commit/9855ed237f3f85ac30972bfd0a601c674=
6ba2353

Best regards,
--Edwin=

