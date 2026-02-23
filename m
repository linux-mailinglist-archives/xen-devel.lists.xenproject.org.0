Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YF7IKFuXnGluJgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 19:07:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CDB17B3F3
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 19:07:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239303.1540739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuaKt-0004zj-9t; Mon, 23 Feb 2026 18:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239303.1540739; Mon, 23 Feb 2026 18:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuaKt-0004xA-78; Mon, 23 Feb 2026 18:07:11 +0000
Received: by outflank-mailman (input) for mailman id 1239303;
 Mon, 23 Feb 2026 18:07:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ndCc=A3=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vuaKr-0004x4-9F
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 18:07:09 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7707f9f4-10e2-11f1-b164-2bf370ae4941;
 Mon, 23 Feb 2026 19:07:08 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS7PR03MB8314.namprd03.prod.outlook.com (2603:10b6:8:262::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 18:07:05 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 18:07:05 +0000
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
X-Inumbo-ID: 7707f9f4-10e2-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jPdRg3Xnoyl5CKolOIUViui/okzYCPpCSyTFjdCYPGe3sfPVARxqTS0OC33inOWdLPLan8D4VlfnySgP9J56jkNn1Ws4qjAgR/BFOeLGRsXXcHLRYmpAGE4bN3FyEP8uXEpUH1/i4okTMBtoIZOZS9ZiFmYbR37Gi+xlNjtr9hWkr73OMciffOCj4hTCggJ8kssv3JpIX8ikW1JkNTe7AI+ank9KCjjfR/lodzpWkiIG5OiwyTNA/8UnHut9Ppdkh6wqNL2hR8NmKlHTv5fwx2Fp4ZRnVc+/DpXmFdF6kIbFQWIG2oPmgUzHj9M6xC3vDRwKexyP7CDZ49BCEEC3CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KggZxdVdfiBk+9SJMucf8dR/w4XU/rKN99+jp9nc8D0=;
 b=ExOYa8xPXpfzfdMoKzM0z8jXmcZ10DDW5ge7FOBf9bQoZv78WdYe+Uq5G/I3dXTjWxhJAYB/wZezo1XwNV1POJ9+3vtbzYYbSzgY6dR0nzfbqxK1coZHqyTlgGIH0H5lgaBSTISvdD0k5WmAL/QB69kuZaD8M+5iiaib1HReK6czFXMks5HrVZZIH4AY3vfJY5SWcwEb5HWaHB1QbpXd7rdBlExJg8sQuiAOlJdbS3VNcADV5aHfKJ+ug2id/ZXKetvwaexKJSsHRQRnCtGzY137kOz7crX+d7rFTEEfmJr/szmuaqB+6wbZ4Rgz6qCZH/c2qVSz+QkDfBlJ/KiGCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KggZxdVdfiBk+9SJMucf8dR/w4XU/rKN99+jp9nc8D0=;
 b=c8YZnMRvSoGPydpA/Zat7WcRGXfA+xdSnlb21k5WMiBoB4tAjxqKGHkJL6aPhq4ZZfjwpKqgCp5wO+Pypna16JjA5BjfEntmTkllZAuDMOMxG7jDMBKx+u4w0lqBDpgWhRUXGC7+ebHXJbCZxR0AGwRcavKFUC5dOZNLtM2i3Gs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <603fde9e-0a82-4509-9927-3d1008e40040@citrix.com>
Date: Mon, 23 Feb 2026 18:07:02 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 roger.pau@citrix.com
Subject: Re: [PATCH] x86: Remove x86 prefixed names from cpuinfo for common.c
To: Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
References: <20260223145458.438621-1-kevin.lampis@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260223145458.438621-1-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0200.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS7PR03MB8314:EE_
X-MS-Office365-Filtering-Correlation-Id: 35a30b2c-ee1a-4ca5-f1ab-08de73065a0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YldKSGVoYnZlRS9MV0lVWlZoT2dOQU5MT3NGT2ZyN29hYnkwaHFnMEZjNEYy?=
 =?utf-8?B?em15ck42MG5xa0t5K0NwSHRVNld6QzRBZDhlOWtMUkgyMzNRc2V1c3U5cTRL?=
 =?utf-8?B?WEJGcXNQQWVlSnFDUnpsdW1rRXovNTE3NndNRVk3Wlo2dmpvOEV0R3RvV3JB?=
 =?utf-8?B?THpDRGlZQ0U5RVJ0RzYyVEgrZmRNdVMvZlAvTi9KMjIyMHZsT3RVZVdMc3V5?=
 =?utf-8?B?Zkw4SldsZWJOK0lSZWFKYlhtQW85TWkzK0M1Wnh1ZlFFeURBSTh5emt4WGlu?=
 =?utf-8?B?Y2I4MnBXS1JkZWVrWDNtd2I3eDlEdmtGYU9MTW5WV2V3c28zbnhPaitHNk50?=
 =?utf-8?B?bm40QjhGQnUvWkMvSlpqaCtaT2dwSjB2TGNFKyt6bkVhUXRXemtwS0RveFNG?=
 =?utf-8?B?RkhYYTBHRE1zTUtpSHpxRk9QZUZnQzZNYUpWdjZoZk9qaGhNN1p5QVFLd043?=
 =?utf-8?B?L3RXQmhwejNLSkZYbm9QdTdzRWl6ckpSZGlQcnViamNFVFlpR3E4OXMycjdt?=
 =?utf-8?B?TmhHZHQ2b2Z6L2tEcXV3UEhUMHJSbEw4SFp6Z3FiQnFRdE8xTG91bHpDcEU0?=
 =?utf-8?B?Q2FqNXN0SXNJWlE0NHI4bDFpL3BOajlTSko4M0dFTDR3OVVxNGRZQnBpV0FY?=
 =?utf-8?B?bHowOHpDL3lJN2dNZGxLcGZOdnRxR0h2czdTTzNWdDBlZUgwMjczak9idTlm?=
 =?utf-8?B?ajlKQ0RIQU1JWTF2Sm1scHNhRU1YUFlCVy9RMHR4ZmJJVHdVSFpleUpGWVNa?=
 =?utf-8?B?d3pqcnJzOXQraXZoWmRaUFdqd0tiblFwOS82WUw0UllPczlpdlZ1bllQaVdl?=
 =?utf-8?B?ZHBWaDllMDd1RE1QUVlvdUM2WUFwY0hsU1V4T3ozdSs4aXRQQjRlSmw2R0Nz?=
 =?utf-8?B?VlRTdzVlTWY5Q0pUQzVyWUMyYk82eXdKd2RKblhSQ0hJVVVHZnhOUjlYNDlt?=
 =?utf-8?B?cXRpWGN5OW5UU1c0c0FnanlZUjZwc2x2c0cyemp5ZThLSWhpNDYwcnp0SVg0?=
 =?utf-8?B?QkJ5dGJLMVNRNXZZaEtjL0dpQzRadWtsVlRudGR6OXZrWkljbDN6TTd1QlQ2?=
 =?utf-8?B?Q2V6SmlzOXBkOW4veE5aQklBc0hXM1VqU1pkYXFSbDExQmxrYU1IWkNlTHBu?=
 =?utf-8?B?Nm12cWZjSmdrQUo3clRDSEFvQTF1UlhxM2tiaG9lN0tOMVIvV0Q3dDJhWVRn?=
 =?utf-8?B?L2ZTeDl3MjB4NzQxSHZyUHhwNUpmN2RCdTFnWlJ1YWFWaG1ObkkySS9HemRE?=
 =?utf-8?B?NUN2N1p3VmwrSjh2cXRmZVVuTDJmZXlWSnpqaGZqdDNXMGtvTjFNcDB2aVVH?=
 =?utf-8?B?MmxoVHRFOTYrOTRXL3NZNzhoK3FERmdxR0c1emdkQnFCT0lXMjk0b1N0SjFw?=
 =?utf-8?B?TWFWV1dlZmtYdExmaGw4Mjhob1hDMXltRVVNWm1BcmU1YWl0aTc3V2YxSkFr?=
 =?utf-8?B?TmI5ZFNVNWVmTHpsK2VkNHovT2RPREQyb25ZV0doSlNKWlNMU3RTWGlCOWJp?=
 =?utf-8?B?NzY0SDlZSkJXdXF4akRhTUozKzZ2KzNaRHNqR2ZLa3phaXpFYndod1JsK3lQ?=
 =?utf-8?B?UEo5K2taWmVtNHduWHBkM0ZqbkVsbmVrR0JwMnRqakJEb2w5ZXVWa1N1czlU?=
 =?utf-8?B?S3VEMnFiRzkvazRucy9vdVE2RnB1ZHEvL2ZzdzhFSmN3a0IvRXF5eEwvWmk5?=
 =?utf-8?B?dzVsd2dLWk5oalhEUmhiQXN2VW5sLzVzR01LQVdTcGVRTCtGUUNOdUtyYWND?=
 =?utf-8?B?WUkvcUFqdEZGYUpod3RubENyNEY1V2FhbDE0bnFpeHhUbDFMaVlTbFRWMVp3?=
 =?utf-8?B?K2ZkcloyRjFrZG1uK05IV3lxRy9tYytIN2IwRzV6cnk3VXAxeE9BTWF6aVVO?=
 =?utf-8?B?ZVFLR3BaUGZPVThWVDZ6em4zMXA1dzRUaE9YeWt2NTAyMUxNRm1BTnovU1Uv?=
 =?utf-8?B?YlkwOVlUMWNUZVNJU0syTHBKOFRJdDhEa1N1cml4dUFRV0xibXRxSVZZMU5p?=
 =?utf-8?B?MTNLd2puZHoycnlQUWFhYmd0ZE16djREVWs3OS9ZVXBFdHZzUVZrdEk4cm9o?=
 =?utf-8?B?SDc5clhSZmQzdkhSanJLNng1RzJvOTVnZnRaRWM0TWlhSGhtTnJtK1BwMHZq?=
 =?utf-8?Q?FJVY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGJ3Ny9YL0hMaVlyS0FoRjBHMjhJWFpNSVJLbkUvK3lDamxoOGNkMnpaK2Q0?=
 =?utf-8?B?SVp1WU1VRHJkdHp4eEhRRmFOdWFjVHdMaC9qMXhPOXg3TWNoc0s4S1JrWUtw?=
 =?utf-8?B?ZkNxWHpDUWQzWXFwZ05ZSklnVUJDbnZkdjNEUVdqeDdGQUc4TWNDOFBpZUd1?=
 =?utf-8?B?dUVQQ1VXNkNDUkVmQWExTjFRN1NUWEQwd0Rlb2d5SnIrbFhTZ2ZNV29NemFv?=
 =?utf-8?B?czZoajk2RGxwUFlrVUxCaENoY0xyLzROUDM4cXFLRWdXV28wUEwvV05OV1Ax?=
 =?utf-8?B?RTdMYzhWRTRURWdWYUxnSFQ0Z2xlanU2bXhWVWd2Mlo2ajJXRnVrTXlOK0Qw?=
 =?utf-8?B?MExEM0VmZWc1L0dnMHdvcU1DQTdieVhrODBDQUs0bHRLckhLbUwrdlBNbkVS?=
 =?utf-8?B?WVFyMGN3VW04eGt5azhIc1VjRXptc2c3RTE5Vy82dk1nV2xCTTRrTXUvSEdn?=
 =?utf-8?B?TnlYYmpMYVJqMll6UXo3dUpHa2J5VW9ONk5VUUloazVqai91NWNtc0R1SHBn?=
 =?utf-8?B?eTRNcFQrU05MZFpjd3V6bnNDdEg2SkN5NXBnajFNSUNQUTJzZVBOSmw2ZE1x?=
 =?utf-8?B?SkI0d3ZDaXNQeUFwMnVVWlFDdTZvWkxUaEFvL0hJblhkQzdLaDJRQ2pkMUxk?=
 =?utf-8?B?OFpTbWl0TE9jOHQwZXd2am5QdEx0RFpvbmF4eGV4OEl4STIwcnlacEN4ay9n?=
 =?utf-8?B?R0NRSnV5WDYweWxXOVErODNNMnZTVnNUeXlpU29RVy96WUZoRklPL1VzODRq?=
 =?utf-8?B?c2FKVnNSZ2UvL2hsZHB3NE9sSzREUkhmWHZTbnZ2R2ErMU85Z24yV0tRYkc3?=
 =?utf-8?B?S2JnSm9IVUxVR090QzV2NzcvRUVWSCtGWDR5M04rcXRFUTRFVWdNUlo2akFE?=
 =?utf-8?B?UjlSRGlRekFmeElGWisrQS9OYW52cHZSMWlZZkNkOG4rUFZOMDg0anlTZWdV?=
 =?utf-8?B?Z0VsY25IZTZDODR2cWFCZ0M1cjV5YzFmK0ZEaDQzUlFIZzdFMWxBeGF6bUc0?=
 =?utf-8?B?ei81WUd0UEdiemJKY2hxcUFtakw5Zlh1VWxWVUJDV0tVV0xQNjc1aXdXSldh?=
 =?utf-8?B?UnBuYnlDY2Q4MUFDRmNDbFVhb0lHUmVZdVBaazMxQ0hmdjZqK1BEQzlQUHV0?=
 =?utf-8?B?azNuMXlaRnhSbXNuM0dwd1hYLytwSUxKeXhDWXpSMVJLRzNaeGxCMnU2OW5B?=
 =?utf-8?B?M2hxTzZLeU9sRlZZOCtRTm9hZUovVWlTSlJnMFlIcGRGUTZHZk81SEJuMkZz?=
 =?utf-8?B?QmpTQVRucFU4TnRWQU5pTXFKbHBoM25idTFKZlVHOG0yejU3eWNISVNqeUFp?=
 =?utf-8?B?cTR1d0pzQ3o5blpTbXRHTmRlMzBrUjQ5SVVvV3ovKzRPaXdYWG53bHNIWE5r?=
 =?utf-8?B?K0RxeTNNcE43RzZUalAxcEFHaW9oOXZnUmxOSVk1cVRkNGhVY1pRNWtyZERq?=
 =?utf-8?B?Q3FtZ3NTQUNTT29CbFgrd0Q1b2JteTBBMVZDQ2c5QndPRjMvdUxIQmtlcnRK?=
 =?utf-8?B?bkxPTk93YXVMa2FjWFBrZU5SdnJWdjFQem0yRzFXSTkwNUlOS1JrY0RnbnZH?=
 =?utf-8?B?aGFmaG83bWZWZDQrbWZCWHBrUEROR1lLdDJUUWFVcnRJdzZxR1FMVzZGOFVx?=
 =?utf-8?B?VU50ald3VXpzRjliT0Uxd0FJTlhkVTFDSUJnZzBQVE5TdjZrMzJ2L1g1Z3hz?=
 =?utf-8?B?QUVPZjBsSTg1WXo0OGFCTTFMWTFDeEhueDFVTjFsaVYvK3VpM3ZaaENMUFRh?=
 =?utf-8?B?aUU1UW5OVVVpWHQ1SGhMSVRqRjh2S0laL2h1aXVDM1N0TS9KRE5ianloRTJ6?=
 =?utf-8?B?SitKanlLS2dURkJ5dWx5L2xnbTF3a0NHUFU3Z2xZQzMyOXVBWmlRcFdjaWlQ?=
 =?utf-8?B?bjRCc01RanFhUDMwajZkMXVDVFJ6TEZQNUhiRTVpbnRBVGpHODA4bWd4MDZV?=
 =?utf-8?B?L213N3FOaXp5OTBid3F3UE12K3FCaUFrcWdjb1ZNOXZGa2ExVXFLbnlabGlS?=
 =?utf-8?B?dlJteGRDN0huU3NQMG82ZHBPcDdzZTlpZjlQRVFnQXhNMVdOSGRrbmRSUXlL?=
 =?utf-8?B?b3htRmJuYkNoU3lwalczamVqVUdpbWVVVDhBMVdIazZ5dkIwU0F1YjNzRXhI?=
 =?utf-8?B?MkJtM0t4WHdLdHUxODBULzZoTlp4Y2FoSy84eHlFMmF0bnJwZStwWXo3UjZ6?=
 =?utf-8?B?eC9YNEs1R2REK05SaWtCZjA2ckRhZmpWVkY4cGFuUEtaSXVTVllGSFpYQjB2?=
 =?utf-8?B?Z2M4NGJYelp4YUR6emFud25kdHpQWXowOUlVOUN2bitSMUF6K3F2WC96bCsv?=
 =?utf-8?B?OVhZTjNyYk5SRnVIQzNRdUs3akVlSFFmeGRaSm9la2hONkp0NE93Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a30b2c-ee1a-4ca5-f1ab-08de73065a0f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 18:07:05.3438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f2lbfkOBNzgTomFNlTVpTl9eK7ptWN46/3+MtM4lSaUAwNiBSbdfy3N37wTA9fcPgoBUK1e9hgwtxcptIBGThW9bnfy2SsX17Dgevcg+bBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB8314
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:kevin.lampis@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:mid,citrix.com:dkim,citrix.com:email];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 15CDB17B3F3
X-Rspamd-Action: no action

On 23/02/2026 2:54 pm, Kevin Lampis wrote:
> struct cpuinfo_x86
>   .x86        => .family
>   .x86_vendor => .vendor
>   .x86_model  => .model
>   .x86_mask   => .stepping
>
> No functional change.
>
> This work is part of making Xen safe for Intel family 18/19.
>
> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

