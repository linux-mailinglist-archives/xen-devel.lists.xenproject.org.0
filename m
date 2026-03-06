Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mA7dDcycqmnPUQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 10:22:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D9021DD1E
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 10:22:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247468.1546073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyRNV-00081y-V3; Fri, 06 Mar 2026 09:21:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247468.1546073; Fri, 06 Mar 2026 09:21:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyRNV-0007zL-SB; Fri, 06 Mar 2026 09:21:49 +0000
Received: by outflank-mailman (input) for mailman id 1247468;
 Fri, 06 Mar 2026 09:21:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pqZA=BG=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vyRNU-0007zF-G7
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 09:21:48 +0000
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c110::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e54e4bf1-193d-11f1-b164-2bf370ae4941;
 Fri, 06 Mar 2026 10:21:46 +0100 (CET)
Received: from BN9PR03CA0641.namprd03.prod.outlook.com (2603:10b6:408:13b::16)
 by MW3PR12MB4474.namprd12.prod.outlook.com (2603:10b6:303:2e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 09:21:42 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:408:13b:cafe::ad) by BN9PR03CA0641.outlook.office365.com
 (2603:10b6:408:13b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Fri,
 6 Mar 2026 09:21:41 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 09:21:41 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Mar
 2026 03:21:40 -0600
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 6 Mar 2026 03:21:39 -0600
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
X-Inumbo-ID: e54e4bf1-193d-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wHpMflHJfgEYjP+XdcU6CaLPD3xG4Qgq7bffqEvV1AEqT/q4j3HNzkdFiM9Y8pIRrxChbkrsPCN9hntGuk7faT7pLJhf9vSlcYR/wjuRqsjj+mwsE2wihZfHTmrKFpXRsplAYfM9GrSCSVE6a5IA/kZPsFDuPyUirqml4mi3zH/umoIq3BA2UwVUSyOQCSiZNj0Zs8HaK48j4XQrfAxe+7ESAnrhkCZUBBDe2vjbFXEnsDbT0Eg+KUY+9Bio3EhHd2hxXOlun/NSXJgkJikplETMTIXFlZ1J5l+2/G0Oprg26vzrO8QquNQfg5Ch/7J8TP8pyv7sAa6KCkHDd6/bSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFRT5nAckARuk4H+S4Yw9VmrAdvcJew+SYc7fWR7jhg=;
 b=vBlHjDlXw+2mpaSVtVWOZO3AND1D6C3kWbnbg6z5YQHaDsYTEzJMiipYTSyUNhJA4PrqpgCBSqJf2uDeoFuOnLnextfYY3JEDafxMRpSfLnFygXxf3ukgWDozZL0CrKXfPLxyiAjuLvseU/nYQWfcOvgcjpaJOK41xutGIYOy4DLXQ/FbrSKOrhBfTJ+z8N5sT4j8elWpxvGS0ffukCPrwWRtOCoCGFvmX9piCY6DCO/Mql53naF7pSuEQHO0J48z9UJ+MQmV6Mrc8sFjjV6Z0HpoA/BZ4ZxSU+oCh6x1FHVUtZ/CVT6/svgHS9eHOj4IkGEXZkd44m/SWl52sxUMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFRT5nAckARuk4H+S4Yw9VmrAdvcJew+SYc7fWR7jhg=;
 b=G1SADx0hf1PWuQX4ryh2I0srk87SLw0rt5pU6j6IzFdew2B+QQY11DuVtBKUOeu7eHpNXLT/HJeF6SpqIzAamI7ou/7u9mv7u+s7wvdKo3eklHwOJKIUQigWBnf574M9LmvdEEy8bl6ijjPgOV5hFWZIeRE+Dzrl7l2ily2mJkM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <16fc8fd8-9256-4c95-bce7-b7e696a27601@amd.com>
Date: Fri, 6 Mar 2026 10:21:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM/vgic: Use for_each_set_bit() in vgic_sync_from_lrs()
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
References: <20260305232845.62024-1-andrew.cooper3@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260305232845.62024-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|MW3PR12MB4474:EE_
X-MS-Office365-Filtering-Correlation-Id: be7253f7-077a-4971-75bd-08de7b61c720
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	8txPSpvFdhEuDIgiTJq6xDQiOpaqBdy0S7TCp5Lb8Z/fEDQKMVSCDutv6u+ZsQWWX01oNYgsgAW3minjRRcgaIzCHdzZk5HbksQM3GAxxtr9nu8ZB7k27fvlGMSJ8e9cWyMnJOgxWcy/APNP127QeB4sPZcTfGN5pP/3QkLbEsvyam8AO1LxyhQqasJhIacbuLT/0l0oyY7gvpMNE/bze+6zr1ueT0iwWGojc8QTxX/XPKHhDKHPm0Pi1VDGg2SPfdGyBBpRMWEELcF+6N6P2HWSvZ6T2THbc1HUFtz4ZMPqDamGzYBk5hlk75UlV4G+QAvaT164kZaia5FaV06T3UzoXan8CDr+Gbwz2a3bdLe0AnH2HrIpq8YoTKRqQNVPIxKmiaxN5bBEqfi9f1CIHfsr/oEZK4XYH7cUPkBimJwBwadjEjAB4hcBasl+nGdnV0owiux7JkJFh1uPBXwIosVvffQTN8gJpys8U47N+DpbyUrogE6hKx7kk4hqKqvg5/zAL3pQco9fktBc++uwD2h5l7wxNpqiDxp1p5iPV7AJwHwozt1PZkXjN4sSpVqQwNa6qqIjO9AkDme4/m6mgsnzZKseRi1Io2idGMc+EDpGidSh7ppnpYuxWOZGua8JzoRlPL7gs4yzf4hGiBD4XDgxfp62BmG6jZ7rmW+60frumocYqFH540o0uSFP4q8XdXFcEfkXXOOnClCNhb9Dg52ealFuf/nDwbAJcPOwlLdIDW+oQCOjTEesi/WxB5OMtHVTOg+ElfTiIp06KriQUg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TAJY06CRTF1zFWkjTjraiDMweFeVwcP6ddOScB/337qmEthorD3IDdUNjSj3rFaA6NxbJvlPb7dLo2cHcDJQ+A2TBsioEXWHGNm8svGyhNyHlbDpsdvc8h5ZfXk8CrybzChx3qEAaJMUj1I3NNSN+l3L+v3p5WjPEATjUiytKtQnv6CJINA1SsCKlB09dDZ7jUR9jJ4PsPoXtiX3MO2N3nmEPXKAe+sqZAxl9SZ32FIf6AftcKs+98EAPg8Y38Qi6VdGnLLyuPHj97fh+JbFGa5Ir1u4CGq/yR/zzKFUUjWIPJeLw+M/l10XSHLRKoQrk/XT+xaFMNl3WDGGf5IEIddnJh01hsu+Vty/j/ugyi9YHU4VO11b0K8LBh88bFN/DLXeEfU3++3COBoC/JspF8BI4xPQXKMX4Qcv1A+k5dQWeIEd3956lXKmuXYozQZ5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 09:21:41.5590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be7253f7-077a-4971-75bd-08de7b61c720
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4474
X-Rspamd-Queue-Id: 90D9021DD1E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:ayan.kumar.halder@amd.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,citrix.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Action: no action



On 06/03/2026 00:28, Andrew Cooper wrote:
> lr_mask doesn't have bits set beyond the hardware limit, with the upper bits
> remaining zero.  Therefore, for_each_set_bit() is a better option.
> 
> For ARM64, bloat-o-meter reports:
> 
>   Function                                     old     new   delta
>   vgic_sync_from_lrs                           208     168     -40
> 
> but this doesn't highlight that it also removes a call to find_next_bit() from
> each loop iteration.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


