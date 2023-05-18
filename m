Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C27C8708A68
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 23:27:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536581.835041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzl9c-0001ra-EZ; Thu, 18 May 2023 21:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536581.835041; Thu, 18 May 2023 21:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzl9c-0001oc-Bv; Thu, 18 May 2023 21:27:20 +0000
Received: by outflank-mailman (input) for mailman id 536581;
 Thu, 18 May 2023 21:27:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yK0N=BH=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pzl9b-0001oV-AT
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 21:27:19 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c32efc80-f5c2-11ed-8611-37d641c3527e;
 Thu, 18 May 2023 23:27:16 +0200 (CEST)
Received: from BN0PR04CA0125.namprd04.prod.outlook.com (2603:10b6:408:ed::10)
 by SA1PR12MB8918.namprd12.prod.outlook.com (2603:10b6:806:386::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Thu, 18 May
 2023 21:27:13 +0000
Received: from BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ed:cafe::f2) by BN0PR04CA0125.outlook.office365.com
 (2603:10b6:408:ed::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19 via Frontend
 Transport; Thu, 18 May 2023 21:27:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT048.mail.protection.outlook.com (10.13.177.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.21 via Frontend Transport; Thu, 18 May 2023 21:27:12 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 16:27:07 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 14:27:07 -0700
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 18 May 2023 16:27:06 -0500
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
X-Inumbo-ID: c32efc80-f5c2-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GFuKoENbNPnebXoLEdzjJBAtns+18JEWgH+L0KI3D4eSp2TLcq249KogLMfwp7u177/0K8EnkfTAhp8y76df+2TVEyf2tc6BrRbXjsacxqjSPkwSTI9w7tksznTiQxr3sUQ+Iko1U6R2gjk0/340ZOYUFwGcjrF9Vy03jSeQk6Y1EgI6K/1kTFirP++tXquPOWyLhlpfqfEXjiKeTWg3F8oiZbkJX0aCAWiYE/4H536b+BW/jN6mjoh+yGDnXFIzPADPnsreHN8zC/3hPOkQde3JGplUugDUsjFoay6B5JoHPjVZQHXeBRsT+w15MPhQ90zYajht2h3k66oOoX1I0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xppf23Ldn6VHQaqMu3fTD0tDbMfuwtf5e9zTUkPLz9g=;
 b=XnpWOIiL19pRoUuvewRmZ5dugnxN0bCKtJ+kWjwfbE3AG1Kbv2we7j+LIbGAmSx7PwaMgrE+TSzBd1hsD9t6OBTc7II3NW5PsqqDegrU97HaUQZcEzSTQ3/RyTBh1XrPqYKDdGiMalAY+QeHWcnA3J3RE66BAf2DLpAPq2vPuqVdLMYqiDo7TjULO1ywTqiCmIvdTFAgZna7Us7/r3uEMO066xqXnalpz44C4Nftfbh3ANrbtZ3cngvSr2WcvwiwjCIlTzMYbV0uLPrsvjVIlgMLka7p8rKHKcDto5nP8PIuZcKO4u6uqwTh4OKZdF0Ge2oI5d47r4r1wR3sIRzt8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xppf23Ldn6VHQaqMu3fTD0tDbMfuwtf5e9zTUkPLz9g=;
 b=Nto+BzKZ1gfuT5pQ39OJpdRGBYMWfTznbW5JXKIlywQ57kQ+jVJNZN9rpuWkQMCuCGsloo1DGsC4bg3t1rgcLVucocYSPzZjeQDCSrr4y4313dHg2dn/SmLRII0bNAqYp0GcPj78B5otldTuCmAucygM1YjTG+Mxc24cSCBZeEU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <93adef92-90fb-80de-c6b4-b41872b74682@amd.com>
Date: Thu, 18 May 2023 17:27:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1] xen/sched/null: avoid crash after failed domU creation
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
	<dfaggioli@suse.com>
References: <20230501203046.168856-1-stewart.hildebrand@amd.com>
 <30246788-c90e-e338-de4b-e7bb2e440f4e@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <30246788-c90e-e338-de4b-e7bb2e440f4e@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT048:EE_|SA1PR12MB8918:EE_
X-MS-Office365-Filtering-Correlation-Id: 18bab9b4-4998-45af-4d20-08db57e6a51a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nY3fT41DU4FIf6T4+eRaTpIHLpuVw+CPirTuLZR3KuRaUp9ekc0T9DW1XdnpNEgK0TdP1zj+1Q5ysjgvWJES/nGszqvx+ltTet5m4a1d6m/MYUWr4dZSTqR780ehWk4cnHn4A9MClqEtVpv3Aqlbc/PDfN/1oYONb2tRw4SPd1gn/IcNCQ6AOmwHrp0fKICqD5XcCGc39jMrJ3pMyMRSdNSXJAZYF5VlC0dXKKZk3nXj+puL9ESyjlxJUHD+pLhrtARvghOHVMYJdvLAZzvIDMBaA8+ULd4GYDZZ6+6KyWZG4fykxKWsL3/z2UU79VtkAGvwH18Gg8ZCsQzoJIO6eQMhM//Lf3jczWC/hzF9bYkjCxgxvsk8krB60WUsRQKuAqyvLm1/i66p5A3Y822J6i2ZODfHKYAG9oYoSXqlidB6wLSKW5uvQROIyyAGjTAe5eM8YPKOiZWSln1wi8QxzsppAWknGxduI/NFRrxDakfLafzSHpNWvHMol8/YErzqP9ECv5Ch2IlfFaG8XXJjPVg2Y5lueVyg4YEcFLgMIQykpwxDtNLpocU85c2sbw6VinxRPSG8+zRd6mZf3IB+VvoAjlFX+tYmnyiRQbP19S1oP1TRlfnzsK4Sp6MxWTcRY9LUG2R5bXYbGvXfIzY633qdhFWcJUtA8p23nfoC+o5H7dU8uXv5U9YdRXHT8h7kKqGfOXyKlE3Rc9szafyiklZ48OqfeIy/9pTIOXwmRPYjYOEiRiCgdkR0ZnDafGEWAMiwuHn7ua8biSe9nBXv46ykSxG+ezTZboapgqcpMWo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199021)(36840700001)(40470700004)(46966006)(86362001)(31686004)(36860700001)(83380400001)(82740400003)(40460700003)(81166007)(356005)(82310400005)(41300700001)(40480700001)(36756003)(5660300002)(8676002)(31696002)(316002)(70206006)(70586007)(2906002)(4326008)(336012)(47076005)(426003)(186003)(44832011)(26005)(53546011)(8936002)(110136005)(478600001)(16576012)(2616005)(54906003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 21:27:12.6647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18bab9b4-4998-45af-4d20-08db57e6a51a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8918

On 5/5/23 01:59, Juergen Gross wrote:
> On 01.05.23 22:30, Stewart Hildebrand wrote:
>> When creating a domU, but the creation fails, there is a corner case that may
>> lead to a crash in the null scheduler when running a debug build of Xen.
>>
>> (XEN) ****************************************
>> (XEN) Panic on CPU 0:
>> (XEN) Assertion 'npc->unit == unit' failed at common/sched/null.c:379
>> (XEN) ****************************************
>>
>> The events leading to the crash are:
>>
>> * null_unit_insert() was invoked with the unit offline. Since the unit was
>>    offline, unit_assign() was not called, and null_unit_insert() returned.
>> * Later during domain creation, the unit was onlined
>> * Eventually, domain creation failed due to bad configuration
>> * null_unit_remove() was invoked with the unit still online. Since the unit was
>>    online, it called unit_deassign() and triggered an ASSERT.
>>
>> To fix this, only call unit_deassign() when npc->unit is non-NULL in
>> null_unit_remove.
>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks for the review. Does this still need a maintainer ack?

