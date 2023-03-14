Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCD36B9C10
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 17:48:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509757.786167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc7pB-000348-K4; Tue, 14 Mar 2023 16:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509757.786167; Tue, 14 Mar 2023 16:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc7pB-00031Q-GN; Tue, 14 Mar 2023 16:48:33 +0000
Received: by outflank-mailman (input) for mailman id 509757;
 Tue, 14 Mar 2023 16:48:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xZxk=7G=web.de=tachyon_gun@srs-se1.protection.inumbo.net>)
 id 1pc7pA-00031K-Dc
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 16:48:32 +0000
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c95ac23-c288-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 17:48:30 +0100 (CET)
Received: from [92.76.123.191] ([92.76.123.191]) by web-mail.web.de
 (3c-app-webde-bap40.server.lan [172.19.172.40]) (via HTTP); Tue, 14 Mar
 2023 17:48:29 +0100
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
X-Inumbo-ID: 0c95ac23-c288-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1678812509; i=tachyon_gun@web.de;
	bh=1gyTEBwowXM9aU/Q1z3YD+/W3CW+OHoWlIDPEz22018=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NesM+Qvs8ogHzSBxGf0Xkjspoih/jeCtWSAF18P+OW2VdXyq7nCPYIzKtfFVSYoDf
	 MBVBJiDkIw4xpLZQ1wXpCoqDfO5PusvV4b7OHHlJa7Kho64KCFQrYrH6pwIAVtSHjc
	 sGHjUHxm6soMWgBf/3jX8Al7SB1H4XgxlDxyTyziONlhTpYkwKkApAm1tjnk/Abxtd
	 IFCxMKN2NsTlNtlZ3PgXyDniBZNG71381acSQ8nAeh4xOOyA2Mp3vRrTkMOUhpxS13
	 ax+SyFRbCtD8BQHVz7P84E0IS467zt14xwhVsB16hOJzpcZ8/TVRWX26EHANA1P88L
	 h3iSwYrZ7yNOw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
MIME-Version: 1.0
Message-ID: <trinity-1d86f8fd-690a-4643-95e2-0f83d138c6ef-1678812509474@3c-app-webde-bap40>
From: Denis <tachyon_gun@web.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [help] Xen 4.14.5 on Devuan 4.0 Chimaera, regression from Xen
 4.0.1
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Mar 2023 17:48:29 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <e5a4689e-27e1-6992-65f8-c59b669aeaf1@citrix.com>
References: <trinity-8973751a-6742-4309-b02d-0b4c38f4206e-1678390468345@3c-app-webde-bap36>
 <84f66bc0-ae7c-febe-9a15-98453c48d051@citrix.com>
 <ce1a289e-6ed7-9b5c-42f5-069f16bd6984@suse.com>
 <trinity-429ff607-c131-4745-8c96-9d7f6f61234f-1678481409956@3c-app-webde-bs42>
 <31151e94-b8b3-15ab-3680-e1c6e2e97530@suse.com>
 <trinity-7e872635-20a4-4120-a08d-2d62a77d2da5-1678756503867@3c-app-webde-bs22>
 <2afa0abe-abe5-a3d8-658f-abc466d78101@suse.com>
 <trinity-7c345507-5695-4649-a62b-be4dd793cc00-1678805608384@3c-app-webde-bap40>
 <e5a4689e-27e1-6992-65f8-c59b669aeaf1@citrix.com>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:X87UN3AmoOOb8Kf/4vzGp1+OnanpyUXK0nZE4dQygLHIJw739iT+GprNFE2XG4ezxWL/j
 jv9/azPeEtD8i488qJtrny2YG9ASLds9zeuPIJwz6Ip8Wvh83BfFAbuxQyxsV3Dzv6bJ2FrSmEum
 sYqoVBNBCTIK2a2P6F0aT/8K/yVFkhEAKToqvYOct9DppI1sudFIgzSnbaZRZCddSNAIiPczzHnW
 l2U13OLBLybWrhG83tEtH7tvnzwBIV7hcxUFSRkI22SWnqjD1zczlBLMPBu4F+7ipMjseN0Vq/JZ
 tQ=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:v7NyQCeNBDU=;sarzqXg6rC/KoqtS0MgwuSh+qfN
 bLhkRpNLopj6o5xPUXv6T0oRcc6yxRzgnRh34hflXWW9x35X2BUQeHBB/XaZRoM8kkn9G4gR7
 xGnwGFFZCtnMmmRNfVDK/KGLWKT/L2EvEv5x0vQRySwJcbHX84i3d0/iz9/XPMCSgSjTNvl6u
 nOihSEArM4o5Yil9hwmisfMGvQgUnfUgZFDGZLmpgy6QczuR3m45JjnUSD3R3P994KN7nzy2p
 mgC3SjQT1AJ86ffl8moj4QB7Y5VhKoQ7VB0QvCQSjMjLdkH+CgF3UlYzncA/WgJyXAMTgUEFv
 XimEUFA7TRNm4ebgDTzSZHndnon3yY/AIKtB4y1JJiJWQNH24lFsx6AsHM1E5PDWv3RvnUsIH
 wH17npdkwFcq0HwIri4KYMNnL2LHxojBWqmhpcekphZfMYw1IfLxxVqVkPkonwr5A7qdzYbJq
 /yB36usYEHcxFLLiszAtREYJNOIYU0pF+3nUQhVW76nUna7TjLsD04cw4ilgJJnEaARJ6/yiy
 QcYygnDfPsU8g+rh7EspD6GMK48ee2N7ASX9XdmzhStnoC65EJcIXa7j/YWtmkdsD/aKrxdFD
 nsuCuON7t5buUNvS7ERoVC2XQXfn0ed9UCIl5MnDriX+iYBJ/4Hl8pNBMlw+qf/vqRSxarG1l
 Oie3RwJM8Ml48kMFTnv6zaKTBmiU+v3NTUMEe4oYPI1C82WSg3xCCeV/FRQyajpCVzoQg3fbJ
 udsY4SBQFCaRHzvmhhr9Pv7zkCWvPMnwA9O9ZuFcxygw7UkzaMHLOiyzPFkpCbJGFANMvT42j
 XRAMqfQZmMT1DtPyTohN319w==

On 14=2E03=2E2023 16:11, Andrew Cooper wrote:
> On 14/03/2023 2:53 pm, Denis wrote:
> > On 14=2E03=2E2023 07:37; Jan Beulich wrote:
> >> On 14=2E03=2E2023 02:15, Denis wrote:
> >>> On 13=2E03=2E2023 10:36, Jan wrote
> >>>> On 10=2E03=2E2023 21:50, Denis wrote:
> >>>>> Should I test something else?
> >>>> =2E=2E=2E there was no request for any further testing here, for th=
e moment=2E
> >>> ah=2E=2E=2Esorry, going by "Would be nice to have this confirmed for=
the system
> >>> in question, i=2Ee=2E without Xen underneath Linux" I thought I coul=
d test
> >>> something which might help shed some light on all of this=2E
> >> Well, yes, that Linux-without-Xen test would still be useful to have
> >> results from=2E I didn't account for this in my earlier reply because
> >> I had asked for it before already, and I did take "something else"
> >> for meaning anything that might have turned up as useful from the new
> >> data you had provided=2E
> > What tests could I do or what info should I provide to help?
>=20
> Can you please rebuild Xen with this patch:
>=20
> diff --git a/xen/drivers/passthrough/amd/iommu_acpi=2Ec
> b/xen/drivers/passthrough/amd/iommu_acpi=2Ec
> index 2fdebd2d74c9=2E=2E747eae25f56c 100644
> --- a/xen/drivers/passthrough/amd/iommu_acpi=2Ec
> +++ b/xen/drivers/passthrough/amd/iommu_acpi=2Ec
> @@ -1033,7 +1033,7 @@ static int __init parse_ivrs_table(struct
> acpi_table_header *table)
> =C2=A0=C2=A0=C2=A0=C2=A0 const struct acpi_ivrs_header *ivrs_block;
> =C2=A0=C2=A0=C2=A0=C2=A0 unsigned long length;
> =C2=A0=C2=A0=C2=A0=C2=A0 unsigned int apic;
> -=C2=A0=C2=A0=C2=A0 bool_t sb_ioapic =3D !iommu_intremap;
> +=C2=A0=C2=A0=C2=A0 bool_t sb_ioapic =3D 1;
> =C2=A0=C2=A0=C2=A0=C2=A0 int error =3D 0;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON(!table);
>=20
> which should cause the behaviour to revert back to that of Xen 4=2E0=2E1=
=C2=A0
> (i=2Ee=2E it will fully ignore the checks relating to the southbridge io=
apic)=2E
>=20
> Confirm that with this, and booting Xen simply with `iommu=3D1` that ful=
l
> DMA remapping and interrupt remapping is considered active=2E
>=20
>=20
> Then, can you play around with passing the soundblaster through to VMs=
=2E=C2=A0
> Looking at the LSPCI you provided, it only supports legacy line interrup=
ts=2E
>=20
> Does the device work fine, or do you get a bunch of errors on `xl dmesg`
> about IO page faults (which is a generic "IOMMU said no to something"
> message)?

Am I right to assume that I would need the source/header packages from=20
the Devuan 4=2E0 install and then re-compile Xen?

Denis

