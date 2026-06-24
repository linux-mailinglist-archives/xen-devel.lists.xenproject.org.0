Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gcD+LC6BO2rMYwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 09:03:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C6E6BBFEA
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 09:03:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=hgZD6e2z;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1344581.1603640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcHdK-0001aC-0e; Wed, 24 Jun 2026 07:02:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344581.1603640; Wed, 24 Jun 2026 07:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcHdJ-0001XO-TD; Wed, 24 Jun 2026 07:02:49 +0000
Received: by outflank-mailman (input) for mailman id 1344581;
 Wed, 24 Jun 2026 07:02:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wcHdI-0001XI-5z
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 07:02:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcHdG-003iqa-RZ
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 09:02:46 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a3b8116-e002-0a2a0a5209dd-0a2a4508a610-0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 09:02:46 +0200
Received: from [52.101.52.15]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a3b8115-9ee7-0a2a45080019-3465340f7773-4
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 09:02:46 +0200
Received: from BY5PR03CA0003.namprd03.prod.outlook.com (2603:10b6:a03:1e0::13)
 by DS2PR12MB9640.namprd12.prod.outlook.com (2603:10b6:8:27d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 07:02:41 +0000
Received: from CO1PEPF00012E83.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::15) by BY5PR03CA0003.outlook.office365.com
 (2603:10b6:a03:1e0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.12 via Frontend Transport; Wed,
 24 Jun 2026 07:02:40 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E83.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 07:02:40 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 24 Jun
 2026 02:02:36 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 24 Jun
 2026 02:02:11 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 24 Jun 2026 02:02:09 -0500
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gIhp8yO9efeAKycfEUnyYaQfAmFEX1N17cjJeU2BMs9T0rHgoDKLNMBHWPiodtSJGtGyRZL2SPC4/O4s7X8UGKY9pLP9byNrkuP0khDfFzHw9c6IX1FoQkv+BIRS/jndot/0WJAIsBbOt2kpBKuaNjInsQvMPh/Ha116EK01Pavbuf8CPQ0zwHuqk8FDEGPlsjUvN+dBlz7fONQVHu+bZdgC8xZkSauXLvY3MDN05eiLKjapHwYDiKvgbhU+OBUGUm/u1sU5zJc2xmYLmc5sQFt7O0LRvQs7hhriVPDX93aFy+nSbe6jZ7qCy3ggxoHZnF7JBtrpLaCF2rgwHx9Z+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCt6VIxT4S2TXc0yorHlu1JSvwjmk9ntmAy75ZbcGSA=;
 b=SGe2/LCzqz+DIORMzJIconBCU5GYSEgrZHkuVFb+aOgAQrkSVQRYI79PybevgxgGwVQDIdWRFQ9HPOHYVwr3CJsmxoCn63KY2TfAEoDfk+lMxrbI5mDVsP6xeHz0f7NQy44/8ydvfdqZm+vzbBWbbu9ckV0bRWfIOgg4sg5RFn4kKddwBHpG44pJmwPUelaG0j0x64YrEu2Tt8wDx8Hw1RebsGnocEMKZQj+zJ6FbFfu/a24ThReF8ZIQi3QXgFuV/sA7zxsFZS9gDbfYOHviPYtNuRxcmZiKwGzGoP3P/teq2kIXhCDTLBOukbqwfTWmqnBN0zHFn8HkivypRDbFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCt6VIxT4S2TXc0yorHlu1JSvwjmk9ntmAy75ZbcGSA=;
 b=hgZD6e2zsgmjhVdgtSCmNcXzNqTM0hv9mSqXygj8czNwfPiFu+knLYq35NbluQs0cXxx2JVZ+tCrGuvPCwsMUWY+nMDqNk/N3yvdw78aeVfDpZjeqx9gCOLNChCKe+KOaTBph765Y7aRvVxeSaGZVB2QJyZ7GaKhz1fLSP2CWd8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <b91ad9b2-b91d-4649-872e-0ba24692f19d@amd.com>
Date: Wed, 24 Jun 2026 09:02:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/23] xen: arm: move declaration of
 map_device_irqs_to_domain() to common header
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Romain Caritey <Romain.Caritey@microchip.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <7bbb4d94f6711014f46becfabeb916ceed294833.1781693963.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <7bbb4d94f6711014f46becfabeb916ceed294833.1781693963.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E83:EE_|DS2PR12MB9640:EE_
X-MS-Office365-Filtering-Correlation-Id: 4399ba22-16fd-47e0-e810-08ded1be94fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|7416014|376014|6133799003|22082099003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	INgowDvwVIEbGAuPAQneYMGbZUER9vn8vR3vrVmgZEnXcUXpKHyPaOLGHyH9f/bDmdo+QbrID3rFTC35D/paS9sPEafw/1gdSW5sDTEEi7nNi8DBs6KESkjx/K+jibm/iY4BW4wLCjpOCPZY2AuotAMqHh5d4UG2NWSRDxS/z4aIkUKaqoaptKpqb2/qm40ex4a4qlytUTW6mnz6J8fdlBw4PKlbkPTeSvR78Mrl0ooXSpAR5Gd3QwbSc/RBaCkV8iOPvoGcX4AMMya4U4sGUfwwjnbwznN7yQHJV8qul/4mRDbIhhSqSdEzOqxmfNQ91yj200mfWyhL0k3cIpZ/brgKM1+0tvZ88rbM2EGuUuoUvJU83B7YmCDrIxJRGd4NMD/flWwobpy3fMsRRREZus7XFcIpVOCd8Oa3L9nApq7l5lM1rTrHrFZdmbcE0mKTQJXX/ODgbZZ7zqFaQfsW1aD31lHAsGZcQrHlIF3GRTkaeEB27X7d0kq1wbx6TtbT0qYdWVSldlWCkfBAjfgaIQHAD9uG1D3vUQofra0FMgFuBFTh16NJi+woBjSvnH8Lg08XL0NIEfudxJ4Fv0X3nwXF4Mn1yWggESgNgh1bMVQkaYfD5ykg/3dpX5nt2DJikqeK1JycTgD3259pFXwSCuOhoY0tQhY7IFX69Bt6hnTkyBJMVkAMW40Zbo67ZE+itiF2waVtgPbs5WLLwXpGlA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(7416014)(376014)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dunIrJWmV9RB+KHWuxxsLszWlbS27cSgE/Ht5S6712mF9L21K9HuKqp1Q+eRlMnIJvD/JYCZLZbF2JKZlc+DYEUyxhTwXXrIAANI/UAzt712tH4XxArAHpdB6z62tUay6+TZqrnQtyiwAsC6WgjLQnb2OW5JS8eK6XSeFvK2M7V4TqFnNjwOrfwfbFCA+8BD8nVRSKf48z8RGwAm0iV3A2zPD6ZNwamk0h/Finw0pehHeTjNeuAl/HXnW5bGwrIS4h5Jo/9Gpc9s5Cu8YBrl7tkImTx4+vbtZTXmqFJUofYuHcdCYs6eGJ5Gs1lgEM+Z7b9VBi8+uoI6HQ630yrDunaELI/GLN8Tk70rCVA04ZMwIzBK0oKduM/HzQnw5DXxnXyd65WPHKyvWllVOxcJpSudhfWFDs3hAe4Ln2gkhMV742tmB7waef6f1fmvaZQm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 07:02:40.5952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4399ba22-16fd-47e0-e810-08ded1be94fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E83.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9640
X-purgate-ID: tlsNG-c1860d/1782284566-779E20FA-9DB4A790/10/73395122804
X-purgate-type: spam
X-purgate-size: 2928
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,amd.com:dkim,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D3C6E6BBFEA



On 17-Jun-26 13:17, Oleksii Kurochko wrote:
> As map_device_irqs_to_domain() is used unconditionally by common part of
> dom0less code it is moved to common header.
`it` here reads as if you were moving the function, not the prototype. Also, use
imperative mood i.e. `... code, move the prototype to a common header`.

> 
> fdt-domain-build.h is chosen as map_device_irqs_to_domain() could be
> also called indirectly in Arm's DOM0-related code.
By `indirectly` do you mean `handle_device`? It can also be used in the same way
by DT overlay feature.

> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v3:
>  - Add tag arm and move this patch earlier before RISC-V-related patches.
> ---
> Changes in v2:
>  - New patch.
> ---
>  xen/arch/arm/include/asm/setup.h   |  3 ---
>  xen/include/xen/fdt-domain-build.h | 13 +++++++++++++
>  2 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 0d29b46ea52b..0adfa4993a8f 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -53,9 +53,6 @@ void init_traps(void);
>  int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
>                    struct rangeset *iomem_ranges, struct rangeset *irq_ranges);
>  
> -int map_device_irqs_to_domain(struct domain *d, struct dt_device_node *dev,
> -                              bool need_mapping, struct rangeset *irq_ranges);
> -
>  int map_irq_to_domain(struct domain *d, unsigned int irq,
>                        bool need_mapping, const char *devname);
>  
> diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
> index 671486c1c837..8612e98dfda5 100644
> --- a/xen/include/xen/fdt-domain-build.h
> +++ b/xen/include/xen/fdt-domain-build.h
I don't see fdt-domain-build.h being included in Arm's device.c, where the
definition (that needs to see the prototype) resides.

> @@ -12,6 +12,7 @@
>  
>  struct domain;
>  struct page_info;
> +struct rangeset;
>  struct membanks;
>  
>  typedef bool (*alloc_domheap_mem_cb)(struct domain *d, struct page_info *pg,
> @@ -79,6 +80,18 @@ static inline void set_domain_type(struct domain *d, const struct kernel_info *k
>  #endif
>  }
>  
> +/*
> + * Retrieves the interrupts configuration from a device tree node and maps
> + * those interrupts to the target domain.
> + *
> + * Returns:
> + *   < 0 error
> + *   0   success
> + */
By adding the description to a prototype, there's no need for it to also exist
at the definition.
> +int map_device_irqs_to_domain(struct domain *d, struct dt_device_node *dev,
> +                              bool need_mapping,
> +                              struct rangeset *irq_ranges);
> +
>  #endif /* __XEN_FDT_DOMAIN_BUILD_H__ */
>  
>  /*

~Michal



