Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4301F1DE1
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:55:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiL32-00041L-Eq; Mon, 08 Jun 2020 16:54:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9p0X=7V=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jiL31-00041E-5r
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:54:55 +0000
X-Inumbo-ID: c699ef4e-a9a8-11ea-ba62-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c699ef4e-a9a8-11ea-ba62-bc764e2007e4;
 Mon, 08 Jun 2020 16:54:54 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id k26so217798wmi.4
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=oNB6pAr4fcRFpfN0vgO3R/SPq1U20RR7okPBo0+FgUE=;
 b=TAfmK0oQkeSGz62TuViy7NuLCNk1BF68l8xbAdU7an1ZC1hVV98IKOoRjmqyaTwVAN
 +in5sBo54K9vZ+PoT5Dju2DDOh9ml4x74mKWFDeR19EFjNT+Klc17086J5unyRp6crm0
 iX59NmiKjPexLajwu2LCbDjom1z4V5Ya7Tr/x9a2tD7WOo4+qq200GMJWH+At1YTWsbM
 +wJH2TSrIVK7d5tnTy4ZVb1OjT049f7NavDysekPgvsZp+8YL5JJqDIx0twx4zpgFLUZ
 BUPmA4rk/i0fKuA7MEpGHm8R9boPmkow/IyBFJZL0415yukucMZFCcEQRzyZerGGqu0H
 ++ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=oNB6pAr4fcRFpfN0vgO3R/SPq1U20RR7okPBo0+FgUE=;
 b=d2wdiJs9VoXWQtCZPJeTT2OhW7s8qupgdHWMbVzCsi9Le6HMCu6hBiKR63dUIbH/8W
 vqMV03NQwfcQda/dHvpBWMh8abSdbaUom75Hq7bxiGt/gJqWvTFBeHeqsleUCkg8Ivzf
 KiUd/d9LJKMwQEmYee6dGaJn26DWZlSpzNZUBs+cxvH5DypYohvLUrcx+4G9hJqVzb1s
 F7vdykIyJDeDANTUOPjHE7TsKpGjyAsY9pRwqZBwhv0S/yGD2R05vAia6QcR/At1uuDF
 Dvx+QLW/djVTfCIZIGhePBI6PuE+hXJpjALjDErqQygy4vC9szNyqVX8sShb4dh+OX8z
 JWuA==
X-Gm-Message-State: AOAM530zYpZuhjV5wCCZzZk7loQRbpeEevyducPPbZjKf+MIrb2FNevi
 hfQJt6nE8ceTZUvNRVbqn5U=
X-Google-Smtp-Source: ABdhPJxYf2eoroXcg65HH/FtSRR8gJU7TD34bYCLjdlEtahbcmy4LN05uTpS+ECevCEPvzvZc0skGg==
X-Received: by 2002:a1c:4e17:: with SMTP id g23mr274089wmh.38.1591635293576;
 Mon, 08 Jun 2020 09:54:53 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id s72sm120153wme.35.2020.06.08.09.54.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jun 2020 09:54:52 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'Philippe_Mathieu-Daud=C3=A9'?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20200608160044.15531-1-philmd@redhat.com>
 <20200608160044.15531-16-philmd@redhat.com>
In-Reply-To: <20200608160044.15531-16-philmd@redhat.com>
Subject: RE: [RFC PATCH 15/35] hw/i386/xen/xen-hvm: Emit warning when old code
 is used
Date: Mon, 8 Jun 2020 17:54:49 +0100
Message-ID: <004b01d63db5$87a83110$96f89330$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQFYw0U0oKWIX6kmOq5Lq1JhZGgcHAJ29BtBqbYsFpA=
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
 'Sagar Karandikar' <sagark@eecs.berkeley.edu>,
 "'Michael S. Tsirkin'" <mst@redhat.com>,
 'Mark Cave-Ayland' <mark.cave-ayland@ilande.co.uk>,
 'Max Filippov' <jcmvbkbc@gmail.com>,
 'Alistair Francis' <Alistair.Francis@wdc.com>,
 'Gerd Hoffmann' <kraxel@redhat.com>,
 "'Edgar E. Iglesias'" <edgar.iglesias@gmail.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Magnus Damm' <magnus.damm@gmail.com>, 'Markus Armbruster' <armbru@redhat.com>,
 'Marcel Apfelbaum' <marcel.apfelbaum@gmail.com>,
 'Anthony Perard' <anthony.perard@citrix.com>,
 =?utf-8?Q?'Marc-Andr=C3=A9_Lureau'?= <marcandre.lureau@redhat.com>,
 'David Gibson' <david@gibson.dropbear.id.au>,
 'Andrzej Zaborowski' <balrogg@gmail.com>,
 'Eduardo Habkost' <ehabkost@redhat.com>,
 'Alistair Francis' <alistair@alistair23.me>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 'Stafford Horne' <shorne@gmail.com>, 'Palmer Dabbelt' <palmer@dabbelt.com>,
 'Richard Henderson' <rth@twiddle.net>,
 "'Daniel P . Berrange'" <berrange@redhat.com>,
 'Thomas Huth' <huth@tuxfamily.org>,
 'Bastian Koppelmann' <kbastian@mail.uni-paderborn.de>,
 'Michael Walle' <michael@walle.cc>, qemu-ppc@nongnu.org,
 'Paolo Bonzini' <pbonzini@redhat.com>, 'Aurelien Jarno' <aurelien@aurel32.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Sent: 08 June 2020 17:00
> To: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org; Markus Armbruster <armbru@redhat.com>; Max =
Filippov <jcmvbkbc@gmail.com>;
> Marcel Apfelbaum <marcel.apfelbaum@gmail.com>; Peter Maydell =
<peter.maydell@linaro.org>; Michael Walle
> <michael@walle.cc>; Edgar E. Iglesias <edgar.iglesias@gmail.com>; =
Aurelien Jarno
> <aurelien@aurel32.net>; Gerd Hoffmann <kraxel@redhat.com>; Stafford =
Horne <shorne@gmail.com>; Andrzej
> Zaborowski <balrogg@gmail.com>; qemu-ppc@nongnu.org; Alistair Francis =
<alistair@alistair23.me>;
> Richard Henderson <rth@twiddle.net>; Mark Cave-Ayland =
<mark.cave-ayland@ilande.co.uk>; Marc-Andr=C3=A9
> Lureau <marcandre.lureau@redhat.com>; Daniel P . Berrange =
<berrange@redhat.com>; qemu-
> riscv@nongnu.org; Michael S. Tsirkin <mst@redhat.com>; =
xen-devel@lists.xenproject.org; Sagar
> Karandikar <sagark@eecs.berkeley.edu>; Anthony Perard =
<anthony.perard@citrix.com>; Palmer Dabbelt
> <palmer@dabbelt.com>; Stefano Stabellini <sstabellini@kernel.org>; =
Paul Durrant <paul@xen.org>; Paolo
> Bonzini <pbonzini@redhat.com>; Alistair Francis =
<Alistair.Francis@wdc.com>; Eduardo Habkost
> <ehabkost@redhat.com>; Thomas Huth <huth@tuxfamily.org>; Bastian =
Koppelmann <kbastian@mail.uni-
> paderborn.de>; David Gibson <david@gibson.dropbear.id.au>; Magnus Damm =
<magnus.damm@gmail.com>;
> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Subject: [RFC PATCH 15/35] hw/i386/xen/xen-hvm: Emit warning when old =
code is used
>=20
> This code hasn't been QOM'ified yet. Warn the user.

"Based on today's IRC chat, this is a trivial RFC series
to anotate pre-qdev/QOM devices so developers using them
without knowing they are not QOM'ified yet can realize
it and convert them if they have time."

So, how should this be coded then? The XenIOState doesn't really qualify =
as a 'device', does it?

  Paul

>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/i386/xen/xen-hvm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> index 82ece6b9e7..a1163b1529 100644
> --- a/hw/i386/xen/xen-hvm.c
> +++ b/hw/i386/xen/xen-hvm.c
> @@ -31,7 +31,7 @@
>  #include "sysemu/xen-mapcache.h"
>  #include "trace.h"
>  #include "exec/address-spaces.h"
> -
> +#include "hw/qdev-deprecated.h"
>  #include <xen/hvm/ioreq.h>
>  #include <xen/hvm/e820.h>
>=20
> @@ -1401,6 +1401,8 @@ void xen_hvm_init(PCMachineState *pcms, =
MemoryRegion **ram_memory)
>      xen_pfn_t ioreq_pfn;
>      XenIOState *state;
>=20
> +    qdev_warn_deprecated_function_used();
> +
>      state =3D g_malloc0(sizeof (XenIOState));
>=20
>      state->xce_handle =3D xenevtchn_open(NULL, 0);
> --
> 2.21.3



