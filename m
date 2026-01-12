Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 027D4D12136
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 11:55:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200069.1516083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfFaN-0006kQ-Cn; Mon, 12 Jan 2026 10:55:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200069.1516083; Mon, 12 Jan 2026 10:55:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfFaN-0006iu-9z; Mon, 12 Jan 2026 10:55:47 +0000
Received: by outflank-mailman (input) for mailman id 1200069;
 Mon, 12 Jan 2026 10:55:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j+ET=7R=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vfFaL-0006gt-KH
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 10:55:45 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e188738-efa5-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 11:55:45 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA6PR03MB7830.namprd03.prod.outlook.com (2603:10b6:806:42a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 10:55:41 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 10:55:41 +0000
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
X-Inumbo-ID: 3e188738-efa5-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l4lD4Dn7P5q0a/C7SVB2drz2Osy1nQJ7DwsER/44G4h4DeEhdNyZnpbW+Lz5JaTGCF0OVUHdRppt7aWcxq0MbICXsJbWAfcNbMFmJQcBXPm5Tslx38+ZmXSe+XzLv0sQyPNyXBb14a6Bu5RjNLVAwkXgquleqyW7DqB0HLTsEe6dTHlmytFD0LZmMq9nxaaA02BFhqslUPBSBQyvGTwgIT0DW704TttNV6MUVyvNe9POSdAjpysO2eIAF6kS7J0FedCYyQD2PmW8pzkbPZCg7lsQqCJUHjpO0AyRh/cexBW/Xecuui72Gf5RDfATT2Rq2lkGn5m42NlgLO3TZLh4Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fGMd9dCw2jxOIgg6Aa7j+76NQID7VHLeTGk8VWtlkIA=;
 b=s4zEdShDhLcx/wrx5+1shzADKSwmNJ4JJhpZIv7b9BJJYeDqsgHq2ZitPTsKoJaeRwYOUqH3eF9Y/Fc8vaPnI/gzzlg40mAHt/roLGAW+xC7XSxJ6VPg1gCJBlVPwrQPfdTurPGJG0iBlEMLR2AU8TcECtxIrDHmiZ3VbUW2XcepzOIwCyvtDvlqKXnGTAC6IA7RpCrKCTZMCYbQRQWzos/+Xu+H4OkEVl9mrYTe5yMcPGSeipl/1sVwL1AU9pjO1ge6V8BwheJGBB5injbyxxRLBaMtk7ok69slh5+Bh0luCfskbuOIxgDOCqRdRYL8ImUOlDT8i31CzScRAmcN+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fGMd9dCw2jxOIgg6Aa7j+76NQID7VHLeTGk8VWtlkIA=;
 b=0dhbCql4cfEje2F+R30/6yvOtIKc57Gfj1oWeFZtccgB6UBB4LHhoYOIAziqi8vO9YU/XZ/3Vy8kGWtM2WTU0MAMN5EMvIizAV6qWrLjCzlWDmoCMl42mXsy/y+TVBaKuU/+UJRMiV+bHhx53DPWQq4N86RFsPB5NZajq5zGg9k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e17bd785-636e-46a8-96fb-48a8b093e898@citrix.com>
Date: Mon, 12 Jan 2026 10:55:38 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/nodemask: Remove _unused_nodemask_arg_
To: Jan Beulich <jbeulich@suse.com>
References: <20260112104015.1001907-1-andrew.cooper3@citrix.com>
 <3b0d3397-cffd-4017-89da-6850101d5f9a@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <3b0d3397-cffd-4017-89da-6850101d5f9a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0117.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA6PR03MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c63836a-d14f-40fc-b2c4-08de51c920f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d0VpOG9mQzhwTURwLzM2eUtoak5YdFk0S1ZOeHFwQitrYnM4RnpLS0R6d2Y4?=
 =?utf-8?B?TmNPalptVGpBNlJDRzlYWklxRFJVOGowcEt3d0NFRGJZV0Z4NzJCSFNVZzF4?=
 =?utf-8?B?YVZhOVBaWEdtLzRobkpxZFlaalQ1N1B3dFhDRVFXQ3JpOHFlcG92UUtqT0o4?=
 =?utf-8?B?akEwRHRwamxXTWdyUmU3VWQ2cFVKQkxMY2tZL2ZoS1daaCtQZEd1UUlmZElF?=
 =?utf-8?B?cEVhaW5jWW5BcEJKaG9vR3o5UG9sNFNrc1dEQzg1QVpMVjBJZFhaSTdDYktM?=
 =?utf-8?B?ZHlFU2xVMFpRcXU3VXpBQk9iZEoxczVabS83a1Nra1RYWEdHS2hDN3BlUThJ?=
 =?utf-8?B?VWY1c0lCOCtBZjFoVThvNXRjbGMxbFJNS1dHUTRtdEZhNDZrb2w0dm54VEx5?=
 =?utf-8?B?aEpvcTFrVWZpZ1F5TWhOSmdGdGZWdkVIQTNweC9ybzJFMzNTL3Z4OUpnY05S?=
 =?utf-8?B?Ymx2RGdIOGNzU0FYanc5RndDMUErV0Q3WDFyRnBlYVFaeUVwZkx2eGdKTG9V?=
 =?utf-8?B?VW5aZXFiamZ6REk5M3IyNDRyNytNRzI3Q3J6WE83UWVxZXpTeVdYYzdDcWlN?=
 =?utf-8?B?SlZkWWR6bkFxWDhSSndPM3hkRExrWUJEbzhMekF1dmMwNDMraTNpNE1sdWNP?=
 =?utf-8?B?TUhqVG1uVVFaNGJJeXlvYnM4U2YxQy9YaHZsMWgzOXJPZEQ1V3FsTEtBaDBO?=
 =?utf-8?B?T1R6QmpHclNTMkErdW1LZGoyVHNycnF3RnAxMGNKVmlRbTFVZFpnVmlyMXZH?=
 =?utf-8?B?Z0pkYlBLSmhyMzBXUVB5TjlySzRvaEwzSGRqTlJ3cGpDUzNzNFJlcEwyYzA5?=
 =?utf-8?B?N0J6YXdCdXN5S0YvVGRWVG5Cd3NKeHpZdzY5bjV0L1NLM2ZidUxIbG9iZ04x?=
 =?utf-8?B?U1g1SFNreVhnT1RVWXZjT0l2UGdNOFBpdmRJeU1zL2lSOWtjZjNvdWFGTUE1?=
 =?utf-8?B?azMxbWtoM2VuNkZsYjcwVnhBd2NnM0FTaDUrc3hjMFlJaTREek1HbTlFbmdJ?=
 =?utf-8?B?bTE0RTJIbEJwSmoyRnRyY1luY1JON1FtQ0tpNkRCY1JKcVhKT3Z5M1FSVFNP?=
 =?utf-8?B?NnNrZXNNUVFBanREUmsyQU16RnB4ZDF1TWIwSTllV1FoemFJUDhkcUNMWkVF?=
 =?utf-8?B?OHUrVytTQTU0SGc1TkNOZlRDMEtjMTdFV3hhRS9VRGdwU3UyZURUV05mVGNI?=
 =?utf-8?B?Z0VtZGN3cFQwVkxOMG0waDN2UkRtYnE0ZHBVMjRYTUpJSzdvTUxKUXBuRldY?=
 =?utf-8?B?WDJFZDQ4MUdINFJGNHpkeGQ4V3ZSZDRIcmNYSEpncktRVWVsUzBmSjczZ3Bl?=
 =?utf-8?B?S016ZnZ2NUllckJ4YVM5dkk2VnF5V0tudUtjdDQwVmhqNVkrQ09nZVRaWFQz?=
 =?utf-8?B?K1FDaUZ2WjZNcWdHdjJKT0VxOVVjMDF0Mm9pTXFzS0xLMjJYNjRBWCt4a3I4?=
 =?utf-8?B?OW5leGdpTC9FMDNWRnZDSVNqcUZXMzhNZUxiczNQRStFQzcxUnhWeldtM0dF?=
 =?utf-8?B?MkJrOWE5UVEvR3VEYVU4TTdTUGdHZW5kR3RCdUE3ZXZyaUI4N2M4NVRsUlNC?=
 =?utf-8?B?NXcrdlhOMUNzaFVEd09sZzlEMWRJTWRLdkF6VTVPVmgyTDVWQStSSnREeFhN?=
 =?utf-8?B?c2RwQkpwby9EcWgvSVZ6eFpXbjRCS0FlUm9QN3Q4TE53YTB6c1VjNy9FdklJ?=
 =?utf-8?B?aUgvMTRPem0rbGpVRnFNbERyVElhd1lVK0g1L0h3czNac25ReVA1YlprL0Iy?=
 =?utf-8?B?cTQxRkYwVjU5Q1ZhSjZrMzlIN09hSTZ6OEt6U21kQ1FiRXNxa1FRRi9kKzh6?=
 =?utf-8?B?OEVrb2FNYkdJZUZXUGlOWTJrRHhXNDRJYXowVmUyZXVhbS9ldjFHVnRIaGdy?=
 =?utf-8?B?ZFBnRjNWTWNMN3hSY09XVk90ZTM5UzV1dEZyRXR0MlZYREpMbUVHVU1UM0RI?=
 =?utf-8?Q?3UpBPxJJwNNwzeMrIs4mrPNp2tgsviIH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3grejdnL2lIdytPeFRpNVV2amNuV254WEY3V1hzWjJZNUtlcmM2SzBqMENC?=
 =?utf-8?B?YlZSZ1p0dThhQmtMMEU4azYrenhEdzNvcWlnempHSTh0OXdvQlJBbUhKVzNO?=
 =?utf-8?B?WjlOMFFkaE5JVmpOaGF5V2lKRFN5TTBsYmNZdXhsSEtId0taeHRmM0Nud1c3?=
 =?utf-8?B?V21mb1NvYVRNTENuWjRlQXQwRlU1Z2R3Q2JLU1BRQ0l4TXdvYi9pVDhNUnRZ?=
 =?utf-8?B?THNMUlA2eldjZDNtdGZxeE5BWEFIMnpUcHZaY3FJZUQzUU9tSFN5ejRoZmpE?=
 =?utf-8?B?ZFh5MVpXUWNDQm1RbHo5Vk9mYXpLWUh1QUY0VDVtNXpLVFRwb2p3QmNqdDFx?=
 =?utf-8?B?Rm5UV2dHb1dTWmNxODQwSGhtUlQyR2dPdGJxWjFCZHd2WjZ4RW0xeXZXVEti?=
 =?utf-8?B?ZUlhMkI2U3NRL09IaGhmdVd3aXFDdmhxV1VBeWRNQlkrVG9SMFFIaXlidVVq?=
 =?utf-8?B?eiticnJJcURvTE54eThBVlZuL3MwTThFVnQvMlE2VEZvQjdhRXc1bWZMOGpn?=
 =?utf-8?B?THFTR0FGNitMTXdjZ3hCMVVsbnlwZGR1QVpLdlJuVjFwWWFXZ3h4WE5RczJ1?=
 =?utf-8?B?M1lCdmhVTnRyUlpGMzk4WlF6VHcrSmpUR2I5MmVlWWp5am5DeVJsOVp0RCtz?=
 =?utf-8?B?My8ram9kR0pTbWZoM0laU0lpbzB6NmRhOEg5TmRuNGs3RVBSeWsvZjNaa2pD?=
 =?utf-8?B?Q1NKbzNGMDdmYXFhQjlqQWI1bTlaOWpDeFhoVDl2SXhJSUdoVTlzb2s5UnUv?=
 =?utf-8?B?eE9XRHdqQm45eFRveW4vNDBxNm1NL1RCc1hIZERTRnFKUldEWVV6Q0FSdWFt?=
 =?utf-8?B?L3lmQithMDUyVERrSkJVbnlqMkJKRS9DQ3pGbm9WaDhNTzNIbEN5NS9YVFkv?=
 =?utf-8?B?S0dndGQ4aklZV2ZNRVZFN1kvMEIraGlzQmRpSm9lTFpBOXBWQWJpMVpHWG1h?=
 =?utf-8?B?Ty8vRWJXZ2tUd0p3RjBDTHZ4RE4zc3NrN2c3VW5NVHNxa2NacTFHQmFLamN2?=
 =?utf-8?B?ZS9TZWRWOGRrSXZ2VXE0T2M0RjRIY3J5b05wYU1VcVdub1VQQzd2NWoyRE5r?=
 =?utf-8?B?c1NabUFDMFk3Vk1IOUMrUG96Ynp6bGhTTDNzOG8zRG1nd3dRTEV6alVLT0Vj?=
 =?utf-8?B?cjJhU29yY1Z1NWtFb3M2Nm1OZmYvU2ZJKzU0T1I0Q3pzaElSdmJDeXBJSllp?=
 =?utf-8?B?RGRXWTFDS2x0dnY3UFpvVkt2d21WbnZsWTkvNlpWTUFjdzRmamdqZmhrR3R3?=
 =?utf-8?B?V21KODlkUVFnVFVkZWQ5akJ1L0ZBcHpCL2htSXY4SW5zUFlGWEozVWYrN3dp?=
 =?utf-8?B?ZXMzOHI1SjhWNXhPV1V4OE1GVVdYazg0aFltMmxodDlIS0RyWldxb3h2TVFW?=
 =?utf-8?B?NHZvaWxxb0x4ZzVKTGc4SjZON0NsMy9FV3pha0wzZEhrWi9RYzNtUno4ZW04?=
 =?utf-8?B?NDZGdUJDdDBjK1RmVVB5YXlTRlVOZ2ZlM29velZkVWRFTkg0MGUvOUZRRzhI?=
 =?utf-8?B?cWVjeVdyOGRPcER1b1JUTGFiK1VGTjBPYWRaZEZ2M3p2Tk0yTlYzMFhiQ0x6?=
 =?utf-8?B?L0w1MU1HQ3VtRk1kZ0F5VEs3TXZxam5lNXlzNFVxaGI1NVBpTlczNWd3VjlL?=
 =?utf-8?B?V2pkYjhjaGFOV1BIdFNsRERBUE54Z3lKMStFYVZ6OWdyQkJpbEF1aUEyaUZp?=
 =?utf-8?B?OTIvSXNzS1FCU3pjTzlWNTJHd0loL0l0WVEvTFF1dmFzcW5FWWxEZmVsaDRC?=
 =?utf-8?B?WVZNVlRlUmlWeE9wSHgreFRvNFN1TzNxdm1tcmxoQ2xYT0FscXJyaUFORU10?=
 =?utf-8?B?ZWNkVldZQlczUHhKODMreGt2b21CTDZLaGd1MzRKcExDZ044Ym5HVnhqNEY3?=
 =?utf-8?B?V2NHY2ZZZ3BsNjBaWUFld3lOL3VJdGE5NjJuWUZvWVVCNW8xYVErdWRBVEhh?=
 =?utf-8?B?THRGOUsxUXFpM2MwMVVjRGNhVzUybDMrSGZpZVJWR3NhWi92d1VkRldSTW4x?=
 =?utf-8?B?anV1aXZtYk1ReUFEUkwxNHBkZzNTMk1KNWxWaDU1VC9OR2g1RXlyVUJqZjFT?=
 =?utf-8?B?TzF4UmtGWmd1dG9VVVJ5OERMQzhnaUNQbFRMb3AvWFExbGtFS1FIZDVmVDVq?=
 =?utf-8?B?REduL1Z2aXBwZFA4T0J2QnJ3di91U1B5WW4xM1V2ZUJOYmhYaDFUbmFzNWJZ?=
 =?utf-8?B?L1ovSjVZTU55SG9vUjRtS1ZydUs4bWk2VFB2d1FDRWQ2R2Ixb25IUkdlRVdU?=
 =?utf-8?B?c3V2UDVidzNFZTRTeStFWklWMmxXYUxVQXRrb09NYzRUTmx1VXZDc0VPeklQ?=
 =?utf-8?B?ZFpaTWd0MS9iTU9oNERyR1poN3pxUy9wL0huVmVmZFJkaDFvazlpS091VHFQ?=
 =?utf-8?Q?/SBJirwcIF3URsDk=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c63836a-d14f-40fc-b2c4-08de51c920f1
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 10:55:41.7639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N1JcuOSJ6Mfbq/F3wX8QvT504dhGGRV1x5ZoREMmQZtkwtPUq4i9r7k1cKtr67kA2TmrobUs0rYxKTYyuaaHansXDcpa+xSK0MzQIPrru8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7830

On 12/01/2026 10:47 am, Jan Beulich wrote:
> On 12.01.2026 11:40, Andrew Cooper wrote:
>> This only exists to have it's type taken, despite there being a perfectly good
>> concrete type to use.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
>> --- a/xen/include/xen/nodemask.h
>> +++ b/xen/include/xen/nodemask.h
>> @@ -67,8 +67,6 @@ typedef struct { DECLARE_BITMAP(bits, MAX_NUMNODES); } nodemask_t;
>>  
>>  #define nodemask_bits(src) ((src)->bits)
>>  
>> -extern nodemask_t _unused_nodemask_arg_;
>> -
>>  #define node_set(node, dst) __node_set((node), &(dst))
>>  static inline void __node_set(int node, volatile nodemask_t *dstp)
>>  {
>> @@ -215,7 +213,7 @@ static inline int __last_node(const nodemask_t *srcp, int nbits)
>>  
>>  #define nodemask_of_node(node)						\
>>  ({									\
>> -	typeof(_unused_nodemask_arg_) m;				\
>> +	nodemask_t m;							\
>>  	if (sizeof(m) == sizeof(unsigned long)) {			\
>>  		m.bits[0] = 1UL<<(node);				\
>>  	} else {							\
> Hard to see why Linux would have introduced that either. (It still has it, btw.)

Yeah, it is a bizarre construct.  I only noticed it when trying to do
some more typeof cleanup.

~Andrew

