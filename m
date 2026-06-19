Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n8XGETfdNGpSiwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 08:09:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB516A40AD
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 08:09:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="VWxer//n";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341685.1601948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waSQ2-000318-FU; Fri, 19 Jun 2026 06:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341685.1601948; Fri, 19 Jun 2026 06:09:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waSQ2-0002zA-CN; Fri, 19 Jun 2026 06:09:34 +0000
Received: by outflank-mailman (input) for mailman id 1341685;
 Fri, 19 Jun 2026 06:09:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1waSQ0-0002z4-C2
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 06:09:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waSPz-00BKB3-0c
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 08:09:31 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a34dd0b-2eae-0a2a0a5409dd-0a2a4502b268-28
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 08:09:30 +0200
Received: from [40.93.201.5]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a34dd13-fdf1-0a2a45020019-285dc905c8a3-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 08:09:25 +0200
Received: from SN7PR04CA0021.namprd04.prod.outlook.com (2603:10b6:806:f2::26)
 by CY5PR12MB6646.namprd12.prod.outlook.com (2603:10b6:930:41::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 06:09:16 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2603:10b6:806:f2:cafe::27) by SN7PR04CA0021.outlook.office365.com
 (2603:10b6:806:f2::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.13 via Frontend Transport; Fri,
 19 Jun 2026 06:09:16 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Fri, 19 Jun 2026 06:09:15 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 19 Jun
 2026 01:09:15 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 19 Jun
 2026 01:09:15 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 19 Jun 2026 01:09:13 -0500
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
 b=tG7SqUDJQlQh3R1v1vBC3LQbndB8NFDNWDkJwC5v94WoeKGCR4sym6++z4mdPD9o/XA7wHBl4Xw+KUyGy6JtNQLIC2BRe879ZVl7tqJ3sM67wU4BkCXNUW7IFsMqFY2K4+C1bv8AbiPC1O/1RoOJGPHOsQ7n2OMgGVK3nUszk0wB6RzYKKDIEwyXBp49S1XtTjzEE6IDRqbua45O/wuG4EPuuTrFQmObFhDTA0sKEFTjPYk7K578eVrtRKNsgeYqDtB1CAYZAcSHNTxmKmtMYROv+dW+opbFSG+GJ30+axmGUyBQ6WFV8SeMkJtFkASC2DSKAKv0yhb+QaiUPU9y1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Woyuh5skBkAG4+lxLY5ewg4jVeiU4PUKSuZlis341MM=;
 b=njO0pzeNb4AsBJVqX83xmjg29zJ45nfcN/Cm8go2nOD/J+EF0cPgUwA/CrLskTZ/vvhHhFYBiw64eLT5Aon4TWGQtHWI0QGxgJzxvAQUtbDwoigOiwA8AhRI73BlflxhzAFaIazfJXCQjS5eq+ChBsWjDyWtFyYiqQB5ZXnrVpnqeBhsdANtZm3ytYkwzjEujha58XGkJgxgbnL3lpsvdv7+hg6CX/osawKSlrkVxOBuHFiFcoNQZQopHv6bYeB5VLjfvM5iMQQV8MIe5oqajAV2v7e5LTpJWpyn3ZWah5p4+FG64OV7FKrRoN6VUrmYj61JLEyIlITIRd8ATiCQ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Woyuh5skBkAG4+lxLY5ewg4jVeiU4PUKSuZlis341MM=;
 b=VWxer//nzlE2fiDtg3Jv1U/Oi9/JX9YAyIF7VrSerD+Y37opJHHr7YwwpvRUCeL0LJ/lg+ztYYoFMoWOFaTK0zWFSmDv85/dcafln/QphZAEVjROb9Y4nE4B+wV/pIGthBFI7HRiocTfx1V5IVtDSeHY5BJTq7/H5zxr4JuNrrU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <7a0a1867-8316-4e20-971e-fab99c9f4a32@amd.com>
Date: Fri, 19 Jun 2026 08:09:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2.5] xen/arm: gic: defer host LPI allocation
 until after ITS init
To: Mykola Kvach <mykola_kvach@epam.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Luca Fancellu <luca.fancellu@arm.com>, "Mykola
 Kvach" <xakep.amatop@gmail.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
References: <112419d3ea48ca328849c8f6647909d3eb667b40.1779922874.git.mykola_kvach@epam.com>
 <341edd8de63dcd84ccc6e7b6c03e9e8fc7105184.1781847061.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <341edd8de63dcd84ccc6e7b6c03e9e8fc7105184.1781847061.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|CY5PR12MB6646:EE_
X-MS-Office365-Filtering-Correlation-Id: a9a7149f-0e7e-4c55-5ea4-08decdc94aa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|36860700016|82310400026|18002099003|22082099003|4143699003|3023799007|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	NwRwLj2OrDQfG3uC+KtQGya/ahD5OLcNkOMo3IupPBDR5JNFdGTVwapEQmmsw/uFz2ExbJL33T6MNk9BWzoeGBLfZWGIcAZPni3HpT9ftUkdp0M3/ti5lfO05pdSmr7ZIzuxMkZrKvY1JLYGd2W2Qbvq4/FfW4c4m2gKcANWuxaDNBjYQsPmosp1Ff0uGuwUUkE2aAeK5N/A+tQbNM5oO+I6xqvdhFuiJcuVhfVKBoq+kcpmU39DBHL0k1o+t9CV0Qng854+JfdL6aVHlN8G2vCZELISo0PqeY183TTn4xnuKijWNtEfqnu9SmQPecU0WhoOg5JKSYKX0ZxzM2pfjUOf2MqoTqFjXd0cRnnZMY7M0uyRYk9dYuuK2R6kFsIHrEI7cK1dCVY+BoWLguAJv0cAY0F5gqiY3zr2+TSnna2+Ws5weX3dOBj0QxiK6RYZDJpaxkS5eRE2ETbemSgVx96c2VC6tOec/pDXYv6uf1exA/X635JAmZEAMZObF1zMbB6y3hzawf+s8kd/l481WdWZHdZc/YQIeVxzJIbGkoNHtFkJLHzvF6sklEAWNh6WM+Ck0gAoM2JLycksSb/7PPG9K0dDw5yPiI5J5CafJNFOEG/vkKR0d9OwGxe61m470t238PrzdfhecKKXy5PX5YEwkBsVPTIoyb6sEsaNl5Mui3+Ef9HqfDScwteQfbjMTwcLMEuEc+gjsWZ/q6M7XQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(18002099003)(22082099003)(4143699003)(3023799007)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IIUL3K6GWl2kIAoAbDnBjDzLUBNH9gOgQkE3RrJV16iD/ZMVAaXHmTKeQgytXW1FfZdDXKgxeKogcruhArweJUqS0s2qH/Pr2Zfx4qqwv9KX0eGYCFJMpcDIcPHz8bmbTioulgLTBDT7K3XILOpNn1YvsqfI5GVXcc1kGexCHVgObD4hpgxI9+4/zll0WNvqM+KuQQ91Q27wyEl05VMTnneW6bsYKm66zjc2gVMWA+J9xUsP2plPBJ1UzVHENMnrPpDBaLUNhQlZXVoHpuAcs9DoXaeoZkFH9eLGk57FTUKfbP9oQ8cFhcX/UC1SDvidknoZ8mSFHYFC1XiiqKXX0xBHyrVFhthVsGLvgSCQtpdHMT5X7f1s6MkgkP1dN/e5d2p1DcA41qoSRj1e8ct33MYMK86axoek4hFcKmp8+FQQIpRuYz3KcEYf9GD9//Nn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 06:09:15.7084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a7149f-0e7e-4c55-5ea4-08decdc94aa1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6646
X-purgate-ID: tlsNG-720697/1781849366-4767B3F3-510B7959/0/0
X-purgate-type: clean
X-purgate-size: 1699
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
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,epam.com,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mykola_kvach@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:oleksii.kurochko@gmail.com,m:luca.fancellu@arm.com,m:xakep.amatop@gmail.com,m:oleksandr_tyshchenko@epam.com,m:oleksiikurochko@gmail.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9DB516A40AD



On 19-Jun-26 07:45, Mykola Kvach wrote:
> gicv3_lpi_init_host_lpis() allocates host LPI state, including the
> host LPI lookup table, CPU notifier state and the boot CPU pending table.
> Those allocations use gicv3_its_get_memflags().
> 
> ITS quirks are discovered by gicv3_its_init(), so allocating host LPI
> state from gicv3_dist_init() can happen before the memory restrictions
> required by the ITS are known. On affected systems this can leave
> Redistributor LPI state allocated and programmed with the default memory
> policy.
> 
> Move host LPI initialization after gicv3_its_init(), and only run it when
> a host ITS was found. The old call ignored the return value. Now that the
> call is made from gicv3_init(), check it and panic on failure because
> Redistributor LPI initialization relies on that state being available.
> 
> This also narrows the condition for host LPI initialization from
> "GICD advertises LPIs" to "a host ITS was discovered". This is
> intentional: Xen currently has no supported LPI path without a host ITS,
> and gicv3_lpi_init_rdist() already rejects that case with -ENODEV.
> Therefore, on systems where GICD_TYPE_LPIS is set but no host ITS is
> present, skipping gicv3_lpi_init_host_lpis() only avoids allocating host
> LPI state that cannot be used by a supported Xen LPI path.
> 
> Fixes: dcb6cb263689 ("ARM: GICv3 ITS: introduce host LPI array")
> Fixes: 751ec850ec1d ("ARM: ITS: implement quirks and add support for Renesas Gen4 ITS")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


