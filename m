Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AA3802A9E
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 04:55:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646493.1008795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA02k-00037o-7h; Mon, 04 Dec 2023 03:54:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646493.1008795; Mon, 04 Dec 2023 03:54:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA02k-00034x-4a; Mon, 04 Dec 2023 03:54:50 +0000
Received: by outflank-mailman (input) for mailman id 646493;
 Mon, 04 Dec 2023 03:54:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y+Gv=HP=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rA02i-00034r-Ns
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 03:54:48 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20616.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcc7ac7e-9258-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 04:54:46 +0100 (CET)
Received: from BYAPR02CA0047.namprd02.prod.outlook.com (2603:10b6:a03:54::24)
 by CY5PR12MB6324.namprd12.prod.outlook.com (2603:10b6:930:f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 03:54:42 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:a03:54:cafe::cd) by BYAPR02CA0047.outlook.office365.com
 (2603:10b6:a03:54::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33 via Frontend
 Transport; Mon, 4 Dec 2023 03:54:41 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Mon, 4 Dec 2023 03:54:41 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Sun, 3 Dec
 2023 21:54:41 -0600
Received: from [172.27.137.28] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Sun, 3 Dec 2023 21:54:39 -0600
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
X-Inumbo-ID: dcc7ac7e-9258-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Np0ScdIpxaP+lB5jhqoHna/+v9p85T9o739huNzeUYSRk1LX9/EEC57oDSTW/dDK3Cn9uF2IDPPdq0EPwz0mgumLmXmwHmyY0SPa5ERwLpOqXWGS22QkDK/Xr0ss7CUHgB6TwQ9gDjmD+Wh9dLToUdngqmv3d1nkwARjhfMo5rzH6lVcL5H1DSO63LPnAZ8xoofyPw7PHRLSN4dXxXdwrbRqfgybFxMba+7b3MfsxbhB50QVz1p5xbY14bujspJ2YNoV4Q6ABFTleE3ufXYrC0RVQcvuboAwo/TC8mjcWypCrl5/xOnq9OhHQ3rAsuZJr39VMYyGLgXAl4dsjaQacQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G0YDVnMB1/O75VR68CjooSPm0O7pOT1+GJYLgTmg150=;
 b=hTFQMu4AMvyoE3HCS/ZWv1z0hG6oTO9bBayzK3FEhQa0h2PBSKEn4Gyogh4g+q6HRt83b856R320PqRymJKPuk02FztVZfQ+KW40act0dwrcAKtlt6s5ca4q01zFXJW86s07p/x0fdMJjJfegaZ+ClT0WoykTklKTq7J+IObgTJ9VToTivVudbAXqtkxvrLnNvEh3cRZeheB/sAKeZWkxlmUweGFqXgbsRPIJ3y3ZiYSZaMaLlnOAjMuzDhpt/LpA0tojhNXhJyOrMS3xwJWX/YOoayltPi2wawN3kLE8RzwpTBfBgF1OTfLqiU+VRpNTsaxHJv4CMaOq5yophJe4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0YDVnMB1/O75VR68CjooSPm0O7pOT1+GJYLgTmg150=;
 b=e+855axeQmG5pVyutpNz+KbOzYpgGEM9J4E3y44Yqs6/lZYPqTTxmHctO/BY6JJ1idtqwC0ctCCcM/iIkHQHKPAA8vzXQUIoQuHLIbDhfM0/GLNMIw9ZClEFV2X+Nl8ZKuiWl9h/nsJgv6qj83IoEE1yZ/nPIbFe7GCcvKFooMU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c9a9421d-8f7b-453e-a583-4574367ae5f5@amd.com>
Date: Sun, 3 Dec 2023 22:54:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] [FUTURE] xen/arm: enable vPCI for domUs
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2312011847520.110490@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|CY5PR12MB6324:EE_
X-MS-Office365-Filtering-Correlation-Id: ba254c34-02f9-4983-75c3-08dbf47cbeda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Uwmud7ppXrlV3pZ37kvOMa8GGwqURihNzgH5otuBscHHDtBXMdkaHWQoQ+iZLG8UwM+rPcvUE6jI9ePgYiwH+Sv8j86mfiqOUw6O2Ask+ru07ZtLCWo/ALaMqFsIcSjpEaJhnxY0vtsoyeAZ5ggoAhYQWwTDmTg5NR/n0AWHKGTn7ocEnh5p4t58qDJ+bF+mUNKr7FLMjGz9jPKC3N17s3d754hT0pRQ5PdYqHeVnJ6zz7QbUpHxEw4VVJlbreOS1hMDblx3A6tl+GMTVtiCmB57ad44dYJ9u5V7XU6X9uvJgBnNer7lTQpMZXQoR3ubDjSVZKxhlgoc3VEKQ5MYBwsMBP15QXJ2rhBu8ZR/+L6rhyfhusXLbMH60JHdPPgZbKOCmPnH3mKP4hPqtjChzHFVXWT9f25376pqzfQ1FA0OspWkMiPuLTrPXzMD7yJCxsEftyqiuIv61k0+tT/R9SuCmXuKM4AaY70xmPzjmYgnsLvLrLvOSFeL1hfff0fRr+LP8M9S2ExL+zKPfEnc4htXxP6jCw9CesVJEnBGn7ePaxBHhtNX2Pf5kis/xVhCy5ftnEw1FmC3PuKABJR0B15fwHXdSn48zjQllYl7zZNPHHM1zNeM9KapyBiB7RquXpOSf6Rikk8kYwtzwiriqRLFMBtVUfO0mKkQX78zozAd/rcRicyG6heIvL48IJIblq8lZGnOjuo8CGpjGwvM1Cye17jvbtApdmetcoeiaNGxYEKYw8o3fik2WzuYEkdjOMYwnrhEYaqAvTw2wnIlE6JdcsrOo8RKJN5NsN+RMHzQNhzVsu/dNGxsnGctRGv02T8I+a3R2vTU7y0XCwwwd10tCOgm3zfA+rOB6gUcYqw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(376002)(396003)(346002)(230273577357003)(230922051799003)(230173577357003)(64100799003)(451199024)(1800799012)(82310400011)(186009)(40470700004)(36840700001)(46966006)(70206006)(70586007)(316002)(16576012)(54906003)(110136005)(40460700003)(7416002)(2906002)(5660300002)(31696002)(41300700001)(86362001)(36756003)(4326008)(8936002)(8676002)(81166007)(356005)(82740400003)(44832011)(40480700001)(36860700001)(53546011)(426003)(336012)(83380400001)(47076005)(26005)(2616005)(31686004)(6666004)(478600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 03:54:41.7386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba254c34-02f9-4983-75c3-08dbf47cbeda
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6324

On 12/1/23 21:56, Stefano Stabellini wrote:
> On Fri, 1 Dec 2023, Roger Pau Monné wrote:
>> On Mon, Nov 13, 2023 at 05:21:13PM -0500, Stewart Hildebrand wrote:
>>> @@ -1618,6 +1630,14 @@ int iommu_do_pci_domctl(
>>>          bus = PCI_BUS(machine_sbdf);
>>>          devfn = PCI_DEVFN(machine_sbdf);
>>>  
>>> +        if ( needs_vpci(d) && !has_vpci(d) )
>>> +        {
>>> +            printk(XENLOG_G_WARNING "Cannot assign %pp to %pd: vPCI support not enabled\n",
>>> +                   &PCI_SBDF(seg, bus, devfn), d);
>>> +            ret = -EPERM;
>>> +            break;
>>
>> I think this is likely too restrictive going forward.  The current
>> approach is indeed to enable vPCI on a per-domain basis because that's
>> how PVH dom0 uses it, due to being unable to use ioreq servers.
>>
>> If we start to expose vPCI suport to guests the interface should be on
>> a per-device basis, so that vPCI could be enabled for some devices,
>> while others could still be handled by ioreq servers.
>>
>> We might want to add a new flag to xen_domctl_assign_device (used by
>> XEN_DOMCTL_assign_device) in order to signal whether the device will
>> use vPCI.
> 
> Actually I don't think this is a good idea. I am all for flexibility but
> supporting multiple different configurations comes at an extra cost for
> both maintainers and contributors. I think we should try to reduce the
> amount of configurations we support rather than increasing them
> (especially on x86 where we have PV, PVH, HVM).
> 
> I don't think we should enable IOREQ servers to handle PCI passthrough
> for PVH guests and/or guests with vPCI. If the domain has vPCI, PCI
> Passthrough can be handled by vPCI just fine. I think this should be a
> good anti-feature to have (a goal to explicitly not add this feature) to
> reduce complexity. Unless you see a specific usecase to add support for
> it?

Just to preemptively clarify: there is a use case for passthrough (vPCI) and emulated virtio-pci devices (ioreq). However, the XEN_DOMCTL_assign_device hypercall, where this check is added, is only used for real physical hardware devices as far as I can tell. So I agree, I can't see a use case for passing through some physical devices with vPCI and some physical devices with qemu/ioreq.

With that said, the plumbing for a new flag does not appear to be particularly complex. It may actually be simpler than introducing a per-arch needs_vpci(d) heuristic.

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 96cb4da0794e..2c38088a4772 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1113,6 +1113,7 @@ typedef struct pci_add_state {
     libxl_device_pci pci;
     libxl_domid pci_domid;
     int retries;
+    bool vpci;
 } pci_add_state;

 static void pci_add_qemu_trad_watch_state_cb(libxl__egc *egc,
@@ -1176,6 +1177,10 @@ static void do_pci_add(libxl__egc *egc,
         }
     }

+    if (type == LIBXL_DOMAIN_TYPE_PVH /* includes Arm guests */) {
+        pas->vpci = true;
+    }
+
     rc = 0;

 out:
@@ -1418,7 +1423,8 @@ static void pci_add_dm_done(libxl__egc *egc,
     unsigned long long start, end, flags, size;
     int irq, i;
     int r;
-    uint32_t flag = XEN_DOMCTL_DEV_RDM_RELAXED;
+    uint32_t flag = XEN_DOMCTL_DEV_RDM_RELAXED |
+                    (pas->vpci ? XEN_DOMCTL_DEV_USES_VPCI : 0);
     uint32_t domainid = domid;
     bool isstubdom = libxl_is_stubdom(ctx, domid, &domainid);

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 2203725a2aa6..7786da1cf1e6 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1630,7 +1630,7 @@ int iommu_do_pci_domctl(
         bus = PCI_BUS(machine_sbdf);
         devfn = PCI_DEVFN(machine_sbdf);

-        if ( needs_vpci(d) && !has_vpci(d) )
+        if ( (flags & XEN_DOMCTL_DEV_USES_VPCI) && !has_vpci(d) )
         {
             printk(XENLOG_G_WARNING "Cannot assign %pp to %pd: vPCI support not enabled\n",
                    &PCI_SBDF(seg, bus, devfn), d);
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 8b3ea62cae06..5735d47219bc 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -527,6 +527,7 @@ struct xen_domctl_assign_device {
     uint32_t dev;   /* XEN_DOMCTL_DEV_* */
     uint32_t flags;
 #define XEN_DOMCTL_DEV_RDM_RELAXED      1 /* assign only */
+#define XEN_DOMCTL_DEV_USES_VPCI        (1 << 1)
     union {
         struct {
             uint32_t machine_sbdf;   /* machine PCI ID of assigned device */

