Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF916D3EA9
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 10:09:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517336.802527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjFFP-0007eX-CJ; Mon, 03 Apr 2023 08:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517336.802527; Mon, 03 Apr 2023 08:09:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjFFP-0007bC-8L; Mon, 03 Apr 2023 08:09:03 +0000
Received: by outflank-mailman (input) for mailman id 517336;
 Mon, 03 Apr 2023 08:09:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qzQh=72=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pjFFN-0007b6-Pk
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 08:09:01 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9b68f38-d1f6-11ed-b464-930f4c7d94ae;
 Mon, 03 Apr 2023 10:08:59 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id eh3so113709905edb.11
 for <xen-devel@lists.xenproject.org>; Mon, 03 Apr 2023 01:08:59 -0700 (PDT)
Received: from [127.0.0.1] ([62.214.191.67]) by smtp.gmail.com with ESMTPSA id
 r30-20020a50aade000000b004f9e6495f94sm4252444edc.50.2023.04.03.01.08.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 01:08:58 -0700 (PDT)
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
X-Inumbo-ID: c9b68f38-d1f6-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680509339;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7gZ4I+1THSU6WybzqtCa4itJGFjNPYCsJ3+ZxZ33L8=;
        b=g/yKJq8X2JpUJmxLRLkfW2Ei4bn+orZIp2D0WXpN1GZ8fDDktL6EaELr85Ejz5DqtK
         M2UYewx344latdwSIgrNpZqcOWCSxZPSz9KPBE08Fjt7braFb+Cn0U59CmirAOW6iLiy
         rC8auNdRyR0+Pgrda8sTcY8swp8rvrDMlM4Ci/izaFEF7vWBVKv6zJaY8Vn/59ZZso0B
         QSad5dETKrLhgqX+jCTxh6+1yopnRJzr94Kcc+ZXunE0a4h2viUpjqtvwpIvJFVIN+6X
         iDVk7Ii3wNE+Pz1f7gL5LFqzch0JlgA2B2dqA+6KAgy0pdh0b+dGQiY65MHJdvvQMfeW
         mjrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680509339;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h7gZ4I+1THSU6WybzqtCa4itJGFjNPYCsJ3+ZxZ33L8=;
        b=J6bRAIy3ehyy04imOdbPeu3Fe/XVzF3KCO3t0ag4JCMtXJLuD7Wokd9uIKqAqXV8sX
         rPK3FrnxZt50kto/1X0XNzzAgPEVA3zUYKei2KwJiywdGmfm9OPTxck9W2frwrzbNTDU
         Mu/r6S8wN39hNEszb0Aqj8Zcge5iBhvsxknFWs4yxtrRJ8nW+sPwu+VbGJv0jJNr6xYQ
         hX7vgn2NYXSjOnT1VtSesxDojVypjaNjFHtg9PGDaW+xf4Gvcl4E2/xJmR7SYx1MXet7
         h4K0ytS0lcgHYEt0ftsFDcK92/I1Py9BQCXlxw2+kHEt7jr907omOBHpfJ2DSe+UWDlI
         S1zg==
X-Gm-Message-State: AAQBX9cDPxIYsi6YOnHou/itiU6rRKwgr7gguXlrRX1b9xmICJ7N6gmZ
	ESCoPkvdb9KC2sqS5ELYgSY=
X-Google-Smtp-Source: AKy350YggZvBQRQXxduHGJx+5C4Cd2Q1/ABqM+BmlNa87irJ7SgtPy2crbAhiUHp2jFkWurGwsvNoA==
X-Received: by 2002:a17:907:8694:b0:947:c221:eb38 with SMTP id qa20-20020a170907869400b00947c221eb38mr11083800ejc.13.1680509339124;
        Mon, 03 Apr 2023 01:08:59 -0700 (PDT)
Date: Mon, 03 Apr 2023 08:08:49 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw@amazon.co.uk>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <eduardo@habkost.net>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Chuck Zmudzinski <brchuckz@aol.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_2/6=5D_hw/isa/piix3=3A_Reuse?= =?US-ASCII?Q?_piix3=5Frealize=28=29_in_piix3=5Fxen=5Frealize=28=29?=
In-Reply-To: <7F45B51F-F1E3-4F04-A46F-4C80509C7195@gmail.com>
References: <20230312120221.99183-1-shentey@gmail.com> <20230312120221.99183-3-shentey@gmail.com> <f52c41f7-e662-4afd-8ac9-ce2c0da2b1be@perard> <7F45B51F-F1E3-4F04-A46F-4C80509C7195@gmail.com>
Message-ID: <B4AB508E-C750-4D5E-BF89-908082A1CD84@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 1=2E April 2023 22:36:45 UTC schrieb Bernhard Beschow <shentey@gmail=2E=
com>:
>
>
>Am 30=2E M=C3=A4rz 2023 13:00:25 UTC schrieb Anthony PERARD <anthony=2Epe=
rard@citrix=2Ecom>:
>>On Sun, Mar 12, 2023 at 01:02:17PM +0100, Bernhard Beschow wrote:
>>> This is a preparational patch for the next one to make the following
>>> more obvious:
>>>=20
>>> First, pci_bus_irqs() is now called twice in case of Xen where the
>>> second call overrides the pci_set_irq_fn with the Xen variant=2E
>>
>>pci_bus_irqs() does allocates pci_bus->irq_count, so the second call in
>>piix3_xen_realize() will leak `pci_bus->irq_count`=2E Could you look if
>>pci_bus_irqs_cleanup() can be called before the second pci_bus_irqs()
>>call, or maybe some other way to avoid the leak?
>
>Thanks for catching this! I'll post a v4=2E

V4 is out=2E

Thanks,
Bernhard

>
>I think the most fool-proof way to fix this is to free irq_count just bef=
ore the assignment=2E pci_bus_irqs_cleanup() would then have to NULL the at=
tribute such that pci_bus_irqs() can be called afterwards=2E
>
>BTW: I tried running qemu-system-x86_64 with PIIX4 rather than PIIX3 as X=
en guest with my pc-piix4 branch without success=2E This branch essentially=
 just provides slightly different PCI IDs for PIIX=2E Does xl or something =
else in Xen check these? If not then this means I'm still missing something=
=2E Under KVM this branch works just fine=2E Any idea?
>
>Thanks,
>Bernhard
>
>>
>>> Second, pci_bus_set_route_irq_fn() is now also called in Xen mode=2E
>>>=20
>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>> Reviewed-by: Michael S=2E Tsirkin <mst@redhat=2Ecom>
>>
>>Beside the leak which I think can happen only once, patch is fine:
>>Reviewed-by: Anthony PERARD <anthony=2Eperard@citrix=2Ecom>
>>
>>Thanks,
>>

