Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A05FA9B1E1
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 17:17:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966491.1356689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7yJd-0000Sc-Ha; Thu, 24 Apr 2025 15:16:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966491.1356689; Thu, 24 Apr 2025 15:16:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7yJd-0000R6-EL; Thu, 24 Apr 2025 15:16:41 +0000
Received: by outflank-mailman (input) for mailman id 966491;
 Thu, 24 Apr 2025 15:16:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KQwv=XK=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1u7yJc-0000R0-Ct
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 15:16:40 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20619.outbound.protection.outlook.com
 [2a01:111:f403:2413::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b99aff8-211f-11f0-9ffb-bf95429c2676;
 Thu, 24 Apr 2025 17:16:35 +0200 (CEST)
Received: from MW2PR16CA0062.namprd16.prod.outlook.com (2603:10b6:907:1::39)
 by SJ1PR12MB6243.namprd12.prod.outlook.com (2603:10b6:a03:456::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.27; Thu, 24 Apr
 2025 15:16:30 +0000
Received: from SJ5PEPF000001EE.namprd05.prod.outlook.com
 (2603:10b6:907:1:cafe::df) by MW2PR16CA0062.outlook.office365.com
 (2603:10b6:907:1::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Thu,
 24 Apr 2025 15:16:30 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001EE.mail.protection.outlook.com (10.167.242.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 15:16:29 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 10:16:28 -0500
Received: from [172.20.75.239] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Apr 2025 10:16:26 -0500
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
X-Inumbo-ID: 1b99aff8-211f-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZwSwtPn7DZKYRV9piqPRtSIIwuUihQtskVHwvaUlpDQp7OcFOAeuaZotHvkj9+srz+GlQ/E/GGNzN17FHooKqqvOfnqwrskSa2ObfsujtD7rJ5Sovy5+cH79fwHqaic8DkJ89uKGrauk6OyOjyLT94MHvJ2AKzOIKajzu4fr+6m4lfo8GDH10Hes1swVEImqXaWa5EM/VuoDNX7Tbx/apOUAk9D4KAtgKsrpxigcer7Y8kOLBwJbbxrI9nfzp4TLWe4h+gGDdPpedY2KMZ01CBO5pAgTMXWTk4qHqImERessgcD/gM7P++3o+J445jZ2lYp6CNoozIlqW/jHl2Kykg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLkqiYHz/dfTOq+gF9FZyxmHm5M1bod8XoHvUSWEMi4=;
 b=bP1lmph9NeqplazCKlBzcjAEUQXDy6RaVdcOej1UkMLRyKKALwxDRdrq4QxK6tx6C2vgYOPX7pMPmU4f+CghnGrTtjqFvl8iJxN/tShYLdK8IEoZuOg42WAvRR7ctYsny0HSsUgjVy1NBqmY1KjkfGIUmVFOwV5QbdQOek3q8fQ1RmDYAs+jNKfZEQiebMjlfi/VLb2VVvJUY1Q4JWgRidwZrQYlnxyaiAlnm4w7gXpUuHDOEk/4m6KfY5usd23aT3IYgr0REttY/N9Hx3P9NSgwlMJseAXisocodUYPo64BDeZzV1H9J1jnssvOtsnNM9EPXqofL34iMng7Ti58hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLkqiYHz/dfTOq+gF9FZyxmHm5M1bod8XoHvUSWEMi4=;
 b=jA7hL/Tof8lGBxoBLOBayTPXoJLKlmzLLERVNxyb+DRrU7nQnoBH/jip6Ej3eZ2WSubgFkLlvE6p8bNaNleE3PEwKEeS92RTROv1e9P4odNLBwfqGEa53WKdxoSkKzUCx87z7U559wb4OpzqzCNS4uWK83qaPx1xPFJIZa99TS0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <882700a9-a59f-4249-8131-b0dae5f12bfe@amd.com>
Date: Thu, 24 Apr 2025 11:16:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] xen/arm: add support for PCI child bus
To: Mykyta Poturai <Mykyta_Poturai@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1745402473.git.mykyta_poturai@epam.com>
 <79bbb6705638445526bbd1fa299b7bfd0d087462.1745402473.git.mykyta_poturai@epam.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <79bbb6705638445526bbd1fa299b7bfd0d087462.1745402473.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EE:EE_|SJ1PR12MB6243:EE_
X-MS-Office365-Filtering-Correlation-Id: dfb9ba63-ad1f-4794-e2eb-08dd8342fd73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qk15VitOZkJTUkhMalJaY3FGemVnQXZ5WENqZ0IwWVN3SElkZTdvazZjeURH?=
 =?utf-8?B?bVQwTWEvblJ2OER1RDN6T3MxYUtDWko1NjRXRHQ0VVZnYzR5TXVqeHN6MWhW?=
 =?utf-8?B?TzFabVArdjF5N2pESFU2SW9peTJSMmhSaUFnQzFReEFBVWpVOFVQMVBXWXN3?=
 =?utf-8?B?bnRONFFtK2lzNnVNeTBWa21tdXRoL1RDb3dRZlJ0NTQ0WWVPYjBlTGpZT1Vz?=
 =?utf-8?B?ZWgrQWI4YXBBSXR1SGNONTZiNW8wTTlqbVgxZFNndjZxZElkQ2gyN3grLzRy?=
 =?utf-8?B?OCtBSTN5QlJyeC8rcnd5VXl2aFQvM2RFNjhxc2MwVHZPdWt3OWRORDJlRk1p?=
 =?utf-8?B?YU50VHAvb1g3MnljSk4ybEtRNnNuNkt1ZHVGVDEwNGZXSnFwaHVKZGNCVUp6?=
 =?utf-8?B?NS9TOHhrenVJOUtleTRoN1JVWFIyM3JFdjkrYnIzVU56N1NnMXorVmcvbEJS?=
 =?utf-8?B?RXpPMldmcStVbFQ4aEhCY2Z2RUtJY1pRcDhVUXc4ZFRUVmZ0VUlENDJzNWs5?=
 =?utf-8?B?T3hLeFRHSGNlUytpLzc3bndMQi9ObC9jOCt3ZlFmMXZQV1dHUHo3VjZUcXUz?=
 =?utf-8?B?OWxXbmpTOHc1ZDBsOVhzdG0xWnRjdzk1MkR0Y2t3My8zcWE2VjBvSDJVL0tB?=
 =?utf-8?B?cWYwc0ZMbWVqU25SemFFaGg0eldFeTVYQTF3Uy9LdDEvdFhjQXhvNmVxWlVv?=
 =?utf-8?B?bndDOHBxUFIrREtMc0d0VW5XRUwxQVRUSnBJeUZKS21SS1RmZDhMS3RXOHJN?=
 =?utf-8?B?bkFqV0MxelQ4VEw2bnNmMi9pMCtkMlFlK3BNS1daUUh0UXVNR1F3TDJ5RS9n?=
 =?utf-8?B?QW1CT29EZWRRaHU3YjMwa2hWRExFSDRZVzhsUkNHTUtJaWdZQzVnc2JJUUZv?=
 =?utf-8?B?QXBaZzVVWmljVW4wRnExWTVpdGx6OXV1SCt1Mk04UEpzRVBRamJuRjl1UTRR?=
 =?utf-8?B?bk5ab3BRbE5CVmNiWk1IVlFKMFVvSEE4Nyszbk5FZVBMc0RxRExXVUE1dm4x?=
 =?utf-8?B?QlhpbDBzZW9sTnNFYWVCemZLL01Vc1YyOGxIZlJ3MXVITzRhYkdLNUN5akNp?=
 =?utf-8?B?K1dCcEJLYVdRSWhoM1gzaG82bWxRay9GQ1V5NGJ0TGNocy9KcXRQa0RxRUNu?=
 =?utf-8?B?czE3bytLd1ZCK25hTm96OHpzOWR0Z1VISFJkNjdNQ3VSTDV6ZktDWFFQc1ZJ?=
 =?utf-8?B?UXJ4RGsxK3VKNWRzVmlwaWNmd1JSTUJLcFlSdDhkeitGd0NPYmxpa0JyNVlm?=
 =?utf-8?B?QytYYjBEODVJVjUzaEpWVjA1eTd3ODVXTjVqdDEwbk56YW5iWHZERk94TUl2?=
 =?utf-8?B?Wk9keXZkeHpZdUlZQVN2ZDVoeFBETERQN2FHMGJYd0NQMVhrRERoYkpqVVRy?=
 =?utf-8?B?Y3M3T2VjaThRblQybDFFaWNucTJmSWNMZmdjb2gwWkkxdU8wUlhKT1hObDkw?=
 =?utf-8?B?dk15cUtiaUtCL1JRamZsNmt2S0UxNXZJa2NDV3pHdEo4MitmS1oxUlY4YWxH?=
 =?utf-8?B?bWtDKzMrdVFGcUp2OVJvU1pObVRVb09qU1BXZnpjQVl5aUlvS1F4MGkxa2tI?=
 =?utf-8?B?Wk5URlU3Qll3eTJXU0kyamZmZm50RlhidVhrVEVjcFYrN25PU201OEJGaHZM?=
 =?utf-8?B?OFphbEExNTdOL2RMeStxL0Y5NU1TMzJuRFRsWHhicUZIY3MrWTlMZGZoMjVD?=
 =?utf-8?B?OC9lSGF4MWhjT1pDOHNjbStZeFBrRDJRWUZhZ0w0cGNjbytnV2RoMVVYa2ZE?=
 =?utf-8?B?VVQ3T0t5TWpnWGxEcFROZWRuMGhpVXQzcTM1MEVZbEhodVFleElKZmg1OEdP?=
 =?utf-8?B?ZEtLdnJqV0ZzejMybDlXcmlQQ3MrZm1acXRjL2pQOVdiQUxmRmRjR2JjUE1L?=
 =?utf-8?B?S1dXanFwR2VRQms5UkFrUlFCM1Z0b2RDYk1TRm1PRDBIMEpkZDNWajQ4dnZZ?=
 =?utf-8?B?bWZDdTFSZW9ET3RpbHpMME01bWtndlpsQlB3d2ROazVmOXFDTjVhdEhEVEY5?=
 =?utf-8?B?QWRTL0tXSWIvR0granA3T3o3WUlyMU5CcUlhVFRYSHBUaG5LemVNeW14YkhZ?=
 =?utf-8?Q?Y4Phwa?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 15:16:29.8382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb9ba63-ad1f-4794-e2eb-08dd8342fd73
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6243

On 4/23/25 07:08, Mykyta Poturai wrote:
> diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-access.c
> index 9f9aac43d7..91271973fb 100644
> --- a/xen/arch/arm/pci/pci-access.c
> +++ b/xen/arch/arm/pci/pci-access.c
> @@ -18,10 +18,31 @@
>  #define INVALID_VALUE (~0U)
>  #define PCI_ERR_VALUE(len) GENMASK(0, len * 8)
>  
> +static const struct pci_ops *get_ops(struct pci_host_bridge *bridge,
> +                                     pci_sbdf_t sbdf)
> +{
> +    if ( bridge->child_ops )
> +    {
> +        struct pci_config_window *cfg = bridge->child_cfg;
> +
> +        if ( (sbdf.bus >= cfg->busn_start) && (sbdf.bus <= cfg->busn_end) )
> +            return bridge->child_ops;
> +    }
> +    return bridge->ops;
> +}
> +
> +static inline void __iomem *map_bus(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,

Line too long

