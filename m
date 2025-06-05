Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EA9ACEA67
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 08:46:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006283.1385480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN4MK-0003N1-9O; Thu, 05 Jun 2025 06:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006283.1385480; Thu, 05 Jun 2025 06:45:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN4MK-0003Jv-6a; Thu, 05 Jun 2025 06:45:52 +0000
Received: by outflank-mailman (input) for mailman id 1006283;
 Thu, 05 Jun 2025 06:45:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Otu/=YU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uN4MI-0002od-GO
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 06:45:50 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2412::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b734c31e-41d8-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 08:45:49 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by IA0PR12MB8350.namprd12.prod.outlook.com (2603:10b6:208:40d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Thu, 5 Jun
 2025 06:45:44 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 06:45:44 +0000
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
X-Inumbo-ID: b734c31e-41d8-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LBygWqfiULxUVkKoYC6sOKPxajfdRl5x3dNOJwvnSk+uatielJe1GMmm93gQJg5Meqxibmv4WMByJuvBloD67QWP29Uc37wHNGZAyQKbM0MFuw1QcySo8G2DvPWYZUmmGHJU7g4f7EiCNdyv9xV7NgCoOG9A/pjXHZTr7ex0mUzpnzc1TOOwyVbUXfmiAsRZGwX7MSOk/T2Hf+xSggbVB/w/i4AR8Rsjltad8dSr08Ekp1s/WwDfZ2HTyC+0GYfClA8oqzC4blN40G/RmObntNkA0f4hg2949PWezqYXD2/z3CUIxcHz4A7ww0K2xO+szlOIDRrwlXptDgvmuT/i+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwMKXWFlV1yC73Rj+zORFY+lz6V4Qnpj1arWCCT33jI=;
 b=QAoYS8cXsignGd9K7UgDlND7xKlURnU6S+a4ZzlorOIxQc7ZTTf2myMq0dEmvwMDZI4SjINo5aq0w0TPmx1B0DsqTLGqBX1+CTsz3OVi+FhRsWbj6zcmUWH17oV/rGEJ6fJfjVEjZYsiUPJv8GGxf+uaoU8APwfL8E5CtYAiCi1oBFqR2OgjRVH8w5WVe/vEwiXw3rDdVkvemobVmlkqYjzN4HYBgXbonkJfWMOeFy009qyEXsWoYVtf2ss0ZQBzWRiYmzvWVl0CjWs34YESzR8zg/z9Fl8UkXBwDtTVRVXCFEQHyl8Cn6xrFDyh+9k9Qkxguc5Hzo3xZObUOqxkOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwMKXWFlV1yC73Rj+zORFY+lz6V4Qnpj1arWCCT33jI=;
 b=uX89VS50WYSC8fOlHL8nz9iKRYtDdBHwkU4lXUo/SKV+JIzSSEAJc9AcXHTXjbH2cojzTSx2Gw2FWotcJPiBZpL1jDk+PSu06M7AWKjoIdyxPqt04vTHKC/j2GXXBikjpZq5rOFdpMdZofsvYr7caAcQ3FuaYmAA9nwYzkWdSuY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <861e66c8-c225-4913-b00e-4dfb2c1e0e39@amd.com>
Date: Thu, 5 Jun 2025 08:45:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] xen/arm: exclude xen,reg from direct-map domU
 extended regions
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250513195452.699600-1-stewart.hildebrand@amd.com>
 <20250513195452.699600-2-stewart.hildebrand@amd.com>
 <54c3d341-1d7f-428d-89a7-ce4fcae8a5db@amd.com>
 <4bd41362-6ee4-44d7-9f9b-0ffd78f1e6f8@amd.com>
 <28b22fa6-c6f9-463e-8e7e-0a00eae88737@amd.com>
 <eba4c308-f563-4f3c-8bc3-b5cfa2484fde@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <eba4c308-f563-4f3c-8bc3-b5cfa2484fde@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::13) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|IA0PR12MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: 67ef4bd2-a933-46e0-c62d-08dda3fc9889
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YS9zWmxjUkd6K1Fadm8veXFXb2dRTHhKQXd4eFdldDlLNmZwMytRNEJSdnhK?=
 =?utf-8?B?MHRkZUtXRDNsaUJDQThEUTJNVHladzdRcVFBb3kxcWcyU1BLcjBtSG1QdFVa?=
 =?utf-8?B?R2xhdTNqQmpRYTRhbDNOUk5aczFHeU9zaTh0QTNZUjdTZ0p2WUxFZmxLV3Ew?=
 =?utf-8?B?TWVDc1VwbXJ2dkYrdTRJSGxVMnk3SS9jTkNOeDQ2ODNKemcxcTdlQVkyYmth?=
 =?utf-8?B?dnJCWHZRMERnVnhJUWU0bnIzbDVxd3lGQnY1U3pOZ294V0piL0ZpTFRkb3Q3?=
 =?utf-8?B?Vk1NMHA0ZHBzbStVZS9sNGVMb1M1bmdsL1FiMmt1eHEwTlV3R21kVWw4Tjk1?=
 =?utf-8?B?djBEMEhGNHpROHQ0TW9HZ3Jkd1ZWNHJTSzJkZm9hV2pqWWtGTGl6WnBjSnAv?=
 =?utf-8?B?WWh6SDJGdjB2ZDNCcTFpeDQ1U1ljSlltSWtWQ1RhSUVCQ05HR2xXYk5VSFds?=
 =?utf-8?B?OURJbTA1UzZJalFodGZkVTcrUUFDdlZub21CcTh2YTdPd0hQajZCWmpKZmh2?=
 =?utf-8?B?L0RWb1ZWRFY1Y1lTQXVkYUxhRzRmb0gyZitJOHNubjdFWWNGUlNwVUFWRzVj?=
 =?utf-8?B?ekV6ZFZMVitmV3dZSUtUU2J5bkJtWjIvemwwbnd4VkRGZmRYdFpaOWEzSE9E?=
 =?utf-8?B?ZTBRRmhnRm95NFU1M2ZXQWpIY2cycEYzbzJaUVZEVnBxOGlLdXJPSEsrLys3?=
 =?utf-8?B?UGZzdHdtR0hKU0pWbGFXaWRuU0FRNXZWenV4NGpTU0w5YUhBRndFeXdzYWNo?=
 =?utf-8?B?czRpWlJJQzhJWW50eWdNNjlqeWlKME0xYWMvTmtkVGRVNVAxSTZtcWpTbmph?=
 =?utf-8?B?MWpMUUxNUGJQSlZxMXhMa21HTExEcGMyMko3Q2tsaWNHTjhaMTVFRXMzeFp5?=
 =?utf-8?B?bE9uVUFRL0tLSExwdWhzZEJqa0hLdjlrUGFYczNoaDNPampHL05hT0hWRUo3?=
 =?utf-8?B?NEc1TW0yeDhGT0R2bHM0RjlseWNwYUV1M2w1YkJ1UjZhVkJ3RXJzanprK1hL?=
 =?utf-8?B?dWUxQUxMSnA2cWVRdHA0M082V0lva2NDa1ZTMHpjMGlHWElFMmJoeUoyQnRE?=
 =?utf-8?B?WmZCQmMreDVhU1pUQkF0UjAybUFvQUtra2lFMDZvN3dyUE5Pa0V0N3JLM2Qv?=
 =?utf-8?B?YlpTWnNJWTh0WEhCNElnem9EYjd4bFFqZ0VacGoxRjFlbDBqcFpOSlV1b0RS?=
 =?utf-8?B?d3NKWFh5S1R5WVVNL3BLS25PWk05SExiVEhxQ1A5OHB5cE9KeVlYTXFIM2Ux?=
 =?utf-8?B?VlpuNktnY2tBakEzdUl4RGE4UW5wZWN0WVg3dDF2dVJJNFByMmdFUHVlY3d3?=
 =?utf-8?B?bDVkSTNCSHV0blZlZGJpemdRV1QzMnU1MFV4VVVBU3NYaGZaZ05aeHUzSEtp?=
 =?utf-8?B?dGtWcTN2MUFMN3ZZWGFua1RlU1BlMGZUTUFxMlJXUnA5Vk56SExhZ09WWHY1?=
 =?utf-8?B?Y28xZG5OcHFJb2I4Vmo5TWlOWVhUd2tMZXZWQ2FUaitRNnJwdWVYKzduZG5r?=
 =?utf-8?B?TU5JaDRLcVpRMkNsL1VTTVFiQlk5cU9CaTlyWkxyQytreUd5VENXekUwamxv?=
 =?utf-8?B?TEZ4bnVmL1h3OWJQNE1UV0ljd3RRdFpGTWpHWXI2N2F2dVhRS2VEcC95YVVv?=
 =?utf-8?B?ZGxaQi9yamJPUWV5eFRsaGZqR2hlbXpNNDZTMVRMcTJRSHd1ZFJ1c1YzTDZB?=
 =?utf-8?B?cjZqbWRQQU0yMkdsYTI4dHdGL09FVnR1RW1jYUFlczlsdEhqbFdtdGlxczN3?=
 =?utf-8?B?RysrZVgwdlZSRE5rYk8wdWhFZ1kvaHVnK012Uk9zMk1pSFF3R3psWlZWQWRR?=
 =?utf-8?B?ei9heFBzRzlLSGY5RGpqMTJ5Q0YzeHY2QW8vQ0J5RFFkK2IvRjZjem82azVo?=
 =?utf-8?B?T1NDN1Awem4vK0h3UGU5UUJqYkc3YXVjUDRlZGp4cEhzQi9VOEVVL1RQRldP?=
 =?utf-8?Q?NOk5JvYb11U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RndCMzhQM2RrOFlvZWhiM25vcFg0NGN5RmR2cytrTWhaKzdKMzdmN2hKVkww?=
 =?utf-8?B?by9jci9KOUN6NUFrRy83cXVpNURvVXIzUWgwdTh1dlFUMnZnMTJJbjBnVDB1?=
 =?utf-8?B?S0cvemM0MDdCZzFqbFZqS1ROYlZ1Q3Y1QzBnaDVYcXpqcWg2d0hMNTRka3JS?=
 =?utf-8?B?OVBTMUJnbTdicXlPM3o2SFlLVmNjZUhUOVhOUG1pWUFPYmtSdzIxOENwOGRl?=
 =?utf-8?B?S1EvZ3BQL3ptWEU5VWw3dXFzRDNFQW9WV2FkQXBVdUkzV2V6R3hmWG1oam93?=
 =?utf-8?B?OVE3YnNFVlRYTHBxYmxzZnhDQWZPT2ZIK3J0ZEhiVWlVQTNaeDdCRG13Z3VS?=
 =?utf-8?B?akVPQlJmQURPWkt2ZVVraUQ2UW9VNXQwTFFrZlpvLzdaK3EvSGUyTEVXTXZ1?=
 =?utf-8?B?RDlsNHdPaTZnMjNTVnNvK3NIU2hOb3NUWjd5UzZ0OG16c1UyRXhmMnZNS3ZJ?=
 =?utf-8?B?WUEvNEtTbE1vQ01QMVlyUnF3OWk0VCszWFdYVHhNUHliNGJuUW1xekZvaG1X?=
 =?utf-8?B?R0lFWnlmZjlMd3B2T1ZtQU85UDcvNElYZzdDQnVMdlZlL1NER1hvRGNCYVpV?=
 =?utf-8?B?VWdLcFhVdnRnVFUrK3lCUER3bnllNVo3Wi92SEJXaGRJNlZVZXg0NUJ4S202?=
 =?utf-8?B?aDIvcGhJRVRyRGowVVVhSzd0Vm5HMW1CZU1Jb2Z0T1ZpZGYwdEpqdU9aUC9n?=
 =?utf-8?B?eDQ1Z1cwcG5WVE1zRDdJNVZPbEF1MjJ3ZlZjNFZydmJVZWRjeHVwRENuZC9B?=
 =?utf-8?B?b0loSEh5U1JZa3A5Z0JBelJNdy94THV6MTFiVXptOFI0TG9BR0g5Z3dyQXlZ?=
 =?utf-8?B?TjJ1dDN0cTB3VlFkeUZtc1gwWWExOWl0U2Z1M2puY0tMV243OENEcXhETW5q?=
 =?utf-8?B?S3lveEQwZUR1Qk1iOWVNUDBXd093Q0xUNUNIa1AzcU9yaFRCM05xamFFOHpw?=
 =?utf-8?B?Qk1hNzJEL3hvdndEVFdHdHBHT21HS3EzK3BydTRMM2FVVFVSdnh0RG5uNVo1?=
 =?utf-8?B?a0Irek9QcU9FeExwMGhCN3FCWjR3a1dOS3BwLzFZOE5WNDBCSS9nTDdoWVlu?=
 =?utf-8?B?WWJJeEdEbUpNakNDWHBPcS9HUnBSMHcwTmI3dnJ0T1JDbDBXbTViNEcvQk5N?=
 =?utf-8?B?WEhIbXZMWW5vRDc4QW8wcGNTOHMwblRnV0dZZXlaZ0NUOEQrSFFxWEpWN01j?=
 =?utf-8?B?L3F0ZVNjdER2ellHT1hPU1ZvL0dnNDVaQkxlWEpnaDVONU93Q0FQVXhQUkZ2?=
 =?utf-8?B?YmF1b2hsNTAvbHNQdW51UldxSy9VOVJkUElEekdQdGlsTWxqOTFPZzc3dk5R?=
 =?utf-8?B?MCtrMEdEcExncTlvcGt0Z2Z2bFJ1YU9LcFJITGlBb2NBSng4SzRHU1VDbEY1?=
 =?utf-8?B?MnRmL284UTZ6cVM5cGxwSXhIK0d3R1ZUZFhqU3lwMUplaHZ6UTR3QTN5L1Fl?=
 =?utf-8?B?bmZ6a1ZPMmVVc0d1cTQwRTdUTnVFRWNFMUtRWmszanhTUS9aSEY0ZXRTZ29w?=
 =?utf-8?B?Wm1VclR3bStDSW1kTUl1ZktYd3d5a2p2eStMclNiRkV0a05YNHpYaE1DZTE4?=
 =?utf-8?B?dS9IVEhha0FBYXZXaUFGSVRXMUxpV3ljalJJQ0lNL09kbFg3bzRYR2pmNWkv?=
 =?utf-8?B?cm1DUmFuVzRGd0t1WVZHaklneHpxb093bW1LVzhWZW5MRlN4Mzk4SFdtaFhR?=
 =?utf-8?B?U1dheHN3NkhqUWRnZ2lmME1HNXRMYjZ2NHdzOXg2UDY4VjhoeGIzUWY3UVR0?=
 =?utf-8?B?MnlOUFA3ZC90Vzh2UUpLRkNKYUYvcXQvMVpOR0Z5OXg1c0F4RHd2R2lKRVh6?=
 =?utf-8?B?ZzhXNFhCSUxBK2JRRm9uYytGUTduSlpLMDFqeS9Jc2RsdkZpOEd6NEtaQ01u?=
 =?utf-8?B?bDFCVWxyeVBqK25pcm42SU5iaUdpVlNtRHFLVTd1bGlSVG8yTEtka2FCekh0?=
 =?utf-8?B?UTRKWDBTTGJ6MndUbDFCRVE4K1dkR1JYQWNvWHRma241Uk04cnloT1dNQ3gx?=
 =?utf-8?B?R1pnY20vR29GWFJRL2RBZG5hZnczVHhxWEpJc21zZ3Y5ejhHU0tudHIxQmhX?=
 =?utf-8?B?VW5SWWpud0lpTUVHaU9WaTBpREY0ZmNQV0tqYlN3eWtXYWNZeDRaMlMwTTNo?=
 =?utf-8?Q?0YdXP46cMaxIYao1ygfxBjtZC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67ef4bd2-a933-46e0-c62d-08dda3fc9889
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 06:45:44.5733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wjUo6gXYvz+QO3zvFxZ1fDn3uaVpH30omJvbMeIugyviXAbsyu4uN7SUJoY6nE3v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8350



On 04/06/2025 21:51, Stewart Hildebrand wrote:
> On 6/4/25 03:00, Orzel, Michal wrote:
>> On 03/06/2025 23:15, Stewart Hildebrand wrote:
>>> On 5/14/25 03:31, Orzel, Michal wrote:
>>>> On 13/05/2025 21:54, Stewart Hildebrand wrote:
>>>>> Similarly to fba1b0974dd8, when a device is passed through to a
>>>>> direct-map dom0less domU, the xen,reg ranges may overlap with the
>>>>> extended regions. Remove xen,reg from direct-map domU extended regions.
>>>>>
>>>>> Introduce rangeset_count_ranges().
>>>>>
>>>>> Take the opportunity to update the comment ahead of find_memory_holes().
>>>>>
>>>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>>> ---
>>>>> v2->v3:
>>>>> * new patch
>>>>> ---
>>>>>  xen/arch/arm/domain_build.c | 57 +++++++++++++++++++++++++++++++++----
>>>>>  xen/common/rangeset.c       | 14 +++++++++
>>>>>  xen/include/xen/rangeset.h  |  2 ++
>>>>>  3 files changed, 68 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>>>> index b189a7cfae9f..3cdf5839bc98 100644
>>>>> --- a/xen/arch/arm/domain_build.c
>>>>> +++ b/xen/arch/arm/domain_build.c
>>>>> @@ -824,15 +824,17 @@ static int __init handle_pci_range(const struct dt_device_node *dev,
>>>>>  }
>>>>>  
>>>>>  /*
>>>>> - * Find the holes in the Host DT which can be exposed to Dom0 as extended
>>>>> - * regions for the special memory mappings. In order to calculate regions
>>>>> - * we exclude every addressable memory region described by "reg" and "ranges"
>>>>> - * properties from the maximum possible addressable physical memory range:
>>>>> + * Find the holes in the Host DT which can be exposed to Dom0 or a direct-map
>>>>> + * domU as extended regions for the special memory mappings. In order to
>>>>> + * calculate regions we exclude every addressable memory region described by
>>>>> + * "reg" and "ranges" properties from the maximum possible addressable physical
>>>>> + * memory range:
>>>>>   * - MMIO
>>>>>   * - Host RAM
>>>>>   * - PCI aperture
>>>>>   * - Static shared memory regions, which are described by special property
>>>>>   *   "xen,shared-mem"
>>>>> + * - xen,reg mappings
>>>>>   */
>>>>>  static int __init find_memory_holes(const struct kernel_info *kinfo,
>>>>>                                      struct membanks *ext_regions)
>>>>> @@ -914,6 +916,13 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
>>>>>          }
>>>>>      }
>>>>>  
>>>>> +    if ( kinfo->xen_reg_assigned )
>>>>> +    {
>>>>> +        res = rangeset_subtract(mem_holes, kinfo->xen_reg_assigned);
>>>>> +        if ( res )
>>>>> +            goto out;
>>>>> +    }
>>>>> +
>>>>>      start = 0;
>>>>>      end = (1ULL << p2m_ipa_bits) - 1;
>>>>>      res = rangeset_report_ranges(mem_holes, PFN_DOWN(start), PFN_DOWN(end),
>>>>> @@ -994,11 +1003,30 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
>>>>>      return res;
>>>>>  }
>>>>>  
>>>>> +static int __init rangeset_to_membank(unsigned long s_gfn, unsigned long e_gfn,
>>>>> +                                      void *data)
>>>>> +{
>>>>> +    struct membanks *membank = data;
>>>>> +    paddr_t s = pfn_to_paddr(s_gfn);
>>>>> +    paddr_t e = pfn_to_paddr(e_gfn + 1) - 1;
>>>>> +
>>>>> +    if ( membank->nr_banks >= membank->max_banks )
>>>>> +        return 0;
>>>>> +
>>>>> +    membank->bank[membank->nr_banks].start = s;
>>>>> +    membank->bank[membank->nr_banks].size = e - s + 1;
>>>>> +    membank->nr_banks++;
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>>  static int __init find_host_extended_regions(const struct kernel_info *kinfo,
>>>>>                                               struct membanks *ext_regions)
>>>>>  {
>>>>>      int res;
>>>>>      struct membanks *gnttab = membanks_xzalloc(1, MEMORY);
>>>>> +    struct membanks *xen_reg = membanks_xzalloc(
>>>>> +        max(1, rangeset_count_ranges(kinfo->xen_reg_assigned)), MEMORY);
>>>> You allocate at least 1 membank even though xen_reg_assigned may be empty because:
>>>>  - this function is called for hwdom - no xen,reg
>>>>  - there may be no xen,reg i.e. no passthrough
>>>
>>> Ah, sorry, there's no need to allocate at least 1. This can just be:
>>>
>>>     struct membanks *xen_reg = membanks_xzalloc(
>>>         rangeset_count_ranges(kinfo->arch.xen_reg_assigned), MEMORY);
>> No, it cannot. membanks_xzalloc() calls xzalloc_flex_struct(). If you pass 0
>> as size, the latter will calculate offset to FAM[0]. In other words, the
>> allocation will succeed but only for members up to FAM[0] (i.e. only for struct
>> membanks_hdr).
> 
> If we pass 0 as the size, these members (and their ->common.*
> counterparts) will be allocated:
> xen_reg->nr_banks
> xen_reg->max_banks
> xen_reg->type
> 
> but there will not be allocated any space for the flexible array member:
> xen_reg->bank[]
> 
> Since ->max_banks will be set to 0, and ->nr_banks shouldn't exceed
> ->max_banks, it should work. At least for the (inner) loop in
> find_unallocated_memory(), when ->nr_banks is 0, it won't dereference
> ->bank[]. FWIW, I also tested this with UBSAN enabled.
> 
> I admit it does give me a weird feeling not allocating any space for a
> member in a struct, but it's a C standard flexible array member, and the
> array's size would be 0. We deviated relevant MISRA rule 18.7 in
> b87697fc1a6f ("automation/eclair: fully deviate MISRA C:2012 Rules 5.7
> and 18.7").
> 
> With that said, I'd be happy either way (i.e. either allocating exactly
> what's returned by rangeset_count_ranges() or max(1,
> rangeset_count_ranges()), but I just want to ensure we have the same
> understanding on the technicalities.
Hmm, why do you want to allocate memory in the first place? If xen_reg_assigned
is NULL, we should not allocate anything. Instead you suggest to allocate either
full structure or part of it. That's where I disagree.

> 
>> Also, even if you conditionally allocate for xen_reg_assigned or set NULL, in
>> latter case you will end up with mem_banks containing NULL member. AFAICT that's
>> not something expected by the users of mem_banks (+ it gives unneeded iteration).
> 
> Agreed, it would be a bad idea to set xen_reg = NULL (leading to a NULL
> member in mem_banks), because then find_unallocated_memory() would not
> be happy.

~Michal



