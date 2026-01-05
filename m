Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A49ECF4D6C
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 17:55:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195663.1513589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcnrM-0007sH-GO; Mon, 05 Jan 2026 16:55:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195663.1513589; Mon, 05 Jan 2026 16:55:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcnrM-0007pY-DU; Mon, 05 Jan 2026 16:55:12 +0000
Received: by outflank-mailman (input) for mailman id 1195663;
 Mon, 05 Jan 2026 16:55:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XtAc=7K=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vcnrK-0007pQ-QH
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 16:55:10 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a5c308d-ea57-11f0-b15e-2bf370ae4941;
 Mon, 05 Jan 2026 17:55:09 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS0PR03MB8341.namprd03.prod.outlook.com (2603:10b6:8:28f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 16:55:06 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 16:55:05 +0000
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
X-Inumbo-ID: 4a5c308d-ea57-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pDCIFjEzkxN+5E3WTM6RFbT0Z13xB2sYHdexMIYAKHtPKrSPpKPXaHkJapRKjsjLdlEiXM6bvdqBUtZ18qhNdMScfGqA2Vd2CHdavCvX2h28IoQeZ5oCKsFdIkd1d0zK0S5ho6uT8KddbKN6Drq6EsJ/nJPqjW44cwrUL/ylsnKaq5kZeDbO51Z7PJHhsm+6Aj9ASlXyeZ2zETjLwt8GtWZo7DJ+wz6ZoxzReUF5p2esQnqt2WIBAT/ZcozavVJ239QynVv7Wt8OzD67ru4B2JVIZTR7LP18LvyY330ZcdE4aI2JJiv5OIclkM6R5daF3tQkiLN239RgN0JIQLu7KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1U2VkXkLrnVS++cCGGmJu5RGKllksxQxfv4Jh4ZWvA=;
 b=ea0ZON/c/P3/d+5mYSFv5sauOPzA/2KFWRextaI5r2Wqvf8qXfvYnIrcYmpbk+GqPl3A/AuZe1MOH6JxrLhhLdUHaaLKbEOEW/2IK9jJA/Qy5QB/5ByhCGKs1f6iLWF3136lT+GVa6OccVewH1c16Llkln1jiULQ7TP9i8zDE6iZ6+LZxRYQEyzwavyDwne8k8HB8FuuyJ8QAdIPKMzkVLb0qL6HTgmxLntpIzyzfowTMzfq/YvM+ZYoYYFJxxKkrD3X0cJnTButdLxhgiSzE6eofKGmZODZJ3u3zeU/fx9gj8HCzq0+/BMo6MBYGYeLP2i0HHjwcF7NeFXWDSiycA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1U2VkXkLrnVS++cCGGmJu5RGKllksxQxfv4Jh4ZWvA=;
 b=aNaRJaQrqU6QP/tpfB44a4gA4XMvVDdg5vWKezHz60Kxztfp3BSlChERTRM3K4lxbZR5qLl1MQYFwbSOkSzrN2sSxaAA7IObM4Ibf19n9YGb8ykJCdi3IUJdKC9R4+NX0HZUKV+NCSmWQqTuJ3tIxxT+H/OvbZNKXrnVwPYB9cI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2a22afe1-7b85-4671-a534-00306b97ec21@citrix.com>
Date: Mon, 5 Jan 2026 16:55:02 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/4] x86/xstate: Rework XSAVE/XRSTOR given a newer
 toolchain baseline
To: Jan Beulich <jbeulich@suse.com>
References: <20251230135427.188440-1-andrew.cooper3@citrix.com>
 <20251230135427.188440-3-andrew.cooper3@citrix.com>
 <5b49e965-7e1a-4b04-baa9-c14e2de2e247@citrix.com>
 <7bd2372a-6687-47c5-94df-2366866f53ea@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <7bd2372a-6687-47c5-94df-2366866f53ea@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0091.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS0PR03MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eaf3194-b86f-4cc1-b902-08de4c7b2d33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?em9qdlBMOG5naGJIN3cyeDMrTUFNN3gwODZ2Z1VQS2xSUDNrZEtZQ1liQnND?=
 =?utf-8?B?WFBBRUtldE5GbE1KUFFtWlVTUW45VDlCSE1EN3d6NTZJRGlNa3pSY0g5cHd6?=
 =?utf-8?B?d0h1Y3B0MXRnYWRxTnBFaDRVc3gyUUcrWFdqVTNBNEYxSk5NUDgxaVFreHY3?=
 =?utf-8?B?amFSS2xCT3N1NkMveHNhR09NQXBvKzRITk1Qc2FHWWRqdXA4aXlHZzRadDgx?=
 =?utf-8?B?TU9WZWxtOUZPaFlzL0RYUGY4WEc1dE4xN1FTbytuQ0d1WG1mY3VNaWxXMDE4?=
 =?utf-8?B?Y1hTdkMralFyVmY3eWtxR2dVeHkrdzZ4SW42VkgwVE9aOGdWQVRXU1l1dVRv?=
 =?utf-8?B?RkxJWUpLYXI1TFlEVTJ5dzBXRGtrSk8rVEFLZnRlc3Q1b09MSjh3Vk8zcjFr?=
 =?utf-8?B?Ulk2QVk3eDFHOGRFV3hIdUpDd0FIRTE5RW51b29WcHczamc4NkVOWldhQzlq?=
 =?utf-8?B?SDRNbUNGVFdSaXVJTHczaUZxbXNjRC9PZmgvKzJ2UUlJQkR0bVJIcFN2Z0FB?=
 =?utf-8?B?NXdRYk5qMmpGQnpncHBiQ1lwUGtxVE8rZTVkU3BydzhvZXhhNnh3QnQ4WkQw?=
 =?utf-8?B?T1JCMzFrTXZEQ3MzSEVJQWlsNitDT3FidTZDK3F6TXkvWWljZ1VsOWYrdmpt?=
 =?utf-8?B?OTV6MGlUdVhOeVNiQXQzWHEvQk84MnU0eTg5TlFLUys0SlArdksrbnZ5aVAr?=
 =?utf-8?B?WU05ZmpxelYxNXJ6MHJPajdlVk11N1JqaDJaMlpSRTBCY1ZrRVVrNlEvUDE2?=
 =?utf-8?B?bjhhM3NVRHExTDk3a0tVRXVsUWpKbEZXaVVtTzZNTzZRRDZaMTZmQmlKRDdW?=
 =?utf-8?B?Q2hnQ0FUT2p0WlIvemVWdGtQa0NZR09FS1o1L0xnSzVGcXMzdjA2SlRKcno0?=
 =?utf-8?B?Njd2KzdtUURaYlVsY3Fnai9ZZ0dvNHJ6dm1lUFd0cTYxZjRvbUhWcHlBNXQv?=
 =?utf-8?B?VnJ2eHNzOWJ1MVc2ZmlMb3lyMGtTbWpWaWd4Ukk3L0s0emhMUmlxajYwdlhn?=
 =?utf-8?B?ajJpNHFPYUtxeGpxTzZoZzJtd1FUK2ZZeGVld3kzMnBrRmhEdzRueTRYdGcv?=
 =?utf-8?B?Q0ZMaklzUlZzcmU2WDR1Q0VyRTlJUFBBSU40M1NvTFZlS0t2R04wUjk3cldT?=
 =?utf-8?B?ZW11M2I5RGl6NEJ3cndjWXB0dDlNOEhlTmlWYmEzamU2Y3lFUjJ0ajRCeW90?=
 =?utf-8?B?NGVVMkVYZUFucllhMzB3L092b3VIaDJiWnJPc1g3eXJnRVcybUJHN2hZRUFz?=
 =?utf-8?B?aVdrYlZnM3Y0S3pWcU9pcDBQaTJJckVkdWUveTFsd1dzWmRybVYvemlrSFdT?=
 =?utf-8?B?OXB5WnZsMTEwaXo5ZXJjOFp5QmpSbTdHdXRKR0lNNWg2Syszc0xRVk1wclBB?=
 =?utf-8?B?R3lUbGVRZ3NhdjloaHNqVWRjNnNnMzIyb1lWVi8wdDNkK2RSNHpkQ2ZSN2hl?=
 =?utf-8?B?N21MaHFCRjZkYlAyOW1UL1ZtRkRvajRqRWVzV2tEQWFSbHgxRTlZcXdrZDls?=
 =?utf-8?B?UVU5TFh2MnpBdEpBZ0M4K3VoekszdXFHNUNTK2VNWnVaQXhNTVRrc2pWSXF0?=
 =?utf-8?B?ZnZ0NEpqUXJhRmNiTnNWejhPNnlKcFI0b0RabDErS2VDZ0FZVWdPdXNNaWxy?=
 =?utf-8?B?WEdYNEFDYmp1THo2d1AyVTllWnJ6NDFQSW0vT0dUZkladklJUks0Qk5NVmtW?=
 =?utf-8?B?MWdwK2pYT3M5d2p1cVVXb2ZLdzVCbVd0bzMxYnIwNTBKSFU4TUNIbldUSkFM?=
 =?utf-8?B?RVVaVjYzZFowdklGSHNxSFY5Zy9JT0ZJR25QTmt0MUV6RnhPL0dPLzM5ZzFj?=
 =?utf-8?B?VmQwaFM2QmQ4ZndEbVVsM2Z3bmlTUEdjR0lXUWhjaU5EMU95UWVURVhiUUVn?=
 =?utf-8?B?WDNnQzhZYlV6M09mcWE3bnBBbmFzZmR4SHZqR1lsRldVcmxtVWJka2FvYXhO?=
 =?utf-8?Q?2a5ThqhhEJZsQnpR51vxq7mSP5AkcuxE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MW5RaDkvaTBWSmlKemVpcnh2TU9ndUgrWEswMUdwVVgwc1Bybk9FY3VPb2VW?=
 =?utf-8?B?VEc2TDd0UURTcG1UUk5UNVNsRHJraDV4b0RwTkwzcTZmM1NjSDk3SllHSDdk?=
 =?utf-8?B?b2xCMXR2K1RIMTI5K0xnTW9yNDh6YWo1VzduUVBmQTlUeHdZdi9qUDhFNG9X?=
 =?utf-8?B?VExvSk9SWXN2TjhaaGNRd1NNM2U1V0lDenl4ZTBqTGtuNWFCQmd0VXdEdmhs?=
 =?utf-8?B?ZHFxUXhtTDBBdXVzTmsrbWc3VkdINVM5MlZxNlBJQVc1V3JjbDNoYUtaeW9T?=
 =?utf-8?B?TTJXalNBazB0NzRwZExoZ2VWdi8zR2lOWmpNSGR1QUYxNk9YRWN3dklTZk1M?=
 =?utf-8?B?M1drZ2d1NGZMNWhpdjhmZmxIU1Z1MU4wSEhBSEp1RkE3N2hURWhwUmI0aXFP?=
 =?utf-8?B?YVhoU01WRjlWblI1TzZxcUxLUm91UXQ4azFiTTM0N0FJOEVxcFRUekZPenBQ?=
 =?utf-8?B?UWU4TjhoazQvRXY3VVlLcjc2UE9QdVJRZFZnYzdtelZveEp1VFo2QXVtUkhO?=
 =?utf-8?B?VGZKamsrN00rVEkrcTJJc1pDRmYvY1U3SERkdlZ5UVR5TTQ4ZlRQSThlMGRI?=
 =?utf-8?B?VXFtZ3l5dHpuS0xEN00zaFI2L2lMQ1p1ZEpLSU4zcDlBWXdmWThJQ0ozR0s1?=
 =?utf-8?B?V1kydzJzK0VXSVpydGQ4M2Y0VGhNRmx3TmVQeG15YzBoUFAzcUxxMDZIUHV0?=
 =?utf-8?B?L3ZpZGpjNXB3YmgzL2xBd0dIakk3THJSYVgvRmdpazFWYlpub3FJWXJqNC93?=
 =?utf-8?B?WmN5OHErOEw3VE42Q3FWTzU5K3R5VXNPcDRtWkV2c3hMUzJoZ2R1dElWZTNU?=
 =?utf-8?B?WjM3L0t2MlhMY24rbHVhbmkzQVIwZXBZKy9zWWtCZDYzRkNqNm5La3pIRnpu?=
 =?utf-8?B?QmFmRmlSRVFLTUp2akVncURGaWk4T2gybDViTjUwd2h0K0RMdkpMalRhZXFw?=
 =?utf-8?B?aGhQdkptcVorS0hSWnpuYUFOV2pIMElDT1N3eHlIcVllVmo5MGR3Q01jd2Qx?=
 =?utf-8?B?bWZMZVk5YjVsWk0wUEtDOXg1NjRidWhqMVl6SThaMlMvUHdhM2MzdTVhNDJu?=
 =?utf-8?B?clhCbFN3eGRLalpMY3hjYm5vQmM0TUpZM0VsdXVGUDArTlVtbEVkeTdqVmI5?=
 =?utf-8?B?blc0TGo1WVNIaTZ2NUdzSHdCR3FtQk5mNG9mdXhCNEY3QmRXR2JTWVI3Vzk2?=
 =?utf-8?B?aVVOYkhtZUprZEVOMW9JMm1hdzFSV0V2L1U3ZWVKaDUvZExPRzRRN3I0dzdu?=
 =?utf-8?B?aU1ORUFkMlF4Y24zcmdxL29QQlRsVC8xRFlaTFdWMnpDczk0OTlCOXZvYjFl?=
 =?utf-8?B?M1R2V0JCcUlNak9MUEpNR2k5cjlFNVl5ZHBOVjBhdTFyWUxtaVdCaFI5MVdo?=
 =?utf-8?B?dytUWko3WmJBT0MvNDIrYzhLeW5LazlNZFF4VTVkUEpEWmlsS21odjVlV09w?=
 =?utf-8?B?RlR4UUFzb3RZS0UvKzVPMEtmaWxpaUEvMHlLeEI0UUoxV1RYL21PR3FneGJW?=
 =?utf-8?B?T2NqcGxQdmlVTnpLUnBvMnB3c2hPbml6LzQrV3ZlRHpISk5CZDc3bThSTzQ5?=
 =?utf-8?B?alUwRGFZVnpkNmY2OHB6ZEhGNVg2d2xSd2ZZVjVzb0wrUytuREZvVnlZTTRP?=
 =?utf-8?B?ekVXVlZZWWdSbnNENkwzL244RVlZazUyd2ZsTWtqSDRnWklaaUFQbFl2SU1V?=
 =?utf-8?B?UUZDN3lsTzFHelo0Ylh3d1RpSjcvQWVlSzhISS9qU0MvUWUxZ0VEamNIb2RR?=
 =?utf-8?B?bVJnR29kTmxEME1iTmFPSlJkSnJ5YVhiNFgwRlJvYXN2TXAxcllFQnFaVTFx?=
 =?utf-8?B?eFJuTEljelNwUzRCZnQ2M3MzemRUSk1OSEViOFEvekovTXd0YUdpbklrdFNS?=
 =?utf-8?B?VnNQY0Y0b3ZkcHdlZU5qTW9uUXR4cTd2SUFuaDlFOVR4TGUvenpXbzFHOFVD?=
 =?utf-8?B?V1ZQSU1DS0ZDOWI0NkRqMkJPZ0FQeUEzaERGdGFjNlJWMkh2dElEVGlqSDAw?=
 =?utf-8?B?YklSWTh3ZWRyUDE4M1pyNWszbk9MZ1dDcEQwUnBsUHpEOHhENGVGM29XTjc1?=
 =?utf-8?B?SWFWVW1NUGYzRmVNUUNlV3V3dDRFcDY5aTF5d0RXQ1lYUWpGT2JRNVFnMCsy?=
 =?utf-8?B?UisvTm5pYzNWUVhKNVY4MGlOa3VVQkkwcHVpTHdqSS9TWm5KbUd6NmhDQ0RQ?=
 =?utf-8?B?UllWRVB6ck00WlhBZG1adXBBK1JnVmtPVzRsUW9VMjFINWpxYmF1ZkZsQUVC?=
 =?utf-8?B?TzVja0RLcHd6bkJvaEMxL2dNSXlUS2tYaEtkNkNwRXNWamJBZ083eUhyM2Z0?=
 =?utf-8?B?UnUvbmwwaEJRVWhyVVY2anBhaDdFWnpMeWFWN2dCdmZkaklhOEJQQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eaf3194-b86f-4cc1-b902-08de4c7b2d33
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 16:55:05.7744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JvxoPGGEoyl4XXgm3z+WNjyydgYkjWnG0W01cz0sD646K2u6oSuLBiRHr++funZCTJrIFDeZ1RXJNBbZT4YeHRNe8b0Tz6jmidBUGhtbJEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB8341

On 05/01/2026 3:16 pm, Jan Beulich wrote:
> On 02.01.2026 17:01, Andrew Cooper wrote:
>> On 30/12/2025 1:54 pm, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/xstate.c
>>> +++ b/xen/arch/x86/xstate.c
>>> @@ -310,21 +310,21 @@ void xsave(struct vcpu *v, uint64_t mask)
>>>      uint32_t hmask = mask >> 32;
>>>      uint32_t lmask = mask;
>>>      unsigned int fip_width = v->domain->arch.x87_fip_width;
>>> -#define XSAVE(pfx) \
>>> -        if ( v->arch.xcr0_accum & XSTATE_XSAVES_ONLY ) \
>>> -            asm volatile ( ".byte " pfx "0x0f,0xc7,0x2f\n" /* xsaves */ \
>>> -                           : "=m" (*ptr) \
>>> -                           : "a" (lmask), "d" (hmask), "D" (ptr) ); \
>>> -        else \
>>> -            alternative_io(".byte " pfx "0x0f,0xae,0x27\n", /* xsave */ \
>>> -                           ".byte " pfx "0x0f,0xae,0x37\n", /* xsaveopt */ \
>>> -                           X86_FEATURE_XSAVEOPT, \
>>> -                           "=m" (*ptr), \
>>> -                           "a" (lmask), "d" (hmask), "D" (ptr))
>>> +
>>> +#define XSAVE(pfx)                                                      \
>>> +    if ( v->arch.xcr0_accum & XSTATE_XSAVES_ONLY )                      \
>>> +        asm volatile ( "xsaves %0"                                      \
>>> +                       : "=m" (*ptr)                                    \
>>> +                       : "a" (lmask), "d" (hmask) );                    \
>>> +    else                                                                \
>>> +        alternative_io("xsave %0",                                      \
>>> +                       "xsaveopt %0", X86_FEATURE_XSAVEOPT,             \
>>> +                       "=m" (*ptr),                                     \
>>> +                       "a" (lmask), "d" (hmask))
>> This loses the pfx.  I've fixed up locally and double checked the
>> disassembly.
> Question being: Do we want to stick to using the prefix form, when gas
> specifically has been offering a kind-of-suffix form instead from the
> very beginning (xsaves and xsaves64)?
>
> If we wanted to stick to the prefixes, I'd favor a form where the use
> sites don't need to supply the separating blank (i.e. the macro itself
> would insert it, as doing do with an empty prefix results in merely
> an indentation "issue" in the generated assembly). Thoughts?

I don't expect this macro to survive the fixes to use the compressed
format.  From that point of view, "closest to the original" is least churn.

One problem with using a suffix form is that you could feed in "opt"
instead of "64" and break things in rather more subtle ways.

I'll adjust the position of the space, but I think this can keep on
using prefixes in the short term.

~Andrew

