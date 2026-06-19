Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9oO1BHsQNWosmgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 11:48:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFE46A508D
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 11:48:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=WYaih0Pg;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1342009.1602308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waVpk-0002EH-Gf; Fri, 19 Jun 2026 09:48:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342009.1602308; Fri, 19 Jun 2026 09:48:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waVpk-0002Bb-Cz; Fri, 19 Jun 2026 09:48:20 +0000
Received: by outflank-mailman (input) for mailman id 1342009;
 Fri, 19 Jun 2026 09:48:19 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1waVpj-0002BV-0M
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 09:48:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waVpi-006i8n-8N
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 11:48:18 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a351056-e002-0a2a0a5209dd-0a2a4509c954-38
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 11:48:17 +0200
Received: from [40.93.196.27]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a35105e-4999-0a2a45090019-285dc41bfa38-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 11:48:17 +0200
Received: from MN2PR07CA0005.namprd07.prod.outlook.com (2603:10b6:208:1a0::15)
 by DS2PR12MB9590.namprd12.prod.outlook.com (2603:10b6:8:279::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.12; Fri, 19 Jun
 2026 09:48:10 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:208:1a0:cafe::50) by MN2PR07CA0005.outlook.office365.com
 (2603:10b6:208:1a0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Fri,
 19 Jun 2026 09:48:09 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Fri, 19 Jun 2026 09:48:09 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 19 Jun
 2026 04:48:09 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 19 Jun
 2026 02:48:09 -0700
Received: from [10.71.196.80] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 19 Jun 2026 04:48:07 -0500
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
 b=nymJKZYD6xCuQo0U8ZyNdzJrPiUG4CgJrnnPxa0LlVRY9M663ADVgI4fOIPzY9r2yExMHoHfqadlOlsIRp2Ie8L3xMfFrYNt87/peHVasjfZvPsnWBfQAdkX5ErAHnrc4P8PO/db8piV8XEYMJnd98Ea/qq+dZN/6zPAuFMTCesaZK5ntuMHRSLstJF/ldnNnuhY7GcVJOQhwJ6OzDE3AVPxO/Zrix0G7NtJVuHCMIHsCzdnqpiSaG+8jUFkPd020I7XhCUtDn3wRQmlAS5PAZDida62pmRXALlJUT8eYu68LigqPmmEOLXRWAUDNSl3raOGAfmy4uuJNNrGp6lr1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdfRQUMOQhxhhJkCBBPqXhzrGY18rGzkim3POk4UUZ4=;
 b=W4iVymn++tuOwYIz28nnxFY4oDxtzoxCxpl7xDXYQspW3ZxT3o/MsQZlO3vRR0vaxD9jb5OGRlyMpRjkMX2yPRmUq3pBv/exBBkOLurYNW/dcAkHyo5iNIbthX1WHNXn4pEsJTPgTDQK+1JTAS2XpIavaYzPsQ9zvKuzMbIjrTr2yX095zWmuIe6IKcOJDJsaigvVzhLNeQyks/ceJjkTdShf6OkPWvCTuhdMM3gpaIQJnj+RZuMaOREp5NmZjBLrpAVXFJmaoEJT+mnA/ergweRAsFA/WYc61MLY6kO/EqV2oehpqcMVTiS6tc5jlUZmRNEptYdD1EugtZOJRdK2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdfRQUMOQhxhhJkCBBPqXhzrGY18rGzkim3POk4UUZ4=;
 b=WYaih0Pgc7v4AnVPJip3L2KOauaxA0mnb+/tIClVuOzak5b+AyBmL5HauY7E0vugM4uxzBF5TEqYyIlXXy13+SGWLkgmh6vv+/jogu1gy9uVzodDFGKHukRCn7OpRD4b30vjAI3HN+GbJfSCv/w6rzSS98gEUQat2fbB2ExNo/Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <e43afc29-cfbb-4978-9324-e8d540040bfa@amd.com>
Date: Fri, 19 Jun 2026 11:48:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2.5] xen/arm: gic: defer host LPI allocation
 until after ITS init
From: "Orzel, Michal" <michal.orzel@amd.com>
To: Mykola Kvach <mykola_kvach@epam.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Luca Fancellu <luca.fancellu@arm.com>, "Mykola
 Kvach" <xakep.amatop@gmail.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
References: <112419d3ea48ca328849c8f6647909d3eb667b40.1779922874.git.mykola_kvach@epam.com>
 <341edd8de63dcd84ccc6e7b6c03e9e8fc7105184.1781847061.git.mykola_kvach@epam.com>
 <7a0a1867-8316-4e20-971e-fab99c9f4a32@amd.com>
Content-Language: en-US
In-Reply-To: <7a0a1867-8316-4e20-971e-fab99c9f4a32@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FA:EE_|DS2PR12MB9590:EE_
X-MS-Office365-Filtering-Correlation-Id: bdec211f-9771-4961-e1b0-08decde7df21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|23010399003|36860700016|3023799007|22082099003|18002099003|56012099006|11063799006|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	XYcoblJprfQY1ryKfX7EOkLiVgtcdgxwgSk3ZZIF3leQwzJVHRm9y3cr7OIHPSkZdyvwCD1bKnw3wicwn6upwRDilakOkjbMpL0Tcqgs/o0su9u+Q/7TIouHgRTccJRWMWDgIHuew30fjNG3qK2GUN6NZE+VvanbCPYFEBJY3PgtgNsf3rGCzF9PCxiEQ6IIP0z5nIQTmxb66YbIdCXK+sm7I3N8PxhHGPFVgT5bljBjBcJ4VP9KoLq6Mf9W8Pu/0roc2VEvQ53F+rZnKpdTAixlOgEmFCzfmLdsNZlcvWrE08q7BxFJYEAbjovQToXRN5X//mVMXqBLjyye5mV3KFFvwZtbYksRxoWewhCeLoSxjTLo2CkUVfns7/MG5acdiPviQv3GaGJYxmGyfbIhMv/NoKSOK3d5YwEcjOOdACBZxyXOirdjXeI5OhiWeFWwjfe3j6FbECkG5olbJsGflWJqldVffAjLB9LvyFtXzKyGxnRWASZQEXAbsK45hO1ycbRkh3mnS50lRaXMnL+NEaEb0zobt8LhG7CjV9A+jvwLRfyAQSU/F98LOP3v+zuuvbWlesiCP2mhADybMHqlDyJKMLXcodBSyM5UZikECmHpBovulW4jR12lpZToXhamePhAqOWsW9bbO6l6TtZxvoI5eSTzKU7KusQrRWG6K5DTykZLvgHMi/Y9uU9/tXlPdqzKqjnAg4jzyA6Hbtt2sQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(23010399003)(36860700016)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006)(6133799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Fh/tU5FZ8ivVtwSlEyYTQtR1ZMJ+4gYcXwZF4s/hoEV4ytsw7xzfzjSGyxHgQo9LkPNEE7DCD4dyshRNVqrbAh4t6ABJvVJJolbQELqcXRvzAWJVzhGZ7oUcfHJaMM6CO2cvngV/1l8ROaqbt2EmWlZ8Bmv7RS4ZR3THkFtQvjJZZceBlkWoRocMwLmO3y8Mgyx4ABcsyMrlUQmvbxpmlbJGy6ao+GskNZv4KiBlmwXyLtN4YbDIt4jJnpoReUfrmZ9/HIejAM6H6wCDcU3LpWqRpe+/936g8jXcLgUdjYHb5jQhLYjz3dKAnYNJciyYV4mAaslvybCaxnpNfOvnvDJ8cnVv/5QksCbAucvHSHwBqcUy6qa1aaVo5j1NHnGGQ89iyK4eq5n1vvc+aFAjLtCm0tU+Sb4ehz/Cgt//OLqh6VwIEv8Nn6Dk6tvLNIFy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 09:48:09.7426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdec211f-9771-4961-e1b0-08decde7df21
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9590
X-purgate-ID: tlsNG-bad1c0/1781862497-71BFE744-50C529EA/0/0
X-purgate-type: clean
X-purgate-size: 1843
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,epam.com,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mykola_kvach@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:oleksii.kurochko@gmail.com,m:luca.fancellu@arm.com,m:xakep.amatop@gmail.com,m:oleksandr_tyshchenko@epam.com,m:oleksiikurochko@gmail.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5BFE46A508D

@Oleksii, can we ask for a release ack here?

~Michal

On 19-Jun-26 08:09, Orzel, Michal wrote:
> 
> 
> On 19-Jun-26 07:45, Mykola Kvach wrote:
>> gicv3_lpi_init_host_lpis() allocates host LPI state, including the
>> host LPI lookup table, CPU notifier state and the boot CPU pending table.
>> Those allocations use gicv3_its_get_memflags().
>>
>> ITS quirks are discovered by gicv3_its_init(), so allocating host LPI
>> state from gicv3_dist_init() can happen before the memory restrictions
>> required by the ITS are known. On affected systems this can leave
>> Redistributor LPI state allocated and programmed with the default memory
>> policy.
>>
>> Move host LPI initialization after gicv3_its_init(), and only run it when
>> a host ITS was found. The old call ignored the return value. Now that the
>> call is made from gicv3_init(), check it and panic on failure because
>> Redistributor LPI initialization relies on that state being available.
>>
>> This also narrows the condition for host LPI initialization from
>> "GICD advertises LPIs" to "a host ITS was discovered". This is
>> intentional: Xen currently has no supported LPI path without a host ITS,
>> and gicv3_lpi_init_rdist() already rejects that case with -ENODEV.
>> Therefore, on systems where GICD_TYPE_LPIS is set but no host ITS is
>> present, skipping gicv3_lpi_init_host_lpis() only avoids allocating host
>> LPI state that cannot be used by a supported Xen LPI path.
>>
>> Fixes: dcb6cb263689 ("ARM: GICv3 ITS: introduce host LPI array")
>> Fixes: 751ec850ec1d ("ARM: ITS: implement quirks and add support for Renesas Gen4 ITS")
>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> ~Michal
> 
> 


