Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 125B1A384A6
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 14:29:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890452.1299568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk1B5-0007Tp-UX; Mon, 17 Feb 2025 13:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890452.1299568; Mon, 17 Feb 2025 13:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk1B5-0007Rq-Qu; Mon, 17 Feb 2025 13:28:51 +0000
Received: by outflank-mailman (input) for mailman id 890452;
 Mon, 17 Feb 2025 13:28:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MRFu=VI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tk1B4-0007Rk-NN
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 13:28:50 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2418::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ddbba6e-ed33-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 14:28:48 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SA1PR12MB5657.namprd12.prod.outlook.com (2603:10b6:806:234::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 13:28:44 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 13:28:43 +0000
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
X-Inumbo-ID: 1ddbba6e-ed33-11ef-9896-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b9M7pz4M3PvFXmYQ3/2A4lehn7aCS/j2/5rW07g8nLn/bfAgZig14hYW+WX8Y6U5h+fsALyMJoG+a7qKdpGIL2Fp5g6gN7XRUX7Qmr/UNjphQQmO+cPyzSARXiCfc3i2fUYS7R2+TnwyHo/2Ae+/QCkiYBoN2gZR/5PbLwPfEN+FnoOXhmM2Hj74XJO1pSf3gNLsCGvsZJ6hoVUCllIy86R5GGD6c+OToPwcZzzZvNSp8M7rS6cEPCby3RMgu9BETgwvJE9+b/BsKyBGVlSeFtw1eiU/SOAQeoq0vEJQ7Zq+W3W3UM0YroNKfpUPJw5NrycyiY6y2ccdjyGe+u1uPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEGgiy/BRCNYcM17asywhhfA0ucP+WgEAgLSpVdCI9k=;
 b=Lt7AGfsZeRmsmU7KoA5UGKugWltL1jKxwkTqBb+atcS85w9ra7YP2Vn9c7idA1a/W+vfIlyReL2wkZd4RqkO+JXUIIqEGX7iMZB/U4wKqVsVR+iylDLYa2iWSdKtQshOi4H8bxpm64RAcR07ejNgNXubW0qh1SahI1cU6cCzi3xcf908tY83mnFIaPSNJI+wX1JS2htfeBHsWnaMTLbpAqv1I83/I+bmX5BOvJrYWUaulzBVgr1qlVuaCX0Kib8iyVoc1ntAieSC4C8GOOf96HK2Rw87VuF2vY8+ykdqhm/brjycqd9BgIbUJAyNNHLa8jbfoahRpW6hnbHtxQFlFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEGgiy/BRCNYcM17asywhhfA0ucP+WgEAgLSpVdCI9k=;
 b=AHmAx/E0iFjIxon/INSYvi59g2ZJyVw+UmcmEzlLpBQVqJYVj9AnB/gI75qAEW9GFJaJAoj0yS/xxS958e73Jb84qZTarvy+rL7qlhNpCBWVB8JstQ0AU92UVLzq+vxIejp0CYNoh24uIOrfWMxntbQXWT2cfUWZcSXvSk3yQhg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <b70bcaca-ff7a-4635-bd5c-7c64768286d5@amd.com>
Date: Mon, 17 Feb 2025 14:28:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/dom0less: support for vcpu affinity
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, bertrand.marquis@arm.com,
 Volodymyr_Babchuk@epam.com, dpsmith@apertussolutions.com,
 xenia.ragiadakou@amd.com
References: <alpine.DEB.2.22.394.2502141615050.3858257@ubuntu-linux-20-04-desktop>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <alpine.DEB.2.22.394.2502141615050.3858257@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::16) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SA1PR12MB5657:EE_
X-MS-Office365-Filtering-Correlation-Id: bce8608c-0a85-40bf-ed15-08dd4f56ffc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WmJ2bVM1aGV5a1l5MzVSbVlSaWk3a2NuTk5RRnZEeUEvT1RYMEhVSTN3NDVz?=
 =?utf-8?B?WjdRL2ZxazBCeGw4cWxXa0NUQjZnQ3Z4bjRWQ2hsa3lpK1huSXJpNStGMFdN?=
 =?utf-8?B?bGc3a3Q3L3p0YmNjUkZHYXpodXQvZmh6cm16UnhZM01UUWF4UlhJQkhQRHVN?=
 =?utf-8?B?MmdvOUhXeGhWYUk4Yk1DK1dHdVEvcndSVG50bUxKWCtkR1VyZ2t5Y1pmb3l3?=
 =?utf-8?B?T1lnYUdZVmh0dk95dmNDUHE1enBtUldtVFR1OUFSK3c3Qm5vTFBTaXlaVGRX?=
 =?utf-8?B?SFhBdFl3bkEyYXU3OXo4byt3cXIxMVhIUlpycmVGeGhqYkxCb0NxNEIxb1My?=
 =?utf-8?B?U3B5NHhaNmJsSWhMZ1NzNXhQTlNaWjdFK1B3dW80UG5OUlhDb3Q1dngyNW9z?=
 =?utf-8?B?Vi9OZFpKNnJGeDBNMFBqTXQvS2N4enhjYndSM00rNTIrLzJ4YmNpT3pEQjM3?=
 =?utf-8?B?b1lGZlFzVWNsdlZ6bTNmZ0xvZE9oUlVBcWtmTkdKOUQ3aDByUUhUZjFIZVFD?=
 =?utf-8?B?aWlPZjMvRG1HYzJDRWsyMndPMnI2VGptZ0FWVXpUeFBKY3E5c0tpVmd3N0JQ?=
 =?utf-8?B?TWdaU3RmdW5tdTg0bEpsOUM4dTUzWmkrb1pRZDBnRndocWpyWVVhQzFwSC8v?=
 =?utf-8?B?S2dGYVU4RjVZempsWHpjTzFackxBVlh5eC8wRGhxS2tYRGRVVUJuTVRUSGxB?=
 =?utf-8?B?Wm1nNURORzNZUFlHVVpZdFQzejRZVXV1aUNJQjQyMnp0SlZadlloMzRnQkhx?=
 =?utf-8?B?MlJSTGVTTE85OXYzeGNDWGx0K1hyd0d0b2ZtaXF5Lyt3blZ2MTJ0Q3hXYlhU?=
 =?utf-8?B?TWk3SkR5QkNvMHdVMjBpTVZjUUtLaUlGWlo3Kzgwc1RiYmpyTHZtOStDRjVr?=
 =?utf-8?B?YjVhVEk3TEVlOHdFMFhQc1ZQYlNUSmQrUXdyK05rM1JObWdlYm1lN0N4WUJw?=
 =?utf-8?B?aXpqZDlqZnBNd3RKL3lSbzh4MStoRlZlUmJTek5XZkZMYjBDb1QvS3hLVEVj?=
 =?utf-8?B?TjRxcTZjVmZQNk84ZVFKMFdUcjVzNHVmS3Rvc2E0RU9NNG42am9RRVdyWHht?=
 =?utf-8?B?MGFBcmYyVUt3cWhaTHFEb3FKN0RyNXJhaDdMMG42NFlkbU9qQ0lYUjVjY2VT?=
 =?utf-8?B?VEVobDQzRksvWjB5K0RZc1MwR1hUQ3gwa25KbmE5d2VGeVRyTlZFL3dvakFE?=
 =?utf-8?B?UVdqeUNkN25hUU9HcHlINGZFQ2F3aklzZjFGNC9QdXh1eG5FRFVOR29vTmhU?=
 =?utf-8?B?YitWeUw1Rk8vVHBpZDU2aTdlOVpmMk5jUU44WTZyTTVaZzZvaHBKVHhwZy85?=
 =?utf-8?B?MHNKd0x0RTZwOEVkS29PdHFtZ3dHN1RFM1gwcVNxRDJscmRQeWZzZjVtVnQ1?=
 =?utf-8?B?aWRDVWdSYWRMYWZHenIzY1JRTkJwMHV6MnAvOEVYdERacXhhT1EzY3Zpcmsx?=
 =?utf-8?B?bkF0RmsydzRwWkNtMEpYOXZRODUwWksveitIWlU3R3U2b0I4akZzcnY3VUdj?=
 =?utf-8?B?bjZEM2Z2Y09uWVQ1amx3eDdGK2djRUNQUnVVdFBGKzlwa2g2d2ZIbWhVR1lO?=
 =?utf-8?B?Mmg2QzBva2d5dzBFZkVmM2U4ZG05UTh3cWc0R29RMGZZM3hxUkkzT1lsanR3?=
 =?utf-8?B?T3FLUHBBdmEvOWdkeldoeFQrbjRsZXJzSFJ0eFcwNjBwNUI4K0g3bEFUc2Nj?=
 =?utf-8?B?K2h0ODhhUzhjMjA0SUVnYzNvTFlLQkNOZ1FNQjcrSU91ODNhL1pDWEZoNUs4?=
 =?utf-8?B?T2kxK01LVEZ1L2JUbG9ZTjBqRGhkd25qdkxRSHZoMVQyQWVUWmUxa1Rnanp1?=
 =?utf-8?B?S08zVUlUY0s3WGU2cWdBNUxiNDlJamh6MzB6dlV0WmFRdklwZUVMdmxxQm5W?=
 =?utf-8?Q?EHqUeT1XqA8eQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUV0UFFpazQxaTZzNW9Ra2k2eGl2YkNQM2ZzUjNjRGFoN2ErVzVBOWQ3QzI3?=
 =?utf-8?B?bXlQaUpmSTJ1cVJZTVBpYjBjbTE2MmJENnFXa0c2cmU0dUl2MmtwWUtOYXE3?=
 =?utf-8?B?bnFNNS92Q1RPRWhUdjV0Z1JZdTk0ZkhTcFpRRDc4SzVLK2hLNXBEZTdtRUsv?=
 =?utf-8?B?QW9KMjU0dHBVaXdrY1hndldJTGtETXluY1YybXJ5UVFRRCsvZDNKU1pWV3Qx?=
 =?utf-8?B?d2JuMWVNRE4xKzhyUFdkR3dtZFhPUGcwS09sVC9Yb1VyQkR1bDRINFFtakp4?=
 =?utf-8?B?MEJ6TTREWVhpSitBNExpdWhDWUNJTllnMXJNSzVmRnZTc3lpYmV6RWY0bDBv?=
 =?utf-8?B?MGI1WUEwOHFCL3J3cys0S1FwejRabmRudFYrYlFNVnFRSUNkY25vRW5CZE96?=
 =?utf-8?B?dmhjaHIxNnpyNzBYZzN2SGdJY281MkIzZmdmQ0lLdVVkR2lDWnlzUk1KaUhJ?=
 =?utf-8?B?VmRJT3ZoSUtnNmYyOWs5aG5KdDFGenRqdjRKdXdlSW1yWWhZQ1V6U0JLODFn?=
 =?utf-8?B?VzV1eERyWHIxa2l6ZFlOYSs5SEExQnlOKzJ4M2F4MXh0UDFNcGNYam8wR2Ex?=
 =?utf-8?B?ZGs4cnF5UUpFZlc4QmNJMDdOY0MyNS9qNm9FazdOc21YcnEvQk1rcjVjdndT?=
 =?utf-8?B?N0JtMjAxVWtHS3hDbUw3bnp6a05DNm9pQk9WQ3pFNWdGemlzYS9KSVBVdU55?=
 =?utf-8?B?OFpsZ2xMMWFvTWk4VUZXY1pLSHlRZkZIS1RqL0xYdndJeVVLcVFYWjZ6VnhF?=
 =?utf-8?B?TWV5YlBsNXkxZ0FoVHNNKzNNL1h5Tk51NjVQcDlFZ0JJTWpORWNrRUJJdUNJ?=
 =?utf-8?B?WEhXYVBKb1JYckNVb1NrNkYyY1QxaUFxa1ZPSTZJTHlQL1poMWtBd0Y5MW9m?=
 =?utf-8?B?bTJWSXVwU0pORktSbks5T0lETGIvNDgrUHJGWU9JTWxQWnY5Y0pDTm1BNDZC?=
 =?utf-8?B?V0Y0SzVVaVNheUVZbTdWdHZaa2FEZERSNkN2UmwxRmpEcnh0aHdwajdVV3lT?=
 =?utf-8?B?Wi9YVUw5c2FQRzZpUnBnd3k5L1RxRG5NYjBaY05xdDJUU0xGRG9VY0x2WWdq?=
 =?utf-8?B?b2dOc3VpSjNHdWFKaFEzTzFQb0toeWJHWUxYbC8vb0dQbVR2am1MSUtyckZy?=
 =?utf-8?B?akNJTHM4WGhNR1Y4ZjdQeDRTOTl2aTJ2RUszOXZoR1BqaldtakF2c2Vac0tw?=
 =?utf-8?B?SWpzSVcxYTNXSEF4bUZSVlNEZEg3NGhVOG1ER1VrbjIzU3dEZjI1N3VtMXg3?=
 =?utf-8?B?R2J4U2kvM3ZtOUdlQlcwSDJmTHZ6dnRySThDaTFXdTVWZG1XUjNjQlh3TlY3?=
 =?utf-8?B?b0dvMEw3Rm12cWJnM2xKV1M4SERwa3Z2aVQrQzY3c3BjbmpZUzQyMTgrclNr?=
 =?utf-8?B?SEZNanJydnp6RnNBMnJjK1VUQVFWdTc1M1RMd3M5K1pyV1E4bzJvd282R2s4?=
 =?utf-8?B?ck5aTVhJcWp5VEdoQ3M2b0VQZlpSR21yWHVXcU5PQ0I4SCtkcDhqaWpGT1ht?=
 =?utf-8?B?emJrQU01K3ZjcnVndHdBQ1JwMHp0S05kK1ZvZDhFZTB6eVJ0T3R4M0N6V2tq?=
 =?utf-8?B?em0zczcrUDQrZ3FReUZicnBESFZKT3BlVTlzakpnNFFGNUtMZXhFSGwwbkJH?=
 =?utf-8?B?SnFSeDBTVHU5RWdEbUFKRWpQZm1NdzIvN2hNV1k0Q05IZ0Qra3dtZVNGam9o?=
 =?utf-8?B?Y2N5TS9jWERLOW1oS2svWXZNd0pyWkZ0d0dLYXpXTllZQTNyeUJOTlFxeSto?=
 =?utf-8?B?bU1OU01ySXZnL1ZaOGJYWE1sT2lsckZIWkFqU0JSdWNsdW1BYlpEdk1ySVJp?=
 =?utf-8?B?WGVjTklkdnZzMmdHWW4xUGdxNDNJU0l2WHVxM2YxVHhFMkZUSEhWWk1rNHQ5?=
 =?utf-8?B?clY4REdkcjRoT1g0WFRKdGkwSXIxdEJaSnVhUTEyUjBsYlVJSTJ6TzNlb0Ix?=
 =?utf-8?B?K2lYWUo4U3lJbnpCUEN3dzgrUEdISGtoRzJUZTQ5MlJCZzhEcHRWQmVqeUN2?=
 =?utf-8?B?MFhzYkNaZlg1TlVISS9ySENGVElJSVZjamRIdk5kdmtOVFpFT3F3THMvTlZK?=
 =?utf-8?B?OUcycFN3UktteWVvSHpVM1picDZ2UjJEVjZUNTdhNHpYdXdNTXcvZ1dPS2hi?=
 =?utf-8?Q?LzYvIRAqXkeXyWmHizlLv4U24?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bce8608c-0a85-40bf-ed15-08dd4f56ffc5
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 13:28:43.5388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F0MRGSfszDTDrSwFi8trlDHMHOHOKKO0xmFdysbf/7+VtXUIqjsQ4xge1zLwtV9o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5657



On 15/02/2025 01:17, Stefano Stabellini wrote:
> 
> 
> Add vcpu affinity to the dom0less bindings. Example:
> 
>                          dom1 {
>                                  ...
>                                  cpus = <4>;
>                                  vcpu0 {
>                                         compatible = "xen,vcpu-affinity";
>                                         id = <0>;
>                                         hard-affinity = "4-7";
>                                  };
>                                  vcpu1 {
>                                         compatible = "xen,vcpu-affinity";
>                                         id = <1>;
>                                         hard-affinity = "0-3";
>                                  };
>                                  vcpu2 {
>                                         compatible = "xen,vcpu-affinity";
>                                         id = <2>;
>                                         hard-affinity = "1,6";
>                                  };
>                                  ...
>                          }
What is this indentation for? It reads strangely.

> 
> Note that the property hard-affinity is optional. It is possible to add
If it's optional, then this node does not make sense anymore...

> other properties in the future not only to specify soft affinity, but
> also to provide more precise methods for configuring affinity. For
> instance, on ARM the MPIDR could be use to specify the pCPU. For now, it
> is left to the future.
> 
> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> Changes in v2:
> - code style
> - add binding description to docs/misc/arm/device-tree/booting.txt
> ---
> 
>  docs/misc/arm/device-tree/booting.txt | 21 +++++++++++
>  xen/arch/arm/dom0less-build.c         | 51 +++++++++++++++++++++++++++
>  2 files changed, 72 insertions(+)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 9c881baccc..6a2abbef4e 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -324,6 +324,27 @@ The ramdisk sub-node has the following properties:
>      property because it will be created by the UEFI stub on boot.
>      This option is needed only when UEFI boot is used.
> 
> +Under the "xen,domain" compatible node, it is possible optionally to add
> +one or more sub-nodes to configure vCPU affinity. The vCPU affinity
> +sub-node has the following properties:
> +
> +- compatible
> +
> +    "xen,vcpu-affinity"
> +
> +- id
> +
> +    A 32-bit integer that specifies the vCPU id. 0 is the first vCPU.
> +    The last vCPU is cpus-1, where "cpus" is the number of vCPUs
> +    specified with the "cpus" property under the "xen,domain" node.
> +
> +- hard-affinity
> +
> +    Optional. A string specifying the hard affinity configuration for the
> +    vCPU: a comma-separated list of pCPUs or ranges of pCPUs is used.
> +    Ranges are hyphen-separated intervals (such as `0-4`) and are inclusive
> +    on both sides.
I think users should know what this number refers to.

> +
> 
>  Example
>  =======
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 49d1f14d65..35d02689e7 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -818,6 +818,8 @@ void __init create_domUs(void)
>      const struct dt_device_node *cpupool_node,
>                                  *chosen = dt_find_node_by_path("/chosen");
>      const char *llc_colors_str = NULL;
> +    const char *hard_affinity_str = NULL;
> +    struct dt_device_node *np;
> 
>      BUG_ON(chosen == NULL);
>      dt_for_each_child_node(chosen, node)
> @@ -992,6 +994,55 @@ void __init create_domUs(void)
>          if ( rc )
>              panic("Could not set up domain %s (rc = %d)\n",
>                    dt_node_name(node), rc);
> +
> +        dt_for_each_child_node(node, np)
Can we please move this to a separate function? create_domUs starts to be
difficult to parse due to its length. It will also fix 80chars limit issues.

> +        {
> +            const char *s;
> +            struct vcpu *v;
> +            cpumask_t affinity;
> +
> +            if ( !dt_device_is_compatible(np, "xen,vcpu-affinity") )
> +                continue;
> +
> +            if ( !dt_property_read_u32(np, "id", &val) )
> +                continue;
empty line here please

> +            if ( val >= d->max_vcpus )
> +                panic("Invalid vcpu_id %u for domain %s\n", val, dt_node_name(node));
> +
> +            v = d->vcpu[val];
> +            rc = dt_property_read_string(np, "hard-affinity", &hard_affinity_str);
> +            if ( rc < 0 )
> +                continue;
> +
> +            s = hard_affinity_str;
> +            cpumask_clear(&affinity);
> +            while ( *s != '\0' )
> +            {
> +                unsigned int start, end;
> +
> +                start = simple_strtoul(s, &s, 0);
> +
> +                if ( *s == '-' )    /* Range */
> +                {
> +                    s++;
> +                    end = simple_strtoul(s, &s, 0);
> +                }
> +                else                /* Single value */
> +                    end = start;
> +
> +                for ( ; start <= end; start++ )
> +                    cpumask_set_cpu(start, &affinity);
What if the pCPU number is invalid? Then we rely on debug ASSERT. I think we
should panic here on invalid number.

> +
> +                if ( *s == ',' )
> +                    s++;
> +                else if ( *s != '\0' )
> +                    break;
> +            }
> +
> +            rc = vcpu_set_hard_affinity(v, &affinity);
> +            if ( rc )
> +                panic("vcpu%d: failed to set hard affinity\n", v->vcpu_id);
> +        }
>      }
>  }
> 
> --
> 2.25.1
> 

~Michal



