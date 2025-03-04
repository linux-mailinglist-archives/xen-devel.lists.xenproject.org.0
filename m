Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 971C4A4DB79
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 11:54:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900923.1308893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpPuK-0007uU-FI; Tue, 04 Mar 2025 10:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900923.1308893; Tue, 04 Mar 2025 10:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpPuK-0007s0-CK; Tue, 04 Mar 2025 10:53:52 +0000
Received: by outflank-mailman (input) for mailman id 900923;
 Tue, 04 Mar 2025 10:53:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6XUS=VX=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tpPuI-0007ru-EZ
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 10:53:50 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2009::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f037e05f-f8e6-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 11:53:43 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by CH3PR12MB8849.namprd12.prod.outlook.com (2603:10b6:610:178::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Tue, 4 Mar
 2025 10:53:40 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%5]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 10:53:40 +0000
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
X-Inumbo-ID: f037e05f-f8e6-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qyyiUU+FgaVWfrTcG1qvYlHbhxuDzpy4WpqtVfpZcqGIFXqjiVcSUDRzBmfBNzHpDc4mJlCy8QWsVqGnhh0pLhWcUULRkrQAbXk8v+Cw7V+J40X47b6nQM+rzKJp7MfxJVTGM5n2BgO4AwbXJQWVZDmt8ChpOiZwp4g0AP9uIqvRqBTHT1v0Q9wytlKZjaG7h0SBgP/QsgulTlE3FQieZLuTSYYsX8WzlcEoIdnvFJHJG0LiyW4WrMXPrFnKzySBjiBND2aItx+7wS4th313kt9ML5oLkzO6rPNsg0DmTjPY8Npihr+4n860Xzy3/fHCTtjvaM90f/PMV1p7/qTWRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q98jDG/zXttp23XJ0K5yMWmsuBIeS7jZbolHAqnegHM=;
 b=DEqGPaSg59DS5TLTtObDBtoY04ySVPeXvnr+qNGHrKlXSk8bs1pzwdFU+NO/9zg55ZbhpU9kUCkq5CQMWDF3Iq/kHXC5uyyO4po2gB4hyHigW9G7RdvgP7ZQUzWHiJ3alY2djxk+JTfnZUqmVuAp6u80EgzHf8c+yYGJfbirH2+OlC2YyHCoWL33V2kBEDVy4hw36c3D1TVXXclm18N0XNCm+H1PENwtmB7QKV+OHXQB24xdg2IWwMsqutad9uTZsOB9yOiYuJFU4LM56w4l7cxKHhkShNoDBYKI3m04HWGiEXF2GmEzsMvB/oR1NBB++IgjsZoplA/roj7nnB0nXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q98jDG/zXttp23XJ0K5yMWmsuBIeS7jZbolHAqnegHM=;
 b=VkSfDh/AQyAcFVWK0CtJlg8HU6SP7fiwIGPoVf/hrU5W612sxPLWpVLo2e7bYas2oWXJK9ofGQ2YNxeqfvafLnOfny7xaShK5H8YHlqi4uN935TL6pICaOdl4pFoa2SEeeTiA5+BOAZLZl7rRX8+WGe+NhlLMTaYyE3QEZfDlSE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <51104e92-efe6-4477-9435-cae2dee33be7@amd.com>
Date: Tue, 4 Mar 2025 10:53:35 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] arm/mpu: Introduce MPU memory region map structure
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20250228161817.3342443-1-luca.fancellu@arm.com>
 <20250228161817.3342443-4-luca.fancellu@arm.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20250228161817.3342443-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB6PR0301CA0095.eurprd03.prod.outlook.com
 (2603:10a6:6:30::42) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|CH3PR12MB8849:EE_
X-MS-Office365-Filtering-Correlation-Id: 441a0761-89ae-4812-54f3-08dd5b0ad2a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NXdBS01vTFdCRFVBaDNWVTVYNS9QbEdoTlJKa3lpN0pVMlh0TTVhMitsZVBa?=
 =?utf-8?B?c0d1QytMZ2E0TGE0bk1JYUhXSTJOdXlhMzk4MzFKK0ROQnFNakZldW1SSmdZ?=
 =?utf-8?B?TmEvekw1L0hEL2VEcC8wd0I5U2RuN05TQUxQT2gxQ2d5cE1yeFJYWllJRUk1?=
 =?utf-8?B?WVAxSVVaNjBQS2xJclpVU1p6V01zVzduNklsLzVzYVJvaE5ISElkTjhlVFBK?=
 =?utf-8?B?VHkzSG5oS2dwMUVIWlF6dVR5dk15YmRZc3UvYzRiYVVKMElrRzJSME52djhX?=
 =?utf-8?B?VkxSV0N0bDh1ZGRhU2FValdBOWhNeXdTV2cvaHNMdm1WZ2x6RWlCOURNSHhP?=
 =?utf-8?B?US90U2IrUFpxUzZZTkIybDM2RjdsQUNYdFF1Vkc4Rnc4QnBHY2Z1L3ZOSE9m?=
 =?utf-8?B?ZXRmeVJLZ3JoeEhMSWg3dVAzdHBuSExlTDhManA5SnAxb2NVcFZ5Tld1eTBr?=
 =?utf-8?B?d0hqQ1VlUTVjRmg1bEpySW5GQjhFcFRjSkNhSHpHSnVBT3Fkb1JFMzdYN2Rr?=
 =?utf-8?B?c3ByZjdmU2h5R0lTTTc5dVRENFgwcjd1RFYxN2xHdC8ybXdIL2xxUTRRa1p1?=
 =?utf-8?B?QTFObVRjUnpSaUNJbDUxWGpXMy83Z1J5d1JqZFZOSWI4NzFSdCtjYktnbWxz?=
 =?utf-8?B?NlVjVUlwRGZYL081aE9reitjK2NjK1JQRC8xczdscWRMVjRzNGtzYU9WZ2JJ?=
 =?utf-8?B?U0krcXdKU2Q5T3N2NTNyN1BTMHk5UGhQNFdQTis3QW1ERG5BUit2NU5PZ0hm?=
 =?utf-8?B?aXc2NWticFBjbFF1OVFKbzVKbDhRNmZvcWtadExCUE9qc05ibzFEZXk3b2ly?=
 =?utf-8?B?Zkxjc1lNS2VKaG1UOWZiZG85WjA5dnlsMUdoenF6OGk1OWlmRWEwbWpCaWU1?=
 =?utf-8?B?T0NrQWpHQXFicWc4MFdyUXpPdHpzSHhKSzMweFNQKytmWmVHTFhCbU1Sem1D?=
 =?utf-8?B?R05DKzlVeHNVd0IzemU0bHNUTkFkS1dsR3RjZjdRRWFVTmdscmc2SGJXdUE2?=
 =?utf-8?B?Y0FEa05SZXpDc2pIVWpNTG42V0dzSTZ2MXpNTHJ4aHVZSFY2OEJHV1o2akRr?=
 =?utf-8?B?WDFTVGlRSFFGZitXRjdkWnJxNlpHNGxiWUd5QW45UTAxMHVQdmVubmY3T09h?=
 =?utf-8?B?aWo5T01RNTdzdVFZaVdnS3pIejhuQnZyL3N5VlNOeXJOdDI3Z3pJQys4cDFN?=
 =?utf-8?B?UGJyMlJoelJwM3UyemlKRDJiTW8vSjBqMFp3L3hUWXlpeUc1eVZHdHE5dk9j?=
 =?utf-8?B?em9BSTNSRWlHeHJKdzdYQ2pNVnVjOVFiWDdFYkhWWmYvblhIQnBpeTZBQk5k?=
 =?utf-8?B?RkE0RldsWUtkOTYvWE1xVkZ4NGxLaVJqdlNCeUlQMlQ1SkxKVUtVZ2taY3R3?=
 =?utf-8?B?YkFUeUw5aXhTTGNjU1ZmWThuYTcyVWVicTFIMGh4OVpjaGFzSHpVK3dHcmhn?=
 =?utf-8?B?aUNJN2E2ODAyaUx5OTVkczVyS0FPS2R2MGxUNTNDalRhSkV1bExRNVNmeTJl?=
 =?utf-8?B?NmFDWU1hZ0ZuWWhWM0QwamxSalFpbWpTZStkbUZPSXdFMlRjQ1BDaXZEMFpJ?=
 =?utf-8?B?cGI1WCtwZkdaR2wxejhBUnJJczhjcVVoSE8xbCtNeTI4Qkw2bEtVSGU0YU1V?=
 =?utf-8?B?enJ5QlBaMmxvTlRlSE5kTkcvSUNRbkFMS1NvWUpMMzk0NGc1NThOY2RIN3Vl?=
 =?utf-8?B?QlhzZGp3SEdGYlN2cjlIdnV4Y254LzhITnpQd2RteVdzdDEyUkQ2QThkQ1VV?=
 =?utf-8?B?WlYxSEdsUkI0MUZPOXVqeXBmaDluZFFLQ2hBSnVFUlhscDdmUW9yZ0NqNXVm?=
 =?utf-8?B?SWx4T3BiVUZxdWxaOTlQQXZVVFlsSVVoNHYyWm44dENOTjE2dUZGUzRhWWY1?=
 =?utf-8?Q?+ML24rMuqqFto?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDFyWWdMMEZoWU1reE1UaHlLS29SY0VidWJjWkd5TytNM3E2YVlGMGVDOUNj?=
 =?utf-8?B?aFNDNmNSQ2E1N0lPTE9JMnY4bGVWVXhTbWFOYU93T1ZPRUs1QkRUc1B6RnpS?=
 =?utf-8?B?eEtnVTJFVlJwWTFRQXNhU2ZKNXFoaHFVRCszYUlYWU1LRVo1YVFSck5tdytl?=
 =?utf-8?B?OVgxYklQajBJZ0F3S1hTSHBJaXJMVTY5M0pRTXVaaTlueWJ5bm05akF1RkF2?=
 =?utf-8?B?YXFZVkR0aEw5endRMDA2Yy9tNGNZVU9pY2tocmNOZmdockpDSlNRQnEza0Jq?=
 =?utf-8?B?cVYvb3NyUWxwYkhsYjBDRXZnaGhKQ3ZwVzRmM2t2K1d2QUNVK0RwRkxiS0VO?=
 =?utf-8?B?NFNMamt2WThlbmJ6ZWI0R0NEUnFoYUlUNFgzVmdDNGJ0YW9kVVdWeW1mOCtH?=
 =?utf-8?B?TUFzUlc3eTlUc0t3dzFQZEJ2QWlCMVhJOU9ERWlqRllyL0hXc0U4T1JFc3dx?=
 =?utf-8?B?eVBrVUYvK3hNWDFqM1NzYTliSWlYWFFVb0JvYzM3VkVPU2IrT28rOHdVL3Fm?=
 =?utf-8?B?NzNXUjRia0dJc2hKVFVWYm5pb0w2Tm00OEo5WHVhYlZmZG4rdFluY0I0R3d4?=
 =?utf-8?B?N3NPZzltZG5maGNFSVNwekRYbk5xZ3IwckhUYzJ4OW9yMTY2ODcxWVNydVFj?=
 =?utf-8?B?cm9JYVQ1bVVRRWtJQ2JJQWNRczI5RlBZa2RpVE5KM0s4MW5Ua3dETGh6RTdZ?=
 =?utf-8?B?ZUgzalZqZEY2MGRENllXRXc1eU41THlCOXJ2cm82SVJLSXc3YnRNaXRUNlZj?=
 =?utf-8?B?MUpIZm5pTlhLSUl0Q2g4WHB6WFJCTklNVy8xM0U1eUpNbDFHTkc1QjdMYXNn?=
 =?utf-8?B?WG5rY2MwWHAwNXMzT0hDenpReFBHMy9vSTNWaGZ3U3RndExCamc4UzI2TUxC?=
 =?utf-8?B?eW5nRTNZWlVtVXZIejc4VUhaK3FiQm5ub3Jod0pzYm1KZUV1N1VtYjVBRThP?=
 =?utf-8?B?OGRIRnk2REUyWHBWa2J0NEI0WDNVK2tkcTVCeXRrWEx0TDVrVHROeExxUUs5?=
 =?utf-8?B?Wm5nY0RGUTZ3M2ZGTHNSMG8vSm1iSjNqaWpvcFpMUE1EU2hPUS9YaWRUUWFC?=
 =?utf-8?B?Vzd6QWlHSlRFeUxZV1hBQVUwNkhEbGFOdHlxTWJMbTh4OFcrQVc0YWFyQllp?=
 =?utf-8?B?Tm1sblZqOGN6VU02YU1NVm9jOGMvVjQ1LzNBMGFtcHlCVUU0VDdtWlR5TEY1?=
 =?utf-8?B?c2hYVjJMaUJjTXovaGRsb3ZqK3J5NHAxelY4bnhWLzh0Q3hXTHhiL2JJYU0x?=
 =?utf-8?B?QTlBVmtZUUkvT2dwSFpVK0xRYnc1Y09OcFJ6b2hCM2ZmZ2VDdVZmUUs0WnJJ?=
 =?utf-8?B?TDliKzNZK3dLRWEvUUJNNE5KVEhoMEpya3Q4TkhrOVp1UWJMZnVvNndlbnNT?=
 =?utf-8?B?L3R6bWZWZ2ZCNkRxeG43TjBwNTZvVHNEMUNiMjFJRGY1emVnT1p4bVJTblBv?=
 =?utf-8?B?YzhkSnVaZUREbERZaVZ0RWhTV2pSNnFNZGlpRXJmZVdab293K2w5dERIa1U5?=
 =?utf-8?B?QVFrUGxzTGhUUHBEZ0pza29tK1VpbUFTeENNUGw0czFLdjNEUkNOMHNNN3Y1?=
 =?utf-8?B?Zi9nVTA0NUJxK0tSMTM1SGdiYzZyK0FLN2tjWHF5Z3g0YTRZTWNkWlVtcGY5?=
 =?utf-8?B?cERqVzN1c2hiSkxLRzBXODRlYXVxWVlKM2U4SGZkRTRDd1ZkaDRmeC9DR0t1?=
 =?utf-8?B?YnA5dUFYUkdMRjVvNW9hSkZ4TzErRC9ld3VUdlBDMVlTbGhvc2Ura2VWcjZa?=
 =?utf-8?B?b0tpMVRTWlNMZWVFM1RjYzU0RGNYbHFGc1RJMzlqSXg0MytzYlJjZUJTbjRy?=
 =?utf-8?B?UktzaVlOQTV5WVVxeFVJdEdNTkhTMmczbXBBaUNTZ3JRRjdBMUhuU2dKSytm?=
 =?utf-8?B?U3VCQkJ0emtKU044Wk9FVVZ0NEw2V3pTT1JZckFZSVJlUGJTQW5xbXNoRGxO?=
 =?utf-8?B?cXc0bWgvVHltY0FqdUxpQmxDeldudzZBcHJEK05FQXhOR1JrN0VvUk1zdTZB?=
 =?utf-8?B?RWpoMnVxVXd3am9DY3J2cG9YY3VlejcrM2N6UE9DWUExQUtHYlk2T3pNN3lr?=
 =?utf-8?B?My83UnRUQUdFVlpOMnJhaDU3RHM0R1Y0d1pRSUFFWnpyWm43RWloTTFoZWJj?=
 =?utf-8?Q?N5/wVhVs71gPvLqNp4nwnCWmq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 441a0761-89ae-4812-54f3-08dd5b0ad2a0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 10:53:40.1991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NQ6aw4+wmuYeNZxDI9a7bKr9YfRCWZ5L2/hhezD25Dhx5mV0pQC+blmUJD8d/9cNkoeXJA/GKNhj44s0xKrJNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8849

Hi Luca,

On 28/02/2025 16:18, Luca Fancellu wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> From: Penny Zheng <Penny.Zheng@arm.com>
>
> Introduce pr_t typedef which is a structure having the prbar
> and prlar members, each being structured as the registers of
> the aarch64 armv8-r architecture.
>
> Introduce the array 'xen_mpumap' that will store a view of
> the content of the MPU regions.
>
> Introduce MAX_MPU_REGIONS macro that uses the value of
> NUM_MPU_REGIONS_MASK just for clarity, because using the
> latter as number of elements of the xen_mpumap array might
> be misleading.
>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>   xen/arch/arm/Makefile                |  1 +
>   xen/arch/arm/include/asm/arm64/mpu.h | 38 ++++++++++++++++++++++++++++
>   xen/arch/arm/mpu/Makefile            |  1 +
>   xen/arch/arm/mpu/mm.c                | 23 +++++++++++++++++
>   4 files changed, 63 insertions(+)
>   create mode 100644 xen/arch/arm/mpu/Makefile
>   create mode 100644 xen/arch/arm/mpu/mm.c
>
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 43ab5e8f2550..fb0948f067bd 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -1,6 +1,7 @@
>   obj-$(CONFIG_ARM_32) += arm32/
>   obj-$(CONFIG_ARM_64) += arm64/
>   obj-$(CONFIG_MMU) += mmu/
> +obj-$(CONFIG_MPU) += mpu/
>   obj-$(CONFIG_ACPI) += acpi/
>   obj-$(CONFIG_HAS_PCI) += pci/
>   ifneq ($(CONFIG_NO_PLAT),y)
> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
> index f8a029f1a135..38dbf5b2255a 100644
> --- a/xen/arch/arm/include/asm/arm64/mpu.h
> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
> @@ -13,6 +13,44 @@
>   #define NUM_MPU_REGIONS_SHIFT   8
>   #define NUM_MPU_REGIONS         (_AC(1, UL) << NUM_MPU_REGIONS_SHIFT)
>   #define NUM_MPU_REGIONS_MASK    (NUM_MPU_REGIONS - 1)
> +
> +#define MAX_MPU_REGIONS         NUM_MPU_REGIONS_MASK

Not really a comment, but a note. The above needs to be common between 
arm64 and arm32.

I had moved this in


    "[PATCH 3/5] xen/arm: mpu: Move some of the definitions to common
    file" .

Depending on whose patch goes in first, this code needs to be moved in 
the initial patch so that there is less code movement in the latter patch.

> +
> +#ifndef __ASSEMBLY__
> +
> +/* Protection Region Base Address Register */
> +typedef union {
> +    struct __packed {
> +        unsigned long xn:2;       /* Execute-Never */
> +        unsigned long ap:2;       /* Acess Permission */
> +        unsigned long sh:2;       /* Sharebility */
> +        unsigned long base:46;    /* Base Address */
> +        unsigned long pad:12;
> +    } reg;
> +    uint64_t bits;
> +} prbar_t;
> +
> +/* Protection Region Limit Address Register */
> +typedef union {
> +    struct __packed {
> +        unsigned long en:1;     /* Region enable */
> +        unsigned long ai:3;     /* Memory Attribute Index */
> +        unsigned long ns:1;     /* Not-Secure */
> +        unsigned long res:1;    /* Reserved 0 by hardware */
> +        unsigned long limit:46; /* Limit Address */
> +        unsigned long pad:12;
> +    } reg;
> +    uint64_t bits;
> +} prlar_t;
> +
> +/* MPU Protection Region */
> +typedef struct {
> +    prbar_t prbar;
> +    prlar_t prlar;
> +} pr_t;
> +
> +#endif /* __ASSEMBLY__ */
> +
>   #endif /* __ARM64_MPU_H__ */
>
>   /*
> diff --git a/xen/arch/arm/mpu/Makefile b/xen/arch/arm/mpu/Makefile
> new file mode 100644
> index 000000000000..b18cec483671
> --- /dev/null
> +++ b/xen/arch/arm/mpu/Makefile
> @@ -0,0 +1 @@
> +obj-y += mm.o
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> new file mode 100644
> index 000000000000..3ca609ff80cc
> --- /dev/null
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * xen/arch/arm/mpu/mm.c
> + *
> + * MPU-based memory managment code for Armv8-R AArch64.
> + *
> + * Copyright (C) 2023 Arm Ltd.
> + *
> + */
> +
> +#include <asm/arm64/mpu.h>

Can we just include <asm/mpu.h> ?

The arm64/arm32 specific includes will occur in the header file.

> +
> +/* EL2 Xen MPU memory region mapping table. */
> +pr_t xen_mpumap[MAX_MPU_REGIONS];
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> --
> 2.34.1
- Ayan
>
>

