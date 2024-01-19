Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E1B8325ED
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jan 2024 09:44:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668950.1041444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQkTd-00018q-Os; Fri, 19 Jan 2024 08:43:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668950.1041444; Fri, 19 Jan 2024 08:43:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQkTd-00017G-M8; Fri, 19 Jan 2024 08:43:49 +0000
Received: by outflank-mailman (input) for mailman id 668950;
 Fri, 19 Jan 2024 08:43:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RylD=I5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rQkTc-000179-6G
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2024 08:43:48 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db2b1078-b6a6-11ee-9b0f-b553b5be7939;
 Fri, 19 Jan 2024 09:43:45 +0100 (CET)
Received: from MW4PR04CA0163.namprd04.prod.outlook.com (2603:10b6:303:85::18)
 by DS0PR12MB7630.namprd12.prod.outlook.com (2603:10b6:8:11d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Fri, 19 Jan
 2024 08:43:40 +0000
Received: from CO1PEPF000044F6.namprd21.prod.outlook.com
 (2603:10b6:303:85:cafe::e0) by MW4PR04CA0163.outlook.office365.com
 (2603:10b6:303:85::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24 via Frontend
 Transport; Fri, 19 Jan 2024 08:43:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7228.0 via Frontend Transport; Fri, 19 Jan 2024 08:43:40 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 19 Jan
 2024 02:43:38 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 19 Jan
 2024 00:43:32 -0800
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 19 Jan 2024 02:43:30 -0600
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
X-Inumbo-ID: db2b1078-b6a6-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b2d6ycoKxapZGzWoYcThF7KPn8eH/KHhbvJibVJzngMSPvP1FkHrFMPQ6eY9jPIk5FXD/dgUiJYnOTYM0x/vjlwfa/QsFYcUGdLsrP+nCmF9uKAAJagQcHuDMLG+53PSKSw6/PsHGvV+qG+HA5HHj75XTuqoW5F4PSGi6Rjc4AK8wAjY07tyZ1KtRwTkZTO6qpELTHOfmFTFRZ/icfhgkDJIMj8xnPKa0pjRVH+y3FD/X8xiZkRShRRq6Jh4/NnjNJDw3Td2kVHC3YVKxm/WElPTk8n8buSvCW8MtBftEB9f5CNSruyMuR2CsFmhLj4e8S55lLPfAZpyBGI768QtmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rngjgy9wFR31B6/tllA2FHw6Ko9u/eMHQO3ycEUY5Go=;
 b=m3UUdV6q6N3TOgymPgDqE4obqk3Wc8sTMQwPrSDshyVRwqHSGCMLlhhGZBPB8CamdlvX9S8WsGgOShHm4jm1Tf5Ki0Urdwai7HvsYLAfyfGwitdkrAA3nMbazx96sqRf0CVzA0G7QRC14g+F9NIOtMp0//Kjxxeam7i/oqcr5okOauEuOkH69LjmvU9mTbpYsvkcnIxuL3zPK9G9IlAlcAwPskQaN2JSL/SN20NR2+5Tlill4OTXHXYKeFXYq7inrauW82q6QcfEEMwNnsxnVVX3kltKBHumRuU8reS0hjIR77jAeusDo1zjW31pV83y+0kJjaQVTKvezilHI4bwdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rngjgy9wFR31B6/tllA2FHw6Ko9u/eMHQO3ycEUY5Go=;
 b=c2KBUA1irX2kTzri80zs0xNvxurBOk4auxYnar/wQy/+loWQ3gPs+dwe3At6wqVJgbc4ruN0N4Etb3VlmgQpuixS+VcUyy5pdMk/b7ieHUEK2IF1c4Vu2UwjF/C6HBGYZanFLEoVL6nhj5XFGsM7OxD20Ixo4oALLLOBuI1UgUI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <9d552e6d-eb5d-4ccf-a35d-a359df7c4478@amd.com>
Date: Fri, 19 Jan 2024 09:43:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coverage: filter out lib{fdt,elf}-temp.o
To: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Javi Merino
	<javi.merino@cloud.com>, <xen-devel@lists.xenproject.org>
References: <20240118120641.24824-1-michal.orzel@amd.com>
 <8057ae41-43b5-4469-b691-4e7f16b8dd4d@suse.com>
 <e399890c-0299-4ec5-884e-0637ae6cb5b0@perard>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <e399890c-0299-4ec5-884e-0637ae6cb5b0@perard>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F6:EE_|DS0PR12MB7630:EE_
X-MS-Office365-Filtering-Correlation-Id: 762944da-d6aa-460b-0430-08dc18cabc4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WwdeSRfd7Uq27XslPfjbTHXXz+ljlL1mQxa4ffBjy5j6J3jf2qQAckNH5IW//8eBG74FJTCBHG2zQgxFyEwibcyb0P5JEMeE+gd0M2MdNpInhThPqcZ+/4r5BYBSXtLG4rdrlp2z0qiHcKU6Nr5X4rvbmqrb7HAJM6wgkpwqJjG2hV+OLuF/bvL7m8bWPXaNF73TM2hNHbUxy9OIzZFrM97HCOF8DQb3gcWI7t4LzOel6e+VkLOICSz1McFI6085hrlEupqjs/FIaiOvPqGVWRFW8ssIgWfH7rv8wVADTFTJUBLk7rsBloE8Be+nYF5yP1D31RxS6+LsGiNqV7wTbft8xeWfeyJ5C1upsjT2kDRIulJRmRpIbWQc9mrbeSHqztTVriJ5GoGRTHHiFEesAkjUizrwn6lFwUvFE5rbfCY3yvqH5N7cPsP8TMQfbLpwfi2SmPqfZ1bAIPYi6kn4JkR9H2JrgVty/ehM7lhrNEsbzOWjyCerlGIyBoyCluTbPzTFyMvKS8Y+PHl1to/U7IF3sxWdhxDVCoUxG1PLeSm0ifhlOVRtb0/T+96aLxFy4MHlIqGxwUrbPNDSCEvWX24mOyJAe38uCH+fXD//RQTL6RUPo+JteJGoreAj84DMAEgKYpBHdQZ2u7Yd/Atc5InbiPIgAcw1hEGGVhGjZRLvEa9uVsjr1+CSjuV0IKZsF4nKXcCl0kBrI9r9EUsLcbLALrjHr9thd1r0u07LXiutgNmEdGChXHey9CfunqdQno4IFQLRkx4aArzOW4TCa+TPNohBhB3aLmPw8EvVIHxcT9wEea77oL/k+hyNRzbH
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(39860400002)(136003)(346002)(230922051799003)(186009)(82310400011)(451199024)(1800799012)(64100799003)(46966006)(36840700001)(40470700004)(426003)(53546011)(2616005)(26005)(336012)(36860700001)(5660300002)(47076005)(44832011)(83380400001)(4326008)(2906002)(70206006)(70586007)(110136005)(16576012)(54906003)(8676002)(316002)(478600001)(41300700001)(8936002)(31696002)(36756003)(81166007)(86362001)(82740400003)(356005)(31686004)(40460700003)(40480700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 08:43:40.0051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 762944da-d6aa-460b-0430-08dc18cabc4e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7630

Hi Anthony,

On 18/01/2024 18:37, Anthony PERARD wrote:
> 
> 
> On Thu, Jan 18, 2024 at 02:12:21PM +0100, Jan Beulich wrote:
>> On 18.01.2024 13:06, Michal Orzel wrote:
>>> At the moment, trying to run xencov read/reset (calling SYSCTL_coverage_op
>>> under the hood) results in a crash. This is due to an attempt to
>>> access code in the .init.* sections (libfdt for Arm and libelf for x86)
>>> that are stripped after boot. Normally, the build system compiles any
>>> *.init.o file without COV_FLAGS. However, these two libraries are
>>> handled differently as sections will be renamed to init after linking.
>>>
>>> This worked until e321576f4047 ("xen/build: start using if_changed")
>>> that added lib{fdt,elf}-temp.o to extra-y. Any file listed there without
>>> *.init.o suffix will be part of non-init-objects for which COV_FLAGS
>>> will be appended.
>>
>> While this is true, aiui COV_FLAGS would be empty for anything listed
>> in nocov-y and all of the prerequisites of those objects (iirc target-
>> specific variable settings propagate to prerequisites). Therefore ...
>>
>>> In such case, the solution is to add a file to nocov-y.
>>
>> ... libelf.o / libfdt.o already being listed there ought to suffice.
>> Alternatively listing only libelf-temp.o / libfdt-temp.o ought to
>> suffice as well.
>>
>> Since you apparently observed things not working, I must be missing
>> something.
> 
> Yes, $(extra-y) is like $(obj-y), but objects there will not be added
> "built_in.o". So, make is likely building "libelf-temp.o" and deps
> because it's in $(extra-y) rather than because it's a prerequisite of
> "libelf.o". We could ask make to process prerequisite in a reverse
> order, and suddenly, the command line to make all "libelf-*.o" is
> different: `make --shuffle=reverse V=2`.
That's helpful.

> 
> So, adding extra object to $(nocov-y) is a workaround, but I think a
> better fix would be to add those objects to $(targets) instead of
> $(extra-y). I think I've made a mistake by using $(extra-y) instead of
> $(targets) in that original commit.
I can confirm that by moving lib{fdt,elf}-temp.o and deps to targets, the issue is gone as well.

Is my understanding correct that by switching from extra-y to targets we are preventing these objects to
appear in non-init-objects (and thus having COV_FLAGS appended) while retaining the proper if_changed behavior?

According to docs/misc/xen-makefiles/makefiles.rst:
Any target that utilises if_changed must be listed in $(targets),
otherwise the command line check will fail, and the target will
always be built.

~Michal

