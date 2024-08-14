Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A404195197C
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 12:56:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777078.1187273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seBf5-0002WT-J8; Wed, 14 Aug 2024 10:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777078.1187273; Wed, 14 Aug 2024 10:55:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seBf5-0002U8-Fm; Wed, 14 Aug 2024 10:55:27 +0000
Received: by outflank-mailman (input) for mailman id 777078;
 Wed, 14 Aug 2024 10:55:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hw+B=PN=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1seBf4-0002U2-Ec
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 10:55:26 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20627.outbound.protection.outlook.com
 [2a01:111:f403:2412::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2e00016-5a2b-11ef-8776-851b0ebba9a2;
 Wed, 14 Aug 2024 12:55:21 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by CY5PR12MB6624.namprd12.prod.outlook.com (2603:10b6:930:40::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Wed, 14 Aug
 2024 10:55:17 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7849.021; Wed, 14 Aug 2024
 10:55:17 +0000
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
X-Inumbo-ID: b2e00016-5a2b-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZwC/WLiZg8pcapwRDK1mpCgq7Fq7LP8NLkBmqe8qpoEirNc/e4VOlqmVJJkjYXQnq/umJkFWhTaq2o4IOlPlzfnL1iG79jxktEaMu34JX0Xt90n8qcYDCn0PJygivt8U1VNqZNQFD+7NJRGwPNVH4w+ef1qUHsS50rXy4aREDSH/b5wVJadVph4OzB/gQNxP2DuSKZDoInxMy7PB7kOwl/kcTzBUGZ0K1ADQcQdslEDBdgbHgkAHf1GuelgfMGz8d1NIrLSby6aUMIC9te2LH90pimTVqCpybF5LP92x8A3vSn432w7Au5jmw5AC40TELZZk9jP40Vi8COr6I04qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZ6aYQCSSeWAEmnwaJqeYdqgFbYEQBBfmwZFCKA+SJg=;
 b=SEt2uI1fpaq2xC6l8uJDYqMxJZdSkdPoWDwmroM8yECWq6I5vyQG+qYzucKHBCmjLKdCCf81Qpr6v6aULKS8XPBq6vBiP4dTCzFdybOCC2pC/DoV92vOjSt/7Eys5C8dZwzTIEiqh2qwPdZj16Tedd2waeG6NOK8Bg1yLw8yGGK6IPKWowJXMwLk3i3F5kzRzGnRPw+0FhC2JfnCdICNeFJm9k+TTcJXzgqTT//CZQTS50rvvGON5XjW8/wphkVoD5/A6buWUuRgOaSAvueOi300bhJ9We4tFRaX2g8YOso47XIiJeIkwFB1PmFr5GLyRjlSgHUy28CKmdhngWGihQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZ6aYQCSSeWAEmnwaJqeYdqgFbYEQBBfmwZFCKA+SJg=;
 b=x7ACRslS0Q9v/HkY1y+5RBjO6zjDypA4Cdd7jE3ghIzw4jSpkpAa9+txbEJtWouhqCfqaONuenmKhWMrMCcm+V/1sxUMGij2JbGAzq4q1HSwKlgzyxSnTZzCKWsGQiyWjDcPFvU/j7axgQt8ZV/40ds7Q603VaQZGk8FAACg9Do=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <ef789757-8c03-4f97-9bfb-8ec2fd2f4ca2@amd.com>
Date: Wed, 14 Aug 2024 11:55:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] xen: make VMAP only support in MMU system
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, Penny Zheng <penny.zheng@arm.com>,
 Wei Chen <wei.chen@arm.com>, sstabellini@kernel.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
 julien@xen.org
References: <20240813171356.46760-1-ayan.kumar.halder@amd.com>
 <20240813171356.46760-3-ayan.kumar.halder@amd.com>
 <6d333d94-80ad-485c-b024-a45a388b96a4@suse.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <6d333d94-80ad-485c-b024-a45a388b96a4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0301.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::13) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|CY5PR12MB6624:EE_
X-MS-Office365-Filtering-Correlation-Id: de5e0c70-47e7-4cdb-1690-08dcbc4f94e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0RQWkFjekZjam10VFcvd3F1dy9xNXl2VHk1Q0JFbnNWSlNZN0xOcEZPYlVs?=
 =?utf-8?B?N3ZNY0p3YUc2VzluTWplMEFWZFhpbUtGSERTVXBmajIzMEdEaWwxWmx4SlZw?=
 =?utf-8?B?UWErRm9jdVUzZzJITzJSYTdVUjlwYTliWjJRdUZJcy9oMGUxbmp0SUFDcjBF?=
 =?utf-8?B?OGZxbWd1YytGemZ1MmFWZVBLZFNIT0JMcWw4ODY2OHFTM1VYd2k5V0RGbFVY?=
 =?utf-8?B?RHN0Z2tJQ3JWZS9KUlo0VDg1YzdwRDM3blpkVFZ0QmZNSlpFSDNCaGc4Sjh1?=
 =?utf-8?B?enYycmpwcHUvUDljSWNiTmlFdWJTT0FYZm5NeDJQMDlTcndvajZ3U1ArR2xs?=
 =?utf-8?B?TmFkQlVoeE1IRlNLalNhdDlVUnpvNUJtSFd0QjFyQ3RraEhkYjIvbUlGRHNV?=
 =?utf-8?B?dldSM1duVkhuZDhaY0lDd3lscW8vdG0rSnB2YmFOSXpKWVA4YmR4endtaWRj?=
 =?utf-8?B?K0RLQWFpWUYrNkF6bWttUVhSc3EvQXJudmJpdlR6d1pPUHhqb0ZJNGE0TUJ4?=
 =?utf-8?B?dnc4RFVOVFdXOWJrb1FvMHVKbnN3NVJMNDRXc0ZmbkN5cFphcGQ5Q3FqcERk?=
 =?utf-8?B?VzYwMWhubWFuTXM0M1YzUElJdnl2MHNCVFdLZDF1WWZ2Sm84dnZtTXB0bVg1?=
 =?utf-8?B?L05zQllqNjcvOGI5clpMb2xNRlhCUEJIUmwvRzRNbXVBZzBYbG5GY05PY0kx?=
 =?utf-8?B?WUNCSUtLM3BWbEhwM2xGczBJMDlFMXRNNEhtOGV1d1hhY1BCOFlKQ0ZlRzNU?=
 =?utf-8?B?YUdYdkQ5L1U3ME52M2JkU3hNYjE2UElENUkzUTZmQ2tUdGtuNW5yQ0VVMkhB?=
 =?utf-8?B?MXZvV2xVR3RDenh5emowa2xZYmdoK1NlaUo2SmszVjhvMnIyTmx4SGR1aWsv?=
 =?utf-8?B?eUNSSlBEaGo0RXhjaFcydzI4RUlGbHZ0V3dYSSs4R3l5TDhpQzN2eWlJV2Yy?=
 =?utf-8?B?SzJWc1libXFIL3RZdzIyakhFWFlON1hwNkZEaitJRzd0cTBhSEphTFMzYWZ0?=
 =?utf-8?B?TnFqUXBRUTVIdnhiOFk4SnVjTGNyanNocXJrT0hhT1FodUdTQUYyZTBTa0Q2?=
 =?utf-8?B?dDFPYURHOVIyek5FV1FBdmprcThPSFp5VmttamUvNzByQ0wzUm4xWWJtcXp3?=
 =?utf-8?B?VUFHREJmK1IyMkcwUVM3Rno4akxZU3RVcHZKUm9GQWNtbTJQRmFKRFRVU2NO?=
 =?utf-8?B?UCtYVUwzQ1J4dVRPMEhYWW5mZ2J0ZG50bXdTYlFUOTVxcWRjOWZmK2Z4aUtz?=
 =?utf-8?B?ZElmVU1YTEd6Z3hjRHlNaXh2ZCtrOTgvdFU3QSs1S0FpMlNXZVU0SkFWK0Rj?=
 =?utf-8?B?Y0k2MFBqMy9PK25tVTRqNVptTlRKa1AwRE81czl3SUNyOURRdHAzYnFseWlM?=
 =?utf-8?B?ajdlOU1BdGp3TmhwTS9SdTZVSDViTVI0ZGZ5NXBteldNMnhUMW9UTGY0NjB3?=
 =?utf-8?B?b0Y5dW0vd3lpL0VONEt0U25ydkRvTER2S3VIUEZLV3JTY2gxQzFxVk10SFRj?=
 =?utf-8?B?WHJDQTUxODRwcUlyUUROSm1JWXJ6RzlmYWxCMGp0dXQ3dnEyTkVDOWdlNGND?=
 =?utf-8?B?bUExZFh3eHBob1l4bzJqdnltcGsvamNKekdCYzJpUnJlTVB6K2ZqYkdEaTl5?=
 =?utf-8?B?aUpoZThXTWM0MGpabEJoWTJhVHZUNUEyeTdkVkRwalNTUjRuOXRSc055SEdI?=
 =?utf-8?B?S1FiSHdDMlA3YlQ2WnVIN2tuSTA0RlZXRmF4UVlza2xSak9Gb1NGdEVSM1VR?=
 =?utf-8?Q?IJMJZQyHKhcotGty7k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUd1MmdwWU1VOHVuekl5WFJpUVBqYlVDSjllVG8yVjYwV2twZC9KL1o2eUFl?=
 =?utf-8?B?Sk13T2pjMWwrYU9HVTlvUC90U2R3bEZOZTZ4UjN2NlcrK09EMnFrRXl2c0FG?=
 =?utf-8?B?VXo5Mzk2aWFTSVJkdnc4VVB6OXlxZHNscWxZY0ZwUmJIUktFR0FqL0tJUndn?=
 =?utf-8?B?S3llVEVDeGNkckdlWmFrenFOTDNqZFoyWi96b29DaFFjbmpYTmtLQjFSKzR5?=
 =?utf-8?B?QjB1Q2o0QkFmd2lJQ05sRzk2eXFxSVcxbExka1MrTWRpU2VrT21jdVN6UENB?=
 =?utf-8?B?ZlpTcUQxVVpLbCtMb045NFloa1hJQWJjcWR0SXNpTksybFErN1BCNHdVZVhR?=
 =?utf-8?B?bHdrWm1MemNvRzhLcnc2aFQzYXkvOWl0QTZyaDBmYXBva2J2R09VTFZUbHpp?=
 =?utf-8?B?OHlydndScGlxL0s5UmYxQlB2QUQrNkxOR2NjOUJ0OTRSVjZENWZidGE5NEl3?=
 =?utf-8?B?MGlPWEluSlRsNXdlVklIditUQWJEZHhDQXB2QXZCUytPRWJYc2tIZlIzSTRt?=
 =?utf-8?B?SlhEMHNyMmtSVDQ3MStlS25oOUkvZXlyMWRjNHZwdXhtRTFqVFBHdGxDbTZE?=
 =?utf-8?B?ZVZMRDFPRjc2RGVuTEhpZGRRQ2VadzhTVVU0TlFBTEdWMEJobEZ3djNscHBX?=
 =?utf-8?B?VFJaTkw5RnZ0OFFVVWxSWU5rQURrOGlOU0VZKzV2VWhkd3BBZTBYVExzZ0I1?=
 =?utf-8?B?Wk1sTExSY3ROdVdoQjJjMjlKQ2dRekdLbEx0by9FclRGRndYN2YwT3BVZjN1?=
 =?utf-8?B?WXQxN0lPN2xXOHozWHFWS2ZSemk5aVJzU2EyemkwSXFxYUdFWGpvRm9nY3Bi?=
 =?utf-8?B?TndMT1lTQ2hwRDhqaGliZFZoUXFQUFh6ZmJjY3dHZW1VQ1o5UGJwMFE0cEJ0?=
 =?utf-8?B?c2VaM1hOZlBaanVyQzlYLzY1ZjJsbnllZytzMWdvOG93QnRqR0tDWmRqVVlG?=
 =?utf-8?B?UUxRRGpRaGwxSDIxSGlXTVFTRXM1eE1lQVhJakZhREZmQVZ3SFEweHVuNjNH?=
 =?utf-8?B?SVdHVHZuamtMVE90RDd6Vm9wOVc1N1g5bldWeUhPRGJjRHZienNVelU4T041?=
 =?utf-8?B?Y2pGSmtjSEw5SmZnajJpT0oyOFMwV0RVbW0vYzg4UzNSU3VNQndUcllORUMw?=
 =?utf-8?B?Ry9xOGw3UU9tdDlhYStHS2VQVnZTUFpTU0ZBdS9qdllXM1RlZGtIWDJyeVc1?=
 =?utf-8?B?eEhkek9kTVQrWHhHS3pkUytVeWhPMjQyTzJtdXBNS0oyd3RsajBOYzl6OFJr?=
 =?utf-8?B?OWV0SlZ6c0lZRVhiVWxXSFY4VUlLbzlpczhOYzJBT1Uyd3B0ZlZzbklkYUJJ?=
 =?utf-8?B?S3c2YVZvMmhtSHh6NDJ1UHBNU3N3RTZhSC9iTWE2K2RHSFNMbGRPbFdVL0dS?=
 =?utf-8?B?S3dQRmlYYzVhdU84QTRMVURnSXR1MmlmOGRtNDJKcWV1OFJQUFhRQi81TDYw?=
 =?utf-8?B?M0czeE9rbVVFRlJKRjM4ekJGYXk5VTV1Z1o0ZElaME0vMXhQOXpyNUtreFlj?=
 =?utf-8?B?U1NvU0sxUHpoV2VjeGk2MmppaktXNlNscGp5TEpNakpGK016Qzk3QjdvTlZF?=
 =?utf-8?B?ZTU0VEVnU09ZVTVNVnh2d0w4aS8vaW15UXFTTWFhLy9OMGFIeGlYWnEzUlBO?=
 =?utf-8?B?YnhSOGg1Y0NpdmhnWFJwRE45aVFGc29KTUxhYlBBdEFsUjRKMG9waDhOazlL?=
 =?utf-8?B?MzZUSzNDMnpuY0RGcGpQTzhyM2lFcVpaRTVWQTAreHZCdmF5VytqUXJFRFBV?=
 =?utf-8?B?U2JyV0Q4eDA2QnZ6Vmp6NDNMQ2xlQ2pLWkNaWEMvTlFHOHd3Vzl5V0VKVWxX?=
 =?utf-8?B?WlNKd1YvUkVGZnBESnk0Q3JCQS9EWjNPRVdXbEJwdmlpd1l2N1FYVWEzVFdY?=
 =?utf-8?B?L2xHbWdxVWVZS1lFejdML3VNK2x0Qi9TVG1LMmg3Y05LZWVlMmJSZ3BudFNo?=
 =?utf-8?B?QWpTU1BES1ZzS2pWS3pRY0dVKzFkejk4MEdNWlJkQzA5QVlvS2tVTlk4YUs5?=
 =?utf-8?B?YXlLWElQdWU5Tjlscnc1azBUOGptNzhyODlCYTF2R3pTK1NSUlVtS0k3NWpP?=
 =?utf-8?B?SmJOZ0ZGWTlLRnFEMWJqMEE3cUhMRG1xeDBKRUZFOE9uR2FYNi9GbWFrSEJj?=
 =?utf-8?Q?hTB2OWjCiwyVAn1I+bm79Bi/8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de5e0c70-47e7-4cdb-1690-08dcbc4f94e5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 10:55:16.8510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1TucBlWT198FDzMqOFalY3mp17Jowh0ki93sz3VJpEuNMM/KpTzl7wzOlnOQSDh29pBM890kj/eBiH/TxxkeaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6624

Hi Jan,

On 14/08/2024 07:37, Jan Beulich wrote:
> On 13.08.2024 19:13, Ayan Kumar Halder wrote:
>> From: Penny Zheng <penny.zheng@arm.com>
>>
>> Introduced CONFIG_VMAP which is selected by the architectures that use
>> MMU. vm_init() does not do anything if CONFIG_VMAP is not enabled.
>>
>> VMAP is widely used in ALTERNATIVE feature to remap a range of memory
>> with new memory attributes. Since this is highly dependent on virtual
>> address translation, we choose to fold VMAP in MMU system.
>>
>> In this patch, we introduce a new Kconfig CONFIG_HAS_VMAP, and make it
>> only support in MMU system on ARM architecture. And ALTERNATIVE now
>> depends on VMAP.
>>
>> HARDEN_BRANCH_PREDICTOR is now gated on HAS_VMAP as speculative
>> attacks are not possible on non MMU based systems (ie Cortex-R52, R82).
>> See https://developer.arm.com/Arm%20Security%20Center/Speculative%20Processor%20Vulnerability.
> While I'm not an Arm expert and hence I'm likely missing aspects, I question
> the one (Spectre-BHB) vulnerability there to be sufficient to draw a
> conclusion towards the usefulness of branch hardening. I would advise
> against encoding such a connection in the Kconfig dependencies.

AFAIU, to address 'Spectre' like vulnerabilities 'branch hardening' was 
added.

See https://lore.kernel.org/all/E1fNadD-0000fz-9r@rmk-PC.armlinux.org.uk/

And from 
https://lists.linaro.org/archives/list/linux-stable-mirror@lists.linaro.org/message/F4MGL4WT2R7T54NLRDGKFRQNSXF3DZGD/

Spectre is valid on MMU based systems.

Thus, I would make 'branch hardenining' valid on MMU based systems only.

Let me know your thoughts.

>
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -1,6 +1,7 @@
>>   config X86_64
>>   	def_bool y
>>   	select 64BIT
>> +	select HAS_VMAP
>>   
>>   config X86
>>   	def_bool y
>> @@ -31,6 +32,7 @@ config X86
>>   	select HAS_UBSAN
>>   	select HAS_VPCI if HVM
>>   	select NEEDS_LIBELF
>> +	select HAS_VMAP
> Why in two places? Also please respect alphabetic sorting here (if this
> hunk is kept, which may be the more consistent approach) ...

My mistake. I initially thought user could select one of the two. 
However, "vm_init()" is invoked only from xen/arch/x86/setup.c.

Thus, keeping 'HAS_VMAP' under 'config X86' is dufficient.

I agree that HAS_VMAP needs to go before HAS_VPCI.

>
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -77,6 +77,9 @@ config HAS_PIRQ
>>   config HAS_PMAP
>>   	bool
>>   
>> +config HAS_VMAP
>> +	bool
>> +
>>   config HAS_SCHED_GRANULARITY
>>   	bool
> ... and here.

Yes, it needs to go after HAS_UBSAN.

- Ayan

>
> Jan

