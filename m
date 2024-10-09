Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F389968BA
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 13:25:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814374.1227927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syUoV-0004cb-Jj; Wed, 09 Oct 2024 11:25:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814374.1227927; Wed, 09 Oct 2024 11:25:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syUoV-0004an-Fe; Wed, 09 Oct 2024 11:25:07 +0000
Received: by outflank-mailman (input) for mailman id 814374;
 Wed, 09 Oct 2024 11:25:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wCqp=RF=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1syUoU-0004ah-3w
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 11:25:06 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2414::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 204b78fd-8631-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 13:25:03 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SJ2PR12MB7823.namprd12.prod.outlook.com (2603:10b6:a03:4c9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Wed, 9 Oct
 2024 11:24:58 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%5]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 11:24:58 +0000
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
X-Inumbo-ID: 204b78fd-8631-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kB45s9DAWYBGKitDIwWPHErFqAH8tz4Pea2JCZlLs0jcuOi/k8eCzM+dpLIvQAPk/hoVjgGpB8iFRrV9qz0b0zUFrQR59sckyCXQmyA8NITycJZnaBdGVR6nekmuhxa9NS/i+e5twWcfLJ66XE+wtYqLxn+rZR9SQTcDOD+RDpJztdtDZwg3G9+0pzz7j0gnd6/BHsK05psNTx7cDiHX3qDqsiC+3t1E0pLNhXTBECeLZg3aQ/czm6JnQOfa3OaZWWIMk6kann/tCXEnhvw7O0gTIvP0q6BRB0b4ekmuKt2PM97NgjBWOl6aNcD6H7mZyqn5owfq6wYL2Il+EDFQCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=riu8HWjqa4InVj9zFGeHqoBn4+hudaVwmcJhwBovG7w=;
 b=OsBcISy1A8GTB+yb5/KZWmaMQrq17+ZRkwIbfn9BEmLb7EpQwOLR3q8NCY/JW7bW9IusRRn0/Z1NkpuO2DL/UFgjbQ37Ua4AK0JiHfcsJFcY74FRgwSRAUU3cy4InNRNEnFCG1h/ETWrvEwNCxOqMleoZ/oFxmlkpZkFrgp2FvGi7OGG5kT5gqU5/8rf/p/WRvlZrzWbFDsmhNj7h+pTDj0dMxKDPo45tbAfbTtOFLsm+lIo6up0HQmDldS7pcLtbNW1T6F274tcnx93wKnmhTBm7RQletoVxIU9Mz+4eZABy3LlAK22vpDkkWH8YPTHAQT7QYw5kbkwOtNx9e12MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=riu8HWjqa4InVj9zFGeHqoBn4+hudaVwmcJhwBovG7w=;
 b=iTq2WY38257X8zxFCaALGZXJuM29VYTMkUhpDKh0kYPzoXc0f6vbQrZ35LnBULA4F5j2+zGdRgievVpDcqrVTkjSbgzXoLEKlApyQq93IkHhqk58Yr+kdLjAcAlprs+eqlFjpHvzK+MUAnES1cNuDeotXzSeGseBHJBn0lJ4aCk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <451c092a-af4b-40f4-a902-28f6f502d39a@amd.com>
Date: Wed, 9 Oct 2024 12:24:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fusa: Add requirements for Device Passthrough
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Artem Mygaiev <artem_mygaiev@epam.com>,
 Hisao Munakata <hisao.munakata.vt@renesas.com>
References: <20241007185508.3044115-1-olekstysh@gmail.com>
 <6E89CC97-C7E3-40DF-8BFA-5F3065429F54@arm.com>
 <f8ea9ab4-190e-427a-ae77-b7c0769dffbe@gmail.com>
 <alpine.DEB.2.22.394.2410081523292.12382@ubuntu-linux-20-04-desktop>
 <85FF2EB0-474D-4807-8DB3-FC502A5B2DE8@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <85FF2EB0-474D-4807-8DB3-FC502A5B2DE8@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::13) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SJ2PR12MB7823:EE_
X-MS-Office365-Filtering-Correlation-Id: a48caf80-c27c-4153-85b2-08dce85501a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VkdWcU1XN3RzVGlmSjJLNEFUdTQ5N1FRQjZvQkFOUkNEc1lZblpiNmdyT1B2?=
 =?utf-8?B?cU51dTlDUWhjQUZtZS9Va2RsK0hDaVVsZ3dKOEhheCtuUTRyem80dXJBbW44?=
 =?utf-8?B?NnBpNUxOeXY5eXVLQUd1TWs3YlNteXk0NG8xODJMeGlHS3RTS2JZd1l4YWZE?=
 =?utf-8?B?LzBoenhmT1hJVmQzQ21CaGVBMDhZbmJIc3Q2SGoxaEJPdnVERU1ENE9PK1c3?=
 =?utf-8?B?c3J0aG84Qk5MMzYyeVJBemtrZUNHQXp4QmtUbXFySEcvdFVxRHBaOGpiZUJ5?=
 =?utf-8?B?MEsrRkdzRTFmenhZdVcvaXRkcjlwN2tPdWxMRExuR1dxZ3NrdGdHeSswQVlt?=
 =?utf-8?B?Q0RwUG9SL2xJRDE0MGN6a3pzR3Zzcmt4YlMydXF4TzVIbmxxSHBMMUR4VTBz?=
 =?utf-8?B?emJLdi8zN0ZRQ2l5bnArdENpOVFremE5VUxXZStyaXJZc1BBMWNqT3psQjdq?=
 =?utf-8?B?aVRhY1lrKytnK2JvcEpzczZLSE03LzExSjFwZ0dmMUNlbXpQd2ZYVTVVdW9U?=
 =?utf-8?B?R1kyU0lyODFaaGp3WW1Rb3ZEcGhoZlh6T0xoRUJpcXNZNWtjb0FPa1hnR0Np?=
 =?utf-8?B?bExDYnVlS1IrcDlmOTdreUc2d2hibzNMcmFkRGhaSGoyQXFGTnFZb2xZRXow?=
 =?utf-8?B?YkkzV1QzMzZoWXE1bHI3TFZoSmkrakFaMHlEZFlWWGFULy94UlFYdDNIcTJn?=
 =?utf-8?B?ekQvdDB3SDhmbEdBSXZ0Vk1zK0tXWmNPRkdUb1IrUmVDbWtncnI4dWtTdGxs?=
 =?utf-8?B?VjNjMHU3ZmRHcjluNHM4d3NJMXhDSENPMHpSdzAzUEdtNHdOYmFXcmRaQkxy?=
 =?utf-8?B?Ylc5MXQvMDdqZmRDeEFmRUhTdkhxdWtXMlNuaEtrSmZKTkxocmF2ODlXV0I4?=
 =?utf-8?B?OG43QW1IWjRueVRlSk9pb0l2SUhHTHB1d3FtWkJPWE9Ed3ZEMUxKUEI3aGdW?=
 =?utf-8?B?Qlplbm5ScTFTN1U3THp2TkN0bk96ZFBDQzFWTmNSaklPU2d1N3JCeE9aWXdn?=
 =?utf-8?B?L1B6aVpzaHpDZzNvMXFZWko3OG1Jd01nZ3ZEVzhHVDdUMS9ZbzBmY1ZlMUlP?=
 =?utf-8?B?MXVKd2twMXVNRURmYXFhMitPL0ZWVkMvS3VVM25sdjhrcnNhTndzVEg2M3h0?=
 =?utf-8?B?WGRwYmV1ZnRSblhKSllBNFkzdG4yWlpVQkdDdlpVODFPdE04dDVIc0cyMlVQ?=
 =?utf-8?B?WWlRa3MzSElLMzdLVFlhU2pDN2tlemk3bkxvYTFyVVFXY0drSkI3bFpNdmRv?=
 =?utf-8?B?UkVMVHN2NFlVWTM2cU1wVmFPdjdRTGd5MytRRFBTSjZnR1UrQk5wRWJsWjAw?=
 =?utf-8?B?REZxY2ExQWJZWGYyaUdpRDV3RFVTREZjUTJSdmxaOUYwTGw5MGlIOC9Wcitt?=
 =?utf-8?B?QlJOVW9Zem00b1gyNE9KMStGaUVNK1NqYzB0VXBiY0ltQnY3SlIrMStqcjF6?=
 =?utf-8?B?QXFWUHZPZFZRVzlUa3hpbFNNV1FWQ3EwZG9ocUdxeTBjbEtWbFpvRXI4SEhO?=
 =?utf-8?B?ODc4ZFA5THhJTlM3ZlZqME1yOFNTQ1dKZ1lMWjBNNEZEV0lZc0haYmRDMDJk?=
 =?utf-8?B?MXk0SzZNNEd4OHNaSGF0TlErc0Y0bVloNEQwOFBKb2RIcW4wWEV1TDN0eTlY?=
 =?utf-8?Q?W+bNGCaByQEwTyTi8kUn77AG6OKUFuLEg+O/wHmVo19k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkxQYmhJVmhCM0o2Zzc5VnJ4SnRsck5qcTFnZ2Q5Qnp0NVJHdWJQRkFRSFF5?=
 =?utf-8?B?N2dNRDVnelVneXZhN256K3NzMVRTdWZLUGlkaFI2d3VoK3FJUGpmWnNSb0VI?=
 =?utf-8?B?RmtKdXhMYU9wVlJ3N1NNZkxyaGtSNE80WEMycDJsZ2xIc3RZSXJBU0l6STh4?=
 =?utf-8?B?bEFvZTJrdUVqV2Z0RnBEOVU2eU5RbTFYNUVwaTNnSWtqV2dHRUljb3pWOTNj?=
 =?utf-8?B?VmV3QXN0UUllTGk3emJvT0dYR2hhdmZJK1dHei9GNnY2MzBiR3dUc1ZxZXR4?=
 =?utf-8?B?NmcrazErYjMyZTVIektuYkp6Y09QVTRYUVJBTmNVNzFCTnJIdjB3MzJRUXlF?=
 =?utf-8?B?aTViekN3SnBQQ1FTeGRkTWdTUVozTElUdzQxV2hiMjl2NVNmc3k3cmFCcnlV?=
 =?utf-8?B?b1JQK2g3V1ZIcUFBeWlpT3V6UzRiSjNmQkFwR2lZOUxDTTZQVUNiUVRka3BW?=
 =?utf-8?B?bTgraEpBU0VzNWVFYlVJU21hbFB3ak9keVcwOGozY2FON0dSVjBuTUdQaHQv?=
 =?utf-8?B?RUs3VUp6QzMvNFBIRFVsWlA5b2IwSC82R2lBZzFSeGd5VzlKRXlwTWFaNkFN?=
 =?utf-8?B?cTNEZjBpemRHNVplQ2Z0QTc3SWNEbU5GV1QyLzdscXNhQStQLzhCaWkwZzgv?=
 =?utf-8?B?K1RDUG9HL1BadVNxZjBWeTlpS0xSZjBRQmMxYVZVUXloRXN4aS9tazlVYkE3?=
 =?utf-8?B?WHRUT0UwcHp6aXVUQktYNi9mV2F5ZlBEWGpVQ0huejZFelhuQ3lMSFZpSDh4?=
 =?utf-8?B?c1BjdkpBeGVFNUphV1RxU0dEcHlDZXV0T01XeXBuaWtGdE9OVzc3b200YlB1?=
 =?utf-8?B?SlJJMlNmRW8wTmVTRThqZ0MvZFJLMmtFeVdFUk1XZVNlM2RueDNxa2UwWi9K?=
 =?utf-8?B?ZEdNakVhZ2pBUVpDbGNZaDhpUTR1ajk5M2pYbFJqcDQ5SzU0b2tXOFRuRTk2?=
 =?utf-8?B?VSs2bmRHU3I1THVPZVd6UHNhRGIzK3hRS0xJejF1NEd4cmMwUDdQbnNKaU05?=
 =?utf-8?B?a05ISkZoRWttTnBvTVVVUllLWFNqM2JXRGY4NjNhTkFMQzVJL2xMR3dyTXZN?=
 =?utf-8?B?TGxOanZxaHdkeUd0UmQrQUFJNnd5d0dabEFUSkQwUTZHaGs4ZlNGUFIranBU?=
 =?utf-8?B?dzIrZG1PUDkwdUdNM05mdkd6cTlwQTQ2cHM1Q2hJWTJaYVJCNzVQSUZJeGZ5?=
 =?utf-8?B?YktuZkZ2TW4xTzRvTDM0UmdQaDFxR01XemVaOXM1dDIzRE02SUxNY1JzZTh4?=
 =?utf-8?B?S3ZWbEc4b2ZWYWEwK3k0L1R3V0tlME5qTFlmdFdZQ2xLaHZlNklEei9PTVBP?=
 =?utf-8?B?VTBzOTM4Q0E4Q2xuMmsxVGFlNWp3dEdiS2ZmTVZIRy9SOUdGNkdwQU5CUzBi?=
 =?utf-8?B?cVdoTzl0SUl1N0t4TjBRVXRpOWRZMUVwWStHMkRnOTBQdjBrOUh2K0JtRElQ?=
 =?utf-8?B?QURtcXU5a3pib2xxcFVrdlIwYmh3TWp0aTQzYWhiWERKcHJxd3lmUmtDbUps?=
 =?utf-8?B?aTJwVEJVV3QxK2I5ZWsrR1E0U1pwa2RlQmt1b2tzcVFmY2NuWmVoT1BKbEhw?=
 =?utf-8?B?Nkd4NVZHM0lEdk0vSTlmdWRrYy95MHlBMytMT3lMWDVsSEdvd3ZHcU1ZNThq?=
 =?utf-8?B?TEh0Z3lsckpudHMrNU0wVlFIeDkwQkdrZjZvUldaN3pVTVh5YU42KzlEQlRV?=
 =?utf-8?B?T1M1Rm5sQ0ZwN0RiM2t3b2pRajh5TFdZY3lwTEZkbG5DdTRjL0NKSlJ6MGZ6?=
 =?utf-8?B?WUtGQTJHMm85QWFpcG1nRGpPcTN3YzJEMlo4YmgwZlBXR21zYlhiM1R4NHNa?=
 =?utf-8?B?VlRweUYxcm1pek5jOUVtdGk4TThSVEtyRkhtcFBRVUR0dXpoQktJaXdCaUFU?=
 =?utf-8?B?NUc4MFc5ZVNwK0dMN3RhMkd0WWZBVkl5ejdCaHNMMUY3VVhlRHJ6aWNUTFBP?=
 =?utf-8?B?NHNkN0ZrVi9FaDJQOUZEb1BzMGhOQTZIWlkzL2pYRjZvUTkxNlp0amRzUjFr?=
 =?utf-8?B?aFA2SWY5SCttb0NuNHlZZkRkYXpuVVdhU2tENkFkSW1admxHc1Njc08zcnd3?=
 =?utf-8?B?VE9BNWVPOWZTR21ITjl4bGEyZElpb2dDNEJXYkVtOTVuVkVvT29UdGF3NTBK?=
 =?utf-8?Q?8DQaO9OXbq0JsEAxSetTh0UHp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a48caf80-c27c-4153-85b2-08dce85501a9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 11:24:57.9939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L3RQUc6Ov/Ao68WQ8gnz43nAGYU7W2qHjbwh+Pua3UA+YesaWBw3gv64HCe+UMnw2naRFFMd6WPExI2ZtgDibQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7823

Hi Bertrand/Stefano/all,

Let me know if the explanation makes sense.

On 09/10/2024 07:30, Bertrand Marquis wrote:
> Hi Stefano,
>
>> On 9 Oct 2024, at 00:46, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>
>> On Tue, 8 Oct 2024, Oleksandr Tyshchenko wrote:
>>>>> On 7 Oct 2024, at 20:55, Oleksandr Tyshchenko <olekstysh@gmail.com> wrote:
>>>>>
>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>
>>>>> Add common requirements for a physical device assignment to Arm64
>>>>> and AMD64 PVH domains.
>>>>>
>>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>> ---
>>>>> Based on:
>>>>> [PATCH] docs: fusa: Replace VM with domain
>>>>> https://patchew.org/Xen/20241007182603.826807-1-ayan.kumar.halder@amd.com/
>>>>> ---
>>>>> ---
>>>>> .../reqs/design-reqs/common/passthrough.rst   | 365 ++++++++++++++++++
>>>>> docs/fusa/reqs/index.rst                      |   1 +
>>>>> docs/fusa/reqs/market-reqs/reqs.rst           |  33 ++
>>>>> docs/fusa/reqs/product-reqs/common/reqs.rst   |  29 ++
>>>>> 4 files changed, 428 insertions(+)
>>>>> create mode 100644 docs/fusa/reqs/design-reqs/common/passthrough.rst
>>>>> create mode 100644 docs/fusa/reqs/product-reqs/common/reqs.rst
>>>>>
>>>>> diff --git a/docs/fusa/reqs/design-reqs/common/passthrough.rst
>>>>> b/docs/fusa/reqs/design-reqs/common/passthrough.rst
>>>>> new file mode 100644
>>>>> index 0000000000..a1d6676f65
>>>>> --- /dev/null
>>>>> +++ b/docs/fusa/reqs/design-reqs/common/passthrough.rst
>>>>> @@ -0,0 +1,365 @@
>>>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>>>> +
>>>>> +Device Passthrough
>>>>> +==================
>>>>> +
>>>>> +The following are the requirements related to a physical device
>>>>> assignment
>>>>> +[1], [2] to Arm64 and AMD64 PVH domains.
>>>>> +
>>>>> +Requirements for both Arm64 and AMD64 PVH
>>>>> +=========================================
>>>>> +
>>>>> +Hide IOMMU from a domain
>>>>> +------------------------
>>>>> +
>>>>> +`XenSwdgn~passthrough_hide_iommu_from_domain~1`
>>>>> +
>>>>> +Description:
>>>>> +Xen shall not expose the IOMMU device to the domain even if I/O
>>>>> virtualization
>>>>> +is disabled. The IOMMU shall be under hypervisor control only.
>>>>> +
>>>>> +Rationale:
>>>> I think there should be a rationale here to explain why we do not want the
>>>> IOMMU
>>>> in particular to be assigned to a domain.
>>>
>>> ok, will add. I propose the following text:
>>>
>>> Xen having the whole picture of the host resources and device assignment
>>> unlike the individual domain makes use of the IOMMU to:
>>> - perform DMA Remapping on Arm64 and AMD64 platforms, which is also known as
>>> stage-2 (or 2nd stage) address translations for DMA devices passed through to
>>> domains and Interrupt Remapping on AMD64 platforms.
>>> - provide access protection functionalities to prevent malicious or buggy DMA
>>> devices from accessing arbitrary memory ranges (e.g. memory allocated to other
>>> domains) or from generating interrupts that could affect other domains.
>>>
>>>
>>>> Added to that, I am not completely sure that there is a clear way to test
>>>> this one
>>>> as for example one could assign registers not known by Xen.
>>> I am afraid you are right, valid point. For example, on Arm64, if there is no
>>> corresponding driver in use, we will end up exposing IOMMU dt node to Dom0.
>>>
>>>
>>>> Shouldn't this requirement in fact be an assumption of use ?
>>> Assumption of use on Xen? From my PoV sounds reasonable, will do.
>> In my view, this does not qualify as an Assumption of Use, as it does
>> not align with the definition we have used so far. If we were to
>> categorize this as an Assumption of Use, we would need to change the
>> definition.
>>
>> We have defined an Assumption of Use as something Xen expects from the
>> rest of the system for it to function correctly, such as being loaded at
>> EL2. On the other hand, 'Requirements' refer to behaviors we expect Xen
>> to exhibit.
>>
>> Our goal is for Xen to configure the IOMMU at boot using the stage 2
>> translation, and to ensure that Xen prevents domains from altering the
>> IOMMU configuration. These are specific expectations of Xen's behavior,
>> so I believe they fall under Requirements and should be validated in
>> some way.
>>
>> However, we could adjust the wording. For example, we might replace the
>> negative phrasing with a positive requirement, such as: 'Xen shall
>> configure the IOMMU at boot according to the stage 2 translation
>> tables.' There is no need to explicitly state that the IOMMU is not
>> exposed to guests, as nothing is exposed unless explicitly allowed or
>> mentioned. We could, however, include a brief note about it for clarity.
> I agree that this is the right way to turn the requirement into something
> that Xen shall do.
>
> Now i think we will need to have a discussion to clear up what to do with:
> - assumption of use

Assumption of use is something that other software/hardware components 
need to do to ensure the correct behavior of Xen.

For eg 1) AoU on hardware :- The hardware needs to support NS-EL2. The 
hardware needs to have GICv3, SMMUv3 as these are in the scope of safety 
certification. The hardware needs to have Cortex-A53  r0p4 as these have 
some errata fixes which affect Xen.

2) AoU on bootloader/firmware - 1) Bootloader/Firmware needs to load Xen 
in NS-EL2 mode. 2) Bootloader/Firmware needs to initialize DDR

3) AoU on compiler - 1) The GCC version used should be 5.1 or later.

4) AoU on domain - 1) Domains should not use HVC DCC registers as Xen 
does not emulate them.

The AoUs can either be tested or need to be stated explicitly in the 
safety manual.

> - "integrator" (word always problematic in Fusa as usually use to bail out
> and give responsibility to someone else) shall and shall not do (for example
> giving access to IOMMU registers to a domain)

The responsibility with the integrator lies for things which cannot be 
tested. For eg Xen has to be built with a particular configuration (eg 
SMMUv3) or a specific CPU errata. Integrator should provide at the most 
X amount of memory for each domain. SMMU (or any specific device) should 
not be assigned to a domain (which should be under Xen's control).

For some of the AoUs which cannot be tested (eg Bootloader/Firmare needs 
to initialize the DDR, CNTFRQ_EL0 needs to contain the correct system 
counter frequency), the responsibility will lie with the integrator.

> - interface and what we expect a domain will do with it

This should be covered as part of AoU on domain. We can have more 
examples of this in near future.

Kind regards,

Ayan


