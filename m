Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB67C805B3A
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 18:37:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648166.1012243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAZM4-0006H2-SG; Tue, 05 Dec 2023 17:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648166.1012243; Tue, 05 Dec 2023 17:37:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAZM4-0006EO-Nt; Tue, 05 Dec 2023 17:37:08 +0000
Received: by outflank-mailman (input) for mailman id 648166;
 Tue, 05 Dec 2023 17:37:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H3q/=HQ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rAZM3-0006EH-G9
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 17:37:07 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e89::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e78b9c53-9394-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 18:37:05 +0100 (CET)
Received: from MN2PR15CA0035.namprd15.prod.outlook.com (2603:10b6:208:1b4::48)
 by MW4PR12MB7312.namprd12.prod.outlook.com (2603:10b6:303:21a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 17:37:00 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:1b4:cafe::53) by MN2PR15CA0035.outlook.office365.com
 (2603:10b6:208:1b4::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29 via Frontend
 Transport; Tue, 5 Dec 2023 17:37:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Tue, 5 Dec 2023 17:37:00 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 5 Dec
 2023 11:37:00 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 5 Dec
 2023 11:36:59 -0600
Received: from [172.28.155.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 5 Dec 2023 11:36:57 -0600
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
X-Inumbo-ID: e78b9c53-9394-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WfWY+lUhc45OKsjex93MPlTvCOlHEcehu/oUJJCtUpLU+AKydxCHMd0heuHsSu/jOqBbIWeMpbewbwCawa2aXYkbEdcYNk5QKeHvRObUZJlOUlnHzrCzhjbgyNHbuVTgP7N0qQci6tFsJO/IRf+9Ed2iPHsttsMJbOZDxtZhfdOfkmWMfXYS+hRQiuMpGcmCTdabp93XHzVNvDyglfVFUSrEQHOOML9PhaQJ0I5fkX5hWnIACSlho16xn0bNcTGrygONlK+DWtIoVmAd+YvbDCa4vEoCS7x3KyTMq0ENJTh4zREbjDEMz82wqA/RXkwKmvrkyWBQQ59SVYNuHt2Egw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5AEX5YrWkKg5si0T8yPCHviqsvYAN+ikYqrxp7XoJ54=;
 b=WcLfniCPqE7Dg/koBDY92pGAvMhOQyO4zRxGXXqGZ9/Ji67Qg2Ys8W8WLH+5JWp5wNTucSqKIR2RMa9vHT7VkY/Dol46s19VzHLgMXI4W5b0gtzw/2U84FwE9pVi5Tqg1psmgWkEeHdIGOSNT3Z9Ncd1aDkvTH+Tmyfye/DS8HtCJeQF81kMl5KSE5ULtsnLmZwOSm4dYk1duax5FkrZ9P4fsz2nuLIwIYXQZQukZYXe4T0JcGJK2SeafZCguu3LyoWoQ//Z0CRDiZRysNDyDNzPHVv+ZnKnngZEbACabNy5ZmdE2iqFjr/I5z0b/wMeJk+8NPhYzuCf9BDB4ywbyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5AEX5YrWkKg5si0T8yPCHviqsvYAN+ikYqrxp7XoJ54=;
 b=NSsoZkSBWa1kyGWJDw05t1BiIoZ0NTWxpeAIg9r58nsCTNUDMTadVBG1UEYCA0Vf/Jw4pFp3YnyZ2knBmZts+84eOrmM1NiZ3PJYWagQhc+YZdh+hm1qHBSrAv4baMEObh1jQMvMK7WpRKoCtna9zDt1zh8TYVMEM45itbiRxiY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <075bae3d-c255-4354-9917-191cce3ba1b1@amd.com>
Date: Tue, 5 Dec 2023 12:36:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] [FUTURE] xen/arm: enable vPCI for domUs
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, "Bertrand
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
 <ZW8EkQLTwEEK6fXC@macbook> <8980b420-8e6a-4dd9-ba5f-bd2eb527c2f7@amd.com>
 <ZW9ZYeDD7k146LsB@macbook>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ZW9ZYeDD7k146LsB@macbook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|MW4PR12MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: a828d9b0-a445-4bd5-772b-08dbf5b8c970
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tWzBiseTJ4euE9D1z3e87A92gmeSbMnjcrPXKKj5nzwpyWedZRDbHKxOrq/JDi8qaY/ciU73GKSZQCvbIbEp9A/jKj2J2dLHRchcy7iATWCroc7wUht0b/Z6Mpl3ewIox/H0szDLSVulFBgcITf97fY0+t9VpJx4mqPh9ML2QGvmmFQ61Exw7DtAj8JqIeI1WPxGhIyT8I76CEyHinbHmk7aTteAwQQ7ehN3SIR09VgUnanZ2NpTcgu30MlyHk3Ch6uTNqXo55i+3AgnfdBnXXH7TWOn2OcE7NMSgLFDU/HOPmoJnhRhsnDcMidS067Zw4XVwu2PgDqxeegwpbO1fDF0llZjsE9mZxzMCCCmuUGu5WH/QP/T3lIHZswO+9fOiqJfDMTgqVlynix48+90YOtIv2d1lif+YOh9A08Qdi1S/RTa1Xz29H2udqV1I4JEbK7UyBzrMi1Wkon6ZzguWwFk5/2QMsYjISoFfwS/kmDT/LY5z1EAkF5GauJQ6qqd3zmq66jCYFN6cGZD6VCIet4wB2KHZQO3vegLtA69RyBpnisXZUcYPRM/OYFZmC6qTAKa0XDWWI3K4n1/bQhDnXUIOpjT4ZOIQ4tuQGR/iWRj/F167qtPaY7nvXNGpRz2wjQBkTB0t3IbgZ89a00XLl+Ag+sorz3tfn6HdIdhOOhu5lw7C6EMlKCZyvC9ze5gIN0yYpYvE0Hhg2LvsXGvSiTe1djgj8V3KJVQuYDounL36M3GdUFY3qxCTJceh17zA/AmV0KwF0YiQbyoDBFRneYMIU7YPpz+LZtOzCNOwb8GTgNh4OjLZMh4ujIJyrI4PVJYs7YRPwY543qnNEGvDstNufYo0uGskqaRO/9jVDY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(346002)(136003)(396003)(230273577357003)(230922051799003)(230173577357003)(82310400011)(1800799012)(451199024)(186009)(64100799003)(46966006)(36840700001)(40470700004)(40480700001)(31686004)(478600001)(53546011)(47076005)(8936002)(2616005)(81166007)(26005)(16576012)(336012)(54906003)(426003)(4326008)(8676002)(70206006)(70586007)(6916009)(316002)(83380400001)(7416002)(40460700003)(356005)(82740400003)(36756003)(36860700001)(44832011)(2906002)(5660300002)(86362001)(31696002)(41300700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 17:37:00.4810
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a828d9b0-a445-4bd5-772b-08dbf5b8c970
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7312

On 12/5/23 12:09, Roger Pau Monné wrote:
> On Tue, Dec 05, 2023 at 11:27:03AM -0500, Stewart Hildebrand wrote:
>> On 12/5/23 06:08, Roger Pau Monné wrote:
>>> On Mon, Dec 04, 2023 at 02:07:51PM -0800, Stefano Stabellini wrote:
>>>> On Mon, 4 Dec 2023, Roger Pau Monné wrote:
>>>>> On Fri, Dec 01, 2023 at 06:56:32PM -0800, Stefano Stabellini wrote:
>>>>>> On Fri, 1 Dec 2023, Roger Pau Monné wrote:
>>>>>>> On Mon, Nov 13, 2023 at 05:21:13PM -0500, Stewart Hildebrand wrote:
>>>>>>>> @@ -1618,6 +1630,14 @@ int iommu_do_pci_domctl(
>>>>>>>>          bus = PCI_BUS(machine_sbdf);
>>>>>>>>          devfn = PCI_DEVFN(machine_sbdf);
>>>>>>>>  
>>>>>>>> +        if ( needs_vpci(d) && !has_vpci(d) )
>>>>>>>> +        {
>>>>>>>> +            printk(XENLOG_G_WARNING "Cannot assign %pp to %pd: vPCI support not enabled\n",
>>>>>>>> +                   &PCI_SBDF(seg, bus, devfn), d);
>>>>>>>> +            ret = -EPERM;
>>>>>>>> +            break;
>>>>>>>
>>>>>>> I think this is likely too restrictive going forward.  The current
>>>>>>> approach is indeed to enable vPCI on a per-domain basis because that's
>>>>>>> how PVH dom0 uses it, due to being unable to use ioreq servers.
>>>>>>>
>>>>>>> If we start to expose vPCI suport to guests the interface should be on
>>>>>>> a per-device basis, so that vPCI could be enabled for some devices,
>>>>>>> while others could still be handled by ioreq servers.
>>>>>>>
>>>>>>> We might want to add a new flag to xen_domctl_assign_device (used by
>>>>>>> XEN_DOMCTL_assign_device) in order to signal whether the device will
>>>>>>> use vPCI.
>>>>>>
>>>>>> Actually I don't think this is a good idea. I am all for flexibility but
>>>>>> supporting multiple different configurations comes at an extra cost for
>>>>>> both maintainers and contributors. I think we should try to reduce the
>>>>>> amount of configurations we support rather than increasing them
>>>>>> (especially on x86 where we have PV, PVH, HVM).
>>>>>
>>>>> I think it's perfectly fine to initially require a domain to have all
>>>>> its devices either passed through using vPCI or ireqs, but the
>>>>> interface IMO should allow for such differentiation in the future.
>>>>> That's why I think introducing a domain wide vPCI flag might not be
>>>>> the best option going forward.
>>>>>
>>>>> It would be perfectly fine for XEN_DOMCTL_assign_device to set a
>>>>> domain wide vPCI flag, iow:
>>>>>
>>>>> if ( HYPERCALL_VPCI_FLAG_SET && !has_vpci(d) )
>>>>> {
>>>>>     if ( has_arch_pdevs(d) )
>>>>>     {
>>>>>         printk("All passthrough devices must use the same backend\n");
>>>>>         return -EINVAL;
>>>>>     }
>>>>>
>>>>>     /* Set vPCI domain flag */
>>>>> }
>>>>
>>>> That would be fine by me, but maybe we can avoid this change too. I was
>>>> imagining that vPCI would be enabled at domain creation, not at runtime.
>>>> And that vPCI would be enabled by default for all PVH guests (once we
>>>> are past the initial experimental phase.)
>>>
>>> Then we don't even need a new CDF flag, and just enable vPCI when
>>> IOMMU is enabled?  IOW: we can key the enabling of vPCI to
>>> XEN_DOMCTL_CDF_iommu for specific domain types?
>>
>> There are many Arm based platforms that need to use iommu but don't have (or don't use) PCI, so we'd still like to have a separate vPCI flag.
> 
> OK, read below though - if we switch to vPCI being a descendant of
> IOREQ (so that the PCI config space decoding is done by IOREQ) we
> could hotplug vPCI managed devices at runtime without requiring any
> prior initialization at domain create, since the traps to the PCI
> config space would be setup by IOREQ.
> 
> We might need a PCI flag in order to signal whether the domain is
> intended to use PCI devices or not, and so whether IOREQ needs to
> setup PCI config space traps (either fully emulated or passthrough
> devices).  But that would be arch-specific AFAICT, as on x86 we
> always trap accesses to the PCI IO ports.

On Arm, the toolstack (or dom0less creation code) needs to construct a {v,ioreq}PCI root complex node in the device tree before guest boot. Attempting to hot plug such a device tree node at runtime sounds like a goal for the (far) future. On Arm, we don't trap the {v,ioreq}PCI config space by default, so, yes, we for sure would need such a {v,ioreq}PCI flag for setting up the {v,ioreq}PCI mmio handlers if we go this route.

