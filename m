Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C0C1F1D05
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:14:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKPy-00085I-VT; Mon, 08 Jun 2020 16:14:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=URi8=7V=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1jiKPx-000854-LP
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:14:33 +0000
X-Inumbo-ID: 23a4009a-a9a3-11ea-9b55-bc764e2007e4
Received: from mail-oi1-x241.google.com (unknown [2607:f8b0:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23a4009a-a9a3-11ea-9b55-bc764e2007e4;
 Mon, 08 Jun 2020 16:14:33 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id k4so14255342oik.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/+4QjpT+tPPNmlVcx3DdQ4kyskVFCMtysHbcHTNYe74=;
 b=kS58IrIM5lez6Lj5rtZnhJPFBV+K9srHQMqeFSm7Z+xDcxy5VB1+sG7mD7OgAU3Xlc
 pqtBn6vqhsdiy+5UWO9tA5v94lie87F6qtEtU8Oox/I3ezGt7DNwpHBQTSE1GTX+xmXw
 k3pbE1MrKcyt2zqAeLEsEhQOPlnINXANgWN9+eUAWrJHhjMAubtk/mMoq4Yz4NnaAb+E
 qok7pIPLclNsBFO2iEIhsEcGPn4rTChUJWZlcplpcZ+BJti3DUIyDl7hvfGaH3LbrDMV
 sQ7C65a11jICToH03NJRuGZhykKF9IAflFSwaOXhWoK0BC8Ws5uLBhYv++PjUzYGuCna
 Iofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/+4QjpT+tPPNmlVcx3DdQ4kyskVFCMtysHbcHTNYe74=;
 b=YeM5bH5SQAByVK3v0IGEjYPzGQkfaC3P8AZvKPOw4USFcePcOgY12LJO+3/OY/egad
 o+bERachaVcNoqCa59x2tFnqL5M2KY195E+6CuDgTlrvIVyuzpnXKFhdgy4FGtCNDX20
 KbWad/b5JYsnLJz85ynb39i0m9FvwsXdxDEyABXhKbuZSlj2eYFKyGdtzkcKMjioPJae
 +JGglC6QRsbU0cjyvc2T2P4y0tT94mYi77rlyb0fW83e85eqHtNngGBmIiSo9nCD40Mj
 OZtjxwI2Ywo7kbJyqCYR7j4Mzflr9JG3hu86dYemyw5V4A3WFK5CvsOQcOZU2Rm+M/Tf
 Mh4g==
X-Gm-Message-State: AOAM532zbHBl+dscrCzAA9WF2E7EXA4aX+IcRWBorgSoCXyYMbri2hXS
 tpufbKtkUw17tg5n/JhpBV2FisoySQuhquzuGX6Umw==
X-Google-Smtp-Source: ABdhPJxY837bRoD3+f6ZcPgGbh8vCM84Cl4LR/XbymbYhKCUqj4k8XH49NE9YAo4JBnuJUGXAVD6K2cFlG42HGdNVeI=
X-Received: by 2002:aca:568c:: with SMTP id k134mr107477oib.48.1591632872829; 
 Mon, 08 Jun 2020 09:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200608160044.15531-1-philmd@redhat.com>
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jun 2020 17:14:21 +0100
Message-ID: <CAFEAcA_Ni8=mvyfG=9Aa=ym-ae9HpP8J8B0ekm8=SN2WgZ6_vA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/35] hw/qdev: Warn when using pre-qdev/QOM devices
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Stafford Horne <shorne@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Michael Walle <michael@walle.cc>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, 8 Jun 2020 at 17:00, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> Based on today's IRC chat, this is a trivial RFC series
> to anotate pre-qdev/QOM devices so developers using them
> without knowing they are not QOM'ified yet can realize
> it and convert them if they have time.

What mechanism did you use for identifying non-QOM devices?

thanks
-- PMM

