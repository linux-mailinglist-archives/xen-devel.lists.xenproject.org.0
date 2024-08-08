Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FADA94C232
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 18:02:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774416.1184867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc5aE-0001oe-5V; Thu, 08 Aug 2024 16:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774416.1184867; Thu, 08 Aug 2024 16:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc5aE-0001mB-2t; Thu, 08 Aug 2024 16:01:46 +0000
Received: by outflank-mailman (input) for mailman id 774416;
 Thu, 08 Aug 2024 16:01:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eqo7=PH=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sc5aD-0001m5-Dd
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 16:01:45 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2418::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80c62e76-559f-11ef-8776-851b0ebba9a2;
 Thu, 08 Aug 2024 18:01:43 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by MW4PR12MB7431.namprd12.prod.outlook.com (2603:10b6:303:225::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Thu, 8 Aug
 2024 16:01:36 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7828.024; Thu, 8 Aug 2024
 16:01:36 +0000
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
X-Inumbo-ID: 80c62e76-559f-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mdCYdEi8JVSP/O1pMaf3OX6Uj6/9bfoXUA+6EyI9IMR68pWAcQoKhv36+7xF3yOCBx6y44wCcFYpX0yU7t4Yxa0DKmoNY0NG7RgC8gmF/4/n9Cz4bAKn1dS+x51x3xuxGrvE/yBghftSQqu5VGZR1xsGbkN8iLv8AseJZR8ikaXyJOvLtrquADjDxXQI4TW/6VQjPmdfvka53z5u/EUi/BdWpW9PpYVeXzkTd17kYQcu8FtnLm6mLacEsRlhccvaFccaPbjcGdBA2wfczQZtVvcV6JMQnhXXEKGU5M82quYMb+uF87S1dwk3e09vgkjd1ijIDh8Wls0WC4uCrViReg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9owt9l/+ovjFQFTkr3gl2Z+TBC/JDcIg0p3bQgTS/c=;
 b=Mz9X6YzfMWv29E0lS38BUwdMh+3EDO/gTIgTvJWmFycectcQAXNx9BnwjdTJ4YBczMg75i2uCRVIrR8Z51/yh7X89MU2ilHFM7qoZ5fmvxlJ5EZs5pWbXv4Ff8skVPIN+55J6nX1UF4IqGOh/rGdb3Ssqgk8W93wK4jT3aZ4iM2e5BxzFNJbYCNkZu0bfDNYXhwK0ndjpBJ83cGoHrbDtuHr5FGDH6r+dRZBmfiOkjZudTS0ZjfTYmKGOLfRObJlvyshf+OyamHX55DXbvxeLKn1pOQuJbKA2sz3usmMErKSsonc30w18QOcZMjCdjUtCm85Qs3MKB9uR8v0xOUVHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9owt9l/+ovjFQFTkr3gl2Z+TBC/JDcIg0p3bQgTS/c=;
 b=eOwFChT8+GJZz3MKTxjF3mpzLjf687YazZ17Kh9E4Iq5N0tYIHlpGun0ilyuT4uyjfE3cqBGUEnnmQAOLa/lPM6FwFeVq9dVH5KMMvv2OVPk7QUDXP0qBW2nKroVTsRXoU4hCOMBICMkStyjGMUEu/ayL9Yvrd35dIHV1YumdtM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <3d51c302-e0a7-49bb-af4a-e16bb2f9a0f8@amd.com>
Date: Thu, 8 Aug 2024 17:01:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] xen: arm: Moved domain_page.c to MMU specific
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
 julien@xen.org
References: <20240808120936.3299937-1-ayan.kumar.halder@amd.com>
 <20240808120936.3299937-4-ayan.kumar.halder@amd.com>
 <b4094b23-0762-429d-b067-f41e5d86481f@suse.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <b4094b23-0762-429d-b067-f41e5d86481f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0623.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::18) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|MW4PR12MB7431:EE_
X-MS-Office365-Filtering-Correlation-Id: 1984dd74-255e-4672-042f-08dcb7c36161
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dm1uUnMxMmY3QkFxOFk5V0VZbnJKVHlERkFtZUxJcVJsdmNadmdsZGg3dTZI?=
 =?utf-8?B?L0d3dlJJMFdDbUwxaWhIN3FnSTB0bmZkQzBEUk4wTnZ2bFowYzNvSGhkL2VZ?=
 =?utf-8?B?d3R3T3dWbzZ2MWMrZi9JUnoyTmxQUCsxTFJ2MWpUYVR0RjlHSTVpaVNNN1FY?=
 =?utf-8?B?QXZkWHVvbEg2Wm5aUEZWL3FPeXBhRGtXMm5iNlpyczBvcWNRRnM0ckxjQm00?=
 =?utf-8?B?VEY4SFZVZU9WRERUaVBBbkk1ZlYwVUxGWUtrRTI4eERQYlJXMFdUY01OVlZC?=
 =?utf-8?B?VkJ1TVBaL1VsUENOMHN2TjNnQ2hVVUEzK1ZCQ1l5ODhMdEFaTmtuZTcvemJl?=
 =?utf-8?B?T1VPN1lWVzlYR0hiK3FnQWcwazdUbjFCbU1xTzdKa1VoS0xNbnlFSjc4eUM4?=
 =?utf-8?B?L1hJY2cyQmloZmRaN2tWZDhabVVuKzJNVy8zUU4vSGh0NnZnbStjS3dNNXJa?=
 =?utf-8?B?VDlEZjVCUTN4Z2MzZlpCRmNrUi8zRFhWWWdFYVR5em80U2FNZDY4VGtpNmU4?=
 =?utf-8?B?UUxBY25jN25BeGZDTk1rZkdnL2cvUWd4bTVWYTRkRzFNa01KeiszUi9ycU90?=
 =?utf-8?B?dVlNNmEvYXROZlVQMjlXVHY3OWVHUHZ4eXR5d0QrYS9ob2JPcDMzSksvblEr?=
 =?utf-8?B?cmlJMGxCNkxLcXFBS0FJcFNab0VUNzFNY3E2NERQL0w0NDZUQXFkNnA5cERi?=
 =?utf-8?B?dnRnblA5cEF5OGJ2MkR0N3Fuc2xYQTVzKzRxT1RwbjFoaUJxT3VxcHlLV0VK?=
 =?utf-8?B?Q25mRFEzVnNJemJvVTBBMFFCeDJMNHpGQ04yaTBGSWdYRTBOVG9qNG5uTXdv?=
 =?utf-8?B?eUZQT0o2MGJZUjM3cXJXRG5QbHFSSjVkeTVMcFFoTlpCVEM5T1NHSnAwVitB?=
 =?utf-8?B?bVhGVzZ6ZWYvMzRqdFdjV0w3RUN4bjlpbU02OUlhSURtZk1aSzQ0dzBGUGpq?=
 =?utf-8?B?Q1hCYklnZmlxVlVCTFJydGR0cG1UMHdvNWlOc0J1NEt6Yi83UHRSSVBKM21w?=
 =?utf-8?B?MnhjRGpkaU1UMWMxR3gwWUpHeEk1Q2RDUDVhd1V2eXpRVmk5M2hKNXVDbzVr?=
 =?utf-8?B?ZGhHUHVHeTliUm4zWHFsOFpRL01pdlZoRWVoZUR1SnlLb0RFWFMyRTNJSGlz?=
 =?utf-8?B?Z1pZK0x5dEFDUEpucTVZVjY2L1lEL28xUFZLZVBvS3ptK3V5aGVDL3N4WE85?=
 =?utf-8?B?WDBKZ01RUzNxNHUyeENGWUhWZ0tqbW9xSGc3RmRWenRrQ1dSRDhKWXpiNzF2?=
 =?utf-8?B?aG9PUjZZVDFhQUVQdi80blRnaDNaa2REU3ZzUEdleUprWGFySE00eDFyWWlG?=
 =?utf-8?B?WXJwQmZWSmFrODlIa3pUUW41Ni9sOW0xbjZvQ2NrYUtwQ3haaFBadDVod2lJ?=
 =?utf-8?B?UXhNWXZqa2ZZWkhJUDVWT0E3UGdMa2cxWXREaGhkNmlGYXlhOHpNbUU5ZmYz?=
 =?utf-8?B?Z1kvb0pUZHlId2w1NXhMWXUyeDdQbGdreFNnZW1ETzIyVy9zMTd0VTNydWlv?=
 =?utf-8?B?ZVI3UG5Eek9rQVIwd05hWkpUd3YzTTNNaWRzWWZQWmtRRDJQaUZaNDNnUXRM?=
 =?utf-8?B?YzVvbXN4R0J6ZGcxazlCajFNVWxtdDg3YlpKNEhZTnQ3S0NSb3VHek8yNjA1?=
 =?utf-8?B?Zlc1UlhrNHpudWVBdkd4M1FQeGpBWGE5NnN4ZFU2eGVvdm5RU05JTDFibmM2?=
 =?utf-8?B?YmRkWlozS1FtMWl0ZEdCME1DRUhoV1hmYXdZZnNhNXBjM2FDa1VUTE9UaVJn?=
 =?utf-8?B?NzVlUjd3NmhLUFZ4QndFMjJZakFDZmkxRUw2bnZ2SkRQRVVDRVU0aHVlaXZm?=
 =?utf-8?B?NFYyMytxREFXT3JEQjNuUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmVwenp4Y2NpcDhsV2JQOUVuWmNwZUtMeEpIUFhnRjZhSk1JRWhFQjZ2YjU4?=
 =?utf-8?B?Sy9kSlRaNU5lakZNOGwrZ1pUK0U3TDFqWmR3MjJUZndYUUFZVWJOQ3BTM2xu?=
 =?utf-8?B?ZTllSk0wNFRTaWVMNEEyWnF2c0R0L0pUR3RRdlpDaHR0UWFlYVRwV3NsclFt?=
 =?utf-8?B?YTRKdDcxU2JXOC9JaFRoMExyQjNZa01Lc215TitWUkZBTnFQelVwNE8wR3g2?=
 =?utf-8?B?emttZ2lTc3NxR3krQ3RPQ0tiYkxPY3BVcUd3M0dqeGJ1d2hWMktvVzBRdWRD?=
 =?utf-8?B?N0VDQTNhcW9DcElnMHd0M3RLRnY2RkYxK2RGZTNFemVzN2FLSVlQVHY2bktw?=
 =?utf-8?B?SkEwNytWbzlUZDhXcUFWN0RUTFBjK0NLZUs5ajE0dllCbFB5VzNhczZvNUJF?=
 =?utf-8?B?eS91YVNUMnNUMkNlaCswTjR4aXZ3TGg4L2FLcXh6WGRHRlpFR3VLVStsLzlR?=
 =?utf-8?B?amhpQ3FJNlNLVXJQWG1OSjJXcFFsb1NFcXNaNnNvQlFBVEZVYldGbURkT1o5?=
 =?utf-8?B?Sm9DTGRvZUl1SzVnNkQyOFVUakpiSUxtei9aUGh1NGNyaGlGeXdyOHZUTVpy?=
 =?utf-8?B?bjJQNVFOVFpPVjdWV2FLZHN3ZHFMVWpvbzdKQjNHbXU5WFB5anlNbDlYckFp?=
 =?utf-8?B?djBEQkdqMldCSk5uR3ZWdTdjaEF5YTgyUUV5TXIzODBnc0Z3N1RyUkpvcll0?=
 =?utf-8?B?dGtEMm9YTXpXZm10UWdoWlFLWC9RMGRzM3ZrQWJJdy9xam9PbFFLTDlxTUw4?=
 =?utf-8?B?RWMxN0wraW55KytXYitBRHN1SnVudVdnZG56OHJvUkNwMEYvZk9iditFT3VS?=
 =?utf-8?B?Q0NFeDJ4SmQ0b0IyOWRyc1dMWHZmelpmK21vaXdRMENNQS9mQ0U5RmhrTG80?=
 =?utf-8?B?Q01hamIrdncydHJydTZMK2xPMGtWejhGeGErb1FUUUFSVi9BTmxka25IVWlx?=
 =?utf-8?B?dHA3TWxvWU9tMEZ2aGlhVXozM1d1OXNIOHRyWERBRktHQlJuSm1UYlUxZ0Zu?=
 =?utf-8?B?SC8yaks2Ym5YeGpnWUg1VXZ0MzNyM2pSM0x5eVBhZlhhc0lwL3JJS2FMYmUx?=
 =?utf-8?B?OWJmcmNta0lCb2I0WWtOUEwvcXRmeVZ5RGpFcGcrVzRWdXhNNjEreVppUXpi?=
 =?utf-8?B?K3YyRVFNM1pqKzg0SENDMDhWVWVHWVRoMGNhRFVNVGNjbUFKMEJiM1RrYmFt?=
 =?utf-8?B?aFRibGxpNWJEZGlwZVVjSHFzVXk3K2dQdHRNeUw1S0ZzUHBFdGVDc2dFT2tU?=
 =?utf-8?B?aWZBMHBUSTN5dnRIMTRiWklEUGhmeWVUZkVsZ1FBSFB6aUxlWndkRHQ0ZDIz?=
 =?utf-8?B?VDg4eGE3cjFZbVFFemtjTUduOGdYMVdJWFhVOXFWcDZKRzhLdDFsRGo0eU1N?=
 =?utf-8?B?N2RHT2VDK2pudXA5MHFNdndXelV2d1RjMVRta3cybWVLK2VWd3I1clBRb0JU?=
 =?utf-8?B?R0srUWsvdkdMNXFWNWRwUERpdlZPMVFDbkhrQlRNbDNUcHlUVEFEK0c5VFRi?=
 =?utf-8?B?eU1XNFJNRy9kTWN1eDZyMTRueXpIWW4zM2g5Y2g5Y2MzenNUWVN4cDdueGxy?=
 =?utf-8?B?Z3ZqUHdpTGdJRm5BNUxLWnFkemRmMXI2MlRSSCt0QUVmMGtERGpBSXVsTkFj?=
 =?utf-8?B?emdFSHRtV2g3K3hJaU5ja0xZbGg2TTd6elV1SzBYU0ZpaWdpUGt2UVMzSmt6?=
 =?utf-8?B?Y1EzRmVTUkhvZS9sMXlTbmoxSjExSGxHNnJKNHIxcGcwemdjdVBoM3FBQXla?=
 =?utf-8?B?RzlXTFJUdUZvTzRhRWszT2hqdmR1UzBnQ2p5QUVaSmJ5TjdIbVhpWWhXRk10?=
 =?utf-8?B?dDBQVVJmNk5ZRlg5NEVhZE56MCtjOGZUU2VkY1NVVTdFdlBQOGtvZUQyZ2ph?=
 =?utf-8?B?TEtWU3FrVHMzSGJQbkkzTU0rUDhzaHN3eTFCV1FPWGdyeUNWeTNyVnhXY2Nm?=
 =?utf-8?B?VHI2eDIza1RuTlErNkpuMkpKaFU3NjZ0UUZpaDZ1cGNMdEFzZ28wVFNvVGlr?=
 =?utf-8?B?bmVkU3ZybjJQVlR2UEhaMERCU1Z5enN3SUxCZ3Y1UUE5OWZ3TmdJMnc3YzQ4?=
 =?utf-8?B?YU5yQXVIb1YvbWttZUp5TkJQSlVjRURSOFVMalN1TklhUDgvMGZVOWx2WXlB?=
 =?utf-8?Q?f+PI9JiGx4TJZNU3pYOTk+f2s?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1984dd74-255e-4672-042f-08dcb7c36161
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 16:01:36.1132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LS4Jm1DpmcXpBHzkuHAf3Gu5s0cqcjqxFvuIxJXpKYYOXJaoPX8YCVa1wV9KGG+gpBLifzeMofNd7cSFHOGSCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7431

Hi Jan,

On 08/08/2024 13:51, Jan Beulich wrote:
> On 08.08.2024 14:09, Ayan Kumar Halder wrote:
>> domain_page.c has been moved to mmu/domain_page.c. The reason
>> being this file implements MMU specific logic for mapping,
>> unmapping, etc domain page.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>   xen/arch/arm/mmu/Makefile            | 1 +
>>   xen/arch/arm/{ => mmu}/domain_page.c | 0
>>   2 files changed, 1 insertion(+)
>>   rename xen/arch/arm/{ => mmu}/domain_page.c (100%)
>>
>> diff --git a/xen/arch/arm/mmu/Makefile b/xen/arch/arm/mmu/Makefile
>> index 67475fcd80..2cb44b857d 100644
>> --- a/xen/arch/arm/mmu/Makefile
>> +++ b/xen/arch/arm/mmu/Makefile
>> @@ -2,3 +2,4 @@ obj-y += p2m.o
>>   obj-y += pt.o
>>   obj-y += setup.o
>>   obj-y += smpboot.o
>> +obj-$(CONFIG_ARCH_MAP_DOMAIN_PAGE) += domain_page.o
> Don't you then also need to remove the respective line from arm/Makefile?

Yes you are correct. I missed it.

- Ayan

>
> Jan

