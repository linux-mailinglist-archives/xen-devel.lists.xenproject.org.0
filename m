Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FF7968170
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 10:12:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787598.1197000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl2Av-0000oC-HC; Mon, 02 Sep 2024 08:12:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787598.1197000; Mon, 02 Sep 2024 08:12:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl2Av-0000lQ-Dy; Mon, 02 Sep 2024 08:12:37 +0000
Received: by outflank-mailman (input) for mailman id 787598;
 Mon, 02 Sep 2024 08:12:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X71w=QA=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1sl2Au-0000lK-H0
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 08:12:36 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bb32fe2-6903-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 10:12:34 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a8682bb5e79so477424066b.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 01:12:34 -0700 (PDT)
Received: from smtpclient.apple ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989022481sm522614766b.86.2024.09.02.01.12.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Sep 2024 01:12:33 -0700 (PDT)
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
X-Inumbo-ID: 1bb32fe2-6903-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725264754; x=1725869554; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/k42lyGBztX+8wjghq1Tp9f+SjTjygX7y6Rsdo6DyI=;
        b=IYZ/tPLZoaZljsdPtyt6wzSz/qWf6jxZrgtdTNaBnD8rSb+8TDyIdLgTHBpvfs5+GR
         Rd/7u1B44sKXDoYmpUr+2G6nesR2dOBJYJJpGMP2QsyNBeZT6d5VkJ7s9mQIjChfB0sA
         Ga/DFAMlwKYVctJHYTgXjkIr9JEvpUqHzOmT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725264754; x=1725869554;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/k42lyGBztX+8wjghq1Tp9f+SjTjygX7y6Rsdo6DyI=;
        b=Gl+bHWdz7ocF54uEPR4yo7qrAH0S1DXwQpiGx2z7xxmQcMWeb0yv9X55Mob4+k0vDm
         Lp/8T4I44IxoLZihvlDFc6RvXcj/uKe6wGLkqTP2gy/dtMA6LWI1NPiSwpnTM04ubhmH
         iGfODynLDSiwSp1IpK213hUrCcFP439L9P8ftmpKAnjwhkGsf61m+JUXW45PiI7Fuxv4
         CioKAYXdW0IVWs7x9rsVeaCkkjDe/x7685/P3jgtyBVOzFkgfqQZuZsEoXaPaWEqeymh
         yo0LbVOuqz2ODpTV6VClTS+KA9031k/mPiv2l5O5HhOU73MV0stR4v2TdYUZE7OST5WG
         c9iw==
X-Gm-Message-State: AOJu0YzUrvA3ooRxxTKEnR64w50DggvaNmh6bSplUWqq77MS2mdk3Oqi
	Szve/V7+h775iIQv/VrHFh3exK0VbjphRJ/1YMTBYuqt7exlcpVwQFN9oOR6aROUwQ/uCF+ZH40
	8
X-Google-Smtp-Source: AGHT+IGgpayS9f/8AzZ1u+hQWy8kWsPDGhc+12t45hU+qW+rbBH9XovASkVk0Wp/0J2h9thuPQvbKA==
X-Received: by 2002:a17:906:99c5:b0:a83:9573:45cc with SMTP id a640c23a62f3a-a89fad7b546mr218752566b.14.1725264753449;
        Mon, 02 Sep 2024 01:12:33 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH] tools/ocaml/xc: Drop the GC lock for all hypercalls
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <20240830175309.2854442-1-andrew.cooper3@citrix.com>
Date: Mon, 2 Sep 2024 09:12:21 +0100
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 Rob Hoes <Rob.Hoes@citrix.com>,
 Andrii Sultanov <andrii.sultanov@cloud.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F8731728-EEDA-4671-973F-3B9AB426A839@cloud.com>
References: <20240830175309.2854442-1-andrew.cooper3@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
X-Mailer: Apple Mail (2.3774.600.62)



> On 30 Aug 2024, at 18:53, Andrew Cooper <andrew.cooper3@citrix.com> =
wrote:
>=20
> We should be doing this unilaterally.

Acked-by: Christian Lindig <christian.lindig@cloud.com>

I would prefer to use caml_release_runtime_system(), =
caml_acquire_runtime_system() which I think is a better name for these =
functions. This could be likewise changed globally.

=
https://ocaml.org/manual/5.2/intfc.html#ss:parallel-execution-long-running=
-c-code

=E2=80=94 C=

