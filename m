Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4961B80B1
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 22:30:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jS4xU-0003Q4-7x; Fri, 24 Apr 2020 20:30:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jla4=6I=nxp.com=andrei.cherechesu@srs-us1.protection.inumbo.net>)
 id 1jS4xS-0003Pz-7j
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 20:29:58 +0000
X-Inumbo-ID: 5b5f1fd0-866a-11ea-9e09-bc764e2007e4
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.49]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b5f1fd0-866a-11ea-9e09-bc764e2007e4;
 Fri, 24 Apr 2020 20:29:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Id7UHRY36KSui1J+eVFt712qXx642MwW+Iha4V3NISIJdDWPfbj8P2XKF9RBIbHsjH6H2oXiaanq1CM9z2MwIcrR8UTCC9G471O+4JH0AvU+F906tIQyvWLNtAMdlvgxHhhvUfrUSkaTPO0hZrjUITkFJ4FDH+13CgwmV02Hi2caVfGjhZtMiMugYKNHaIcTJA4r8kFi6Z0odt9924QQk/N7O4OPhuQN8H4IXArQiu3h5uDhPmr1wKzvE98k2agUhEXYykmsAcqnP2bitXWmUg1S5ex0a5JAZEWm7RpyhIUN5YjwGkNAsAqESF9UnfGEgEIWlAHuSnuS8WAuFhMGvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qm/PBDohmG5CFOQupDFGRlbnhPnzF9MU27NvNwOhObw=;
 b=mlakdOeFMhlAtl+xXX0fX0FTKeTBlfu6ifurXIyLr7+nOBkvFR1opcgzOmT6FP2W9laexneGg2lqn2WDaEsvRyeS2++3FH1mTmnLI74S3g1/xYo/wGbNZ7ZrYLl28IqLa52W7YQxlKad2ZYtgBcdKF3Q24egWo72sgfEk2BY59y5GGVXxNkhp1vX0exKzSD/lIhVFfQr+8lLUiWm033EWRyrlPNGRiZf8hU5si5XADbjjHviE8nqXDzj2lMbTWWx4v4GhAcvk8Trvrl0dTZ6Emm2yA/8cdzXdbZWFnCRSvg3Vt5RimXB0sD1+l/2iTQ8bRFZKIUC8T9PJAxMhDm+JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qm/PBDohmG5CFOQupDFGRlbnhPnzF9MU27NvNwOhObw=;
 b=NO3DqQDkTCzLQbQ0QL6I+CnlpLj/JssjlFiJxRGt0kPOTyb87zRz3zkpQT3LwQyeYtXcOuGG4YjON1xgAq2AjA0oRnFdsOPvuncoJJVkokUOQQKz028DBfr8r2sHd6MaOeVsw5lyXidjhE2QGaVXUIuaPA6ZG2cy+hznbXakKog=
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com (2603:10a6:803:5a::13)
 by VI1PR04MB4302.eurprd04.prod.outlook.com (2603:10a6:803:3f::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Fri, 24 Apr
 2020 20:29:53 +0000
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::3caf:57a5:e39f:d13b]) by VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::3caf:57a5:e39f:d13b%6]) with mapi id 15.20.2937.020; Fri, 24 Apr 2020
 20:29:53 +0000
From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: arm: DomU Networking enable leads to Dom0 kernel oops
Thread-Topic: arm: DomU Networking enable leads to Dom0 kernel oops
Thread-Index: AdYaclAiZQv5zvC+SH+brmHp3N+n3w==
Date: Fri, 24 Apr 2020 20:29:53 +0000
Message-ID: <VI1PR04MB505620B32C8289C6106D0B2AF9D00@VI1PR04MB5056.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=andrei.cherechesu@nxp.com; 
x-originating-ip: [78.97.145.157]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 90195d6f-4cd6-41ad-c4ad-08d7e88e3ed7
x-ms-traffictypediagnostic: VI1PR04MB4302:
x-microsoft-antispam-prvs: <VI1PR04MB430218C9D6ACE214575EBA78F9D00@VI1PR04MB4302.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 03838E948C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5056.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39860400002)(376002)(396003)(136003)(366004)(4326008)(6506007)(66476007)(76116006)(66446008)(186003)(64756008)(9686003)(478600001)(66556008)(5660300002)(33656002)(966005)(44832011)(2906002)(71200400001)(86362001)(55016002)(66946007)(8676002)(110136005)(81156014)(316002)(8936002)(26005)(9326002)(52536014)(7696005)(10126625002);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: duPTUTJfC8dXdq0OIBuPFxsnh7XKCH0h2nnR9gJ5awUWUYBGe/va9i4uVbIja36wLsB7O/RHhL3xvXvmULpY3SlNFHQKdQklWNpBsUihy73ia8DbRGblwL0T8OGFABtayKp4IYPRJ/tYYn9VIlXxCSAcHAuCcG/i+Wj01QZPOYAHmKSK70V1VvtVirbT87FbgyMANGY8SbHP8PylQYjXY/eWNNeUtLQBedm0s6j9OUx6W67ziwKkdqOd04hY4f2kDQ9EazUlC9BmFWRH/VdCYv++SrVczxtYabWOOshIaeFRQU9ipf3LT5CwpIhJaEUab3MVeBUOY2RcGI7GJhE46EQoYu0iZhPck5WHDBzk3ybtWHR4MDGSldIzZYwH0YpZ4uTsSiVJk2uAeS+tadvzV38CXtjJN+//oJkN5rfZfOEe2adiJha6OuHFFEzexkI1E8oj5nglQLzV4rHSr1A4T8U4krfbZCcVL84oN0Q86w0+AX5pEaojtydP+Va885zr0l2xGmU0V0kYjfK8Nht5bajtlyR0ppkimv2jD/lro5nyIEUJonNBvIutI3yrq1hzRpERIiV1cYDq2Wc2pmrwuw==
x-ms-exchange-antispam-messagedata: MKw+eGB/H1xYuWfnoQ5oC+CgLZawuRxr4gQXj93ulWAm8dcuAohBV4Hx8Cokg9HFu3slnGkC+85MFjCerV8KGuBMyyr8gWgpfJy8Hyy7PJMNSCRGUKAjeU4ihOMyOzHEtzCITMBS3AwQR1IKBclkSV1nFcdxPOvZfVk+zB2D2l7SXW/UwgkpKovumGWCNodHoWM9abZ20YkfYkHxOWib2Y+UzX6ap1tYE6adnf1klXMDCvkBc3Mp2pU2U+OJa0w8RhlAgstcf82HhMRwisyuSMUBQRm2mWvVn3FuHWHay2HgacQii6JBhmWO5I1oQPkq7eMh/EavDRx463M/dK4MBbLtGS3HGh5jJIjD2kxEO1yLKXnUPGbxrHyvNz9OfqbaDyyU537yJ0p23a/q33VdXj+5fkTtwfzFR2Zve5WBEGf4lK3Cj3ICl5OGdvaetmT9oDW+WVUxKVrIFFVjrTf93hrO4FhE7uJIE21ErAls7YiclZYrBK955BBxJvyH3aKwBV10FxZOAQ2dUV1DR73jh6ReCgQV6qabZWBa4OzPC/8xMVv7kxsMUXxhlQCW5gPfndqXjaQKvGerDWuPBdUA3SfaVoegia5vFNX2xzqBmYBk03G79NA4VpQ+Zw0vKg6caNhZLjNz+Dg8VyJXAmyxwkIPzSphvWLPLSg/hXFJpdzSnALu7rBvLe1HpBO2VsMDfs55xcdFo3eKcMKSKHyj6ICRmvr+lHBDAhRejYZw/k/WZ3E8se3bBd3MAuLfIeQM04SpJE5VbWG7iKS5BUJepBQoeBP2wWJZUWad3zsYgg8=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_VI1PR04MB505620B32C8289C6106D0B2AF9D00VI1PR04MB5056eurp_"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90195d6f-4cd6-41ad-c4ad-08d7e88e3ed7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2020 20:29:53.2563 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WNni15NphuuEGLk46XPSyn6vGWFirHiwkg3CzkMRKjZ01jMKo1Mz4TEm3k4uVZfW2qQtRwWHfDdnOIk68edmRr4uXQJYIFLowMWaXccEzhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4302
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--_000_VI1PR04MB505620B32C8289C6106D0B2AF9D00VI1PR04MB5056eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

Recently I've been trying to enable the networking in a conventional DomU (=
not dom0less).
The approach I used was the one described here: https://wiki.xen.org/wiki/X=
en_Networking#Bridging.

But when I use xl to create DomU, I get a Kernel OOPS in Dom0. The setup is=
 still responsive after this
and DomU boots successfully. However, if I try to enable `eth0` in DomU (us=
ing ip link dev set eth0 up),
I get a Kernel Panic in Dom0.

Here are the complete steps:

  1.  Boot Dom0 and configure bridge:
     *   brctl addbr xenbr0
     *   brctl addif xenbr0 eth0
     *   ip link set dev xenbr0 up
     *   ip link set dev eth0 up
     *   dhclient xenbr0



  1.  ifconfig xenbr0 (ping 8.8.8.8 works):
xenbr0    Link encap:Ethernet  HWaddr B2:62:37:C9:BB:D7
          inet addr:192.168.0.185  Bcast:192.168.0.255  Mask:255.255.255.0
          inet6 addr: fe80::b062:37ff:fec9:bbd7/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:703 errors:0 dropped:0 overruns:0 frame:0
          TX packets:27 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:88213 (86.1 KiB)  TX bytes:3088 (3.0 KiB)


  1.  ifconfig eth0:
eth0      Link encap:Ethernet  HWaddr B2:62:37:C9:BB:D7
          inet6 addr: fe80::b062:37ff:fec9:bbd7/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:1535 errors:0 dropped:2 overruns:0 frame:0
          TX packets:43 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:450476 (439.9 KiB)  TX bytes:4248 (4.1 KiB)
          Interrupt:59 Base address:0xc000


  1.  Add bridge to DomU config file:
vif =3D [ 'bridge=3Dxenbr0' ]


  1.  root@s32g274aevb-Dom0:~# xl create /etc/xen/domU1.cfg
After this I get the Kernel OOPS, because of a failed memory
access
[  413.367873] Unable to handle kernel paging request at virtual address 00=
0006c000020070
In
               [  413.548189]  xenvif_rx_ring_slots_available+0x40/0xa0 [xe=
n_netback]

The full log is attached at [0]<https://pastebin.com/sJLfd4gL>.
Using gdb, I found out that the access corresponds to the following source =
code lines:
               =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
               (gdb)  l *xenvif_rx_ring_slots_available+0x40
0x65b0 is in xenvif_rx_ring_slots_available (/usr/src/kernel/include/linux/=
skbuff.h:4084).
4082      static inline bool skb_is_gso(const struct sk_buff *skb)
4083      {
4084                     return skb_shinfo(skb)->gso_size;
4085      }
                              =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


  1.  DomU boots, and then: root@s32g274aevb-DomU1:~# ip link set dev eth0 =
up

After this, I get a kernel panic in Dom0 because of another failed memory
access
               [ 5338.574809] Unable to handle kernel paging request at vir=
tual address 000000c0ffff0028
in
               [ 5338.753128]  xenvif_tx_build_gops+0x528/0xef8 [xen_netbac=
k]

               The full log is attached at [1]<https://pastebin.com/iaF1q3U=
M>.
               Using gdb again, I found out the corresponding source code:
                              =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
(gdb) l *xenvif_tx_build_gops+0x528
0xce8 is in xenvif_tx_build_gops (/usr/src/kernel/include/linux/skbuff.h:12=
72).
1269      #ifdef NET_SKBUFF_DATA_USES_OFFSET
1270      static inline unsigned char *skb_end_pointer(const struct sk_buff=
 *skb)
1271      {
1272                     return skb->head + skb->end;
1273      }
                              =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Do you have any idea why this occurs? Have I misconfigured anything?

I've also tried to pass a static IP configuration for DomU in the config fi=
le,
and because it automatically enables eth0 at boot time, I no longer get the
oops, but a panic directly.

Thank you very much for your help,
Andrei Cherechesu,
NXP Semiconductors

--_000_VI1PR04MB505620B32C8289C6106D0B2AF9D00VI1PR04MB5056eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1783960777;
	mso-list-type:hybrid;
	mso-list-template-ids:183803794 422091018 67698689 67698715 67698703 67698=
713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-weight:bold;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Recently I&#8217;ve been trying to enable the networ=
king in a conventional DomU (not dom0less).<o:p></o:p></p>
<p class=3D"MsoNormal">The approach I used was the one described here: <a h=
ref=3D"https://wiki.xen.org/wiki/Xen_Networking#Bridging">
https://wiki.xen.org/wiki/Xen_Networking#Bridging</a>.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">But when I use xl to create DomU, I get a Kernel OOP=
S in Dom0. The setup is still responsive after this<o:p></o:p></p>
<p class=3D"MsoNormal">and DomU boots successfully. However, if I try to en=
able `eth0` in DomU (using ip link dev set eth0 up),<o:p></o:p></p>
<p class=3D"MsoNormal">I get a Kernel Panic in Dom0.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Here are the complete steps:<o:p></o:p></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1"><b>Boot Dom0 and configure bridge</b>:<o:p></o:p></li><ul style=3D"ma=
rgin-top:0in" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level2 =
lfo1">brctl addbr xenbr0<o:p></o:p></li><li class=3D"MsoListParagraph" styl=
e=3D"margin-left:0in;mso-list:l0 level2 lfo1">brctl addif xenbr0 eth0<o:p><=
/o:p></li><li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:=
l0 level2 lfo1">ip link set dev xenbr0 up<o:p></o:p></li><li class=3D"MsoLi=
stParagraph" style=3D"margin-left:0in;mso-list:l0 level2 lfo1">ip link set =
dev eth0 up<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"margin-l=
eft:0in;mso-list:l0 level2 lfo1">dhclient xenbr0<o:p></o:p></li></ul>
</ol>
<p class=3D"MsoListParagraph" style=3D"margin-left:1.0in"><o:p>&nbsp;</o:p>=
</p>
<ol style=3D"margin-top:0in" start=3D"2" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1"><b>ifconfig xenbr0
</b>(ping 8.8.8.8 works):<b><o:p></o:p></b></li></ol>
<p class=3D"MsoNormal">xenbr0&nbsp;&nbsp;&nbsp; Link encap:Ethernet&nbsp; H=
Waddr B2:62:37:C9:BB:D7<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; inet addr:192.168.0.185&nbsp; Bcast:192.168.0.255&nbsp; Mask:255.255.255=
.0<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; inet6 addr: fe80::b062:37ff:fec9:bbd7/64 Scope:Link<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; UP BROADCAST RUNNING MULTICAST&nbsp; MTU:1500&nbsp; Metric:1<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; RX packets:703 errors:0 dropped:0 overruns:0 frame:0<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; TX packets:27 errors:0 dropped:0 overruns:0 carrier:0<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; collisions:0 txqueuelen:1000 <o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;RX bytes:88213 (86.1 KiB)&nbsp; TX bytes:3088 (3.0 KiB)<o:p></o:p><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<ol style=3D"margin-top:0in" start=3D"3" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1"><b>ifconfig eth0</b>:<o:p></o:p></li></ol>
<p class=3D"MsoNormal">eth0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Link encap:Ethern=
et&nbsp; HWaddr B2:62:37:C9:BB:D7&nbsp; <o:p>
</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;inet6 addr: fe80::b062:37ff:fec9:bbd7/64 Scope:Link<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; UP BROADCAST RUNNING MULTICAST&nbsp; MTU:1500&nbsp; Metric:1<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;RX packets:1535 errors:0 dropped:2 overruns:0 frame:0<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; TX packets:43 errors:0 dropped:0 overruns:0 carrier:0<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; collisions:0 txqueuelen:1000 <o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;RX bytes:450476 (439.9 KiB)&nbsp; TX bytes:4248 (4.1 KiB)<o:p></o:p=
></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; Interrupt:59 Base address:0xc000<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<ol style=3D"margin-top:0in" start=3D"4" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1"><b>Add bridge to DomU config file</b>:<o:p></o:p></li></ol>
<p class=3D"MsoNormal" style=3D"text-indent:.5in">vif =3D [ 'bridge=3Dxenbr=
0' ]<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><o:p>&nbsp;</o:p></p>
<ol style=3D"margin-top:0in" start=3D"5" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1"><b>root@s32g274aevb-Dom0:~# xl create /etc/xen/domU1.cfg<o:p></o:p></=
b></li></ol>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">After this I get the Kern=
el OOPS, because of a failed memory<o:p></o:p></p>
<p class=3D"MsoNormal">access <o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in">[&nbsp; 413.367873] Unabl=
e to handle kernel paging request at virtual address 000006c000020070<o:p><=
/o:p></p>
<p class=3D"MsoNormal">In<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [&nbsp; 413.548189]&nbsp; xenvif_rx_ring_s=
lots_available&#43;0x40/0xa0 [xen_netback]<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in">The full log is attached =
at <a href=3D"https://pastebin.com/sJLfd4gL">
[0]</a>.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">Using gdb, I found out th=
at the access corresponds to the following source code lines:<o:p></o:p></p=
>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (gdb)&nbsp; l *=
xenvif_rx_ring_slots_available&#43;0x40<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">0x65b0 is in xenvif_rx_r=
ing_slots_available (/usr/src/kernel/include/linux/skbuff.h:4084).<o:p></o:=
p></p>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">4082&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; static inline bool skb_is_gso(const struct sk_buff *skb)<o:p></o=
:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">4083&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; {<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">4084&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return skb_shinfo(skb)-&gt;gso_size;<o:p></o:p></=
p>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">4085&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<ol style=3D"margin-top:0in" start=3D"6" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1"><b>DomU boots, and then: root@s32g274aevb-DomU1:~# ip link set dev et=
h0 up</b><o:p></o:p></li></ol>
<p class=3D"MsoListParagraph">After this, I get a kernel panic in Dom0 beca=
use of another failed memory<o:p></o:p></p>
<p class=3D"MsoNormal">access<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ 5338.574809] Unable to handle kernel pag=
ing request at virtual address 000000c0ffff0028<o:p></o:p></p>
<p class=3D"MsoNormal">in<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ 5338.753128]&nbsp; xenvif_tx_build_gops&=
#43;0x528/0xef8 [xen_netback]<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The full log is attached at <a href=3D"htt=
ps://pastebin.com/iaF1q3UM">
[1]</a>.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Using gdb again, I found out the correspon=
ding source code:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<o=
:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in;text-indent:.5in">(gdb) l =
*xenvif_tx_build_gops&#43;0x528<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in;text-indent:.5in">0xce8 is=
 in xenvif_tx_build_gops (/usr/src/kernel/include/linux/skbuff.h:1272).<o:p=
></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in;text-indent:.5in">1269&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; #ifdef NET_SKBUFF_DATA_USES_OFFSET<o:p></o:p></p=
>
<p class=3D"MsoNormal" style=3D"margin-left:.5in;text-indent:.5in">1270&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; static inline unsigned char *skb_end_pointer(con=
st struct sk_buff *skb)<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in;text-indent:.5in">1271&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in;text-indent:.5in">1272&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return skb-&gt;head &#43; skb-&gt=
;end;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in;text-indent:.5in">1273&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Do you have any idea why this occurs? Have I misconf=
igured anything?
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;ve also tried to pass a static IP configurat=
ion for DomU in the config file,<o:p></o:p></p>
<p class=3D"MsoNormal">and because it automatically enables eth0 at boot ti=
me, I no longer get the<o:p></o:p></p>
<p class=3D"MsoNormal">oops, but a panic directly.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you very much for your help,<o:p></o:p></p>
<p class=3D"MsoNormal">Andrei Cherechesu,<o:p></o:p></p>
<p class=3D"MsoNormal">NXP Semiconductors <o:p></o:p></p>
</div>
</body>
</html>

--_000_VI1PR04MB505620B32C8289C6106D0B2AF9D00VI1PR04MB5056eurp_--

