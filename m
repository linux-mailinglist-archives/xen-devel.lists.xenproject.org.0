Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 179DE6D40A3
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 11:33:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517354.802566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjGYc-0003Ue-3M; Mon, 03 Apr 2023 09:32:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517354.802566; Mon, 03 Apr 2023 09:32:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjGYb-0003S4-V9; Mon, 03 Apr 2023 09:32:57 +0000
Received: by outflank-mailman (input) for mailman id 517354;
 Mon, 03 Apr 2023 09:32:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pdzk=72=citrix.com=prvs=450632f3c=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pjGYa-0003Ry-GR
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 09:32:56 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81830ab4-d202-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 11:32:54 +0200 (CEST)
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
X-Inumbo-ID: 81830ab4-d202-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680514374;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=T2DC+/OPrwDbeBS4v/+rJb1xT1/fC0TmvToGkyyaFpk=;
  b=Vb++4ivAJ98oU3zThEQzwRNI1RBC4bZWFUPqilCoAmHkIfa4V0ueCc49
   zoxnZ9GThJVgHAJjTukAqhQ35wWmq4B5jA+I4jPRdsgguSL28P0hiZxnk
   co52g//8YzFfKitjCbZhA6Km6e/QOvbyGYxfmPNwZh1BMrRGf1ntK7DAg
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 106520249
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:l8VL2aqdlaonzn1/kayP8Vs8ttleBmILYhIvgKrLsJaIsI4StFCzt
 garIBmAOPvcZ2OmL4t3YI6x8kIE6sXTz9MyQFFk/CFnEC8Qo5uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weCzyJNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABdKNTOanOKn+oKASfhF1uYpF5jFPKpK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVRrk6VoqwmpXDe1gVr3JDmMcbPe8zMTsJQ9qqdj
 jueoTmjWktGZbRzzxKp+XLrhtfQkRn7e6g1KIGU/+ZYvEaqkzl75Bo+CgLg/KjRZlSFc8lfJ
 koI9zsGoq079UjtRd74NzWhrXuZ+xIRRddUO+s97g6L1+zT+QnxLm0NVDVMbJovrME7QTYjy
 1qhkNbgBDgpu7qQIVqF/LCSvzK0OAAPIGMCbDNCRgwAi/Hvv4QsphvKR8RkFui+iZvoGlnYw
 yiNsTMlhrM7l8MC3Lm85hbAmT3EjpHUVAMx5wjRdmu49A59P9TjYYG0gXDW4etJNoqeZlmIt
 nsDgNTY6u0SZbmVnTGJaPUAGveu/fntGC3RhxtjEocs8xyp+mW/ZsZA7TdmPkBrP80YPzjzb
 yf7vBhNzIVeMHujcel8ZIfZI98x0aHqGNDhV/bVRtlDeJ58cEmA5i4GTVSR1GDkikRqkaw5N
 ZqBasGqJXIbD619y3yxXeh1+acrxyQ7yUvXRJby1RPh1qCRDFafU7wFLVCNfMgw66fCqwLQm
 /5WL8aQwg9TePH/aCLQt4UUKDg3wWMTXM6s7ZYNL6jaf1QgQTt6YxPM/V8/U6sixIdMjefZx
 EGGWV5xmHj1vizpKSzfPxiPd4jTsYZDQWMTZHJ8ZQzzhyh+Me5D/49EKcJpIOBPGPhLiKctE
 qJbI5jo7uFnEGyvxtgLUXXqQGWOnjyPjBnGASeqaSNXk3VIF12QoY+MkucCGUAz4suLWSgW+
 efIOvvzG8ZreuibJJ++hAiT512wp2MBv+l5QlHFJNJeEG21rtgyd3Kp0qFueptVQfkm+td9/
 1/PaSr0WMGX+9NlmDU3rfvsQ3iV/xtWQRMBQjizAUeePijG5GuzqbJ9vBKzVWmFDgvcofzyD
 di5OtmgaJXran4W6dsje1uqpIpij+bSS0hylVg1RiSVNQ3zUtuN4BCuhKFyi0GE/ZcB0SPeZ
 65F0oMy1WmhUC89LGMsGQ==
IronPort-HdrOrdr: A9a23:MrQ0wais0fnonQkgXQQkTigvOnBQXisji2hC6mlwRA09TyXPrb
 HJoB17726XtN91YhpLpTnuAtj5fZqiz+8P3WB8B9qftUzd2FdAT7sSiLcKoQeAJ8SWzIc06U
 4jSdkcNDSXNzRHZK3BjjVQfexO/DCPytHTuc7ui01pRQtpL41m8gtjEx2aCEEzZCQuP+tcKL
 OsovBDrzCjPVAadN6yCHVAf8WrnayzqLvWJSQCDxQkrDSDhTftyJOSKWn+4isj
X-IronPort-AV: E=Sophos;i="5.98,314,1673931600"; 
   d="scan'208";a="106520249"
Date: Mon, 3 Apr 2023 10:32:37 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Bernhard Beschow <shentey@gmail.com>
CC: <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw@amazon.co.uk>,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>, Aurelien Jarno
	<aurelien@aurel32.net>, Eduardo Habkost <eduardo@habkost.net>, Paul Durrant
	<paul@xen.org>, <xen-devel@lists.xenproject.org>, "Michael S. Tsirkin"
	<mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Richard
 Henderson <richard.henderson@linaro.org>, Philippe
 =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Chuck Zmudzinski
	<brchuckz@aol.com>
Subject: Re: [PATCH v3 2/6] hw/isa/piix3: Reuse piix3_realize() in
 piix3_xen_realize()
Message-ID: <622b9674-fffd-4634-ac30-d0db3230478e@perard>
References: <20230312120221.99183-1-shentey@gmail.com>
 <20230312120221.99183-3-shentey@gmail.com>
 <f52c41f7-e662-4afd-8ac9-ce2c0da2b1be@perard>
 <7F45B51F-F1E3-4F04-A46F-4C80509C7195@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7F45B51F-F1E3-4F04-A46F-4C80509C7195@gmail.com>

On Sat, Apr 01, 2023 at 10:36:45PM +0000, Bernhard Beschow wrote:
> 
> 
> Am 30. März 2023 13:00:25 UTC schrieb Anthony PERARD <anthony.perard@citrix.com>:
> >On Sun, Mar 12, 2023 at 01:02:17PM +0100, Bernhard Beschow wrote:
> >> This is a preparational patch for the next one to make the following
> >> more obvious:
> >> 
> >> First, pci_bus_irqs() is now called twice in case of Xen where the
> >> second call overrides the pci_set_irq_fn with the Xen variant.
> >
> >pci_bus_irqs() does allocates pci_bus->irq_count, so the second call in
> >piix3_xen_realize() will leak `pci_bus->irq_count`. Could you look if
> >pci_bus_irqs_cleanup() can be called before the second pci_bus_irqs()
> >call, or maybe some other way to avoid the leak?
> 
> Thanks for catching this! I'll post a v4.
> 
> I think the most fool-proof way to fix this is to free irq_count just before the assignment. pci_bus_irqs_cleanup() would then have to NULL the attribute such that pci_bus_irqs() can be called afterwards.
> 
> BTW: I tried running qemu-system-x86_64 with PIIX4 rather than PIIX3 as Xen guest with my pc-piix4 branch without success. This branch essentially just provides slightly different PCI IDs for PIIX. Does xl or something else in Xen check these? If not then this means I'm still missing something. Under KVM this branch works just fine. Any idea?

Maybe the ACPI tables provided by libxl needs to be updated.
Or maybe something in the firmware (SeaBIOS or OVMF/OvmfXen) check the
id (I know that the PCI id of the root bus is checked, but I don't know
if that's the one that's been changed).

Thanks,

-- 
Anthony PERARD

