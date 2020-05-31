Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9352D1E9A41
	for <lists+xen-devel@lfdr.de>; Sun, 31 May 2020 21:50:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfTwx-0006vZ-64; Sun, 31 May 2020 19:48:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IKBM=7N=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1jfTwv-0006vU-Hi
 for xen-devel@lists.xenproject.org; Sun, 31 May 2020 19:48:49 +0000
X-Inumbo-ID: bed1f36a-a377-11ea-81bc-bc764e2007e4
Received: from mail-oi1-x242.google.com (unknown [2607:f8b0:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bed1f36a-a377-11ea-81bc-bc764e2007e4;
 Sun, 31 May 2020 19:48:48 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id r67so7308538oih.0
 for <xen-devel@lists.xenproject.org>; Sun, 31 May 2020 12:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ILaa0c1UMVCHaphm0DdLpskuHaCCEchvE3UnkzWKwTU=;
 b=gh/yOzBvDIyuIfovF4HlMlYod16q8wUChDeH3hG7Vg+iTSHsq68cyaZOlaiNPIf9US
 ygkjSaJT2vmqdUJQIEGlL8gV2MtXWHco1mZIOuO5KiIKQs3G5nr+4EVe214ZZXeEv7t2
 BrAvP75A4QrCdtXWHeTAoOJNw5pvGzbuC2G/kLi877DgbTs+y3Xd2yQqelINQ+/4seCD
 JnV4TjmGBJgF8NzHohYqz7Kn6m0rIYAsc00stNMZ+W0zNNKTer3Nbo9C6s5802r+PVaz
 RvSVWI8S5dnalEPSFqzdJ82hUjtjWbzfyTWqx+oNh8fIgRphvyytYus3c9E04tDW/7Xd
 ywBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ILaa0c1UMVCHaphm0DdLpskuHaCCEchvE3UnkzWKwTU=;
 b=Qr/ZNdZFX2YW4/LImHnwSp7d+irh40hIeHvpOEdo/q0uWqljTD3dNTogn+5GNLELWk
 Ii9RC/tkmdbayIUTlJoJZnaz5OifCo5NEDyGvOK2ETP44BZ2c1Qye5Myj+FADXx8wD0n
 LZapM79Sn4GErpP+d2eJDG/j8kUlL0i6bU4jpl6MliMsCYHfCSQ+bLOuzuTtQN4iWrX7
 Ysa2JDJiLGG1NSghoEH9riEfogvmT2+w8H/5RvXd1VSPQXoD0udqsuof6h9ODR3Wy163
 BPOmR3IDAlG6EFxtfHjAO8YJM7GpXWnvh2YxeQu+mfghi4o2Ra6H6lhXHQnkJv2Yv3Q/
 cG2w==
X-Gm-Message-State: AOAM5305uJEh0P0C5MT7XfautsJntChl4Zfx2HpEOmI/VXRMe03FaQug
 kD+2s2PRn0cHn7KVVXpkdbFTZFYpFaU1z58QiceJpA==
X-Google-Smtp-Source: ABdhPJxKeNN10qTHbz3+NODuq1ECUVF+14p38NKGTSU2wB+Fz1ZTvl0ES71h3qOGWCxhFj3oAr/7710lgqqoniYFZ4Q=
X-Received: by 2002:aca:5451:: with SMTP id i78mr7136005oib.48.1590954528355; 
 Sun, 31 May 2020 12:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200531173814.8734-1-f4bug@amsat.org>
In-Reply-To: <20200531173814.8734-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 31 May 2020 20:48:37 +0100
Message-ID: <CAFEAcA95OLKmG1xNVjAg_KPt3hfN4vT5wvZ6SJbcKk5zdYO_Gg@mail.gmail.com>
Subject: Re: [PATCH 0/8] hw: Fix some incomplete memory region size
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, QEMU Trivial <qemu-trivial@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, 31 May 2020 at 18:38, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> memory_region_set_size() handle the 16 Exabytes limit by
> special-casing the UINT64_MAX value.
> This is not a problem for the 32-bit maximum, 4 GiB, but
> in some places we incorrectly use UINT32_MAX instead of
> 4 GiB, and end up missing 1 byte in the memory region.
>
> This series fixes the cases I encountered.
> Also included few patches while reviewing, I replaced some
> magic values by the IEC binary prefix equivalent.
>
> Regards,
>
> Phil.
>
> Philippe Mathieu-Daud=C3=A9 (8):
>   hw/arm/aspeed: Correct DRAM container region size
>   hw/pci-host/prep: Correct RAVEN bus bridge memory region size
>   hw/pci/pci_bridge: Correct pci_bridge_io memory region size
>   hw/pci/pci_bridge: Use the IEC binary prefix definitions
>   hw/pci-host: Use the IEC binary prefix definitions
>   hw/hppa/dino: Use the IEC binary prefix definitions
>   hw/i386/xen/xen-hvm: Use the IEC binary prefix definitions
>   target/i386/cpu: Use the IEC binary prefix definitions

whole series:
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

