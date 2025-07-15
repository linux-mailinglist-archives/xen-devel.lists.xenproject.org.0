Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E24B05249
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 08:59:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043523.1413480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubZcf-0007zW-9A; Tue, 15 Jul 2025 06:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043523.1413480; Tue, 15 Jul 2025 06:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubZcf-0007wP-67; Tue, 15 Jul 2025 06:58:41 +0000
Received: by outflank-mailman (input) for mailman id 1043523;
 Tue, 15 Jul 2025 06:58:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Lhd=Z4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ubZcd-0007wJ-KS
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 06:58:39 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2412::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20b72874-6149-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 08:58:37 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Tue, 15 Jul
 2025 06:58:30 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 06:58:30 +0000
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
X-Inumbo-ID: 20b72874-6149-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rfSTzxP4GwyH6zoOOy3AnuM4vS5tg0YX6BJB6ZddIgbwanUBw30oUASiKnlJl7DMnSBtFLvr7+EWElXNpdLD5LsNhyYCiP1L+5ME7c+nXOs8WdFCrU5cnbuiV2uo4PMJB4oU/+rV7d9V9KRPNVXmwJYP0VwAzTgbd73PQ7TEQ8GzLNfoiiQRl8/3kWwUknSdTlTE067NqWUyc61hV80Q7Y/l7Y6RadijJwbkhCCWsEaCfFwMxnO2AYb07UyCmVvtFFoOrOsyHsWEPkS5UUnmrIa5asugvb7ntnhDUTsbPQ0aNkjL28vCWQcfweStEen8xIVCxMaRmTnjVF4eo0Co5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8R5risiUqKxzsH910C02EXv00OKYMx3/1y5C/HIwerQ=;
 b=E3LxtajwM1TzHZ+B22V0NZPANP8NVQzewLGw046Y3SdmBNpG5jbXe9QBJHzd/5vDfBhzmmtCvVMyJMFypgDj64au1WtP0XH2gy0ST6YrzcE47xx3FRo1frvQbeU7VqM7m0ebtuNFzJR/ZTLwr4vlXbO69kjScDrUh7+DPQ1XkBNGVsRW6uuUkYtSttfSQkCL4QlMy5hvVBkBsp5YUYDHE4M2nBjbFmoN9AbwlYMw+rIJAv45HgjS6BE2Mu2LosdFD8jDursIsFRrNeS6m4Z0YUsRo5b8CdaK0EoQCFewhKU0WV91klhqG34djjOxAgstyawLNDiOEjtpoOkc+q1XSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8R5risiUqKxzsH910C02EXv00OKYMx3/1y5C/HIwerQ=;
 b=nW4MKMCXVZXUIvyqvigzSX4s7We1RvPpjQESBH+Ugmd5BVkfuQOcKe05B6oWv0Ov1e/PpF8+yc3lyob/bUZ5btuvaECNxKn5AQiuHeBTy+pmm8MlI9fzquGmd7uqKqsQCixgkafa/Vd0rw0EB7xMH3rVARdNKB5nupKDzCW0lV0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <a7716f39-8eb0-46fb-9510-105c026a9170@amd.com>
Date: Tue, 15 Jul 2025 08:58:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/11] xen/dt: Allow CONFIG_DEVICE_TREE_PARSE to
 include device-tree/
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <agarciav@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20250708180721.2338036-1-alejandro.garciavallejo@amd.com>
 <20250708180721.2338036-12-alejandro.garciavallejo@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250708180721.2338036-12-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::17) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DM6PR12MB4123:EE_
X-MS-Office365-Filtering-Correlation-Id: 368d34a2-fba6-4c63-f5f8-08ddc36d0189
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGVPNFIzczA2ZDdRVnhieUpTKzVvd2RROHdMR1I3bUlZM1E2ekNrUlZmTzBC?=
 =?utf-8?B?NUI2TXpxakhXMFFtelZ4K2ZycmVlRy96VDN5RzdDc1RuQW1abU1NQnZuajd4?=
 =?utf-8?B?Qm1QcFhoREZ0dUt5R3I2VVRONFpsOXYrZTA3UHV1cTZBL3J4UWJ6a2xSaGJ6?=
 =?utf-8?B?TG5PMmI5VDJDZTJoWVp2WWplbk1sWmQwdm9oNUM1YU5ENDk5QkJIaC9TRzZ1?=
 =?utf-8?B?T3kvV082U2tpRkt2bDFaYU9ubnBhbXNEdnlrZzlEWktaNExjMlcrNDI4M2d4?=
 =?utf-8?B?c1dKZ0pINTZ1OWhBb3NKbkNOTlVSS085NkVnVGxxck9Sa2ZqdlNQalZqNVdM?=
 =?utf-8?B?WXBYdWJnNG5YWjc3MzdvQ3JmMGtRNUFVKy9HTlgwNTRRV3NlUFBpMDkzdit6?=
 =?utf-8?B?S1hpcnlNUW45Vllza09CeWdlRCtweitWYmYwSS9xdDRJNzd0MmRpVmp2RkI1?=
 =?utf-8?B?SEpkNWVMZ1VMcS81WEpvODU3NG05M2ZoaU1GN25pNW8rNmtvUExSeGRONmdE?=
 =?utf-8?B?VTVBeVVKaVJTeUxtUGVkMnlCVFpoc0t3eGxkQ01UcEJxRkIyR3FBRkFWVmdX?=
 =?utf-8?B?VG12bDNxZEMrQ0toa3MwVzVUMVRWTG44T3owdFF2VEdtdzVlWGRhcTlkNGxK?=
 =?utf-8?B?TVNpNVhhYmwxcURURzJFK3poS2U2TG5FRWkvd05xS3RxTlJmK1o5QzNHaEQv?=
 =?utf-8?B?ZHZSZk1QS3Vkd1NnVlpSSjFnZGFDR1lzbHVDU29CeDRremNteEp4K2xUQyth?=
 =?utf-8?B?SG9wZjlWK24yYXpZSzVnampYSzNzc1E2UEtWbHRpZEZSWElmZ3AzM0RheXFY?=
 =?utf-8?B?OW9qVVhBajlqM1lkZSt3SFBQOTZ6alJvcGxiRDVEbVlxWG5GZXNhRWRadjdv?=
 =?utf-8?B?dTVVNXNkSVE3dktXOVdSeTQrWllUZEZ4Skd4bnU0SDJZY3lKTnhQdXpqSTcv?=
 =?utf-8?B?aFlrdTRwMVR2LzQ1NjhQeC8wb0VtK1h4M0dmL2N4N0ZLTmdNZkl3Z2tQdGlu?=
 =?utf-8?B?RGpvQVJ4Z2FwU2g0eXVKOTBWaTJEUnh1MzVxRHNYakFCdExVTHlxdER4ejR1?=
 =?utf-8?B?ZXNJakQzc2l5VHkyUWVVeU5FeE1Rdy9OU2xkUUd2bTByMlVoSGtGMU1LVllO?=
 =?utf-8?B?WXF4eDNSakw0Y3VXVnZkOXdYK0ZBWDlnZlR6bVpVZHphM25JVTk2SlE1Wnp6?=
 =?utf-8?B?NHQxK1pKVk85WDNPK2pwS25BTy9lUkt2WjRvUmxKaVA5c2wxYXoralpEVWFC?=
 =?utf-8?B?alF3TmN4c1cwUG43Y0RiaTBiVVNzVDh3UnVrTTVvNUpZZ0VhSUo0NG94QVlk?=
 =?utf-8?B?OVhIeEtpTWZlOGtKcUMvOUViUXR1TCtnNEVGOXVPdUdtSStTRi9uOE50VTEy?=
 =?utf-8?B?NEp3aXRnOUhSZE9Jc25WREFka0lvVVVDMnhEVml6YzhzU3dsTU83YjRET2Vh?=
 =?utf-8?B?UmpCa2dFdTM3UGNZR1BQanhqcFJDbnJ5ZzRMbGhNenRaeE5HZ0pJaStSeXRa?=
 =?utf-8?B?KzIybWMwdFVzZjBrRklZTVl5bStrRUJRVW1za1pDbGN3TTdYNTBUWlRwSFE5?=
 =?utf-8?B?aXIvT0krMS80K2FiSUUrR2pCeitvb21FZVVYczBzQjRMUXU5cDNkQnkvSTRZ?=
 =?utf-8?B?em8xY1YxUzhmL1NwZ3UxMzZxZTZvb21aUXEzR1Bla0dmZUpSZzFMLy9uYVZE?=
 =?utf-8?B?Q3FSMDdBSzNYN2RrcDBqdytHZEhkeUpoYmVmSEhxcGZIMnoyUjR2RE1Ddlpn?=
 =?utf-8?B?byt0cFJsWFNXQTZkU1AxeEF1Nnp6WGczdFpSUWx1VU1MT1IzNmVXdTZTcXFm?=
 =?utf-8?B?QkRzajZzaXdsbGVpam9wSmhSMjdMQzJ6OXpyQXZUa2NvRjVqVStKYngvdWRF?=
 =?utf-8?B?bUxDdzJaL2VlQjBwa0ZEb0Zha3U4V01JZ1MwV3A5M08xaXFtVFZKd2lnQlhX?=
 =?utf-8?Q?25K68ieg1Ns=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3dWVnIxaTZjMitkOHF4Z211N2NIRUlYbFZDR0dCNWZaK3prTGN0TVFOek5M?=
 =?utf-8?B?K0toNlJ6RUtBRHVOZDdNZ3gxNmlHSmFOQzFTYk1STUlWdDhEVlFLNEhsOWpD?=
 =?utf-8?B?RlpTdFpLcVBCdHdqREltS0xoVDJxTEJkOE1qaEl0VDV4SWpxZFhuYTBRZXIx?=
 =?utf-8?B?Ly9jaWJjZFpiZ1dLcFZYUkx0UzB5Rmk2eTBpU2MwaXQ0UllIb2IzK0tRN05N?=
 =?utf-8?B?d0JOdWZtY1IzSS9JZmVkYzlETjVIbTJGb0dpK2I1QXJzZWNKRFRCN1hCb3FT?=
 =?utf-8?B?TlVSd1VVaWZnTEJIUStISDRseXFoNlBlZ0Qydms4Zk5pMmc2azZJS25GK211?=
 =?utf-8?B?ZlVnRHNXcy9mdTBoZmZxS083UWx3UWpZZUpGOGpjTnFBSkhqVlJ0UnhPMXNR?=
 =?utf-8?B?ZGhPWXZERGYyMEV6S2NrcnhSS09wdllaOGc2UURlMkZCNVFrbi9WR051eFRG?=
 =?utf-8?B?RjJvTlRwVm1DV3AvRlM2SkdLRkI2K0NpK25SbzA0M2FxRmI3blUxWFY1Y3A5?=
 =?utf-8?B?QWNZSnZDcUJPbTRYZVVKZERPMm92RURRSDhCQzJNYmFWRUsrbWRaTXY0cGdl?=
 =?utf-8?B?STgwZVFVdjhEN2tvNVBBczNtY2VKZm4zOXpxbUV0SDRHVHIvS2xMYnYrWS85?=
 =?utf-8?B?WnZtNVEwbGVMSWpKVUtXSVJBRlJWTEl3UDR6M1l5d1N6ZkZENHovUlB3Szcz?=
 =?utf-8?B?ZkxxaThaTnFLYWIxK3dnOXhKb2hqMWZhMHBCRVJ3UC9sQkh4YlZnMjFMdXdh?=
 =?utf-8?B?dUtZSHRiQ2t4cDU3U2ZvbzhZZGd6eHFzYUE3Y1ZsMjdMVzBRSnZEcEZzNFJC?=
 =?utf-8?B?a21YKzZtTWNmNExqT2h1SmJrSW5OczJwMzRXS1JrRHhNcmN6OFBuYTdON2tU?=
 =?utf-8?B?ZWllejJDczNhcENIWlRMaGJFZjdHekh3YnpZYVJ4QUhiUXUvRVFVa1hyaTh5?=
 =?utf-8?B?TWxYcDJndExvUVhtelBFRmNzMHptUXAwdzNGSXVuUDhFL2pMRDA0L1ZYclRQ?=
 =?utf-8?B?czFMQ3AybEx2d2pMN1RKbzYrY3JvV0lLd0k4Q2hnQjNVYS91akgrVDFJZWxm?=
 =?utf-8?B?WjlqMnp0aEdZbXNOSE5wengzNXQvdkIyZTBmNW02MW0veGxyRjJ2YUlIdzRE?=
 =?utf-8?B?MkNZYmV0UnpuV09hUGsxdC9tT1dZNTlwQStmY1ZjR1lybGlSa2tjNzV6ZGFk?=
 =?utf-8?B?TG42cFRKTWd5cWl3cU1WT0VZWHE4eXE0TTg5dkpNSEpQVVNDUlFlR0ZpaWNX?=
 =?utf-8?B?MmJ1dDlsZlBPYjhxd1c0cFpoZGhPclNCOVF0d2NPa0NmSmE0eHdjTVVqN3hk?=
 =?utf-8?B?L2FCcm16R2lDMmdQYVNMTlNWYzY4bExsSDlTaXBMZlN2Z0hmNkFwdUR1MUd3?=
 =?utf-8?B?SEhZYnlWNXFveEwxSmRMMWZZaVlpeWlBbmNUV0czSTFrWWhralJ0VWZTWWs4?=
 =?utf-8?B?c1Y5K010VkpwVDFQeVI0R2owWEQ3L09vRHVCL0sxL0ZUbUdsbllJYnpoeXlO?=
 =?utf-8?B?dEpGSEJIcWEwbldEZWN1MTBEOGF5RitsczlGTFVZV1JyTmpxTVhPVzBESDRT?=
 =?utf-8?B?Mk9tb3lrSDJvWFRFOEdYc0hWcUx3anVRUU5aUVIxdk5YOFNGQjZQMmJ4bTEv?=
 =?utf-8?B?QnFHM0FnY1dHallHcmxNYkI1QXhDVVdsTFlIeWFZYmE1RXhMVzVoaHhwa1hZ?=
 =?utf-8?B?TTEreW0za2NqMDc1ZmpsbVNFNUJHaDI2V0JLUWVGVXd3ajFSMjNKS3pwdXRO?=
 =?utf-8?B?QXRCYmRhYmwvMGJnakNCVHdPMW90MmxXdmFyWDdTQVFVSGh2NlBmTzZmTHN3?=
 =?utf-8?B?RzluSFhJRG9EbnFYLzZ3WklTdi9iOENuRkJHVnM0amtmSzI0Q1BQdHFsempM?=
 =?utf-8?B?a2RYYis2a3JES3lDckRSL2tZSUFrT1FXM0hKcHR4V3pIRlhQdWxsQXNDWmE3?=
 =?utf-8?B?OWlzS2dMTDZhaER6aGxnKzQxYzRpNlRBTkRnMDVhWHg4UGE2UWlsN0k1MUdQ?=
 =?utf-8?B?WkpPbHZVT0N0QWI2TEZNcWhTWUd1QzBoZjc3aGxvSWZDajMwMG53TC9kOTdx?=
 =?utf-8?B?cHFmelIvc3UycFNyd2k5ekxpUGY3c0NmZG1tTzNleVdSYmRsUVduRkdHQ3ZV?=
 =?utf-8?Q?7q+RAgvd3WtF6SwYoY4nUf01+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 368d34a2-fba6-4c63-f5f8-08ddc36d0189
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 06:58:30.4269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w+k1nJehpUAPHkL4+1dwgHt5j1JmAxX0yMG5f4JghjxfMwQHyJeHXszxrVnZE3hP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4123



On 08/07/2025 20:07, Alejandro Vallejo wrote:
> From: Alejandro Vallejo <agarciav@amd.com>
> 
> This allows bootfdt.c and device-tree.c to be usable without
> CONFIG_HAS_DEVICE_TREE_DISCOVERY.
> 
> Gate everything else on CONFIG_HAS_DEVICE_TREE_DISCOVERY.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


