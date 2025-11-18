Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFABC69651
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 13:33:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164660.1491568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLKsV-0003BA-7i; Tue, 18 Nov 2025 12:32:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164660.1491568; Tue, 18 Nov 2025 12:32:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLKsV-00039Z-4s; Tue, 18 Nov 2025 12:32:11 +0000
Received: by outflank-mailman (input) for mailman id 1164660;
 Tue, 18 Nov 2025 12:32:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/jeL=52=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vLKsT-00039T-G9
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 12:32:09 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9538e1fe-c47a-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 13:32:02 +0100 (CET)
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com (2603:10a6:20b:6::31)
 by DBBPR03MB10318.eurprd03.prod.outlook.com (2603:10a6:10:532::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 12:31:59 +0000
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4]) by AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4%4]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 12:31:59 +0000
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
X-Inumbo-ID: 9538e1fe-c47a-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f1S447vu5dioOtvM9IlU0DClQn+T7R9sIXPvgVlG1Q3sBDPrMy9dCe5EBp5i/XnuvT5YVzZlA89m2kAqqOFbxJGkloLVwm7xM9+JzORtn/c1v4cwDAMoD1Z/GphNoSY8fB1KA/tyeFfl00kMh+6lH2Kq/9LHYxT2uMnDp2nJYxvqoJZRMCZ3X+NMn0piznVC7v7o83xYMd1u8rShMmZSHCehqmJJCOdnClYIwabWdXnAjiyEgNqvocwvb7AuumfkiwXV0/e+/KYTg9Ou37F34aKPKqwt3O/D+SA1NJt+KRv/USjAW/BWZql0XKuAUVxwbM+Jg4eUspqwLD11odvqrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMvhyPEAKxba+6N/I1SQm/Bjz8mnxU/laodn14as4RY=;
 b=kA06rWR0LKDhh7oy/6ePFt912lFMLW5EQF/akvD4dkMbmFs1sduWJAPCeUmOnJ7rg+xO4xbD0qHq3fQLpVWNciMRFQkX5HWbiBdlq2NcGsTUMesAytqOcVS8XEK3jNhnK86ZNXUbP1rDsGvF2Vcm1AumQL8mDV+H6pvJTil9Mv8WPFE0s8lb2KZzSGP2G28HWMZBux3WfevdaUW7U99uvvD1J2YUxuKYer6xgxfoGrKSbG2sbqV/WKZrotZ9a4c6Z16LWU01leEvQmrHU3SsuHPy81A/IEDhO2Mq+YXIgUy0VJXyYU25blRVE1RSPGMHfVNC3OVc/UoyB1dknaVGRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMvhyPEAKxba+6N/I1SQm/Bjz8mnxU/laodn14as4RY=;
 b=ZSZDOGCckpWeghks/1PPqQ/MnUMjtgus5cUTSo99x0F5Cc83TN2MZzCrHY6PEan3H90qoiyAfuQ5dEPA/Vp4UBVfCADE6CbPnZgnkmqmBU2Q6bFVuzohFH+WzP4MOtb9qEyog3jjEiK0PZNE5H/m518Ao1exvDkc4WmTrU/D+43KHlH7xt5/MznxYV6gEzsx2fIE/7bWQbYKR95fHCVZz4q1P4DKVAXdBe4FWyY0DCiksFgGLSd1enhugmf+4ciKdUzmqTPzHPBiJ/fV0O5UuZu75JXrFuorXyMfK7CDDYMjouIiwSEgfPpIhdWrdUZnORD/c3vxrlh2AJmDfo3JDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <136279e6-d8bc-4dc2-a441-743482a3e5c9@epam.com>
Date: Tue, 18 Nov 2025 14:31:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] x86/paging: replace !paging_mode_hap() with
 paging_mode_shadow()
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251114144454.287224-1-grygorii_strashko@epam.com>
 <a34a7aa7-53da-4925-8428-cc20e1135f7f@amd.com>
 <547ea289-2dab-4047-af89-b5227c2f4936@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <547ea289-2dab-4047-af89-b5227c2f4936@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: WA2P291CA0032.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::21) To AM6PR03MB4600.eurprd03.prod.outlook.com
 (2603:10a6:20b:6::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR03MB4600:EE_|DBBPR03MB10318:EE_
X-MS-Office365-Filtering-Correlation-Id: fae5f6d8-1bdf-4afa-f3aa-08de269e77eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WFIwYVdvWlE5aWkvYnY5MWRZZ05LY294aXpWK2NuZlkrNGFjZGtnaSt1WCsv?=
 =?utf-8?B?VVdLcm91OTA0ZHVFS09rdzVNZzE1di8xRTNmY285Ym9KcXpIQ2ZvQUxlbHVz?=
 =?utf-8?B?cjBRR1JFRlBEREZ6dFc4aHAvRVE1UlQxVVpuTlBnd3cwcUdEYjhrMFR3SkRx?=
 =?utf-8?B?Tlkwd3hwZWFLQlEvRE5EQm9naTk2Q0FINVBZdmFxb2l3RDJZUzc0eDIyS1Zt?=
 =?utf-8?B?dTdHWjl6aHBYY1dac2RaWVhJWmZGT2xTTmdCbG9nb2xldWtQb3oxSWJwbCt6?=
 =?utf-8?B?OVZweW1acVdWYThWZ2pkM0J5TXN5V0lkVThaSi8zeXhTWkc4azBaaEF1aXZh?=
 =?utf-8?B?cW83WG9aZytLdFRIRnI4UHNWUXhGcml5bDd1YnBjbzdjT1ltWk9XRDZzalFZ?=
 =?utf-8?B?aFkvTW1SNUhYbVRVZkt5ZHJCanFYMFI0dWFTb21XRjhmTFExMHdCR3o5blMw?=
 =?utf-8?B?TGRaSFRDNHJMM1R0SENPNUJKRHE5TjErS2F6TmpPVmZhZEFnNUtGdTQwZE5Q?=
 =?utf-8?B?UDlMcit5YmlLRFRhV1VybHBGOUJPaWhHcmpFWVNyd01vV1VRQXJVWThQVXlp?=
 =?utf-8?B?VDlRL0ZZODNDSG0vWXZvcVR0aC9Fd3MvUHBaNGphLzFVV3JhNDN4MDcrVWJH?=
 =?utf-8?B?TXppVWV6V0dFYVBmTDhuNzhxRERJZDVuc09FcnA0WldpamR5ZlByQzRpZFVm?=
 =?utf-8?B?Z3YzeGMxWjZkd2FPZDAxa3h3Z05VUng0UFNUWUFlNWFOVzNnUmJRM3A2ZXBK?=
 =?utf-8?B?dmtiU2MvVDh6bGlacnp3Tzg5dWVWQXp6bkdIeWFLVUtXckZZQXo1SUhicFc3?=
 =?utf-8?B?RlFJejRzeExZRjcwaU9Ydko0WWp3UStQeEg1U21ZSzA5OVlFNUlQZGJFK1Fq?=
 =?utf-8?B?WHlJaVlNNXdMS2I3QmE4VHlxMEc4Q0FtOUtVRElWRmpEakg2bEVXbXgwU1RN?=
 =?utf-8?B?QjhrK2xUUjdWcFJsclVHSUxZVDNDb1ExSDFRWEQwbEtScW9GTCt6ZlJqS2FS?=
 =?utf-8?B?dWFmYTdVbFBmcVlNV3ZXTG5NR0dlVG1OM2xKNitWSElQaGxVV1N5Zy9aMExv?=
 =?utf-8?B?UFhiMDIzWEZsWm9mZmNOTzlvRUpNNVU0NXBxd0ptWGtId1FuMElXR1lIRFVE?=
 =?utf-8?B?OGxEaHpKODJxbnlRUW54TlBPSVZMdFpEMlpFMjFuV21PRVZmcU45bmNNc0x6?=
 =?utf-8?B?bnc5WEwwTXZUUCtCRGw4UWl5Vkg2RWtMaVQrNW81UVRqMEZ2M1BLY3lOY0Ex?=
 =?utf-8?B?ZUtMZURSNDQxYUJ4N2FkNHpXYVBGamhPek1JRmRSczduTU1JR0x1N0ExSWpV?=
 =?utf-8?B?ZUR5USt6TmltamlBMm05UjdUakFnUm9KUTJTeEQzL0FaQUZRV01ESHI1Umhk?=
 =?utf-8?B?Vk1sWk82NHN3WVBLaFhDSllkTDJ6RTFTVzA1b2ZVRGpOOEJkSEovV2N3dEFj?=
 =?utf-8?B?VnllSFNsSVoxSWd1VFk4K0tHd040Q25qYWZqZEF5cTRaQzFqbU0rRVBYODNT?=
 =?utf-8?B?NmxRVVRxdXBUM01IQkhrN3FjZDJtdGUrU1BWQnJqNTdLcUttUGd3VzF0SmRD?=
 =?utf-8?B?YjhxWE5QdFQyTm9HQitMRS9zRWtNc09FMmNUOFpWYzdMcWtLSGNESHRQRmxY?=
 =?utf-8?B?MFl0NVlwRlp2TVdhK3RiaTRFSGZDaWRxalVVeHQzeGJieUFEZ3dOQmszVmlS?=
 =?utf-8?B?RGtUOGJpZ0pUdEJHWTVxQlcrSjd1NGJpYjZ5Yzd1cTc5RUlISXhGZDJpamVX?=
 =?utf-8?B?WTkzNERZeEs1djNlMnFyaFNrV3pMbHNrdjFVVHBINlMvRjlPYXM4a0JEZ3hx?=
 =?utf-8?B?VEVONHY1SmliR2tvL0hBU1hrblZWdTNjQnBENXo1dTVEK0pDYkdyMS9xL3FG?=
 =?utf-8?B?VEZmYmU3SkJPUE91S3E5S2dOa1FTbEFaRkJHMkFLZTNqYWlhUGMvZkFSMHpE?=
 =?utf-8?Q?icjhouLhkVMyWdjRosx5Bs8Wz6gfw4tp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB4600.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkhVekxrVVZtZjNCMWxoMWlYNHBtZkFQaGorckxMYmczaEUxWDBpcDVqaE80?=
 =?utf-8?B?WWJ3NHBjQVFtNlVOdmlSNTJWRHdMWEdYOXNaa3FOSjNoZ0l4RFJweFRaSGNa?=
 =?utf-8?B?a05ublNJOU5HK1ZESkQzNmVEVndWMWVGSXlwSkYrT0NibFZrc0gxNjgyOWdU?=
 =?utf-8?B?VVNkU0R5RXNiY3VlanlMOFdJMXdUMnRBNk5JaWZGNHZpdTV5T1NjRmUrd1dQ?=
 =?utf-8?B?d2txc1dMbFRVNmRDNTN2RW5FSUFzVi9EMDNibTkrUGhaSXdVVFlQZVJNQjJF?=
 =?utf-8?B?Zk9yRk5DeUpNQkZPeHJKZGR0eUg3bmRWL0loNTRXNEVDM3pSYWJSbXhYZ1o1?=
 =?utf-8?B?RkhQL0hmeVZSMEdxdks3S2xLREpHbFZiU1JQNDgxNHZrZmpCQ2k1NXJwRmV3?=
 =?utf-8?B?MmNKVkYvVG5IWTYyaG9hSkpCazcySndzZzFFY2dsZEpvR29uQ3dKNGg4MWcw?=
 =?utf-8?B?TWZJUTl3MW92eSs3djgyT3dXY1dtUHBnZEZlMkptclMxQWxrTjVRMWJZN3R3?=
 =?utf-8?B?VXdVcHB5a2Y0WkZmRjV4cjFiV3NiZ213TE93SEVCekRoSGNBUzVNY2s0Nmlw?=
 =?utf-8?B?b2VlMkNsVzdQS3JFU3hPMkZoSkoxcmU3QlgyOURNL3V3eU1nZHN5SEhUYnJo?=
 =?utf-8?B?VjU5dnZrUms1bkI3NVBmNXg5WDBoRFo4MHBlRW1VRHZVK2ZEeWt3TmdUTE9s?=
 =?utf-8?B?RVpaV2tPNkxKZ21BZ0YxY2FvTWI3c3Njek5hTHFSR29iMzdZdWZ1aVE4UkdZ?=
 =?utf-8?B?OXZvbDVWOTg3dXZxbHJESEpDSG9xdXVQUDhmK3YzeXNhdVdxVGp1YjRaMUdB?=
 =?utf-8?B?ZGx6MnFqYUxHNms4aU1WN25XUjBDRVNKZm1rMUhNa3F6Q01JaG1TSDhLMEdp?=
 =?utf-8?B?V1dJbG1LYSs4S0R5OWtyQlBRL0NjUlIyL2p6aU9DL040ZitqWVh5UlBqTDdM?=
 =?utf-8?B?Y2NlVmR3R2JLVGt4U2tncFlXaUZtYUs5eHI5dTV6LzhlbHlyYjZzT0pubjZS?=
 =?utf-8?B?UUZBWnExeWswRncxZEZpZ3Z5MDJvWVBsYlgvTWpnTjUxODgzekN2aU1jTzlJ?=
 =?utf-8?B?RnBOUGNiWmZXakowTkg3emRoeHdhK3h0N1RYVDlHS2VZV2hSeWlUWDEvZTJ0?=
 =?utf-8?B?dEgyU2daaGVGS3lycHp0cjg4NGhMUmFGZ2g2M0sxOXBaK3JZYTJ3ci9tWUVT?=
 =?utf-8?B?ZENrclNzWUpwSUk2M3N4QklVNXpiRWlaOC9SdTRlbVF5Y1pBZXFuZzd5ZEJM?=
 =?utf-8?B?SU9ZbStrdHVpTEt0WGtNcHkrNWlPZWR2M1JiTDFOREZTUmZwcU04OVBCM1NJ?=
 =?utf-8?B?UTJBYUFtR3U3N1k0SVYwN0R4TWFYbEdNWEdVWVlSQTVTZHpNZWg2bGxoVlls?=
 =?utf-8?B?T0xsZi95UmowZVZEdHMzcDNxd2UxOWRLTDBUOEg2aEtlM3hzNDF4eWFiUGpB?=
 =?utf-8?B?UE1PMWxpR1dSMWJCR29leTgzNGNvVGxhYTlLdC9oWU9FdGZrYXBzaGxwTVd4?=
 =?utf-8?B?Tit1cW93TUlaQjVOYWpxQitOUFU4Q0xrTjRCZHYvZ1FlcTN3RjRXSjlLbUtQ?=
 =?utf-8?B?VTNWSmxnNEJ4K2pSS21uMVJzYytGN1RZQUo4YkVmZ0V6NGZVdUd0TVdCR2Fu?=
 =?utf-8?B?clJSSmhCdUdJWmQwRndvdlpLWitSUXJoMnNlTFpSRHgxckRDMllUUTNUSHh0?=
 =?utf-8?B?aGM0cEoxL01icWNGbGM5QnZzVEFSdDBYTnhVOHVCdU45eVNEZnlVd3dCenFH?=
 =?utf-8?B?aFRpdVhwQzhFVDJ5YWQ5bmVNUEswdDlqM0JxMlhFSWh5Vy9RcEhuaDJVa0V6?=
 =?utf-8?B?a2JhU0ZnVVRKZkU2Tm1HTWRDUml4Q2JEWEwxVEpKUzFTVVNDS1lpMzI2dTlO?=
 =?utf-8?B?UHVvZ3lrVEVuLzlROGNWT2dhR2tjb3AzQ1FiWXZ2dTdGei9hazZCNExGc0hF?=
 =?utf-8?B?R1JqNFoydWx1QUUrR0dib1NUdzBUa0JDWlhLUlVhaU9VL2hjYUZTQ0lydEFm?=
 =?utf-8?B?SVJnNW9kRnBtaXoyOW5SSnowVURMckhUaElNQWhmYU9jQkxOeUNnS3hVbEJq?=
 =?utf-8?B?SDJPMGNKZmluTDJobFAwczU3K3RHS2RWcmdsem4zMHVmWHdsRDdoQWc4U3NQ?=
 =?utf-8?B?d1puNDJEMWl5Ly9WdUdhb2UxbWMxenczS2VmcVg3bnFlbkRNSHQzUG94ejcy?=
 =?utf-8?B?cXc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fae5f6d8-1bdf-4afa-f3aa-08de269e77eb
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB4600.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 12:31:59.4236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hpDsfYI4bkccQNS5wU+4rwWwm2LDl5OV03IHP0rkmR7pYCQlx55oGCOiGPlJ7lcjzc428I5qmaEeYLXGmZpxOq8WOGtRmt6mNp4ZNj7xdyo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10318

Hi Jan,

On 17.11.25 11:47, Jan Beulich wrote:
> On 15.11.2025 00:21, Jason Andryuk wrote:
>> On 2025-11-14 09:44, Grygorii Strashko wrote:
>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>
>>> Now Xen supports only two paging modes: HAP and SHADOW, so
>>> !paging_mode_hap() is actually means paging_mode_shadow().
> 
> For HVM, that is. For PV both could produce "false". Luckily the code
> changes are all in line with that, but somewhere this detail wants
> mentioning imo (as it's also not part of the patch subject). Happy to
> make a small adjustment while committing; then ...

Sure. Thank you very much.

> 
>>> For an abstract, future case of there being a 3rd paging mode it is also
>>> better to explicitly mention checked paging mode (SHADOW) instead of using
>>> negative check of another paging mode (HAP).
>>>
>>> Hence, s/!paging_mode_hap()/paging_mode_shadow() which also allows DCE drop
>>> unused code when SHADOW_PAGING=n.
>>> The !paging_mode_hap() in hap.c not changed as HAP is checking for itself
>>> to be enabled.
>>>
>>> Inspired by [1].
>>>
>>> [1] https://patchwork.kernel.org/project/xen-devel/patch/20251111200958.3576341-3-grygorii_strashko@epam.com/
>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Jan

-- 
Best regards,
-grygorii


