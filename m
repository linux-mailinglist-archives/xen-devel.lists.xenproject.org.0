Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 677B1AD1BC0
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jun 2025 12:44:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010234.1388408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOZz2-0005lW-W2; Mon, 09 Jun 2025 10:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010234.1388408; Mon, 09 Jun 2025 10:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOZz2-0005jM-SY; Mon, 09 Jun 2025 10:44:04 +0000
Received: by outflank-mailman (input) for mailman id 1010234;
 Mon, 09 Jun 2025 10:44:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Wg0=YY=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uOZz1-0005jG-IE
 for xen-devel@lists.xenproject.org; Mon, 09 Jun 2025 10:44:03 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2409::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4a45f0a-451e-11f0-a304-13f23c93f187;
 Mon, 09 Jun 2025 12:43:57 +0200 (CEST)
Received: from MW4PR12MB7334.namprd12.prod.outlook.com (2603:10b6:303:219::21)
 by IA0PR12MB8226.namprd12.prod.outlook.com (2603:10b6:208:403::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.36; Mon, 9 Jun
 2025 10:43:54 +0000
Received: from MW4PR12MB7334.namprd12.prod.outlook.com
 ([fe80::2e77:557:17d5:86f8]) by MW4PR12MB7334.namprd12.prod.outlook.com
 ([fe80::2e77:557:17d5:86f8%4]) with mapi id 15.20.8792.038; Mon, 9 Jun 2025
 10:43:53 +0000
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
X-Inumbo-ID: a4a45f0a-451e-11f0-a304-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lMgWITPgC69v+FjjFS7yj2gB1+q1GfXDHmhE0YS+LztRXO+BIT3ax4Z16lBTEA5cHdxUKWlLd0UtpFEkJN99a8FBcvWg1jytBWRHRECge43p+ZZe9lj2nSRGWA/TahME6miaDEY4czRyeXWR+/LjD3jZeH5+Ee7koEbJEE0IL+s5l2F18Mzpuh4bbRhW7W4MxmxW1dmNKUuD/xkA1Jx0jQmsDN/+lBeX1zO7ubxhxl0Qn3YwxyRKjXdqE6YUhJw08u9QbkcP6ozwlft5474CCRKBEqjPCibKebg8zkA8QBz2OdKT2jZLATmh0h3AcxrEENJGt0QQcQuSQxYXN6MVZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6LUEIsuq0nFx2TIOmQ5bupBDyKIWNqB15EzXC+qyIM=;
 b=roLXBB/pYfH8Vy1iTorwILDWajrdL5zhi581JzH2G9HZU2PfqCx5shzAHYlmARjHKENY2XGc4jJ3gAxRFart+l3FGsXw31oKHSfqOce7TPvnlYLuyoPihipBGK9UCVqFMz00R2+IJxtxxpFWbeJFYURl2ryI8F2GTDKwwfBxgXsPlMl2GStLU/QVzN42h6ZZH34yYMDrS2qxtvvxUGRhesiWLgh4B5onZvXr/VVlrV6vJguX9tpM1KU8iFfF+WarECgyPsHGrSc9AYvFy+WQ81JIAZlA9bPTWVQNNiZijxNs4iojGgea6BFtNJxPdYiS5Srtn+BDCa6ug2yYr1U/lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6LUEIsuq0nFx2TIOmQ5bupBDyKIWNqB15EzXC+qyIM=;
 b=Ty31gMcuptSbQ37j3BU7kWi9NGUpbAN50lYuIshzABiyWbpb+g8QQAeBuGnyGWiRdWK6JQfTg+y+O+gJHXulBkvhVxfN/h7NEGbrrn5NgeNEtSMyMmWqmoifjCtECMW6+MMX/6PHnXguU+PkpzCB6IEWjqIPZ2wetr9xPWjlOAE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <55f6d0ca-e622-48b9-8e08-4cc7b7951bd8@amd.com>
Date: Mon, 9 Jun 2025 11:43:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm/mpu: Provide and populate MPU C data
 structures
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
To: Julien Grall <julien@xen.org>, "Orzel, Michal" <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250606164854.1551148-1-ayan.kumar.halder@amd.com>
 <20250606164854.1551148-3-ayan.kumar.halder@amd.com>
 <ee8df4dd-1256-49e0-827e-c4dfe9543fc7@amd.com>
 <a1b87894-9c9f-4ed7-ab81-63cc27440ad4@amd.com>
 <b066c5fd-76e3-45c3-be1c-f8260d283cc3@xen.org>
 <f19d8968-7a2f-4f62-830a-4a7c578a1d72@amd.com>
In-Reply-To: <f19d8968-7a2f-4f62-830a-4a7c578a1d72@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0184.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::28) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB7334:EE_|IA0PR12MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: 273d1cc6-60f5-4941-bbaa-08dda74286c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wk5rQTFNNEpaWXpjeUJyaTdtaGhKUERwWVUvaXo0MktXMGtWSC9UZ010MUR0?=
 =?utf-8?B?YWRpV1pUUVZkSlNMeUVQMnFGdmRBVEwrUFo2WEtVQkZia1pwRXFJRlhWNzFi?=
 =?utf-8?B?WjFLK1lKa0NtalRxcjZEL2JFSDVoQ3FkcTdkTm00WEl4WnIrYWdKWUd6eDhJ?=
 =?utf-8?B?UE9GMmZFdmdJR2hLOWJDSFUzTk1pTEF4bFdCWEJESGN6SDFEWHJnQm5yNW9W?=
 =?utf-8?B?ZkRMdU1vM2lOaUFoREFHM0g2VjBGS3RvTEtKdTVFNmR1dlQ0WXlWc1p1SkQr?=
 =?utf-8?B?Y1EyQnlONjVoaWY2SkxKb0lmcld0Y1htRnNmOW00LzVoVUhWbyt6WE12OWda?=
 =?utf-8?B?OHJCYUM0Wm8zK0grNGtPS1puYUVMcjVUVWU1Q3ZnTnZNWDcrMmV1QmNlNVpv?=
 =?utf-8?B?VC9sSUJkSkI3QUw3TnhqYkdFQzdwdG5iSG1EeXNQS2Vva240S3pmR3ByK3k0?=
 =?utf-8?B?anBCcnMxUUFCbkhNVHhGNlpRNWx0WGl3VDhrcWR3MjAxZFdsM216ZDZVM1kv?=
 =?utf-8?B?aGlJUWlMOXlHVXViRTJBWU0xdXF6bUMvQXRrOGp4YUJ5K05PbnFobzVCUVVE?=
 =?utf-8?B?VjdMYXA0TXE0eEkvQ2xNbmhjOHdjT1duRUU5eEEwTkE0cTJ0OEdYVlp4bGJo?=
 =?utf-8?B?VXlWbmRGTGdqVGtPN2xjTXIyR0hLVy8rZFdPQklBWkRmamxOdmNzdmE1YVp2?=
 =?utf-8?B?c2JLUFFCNTU0QlFPR1NNOGsramI0bE53N3AyV0hjclIrNGdmeHF0aFRjQTJ5?=
 =?utf-8?B?RkkrSXFUczhZbGo4L0gyT3JvUWorRnlaTVZlVG02WHFSRkVmcGRFRUV4cHZ4?=
 =?utf-8?B?ZmNXUkpOMEVEeHAzOC8ycGs1VzdXRDZhVFUwUjB6cXFBT3FwK3NuQVJibHBm?=
 =?utf-8?B?aGs0eXB0WUdLYnRZNnM1b0JIUHZROHRBR0JNcThZanBjdmxWb1p6OU53S2ts?=
 =?utf-8?B?NEs2SnZzbVY2cWw5a2hBN0paQjFIcmpOWmtVNWgrdGtCMXMrRlBCRWFWdlpj?=
 =?utf-8?B?TjJITmRVV1UxUGlvcUtsNkVLeHM3WUhzcFZsUEFLSk9uTjFoQVM3aTh0MW5X?=
 =?utf-8?B?Zk0xYW13eGk3ZUY2eHlpOUdaSHdNbjRRUDF5SU5nei9rUWJzVWJlWFZwVnNT?=
 =?utf-8?B?aFFLSitxYWs0S2pxUlhEalNJcHFwTGpQMk5mcWlyYXcxbXE2M2YvTzArMTBm?=
 =?utf-8?B?TTJaUC9GcGM5QVhSeCtUb2NaODBJVzU0UFlXcXkrYmRDM21wakZCYnRBVXda?=
 =?utf-8?B?UmJjUjVFRDNhRStBTS9tT1BUQ1R0NDJ5RlppUm1QbURGMzRkR2grZmZ6Um83?=
 =?utf-8?B?VXU4dklPSExkOGdhNXQxUllORFZxdWtIaFBENjZkMnpmeHNFNmtETmQ1UEpW?=
 =?utf-8?B?bjFjTFBwUVV3NkE3V0VPQTZRVU1pTDVReEphdTlhcHN5eW1QOWU3aVlsS0tL?=
 =?utf-8?B?eDR3aXZ2aGl0bStqaDlnNmN1VUhvd2JhYS9Td1RqZU9naVNUbCtpQmtndzB0?=
 =?utf-8?B?THp0MDhQbWFOUXBqTGlwTzJleHViZWZldEE0TlpnNHdNTWVlVGJ4Z2llK0NT?=
 =?utf-8?B?NFdKS0tweVRGYUg5RXBtR0hoeVJMWTQyV09pQktkSkxoaXFhWVJtSFcxOTFH?=
 =?utf-8?B?dWd3MjVNaFBLTVBrRmE2akJsTWF3MG84bDc1MlpITUtuK2FkVFVyNEsyOU56?=
 =?utf-8?B?NkVla1BWTS9Qb05VVXhoek9KaTh2YlF4UmhhZllSbklVR0hBVFdjSHc4QjBR?=
 =?utf-8?B?K0Q5c3NZc2RvWWg3Sk9OVGt3TDIyL3crU0RKVkpONGRmNTdUTEpCcmFxb2Nr?=
 =?utf-8?B?Q2dQcUo1ZVhnZFdoVldyRWJOUUNoQm91blV1Z2xEZkRsR0hyU1NGaHF6TWZQ?=
 =?utf-8?B?NWdEVjgwUHI4NHYwYituSUt6KzhFK2ZNZlFYa1hqNEN5SDlrNGtialdvOVMz?=
 =?utf-8?Q?7p5lqiOcSGU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB7334.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTZYUkp1QkR0aTF4NXE3eVpsYVBQdURrU3l4aWYrTGJFQTI3dG5iTlRXMDBx?=
 =?utf-8?B?YnM0SmtwR0xQcytFV0J5RVIwdy9STjVLZG5YcVhOblQ0R2o4WDRBQWlNZFRx?=
 =?utf-8?B?VUd2d1Q4dzNiSUhyMHFUTWlHelZjKzR0UjdjTmR0R1VIZmlYUnNoWnRsNFVF?=
 =?utf-8?B?TERweTV5R3ZSMDN6OFJoc0dwZVdyZWFlc2ZvblAwYkxhdHJtVVNiWlk3UFBt?=
 =?utf-8?B?YW1SNkVJSzJyMWRMVTJ0a25hV2lNdU5raUh4REMrUWZkWVFGOWxuMVoxWitC?=
 =?utf-8?B?MXNaNERhNHV1QXdtWnB2djFzU005TTFkZUkyMUk4NnZQVEIydm5LZUxEWFRi?=
 =?utf-8?B?UW5hQU1OWi9Qb1gwc1hrVnJHcEdmNC9maWxpT0NyR2doN3V4OWIyU1Q3U3VX?=
 =?utf-8?B?VUVjeEJvNUZRZzFNR25OSmxobmk1MTIyRmg5VllQRjllZUFGdFljL2RjSzYr?=
 =?utf-8?B?UFBOVWdWeEdGNVN0TTE5c3ovdm1aTmJrTXBXUnM5N1hkZEI0VjdQZlNFOXJT?=
 =?utf-8?B?R2lzZEJDdTk1NVF2U1pZVUt0cEE1bVFCVWpWNllnWFBPZmpPSm1HcHlzcm9r?=
 =?utf-8?B?NGhBNStXMmJaTmxJbU94eDZZK2hnejVSREo1VDZ0WlMyYjF4akQ0cm1uTHJO?=
 =?utf-8?B?RCtTWXpNdERGQS9vTHBFb052T1VnOUlGRjRqSG1EbVhTNktjbVNzQmt2cDJ2?=
 =?utf-8?B?K0FJMkhzc2E3MFl5Y0xKNlVpVWRlampHaENWMHhZT2kwOGVwekJRMlJIWDZ5?=
 =?utf-8?B?VVBIVms4ZUlkZ2lwUHBPMGJUMHQxRjcyMytyaEFjN2dhNENKeW1uYnlSY0ZZ?=
 =?utf-8?B?cGd6WDFwaUdIWTc4eVZlTUFPcFZMRFZpM0hyeitsY0MrT05VeDVpblpVVVFq?=
 =?utf-8?B?QS9NclZRTTJmOTVjN1N0dXVycDIrWEZxTlRaRlNyVXR2clplL0lKTXpYbmk4?=
 =?utf-8?B?YmZsZVJIU2taQUdxSG5RL0NkUDVHUk1neXUvWC9xaTVFdUp0THpMWnVQdE1E?=
 =?utf-8?B?NU1LR0lCRnJKMlQ3OTZyN2tvYkVhcTN4czNQZHZML3h5MjdzSmkvWVB2YzJB?=
 =?utf-8?B?NEQrd1NzZWhmRVhNRERxaGRBZXZ1S3c4SkhFSHJUNEExVnY3T0hDYjZ5a2kv?=
 =?utf-8?B?UU1FZkJxT3dHUENhb3F4RVFWRUVBbFFCUzhETEd3NXNCZHA0VFkyckRMSlBK?=
 =?utf-8?B?bnNIbmVVTWJHTm1ZVndxWEFDaklQWkk3c2VodjMvaytaL3NpWDErSWpQUU4v?=
 =?utf-8?B?emVEVWNyamlhTW93VGdxNjM4dWZPak11RFJIVjYrSjRWZktWVFhFaVpjK0Rs?=
 =?utf-8?B?VndaRVloY24xb3BVOTNCT0V2Z1NuY0praUhFWk9aUzNvckVqSm5hMmZCSTh0?=
 =?utf-8?B?WVAxaERCTU13ZGd4UnJVUnAvTWFKcGxQVVVLbmZXMnlmY1pSRUZCT3R0Tkdu?=
 =?utf-8?B?OHJBTjRWaVRId0wwTjBpR25EZGZVZjdINjdBdTM0M01heDFOakFnVmIyZ3lR?=
 =?utf-8?B?eHZiRTN3eDFaK2JTNkpnK3JiTi9teWpQVDdXTDREYTVvU2gxeTVlWE5XaFUx?=
 =?utf-8?B?b1F2c05nNnV1NWtFUEVLUzRqa2Evd2NQRU1QbnBPVHpEUDkrOEdoeTF1Wm1F?=
 =?utf-8?B?QkI1amhwd1lwcGU2RWhEU0x6QWh2UXhHL1V6YUJMcGg2clpVanBsUHZZK0ly?=
 =?utf-8?B?NXpldXhpTXBxQkxQMG9Ta2hvbEY2c1BzQ1d4MHB3c1hBdDRndkFjczRnN0Zq?=
 =?utf-8?B?cUkrbEtjd1BQM0JnOTQ3MHNBSlQ5eStaTXdRQkpxcUNSbVlnUDJFY2R2ajc2?=
 =?utf-8?B?TXNRNTRTMVBiYkxLVnptZ0pOTjhGb2VUMFNORGRXRENveFdaN1h1NVRjblh6?=
 =?utf-8?B?aGYvREZjVEhMT1paQ21Uc1Rya1VyQmNhV3dXcHFjUTN5aUdFREo5OE1sQzlL?=
 =?utf-8?B?Snd2OUZBTXV3L2dMUmM5U2JENW1UenlVQU5nTjVWdERJM29XNzl6dGFkU1pw?=
 =?utf-8?B?ZHlBWnEzUnl1YVc2QTA0SzFCd29KYi9FWkdiZHhBUTdscWphQ1dpeDJ6ZG5k?=
 =?utf-8?B?NnJXL1BrOUcvVVYvZmgxMDVzUzBIQVo5MmVZL0ZNSk9kWWNUb2hVNW1EWHMz?=
 =?utf-8?Q?Jn457jMMaR2ARWjrWIavcvapx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 273d1cc6-60f5-4941-bbaa-08dda74286c7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 10:43:53.8396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PI7UihS00y94T9UrubJimBpuaNYJZWiptybWjlVZ7pmDggpM3CdfcavCNfg84OqsWDasEe0tzUdk7VrKXwNYmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8226

Hi,

On 09/06/2025 10:16, Ayan Kumar Halder wrote:
>
> On 09/06/2025 09:42, Julien Grall wrote:
>> Hi Ayan,
> Hi Julien,
>>
>> On 09/06/2025 09:27, Ayan Kumar Halder wrote:
>>> On 09/06/2025 08:41, Orzel, Michal wrote:
>>>>> diff --git a/xen/arch/arm/include/asm/mpu/regions.inc 
>>>>> b/xen/arch/arm/ include/asm/mpu/regions.inc
>>>>> index 6b8c233e6c..631b0b2b86 100644
>>>>> --- a/xen/arch/arm/include/asm/mpu/regions.inc
>>>>> +++ b/xen/arch/arm/include/asm/mpu/regions.inc
>>>>> @@ -24,7 +24,7 @@
>>>>>   #define XEN_MPUMAP_ENTRY_SHIFT  0x3     /* 8 byte structure */
>>>>>   .macro store_pair reg1, reg2, dst
>>>>> -    .word 0xe7f000f0                    /* unimplemented */
>>>>> +    stm \dst, {\reg1, \reg2}  /* reg2 should be a higher register 
>>>>> than reg1 */
>>>> Didn't we agree not to use STM (I suggested it but then Julien 
>>>> pointed out that
>>>> it's use in macro might not be the best)?
>>>
>>> Ah my last response was not sent.
>>>
>>> I realized that I cannot use strd due to the following error
>>>
>>> Error: first transfer register must be even -- `strd r3,r4,[r1]'
>>
>> Ah I missed the "even" part when reading the specification. However, 
>> we control the set of registers, so we can't we follow the 
>> restriction? This would be better...
>
> I am ok to follow this. I just want to make sure that this looks ok to 
> you
>
> prepare_xen_region() invokes store_pair(). They are in common header.
>
> So we need to make the change wherever prepare_xen_region() is invoked 
> from arm32/mpu/head.S. This would look like
>
> --- a/xen/arch/arm/arm32/mpu/head.S
> +++ b/xen/arch/arm/arm32/mpu/head.S
> @@ -58,33 +58,33 @@ FUNC(enable_boot_cpu_mm)
>      /* Xen text section. */
>      mov_w   r1, _stext
>      mov_w   r2, _etext
> -    prepare_xen_region r0, r1, r2, r3, r4, r5, 
> attr_prbar=REGION_TEXT_PRBAR
> +    prepare_xen_region r0, r1, r2, r4, r3, r5, 
> attr_prbar=REGION_TEXT_PRBAR

My mistake, It should be

prepare_xen_region r0, r1, r2, r4, r5, r6, attr_prbar=REGION_TEXT_PRBAR

We will be clobbering an extra register.

- Ayan


