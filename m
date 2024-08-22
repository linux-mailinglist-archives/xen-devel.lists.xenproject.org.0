Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E693E95B61C
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2024 15:11:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781859.1191368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh7af-0007kp-JY; Thu, 22 Aug 2024 13:11:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781859.1191368; Thu, 22 Aug 2024 13:11:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh7af-0007if-Gu; Thu, 22 Aug 2024 13:11:01 +0000
Received: by outflank-mailman (input) for mailman id 781859;
 Thu, 22 Aug 2024 13:11:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/1gz=PV=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1sh7ae-0007iX-Ge
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 13:11:00 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8ee7715-6087-11ef-8776-851b0ebba9a2;
 Thu, 22 Aug 2024 15:10:58 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a866cea40c4so99244966b.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2024 06:10:58 -0700 (PDT)
Received: from smtpclient.apple ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f2e6717sm119177366b.96.2024.08.22.06.10.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Aug 2024 06:10:56 -0700 (PDT)
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
X-Inumbo-ID: f8ee7715-6087-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724332258; x=1724937058; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NX6c+hZdDk2eG+QGz3L6kD9k217gPMDQNBtN5K1WUGg=;
        b=Y+rRL/MTx1qm86xPiR/j+27C0S+o1ZYVtQbiF/Ray4d5uUvWlVHH6H2zb7ZvT+DVQH
         SiBN7DGpXEfrJQzdo9pttKMyy7qvj4+1v5YfE5SS369y6Xwf1uHxUSagakG3UdE1hS0+
         wDYSvuaYLw+ntB/JdYI/N/ZfUKZi0Ny67e7+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724332258; x=1724937058;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NX6c+hZdDk2eG+QGz3L6kD9k217gPMDQNBtN5K1WUGg=;
        b=RG1J32wL+w+l1fCmf4f5RKCQvk+7A3mkRF+iiDAChAH9hrHaIz+UBkjjOGqC8NjCpD
         w8ysIq4omP5gjanpq/bamGfqtgkzGM5R5MFdi2sXHPvWXnkQyahpw29wsPdLiU/Xtsyz
         /UAL0bJ2muoJufqyjV4GM1yuAeS42CDHij7RN4fW/5tzukb3q9OJJfQevMKhhYwDVBjZ
         bRYw60YeXmpYCCsZ8rJUBzyGukb/3quaTXRreG5TfpMDvR/UA3FMsoyBULKuC8X/Fbe+
         j8FKVJQYWEiPfwy7ymG3NBJSN51nIqt4PldlNsDogq9n2TJ9nTtz4s/YJCAdW8jU/nK2
         z9Kw==
X-Forwarded-Encrypted: i=1; AJvYcCWqgS3OBWjYV5bTJqg6G6uAP69uXvT2kFMLNF28FqZz9X02USErBZwI3WkXZdWtCcuNicMyKuk3KK8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxRBPgQUAmBsmkY1BXATHI0/ccqsVd9S8W6hRnGhpLT32mKT83g
	Ae0Hp6BSEQ1ZYsHB+Sz81OXbpVV6kaUoTewCJ2T4iOwSjPjiKgqm7BsV+yjKu00=
X-Google-Smtp-Source: AGHT+IGMEV7OUE86LNJoJYqLOH77Z6g1QQLvtpfKVav8ybwqDmsMhtQOu9rQcc6WzS4vuCrzAkbJhQ==
X-Received: by 2002:a17:907:8687:b0:a77:c199:9d01 with SMTP id a640c23a62f3a-a866f27c1femr414788566b.22.1724332257475;
        Thu, 22 Aug 2024 06:10:57 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH v1 1/4] tools/ocaml/common.make: Remove '-cc $(CC)' flag
 from OCAMLOPTFLAGS
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <e184ccf6-47da-443f-9170-dd503d225bf6@citrix.com>
Date: Thu, 22 Aug 2024 14:10:44 +0100
Cc: Andrii Sultanov <andrii.sultanov@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <290CECFD-7925-495D-B297-C281F619857E@cloud.com>
References: <cover.1724314239.git.andrii.sultanov@cloud.com>
 <110f63b76a12e8a9fead09f47319a35229222953.1724314239.git.andrii.sultanov@cloud.com>
 <e184ccf6-47da-443f-9170-dd503d225bf6@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
X-Mailer: Apple Mail (2.3774.600.62)



> On 22 Aug 2024, at 13:25, Andrew Cooper <andrew.cooper3@citrix.com> =
wrote:
>=20
> Are there any ABI/API implication from changing the META file?

The META file is for package/library management in an OCaml environment. =
I don=E2=80=99t see much relevance for it in the code that is part of =
the Xen tree - so see no problem changing the version.

=E2=80=94 C



