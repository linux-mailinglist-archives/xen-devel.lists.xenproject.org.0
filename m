Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C613582B1E3
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 16:33:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666399.1037007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNx3D-0001mi-LG; Thu, 11 Jan 2024 15:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666399.1037007; Thu, 11 Jan 2024 15:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNx3D-0001jT-HW; Thu, 11 Jan 2024 15:32:59 +0000
Received: by outflank-mailman (input) for mailman id 666399;
 Thu, 11 Jan 2024 15:32:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tS5E=IV=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1rNx3B-0001jN-V3
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 15:32:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1598a18-b096-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 16:32:56 +0100 (CET)
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13)
 by VE1PR04MB7213.eurprd04.prod.outlook.com (2603:10a6:800:1b3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Thu, 11 Jan
 2024 15:32:53 +0000
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d191:ce86:2f34:296e]) by PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d191:ce86:2f34:296e%3]) with mapi id 15.20.7159.020; Thu, 11 Jan 2024
 15:32:53 +0000
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
X-Inumbo-ID: b1598a18-b096-11ee-98f0-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItZV8XfifJMrD+q3v+x4blQvAM+ZwbmJAY+Sn/bnXn1LGnvJInx+KvFRI7Pj1VMl/k1nwG0eAPvfoIW7jyR8KgTTpQB+UJCQrrmnpdobXRcUbxl/8c/bcAOtbJRNcXmvyFhlL557kZ2iLBXdbBk0VmaBYU/c5kCMRo/d1uHzzNTktHYmjOExnND8nH1lJULr6+TxZ3BZRGGoSD+pu2kcfXd6JT0ltlcpdCh3icUpB9on4iTzYvrkGOtd3Py7F4XGUL4jIDUG4nRGZA0L8CPdQltnBqv2sj/20ueBVFVoDRIFN7459g55lrQsF8pWQqBDPuS+1NSNeKT2ypEWG09Q5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gjgYrFIhS+4ANyNJYVr8jul6ptiDVCYdy2ncXhUBTwg=;
 b=FBA2DeURoiqt546Dm0m4v0s2/aUcFk0b4nrey5Lxqn1Md0Ylm43IaljnY4DcSrZfUxDLpe7CzIMZ+buq2OSZRDghSq1tipGIC61kiFfzAafMA3rvWfnPNpGJ4IMVVNwSZhmdzQ58ugV5n0BAzk5BvY2Rr+ZgUNoOJ5sH0OPpRIOxMU1hZ/JK4E3oLsERV5TS5L8BfP76I8M924TjBLmj7CyzvUTjViXvvB/rKlWJkR3i0gJuUydFmWWTGiNqe3i6eD/kw6qOnbAsv6C0lrk2imITXPy+pjAFm3gY6g441/M+EGgGfLjJA7Vg2FGTSt6mGli/OmG5QmzO7FbW+P/ttg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjgYrFIhS+4ANyNJYVr8jul6ptiDVCYdy2ncXhUBTwg=;
 b=d0rsukexe8aUIFZbHQE0+r/IlsjPYSa4mDIn/YOtnBDU8q6O4C0wmU4Hw0CCrkBqOzaGGmYrfncJ2wnT1mxSzdj4dRvOOtbzSBNeU14mSCbbH1kPK4BHUvQMahyAmrrBzBx+FX/XmUm4/26sDMzoOZim8bFQ+dM0/68LepqnAng=
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: Stefano Stabellini <sstabellini@kernel.org>, "viresh.kumar@linaro.org"
	<viresh.kumar@linaro.org>, "olekstysh@gmail.com" <olekstysh@gmail.com>,
	Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrei
 Cherechesu <andrei.cherechesu@nxp.com>
Subject: [VirtIO] Support for various devices in Xen
Thread-Topic: [VirtIO] Support for various devices in Xen
Thread-Index: AdpEoiWSqd5fkUgSQU6tkjSpwpXAbQ==
Date: Thu, 11 Jan 2024 15:32:53 +0000
Message-ID:
 <PA4PR04MB95655F653BBFE3A70A8CD0FBF9682@PA4PR04MB9565.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9565:EE_|VE1PR04MB7213:EE_
x-ms-office365-filtering-correlation-id: ac0a2e4f-b7f4-4318-d6b2-08dc12ba93d1
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 /GEr/JYa0ZcJW921c2EV7mK8KM/vS5zzMdxpm8inojcFnQn0N6JWWNQ/pjJjFoMAW316QFq4QdiO+ldUUfL/osG5XRpwuAYDa8kYK/kOC92L7zXQyV+LEXw+/WJu0IAJ885m0+CrRhwWNE6FLjKQQqlF1kg34Je9dq0+YFTKuSCvlGXEzlq5qbTqKKDB6mXOquBjkgFjA9N3Q07VMpUVpMaVoK5B4fWwV6Y9+pi+7dfY1PtWCLlSh4Ot3mjhXa+h5pmFR7iBdecai+kxrzmnb4/sHnyL3v+ERlbhXmxVyPk88yxWI/BjvaLkJ6qGDPCYaYPNHi9vZ1eChJsg3FXsETej2iL4jdHFi3K35SJJIeMzy48YuWv9/A6rO8VX+uxdzpqH2Oh64jgxmB1F2UDsWYZ3XoWSLNhqbydQTDcLAC4UJQ95DN7G2fjUpk/rHiBoichpp2ZwipEDzPXTUkpO/SfakLKADz0AE/Oy21lu1pG/znwrtwR/6PFekfSK6xsTpu9VN1ypiYvYAS+npHJ+VPGblVktkcu+HlcN65lR8z4YTYt1RngD9NWcZazEU/6U3tdDOH5T5BMg/2OQsMjmC3fxp67cceyElhtuWealFf0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9565.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(396003)(366004)(39860400002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(9326002)(8936002)(8676002)(52536014)(5660300002)(4326008)(316002)(66446008)(54906003)(110136005)(64756008)(66476007)(66556008)(55016003)(2906002)(76116006)(66946007)(166002)(86362001)(966005)(38100700002)(122000001)(6506007)(33656002)(9686003)(7696005)(478600001)(41300700001)(26005)(38070700009)(83380400001)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?IsgZqfL6ddw2fIkhDGIn93t0lJYujTz+B9cDKrtAp2eMoyDzc3QV8l+S2eom?=
 =?us-ascii?Q?cljyImUhaGAczyQYBIQImxVohKc2CKamYfTkuEyihypX+8t9cp1/A8WScCja?=
 =?us-ascii?Q?1YwYFrLz0DyH1VYSTon/cQmofriCls8fTF5UmVmXnDw+C4FLVuER4rdIz0Ay?=
 =?us-ascii?Q?WGVgy9H/Ni+nmvUqYCC0RJpuMuqJLLz0kCXcKT5vcO2qmxN5xtLRrCdFe5Oz?=
 =?us-ascii?Q?fbaaUpfP20Sd3ODsMCdXwDXlzRzcVKg4VmzVUcKU2voO82r7Uw7sTe8YDme9?=
 =?us-ascii?Q?ynYqnObDPORtYMjWucrZA8I4NoHXjiWS5FPXNNIIc60IlXV6N+5PzPGtfVC1?=
 =?us-ascii?Q?KBbls7xIbVxwnBYfRrKbC1MLcWYlKBooz4E51vsksB7MIyPEtyRPS93DSCbs?=
 =?us-ascii?Q?W/JkWrMbdhEO+3ijht+KpcqNuKCJNKZ51p3YMy0NCMPJWaoj0SYhMmp1C/eU?=
 =?us-ascii?Q?K6u0zCOzfUchAkcE6pY0AMB8N+RR9y6HdIGejmNP2pigr/fFYI2w0L+wCaBW?=
 =?us-ascii?Q?edbQ5AVGmih9jGvmSK4UonssKjgpAjWNafDe8nLYkaTVDLhC/8ElnIHahErn?=
 =?us-ascii?Q?xTIVwe18bFhC+9PBHZkvQ5Z3RlIwRcZrNVa67GjGF/7aOrOS/MdC1dIx8Vnb?=
 =?us-ascii?Q?sGhfaHDCiEumq7NIMV0kP87B/cCtNaq07m3h1BGXsEPY5scqlZ+JBwuJcYgz?=
 =?us-ascii?Q?7SZPvJu3XWJI/4quEAZzsPQkpPJCbbqcSK0Npj8BFcdcmnwMPFyIWpguHBzj?=
 =?us-ascii?Q?/fZ+Sd3Xmh4OkZmZ4pDjg9WzsWYWRC90I31tbCNFUvhWZSYuty0H9j+t8bUx?=
 =?us-ascii?Q?HeXRWP9jzyFO03TUbgcorMadgbBx8G1cK264YcPY8omBSf8KLUCv+v+ABKjB?=
 =?us-ascii?Q?dgqyzKtS8kiz8BvYTJjBe0ws6ECHFPeBEdvtmA40TnWZo4XNNunp6dFXXwCC?=
 =?us-ascii?Q?szoyiezNf/WjEaNHPkUJZuTt4CgIaKg/pl+oy98m4rXhH9CQr2pJEhMeZiM0?=
 =?us-ascii?Q?mtjWi9Bf+qy1wZBldNvCsb/PnGA6R1W2ZDUjS/xXKJD13h86hSj8Jnp8xM0g?=
 =?us-ascii?Q?DbQ9jp+Tn4yga7H5NG4aD2INMMtMCrYpSWEyDKzUkg3/QHVtrq+kkoasriA4?=
 =?us-ascii?Q?JYygB/62InZlMo1Yz1fElArGdiZr5ioOjjQ1TR9nI7Z4d49ddJwJq48TsQfP?=
 =?us-ascii?Q?JIlSTN2jDl4+GIeyRIVcvwIpoh8iA9Q8olJuspPOV2q/VtjoRBjIdD8K/vxy?=
 =?us-ascii?Q?Qmj/7w16FS8Dpmp6OwsuSKaBRes3KgSFGQLUXi6l3Nt/eTqFxJWc5ppzlGrH?=
 =?us-ascii?Q?qEj2MO4hBe/+VmaYxsR9i2lqmAOkMiIUXV1jlr95JgzNZypgZhFEbAb8N50H?=
 =?us-ascii?Q?bqBe72VMbC4aEMvu9siv00sXfvDu5UlUxT3sJz2IMVT9duy6jEcT/SkOUM46?=
 =?us-ascii?Q?DAzkT76vyokKSAHpmBstTlpXlUdNXmMd25yVjunJsG7Zi7Wxf09xfWm3k0cb?=
 =?us-ascii?Q?OQKxEXLuk3FWsgZ0MShL7363dv/qws0ztFqv9b43uq6xmiUczZXrQeCWIPZ1?=
 =?us-ascii?Q?C1LZurLISZVKWd2crFBaNP13JIQ2UN/ZIZmQOtcVatwhCpkHWclg2jtZDWMW?=
 =?us-ascii?Q?EQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PA4PR04MB95655F653BBFE3A70A8CD0FBF9682PA4PR04MB9565eurp_"
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9565.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac0a2e4f-b7f4-4318-d6b2-08dc12ba93d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2024 15:32:53.2793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vymau3XsGr2B03ursM+PIoltHumjLvtU7CmsmuC2vKXN8YDkZ/wJ6VT9HwW0lQg4jC+qZpl5OsZJjz/gtcRNZ4LpmgibFj+x2Q7GWT9G81A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7213

--_000_PA4PR04MB95655F653BBFE3A70A8CD0FBF9682PA4PR04MB9565eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

As I've mentioned in previous discussion threads in the xen-devel
community, we are running Xen 4.17 (uprev to 4.18 in progress) on NXP
S32G automotive processors (Cortex-A53 cores) and we wanted to know more
about the support for various VirtIO device types in Xen.

In the Xen 4.17 release notes, the VirtIO standalone backends mentioned
as supported and tested are: virtio-disk, virtio-net, virtio-i2c and
virtio-gpio.

However, we've only managed to successfully set up and try some
use-cases with the virtio-disk standalone backend [0] (which Olexandr
provided) based on the virtio-mmio transport.

As such, we have a few questions, which we haven't been able to figure
out from the mailing list discussions and/or code:
    1. Are there any plans for the virtio-disk repo to have a stable
    version? Is it going to be long-term hosted and maintained in the
    xen-troops github repo? Or was it just an one-time PoC implementation
    and the strategy for future VirtIO devices will be based on a more gene=
ric
    approach (i.e., without need for a specific standalone app)?

    2. With regards to the other backends, we want to try out and provide P=
V
    networking to a DomU based on virtio-net, but we haven't found any avai=
lable
    resources for it (e.g., the standalone backend implementation if needed=
 for
    control plane, configuration examples, presentations, demos, docs). Doe=
s it
    rely on the QEMU virtio-net or vhost implementation? Are there any exam=
ples
    on how to set it up? Any required Xen/Linux Kernel/QEMU versions?

    3. What other VirtIO device types are there planned to be supported in =
Xen?
    I'm supposing libxl will also need changes to accomodate new configurat=
ion
    parameters for each of them. Or is there something I'm missing?

    4. Also, while we're at it, are there any plans regarding SCMI
    awareness for Xen (e.g., SCMI Mediator - where the RFC thread from 2022
    seems discontinued)? Or is the preferred approach for sharing SCMI acce=
ss
    to guests through virtio-scmi?

Thank you very much for the support, once again, and we're also looking
forward to the progress on the rust-vmm initiative.

Regards,
Andrei Cherechesu,
NXP Semiconductors

[0] https://github.com/xen-troops/virtio-disk

--_000_PA4PR04MB95655F653BBFE3A70A8CD0FBF9682PA4PR04MB9565eurp_
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
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<br>
<br>
As I've mentioned in previous discussion threads in the xen-devel<br>
community, we are running Xen 4.17 (uprev to 4.18 in progress) on NXP<br>
S32G automotive processors (Cortex-A53 cores) and we wanted to know more<br=
>
about the support for various VirtIO device types in Xen.<br>
<br>
In the Xen 4.17 release notes, the VirtIO standalone backends mentioned<br>
as supported and tested are: virtio-disk, virtio-net, virtio-i2c and<br>
virtio-gpio.<br>
<br>
However, we've only managed to successfully set up and try some<br>
use-cases with the virtio-disk standalone backend [0] (which Olexandr<br>
provided) based on the virtio-mmio transport.<br>
<br>
As such, we have a few questions, which we haven't been able to figure<br>
out from the mailing list discussions and/or code:<br>
&nbsp;&nbsp;&nbsp; 1. Are there any plans for the virtio-disk repo to have =
a stable<br>
&nbsp;&nbsp;&nbsp; version? Is it going to be long-term hosted and maintain=
ed in the<br>
&nbsp;&nbsp;&nbsp; xen-troops github repo? Or was it just an one-time PoC i=
mplementation<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; and the strategy for future VirtI=
O devices will be based on a more generic<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; approach (i.e., without need for =
a specific standalone app)?<o:p></o:p></p>
<p class=3D"MsoNormal"><br>
&nbsp;&nbsp;&nbsp; 2. With regards to the other backends, we want to try ou=
t and provide PV<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; networking to a DomU based on vir=
tio-net, but we haven't found any available<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; resources for it (e.g., the stand=
alone backend implementation if needed for<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; control plane, configuration exam=
ples, presentations, demos, docs). Does it<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; rely on the QEMU virtio-net or vh=
ost implementation? Are there any examples<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; on how to set it up? Any required=
 Xen/Linux Kernel/QEMU versions?<o:p></o:p></p>
<p class=3D"MsoNormal"><br>
&nbsp;&nbsp;&nbsp; 3. What other VirtIO device types are there planned to b=
e supported in Xen?<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; I'm supposing libxl will also nee=
d changes to accomodate new configuration<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; parameters for each of them. Or i=
s there something I'm missing?<o:p></o:p></p>
<p class=3D"MsoNormal"><br>
&nbsp;&nbsp;&nbsp; 4. Also, while we're at it, are there any plans regardin=
g SCMI<br>
&nbsp;&nbsp;&nbsp; awareness for Xen (e.g., SCMI Mediator - where the RFC t=
hread from 2022<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; seems discontinued)? Or is the pr=
eferred approach for sharing SCMI access<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; to guests through virtio-scmi?<br=
>
<br>
Thank you very much for the support, once again, and we're also looking<br>
forward to the progress on the rust-vmm initiative.<br>
<br>
Regards,<br>
Andrei Cherechesu,<br>
NXP Semiconductors<br>
<br>
[0] <a href=3D"https://github.com/xen-troops/virtio-disk">https://github.co=
m/xen-troops/virtio-disk</a><o:p></o:p></p>
</div>
</body>
</html>

--_000_PA4PR04MB95655F653BBFE3A70A8CD0FBF9682PA4PR04MB9565eurp_--

