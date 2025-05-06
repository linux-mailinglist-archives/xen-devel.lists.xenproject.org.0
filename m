Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE65AAC0E9
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 12:07:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976996.1364085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCFCg-0003pz-56; Tue, 06 May 2025 10:07:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976996.1364085; Tue, 06 May 2025 10:07:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCFCg-0003oW-2C; Tue, 06 May 2025 10:07:10 +0000
Received: by outflank-mailman (input) for mailman id 976996;
 Tue, 06 May 2025 10:07:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bva9=XW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uCFCe-0003mt-57
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 10:07:08 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20604.outbound.protection.outlook.com
 [2a01:111:f403:2417::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dad2c602-2a61-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 12:07:03 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SN7PR12MB8129.namprd12.prod.outlook.com (2603:10b6:806:323::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Tue, 6 May
 2025 10:06:57 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%4]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 10:06:57 +0000
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
X-Inumbo-ID: dad2c602-2a61-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ARqVUOdWLPrivwMf70ifvyYym2RUzBtkMUJgHr7b5PIrYkmaZZRgeT4EDhKWEqDPYmAlz1ZqAbYQAHxvlDglIDm4ecxuboX/fKAoWKzPpPKAVlo4OWF9XJIZ8WYEz6G8Xn+yZ3F0Zqs5pkULQfMeLgvnYGK5t/B5BY21FjElXqP4O0tI00I/ih5OLrESsYhVJXE0k2D1STbksS7APQXWlKa0vzCNJi3PjBOuq+uq8nMCiQvAnowY/m3gcepurMGSdMdNRBDjALIn4x+o9yAK+NPykOqQC8J5QY2z4RXyHONfCuRR2bVKKMFnYMRLg0SFNjx7/wuetxqHCcMNwFxXAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fM9T5OT9+XkkhG0vxTmxVbSdLWaDCvy4hAZsABPfPrI=;
 b=lkp4oTshPOywa5hBXDzL2FP8wkeLcm/kjuFD2Lc1yblaR7LXml6OfiCF+DfBQ29yLQDLDk4iw4fjH7JP7ZYE0NCDo1kaa3TT4UcxihEnTn8K/BkQJDZEm3xEST5oGSx3C0jmW/BUYeV4OzQ3OBRvhzG/Hh1CyKbZjT72YMdI3LU4IJXpSNiIiOCMQ2msQKOthVd9+f2Ht+PyuFVQLk7/ONuBmTT6wqXRItdVbMEyzs/v8DMvPX888UU/syO4G5z1+SndIK833FAu8lhZWabGRN0v16Z5FNuyFAjqraQPtYbT5E6edA0Rrh0ZiJNuo61RgK3gePeM9A7K+W+fswWtVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fM9T5OT9+XkkhG0vxTmxVbSdLWaDCvy4hAZsABPfPrI=;
 b=uYLQRfRmpiaf/LhEV8jntnPvRYICs9ZsYeuLPOXtKeiKlL3lfsrTeiiWBD2Tj0b4gUJ71+Blf4SeppfiJhPlkHLzHtoUNmOhdo4eq2Qrme4GrMOxl4+DqxPTjUURxhiWbr7pJ1oB/qLuvWGAzgVropV2Nn0xDd1YaekBTv3eMG4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <42eab292-f9f6-4bc1-a011-c657544ebaf5@amd.com>
Date: Tue, 6 May 2025 12:06:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] arm/mpu: Provide a constructor for pr_t type
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250429152057.2380536-1-luca.fancellu@arm.com>
 <20250429152057.2380536-7-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250429152057.2380536-7-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::14) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SN7PR12MB8129:EE_
X-MS-Office365-Filtering-Correlation-Id: 70fcb4aa-513a-4de0-f1f2-08dd8c85bc2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWtJaytwVlk3UVVwa2ozalJvRDdzQ0JVMWVEeWk3QzZVc00xOHhGdnAwMEJx?=
 =?utf-8?B?VkxLVVBBZ1lqeVRaWVl4azV0RG5ZakdWcFZ5UkliYVlrRThwZlN3UmtJZWx5?=
 =?utf-8?B?WWZ3T2xmNDBtdzc5d2ovSzNqMmtvMERQSVNITTFLeVkwUFQwWE5mdlRKb3Mx?=
 =?utf-8?B?akYwWWlqMmVjQ2RJSTFkc3J5bVMydCtMOVRTK3hWR3o2YXhlaXFBTk95V3RE?=
 =?utf-8?B?K2RIMW5nRDRZd2ExbzdkY3FJdFQxWGUrVHNYem1aZ2VhOUdvME5BL0VKdnlQ?=
 =?utf-8?B?YnB4QnNuOWo5cWFnZGVINHFWK3duaTRkRWNZT25mQkJ5d1RJbzhtcmlJVDVY?=
 =?utf-8?B?Vm1RYjI1ZE5nSG9MenM0UUtPbmc2TEp5aDJNY0ZWYmpSbGViSjRFRnlBZTdz?=
 =?utf-8?B?S1JPcDdSNFJFRnJzcTVVaGcwWGxvNHFieFRoaS95SFd0TWpDeUxaUnMwY3FL?=
 =?utf-8?B?Z2t3ZWxXRlZyK3B1V1JWaHFQaU4yb1o3Z0ZVWkxubGJOS0RmYk00bkgvcDlS?=
 =?utf-8?B?L3FOYjg3dEZRbUVTTHRFRFhDcTJkTTdCZzlGOTJOQzYvcUFLNXQvbFNuRmVO?=
 =?utf-8?B?MTd1SlYrMCtGUUQxc2h1dWd6MHdXZFRsRzNnbWc5OEU5bUpYRDhOblEweGZP?=
 =?utf-8?B?T0RxT2JEdlBod2kzR0dEUWFiUjh5b1JTSXc0VUZYV1lGZmxveFdsNmpuRSs3?=
 =?utf-8?B?ZTNVbEdyeTE2N1l0a1FuTmhuRDJvS3F1SlJHMHJGcnp5c1VBWnBGVDNrQUhs?=
 =?utf-8?B?OXBaT3owT01wKzR5ekJaeXhSOGtLQ0FNa0pjRVBMM0o4V0NTNUJCVGoxUzdS?=
 =?utf-8?B?dFZFaDFZbDBnZmVEamZjcjd4L1J1UHphRTlqOFRYQkVwZ1ZodFgxS3ozMDlR?=
 =?utf-8?B?d2hWNGJUQmkvTjJFMnU3OVpmS0wycDZXS1FscUUrbk90R2JQbldYWEYyaklz?=
 =?utf-8?B?TXF0bzdmN3RUb2Z1Rk5qQzl3UFdkSFg2TGNxMFd4M0lMRjB3ZWlsTjlJM1BM?=
 =?utf-8?B?L3pabm42NDgzNVBQK3VsWUFzd29lcGtSZE9yZnZXamNsNkZqa1Y3NVZHMy94?=
 =?utf-8?B?eTBnaWU4SmJHQ2htR1lBbnA5UUsvNmtHaXBpbExiQWhMTnMwTnZJNmx3ekVs?=
 =?utf-8?B?NGg3R25TZitEcHRFQVJleGVoV3lBQnJOTjB5dkN6NmhFTkdTNXo1U2ZVaXRE?=
 =?utf-8?B?Z3RwT2djYWovVkJjdyt4NndNVWRXUWZwajRhZzZ6amtLK2FGcWtRNU5vSnA1?=
 =?utf-8?B?bUdTZFNvaGlKMGMrS2FlSmZRVEoveStIeFQreEcvTVQ1MzZkUFZ4bmwrK0hX?=
 =?utf-8?B?V2Jva3NhdjNrNGIrVzYxN1lEeWlQRnVHZFVsdEJEOVJ6M051Wk5haWV1OWQr?=
 =?utf-8?B?emVDQkZhTUJydmYzTThNVDdyMkluVGNVb3h3MWRyajR6SzZxYnFXUTJmTW1D?=
 =?utf-8?B?ZnRVSS9SZEN5T09yUGV2UkRPQWhvbVhYVUtucURtd2Rnd1hucFljUFRTRlUr?=
 =?utf-8?B?QVYraVZsZWRFTzRUNXNXYmc5S0VWRStQbTlIMGtiaU95d29ubG0rcWdIck9s?=
 =?utf-8?B?bXFHeThvZThMRXFwWkQwZXhreUdQQ1pXTFBYS0VGekw5N1VFNjA0bkIwbmJC?=
 =?utf-8?B?S3dQSGVLNC9jak5JRzVUYnY3N0o1ODIvTDg3TEVpSEtmUUdwWUNQT25IbXg0?=
 =?utf-8?B?Uk5lYnZTWXc1ZnFJdmViOEx1QXZ2TUQvU2VYWUgreWVWUnk2Z3Z6SDN3bUFz?=
 =?utf-8?B?THFyZXZRaWR3NHJWSjZseWsvbkM4N0dwcnMxSlhybm00cjJHOVFRcmJQTDZY?=
 =?utf-8?B?UkEwczJwZkwvVEkwdEg4VExMY2d6bXVDaTNnZ0Z5aUpVcFVHTGFKL3F0WkR2?=
 =?utf-8?B?V2JUbDhjaGowRkM2L1ZnZmxJR2F4THhXclRncjBjRzZrMVhSUHRQY2lyNE1t?=
 =?utf-8?Q?6ftdDKQxdI4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGh6UXpXNnY2cjVhM3hJeTY0cHlMUUtJK3F6WGhYdTRrMGQyamozakxtM2Zq?=
 =?utf-8?B?dW55YmNGODZmdFp4RGZ1S1ZqOStEaWZ1K1JEbzV6Rk94bzE0L2syYUNrY2tu?=
 =?utf-8?B?Vi9ad1dhYVRlTGl0Ri9GcWI5YWM2NHRGNk1hKzlEMVYrSzZRMnZnY011dnpz?=
 =?utf-8?B?b0U0c0NBOVI5WC9iQmx5eGg0Wk5zczZXdngzaW5ObTIrcTh2ZktnSDhsc3Vt?=
 =?utf-8?B?UWdqT25qeTJ0LzhmVW9pTjVPMm1JOS9TVStlN1p0M0s4YUVlMXh2bFRaKzFo?=
 =?utf-8?B?MUI0WXhPbmlSVzNObHpSVG9QYjRhQTJpc3RTMFZTcXZmU0kyYWppWTRQaC9T?=
 =?utf-8?B?d3NhcXFXdkljL1lqdUxjTXhhSEZOWmFSR0VIWFNwSWR1WThPbWtsZTA1SUly?=
 =?utf-8?B?ZWdYK2NtVGkzYzFzZnA0bER6S014SHdqUHVHNkRoaDFEV0VIOEtDY2w1RWQw?=
 =?utf-8?B?SWVFcHdDcC80NjM4cTM0bk9TQW16VFVrNmIxV2R4U280VDRSaTF6QUkzQkRC?=
 =?utf-8?B?M3orcXV3NlVoZU9ZTEoyd3lNY3d5QVBEbU9RYmh6QWE2MzhSTnNVbXg1NzNr?=
 =?utf-8?B?d1VrcE9aRmR0YS9nRXZiYzNPZ1dhc1luSXNmd1BNb2xVOVB0MzJGckYyUmNs?=
 =?utf-8?B?UVpYREVqakpvTWI0Y0kveWRZOUp5d25mejN0NVlMYVkrdE9KcnR0cU5TWndt?=
 =?utf-8?B?Rk5pTXBROEhrVkVkbHZ4QnRRRDMxbW5SOUZZSmowb1pqTmw3UCs3Vm5BZmNx?=
 =?utf-8?B?cWFpVmZudVYyUkw5RkNMc2pCVFJqQ0NSei8yMFl3R0ZhM3VzMG1kVks4UmR5?=
 =?utf-8?B?Z2k5YmJ3Z0h0czNoYjdySXQ5aStLQXBpTk5rUVlIeVRtUFV4NVFXeWRlcUk0?=
 =?utf-8?B?S3M4aTVLaXlacktMekxLUmF0ZndSK3duaXhueWVsbHBFa2tNZXpMVFBxTVZp?=
 =?utf-8?B?NURUVTlYQ2oyWUZPOUNoTC9DNkRiWEhDSDduTFN0YU93TzN4ZTdoL2pHSVVv?=
 =?utf-8?B?aUw0ODVsekJNM2loWktzUzYxYnlEVGlhbFRkbkduaEpEcUxCRnBMSGZsREsw?=
 =?utf-8?B?ck52aEppTkRKSHd4TE96Rnd0QVdhaXVJTUs5QXlpMWxRd2RHMXJ2dXdVYUJ6?=
 =?utf-8?B?NDRSS1JBZncvUVI4d3FLNmZQc08wdzhFdzBINnliYzBsYUJMZWdBWHpLNTlV?=
 =?utf-8?B?TXBtOFR1d2lqWFh6QjhNNElTQzBVYUlqM3BtdFRsRU9yYk1EeElXNzlLeGRO?=
 =?utf-8?B?Nytad0Z5UlJySzgwNC9oMnRlckVlVW1uUGNFV3d5WEZ3WVhlRVlmV2ZhdHJZ?=
 =?utf-8?B?ZjhlOVdnTDFKQS90MWoySU5KL211NDNiWFliMjJ6ejlUQ2lKMWZnanJRaGR5?=
 =?utf-8?B?ZTZacTYvMXU1NWJ0b2Z2VGVCaGk3WHpRL1RGNERhVGNFRnRoajd3YUxZbzQw?=
 =?utf-8?B?ZDRlOUhJcGtkU1BzdFBqTHY5akUxbWd6Wng5NFFWdXNYbkN0UGJMeHlKc09X?=
 =?utf-8?B?TSt2MTZWOUI1WWJhRHhUUHdMdmI5L3grUXJxcER1Z0RBTmRMcURVdm11YnBX?=
 =?utf-8?B?ZEdjbFJVSm41dkZvYnBXSzQ2VGJ0OUNHNlRhelNvUFQ0UmVNNjNXd05wd0NF?=
 =?utf-8?B?QUluUWNuejlFRHc5cVRjZmJhVmJTUEJqOWY3T3BwbFV2cDh2RDJrOXF2dHcw?=
 =?utf-8?B?VHpxaVViTEczZ1ZWRWdhS3ZMVjRYRWJRRGpNV0ZRaXVlbGlDQzBrNHhGNXdh?=
 =?utf-8?B?SGI1MURvL2w2a3JSVFNvM0Zoem9QNkkwdG1ZYTdPQjNSdVp3NkNFMnBEZVFU?=
 =?utf-8?B?ZlNlWWlzMk1nSmdERENpYXRQbFNkOU90b25pcnBJNjJiTGozS2d2UFhoaW5a?=
 =?utf-8?B?eTFocHJodnYxREhoNTcySWgxbHpvenZ1VU9HOFlaVXI4OFdKbVZ0UkI5UDRi?=
 =?utf-8?B?WWNhRmcweXgzbDVESEVXTDRCNXZpNlcvRU1hbkk5LzBNbThpK2d0a3FpZDJw?=
 =?utf-8?B?cExnMTNpRnd4Vkd4Qks0VldpWlpJclhRajcrOC9jd001OWl4UWhybldZZGkx?=
 =?utf-8?B?VEoxdGUxalo2ajZmSnptQ0RSQklreHJ5aVgreE1rMGU4Nk9zMGcxU0lMK0kv?=
 =?utf-8?Q?Nk6c=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70fcb4aa-513a-4de0-f1f2-08dd8c85bc2d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 10:06:57.3982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NEwNEw7/7kHWMfPj1sHWNwM414rzPyqSwdRiQ16JTHfegXiUdK8Po94yyASEILXu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8129



On 29/04/2025 17:20, Luca Fancellu wrote:
> Provide a function that creates a pr_t object from a memory
> range and some attributes.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v4 changes:
>  - update helper comments
>  - rename XN_EL2_ENABLED to PRBAR_EL2_XN_ENABLED
>  - protected pr_of_xenaddr() with #ifdef Arm64 until Arm32
>    can build with it
> ---
>  xen/arch/arm/include/asm/arm64/mpu.h | 11 +++++
>  xen/arch/arm/include/asm/mpu.h       |  4 ++
>  xen/arch/arm/include/asm/mpu/mm.h    | 10 ++++
>  xen/arch/arm/mpu/mm.c                | 68 ++++++++++++++++++++++++++++
>  4 files changed, 93 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
> index b27fccd77550..39233b43a5aa 100644
> --- a/xen/arch/arm/include/asm/arm64/mpu.h
> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
> @@ -3,6 +3,17 @@
>  #ifndef __ARM_ARM64_MPU_H__
>  #define __ARM_ARM64_MPU_H__
>  
> +/*
> + * Excute never.
> + * Stage 1 EL2 translation regime.
> + * XN[1] determines whether execution of the instruction fetched from the MPU
> + * memory region is permitted.
> + * Stage 2 EL1/EL0 translation regime.
> + * XN[0] determines whether execution of the instruction fetched from the MPU
> + * memory region is permitted.
> + */
Why do we need this comment? If any, why do we need EL1 description if the macro
is EL2?

> +#define PRBAR_EL2_XN_ENABLED  0x2
> +
>  #ifndef __ASSEMBLY__
>  
>  /* Protection Region Base Address Register */
> diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
> index 0e0a7f05ade9..7b82f10d336b 100644
> --- a/xen/arch/arm/include/asm/mpu.h
> +++ b/xen/arch/arm/include/asm/mpu.h
> @@ -24,6 +24,10 @@
>  #define NUM_MPU_REGIONS_MASK    (NUM_MPU_REGIONS - 1)
>  #define MAX_MPU_REGION_NR       255
>  
> +/* Access permission attributes. */
> +/* Read/Write at EL2, No Access at EL1/EL0. */
> +#define AP_RW_EL2 0x0
This macro and the previous one are used only once (I also checked your full
tree) and cannot be set by the caller. What's the purpose of the macros then?
Why can't we set these values in pr_of_xenaddr() and add comment next to value
there?

> +
>  #ifndef __ASSEMBLY__
>  
>  #ifdef CONFIG_ARM_64
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index e2235e568e81..296fe74c5d61 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -75,6 +75,16 @@ extern void read_protection_region(pr_t *pr_read, uint8_t sel);
>   */
>  extern void write_protection_region(const pr_t *pr_write, uint8_t sel);
Here and ...

>  
> +/*
> + * Creates a pr_t structure describing a protection region.
> + *
> + * @base: base address as base of the protection region.
> + * @limit: exclusive address as limit of the protection region.
> + * @attr: attribute index for the memory type.
> + * @return: pr_t structure describing a protection region.
> + */
> +extern pr_t pr_of_xenaddr(paddr_t base, paddr_t limit, unsigned int attr_idx);
here. Please don't use extern in prototypes. It's not needed.

> +
>  #endif /* __ARM_MPU_MM_H__ */
>  
>  /*
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 40ccf99adc94..2e0aeb486ff8 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -9,6 +9,7 @@
>  #include <xen/types.h>
>  #include <asm/mpu.h>
>  #include <asm/mpu/mm.h>
> +#include <asm/page.h>
>  #include <asm/sysregs.h>
>  
>  struct page_info *frame_table;
> @@ -151,6 +152,73 @@ void write_protection_region(const pr_t *pr_write, uint8_t sel)
>          BUG(); /* Can't happen */
>      }
>  }
> +
> +pr_t pr_of_xenaddr(paddr_t base, paddr_t limit, unsigned int attr_idx)
> +{
> +    prbar_t prbar;
> +    prlar_t prlar;
> +    pr_t region;
> +
> +    /* Build up value for PRBAR_EL2. */
> +    prbar = (prbar_t) {
> +        .reg = {
> +            .ap = AP_RW_EL2,      /* Read/Write at EL2, no access at EL1/EL0. */
> +            .xn = PRBAR_EL2_XN_ENABLED,   /* No need to execute outside .text */
> +        }};
> +
> +    switch ( attr_idx )
> +    {
> +    case MT_NORMAL_NC:
> +        /*
> +         * ARM ARM: Overlaying the shareability attribute (DDI
> +         * 0406C.b B3-1376 to 1377)
It's a bit odd to provide here the manual for Armv7.
Also, our general advice is to use the latest revision.

> +         *
> +         * A memory region with a resultant memory type attribute of normal,
> +         * and a resultant cacheability attribute of Inner non-cacheable,
> +         * outer non-cacheable, must have a resultant shareability attribute
> +         * of outer shareable, otherwise shareability is UNPREDICTABLE.
> +         *
> +         * On ARMv8 sharability is ignored and explicitly treated as outer
> +         * shareable for normal inner non-cacheable, outer non-cacheable.
> +         */
> +        prbar.reg.sh = LPAE_SH_OUTER;
> +        break;
> +    case MT_DEVICE_nGnRnE:
> +    case MT_DEVICE_nGnRE:
> +        /*
> +         * Shareability is ignored for non-normal memory, Outer is as
> +         * good as anything.
> +         *
> +         * On ARMv8 sharability is ignored and explicitly treated as outer
Does this Armv8 comments make sense? We don't support Armv7 MPU.

> +         * shareable for any device memory type.
> +         */
> +        prbar.reg.sh = LPAE_SH_OUTER;
> +        break;
> +    default:
> +        /* Xen mappings are SMP coherent */
> +        prbar.reg.sh = LPAE_SH_INNER;
AFAIR MISRA C requires every clause to be terminated with break.
That said I don't remember if we accepted this rule...

> +    }
> +
> +    /* Build up value for PRLAR_EL2. */
> +    prlar = (prlar_t) {
> +        .reg = {
> +            .ns = 0,        /* Hyp mode is in secure world */
> +            .ai = attr_idx,
> +            .en = 1,        /* Region enabled */
> +        }};
> +
> +    /* Build up MPU memory region. */
> +    region = (pr_t) {
> +        .prbar = prbar,
> +        .prlar = prlar,
> +    };
> +
> +    /* Set base address and limit address. */
> +    pr_set_base(&region, base);
> +    pr_set_limit(&region, limit);
> +
> +    return region;
> +}
>  #endif
>  
>  void __init setup_mm(void)

~Michal


