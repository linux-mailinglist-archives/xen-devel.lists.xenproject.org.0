Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6cmALetqT2qBgQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 11:33:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0792D72EFDE
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 11:33:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="V/RTILPW";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1357708.1612052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whl7l-0000cK-QA; Thu, 09 Jul 2026 09:32:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357708.1612052; Thu, 09 Jul 2026 09:32:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whl7l-0000am-MQ; Thu, 09 Jul 2026 09:32:53 +0000
Received: by outflank-mailman (input) for mailman id 1357708;
 Thu, 09 Jul 2026 09:32:52 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1whl7k-0000ag-Ba
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 09:32:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whl7j-00EKJm-Kt
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 11:32:51 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a4f6ac0-5cb7-0a2a0a5109dd-0a2a4506c1e8-10
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 11:32:51 +0200
Received: from [40.93.196.35]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a4f6ac1-08de-0a2a45060019-285dc4235ef9-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 11:32:51 +0200
Received: from BN9PR03CA0390.namprd03.prod.outlook.com (2603:10b6:408:f7::35)
 by SJ0PR12MB6944.namprd12.prod.outlook.com (2603:10b6:a03:47b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 9 Jul 2026
 09:32:44 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:408:f7:cafe::15) by BN9PR03CA0390.outlook.office365.com
 (2603:10b6:408:f7::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Thu, 9
 Jul 2026 09:32:44 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.0 via Frontend Transport; Thu, 9 Jul 2026 09:32:44 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 04:32:43 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 04:32:43 -0500
Received: from [10.71.198.170] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 9 Jul 2026 04:32:42 -0500
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
 b=KnZOiM5R5ePUymWNzTDfuJoigw+Uyijl0aQ8kBh0gwHnqBzfRoD80Bybg6Ykl8d5Qodow07ob1ASHZDz8iQBkVkNzlqWGn32HZLekgE2bey+cP2x0xYCSECxHAHbw728A/IbGYkbvEU5AHu8NB26Ate738N33jO+QIHUPnah5JGRSNZ6T8sAb+LrZQlILFdQrxhq0ocypUHHsVOJmSvFn0wCv1IHEMGGW3bpDxxchRSNJSVOwUHUZEMe87iLTrs+r/PNPkgUnTB8Anb3+T9Z+EsUgdWpv90dny6OjWsnH4KyR16vc+XDPDhjYzJ4b78KYqyik+L1L2lGBi+0aspNhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylED/Exol/IBw523L6L6OHOZUTVW6ahlDtVbvIGmfgY=;
 b=JtZWcWeQ9GX0lAqrE2UdfQO+g7w358OI20+Hx+DfuLLvtR65iDc3WWdMRZAicPWbKThmiRcT21pzcZuf5hzvEb8ysFocIfWoe6AFtHvRWbw0P66yU+YMo4eVw6cjgRNHSQickYv/x3MdE+N9fMtXQcfb6QWjgBPUKjqEL1y4HWgY8QYCGu3U30YYw3crOa5nWbxe9084M5G8AgogEO8spkLlmqSCVPcBIvT+xy0YMG7KZblchhnAzgKmZC1HfG63E9FRFTxl99coMV7hjaGparFoVysg7kM1r1jU/hCUfdtQTHI/n47L5pcG/m/Evy34AooIR8KEkLw7lBMRqzUn6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylED/Exol/IBw523L6L6OHOZUTVW6ahlDtVbvIGmfgY=;
 b=V/RTILPWzJWZoI4Q6wD8FF4q+XKSEFmP/eS+vv6DwPgKpyKn9l63lmVMprgr0DkenLDUXe1gJZh7Uen+Z3K5pBtpZc9Cug1r4Uy7TsXtDLdSkCTKXvfsMnJUFbh1nBLtcjuhvHxjkGbxY08PuYZRKuv5D+wH9ad+6bm1JXLbcm0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <aab9fd35-6230-474c-8848-480c8cccc43c@amd.com>
Date: Thu, 9 Jul 2026 10:32:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.22][PATCH v2] xen/arm: Fail domain construction if a
 secondary vCPU cannot be created
To: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, <ayan.kumar.halder@amd.com>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>
References: <20260709063643.11800-1-michal.orzel@amd.com>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <20260709063643.11800-1-michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|SJ0PR12MB6944:EE_
X-MS-Office365-Filtering-Correlation-Id: b4091beb-38b1-4a73-fb13-08dedd9d07a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|23010399003|6133799003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	dAWxwwUmFrebpN6NC1RkAdmthxDG4DTTndkrNVtMJM/ov+0F/hRzLy2i5WIGdxQgvMzTmnzacJU6XKXCj9SKpOcFyKVj+WWehoT8M9I0qfOg9EMmS23mxCBWtrvpmvbUol1AKYpRPVJLxtX8iADsWzDBXNWPqSjbOfmlsw84hWOD7x1921TIActpFhuwDbTwpmWai+yxVo6p+XltYU3aQfAkF9IgGsSOEY/ifcWVpDfYHwq+mjsX+u7erHYV1Z5/ETsOTpbZKmA7fRbaBhhqzLiwY9USAqJ6PWa6SeItlI+ZrUR0I/r4VS7e99+Q83GO52ShDxc9SwtUdUNf7uzxD62U2S1DXxEFORrMt0BAmvejOQnGUxkXIuYz3s07ggP2HvgcYGRANjs3t5cqBNnUmEvmuo4VAlt9IlOnLlde5rilKChEEZlzzYDbYusG4K/s9NCtYHVHZ3uGKwEL23otQuXSjF41NFKOkv0YRyBbzW/vv+dtBr2PqAnTBnFZVIkZct/g74e/wvCDUjdQurDNAQL/E12Dfxrkxef8Q7NNj1VPx0xK0sfbwK3wSJbjhaAUepOhZeRiiro8kzG62HDSMIOFk0UjiJUZ01IP2QqWL5A4iAUzwZDN38+AAohNDctnwxgGHjN+76Bo9kBw8vHQbCoDx8wvYsYqEtCKggHPbzBcWyVEed+xm8ZwFYHRehtb4Ibg/QuPPPHQe2VCjI6pEw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(23010399003)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zGlCU8fw2p9VO3PQxLtzwAgvFt5g1PePRvx2cqRSXJl8jhZyiJjLiloaU2HArdB4anmzOSu3P5O0XMQfnqvfMxv5FbjAKTWLooxyQoUhyXfukq1SpMTUFzFI69/hd8EYmbASuEosXRpC5RXOaLn6lBJgw+uSpnsV6Y39QHHWoqjw6hrD5bmKzyyuiK3HoM0A2i4FOko9xKfQ5gPaXUR9tf+5JhkzswkfSsRpYaC9brwWDFTC28uucfqF631V9lC2d9jLDf7JiMDwS5Oe67MLnJHwshum4KlwLgOACs5pb+a5CVKZeqi9htzaCO6B1XOdtm8RkXmzdQ11K/xRY37FRzApXNClB9YunQQ0AR4Lo1zegn1sYbMr3b2/CKBrk0CWOkFqKqJQ4BsBT2058apg414gipFNEpN9BMd4uOd/t15hHxVkKW7QvqVIgb2N651+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 09:32:44.0841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4091beb-38b1-4a73-fb13-08dedd9d07a7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6944
X-purgate-ID: tlsNG-16d1c6/1783589571-4312768D-FEC59897/0/0
X-purgate-type: clean
X-purgate-size: 2722
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
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,epam.com,amd.com,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:ayan.kumar.halder@amd.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:from_mime,amd.com:email,amd.com:mid,amd.com:dkim,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0792D72EFDE


On 09/07/2026 07:36, Michal Orzel wrote:
> construct_domain() creates the secondary vCPUs in a loop, but on a
> vcpu_create() failure it only prints a message and breaks out of the
> loop returning success. As a result the domain can be partially
> constructed with fewer vCPUs than d->max_vcpus. This causes two contract
> violations:
>   - Xen-Guest: domain's FDT is generated before vCPU creation - Xen exposes
>     incorrect information (e.g. two vCPUs listed in a device tree while only
>     one is actually created),
>   - User-Xen: unlike x86, on Arm port we try to bail out as soon as
>     possible on unsatisfied user requests (e.g. user requested two vCPUs
>     for a domain but it was created with only one).

Unrelated, but just to add my 2 cents wearing a safety hat.

The user-xen contract comes from a system integrator. Xen should try to 
follow the contract and if not panic or bail out.

The Xen-guest contract can be used to enforce the rule that guest should 
read the contract before doing any safety critical task.

The most important thing is anything errors that are internal to Xen, 
should be propagated to the external world (either as panic or return an 
error to the guest or abort the guest). If there is a degradation is 
functionality (eg Xen creating a guest with lesser number of vCPUS that 
what the system integrator provided), then this is safety issue unless 
we put an assumption on guest to read its device tree and know the final 
configuration (which may not be always ok).

>
> Return an error instead of breaking out of the loop. Both callers
> (construct_domU() and construct_hwdom()) already propagate a negative
> return value and fail domain construction.
>
> Fixes: 6b0e8e43348a ("xen/arm: allocate secondaries dom0 vcpus")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes in v2:
>   - return ENOMEM as allocation failure is most frequent cause of failure
>   - update commit msg to focus on unmet contracts
> ---
>   xen/arch/arm/domain_build.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 550617f152bb..72d531618045 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1847,7 +1847,7 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
>           if ( vcpu_create(d, i) == NULL )
>           {
>               printk("Failed to allocate d%dv%d\n", d->domain_id, i);
> -            break;
> +            return -ENOMEM;
>           }
>   
>           if ( is_64bit_domain(d) )

