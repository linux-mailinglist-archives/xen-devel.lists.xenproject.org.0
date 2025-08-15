Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F80B28735
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 22:36:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083859.1443307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un19s-0003Qz-0j; Fri, 15 Aug 2025 20:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083859.1443307; Fri, 15 Aug 2025 20:36:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un19r-0003P9-U7; Fri, 15 Aug 2025 20:36:15 +0000
Received: by outflank-mailman (input) for mailman id 1083859;
 Fri, 15 Aug 2025 20:36:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fG+3=23=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1un19q-0003P3-V2
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 20:36:15 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20605.outbound.protection.outlook.com
 [2a01:111:f403:2414::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73dbb120-7a17-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 22:36:00 +0200 (CEST)
Received: from SN7PR04CA0163.namprd04.prod.outlook.com (2603:10b6:806:125::18)
 by BN7PPF5D27497F1.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6d1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Fri, 15 Aug
 2025 20:35:57 +0000
Received: from SA2PEPF00003AE9.namprd02.prod.outlook.com
 (2603:10b6:806:125:cafe::ac) by SN7PR04CA0163.outlook.office365.com
 (2603:10b6:806:125::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 20:35:56 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003AE9.mail.protection.outlook.com (10.167.248.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 15 Aug 2025 20:35:56 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Aug
 2025 15:35:55 -0500
Received: from [172.31.85.68] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Fri, 15 Aug 2025 15:35:55 -0500
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
X-Inumbo-ID: 73dbb120-7a17-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HJT6ShUgDZprqNtv7OlkYV1ghdLIw7Vv50FyNEOjReziLSRmRU9yt36Zk2YV/CWAi1ZiuonTTl8+yB44x0je7nyycSzd5lx/RPbOIwhIQ1COceM5zIJSpZQGk/Q6ZZ2lzD9A4mEyXpezKGUGx0EYrjLF3E39/jkvak5gBht699og+lLWGZIj5Btb7BB4mhUJiOUMiaarLx7Zv5Vhfh8pPzVSwPjWFpOcYhJqKyaZ5PvXvGTvijzHS1s0c9h6rvjlp7fMdu5HKqvZpR+y/+R2NnSehjnBeAfUxAp+NqR0WrgHhu9Z94h2u+dt5OL9N6wQNdE9cJx6mzKpbNB9UqxM0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8uDGKHuLql1G+HoYZ1TJAjKzShrmL6zC1TPCMJ36T4=;
 b=FOe/X1eyIJIXAchZ3QWQNXKqhd+1s6icof8M30P0IwBeSJwm/WJJS01/VCEwWnAoDEtM/Hm1kRHqJkDdISIp1MJS0R6wtZ53vmKYqqr0c4KYvvdoHm+ehsiPRZphWnbs+9p5vCKZt1Z6bjy7kANw9pntTJEokiP1kOT+oMeXkjIS9yUbPykOSWy02QAK7+pcvGC2C1uexaskyKONpyykh7WxRVEPEluwUaLvgE7xwcZ81COsuMabZPZ6Sg7t1FTMnush0nUbFhNs+Tv6GM6uk2RFfF2Xx8ODP7mI2MfyIqEeot1kiI9wPlH2Xi1e6IDn37HxJLxXlgz9QFUTVDMS/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8uDGKHuLql1G+HoYZ1TJAjKzShrmL6zC1TPCMJ36T4=;
 b=fEm8EjzV3APTpjnHYMByFnzcwgqL2pDF5OguOnOpRCW+oURozMCWKq1wogIRohnhGOEY+ysJRDZ9jmYDFI+lUWm+qLjQuhy0ZOWAHJFWFl84msqj+fOgZIgu/bifdgWKpAtI56M2rw13zDgtejpbEKJDM/OgOIhkedfWrH2Cens=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <77c37121-2801-4c51-b167-1d6e364f4295@amd.com>
Date: Fri, 15 Aug 2025 16:35:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] xen/vpci: simplify handling of memory decoding and
 ROM enable writes
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: <Jiqian.Chen@amd.com>, <jbeulich@suse.com>
References: <20250814160358.95543-1-roger.pau@citrix.com>
 <20250814160358.95543-4-roger.pau@citrix.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20250814160358.95543-4-roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE9:EE_|BN7PPF5D27497F1:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e9f07d1-f58d-47f6-39b7-08dddc3b5666
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SDZNUFAwaVlncVRXRVd4M1FDQUtNMldHVDJ6T1U2N29WczlwcjZkdS83bmRp?=
 =?utf-8?B?c2Y2NXVQbnlSYUZ6dGtTM05WSC9hcm9WOURPRUZtUDRTY3J6TmVaMWJFeHIz?=
 =?utf-8?B?VVNnYXhSMEJHWUlVNDV5K1JxMHB5MEN0OU1qb2VJK0NzektRRGRiRk9DNUh3?=
 =?utf-8?B?clhkSmxsaC8wUk4wT0o4dXZ2Z1ZhMkxwTzRmNGNxdU1VVEVVZ2MzLy9lbmt5?=
 =?utf-8?B?RlRZaHNDaEJHeGIwTFBMRDVuOUQvRWJ4a25lMlZVa25lZFR0UHVtOUVUSkVE?=
 =?utf-8?B?aUZDWEVtOTQxQUhyVkRIdWE5eEVybFIveCtwbkkzMnRqYXNYR29lSFYwK1Rx?=
 =?utf-8?B?N0Z5eWxMVUV0bW4rZzZycEZRZVlTSmdtNXpNaDZndTEvQkUxYzhSMmhiek1L?=
 =?utf-8?B?V1RNendMTEMrcjdzQUc3T2VIalJDRW9jaUcrS2k4MzB5eFF5NXpHcG1mZUFO?=
 =?utf-8?B?RzZKVUx3bzBjOVk3ekptenpFbkxCMmMxRUVNUEJiYXNsVXBPUE56Q3lNQkxU?=
 =?utf-8?B?YXZIYW8yb1QxWXRnMUNJYlpzdHRpNmNsbG5jTnJCMjFYdnZ3MG9lSXE4TE5o?=
 =?utf-8?B?UjM4TkhQRCs4cksvcXNqQXZuTG02LzFKVFVYY0srRlRxV2lCamM4dVRMSXEw?=
 =?utf-8?B?U2NITEt4a3JIRGRsWEZjTWdGOURraFlFRk0rNGFRdUk0b1NVTjBhU1crNTBT?=
 =?utf-8?B?SGZjRlJCWTBEbDFOeGJBeHlzQTk0QkwxMklVY2JRUjFEM3FId3VJbldKVmhi?=
 =?utf-8?B?T3JKRTAyWjVXRzA2cVBwQ2dEZjdzSld2UDlFTlZQdmoxd3lCWlduVXBJTWpj?=
 =?utf-8?B?ZGZTbVFLS25Zd0crM2U4M0w2RkJmQ2pPSElBWjJRYXQ1VGNneUI5MHhwOUU5?=
 =?utf-8?B?OEFIY2lMUGJ5UTRpdEJlOU9oemt4WVBiaUxlWjZKaEdFaEt5N2RqQ1pDbGw2?=
 =?utf-8?B?UGpVSEpVRWY0eVV1dy9pemlGNisrSUhOWkNFRGp0cFlhTVVEVXNwaGZod05v?=
 =?utf-8?B?N01KT0ppUnRJeVNXNmw1L0Y2TjJZclEyVkdrNmhwbytaR1J6RjVWS3lENWgy?=
 =?utf-8?B?dTl5WTkxaEZFVGlJaWRMWTAwZ1daNjV6R3BHYjQwakZMWXpWUGZPM1RoZ29J?=
 =?utf-8?B?QWxPOHB1U2RNbmRRc1lQWStLUERROFUyS2RRMGtDN3hVNGtQRlQvR3RRWUtt?=
 =?utf-8?B?MHA2RDZmSzF6cEprczh4eS9MVDlqbE5rbWlkbSt6Ui9KN3RVY0dlSUxqaWhD?=
 =?utf-8?B?aHRhN1h2c05UY3JSYzVuS2pSMHUvNVo2bnEraUZpL3JjaUVnMnVFaWNIQzJH?=
 =?utf-8?B?Ukc3a0xGNXRlYW1yeVhER2diRnloTG9hQ3NySVFFTllreEVqYy95UkxSSGJ1?=
 =?utf-8?B?eHFMMHg5blhrQkJ4REVrUGpwQnF3UEY0dERtTUZFeWJoelpuZFAwZnRYYUx0?=
 =?utf-8?B?b1ZxSnRJR2o0WmhrSFhiYzRHYWQ5THBtazRKVVZQQzc1QjZMdkJVMG15NmdC?=
 =?utf-8?B?UjJZb1dkdGg2MEJrVUJVUlVXR1BUZzE5YW9aZTVvL0FqcHVRZlQ4ckVHK1ZE?=
 =?utf-8?B?Y0dWTXd1YWhIMVdQMEdFVHpPRWdDVStOazV4VStMRmpjL0ZuT0ZUeiszMzY5?=
 =?utf-8?B?bGd2d1Fka1N2SGQwUjJ4d1lBek02aUZML0w2K3BvZm04bll1RGtyMnhTaXZB?=
 =?utf-8?B?aWNFY0dFSlVMRTkrN3MrZDQvMHhoazgwRkpoM3Mvd004UHczNTJGTVdIWERt?=
 =?utf-8?B?NXBFdU5qeGxISEpqKy8yMHIwNnROYzRQbkRMcDJvbHhUOTVlT2k2VlJMMUtx?=
 =?utf-8?B?MllpY2xzWjNPMjFDL3JzVnhQS0sxcWZNQ3hmRVVMd2FlcjZwTFVpTXlQaE5K?=
 =?utf-8?B?M0F4aHRiZGkyQ2ppUHdieTU5dlV6ZEV5UnlXUkJlaHhkUU9FOGZEZE1aaHlW?=
 =?utf-8?B?eElyUERMd09NcWlJWnRxLytoQlZaNWFhZTFyQVBsVkhjc2tqeCtuemlxUGpT?=
 =?utf-8?B?cDY1Y09XNDRDcktyNGZpdnVvZUozQlBIWFRPeDQrVVVEVFdqSDlGaVh1WkhC?=
 =?utf-8?B?TWN0R0cvaEZtYW9mZUQzREFiWTVFZ1JMbSt5UT09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 20:35:56.6455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e9f07d1-f58d-47f6-39b7-08dddc3b5666
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF5D27497F1

On 8/14/25 12:03, Roger Pau Monne wrote:
> Deferring the actual write of the PCI register bit, either the memory
> decoding or the ROM enable is not helpful, and adds an unnecessary amount of
> complexity to the preemptible handling of BAR related p2m modifications.
> 
> In the hardware domain case, whether the PCI register write is done ahead
> or after the p2m changes doesn't matter, a hardware domain has plenty of
> ways to mess with the PCI register state if it wants to.  Any poking at the
> BAR p2m regions ahead of the guest write having completed will be
> undefined.
> 
> On the other hand, for domUs the memory decoding bit shouldn't really
> change as a result of guest actions, and should always be enabled.  Guest
> toggling the memory decoding command register should only result in p2m
> modifications, but no propagation to the device PCI registers.  Having
> memory decoding unconditionally enabled ensures the domU attempting to
> perform p2m accesses while the p2m changes are taking place will always
> access the BAR contents. This is not the current behavior for domUs, so add
> a note that it would preferably done that way.
> 

Nit: I think you want:
Resolves: https://gitlab.com/xen-project/xen/-/issues/98

> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/drivers/vpci/header.c | 42 +++++++++++++++++++--------------------
>  1 file changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 1035dcca242d..1a501a0ba47e 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -163,8 +163,6 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>              if ( pci_check_bar(pdev, _mfn(PFN_DOWN(bar->addr)),
>                                 _mfn(PFN_DOWN(bar->addr + bar->size - 1))) )
>                  bar->enabled = map;
> -            header->rom_enabled = map;
> -            pci_conf_write32(pdev->sbdf, rom_pos, val);

rom_pos and val are unused

drivers/vpci/header.c: In function ‘modify_decoding’:
drivers/vpci/header.c:160:22: error: unused variable ‘val’ [-Werror=unused-variable]
  160 |             uint32_t val = bar->addr |
      |                      ^~~
drivers/vpci/header.c:158:26: error: unused variable ‘rom_pos’ [-Werror=unused-variable]
  158 |             unsigned int rom_pos = (i == PCI_HEADER_NORMAL_NR_BARS)
      |                          ^~~~~~~

Other than that the patch looks good to me

>              return;
>          }
>  
> @@ -174,14 +172,6 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>                             _mfn(PFN_DOWN(bar->addr + bar->size - 1))) )
>              bar->enabled = map;
>      }
> -
> -    if ( !rom_only )
> -    {
> -        pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> -        header->bars_mapped = map;
> -    }
> -    else
> -        ASSERT_UNREACHABLE();
>  }
>  
>  bool vpci_process_pending(struct vcpu *v)
> @@ -547,16 +537,23 @@ static void cf_check cmd_write(
>       * decoding one. Bits that are not allowed for DomU are already
>       * handled above and by the rsvdp_mask.
>       */
> -    if ( header->bars_mapped != !!(cmd & PCI_COMMAND_MEMORY) )
> +    if ( header->bars_mapped != !!(cmd & PCI_COMMAND_MEMORY) &&
> +         modify_bars(pdev, cmd, false) )
>          /*
>           * Ignore the error. No memory has been added or removed from the p2m
>           * (because the actual p2m changes are deferred in defer_map) and the
>           * memory decoding bit has not been changed, so leave everything as-is,
>           * hoping the guest will realize and try again.
>           */
> -        modify_bars(pdev, cmd, false);
> -    else
> -        pci_conf_write16(pdev->sbdf, reg, cmd);
> +        return;
> +
> +    /*
> +     * FIXME: for domUs we don't want the guest toggling the memory decoding
> +     * bit.  It should be set in vpci_init_header() and guest attempts to
> +     * modify it should only lead to guest p2m changes.
> +     */
> +    header->bars_mapped = cmd & PCI_COMMAND_MEMORY;
> +    pci_conf_write16(pdev->sbdf, reg, cmd);
>  }
>  
>  static uint32_t cf_check guest_cmd_read(
> @@ -712,17 +709,11 @@ static void cf_check rom_write(
>          rom->guest_addr = rom->addr;
>      }
>  
> -    if ( !header->bars_mapped || rom->enabled == new_enabled )
> -    {
> -        /* Just update the ROM BAR field. */
> -        header->rom_enabled = new_enabled;
> -        pci_conf_write32(pdev->sbdf, reg, val);
> -    }
>      /*
>       * Pass PCI_COMMAND_MEMORY or 0 to signal a map/unmap request, note that
>       * this fabricated command is never going to be written to the register.
>       */
> -    else if ( modify_bars(pdev, new_enabled ? PCI_COMMAND_MEMORY : 0, true) )
> +    if ( modify_bars(pdev, new_enabled ? PCI_COMMAND_MEMORY : 0, true) )
>          /*
>           * No memory has been added or removed from the p2m (because the actual
>           * p2m changes are deferred in defer_map) and the ROM enable bit has
> @@ -733,6 +724,8 @@ static void cf_check rom_write(
>           */
>          return;
>  
> +    header->rom_enabled = new_enabled;
> +    pci_conf_write32(pdev->sbdf, reg, val);
>      if ( !new_enabled )
>      {
>          rom->addr = val & PCI_ROM_ADDRESS_MASK;
> @@ -1057,6 +1050,13 @@ int vpci_init_header(struct pci_dev *pdev)
>              goto fail;
>      }
>  
> +    if ( cmd & PCI_COMMAND_MEMORY )
> +    {
> +        /* Restore command register value. */
> +        header->bars_mapped = true;
> +        pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> +    }
> +
>      return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false) : 0;
>  
>   fail:


