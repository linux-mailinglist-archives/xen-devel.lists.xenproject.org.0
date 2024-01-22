Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B88A683610B
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 12:20:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669774.1042184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRsL0-0002Mm-76; Mon, 22 Jan 2024 11:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669774.1042184; Mon, 22 Jan 2024 11:19:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRsL0-0002KU-45; Mon, 22 Jan 2024 11:19:34 +0000
Received: by outflank-mailman (input) for mailman id 669774;
 Mon, 22 Jan 2024 11:19:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dZf3=JA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rRsKy-0002KO-Gj
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 11:19:32 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c4e7d9d-b918-11ee-98f2-6d05b1d4d9a1;
 Mon, 22 Jan 2024 12:19:31 +0100 (CET)
Received: from DS7P222CA0013.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::22) by
 PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.34; Mon, 22 Jan 2024 11:19:25 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:8:2e:cafe::b0) by DS7P222CA0013.outlook.office365.com
 (2603:10b6:8:2e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34 via Frontend
 Transport; Mon, 22 Jan 2024 11:19:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Mon, 22 Jan 2024 11:19:24 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 22 Jan
 2024 05:19:24 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 22 Jan 2024 05:19:22 -0600
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
X-Inumbo-ID: 1c4e7d9d-b918-11ee-98f2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IPHcWQ9kJmS0gyV1OztmXpG0+CqUP6K5WljNo8ltCX/quIi4v/LpB5yMlw6Ane9++bBMV7zeXWN0fbHtBXeGTbyhn5pm5QflPOVOVfXU2VHAAVXjkjyKqxHJIW7PXKTMQSG6zJef/+ow8mfUxP942t3+24bxlT/rh3aAG6I8V4e51VpLbRGay/jqyMN8pGjGbCmzYPaOrM77zGNc4efl7nrWlcHNPzDK52U0wu7l031NNI3B/fJjJ9CL+sHHZUCsmKPwfD8PKMFUhfPqIyaQnwBedCTOToN13ivjhNr/Gb/OA3kgtzTYuLhhDW/KClPC1mqUl9KTeTQj7lCniA99Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EGQvmtIofyN7O9/Qk/4JVihYSkBbWHQUWSyRZo2mQ+8=;
 b=Dxrfg7fG8/4aPyDDpl2LNQtBgZqojBDVme5OvXDarAATafdHQA2yizAAXrlTZRjMPDBPusJDZwOZZXfZXjbYuPttnnMOANqQ7oD90XphDkYPpftQ6uo3pCB9mzEnGIpF8bxWPe+IYUVB4z4f7x9K1yJGPGaQiTgt0hn8VcwKuzJmYWe5B77CaiTyjAnH/4S4AGlS21lirNdxJTMqa0CEEbGxoJUB5F/8ugxnjOCKZ2i7NWcT1xoDA7TkdhY5fA60LwiFKuA61UPXirxiUVCnaFbnAIP0QO4UOXhB2Nle1nFkSA1vfkLKUrgKSOeTzcm1Tu+BqznM1TwnjQSJrPrZJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGQvmtIofyN7O9/Qk/4JVihYSkBbWHQUWSyRZo2mQ+8=;
 b=hPoQPB7cKEyqExDs/f3eP/+nnwA1zvzK4HV5qqDaFng3mHH47o2KpVjakqnkQ7jWQnGxZOE2HFuCsSAgKV6fvd6BKn5uImO8jsvGiFC2hGxLTEeMQh5SyFqM/vDPz9OjeFn3QFcHO2k+mSsE6wt6w2BxFu5wLZ8xtUEtvSigRfo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <5f5f7867-439f-4abf-9f46-5f0d7fdcab3b@amd.com>
Date: Mon, 22 Jan 2024 12:19:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coverage: filter out lib{fdt,elf}-temp.o
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Javi Merino
	<javi.merino@cloud.com>, <xen-devel@lists.xenproject.org>
References: <20240118120641.24824-1-michal.orzel@amd.com>
 <8057ae41-43b5-4469-b691-4e7f16b8dd4d@suse.com>
 <e399890c-0299-4ec5-884e-0637ae6cb5b0@perard>
 <9d552e6d-eb5d-4ccf-a35d-a359df7c4478@amd.com>
 <0a1c749b-8169-43b5-9921-961096f8570d@perard>
 <0437c4eb-8438-44a8-a749-aef6c4c93ef0@suse.com>
 <01dd5e72-c33c-49c7-838a-4e0eba454c05@perard>
 <d4842805-7e94-49ce-8f14-78642f469e02@perard>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <d4842805-7e94-49ce-8f14-78642f469e02@perard>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|PH0PR12MB5481:EE_
X-MS-Office365-Filtering-Correlation-Id: d2a30eb9-f77c-4e6e-017f-08dc1b3bfd76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gwzFgvx0PHgz7T8+kDEa07pBRDG/TaEfwa7j5bJj1/X2nFHOynrvwVPnmMwAsyRpc9M1hXO790ukS+48KQZt7bGGimRXHAJuA3mfROY7PmOiOLa83OO7AFUtOpXsna3WspLXneqtL7Uv1dHCyaCTJYZIOSjWZXoKu86VIPiFTmpqD0LcnJftu8Ml/OUNuFvpbCXGVr7jcny14zriifpVS+dYhbugxXVgkZdu45wTunkMJqOwFIpllZ2b0S5mHxTyayFrzK9pd3snGyLK2JhxEFNdgpgYTodfBEfE5pinPjwczgWMudBFxYoSgopq3HntU1rS7M9m9LmTb1YwnGc0any8wKeMi+85/EgVuvLCarbvRhaxl3Ds98v6KEtXmriSpTL5v4V1q9eV4MhDdZxA4xbWsgXmineUXaQVlC3yUBKvJLhnlO65glaa4QM1DBFOP/iVdhYAzH/AmzGo9jEiwyPvyMhzax89LnSYUcxSSr95Qos1GPKYNoZeKrcX2fluogs0VWiyad4svW6wpX1q++6zKT8DmwmfNASxoGolZMDhX/HyMhIbLTBN/iZLfkFMnjG3somIMetbafOfarg2gT47cCMGl35SW4Y+otowcZXbbjPQU1iOH/GO9JfN/5l0mMpFTLPiFwWjinYxKZfEvGW+FQ7UCkOkcnWzAztzUNyvUP1QYs788t4VXjw/LTOS48FsdESVPuHrirTSSgX6xaXWglPQIBfSH3pcAKNUAz35dWZ73DpFWxLsrRYbyXmOWJL3Fixd0vV4uk2u9uiZ/jOy4U++Xc27iMtQ/lUHE3oi5etihUJ5XZRHcSjZRTtS
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(346002)(39860400002)(136003)(230922051799003)(64100799003)(186009)(82310400011)(451199024)(1800799012)(46966006)(40470700004)(36840700001)(31686004)(40460700003)(40480700001)(336012)(426003)(53546011)(26005)(2616005)(31696002)(86362001)(82740400003)(81166007)(36756003)(356005)(41300700001)(44832011)(36860700001)(5660300002)(2906002)(47076005)(478600001)(8936002)(4326008)(8676002)(110136005)(70206006)(70586007)(16576012)(316002)(54906003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 11:19:24.8376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a30eb9-f77c-4e6e-017f-08dc1b3bfd76
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5481



On 22/01/2024 12:05, Anthony PERARD wrote:
> 
> 
> On Mon, Jan 22, 2024 at 10:54:13AM +0000, Anthony PERARD wrote:
>> On Mon, Jan 22, 2024 at 11:04:41AM +0100, Jan Beulich wrote:
>>> On 19.01.2024 16:25, Anthony PERARD wrote:
>>>> On Fri, Jan 19, 2024 at 09:43:30AM +0100, Michal Orzel wrote:
>>>>> Is my understanding correct that by switching from extra-y to targets we are preventing these objects to
>>>>> appear in non-init-objects (and thus having COV_FLAGS appended) while retaining the proper if_changed behavior?
>>>>>
>>>>> According to docs/misc/xen-makefiles/makefiles.rst:
>>>>> Any target that utilises if_changed must be listed in $(targets),
>>>>> otherwise the command line check will fail, and the target will
>>>>> always be built.
>>>>
>>>> Indeed, and $(extra-y) is added to $(targets) via
>>>> $(targets-for-builtin).
>>>>
>>>> While switching from $(extra-y) to $(targets) prevents the objects from
>>>> been added to $(non-init-objets), it doesn't matter because "libelf.o"
>>>> is in that variable, so $(COV_FLAGS) is added to $(_c_flags) and its
>>>> value is used in all the prerequisites of "libelf.o" which includes
>>>> "libelf-temp.o" and for example "libelf-dominfo.o". So the only thing
>>>> preventing $(COV_FLAGS) from been added when building "libelf-tools.o"
>>>> for example is that we set `COV_FLAGS:=` for "libelf.o".
>>>
>>> Yet doesn't that (again) mean things should actually work as-is, [...]
>>
>> No, because I've explain how it should work, in the hypothetical world
>> where we have `targets += libelf-temp.o $(libelf-objs)`.
> 
> The problem is that there's currently two "paths" to build libelf-temp.o
> (and even three I think for libelf-tools.o libelf-loader.o
> libelf-dominfo.o):
> 
> Simplified makefile:
> 
>     obj-y := libelf.o
>     extra-y := libelf-temp.o
>     COV_FLAGS := -fcoverage
> 
>     __build: $(extra-y) built_in.o
>     built_in.o: $(obj-y)
>     libelf.o: COV_FLAGS :=
>     libelf.o: libelf-temp.o
> 
> So, make can build "libelf-temp.o" as prerequisite of "__build" the
> default target, or as prerequisite of "libelf.o".
> In the first case, COV_FLAGS would have all the flags, and in the second
> case, COV_FLAGS would be reset, but that second case is too late as make
> is more likely to have already built libelf-temp.o with all the flags.

Thanks for detailed explanation. I will follow your rationale in v2.

~Michal

