Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 400ECCC77D9
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 13:06:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188771.1509853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVqI2-0005hG-2W; Wed, 17 Dec 2025 12:05:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188771.1509853; Wed, 17 Dec 2025 12:05:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVqI1-0005fV-Vi; Wed, 17 Dec 2025 12:05:57 +0000
Received: by outflank-mailman (input) for mailman id 1188771;
 Wed, 17 Dec 2025 12:05:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B9rb=6X=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vVqI0-0005fP-4T
 for xen-devel@lists.xenproject.org; Wed, 17 Dec 2025 12:05:56 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd54d313-db40-11f0-b15b-2bf370ae4941;
 Wed, 17 Dec 2025 13:05:55 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by DU4PR03MB11100.eurprd03.prod.outlook.com (2603:10a6:10:5f3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Wed, 17 Dec
 2025 12:05:52 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%6]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 12:05:52 +0000
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
X-Inumbo-ID: bd54d313-db40-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Up3EEPEnttvw9YiUu2oP0U0r9PzGstk0Th64En2t2C58A2EvKK4vkgfAu2JEWc+GTu3AqLleiNFdl/clb6G6MN5hIgXYBY/bxFXWubpoYFUfFc08kQh66lIZ7TzHOzLN+Cp2GB1357FkRr8pTnO47gHiBdcYDPZUjr9GVvhMzcZ9ndfx+IQB4vbWr2Q13Ecx6j7cgutxicWlApdMRDaeJCk2c7i1kiHBRcNel/dXD2bIruid6e6BRT1jQ7S2xInoK7LAZvwjiuHbK3Sd9s60dTqFdL0Y55Phhu6rxAyYW32Bh98XLsKRU+EFAA1j6EXQIze3nhuEp5mgLdAQkzMZug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6K3l6d0MF1Q8SFLre9eWjfBSFP8P6q4fUhQfNI1Zr1s=;
 b=SrOoUzKtAZQTqDsGctJ1hrUMLFOytoi5PDfRn80SMVYnjocrDlJszBGEuC0AB/RhCKBjMw2PZ/ujClsHLb9f8C56xdhUazQ08iRSLF19Ztw0G78B/7scb1qP+RyS6hZs/OMJBB4zaYu+U4EXp7e6JPsDJz6+2Qzr7pN+tlC3ObYOzBo4lZsTj7o1VcKEcV5lGWZzWs0qUHyAb+kQ3w2uUPEeLDP2RicZDZb8gPTAut1crx+mUZIRyXRS7S+TKP6sh7U2+yIZOMwRzqkURheesCkwXlh/PK7jl0DPA+ScIYDgaIoBff8A7c3cQLIo5urzVAu5trexq+93ApiQ7/tDRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6K3l6d0MF1Q8SFLre9eWjfBSFP8P6q4fUhQfNI1Zr1s=;
 b=bfBXEv4i7qbd/I6BiQDFvCfX40ZEhqfO6SSG9n2T/ZR3TbQMnZilsk58wYCTX+zIDqjkOFP42xJ9dl/i5Oh0I3zkQ2Vq3+gyaQqUzdALj9fUBeN+4eT1mHXDVXPF/pORyGiskz7VfajuX+/P65wNaEzXUUPJolavzV4GfIRsro8c2rVoS0Y9dcwNGeUf5iPIdPbI3iCJygCmIrFtSWVfqYO8p6z4n2LjQL4gdSnbUSDnHCc8JirIIkPUZhtIRn0jWtECvUmfegCFyrnEGGxv0n2iRQ6LstiWHznD6OoMdURsHuRdsZIBnTWEoJzkB6TlOENsh8XCJFPSEal+jUndYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <927748e8-4116-422a-ac82-5ad38970bea4@epam.com>
Date: Wed, 17 Dec 2025 14:05:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] xen/x86: move domain_clamp_alloc_bitsize() into
 pv32 code
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251216231348.3897820-1-grygorii_strashko@epam.com>
 <20251216231348.3897820-2-grygorii_strashko@epam.com>
 <d3c61635-875c-46e3-967d-64def04c7df4@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <d3c61635-875c-46e3-967d-64def04c7df4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::28) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|DU4PR03MB11100:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a9fb545-9b05-4d0d-dc42-08de3d649fc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bFFVNlJ4VVpXOWxsb0NOY3J6ZW1IalZLQUhIaTU2L1F6R3R0WWRYYXVTMUtw?=
 =?utf-8?B?L3EyZDZmUVArR2NVeHllNzAzN0JqKzEzZGw1TEtkRjl1V2JoTXdCVXMyaFVF?=
 =?utf-8?B?eDYveXhKSWk1RkcwMGdjbzdOcHlwT1JnQ205VUZ2aS9BM1pPWjRCQWxlZzJi?=
 =?utf-8?B?RUwrbkFOY2syaTU0bkRXbnFFNStjZWZ2MS9ya0ZsdTYvb092em9zeWVFa0tM?=
 =?utf-8?B?N3pHNzV4RCtoSU1Ec0tMTlFTR3UwSDVvQWpwOWVVOWVmVXJmU3ZCVmJtR3Iw?=
 =?utf-8?B?K0R5NlJJQytGWG8vbStRT2tQZ1cyd2hnZU51UklBWnRicjZJOWJ0VWZGTXh2?=
 =?utf-8?B?RkwrSnQ5a3hHL0p4bi9XNFBuNWdtMmZ3Z2xXQk9FRE1XYTluM1Z4enQ4c3dL?=
 =?utf-8?B?eDNoSXUyMFpFTC94ZTduQ3I5NWcwZGR2aHR5di9LMm5kUy9ZWVVGbHMwTE0v?=
 =?utf-8?B?WVhGQUxyS2VCczIvTTBGYjVRR1kyNFlYT3B6Vm5lM25TcjlDYkM0VlZCa1BZ?=
 =?utf-8?B?U0hCM2c4c0gxd1kzWitoQXYwaEhuUmRpWUxjVkpyRFBsWWpJOFQwcmNBNHNJ?=
 =?utf-8?B?STIzZWJzamo4ZGhRQW9lZnBLQnp4eUhwZitkdWhwR3B5Wm44L1d3V3ZnZGhO?=
 =?utf-8?B?UnZGSU05ZEJJKzJrcm5EUkNTamtmdkhYL2NtKzl3d29sTmRjZktaUnUyNG9s?=
 =?utf-8?B?dWYySEwrb2dLV2dzNGxCdWpTKytYUHRiSVNibWpWQzNzZWxkLzZ4V2tDeXp3?=
 =?utf-8?B?SW14anJZYTQrQ0o1TXJ6N1dkM0Rpc0FOTTE0RFI0U3NEVXd0QVNDcW1qZE1p?=
 =?utf-8?B?eW1OSXdtRDE1UmJKM2Y0L2lRL2FwYWZGbjVGVDlBc2hSeGM2TldNdWRUSGNx?=
 =?utf-8?B?MUI5NGZsSlNrZmJmM2lTMnN5QzhQR0tSNDRDSTFWSEF4MmJUbGpEbzF6SlR5?=
 =?utf-8?B?cDZmVkVxMWhWNVozRUJTTGZYMDY0ZDB5ZzVTWUlCeDE5UFdJVHJNVTN1NzIx?=
 =?utf-8?B?L1ZJbUhEK05FTlc3MmJ1ejNCTytNSHNwS040aFl1cHArOFpWcE9BcXUyVSti?=
 =?utf-8?B?cG9NS1FqUW0wU3lhNldDTDRMRUFWUlJ3c0tJWDhGN2NnVllCck8zZXFXSW85?=
 =?utf-8?B?bHIrdXJjSU51MmRPYmlia3hqdTFjTzZqQUs3dzhTZ1lGbitkZFFhSVJhS0Zz?=
 =?utf-8?B?M2NLRUJwMkhVNzVCeExPamExVGExVjVYdjIyYVkyd3lNWFZ2amorUFNiSkJy?=
 =?utf-8?B?d01PM01ZWGFRbFV5M2lLNC9WYU9FQ0w3eHVsV1RuZk1aT2x4eEhiaXVRYzBM?=
 =?utf-8?B?Q09TRmtEY3FRTEZUaVl1TTFIdFVCMUVSK2xYWTlIY0p6N0RqbVliRWFUYmpW?=
 =?utf-8?B?QnF1bUgycFJOTFN0ZTFQNk9KVmhoVzM0djlsSml4YzBXbUM2OElWOHd2bXY4?=
 =?utf-8?B?RG5BR3FaTmZJaVBObUQwdzJLK3NoeCttMUlpQkRWUzJjSzVBU0M1K05VK0Rw?=
 =?utf-8?B?ME1uNDN0a0FlaHNPSWY4MTBPS3lmZ0pIb0NZcmNUU24vbEE2S1c2T05JQjFu?=
 =?utf-8?B?SnNRcWY2MXp5cFBkZzFkUlAwc0VEQUNFTTUxQlRyejRnMHBtOTN4TWR4NE55?=
 =?utf-8?B?VDUxbSs3alozeVVGME9lZWVreHR1djN4Q0ZpOVZBVXNIRWFkNnJKd1BxVzFO?=
 =?utf-8?B?SnVKbjdzQ1NjQVFUelEyL1VyQzgvWkc1MVBsUGtQbTNBLzBoMHlvdHZPSHdy?=
 =?utf-8?B?WkFYRGZMTDRvYVBoTTNvZVMxZFUyMnZudHhKeHpGd3BYdGs5YXNDY1VzWWk4?=
 =?utf-8?B?TkdaT1pHTXNUMWRFMHlsdWkwWkFyRlhadnpNSkpiSm5lbmQzSFh1SFlZbmRr?=
 =?utf-8?B?d0NqakkzZkQyWW90SkhwQUVXN3RXSEJadkZIUkwrb1p4c2ZuUVVySEtzeXpR?=
 =?utf-8?Q?lpoaFMqqtse/QfIadJuS5IdisUiQHNAL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Si9wMUlFdGZZa205U1VPQ1hmQy9RSkV5a3pBdjJIdUZlTzVNYnMyZnlqc1Fp?=
 =?utf-8?B?cm1nVlhObmIwVXNYSXRDdWxYc3hGQ0JkYitGcC9TaGZPT0lUa1Y4cWNSbGlV?=
 =?utf-8?B?SjRhSkdsZk45Ym11WGxzVVlueWJrZ20yajJvdGRSK3BIU3djb2xkaDZNVjhB?=
 =?utf-8?B?Q2VvT3pacGdleU9kbnl6and0OExUS01rMG40Q3dCMmxuUkppZTJJNTJOMDM4?=
 =?utf-8?B?b0tYVUFpS0lEZmNteVZhMWJGYWxFNHhucWZ0WUlPZUxqOUo2ZTJ2YzVNRlZx?=
 =?utf-8?B?S0hSZnI2YlUxbDAzelEzNWNzNW45WllzdXFLNXlUcVJVMkxhVjBHalRBZ2Q5?=
 =?utf-8?B?bUZvZnlDcTZobko5SmNWZWpTbDNRcW5NNUJaNHZYZjkxaVRmZXU4R0xKU095?=
 =?utf-8?B?allzaXd4UGtFRExkOFE3QnZUeUxRVndaeEtiSUVWaDBJdlVYQ3hOSkVlWjR4?=
 =?utf-8?B?Y2lNVm9NeTU1Q3NMa1c5TmNCTTlEZGtHVEdES2VJdCtQbTB2aEx2N2dZbHcw?=
 =?utf-8?B?RkZrQ3kyTm1qbWkrY1JYTnFJME5zeXRMdVE5UXZDbkZKaGVSYjk2YTdLY01N?=
 =?utf-8?B?MDU4bTVCakZvOTB2NEFhZCtvd2lYYjJaZzdWYmxMTWplSmJMd29Zd2w4aUwr?=
 =?utf-8?B?bUVhbmZYOERNQ2Z4dkljYU84WFl1MEJMTlNHNjZaeWhoVndMbDV2TDNzSm5G?=
 =?utf-8?B?M2V5c1hjZXY1c0hXcnB2VE9uUm9UZ3JSTmE5b3AzdEZRcFVyNkFzRWxpRGFy?=
 =?utf-8?B?UjZJalpsOTZRUGRxNFBrNlZKeFNSeVNDUVlGeitseXl3ZHlpeDBMeFhQclg5?=
 =?utf-8?B?TFhRZlBqTmhZVFdPZTdRa0RUNW4wRFJUdnpvL2R3c2wxa1cwV09NVTJ6ZStH?=
 =?utf-8?B?UHEwb3Y1NDh4Si9nRmlnaDgvMnovemk0MFROVTRzNHRjK29nTkhaOWxEeUJT?=
 =?utf-8?B?VUtrdWxjblFxRWZFNTRoL2JNRWJ1WTVwOGhnbjg5NlM1Q3Z2UFNiQjA0NXBN?=
 =?utf-8?B?NUFQazNDM1NYODBPaVY5akwyNzZZbWJoNFRNZml0RlNDdEptL2FvUC9QdmpH?=
 =?utf-8?B?V1JXY0gwRGVsRkVxenhENGV2TDV5d2ZxYnFYaWRtZWFmZlE3TmV3Qm1jRk50?=
 =?utf-8?B?Ui82YVlDWmtiYWpTQXFkVGpoNFVGK21MQ09mWENsbUozTlozYnhlNEw5ZHNJ?=
 =?utf-8?B?R1lZeXVPKzBtV09RNjB2VkMrcEptSmJ0UVlIWnN5bHBvVzhud0I3dmovMnlr?=
 =?utf-8?B?QzVRUXVqYzJvM09wQ1VORldhQXNrQjg5NnhpMmJ6eGxvc2VkenVXVEZwb0Mv?=
 =?utf-8?B?a2ZNSGJWZ3hUdzQydUNyclkwYXpadlZJdWltQUxkak81Nm1RZmlUdDY1Ry8x?=
 =?utf-8?B?SWgxUjU5ZWM4QWNPV283YlZ0dGxTNFJVRm90eHZtRStNMGFpOE5qOVJsU1Jz?=
 =?utf-8?B?b2hVc25IdkJnUmlSUVhrcFlVdnVlUFdCY2JXL3dXK28zaTV6VTIxejJLa3dX?=
 =?utf-8?B?OFY1azJzM2lSbjFTWlJvZVJVWDBYTHlPdkpkb2p5bU9YelU1R0R6bDI1NklD?=
 =?utf-8?B?Qlg0Q0phWExFWmE0YWptRUNKbTNQZEJobmk4cWE2OEhmS0hSclEzd1RkOElU?=
 =?utf-8?B?emVobmR6WEYyQlF1QXFjZWFmT2tyWG1YLzVjWnJjYW1SbysyN0FuRk5vb2xI?=
 =?utf-8?B?Y2MvV3J0aklKRlZBZ2RlN0RlN3N2YTBEK0xGUm0zTmpqYzBZdXkrYk9NRkNU?=
 =?utf-8?B?TDRTM09wKzZJeFgzeElsU0tLN2thYkVLNEY4RU1nUnp1K1NTTEZIWnRpZ0V6?=
 =?utf-8?B?dy9takdZQUtSN2VBOG56aGRSU3RwdHFKL3lsQytoQzdmN1RDekZOMjRpL2V0?=
 =?utf-8?B?dmFsOE1CdWoxYVVqRUhad3dya2hWU0ZwblcwckI3U205Z1RKbzBQYTYyVm1Q?=
 =?utf-8?B?SHVnZzJSdnI1Tk1XWUxmN1VrUkwyeDQ5THZveHRMT2dNbTF3dkR2bGFnbDF5?=
 =?utf-8?B?SForRzg4aEx4WXR0bzFpS3oxb1Z6WFNETGFhZEltQ3J6eUpsZ0NaZXNhbWh4?=
 =?utf-8?B?azEvQ3RScVNVbm5oZEl5MUtkTHd2TlJiQzM4bUNqRDRtV3FHUmhIYzBxS04r?=
 =?utf-8?B?V2hRNnhtNHhqTWk2WUVsYXNCd1RWUVhwWDg4WTZndTFHalFBRWhGVW9DNW15?=
 =?utf-8?B?Wnc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a9fb545-9b05-4d0d-dc42-08de3d649fc2
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 12:05:52.1082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JrRbD0DkWDLdiiLjZUGuSVeQ68XNQfCvBZ0n24UnOe2VEmCc5XalfFGY9g1jrX16EInPS80B1gpsCWXQCj8SLp8FU7HogS+BHLxNrecLNVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB11100



On 17.12.25 09:56, Jan Beulich wrote:
> On 17.12.2025 00:13, Grygorii Strashko wrote:
>> --- a/xen/arch/x86/include/asm/mm.h
>> +++ b/xen/arch/x86/include/asm/mm.h
>> @@ -619,8 +619,16 @@ void __iomem *ioremap_wc(paddr_t pa, size_t len);
>>   
>>   extern int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm);
>>   
>> -unsigned int domain_clamp_alloc_bitsize(struct domain *d, unsigned int bits);
>> -#define domain_clamp_alloc_bitsize(d, bits) domain_clamp_alloc_bitsize(d, bits)
>> +#ifdef CONFIG_PV32
>> +#define domain_clamp_alloc_bitsize(d, bits) ({                                 \
>> +    struct domain *_d = (d);                                                   \
> 
> This imo wants to be pointer-to-const. Question is whether then I'm upsetting you
> again, Andrew?
> 
>> +    ((_d &&                                                                    \
>> +      _d->arch.physaddr_bitsize)                                               \
>> +         ? min_t(unsigned int, _d->arch.physaddr_bitsize, bits)                \
>> +         : bits);                                                              \
> 
> This imo wants to look more like
> 
>      ((_d && _d->arch.physaddr_bitsize)                      \
>       ? min_t(unsigned int, _d->arch.physaddr_bitsize, bits) \
>       : (bits));                                             \
> 
> The parenthesization of the latter use of "bits" is a must.
> 

I'm ok with above adjustments, thank you.

> With the adjustments (happy to carry out while committing, so long as there's
> agreement):
> Reviewed-by: Jan Beulich <jbeulich@suse.com>



> Albeit, as indicated before, I'm not quite happy with the use of min_t(). Maybe
> another macro-local variable _bits should be introduced?


-- 
Best regards,
-grygorii


