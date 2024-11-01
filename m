Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB059B918A
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2024 14:09:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829099.1244177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6rPN-0006iZ-0s; Fri, 01 Nov 2024 13:09:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829099.1244177; Fri, 01 Nov 2024 13:09:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6rPM-0006fz-Tg; Fri, 01 Nov 2024 13:09:44 +0000
Received: by outflank-mailman (input) for mailman id 829099;
 Fri, 01 Nov 2024 13:09:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H3cE=R4=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1t6rPL-0006fp-3r
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2024 13:09:43 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20608.outbound.protection.outlook.com
 [2a01:111:f403:2418::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89db5fcc-9852-11ef-99a3-01e77a169b0f;
 Fri, 01 Nov 2024 14:09:35 +0100 (CET)
Received: from BN9PR03CA0744.namprd03.prod.outlook.com (2603:10b6:408:110::29)
 by SJ2PR12MB7941.namprd12.prod.outlook.com (2603:10b6:a03:4d3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Fri, 1 Nov
 2024 13:09:27 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:408:110:cafe::17) by BN9PR03CA0744.outlook.office365.com
 (2603:10b6:408:110::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.23 via Frontend
 Transport; Fri, 1 Nov 2024 13:09:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Fri, 1 Nov 2024 13:09:27 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 1 Nov
 2024 08:09:05 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 1 Nov
 2024 08:09:05 -0500
Received: from [172.25.174.226] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 1 Nov 2024 08:09:03 -0500
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
X-Inumbo-ID: 89db5fcc-9852-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxODo6NjA4IiwiaGVsbyI6Ik5BTTEyLUJOOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6Ijg5ZGI1ZmNjLTk4NTItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNDY2NTc1LjE0NzYwNywic2VuZGVyIjoic3Rld2FydC5oaWxkZWJyYW5kQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ox6MQ5PxHrzMpTN7IPfGzIIELuJYDMGL81t9SQowqakyfnlEem8xzWkXOFAMTKV9FXgZEKv3FgmAZ94eGPGUgp5xbW7LCLAwXCEVVt1b3WsUlu6siQCMjlpFPjs6J8j6TZ9i+eXG+bpTDRQbVQxTo7XrPR81b3alJ6WhuP3sOjpXkkBUSW3ojG/Y1qu9bx4FATYGlEpm23GaxzBI+RebWTRlsRcW0o9ssPG7TBADxWepg4hHQbtqHsnEGAVe2mqmSR+UNV0wUdWxYgvQucIEdsU9PIVJxWWBE/i5C44W+ozdfylqTMChhBHHxEVfGf8TPy+D7cjYqp+C/S1PQcnmdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bPj5OmXfMG436pc2FahpOI7vhljFFMGwqypiLg2zEu0=;
 b=k3PIXncnmz0fAxq9jbUep0dUvvtkqtTlusy7K3vZy93BXp+a61jPNhyHwJxQ2rUxD/8opPq9fEIdJEG5D9emB7s7qRAC3Njs8BSO7hv1Y5Xym3+SFWD7bSHSuVTKo4mxQ5dcVGC4jvyOfj7xt3oCJW6cfDsNWaJcF2DdQkFi9H2nq2MgvWinuZxnmGO3D6CsRQZ0tAs3OFG63/T4EG2aL/xZ3o123oZaUnk6ugtvKJtWdNkWEDEVzIW9AMHDBKB+SKYYkkYa42+2jnFCkduwGcgQbwfDqHM3QNTDE/b+IQ3evZLWbubWoy22D7K4caLuqC4kNBkCjTDC0DqRgMVzEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bPj5OmXfMG436pc2FahpOI7vhljFFMGwqypiLg2zEu0=;
 b=vj3tbGyWLxxz4GwjquebFDMwr/WWDb8OvSplhzUCMGvPOHntpDvYNSPUyp2WBs23IKn8prdtYBn7+LN3Oo26i8HmUGlqJF1PJStPTJbnHWi1YdbeaIls8zP0/9AFwnRrieOzpb9duaom7TDrzU52+e+mVSSpOW9xkVJlp3dKu3o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <356652df-b5b4-4c28-9c5c-4bfc4f36813f@amd.com>
Date: Fri, 1 Nov 2024 09:09:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QEMU PATCH v9] xen/passthrough: use gsi to map pirq when dom0 is
 PVH
To: Jiqian Chen <Jiqian.Chen@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Paul
 Durrant" <paul@xen.org>, "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	"Michael S . Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
	<marcel.apfelbaum@gmail.com>
CC: <qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>, Huang Rui
	<ray.huang@amd.com>
References: <20241024090629.1944820-1-Jiqian.Chen@amd.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20241024090629.1944820-1-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|SJ2PR12MB7941:EE_
X-MS-Office365-Filtering-Correlation-Id: 9064314b-b6e7-4376-51f5-08dcfa766a0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SmY0Z2FPcjhneUF1K041dkRyZ1RFV0ZTby9peDdxeVFOckZyZDFnR0JPTXV2?=
 =?utf-8?B?cnRJbHJDNkloRi9iMFNjcWdDQmFSTUhXZTI5VzVVMG1jWFFHbjE4L3NXMVd0?=
 =?utf-8?B?ZmoxTWlKT3BuUHo4dzJZUDJIbEJYcmVRVCtJUGRNRE5GVWZwalE4QkhXby9B?=
 =?utf-8?B?VWlMejhzTzJHMDd3d201dkoraWhaNlBUT25SSGc0dG1YTm1qZzJvQkxlcFlS?=
 =?utf-8?B?cHBhS3NUSG93R01NSFNoR2d4Vm1SV1NIaWdibmRtUmxlMWtsTTI5Skt6TWc2?=
 =?utf-8?B?eFlFQ0V0bW9SVTIyWVdkSFlDQTd6SjI3S0RJYnRXUDJYVnRucnh6UlJOeWcz?=
 =?utf-8?B?TkFBejRrdXRKSFJmK3JaMDlJT2NYUkVaTjUxaldRVGFsOUNZMWYrQVB2elpx?=
 =?utf-8?B?Mi9HRGY4SWRhbW9TTFFsb3g4NFl6blc1UXpNY1ZNdVpiakJJdWZVNFBmUXFP?=
 =?utf-8?B?aVduRDhjMnFSbnJ3K1VZR2V4TmpCNm9BOHV0NmNydnc5OXVUZUZhaG5VN3Vj?=
 =?utf-8?B?N1U0eHpsZStUZlZLTG5FN1Ivb3dIVFMzejVsZGRGbnovazZsdDAvS0U3RGpl?=
 =?utf-8?B?Rlo2dWtKaFBIb1N1a1U3RjBaVjl0L0c0U0ZVeGR0dDVpNVFmUmFIUUc5UDUx?=
 =?utf-8?B?aU5NYjFBOW9jU0xOazFueUMreVZyS2RYQk4valBCWjh3UFhJSkY5SDBHd01h?=
 =?utf-8?B?clNVQ0tvRWxlbFN0aTR3dFFHQzE1dU1QS1IrMC9UK3Jhd3VIZ3ZYWWp6R0VL?=
 =?utf-8?B?b2VkSGc5L1VBeVYzaHA5ZGJxd1A5a3JsMk1iSzBaZTRDcmFmcGVwOEtHUFpQ?=
 =?utf-8?B?cTU3QndycVdiV0VhUkE0QW5qRmEyeXE3OWxsekZlZnFUYU5MaDYyVktnc1JT?=
 =?utf-8?B?a2R3cUY1VVA3S1R0WE1WUyswT3ZjbmpoSGRxMTdxSHE2c21zSkJWTDBnKzNs?=
 =?utf-8?B?TVZUNXBBRzJGajZJNDVsR2Z3L0pBZi93aVBySi9hb3I1RUs3K0UyQmlpN2JM?=
 =?utf-8?B?enhWUnRlZ0h3aTUvQ3FaZ0cvQTdIUzlWazhqZC9sNkl2QjFUTTRueHBZYmJ1?=
 =?utf-8?B?clNYeCswdnVaU21haC9xN0ExemJGU255cHRBZEVPQWtNVytLS1VsRXljaWpD?=
 =?utf-8?B?ODBSc0hMZzNXZ2g3U2pCVWtML2xsbStRSEl6Q2xOTlNLZmMrTnM5M01keU5i?=
 =?utf-8?B?VXV2VjFxdHF6QU8yblRRdmV1QStGSFRMYUJJdlJFb0lVZjdIa1F4bkp2WUtp?=
 =?utf-8?B?OVpPNHdQaUpvZFVQb1NpT0NsNHByNFlwK085OXZKWkJVTUZkeDZxdWlHajEx?=
 =?utf-8?B?aTlHQlkxRFhFd0dnNmRZT01oN0x2cjNUUFlXSUM4SG1MOXYyaFU1Q2dBRTRO?=
 =?utf-8?B?cnUrUXdYYmswc0ViNjV4RGVudloxaUl5UjdCeEV0K3Z4TUFrcjg4bzFXbzhq?=
 =?utf-8?B?VXRyMWV4WmFrcFhUNVNoeDFmTzZaaHZwdjJJNkdMUUVLTjFBOGx0cEwvSi93?=
 =?utf-8?B?SGhnWW1vVkVrZjJENXNIaVJWS3dzaEtmdTBKNms4TkZ3RXNrRWlLNURSS1Rn?=
 =?utf-8?B?bjZ0dnJTa1I5MDFXZzJPdTE4N3RWUVJCZEhRUzlQSTZIT1lndC9DTXlKQnZQ?=
 =?utf-8?B?SnMreWI3bUlQRUZNSDI5WHdlKzNlcU9vTGRueElUTkg4TVZsVGVXRWJsVExU?=
 =?utf-8?B?OHNmSWhHS0xXbjhDaEdDMGFQejJvRHlEczU0VmhHSnk2QjdNaWt4L1Z1OXJ6?=
 =?utf-8?B?ODZNWDJzUTRuR1ZwSDg2cUpXWE1iVzYyajhCc0xPUUtTTHhiMjkwVHNoZVo0?=
 =?utf-8?B?QW55bVk5UGR3WEpyek8vOVg1eEFCMGY3UU9zcmhEQzAzZC85Y1pOU0VIaCsr?=
 =?utf-8?B?NUxhT0dtU21DRnpERG5pTmE3WmpuQmVMVm83NnE3TklCZFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 13:09:27.1263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9064314b-b6e7-4376-51f5-08dcfa766a0c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7941

On 10/24/24 05:06, Jiqian Chen wrote:
> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
> index 3635d1b39f79..5b10d501d566 100644
> --- a/hw/xen/xen_pt.c
> +++ b/hw/xen/xen_pt.c
> @@ -766,6 +766,50 @@ static void xen_pt_destroy(PCIDevice *d) {
>  }
>  /* init */
>  
> +#if CONFIG_XEN_CTRL_INTERFACE_VERSION >= 42000
> +static bool xen_pt_need_gsi(void)
> +{
> +    FILE *fp;
> +    int len;
> +    char type[10];

A brief in-code comment to explain how you arrived at 10 would be
appreciated.

> +    const char *guest_type = "/sys/hypervisor/guest_type";
> +
> +    fp = fopen(guest_type, "r");
> +    if (fp == NULL) {
> +        error_report("Cannot open %s: %s", guest_type, strerror(errno));
> +        return false;
> +    }
> +    fgets(type, sizeof(type), fp);

Please check the return value of fgets.

> +    fclose(fp);
> +
> +    len = strlen(type);

Before passing to strlen, is "type" always guaranteed to have a
terminating '\0' character?

> +    if (len) {
> +        type[len - 1] = '\0';
> +        if (!strcmp(type, "PVH")) {
> +            return true;
> +        }
> +    }
> +    return false;
> +}
> +
> +static int xen_pt_map_pirq_for_gsi(PCIDevice *d, int *pirq)
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
> @@ -847,7 +891,16 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
>          goto out;
>      }
>  
> +#if CONFIG_XEN_CTRL_INTERFACE_VERSION >= 42000
> +    if (xen_pt_need_gsi()) {
> +        rc = xen_pt_map_pirq_for_gsi(d, &pirq);
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
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index eb26cac81098..07805aa8a5f3 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -23,6 +23,10 @@ extern bool pci_available;
>  #define PCI_SLOT_MAX            32
>  #define PCI_FUNC_MAX            8
>  
> +#define PCI_SBDF(seg, bus, dev, func) \
> +            ((((uint32_t)(seg)) << 16) | \
> +            (PCI_BUILD_BDF(bus, PCI_DEVFN(dev, func))))
> +
>  /* Class, Vendor and Device IDs from Linux's pci_ids.h */
>  #include "hw/pci/pci_ids.h"
>  


