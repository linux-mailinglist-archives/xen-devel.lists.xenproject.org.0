Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A49CAB646D
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 09:31:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983943.1370113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6aT-00037e-9I; Wed, 14 May 2025 07:31:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983943.1370113; Wed, 14 May 2025 07:31:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6aT-00034Q-6c; Wed, 14 May 2025 07:31:33 +0000
Received: by outflank-mailman (input) for mailman id 983943;
 Wed, 14 May 2025 07:31:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kjT3=X6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uF6aR-00032z-Kl
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 07:31:31 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20602.outbound.protection.outlook.com
 [2a01:111:f403:2409::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72b15429-3095-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 09:31:29 +0200 (CEST)
Received: from DM4PR12MB5277.namprd12.prod.outlook.com (2603:10b6:5:390::7) by
 SJ2PR12MB8157.namprd12.prod.outlook.com (2603:10b6:a03:4fa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 07:31:25 +0000
Received: from DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e]) by DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e%3]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 07:31:25 +0000
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
X-Inumbo-ID: 72b15429-3095-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ci9Uc4f8+ABlY6srFOig2CjCsFBAPDw1yA4GFaS4YSYwn4PMagW29QmaWXNXU+RhZYGc5lLHNuDlvddNRnmDrGLtQr108s3rxAVmo6a7zlcCOGkjbAHQWmHRzPBgblA6KoDsaq6tu7aw6l8rldEMTLLc9fh9TwWBCPITtlWOT49GqbxPMu040DDEjQ7ztsupGe21eKr9gCWJs3tRQwRJkNcxi1KqEJiQSiN8XXppHchUq0rwnqInyJ4s+VvnpwJ6cHJWnTleOM7xr2GeCRCUQeVvIfWaUbPv+oKP1lOODIMHE9DaVhcqA31K9G4uycU3ExRBtVkWtrJKOZkl1cQEFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3AqlBrdYVDavF0r1GKooR0hPssOYR3Cbd6f90ss7/3M=;
 b=mTrvR1wUzF1UFkPjsA/cTFPN9WBmQ3Y9iwS3ub7YLDolepCCOAoBZ7aPxCX2tkH9E7TuB9gmdzgdC79pYZ5rz5a92cH3CA9brVw4d7/Bo1wWMzbP11rA0+KbLzOK/ZTrD/4Y1vDqcy8u7VxGfXSmRd/J2ps4K8uaTFumotoY2k+Ek9Xa/52CxVcSZ7enWrWXTQRqnSJJdliXPpakVEX2OwPzYCKxT9mLwWPPCZYMLm5TFz1VqcES83Bky70NqLX68kOXG7g7dl3HOwfsDZ16Rp8QuFwxCCLNjK2V2PvvK2z5MmJ/RMOfIFo/C6c1rNoc63bWogL14U6yyUfr896jgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3AqlBrdYVDavF0r1GKooR0hPssOYR3Cbd6f90ss7/3M=;
 b=Ha9BI6YvPddyuGBMV+yuQ30qeuBLUzHG+BW/noCJjyTe+ps7La9i5ackVgdRACpfDw8bPA6rg1VutVrHkiXExHvTB/uPHDItarLuDs0ZD6hEOOJLxjUJQKyGOHPPqtozkHlUmQYU5x8Z7kX67qOAZppGSAVJOLGGc6DIluwu1po=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <54c3d341-1d7f-428d-89a7-ce4fcae8a5db@amd.com>
Date: Wed, 14 May 2025 09:31:20 +0200
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
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250513195452.699600-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::11) To DM4PR12MB5277.namprd12.prod.outlook.com
 (2603:10b6:5:390::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5277:EE_|SJ2PR12MB8157:EE_
X-MS-Office365-Filtering-Correlation-Id: 771f2dff-f455-41c6-6aef-08dd92b9551e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEpIc3V1YTBvd25tM3FBYWhrMklMOW11eW9EK1NFUkNZUTBHK0taQ0JMNGpI?=
 =?utf-8?B?STI5Qi94VHNyeUE5OHhEWFgwZUhtU0Z6SUJrY0lOQXo1L01nL21yUWRZcGhI?=
 =?utf-8?B?U0o4ZDhmektUUzV4M0Q5S1NWKzFxNlNBRWJ1ZC9Yb1JleTRoaW1jaFhQdG1m?=
 =?utf-8?B?Vk1sRFdpNWoydkxJOGNSdmR5dHVoUGRVTWdlR2lyUXE4ZFFCeHRBZE9xTnVt?=
 =?utf-8?B?b2ZQR1JRU0tqQmppaXArSWZnUVlpZEQxVWN6R2t2WXZ5aUc1aU1GbWVuVkxV?=
 =?utf-8?B?UW9ISE5mRDBURUIvSXJNUUZ1VjVaV1dpazdXYUZFcng0NW94TUc3dWZud2FK?=
 =?utf-8?B?K21JN1M0VWFUSG42TVlicEtWcUdUYXZUKzk1NTg4NWRkOWc5U0ZUOUhHMjYw?=
 =?utf-8?B?YVZ5cnRrSGlTWWE5cC9ldktibEg0bzZkaDZXczFobmlZTm1NMGFmb09QNUVx?=
 =?utf-8?B?SHM0dnhDZDN4eHplL1VhUkJFVnIvNzZuMlAxdE5uekw2cmJhU0lqK1dJNXpO?=
 =?utf-8?B?anljekx5bDRtUG1TZ0RCUHdWMmhxaHBLUURjdWdvcmxaR0svOTc1MnNLTVVo?=
 =?utf-8?B?K3ZoZjFDcVBLSnBjaWJmSFNwM0g1czNaYlBJcWZyaDhFWTNVN3hidWVLRDF5?=
 =?utf-8?B?Wk42cEl4dit3NTlzTW1DYWVSQWU2SUw2cTRlU2N3WGk5ZVgvbVI1bUNhVlQ1?=
 =?utf-8?B?dUtyZTk2WnNCK1M2ZVFnVFFXSkNQV0lRRVp5K3lTWFFNQmhlTUxWZ1NMOHRj?=
 =?utf-8?B?L0dzUXlURVM4QW9qb1hpdmRaWUExU1QzUWpGdENnWFVWYUpvU2JDVlF5WFN3?=
 =?utf-8?B?Yjc3dmJWVnNMS21vZXk1czNiZnp3L0FaSzJrV0NMRXp1VnpkZjBpODJLOG11?=
 =?utf-8?B?RnQxb3YvV1VYMlBiNUJWeU1KM0kwMnNRTzl5OG56NXBVRkVkbU0zdGxLcUJj?=
 =?utf-8?B?eTRLQXdSRnlEZFpaWGVtRk5mQm16OWNvbTNabUFib0RyRE1EMDVnaWFvbHFj?=
 =?utf-8?B?dGhIdElEVEZFdlVuMCtDVUpoak14UjgyQWlyM04xcy8vREE0S1JucnhodW9q?=
 =?utf-8?B?V1VqZnNBOWl1Tkk1SlU5N29tS1lDK1BkcXlnS0luYnUyQ1l4R0F2c0d5YWh1?=
 =?utf-8?B?NEs3R0FVNE1takIweWRYNHpOdFZyNlVwQ0FUajF3c290cDhrdWk4d2N4YVlz?=
 =?utf-8?B?V3lXV3RQQW5YV21Mc0l5OE1OUUNrSkNjYkJqdyt1MUV6SSt3aXdIU3gvRE51?=
 =?utf-8?B?eXdFTnFWd29pS0xVQjFQTHd1RkJzbmtnakEydnIzdk9ZQ2s2bStseTlXb3Nw?=
 =?utf-8?B?UWZnbFVVV0gvWk1jT3RLV25RUzVsdS8wNE8zR1QxYzlLekJDenpGajZubVZ5?=
 =?utf-8?B?QkdzTndTaWlrcWFIdnIyN0F4ZU42NDl5STkxaXV2dXp1c3UvZzJWalE2a1E0?=
 =?utf-8?B?WE01U1FvNVNlRSs5NFVpTTNrUXlOMlFWUm9Xb24wWjNRdCtIVURtOFZjK1FG?=
 =?utf-8?B?d2JWOTROMHo1N0hPQ0FUQU5QWkkxM2hYUklWMnFLYmxkTEtra044SUdpY1lx?=
 =?utf-8?B?aytZRHloUkJWakN0emF3Wm0zREVBRGxBQXpuaDE1MmRBbWJpNDRaUG9kUklD?=
 =?utf-8?B?T082d3kvQWMzVkRjNVY3MlZYbFZyWDNIdWNLcjlHckxvU3pXN1p2TVlPY3dk?=
 =?utf-8?B?RDY3NmdOaWVtY0JrSFU1cG1zeGNFelgyYWJCTjBuNy9McURudXJVY1MrSmJV?=
 =?utf-8?B?ZUZHbW56a0pJSmxQTDZBdml0VG9oUUxGVXViaERFTm12MnVNc2FWSnYvV3dX?=
 =?utf-8?B?MUJxdkpkVE8wM1p2WklkcnN3YTIvU2hZa3JMVXgvWDNCVnVxRnR1ZnlrUXMw?=
 =?utf-8?B?OVo3WE53RTcvVE1BTVBVcENVNUlZdHA1Vmk3S3Z4elpucVlpRDJaSERpNTBU?=
 =?utf-8?Q?+KkDDbeJ63s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHhNenZoZFpNQkk3dDkweEtKcjZFNTd1NWNTRmNQTzh4Rzh0bXhOOVhOYTFM?=
 =?utf-8?B?TTJIbWNqanpDZzlMTlNKNmVvQ21uWGR5dGVQVHF4ZWZYTGpTQisxcmRjRURh?=
 =?utf-8?B?bzc4cEl2V2t3SWRtVkNYMmtPby9ib3kwTG13YjdDUVR3cndKSklxYWJTQW5T?=
 =?utf-8?B?MG1hWm1Lc0hTT25MNndWRm9ndStmSXpSVm1KSWlLODBvQ21Kb0V5S1FmaThX?=
 =?utf-8?B?TDdpYnNJc0RwSDkxbDY2am9SRHQ2UGZxV0MvRk9adTNrTDFndFNwWmVxZ0JY?=
 =?utf-8?B?MDFaSlRaVmJ3SjgyYnFIVmJONTM2N0lNb3NUMWpURFUrVCtSRkZ3L2pCSjM5?=
 =?utf-8?B?am1xVHFGYVY4TE96clFHcUNGVHlQN1JDUW9uWHEyeDRJOTRKM2U3SWpvc0Jp?=
 =?utf-8?B?WE5laHRkM0FCaWxZVm1TZEVzQjFndXB1NVJBd0cxZTdwQjgxNkpqRVVpZUlV?=
 =?utf-8?B?RkZFZStFZ0VmdHhlWVNYNlZ4dDlROG1TSVU3aFQ5WnFtZi84Rit1d05yS0Ey?=
 =?utf-8?B?b05EOW5SRTNsYWVsNGQ4Q2NWdGcyT291dDc2UzVPb3E4RGN1d0lQQlJSaHlu?=
 =?utf-8?B?MzlCMHk0bHBTY2Z6TW01R0o2M3c1N2hCd1ZxcFloT2hwN3NQbFhaalliYTNq?=
 =?utf-8?B?b0lCVmUwV2k5V2lQSWFqam9rNlliMm5xQTZhOGhKWGVoSFdvYnEyL3VNbHpR?=
 =?utf-8?B?ZklKcndXbFNkOW5CSVlUQW9ycmRwbnpSNFBRNCtuQ3dpL1FLSjVmRFkxWko0?=
 =?utf-8?B?bzEwOTA5YVlLQ1UySHJUckdLVC9MdU5keUlMd0F4cTJvZjM2WStoUFQ2MWor?=
 =?utf-8?B?T1grbjRHU1VyMUZ0RExnMEJKRE5aNHZzY3k1YS9OWE0vOFhYU012OWdRNE1D?=
 =?utf-8?B?b3dSRXlOY3dMVmJLR1pYWW1WV0xzUENvN2FqdDJaUFlla2o3OUhqZVdnQzlT?=
 =?utf-8?B?ak1iTDhHNVJpRFlUY05odGlMdXdidVRtKzR0NHQydTZDNHpOeXBwYXhYRkFC?=
 =?utf-8?B?OWJvL2RoNHowNGt5N0FmZHZ0WHZxa0NxOU1ySm80MVhGSkxuVjE3UzN2cWpH?=
 =?utf-8?B?L2htdEtWTTdlRVZXVW9tYVQ1YWgzOTFkdUdXbC9aZ2lxVHZJdThkWjBOY2xO?=
 =?utf-8?B?Q1JTbzRjS28vd2l5TlgybUVWcW5rSWJsdm83NG5XajhDa2NMWGpaRXVObDBs?=
 =?utf-8?B?WFhGUXNZMHJmN2ZMYm9VN2dCSkRULzhoWStaZlRqM1kxakw0K2V0V0dNeEhE?=
 =?utf-8?B?WmNZbys4dmpRdjVTN2c5dWZzSUFjMXMvZ0tzbHVsM3dPR0FRY1FRWGc4NzJ0?=
 =?utf-8?B?NlB0UG4zZGlhVW9iMGhSZGdzVWdxUGk5ZmEveTllb1N2clRFY1J1N2RpYmk5?=
 =?utf-8?B?bHMxZWxyd0cvTlpZaTUvTThmWktoamcxU1lNbVEvSDZCZGxHTGN6YzVFMFR6?=
 =?utf-8?B?ZEVmKzJZV0xFeGZTUXRUTWNKcjdIeU5mTDB0aTZzcExqVHVlWUh4bVM3Q3Zx?=
 =?utf-8?B?RDE4Q0RKNTFwQnJDTFhuRloxaVdjbjNJcnRFZEZPT3U4RUdCWlMyWW5vbGps?=
 =?utf-8?B?NUJoZjl2SzdXZGl3N081U09IRVVvTGhjMDJteXpQUnZLemo3ZlE4N3NBV1hZ?=
 =?utf-8?B?MXkwMDBHK2xnSE9EbUJJS1RHT29leVFJbVEyMm9UK2RCL01KTVRvVDVZMnFE?=
 =?utf-8?B?TmVhOXIrQ3h3U0JkbzhSYWVadGFieEQ0aGprNys0bk1wM29qY0F1Z0xuOG1W?=
 =?utf-8?B?MnduS0tUYUtpdW0rUFBvRUVsUDM4ck9HWVgyTHhRNkZaMFdVRGdHMHI2MHpK?=
 =?utf-8?B?OTRqalhjQmxkQ01Fdi92cGNWVnFJa211SldzY3FBTzhxQ25jT3diaXNNMytF?=
 =?utf-8?B?SWE0b0lVWHhwaS83OFBMVVBPTWJzK0o0enhlblZqcXRqd1ZqcS9GOS9EQnMr?=
 =?utf-8?B?bkRhbENLL2dKQ3oxajVuZ095aDJiazAvby9VWXN0K3h3UXNtakY4N254VlRS?=
 =?utf-8?B?TlZ5NU1rc2VUTEU2VGFBQ0lTOFQ1emlpR21PYkd5bnBnSUlEb09YMVZueGVS?=
 =?utf-8?B?dzFkVGZzbzE0RFZrMUs4Z3ZLT3NidHhtNTJtbzhXNGJ5TjRUb05neFE1eU0z?=
 =?utf-8?Q?c5V6n9XC+U27acjmz8Y+PoFcW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 771f2dff-f455-41c6-6aef-08dd92b9551e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 07:31:25.3924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E7qfP3QFC0dCyCrUAfgSafUgGb7av0v4E9pIbnLDXuaJLlBynOtK9qUNeOD9ztSX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8157



On 13/05/2025 21:54, Stewart Hildebrand wrote:
> Similarly to fba1b0974dd8, when a device is passed through to a
> direct-map dom0less domU, the xen,reg ranges may overlap with the
> extended regions. Remove xen,reg from direct-map domU extended regions.
> 
> Introduce rangeset_count_ranges().
> 
> Take the opportunity to update the comment ahead of find_memory_holes().
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> v2->v3:
> * new patch
> ---
>  xen/arch/arm/domain_build.c | 57 +++++++++++++++++++++++++++++++++----
>  xen/common/rangeset.c       | 14 +++++++++
>  xen/include/xen/rangeset.h  |  2 ++
>  3 files changed, 68 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index b189a7cfae9f..3cdf5839bc98 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -824,15 +824,17 @@ static int __init handle_pci_range(const struct dt_device_node *dev,
>  }
>  
>  /*
> - * Find the holes in the Host DT which can be exposed to Dom0 as extended
> - * regions for the special memory mappings. In order to calculate regions
> - * we exclude every addressable memory region described by "reg" and "ranges"
> - * properties from the maximum possible addressable physical memory range:
> + * Find the holes in the Host DT which can be exposed to Dom0 or a direct-map
> + * domU as extended regions for the special memory mappings. In order to
> + * calculate regions we exclude every addressable memory region described by
> + * "reg" and "ranges" properties from the maximum possible addressable physical
> + * memory range:
>   * - MMIO
>   * - Host RAM
>   * - PCI aperture
>   * - Static shared memory regions, which are described by special property
>   *   "xen,shared-mem"
> + * - xen,reg mappings
>   */
>  static int __init find_memory_holes(const struct kernel_info *kinfo,
>                                      struct membanks *ext_regions)
> @@ -914,6 +916,13 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
>          }
>      }
>  
> +    if ( kinfo->xen_reg_assigned )
> +    {
> +        res = rangeset_subtract(mem_holes, kinfo->xen_reg_assigned);
> +        if ( res )
> +            goto out;
> +    }
> +
>      start = 0;
>      end = (1ULL << p2m_ipa_bits) - 1;
>      res = rangeset_report_ranges(mem_holes, PFN_DOWN(start), PFN_DOWN(end),
> @@ -994,11 +1003,30 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
>      return res;
>  }
>  
> +static int __init rangeset_to_membank(unsigned long s_gfn, unsigned long e_gfn,
> +                                      void *data)
> +{
> +    struct membanks *membank = data;
> +    paddr_t s = pfn_to_paddr(s_gfn);
> +    paddr_t e = pfn_to_paddr(e_gfn + 1) - 1;
> +
> +    if ( membank->nr_banks >= membank->max_banks )
> +        return 0;
> +
> +    membank->bank[membank->nr_banks].start = s;
> +    membank->bank[membank->nr_banks].size = e - s + 1;
> +    membank->nr_banks++;
> +
> +    return 0;
> +}
> +
>  static int __init find_host_extended_regions(const struct kernel_info *kinfo,
>                                               struct membanks *ext_regions)
>  {
>      int res;
>      struct membanks *gnttab = membanks_xzalloc(1, MEMORY);
> +    struct membanks *xen_reg = membanks_xzalloc(
> +        max(1, rangeset_count_ranges(kinfo->xen_reg_assigned)), MEMORY);
You allocate at least 1 membank even though xen_reg_assigned may be empty because:
 - this function is called for hwdom - no xen,reg
 - there may be no xen,reg i.e. no passthrough

~Michal


