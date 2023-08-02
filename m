Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA1676D089
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 16:49:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575048.900778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRD9W-0007gZ-RQ; Wed, 02 Aug 2023 14:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575048.900778; Wed, 02 Aug 2023 14:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRD9W-0007d9-O7; Wed, 02 Aug 2023 14:48:42 +0000
Received: by outflank-mailman (input) for mailman id 575048;
 Wed, 02 Aug 2023 14:48:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TXK3=DT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qRD9U-0007co-Kd
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 14:48:40 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9f9821b-3143-11ee-b262-6b7b168915f2;
 Wed, 02 Aug 2023 16:48:39 +0200 (CEST)
Received: from CY5PR03CA0021.namprd03.prod.outlook.com (2603:10b6:930:8::36)
 by SN7PR12MB6766.namprd12.prod.outlook.com (2603:10b6:806:26a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 14:48:35 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:930:8:cafe::2d) by CY5PR03CA0021.outlook.office365.com
 (2603:10b6:930:8::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.19 via Frontend
 Transport; Wed, 2 Aug 2023 14:48:35 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.19 via Frontend Transport; Wed, 2 Aug 2023 14:48:35 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 2 Aug
 2023 09:48:34 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 2 Aug
 2023 07:48:34 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 2 Aug 2023 09:48:33 -0500
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
X-Inumbo-ID: a9f9821b-3143-11ee-b262-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HPymXie5d7HNWM7USa88HZ257RD5vIyw/xwM1oIx0yx7nr6tnPVJU5KsEHI/wModXQ4rdHVTC3wCR5oFiQF4VRwJV8pZX5mMFXQcUC6RKnCePFNgAXeoJ3CvRmQvBQtv4XvAywF8xXL2ZKaNqJXSnWq+DTxw9TfxasQ5BMRMisEQ8tB7+rgJg6LOy+BCUArfZuR5Ha5OgEdvhA6Ild7cyFQoVvvGANOZO9LQhx6Z4qBYjpYcmas1LTREEJ9aYhbqSAVE8wQBgP9VN50BQt+/UX8hiFHsd6yUKOFLQeUJosWqo0ooZ99lHe/tzjO9grP0Rix/21QmPGKQs1ExNvYcig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hg7jkSVwUQysoOXw/WmRJXplEQ3B3+UCu3avV0ef9p8=;
 b=aY8xNT8hDDosq1X1KxCrX80LfzszXnlNeK7kGWJP6NMRTc9/sjHyrqLemWYtZCpjMjtR9WYV0JHden/8CLxTROFFdcOLJ9nfWdGGKQ/00M0auFBzI+SZf3q0dgbZlV7TC6uXE0RXuSiblbB7qdHAiUEMJSqiBCHcNCYwMDNXSqskPIuHuybBD7twHEOYbrfQB/HDaMsn3ztTc+c8gF9LoO8sIRH3cLgbfaA3WSSU6HQ9XPagqMZ3aWF2FYxBRkF+29hmtm3rHHo6zghu0BLNdQYjT36iyj5r7btqxz4mfdAtKimrGkpU+tnmM3N8skeoGEW5Zu2N2gNUReXwxlk9/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hg7jkSVwUQysoOXw/WmRJXplEQ3B3+UCu3avV0ef9p8=;
 b=tzL/g/LV3u/qQqzxMmtgcUOvn7bB6Jiup1po6c2M/0d0xFaHBDv5LtGXWDTlNnMN+mZPVeZTSaUbuyLe5t+9k3xFlChdmHk8zcH3YybNfXD6HDOvA9LU7XHnq6DLyEtnpiLdx1cyvFagIhq9lV/ojTl5XLSfnHFuyFgptZL/X/w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <8c8f2564-935b-e3c8-ad15-348135140a53@amd.com>
Date: Wed, 2 Aug 2023 16:48:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH] arm/gicv2: make GICv2 driver and vGICv2 optional
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230802135350.745251-1-luca.fancellu@arm.com>
 <17bc595a-dc30-9e76-4d31-aad62f9c9672@amd.com>
 <3ED442CB-0569-4C9C-9770-39D2FE4852A0@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <3ED442CB-0569-4C9C-9770-39D2FE4852A0@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|SN7PR12MB6766:EE_
X-MS-Office365-Filtering-Correlation-Id: 78ee1989-240e-4eb0-f946-08db93678cad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+9qZp5FnLodqoa5Z/0CpfFYWFDGkIHKHu5orl2yb5qVWtBf6fiT89FuLjczymUIJ8kx17fngzkHqfSiZIzWynI1SHbYpS1ebu6TQA/lItryNLp/xjK8pyNByOzaJ14IrAB1VWJkvtoWdUj4Mwyr4TewK7Ug/qrL4lC8DVUmu9YZTLOFE24ZKs73nWIMkXvEJ8/nPlBQ/5ceQKIS0DwH2x70bcnjrCykqA8B29yOSAIbWCLzuqdQ+kPK+gI6g90V+ghf3ASYj0+LTrujg+shyMiJAVFdW1F5/JaM/3kW9rK6Nhrex6E+tt/2SzQOLUYOLQ+UVTzhCDxC/9amO4KtSb9z9bosV4ELjKWHev2Ci/YGYCKo9+6Bque9tZEznNm8Nn6+7QOmrexMx6YYTo5TgPlZ3/oBdHvbtlNxOuWMTjBbXh44gmIdD2rcIWbzwsDXgxtzNBaHSXRMKQbSPzA5EJTxS/ovZq+a6x2n9fAfH4N8c+9iAmVTkw4w8nd6XLe2X8up9HLygaxERsffIHTWJzNq/dLqhMdLjyX29kKxNcAHn0vkHv4fiu/KF/41uQ0wQWQpYrtQKGUbJJRY87J0HSt90AnTBDjLRqSrMlD2KEl7y6P6eYuVTICzOxmpNISoQTZRM7Z4J2P7rkCJrPM7m8UIEDFBklL98T7qNxOFZb4tsenvILmuRs2NzZ46x9Hc5RkPgfd/5Ch4hh5SfW1LFY070ufqlXBFBn3wX2L7GZ1rgm4A56Z8Kkba7PtJQNnnygl/AcgBSnRKlvXcnLPUYIT7tdGRBQy7/Ocpq6b5qxEVT48Vq7geX7+zK8+Ptfuj4
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199021)(82310400008)(46966006)(40470700004)(36840700001)(478600001)(40480700001)(86362001)(31696002)(36756003)(6666004)(16576012)(316002)(66899021)(8676002)(8936002)(41300700001)(5660300002)(31686004)(4326008)(6916009)(44832011)(40460700003)(36860700001)(47076005)(83380400001)(54906003)(70586007)(2906002)(70206006)(426003)(26005)(81166007)(356005)(82740400003)(2616005)(336012)(186003)(53546011)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 14:48:35.2933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ee1989-240e-4eb0-f946-08db93678cad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6766

Hi,

On 02/08/2023 16:42, Luca Fancellu wrote:
> 
> 
>> On 2 Aug 2023, at 15:26, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> Hi Luca,
>>
>> On 02/08/2023 15:53, Luca Fancellu wrote:
>>>
>>>
>>> Introduce Kconfig GICV2 to be able to compile the GICv2 driver only
>>> when needed, the option is active by default.
>>>
>>> Introduce Kconfig VGICV2 that depends on GICV2 or GICV3 and compiles
>>> the GICv2 emulation for guests, it is required only when using GICV2
>>> driver, otherwise using GICV3 it is optional and can be deselected
>>> if the user doesn't want to offer the vGICv2 interface to guests or
>>> maybe its GICv3 hardware can't offer the GICv2 compatible mode.
>>>
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>> xen/arch/arm/Kconfig        | 13 +++++++++++++
>>> xen/arch/arm/Makefile       |  4 ++--
>>> xen/arch/arm/domain_build.c |  4 ++++
>>> xen/arch/arm/gic-v3.c       |  4 ++++
>>> xen/arch/arm/vgic.c         |  2 ++
>>> 5 files changed, 25 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>> index fd57a82dd284..dc702f08ace7 100644
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -78,6 +78,14 @@ config ARM_EFI
>>>          UEFI firmware. A UEFI stub is provided to allow Xen to
>>>          be booted as an EFI application.
>>>
>>> +config GICV2
>> So, now it would be possible to deselect both GIC drivers and Xen would not complain when building.
>> This means that Xen would fail on boot without any message as it happens before serial driver initialization.
>> Since having GIC driver built in is a must-have I think we need to make sure that at least one is enabled.
> 
> Hi Michal,
> 
> I tried and I had:
> 
> Starting kernel ...
> 
> - UART enabled -
> - Boot CPU booting -
> - Current EL 0000000000000008 -
> - Initialize CPU -
> - Turning on paging -
> - Zero BSS -
> - Ready -
> (XEN) Checking for initrd in /chosen
> (XEN) RAM: 0000000080000000 - 00000000feffffff
> (XEN) RAM: 0000000880000000 - 00000008ffffffff
> (XEN)
> (XEN) MODULE[0]: 0000000084000000 - 000000008415d000 Xen
> (XEN) MODULE[1]: 00000000fd6c5000 - 00000000fd6c8000 Device Tree
> (XEN) MODULE[2]: 0000000080080000 - 00000000814f1a00 Kernel
> (XEN)  RESVD[0]: 0000000080000000 - 0000000080010000
> (XEN)  RESVD[1]: 0000000018000000 - 00000000187fffff
> (XEN)
> (XEN)
> (XEN) Command line: noreboot dom0_mem=1024M console=dtuart dtuart=serial0 bootscrub=0
> (XEN) PFN compression on bits 20...22
> (XEN) Domain heap initialised
> (XEN) Booting using Device Tree
> (XEN) Platform: Generic System
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) Unable to find compatible GIC in the device tree
> (XEN) ****************************************
> (XEN)
> (XEN) Manual reset required ('noreboot' specified)
Having early printk enabled all the time is not common and not enabled in release builds FWIK.
So in general, user would just see "Starting kernel" from u-boot and had to debug what's going on.

> 
> Wouldn’t be enough to suggest the user that at least one GIC needs to be selected? In the help it
> also states “if unsure, say Y"
I always think it is better to meet the users needs by preventing unwise mistakes like unselecting both drivers.
As always, it is up to maintainers.

~Michal

