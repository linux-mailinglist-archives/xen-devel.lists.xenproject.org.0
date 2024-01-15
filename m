Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FE782D614
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 10:35:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667254.1038333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPJNY-0003s8-Jm; Mon, 15 Jan 2024 09:35:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667254.1038333; Mon, 15 Jan 2024 09:35:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPJNY-0003pA-GX; Mon, 15 Jan 2024 09:35:36 +0000
Received: by outflank-mailman (input) for mailman id 667254;
 Mon, 15 Jan 2024 09:35:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TGva=IZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rPJNX-0003p4-Un
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 09:35:35 +0000
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [2607:f8b0:4864:20::1135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e899140-b389-11ee-98f1-6d05b1d4d9a1;
 Mon, 15 Jan 2024 10:35:34 +0100 (CET)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-5f00bef973aso86895887b3.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 01:35:34 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 c127-20020a254e85000000b00dbdb2966f67sm3443921ybb.24.2024.01.15.01.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 01:35:33 -0800 (PST)
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
X-Inumbo-ID: 6e899140-b389-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705311333; x=1705916133; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GUwoC9lz3a3h7jWOBpUmkl75aFlkCggHO0oqdKDd744=;
        b=ewWmUnC+YejoLU2LUmuS655smza0KaN4wEtlS1gA/j3+WjNLwze/qcb3w48A/oxYnZ
         p0MeJ5M3BLgCSmGIxma8ozY4jMzBw6RJgzEc8oRKU2r9BQtO54LFDtWGy2hchs7CcrRp
         5GMoLGB2U7doB8/Xhcjl1pXqV6D5X5fuLtNN8oaec5SsuuqYkWmUvuPP1nFoIxbCtI+J
         6gWka11lMQIuqCLJEcl5+01Ug4JAbJTkjXJ/ZHlbOL7PzDF/X2+4W7y2pwoyp+i8v/qC
         nEzyG0TblAZ26j/h5m4tPQRnp4jkd9VwA1DgI7/mU5eNR4zEkHqkqTG/FGpylGO397Af
         jzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705311333; x=1705916133;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GUwoC9lz3a3h7jWOBpUmkl75aFlkCggHO0oqdKDd744=;
        b=qlilcxlLuISFVe7Qp+5WqH6z0Y4jupbuJMe7Jda0wBCtVuj1Qt0KMKEvCV/xOJa86W
         XHn/8w8gA23M7SCFUb+Ik9y46Ar9uVKUYDsW8IDORDSWyRaExAjAoPtdSwDVx91bsrNS
         X5jqpumy93Tk38E2pvaLnt+x4iVUqUQjKseU5hQjOySHK1MVx44aMCnqJg9Kcnrx5cGe
         d9cGh4JjbmDp80a5zZcgBrXNInby15ICeSAEN3VV+akJmkfGuTtyK6j4HXzHHs1f7Itn
         LGCn95AYO9y2C6iU0Z2GNS4i8GUcr9cHTxZ+f1O59TtzekAN4eL8e9DygJfWP+dnv7lx
         5F6w==
X-Gm-Message-State: AOJu0YysXk7FrK6OQumGvzuPOpUpBNNWEoOFt844gAQCsTAB/WoNMYz6
	dZMhnRXePOFjQEzPBDxw2n0=
X-Google-Smtp-Source: AGHT+IEtgemc4cmX8/kXhFT9hngnkDRavjzf9oHW9NXKTS4JNm1R3DhEG/SbJHxD+XkeIXxhTSig4w==
X-Received: by 2002:a25:ad44:0:b0:dbe:346b:b97 with SMTP id l4-20020a25ad44000000b00dbe346b0b97mr2634780ybe.23.1705311333601;
        Mon, 15 Jan 2024 01:35:33 -0800 (PST)
Message-ID: <fa8ab7da978f87312157fbdcc9c15fa9cc840cb2.camel@gmail.com>
Subject: Re: [PATCH v3 12/34] xen/riscv: introduce smp.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Mon, 15 Jan 2024 11:35:29 +0200
In-Reply-To: <0cf933b6-d8d6-42d0-8a10-f3f7f9daf32d@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <7fd0c7bdc14ac2544a568e66387df21eee892523.1703255175.git.oleksii.kurochko@gmail.com>
	 <0cf933b6-d8d6-42d0-8a10-f3f7f9daf32d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-01-11 at 17:36 +0100, Jan Beulich wrote:
> On 22.12.2023 16:12, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V3:
> > =C2=A0- drop cpu_is_offline() as it was moved to xen/smp.h.
>=20
> Hmm.
>=20
> > =C2=A0- add SPDX.
> > =C2=A0- drop unnessary #ifdef.
> > =C2=A0- fix "No new line"
> > =C2=A0- update the commit message
>=20
> And another hmm.
It was removed word "asm/" before smp.h, but yes it is not correct to
write commit "message" should be "title".
I'll be more precise next time.

>=20
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/smp.h
> > @@ -0,0 +1,28 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ASM_RISCV_SMP_H
> > +#define __ASM_RISCV_SMP_H
> > +
> > +#include <xen/cpumask.h>
> > +#include <xen/percpu.h>
> > +
> > +DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
> > +DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
> > +
> > +#define cpu_is_offline(cpu) unlikely(!cpu_online(cpu))
>=20
> This clearly wasn't dropped (yet).
It looks like it was rebasing issue.
I'll handle that in the next patch version.
Thanks.

~ Oleksii

