Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C38C6D5299
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 22:37:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517602.803192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjQum-00089A-OB; Mon, 03 Apr 2023 20:36:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517602.803192; Mon, 03 Apr 2023 20:36:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjQum-00087R-KW; Mon, 03 Apr 2023 20:36:32 +0000
Received: by outflank-mailman (input) for mailman id 517602;
 Mon, 03 Apr 2023 20:36:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qzQh=72=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pjQuk-00087L-Sh
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 20:36:31 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35dc50ff-d25f-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 22:36:29 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 d11-20020a05600c3acb00b003ef6e6754c5so15162021wms.5
 for <xen-devel@lists.xenproject.org>; Mon, 03 Apr 2023 13:36:28 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-078-055-162-106.78.55.pool.telefonica.de.
 [78.55.162.106]) by smtp.gmail.com with ESMTPSA id
 bg11-20020a05600c3c8b00b003f04057bf1bsm13656303wmb.18.2023.04.03.13.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 13:36:27 -0700 (PDT)
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
X-Inumbo-ID: 35dc50ff-d25f-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680554188;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNpPseAD6nHZ7v+hgrSa5UPOdQF/BU4JEX0k08mqk2E=;
        b=BzrQf8shkKF3ucc8v0yanJ+Y+GcgPtueiVt7X99aCBS4DeY+XPagZA/aqqJeocKnGQ
         vAm80zoeHOANwvXNddMOL7IBIjwphOJFStdydNflih2ttP8KROWr9FklP2PJqrEH9o2d
         rGPbRwTINAhRpF9n42/WlHkMeEI5FWxRKLf2neETIG2bLlXvVmsqSehsrk8w4iLJddGC
         mGuxAFIV6d3eGN5jxxOL+borlmXOai7qhD0ZogU9fxDMZqYbUKUAImap3hlnON7jQTh6
         DZW1lb3DC88qHwebbilU0AuHzQJ4gYOCqKu5vPU2JqMqVY6Y7UOaKS6kJiuRcQHgol5N
         +MUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680554188;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hNpPseAD6nHZ7v+hgrSa5UPOdQF/BU4JEX0k08mqk2E=;
        b=F49eC6NbCmqqZF8W81npFZJoF4NY9L4ObYkudTNvIzJaT0KmkUqPG6thbgACLkmlob
         dfQxTiFznoBzV/2q4GJAUX/OMw/8hgyngzHBjqpLYukcEtlfi/9lqdCvcx3PWv6zoyw/
         VS2XLLNQMVU4/SEtEeoZ4Be15Mozzzjj6Fz5Pvu3MwJFq+R8mYkdVGdn5iznNAw0kRmP
         /agCbF7wQiv6CDYhZbE/phfO24bQIuAlrot0c9fGdATjg2EGpLxL7HhRqb9iVUBq7KUG
         pbbXmdlalsZgR92+wYMy1Tb9FuUISDbnQa6UjQ0MRSkUU8SKnCOmE2+Q9cOq5NAjIAo7
         ojpA==
X-Gm-Message-State: AAQBX9fca5f1MDGgktpp7ziIgXImedy70KyYhivv/V7CcmDj+L9AcT3V
	C5Pr8AsPpCXdGKDO2iyTXe8=
X-Google-Smtp-Source: AKy350bKz/PYk6lgC93kgyq++7qdvvptIvcgqHIM2SizcDYoNqvyp2ruZaSzDSuJzx2fXfh1j29U3A==
X-Received: by 2002:a1c:f208:0:b0:3eb:4150:a476 with SMTP id s8-20020a1cf208000000b003eb4150a476mr497072wmc.0.1680554188103;
        Mon, 03 Apr 2023 13:36:28 -0700 (PDT)
Date: Mon, 03 Apr 2023 20:36:22 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Jason Andryuk <jandryuk@gmail.com>,
 Anthony PERARD <anthony.perard@citrix.com>
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
In-Reply-To: <CAKf6xpvxf=F52etJ8o3eLQV4JVD5WM57znGoP3ctONRf7uPisA@mail.gmail.com>
References: <20230312120221.99183-1-shentey@gmail.com> <20230312120221.99183-3-shentey@gmail.com> <f52c41f7-e662-4afd-8ac9-ce2c0da2b1be@perard> <7F45B51F-F1E3-4F04-A46F-4C80509C7195@gmail.com> <622b9674-fffd-4634-ac30-d0db3230478e@perard> <CAKf6xpvxf=F52etJ8o3eLQV4JVD5WM57znGoP3ctONRf7uPisA@mail.gmail.com>
Message-ID: <3D51F8CC-6909-4777-9C43-5E277650331C@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 3=2E April 2023 12:27:14 UTC schrieb Jason Andryuk <jandryuk@gmail=2Eco=
m>:
>On Mon, Apr 3, 2023 at 5:33=E2=80=AFAM Anthony PERARD <anthony=2Eperard@c=
itrix=2Ecom> wrote:
>>
>> On Sat, Apr 01, 2023 at 10:36:45PM +0000, Bernhard Beschow wrote:
>> >
>> >
>> > Am 30=2E M=C3=A4rz 2023 13:00:25 UTC schrieb Anthony PERARD <anthony=
=2Eperard@citrix=2Ecom>:
>> > >On Sun, Mar 12, 2023 at 01:02:17PM +0100, Bernhard Beschow wrote:
>> > >> This is a preparational patch for the next one to make the followi=
ng
>> > >> more obvious:
>> > >>
>> > >> First, pci_bus_irqs() is now called twice in case of Xen where the
>> > >> second call overrides the pci_set_irq_fn with the Xen variant=2E
>> > >
>> > >pci_bus_irqs() does allocates pci_bus->irq_count, so the second call=
 in
>> > >piix3_xen_realize() will leak `pci_bus->irq_count`=2E Could you look=
 if
>> > >pci_bus_irqs_cleanup() can be called before the second pci_bus_irqs(=
)
>> > >call, or maybe some other way to avoid the leak?
>> >
>> > Thanks for catching this! I'll post a v4=2E
>> >
>> > I think the most fool-proof way to fix this is to free irq_count just=
 before the assignment=2E pci_bus_irqs_cleanup() would then have to NULL th=
e attribute such that pci_bus_irqs() can be called afterwards=2E
>> >
>> > BTW: I tried running qemu-system-x86_64 with PIIX4 rather than PIIX3 =
as Xen guest with my pc-piix4 branch without success=2E This branch essenti=
ally just provides slightly different PCI IDs for PIIX=2E Does xl or someth=
ing else in Xen check these? If not then this means I'm still missing somet=
hing=2E Under KVM this branch works just fine=2E Any idea?
>>
>> Maybe the ACPI tables provided by libxl needs to be updated=2E
>> Or maybe something in the firmware (SeaBIOS or OVMF/OvmfXen) check the
>> id (I know that the PCI id of the root bus is checked, but I don't know
>> if that's the one that's been changed)=2E
>
>Xen also has hvmloader, which runs before SeaBIOS/OVMF=2E  Looking at
>tools/firmware/hvmloader/pci=2Ec, it has
>        ASSERT((devfn !=3D PCI_ISA_DEVFN) ||
>               ((vendor_id =3D=3D 0x8086) && (device_id =3D=3D 0x7000)));
>
>From QEMU, it looks like 0x7000 is PCI_DEVICE_ID_INTEL_82371SB_0, but
>PIIX4 uses 0x7110 (PCI_DEVICE_ID_INTEL_82371AB_0)=2E  Maybe try removing
>that check?

Sounds promising indeed=2E I'll give it a try!

Regards,
Bernhard

>
>Regards,
>Jason

