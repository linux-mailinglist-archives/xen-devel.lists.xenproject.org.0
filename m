Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A38EAA0B0F
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 14:05:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972278.1360664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jhm-0007Vu-Ae; Tue, 29 Apr 2025 12:04:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972278.1360664; Tue, 29 Apr 2025 12:04:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jhm-0007Tm-6p; Tue, 29 Apr 2025 12:04:54 +0000
Received: by outflank-mailman (input) for mailman id 972278;
 Tue, 29 Apr 2025 12:04:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r0hc=XP=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u9jhk-0007Te-2z
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 12:04:52 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2408::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2628e1c0-24f2-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 14:04:50 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by DM4PR12MB5890.namprd12.prod.outlook.com (2603:10b6:8:66::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 12:04:46 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%2]) with mapi id 15.20.8678.025; Tue, 29 Apr 2025
 12:04:46 +0000
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
X-Inumbo-ID: 2628e1c0-24f2-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GhPdyxHf/BRudvYBK3lm91RhWvX/ynujEoX4eIzPRK3ddGmch0/SO/gqxMqbdtW/xdvKOpRm5ZSlLfcG6NtvLx2b2eM906TzaIrhPSIMGUWpvodT7B7n3NP5WyWe9Bj+CKQg3o4yADpjI4XepsBISt4nCbIQJcc6wJuCwRxn3X0q94tsGfjs4o2DIyhgxAHjTmzT6FP5IK6ZpQiwlHDc2nZaQIuu6i0C282Efk2KlPWtjNd0A2FlFo3SHQ4gs4VHsEOALEMI4PCPrEVqKanMgBqz0FvINNlOLHX1krjhWYcjQwbjPfSx5XBoPhY6kGHLZe3xAI6nv1UpRj9dLaXKsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOCkHerxvDxmbeBQR30NNEMstB8L6draFAV62NRgmMM=;
 b=A+GGVZFAifOoYwcecCL49bpisitW29LSf5gOGkOhRP/AS/tJImSzLhz0qu1JZ5Jlhtiy7dj4ln4sxA67gvFv0x+uoo5ueJbV9ScQxw/G9lccVKAR+Lsk02dd3TToed+gFQJPAfZqIZqQFcx4mXL1peb2QkVxGIlUpr0kgL9+r6PaA8z8SCejbcfqAgAGu8zF+M/WbvbJ7vianyrHsaSqgrHxHQR5UytBZfPgnrKR+wf/knfHt0C6oxQJH5EdNp6wSMkqYlJXXlvjpNU9YHGG2C5ghT6b/8zcjFGIKhReD41vQLPjJL8IewOTJ8UXnsJc6PVJx6LMBR1qkxp1x8s/0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOCkHerxvDxmbeBQR30NNEMstB8L6draFAV62NRgmMM=;
 b=OI07XPn2HhEwy25pnToK+J8XheUvm3Ng2jF2Xj+a4TmTMjcUPasc7N+cLgbz+dYp28ucv7OJzTAGFWhxdsXl5hyrP2rSPcXzIWTFlAcWmF9cTZ7lt0YJ8F3gExewGJcsX+gDy9G94nQ7Uz+JD86a6J1CintA2bOVU+7QKp+dSXY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <388f39ad-6aa6-4b95-9941-334b434ff400@amd.com>
Date: Tue, 29 Apr 2025 13:04:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/arm: AArch32-V8R: Add MPU register definitions
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250417155511.1854081-1-ayan.kumar.halder@amd.com>
 <306e5414-1552-4605-86d6-b23b89d00bc9@xen.org>
 <cebb0020-531f-467c-bc81-54d2ba1aa8e0@amd.com>
 <2697BC06-8A78-42B4-9977-07907BBBDC3D@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <2697BC06-8A78-42B4-9977-07907BBBDC3D@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0032.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::15) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|DM4PR12MB5890:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c2c478b-8be8-446b-14e3-08dd87160856
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1I0enV6WXBqcTQ4aUFPL09XYUM5cUMrcFRCMkMyYWFHZFV6SWhaTDBGNXNS?=
 =?utf-8?B?M0wvK3FpY0JPd3J4TG1oMEt1VWU3Ui81bUpUUGVqaHh6TGgxbnpjcVNVc0hK?=
 =?utf-8?B?MURvQ0EwOFMrL0ZxSkJaNkZPN2VWQm9ndmJGSFltdVRLd1NSamJNQmRoeHA1?=
 =?utf-8?B?eXNZbitvYU9HZjRDejhCc1pGazVoaml3M0JnV0VLOURlWTVyWFVFWDU2bFNv?=
 =?utf-8?B?ZjRnUGtFRGVCSExxaUpmMTlMWERlMVB5SXpHYTB5QmxOb2JhdlZsR0Yzcml1?=
 =?utf-8?B?V0hjV2p1L2dPek1YT1U4R2xwRWlrQ2VtZEYveHVhcm1USGRGVExtQkN1RE5N?=
 =?utf-8?B?SDFrZGFWaXBwbXdjU1N3VjNqMWwyenBFUWJjUktQdUpHM2lBekFJOWVZQUFW?=
 =?utf-8?B?YVR1T2k1bVU0ZEdtSGp3NVJzbm43OWMxeXVGWUw4eTVHOU5LN2NBR0hBL0RN?=
 =?utf-8?B?MHh6Sjh3SUNqM1ZZb1o2eDBNb1VHYUVXblV2c25USWZYUnZFc3R0Nnd4dUZx?=
 =?utf-8?B?WitENnljOVpCR1VTSjJXRllRclBQWTFxZ2czTUJEbVMzMkdhSlBudC9rVGJ4?=
 =?utf-8?B?MWllVkp6Z1czdGIwZmVOYmlBdjhON29sZGc4b1R4QkJwVy9SVXQ5bmQ3bXpH?=
 =?utf-8?B?eXcwU2hKRUQydXhZanlhNjVBZlgyZytZUERiM0ZyRHVMSGtqdERlT2JjWTYx?=
 =?utf-8?B?YmRkYXY2SW9BQnJqVGNyQ041NmtMY0ZWTXF5NDJZS2s2ai9qYWkzUk03UUl6?=
 =?utf-8?B?clAvWGtHallnSXRTV1Y5NUdoL05sTG55QlJ1ZGhBZkprdjg2dWlmNkhJYmNP?=
 =?utf-8?B?WFVoc3hTYW5TSHVZUm9lejNMMDcxeC9CVXJRUGE0MkRSV05VS0RHeWZieWk1?=
 =?utf-8?B?RjlSWjNVK0lWZGl4S2h2czhTSktNcGNXQ0JyVTQ4NHNwam14eUpVeiswa0pm?=
 =?utf-8?B?c1JmeVlxcnNZQk9oRXM3RUR5cWpyTjl2bGlrczBSODJBbGlOOXZpMWtWUWVH?=
 =?utf-8?B?RWV6Mkt5UlBOY3ZieUVHMkYwd2w1ck9GZ0NzbVZjaXV0S2hnQVU3L1dKOWkr?=
 =?utf-8?B?TTY3LzFyUkljU2hMSWV3RzhaMUVkL0NUMURvV0orc1hYY1hUempHM0VnWTQ2?=
 =?utf-8?B?RVNZWXEyZU9sUFh6eWszN2o0SEpjNzV6VGNHQnFmSUc0aW5FeTBBRDJtNzFk?=
 =?utf-8?B?YTZQVkg4ckNnV1pFTUJ4UFpkUXVXL0tvRnZUK0crWEJjK0VnK3JFL1d4RkQ1?=
 =?utf-8?B?ZWRxdHpCYzNlbDh6THJFa3dwK1BVa3pqdklQQWZOR1E3TkdRNUpWa1c3RktR?=
 =?utf-8?B?cytQUmh1UGQ2RDdka2hCMGVUU1ppZldsbW5jMzFwTXNjK2E4aVlzSG9HMnJH?=
 =?utf-8?B?UDRuZll5ditmZ21rakJhZklPY3JoMnZ3Y1J4SkNSRHJmeVdHUEMxd2J1QlJI?=
 =?utf-8?B?Tm5pSDdHbU52M2tvSzF5QlhjbEFoWHpQdUJRb3RxZzYyTzl3MDA3NjRJaTlD?=
 =?utf-8?B?ZWtFK2IzVW5QU3BuRmZXK2k4d01CVUQ4ZEZHNWY0TC92MTU5OFpIb3BOY2VW?=
 =?utf-8?B?V2h5YnVseTJxVXd5ZUxiM3F6TEo1SFR4UzBnc0hoekEvb1FMNGtTTm9lTVMy?=
 =?utf-8?B?bnQwOTRGVS9MNEt4d2xBaEUveE1Zc29lVFVMdFM5dVBBVVN1OS8zdWxzV2lZ?=
 =?utf-8?B?TEZwTkRtYnk3SDZhR0VOSzI3R0c3MXhwRHdaV3MxZ1RhSjJHdXFJZjlZNDl3?=
 =?utf-8?B?MXJzYXpEMzM2bmtCdVBhTHRtcW9nbXdQdzZzbzZES3NmK29kcDJ6UGxEUlUw?=
 =?utf-8?B?YzAwMXpva2N3OGZKY3FYcE9qTUI2TzJmYk5FQVpVWnNidEMzQVN6d3lTbnZD?=
 =?utf-8?B?WmIya3RyV2JSeXVtNkJpYUNTWnlJNTlPNXZCM2ttSkJreC9QeUpZRXpudlUv?=
 =?utf-8?Q?lK158gkNHW8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHFwQWN1Rld2cWpDVk1XQXY3UFpOVGQxOFR4MmVEeG1HaWN2WURvdytWdVB3?=
 =?utf-8?B?Z2hnajZ3RDBPQzV2RFROL3pidXpGamJzVnFsNHJKR1FCOXlpRjF6dVo3U0Zi?=
 =?utf-8?B?MFpqTFN3ekFUQlU5aEZvaUpZbTRaRkp1cUtSQnpHSEdEMSs5QmRKcGFnYmZh?=
 =?utf-8?B?SHJJQ05VRkxoM2FNbkprQkN1R3IwUlFoUjVFU3h3eFUzZHZidm11K1NTK3d4?=
 =?utf-8?B?dkpoWUV6U0FseXFCbVV5NkQxbXpMUXdROVZOUk8wZWFvMlN3WHhJdFJPaEEr?=
 =?utf-8?B?akxBR1ZxbGRtemZ5dldERXZSS3hyblhWelFWY2NQdGtnRUxoUVVlaXBuK3pa?=
 =?utf-8?B?K1ljQ0tpbGdaUHlZWDNRT0FURHF3YmRpbWhvdGVLU1MyNFc3S0JGNGl1THoy?=
 =?utf-8?B?VVowOTZzUzArRkhwVlo1OHVDWVptWHFGUzIrNFpNZm14V25idy9PQVFoODUr?=
 =?utf-8?B?NVhVYlB1ZXYyOEpBOTFXMU03TkR5dG5LZERzRE5VRmFNV3hya1lWV3JxOU5n?=
 =?utf-8?B?OG9xNTVmeEh3bGNlUXArVHhFNzNrK0M1SElHc3R5VDlPdGVkQnJNVmgvdXVh?=
 =?utf-8?B?ZG1VRk9uNkMwcVpMTUZOT0gyaWRTcGpuUUVycExzTHJaU3YrOTBBSWpmdDVk?=
 =?utf-8?B?aHlHQTVQSHEzNnVTU1BGZXlVcEx6YTd6VXQ0R3ZqL3ZjMWJ0TEFVanQyQUtX?=
 =?utf-8?B?TmkyWUpWQm16SVQrQlU2WWRLcXBqVlRrcm9JZXVzQy9jRkRGVlFwdUhJZUNx?=
 =?utf-8?B?aEljMTFaQ3VrUkF3SENnS0w1RW1HM252UFd6Z1ZYWkluQmtMaks2UXNkZ1lx?=
 =?utf-8?B?UjlBT2xPeUdzVnFzNVJUSSt5YWFCRjlWY0lPK3RtVDZJQllkYnNiRjNka0N1?=
 =?utf-8?B?NUs1NmpkTUNQcXdNMzFWb2d3dUZ5VmQwRlNUS040ZFVseXBoa05nSmNtU0I1?=
 =?utf-8?B?VDFHWEIxSHVkenRpdkFkcmVEc2JUcytFNm1JTGE3ZzVXQm9YTWhLWHIyVGN3?=
 =?utf-8?B?TlFkcDhadzJ4aEQxTDIyeXFMMlpNVTZXdXIvQkc5elRIM09nWDNrZU5QSGNv?=
 =?utf-8?B?RmNPWE40YmpOcCtIblpja2U2amV0UkFwNnZHcUNRa0lvWkt0R3Bub245N29P?=
 =?utf-8?B?cUdkeUZhS3BwY0RKdnpDYWFmMURtRDRtSzg0U1REZ0FJSjlXeS9udTZENVVi?=
 =?utf-8?B?R2Vad0hrRUhUYnE2MTErcFRMU1hGQjg2MVJnNW0xYjh0N3p0N2ZjSTZYdnBP?=
 =?utf-8?B?cW45TXFjTjgwaVBjdzM3cXdYVkVFUmVYM2FzRVRtQnJsbUQvSkVsU1k3Yjhw?=
 =?utf-8?B?cWlyYXcvMzgxWFpVSGVWZSs2NFZidjB6WnY3dnhZdENQa1Fsek0yTUE0cDdu?=
 =?utf-8?B?bVNNLzZGaWY2azBHR1NNaGFzT05BeEZtUnYwWmxHb2pCR3MzMGZVS1pQQUIv?=
 =?utf-8?B?cWNUQnF5UkxFVjN3NmxJVkdoMUp0eEhJYTk0UW1uZCtNNVVxOGRBcjBubFNR?=
 =?utf-8?B?Q2tBQkxwSEFGcUU4OUVKSC8xRHhpOVN6dGNLczJxdmhEbE45Z25jclR0TUw0?=
 =?utf-8?B?VFFDcXdoYld3UkRacGJiMVIxS1crMkZFc3J3RFo5aHlRK0JLZ0ZKVXNNR0o4?=
 =?utf-8?B?ZklzYXA4YzQreE03cTM0eFd0UzlXak9XRXRPWlZnYkRNTGtaMG12Zmk4dU1i?=
 =?utf-8?B?RWFEZlBtUUo5RlZ1QzFVMkFMem9sMUZNRHBHdk5RMVpVVVFKcHRBOGhFWFN6?=
 =?utf-8?B?OGE4dFZpR1k3ZHRzcE1rd0pzS0QzWWhSNkZwejNNcTF5aXR6WVZaNjZQcU1r?=
 =?utf-8?B?VnYwUGYwY3V3MVdhb0pld1ZXbFNHcStZZFREQ3RqVmpNMWk4dnpUZjhxdWpN?=
 =?utf-8?B?aE9iQm1OUG5MOXBveWowZnBSd1FOSVVJYWtGV0dGZkFVemEveTAwQXdQYS9v?=
 =?utf-8?B?VmpYdWRLUGFyMzYrMThPZUtMcWd0K3dlSjNrOXFzOUtLOCtuUTJqRlYrSnBY?=
 =?utf-8?B?cTJrekhOZTlrRXZDSGlraExEWmVJNzFqQ3RJRjlSV1ZteVdWV3NZWVRSSk9H?=
 =?utf-8?B?YW5SbFRvcEVncmdQRHZGbVpLb1BXS0MxL1JIZkpsL3gwdUpnc1ZZWUk5Vklz?=
 =?utf-8?Q?7RobBjKk9SLzBIYhvINExL0uD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c2c478b-8be8-446b-14e3-08dd87160856
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 12:04:45.9930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3TVzsBzp2qj9ejN2pqv7UJcsdRficB6YOLZ5qyqoTBgTFPEqYzS5pfJEKq5JBLJC+1jarq36BodPMN66l+/u1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5890


On 28/04/2025 20:04, Luca Fancellu wrote:
> Hi Ayan,
Hi Luca,
>
>> On 25 Apr 2025, at 13:00, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>>
>> Hi Julien,
>>
>> cc-ed Luca for feedback on specific points.
>>
>> On 18/04/2025 05:54, Julien Grall wrote:
>>> Hi Ayan,
>>>
>>> On 18/04/2025 00:55, Ayan Kumar Halder wrote:
>>>> Add the definitions for HPRBAR<0..31>, HPRLAR<0..31> and HPRENR.
>>>> The definitions are taken from ARM DDI 0568A.c ID110520, E2.2.3 HPRBAR<n>,
>>>> E2.2.4 HPRENR and E2.2.6 HPRLAR<n>.
>>>>
>>>> Introduce pr_t typedef which is a structure having the prbar and prlar members,
>>>> each being structured as the registers of the AArch32-V8R architecture.
>>>> This is the arm32 equivalent of
>>>> "arm/mpu: Introduce MPU memory region map structure".
>>>>
>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>> ---
>>>> This patch should be applied after
>>>> "[PATCH v3 0/7] First chunk for Arm R82 and MPU support" in order to enable
>>>> compilation for AArch32.
>>>>
>>>>    xen/arch/arm/include/asm/arm32/mpu.h  |  59 +++++++++++
>>>>    xen/arch/arm/include/asm/mpu.h        |   4 +
>>>>    xen/arch/arm/include/asm/mpu/cpregs.h | 135 ++++++++++++++++++++++++++
>>>>    3 files changed, 198 insertions(+)
>>>>    create mode 100644 xen/arch/arm/include/asm/arm32/mpu.h
>>>>
>>>> diff --git a/xen/arch/arm/include/asm/arm32/mpu.h b/xen/arch/arm/include/asm/arm32/mpu.h
>>>> new file mode 100644
>>>> index 0000000000..4aabd93479
>>>> --- /dev/null
>>>> +++ b/xen/arch/arm/include/asm/arm32/mpu.h
>>>> @@ -0,0 +1,59 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +/*
>>>> + * mpu.h: Arm Memory Protection Unit definitions for aarch64.
>>>> + */
>>>> +
>>>> +#ifndef __ARM_ARM32_MPU_H
>>>> +#define __ARM_ARM32_MPU_H
>>>> +
>>>> +#define XN_EL2_ENABLED  0x1
>>> I understand the define is introduced in Luca's patch, but this a bit non-descriptive... Can we find a better name? Maybe by adding the name of the register and some documentation?
>> We can rename this as PRBAR_EL2_XN if this sounds better (cc @Luca) in Luca's patch
> what about PRBAR_EL2_XN_ENABLED? I can change it in my serie
I am ok with the name.
>
>> The description can be
>>
>> Refer ARM DDI 0568A.c  ID110520 , E2.2.2
>>
>> HPRBAR [0:1] Execute Never
>>
>>>> +
>>>> +#ifndef __ASSEMBLY__
>>>> +
>>>> +/* Hypervisor Protection Region Base Address Register */
>>>> +typedef union {
>>>> +    struct {
>>>> +        unsigned int xn:1;       /* Execute-Never */
>>>> +        unsigned int ap:2;       /* Acess Permission */
>>>> +        unsigned int sh:2;       /* Sharebility */
>>>> +        unsigned int res0:1;     /* Reserved as 0 */
>>>> +        unsigned int base:26;    /* Base Address */
>>>> +    } reg;
>>>> +    uint32_t bits;
>>>> +} prbar_t;
>>>> +
>>>> +/* Hypervisor Protection Region Limit Address Register */
>>>> +typedef union {
>>>> +    struct {
>>>> +        unsigned int en:1;     /* Region enable */
>>>> +        unsigned int ai:3;     /* Memory Attribute Index */
>>>> +        /*
>>>> +         * There is no actual ns bit in hardware. It is used here for
>>>> +         * compatibility with Armr64 code. Thus, we are reusing a res0 bit for ns.
>>> typo: Arm64.
>> Ack
>>>> +         */
>>> Hmmmm, this would mean someone may mistakenly set the bit to 0 by mistake. If the field is always meant to be 0 on arm64, then I would consider to name is res0 on arm64 with an explanation.
>>>
>>> This would make clear the bit is not supposed to have a value other than 0.
>> On Arm64, ns == 0 as it can only support secure mode.
>>
>> So we can change this on Arm64 as well :-
>>
>> unsigned int res0:2; /* ns == 0 as only secure mode is supported */
>>
>> @Luca to clarify
>  From the specifications: "Non-secure bit. Specifies whether the output address is in the Secure or Non-secure memory”, I’m not sure
> that we should remove it from Arm64, so I don’t think you should have something only for compatibility, maybe the code accessing .ns
> can be compiled out for Arm32 or we can have arch-specific implementation. I think you are referring to pr_of_xenaddr when you say
> “compatibility with Arm64 code"

Yes, that is correct. So are you saying that we should have an "ifdef" 
in the function.

+++ b/xen/arch/arm/mpu/mm.c
@@ -221,7 +221,9 @@ pr_t pr_of_xenaddr(paddr_t base, paddr_t limit, 
unsigned attr)
      /* Build up value for PRLAR_EL2. */
      prlar = (prlar_t) {
          .reg = {
+#ifdef CONFIG_ARM_64
              .ns = 0,        /* Hyp mode is in secure world */
+#endif
              .ai = attr,
              .en = 1,        /* Region enabled */
          }};

I am ok with this. I just want to know if you and Julien are aligned as 
well.

>
>>>> +        unsigned int ns:1;     /* Reserved 0 by hardware */
>>>> +        unsigned int res0:1;   /* Reserved 0 by hardware */
>> Then, we can change this on Arm32 as well.
>>>> +        unsigned int limit:26;  /* Limit Address */
>>> NIT: Can we align the comments?
>> Ack.
>>>> +    } reg;
>>>> +    uint32_t bits;
>>>> +} prlar_t;
>>>> +
>>>> +/* Protection Region */
>>>> +typedef struct {
>>>> +    prbar_t prbar;
>>>> +    prlar_t prlar;
>>>> +    uint64_t p2m_type;          /* Used to store p2m types. */
>>>> +} pr_t;
>>> This looks to be common with arm64. If so, I would prefer if the structure is in a common header.
>> No, in arm64 this is
>>
>> typedef struct {
>>       prbar_t prbar;
>>       prlar_t prlar;
>> } pr_t;
>>
>> The reason being Arm64 uses unused bits (ie 'pad') to store the type.
>>
>>>> +
>>>> +#endif /* __ASSEMBLY__ */
>>>> +
>>>> +#endif /* __ARM_ARM32_MPU_H */
>>>> +
>>>> +/*
>>>> + * Local variables:
>>>> + * mode: C
>>>> + * c-file-style: "BSD"
>>>> + * c-basic-offset: 4
>>>> + * indent-tabs-mode: nil
>>>> + * End:
>>>> + */
>>>> diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
>>>> index 77d0566f97..67127149c0 100644
>>>> --- a/xen/arch/arm/include/asm/mpu.h
>>>> +++ b/xen/arch/arm/include/asm/mpu.h
>>>> @@ -8,8 +8,12 @@
>>>>      #if defined(CONFIG_ARM_64)
>>>>    # include <asm/arm64/mpu.h>
>>>> +#elif defined(CONFIG_ARM_32)
>>>> +# include <asm/arm32/mpu.h>
>>>>    #endif
>>>>    +#define PRENR_MASK  GENMASK(31, 0)
>>>> +
>>>>    #define MPU_REGION_SHIFT  6
>>>>    #define MPU_REGION_ALIGN  (_AC(1, UL) << MPU_REGION_SHIFT)
>>>>    #define MPU_REGION_MASK   (~(MPU_REGION_ALIGN - 1))
>>>> diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h b/xen/arch/arm/include/asm/mpu/cpregs.h
>>>> index d5cd0e04d5..7cf52aa09a 100644
>>>> --- a/xen/arch/arm/include/asm/mpu/cpregs.h
>>>> +++ b/xen/arch/arm/include/asm/mpu/cpregs.h
>>>> @@ -6,18 +6,153 @@
>>>>    /* CP15 CR0: MPU Type Register */
>>>>    #define HMPUIR          p15,4,c0,c0,4
>>>>    +/* CP15 CR6: Protection Region Enable Register */
>>>> +#define HPRENR          p15,4,c6,c1,1
>>>> +
>>>>    /* CP15 CR6: MPU Protection Region Base/Limit/Select Address Register */
>>>>    #define HPRSELR         p15,4,c6,c2,1
>>>>    #define HPRBAR          p15,4,c6,c3,0
>>>>    #define HPRLAR          p15,4,c6,c8,1
>>>>    +/* CP15 CR6: MPU Protection Region Base/Limit Address Register */
>>>> +#define HPRBAR0         p15,4,c6,c8,0
>>>> +#define HPRLAR0         p15,4,c6,c8,1
>>>> +#define HPRBAR1         p15,4,c6,c8,4
>>>> +#define HPRLAR1         p15,4,c6,c8,5
>>>> +#define HPRBAR2         p15,4,c6,c9,0
>>>> +#define HPRLAR2         p15,4,c6,c9,1
>>>> +#define HPRBAR3         p15,4,c6,c9,4
>>>> +#define HPRLAR3         p15,4,c6,c9,5
>>>> +#define HPRBAR4         p15,4,c6,c10,0
>>>> +#define HPRLAR4         p15,4,c6,c10,1
>>>> +#define HPRBAR5         p15,4,c6,c10,4
>>>> +#define HPRLAR5         p15,4,c6,c10,5
>>>> +#define HPRBAR6         p15,4,c6,c11,0
>>>> +#define HPRLAR6         p15,4,c6,c11,1
>>>> +#define HPRBAR7         p15,4,c6,c11,4
>>>> +#define HPRLAR7         p15,4,c6,c11,5
>>>> +#define HPRBAR8         p15,4,c6,c12,0
>>>> +#define HPRLAR8         p15,4,c6,c12,1
>>>> +#define HPRBAR9         p15,4,c6,c12,4
>>>> +#define HPRLAR9         p15,4,c6,c12,5
>>>> +#define HPRBAR10        p15,4,c6,c13,0
>>>> +#define HPRLAR10        p15,4,c6,c13,1
>>>> +#define HPRBAR11        p15,4,c6,c13,4
>>>> +#define HPRLAR11        p15,4,c6,c13,5
>>>> +#define HPRBAR12        p15,4,c6,c14,0
>>>> +#define HPRLAR12        p15,4,c6,c14,1
>>>> +#define HPRBAR13        p15,4,c6,c14,4
>>>> +#define HPRLAR13        p15,4,c6,c14,5
>>>> +#define HPRBAR14        p15,4,c6,c15,0
>>>> +#define HPRLAR14        p15,4,c6,c15,1
>>>> +#define HPRBAR15        p15,4,c6,c15,4
>>>> +#define HPRLAR15        p15,4,c6,c15,5
>>>> +#define HPRBAR16        p15,5,c6,c8,0
>>>> +#define HPRLAR16        p15,5,c6,c8,1
>>>> +#define HPRBAR17        p15,5,c6,c8,4
>>>> +#define HPRLAR17        p15,5,c6,c8,5
>>>> +#define HPRBAR18        p15,5,c6,c9,0
>>>> +#define HPRLAR18        p15,5,c6,c9,1
>>>> +#define HPRBAR19        p15,5,c6,c9,4
>>>> +#define HPRLAR19        p15,5,c6,c9,5
>>>> +#define HPRBAR20        p15,5,c6,c10,0
>>>> +#define HPRLAR20        p15,5,c6,c10,1
>>>> +#define HPRBAR21        p15,5,c6,c10,4
>>>> +#define HPRLAR21        p15,5,c6,c10,5
>>>> +#define HPRBAR22        p15,5,c6,c11,0
>>>> +#define HPRLAR22        p15,5,c6,c11,1
>>>> +#define HPRBAR23        p15,5,c6,c11,4
>>>> +#define HPRLAR23        p15,5,c6,c11,5
>>>> +#define HPRBAR24        p15,5,c6,c12,0
>>>> +#define HPRLAR24        p15,5,c6,c12,1
>>>> +#define HPRBAR25        p15,5,c6,c12,4
>>>> +#define HPRLAR25        p15,5,c6,c12,5
>>>> +#define HPRBAR26        p15,5,c6,c13,0
>>>> +#define HPRLAR26        p15,5,c6,c13,1
>>>> +#define HPRBAR27        p15,5,c6,c13,4
>>>> +#define HPRLAR27        p15,5,c6,c13,5
>>>> +#define HPRBAR28        p15,5,c6,c14,0
>>>> +#define HPRLAR28        p15,5,c6,c14,1
>>>> +#define HPRBAR29        p15,5,c6,c14,4
>>>> +#define HPRLAR29        p15,5,c6,c14,5
>>>> +#define HPRBAR30        p15,5,c6,c15,0
>>>> +#define HPRLAR30        p15,5,c6,c15,1
>>>> +#define HPRBAR31        p15,5,c6,c15,4
>>>> +#define HPRLAR31        p15,5,c6,c15,5
>>> NIT: Is there any way we could generate the values using macros?
>> This looks tricky. So I will prefer to keep this as it is.
>>>> +
>>>>    /* Aliases of AArch64 names for use in common code */
>>>>    #ifdef CONFIG_ARM_32
>>>>    /* Alphabetically... */
>>>>    #define MPUIR_EL2       HMPUIR
>>>>    #define PRBAR_EL2       HPRBAR
>>>> +#define PRBAR0_EL2      HPRBAR0
>>> AFAIU, the alias will be mainly used in the macro generate
>>> the switch. Rather than open-coding all the PR*AR_EL2, can we
>>> provide two macros PR{B, L}AR_N that will be implemented as
>>> HPR{B,L}AR##n for arm32 and PR{B,L}AR##n for arm64?
>> Yes , we can have
>>
>> #define PR{B,L}AR_EL2_(n)          HPR{B,L}AR##n for arm32
>>
>> #define PR{B,L}AR_EL2_(n)          PR{B,L}AR##n##_EL2
> we could have them in mm.c, I see in your v2 you’ve put them in cpregs.h,
> but since they are only used by the generator, I would put them there.

You mean the above two macros should be moved to mm.c. I am ok with that.

Just 2 more things to be aligned :-

1. Are we ok to use PRBAR_EL2_(num) and PRLAR_EL2_(num) in the common 
code (ie mpu/mm.c) ?

2. Are you ok to introduce ifdef in prepare_selector() ?

Please have a look at my v2 for reference.

- Ayan

>
>
>

