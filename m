Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F70165E2F5
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 03:35:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471592.731497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDG5v-0004Tu-WD; Thu, 05 Jan 2023 02:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471592.731497; Thu, 05 Jan 2023 02:35:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDG5v-0004RB-T5; Thu, 05 Jan 2023 02:35:03 +0000
Received: by outflank-mailman (input) for mailman id 471592;
 Thu, 05 Jan 2023 02:35:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cz8e=5C=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pDG5t-0004Qm-Fq
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 02:35:02 +0000
Received: from sonic313-21.consmr.mail.gq1.yahoo.com
 (sonic313-21.consmr.mail.gq1.yahoo.com [98.137.65.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b2df3e2-8ca1-11ed-b8d0-410ff93cb8f0;
 Thu, 05 Jan 2023 03:34:58 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.gq1.yahoo.com with HTTP; Thu, 5 Jan 2023 02:34:56 +0000
Received: by hermes--production-ne1-7b69748c4d-rglm6 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID ac337fbdd3f23fe8dbfff1f809657b1b; 
 Thu, 05 Jan 2023 02:34:50 +0000 (UTC)
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
X-Inumbo-ID: 8b2df3e2-8ca1-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1672886096; bh=/pRkfyPTTNceKNunGNRzqNqyo3veLlHP7DUWR1szcLQ=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=V2vW5f5Uy+sJKNuydA6aOe5NtERI8guZXx/KTQOH8sk5WVpJrSco7chMF9TZ5mT/wCJB1hOXZKYgtq0TwjIBY8EOe64Cy7wwwYzksEL/AJjKbd5kUWF1yzMttZqENpXg7aykoVF7MACyshYLm7bRmV9f20iq6uqFHRYcUi+2BFydZoyvUnJt0airuiB6z7+wjxg1y2Zqm36NRBAMvZj5/rS0Tm0SzvQ8+mMw4Cm2PbSJ0DfSGZdS0g6/a2f4Ds8hQLAs844R1sRKauZRK31y7Hzk2sZbmmyg7nnD89Y+KUjq2PvkCFsw2+UdzmYKbkMUvWpWSiGrkvu5Kshloc8hOg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1672886096; bh=SUmFmCwnNydbHOG0E0HDGzqHeyfavww5DndpuizCsUo=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=Kjt/pFUbGuld+5RFIx3jW/KIhauf9E5JSh+SHMpql3A3Xofswqz9trqnGk3kw5WBwZ8WL0ZL//p04FgiPANN4u65O29eNG6/zxinPC+OQwQciUcyX8sFgz3M57hwUcPQ6KgZ0C31/H569vLdBoEjmV5W85H3lszxoXTT+BYg7RHvImQdtp7eARPaVAk5hGG3+VDKyyfa2QtvfKXC4WMBZRcIrwPgKAzM0e5ter5orr8JzCNHpLRm/8yr5IY0HAmaL9Oc63FF616NigXzbDRKr8n078F3YEBqGigV58fqKwlxAdOKRxQCF6H8J1tAgXq7aYBsm45YL+Opv9ldmsuvag==
X-YMail-OSG: sCZ4kewVM1nXmt9YrAGtmMRCOz5NRTCtu7Qkwdn1prKvo0eaIAQ91dp6FC7S0Fh
 WLtze.ZOUgVRzQJ3m9t4D7B89Mjmfa_LtZ4cHVOhMe7RgjAlGr1iodiQ2Duh6UZ.YjhHx5gcBKkj
 vwxFX_Qiz58yGw416YJhpAdE5rrcbPdPm9qjrYE1bPOr0rBRBVAiL.gEzjrlDFWTKhauZCnV4B9_
 eMcqMxjeOUZ4NP2Kut47wgg2X8HaauLL1OSQXFXLlgueB2VAQW88lxwdj3BJM51un9uG83hcp4dj
 zE.EHY_gKPyOCMrPhgoMoWK_kWgkG5I83ut7OKfZGMOjpOIUSvgJzoP8fdlqgCDa6FaRDPdpDURU
 Hqno4WdMyp9hHr_Wu1ccvAH.qi2CKh6IW0MGz5.kKx6yJhHoXMZ13zJqUH2l5ztjzbgkw2IUVX2P
 FOrHdOsjiojByZMdctdQ2bD1cfl7.R3PBtC5LNuMJofxTyUWRCHQjmdjIBZTwWH8rdNfEw7W1Ohl
 2TLX_33LtakfH6eRuccaXVt4U7OWaKcoG_cZvR2XLkmsJs11eyuiajMYFTKqexRbn3DFkp1E_BtD
 HCoNQJ3eclwTj5T0s2QODziPzfPrv0Eb_ufODOsGaprndkYPl0hBp3RoHrP0lLPgV7wLlfEregk7
 Hy0jhSocEn3aCwQDZ7yeNG.dHD6Me13sNHTUo4PJ.VNGq4LdIoWqh.BkjJ3q6WH37E3C08Ix_zoJ
 pdb.hWyY3QeihO9ui8ndOObskZo5Inda.JpTax6JSKCF7GWpJfENRKPgXJzG1iORf37VO7Z31Y_a
 _GuJ8PCRZVces8zc0J.n.eqQHjPHum8oMmGQ4KMnUPw1dbepkySzHqWkLtuFkSiENnt8lFOIcH1Z
 lmcYTByocaBRzXm2zs2ZYFT_VaSUHwe0ZFqbleQcB8xYh7rbKXXJeNNUooL7Jb0W2XO0LswaLekB
 PXaJtrPphOGyPdzJDIXE8FVupTUB.FBtnUbu.0zrD5gAbrIUAYAYQKbBpDGl831EJD4wjuH7PRT6
 H8c62QqNyNEeCSJd6ZHewi2rGLFqKe3q0l9nkt535bF0qZ7mkz1r_0XJJU035xASFmpnrS784bEG
 jUeAuCQZ9hNtFmCeRoBCGJcqr0aZin25_bMpkcbaKnGgVnoS_izKAxFaC.38WA3YHf271GeE2FzN
 EZPKv9lDe_.qpkjTlY__7iyFiuvdAwtRvLCtdUAnBfJ.O5CnCluSctbxjD3VfFu2EdK.amZDb5Oh
 GOl0QzhUlV4iiqbAHSClDMN314EEEz.LhEmy8s.VZrx5YkwIpEgFAp_Eukqcu8a_IGEq8k1DoQtl
 F9PlfFDJhxpuFXdE_jMtBQcO_OnglAw7F4yRYfiJXAYz0hH9vpGD9FOVwtxr45mbXiLn7rHFhukQ
 WioNy4GpsW6_MYBE_FMl8t5WxBWD4fBzZ7apctIhMEXsUe2g4a.TCT7l0nJ8AB24Du7U1OE_ciT.
 O8cp0mW72CCLIDIz3aACZQEhl9qNcaZOPKfwZ.v_MpVsBNQVirdPakWwre_Bby6inRNk7_1EjfNl
 rm1H9YZpggJ8XRIjR1ZfgyxhhAPgqgbo8GTHPmpv65zjzyFhUWTYoXvBiKJelzKTGqrRYtWNa7Iq
 K2ecVuDoyXz3NbzrPx187zvU7rSJE5Ot.73yeoukmfMeFDB0eZrn_BnqRX3WSyme80CY3h1kA.MF
 IbobusjxrLmzIYo1qkbtz40PAC1iXye6zVHBTLP19LWD630de.MqAhuXs4pqVnO9E0PiB5haht.6
 LD4RqkIkh968fIrsL4qvkXn7uiJElOvCT8OGMZXNiybrwPHEoSCOtJrnGUIsO5QC7lid9JZqb6Oh
 qmGRbXDE3tYCIBtT1Aax5uZvT2p6KbwRU.49yZfg_jkKf.zXf7WcxCskywcAzDa3e5BxvFE_J0Ed
 tKE0o8L3Z4b5WG3lE1QQEYZuE4Qs6a1pzFujdQKAsZRcmlGe9lerepndjdqXIIkYt40FakuvZrQf
 1jxM7nyAcBXgSY53j6oQN6nRTiix_kXKOzGCb_Wel0oYEW4JE7kus6KWlDaAoEp2CgTmNa28FRzY
 AaSJ0Fm4o8BkNCUowfAz5rvVmSvsu_rbpM2Fu9N6V5RaSgiIjOi6kSycqUfMtHj6Jc6J.N2.s.mZ
 6SGewiDdW98VXChfXmttbARU_f2qjVbj9bcWXZZnwX1NmlX08zkueL9rdF8vZKBVETfjuHzLj9.r
 XjqUi2ypTBepw2iX_Jd_9L4.gSQ--
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <157390bd-4d1f-64be-49df-639ddbd8bf2d@aol.com>
Date: Wed, 4 Jan 2023 21:34:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 6/6] hw/isa/piix: Resolve redundant
 TYPE_PIIX3_XEN_DEVICE
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>
References: <20230104144437.27479-1-shentey@gmail.com>
 <20230104144437.27479-7-shentey@gmail.com>
 <1c2e0780-e5fb-1321-0d84-b0591db9fec7@linaro.org>
 <f596a7c1-10d0-3743-fe0b-d42003cf7440@aol.com>
 <be75758a-2547-d1ef-223e-157f3aa28b23@linaro.org>
 <92efe0f1-f22b-47bc-f27d-2f31cb3621ea@aol.com>
 <877abde0-2e76-7fde-0212-eb7ce1384ea6@linaro.org>
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <877abde0-2e76-7fde-0212-eb7ce1384ea6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20982 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/4/2023 5:18 PM, Philippe Mathieu-Daudé wrote:
> On 4/1/23 20:29, Chuck Zmudzinski wrote:
> > On 1/4/23 1:48 PM, Philippe Mathieu-Daudé wrote:
>
> >> Here TYPE_PIIX3_DEVICE means for "PCI function part of the PIIX
> >> south bridge chipset, which expose a PCI-to-ISA bridge". A better
> >> name could be TYPE_PIIX3_ISA_PCI_DEVICE. Unfortunately this
> >> device is named "PIIX3" with no indication of ISA bridge.
> > 
> > 
> > Thanks, you are right, I see the PIIX3 device still exists after
> > this patch set is applied.
> > 
> > chuckz@debian:~/sources-sid/qemu/qemu-7.50+dfsg/hw/i386$ grep -r PIIX3 *
> > pc_piix.c:        pci_dev = pci_new_multifunction(-1, true, TYPE_PIIX3_DEVICE);
> > 
> > I also understand there is the PCI-to-ISA bridge at 00:01.0 on the PCI bus:
> > 
> > chuckz@debian:~$ lspci
> > 00:00.0 Host bridge: Intel Corporation 440FX - 82441FX PMC [Natoma] (rev 02)
>
> All these entries ('PCI functions') ...:
>
> > 00:01.0 ISA bridge: Intel Corporation 82371SB PIIX3 ISA [Natoma/Triton II]
> > 00:01.1 IDE interface: Intel Corporation 82371SB PIIX3 IDE [Natoma/Triton II]
> > 00:01.2 USB controller: Intel Corporation 82371SB PIIX3 USB [Natoma/Triton II] (rev 01)
> > 00:01.3 Bridge: Intel Corporation 82371AB/EB/MB PIIX4 ACPI (rev 03)
>
> ... are part of the same *device*: the PIIX south bridge.
>
> This device is enumerated as #1 on the PCI bus #0.
> It currently exposes 4 functions: ISA/IDE/USB/ACPI.
>
> > 00:02.0 Unassigned class [ff80]: XenSource, Inc. Xen Platform Device (rev 01)
> > 00:03.0 VGA compatible controller: Device 1234:1111 (rev 02)
> > 
> > I also see with this patch, there is a bridge that is a PIIX4 ACPI at 00:01.3.
> > I get the exact same output from lspci without the patch series, so that gives
> > me confidence it is working as designed.
>
> Historically the PIIX3 and PIIX4 QEMU models have been written by
> different people with different goals.
>
> - PIIX3 comes from x86 machines and is important for KVM/Xen
>    accelerators
> - PIIX4 was developed by hobbyist for MIPS machines
>
> PIIX4 added the ACPI function which was proven helpful for x86 machines.
>
> OS such Linux don't consider the PIIX south bridge as a whole chipset,
> and enumerate each PCI function individually. So it was possible to add
> the PIIX4 ACPI function to a PIIX3... A config that doesn't exist with
> real hardware :/
> While QEMU aims at modeling real HW, this config is still very useful
> for KVM/Xen. So this Frankenstein config is accepted / maintained.
>
> Bernhard is doing an incredible work merging the PIIX3/PIIX4 differences
> into a more maintainable model :)
>
> Regards,
>
> Phil.

Thanks for the nice explanation of the history. I understand the PIIX3 is associated
with the i440fx machine type for i386 - it goes all the way back to 1995 I think
with the original 32-bit Pentium processor and Windows 95. So it is a worthwhile
effort to work on updating this to something newer, and of course kvm can use
the newer Q35 chipset which goes back to 2009 or so, I think, but xen/x86 languishes
on the i440fx for now.

Best regards,

Chuck

