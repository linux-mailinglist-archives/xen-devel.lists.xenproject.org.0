Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LwcKGoH72nd4AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 08:51:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1996446DD96
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 08:51:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1294667.1571357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHFo5-00052o-6n; Mon, 27 Apr 2026 06:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294667.1571357; Mon, 27 Apr 2026 06:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHFo5-00050G-41; Mon, 27 Apr 2026 06:51:01 +0000
Received: by outflank-mailman (input) for mailman id 1294667;
 Mon, 27 Apr 2026 06:50:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wHFo3-00050A-Qc
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 06:50:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHFo2-00B80q-Nx
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 08:50:58 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69ef074c-bab6-0a2a0a5309dd-0a2a450ab9c8-26
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 08:50:58 +0200
Received: from [52.101.57.64]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69ef0751-56b3-0a2a450a0019-346539407e7d-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 08:50:58 +0200
Received: from SJ0PR13CA0204.namprd13.prod.outlook.com (2603:10b6:a03:2c3::29)
 by BL1PR12MB5899.namprd12.prod.outlook.com (2603:10b6:208:397::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Mon, 27 Apr
 2026 06:50:53 +0000
Received: from MW1PEPF0001615D.namprd21.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::8a) by SJ0PR13CA0204.outlook.office365.com
 (2603:10b6:a03:2c3::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 06:50:52 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MW1PEPF0001615D.mail.protection.outlook.com (10.167.249.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.0 via Frontend Transport; Mon, 27 Apr 2026 06:50:52 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 27 Apr
 2026 01:50:51 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 27 Apr 2026 01:50:50 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmJWRaYDgIKpapCV5YIkdO7rIXuOi+LoIqJEgZ8P55NgFVRXwi0xeewHG77As/Efajdo7dR44hl80M7tt+omvCBM8YUWe7p3AneD4vj/SH7kvf+Xr4fnBHhJp7KEygOGQ3st9nPuiwx5Mmff2b4BS5JK9X48uuHBgTTYCXwZHlyoB/2vu4nOiidIu/WOlHpSpGa0O9/80Cou8h0ADajhX3/zSXbneQEg1B4uVihEiDN32tNJpszfz/lJBRUxCougHI5+PqpePGn2xEQF+ALOY8KDV3sPS6j1uv1QGSRAbRTDSXURDRtNnMcNmy9JIb3toX3ytRl9xioeFXKYT3ZVkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8pPvlkweU++pWabgv3FT1G1/MZ19OtebLT4SE6Wn7og=;
 b=JzeyAQPIFs3zruxG4vq60HTQkqVcxRVM5k2k3nGjg22fC6jGbTbG397I1ouqtOWEVCTP0NSrEs8hk5Ch6ltCt+WCr7zb7AlqrGfFPehGLsj0QCuk0deIWWJfI7AuK+3O5FSqo6ZKOVjM+cK7p2cyngBKPOwywyRx9Nv0EqKMoHiADZFmhtx4A0XUTQ01IttpW2OPIKCm7Nd9zRsrmUzF0q0KfbseYS3oN+++Fa9SyHclR4vKrjq0ewVFtqFpCbDdBk5RhvXeQ0QoJS6ASqNQExfsQWS/T6yL3B+epm/AJknDgJPx0aH41luZLVIOMzW++v5DsvK5gu4vK3vv3AkqNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8pPvlkweU++pWabgv3FT1G1/MZ19OtebLT4SE6Wn7og=;
 b=cklUNgIiAXqvqj/tMrFYDnNQKlQaK+v/yIbV7un95iJp5VKzwo5+H0qF6dhjcBWsDDK2ShK1GlJ4w3335zCYP0McBw7uLoz5wYu5PgsnHoigtv/C5UPyQLo09hBldxYMn+85hqPkG+GsafS+3j1smbMjuU1TFHx+B0SFBckBixY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <b1846d5a-f9c5-412d-b996-86c4c29096e6@amd.com>
Date: Mon, 27 Apr 2026 08:50:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] xen/dom0less: introduce next_phandle in struct
 kernel_info
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Romain Caritey <Romain.Caritey@microchip.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1776957840.git.oleksii.kurochko@gmail.com>
 <5e3ffb41fab84b5f1b59ea81e6d267def89e2d65.1776957840.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: pl
In-Reply-To: <5e3ffb41fab84b5f1b59ea81e6d267def89e2d65.1776957840.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615D:EE_|BL1PR12MB5899:EE_
X-MS-Office365-Filtering-Correlation-Id: bcc9954f-8555-42de-21b7-08dea42952f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rIZvoXpO/SUoxPjX6kTuLXi382ROs4vRVJoxQ/Wb99JF/FqWatsB7fyUOxoQ4ro23UggBIv/tsIxn94kGSNRy1e+K5NSkiN1NiPZwhoAk9Qj3vH5mWFcyh3iZCIzMv8EBPegJ8EGaqmuTkhvGmJAPWmncEn45FX7ZJYfLDDG+7WLy5ydkPEVUsGnSW+5AdVeHSATt1XC4kERnFkaZ2781T+/Lv+UCa3NoLfvH42Ns/BBZ5bq63E1Q+3nMJg65nao2Ze6lQ5JmwciKmVKmpeuUU0LtzUMYy95UfmAIvOGZ63VIcip/7bo2OU4BDciaOKQnWV3cwVU0vffNcqZ/8upX6ejWKffgKy6V2abAZ634Pwfaq1fIc4I3WzUUc0eeX+rSctIyA4iPIy1WH7MTAIIu+anKMz6C5rgrTcdKK8HFYGannfMuUWg0PdDfWipZVOgF2cJgXyMjs0btr90TfKtSMGs2UNnOb2gbBQ+MCE5kGV3X0ccMhVAsir1u++FBy4QKBE8gQtvdKE330EjkwWxcHAskI6CvsOYLor0BVdWfLXsj+gb81M2DUCO2/FjgIpPndUnX7Wo95s6tecHaZtxfGhtK/irBVP+iGgoV9X/MsCOabrcdUXNsx+gBrc/Cj5wntXgxfAiRnE3RsCBLibl5HFmJq9/S1Qjc7+ikaxhWeCv17egsUUH37hh7A7zrCpqCEG/TxJQ+9fCxTTyUgJ5IUU+AwylnTDmOQ8BK7iThbKnkZckmwi5VvMnFCK5utl2eIp7UsHiXabVGD1YCp1vWg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	S2pvlNU7yyDpwfhHwQmnM1gH76dGsrMeh3FKdhC1Bl8LmyxqWVhzzGT1QOMv4Of1ETSNjqTWg4YAfbN0MHhkeB6mZj4ML1Jfg2dPYbyokvO1FhpXuZ0p/Mq8tvzJ15ATEjIFOWNGRCftxGpSDPf+YiZpYsKc3x8srbXrvCfcoWvnaRT3JVTc7iWvET4O3BkzSUPQD1k1hh1KvTr9rvZUsvYPd7+NNpmAcK6Xf9VU2KDO9zWbQIXD5KZ5gg7puxuGcndgvkOMsDfyzynB3mWySzW/OhoqhAdxbm/+ai0yazQCnDNYkN7yNgbj3pmRfagO3L4mK/YcjI8mm2EPxyyH5FSPvIoL4suwMiYUZslBRWl1Dz6ZKHr5CU4bdxwlEK6VAFk1W07SSHrEfYwN3oozqMPLVeuEXbUtS/rhzHOHooVvwZnQfGJLwomOcVpaY//l
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 06:50:52.3932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc9954f-8555-42de-21b7-08dea42952f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5899
X-purgate-ID: tlsNG-4011c0/1777272658-8047C8B7-B2A4323A/10/73395122804
X-purgate-type: spam
X-purgate-size: 1212
X-Rspamd-Queue-Id: 1996446DD96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]



On 24-Apr-26 3:36 PM, Oleksii Kurochko wrote:
> There are cases where it is necessary to know the next available phandle
> number in order to generate phandles for guest device nodes.
> 
> When a partial FDT (pfdt) is provided, special care is needed during
> initialization of next_phandle, as the pfdt may already contain a dummy
> interrupt controller node with a phandle assigned to it. next_phandle
> must therefore be initialized to one past the highest phandle already
> present in the pfdt, to avoid collisions.
> 
> Since next_phandle may be needed for the very first guest node generated,
> domain_handle_dtb_boot_module() is moved earlier in prepare_dtb_domU().
> The new call site also aligns better with the existing comment stating
> that domain_handle_dtb_boot_module() must be called before the rest of
> the device tree is generated.
> 
> Introduce alloc_phandle() to ensure that phandles allocated for guest
> nodes do not overlap the Xen-reserved phandle range.  This helper will
> be used by subsequent patches (by RISC-V at the moment).
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


