Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5286194F24C
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2024 18:03:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775677.1185907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdXVD-0007mk-BA; Mon, 12 Aug 2024 16:02:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775677.1185907; Mon, 12 Aug 2024 16:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdXVD-0007lG-7Y; Mon, 12 Aug 2024 16:02:35 +0000
Received: by outflank-mailman (input) for mailman id 775677;
 Mon, 12 Aug 2024 16:02:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zvba=PL=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sdXVC-0007lA-IR
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2024 16:02:34 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20627.outbound.protection.outlook.com
 [2a01:111:f403:2412::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 475ebfcf-58c4-11ef-8776-851b0ebba9a2;
 Mon, 12 Aug 2024 18:02:31 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SJ0PR12MB6902.namprd12.prod.outlook.com (2603:10b6:a03:484::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 16:02:27 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7849.021; Mon, 12 Aug 2024
 16:02:27 +0000
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
X-Inumbo-ID: 475ebfcf-58c4-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NH4L/HhV5hcBOo4uUToN70VZgy0B+KeOASudh2WPbGvkAbCPdl1CVIDsdbRkzXXMdxfVLZW2q/1Qnw9BgQyEQ2R2brVxe2p9ir+DTcxhoZZxKIJ4k+dEnXx9htZ0kmbO6yIh/pkJyZxsyHOp5rWHk+ov+YNq7/E2E3gGIfuXMZnJ/4ZNUnEdGMDOw7xEPzlV1bNf9E6QK6qSdm5vxhgmUm6ZtJxE9udvjgB/QM5J7xA1r1eAagwJ5rqFufv+t6s2FH/YsC6EU6ZaAEPCB6P0j4TYJA734K1KRe9lvP9HJddPfXk4tfZyeb8r+fEdJWBaRwbxagdQ+Blba4brBfxBJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1zv7eTujslg9st9wOJERPujE+KPIV4AvxSQ14+oEERM=;
 b=aMYrpeDV1FBGFi17ZBVCxAbFdS5aoahm1XUw7FVi9RM4NGbFHoCE6xanU4dmul3VgUAF7kx4jMPUC9uyItFvtooNiOeyc5l6wONQ+SsVx59926ewxfKr/4L5sUnYKARKtsOW5bzpVAZit0faXtJ1EC9tScRxYQAG7PYPeOaySmmzhjcVO+0q5pmSL9uc9BNh1mBLqiMeHIvtmzj7F2NgijEpTmFVsTKSi/U6hbH/lOb2JHRrqCsn0g/b+h1LPo1FWfiiuD0KvkSE+TZnRYhJlJJ4N+nq7w29M4m25qCQvUE4MHIsjXQc6rA72R1A/EZBpMn44TGVoriCnPC4pHQ7lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zv7eTujslg9st9wOJERPujE+KPIV4AvxSQ14+oEERM=;
 b=bkyr31hYW6zawqXEczYQiLBvASSQCS5sJZHq8Fai5ZMaq207SUoZwrlPioY6l2UJHXf95rAEdhOrRDk98Kqi+MtPKeUt0el/60ThAhvs3p5Xj8YEdp07uZkPBhCKcGSYwNv7bw/j6DCylx7hfA2SGUsmE3MB0+/Fe1RrtCsAVMg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <c5c0a198-97ca-4779-8d1e-91d01b3650ff@amd.com>
Date: Mon, 12 Aug 2024 17:02:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] xen: arm: make VMAP only support in MMU system
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, Penny Zheng <penny.zheng@arm.com>,
 Wei Chen <wei.chen@arm.com>, sstabellini@kernel.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
 julien@xen.org
References: <20240808120936.3299937-1-ayan.kumar.halder@amd.com>
 <20240808120936.3299937-3-ayan.kumar.halder@amd.com>
 <bc643306-a41a-41bb-b7b7-b7c67f9e5bdf@suse.com>
 <3c491d8f-6180-46d7-a996-049df88a023e@amd.com>
 <724aa3bd-26a0-4a01-8be5-69fa838ee9ba@suse.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <724aa3bd-26a0-4a01-8be5-69fa838ee9ba@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0097.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::13) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SJ0PR12MB6902:EE_
X-MS-Office365-Filtering-Correlation-Id: c80e13c5-1931-4001-9e86-08dcbae82985
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWw4aDN0N3JUNzNUUFlUY1JVQnRYdlFrVDVtNkM4azZHejhKOUExdDlibERt?=
 =?utf-8?B?Q05iNDBKSEVYc3NUWGJlQmpvWDN6NVZJWTRwT21sM2lldHkrZWdmTFZKYUlD?=
 =?utf-8?B?SVNQS0ZPcWFqNVdURlZCNmZJVVNSdmdhVWwvalNEM00wMndHVklVQkNFNm90?=
 =?utf-8?B?RzlSTmx4YVJuQVd5aG1uaDRleXRzOWY0WkxKd2RlMTNWZmNvYjFZMGlqdU5R?=
 =?utf-8?B?K1BFK29FTDc4SXpIU2MrU1FjSzQyOXpLTHd0Um5VZGxJZ3p3aHBweE52aGY4?=
 =?utf-8?B?dW90TTliWUVJQ2Uyem4rWkFPR0dVNC9tUjNGUUlXZTdHbHRzazFTdXQwZE5w?=
 =?utf-8?B?KzBlN0RqTjh5bHJNQU02enp3L0p0Y0djSzB3VWdRenBGSng1ZkpnVUlvZm0r?=
 =?utf-8?B?QlMwTzk2Zy8yQkk1Uk1ScUV6VXZkclltNzUxQW5FYmdBZVg3YlFLaStGTk5W?=
 =?utf-8?B?SjlVbENiTkpPUWdsc3JmVUhsM2lqRjdTOThiRENFZTQ2L1VBcW9yd0xZbFNN?=
 =?utf-8?B?TlQyQkZIZDMyZk9EMmVjQjdmcEF4MHRPeHg2RS9OSjd6YWxKLytJRVBJcWlR?=
 =?utf-8?B?ZUpmRUxVeXE1bG03U0tNRUZlbDRWQjRQbDVHSkZ0OEJuTHZUWVFHSk1ZWU9Y?=
 =?utf-8?B?QjFKVHRYWlJuczh3YkxCeDM1aTZrZ0RZR2o1VktQYTh0ckhJckwwanI5dm8v?=
 =?utf-8?B?UHVWRHZlVURob0NGZUpublpJeG1ac04rM3QxRUxwaWhHbDZjaHZvbzVlaGYz?=
 =?utf-8?B?ZEFQUFRBNVhEL3pwTGpTNkNLZUptQXdyeFVmMXYxZ0Z1VlJoTzl2WUNoLzhT?=
 =?utf-8?B?TmRhbS9UcGhCTDZyL05teDNXbUlFbmVnVkRtRksvMzBSV21WdllwRW9xNFdt?=
 =?utf-8?B?bW1HejZlbVI4R3puSVFvSmJ0cU9UK3hFMmx6SXZXM21kZk9jeGNVQ0lsalB3?=
 =?utf-8?B?SktZYmtPZnBXbmlaOVhtVEVNcE1PbXQ0eEQwdmdhQTYrN0trem9yZW5vTlNQ?=
 =?utf-8?B?TjRpWDZNZzFzZG15K2FrWDlLRHdEOXJxKzE0dG50S3h4aXE2dXZadWhLQWN0?=
 =?utf-8?B?K2RWZWRoOGk5MlVWT2hPWWhhQm4za1d6Q0NLb1hTT3hMb2JWWHpMT2ZpUnpR?=
 =?utf-8?B?c0tRVVpYcFB3YTlqSHA5ZVRvRXNJQWtzOE9WSEt5T1BmYTBaWnVlSDQrWUEy?=
 =?utf-8?B?S3JTZkk4eTZISTdjWVJMRHp4MVFFek1FM2ZYVGNWR3BpOU80ZzFPVyt0bEFM?=
 =?utf-8?B?dHVRTDZOVUhJdkFRY2t6YWM0TEVVcVpJMklvcStEME82M2o0ZGdGL3RycUlQ?=
 =?utf-8?B?VjZ5MDQ1WmpUN1lXd2N4TDYxUWJzOVhIQmZMVENtdVBLUjBySm91VVo5anZm?=
 =?utf-8?B?eWNnZzErZnJrTXhkbTFhQ0NZTXRPT1hrK3gwMzNHV0pDbFd2NTFYa3J0NXpD?=
 =?utf-8?B?Sk5oQy9LQi9seXM3eThJOEI1MGRGNGZxby8wOXh5dXl3ZDFrQjc4MTZEbDB5?=
 =?utf-8?B?WHNHV1I2cWRFanRLUnltL0I0N3ZvUXI0OERrcXVtQm9PYlNnbGRkQ2tUYlUy?=
 =?utf-8?B?MlNnY281ZUdXcDB1VkIyZ3oyUHNzVG1IR0sza0s0dERFcUJvN21UMHhRaXg0?=
 =?utf-8?B?eS8wNnRPQ0p3VXJ6N0FmYW9jNkZhaHA4ZjF5aWZUWHlqd3gza2FOclNmdFBU?=
 =?utf-8?B?cFg4MnduUVp3ZFplaVJ6anNaSHhtN2dqSjNNazJPZGxHdkg3T3dRS05RRzJv?=
 =?utf-8?B?SVdTaWZwNjZicUJaMnJYSGZVNG1sK3ZSYUM0Wm8xdXQwWnVFMHdPb3FEblhx?=
 =?utf-8?B?RGE3VkY0d0VscE1ibWw3dz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YldCMk9yL05YdkNuY1l6WkFpbGU3VDBsZjBrUXYrdUxrTndENGZUaDZqd3RI?=
 =?utf-8?B?ejh6THR3WnptWmpxd2Mxbjl6eHZzZm94bmNac2FIVVB3YWJ6THMzbnNwSXFG?=
 =?utf-8?B?cTRVc0FxOWdjV3JnSjd1NmswazM1d2NZeXROV2ZGc0wzWkJWN215aXo0Vk9w?=
 =?utf-8?B?RTRQSGdrYVVyYmZ4UmxZc1Vob0M3VVIxVzBuMWczdk1BbDVnZHppU2kvMVFK?=
 =?utf-8?B?SVlFUE95L0VnNGpZWW9EWG92QXpqSUFNYjJQU3ZyOVpMWk9jMWJZckNzTVhZ?=
 =?utf-8?B?N1A5cndXVFFYdEpzVG9iZUdUcFprQUs3dEljeGllcUFXeFgwdFpmWUVnZThz?=
 =?utf-8?B?WFJpTEJHYzA4NVJ6Qjk5dHZvengrZVIzMUJUMHNQVW1XYzFCa0VqbVMzUzhl?=
 =?utf-8?B?YmxWZUVHSU5weWpNdi9GdjNkeXpyY2FBOXJyYXppSjlNUzJGMXlFVUNlVWdE?=
 =?utf-8?B?VnMyY3ZQSVAvSkhaejM4eTl3WC9Oc0tiaFVxT0lSUjBSdkFrWDF4QndkczNt?=
 =?utf-8?B?SXhkM25FcUNNVGZKdTBIN0xGSFVoMzgySUdwUU9MY1dabXdoMEJoZkR6aVVa?=
 =?utf-8?B?YU9xRWdPNWtNQXBwZ0ptQ0FKQU9zSlp1MTc2SFJScVJIOEQ0NnE4N2hTUCsw?=
 =?utf-8?B?MlVxYmthTHE0ZU5Tem9BWWcreU5uaHYvcWl0T3JaOHczUU15UmQ0QUxscGo1?=
 =?utf-8?B?bGlKdjVoelliYzJNaG00clNVVFlPS3k5MmRRRWNKMHpSZVIvMjQyN2JDZkRj?=
 =?utf-8?B?cGsyd1dVT291NXM2eFN4b21ic21YNllObUsxUmk5UEhlU3lrby9Xdjcxa1A1?=
 =?utf-8?B?MzdlTmVibmVVL0hUWlJtUW5USE9kUS9WVEpMTXZhSDMwaW85bEh6TDVqZytk?=
 =?utf-8?B?TFZDSHpUNkorU1JjdzVnWUt4WnhDUml1cG5Xa29UTzl1a2FSa3VBYU9JSFdU?=
 =?utf-8?B?d1RNczJMY3dtYnY3ZVA2eVN1aVdSR1g3dlhMRCtaZS9ZYzFWRW1JSkVPNndC?=
 =?utf-8?B?cHZXUVE1SnVIZ25TYTFrd2NhdEY2bEhlUG4yYk1yQUxvNFdQMXdyMW8yNjNq?=
 =?utf-8?B?R0txV3pldXp4WmExS3JudXhLTmdKWWJXUm9ReXI5SFJPYWxoU3VGUHZuVjlm?=
 =?utf-8?B?VlE1UE42VjJvTWgySnFyU1J5S2p6RHFJUndEZHNkT2ZYNUFSY3h6RlcwQ2sz?=
 =?utf-8?B?eTA1L3VDOUg1UWo3MllRa3l6eXVqck96NjVMYUlTS3hLREQzUWV1aUxCNFJZ?=
 =?utf-8?B?d1dLTXVJVXFORzRjWlc0cEtJMnhaTk9oOEUyMlRaNEkrYVNEQ1RKc0xid28x?=
 =?utf-8?B?WTBJOXVmeUxZbWY4VnAzcC9jRVA1eXU3Qm15Tjk1cjQxNDQrMUxlcTc4bERt?=
 =?utf-8?B?YXlCc0FYb3dTRWIrM21rMmlRWGhpMmwvSTdnbmxzVWJEdUk4a2xIZnF2T1l2?=
 =?utf-8?B?dHNuY2NvTUUrNm9EdVNweGxwOWM0aUFJQWc0YndVQWJ1UXZwbHhYclVjV1lH?=
 =?utf-8?B?eVloSzBHYTlPUjdYVjcwVkJaYXJldnkzTSsvRkZZYjgwMXZXMzJad2dYaGp2?=
 =?utf-8?B?c044cktkYzJWSFdQV21QM1RtY3o2MFVwcy83MzdpUUFvTDJQUFRGKytIQUp1?=
 =?utf-8?B?dklJdHVxemhkYlM4M3BsSzNseThiQnBPQk1rRTRxKzNnRlFpSW43SzB2VEZq?=
 =?utf-8?B?UFJHcG95Z0cvSlhlbmd6V2JRREdVc21zNW5TQ3ZCaDRzM012aHc4cC9CSWl1?=
 =?utf-8?B?NG94NGZsSWZrQ2lSeENURjZxVGRBeGV2OC8rYW15U3BqdDRieFdSOUVRK0VU?=
 =?utf-8?B?UjZSTkVoeFFISmRGdWRaeTRSOUVFN3FiakQ2aVd4VUtOOHlJZC9YYWpPVEQw?=
 =?utf-8?B?QlpVRUNyNHJENEQzc0hTTXIzLzQ2REJoaDRjRGZidXFWSzhxdXgzMUpTQ2xF?=
 =?utf-8?B?UlZteGVsRHcranNqZWRJWlBQY3BtMS9aTnVWWDk2dEF5anByZXE0bTBWMEJs?=
 =?utf-8?B?d1lPa2dHbmZEaHkzeDR6bFJuSTFSTFhjcS9WQTIvMGlDbUJzOVZaK1hDdGha?=
 =?utf-8?B?LzNCQ080eXphajh3WXFYRGc1MHdRa2xlK2VTRHFuREZwOC9zSGVXUHB4SVBn?=
 =?utf-8?Q?v0sy6+I1NOzWEINxCQV8HKhAE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c80e13c5-1931-4001-9e86-08dcbae82985
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 16:02:27.3992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z1gi+YXzzWKHUglwu5xcQFZpWoLMHW69sfNP2YqNR/ikQD7nxUNbSHdYhDhYQHuPm193yLwNH6CVWC5OKomH5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6902

Hi Jan,

On 09/08/2024 10:34, Jan Beulich wrote:
> On 08.08.2024 17:50, Ayan Kumar Halder wrote:
>> On 08/08/2024 13:49, Jan Beulich wrote:
>>> On 08.08.2024 14:09, Ayan Kumar Halder wrote:
>>>> @@ -58,9 +58,13 @@ config PADDR_BITS
>>>>    	default 40 if ARM_PA_BITS_40
>>>>    	default 48 if ARM_64
>>>>    
>>>> +config HAS_VMAP
>>>> +	def_bool y
>>> With this being always enabled, ...
>> I had to define the config somewhere. It seemed this is the correct
>> place to define as HAS_VMAP will be turned off when MPU is introduced.
>>
>> So, it will be
>>
>> config HAS_VMAP
>>
>>              def_bool n
>>
>> At that time, only MMU will select HAS_VMAP.
> Well, but why is it not simply
>
> config HAS_VMAP
> 	bool
>
> from the very beginning? (There should never be "def_bool n" imo, btw.)
>
>>>> --- a/xen/include/xen/vmap.h
>>>> +++ b/xen/include/xen/vmap.h
>>>> @@ -141,7 +141,9 @@ void *arch_vmap_virt_end(void);
>>>>    /* Initialises the VMAP_DEFAULT virtual range */
>>>>    static inline void vm_init(void)
>>>>    {
>>>> +#ifdef CONFIG_MMU
>>>>        vm_init_type(VMAP_DEFAULT, (void *)VMAP_VIRT_START, arch_vmap_virt_end());
>>>> +#endif
>>>>    }
>>> What about non-Arm, which all have MMUs but no corresponding Kconfig
>>> setting?
>> AFAICS , the only file that is of our concern xen/common/vmap.c It is
>> enclosed with VMAP_VIRT_START which is defined in mmu specific file
>> (xen/arch/arm/include/asm/mmu/layout.h).
>>
>> So, it will not be compiled for Arm MPU arch.
> Yet that wasn't my question. I asked about non-Arm, for all of which it
> looks like you're changing behavior of vm_init() (by suddenly making it
> do nothing).

Oh now I see what you mean. There is no CONFIG_MMU is x86 , yet it is 
used to enclose a common code which is a mistake.

So, we should introduce HAS_VMAP in xen/common/Kconfig and select it 
from X86, X86_64 and Arm.

Is my understanding correct ?

- Ayan



