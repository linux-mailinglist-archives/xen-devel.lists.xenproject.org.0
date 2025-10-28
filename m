Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D485C141F2
	for <lists+xen-devel@lfdr.de>; Tue, 28 Oct 2025 11:35:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152059.1482598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDh29-0007bl-Qx; Tue, 28 Oct 2025 10:34:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152059.1482598; Tue, 28 Oct 2025 10:34:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDh29-0007ZA-Nw; Tue, 28 Oct 2025 10:34:33 +0000
Received: by outflank-mailman (input) for mailman id 1152059;
 Tue, 28 Oct 2025 10:34:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pDzw=5F=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vDh27-0007Z4-IJ
 for xen-devel@lists.xenproject.org; Tue, 28 Oct 2025 10:34:31 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abef1ee4-b3e9-11f0-980a-7dc792cee155;
 Tue, 28 Oct 2025 11:34:25 +0100 (CET)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 DS7PR03MB5544.namprd03.prod.outlook.com (2603:10b6:5:2d3::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.12; Tue, 28 Oct 2025 10:34:20 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 10:34:20 +0000
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
X-Inumbo-ID: abef1ee4-b3e9-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VDwurNxWmTo+GS0xMEYX7E3hNlsJbL6CJKyRQXxzEYegttPX6SIL/+8dVRgDm4E4OWgyyjbXjFK3EmI6cvRlw3UJw/QoWRwnf2eBWRFXLRakPOjAp2TuVMmL92MxAPiwWbEF8yM4OeJW8bOTKSt7oV9pumqQB0+cl4GmZ/l8LIIB8MM2HP9DGnBgqp0Uz9l1kN9cZE1/gCS20gFEnMOu2Vgi+IlXQjgKTSqw3lCykJjhNIjt+FI25KufXH1l4CsJlB8W+T3/7bomL45+csD6DTBmYPuJza3P8ev1LwB+XHlMN0QtffOegr+/QT5CYrRespJ3oqcBJxt2OY2E+XZhSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Prx8kLN4zWglObsnj9lz6bK/pgryNEMwHIOFL99GAYU=;
 b=Hd/wyw6k+aW8VJlSWGq3AG0vL2zgVkItA7+Ff2vau2UjWit6N2dMG/8e1O6vxSI48ZjIE8ut4eYv7ziwOB84DmLNg8ycunaik86kn4KeBpbVxWEKrjieoOaB7Q6WuFC5U4PVUV63cygFTrsYGU/G/QiZz4I6pD/IaJoih2E1qrIoOeDh7BSXj/i8OtyEPiVzQacxYB+uRqXSJhC/CAl9ROSrcLCd/hcePJf6vu+tUylXSr9zQyG4Zu7avkm5y65AAtQnaXe9cE1SfDqU8u5bf0G+ldlrLoTV0temzdXcCk/ghDXWq2IvHUa/hS1+EAQQ64+ZGK2lvwCDrRZHaf0Miw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Prx8kLN4zWglObsnj9lz6bK/pgryNEMwHIOFL99GAYU=;
 b=TIBikjXtZqsPKOFchpfSY4NkpJQ9Z2NTTPgPiuzasfUHBnhUOeYKU50M2MTEmb2N6FQ54dmojuMSun/mJeTI0VEnNzG+8P1D/Gssl6YDanWyi7j7OQnygjOIYufAGGi+2koKBjB/a4SQxWW5HsazR+UshPhpgdIo9UDA3clesfQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b8bfc67d-705c-4abb-8759-e6397bcaa725@citrix.com>
Date: Tue, 28 Oct 2025 10:34:17 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] x86/ucode: Refine the boundary checks for
 Entrysign
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251027221702.3362552-1-andrew.cooper3@citrix.com>
 <20251027221702.3362552-5-andrew.cooper3@citrix.com>
 <1636aa0d-1ab6-4f6d-ba74-f41a9c561b55@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <1636aa0d-1ab6-4f6d-ba74-f41a9c561b55@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0452.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::32) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|DS7PR03MB5544:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eba10a2-73f0-447b-4cbb-08de160d8d73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OW5OcVBWMEFRcTlMKzR2c05oZ3pvaXdBMWlSVUdJR2ZrcFN4aVhJR3JmdjBT?=
 =?utf-8?B?R2pZbW0yTGNBWkdyZ1NUUFJ3RjIxYmlUQVhoSytNMlZ2RmJDZERIbzNOK0hC?=
 =?utf-8?B?emVRTUNvWk5SZWl2bHRMeVJIb0REdjRWM3hxWVNIc21DN2N2UWRQcmdsQlZa?=
 =?utf-8?B?dFhrNGtGZGpSWE5KZ1lQZEtGMzBKY3BoM3R2enlXTVNhaklNeVI5ay9HQnZH?=
 =?utf-8?B?TUpKNGdpTFRNVmJHdkJIK2hJUUhsdkJjbkZ4MHo1d0VucGhDOWRaODJ6Tmcv?=
 =?utf-8?B?czhVTDZUZW8wNFYwS0VCNVVxbi9MZWRIaUpxM0F4Q2lOZnpuNU5BaXVqZTV4?=
 =?utf-8?B?akpUYXkwUFI5Vms2QVd1dGRJdTFCd2ZRTUxQYUgzL3VYR2lzNnhLcnZ3L2Mr?=
 =?utf-8?B?VG4zOTdKUU1hWVhwQVdUd0Q2UkdGM251blVOV1FLeUdEY2lsemRSbXVIa2Zw?=
 =?utf-8?B?aW5ZQzRtb0dIRzU4c2t6ZjAyOWwwdlNUaFVsUjRRcGN2emNrUEZQTUF1K0cx?=
 =?utf-8?B?UTlLdEFQRy8ycm9hbWx2UmF1RWpqeFpZV28wcUdwenpLUjJRYVJuNzJsbURF?=
 =?utf-8?B?TGVFZkhYVTdKWU5DOU1ZS0IrMVdHY3VpY3B0N2dCRVdxdXpTdDZkV1oyd0dz?=
 =?utf-8?B?WEJoZE1YWjVsSk5TeGk0S0F1bnVrTWp1VXBUZi9tZGJOejRhWUhSWGFMYlhI?=
 =?utf-8?B?VU9BanM5TTU0R2phRFRUQU5pUnBDc1pkOUJ5U2lxWERoampGbW4yb004SC8x?=
 =?utf-8?B?OHNqaXNoM1BIWFQ2aGV6Y0tXbFBpajN0L2R3N0pRSHozT3dKQWxEUUNaWHVF?=
 =?utf-8?B?bHpScXkyMmxJWm1sQ3NnREZkS3lLeEJGYWFsejRrOXJBcmFCaE1xdU5UbStx?=
 =?utf-8?B?Z0I0enV2T2lOVnZHek1UZWRET01sVnFVbG05UG5rN0tkWWhXMEdwaEF6TlVH?=
 =?utf-8?B?SkV4NzFXMFNKbWtiOEN0QUEzZkc3dGpNRWllNXFkSVNkTXM1UWJwWlcvcXFq?=
 =?utf-8?B?d21abVF4S1BaVWVFWStFTFpwZzRjclcvL1NJejBSdGtyc2tGZEtPV1l1cFdo?=
 =?utf-8?B?bHcrajFacGs5NjJoQ0xSS2Jla095L2dKODlIMFVMOG81R3BXWGFFVTZUNUNC?=
 =?utf-8?B?TWdpUndrYlRxQnhTK29sVWwvY0o3K2dJclZrYjVxaHA0MWE0d3VMcXVnMHha?=
 =?utf-8?B?cVVLRng1WkpEOXVLamt4bHgraXpzdVpDU2tZb2xkWFgrSFFaR09TZHJSaUVG?=
 =?utf-8?B?YUExMGZrc1VhdGs3clF5T1VUQUk1S01rRHV3K25hSStDUU5BK1o1L281ZE5r?=
 =?utf-8?B?T21wSzhhenM1U3gwYTlhV2s2NjJpNlh0T1pVVURwNUliR2s4UzNhQXg1YUZU?=
 =?utf-8?B?NzFER0wvTzFIbk1HNGtGcTFyN3NNSEcxUVVSR0gxU0JYU0FOOTBERzBJTy9E?=
 =?utf-8?B?bVhycm9CS3VsYW5EREF1eFZWTVdLRnB3OVVtVWFJcmJ2WEVpaC9SNG8yRVR2?=
 =?utf-8?B?Vm5XRDRoUUZZUDlmS2h5K0NxUzRKeUJvRVhWUG9qQ3E4cDNrcGZKWXI0aGxq?=
 =?utf-8?B?VmdveUNHVFdjcFA0dUhiQnorTTgrSzcyVlRieGt6OXJwenduN1NYbk9jbkJq?=
 =?utf-8?B?bFZ3ZEtaZ2xjTEdtRThDWVJNRUtNMWJqUmxCMzZFb3dJcnFRZGY5Z2llVWpp?=
 =?utf-8?B?cjVrWXlNemZ5MEhFd3RKUkEvNFo3R3owUzkzL0kxeEk0SURDNkh1bWFZMEs5?=
 =?utf-8?B?b3VBZFZscUFFTE1HcUQ5V1MrU2IxaVY4SXI3d1RrZ3Q4TFdYUDFVdnVNZ2V4?=
 =?utf-8?B?ZEJaaHpleHA2d09QejdKZGtKUXBIRnMxUXQrd0wwbFBIbW9aSUxFdGM0M0pH?=
 =?utf-8?B?cUw5eGJYR0pXaUgyNFBnZW53STUxNzF5ZlRNWXJsREtWa1ZEbEhJR3BjaWdP?=
 =?utf-8?Q?ABZVOxKfY+4MGLElxV4LAywQg8djMx3j?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkFQVVpLaXJTZlVHWUVnVDlLYyt1UjM5ZS9UZnhaeEVEUHFqUFllOTBXclll?=
 =?utf-8?B?Q0JzcnhqYXhWMk5qTjdOWUZsS29tSTVHc2VhaU1uelpEaGE1OTB0c2t3RHJ1?=
 =?utf-8?B?Y2NkdjVCYjlOMVJHMlpGT2swcy9jZnNSN016bTFwTzh0cmttWEJhYjN6U2ho?=
 =?utf-8?B?YStuL0FyZmZWUTIxUHh5dnR1d1NqYlkra0Q4MDcwN0ZTU3lPelhQSjErZm5V?=
 =?utf-8?B?ZUR1NjExVnFkNS81aW5vbnRoSDBVTGlPb1FrV2ZlVXREQlM2OWJJdE5lUTZm?=
 =?utf-8?B?cFZ1b1lxK0wveG5zaGozZzdURjIvWXJFdzl4cisxd1gzMEhJTXBWWUhWYkVu?=
 =?utf-8?B?TUZFZndYUUhBTXp2a1VIVVhZNmh3TGtOQVBLSzZGTXNoT1FoMXRQQytmSkNx?=
 =?utf-8?B?STZtN1dWSE9tdHdqTE1EbVpWcUxlc0pHYVRQZ0Y1dmluL25mbU1UcmZUSnFw?=
 =?utf-8?B?OXJ4Nk1xSkp5dkZyNzFhQTRyNjhLQkNHM09ROGJ1U1B6TlVTQ0JUYU53anNG?=
 =?utf-8?B?bXJSOU9zUzhhWUluSUY3bkZhM0VPOHQwSk9CWU9TWjZ3TE8wY0RqbnRhTHBY?=
 =?utf-8?B?NXllYldzbFoweUJWbEV6MXdrSGdZOUFMaTUzcUNCdFdESEUrZ1JRWkxPVmZT?=
 =?utf-8?B?OXVGMUk1bzJ0bUtLRENrSDM3dDRRb3gxZVc0bE9uYURMRkZHcFBPcTVTbGpM?=
 =?utf-8?B?UWxGS0xGMVVSTHdqdHNMZzBHSTYxVjdzaFE1aW1WZVB3ZzVERzFTOFRvMi82?=
 =?utf-8?B?SkUwZkhkM0JYYk1tQVQwRFliV3dPOGszbVRYc1VwS0g3YytjZ1BES1lBdTRr?=
 =?utf-8?B?b0lpRU5Id3Z6aEVJbW5SYVNNbkwxdm1USUgwSTBSZnRxT2gzZzhZZndzQlVn?=
 =?utf-8?B?TGdDMlo1bDI1a1o5Q2E0dFJyWlU1L1RONkZvcVdIUDB1T3V1RS9GYjB0TElx?=
 =?utf-8?B?WDlEbUVaQS9hSjZzUGhSUnRoSXRINmJJN0RzSGorUEJteUNhdzRsbklTUzZR?=
 =?utf-8?B?bUdvWE9qSHN5RUI2N0FFUTUzRlJUU1g0VDhxdGxLTnNoWk1UaHN2eExleDRm?=
 =?utf-8?B?aU85RGcrVE5oNW1SMzNVWWVhNUZ3d3UrNnlIdEM5TGhhaGtzK2R2N3BrYmcy?=
 =?utf-8?B?QVRuQXl4NG8vVUlmZXM3Mk1HVkVLczRaclJkUEIxQWtZbHFWSnN4R2Nadm1L?=
 =?utf-8?B?UytHSFoyUHVlYXdieUR3bU9DYXduWlJ6QStyVkJoUDVRelhVcCs3d2lpb0lV?=
 =?utf-8?B?SURvUy9HdEJHWTFiOVlabWdMRUZkTVBVLzFUa1dwTjZaQUpNQ0ZuclYwVXVr?=
 =?utf-8?B?YzJzYy9nVFZPUVhkR2JZRmxjb3QvR1djdHdWVGVnOENuZEhEdjZwK3pZM1Nz?=
 =?utf-8?B?NS9nc2xFNDBwV3RPRWtwdjh3QUQveHpVQWNQUnVWWEF5Z0hwbHlIUW9CNVJw?=
 =?utf-8?B?MUdKWmIxbnQ0QVFvZFkrN1VKS0xsd2xxdHh3VjM3UWI4VlhnZTcrT3Y2L1B3?=
 =?utf-8?B?UlpvWkpta3BWZTlKeUNHbEZ0UG9ueVpLaG9MZi80K2Z2bC9xMmg5alpiMHpx?=
 =?utf-8?B?VWI0T0xMcTJGQ20zNXhIZ3pjKzIwUnE1ZXFYQnMrT3JabFNiaHJWdEdkelRl?=
 =?utf-8?B?QkxCVlFGRUg3R1pycitGa3N4bkRUSzlHREFLVm9CY3hibXZ2L1dqT05pRldJ?=
 =?utf-8?B?dUdmZS8veHpaU09vNzhaak9hOVBUZTgyQWlNR2FvSWNMSGl3YUpNaW92WmlM?=
 =?utf-8?B?bEVzQWFpVDk3bnhWbXNVaEZ5anptZEl0UEhkaGtXTnU2WTlKMiszYkI5Tk0y?=
 =?utf-8?B?Qmgvazd4ZHB3cjM1aFlrNWNBR2F4bi9kWGZySzExVTl4YzRjQkxWaUNFYzlq?=
 =?utf-8?B?R3pINkdHVFFBcG4yZTBya013eEtHWXBEa2tBbzJIdUV5d25BYmlDcDlRdEVk?=
 =?utf-8?B?QlhkeUE5WnVrMThSRzVwc0Vpak04NStHZUx4bHQ2STNObUlwYll2T01yeDJq?=
 =?utf-8?B?eW8wQ3RjVUlDSUs3Qkk1TUUvV2dtZUVBU09rSTZJWnBxTURzKzVMZlFhS2pa?=
 =?utf-8?B?dzBZNU8vMkZ2dnM5U2FyU2tFbzdkdm9PWUdDMFVMRnF6UWYzYjYxL1lhUlNV?=
 =?utf-8?B?RGw2UlFQTFE5c1d3MS9oOExibGFvRGZCd0k0TjYvcXVmMEpsb0hGZU5pMjgr?=
 =?utf-8?B?aVE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eba10a2-73f0-447b-4cbb-08de160d8d73
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 10:34:20.1243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zhkqoND/+E9GTqFd6dVqufGs8ORURxFNxoPuStHgzjm8HNAQdriNPJJgTFWcXWNPdO1BkNyMUy9KEK7IHvMwuCebaZXoOHGzjJLZJODmDCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5544

On 28/10/2025 9:32 am, Jan Beulich wrote:
> On 27.10.2025 23:17, Andrew Cooper wrote:
>> After initial publication, the SB-7033 / CVE-2024-36347 bulletin was updated
>> to list Zen5 CPUs as vulnerable.  Use Fam1ah as an upper bound, and adjust the
>> command line documentation.
>>
>> When the Zen6 (also Fam1ah processors) model numbers are known, they'll want
>> excluding from the family ranges.
> I.e. we're firmly promised the problem won't be there anymore going forward?

This is what I hear from AMD, yes.

>
>> Fixes: 630e8875ab36 ("x86/ucode: Perform extra SHA2 checks on AMD Fam17h/19h microcode")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
>

Thanks.

~Andrew

