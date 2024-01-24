Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D37D183A641
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 11:02:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670863.1043930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSa4b-0003Q3-Ab; Wed, 24 Jan 2024 10:01:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670863.1043930; Wed, 24 Jan 2024 10:01:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSa4b-0003Nn-7V; Wed, 24 Jan 2024 10:01:33 +0000
Received: by outflank-mailman (input) for mailman id 670863;
 Wed, 24 Jan 2024 10:01:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k9jB=JC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rSa4Z-0003Nc-LK
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 10:01:31 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bd608d5-ba9f-11ee-98f5-6d05b1d4d9a1;
 Wed, 24 Jan 2024 11:01:30 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a31092083acso75656766b.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 02:01:30 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 vi8-20020a170907d40800b00a3025e05665sm3548615ejc.14.2024.01.24.02.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 02:01:29 -0800 (PST)
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
X-Inumbo-ID: 8bd608d5-ba9f-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706090490; x=1706695290; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RIBzpwOhO2jcdXjQfJL+SPlVolakHfB3XfF35JUQzWA=;
        b=CmzF05OYKn4JM2VrGFQDo+zmCquDX7D3at0yVRJbhRCqxCMfN89TrRZVT1TwkxlNxB
         3vKHPhKK2qTQMK7AxX088w7n440rNuR/h/d1WIsy9jxY3p5ZTKVURlRFVKMMLu+85bV5
         gMCpKSo7CFcJVpQ9UK4m5/Vkd30VdJBfbRD5e0BqYw59F3MDl7jL58bcI5tEbBdh/b3U
         HwWRrzv78MKijqaTTvJrShEszzgvYkuFs0i57mWd1YvuaZF0etvXInQhVZg16pQ1xrGs
         ylkvAw4GeVnc4XoxwPuhWQ57cZlSSynptOuCWpjnMKj8KonxNx0yxyqHJMl2/vsBwqX1
         tQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706090490; x=1706695290;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RIBzpwOhO2jcdXjQfJL+SPlVolakHfB3XfF35JUQzWA=;
        b=XLIUaKWs11RDQiY4wwpy3VWVpueNSiKqva2Ewa7BmCz2aPmrshFSaJY6yBuPf3djbd
         tqLNy6F34gU2xDIxcK68W43dcvnOd56Jq7DED6ZPltHU9fKu8KyYR62/ps2o7vt/365v
         bIlBAznvQyLgKKazCTt54ewyH9fweqLgx8tJ57KosToZh4LJA6ZdTMM6ZIV6DcE4F4aS
         0MYn2DwBQa1UzXpXEBHbFSCkDLcHZw5DHD85fFwiUsbXDvB0N6vtgK1AhrqziWr58N7T
         65K+LCkyb4PwP3NOMwilAy4HPcI/EdxeZKqor8QKG6nrHxEfmJTxfE81GVpKwR2fusNE
         I5bw==
X-Gm-Message-State: AOJu0Yx799Ay0wmMo9di7QoIpxCWfxAn3duTvULvyNwoe5dgGFr72qHE
	pokrihEPiqjJLys3EtPNvnFRAT5BZXlCPIrM2W7wPTHzoy/Mnwz+
X-Google-Smtp-Source: AGHT+IEGt0TFwgj4XDFHXdjriNgEYju8CbXWZlHSv6K1tgKL3Z7Nm6pV9Dx1UxV18zU4H74raqp/Eg==
X-Received: by 2002:a17:907:a708:b0:a2f:1466:a3e4 with SMTP id vw8-20020a170907a70800b00a2f1466a3e4mr868874ejc.25.1706090489605;
        Wed, 24 Jan 2024 02:01:29 -0800 (PST)
Message-ID: <ee23db5131f0be8d146f3c0410f0e471509eece0.camel@gmail.com>
Subject: Re: [PATCH v3 27/34] xen/riscv: define an address of frame table
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Wed, 24 Jan 2024 12:01:28 +0200
In-Reply-To: <b6dd4bff-d40a-47c7-9c18-913ed2bd07c1@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <d0a357e3b9597479b539e88915731b3f15489c04.1703255175.git.oleksii.kurochko@gmail.com>
	 <39837f92-d139-49c3-9e5f-a79dd585f050@suse.com>
	 <2267a8dc4b1be495be65c2d7e22378cd2394829c.camel@gmail.com>
	 <b6dd4bff-d40a-47c7-9c18-913ed2bd07c1@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Wed, 2024-01-24 at 09:07 +0100, Jan Beulich wrote:
> On 23.01.2024 17:50, Oleksii wrote:
> > On Tue, 2024-01-23 at 12:32 +0100, Jan Beulich wrote:
> > > On 22.12.2023 16:13, Oleksii Kurochko wrote:
> > > > @@ -22,25 +30,56 @@
> > > > =C2=A0 *
> > > > =C2=A0 * It means that:
> > > > =C2=A0 *=C2=A0=C2=A0 top VA bits are simply ignored for the purpose=
 of
> > > > translating
> > > > to PA.
> > > > +#endif
> > > > =C2=A0 *
> > > > - *
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > =3D=3D=3D=3D
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > - *=C2=A0=C2=A0=C2=A0 Start addr=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 En=
d addr=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 Size=C2=A0 | Slot=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > > area description
> > > > - *
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > =3D=3D=3D=3D
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > - * FFFFFFFFC0800000 |=C2=A0 FFFFFFFFFFFFFFFF |1016 MB | L2 511=C2=
=A0=C2=A0=C2=A0=C2=A0
> > > > |
> > > > Unused
> > > > - * FFFFFFFFC0600000 |=C2=A0 FFFFFFFFC0800000 |=C2=A0 2 MB=C2=A0 | =
L2 511=C2=A0=C2=A0=C2=A0=C2=A0
> > > > |
> > > > Fixmap
> > > > - * FFFFFFFFC0200000 |=C2=A0 FFFFFFFFC0600000 |=C2=A0 4 MB=C2=A0 | =
L2 511=C2=A0=C2=A0=C2=A0=C2=A0
> > > > |
> > > > FDT
> > > > - * FFFFFFFFC0000000 |=C2=A0 FFFFFFFFC0200000 |=C2=A0 2 MB=C2=A0 | =
L2 511=C2=A0=C2=A0=C2=A0=C2=A0
> > > > |
> > > > Xen
> > > > - *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
1 GB=C2=A0 | L2 510=C2=A0=C2=A0=C2=A0=C2=A0
> > > > |
> > > > Unused
> > > > - * 0000003200000000 |=C2=A0 0000007F80000000 | 309 GB | L2 200-509
> > > > |
> > > > Direct map
> > > > - *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
1 GB=C2=A0 | L2 199=C2=A0=C2=A0=C2=A0=C2=A0
> > > > |
> > > > Unused
> > > > - * 0000003100000000 |=C2=A0 00000031C0000000 |=C2=A0 3 GB=C2=A0 | =
L2 196-198
> > > > |
> > > > Frametable
> > > > - *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
1 GB=C2=A0 | L2 195=C2=A0=C2=A0=C2=A0=C2=A0
> > > > |
> > > > Unused
> > > > - * 0000003080000000 |=C2=A0 00000030C0000000 |=C2=A0 1 GB=C2=A0 | =
L2 194=C2=A0=C2=A0=C2=A0=C2=A0
> > > > |
> > > > VMAP
> > > > - *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 194 GB=
 | L2 0 - 193
> > > > |
> > > > Unused
> > > > - *
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > =3D=3D=3D=3D
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SATP_MODE_SV32=C2=A0=C2=A0 =
| SATP_MODE_SV39=C2=A0=C2=A0 |
> > > > SATP_MODE_SV48=C2=A0=C2=A0 |
> > > > SATP_MODE_SV57
> > > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D|=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D|=3D=3D=3D=3D=3D=3D
> > > > =3D=3D=3D=3D
> > > > =3D=3D=3D=3D=3D=3D=3D
> > > > + * BA0 | FFFFFFFFFFE00000 | FFFFFFFFC0000000 |
> > > > FFFFFF8000000000 |
> > > > FFFF000000000000
> > > > + * BA1 | 0000000019000000 | 0000003200000000 |
> > > > 0000640000000000 |
> > > > 00C8000000000000
> > > > + * BA2 | 0000000018800000 | 0000003100000000 |
> > > > 0000620000000000 |
> > > > 00C4000000000000
> > > > + * BA3 | 0000000018400000 | 0000003080000000 |
> > > > 0000610000000000 |
> > > > 00C2000000000000
> > > > =C2=A0 *
> > > > -#endif
> > > > + *
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > =3D=3D=3D=3D
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > + * Start addr=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 End addr=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 Size=C2=A0 | Root =
PT
> > > > slot |
> > > > Area description
> > > > + *
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > =3D=3D=3D=3D
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > + * BA0 + 0x800000 |=C2=A0 FFFFFFFFFFFFFFFF=C2=A0=C2=A0 |1016 MB |=
=C2=A0=C2=A0=C2=A0=C2=A0
> > > > 511=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> > > > Unused
> > > > + * BA0 + 0x400000 |=C2=A0 BA0 + 0x800000=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 MB=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0
> > > > 511=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> > > > Fixmap
> > > > + * BA0 + 0x200000 |=C2=A0 BA0 + 0x400000=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 4 MB=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0
> > > > 511=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> > > > FDT
> > > > + * BA0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 BA0 + 0x200000=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 MB=C2=A0 |=
=C2=A0=C2=A0=C2=A0=C2=A0
> > > > 511=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> > > > Xen
> > > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
1 GB=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0
> > > > 510=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> > > > Unused
> > > > + * BA1 + 0x000000 |=C2=A0 BA1 + 0x4D80000000 | 309 GB |=C2=A0=C2=
=A0 200-
> > > > 509=C2=A0=C2=A0=C2=A0 |
> > > > Direct map
> > >=20
> > > This definitely can't be right for SV32. Others may be
> > > problematic,
> > > too, like ...
> > >=20
> > > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
1 GB=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0
> > > > 199=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> > > > Unused
> > > > + * BA2 + 0x000000 |=C2=A0 BA2 + 0xC0000000=C2=A0=C2=A0 |=C2=A0 3 G=
B=C2=A0 |=C2=A0=C2=A0 196-
> > > > 198=C2=A0=C2=A0=C2=A0 |
> > > > Frametable
> > >=20
> > > ... this one. Otoh I'd expect both to potentially be much larger
> > > in
> > > SV48 and SV57 modes.
> > Regarding Sv32, it looks to me the only BA0 and End addr at the
> > first
> > line isn't correct as address size is 32.
> >=20
> > Regarding other modes, yes, it should be changed Size column. Also,
> > the
> > size of frame table should be recalculated.
> >=20
> > Do we really need size column?
> >=20
> > Wouldn't it be enough only have PT slot number?
>=20
> Perhaps.
>=20
> > Would it be better to have separate table for each mode?
>=20
> Don't know.
Then I'll play around different ways to display memory layout.

>=20
> > > > +#define VPN_BITS=C2=A0=C2=A0=C2=A0 (9)
> > >=20
> > > This need to move ...
> > >=20
> > > > +#define HYP_PT_ROOT_LEVEL (CONFIG_PAGING_LEVELS - 1)
> > > > +
> > > > +#ifdef CONFIG_RISCV_64
> > >=20
> > > ... here, I think, for not being applicable to SV32?
> > You are right, it is not applicable for Sv32. In case of Sv32, it
> > should be 10.
> > But I am not sure that it is correct only to move this definition
> > as
> > RISCV-64 can also use Sv32. So it looks like VPN_BITS should be
> > "#ifdef
> > RV_STAGE1_MODE =3D=3D Sv32".
>=20
> Can it? The spec talks of SXLEN=3D32 implying SV32, while SXLEN=3D64
> permits
> SV39, SV48, and SV57. No mention of SV32 there.
According to spec it can't, but when I tried that in baremetal it
worked.

Let's stick to the spec, and then it would be better to move VPN_BITS
to #ifdef CONFIG_RISCV_64.

>=20
> > > > +#define SLOTN_ENTRY_BITS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 (HYP_PT_ROOT_LEVEL * VPN_BITS
> > > > +
> > > > PAGE_SHIFT)
> > > > +#define SLOTN(slot)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 (_AT(vaddr_t, slot) <<
> > > > SLOTN_ENTRY_BITS)
> > > > +#define SLOTN_ENTRY_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 SLOTN(1)
> > >=20
> > > Do you have any example of how/where this going to be used?
> > Yes, it will be used to define DIRECTMAP_SIZE:
> > #define DIRECTMAP_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 (SLOTN_ENTRY_SIZE * (509-200))
>=20
> How about
>=20
> #define DIRECTMAP_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (SLOTN(509) - SLOTN(200))
>=20
> instead?
It would be better, I'll drop SLOTN_ENTRY_SIZE then. Thanks.

>=20
> > > > +#define XEN_VIRT_START 0xFFFFFFFFC0000000 /* (_AC(-1, UL) + 1
> > > > -
> > > > GB(1)) */
> > >=20
> > > Won't /* -GB(1) */ do, thus allowing the line to also be padded
> > > such
> > > that
> > > it matches neighboring ones in layout?
> > Could you please clarify what do you mean by padded here? The
> > intention
> > was to show that 1 GB is used for Xen, FDT and fixmap.
>=20
> I'm talking of blank padding in the source file. Note how preceding
> and
> following #define-s blank-pad expansions so they all align. Just this
> one in the middle does not.
I see what you mean now. Thanks.

~ Oleksii
>=20
> > > > +#define FRAMETABLE_VIRT_START=C2=A0=C2=A0 SLOTN(196)
> > > > +#define FRAMETABLE_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 GB(3)
> > > > +#define FRAMETABLE_NR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (FRAMETABLE_SIZE /
> > > > sizeof(*frame_table))
> > > > +#define FRAMETABLE_VIRT_END=C2=A0=C2=A0=C2=A0=C2=A0 (FRAMETABLE_VI=
RT_START +
> > > > FRAMETABLE_SIZE - 1)
> > > > +
> > > > +#define VMAP_VIRT_START=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 SLOTN(194)
> > > > +#define VMAP_VIRT_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 GB(1)
> > > > [...]
> > >=20
> >=20
>=20


