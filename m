Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A17A6BD8C
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 15:51:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924129.1327469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvdiE-0007Bj-LU; Fri, 21 Mar 2025 14:51:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924129.1327469; Fri, 21 Mar 2025 14:51:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvdiE-00079f-IO; Fri, 21 Mar 2025 14:51:06 +0000
Received: by outflank-mailman (input) for mailman id 924129;
 Fri, 21 Mar 2025 14:51:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n2Zf=WI=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tvdiC-00079Z-Rj
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 14:51:04 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20603.outbound.protection.outlook.com
 [2a01:111:f403:2614::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8f2a11a-0663-11f0-9ea1-5ba50f476ded;
 Fri, 21 Mar 2025 15:51:03 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by GV1PR03MB10315.eurprd03.prod.outlook.com
 (2603:10a6:150:165::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Fri, 21 Mar
 2025 14:51:00 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8534.034; Fri, 21 Mar 2025
 14:51:00 +0000
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
X-Inumbo-ID: e8f2a11a-0663-11f0-9ea1-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xnbQ4BbbNxFtQlmurab+yEduXnDFeocz8jeqlW/ccwRFZzOzWCvkWUpRJDUHsCr4bimPKWFaxutFk/lHxEt0B5jv7A8QeIwMEuBihVH3Zjq5ZPWrRMtFqF5f9iL2r/izue6SKSuN/cSZ2azACajz3emI2UKW0AgjvsbwfkwFg0O8aF/Bc9LcG5c72OxDam+zFs6vGL1MGDK/MP4bggS2R65eu6vw5mbUcW67W6uXj6Qwpt3jRA3yf2kbGYTBWg47Z9g+NKO4kqxl/vV+TeSVVD/cp8tus8PYvuykmd0an9o4gJtWr0RUeRB/qPK37ZDbg+KluArChMRb02FaJQARZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnKdBgDj+T1LL4SWEpdz6QiIEAf6JheUdCqsio+5LYA=;
 b=wbW1TxzfmHDsWsNdvz4CkewACBZuXdZcD0ZHZ197fwISwq1lrhV6PL5SI2WLrh9YajFMmfT1fbeG4+XYyObzGgRgv2J0hLE8NoMeMjpqAVO1J4C4nYucUnUS7IWzW0/R8xMhJttveqzNQ3TfhpjcVMsxJ3g52C7f1FH6S5Q9Q8NMa5RuVoDjeUBNZupbBGUqlogOehjHBn+6WrGkSDYY3TSr/mFJAdI+cgNvSo6hCE0RUXHnAQg4Y5AZoW9wzEysHgYRO/sa8OC+Mw6UH607jaByY6JAKz4gkSWqfDkbQla+AR9SGZ7BT+h2mpj70bwEY2aYDteJiHezy+8nugOygw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnKdBgDj+T1LL4SWEpdz6QiIEAf6JheUdCqsio+5LYA=;
 b=U38ASFmsJZ37bEvhasYc7PzOSFi0Has6gvJp+jJfSNWdG7C+etu3kP2mZjqJwnVCtNeeZCHAncbuHLeIzg9PvFgknRAlfYWl7LQCDW4mS+adfjMwCGasuDvqBUnwpsEvBu66aMd5X1Dy3xPrsSV3Bs2YQ+PvAJBjIy3q4N96G/wJlk2v9X6XEDwAXrseToOYkTnLzRHVToeuysLUXTr3Np51hYHJLLCnq1MWRt5rC2l0YxR1ZmQkQLpE3ZQqNpPYtaz7+YhS50wzcjYzSToPkmgkY3gy3bCsmwpfJmvAK222J7s7ouiEKXHElvpBN/4Sst6aiUN8jda/O++uicB8SQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v9 7/8] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Topic: [PATCH v9 7/8] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Index: AQHblOXdxbIbbkNtn0WSg/9tW2OJ47N3cuWAgAYDBYCAAC5SAIAAE0cA
Date: Fri, 21 Mar 2025 14:50:59 +0000
Message-ID: <d79e9fe2-0239-4360-8b13-06498ce2c205@epam.com>
References: <cover.1741958647.git.mykyta_poturai@epam.com>
 <132afbca390edd6e9fd7b1ffacf6c5aff0d29aa7.1741958647.git.mykyta_poturai@epam.com>
 <7fa0bde7-3aa9-48f4-a0ed-d03216edcc4e@suse.com>
 <dbc57c17-867f-49c4-be61-186b5562eff1@epam.com>
 <f90b5092-1522-414a-b57a-7a9d116a1f43@suse.com>
In-Reply-To: <f90b5092-1522-414a-b57a-7a9d116a1f43@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|GV1PR03MB10315:EE_
x-ms-office365-filtering-correlation-id: 64053484-b0c7-4e79-552e-08dd6887cb80
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VnY2dFA0djlVNUVXTTlsWjdNR21qcExpdkpPL1hTQmh3cW51MkNQalR2SGxE?=
 =?utf-8?B?VVQxWHpLWmlpeDRaZXY4dUFzcUpzZWo0aERzRkN1RFFqT2gvR2xJOEptbjRH?=
 =?utf-8?B?UE9IYktGeWtHWWxHSGZpakU5MTZHY3V3djVnUTkxV29GSzVXcDRNMFpDMHJy?=
 =?utf-8?B?MzhkR1lYZEg1NnhZMHQvN0pUMThtY0hvbVlQclBtNytOb3RqN0xzcnJSdGZB?=
 =?utf-8?B?VmV6ZGhFR3ptSmJDRmpuZXlEOWZmdU9Pbjl4YVBqQ1dYRDlobkMwek1ZMnZJ?=
 =?utf-8?B?dEJLNFB1WmtiY1Z1WG1KN25ZKzVnMEZHV0V3TXlHaXIzRnBQVkpVYjJ1V2tH?=
 =?utf-8?B?N29jYkpWenBTUXhQZUpCSHZjZldCOFR0Q0N3eHRFSkhFc1dUeGxsYlR0K1lC?=
 =?utf-8?B?SGlUa0FnSlFwWStOdW41NGkxT3F4M3k4TTlXUnowSGx6WElwVUVtK3JUdUVp?=
 =?utf-8?B?Zy93UkZkNTdMaGc2eVpEMW1nRDdBaTVybnc3c3hDR0taMWszQzFkSU5vNlEz?=
 =?utf-8?B?Tm1UNm8xWEF2NFJYYVFqZ1lQdDRDVktBUWRpbnFHeFJCdFE5OFdoNDJ4UkFM?=
 =?utf-8?B?eDd6YitKdktpK3p2QVhuTUc2ZjltVTduUVFZNnRqTkFOdTFZQ2NLWFMxMnhs?=
 =?utf-8?B?Z1loSTNlVkY0dHBpVzY5RzNxeHNUbGtqTHFObEI0TEFGNG5RU0pOU0JlREla?=
 =?utf-8?B?REdKeVJ1VmRnTkRJdjlIdTBIN3NwOTlRQVU0VUZ2M1VkNngyVlNXRzI1RVdt?=
 =?utf-8?B?U1R4dDBhZEx1V3pXOGxFOUFGTVh1K2RWemEwUVZQYktTOVdCd3ljTnFDeWE4?=
 =?utf-8?B?UEtsczhhNFYvYms1S0p4VlZLS0hZcHVBNG95ZmpFbnlnR0J5RXFqTnRmOUsz?=
 =?utf-8?B?ZXdPdDZUOHFyVVl1dTRNUHh2VmM2Y1p1dkhIUHBPZ0k5bjZPTmhadW9HQzU1?=
 =?utf-8?B?N2Y4UUdheVdZVm1xa2wydDBTSjJ1aGV2STB1VlRFWXJPTUovTEpTSm1UOERi?=
 =?utf-8?B?ZEdQQ29BSXQ4TTMzYlZYeWRyUXhFVDBTdTNscTNDNUFjRUdxbEkrZmpsR2pS?=
 =?utf-8?B?NHNWejBjTy9UekRqVTBOSGN5Y3VpcEltenhnZFR0dEdubHhESysrSXp6RWtv?=
 =?utf-8?B?SkFuWmtDMmJqSFNnYjI3NW9CanJVMWZCYkxuVVFNcjE4SjB4ZHNOL3owTjdX?=
 =?utf-8?B?M2FjSTd2bnFhWWJHSlc2bHN4YnVmQi8rZm13THJ6b0R4em9xaDVnUUR5SHhz?=
 =?utf-8?B?eCtUWC9GR0J3MXBVU0ovL0NYdDZpS1BnSE5rWEQrTTcveWdkMFBMQ01LMk14?=
 =?utf-8?B?b3g2NTlWcXlIQ3NRZWJVYjZMVDlRb05zVy9yYll5bTBOeWFPOUpuMFA4d1hq?=
 =?utf-8?B?VEFWczJtRHRMWTVqMkY5MGFsNW5ZSkNMdGZqS3FKbVJCVXljWXBCYnNaSEU5?=
 =?utf-8?B?UTJ2K0NhNTRvdm5DUXRBYkNaNWExMWpXVDRIa1Zhb3ZOQjVUazMyMGdxVTdT?=
 =?utf-8?B?ZzJ5QW5FbUJtaGFJNUpxRWMrSk0zcHJoS2U5OThialBhOFloajRBTDJaR051?=
 =?utf-8?B?RHNiSHNZdE9BaTk3cEpnUGJMZ0lsS3ZNQWc2UEo1TXdqSE1oWnZkL0orZGRz?=
 =?utf-8?B?a3lxNG1CMDY1b09iek8vYStJd2tualVPSTd3Z0RYUFJxTHU5Q2J3Q0JGbkpC?=
 =?utf-8?B?MEViTVIySzdCbzNNZzF3QU5FNFJ6dUlrYko0V01PdWpNSmIrRXRRb3RpcHpT?=
 =?utf-8?B?NHZmMUJaQVFVWW5NbjRyYldFempFeTdJMC9LZmpjdjcyWmZDSHVKRlNGNXow?=
 =?utf-8?B?WmlCcXFmR0loaDhKdjdLbU9zQWpFUHlJZjNqN2VFT1lFdXZIVHZSTDJxa0sz?=
 =?utf-8?B?S0srZTVaaC9BR1FZMGlrSGd2WWQvQWF6YzVyRGlmdjVUdVFBSGQ1czhVb1lh?=
 =?utf-8?Q?1OJ5QFfbN3aJUIr3SnowGk9tCMduY74o?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZXFaZ2xEK0JMaFJ0V2RxMkJWUldlNXd0WVUrc3k1cFRoZ3gyak5iQ3RqczZ1?=
 =?utf-8?B?cUhiZG82S1d0UGVCL2tqNVBqeXM3cDJSd04weUxNWG9tTmZ1eDB6S3orSThS?=
 =?utf-8?B?TTVHZ2tJdDFDVlhSeVl6ME5vckpVS2JUWGVLc0dMMW12ejJGWE4wZUJ5TUo2?=
 =?utf-8?B?ZFFwc09iTmdXeXY5bUs1QllTWE1oWTBsTzNHam5GUlpJVHdYeHVNdTlIdVR6?=
 =?utf-8?B?cGdIQ0pPclZRZGpicGduN0RiR2s5UFA4KzZ4cno3WUR5N1ErT1RNOGhIRnVx?=
 =?utf-8?B?eUNZOEZNd2hFaEVPdG9VZmZ6RklkcWQ0U09hK1Zrdld5bm5TNE1NaFQ3QTRP?=
 =?utf-8?B?QUk2MVlJb1puMFNHdENqenNHOTE1bkVNdVAvMUdGajVYN2wvUjB0K0kxdDBk?=
 =?utf-8?B?Tmt2NTBvZ1ZMR1BxUnh4V0UrWE5DRC9DYWRYZVVaQjM2ZndTSkVnOVFPdFlI?=
 =?utf-8?B?NXpCM1g0Z1VDcHdOSFkzNDExUzRtNVJYMjVWTllCVnl4V3hCdy9nSU9NdVY4?=
 =?utf-8?B?QU5vK1NJR2lVQVU2TVh4SFliK1ZCVUdpM1NUV1pOazJTQUFTMzJpVXBudTYz?=
 =?utf-8?B?bE5KZ0dkY0ZVd2EvSk9kaklHRTRMUmx3SThnVmd2SVpRSVE3dHZmRXhiYVhz?=
 =?utf-8?B?bXlPWm93RzYxd3lWMm50MXVTbHFYRE1sQ1B3R2NPWm5zSEEyWHJDQ3orSVI4?=
 =?utf-8?B?Y3JNTWNudGovNUFBVDRlSFVhQXhOUFZoMkZlZDBMV21SaGVuZE9LRW1MdExx?=
 =?utf-8?B?UVhKTWY1OVFkU241NmtxOWRrTHJST0hZR2t0cDFOeStmK1gxNzVZa1pObHpi?=
 =?utf-8?B?MzVCd2VNbG5vRXFsN3ZGamJOeDJlSm55OWtJcmhkcGs3L2tNRjY3cjJINWJG?=
 =?utf-8?B?VHFiRmxZQmpDS0NzaHRRWUgwR1g5OG1rcU9VbDRyL04vajV5bk9ldWlUMmJk?=
 =?utf-8?B?T0c2RDVYVml1NHVoU3FMdnpPMDR3SFBESU1zZWFBMWxyL2F1enBweW9hSDNv?=
 =?utf-8?B?RFRqUEdWVW9hYjk2UUJZMksrT0p5TmJ4Z2FhMGlRRTBBWDdsVWJFK3RRblBi?=
 =?utf-8?B?TmdBS0hTNUZFMER3OWVGV1FPUXZLOHBrSWw4dCtDdzM5bmJ1c0NYQTJBb0VE?=
 =?utf-8?B?cTFmM2JmMVNmbG5oeG5ZUC82THZmZGNxaHp0dkZ4Z1RxWkdHcTJOd2thTHU5?=
 =?utf-8?B?WWhSWkltZGlSZHYwZXcrM1g3dU9RaHBWdUpQZC9hRmljbkdsMENCKzNqM2lq?=
 =?utf-8?B?eS96clFHSENncTVWM3phZnZML3JiTkk1NXZrWGF4VFFKcmZVMGxsSFdhb0R4?=
 =?utf-8?B?WDV1cVpwY3liNU56R0w2NWNEa2p5cVZlSUFnM3JYTTlJZjliTE5hNE5VOGFk?=
 =?utf-8?B?MnIxQmNKR1RudE5OSDgyRkdQU3Q5VW5jVnV0d0NTOU1aVVpPS09aaXdwQnFL?=
 =?utf-8?B?WkxDWFVBSlBDZlNpNUF3bWFTb29JMVIrM2pmNHJpZFlKK1FtWUpVRnRZekdw?=
 =?utf-8?B?WjRDbFpCQlVFTHVwZHVQd1o1MUE3SElPd29IS0w3SmNhMkpKaU5sMEp0QW5W?=
 =?utf-8?B?Z1BnNGpuWlRTYkdXNG1xR21XYVlFZnVNcVVGRXIxRjRORmZIcG5uRCtCeTIv?=
 =?utf-8?B?TDhrNm1MdUZobXV4U1NLd3lKRmFtaXNDUUlHeUliUFhaODZmZlAwNnZsRGtm?=
 =?utf-8?B?NDFIUkVzempVVmVsK3AvNlZsRlcrOURMVXJXd09VTE5idy9hVWIrWEQwNVV0?=
 =?utf-8?B?RTNBaXY2bUFDYW1HeHhEYklyTlNHL0ZzWjdtWnNsQ1pnVHZsQkhhMGJVMk9t?=
 =?utf-8?B?Y0hjRjRmK3doRHVxeXo5STZEbGFhYTlMdlFHblBCcjJNRTNtcjRvb1hkZWhI?=
 =?utf-8?B?a094eTBlUjh0OWpwVHNlc3had2xPWnBCK1RSRk01OHljeTFlTkxXblRjWjVH?=
 =?utf-8?B?b2lqdFRsSWhVaEZZdGd3V2ZXOU1XOXMrRU8yTUk1bm1zKzBTL2NCeW5rVXBY?=
 =?utf-8?B?NitzSzJDOFlHZXVCblByOUJWVytoUTQrR3h5cExrV2c2V095Y3dsTDdUMzhZ?=
 =?utf-8?B?UTVWak9zMzJFYThpS1RGZ1ZYbUFWYVcxU2tnM2RsY1NOcHAvUDJOR1NtK09Z?=
 =?utf-8?B?UFFrMmpmdGNNM1J6NHBtYVEzWWFJNU54MEQ0elNaYWhNNXFZeE4rWjlxZkN1?=
 =?utf-8?B?b1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B09D210A1C2A84D9785EFAD281C2038@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64053484-b0c7-4e79-552e-08dd6887cb80
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2025 14:51:00.0136
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9g1iQF5XPO6mfwuqVtu9Ls6Q0AeM1bgDESH/LI33HCut2YUpoMsy9ba88OCEc6dIf+vHbc3vCdZrvU/7INHcyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10315

T24gMjEuMDMuMjUgMTU6NDEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMS4wMy4yMDI1IDEx
OjU2LCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+IE9uIDE3LjAzLjI1IDE3OjA3LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAxNC4wMy4yMDI1IDE0OjM0LCBNeWt5dGEgUG90dXJhaSB3cm90
ZToNCj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL3BjaS9wY2kuYw0KPj4+PiArKysgYi94ZW4vYXJj
aC9hcm0vcGNpL3BjaS5jDQo+Pj4+IEBAIC0xNiw5ICsxNiwxOCBAQA0KPj4+PiAgICAjaW5jbHVk
ZSA8eGVuL2RldmljZV90cmVlLmg+DQo+Pj4+ICAgICNpbmNsdWRlIDx4ZW4vZXJybm8uaD4NCj4+
Pj4gICAgI2luY2x1ZGUgPHhlbi9pbml0Lmg+DQo+Pj4+ICsjaW5jbHVkZSA8eGVuL2lvbW11Lmg+
DQo+Pj4+ICAgICNpbmNsdWRlIDx4ZW4vcGFyYW0uaD4NCj4+Pj4gICAgI2luY2x1ZGUgPHhlbi9w
Y2kuaD4NCj4+Pj4gICAgDQo+Pj4+ICtib29sIGlzX3BjaV9wYXNzdGhyb3VnaF9lbmFibGVkKGJv
b2wgZG9tMCkNCj4+Pj4gK3sNCj4+Pj4gKyAgICBpZiAoIGRvbTAgKQ0KPj4+PiArICAgICAgICBy
ZXR1cm4gcGNpX3Bhc3N0aHJvdWdoX2VuYWJsZWQgfHwgaW9tbXVfZW5hYmxlZDsNCj4+Pg0KPj4+
IEFzIEkgdGhpbmsgSSBzYWlkIGJlZm9yZSAtIHRoZSBmdW5jdGlvbidzIG5hbWUgbm93IG5vIGxv
bmdlciBleHByZXNzZXMNCj4+PiB3aGF0IGl0IHJlYWxseSBjaGVja3MuIFRoYXQgKGltbyBoZWF2
aWx5KSBtaXNsZWFkaW5nIGF0IHRoZSB1c2Ugc2l0ZXMNCj4+PiBvZiB0aGlzIGZ1bmN0aW9uLg0K
Pj4NCj4+IEkgYW0gYWZyYWlkIEkgZG9uJ3QgdW5kZXJzdGFuZCB5b3VyIGNvbmNlcm4uIEl0IHN0
aWxsIGNoZWNrcyBpZiBQQ0kNCj4+IHBhc3N0aHJvdWdoIGlzIGVuYWJsZWQuIFdpdGgganVzdCB0
aGUgY2hhbmdlIHRoYXQgQVJNIG5lZWRzIHNvbWUgZXh0cmENCj4+IGxvZ2ljIGZvciBEb20wIFBD
SSB0byB3b3JrIHByb3Blcmx5Lg0KPiANCj4gQ29uY2VwdHVhbGx5IHRoZXJlJ3Mgbm8gc3VjaCB0
aGluZyBhcyAicGFzcyB0aHJvdWdoIiBmb3IgRG9tMC4gSGVuY2UgdGhlDQo+IG5hbWUgb2YgdGhl
IGZ1bmN0aW9uIGl0c2VsZiBpc24ndCBjb3JyZWN0bHkgcmVmbGVjdGluZyB3aGF0IGl0J3MgY2hl
Y2tpbmcNCj4gZm9yLiBpb21tdV9lbmFibGVkIGlzIGEgcHJlcmVxIGZvciBwYXNzLXRocm91Z2gg
dG8gYmUgZW5hYmxlZCwgYnV0IGl0DQo+IGRvZXNuJ3QgaW1wbHkgdGhhdCdzIG5lY2Vzc2FyaWx5
IHRoZSBjYXNlLg0KDQpPa2F5LCBub3cgSSB0aGluayBJIGdldCBpdC4gWWVzIGZyb20gdGhhdCBw
b2ludCBvZiB2aWV3IGl0IHNlZW1zIGtpbmQgb2YgDQp3cm9uZy4gTWF5YmUgdXNlIGEgc2VwYXJh
dGUgZnVuY3Rpb24gdGhlbiwgc29tZXRoaW5nIGxpa2UgImh3ZG9tX2hhc192cGNpIj8NCg0KPj4g
TWF5YmUgY2hhbmdlIHRoZSBwYXJhbWV0ZXIgbmFtZSB0bw0KPj4gc29tZXRoaW5nIGxpa2UgImZv
cl9wY2lfaHdkb20iPw0KPiANCj4gVGhhdCBtYXkgaGVscCBiZWxvdywgeWVzLiBCdXQgbm90IGhl
cmUuDQo+IA0KPj4+Pj4gQEAgLTg1LDcgKzk0LDcgQEAgc3RhdGljIGludCBfX2luaXQgcGNpX2lu
aXQodm9pZCkNCj4+Pj4gICAgICAgICAqIEVuYWJsZSBQQ0kgcGFzc3Rocm91Z2ggd2hlbiBoYXMg
YmVlbiBlbmFibGVkIGV4cGxpY2l0bHkNCj4+Pj4gICAgICAgICAqIChwY2ktcGFzc3Rocm91Z2g9
b24pLg0KPj4+PiAgICAgICAgICovDQo+Pj4+IC0gICAgaWYgKCAhcGNpX3Bhc3N0aHJvdWdoX2Vu
YWJsZWQgKQ0KPj4+PiArICAgIGlmICggIWlzX3BjaV9wYXNzdGhyb3VnaF9lbmFibGVkKHRydWUp
ICkNCj4+Pg0KPj4+IFRoZXJlJ3Mgbm8gRG9tMCBpbiBzaWdodCBhbnl3aGVyZSBoZXJlLCBpcyB0
aGVyZT8gSG93IGNhbiB5b3UgcGFzcyB0cnVlDQo+Pj4gYXMgYXJndW1lbnQgZm9yIHRoZSAiZG9t
MCIgcGFyYW1ldGVyPw0KPj4NCj4+IFRoaXMgc2hvdWxkIGJlIHJlYWQgYXMgImlzIHBjaSBwYXNz
dGhyb3VnaCBlbmFibGVkIGZvciBEb20wPyIgYW5kIGlmIGl0DQo+PiBpcyB3ZSBkZWZpbml0ZWx5
IG5lZWQgdG8gZG8gYSBQQ0kgaW5pdC4NCj4+DQo+PiBJJ3ZlIGFsc28gZG9uZSBzb21lIGludmVz
dGlnYXRpb25zIG9uIHBvc3NpYmxlIHdheXMgdG8gcmVtb3ZlIHRoZQ0KPj4gRG9tMC9vdGhlciBk
b21haW5zIGRpc3RpbmN0aW9uLCBidXQgSSdtIGFmcmFpZCB0aGlzIGlzIHRoZSBtb3N0DQo+PiBy
ZWFzb25hYmxlIHdheSB0byBtYWtlIFBDSSBmdW5jdGlvbmFsIG9uIERvbTAgd2l0aG91dCBleHBs
aWNpdGx5DQo+PiBlbmFibGluZyBQQ0kgcGFzc3Rocm91Z2guDQo+Pg0KPj4gU01NVSBpcyBjb25m
aWd1cmVkIHRvIHRyaWdnZXIgYSBmYXVsdCBvbiBhbGwgdHJhbnNhY3Rpb25zIGJ5IGRlZmF1bHQg
YW5kDQo+PiB3ZSBjYW4ndCBzdGF0aWNhbGx5IG1hcCBQQ0kgZGV2aWNlcyB0byBEb20wLCBzbyB0
aGUgb25seSBvdGhlciB3YXkgaXMgdG8NCj4+IHB1dCBQQ0kgaW4gZnVsbCBwYXNzdGhyb3VnaCBt
b2RlLCB3aGljaCBJIHRoaW5rIGlzIG5vdCBzYWZlIGVub3VnaC4NCj4+IEFuZCB3ZSBhbHNvIGNh
bid0IGRyb3AgdGhpcyBwYXRjaCBhcyBpdCB3YXMgZGlyZWN0bHkgcmVxdWVzdGVkIGJ5IEp1bGll
bg0KPj4gaGVyZSBbMV0uDQo+Pg0KPj4+PiAtLS0gYS94ZW4vZHJpdmVycy9wY2kvcGh5c2Rldi5j
DQo+Pj4+ICsrKyBiL3hlbi9kcml2ZXJzL3BjaS9waHlzZGV2LmMNCj4+Pj4gQEAgLTE5LDcgKzE5
LDcgQEAgcmV0X3QgcGNpX3BoeXNkZXZfb3AoaW50IGNtZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJB
TSh2b2lkKSBhcmcpDQo+Pj4+ICAgICAgICAgICAgc3RydWN0IHBjaV9kZXZfaW5mbyBwZGV2X2lu
Zm87DQo+Pj4+ICAgICAgICAgICAgbm9kZWlkX3Qgbm9kZSA9IE5VTUFfTk9fTk9ERTsNCj4+Pj4g
ICAgDQo+Pj4+IC0gICAgICAgIGlmICggIWlzX3BjaV9wYXNzdGhyb3VnaF9lbmFibGVkKCkgKQ0K
Pj4+PiArICAgICAgICBpZiAoICFpc19wY2lfcGFzc3Rocm91Z2hfZW5hYmxlZCh0cnVlKSApDQo+
Pj4+ICAgICAgICAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsNCj4+Pg0KPj4+IFNlZWluZyB0
aGUgZnVuY3Rpb24ncyBwYXJhbWV0ZXIgbmFtZSwgaG93IGRvIHlvdSBrbm93IGl0J3MgRG9tMCBj
YWxsaW5nDQo+Pj4gaGVyZT8NCj4+DQo+PiBJcyB0aGlzIGEgZnVuY3Rpb25hbCBvciBuYW1pbmcg
Y29uY2Vybj8gSWYgaXQgaXMgYWJvdXQgbmFtaW5nIHRoZW4gY2FuDQo+PiBpdCBhbHNvIGJlIHNv
bHZlZCBieSByZW5hbWluZyB0aGUgcGFyYW1ldGVyPw0KPiANCj4gVGhlIHJlbmFtaW5nIHN1Z2dl
c3RlZCBhYm92ZSB3b3VsZCByZXNvbHZlIHRoaXMsIHllcy4gV2hldGhlciAiZm9yX3BjaV9od2Rv
bSINCj4gb3IgYW55dGhpbmcgYWxpa2UgaXMgYSBnb29kIHBhcmFtZXRlciBuYW1lIGlzIGEgZGlm
ZmVyZW50IHF1ZXN0aW9uLg0KPiANCj4+IFJlZ2FyZGluZyBmdW5jdGlvbmFsIGlzc3VlcywgSSBo
YXZlIGFzc3VtZWQgdGhhdCBvbmx5IGh3ZG9tIGNhbiBtYWtlDQo+PiBwaHlzZGV2IG9wZXJhdGlv
bnMsIGJ1dCBhZnRlciBjaGVja2luZyBpdCwgdGhpcyBhc3N1bXB0aW9uIHNlZW1zIHRvIGJlDQo+
PiBjb3JyZWN0IG9uIHg4NiBidXQgd3Jvbmcgb24gQXJtLg0KPj4gSSBleHBlY3RlZCB0aGVyZSB3
b3VsZCBiZSBhIGNoZWNrIGluIGRvX2FybV9waHlzZGV2X29wKCkgb3Igc29tZXdoZXJlDQo+PiBu
ZWFyIGl0LCBzaW1pbGFyIHRvIGhvdyBpdCBpcyBkb25lIGluIHg4NiwgYnV0IHRoZXJlIGFyZSBu
b25lLiBJJ20gbm90DQo+PiBzdXJlIGlmIGl0IGlzIGludGVudGlvbmFsIG9yIGJ5IG1pc3Rha2Us
IEkgdGhpbmsgaXQgbmVlZHMgc29tZQ0KPj4gY2xhcmlmaWNhdGlvbiBieSBBcm0gZm9sa3MuDQo+
IA0KPiBIbW0sIGxvb2tpbmcgYXQgeDg2J2VzIGRvX3BoeXNkZXZfb3AoKSBJIGZlYXIgSSBjYW4n
dCBzZWUgc3VjaCBhIGNoZWNrIHRoZXJlDQo+IGVpdGhlci4gQW5kIGluZGVlZCB0aGVyZSBhcmUg
Y2VydGFpbiBQSFlTREVWT1BfKiB3aGljaCBEb21VLXMgbWF5IGFsc28gbWFrZQ0KPiB1c2Ugb2Yu
DQo+IA0KPiBKYW4NCg0KSXQgaXMgb25lIGxldmVsIGFib3ZlIGluIGh2bV9waHlzZGV2X29wKCkN
Cg0KICAgICBjYXNlIFBIWVNERVZPUF9zZXR1cF9nc2k6DQogICAgIGNhc2UgUEhZU0RFVk9QX3Bj
aV9tbWNmZ19yZXNlcnZlZDoNCiAgICAgY2FzZSBQSFlTREVWT1BfcGNpX2RldmljZV9hZGQ6DQog
ICAgIGNhc2UgUEhZU0RFVk9QX3BjaV9kZXZpY2VfcmVtb3ZlOg0KICAgICBjYXNlIFBIWVNERVZP
UF9wY2lfZGV2aWNlX3Jlc2V0Og0KICAgICBjYXNlIFBIWVNERVZPUF9kYmdwX29wOg0KICAgICAg
ICAgaWYgKCAhaXNfaGFyZHdhcmVfZG9tYWluKGN1cnJkKSApDQogICAgICAgICAgICAgcmV0dXJu
IC1FTk9TWVM7DQogICAgICAgICBicmVhazsNCg0KLS0gDQpNeWt5dGE=

