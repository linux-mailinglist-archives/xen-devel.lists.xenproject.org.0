Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72958CDD0D8
	for <lists+xen-devel@lfdr.de>; Wed, 24 Dec 2025 20:41:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193145.1512118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYUj1-0007dg-JI; Wed, 24 Dec 2025 19:40:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193145.1512118; Wed, 24 Dec 2025 19:40:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYUj1-0007be-GT; Wed, 24 Dec 2025 19:40:47 +0000
Received: by outflank-mailman (input) for mailman id 1193145;
 Wed, 24 Dec 2025 19:40:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wdbR=66=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vYUj0-0007bY-5K
 for xen-devel@lists.xenproject.org; Wed, 24 Dec 2025 19:40:46 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f87be5d-e100-11f0-b15c-2bf370ae4941;
 Wed, 24 Dec 2025 20:40:44 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by IA1PR03MB8045.namprd03.prod.outlook.com (2603:10b6:208:595::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Wed, 24 Dec
 2025 19:40:41 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9456.008; Wed, 24 Dec 2025
 19:40:41 +0000
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
X-Inumbo-ID: 6f87be5d-e100-11f0-b15c-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AHmS0Qxv8NM8ogVJ214CRTiklg+9YeT5PcrjQe1BrnXUh5QbOZyagyOMXMfcy+i9Rt2lBQOxO/7je5SnGwES5mpE6zQAZsRd7aKLKbHCSyc7jWNq9Nbo1PGvnIcfeNId2YFl3Ic6JEt4Xnnw+INc0hOv/BFfJfLp6tGNIIXPKEXMcejy8dRlB+COFSPLHdpln7aIOF2dRxtRG8YdvZxeyU5wK3lC2XyRw9/S5595p0cwIz10NMg2xPbazwT8MJ0XbRtCviEKlm4303J4BGF84a4dbDuXZF6llRHk3cF2HJ6Kk1ISCpv6TL2hiBKCqHEDEXty8BT24gNZgluy3tqdhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0oWZInO9D34HewG0R9RMvVW/2/72U7bRMWj0mVYbtM=;
 b=EIfIVVXjZ5fU49oQoC7xMwtCJOUHaAFT7NVRTwiYcdhN2wdR6g5rPq9ntOvIxrfIU2AQwPWeUAW6joeX6JSMdIYspW/SUoKVJzq/r3PrmtZddntxk+tBVRJS59liuRb8+KEggnTJ+lAWiCL4yvgm9BSup7iXCgLXusmcI5e7luMjMmZmnKqxNZZ8VnTmv4FVTsyP3NwZT87+Tv+M4addSJ8OCwvpmz7QZwi2kc9ewW+6L0REPD18JQFAtPxdpYVpEHYdpcc//WFdWJm6nj0F3HmCSbwh5zZXxG9WeZ8cc9ZdDwSsgoBxXXw6YSZ6ytwb+pQUWi8OMoAAIDZeen68UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0oWZInO9D34HewG0R9RMvVW/2/72U7bRMWj0mVYbtM=;
 b=ApBOUq9ZrQPl/DBlITlSOjkJPh9QebIAad/q1lRYSU80em5c4PfE+VPpRZPypKGM9UEm584Nbn6kXiFNRv8iijiGOWg69C4R2XPHa9RQHkel6zH5hSKy62eZ9h41JGoq2uvp9KD6+OzX/f4WZVEoXgKBPYlGaS7MSI8j2B0LUB4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/2] xen/mm: claims related fixes
Date: Wed, 24 Dec 2025 20:40:33 +0100
Message-ID: <20251224194035.60173-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PAZP264CA0099.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1fb::7) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|IA1PR03MB8045:EE_
X-MS-Office365-Filtering-Correlation-Id: fa7b76a9-2b2f-47d8-57a7-08de4324527d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R1dkY3NhUTgzYmZSZTNVMjdBa0dQalFFUVdidm9oRDBlbDdHU081RUZXNDdm?=
 =?utf-8?B?bFBRN01FWWNBdEZMYWFTekJwTXd6aFVuVm5pZGhYY2VmMmNvWHZTaXp4NGlD?=
 =?utf-8?B?aitNYXNCM0taUG5UbUp4R3QweHA2eWZsbE9OMzNGdHZwcVkxWG9OL0FtaGpu?=
 =?utf-8?B?UGEzZkdlVW5KVG5Eamd5N09nbi9wcG11Ni8yaVhwZFJTN0xTeGJKWERFT2hs?=
 =?utf-8?B?Rm8zeXVHL0ZnMFVRblBrMjBSU3g1c3BjUnFQcHpXRjM4aU45N2czVFl1VmlM?=
 =?utf-8?B?bmd0L2x3YWhydFhDUzdpM3AxZjhNR1dSNUQyWXczYytBQU5LbWp4bnZuUnhT?=
 =?utf-8?B?dHhTWmdCTzhkSjVEVVFJaTczWDMzMGVLbE5tbXd0VmIvSngvOWd3UFJYajMz?=
 =?utf-8?B?K2p1dmxVZVJlbS94WnZacGZzZUJQNWhuRm5qU1lSNTdhRVAvRFhqd2VUdnRG?=
 =?utf-8?B?T1Y2RnRSanJKdHlUT1R3ZHltaCtNTG56NFNlRURXOGlPWFljWUlBZXdhZFlq?=
 =?utf-8?B?VlpwOFNkdTFXRTVlaExDT0ZpYWw3bjdJZm9VQU1VWXhLUFo1M3VpV0sxVEZG?=
 =?utf-8?B?SzB6a3NGMUtMeFgxRElld2lVcXpRRmVLa1hRQ3FVbXJTUm43VUwvdURVSlRU?=
 =?utf-8?B?YkU4cjh0M2x5OFhkTndUc0wzOVNxU2JqYmRjOElDWXYxZ1lrN2w4OWg4elZ1?=
 =?utf-8?B?Y3JYdjk1cTMwdmlLQmZzc0kvWXhDcEpWWEVWdWFmQ2o3Tm9DVW9TeG44U1ds?=
 =?utf-8?B?WWVKUEcxL3dHL2FkUWxnTy84NTlzM3AwYk4rU0ZBTnZOb2JXUTJ3Y21XZmhO?=
 =?utf-8?B?Q1RDL1NneTdjbzBWRUxpcEVTbUFiMmE2UmhLY05LNG51aWdCRDlyWThjeDVI?=
 =?utf-8?B?cEZqSmxCVVQyY280aHNOUHUxYjU2OUlmVHFyUFA1WmtpVm1CSU1Fak13YVZI?=
 =?utf-8?B?NnNBdXFFbzQ3YVpRREJuMVVnSERqTWtHSks2ei9rVy9SWGFyNEpFbDJvMnBw?=
 =?utf-8?B?aUQ4a3MvblAwR2xhM0MvWmgzNjFUVjdSajFJa2E1ODBDUGtTWkJHbVNPTTBZ?=
 =?utf-8?B?a3czUjY0L2NPd1J3T0pkSGRhK1l3VXFaMVE2cUZNWUFIREZxMkpwNUJBK0dF?=
 =?utf-8?B?RDN5LzEwZHNMS0dvSURkSjljVFU4K1pUM2lnN3dUU2ZXL282L2lYdGQ0elZM?=
 =?utf-8?B?bXA5M2NtZDZwVzkxekVZVmZQWFEva3FvcmVDVi9IemNtRytWSlVzV2kzUEZt?=
 =?utf-8?B?NDBQcDdMWTFPb1VucnpUOVZXWDU1bGxYUzZWVzF6UW9DclpneUQzNGtHS3Jl?=
 =?utf-8?B?cC9rRDhyQTE2ZjVISDZCcEJDMDh4aWZTY1JlbDJNdkVtZ05zcXE1TjIvZXNu?=
 =?utf-8?B?Wk8zTGJ5MXNMRjZFZ0pJWUNrRUYvaDJwSG1DU2J4UUZONm1VQlQzVVlnUm9B?=
 =?utf-8?B?dk5TRzNIeTRHTkxnYkZGOU10bUIzTDNxTkZtRDBhY20rY3p0NDlaOGoyd25w?=
 =?utf-8?B?ZXc3M05OdlRCT0R1UkdxMHFzYU82UnFUaEpSRGJUWXNuaXpBQ0l0M0dvOTZr?=
 =?utf-8?B?U2YvUFVQbU51WTFJM1RkVDdGcTRacWp0UFJ2aTRQLzg2WHNQcDZxK1NDU2Ry?=
 =?utf-8?B?RHgxK1Znck9xRjdBSUVSeUQ0MmpkNE1RRFlVTTcycjJtYXdaeERoSWtKSzhz?=
 =?utf-8?B?WVhXZ2lIUndLbzYreUlGRndKaTh0cmdiTnp0a3ZwME5VQnJtSVlHaE40dk9L?=
 =?utf-8?B?dVZmOTlNQWkyd2RKYnBZdmV4SzNDRTZscSs1TGlacTlkbzRSclBOY0UyZmtu?=
 =?utf-8?B?WHEyNVFzNmY4Q3g5SHlYT0lnWStWbkQ2OEtuY1VKMXQ0ZHJiL0ErNlo1RDIz?=
 =?utf-8?B?c2krMXVUdzIrLzNwY21Fck1GY3dkaXFhd1Azb3lrcXc1dUtRYmltdnIxQUFm?=
 =?utf-8?Q?b//jqfee+4cti2RRsxpwiHi4XzJSHQfg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a082V1lPY05FdWkvdHJRTkV6WnhqM2VaNHJrL1ZSbkxqVGRqNmhSZERaOUVB?=
 =?utf-8?B?MWYxU2UxeXpudWhOSUZydk5SaEE4ZDVUcTRlcCtJSFAxYUlDU1RaS0dTVzBo?=
 =?utf-8?B?cTd4K2NrMjFKZTFGREFDOFNYNFVuWms4cXdKNStsc3hnS0hIRDZMckFKN0Ji?=
 =?utf-8?B?UlNxTmc1aThNSmc1RHBFS2lzU2NoSFdFbk1ZN1FQT3pBY1dlMFRFY1hnditz?=
 =?utf-8?B?VWlDSmNRTHVpazVmWFFOaWttRnhhNUZnZWRNTStBdmNzR2ZxdjZ5Y0lpcWRl?=
 =?utf-8?B?eUV1QlNoc0tGRmZmVWxjYnVmSG1YRks3VUF3RGZseVJEbmRUWEFVQVhGOTI4?=
 =?utf-8?B?eHd0Qy9JUHFxeStjRFpqL3JzbVN3QjhkV1lqYW1QSmdnS1lCWEdFSHFEaHRQ?=
 =?utf-8?B?VVk4R0xBMEdCd2FvNmJ3NCt5d0ZLdUV3RCtEWFdKUFJaZmtQVlRBYkdsUisx?=
 =?utf-8?B?VlluTTdITCtQa3ZlRHhuVkRPWG4rN0JhSk8yN3JoeGsxYXJnbWtzb3R6VzFY?=
 =?utf-8?B?a3BwbEU4YS9XenRSSWtoNm14OTg0UHlMSVRkZ2p0QkJTVW5PQUx6bDd6V1Zh?=
 =?utf-8?B?YVk1MFJzZ21CNlVwV3dMZ1JvYkl4empqYzJqWjhuaGMrbVdiM1IxWG1tblRE?=
 =?utf-8?B?T1lUekJ3NzBEZklXVmdhUkI5eVdwOVVEOEJHQ3hXdmt0dVVHU3BKSDFyeS9t?=
 =?utf-8?B?NDN5WnpwUEZFR1M4RFFIejJiRGgxdXIvaElHUk1sS2Y1SEpudzg4QitDdWVE?=
 =?utf-8?B?RGxGOGhqcmlTQ1RxZHFaRXlzRWd5V0doZ0k1UFA2TDZhTGFJVFhUeTY3c1ZW?=
 =?utf-8?B?L0NXekYzZHdpeGdYaHNPeFFPaHBEN2w0Q05NV1orcEhpUmtlWEtHcUxIeWx0?=
 =?utf-8?B?Wkl5amVTU0g0L2FjRkExclZZQXp1NnJOY1JGc0tFdWVGOHZLd21NRGZwekor?=
 =?utf-8?B?Y1IwSmM2Z09TbnhIWU85UXJNbTQxV09zWEN5T094RTdLWithckxvdWY4T0c0?=
 =?utf-8?B?SFFmR3o5RDJ1OVFZTndzNEdrUFFvOUxEUWlVSHVWdDNkSjZXRVlsRWg2V2Nq?=
 =?utf-8?B?WUlrTmpxZDhPTUg5dnFqcXMycDFqTjN6eEFIWGJUeGNXenFWMG9wRzlheWVz?=
 =?utf-8?B?MUh0ZExkUUptVUpzVzQvUnE3YkhER3BJNkMvM1Z3Rmp3a2VDWnFFM0tCVjBQ?=
 =?utf-8?B?MVNYRERnemt3TTlVS1J5dlVTalRNcStPUTlhT242b2lQM291WVdscC8wU0tY?=
 =?utf-8?B?Q25XQ2g1YldkcUJzQVVrYTQ2b3BtWHdRTjRqMzFzVHp5U2toMmcxbGljdUZ5?=
 =?utf-8?B?OWQ1VUNJUVd6VTVvSHpQMWtseXFaTXI2Rmltb2VrVXhhTkhZNVprSlJqd1pv?=
 =?utf-8?B?Qmk0S3ZKOHJhUDlDOFlxYVl1Y0J2SHcvWVZMN1A3UzdzeVNvNy93SnAwd09H?=
 =?utf-8?B?SmxrNUpFbURYNStlTmFJd1VFdy9WNzcrWERDdnYzcUkyMitTcVROZi90cE9K?=
 =?utf-8?B?YjFTdEE2dis2V0tqZHQ2OWE4aWZjSW9rWm9OZGhZd0NHUFM4UUY3aGFuSHpi?=
 =?utf-8?B?Wmpjb0QrNjFHZzNTZGVLZzJROXdPRHR3dkM4RjVHYXRNWWlpVk1EUnpMVWFq?=
 =?utf-8?B?bmEyMnUzMHBZQUlURW9KY0sxdjNHUjUwSFFoNjNqTVhDeHlZZ1cwYjRUNGhX?=
 =?utf-8?B?U1pjVytVVnlRUE5zNUd1TVNINFhVQXJaSEJHVlFpU3ExNEluREZYRk03SWxz?=
 =?utf-8?B?ejJUN2JueTl5RkFnMFRNWkZDcndzNjZhQWtQMGVZTkVQUDdzMkxiVHkwbnd3?=
 =?utf-8?B?MUFoZW9JNFA2dXBJdndOZEg0dUpDWGI1N0xNemxMcVFFYXcvZGVpcXAycWc2?=
 =?utf-8?B?V3c2NG1Sc2VLeU1xNE44QzR0czFxdEhHWW5UM21zcFFncUVWTnNvUnVMRk1E?=
 =?utf-8?B?WkNyQWcyRTRGZjBnSEZhYi9iYkNNTXJjajdWRWNrV1hrSGJZUGFPb0VFK0dU?=
 =?utf-8?B?ZXZ0ZVlZZmhHb2RxUDZHVU1wTXU5aHVGci8vS00vUTc1SGlnRS9TekxzNkVm?=
 =?utf-8?B?OStncUFZMkM5emJKQ0RrSGVQZ0lFR2cxOTZpZVliRjZ3czhlZlVEOUVaR3V0?=
 =?utf-8?B?NkQvRFJaVzFPbkVCTkRKWnRiZWIxTVhRSzQ2V21pT0VjSE5pZFE5ZUx2ZEto?=
 =?utf-8?B?ZDNqbEU0OXN6TXdUbmF3TFNQdHdzTStGdXAwZjdMSk5GcGZQUW5CdHJ3UVNa?=
 =?utf-8?B?RTgxYXpsOHRZaUxnSlU4ZFloRHFDUkpJditQTUFwWTRIL0hNdUU2SmNlN1Jq?=
 =?utf-8?B?UDNEY0dlNVFqMVZqaGdSTUlaeUY2aVRiaS84VW1mSWJCY1podVR1dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa7b76a9-2b2f-47d8-57a7-08de4324527d
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 19:40:41.5926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HRpz+agmOtRf4eviDLnOBDbg4Cg2NcfleMxbgnVJH94ZO4+7VKS2vWrBOKVEF4s8l2bhARAu4qm+/uot/oJLQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8045

Hello,

Two claim related fixes.  First patch has already been posted to the
list, second patch is new.

Thanks, Roger.

Roger Pau Monne (2):
  xen/mm: move adjustment of claimed pages counters on allocation
  xen/mm: reject XENMEM_claim_pages when using LLC coloring

 xen/common/memory.c     |  3 ++
 xen/common/page_alloc.c | 88 ++++++++++++++++++++++-------------------
 xen/include/xen/sched.h |  3 +-
 3 files changed, 53 insertions(+), 41 deletions(-)

-- 
2.51.0


