Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0189DA82D48
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 19:10:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944485.1342937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2Yvx-0002oz-NF; Wed, 09 Apr 2025 17:09:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944485.1342937; Wed, 09 Apr 2025 17:09:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2Yvx-0002lz-Jr; Wed, 09 Apr 2025 17:09:53 +0000
Received: by outflank-mailman (input) for mailman id 944485;
 Wed, 09 Apr 2025 17:09:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IAcD=W3=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u2Yvv-0002lt-Sw
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 17:09:52 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20631.outbound.protection.outlook.com
 [2a01:111:f403:2415::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 716cc014-1565-11f0-9eab-5ba50f476ded;
 Wed, 09 Apr 2025 19:09:50 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by BL4PR12MB9506.namprd12.prod.outlook.com (2603:10b6:208:590::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 17:09:45 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8632.017; Wed, 9 Apr 2025
 17:09:45 +0000
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
X-Inumbo-ID: 716cc014-1565-11f0-9eab-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqwD0+Ci14EnjH1oBbYdayDrcnpFJgwU8pQvG+wxAXAuI+4BVgrjcmuZlVyJa8nUJtKMElWWuJnplMzRe/2k4nsS4Nx7mh8SxM3Q7tCBNUpIfR8fdurRiksBCVzFnTXzsqTdxxZAVLGCDVCzSzGtbd6BvxdpsXLnePP1Rf6NZV1UOahYq96selu7rqjqDRkR3gmsEfyYZ6hL4eybN8vVKUttVWAd19p8BrVs0kcODcoKms7peouWVfgzotJCMAKToPZzz/1YTK7er4n+XCjoPJYC5dw0AlU79f4vUWpESrx4CTA6I7QiBgZXvNisvLqTDql3KPz4qL7EDRknrx9Xjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7pc0p5Aoo6cpK3WUpX+JS+wOWn4+fHkMGhs0gB+c9g=;
 b=xIxem5yLbSxsoNAQEfOvD2q/CSGiOpMD1jFbFQCVObNxP5wIgLnB+DHwVVxzoRCtgX0eiHgDpJghBs/kwEmEHP+CdJzhUtjpUaY7SiWd/+EDSITSICRZWEtgkwoGwyzocGngGJmn3iLm/sDeP680Z/LQc0ztsi9WCPlBhH/oKEP7r1/sjLmBnSICUZ0DKhA16KKYx69c73HtUGUovOB5ETJXwgT48WNIJ38mLZ+xK352XvqM6Kxunt9z0keKGFfDVrYGBhwgRIYkb2IvrHQQrZjfOHf0maW6K+8bXJ97dnZ54G3wLw5D2kSHbAn/ryNpx/4JyBp5VJX0xBBhMkmXqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7pc0p5Aoo6cpK3WUpX+JS+wOWn4+fHkMGhs0gB+c9g=;
 b=ShsY6W6Q6u8lX4urneK31Vaq79zoM6jUIvVAFZhE/0SVc7531T5wTjImPBzNvAPeG7CrplmAGKjSoPkVdeMmLaziPPpg8UF3cRFb2+ZMl+gh1+SJW7iiClhoBR2Z/GuylqbBTQZxQKv94+O0ot6aW87Zsm+wcVdnPVDOpRf07Kg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <be18ae1a-7ede-4ed6-9168-d20a2ae7055f@amd.com>
Date: Wed, 9 Apr 2025 18:09:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] xen/arm: Move some of the functions to common file
Content-Language: en-GB
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250407184443.1790995-1-ayan.kumar.halder@amd.com>
 <20250407184443.1790995-2-ayan.kumar.halder@amd.com>
 <d03fcf63-d946-48d6-b96a-a6b54d3dd840@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <d03fcf63-d946-48d6-b96a-a6b54d3dd840@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::23) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|BL4PR12MB9506:EE_
X-MS-Office365-Filtering-Correlation-Id: a89e69f9-164b-4c33-3e75-08dd77895356
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dDZsczRkdXRxZmR4VmlFcTZKWjdDRzlodUVTSFRJbTZPTGcxYVV2RXI0Q0RZ?=
 =?utf-8?B?dVF5aGpBZDdRRFMyWGRKb3dSTFhuaGFBVEd2ZWU3WVlOWU11SXlhRzFWcE85?=
 =?utf-8?B?L05oOEJuWkNEL0luOHFRMmltYkgyRGttK014V0I3T2hISEJ3WFh6MWlxNzIx?=
 =?utf-8?B?MHZGTUVEWHZWWm9oNFFROFlxZGIydlpyK1pwcDB5eWhjQmRlMFZyQlk5NFlq?=
 =?utf-8?B?Z0cweHM4MWg1eU1kT2RlWXYwSkhtRzdiMUs5YUZwd1BvL1NFMlE1SXU4UHhV?=
 =?utf-8?B?cDJTZCtkRVkxZDE1d3ZpWld4MFpwajREVUNFemowclZOUHdlaUd6bHlmMEV1?=
 =?utf-8?B?UmlheHN2R0toaG1IbFF0cHRZRVcvek00bGdvMVZUYnVyQUEzUjEwckRLS3pn?=
 =?utf-8?B?YzcyQzhuaUdnV29TdE1HMHkzNmJYZGhWVEQ3QnY2TXFoc2c5a1hHYzg0TnlS?=
 =?utf-8?B?ZS95M1M2YVY3ek42ZFJ5Zi9mTWo5Si9kZHdhaVlXUjJVZkRwWEFDcU41allH?=
 =?utf-8?B?NkJMZE1kRkp6b3pwb0RRNE9mZnY2Qzk3cVp3NGFNUzAwUU83M2ViemV4clBH?=
 =?utf-8?B?dHl2YjVCRHhtMWMwOFlnMERxR2JtMWVhTU9XQ2p1MVF6bGRRNjhBWjVvcWlU?=
 =?utf-8?B?em1YS3lZSUpRR3NhWTJ0azd3N1ROZHhwYnU2NlJ5bnBBTVpEQ3RmUGNKWWpt?=
 =?utf-8?B?YnJPV2tQZ3RhMjE1NDd1VVlITHVvNjVyakMrcUxPZGt3T1ZmNDlNVTNPN3JY?=
 =?utf-8?B?cEM4OHh1K1hxRzljOHIwd2JZU1ViS3hsYnZmYm5hb2pVTWNFb2ZoQlBoSGZZ?=
 =?utf-8?B?L09FT2xBemtmcllHY09OYXF4eU5sOU1zUlgvS1VjQUVPT3o1clU1cmZFSzFm?=
 =?utf-8?B?UzEyMERXT3JBWEduMmd6S2c4TFQwLy9HL1NuRHYwT2FOQnh5S1Mvc01LcFhP?=
 =?utf-8?B?YlkvMkZoaWZQelVnNEJDZWFNaVk5Q1dFcVNhZlJxNW5XeWRrUjhRMXJKcTYw?=
 =?utf-8?B?bTV1QXVMbXBuSTc1MGl0NG5nbDZxdjRCY3QyTnF2Z2JMVWFIYVhkN0lpaG9q?=
 =?utf-8?B?cHltaFFuZUFHNWFEczFlWFV6dk9HSEMxa2c2M21nNk9GOFBIN1FoY0FVZTNm?=
 =?utf-8?B?KzExdGJCbi95eXB6dDdzd1dRZU1aOVZRZnZhQ3Z4MTVoTDZ1dHpqbWJYQUI1?=
 =?utf-8?B?ZDlFMFlETVI5UWppdS9HMW1kMkJLWldrRUR6WUg3emxLNUJPTGcxTVhEbktH?=
 =?utf-8?B?N1hCLzQ1MTNtM0VOdHByUVVUc2c3U1V1MDRlK2lINEVFRlAwNnZyOXdEVHB2?=
 =?utf-8?B?TERhR1NmeHZJQXpwdS84K3lIUkwwb0sxVnFUMnQ4VGVqVVFsaFpwMHd1YUVI?=
 =?utf-8?B?SG0zK1drTm40djVCY0MzUHR3a3h2WVNiU2JBZE0yTDh0ZEFGaG82ZVFWWW8w?=
 =?utf-8?B?SWRBMWN3V2pQMG95NVdpc2dGZzl2SXd3UlJ3bld0V0xzZ1VlNDIxYlpSNkl2?=
 =?utf-8?B?SXR6d2FaK3M0L2JDblFqcnlZWUZvNU1nQkRyY3J5V1hTTjN2L0dnMkZsREJv?=
 =?utf-8?B?U3VtVmdvTDUwdXh3ODVXdDVyYnErKzRiaGVKazYzTCtqZWNQMjBvTXBIVTRq?=
 =?utf-8?B?c0ZNN3pDTHZXNnc3ZTZZbzlOOHcvSGw3NEYwZ3hGQ3ZlWmgvU2k0Q05XUEYx?=
 =?utf-8?B?QUJtK3FNODVwUEVVb0VLaFN1ZjVQWG1kN1E5TXZ6QkxDMnAyMWx4dklDUW1S?=
 =?utf-8?B?U0gyeHFEeVlpU1QxeUYwRG1sMXkzVVloUjgxbWh6WkVUV2NVKzFYeEdZUUxh?=
 =?utf-8?B?TjNTbzQ5b3VMaG5mQlZIYnpzN0lqc20rNHhhRm8zV1lPaHZoNU1jOXdsUCtO?=
 =?utf-8?Q?2Hjv40WI2IkE7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SG9aZk9RTWw2R0Y0N0dHamw1Y243OFlaZjduUVJtOWgydjNrKzM5OFF5M0hG?=
 =?utf-8?B?YjF5SHh1QzNlS1hkZFh4TUpYcXRZVjdGVEdpOFArVWlsbVI1aW9QS3VuUkdO?=
 =?utf-8?B?cE9xaUdWNXl4eFB0bDVTd0pMaEl4VkVrVDF1Qy8venVOcUNGeW9tSHVQSm95?=
 =?utf-8?B?YjFGOEdjZVZEM0lOL2JrVkFIMXJUUlVMNnkxR0hTeUxkdCtaUVVZODd3R2d5?=
 =?utf-8?B?U3RCNjJWMno2VFY5Q0I4VC9sTGc0RkIwQnl1Qmh6ZXJycVVyRUZnRXVyZkVa?=
 =?utf-8?B?bnRhbzlLb0doZGl5RVp5MEx2SnBKZmhWYitjNFU2cDQ5eCtIWW1rSTRIWU9W?=
 =?utf-8?B?bGtFa3dFaUwyWThGYUUrZWsvZmJNZ1dmK2V6U01adGZERHAvbXhZVFg3U20z?=
 =?utf-8?B?SElFUEsrT25IUTFqYXc2L2xKSzdrS0dxMEkyWklNdWg4WHlpR3FBS2FyV1lz?=
 =?utf-8?B?dHl1UWM3VnAwNlB2RXhhNjVQQ2phSExZdEVRS3NVRFJMQzNGV1NXWUtGZUxx?=
 =?utf-8?B?d1hFNTNtVjVadDlLUHltTVp0WEV3OGxBV3hvN09YSFhkODdVOGJBbUsvMFhV?=
 =?utf-8?B?TS9PTnJ1ZlpVMW1tck4xY1dxYU9wL01uUVJFS3ZZZTZoNjR6V3M3RmZsNWhn?=
 =?utf-8?B?MU02UVZDbHNwaGhyblp2MUxXT1p0MlUvQU91My9welZLMWVZRHlrcXZJYlNa?=
 =?utf-8?B?amg3cStjUlBFcXkzS042cjcxQVBSK3FNOUl2eU00bGl5NzhPbENVOFMzbk1z?=
 =?utf-8?B?UUJMR0VUWTFtQTF2bFpTUjlmUVJtZ0VtRSt4ZDlwYTRvU0FBSy9UTXNDajlt?=
 =?utf-8?B?bjZRd3JWV2QrMzRwQW1SU2FNVUw1QVhUSkhtQVd6Vi9wb1hTbjUvT1phOW51?=
 =?utf-8?B?cWVLZDdKdlF0ZTNwV3Q1RWdXU2hFMndIczlVQkZFTUtYNllUQ3daY25IZmR6?=
 =?utf-8?B?dUVJSEVrekNIL3M1b1VDR3FMc2ZsNG5SYXJtMHMzZUhTMTVrVnpqMmpkRUNJ?=
 =?utf-8?B?R0I3bEUzbUNyMFJSSlI2T0xDUHhSK1MzSVV3V2g1UzRSRUUxelB1dWJXSFRa?=
 =?utf-8?B?c21KNkJRTmYzK3BSRmY0ME5zcU9pbG02YnN3TWY1WVA2MmsraU44dkFKd2ZD?=
 =?utf-8?B?RldheSsreDFPUjlndDEyMG1RdGdlT0QyUDUwM1Y5RkVZdHEyVml0eDJJQWxY?=
 =?utf-8?B?T0Y1NHBPdHhDV2krYmtCaWNybUhIMHRwWUhWOWYzNlB1d0crMWNtZDUrenkz?=
 =?utf-8?B?L3RzSHJzZjNIbFdrYzRLUGtkNTVRSVM1d250QXlZTCtBSlluUmw0eVFXUVNN?=
 =?utf-8?B?bGJFNktsN0pRbU1ZYkpOcEphMStNMDlNQ2FxOWtnb1c2Rng4cmx1RzVQcmlN?=
 =?utf-8?B?Q1JydzBsd2tWZUFMWWd5SnJjeEsvdUk5R21KbnFCRXd0ckNYZWpua1RhZ2dC?=
 =?utf-8?B?VWZPYUtDdWFUNWdEUlZUUS9JNEQvQmkyanNkcGppbElTRUhuTFFKalZhWU5a?=
 =?utf-8?B?VnJ1bHlaSURQSXJuaXhrbitxWTA0ZEhYclUvYVRVeENzdko0ajZWN21OcVM2?=
 =?utf-8?B?TXY0YnU5c2tSY2tvZTRab04zUm5nQ1JFWENNRkIySTJWTWI3TWc2bXBDanc1?=
 =?utf-8?B?VmpmMG10QUpwNm9GMnNQakVtLzQ0Y2tjVDB3bmgxM3FPenpMa2hXaGh4Yjhp?=
 =?utf-8?B?Zit0M21FcWFmcnFmRnVscG9DUm85aGJqcFJXc0dxeFBCbDBDOHFnVEVNb0ht?=
 =?utf-8?B?T3g4Q2Y1c0h6TlRnVk9CbVBaUUxVa0IvQUYxTFRTTERBYVFRb29wSitvUG9r?=
 =?utf-8?B?blowaEhuZnJOTDBZZ2xwWW12UmI4SGtMV2ZHMlBIei9pQlVvZFVhV1pWV0JS?=
 =?utf-8?B?bFhFdEl1T3JvTG8yVS9ZR3E1NUpWeXRPb0VMZHVYUldKbDZSMlFTc3YvNFlN?=
 =?utf-8?B?TzFPaUVsT0FzTHg2Y3lCaVBRWlRIZnBxOUIvSHIzSGIyY1dQTWIwRDNmR3Zz?=
 =?utf-8?B?aG1HMTdTYTNZUnFFMkhyamlqTmJjM2xMZURTKzZ5eXE1MXBMSWwvenlwdXd6?=
 =?utf-8?B?andWcU40SWsvd0NiMHBQVDllRGJlMFgxczZzTFhoSWZrM21velo5NVRtT2Nx?=
 =?utf-8?Q?XyTT4DKaOTfp/uht2Zpx0UgeC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a89e69f9-164b-4c33-3e75-08dd77895356
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 17:09:45.1256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qbANjr7X0ikxblrNw8GYGkHEB7o17MK0BbMTkryfZyQ4dodOEKqVD4BWkVDr9joF2UEtHi1Fhjudu8o0M83iRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9506

Hi,

On 08/04/2025 08:33, Orzel, Michal wrote:
>
> On 07/04/2025 20:44, Ayan Kumar Halder wrote:
>> Added a new file common.inc to hold the common earlyboot MPU regions
> NIT: Describe your changes in imperative mood
>
> Also, my understanding was that this file will contain common constructs not
> only regions related. If this is just for regions, then it's better to name it
> regions.inc.
>
>> configurations across arm64 and arm32.
>>
>> prepare_xen_region, fail_insufficient_regions() will be used by both arm32 and
>> arm64. Thus, they have been moved to common.inc.
>>
>> *_PRBAR are moved to arm64/sysregs.h.
>> *_PRLAR are moved to common.inc as they are common between arm32 and arm64.
>>
>> Introduce WRITE_SYSREG_ASM to write to the system registers from the common asm
>> file.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>
>> Changes from
>>
>> v1 -
>>
>> 1. enable_mpu() now sets HMAIR{0,1} registers. This is similar to what is
>> being done in enable_mmu(). All the mm related configurations happen in this
>> function.
>>
>> 2. Fixed some typos.
>>
>> v2 -
>> 1. Extracted the arm64 head.S functions/macros in a common file.
>>
>> v3 -
>> 1. Moved *_PRLAR are moved to prepare_xen_region.inc
>>
>> 2. enable_boot_cpu_mm() is preserved in mpu/head.S.
>>
>> 3. STORE_SYSREG is renamed as WRITE_SYSREG_ASM()
>>
>> 4. LOAD_SYSREG is removed.
>>
>> 5. No need to save/restore lr in enable_boot_cpu_mm(). IOW, keep it as it was
>> in the original code.
>>
>> v4 -
>> 1. Rename prepare_xen_region.inc to common.inc
>>
>> 2. enable_secondary_cpu_mm() is moved back to mpu/head.S.
>>
>>   xen/arch/arm/arm64/mpu/head.S            | 78 +----------------------
>>   xen/arch/arm/include/asm/arm64/sysregs.h | 11 ++++
>>   xen/arch/arm/include/asm/mpu/common.inc  | 79 ++++++++++++++++++++++++
>>   3 files changed, 91 insertions(+), 77 deletions(-)
>>   create mode 100644 xen/arch/arm/include/asm/mpu/common.inc
>>
>> diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
>> index ed01993d85..4d76a3166e 100644
>> --- a/xen/arch/arm/arm64/mpu/head.S
>> +++ b/xen/arch/arm/arm64/mpu/head.S
>> @@ -3,83 +3,7 @@
>>    * Start-of-day code for an Armv8-R MPU system.
>>    */
>>   
>> -#include <asm/early_printk.h>
>> -#include <asm/mpu.h>
>> -
>> -/* Backgroud region enable/disable */
>> -#define SCTLR_ELx_BR    BIT(17, UL)
>> -
>> -#define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
>> -#define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
>> -#define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
>> -#define REGION_DEVICE_PRBAR     0x22    /* SH=10 AP=00 XN=10 */
>> -
>> -#define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
>> -#define REGION_DEVICE_PRLAR     0x09    /* NS=0 ATTR=100 EN=1 */
>> -
>> -/*
>> - * Macro to prepare and set a EL2 MPU memory region.
>> - * We will also create an according MPU memory region entry, which
>> - * is a structure of pr_t,  in table \prmap.
>> - *
>> - * sel:         region selector
>> - * base:        reg storing base address
>> - * limit:       reg storing limit address
>> - * prbar:       store computed PRBAR_EL2 value
>> - * prlar:       store computed PRLAR_EL2 value
>> - * maxcount:    maximum number of EL2 regions supported
>> - * attr_prbar:  PRBAR_EL2-related memory attributes. If not specified it will be
>> - *              REGION_DATA_PRBAR
>> - * attr_prlar:  PRLAR_EL2-related memory attributes. If not specified it will be
>> - *              REGION_NORMAL_PRLAR
>> - *
>> - * Preserves \maxcount
>> - * Output:
>> - *  \sel: Next available region selector index.
>> - * Clobbers \base, \limit, \prbar, \prlar
>> - *
>> - * Note that all parameters using registers should be distinct.
>> - */
>> -.macro prepare_xen_region, sel, base, limit, prbar, prlar, maxcount, attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
>> -    /* Check if the region is empty */
>> -    cmp   \base, \limit
>> -    beq   1f
>> -
>> -    /* Check if the number of regions exceeded the count specified in MPUIR_EL2 */
>> -    cmp   \sel, \maxcount
>> -    bge   fail_insufficient_regions
>> -
>> -    /* Prepare value for PRBAR_EL2 reg and preserve it in \prbar.*/
>> -    and   \base, \base, #MPU_REGION_MASK
>> -    mov   \prbar, #\attr_prbar
>> -    orr   \prbar, \prbar, \base
>> -
>> -    /* Limit address should be inclusive */
>> -    sub   \limit, \limit, #1
>> -    and   \limit, \limit, #MPU_REGION_MASK
>> -    mov   \prlar, #\attr_prlar
>> -    orr   \prlar, \prlar, \limit
>> -
>> -    msr   PRSELR_EL2, \sel
>> -    isb
>> -    msr   PRBAR_EL2, \prbar
>> -    msr   PRLAR_EL2, \prlar
>> -    dsb   sy
>> -    isb
>> -
>> -    add   \sel, \sel, #1
>> -
>> -1:
>> -.endm
>> -
>> -/*
>> - * Failure caused due to insufficient MPU regions.
>> - */
>> -FUNC_LOCAL(fail_insufficient_regions)
>> -    PRINT("- Selected MPU region is above the implemented number in MPUIR_EL2 -\r\n")
>> -1:  wfe
>> -    b   1b
>> -END(fail_insufficient_regions)
>> +#include <asm/mpu/common.inc>
>>   
>>   /*
>>    * Enable EL2 MPU and data cache
>> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
>> index b593e4028b..3ee3715430 100644
>> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
>> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
>> @@ -462,6 +462,15 @@
>>   #define ZCR_ELx_LEN_SIZE             9
>>   #define ZCR_ELx_LEN_MASK             0x1ff
>>   
>> +#define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
>> +#define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
>> +#define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
>> +#define REGION_DEVICE_PRBAR     0x22    /* SH=10 AP=00 XN=10 */
>> +
>> +#define WRITE_SYSREG_ASM(v, name) "msr " __stringify(name,) #v;
Agreed with your other points.
> 1) This macro is ASM only and you don't protect it like the C macros below. Why?

I have a weak argument for this. :)

You can write ""msr " __stringify(name,) #v" in the C files. However, 
you cannot write "uint64_t _r  ....." in the assembly files.

If you strongly prefer, I can enclose this within #ifdef __ASSEMBLY__

> 2) Semicolon not needed at the end

Ack.

- Ayan

>
> ~Michal
>

