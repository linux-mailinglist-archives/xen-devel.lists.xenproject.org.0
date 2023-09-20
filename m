Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBED7A8776
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 16:45:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605778.943366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiyRS-0005e2-CQ; Wed, 20 Sep 2023 14:44:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605778.943366; Wed, 20 Sep 2023 14:44:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiyRS-0005bZ-96; Wed, 20 Sep 2023 14:44:38 +0000
Received: by outflank-mailman (input) for mailman id 605778;
 Wed, 20 Sep 2023 14:44:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFvK=FE=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1qiyRR-0005bT-5I
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 14:44:37 +0000
Received: from sonic310-21.consmr.mail.gq1.yahoo.com
 (sonic310-21.consmr.mail.gq1.yahoo.com [98.137.69.147])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3522054f-57c4-11ee-9b0d-b553b5be7939;
 Wed, 20 Sep 2023 16:44:32 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.gq1.yahoo.com with HTTP; Wed, 20 Sep 2023 14:44:30 +0000
Received: by hermes--production-ne1-6cbd549489-84thk (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 25f55bca556ea028f0a42f54df88281a; 
 Wed, 20 Sep 2023 14:44:25 +0000 (UTC)
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
X-Inumbo-ID: 3522054f-57c4-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1695221070; bh=XijLq0YSqnbK496MfIb79/fWIh7B6yNruOyf40BE6qc=; h=Date:From:Subject:To:Cc:References:In-Reply-To:From:Subject:Reply-To; b=T6Nuia+7IYdO/N2oL/i18bxl8UOwMZVVLrgCCjw9cbNSwqVvGU3phLdUVT6lvZkxGJm90IXjaAFSRMB+/of4Y/tVLajBvwFJmWZ8wQm45ZlKAIeUb2clwB4B6YBFpfDoUNjvF0rcKHAAUZ3ja0l5dMUH8jIwvWGddOOQiNMQoeFfkc356yvb9GUwbBC6ic0tL8vjUkupUpes/RnPgiV6BoFz6ZtelK6bVNtOCQhUi3PdGvrXmz/Q1heajgF+KyB3qmcF8ZOVRTvUFAv30/q08Gs/BLhgbZ9dE1G0xs4R0oB3J1oFFWlpUWg5J6K5aW6U/z86jfpNunIgcl9/clhzWg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1695221070; bh=4c4lC1v68u+I+Wt7Cuj9L2lAfhigVlQETv6LsH3QlSV=; h=X-Sonic-MF:Date:From:Subject:To:From:Subject; b=gS2jmeS/FgPGusT0zwC/Dh59Ardkfg0Kr5uEfU499BFGo30ntSNSZQW8p3uW0ZYGyawxpEUSq9oucjbABdOgh0jFhPsGDA3sDeMlXP3o/ser+yIgaxxHmpxC3UClhdigcyZjTRfrHpsm71GHX7B1WbKB7p2pC6w349Y9fp/Mj6mC1Brj6tldJhOP9+pTPrewO9D9E6CDeYLMOBXvduH0YuqbTrx8iZ8ukuEZ6Eil9CKzk5er3EcwXulUqfGQ7UpEISgjujAv9Deh/nkAEBFZhkaXr7JGX1ghtSKDbAtGv76AaCCPPBb2seUltnVhZ1lPLLkPJuFxhrTpfgNUm/kLyA==
X-YMail-OSG: AU922YAVM1l6OB7xoRirelMQZYVALkclBUK8gX196Cec0Q38m1glfY1uYRZkP5d
 tiX2sCjVl5Urp9n1B8ivdvzgaIHXXKfAioBUayzEb6nwUPtZ4v0MfouDVkBf0NXCJoMf0tUnE7Zb
 BgtynytOsY.qaGo6b1Nw4NX.mmaI1bJ1K7UbMIOWADV5mUGl75RWk0uyIfO1EU.5OfMB5ZQOEL5l
 oQaMbBJ8oCuioBZKuPJV4SR5rt9JWK7hNRhug7qPQ0ngQKM5XiJhzE7DNjNXLmwG7e0Oy.2A8h1a
 .5_N5bMoEVWPry5YyxaPFjfnNo6h.KCeI7gcV9i0imZYO665VJnXVuMjYoRTPbcgfNGQyPkFCPzu
 1X3Q2bbG0d1weTzmUkPcYmevT3ddq2Cx6usKwLmS.sKrfxZ4UyWPUWFp1kw7FdRadGkZqMmxe_Vv
 u_q2hVtle4K2Yo03Bv7B.AKYGxluBXtgDhn_pKTD6VBhKKCL4hCFZ_BLhrMvkTjvCrHODGZK3d0A
 OcYQRIHSlw2gSc1u7o0TTLFIpW7bSvc6vPj5N_m9KxvGwNgub_e065rTMPcaimGlVJrb.Oh0pqym
 rnUWM51NUq0H_..q4GpeHix69zJKphNXgLzr1TefFVGjBj7IebJ6vs4qnsRfPGr0UMPTyjMHx1Eh
 e570YyuXmn2uMa0OrlJFu9_PC6TCGY5_fI.3JzY4MoPI8EIaJvdJBGm6Gxnnq5vbRSDdAl6Y4vvg
 yQxUorQCUECCOt8UpzC6fFU893o7eE_wxHx2Jj0P3qx8KdoBh9gkUxQLL90z8Mdg.DA.tf8pUwdY
 QnfYOrIS3odmgiuwkOSe9b83n6S.MhiDKr4E1Biqihv_0.yuWen4LIhVkKZEpLMMHJcM1OJvQwUO
 kYktyQma_FmrPPhoTaWaw9ziWl7sSYvO6aIGfHwekwV2mpItaRauy8LwQHn2H0jPd3QwLZug1BiV
 RGIAj7xDvOrxRKZD7tCTUOEw5dm1Cb.R3doZMKkHsNF91Z8w0Efu27o2ZYwQ6hWXc7OwQ6_L4PIU
 QL7cLjWsJs6aO9wDyxWWRwjXFlJf1V1eQwAm_4AtjVJuRW9kCQdJRLYsWeGNCHrbMnI4pOF8T1Ul
 50Z3BzUxjjDkmVs8ibPZ1A56B6YUPHwnS0HgRAMeN4NtkjZ67KiGNbDA12rxXnLzdVeBoCrxzHu9
 l_Faq_J.cD6F12t_gbn5GlTpgWKvgywf7JpRDKPIbMF9g3o9iFEiO5RlcZkcVkuv4pbbNX9dA3nD
 0MskXloyNnvVyJUR3VqJh4d1XRWMg4qIXIDFX2v8NWwqiohN4mUodQj8dFETXJRsBBVuemryqiCv
 F5UqEr8BUDySfnYfXwe8iFWVIKr8Oe4i1n5FwJ2AT_g.JTtvEYvpKc0fdLvpFcXxYoeBH1lHBe7v
 mxSA.HlLxDvQSF7Us46syvM9yVHVbHvQw8jqRM_eVvSLEdX5ebW9wiQsSmri5rqN1A.V5YHbodag
 hXV5Bpk6o9nZ5dOxuLa.2rc7qMsCvKrksu2PXHE.zLnEL4HZFac9kAIfFeTBhIaRiHp2SladMhXL
 S5CHi9t.6m44Yf7QpR5gb6JHYeFOYZtAhzRdSk5HuOkV2X0VJBEL0QaZB0IsTCnoUDdgeDbjpd5h
 hd0JeM95i7yZs1mwV2CM.8W6VoLEK43f4mbwl1CQZ6Se5B5KyycBq3cnmZI_UcO.7dsrgYY_j4VV
 FScynXEM.qxg2dACE.rVUO1UUWRLxbzKpPeJziXiHih3OQgyf_FEEk1_oN9CyfpAsO7ChVaDE1aI
 rW7Ykh8GoCR_3r5kuvgtNUOOtqCNaSMnjpWI2IGlGNdL3Tc3A3a3x7lLjjWAh7u71ZpM9uqTucJo
 BUUB6qG29KgzGRggMIpPfJrwSCxYsejUDU3IWIn6nXdiU8Dw2QDWEVHyLbaLpFgqNVislDcZgSkE
 OYR16XddgLtfTuZq9Wh7tLwgZBBYn4Zaa3IxSIjmCwlLrzTX7NVcdW1PN6aitwPIp.N3HpVfDG8E
 GMXgql6CszcOaw2LKrw3KrsXdqIcwkpFStL.xTxIshFvW5Z198kV6ODOlDZjPM61c20rJkIBhXrG
 8XMTNbQo76t3.G8oJiRaXkq7DQt1_mi37Yt0NuBBRMxsGDidLLbC_RSmSeipvtnl3qQaYPJylwJ.
 WUpqRa0jgNrN0DBn6tiM5uS3xcQ6nmWJFWKAF7UwZTvWNXjodKOUOQsFyM_FCnhNyA1iwV6ozAf5
 mdVw1Ibs3lT2Th24UC55DcLWKo4PTa8Y-
X-Sonic-MF: <brchuckz@aim.com>
X-Sonic-ID: e5e70465-c2df-41c0-81bf-a8fcd2dc0a37
Message-ID: <6cd8d49f-2b69-471c-84b7-890f31f585b5@aol.com>
Date: Wed, 20 Sep 2023 10:44:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Chuck Zmudzinski <brchuckz@aol.com>
Subject: Re: [PATCH v3 2/6] hw/isa/piix3: Reuse piix3_realize() in
 piix3_xen_realize()
To: Bernhard Beschow <shentey@gmail.com>, Jason Andryuk <jandryuk@gmail.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost
 <eduardo@habkost.net>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20230312120221.99183-1-shentey@gmail.com>
 <20230312120221.99183-3-shentey@gmail.com>
 <f52c41f7-e662-4afd-8ac9-ce2c0da2b1be@perard>
 <7F45B51F-F1E3-4F04-A46F-4C80509C7195@gmail.com>
 <622b9674-fffd-4634-ac30-d0db3230478e@perard>
 <CAKf6xpvxf=F52etJ8o3eLQV4JVD5WM57znGoP3ctONRf7uPisA@mail.gmail.com>
 <B0FF78F4-1193-495B-919C-84A1FF8ADF12@gmail.com>
Content-Language: en-US
In-Reply-To: <B0FF78F4-1193-495B-919C-84A1FF8ADF12@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21797 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 9/19/2023 4:02 PM, Bernhard Beschow wrote:
> 
> 
> Am 3. April 2023 12:27:14 UTC schrieb Jason Andryuk <jandryuk@gmail.com>:
>>On Mon, Apr 3, 2023 at 5:33 AM Anthony PERARD <anthony.perard@citrix.com> wrote:
>>>
>>> On Sat, Apr 01, 2023 at 10:36:45PM +0000, Bernhard Beschow wrote:
>>> >
>>> >
>>> > Am 30. März 2023 13:00:25 UTC schrieb Anthony PERARD <anthony.perard@citrix.com>:
>>> > >On Sun, Mar 12, 2023 at 01:02:17PM +0100, Bernhard Beschow wrote:
>>> > >> This is a preparational patch for the next one to make the following
>>> > >> more obvious:
>>> > >>
>>> > >> First, pci_bus_irqs() is now called twice in case of Xen where the
>>> > >> second call overrides the pci_set_irq_fn with the Xen variant.
>>> > >
>>> > >pci_bus_irqs() does allocates pci_bus->irq_count, so the second call in
>>> > >piix3_xen_realize() will leak `pci_bus->irq_count`. Could you look if
>>> > >pci_bus_irqs_cleanup() can be called before the second pci_bus_irqs()
>>> > >call, or maybe some other way to avoid the leak?
>>> >
>>> > Thanks for catching this! I'll post a v4.
>>> >
>>> > I think the most fool-proof way to fix this is to free irq_count just before the assignment. pci_bus_irqs_cleanup() would then have to NULL the attribute such that pci_bus_irqs() can be called afterwards.
>>> >
>>> > BTW: I tried running qemu-system-x86_64 with PIIX4 rather than PIIX3 as Xen guest with my pc-piix4 branch without success. This branch essentially just provides slightly different PCI IDs for PIIX. Does xl or something else in Xen check these? If not then this means I'm still missing something. Under KVM this branch works just fine. Any idea?
>>>
>>> Maybe the ACPI tables provided by libxl needs to be updated.
>>> Or maybe something in the firmware (SeaBIOS or OVMF/OvmfXen) check the
>>> id (I know that the PCI id of the root bus is checked, but I don't know
>>> if that's the one that's been changed).
>>
>>Xen also has hvmloader, which runs before SeaBIOS/OVMF.  Looking at
>>tools/firmware/hvmloader/pci.c, it has
>>        ASSERT((devfn != PCI_ISA_DEVFN) ||
>>               ((vendor_id == 0x8086) && (device_id == 0x7000)));
>>
>>From QEMU, it looks like 0x7000 is PCI_DEVICE_ID_INTEL_82371SB_0, but
>>PIIX4 uses 0x7110 (PCI_DEVICE_ID_INTEL_82371AB_0).  Maybe try removing
>>that check?
> 
> I was finally able to build Xen successfully (without my distribution providing too recent dependencies that prevent compilation). With 0x7110 added in the line above I could indeed run a Xen guest with PIIX4. Yay!
> 
> Now I just need to respin my PIIX consolidation series...

Welcome to the world of running guests on Xen! I am the one who tested your earlier patches with Xen guests, and I just wanted to say thanks for keeping me in the loop. Please Cc me when you post your respin of the PIIX consolidation series since I would like to also test it in my Xen environment. I understand I will also need to patch hvmloader.c on the Xen side to set the correct device id.

Kind regards,

Chuck

> 
> Best regards,
> Bernhard
> 
>>
>>Regards,
>>Jason


