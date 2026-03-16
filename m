Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGttIZ1wuGn5dgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 22:05:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D9D2A084B
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 22:05:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1255795.1550619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2F7S-0002qd-IB; Mon, 16 Mar 2026 21:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1255795.1550619; Mon, 16 Mar 2026 21:04:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2F7S-0002np-Es; Mon, 16 Mar 2026 21:04:58 +0000
Received: by outflank-mailman (input) for mailman id 1255795;
 Mon, 16 Mar 2026 21:04:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wxl=BQ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1w2F7Q-0002nh-Q5
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2026 21:04:56 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c78e4243-217b-11f1-b164-2bf370ae4941;
 Mon, 16 Mar 2026 22:04:55 +0100 (CET)
Received: from BN0PR04CA0096.namprd04.prod.outlook.com (2603:10b6:408:ec::11)
 by DS5PPF23E22D637.namprd12.prod.outlook.com (2603:10b6:f:fc00::647)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.14; Mon, 16 Mar
 2026 21:04:44 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:408:ec:cafe::2e) by BN0PR04CA0096.outlook.office365.com
 (2603:10b6:408:ec::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Mon,
 16 Mar 2026 21:04:36 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 21:04:44 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Mar
 2026 16:04:44 -0500
Received: from [172.24.66.250] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 16 Mar 2026 16:04:43 -0500
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
X-Inumbo-ID: c78e4243-217b-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sEAOf0A12cqQ6a2hOnxbEkQqalRX0qWZSb9+rdH7RVqqDNMp3lfCM6qVuiiGCHnBkjS0ZU6oOGzQO+Fd434PIuce/dgQxgFJ0PvLGZc2eWRpXVOSRZojvyQxa4KDotiJPWoiI5kF17JkY64qNk0qqLH9vclS5jSCKvRa5WIo0huhcHfFXZ95FJJS1gmd7MzOcc4W/nPQS7R48F18594Mf5S3tYMiQQel4wBpGJHngKayChl7BCOn3N8xa1SIkV4wQ8hv8GDPb4CelKyQBBG0Y05LCEMK43UsLuU6vNHN0QRkU7x0jihQfSe1pFoeLexVf6wf2LNxpnxVXr6XdfM6ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGh0AX302Hg/MgMyDPISw9Gh+5rLTH/67c0brE04ato=;
 b=k1xwtCuk5iU0HMHj0fMmDOddmIjmc1WWkqS4nrIqa19VVFREANb0UDlfBAUx6twANC3WjN02GB46GcLtpBD9Rlt64sZd9CN98/LbOI9LAoNjh5+XUGCKj5oOXZXTytoSUskodKPlgV600L/o4u6c1sy+TtBwBFlc8nF1iTds7ApqZTYYmL6s2RUNIsqU5HOP2xtsSCl46OAnh4U5tToxEQkDAPDwhalZpYagtGvvO2WKeUBfFyV/ZIFLG/nkBEe/3nvrQuxeYza6mm2Lv/UZsIaWYg52u14dgJcHHH+NxNJz1V9sZnloqX1WtVgtNOY3Z8dHNJPWjtu813JwUz24Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGh0AX302Hg/MgMyDPISw9Gh+5rLTH/67c0brE04ato=;
 b=NY1FPu6sTLFX44CHoonTl0eM+kDA+J0Y7BVNNd454I68nOTDqLbk25gvZER2rUzEYSechkRDurt7qHRGAPNhm3Wl6jsBjNCFVKVgttcdLuO0CHL8hNKQ4A5sTFixqR84bmSTKN0fLm5ErtYITptVtly/JlfdLabZf2swD9PxvG4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <a989079d-bf59-4e25-986b-b3a60f8e1d1a@amd.com>
Date: Mon, 16 Mar 2026 17:04:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] vpci: rename and export
 vpci_guest_mem_bar_{read,write}
To: Mykyta Poturai <Mykyta_Poturai@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>
References: <cover.1772806036.git.mykyta_poturai@epam.com>
 <5f364e8fddc83b9a7ae08945a91c38ae1648442a.1772806036.git.mykyta_poturai@epam.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <5f364e8fddc83b9a7ae08945a91c38ae1648442a.1772806036.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|DS5PPF23E22D637:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c71c691-81db-4d43-c9aa-08de839fa643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nlwh/9XDTxbm+F0iCs34WnmqCWHoYPbWyuQ4UQqlDhOpKGg9RsKtgBdoGAEOC6iNGCsL8ogOjIcFGKWYzVsvjkMOTXPQC94+0hwV+GrHeaVa6n7+/Rf8l2A/BJN7DNvv2Y5t0yHDllcJW7jNw8+Xm0mojVPMCysxAQbgcD9vapNC5jz8QH5yYnNiy7fg+zAGYXcaedV735bluIlYItyTNPqJpxQ+7PqGV/LcFYucaKPFr2OMR6aZ4gTho4+jqsJ1Obazs6PvdOyZxpVDViOBRGyotZgJtlRjBDXiidjY4OcjmkPljeIv+zyRNwh4RwPSRkoGZAv2G0pU1k4g9hPg6rsEN7ezHUeQcXrwUUnlgyA9YQmM/bmjJya3FzOhXTQdh+OlmRveJ+cqnD7WEITMzjdhKdUmOyImCI4fJ4dxa3tqmmc3HoxBzfz69wTNsST+/EJYeUiQNj1ioqfHPpZWuBWm9rZKtwuz4gWC0/+bEzJ4Mm5Yb59Ir+PDAzDZdcaVnF9YAtjl9ObRpox/aMoOXQzI9NtDAxlL6JCV9adwO4waeNJW5jAWrvqZTQrPKhLSo0FtxAuUk8TfkU9RDFOnM5cy2jULWGUtiFV/lU4cCNlAF2/CUGpgnZl7RjZteMjr4nU37bKKcDlevVVqjmod3l7fjvQI4J+A06OMvlOcW4H3eB+IKPrkvszM4oZEzGCq3gH+maXEbLzXL/WvlPFY/TEBYOkwm0RNQqEXF2hrUEBYGlse81D/DbWROTvmje5MyifOZIhwYXQ66+6+HAUfCw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BXp7ZOYENyGXligJ1DyiAhJomgrHYMTNOXQ8guYmYiZyQwOQ/dHuVG4fk30vpzmkwnX6MTzp+QCrbAeH99+eUSnFeQ/Fb4eia7yGPKk+js3vX132PQJ7o7dvA0Ef3DrPLWDb/FTbFsrgvgshWeLJ0KvzJhyZWzFaEJESeCdPW1p7PFNjO8JOFoCy7z+mvNWiMIdXXWEwKP1M4L2jM3LJkvhRNzLWvVrt3E7b5yaDgKT1ipY4AVF7RqyPkoXQm9f04WV2XCDV9W0m5riCyna+FPRD557vJcj848ASS4Or7KPvMns1JRVn4rkwzFbxVVdJq3aXGJ5C/QA9lqcJblwgQmskJlWjaA2yzes+6+fi0EJJia56R1kORC92XfeYGwX1jGbisFsuJy8D0pQT100qSZSHU4FRvXd5VhsSA8pbkNNrDa8stKHdT2eeRMgykJ4a
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 21:04:44.5261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c71c691-81db-4d43-c9aa-08de839fa643
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF23E22D637
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: F0D9D2A084B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/9/26 07:08, Mykyta Poturai wrote:
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index a98ddbb32e..dd233b8b03 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -78,6 +78,12 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>  uint32_t cf_check vpci_read_val(
>      const struct pci_dev *pdev, unsigned int reg, void *data);
>  
> +void cf_check vpci_guest_mem_bar_write(const struct pci_dev *pdev,
> +                                       unsigned int reg, uint32_t val,
> +                                       void *data);
> +uint32_t cf_check vpci_guest_mem_bar_read(const struct pci_dev *pdev,
> +                                          unsigned int reg, void *data);
> +

These prototypes should be moved to private.h

>  /* Passthrough handlers. */
>  uint32_t cf_check vpci_hw_read8(
>      const struct pci_dev *pdev, unsigned int reg, void *data);


