Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JbEObccFGoGJwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 11:56:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 576695C8D60
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 11:56:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319117.1586839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRS2M-0000AN-N4; Mon, 25 May 2026 09:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319117.1586839; Mon, 25 May 2026 09:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRS2M-00007a-KC; Mon, 25 May 2026 09:55:54 +0000
Received: by outflank-mailman (input) for mailman id 1319117;
 Mon, 25 May 2026 09:55:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wRS2L-00007U-8D
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 09:55:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRS2K-006JSG-61
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 11:55:52 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a141c9a-e002-0a2a0a5209dd-0a2a4506b952-36
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 11:55:51 +0200
Received: from [52.101.193.65]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a141ca6-7371-0a2a45060019-3465c14130ad-4
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 11:55:51 +0200
Received: from SJ0PR03CA0335.namprd03.prod.outlook.com (2603:10b6:a03:39c::10)
 by SA1PR12MB8119.namprd12.prod.outlook.com (2603:10b6:806:337::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 09:55:45 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:a03:39c:cafe::39) by SJ0PR03CA0335.outlook.office365.com
 (2603:10b6:a03:39c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.20 via Frontend Transport; Mon, 25
 May 2026 09:55:45 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Mon, 25 May 2026 09:55:44 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 25 May
 2026 04:55:44 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 25 May 2026 04:55:43 -0500
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
 b=oea+8FIylqj41RYpvYxx3/Ekr7TYYio0Tj1hhIhCpW+Ks5JvKljSA7+W4QGsLTt9jQG4f962ZgtwHPWrT4jpPHDfxVpM1zSGC3gL1ByjhZaXxJ3qhF8+ZGZRtNBoZOaD4yaEfEHPZUSoj8W7KhpYHPWnQQ/AZmKZO/5z0M8icuQ2E67YZ6ee6txj0eNyu6bjgPin93FRJ4Kshso7NxK+HczeKhg2dJNzmv0dAOsVqmmwVhTP9pRT4LDjlFSi3AjHjAEsrLZ4hOJMB6rTQCVxwOVT00/mgCtxRCP6VezqYJBoWBIbVDcjTOsNosJ+N6eLIroKtGLhpO5+EbbcSDTPRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVvZe1nzjfEPI2GFbE6FjfQnow1z3wc0kG8beW+zkoE=;
 b=mbVtWDQkQ4rEdnmFa97Gh2aSBw7Vhe4C51tcLfZPbqj+pE5Vt2pC2hZEl9D9TYOe0vrF0zTOdZAvfxjIoXzVeYQLYIM2sGZEGCeyLNadQd19C1LL6q4N/P6TblId9oTK92ICu1EgjtrvK9xdQyfCSEzR3JncoWEpfRH33E8sVF63O3n77tHkSsHE9xRTr1GZUDRDdwBk7cr5xnD3azh7PurYpcs8rguncIKGGDDcPf1fKI2WwxnYLw6qW4iW0fDdcSMgW4yyncfzEgb7ydGg9/uyRR/Srai5CMba4owfVeglj/ppBx5/UHLkrSQ9G5nQwdb++Se+t5Cp8cGgQgzw2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVvZe1nzjfEPI2GFbE6FjfQnow1z3wc0kG8beW+zkoE=;
 b=ABOQSoiqra7ejEWXOg3AeD1sg8o8Y/2s4GcnIbsWYYD7onCMTqT9bmCuY90mQlm7EiRfVA9PtAKt+8BusdFseyb3NVJIIr2WbB2HS8AtMpXl+qR/rZ63wEOCBoLNUnhK4Bjw5yifaqx8S4tlUuv0/ImG40fPfINsj3SrEzJH7sw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <d98c2f4d-d1a9-4ef3-a24e-05cc6451bb72@amd.com>
Date: Mon, 25 May 2026 11:55:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] docs: Document Arm GICv3 limit for dom0_max_vcpus
To: Mykola Kvach <xakep.amatop@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Mykola Kvach <mykola_kvach@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <cover.1779430299.git.mykola_kvach@epam.com>
 <88459940b410ceddc04bca7e2cadf7c16bd5c13b.1779430299.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <88459940b410ceddc04bca7e2cadf7c16bd5c13b.1779430299.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|SA1PR12MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: e0427c6d-3710-4f66-310e-08deba43ca2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|18002099003|56012099003|22082099003|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	92xq2AmEd4iyeaQb1yzhdfkRsl5IZFBuuzFsXDCfDns2KC3wjMduHeq+oK6wX178jR9wFzVhXe9tgBB7b+GPzQPSYvT8b0XJC5Z+gaHCRz6/iLLd9G7Ao5DvOlZddlLRM+SbbmK41HNBzb82op0yP6oPpCz2Uvumsjz+Q760AKnIk81jrQBpVn+joyTomANTj9J4JzfIndNaPgC5OUw0NUAK2bBaUGvWAjmf223636/b22sdGG/NOv2NuxeG11kweOUOuVd5u4WWXZqzrAF7a/OLZp01eUH1lwOeUbnK1zLTsKuQr5DcF3F6FBLtb2tEauk2lk/4bYsKEINKpQBJORXQriI5NhxbCdDfdtPFr39MTPMGZSY2kYA5flMS6bpIkmKfDnva6eVt2ZVa410SRusYVdmRtXqn3WwkLFiYjglMHjGxOt8ehwZUalvjPAr4dbQzpP2x0mOYD0QdPvMWbF8ap+O56ygcKionTC8nznvgwknCzO/VoMbBIZdzXWizwsxJVkmv5qqfjL5mhJ6DBLNaCcoQo1YGrciG03VyC0RefHDS9i+afClMbRgd3YDguOuhAeO6jOxRufnJuSOyJBn/iYEpT4VwEa5An9Eos5mZ9lVXVfm0KTCNHgFnya5fVfxxb0eIA8hSQsS7MmVICI8EdMkNL5Psj+BAgaesgmnPQTMPFGmsshBie3EBvXP1z3vhyykudHTCTpMA1Fvxpz4a9xIm0SizBuHs4wrlAxc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(18002099003)(56012099003)(22082099003)(11063799006)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	G9lYRlLdLrYzPB2ovPwk2pcTJ8ObqXhh2ZOHjSBi8E/eSafifAPb+2DP4GlyoNA0BQ/FlH4rVpxJobLAFfH9Mu7PK5vzqZV0KSgdipe4w9p4bcN2GSu4vU38TS18wDVWeJmnnKrhiy761em/yVr74TQCVS6JCvn0y2cNYIZJVfeiGyfk5aCFZya4Nz3fG4qxBGtFigIdkK0Kt/42Z6i7W68rsrY3Hl5Vq6e6nd0GIOpt/qNbuiMY9t/PhjLmCRDwB8h/ZsWi4UsC34umf3YzmeAdjMqOIWW+eqA4605RKhlS2w3xkk7Kp53OyfvX/nuq96ppkMLTZkjzSI7NnQgJLXMrl/qx4fPB/j8p3/jMbzOBKr6De+BUMxmPEmXlIAMbrstuTvrAmpSBb9GgzRxh0DHzOBF0yFDokZKIhqzP8s+3aRPuis9S979z9KpxyeGc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 09:55:44.9962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0427c6d-3710-4f66-310e-08deba43ca2e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8119
X-purgate-ID: tlsNG-16d1c6/1779702951-87371D75-1C197089/0/0
X-purgate-type: clean
X-purgate-size: 2124
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.975];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 576695C8D60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 22-May-26 08:18, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> On Arm GICv3 systems, Dom0 may use the host GIC layout, for example
> when it is the hardware domain. In that case the effective Dom0 vCPU
> count is not only bounded by the requested dom0_max_vcpus value and
> Xen's generic vCPU limits. It is also bounded by the redistributor MMIO
> regions that can be exposed for the host layout.
> 
> Document that Xen can only create Dom0 vCPUs whose virtual redistributor
> frame is covered by those regions, and that secondary vCPU creation stops
> at the first vCPU whose virtual redistributor frame is not covered.
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
>  docs/misc/xen-command-line.pandoc | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index d46d5b2152..0a5589b24c 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -981,6 +981,14 @@ The number of VCPUs to give to dom0.  This number of VCPUs can be more
>  than the number of PCPUs on the host.  The default is the number of
>  PCPUs.
>  
> +On Arm systems using GICv3, Dom0 may use the host GIC layout, for example
It's not dom0 specific. It can by any domain using host memory layout meaning
dom0, hwdom, domU direct mapped, in which case I'm not sure if such comment
should belong here given that this behavior is not dom0_max_vcpus specific (same
could be triggered on your setup with dom0less domU, direct-mapped and 17 vCPUs).

> +when it is the hardware domain.  In this case, this value is also limited
> +by the redistributor MMIO regions that can be exposed for that layout.
> +Xen can only create Dom0 VCPUs whose virtual redistributor frame is
> +covered by those regions.  If the requested number of VCPUs exceeds that
> +limit, secondary VCPU creation stops at the first VCPU whose virtual
> +redistributor frame is not covered.
> +
>  Or:
>  
>  > `= <min>-<max>` where `<min>` and `<max>` are integers.

~Michal


