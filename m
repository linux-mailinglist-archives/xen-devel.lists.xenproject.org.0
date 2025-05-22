Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD479AC100C
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 17:33:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994281.1377340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI7ue-0006e3-RZ; Thu, 22 May 2025 15:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994281.1377340; Thu, 22 May 2025 15:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI7ue-0006c3-OE; Thu, 22 May 2025 15:32:52 +0000
Received: by outflank-mailman (input) for mailman id 994281;
 Thu, 22 May 2025 15:32:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wx/D=YG=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uI7uc-0006bs-KU
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 15:32:50 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2406::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03b33d6c-3722-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 17:32:49 +0200 (CEST)
Received: from SJ0PR13CA0017.namprd13.prod.outlook.com (2603:10b6:a03:2c0::22)
 by DS7PR12MB8203.namprd12.prod.outlook.com (2603:10b6:8:e1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 15:32:44 +0000
Received: from CO1PEPF000044FD.namprd21.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::f5) by SJ0PR13CA0017.outlook.office365.com
 (2603:10b6:a03:2c0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.17 via Frontend Transport; Thu,
 22 May 2025 15:32:44 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044FD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.4 via Frontend Transport; Thu, 22 May 2025 15:32:43 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 May
 2025 10:32:43 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 May
 2025 10:32:42 -0500
Received: from [172.26.39.227] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 22 May 2025 10:32:42 -0500
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
X-Inumbo-ID: 03b33d6c-3722-11f0-a2fb-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nl8pkgak3yG0AQAmyXLZ88pqOazsTiaMX0Ga4bvdAqZa/4EZRR4czOaf1bZ+7PJY6qvn6pVtDDl2Uuu5y+nX2/AOA6yl7xIOVNrZBW1W9Vek/C9sJkqDbv+4ODVQjFSoUm5x+Z5xR/yi+TiY58RbooOqjrUCc0XyzPMajpBZPadAe4MnKfyV4GZp2Ow4hySzhDacJBUnRFLS7jS4Q+JW4owrA1zy1IvzQFfvE2ds/nVBlaFu2Qu1mlvLI86AdOCWabSYM+isFQ/ElNmRdXW4xtTqO1HR4BGADdF7VNKKtHEjbqDBJdeceFugmPqGg4cn0pPcQ+eB1S7ufSgT6meGUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3aTIUxbrNKrFuWYt64pC+6rVE4rT4AH36+tbPlLPOv4=;
 b=TcuCx06uwdM93MHqUzZ5UCJQCqjjiKKDrx78o59iqJhtoQhZWVf47qD428M61OYckAxNqWrPEWT6RnqvEGulDiXTIqsjz7Rw6YXkPcc05QsjNSu5oArKCDiB1hRyk49ZIchfNjTAAM/iefd8slJ9Hg4cBHH88zW3L94Moa52+BXQADgTLxjeiry67GJn2QiUK9tJcveLL6CmKWXZe/x7IbdO+Z/0P5+poF6alA0yrQaPRelz0Wlt/1aBsRc1sp3iAScWIBFRIIzaBPCdR+3dSM7Lc+1qJvTg79vlOGlX3GeInv4DEEFUwjkSORFg2ynxWPvPKAREx6YcEt9+/kKGag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3aTIUxbrNKrFuWYt64pC+6rVE4rT4AH36+tbPlLPOv4=;
 b=Rol3RLkuoDilUWO7S9Il77QJ8tY22j0IMHeowB3uICJqQ5ogYzEYf4/4iaymu2ZYu6vHbu40w+hr7PD8yWmX7CIgnfyPjdVogEINw7SKkYGa49kIZRk2U6WhbJzupM3huSF6eWXIgl4/jt5LOVEt1YfusriUPL2GHRaLU01jbFA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <54324f51-c0f9-4f42-b662-3de5676f1352@amd.com>
Date: Thu, 22 May 2025 11:32:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/vpci: refuse to map BARs at position 0
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250522140356.5653-1-roger.pau@citrix.com>
 <20250522140356.5653-3-roger.pau@citrix.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20250522140356.5653-3-roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FD:EE_|DS7PR12MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fbd75e9-321f-441b-fe0b-08dd9945e594
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VSsxS1RCdS8rbkg1WlgvdDMrcXZmdGdiOXFQQzhKaHZNY2dFK3dEbUthS045?=
 =?utf-8?B?R3NnMTIyTmdEKzR6a3FPaW54bzQ0S1RQMVhDdlBqV0lZamJ6bk5xSXczZjdI?=
 =?utf-8?B?N0tYOFltWjJla01RNHA2SHJESXkxVU9KbzE2dVBHdmZIcHRvQWw3WGRIbGRj?=
 =?utf-8?B?SkdGN1JrRGtsVUlVTTRzKzlFalpyTFQ0djBFbWxXRHlaUDBFcmZkM3NTTGFq?=
 =?utf-8?B?UmhLVUZoTkxGMTVTeWJNa0dzUllPeU4vVXRlMitwalEyL3RCS2RNZURlNVZI?=
 =?utf-8?B?dEhsR1ZiNHVSOFljdDVkNG52WXZYbUVYUkNrMTZhTWQ2bTFSSERpMi9XNlpo?=
 =?utf-8?B?eHc0K0hwZWw0c21tanBNZEhEcURWQXNjM3dGVUVzSmdrRDV2NHpqN3RkZnVt?=
 =?utf-8?B?QW42V2RGQzFuVnhwazZTcXdnVndDSjhkdlZXamR4aWFUR1NxZ3FMN0pNNzUw?=
 =?utf-8?B?SzVIbW1lWHFvWnUyUy9KQWJDS1k3N29PbEtXdzRSaVJYRE8wNFpJS2Z1d0E5?=
 =?utf-8?B?c243Z1RRc0w3UEtFZGlRZXVtWFdMUUJXQU9qSlR6dzVGNVZwa2Y2RE42SW5l?=
 =?utf-8?B?RUUybmhKN2lQeUx6RW1VYVF4UllYMWdzenFMWnBpdWtBellxMm5JSGZhaUcz?=
 =?utf-8?B?Y01TL1BJQjVpK2diMm1mbUY0YVl0QzRtVlEzSDhxa2pQMWh1QUZoY0FnVXlS?=
 =?utf-8?B?b2ZodEk5bFhHbkpOMDdQei9tU0hhRG1EOVlKeVZXMWJNRW4vVzNPVVlqdXZ4?=
 =?utf-8?B?N0VPNGtOZEFZb0l3eGpCUEpsbzRVaFJRMnMvMXpkNGp1UENBSXRueks1OU10?=
 =?utf-8?B?SkgxWnBTWDZIMlovZlFSNDNCckY0V3pHdmp3YTB3eUQ0YnFpWnd5WHpxbXMw?=
 =?utf-8?B?Nnh0UlRINlZZWURyTWVjaU5mLzJOQllwak56elJvYW9jSTgraThPNEkzemk2?=
 =?utf-8?B?YUxMcDlUUXFJNmEycGM0WnZya21ibnpJNW54cEdqOHkvSEQwZzVialdXWEN0?=
 =?utf-8?B?OHVtaXlHTU54cVFwUXV4L3EzQzArcVJta2o0Q3hkU3RONzJ2WDlOT3Uycmtt?=
 =?utf-8?B?SUlreDJyNS8yVGIwQ09tSTlsVDlZMnI1WVIyZmQySk0wN2JvTGdtSGxRQ0hx?=
 =?utf-8?B?SzNIM1IxZXBzL2Z4aWRKZGVwZ29yWTJMUUdBSldLZGZ6OVRuZXNiaWk5Tm56?=
 =?utf-8?B?WkZLWGZsWE8rWXQ1Rm1LTjJ3bWx3OE1Obmg2RXo4SVBxQjFKTkZZbDlZckhS?=
 =?utf-8?B?Q21RZS9FTWpsdk12NzdxdU94OGN4OHp5UFRpWEIwV1cyK0VzMFBkL2FybjB5?=
 =?utf-8?B?NzdOaGVGWXJYVVJJUGRSQ1hLYWlrTHo4UG1ZRERXeUNDa3FsaWd2T0ZGMVE0?=
 =?utf-8?B?ekNxSlRMTUlBeGE5eFc0ckRxOHovVDVJYkI5MGVSa3BuNXBScEpKUXo1bjhz?=
 =?utf-8?B?ZmZLaUJkcnJ2dDEzeGJFQ1VObUVseHlLY28wNXc5THdRYUNzR2poRmRONExX?=
 =?utf-8?B?NWpJZWgwYnlaRkxIM2xreHVtazFYSURzRXNwYjhjVFZUT2Z6WEc1WTFuVFVo?=
 =?utf-8?B?b1lmSWlLOWQwbEZ1Z0xhV1d2YnE5YUFuZEpLUmVrS2JtUnlPcm9KSG4vUjkx?=
 =?utf-8?B?dEUrMFdWK1RRSW5JZEE3UHI5ZDdtSzdrU1VQOFJYclJsZXVvSjVtZFVXV2pK?=
 =?utf-8?B?SjlOUUllV011RW9GWjk4S2QyODJqeUZNb3BvRjgzUGJHQ216ZjNzTTNXOUZJ?=
 =?utf-8?B?S0lZeVc3RTRHVXlYRVM3dWNIOEsyUVBCdXpxWUZYaHNGOHdtT3d5d01NeUhk?=
 =?utf-8?B?cEUyaHBEOEVRblpiaVNteGdKRGxub2JlZkIvU3lYa1V4bzdPc1VoQnYvcGpj?=
 =?utf-8?B?L2FxSGVHRWdST0FTRUIzeThLMDlJQlRnbmpabTJxczJtbjZzVnFrQmZyNFZ0?=
 =?utf-8?B?YVdiQm9rNm9MY094ZXI1SVJsbGFRR253RzRTT2kyamlkOENibVpDT24rclQ3?=
 =?utf-8?B?K0VIeEhpUVVWYUR1UFZWbDFoSXFqL0tpUGtxNTAwTDI1dkFZOEp2YjNpZC9n?=
 =?utf-8?Q?TayA7Z?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 15:32:43.8556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fbd75e9-321f-441b-fe0b-08dd9945e594
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8203

On 5/22/25 10:03, Roger Pau Monne wrote:
> A BAR at position 0 is not initialized (not positioned).  While Xen could
> attempt to map it into the p2m, marking it as mapped will prevent dom0 to
> change the position of the BAR, as the vPCI code has a shortcomming of not
> allowing to write to BAR registers while the BAR is mapped on the p2m.
> 
> Workaround this limitation by returning false from pci_check_bar() if the
> BAR address is 0, thus causing the bar->enabled field to also be set to
> false and allowing bar_write() to change the BAR position.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/pci.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/xen/arch/x86/pci.c b/xen/arch/x86/pci.c
> index 26bb7f6a3c3a..39fd5a16a4aa 100644
> --- a/xen/arch/x86/pci.c
> +++ b/xen/arch/x86/pci.c
> @@ -101,6 +101,15 @@ int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
>  
>  bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
>  {
> +    /*
> +     * Refuse to map BARs at position 0, those are not initialized.  This might
> +     * be required by Linux, that can reposition BARs with memory decoding
> +     * enabled.  By returning false here bar->enabled will be set to false, and
> +     * bar_write() will work as expected.
> +     */

Technically speaking, the particular corner case is plausible.

However, if I understand it correctly, when Linux finds an uninitialized
BAR, it checks if the BAR (resource) has been allocated, and won't
enable memory decoding if unallocated. See Linux
drivers/pci/setup-res.c:pci_enable_resources().

So I would consider dropping the "This might be required by Linux"
part from the comment.

> +    if ( mfn_eq(start, _mfn(0)) )
> +        return false;
> +
>      /*
>       * Check if BAR is not overlapping with any memory region defined
>       * in the memory map.


