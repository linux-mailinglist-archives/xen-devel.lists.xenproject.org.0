Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5205B07280
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 12:05:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045040.1415112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubz0G-00015x-Hs; Wed, 16 Jul 2025 10:04:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045040.1415112; Wed, 16 Jul 2025 10:04:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubz0G-000138-Eq; Wed, 16 Jul 2025 10:04:44 +0000
Received: by outflank-mailman (input) for mailman id 1045040;
 Wed, 16 Jul 2025 10:04:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8M8J=Z5=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ubz0D-00012u-Vt
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 10:04:42 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 495fd130-622c-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 12:04:40 +0200 (CEST)
Received: from AS8PR04CA0102.eurprd04.prod.outlook.com (2603:10a6:20b:31e::17)
 by GV1PR08MB10456.eurprd08.prod.outlook.com (2603:10a6:150:16d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Wed, 16 Jul
 2025 10:04:37 +0000
Received: from AMS0EPF000001B3.eurprd05.prod.outlook.com
 (2603:10a6:20b:31e:cafe::e0) by AS8PR04CA0102.outlook.office365.com
 (2603:10a6:20b:31e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Wed,
 16 Jul 2025 10:04:37 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B3.mail.protection.outlook.com (10.167.16.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.21
 via Frontend Transport; Wed, 16 Jul 2025 10:04:36 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by GV1PR08MB8643.eurprd08.prod.outlook.com (2603:10a6:150:84::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Wed, 16 Jul
 2025 10:04:03 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc%3]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 10:04:02 +0000
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
X-Inumbo-ID: 495fd130-622c-11f0-a319-13f23c93f187
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=P1F4MTI+2PBjGE/xCYb31VLWqOEYqHuWGZHAWlGMMO59f4utnlz8qhBDZP/5xF76S+xDcnz91uzkwb5FnwapX8iuyQBpG+tN4bN1C3RCG1e7sbGOWk5mljRtmS5GYw/bP1stLxtFh7qhurZj4JKAtQlQQmhITAFZIEoMligEi9ncFfcVUgyTkIpFNMvITFoDaEou3eNuh0nIZ5ZCKLbtErmMLPI96jQ0e2Rx9aX6Zb2eN08L6kchsL7/HpndYkOdJJZhd7DUUavFptN9fksPSMy0xOlNMGv3CBbaKf2z643b6SYIZLrUpXmbzfWfYece7Hy/JLJZtdyPXUmrmgRfLw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zj/ajiLYgjvTA5SyKGr14FjhbY6zAyC+cF0wRnADeBc=;
 b=WarkHJPLDgNFvk3k1sqkM/SNPHWWAaVVLnGHyYU8533WMKGnNVtt4aWKGT3Gbo/YWybSWloYnxJCunVlAPUMF2Agji09Vhsr3Dc+lb1qP0WX2kSJxri+QNeJVQd9q4R66gdVe34dW+Sa1iMHykghLcll9UkcJ6jsoVUQ3fwDXBYHLZXd04Fz+H6eQIXDMgSfce0EapfLR2WPyWhq0l1kPb7uP2pm3/XIr4PG0SLblv6AyQGQ/cXHHnFBnaD5MfBp+0FhnE3tpx69R1xjrO5xBl/kF6HhzFa60HCgi+36F5u0vkL0GiFTis8pNNCANowZia7Vh1qZdCUSlsV2CitcbA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zj/ajiLYgjvTA5SyKGr14FjhbY6zAyC+cF0wRnADeBc=;
 b=BeYK4DL/XQZkreywIgSk26zu9tGZrjiI/tGd7tT13Pf5G7Ac4gDYiDgsWUsLGSE4wiqdCzCD7jXcMo4qz8z6Tz86ugG8Gf1vuOV0kKi4vCaKkNE56Tp8WUCRK3HI33XbXs5ghG+eQoXiHAGWxVzVZDMgYyUvzNWPPjc5fYrUrRg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZNnfCQYZIhKamQW6MySABorfLPqumM4RvnIzhBTg68X04a/oTbLCS36KCsUq/8OKDBgRKU4gjfMNQqsNMT+ly14uUNSV5bndDcklFnzCtebwN+35aYK4HG4YLZCRkN+spreVYlDjDrlvKTcbaNKgM4uuzEcMG7HX2AM2bJfOn8jboFIhdvq1Gs+eNvV98N7rzSd1mpH0yle83H8YlcxqLkR5fIV9a2FW72Wjal4Bdi/uA72+Fe0ktV/xvufCe23Ul3W93TOa2m683SrezHXE3tIuIg68kfnik2has6trQJ1d2iFnK8K2YePTHcovzFgqPFvyqLLm/Dolz36zIi/Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zj/ajiLYgjvTA5SyKGr14FjhbY6zAyC+cF0wRnADeBc=;
 b=CDNvIbS6Hu+QKsvlRdcANNnY+RqtaEwZqwTnumoEUvhNY1GbSz6h0zwnym1TxthRxAZjpH3Z77KD8syAhqEcTBadftDwDkpOtzBoQvgk2s0gHlYLCdiggt5lCkZOioAx6PgRgeEf2qCRYk05EjayedsLgVS7uZYb6vWYN/w53PuZhrpSUQoKHVxPNvLl1Z2UiB4rdtXW9h3NWe2+FcONlH7YjpK7kFrS+M0OyjzKqs1gJEdUwz8bRhC0WXUhrWdqMD+M0wG2+ip5a2NXndwWZS9/JnjzNHk6neNh98ZAhNZSd8KBUFsXr4YHgYd8MNRt1oYkYJlHkYdZwSI/SXkvOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zj/ajiLYgjvTA5SyKGr14FjhbY6zAyC+cF0wRnADeBc=;
 b=BeYK4DL/XQZkreywIgSk26zu9tGZrjiI/tGd7tT13Pf5G7Ac4gDYiDgsWUsLGSE4wiqdCzCD7jXcMo4qz8z6Tz86ugG8Gf1vuOV0kKi4vCaKkNE56Tp8WUCRK3HI33XbXs5ghG+eQoXiHAGWxVzVZDMgYyUvzNWPPjc5fYrUrRg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>
Subject: Re: [ImageBuilder][PATCH] Fix DOM0_CMD options for early console
Thread-Topic: [ImageBuilder][PATCH] Fix DOM0_CMD options for early console
Thread-Index: AQHb9jPQpyk3GIaLd0CZWTgDvVj/1rQ0hV0A
Date: Wed, 16 Jul 2025 10:04:02 +0000
Message-ID: <6248C012-DDC1-4E70-B697-CF04CD22B19C@arm.com>
References: <20250716092613.13954-1-michal.orzel@amd.com>
In-Reply-To: <20250716092613.13954-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|GV1PR08MB8643:EE_|AMS0EPF000001B3:EE_|GV1PR08MB10456:EE_
X-MS-Office365-Filtering-Correlation-Id: d08fbe50-6c81-43fd-222b-08ddc4502b84
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?YXJ2S280OXIxRGw5dWkxNUEra2g3RXdheFh0eXlCZEpuQ2MzOEhjbzBrMzJE?=
 =?utf-8?B?SlI1MDF1YkV1dGYzNDl3QlNIb1RSVzN5NCsrL2QvSTRPWXY4SmN0Mnl3YmFM?=
 =?utf-8?B?VXl3Q2wreFhmejJKc2M1SFJOcHdkWXE0QkZyeWorc3g1QlRVQmpCejFIR0JV?=
 =?utf-8?B?cnNWT0JBRnliYnhwblhzd1VSYmpOYS9vQ0hnc3FzRTF0eXViT3hQeGY4Rk54?=
 =?utf-8?B?UXZEcUJ6Y1BqZ1V6RkhGY0hzY1lPMGQwT0dQcVJtSktOMG9VbHNUbG1UYTJL?=
 =?utf-8?B?WWJ6YTRWUkdZejZLdHdGRmR3UHVMeExwVm9ZNGNxWXN2TmJOVGVtaVltcnNv?=
 =?utf-8?B?QmpORS9ZWmQ1SGNaZXRwVUo0U3A5bDkwVWo4SDJJMzI3clAzTVRGZnFJUFhC?=
 =?utf-8?B?VEdWYUJTZm1GZjdlU2g4aEpMenNvQWNFcHI1RUpqeU10b1pVNlhJQUI5Q1oy?=
 =?utf-8?B?S0tJVHhXOWhPTUtlZVhueXpGNTFONnlReUs0alVkNnl3NXkyYm1aTWFYS05z?=
 =?utf-8?B?QVBFa3FKVGdub0NYRnZteEZhZFoyMU1seWZMK001aU42VWNIWXBMUFNOYU9q?=
 =?utf-8?B?VDFsNWRTUVJmSUsyeDNVSW51Z0hKYSt6aG9MWlhpWVZwNzdEcU1IVCtYUG9G?=
 =?utf-8?B?N1lUVDc0T1c5akt6alFWenJMald2eEw4Z2F4VDJTaXlFZEZSRTJaSUNzYmxL?=
 =?utf-8?B?blRRMXA4eCtERjZxNjZJQkRNRE94SlNXcy8waXpOQlJZOWEyQUphZmFFSVdF?=
 =?utf-8?B?U1d4VXA5UTg1Q0JRd3h5MFFRMlorckVWTHVhNzJmMm1zL3Y1RWo4RlFaUDVW?=
 =?utf-8?B?K2lLeXQ4dUhmc1Q0UGoydEpkQzY4ajg0Mm5ZdnRGNklYckVqaEhEbHZ6bGR1?=
 =?utf-8?B?bkNKVFNpYlFNK1RQMURERUR4QzFaNm5BNVh2UGc0MWpIcWkzWVVlQWJvRUov?=
 =?utf-8?B?ZEhOZ1Z3MTV6SGxVSEV4OGdJRnRJdUdCalJUdGZpUW1kREtXTjdHMFM0T21q?=
 =?utf-8?B?NW4xcVpzTUI5N2JiaHVqMzV5VHFsc20vbGU1blhUNUJ5RnFvVUNON21LT0Y3?=
 =?utf-8?B?TTJrRmJRRVhDb092NEgrY2oxYlg3eXlmZTFyKzNrQ2NmeEdvRmx3K2VEcHph?=
 =?utf-8?B?dHoybGtkRGI2eEdOcU82ZmZXbENlT2JydFd2a1lQMEVTTTFya2dmSmhnRnpF?=
 =?utf-8?B?ME9tdjJCY3ZqTERBaU0wYVR5VGdBT2VPVlhmT3hRS1RlaktJMEJMcER2bXc2?=
 =?utf-8?B?RFRSN0RyZHk2WWZpNWVnQUtaWU9rZEVhS3VsU09rYXU2cmoyRHZGNnV4Y3ZC?=
 =?utf-8?B?akQ2dDU2ZmQzaVpiNkJyWmlJQUJYRGhhZUdGSzZmUUpJN1dIdEJJOFZYaEtk?=
 =?utf-8?B?ditFcnVEQlpUZ3lGb0kxeTBJaDFlcHEyOEFtejlvZ2kvaFU3aTlhMngycHNx?=
 =?utf-8?B?L3Z5SENrL1czNUNTTkdsakR2NVdMTlN2YXNkMlJYRngzV3Blb3JOZzFZKzVx?=
 =?utf-8?B?K20wekErZXloNmx5bG81RDBCU04xRHRGUS9wMWpTT2E1d3RpdXJNMmZDQnBt?=
 =?utf-8?B?VFIyQS9ESnIrR2JnVDFiRFNoQVMwOUVGYVI3bTBac1VXbDBvclExV1BIRW81?=
 =?utf-8?B?QnozdlNuUWV1c2RaS0djakhlWWdkdTV6dTZmc2J4WWVZV1VyZmw1WmRGRWtS?=
 =?utf-8?B?V2dld0ZXVmRBWHhVd25LUkQwU2h0eWZ1bWFad0lkbTVsVEVtaUFzL0N4UUpt?=
 =?utf-8?B?Ky85UmFtL2FYNy9DRDVtaWptdTlQWmI4dWQxTy9JMnJKMkFteVRLWGRKbnRm?=
 =?utf-8?B?bVZiY2dxOHl3WXlpNkU5VlJMb3BqNWQ3dGpveklYZDZuSjc3NlkwVmFzaHlJ?=
 =?utf-8?B?b0xSMTBKcjRyMWMrcDFYOERPeVlQb2FoWGhmdUNQYXNpSmE5T0xob1hkVjMy?=
 =?utf-8?Q?WIbPcNOfCoI=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA06C60E0078C243BB312A70AC43D36D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8643
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B3.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bf18b32a-e0d7-4088-67a1-08ddc4501788
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700013|82310400026|376014|14060799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d1ZSUFlyZEdnc2xaa0VJMWRocWdrSCsxdGw3TnhWSjVwQ0x5akR3TlhSVUVF?=
 =?utf-8?B?MWtIbURkejViMmVIK0o5Smt0WFdCUHFZT2c5ZjQ5bjFOYllNMUZTZk9INGtU?=
 =?utf-8?B?czVUSU83QWc3d2lhK0tjNklxd2lvTElQdXI4WVpNS2k0OXZSbkRJQ3RMMlZq?=
 =?utf-8?B?cnYxbWl2Q0pNeklYTllnZWF3aFVZOFUrS0hQOG9EYmx2RFBGank0QlhXaTdu?=
 =?utf-8?B?NG5rYkdMV01neW9TWXdva2c3L2tBd3Y5cjJsamFHOERjeS9UVk04eWpOcUFv?=
 =?utf-8?B?MXVGOE9HU2hCME03NmlDWndmUUdRdGp2YTdueXYrZmNoK1JSTkxhTEpNOG9w?=
 =?utf-8?B?eG9HK3B6MzV5MHZzOFAzN3JGTThoODVPZ1BTTVluYkhWa3ByVUJ5b25VNFM3?=
 =?utf-8?B?NGI0NUpWRWVHKzdCd3FYS3Y4czBLdURXY1J1dGdmZUV1QlZJTlBqRlZ2SDhj?=
 =?utf-8?B?Wm1JVW5KNFdFK3NzY0JiemthVmZzMUl1bTU0KzZjcGQvTG0yUkhWOXdVVEFn?=
 =?utf-8?B?WVVWcFNBMXdwTENuczVNa1V4K3ZZU29EYzhoU1R5cUpLWHNYSlJhSG50Z1Iz?=
 =?utf-8?B?a2ZvdjZhMEFWRDZNV0x5S0ZvRnZiVGVraml1MG4rNUNiSTYrT1dabGNZNXZW?=
 =?utf-8?B?M25ZQWFsZEthMlV0Ujd3aDhJemV1b0MwR3hyQ21RdWYwdFhhcWpjc2plakhN?=
 =?utf-8?B?VlJhVkx3SDJtZElDcERQRDg5ZHRQdWs3ZWxxMXB0M2g3cDhnbDQzd1pjell2?=
 =?utf-8?B?UDdwa1R4ckhxRkJMY1JITWd2WGZ6OEZ0emVYT25vYlpqNEdsOGRUVEhscXFX?=
 =?utf-8?B?SVNSTDVIOWhFWHNBNk9PM0p2ellJbm9yNGdDTnBKbk9ib2E5N1BKd3dobzlF?=
 =?utf-8?B?b0hIU0x6U0NxVlMxUWJOUWkzVGlYdWlmTmxsOXU3K0NWU3V3YW42dlc2VWJC?=
 =?utf-8?B?bC9BZERXZzRhUk40eDkzVDB0dG9IOUFZOEhHRjBhYVVhUkVLLzE2Rlp2KzVr?=
 =?utf-8?B?QlErc1JGTUpnM2o1QjFIdGRlYXBLUE55bUpPc05mL0dwRHBWSGFoUUF0V2NG?=
 =?utf-8?B?RktmUlduYi83S0JLaTFBRjhYbXRmNS9BUlVGNjgwRmdJTFE2MzR6V1FuY0dZ?=
 =?utf-8?B?WkROV1hSUWpiR2Fsb2ExNnUvajdKSnh2SkRaVUpEME53ZVJTSnRScFZDTWlK?=
 =?utf-8?B?UjdMTCs0blJ5MDFNMGkrc29wZ2hIWUxIMkM5YnZId2oxUGZJeDI2VFVITzNE?=
 =?utf-8?B?a0tYYmFCQ29xU3ZvdEhRMElCMFRFeFhJUVRSVE9VNEF1L1pZWjQva3BHQkRP?=
 =?utf-8?B?VERhOCtVYTNGVkpyRmdkZkV5dHFHblZZT2VpWno4b3kyOHRLQ2w1aGJBREIv?=
 =?utf-8?B?aHFaWUZMazQ1Y3dzeVlyb2liWFZoUmtvdVFFUGRUTFA3Tm1ZQ0RpOHlLcU9y?=
 =?utf-8?B?a21Eb2ZiUFZLd1d5c2JDT1Jwc1VwWDFIa0o3Y0t6RjNCYWdwU1RNT3I2cnAx?=
 =?utf-8?B?c1grWWFidUVNcmEvSzkxaTRjWHpmektZWTU1T1VHdm42bXpFM0JpS0gvT0U1?=
 =?utf-8?B?NVk4WitFbDJwWEFYL0hxMWFzblhBRVNjOHArMVozTUZmQ3JBaGJYTXpQaHFX?=
 =?utf-8?B?YzFWU0xCdXJwNmtuZkN3M2VHc2VjMFRSR1lTMTM0WHNrNkN2WE1wWC9NSVho?=
 =?utf-8?B?TXd1OEdYc0VTSno1eE9xYkZYdW1TcCtRVVl2OU1CYUgxWkd1T3FvcDVkZE9V?=
 =?utf-8?B?dVRGTDUwZkdyQk1IMkpOd294ZVpYdUQxMzVvaDlwckd5dTFaR0tjMTBhNjlv?=
 =?utf-8?B?azVPLzZmT0hqdkhWTnhDb1VYSDRnQ29GeHBJK2RPV2RidmUvOE1mL1JyWlYr?=
 =?utf-8?B?NVI1MFlsOWgwRlJjSzNiNDZmMUtFOStvQlJiR0hQdzJFejM4TllQOXVOR1pH?=
 =?utf-8?B?Y0N1MjMxQW9uMWlvSWlXc2NTL2lTTXNwSll3dktvMk9TaGpkL3dlYWZzM0ZQ?=
 =?utf-8?B?TTBhK0syNEZnPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(82310400026)(376014)(14060799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 10:04:36.1934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d08fbe50-6c81-43fd-222b-08ddc4502b84
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10456

SGkgTWljaGFsLA0KDQo+IE9uIDE2IEp1bCAyMDI1LCBhdCAxMDoyNiwgTWljaGFsIE9yemVsIDxt
aWNoYWwub3J6ZWxAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiBGaXggaW5jb3JyZWN0IGVhcmx5Y29u
IG9wdGlvbiB0aGF0IHNob3VsZCBiZSB4ZW5ib290IGluc3RlYWQgb2YgeGVuLg0KPiBSZWZlcjoN
Cj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTUuNi9zb3VyY2UvZHJpdmVy
cy90dHkvaHZjL2h2Y194ZW4uYyNMNzcyDQo+IA0KPiBGaXggaW5jb3JyZWN0IGVhcmx5cHJpbnRr
IG9wdGlvbi4gT24gQXJtMzIgKEFybTY0IGRvZXMgbm90IGhhdmUNCj4gZWFybHlwcmludGspLCBp
dCBzaG91bGQgYmUganVzdCBlYXJseXByaW50ayB3aGljaCB3aWxsIGVuYWJsZSBjb21waWxlZA0K
PiBpbiAoaWYgYXQgYWxsKSBkZWJ1ZyBwcmludGsgY29kZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQo+IC0tLQ0KDQpJ4oCZbSBub3Qg
YW4gSW1hZ2VCdWlsZGVyIGV4cGVydCwgYnV0IHRoZSBjaGFuZ2UgbG9va3Mgc2Vuc2libGUgdG8g
bWU6DQoNClJldmlld2VkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+
DQoNCg0K

