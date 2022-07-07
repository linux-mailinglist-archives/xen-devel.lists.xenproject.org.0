Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2524569A64
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 08:21:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362741.592929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9Kry-0006yK-O9; Thu, 07 Jul 2022 06:20:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362741.592929; Thu, 07 Jul 2022 06:20:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9Kry-0006vh-LP; Thu, 07 Jul 2022 06:20:10 +0000
Received: by outflank-mailman (input) for mailman id 362741;
 Thu, 07 Jul 2022 06:20:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+VJ/=XM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o9Krx-0006vb-Cq
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 06:20:09 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2076.outbound.protection.outlook.com [40.107.104.76])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d856b08b-fdbc-11ec-bd2d-47488cf2e6aa;
 Thu, 07 Jul 2022 08:20:07 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7573.eurprd04.prod.outlook.com (2603:10a6:20b:29e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 06:20:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 06:20:04 +0000
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
X-Inumbo-ID: d856b08b-fdbc-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I+PNKrqTCz5JvGyuEe/ONSKq+i5Rkdiy6ll3SsWgL0hFk8SF0fqzK5PS3cZy+owJAc0kARN9dT2H402Kfd2X397vtdGav5v6wGGbaQjugzTb1c/WgDDgPzDnWMnDvEtpRUX66GxiGOvF3p4nrHRBKr/5OCKbuRxcFbTP6tJV9XUqDGJCGIQG4aegPVYkpRIELQPTtuqmjZyrmfWCaraMNVr+YcsbUqLQ1lhr6tXIja6LtL+JFkGDcnyijnP7IhupoK2jzMwJSDMpX7a2oRCkIw2seIFH4zMagAmnz/cwiCZG7tXdEWn05eHSPhyq2A2gj98XfNjbkhlMaF4U8smuEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVWBJU6RNptKvn191Pl9QkBGWV0g1Mhctuqit6iXXtA=;
 b=lhGwAEiZxzXrnnmk27Ejap2Bv51DguvK+wIMYBm3IPzPySeAAMEPpj7sNHgf8VkVgHNdovh930PdWqnh4Yq3iFtaAH68Zz9sFrS2X9rDuRVSSfWStXFeZaI/4bGf8RoUhjiDOCGDbDMtfZh/ynGoBu0xrPiG1skR8Lifvv9EQbbh4xcfCCSP0+MgX12eejiyLrfyXol4sAgG5MffVPLDDsZSrpTGLFBrtD1EzHWudJO5L/99LPhLNdLP0Ewq+x/2JMEz5VhKF6xzyYQ+ck+SmtptNOUeCCxzQLFnN8HV4cVrok/0IRR0gRtBw0sXRlTJZk6RATPGq21CdEIHJZa/MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVWBJU6RNptKvn191Pl9QkBGWV0g1Mhctuqit6iXXtA=;
 b=HGP5BF4PONXrhqwJSYpUim6ly+AtadNM2OLPLTPEmJDBfHREtb3yGDGzqxt3JI8EXadPJUpUMraZQlBYFNhdX/Klwy9ot8kY1ZwZIifZbmciPsr0QnomzkfB6oD4cUQuARo5FlWnEh6ZSTU7EXjiEeqEvXMzSfofNRX1KMSEJ3Bv95Jw/x9Fapsqy+oQnGQyU5qj0qsZKCYfK6t5za4+ehErqSds0mkHwzwyxZ175VePI+tP9+FAS75LVlYOsj5ka+zlVrZnQnePkL4HuMjHgNab9Bswu6c7Xayl9Cf2ynUc2BEgNqm6jRdU9tNlFLTuRK8wezLZuvSELNGkBUTMZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <137b94d8-596a-cdc9-b485-0ac854deab11@suse.com>
Date: Thu, 7 Jul 2022 08:20:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v7 00/14] IOMMU: superpage support when not sharing
 pagetables
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Paul Durrant <paul@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
In-Reply-To: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR02CA0002.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7235e956-ad45-4186-bede-08da5fe0bb1f
X-MS-TrafficTypeDiagnostic: AS8PR04MB7573:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7YCXQl4nIIdR9cv9OuqaiwkKXvr4X/HRAoVZHLYBtw34HYb2FOowzgrvDSbx4xNqC15eHpzMB5eueeVKOm2YMkO13p4sSSitFPxW5clzk4UOTLU60TvLz2ABSB2k0qDSdCRBJDtyN3vwWams0PTpEAQu/a5QImyK+DOszRosq3HFNGLaLdSWWnDux7cJj85+24bzNqwWHb48Ck598wnyjnvBaCAXjTpDglGwyxlll3x5I5yZ7mGDBY7msLrJWBL/7uX4x2Ib32rvBYQpo0G28lq1JTJvZNd5VIN53F6GhbMJhrfprbqIbPWl8yzgNj1KgPmp1nmytlafapC7m6r++awwuVGAHdCQrgGPtp31t1DZM/dAfMfQvareJRgvDpDftXQliciGwZVi9804H1osIsC/ZcQ6i6821PAIJzMl7eMxuMTExhbSDYtRYuhFoGksgUegdAufvKu+Ld5ebFwqVibA52IM9wBtuBxyrb79GwVUemuMfLHuvsroj8v3WwImXdLDZeOJXMgQQyOPJpxIqOrPN5sJhpVQoe+Jtf2AQPb72J+3agoqDlkUa5fpHdt9MUnzkRGmo6IIJMDa4uXMO51vUYi58YozH/tZj9Sjpm1ryiGLueKHTodqjMOticD2s8HcUHAAMutZL4OuvxXTQEGzpTOT5HosT8E1rwrihPtXpYcY+/78JWO6uFHNFplzS450BN17YBtqs6/rCjDe7jcxRJQYDN43dagNtE4Ruen2m4KcxhSReKSdKduNOx98z2905oVIFXDv84JMcGgUhYKryP+bGd41fE4rbY402s8HUSzPNKvyYP64Et4IiXXyvK3hMm/9OGW/TPnJaZzQmGSOJFb2H/1+w/uC3yov1TgNVQAon3yLwWW9FEj3Eatg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(376002)(39860400002)(366004)(136003)(36756003)(6486002)(6506007)(26005)(2616005)(6512007)(478600001)(186003)(83380400001)(38100700002)(53546011)(966005)(2906002)(31686004)(8676002)(54906003)(86362001)(8936002)(5660300002)(41300700001)(316002)(6916009)(4326008)(66946007)(31696002)(66556008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zm11ZmVuZ0dya3VVUW5SaDNzb1VHbVdsNkFLUkszK2UveU1PaXBsOWJ0M0dT?=
 =?utf-8?B?NkVXTWJCRFdURFJBMGF1TGl4L1BTZ1pTMHkrTXY1RzRSQnRJZStkL1JOWVVI?=
 =?utf-8?B?d0tMdFJFTVdETDRuUjNzL0tjcTQ3bjdRY29Ea1V3cU8zc1R4bmdQSUhjRGVz?=
 =?utf-8?B?Mzc4RlBFd3BhdFFFQ25kaHBUVUk3TUtiVGhnZzY1c2dFRkhoT1cxck1nWXpx?=
 =?utf-8?B?R1k1MFRaREJIbUdlbnRZdklpMXg3NDgzRno2ZURTNFVUc1lFd2JXTzBzNklX?=
 =?utf-8?B?TkVMQzI2cStCTzBhZHI2UlJCaGxHUnpCODVBa0F6dTNmbHVOaXZtV2txTkcv?=
 =?utf-8?B?VWVJZ3MvZGV6N1AzZ2hYSjF2QzZwSWJOTnJxdkRrci94UDJoenpobUdYRDgy?=
 =?utf-8?B?enE3THYzbGdFRDRsQ1pBNnNmZE5oY0hOWVIxQ2s0QkFKMFNwSHo1VVF0ZS9D?=
 =?utf-8?B?RjI1NUZTUW93QmszTjJmRW1zWW9ORHdMdmtTNitnNlpCdXhEMXJGU2Vrc01w?=
 =?utf-8?B?TnRuU1JQKzRoZWRRWWhyOW42aU5jN2ZNdTZubG9tZVBSNVdvanBYWHkzSmgz?=
 =?utf-8?B?eHVraGdRSisxOXVWT0tQQUwyaDc1Vy9jOUtzVWxXbWwvWXF1L1BPbWIreDRC?=
 =?utf-8?B?MlZ5RWhBZjVTemd0Z3RsWWI1ZlI4WUhRWUxUdTErMFczOGROekU5WTkvWnll?=
 =?utf-8?B?TGw2MlhQb3QzNVdmcmppYVkxRGVnSFVEYThSdXk4aWFORU4wZWdFMkVuM1No?=
 =?utf-8?B?ZUxIajlrekh4OG5uZTFVNk82eXJXNk5sZzF5QTNmNXRjM092V3hjT2F4U045?=
 =?utf-8?B?TUZjTGYrZi9xdDdTdTI2TUFMK1duRGRFOXpFbll6Tlk5ZDg5RjJld0I3ZDFJ?=
 =?utf-8?B?em52cW9jZml6eng4NkZMNnB1bk1abWgybmJENllGN3VIWkdBanhIcE93YUZ6?=
 =?utf-8?B?S1pvdlk5VFQ3MnNOWEtXVmN4K3UySXFKOFViUG5XZ0dsc0VjZ3VSWFdWUkFi?=
 =?utf-8?B?K0FQMk03UFFlWGNIQXdxZE0wYU5LMi9TQUdmS3BKeTM0R3FMVFJTbzRxL3d2?=
 =?utf-8?B?RUFkQ3ZYSmVYR0FJWlhHYzBpeXJBMDc1Nk5yckdBeVR5cno0M1BlQ2Z1cDJ2?=
 =?utf-8?B?VkFJd095bmNKZDNaSUQrQlllMkVTMmZUOTlmb2tWTjN6QWt4THZMaU1RelhM?=
 =?utf-8?B?b1c3c2hIcWFER3RaV09PZ1VSeDl0dlBhRENNeU5pcEQ0ZnVmdTFWYTR0dDRq?=
 =?utf-8?B?RlhUZjNpaDVCOWNPdUoydGNsbjNLZ250RUZXNllXZDVCM3F2bk16SnlkbkRu?=
 =?utf-8?B?SSt4S3cxVm1rWjB3QkZWMHdGWkxvamx0MkJMRm1kb25CcENEQzd6aFpJU2ZD?=
 =?utf-8?B?N3V1bHVHZzNSQlI2c29ITmRVMmlqemRyamdlUEhud1dWZWxNL0k2eURIb0FL?=
 =?utf-8?B?eHlTTlVwWDdIRmh2Sk90QUsvWU41YjI1b2l4QzRxcU5udjBZQWtEaFFqdkxM?=
 =?utf-8?B?MTF6VHU2eDFpQWIzWXBCODJ0WmVIdVdJL2piMmJnbGw0c05NTmhvOFlZanRi?=
 =?utf-8?B?UlcvdytQd3dtRXNRZlBiOEtYYUltZkpLcUpWNDI2N0krSzRDMldZNHM2bzdk?=
 =?utf-8?B?QTRicnZScmJjNFZOUXhIeC9TRDZZZ3Btdm8xald6N2FsYnYzUUVrVXkzTFlz?=
 =?utf-8?B?UzRVcnZXdUxZRDlXOXhBYUV3anJmS21iZmZGaU56NEhqYjVEYXFaa2M0K0hh?=
 =?utf-8?B?ZFJ6MTFBdFFFQ2w3eDA4MUtEdWsrNmNoWU1sVG5uOWt5VkVyNHpJbFlqenBN?=
 =?utf-8?B?dE5zaWoxUHdBMTEyVzkvclVPMS83czZadFc2Zm53M05HYkVKU0xxNEtzVFhK?=
 =?utf-8?B?eEF2R3pUNDdWMk1vWmhFeml2VDFjblZ6R2dUWVZWWTBqMUNDSTgvTE9OQXlD?=
 =?utf-8?B?clVZSDVXRDJ5dzhqdi9sRFhZR3RoRitMcm85ajFVVFlhM3I4enNLb1Z6cXlm?=
 =?utf-8?B?eGZybjJrQjF0SmxDSTVMMk1kOUNMcS9hTHNqSXJPNmVlZ2VGZXBhNHAxOHUy?=
 =?utf-8?B?L0x0bEMvQnlEOGN1TmxsSUZ1RDkyck1FRlF3REpYNnptamorWHo4cUFvT1J1?=
 =?utf-8?Q?lmNvqrwR90OBEvMHDuGaxofJ+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7235e956-ad45-4186-bede-08da5fe0bb1f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 06:20:04.4798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWuGByRI73gYmEnri1PZQBX7qvdvvAt2KMXu5WeYRzwvhbf85QL+t+P9Q0XFDA8uVHij2jgohvBSEPh174S4HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7573

On 05.07.2022 14:41, Jan Beulich wrote:
> For a long time we've been rather inefficient with IOMMU page table
> management when not sharing page tables, i.e. in particular for PV (and
> further specifically also for PV Dom0) and AMD (where nowadays we never
> share page tables). While up to about 3.5 years ago AMD code had logic
> to un-shatter page mappings, that logic was ripped out for being buggy
> (XSA-275 plus follow-on).
> 
> This series enables use of large pages in AMD and Intel (VT-d) code;
> Arm is presently not in need of any enabling as pagetables are always
> shared there. It also augments PV Dom0 creation with suitable explicit
> IOMMU mapping calls to facilitate use of large pages there. Depending
> on the amount of memory handed to Dom0 this improves booting time
> (latency until Dom0 actually starts) quite a bit; subsequent shattering
> of some of the large pages may of course consume some of the saved time.
> 
> Known fallout has been spelled out here:
> https://lists.xen.org/archives/html/xen-devel/2021-08/msg00781.html
> 
> See individual patches for details on the v7 changes.
> 
> 01: iommu: add preemption support to iommu_{un,}map()
> 02: IOMMU/x86: perform PV Dom0 mappings in batches

Paul,

without meaning this to be a ping, may I ask whether - with Roger away
for the next two months - you could find time to review these first two
patches? I think this would then allow the entire series to go in.

Thanks, Jan

> 03: IOMMU/x86: support freeing of pagetables
> 02: IOMMU/x86: new command line option to suppress use of superpage mappings
> 03: AMD/IOMMU: allow use of superpage mappings
> 04: VT-d: allow use of superpage mappings
> 05: x86: introduce helper for recording degree of contiguity in page tables
> 06: IOMMU/x86: prefill newly allocate page tables
> 07: AMD/IOMMU: free all-empty page tables
> 08: VT-d: free all-empty page tables
> 09: AMD/IOMMU: replace all-contiguous page tables by superpage mappings
> 10: VT-d: replace all-contiguous page tables by superpage mappings
> 11: IOMMU/x86: add perf counters for page table splitting / coalescing
> 12: VT-d: fold dma_pte_clear_one() into its only caller
> 
> While not directly related (except that making this mode work properly
> here was a fair part of the overall work), at this occasion I'd also
> like to renew my proposal to make "iommu=dom0-strict" the default going
> forward. It already is not only the default, but the only possible mode
> for PVH Dom0.
> 
> Jan
> 


