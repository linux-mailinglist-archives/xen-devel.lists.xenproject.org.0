Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F291D6B9F65
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 20:12:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509798.786302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcA4H-00022Z-8x; Tue, 14 Mar 2023 19:12:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509798.786302; Tue, 14 Mar 2023 19:12:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcA4H-000201-5p; Tue, 14 Mar 2023 19:12:17 +0000
Received: by outflank-mailman (input) for mailman id 509798;
 Tue, 14 Mar 2023 19:12:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xZxk=7G=web.de=tachyon_gun@srs-se1.protection.inumbo.net>)
 id 1pcA4F-0001zQ-JY
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 19:12:15 +0000
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2103cdd0-c29c-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 20:12:14 +0100 (CET)
Received: from [92.76.123.191] ([92.76.123.191]) by web-mail.web.de
 (3c-app-webde-bap40.server.lan [172.19.172.40]) (via HTTP); Tue, 14 Mar
 2023 20:12:14 +0100
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
X-Inumbo-ID: 2103cdd0-c29c-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1678821134; i=tachyon_gun@web.de;
	bh=VCojcZlldVa+NW8P0X5BOl0tG01DFnHZ4HfR850czIA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=j6n16Ep3Yfepa48uY3Osqb75cP4rjcKtuIZTHmkM9HlmyZFngVu3DJY+oZSlQg5TX
	 lMgm0VCSJNam04XHGSCJsvSUOwlHmnghR056tl2CX44pHaFw/w5PfqJMFEIf30bn+q
	 9udp7Ri7Q0Th83mVf3RW+npDm/fHF2KmkpEGAuVKF3Nd1S9Yk0Hz33rQzoQ8HyA8MR
	 wid6SsGdVpQTQuHMqNjNwDAUY225iZ0qHQscIWazFJWxaKKoxLec9ZdPzaC3/D4qEt
	 xnmsH90PzyaTVX1VRSfPhLtkHEkKKi4Cqu25dKj6CdtmPRzreqegSV8qOO8NuB92WJ
	 d0o3DIvd2UoZA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
MIME-Version: 1.0
Message-ID: <trinity-99ab6070-a3e0-4aa8-a39d-365454ca0a08-1678821134110@3c-app-webde-bap40>
From: Denis <tachyon_gun@web.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Aw: Re: [help] Xen 4.14.5 on Devuan 4.0 Chimaera, regression from
 Xen 4.0.1
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Mar 2023 20:12:14 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <594d64f3-a2ae-dbfe-428c-901fd806e88e@citrix.com>
References: <trinity-8973751a-6742-4309-b02d-0b4c38f4206e-1678390468345@3c-app-webde-bap36>
 <84f66bc0-ae7c-febe-9a15-98453c48d051@citrix.com>
 <ce1a289e-6ed7-9b5c-42f5-069f16bd6984@suse.com>
 <trinity-429ff607-c131-4745-8c96-9d7f6f61234f-1678481409956@3c-app-webde-bs42>
 <31151e94-b8b3-15ab-3680-e1c6e2e97530@suse.com>
 <trinity-7e872635-20a4-4120-a08d-2d62a77d2da5-1678756503867@3c-app-webde-bs22>
 <2afa0abe-abe5-a3d8-658f-abc466d78101@suse.com>
 <trinity-7c345507-5695-4649-a62b-be4dd793cc00-1678805608384@3c-app-webde-bap40>
 <e5a4689e-27e1-6992-65f8-c59b669aeaf1@citrix.com>
 <trinity-1d86f8fd-690a-4643-95e2-0f83d138c6ef-1678812509474@3c-app-webde-bap40>
 <594d64f3-a2ae-dbfe-428c-901fd806e88e@citrix.com>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:jxSMwG+T68CL7h86pFg3eC6F8yKWogjij97v6t80UycdbBdf7k8XwrvKghDyw9FeFDI9u
 wbG5hgfdDOLVSh4gWkGvH8Ker9P1ucvdLXYBLbXYy8G9bvPT0fuZEacqDPfyy7r0r5vHU6MGshXd
 yHQU6SAyYWi1ng7c9bXXU96Oepg6hr60OiwLj7NRl0l/YNAbg5LJRineEK4d+eK3bGrTgYRoCb4c
 2u5H58ZUfb+Hxh+DPdW71hcOdjmNhfDTrQgE1ZxREkwOWncZeYXq6zt8sn1b/VDqIITRRM+J8rLs
 Co=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:I5ouWdgjv1Q=;DC2W49j3GHIytj1I9fi4KoghDt5
 Fbbvh7t7KRcSWMOqr9KBz6bl5JXYYdHxGlFXXSx5I8ObbqXhmD07j+6bP0UbikqLJDmbIdXOz
 qRbXefHoQ/sui7XTwHsQ7DwD6tnze2331HyhSc1kIwsjKAl6lWIWY5EHKiN+mihGqgLteyK/P
 ZIsuup1nA7pf9jpd9l2rzk+PELSXfnepFluJ/LpCF0VmUazviezl/UAYOKIqjpMCcDLwRd4CS
 A61lMcgq4HV1ftc6v8djlBUdQkkohS13ejoJTDICrCjdwfmuGifX4Yc1LTVebryGkmMXiV1Tp
 svrAxU+D7AuH62Yj8mYFuKSchD/xdpTtFSCb02Ggh19VOWv5biGhdIBdPK+VdlQQaHdVpfsHl
 oxANS453nmsesAClHJZIdz9pQ6DfHKMShOKJ6dh3Fhz8hzDcyOTns4GJSJ9nu4uz4V2YWfoYt
 gy5qXs/4UYRoGNR7CNGhMHEmyNAvuoWFPNkMxDl5cTVAXaTylnesGugSw1TAOE3Dftw4TY1Ix
 VwWoaO9AjelaTX4lpXp3RhgfIZmc8SYR/9iBzB6c8Aiypp3X3XirUkD/2RQ65wjEJXZRYCi/2
 Z8FnSP1QncOHdpVpNq/W3EzWP8e5j9eeTY0FgI25fCeEAAaH4e8qUN/F5gcmdokbYqR5LtKBt
 kXp2rgFRsryr66y1duyQd/vecG7VUIzDc7wGQk9dw7x2bH3syjNzudzF4LAhQsoZmmRq/TXoI
 SwWVCzmCZrKiJe8q8Is0pW+uHIXIZhSO4Jd56Aq3PXplq+O119MVr5N7wEmaI+5tBD5cG53M8
 duuT+OxrhkyCZv//tLPwcf5w==

On 14=2E03=2E2023 18:12, Andrew Cooper wrote:
> On 14/03/2023 4:48 pm, Denis wrote:
> > On 14=2E03=2E2023 16:11, Andrew Cooper wrote:
> >> On 14/03/2023 2:53 pm, Denis wrote:
> >>> On 14=2E03=2E2023 07:37; Jan Beulich wrote:
> >>>> On 14=2E03=2E2023 02:15, Denis wrote:
> >>>>> On 13=2E03=2E2023 10:36, Jan wrote
> >>>>>> On 10=2E03=2E2023 21:50, Denis wrote:
> >>>>>>> Should I test something else?
> >>>>>> =2E=2E=2E there was no request for any further testing here, for =
the moment=2E
> >>>>> ah=2E=2E=2Esorry, going by "Would be nice to have this confirmed f=
orthe system
> >>>>> in question, i=2Ee=2E without Xen underneath Linux" I thought I co=
uld test
> >>>>> something which might help shed some light on all of this=2E
> >>>> Well, yes, that Linux-without-Xen test would still be useful to hav=
e
> >>>> results from=2E I didn't account for this in my earlier reply becau=
se
> >>>> I had asked for it before already, and I did take "something else"
> >>>> for meaning anything that might have turned up as useful from the n=
ew
> >>>> data you had provided=2E
> >>> What tests could I do or what info should I provide to help?
> >> Can you please rebuild Xen with this patch:
> >>
> >> diff --git a/xen/drivers/passthrough/amd/iommu_acpi=2Ec
> >> b/xen/drivers/passthrough/amd/iommu_acpi=2Ec
> >> index 2fdebd2d74c9=2E=2E747eae25f56c 100644
> >> --- a/xen/drivers/passthrough/amd/iommu_acpi=2Ec
> >> +++ b/xen/drivers/passthrough/amd/iommu_acpi=2Ec
> >> @@ -1033,7 +1033,7 @@ static int __init parse_ivrs_table(struct
> >> acpi_table_header *table)
> >> =C2=A0=C2=A0=C2=A0=C2=A0 const struct acpi_ivrs_header *ivrs_block;
> >> =C2=A0=C2=A0=C2=A0=C2=A0 unsigned long length;
> >> =C2=A0=C2=A0=C2=A0=C2=A0 unsigned int apic;
> >> -=C2=A0=C2=A0=C2=A0 bool_t sb_ioapic =3D !iommu_intremap;
> >> +=C2=A0=C2=A0=C2=A0 bool_t sb_ioapic =3D 1;
> >> =C2=A0=C2=A0=C2=A0=C2=A0 int error =3D 0;
> >> =C2=A0
> >> =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON(!table);
> >>
> >> which should cause the behaviour to revert back to that of Xen 4=2E0=
=2E1=C2=A0
> >> (i=2Ee=2E it will fully ignore the checks relating to the southbridge=
 ioapic)=2E
> >>
> >> Confirm that with this, and booting Xen simply with `iommu=3D1` that =
full
> >> DMA remapping and interrupt remapping is considered active=2E
> >>
> >>
> >> Then, can you play around with passing the soundblaster through to VM=
s=2E=C2=A0
> >> Looking at the LSPCI you provided, it only supports legacy line inter=
rupts=2E
> >>
> >> Does the device work fine, or do you get a bunch of errors on `xl dme=
sg`
> >> about IO page faults (which is a generic "IOMMU said no to something"
> >> message)?
> > Am I right to assume that I would need the source/header packages from=
=20
> > the Devuan 4=2E0 install and then re-compile Xen?
>=20
> Yes=2E
>=20
> `apt build-dep` to install the build dependencies, and `apt source xen`
> to get the Xen sources=2E
>=20
> All you actually need to do is is a build of xen=2Egz, not a full build =
of
> everything, which will simplify things massively if you don't want to
> rebuild the world=2E

Thank you=2E
I'll get on it this week as soon as time allows for it=2E


Denis

