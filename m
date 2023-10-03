Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E69AB7B6318
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 10:04:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612145.951982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnaN8-0004zq-K3; Tue, 03 Oct 2023 08:03:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612145.951982; Tue, 03 Oct 2023 08:03:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnaN8-0004xf-H4; Tue, 03 Oct 2023 08:03:14 +0000
Received: by outflank-mailman (input) for mailman id 612145;
 Tue, 03 Oct 2023 08:03:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Pu2=FR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qnaN6-0004xZ-OC
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 08:03:12 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7eab::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ad3927e-61c3-11ee-9b0d-b553b5be7939;
 Tue, 03 Oct 2023 10:03:10 +0200 (CEST)
Received: from CH2PR03CA0021.namprd03.prod.outlook.com (2603:10b6:610:59::31)
 by BL1PR12MB5803.namprd12.prod.outlook.com (2603:10b6:208:393::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.22; Tue, 3 Oct
 2023 08:03:04 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:610:59:cafe::81) by CH2PR03CA0021.outlook.office365.com
 (2603:10b6:610:59::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33 via Frontend
 Transport; Tue, 3 Oct 2023 08:03:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343F.mail.protection.outlook.com (10.167.18.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Tue, 3 Oct 2023 08:03:03 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 3 Oct
 2023 03:03:02 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 3 Oct 2023 03:03:01 -0500
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
X-Inumbo-ID: 4ad3927e-61c3-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQQdBnt8FhNSLCjVTHSj6vv9Ykr2pNEcZSt6DWijL/JOkqhV/RhWLqKjjTQqB3ZAOw5eGvYsYx5606nCtAwzY87fcK2H8R0+wP34S1+McSO/NwIOBX3gh0Px10vNhcMAiwzjgZK5M9Xv5OmOEMvl2qfLTeeNBsQvK1S7ymdGu7NPwoPD5CuNf0I9JQbzPAnoddc7OXlBXyJq+pLgOoryScwu4H7fT6+uvgFhTcCSrawzuZellq2jdoVI7IYdHaCwbX6lvmbAUHa3UEkO3IDK04iFSTR+YrWjDOWnLNrmcHWtq2pBbU3mS31XNgYzk99S7IuHZD4d8YZOehaRLju8JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2XaB+ckofUpoaU1pmzu3s6eb0YZ/OuLFhLfOOAtr4E=;
 b=GGLGxRJAokIgyqlXxblTzRi1PrmYvwshLebBOSv+r+0LKHy+c8FwG8wl1Q0eoNfm9PX+JY98BTmSUdarVd04hicZIOlxmU3fqEwqIWkZEWhs7RMvyrH2prWBpGkFEzcEjxse/E3DPAS1zm5bAfGYMQIUjvhxg8f9ms7SuHs7JIC8nPRgwFc0nw71cc/TgsnQ31WkJfgabghqfYoXfGRHgHvvESJJWRBaJSbNn+AAoT+uIXERsRu5HumUY1CVpHDCMeL3spvwq8aqOrBxQ2+JLzzrhvrcq4uhb514XScNHmJ0hARVQawJIrnz+8O37uBzXe6YiA/LtpdaBwzWyCRQDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2XaB+ckofUpoaU1pmzu3s6eb0YZ/OuLFhLfOOAtr4E=;
 b=LM4baOrVvT0lWl3CJ3NBsXNMo417CK80tWTH47g9/9X10wPgXGnZjVnjyhLlUEJ59GX6dIJeJcvi8QlX6Dnydt+YS4Yk4tI6WMeTrOOa64X2Rd0TU2NrWc4KLc0CGT9+FlGOkNuA12wWaTnDCOlJvpkJ63hRpCLsJWbuIMNf0Lw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <dc16dc72-4a35-457d-b019-2351e3051c32@amd.com>
Date: Tue, 3 Oct 2023 10:03:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 3/5] arm/dom0less: put dom0less feature code in a
 separate module
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall
	<julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen
	<Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230927140133.631192-1-luca.fancellu@arm.com>
 <20230927140133.631192-4-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2309281726440.1996340@ubuntu-linux-20-04-desktop>
 <725342EA-730F-4961-88A4-43EC0CBAD5BA@arm.com>
 <alpine.DEB.2.22.394.2309291242570.2348112@ubuntu-linux-20-04-desktop>
 <bc2a043a-9836-429b-88bb-6bedda5343bf@xen.org>
 <38AD4AA5-D038-4114-A614-80BF91FB51FB@arm.com>
 <alpine.DEB.2.22.394.2310021512210.2348112@ubuntu-linux-20-04-desktop>
 <0348B5FA-D65C-4D70-99A4-47398BD4266C@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <0348B5FA-D65C-4D70-99A4-47398BD4266C@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|BL1PR12MB5803:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cf58a4b-c5ba-4f21-3ed7-08dbc3e72b88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	APEAK77767WzR+RPjEQh0RJH7wdgV8n3jgr3/MFJffOnWde8kotMTB7O90QMGql5JFxN+9jKTqnkTnaQeGRD4ACbhXqrSErUFZNsTme8sC320jaBpCBklPe22uyV2k4rD13Xc07dCG7u4NJE/65h8v8KLBfoXoEok6LqRQDHcg2rZtAZ95G1qLgwnllzsfTuMMCSKPLHDA+V+1mxU6H7J5J2GHVlv1a8Rb2yp/rx+JQ6eVFWOR1vZR8EbKrgc63Nxrdcd4Sk45JVQm8ZGiEuD2GU9liAO8h4yF7++owvWep3xQzCqFZoAC0plWmwxh/qUSBeaTjWUhMKNa3RrPm98oUXMZMRBQrd4orlZkUYdGSctgftGKYAc+BNXYq7cymAnUqgYrx2ce9RDP4xSrfmH6NboyuJvNZ1R8isVbkKxgFVL6QPsSoxJo+SPr9TQFY0XaKitmcSDdiFJd4zhs5q00Me6YavKwXirFMs7KiJGcUJftHtdnfGgH3zsBMVS5xlWEunTNNSRbAeag0IZiAry70g9yMSIC6Sw/A31aeIZYpbRGpDd0k6xaZvSQiijkEwycTLJSYpKCAJzruzuxrSFd4bgt+zsQspOA25SXQfVnK8J3s86HLgly4U3pyJLFhhBNC7hheoz2CVwb8R7KSbTkrxKFAwL8sl3/WGGUTL7Lp1BCcz+dcE3Ba74cU0hhZrF/JHcVxABm/jxzfgXcojpC9KkrURcOrrlR2wAgCIMSwLMiZLcxPoZ1HqE1p9VIGVy1crWEr5A56uWCoAcMnOydkfd/4GV2xD0gv+kxPPM7bka86l9+uGrgTBPUO1yqNf
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(39860400002)(376002)(136003)(230922051799003)(1800799009)(186009)(82310400011)(64100799003)(451199024)(46966006)(36840700001)(40470700004)(31686004)(4326008)(2906002)(70206006)(5660300002)(44832011)(8936002)(110136005)(966005)(41300700001)(478600001)(70586007)(8676002)(26005)(82740400003)(2616005)(53546011)(54906003)(426003)(336012)(316002)(81166007)(356005)(36860700001)(86362001)(47076005)(36756003)(40480700001)(31696002)(16576012)(83380400001)(40460700003)(32563001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 08:03:03.7330
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf58a4b-c5ba-4f21-3ed7-08dbc3e72b88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5803

Hi Luca,

On 03/10/2023 09:44, Luca Fancellu wrote:
> 
> 
>>>>> Given that code movement is painful from a git history perspective, and
>>>>> given that we have to move dom0less code to xen/common anyway to make
>>>>> it available to RISC-V and also x86, could we do it in one shot here?
>>>>
>>>> Looking at the name of the functions, I would expect that we would need another code movement in the future to move back Arm specific function under arch/arm/. So we would end up with two code movement as well.
>>>>
>>>> I would prefer if we wait until RISC-V/x86 needs it so we don't unnecessarily move Arm specific code in common/.
>>>
>>> I agree with Julien here.
>>> Moving the code now will mean moving part of it back in arm in the future once we have a second user of this.
>>> I would rather wait for the need to come so that we do this cleanly.
>>>
>>> Also using hyperlaunch name now would be weird as there was no agreement on the naming (as far as I know) so far.
>>
>> RISC-V is already using dom0less code, however in a downstream
>> repository. To make progress faster the code was copied (not shared)
>> from arch/arm to arch/riscv. More details on the Xen community call this
>> week. https://gitlab.com/xen-project/people/olkur/xen/-/blob/riscv_aia_support/xen/arch/riscv/domain_build.c?ref_type=heads
>>
>> Hyperlaunch also needs dom0less code to be made common to make progress:
>> https://marc.info/?l=xen-devel&m=169154172700539
>>
>> So I think that there is an immediate RISC-V and X86 need.
>>
>> But the point about "moving the code now will mean moving part of it
>> back in arm in the future" is valid. How do we move forward?
>>
>> I don't think we want to block Luca's progress to wait for more
>> plumbings done on x86 or RISC-V. Also we don't want to scope creep
>> Luca's series too much.
>>
>> But I think the goal should be to move dom0less code to xen/common as
>> soon as possible and make it arch neutral. How do we get there?
> 
> So here is why I felt painful doing now a move to the common code, but maybe you (maintainers) can give me some
> feedbacks.
> 
> I see that the functions that might be put in common are these, some of them however have arm specific code in them:
> 
> is_dom0less_mode
> allocate_bank_memory
> allocate_memory
> handle_passthrough_prop
> handle_prop_pfdt
> scan_pfdt_node
> check_partial_fdt
> domain_p2m_pages
> alloc_xenstore_evtchn
> domain_handle_dtb_bootmodule (contains reference to the gic)
> prepare_dtb_domU (have reference to psci, gic, vpl011)
> construct_domU (have reference to vpl011, static shared memory)
> create_domUs(have reference to vpl011, sve)
> 
> Here the functions that can stay in arm code:
> 
> make_gicv2_domU_node
> make_gicv3_domU_node
> make_gic_domU_node
> make_vpl011_uart_node
> 
> 
> Given that the status after the move to common of the above functions is not very clean, I’ve decided to don’t do that,
> however if you are fine with it, I can do the modification and who is going to work further on the subject can consolidate
> and make them build for other architecture.
> 
Another option would be to hold off for a while until work on hyperlaunch/RISCV dom0less starts to better understand the needs,
concepts and to avoid multiple code movement which results in a horrible history. I know this is not nice but I can tell you that
I had to stop working on some features like FLASK with dom0less, static domids for dom0less domUs, because according to the hyperlaunch design,
this will need to be common. With hyperlaunch, everything starts with the domain configuration that is supposed to be arch neutral, so
until this is done, it's difficult to do anything in this area.

~Michal

