Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCF56C1016
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 12:01:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511833.791126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peDGR-0002Bn-MC; Mon, 20 Mar 2023 11:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511833.791126; Mon, 20 Mar 2023 11:01:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peDGR-00028w-Ix; Mon, 20 Mar 2023 11:01:19 +0000
Received: by outflank-mailman (input) for mailman id 511833;
 Mon, 20 Mar 2023 11:01:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hxkN=7M=tibco.com=clindig@srs-se1.protection.inumbo.net>)
 id 1peDGQ-00028q-Cm
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 11:01:18 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8997b0a6-c70e-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 12:01:17 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id w11so6128321wmo.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Mar 2023 04:01:17 -0700 (PDT)
Received: from smtpclient.apple (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 e24-20020a05600c219800b003ed1f111fdesm10060512wme.20.2023.03.20.04.01.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Mar 2023 04:01:16 -0700 (PDT)
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
X-Inumbo-ID: 8997b0a6-c70e-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1679310076;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clniA0LQYdtGLwwi5aAukTIPQdXmGUvBrGBqSVEKmEs=;
        b=A1TL0/nKnCVI75a3oSiS8vn5jBTDISfH/kWeijfA+9lTDKy8roDnjErBS4OKwW1W7f
         boXB6wecQfrbQu0iXIRDZm5nqtkQsQ63aFbrYR9QO5YnMnq0x1t85Vh7wWxHQ0P/c9TP
         52L/L3pgaJ/EkzltxX2sQggFc/w8KN9wZrRrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679310076;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clniA0LQYdtGLwwi5aAukTIPQdXmGUvBrGBqSVEKmEs=;
        b=5/E/HZxB1EggXgRFO9+tfnlu2D+5sQ6NTih96D5C6gMnAmkJxeo4B2OwNhS9GWVym+
         yyeAzNaOspJ7x1doev+tUMJFEHA09PdaqE4zVkn2mNUuMV1qcrgS8VjhAmyNV/9JV48z
         VU2Noc1kjJgAjFO+Ttymf1POJnCSP7m8aEJPIKy66/VWDNSrYRvyPD9ObBWq2ZGkKZqL
         4YrCcq5HcAcFZVKUXws/aIwBcvobKTbCvrieQBYcoEMSn74QNOG5C8l5wEbQ9TRhuN1h
         RWzvEYRt1WkIyxPr1081WjDoDEBfgqj20ZhmoUZ7YWL4F2l2U2RubMBPO+ivKoLBh0A4
         A+sQ==
X-Gm-Message-State: AO0yUKUfBJLnPIPzQUP2/XrwqRq6FswZWEflSrZBTpzU+LMt7G18RQz6
	HPftycTUdGNo8TLXTW6hO90Mmg==
X-Google-Smtp-Source: AK7set8iTIkZ1Pt6iMY4n8Q5FEwxLk0gir4PRpPvMjmmthOULhSI6CdRr3xFuBCas7lmjJaXueev+w==
X-Received: by 2002:a05:600c:4510:b0:3dc:4fd7:31f7 with SMTP id t16-20020a05600c451000b003dc4fd731f7mr30925668wmo.41.1679310076655;
        Mon, 20 Mar 2023 04:01:16 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v3 08/10] tools: add physinfo arch_capabilities handling
 for Arm
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <20230317131949.4031014-9-luca.fancellu@arm.com>
Date: Mon, 20 Mar 2023 11:01:15 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@gmail.com>,
 Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5C1E6204-51FD-4C97-8182-848F30A4A58B@cloud.com>
References: <20230317131949.4031014-1-luca.fancellu@arm.com>
 <20230317131949.4031014-9-luca.fancellu@arm.com>
To: Luca Fancellu <luca.fancellu@arm.com>,
 =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)



> On 17 Mar 2023, at 13:19, Luca Fancellu <luca.fancellu@arm.com> wrote:
>=20
>=20
> 	arch_cap_flags =3D caml_alloc_small(1, arch_cap_flags_tag);
> 	Store_field(arch_cap_flags, 0, arch_cap_list);
> 	Store_field(physinfo, 10, arch_cap_flags);
> +#elif defined(__aarch64__)
> +	Store_field(physinfo, 10, =
Val_int(c_physinfo.arch_capabilities));
> +#else
> +	caml_failwith("Unhandled architecture");
> +#endif
>=20

Is this code overwriting an existing entry that was computed but now =
isn=E2=80=99t used? If so, should the conditional compilation not avoid =
this?

=E2=80=94 C=

