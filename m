Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aP5FEiBKnGmODAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 13:37:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B191762C6
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 13:37:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239038.1540447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuVBH-0001I6-7Y; Mon, 23 Feb 2026 12:36:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239038.1540447; Mon, 23 Feb 2026 12:36:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuVBH-0001Ez-4P; Mon, 23 Feb 2026 12:36:55 +0000
Received: by outflank-mailman (input) for mailman id 1239038;
 Mon, 23 Feb 2026 12:36:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ndCc=A3=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vuVBG-0001Et-0x
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 12:36:54 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5320eaaf-10b4-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 13:36:51 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN6PR03MB7576.namprd03.prod.outlook.com (2603:10b6:208:4f6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Mon, 23 Feb
 2026 12:36:46 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 12:36:46 +0000
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
X-Inumbo-ID: 5320eaaf-10b4-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgIjWWto8NWQ6O1kgXCK0LYXSuLMapjJXndtiGonw0V36Sjb2hg+qISNnfjwWlPLbuYy2PtnO+TGvGI0mljQGGn8GHrRl66Tau5JyXOR7Zs9UBaEPMyUoQFbdsu9mIbIb76zkEfhtkrNRONP6wfqt6obP+V36E2vM/25cmpL+L+E3w/Ba7ITEYU0CiSUSMe8gkVX8Rou8GT+DI4arAX03ger2TH+GgJSwgwnpdo7Iuh1rsojZlLtUiHR2+wYbzD4OAVOjZ9RPXa3nfBrO9kIMaK7glYI7KtGU6k1QxNL0goRBLqSYAGYJDCuIvS2CQwyQNNiLqDW/NBWJEA9CdWcwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWl1g6bxDKUhmi/cHh9bF4UYfzsobhK2A761nNYdNho=;
 b=tOQYdReizg91IsQv1vTkrOalcYLNRy3v3+JJ66ftxHfHf64SOcyAW7w7LnCWh+hRUZTqzmsGgSlMpbquqoG6zp+cLc2VAmhRu91paTF4i4MPuaR6kLF0OtZX/KATulTBUNWr65Q+2liK0ZswBAgvmT/bf6zPOXvF2BWDVzRrZybpBMgC2RzZW9tPZX5MVe4WAfVtFJqJlVNj0IdyzP2HjCLZUqkh4VQjD+e7Ii+6Gelxji9qaBVOWB3+8Im4x8KMtYmRs2pydcU3nsNys1qC4EhIULatm5Lub8HhTUrYlU0+oyvC5rhZl0TKbYHTIu/r1RJDHSpzbnZp7hJiTqwBEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWl1g6bxDKUhmi/cHh9bF4UYfzsobhK2A761nNYdNho=;
 b=P3ealnI3sL/oYkDbVPWfLh4Qmrbv3vesvdD3tMaWG2SMq5rw475mogaZeeuLIqebse9iwy8lM3JJjMekR2okWMRiP/dFfKqqfhWh5A2RXEnAxpPKmUbZbhw23x0EJlniAenTVpxId0Lz7tdr/iaqU52u8VdMQE44DBf55l7cadI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e35a952f-0ade-4729-8f33-59daf151f131@citrix.com>
Date: Mon, 23 Feb 2026 12:36:42 +0000
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/MCE: restore CPU vendor reporting to the outside
 world
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <561865f9-cd0f-40c9-86b8-98a3ac070b65@suse.com>
Content-Language: en-GB
In-Reply-To: <561865f9-cd0f-40c9-86b8-98a3ac070b65@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0277.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN6PR03MB7576:EE_
X-MS-Office365-Filtering-Correlation-Id: 99996a96-b01a-4bd4-3f07-08de72d83503
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eHcxeVRDQWdMbTNpaHVuVi8xQ2JpRENwQStabWpuSzNnNmpjNDNPU2VFVDR0?=
 =?utf-8?B?R1JWODRpQVBsWU9KYkljNlJtbHIvaFJoVlEyMnFKSVRxd3FObE1LaHI5WXh4?=
 =?utf-8?B?ekpHMFRDOGNKVFIvYUdKVFo5ZFNva3JQekZnWjFaVVlESFJyMm84Zm15RGhw?=
 =?utf-8?B?NktOOEk3OW9pV3Z6eFMzSW1CVCtDWGdpa1p6a091YTFTZm9IRUtDR3g4MEdN?=
 =?utf-8?B?MDcrSVZTcXVDcXFSU1VFNHIvb3hNbFZSZHhDZk5LUVJmU3lFVjBYSi9vZFJk?=
 =?utf-8?B?WUZJbER6V0NKVG1Yd21lanRIbW9rQkZ2VXd6MEJ6QnQyRlF0cmo3RThrQ1Jx?=
 =?utf-8?B?U1FObFpKa2J0cytuMVNZVXhxWVhRK0Y0eUNMK1lLQmc1Z2NDSGpUcnBuTzcx?=
 =?utf-8?B?dXVORitFWG5NSlFEcWJ0UkdzVVFUOTVwRmVSV3VSV0YwVzBEV0l3MGdaMGlW?=
 =?utf-8?B?MzNmV3MvQkZiTHdsQjNSeU1LN1BMU0VzNlJJZGhzbkxFaXd1NzFONWI0SEw1?=
 =?utf-8?B?WHhZRnE4QU12NXo3S29jTjJSUFdSWWFkekE5bFdZSkxvY2xjUUxwVGVqR2l1?=
 =?utf-8?B?UENIRHpacnZ2LzMzbXFpOHVFV1BYL3VxazFLZWdkRzNqZGF6dVFDVmhtOW5y?=
 =?utf-8?B?anpiS0hPdjR4OGNyZ1ZzQ0ZVbmh0bkZXTmJRdUJJRmdoUmFvQ2ZXL1VwZzJV?=
 =?utf-8?B?YzBoajR5RFdQNFZvVmVqcHk4SlVKNGtPQVB6eUEwbGRsQmIrUkVYcEpnUDA3?=
 =?utf-8?B?anRuejdYRmo1K2ZJSUwxMEROK2xqWXowdjZ2WWx5YjZiTTZrS05Lc25tY3JR?=
 =?utf-8?B?R2FWZDVMcEhBTmZrWjNKMlNLOTBHd0ZaajdtSXBXc0twNEI0UkVVa3Y0a2Qz?=
 =?utf-8?B?NXMrZlVJSytZSkFIa0djUENJYW5UK0dmU3JvNWFoUG9hUDN1cldMS2hITGM1?=
 =?utf-8?B?UldGd1pwaVRHQjZ4Mm9xdW1BdGtMVXJMWVkvZWt0N0J0aGhkUm5OL3hBK2Ex?=
 =?utf-8?B?TFg0NVZjRm01YWRaZzNNL3pkYnRBMWZJVk1UTm1NR1JHcXV1QXo4MVlrTHlC?=
 =?utf-8?B?Ukp5eFQ3QnJja09BWkNITVFyc1VjMVVvd3BvbUVMYkJzbmRLbmYrZ2lhL1Zt?=
 =?utf-8?B?Z1B0Nk1TNTVJRHh1TmJod1Yyb1BNVDljMGxtVWtvell0WE9MZFp2c25TK3lU?=
 =?utf-8?B?S1NieDFTU3oxU1BJL3hpOHVZSnVjTzlDbjhZWWpnWlNvRFJKL1hqYzRYYVli?=
 =?utf-8?B?aFZub0JJSEFWWEVuS09ZWUFVblV2Q3RWc2k0OWl2MktibVJYUmNZYkRHVGx3?=
 =?utf-8?B?djBVbXJIaTNNYVNOazJFWG1hVFZUckNuNEdpaHFxOC9leEMxTEVDUUZHcUVl?=
 =?utf-8?B?dWxQeDFpRkU3eno5cFJ1R1g5czl5ODU4ZFE5NC9yTnArRld4Q2hwczlQRkx4?=
 =?utf-8?B?M3RSdGlTVDc2eHFESjFkZTM4bEdmS3F2QUZDcVhKTWlyWjUybjhqSjZyNm1X?=
 =?utf-8?B?SENrY2pJUVlub0pJcXFpaGlJRGtyYndpb0NMN241RTZ2Q0JhNjJpZWtvR3Ny?=
 =?utf-8?B?WVY0K1dHdHpUL2dMOE8zU3NCdHZ5ZHlobkRoU1BCY090aVFib21VdjI3ejJ6?=
 =?utf-8?B?akNjSHhza2JtRjZoVnUzYjRDVmViRWYwRDBqWTJMWWM0YncvTE1sV3ZhWEpq?=
 =?utf-8?B?WE44MXlvSEo1Q28waXVKeXpCYXdVUWNBR2dqZG1iOHAveW95MWV6RHZ6Lzh5?=
 =?utf-8?B?L0lwdnNkWi9LVUpnNHNsY1Fjck12anpIWFNWM2xkM2sveXQrTWtmRzN5UmhU?=
 =?utf-8?B?UXR6Z0dvYUZzMk1FNHY4UWVvV0dQUXE0S042Q2ZjOGRpN3JPR1JpcjhTcXlk?=
 =?utf-8?B?V2M1cGhNWGxvQVFudXBTY254NmxQejRhTlY2U0R1V1ZJbDJLZXY2dXo2eldy?=
 =?utf-8?B?cmhoR2NJY0pwa21YcE1na3l2ME8yTDRHdjZVTklGZ3FxTWlvdUlzNkxuNTE0?=
 =?utf-8?B?UW9ZK0xpSTdGVTR5bmlwbmsydzBjc1p1clFXV3h2YWZDL0hmT3lTaEtxWXJI?=
 =?utf-8?B?YWNxeFdyWFVMWWVqUHMvaFFJZk5sZDdDUGxaaldUUWVnSmdFd25qa3F3WU5W?=
 =?utf-8?Q?jQNk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWhoalFsdjJQeFJkamhQSHk4aDdkcmIrNDhlb3ZoaGZwWEprbU1EMWFLSFhV?=
 =?utf-8?B?RzBtREw0Ly82RVMyaHY0cEVuekU0aG5IcVpFUDJ5MGE5V2N4eC9nMHozYkRZ?=
 =?utf-8?B?NjNWYmRCbXlMY3lWTTdBektFNVExblVaMVpQOEtlNDJhOHdsYnhoYVNQMEp2?=
 =?utf-8?B?QTNsM3pSaEprMzRVQjM5bm9OVjNaS0FrcVRjQVJLNUZjZ0JsSjVlL0phcUNV?=
 =?utf-8?B?UzVNQUZCeXVva1FPMmdBVnQyVDZUNDVwRWNSeHNOdm5BRkhVYnd0YUVQQmdK?=
 =?utf-8?B?VG1sV1RrRWFEYmpleUN4NFdIcDNscmRxSVd3QWNQMkNOQzdSWDhxT1M4Mm1W?=
 =?utf-8?B?Wmt6Qm9ab0JHMzBad2VFQnZYRUk4RTdUeE9hMWNOVGVlZTBMMzhodGRNOXFZ?=
 =?utf-8?B?aS9rakhxalNnQVQrWnVXTE9QVHQ3ZWY2VGNnQVlYZVVtWStaWDc1RGxSdS9Q?=
 =?utf-8?B?YzNTU3g3K1FUYUxEdTNtQ2dZdzA3SXFWeTdxL0lsMHBrTVJzTWQ5dEdqQm9V?=
 =?utf-8?B?ZG4yZzRmeWc2OCtRbU0xeHZOMjU5NGZQU0wxK2NKZWJkL2hBOXJuY2plbS8y?=
 =?utf-8?B?dEV3MmZ3RldKSCsxdU9IVVg2c3dPdGI4UzkwZDBqdE5IRTVHSnlnNUo1NERX?=
 =?utf-8?B?L3YvcDl2eEZHOWt3ZUpaQ1pDT0loTmltRUt4RG05Q0xhWGl6L1YvZWJ3V2NH?=
 =?utf-8?B?Mm9vUVV3NTJ6YnQ1YnhDR0FaYjU1c1liN01BRzRWMUZacnk0R09KenBNQXdx?=
 =?utf-8?B?Vkl5V1YrRWs2YmRUeEs5VnJqU2JLdFBPWXJxcThTdVkrSktyVnFsWTluWGcw?=
 =?utf-8?B?VS9lQi9oVHFISlNzMXZUNW1YTEJUNEkyNDE1cVhXR21yV2FkOUVBMzdJM2pD?=
 =?utf-8?B?QzhMMUNNT3dGeDg3eUE2NjUwWW9hZVpwU1oyczVJR2hTM1V3UklSV2VLaWpt?=
 =?utf-8?B?Tk9wdjlqRkY5ZVd0cGphS2xxUngvLytSYkphSnBUczMyZkZTeExRenVwTjlh?=
 =?utf-8?B?NS9aRkNhS0dkYzhQTzBqaFlobnFsTFJpZ3pVZlZkUUNUOEE1bmk2dW8vV3hm?=
 =?utf-8?B?UFBlaUlObis1aW51TTBuZE91bk5tR05JbG90WDlibmM5Y05sVUlScEVDNXBi?=
 =?utf-8?B?MDlpb1FDWVM1NjZ0L2Zyc1J3U04wY0ZvVGU1dXhYYkJTbjZWeG9ROS8ySmZV?=
 =?utf-8?B?NGtQcFdBc0ZhVk0vNDhTOHZua2QyUW52cGg5RmFlcVJKdEJEeW05c255THo3?=
 =?utf-8?B?TzY5eEdwK3lBZFVUWnJaeFdaRVdCV1RJeHlhaThkSVNFNkdPVldTeW44aFJ2?=
 =?utf-8?B?UUVaOXlsZDFITHo2bFdEVUJScFRIWUQxRURtMnk4V0x3R29CNFFvalQ1T0Z0?=
 =?utf-8?B?a2RvOU4yY2p1SGxOV3VuY05RZFpUVFlLMm9SVWlZYzUwaS9INVVPZk5WaGpp?=
 =?utf-8?B?dTgwS25SU0pva1VYK0tWcnVmOWh3T2IrSGRZUldJM3A5WW1reVZkSTRHNWJH?=
 =?utf-8?B?cmp0MmhhNmRNTzZUM0xOd2t0U25JdlhqcFhydWo2WHpMUTNVQjB6Y0NHS1Js?=
 =?utf-8?B?SXJ5RE1CSjdta05OaDEwelBIWGtvcTVPU1FCT0xDSHI5QzVxTmp3d2RvdE9h?=
 =?utf-8?B?WHVNVWh6Nm1oUlluZ3gxbnY5TkF4dnBOMzc2VkdLbXE0WWlER1ZtNzRzN3B0?=
 =?utf-8?B?V3NNN1lGUDhjTlFRLzBBc0t3NlVlUm9La0RITUM4ZGU1WUtHenJ0Q3AvSVFE?=
 =?utf-8?B?Y2M0N0VnT25mdjl0K1hOQ3NTQlp0Zk1oOHhNUy9TYnRpeER2UnlDb0JBMnkz?=
 =?utf-8?B?NVdQVllHR2lQS0c3bnUreWZrdXZYVit1WHU4dmhiT1hlNmgzNXJwSXVzZ1h0?=
 =?utf-8?B?ZDFwNFlyRTIyY2JRUXRrMU5aZHA0QkdOL3UrSDNZMU9VNHA1VDRuYndtV2ZJ?=
 =?utf-8?B?dFFsWUR2VjdMOGI3ODI0anA2N2hBa2NPckhzOE0wbk9RbU9PcXJZTzRWZGRs?=
 =?utf-8?B?ZXFsK0tBa1FRVExEd29UUUF3aENkRlV2SXFlSlRZeExnSkRaZS9JTXJ5eGFB?=
 =?utf-8?B?RWlSY3pUcm90K25QYXpKbGVSa3oxUFNaU2wxTUYybTB4Wm5HNEY1aVFrbUdq?=
 =?utf-8?B?T0cvNmFKeHRpVEh4R1JPTnpZNEVWOHNrSFNNTGdGOGRveUNkOW1SdmpIdjdK?=
 =?utf-8?B?ZnEwcEpJUTZzNW44NXF4VHA5VGFyejBtL1d6Q000VXNQblFNV1dLU0l0U3Bi?=
 =?utf-8?B?bEorK1pRRXU0bWxVSFpLbzJsR25RUHh5VlVJdyszNlZJSWMxL01ObmZzSHMw?=
 =?utf-8?B?NUpqTkwvN1JSNU5EQU92WGVhcitFakt3Zmthd0IyYnhMNk1zZ1ZJUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99996a96-b01a-4bd4-3f07-08de72d83503
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 12:36:46.2027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wujFbv9ayKqDDOJtn6KfF0B5JyHxFs5tg5HXAF/LdymoA1n0QGRxOdiYo8p4d1dkGgn0eDAq8utcCBMpBa/SR/SomeqD1G+vV9/BofSmaxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR03MB7576
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 88B191762C6
X-Rspamd-Action: no action

On 16/02/2026 11:56 am, Jan Beulich wrote:
> The records reported used to contain Linux enumerators. We first broke
> that connection when purging unused ones, and then again when switching to
> the bit mask forms.
>
> Fixes: 408413051144 ("x86/cpu: Drop unused X86_VENDOR_* values")
> Fixes: 0cd074144cbb ("x86/cpu: Renumber X86_VENDOR_* to form a bitmap")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I see you've committed this, but it's not a viable approach.

> --- a/xen/arch/x86/cpu/mcheck/mce.c
> +++ b/xen/arch/x86/cpu/mcheck/mce.c
> @@ -858,6 +858,22 @@ void *x86_mcinfo_reserve(struct mc_info
>      return mic_index;
>  }
>  
> +/* Linux values need using when reporting CPU vendors to the outside. */
> +static unsigned int xen2linux_vendor(unsigned int vendor)
> +{
> +    switch ( vendor )
> +    {
> +    case X86_VENDOR_INTEL:    return 0;
> +    case X86_VENDOR_AMD:      return 2;
> +    case X86_VENDOR_CENTAUR:  return 5;
> +    case X86_VENDOR_HYGON:    return 9;
> +    case X86_VENDOR_SHANGHAI: return 10; /* X86_VENDOR_ZHAOXIN */
> +    default: break;
> +    }
> +
> +    return 0xff; /* X86_VENDOR_UNKNOWN */
> +}

The Linux x86 maintainers say that the numbers are internal and not an
ABI, even they haven't changed since 2008.

> +
>  static void x86_mcinfo_apei_save(
>      struct mcinfo_global *mc_global, struct mcinfo_bank *mc_bank)
>  {
> @@ -866,7 +882,7 @@ static void x86_mcinfo_apei_save(
>      memset(&m, 0, sizeof(struct mce));
>  
>      m.cpu = mc_global->mc_coreid;
> -    m.cpuvendor = boot_cpu_data.x86_vendor;
> +    m.cpuvendor = xen2linux_vendor(boot_cpu_data.x86_vendor);

This is an internal Xen structure.  This hunk needs reverting.

>      m.cpuid = cpuid_eax(1);
>      m.socketid = mc_global->mc_socketid;
>      m.apicid = mc_global->mc_apicid;
> @@ -968,7 +984,7 @@ static void cf_check __maybe_unused do_m
>                          &xcp->mc_ncores_active, &xcp->mc_nthreads);
>      xcp->mc_cpuid_level = c->cpuid_level;
>      xcp->mc_family = c->x86;
> -    xcp->mc_vendor = c->x86_vendor;
> +    xcp->mc_vendor = xen2linux_vendor(c->x86_vendor);
>      xcp->mc_model = c->x86_model;
>      xcp->mc_step = c->x86_mask;
>      xcp->mc_cache_size = c->x86_cache_size;

This is an external structure, but a crap one at that.

It's full of wrong information, including mc_cpu_caps[] which has been
wrong forever (Xen never had the Linux internal leaf as Linux had it,
and the standard leaves haven't had that order since Xen 4.6 or so), and
mc_cpunr which is Xen's idea of the CPU number, not Linuxes.

It seems to be copy&paste of an internal Linux structure, but given as a
Xen-wide interface.

I find it hard to believe that this is even usable, which begs the
question is it even used?

Deleting xen-mca.h is probably the only reasonable approach I can see
here.  It should have been hard-nacked at the point of being proposed,
and never gotten into Xen...

~Andrew

