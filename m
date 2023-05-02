Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA576F4886
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 18:41:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528754.822297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptt3D-0000L1-1H; Tue, 02 May 2023 16:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528754.822297; Tue, 02 May 2023 16:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptt3C-0000IZ-UK; Tue, 02 May 2023 16:40:26 +0000
Received: by outflank-mailman (input) for mailman id 528754;
 Tue, 02 May 2023 16:40:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wkLo=AX=citrix.com=prvs=4791b1cf6=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1ptt3B-0000IQ-8V
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 16:40:25 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07ec211e-e908-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 18:40:23 +0200 (CEST)
Received: from mail-mw2nam12lp2041.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2023 12:40:21 -0400
Received: from DM6PR03MB5372.namprd03.prod.outlook.com (2603:10b6:5:24f::15)
 by CO1PR03MB5892.namprd03.prod.outlook.com (2603:10b6:303:9f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 16:40:18 +0000
Received: from DM6PR03MB5372.namprd03.prod.outlook.com
 ([fe80::4418:2c5d:f218:e58]) by DM6PR03MB5372.namprd03.prod.outlook.com
 ([fe80::4418:2c5d:f218:e58%7]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 16:40:17 +0000
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
X-Inumbo-ID: 07ec211e-e908-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683045623;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4mYyoRkb2KBysrxE5QbSTOtHlQEiOZdXXNJTxWMpNh8=;
  b=KRIcwXlYNbPPyhnYQXIR7U34Svr9dbXmRbUeCCFL2ZU8YO6LA1MurJua
   9peNYMdZZAYINLF0+OUq5ICTChL1kLPKNay0rx+RjFWXE443BGBsIc4Z6
   zoHjCeWNXgK9M7mdeIYXGkP2JBwIPdNiAma6u/SXv0BJdvvRrGSxUlAg6
   g=;
X-IronPort-RemoteIP: 104.47.66.41
X-IronPort-MID: 110048524
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:JW9YbKodScoReLkXi+lcRiD2+4NeBmL8ZBIvgKrLsJaIsI4StFCzt
 garIBnUPv3YYTH2ct91Pd+3/U4HuZTVmoNkTQNp/i80HnlA9JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WJwUmAWP6gR5weDzyNNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACIBTQuuucmY/IK+ScRhjZUqPOrZYqpK7xmMzRmBZRonabbqZvyQoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3juarbIO9lt+iHK25mm6Co
 XnduWDwDRwAK9WbzRKO8262h/+JliT+MG4XPOThrqY20ADJmgT/DjUGBEOk/KGooHKFYIoCd
 k092QcpoIEboRnDot7VGkfQTGS/lg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQC1
 FCTmMjyLSdyq7DTQnWYnp+Pti+7MyURKW4EZAcHQBED7t2lp5s85jrISttgC6ezgsfCBSDrw
 zuKoS49gJ0elccOka68+DjviiKmoZXhTQMv4AjTGG6mhj6Vf6agbo2srF3Et/BJKd/DSkHb5
 CRd3c+D8OoJEJeB0jSXR/kAF62o4PDDNyDAhVloHN8q8DHFF2OfQL28KQpWfC9BWvvosxeyC
 KMPkWu9PKNuAUY=
IronPort-HdrOrdr: A9a23:N70KvqCEqzrvKHXlHela55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZImPHrP4gr5N0tOpTntAse9qDbnhPxICOoqTNCftWvdyQiVxehZhOOP/9SjIVyaygc078
 xdmsNFebnN5DZB7PoT4GODYqkdKNvsytHXuQ8JpU0dPD2DaMtbnndE4h7wKDwOeOHfb6BJaa
 Z14KB81kKdUEVSVOuXLF8fUdPOotXa/aiWHSLvV3YcmXKzZSrD0s+BLySl
X-Talos-CUID: =?us-ascii?q?9a23=3AWrTpcWlDvgSpPDMMge7cdhOyfJPXOW/R72z9HWS?=
 =?us-ascii?q?WNVZsS5CYQg6Z6IBWzeM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AJIwiIQ6DoQb2wlMOhyuCJ4gsxox4sryxVRgcu6k?=
 =?us-ascii?q?9gJHZaC1ZGBqagR2eF9o=3D?=
X-IronPort-AV: E=Sophos;i="5.99,244,1677560400"; 
   d="scan'208";a="110048524"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pt7AcETFJHnpYgkREil2HpNjnnM+VD6AqXHWcgo0Gb3zyh5CWX2qqx26fI6y6uJnSxdFXyzHxs2pzFuP+oQl6WIdsNm5gzGt9AFZADblCtUkzc5l3ldZqZcNFI7iYhCvvqXJcY5Yrsdmq15AWhIZVfCtkGPEm5pyinwzQXNK3QcFwRNdx9FwXcqQi7KG55CwV1+nSN6Hl4Wz9ZOP6BlJBHhNtH4qQHd9oKbZ7R2xI6y/RgYsThLjMTM8QKB2zvjkBrFnEetrY9aQHinX3QtQ1+U83Bo0QKbA2h4d+neirtVLsoG8dbUvYaEgxYlw46irhpM3/0NY5zwRdriIoJbY4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mYyoRkb2KBysrxE5QbSTOtHlQEiOZdXXNJTxWMpNh8=;
 b=j8c1QcRoWnYQSVMzUxsedD/nGCzLkt+QT69PdIIyEKkkPijDpv7HV3bK9xrwOy7dlvBx3dOKavvAJbYNvyVRPuMjGQb6hXptWT9QwWH64H3rgQe1NYSnUBvozduVe/dXQi9S5eWGx7XyxPU+RSzBV2/55Ui7uNtagEraKQvLGW/hrQ4qVKC/XWw4KC6O2DN82j8K77AKS0+vxnbpdOsW1Ai/WZQ6Svqmi8qm3CTsxEVaE/wi1XH1g32f3GX6my4Y794VlAV3JpHIdiUXDRHve2P1Nvm4UmJEJUmvEes20GV7US7v0YobmO/Zuz9jx/p9Tqg5Y7sN6+qp0O6e59TmGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mYyoRkb2KBysrxE5QbSTOtHlQEiOZdXXNJTxWMpNh8=;
 b=Xi5mFnm3sSuJU4jwnGKbAD+xlD0rtbMKCm2sV9whAWXD2pSKnIjdFp91OID8f6+oN48rWP4UTm1BxV5GlPSsoxQnxy0ZgeNq1dbzauPTR7GGdz+oTgxoNeYhc5L2uKwEHdfNXBrwIDN5beKS2sDKwRXVtLvL90ChPa5iea8OZbo=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"jgross@suse.com" <jgross@suse.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "oleksandr_tyshchenko@epam.com"
	<oleksandr_tyshchenko@epam.com>, "axboe@kernel.dk" <axboe@kernel.dk>
Subject: Re: [PATCH] xen/blkfront: Only check REQ_FUA for writes
Thread-Topic: [PATCH] xen/blkfront: Only check REQ_FUA for writes
Thread-Index: AQHZeF3Nw+6VlmAXM0WLxiEiRURXM69HLPoAgAAImgI=
Date: Tue, 2 May 2023 16:40:17 +0000
Message-ID:
 <DM6PR03MB53726982B16DC1FA7B77D143F06F9@DM6PR03MB5372.namprd03.prod.outlook.com>
References: <20230426164005.2213139-1-ross.lagerwall@citrix.com>
 <ZFEzAnOskzdb61O4@Air-de-Roger>
In-Reply-To: <ZFEzAnOskzdb61O4@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB5372:EE_|CO1PR03MB5892:EE_
x-ms-office365-filtering-correlation-id: 0351faf7-db63-42f8-6600-08db4b2be99a
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ZSGq2kmR/cv1P1xiJIMt2SrYx0bQJqV0Q/3dawkb0LY2bd8xR/0Bh2QjLQfxezpVWsjEsdClm842MrjxXxef02wZEczPm3xjxQx1Q/0ihpXGBfcAVA3es/F4mBurb4kA7iZfgGnhhlLMwx6ku7r3LMgX/wSkmvmz5bvJfkhJWsZ9qpIC/1ACnPqQeiTn2nPZUpLq6KijDLrKzpiLfnfvFDvnesBSnwziduf70FMgn0sPTNkV7Wv0/Vqcm+zDK1oYodHfMZ9Gr2c/OxSrDhoboWeOZap53fMIgJpybl24pUkvsbAk51LZkA0JhN7z8gSFBwZHkkZVSwceyhs1Np8u+MBT/v3XTqG3u+3RC8jSjVE8zl7xrxrYp+voZdqDVsXs96RH9bArNWi//CwE4XxmqT5Pj3utnwUFJWS8QYn/7BcRQuzwDBw/mv1Ddm1iGTuYnXeQAMVA+DCFhO8bXP6egpizPvvKo0qZkS7PUY+NhZW/2EtP+1341JzEzD86/7tYUeRJgmrH/PH2N/IXgLHI/inpKo5aDHjgPqvee/zrxbVqjj1JC182hVPKAHWkW/Z5W1VhoyGxoq5hcfCs9tI+tS/f96BLZWlwLHeruaHA/ls=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5372.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(376002)(396003)(39860400002)(346002)(451199021)(66556008)(64756008)(2906002)(76116006)(66446008)(66476007)(66946007)(52536014)(86362001)(44832011)(5660300002)(8676002)(478600001)(8936002)(55016003)(91956017)(6636002)(4326008)(71200400001)(33656002)(54906003)(316002)(41300700001)(966005)(82960400001)(7696005)(122000001)(9686003)(53546011)(6506007)(186003)(83380400001)(26005)(38070700005)(6862004)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?+Mb5GxzHf2RJQYXMthwL7DFuzgmC4BBc6lp4iK4hLGu7FkRfx1Hlf/c7Rk?=
 =?iso-8859-1?Q?aH2e4LZjP8DWs4w9H6xK1imwlA/Wb+bi5/v500MXcNZ0777AwcH4YD8l4l?=
 =?iso-8859-1?Q?rKEei7toX9KDHQTK6wXjsXiw6cTxMZLo5aQO/NtuuJcuRlsYkKNVfcgj24?=
 =?iso-8859-1?Q?gFijuZ49oTAwqbmV8OnUwzBr5HXfQqNQSEkAxE9xMocqkWufLbyRamAfV7?=
 =?iso-8859-1?Q?4GaMjE6rC2baQfTNeiaT1rg8QBk6REwodq2zvYJ6s+wEgnVf/U/MHgt1d8?=
 =?iso-8859-1?Q?UaUhch2nJ3x4lV4mwM70doFX6AibZflUT7wbN3hOSrFp7edq3FZ4QZ6l1L?=
 =?iso-8859-1?Q?L0l1EjoMnLsCKQ/yOmf8hynKzU8q6K44vSiuDPSFGNyHleWSEoMjWRhyGK?=
 =?iso-8859-1?Q?YsfiAkh6V+7b3PjJn0xWolUMDbPThWNx0+Lg6bmTtG6ZrMV4y7SMliGqYV?=
 =?iso-8859-1?Q?mDW0N52QFoijesS7nT8a2jKsjrWdNSa6zgVZ9ci/9LGEUW/SrD/nA/hUC2?=
 =?iso-8859-1?Q?rSTR6LlF2EniE35fwnvQts65zkwf2zYBqxIuVbXzjM553AD4X9IIMHE6oK?=
 =?iso-8859-1?Q?W5iaB00wKtpYN7RNiLhk6x58F9aC95MnZ1X7G20h6iBtMp2a+BPy7bRH5r?=
 =?iso-8859-1?Q?D0BLMjJOj4RJX2oLEgudj7GvP2eT4kRX10R/c5e8akNdByW4rVcgdVbGcF?=
 =?iso-8859-1?Q?2uLE17nik4qYkTlizqHn8W4nliaDr2sHD+qbthULQ4EtpkABQE8ZPV2Qln?=
 =?iso-8859-1?Q?oCyxH77GkVp2YrkMX/gPKzy0eBe20JOlJq6cR7rcPbcjGtEDVpcv+A/nLg?=
 =?iso-8859-1?Q?y+21ZInpcubQ/7tlna+kawnMzZwRd2lOUWWh+juAjFEMxFZLAr4PEgeUaD?=
 =?iso-8859-1?Q?sCErqe7KIm/RfrWlIK92JX9fqaworTocidOS/z7J62CksX0evF8xcgQ+pu?=
 =?iso-8859-1?Q?ozRR3wscG3HxVVbQB+fo8laQuUZbl/OevHu1oLL9q0+IFy7cB9bru9AWbe?=
 =?iso-8859-1?Q?Wd1j+RSQmIsCzsFJwAm7Iq2WobcceK8U2V+aOEZxIrQttgHon2nIFzYLAA?=
 =?iso-8859-1?Q?PELFSxiN1OuDpB0mMiDL0o59axi6n4xX2YSS9Y5O4Xx6GVHcCoSG3ij/MW?=
 =?iso-8859-1?Q?hBmOEzmId8U/hGuawmQaaf2gYHhsT7+kwjDJ4b26P71kgPahvlcWV7p5/r?=
 =?iso-8859-1?Q?E3xKGT2OyBz+/0evAFtYe3N+vXqLG3gLbdqrVJonZXR7rVNDE45XOZv6CY?=
 =?iso-8859-1?Q?JH/zhSU5upifIDW4Ps05wWayYKv7WDPaOtuFdmCNZujwinGFnultvYRwvq?=
 =?iso-8859-1?Q?y/mqo4pqnGTEJ3OpMJvLKW2lmzCoTGnBYwDaTSMZXPHskpgJC4iU3xXtII?=
 =?iso-8859-1?Q?x0UzTjSEST1HzYHICeUWlhxyaC/6ZvvJbfiqctV6Qrq5YfOVwWu9TZy7cZ?=
 =?iso-8859-1?Q?UG/jMv6r3rkouVue9y5pXAfnXXCO2f37qbYVxKz0UWD/94nZNRUm0pndMD?=
 =?iso-8859-1?Q?q7PCkVfQvXd+Ah5MLCNnaZABB5JlMeAJOQgCXuOlG/B71Z0bkKWxkRCqDV?=
 =?iso-8859-1?Q?WO1c4x6P7S8yoGXnhPf92IIIsLlheYHWDsOT5vAEYTnNqV8KhNkUW+RZIE?=
 =?iso-8859-1?Q?6SwWWyva+TlV0pyHLnP7m6Iq37C+xyiQpQ?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eliju2Rl4GyG3YiF9I9GWR+CXfwxErVP4SObx55TQQabDr68Tz6tkl2O01HoEEuj81qotQkcPZ/86Eubm3R0jnotc0v9RJGwI2LwjvEuQqr/0OeZiJs31qxhKGU9bm7zuuvg3PQ3Pl2khwP4vU1WaDzk2t7PWsbGhGqQabTM1NnkbPLUnyFOxQPVZXXqsYg2OmI5oU+AQ0mLtftYNqaYLEEt48eoEovF/cbpXyY+PXqroql1riyXhLm6JKL2n3mDfvt/nMTQOX/C49XyrjO1oMqUP9mww3pm4vkeXJPaT8HX4QSjuWVOLxeKjFJEpgPSI9Sk+ZPUx06lHcbe38uIo9tgnBgOdOw8MWaV+QUm2s/EfzxUETn6qwPQfk+Ymd3vuBrl+Xn1b0UBvfySnxAlSYS7vxhk7qkz6DboA7IPOJLG8vE9PGqkOW4oy2TLb4NRmGDx7cFQCtq36DGB1UlYs32CaxevKyj0QasvPRkbuna7Qs4diuFk6lzthlEA0UmTY8+AvnPNhl7RESxW5K21G1C+EgdVsAevlf330wR/vLf65JGZrHic+6rhnCtmyMPgJLWLzPsovqt/FmGLsu7n2N7cdzaGctftKJNdwi379Saai3wis3/ZGmRLtWxAcTlZllkqZQxQDj3wHMFGpQUVocixgwlQ8nC31uXr1Q6RYiJpA+y9gwZFca2AyHoVaAYTEV1xvkJeg83mcLRbqv9Pu3FKZOdG53a4YkQV+MU2lZNwEggJHQUuQ11jEm/bqOxNtB0y6kvCz6qkTpUJYuzFQz+YPqXRhZ6+zh3K9bvrorGQCmp7I7UaQks/x7oPuYY/l+O8ITO+438sHO+qFpofWymH8ToO5kPztDnUbCqrqFwLvZZfYEheybjwiOMSJiYA
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5372.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0351faf7-db63-42f8-6600-08db4b2be99a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2023 16:40:17.7892
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bMZAauT5joSy/R2Os63qhree6c3RugFqbGxuned7KyfmYchAU0plkj5HYz/Jg2XPIS1dws4CGSB+Shl/KhR64jzuJAlCo5CJAqIYIGvosCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5892

> From: Roger Pau Monne <roger.pau@citrix.com>=0A=
> Sent: Tuesday, May 2, 2023 4:57 PM=0A=
> To: Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
> Cc: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>; jgro=
ss@suse.com <jgross@suse.com>; sstabellini@kernel.org <sstabellini@kernel.o=
rg>; oleksandr_tyshchenko@epam.com <oleksandr_tyshchenko@epam.com>; axboe@k=
ernel.dk <axboe@kernel.dk>=0A=
> Subject: Re: [PATCH] xen/blkfront: Only check REQ_FUA for writes =0A=
> =A0=0A=
> On Wed, Apr 26, 2023 at 05:40:05PM +0100, Ross Lagerwall wrote:=0A=
> > The existing code silently converts read operations with the=0A=
> > REQ_FUA bit set into write-barrier operations. This results in data=0A=
> > loss as the backend scribbles zeroes over the data instead of returning=
=0A=
> > it.=0A=
> > =0A=
> > While the REQ_FUA bit doesn't make sense on a read operation, at least=
=0A=
> > one well-known out-of-tree kernel module does set it and since it=0A=
> > results in data loss, let's be safe here and only look at REQ_FUA for=
=0A=
> > writes.=0A=
> =0A=
> Do we know what's the intention of the out-of-tree kernel module with=0A=
> it's usage of FUA for reads?=0A=
=0A=
It was just a plain bug that has now been fixed:=0A=
=0A=
https://github.com/veeam/blksnap/commit/e3b3e7369642b59e01c647934789e5e20b3=
80c62=0A=
=0A=
I think this patch is still worthwile since reads becoming writes is=0A=
asking for data corruption.=0A=
=0A=
> =0A=
> Should this maybe be translated to a pair of flush cache and read=0A=
> requests?=0A=
> =0A=
> > Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
> > ---=0A=
> >=A0 drivers/block/xen-blkfront.c | 3 ++-=0A=
> >=A0 1 file changed, 2 insertions(+), 1 deletion(-)=0A=
> > =0A=
> > diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.=
c=0A=
> > index 23ed258b57f0..c1890c8a9f6e 100644=0A=
> > --- a/drivers/block/xen-blkfront.c=0A=
> > +++ b/drivers/block/xen-blkfront.c=0A=
> > @@ -780,7 +780,8 @@ static int blkif_queue_rw_req(struct request *req, =
struct blkfront_ring_info *ri=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ring_req->u.rw.handle =3D =
info->handle;=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ring_req->operation =3D rq=
_data_dir(req) ?=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 BL=
KIF_OP_WRITE : BLKIF_OP_READ;=0A=
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (req_op(req) =3D=3D REQ_OP_FLU=
SH || req->cmd_flags & REQ_FUA) {=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (req_op(req) =3D=3D REQ_OP_FLU=
SH ||=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (req_op(req) =3D=3D R=
EQ_OP_WRITE && (req->cmd_flags & REQ_FUA))) {=0A=
> =0A=
> Should we print some kind of warning maybe once that we have received=0A=
> a READ request with the FUA flag set, and the FUA flag will have no=0A=
> effect?=0A=
> =0A=
=0A=
I thought of adding something like this but I couldn't find any other=0A=
block layer code doing a similar check (also it seems more appropriate=0A=
in the core block layer).=0A=
=0A=
WARN_ONCE(req_op(req) !=3D REQ_OP_WRITE && (req->cmd_flags & REQ_FUA));=0A=
=0A=
I can add it if the maintainers want it.=0A=
=0A=
Thanks,=0A=
Ross=

