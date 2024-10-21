Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C82F9A91AB
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 22:57:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823925.1238005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2zRi-0001U8-Pl; Mon, 21 Oct 2024 20:56:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823925.1238005; Mon, 21 Oct 2024 20:56:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2zRi-0001Si-Mj; Mon, 21 Oct 2024 20:56:10 +0000
Received: by outflank-mailman (input) for mailman id 823925;
 Mon, 21 Oct 2024 20:56:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jACd=RR=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1t2zRg-0001Sc-S2
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 20:56:09 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20626.outbound.protection.outlook.com
 [2a01:111:f403:2409::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfd525a5-8fee-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 22:56:00 +0200 (CEST)
Received: from CH2PR05CA0031.namprd05.prod.outlook.com (2603:10b6:610::44) by
 DS7PR12MB8231.namprd12.prod.outlook.com (2603:10b6:8:db::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.27; Mon, 21 Oct 2024 20:55:56 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:0:cafe::6) by CH2PR05CA0031.outlook.office365.com
 (2603:10b6:610::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16 via Frontend
 Transport; Mon, 21 Oct 2024 20:55:55 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 21 Oct 2024 20:55:55 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Oct
 2024 15:55:55 -0500
Received: from [192.168.122.223] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 21 Oct 2024 15:55:54 -0500
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
X-Inumbo-ID: dfd525a5-8fee-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SEkHM7vV1YNwyJJ3L2QNhhUqs8y++GVZbZ+oH3aak46sc8Zes+DZoZ7w+r8UjYX0oSyd/272yojyaGogdkzBWjQxtlekrYXasdbHxUQQu/h0FwNVFPfzGVM3sLs+nC9umlmOoQjWSx+u28bciTycL8BWmsp7SgwMUOZ5gKOcDIxukDwVt0ZvjIUGXi79Fzr4tjPrjc7qIqbPLZbSw8ycmn7e7f2JuyRwDJ1Z+N5Bype3uxcFCYdpYqJdxAP5o+mu26seYehknnDAAbRTcNKfycCKPriBf1EJrOucuelyRQ3YyX6EdnxxVHhUZVhmf3+Yj6FhXXCIRUtCYOYJQIhRsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4WSbIQbVmLBugBlh0MGnbh49fvK/BlXxqgaV3mVvLKM=;
 b=UyBuhVAn1jbS30hCsECaPdLUJ7jBjAUDI4nq7KUtqZrpOQiuyMI4U7PMyxc/UrlTiiBjF6HAKgR3nw9yO7TuTScFuZbeg2/B/c5ha53HuFwvBGIdOXzE9Mortd1DwA9P6SCOSslBnhBu9kdyJ0HNbAMotqj60hoojGnJWKDL1rMo4/ajGajeZpljArL8DXS0fZkXyk7bsfqIYRGugiAZk3tF6lyS+boR1uaRvXmral5XzgcvrP+wg3iIql9nUkgYAeow091HgkIHpjtO3ASTQzhJKhVQa9NewHq9MVpDGTZOTWUXnJjgdf8bqadLusLVDkyCmCvT/O3gtWoFCL9AwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4WSbIQbVmLBugBlh0MGnbh49fvK/BlXxqgaV3mVvLKM=;
 b=H7nxrLlfDUIVz+L4xlvzrcwzBV/7QTsWVjWJ2i4WtrAKiSTofdYJckfoassbhpZ8EgenlihKsF1UgNcNzIs7zWoTxLXoPE5G9Om4+/pszRB4S609zklk7QvSgyf7zOchGezxVATAjiPp0wPRl3/5wkJS8lCTS81irpejTfYYeaI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <83ae0df2-c255-48ca-9f50-d495d1593852@amd.com>
Date: Mon, 21 Oct 2024 16:55:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QEMU PATCH v8] xen/passthrough: use gsi to map pirq when dom0 is
 PVH
To: Jiqian Chen <Jiqian.Chen@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Paul
 Durrant" <paul@xen.org>, "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
CC: <qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>, Huang Rui
	<Ray.Huang@amd.com>
References: <20241016062827.2301004-1-Jiqian.Chen@amd.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20241016062827.2301004-1-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|DS7PR12MB8231:EE_
X-MS-Office365-Filtering-Correlation-Id: 783aeebe-2aa1-46b6-6755-08dcf212c20d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VWFNYk1DL2pSRGovYzA2cWVQZS9QRDE5R0dEN01xdkNMREN2YkdBcElwcUJL?=
 =?utf-8?B?ZmpHYnFFdENSelFERWZKRHNWbGRCWFRkeU9tRWxVZmZYSXF2VVN0RzAzTVEv?=
 =?utf-8?B?bHlwM21wZWg3TFdKbU8xUEwwNW10eEc1V0MvZDhLNHBubFdvc05ieE1ZQTFy?=
 =?utf-8?B?WEh6RllUeUhTdWxPUG5XYTBhTVRwZXZaMFcxMXNrcDZwZmlhNjVIOWU1ZFVF?=
 =?utf-8?B?cVdld1NJclQ3dU0yVFdzdVhDS3RzeTBER3FRTHhiY3hpc3BpTlRDQzc1Q1pk?=
 =?utf-8?B?K3hiNFhMQko0WFJhb0Z3aEJXcVBIVU8vMVpFV2R2UFJ6ZGNRVTdtUGVndWZW?=
 =?utf-8?B?eEwwRytCM3JDVFo4YUdlMndUVTZhVDBNeW9sVVVZNlloYWw4UlFuVnoxZEtW?=
 =?utf-8?B?TkdaVFFxTVR6eFdoeGV3ZTd2cHRLVDkxZ0pDVlVkNEM2ZjhNaitTbCs4ZjhT?=
 =?utf-8?B?SFp6cW40ckdOdzR5dEpUVWZCeWw2ZzBWR2xzbU1GaWdhcXlpSW8vUCswL3VT?=
 =?utf-8?B?SVBYYjFiQUhRaHBhZDZMbGhoZjBNYXQxMlk4Nnd3SHJEVXVnU2lLZWdxdzBH?=
 =?utf-8?B?RDJodzJTdVp5d2UvaExYRzN3RHF6RXJaVjUzU082TWZ4VnFQOEFIWEdhM0RI?=
 =?utf-8?B?ejRRWjJIcDNSM2tmcG1uVit4aHlxWGtkTndDWlVqbVNkcmFVcWdxMGhoMVpU?=
 =?utf-8?B?WWRzQzlDUlphMkpadytUZ2E2aXMzRFV4cFdxRVhjVGhIMGRjblNKT3J5azBx?=
 =?utf-8?B?bjYxSG16d3A0MkZLQW5zaXA3d05kcHJsVFZXc3RteTUxMUNtODczdXltOGFa?=
 =?utf-8?B?VXZUalk4Q3BqWHJHWkhRcEFjd0JGUURmZlU2WXdEQXlsWjhPa2IxbGJyY1da?=
 =?utf-8?B?RGZhMitvallyZ0hLMkFXNFBxS1dESkNiSnlYMUJNK1BBWk5tR1BPNnlZSlZ2?=
 =?utf-8?B?ZDd6VzZweGxCQTBGNm00NWxQbzE5SFNCQWVQV3F6TmxyR1A5YmRHbGxKTHZm?=
 =?utf-8?B?M3pCVkdUb09WaU9BbmF1T1Uyby80V1JlM21RK25KK0RheWI3V1VGRW56ZnZI?=
 =?utf-8?B?eTR5UXIwb0I5ZitRMC8zbmwxSGxJTnRnME1FSUw2QkVuVG1kbi9Wa3dKTnly?=
 =?utf-8?B?S1dkVkVXV0ZzaVhKQ3pZTHFESHhGRXpWOUxkV2d0RVkxd25MYkxXcTJOYVF6?=
 =?utf-8?B?eUR1czFuS2FhVXpyQjI0aHlJMXJyMk1wL0h2VUFQTWlReFlUWXpGMG1iS0xq?=
 =?utf-8?B?UzBuai83TUxlZ3BvMHA0ZHl0U1dTTTVFWGJQYlNtbzd5dVBIbkt5MEdpUFRv?=
 =?utf-8?B?RTN1RGpzRkNSNGZoQ2EydExGWXV5Zlh5blo0Zjg5MklVcFlIV2F4a0lNYm1z?=
 =?utf-8?B?ZStVUWpJQ0xtYVpZVnJpeElEbjFwRmdDMU1OazNlOTlmdkx6Q0s3QWxHUGkx?=
 =?utf-8?B?U21VZFM5cjF6OHNDS1BLRHRtQklVRy9QZW8rc0NUcFZ5YU9XNDlUU1RkTWpG?=
 =?utf-8?B?WDViSVdORm5sWmhtUkg1YW9BMC9YNFNJRW5CT2NoY1BIcDVPTkZ3cVE3MFpN?=
 =?utf-8?B?MmZydkRLaXJadnBneU42QWpSNjBaMm1JZEhCMVNBZENkM0RHMDVQem5Kb2FE?=
 =?utf-8?B?TU9wbzBEMCtaVDVlVks5TEZuaUtZQTRRN2poeGZjWFhaalByd2Rvb0lhWkZJ?=
 =?utf-8?B?Ty94alI1VjlndG5uemU0ZWhiVllTZlFiQlQ2TkVLTURBQzFmak9sd1JpemdF?=
 =?utf-8?B?NHNTM1hqVlFXcnZvL1hNbEdPaGVPaUlzRVg3K2RGQ0p0b25VM2FBVzZIQ25o?=
 =?utf-8?B?ZTNDb2ZON0FZeDIrRE9lbjN4YllEdDJMaFVxbmxHZW43UjAxMEhvQWZaUllL?=
 =?utf-8?B?bEhUWHhaNzlkWk9JdmVNTXdlMTlRam1XM0ZuVW1OUnBEZ2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 20:55:55.7665
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 783aeebe-2aa1-46b6-6755-08dcf212c20d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8231

On 10/16/24 02:28, Jiqian Chen wrote:
> In PVH dom0, when passthrough a device to domU, QEMU code
> xen_pt_realize->xc_physdev_map_pirq wants to use gsi, but in current codes
> the gsi number is got from file /sys/bus/pci/devices/<sbdf>/irq, that is
> wrong, because irq is not equal with gsi, they are in different spaces, so
> pirq mapping fails.
> 
> To solve above problem, use new interface of Xen, xc_pcidev_get_gsi to get
> gsi and use xc_physdev_map_pirq_gsi to map pirq when dom0 is PVH.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> Hi All,
> This is v8 to support passthrough on Xen when dom0 is PVH.
> v7->v8 change:
> * Since xc_physdev_gsi_from_dev was renamed to xc_pcidev_get_gsi, changed it.
> * Added xen_run_qemu_on_hvm to check if Qemu run on PV dom0, if not use xc_physdev_map_pirq_gsi to map pirq.
> * Used CONFIG_XEN_CTRL_INTERFACE_VERSION to wrap the new part for compatibility.
> * Added "#define DOMID_RUN_QEMU 0" to represent the id of domain that Qemu run on.
> 
> 
> Best regards,
> Jiqian Chen
> 
> 
> 
> v6->v7 changes:
> * Because the function of obtaining gsi was changed on the kernel and Xen side. Changed to use
>   xc_physdev_gsi_from_dev, that requires passing in sbdf instead of irq.
> 
> v5->v6 changes:
> * Because the function of obtaining gsi was changed on the kernel and Xen side. Changed to use
>   xc_physdev_gsi_from_irq, instead of gsi sysfs.
> * Since function changed, removed the Review-by of Stefano.
> 
> v4->v5 changes:
> * Added Review-by Stefano.
> 
> v3->v4 changes:
> * Added gsi into struct XenHostPCIDevice and used gsi number that read from gsi sysfs
>   if it exists, if there is no gsi sysfs, still use irq.
> 
> v2->v3 changes:
> * Due to changes in the implementation of the second patch on kernel side(that adds
>   a new sysfs for gsi instead of a new syscall), so read gsi number from the sysfs of gsi.
> 
> v1 and v2:
> We can record the relation between gsi and irq, then when userspace(qemu) want
> to use gsi, we can do a translation. The third patch of kernel(xen/privcmd: Add new syscall
> to get gsi from irq) records all the relations in acpi_register_gsi_xen_pvh() when dom0
> initialize pci devices, and provide a syscall for userspace to get the gsi from irq. The
> third patch of xen(tools: Add new function to get gsi from irq) add a new function
> xc_physdev_gsi_from_irq() to call the new syscall added on kernel side.
> And then userspace can use that function to get gsi. Then xc_physdev_map_pirq() will success.
> 
> Issues we encountered:
> 1. failed to map pirq for gsi
> Problem: qemu will call xc_physdev_map_pirq() to map a passthrough device's gsi to pirq in
> function xen_pt_realize(). But failed.
> 
> Reason: According to the implement of xc_physdev_map_pirq(), it needs gsi instead of irq,
> but qemu pass irq to it and treat irq as gsi, it is got from file
> /sys/bus/pci/devices/xxxx:xx:xx.x/irq in function xen_host_pci_device_get(). But actually
> the gsi number is not equal with irq. They are in different space.
> ---
>  hw/xen/xen_pt.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  hw/xen/xen_pt.h |  1 +
>  2 files changed, 45 insertions(+)
> 
> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
> index 3635d1b39f79..7f8139d20915 100644
> --- a/hw/xen/xen_pt.c
> +++ b/hw/xen/xen_pt.c
> @@ -766,6 +766,41 @@ static void xen_pt_destroy(PCIDevice *d) {
>  }
>  /* init */
>  
> +#define PCI_SBDF(seg, bus, dev, func) \
> +            ((((uint32_t)(seg)) << 16) | \
> +            (PCI_BUILD_BDF(bus, PCI_DEVFN(dev, func))))

Nit: This macro looks generic and useful. Would it be better defined in
include/hw/pci/pci.h?

> +
> +#if CONFIG_XEN_CTRL_INTERFACE_VERSION >= 42000
> +static bool xen_run_qemu_on_hvm(void)

This function name seems to imply "is qemu running on HVM?", but I think
the question we're really trying to answer is whether the pcidev needs
a GSI mapped. How about calling the function "xen_pt_needs_gsi" or
similar?

> +{
> +    xc_domaininfo_t info;
> +
> +    if (!xc_domain_getinfo_single(xen_xc, DOMID_RUN_QEMU, &info) &&
> +        (info.flags & XEN_DOMINF_hvm_guest)) {

I think reading /sys/hypervisor/guest_type would allow you to get the
same information without another hypercall.

> +        return true;
> +    }
> +
> +    return false;
> +}
> +
> +static int xen_map_pirq_for_gsi(PCIDevice *d, int *pirq)

Nit: s/xen_/xen_pt_/

> +{
> +    int gsi;
> +    XenPCIPassthroughState *s = XEN_PT_DEVICE(d);
> +
> +    gsi = xc_pcidev_get_gsi(xen_xc,
> +                            PCI_SBDF(s->real_device.domain,
> +                                     s->real_device.bus,
> +                                     s->real_device.dev,
> +                                     s->real_device.func));
> +    if (gsi >= 0) {
> +        return xc_physdev_map_pirq_gsi(xen_xc, xen_domid, gsi, pirq);
> +    }
> +
> +    return gsi;
> +}
> +#endif
> +
>  static void xen_pt_realize(PCIDevice *d, Error **errp)
>  {
>      ERRP_GUARD();
> @@ -847,7 +882,16 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
>          goto out;
>      }
>  
> +#if CONFIG_XEN_CTRL_INTERFACE_VERSION >= 42000
> +    if (xen_run_qemu_on_hvm()) {
> +        rc = xen_map_pirq_for_gsi(d, &pirq);
> +    } else {
> +        rc = xc_physdev_map_pirq(xen_xc, xen_domid, machine_irq, &pirq);
> +    }
> +#else
>      rc = xc_physdev_map_pirq(xen_xc, xen_domid, machine_irq, &pirq);
> +#endif
> +
>      if (rc < 0) {
>          XEN_PT_ERR(d, "Mapping machine irq %u to pirq %i failed, (err: %d)\n",
>                     machine_irq, pirq, errno);
> diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
> index 095a0f0365d4..a08b45b7fbae 100644
> --- a/hw/xen/xen_pt.h
> +++ b/hw/xen/xen_pt.h
> @@ -36,6 +36,7 @@ void xen_pt_log(const PCIDevice *d, const char *f, ...) G_GNUC_PRINTF(2, 3);
>  #  define XEN_PT_LOG_CONFIG(d, addr, val, len)
>  #endif
>  
> +#define DOMID_RUN_QEMU 0
>  
>  /* Helper */
>  #define XEN_PFN(x) ((x) >> XC_PAGE_SHIFT)


