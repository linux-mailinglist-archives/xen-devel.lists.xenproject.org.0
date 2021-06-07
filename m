Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A56239EA4E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jun 2021 01:45:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138204.255912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqOue-0001QX-9K; Mon, 07 Jun 2021 23:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138204.255912; Mon, 07 Jun 2021 23:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqOue-0001OI-64; Mon, 07 Jun 2021 23:44:08 +0000
Received: by outflank-mailman (input) for mailman id 138204;
 Mon, 07 Jun 2021 23:44:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AHWm=LB=onlineschubla.de=paul@srs-us1.protection.inumbo.net>)
 id 1lqOuc-0001Ny-KN
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 23:44:06 +0000
Received: from DEU01-FR2-obe.outbound.protection.outlook.com (unknown
 [40.107.135.122]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ca772771-8e3d-4d0f-bad5-4fed6e4e2c1f;
 Mon, 07 Jun 2021 23:44:05 +0000 (UTC)
Received: from FRYP281MB0582.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:45::10)
 by FRYP281MB0029.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:8::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.12; Mon, 7 Jun 2021 23:44:03 +0000
Received: from FRYP281MB0582.DEUP281.PROD.OUTLOOK.COM
 ([fe80::184f:c6ec:f202:bf2d]) by FRYP281MB0582.DEUP281.PROD.OUTLOOK.COM
 ([fe80::184f:c6ec:f202:bf2d%8]) with mapi id 15.20.4219.019; Mon, 7 Jun 2021
 23:44:03 +0000
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
X-Inumbo-ID: ca772771-8e3d-4d0f-bad5-4fed6e4e2c1f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zj3cZjaBXl++cXCSPl3InRJFB6+0miw/b5MWGI5xHIhseaeWc9222zXhfC7vpRYpzjha835yJtWfJTlxS+i2B1xDoiLBhYSyAw0k214m2guryylq9nvTExBRSIlF/acOybcSD2ScKDJTQmad9n+BEbIVqa9+7g34MKQJqMohYdnTlYyiX558GQ1GMjbWz7czn8nQh5TVUtP/VBuCju83D6xVXfpcnjpMkyUaZVhfsf+Vp57IgcgOIsVtg09Yv3XU4OpxnTTk+aOJN9ETMpsQWJ4bCSBhodf6zlx1WylzyggrFkDyTPo7aQooXcr/bNwh0UBngf5Y2ck8vKt94dZHFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hiBQufO8MgvLLqJIRMD1d8pqD6CWk9lLT4OPKl+Ag30=;
 b=DnnqKbYJzxUUT3hBFITyC/FVnHosjkCR7T71C7GrNJSXhlyA1M7Y1c4MozZ1l7oMIU23CkWSzQro65gh6ESGqQzleQY15gKMyBHjngg6EmI87bwH41LYW8sTH4wfKhav8Y4kvOAOSURWtTRAK8ilFgPYJh2MBuae5tSpmweu4HQ+QKDiTU/7Xn3y9THTMEcCUJwH5KWZGtS9D/BAthEEg+Isl9LKbFcjuLvIsSnbEoUYvP78riuIfEyex3O54RcJrPqSnp7UqSObO3VjDmx4Mh+NnsZZgTA3zmMhT2KhMiJvFjFs8QmX28DXeo5aiEGGVi4G84ItJCAb3YX3offg+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=onlineschubla.de; dmarc=pass action=none
 header.from=onlineschubla.de; dkim=pass header.d=onlineschubla.de; arc=none
From: Paul Leiber <paul@onlineschubla.de>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: [BUG] Passed through PCI devices lost after Windows HVM DomU reboot
Thread-Topic: [BUG] Passed through PCI devices lost after Windows HVM DomU
 reboot
Thread-Index: Addb9FwKHMmb5HghTwunCUNmuZyBkw==
Date: Mon, 7 Jun 2021 23:44:03 +0000
Message-ID:
 <FRYP281MB05828EB0C49C963C7954578CB0389@FRYP281MB0582.DEUP281.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=onlineschubla.de;
x-originating-ip: [2003:d2:1f0a:31f0:dbf:c2a2:7af5:e43e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34cf2b31-0a79-4204-ce82-08d92a0e21f3
x-ms-traffictypediagnostic: FRYP281MB0029:
x-microsoft-antispam-prvs:
 <FRYP281MB00296CDB79EA95C351A7900CB0389@FRYP281MB0029.DEUP281.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 MPaxBgo9BKcP6uB52XgoDjaZlmNhrblRdxIQqj3Ufj44ggWz/3vSaSuayw9ffziHcyPLtEjXlCe1ylwD7/JLcF1qiLutcYHa6FYPWiDQqZO0aIaW0Pw2PWOdcDbvtF50tdQH40FYoG5mUmbf8CTGX/BYdIHNBUO7eLdruZUMe/X7Ud8viB/FDnjx+DVY3ZMopu5xkqV95LHt11RFxM5F7JeP7JvPwW1Y23ATx4Onbtj1Ic7CotzoiDvaUQpWKR9hhng7BL7qDqLxsNOBVHn1SCmnBXkEoqAulH+/oAH9ROf2YxghEviq8R6FAbjncIjIFi5EVKJP1py6laQx1yArNWok5YxKS0cfogUmrzFTwMBZcrDEmakefJhQhy6P2b/oLBIoQLkHw4ms2a9B9k1gSes2uLQCNNE3BYtAWtIQWHRzGJi+9udY83CNyYMe5D78r0wyEDnnki1P5ufaEic6K4LPU522271G7wn2nQ6z++9KqMUjX/W9GXAdbeNwtR5u3vYxmJiGkWiCntnQX9Rp61wlR50e0ncZr26iOKFy/3VN5ady1H+vOlkHhlt431LF6zDq/k5TdfmsRTNEiak/qIo/02H3AbQ7YPc7AymzfWZtZlDYM+oDoTzW6Twb1iK8HJ40hZVvX+heN7zxMMIoyY5M5Z+qplcIkfSBVqN1Nh1jL6FZFD/YHjTv1ZXYyKGa1MQfuqpDdLbzy/HuMAxKBxVLpngkvu6ZQSxw2jhmyNemz94NKeOTBF4STBWTdTttFkOCQ/s/r9k/3HMjTFca4w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRYP281MB0582.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(366004)(376002)(346002)(39830400003)(396003)(136003)(9686003)(966005)(5660300002)(6916009)(55016002)(33656002)(66476007)(186003)(66556008)(71200400001)(6506007)(52536014)(83380400001)(30864003)(8936002)(8676002)(38100700002)(76116006)(2906002)(7696005)(478600001)(66946007)(86362001)(316002)(122000001)(66446008)(64756008)(21314003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?LiNRoJGIoynE740CTgx4Ja1IBdbpctNyyQ1G11cwKzGdC9i7NIbR/SI/bGaD?=
 =?us-ascii?Q?S3iUmmbsWqO+5pq3PmhNOc6YiauI3lh8fbXcYXWUBXTJgLVxMYN38bPktFp1?=
 =?us-ascii?Q?9lgPNTdENqjbXn5YW08tkg5KduU/PqSbdfBwHw9bCDzYsw1d1Iu65w1iEPD2?=
 =?us-ascii?Q?XGzDqFTL4D+Pp8+EiLXmTVQEYo+1rBjMH3KMoGxRhjDJ89dsXgElLrJvOiHo?=
 =?us-ascii?Q?bAlUWR5Wadf551WcNzEl7zSXhG1K7v//7b7IV6kxhP581VHre0vxyz6MpqTO?=
 =?us-ascii?Q?SmLkXzWm83SOKJsimm1mg399PMi+91NFzP4erS5mALZW+uHkaKurzwqZ0dbV?=
 =?us-ascii?Q?K0F3EOJozhgZfICjW3K1lm+QR9jBkIloSpwawwZjtB+djBrHRM5vvbPVShD/?=
 =?us-ascii?Q?v78TrLwz5k9lOkTsYutIrMbz4MnstIGgS5wCXTOm/qKD7JJy1es4cXVMqtRV?=
 =?us-ascii?Q?FmUzjdCG+LGLLsgc8YmTv95sK8tMUR2Rx1vSguvG8TjSruJY6HykOs2ERVJb?=
 =?us-ascii?Q?uM4U9ZozutHVl2MZoCGJAVX5kiyWkb6UNoMdXJ7WmEDPyMzdDHJi8OOHSRgu?=
 =?us-ascii?Q?wU3ux7aqCrg5bf9xrlTmhwMterf551H4SA6vRyGj5qLfngTlFpgPyWL02AyH?=
 =?us-ascii?Q?C9MtuaSRkvHTPTAZgPWQPhf6RNVuV7dPn9vRcptfvgbylYKjkbq/UJUTo4nW?=
 =?us-ascii?Q?I41Y78X3ALb90n30mgrxnYtHm1rsez5uRktSXp2ZSCTAeJ1VE6HgZGhs/gE5?=
 =?us-ascii?Q?AJWYpOhgwIUhSUj84DOr1F2tRd+PieVxyPxULfJlTJl3MTEAAZrPQ88Yhsbj?=
 =?us-ascii?Q?vR0poU+tmCWdFPgCQHIfAttJLRByo4YRQNkHJQD9tu16PqWvY6ddESTfs+ax?=
 =?us-ascii?Q?DL7rRxN2gNxfA14Buyk9z+F09jUtcmyN5upmB6+P0Z71YHnBmxmpXZvgnJSF?=
 =?us-ascii?Q?2mBtlgBmb77sfiipSDR7d75p6mNO7uQAYE7ui61XbeDRnNcS/SStjeHsov+7?=
 =?us-ascii?Q?lPo485PZ8KTaQ6xbRpIr/RDfIP4a/ci2axO6rBlyTcvGojutNptlrmK09AOL?=
 =?us-ascii?Q?GLdmvfUUoQ1lCvFslT7yUt1tq+thY0Wk0lFOXPDYLBaZ1f8LO39ZjVWve3s5?=
 =?us-ascii?Q?xHRBpXGD+QYvlQIXJaG7RT4oIw87NQkeuk94IkZcJyUt4+T1nTRO5VwC5RH1?=
 =?us-ascii?Q?2nyY09PHaAfUiETVyXLMMHgcVzQSnGp445RMGBe3E1m1F07F3xazioWblbpy?=
 =?us-ascii?Q?2xPs1y8mz7ImcyNUz6NizppY2a2Qoywsd7pZqG7Hz2jkMvAh14t8Yy9RNin5?=
 =?us-ascii?Q?5V2u/BagtrAM8PRshWCi1VgEdym3i0/Q4ICRcXxg2kyZmhCMmp6RBMvh/XKn?=
 =?us-ascii?Q?qXmLvew=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: onlineschubla.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FRYP281MB0582.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 34cf2b31-0a79-4204-ce82-08d92a0e21f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2021 23:44:03.6045
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bfc8b046-4d00-4e98-8679-43c06bdec9db
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7REWdT1lZDwdTOHOND8kuT1VO5/Z7LiKgny/bSM1c7B0T7FTPHpZJCgqAbnvfETmcu5321gikph7qTd75CSPfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRYP281MB0029

Dear developers,

I  am a mostly very happy Xen beginner. My Debian PV DomUs work like a char=
m out of the box. The only remaining Windows instance is a MediaPortal TV S=
erver backend on Windows Server 2012 HVM DomU. But I have problems with rel=
iably passing through PCIe cards to this Windows HVM DomU. Further testing =
has lead me to the suspicion that there might be a bug where PCI passthroug=
h does not work after a Windows DomU reboot.

Please be patient with me if am not reporting this bug as is custom, this i=
s my first official bug report ever. (If it is indeed a bug.)

Background: I am running a standard apt-get Xen installation based on Debia=
n Buster.  My hardware is a Fujitsu D3417-B1 with an Intel Xeon CPU E3-1235=
L v5, 32 GB ECC RAM, and a Hauppauge HVR-2205 TV tuner card. For getting PC=
I passthrough to work, I needed to set "permissive=3D1" and limit the Dom0 =
memory size. I then could pass through the PCIe TV tuner card without any p=
roblem to my Windows Server 2012 DomU. It got detected and worked very well=
 in the Windows DomU. However, sometimes the card somehow got "lost" in the=
 DomU, i. e. it disappeared from device manager and wasn't functional anymo=
re. I then could reattach it to the DomU with "xl pci-attach". My TV softwa=
re (MediaPortal) then seemed to recognize a new PCIe card instance (e. g. a=
n internal id number of the tuner card was incremented). I then needed to r=
eapply some settings. Other than that, the card was fully functional.

After more testing, I have come to the following conclusion: It seems that =
every time I do a _reboot_ from within a Windows DomU, the PCI device does =
not get attached to the DomU. After DomU reboot, it is immediately availabl=
e for attachment in the Dom0 when I check for it with "xl pci-assignable-li=
st", and I can reattach it to the DomU with "xl pci-attach" without any maj=
or problems beside some annoying side effects (e. g. need to reapply settin=
gs). If I _shut down_ the DomU from within the DomU (with Windows shutdown =
mechanism) or the Dom0 (with "xl shutdown) and restart the DomU with "xl cr=
eate", the PCIe device gets attached automatically at DomU boot and unwante=
d side effects do not occur.

What I would expect is that the passed through PCIe device is available in =
my Windows DomU after each reboot (e. g. after Windows Update automatically=
 installs patches and reboots).

Steps which I can take to provoke the unwanted behavior:
1. Install Xen on Debian Buster following mostly https://wiki.xenproject.or=
g/wiki/Xen_Project_Beginners_Guide
2. Set up PCI passthrough following mostly https://wiki.xenproject.org/wiki=
/Xen_PCI_Passthrough (see additional details below)
3. Set up a Windows Server 2012 HVM (cfg below)
4. Start Windows Server 2012 HVM with "xl create /etc/xen/matrix.cfg", conn=
ect with Windows HVM via VNC for installation and initial settings, then vi=
a RemoteDesktop
5. Check for PCIe device in Windows Device Manager: it is available
6. Initiate reboot in Windows (Go to Server Manager -> local server -> rebo=
ot)
7. Connect with rebooted Windows via RemoteDesktop
8. Check for PCIe device in Windows Device Manager, it is not available
9. Check for PCIe device in Dom0 with " xl pci-assignable-list", it is avai=
lable for passthrough
10. Attach the PCIe device to the Windows DomU, e.g. via "xl pci-attach 9 0=
1:00.0"
11. Check for PCIe device in Windows Device Manager, it is available again
12. Repetition is possible by skipping to step 6

The xl log for a normal cold start (PCIe device attached normally) looks li=
ke this:
Waiting for domain matrix (domid 10) to die [pid 3910]

The log after a reboot (PCIe device not attached automatically) looks like =
this:
Waiting for domain matrix (domid 8) to die [pid 3113]
Domain 8 has shut down, reason code 1 0x1
Action for shutdown reason code 1 is restart
libxl: warning: libxl_domain.c:1739:libxl_retrieve_domain_configuration: Do=
main 8:Device present in JSON but not in xenstore, ignored
Domain 8 needs to be cleaned up: destroying the domain
Done. Rebooting now

Searching for this exact error message ("Device present in JSON but not in =
xenstore, ignored"), I found the following quite old bug report which sound=
s suspiciously similar to my experience, only for PV DomUs:
https://bugzilla.redhat.com/show_bug.cgi?id=3D233801

Additional information which might be helpful:
- I could reproduce this behavior with two different TV tuner cards from di=
fferent manufacturers (Hauppauge HVR-2205 or Digital Devices Max M4) and a =
network card (Intel 82574L)
- I tested the behavior with a fresh install of Windows 10, with the same r=
esults.
- I used the Hauppauge PCIe card in a linux PV DomU (with VDR software) whe=
re the card was attached very reliably - as far as I can remember, there wa=
s only one occurrence of a not working TV card, but I can't remember the de=
tails (i. e. if there was a preceding reboot).
- The unwanted behavior did not occur with the bare metal system before I s=
witched to Xen, i. e. Windows Server 2012 running directly on the hardware =
and the Hauppauge PCIe card.

A description of my problem (which was a little bit less detailed) on the X=
en Users mailing list did not get a reply, therefore I am turning to the de=
veloper mailing list. Could anybody on this list please give me advice on w=
hat I can do solve this issue? Any more information you need to help me or =
any more testing I could do?

Thanks in advance,

Paul



Additional information:


While trying to fix this, I changed kernel boot parameters. I figured out t=
hat giving kernel boot option " xen-pciback.hide" is not necessary as the d=
river is not built into the kernel, therefore I changed the parameters from
	dom0_mem=3D1024M,max:1024M xen-pciback.hide=3D(01:00.0)
to the currently used parameters:
	dom0_mem=3D1024M,max:1024M


The Digital Devised PCIe device is assigned to xen-pciback via /etc/modprob=
e.d/xen-pciback.conf. There is no  driver on the Dom0 for the tuner card, t=
herefore no precautions for not loading other drivers are necessary:
	options xen-pciback hide=3D(0000:01:00.0)


The Hauppauge card needs an additional line for preventing loading the driv=
er in Dom0:
	install saa7164 /sbin/modprobe xen-pciback ; /sbin/modprobe --first-time -=
-ignore-i$
	options xen-pciback hide=3D(0000:01:00.0)


While doing trial and error, I changed the pci line in the Xen config file,=
 but adding " power_mgmt=3D1" and "seize=3D1" didn't change the behavior:
	pci=3D['01:00.0,permissive=3D1,power_mgmt=3D1,seize=3D1']


Xen config file for the Windows domU (besides the above mentioned changes i=
n the line pci=3D[...], there were some probably minor changes between firs=
t installation and the current status, e. g. I started with VNC and later s=
witched to SPICE):

# kernel =3D "/usr/lib/xen-4.0/boot/hvmloader"
type=3D'hvm'
memory =3D 4096
vcpus=3D2
name =3D "matrix"
vif =3D ['bridge=3Dxenbr0,mac=3D00:16:3E:54:A8:2B']
disk =3D ['phy:/dev/vg0/matrix,hda,w','phy:/dev/vg0/compudms-data,hdb,w']
device_model_version =3D 'qemu-xen'
boot=3D"c"
hdtype =3D 'ahci'
acpi =3D 1
apic =3D 1
xen_platform_pci =3D 1
vendor_device =3D 'xenserver'
#  PCI Passthrough
pci=3D['01:00.0,permissive=3D1,power_mgmt=3D1']
viridian =3D 1
stdvga =3D 1
sdl =3D 0
serial =3D 'pty'
usb =3D 1
usbdevice =3D 'tablet'
keymap =3D 'de'
# SPICE
spice=3D1
spicehost=3D'0.0.0.0'
spiceport=3D6000
# spicedisable_ticketing enabled is for no spice password, instead use spic=
epasswd
spicedisable_ticketing=3D1
#spicepasswd=3D"test"
spicevdagent=3D1
spice_clipboard_sharing=3D1
# this will automatically redirect up to 4 usb devices from spice client to=
 domUs
#spiceusbredirection=3D4
# This adds intel hd audio emulated card used for spice audio
soundhw=3D"hda"


xl info:

host                   : xxx
release                : 4.19.0-14-amd64
version                : #1 SMP Debian 4.19.171-2 (2021-01-30)
machine                : x86_64
nr_cpus                : 4
max_cpu_id             : 3
nr_nodes               : 1
cores_per_socket       : 4
threads_per_core       : 1
cpu_mhz                : 1992.100
hw_caps                : bfebfbff:77faf3ff:2c100800:00000121:0000000f:009c6=
fbf:00000000:00000100
virt_caps              : hvm hvm_directio
total_memory           : 32542
free_memory            : 20836
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 11
xen_extra              : .4
xen_version            : 4.11.4
xen_caps               : xen-3.0-x86_64 xen-3.0-x86_32p hvm-3.0-x86_32 hvm-=
3.0-x86_32p hvm-3.0-x86_64
xen_scheduler          : credit
xen_pagesize           : 4096
platform_params        : virt_start=3D0xffff800000000000
xen_changeset          :
xen_commandline        : placeholder dom0_mem=3D1024M,max:1024M
cc_compiler            : gcc (Debian 8.3.0-6) 8.3.0
cc_compile_by          : pkg-xen-devel
cc_compile_domain      : lists.alioth.debian.org
cc_compile_date        : Fri Dec 11 21:33:51 UTC 2020
build_id               : 6d8e0fa3ddb825695eb6c6832631b4fa2331fe41
xend_config_format     : 4


lspci -vvv (excerpt)

01:00.0 Multimedia controller: Digital Devices GmbH Device 000a
        Subsystem: Digital Devices GmbH Device 0050
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-=
 Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <T=
Abort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 18
        Region 0: Memory at f7200000 (64-bit, non-prefetchable) [size=3D64K=
]
        Capabilities: [50] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA PME(D0-,D1-,D2=
-,D3hot-,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [70] MSI: Enable- Count=3D1/1 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [90] Express (v2) Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s <64n=
s, L1 <1us
                        ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- Slo=
tPowerLimit 0.000W
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsup=
ported-
                        RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- Tr=
ansPend-
                LnkCap: Port #0, Speed 2.5GT/s, Width x1, ASPM L1, Exit Lat=
ency L0s unlimited, L1 unlimited
                        ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+ DLA=
ctive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Range A, TimeoutDis+, LTR-, OB=
FF Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR=
-, OBFF Disabled
                LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- Speed=
Dis-
                         Transmit Margin: Normal Operating Range, EnterModi=
fiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB, EqualizationCompl=
ete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-, LinkEqua=
lizationRequest-
        Capabilities: [100 v1] Vendor Specific Information: ID=3D0000 Rev=
=3D0 Len=3D00c <?>
        Kernel driver in use: pciback


Xenstore-ls -fp (excerpt)

/libxl/10 =3D ""   (n0)
/libxl/10/device =3D ""   (n0)
/libxl/10/device/vbd =3D ""   (n0)
/libxl/10/device/vbd/768 =3D ""   (n0)
/libxl/10/device/vbd/768/frontend =3D "/local/domain/10/device/vbd/768"   (=
n0)
/libxl/10/device/vbd/768/backend =3D "/local/domain/0/backend/vbd/10/768"  =
 (n0)
/libxl/10/device/vbd/768/params =3D "/dev/vg0/matrix"   (n0)
/libxl/10/device/vbd/768/script =3D "/etc/xen/scripts/block"   (n0)
/libxl/10/device/vbd/768/frontend-id =3D "10"   (n0)
/libxl/10/device/vbd/768/online =3D "1"   (n0)
/libxl/10/device/vbd/768/removable =3D "0"   (n0)
/libxl/10/device/vbd/768/bootable =3D "1"   (n0)
/libxl/10/device/vbd/768/state =3D "1"   (n0)
/libxl/10/device/vbd/768/dev =3D "hda"   (n0)
/libxl/10/device/vbd/768/type =3D "phy"   (n0)
/libxl/10/device/vbd/768/mode =3D "w"   (n0)
/libxl/10/device/vbd/768/device-type =3D "disk"   (n0)
/libxl/10/device/vbd/768/discard-enable =3D "1"   (n0)
/libxl/10/device/vbd/832 =3D ""   (n0)
/libxl/10/device/vbd/832/frontend =3D "/local/domain/10/device/vbd/832"   (=
n0)
/libxl/10/device/vbd/832/backend =3D "/local/domain/0/backend/vbd/10/832"  =
 (n0)
/libxl/10/device/vbd/832/params =3D "/dev/vg0/compudms-data"   (n0)
/libxl/10/device/vbd/832/script =3D "/etc/xen/scripts/block"   (n0)
/libxl/10/device/vbd/832/frontend-id =3D "10"   (n0)
/libxl/10/device/vbd/832/online =3D "1"   (n0)
/libxl/10/device/vbd/832/removable =3D "0"   (n0)
/libxl/10/device/vbd/832/bootable =3D "1"   (n0)
/libxl/10/device/vbd/832/state =3D "1"   (n0)
/libxl/10/device/vbd/832/dev =3D "hdb"   (n0)
/libxl/10/device/vbd/832/type =3D "phy"   (n0)
/libxl/10/device/vbd/832/mode =3D "w"   (n0)
/libxl/10/device/vbd/832/device-type =3D "disk"   (n0)
/libxl/10/device/vbd/832/discard-enable =3D "1"   (n0)
/libxl/10/device/console =3D ""   (n0)
/libxl/10/device/console/0 =3D ""   (n0)
/libxl/10/device/console/0/frontend =3D "/local/domain/10/console"   (n0)
/libxl/10/device/console/0/backend =3D "/local/domain/0/backend/console/10/=
0"   (n0)
/libxl/10/device/console/0/frontend-id =3D "10"   (n0)
/libxl/10/device/console/0/online =3D "1"   (n0)
/libxl/10/device/console/0/state =3D "1"   (n0)
/libxl/10/device/console/0/protocol =3D "vt100"   (n0)
/libxl/10/device/vkbd =3D ""   (n0)
/libxl/10/device/vkbd/0 =3D ""   (n0)
/libxl/10/device/vkbd/0/frontend =3D "/local/domain/10/device/vkbd/0"   (n0=
)
/libxl/10/device/vkbd/0/backend =3D "/local/domain/0/backend/vkbd/10/0"   (=
n0)
/libxl/10/device/vkbd/0/frontend-id =3D "10"   (n0)
/libxl/10/device/vkbd/0/online =3D "1"   (n0)
/libxl/10/device/vkbd/0/state =3D "1"   (n0)
/libxl/10/device/vif =3D ""   (n0)
/libxl/10/device/vif/0 =3D ""   (n0)
/libxl/10/device/vif/0/frontend =3D "/local/domain/10/device/vif/0"   (n0)
/libxl/10/device/vif/0/backend =3D "/local/domain/0/backend/vif/10/0"   (n0=
)
/libxl/10/device/vif/0/frontend-id =3D "10"   (n0)
/libxl/10/device/vif/0/online =3D "1"   (n0)
/libxl/10/device/vif/0/state =3D "1"   (n0)
/libxl/10/device/vif/0/script =3D "/etc/xen/scripts/vif-bridge"   (n0)
/libxl/10/device/vif/0/mac =3D "00:16:3e:54:a8:2b"   (n0)
/libxl/10/device/vif/0/bridge =3D "xenbr0"   (n0)
/libxl/10/device/vif/0/handle =3D "0"   (n0)
/libxl/10/device/vif/0/type =3D "vif_ioemu"   (n0)
/libxl/10/device/pci =3D ""   (n0)
/libxl/10/device/pci/0 =3D ""   (n0)
/libxl/10/device/pci/0/frontend =3D "/local/domain/10/device/pci/0"   (n0)
/libxl/10/device/pci/0/backend =3D "/local/domain/0/backend/pci/10/0"   (n0=
)
/libxl/10/device/pci/0/frontend-id =3D "10"   (n0)
/libxl/10/device/pci/0/online =3D "1"   (n0)
/libxl/10/device/pci/0/state =3D "1"   (n0)
/libxl/10/device/pci/0/domain =3D "matrix"   (n0)
/libxl/10/device/pci/0/key-0 =3D "0000:01:00.0"   (n0)
/libxl/10/device/pci/0/dev-0 =3D "0000:01:00.0"   (n0)
/libxl/10/device/pci/0/vdevfn-0 =3D "48"   (n0)
/libxl/10/device/pci/0/opts-0 =3D "msitranslate=3D0,power_mgmt=3D1,permissi=
ve=3D1"   (n0)
/libxl/10/device/pci/0/state-0 =3D "1"   (n0)
/libxl/10/device/pci/0/num_devs =3D "1"   (n0)
/libxl/10/type =3D "hvm"   (n0)
/libxl/10/dm-version =3D "qemu_xen"   (n0)


