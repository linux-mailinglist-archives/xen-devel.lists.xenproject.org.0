Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED4BB09554
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 22:02:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047382.1417858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucUoW-0006C0-VS; Thu, 17 Jul 2025 20:02:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047382.1417858; Thu, 17 Jul 2025 20:02:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucUoW-00069u-Sr; Thu, 17 Jul 2025 20:02:44 +0000
Received: by outflank-mailman (input) for mailman id 1047382;
 Thu, 17 Jul 2025 20:02:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gTIS=Z6=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ucUoV-00069o-Jt
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 20:02:43 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2418::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe92449a-6348-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 22:02:40 +0200 (CEST)
Received: from CH0P223CA0008.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::19)
 by BN7PPFD3499E3E3.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6e3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 17 Jul
 2025 20:02:37 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:116:cafe::31) by CH0P223CA0008.outlook.office365.com
 (2603:10b6:610:116::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Thu,
 17 Jul 2025 20:02:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Thu, 17 Jul 2025 20:02:37 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 15:02:29 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 15:02:19 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 17 Jul 2025 15:02:18 -0500
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
X-Inumbo-ID: fe92449a-6348-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jXUW4TK/TX5tPlrsMIZ0g+qNwjzVMbwiqBIglwH32NYPwOePX/0iJjG9WgxyhF6DsLfOCJrPOjN08jVsshbzRaqcOiiTgxfZqGGNCezu2JDyss2SjY4DJra4SHEEYoq7i2uhZiBL4GE7RwrGMuTCK6TD8sBiHz2BgeWAqgg/ob5BFKF6C9rsvb/P4jwnD9KcgCf4nInEMGh/mmk6WrtAAC5PkBPk7PCucYE7t9QKyV4q6Zf8w7topAV+3XueEeJv47xmmT+zekH2SPTCoNvtsIYkV3yyc8hcpBjMOHJKaVrWe5vXPqDI3Mx8Q58Cr/fo8yFetAiqGDdkFohL5Bebnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4jSH3SslUkUMZYNYcUqPeXMhxtkwbKgaKG3ZL4+Zpg=;
 b=v/OROobeHPujGm4YUr9+e+36s3ody3i/mbBA+ESc7t2538eOQsjTP+UtcELZshgxeLBkSpWXcHBOAjHvCKTicQrFwlSwLyqHr8tzOFRkQ+2h/5k+fgwayJbxUivElLX0Foto+H5y85pUJu5i+a7aOW5P7yJWPanjifBfI5MRASZYU9SDbAHnMBbzz68nUWyK/7YWsvpV2lSaoXbOxFD0BDGpZiGV7QjjaSv+S5ntZlIzD1bZI9WcBTm2ttxypINx28B2gZSdNR7eITtPzNmGBdS56NgBJCwM/4/+rFqfPE+ajq77LvYjdrjnsZGX6FbvEDZOrsL2Ww92RcSveoYAMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4jSH3SslUkUMZYNYcUqPeXMhxtkwbKgaKG3ZL4+Zpg=;
 b=FqonovzwQIa9gA8rLbHlQah/CA9RtEOxGJrjtG9svbC3CRFBNmB00jnDAXiO1v4NjrirgUTYBzWD8xBbMkyUR0kBmBAKF6Xyr3t6dGoav74SokZ00O1IvMABmoEeFBtvYAJUj4MfHqhzrcqC01zwJeoH/g6nhUz6ismNt3DovZU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <fc3b75ec-e2c9-4749-92d0-6b046ee0f725@amd.com>
Date: Thu, 17 Jul 2025 16:02:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/17] xen/dom0less: store xenstore event channel in
 page
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-10-jason.andryuk@amd.com>
 <eca10872-aafe-4990-a86a-1582e87a6af2@suse.com>
 <b408a253-d483-4a72-9691-b7ef724eaab6@suse.com>
 <a84facc6-ea1e-4418-9c4e-e223b3ae204b@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <a84facc6-ea1e-4418-9c4e-e223b3ae204b@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|BN7PPFD3499E3E3:EE_
X-MS-Office365-Filtering-Correlation-Id: e11dec78-2ea0-429a-3879-08ddc56ce0bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TXphcFlaWExpcXZiVVIzL0RVbGNFdk1YVXoxdkl0dEZSK0YzdW9BRXhTNDk3?=
 =?utf-8?B?S1JLakdYZzJ0THhuM3lTeHdwd0VuR0lEVTlLbk01bFcxM3A2R0hmdE02cE5C?=
 =?utf-8?B?SUJRZXg1NHRNejlVU0tRMmtXM3k1a2tLaE5DL0szZ0NLWXkzZUFicHUwYVI0?=
 =?utf-8?B?c2loKzJsWDNpcmJTWHNHdUdSbER5R0FFV2hJaGt1YnhoVWdsTGwzMDQrNFdF?=
 =?utf-8?B?MGptZTlYblVrelhwbmFjQ0NwUDlVVUlQRmVxcnFjTDhjS3NubGQ2Rlp2OGVD?=
 =?utf-8?B?cE5WOExDR29TNnVRRnRXV0p2NCtTSkY3R1h5NVZJaFdvQlVwWjcvcnlzRk5s?=
 =?utf-8?B?UVZOdnU0MlRXQ3daVjhjQ2xoZ2lLKzlqYzBpMldjWE5pT2VyUTlvMmhzczF6?=
 =?utf-8?B?TFN0bDNrdmhZQmFxLzZxOUpaNktTK2l3TGh0NUJhNDJIR1duK2xXWDJiaFVD?=
 =?utf-8?B?MDIrUUx5T1puMzJNV3VocFNTMUk4eFFUZW9JYXVrcWdyb2JVY0hiUjYvUVph?=
 =?utf-8?B?TjE2RlhhcldyRTg5eE1ZQXNmREFUZDMyYkFBWFZYdHhpQUh1T3ZoTkhSVGRB?=
 =?utf-8?B?aHV6cUpEd2lKT2hUK1U2dHdJc2VPODlmOFljTjN4TmI3RmE5M1FTWmlKL3hi?=
 =?utf-8?B?QzhoTVdoMmE5dWYrRW1BYVdNL2RnalQwNEhBM0tkZ3VzMFdPclhrUW0xZ1Nx?=
 =?utf-8?B?cUZVQ1RNenphV0NuMEh1SXBrMVRNV0s3TXRGcEFwWm5KSW1ZbDl1N0cwUzdX?=
 =?utf-8?B?TlVKWE02QXRaQkZUM2FoNXhIbzl4V05hT1NGcXIzbkdxUzdKRUFCK1NFY0JC?=
 =?utf-8?B?cnk2cjRzblVVU0o5UDZ3RW50N2ltYUVXVFg1andYNVozRENXdTlUTmd1UWp6?=
 =?utf-8?B?OGRROERGNGFKNmxQR0FZUzd6ZGRnT2ZYVE5JWnRsOEN3YkVoRDFveVJhTUE0?=
 =?utf-8?B?NFZ3OG00c3hvbzI4MTEwRW9ibDVBNGVaVXIyVDg3VVM4ZUlGc0U5SmRYMU5F?=
 =?utf-8?B?ZHJUUEgzbTFCVWFaVkZPd1dSQlZJazd5VEozK21hZ0cydXQvVDR0VFRIL2J5?=
 =?utf-8?B?UDRaWForTWZwand4Qk1Wd1ZtVkxOaUMxaEUwZE9xSmtTZTA5S05oejdYUlBJ?=
 =?utf-8?B?Z0JZTUYzSDRzTkZSVnBETWpjKzJRYnU2aTJOeUhrRUV1ZkZha1VOSC96M0cw?=
 =?utf-8?B?a3Fzb09sbGN6aUFuWEw0QmNhL0VYb1hOclRMQzdEdFArQkZtbGc1MmRhRkY1?=
 =?utf-8?B?ejJnUmFDWW53VFNOVnZTdXdscWVncEg2OW9ITHVja1U3TW9FZkU3ZS9vRU5w?=
 =?utf-8?B?V09LZ2tMa2hVa0F6VFZYRXpXdHYxR3ExMEhjVk5iT1dmVmVqbzdjVFY4NDA0?=
 =?utf-8?B?aG1FTGd2S0VMM2M3dFJ3SHQ4K3hRcDBUSExIRjdqZ2VwM2Y4bXVBbEhqNGhy?=
 =?utf-8?B?bEhVWWV5WWRPeis2UFFpRU1JY29NU0g3WnVVa3JBQnBhZkhsVzkrSDVRNDhi?=
 =?utf-8?B?ci9ySkFFYllLd2x1U083U2tTZE80K1p2YmxFVFoxRWNTa1VWWUt5SjArSGxa?=
 =?utf-8?B?SDhDYjJ5bHdZZEF6aFlJT3RuWW40TjdmWFRKNGZ3T2c2VkJZMkJJTnBadzdF?=
 =?utf-8?B?Z2prUWduRUdvRnJUMllPNU9adWFMNHpRZmFCalB5Qk11a2Y2QnhCQVZmRUJ0?=
 =?utf-8?B?OElkVDdyQUl4Q1dXelNvZUZTVXhkUXk1OTdhTmNHQWEvZm9WUWNkOWV5Njc3?=
 =?utf-8?B?aXZjNWVEclZYOGl5VkdoVkNSM20ycUwxZkhMT0h1WEtCbVh5L1Y4NnZEL3Nx?=
 =?utf-8?B?UUx5Mmt1S0s1MVZ0b0VldEVoWkIyY2VsZkllYy9FZHlNNlRESGFHRVZuWUpn?=
 =?utf-8?B?R1M4TzBLcEVvU0ZiamZGRDgxUjV2UDJteXFOSnhTRVhtUmd6OStOSUJSSTFk?=
 =?utf-8?B?cFhkaVFTK3hyaktLNVRmZHppRFNEUWJ0M0l0WHVYblBMNTRBMzZwVXg0dE80?=
 =?utf-8?B?ekZ0TDRya3RZTWRTV1VycEN4T2pIeXdGV2RpOWNjb0l4d2RNdmtiZGJabkdO?=
 =?utf-8?Q?mAIGNT?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 20:02:37.3562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e11dec78-2ea0-429a-3879-08ddc56ce0bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFD3499E3E3



On 2025-07-17 02:43, Jürgen Groß wrote:
> On 17.07.25 08:25, Jan Beulich wrote:
>> On 17.07.2025 08:19, Juergen Gross wrote:
>>> On 16.07.25 23:14, Jason Andryuk wrote:
>>>> Write the associated event channel into the xenstore page so xenstored
>>>> can read it.  xenstored can map the grant by the reserved grant table
>>>> entry, and then read out the event channel and bind it.  This 
>>>> eliminates
>>>> the need for an additional mechanism to discover the event channel.
>>>>
>>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>>> ---
>>>>    xen/common/device-tree/dom0less-build.c | 7 +++++++
>>>>    1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/ 
>>>> device-tree/dom0less-build.c
>>>> index a2789e3bdf..284139bf14 100644
>>>> --- a/xen/common/device-tree/dom0less-build.c
>>>> +++ b/xen/common/device-tree/dom0less-build.c
>>>> @@ -26,6 +26,7 @@
>>>>    #include <public/io/xs_wire.h>
>>>>    #include <asm/dom0less-build.h>
>>>> +#include <asm/guest_access.h>
>>>>    #include <asm/setup.h>
>>>>    #include <xen/static-memory.h>
>>>> @@ -126,8 +127,14 @@ static void __init initialize_domU_xenstore(void)
>>>>            if ( gfn != XENSTORE_PFN_LATE_ALLOC && 
>>>> IS_ENABLED(CONFIG_GRANT_TABLE) )
>>>>            {
>>>> +            evtchn_port_t port = d- 
>>>> >arch.hvm.params[HVM_PARAM_STORE_EVTCHN];
>>>> +            paddr_t evtchn_gaddr = gfn_to_gaddr(_gfn(gfn)) +
>>>> +                offsetof(struct xenstore_domain_interface, 
>>>> evtchn_port);
>>>> +
>>>>                ASSERT(gfn < UINT32_MAX);
>>>>                gnttab_seed_entry(d, GNTTAB_RESERVED_XENSTORE, 
>>>> xs_domid, gfn);
>>>> +            access_guest_memory_by_gpa(d, evtchn_gaddr, &port, 
>>>> sizeof(port),
>>>> +                                       true /* is_write */);
>>>
>>> I couldn't find access_guest_memory_by_gpa() for x86. I think you 
>>> either need to
>>> introduce it for all archs, or you need to handle this differently.
>>
>> This code isn't buildable (yet) for x86, is it? There's a series of 
>> Alejandro's
>> moving in that direction, but that didn't go in yet. And even then 
>> aiui this
>> file would still be excluded.
> 
> I think this would need to be explicitly mentioned in the commit message
> then. I thought this whole work would be targeting x86 as well, but I
> might be wrong, of course.

Truth be told, I wrote this when dom0less was still in arch/arm.  For 
x86, I modified the hyperlaunch code to use hvm_copy_to_guest_phys(). 
Looks like Xen needs some unified accessors.

Thanks,
Jason

