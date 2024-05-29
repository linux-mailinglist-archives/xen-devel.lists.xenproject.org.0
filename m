Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8458D2E2B
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 09:27:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731520.1137099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCDid-0007mB-1X; Wed, 29 May 2024 07:27:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731520.1137099; Wed, 29 May 2024 07:27:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCDic-0007kJ-Ux; Wed, 29 May 2024 07:27:30 +0000
Received: by outflank-mailman (input) for mailman id 731520;
 Wed, 29 May 2024 07:27:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DI5e=NA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sCDic-0007k0-2N
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 07:27:30 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5d982c0-1d8c-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 09:27:26 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-579cd80450fso1018081a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 00:27:28 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cc519a2sm682287666b.126.2024.05.29.00.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 00:27:26 -0700 (PDT)
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
X-Inumbo-ID: e5d982c0-1d8c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716967647; x=1717572447; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GK9NPz5901Lfdu9S6zdeE71DfiXh9d9/sGktk9K7Rc8=;
        b=HqkrqfJ2s46fxDKXzU4vVvlWhdfg6FP/2DZJgQf3+ft6DKLVFZJydnpKJZtrne9dhq
         BzbxBmB2sygwYu1+q4NtLJ/Pl4vAX6UNi4DSYyohe8R8NLOx9LVvxX22wYneR6yFaE3v
         WzEfceteiuKeBqsQ+i2jEuXcmqJHuP5XdjYFwUMEv45Zwvl1dRyUppV0iPBZlTjygVZP
         R3aaOeSXdkDgtyMPjgnTTTpEDJHApnEihJ0tTPZaMENClpheeBn9nVvizowc2zYh2xI7
         ZHTfzrHirPM8bebmw3eg5GcHb2+GL/plp/kASF/jXZaMOYCuZeI4SoTDgcnZAhwli04L
         NETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716967647; x=1717572447;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GK9NPz5901Lfdu9S6zdeE71DfiXh9d9/sGktk9K7Rc8=;
        b=vwrVOzbvm1aqul7DdWFyP03JTz8m4hTdh7W+IcHVJsf19IsIfXjKl1i5zmr4n2gjlR
         i1gDIHDSLHdjscdTIUZ15qPxRRWSgH6HocpBISyBQu8On/cY85f47w0g0SS0bWCvGiK9
         PAK74CWLMInAl55WOvyRb/iPEUmZ3abdXS/6Fn8b7OkFe4J8Qd4faURl0TZ4CvP1fj0g
         UGD9+F2iTr88969yBjmD55CYtrmTD7uNEZCJCqYUH5qGwN1TJFQC4/ZJTozuoMRsjG/j
         xgwrpBzBfVxTFBxO5QPR1hemzQSOjZ1L6OVTfZM1Zv9BAdx7Z7b5fmnPK/eB+RX46bmc
         oXBg==
X-Forwarded-Encrypted: i=1; AJvYcCULPUcoMnInEQbE/zHxujhXANPPAe+U+ErrvHufTEkZnHxZ+4dTEYz3tsBRzhs+LZCngAj74q9OcDu3cNGpYqnI3xB6pu/7ZrjIEOb5D4I=
X-Gm-Message-State: AOJu0Yz2eWXNnSNOwhoD5jAcfU3vWy9EhCgmmPDxIFvNV15Ueu/wMwnW
	9o8MfoiwGLJeBVpLP9WD+RA99snkoMqVzdNAF6f661+7oAqygMui
X-Google-Smtp-Source: AGHT+IHfmSilipFaS9f1+RngjvaFXxbkzlVr9fESZGYP1kenxfqzP2W9WKNQDsOsP9g84iVIswDhAg==
X-Received: by 2002:a17:906:3e4f:b0:a5c:d4b2:6a44 with SMTP id a640c23a62f3a-a642d3846f7mr89494666b.16.1716967646801;
        Wed, 29 May 2024 00:27:26 -0700 (PDT)
Message-ID: <dbc397df840aedacc00613d25a99db7e82dea950.camel@gmail.com>
Subject: Re: [PATCH for-4.19 0/3] xen: Misc MISRA changes
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich
 <JBeulich@suse.com>,  Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Roberto Bagnara <roberto.bagnara@bugseng.com>, 
 "consulting @ bugseng . com" <consulting@bugseng.com>
Date: Wed, 29 May 2024 09:27:25 +0200
In-Reply-To: <20240521171546.3650664-1-andrew.cooper3@citrix.com>
References: <20240521171546.3650664-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Tue, 2024-05-21 at 18:15 +0100, Andrew Cooper wrote:
> Misc fixes collected during today's call.
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

>=20
> Andrew Cooper (3):
> =C2=A0 xen/lzo: Implement COPY{4,8} using memcpy()
> =C2=A0 xen/x86: Drop useless non-Kconfig CONFIG_* variables
> =C2=A0 xen/x86: Address two misc MISRA 17.7 violations
>=20
> =C2=A0xen/arch/x86/alternative.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 4 ++--
> =C2=A0xen/arch/x86/include/asm/config.h |=C2=A0 4 ----
> =C2=A0xen/arch/x86/nmi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++---
> =C2=A0xen/common/lzo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 ++---------
> =C2=A0xen/include/xen/acpi.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 ---------
> =C2=A0xen/include/xen/watchdog.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 13 +------------
> =C2=A06 files changed, 7 insertions(+), 39 deletions(-)
>=20
>=20
> base-commit: 26b122e3bf8f3921d87312fbf5e7e13872ae92b0


