Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC705A9288
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 10:58:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396342.636448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTg1b-00022p-Sk; Thu, 01 Sep 2022 08:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396342.636448; Thu, 01 Sep 2022 08:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTg1b-00020l-Ps; Thu, 01 Sep 2022 08:58:11 +0000
Received: by outflank-mailman (input) for mailman id 396342;
 Thu, 01 Sep 2022 08:58:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QZey=ZE=amd.com=JYOTIRMOY.SHARMA@srs-se1.protection.inumbo.net>)
 id 1oTg1a-00020a-7V
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 08:58:10 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31a698a4-29d4-11ed-934f-f50d60e1c1bd;
 Thu, 01 Sep 2022 10:58:07 +0200 (CEST)
Received: from DM6PR12MB4297.namprd12.prod.outlook.com (2603:10b6:5:211::20)
 by PH7PR12MB7019.namprd12.prod.outlook.com (2603:10b6:510:1b9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 1 Sep
 2022 08:58:04 +0000
Received: from DM6PR12MB4297.namprd12.prod.outlook.com
 ([fe80::b8a0:a7b4:2921:9c2d]) by DM6PR12MB4297.namprd12.prod.outlook.com
 ([fe80::b8a0:a7b4:2921:9c2d%4]) with mapi id 15.20.5588.010; Thu, 1 Sep 2022
 08:58:04 +0000
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
X-Inumbo-ID: 31a698a4-29d4-11ed-934f-f50d60e1c1bd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I2K65Hx2NGMftvP15LTp5HKyllDvXqjuTN1v7Dbnwfhe/C0qnW6xrqvBe/7nJvFSHqFvupl+BxU45CNj2eIAEfFxVq9cDuCmyzud2O4vOO+gZZC2ebvlNNG3wgcIN1IT5VhgSYe7IPUCoOXmAcoNzhhGtf8jsPW3ipbmu9kOKE16TlOZ/HFqb2VGpeZgbxU3zgSL5Cwo7FtkknnD/0DXVlcLPmNDv4Wry6zMq7OMiyIeSmegB8xsOu8D1zM0IC9fhGi8bBNlzBPo9uDfyhqoxbJGzmdlbeWXb4nvwvC1DsCZWq4Zihx7uwp7t1Qy6FUGdYIdDXYfGQpFzvzJwVE/bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZmSdwmjuOadBollNkjGyMebwChLzyTxxrhqg6v+V48=;
 b=gaR71plVDEuC8Is1rPtxuXPEZCD0WVth2zBUmLlOwSh0yoe0D8ViISpnYKc1PX8nKvj73qlStH50ibffZs0J9/MBOImBVtX3u22amRleVV9nPHPwdR965G0W1OdjzE4fZjMz26d61dpMrszJWoe+NNnNJzS1ADPwqUpW8KwUHizLoiqwKw+LgZZJEzH9eFT9JPw/2COW1A2YM8OKOGI0th61IeXWiucGtdEottyvEHlUA8sLK01BcaQXEhyOpXJTdqQGrNfmtdZX9Kengd6wDAy0oaOwrMFRI2wjA084TAs6Ehw8KkDI4kEGX4NUsINSkbqT1ki+p0glilt3UHc+nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZmSdwmjuOadBollNkjGyMebwChLzyTxxrhqg6v+V48=;
 b=G7Wm5pqE2xhN8Yn133Khv+WD6AulahYXNqpTxLMqu2GuSwNWDlB2RIIK1PBy9VgIoCKsVg+CVIsg1/SzAMrVXYxENLXW7ziEB2NxRCEZms5zfPJF/nPz1JFPtUo54ZeRJ0xi4Ljee9Yzyo+NZMhWDmEgvJWjmS1B5PocnIjVeTA=
From: "SHARMA, JYOTIRMOY" <JYOTIRMOY.SHARMA@amd.com>
To: "SHARMA, JYOTIRMOY" <JYOTIRMOY.SHARMA@amd.com>
CC: "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	"dpsmith@apertussolutions.com" <dpsmith@apertussolutions.com>,
	"olekstysh@gmail.com" <olekstysh@gmail.com>, "Stabellini, Stefano"
	<stefano.stabellini@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "xen-users@lists.xenproject.org"
	<xen-users@lists.xenproject.org>
Subject: Re: Enable audio virtualization in Xen
Thread-Topic: Re: Enable audio virtualization in Xen
Thread-Index: Adi94EXouXveB4LpT0u/A4RVLH5W1g==
Date: Thu, 1 Sep 2022 08:58:04 +0000
Message-ID:
 <DM6PR12MB42978C6A0680DD661E24D1E59F7B9@DM6PR12MB4297.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-09-01T08:58:02Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=92e77bf1-b390-4127-ac4b-079d8e040c26;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c338d8d6-8dab-4043-3fd8-08da8bf814ce
x-ms-traffictypediagnostic: PH7PR12MB7019:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 +dkJc6hbOHpQXLaszFmvU918+LPwvHZaSp+9RGJ9MHtzMvTzEPEFIiIRO9xZWtleIs0qsKv8QKVNCB7LnpQ8n0ZGgrB3vx1dsA5KZg6Ey6AS69kb8vkdqrZSzemkcn6jCdh3RT8MNeXgrbMFT9sjb1BwUSLXRV6PaCChdP3x1jH3wq4Sz/fp5/hBTJSrhNaHho0o8MWox6tC36XlQ5mKNbIByP7ctnMEFeA9bOkorkCHnASHAEm4bEMBau2NxqF01NUFy16KuGS/YDjciiV1Z5hV8wja1ZKaooFNOp5eN53wpk9x8n8vruqeyBQQ/zvt1V7DcJjo0VdjUh61Z/t2yZBomnHJoZe6kIZ8bG2EfF/mW75xBQuk135dOBWAKUkv/X9v+PciyLQ2E13tmOgYe7X3vjgQ8hoFN4nxSlUnQS2GW6z9Y0nLCZmw3R3iyL/9X/xVsQ+mcfv3padDrkcVkJYu5+hx0hhsnbrMoKY726RzpJQaQrK1I/gUzXY6q031/wyH2UkwEQZe9MRSkBs+bhFrr5JtvisXiicJmxpUi4g4tIfBVgoKhEoruD3Vn+7KQxBPpP9KpSsijLYX1BjGpUAhd0VyDOe/vXVDDeK9+FaJfTyZH14KfYCpU8CFbpYK5+gJ3FrAN/2NW0NDqDdGAUZUsyAk2K1BPO15DQN7zbMkvY8HzJGoCQ0Vc+dBgT5m2lg/5dj3fmynZQYRfHehiM5eaiH2osBVx8jAMi67Pz9GUJ8gTwV0NNQvKAc0m+wv1tMuEiXm91SYtwy9fcKINw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4297.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(71200400001)(9686003)(6506007)(33656002)(26005)(41300700001)(186003)(38100700002)(86362001)(38070700005)(478600001)(7696005)(66946007)(55016003)(5660300002)(6200100001)(8676002)(76116006)(6862004)(66446008)(64756008)(122000001)(54906003)(316002)(4326008)(52536014)(8936002)(66476007)(66556008)(4744005)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?IV6urucgFdueE/u4T2ZM4YB/8RcXjyG5IE4PgI2eqz+ecF/K3ViMul2pQhIP?=
 =?us-ascii?Q?I9Zzt9VyjKruOIQG+VJXrIZc09/JyyrU/ykAV7RHKSPMPRYST/rTweyDoq8E?=
 =?us-ascii?Q?bHoqNuPA8ScIJKnWrBmKLpAJqjSW6aIC4yXojH4wI83GC5fsMUdHGc/z3uHk?=
 =?us-ascii?Q?fAAsfKnoEe9xhx2RXFicRFIpFkXQ8dDN0Lt1GWTL+YICQeMPrzztt/SYNM14?=
 =?us-ascii?Q?RCF6pWCRaH64aNd3hJIuDy99T3/n9DeuLbxzyE3NSG4N+Xebd3cn4kpFOd84?=
 =?us-ascii?Q?oZ7O/Lbs95vS/VMW32DJu/WB/eKzZ3RM+HqHdxzw9Cy9wkcTL09jpU+z4XMY?=
 =?us-ascii?Q?Gcm99uL6nb4EEeBn/lMRaQN5n8FI5vPMgxsIdic8+sj75IFwbZ8YNRNmi1Ud?=
 =?us-ascii?Q?VvdQTlRmxzX4pdTzLD6YJNt9L1WurZAEEACE8sq8kJGqOVuGFfZDPIMAB68V?=
 =?us-ascii?Q?xvQvhwYJA7bm3EM309m272/Twc34di2w9JO3k0u9h0dX0qYSi1k2IIPsu8T5?=
 =?us-ascii?Q?r7LDdNK1rwR5puF0d0FLjpNL5R4hcNyrz3MhdiHwSMMAKX5nLhZLmsMZzzHR?=
 =?us-ascii?Q?XsTl35eq9Hn6SrcEZJwJ46VMY0vBRSd2FoOT0HKL+jIVwaSo/Y6l9Qa0h9HA?=
 =?us-ascii?Q?DB1yE5Eha19tvbqPypmAv+DpaklLnfykfuiCxsgf7jsJXG7AkgV8m4F7suB8?=
 =?us-ascii?Q?u/bgDeAZmgT3rg6tpkNU4xnb5WnHKgbWJKUBzRCuD5nMP8hLAnWghLvdwu2C?=
 =?us-ascii?Q?5Imj0aaAxR9oO5z4M5J20RmkGjqaiQjkgkdFOHiPHaQ9qEVtg+OiWB8kjhxQ?=
 =?us-ascii?Q?wGrBjp+Z41t1v+lmgPsYpTgQ8uSb5+fKIgDHNtnZokpz+wa7ZjiNH0o/uEra?=
 =?us-ascii?Q?UKUbji8BSrsoIPx8L2bOTmC9NjfN2bXDNH7s5nyad2S7juwxGLHRYVm+Gr2K?=
 =?us-ascii?Q?Zbn/Cag32h4nE/Rb9bFqX54d/AevdrijBhgbFYE1YT9d4Xbp/1cLAaqatokf?=
 =?us-ascii?Q?5ag/Hg/nrFmL5PI9NHbT1nJa4oRU+t/uoSaD8gtpRKj66qruEELA75F9sZ/U?=
 =?us-ascii?Q?CpW7RX+ZvYWaMXNVSAV3SOKHXb67US4xeFkY1v3Cy+Do0x7xs0ts+36uHA2z?=
 =?us-ascii?Q?dYDFT4A3XS3+4j4Z6YVrqhyhHtyYTehksUWEeyS2A8UQKLyUo+hOFtLdBwxd?=
 =?us-ascii?Q?SXWX2849wf79x2EcjKhDZJV7maJCkCEVQhY1U5NPl5bEPQv1MTMnY4VvkmRe?=
 =?us-ascii?Q?MKNgiH1HlfchmyIEUYanilB1mG9IoAsV5KV/UApNQfUCPeQ2BkTG5WbBiBdq?=
 =?us-ascii?Q?9stNtSO0pM++GNfm9yO7f6gXTcuzpJPK/ndWGoeOcJbN4Hvy71QdDDtM8fms?=
 =?us-ascii?Q?HeqReSN2xNDCi/5EDsYckDaO1/4k6R/9C18J2JZfyTpiF/UEhWJzls9+CW1v?=
 =?us-ascii?Q?UOFYInAN7iML+6rygb/UAzPOaLw+ZhjE5WVdKefoS1+vCcP7UM6gt+fvhvQi?=
 =?us-ascii?Q?Cj6rXEnkMuuOnxYYLa9sfeleCtm7TtdbVY12+6JAy/R9PLKSqP5BpSOxWsRR?=
 =?us-ascii?Q?lJ1YBgdvQTb7uL5qkEBl/Hi3tnC8nCpH1xsfmz+q?=
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB42978C6A0680DD661E24D1E59F7B9DM6PR12MB4297namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4297.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c338d8d6-8dab-4043-3fd8-08da8bf814ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2022 08:58:04.3085
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ltH2DVxBZtnxPpST7ugVBRWT8Sc+UgzNuuOraloUqlOzvD3DOXnlxkOC6S2/d+nTPVX/Fsq7d/c80aZjrDK9vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7019

--_000_DM6PR12MB42978C6A0680DD661E24D1E59F7B9DM6PR12MB4297namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Hi all,

Forgot to mention that I am able to play audio from HVM guest with Pulse Au=
dio as back end. Here is the corresponding HVM configuration:

vsnd =3D [[ 'card, backend=3DDomain-0, buffer-size=3D65536, short-name=3DVC=
ard, long-name=3DVirtual sound card, sample-rates=3D44100, sample-formats=
=3Ds16_le', 'pcm, name=3Ddev1', 'stream, unique-id=3Dpulse, type=3DP' ]]

I have used xen front end and snd_be (along with libxenbe) as back end as s=
uggested by Christopher earlier in this thread.

Only when I change unique-id=3Dalsa, audio is not working from HVM guest.

If anyone has tried ALSA back end (instead of PA), please let me know what =
I am missing.

Regards,
Jyotirmoy


--_000_DM6PR12MB42978C6A0680DD661E24D1E59F7B9DM6PR12MB4297namp_
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
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<p class=3D"msipheaderdf3d92d6" align=3D"Left" style=3D"margin:0"><span sty=
le=3D"font-size:10.0pt;font-family:Arial;color:#0000FF">[AMD Official Use O=
nly - General]</span></p>
<br>
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Forgot to mention that I am able to play audio from =
HVM guest with Pulse Audio as back end. Here is the corresponding HVM confi=
guration:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">vsnd =3D [[ 'card, backend=3DDomain-0, buffer-size=
=3D65536, short-name=3DVCard, long-name=3DVirtual sound card, sample-rates=
=3D44100, sample-formats=3Ds16_le', 'pcm, name=3Ddev1', 'stream, unique-id=
=3Dpulse, type=3DP' ]]<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have used xen front end and snd_be (along with lib=
xenbe) as back end as suggested by Christopher earlier in this thread.<o:p>=
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Only when I change unique-id=3Dalsa, audio is not wo=
rking from HVM guest.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">If anyone has tried ALSA back end (instead of PA), p=
lease let me know what I am missing.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Jyotirmoy<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM6PR12MB42978C6A0680DD661E24D1E59F7B9DM6PR12MB4297namp_--

