Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FDF805E41
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 20:02:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648244.1012442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAagH-0001y0-8Q; Tue, 05 Dec 2023 19:02:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648244.1012442; Tue, 05 Dec 2023 19:02:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAagH-0001w1-5N; Tue, 05 Dec 2023 19:02:05 +0000
Received: by outflank-mailman (input) for mailman id 648244;
 Tue, 05 Dec 2023 19:02:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H3q/=HQ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rAagF-0001vv-KA
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 19:02:03 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20610.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4125528-93a0-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 20:02:00 +0100 (CET)
Received: from BL6PEPF00013DFD.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:1d) by PH7PR12MB7356.namprd12.prod.outlook.com
 (2603:10b6:510:20f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Tue, 5 Dec
 2023 19:01:54 +0000
Received: from BL6PEPF0001AB71.namprd02.prod.outlook.com
 (2a01:111:f403:f903::) by BL6PEPF00013DFD.outlook.office365.com
 (2603:1036:903:4::4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22 via Frontend
 Transport; Tue, 5 Dec 2023 19:01:53 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB71.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Tue, 5 Dec 2023 19:01:53 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 5 Dec
 2023 13:01:49 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 5 Dec
 2023 11:01:48 -0800
Received: from [172.28.155.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 5 Dec 2023 13:01:47 -0600
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
X-Inumbo-ID: c4125528-93a0-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cN4d4m1mBg2EWZurlPswOVPMe0xfWOoP2tO0FsqAK73e9F7guXYA8Bmal0qzU7VNCGIb/1hL9/zm/y9L8f79CCvSbJ6YgRnLPu1i3lRyHNgYtP4DoKEfdCD7jk2gZRmg3wtEcGzzwW/Xjvh01BEUHQXNay6Nz8iyISVqD8aIwaEdEgrG8CX4GgXWe2YxCVsLLA6bh9oEQW2m2WJ4Rmd6OpoLbz9Ie0NvSXySPY1j9lRlAfpB0Vqjg8olq2Y84sKDUWimPVp/rplcuVk//UfrI1QByt4uhl+7kXyPNOGyGXzOZuIHQyKTOwlLNsud76GhgeSAyjUJhHY/TbYcmzJbAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPjqbsOOnL3POvat++8FNiLpC6i7MPqqdLkyEs+dfXQ=;
 b=LRCBa9QckWSlZqTT2nbDUeZ7+PEERHlEs/rPYkgJn7TdzIPe6MR78Lk+aF3cCh40ARRYIcCMPRTaFSkjQnmiUEnpJ587FPKogCgwxJKkp6y2s8oiNl/lvKVOJMWf7qKHW79Nx/WHe4Pn6T9bzq+lVX/KJk7KoduKFIFXAk3JUlWbonAzHU2hAPNxJkHWPTOdiUQGKrraDjDhufiRKhsyROrMfIxiw7XwlDczU+x+fp1mblFNvl5hp+2Y+/AGlVZazYaYpoy9MfZidx4xIvUwSjcQ8hgvau+PpfRErPzeY5r0jvxVhE5YaypAzdlpaKseC3+99xmEKrHlcwr/NM5Wbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPjqbsOOnL3POvat++8FNiLpC6i7MPqqdLkyEs+dfXQ=;
 b=ZUsqFAVJO4L4oBFitVLlPjcLeTXI6fInxfN9YuIEQrTtwBg/juQSSzCYY2e+D3yqUqesXmGT5BMP9hu6bDfWvqliwk+ozCAzSkJs38OvdqKTYaalh9pIIk+XTIymAZ68zhR3FezT2pl9H7Rjzz5kITKrqBwLltb6OdzEx5MQElU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <16de540b-fd79-4c23-9698-a641da9c9967@amd.com>
Date: Tue, 5 Dec 2023 14:01:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] [FUTURE] xen/arm: enable vPCI for domUs
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>
References: <20231113222118.825758-1-stewart.hildebrand@amd.com>
 <20231113222118.825758-5-stewart.hildebrand@amd.com>
 <ZWmkh0Xeaynh43N7@macbook>
 <alpine.DEB.2.22.394.2312011847520.110490@ubuntu-linux-20-04-desktop>
 <ZW2wuqXW-DneUVi0@macbook>
 <alpine.DEB.2.22.394.2312041333250.110490@ubuntu-linux-20-04-desktop>
 <ZW8EkQLTwEEK6fXC@macbook>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ZW8EkQLTwEEK6fXC@macbook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB71:EE_|PH7PR12MB7356:EE_
X-MS-Office365-Filtering-Correlation-Id: c12e5c53-6da3-4474-6733-08dbf5c4a556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xkvDZ1yoFqfZ79utxmPhvObbWkuHcZEhSwim6mWJHanUtfMiuYdy8MZHsX1HCel8sN5o1/MvyvfBxxfhLwtJmIbE+gI+YtQT1Z/ruedyzPJ6xfINUPwp3myT5XW8kgd7fQuqP8TnktoqV9xZoWL6tTkUCzV/fh05CIBGKFDs+7Xi/iGCdEn9xIA20zLSCjSIdqd/tajxyvqxRZaFpokHh3GcfioY3ss7uRocuHIzqYIcqO6O3tOpl6c9zZ0h4AfiR4xm+BlAJ5PO4rEggjbBusMidTD2qO6o/wiOR0DAT1MnlKbDL0u9YF3ZtNryzfyXON5RKCDtbUe9mVAAC4aNyjH4/TncpOeol7Q5TVYboRP6nq92iM2sMgTB96Nx2eDrZv0mGYVEkcEvzkSV9JgxdPWmvuh6Gr2qonjd/LCzKf3mPitt7ILPOQY5tXrYzX/ziF84RP3oUx39jgejiZ87xaE/E5Iz0Dgqs3728rE3qtgSD/xU3G3qqiQoTSQh8Yv6zO5PW+W427ZOGHJBW7tTSkH7n8lj/6u4/68DxKo22yhBQbWzhyf5q5NyMjgin86rdxkoForQjd0+kKVMSJW1pyWFeYxyS4fL1Oq6wiSggbXA0DpD/GzPsPah1Q2Hy4msnZ6+kKTObY+WTbTtZ5xq5+Gj9WDm8/3Ufo4sazyfgzktB9yjyAVAkG913xvj7lJ+8hgE9TBcnn8dCPIEWt7AJdLE3d0ARFLlD7HnO+PoIeXV06R4J5pRIsjUKTGqOBsD5c4cREypggztE7Vq7/W8G0t6nM+LUZj7acFoIlYoKht25vhGYzfr/NuN/tCE/fJA87O/2r4TQdoQx1WVSIosCPz3pY0fDnunjfnqpB81HT5j9ohHl9UBJmqz7gvhte46RICpz6v43uoLJQN3qz4QXw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(376002)(39860400002)(230273577357003)(230922051799003)(230173577357003)(186009)(451199024)(64100799003)(1800799012)(82310400011)(40470700004)(46966006)(36840700001)(31686004)(40480700001)(66899024)(426003)(478600001)(26005)(336012)(2616005)(36860700001)(40460700003)(36756003)(82740400003)(81166007)(86362001)(356005)(31696002)(83380400001)(2906002)(44832011)(41300700001)(30864003)(7416002)(4326008)(54906003)(47076005)(70586007)(70206006)(5660300002)(110136005)(16576012)(53546011)(8676002)(8936002)(316002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 19:01:53.8886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c12e5c53-6da3-4474-6733-08dbf5c4a556
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB71.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7356

On 12/5/23 06:08, Roger Pau Monné wrote:
> On Mon, Dec 04, 2023 at 02:07:51PM -0800, Stefano Stabellini wrote:
>> On Mon, 4 Dec 2023, Roger Pau Monné wrote:
>>> On Fri, Dec 01, 2023 at 06:56:32PM -0800, Stefano Stabellini wrote:
>>>> On Fri, 1 Dec 2023, Roger Pau Monné wrote:
>>>>> On Mon, Nov 13, 2023 at 05:21:13PM -0500, Stewart Hildebrand wrote:
>>>>>> @@ -1618,6 +1630,14 @@ int iommu_do_pci_domctl(
>>>>>>          bus = PCI_BUS(machine_sbdf);
>>>>>>          devfn = PCI_DEVFN(machine_sbdf);
>>>>>>  
>>>>>> +        if ( needs_vpci(d) && !has_vpci(d) )
>>>>>> +        {
>>>>>> +            printk(XENLOG_G_WARNING "Cannot assign %pp to %pd: vPCI support not enabled\n",
>>>>>> +                   &PCI_SBDF(seg, bus, devfn), d);
>>>>>> +            ret = -EPERM;
>>>>>> +            break;
>>>>>
>>>>> I think this is likely too restrictive going forward.  The current
>>>>> approach is indeed to enable vPCI on a per-domain basis because that's
>>>>> how PVH dom0 uses it, due to being unable to use ioreq servers.
>>>>>
>>>>> If we start to expose vPCI suport to guests the interface should be on
>>>>> a per-device basis, so that vPCI could be enabled for some devices,
>>>>> while others could still be handled by ioreq servers.
>>>>>
>>>>> We might want to add a new flag to xen_domctl_assign_device (used by
>>>>> XEN_DOMCTL_assign_device) in order to signal whether the device will
>>>>> use vPCI.
>>>>
>>>> Actually I don't think this is a good idea. I am all for flexibility but
>>>> supporting multiple different configurations comes at an extra cost for
>>>> both maintainers and contributors. I think we should try to reduce the
>>>> amount of configurations we support rather than increasing them
>>>> (especially on x86 where we have PV, PVH, HVM).
>>>
>>> I think it's perfectly fine to initially require a domain to have all
>>> its devices either passed through using vPCI or ireqs, but the
>>> interface IMO should allow for such differentiation in the future.
>>> That's why I think introducing a domain wide vPCI flag might not be
>>> the best option going forward.
>>>
>>> It would be perfectly fine for XEN_DOMCTL_assign_device to set a
>>> domain wide vPCI flag, iow:
>>>
>>> if ( HYPERCALL_VPCI_FLAG_SET && !has_vpci(d) )
>>> {
>>>     if ( has_arch_pdevs(d) )
>>>     {
>>>         printk("All passthrough devices must use the same backend\n");
>>>         return -EINVAL;
>>>     }
>>>
>>>     /* Set vPCI domain flag */
>>> }
>>
>> That would be fine by me, but maybe we can avoid this change too. I was
>> imagining that vPCI would be enabled at domain creation, not at runtime.
>> And that vPCI would be enabled by default for all PVH guests (once we
>> are past the initial experimental phase.)
> 
> Then we don't even need a new CDF flag, and just enable vPCI when
> IOMMU is enabled?  IOW: we can key the enabling of vPCI to
> XEN_DOMCTL_CDF_iommu for specific domain types?
> 
> Maybe that's not so trivial on x86, as there's no x86 PVH domain type
> from the hypervisor PoV.
> 
>>
>>> We have already agreed that we want to aim for a setup where ioreqs
>>> and vPCI could be used for the same domain, but I guess you assumed
>>> that ioreqs would be used for emulated devices exclusively and vPCI
>>> for passthrough devices?
>>
>> Yes, that's right
>>
>>
>>> Overall if we agree that ioreqs and vPCI should co-exist for a domain,
>>> I'm not sure there's much reason to limit ioreqs to only handle
>>> emulated devices, seems like an arbitrary limitation.
>>
>> Reply below
>>
>>
>>>> I don't think we should enable IOREQ servers to handle PCI passthrough
>>>> for PVH guests and/or guests with vPCI. If the domain has vPCI, PCI
>>>> Passthrough can be handled by vPCI just fine. I think this should be a
>>>> good anti-feature to have (a goal to explicitly not add this feature) to
>>>> reduce complexity. Unless you see a specific usecase to add support for
>>>> it?
>>>
>>> There are passthrough devices (GPUs) that might require some extra
>>> mediation on dom0 (like the Intel GVT-g thing) that would force the
>>> usage of ioreqs to passthrough.
>>
>> From an architectural perspective, I think it would be cleaner, simpler
>> to maintain, and simpler to understand if Xen was the sole owner of the
>> PCI Root Complex and PCI config space mediation (implemented with vPCI).
>> IOREQ can be used for emulation and it works very well for that. At
>> least in my mind, that makes things much simpler.
> 
> But IOREQ already has all the code to mediate accesses to the PCI
> config space, and the interface to register separate servers for
> different PCI devices.
> 
> We would then need to duplicate this internally for vPCI, so that vPCI
> could forward accesses to IOREQ just for IOREQ to forward to yet a
> different component?  Seems like a lot of duplication for no benefit.
> 
>> I understand there are non-trivial cases, like virtual GPUs with
>> hardware access, but I don't classify those as passthrough. That's
>> because there isn't one device that gets fully assigned to the guest.
>> Instead, there is an emulated device (hence IOREQ) with certain MMIO
>> regions and interrupts that end up being directly mapped from real
>> hardware.
>>
>> So I think it is natural in those cases to use IOREQ and it is also
>> natural to have QEMU remap MMIO/IRQs at runtime. From a vPCI
>> perspective, I hope it will mostly look as if the device is assigned to
>> Dom0. Even if it ends up being more complex than that, Rome wasn't
>> built in one day, and I don't think we should try to solve this problem
>> on day1 (as long as the interfaces are not stable interfaces).
> 
> I don't see IOREQ as dealing explicitly with emulation.  Yes, it does
> allow for emulators to be implemented in user-space, but at the end
> it's just an interface that allows forwarding accesses to certain
> resources (for the case we are speaking about here, PCI config space)
> to entities that registered as handlers.
> 
> vPCI OTOH just deals with a very specific resource (PCI config space)
> and only allows internal handlers to be registered on a byte
> granularity.
> 
> So your proposal would be to implement a hierarchy like the one on the
> diagram below:
> 
>     ┌────────┐ ┌──────────┐ ┌──────────────────┐
>     │ Memory │ │ IO Ports │ │ PCI config space │
>     └───────┬┘ └┬─────────┘ └───┬──────────────┘
>             │   │               │
>             │   │           ┌───┴──┐
>             │   │           │ vPCI │
>             │   │           └─┬──┬─┘
>          ┌──┴───┴┐            │  │
>          │ IOREQ ├────────────┘  │
>          └────┬──┘               │
>               │                  │
>  ┌────────────┴──┐              ┌┴──────────────┐
>  │ IOREQ servers │              │ vPCI handlers │
>  └───────────────┘              └───────────────┘
> 
> While what I'm proposing would look like:
> 
>     ┌────────┐ ┌──────────┐ ┌──────────────────┐
>     │ Memory │ │ IO Ports │ │ PCI config space │
>     └────┬───┘ └────┬─────┘ └────────┬─────────┘
>          │          │                │
>          └─────┬────┴────┬───────────┘
>                │  IOREQ  │
>                └─┬─────┬─┘
>                  │     │
>  ┌───────────────┤     └────┬──────┐
>  │ IOREQ servers │          │ vPCI │
>  └───────────────┘          └───┬──┘
>                                 │
>                             ┌───┴───────────┐
>                             │ vPCI handlers │
>                             └───────────────┘
> 
> I'm obviously biased, but I think the latter is cleaner, and allows
> all resources to be arbitrated by the same component (IOREQ).
> 
> If the concern is about the IOREQ hypercall interface, it would be
> fine to introduce an option that limit IOREQs to internal users
> (vPCI) without supporting external IOREQ servers.
> 
> Think of IOREQ as a resource mediator inside of Xen, that just does
> the PCI address decoding and forwards the access to the interested
> party, either an external IOREQ server or vPCI.
> 
>>
>>> It's important that the interfaces we introduce are correct IMO,
>>> because that ends up reflecting on the configuration options that we
>>> expose to users on xl/libxl.  While both XEN_DOMCTL_createdomain and
>>> XEN_DOMCTL_assign_device are unstable interfaces, how the vPCI option
>>> gets placed there will ultimately influence how the option gets
>>> exposed in xl/libxl, and the interface there is relevant to keep
>>> stable for end user sanity.
>>
>> I agree with you on the stable interfaces. The important part is not to
>> introduce changes to stable interfaces that could limit us in the
>> future. Specifically that includes xl and libxl, we need to be careful
>> there. But I don't see a single per-domain vPCI enable/disable option as
>> a problem. Let's say that in the future we have a mediated vGPU
>> implementation: if it works together with vPCI then the per-domain vPCI
>> option in libxl will be enabled (either explicitely or by default), if
>> it doesn't then vPCI will be disabled (either explicitely or by the
>> newer vGPU options.)
> 
> If vPCI is hooked into IOREQ there won't be a need anymore to register
> the vPCI config space traps, as that would be done by IOREQ, and hence
> vPCI managed devices could be registered at runtime with IOREQ.  IOW:
> there won't be a need anymore to signal at domain creation whether
> vPCI is intended to be used or not.
> 
> We would obviously need to enable IOREQ for all domains with IOMMU
> enabled, as it would be IOREQ that register the PCI config space
> handlers.
> 
>> For *unstable* interfaces (XEN_DOMCTL_assign_device) I would rather wait
>> before adding more changes on top of them, not because I don't care
>> about the mediated GPU problem (we do have something similar at AMD),
>> but because I worry that if we try to change them now we might not do a
>> good enough job. I would prefer to wait until we know more about the
>> actual use case, ideally with code supporting it.
>>
>> I think the difference in points of views comes from the fact that I see
>> vPCI as the default, QEMU only as a limited peripheral emulator (or
>> mediator for the vGPU case) but not in control. vPCI and QEMU are not
>> equal in my view. vPCI is in charge and always present if not in very
>> uncommon setups (even if we decide to hook it inside Xen by using
>> internal IOREQ interfaces). QEMU might come and go.
> 
> Xen needs a single component that mediates accesses to resources,
> whether that's IOREQ, or something else I don't really care that much.

I just wanted to share what the "something else" diagram might look like.

    ┌────────┐ ┌──────────┐ ┌──────────────────┐
    │ Memory │ │ IO Ports │ │ PCI config space │
    └────┬───┘ └────┬─────┘ └──────────┬───────┘
         │          │                  │
         └──┬───────┴───────────────┬──┘
            │ PCI Resource Mediator │
            └────┬─────┬────────────┘
                 │     │
         ┌───────┤     └────┬──────┐
         │ IOREQ │          │ vPCI │
         └────┬──┘          └───┬──┘
              │                 │
 ┌────────────┴──┐          ┌───┴───────────┐
 │ IOREQ servers │          │ vPCI handlers │
 └───────────────┘          └───────────────┘

> Having vPCI mediate accesses to the PCI config space, and IOREQ to the
> memory (and on x86 IO port) space just seems awfully complicated for
> AFAICT no real benefit.
> 
> Also, you seem to confabulate IOREQ with QEMU, while the latter is
> indeed an user of IOREQ, I do see IOREQ as a simple resource mediator
> inside of Xen, that has the ability to forward such accesses to
> external emulators using an hypercall interface.
> 
>> Now that I am writing this, I realize this is also why I wasn't too
>> happy with the idea of hooking vPCI using IOREQ. It makes them look as
>> if they are the same, while I don't they should be considered at the
>> same level of priority, criticality, safety, integration in the system,
>> etc.
> 
> I feel there are some fears with IOREQ from a safety PoV?  The code
> that does the resource multiplexing is small, and as said above if
> there are safety concerns with the hypercall interface it would be
> fine to limit it's usage to internal handlers only.

Would it make any sense at all to split the resource multiplexing bits from IOREQ into a new separate PCI resource mediator?

> 
> Thanks, Roger.

