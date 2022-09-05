Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD95A5AD904
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 20:28:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399128.640192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVGpJ-0005dd-Hk; Mon, 05 Sep 2022 18:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399128.640192; Mon, 05 Sep 2022 18:28:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVGpJ-0005ad-Ci; Mon, 05 Sep 2022 18:28:05 +0000
Received: by outflank-mailman (input) for mailman id 399128;
 Mon, 05 Sep 2022 18:28:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ua4M=ZI=amd.com=JYOTIRMOY.SHARMA@srs-se1.protection.inumbo.net>)
 id 1oVGpH-0005Yv-Ob
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 18:28:03 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77e825a8-2d48-11ed-af93-0125da4c0113;
 Mon, 05 Sep 2022 20:28:01 +0200 (CEST)
Received: from DM6PR12MB4297.namprd12.prod.outlook.com (2603:10b6:5:211::20)
 by PH7PR12MB5656.namprd12.prod.outlook.com (2603:10b6:510:13b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Mon, 5 Sep
 2022 18:27:56 +0000
Received: from DM6PR12MB4297.namprd12.prod.outlook.com
 ([fe80::b8a0:a7b4:2921:9c2d]) by DM6PR12MB4297.namprd12.prod.outlook.com
 ([fe80::b8a0:a7b4:2921:9c2d%4]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 18:27:56 +0000
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
X-Inumbo-ID: 77e825a8-2d48-11ed-af93-0125da4c0113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O84cBVXyGm31T7xq0tjp91LAZnzvT+41a7o9nvuKCsPrKYmoeJrEn7S9scMqLMjYHBupAA+CiPBLHErfX/CqWGKu4NIbl9KsuaTHgZfebTQUqq9HQVh5I1Z3PjtxbOK5DL5st4U5GKZMdS/+fUqL0ox7fC0LgAWLy8Hklf+1HPuhDD4O5NkIv3ZDykCi45LnbFAPQm5k+u2eEnFDFL5wsRCcrgxAWiaVD07C/W0yg4InrBBK9y5CmG1thtAO2AdNx4XQCzLJzZ2QXI24FJfsUza4W+GzYe7GGQ2Jw6XxgE7GkWvS1ds+fDyvp3SBIQPFzvqPdIK/dtpzGoXHxaw91A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2YZjqSWAqsFEieyZigc4KKlHdLCzOveAHOrDx1ISKk=;
 b=O2TuBa/bc3T5vqMQoWmDzz8hh2hICiDsnW2cS2E0h1aDVy8Lv6CAvDL0zRg6Mbg14Jt0SZfagj0PkbWo+P8mwUBWdmcbhm2V/6Aw2h5unNeg2/D9fM0pTa9Z5Jojvd9qAQ8KI+ossFW0Ky/TgfWBWA+NNW/DZFdxss6TxYYq47KAzxm9yCyZ4yEIQjvYKRHk3nnceKyT62kTX6Tpx52Pq/aUWNdqTGn52tzkEk+SiNx7qjtub6J57C7kietzd/mZs9DKVa2EWES4/PAtMexf9oh5ynPrrN8bI5JGHIU3pm4Pxp2R2+zNfzOLZXh7wkmLtb0elrZE9n3k2tht94Cu9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2YZjqSWAqsFEieyZigc4KKlHdLCzOveAHOrDx1ISKk=;
 b=fnreGcstLAQBThqKryQgT9zzHrMAh9ssTDvSpom18Fh2fgHQNE2DofpVNh5oFzeKiBeIUfDUi3D516nEC7fd0oNGPkOMWyIeeB4qNOyiw14FK1gAyZLfXJf1cZnGnRAFdhRwjlLwIyRenqw8wzqFAopJhFceznGIPTMxQ1MjYiI=
From: "SHARMA, JYOTIRMOY" <JYOTIRMOY.SHARMA@amd.com>
To: "olekstysh@gmail.com" <olekstysh@gmail.com>
CC: "SHARMA, JYOTIRMOY" <JYOTIRMOY.SHARMA@amd.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	"dpsmith@apertussolutions.com" <dpsmith@apertussolutions.com>, "Stabellini,
 Stefano" <stefano.stabellini@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "xen-users@lists.xenproject.org"
	<xen-users@lists.xenproject.org>, "al1img@gmail.com" <al1img@gmail.com>
Subject: Re: Enable audio virtualization in Xen
Thread-Topic: Re: Enable audio virtualization in Xen
Thread-Index: AdjBJCbHGOCKcGneSouxTwfUhwYYsg==
Date: Mon, 5 Sep 2022 18:27:56 +0000
Message-ID:
 <DM6PR12MB429727E2F53D906BCF38E3809F7F9@DM6PR12MB4297.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-09-05T18:27:54Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=37bedcd6-5a97-46e7-ba26-6fe49401d5ef;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 003e09bf-fa68-423a-b30e-08da8f6c5ab7
x-ms-traffictypediagnostic: PH7PR12MB5656:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 8xeeAPwfU3lKHf6N5jaGVoZlLWhs57lb5vztXrgFKnByLYhPcu10eXpwBDhx9AHWGMBEXqrxW8UjAOEClFL98HapniaLcnPwAeHj3jLRX4EsnhCG+F+q37hSMd/vOGXM3U1CY/yw4/7SzxdNar3VOvcFNdrlf1LwQ3H2EpWjd8vEcCx2xpn8AL6PjAqxe8ISUoXzEb4TPeQs5Pu028ML0j7/LWkT8leS/aACzFirQotYrRzmeFOlXdeykOUI5jxVyD7lBX3belvkS5ENc25b/zd8qooO/ikUDHMPD/6BjqDP8bKO788al6UQfqPZYpmA0HiHvvbMTBbxCbFX9fwD8vAE8b8c15tqLxj2ijFYuspjv5jd1XOIFkykb3CnITj37VDjgwcAuFC3/18tbFH+6HJWjwUHwvhfecxQczMpE64kRxOpatnwig8yG4nXwpW95GvnS5rPitAxZByxmwb7s/mUPr/9H5N5bbwndd98TvC6gSPkRCLn8eaOiVLMHpRuTdCHxZW1f6YHRhBoLSww2/p7Ozw7ZwA6Lq1+PZlzH/xzNd0+B2p6SrIvHM/JoLmZRnhH/YMf9la4Hai2thbpQAs1wqMbWzH8FGz+2q20guAHkOF9gLuNv8t+60SB9qfihjkobIFKUGfA1JkoKGizNkocP16Qq/6GvMoZ+sXzOEWDS5MrffoBJbWs2r/3mT77Wbya6Fev/lXtusuHqkQ3Z3QEY5RILHGjD69Zq15/oJCprmrjvGWsvstHWfp5AawzrdYtTeI06uOXOH13yWlRRQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4297.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(122000001)(8676002)(76116006)(4326008)(66446008)(66476007)(64756008)(66946007)(66556008)(38100700002)(186003)(41300700001)(71200400001)(6506007)(55236004)(54906003)(7696005)(9686003)(6916009)(316002)(55016003)(83380400001)(26005)(8936002)(5660300002)(33656002)(478600001)(86362001)(2906002)(52536014)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?6lDJXo7zq46cuZJcAEgpLiOmBvmQo8wJtw+uXuINvywrDUsyYtpMsojFfWHL?=
 =?us-ascii?Q?LHTcs0RfHWsuMBGjU9i0G46jzVuZDcJF7LocrbpgzRw0kuKFX9MDuKzKx4EU?=
 =?us-ascii?Q?0apqdOtd6GrQtsVBuc1jWbATZZiIRZ1T2L3gDRpM8cECqT0MYcosqWg4Zhyh?=
 =?us-ascii?Q?1NI7Ts1X5gbotOIEEvoCLVZ0d3vB52WnXetErkX5OGXJtjJnoeEwlAvlx6A3?=
 =?us-ascii?Q?7dWAEKUvYqdh2p6+Yubz1V78dgiaDKPJJvoU5p50Z3Jyz6vDQFur3r7/i69W?=
 =?us-ascii?Q?Bwg87O6rNYcofIyMuXZUYWu3C+aRvjNXejE4X4F3uJk8TM/7opS0ZA4afTHZ?=
 =?us-ascii?Q?NJNChQhDi7AhpH6+oLKElcDN4+8He/GPUcAzbXrEQ9kvdeRnXKB4bBEUjMm9?=
 =?us-ascii?Q?re2u5OAMg22RUYSHqWbnXdU+FDFsddntsuvL6ZlP9ftd7FTf/a6GxOPr77vo?=
 =?us-ascii?Q?KLWHsW2vAlny8q4we/Iq4mQvMtxqRq7G7Bs3xziL98jxOJ82l79sJd6PF+D/?=
 =?us-ascii?Q?oy481DpKse58b/xGgq321F3Kw5F8sYbXLWOMcL1AwUmXvSbhToE2dSX7xMYU?=
 =?us-ascii?Q?JVqoCy0vjsBkXQUJUtBIMb+LU8m7m+DyZgO6jCC7HTklMtf56gBHfBAjIVF3?=
 =?us-ascii?Q?9r2Fc/bkr+a8JPzFD28Qeua36nPRa7rsev5PXAXLCPlQ+MKEfHiG7KPVOfNd?=
 =?us-ascii?Q?eZSmFzAwyeEoSkImrQuBimLhDZu/yd7RbfTmv1DrHgOM9Se15j3gc/SV89dV?=
 =?us-ascii?Q?ytnKo7UU7zKATC9FaQrC8HjhdNczBl1uAszcBG/T/cmmvY0oS8cD7WVJVqpu?=
 =?us-ascii?Q?0S52Gf2spEFHABV7QSd0YGt0gF2cRn0uHlWwYR8Nn+8yozQ+Bd50Z6LVKXeP?=
 =?us-ascii?Q?68kbLMwYzZZ0GoNXBfhswUT09hoyFXXuXtftPpkx+Z5zf8T1g9Xp5h8qBKVp?=
 =?us-ascii?Q?Cvixr6/JJHakjOYyeQceSXAisFTIGMLTlYDUG1lWWb4DCu02K1xY1vckq5RI?=
 =?us-ascii?Q?ogcNvq9xkPjNDhD6xEF3Ml9dpP915+XZA0Q1+XUP68dSCjnvjsxXUlvxV1Pr?=
 =?us-ascii?Q?jo2VyKuYxluLS1kPIBqoBd5pV3Vo1KuqXLTRXA3hf/H0QPMVJjJnXTg9sPSl?=
 =?us-ascii?Q?PhjZLtS5AfalBXLt+Xz3s8sHZ5Kmc154wIMjqpOUTr86f3ONzdEJ1AFGb1lZ?=
 =?us-ascii?Q?QnVvaCfJs1aoRWcjK342LVLRi+v230ok47eyhtbOCvmecKPN6vpDIz/nM0po?=
 =?us-ascii?Q?LC2YAQX7Ahka8Su+Y8+HSr5lYeoY3bPvj+2aLDwwkA8fOomqGfY+jecNlRAW?=
 =?us-ascii?Q?Ef6lY7f3n+eUvSIb0yx4Mh0eZ0eoPoRpIVppof8tpeZH0QtC+5RbNYNWKZk5?=
 =?us-ascii?Q?Qvn9QouPajbvH1Pmqlpds00ly19PI+WHvUE7oOvBbpyuuBfrwJmT5lpqkHRL?=
 =?us-ascii?Q?v5w4CM2HqNzvO5xJWI2CZhyxfKJZZJwkWDxN+ZjktjW3u6643xHgQ+R18bmO?=
 =?us-ascii?Q?rOKqFkVYybWjlXNDWGz4UBQNrNWL7+pXui1F6CUWAPyEeq5/LxJ698aV4jGn?=
 =?us-ascii?Q?DcwCilmDyIVMEEazHVk=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB429727E2F53D906BCF38E3809F7F9DM6PR12MB4297namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4297.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 003e09bf-fa68-423a-b30e-08da8f6c5ab7
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2022 18:27:56.7418
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M1spT21pcqc0iGcaX5KHSIc79XUXrErmokrpLxJfpcy+yZLSnn7hjIM2ewNBEXZP+7+tiqX1B0+mHUe1d2854Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5656

--_000_DM6PR12MB429727E2F53D906BCF38E3809F7F9DM6PR12MB4297namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Hi Oleksandr,

Thank you for your input. I tried matching the hardware parameter (i.e. buf=
fer size) in the HVM config file, but still no luck with audio from HVM gue=
st.
Here is the complete vsnd config:

vsnd =3D [[ 'card, backend=3DDomain-0, buffer-size=3D22050, short-name=3DVC=
ard, long-name=3DVirtual sound card, sample-rates=3D8000;11025;16000;22050;=
32000;44100;48000, sample-formats=3Ds16_le', 'pcm, name=3Ddev1', 'stream, u=
nique-id=3Dalsa, type=3DP' ]]

This is what I see when I play audio in Dom 0:

amd@amd-Bilby-RV2:~$ aplay -v ~/SampleAudio/music.wav
Playing WAVE '/home/amd/SampleAudio/music.wav' : Signed 16 bit Little Endia=
n, Rate 44100 Hz, Stereo
ALSA <-> PulseAudio PCM I/O Plugin
Its setup is:
  stream       : PLAYBACK
  access       : RW_INTERLEAVED
  format       : S16_LE
  subformat    : STD
  channels     : 2
  rate         : 44100
  exact rate   : 44100 (44100/1)
  msbits       : 16
  buffer_size  : 22050
  period_size  : 5512
  period_time  : 125000
  tstamp_mode  : NONE
  tstamp_type  : GETTIMEOFDAY
  period_step  : 1
  avail_min    : 5512
  period_event : 0
  start_threshold  : 22050
  stop_threshold   : 22050
  silence_threshold: 0
  silence_size : 0
  boundary     : 6206523236469964800

I have also tried giving buffer-size as 88200 (22050 * 2 channels * 2 bytes=
 per sample), but still there is no audio from HVM guest.

What will be the right parameters based on the above aplay information?

Below is the information obtained using -dump-hw-params flag. Do I need to =
change vsnd parameters based on this information?

amd@amd-Bilby-RV2:~$ aplay  ~/SampleAudio/music.wav --dump-hw-params
Playing WAVE '/home/amd/SampleAudio/music.wav' : Signed 16 bit Little Endia=
n, Rate 44100 Hz, Stereo
HW Params of device "default":
--------------------
ACCESS:  RW_INTERLEAVED
FORMAT:  U8 S16_LE S16_BE S24_LE S24_BE S32_LE S32_BE FLOAT_LE FLOAT_BE MU_=
LAW A_LAW S24_3LE S24_3BE
SUBFORMAT:  STD
SAMPLE_BITS: [8 32]
FRAME_BITS: [8 1024]
CHANNELS: [1 32]
RATE: [1 384000]
PERIOD_TIME: (2 4294967295)
PERIOD_SIZE: [1 1398102)
PERIOD_BYTES: [128 1398102)
PERIODS: [3 1024]
BUFFER_TIME: (7 4294967295]
BUFFER_SIZE: [3 4194304]
BUFFER_BYTES: [384 4194304]
TICK_TIME: ALL
--------------------

Added Oleksandr Grytsov for help.

Regards,
Jyotirmoy


--_000_DM6PR12MB429727E2F53D906BCF38E3809F7F9DM6PR12MB4297namp_
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
	{mso-style-type:export-only;}
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
<p class=3D"MsoNormal">Hi Oleksandr,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you for your input. I tried matching the hardw=
are parameter (i.e. buffer size) in the HVM config file, but still no luck =
with audio from HVM guest.<o:p></o:p></p>
<p class=3D"MsoNormal">Here is the complete vsnd config:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">vsnd =3D [[ 'card, backend=3DDomain-0, buffer-size=
=3D22050, short-name=3DVCard, long-name=3DVirtual sound card, sample-rates=
=3D8000;11025;16000;22050;32000;44100;48000, sample-formats=3Ds16_le', 'pcm=
, name=3Ddev1', 'stream, unique-id=3Dalsa, type=3DP' ]]<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This is what I see when I play audio in Dom 0:<o:p><=
/o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">amd@amd-Bilby-RV2:~$ aplay -v ~/SampleAudio/music.wa=
v<o:p></o:p></p>
<p class=3D"MsoNormal">Playing WAVE '/home/amd/SampleAudio/music.wav' : Sig=
ned 16 bit Little Endian, Rate 44100 Hz, Stereo<o:p></o:p></p>
<p class=3D"MsoNormal">ALSA &lt;-&gt; PulseAudio PCM I/O Plugin<o:p></o:p><=
/p>
<p class=3D"MsoNormal">Its setup is:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; stream&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : =
PLAYBACK<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : =
RW_INTERLEAVED<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; format&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : =
S16_LE<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; subformat&nbsp;&nbsp;&nbsp; : STD<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&nbsp; channels&nbsp;&nbsp;&nbsp;&nbsp; : 2<o:p></o:=
p></p>
<p class=3D"MsoNormal">&nbsp; rate&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; : 44100<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; exact rate&nbsp;&nbsp; : 44100 (44100/1)<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&nbsp; msbits&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : =
16<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; buffer_size&nbsp; : 22050<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; period_size&nbsp; : 5512<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; period_time&nbsp; : 125000<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; tstamp_mode&nbsp; : NONE<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; tstamp_type&nbsp; : GETTIMEOFDAY<o:p></o:p></=
p>
<p class=3D"MsoNormal">&nbsp; period_step&nbsp; : 1<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; avail_min&nbsp;&nbsp;&nbsp; : 5512<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&nbsp; period_event : 0<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; start_threshold&nbsp; : 22050<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; stop_threshold&nbsp;&nbsp; : 22050<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&nbsp; silence_threshold: 0<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; silence_size : 0<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; boundary&nbsp;&nbsp;&nbsp;&nbsp; : 6206523236=
469964800<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have also tried giving buffer-size as 88200 (22050=
 * 2 channels * 2 bytes per sample), but still there is no audio from HVM g=
uest.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">What will be the right parameters based on the above=
 aplay information?
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Below is the information obtained using &#8211;dump-=
hw-params flag. Do I need to change vsnd parameters based on this informati=
on?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">amd@amd-Bilby-RV2:~$ aplay&nbsp; ~/SampleAudio/music=
.wav --dump-hw-params<o:p></o:p></p>
<p class=3D"MsoNormal">Playing WAVE '/home/amd/SampleAudio/music.wav' : Sig=
ned 16 bit Little Endian, Rate 44100 Hz, Stereo<o:p></o:p></p>
<p class=3D"MsoNormal">HW Params of device &quot;default&quot;:<o:p></o:p><=
/p>
<p class=3D"MsoNormal">--------------------<o:p></o:p></p>
<p class=3D"MsoNormal">ACCESS:&nbsp; RW_INTERLEAVED<o:p></o:p></p>
<p class=3D"MsoNormal">FORMAT:&nbsp; U8 S16_LE S16_BE S24_LE S24_BE S32_LE =
S32_BE FLOAT_LE FLOAT_BE MU_LAW A_LAW S24_3LE S24_3BE<o:p></o:p></p>
<p class=3D"MsoNormal">SUBFORMAT:&nbsp; STD<o:p></o:p></p>
<p class=3D"MsoNormal">SAMPLE_BITS: [8 32]<o:p></o:p></p>
<p class=3D"MsoNormal">FRAME_BITS: [8 1024]<o:p></o:p></p>
<p class=3D"MsoNormal">CHANNELS: [1 32]<o:p></o:p></p>
<p class=3D"MsoNormal">RATE: [1 384000]<o:p></o:p></p>
<p class=3D"MsoNormal">PERIOD_TIME: (2 4294967295)<o:p></o:p></p>
<p class=3D"MsoNormal">PERIOD_SIZE: [1 1398102)<o:p></o:p></p>
<p class=3D"MsoNormal">PERIOD_BYTES: [128 1398102)<o:p></o:p></p>
<p class=3D"MsoNormal">PERIODS: [3 1024]<o:p></o:p></p>
<p class=3D"MsoNormal">BUFFER_TIME: (7 4294967295]<o:p></o:p></p>
<p class=3D"MsoNormal">BUFFER_SIZE: [3 4194304]<o:p></o:p></p>
<p class=3D"MsoNormal">BUFFER_BYTES: [384 4194304]<o:p></o:p></p>
<p class=3D"MsoNormal">TICK_TIME: ALL<o:p></o:p></p>
<p class=3D"MsoNormal">--------------------<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Added Oleksandr Grytsov for help.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Jyotirmoy<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM6PR12MB429727E2F53D906BCF38E3809F7F9DM6PR12MB4297namp_--

