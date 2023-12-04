Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECA8803E18
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 20:09:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647279.1010242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAEJp-00059F-EU; Mon, 04 Dec 2023 19:09:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647279.1010242; Mon, 04 Dec 2023 19:09:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAEJp-00057d-Az; Mon, 04 Dec 2023 19:09:25 +0000
Received: by outflank-mailman (input) for mailman id 647279;
 Mon, 04 Dec 2023 19:09:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y+Gv=HP=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rAEJn-00057T-LZ
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 19:09:23 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060d.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a157657d-92d8-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 20:09:22 +0100 (CET)
Received: from BL1PR13CA0208.namprd13.prod.outlook.com (2603:10b6:208:2be::33)
 by IA1PR12MB8538.namprd12.prod.outlook.com (2603:10b6:208:455::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 19:09:17 +0000
Received: from MN1PEPF0000ECD8.namprd02.prod.outlook.com
 (2603:10b6:208:2be:cafe::44) by BL1PR13CA0208.outlook.office365.com
 (2603:10b6:208:2be::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.22 via Frontend
 Transport; Mon, 4 Dec 2023 19:09:17 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD8.mail.protection.outlook.com (10.167.242.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Mon, 4 Dec 2023 19:09:17 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 13:09:17 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 4 Dec
 2023 11:09:16 -0800
Received: from [172.27.137.28] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 4 Dec 2023 13:09:14 -0600
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
X-Inumbo-ID: a157657d-92d8-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmtQAz0Vw7QkAaGXNyFS9waieVgKAmrH+1UnEn553vIaY0cFTmK6XHPE4pkdFVBJgevj85FwA3/zOnypv36vkBEiQ803bZ+CNeJ9I/94zzqgG/kkLc89yAdUNxBeB3VCbMJxFQrs/DCUPrm47hoHvsWOz0UcAgSKPIeiMrRgqd0KjT8KLrnKhC29XU1kFQKJ7njA4BOmFVsOMeb3Y7wXQqOdfXXK+C5A6pm3ZS46e4EX4Pm7Zlbr28je9jq/vpXI6kE7rljZeOlo8PiJ/KNzC6N1iXTfxCy8WTRENUSM/fohWJkAVXEjUnikXJcPVjqLilecdZdLxQKJPRnUU0eBNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AK6IDfB+uHzESfBkkm0rwzbiYaOUfaR6S9LDe9NxFCI=;
 b=E09jxR0MPHmMQgJZWhgDFn1ueuMChHkzC0HVNTmFB2RgziszTY1cxVoOElqLyzw83vKDKnybMSnock47Vkdy0gZi4uwGS/2qzErMlmM+n8rW+agWww/dDhw8IflJsNJVbODOLw8HzKVWcATbm0lVQwMFKCXOvcgow9PSukRIvBtgt4Nw3aM2wdVCRjyxhtl1wBypcRswieZ8yLWYrsvpblj7Dl5KFVpQMQaXvEEhhUqdA8YKcKFiypmr9Fif4U3x2IYsh/HrKTFO5GN9IMBmRH2eViXcBhGnRUlJkngWYHarjGFY+bfRhl4/sMqS1Vkd3NdaIyScvfo/n+X4/xWowQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AK6IDfB+uHzESfBkkm0rwzbiYaOUfaR6S9LDe9NxFCI=;
 b=PLg6bh7h9TxQV9Gn6H/yM+aZH3+Ke4ZB9AonRdCBwNJfs+WQgfXsQ+S2F4RjCd30pcesS0v+2jGdEcgf0BOMBKO75eVasDAztPjqgZMMvjvaN4j2SJwr3+Jyvq+fhjiVphdDPtuvqPR1Pgu9SKlc+GaU3XJMDkPOh3AC96dp2jg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <2d9b98f3-0c7d-4467-8354-5644623429dc@amd.com>
Date: Mon, 4 Dec 2023 14:09:14 -0500
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
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ZW2wuqXW-DneUVi0@macbook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|IA1PR12MB8538:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fb4728b-90ab-4f31-7392-08dbf4fc8343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WWVmWS2OTwVt1UbbPjo6tMeO8cqHP16BW2d1mmF4BPXDU1zmJ4zRMBQ7l6OLjZIgG5bNf54zjNKuKvPqOjn8CkLfAfM1ljtHi/j2fmt+UNPo/STJKN0BAXi1KXSiJKKHsCeNEGoaskSZVqocG/7ixR05kZQXu/EcHv4iOmJZlnbzoKuKQw6+x5KiJEYuu1bFsvILb/esFWsYMPHetAVUN1U1nXIqwAvMCR7wx678ESh1AZW9euxoWRsr4MJB6MInev6SZFxMWdj3YiXBGpQj4QbH8KTA5xCxFdb0tFdLAwEEAyMos6OZP8y6Aa+ZfXXJeDS5qNW88fQQKlwtDlG2x0G2cZrxHsFXhaQJE2lCTeyBu97/vR+NNHM9tzghNgfHNN28E49/9Kq0Md1sNAHkT9ECw87hKELxkVKZKhYSa6FqzJszBC3RtYCFQuVljkTFwR3jefDJE9QszuxbEf5wTLI2rGD1ESHqU8ycAXf8SXnGTap3dM9t6crWgMx/Pab5sknpAHFK32FieYvnTntwvYHDTEcBMfJuwI72W//oiuDLwNkNLYnBSDodCcFpq2jV9F//HFDkbYI1Dw2DGRw87cpM8ojrCsb0Pva7wwmKng5//n0Htc495suKZmZhtqYJMCzHhYwpZlgJLwWYWiRF15OQ1Qlt4UIzkdNUZjU3L3d2m3xu3l6CkM7V3TYAqhztkEuQRWoYr8NbFgCu3GMEW8+nHGjCmxbrCFItQgBa1f0QqISRfhhvmWewhktecaXOBdzi7q3ztRq5HoDqLAuYg1kdicWeJvNEPptZlv5VgVIHlQ+YEj9Ks7x37LRr1DDCHzJoHRmTQKQL1hJ+6Njec8ekuoja+Tk6x49mSw1CSmI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(39860400002)(376002)(230173577357003)(230922051799003)(230273577357003)(1800799012)(82310400011)(186009)(64100799003)(451199024)(40470700004)(36840700001)(46966006)(31696002)(36756003)(31686004)(40480700001)(53546011)(2616005)(2906002)(478600001)(86362001)(5660300002)(4326008)(54906003)(316002)(16576012)(8936002)(8676002)(110136005)(47076005)(336012)(426003)(83380400001)(40460700003)(26005)(70586007)(36860700001)(70206006)(7416002)(44832011)(81166007)(82740400003)(41300700001)(356005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 19:09:17.3760
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fb4728b-90ab-4f31-7392-08dbf4fc8343
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8538

On 12/4/23 05:58, Roger Pau Monné wrote:
> On Fri, Dec 01, 2023 at 06:56:32PM -0800, Stefano Stabellini wrote:
>> On Fri, 1 Dec 2023, Roger Pau Monné wrote:
>>> On Mon, Nov 13, 2023 at 05:21:13PM -0500, Stewart Hildebrand wrote:
>>>> @@ -1618,6 +1630,14 @@ int iommu_do_pci_domctl(
>>>>          bus = PCI_BUS(machine_sbdf);
>>>>          devfn = PCI_DEVFN(machine_sbdf);
>>>>  
>>>> +        if ( needs_vpci(d) && !has_vpci(d) )
>>>> +        {
>>>> +            printk(XENLOG_G_WARNING "Cannot assign %pp to %pd: vPCI support not enabled\n",
>>>> +                   &PCI_SBDF(seg, bus, devfn), d);
>>>> +            ret = -EPERM;
>>>> +            break;
>>>
>>> I think this is likely too restrictive going forward.  The current
>>> approach is indeed to enable vPCI on a per-domain basis because that's
>>> how PVH dom0 uses it, due to being unable to use ioreq servers.
>>>
>>> If we start to expose vPCI suport to guests the interface should be on
>>> a per-device basis, so that vPCI could be enabled for some devices,
>>> while others could still be handled by ioreq servers.
>>>
>>> We might want to add a new flag to xen_domctl_assign_device (used by
>>> XEN_DOMCTL_assign_device) in order to signal whether the device will
>>> use vPCI.
>>
>> Actually I don't think this is a good idea. I am all for flexibility but
>> supporting multiple different configurations comes at an extra cost for
>> both maintainers and contributors. I think we should try to reduce the
>> amount of configurations we support rather than increasing them
>> (especially on x86 where we have PV, PVH, HVM).
> 
> I think it's perfectly fine to initially require a domain to have all
> its devices either passed through using vPCI or ireqs, but the
> interface IMO should allow for such differentiation in the future.
> That's why I think introducing a domain wide vPCI flag might not be
> the best option going forward.
> 
> It would be perfectly fine for XEN_DOMCTL_assign_device to set a
> domain wide vPCI flag, iow:
> 
> if ( HYPERCALL_VPCI_FLAG_SET && !has_vpci(d) )
> {
>     if ( has_arch_pdevs(d) )
>     {
>         printk("All passthrough devices must use the same backend\n");
>         return -EINVAL;
>     }
> 
>     /* Set vPCI domain flag */

There is a vPCI initializer that would need to be called too (on Arm, to set up mmio handlers). It is normally called earlier during arch_domain_create(), but it looks to be okay to call here as long as it is done before the guest boots.

    d->options |= XEN_DOMCTL_CDF_vpci;
    domain_vpci_init(d);

Perhaps the flag should be set inside domain_vpci_init(d).

> }
> 
> We have already agreed that we want to aim for a setup where ioreqs
> and vPCI could be used for the same domain, but I guess you assumed
> that ioreqs would be used for emulated devices exclusively and vPCI
> for passthrough devices?
> 
> Overall if we agree that ioreqs and vPCI should co-exist for a domain,
> I'm not sure there's much reason to limit ioreqs to only handle
> emulated devices, seems like an arbitrary limitation.
> 
>> I don't think we should enable IOREQ servers to handle PCI passthrough
>> for PVH guests and/or guests with vPCI. If the domain has vPCI, PCI
>> Passthrough can be handled by vPCI just fine. I think this should be a
>> good anti-feature to have (a goal to explicitly not add this feature) to
>> reduce complexity. Unless you see a specific usecase to add support for
>> it?
> 
> There are passthrough devices (GPUs) that might require some extra
> mediation on dom0 (like the Intel GVT-g thing) that would force the
> usage of ioreqs to passthrough.
> 
> It's important that the interfaces we introduce are correct IMO,
> because that ends up reflecting on the configuration options that we
> expose to users on xl/libxl.  While both XEN_DOMCTL_createdomain and
> XEN_DOMCTL_assign_device are unstable interfaces, how the vPCI option
> gets placed there will ultimately influence how the option gets
> exposed in xl/libxl, and the interface there is relevant to keep
> stable for end user sanity.
> 
> Thanks, Roger.

