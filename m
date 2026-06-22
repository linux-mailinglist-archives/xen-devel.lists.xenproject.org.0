Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VGvtHeGAOWo0ugcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 20:37:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF196B1CF8
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 20:37:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="hyBKX/1l";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1344056.1603227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbjVJ-0005He-5X; Mon, 22 Jun 2026 18:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344056.1603227; Mon, 22 Jun 2026 18:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbjVJ-0005Fd-27; Mon, 22 Jun 2026 18:36:17 +0000
Received: by outflank-mailman (input) for mailman id 1344056;
 Mon, 22 Jun 2026 18:36:16 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wbjVI-0005FX-2j
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 18:36:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbjVG-00EUBj-MS
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 20:36:14 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a398087-2eae-0a2a0a5409dd-0a2a45018446-18
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 20:36:14 +0200
Received: from [40.107.201.63]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a39809c-e031-0a2a45010019-286bc93f2910-4
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 20:36:13 +0200
Received: from CH0PR04CA0093.namprd04.prod.outlook.com (2603:10b6:610:75::8)
 by PH8PR12MB8431.namprd12.prod.outlook.com (2603:10b6:510:25a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 22 Jun
 2026 18:36:05 +0000
Received: from DM2PEPF00003FC8.namprd04.prod.outlook.com
 (2603:10b6:610:75:cafe::46) by CH0PR04CA0093.outlook.office365.com
 (2603:10b6:610:75::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Mon,
 22 Jun 2026 18:36:05 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM2PEPF00003FC8.mail.protection.outlook.com (10.167.23.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 18:36:04 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 22 Jun
 2026 13:36:04 -0500
Received: from [172.21.102.169] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 22 Jun 2026 13:36:03 -0500
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
 b=Mmfqm9/4XMVBx1qM8lpI2/9Y0lv73XygAoW1hiBaqtODivsgKSwjHjwUKdrfL+5yiiOXrptQdvgbqoMMrSj7wZET2pTk5beFNBlVYiIZX7EcNq2Y5Nsvk+z+qL45LbELO6tdYOzznNbMX6990wS23hnx11tQLX/0HfVU8qXDW3Jhtx7di/ciFIy7Zrn8aFqoUMwo7dIYe1J8EezLj2BGTAYzC2k1bhC+uEDf6TR63RBwdoCbIgaT//8Uav13C+bmspiVzdDxBI7U8g+UonZXpw65ec6oRqnA4CULDY95HIAmwWey4Cmp05ZBL+eYwx83CT307L3zQE9H7WSvSQB0Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRJ67r+uKd8g3cHtLnTWI90pwQLWaq2FeZm/u4AFxts=;
 b=qhPCzgSh74JigZIoiXm+6CnVQUDBpeUCz7h22g90XAZ1e8Y9k4254UtWhdIXZhovQiVjKf8aIyWxwMVqyNPnULbgrAouF+pXazQ7CxB3+o3JFCuvIe8vw3TdAVKOUuiAELpQcAdQNAJe0cRSig94WFUVBGnv+m4yiCoHdCApaRk5HBUgJcEU1YZR8fK2TKXLdoCsAcTXbCUL5sTBC1UKMymLHztK3oxhSGlNj6EhnvfEyM4VuUjwUYi9A9fkm0k/Q2tSUlE4NEpobj5eXcnY5V4qNbNwvTODMhowFLo7pmlPic9mdriaOlIaWee4sIY1eJBBK5kj8z7Nl8fZEBPnCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRJ67r+uKd8g3cHtLnTWI90pwQLWaq2FeZm/u4AFxts=;
 b=hyBKX/1l+jyynxj9jokIns9SCUf8c8zLrF0iO2iTmhGmd68Cs1jlpgCV8F7B9sOd9SDXcfmwRGH3oHV3w6xQ2pqc41WhvoH493IYKjT3h7IPs4UR4hNX01p/XnPBpyDWpGr2sV15rJdLL0fqci6lWabDRjUimMEqfX4E0BPYhFA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <33b832ed-95a6-4f7b-8bc0-12c72b9095c0@amd.com>
Date: Mon, 22 Jun 2026 14:36:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/15] pci: Parse into pci_sbdf_t directly
To: Teddy Astie <teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <cover.1781790171.git.teddy.astie@vates.tech>
 <1781794553.8631fc262581453bbf619ec5b2062170.19edb3b3cc5000701b@vates.tech>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <1781794553.8631fc262581453bbf619ec5b2062170.19edb3b3cc5000701b@vates.tech>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC8:EE_|PH8PR12MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: 621f99f2-00a1-4688-6b80-08ded08d1e17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|56012099006|18002099003|22082099003|4143699003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	3/Ud8h4wVuKayPAuOEUjvHoOUxaYkCUkeqXMyz4ax4/Ij4pcNJRToh62hkUeB8/ORKyPMV/5VsoCPpmDp5LJw/fiThpVUQGPy4vhwiOZNlQM65XDvqAxrFNv3MgiEWd5qv2GzSY+fFuWKk16XBeAtb7y2X3jLzJf1xH5PwIi5okolrR0TaXKij4mrVvReKyvbgj/thBg33xmXjPdLEupwWIRWuiIddIjTn3vWeftHyTPp6FFp2wG/Za2ycE0ACd2Q/NTRQsrmnjKYTs5qI1fq63bz9f1502RNHq7oQHqFK+VgyK3NOk71Wtvm6OA3iIdgK7gpwXiFayNIh8z1KKNfKcZ6BL5wHqw9a6UxY9jBiKNtHSQoYo6OVnegqlBtOEWvjphA6oHu/WpQ/tY8tCwP7UAfaGothSDCSAayyHQM4dLQ5s4P7XSFbDL3dx2upigRnc9ON8TEJFq7qMc1qMdVtmnK/BvIPoz5IGVAq2/IEPPLDTmmZ+6Yf5OJyPH8C82ewUfHeWDjW4NQdAMtwS1GoPNdk67A2/Fnm3L5tbzKc3BpxYQjA7gcV4QEEyVfG5kQHw6GHGhVwa7huk6nVqblXjx0B5njUwgKjxYlSU77ECY7YZldQvdE78yDYLfeWgEGRlfi+SYlDzfbopliE11+o5HFwEsoAgLqbt1MeEvQCuS7wBoqnUcw+sQu1CxmQmruunsAMjljtxl0+u5F0AfaQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(56012099006)(18002099003)(22082099003)(4143699003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5ZfEtqfGvldcudwWsteRuJ6tcJEk1b81BplX8+w5CtNMGoOdABzRSkIMdsOogDPLGjG4rgqHnqFccJv8h3IKrAfBrsq09n/o5wyYAmpumbrRdznkC1Q43J4JhXwpXaARofpLIwxYzU/Fy/TPo3jbqXBornYNN5ghVgTO+/oOY3AbhfkENht0bBTiv0ZnfP7SVH708JdBvJ6Q/lwUgWZN3BeTWVwZ0ptpS3p8vNpjCjdxqgmiG4zd1Oa3QSsGv7Zhw9Mk1YVzXvzr4vZuzHaWOfsKC0UGhGN6M5kVd2I8FG7istPM/sWkBQpjcwmWka2QeMWZTF7RKLQgvI1qnpNbKGFayD1vZTz83MaxdGdlIwz1FBI0gg0tYnNKOl29T0UDr/rndO7qiljpCJZSU/4N0MPigLLnXsMzaNw42BKomzatorpueKH8J96HKgBk3YYM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 18:36:04.6194
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 621f99f2-00a1-4688-6b80-08ded08d1e17
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8431
X-purgate-ID: tlsNG-d62444/1782153374-CE5AFE30-EFCDA3A2/0/0
X-purgate-type: clean
X-purgate-size: 2873
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
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
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,amd.com:from_mime,vates.tech:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BFF196B1CF8

On 2026-06-18 10:50, Teddy Astie wrote:
> Use the newly introduced parse_pci_sbdf() and parse_pci_sbdf_seg() in order
> to parse into a pci_sbdf_t directly instead of reconstructing it afterward.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
>   xen/drivers/char/ns16550.c               | 24 +++++++++++-----------
>   xen/drivers/char/xhci-dbc.c              |  6 +++---
>   xen/drivers/passthrough/amd/iommu_acpi.c | 26 ++++++++++++------------
>   xen/drivers/passthrough/vtd/dmar.c       |  7 +++----
>   4 files changed, 31 insertions(+), 32 deletions(-)
> 
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index 878da27f2e..fa2d0e5991 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -1572,22 +1572,22 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
>   #ifdef CONFIG_HAS_PCI
>       if ( *conf == ',' && *++conf != ',' )
>       {
> -        unsigned int b, d, f;
> +        pci_sbdf_t sbdf;
>   
> -        conf = parse_pci(conf, NULL, &b, &d, &f);
> +        conf = parse_pci_sbdf(conf, &sbdf);
>           if ( !conf )
>               PARSE_ERR_RET("Bad port PCI coordinates");
> -        uart->pci_device = PCI_SBDF(0, b, d, f);
> +        uart->pci_device = sbdf;

You could parse directly into uart->pci_device (for example)

     conf = parse_pci_sbdf(conf, &uart->pci_device);

and that would eliminate a lot of the temporary sbdf variables.  But to 
do that, you'd want to change parse_pci_sbdf() to only write the sbdf if 
returning non-NULL.  Not strictly necessary, but it seems safer that way.

>           uart->ps_bdf_enable = true;
>       }
>   
>       if ( *conf == ',' && *++conf != ',' )
>       {
> -        unsigned int b, d, f;
> +        pci_sbdf_t sbdf;
>   
> -        if ( !parse_pci(conf, NULL, &b, &d, &f) )
> +        if ( !parse_pci_sbdf(conf, &sbdf) )
>               PARSE_ERR_RET("Bad bridge PCI coordinates");
> -        uart->pci_bridge = PCI_SBDF(0, b, d, f);
> +        uart->pci_bridge = sbdf;
>           uart->pb_bdf_enable = true;
>       }
>   #endif

> diff --git a/xen/drivers/passthrough/vtd/dmar.c b/xen/drivers/passthrough/vtd/dmar.c
> index 61269c7e0d..2dd362410e 100644
> --- a/xen/drivers/passthrough/vtd/dmar.c
> +++ b/xen/drivers/passthrough/vtd/dmar.c
> @@ -1216,7 +1216,7 @@ static int __init cf_check parse_rmrr_param(const char *str)
>           do {
>               bool def_seg = false;
>   
> -            stmp = parse_pci_seg(s + 1, &seg, &bus, &dev, &func, &def_seg);
> +            stmp = parse_pci_sbdf_seg(s + 1, &sbdf, &def_seg);

Andrew already pointed out that sbdf is introduced in patch 3 when it 
should be introduced in this patch.

Regards,
Jason

>               if ( !stmp )
>                   return -EINVAL;
>   

