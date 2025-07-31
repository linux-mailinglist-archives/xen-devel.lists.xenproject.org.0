Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A601B171EE
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 15:20:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065641.1431019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhTDF-0000WK-Mx; Thu, 31 Jul 2025 13:20:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065641.1431019; Thu, 31 Jul 2025 13:20:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhTDF-0000U9-IX; Thu, 31 Jul 2025 13:20:49 +0000
Received: by outflank-mailman (input) for mailman id 1065641;
 Thu, 31 Jul 2025 13:20:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cZdq=2M=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uhTDE-0006RL-14
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 13:20:48 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b869caf-6e11-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 15:20:47 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by VI1PR03MB6254.eurprd03.prod.outlook.com (2603:10a6:800:13c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.42; Thu, 31 Jul
 2025 13:20:45 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.8989.011; Thu, 31 Jul 2025
 13:20:45 +0000
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
X-Inumbo-ID: 2b869caf-6e11-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Etuz57MSBGjU3B7rjAgAXBRR/MkvR969LSjsU2UszVF7va+4KtUutcz+43BoD+n/3AAwzKo0XXQCBDr5fcbbWevHMEJJEwyMJMaInj5fP34vHY3omI0ZzhQOXVOEuEB12maUGtd79G7e8DzErcL+1EYHAxKT2Mf8acn9V+2vqyYPwySvx1COYhsG/CsemCcRXunYWoKnRWMnJspkSU5ymKOL3TBglhplJhZTrW1XpNeZfYsjEVCKqXQBU87D/kod8KzSoHQp8TFw5ZVPLNf4xKTW5RB2eMD5J+e3AMt+DvVO7d9DtMbW4s2gG+xikswIvlw3jnYt9+EZQrqXbgVS4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IvUeAFMxXkRcpGXdQ+rX6vKIlfirzW5aGyjCu/TSeXw=;
 b=UXrtJotv0jmsE5QLlgD85Jz1Yp9HMIC9qwfS2LHHRGX8+naCdipSUz7tbr2FtH7AyhYvjb6Jh7DMG1PrpjrgBCfbXtZ92FtKW5eZFzYGPCHDaknZGXfeG1vwXY+2Lxf1fHzK39Ntr5NdX2SSEX+qSJrI27ijlPtsdegwLG0zcQyQVqQ7k+y3sT2sw1JT72SIHUmKicHIJxIl2F1+cdGPi9j7sRPrjj3ARwKm05tVUl+fOn40jcaTziD4x8cES9gmGYJPBeEthSzTR/dIMpbUKLVP/1dMr5iy1U6RhCcT281HBChKSzTcaWgKBsPa6x97m6Y98AFKE9iVKQcvx3MYuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvUeAFMxXkRcpGXdQ+rX6vKIlfirzW5aGyjCu/TSeXw=;
 b=XwCIpJdELScW++oUFbzWvA3kUfR7LkXBN4qWdkUr+8wGSzk15nSYTEBP5PCvzpxqLq9dB73D+6VPRjvFbYqMELEHrGjhtxA9PNSg1qdqrlP5RwQMZ5ZPHYqdV93CqZ+14MGT22IFxQwx7+AKEEHfu8U3T+LIBDS+mIrxo6/5/WFbCVc7+SWncsWUdLd+KYMpDVM1l1oO8TiwWtUB1KAJ9RGSoqz2QvGRb4w+EbFSTVg7gdcXxFbWfcY2yWyWSQF7Mu9uAgbVc+qfq1ZXNdt7ogXRrYOe3ayR0GKzlcqZwBxbju5wLTjIzGo+SLrbn0PM9GQvO0YPNaumcvH9GuEa4Q==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 07/10] xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to
 allow eSPI processing
Thread-Topic: [PATCH 07/10] xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to
 allow eSPI processing
Thread-Index: AQHb/KmyAOO+dhnkn0OvTOwdcn9c8rRJKngAgAMYCwA=
Date: Thu, 31 Jul 2025 13:20:44 +0000
Message-ID: <668867d3-4712-4003-847f-e1c2ef7d4998@epam.com>
References: <cover.1753367178.git.leonid_komarianskyi@epam.com>
 <47d77527dfb720723a83daa285aca9e72819dfc4.1753367178.git.leonid_komarianskyi@epam.com>
 <53c63423-f8c5-4137-943a-45098ec4bb8d@xen.org>
In-Reply-To: <53c63423-f8c5-4137-943a-45098ec4bb8d@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|VI1PR03MB6254:EE_
x-ms-office365-filtering-correlation-id: 4021e031-884f-4a6e-1e59-08ddd0350e6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?T1RXSXYrWDVYMVI2ME16SmlEbkk1SmgzbDlLaGs5QWloZmJhcFRROTBiWmRv?=
 =?utf-8?B?UWtZaVRYakRLdk1PcXNOZnhqcHlGY0FwN0gvNThrSW1PVDBhRnM1TWd2TlEx?=
 =?utf-8?B?ekhHYWRQRXc0ekh4NUhvYk83OEw1VUtsVVNxUkRYM2kxZU5kRUZKV1lPVmNt?=
 =?utf-8?B?cytseXNRQ2lIRVZ5Vnc2bnlnS1Y2Tmo4VC9uSWxycGsvcUtSdFh3OWVZK0Ir?=
 =?utf-8?B?KytDWGNNSzRxWVdmY3BUTVVQWXRHbFFaemhOT3JwYTB5K0RRTEhnR3RLU0NT?=
 =?utf-8?B?UlY5UnN0VmZLZmp4azlhajhKa2pYR2dFL1BUYklqekM5cGRWRmFHTVRXTkdp?=
 =?utf-8?B?OTFtT2dralRCWnIvaXBuUUxpSHlCd2JDTlMwSGRibmkvNVVpeDdra2d1RFFW?=
 =?utf-8?B?ZXBhWGNvR01Kdmt4eXFncHFEU0tJUzJ4ZTZnbXVXY2wvVWJzYktYZU9ZcU1s?=
 =?utf-8?B?MnRGUjNlUERCWDI1L3J6Q0xKWklUL0ZzbEFmbFBJQUZueWtCWmd5WlJXWm1s?=
 =?utf-8?B?T2x2NkpoQ2RPVnpyTlZwb21aSC8rUXRPOWlUaXZoMGVWa0ZWNEtvb3VTS2FE?=
 =?utf-8?B?b1RLTnROQnkyd0RqMUlKZjROVTdHdW1WT2VDeDRQWElZa293VHFnRzNNWWxE?=
 =?utf-8?B?ZXpUOHZCeGdhbE1WU3QwUXpKdkQxa2lnOUFwMFBZa1l4K1hCMTdIcjV1azZ6?=
 =?utf-8?B?QVhyZEVQL0Q1L29FalI0cFpNV1hFZHM4OUR4SFg0NlVzU3diVjJaVkVWai9j?=
 =?utf-8?B?LzZWQ25jeWloM1hpdU9BOGE3aUJPVy80Vm1BdWFob09IQWs4eGJpdVhPRzB6?=
 =?utf-8?B?V0FpcmRDVEtROWZnYWRsNlNhMFk0S1Z4NThBWVMwb3RDaG5yZWxpV1VNSE5B?=
 =?utf-8?B?eG81Z2kyUW1jOVZPb2I3REJ0bkpaUyt5RDhuanU2TnFWV0VxQWJEMXA2TUN6?=
 =?utf-8?B?dDRZNzd3SWJVYTMxMW5SOTdMTklCYWtRTVd2MXF3Qmwrc2FuaTBuWFJqUFM4?=
 =?utf-8?B?SjYyckdSVC8vbGtIWkQzbDRvL2YwTDFuOGd6d1htNGdyTUFmc0tML1FtQmtQ?=
 =?utf-8?B?cnBWOE41bnFvcUplQ1N0dXovWHkwM2d4NGZndGkzQnJjTEdQTVhWbm0wc0FH?=
 =?utf-8?B?d2pxaSsvUEJRUFV1aE9DaVJvQlM1WHk2WGRLZUtEeHZXUnZYL0xqaThnNnVq?=
 =?utf-8?B?Z3g3WlRGUHRDOWpCV242L1lNcDAvOWpoRkpaN2lsVnRmTTZBekgrNVZGdDBj?=
 =?utf-8?B?Qit0ZUZQMk5wUTh3LzBUNVFLemFlaVZ3NkxUU2QxN1dHcmFrbm80cjRwZ2x3?=
 =?utf-8?B?QW1TWG1VWk11QzdCUllNemQxVUxQN2YzN2NUMTlrRllrRDEwenVFbHFMWkNy?=
 =?utf-8?B?M21nWG9NVGhicTlkN1E3SnRQUUIyOGVRYjdlWEFmcUVPS1ZvNnBZYlBycGJp?=
 =?utf-8?B?NENHSlJrQ1hVV2lEbWUwQWFIUE1WWVJQaUxVdzZ5RzRJdXZ0TkpTQnZ6SFVx?=
 =?utf-8?B?VGdLMytPaG9UcTUrTEVXakloSHZEeFZMK2hYb3RScXFTYVIwcFgyZDZKZXpS?=
 =?utf-8?B?M2UxTjh1aXZUTmdZWVA3Q0p6STBXZnhWZ1BhdXZXakdXaDVob3pFTXo3ZUVn?=
 =?utf-8?B?cGdjZ052VzVJR0VRZlhkZkxCYlVybkF2WUt1eHpXcE5vQ09aUEN2dkFqeGpq?=
 =?utf-8?B?bndPZTZPWjlWVitxY284M3h4VjZXKzE3Nnp0bTU4b2FOOTdHZVlvOTdNRjl1?=
 =?utf-8?B?cjZPRWVmbHY1SmJBY2pORUhDT2F6alM3d0NJQ0ExdTF0bStnWmR4RGs2VzVZ?=
 =?utf-8?B?NjN6bW5QUHJEY3JUYnlsSjFzeFB2Z240bUJEMzVRNXA2L0xadnZSMlkwcmIr?=
 =?utf-8?B?TTJQTWlTTVh5ZnpEdm9mektqaytFK1d6b2xwUDhYb0orc3d4c2ZpbWJkZ2VQ?=
 =?utf-8?B?VnB5M0hiK2FiLzZDanJ3OHh3RjR1dHpkbkJnYjZwQmVpcU1LTm05azk0cUZp?=
 =?utf-8?B?U0hYVytoNXhRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aXBsN00wUy9aVXp4bDdpVG5ZUDF2cXN5VFg5Zy8rUyt6dmxSUWlqeUh1Y3k5?=
 =?utf-8?B?QWluNnBVZlR1QVZsY01PR3AzQXJhMmFVT3U2TC9QbWVUcDBHOTZsaEJwTlFE?=
 =?utf-8?B?U2tKTmk3OHB4Q0FYMEh3TmJXT3JFcGwxbFh4RGxTcXV0YWFOMzRwd1UzRWt4?=
 =?utf-8?B?VVF5ODZyWGxtSDlkT0lENUVNSDA1ZUw3cDUyVmhWUVROWFdvL3VUQ00yMTJ5?=
 =?utf-8?B?UmwrRGVNM01VMWNMTmxKM1VVVmpjMUdhNUNTbXdLQjY3S2NFKzVBcW5rbkpi?=
 =?utf-8?B?SWtnZTBrZFFwajR4QW5rdVJZcXRHWlY2OGRlaUJGeTYwQyt6b0Z2dWxTaWhE?=
 =?utf-8?B?dE80YUR1UmhDSDN3aE9QSVI3a1o2Q3p4OW1TVURUUGQzSTl4QXpjQTJ3S3Bi?=
 =?utf-8?B?eEJPbnBDWGFDaGNxVUJ4QXZiUGxSWXU4M0F2cE1JcTZ3bFgvRUZVR2ViaU1h?=
 =?utf-8?B?NEdlblRUbWhBRlp0TmcvZ25kSVNraVE5b0V4U3c1VlZiK1p4MTdsdlpmajBq?=
 =?utf-8?B?aU1ZYkZMRUU1QXZRZCtCbGQzR0NKd0ljUDU2WE5oNjlXcjg3OFlveklrN003?=
 =?utf-8?B?L3FMaERIdU9qU0p4UUpUUHJONGNEb3lIcVhKU1pYYmxnU0NkRDlwTFRtb09X?=
 =?utf-8?B?MHVMQkdTbnNVRTduTkM4V1lRVEcrUGI1Q2ZkeVdHcEpYc0lSemU5WFlXZFU1?=
 =?utf-8?B?UnJaTHczR09YWDNidm9TZ0VkcmswbFZWV29SMVVCdTN5a1lJS0Fwd3laNGxJ?=
 =?utf-8?B?ZlpiMUJTdXZNNnlEYnlMUHRqOWZhY0J0NFpEWGNULzRtR2xLOTRsUHV2bjVU?=
 =?utf-8?B?cDFTKzhrSXByS0U0ZmJnME52a20xME9GVVdRSWc2ejJqTEw2TmZkRFpSVWJx?=
 =?utf-8?B?UHdPZVI1SUU0cFdFR2tQck5wWGRtblE5SE5IZUFMcVJXQU9kNVFwNFM2WWpI?=
 =?utf-8?B?WnBsLzFSWjJMMXdmVUllOHVlUDh5eE9KVUhxNGtNKy9sYWVwQk0xR0pQWmxy?=
 =?utf-8?B?dWovR0NpQUlsODBZOTVnSm9sN0JScnVEQ2RyQjdhc21iQlJBcHQvZVIrN0oy?=
 =?utf-8?B?VEFHWDAwY2d3K3poa3E0alVpcFBvTzZyQk4vQ2crT2loUlZIN09ycmRBZit4?=
 =?utf-8?B?T0lVQ1FXZ0F1ODVPRnp5ZFZtbTZBRDkyVEJkUTdwd3JVZ0kvVzRnazJXdFpO?=
 =?utf-8?B?aFlIV2dXYi9IYjdBR1NNdjNtMFZXSXlVTFpRQkJwL0lseXMwRkcyQzNXVWw4?=
 =?utf-8?B?RWVZSzJ6SC9qdnJ6Q0hPREhTanV3WVBhSWw2cjdlbFZqc0NvVjRGc1QvZW5J?=
 =?utf-8?B?K3NMaHNEVlplWnA4Q3dvemdQMzZveWJRNHhmU3lIK3pYbi9yeUlYQXcwdi80?=
 =?utf-8?B?VlJVNnpEK3BjRkVKZnVTYjZrbG1DL1dnUTkyNVI3dWxCQUswcTRqVTZGZ2RF?=
 =?utf-8?B?dHJyYTUrRjhyZCtyWWIzZy9CbzdKZ05UYnd6VUFsSXZNY2ZZNWN2SnNtTElk?=
 =?utf-8?B?SndNWHcxeVdiZ0hOUjlNSWJnMm9QSEVsd3lVeUk4WjhFUGprZ1NsWURHS0dt?=
 =?utf-8?B?OGQwd3VTYjNiUWt0UGI3YTdRWFI5OVdzSm1EcnVjL1dmQW52S0g3WGh6TWg0?=
 =?utf-8?B?MWJZQVEyV05aaFVkdmkwdmh3N2VGeW9tRDVTWUVqMUczQStlQ0FDRGx1bk9t?=
 =?utf-8?B?TzR4ZklIOUQ5Z0F5ZWp3eG5hdk5ZMGN0TmhRM1RWSUFrY2NlV0RzbWVTbUZO?=
 =?utf-8?B?V0NXV1R3VmU4MktoRmZJWDZJKy9aRUg2RVNGcm9odHE3aEFITFU0T2tUQm84?=
 =?utf-8?B?UEx2UTdpQnhKZ2xJK0l4ZHU1dlZtYnlHZk5BQUkzWEJZVVNlcjdaNWxrSkJ5?=
 =?utf-8?B?Y0NkNHU0T29ycXlGVmNLYXVBOGZaUTN6YS9UL2ZkVEs4bWR3b0U0b0dDVTFX?=
 =?utf-8?B?b3NkRVd3VkpEQ3VNbjZacW5sR3lQVkVtVWQ4RXlndWw5QWFPWldNbTYzTGM4?=
 =?utf-8?B?M0hnZk9NUW9hY056QWQxZmhocVlGclV0V0JjVlhOdUFOZ0tpeURQWHI3NWZp?=
 =?utf-8?B?SUFkaGpKa3FwSVplUVhCQUFGbklZTml5RWpwTC9pVkhWbG1RTmZmdDBsVmpW?=
 =?utf-8?B?NzRVT3BnY0xqV1ZGbjFaR282NjZHVURteml1SUhRSWhjdkpXam9pQUxZZGRY?=
 =?utf-8?Q?48EGoJNoh/WW7Bk4w6fOkm8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <73023E0E3C86D4479E528330E5744750@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4021e031-884f-4a6e-1e59-08ddd0350e6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 13:20:45.0073
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: orrXW2eGO13pGP0Va8yCJ3OXX/PsE46YiTPxQ6Bbpwq7b0vXGImDoCnd/NvdxwLcEhaTgYN8+pR78VwyizOQta3SlDvTxCjtBzB8YYpUxGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6254

SGkgSnVsaWVuLA0KDQpPbiAyOS4wNy4yNSAxNzowNSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBI
aSwNCj4gDQo+IE9uIDI0LzA3LzIwMjUgMTU6NTcsIExlb25pZCBLb21hcmlhbnNreWkgd3JvdGU6
DQo+PiBUbyBwcm9wZXJseSBkZWFjdGl2YXRlIGd1ZXN0IGludGVycnVwdHMgYW5kIGFsbG93IHRo
ZW0gdG8gYmUgcmV0cmlnZ2VyZWQNCj4+IGFmdGVyIHRoZSBpbml0aWFsIHRyaWdnZXIsIHRoZSBM
UiBuZWVkcyB0byBiZSB1cGRhdGVkLiBUaGUgY3VycmVudA0KPj4gaW1wbGVtZW50YXRpb24gaWdu
b3JlcyBpbnRlcnJ1cHRzIG91dHNpZGUgdGhlIHJhbmdlIHNwZWNpZmllZCBieSB0aGUgbWFzaw0K
Pj4gMHgzRkYsIHdoaWNoIG9ubHkgY292ZXJzIElSUSBudW1iZXJzIHVwIHRvIDEwMjMuIFRvIGVu
YWJsZSBwcm9jZXNzaW5nIG9mDQo+PiBlU1BJIGludGVycnVwdHMsIHRoaXMgcGF0Y2ggdXBkYXRl
cyB0aGUgbWFzayB0byAweDEzRkYuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogTGVvbmlkIEtvbWFy
aWFuc2t5aSA8bGVvbmlkX2tvbWFyaWFuc2t5aUBlcGFtLmNvbT4NCj4+IC0tLQ0KPj4gwqAgeGVu
L2FyY2gvYXJtL2luY2x1ZGUvYXNtL2dpY192M19kZWZzLmggfCA0ICsrKysNCj4+IMKgIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL2luY2x1ZGUvYXNtL2dpY192M19kZWZzLmggYi94ZW4vYXJjaC9hcm0vIA0KPj4gaW5jbHVk
ZS9hc20vZ2ljX3YzX2RlZnMuaA0KPj4gaW5kZXggN2Y3NjliMzhlMy4uMmMwMmRkZDI4NyAxMDA2
NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9naWNfdjNfZGVmcy5oDQo+PiAr
KysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZ2ljX3YzX2RlZnMuaA0KPj4gQEAgLTIwNiw3
ICsyMDYsMTEgQEANCj4+IMKgICNkZWZpbmUgSUNIX0xSX1ZJUlRVQUxfU0hJRlTCoMKgwqDCoMKg
wqDCoMKgIDANCj4+IMKgICNkZWZpbmUgSUNIX0xSX0NQVUlEX01BU0vCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIDB4Nw0KPj4gwqAgI2RlZmluZSBJQ0hfTFJfQ1BVSURfU0hJRlTCoMKgwqDCoMKgwqDC
oMKgwqDCoCAxMA0KPj4gKyNpZm5kZWYgQ09ORklHX0dJQ1YzX0VTUEkNCj4+IMKgICNkZWZpbmUg
SUNIX0xSX1BIWVNJQ0FMX01BU0vCoMKgwqDCoMKgwqDCoMKgIDB4M2ZmDQo+PiArI2Vsc2UNCj4+
ICsjZGVmaW5lIElDSF9MUl9QSFlTSUNBTF9NQVNLwqDCoMKgwqDCoMKgwqDCoCAweDEzZmYNCj4+
ICsjZW5kaWYNCj4gDQo+IENhbid0IHdlIHVzZSAweDEzZmYgdW5jb25kaXRpb25hbGx5PyBJZiBu
b3QsIHRoZW4gd2h5IGlzIGl0IGZpbmUgdG8gdXNlIA0KPiBpdCBvbiBhIHN5c3RlbSB3aGVyZSBH
SUN2MyBkb2Vzbid0IHN1cHBvcnQ/IChJIGFzc3VtZSBkaXN0cm9zIHdpbGwgd2FudCANCj4gdG8g
aGF2ZSBpdCBlbmFibGVkKS4NCj4+IMKgICNkZWZpbmUgSUNIX0xSX1BIWVNJQ0FMX1NISUZUwqDC
oMKgwqDCoMKgwqAgMzINCj4+IMKgICNkZWZpbmUgSUNIX0xSX1NUQVRFX01BU0vCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIDB4Mw0KPj4gwqAgI2RlZmluZSBJQ0hfTFJfU1RBVEVfU0hJRlTCoMKgwqDC
oMKgwqDCoMKgwqDCoCA2Mg0KPiANCj4gQ2hlZXJzLA0KPiANCllvdSBhcmUgYWJzb2x1dGVseSBy
aWdodCAtIHdlIGNhbiB1c2UgaXQgdW5jb25kaXRpb25hbGx5LiBTbywgSSB3aWxsIA0KcmVtb3Zl
IHRoZSB1bm5lY2Vzc2FyeSAjaWZkZWYgaW4gdjIuDQoNClRoYW5rcyBmb3IgcG9pbnRpbmcgdGhh
dCBvdXQuDQoNCkNoZWVycywNCkxlb25pZA==

