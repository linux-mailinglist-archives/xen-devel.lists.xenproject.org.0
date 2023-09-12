Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC40679C7FE
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 09:18:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599996.935606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfxf9-0004WF-BD; Tue, 12 Sep 2023 07:18:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599996.935606; Tue, 12 Sep 2023 07:18:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfxf9-0004UA-8a; Tue, 12 Sep 2023 07:18:19 +0000
Received: by outflank-mailman (input) for mailman id 599996;
 Tue, 12 Sep 2023 07:18:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t/Nr=E4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qfxf6-0004U2-UD
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 07:18:17 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e88::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88c4ad0a-513c-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 09:18:14 +0200 (CEST)
Received: from SN7PR04CA0003.namprd04.prod.outlook.com (2603:10b6:806:f2::8)
 by PH7PR12MB6660.namprd12.prod.outlook.com (2603:10b6:510:212::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Tue, 12 Sep
 2023 07:18:10 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:806:f2:cafe::ab) by SN7PR04CA0003.outlook.office365.com
 (2603:10b6:806:f2::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35 via Frontend
 Transport; Tue, 12 Sep 2023 07:18:10 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.17 via Frontend Transport; Tue, 12 Sep 2023 07:18:09 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 12 Sep
 2023 02:18:09 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 12 Sep
 2023 02:18:09 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 12 Sep 2023 02:18:08 -0500
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
X-Inumbo-ID: 88c4ad0a-513c-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DTeHciFi+RQlYxrb3gv3S1JerOTd0qGnO7lxQvJICh8+o/EH778CoxDola8DcVSxfcgc40VQT9YBsk0ff6sgxstvrTE/4EEcHh7JczSgkEfVHwNYlozwVtKwCHySQJoHvKzAUEBXq1thmvu3chcT7+6WbZrc6lB+u9M1eDVWz5Z23XDWdU+KQ1a7QPDqv3/b1kUUxzWLCoZUvIr/RjPVn2aGjPXznqKe9U+row8blVMnEDmQbqt6rZoxVtNdLAo9H6eH7ivJb/nyYIRl8/X5uR23Q6dFcq20MOW+8Je8pj+nlsaV26ZgdrtS1d9IE/TegdZW1nEAMrXo6dKDhRq5Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTI3z+saNJaVJL2qSdIaPUg3YylWbHJV/ZNidfwunVA=;
 b=OrQzywIrwHL0UuIOkfcSDQ4E2ka8FoeS4DuvDNVE+fHhFN19NBG3/vyYNm5HvO2/eit36NhKIS0wCkR2xtS0gYUV6DXF3qml7IRn+3LpBVAJAe/gwX/GXw/BFPmUQWIU4Lt4uKkUJftlDqOVAeAAKrYA0sAHhXrDImPje9fo4eJE6ktAYigNVbQ7V5GFKU46j3tk+EJ2r8foTJnky7a5odCazMIhvYXTudvMJUjRfMzWmzag/u0qd0bSj5GFgV0tQLR1ty6gE/eDsSwaHZAAV4B3WHRvfaFpFWinsbd5ENRm5sxqzY6PQbZ78c6cyZZAAb420EwnTt4/6ncZancB/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTI3z+saNJaVJL2qSdIaPUg3YylWbHJV/ZNidfwunVA=;
 b=Sj7xNWBACdqijiTbvm9OpjIsGKXRP1fTgzMk50Ruj8Jynx483RqbQs8zU9ZZYdfrFfIut74b9bGuKQK3twWuhBhTnBycIqJk6M0RTGxTn3boD76xca1LfpYBq3NAC1G40PnHOT5hoUVNsOdCD+hsry8QnmNpm4RKWtmytGXtDjY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a649d56c-0bdd-2383-6073-477a8202f049@amd.com>
Date: Tue, 12 Sep 2023 09:18:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] xen/arm: Skip Xen specific nodes/properties from hwdom
 /chosen node
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20230911123401.27659-1-michal.orzel@amd.com>
 <366e89e3-bc3d-4c54-b1ad-8147abbabdc7@xen.org>
 <042fae56-e8e2-c079-2686-d27c5469b7fc@amd.com>
 <e24a7d3a-ca18-474b-bce2-84b97512c58e@xen.org>
 <faf253c3-2c99-9380-c120-a2dd3110b796@amd.com>
 <alpine.DEB.2.22.394.2309111620130.1847660@ubuntu-linux-20-04-desktop>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2309111620130.1847660@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|PH7PR12MB6660:EE_
X-MS-Office365-Filtering-Correlation-Id: 22bbbc75-a1fe-47c6-de7b-08dbb3606b2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QvnIzV2RYW6JcMB6+BIoZ+iobXkarpm+F7Lf4CcUp5eLLAQJZZkU5HdnI3o4qYXxEPeuX6vNYyPP2GSeP/qUkRvff+Fl+WuRY04CtgkVDXz8utmVX8HGzK2SOEuV4HxVVeLszrLjU9R15S8NP7tUWdiysvJsyzNWALuAyuSW8L7gqmmqlhoD29gn0RHwnJgAO9StqA9+CKzHlryfAWPWGxWm8NCdkaKRoAUm2f0veITY9z70o+8IeO1oOmMrQB2q6K8XOstxFwLmLA4Aq2TkbjNx5SH4JSK+IpPodTtXCqxQyxJai8xVzPkwOS7vUi/Ztwjnc9NgHbNA7u10zd6//eggg+w+ZpHJUvrqvKqD8ucNCpZm8LkBcAi11YZvn8cGCBTDNf9vUAYb13qylrVdkvIRlHe5yKipICKaK7fwmhkb+B2ltKs8Rpen2d1a0UxHaxVlV7fbsAWstOXvzeuNCfOHPxZotHdKEq6Pll+gPImHeRJxJUg+iU8eIix9igVSMPxjJuQbz0xZjRdDudjJrO0Sh7/vNTOcEvul1gPe2uoabjPHwbZ56YTEK8TYHaJkM31uVBQk1k09nUZ11dEWuT50Iujfhtj/mjd1qoTnWAqWIfxHR3YgbC/n7LUr4QU1zl7QRXyo3GraPJw6sbftSQLiFmhkhw2a8O0btZhK3uLicJU9AXgurNI1mGMcLgrFdYZcWJJSzwqv7kgt4F0SVwsrmdEB84z+ycXz0mHvoLldNoBB/YYC3fky0s6LmZtoZKQ1oxUbj7s5YdfB3Y4UoW7OgkY2C3nicznej7/bHwxpZU/TCRbmtF8O7PSQQ7PlkEkQ5VmVkhpJPkFOIXX/GQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(39860400002)(346002)(396003)(82310400011)(1800799009)(186009)(451199024)(46966006)(36840700001)(40470700004)(53546011)(36756003)(40460700003)(83380400001)(356005)(82740400003)(81166007)(31696002)(86362001)(36860700001)(47076005)(2616005)(70206006)(426003)(336012)(26005)(40480700001)(16576012)(54906003)(316002)(41300700001)(6916009)(70586007)(2906002)(44832011)(8676002)(8936002)(31686004)(966005)(478600001)(5660300002)(4326008)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 07:18:09.8832
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22bbbc75-a1fe-47c6-de7b-08dbb3606b2d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6660

Hi Stefano,

On 12/09/2023 01:21, Stefano Stabellini wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Mon, 11 Sep 2023, Michal Orzel wrote:
>> On 11/09/2023 16:48, Julien Grall wrote:
>>> On 11/09/2023 15:01, Michal Orzel wrote:
>>>> Hi Julien,
>>>>
>>>> On 11/09/2023 15:14, Julien Grall wrote:
>>>>>
>>>>>
>>>>> Hi,
>>>>>
>>>>> On 11/09/2023 13:34, Michal Orzel wrote:
>>>>>> Host device tree nodes under /chosen with compatible string
>>>>>> "xen,evtchn-v1", "xen,domain-shared-memory-v1" are Xen specific and not
>>>>>> meant to be exposed to hardware domain.
>>>>>
>>>>> So, how dom0 is meant to discover the static event channel, shared
>>>>> memory it can use?
>>>>
>>>> For static shared memory:
>>>> A node with this compatible is only meant for Xen since it contains information like host-guest mapping.
>>>> Xen creates a different node for guests under /reserved-memory.
>>>> Linux binding:
>>>> https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/reserved-memory/xen,shared-memory.txt
>>>> Xen node generation:
>>>> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/domain_build.c;hb=HEAD#l1407
>>>
>>> Ah good point. I agree with this one.
>>>
>>>>
>>>> For static event channels:
>>>> This is a bit weird so let me put it in a different way.
>>>> 1) Xen does not create any node for static evtchn for domU.
>>>> 2) The booting.txt states:
>>>> There is no need to describe the static event channel info in the domU device
>>>> tree. Static event channels are only useful in fully static configurations,
>>>> and in those configurations, the domU device tree dynamically generated by Xen
>>>> is not needed.
>>>> 3) The "xen,evtchn" property specifies the local port as well as phandle of domU node.
>>>> dom0 does not have access to domU nodes, therefore exposing a property with not existing phandle
>>>> makes me think that:
>>>
>>> You have a point for the phandle. Yet, this is the only way dom0 can
>>> find the event channel today. As we exposed it, I don't think we can
>>> remove it until we have a proper replacement.
>>>
>>> We might get away if the feature is not supported it at all. But there
>>> is no statement, so it is a little unclear whether the feature is meant
>>> to be in technical preview.
>>>
>>> In any case, I think the commit message deserve a bit more explanation
>>> as hiding "xen,evtchn-v1"/"xen,domain-shared-memory-v1" is not
>>> uncontroversial.
>>>
>>>> a) point 2) applies to dom0 as well and we should hide this node or > b) there is a missing property for both dom0 and domUs to tell them
>>> about static local port in a proper way
>>>>
>>>> Exposing Xen specific evtchn node only to dom0 and not to domU with required information happen to be found as first value
>>>> in xen,evtchn is definitely not a proper solution.
>>>
>>> My concern here is we exposed such information to dom0. So as I said
>>> above, I don't think we can simply remove it as there is no other way to
>>> find such information today.
>>>
>>> It doesn't matter that it wasn't exposed to domU.
>>>
>>>> Also, there is no Linux binding for it.
>>>
>>> AFAIK the static event channel support was not added in Linux until very
>>> recently. Also, I think the kernel doesn't directly use the static event
>>> channel. So it is possible, this is just an overlook.
>>
>> I've found this thread in which Stefano, Rahul and Bertrand agrees on not exposing
>> any dt property and the rationale behind:
>> https://patchwork.kernel.org/project/xen-devel/patch/4836304496e6fbbea41348ed8cc9fcf6b0f3e893.1648049827.git.rahul.singh@arm.com/
> 
> yes it was done on purpose
> 
> 
>> I would not call exposing node to dom0 as something done deliberately given that it happens automatically by copying. So my understanding is
>> that we did not want to expose any node and dom0 case was overlooked (since done automatically).
>>
>> Exposing half the interface (from system POV) in a way it should not be done (phandle) is not great IMO.
>> In any case, if you insist on keeping xen,evtchn, I can leave with it.
>>
>> This feature is marked as tech preview with no Linux binding in place so I would not be worried.
> 
> Yes I agree. I don't think we risk breaking anything. I would remove
> that info from Dom0. Even if we wanted to expose it to Dom0, this is not
> the right way to do it...

Ok, so my understanding was correct and the code itself need no change. Following Julien advice to add more
information to commit msg, my proposal for it is as follows:

Skip the following Xen specific host device tree nodes/properties
from being included into hardware domain /chosen node:
 - xen,static-heap: this property informs Xen about memory regions
   reserved exclusively as static heap,
 - xen,domain-shared-memory-v1: node with this compatible informs Xen
   about static shared memory region for a domain. Xen exposes a different
   node (under /reserved-memory with compatible "xen,shared-memory-v1") to
   let domain know about the shared region,
 - xen,evtchn-v1: node with this compatible informs Xen about static
   event channel configuration for a domain. Xen does not expose information
   about static event channels to domUs and dom0 case was overlooked (by
   default nodes from host dt are copied to dom0 fdt unless explicitly marked
   to be skipped), since the author's idea was not to expose it (refer
   docs/misc/arm/device-tree/booting.txt, "Static Event Channel"). Even if we
   wanted to expose the static event channel information, the current node
   is in the wrong format (i.e. contains phandle to domU node not visible by
   dom0). Lastly, this feature is marked as tech-preview and there is no
   Linux binding in place.

~Michal

