Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94228CA7B95
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 14:16:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179059.1502707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRVfa-0000eM-Fk; Fri, 05 Dec 2025 13:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179059.1502707; Fri, 05 Dec 2025 13:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRVfa-0000cJ-CA; Fri, 05 Dec 2025 13:16:22 +0000
Received: by outflank-mailman (input) for mailman id 1179059;
 Fri, 05 Dec 2025 13:16:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K96r=6L=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vRVfY-0000Ji-Jl
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 13:16:20 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9613956f-d1dc-11f0-9d1b-b5c5bf9af7f9;
 Fri, 05 Dec 2025 14:16:20 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH2PR03MB5349.namprd03.prod.outlook.com (2603:10b6:610:97::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Fri, 5 Dec
 2025 13:16:16 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 13:16:13 +0000
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
X-Inumbo-ID: 9613956f-d1dc-11f0-9d1b-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BimaHZLkNhrdN5DHt6aSyKWdgCl/1Fszp1d6G+k4Lvz4kivqqqKynoLOu8LUO29jdRWhxpD14DpkNQJ6LGlwtQkuWrs50lC/0pPhwHncwKmGu4Mg8Fu5ZTZvizkWpy4A+jxELJOpN3hUerraTCqRASkCF+GTwp244+PNb6vhzZGC7iIxlmaT2uBeWscCi2uDUvll7yRwRAebIG6QuazaWdOzAD5+NhrLevYGncAGouo2s08gVgqH3jSIQA4TLpvKQOcWOZ2zWfwBp92G1Mh7sQlliFJQ1jS7NNbbJ/j6y09Zcbu3sDEcmzx7wcoQPn4ZMkRrwmNlAnKCM/82+gt1nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOykeCTpePIvtWiD1Dvq2KGyJsfAGfQ7e/xguK3wZJ8=;
 b=vL/1lWInFKh8h5ju1CPuSfOTzLK9S0N+qSw6+EemOvo6qr+JYGKHVc2TJcvUv+rVBx4lyC/vGSkL1WzJ/LYRGjYIGOa5tWi72MoaWew312nv1P33JleH4ppQl25EI6sNkuj01JLqzbfo0qngmz7M4InEVJTYZ+/vgaNnupq4Qew5UXro2B8164QPgV33/bwKIlV4AxnV7h58QTQ78Qk2TvCJeuxQX79kFP93DxphXEJlUMewQjStvZes0wB/euNgYyvVGtbC86HUFUv5zo/xUUUdO6Ol522uv5+e0bfR+2h6Qo9+/esjkur/ex2w/thh8/NW0N+A+PG0MN6S9NRHhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jOykeCTpePIvtWiD1Dvq2KGyJsfAGfQ7e/xguK3wZJ8=;
 b=Z66CKmv70aWP610AV+iOz5SfbTBjEfqG9vX1UUFHJEY2I4mV4kp5PoZhp5h7Ydh2RnqBuISvyA0Njdv2sHW4X9dkXyVCrgkf2edDjR17WSLWjR+0yh35TA4sRKcoY6csHiIobXPrbwQPEvwIERxa6W+aYTElsXsMX7Q/PqKyNVc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1099fd00-1b9f-45f1-ad99-747db2f854e1@citrix.com>
Date: Fri, 5 Dec 2025 13:15:49 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v9 09/10] x86: use / "support" UDB
To: Jan Beulich <jbeulich@suse.com>
References: <926a2315-a2b7-4aad-87e6-d686c9da9e3a@suse.com>
 <78b7c8a0-16ae-49c3-8c7b-5b10f5b0d688@suse.com>
 <e2ce221b-f852-4f9a-8a82-322e6f2af522@citrix.com>
 <846afe9d-458f-4ec8-a58e-faf0617707df@citrix.com>
 <e9d37bd4-7e31-402b-a874-0e9ad10b2a1e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <e9d37bd4-7e31-402b-a874-0e9ad10b2a1e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0174.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::17) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH2PR03MB5349:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e8fa0ad-8de0-426e-d279-08de34006d78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTV6cjhkMkYyeXZrWVltNU8rNTNZMk5MUy9iRUQ5MmFjanBNRjJDdC9UbDc2?=
 =?utf-8?B?Yzg3L01OQjZkOHpXMWlwSG41ZFhsT1lRSXduenAyU1Qrb1gzdHFmeU02STYw?=
 =?utf-8?B?bTNvVnBVakJwOWwxNGFRcnNFaTloTEw3ZldZZDh4Y1gzd1dURmNXTm10TUlJ?=
 =?utf-8?B?ZGtnNHlnOVMrR2xOTXg0OS9mYXg1SHVXVnUxUkphK3JxUmVOSjVodXVMSlFa?=
 =?utf-8?B?c0tQOENnWjJUL3RqRThsV2ZsREFnN0lZbURNZll4Snh2bDdIdVVmL1ovKzBP?=
 =?utf-8?B?TDdheW5hdVNxQm83dzZWRkttREhpUTM2QU1JZEVzcGQ4VzQ4QVFvTUd3MTRW?=
 =?utf-8?B?NTNMN2xoWGZhUU4raVBJa3V3bUlzbk13Yk1jNW9ySk1yMklRckZYaHpaVitW?=
 =?utf-8?B?M1d6ZDVKaU1Vb1dWK0VkWVhtWmtLdytyQklMdXg3cWU4SEZMWk1pcUkyY2pR?=
 =?utf-8?B?eFlEaDVib3J3SHhZaUJWeWVSNFZzbWJFc09XY2FIbGRpYnZsV2FTK2VJUmVN?=
 =?utf-8?B?RHRRV0hUVWNwTUp4NDAzZTBzcjNOR1lJaWJ2OWtocStZUHJoUFpFMlU5eDlP?=
 =?utf-8?B?MlhzOTE5dVlxMDI4TG1HMEQ3eXhYMXh2QWhwVU5jdjF4STJJcDVRVFh2aHFU?=
 =?utf-8?B?b1FLK1Y5SEk1ZzhwWENMTmwwaUVNZktMTXJjM3lrN3RLbm9rR3Y2bDRtblFy?=
 =?utf-8?B?cExyYWNmRUliMzVJWGZaRXZSSzQzSmc1aGs5RXJhT3VFN2M1QmhmbmV3UHFs?=
 =?utf-8?B?K2h4a1E5WFFJSDI0R01yRFBTRlk0QUE3akZzZ09iZ2xOaEFpQnlKSndSb05S?=
 =?utf-8?B?NUkzOXQ2WWtkbGlrZ1RWcVdWTjREQWI4TjJJc3VIdFB5eW9BMm8yZU5WbHYx?=
 =?utf-8?B?cGhiWEdFU0krdWd0QkJJcnVxMk5sc2ZwQVRkd2h3dnUzREt6OGJrWlIxTm9y?=
 =?utf-8?B?dk1TanRiRThvVGhxLzFmREhnckJzd3ZtY0RMSmtTTEJCWlJrZnJ3WGw2d3la?=
 =?utf-8?B?U05qeG82Tkh2TlR2MG1LQUVXd3JSUTlQeml3Qk9yYkxrK1hrYi9tRkN5ODVa?=
 =?utf-8?B?V3l3MEw5ZU9zbHFnQmViTHg3VUt6U0F6cCtvcE5nb2FETXR6V3lzWElUbExn?=
 =?utf-8?B?M1hCVWNRU1lnanNtQy81OUZScTdHaTUrL3BUcW56TGhiSzJBYjRnQzlWaDdD?=
 =?utf-8?B?RE5CaHZDczFHSFVVMEFTbHhUZEFpUE1ZYnpBRlZXaXJ5Lzg3Q1pLM3dFOFQy?=
 =?utf-8?B?bjRwb3JTeE5zZEJzU1JjMnY5VU5nZFN6N3JYM2c2cDlJRnhad3drbVV6SzVT?=
 =?utf-8?B?MlpYQSs1d3NpUW81ZlNGclZaQVZHbmNTdE5RVEZ6ZEdQbVN3ME90N051MXE3?=
 =?utf-8?B?Wi92ODVaQkhsb2JjOWpHbW1JclVpdXNzNEJoVmdVdEozR2w5QzJoVWNwWkZm?=
 =?utf-8?B?MzY3U0VYeUJsMjluOFl5RjRTVy9DTjNESk9BZjREMkFZc3EwaytXVGhGeGFN?=
 =?utf-8?B?c2QwdHVEc0UxbUllbExNZTh1alhkZVQ0ZGlzWHdEVlBuNWlQMU1SUlc2RWdZ?=
 =?utf-8?B?N1VJdS9kM1A3Nmd1ZFBPWlYzWFM5TFJrQXk2N1ZFYngxTDlqRE5CUkNiazI3?=
 =?utf-8?B?Rk83SldrQmRIcWh0bXN1dVVlSkRBa0NnM21PcnpaOVZKcWthb1dtc29PT1hN?=
 =?utf-8?B?cTgvV09NOXlOaDVKVzltVkpKMGhhZG94NWV5RElBUlBjWDVDcWJHNFVFOGxr?=
 =?utf-8?B?UmI4YU9ZdDRYQTJsVUxUYmF1aXZOeGFUL0pMY3A4VlpoS0VFdm9UOS9vVjg3?=
 =?utf-8?B?YndJS2IvQ0dpSWVYbHhQUHFwVlhqS0srbU55Mm5ZQlNnYXdjZy9EUWdQMFdI?=
 =?utf-8?B?Q2RoeVd4Wndxa3VzL3RneTdOOGp5eDdlaWhBbjZJeXF1M1J4UU5FS3R1T2RC?=
 =?utf-8?Q?7WlHwSIDFetQ09IebreJcrfp4Eshwj/0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2dzbVhtZmhVSVRvN1pYWlYyZGxYcFl3V044WHpiL2NwZm1abmE3YVIvTU95?=
 =?utf-8?B?U1JHK1J0Z3JNMDRSeDl1WERCcUUrc2ZEa1BzVGlHUGhIcXlEa2IydlFaRlR2?=
 =?utf-8?B?a0tIZXNrMlBVVjFUQllwM1lleGNyWU1kUHNrK0U2UTRDSDZQSmNCOTlETTVz?=
 =?utf-8?B?T2QxVjJDZTd0NXoyZ3hkTTJqSVZDelc2TURmSW82cERwd25yQXhqN1pONThh?=
 =?utf-8?B?angwa05rOUFTNlhINUVrY3U2ZUJ2SHVLQTlxU1NYay80Q045dDlaZll4MXNG?=
 =?utf-8?B?MmViSVVrdzJYL29PVmgyN3doNWhwUFhzUDVmYm9LdVI1K3VLdGRpb1l5TndR?=
 =?utf-8?B?KzZFNGY4S0hvWkV4T0N5WFR2R0hxazEyb1pzMUNaS3JzYkh0UytwUmFCZW95?=
 =?utf-8?B?L3oyNVI2SktQNmtwTnFkblVwZ2pUZXdFMktwV1VPQkVkV2dDODJKU0IxcjBi?=
 =?utf-8?B?ZFo2MnlEaThDZmVNZ0tkeXFCOStFbHlmbzAyOE5Qa1cveXhXdGh2WEhTTllT?=
 =?utf-8?B?b2xidEJKL2pDd3E2Q2taTDJ3WnFac3piNUdWVU8wSDJ3c1U0ZjRQUWxNc0Ey?=
 =?utf-8?B?Nko5K2VOVHJVZXJwVTJ6Qys5S1VEK2FtSFl3RHdvT3BscXdMb1ZVQVBKQXdy?=
 =?utf-8?B?TkVzWTlBK25MTlpyRWhXUjcrL1h3bVFlUElBdHQ0K01pMzVIdVJuRzlvZC9n?=
 =?utf-8?B?bWc3dENNRTZsTjJ5N0tuRUovcGVVTTJESzluUGVvZlFKemRMYzlNTU94QW8z?=
 =?utf-8?B?dW95NmFHVWNvWHVrMldrY2tZUjNRRHF4V2ROOFdmMklnL1pPY0tPaXJNZEov?=
 =?utf-8?B?Rm1panBIaGVwdzlTWmVCbzZmYWlOVVoxdnJjK3JhZHdNRXZEL0FXV1RKd2FO?=
 =?utf-8?B?TVViUHlUZ0ttRzljZTJSNXBFTlh2RzN0UzZNa2hwZEJvdDFKTG9pOVpOVVA1?=
 =?utf-8?B?RnFpeWhZaGE1M0JrcXlBbVQ4aXN1a2pGN2xiVFltMFU5VWY0YUpWcDBhQlRw?=
 =?utf-8?B?clNLT3EzZ2UyTnZlYnFPVndTZC8yRUdmL1BTMjlNNGhFeDQ1TDhVRW40QmhQ?=
 =?utf-8?B?RzQ3OTBKTUpCSUlPWWdVQkkzZ2J3QWtib2ZVQUQvTFpBdkkxSUw2bG1WNkcy?=
 =?utf-8?B?OEJnZmk0NjE1RytzRXM1QXpUNGxTQjFBYytQSVh0MXRZUDBXaTkrSmJHTnk2?=
 =?utf-8?B?U1FlejFQdmNYYm1NempjdDl3Z3ZzYXNGZFBPSzFoSWttVzVmQXVpYWVTMTlS?=
 =?utf-8?B?eE5pajlDN3d0M1c2K2JOaitXRFViTGdJZ1lLanhVLzBUSWNiQWo5cm5FOHhX?=
 =?utf-8?B?TTJuNVRUcDg0Ync5eGF2bUpGb09mcERRV0o5bEN3Y0UydnlvdVB2QXZvekp4?=
 =?utf-8?B?RDBZRnczSStvMTNicFl3Y1J3a1ZPS3FVQ3ZsdmZ2bU0yeGpqb3RKS1BnRHIx?=
 =?utf-8?B?SytDY1ZWbVo5OURwNkY4VTJwZlRHd3ZaOXdHZ01xYytGSGxpTm1paXF3MVQ5?=
 =?utf-8?B?eEM3M1hwRjRFSUMzQUYwdWx2aXhIeGdPOHh0cDFuV2cvYllMTmR0T3RVZlBK?=
 =?utf-8?B?M1ZrcHN2dDlnVDc3MzVSaHF6dTJEUGN0WmVCSWt4amQvSzAyVDVIR096ajZF?=
 =?utf-8?B?UUpXMmtlU0ZlVjd5aVhFbEkrUVRoMUNLeFdpajRncVloK1RVemhNQUc0a1Q3?=
 =?utf-8?B?eFNvd3g3MGJ3MmdjRFBLVkJlYVk2dkhWSUV4d1ZFSTFyVHFhUGhrNWhkMWV5?=
 =?utf-8?B?U2lFMCtPL2ZPdDhUVUJ5Tzd0M041WjZNZnA0elVSMUZlYi9CU1pUK1o3aFVR?=
 =?utf-8?B?TEdkd29UcXlrVmZwR1QyRHE2c29PM0JPbUZYaDh2bktDb3UxcGRIVjRoZDRX?=
 =?utf-8?B?Y2lPTkxpZmFkZ2NKRzNHRitoNUsvY1RDK0FWWjlTN0dNSi9DQVBQWUxySzZY?=
 =?utf-8?B?aTNhQW5Vak1vdXdJK2ZLT0xOd3MweGlYczh6OHFwUk1CcHJCSTk1SGdBTHVp?=
 =?utf-8?B?YUhiNk5RTjJGSzJvdm1YU1VidGk4Vk9VS2xuYXIydmMraW5xVnIyUjJ1ZEVY?=
 =?utf-8?B?cVZQaDdDczNLd2Q0M2JiUkFoNUprL1ZEYkFjaWJQWWJONFNwOHhlOUQxSDQw?=
 =?utf-8?B?akNBRGJTOFdYQ0V6MHpkNHRxc2N6YmxVcEhBeG5hMDMvRmxTd3pRL2ZUd2hp?=
 =?utf-8?B?R1E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e8fa0ad-8de0-426e-d279-08de34006d78
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 13:16:13.8093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CAg1FSbZa7BWKbxwCVxB3hERpbJFZJ9YJE8APNyAm4nxUEbsYhK+fnh31nd6mtR/is4aL4yRe0jrFfLpE/AuFFCi52wJsw+l91Fs7VbymHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5349

On 05/12/2025 1:13 pm, Jan Beulich wrote:
> On 05.12.2025 13:40, Andrew Cooper wrote:
>> On 05/12/2025 12:01 pm, Andrew Cooper wrote:
>>> On 24/11/2025 3:01 pm, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/include/asm/bug.h
>>>> +++ b/xen/arch/x86/include/asm/bug.h
>>>> @@ -21,7 +21,7 @@
>>>>  
>>>>  #ifndef __ASSEMBLY__
>>>>  
>>>> -#define BUG_INSTR       "ud2"
>>>> +#define BUG_INSTR       ".byte 0xd6" /* UDB */
>>>>  #define BUG_ASM_CONST   "c"
>>>>  
>>>>  #else  /* !__ASSEMBLY__ */
>>>> @@ -37,7 +37,7 @@
>>>>          .error "Invalid BUGFRAME index"
>>>>      .endif
>>>>  
>>>> -    .L\@ud: ud2a
>>>> +    .L\@ud: .byte 0xd6 /* UDB */
>> P.S. Presumably binutils is going to learn a udb mnemonic at some
>> point?  Can we include a version number in the comment?
> I has already learned it, so it'll be available from 2.46 onwards. I've
> added a comment, but aiui we'd then need to also cover Clang's integrated
> assembler (if and when that gains support). In the meantime I've made both
> comments say "UDB, requiring gas 2.46".

Thanks.  Clang Trunk doesn't currently know it.

https://godbolt.org/z/ccrhzq95h

~Andrew

