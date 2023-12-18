Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE78816B4B
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 11:39:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655846.1023681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFB1z-00065v-Jj; Mon, 18 Dec 2023 10:39:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655846.1023681; Mon, 18 Dec 2023 10:39:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFB1z-000633-Gm; Mon, 18 Dec 2023 10:39:27 +0000
Received: by outflank-mailman (input) for mailman id 655846;
 Mon, 18 Dec 2023 10:39:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f46f=H5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rFB1x-00061n-Qp
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 10:39:25 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b593f8be-9d91-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 11:39:23 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50bf3efe2cbso2934539e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 02:39:23 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a05651233c200b0050e23d8af76sm706226lfg.137.2023.12.18.02.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 02:39:23 -0800 (PST)
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
X-Inumbo-ID: b593f8be-9d91-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702895963; x=1703500763; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CSVVdtw9ZDDvPQei/DzRiX/UIKO5jqCzMWFdIP0+7cY=;
        b=kX5RVIEWvjApT1Ada3Bdf+cQ6YwH0MjLoSvI9XosIcVD/M2vweReXV2/ruwVLI4zEA
         wH0dZTJCz1fUL0hO6XK2JmOHNerw4f1TiIGQjZHkleILuh9r5pVNUsA4sAmkQWMoiGiq
         YpYutkYN5dC3mqCYHT0if6/a3RlssKMDhfYGjKfwOWtKlKi7Vv8bJnCIoIhbM4gWtiT0
         yO8tgR1ZcU4K9Rnn0V49KMKOVTja6eAyCyQ1QR//0nEQKq2nOPYNj/aQCkebt6LxjXKs
         X0tplKw0duX7xo1/gJ3snHnyOJlSquW5qcUto8UXENyfsXuNA6Vfr5lgJerxKYfFD+4D
         w8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702895963; x=1703500763;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CSVVdtw9ZDDvPQei/DzRiX/UIKO5jqCzMWFdIP0+7cY=;
        b=dM2IHj9grMRJYv2absH7I9pQJgj1tMybN60BC/5uSFGriX6rYd3XrCjNtziA1pv7MQ
         vPm3HGQC7HlkjDuWlMw2ohlVp4k89xrJTuWYMEYI5ndKmZ1PDvsiH9b2SDcp2ahL3vvS
         xMhQLxltdZKXvL8/eraiKErnp19C2tA6OpqVJ+QqyDxh3I6a2gA4YA6PXZfWVLSChptu
         +eHBgaAUUo6FC0dL1v1HaJec2KvgkW7Lv0+HEeXSrzBuDYgyGBYuKOgzLGeXfugsGK3w
         UKRIQLW+Tz46q2Bmp3+xXYT5WGfSc6QnH4uUS8u6ndwWj7RHPlYUOusqxE+mrgLfMp++
         mLJA==
X-Gm-Message-State: AOJu0Yy9sFpshcCFFfScs4vHLE2kroVQ3zHMJ2ePqVeVsZZcD3AdWPl6
	C+6cYkZvggJDr8A1/qAjx20=
X-Google-Smtp-Source: AGHT+IHOiN6wNqnmAMVffnnlI9SH235nv1RDtuB/UvbJOXTWYx95SP/RmYC7EZHQV1EETaj/TzbJew==
X-Received: by 2002:ac2:5f6e:0:b0:50e:34a2:6a93 with SMTP id c14-20020ac25f6e000000b0050e34a26a93mr388725lfc.102.1702895963253;
        Mon, 18 Dec 2023 02:39:23 -0800 (PST)
Message-ID: <2c0ac2c7d21222944052f51c3af497c53f1a1da4.camel@gmail.com>
Subject: Re: [PATCH v2 31/39] xen/riscv: add required things to asm/current.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Mon, 18 Dec 2023 12:39:22 +0200
In-Reply-To: <8d089dbe-a411-4083-9540-d0c95fa183cf@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <b6328d9b5bbb9269066dc17d7c0fcb32fa935b2b.1700761381.git.oleksii.kurochko@gmail.com>
	 <8d089dbe-a411-4083-9540-d0c95fa183cf@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2023-12-14 at 16:55 +0100, Jan Beulich wrote:
> On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/include/asm/current.h
> > +++ b/xen/arch/riscv/include/asm/current.h
> > @@ -3,6 +3,22 @@
> > =C2=A0#ifndef __ASM_CURRENT_H
> > =C2=A0#define __ASM_CURRENT_H
> > =C2=A0
> > +#include <xen/percpu.h>
> > +#include <asm/processor.h>
> > +
> > +#ifndef __ASSEMBLY__
> > +
> > +struct vcpu;
>=20
> I don't think you need this here?
Shouldn't forward declaration be for the case of curr_vcpu declaration
in the next line ?
>=20
> > +/* Which VCPU is "current" on this PCPU. */
> > +DECLARE_PER_CPU(struct vcpu *, curr_vcpu);
> > +
> > +#define current=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 (this_cpu(curr_vcpu))
>=20
> Nit: No need for the extra parentheses.
Thanks.

>=20
> > +#define set_current(vcpu)=C2=A0 do { current =3D (vcpu); } while (0)
> > +#define get_cpu_current(cpu)=C2=A0 (per_cpu(curr_vcpu, cpu))
>=20
> Same here then.
>=20
> > +#define guest_cpu_user_regs() (0)
>=20
> 0 or NULL? Also perhaps better=20
>=20
> #define guest_cpu_user_regs() ({ BUG(); NULL; })
>=20
> until it's properly implemented?
Thanks. I'll use your definition.

>=20
> > @@ -10,4 +26,8 @@
> > =C2=A0=C2=A0=C2=A0=C2=A0 unreachable();=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > =C2=A0} while ( false )
> > =C2=A0
> > +#define get_per_cpu_offset() __per_cpu_offset[get_processor_id()]
>=20
> I'd like to remind you that there's no get_processor_id() anymore.
Yeah, missed that. Thanks.

~ Oleksii

