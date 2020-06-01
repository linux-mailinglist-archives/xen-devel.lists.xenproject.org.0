Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F13C91EA6DC
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 17:25:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfmIw-0003Ni-12; Mon, 01 Jun 2020 15:24:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L6P3=7O=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jfmIu-0003NU-AX
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 15:24:44 +0000
X-Inumbo-ID: 0498edf0-a41c-11ea-8993-bc764e2007e4
Received: from mail-ej1-x644.google.com (unknown [2a00:1450:4864:20::644])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0498edf0-a41c-11ea-8993-bc764e2007e4;
 Mon, 01 Jun 2020 15:24:43 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id o15so9539890ejm.12
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 08:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=sxANU6nbFPCt0EhXkd5ZBvlOX0EDFxgYbGWL2UQmxw8=;
 b=aT3meGZ0q2O+/DvzNa1eI9jDNeDtfDBNnfp+nIxVOlgm3PenOJbYLI7lnI2kRdwtqT
 2ozqN1dNVccR2WJJWJedL5075rx7h3jHQRj9PMCuXauiit5mWhoj/ANlWEOEUYsLa5um
 3q4/399Wca9qZR3JnB1/RuLF56gFuzJfx5BSxpZdN4QqFlIYwhqHimJjYuKpjQnGfpGx
 7qqRQ4b653H3zZcHr8GfNddHEKlaxu/i6fLVM1xLE1O5w3ptajY8S1E8PT/SCxMJLWRj
 LN6mvLaPxW2x3yIW7IML7S4HnFdVOzNJ8gGp1+/Tznw+ys1adjB4yMdRIaZ4kEMGceWh
 0U8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=sxANU6nbFPCt0EhXkd5ZBvlOX0EDFxgYbGWL2UQmxw8=;
 b=ptICqP25wAF1iv/1OYq8Mq6LeRwbAJHr9LSmhx+cfK7tq7KM5IqASABf+ycDDOpuJ2
 NdEeZOqF72pI9QVxQ5E1asYPDsz8nzRUEytCyIz3ahia9hhrSRwhNCphO4C6jAQL5fpt
 iWdIV0iX2s0xrtbOe8I6C4Cz6rt2FxH4GFKttvwqzlU0ziy7RBiBNpoprcxwkxpkW4sr
 3mDvYEQovU1G7vxsQLvHxHSoqDYlOwveOrV2b7+pKsnxrUgxScoLvvcFORSs1hXozIFb
 M86qAS2rFEF5OM+IhIhpAsvPgM1+SDT/Wm+Esg9CyqIP/VPRvaSZ9/UpDyKIO18KNTz4
 1feA==
X-Gm-Message-State: AOAM530cYl+M4WCxuXNESXRb6TEmggrg2XEuWtqH1KnicwgYSwORYOut
 G02NeiGS02z6G7MlxnEsZEI=
X-Google-Smtp-Source: ABdhPJz3eqjQudnsfEu5d5rwNc6qwUF/relN+aNRv0mT/kprvgtDTD/IPYh5uBXdHE8psgE0CfQOaA==
X-Received: by 2002:a17:907:9484:: with SMTP id
 dm4mr21098613ejc.56.1591025082794; 
 Mon, 01 Jun 2020 08:24:42 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id b21sm9163015ejz.28.2020.06.01.08.24.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jun 2020 08:24:42 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'Philippe_Mathieu-Daud=C3=A9'?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
References: <20200601142930.29408-1-f4bug@amsat.org>
 <20200601142930.29408-8-f4bug@amsat.org>
In-Reply-To: <20200601142930.29408-8-f4bug@amsat.org>
Subject: RE: [PATCH v2 7/8] hw/i386/xen/xen-hvm: Use the IEC binary prefix
 definitions
Date: Mon, 1 Jun 2020 16:24:40 +0100
Message-ID: <001601d63828$c5b132a0$511397e0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQF4w9KWcHxvvYD3VioCudSt4ChIBAL7l7qKqWbtDxA=
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
 'Helge Deller' <deller@gmx.de>, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?utf-8?Q?'Herv=C3=A9_Poussineau'?= <hpoussin@reactos.org>,
 'Joel Stanley' <joel@jms.id.au>,
 'Marcel Apfelbaum' <marcel.apfelbaum@gmail.com>,
 'Paolo Bonzini' <pbonzini@redhat.com>,
 'Anthony Perard' <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 'Richard Henderson' <rth@twiddle.net>, qemu-ppc@nongnu.org,
 =?utf-8?Q?'C=C3=A9dric_Le_Goater'?= <clg@kaod.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Philippe Mathieu-Daud=C3=A9 <philippe.mathieu.daude@gmail.com> =
On Behalf Of Philippe Mathieu-Daud=C3=A9
> Sent: 01 June 2020 15:29
> To: qemu-devel@nongnu.org
> Cc: xen-devel@lists.xenproject.org; Anthony Perard =
<anthony.perard@citrix.com>; Paolo Bonzini
> <pbonzini@redhat.com>; Herv=C3=A9 Poussineau <hpoussin@reactos.org>; =
Helge Deller <deller@gmx.de>; qemu-
> arm@nongnu.org; Marcel Apfelbaum <marcel.apfelbaum@gmail.com>; Stefano =
Stabellini
> <sstabellini@kernel.org>; Michael S. Tsirkin <mst@redhat.com>; Eduardo =
Habkost <ehabkost@redhat.com>;
> Paul Durrant <paul@xen.org>; Andrew Jeffery <andrew@aj.id.au>; =
qemu-trivial@nongnu.org; Peter Maydell
> <peter.maydell@linaro.org>; Joel Stanley <joel@jms.id.au>; C=C3=A9dric =
Le Goater <clg@kaod.org>; qemu-
> ppc@nongnu.org; Richard Henderson <rth@twiddle.net>; Philippe =
Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Subject: [PATCH v2 7/8] hw/i386/xen/xen-hvm: Use the IEC binary prefix =
definitions
>=20
> IEC binary prefixes ease code review: the unit is explicit.
>=20
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
>  hw/i386/xen/xen-hvm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> index 82ece6b9e7..94fe5d65e9 100644
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
> +        block_len =3D (4 * GiB) + x86ms->above_4g_mem_size;
>      }
>      memory_region_init_ram(&ram_memory, NULL, "xen.ram", block_len,
>                             &error_fatal);
> --
> 2.21.3



