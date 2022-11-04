Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D80F6195A9
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 12:52:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437540.691997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqvF7-0004LP-Tu; Fri, 04 Nov 2022 11:52:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437540.691997; Fri, 04 Nov 2022 11:52:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqvF7-0004IV-Qg; Fri, 04 Nov 2022 11:52:13 +0000
Received: by outflank-mailman (input) for mailman id 437540;
 Fri, 04 Nov 2022 11:52:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4Yn=3E=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oqvF6-0004IP-1a
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 11:52:12 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2068.outbound.protection.outlook.com [40.107.100.68])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bc94813-5c37-11ed-8fd1-01056ac49cbb;
 Fri, 04 Nov 2022 12:52:09 +0100 (CET)
Received: from BN0PR04CA0040.namprd04.prod.outlook.com (2603:10b6:408:e8::15)
 by PH7PR12MB5901.namprd12.prod.outlook.com (2603:10b6:510:1d5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 4 Nov
 2022 11:52:06 +0000
Received: from BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::9b) by BN0PR04CA0040.outlook.office365.com
 (2603:10b6:408:e8::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Fri, 4 Nov 2022 11:52:05 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT045.mail.protection.outlook.com (10.13.177.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 11:52:05 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 4 Nov
 2022 06:52:05 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 4 Nov
 2022 04:52:05 -0700
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Fri, 4 Nov 2022 06:52:03 -0500
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
X-Inumbo-ID: 1bc94813-5c37-11ed-8fd1-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ik396+UXLMhOuGXPHPzmF0qJqj5oDbMV+D9WkNNUY7HssyhHgPcFHIqQUmjrZSFH1nk6Xm/tZxGREonAjOFP3po/FcW1x8kwjsBQxSE68OGM+1yzr9rq41B+OmN0pW2WHv+ANIu45bJEQHc3cWYIz8e+jEaLOhF1/4S0oz5D9ubh0JC8NCplc64K0Pd326gUfayNQh9FS88oQh5vTSBAy1P6H61Li96eB3MueziE5xZIqOqpqaHdUHDJ084jLc9pTN6DM7N63goenR4XXPpBo2WAyMkKUSa2N7GZEvrZfxqTzEwpN9yXN0E+D1ZlB05GO4qlNVZ8avOAguZ8G/SNVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFEIUwlv5vt9leYEZ50wsW/8cwkFnoT1YEVs5Imbq5c=;
 b=Dd/HdGhDk8RjGhHBnyiXSsJPiNBFYK80J32UKop8JWJuT3qxX5DdWE0g9mXGLl1w/7SxDqNxnUYE+kd5e189XjzdLEKhKEzu7GPtME1GM9OLBl92sf2dvdpWw2RxIWgZDdS2owWa6Lwqp/NdEqrjU8jrJsceHjf+PeXpKAuR9y5gWuQZlq5tnTcKpd/KLO8gXzBxJbQCtTs+iyUUblKU1l3iJP+Y7WuVhUWCJ1xGwg+C6WrWkLV+WZcKEl9BFUqE2H8hn8FdBCMo1hx9QjLy3rIphHzNu2esH6DQK6pOD3Js5J3IUASHC9KG9zd7zP0/o9OBoZ+qk2HnCmanntvBsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFEIUwlv5vt9leYEZ50wsW/8cwkFnoT1YEVs5Imbq5c=;
 b=LfwRUFz7pLCAUoos7BmP/EvSeGyFfQOUMCCEvzPiddvpMFtZwQUeBeQWJvBN9sHRKB9Eb2sToB/QojfnpffVBWB26x5DW9xzL8tYIl+Fw5BcfG5oXAXllQJHz9f4hiK4mIhES4AlD7YZWjYwj6jxTGhkrc9KkYWLKgB1ns2JoeA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <496f490a-1f87-d36f-7e47-1f4a331699f3@amd.com>
Date: Fri, 4 Nov 2022 12:52:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [XEN v2 12/12] xen/Arm: GICv3: Enable GICv3 for AArch32
Content-Language: en-US
To: Julien Grall <julien.grall.oss@gmail.com>, Ayan Kumar Halder
	<ayankuma@amd.com>
CC: <Bertrand.Marquis@arm.com>, <Volodymyr_Babchuk@epam.com>,
	<burzalodowa@gmail.com>, <sstabellini@kernel.org>, <stefanos@xilinx.com>,
	<xen-devel@lists.xenproject.org>
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-13-ayankuma@amd.com>
 <45df5e11-9697-96ca-3c89-39bdbba48637@amd.com>
 <09b11bfe-6b7b-2da7-84ed-ad7c7c89b516@amd.com>
 <CAJ=z9a3cbtjzkfWpibE9ArFOS7LVntXKoH-hxhFEqXJPD0VXZQ@mail.gmail.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <CAJ=z9a3cbtjzkfWpibE9ArFOS7LVntXKoH-hxhFEqXJPD0VXZQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT045:EE_|PH7PR12MB5901:EE_
X-MS-Office365-Filtering-Correlation-Id: 1346fa60-36b9-4b84-9654-08dabe5afed8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	38DdJBC05ubMO1B1fWpub3O/e8RbtQ1nuZCSOESgjBhAhP5aPYJptrpLNZ4xJGBFUta0ZrJRbw7bbT+svkL9c5sZrazf82m0FP9RrSyqVgu9qZF21ocfosNNoNnWLtvtD+LEG7kiGeka5d8pAVOsBB6uT29NcQxvtOkKWHiJYLS1LWS1XBcpQp+KBlCp0+4/Jps7OOAw7zmHhzODdri0vP17sgcWMezLy8f9LIumoILGi1/E9StzFMcMG73/FO2p0rAuj7FcsOd74LWwHXBbZhny+HueVitqvCfuq+LLmO1WahRZNv7kh1KzMyAuEZ01y0qaafvBqeFTBgNvQshvg+luX6v3t6z3nqvF+LaxBlbkoZCrqQfLqmGsOBA9YpfXci1bxenbipITT9m+h9L0pwwrOIvhqesYuZxw9Y6QJTupaTYMTuDtKSrCOHzI/PEvnysbQo6Fj64r2ZIJcnZrAiMphYTWVQW9vGLX7b5ElMKinUSqI1+JcbKw2MJ0CXlwU+qK7BtZFZ0Z5WS72cm80xiQ26McgVp0lbjn28gs1Jq2uFmwTK+k+SUzQ4Jni6HoYo1H3bibtmCR2pKZrd3mN+IOEmvacJ8+N5PDic6JeWZKpBtyxqk4AFa4dHnFJNU0hB3WymzNq/xIxO5Ix/NtTWYzyzEO7VwPESQTF2plxHRpkU3GCb3gZPO88uZP2kI4qrtaf3gGzxYMha3JSsoj1eXJ/kjQuXliYwWhtMO9STNlNZ0o3+NFh6hVS8H564USIwsWDLovrrnrryS3l6bzH4s2WdqPajpVG0Rx9lqe74DO8A5ARnVbyhqx/cvwoBqriI6dQwO4IgwAcqoGDAUKTA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199015)(36840700001)(46966006)(40470700004)(8676002)(356005)(82740400003)(81166007)(70586007)(70206006)(336012)(36756003)(26005)(6636002)(110136005)(47076005)(316002)(2906002)(41300700001)(4326008)(53546011)(16576012)(54906003)(83380400001)(86362001)(31696002)(44832011)(40460700003)(40480700001)(36860700001)(5660300002)(8936002)(186003)(2616005)(31686004)(82310400005)(478600001)(426003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 11:52:05.7975
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1346fa60-36b9-4b84-9654-08dabe5afed8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5901



On 04/11/2022 12:30, Julien Grall wrote:
> 	
> 
> 
> 
> 
> On Fri, 4 Nov 2022 at 12:09, Ayan Kumar Halder <ayankuma@amd.com <mailto:ayankuma@amd.com>> wrote:
> 
> 
>     On 04/11/2022 09:55, Michal Orzel wrote:
>     > Hi Ayan,
>     Hi Michal,
>     >
>     > On 31/10/2022 16:13, Ayan Kumar Halder wrote:
>     >>
>     >> Refer ARM DDI 0487G.b ID072021,
>     >> D13.2.86 -
>     >> ID_PFR1_EL1, AArch32 Processor Feature Register 1
>     >>
>     >> GIC, bits[31:28] == 0b0001 for GIC3.0 on Aarch32
>     >>
>     >> One can now enable GICv3 on AArch32 systems. However, ITS is not supported.
>     >> The reason being currently we are trying to validate GICv3 on an AArch32_v8R
>     >> system. Refer ARM DDI 0568A.c ID110520, B1.3.1,
>     >> "A Generic Interrupt Controller (GIC) implemented with an Armv8-R PE must not
>     >> implement LPI support."
>     >>
>     >> Updated SUPPORT.md.
>     >>
>     >> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com <mailto:ayankuma@amd.com>>
>     >> ---
>     >>
>     >> Changed from :-
>     >> v1 - 1. Remove "ARM_64 || ARM_32" as it is always true.
>     >> 2. Updated SUPPORT.md.
>     >>
>     >>   SUPPORT.md                            | 6 ++++++
>     >>   xen/arch/arm/Kconfig                  | 4 ++--
>     >>   xen/arch/arm/include/asm/cpufeature.h | 1 +
>     >>   3 files changed, 9 insertions(+), 2 deletions(-)
>     >>
>     >> diff --git a/SUPPORT.md b/SUPPORT.md
>     >> index cf2ddfacaf..0137855c66 100644
>     >> --- a/SUPPORT.md
>     >> +++ b/SUPPORT.md
>     >> @@ -82,6 +82,12 @@ Extension to the GICv3 interrupt controller to support MSI.
>     >>
>     >>       Status: Experimental
>     >>
>     >> +### ARM/GICv3 + AArch32 ARM v8
>     >> +
>     >> +GICv3 is supported on AArch32 ARMv8 (besides AArch64)
>     > Looking at the CONFIG_GICV3, it can be enabled on arm32, which at the moment
>     > supports only ARMv7 (see __lookup_processor_type -> proc-v7.S).
>     > What will prevent the user from enabling GICv3 for ARMv7 based CPU?
> 
> 
>     Yes, this is my mistake.
> 
>     ARMv7 does not support GICv3.
> 
> 
> The same could be said for Xen on Aarch32 Armv8. This is not officially supported but works with some tweak in the lookup function.
> 
> 
> 
>     I should have introduced a new macro AArch32_v8R so that GICV3 is
>     defined for it.
> 
> 
> I would rather not have such config. There are no issue to allow someone to build it for 32-bit because Xen is perfectly capable to detect which GIC version is in use.
> 
> Instead we could simply disable GICv3 by default for arm32.
+1

~Michal

