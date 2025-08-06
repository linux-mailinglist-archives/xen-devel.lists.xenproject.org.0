Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C33A1B1C3AB
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 11:45:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071495.1434931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujaiA-0007vO-On; Wed, 06 Aug 2025 09:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071495.1434931; Wed, 06 Aug 2025 09:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujaiA-0007sm-M3; Wed, 06 Aug 2025 09:45:30 +0000
Received: by outflank-mailman (input) for mailman id 1071495;
 Wed, 06 Aug 2025 09:45:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XWom=2S=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1ujai9-0007sg-CH
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 09:45:29 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 151c9288-72aa-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 11:45:27 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by DU2PR03MB10162.eurprd03.prod.outlook.com (2603:10a6:10:49c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Wed, 6 Aug
 2025 09:45:24 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 09:45:24 +0000
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
X-Inumbo-ID: 151c9288-72aa-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qo02BcMCfQb5d3LSnFPVd0AQx2n3hC5XoXFepMVLQ/mP9w+dtzcJOMrPu9YF5Iour5opnXU3WQQNWfreE70hziexN8NKrGjXcDkdZKWmgzgO4QyEXgWJCT4EQlqdQpRtETDwgV4aE/uwQ1SxCeI7QCLU0ossi7k6IvBfMYcQRvYishxhoVc4xHw521ZQKci0of/LXgTUJid4mUcyjET9zHR+5zEjYhJt/MR8yEiOtY1pMjlZFfsWrMpMz9MLk/Zhls/Lw7T9pZdXmjyb91h+aciNbgLQCXKxY9QRHiDbxF2cvnhmKsu+d2d70rEF5R7EKTO1ntyVz8AoAUQ4Ls9xGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cl05CjPoKA4gHRYiErk/NZqtRn3dfJkBiKeuyi2SqoA=;
 b=OPcv58StEvbsIfPUxJNC/d0l0I8U8WYRpt2HrAWgqrN7KBL36IRmWH192MrJRBzguiwZ50uTVhRxHd+9qDtM/UDWoz5AbyYAjNEqxgUbx8zFyaSwsGLQGjrWYWwr0tzWnpgzx1+2lQ2jVreXuL6qAYDggH2mXo2G8Mu2tTK5K7Elld3+VqYmq1oNnpbdHj0VgaQH4cDqFwvVq2UqCa8XUBD+v7k63PPn08NfD04ALNZ9w7RdYPuSCIEA2Iga8yNLmHbguuwKhs7kOBZM4WB7NyIOQBWtx4BHBCobSD1iLDgBY70XlWSqo8VWpetY0tjuMssmfdBJORfjYVPsNUHROg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cl05CjPoKA4gHRYiErk/NZqtRn3dfJkBiKeuyi2SqoA=;
 b=eA0IqLVf00a5ebkPL9sVMO7NwfL4QJTcZZFtQ3OiL8ZX3mu5GQOulJhkDw0/bpd+yqkvRU1zd27Bhqg5REw248T5Ap/YsF8mFYajusMf9GJssPES3ZvAHi+zy8C3XHuBGVlxgSPvEO1V0ma4oviEMnkUyfft54AuRH9iZacge7Cmz+WL0wusmbEysdCUU6VEYkF0/f2LEvouyNcOo/nbNVkFh3XlLcr8Be0mcuuQF046eDEZLiHSHnNqh5JdC8W0wRsPoOAGsCTypDVEVUjdvcLpQEvjNFvQkkdnN6rOMumWZKaY6RpUx1gKjSdjdFHSLeYDub/Qx6o/zu9ZsK+m2Q==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "Orzel, Michal" <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>
Subject: Re: [PATCH v2] xen/arm, xen/common: Add Kconfig option to control
 Dom0 boot
Thread-Topic: [PATCH v2] xen/arm, xen/common: Add Kconfig option to control
 Dom0 boot
Thread-Index: AQHb/+IacHiE2y5puk2LQertSkS3OrRIs0MAgAy6nQA=
Date: Wed, 6 Aug 2025 09:45:24 +0000
Message-ID: <837d01e8-3348-4621-a368-d498233fcddb@epam.com>
References:
 <90e79e175b5f703f33944415df3c7a73d6abc385.1753722403.git.oleksii_moisieiev@epam.com>
 <ccaf6efb-3372-4fb7-8084-51d23b3fcc21@amd.com>
In-Reply-To: <ccaf6efb-3372-4fb7-8084-51d23b3fcc21@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|DU2PR03MB10162:EE_
x-ms-office365-filtering-correlation-id: c5fc4eb0-4ed5-4fed-5b33-08ddd4cdf773
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cU4rU1hscGZJdWxIaDU3cyt2OTVxL3ZDbThMMGhJaTlOK2hWbjkyekE2c08x?=
 =?utf-8?B?VFpxZEhOOGpYbzAvQXRDamI0aHFWeGdZdFpJbnZlZzRlNk1leExnb0VTdmMz?=
 =?utf-8?B?VjhwMnFrdDloMlp5R2hCclFRUHYvSkliRVFBdldDdytpUGFoaGJnbzQxTnJM?=
 =?utf-8?B?RDJMSmt3eHpYSEZHZWJ3MUcySm9QU2tRdEg1SmJ1a2gvK3BFLy9xNkNFN3c5?=
 =?utf-8?B?TmZhdkxmRzVQVGx2ekdMTU1NeVB6c0NWalY4c3p1NW0xaGZ0bk13dk1SZ2lK?=
 =?utf-8?B?VzJOU21yYXNmMXd0elhJMVNFbFNSdGdIMk12NWRJRS9XUDl2VEhpQjlvYTc5?=
 =?utf-8?B?TXNWM3crekVzcVFmK2Z6dE9iQnlEbGZ5ZjU2Y2d2cUZ5YTNPL3NvdTY5eUtY?=
 =?utf-8?B?Vkc5TUxPbmxqTFJzYU8zb053UmVxQngxU0xXbzN5MzloVkp4OG1sdFN1MVhU?=
 =?utf-8?B?TXA0UG0xSHd5U1daQmpzTE4vbWlyNGdqMjlaMHVPN2FoOWpUSTNGa0xSOVVX?=
 =?utf-8?B?NWZ5N1dUVFR5WGRIMG4zZW8vdHNMbW9PZkxCZ0t2NEpBZldteWpsSEcyRTRO?=
 =?utf-8?B?UWFlV1BNdVhodERjV2lnSm8vbmRpTGU1dEtvZkNkQmN5aHpLOXNZbHlxbFFJ?=
 =?utf-8?B?emFpNTZRTFV3MmhPcGhicXhvRUJrSERtQmFRaFlncU5VZFRMSEhVVVlOelRz?=
 =?utf-8?B?NlVWaVprb3BOMGU2bkl4R0lZejZQTkZuQk51TnBMb1JmSjRUNm5CWUtPUit2?=
 =?utf-8?B?LzcwYTNRbFpKSnF2cno4aUpxd2M0bWZCM0VXRDNENlgybVpQMnlLRmFXOUto?=
 =?utf-8?B?K1ZENTJSTFZFZVVGTVY4MjlQWkpkTnNudk5PQVV2bmN1cS93TGFsOFBBdlN3?=
 =?utf-8?B?QXFvdmw1eHhhTEJDdEVWVWYwWlEvRUtwYTRLOHNjMUxZWDdIOVhxYi9JQnlz?=
 =?utf-8?B?bllBK055Sk5EeGNWSkpReDVCd08vdkJ6aTB2enRCQ0RWTEZLZ1pabjNYMlJz?=
 =?utf-8?B?WTBmTktHY0NiS3I0bzZtSEVYTXhib2lWcVViakQvcTkwQ2VWUy9RNWNTZ2Jl?=
 =?utf-8?B?ejg3YlF6SWtJVFY0Mm5HOUFHekFZekNhTHJaSjJSVG04UUhzVGJjd0RST2ds?=
 =?utf-8?B?cGthbWVXUkJ0RW9OQ1pRNVp6MzNiWDZNTXdFZHRMSll5WHZrYVRXMXlsbmpX?=
 =?utf-8?B?eDNJVlE1ZHhJZG13Y0p2WUhnVFVzcTJoTzY4eHY2dFVqVnpGbWhkdi9ONUZ6?=
 =?utf-8?B?VVZnMWlzc3dSM3dkZnkvdWJFaktlVWVDZHdseEVxUmZxTkgwRExLTHhXNmlo?=
 =?utf-8?B?SlVUdDkwallFOG9tQWZkaHJPbW9yNVlLOE5pRFMvdlNsaEpkRHNqK2pHdlBD?=
 =?utf-8?B?QjhWOWF6K3RQZVBTYjZPbUtLRmRhTnY3Z1JieWg4YjdlSjRPdnBPRCt2MnIz?=
 =?utf-8?B?Qkg3bkFyYm85QUJnSE9jRnZtMDF3dDRhRFIxUDZoRlAwaTJMcE1tNkQzK2s0?=
 =?utf-8?B?bEhEZ3VmZ3hCWHRFK3Z0MmE5QmZtd2xRcEoyOENVeWdKRlVYdzN5bEF4SHRt?=
 =?utf-8?B?WEJ4TlpPbjNDS2ZNd0tZc0U2Q3dmL0J5UW1kZWViKzhva0NkYzhBSjVVaUZF?=
 =?utf-8?B?bGdodXQ0MFUzZlhjd0NVVGtXa0VMRUdSQlVuWU5pVkpyZkJ4dGdEdlVWTklX?=
 =?utf-8?B?cTIzSzcxZDZvSWh4aHBUOTIyck5Da01iQjBVZkRHWW9SOE10UXNJbmI1TE5L?=
 =?utf-8?B?WXY3TTF0MVNjOVFTR2FJTUl3SkR1cnIyVEVGdWJHWUpyZDNIQy9RWUdtaGNk?=
 =?utf-8?B?WjhySVVHbWQyTWdjdnBZQ0pPUmFYclFOS3NwMUoySEhlcHQyYWU4N0g2R09Y?=
 =?utf-8?B?UE1iL01RQnI4ZXRlVzFHa29Pb1A0TFZhazVtMFo2eEZNdjRXUTZXckRiWk9O?=
 =?utf-8?B?NzZkQjZyWUR3UVRZNXVoTmd4RVlFaWRvYWt2QkZ1SFNDQmdEVFQwNyttYTVW?=
 =?utf-8?Q?5G+NnLaP+3jyzzEIB8oCknAximtzXw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dlVIc3BNTTBHWG8xSTVPWktoY3VUY1d1Y0pUSFFIYi9HYm1vL3drY3d4cGxl?=
 =?utf-8?B?QUtsN1RjK1Fva0c2Q1NpUWhzNU90S29XYW5IaEVGZTQ2bzgraGlpV2xmdUdO?=
 =?utf-8?B?WDBEVlE3NHMyUlRxTnhkVHhWSGV0bmljd0s4V2pxclRONlFFbU1qT2xpNWg2?=
 =?utf-8?B?eGFYQ0ZyY3lZYUtIWEhjNW96emlYcncvSERUcmpCTXBSZTRoWTU1STd4Rmdu?=
 =?utf-8?B?TU9MNy9jb3NmcnM5YzFodnZKT1hBZ1lzUWtMMStsZmY5a0oxdEM5a3A5K0hZ?=
 =?utf-8?B?aCswKzVpekhxNGJQNHpTV3R2M3dGNUNhRHJQV1paQ1JJeXpuZUpmczBrSWsv?=
 =?utf-8?B?Y2FKZnpvNVZoK1FHMkRwSEk1U1Rqd3JyUWdNL3VFVGVuaUZraW9HZm5HZEdk?=
 =?utf-8?B?TDNiS3UvNmltMUZHOExVc3pXOFI3aEhEdENCZW9mQm9KQVozT3BIcTVWaDQ1?=
 =?utf-8?B?RjZXTlluR0MxQUwzMVRuMUNWTkNURGNCV1YxSFg4V0RneXZQNk4zVW1lcFBp?=
 =?utf-8?B?clJ0T1VpTVdMQ0lNekZtN0l1bm9BcGpjSHk4SUFuaXF5R29EOURhSTFOL0sw?=
 =?utf-8?B?S3FYNXM4eG1yalFuTU1WNm1EMnlmMVBQU0IrRmpkbVZram1wU3lKZU0xcGNt?=
 =?utf-8?B?YzZMYitvdHVyc3ZwQ3NOK1YrYXV5NFpnc01lNXRhSGdLa280ZzZwUytVNUl1?=
 =?utf-8?B?bk5TbkpDaC9hOGtvZlM0M0VHR3NaN3hKaDE2eitKNGZoTm5zcElhYWZJZFBF?=
 =?utf-8?B?N3FNcWZ0SkYrK2pYQmpDZW9PTm96Y3J0VW04MXFxdW56Y0J5VWRoSnFKTWtS?=
 =?utf-8?B?WG55SW5HUHBRTFIzT0UyRm1TSlBrNW9Pc1JoWkhXdXlpS3JqcVI5dXh5UDRr?=
 =?utf-8?B?RlRtckRIZHBmYm9YNkM0bXdDN1VyNU40N2pFWnVJMmtmZnhabHJQV2NJSmE0?=
 =?utf-8?B?WjBKSnZTSDFhcng5ZFFINkM5UzVtWGVyVnJJVXBTNzJvUTVmMGhxSllMRUhm?=
 =?utf-8?B?U01QMkpPZXNjdUVhQVZSMmwyNC9NMWJoLzBLRUwyb3BjWi80R0FianVJMHVX?=
 =?utf-8?B?V1RSR3U3d2lVVFEyRkpWUERwMmJaN3MrZUdiTmpkRVlQY2tIR2tBWmJ3ZnNL?=
 =?utf-8?B?RE4rNzBvU2EwVnhtbHNYWCs3dlp2aEFZVXZFU0NhK2c3M2k4NTdwMzdScG1C?=
 =?utf-8?B?b3J6dEJ5R3p6Nm4rUTFpYjNUNjJjZzRqWVdkZlNmLzlPL0ZBS3pIa3MzaXdu?=
 =?utf-8?B?V1B6KzAxc29wUks1Q1JlLzlDeVdVMGpiK1B0YVJncFI4ZVAxak5SMDhnczQ5?=
 =?utf-8?B?MUpFT0M4ZEVTQ01jTUNLSDhodmFaa3VMUnp5QWZRRWJGb1l4cnNNRU1CV2tD?=
 =?utf-8?B?VGJpMW4xSmIxWmVPc1VYYnBUUDVqbEFFWXU0SFdmanR4MUcxSGhQaGJYRHJD?=
 =?utf-8?B?NjJMTlFlQ3ZwSlZmWkpyaHNSdmwxZCs0cmlIUVF2TGFKdGhYSWd0U2pyVjFu?=
 =?utf-8?B?a0EzWGZkREJvcnJtcHMvL0k4d0hUQy9mRkxtODZRcTFSVzBCSmY1TmNlbXdp?=
 =?utf-8?B?ZTVkclpXZDNWWnBpdm5MdU9wN3MwRlVUK0dMa0s4VWg4SnhDaklxWTRRcWVo?=
 =?utf-8?B?OFMzM2JyL211QzFkQUplR3NKUG54NjAySmJqdVI2SVgrS3VnMHFKVVYrSU9R?=
 =?utf-8?B?MkpuZnR6NHVGcjRGK0U5U2w0MG9hSG5Jc2JxS3FZT1UreThDY09NNEo1Q0VV?=
 =?utf-8?B?SHR0K3ZyTXgrbDFOSjZRd254K1JTWW8xckd2OWhTRVVvVWhMQy8wTzIveUFv?=
 =?utf-8?B?UHBJOXg2ZzR1WE1mRTlGaStXL2xpa0I2amR3ZStSa0NWNmJPb0ZaZEt4alRD?=
 =?utf-8?B?ZVA2ZDRpQ0IwNmVVbzJ0WWtDWjZYdSt4cnpvcEtEby9XVkMwTGVRbHVVeUxN?=
 =?utf-8?B?cytZU1BXaWJWcGFRS2tJbStRVDlZT1lIbFFhb21jR05PY01yQmFjdnF2Yndp?=
 =?utf-8?B?TGlJcDlQMk91TkltOU1GMkxWaHpxWGhEQnBvNnErVmIrYTZXRllzOGRBb0x1?=
 =?utf-8?B?R1J2RE9NYjE5NjcrT3BraHlRNWtyUndacGJmWDd2T0c3L09TUHRCRzdEVmc1?=
 =?utf-8?B?SXVmTkFXTTRRaUlycGZrUjRGdnQ0TE01aGl1ZXR2c3g3M2VsZVNvOHFBSms4?=
 =?utf-8?B?WEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E5F9E2A32688F488553B714C7B1EC70@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5fc4eb0-4ed5-4fed-5b33-08ddd4cdf773
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 09:45:24.1356
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VMVoWHKI1yhZd6jeaP+Fo8fZuvnYwNKiLSmvMFeNMIi9uPNzhJONija5DfLPlEgeuFhGaCOOWYATxCHeZkgxGgSAmQ4dwKQATkATV9B+sSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB10162

DQoNCk9uIDI5LzA3LzIwMjUgMTA6MjIsIE9yemVsLCBNaWNoYWwgd3JvdGU6DQo+DQo+IE9uIDI4
LzA3LzIwMjUgMTk6MDcsIE9sZWtzaWkgTW9pc2llaWV2IHdyb3RlOg0KPj4gVGhpcyBjb21taXQg
aW50cm9kdWNlcyBhIG5ldyBLY29uZmlnIG9wdGlvbiwgYENPTkZJR19ET00wX0JPT1RgLCB0bw0K
Pj4gYWxsb3cgZm9yIGJ1aWxkaW5nIFhlbiB3aXRob3V0IHN1cHBvcnQgZm9yIGJvb3RpbmcgYSBy
ZWd1bGFyIGRvbWFpbiAoRG9tMCkuDQo+PiBUaGlzIGZ1bmN0aW9uYWxpdHkgaXMgcHJpbWFyaWx5
IGludGVuZGVkIGZvciB0aGUgQVJNIGFyY2hpdGVjdHVyZS4NCj4+DQpbc25pcF0NCj4+DQo+PiBJ
biBhIGJ1aWxkIGNvbmZpZ3VyZWQgZm9yIGEgZG9tMGxlc3MgZW52aXJvbm1lbnQsIHRoZSBjb2Rl
IHJlc3BvbnNpYmxlDQo+PiBmb3IgY3JlYXRpbmcgRG9tMCB3b3VsZCBiZSBjb25zaWRlcmVkICJk
ZWFkIGNvZGUiIGFzIGl0IHdvdWxkIG5ldmVyIGJlDQo+PiBleGVjdXRlZC4gQnkgdXNpbmcgdGhl
IHByZXByb2Nlc3NvciB0byByZW1vdmUgaXQgYmVmb3JlIGNvbXBpbGF0aW9uLA0KPj4gd2UgZW5z
dXJlIHRoYXQgdGhlIGZpbmFsIGV4ZWN1dGFibGUgaXMgZnJlZSBmcm9tIHRoaXMgdW5yZWFjaGFi
bGUNCj4+IGNvZGUuIFRoaXMgc2ltcGxpZmllcyBzdGF0aWMgYW5hbHlzaXMsIHJlZHVjZXMgdGhl
IGF0dGFjayBzdXJmYWNlLA0KPj4gYW5kIG1ha2VzIHRoZSBjb2RlYmFzZSBlYXNpZXIgdG8gdmVy
aWZ5LCB3aGljaCBpcyBjcml0aWNhbCBmb3INCj4+IHN5c3RlbXMgcmVxdWlyaW5nIGhpZ2ggbGV2
ZWxzIG9mIHNhZmV0eSBhbmQgc2VjdXJpdHkuDQo+Pg0KPj4gLS0tDQo+PiAgIHhlbi9hcmNoL2Fy
bS9LY29uZmlnICAgICAgICB8ICAxICsNCj4+ICAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5j
IHwgIDggKysrKysrKysNCj4+ICAgeGVuL2FyY2gvYXJtL3NldHVwLmMgICAgICAgIHwgMTQgKysr
KysrKysrKy0tLS0NCj4+ICAgeGVuL2FyY2gveDg2L0tjb25maWcgICAgICAgIHwgIDEgKw0KPj4g
ICB4ZW4vY29tbW9uL0tjb25maWcgICAgICAgICAgfCAxMSArKysrKysrKysrKw0KPj4gICA1IGZp
bGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9LY29uZmlnIGIveGVuL2FyY2gvYXJtL0tjb25maWcNCj4+
IGluZGV4IGJmNmQxY2Y4OGUuLjc0ZGE1NDQ5MjUgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9h
cm0vS2NvbmZpZw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL0tjb25maWcNCj4+IEBAIC0xOCw2ICsx
OCw3IEBAIGNvbmZpZyBBUk0NCj4+ICAgCXNlbGVjdCBHRU5FUklDX1VBUlRfSU5JVA0KPj4gICAJ
c2VsZWN0IEhBU19BTFRFUk5BVElWRSBpZiBIQVNfVk1BUA0KPj4gICAJc2VsZWN0IEhBU19ERVZJ
Q0VfVFJFRQ0KPj4gKwlzZWxlY3QgSEFTX0RPTTANCj4+ICAgCXNlbGVjdCBIQVNfRE9NMExFU1MN
Cj4+ICAgCXNlbGVjdCBIQVNfR1JBTlRfQ0FDSEVfRkxVU0ggaWYgR1JBTlRfVEFCTEUNCj4+ICAg
CXNlbGVjdCBIQVNfU1RBQ0tfUFJPVEVDVE9SDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+PiBpbmRleCBl
ZDY2OGJkNjFjLi45Yjg5OTNkZjgwIDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFp
bl9idWlsZC5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4+IEBAIC00
MCw4ICs0MCwxMCBAQA0KPj4gICAjaW5jbHVkZSA8YXNtL2dyYW50X3RhYmxlLmg+DQo+PiAgICNp
bmNsdWRlIDx4ZW4vc2VyaWFsLmg+DQo+PiAgIA0KPj4gKyNpZmRlZiBDT05GSUdfRE9NMF9CT09U
DQo+PiAgIHN0YXRpYyB1bnNpZ25lZCBpbnQgX19pbml0ZGF0YSBvcHRfZG9tMF9tYXhfdmNwdXM7
DQo+PiAgIGludGVnZXJfcGFyYW0oImRvbTBfbWF4X3ZjcHVzIiwgb3B0X2RvbTBfbWF4X3ZjcHVz
KTsNCj4+ICsjZW5kaWYNCj4+ICAgDQo+PiAgIC8qDQo+PiAgICAqIElmIHRydWUsIHRoZSBleHRl
bmRlZCByZWdpb25zIHN1cHBvcnQgaXMgZW5hYmxlZCBmb3IgZG9tMCBhbmQNCj4+IEBAIC0xMDIs
NiArMTA0LDcgQEAgaW50IF9faW5pdCBwYXJzZV9hcmNoX2RvbTBfcGFyYW0oY29uc3QgY2hhciAq
cywgY29uc3QgY2hhciAqZSkNCj4gV2h5IGlzIHRoaXMgYW5kIG90aGVyIGRvbTAgY21kbGluZSBw
YXJzaW5nIGZ1bmN0aW9ucyBub3QgZGlzYWJsZWQ/DQo+IFdoYXQgaXMgeW91ciBtZXRob2Qgb2Yg
ZGVjaWRpbmcgd2hhdCB0byBjb21waWxlIG91dCBvciBub3Q/DQpJIGp1c3Qgd2FudGVkIHRvIGFk
ZCB0aGF0IEkgaGF2ZSBvbmx5IGd1YXJkZWQgZG9tMF9tYXhfdmNwdXMgYmVjYXVzZSBpdCANCmlz
IHVzZWQgYnkgdGhlIGNyZWF0ZV9kb20wKCkgZnVuY3Rpb24uIFRoZSBvdGhlciBwYXJhbWV0ZXJz
IGFyZSB1c2VkIGluIA0KZnVuY3Rpb25zIHRoYXQgYXJlIGFsc28gcmV1c2VkIGJ5IGRvbTBsZXNz
IGJ1aWxkcy4NCj4+ICAgICovDQo+PiAgICNkZWZpbmUgRE9NMF9GRFRfRVhUUkFfU0laRSAoMTI4
ICsgc2l6ZW9mKHN0cnVjdCBmZHRfcmVzZXJ2ZV9lbnRyeSkpDQo+PiAgIA0KPj4gKyNpZmRlZiBD
T05GSUdfRE9NMF9CT09UDQo+PiAgIHVuc2lnbmVkIGludCBfX2luaXQgZG9tMF9tYXhfdmNwdXMo
dm9pZCkNCj4+ICAgDQpbc25pcF0=

