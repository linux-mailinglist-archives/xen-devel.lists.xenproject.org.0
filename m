Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8603DB8164C
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 20:53:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125510.1467435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyxG3-0002Mm-C1; Wed, 17 Sep 2025 18:51:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125510.1467435; Wed, 17 Sep 2025 18:51:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyxG3-0002Ka-9N; Wed, 17 Sep 2025 18:51:59 +0000
Received: by outflank-mailman (input) for mailman id 1125510;
 Wed, 17 Sep 2025 18:51:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0jLE=34=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uyxG1-0002KU-Dp
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 18:51:57 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 618aa995-93f7-11f0-9809-7dc792cee155;
 Wed, 17 Sep 2025 20:51:55 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by GV2PR03MB8727.eurprd03.prod.outlook.com (2603:10a6:150:7b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 18:51:49 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%5]) with mapi id 15.20.9115.020; Wed, 17 Sep 2025
 18:51:49 +0000
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
X-Inumbo-ID: 618aa995-93f7-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mOIKz349jGS/wKELwU0khXNNPLXemWlGUulkeGKkZBdR5nFCBSHDhvumWOERln2svwRurSh8B6iMGQqzQIjoSBmVIB1RTvy4bA+YABWMj+LRckUa/ZGh0PxmNWNlYSWgMgX6J74ptrazWeCm9DLrJDg/Y6fzdOj7Wuxa2pCbuh4KlIJwRpYEwygU8N5Ux6yaoD52oVyr3PuOtJyE3ZPECnvVrIYudfQAEP7GeiXkjzadpD1fUhgV95DwxTMeA5+LPC1qwVdixNiC4H/gkdKTyDjxFRUoGdhBk80t4NLuTeWjV2WYF2R6WTgcW90TsQQrYjxgPdZwxgvQYIN86tHKSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5B1mwtcXkpRXJJU4/uGxyVCJHB2Wt/7atY34Xqz/edc=;
 b=BfXt6N3s9EWZpN/Z+SQn8+J1/r9fidRTJlv1C+mu74J01NWm9dOuGdCdCGf1d+YwsTpwc1eZ1pbGACGV87kAC7/G8b/yeCQJyqtdCWZWETpsCGskfTxmJtAv7AnKSujLRkzp8XCk8EV2Q3RypvWu4M7m6KlHnLp/X2mlTMiVPpy4gMkUWSQgwUh1X3glMT/ixzP/TNMUFbjv1gtkKxTpNs0g+4OVtosgIXRkmpBxu1OidjNST6MwthTwRB77jP6ylF+NCph10SCRHGAJGCQVgDduE3f6sxJH73kQizV6+6SqHNZ/TNhYuXz8oVGtyfg9Wsn9yhmBnGdCxHafOsLLbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5B1mwtcXkpRXJJU4/uGxyVCJHB2Wt/7atY34Xqz/edc=;
 b=uDHKwIloeK4FuZ4nCE9uPXvQaBJZVU4NG/ADM6xHvxwdbMvvsK3kv6Bp9hVglSagyHdJ1ABhPah/UcELIQebtkGKofZisIm14/lrfsOJv6k3I4+TqOoVMZSaC+edObbAf2ljev4i7lHUfK3LNt4iRMAeKwa7xi+nm6uQSp9IF82dv4C3jMcdDEZ47PhoyZVmsP5Lk+D8YSZiAWA6hvTEJsQcMf1QPhr8dcFWqiVOq7OVLkx8yR6Y68cMqn5T6/m+VLB/uKWMUAV9dSQppVzaWLxmNR7t+FThXy4l+bE8oivEvP1W1RHP0K8y6KCzTT87WMNcs6ZFRnP6nNcgo1taPQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] misra: add deviation of Rule 2.1 for BUG() macro
Thread-Topic: [PATCH v2] misra: add deviation of Rule 2.1 for BUG() macro
Thread-Index:
 AQHcJwfEWjVU7vF+102YDgRq9OEY77SV3fSAgABWKoCAAAe4AIABLJwAgAAEy4CAAEzxAA==
Date: Wed, 17 Sep 2025 18:51:49 +0000
Message-ID: <22bff8a6-b6d8-4002-a6fd-2f5f284e92a7@epam.com>
References:
 <0adc0a8f75cb88b0b26d38289d1dd5823386290d.1758024454.git.dmytro_prokopchuk1@epam.com>
 <b20b152d-cc51-491a-ac2b-148ece34efd4@suse.com>
 <adb1c46b-aa6f-4412-863c-96e95c10b85b@epam.com>
 <e6199dc4-be32-4d02-86a3-1548b8aacc73@suse.com>
 <d812a470-0ced-4585-827a-16d1ab7ec6b1@epam.com>
 <8b9d332f-e4f9-4023-b668-8a8957a45e7c@suse.com>
In-Reply-To: <8b9d332f-e4f9-4023-b668-8a8957a45e7c@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|GV2PR03MB8727:EE_
x-ms-office365-filtering-correlation-id: 4353e03c-af82-4755-b6ef-08ddf61b424d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|42112799006|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?OXZITE5manJHYkJSdnJWZFJsS3R3VGtHSTZVRFp6R0VPTjBRMDF4UVVyL0lU?=
 =?utf-8?B?ZEVNRExkc2R1TWtoc2hvQnlseHdYeGYvTUNnck5seld2QUxmaXFwNHNxUmlL?=
 =?utf-8?B?bGNPR3VPMDBlOTRqSWNPZHNQdzdjenFZbWhNc0RGa2NTYkFZRktWRzlyL1BN?=
 =?utf-8?B?eER6dGkwa1d5cnZ6aVdPSCtLbThDK1lGT0QvaG9zcWViYXR5ZytET0d1Z0RD?=
 =?utf-8?B?aEFuTTVNc0ROckUyWUlIYWZ6Z2s4ZmNGUkNSN3c2emdISVJhcjJpcGUzVGFB?=
 =?utf-8?B?N3VXOXVUbDd0aFBXOEF1NG5uREgxRlpjTC9pUnZWb053VTYxd05DZU11b1Nh?=
 =?utf-8?B?bzlhbnpXcThCUnpKamVjRnN0N1NXOFV5dGF6MUVwaCtjdzQ1eHJISmprM05o?=
 =?utf-8?B?USszOFdadjhrbE9wS3l2S3Z5YUVYcTRqL0dXbGpGZTBPeGpML1RFT1RyRTdX?=
 =?utf-8?B?Z1A3dFhtQzRFc0lEakdXSFZ0YlRJOUFrMFUxWnBZdFE3c2pORDZpVXZXUzkz?=
 =?utf-8?B?VXMrWTA0NjRKRTI5cU81VVRGaXlibXdvNVlOMHZReFJ3UEx4eXVmZVF2d00z?=
 =?utf-8?B?TmluNkhyUjdwQWFOV1ltWWhGaW8rdVBkVFBMNStNU0pqYk5wYk85WEJaaWlQ?=
 =?utf-8?B?Myt5ZEJPakNIYjNBN0RsdzR1YUVUTFVTMkt6SE9Gc2JFbkxKQk9Kemtwbks5?=
 =?utf-8?B?anpoUzcvdGpuUWtGOGNLYzk3Q094UmQ0bzFPOCttL2N5a09odkdyekJrV0hQ?=
 =?utf-8?B?d0k2WGJKRHpzVFFQRnk4OTBKRkdRNlpnWVkyVXp5VGFzVjFORHh1S3RtaFRj?=
 =?utf-8?B?L3UxeEwvNXhRcURlNjB2cndIMUlHY1o3OGVoaGVDQ1ljWlJ2cElSWkZpcDg3?=
 =?utf-8?B?ckMxeWNtNU5kMkR6dFZrVUVUaTJKSmRqRkw1bGVrWkcwWTNvdS94akVoNjBy?=
 =?utf-8?B?aEVxQ20rMUgwZ0l6UGtjOXhWZVlnZEpwUUNaSlBTeHBMZlM4Tm4rZnIybGg1?=
 =?utf-8?B?MVBiNmxENisrSTRWVTNaVWliRHVtSEV2c1dIdlhtMFFvYi8rcEVjaFd3dWtu?=
 =?utf-8?B?WkpGZUI0QnEwUTM0N29qT2lWajhFeWduQUdDTGszQ3hXRVkrYmU0ZU9PUkE4?=
 =?utf-8?B?U0RCRE1La2c2NXk3MWpvM3dCSm9CQnhudm15ZDBHQXV6YmNzL3VPc1VSSU1j?=
 =?utf-8?B?ZEEyN0EwN0t2VlhjbVZ6aHRXaHFzL0wzWXdWUk9yUE9DaWhTaWdPNmhMZ3E2?=
 =?utf-8?B?SFJIOEVldU1BTWpIeEdwSGt5ODRBYzdSTXBBclZqVFppdkJiMGlnWjNDM2o0?=
 =?utf-8?B?UXpHV2JmNDd5TDcwa3hVK3FJM0UraWpCRmJyZmt0N3llaEg2NW1ySjYwQXdS?=
 =?utf-8?B?emVqaCtVeVV3R1k3eE5adWFjdWtXcVkzWHE2MFE4N2dENlJVWEJBVlJvYnlr?=
 =?utf-8?B?c0xxM2cwQklRRkViUExULzU0OFFLV1UxODBzZHV3dWQ4ZkNMSmdCUnE0SEJM?=
 =?utf-8?B?NFRXS1NWUmtIMmRCQlg1bE84UlFJRTVKcHBuY29aVVc3dmlaRjQ0MTVnTVov?=
 =?utf-8?B?M3QzRThwRmRPYkplNzVvV1VOWUpzWEFZUWo3ZUlQZmVnNXlCUDUyblF1MFQz?=
 =?utf-8?B?YTdUWkZucHRwU25ZVS9TRkpSUGZrSlJIb2tDSVV1VHFWQ01IbkZrMURqNjZp?=
 =?utf-8?B?NlJDUUZwc2xoVlVBS1crTk5oVHpJY2c4K0NsT1pybHhmUk1ZemR3STBUbENZ?=
 =?utf-8?B?MVBLWlE5M2hkTElnWFA3SkZQMmVNbms4T0xnN0h1Qk1PVklDS3lJeWlMQm9w?=
 =?utf-8?B?bnlhMjcwczAvRk9FMGlyMDM1TVU4WWJacnZUMHZpaGY5WDliTzh1U1RHWGRB?=
 =?utf-8?B?UGQxTXVadW9jL29OdldJcEFIbHNFRSs3cEdUcFBud2dLTncyVU51RGZ2M09W?=
 =?utf-8?B?cjVXUjRJcGN3T0ZQWjdja0dsYTBYZUtYV3BOTWo2MzByVFNyRFBoV2wwdVFk?=
 =?utf-8?Q?NIPDX0+UoJiGCV06E2etUM4clrAZic=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(42112799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YzVIL00wM2NBa1Ivbzc3dzNIcm5BNXVIRXlFZ2NwK1JCaGZodk1wcUNmUlhY?=
 =?utf-8?B?a1pGZUNjMWZyWlE3b0J1YkNSeDRZQUhHcDBOZXYyaXBWWlJFeDYxcEE0Z2hD?=
 =?utf-8?B?UXJEU3FmcDMwbTBsTm9MWHgzdUF1dFF1RWVwbExYeGpvcnBseG1LcHI3amt2?=
 =?utf-8?B?NHpqL1VUSlMvMmI5cVBRcDRWcmFvUDVJQWJZai9xMEJrMGdDTWRHV1hCdFVC?=
 =?utf-8?B?ZVFBRWQ5UzkyR09jL2NiZlcyak5mc28yY01UQUxOQzdzQ082S0tBWG5hTk5Z?=
 =?utf-8?B?eUFBRnBNakhQcDRhbTBYTDI3dUJQWFpsWlVmdjZNZk1aMU1PaGRYVnZmcGt3?=
 =?utf-8?B?N29UTm9sTlBiRUNzbEtLSUZKcEcvenlabCtDSjlTcGlHMHBTNzdKb1p6bnVW?=
 =?utf-8?B?Tmh3MzJONUFuWHFLOWtlNzhXYlpaVE15SjVFYTByRWRwL3hDMndSWTkyTXRX?=
 =?utf-8?B?Y3d2TXoxbjYxaExtczcvdWY2NTcvL1lnakNvSHJTR2RaUWdhQzJoSk0zTHlS?=
 =?utf-8?B?Nk5qRUUxTEhhSTNNOW4xUTN2YlVQc0lJb21LbEprMDZNekNpRjRqVUoyZmRJ?=
 =?utf-8?B?VnpXQ3BtYWlhYlg0WmsyQ29EVGVQVmE3R3UrcHFpU3M3ZFBxM21NdVMxdkFh?=
 =?utf-8?B?WVZtSUx1bVc0WGFibmd4OE1YakNCUm1GZDBnR3c1QlY4OFB1bW5RSnE1Vzht?=
 =?utf-8?B?UDJLYVNkdmRoQ25rTitVUTBvMk9OZC93dGppQkJUU2RkeWJKQTc4ekVNQnhH?=
 =?utf-8?B?dWJFOVBFTkE5c044RVNkYVBzeUkxcVQzWHo3LzREeTkwNlR5RXl3VmdMakFE?=
 =?utf-8?B?Y1VySCsxSUZ1RTBsb0xwOG1teXc2VVpiZXhwdFpiSVozRjBLbEFDR0ZQcllq?=
 =?utf-8?B?d3d5K0ZOaXIxSElETG12bmlEUndaVzltRE5mMVdVZkpkSW9JRThGMjg0M0E3?=
 =?utf-8?B?OGJzQ1VKMUNXejRQekVsaEJOa01MaTZwYm1kR1BqNHZRc2RSdUUwZWU1N2N2?=
 =?utf-8?B?ZXhjZHQwVHR4S1M0eXcvY001VG53eG04UTJ4bDQ1UWFuSFladXlQTklncFAr?=
 =?utf-8?B?WGJwcTFsbldiTXJMT2pISmNvZnJTUXh0ZFZkVWJrUW53WFhsbWZacG1GYXox?=
 =?utf-8?B?Y1BCc29WRVZiMUFyVFlnWG9nNi9FakNtNHJiUXpLSHFHOUxLdkFwQmhrbGgw?=
 =?utf-8?B?dzVIRDRMSG92elNqcm9nTzdDSDQyc3FIUExpbUUwYTZSUWJGelAxa3hJWGxG?=
 =?utf-8?B?Z1pSRWs3MVoxd2s4MnF6cDZsNWRlcUovbTFRa1orQnBvdlBYY1E4N055VW4v?=
 =?utf-8?B?LzJZR2swQTFYYXB6dk82VUE4THlzaFhBSEZlNGFValpaWS9pMjRGQTNqVk5t?=
 =?utf-8?B?RTZETjFMZWxMUWxHZEpkTStiQmF4citxeExteHhGWFpGZ3planlaWnhhcFlk?=
 =?utf-8?B?amVla0tqT21Hcm41WjNDN3FlWkxFditta01VUWF0cE1mNTN6WTZPZnp3UHJR?=
 =?utf-8?B?aFZPYVZtVXRyQUdGV2x5eklZK3lNZ0VscWFDZlVrWktwSWlrcjI5UTRCMXlY?=
 =?utf-8?B?MGl1VlQ0ZXhsei9INzc5MG1LeWlsRWpTRjV4NERrMzZtdHBDWmxKZUVrenRt?=
 =?utf-8?B?RW1pTmJrNVBmdldjdWUxUDBVYnlyZy81NlBDNUh5ZjRBLzFrYVpLOXEzYzRD?=
 =?utf-8?B?YXVEUFl6UEtLN2lxWjR0dHMvaXpobGhiWDM5MDVBZzA0bVJUeHJkd1ZOYU5k?=
 =?utf-8?B?MEF3c3FWOEpmS1FuTHE2cmF2U2F6SWpWZDVWaDlVcDFtZmVreERkbXZvdmxF?=
 =?utf-8?B?ejdNNDQ1MjJnenJGOTJGdFJWOTZhcis1MHZxSVpseUpMdzBVYjk3TTNuTVhJ?=
 =?utf-8?B?SU1tT3NwdnFDbit5ektKekhydWtwdW9nU0NoQlpjdEVQZjVvUDliY09Bc0Iz?=
 =?utf-8?B?cjRuc3hYVERvRjhodm82cUxCV0NxdUZLRkM5Y2NSWU9Yd2ZMMWlLUlVQeGpY?=
 =?utf-8?B?bm5IbUtNa2Y0UzFLT1NZWGdTZUR5d1pjOENUOTVoT1lzd0owKzNwMjduaE9w?=
 =?utf-8?B?OEZHR29ITy8xRnNlb2tOUllxaTRlb2ZyZWhRbDJZVi9PYnZtbGliU2xqZWZB?=
 =?utf-8?B?dVJTVHNoMGcySVdKMjdTdmJLeGdobXBrc3pRV0FoV1l1Y3dVb21MdlZMcjBa?=
 =?utf-8?B?cnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B21143E67A8FE14EBC2EAF2E71A81DEE@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4353e03c-af82-4755-b6ef-08ddf61b424d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2025 18:51:49.3392
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mequ41i1p0WGE8alFWogNCplwnZEHLce+CcTL+0vFD2wm9NuRgqJdpES/zw1kBTiHJC1gywggPp54hxXwD7vEvzW6CN3nx76uHk2LwXuA+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB8727

DQoNCk9uIDkvMTcvMjUgMTc6MTYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNy4wOS4yMDI1
IDE1OjU5LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+Pg0KPj4NCj4+IE9uIDkvMTYvMjUg
MjM6MDMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDE2LjA5LjIwMjUgMjE6MzUsIERteXRy
byBQcm9rb3BjaHVrMSB3cm90ZToNCj4+Pj4NCj4+Pj4NCj4+Pj4gT24gOS8xNi8yNSAxNzoyNywg
SmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAxNi4wOS4yMDI1IDE0OjQ1LCBEbXl0cm8gUHJv
a29wY2h1azEgd3JvdGU6DQo+Pj4+Pj4gLS0tIGEvZG9jcy9taXNyYS9kZXZpYXRpb25zLnJzdA0K
Pj4+Pj4+ICsrKyBiL2RvY3MvbWlzcmEvZGV2aWF0aW9ucy5yc3QNCj4+Pj4+PiBAQCAtOTgsNiAr
OTgsMjMgQEAgRGV2aWF0aW9ucyByZWxhdGVkIHRvIE1JU1JBIEM6MjAxMiBSdWxlczoNCj4+Pj4+
PiAgICAgICAgICAgIGV2ZW4gd2hlbiBkZWJ1Zy1vbmx5IGFzc2VydGlvbnMgbGlrZSBgQVNTRVJU
X1VOUkVBQ0hBQkxFKClgIGFyZSByZW1vdmVkLg0KPj4+Pj4+ICAgICAgICAgIC0gRUNMQUlSIGhh
cyBiZWVuIGNvbmZpZ3VyZWQgdG8gaWdub3JlIHRob3NlIHN0YXRlbWVudHMuDQo+Pj4+Pj4NCj4+
Pj4+PiArICAgKiAtIFIyLjENCj4+Pj4+PiArICAgICAtIEluIHRoZSBzcGVjaWZpYyBidWlsZCBj
b25maWd1cmF0aW9uICh3aGVuIHRoZSBjb25maWcgQ09ORklHX0FDUEkgaXMgbm90DQo+Pj4+Pj4g
KyAgICAgICBkZWZpbmVkKSB0aGUgJ0JVRygpJyBtYWNybyBpcyBpbnRlbnRpb25hbGx5IHVzZWQg
aW4gdGhlICdwcmVwYXJlX2FjcGkoKScNCj4+Pj4+PiArICAgICAgIGZ1bmN0aW9uIGluIHRoZSBo
ZWFkZXIgZmlsZSAneGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2RvbWFpbl9idWlsZC5oJw0KPj4+
Pj4+ICsgICAgICAgZGVmaW5lZCBhcyAnc3RhdGljIGlubGluZScgdG8gdHJpZ2dlciBhIHJ1bnRp
bWUgZXJyb3IgaWYgQUNQSS1yZWxhdGVkDQo+Pj4+Pj4gKyAgICAgICBmZWF0dXJlcyBhcmUgdXNl
ZCBpbmNvcnJlY3RseS4NCj4+Pj4+PiArICAgICAtIFRhZ2dlZCBhcyBgZGVsaWJlcmF0ZWAgZm9y
IEVDTEFJUi4NCj4+Pj4+DQo+Pj4+PiBJIHJlc3BvbnNlIHRvIG1lIG91dGxpbmluZyBhIGRldmlh
dGlvbi1sZXNzIGFsdGVybmF0aXZlIHlvdSB0cmllZCBpdCBvdXQNCj4+Pj4+IGFuZCBzYWlkIGl0
IHdvcmtzLiBUaGVuIHdoeSBpcyB0aGUgZGV2aWF0aW9uIHN0aWxsIGJlaW5nIHB1dCBpbiBwbGFj
ZT8NCj4+Pj4NCj4+Pj4gWWVzLCB0aGF0J3MgdHJ1ZS4NCj4+Pj4gSSBzdGFydGVkIHdpdGggdGhh
dCBwcmVwYXJlX2FjcGkoKSBmdW5jdGlvbiBhbmQgSSB0cmllZCB0byBtb3ZlIGl0IGludG8NCj4+
Pj4geGVuL2luY2x1ZGUveGVuL2FjcGkuaCBoZWFkZXIgZmlsZSB1bmRlciBhcHByb3ByaWF0ZSAj
aWZkZWY6DQo+Pj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvZGltYXBy
a3A0ay94ZW4vLS9jb21taXQvZDE1Y2Y5MWRlOTJmMWY4ZWM2NzkxMWM1MWExM2U3ZjA5NWMxYmNk
ZA0KPj4+DQo+Pj4gQnV0IGFuIGltcG9ydGFudCBwYXJ0IG9mIG15IHByb3Bvc2FsIHdhcyB0byBo
YXZlIG5vICNpZmRlZiBhcm91bmQNCj4+PiB0aGUgZGVjbGFyYXRpb24sIGlpcmMuIFdpdGggdGhh
dCwgbm8gdmlvbGF0aW9uIHNob3VsZCByZXN1bHQuDQo+PiBJIGRvbid0IHVuZGVyc3RhbmQsIGhv
dyBpdCBjYW4gaGVscCB0byBhdm9pZCBzY2FubmluZyBieSB0aGUgRWNsYWlyPw0KPg0KPiBJIGRp
ZG4ndCBzYXkgaXQgd291bGQuIFNjYW5uaW5nIHdpbGwgYWx3YXlzIGhhcHBlbi4gVGhlIHF1ZXN0
aW9uIGlzDQo+IHdoZXRoZXIgRWNsYWlyIHdvdWxkIGZsYWcgYW55dGhpbmcuDQo+DQo+PiBJbiBw
YXJ0aWN1bGFyIGJ1aWxkIGNvbmZpZ3VyYXRpb24gdGhlICJzdGF0aWMgaW5saW5lIiB2ZXJzaW9u
IG9mIHRoZQ0KPj4gZnVuY3Rpb24gd2lsbCBiZSBwcmVzZW50IGFmdGVyIHByZXByb2NjZXNvciwg
YW5kIEVjbGFpciB3aWxsIHNjYW4gaXQuDQo+Pg0KPj4gSmFuLCBwbGVhc2UsIGV4cGxhaW4geW91
ciB0aG91Z2h0LiBJIHRoaW5rLCBJIG1pc3NlZCBzb21ldGhpbmcuDQo+DQo+IElmIGFjcGlfZGlz
YWJsZWQgaXMgY29tcGlsZS10aW1lLWNvbnN0YW50IGZhbHNlLCBhbGwgeW91IG5lZWQgaXMgYQ0K
PiBkZWNsYXJhdGlvbiBmb3IgcHJlcGFyZV9hY3BpKCkuIFRoZSBjYWxsIHRvIGl0IHdpbGwgdGhl
biBiZSBEQ0UtZWQuDQo+IE5vIGlubGluZSBmdW5jdGlvbiwgbm8gI2lmZGVmLCBubyB2aW9sYXRp
b24uDQo+DQo+IEphbg0KDQpZZWFoLi4uIFRoZSBrZXkgd29yZHMgd2VyZSAiTm8gaW5saW5lIGZ1
bmN0aW9uIi4gTm93IGl0J3MgY2xlYXIgdG8gbWUuDQpBbmQgaXQgd29ya3MgZmluZSBmb3IgdGhl
ICdwcmVwYXJlX2FjcGkoKScgYW5kDQonZ2ljdjNfaXRzX3NldHVwX2NvbGxlY3Rpb24oKScgZnVu
Y3Rpb25zLg0KTm8gaW5saW5lIGZ1bmN0aW9ucyAtPiBubyB2aW9sYXRpb25zLiBUaGUgRWNsYWly
IGlzIGhhcHB5Lg0KSW5zdGVhZCBvZiBydW50aW1lIGNoZWNraW5nIHdlJ3ZlIGdvdCBjb21waWxl
LXRpbWUgY2hlY2tpbmcgb2YgdGhlDQpmdW5jdGlvbnMgaW52YWxpZCB1c2FnZS4gT3JpZ2luYWwg
aWRlYSBpcyBwcmVzZXJ2ZWQuDQoNClVuZm9ydHVuYXRlbHksIHRoZSBmdW5jdGlvbiAnZ2ljdjNf
ZG9fTFBJKCknIGRvZXNuJ3QgaGF2ZSBhDQpjb21waWxlLXRpbWUtY29uc3RhbnQgZ3VhcmQgYXJv
dW5kIGl0LiBGdXJ0aGVybW9yZSwgaXQncyBhc3NpZ25lZCB0byB0aGUNCmNhbGxiYWNrIHBvaW50
ZXI6DQoNCiAgICAgLmRvX0xQSSAgICAgICAgICAgICAgPSBnaWN2M19kb19MUEksDQoNCkl0J3Mg
cG9zc2libGUgdG8gcmVtb3ZlIGlubGluZSB2YXJpYW50IG9mIHRoaXMgZnVuY3Rpb24sDQpwdXQg
dGhlIGZvbGxvd2luZyBjb2RlIGluc2lkZSAjaWZkZWYNCg0KICAgICAjaWZkZWYgQ09ORklHX0hB
U19JVFMNCiAgICAgICAgIC5kb19MUEkgICAgICAgICAgICAgID0gZ2ljdjNfZG9fTFBJLA0KICAg
ICAjZW5kaWYNCg0KYW5kIGNoZWNrIGNhbGxiYWNrIHBvaW50ZXIgbGF0ZXINCg0KICAgICBpZiAo
IGdpY19od19vcHMtPmRvX0xQSSApDQogICAgICAgICBnaWNfaHdfb3BzLT5kb19MUEkoaXJxKTsN
Cg0KQnV0IHdlIHdpbGwgbG9zdCB0aGUgb3JpZ2luYWwgaWRlYSAoSSBtZWFuIGhhdmluZyBjaGVj
a2luZyBtZWNoYW5pc206DQpydW50aW1lIG9yIGNvbXBpbGUtdGltZSkuDQoNCklmIHlvdSBoYXZl
IHNvbWUgaWRlYXMsIHBsZWFzZSBsZXQgbWUga25vdy4NCk90aGVyd2lzZSwgU0FGIGNvbW1lbnQg
c2hvdWxkIGJlIGNyZWF0ZWQgdGhlcmUuDQoNClRoYW5rcywNCkRteXRyby4NCg==

