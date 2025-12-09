Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28838CAFFCB
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 13:58:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181637.1504667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSxI1-0005h0-FK; Tue, 09 Dec 2025 12:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181637.1504667; Tue, 09 Dec 2025 12:58:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSxI1-0005dE-Au; Tue, 09 Dec 2025 12:58:01 +0000
Received: by outflank-mailman (input) for mailman id 1181637;
 Tue, 09 Dec 2025 12:58:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2qC9=6P=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1vSxI0-0005d8-3t
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 12:58:00 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af31f551-d4fe-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 13:57:57 +0100 (CET)
Received: from AS8PR03MB8322.eurprd03.prod.outlook.com (2603:10a6:20b:509::16)
 by GV2PR03MB9377.eurprd03.prod.outlook.com (2603:10a6:150:e0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 12:57:55 +0000
Received: from AS8PR03MB8322.eurprd03.prod.outlook.com
 ([fe80::e577:995:fb9d:38fb]) by AS8PR03MB8322.eurprd03.prod.outlook.com
 ([fe80::e577:995:fb9d:38fb%5]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 12:57:55 +0000
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
X-Inumbo-ID: af31f551-d4fe-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtxsKG1QpZ07Pac5XvlAj7pyzoz0akMQF6ymunGSq7+SH6kyxRgKEjt/mQhmWQIGwWJbvkujndg46Wtx6iFNHaA/LTRL2XuPjOEhZB+wi0Lh8AbJ3ivoU9vOvHB2iuz3CQbAQAgtBCtcrb32ZQnbeDJOKhDv51o4FXxAlLjdb8eEgGbIcODiqSMBWxqvMW+iMlbgo9lbTxCm1WKGZ7knY1EKiYU0myoGsaL1ZyU/gD6dXVn8PlMd1L1w+7iRAgefBNhs8eeIGQCJGCgwPFYkMtexzRE62SWIyeRgFf5/UFXK3J5jC50TZr4qvLUHqhY3pDbljG+72xbidaHKsMUdmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rnu1EVaf75BVue/HxCCuOvScGtBK4r3193HsbvfeH8Q=;
 b=nAeOnS3cWyp0fWLO4oXwMu/sraG4fAwUByyrPn+LBfC0ft8f/JuuJDeouGbnHpeNjX1n5qD3S+P61QZIdfKVfU2dObuLeozOJqIkS02a0bgvAGVekW0WDh/hUGiJSkmGB6LAS5tSeMjg3GOHuj/E50mmh7FYrZcP1SKzkSScoXpU4nlNQhzTo/zhJAzcFRnNVXs/Gru/ENXCbs6GVyP/+wWZnTEdLRrMN8U/QRVuJI8DbC17f2D42rgSElGXu7tej8lT31ZCnksnyGlJ1i7K7XPx9y3QDwzmk3EVc6jbNCdb+yaCMwVa11lqBXeo+ohkzC3r/oYS4xmxZ1arl3+WAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rnu1EVaf75BVue/HxCCuOvScGtBK4r3193HsbvfeH8Q=;
 b=d6e/qrMmjvmSAL+WBMWaPzBl9CRzqi3SZSuyOug8HvppiorgbXcqpsuQOu7JTH4TA2sIZx5Dlq8FNKnxQe2lJVLsHb5x6fJYChTO9ixCYK1znm6U3jENShWJfUdyJ74M3kphMsLx/OUO5xkrvk0r34yufVD1gQSMmyIY2zl6odAo1JbHWwKE5FQ1HuRpp+R76zaqaUPS9jW0Nd38sG9xkzzSjZS0kfL6iOVDRm4MQigAlrRdkexyNPHVgPPTQlNtaAREln+I1HeC92F88ikQ83dB6MWUvjnqpGWOCRzWzXHd4kZ2CHueEIAzQZnvt3kOKuQtdqNfiVK4T9qXOF6qiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <f707c476-4ae3-418c-b4b7-f5e780b36628@epam.com>
Date: Tue, 9 Dec 2025 13:57:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] domctl: Provide appropriate error code when VM events
 are not supported
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1764961645.git.milan_djokic@epam.com>
 <99f899addf349543eaaaa328596dd9bf90004214.1764961645.git.milan_djokic@epam.com>
 <b492bd01-c32d-4cc7-bb6c-4f3555735be5@suse.com>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <b492bd01-c32d-4cc7-bb6c-4f3555735be5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::15) To AS8PR03MB8322.eurprd03.prod.outlook.com
 (2603:10a6:20b:509::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB8322:EE_|GV2PR03MB9377:EE_
X-MS-Office365-Filtering-Correlation-Id: f73bd08e-b6a4-4aa4-2a69-08de3722921b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SnBYcjRFQzRrdlBzYjc3eFl3SkVYMDV3eTNCUElZWDhMRGh6Z21KTEp4Z3pM?=
 =?utf-8?B?N1ZGOWtVVTVya1dFcUhmbElJU0ZzSzlsQUloOS9BN29yMFZDc0l6SkppZmdr?=
 =?utf-8?B?NDZyUDFLUjNROEVTNzZEemNMb3RHMHYwRUlsOFl1U2thTmtBRDdHV3BRVjMw?=
 =?utf-8?B?ZFhTWmlnc2krZlhuUTVUek4zaUNienYzYkZkUHliNHNSTnRUT08wdFI2WThX?=
 =?utf-8?B?QnR1SDZ0b1M3S3JpMjZxb09yN041N0w1am9sTWVKQ0t6dUdodlF6R05ra1NN?=
 =?utf-8?B?Z2paTUp4ZjFETEREcDdqaG9FZWk3V1RwUUlFVjM1ZDA3eWU4SlEvWHFQKy9B?=
 =?utf-8?B?c2RpM0F4RHVjcTM1eEJZWHd1NW5PeGRicHF6NGY3UVU4SnNVKzFnUExtNVUv?=
 =?utf-8?B?VE03YVRraTFzcEJXaFFMRlIrN0dtOXFDbURoWGdaK0lhdWxqalNnNXJ0UUpO?=
 =?utf-8?B?WXBqK01sN0xueUllVlpjWGhRZE1OMlg2WjZpaUFRbXdtaExseW1raXBrVHVv?=
 =?utf-8?B?ZVVGMFhzcFptREUzWXdyVFJNYS9PTVpPRU00ZHF5L250bllieTRjSDUxaDF4?=
 =?utf-8?B?TnVGM01nd1ZDNEhFNHRaUWExdlpIN0txU0YwSUxBT0FLb3gxaFlsdm5OWVJZ?=
 =?utf-8?B?US9iQUNjWXl3UFJYM0NHcW55S2xsTEk0Yi9Ya2NUaGg4dHNTamYwR2c5YWk4?=
 =?utf-8?B?QS9yV2d4UURHakF2UjhsUEttZUFuNmgrYWs0S252dnVhNnRWeEt1bFJvSHhB?=
 =?utf-8?B?SWN4enZIUkh3UXY2YlExRzJRZFdnMGhlVUhQamR0ZzJLYS83a2JzLzVNOTBG?=
 =?utf-8?B?Ykh0emZmRnN2aUlWWE5yM3ViRXBBMk5VSE4xNVpPWjRSblJZaFpuOUxsMVhm?=
 =?utf-8?B?a2NBWE1aOGg3UDJVWW45MGNOQ255M2JzdFNNR1NmOHR2KzEySUxPdnlBT2F5?=
 =?utf-8?B?Y0tndjdTbUR2L2lQSWgwYm5SSC9lQ3FNTDNJTGVUN29rYWt5MUh3VDlYMG9i?=
 =?utf-8?B?RGtkTEQ1WG5MYjVCbnk1WWdZR1lxazNUZ2F2WEVqM2FtbjJjdjJ1eE1YcEN4?=
 =?utf-8?B?UjBqeUdiTUtYNnZVMTdPSHIzSHovUHBNL1EwY0loRnhSWjVMOHBRK0JqUzFl?=
 =?utf-8?B?cVZYd3VRMGpmTXVyMHV1WFdaMUV0Sm9UQzRxNjJYSFp3aW5lZEdBOFQyWVpC?=
 =?utf-8?B?UlIrb0ErclBoRzZTaENTaThSeTNUanN3Z2NIa3owdTFiTzFNRzRIL0szYUdN?=
 =?utf-8?B?NzNvYzB5d05YVS9iTUdTUU9TUXh6bjNIWmRUOEg2RmhsM3orcTlKbFpYQm92?=
 =?utf-8?B?SGhYZHlScjFSTTJFYnhFNmoydjJLUmpLcllTeURBemE5R0ZvamZNc2MyaHJV?=
 =?utf-8?B?QnBlaUtucVU2UTRmd3VZOEJGVnh1NHRCb0dqYUtJTmlKTDNwaTBjdE5EQmJ6?=
 =?utf-8?B?VzcyUVhia2hOR3JQRmZWMWg4QnRCNTUxblRlWGtJdG4zb3h2cldZZ1hvZmFL?=
 =?utf-8?B?RjZKUkhCMzkvVkdCdDRPNXc1dm5ZOEdybkdoaGxjaVRXZlNuMFJydVUzK0JO?=
 =?utf-8?B?TlJHdHZnM0srL3lPeVp4M05keCt3dlkwWE5lQ1dHeHhCYmxmeUczRHJFcmNi?=
 =?utf-8?B?eDlnaS9wNnVtK1NmbWlYd2Q3blJPTW8xZ2xaS3kyK1RYbWpRSnI2WVNYUC85?=
 =?utf-8?B?UkxjZDlOVGRrRVBaM3ord0FvRHBZYzlMYitCQUJkREMwQXlpd21VUTR5dnJH?=
 =?utf-8?B?RXFHeG8zNUcraU8wazEvS1RLOW5ydmdTSkQzWlpndlU2L3hyMU81Ulc5eWJq?=
 =?utf-8?B?aWNHL2FUMjJuNmt3TlJpRWNBL0NxMDNkVjRPWGVrV2JpVzh3bGdwV1JwZzZQ?=
 =?utf-8?B?ZVh2TlYzTmpaUGpRSWIvcjltbmdjV09lMEtKLzBJUUl0LzZVVUpiS0Q4a3lZ?=
 =?utf-8?Q?lyE/34UvQmhq4qvplMdl5ZIl+ek8MPRZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB8322.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cytXVkNTdlhYTHFJUmp2bmF1WlA1YlVWQU00aVBmNklmZCtNandxdlhVMDl0?=
 =?utf-8?B?UUZXTFJMZmc3WlZnUG4vd25EaG1LbTdZVjRhTC9WNGlRUGNRbGQ5ZG9WSVdr?=
 =?utf-8?B?YnBiS0lJa3kyMUtUOWt5S0RqR0l0dXZtSzFFSkpRMWZ4R0RvZjE1MnBTb3Jh?=
 =?utf-8?B?MEluSGJSQTFvM3hJQjlKSHBkdndmc1F5a0c4SDJQclIwRGw4bFhkUnRtYk92?=
 =?utf-8?B?SStpODRyT1E0Z3BSU2x5MlRFRFJxa1BrVG5zNUNnOGZ0T0tUa1drNytQWVd6?=
 =?utf-8?B?Vkt1aEc1VTJFSExLdzgrTDVtM00ya013QkZhTUdFdEdxZWRSWmowYUJ1aGQ0?=
 =?utf-8?B?VHN5a1A1ZjFxTlczTThXOUZtNXNuZzROb3Qrb3BMb1YzL3lDeVNBVGU4aitK?=
 =?utf-8?B?aDZyeUN3LytSWUFLWkpJMVRmczltVkV4S0xENCthaEhGUHg1SVg3dW9HaG1L?=
 =?utf-8?B?ZGFySXplVlNtL0NQekpEWS9GNk1EUnVtbHNqL3lnK2twVkc2YnVueFpEUEk2?=
 =?utf-8?B?WEMrOXRjcStEYlRPRlJsdkpOcEh6TlZjTnIrZkZIdjcycVRrWVNqdjN5b2NW?=
 =?utf-8?B?WHc2bm1kV3dFdDh2UG1hUlQ0a0tBRFlIUElodXhFNnAwYmJ4ZUtTWEo5aEow?=
 =?utf-8?B?SGRwam8vN202NTBjVzcvSHo5cS9sS1Myd3BjSnE0eVNOVjBmbWlUNTEwM2tF?=
 =?utf-8?B?NVNBTWhHYVByK2hraUZ5VGdTdnl2ZVZoN09FSFkyNmVhZjNvSmROZFIvUzRj?=
 =?utf-8?B?eHQwU0w5MU5LWU93WE55b1pBa0p1bVdBTml0OWJoVkJRVEJwMXFaT0t5Mmlv?=
 =?utf-8?B?R2puUVR2WWk1dEpId0hBUGZUbWV2Vm9GMTR6QkZZampGNEVrdy9QM3JYc0RT?=
 =?utf-8?B?cU5CSjFuaWF2Wk56M1E0ZzJ3dFVmZ2ZibXFYU2NtR2R2aWVmM3c2TVdOS09u?=
 =?utf-8?B?dDI5Y1hKUDlJaDF2SXkvdkRibUozekJUWWNNb3ZLRkF3SlFIR1B2U001YjVo?=
 =?utf-8?B?QXRqOHJLZVBEUHRJSGN3V1JCWENHeUpsSXVOa1A1bWxxdSt0NkR2Y2xsYnNO?=
 =?utf-8?B?V1dQcnhUMVlFMjFRTS9sVURYOVZTNzZYaEZVYStUMGVmQjhoU1dKd3hQY01t?=
 =?utf-8?B?aGw4c242Q0d3NmV4QXlQWkprb3N0cEJ0M2VkOHRiNlQySXZaZDV6RG9KZ3hT?=
 =?utf-8?B?TmRxZVE2ZlB6TUQvOEVrMjBNLytVelNib01rRUwxVFRSZk5DWWJDd2QrRkxk?=
 =?utf-8?B?OUs4TlZFS2IyUG04eVJQQVFvQ01rcmpQQUpTNmoyaEkyRjhoUklJRTNDYUtJ?=
 =?utf-8?B?MHlCd1l2U01ESnNZbGRGUEpwazNsZW9UaFFic0p6TXZTK2lGcHZaMkhtelpQ?=
 =?utf-8?B?K0YrdE5Tbm9ackllMXB5aVhtWDVUS1ZScHU2WTR4NCt6bUVCN1VUbjd5eXBW?=
 =?utf-8?B?NHhCbERwRTFlMXc0eVM3T3R4cnZteDk5a0RpaG5RNTZWUjc1czZhaHgxYm9H?=
 =?utf-8?B?ZWlrNnZ0Rlh5Qllsd01Rdy91eitqbHRzcE1aYTQyN1BxVUxreGpwbko5cEdn?=
 =?utf-8?B?TWdXRDUvSkJZWTBvejN5ck1QMDhwR1JaNHpWOUh3bFNLeSt0bTNISk4wUUFR?=
 =?utf-8?B?dHJPQXk4VlQ4RzJvYk05cFZJNjdwdGY5S09HM0k4V21rc2ZwY2NVd3AwejVN?=
 =?utf-8?B?YU4wTm1TMHlpdm9NWFV5OW8yUy90bFYyU1VUVXhaZ3RFZ056ZWFkZnpUdXJW?=
 =?utf-8?B?SEdZZXluTUtqQlczbEVKclNDUWNzK05qWlgvd2ZFM1ZzR3VyRTA1VXZEeUY0?=
 =?utf-8?B?RDU0enNhbWREaEdZdmVJSWNubFFRRjdBdUt1L21jVkdkSVk3Ty90UG1ldlo1?=
 =?utf-8?B?Z3lWWGJiSkVaaFliZFpRZ1p6bzNRQWkwb1BSbWZmWDVNRmZSbnlhbUt2UE9V?=
 =?utf-8?B?U2IySkk3OUdWSEI5cFpFMWovdjVoeTNkQlVOb2wvclE5NGsycGxWWEh6SzVt?=
 =?utf-8?B?SGpTMENxZVNuRGQ3dExFTllOQUNDcURqSnl4bHY4eTVTMHg3Z0gzZ3FrZEwy?=
 =?utf-8?B?bk45Y0x2anRUaXdWVnp0NHlkOVdjOExkVEl1YXhJU0hsK3dxVzVUSDVZUVU4?=
 =?utf-8?Q?+2QfX1hyItGYJJzp1ld5YL00J?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f73bd08e-b6a4-4aa4-2a69-08de3722921b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB8322.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 12:57:55.4157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fqeINo5WrH2zStibhlmaJyPPs2D9q+SVVX3ky6tcnQ1gHo6xbeb4/wVRQk9mktYZOX9hd+AYsloWbAN8XXo7xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB9377

On 12/8/25 14:24, Jan Beulich wrote:
> On 05.12.2025 21:36, Milan Djokic wrote:
>> Return -EOPNOTSUPP when XEN_DOMCTL_set_access_required command is invoked
>> while VM events and monitoring support is disabled.
> 
> This is more bounded than the pretty wide subject. Taking the subject and
> considering there are other VM_EVENT related domctl-s, is this one really
> the only one in need of adjustment?
> 

I think that others, like monitor_op and event_op, already return 
-EOPNOTSUPP when CONFIG_VM_EVENT is disabled. I will check this, it 
could be that I missed some commands related to this context.

>> --- a/xen/common/domctl.c
>> +++ b/xen/common/domctl.c
>> @@ -787,19 +787,22 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>               copyback = true;
>>           break;
>>   
>> -#ifdef CONFIG_VM_EVENT
>>       case XEN_DOMCTL_set_access_required:
>> -        if ( unlikely(current->domain == d) ) /* no domain_pause() */
>> -            ret = -EPERM;
>> +        if ( !IS_ENABLED(CONFIG_VM_EVENT) )
>> +            ret = -EOPNOTSUPP;
>>           else
> 
> If you convert this to
> 
>          else if ( unlikely(current->domain == d) ) /* no domain_pause() */
> 
> then ...
> 
>>           {
>> -            domain_pause(d);
>> -            arch_p2m_set_access_required(d,
>> -                op->u.access_required.access_required);
>> -            domain_unpause(d);
>> +            if ( unlikely(current->domain == d) ) /* no domain_pause() */
>> +                ret = -EPERM;
>> +            else
>> +            {
>> +                domain_pause(d);
>> +                arch_p2m_set_access_required(d,
>> +                    op->u.access_required.access_required);
>> +                domain_unpause(d);
>> +            }
> 
> ... the need for re-indenting disappears, and we get away with less churn.
> 

I’ll do that, thanks.

BR,
Milan


