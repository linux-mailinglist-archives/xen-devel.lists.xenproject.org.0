Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 430D87ACA97
	for <lists+xen-devel@lfdr.de>; Sun, 24 Sep 2023 17:44:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607505.945769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkRG1-0001Yb-M3; Sun, 24 Sep 2023 15:42:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607505.945769; Sun, 24 Sep 2023 15:42:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkRG1-0001Wq-JB; Sun, 24 Sep 2023 15:42:53 +0000
Received: by outflank-mailman (input) for mailman id 607505;
 Sun, 24 Sep 2023 15:42:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f+CP=FI=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1qkRG0-0001Wk-66
 for xen-devel@lists.xenproject.org; Sun, 24 Sep 2023 15:42:52 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0369ba27-5af1-11ee-878a-cb3800f73035;
 Sun, 24 Sep 2023 17:42:48 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9adca291f99so598889266b.2
 for <xen-devel@lists.xenproject.org>; Sun, 24 Sep 2023 08:42:48 -0700 (PDT)
Received: from [127.0.0.1] ([45.156.240.107]) by smtp.gmail.com with ESMTPSA id
 cb8-20020a170906a44800b00988dbbd1f7esm5084289ejb.213.2023.09.24.08.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Sep 2023 08:42:47 -0700 (PDT)
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
X-Inumbo-ID: 0369ba27-5af1-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695570168; x=1696174968; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWBG+YH766oJNTrELCkIiNWNPaRxfIwWYhgiFOEvuKg=;
        b=LWiXaGny7oTe3H4xc5aq/EYXRH7GbAD/tqhZUvXvix+K5CDvD/ugle0iToZKhzNEmy
         wyGnx4EqmCJhCcDqszXG7F2Mt9tpGTESZFstQfJvnKAvA8/xsBhZEkMjB3/qfRn/DAZK
         ubt47HLdqgdN9bNVvAhn/qXpf3mDFp8CS7gcA1TTmmhNwwOCerIZUDHdQ1D89AfEiY3x
         8I34RzW9kuQU/z7tmG1fgUvutPE7qsQQkwPPDiFgGEFX8KtigGC9M2dthiq2VGXDQxqr
         gJrRnCHRFL/of4acRhYLXO96ly3zbgcArCK2MJfxelBfRU82CREoePksUkUFVXPHvhME
         al2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695570168; x=1696174968;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LWBG+YH766oJNTrELCkIiNWNPaRxfIwWYhgiFOEvuKg=;
        b=iXeG3rAsOH3XEeRFvfSALQfsQOztV2jqwk9KF49MLX+f/A5ANiOviHjmYT3bfzv6Fm
         ywhBYd4ZI1cE1Q8oZ7zuXwhpZK/CKckeZipnxpgOWSkzRmWCrSexNP93705CNLuCb28w
         PhYaBzHdOCN7zmczURMwwz4vZtH+dsW+EiiV019m4lJ0FSkp5pcUDyHN8hZ+wRDEt95o
         uFOUxEtS47onRWAd/TcYBq+OcnzR8yZWPglg5YYMlwXWgEscfY3+JgGHJkXyUANwe8AZ
         iKMiplCW53EwofFv9ebvCxcDOgwHSGNvj1hs+nCJ7wdAeN+BcOw6VL0ORhOYiBUqqBfb
         e5Vw==
X-Gm-Message-State: AOJu0YxN/Pv+8M2/wN2s+tlnyA2EYwCo0rz3ej7WuHrMZYehTv4LyD75
	LGys9GmqW7rG5Sqjx/veekw=
X-Google-Smtp-Source: AGHT+IGPnzNMZCBk+2gBWnkiDWgieKr3VB50FHyY5+zKG+3R7UkW+kmw8eSQ6bRZTQpMn944x+9hyw==
X-Received: by 2002:a17:906:3089:b0:9a2:1e03:1572 with SMTP id 9-20020a170906308900b009a21e031572mr4325758ejv.19.1695570168028;
        Sun, 24 Sep 2023 08:42:48 -0700 (PDT)
Date: Sun, 24 Sep 2023 15:41:54 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Chuck Zmudzinski <brchuckz@aol.com>, Jason Andryuk <jandryuk@gmail.com>,
 Anthony PERARD <anthony.perard@citrix.com>
CC: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw@amazon.co.uk>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <eduardo@habkost.net>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_2/6=5D_hw/isa/piix3=3A_Reuse?= =?US-ASCII?Q?_piix3=5Frealize=28=29_in_piix3=5Fxen=5Frealize=28=29?=
In-Reply-To: <6cd8d49f-2b69-471c-84b7-890f31f585b5@aol.com>
References: <20230312120221.99183-1-shentey@gmail.com> <20230312120221.99183-3-shentey@gmail.com> <f52c41f7-e662-4afd-8ac9-ce2c0da2b1be@perard> <7F45B51F-F1E3-4F04-A46F-4C80509C7195@gmail.com> <622b9674-fffd-4634-ac30-d0db3230478e@perard> <CAKf6xpvxf=F52etJ8o3eLQV4JVD5WM57znGoP3ctONRf7uPisA@mail.gmail.com> <B0FF78F4-1193-495B-919C-84A1FF8ADF12@gmail.com> <6cd8d49f-2b69-471c-84b7-890f31f585b5@aol.com>
Message-ID: <2541916E-6DA9-4DB9-A022-CD865B70F453@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 20=2E September 2023 14:44:23 UTC schrieb Chuck Zmudzinski <brchuckz@ao=
l=2Ecom>:
>On 9/19/2023 4:02 PM, Bernhard Beschow wrote:
>>=20
>>=20
>> Am 3=2E April 2023 12:27:14 UTC schrieb Jason Andryuk <jandryuk@gmail=
=2Ecom>:
>>>On Mon, Apr 3, 2023 at 5:33=E2=80=AFAM Anthony PERARD <anthony=2Eperard=
@citrix=2Ecom> wrote:
>>>>
>>>> On Sat, Apr 01, 2023 at 10:36:45PM +0000, Bernhard Beschow wrote:
>>>> >
>>>> >
>>>> > Am 30=2E M=C3=A4rz 2023 13:00:25 UTC schrieb Anthony PERARD <anthon=
y=2Eperard@citrix=2Ecom>:
>>>> > >On Sun, Mar 12, 2023 at 01:02:17PM +0100, Bernhard Beschow wrote:
>>>> > >> This is a preparational patch for the next one to make the follo=
wing
>>>> > >> more obvious:
>>>> > >>
>>>> > >> First, pci_bus_irqs() is now called twice in case of Xen where t=
he
>>>> > >> second call overrides the pci_set_irq_fn with the Xen variant=2E
>>>> > >
>>>> > >pci_bus_irqs() does allocates pci_bus->irq_count, so the second ca=
ll in
>>>> > >piix3_xen_realize() will leak `pci_bus->irq_count`=2E Could you lo=
ok if
>>>> > >pci_bus_irqs_cleanup() can be called before the second pci_bus_irq=
s()
>>>> > >call, or maybe some other way to avoid the leak?
>>>> >
>>>> > Thanks for catching this! I'll post a v4=2E
>>>> >
>>>> > I think the most fool-proof way to fix this is to free irq_count ju=
st before the assignment=2E pci_bus_irqs_cleanup() would then have to NULL =
the attribute such that pci_bus_irqs() can be called afterwards=2E
>>>> >
>>>> > BTW: I tried running qemu-system-x86_64 with PIIX4 rather than PIIX=
3 as Xen guest with my pc-piix4 branch without success=2E This branch essen=
tially just provides slightly different PCI IDs for PIIX=2E Does xl or some=
thing else in Xen check these? If not then this means I'm still missing som=
ething=2E Under KVM this branch works just fine=2E Any idea?
>>>>
>>>> Maybe the ACPI tables provided by libxl needs to be updated=2E
>>>> Or maybe something in the firmware (SeaBIOS or OVMF/OvmfXen) check th=
e
>>>> id (I know that the PCI id of the root bus is checked, but I don't kn=
ow
>>>> if that's the one that's been changed)=2E
>>>
>>>Xen also has hvmloader, which runs before SeaBIOS/OVMF=2E  Looking at
>>>tools/firmware/hvmloader/pci=2Ec, it has
>>>        ASSERT((devfn !=3D PCI_ISA_DEVFN) ||
>>>               ((vendor_id =3D=3D 0x8086) && (device_id =3D=3D 0x7000))=
);
>>>
>>>From QEMU, it looks like 0x7000 is PCI_DEVICE_ID_INTEL_82371SB_0, but
>>>PIIX4 uses 0x7110 (PCI_DEVICE_ID_INTEL_82371AB_0)=2E  Maybe try removin=
g
>>>that check?
>>=20
>> I was finally able to build Xen successfully (without my distribution p=
roviding too recent dependencies that prevent compilation)=2E With 0x7110 a=
dded in the line above I could indeed run a Xen guest with PIIX4=2E Yay!
>>=20
>> Now I just need to respin my PIIX consolidation series=2E=2E=2E
>
>Welcome to the world of running guests on Xen! I am the one who tested yo=
ur earlier patches with Xen guests,

Thanks, I remember for sure!

> and I just wanted to say thanks for keeping me in the loop=2E Please Cc =
me when you post your respin of the PIIX consolidation series since I would=
 like to also test it in my Xen environment=2E I understand I will also nee=
d to patch hvmloader=2Ec on the Xen side to set the correct device id=2E

I'd add your e-mail to the recipients list in my Git then=2E

For those who want a sneak preview of PIIX4 in the PC machine may compile =
https://github=2Ecom/shentok/qemu/tree/piix-consolidate and run `qemu-syste=
m-x86_64 -M pc,south-bridge=3Dpiix4-isa`=2E It should work with all availab=
le virtualization technologies=2E

Best regards,
Bernhard

>
>Kind regards,
>
>Chuck
>
>>=20
>> Best regards,
>> Bernhard
>>=20
>>>
>>>Regards,
>>>Jason
>

