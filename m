Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEXZM1/xkmlA0QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 11:28:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DE4142581
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 11:28:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1233931.1537309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrvqJ-0007jC-PN; Mon, 16 Feb 2026 10:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1233931.1537309; Mon, 16 Feb 2026 10:28:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrvqJ-0007hS-Lb; Mon, 16 Feb 2026 10:28:39 +0000
Received: by outflank-mailman (input) for mailman id 1233931;
 Mon, 16 Feb 2026 10:28:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aABt=AU=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vrvqI-0007hK-K5
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 10:28:38 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fe9e700-0b22-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 11:28:36 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN2PR03MB5183.namprd03.prod.outlook.com (2603:10b6:208:19e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 10:28:29 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 10:28:29 +0000
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
X-Inumbo-ID: 3fe9e700-0b22-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YAMzgTWLNiZqDzP+a1Rdq1Nqz2/ROShRZCR9htwVSd0X6FBcKyVRzOoptkhpSTfwRvqdq7U9EBg4KC2WM73/ybs+W95pXJcARthG/LAyX4uYN94KG9ukyxQbeB1IylLOvxp4kNSIixsDkkO18Cw1t5u162nWbvHghFsyzUarweejqCWaTuCs1pGyFKu8cZ0lgRC4NTiakyOadN7WVcDjKicDBEZmMGBpS4EzEOSubJRUT6sgYMAowgdeiKf/QKnvFWtMiJdxieC5+FZwlBXRpOa6nlQgJOZekI+CXZvgVGgoqDMmm3CnO+xGfsIKRlf/7/yzqs6saIp526nH5OLuhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gbGg41ZdlDnfHtAVLQWesczoMuWjWJroBHnPOBLs/bA=;
 b=tz3Ie9Ekxch81lpWtsjyXgPjUk3t9XBS7TO/UFvu3K8v2aKh9oPoQ2yBDEO7E8WB3yKV8mYIMHQWFIFF6Ne38SFYvSx9xZ6bdGqY93kN3LhNvBA81bViAAnDVHoc4tAGIzTI/LbKh98bwcAALKtXUATlnPTzbhqkVztmly+4LC1jW5msXMDSgiiYSeGefxuTGrY82mCzei/dO6Dz8t5w9tqumj9ct/yLHzR/9rNPoDPMIT5dvOz17y1QQBK9H2k+0NDbdLQJLrnzz9obaxvQB45XsRkea4xGSYjnLuvNIaxKE2haHErbooR4D7J2NG1m9AoyVdvJrd9DFpFzhd3oQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gbGg41ZdlDnfHtAVLQWesczoMuWjWJroBHnPOBLs/bA=;
 b=p6IQ+D57nGeRnZ4BGmG0Magy6Qf+8iDFUdGv/74+af6l11LS6SSMe0ELh/VV9X3kHb7p5iGHhYoCfnsBeEn/zGAwNPI/eKRt6tx7zq/aPpyQWb9rq7FfIjumSpjb5sWJi2TIRd1myYd+W11vChtlnbEFdAlgL2Y7MXqrtIP4GOw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a3e20afd-8325-4218-b536-c9f6ffb64d8b@citrix.com>
Date: Mon, 16 Feb 2026 10:28:26 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/arm: smccc: Preserve argument types in v1.1 SMC
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Jan Beulich <jbeulich@suse.com>
References: <0e2ba0af683fa5e53a3d2b4b625703751cf7ce54.1771228001.git.bertrand.marquis@arm.com>
 <3bbc408d-d16d-473e-81bf-6ea1f78290af@suse.com>
 <D54AC574-88E9-477B-B355-375F4B1CE787@arm.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <D54AC574-88E9-477B-B355-375F4B1CE787@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0077.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN2PR03MB5183:EE_
X-MS-Office365-Filtering-Correlation-Id: 476c8d71-8c4b-45e5-cb37-08de6d46205c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OVp2M2VlZTFRZ3ErbmMydW5xOGI4dnpmUnBIbGlEcnVIcXZsTmNvS3hsRUZt?=
 =?utf-8?B?N1FzWjIweVo1RjgyUEJubDg5TUpGOFBlWDJ1L0NpeUEzUTNBSUNUSFRrRTI4?=
 =?utf-8?B?T0YyV1g1SnF2OC9TWE9aYWFFRVE4cWhveDlCV1ZoYjh1VU9GSjkxREt1M2Nk?=
 =?utf-8?B?ZG1lNkFNVkpQT0tDcE5Kc1FQY3hmR0NvY3RNbTIzZkdoSno5dEdWYy9LbEdD?=
 =?utf-8?B?c1lIOVdoSXVXZnZIQXo3YlNnRXAxeXdxYTdmc0NLaGFpM1FCblpIemo0dDlV?=
 =?utf-8?B?RFhqelBIdjBvUUQwN215K2lCR2JmUHU4MmVLVVJTREYwTFJQdmRHUG0zU3ND?=
 =?utf-8?B?bGYzOC9DK2tRYjRiOUJ4YmFMQXNqdTBYcmRsaGNBNGxSNjk1Y0tNTjRFd09X?=
 =?utf-8?B?YlFuQmZiZTJ0ZmFPTGhoRnpwbFVBQUFsb3BqTHYwb1FRU0NOOE9JSVl6bjRO?=
 =?utf-8?B?ZnpTaE9rZDAzQTY2K2x1MnB2Unk2NFJxMTlNWjZFaXhqdm1DckhQMlZ5YUM0?=
 =?utf-8?B?TDhwWEtDVlFJanY2S3BESnFTYy9GZ3NzeHYvZHBBMHAyWXRwTzJUWjIrVFBT?=
 =?utf-8?B?UzJLOFBWM0RKTDlpdTB5TEVXVUh0RWx1VngvMGpQVzk5TWQxbGxuM3l2R2xU?=
 =?utf-8?B?YS9VZ3BCZVcvdlIycWJBU1hiYlZqU09mQ250YXdiYmZxam5OQ0V6WlIweXkw?=
 =?utf-8?B?UDB3ZjcyVXpkZng5Z1FCNDBaK1hVUkxHc0NzY01NUFh1TWRGM0hVRk45SXFH?=
 =?utf-8?B?MkR5em5iOWpDaWp0R0ROWDRkMTNzL3RDaXR2M2tDZWhmcGFwbTZiNFJlRXRu?=
 =?utf-8?B?WjF0RTdkSlhjeTBBV3NrMGF5bXBVYTFmc0p2WTdLcDlsNWc4WU9DY2lBenFK?=
 =?utf-8?B?UjJQYXJ0Wm9ab1VKSVhKVWxNZ3NEZ3FLUDlVdHJWMGFVUjJKVnVTb1kwVEpU?=
 =?utf-8?B?WWZxK2d3M1lCK2kvOXhRWFh1eUJYMm8zYVg1ZWdqdWoxQlRDdUdtQWFjdjR1?=
 =?utf-8?B?c1ljK29oREtuQzU5bnZpMmNUVis4aEtXcWlobXBzS0hPOVd0ZHpFSGhWOVpn?=
 =?utf-8?B?WUZNRVNlTksrUUVla2VFOGhmb0doWnVES0ZWQmFDMUVncmI2L3dwWEtrZ0Ri?=
 =?utf-8?B?eGN0V3l4cmdDeDVKbXVwankxSEx6Uk5EWHJUQkp1eGhXL1V6RWl6SFBrbUdz?=
 =?utf-8?B?TTArSElRbEc0UDNFK2JiOW84QVlGVVpFS2dzNncxNXQ0cHE3MlZhQk5SRGli?=
 =?utf-8?B?NHllU0ljL0NNSm1OK2QxY2hNVXQ4SHRENFVFbkhUK2hMN25nN2N5Zlp5MzFC?=
 =?utf-8?B?M2FSYTFmQ3RTaGpPOFJvZmZ5V3IwTm53ejhwTXozTmJCY3NHU3dDU3ZVdmJs?=
 =?utf-8?B?N05ISUMvWHdVWjFKWHYzemc1bDdQditHeXJQZ01CbXg2MDR2TnUxNkRCenRW?=
 =?utf-8?B?eCtOeGFPNjJrWjBFVXl0S0cwVHdwNlFSbUhxbDVXbUxONWR1Z2wyd3JQalZK?=
 =?utf-8?B?N1Vualp3ajJCOXlBR3hJSGQ3am01UytoS0xjTjR3T1NKMkN6Zm9mVWpGUVJY?=
 =?utf-8?B?NWRpNko2bEhLNUc1bTJ1ZHowM3NyWUhBR0Z1YlM0cFZsOXhLTlp0VkZkc243?=
 =?utf-8?B?MjFIQU54VWFjSmh5OUdwdlIxOUpQVS84L054cmRyUTVmR0x0ZmVnVmhacWJx?=
 =?utf-8?B?U3NsK3c5a2pYVmN6VGpiREZiR1dUNlFoQVRQTUdTemlPRkt0ZjJLTmE5V2V5?=
 =?utf-8?B?VHNvOWxQcWJkWk5KdEo3M1lvOWRMZllpZ3FTUDhqOUMzUU9UalVleXErTHlF?=
 =?utf-8?B?MEt6bmdaZEd2V1UrVVVDV0VUNFBLNTh0RW5YWVJWWlMzRUhhTlB0QU4yMklp?=
 =?utf-8?B?Z0RuWmY1eHI4MlNPMmRlSkdHQ0xyZldZY3FjOHB1Ry9QREYxUkMwczdkMnE2?=
 =?utf-8?B?aUFVcDd2VHYzYWhyZUVlUndIblZiWjN5RmNiUS84L3pDNHNTVHgrY1BzOW9N?=
 =?utf-8?B?L0k0a2dNZ092UzhRdkcvc0JNb2pDS0FTTndiWm5sd08yRExEQy9VNHFwclJG?=
 =?utf-8?B?UmRpcmcxZzdVaFRzYnQxckNzTGo3SGJXU3V0aWRJTUZnWEhjcThKV2E3NHRM?=
 =?utf-8?Q?hPTQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekMxQWdTYVozNXV0SFpybkg0Y1hZNVlxaURoOW04YjdLTHlDeVlNYWdVZWpM?=
 =?utf-8?B?dDR4a2UvYklCdmc1ZG45Smw1ZysxS2kxbWR4aFBsTHlBWDFjNndDOFl4WkRQ?=
 =?utf-8?B?M1NtWWU2b2FjSHVkWnFKQzlIVTdka0pmaGRORTBmc0FTTEZzMnU1dnQ5VlZp?=
 =?utf-8?B?bVVvUHVPNUZJT0VadGNUWm9OSDVXUk5lQ0w0WCt6NHZjaWVwOHQ2bFFSNm1E?=
 =?utf-8?B?L1ZmaWE4bWtJZnFnUHdtd1ZHd21mNzRZc1RmRHVZK3ExUUNYNm0yMnlGSGtY?=
 =?utf-8?B?dENqcWN5MWdyTlV2aVhobmtEbzZtQWtlZzRXOXd6YUZKTzJKbEh5TVlvdGQ2?=
 =?utf-8?B?bk9QcGY1eDZLZWgzMTlySncxRE9KeExQYmF6aE8xa3I3elRldTMzZnlFeWc4?=
 =?utf-8?B?aGZ5NitIbmlMUGVVd25yYTg4ZnFxUUJvT1VKb3FvWjhjUHAvem52UFIvUzdI?=
 =?utf-8?B?eFhBUjd5MWMvWjE2MW02R1lrdk9nT1J2YmlkKzRKanNkd0ZOeUlvUzZzb3Iv?=
 =?utf-8?B?TlVQTnZEU04yVitjZTFtVzRSTU5meVZFTGJ3MUt1WWl1Y1lqYWhHRDRyWXJ5?=
 =?utf-8?B?dUxpb0gwbkhpWUR1L2E5WFp6Mi9GekwrZzV0MXBkZTJmSVExZG9Qb1hXMmlt?=
 =?utf-8?B?SE4xU0dSWmR3Y0ZCUVYraTBNSUFLQW1aSkxhOUlobXBXanFlOG9jdUNVdUR4?=
 =?utf-8?B?a0FpUmVQRnZqWWFxMnpocXY5MFNhYUFSUHRKM3pLbVhIN0dYZ0ZIWjVNVHpI?=
 =?utf-8?B?SG9SRHYzK2dyZGRFaUJpcFJ1ZkRGZFoxV2cvVmgrMXkzZmhSeFlnWC9NVUor?=
 =?utf-8?B?VjNzTEQ5ajZtaXlYR3dUTWtnWGZheHU3cnFBVmcveCtRYU1jUW9VQ21jYisx?=
 =?utf-8?B?aFNqV3QyMjhXSzBWVXpvcktkUDRVVTJTc1pIWXdFVDBCekRSRHVGRHhkS2VY?=
 =?utf-8?B?bk80L1FyRmZBdkMrZ1pJc0lBc1lOREtFQzRnM1k4N3NUUVkrRTRiTkNoRC9k?=
 =?utf-8?B?eDRPYlQxRWN3VWhFZURabDRGR3BWU0FGMDdheFVEdW5UTlVsT0Z1YkZHbkd2?=
 =?utf-8?B?Kyszd0RKakU2L2o5SDJERFAwRTJvcFpjL1dQWUpaRm4yZTZyOU9jMk1MUUJn?=
 =?utf-8?B?QktyMkRKUE1DT250OEVjdnJUckxRTVBud3VXQjdIblVFWVFXV2lkZ0hXa0FZ?=
 =?utf-8?B?SWRPYm40VlRIaS94MmhjdEZnb0M4OStDaDkyZzJmZTMvd0lZSFc4UmdHbURQ?=
 =?utf-8?B?MGdwMFFGb0p1WmpTTzJZREtwZy9KaEJTVXNEN1pCbGpkdFNnL2tCcThCYUdR?=
 =?utf-8?B?SGlDZ3BpZi9sN2hFVXhJaHR0UEdhTkFrVG5iYnBOREVqVmVidE5KUUJSUm1q?=
 =?utf-8?B?WkI5TVFkeDVyeFpZMHhnYXJCa2p5SGszMmpNUXMrTmZPdUs5aXNwUkREeTUx?=
 =?utf-8?B?czNvWGQ5YnZocjFFVGpGVUsxVEU1Q3FDaFpVUWpVOGNIeXd4M0V5Sy9lSHpR?=
 =?utf-8?B?MnJ0R1djblNyZ2N4c2VpTG1jSmswMlV2dmxjd1FLd1J4ZkxmRS9KVU9mSVR2?=
 =?utf-8?B?Z1BqczJ0TFVQc1hUaW8yOVlCS0RFck1HcEkrajVOMEQzRGNuNEJJQTdkSHps?=
 =?utf-8?B?a1N3b3hVckFaazZYWVRxUVRUQlZ2cXJVeElDRWRrNjZDa0hjM2JvNUN4VHdP?=
 =?utf-8?B?dThTa2FPbk0wWTlKb2hsMjRQa1FlemxrYTh0RC8va0JPQlFGUTBnL1U4TEpV?=
 =?utf-8?B?aTdlKzdTWjRFSVduYkg2WFdtY2NIS24rRDNmd3RTT0VQTDV6RS9xSDZrbDBB?=
 =?utf-8?B?ZTlYSkVXdG1sekFvWU8rMFg0bmxoR09CdmJUeW53U0JQNjF6RFBIVDdQOVp4?=
 =?utf-8?B?M0RqKzNnaWlPWjlPdGx2UzNiQWNxRndqRitrc1Q0YkloMnhkQjJud09PaGV1?=
 =?utf-8?B?dUEvbVg4dEU4bEdzallXNVpzaE5KdURIaTBzUVd4L1duV01SeC9mb3cwUnRo?=
 =?utf-8?B?dzdtaVdvc3Z0aUxmMWgzWTFqOHM3R21rUFJrYTE1K2VOaEhVdHYveFFSYXFw?=
 =?utf-8?B?ZEpiZ3J6ZUhUakgzRVoxelkybEx0RG1TbmNzU0E4bVUxQUs1T0doaThBbEFt?=
 =?utf-8?B?aW92MStQMVBIR2M0SHpUdDhYdWFqNFNUOXRkVmhKVlM5QXJCdXdUWFVlSncw?=
 =?utf-8?B?RHhkcFF6eUoydDNEeWRTaTB0ZUd5Vks1aGQ4QzBMN2MvVnpYQVhaeFZqZmZz?=
 =?utf-8?B?c1gyYzRCR3Q5L3dEREU1cW1DQndFdUowZCtIRkRFNlY5SHZOY2R0VktPM0JE?=
 =?utf-8?B?ZEl2bjhwZmpzMGtqUHYyRzI3QytZM1NycXF3dy9ONzMrMDNXeGZEQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 476c8d71-8c4b-45e5-cb37-08de6d46205c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 10:28:29.2067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n7I0oFb3GARBiHVsM39QxcGUGhxxP5DDWjuZcSU3mxx2WrO32Ds/k1Ce/L+xl0b+EnA573k3szH6hdjJHpN4id6K6Gicg8WmM5n1ZiDH2oI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5183
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,m:Bertrand.Marquis@arm.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,citrix.com:mid,citrix.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 22DE4142581
X-Rspamd-Action: no action

On 16/02/2026 9:31 am, Bertrand Marquis wrote:
> Hi Jan,
>
>> On 16 Feb 2026, at 10:21, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 16.02.2026 08:47, Bertrand Marquis wrote:
>>> The SMCCC v1.1 inline helper currently forces a1-a4 into
>>> unsigned long and uses in/out constraints for r0-r3. In
>>> contrast, a5-a7 are passed with their original types via
>>> read-only constraints. On arm64 this means a 32-bit signed
>>> value in a1-a4 is converted to a 64-bit unsigned value, while
>>> the same value in a5-a7 keeps its signed 32-bit form. For
>>> example, a negative int in a2 is widened to unsigned long, but
>>> a negative int in a5 is passed as a 32-bit signed value, so the
>>> SMC sees different encodings depending on argument position.
>>>
>>> Switch the helper to use typed input registers arg0-arg7
>>> derived from the call arguments (keeping a0 cast to u32) and
>>> separate output registers r0-r3. This preserves argument types
>>> consistently across all positions. Argument evaluation order
>>> is unchanged, so we do not reintroduce the issue fixed in
>>> "e00dc325bd9e" ("xen/arm: smccc-1.1: Handle function result as
>>> parameters").
>>>
>>> This also aligns Xen's SMCCC parameter handling with Linux's type-
>>> preserving behavior (same externally visible argument handling,
>>> independent implementation) to avoid surprising differences
>>> between a1-a4 and a5-a7.
>>>
>>> Current callers (PSCI, SCMI, platform SMC pass-through, OP-TEE,
>>> and exynos5) pass unsigned values; exynos5 passes an int CPU id
>>> which should always be > 0.
>> Reported-by: Andrew ?
> Ack, sorry forgot that.
>
>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>> ---
>>> xen/arch/arm/include/asm/smccc.h | 69 +++++++++++++-------------------
>>> 1 file changed, 27 insertions(+), 42 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/smccc.h
>>> index 441b3ab65dee..5b30dd57b69d 100644
>>> --- a/xen/arch/arm/include/asm/smccc.h
>>> +++ b/xen/arch/arm/include/asm/smccc.h
>>> @@ -99,87 +99,68 @@ struct arm_smccc_res {
>>> #define __count_args(...)                               \
>>>     ___count_args(__VA_ARGS__, 7, 6, 5, 4, 3, 2, 1, 0)
>>>
>>> -#define __constraint_write_0                        \
>>> -    "+r" (r0), "=&r" (r1), "=&r" (r2), "=&r" (r3)
>>> -#define __constraint_write_1                        \
>>> -    "+r" (r0), "+r" (r1), "=&r" (r2), "=&r" (r3)
>>> -#define __constraint_write_2                        \
>>> -    "+r" (r0), "+r" (r1), "+r" (r2), "=&r" (r3)
>>> -#define __constraint_write_3                        \
>>> -    "+r" (r0), "+r" (r1), "+r" (r2), "+r" (r3)
>>> -#define __constraint_write_4    __constraint_write_3
>>> -#define __constraint_write_5    __constraint_write_4
>>> -#define __constraint_write_6    __constraint_write_5
>>> -#define __constraint_write_7    __constraint_write_6
>>> -
>>> -#define __constraint_read_0
>>> -#define __constraint_read_1
>>> -#define __constraint_read_2
>>> -#define __constraint_read_3
>>> -#define __constraint_read_4 "r" (r4)
>>> -#define __constraint_read_5 __constraint_read_4, "r" (r5)
>>> -#define __constraint_read_6 __constraint_read_5, "r" (r6)
>>> -#define __constraint_read_7 __constraint_read_6, "r" (r7)
>>> +#define __constraint_read_0 "r" (arg0)
>>> +#define __constraint_read_1 __constraint_read_0, "r" (arg1)
>>> +#define __constraint_read_2 __constraint_read_1, "r" (arg2)
>>> +#define __constraint_read_3 __constraint_read_2, "r" (arg3)
>>> +#define __constraint_read_4 __constraint_read_3, "r" (arg4)
>>> +#define __constraint_read_5 __constraint_read_4, "r" (arg5)
>>> +#define __constraint_read_6 __constraint_read_5, "r" (arg6)
>>> +#define __constraint_read_7 __constraint_read_6, "r" (arg7)
>>>
>>> #define __declare_arg_0(a0, res)                            \
>>>     struct arm_smccc_res    *___res = (res);                \
>>> -    register unsigned long  r0 ASM_REG(0) = (uint32_t)(a0); \
>>> -    register unsigned long  r1 ASM_REG(1);                  \
>>> -    register unsigned long  r2 ASM_REG(2);                  \
>>> -    register unsigned long  r3 ASM_REG(3)
>>> +    register unsigned long  arg0 ASM_REG(0) = (uint32_t)(a0)
>>>
>>> #define __declare_arg_1(a0, a1, res)                        \
>>>     typeof(a1) __a1 = (a1);                                 \
>>>     struct arm_smccc_res    *___res = (res);                \
>>> -    register unsigned long  r0 ASM_REG(0) = (uint32_t)(a0); \
>>> -    register unsigned long  r1 ASM_REG(1) = __a1;           \
>>> -    register unsigned long  r2 ASM_REG(2);                  \
>>> -    register unsigned long  r3 ASM_REG(3)
>>> +    register unsigned long  arg0 ASM_REG(0) = (uint32_t)(a0);\
>>> +    register typeof(a1)     arg1 ASM_REG(1) = __a1
>> Is it intentional that you switch to typeof() rather than directly going
>> to auto? This was it'll be more churn, aiui. And if deliberately going
>> only half a step, perhaps worth saying so in the description?
>>
> Yes it is because Andrew wants to rebase his serie on top of this
> patch.

This patch potentially wants backporting, but even if it ends up not
being, fixing the SMCCC types should not be mixed with the auto
conversion; they're both subtle changes and unrelated.

~Andrew

