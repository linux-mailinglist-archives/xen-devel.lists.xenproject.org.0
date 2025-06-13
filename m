Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF58AD90D2
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 17:09:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014446.1392530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ61V-00076X-2l; Fri, 13 Jun 2025 15:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014446.1392530; Fri, 13 Jun 2025 15:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ61U-00074N-W7; Fri, 13 Jun 2025 15:08:52 +0000
Received: by outflank-mailman (input) for mailman id 1014446;
 Fri, 13 Jun 2025 15:08:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQd4=Y4=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1uQ61T-00074H-2i
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 15:08:51 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f1b7bc4-4868-11f0-a309-13f23c93f187;
 Fri, 13 Jun 2025 17:08:49 +0200 (CEST)
Received: from AM6PR0202CA0063.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::40) by DB9PR08MB6635.eurprd08.prod.outlook.com
 (2603:10a6:10:254::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Fri, 13 Jun
 2025 15:08:44 +0000
Received: from AMS0EPF000001AC.eurprd05.prod.outlook.com
 (2603:10a6:20b:3a:cafe::e9) by AM6PR0202CA0063.outlook.office365.com
 (2603:10a6:20b:3a::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Fri,
 13 Jun 2025 15:08:44 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AC.mail.protection.outlook.com (10.167.16.152) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Fri, 13 Jun 2025 15:08:42 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 15:08:10 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%2]) with mapi id 15.20.8813.024; Fri, 13 Jun 2025
 15:08:09 +0000
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
X-Inumbo-ID: 4f1b7bc4-4868-11f0-a309-13f23c93f187
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OF4i9MAsgaCYC2/eZAbczf6dVK30FDUNo9s/AdquJ9c+T2sX2DiiITpRh226gDTT2iTBbCcip02nhY2+1rBWAmJLUNBjDHGluVcHp7JO9TYi6wW8em4vReUc6HnJ2aXdG0M9HDAu7UJ6YCzxuimRof4J/EjmAMp3YypQhf+ebhORRA8EAcw50uYubIVzMli5pfqGswb/2meCbBemJZRwdGsG1oOOeifmzXD7PS+GYGgLECMa+2Ozft1GIrnOTeeJMVjMcLFUKkzKA+8noPg6Pchxai/QrKxMgLJhI7p9lXdOBSIY3QkkD6smQ7zxqTrqdZnzT6SISSUUUej/v8j3FA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MXDymSsTrYYTlYE//xY6tmXz2/gWgkiBxyI9GOerb88=;
 b=J1+XqTOng4L3KRpBnZQfo9dM8Bl8FAzebJ/IXByVeLBVDepIAh9f94G9JvodfAfG6sW6EfdDJZNLFsa6k03pssu3s6U4OaGEsGdMpI4gsLrQxR8eLvUyII9a51OA0eUeH7Bf4+VBwORQM7/I2ZH+ysE7/RkqSAoaStcfx1j0Q/CIhka9SwkcTj4vAyMKIz7AlF29ar3jVQ7D8IGexUFE0yFcJI2viTc14UEMOQD3eCxZ2oOoGk/HXAtfLwfejtp2/WFPv4ZE1NcbdijLJZsbjNsgi9r5TF3KYKdxqOTe+AmyJAf+wC8eImxcksJAo8LUwYRxGcB4ksVn1LWQTd5Txw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXDymSsTrYYTlYE//xY6tmXz2/gWgkiBxyI9GOerb88=;
 b=NfHDcdE5yAiOp+dLYc2dB7McCM3Jkrzvd72F98alsqJkCty2upg2DnAjJs8Sx8/Wh8lbMh6p2BFyf34nUqHhdf4rbVf2xqOhDHXwtEG+wpM0aDWpUogYIh70XbyvqwysV7LyN1LamNwqImNwvyojuC5z0e+aGevHwyPcTWBpq40=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uOwMtrCie1qwU6yNwvyUgPxfvhaXeceoQu6Wgt2OXq8tIng1bphKknxlQ1M6lAJS9AFao37R+G1yW3EFxX+EdMzt0k6KswU1GcMu5hVAiLHVxQDVyy2slnz7o8hDvtC5YVwsMCTIYLFbvwfE/qRAmi2hj/VPUP4H70Wow636b55V/gl+YaCcN/h1oSBg1fZBniSEiTbmMIcUSeGs4nH/bWULcBfu0D8KcPMej7KnOBcbnmLup+7xN0negayKlGtt9t6jE/ZnbdIvyEmmzsQuWAyvZQbcZm+sVsSQ4t26xdOpMocVPd3xiKLugysU+Dg4JgaBIb29AEECmMuov5t2aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MXDymSsTrYYTlYE//xY6tmXz2/gWgkiBxyI9GOerb88=;
 b=WTelt3pm9EB5iPjSLZFnRuiRDSz6VlKeYi71PtV9Bv6l3ExQHLvhZbVsnA50sHsclr3jcjU2L/PnYsjKYk9DTrTmDMJBe5z/DPax3lcJKa2misOCNUM5+LmC94vFKfqlH5ds6VjibAwlr28Ax+C0TcBb7HETiqKQ2qvCvUk9SYTCHq97nQd7woih0XpJcnOFc9B3F/TPFN4zUefJiy7Db9VZuoj23cQAvk8AKYPYd6JrbY4MGgdENOHI2kZCHt8QYwjeXekysNKUUx9QwahEJAT1gRr7wp8tflz1bitL2awBwVDyGyB0UQ91kU93Kw43w4WB5nwnbOO1qORJ3RfNLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXDymSsTrYYTlYE//xY6tmXz2/gWgkiBxyI9GOerb88=;
 b=NfHDcdE5yAiOp+dLYc2dB7McCM3Jkrzvd72F98alsqJkCty2upg2DnAjJs8Sx8/Wh8lbMh6p2BFyf34nUqHhdf4rbVf2xqOhDHXwtEG+wpM0aDWpUogYIh70XbyvqwysV7LyN1LamNwqImNwvyojuC5z0e+aGevHwyPcTWBpq40=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 4/6] arm/mpu: Move the functions to arm64 specific
 files
Thread-Topic: [PATCH v3 4/6] arm/mpu: Move the functions to arm64 specific
 files
Thread-Index: AQHb2t5pdnmvyzn4J0yiDihJhBlJArQBNBGA
Date: Fri, 13 Jun 2025 15:08:09 +0000
Message-ID: <FB372638-8E09-4CCF-985A-25C6F0F691BC@arm.com>
References: <20250611143544.3453532-1-ayan.kumar.halder@amd.com>
 <20250611143544.3453532-5-ayan.kumar.halder@amd.com>
In-Reply-To: <20250611143544.3453532-5-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|PA4PR08MB7411:EE_|AMS0EPF000001AC:EE_|DB9PR08MB6635:EE_
X-MS-Office365-Filtering-Correlation-Id: 85e8d12e-b15f-443b-06f1-08ddaa8c2fb0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?aDNIV2hmdUtESDg4NExnSWViMjREbWhGN1F6ZkZKa01KTHBEQWk4TGFXcFBm?=
 =?utf-8?B?V2JZSUxOMzBKak1WSXc4NklBbDQvV2l0ZytCMmZDZlhROFdYb3EzaWlwU0FW?=
 =?utf-8?B?UC9VK094NERvN1lYUTM5ZEJhUFZqakd0ZmF4OXhBb0xtWVhHaGZZT0l2UVlt?=
 =?utf-8?B?UHY1VVdpcXJib0twaHJxKzdPUmJFVFA4OFN0WWdmL3kzcTVWSmsvbnVTc0J1?=
 =?utf-8?B?ZENHa1poV2MzcWMxb2lxNWdNcjFMVWQwYVZ2NlV3TWFvcTJvNVVLUnZteWpD?=
 =?utf-8?B?YW5xSy9yb3FUMjkzMDU0VEJNNnFkMTRwOGoxUXFkZS90NnZkOERPeU1SNFRL?=
 =?utf-8?B?RDZjQTM1bjBSUWhJdjF3WFVVQkcwRVdPZ09xZG05SHJpRm9hMjF1T3Q3UlIy?=
 =?utf-8?B?V3pGd2RKM0orTUNXZGJaQlZaUzVOcVgveHcydEhoVXk0emNXN0Z2dU1md3BQ?=
 =?utf-8?B?V2xwbE1yWTNwWG1ZdlUxUnBlK25LN0s1ZXg5NEJ1WHBuRjVTVXpVbjNFMjEy?=
 =?utf-8?B?Ti9Sd1p3Smx6Q2cyM0YrZmp4YmJrRHN1QUJJVktyamh1bkQxQnVRR0VGelV5?=
 =?utf-8?B?SDZDN2dMdFZJT0IzbjB5Yk1EZWFZTnY4amxBNWhRQ0VQSC9jaUdJOW50TVUx?=
 =?utf-8?B?NFVaMDJZVm12RHJlOU5sWCtTcHI5QTFGYitPQ1l2MXl3NGxsNXlDVWw2dmo0?=
 =?utf-8?B?Sm1mSjM2aXJ0SjVVdFRsMzI1NVg1c21jMDFWRDNoQ2hWVExOV0N1cUo1VmNT?=
 =?utf-8?B?M2FaTHZLbEl6MTN3ZXgwNjdGRUhmbWNzN2E5Sm0wWWs3Q0hZR0EyWlJkc3h6?=
 =?utf-8?B?djNIMHdZK3ZVK0w0dmVVS01DZk5LeHI2N3VPNzBPamVGbXlqL2NBWDFkellY?=
 =?utf-8?B?KzFjZXdkbnlXOTU4WjF0Y0oxajNsc3dCOE9yS3Q4ZDI5NzZnR0JQVlZrWTEw?=
 =?utf-8?B?bHJOSDRIbjZFck1saVk5TTl1ZkpGVmd6YXQ3cWE1UkRTMEtWRjZVcE1rL21j?=
 =?utf-8?B?ZzlUR2NYRkczZTBPYWlxUjJOamZmaWJPVDEwTUF2L2lHMnIySnoxMTc0NGts?=
 =?utf-8?B?bmJwelM4NmJ2ekdrWDc3UTNsL0JwQ25lamNtTlFWQ2RGRjNEY1B5MWNsUUE0?=
 =?utf-8?B?aWdKN3p6UGhYaklFVU9xVkNVVSs2Q0FtT2x0K2FTbERPekFNTEtYZlJCdHlS?=
 =?utf-8?B?NnVVbHdzYWRiaXJpbzcrQklBU3lRTEU1ekpYcklkWjMxSytnd1o4U0JNV0dR?=
 =?utf-8?B?cm9uU3FmckY2MXFaT2pmSE92cGhka0dwbi9pbE40VUM0N1ZJSDFWeXgxb0tz?=
 =?utf-8?B?Z2hWOXkwZmRvVWhndFhqektPU0xobGVGSlVuaThVRmxYeVR1VzFqVEEweTgv?=
 =?utf-8?B?NGZCTFM0WHFNOWV1RmNBRXFrbzF3OWd2Y09RT2E2RHkxZjBFUHczNUNTSUE3?=
 =?utf-8?B?TXltWHdGajBRMWJmeXdiSit6YVlwV1ZBVlpvZVBpR2szSDcxTWw4bi82TWx4?=
 =?utf-8?B?QXU4TGl0aVVSWkhQNjhBazZYbEFqVnVjbGR2UWVCaUpKdXVuSnVDYVJMTkxV?=
 =?utf-8?B?Y1lmamNnZW5zK2VmY1RrWDE1a3pCVzFSSFN2UWVhbmt1RmFHelkxakp2UC9N?=
 =?utf-8?B?TGNzWnBMbzlrZlJITzQ3cmx3NDBLeGNhWE1rd3RTRXNpMnIyQ0wrOUppN3ky?=
 =?utf-8?B?NTJRVnRpeDV4REQrN1k0dmtVRjdkRU5LNmV5YnVWdW80MWxBT1Ywc3hsS0tw?=
 =?utf-8?B?NXBPdWdFVk5yZ05RbDlhTDN5amVSUVpYU1o4eVY0S2hYRVhPczJ5ZDZPZnVR?=
 =?utf-8?B?OFVlYzFhd0hPd3gwbHVzV295MGRsL3JwUlRnUzI1MW8xVlZ2TzdJaUhKR3Vj?=
 =?utf-8?B?ekt0TXhXdnV0bmFSdWczaENFUW16dVdNLzhROTU0dm1CaWQwOFp6NGl6QnN3?=
 =?utf-8?B?NVc0aERGVUppUmFaMkdqdldXTjdMK1ZDTXFKZ1JmRmNhVm0xbDFrc2xpZmdV?=
 =?utf-8?Q?Un0e8Wb7ZKSA/KaV4mDHLsHJphPn3I=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <643CF0BA9B0D734194DE689645AEE475@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7411
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f6dc8698-db9f-40e5-7a62-08ddaa8c1bf6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|14060799003|35042699022|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cHE5cnY3Q3lxMWorS01NRDF3UXRqWnhTdmw3R2RSb3ltelZiYWk0MVBjOWtE?=
 =?utf-8?B?UEIxQWN5NVllVGhMZXEwSVkyd2c0STBTcFczZnJZR2Q4RW1zOFRVQWwxUXpM?=
 =?utf-8?B?RHFuNVFycmx5YXdvWXRMbnMwOGVRZnFxQ3kwNUk2K2V0U0V4cWVrVG1sQTh0?=
 =?utf-8?B?Z1I1ZGlEVWxQZkthK3dXOEIwQ1pnSDJUN2lrQS9HdmhhSXBpUnZlL3p4Z1hQ?=
 =?utf-8?B?MFdTLzZkN1VDQWROV2Z4UG5mcXJyR0EvOHQwbE5ObktKblVEeFlPUytsTmgx?=
 =?utf-8?B?QXlyMWprKzlHbWZDcC9WNVcrdXltb0NRUFllaGxZelhoVzI3T1hMQS9ybkhE?=
 =?utf-8?B?dThUTTZGZFMzd24ya2dCQnhvVlNxYVFMUU91SmFGQ0tKdlF0VUx5ME8xQTlL?=
 =?utf-8?B?QzNScjNnZzRmK3RmV1lwcTJJVFRFZnp6UHFOUWQ4S3d3SS9NQm5QaW1IN1RY?=
 =?utf-8?B?N3ZvVzA0aVFPL0NWeDZEUFRDQXB2ek1VaEEvRVBRT05yZTJ0cHV4OHNPbm8v?=
 =?utf-8?B?b2h2b3pjZmo4WjIxU3Y1amlLMUV4NjBPdUJObXR0TzFPSmY5cEUrdzZBUEZj?=
 =?utf-8?B?K1ZIKytkQkJSeGdTOUFpVUJxUFAwSmNyYnZpd2lyTXg1aHJCRWh5WGlKcmhq?=
 =?utf-8?B?OUVrbjJQaGJneU5icXBOQ0RJRHREckZyMmh0OVFxNEhGVkJJckx1eUUzQUFX?=
 =?utf-8?B?dU45ekdXN2tHNGNYelBqTnRLQzQ2b1hCMXFnSjBuazBMK3Y3ZUFIL1RZbFhV?=
 =?utf-8?B?Ky9FYTFDd2pIUU9jS1I0d0JjQjdsZCsrUWtIb1oweDRjbjNZdVRnMWx5WjBx?=
 =?utf-8?B?ZUdSeHNYMDNpbVdpczhEYWsrWUlJMWMyeGgyZVJxS3UvcVE3V21Rc2d1MnRq?=
 =?utf-8?B?N25VRVc0UHMyK1lucUdOTGFGSUFTemVXL3lqdm5vSEFKUDRTaTVDSUpsTEdZ?=
 =?utf-8?B?VXBuaU9lZWd0UUh0WllkSFJaOXB1alBuNVgvNTUrN1I0V25TN3lWYnVMYzlZ?=
 =?utf-8?B?a2JtRjRWc2lOZGM0Y3d5RmZ2YnI1TlA1bXB2N0ZtMVlEeFVoNUZzaDM0eUJu?=
 =?utf-8?B?VXMyYnVSS1RjeXJmcXdMMjlDMC82ZFRJZ1J1dENYa0gycVRPS1NVY1BVSUx6?=
 =?utf-8?B?cm5kZEE5VmJ5YzQ4RkU1YmtQSUFWL2xRaGdYM1BDZnVuTEFONDRQS3RiOTBQ?=
 =?utf-8?B?UDA0ZUozOGgwOThpTVg4cHhlQUk1eStJTVFtYU42L2pHRCswaXZuekh2SGY5?=
 =?utf-8?B?R1E2NnZxb2Rwb081UC9TVXUwb1NoUENrYVg0V0NiZ0ZZeUtGV1lFVzB6Z0ZO?=
 =?utf-8?B?RFBaaDdTYUxXYytYeVkzeVVpR2xiWXBzQjlIK0RWRDBpbDdseENmNHdJYnJC?=
 =?utf-8?B?UWQ4aXpDRDZPU3hVMml2R2VhWjRrckM2b0ZTb1pPNXhVL01mWFFwaXVCZk96?=
 =?utf-8?B?S291cHFiT2NKZWVqVVdDcjZja3hOUEw2Y2t0ZTk0bFJLMXBlVE9Rb1B6bGt2?=
 =?utf-8?B?VG5FbGo1SURTTmlEU0NmSnM2RmVMZUZzeGZFRUNIVEhLdHBtNGwzNVgzY1hO?=
 =?utf-8?B?bVhDWXIxWk4rZW9pdWwvWGxLSitsK1BDSzdmZFMvVjBYSWIvbXk1cGFlRGh2?=
 =?utf-8?B?NlZTaWZ1bzREUm9FVmxHQlJhNENSOVFFZXVrZlJuN2pwWkxrRXhrRVliR1Zp?=
 =?utf-8?B?eGV1c09NY0c3K2d6Z2pPYVpXK255YzYvRzR5NnFhTzQycGFGYUpZSTNTR1Bv?=
 =?utf-8?B?SjAydnFiMkwwd1U0NFZQelFKQUNiazBVZVU5Y0ZGZ2l6ME9PUFp4UUtvSWNj?=
 =?utf-8?B?RUlYT1Nhb2d0U1hmMkpDWEIwOUpEeHYxdURPY0drL2w4T1lXMUxqeWg4ZnV2?=
 =?utf-8?B?dExyS08rY1NqV25Na05IcFFKMkx2bnl3ejlaeTZUbTJpbFhEd2pHQnJLMkUy?=
 =?utf-8?B?SDVGTWZUSkpIK2p3QXBSUXRzQmxLRi9rZVZtMThmNWkyU2tGTk5DeXhObkpl?=
 =?utf-8?B?aFFVN2RhMkNmeFZCZzZRdW5yN2lWTVE2eDR6dHpxRFQvVkxHRnQwZk1ZSWpP?=
 =?utf-8?Q?/ubZXW?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(14060799003)(35042699022)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 15:08:42.7741
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e8d12e-b15f-443b-06f1-08ddaa8c2fb0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6635

SGkgQXlhbiwNCg0KPiBPbiAxMSBKdW4gMjAyNSwgYXQgMTU6MzUsIEF5YW4gS3VtYXIgSGFsZGVy
IDxheWFuLmt1bWFyLmhhbGRlckBhbWQuY29tPiB3cm90ZToNCj4gDQo+IHByZXBhcmVfc2VsZWN0
b3IoKSwgcmVhZF9wcm90ZWN0aW9uX3JlZ2lvbigpIGFuZCB3cml0ZV9wcm90ZWN0aW9uX3JlZ2lv
bigpDQo+IGRpZmZlciBzaWduaWZpY2FudGx5IGJldHdlZW4gYXJtMzIgYW5kIGFybTY0LiBUaHVz
LCBtb3ZlIHRoZXNlIGZ1bmN0aW9ucw0KPiB0byB0aGVpciBzcGVjaWZpYyBmb2xkZXJzLg0KDQog
ICBe4oCUIE5JVDog4oCcdG8gc3ViLWFyY2ggc3BlY2lmaWMgZm9sZGVy4oCdPyBXaGF0IGRvIHlv
dSB0aGluaz8NCg0KPiANCj4gR0VORVJBVEVfe1dSSVRFL1JFQUR9X1BSX1JFR19DQVNFIGFyZSBk
dXBsaWNhdGVkIGZvciBhcm0zMiBhbmQgYXJtNjQgc28NCj4gYXMgdG8gaW1wcm92ZSB0aGUgY29k
ZSByZWFkYWJpbGl0eS4NCg0KSXQgcmVhZHMgYSBiaXQgaGFyZCBpbiB0aGlzIHdheSwgd2hhdCBh
Ym91dDoNCg0K4oCcQWxzbyB0aGUgbWFjcm8gR0VORVJBVEVfe1dSSVRFL1JFQUR9X1BSX1JFR19D
QVNFIGFyZSBtb3ZlZCwgaW4gb3JkZXIgdG8NCmtlZXAgdGhlbSBpbiB0aGUgc2FtZSBmaWxlIG9m
IHRoZWlyIHVzYWdlIGFuZCBpbXByb3ZlIHJlYWRhYmlsaXR5Ig0KDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBBeWFuIEt1bWFyIEhhbGRlciA8YXlhbi5rdW1hci5oYWxkZXJAYW1kLmNvbT4NCj4gLS0t
DQo+IENoYW5nZXMgZnJvbSAtDQo+IA0KPiB2MS4udjIgLSBOZXcgcGF0Y2ggaW50cm9kdWNlZCBp
biB2My4NCj4gDQo+IHhlbi9hcmNoL2FybS9tcHUvTWFrZWZpbGUgICAgICAgfCAgIDEgKw0KPiB4
ZW4vYXJjaC9hcm0vbXB1L2FybTY0L01ha2VmaWxlIHwgICAxICsNCj4geGVuL2FyY2gvYXJtL21w
dS9hcm02NC9tbS5jICAgICB8IDEzMCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0K
PiB4ZW4vYXJjaC9hcm0vbXB1L21tLmMgICAgICAgICAgIHwgMTE3IC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0NCj4gNCBmaWxlcyBjaGFuZ2VkLCAxMzIgaW5zZXJ0aW9ucygrKSwgMTE3IGRl
bGV0aW9ucygtKQ0KPiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJtL21wdS9hcm02NC9N
YWtlZmlsZQ0KPiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJtL21wdS9hcm02NC9tbS5j
DQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21wdS9NYWtlZmlsZSBiL3hlbi9hcmNo
L2FybS9tcHUvTWFrZWZpbGUNCj4gaW5kZXggOTM1OWQ3OTMzMi4uNDk2M2M4YjU1MCAxMDA2NDQN
Cj4gLS0tIGEveGVuL2FyY2gvYXJtL21wdS9NYWtlZmlsZQ0KPiArKysgYi94ZW4vYXJjaC9hcm0v
bXB1L01ha2VmaWxlDQo+IEBAIC0xLDQgKzEsNSBAQA0KPiBvYmotJChDT05GSUdfQVJNXzMyKSAr
PSBhcm0zMi8NCj4gK29iai0kKENPTkZJR19BUk1fNjQpICs9IGFybTY0Lw0KPiBvYmoteSArPSBt
bS5vDQo+IG9iai15ICs9IHAybS5vDQo+IG9iai15ICs9IHNldHVwLmluaXQubw0KPiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL21wdS9hcm02NC9NYWtlZmlsZSBiL3hlbi9hcmNoL2FybS9tcHUv
YXJtNjQvTWFrZWZpbGUNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAw
MC4uYjE4Y2VjNDgzNg0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL3hlbi9hcmNoL2FybS9tcHUv
YXJtNjQvTWFrZWZpbGUNCj4gQEAgLTAsMCArMSBAQA0KPiArb2JqLXkgKz0gbW0ubw0KPiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL21wdS9hcm02NC9tbS5jIGIveGVuL2FyY2gvYXJtL21wdS9h
cm02NC9tbS5jDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAuLmE5
NzhjMWZjNmUNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi94ZW4vYXJjaC9hcm0vbXB1L2FybTY0
L21tLmMNCj4gQEAgLTAsMCArMSwxMzAgQEANCj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wLW9ubHkgKi8NCj4gKw0KPiArI2luY2x1ZGUgPHhlbi9idWcuaD4NCj4gKyNpbmNs
dWRlIDx4ZW4vdHlwZXMuaD4NCj4gKyNpbmNsdWRlIDxhc20vbXB1Lmg+DQo+ICsjaW5jbHVkZSA8
YXNtL3N5c3JlZ3MuaD4NCj4gKyNpbmNsdWRlIDxhc20vc3lzdGVtLmg+DQo+ICsNCj4gKy8qDQo+
ICsgKiBUaGUgZm9sbG93aW5nIGFyZSBuZWVkZWQgZm9yIHRoZSBjYXNlczogR0VORVJBVEVfV1JJ
VEVfUFJfUkVHX0NBU0UNCj4gKyAqIGFuZCBHRU5FUkFURV9SRUFEX1BSX1JFR19DQVNFIHdpdGgg
bnVtPT0wDQo+ICsgKi8NCj4gKyNkZWZpbmUgUFJCQVIwX0VMMiBQUkJBUl9FTDINCj4gKyNkZWZp
bmUgUFJMQVIwX0VMMiBQUkxBUl9FTDINCj4gKw0KPiArI2RlZmluZSBQUkJBUl9FTDJfKG4pICAg
UFJCQVIjI24jI19FTDINCj4gKyNkZWZpbmUgUFJMQVJfRUwyXyhuKSAgIFBSTEFSIyNuIyNfRUwy
DQo+ICsNCj4gKyNkZWZpbmUgR0VORVJBVEVfV1JJVEVfUFJfUkVHX0NBU0UobnVtLCBwcikgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ICsgICAgY2FzZSBudW06ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0K
PiArICAgIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwNCj4gKyAgICAgICAgV1JJVEVfU1lTUkVHKHByLT5wcmJh
ci5iaXRzICYgfk1QVV9SRUdJT05fUkVTMCwgUFJCQVJfRUwyXyhudW0pKTsgICBcDQo+ICsgICAg
ICAgIFdSSVRFX1NZU1JFRyhwci0+cHJsYXIuYml0cyAmIH5NUFVfUkVHSU9OX1JFUzAsIFBSTEFS
X0VMMl8obnVtKSk7ICAgXA0KPiArICAgICAgICBicmVhazsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gKyAgICB9DQo+ICsN
Cj4gKyNkZWZpbmUgR0VORVJBVEVfUkVBRF9QUl9SRUdfQ0FTRShudW0sIHByKSAgICAgICAgICAg
ICAgICAgICAgICBcDQo+ICsgICAgY2FzZSBudW06ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiArICAgIHsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gKyAgICAgICAgcHItPnBy
YmFyLmJpdHMgPSBSRUFEX1NZU1JFRyhQUkJBUl9FTDJfKG51bSkpOyAgICAgICAgICBcDQo+ICsg
ICAgICAgIHByLT5wcmxhci5iaXRzID0gUkVBRF9TWVNSRUcoUFJMQVJfRUwyXyhudW0pKTsgICAg
ICAgICAgXA0KPiArICAgICAgICBicmVhazsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwNCj4gKyAgICB9DQo+ICsNCj4gKy8qDQo+ICsgKiBBcm12OC1S
IHN1cHBvcnRzIGRpcmVjdCBhY2Nlc3MgYW5kIGluZGlyZWN0IGFjY2VzcyB0byB0aGUgTVBVIHJl
Z2lvbnMgdGhyb3VnaA0KPiArICogcmVnaXN0ZXJzOg0KPiArICogIC0gaW5kaXJlY3QgYWNjZXNz
IGludm9sdmVzIGNoYW5naW5nIHRoZSBNUFUgcmVnaW9uIHNlbGVjdG9yLCBpc3N1aW5nIGFuIGlz
Yg0KPiArICogICAgYmFycmllciBhbmQgYWNjZXNzaW5nIHRoZSBzZWxlY3RlZCByZWdpb24gdGhy
b3VnaCBzcGVjaWZpYyByZWdpc3RlcnMNCj4gKyAqICAtIGRpcmVjdCBhY2Nlc3MgaW52b2x2ZXMg
YWNjZXNzaW5nIHNwZWNpZmljIHJlZ2lzdGVycyB0aGF0IHBvaW50IHRvDQo+ICsgKiAgICBzcGVj
aWZpYyBNUFUgcmVnaW9ucywgd2l0aG91dCBjaGFuZ2luZyB0aGUgc2VsZWN0b3IsIGF2b2lkaW5n
IHRoZSB1c2Ugb2YNCj4gKyAqICAgIGEgYmFycmllci4NCj4gKyAqIEZvciBBcm02NCB0aGUgUFJ7
QixMfUFSX0VMeCAoZm9yIG49MCkgYW5kIFBSe0IsTH1BUjxuPl9FTHggKGZvciBuPTEuLjE1KSBh
cmUNCj4gKyAqIHVzZWQgZm9yIHRoZSBkaXJlY3QgYWNjZXNzIHRvIHRoZSByZWdpb25zIHNlbGVj
dGVkIGJ5DQo+ICsgKiBQUlNFTFJfRUwyLlJFR0lPTjw3OjQ+Om4sIHNvIDE2IHJlZ2lvbnMgY2Fu
IGJlIGRpcmVjdGx5IGFjY2Vzc2VkIHdoZW4gdGhlDQo+ICsgKiBzZWxlY3RvciBpcyBhIG11bHRp
cGxlIG9mIDE2LCBnaXZpbmcgYWNjZXNzIHRvIGFsbCB0aGUgc3VwcG9ydGVkIG1lbW9yeQ0KPiAr
ICogcmVnaW9ucy4NCj4gKyAqLw0KPiArc3RhdGljIHZvaWQgcHJlcGFyZV9zZWxlY3Rvcih1aW50
OF90ICpzZWwpDQo+ICt7DQo+ICsgICAgdWludDhfdCBjdXJfc2VsID0gKnNlbDsNCj4gKw0KPiAr
ICAgIC8qDQo+ICsgICAgICoge3JlYWQsd3JpdGV9X3Byb3RlY3Rpb25fcmVnaW9uIHdvcmtzIHVz
aW5nIHRoZSBkaXJlY3QgYWNjZXNzIHRvIHRoZSAwLi4xNQ0KPiArICAgICAqIHJlZ2lvbnMsIHNv
IGluIG9yZGVyIHRvIHNhdmUgdGhlIGlzYigpIG92ZXJoZWFkLCBjaGFuZ2UgdGhlIFBSU0VMUl9F
TDINCj4gKyAgICAgKiBvbmx5IHdoZW4gbmVlZGVkLCBzbyB3aGVuIHRoZSB1cHBlciA0IGJpdHMg
b2YgdGhlIHNlbGVjdG9yIHdpbGwgY2hhbmdlLg0KPiArICAgICAqLw0KPiArICAgIGN1cl9zZWwg
Jj0gMHhGMFU7DQo+ICsgICAgaWYgKCBSRUFEX1NZU1JFRyhQUlNFTFJfRUwyKSAhPSBjdXJfc2Vs
ICkNCj4gKyAgICB7DQo+ICsgICAgICAgIFdSSVRFX1NZU1JFRyhjdXJfc2VsLCBQUlNFTFJfRUwy
KTsNCj4gKyAgICAgICAgaXNiKCk7DQo+ICsgICAgfQ0KPiArICAgICpzZWwgPSAqc2VsICYgMHhG
VTsNCg0KVGhpcyBvbmUgaXMgZGlmZmVyZW50IGluIHRoZSBvcmlnaW5hbCBmaWxlICgqc2VsICY9
IDB4RlU7KQ0KDQpUaGUgcmVzdCBsb29rcyBnb29kIHRvIG1lIQ0KV2l0aCB0aGUgYWJvdmUgZml4
ZWQ6DQoNClJldmlld2VkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+
DQoNCkNoZWVycywNCkx1Y2ENCg0K

