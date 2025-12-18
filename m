Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58420CCC834
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 16:38:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189841.1510543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWG4V-00075Q-ID; Thu, 18 Dec 2025 15:37:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189841.1510543; Thu, 18 Dec 2025 15:37:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWG4V-00073Z-F9; Thu, 18 Dec 2025 15:37:43 +0000
Received: by outflank-mailman (input) for mailman id 1189841;
 Thu, 18 Dec 2025 15:37:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XN7D=6Y=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1vWG4T-000729-M2
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 15:37:41 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 796189fd-dc27-11f0-9cce-f158ae23cfc8;
 Thu, 18 Dec 2025 16:37:36 +0100 (CET)
Received: from CH2PR05CA0056.namprd05.prod.outlook.com (2603:10b6:610:38::33)
 by IA1PR12MB8468.namprd12.prod.outlook.com (2603:10b6:208:445::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 15:37:29 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:610:38:cafe::6a) by CH2PR05CA0056.outlook.office365.com
 (2603:10b6:610:38::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.5 via Frontend Transport; Thu,
 18 Dec 2025 15:37:29 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 15:37:28 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 09:37:24 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 09:37:24 -0600
Received: from [172.29.241.99] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 18 Dec 2025 07:37:23 -0800
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
X-Inumbo-ID: 796189fd-dc27-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nFIqXM8TDOdv85FHr7HI8c1TYnNHZh7uuBmFIUXsyTpAhEWA3qYHPGnIqDQttixc+vZjSkjAVg4RozX/Eufb4E/kScDbtVahCeOVTDm/n75jhnMrqCwTcsOVLt/gqyju25KuZ7qWK+gc845teQpAXuYvtKpwcqcS+Pe6AUZd4o9o0p/Z+wzkwPVzx8nDcw2UudcrnLghfEbfPkt74xFmwbknure9NCo5VBZ785IeiBUkvh6tR8jVJSyObeQccftUMffaVgAGn0cLJ43QQVEsNPM0+3DV9e0MwSZz22pj72zkYq3aBnp0jPHA6pLacCwtFuY0vYZogCj++Tkg6Pvspg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3UgJSk1lnpS7+K62I7zmSjZ8YkGRoNS+ZhjEyffwGA=;
 b=sX1+9/vo5aDQoSeqwp8SdI2UWoHYI3RED1Ois/lyKRC1Dpf0JV8RVYFECbGw6Ky7+wlvtxjQB9kkvcgWwa8pnxfQzbjg9MUh2y5JX73J4CxkgpiGULh07QDEDUEiUTtYVftdHly8c38mx36TxNZzqvZ4mW42MosleM4/ieWqZEUXrcjgnQF4tZROxap6Jogfn4lnDryRzfqhCzKpVFmQ5syxLIl/e1UthSXyEcK9NyVEqkjkSv4dAC2su39bCwCdqDQ/N/18MgN/yIHhzr6H4g6X79KtbiRCRwzr2hxHclLS1jmBoXAFhtlsKFmnC84ssC34FXT9Y86iaeVQfTK3iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3UgJSk1lnpS7+K62I7zmSjZ8YkGRoNS+ZhjEyffwGA=;
 b=B/60QgTYwzggXPRkRTCqN1L/gNvrtI1z9/qtOkssfaKS9Qov5WjD/awC47ix1ktJ3FeSnQWjwxLVU6Dg2duO/saYsuxAUiKZwCU7RwnR/Z1kmzJunY1QQlZjI2B81HV8ZxSmYKfch8s/9dIWa7oo70gWiu6VBbefl0aYq7bXoD8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <e1fe4599-02e2-487d-a2c5-bc912fe8646e@amd.com>
Date: Thu, 18 Dec 2025 10:37:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vPCI: avoid bogus "overlap in extended cap list" warnings
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Chen Jiqian
	<Jiqian.Chen@amd.com>
References: <26294a6d-e99b-4290-988a-da7b7b838651@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <26294a6d-e99b-4290-988a-da7b7b838651@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|IA1PR12MB8468:EE_
X-MS-Office365-Filtering-Correlation-Id: ece9e6c8-c575-4a7a-37b2-08de3e4b5a28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aERHeHUrT2sxYm4vOVZhMXF1cmV1VDVsZHNSZFpXaUwveHFoYVB3OE1CMDZT?=
 =?utf-8?B?Zkoxd2xOOCsxUy9EMkxuUzBybDdvN2M2VC9lWjRiMkRoZ1IxZ0ZsK1ZGN3Bj?=
 =?utf-8?B?SWZjWTJSczlCTFdQQnd3RHdEZlpvb1ViRFllVWlNVmtIamZ3T0ZHY2h5S0Jt?=
 =?utf-8?B?VXczSVc4ajAxRHVKdzV5dklRS3BWU1lxMXFUVlR4TzB1enhoWXNsZWxKTUp2?=
 =?utf-8?B?dnV3c0xvN3lPY1pCOGxPamZiNnhGUC9KTGpQSDU5bXc5VXkvb2w1UWxKU1VU?=
 =?utf-8?B?eUpmUXdXRUlXRGpLUGdTT0x2Tkc5MzNFcmRROXp0bDlabWZTVlRxckJNeW5I?=
 =?utf-8?B?VnRBVXJqNHU1d1V3Z3ZxSDBRMVUrc08rL043NkIyU2hBWjNobG9aMDg1N3Qv?=
 =?utf-8?B?NGJ1WXlibHhTT0p3Q2FpVkh4ZlJub1BrUVA4L1FZT2g5eGRvd21nTFptVFpX?=
 =?utf-8?B?Mng0WDg0OERTWGFGdmcyM0RHV2ltdlVUL2o3bWEvbWQrckFOeEhWRm82UWdH?=
 =?utf-8?B?M0xzcWNyYmx1dW1lNE1Udkh0dXpoQXpKZEIyODdLaFRUdDNjbk96NXpqWWxH?=
 =?utf-8?B?b2VtWXRuTnNJK0RkSW53WThtQWs5VXRubVhsK2x2Y3ZpazM0WVNDb2l0eHJZ?=
 =?utf-8?B?c0RYRFRsVUE4ZjBKcHNxcnBLMms0Rk9HdVVVZ3ZyVlltWWw0MlhFOXdXVW1B?=
 =?utf-8?B?Yjkwc3N4cjNCL0RuTFp5REdtSUJsNEhoQmFXOXJSZkVqTmFXZGJnQlQzTjNC?=
 =?utf-8?B?Q0tFb1BMZEl5azhnU3FWYTJMTTdWS1NCeCtlanNJTjRKMS8rNzVpa2tkMkJP?=
 =?utf-8?B?dCtWZ0JlMlhuOGR1dUEzWnJqc1hhL2NTazhIWFdvbmQzUXpXaFVhVEtaREJx?=
 =?utf-8?B?Z1JnSHc3Z3Y4UlZseFlURkVFa09GWVNrYnY2QzlWWmRMenNxNEJnUFN1bFkr?=
 =?utf-8?B?WlFnbE5SNHQzbXI4TVNTWHF2SWpDdzNQazlia2IxVEFIVjZ2c1g2ZlZQcWNs?=
 =?utf-8?B?YWJrYUVybVNPRi9IcDAyMmZCSkdMRTVIMS9MYTFYTnJHcUltL3ZGcTdETHBI?=
 =?utf-8?B?WFd6MzlpdHN0dGZmQ1MxZXpwUUl1d3NOaURSZTZRUStOa3JJN1VoblpJZEJH?=
 =?utf-8?B?RHhZNExKY1ZLYytWeVl6ekd0RjZSbmVXcGRQb1IxRXNlWjBKS2R5ZnpZcmsv?=
 =?utf-8?B?Z2ZhWHU3Y1hVRDg0ZTQ4WFZjdGFoN3ZqbkkyT1BIV2RsYVlVU0tEaVBSTHdD?=
 =?utf-8?B?RkJJRGhpamNtUXkweFdOYm9EcVVSSHB6WGNhME5UTjEvVFdCbm5Zb29EcVBY?=
 =?utf-8?B?QVo1K2RINXhOMlhtWHI0YUsvdG9pdlAyZU9id2FsRVFsUzVEOGhzNkV1ZWFX?=
 =?utf-8?B?QjVBZkU2MzlxcnJ0SjAzODViSkwrTEFWUDBVMzNXRDA1YlhoOVZXK1VpLzhj?=
 =?utf-8?B?MjZobUpMNm1NdkN6R3VwbG5LVjJWa1Y5ZmVQU1kwZmk3YzRoTVphS3dSdG91?=
 =?utf-8?B?TjRFTU4rYlZBQUlHK0lvdmlUU0pWN0JGTWJ4VUdMYzBoNEovNE5KU1AzL3cv?=
 =?utf-8?B?SWI3bWV6MVZlVWFMRDBqMHp4RFpXN21ESnUzRHVDWGV3U3JDbDM5dHcxenht?=
 =?utf-8?B?MWFiVGZMWUNYc0VXdGFhTXdPNWN4UDgzMU44b2tiNmZVNGRPeDhRNDVXRDMw?=
 =?utf-8?B?SmpkUllnNG1Tc2xFRHZhOXg1dFlxbjdtUHRzN1pQZC85N1o4M0w3dEl4dTRu?=
 =?utf-8?B?bmJFbktaQzhqREx3QzQ5QnRSb2VXNU40aGpjUWpnUk94YlB2Q1YyQ1o1Q3N1?=
 =?utf-8?B?aTZ1bVNrQmV4RXBEOW4vV3NoUU5zQnM0Z1o2ekxPM2NiTmtQa2J5dXRUK2FB?=
 =?utf-8?B?UkJoVm5BUWwyQWdvYm9VUHd6YUlqM1E3YVJic0hOOVp5bG9GRFg1N1NTUEw1?=
 =?utf-8?B?MUoxZXJZaUp4S3lNQzlzbDBkRG9PZGs2OWZ1Z2REaEZKUHI2bFZxQjl5MXRm?=
 =?utf-8?B?YktxS0FUZFFJWlVqUngrNlRYSU0rYWx0ZDdqZWg4RFZNYWFRM1F2RERJbU43?=
 =?utf-8?B?N2xtWEx2Ri8wVEU4aStmbm5EL0c3cHZtZEdabmhUaHQzY2xEc1BUVlBaSWl6?=
 =?utf-8?Q?nkA8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 15:37:28.8707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ece9e6c8-c575-4a7a-37b2-08de3e4b5a28
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8468

On 12/18/25 02:56, Jan Beulich wrote:
> Legacy PCI devices don't have any extended config space. Reading any part
> thereof may very well return all ones. That then necessarily means we
> would think we found a "loop", when there simply is nothing.
> 
> Fixes: a845b50c12f3 ("vpci/header: Emulate extended capability list for dom0")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> This is the minimalistic change to get rid of "overlap in extended cap
> list" warnings I'm observing. We may want to avoid any attempt to access
> extended config space when there is none

Agreed.

> - see Linux'es
> pci_cfg_space_size() and it helper pci_cfg_space_size_ext(). This would
> then also avoid us interpreting as an extended cap list what isn't one at
> all (some legacy PCI devices don't decode register address bits 9-11, some
> return other non-0, non-all-ones data). Including the risk of reading a
> register with read side effects. Thoughts?

I couldn't find any mention in the PCIe spec how reads of extended config space
should behave for legacy PCI devices. So, you're right, reading all 1s may not
be a guarantee. The PCIe spec seems to imply that a PCI Express Capability is
required for devices that have extended config space. How about adding something
like this at the top of vpci_init_ext_capability_list() (untested)?

if ( !pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_EXP) )
    return 0;

This would seem to me like a reasonable effort to handle the situation
(according to spec), without the complexities/quirks/cruft that Linux has.

> The DomU part of the function worries me as well. Rather than making it
> "read 0, write ignore" for just the first 32 bits, shouldn't we make it so
> for the entire extended config space, and shouldn't we also make it "read
> all ones, write ignore" when there is no extended config space in the
> first place (then in particular also for the first 32 bits)?

Hm, yes, perhaps. If we simply omit the call to vpci_add_register(), it should
default to the "read all ones, write ignore" behavior. This assumes that ECAM
will be enabled for domUs so they can access the extended config space at all.
We have patches in our downstream to enable ECAM for domUs, intending to
eventually send upstream.

> Should we perhaps also log a warning if we exit the loop with non-zero
> "pos"?

Hm. I don't have any particularly strong opinion on this.

> 
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -839,6 +839,15 @@ static int vpci_init_ext_capability_list
>          uint32_t header = pci_conf_read32(pdev->sbdf, pos);
>          int rc;
>  
> +        if ( header == 0xffffffff )

This constant should have a U suffix.

> +        {
> +            if ( pos != PCI_CFG_SPACE_SIZE )
> +                printk(XENLOG_WARNING
> +                       "%pd %pp: broken extended cap list, offset %#x\n",
> +                       pdev->domain, &pdev->sbdf, pos);
> +            return 0;
> +        }
> +
>          rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
>                                 pos, 4, (void *)(uintptr_t)header);
>          if ( rc == -EEXIST )
> 


