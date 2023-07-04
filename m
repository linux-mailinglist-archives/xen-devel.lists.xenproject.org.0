Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 927207473DD
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 16:17:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558397.872456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGgqJ-0000X6-C6; Tue, 04 Jul 2023 14:17:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558397.872456; Tue, 04 Jul 2023 14:17:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGgqJ-0000Uu-9K; Tue, 04 Jul 2023 14:17:23 +0000
Received: by outflank-mailman (input) for mailman id 558397;
 Tue, 04 Jul 2023 14:17:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gy6C=CW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qGgqI-0000Uo-4U
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 14:17:22 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b83863a-1a75-11ee-8611-37d641c3527e;
 Tue, 04 Jul 2023 16:17:19 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by MN2PR12MB4176.namprd12.prod.outlook.com (2603:10b6:208:1d5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 14:17:14 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 14:17:14 +0000
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
X-Inumbo-ID: 7b83863a-1a75-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=enSzB7C+LshLhSkdk39NI2sA19LfKuFPkImqUsLN0MquQT9bJPI1JF9CyxUrcI2dS5EmXX8gQEIuPN3vxUT0KTH2ZpxUnUSxGAt8vtnbRkgKMm9BRgOMYSLzs2nKOyjVdVjnxYChCkyDXIa7uAJWgEjiJq+DUQXpuwhtajZ2D3hwjsZWlYxbL/kMdWjhIMxuurC3fUwI4tKa59/h5V6BoJ67FxVjZe7MBTJVyiwN+TZbKFQeywoHHR+KMp9DeRsnWsHSoAnCKjuTPLuEC9RXm2svBkKRkCYAjKiBfVEjG28UjSEkqaMWMtfC8LH/NyWGcSQqlIdtKyiQnlz+mImt0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NC0QtpFwKtnzvqPqYL1Q9UUuDbyf8nbwSb4gLzA1xhw=;
 b=ELIBtYU0gAzeJ9tO8UiJuUuS6wCuluuuLgStxosTt3Hj2ZF68JDME1vmVKqZTfUFkzLDaLjEjIuCj5iZrKZ27c5ll350XjNorCrue1y4sWFhUUkZwRM13YSLLORr9FBAyRFlUu7o5OsGgFvtcFBA1tIU4iCJk/DFP2ZvHcFQVA77HAHaQ7ylllqSIrlZYrx87+JTlWwAmSBO2/S6KHcEvCJK6mTizYnzrnS3+phknZQcYLEKk1Ekz774VTXhQED0AxoenO5TDOw2m/51+5/GuaFnxtHNxcVw2V0TA62IHc9O6T4cJBFDWA9NWHWGAMa8T3P3U43TwKR7pGXsk+lhkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NC0QtpFwKtnzvqPqYL1Q9UUuDbyf8nbwSb4gLzA1xhw=;
 b=xi4xNXrOdqHFrLALjsIloxc6hpLope8UrCS2lOPnGXOu2gU8xmvAOZy4pAI0/5G5jr7cSBs1eMaU+PDqwG2oaHK7Th/i6PAQxLDxaZcEImZaVHWDFp/K/yNVp5cjUuXLKc+TgGhvz3Y3om5qFxcXW1bIF8tbVWhOiC2VrcVQ7A8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <cd77864c-8e8c-b423-5fe0-53a15bf48729@amd.com>
Date: Tue, 4 Jul 2023 15:17:06 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 00/52] xen/arm: Add Armv8-R64 MPU support to Xen -
 Part#1
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0173.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::16) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|MN2PR12MB4176:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e41b734-22a8-4c7b-e1f6-08db7c995d21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I+yAbGhXr6e/FDg5irm3UpsphngIHqVzH0TAdaW3YkMGdFhbeY8e6CZ/lOQcOYFtnrRWTGiDkzmGsWb/pmRYPL2dV2194monfdlt/t8wQY8i+9XLh8XWiz2IxQN47Xl5JzZigunFj5ztO+jXokSABZERlfQWlQhm9Rm4BOgYvEoQA5KgWI9QhlJhnynDXoboMa1y6fzU7VWWEwo5Z8umoAU5Ow2nLYxZs+qAeYFf6ksFNroSpuu++Pe6UUR/nNtJCBGorqD6DCjb+qwHSajbeSOUq0HqbW3Emj5cyRpPnuz+IZ1dwynaclHPOVq5kdw1A9sjf2eeXiOc/xulGcrnI4dK/IXVK9EW9nsHuGTEkwnPAne00lMEUA3AagDC1sEhczkcnl04qUA3up0XLyafCadTJcKfYfQTIIJ8S2/qfszX6vv4ToXv/Z4uPN33ubB4Urpqnd6HvK41yxaGlDy/b/hAwIqFGuznUFGZ7l7M8fZs9BcG8xyCuGw4Y/XJjW3EKb1jRO0xEf9kStJlESpY7X7GzmwWpO+nxVFVLI1caUg0knN3KFW/MzYGn5jWB1p1GpNtmNlkiPJcJHDmeydCR9XrwTniaf5ogt5ytwh8EAd41TClvw68/DwecoppcTcsqoff8CUvgxaWKU5VplekJkdGfUEzL5sLLKOGXxYhRoDnui12JT2GxU+BtowX7StcCdKPvoXi0SKHwUwCBBDzQeVNq1W8cLoP5JuJ+lkos+s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(366004)(39860400002)(396003)(376002)(451199021)(316002)(54906003)(66556008)(66476007)(8676002)(41300700001)(4326008)(8936002)(66946007)(38100700002)(53546011)(6506007)(478600001)(31686004)(5660300002)(6512007)(7416002)(26005)(186003)(966005)(6486002)(6666004)(31696002)(83380400001)(36756003)(2616005)(2906002)(17413003)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bThnL1NsZ09tTWU2UDJnNGhRSDV0Qk1KVUkyOXM1QWYvelJvWkJ1UHp4Y1Yw?=
 =?utf-8?B?S2RXQ25heGprN2VaWGV3ZUZaVmlwbHlQNGZ1SDBmUnoycmt1cVlDTFIzRWtZ?=
 =?utf-8?B?NG9vZmRLTS9jWDNIRUVWQ0h0NEcxY1p2VWgvOVR1aEpNZzkwbmFHMmVwNXVX?=
 =?utf-8?B?UWdGQkh3bzB6SmhWakdST3BvYkw5aEwzMXhnZURPSmFOemVCOTNncGYvSGNG?=
 =?utf-8?B?clpCNEs1eDlDUWN6RWllaTZNL2pPS2J3YktRcVU1VVJWMnJwSENCU3ZCbUxj?=
 =?utf-8?B?WXlCZFVzbmVHZDhPSmdyeHJIbEZxb0JxMlZ2cVRWYWFpTDBmcDQ2YXhCdHNI?=
 =?utf-8?B?K095aUw3NHJBYjkvY2lreGxQRHU0OEZmTkJURlBUNk53WUMvZk9SdjE2T3B1?=
 =?utf-8?B?SG84QUFhUHNiRGljRG9VTmdXeUtpS1ZiMkdvcEJGWmtFMXZobXpmelM2VEVC?=
 =?utf-8?B?c2U5NXBjeVQzOEZKWndxZ0FYcXdPcTlCaW9TV0NJaGRUanFuQ2dxNEVORDY2?=
 =?utf-8?B?aDlTYTFORm5GaEt1YWtsK1JRdmJ4aWYva05mZ3J5a3BVNHBpc05TcisrWDkv?=
 =?utf-8?B?SVhNM3ZTM0s0blNVWWptNG1EdTdWNW96NUxwalJydGw1dzRkZkgwVGgxYisr?=
 =?utf-8?B?UG92QUU2amFWbGcrdWhMQW9oUzU2d2l1NFVSalhyaUdJVlR3OGZaMDk5SFdy?=
 =?utf-8?B?WE41dGJncEdvYkkwTUZtMFNXclNXc0pJNFExUzR1RU1uMXkrOVJwVDdGRHB3?=
 =?utf-8?B?TDdaYW1CS054VEVBb0pJWE83c0FkS2t5WW5QZGJRUDZVKzJ1OFN6RFBiMUpj?=
 =?utf-8?B?b2FRRUdlNTRlckxHRXVoQXZzWkloSjk5aVVFMk5DVmErZlR4MzlOYlRyV1pM?=
 =?utf-8?B?Y05zd3duVndxS3JjbW82YmlZTThoNEhmdWQrSEduWVJEOXN3VmZzSU1KY1Zx?=
 =?utf-8?B?cVNkUHBDV3VMV242aXVldWNFVFVUSkdSWXN5L21STzhJaEtTN2RqQ0VrazJT?=
 =?utf-8?B?ZHI0T1RTYlQ2Q2pLTVo5ZlJuR3dibUIyYzlqekNyWGRBN2l4SkZoZU5MZHl3?=
 =?utf-8?B?cGRUYlFyK3llTVM3a3VyMDBDQlZUdXd4R2Yyczh3RzN0cDk5SjZlQU9oczFx?=
 =?utf-8?B?NmpvNUUzK2dRMTRrV1ptWjh6eXF0eVJNcWpMNXhLWU53bkVyWTNGN0Zkb2tW?=
 =?utf-8?B?cGJ4VTV3RFRTcGR5cEx1ZWd6RW5vYnUzZGlwTW9RWVR1QWp5OTlvc3dFRGhG?=
 =?utf-8?B?TVhtSWNia0l3ZU10TzhaQ1ZtZ0x5QjRqbEZ1YW16TkxoMkRiblFvZllocTJt?=
 =?utf-8?B?WnF2SGU3YmJ0TC9HVm1STk8vd1dEYnd3VFJrZ2RZS0NjamZvUkVNWVRqSk5j?=
 =?utf-8?B?Tk5vcVJVMlE3NU5BRVIxc3czMld1UmhVYjBjckpEQ0x1VzVvUEU3UEdzUU9z?=
 =?utf-8?B?M0ZUUXdPemVnS2NGV0JhVDlncTRySENyUVdGNUxodndTVnBSZk45cS9MZEVh?=
 =?utf-8?B?ZEVEM2xOeXNsWks2QjhkR1M2NUZIKzF1Tlloa0ZxQUViWkxMa293aFdGQWFa?=
 =?utf-8?B?SjlpQVFrUnZmYUh5bzRnVmJyQ05ORGd2Y3V0R1BFYzM3aW5Sc2FOUzlkZ3M4?=
 =?utf-8?B?RXZVZm9QM3hTV2RTT0IwdmxidlVXSEswc0d1UEhFMnU3bXloVW1JelpCRUl2?=
 =?utf-8?B?bVF0QUNONE1lUWVSOFZhTG43TkpPNHJTQWFFWkh2eVlTWHBockY3TmthVUVp?=
 =?utf-8?B?bVN3K3VudXF4QkFLTGcrbDBhU3R3cXluZDU0ZzlKMnF5R0lRS1lZSEZTNEpw?=
 =?utf-8?B?cHJlbDQ5S0tPVEVKc21pMGlBZWljcmlCamZXWUFjMUw4RmNrV1ZQN0h3cFV6?=
 =?utf-8?B?N0xTUUIvNWM3dWhuL2VnN0hnK1VXd2tERmZIWUdBODc2MDRVZTBOQll0Z0Fv?=
 =?utf-8?B?SG9nNlYxb2FUM3JkMCtxc0VidzhVRjQ2TjB6ZkRmTFJ5QUNGVWN6aGRoUXFt?=
 =?utf-8?B?em5lSVpHT2hzK0ZiUS9Cei9OS05GM2ZOWDRkY2h5MEdHcDhtQm03dVRDTG5q?=
 =?utf-8?B?R3ZqWmdFYlJrc3NWa0p5azdWOWJTcFRadWdsdTBLTE12T1NWb3ZRdTZSYmds?=
 =?utf-8?Q?wcqCsE8cN9HCDswlFHLnWg46Z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e41b734-22a8-4c7b-e1f6-08db7c995d21
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 14:17:14.0184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CqaBowDdGqburKS9+ulQt0re3OBefZ3x+c/dGHyWfVVQbeKi8E69HZtlIkozpSQBU1d55pDM9t305nvO/7IYHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4176


On 26/06/2023 04:33, Penny Zheng wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> So sorry for the long long wait before v3 serie, since I got sidetracked to
> a new high priority internal project for quite a time.
>
> The Armv8-R architecture profile was designed to support use cases
> that have a high sensitivity to deterministic execution. (e.g.
> Fuel Injection, Brake control, Drive trains, Motor control etc)
>
> Arm announced Armv8-R in 2013, it is the latest generation Arm
> architecture targeted at the Real-time profile. It introduces
> virtualization at the highest security level while retaining the
> Protected Memory System Architecture (PMSA) based on a Memory
> Protection Unit (MPU). In 2020, Arm announced Cortex-R82,
> which is the first Arm 64-bit Cortex-R processor based on Armv8-R64.
> The latest Armv8-R64 document can be found [1]. And the features of
> Armv8-R64 architecture:
>    - An exception model that is compatible with the Armv8-A model
>    - Virtualization with support for guest operating systems
>    - PMSA virtualization using MPUs In EL2.
>    - Adds support for the 64-bit A64 instruction set.
>    - Supports up to 48-bit physical addressing.
>    - Supports three Exception Levels (ELs)
>          - Secure EL2 - The Highest Privilege
>          - Secure EL1 - RichOS (MMU) or RTOS (MPU)
>          - Secure EL0 - Application Workloads
>   - Supports only a single Security state - Secure.
>   - MPU in EL1 & EL2 is configurable, MMU in EL1 is configurable.
>
> These patch series are implementing the Armv8-R64 MPU support
> for Xen, which are based on the discussion of
> "Proposal for Porting Xen to Armv8-R64 - DraftC" [2].
>
> We will implement the Armv8-R64 and MPU support in three stages:
> 1. Support to boot MMU domains on Armv8-R64 Xen.
> 2. Support to boot MPU domains on Armv8-R64 Xen.
> 3. SMP and other advanced features of Xen support on Armv8-R64.
>
> For having a overall undestanding for reviewers about MPU framework on Xen,
> we have introduced a large patch serie here, including 52 commits. At this
> stage, we could successfully boot a linux guest on FVP_BaseR_AEMv8R
> model[3].
>
> We will split these patches to several parts, this series is the
> part#1, v1 is in [4], the full PoC can be found in [5]. More software for
> Armv8-R64 can be found in [6];
>
> [1] https://developer.arm.com/documentation/ddi0600/latest
> [2] https://lists.xenproject.org/archives/html/xen-devel/2022-05/msg00643.html
> [3] https://developer.arm.com/tools-and-software/simulation-models/fixed-virtual-platforms/arm-ecosystem-models
> [4] https://lists.xenproject.org/archives/html/xen-devel/2022-11/msg00289.html
> [5] https://gitlab.com/xen-project/people/weic/xen/-/tree/integration/mpu_v3
> [6] https://armv8r64-refstack.docs.arm.com/en/v5.0/
>
> Penny Zheng (41):
>    xen/arm: introduce CONFIG_HAS_MMU
>    xen/arm: mmu: fold FIXMAP into MMU system
>    xen/mmu: extract early uart mapping from setup_fixmap
>    xen/mmu: move MMU-specific setup_mm to mmu/setup.c
>    xen: make VMAP only support in MMU system
>    xen/mmu: relocate copy_from_paddr into setup.c
>    xen/arm: do not give memory back to static heap
>    xen/arm: only map the init text section RW in free_init_memory
>    xen/arm: switch to use ioremap_xxx in common file
>    xen/mmu: move MMU specific P2M code to mmu/p2m.c and mmu/p2m.h
>    xen: introduce CONFIG_HAS_PAGING_MEMPOOL
>    xen/mmu: enable SMMU subsystem only in MMU
>    xen/mpu: build up start-of-day Xen MPU memory region map
>    xen/mpu: introduce helpers for MPU enablement
>    xen/mpu: map early uart when earlyprintk on
>    xen/mpu: introduce setup_mm_mappings
>    xen/mpu: plump virt/maddr conversion in MPU system
>    xen/mpu: introduce a pair helper
>      read_protection_region()/write_protection_region()
>    xen/mpu: populate a new region in Xen MPU mapping table
>    xen/mpu: make early_fdt_map support in MPU systems
>    xen/mpu: implement MPU version of setup_mm in mpu/setup.c
>    xen/mpu: initialize frametable in MPU system
>    xen/mpu: destroy an existing entry in Xen MPU memory mapping table
>    xen/arm: map static memory on demand
>    xen/mpu: implememt ioremap_xxx in MPU
>    xen/mpu: implement MPU version of copy_from_paddr
>    xen/mpu: map domain page in MPU system
>    xen/mpu: support free_init_memory in MPU system
>    xen/mpu: implement remove_early_mappings in MPU system
>    xen/mpu: Use secure hypervisor timer in MPU system
>    xen/mpu: implement setup_virt_paging for MPU system
>    xen/mpu: configure VSTCR_EL2 in MPU system
>    xen/mpu: P2M initialization in MPU system
>    xen/mpu: insert an new entry into guest physmap in MPU system
>    xen/mpu: look up entry in p2m table
>    xen/mpu: support vcpu context switch in MPU system
>    xen/mpu: enable MMIO region trap in MPU system
>    xen/mpu: enable device passthrough in MPU system
>    xen/mpu: dump debug message in MPU system
>    xen/mpu: create stubs of function/variables for UNSUPPORTED features
>    xen/arm: add Kconfig option CONFIG_HAS_MPU to enable MPU system
>      support
>
> Wei Chen (11):
>    xen/arm: remove xen_phys_start and xenheap_phys_end from config.h
>    xen/arm: make ARM_EFI selectable for Arm64
>    xen/arm: add an option to define Xen start address for Armv8-R
>    xen/arm: add .text.idmap in ld script for Xen identity map sections
>    xen/arm64: head: Introduce enable_boot_mmu and enable_runtime_mmu
>    xen/arm64: prepare for moving MMU related code from head.S
>    xen/arm64: move MMU related code from head.S to mmu/head.S
>    xen/arm: use PA == VA for EARLY_UART_VIRTUAL_ADDRESS on MPU systems
>    xen/arm: Move MMU related definitions from config.h to mmu/layout.h
>    xen/mmu: extract mmu-specific codes from mm.c/mm.h
>    xen/arm: create mpu/layout.h for MPU related address definitions

Hi All,

I had a look at the first 22 patches (which touch the MMU code) and I 
did not find anything which will impact the R52 work directly.

- Ayan

>
>   xen/arch/arm/Kconfig                     |   52 +-
>   xen/arch/arm/Kconfig.debug               |    7 +
>   xen/arch/arm/Makefile                    |   15 +-
>   xen/arch/arm/arm32/head.S                |    2 +-
>   xen/arch/arm/arm64/Makefile              |    7 +-
>   xen/arch/arm/arm64/head.S                |  472 +-----
>   xen/arch/arm/arm64/mmu/head.S            |  463 ++++++
>   xen/arch/arm/arm64/{ => mmu}/mm.c        |    7 +-
>   xen/arch/arm/arm64/mpu/head.S            |  255 ++++
>   xen/arch/arm/arm64/smpboot.c             |    6 +-
>   xen/arch/arm/bootfdt.c                   |    2 +-
>   xen/arch/arm/domain.c                    |    2 +
>   xen/arch/arm/domain_build.c              |    2 +
>   xen/arch/arm/include/asm/arm64/macros.h  |   51 +
>   xen/arch/arm/include/asm/arm64/mm.h      |    7 +-
>   xen/arch/arm/include/asm/arm64/mpu.h     |  140 ++
>   xen/arch/arm/include/asm/arm64/sysregs.h |   76 +
>   xen/arch/arm/include/asm/config.h        |  129 +-
>   xen/arch/arm/include/asm/cpufeature.h    |    7 +
>   xen/arch/arm/include/asm/early_printk.h  |   20 +
>   xen/arch/arm/include/asm/fixmap.h        |   31 +-
>   xen/arch/arm/include/asm/mm.h            |   79 +-
>   xen/arch/arm/include/asm/mmu/layout.h    |  141 ++
>   xen/arch/arm/include/asm/mmu/mm.h        |   54 +
>   xen/arch/arm/include/asm/mmu/p2m.h       |   18 +
>   xen/arch/arm/include/asm/mpu/layout.h    |   32 +
>   xen/arch/arm/include/asm/mpu/mm.h        |   36 +
>   xen/arch/arm/include/asm/mpu/p2m.h       |   18 +
>   xen/arch/arm/include/asm/p2m.h           |   48 +-
>   xen/arch/arm/include/asm/page.h          |   46 +-
>   xen/arch/arm/include/asm/processor.h     |   14 +
>   xen/arch/arm/include/asm/setup.h         |   16 +-
>   xen/arch/arm/kernel.c                    |   42 +-
>   xen/arch/arm/mm.c                        | 1160 +-------------
>   xen/arch/arm/mmu/mm.c                    | 1133 ++++++++++++++
>   xen/arch/arm/mmu/p2m.c                   | 1612 +++++++++++++++++++
>   xen/arch/arm/mmu/setup.c                 |  379 +++++
>   xen/arch/arm/mpu/domain_page.c           |   68 +
>   xen/arch/arm/mpu/mm.c                    |  959 ++++++++++++
>   xen/arch/arm/mpu/p2m.c                   |  518 +++++++
>   xen/arch/arm/mpu/setup.c                 |  102 ++
>   xen/arch/arm/p2m.c                       | 1782 ++--------------------
>   xen/arch/arm/platforms/Kconfig           |    8 +-
>   xen/arch/arm/setup.c                     |  388 +----
>   xen/arch/arm/smpboot.c                   |    6 +-
>   xen/arch/arm/traps.c                     |   97 +-
>   xen/arch/arm/xen.lds.S                   |    6 +-
>   xen/arch/x86/Kconfig                     |    2 +
>   xen/arch/x86/setup.c                     |    2 +
>   xen/common/Kconfig                       |    8 +
>   xen/common/Makefile                      |    2 +-
>   xen/common/domctl.c                      |    2 +
>   xen/common/vmap.c                        |    7 +
>   xen/drivers/passthrough/Kconfig          |    3 +-
>   xen/include/xen/vmap.h                   |   11 +-
>   55 files changed, 6730 insertions(+), 3822 deletions(-)
>   create mode 100644 xen/arch/arm/arm64/mmu/head.S
>   rename xen/arch/arm/arm64/{ => mmu}/mm.c (97%)
>   create mode 100644 xen/arch/arm/arm64/mpu/head.S
>   create mode 100644 xen/arch/arm/include/asm/arm64/mpu.h
>   create mode 100644 xen/arch/arm/include/asm/mmu/layout.h
>   create mode 100644 xen/arch/arm/include/asm/mmu/mm.h
>   create mode 100644 xen/arch/arm/include/asm/mmu/p2m.h
>   create mode 100644 xen/arch/arm/include/asm/mpu/layout.h
>   create mode 100644 xen/arch/arm/include/asm/mpu/mm.h
>   create mode 100644 xen/arch/arm/include/asm/mpu/p2m.h
>   create mode 100644 xen/arch/arm/mmu/mm.c
>   create mode 100644 xen/arch/arm/mmu/p2m.c
>   create mode 100644 xen/arch/arm/mmu/setup.c
>   create mode 100644 xen/arch/arm/mpu/domain_page.c
>   create mode 100644 xen/arch/arm/mpu/mm.c
>   create mode 100644 xen/arch/arm/mpu/p2m.c
>   create mode 100644 xen/arch/arm/mpu/setup.c
>
> --
> 2.25.1
>
>

