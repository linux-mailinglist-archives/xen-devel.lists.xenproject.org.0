Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C83D6D34E0
	for <lists+xen-devel@lfdr.de>; Sun,  2 Apr 2023 00:37:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517210.802325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pijqB-0002I2-2P; Sat, 01 Apr 2023 22:36:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517210.802325; Sat, 01 Apr 2023 22:36:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pijqA-0002GK-Vv; Sat, 01 Apr 2023 22:36:54 +0000
Received: by outflank-mailman (input) for mailman id 517210;
 Sat, 01 Apr 2023 22:36:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fl6z=7Y=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pijqA-0002GE-0L
 for xen-devel@lists.xenproject.org; Sat, 01 Apr 2023 22:36:54 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b27e29a3-d0dd-11ed-85db-49a42c6b2330;
 Sun, 02 Apr 2023 00:36:52 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id ew6so103437853edb.7
 for <xen-devel@lists.xenproject.org>; Sat, 01 Apr 2023 15:36:52 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-013-027-219.77.13.pool.telefonica.de.
 [77.13.27.219]) by smtp.gmail.com with ESMTPSA id
 bq18-20020a056402215200b00501c2a9e16dsm2525599edb.74.2023.04.01.15.36.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Apr 2023 15:36:51 -0700 (PDT)
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
X-Inumbo-ID: b27e29a3-d0dd-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680388611;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3mcXjgUWbrap77dni2Kc4rFFZA3pvAccTjwmsDr8bxU=;
        b=mEteHCJVGbFfX6tRGM1s1+VkgCn+hxBW1ZPMXM8bHo1lDikF/amdVWjUftAXcShM8a
         QSUCelFL9ah0+AXtIsc17IFeWQH3I9hozzG5sbBDkZn+ElBcPC9HegHKvD+3vyTOjND3
         ugVPymLueNtOS+uB1+vL9uTzj6FXIW+y9HEhS2zqCKO91NvGVU76xY7V5+tEJG7NKrZj
         Zvoov0pcWYrLUjrLk3iPcEgyiUbVABU0T3DFZfzBGIhRfiIIfV26WtEYaypcV8qu1J8r
         HEWMBS+85UsEL27hFh76IGPqOkyEEeNSgnno6LLxlQm/ygtzQTIaNvuKHJa8j26iRqFv
         04YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680388611;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3mcXjgUWbrap77dni2Kc4rFFZA3pvAccTjwmsDr8bxU=;
        b=FZYGlUXaMbnLhtyNoFpBG5v/G5swMeapPlWR6PbLVts9a1hmov3qVRv+IoReI8Vkx7
         Q8tvnoZ9QC9wd/Ln/iRoOijaPLxQffyDMb5EWkD8idsAxO1UQIm5wjIAb/GwzU9BmkyW
         joshiyLdPe/xNAdLagXFOWMb91LtnjH1aQ3HnSUTqS1ipA/6m75g/CFwoyklTTNhdOl9
         AeH8Rt197Zf5MVuJ3d8mk79oxIvmmcsPuiOr65CW5QGNZSAXDB4as2MVBgnHnZ4iX1uy
         1xfB1dyvdHJLKGpTS9spajNfGWBUCFSWY3kg/+8PY4WUDx/z+cN6VE8r1SGz00RBR1xF
         owkw==
X-Gm-Message-State: AAQBX9cpuOLnZ+x5M+qWl/75srGa2DR3b0hIEZjZRiVoMw9Bdrd0KVsF
	tGXAIsiX+NH53YX923WuMg4=
X-Google-Smtp-Source: AKy350ZBAQ0NclZYRHIFZo8U4NApWMVwMHMu7y4terrO7HGjAO6fxbeX8o8y5iqHZuYoEBhpoQdpEA==
X-Received: by 2002:a17:907:2077:b0:92f:fbac:69c4 with SMTP id qp23-20020a170907207700b0092ffbac69c4mr30391166ejb.56.1680388611436;
        Sat, 01 Apr 2023 15:36:51 -0700 (PDT)
Date: Sat, 01 Apr 2023 22:36:45 +0000
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
In-Reply-To: <f52c41f7-e662-4afd-8ac9-ce2c0da2b1be@perard>
References: <20230312120221.99183-1-shentey@gmail.com> <20230312120221.99183-3-shentey@gmail.com> <f52c41f7-e662-4afd-8ac9-ce2c0da2b1be@perard>
Message-ID: <7F45B51F-F1E3-4F04-A46F-4C80509C7195@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 30=2E M=C3=A4rz 2023 13:00:25 UTC schrieb Anthony PERARD <anthony=2Eper=
ard@citrix=2Ecom>:
>On Sun, Mar 12, 2023 at 01:02:17PM +0100, Bernhard Beschow wrote:
>> This is a preparational patch for the next one to make the following
>> more obvious:
>>=20
>> First, pci_bus_irqs() is now called twice in case of Xen where the
>> second call overrides the pci_set_irq_fn with the Xen variant=2E
>
>pci_bus_irqs() does allocates pci_bus->irq_count, so the second call in
>piix3_xen_realize() will leak `pci_bus->irq_count`=2E Could you look if
>pci_bus_irqs_cleanup() can be called before the second pci_bus_irqs()
>call, or maybe some other way to avoid the leak?

Thanks for catching this! I'll post a v4=2E

I think the most fool-proof way to fix this is to free irq_count just befo=
re the assignment=2E pci_bus_irqs_cleanup() would then have to NULL the att=
ribute such that pci_bus_irqs() can be called afterwards=2E

BTW: I tried running qemu-system-x86_64 with PIIX4 rather than PIIX3 as Xe=
n guest with my pc-piix4 branch without success=2E This branch essentially =
just provides slightly different PCI IDs for PIIX=2E Does xl or something e=
lse in Xen check these? If not then this means I'm still missing something=
=2E Under KVM this branch works just fine=2E Any idea?

Thanks,
Bernhard

>
>> Second, pci_bus_set_route_irq_fn() is now also called in Xen mode=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> Reviewed-by: Michael S=2E Tsirkin <mst@redhat=2Ecom>
>
>Beside the leak which I think can happen only once, patch is fine:
>Reviewed-by: Anthony PERARD <anthony=2Eperard@citrix=2Ecom>
>
>Thanks,
>

