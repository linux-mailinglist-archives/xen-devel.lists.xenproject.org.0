Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCBFAB63B6
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 09:05:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983829.1370004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6Aa-0001HN-UL; Wed, 14 May 2025 07:04:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983829.1370004; Wed, 14 May 2025 07:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6Aa-0001Eo-RF; Wed, 14 May 2025 07:04:48 +0000
Received: by outflank-mailman (input) for mailman id 983829;
 Wed, 14 May 2025 07:04:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kjT3=X6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uF6AZ-0001Ei-T4
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 07:04:47 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20622.outbound.protection.outlook.com
 [2a01:111:f403:2009::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6bdb519-3091-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 09:04:45 +0200 (CEST)
Received: from DM4PR12MB5277.namprd12.prod.outlook.com (2603:10b6:5:390::7) by
 IA1PR12MB8312.namprd12.prod.outlook.com (2603:10b6:208:3fc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 07:04:42 +0000
Received: from DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e]) by DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e%3]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 07:04:42 +0000
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
X-Inumbo-ID: b6bdb519-3091-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fNVlcYSA+K0gGeswZCedrNU2Iv7Tz3T4fru48X1p2MFNgZOjfxlViGBDhyihTcByZOQDISSIJOT4n1NFkc1K4YDtP8yK2ulTboNOWZaiyi9vwpxAI1YCsY74aritVHPvrBY6M5rWyge6S0KWwTRP8RlBZdnu9XsfZ9y1QtP0FBFLfWZdzKnLM8h0atVz2rbvgsYWUzaLKvdOU1U0v17YUBxmTSZBdUjU18QLTmnF6AM5DRbtQlV5mR3VLrw0XhhMYepx3XpSGv7NGuAfVoExTc+A1bqEQxJqGdItmZ9kCeqPBVcjsFh8ZY8teYqPB6elPMWCej5Q4tFd3JzPxibHRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fg0IjlIRNUhsid3cs7IM2WM++hYVZQNpG3ftDcxV+gU=;
 b=QIuE6om7Huki+FPXeLy1iY75yBztjVORVnz9TscnhP1nwzyiOIQsfk+Ky5KMknZJVMfS6sHt8b6arqomRuzk9yq2X74schgM91xy0MzA8YO7gCkmJ+RRl/Ge71uWPkN9MfNeG7flYFh6B82ku+Q/AYJg7PpKNszcwKan6p+frhM5B6Z/BPnTDPfhOiL77+Qpwc2J2XPBvuNfodtoKSbZTzZE9tsyFF8r11JVE5yCE1VVCZwGZ+QKSwv7+Pda/RlZNcPiLqU2VYsUzqG9iZijY7Pb3oPdNBs+YeMx/Tous2eewHiZWssk5ugxR+xJwEj/AKtamxKyH+raNk0HlOaUMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fg0IjlIRNUhsid3cs7IM2WM++hYVZQNpG3ftDcxV+gU=;
 b=4ZWH6HhV6w9FWgSHud1qG/iNNpu4Wan4L/29h2ev+oWjTc2UydkSQt3gqWnOfiTaq4L7P2bjNkugNboufkje+xyb62ruA3a3IyAgKtK55J576YJk5oT9XMcyTlWxpS6jnKtODLhXd7bEZ8xvufQpckdcRX235i1Ii7512yPO9Zc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <369ccaf5-5c17-4601-88b0-eb32af8608d6@amd.com>
Date: Wed, 14 May 2025 09:04:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/dom0less: mark domain_p2m_set_allocation __init
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <20250513171810.668370-1-stewart.hildebrand@amd.com>
 <alpine.DEB.2.22.394.2505131707020.368682@ubuntu-linux-20-04-desktop>
 <cacb0002-dd6b-49e5-8019-2d323771e3e7@amd.com>
 <4e684e38-ed64-4731-8f00-afba938a28a0@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <4e684e38-ed64-4731-8f00-afba938a28a0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::6) To DM4PR12MB5277.namprd12.prod.outlook.com
 (2603:10b6:5:390::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5277:EE_|IA1PR12MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: ef4a2abc-d2d9-4d22-e82c-08dd92b59965
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0wvNElyWHNBMHZsT25GTVRkTDM0QWNFYTRXekxRQ080Y2xvUlFVbWZ2NXZD?=
 =?utf-8?B?MDNwSzFEUE5aUzdqNGJ3cnlrZjVOV2ZqdC9EVmkvdU5HRStYRGZxYTNVK0hu?=
 =?utf-8?B?NnVxa01LU1NnL284QVhUUk83aHZ2SG9xVnJteUlBTngybjI4aU4vNkUrSkk4?=
 =?utf-8?B?TTlpNndoOVhYend0cHVSVVB6REZEZmVoc0dXeHVZaS9pUUJjR2VUb1c1dE4y?=
 =?utf-8?B?a09WT3FMZFRnKzJKOHFEcDFuT1dLbkVvZDRBRXN4V0F6ZnV3bXU2WVZVUGJG?=
 =?utf-8?B?L203OThmSjZUanRpUlVMZUNReHY3NS9KMG9YUTRXbXlwYXN2TWszQkROa2hs?=
 =?utf-8?B?U24rTFhtaG5pVWZiMnhQRnp0ZTV4NFFpVHlnOWdMUFpneVByZ1o3ZVlSNFNu?=
 =?utf-8?B?ejNmazRWTjVUaCttSld0WVNSUktONCtBODNYSUdTbS9SRWJicXVoN0ZIVlRN?=
 =?utf-8?B?dHljT0c5U1YwODNKKys5QVRKV2swMVBRU3lPNjdZZGZ2azk5T3JlZ0xMTUMv?=
 =?utf-8?B?TEpQaVg5dU5tRmpuYXNtYXZrZkZ5aUlpVCtodjFweWVsMTZhYUkvVENKRHIr?=
 =?utf-8?B?ZjVKUHNzdGl0dHlBam55OWtUSHZnKzNMOHMzVzBQNzdha01KdW5HdVBDODYz?=
 =?utf-8?B?ekVhNGt1SGJMTWJUVnh2SWw5YzRhNmZhWXBhUXFFWldZT1ZaUTFBYUtoZjNx?=
 =?utf-8?B?OWNOUHNVWEJTYkNPRGRCNkJQVncvUW4xRS9UZk1PSTN5WllhZjZhTUFiLytR?=
 =?utf-8?B?L012eWtUb0RKakRpb3JVeUM2ZWVqN1hoa1VjT0o5b0Y3MDY0MkpyS25hZlJY?=
 =?utf-8?B?MVVrZnkxcHJzdXdGSjM3YTlNRm0zQUNtZlpQTyt1KzFUeEVTeUtPcjE0QjJU?=
 =?utf-8?B?Tm5lam4rUm5qVStHeVdrd0VGVTdEUUtOWktuZ2UwMkJzeFRTdlFhSnk3MEhm?=
 =?utf-8?B?SzUvalJrdjh4NkFTUHI0bU1sc1BEWmJYTFV4Q1BqWDRoeFEvQzlwaXZKZElH?=
 =?utf-8?B?bWlnRFk2V2xIeWNIS1l3V3dWQ3YyTXQzZndZV1k5cU05ZVJCRHZRK1Z4bTZW?=
 =?utf-8?B?QnRCREVaWDNpOGV2K1dIZy9rT2NwTGs4K3hOQnBKNG1yQlNiNUR2QlV0SGt6?=
 =?utf-8?B?Z0hQK3hRL0xHdnAxbnJpcUlwV2paNlNmcm1UVG9NTnpTdGtTaUpxZFQrdjBs?=
 =?utf-8?B?M3dyNUJLL2NWNEprRDdwdlVYaHMxdzkvQkpNWmM2V2VadHNTMWx1MVNMbFYz?=
 =?utf-8?B?eGkxMXNlQVFibnhYNkUxaWRTZ0JuS0ErdUVweVd6dzZoR0xHbXpvYjNZV1Zu?=
 =?utf-8?B?SStobERqYXRFVjAvWEc1aHdoTlFJZWs5eXZiUmtqZVVsOVpwcmRQQ1JINzdJ?=
 =?utf-8?B?bVdSc3NUVDY0MjkzWVFtWjR0T0Uydjh2bXhrbE5DeEpia0pYcytpWG9SOWho?=
 =?utf-8?B?RHJRUkZqcmV3OGpkakNQbVFTSFFvQmp4VHprNndHVEd1UkdkanBlaHdtc1Rv?=
 =?utf-8?B?R1EwTms3YXZmTWlKcTk0aHZ3VUdVTS9TZENDdzA4YTFTelQ0cndUVGQyU0sw?=
 =?utf-8?B?LzMxMmxTMGhWa0ltTVdRb3VvTWJLOHFhWGtWc0ovQmdWbUh1ZlgrWFpGM3V3?=
 =?utf-8?B?NnZ6VE9PUW5XaW1jRTVzQnhSM0J0ZHRGSStzei9xaGdLcWx3Znovc0syQWR4?=
 =?utf-8?B?USt3K2VHVDVoNmNEWCtQRVVJSjFkRTlzUnNGNTNsTUpsYit1ZkxVVGJmYTBF?=
 =?utf-8?B?MStXZGllSkRqeUFhOC82NnhWQk9zMWNyMnJFZTNNRTZjNkFod2dsT0x1MVFr?=
 =?utf-8?B?YWt1ODJjaENXRlkwK2lHeittZWIweXdqVDRBbklNYVR0aW8rSVFTYmVUOE96?=
 =?utf-8?B?N1JTK1llRWZCKzA2R2pMdE0vanNDY0Z4SVA1YkhQbDlRYUo2cE5TeTZOTUQ0?=
 =?utf-8?Q?sMZx8+muVBw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VG8xeUdGTjlITGIycVA2V2UveTRjMlFDQWZsaWs5Tm1ZSi9WSmhqYk9VNi9u?=
 =?utf-8?B?NlBFT1N0R2I5bGU4RU5jUE1PSHE5WE14c1VyK0ZsN09acEF0ZjVXc0pOdXho?=
 =?utf-8?B?R0YwMFRUVE1scnhyeDlJU0VCbjIwSzRFK2x1cENhTXB1MVhnbnd2Vm11a3dP?=
 =?utf-8?B?aGNOWnhpakgreVZsbHphN2FUdWhMZ1dnYU91dWtPSEpWRVFNSkk2Ni94UzNY?=
 =?utf-8?B?Q1Rja2RXYW9mZTY0R2c1S0hlejczMEhFV0E2NW5hQlRDSVhKMlRlZ3BoelVW?=
 =?utf-8?B?dVBDejlQSHlzdlYveDd2Rml6dXV6allUYkFGU1Avckh5dTVTZmR6SzlLMmMz?=
 =?utf-8?B?bGhvZHBuWjB4WHd0a1J3a2VjSWFMOWJWQk5qY0ZVYWZaM0trSFZ5QmRQalFM?=
 =?utf-8?B?dUZDNWZuWStHMnhpdTMvZFRuMUo3bitrUURIM295elVibmFiMjBLRmRhRWtV?=
 =?utf-8?B?LytsbWtOSGtCMDFDRkhaZlpESkhYbkJueDU4ZG5sbEdjeDhGYmJOOG9nMkxQ?=
 =?utf-8?B?dFNIek11bU8yWVd1K0RmbnlLNXU4QnBmOWdnYnduNzZtbmNEWUp2RzFyYjl2?=
 =?utf-8?B?SDJwMi9LVVdrOUxsQ2pDVzR2SjNIYzJZdk5mWnEzSXN3bkcwWkF3MnY1UE81?=
 =?utf-8?B?cHZVWDdPNFFWcDVEdlp0Yy9ibzRrRTJaYmp1UHRhU3ViK25yYm1ad1NOalVh?=
 =?utf-8?B?bkhEenVLMlRSZ3pTTFplVUREK0R0YloraXZiSHpOREFqOTJEcmxOblhzYVVl?=
 =?utf-8?B?L3crQ0ovbGxBTGNCMjNCTlhjTXI4NzRNK0xwSFRyaVFFYml1SkxQZW1ZZjlP?=
 =?utf-8?B?T28xVjBPM2p1L2ZDVWJ4RHkvUFROQmQvbVYva1JRTktzZVRiTDJCS1FEbmtD?=
 =?utf-8?B?a1dpMVlqYlROYUdsQVUwd21QU3Z1MDdYREtGRnE2eHZvS0t3M1pPZ3VKRklY?=
 =?utf-8?B?Qmt0KzI1c08rM1pyRS9UcjhyOCtnZXpIUUpwK3VkUEpGUTdXS0h6RzlWZ2ds?=
 =?utf-8?B?aE9NQW9NZFFxUWtFVHFEdzN1dTRORjU1YzRwcjJzWTk1K2xvUlRtaGVjNytF?=
 =?utf-8?B?WU9YNzBpT2V4UUt0NThDK0wrV3VHV1hzNENReUh3OE8wL1F2OXFRK213ZUY2?=
 =?utf-8?B?SG4yeUNFZGtpd1hhVDBJQXJLMUk1RkdkMnVLT3o0VkRSMjJvczRwd2JPd3Qx?=
 =?utf-8?B?b20xbWtOWVZoRGVzRE5CcVc4b0R5YW9NOVFnS1hZTTZadFRvWlZhd3prVWtx?=
 =?utf-8?B?bjdtQW9SaFNCMXVtaThPcm4zMk9jTVNEZEgvZ0c3Zy9KaDZkTnRIWCsybGt3?=
 =?utf-8?B?NjdBdVJNVWpvMHNwSWZmQ290Uk5IaHJaZzZEVHlHZ1lpQ3MzUTJTZVhQeGY5?=
 =?utf-8?B?YzRDUklHdFJLbFU5SWRaRmhPSzdLWHJQWFVGT0xoWE5jZ0N1d0VySjUwdEo4?=
 =?utf-8?B?TEJPcEUwSU1oeUY2WnNoci9HUVg4a0NWOE04djVZT2xHS0ZHT2tOVGIvTnQv?=
 =?utf-8?B?U3kram1LTkVuMXdGNEVaUmI0NzYrVTEwTWtnZmhVN3NLVTJoQ2NiajZjZlpK?=
 =?utf-8?B?OFJHK0tmYkdRVk9aaVAyN05RWmZFVlhXVVhBeUNaY1V1TG83cFZlbHA1dHc2?=
 =?utf-8?B?dk5ncXQvRjRDZEk4QUlhWTBpaDU2QzVtcUNCZmRaQXZsSzdRQ3BBWVZ2ZXpY?=
 =?utf-8?B?UmxCdnlkUmdEUlowdWphSTJBQVhPc0lWTVhyaWRzRWJaU2hPakdGWlBCTlV3?=
 =?utf-8?B?emNDYW8vK3ZYaktjR1B3V0tCa0J1L1JEZ05scDlrR3lmd0tQTVRNV1dQMndN?=
 =?utf-8?B?eVVWU0VKV3ZzK2FyVEhIM2l3QzBXQnltd01yTWttL2w0bjV4dDJFN044VE15?=
 =?utf-8?B?U1FUL1Y2dVNyVm1pQ0ZYQWoyT2h5L3ZobUUzK2c2MUora2lFUWRtY05JVW9h?=
 =?utf-8?B?cXJoY0FJT1c1bHFZOFMyd0wwb1FGdFIyV1YwUEtSZFFKQkpIaFJkZnR6T1Ry?=
 =?utf-8?B?MUt1bHc4Ykx6SzJ1MkNMVFQyV3RyNlN2Q2NIeEwvUVZEL2lCUCtLcGtWTEc3?=
 =?utf-8?B?MDBGOGdycWRsRGJPM1dtME9Bd1RFR1VIcDltVGxoUkR5QWdUT2pTNWhTNmF4?=
 =?utf-8?Q?HTaTkUl/q/bwkoOIH+xKucOub?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef4a2abc-d2d9-4d22-e82c-08dd92b59965
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 07:04:41.9103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZGPwmXvUa/1uW96acPz5ZRBPo3Vnt1fNbfYpD6GStAj43WZxXbe1oasQuBGOZ30I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8312



On 14/05/2025 08:56, Jan Beulich wrote:
> On 14.05.2025 08:31, Orzel, Michal wrote:
>> On 14/05/2025 02:07, Stefano Stabellini wrote:
>>> On Tue, 13 May 2025, Stewart Hildebrand wrote:
>>>> All functions in dom0less-build.c should be __init.
>> Why? This patch is first in your series and by that time there is no build time
>> enforcement. Together with the Fixes tag it implies that this is somehow an
>> issue (i.e. build/runtime issue) other than inconsistency for which we surely
>> don't need Fixes tag.
> 
> I disagree: Code not called post-init should be in .init.*. While not formally
> a Misra violation (and wrongly so, I think), it imo effectively is: Such code
> is otherwise unreachable post-init.
You have a point here, I agree. Although I don't think MISRA differentiates
between unreachable in general vs pre or post init. It defines it as code that
cannot be executed. It does not go into stages of runtime execution.

I'm thinking how this is different from a function that is called e.g. only once
at specific point at runtime execution for which we did not come up with a
separate section?

~Michal


