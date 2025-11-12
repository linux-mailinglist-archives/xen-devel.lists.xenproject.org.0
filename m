Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3805C53B44
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 18:34:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160414.1488563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJEjF-0006gN-A9; Wed, 12 Nov 2025 17:33:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160414.1488563; Wed, 12 Nov 2025 17:33:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJEjF-0006ew-67; Wed, 12 Nov 2025 17:33:57 +0000
Received: by outflank-mailman (input) for mailman id 1160414;
 Wed, 12 Nov 2025 17:33:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EiA8=5U=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vJEjD-0006eq-Hq
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 17:33:55 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c28d01f8-bfed-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 18:33:54 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PAVPR03MB9824.eurprd03.prod.outlook.com (2603:10a6:102:31b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 12 Nov
 2025 17:33:51 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 17:33:51 +0000
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
X-Inumbo-ID: c28d01f8-bfed-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vi6JlBdCgIAlahhrtpvsG1nJjxCJ+KDvlwNyvmo0vyinG66wC0Vgae2hTT25Eg+QccFNhTqnwzUFTQ7xI/cWHVC04dEOu5pv/FdiDv74iCUkHD8J4OwLp8oowmz+SyBXJte3bi76v0CEzG39YAnvgpkuZhJ9m9vOFiqrLgmFK4HDp61ixkWj1XTGg/G1iBnIZDVQn1oFa10lMH9+8mcSR/dkDMl0NEhTwgy/F+8kjIwZQJiHHcFXteWFIZO2pOZbwHGh3nwGiXfj4mAlXSCBDooa5NrVno3wltVygxFCHUAtrNnFvkZeBCdwrMBx1UKP8Ae/JNyoxTgvu2V3JOZt3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbcnMpmu8fmXTvUYdsKN65HOyD0JP0Ynz/yfKg8mzCo=;
 b=CIsWG68v9HEg9fd02fylvVhBMowAPhCJ+Tc9Cz0EO244sLI/YLjNSixhIYWBo9Ee1pUrta9z6HyarCPrgZAvSofWRyuOLcaa0hRlOpgrATcnn0sYd9Oo7ef0JktvPujf5YoDGvYFydu30KyPmdomOQAmuSczooo+quDufHCtnTOzIU19chPzJLnWYTo1pQ7ooZagWhtKw/7IjBQqyt2g+aYHqKa3QcVgQ8Okw6ezYjNgkLgIYvzQ8gwEOY6/86mMskkbb184JwiqpmjZrMAhghighJvspOxw7zcbopQObqB2mtWgS9e8Ob/Z1rf0n49xyQfXHM4OOfLjkf1NmTJcqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fbcnMpmu8fmXTvUYdsKN65HOyD0JP0Ynz/yfKg8mzCo=;
 b=GWTM8NJ850Vj0QD2vojwYHCWsGJ2+/yZTxjAgBvsFjVohEcaHyYcFCAkmwlqzLvARuzmPFOnu3vTtRk7saFGc5T43/78OYKqe9BhEr8X1v+Z2n9EA3i5IrivVlzvExHC1L4WIXRkJws2HQTj1JL/fsLAG3DE9t7orzfFXW/95J+LsboiCbY0vAdp8mcHkL+QmCilf6Z/HGpbPVFz5IJPmVY0NRKgJ8L/yjQbeJV6Z8L9GjYt50yJw7MoH8dgNMpc1cBhxtulc8TENNA/GSm4jsmga013PsRWejPCsuDqAjMhpEbH+A/mzP5GshnK4suw1nqxxErCFlpnwry1wk4Wbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <1ca5880e-b0d7-4539-b265-35848fe37f25@epam.com>
Date: Wed, 12 Nov 2025 19:33:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86: Remove stubs from asm/pv/domain.h
To: xen-devel@lists.xenproject.org
References: <20251112152235.224001-1-alejandro.garciavallejo@amd.com>
 <20251112152235.224001-3-alejandro.garciavallejo@amd.com>
 <a7991534-b200-4b00-9a45-2d4c167d7ec3@epam.com>
 <DE6W16PDQHA8.DM0FQ1YLFQ7R@amd.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <DE6W16PDQHA8.DM0FQ1YLFQ7R@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::7) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|PAVPR03MB9824:EE_
X-MS-Office365-Filtering-Correlation-Id: 388cf03c-3882-4060-b582-08de2211a52a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rng1OHdaV0lEcUpreGV4OEpNb2xwZGY1V3JzYVdjcTVyMjhSZ1ozTmpLREFm?=
 =?utf-8?B?TmdpNmdtTXdxZUN3WHlyS0Y3MzUvWXFSWG1GZTkxTU12R3Q5bys2OGhGSzVw?=
 =?utf-8?B?bGkrUjhoakhJbkdHN21ZNGpGNGJ2MGFEeDlTZ0lLL1pqN3JYazRwdHQ3cTFT?=
 =?utf-8?B?YVVxcXg0UzVGeDVCV0lZUTFBRGNtZFhxV0Y3d2FrSHdBZ0JoU1lRdEU0Y21s?=
 =?utf-8?B?Z2tDOFE3R0h2ZnVpYzg3aDl5Ky9SdkhGdzB4S3hEb0MwdDBrQ21XN2QzQTZp?=
 =?utf-8?B?WjB6Y1VtSFIwbVpsbXliUmtRVDBCTGJlRjZuQ0taNzcrTFFQRndWd1pXazRO?=
 =?utf-8?B?RWF4UnA5aVdaT0hIZXdMSVhtU3FQa21KeUZjMXQzSUhMRElTOHJWMjhrb3B5?=
 =?utf-8?B?NnVLSHhQTWxDZkU2TGNZN2pCc0xkS1ZEbGN0L0NpR1BPR0FsOExtTHhtc056?=
 =?utf-8?B?bkwrTFhpSWMvd09UeUo1L0lvb3ZhS2JIcFlybklnSEEwMEdwWTlzT2pQNE9V?=
 =?utf-8?B?aU9mcWhlVjJQeVlWWEx1eVA0Z0JBNURkMEZvR29oWHJzK014MnpYS2xqc01r?=
 =?utf-8?B?U1lUa2gzaWJmaStZWEhxa0xCT2xCdk5Nd2V1dzF6c0ZIWnRWZjVqczdQTEln?=
 =?utf-8?B?UmFQdHhJVFBTWWpBd3Bzc3FPVUdhQ0lEVkx2RGhkUVUzY2pZdnMrUWIzQjAx?=
 =?utf-8?B?NlF2bW5BMENGUFhXeXUvOFljN05EeU9SS0tiUlc4b2lub0NYazB1ekd3ekhw?=
 =?utf-8?B?aU9OditmWlRrc3dNVitoVXluOHVOaitBdFdNZ0c2TXlkQW4zNCsvZEMxT0dk?=
 =?utf-8?B?MjZQU3pvY1dzd1J6clNjbFFLL0I0c1hFREZRZE9rWVplN290Mk8vK3NSdFJi?=
 =?utf-8?B?Z0MyVUNwOFRrWEYrbzQ4ZzBBVUVKWUh1ZUVFc0sxY2NGVGlSMFlwKy9YYmlL?=
 =?utf-8?B?aGVPSGhabGEyZEFqZ3IrU0pOWTRKbWh1eFRTM3NhbVFJSHM3VEcrUHVUNVNw?=
 =?utf-8?B?NHBQNzNhRnowTFBUcTRNVW9jNWVlRmMrNEd2VXB0cEVwOHQ0TGhDcEVFQ0xO?=
 =?utf-8?B?M3lLWEFoZE1XclFIdFp6R0RBdVphMW5VZkVsQ3FHT2ViOG5qQzl4dkwrQi9H?=
 =?utf-8?B?OFZ5aldzQkx4UjZMUG4yK04wdDNna2dwMkJGTHp0cDR6SWdXNE8rcnpjU283?=
 =?utf-8?B?REhZNHNKOHA1MzAzTGlLcGtZbVo1akVPRUtuTGczYkJ6UXNBTEd5QjY1Q0E4?=
 =?utf-8?B?S2lCUEpHUFlGT1lxTjZTcU91UmxrWFp4b3JiQlFURUlqQjVNeDdEL2ZsOWFt?=
 =?utf-8?B?c2NEemxMcUsyMnd5N3c1eTJqVDNwZUNZSzRPMjg5MURwWE0xYSsrVnpST1E4?=
 =?utf-8?B?Q2VHLzFnaVRuL1Q5SjdJdmswS01wMHR4bzNzaG1FZW4rSVU2QW1xNW1OZmRJ?=
 =?utf-8?B?d3U2SENWeklxVXRkbDVmcUYxNW5aSElJMFlhdXI2QXdqZVM1NkJYRFJORW5u?=
 =?utf-8?B?c0JsNXFqWURuY1pSUnpEcGdrY1FwWUxRZlhKMm53dVd6R05BNVE3UFVvaUkz?=
 =?utf-8?B?YWpLenpnNWFSSXZqNWEwb091Lzh2QnFwb04zMFdMT2VESDJQVC8rTzN3ZEoy?=
 =?utf-8?B?NDNnbHdVOFFxRjBxSHF4TllINXdxMDJmWDJhRmxmOURJN3V6NHYyd0JlOXFp?=
 =?utf-8?B?ZFo1Y3Q4eG9mc3pCQkVieHlYQTRFL1BnOWtMVzJCdnh0REFiZnRQeWdTS05L?=
 =?utf-8?B?Uk05WG5tT1RxVkIrMGNwbWt0bXNQMXM0bGFleCs0bnpMSTNORmJUeFJpRzY2?=
 =?utf-8?B?RXQ4MVE5S1VldkoxelNlSUhqWXVkbHBoTG1POCtoM1NzUE4wOG5iMlUydzVz?=
 =?utf-8?B?ZndiSFFyZ3Bhb1p6NDEwM0htMmhPUnhHVzFTQVZUZGFJK0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmUzeFZPV3M4dFc4M3RBdFpGYTlNVVc3NVBPaFo5VHlCUmR1TTZtUTFoVmtF?=
 =?utf-8?B?RitvUEhwZW1JQ0V6SC8zQVNuWnNVK3AwWUppN24yTXVmMWRIcHRzT3ZjSnBR?=
 =?utf-8?B?WmdrcmR6VDFyblRnL0FwV2pSakM3MDJ4N291aCtqZ1BnSTNJVEtDWWlqTmNZ?=
 =?utf-8?B?cmxWTEhzcHFvQ0RzQ2pUSDlOZkJVc293cVFpTmFWeGZRaGlqZ3lmRTlZYURy?=
 =?utf-8?B?eHlPM3QyaGFDblZKZ0NVWjArL1E0RXByTHVUaXRNbDVLcW5jbzV4ci9rQWFv?=
 =?utf-8?B?MGFTcDZldXR1cW0ySnk5Z3VWUlo3WFNXMncyditFYzNRKy93VmNac3I3VTJa?=
 =?utf-8?B?WXJha1dSYkMvU096MjUyZnJFMlpJMFNUbnNFRUpCSkZlTnJ6bUNhSTZOOWli?=
 =?utf-8?B?MEJVbFZRVEl4MENlc0M1VTB2WmlLRFNCbGpJQXVtWHlFZ2tkZlRZMW9wVS8z?=
 =?utf-8?B?dytza3ZGa2p2eWxldUN4Zmw4NmlvSnRPeDNxbWErQWd5TzZkZnhrT2FhczN6?=
 =?utf-8?B?VDRmR3VFT0lUUmlBWGlBbi9oZnFOclBsVXR3QUdNN2xXSllXcFQ2aytTdDFS?=
 =?utf-8?B?N1BhOE56K1lqcUN3dTV2QVhCYU83QzJiU0ZsM2hsUENHVkNIT2dVR3BYcXVh?=
 =?utf-8?B?WHJXK2RnMjAvdkZjSms0MEtNc3hDalJxS3JHcnBaUmRjVldFL1ZQWCtoZHYz?=
 =?utf-8?B?OFBTSHpWaWgxMTQzSXNNOFNIZzRJNUR6dHg4ajlDZXNkcWRRYytKNlo3UkYv?=
 =?utf-8?B?NU0vQXhBV1pGTFVPYTVMMUhlZTZhcU9oWnFKcjcxdGxtY1Q4UnBaa1FKdG9m?=
 =?utf-8?B?czdMVnhqalVNSWVoRXRzazRRaDAwVDFVa2dXK1pndVFMcGlhWDc1cC90NnRm?=
 =?utf-8?B?ZVoyWTJXU1VKMUNEbUVFbWRGbUpGZExvejdCOC9CTUZXR3pNWnVDN2c4TDNN?=
 =?utf-8?B?QnpqcnJ0RTI1Zk1Ud2Nod1p1eEdkQmw4S2xMSC9nL3RUTGNsc3AwdlhPdWxG?=
 =?utf-8?B?SFdRZjlRTHNqVHF1d3ArdTREMFhuK2ZOU0JXS3BOZXAyNk4wN2xUQWdTOHBC?=
 =?utf-8?B?QklvL281cExyUXhoQllqdk0rcTNtSk0rcUJXYlhvT0xVd1p2WlM4Qlg1eU5v?=
 =?utf-8?B?a1hDTzF5YVdpSmdIdkM2cGMxS2tFMjhSU2VCK3BST2VFb0xmZ3gzSWsvQ1Ni?=
 =?utf-8?B?R1Z6QXVoM2s5Nm5mdVpkWmV3bm1rdWZ1Skg2WEFGVThsaGFIUHYybytERmJF?=
 =?utf-8?B?MVZ5cE9LdmNRRnZCdTZBME1TaitYRHdla01iY2R1YWp4S3d4dFZpZ3VkMzh1?=
 =?utf-8?B?TXQ3WVlKb3dLMkZlTUdEUlFZejNGM3c0cUg4QkozcitRTGVXdzhPenc0WTVu?=
 =?utf-8?B?eU54MW0vcmd3ckZ2SlM3NnZ5TXlKa0VLaDVxQW43ZHVUL0toZ0ZQc1crM0ht?=
 =?utf-8?B?d2l1L2dLU0V6WjZNNWRqVG1aMFloRWpzaWZmOFI0UUdSbi84TUpMUFF4ZTVC?=
 =?utf-8?B?TkVGZ1BycVl5amozbi9jb1FqWlJEOFVobks5RXV6akhQZ3hFTTdPMEd0NXVN?=
 =?utf-8?B?cE8vMit6ZzFUSFJESVBQN29GUWdtNGh2a3QyUHZpa3hBZFRGZzNKdW9UbENP?=
 =?utf-8?B?ZklrYTZzb2RyZ2k1N2RuRGUzSlU1WGtiVktLZnpMOFNtOGs2cEZtbXJOTW5o?=
 =?utf-8?B?ZWZtS0xEcmxLVmhURWMvUWxMUW43N1p3SlFPU3BVdncyN1VJUmk2VVpzc3RE?=
 =?utf-8?B?NEtpNEtocS94eE10OVpYMTVSUWRTaEtNZzExdmVTMmg5bVM3SlJsWno1d1Uw?=
 =?utf-8?B?eHMrdVdkSHdLUGcwNDJXR0ttRGR1NlpRTTYyWnd4SW5CWHhRNE82STdjUFl5?=
 =?utf-8?B?VTNGTjdXU2wxQnhEa2IzM2hNQkRVQUFyYmVNUTd1MVFTMW8xakNaMnFzVGlx?=
 =?utf-8?B?S1UvNEJtVWN4aElEbkF1aU5nOG5KTlFhaE1xUjlmc2o1RmU4bmhkR210ZW8v?=
 =?utf-8?B?NXNWRUZsWmx0S1Uzekl3bzkwSzNEd3JsZXZIOHRvSk5CNTY1M0p3UitOU3V5?=
 =?utf-8?B?UDQ3aDVKaitrWFRLOGJBYVFtbFVVKzdxdkRmVlV1VllJd3dYTGd3RTRBRmYr?=
 =?utf-8?B?c3B3VVc1b2pYZEJoN2JoVFNLTlg3YWd5SHdMUC9BUW0vNWtwL2pRbHRNMWo3?=
 =?utf-8?B?cWc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 388cf03c-3882-4060-b582-08de2211a52a
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 17:33:51.5159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AqPH2rTOyODGK/zYis+fLDHKJHfSdjktN6tu+XuX0ouSa8wliR/21wcdQsGVggk4/ks8H38r4jebttUE7zlHZdf8HBVtpK5w/KiyCgrWW48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9824



On 12.11.25 19:21, Alejandro Vallejo wrote:
> On Wed Nov 12, 2025 at 4:56 PM CET, Grygorii Strashko wrote:
>>
>>
>> On 12.11.25 17:22, Alejandro Vallejo wrote:
>>> They are unnecessary. The only two cases with link-time failures are
>>> fallback else branches that can just as well be adjusted with explicit
>>> IS_ENABLED(CONFIG_PV). HVM has no equivalent stubs and there's no reason
>>> to keep the asymmetry.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>>> ---
>>> I'd rather remove the "rc = -EOPNOTSUPP" branch altogether, or replace
>>> it with ASSERT_UNREACHABLE(), but I kept it here to preserve prior behaviour.
>>>
>>> Thoughts?
>>>
>>> ---
>>>    xen/arch/x86/domain.c                | 10 ++++++----
>>>    xen/arch/x86/include/asm/pv/domain.h | 25 -------------------------
>>>    2 files changed, 6 insertions(+), 29 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
>>> index 19fd86ce88..0977d9323d 100644
>>> --- a/xen/arch/x86/domain.c
>>> +++ b/xen/arch/x86/domain.c
>>> @@ -571,15 +571,17 @@ int arch_vcpu_create(struct vcpu *v)
>>>    
>>>        if ( is_hvm_domain(d) )
>>>            rc = hvm_vcpu_initialise(v);
>>> -    else if ( !is_idle_domain(d) )
>>> -        rc = pv_vcpu_initialise(v);
>>> -    else
>>> +    else if ( is_idle_domain(d) )
>>>        {
>>
>> The is_idle_domain() wants to go first here, i think.
>> [1] https://patchwork.kernel.org/comment/26646246/
> 
> I'm not sure I follow. I inverted the condition in order for the PV case to
> become the fallback "else" and be thus eliminable through DCE.
> 
>>
>>>            /* Idle domain */
>>>            v->arch.cr3 = __pa(idle_pg_table);
>>>            rc = 0;
>>>            v->arch.msrs = ZERO_BLOCK_PTR; /* Catch stray misuses */
>>>        }
>>> +    else if ( IS_ENABLED(CONFIG_PV) )
>>> +        rc = pv_vcpu_initialise(v);
>>> +    else
>>> +        rc = -EOPNOTSUPP;
>>>    
>>>        if ( rc )
>>>            goto fail;
>>
>> Actually, if you are here and have time and inspiration :)
> 
> I may find at least one of those two :)
> 
>> - if ( is_idle_domain(d) ) staff can be consolidated at the
>>     beginning of arch_vcpu_create() which will make it much more readable and simple.
> 
> Good point
> 
> Though it's subtle because the idle domain has wacky matching semantics
> and there's many exit paths. Let me see if I can make a clearer version
> with that sort of consolidation that is not a functional change.
> 
>> - mapcache_vcpu_init() is PV only (->pv_vcpu_initialise()?)
> 
> This I shouldn't do. It's PV-only only temporarily. The directmap removal series
> (in-flight for a while now, but ought to make it upstream sooner or later) makes
> it also usable for HVM when the directmap is sparsely populated. I'd rather not
> generate more churn than I have to for that series.

It's all up to you.

-- 
Best regards,
-grygorii


