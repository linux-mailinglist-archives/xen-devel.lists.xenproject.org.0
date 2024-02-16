Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E90898577B8
	for <lists+xen-devel@lfdr.de>; Fri, 16 Feb 2024 09:34:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682047.1061096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raten-0002IQ-VY; Fri, 16 Feb 2024 08:33:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682047.1061096; Fri, 16 Feb 2024 08:33:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raten-0002Gu-S7; Fri, 16 Feb 2024 08:33:17 +0000
Received: by outflank-mailman (input) for mailman id 682047;
 Fri, 16 Feb 2024 08:33:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AOVM=JZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ratem-0002G2-DR
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2024 08:33:16 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 060d3ef3-cca6-11ee-8a4f-1f161083a0e0;
 Fri, 16 Feb 2024 09:33:14 +0100 (CET)
Received: from CYZPR02CA0013.namprd02.prod.outlook.com (2603:10b6:930:a1::11)
 by BN9PR12MB5145.namprd12.prod.outlook.com (2603:10b6:408:136::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.14; Fri, 16 Feb
 2024 08:33:11 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:930:a1:cafe::92) by CYZPR02CA0013.outlook.office365.com
 (2603:10b6:930:a1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.41 via Frontend
 Transport; Fri, 16 Feb 2024 08:33:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Fri, 16 Feb 2024 08:33:09 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 16 Feb
 2024 02:33:09 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 16 Feb 2024 02:33:08 -0600
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
X-Inumbo-ID: 060d3ef3-cca6-11ee-8a4f-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adyCmYYO+RE9FOZSduN54ZuPWa506ZMwlEu2QZgo9UvCgHir5MY5e150zpSihfyFTnJzL+cbJk56N6sFNU5gElRXh/3sLfnxGIsNHY1V5AW65+PPbkqqCok12CZRp2XRH5P93uXg2IMVoENRdOQ2mPOdHAxzoNeHq2+S4Yy0CC4RZeeeiCAHAYYFIxO5gMYDFiqhEd/Hy0Ny5V+1csLSAsewdwWF80OksWvfyjrpnz0bqoIxzy/RRQmC+qbhDo04u57FCNedPmCek1EemV7cwbhN2a96iClwmMrXN2RMADpp/XSsoJ9jvnlA3rB+u6/WhTGQGHHmJXbqzwxe8BeIag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCc/sDE6mMSW7mn4yBfAaAU+QC0ySQvwfs6JiD2mR3A=;
 b=TpIKT0+1vd4m/ui780e8Cfns+ztBbjklus7Ph/Wjzk95Jupsg88xvqX9rachm7+c2gUwqh0teRFMRXbFMEZifO7uEJ/vcCqUdRLzPgNfgQr24C4Z7kU+tLLZW79p2up0UzBD2yej48PcBf/JuG7/ki6WlHCFeAyQSG8lUri7pGmsryM8XWMf5z9Z4BNHHGw2P3RRacjz3MqHaWTvb25VABpuR9HXaaiXotzwGVveFy7P+PLuNE/X9L47ZdIK6p3CRyOcugR9YltBEvLZNxTlwIlq4JRKD68w0DEuyp4x17y2wwEBBDTdqXt8x26UsNMhEoT/o3GOoPTBo4ynES/2aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCc/sDE6mMSW7mn4yBfAaAU+QC0ySQvwfs6JiD2mR3A=;
 b=DLUCLrlDOBQLM90uBd0bpPLr4Efz0us8WqYhRtYonjJx9VFjyiLlcB9ZdHKo7JzI+s7mep2QWIR9/Hzq2ANbCKIh1ZOFk5s1IfokctU053uSIg0c4mrYwnKHv3gWSlBwCAX1CTFygXKHv6dN1QByd84tqD7KiLFDwyZSj+7n4vA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <2568567a-d876-4e31-8576-88fca23e4b45@amd.com>
Date: Fri, 16 Feb 2024 09:33:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Make hwdom vUART optional feature
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240215143947.90073-1-michal.orzel@amd.com>
 <8ea2f0ef-29ab-4a50-a59f-1f01af2f1b2a@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <8ea2f0ef-29ab-4a50-a59f-1f01af2f1b2a@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|BN9PR12MB5145:EE_
X-MS-Office365-Filtering-Correlation-Id: 67e2e47d-d9c0-4187-14c6-08dc2ec9e844
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XF5rr7QJrFZzKa5FY36GXiJKEqeE6M60AysjQgUENmCgvNoPmRHSHEIsnLZ1zX94cx5gNRdH5Nybu+FaDvcStidTFnKpDIEvbsbKeK/BVNItqIrN74sdyeXPTra52vct6Nx9yi8S+OQXMjszRYomSgvfVrpB0ZtTk51uo4sJ+PymWag2K/GMC/TLb8ZdnFfVpoUWLs4soJ7R72gb2JIUcApmNCcwWLpYJENcYYE0HUqDv+7d4CoD3U3HX2pI00HzNPm1ZclrEX4ig5wfL/kWkz4ZV4IfedU330TzIy1w+GGh6z6VDqQSBQqvSHVIoSPmzuZ6uw10FOMplIPixJyQaCgAPHrJgu3+9o+YyTzimWYX4+xszevx3YA8Li3or/S1FSg/9Egu4YB/YzLSd4cJ84Rk9NUddaz87sMuH9KFUp1RR/tamUDvcFqShdmOmpfCpMU5pVbRspfwF08piq697Pr9X+H29tfuJ4mDrgBhwXoT4DNYj/mpdVe6G8gQ22v0MoS5Jq+KdS1XaXU5uJk7BnTOvy39NHbyX+KBpJCZowtFJQJAdM5P5tQYbeyiX5BKjWeawgIxFXaVt20sY+eAfwX1GZ7SVyVdpaCp4TtvSFo0XxBEb1dsXHLZMmWqT4vES3n1QHF2Yt2V5tFjb5UQqipjxWvJ0RZdFIywSD084eE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(39860400002)(136003)(230922051799003)(82310400011)(451199024)(1800799012)(64100799003)(186009)(36860700004)(46966006)(40470700004)(83380400001)(44832011)(2906002)(356005)(81166007)(110136005)(82740400003)(8936002)(8676002)(54906003)(16576012)(316002)(53546011)(4326008)(478600001)(70206006)(70586007)(26005)(2616005)(336012)(426003)(5660300002)(41300700001)(86362001)(31696002)(36756003)(31686004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 08:33:09.8910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67e2e47d-d9c0-4187-14c6-08dc2ec9e844
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5145

Hi Julien,

On 15/02/2024 17:05, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 15/02/2024 14:39, Michal Orzel wrote:
>> At the moment, the hardware domain vUART is always compiled in. In the
>> spirit of fine granular configuration, make it optional so that the
>> feature can be disabled if not needed. This UART is not exposed (e.g.
>> via device tree) to a domain and is mostly used to support special use
>> cases like Linux early printk, prints from the decompressor code, etc.
>>
>> Introduce Kconfig option CONFIG_HWDOM_VUART, enabled by default (to keep
>> the current behavior) and use it to protect the vUART related code.
>> Provide stubs for domain_vuart_{init,free}() in case the feature is
>> disabled. Take the opportunity to add a struct domain forward declaration
>> to vuart.h, so that the header is self contained.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>   xen/arch/arm/Kconfig              |  8 ++++++++
>>   xen/arch/arm/Makefile             |  2 +-
>>   xen/arch/arm/include/asm/domain.h |  2 ++
>>   xen/arch/arm/vuart.h              | 15 +++++++++++++++
>>   4 files changed, 26 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index 50e9bfae1ac8..72af329564b7 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -150,6 +150,14 @@ config SBSA_VUART_CONSOLE
>>         Allows a guest to use SBSA Generic UART as a console. The
>>         SBSA Generic UART implements a subset of ARM PL011 UART.
>>
>> +config HWDOM_VUART
>> +     bool "Emulated UART for hardware domain"
>> +     default y
>> +     help
>> +       Allows a hardware domain to use a minimalistic UART (single transmit
>> +       and status register) which takes information from dtuart. Note that this
>> +       UART is not intended to be exposed (e.g. via device-tree) to a domain.
>> +
>>   config ARM_SSBD
>>       bool "Speculative Store Bypass Disable" if EXPERT
>>       depends on HAS_ALTERNATIVE
>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>> index 33c677672fe6..7b1350e2ef0a 100644
>> --- a/xen/arch/arm/Makefile
>> +++ b/xen/arch/arm/Makefile
>> @@ -71,7 +71,7 @@ obj-y += vtimer.o
>>   obj-$(CONFIG_SBSA_VUART_CONSOLE) += vpl011.o
>>   obj-y += vsmc.o
>>   obj-y += vpsci.o
>> -obj-y += vuart.o
>> +obj-$(CONFIG_HWDOM_VUART) += vuart.o
>>
>>   extra-y += xen.lds
>>
>> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
>> index 5fb8cd79c01a..8218afb8626a 100644
>> --- a/xen/arch/arm/include/asm/domain.h
>> +++ b/xen/arch/arm/include/asm/domain.h
>> @@ -91,6 +91,7 @@ struct arch_domain
>>
>>       struct vgic_dist vgic;
>>
>> +#ifdef CONFIG_HWDOM_VUART
>>       struct vuart {
>>   #define VUART_BUF_SIZE 128
>>           char                        *buf;
>> @@ -98,6 +99,7 @@ struct arch_domain
>>           const struct vuart_info     *info;
>>           spinlock_t                  lock;
>>       } vuart;
>> +#endif
>>
>>       unsigned int evtchn_irq;
>>   #ifdef CONFIG_ACPI
>> diff --git a/xen/arch/arm/vuart.h b/xen/arch/arm/vuart.h
>> index bd23bd92f631..36658b4a8c7f 100644
>> --- a/xen/arch/arm/vuart.h
>> +++ b/xen/arch/arm/vuart.h
>> @@ -20,9 +20,24 @@
>>   #ifndef __ARCH_ARM_VUART_H__
>>   #define __ARCH_ARM_VUART_H__
>>
>> +struct domain;
>> +
>> +#ifdef CONFIG_HWDOM_VUART
>> +
>>   int domain_vuart_init(struct domain *d);
>>   void domain_vuart_free(struct domain *d);
>>
>> +#else
>> +
>> +static inline int domain_vuart_init(struct domain *d)
>> +{
>> +    return 0;
> 
> NIT: I was going to query why we return 0 rather than -EOPNOSUPP. But it
> looks like this is because domain_vuart_init() is unconditionally called
> for the hardware domain. This is unusual and would be worth adding a
> comment.
> 
> In any case,
> 
> Acked-by: Julien Grall <jgrall@amazon.com>
Thanks. If you want to add a comment, feel free to do in on commit.

~Michal

