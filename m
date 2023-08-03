Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AB076E275
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 10:07:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576057.901777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRTMo-0001Nh-A9; Thu, 03 Aug 2023 08:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576057.901777; Thu, 03 Aug 2023 08:07:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRTMo-0001Lx-7P; Thu, 03 Aug 2023 08:07:30 +0000
Received: by outflank-mailman (input) for mailman id 576057;
 Thu, 03 Aug 2023 08:07:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KRpN=DU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qRTMm-0000t9-Qv
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 08:07:28 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e83::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c92b4638-31d4-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 10:07:27 +0200 (CEST)
Received: from SJ0PR05CA0147.namprd05.prod.outlook.com (2603:10b6:a03:33d::32)
 by PH0PR12MB7790.namprd12.prod.outlook.com (2603:10b6:510:289::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Thu, 3 Aug
 2023 08:07:23 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::7f) by SJ0PR05CA0147.outlook.office365.com
 (2603:10b6:a03:33d::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.18 via Frontend
 Transport; Thu, 3 Aug 2023 08:07:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.19 via Frontend Transport; Thu, 3 Aug 2023 08:07:22 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 3 Aug
 2023 03:07:21 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 3 Aug
 2023 01:07:21 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 3 Aug 2023 03:07:19 -0500
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
X-Inumbo-ID: c92b4638-31d4-11ee-b268-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZ796zQEps7zKScBDUXVuVeSx4wJ45bRBGZXijSqgHnv60YJR7U6ZUcmqvTQNwpjkX8BWdQ56fE7OxaecvoL0Dh8enZXCgQpA/upiRWmyUYKW1BPV0jabLED9gqv3lvr6cuydnxtx2qvWsMqZGx1VGpt4YDvf5dgSh/921l/X+RsMeCpim+nvWjhCActcgVDn+KZs3NOhbKQ2sVO02NYu230LPXajhUcQ8lAyNJkofspjGPKVcoCeDkrp0yIG/cKtkgctyXxRNZGx+POMCmBBnL+uuzODR9J7lqi+q31hZzDf3rUVzHe2ND/SH9VPeyL0znrGAtvJq8cLKW9As5CQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vtu01wfErjl8p1ZXHqqdIcDF25BBmHSforxtkzCzv0I=;
 b=EIJd6PMd29/QDiYpiP3YlV8/X75QTbS+DckvKOw/T8lnTZqMdBte98UVSxSzh14jEMSSLUOLcvLlLFnW+KtXptqi1fA77AE38x2bJsbjBfw7+Z/40msRbUAEc85tqWvQ2mPmT3z65zAs3LVbY8YhThNQ2Ed7ShZXJiit1pYgNQ5XnU+DDjQi7tEZTyArieW3ZdIM1kc5okdWdVR+dQjP8ukvtX/I8A2BqrGPhOEEv/YcdyQbihsT/ivUjdFbpMTPxoSHesBw4uK4/KdsI36PunFJGJzxCmMWcWCpBN/9ThJ/PSxLTq7pqBZjeWzWmSVp/H1oQXYlegUHYHs3UWMHVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vtu01wfErjl8p1ZXHqqdIcDF25BBmHSforxtkzCzv0I=;
 b=B7Su1dPo5HNJMPEGe1okPMoluBa+zczGtn6QZ04f8e8kUNrUntgv1YZrefKVU3QKCIgYRmge02rt5C5eTyo7wGwbxExPFbPIV2wOKhcr7TBJcx9g+89rQHClx5t8mBulIBOBGjEF0NbMOutF3RPLKer8CQTBsha8waBSJdxNK6w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <2c16c9c2-afed-3dda-7e88-b4c5269665f2@amd.com>
Date: Thu, 3 Aug 2023 10:07:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH] arm/gicv2: make GICv2 driver and vGICv2 optional
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230802135350.745251-1-luca.fancellu@arm.com>
 <17bc595a-dc30-9e76-4d31-aad62f9c9672@amd.com>
 <3ED442CB-0569-4C9C-9770-39D2FE4852A0@arm.com>
 <8c8f2564-935b-e3c8-ad15-348135140a53@amd.com>
 <92AE30B2-B2CE-465F-A6FC-A86961BED85A@arm.com>
 <9d40bd81-dc3a-0288-8f8a-1de62dc30d1d@xen.org>
 <1a364aa9-4549-80b9-4319-d91551f228bd@amd.com>
 <8516a6bb-8321-fc84-c7ce-10a7b41ecb59@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <8516a6bb-8321-fc84-c7ce-10a7b41ecb59@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|PH0PR12MB7790:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a0532f1-7d99-401c-80f4-08db93f8aab9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pFU6hZOtsQn9tT6ZfcQ/lCbNQGjany1MY1Og2lr1xPIvHpd7tCGuEr6okkBRyGBiKPJGwc3X9Q5n19zBXASvC3PRiLU1wdmBXCpKGs3wbuzQoBPdlShmRIrNXxjK414meWyuJ9X11smyqJ4ooz2uQa6u0O6/u+RlihIo8P2rey1ECrJ6X/JBc8YIPEbpZsguqwVyNWmnZoRtaYot3v84Fk6kyS9zlaXpZShyhSpS2ROUgjPUkQwhcwVemSEQ4OgoUpIOBh8tH6S7x1UejoeIc70Zj3lBlr2zUpWBGMBu9xTTlIM0Q8vyber03O8ywHdI//65Dw03hcqCLxSzkRNgl75XiNo13TVqUecv/XKrsfvGAy36paAvI3/wQ7SxYvNuC7/oUdV7erbYn6ES+w3OZLnY385aY6tlFtu1otX43lht6l7j/Qx9e8l4yOcZZueICxssTzbs5BnXWNGHLcZxIl7bQ3fVE8rE/YcQtXSpjBwJjphITB7od3ezmAT0oR362axnhJAXwvm3A1BxaNOzZMkauMowhKKNu6F0PpCT5lruinOVYq2gwITNxzk0BnhD+VaHqMQribPfpQxD7zcEW5PazIsanHcNdZQ1Q0TuANV2RVR00Fw3f+CXY7bG3LzTAJCLahT3BEYV5etwwkli4jaKaOcY4bqxkGypFIUdCn/u7Nuorm9zneJq/1rQmyhMRXyGrBijATA5DhGCJLs7ieHF0PS0ZbbSRnCF7xQQWoyZK3FRD1jzgi1vfKOeoNBABdqKxLYnfEs/qSUJJv9dbcuFcsBG3jx7N8uZzdQk4W5Bv/htaIWj8gpNDeZ3dD8v
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(376002)(396003)(82310400008)(451199021)(40470700004)(36840700001)(46966006)(40480700001)(2616005)(40460700003)(336012)(186003)(16576012)(316002)(86362001)(478600001)(54906003)(81166007)(110136005)(4326008)(356005)(31696002)(70586007)(70206006)(82740400003)(53546011)(36756003)(41300700001)(26005)(426003)(5660300002)(8676002)(8936002)(47076005)(2906002)(66899021)(36860700001)(44832011)(83380400001)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 08:07:22.7107
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a0532f1-7d99-401c-80f4-08db93f8aab9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7790



On 03/08/2023 09:35, Julien Grall wrote:
> 
> 
> Hi,
> 
> On 03/08/2023 08:15, Michal Orzel wrote:
>> On 02/08/2023 19:39, Julien Grall wrote:
>>>
>>>
>>> Hi Luca,
>>>
>>> On 02/08/2023 16:05, Luca Fancellu wrote:
>>>>> On 2 Aug 2023, at 15:48, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>>
>>>>> Hi,
>>>>>
>>>>> On 02/08/2023 16:42, Luca Fancellu wrote:
>>>>>>
>>>>>>
>>>>>>> On 2 Aug 2023, at 15:26, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>>>>
>>>>>>> Hi Luca,
>>>>>>>
>>>>>>> On 02/08/2023 15:53, Luca Fancellu wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> Introduce Kconfig GICV2 to be able to compile the GICv2 driver only
>>>>>>>> when needed, the option is active by default.
>>>>>>>>
>>>>>>>> Introduce Kconfig VGICV2 that depends on GICV2 or GICV3 and compiles
>>>>>>>> the GICv2 emulation for guests, it is required only when using GICV2
>>>>>>>> driver, otherwise using GICV3 it is optional and can be deselected
>>>>>>>> if the user doesn't want to offer the vGICv2 interface to guests or
>>>>>>>> maybe its GICv3 hardware can't offer the GICv2 compatible mode.
>>>>>>>>
>>>>>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>>>>>>> ---
>>>>>>>> xen/arch/arm/Kconfig        | 13 +++++++++++++
>>>>>>>> xen/arch/arm/Makefile       |  4 ++--
>>>>>>>> xen/arch/arm/domain_build.c |  4 ++++
>>>>>>>> xen/arch/arm/gic-v3.c       |  4 ++++
>>>>>>>> xen/arch/arm/vgic.c         |  2 ++
>>>>>>>> 5 files changed, 25 insertions(+), 2 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>>>>>>> index fd57a82dd284..dc702f08ace7 100644
>>>>>>>> --- a/xen/arch/arm/Kconfig
>>>>>>>> +++ b/xen/arch/arm/Kconfig
>>>>>>>> @@ -78,6 +78,14 @@ config ARM_EFI
>>>>>>>>           UEFI firmware. A UEFI stub is provided to allow Xen to
>>>>>>>>           be booted as an EFI application.
>>>>>>>>
>>>>>>>> +config GICV2
>>>>>>> So, now it would be possible to deselect both GIC drivers and Xen would not complain when building.
>>>>>>> This means that Xen would fail on boot without any message as it happens before serial driver initialization.
>>>>>>> Since having GIC driver built in is a must-have I think we need to make sure that at least one is enabled.
>>>>>>
>>>>>> Hi Michal,
>>>>>>
>>>>>> I tried and I had:
>>>>>>
>>>>>> Starting kernel ...
>>>>>>
>>>>>> - UART enabled -
>>>>>> - Boot CPU booting -
>>>>>> - Current EL 0000000000000008 -
>>>>>> - Initialize CPU -
>>>>>> - Turning on paging -
>>>>>> - Zero BSS -
>>>>>> - Ready -
>>>>>> (XEN) Checking for initrd in /chosen
>>>>>> (XEN) RAM: 0000000080000000 - 00000000feffffff
>>>>>> (XEN) RAM: 0000000880000000 - 00000008ffffffff
>>>>>> (XEN)
>>>>>> (XEN) MODULE[0]: 0000000084000000 - 000000008415d000 Xen
>>>>>> (XEN) MODULE[1]: 00000000fd6c5000 - 00000000fd6c8000 Device Tree
>>>>>> (XEN) MODULE[2]: 0000000080080000 - 00000000814f1a00 Kernel
>>>>>> (XEN)  RESVD[0]: 0000000080000000 - 0000000080010000
>>>>>> (XEN)  RESVD[1]: 0000000018000000 - 00000000187fffff
>>>>>> (XEN)
>>>>>> (XEN)
>>>>>> (XEN) Command line: noreboot dom0_mem=1024M console=dtuart dtuart=serial0 bootscrub=0
>>>>>> (XEN) PFN compression on bits 20...22
>>>>>> (XEN) Domain heap initialised
>>>>>> (XEN) Booting using Device Tree
>>>>>> (XEN) Platform: Generic System
>>>>>> (XEN)
>>>>>> (XEN) ****************************************
>>>>>> (XEN) Panic on CPU 0:
>>>>>> (XEN) Unable to find compatible GIC in the device tree
>>>>>> (XEN) ****************************************
>>>>>> (XEN)
>>>>>> (XEN) Manual reset required ('noreboot' specified)
>>>>> Having early printk enabled all the time is not common and not enabled in release builds FWIK.
>>>
>>> There are a lot of information printed before the console is properly
>>> brought up. I wonder if we should look at adding early console like
>>> Linux does?
>> I guess it is not a matter of "if" but "when" and I think it's just that no one has time to do that
>> since it is more a like a feature for developers rather than for customers (they just report the issue
>> and we need to fix it :)).
> 
> Sure. This is always the case, but it also means developpers will
> continue to waste time when investigating early boot issues. I wouldn't
> be surprised if the total time wasted is more than the actual effort to
> add support :).
most probably

> 
>> There are so many things that can go wrong during early boot including the entire boofdt parsing
>> and having earlycon would be so desirable.
> It is not clear what to take from your reply. Earlier you were concerned
> about the error not showing up in the log if the .config is not correct.
> 
> There is no really quick fix for that as a .config may work for platform
> A but not platform B. The only viable solution is having an early console.
> 
> Anything else like forcing to always have one GICvX selected is just a
> hack that would work for one set of people but not the others.
Yes, having early console would solve these issues and for now we might need to be
on the mercy of users to do wise selection. That said, the scenario with GIC is not really
the same as for something that can work on platform A and not on B. No GIC built-in
cannot work on any platform, hence my concern (it is different than selecting wrong GIC).
But because I do not see any simple solution other than building always both and you don't like
what Luca just did (fallback to GICv2), I'm ok. Initializing UART prior to GIC would also require
quite some work to defer the IRQ translation that depends on the GIC.

~Michal

