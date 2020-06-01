Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EFA1E9F34
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 09:27:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfepx-0008Mk-UK; Mon, 01 Jun 2020 07:26:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L6P3=7O=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jfepw-0008Mf-Eu
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 07:26:20 +0000
X-Inumbo-ID: 2fba0926-a3d9-11ea-9dbe-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2fba0926-a3d9-11ea-9dbe-bc764e2007e4;
 Mon, 01 Jun 2020 07:26:19 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id k8so6520359edq.4
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 00:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=01TZDSO3dojveQeklKTr8Gf5qjCbs63AIjG69MKbth4=;
 b=SWPOBpENIza2X2ovj4OdRkqXs/ryMDs5pbXsYp0qV9Tqvikk43s4k4FA6pLWSZJcmA
 A8N4bNAUAWEnkUGqT9Ej8DTnxjW1j/5SXBQJ4atyzZ15ku4N4/sDUAUqhewYxv6SZo4O
 PKhADaAdEjTM+vlKXo0giH5kPQwgHstBHaCJFMPtZ1pwEk/KIOvMqO47cUpEKlsTUoSg
 JwkLaoqGqT7ypzkMpQTmqGUSLef1yRYADCZfbTzLuFBanxdvlXgPTx69CNlTvDsgPlrJ
 CqV1QpS1V7AHwmM7U4qwlh7nNbBMKwZVKDgLxeEKTDV+GxQVuhYgfqimCaLJ/BInDC0k
 4ksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=01TZDSO3dojveQeklKTr8Gf5qjCbs63AIjG69MKbth4=;
 b=lErEaNaKO1R5EnYzopmwTRXlgVZK16Ie465FXKDcDuq7SHncxAAIdO1+ebilvMJ2qF
 qZEggwLiUsJyeGzdGxrkipnzoUS3ZXFEjlMxBHWSuhhO8LZgpW8xCBl63mPC6lRpt8r/
 JnDY+QgIpJT0XoWRl62mpEkCLcxI9/XsIPFGkOKusPKExyob+gh+nih69eoFipVZRdsS
 63LXDNzx+gnxDZbJpzModfV2sT9p3BDjlznAR63FoPo+AsDoeZqrNjAD9dieBZYvu9Ln
 WrYvCJo74nER6X9BfC7OatB+siG0wgLRP8AAkjIeuyw5H0qeQm+8UKHXVvLb/gB9Sgo3
 5YbA==
X-Gm-Message-State: AOAM530/SzsFNflk8Bg1i4Tvv2hpl4kbkrtuFP3Yh5y/1yy/J6JGwBLA
 bu8DOiSsZkFxoA9ovdMnY9M=
X-Google-Smtp-Source: ABdhPJyfRslWjZ3RjWM9oZQ++gfLq4y6Y5KnkAMbIiJFd+YvpBjLyYaKNlGBTfvqqWbxOr9NJ7Y0cg==
X-Received: by 2002:aa7:cb94:: with SMTP id r20mr20679771edt.215.1590996378792; 
 Mon, 01 Jun 2020 00:26:18 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id w12sm15278153eds.4.2020.06.01.00.26.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jun 2020 00:26:18 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'Philippe_Mathieu-Daud=C3=A9'?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
References: <20200531173814.8734-1-f4bug@amsat.org>
 <20200531173814.8734-8-f4bug@amsat.org>
In-Reply-To: <20200531173814.8734-8-f4bug@amsat.org>
Subject: RE: [PATCH 7/8] hw/i386/xen/xen-hvm: Use the IEC binary prefix
 definitions
Date: Mon, 1 Jun 2020 08:26:16 +0100
Message-ID: <000001d637e5$f0c4b4f0$d24e1ed0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQK5AEx/dP7iXwJVovNs/KrDX2tj3QLWDH7zpucakaA=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Peter Maydell' <peter.maydell@linaro.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Eduardo Habkost' <ehabkost@redhat.com>,
 "'Michael S. Tsirkin'" <mst@redhat.com>, 'Andrew Jeffery' <andrew@aj.id.au>,
 'Helge Deller' <deller@gmx.de>, 'Joel Stanley' <joel@jms.id.au>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?utf-8?Q?'Herv=C3=A9_Poussineau'?= <hpoussin@reactos.org>,
 =?utf-8?Q?'C=C3=A9dric_Le_Goater'?= <clg@kaod.org>,
 'Marcel Apfelbaum' <marcel.apfelbaum@gmail.com>,
 'Paolo Bonzini' <pbonzini@redhat.com>,
 'Anthony Perard' <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 qemu-ppc@nongnu.org, 'Richard Henderson' <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Philippe Mathieu-Daud=C3=A9 <philippe.mathieu.daude@gmail.com> =
On Behalf Of Philippe Mathieu-Daud=C3=A9
> Sent: 31 May 2020 18:38
> To: qemu-devel@nongnu.org
> Cc: Andrew Jeffery <andrew@aj.id.au>; Helge Deller <deller@gmx.de>; =
Peter Maydell
> <peter.maydell@linaro.org>; Richard Henderson <rth@twiddle.net>; =
Eduardo Habkost
> <ehabkost@redhat.com>; Paul Durrant <paul@xen.org>; Herv=C3=A9 =
Poussineau <hpoussin@reactos.org>; Marcel
> Apfelbaum <marcel.apfelbaum@gmail.com>; =
xen-devel@lists.xenproject.org; Paolo Bonzini
> <pbonzini@redhat.com>; Stefano Stabellini <sstabellini@kernel.org>; =
C=C3=A9dric Le Goater <clg@kaod.org>;
> qemu-trivial@nongnu.org; Joel Stanley <joel@jms.id.au>; =
qemu-arm@nongnu.org; Michael S. Tsirkin
> <mst@redhat.com>; Anthony Perard <anthony.perard@citrix.com>; =
qemu-ppc@nongnu.org; Philippe Mathieu-
> Daud=C3=A9 <f4bug@amsat.org>
> Subject: [PATCH 7/8] hw/i386/xen/xen-hvm: Use the IEC binary prefix =
definitions
>=20
> IEC binary prefixes ease code review: the unit is explicit.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/i386/xen/xen-hvm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> index 82ece6b9e7..679d74e6a3 100644
> --- a/hw/i386/xen/xen-hvm.c
> +++ b/hw/i386/xen/xen-hvm.c
> @@ -9,6 +9,7 @@
>   */
>=20
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>=20
>  #include "cpu.h"
>  #include "hw/pci/pci.h"
> @@ -230,7 +231,7 @@ static void xen_ram_init(PCMachineState *pcms,
>           * Xen does not allocate the memory continuously, it keeps a
>           * hole of the size computed above or passed in.
>           */
> -        block_len =3D (1ULL << 32) + x86ms->above_4g_mem_size;
> +        block_len =3D 4 * GiB + x86ms->above_4g_mem_size;

Not strictly necessary but could we retain the brackets please?

  Paul

>      }
>      memory_region_init_ram(&ram_memory, NULL, "xen.ram", block_len,
>                             &error_fatal);
> --
> 2.21.3



