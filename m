Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD825A9047
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 09:29:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396271.636358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTecx-0005Rm-VW; Thu, 01 Sep 2022 07:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396271.636358; Thu, 01 Sep 2022 07:28:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTecx-0005On-Rd; Thu, 01 Sep 2022 07:28:39 +0000
Received: by outflank-mailman (input) for mailman id 396271;
 Thu, 01 Sep 2022 07:28:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QZey=ZE=amd.com=JYOTIRMOY.SHARMA@srs-se1.protection.inumbo.net>)
 id 1oTecv-0005OX-8Y
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 07:28:37 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab78f8f7-29c7-11ed-934f-f50d60e1c1bd;
 Thu, 01 Sep 2022 09:28:29 +0200 (CEST)
Received: from DM6PR12MB4297.namprd12.prod.outlook.com (2603:10b6:5:211::20)
 by DM6PR12MB4895.namprd12.prod.outlook.com (2603:10b6:5:1bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 07:28:23 +0000
Received: from DM6PR12MB4297.namprd12.prod.outlook.com
 ([fe80::b8a0:a7b4:2921:9c2d]) by DM6PR12MB4297.namprd12.prod.outlook.com
 ([fe80::b8a0:a7b4:2921:9c2d%4]) with mapi id 15.20.5588.010; Thu, 1 Sep 2022
 07:28:22 +0000
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
X-Inumbo-ID: ab78f8f7-29c7-11ed-934f-f50d60e1c1bd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NvINhQIA3TixUc4CSCMv554bTNt8F+uQwxjsSjCpxeAntmwFCA0rqywcO7smecd4/cgDq4KCzqVlZY0xguQKw4BqyuUpziBjUp89myPSIB1rzUcYJx5nGIUckSbUsQI6UF+34qAbH3jLzIZD2Bi3stdGb0BHqWorofNXul6kRwYFfmeHjKSvskXfcLf9DVomwhI+lyeEme60zUH48zi5PmsC0/EHaGpKErPvwtDlrtcyDIOSU08PQWQv5n6qoBNaUR+VVYBPurspEkjhdcWwiPSHzjgBv9y+tWb5mHBOjSnmvHJ45LeVpxcf27aEJPjaIarXtMfJI0ZacKFtTwqTxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEKSLfwZAq7iQkGB4+0/b2lBVSiSXeDzTqT6Xa4qD3o=;
 b=fiZ6V/IKbI7aIlHhyWprUSebUMvzlCBX+VGrEzlEKEmoLgwrOw/EWlcqFhHA68TbBfF0P3pkc7Gsmnom0FUdvA/cx54WWWFoUXOvo04kSst5K4fAjc2xbilLtdxPaz86W7rV4/5eE3VigKrqj3E5QPq4gH4cGtp+THZzbThjuzjtXyPaG1O7EvrcnB03XnA0JVPG5J47LYzidaHUdKo7ogE5MCUkOmATw31bvrjs7OFhxGUMUYGSunLf1v4XPenhCTJXNdHwLGPR2eSgArMuZPmjQ4raILNvLmPzsz3R1IiC/FUiVfHBm78J47DhOMUD/b1LRyxIC3I+qcPUmQ1eOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEKSLfwZAq7iQkGB4+0/b2lBVSiSXeDzTqT6Xa4qD3o=;
 b=vNhyBgQIOEofoISmufGMzqttZ4TmWlJNPWf3Ut4LTBgJ3P+fPSnLd4OQ9m83/bO5xCl3tc50gOWyernSF4QfuESAltf70onnmuQs3MroNU0TI9AtxaoVlcwAsT5BuGXsaN7l2nisr3qRtrb4DT4miRAZ92QNoo4YP0eZ6k4PCaI=
From: "SHARMA, JYOTIRMOY" <JYOTIRMOY.SHARMA@amd.com>
To: "olekstysh@gmail.com" <olekstysh@gmail.com>
CC: "SHARMA, JYOTIRMOY" <JYOTIRMOY.SHARMA@amd.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	"dpsmith@apertussolutions.com" <dpsmith@apertussolutions.com>, "Stabellini,
 Stefano" <stefano.stabellini@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "xen-users@lists.xenproject.org"
	<xen-users@lists.xenproject.org>
Subject: Re: Enable audio virtualization in Xen
Thread-Topic: Re: Enable audio virtualization in Xen
Thread-Index: Adi90T6igslulYXKSAmzK1cf1eJLCw==
Date: Thu, 1 Sep 2022 07:28:22 +0000
Message-ID:
 <DM6PR12MB4297D06B82525583A22B58E19F7B9@DM6PR12MB4297.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-09-01T07:28:18Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=7535a506-875a-4b17-b548-d72cff19ce63;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6529a9c2-ee3e-4ea5-11ed-08da8beb8d3b
x-ms-traffictypediagnostic: DM6PR12MB4895:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 yVjWv5R3cEWmceYfqlGATloxc7TsgpsJfNB6Wke/kWCg3liMcxrUBGht+no+B+4L9smzHdXaspVb82EsZdti0FCP8eCoffo9O+bpGFicMgF4TUcHXbzK4tCXPUE8MbPAdA94kQOJHiWvDIfXALhthbaimr5GqhMgXH29M0P907g29r/yoxhwZxD1P2rtbQ1Qxk8xIn7cSUfVFGfPSrSlreCBnDZSlwrCPCkfw5x3x4f0Umggew+BZ4rbVlH2Avy3jdZFHCnQHCrgeSmZNZKuJt7db3mqxgGzvTWkqtsL8ggzKIVsKRLL79uxMju+lB3daGmrNOqN6DjHKtg067Z1JKHPrFdqq6BaPgw4VbaIDVQ5hUDqfpag38i26/WZdJBaO8PWD5ium0Hn0GAto2k4rz7uGhNZpiq0j3/yNEXye2p8MCy4eE571da6AlgDT+kylPL7QcQGW8N2YeLz+EGJB4k9T9TH3vsk1AIA+d8FziJXGJeWLOmdTycsxAzOwyJrTn3QMI3z/iZgHbrQ8+9I9agqGcq7ls4dvK6NHs32lBJeEQ0amPneCYhWng61VWC4PJ9NMHU9exg7DQE9RjIfb8LEbeocJpEX4dLQyW04zKp4vnJzEpwcfxpKcyJ3WMMyJAgoEtMMAdmkM3RmEI1NLPSNAvkrT/8rNpGVqqXn2zLqcQA/BlThFBLH/4aN99lls0ffsBKqIq68LFRAaqi15OyLuKlH/7RXO6lKR3RF7ouonsbtl7BpCGTD0mKXJAjjcDtY1wfsHThiyOfPdYgl7Do40it6uc5LUvmQgb9t+ZLsETBBclBk4IDhuv6F3taCDJTZLpml/igfMcln437gCw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4297.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(376002)(396003)(346002)(366004)(84040400005)(166002)(4326008)(8676002)(66556008)(64756008)(86362001)(66446008)(66946007)(76116006)(54906003)(6916009)(38070700005)(66476007)(316002)(6506007)(7696005)(83380400001)(41300700001)(9686003)(26005)(186003)(122000001)(38100700002)(71200400001)(55016003)(478600001)(30864003)(2906002)(8936002)(52536014)(5660300002)(33656002)(579004)(559001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?RCrA4YGlZJbFuBf2hzY+FzPW+K88JcY4z0Ny8aVB/fV5oDbToSpzglUv00Ll?=
 =?us-ascii?Q?/+K9x7DGQ6SHMnlEuYtSso9lTjEhzzWc1mTfvIqXUPD7vYWVfO8AQTpMzrWI?=
 =?us-ascii?Q?Ef9+TeFJNfFxCyms1S2bAldEhYD5VvKbPxrlcGKOFsp425qJ6y46FL8cxfnI?=
 =?us-ascii?Q?Mb2LDorWVuChHYQjLXpEoTZj50W4xSZX+pNRUxBni4YzOSZ8cc7hBI81ejr5?=
 =?us-ascii?Q?NRo1DBHnv5eVVzFW9kajZnQ8t3HyJOf0P0cu6w+hgsnAJukXixNLyvT3yTIi?=
 =?us-ascii?Q?ldzQJP8v5hcAXGfrYLdWN2KFdYZxFXpPk6YBSxXj3euUdVUL6uICJRl/pO9V?=
 =?us-ascii?Q?TIqXb+CDFJpBncMvqT7RwHdtO3kzhhdHJAjNf0TUlz6QLU7kP4Z+P2i9KgUh?=
 =?us-ascii?Q?GyNbY+BgN37NutG4Gc0XULFvkU/ie4JprwDHJ7wQcRJPpwzfcbIm+H1uT+kg?=
 =?us-ascii?Q?/LyIQc5V1IUZcN/JAOUK2/7W70RhvAOwpVLGDpsuwIWesJ3ezMT/U0q5URQ2?=
 =?us-ascii?Q?mCaFGfFSeC4asMAGX5/Iug6+2Fe1ZMMPT/BErWCsrMXkRslV5H1JBdvMJY0S?=
 =?us-ascii?Q?2oO4F1GTDF/W9rdv6udkXlPif9AdsK8oNtTkjIF4qbWeQEB6bPaGvr0ymhxI?=
 =?us-ascii?Q?wf8PtCUyugrpT5zSmVWBZMyq73wEdkiIQ9MkDfxqdLfzeUFHlmxW/r87kFoF?=
 =?us-ascii?Q?sf6reJIINNBhxNOwKsJaDDbd//a1xZMZbI9he1lmElT9Pge3BmUaFYlhbexl?=
 =?us-ascii?Q?IBEJZFUvB9gDYI99H3PuQqm6fKAowZoCLk7NzVc8dglo+NP/Sonzot/bQsGi?=
 =?us-ascii?Q?REP2kATqp3xhcFyIA+g7NhfyPzRUuHl5rFTcAPJHw/zYpLBOHHrLx8vZYSjt?=
 =?us-ascii?Q?tTk94hoWR3Xm2RGv8CFI7PlM97t32+cQ9ZtQ4GrtF+nABc1JfH9Hhd/Y/E4h?=
 =?us-ascii?Q?r1IkHVnCKayFBu2h8haESum53UpHXU/CNT7gjr+9+Iz03F1j/kdUvcbdVSgA?=
 =?us-ascii?Q?XwkIDA/bALse8G8d2mZZSRD5i1ne2EMffk8K6QA5ePjYqvbioLptHZCcqS7y?=
 =?us-ascii?Q?46aBpyHxc94urqzL73W2wvXc+kXjrqbyv56TESux7Igg+0wlMKYNm5pK/X5H?=
 =?us-ascii?Q?eO3DsiwEdBC/Za79tc22VU8uLiJ4vmpsTua/4/G2PoaiIAD7sNKcEn1JOpWm?=
 =?us-ascii?Q?hOa3ERsqLFp5nDz5LFu8crqOjNDxLDpQOYDq9DuwKbtCvdnKDvssC4q0h75n?=
 =?us-ascii?Q?MYLTgEc/esrjDzC+FOvuoj9y2Ihx+Urb8+mgaZBkGHvvyaC3F6FrxHTTr7ll?=
 =?us-ascii?Q?m+JjczpV6SBUkszgPgSy3CSbgK7thWXV4/pEHwOO7IO9EvD+mbFVUXt330Fe?=
 =?us-ascii?Q?H4qkOsks6pAkqDBLaQ6JKuU3Y9SqAfGMFubfUhpDXf2ClieflVtBK8XNVMzN?=
 =?us-ascii?Q?337RUljyxUh3RPvfJbEA9REzQAsvgcPLXEpWBNsF/z+MnS9PtWkerZCRUoa8?=
 =?us-ascii?Q?a3cY64iDhdlbkML4uXGV7IE7uOl9RWBZ07D9oPdijo6JiZEWowsCYXsUErAl?=
 =?us-ascii?Q?UAPKI8G5saOpKz5zWrZyg0Pm14jMPhZItUZKmzDO?=
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB4297D06B82525583A22B58E19F7B9DM6PR12MB4297namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4297.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6529a9c2-ee3e-4ea5-11ed-08da8beb8d3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2022 07:28:22.9068
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i2o1lOYbDCUt4jvGfjt/iOlMQ0MJK8ZzTR3ZjOBkDiukcbt9cRICBrWd/1DPTQNxX47ibG0J4XiPjZJBnBg4IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4895

--_000_DM6PR12MB4297D06B82525583A22B58E19F7B9DM6PR12MB4297namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Hi Oleksandr, Christopher and others,

I am trying to enable audio playback from HVM guest as per discussion above=
 using ALSA as back end.

I have compiled and installed libxenbe (https://github.com/xen-troops/libxe=
nbe) and snd_be (https://github.com/xen-troops/snd_be).
Following is my vsnd detail in the HVM configuration file:

vsnd =3D [[ 'card, backend=3DDomain-0, buffer-size=3D65536, short-name=3DVC=
ard, long-name=3DVirtual sound card, sample-rates=3D44100, sample-formats=
=3Ds16_le', 'pcm, name=3Ddev1', 'stream, unique-id=3Dalsa<default>, type=3D=
P' ]]

Here is the virtual card listed in HVM guest:
amd@amd-HVM-domU:~$ aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: vsnd [], device 0: dev1 [Virtual card PCM]
  Subdevices: 0/1
  Subdevice #0: subdevice #0

I am trying to play audio in guest HVM using aplay command: aplay sample.wa=
v. However, I am not able to hear any audio in this case.

Please note that if I play the wave file from dom 0 using the same command,=
 audio can be heard. This means that audio is working fine in the dom 0 usi=
ng default card.

Below is the log from snd_be. Has anyone tried ALSA back end before? If yes=
, can you help me in understanding the issue here?

01.09.22 12:46:37.240 | Main | INF - backend version:  v0.2.1-6-gb276
01.09.22 12:46:37.240 | Main | INF - libxenbe version: v0.2.1-11-g2e55-dirt=
y
01.09.22 12:46:37.240 | XenStore | DBG - Create xen store
01.09.22 12:46:37.240 | XenStore | DBG - Read string domid : 0
01.09.22 12:46:37.240 | XenStore | DBG - Read int domid : 0
01.09.22 12:46:37.241 | SndBackend | DBG - Create backend, device: vsnd, do=
m Id: 0
01.09.22 12:46:37.241 | XenStore   | DBG - Start
01.09.22 12:46:37.241 | XenStore   | DBG - Set watch: /local/domain/0/backe=
nd/vsnd
01.09.22 12:46:37.241 | XenStore   | DBG - Watch triggered: /local/domain/0=
/backend/vsnd
01.09.22 12:46:50.469 | XenStore   | DBG - Watch triggered: /local/domain/0=
/backend/vsnd
01.09.22 12:46:50.470 | XenStore   | DBG - Set watch: /local/domain/0/backe=
nd/vsnd/1
01.09.22 12:46:50.470 | XenStore   | DBG - Watch triggered: /local/domain/0=
/backend/vsnd
01.09.22 12:46:50.470 | XenStore   | DBG - Watch triggered: /local/domain/0=
/backend/vsnd
01.09.22 12:46:50.471 | XenStore   | DBG - Watch triggered: /local/domain/0=
/backend/vsnd
01.09.22 12:46:50.471 | XenStore   | DBG - Watch triggered: /local/domain/0=
/backend/vsnd
01.09.22 12:46:50.471 | XenStore   | DBG - Watch triggered: /local/domain/0=
/backend/vsnd
01.09.22 12:46:50.472 | XenStore   | DBG - Watch triggered: /local/domain/0=
/backend/vsnd/1
01.09.22 12:46:50.472 | SndBackend | DBG - New frontend found, domid: 1, de=
vid: 0
01.09.22 12:46:50.472 | XenStore   | DBG - Create xen store
01.09.22 12:46:50.472 | SndFrontend | DBG - Dom(1/0) Create frontend handle=
r
01.09.22 12:46:50.473 | XenStore    | DBG - Read string /local/domain/1/dev=
ice/vsnd/0/backend : /local/domain/0/backend/vsnd/1/0
01.09.22 12:46:50.473 | SndFrontend | DBG - Frontend path: /local/domain/1/=
device/vsnd/0
01.09.22 12:46:50.473 | SndFrontend | DBG - Backend path:  /local/domain/0/=
backend/vsnd/1/0
01.09.22 12:46:50.473 | XenStore    | DBG - Read string /local/domain/0/bac=
kend/vsnd/1/0/state : 1
01.09.22 12:46:50.473 | XenStore    | DBG - Read int /local/domain/0/backen=
d/vsnd/1/0/state : 1
01.09.22 12:46:50.473 | SndFrontend | INF - Close
01.09.22 12:46:50.473 | SndFrontend | INF - Dom(1/0) Set backend state to: =
[Closing]
01.09.22 12:46:50.473 | XenStore    | DBG - Write int /local/domain/0/backe=
nd/vsnd/1/0/state : 5
01.09.22 12:46:50.473 | XenStore    | DBG - Write string /local/domain/0/ba=
ckend/vsnd/1/0/state : 5
01.09.22 12:46:50.473 | SndFrontend | INF - Dom(1/0) Set backend state to: =
[Closed]
01.09.22 12:46:50.473 | XenStore    | DBG - Write int /local/domain/0/backe=
nd/vsnd/1/0/state : 6
01.09.22 12:46:50.474 | XenStore    | DBG - Write string /local/domain/0/ba=
ckend/vsnd/1/0/state : 6
01.09.22 12:46:50.474 | SndFrontend | INF - Dom(1/0) Set backend state to: =
[Initializing]
01.09.22 12:46:50.474 | XenStore    | DBG - Write int /local/domain/0/backe=
nd/vsnd/1/0/state : 1
01.09.22 12:46:50.474 | XenStore    | DBG - Write string /local/domain/0/ba=
ckend/vsnd/1/0/state : 1
01.09.22 12:46:50.474 | PulseMainloop | DBG - Init
01.09.22 12:46:50.477 | PulseMainloop | DBG - Context is ready
01.09.22 12:46:50.477 | XenStore      | DBG - Set watch: /local/domain/0/ba=
ckend/vsnd/1/0
01.09.22 12:46:50.477 | XenStore      | DBG - Set watch: /local/domain/1/de=
vice/vsnd/0/state
01.09.22 12:46:50.478 | XenStore      | DBG - Set watch: /local/domain/0/ba=
ckend/vsnd/1/0/state
01.09.22 12:46:50.478 | XenStore      | DBG - Start
01.09.22 12:46:50.478 | XenStore      | DBG - Watch triggered: /local/domai=
n/0/backend/vsnd
01.09.22 12:46:50.478 | XenStore      | DBG - Watch triggered: /local/domai=
n/1/device/vsnd/0/state
01.09.22 12:46:50.478 | XenStore      | DBG - Watch triggered: /local/domai=
n/0/backend/vsnd/1
01.09.22 12:46:50.478 | XenStore      | DBG - Read string /local/domain/1/d=
evice/vsnd/0/state : 1
01.09.22 12:46:50.478 | XenStore      | DBG - Read int /local/domain/1/devi=
ce/vsnd/0/state : 1
01.09.22 12:46:50.478 | SndFrontend   | INF - Dom(1/0) Frontend state chang=
ed to: [Initializing]
01.09.22 12:46:50.478 | XenStore      | DBG - Watch triggered: /local/domai=
n/0/backend/vsnd
01.09.22 12:46:50.478 | SndFrontend   | INF - Dom(1/0) Set backend state to=
: [InitWait]
01.09.22 12:46:50.479 | XenStore      | DBG - Watch triggered: /local/domai=
n/0/backend/vsnd/1
01.09.22 12:46:50.479 | XenStore      | DBG - Write int /local/domain/0/bac=
kend/vsnd/1/0/state : 2
01.09.22 12:46:50.479 | XenStore      | DBG - Write string /local/domain/0/=
backend/vsnd/1/0/state : 2
01.09.22 12:46:50.479 | XenStore      | DBG - Watch triggered: /local/domai=
n/0/backend/vsnd/1/0/state
01.09.22 12:46:50.479 | XenStore      | DBG - Watch triggered: /local/domai=
n/0/backend/vsnd
01.09.22 12:46:50.479 | XenStore      | DBG - Watch triggered: /local/domai=
n/0/backend/vsnd/1
01.09.22 12:46:50.479 | XenStore      | DBG - Read string /local/domain/0/b=
ackend/vsnd/1/0/state : 2
01.09.22 12:46:50.479 | XenStore      | DBG - Read int /local/domain/0/back=
end/vsnd/1/0/state : 2
01.09.22 12:46:50.479 | XenStore      | DBG - Watch triggered: /local/domai=
n/0/backend/vsnd/1/0/state
01.09.22 12:46:50.479 | XenStore      | DBG - Watch triggered: /local/domai=
n/0/backend/vsnd/1/0
01.09.22 12:46:50.479 | SndBackend    | DBG - Frontend path changed: /local=
/domain/0/backend/vsnd/1/0
01.09.22 12:46:50.479 | XenStore      | DBG - Read string /local/domain/0/b=
ackend/vsnd/1/0/state : 2
01.09.22 12:46:50.479 | XenStore      | DBG - Watch triggered: /local/domai=
n/0/backend/vsnd
01.09.22 12:46:50.480 | XenStore      | DBG - Read int /local/domain/0/back=
end/vsnd/1/0/state : 2
01.09.22 12:46:50.480 | XenStore      | DBG - Watch triggered: /local/domai=
n/0/backend/vsnd/1
01.09.22 12:46:50.480 | XenStore      | DBG - Watch triggered: /local/domai=
n/0/backend/vsnd/1/0
01.09.22 12:46:50.480 | SndBackend    | DBG - Frontend path changed: /local=
/domain/0/backend/vsnd/1/0
01.09.22 12:47:03.021 | XenStore      | DBG - Watch triggered: /local/domai=
n/1/device/vsnd/0/state
01.09.22 12:47:03.022 | XenStore      | DBG - Read string /local/domain/1/d=
evice/vsnd/0/state : 3
01.09.22 12:47:03.022 | XenStore      | DBG - Read int /local/domain/1/devi=
ce/vsnd/0/state : 3
01.09.22 12:47:03.022 | SndFrontend   | INF - Dom(1/0) Frontend state chang=
ed to: [Initialized]
01.09.22 12:47:03.022 | SndFrontend   | DBG - onBind
01.09.22 12:47:03.022 | SndFrontend   | DBG - Found device: 0
01.09.22 12:47:03.022 | SndFrontend   | DBG - Found stream: 0
01.09.22 12:47:03.022 | XenStore      | DBG - Read string /local/domain/1/d=
evice/vsnd/0/0/0/unique-id : alsa<default>
01.09.22 12:47:03.022 | XenStore      | DBG - Read string /local/domain/1/d=
evice/vsnd/0/0/0/type : p
01.09.22 12:47:03.023 | XenStore      | DBG - Read string /local/domain/1/d=
evice/vsnd/0/0/0/event-channel : 31
01.09.22 12:47:03.023 | XenStore      | DBG - Read int /local/domain/1/devi=
ce/vsnd/0/0/0/event-channel : 31
01.09.22 12:47:03.023 | XenStore      | DBG - Read string /local/domain/1/d=
evice/vsnd/0/0/0/ring-ref : 321
01.09.22 12:47:03.023 | XenStore      | DBG - Read int /local/domain/1/devi=
ce/vsnd/0/0/0/ring-ref : 321
01.09.22 12:47:03.023 | XenStore      | DBG - Read string /local/domain/1/d=
evice/vsnd/0/0/0/evt-event-channel : 32
01.09.22 12:47:03.023 | XenStore      | DBG - Read int /local/domain/1/devi=
ce/vsnd/0/0/0/evt-event-channel : 32
01.09.22 12:47:03.023 | XenStore      | DBG - Read string /local/domain/1/d=
evice/vsnd/0/0/0/evt-ring-ref : 1437
01.09.22 12:47:03.023 | XenStore      | DBG - Read int /local/domain/1/devi=
ce/vsnd/0/0/0/evt-ring-ref : 1437
01.09.22 12:47:03.024 | XenEvtchn     | DBG - Create event channel, dom: 1,=
 remote port: 32, local port: 76
01.09.22 12:47:03.024 | XenGnttabBuffer | DBG - Create grant table buffer, =
dom: 1, count: 1, ref: 1437, buffer offset: 0
01.09.22 12:47:03.024 | RingBuffer      | DBG - Create ring buffer, port: 3=
2, ref: 1437
01.09.22 12:47:03.024 | SndFrontend     | INF - Dom(1/0) Add ring buffer, r=
ef: 1437, port: 32
01.09.22 12:47:03.024 | XenEvtchn       | DBG - Start event channel, port: =
76
01.09.22 12:47:03.024 | SndFrontend     | DBG - Parse stream id: alsa<defau=
lt>
01.09.22 12:47:03.024 | SndFrontend     | DBG - Create pcm device, type: AL=
SA, device: default, propName: , propValue:
01.09.22 12:47:03.024 | AlsaPcm         | DBG - Create pcm device: default
01.09.22 12:47:03.024 | XenEvtchn       | DBG - Event received, port: 76
01.09.22 12:47:03.024 | XenEvtchn       | DBG - Create event channel, dom: =
1, remote port: 31, local port: 77
01.09.22 12:47:03.024 | XenGnttabBuffer | DBG - Create grant table buffer, =
dom: 1, count: 1, ref: 321, buffer offset: 0
01.09.22 12:47:03.024 | RingBuffer      | DBG - Create ring buffer, port: 3=
1, ref: 321
01.09.22 12:47:03.024 | CommandHandler  | DBG - Create command handler, dom=
: 1
01.09.22 12:47:03.024 | StreamRing      | DBG - Create stream ring buffer, =
id: alsa<default>
01.09.22 12:47:03.024 | SndFrontend     | INF - Dom(1/0) Add ring buffer, r=
ef: 321, port: 31
01.09.22 12:47:03.024 | XenEvtchn       | DBG - Start event channel, port: =
77
01.09.22 12:47:03.024 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:03.025 | SndFrontend     | INF - Dom(1/0) Set backend state =
to: [Connected]
01.09.22 12:47:03.025 | XenStore        | DBG - Write int /local/domain/0/b=
ackend/vsnd/1/0/state : 4
01.09.22 12:47:03.025 | XenStore        | DBG - Write string /local/domain/=
0/backend/vsnd/1/0/state : 4
01.09.22 12:47:03.026 | XenStore        | DBG - Watch triggered: /local/dom=
ain/0/backend/vsnd/1/0/state
01.09.22 12:47:03.026 | XenStore        | DBG - Watch triggered: /local/dom=
ain/0/backend/vsnd
01.09.22 12:47:03.026 | XenStore        | DBG - Watch triggered: /local/dom=
ain/0/backend/vsnd/1
01.09.22 12:47:03.026 | XenStore        | DBG - Read string /local/domain/0=
/backend/vsnd/1/0/state : 4
01.09.22 12:47:03.026 | XenStore        | DBG - Read int /local/domain/0/ba=
ckend/vsnd/1/0/state : 4
01.09.22 12:47:03.026 | XenStore        | DBG - Watch triggered: /local/dom=
ain/0/backend/vsnd/1/0
01.09.22 12:47:03.026 | SndBackend      | DBG - Frontend path changed: /loc=
al/domain/0/backend/vsnd/1/0
01.09.22 12:47:03.034 | XenStore        | DBG - Watch triggered: /local/dom=
ain/1/device/vsnd/0/state
01.09.22 12:47:03.034 | XenStore        | DBG - Read string /local/domain/1=
/device/vsnd/0/state : 4
01.09.22 12:47:03.034 | XenStore        | DBG - Read int /local/domain/1/de=
vice/vsnd/0/state : 4
01.09.22 12:47:03.034 | SndFrontend     | INF - Dom(1/0) Frontend state cha=
nged to: [Connected]
01.09.22 12:47:04.390 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.390 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.390 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.390 | AlsaPcm         | DBG - Opening pcm device for quer=
ies: default
01.09.22 12:47:04.395 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.395 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.395 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.395 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.395 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.395 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.395 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.395 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.395 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.395 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.395 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.395 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.395 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.395 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.395 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.396 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.396 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.396 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.396 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.396 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.396 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.396 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.396 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.396 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.396 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.396 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.396 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.396 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.396 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.396 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.396 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.396 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.396 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.396 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.396 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.396 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.396 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.396 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.396 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.396 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.397 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.397 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.397 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.397 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.397 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.397 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.397 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.397 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.397 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.397 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.397 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.397 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.397 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.397 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.397 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.397 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.397 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.397 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.397 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.397 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.397 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.397 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.397 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.397 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.397 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.397 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.398 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.398 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.398 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.398 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.398 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.398 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.398 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.398 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.398 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.398 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.398 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.398 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.398 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.398 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.398 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.398 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.398 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.398 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.398 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.398 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.398 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.398 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.398 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.398 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.398 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.398 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.398 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.398 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.398 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.399 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.399 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.399 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.399 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.399 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.399 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.399 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.399 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.399 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.399 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.399 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.399 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.399 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.399 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.399 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.399 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.399 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.399 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.399 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.399 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.399 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.399 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.399 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.399 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.399 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.399 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.399 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.399 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.402 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.402 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.402 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.402 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.402 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.402 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.406 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.406 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.406 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.406 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.406 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.406 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.408 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.408 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:0
01.09.22 12:47:04.408 | CommandHandler  | DBG - Handle command [OPEN]
01.09.22 12:47:04.408 | CommandHandler  | DBG - Get buffer refs, directory:=
 316, size: 17632, in grefs: 5
01.09.22 12:47:04.408 | XenGnttabBuffer | DBG - Create grant table buffer, =
dom: 1, count: 1, ref: 316, buffer offset: 0
01.09.22 12:47:04.409 | CommandHandler  | DBG - Gref address: 0x7fd1ea11200=
4, numGrefs 5
01.09.22 12:47:04.409 | XenGnttabBuffer | DBG - Delete grant table buffer
01.09.22 12:47:04.409 | CommandHandler  | DBG - Get buffer refs, num refs: =
5
01.09.22 12:47:04.409 | XenGnttabBuffer | DBG - Create grant table buffer, =
dom: 1, count: 5, ref: 1485, buffer offset: 0
01.09.22 12:47:04.409 | AlsaPcm         | DBG - Open pcm device: default
01.09.22 12:47:04.409 | AlsaPcm         | DBG - Close pcm query device: def=
ault
01.09.22 12:47:04.410 | AlsaPcm         | DBG - Format: S16_LE, rate: 44100=
, channels: 2, period: 4408, buffer: 17632
01.09.22 12:47:04.666 | AlsaPcm         | DBG - Playback supports audio def=
ault timestamps
01.09.22 12:47:04.668 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.669 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.681 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.681 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:1
01.09.22 12:47:04.681 | CommandHandler  | DBG - Handle command [CLOSE]
01.09.22 12:47:04.681 | XenGnttabBuffer | DBG - Delete grant table buffer
01.09.22 12:47:04.681 | AlsaPcm         | DBG - Close pcm device: default
01.09.22 12:47:04.684 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.685 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.689 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.689 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.689 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.689 | AlsaPcm         | DBG - Opening pcm device for quer=
ies: default
01.09.22 12:47:04.691 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.691 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.691 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.694 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.694 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.694 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.694 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.694 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.694 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.695 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.696 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.696 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.696 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.696 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.696 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.699 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.699 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.699 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.699 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.699 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.699 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.699 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.699 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.700 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.700 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.700 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.700 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.700 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.700 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.700 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.700 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.700 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.700 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.700 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.700 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.700 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.700 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.701 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.701 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.701 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.701 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.701 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.701 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.701 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.701 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.701 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.701 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.701 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.701 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.701 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.701 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.701 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.701 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.701 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.701 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.702 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.702 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.702 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.702 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.702 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.702 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.702 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.702 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.702 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.702 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.702 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.702 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.702 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.702 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.703 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.703 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.703 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.703 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.703 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.703 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.703 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.703 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.703 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.703 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.703 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.703 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.703 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.703 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.704 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.704 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.704 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.704 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.704 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.704 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.704 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.704 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.704 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.704 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.704 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.704 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.704 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.704 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.704 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.704 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.704 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.704 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.704 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.704 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.704 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.704 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.705 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.705 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.705 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.705 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.705 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.705 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.705 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.705 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.705 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.705 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.705 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.705 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.705 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.705 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.705 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.705 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.705 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.705 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.705 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.705 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.705 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.705 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.706 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.706 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.706 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.706 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.706 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.706 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.706 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.706 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.706 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.706 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:0
01.09.22 12:47:04.706 | CommandHandler  | DBG - Handle command [OPEN]
01.09.22 12:47:04.706 | CommandHandler  | DBG - Get buffer refs, directory:=
 326, size: 17632, in grefs: 5
01.09.22 12:47:04.706 | XenGnttabBuffer | DBG - Create grant table buffer, =
dom: 1, count: 1, ref: 326, buffer offset: 0
01.09.22 12:47:04.706 | CommandHandler  | DBG - Gref address: 0x7fd1ea11200=
4, numGrefs 5
01.09.22 12:47:04.707 | XenGnttabBuffer | DBG - Delete grant table buffer
01.09.22 12:47:04.707 | CommandHandler  | DBG - Get buffer refs, num refs: =
5
01.09.22 12:47:04.707 | XenGnttabBuffer | DBG - Create grant table buffer, =
dom: 1, count: 5, ref: 319, buffer offset: 0
01.09.22 12:47:04.707 | AlsaPcm         | DBG - Open pcm device: default
01.09.22 12:47:04.707 | AlsaPcm         | DBG - Close pcm query device: def=
ault
01.09.22 12:47:04.708 | AlsaPcm         | DBG - Format: S16_LE, rate: 44100=
, channels: 2, period: 4408, buffer: 17632
01.09.22 12:47:04.710 | AlsaPcm         | DBG - Playback supports audio def=
ault timestamps
01.09.22 12:47:04.712 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.712 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.712 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.712 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.712 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.712 | AlsaPcm         | DBG - Opening pcm device for quer=
ies: default
01.09.22 12:47:04.715 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.715 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.715 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.715 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.715 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.715 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.715 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.715 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.715 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.715 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.715 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.715 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.715 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.715 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.715 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.716 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.716 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.716 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.716 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.716 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.716 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.716 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.716 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.716 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.716 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.716 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.716 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.716 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.716 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.716 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.716 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.716 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.716 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.716 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.716 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.716 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.717 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.717 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.717 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.717 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.717 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.717 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.717 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.717 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.717 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.717 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.717 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.717 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.717 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.717 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.717 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.718 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.718 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.718 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.718 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.718 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.718 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.718 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.718 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.718 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.718 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.718 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.718 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.718 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.718 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:9
01.09.22 12:47:04.718 | CommandHandler  | DBG - Handle command [QUERY_HW_PA=
RAM]
01.09.22 12:47:04.718 | AlsaPcm         | DBG - Query pcm device default fo=
r HW parameters
01.09.22 12:47:04.718 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.718 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.727 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.727 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:3
01.09.22 12:47:04.727 | CommandHandler  | DBG - Handle command [WRITE]
01.09.22 12:47:04.727 | AlsaPcm         | DBG - Write to pcm device: defaul=
t, size: 4408
01.09.22 12:47:04.727 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.727 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.729 | XenEvtchn       | DBG - Event received, port: 77
01.09.22 12:47:04.729 | StreamRing      | DBG - Request received, id: alsa<=
default>, cmd:8
01.09.22 12:47:04.729 | CommandHandler  | DBG - Handle command [TRIGGER][ST=
ART]
01.09.22 12:47:04.729 | AlsaPcm         | DBG - Start
01.09.22 12:47:04.731 | CommandHandler  | DBG - Return status: [0]
01.09.22 12:47:04.731 | XenEvtchn       | DBG - Notify event channel, port:=
 77
01.09.22 12:47:04.756 | AlsaPcm         | DBG - Frame: 0, bytes: 17632, sta=
te: 4
01.09.22 12:47:04.756 | RingBuffer      | DBG - Send event, port: 32, prod:=
 0, cons: 0, num events: 63
01.09.22 12:47:04.756 | XenEvtchn       | DBG - Notify event channel, port:=
 76
01.09.22 12:47:04.780 | AlsaPcm         | DBG - Frame: 0, bytes: 17632, sta=
te: 4
01.09.22 12:47:04.780 | RingBuffer      | DBG - Send event, port: 32, prod:=
 1, cons: 1, num events: 63
01.09.22 12:47:04.780 | XenEvtchn       | DBG - Notify event channel, port:=
 76



Regards,
Jyotirmoy


--_000_DM6PR12MB4297D06B82525583A22B58E19F7B9DM6PR12MB4297namp_
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
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
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
<p class=3D"MsoNormal">Hi Oleksandr, Christopher and others,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am trying to enable audio playback from HVM guest =
as per discussion above using ALSA as back end.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have compiled and installed libxenbe (<a href=3D"h=
ttps://github.com/xen-troops/libxenbe">https://github.com/xen-troops/libxen=
be</a>) and snd_be (<a href=3D"https://github.com/xen-troops/snd_be">https:=
//github.com/xen-troops/snd_be</a>).<o:p></o:p></p>
<p class=3D"MsoNormal">Following is my vsnd detail in the HVM configuration=
 file: <o:p>
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">vsnd =3D [[ 'card, backend=3DDomain-0, buffer-size=
=3D65536, short-name=3DVCard, long-name=3DVirtual sound card, sample-rates=
=3D44100, sample-formats=3Ds16_le', 'pcm, name=3Ddev1', 'stream, unique-id=
=3Dalsa&lt;default&gt;, type=3DP' ]]<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Here is the virtual card listed in HVM guest:<o:p></=
o:p></p>
<p class=3D"MsoNormal">amd@amd-HVM-domU:~$ aplay -l<o:p></o:p></p>
<p class=3D"MsoNormal">**** List of PLAYBACK Hardware Devices ****<o:p></o:=
p></p>
<p class=3D"MsoNormal">card 0: vsnd [], device 0: dev1 [Virtual card PCM]<o=
:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; Subdevices: 0/1<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; Subdevice #0: subdevice #0<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am trying to play audio in guest HVM using aplay c=
ommand: aplay sample.wav. However, I am not able to hear any audio in this =
case.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Please note that if I play the wave file from dom 0 =
using the same command, audio can be heard. This means that audio is workin=
g fine in the dom 0 using default card.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Below is the log from snd_be. Has anyone tried ALSA =
back end before? If yes, can you help me in understanding the issue here?<o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:37.240 | Main | INF - backend version=
:&nbsp; v0.2.1-6-gb276<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:37.240 | Main | INF - libxenbe versio=
n: v0.2.1-11-g2e55-dirty<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:37.240 | XenStore | DBG - Create xen =
store<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:37.240 | XenStore | DBG - Read string=
 domid : 0<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:37.240 | XenStore | DBG - Read int do=
mid : 0<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:37.241 | SndBackend | DBG - Create ba=
ckend, device: vsnd, dom Id: 0<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:37.241 | XenStore&nbsp;&nbsp; | DBG -=
 Start<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:37.241 | XenStore&nbsp;&nbsp; | DBG -=
 Set watch: /local/domain/0/backend/vsnd<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:37.241 | XenStore&nbsp;&nbsp; | DBG -=
 Watch triggered: /local/domain/0/backend/vsnd<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.469 | XenStore&nbsp;&nbsp; | DBG -=
 Watch triggered: /local/domain/0/backend/vsnd<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.470 | XenStore&nbsp;&nbsp; | DBG -=
 Set watch: /local/domain/0/backend/vsnd/1<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.470 | XenStore&nbsp;&nbsp; | DBG -=
 Watch triggered: /local/domain/0/backend/vsnd<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.470 | XenStore&nbsp;&nbsp; | DBG -=
 Watch triggered: /local/domain/0/backend/vsnd<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.471 | XenStore&nbsp;&nbsp; | DBG -=
 Watch triggered: /local/domain/0/backend/vsnd<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.471 | XenStore&nbsp;&nbsp; | DBG -=
 Watch triggered: /local/domain/0/backend/vsnd<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.471 | XenStore&nbsp;&nbsp; | DBG -=
 Watch triggered: /local/domain/0/backend/vsnd<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.472 | XenStore&nbsp;&nbsp; | DBG -=
 Watch triggered: /local/domain/0/backend/vsnd/1<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.472 | SndBackend | DBG - New front=
end found, domid: 1, devid: 0<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.472 | XenStore&nbsp;&nbsp; | DBG -=
 Create xen store<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.472 | SndFrontend | DBG - Dom(1/0)=
 Create frontend handler<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.473 | XenStore&nbsp;&nbsp;&nbsp; |=
 DBG - Read string /local/domain/1/device/vsnd/0/backend : /local/domain/0/=
backend/vsnd/1/0<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.473 | SndFrontend | DBG - Frontend=
 path: /local/domain/1/device/vsnd/0<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.473 | SndFrontend | DBG - Backend =
path:&nbsp; /local/domain/0/backend/vsnd/1/0<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.473 | XenStore&nbsp;&nbsp;&nbsp; |=
 DBG - Read string /local/domain/0/backend/vsnd/1/0/state : 1<o:p></o:p></p=
>
<p class=3D"MsoNormal">01.09.22 12:46:50.473 | XenStore&nbsp;&nbsp;&nbsp; |=
 DBG - Read int /local/domain/0/backend/vsnd/1/0/state : 1<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.473 | SndFrontend | INF - Close<o:=
p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.473 | SndFrontend | INF - Dom(1/0)=
 Set backend state to: [Closing]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.473 | XenStore&nbsp;&nbsp;&nbsp; |=
 DBG - Write int /local/domain/0/backend/vsnd/1/0/state : 5<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.473 | XenStore&nbsp;&nbsp;&nbsp; |=
 DBG - Write string /local/domain/0/backend/vsnd/1/0/state : 5<o:p></o:p></=
p>
<p class=3D"MsoNormal">01.09.22 12:46:50.473 | SndFrontend | INF - Dom(1/0)=
 Set backend state to: [Closed]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.473 | XenStore&nbsp;&nbsp;&nbsp; |=
 DBG - Write int /local/domain/0/backend/vsnd/1/0/state : 6<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.474 | XenStore&nbsp;&nbsp;&nbsp; |=
 DBG - Write string /local/domain/0/backend/vsnd/1/0/state : 6<o:p></o:p></=
p>
<p class=3D"MsoNormal">01.09.22 12:46:50.474 | SndFrontend | INF - Dom(1/0)=
 Set backend state to: [Initializing]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.474 | XenStore&nbsp;&nbsp;&nbsp; |=
 DBG - Write int /local/domain/0/backend/vsnd/1/0/state : 1<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.474 | XenStore&nbsp;&nbsp;&nbsp; |=
 DBG - Write string /local/domain/0/backend/vsnd/1/0/state : 1<o:p></o:p></=
p>
<p class=3D"MsoNormal">01.09.22 12:46:50.474 | PulseMainloop | DBG - Init<o=
:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.477 | PulseMainloop | DBG - Contex=
t is ready<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.477 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Set watch: /local/domain/0/backend/vsnd/1/0<o:p></o:p></=
p>
<p class=3D"MsoNormal">01.09.22 12:46:50.477 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Set watch: /local/domain/1/device/vsnd/0/state<o:p></o:p=
></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.478 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Set watch: /local/domain/0/backend/vsnd/1/0/state<o:p></=
o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.478 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Start<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.478 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Watch triggered: /local/domain/0/backend/vsnd<o:p></o:p>=
</p>
<p class=3D"MsoNormal">01.09.22 12:46:50.478 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Watch triggered: /local/domain/1/device/vsnd/0/state<o:p=
></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.478 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Watch triggered: /local/domain/0/backend/vsnd/1<o:p></o:=
p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.478 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Read string /local/domain/1/device/vsnd/0/state : 1<o:p>=
</o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.478 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Read int /local/domain/1/device/vsnd/0/state : 1<o:p></o=
:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.478 | SndFrontend&nbsp;&nbsp; | IN=
F - Dom(1/0) Frontend state changed to: [Initializing]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.478 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Watch triggered: /local/domain/0/backend/vsnd<o:p></o:p>=
</p>
<p class=3D"MsoNormal">01.09.22 12:46:50.478 | SndFrontend&nbsp;&nbsp; | IN=
F - Dom(1/0) Set backend state to: [InitWait]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.479 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Watch triggered: /local/domain/0/backend/vsnd/1<o:p></o:=
p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.479 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Write int /local/domain/0/backend/vsnd/1/0/state : 2<o:p=
></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.479 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Write string /local/domain/0/backend/vsnd/1/0/state : 2<=
o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.479 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Watch triggered: /local/domain/0/backend/vsnd/1/0/state<=
o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.479 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Watch triggered: /local/domain/0/backend/vsnd<o:p></o:p>=
</p>
<p class=3D"MsoNormal">01.09.22 12:46:50.479 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Watch triggered: /local/domain/0/backend/vsnd/1<o:p></o:=
p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.479 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Read string /local/domain/0/backend/vsnd/1/0/state : 2<o=
:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.479 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Read int /local/domain/0/backend/vsnd/1/0/state : 2<o:p>=
</o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.479 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Watch triggered: /local/domain/0/backend/vsnd/1/0/state<=
o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.479 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Watch triggered: /local/domain/0/backend/vsnd/1/0<o:p></=
o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.479 | SndBackend&nbsp;&nbsp;&nbsp;=
 | DBG - Frontend path changed: /local/domain/0/backend/vsnd/1/0<o:p></o:p>=
</p>
<p class=3D"MsoNormal">01.09.22 12:46:50.479 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Read string /local/domain/0/backend/vsnd/1/0/state : 2<o=
:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.479 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Watch triggered: /local/domain/0/backend/vsnd<o:p></o:p>=
</p>
<p class=3D"MsoNormal">01.09.22 12:46:50.480 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Read int /local/domain/0/backend/vsnd/1/0/state : 2<o:p>=
</o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.480 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Watch triggered: /local/domain/0/backend/vsnd/1<o:p></o:=
p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.480 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Watch triggered: /local/domain/0/backend/vsnd/1/0<o:p></=
o:p></p>
<p class=3D"MsoNormal">01.09.22 12:46:50.480 | SndBackend&nbsp;&nbsp;&nbsp;=
 | DBG - Frontend path changed: /local/domain/0/backend/vsnd/1/0<o:p></o:p>=
</p>
<p class=3D"MsoNormal">01.09.22 12:47:03.021 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Watch triggered: /local/domain/1/device/vsnd/0/state<o:p=
></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.022 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Read string /local/domain/1/device/vsnd/0/state : 3<o:p>=
</o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.022 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Read int /local/domain/1/device/vsnd/0/state : 3<o:p></o=
:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.022 | SndFrontend&nbsp;&nbsp; | IN=
F - Dom(1/0) Frontend state changed to: [Initialized]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.022 | SndFrontend&nbsp;&nbsp; | DB=
G - onBind<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.022 | SndFrontend&nbsp;&nbsp; | DB=
G - Found device: 0<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.022 | SndFrontend&nbsp;&nbsp; | DB=
G - Found stream: 0<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.022 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Read string /local/domain/1/device/vsnd/0/0/0/unique-id =
: alsa&lt;default&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.022 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Read string /local/domain/1/device/vsnd/0/0/0/type : p<o=
:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.023 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Read string /local/domain/1/device/vsnd/0/0/0/event-chan=
nel : 31<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.023 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Read int /local/domain/1/device/vsnd/0/0/0/event-channel=
 : 31<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.023 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Read string /local/domain/1/device/vsnd/0/0/0/ring-ref :=
 321<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.023 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Read int /local/domain/1/device/vsnd/0/0/0/ring-ref : 32=
1<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.023 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Read string /local/domain/1/device/vsnd/0/0/0/evt-event-=
channel : 32<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.023 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Read int /local/domain/1/device/vsnd/0/0/0/evt-event-cha=
nnel : 32<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.023 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Read string /local/domain/1/device/vsnd/0/0/0/evt-ring-r=
ef : 1437<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.023 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | DBG - Read int /local/domain/1/device/vsnd/0/0/0/evt-ring-ref =
: 1437<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.024 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp; | DBG - Create event channel, dom: 1, remote port: 32, local port: 76=
<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.024 | XenGnttabBuffer | DBG - Crea=
te grant table buffer, dom: 1, count: 1, ref: 1437, buffer offset: 0<o:p></=
o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.024 | RingBuffer&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Create ring buffer, port: 32, ref: 1437<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.024 | SndFrontend&nbsp;&nbsp;&nbsp=
;&nbsp; | INF - Dom(1/0) Add ring buffer, ref: 1437, port: 32<o:p></o:p></p=
>
<p class=3D"MsoNormal">01.09.22 12:47:03.024 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Start event channel, port: 76<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.024 | SndFrontend&nbsp;&nbsp;&nbsp=
;&nbsp; | DBG - Parse stream id: alsa&lt;default&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.024 | SndFrontend&nbsp;&nbsp;&nbsp=
;&nbsp; | DBG - Create pcm device, type: ALSA, device: default, propName: ,=
 propValue:<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.024 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Create pcm device: default<o:p></o:p></=
p>
<p class=3D"MsoNormal">01.09.22 12:47:03.024 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 76<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.024 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Create event channel, dom: 1, remote port: 31, lo=
cal port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.024 | XenGnttabBuffer | DBG - Crea=
te grant table buffer, dom: 1, count: 1, ref: 321, buffer offset: 0<o:p></o=
:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.024 | RingBuffer&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Create ring buffer, port: 31, ref: 321<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.024 | CommandHandler&nbsp; | DBG -=
 Create command handler, dom: 1<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.024 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Create stream ring buffer, id: alsa&lt;default&gt;<o:p=
></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.024 | SndFrontend&nbsp;&nbsp;&nbsp=
;&nbsp; | INF - Dom(1/0) Add ring buffer, ref: 321, port: 31<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.024 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Start event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.024 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.025 | SndFrontend&nbsp;&nbsp;&nbsp=
;&nbsp; | INF - Dom(1/0) Set backend state to: [Connected]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.025 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; | DBG - Write int /local/domain/0/backend/vsnd/1/0/s=
tate : 4<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.025 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; | DBG - Write string /local/domain/0/backend/vsnd/1/=
0/state : 4<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.026 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; | DBG - Watch triggered: /local/domain/0/backend/vsn=
d/1/0/state<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.026 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; | DBG - Watch triggered: /local/domain/0/backend/vsn=
d<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.026 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; | DBG - Watch triggered: /local/domain/0/backend/vsn=
d/1<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.026 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; | DBG - Read string /local/domain/0/backend/vsnd/1/0=
/state : 4<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.026 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; | DBG - Read int /local/domain/0/backend/vsnd/1/0/st=
ate : 4<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.026 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; | DBG - Watch triggered: /local/domain/0/backend/vsn=
d/1/0<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.026 | SndBackend&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Frontend path changed: /local/domain/0/backend/vsnd/1/=
0<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.034 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; | DBG - Watch triggered: /local/domain/1/device/vsnd=
/0/state<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.034 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; | DBG - Read string /local/domain/1/device/vsnd/0/st=
ate : 4<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.034 | XenStore&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; | DBG - Read int /local/domain/1/device/vsnd/0/state=
 : 4<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:03.034 | SndFrontend&nbsp;&nbsp;&nbsp=
;&nbsp; | INF - Dom(1/0) Frontend state changed to: [Connected]<o:p></o:p><=
/p>
<p class=3D"MsoNormal">01.09.22 12:47:04.390 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.390 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.390 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.390 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Opening pcm device for queries: default=
<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.395 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.395 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.395 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.395 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.395 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.395 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.395 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.395 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.395 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.395 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.395 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.395 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.395 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.395 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.395 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.396 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.396 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.396 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.396 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.396 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.396 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.396 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.396 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.396 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.396 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.396 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.396 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.396 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.396 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.396 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.396 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.396 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.396 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.396 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.396 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.396 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.396 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.396 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.396 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.396 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.397 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.397 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.397 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.397 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.397 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.397 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.397 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.397 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.397 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.397 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.397 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.397 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.397 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.397 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.397 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.397 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.397 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.397 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.397 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.397 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.397 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.397 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.397 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.397 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.397 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.397 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.398 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.398 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.398 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.398 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.398 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.398 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.398 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.398 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.398 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.398 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.398 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.398 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.398 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.398 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.398 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.398 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.398 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.398 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.398 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.398 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.398 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.398 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.398 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.398 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.398 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.398 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.398 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.398 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.398 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.399 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.399 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.399 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.399 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.399 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.399 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.399 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.399 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.399 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.399 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.399 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.399 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp; &nbsp;| DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.399 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.399 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.399 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.399 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.399 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.399 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.399 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.399 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.399 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.399 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.399 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.399 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.399 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.399 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.399 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.399 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.402 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.402 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.402 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.402 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.402 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.402 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.406 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.406 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.406 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.406 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.406 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.406 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.408 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.408 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp; &nbsp;| DBG - Request received, id: alsa&lt;default&gt;, cmd:0<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.408 | CommandHandler&nbsp; | DBG -=
 Handle command [OPEN]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.408 | CommandHandler&nbsp; | DBG -=
 Get buffer refs, directory: 316, size: 17632, in grefs: 5<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.408 | XenGnttabBuffer | DBG - Crea=
te grant table buffer, dom: 1, count: 1, ref: 316, buffer offset: 0<o:p></o=
:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.409 | CommandHandler&nbsp; | DBG -=
 Gref address: 0x7fd1ea112004, numGrefs 5<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.409 | XenGnttabBuffer | DBG - Dele=
te grant table buffer<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.409 | CommandHandler&nbsp; | DBG -=
 Get buffer refs, num refs: 5<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.409 | XenGnttabBuffer | DBG - Crea=
te grant table buffer, dom: 1, count: 5, ref: 1485, buffer offset: 0<o:p></=
o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.409 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Open pcm device: default<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.409 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Close pcm query device: default<o:p></o=
:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.410 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Format: S16_LE, rate: 44100, channels: =
2, period: 4408, buffer: 17632<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.666 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Playback supports audio default timesta=
mps<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.668 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.669 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.681 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.681 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:1<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.681 | CommandHandler&nbsp; | DBG -=
 Handle command [CLOSE]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.681 | XenGnttabBuffer | DBG - Dele=
te grant table buffer<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.681 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Close pcm device: default<o:p></o:p></p=
>
<p class=3D"MsoNormal">01.09.22 12:47:04.684 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.685 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.689 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.689 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.689 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.689 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Opening pcm device for queries: default=
<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.691 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.691 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.691 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.694 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.694 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.694 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.694 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.694 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.694 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.695 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.696 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.696 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.696 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.696 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.696 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.699 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.699 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.699 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.699 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.699 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.699 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.699 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.699 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.700 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.700 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.700 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.700 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.700 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.700 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.700 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.700 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.700 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.700 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.700 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.700 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.700 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.700 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.701 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.701 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.701 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.701 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.701 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.701 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.701 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.701 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.701 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.701 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.701 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.701 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.701 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.701 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.701 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.701 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.701 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.701 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.702 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.702 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.702 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.702 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.702 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.702 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.702 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.702 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.702 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.702 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.702 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.702 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.702 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.702 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.703 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.703 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.703 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.703 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.703 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.703 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.703 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.703 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.703 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.703 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.703 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.703 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.703 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.703 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.704 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.704 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.704 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.704 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.704 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.704 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.704 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.704 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.704 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.704 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.704 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.704 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.704 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.704 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.704 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.704 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.704 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.704 | StreamRing&nbsp;&nbsp; &nbsp=
;&nbsp;&nbsp;| DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.704 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.704 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.704 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.704 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.705 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.705 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.705 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.705 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.705 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.705 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.705 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.705 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.705 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.705 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.705 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.705 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.705 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.705 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.705 | CommandHandler &nbsp;| DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.705 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.705 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.705 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.705 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.705 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.705 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.705 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.706 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.706 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.706 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.706 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.706 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.706 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.706 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.706 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.706 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.706 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:0<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.706 | CommandHandler&nbsp; | DBG -=
 Handle command [OPEN]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.706 | CommandHandler&nbsp; | DBG -=
 Get buffer refs, directory: 326, size: 17632, in grefs: 5<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.706 | XenGnttabBuffer | DBG - Crea=
te grant table buffer, dom: 1, count: 1, ref: 326, buffer offset: 0<o:p></o=
:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.706 | CommandHandler&nbsp; | DBG -=
 Gref address: 0x7fd1ea112004, numGrefs 5<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.707 | XenGnttabBuffer | DBG - Dele=
te grant table buffer<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.707 | CommandHandler&nbsp; | DBG -=
 Get buffer refs, num refs: 5<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.707 | XenGnttabBuffer | DBG - Crea=
te grant table buffer, dom: 1, count: 5, ref: 319, buffer offset: 0<o:p></o=
:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.707 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Open pcm device: default<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.707 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Close pcm query device: default<o:p></o=
:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.708 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Format: S16_LE, rate: 44100, channels: =
2, period: 4408, buffer: 17632<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.710 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Playback supports audio default timesta=
mps<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.712 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.712 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.712 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.712 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.712 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.712 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Opening pcm device for queries: default=
<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.715 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.715 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.715 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.715 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.715 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.715 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.715 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.715 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.715 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.715 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.715 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.715 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.715 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.715 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.715 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.716 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.716 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.716 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.716 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.716 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.716 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.716 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.716 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.716 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.716 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.716 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.716 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.716 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.716 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.716 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.716 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.716 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.716 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.716 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.716 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.716 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.717 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.717 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.717 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.717 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.717 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.717 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.717 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.717 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.717 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.717 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.717 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.717 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.717 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.717 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.717 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.718 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.718 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp; &nbsp;| DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.718 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.718 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.718 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.718 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.718 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.718 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.718 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.718 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.718 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.718 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.718 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.718 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:9<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.718 | CommandHandler&nbsp; | DBG -=
 Handle command [QUERY_HW_PARAM]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.718 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Query pcm device default for HW paramet=
ers<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.718 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.718 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.727 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.727 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:3<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.727 | CommandHandler&nbsp; | DBG -=
 Handle command [WRITE]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.727 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Write to pcm device: default, size: 440=
8<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.727 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.727 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.729 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Event received, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.729 | StreamRing&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Request received, id: alsa&lt;default&gt;, cmd:8<o:p><=
/o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.729 | CommandHandler&nbsp; | DBG -=
 Handle command [TRIGGER][START]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.729 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Start<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.731 | CommandHandler&nbsp; | DBG -=
 Return status: [0]<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.731 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 77<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.756 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Frame: 0, bytes: 17632, state: 4<o:p></=
o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.756 | RingBuffer&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Send event, port: 32, prod: 0, cons: 0, num events: 63=
<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.756 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 76<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.780 | AlsaPcm&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | DBG - Frame: 0, bytes: 17632, state: 4<o:p></=
o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.780 | RingBuffer&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | DBG - Send event, port: 32, prod: 1, cons: 1, num events: 63=
<o:p></o:p></p>
<p class=3D"MsoNormal">01.09.22 12:47:04.780 | XenEvtchn&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | DBG - Notify event channel, port: 76<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Jyotirmoy<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM6PR12MB4297D06B82525583A22B58E19F7B9DM6PR12MB4297namp_--

