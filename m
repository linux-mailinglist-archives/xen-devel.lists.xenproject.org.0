Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 913FB7A6BFC
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 22:03:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605001.942598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qigvW-0007nf-RU; Tue, 19 Sep 2023 20:02:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605001.942598; Tue, 19 Sep 2023 20:02:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qigvW-0007lY-Ni; Tue, 19 Sep 2023 20:02:30 +0000
Received: by outflank-mailman (input) for mailman id 605001;
 Tue, 19 Sep 2023 20:02:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H+fT=FD=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1qigvV-0007lS-4q
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 20:02:29 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74a9f3d6-5727-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 22:02:26 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-31fe2c8db0dso5349692f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Sep 2023 13:02:27 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-183-084-126.77.183.pool.telefonica.de.
 [77.183.84.126]) by smtp.gmail.com with ESMTPSA id
 r2-20020adfe682000000b0031fe0576460sm6771659wrm.11.2023.09.19.13.02.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Sep 2023 13:02:25 -0700 (PDT)
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
X-Inumbo-ID: 74a9f3d6-5727-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695153746; x=1695758546; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4MvxlwOAuFe9rdoF6HBbC/2fx9cp5v+GhJrBkfXYUs=;
        b=bi+k7NhvZe+OFvBX2SBqo1DrStULjvYr6wny2OkdwYKMS1FKsMb+a5VNMLWyLEJAr0
         Kx8dP0iz87EEQtfFCB9+b+wbHIcd/xViUGFER0OxdMahPtFvUS5XkVNpJnSfZQ2jS+0u
         wLhZ85Ka9jM8AkKI/7c1ToXTvd6MYoxCMgKskd8EnfRhgztna16gdkE9j1g6iyEnY5ap
         XpLB/aPd7PzHHh2Xi1E7v2QIKOow7jjEqVrhen6h9hferwyQGzvjtZdfmC1Px2qGu2TY
         2ZlrMXBqpeGud7c4+vvFrhWzAq/mnkRweqyayElPTGa2eUjjxUKHgVWFQf0H9tiL2gNH
         aosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695153746; x=1695758546;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4MvxlwOAuFe9rdoF6HBbC/2fx9cp5v+GhJrBkfXYUs=;
        b=OBErUgdgJiApXj1o9MKMIPYeV34GnhWI3oIcssZI7gR/2Zy/OakW2tcvR/UT3ugvfR
         ldYHbavTTgnH2esS6rioLwjbBnZr3mNT5gxhaEVE3fkqgMiHaoNNxjcHkNFpv5ne/CLw
         dCr5L/ZpYZQ0gJtAoAUrpkoDFqk+kLXkj3s5n/1nZFS6jxcDLS07xl3TIxdywT8iVHad
         3V29ClI3FNjE2ffY0k3xzy3Vgdzx78V/OwapCukdbYOZql6rug1fiCE2fPKliPYCUJaM
         Wrbw0y/Z554w0VBKS9gNyi6aFN0+asIFK0FdOK/MIn8TCM72GFKd6vNnuF93dVzJEtnH
         mRLA==
X-Gm-Message-State: AOJu0YwMCmvSln2TYtm2C3vn14PWbjLy3Ak0mE78fpanf17+cFgsEgxv
	9gFt+2yh16apiY7e24WIuLM=
X-Google-Smtp-Source: AGHT+IHA3Rcz/q54UukTkrot0NmdG02c+UqNugRafaiM1sEG/EUtJ2udAeBzQyZALWCxc0HNDpODHQ==
X-Received: by 2002:a5d:6a8c:0:b0:31f:f72c:dfa3 with SMTP id s12-20020a5d6a8c000000b0031ff72cdfa3mr512869wru.68.1695153746122;
        Tue, 19 Sep 2023 13:02:26 -0700 (PDT)
Date: Tue, 19 Sep 2023 20:02:19 +0000
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
Message-ID: <B0FF78F4-1193-495B-919C-84A1FF8ADF12@gmail.com>
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

I was finally able to build Xen successfully (without my distribution prov=
iding too recent dependencies that prevent compilation)=2E With 0x7110 adde=
d in the line above I could indeed run a Xen guest with PIIX4=2E Yay!

Now I just need to respin my PIIX consolidation series=2E=2E=2E

Best regards,
Bernhard

>
>Regards,
>Jason

