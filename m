Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A28D01CCD
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 10:22:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197441.1514978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdmDM-0003fc-RO; Thu, 08 Jan 2026 09:21:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197441.1514978; Thu, 08 Jan 2026 09:21:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdmDM-0003dt-Of; Thu, 08 Jan 2026 09:21:56 +0000
Received: by outflank-mailman (input) for mailman id 1197441;
 Thu, 08 Jan 2026 09:21:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AIqS=7N=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vdmDL-0003dn-7S
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 09:21:55 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 763a7225-ec73-11f0-9ccf-f158ae23cfc8;
 Thu, 08 Jan 2026 10:21:49 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CO1PR03MB5858.namprd03.prod.outlook.com (2603:10b6:303:9d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 09:21:46 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 09:21:46 +0000
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
X-Inumbo-ID: 763a7225-ec73-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+MmWtL5YZRMMI1333ScJR9d4UVEoBHDekAVFbn89PJNuPUtEGabFAuyWw79bKJjt+/8WkrqrW7RwdSAo1Wmn1vliHkFeIKzaHHVTQ86QjEWOkBMwTxBHnU827lGa9TBgcVtTKENHksW9c6w44eHP3dP26pTaz2otafWqmT75ImpDO32hCDE1vMbJX3Eg4p5F62d4LlpMvwlSVHSqCc65yuRs/+KpkzXdF7z439b/RIhvPsbtlp3N38HBHqcaEe+5dsQ8ostJPkcn+mYqKotdBiF3RKFZDqnp4S+35k58Sgrrfw5V/yL9D8Qu13JT4rDE1GZnfmYXlzrCM+3TCC9MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xot/PO7ac8jnlj2KiLt++h4zu6zxYXwglI6jnJiWen8=;
 b=PtXSkM/PxpkcsvmHShRNqYV7ySb7yomGVZXFqZc1NfL4WH+k1VZchlACbaPAfX8UJamm9TEtjVc+wFxVidhNqxhG53LOKeSNYaRoI/aYIuvEMbrBpABQu7O+UmDU72DidhZ2AZhjQlw8oRaL6urs0MGcyckf5gW2rLU54uN0V0KP9rHAviCzQ3PB73WfIsPQo4/OM9ih+Nz70XU3R+YSxqyGgQ2rpQhlOJGGSdYZ4WHzlIU3+okvOhQpTP5mMCnAAFtyGkMyYYWSKeW3i5H05F0aoGzIx9U6sbaHnlsc419QUCiYbS6XAP7xYQq2yWlN7J5X1BU6FHQ1IODjKHCKig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xot/PO7ac8jnlj2KiLt++h4zu6zxYXwglI6jnJiWen8=;
 b=BNv/yWcRigw3ds9y2ddzYlqLNW2JYgIOO6xqxA8Q1vFwn45Wl8YNOEQlrx5KlidTAKfhAi/mZbQktVUmpAT3IHkPsbvqU3Y2Lw074QKuQ/cLPvfR2e/DPD00jojonu5cwSvxKMYNgVhNzSTFxsJepOYMzzZ1+/ltB4IDI0vLBaM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 8 Jan 2026 10:21:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/PVH: mark pvh_setup_mmcfg() __init
Message-ID: <aV93J4vvfASM5g7P@Mac.lan>
References: <6b0fc1a8-fdee-40dd-b3c6-262c33607715@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b0fc1a8-fdee-40dd-b3c6-262c33607715@suse.com>
X-ClientProxiedBy: MA3P292CA0073.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::13) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CO1PR03MB5858:EE_
X-MS-Office365-Filtering-Correlation-Id: adcf0ba2-08c9-48d8-ec5b-08de4e975859
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWNXaUZ4NHRJUVJiRm1ZQTc4V2psOStjTmllMkNCV3VsbXVBb2MwZy9FM0tE?=
 =?utf-8?B?RVM5UGd5Sm1YNVQrUFdVdy9tbEl2aDk1THZQZ3ZFT0ttNEhEOTZjZVNTeVBH?=
 =?utf-8?B?V3lqajZPdVhhVHJkQk9vQTZOcDE4NEl6N1kwK2k1SU01eC9yWmFHTHRNbkFm?=
 =?utf-8?B?eFJiR25WeFI3ZEJIYXlneEhLbVR1djEzUk10STFrQ1RsSUI5SWd6dTJLWnRx?=
 =?utf-8?B?SUJxRFYrMWM5dFc0NXlVdTZSZklnWk1SSlNTdlpsMUpFUkhmUUQ5dFh6dTRu?=
 =?utf-8?B?L2RmWmN1SUVoOENIWDZLWUdYZ3BVUHBxK3hGalNCOVhjTFNGRjdUSVpTOUUr?=
 =?utf-8?B?U2dqdHVVU3NEenhoTENHcnh6VXlVbGwyVDRzbjRnZEtMMWxTUTlEcFh2T3lE?=
 =?utf-8?B?WTBoNE9ValNwbEhoUWVXT2w0Q3ZUUDRSeXlIZFVMUTE3di91S3k3VlpQdzB3?=
 =?utf-8?B?S1FDeTFmcTBBUzUwUlpMSUNaZFEyWFdKOEh2N0dFcHNIcXBIdWVuWkJHazVh?=
 =?utf-8?B?Uml3MFAxM0YwOEtYWGdoSTRwTDYrRk9oSk5qWjU4WlJpNnAwQlVTeUN6djBw?=
 =?utf-8?B?RUhiNDN6M0V5cTdlN0RxS1pLcWtGTUxsZm5uSENPZmljNDNLS2pud1RWVFhT?=
 =?utf-8?B?aFFTNTIxWEM0QXkzM0J4OThyWUpyd1h6OGdNMHlRYm01bHF2K2xLQnhUVk8x?=
 =?utf-8?B?Rmc0Wm5ybWh0NkdPSWxTTjUvbmNzL2xkbUwrYVdocEl3RzVzS0FpNUpQaVVN?=
 =?utf-8?B?OTZyL2ZtcndVdTdNbWF6am80MzV1YlIrYWRiM1o1ZkxUQVJwZi8zazRuU3Fa?=
 =?utf-8?B?L2lxcEwzMDBIU3JWSDU1Snp1V2JYZDc0M1dmQUh0RHNoczR3SzRmSEhxWXNr?=
 =?utf-8?B?ZG9pTWtGRDVCNGg0WCtFbHN1ZTd2b1RwNldaVU56dTVpNk9lUDluajlhajJY?=
 =?utf-8?B?TGJNWU9HVENrWkpiMmFMdUpDSU9ScEJTbTFQSXhUWWJNZElCUEdrU1JNVzAv?=
 =?utf-8?B?S3F0dVhaZlBERkp4cUY0QXAwWDJjejl5aGNDbitTM2t2cWo5WFl4Y2F2N1JB?=
 =?utf-8?B?cDkveUpOd1BzcXozUWs2eUplSjJiZVRGcXZzMWFYeG5vWnk2c0xzL3JTWEE2?=
 =?utf-8?B?T3hRNGJJM0FPN3prWFBTZTJGanE0dWpDem4vWlAyaE5JaUtVdW13TDA5US9v?=
 =?utf-8?B?SWxibThRbThiWXJoY3NvcWxpRzBSVzBlRHlYaDV4THhHbWtBdld6REp0VjUv?=
 =?utf-8?B?aUhDdHRhbm1FY3lQL1UxQ2VlY0wrTGhLV3V3YTUzb3R3R0JVaitWTUtWSXh6?=
 =?utf-8?B?ZW4yeTF5SXJPTlBKcitYVllHTUNBem9aUHNKU2JVUkhzL2dNcjJRcElkUWlm?=
 =?utf-8?B?VHhneWthUXhtOWJUekhHamFUa1RwQ3Nmc2pSdHlxK0ZhTmRmUlkva01xL1Rs?=
 =?utf-8?B?VW5FMncrRDB5WDZTSHkyQjJ5T1R3WHF1NmJ3aVFlY2FOK2N4dWZORE1pUTNC?=
 =?utf-8?B?KzRGb3FBZE93RlM4c0NwWnByQUdCcGlGUVFlL0RoaG9Ka2FDZE9JRGxhTnMy?=
 =?utf-8?B?QnRzT0ZhbmgybTFkTkhJUjNFbVhXZ1dseVdTRWpHaVBSWHpsaURYaFZiRWZP?=
 =?utf-8?B?d3ZFbWRUeFVxalRLZjNqWUFwVjg0dkZoNmh5WUd1MlRqRTFCU2IxN0hYZFJ4?=
 =?utf-8?B?SjltSFRlSGwrZW1TRzk2Q1NJcFAxNkQ0UVlRVVdEL1NTOExLMHA2SnhYeHhi?=
 =?utf-8?B?T0M1TnNwMFlrNkttQ2lLeXIycjloUExLQml5V3pnZjBuTkgvWEt5Q2pURDVn?=
 =?utf-8?B?eWJtODFpT2g2WW9KTWg4eDlrRUE0MG44TWtBUzMwc1Rqb3c0d05BU3ZSMTNy?=
 =?utf-8?B?YW8rRFFtTytnakNxczF3dUZCY0dTUkx6djBMU0ZzZCtGSTNyMTZWb0c0d0Zx?=
 =?utf-8?Q?OzLenVTjpxYRTvHTsfFZwOaX8RNbGEYS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjlIMVg3RGx6M1R6ZzlibmR3a1dnMjRVZWFIWW5abmp6KzdWVThsZVVqbVdj?=
 =?utf-8?B?QUx2ZjZYc25nYkRVQ0prblowTWhIcHZrcWNTSnlGK0NQbmx3QW1CV2V6ekdq?=
 =?utf-8?B?a0dYS3RJV1FjUXFDdEhINXRxbVpPUUtnRGs3WW9lRXRURHhJTTZ2V1FCbXVR?=
 =?utf-8?B?Q0JXY1Z1N2VsZHF1ZldqaEg3RVdzTTR3M0oxdndnWTN3aUIrc1hWV3RMV3I2?=
 =?utf-8?B?eDBucHlNbHd0aWNHajdVU1RmOHlMTEpoNmFGVWdGaG1XaUhVMFpuQ1RhRGxn?=
 =?utf-8?B?aFNOTitHeW9pSmxLbU1weUlTcWVkVmwrMVFqOVFRRkpMRjFkZGNCRUtlc0Uw?=
 =?utf-8?B?eWJYeTBzUEF6VVdCSUl1a2VBN21JZnc1eE40SUNTeG1td2JjQVpqM1JIYTRG?=
 =?utf-8?B?ZEUrL0x2a0tmcXczc0RsaElMRlJvMGRSZ1UvelRuYW1MRVkrbHV2M2NXY1I5?=
 =?utf-8?B?MitzQmxyRzJaYkJ0c3kwMnBLVC9ud2JqYkZKUjVxWnVBM0NwNjVwK0VPUkVH?=
 =?utf-8?B?YXpvVTZjdFdTQ2pJMHk1d1pWa3lSeVMzcGxBVTdQdjVtMXBlOEJMaEZya1dq?=
 =?utf-8?B?Yk5KT1ZWVG5UdUVUc0tvM3NQVXRDM1Z3TnRRdDVPVjNZRUlMNVhhUDc1UU5S?=
 =?utf-8?B?QUVsTng5WmVPbHMvS3pEcEl1SkFFdXBYRHB3QzhqSHdzNkFtYlh4bHBpemo0?=
 =?utf-8?B?a0kvczE1Z0oyNytzVlMrM0tyUXBNbzV5bzNlbnpnMURhWE5hNHVmZkllTnBx?=
 =?utf-8?B?VjZxT0ZWc3FFK3pzZFJIbmoyZnlTMzEwZmJwWVFyNnB5ckYxd09IMnV1WEV1?=
 =?utf-8?B?ekNRN3hZcDFva1JVS1lINXU0WjF3VytNa0phR3RRL3JLRnZkd2F4Q3FHWDBF?=
 =?utf-8?B?TWNOTVliWUM3dkYzOEhsdHVHYjBqc2ptMVRJbFRVOHF1NDRUWHF5NEdJM0c4?=
 =?utf-8?B?dm5NVE8zWnBrZGhmQXVWU0dZLzFWVXc5Vm9HUnJEMDQ4MDhyTFlPTGVBb0l5?=
 =?utf-8?B?bjBBaFVVak16RzkwYnhlaEFWUitVM2l5UndzWHVBTEJnQ24xYkRFTUwveWRR?=
 =?utf-8?B?c25QVFVOWlg5ZGFRT0tJYWo5aW9DNUQ2eVRCUCt1cTBJUXR6Rk0rQ204Wks5?=
 =?utf-8?B?cVhjc1hKK25BS0lML1hyNEVzRVJSY0pQTUpzcDVvRzNtbXVXK3dQMEszdDhI?=
 =?utf-8?B?WllzR29lV0xPaDhQNTBGOCtXancwcDhQSVdXRVBwWEVrOGw2eXhuK3lJbkZ4?=
 =?utf-8?B?WVdQN0Y3TTVBUDRzcERMdGt1Zzk0S2JJTlFzbzNmdHZQclh1ZFpwU1JxYTdo?=
 =?utf-8?B?ZERHWWVmeEltUStZdFY4MDJCQXZ6aDRRMytYTjZ1M2U5S3pBUlFZS2tvVlBL?=
 =?utf-8?B?L3F0WXNMNUlpY1NXV3EzbDFWU3NRVXlFOXpxb2M2QSswWWJ3MTIycmZyd2RT?=
 =?utf-8?B?dStiT1JzbnIzR2pqU0dMNFZodW1KVzRXN0xqSW52Z3k0ZENjVkdpK2s5UlM5?=
 =?utf-8?B?Z0dQS0hwVnc3SEZoTHZoUXdieEhGTnppRUltekVuUTAzSTlNMlVzajlSM2F0?=
 =?utf-8?B?NkU2OGhLUkw0aWhic1JIMXVGNEZkeDE2RDErWHR6bGhXTFBVMmZUdktZSnFN?=
 =?utf-8?B?ekk1UmxvZjFPWTIxT2ZnUHdkWVF4Q3BndGZ5bXBFaXcwSkl6WEIxWCtSVlhD?=
 =?utf-8?B?clk1eUdMaDJIOXg0czkwRU9iOTJTcEt1NG9TWXJmUXd3VThoS1BKUU9jTWhz?=
 =?utf-8?B?ZDc5RklGYVZOd0hYQ2xjZjRWZitwUEhlTFFha3h1MERxd1c5djFRc1JxdGtS?=
 =?utf-8?B?SStVdEh1eEZBcU9nbUdQYTd3SU1GbVlPZFgya1cwa1dqdmpKNDg1azhMN1Vv?=
 =?utf-8?B?TUZwaGkyQm5GTWhiVy9HeDJpZndVa1dJRDZNQ1hPeWlTSU5HUlhQOFY3TS9G?=
 =?utf-8?B?alp4bFJqenUxT3puV1FSRG1aOWV0YzkwYmtvMm9jOC8zbHRiVWFaZ3Z6SDNS?=
 =?utf-8?B?MHNrcDFZZlRNSFd3aUpGZVZZM2dqa2NzSEpNcWlINjFpaDBUQ1NTWmt1YVFy?=
 =?utf-8?B?amsxa21kMWpBU0pNNjQrZlZrY0R0K0VOaVNOdUhqTE0xQnRWaU05V2RyN3FW?=
 =?utf-8?B?bWtEY2gveU1zd0liSnhYU0tmd2VkMFlBS2NGUnRjZmExZjlaODJHT3dqNG1S?=
 =?utf-8?B?QTVIWnZyL1k4QkJIdDNYTjRtbWdkSVBWV1poMTRBR1FzWkxFaUJRcmx1RnhB?=
 =?utf-8?B?eGdsVERyTCtmdjZGR3VudU5pR29lbGdZbnJ1cE9ja051TzFTbW56YUE2Y0hL?=
 =?utf-8?B?MkExUzJBZ2dWaVQrK3IwMUxISDFJQlJ3K3UwVUxlaDFvQ2ZtVkthZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adcf0ba2-08c9-48d8-ec5b-08de4e975859
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 09:21:46.3203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wj9iXZFw5kFpVbOzoTO0xbBzuFgHw/q5EWGpaIBsZfQ1B5afw54ckmWBP3lhzil0iqZeWhuaVpxvmkuifiAA+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5858

On Thu, Jan 08, 2026 at 10:16:55AM +0100, Jan Beulich wrote:
> Its sole caller is, and the wrong annotation would cause a build failure
> (non-empty .text) if the compiler chose to not inline the function when at
> the same time LATE_HWDOM=y.
> 
> Fixes: be52cb139f57a ("x86/mmcfg: add handlers for the PVH Dom0 MMCFG areas")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

That was my oversight, sorry.

Thanks, Roger.

