Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8AE7DF93B
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 18:55:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626944.977688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qybtT-0001UZ-3J; Thu, 02 Nov 2023 17:54:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626944.977688; Thu, 02 Nov 2023 17:54:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qybtT-0001Ru-0I; Thu, 02 Nov 2023 17:54:11 +0000
Received: by outflank-mailman (input) for mailman id 626944;
 Thu, 02 Nov 2023 17:54:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mhp2=GP=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qybtR-0001Ro-PS
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 17:54:09 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20605.outbound.protection.outlook.com
 [2a01:111:f400:7eab::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cff8e0f4-79a8-11ee-98d6-6d05b1d4d9a1;
 Thu, 02 Nov 2023 18:54:06 +0100 (CET)
Received: from DS7PR03CA0333.namprd03.prod.outlook.com (2603:10b6:8:55::15) by
 CH3PR12MB9195.namprd12.prod.outlook.com (2603:10b6:610:1a3::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.21; Thu, 2 Nov 2023 17:53:59 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:8:55:cafe::8d) by DS7PR03CA0333.outlook.office365.com
 (2603:10b6:8:55::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Thu, 2 Nov 2023 17:53:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.206) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6954.19 via Frontend Transport; Thu, 2 Nov 2023 17:53:58 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 2 Nov
 2023 12:53:58 -0500
Received: from [172.28.214.164] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 2 Nov 2023 12:53:55 -0500
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
X-Inumbo-ID: cff8e0f4-79a8-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ek/JsCkm5y38h7uA/1mbJxbuFi4YzTVJHXxhSolq5ImiRztE3lRrEIDikIRZcuwAZtHOLjnNkSPX85T6Xp39Fuh1Kw7qklO3a+FQkt62YsTf+/IZjy9fCaW3TS/dyll/Bxd5GlybVji9fGQM3lqklKijwZg8mqmE1ZX+jwwTEE68z1cewU8oTmszctAB1cKqizkZ9Pa7ikMWLzlOqDV4hv8Pu+EI0HlA9AQo0JbrizNS3tACbufKOCjuhKj7Y1xiuo1EvuOyK4iyG0XWZv6wajq/E4RB93PZwIWQ5JBLCF24C4SA3HfuRndGpLzGwaF4cEOKtDH7S++iCYO6Upstcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Cp7GdJisUrzHV8In5XvrFPvdPl+Qz7Ff7zcH2mphZk=;
 b=IuoXhQmJDZorCJQD0B7ijEegxX5Xe+Y9PJOdEGe7yXKiYx9ybQ97HR2dnVWE+nI/dltqOT22MCK0WI7igfGvgCYiRanaWXizD2UmYzE7Z2GyaIStdiueAAzuiD6hXtMzcaCz+MJ3Zznaloky2o8uYYnUxm6LbAm4N2i65im6Hmnmu5uy7DLaWPO3wOmUQfRDR07hPfsP0+lq3n7vhwJ69u/mddapAXZ0nf44wEzgYF7Pg3YzGI9oUb+G935uY39YlG/vu/1RZFhpx4WFC/FvVCay+9j1T4NvpoZJEu+QLE1CV4NoLn2PPPbjPGl2p9HOg/sJUqzh6sq3sYk9V6uprQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=cloud.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Cp7GdJisUrzHV8In5XvrFPvdPl+Qz7Ff7zcH2mphZk=;
 b=O24X6piXhvWSsqML21nzyHwziV+fjzUwqUCgfbB7tq0Ab6oO+aIb4diluSQaOdKlqB91wM9gzs20vTw+nq3+xYzUDq46rfDpl3x0JOM0bqWCq2IbeDPIkCcKjb4bw4rLnqcVbaUcInb1pQeaicsZWNNoPtVWURtYddBO2bhRsW4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <7648fc06-1159-452a-8599-739020554fa4@amd.com>
Date: Thu, 2 Nov 2023 13:53:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Kconfig for PCI passthrough on ARM
Content-Language: en-US
To: Christian Lindig <christian.lindig@cloud.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen
 Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	=?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Paul Durrant <paul@xen.org>, Edwin Torok
	<edwin.torok@cloud.com>
References: <20231030235240.106998-1-stewart.hildebrand@amd.com>
 <AF82D7D3-7745-475E-97C6-54016D40980D@cloud.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <AF82D7D3-7745-475E-97C6-54016D40980D@cloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|CH3PR12MB9195:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bbde7b3-08b3-403f-01a2-08dbdbccb0cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A/vkpPSSstrHU4Uyt2SiLw2GDsu3dKX9VaYg9axSkMhXBzgyHl/psVpV70Zk4MrrpdkvYDuJkBz9uNieG7aUOPL92gNsDkVj66tmhle8qHoWO6kXNQ0rpjp0XW5ioDSSkxlwLva8QG9J9krKj9J5k2CQV/MfEjzTmjpSybMCpLiwpO4xpFT/AP6CYubQg0WQl9zsXA4iFwXK9iZzepQdnC96wgtcCO2ryxcCl3Jzl1lwaYzLR+RHdJhXqRKXJEJGSI0MjcWwg5rZUNJqUxcJjVxcA5frrBeWS2kOlnhtV6Wezlzk9qOPTkFnicJpz5X62pz/m2WjXROAcdMveBHXO6nje96XK4Z/p85xOAY99TfN+OyNigQeDHHKUiAyAYuYiKTrYBQKZ8STAWk5EgUpdU8vh7WkIvV4o53sPycNAbKSvRWHzt7eQYMgQuBYgOOLo9nKKiuRx9y8h5RQTzPTUpu51eFPPZt645dn1dTlXCfl9YAaYK+WE9+OFaY1iD2mx6MS0zeOApR53U7wDdcthG13yItOr++IwwT25/4pfcxoQZzPJlJbpelMf5inA4ixRzRmChFB+r1PLpDKehenj0LbEXjaTYH5ZPAgbSbt7YIzCU+gA0VbFQdugbvm6ZxF6b9l/tYIeUGFMOIdptpzD0c0DHwn0+rVGqQwvjv30iejU5WFzjzDTGm6S5ADytSY5mode7xQpOToxKj8OaYiZFOyE0Bt952Qic0MMoXpx2xoXhc6KRC3ai1c27jREjO4TXKYk/50aSoQftu+4U9d5vKlKerivgVoM1RkRKCrxkI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(396003)(376002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(82310400011)(40470700004)(46966006)(36840700001)(966005)(40460700003)(426003)(47076005)(26005)(336012)(81166007)(356005)(36860700001)(70586007)(6916009)(16576012)(70206006)(54906003)(7416002)(316002)(5660300002)(8936002)(8676002)(4326008)(53546011)(2906002)(2616005)(41300700001)(44832011)(478600001)(82740400003)(31696002)(86362001)(36756003)(83380400001)(40480700001)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 17:53:58.7934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bbde7b3-08b3-403f-01a2-08dbdbccb0cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9195

On 11/1/23 05:25, Christian Lindig wrote:
>> On 30 Oct 2023, at 23:52, Stewart Hildebrand <stewart.hildebrand@amd.com> wrote:
>>
>> There are multiple series in development/review [1], [2] that will benefit from
>> having a Kconfig option for PCI passthrough on ARM. Hence I have sent this
>> series independent from any other series.
>>
>> v3->v4:
>> * rename ("xen/arm: pci: plumb xen_arch_domainconfig with pci info")
>>  to ("xen/vpci: move xen_domctl_createdomain vPCI flag to common")
>> * fold ("xen/arm: make has_vpci() depend on d->arch.has_vpci")
>>  into ("xen/vpci: move xen_domctl_createdomain vPCI flag to common")
>> * split ("xen/arm: enable vPCI for domUs") into separate hypervisor and
>>  tools patches
>>
>> v2->v3:
>> * add ("xen/arm: pci: plumb xen_arch_domainconfig with pci info")
>> * rename ("xen/arm: make has_vpci depend on CONFIG_HAS_VPCI")
>>      to ("xen/arm: make has_vpci() depend on d->arch.has_vpci")
>> * add ("xen/arm: enable vPCI for dom0")
>>
>> v1->v2:
>> * add ("[FUTURE] xen/arm: enable vPCI for domUs")
>>
>> [1] https://lists.xenproject.org/archives/html/xen-devel/2023-08/msg02361.html
>> [2] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg00210.html
>>
>> Rahul Singh (1):
>>  xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig option
>>
>> Stewart Hildebrand (4):
>>  xen/vpci: move xen_domctl_createdomain vPCI flag to common
>>  xen/arm: enable vPCI for dom0
>>  [FUTURE] xen/arm: enable vPCI for domUs
>>  [FUTURE] tools/arm: enable vPCI for domUs
>>
>> tools/libs/light/libxl_arm.c       |  3 +++
>> tools/libs/light/libxl_x86.c       |  5 ++++-
>> tools/ocaml/libs/xc/xenctrl.ml     |  2 +-
>> tools/ocaml/libs/xc/xenctrl.mli    |  2 +-
>> tools/python/xen/lowlevel/xc/xc.c  |  5 ++++-
>> xen/arch/arm/Kconfig               | 10 ++++++++++
>> xen/arch/arm/domain.c              |  3 ++-
>> xen/arch/arm/domain_build.c        |  6 ++++++
>> xen/arch/arm/include/asm/domain.h  |  3 ---
>> xen/arch/arm/include/asm/pci.h     |  9 +++++++++
>> xen/arch/arm/pci/pci-host-common.c | 11 ++++++++---
>> xen/arch/arm/vpci.c                |  8 ++++++++
>> xen/arch/x86/domain.c              | 16 ++++++++++------
>> xen/arch/x86/include/asm/domain.h  |  6 +-----
>> xen/arch/x86/setup.c               |  5 +++--
>> xen/common/domain.c                | 10 +++++++++-
>> xen/drivers/passthrough/pci.c      | 10 ++++++++++
>> xen/include/public/arch-x86/xen.h  |  5 +----
>> xen/include/public/domctl.h        |  7 +++++--
>> xen/include/xen/domain.h           |  2 ++
>> 20 files changed, 97 insertions(+), 31 deletions(-)
>>
>>
>> base-commit: 9659b2a6d73b14620e187f9c626a09323853c459
>> -- 
>> 2.42.0
>>
> 
> 
> Acked-by: Christian Lindig <christian.lindig@cloud.com>

Thanks, I'll add this tag to the relevant patch ("xen/vpci: move xen_domctl_createdomain vPCI flag to common").

> 
> 
> The changes for the OCaml part are incremental; is someone using the OCaml bindings on ARM seriously? 

The patch touching OCaml is essentially code movement from x86 to common.

