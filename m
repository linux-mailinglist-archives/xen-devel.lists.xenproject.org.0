Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 189F3AED4BE
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 08:38:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1028864.1402541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uW89d-00077W-8W; Mon, 30 Jun 2025 06:38:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1028864.1402541; Mon, 30 Jun 2025 06:38:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uW89d-000765-4n; Mon, 30 Jun 2025 06:38:13 +0000
Received: by outflank-mailman (input) for mailman id 1028864;
 Mon, 30 Jun 2025 06:38:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CI60=ZN=renesas.com=jahan.murudi.zg@srs-se1.protection.inumbo.net>)
 id 1uW89b-00075z-7n
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 06:38:11 +0000
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [2a01:111:f403:c405::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6e8c76c-557c-11f0-b894-0df219b8e170;
 Mon, 30 Jun 2025 08:38:06 +0200 (CEST)
Received: from OSOPR01MB12408.jpnprd01.prod.outlook.com (2603:1096:604:2d7::7)
 by TYCPR01MB11372.jpnprd01.prod.outlook.com (2603:1096:400:3c0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Mon, 30 Jun
 2025 06:38:00 +0000
Received: from OSOPR01MB12408.jpnprd01.prod.outlook.com
 ([fe80::7ff4:8a98:ccd4:daa1]) by OSOPR01MB12408.jpnprd01.prod.outlook.com
 ([fe80::7ff4:8a98:ccd4:daa1%4]) with mapi id 15.20.8880.030; Mon, 30 Jun 2025
 06:37:59 +0000
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
X-Inumbo-ID: c6e8c76c-557c-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QK6lIra9gFwOa8qsAtDW3onJrp1U6RVsY4WIbPhUIj0Re6FCMJ0mXDesLXTQlr1BEXVf9N8p+tlj5fH7FVmLD3hv1svyKIiRse2S+Cbjbb7wsNgC4qxr8dnxmDp5yRL+HKJb44Uv+dYl9hyoIrE7PccBSS50oQejdfr9ASkS0DVmWZOZsIZSvfQ76cQMPCLNUjIT81l3rU+JWISFUO5oDOrjurK/0BROU8wjqyEL4AK4vCGQB45ObWC/WSnlnlMcBZk6Ir3hFIZZPNyAQJuSz7S067BtwFMccbyDCgaDAxeVfzCtLbuPevK710ddc8Q6d6LZfjJYfDh638tr/e00kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKTwIAMPZQYCMfAm2UpJV0s1Q9W/Ub2YeOqTbzmLcXM=;
 b=wHKAn/7yFbqGCjM9u4yNqoZ24kMoaqjmA+MiJ9DXHzBqhYaLEAYTlkWRdr0vCQlPKHrz+d8rkDlREpwNMB0mXSH8sotVYIbzHfiSzuKY1f4uoc5yH2YFDMfDFfy6nKR8n97PmnSWtBz7gqSCu3vHTCtWuLQRAgBHpXv5Lmsv5B2bPCOveUt34jQV0jV+iu3y3OeexPBt+ahBdpum9nMagQW7lWn0OcAA0mlWYnVjU3LkxmzLLhTnmNd4QQMQB171x5LGSpy6aVNZiR0FyoJ0uult5mzLi0JaI17Rc9yocSk6k0V+taI/oLaCpmRbNn+0gMrr0QzrpnS4AVbE1XCXJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKTwIAMPZQYCMfAm2UpJV0s1Q9W/Ub2YeOqTbzmLcXM=;
 b=eHBjNlCeYvw4CxwbiFkWt0DVMSHpfus/d8W2lY0FUgvrRKAxABsa4ZjGVeRX7vU+P3hDh/k/1kbRxPg7y1U81kX+tfuXiTdL9d2iuSS1WynZ0Gq8V+1Fmidyi2XkhS9Yhw1uASIxIJc1Sf7Pij3cW/iq+616SeLImMmynZ2k3sA=
From: Jahan Murudi <jahan.murudi.zg@renesas.com>
To: Julien Grall <julien@xen.org>, "Orzel, Michal" <michal.orzel@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: RE: [PATCH] xen/arm: Enhance IPMMU-VMSA driver robustness and debug
 output
Thread-Topic: [PATCH] xen/arm: Enhance IPMMU-VMSA driver robustness and debug
 output
Thread-Index: AQHb4c6ALl3IHvqkBEOgbLXzyjOhU7QQXHcAgANRIGCAABW5gIAHh3bA
Date: Mon, 30 Jun 2025 06:37:59 +0000
Message-ID:
 <OSOPR01MB12408F2C96C1E82BA03F842ECAB46A@OSOPR01MB12408.jpnprd01.prod.outlook.com>
References: <20250620103123.2174529-1-jahan.murudi.zg@renesas.com>
 <445c5594-a003-4cd8-aa46-8544c0543b1c@amd.com>
 <OSOPR01MB12408AB9E8CD52B45381E83FFAB7BA@OSOPR01MB12408.jpnprd01.prod.outlook.com>
 <52b27bae-b182-488f-afcb-bdbfbc1a495e@xen.org>
In-Reply-To: <52b27bae-b182-488f-afcb-bdbfbc1a495e@xen.org>
Accept-Language: en-IN, kn-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSOPR01MB12408:EE_|TYCPR01MB11372:EE_
x-ms-office365-filtering-correlation-id: 273a8b68-0a54-4a57-f09e-08ddb7a0a81a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?anNzM0pDYlpkN0x4RXlibnFHUFFCeCtsKzQ1QzlScFhqUkdDN1dhV1d4cnZp?=
 =?utf-8?B?YzFWQmJpSmt4UkN3NWZ4WmdlS0xaTnVpNkF5b1lkekN2ZFgzcWxnNzNxRUdT?=
 =?utf-8?B?L2ZIbWFPVm5OclUvWktDQ2cxZUlaa284d2llR0trS0ErSC9xK01GbHBmQ2Qw?=
 =?utf-8?B?aTAxSGZSaTZIeU1rbG55VlNDU2NVcXNYMk1UTWRIK3JzWDh5MS8yd2gzWllB?=
 =?utf-8?B?TjFra0VRUExGZko4Wm9HWW9SaG1QR3d2VTh4VGxhc2NyVTNtdmgybVFoQ05u?=
 =?utf-8?B?cVRKWDdEdVZZTFFlYVRqT3BXS09lVGZNb0wvdWZYdGtsQmFXYzM1LzNaeXFs?=
 =?utf-8?B?TmozZ2dPcGh1WVF4dTREZkFFM2hXbnRWbTFpYlNVQTBiWTcwRU9WS0RDUXdZ?=
 =?utf-8?B?TGx1VVpVL21FRjVZb3I3STN2QmdCcWlpTlZZTnR5bGxQTXdkaUZCd2xIL3RY?=
 =?utf-8?B?YzJLVCswNzd0Mm1MZ1RiR0JWeU1ERDhzb3ppc0FaQ2tHWmk4Y1hWbGZoenJV?=
 =?utf-8?B?WnFaek9SZy83VHc5SXVHbUhXcytJZmdhd1lSTVY0aU8vQU9DWTBrVHFWREh1?=
 =?utf-8?B?VldUNWNDTWt3T3NicFMzMlZSNXFTY2NSQThTUHoyYytoTDRBenZOWkNhWGc2?=
 =?utf-8?B?YWhWK3IrNDdrc0RTU09ScDhQR3AyL2dlRlFGeXFvUlFzMnVMSXUvaEt5OEVF?=
 =?utf-8?B?bFBHSlZSVzl2YUt3REhndjJaSHN3cVJzc2FmemVva3VRZTRzejdxVTd1Vm5C?=
 =?utf-8?B?Q3hGUzZFQTE3MU8rbzRCZkJRTXVrY2JuL3d0cnFQTGY3b0EyMCsySnF1anRk?=
 =?utf-8?B?SXRjSm5zRkJqSmpEQkpZZ3NnYmdiT3l0UkJGbkFOOXR4WE5wY2hIVmpVUWVl?=
 =?utf-8?B?NFo4bTZvYTJZVzc3U3JNWVl1TStlMW9wN1ZySEo5eWpOVUlrSXJzdmNXdFhk?=
 =?utf-8?B?SnhHSmRSWElueEhxWDk5ZDUwcTd5QjQwZk51MHVrMFBYUVVHU092WUcweTU0?=
 =?utf-8?B?OVh5RG1ndmUrTWVxZFpVUWpFSXc2WGp6VEVtS0dkcitLUmUzVzBocXBJbXpP?=
 =?utf-8?B?NFhuWnUyemJBbHdrRFhXOE1Uc3BRZlJiTDUrclplSmRsT1lSUVN4dTBYNmtG?=
 =?utf-8?B?dkRxN0QxeHlNaVgweForaHVZSnpNRUowVDBPb1BiUXJzaUN3OUl3TkMrOUxk?=
 =?utf-8?B?dERoc29kY0dBVGt0V1lyZ05ldGpIYkk3dTYrTmR0eW0wZW1rWjZVL0JpQStC?=
 =?utf-8?B?elhVVmNSczlOcjVraHU1VDViemtDZzhlckloTXQ4eXBIOU96ZGxWbEpTZ1Zj?=
 =?utf-8?B?eVZDdEFJUFk3WjAxTEhQL1MyQk41bjE2NkhMRi83N0x6SC9tVTFsSmZKNTZw?=
 =?utf-8?B?VjJEVklMQTVLbGYyMjNyUXNJS2NyZWQ1WDlENXg1aFpCSGtJaDc4c3dSUkxD?=
 =?utf-8?B?WTdvbndtbW5RaVRmRjhJL0lway9yVzBXRzhKTkluTm15U3dsb29kWTBLaDBZ?=
 =?utf-8?B?dkpadm9FQ3QvNkl5SVFTUmNYVDBjd1Y5S2Y1TzN4YkNESitDa3YxSGtqVUl0?=
 =?utf-8?B?a1dnNE5RS3ptMWp5QlVjSzNzczZQNEdzQkt4VzdYN2pJUFBiOEpwdStYQ0RJ?=
 =?utf-8?B?cHhPY2JXd3VWVE0rcm9TZnNSN1NYUUxUenhEWUR0cm1hQ3E1QWpJNU42bFVC?=
 =?utf-8?B?ZFN0NnBzd3FOK2ZTM2FUUUNYZWdrNTVyQTB0MGhiOXdUTjZ5UTJtQVExeG90?=
 =?utf-8?B?blBCejBaMDBFYnVocEJBRkJiNVNnK01xMmFGWGltUmloT3ZOSW44MjJ3RlRQ?=
 =?utf-8?B?MlkyOG11cmU1aG1nOXpJa0RtZDhXQS9kNHVESGZ0TmZrbStKajdsMmptdWhO?=
 =?utf-8?B?OFp0ZDlkbzFzeEFER09ZS1g5SGJTd1FITkFXNVk5blhqYVBNSjJYa3gwSFh5?=
 =?utf-8?B?V3gzejQ2YzNjU0RGdjlRV2xVVDhaZUE0Z1J3dXpJMHdZMHBDdG40MjA0anRu?=
 =?utf-8?B?eVV3V3JGYjNBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB12408.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dmQwTDVOeW56VkxUMm83aUJ6Yi84MWwzMG5SYlRLVTNsNjNqd2RNQk5QVlUv?=
 =?utf-8?B?OFJkdnl6bmliUXVRTE5Tb1hwamEzSndPV2tENGhsaTNwSmdXb0NUb1BxbWZz?=
 =?utf-8?B?ZTBLeUszTHE5Z1hlQVRSTy92dUVDZW5YNHBTeCtCWk5OMS9vN3lPYU9IZjJn?=
 =?utf-8?B?ZHJPK1l2VkdrcjE4Y0wxN212ZWw0aWJBeFh6bnhvOS9hdGFGZHFCQ09SV09t?=
 =?utf-8?B?RE52YzJhV2F1d1pQSlhJaXhib0k3Q2dGWlBudDg0dk1jM2FVQWMwdHZUNFhC?=
 =?utf-8?B?cUhIZklmMXBRNUxHMkNFaXdRZFJiTlZJeTlXR2tCUURHdmRQQVh3V0NCbmg4?=
 =?utf-8?B?Zk9xSUpUdDNMbUxIK1NIcS9ZZ1M3SU4vOXdSeGtGMlJocEVFV08rZ0FJK1h4?=
 =?utf-8?B?R2Nub282cVpteTU0dDRZY2JTTnpUZHV1V3U4THFURERCbll0eG05VHRkRnRp?=
 =?utf-8?B?YUFXRERkRkxwWm9QQVMvNkVjcUZYVXJCY3g5dXB1M2xSeUxRaFVjNXRnR3pR?=
 =?utf-8?B?eC9vRnZOTW11Q0JBdUg2MVgvNmJ2V2Z5NnREMjQ0Mk5zWUd5K0xOZ1FIRGc2?=
 =?utf-8?B?Z2FOVTJ3MlUrMmUvcW5JdUQ4L000NmpNWW11T1lSK0RmcnhJK042STJrV0Fl?=
 =?utf-8?B?R3VyRzFYdVJQSTlFaTRlSHB4N0JyNWZ5aWhXRWlsK3J1anRXVk8yZTRnQjZV?=
 =?utf-8?B?MEZDZlo3WFhZaGJDSlBkVFlyQVZpMXR5Ni8wV000bU8vNXVuUkIycFFaSEt4?=
 =?utf-8?B?cytPQndTU0xmSnB1bGk0ZnlVL3lsMHF6WGtiZWx2aXdyaFZZYWdyQ3RDTjgy?=
 =?utf-8?B?ZDNTd2pYc1Y5eTVlS3dSQWpjQytaMFpWT0RqM1pjNzdzSXp1VCtWQ3hxWlcr?=
 =?utf-8?B?bEFZZHVIZGlCSzk1ZW9PenVkdksyRnh3NEZ6cmNSMTllSTJNZCtmMURYdFNa?=
 =?utf-8?B?aENGdDcvQ0MyeWVnY3dPRnFzTjNVU3Zud0h0T2VGNGNRRTBXcTd2Rm1Md0pU?=
 =?utf-8?B?blFZNXdRYXpMeEhLKzdrSTdsbUVWUVZhRGtsL2ovbnY5S3Q2QnlJUGxmTXRP?=
 =?utf-8?B?V1NmaVMwQUl4RVJMUW5LYlBQUVJ4elBpVjZ0VEIweHovbi9TVVFWZlRMYzgz?=
 =?utf-8?B?REtmd2dubnUxZDRGTHVpVVZCSVRQWTZvL3V6N21pTGxvT29KQW1pRkU1Y2ht?=
 =?utf-8?B?RHpqb1ZRUzdsbkJOb2ZlanpxL1BOLzY5alV4VkY1d0Ria2w0b0ZwdXRuaGFp?=
 =?utf-8?B?SWxCRi9UTGkxblZ4eGxsY3hFbk9LY3o1aXphVnRpNjQyc09YMkFOb0VMbzhY?=
 =?utf-8?B?RldsaFlzNGkwM3dyN1Mwd2c5L3huM3hDemZVS3krU2U0U3VYNDBocjZzUVMz?=
 =?utf-8?B?dENGZmNGaXgvQ1dLa0NzdU1NM0MxY05Maitjc3pLdGNhNXVWZkFSVXZuNDBl?=
 =?utf-8?B?MjVGNmxQRklFemxWVVNnU1R4akJGbVV3ZnBseFVycmdaZjh2Qm5Yb2s0ZWhv?=
 =?utf-8?B?STViSVNJVmJxTXJYWkRFS0FKVVJRLys0SDNkaUx3M05rNEorTmUrWkkxdGFB?=
 =?utf-8?B?UzZYaHlrbW5Dc3V0a3YzcFN0MHQ5RXJzTWlGeThlMW14WExIMHhNbVpFOW9m?=
 =?utf-8?B?aERNbVFsQm5pUFBYMlVkNFFPMzBJNWxtVUJJZER4V2VRaUM0RWhxYTdYaEJ2?=
 =?utf-8?B?UVRaRWN4bjR1bXgrcUhrZjVhanhSTVExVUgydWJCNFE5R2x2Y2VFYW02MXhp?=
 =?utf-8?B?YmJ2bWdoeGlUMVhSdlpJbHAxSFVmblZLbUk1TVlUc2dnZjFZTmR5SnM2MVZY?=
 =?utf-8?B?OGlOeUdNY0lQRVJJTis3ZCtLZGdLY05JbkNLM0dsOGFBVjE5bVlwQU5ZelJZ?=
 =?utf-8?B?QndLNXlyN0RhbVFiRm11SGsvM2JtUkRqWmpBaWRFeUtCM2hpbENscVR2R3Rj?=
 =?utf-8?B?MkMxeHc4ZHd5VktBcklxeDJhOCtiTTV4M3Q1TmpZb21ncGlvWmErbkQxRDV6?=
 =?utf-8?B?YUQybnRTcU9jZDJORjB2cXJOMmJ0ZE9HbGxvMXZBRzF5WUVyZGQ3MURDTHFy?=
 =?utf-8?B?N0NJanlEa1dQTXZnMHlkS1E4R1V0YjAwWGdBQ2ZvTktEODAzOXB2bXFqQTFs?=
 =?utf-8?B?dzd1TzcyY2I2UFlHTFNxeEdrcmtqaXcxdVZ6RHU2cGQwd2hRWFBvV0FDbTEv?=
 =?utf-8?B?Tnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB12408.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 273a8b68-0a54-4a57-f09e-08ddb7a0a81a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2025 06:37:59.9068
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VvG14ON+Sit8/AFsApr7d95gZUlfGMaL5naa4tmJhneCy28MFF6VYx6wLqb/qWDV/Oo23DpSREn/pNSoGlwGtHMrMnzlYK9ueohfdHjqEb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11372

SGkgSnVsaWVuLA0KDQpPbiAyNS8wNi8yMDI1IDE2OjUzLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQoN
Cj5IaSBKYWhhbiwNCg0KPj4+PiArICAgIGRzYihzeSk7DQo+Pj4gQW55IGNsdWUgd2h5IExpbnV4
IChtYWlubGluZSkgZG9lcyBub3QgZG8gdGhhdD8NCg0KPiBPbmUgcHJvY2VzcyByZW1hcmssIHdl
IHR5cGljYWxseSBjb21tZW50IGlubGluZSByYXRoZXIgdGhhbiBwYXN0aW5nIGEgcXVvdGUgYW5k
IHJlcGx5aW5nIGF0IHRoZSB0b3Agb2YgdGhlIGUtbWFpbC4NCg0KIFRoYW5rcyBmb3IgdGhlIHN0
eWxlIG5vdGUgLSBJJ2xsIGZvbGxvdyB0aGUgaW5saW5lIGNvbW1lbnRpbmcgY29udmVudGlvbiBt
b3ZpbmcgZm9yd2FyZC4NCg0KPj4gVGhlIGltcGxlbWVudGF0aW9uIHdyaXRlbCgpIHdoaWNoIGNv
bnRhaW5zIGFuIGltcGxpY2l0IGRzYihzdCkgd2hpY2ggbGlrZWx5IHN1ZmZpY2llbnQgZm9yIExp
bnV4IGZvciBpdHMgU3RhZ2UtMSBJT01NVSB1c2FnZSB3aGVyZSBDUFUgYW5kIElPTU1VIGludGVy
YWN0aW9ucyBhcmUgY29oZXJlbnQuDQo+PiBIb3dldmVyLCBYZW4gdXNlcyB0aGUgSVBNTVUgYXMg
YSBTdGFnZS0yIElPTU1VIGZvciBub24tY29oZXJlbnQgRE1BIG9wZXJhdGlvbnMgKHN1Y2ggYXMg
UENJZSBwYXNzdGhyb3VnaCksIHJlcXVpcmluZyB0aGUgc3Ryb25nZXIgZHNiKHN5KSB0byBlbnN1
cmUgd3JpdGVzIGZ1bGx5IHByb3BhZ2F0ZSB0byB0aGUgSVBNTVUgPj5oYXJkd2FyZSBiZWZvcmUg
Y29udGludWluZy4NCg0KPiBJIGRvbid0IGZvbGxvdy4gQXJlIHlvdSBzYXlpbmcgdGhlIElQTU1V
IGRyaXZlciBpbiBMaW51eCBkb2Vzbid0IG5vbi1jb2hlcmVudCBETUEgb3BlcmF0aW9ucz8NCg0K
TGV0IG1lIGNsYXJpZnkgbXkgdW5kZXJzdGFuZGluZzogIEluIG5hdGl2ZSBMaW51eCwgdGhlIElP
TU1VIHdvcmtzIGF0IHN0YWdlLTEgKFZBIC0+IFBBKSBhbmQgdHlwaWNhbGx5IGFzc3VtZXMgY29o
ZXJlbmN5IGJldHdlZW4gQ1BVIGFuZCBJT01NVS4gVGhlIGltcGxpY2l0IGRzYihzdCkgaW4gd3Jp
dGVsKCkgaXMgZW5vdWdoIHRoZXJlLiBCdXQgaW4gWGVuLCB3ZSB1c2UgdGhpcyBhcyBzdGFnZS0y
IChHUEEgLT4gSFBBKSBmb3IgY2FzZXMgbGlrZSBQQ0kgcGFzc3Rocm91Z2ggd2hlcmUgZGV2aWNl
cyBtaWdodCBiZSBub24tY29oZXJlbnQuIFdlIG1pZ2h0IG5lZWQgc3Ryb25nZXIgYmFycmllciBk
c2Ioc3kpIGluIHhlbiBiZWNhdXNlOiAxKSBXZSBjYW4ndCBhc3N1bWUgdGhlIFRMQiB3YWxrZXIg
aXMgY29oZXJlbnQgZm9yIHN0YWdlIC0yIGFuZCB3ZSBtdXN0IGFsc28gcHJldmVudChtaW5pbWlz
ZSkgYW55IERNQSBvcGVyYXRpb25zIGR1cmluZyBUTEIgaW52YWxpZGF0aW9uKCBvYnNlcnZlZCBz
b21lIElQTU1VIGhhcmR3YXJlIGxpbWl0YXRpb25zIGluIHRoZSBkb2N1bWVudGF0aW9uKSAuDQoN
Cj4gQnV0IGV2ZW4gaWYgdGhhdCdzIHRoZSBjYXNlLCBJIHN0aWxsIGRvbid0IHNlZSB3aHkgbm9u
LWNvaGVyZW50IERNQSB3b3VsZCBtYXR0ZXIuIEZyb20gbXkgdW5kZXJzdGFuZGluZywgaGVyZSB3
ZSB3YW50IHRvIG1ha2Ugc3VyZSB0aGUgVExCIHdhbGtlciBzZWVzIHRoZSBjaGFuZ2UgYmVmb3Jl
IHRoZSBmbHVzaC4NCj4gU28gaWYgdGhlIFRMQiB3YWxrZXIgaXMgY29oZXJlbnQgd2l0aCB0aGUg
cmVzdCBvZiB0aGUgc3lzdGVtLiBUaGVuIGl0IHdvdWxkIGJlIHNpbWlsYXIgdG8gdGhlIENQVSBU
TEJzIHdoZXJlIHdlIG9ubHkgbmVlZCBhICJkc2Igc3QiICh3ZWxsIHdlIHVzZSAibnNoc3QiIGJl
Y2F1c2UgdGhlIFRMQiBpcyBpbiBub24tc2hhcmVhYmxlIGRvbWFpbikuDQo+IElmIHRoZSB3YWxr
ZXIgaXMgbm90IGNvaGVyZW50LCB0aGVuIHRoYXQncyBhIGRpZmZlcmVudCB0b3BpYy4NCg0KWW91
J3JlIGNvcnJlY3QgdGhhdCBkc2Ioc3QpIHdvdWxkIHN1ZmZpY2UgaW4gYW4gaWRlYWwgY29oZXJl
bnQgc3lzdGVtLiBIb3dldmVyLCB3aXRoIFBDSSBwYXNzdGhyb3VnaCB3ZSBtdXN0IGhhbmRsZSBu
b24tY29oZXJlbnQgZGV2aWNlcy4gV2hpbGUgZHNiKHN0KSBlbnN1cmVzIHdyaXRlcyBjb21wbGV0
ZSwgZHNiKHN5KSBwcm92aWRlcyB0aGUgc3Ryb25nZXIgc3lzdGVtLXdpZGUgdmlzaWJpbGl0eSB3
ZSBuZWVkIC0gZ3VhcmFudGVlaW5nIGFsbCBjb21wb25lbnRzIChpbmNsdWRpbmcgbm9uLWNvaGVy
ZW50IGRldmljZXMpIHNlZSB0aGUgY2hhbmdlcyBiZWZvcmUgcHJvY2VlZGluZy4NCg0KPiBBbnl3
YXksIEkgYW0gbm90IGFnYWluc3QgdXNpbmcgImRzYihzeSkiLiBJdCBpcyBzdHJvbmdlciB0aGFu
IG5lY2Vzc2FyeSBidXQgYWxzbyBwcm9iYWJseSBub3QgYSBtYXNzaXZlIGRlYWwgaW4gdGhlIFRM
QiBmbHVzaCBwYXRoLg0KDQpUaGFuayB5b3UuIEkgYWdyZWUgdGhlIHBlcmZvcm1hbmNlIGltcGFj
dCBpcyBuZWdsaWdpYmxlIGluIHRoZSBmbHVzaCBwYXRoLCBhbmQgaXQncyBiZXR0ZXIgdG8gYmUg
c2FmZSB3aGVuIGRlYWxpbmcgd2l0aCBwYXNzdGhyb3VnaCBkZXZpY2VzIGluIHhlbi4NCg0KUmVn
YXJkcywNCkphaGFuIE11cnVkaQ0K

