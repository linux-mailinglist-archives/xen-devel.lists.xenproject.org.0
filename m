Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF388546B6
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 10:57:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680332.1058433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raC0r-0006Ke-4f; Wed, 14 Feb 2024 09:57:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680332.1058433; Wed, 14 Feb 2024 09:57:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raC0r-0006IP-1c; Wed, 14 Feb 2024 09:57:09 +0000
Received: by outflank-mailman (input) for mailman id 680332;
 Wed, 14 Feb 2024 09:57:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C2D8=JX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1raC0p-0006IF-2F
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 09:57:07 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68593be0-cb1f-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 10:57:05 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-55ad2a47b7aso2657575a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 01:57:05 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 cx16-20020a05640222b000b00560f3954ffdsm4508159edb.24.2024.02.14.01.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 01:57:04 -0800 (PST)
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
X-Inumbo-ID: 68593be0-cb1f-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707904624; x=1708509424; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8VTXaA9NHvNzxxP4cL3FyLxwNAcpvbKK4kzi8ZQPxLk=;
        b=Q2ObylHOgIRja36gAWAuB0EKxyk6pEZi5AELpGtx0jyp/S/DUPwwjdiVZBG4K0/l63
         FY8Lm86s/ulOxGVROW8BWP3X5hLxJZ7JkLgm/DYZiOHX463TuUmT8bVCkB4h4JVDDImZ
         Ggnu7Db8k3j6Ci22uWxeFLDMVTwrvF52WU85km0NmtEWO9l2MRL2YJtfw8vC1njQj7Tn
         x51tHo2GtcGEg6oBLMUU0qSMUG15w5G6nD+jIERYvXIur2uSS6t11PcVzrD/IZqGUt9n
         yNF6ORV/hguGbINUf+VuC9hxrmF6J6vRM42ardbFkozKpSkDp9zwyu4nqSB51a+zdMkI
         GBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707904624; x=1708509424;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8VTXaA9NHvNzxxP4cL3FyLxwNAcpvbKK4kzi8ZQPxLk=;
        b=U2ZzdnvoejbhqJdjwqTwO4jEIXagrkEbCnTqFKsQ3vl0Ew4FpuAvEC6QplWw8KiaET
         f+5Vn8j2O+uo7WAL+D1nt1UUMl9K7Kqp1TrqepXMUrnLtI1jKbsY3Z1k9xJXb+0ayRRJ
         XMoTU4R+F7jWOIJw9PPPswizjdwyf3ZiPbhSTOphsoXAvqdTrWFRQQWysZF/Ptb3jrhw
         GsynxHfZ6JfCIXM2rFar8UNu6OSAsev8lUHU4NPIfW4NhwtmbWyTeHXkDwNqVi6zf6s2
         2utCTUP9T61UX1hE/yw7Z5PA3iHORY+Tu2piOePvHda0eMFcuboiqMfXY7DLZhxzmqry
         ldbg==
X-Forwarded-Encrypted: i=1; AJvYcCV57mpWJ+8DifRh1KGPgRwsFk7UU2MvYZehQXg9CFNLCqNNfg26X2Wyym2pIGJ+S2xfSmXbW5hJnWpNHmdl1pkTu/EwQK9EBO/fhYP/ZE4=
X-Gm-Message-State: AOJu0Ywpe0Wx7qVgdfvcOtE0GHAbfPcax8qSNICUpW7jw0xY5Rqdq3OB
	L5SLDw2n5dMw50Alx3E/U6z2RSCtV2pQAkuCJg6pyidLo3yIKQjX
X-Google-Smtp-Source: AGHT+IGsJDjTz7uiJjtqrQwNB6Nfloln+A0dP9Lm4d+meBqI6Rf+AGv/WMcK2ufapqkuA/c0frf6hQ==
X-Received: by 2002:a05:6402:68b:b0:562:129d:8dc with SMTP id f11-20020a056402068b00b00562129d08dcmr1490972edy.32.1707904624545;
        Wed, 14 Feb 2024 01:57:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXr6KNC7iQ+a7AzRT4go3zaQi3lkRUotNGMBvMVdU3Mu9WZ6UGCI3JdvZ5ku4KvSXW9Kd4s5O68xazz+UXCvLmRQ6bI9hllbL+iB4BQxr1Xwiqnr9rshMcm/gR5K2E5mLePnz/f/gMJ9rTc6uOnXUEBYO7U0WYHCL3/IuIyrZbZy1Ub6NnI17KlhdMCHt6/wyH8Lm/SQxt8EL8EX8o=
Message-ID: <f1486f3e6e5694dba12518a664a562d0ad907684.camel@gmail.com>
Subject: Re: [PATCH v4 03/30] xen: add support in public/hvm/save.h for PPC
 and RISC-V
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Wed, 14 Feb 2024 10:57:03 +0100
In-Reply-To: <b3141aff-32ad-4e2c-aa2c-a5803924951f@suse.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
	 <c929f784466e1ba57c19663e88f22c598d961709.1707146506.git.oleksii.kurochko@gmail.com>
	 <b3141aff-32ad-4e2c-aa2c-a5803924951f@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-02-12 at 16:05 +0100, Jan Beulich wrote:
> On 05.02.2024 16:32, Oleksii Kurochko wrote:
> > No specific header is needed to include in public/hvm/save.h for
> > PPC and RISC-V for now.
> >=20
> > Code related to PPC was changed based on the comment:
> > https://lore.kernel.org/xen-devel/c2f3280e-2208-496b-a0b5-fda1a2076b3a@=
raptorengineering.com/
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>
>=20
> Albeit I don't see why ...
>=20
> > --- a/xen/include/public/hvm/save.h
> > +++ b/xen/include/public/hvm/save.h
> > @@ -89,8 +89,8 @@ DECLARE_HVM_SAVE_TYPE(END, 0, struct
> > hvm_save_end);
> > =C2=A0#include "../arch-x86/hvm/save.h"
> > =C2=A0#elif defined(__arm__) || defined(__aarch64__)
> > =C2=A0#include "../arch-arm/hvm/save.h"
> > -#elif defined(__powerpc64__)
> > -#include "../arch-ppc.h"
> > +#elif defined(__powerpc64__) || defined(__riscv)
> > +/* no specific header to include */
> > =C2=A0#else
>=20
> ... this isn't simply
>=20
> #elif !defined(__powerpc64__) && !defined(__riscv)
I can change that to your option in the next patch version if the patch
won't be merged now.

~ Oleksii
>=20
> > =C2=A0#error "unsupported architecture"
> > =C2=A0#endif
>=20


