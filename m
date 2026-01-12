Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF062D15628
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 22:08:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200940.1516721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfP8h-0005eV-KA; Mon, 12 Jan 2026 21:07:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200940.1516721; Mon, 12 Jan 2026 21:07:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfP8h-0005bb-GQ; Mon, 12 Jan 2026 21:07:51 +0000
Received: by outflank-mailman (input) for mailman id 1200940;
 Mon, 12 Jan 2026 21:07:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s6u4=7R=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1vfP8g-0005bR-1Y
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 21:07:50 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be8d3e67-effa-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 22:07:47 +0100 (CET)
Received: from BLAP220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::27)
 by CY8PR12MB7731.namprd12.prod.outlook.com (2603:10b6:930:86::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 21:07:40 +0000
Received: from BL02EPF00021F6E.namprd02.prod.outlook.com
 (2603:10b6:208:32c:cafe::8b) by BLAP220CA0022.outlook.office365.com
 (2603:10b6:208:32c::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 21:07:29 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF00021F6E.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 21:07:40 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 12 Jan
 2026 15:07:40 -0600
Received: from [172.19.137.210] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 12 Jan 2026 15:07:39 -0600
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
X-Inumbo-ID: be8d3e67-effa-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cHY244aeXZsb/k+l+EWeOBpGfEG0M3IYg3kpp2zN6sG400KhfWHzD8yDuQ03SNzy4xHN9xc7caU6f++ZJZkeLoaC+q3F+nsfZhGd8QJnSfTa1Lxr+s2FoMuLMwJc7xcW2c4OBvgh2/j5Iou0RsKl2vJOiiTJBR9KXxZZO7cgyGpDmLKEMxE+zuF6qESP0JhNw7/TGutR7Kp6TKWdkfx771wHtfFDpX8k06xvP6xsLpozICj9IP8D/hQ0Suco5XwmwLGSNRA54NQRDOWrcdEILvdP/hmucRnqu81rGFQLIGFEHALlq1cST/9zUAseL5bR/F8fF6pzh0o1OTg7s+jGGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1jsb76Nq0Wf6mBgjoKGQ1mv+0FByU8MvTVOwIFyp+0=;
 b=LCx2pRDBXNJzgMC5TvFZitbatX/m/aemzQd6xg4KXhkWN7pkJP1ltOYLKdytWxFfqz3DoOXCxkuazMEfkIrNTLsGuuf+lZeU1hSOdpBljT/kRM6EOSRASgn+nOoO5rk2KnGTzbg8+4Y0Qt3yJZgUfxno168u4ZlSuiLij/GJxl3g/Nt+ENr4GPcvstGAcG0jNngQ3C+XR+MaXBrddn7o8AnQ2OJ5A60nHbU/pcPDGakUiMSB0fEMlduNaA2gpUvCf06eJr41tBIRiormYrHZYLqQNUsE6jFzH1TAuC6DNnkM34eZMd5dSNyBh1FmwoYX3i7Zkwt70Bf8HJVBp5/7aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1jsb76Nq0Wf6mBgjoKGQ1mv+0FByU8MvTVOwIFyp+0=;
 b=uO42cvuZE2J+Z4hJM7mu3kid+8NI+O8WGn/QXWWflajQAUuzYIonmfTr6F/hZCeUtqNSkZVRm7MVQNUKc/dw/0m+mayF8laFamdZJD3nP483pSUxk3tAsqqE+ipkZlXPjtRGyTfEbmuJXYOU6TdFbquFNQQr3hNo4+VdS2TFFaE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <cf24b83d-517f-4cd8-b7c0-94f60738dc50@amd.com>
Date: Mon, 12 Jan 2026 16:07:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] PCI: determine whether a device has extended config
 space
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <05bc9acd-3054-4c5a-be87-cfd8d7bfa0f8@suse.com>
 <52eb1293-b5d4-4f7a-b53b-285e4dd274a5@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <52eb1293-b5d4-4f7a-b53b-285e4dd274a5@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6E:EE_|CY8PR12MB7731:EE_
X-MS-Office365-Filtering-Correlation-Id: 533e71aa-4b9f-4b8b-50a6-08de521e9f3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eVgzSUlWcGZ5VkpkMkpOOG5vbk4ydXZOOHZBVjRybkwwYzRsN2h0dnFlUk5i?=
 =?utf-8?B?NWRMTzErdXZKZDVvb1VnRXAvNTl0R2p6K2FkN2x2R2VmeXo1U0YwNUI5QmdP?=
 =?utf-8?B?VmVNRzh5aGM4Z3l4TWFKQ1B1S1Q1Y3VvNE4vRjdacXdTSXRQc04vT3JLZDFK?=
 =?utf-8?B?QjBrRHJWRFFQYmx5TlJzTTV4Rm5nWWo0eWdTWlZtQjRxeXI2QWU3UERobVl2?=
 =?utf-8?B?Q3U1R2pqeDdLSnRHOGpERW5PZTJmZWgyS0k2SU1RcTZ4YmhYdW9rQjBRUitL?=
 =?utf-8?B?d012eXFuK2svNVcyc3pjeU5zdjAzdHNPVFllYzczZzQyYjhMTzMwcHdBZEJR?=
 =?utf-8?B?OUVvL1dqUnAvWWtJNmg4RHk1V0lLTU1rVUxLNjlnSlltbkdzN1JkZFI5QkIv?=
 =?utf-8?B?Z3VIQ1d6SUFZdGRWb1dBcFYwM3poRmN0MU5lWVA4dTdxTzVHRjVMWi82UWhC?=
 =?utf-8?B?NG5NV0RocHhlNm95MUNtSEpaajJBUG1Nd3haZUE3NEY1WU9YU05YcmN1bHVC?=
 =?utf-8?B?dy9Jc0RlcEFMRXFkdFR0a0Y2U2ZUeHNRRDdpdk01ek1GWklUck9UOUs5am1V?=
 =?utf-8?B?SGRnVys5bit6YnFsSmRVakJ4WC96aGIvSnQrYUZpTHNqK0FZNUpsYVNmZHk3?=
 =?utf-8?B?RzIrZkhvVmJuVm9KNnNwZDBpQnlobWx4c0dpRXBoUGYwZEovdzBHSU5KdXFj?=
 =?utf-8?B?TXBtNk9HM0VaNnk3SDBsV0lsbGJudVBHQ0N6Y3MvU2wzS2x4MHdCL3JsYVZn?=
 =?utf-8?B?Yk5DN0tjNXJlR1l5dy9SQzc5M0c3MHRzUEVhT1RITWdTS21wdk5WckRaZGlS?=
 =?utf-8?B?WnlCQzRwa2VmblZqd3ZkeVFhYmNvMkdXL0R2aWJjdHkvNUd3TnRWQ3d5a09i?=
 =?utf-8?B?c0RtY0tFQlQ1SXlwcyt5bVJacEY2Vm9WQUxMNVhzRlgzUmI5V3hCOGNtajVv?=
 =?utf-8?B?dUt6RldnMmptbys3VklqTmQ4SVl4WW9XTjFyYWM5NW1STVJmRDEzRTdxa09s?=
 =?utf-8?B?M2F2UG54eXFCblNTcURYdXFPM0lWV1JMZVRhT3F3bnNlNDdiVlJBTmdUZy9o?=
 =?utf-8?B?NWxuT1JsTTdxeXZDdCtsamprMDhZTUluTXFiN1FJSitJS0N5c3pLUHVsUlQ1?=
 =?utf-8?B?dW9mODZKNUovQUVNZ1lmeDNaYTNTdERNT3EwOXpOcExFQnl1Y2lVbnp2STds?=
 =?utf-8?B?eWdFbE9HbkdvcE1vYmNnR1FpWHo1SzUvVGJtcmcwUnR4akF1Ym5DTFlRcmww?=
 =?utf-8?B?a1Z2VHJucHBRQ3A4VTZpMytDeEowdnJzVkRobnJiVld6S0JaVUZsWWxLeTdy?=
 =?utf-8?B?TUg5d0JnWWdhcUlTc0VQeHpobHBzTnhWUGpIN2xLZFdTK3NsL055OEEvbm53?=
 =?utf-8?B?SDhZcXo4S3R4aytYOG13MU1rNUZhUXBuejYreXlKUWhJVGpQRndmYWozaWg3?=
 =?utf-8?B?YjAvR2RvRTJETnRHM214Y09sV3FCQUNBR2hpUEtoVmtObjdTVEFPeUlzbWgw?=
 =?utf-8?B?VnpiQWpaSDVJTVphVlVXUjExV0pzOEJNbzhhTE1zV3dpZ29PZXZKU2RpQ0V1?=
 =?utf-8?B?U1QwQkVOVFBqdUd3UzVBTGpQZCthYklUOVBMUDdNS2lBaFkzVDZoS3FEbU1r?=
 =?utf-8?B?NlI1cTZkUmY0eWxQTW85bTZyLzZ4VjU0dVBJVWs4bEw2KzZDMkVMZFdoUUNM?=
 =?utf-8?B?Uko0UkhlNnVDODd6SzdscThUajA1NGFUWnBPSFh4dGJlZUwvR3pIQ0hVdnBv?=
 =?utf-8?B?RWFWTEhsbUExRkRmYmV5L25uSkJ1UmhhajdMVWkxNlVZc1pxQ0w1TmRsTitk?=
 =?utf-8?B?dm9EbVVVMDk1ZXUvNmlkNWljVERhM1BKZGFSMUhEYWVHcUxrVm1oZXRScm85?=
 =?utf-8?B?bTlSWkg0UXBtdjdiQ3NrQjhhek9WVFdyc2FNNXZKV3FOWUlqSnFEbElzLytR?=
 =?utf-8?B?NHRxcFVmVGtPay9sdXY3bkhOK1ZMU0NIbS9aZmJ2WnJyTWdqYWw0N1R5bldN?=
 =?utf-8?B?WkFpSFRuTmlQajF0NjVzOE42aXcxNng4ZGZjNitJc254YW0yb3lZRUJPRWdY?=
 =?utf-8?B?MytFUDlSZy9QT0tNYXllWXRYRC9rTFQyOUs2aWFlRUgrVkQwSEpsMUhMci9l?=
 =?utf-8?Q?Ve2w=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 21:07:40.6978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 533e71aa-4b9f-4b8b-50a6-08de521e9f3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7731

On 1/6/26 08:47, Jan Beulich wrote:
> Legacy PCI devices don't have any extended config space. Reading any part
> thereof may return all ones or other arbitrary data, e.g. in some cases
> base config space contents repeatedly.
> 
> Logic follows Linux 6.19-rc's pci_cfg_space_size(), albeit leveraging our
> determination of device type; in particular some comments are taken
> verbatim from there.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Note that alloc_pdev()'s switch doesn't handle DEV_TYPE_PCI2PCIe_BRIDGE at
> all. Such bridges will therefore not have ->ext_cfg set (which is likely
> wrong).

I initially read "set" as in "set to true", but I think you mean that ext_cfg
isn't assigned at all. Though perhaps it should actually be set to true,
because ...

> Shouldn't we handle them like DEV_TYPE_LEGACY_PCI_BRIDGE (or
> DEV_TYPE_PCI?) anyway (just like VT-d's set_msi_source_id() does)?

... in pdev_type(), we will only reach DEV_TYPE_PCI2PCIe_BRIDGE if it has
PCI_CAP_ID_EXP, which would indicate the device has extended config. So maybe it
would be better to handle it similar to DEV_TYPE_PCIe2PCI_BRIDGE in
alloc_pdev().

> Linux also has CONFIG_PCI_QUIRKS, allowing to compile out the slightly
> risky code (as reads may in principle have side effects). Should we gain
> such, too?

I don't have a strong opinion here.

> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -310,6 +310,41 @@ static void apply_quirks(struct pci_dev
>               * from trying to size the BARs or add handlers to trap accesses.
>               */
>              pdev->ignore_bars = true;
> +
> +    if ( pdev->ext_cfg )
> +    {
> +        unsigned int pos;
> +
> +        /*
> +         * PCI Express to PCI/PCI-X Bridge Specification, rev 1.0, 4.1.4 says
> +         * that when forwarding a type1 configuration request the bridge must
> +         * check that the extended register address field is zero.  The bridge
> +         * is not permitted to forward the transactions and must handle it as
> +         * an Unsupported Request.  Some bridges do not follow this rule and
> +         * simply drop the extended register bits, resulting in the standard
> +         * config space being aliased, every 256 bytes across the entire
> +         * configuration space.  Test for this condition by comparing the first
> +         * dword of each potential alias to the vendor/device ID.
> +         * Known offenders:
> +         *   ASM1083/1085 PCIe-to-PCI Reversible Bridge (1b21:1080, rev 01 & 03)
> +         *   AMD/ATI SBx00 PCI to PCI Bridge (1002:4384, rev 40)
> +         */
> +        for ( pos = PCI_CFG_SPACE_SIZE;
> +              pos < PCI_CFG_SPACE_EXP_SIZE; pos += PCI_CFG_SPACE_SIZE )
> +        {
> +            if ( pci_conf_read16(pdev->sbdf, pos) != vendor ||
> +                 pci_conf_read16(pdev->sbdf, pos + 2) != device )
> +                break;
> +        }
> +
> +        if ( pos >= PCI_CFG_SPACE_EXP_SIZE )
> +        {
> +            printk(XENLOG_WARNING
> +                   "%pp: extended config space aliases base one\n",
> +                   &pdev->sbdf);
> +            pdev->ext_cfg = false;
> +        }
> +    }
>  }
>  
>  static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
> @@ -351,6 +386,8 @@ static struct pci_dev *alloc_pdev(struct
>          unsigned long flags;
>  
>          case DEV_TYPE_PCIe2PCI_BRIDGE:
> +            pdev->ext_cfg = true;
> +            fallthrough;
>          case DEV_TYPE_LEGACY_PCI_BRIDGE:
>              sec_bus = pci_conf_read8(pdev->sbdf, PCI_SECONDARY_BUS);
>              sub_bus = pci_conf_read8(pdev->sbdf, PCI_SUBORDINATE_BUS);
> @@ -363,9 +400,19 @@ static struct pci_dev *alloc_pdev(struct
>                  pseg->bus2bridge[sec_bus].devfn = devfn;
>              }
>              spin_unlock_irqrestore(&pseg->bus2bridge_lock, flags);
> +
> +            fallthrough;
> +        case DEV_TYPE_PCI:
> +            pos = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_PCIX);
> +            if ( pos &&
> +                 (pci_conf_read32(pdev->sbdf, pos + PCI_X_STATUS) &
> +                  (PCI_X_STATUS_266MHZ | PCI_X_STATUS_533MHZ)) )
> +                pdev->ext_cfg = true;
>              break;
>  
>          case DEV_TYPE_PCIe_ENDPOINT:
> +            pdev->ext_cfg = true;
> +
>              pos = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_EXP);
>              BUG_ON(!pos);
>              cap = pci_conf_read16(pdev->sbdf, pos + PCI_EXP_DEVCAP);
> @@ -409,9 +456,9 @@ static struct pci_dev *alloc_pdev(struct
>              }
>              break;
>  
> -        case DEV_TYPE_PCI:
>          case DEV_TYPE_PCIe_BRIDGE:
>          case DEV_TYPE_PCI_HOST_BRIDGE:
> +            pdev->ext_cfg = true;
>              break;
>  
>          default:
> @@ -420,6 +467,19 @@ static struct pci_dev *alloc_pdev(struct
>              break;
>      }
>  
> +    if ( pdev->ext_cfg &&
> +         /*
> +          * Regular PCI devices have 256 bytes, but PCI-X 2 and PCI Express
> +          * devices have 4096 bytes.  Even if the device is capable, that
> +          * doesn't mean we can access it.  Maybe we don't have a way to
> +          * generate extended config space accesses, or the device is behind a
> +          * reverse Express bridge.  So we try reading the dword at
> +          * PCI_CFG_SPACE_SIZE which must either be 0 or a valid extended
> +          * capability header.
> +          */
> +         pci_conf_read32(pdev->sbdf, PCI_CFG_SPACE_SIZE) == 0xffffffffU )
> +        pdev->ext_cfg = false;

I'm using a machine where
xen/arch/x86/x86_64/mmconfig-shared.c:is_mmconf_reserved() will initially return
false during Xen boot:

(XEN) PCI: MCFG configuration 0: base f0000000 segment 0000 buses 00 - 3f
(XEN) PCI: Not using MCFG for segment 0000 bus 00-3f

Then, during dom0 boot, dom0 will call PHYSDEVOP_pci_mmcfg_reserved, after which
MCFG becomes enabled in Xen:

(XEN) PCI: Using MCFG for segment 0000 bus 00-3f

On such machines where mmcfg/ECAM is initially disabled, this will effectively
set ->ext_cfg to false for all devices discovered at Xen boot.

I'm not really sure if I have any good suggestions, but perhaps we could add a
macro or small function that returns something like
   ( pdev->ext_cfg && pci_conf_read32(pdev->sbdf, PCI_CFG_SPACE_SIZE) != 0xffffffffU )
to allow this checking to happen dynamically (but this still wouldn't handle the
aliasing quirk). Maybe re-run the ext_cfg detection logic at the end of
PHYSDEVOP_pci_mmcfg_reserved?

Regardless, I'd be happy to provide my R-b without this addressed, but I am
curious if others think this as an issue?

> +
>      apply_quirks(pdev);
>      check_pdev(pdev);
>  
> @@ -717,6 +777,11 @@ int pci_add_device(u16 seg, u8 bus, u8 d
>  
>                  list_add(&pdev->vf_list, &pf_pdev->vf_list);
>              }
> +
> +            if ( !pdev->ext_cfg )
> +                printk(XENLOG_WARNING
> +                       "%pp: VF without extended config space?\n",
> +                       &pdev->sbdf);
>          }
>      }
>  
> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -126,6 +126,9 @@ struct pci_dev {
>  
>      nodeid_t node; /* NUMA node */
>  
> +    /* Whether the device has extended config space. */

Nit: it would be nice to clearly state if this means the extended config is
accessible, or whether the device merely has it (but might not be accessible).

> +    bool ext_cfg;
> +
>      /* Device to be quarantined, don't automatically re-assign to dom0 */
>      bool quarantine;
>  
> 


