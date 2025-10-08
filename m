Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0A3BC488D
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 13:21:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139493.1474814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6SE8-0003S1-Qt; Wed, 08 Oct 2025 11:21:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139493.1474814; Wed, 08 Oct 2025 11:21:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6SE8-0003PL-Mo; Wed, 08 Oct 2025 11:21:00 +0000
Received: by outflank-mailman (input) for mailman id 1139493;
 Wed, 08 Oct 2025 11:20:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tb2B=4R=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v6SE7-0003PF-8M
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 11:20:59 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc336337-a438-11f0-9d15-b5c5bf9af7f9;
 Wed, 08 Oct 2025 13:20:58 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by LV3PR03MB7753.namprd03.prod.outlook.com (2603:10b6:408:27e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 11:20:50 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 11:20:50 +0000
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
X-Inumbo-ID: dc336337-a438-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mMxAaQUSwXUxiu5F2VmmByTuAFIAOZ9zKQGK1jrA8xytihgyPUvkjSSUR7OVql6PON8is1dB69EkmLtasAnOVTwiAU883CJCSwrp/AguGba18vrA4ru6uKz89QvDPwFvKWez9S5lmTwaYngpEh4QxqxbBa/QD71ZePw9h5Tylqeg8bPU/Ts7PE3+OqL6Z2lO16w09Yr0/kOyxf2wUA6fo/K4fyFr4aHakol1fWi5Un3FQ54TiMh5rMat4gsulqVpb3mU7EPe/qLLJGWqrI1FCfGpkK+Z2vTM/QRGdnpXraGaTAGi8CHsbEqAPfubLe0PHfvb9MnhfPfBO/hzSNjy1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAwfEor0eeNDLD4xKHvx+T6kCTdocB4ZJ+8s3n3siJQ=;
 b=bwxFnKSSDU0ZCOgPp5qNexfRoWLudTLcXtrrBLRaI9WxzdxSAR/pOrgQ8+rNnjBIWiK/SkB0rvfkjK90VGhpBXA6EPLFDIrQfjMmvg57RXTG2PzExsNhTxT3Kqu/ldzFzoRdqTzjkfzQr9ErAsGuyfHNZiWYcdSxNEKaJSE/NrgG7VsaVM0RoRj9xIv8hW5Fc6wnbDVF7VZSOV1JnFxueGUfpu9DD5FIVfcBa87xFvK+vrRwEQ6W1G7YZUQtbOGHBD8T+05kaPdXUDwjriBNQNgx5pFwssTNdOACAadkQO55H9rT4MU/xCKziAh0+I7pJkSP2kZKqd3RTXFfBDefSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAwfEor0eeNDLD4xKHvx+T6kCTdocB4ZJ+8s3n3siJQ=;
 b=ZsuHZkxi2bA6WKAWt8z0rjZ1SaQrecJHFk5DNuukmxJTeYJjq+tsXj0kB8w6/6Re12wn/s1DWR4lnljpS0f/2scXqh/04fxXM+4YFXYIOYhRcxjXw7rX/1y7mPbcZszP3Y5lkJXNCTq/HSOOIfW5fHYKQuJ6hLTADdo0efrnFYU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 8 Oct 2025 13:20:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.21 1/2] x86/AMD: avoid REP MOVSB for Zen3/4
Message-ID: <aOZJDh9vwbcTwBIy@Mac.lan>
References: <8ecbf8b7-91fe-4f9e-9542-7ec22b6a47bb@suse.com>
 <6bcaa5b7-4e34-40c9-85e6-48a0a5869b86@suse.com>
 <485889ed-2820-4bb3-b450-88553dbb719e@vates.tech>
 <f42bb989-c9e5-43d5-82e2-9b6f95c008fa@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f42bb989-c9e5-43d5-82e2-9b6f95c008fa@amd.com>
X-ClientProxiedBy: MA2P292CA0027.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::16)
 To DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|LV3PR03MB7753:EE_
X-MS-Office365-Filtering-Correlation-Id: afc13708-b7a6-41dc-93ca-08de065cbc21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cktLNHk3WGlEdEhLK3NqK3NpRWY3dXdWNHUyTzA5WlpvNEdpM2tyMEtBUXha?=
 =?utf-8?B?aTVuRGJZQVRDaDNZczN3LytYd0djK2duWTZlUHZuMC9XcFdudkV4RVJldHZO?=
 =?utf-8?B?QWxPMEt1WHhkeXFLU0t3WEJwUEFrZW1ZUmEvT0hOb0RBQU5qQXBRVFFIYitv?=
 =?utf-8?B?c0tjMzBXRUgrRmVidS8xZzFSRHVEWm9EVWtIQ0tEUDlrckpGRis2SHd0b0Zx?=
 =?utf-8?B?Nk51RlZ5djJzRHh0SVJDS08vUW4ydWUxMlB3azdleklJdXZMcE12YXF4eVNh?=
 =?utf-8?B?cXVBczFqYWhJWGx4dEZEWE84Q1hmeWloeHRKRjJHQUo1eWFhc1BqMUZ2MzNL?=
 =?utf-8?B?MnBKTkU0SXRmeXJFREIxOThNR0h0bTd0RWRjakJIMmkwL0YxSU43b2pyN2ZN?=
 =?utf-8?B?ZWtGQzVDTkhIYUwwSnJNTUJHNEZGdFlCT0kvb01yTDgwQW1uTm5tZzVmMjdo?=
 =?utf-8?B?YmJRWmhRN0s2TGloaFZGUFp5ajBUY283SmY2WVllRFZPRVFjR1hDdXEzajFW?=
 =?utf-8?B?eG9nMGMwYjZDUEFKVVBOaDVjSkQ2VmIvcndrTWx4SWFLdXZ1eXRlTXpnUXZn?=
 =?utf-8?B?Uk9HN2NMS29qbTE5SzIxN3dmUUVXb2NKMnFqdE9NOG5hRVhwdmlHV3pHQ2RK?=
 =?utf-8?B?ZTRZNXpYZFphR29jMEVzb1YyN0FoL0FDZ25vQzJrZDk3WEFRVjNIbGtTVUh4?=
 =?utf-8?B?RDBXUnlVYmVURFZlRTJnTEtyS3hlcWhyMkcxSjJUTnE5b2QxR0NHMFRhbERT?=
 =?utf-8?B?QVRmblpNOTZmdUZGdExIZlNSNjFFOEFuZHo0cFk2d1JTNTZqbklFYnF1MkMy?=
 =?utf-8?B?b2lkRUhGWnI5L1RXVEJ1SllSWkkwNyt6YUlFRHZyaGg3WDc0Nno5Z2gwYXo4?=
 =?utf-8?B?RmFLQWRWNDNJTTRrai9zKzAxRTcrMUUwRmRpK0RVN21yTTBqbjJ6Tmc0MzNx?=
 =?utf-8?B?YjNVeDlDZ1BCMFhZbjNGWVRMcGJML0pqR1Nwc2dFaDBhZG5pRkZCcGxRVWwy?=
 =?utf-8?B?cy83TkcwUlVrTm5QMFZWc3RyaFo3VjhmQlh4dEhyeWVJazFIU1JEOE5CdGNr?=
 =?utf-8?B?cjVrS2dndzBET2xVY2hIbmptVUlUQWkzWGRuK2d4ejVRcWYvYVAwY2RDTnVX?=
 =?utf-8?B?Q3JmcUVFM0wvZjAySjJTeTkycEM0bVNQUmh4YXpoRGpLSnJ1bnVrOGd1eFZa?=
 =?utf-8?B?RzVRaFFXYnVwWEgwU0VCNm5CQzBvMFlmbm8vWldEZ1cvMjEwTVJaY3J0Vzli?=
 =?utf-8?B?dEoza0o0L242c3ZSZXByQWxNYVpuc1FqMVpId0JtR1BEdXcralNxRS92cy84?=
 =?utf-8?B?cUlhNDdjZXFzenRhV0lHWGhFQS9DOCtldVRsQ2V0SXNWMDZ2dTlvNnBSNHAz?=
 =?utf-8?B?bXpqZnU2YllvcXRIem9tWVZhY2tJQS9YQjVITS9ScDQzMnlwUlNRZit3RVc3?=
 =?utf-8?B?enBnd1hkK0VZbUw0VUZWSm1pNUM3bzE4Wk5rNTRUY01qMDRRYXM5dFkrYkxy?=
 =?utf-8?B?SW5aSHNCOXFQOGRRcXkzc2tLc3Z0NDliWnV5ZVRodEtTTW9WZlplM2JzRXdB?=
 =?utf-8?B?eUM2ODhUUDdlcDJ1c29TaytlTVFMekFOOWwxQ09SZUs4Q0RxVGpqa2FMNGVJ?=
 =?utf-8?B?VXd0ZXBBSVEvbFNxeUFKUVNDcXJ1SEtWNzE1enpMWW9QVGk5UmE4dEF0bFBt?=
 =?utf-8?B?VUlVWkRTZ3FGVHlhazRESW1WUmpFbTMzaDIzR1UxSnhSWHNiK21GNlFCVm8r?=
 =?utf-8?B?ZEExRXJkTCtQSWY1WWNLTFdKcjVWODVtUHl0TnRGdGt1dkR4WHhBZnBxZnFI?=
 =?utf-8?B?SE5Qc3dpcXFCbS90YS9ad28vR1RXdFJkVHJzQzBzRTNWQ2JzS3MxczBRSGZz?=
 =?utf-8?B?cVJsd0cyRjZWakxlUE9haXFON00xSGhxdWZaY3RyTXQ2b1h6UG54MVQzWGRm?=
 =?utf-8?Q?W9A3MEM+S7FoOsgyRKgQVtX0A7zqw7VH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHdxSWttb0hDQlg5Rzl1VFhHTDdOR0FSeVd3NHNZaVRINHAvQlZLbVZvenBj?=
 =?utf-8?B?MU5zTzl5YnZNSU4wNWpWR0VCdE1scXBaTGxwd1ZiWlordzg2VjVRUnBzQkV1?=
 =?utf-8?B?ZXBwbG9UWnkxYU9ibzArTkZGR3llMEczL3g2cFd0cXVQdi8zS2xNWTd6QTN2?=
 =?utf-8?B?ek1UeFB6bis3b0g2Qk5xV3doUlJQcmJhaDFkU0I2R3lDeGswcjJwYngwVGEw?=
 =?utf-8?B?VXZQR0NKYjlFQlBDRm9zU25pVXhNZkZNVE9kS3NaQUlPNy90YVdnUlRtZU1U?=
 =?utf-8?B?R3NxS2luRHdNN2JVRUUwdTFaRHAxcG5NaHIzdUozTEFNTUpjdmVCcjZIZkk4?=
 =?utf-8?B?Wm11Mkl1aEovK24xTy9DVnhFR0E5RDArU0xnaFlzVUlJY0hXUnN5TlgwOTl2?=
 =?utf-8?B?Q3U5TUVaeEFqUjBpUUphMUt0MEVsbGpOVk9FNnlBTUxtTjBFOUpKaS8wZmJv?=
 =?utf-8?B?RkJ5NUJONEx6U3VwTlZVaWd4N3lxalFuUVo0bkVOZ01PQklzTklhMGdoUW5V?=
 =?utf-8?B?R2NQd3kybklxWTB4WEsrdzdnaC9kcVYzVitGYWFDMkdJK2VJOVVRakpTZEJl?=
 =?utf-8?B?N2JUV1BlRXNNRzFHRDNhUEJIQzBjbmJ2ZHJKQVRBQ2FIUjNYSTdIanZyVlll?=
 =?utf-8?B?WDA0SlBHdFFVMElFTE9LR1ptWldFQVltbnBMa0NZKzRneHVCcGp1aEVVTXFY?=
 =?utf-8?B?RlpVanRhckd4eTJkdVdtcUFpcklXcnBFWlI0VFlPc1JwbUVxUllEQWV0RnRW?=
 =?utf-8?B?QWI3L0xZOWJzODhmcHphcXBSSlFJMXN1L3JrYUtRMkYvbkNvVXZSZGZwbkdD?=
 =?utf-8?B?OUtBVTUvSGxaK1llalM0K1Rma2ZoMVdja0kzbzJKQmU2WGd5TDNzM0JLZmhN?=
 =?utf-8?B?Y1ZkWFViUXdpUHptVFppTjN3K3FzVi9UdzJjSEVTV2ViK0tUb24xOU5nU29w?=
 =?utf-8?B?SkpzeDRjOWhGc1ZoTzN0eXF5YVp6Vkg5bVBRUVlua0psd2Q5R0thMVNoU1Rv?=
 =?utf-8?B?ZUEwYkt4T1U5ZzVxeWN4ZlkvZ0sxb2gwWU85ZlBGOHNaNkV0ZTZtTWsrVUg5?=
 =?utf-8?B?T2xLcVN6bUh3a2dBOERtQVUvV1VmSWUyaC9tTnRhb3lYYmw3NFgwS0RMYXQ3?=
 =?utf-8?B?eHY5Z2JGbGVrakJvcUNaaFpZQUdTOHAySFRIcTZLUzNUNHk2UFlUeXM0cG5W?=
 =?utf-8?B?a1p6eHJubGd3UlZLSk5YaDh2VTVHRis3WlJhNStMUkVQWkphS25BbEpIV3Ey?=
 =?utf-8?B?UzRBSHNGcEY4K1FkdW5pcjZ0TTJDSDdQdm5SVkNGaFo0Wks5YmdVTHFxbGE2?=
 =?utf-8?B?WmxqR0hEckQ2WFVDMUdpSU4xTGs3MnlwQWlEbjFldTNpVldTelp1emJCR0dX?=
 =?utf-8?B?VGNlYmRjVjJJUHBpb1ZCUEs0MTg3b3BwcmlWZGR5UTlDamdrQmI4NEowNVJn?=
 =?utf-8?B?UFYxWldMeUFVYSttcVRDdmQzY1BkdVlPTzBnZDFFRmJIejMvTmlUSTJWWlla?=
 =?utf-8?B?NDgwdzh3SEVtbFpFVGNDL2FTZ1dlTUpwTjFrUU55QWZYcVNXOCtFYlBIQzZP?=
 =?utf-8?B?ZFBqdkVrUmFlbFJ1NE9ISmxYbzVJVVlpclBvWGVFWEdKK1RiQWk1dm1nbm92?=
 =?utf-8?B?eFc5RVZOUGJYa2pRRWd5Ujhsb2hiSlc3L2o5RndaQ29taysyTUpNN2FwSHpK?=
 =?utf-8?B?anFUTEJOYkpuUUZqSmdIblorVktvbzZVUE4zVXhOQm9qK040eldqOVBmYnY4?=
 =?utf-8?B?RXlVdDNFa2s4TlZyTnJabzJtbGtZck9ubHBiQW42UHdoTnRkTlFmUDdUaXUr?=
 =?utf-8?B?ZFdRUGhkSGdUVXdxTitUbit3aE9qWHVDb01Ua2xycGNXdzVHRm9rV0tOc25a?=
 =?utf-8?B?YUpVMG5TMTVIZEQzMmttOWhDWUdoL3dFanpxR1kydXk5UHVUMG5CVElEV3lp?=
 =?utf-8?B?eHBHSENxRUk0UTZsNk5EQXZIRGZlV1l2WXZmcHVzT21rdmdtMVBRY21acVF5?=
 =?utf-8?B?cXltNm4wbGhIN2RLMVl4K3RUUkducXVvVys5MEF0UEQrcklzbS9FZ1M0b0hZ?=
 =?utf-8?B?WUJ6RjJyaDE0aVVDYm9FYkJCd0d0TUlROGxIMDZqU1VCSWxOVTBXMWlBM2Vk?=
 =?utf-8?Q?zkJmwT7+YtEc8D4Az1MtOW+gb?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afc13708-b7a6-41dc-93ca-08de065cbc21
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 11:20:50.1009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WhKCLMozzRhqDVLzx1vL1rg4X0jNL+4aCVsIYtzG6OM+VnFK+HBA1M1kZSyTOo05iXxsIkcr2bIY6zzfYxEqTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7753

On Mon, Sep 29, 2025 at 07:35:53PM -0400, Jason Andryuk wrote:
> On 2025-09-25 08:18, Teddy Astie wrote:
> > Le 25/09/2025 à 12:48, Jan Beulich a écrit :
> > > Along with Zen2 (which doesn't expose ERMS), both families reportedly
> > > suffer from sub-optimal aliasing detection when deciding whether REP MOVSB
> > > can actually be carried out the accelerated way. Therefore we want to
> > > avoid its use in the common case (memset(), copy_page_hot()).
> > 
> > s/memset/memcpy (memset probably uses rep stosb which is not affected IIUC)
> > 
> > > 
> > > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> With Teddy's suggested change:
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

It would be nice to have some actual figures whether this makes any
difference though.  Teddy, I think Vates had been doing some testing
in this regard, do you think you could measure whether the patch makes
any noticeable difference in PV network traffic for example?  (as
that's a heavy user of grant copy).

Thanks, Roger.

