Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 778196B8798
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 02:30:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509406.785101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbtU8-0007CZ-Om; Tue, 14 Mar 2023 01:29:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509406.785101; Tue, 14 Mar 2023 01:29:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbtU8-00079p-L0; Tue, 14 Mar 2023 01:29:52 +0000
Received: by outflank-mailman (input) for mailman id 509406;
 Tue, 14 Mar 2023 01:29:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xZxk=7G=web.de=tachyon_gun@srs-se1.protection.inumbo.net>)
 id 1pbtU7-00079j-F3
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 01:29:51 +0000
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6843b54-c207-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 02:29:50 +0100 (CET)
Received: from [185.71.171.210] ([185.71.171.210]) by web-mail.web.de
 (3c-app-webde-bs22.server.lan [172.19.170.22]) (via HTTP); Tue, 14 Mar 2023
 02:29:49 +0100
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
X-Inumbo-ID: b6843b54-c207-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1678757389; i=tachyon_gun@web.de;
	bh=odilobawNb8aYW0OaQPGC1gHlfs5ZeAJqgP84ggcwHw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AOWPqbwksSVRPQnoqS7MykI/nwLMysfVwcp0j0rH2vm+jCq5jl9wluNZ3BZzoXfxe
	 pEeXzeao5BnK+ujosnBNK9kUZZcLeK6baeIY/0b0ss2aFHwex5cMh//u52gWwYRW08
	 ZQMS3EWI15gsy8sd7pXVnNLxjf9rEOjt2mQUQwfkxpih/V7bs4W51kD/0DVeBZf0ek
	 wynTaQN8eOovBS05gaurGMPcMbjRU7dOqNqPdJo6HzRJWpjci/mL1WrRHfQRgkEMVr
	 LWlrvEFkeewgngRuhg+xNlPs+SKRgccVEA4ZTBW2X2r0PmsZ6BKGFfzipxdFpFvSsT
	 I1h6jCxeRk5ig==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
MIME-Version: 1.0
Message-ID: <trinity-c04bb66a-12c1-4998-b98b-dd73faa40e8c-1678757389239@3c-app-webde-bs22>
From: Denis <tachyon_gun@web.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Subject: Aw: Re: [help] Xen 4.14.5 on Devuan 4.0 Chimaera, regression from
 Xen 4.0.1
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Mar 2023 02:29:49 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <5a779fab-a410-c333-6a92-49d603647761@suse.com>
References: <trinity-8973751a-6742-4309-b02d-0b4c38f4206e-1678390468345@3c-app-webde-bap36>
 <84f66bc0-ae7c-febe-9a15-98453c48d051@citrix.com>
 <ce1a289e-6ed7-9b5c-42f5-069f16bd6984@suse.com>
 <trinity-429ff607-c131-4745-8c96-9d7f6f61234f-1678481409956@3c-app-webde-bs42>
 <31151e94-b8b3-15ab-3680-e1c6e2e97530@suse.com>
 <467bc1f9-6e14-cca9-159c-b40eb8327028@citrix.com>
 <5a779fab-a410-c333-6a92-49d603647761@suse.com>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:g1RgpoVEPvWi60EW02XLClSS72+OEdeUVG/F2dMdFgBRhuJkmYD8LYNwHvEVTpnQeAB45
 AyZPOfr8Z22f8NpxQjwO18fm1T5H+jbXkkIy6fQczcxFR5NxEt+AL3BglIJe7hGhn3I14NAaBGN3
 0IeKpP/BNTfFoNoRJktHoN2y3Y4J5ZD6LNwB0lUDvZ/lgnQSmNExi7HOLW8qJiPFIzXUGkWK7yb3
 //BlHL0hQ7s8EFAGmx6Ab4ZKLOyfBD0SfYPsBLfChGMuQboma6Zax6EQUjOL6tGsrwtUcQh+2fC7
 bY=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VMr4PT44QrQ=;UNQAEA9bxFwR5OKMhxzvFrf/+F5
 2FzupHVA4SZtJFilKZ/ym8sYaA1BihIgUtqNhTjE2Q0XHBv2VQBgdm4sAYfUAyh7CXoXXK1zl
 6j3Fx0e9WhI3IA/7nIb6zJR/2jWw5YlmksH8vxiolddZe7us0uisZpNyISaTxECTRK5WAvvNH
 6xwz+P0VF00VaBFQVesgEg+Ocjmqde3/+xP+dQIgzs7QYNeTZ7LPTTGEaSdOuoINU8XFViu2B
 zzwhKaYreYSTTep4ziJxxvwcaBx94To0Y/VYZe3auTBY+E91Ia5mfqknI0Mi6F8f5eBRpscyj
 pKHP4QlLUV0BTHiEiqu3zilgELjVgKUwvDt/i77w0AUbIiAQ5SgCH7SKJCHKfN0nZn9FDnjJK
 ulHbyiDg1XgqYbaaPbW7UVjVO9rMKZFcaM4x5VodCPBzQPRRTqOZnEvaSBuSSwaRt2S97oj6b
 +KOsS61guz1+Togop6uUDRfBvdgdcslx9ioI2avM5Ta8Vy9DQXdFTWnEImRDOWXl/8nd4YEGF
 iyvKK83KZLUNrdRXqm82KhMv75Nt7WgTb9bij6leEXZ57iJ3TqIXaccI+cb9c+TUK1EGgrA5c
 +ya/n3y18MEXhgV5Sb51Nyx0JKp9iTOYQL0KI45VEhpKmy4iH7Xa65ZEYq1aOZybMhYC9UXCI
 B2XA/drS6uHgSF6RO8TGxjeB0v0ctDSWNl+6OJOqgi8UUUVGcADOZSon+dhjmeU3Mvqy4nvM4
 RUgURhliG80M1wfkTNkhU58DWsc9A8GurP5MzSnG3y2cmvdVnQs0eFf5QASiGl2Q9qBorfh6Q
 r/nJw2swZoX9OK4jPQHoewnBMpC7LTeuo22p7u2g3DM+g=

On 13=2E03=2E2023 12:54, Jan Beulich wrote:
> On 13=2E03=2E2023 12:43, Andrew Cooper wrote:
> > On 13/03/2023 9:36 am, Jan Beulich wrote:
> >> On 10=2E03=2E2023 21:50, Denis wrote:
> >>> On 10=2E03=2E2023 09:51, Jan Beulich wrote:
> >>>> On 09=2E03=2E2023 21:37, Andrew Cooper wrote:
> >>>>> On 09/03/2023 7:34 pm, tachyon_gun@web=2Ede wrote:
> >>>>>> A short snippet of what I see when invoking "xl dmesg":
> >>>>>> =C2=A0
> >>>>>> (XEN) No southbridge IO-APIC found in IVRS table
> >>>>>> (XEN) AMD-Vi: Error initialization
> >>>>>> (XEN) I/O virtualisation disabled=C2=A0
> >>>>>> =C2=A0
> >>>>>> What I would like to see (taken from Xen=C2=A04=2E0=2E1 running o=
n Debian
> >>>>>> Squeeze, in use since 2011):
> >>>>>> =C2=A0
> >>>>>> (XEN) IOAPIC[0]: apic_id 8, version 33, address 0xfec00000, GSI 0=
-23
> >>>>>> (XEN) Enabling APIC mode: =C2=A0Flat=2E =C2=A0Using 1 I/O APICs
> >>>>>> (XEN) Using scheduler: SMP Credit Scheduler (credit)
> >>>>>> (XEN) Detected 2611=2E936 MHz processor=2E
> >>>>>> (XEN) Initing memory sharing=2E
> >>>>>> (XEN) HVM: ASIDs enabled=2E
> >>>>>> (XEN) HVM: SVM enabled
> >>>>>> (XEN) HVM: Hardware Assisted Paging detected=2E
> >>>>>> (XEN) AMD-Vi: IOMMU 0 Enabled=2E
> >>>>>> (XEN) I/O virtualisation enabled
> >>>>>> =C2=A0
> >>>>>> My question would be if this is=C2=A0"normal" behaviour due to ol=
der hardware
> >>>>>> being used with newer versions of Xen (compared to the old 4=2E0=
=2E1) or if
> >>>>>> this is=C2=A0a bug=2E
> >>>>>> If the latter, has this been addressed already in newer version (=
4=2E14+)?
> >>>> No, the code there is still the same=2E The commit introducing the =
check
> >>>> (06bbcaf48d09 ["AMD IOMMU: fail if there is no southbridge IO-APIC"=
])
> >>>> specifically provided for a workaround: "iommu=3Dno-intremap" on th=
e Xen
> >>>> command line=2E Could you give this a try? (As per below this could=
 be
> >>>> what we want to do "automatically" in such a situation, i=2Ee=2E wi=
thout
> >>>> the need for a command line option=2E But you then still would face=
 a
> >>>> perceived regression of interrupt remapping being disabled on such =
a
> >>>> system=2E)
> >>>>
> >>>> The other possible workaround, "iommu=3Dno-amd-iommu-perdev-intrema=
p",
> >>>> is something I rather wouldn't want to recommend, but you may still
> >>>> want to give it a try=2E
> >>> =20
> >>> Thanks for your reply=2E
> >>>
> >>> I added the lines you suggested and it seems that "AMD-Vi: IOMMU 0" =
and
> >>> "I/O virtualisation" is enabled again=2E
> >> Good - that'll have to do as a workaround for the time being=2E
> >=20
> > Not really=2E=C2=A0 Booting this system with no-intremap is still a re=
gression
> > vs Xen 4=2E0=2E1
>=20
> Well, "for the time being" meant untiol we figure out what exactly we ca=
n
> do here=2E
>=20
> > Disabling interrupt remapping on PCIe devices because we can't figure
> > out interrupt handling around the PCI bridge is still bad behaviour=2E
> >=20
> >=20
> > What we need to figure out here is how interrupts from the PCI bridge
> > actually work=2E=C2=A0 The IVRS table does contain records covering th=
e devices
> > on the Southbridge, including the PCI bridge and it's entire subordina=
te
> > range=2E
> >=20
> > MSI/MSI-X interrupts from the PCI devices will work fine (they'll have=
 a
> > proper source id), so the only question is about line interrupts=2E=C2=
=A0 They
> > ought to appear with the bridge's source id, and ought to be fine too=
=2E
> >=20
> >=20
> > I see no evidence to suggest that the IVRS/MADT are incorrect or
> > incomplete=2E=C2=A0 Xen's believe that there must be a southbridge IO-=
APIC
> > special device seems to be the false entity here=2E
>=20
> It may be possible to behave better here, but my reading of Linux source=
s
> suggests that they would do exactly that on this system - disable
> interrupt remapping (I had asked Denis for trying that out to double
> check, but so far he provided back only hypervisor logs)

As suggested,  I tried the two kernel parameters=2E As a result, I was abl=
e=20
to assign the devices (in this case a USB host controller and my PCIe GPU)=
 I used=20
before to the HVM domU=2E
What did not work was passing through the PCI device (Audigy2 soundcard)=
=2E

Unbinding the devices worked for the first two, with the PCI card not so m=
uch=2E

This info won't help, but back in 2014 I tried Debian Jessie with (probabl=
y) Xen 4=2E4=2E
Back then this was working as it did on 4=2E0=2E1=2E

I will try Devuan Daedalus with Xen 4=2E17 next on my Z97 board with an i7=
-4771=2E
It probably will show the same errors because it also has an old PCI slot =
with=20
an Audigy2 in it=2E

So I assume (from my limited knowlegde about all this) that this has somet=
hing to do with=20
older boards using PCI slots (or people like me using PCI devices for pass=
through)=2E


Denis

