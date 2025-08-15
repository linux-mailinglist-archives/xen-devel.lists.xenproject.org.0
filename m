Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AAFB28612
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 20:54:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083733.1443203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umzYf-0002XO-0C; Fri, 15 Aug 2025 18:53:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083733.1443203; Fri, 15 Aug 2025 18:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umzYe-0002V6-TU; Fri, 15 Aug 2025 18:53:44 +0000
Received: by outflank-mailman (input) for mailman id 1083733;
 Fri, 15 Aug 2025 18:53:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fG+3=23=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1umzYd-0002Uy-DE
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 18:53:43 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2408::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2874aeef-7a09-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 20:53:40 +0200 (CEST)
Received: from BY5PR16CA0035.namprd16.prod.outlook.com (2603:10b6:a03:1a0::48)
 by BN7PPF0FD1DEA27.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6c8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Fri, 15 Aug
 2025 18:53:38 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::21) by BY5PR16CA0035.outlook.office365.com
 (2603:10b6:a03:1a0::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 18:53:37 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 15 Aug 2025 18:53:37 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Aug
 2025 13:53:36 -0500
Received: from [172.31.85.68] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Fri, 15 Aug 2025 13:53:35 -0500
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
X-Inumbo-ID: 2874aeef-7a09-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mhQdyellYa1b9zuP0rJFVLvzoR6UC2NW/TGwlMXHhhkyQT13IGwtucbKob8BWVLm2H0qIaJVZEq0d/QaWDFFq0aJ7jXl/RwAx6KvRJmsewchf0xf24OCXZAAL2ioJ/6qwSLgMWJbYxX2W8zuTxBJasb1jsKdqsfdcss6nrYIgnB5Gniww3M2Uwm3w04eZEirkeqXB9d1SKuhBTK+PfyFMWrvfemzuKXWqSiaBcdhxsDu2S9xPYhmKmnSl/NtrcG3S2v4NSzEqiXiZfMCKW+TulStXp2xFWH4ZBaZW+7nvchxihrSfLx+qIlLi1noGmj5NHscNB5ENBGXGbhjWkTfYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Vn11oGlMGJdgsJKJ/UkgI2qFLAsdSYPvFyKvx/9Zk8=;
 b=ZNWaxvNMNPX2nZrCzKOXkeCno/FLibJxF0coXphGlrgt0JdbHMbuRw71g97C49MM1Lc0Q/VRhARq4V3S6RoIUiG6dbPlsr8gdHJgtzA6/HsBea74A0Q5n56kqffj6m8niUyXism0ZKwPIvQ1gPQcpfJgdP+bErBCpvfLRT10seQku/Ya1nI4/9w4swwJtZYjCA5fxAB61Uim5/HAZZoGa6jghrQHMPQ/zugOaoW4oow3jCrDYvRiYCE7Csy1s574S89EW59r5yxVYvrKWo7/kwmGB82MtG7oG6LrHjrZsnTARzMDN/IfK8ET23HtV0H4s2ASe4eyKlGeUDYjpD/shA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Vn11oGlMGJdgsJKJ/UkgI2qFLAsdSYPvFyKvx/9Zk8=;
 b=4+PkkMtrIvhXzc9EeupKaW+kTTnMygAYZjUmbDuz5s6vnPKfBEzdmonzNQ6VghcZXabUy93BHcDioCTmfJg72q0VLgQXVYUqqGLVuEjU4hRzLreVrkf3ROXimQ/MhBcL5YdwlWqP5MiJnPGBs2KXbVMcKjoYhyLeSW2YIWXBzkI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <269db2aa-9ca1-446b-98f7-60ea2386fc03@amd.com>
Date: Fri, 15 Aug 2025 14:53:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] xen/vpci: make BAR mapping more resilient for the
 hardware domain
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: <Jiqian.Chen@amd.com>, <jbeulich@suse.com>
References: <20250814160358.95543-1-roger.pau@citrix.com>
 <20250814160358.95543-3-roger.pau@citrix.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20250814160358.95543-3-roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|BN7PPF0FD1DEA27:EE_
X-MS-Office365-Filtering-Correlation-Id: a3c8b5bc-b899-4955-a012-08dddc2d0b2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZFZyeHU5b0dDWmlZb2lieXpBWmUvL1hpQ2hDY1JEMEdvL1BMMHl0SW92dzRK?=
 =?utf-8?B?VXM3M0JaY1RsRVZwSkxQN09GQXgwSGhMYi9vQ1V6Z1A3ZEt3cVpOaWJndUpp?=
 =?utf-8?B?R1l5SmVnM05kZGtQb2FVQkgwN1VXUkE4UUkyeXp3djVnbHl2TkJ5YitTUUx3?=
 =?utf-8?B?ZnVXc05xVlVEa2h0YXFxN2JLZ2RXMDNMZEVJRDNza0FWeTZUQlk5ZmU2OEg4?=
 =?utf-8?B?aVBNTVpta1REQzJjcmVhNkM0eXZVbHdhYS9JQ2xjOTI0Ri84Z3VkQVplT2s4?=
 =?utf-8?B?Q2tmR25QWFdKdGE2bHlwNVBhMVJrbXlZbStNblFqckJZcTRWdUFpbVdGMnVm?=
 =?utf-8?B?cWRwUVVYTFFEUXZtWEp0WnAxWVp5cFJLdGVRWEhuMzBjTWJ6TmZMKy9ubVha?=
 =?utf-8?B?cEVjQ3EzTEN2c2REejgvWkp4cDdoL3RIZUowT1RkTE9VT1FEajJsaFlJTGpR?=
 =?utf-8?B?SW9VS0g2enJDbXZZaWo0M3R5RUZpOC9aTUZyZWYrTDJCRjBmdGFLSk94YTZU?=
 =?utf-8?B?c2srb01FZ2Jzai9YenFoOHRhRSsyUHUyaW5IS0YzMnB4M3JSRGtpdm12ZHN0?=
 =?utf-8?B?d25ydlFlaXpPRzEvK1BnVVBNVWh6dmM5NTRiZ2tSRUI5ZWFVejZIZ1hENDB0?=
 =?utf-8?B?QmlIek9hTERVWHFkYTFwV1dhSzREeXNYVDRFK3liaW1sWTBBbUJxZTNwUXdM?=
 =?utf-8?B?eGZiR0x6dU93Q3Z3S3VkWXE5bUxVcWVFY0d1RndpNk1QRFBuNVlXeWQ4d2RO?=
 =?utf-8?B?bGZneEZ6VHQ2QWp6ZzNJQ0prMVN2blV3OXdTV2pySmZCdnRwejFzeFUzdmZD?=
 =?utf-8?B?Y3BnNEhtRVg4SVNZbG1ORElucFUxZ0hGeWJOVkgwMTZYSkxNbFF2ZnR0Kzh1?=
 =?utf-8?B?T1l1Rzh1NEQwQW9tL1Z3djFKU3N5Kys2aVFqUitIZXh6bTJUUTBXdlZqTFBW?=
 =?utf-8?B?eFdIRUlmdGlydEZuNnQyVnhzWmdhejQvdnFkd0lVcUZBdk9ZRXV5Y0dYcTYw?=
 =?utf-8?B?VzlDT0RvTE1TRGZOQTgvZG1vNElLdFh2OHZicjlKK0dYWHdOU0ViZFZTVFNi?=
 =?utf-8?B?SWIxS3h6L2tMOUxkN3d1ay9WV1lvdEZqZWRLR25Pcjd4UHRjU0RaMjFSWnBY?=
 =?utf-8?B?cTVZaTA1WjV5ajZiV2h1VEI1NEhEN2dsU05FbnJLM0g4Znc2UWVFUmIxdGtj?=
 =?utf-8?B?bVZlaHRPZ3NFdkNpUmswQlFhSlFEOEtOWkhkQ1JOSlNJcVNOYXI4dGo0Mi9i?=
 =?utf-8?B?SHRBN2Q4NzE5bGFjc0hSQTh6Rk9KMCtUWXp4WXdiWCtUTmZ0d0Z0Q3d4bnZO?=
 =?utf-8?B?dXZCemRhTkhheDFhVWo4UWpBY1E2eUZzcWJHTUlsUGU4dnFVRndVdVc5ck5p?=
 =?utf-8?B?TWlwTmNERGlLQkZKOXRNbWJHUE4zVlVqdE1QRGVNS0hsNHYrdUV3WFRuRmdw?=
 =?utf-8?B?U0NjUnhCZlhhaUN6dk1Jd2ZKRkpHNVU1Zmt5UjJKbHRnRndYUmd2ZlFlV3lM?=
 =?utf-8?B?U0lEV0d0TzVRbnJHdnNQdW1SRDNodVI0d2FTQzZBUmlZcllZRU1yc09KT3hB?=
 =?utf-8?B?dFpFZ1BSY0kvZGVabnZRNlNlQUhQOFBYU3V2OE9qQVAxV3BqQ0paaXljTEhV?=
 =?utf-8?B?M0ZGWitxNGs2amR4N2RFcUc0RHA3a3MzRVM4OER5b0tRMUVwWkovY000V1RX?=
 =?utf-8?B?SzRwSVBVQXQvbCtkb2dpSGsraXFPMTVzOFNnS0VwVXNaK1BpZEcwZ294Y1BT?=
 =?utf-8?B?TGRMS0xIM3dzQXk1TWhtNlV3UTVzU3RDYzV3TEIwQ3B0WlprREhDRUpjYUtE?=
 =?utf-8?B?NEtIcHlkeVZweDgzN25ENTNZV2dibFRlcURGcmUyQTMvcE1xZVRGV1VrRnll?=
 =?utf-8?B?ZnBrZ1pxazN5QlFXREtOYSt4Y0JyZW1aVi9PYU5RYU90Uy9BSGVnNnFNdXE3?=
 =?utf-8?B?eUdzc0NyamxFN0VnODdjQ0ZUMzBxYlBrVWJBYnhzMDZpV0dtbWRmUzB1Unc2?=
 =?utf-8?B?OHcvVXp2ZTRkZGNrK2RWOG9UbGxEcjdUaGRkSDdKSmJ6Y2xYUmozcVlIMmQ3?=
 =?utf-8?Q?oZPbBH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 18:53:37.4372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3c8b5bc-b899-4955-a012-08dddc2d0b2e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF0FD1DEA27

On 8/14/25 12:03, Roger Pau Monne wrote:
> The logic in map_range() will bubble up failures to the upper layer, which
> will result in any remaining regions being skip, and for the non-hardware
> domain case the owner domain of the device would be destroyed.  However for
> the hardware domain the intent is to continue execution, hopping the
> failure to modify the p2m could be worked around by the hardware domain.
> 
> To accomplish that in a better way, ignore failures and skip the range in
> that case, possibly continuing to map further ranges.
> 
> Since the error path in vpci_process_pending() should only be used by domUs
> now, and it will unconditionally end up calling domain_crash(), simplify
> it: there's no need to cleanup if the domain will be destroyed.
> 
> No functional change for domUs intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/drivers/vpci/header.c | 51 +++++++++++++++++++++------------------
>  1 file changed, 28 insertions(+), 23 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index b9756b364300..1035dcca242d 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -64,7 +64,8 @@ static int cf_check map_range(
>              printk(XENLOG_G_WARNING
>                     "%pd denied access to MMIO range [%#lx, %#lx]\n",
>                     map->d, map_mfn, m_end);
> -            return -EPERM;
> +            rc = -EPERM;
> +            goto done;
>          }
>  
>          rc = xsm_iomem_mapping(XSM_HOOK, map->d, map_mfn, m_end, map->map);
> @@ -73,7 +74,7 @@ static int cf_check map_range(
>              printk(XENLOG_G_WARNING
>                     "%pd XSM denied access to MMIO range [%#lx, %#lx]: %d\n",
>                     map->d, map_mfn, m_end, rc);
> -            return rc;
> +            goto done;
>          }
>  
>          /*
> @@ -87,17 +88,27 @@ static int cf_check map_range(
>  
>          rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, _mfn(map_mfn))
>                        : unmap_mmio_regions(map->d, _gfn(s), size, _mfn(map_mfn));
> -        if ( rc == 0 )
> -        {
> -            *c += size;
> -            break;
> -        }
>          if ( rc < 0 )
>          {
>              printk(XENLOG_G_WARNING
>                     "Failed to %smap [%lx %lx] -> [%lx %lx] for %pd: %d\n",
>                     map->map ? "" : "un", s, e, map_mfn,
>                     map_mfn + size, map->d, rc);
> +            goto done;
> +        }
> +        if ( rc == 0 )
> +        {
> + done:
> +            if ( is_hardware_domain(map->d) )
> +            {
> +                /*
> +                 * Ignore failures for the hardware domain and skip the range.
> +                 * Do it as a best effort workaround to attempt to get the
> +                 * hardware domain to boot.
> +                 */
> +                rc = 0;

If we return success and size is zero, we will potentially attempt to map/unmap
the same region again in an infinite loop. rangeset_consume_ranges would invoke
map_range again directly without returning to vpci_process_pending.

> +                *c += size;

This line is now only executed for hwdom, but ...

> +            }

... it should go outside of the hwdom check because domUs still need it.

>              break;
>          }
>          ASSERT(rc < size);
> @@ -213,28 +224,22 @@ bool vpci_process_pending(struct vcpu *v)
>              return true;
>          }
>  
> -        if ( rc )
> +        if ( rc && !is_hardware_domain(v->domain) )
>          {
> -            spin_lock(&pdev->vpci->lock);
> -            /* Disable memory decoding unconditionally on failure. */
> -            modify_decoding(pdev, v->vpci.cmd & ~PCI_COMMAND_MEMORY,
> -                            false);

This path could be taken for either map or unmap. Do we still want to disable
memory decoding in case of unmap?

> -            spin_unlock(&pdev->vpci->lock);
> -
> -            /* Clean all the rangesets */
> -            for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> -                if ( !rangeset_is_empty(header->bars[i].mem) )
> -                     rangeset_purge(header->bars[i].mem);
> -
> -            v->vpci.pdev = NULL;
> -
>              read_unlock(&v->domain->pci_lock);
>  
> -            if ( !is_hardware_domain(v->domain) )
> -                domain_crash(v->domain);
> +            domain_crash(v->domain);
>  
>              return false;
>          }
> +        ASSERT(!rc);
> +        /*
> +         * Purge rangeset to deal with the hardware domain having triggered an
> +         * error.  It shouldn't be possible, as map_range() will always shallow
> +         * errors for hardware domain owned devices, and
> +         * rangeset_consume_ranges() itself doesn't generate any errors.
> +         */
> +        rangeset_purge(bar->mem);

Reiterating what was mentioned above: if map_range returned 0 without
incrementing *c, we won't make it back here.

>      }
>      v->vpci.pdev = NULL;
>  


