Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B620076E112
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 09:16:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576035.901737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRSYS-0002EM-8I; Thu, 03 Aug 2023 07:15:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576035.901737; Thu, 03 Aug 2023 07:15:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRSYS-0002CI-5X; Thu, 03 Aug 2023 07:15:28 +0000
Received: by outflank-mailman (input) for mailman id 576035;
 Thu, 03 Aug 2023 07:15:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KRpN=DU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qRSYQ-0002CB-IK
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 07:15:26 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061d.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8332b98b-31cd-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 09:15:24 +0200 (CEST)
Received: from SA0PR11CA0172.namprd11.prod.outlook.com (2603:10b6:806:1bb::27)
 by SJ1PR12MB6267.namprd12.prod.outlook.com (2603:10b6:a03:456::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 07:15:19 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2603:10b6:806:1bb:cafe::e9) by SA0PR11CA0172.outlook.office365.com
 (2603:10b6:806:1bb::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20 via Frontend
 Transport; Thu, 3 Aug 2023 07:15:18 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.20 via Frontend Transport; Thu, 3 Aug 2023 07:15:18 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 3 Aug
 2023 02:15:18 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 3 Aug
 2023 00:15:17 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 3 Aug 2023 02:15:16 -0500
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
X-Inumbo-ID: 8332b98b-31cd-11ee-b268-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZetXMIRQCxZn6mWiy7xbH+vglrtwHbTdpQEs7e9VM5VOScBvKWBbtXVMBSeuNpRdv4A+Av/S7YLnksePm8yuicJchISCmcGRsWciUV3TCFf0Fm4jV75YhT0/kU0fmeUT3s3tgYKWnEOQ0bpSGdVCzkQcBmyBCN8l2i8NfO7tow+Y8Gl65lbS29770K0hMpUU1IhapDGdPb5fpe9akuIFna4tuwFf9Vf/cXZMoHscAUi1HyvZvYmJCIvrZPxmK0x+pRqHEwQV92IyYR5spEiBs7ZGPKh8V7GwrX/Ji4GjlwPvUVsvda5MGHviG/A0dlBMMO3q7AyXjl3mnd/S7MODA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3QbZelKwxhDNvT7zVJTaE8jeQTT4RR730grwMLw5MI=;
 b=j+i+fvuWXj0Gkt1Sdeei3P327Wi80HpjvHtYsOheSLq7By5DaDCbxUwwnIrZ1vZstjNXDg9CKIoC7dTy8SvsOq+AKiCHVxVsW884FUpC4pvIcMe41nFFP64Y75KnrDy5Hv3gKT3VWdCYk6J2FlfQMUeiZQyzvnWq2fLcglwj6awhWGu2U/TpVczi2Bbwh2C6NPfPOomjhoXp2Tgfbh/WhGH9VWZuZEyWgPuorttj/B4T2++Ud4rC/VG8ZEjUM12JIbMCdJ88dQd+p+79ntfGQtGKgw3E2DwMwDqmFKx2liCHoh5DecApQ/5FblQA8tV09Fts+txW2zpkjj6ZDB/KTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3QbZelKwxhDNvT7zVJTaE8jeQTT4RR730grwMLw5MI=;
 b=aikWgEuXbfcO8y//+w3UyfitTRcSMAiwt70Q29Caj7bxXO2eLEmKqaoYtlGL7Y1hi146DtR33Wtz5wMj6QF7WZAeLWHmh+d+Dp8BwK+VR3GwOxlcTHQEjGxkOwXKK8QMOmVxriLXGgw21Xr3c8/E5mbXCKeGbwmUKM8vKAZ4oO0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <1a364aa9-4549-80b9-4319-d91551f228bd@amd.com>
Date: Thu, 3 Aug 2023 09:15:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH] arm/gicv2: make GICv2 driver and vGICv2 optional
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
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <9d40bd81-dc3a-0288-8f8a-1de62dc30d1d@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|SJ1PR12MB6267:EE_
X-MS-Office365-Filtering-Correlation-Id: 6555ca15-0dbe-4ccf-78a0-08db93f1647d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h2KuGXQ5kFXWk2ilV6Yn7dRLYDpHPgJ7TnoZUs7OVnpb3XnqJvlAscCBgz9YjlM66xs0uSBGqJGnTgH9DtQJ9SplVy5dTl9MHyC3zEcI9fOx15Ql019P++fCBinxhT2m3FOVtO5VoiP8myCUQv6xQGAdk5zt3QPYbpnpfml/BTW8COwhpZvKOmGUl/wBsTiYMLjRabQ+4lS3MWQLgAeYJP8XJ4m0okBhJUtmFRAin9e9NGRriG87Bp58w00RdvVHRMPy8u7ZQ6Dtdg2zG+c6YlslEjebWddCck5fyulL/uXcnuN0avD+Bfue4kWqr5F8ErOac3nwBTevICykyepkZvQf/8poQh9F6vl9cSKzmPFca97ipxru9bpRvW0rEGpR8i5CL8gmg+srZ+whT2M1ZbRNWe0aB5XnOCq9VFqsiBwYMFSPpbYSM900rGh3yU6WNPYYoWmYUoP83xyKRTN1aS+4i54DZI8dNZUjk1BWpPV90jeH7HLNjDR+zkw8FJ0Ivw38g4BXjX7p2XhVNM7z4CSsuSiEKGSahtEz7045aOMonGP5l7Kipd2LGAPQxiPYMOlpsB3fQM38dtwZac8YafKJPhTh9KyVMK7lzFVjlpJHZf9ZUQOzpL2mJY/wxvXt47AKCMdHpU3+0fvWR/5DDATkykoec7yJTMsWYkg9W4bWyAbN+1ufajhEoedDS5+iDwgok12BDLoXJLlWghq7uE7To62Pr7J6huykBYWTcMM6ZUQsEQHUJG/AAjItTGtDhkgXhdS6h02/JX5jmEaz4pNq3hYAZI4LYoeG3Cau5nY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199021)(82310400008)(40470700004)(36840700001)(46966006)(36756003)(31696002)(86362001)(31686004)(66899021)(82740400003)(40460700003)(40480700001)(54906003)(478600001)(110136005)(356005)(81166007)(47076005)(336012)(426003)(2616005)(186003)(26005)(83380400001)(53546011)(41300700001)(8676002)(8936002)(44832011)(316002)(16576012)(36860700001)(5660300002)(4326008)(70206006)(70586007)(2906002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 07:15:18.4778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6555ca15-0dbe-4ccf-78a0-08db93f1647d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6267



On 02/08/2023 19:39, Julien Grall wrote:
> 
> 
> Hi Luca,
> 
> On 02/08/2023 16:05, Luca Fancellu wrote:
>>> On 2 Aug 2023, at 15:48, Michal Orzel <michal.orzel@amd.com> wrote:
>>>
>>> Hi,
>>>
>>> On 02/08/2023 16:42, Luca Fancellu wrote:
>>>>
>>>>
>>>>> On 2 Aug 2023, at 15:26, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>>
>>>>> Hi Luca,
>>>>>
>>>>> On 02/08/2023 15:53, Luca Fancellu wrote:
>>>>>>
>>>>>>
>>>>>> Introduce Kconfig GICV2 to be able to compile the GICv2 driver only
>>>>>> when needed, the option is active by default.
>>>>>>
>>>>>> Introduce Kconfig VGICV2 that depends on GICV2 or GICV3 and compiles
>>>>>> the GICv2 emulation for guests, it is required only when using GICV2
>>>>>> driver, otherwise using GICV3 it is optional and can be deselected
>>>>>> if the user doesn't want to offer the vGICv2 interface to guests or
>>>>>> maybe its GICv3 hardware can't offer the GICv2 compatible mode.
>>>>>>
>>>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>>>>> ---
>>>>>> xen/arch/arm/Kconfig        | 13 +++++++++++++
>>>>>> xen/arch/arm/Makefile       |  4 ++--
>>>>>> xen/arch/arm/domain_build.c |  4 ++++
>>>>>> xen/arch/arm/gic-v3.c       |  4 ++++
>>>>>> xen/arch/arm/vgic.c         |  2 ++
>>>>>> 5 files changed, 25 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>>>>> index fd57a82dd284..dc702f08ace7 100644
>>>>>> --- a/xen/arch/arm/Kconfig
>>>>>> +++ b/xen/arch/arm/Kconfig
>>>>>> @@ -78,6 +78,14 @@ config ARM_EFI
>>>>>>          UEFI firmware. A UEFI stub is provided to allow Xen to
>>>>>>          be booted as an EFI application.
>>>>>>
>>>>>> +config GICV2
>>>>> So, now it would be possible to deselect both GIC drivers and Xen would not complain when building.
>>>>> This means that Xen would fail on boot without any message as it happens before serial driver initialization.
>>>>> Since having GIC driver built in is a must-have I think we need to make sure that at least one is enabled.
>>>>
>>>> Hi Michal,
>>>>
>>>> I tried and I had:
>>>>
>>>> Starting kernel ...
>>>>
>>>> - UART enabled -
>>>> - Boot CPU booting -
>>>> - Current EL 0000000000000008 -
>>>> - Initialize CPU -
>>>> - Turning on paging -
>>>> - Zero BSS -
>>>> - Ready -
>>>> (XEN) Checking for initrd in /chosen
>>>> (XEN) RAM: 0000000080000000 - 00000000feffffff
>>>> (XEN) RAM: 0000000880000000 - 00000008ffffffff
>>>> (XEN)
>>>> (XEN) MODULE[0]: 0000000084000000 - 000000008415d000 Xen
>>>> (XEN) MODULE[1]: 00000000fd6c5000 - 00000000fd6c8000 Device Tree
>>>> (XEN) MODULE[2]: 0000000080080000 - 00000000814f1a00 Kernel
>>>> (XEN)  RESVD[0]: 0000000080000000 - 0000000080010000
>>>> (XEN)  RESVD[1]: 0000000018000000 - 00000000187fffff
>>>> (XEN)
>>>> (XEN)
>>>> (XEN) Command line: noreboot dom0_mem=1024M console=dtuart dtuart=serial0 bootscrub=0
>>>> (XEN) PFN compression on bits 20...22
>>>> (XEN) Domain heap initialised
>>>> (XEN) Booting using Device Tree
>>>> (XEN) Platform: Generic System
>>>> (XEN)
>>>> (XEN) ****************************************
>>>> (XEN) Panic on CPU 0:
>>>> (XEN) Unable to find compatible GIC in the device tree
>>>> (XEN) ****************************************
>>>> (XEN)
>>>> (XEN) Manual reset required ('noreboot' specified)
>>> Having early printk enabled all the time is not common and not enabled in release builds FWIK.
> 
> There are a lot of information printed before the console is properly
> brought up. I wonder if we should look at adding early console like
> Linux does?
I guess it is not a matter of "if" but "when" and I think it's just that no one has time to do that
since it is more a like a feature for developers rather than for customers (they just report the issue
and we need to fix it :)). There are so many things that can go wrong during early boot including the entire boofdt parsing
and having earlycon would be so desirable.

~Michal


