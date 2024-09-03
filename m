Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF149969686
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 10:07:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788764.1198250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slOYr-0007m2-CP; Tue, 03 Sep 2024 08:06:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788764.1198250; Tue, 03 Sep 2024 08:06:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slOYr-0007ja-9L; Tue, 03 Sep 2024 08:06:49 +0000
Received: by outflank-mailman (input) for mailman id 788764;
 Tue, 03 Sep 2024 08:06:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jzbm=QB=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1slOYp-0007jU-Vu
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 08:06:48 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 766b46d4-69cb-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 10:06:45 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2f3f25a1713so59825261fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 01:06:45 -0700 (PDT)
Received: from smtpclient.apple ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a1de447afsm95018566b.84.2024.09.03.01.06.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Sep 2024 01:06:44 -0700 (PDT)
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
X-Inumbo-ID: 766b46d4-69cb-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725350805; x=1725955605; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTkVpv9xlA81sozKDxCqFa3la68A+v/IBlU561+GLV4=;
        b=aiMsf1mOg/jvTZ0mDxPecVsada28k/XpzaujonvoYhHMpfmHckOSDUu5NZBzhKpHa0
         rEsQEAM6xESHrUADVBd+qCLV5e0K75q6w9FBgfthqRVbMJjrsgXqt6WdeRMkcb4OULiu
         nF1wXVT09xrxHNtrW5fns4A8DD47vhN/Mi66I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725350805; x=1725955605;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTkVpv9xlA81sozKDxCqFa3la68A+v/IBlU561+GLV4=;
        b=K4NUybt1sPnlWv9mFBD1If6cAESuJHiQpoyya8odGlJ4o6RJeIG+dIIsrcO4OTOsgy
         CjImEdfvbvTdPsGo9vcn2qxVbyjjsngZZXkAukKZbEcBh05+mqdjOAvtw+mzUwOj1J48
         MmsFFkxHjvzAhF2IhS5922z8hhGPzkyT4bQtlTVYXvkS/DjQHhT+2utnJviyOxtvlOcb
         Q4mEZr5qa/f9QF5mfMUWjUSOiqfvz0q+yiUrtaIUP/VTzcIugSHTQm431jAKfB+2ve/r
         FnqdPBaA7+lytA96FUrfZvT7+fRp0jGQUDckyA9T9M5PEi6NNejbnF00jC7U9sjoWhak
         hYog==
X-Gm-Message-State: AOJu0YwBcM6l+8SuNnPEsbxY6o8JUR2B9lmEFCn14+ZLG6R8ymqv1ld5
	7IBSWxm1fZa7pK2k8C/ZfUZ7Vv28LU+MbF5kstUCfGzsMJRpTcjzKx/i/hXVtAg=
X-Google-Smtp-Source: AGHT+IGh6YgqSNo4oURi7n1h2Xz8zNQNnHFrSNT261CenmP+Qsc/4rh0Spr5UWF6ticrxZKyHY00pg==
X-Received: by 2002:a05:6512:15a0:b0:530:ac0a:15e8 with SMTP id 2adb3069b0e04-53546af3fb5mr8392403e87.11.1725350804661;
        Tue, 03 Sep 2024 01:06:44 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH] tools/ocaml/xc: Drop the GC lock for all hypercalls
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <b6ad709d-f0f3-43cd-bc52-6f0bd658e7d1@citrix.com>
Date: Tue, 3 Sep 2024 09:06:32 +0100
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 Rob Hoes <Rob.Hoes@citrix.com>,
 Andrii Sultanov <andrii.sultanov@cloud.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1875CEC1-B34B-48D2-9E7E-CD75C91431A5@cloud.com>
References: <20240830175309.2854442-1-andrew.cooper3@citrix.com>
 <F8731728-EEDA-4671-973F-3B9AB426A839@cloud.com>
 <b6ad709d-f0f3-43cd-bc52-6f0bd658e7d1@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
X-Mailer: Apple Mail (2.3774.600.62)



> On 2 Sep 2024, at 17:13, Andrew Cooper <Andrew.Cooper3@citrix.com> =
wrote:
>=20
> On 02/09/2024 9:12 am, Christian Lindig wrote:
>>> On 30 Aug 2024, at 18:53, Andrew Cooper <andrew.cooper3@citrix.com> =
wrote:
>>>=20
>>> We should be doing this unilaterally.
>> Acked-by: Christian Lindig <christian.lindig@cloud.com>
>=20
> Thanks.
>=20
>>=20
>> I would prefer to use caml_release_runtime_system(), =
caml_acquire_runtime_system() which I think is a better name for these =
functions. This could be likewise changed globally.
>>=20
>> =
https://ocaml.org/manual/5.2/intfc.html#ss:parallel-execution-long-running=
-c-code
>=20
> This is a mess.
>=20
> Despite existing for 14 years, Ocaml (threads.h) still does this:
>=20
> CAMLextern void caml_enter_blocking_section (void);
> CAMLextern void caml_leave_blocking_section (void);
> #define caml_acquire_runtime_system caml_leave_blocking_section
> #define caml_release_runtime_system caml_enter_blocking_section
>=20
> So the "new" names are implemented in terms of the "old" ones, not the
> other way around.
>=20
> Do you mind if we defer the rename until a later point?  For better or
> worse, Xen uses the old names consistently.

That=E2=80=99s fine.

=E2=80=94 C=

