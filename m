Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 05ePJ4nBJ2qB1gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 09:32:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D636E65D3C3
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 09:32:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=EnZBnJd8;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1332419.1594875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWqwX-0006u6-1X; Tue, 09 Jun 2026 07:32:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332419.1594875; Tue, 09 Jun 2026 07:32:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWqwW-0006sJ-UR; Tue, 09 Jun 2026 07:32:12 +0000
Received: by outflank-mailman (input) for mailman id 1332419;
 Tue, 09 Jun 2026 07:32:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wWqwV-0006sC-NS
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 07:32:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWqwU-004rF8-Po
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 09:32:10 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a27c175-2eae-0a2a0a5409dd-0a2a4509bb6a-18
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 09:32:10 +0200
Received: from [52.101.85.69]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a27c178-2497-0a2a45090019-34655545321b-4
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 09:32:09 +0200
Received: from MN2PR08CA0023.namprd08.prod.outlook.com (2603:10b6:208:239::28)
 by DS7PR12MB6165.namprd12.prod.outlook.com (2603:10b6:8:9a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 07:32:02 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:208:239:cafe::40) by MN2PR08CA0023.outlook.office365.com
 (2603:10b6:208:239::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 07:32:02 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 07:32:02 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 9 Jun
 2026 02:31:59 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 9 Jun 2026 02:31:58 -0500
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
 b=YFdr1jM81IKWbNeCwavkNQEJJ905P9aigHnV572OIaurllRWc1pLZJg2L5aU0kOQg2aIDx96ArVyngIDA3yq6Lbr1mjMHahOlGEaot7yHcV8MpjH2jG9H9TKkmtQeGuygFHqp5+ax7RYkutvp0FV2jr/WFV3YF/2UVsdYfQ9ovPiw2RJyZLHQzugwZcM5zMj78vKt5yQMX/vTxV5N/0wefRTTiKs9tsHFCAxvOSXYULSE6XYZQIGwU+U6E4VILDljDu49vZiNZeUTjzyrZA/eTGsNqiQq3emUWt6N3KHVMDodc0d0vJij386pQqQG5vx4ZZVMzXUPtNagAGE4RFyvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QgJXTAGBPEZt6IEiGr0L6aVFDGsmQc/peIzLjg4ueLQ=;
 b=BSTute5RguHagYm8aT8txV1pVOf8dcp8sn+giHU87jXc7dlwRkKDev9ST8PpTSsUajlXxnMu/CYOzlmj01gMaA3yFqwQKyQjnj5uq8rD1hLhhd3nrSniXJbVtOT82y0rgAd9YvziPNl36KKJqcX1nu6p7uxqXZDi01Goz1fFtaz5BjxexsTZdcgYLODqy/6PBlSsgJVnuNvXhTTHcci24BpEjL3WdXhqC9ZIlHrfw/7nY8m7WgfU1HducCD59g1s48UfxyN+08z2VVSnV5H9lQ9BBMxG63oYEGDeU9zrY5J+lB9O8aOHWQVCxt16/QOYDnrQoU9UUx9fRpGVzrk2nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QgJXTAGBPEZt6IEiGr0L6aVFDGsmQc/peIzLjg4ueLQ=;
 b=EnZBnJd8blOg8HSuVXJTpBIgtVS3gfyZ+p4/hMv4JizkK0DRtod0tX3YvIDy0h3a8IXuoUX07KZ1nnQWAlpvYektQIRsh5kOIExgPV4+2RXCOMB5XM0m5KAy82x8uYJAXp25acQYb7jn26uUdalzRov9LhFhcyZW4/DkHMLQy/U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <03bca529-419a-4c14-b229-7e47e8e36e7a@amd.com>
Date: Tue, 9 Jun 2026 08:31:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v3 2/2] device-tree: validate hwdom bank 0 boot
 placement
To: Mykola Kvach <xakep.amatop@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
References: <cover.1780896733.git.mykola_kvach@epam.com>
 <916609a0c6e66dd24e4435d31a165a1326fe5281.1780896733.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <916609a0c6e66dd24e4435d31a165a1326fe5281.1780896733.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|DS7PR12MB6165:EE_
X-MS-Office365-Filtering-Correlation-Id: daddb8c7-306c-44f8-9e5d-08dec5f9330b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|1800799024|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Rr1zXgVD3x9jQNK2ZaY1xrI3zvsSXynKb/WXfhPUCaD5DQDBoFcV/HRPnAVD6zNufZ9yTWiqQABlYtPh9z8pUBZ/1mGkMgHc/i93q4vJuQy1S+SuZt4zU7vdXEfA4dQx4/MtIQb1wlhK0Q1zRp6+QK1iYxGZf/V+9wGRCMNOTM647DHgWUpDrmdA8qW216xVvKcCmrFwuQqWOv5oQurt8jDhh8AT9q1xMuPkhovEbI24bdc0j3JoOKbnOKdc2yeAhNDPTrCPIfuMd9g3B/5Vs/y7DwMiiKBkisA2fL9fvASyAFm/GAu2H1fpuI7S6Bb3nPgEdbA2ZgkAPiqjsh9r8pwCstQ0rPHJK91TXyaCLhT2y6xFE2ZZffbeBxgS1xomq2xMmyT+LvwFLbspf5ANE6fBqp/6Fn2UQdVE2dFDh8V65EQiNYKJigKVB/De9koS9n+pKm+wnsZKnqXsqX7p/nagn1NXytWZPoYQbkPRZU351cN66jXeVynXs0Oy01/bOnvBHaIRFIq4D77NDPiGQtoacv4s4/sfyL8s2Y/+3Jw1nkGgO6lBv6mCb+SyNr2sjx7qLIB8LFtUJ1DwT5ad9P1eieIzabp41ZDniq5tl5OhSpZ2De55rqAa9eRU/0KjtZUFLHUsNz7WPWOSMQyNJmdjUD2eza3+Y7pVcB3rhlvMRlCXbwe0it3FmMXTLfpl
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(1800799024)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	17nuF1mVM379JSxIxCrVBms8fwlQuOhUjaNLyaANj3CQoA73hMXtlSH27mQZtfANuwvmy5IiEapPHapQW2AM3AFogqdFD2HnS3V8h6S5o4V+WT4HxdNXdjQ75IFOlbx2rjd77wHZbD7Xvr+MBOcRUIUuc1ZT1WH0f5ja5b//+eY4fxRQSa3N75HgE5+zwZCljNcK0njZtaEKfShm8c4xpxl7FN2RbVthgJZQwevjxsZK0NtERM7kCJkFOsZ4LAgz1sdPDGh+s5CqZQY1OxA13X9MmxlzN/RCWSZE9heu89gBnCMi2RfD7uWYCSf1VnPfVL6etDeAAuEvFFo4ulVxHpBLbEMZa14o4KiyzsHh3yWd1UavOtHVUmJTIys8ybMjjtfRuIQbgyUdTtdcJeQft6aCu6RWTbST/h2TuH/L4ESgb0IXdwyOdKj/oSCzqe9l
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 07:32:02.6755
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: daddb8c7-306c-44f8-9e5d-08dec5f9330b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6165
X-purgate-ID: tlsNG-bad1c0/1780990330-42573A53-47EA0EE7/10/73395122804
X-purgate-type: spam
X-purgate-size: 12951
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:xakepamatop@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FREEMAIL_CC(0.00)[epam.com,kernel.org,xen.org,arm.com,citrix.com,vates.tech,suse.com,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D636E65D3C3



On 08-Jun-26 07:39, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> With LLC coloring enabled, the hardware domain memory is allocated by
> allocate_hwdom_memory() rather than by using the fixed direct-map layout.
> 
> Commit de99f3263555 ("device-tree: Improve hwdom memory allocation for
> DMA") made that allocator prefer lower host regions. The first-bank
> filter, however, still only checked the old 128MB heuristic. A low region
> can satisfy that heuristic but still be too small, or otherwise
> unsuitable, for the hardware-domain kernel and the DTB/initrd area to fit
> in bank 0 according to the Arm placement rules.
> 
> Keep the existing first-bank size policy and add an architecture-specific
> candidate check. On Arm, compute the kernel load address for the
> candidate bank using the same logic as kernel_zimage_place(), verify that
> the kernel range is covered by that bank, and then reuse the same
> DTB/initrd placement helper as place_dtb_initrd(). The FDT is generated
> later, so use the hardware-domain FDT allocation size as a conservative
> upper bound for the final DTB size.
> 
> Check the candidate after capping the host region by the remaining
> unassigned hardware-domain memory, so the validation is performed against
> the size that would actually become bank 0.
> 
> This keeps the DMA-oriented allocation policy from de99f3263555 while
> preventing a too-small bank 0 from reaching place_dtb_initrd().
> 
> Make kernel_zimage_place_in_bank() return INVALID_PADDR when a
> position-independent zImage cannot be placed in the supplied bank; the
> real load path turns this into a panic, while the hwdom candidate check
> uses it to reject the bank.
> 
> Fixes: de99f3263555 ("device-tree: Improve hwdom memory allocation for DMA")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v3:
> - Rename the architecture hook to
>   arch_hwdom_first_bank_can_fit_modules() and document its contract.
> - Drop the redundant post-alignment zImage load-address check.
> - Drop the dead kernel range overflow check.
> - Make the candidate-bank coverage condition explicit.
> 
> Changes in v2:
> - Split the behavior-preserving placement refactoring into the previous
>   patch.
> - Reuse the refactored Arm kernel and DTB/initrd placement helpers for
>   the first-bank candidate check.
> 
> Link to v1:
>   https://patchew.org/Xen/4f862bb2dc323914b8120b0f16af7516140cf42b.1780065103.git.mykola._5Fkvach@epam.com/
> 
> Changes since RFC:
> - Do not keep the RFC scalar minimum-size check.  It can both reject valid
>   layouts and accept layouts which still fail later.  Instead, validate
>   the candidate bank using the same kernel and DTB/initrd placement rules
>   as the load path.
> - Replace the scalar minimum-size check with arch_hwdom_first_bank_ok().
> - Validate fixed-address and AArch32 start == 0 kernel placement against
>   the candidate bank.
> - Check the candidate after capping the host region by the remaining
>   unassigned hardware-domain memory.
> - Treat the hardware-domain FDT allocation size as a conservative upper
>   bound because the final FDT is generated later.
> 
> Link to RFC: https://patchew.org/Xen/9ae4f7dd49f5b1f761193adae573c2675c92e883.1779051035.git.mykola._5Fkvach@epam.com/
> 
> Why the RFC scalar approach was not kept:
> 
> A simple minimum-size check is not sufficient here because the validity
> of the first bank depends on the actual Arm placement rules, not only on
> the aggregate size of the kernel, DTB and initrd. The DTB/initrd area may
> fit before a 64-bit Image loaded with a text offset, while an AArch32
> position-independent kernel may leave no valid module location even when
> the aggregate size appears to fit. Fixed-address kernels also need the
> candidate bank start to be considered.
> ---
>  xen/arch/arm/acpi/domain_build.c        |  2 -
>  xen/arch/arm/domain_build.c             |  8 ++++
>  xen/arch/arm/include/asm/domain_build.h |  4 ++
>  xen/arch/arm/include/asm/kernel.h       | 10 +++++
>  xen/arch/arm/kernel.c                   | 53 ++++++++++++++++++++++++-
>  xen/common/device-tree/domain-build.c   | 25 ++++++++----
>  xen/include/xen/fdt-kernel.h            | 14 +++++++
>  7 files changed, 105 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain_build.c
> index 249d899c33..db16f7fa94 100644
> --- a/xen/arch/arm/acpi/domain_build.c
> +++ b/xen/arch/arm/acpi/domain_build.c
> @@ -26,8 +26,6 @@
>  #undef virt_to_mfn
>  #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
>  
> -#define ACPI_DOM0_FDT_MIN_SIZE 4096
> -
>  static int __init acpi_iomem_deny_access(struct domain *d)
>  {
>      acpi_status status;
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 1efddc60ef..550617f152 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -115,6 +115,14 @@ int __init parse_arch_dom0_param(const char *s, const char *e)
>                               (IS_ENABLED(CONFIG_STATIC_SHM) ?         \
>                                (NR_SHMEM_BANKS * (160 + 16)) : 0))
>  
> +paddr_t __init hwdom_get_fdt_alloc_size(void)
> +{
> +    if ( acpi_disabled )
> +        return fdt_totalsize(device_tree_flattened) + DOM0_FDT_EXTRA_SIZE;
> +
> +    return ACPI_DOM0_FDT_MIN_SIZE;
> +}
> +
>  unsigned int __init dom0_max_vcpus(void)
>  {
>      if ( opt_dom0_max_vcpus == 0 )
> diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
> index df8b361b3d..85cf46a958 100644
> --- a/xen/arch/arm/include/asm/domain_build.h
> +++ b/xen/arch/arm/include/asm/domain_build.h
> @@ -19,6 +19,10 @@ int prepare_acpi(struct domain *d, struct kernel_info *kinfo);
>  
>  int add_ext_regions(unsigned long s_gfn, unsigned long e_gfn, void *data);
>  
> +#define ACPI_DOM0_FDT_MIN_SIZE 4096
> +
> +paddr_t hwdom_get_fdt_alloc_size(void);
> +
>  #if defined(CONFIG_MPU) && defined(CONFIG_ARM_64)
>  /* Utility function to determine if an Armv8-R processor supports VMSA. */
>  bool has_v8r_vmsa_support(void);
> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
> index 21f4273fa1..b86c7337fe 100644
> --- a/xen/arch/arm/include/asm/kernel.h
> +++ b/xen/arch/arm/include/asm/kernel.h
> @@ -8,12 +8,22 @@
>  
>  #include <asm/domain.h>
>  
> +#include <xen/types.h>
> +
> +struct kernel_info;
> +
>  struct arch_kernel_info
>  {
>      /* Enable pl011 emulation */
>      bool vpl011;
>  };
>  
> +#define arch_hwdom_first_bank_can_fit_modules \
> +        arch_hwdom_first_bank_can_fit_modules
> +bool arch_hwdom_first_bank_can_fit_modules(const struct kernel_info *info,
> +                                           paddr_t bank_start,
> +                                           paddr_t bank_size);
> +
>  #endif /* #ifdef __ARCH_ARM_KERNEL_H__ */
>  
>  /*
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index d1be4d8074..47229644b2 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -64,6 +64,9 @@ kernel_zimage_place_in_bank(const struct kernel_info *info,
>          load_end = bank_start + bank_size;
>          load_end = MIN(bank_start + MB(128), load_end);
>  
> +        if ( load_end - bank_start < info->image.len )
> +            return INVALID_PADDR;
> +
>          load_addr = load_end - info->image.len;
>          /* Align to 2MB */
>          load_addr &= ~(MB(2) - 1);
> @@ -164,9 +167,55 @@ static void __init place_dtb_initrd(struct kernel_info *info,
>  static paddr_t __init kernel_zimage_place(struct kernel_info *info)
>  {
>      const struct membanks *mem = kernel_info_get_mem(info);
> +    paddr_t load_addr;
> +
> +    load_addr = kernel_zimage_place_in_bank(info, mem->bank[0].start,
> +                                            mem->bank[0].size);
> +    if ( load_addr == INVALID_PADDR )
> +        panic("Unable to find suitable location for the kernel\n");
> +
> +    return load_addr;
> +}
> +
> +bool __init arch_hwdom_first_bank_can_fit_modules(const struct kernel_info *info,
> +                                                  paddr_t bank_start,
> +                                                  paddr_t bank_size)
> +{
> +    const struct boot_module *initrd = info->bd.initrd;
> +    /*
> +     * place_dtb_initrd() rounds the DTB and initrd placement to 2MB boundaries;
> +     * use the same granularity when checking whether the first bank can hold
> +     * them.
> +     */
> +    const paddr_t initrd_len = ROUNDUP(initrd ? initrd->size : 0, MB(2));
> +    /*
> +     * The hardware domain FDT has not been generated yet. Use the allocation
> +     * size as a conservative upper bound for the final DTB size.
> +     */
> +    const paddr_t dtb_len = ROUNDUP(hwdom_get_fdt_alloc_size(), MB(2));
> +    const paddr_t rambase = bank_start;
> +    const paddr_t ramsize = bank_size;
> +    const paddr_t dtb_initrd_size = initrd_len + dtb_len;
> +    const paddr_t ramend = rambase + ramsize;
> +    paddr_t kernbase;
> +    paddr_t kernend;
> +    paddr_t dtb_base;
> +
> +    kernbase = kernel_zimage_place_in_bank(info, bank_start, bank_size);
> +    if ( kernbase == INVALID_PADDR )
> +        return false;
> +
> +    kernend = kernbase + info->image.len;
> +
> +    if ( (kernbase < rambase) || (kernend > ramend) )
> +        return false;
> +
> +    if ( !first_bank_can_fit_modules(ramsize, kernbase, kernend,
> +                                     dtb_initrd_size) )
> +        return false;
>  
> -    return kernel_zimage_place_in_bank(info, mem->bank[0].start,
> -                                       mem->bank[0].size);
> +    return find_dtb_initrd_placement(rambase, ramend, kernbase, kernend,
> +                                     dtb_initrd_size, &dtb_base);
>  }
>  
>  static void __init kernel_zimage_load(struct kernel_info *info)
> diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
> index f3ba496f1e..30a59abfa7 100644
> --- a/xen/common/device-tree/domain-build.c
> +++ b/xen/common/device-tree/domain-build.c
> @@ -299,20 +299,31 @@ static bool __init allocate_hwdom_memory(struct kernel_info *kinfo)
>  
>      for ( i = 0; (kinfo->unassigned_mem > 0) && (i < nr_banks); i++ )
>      {
> -        paddr_t bank_size;
> +        const paddr_t bank_start = hwdom_free_mem->bank[i].start;
> +        paddr_t bank_size = hwdom_free_mem->bank[i].size;
> +
> +        /*
> +         * Check the size that would actually be assigned, not just the size
> +         * of the host region.
> +         */
> +        bank_size = min(bank_size, kinfo->unassigned_mem);
>  
>          /*
>           * The first bank must be large enough for place_dtb_initrd() to
>           * fit the kernel, DTB and initrd.  Skip small regions to avoid
>           * ending up with a tiny first bank.
>           */
> -        if ( !mem->nr_banks && (hwdom_free_mem->bank[i].size < min_bank_size) )
> -            continue;
> +        if ( !mem->nr_banks )
> +        {
> +            if ( bank_size < min_bank_size )
> +                continue;
> +
> +            if ( !arch_hwdom_first_bank_can_fit_modules(kinfo, bank_start,
> +                                                        bank_size) )
> +                continue;
> +        }
>  
> -        bank_size = MIN(hwdom_free_mem->bank[i].size, kinfo->unassigned_mem);
> -        if ( !allocate_bank_memory(kinfo,
> -                                   gaddr_to_gfn(hwdom_free_mem->bank[i].start),
> -                                   bank_size) )
> +        if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(bank_start), bank_size) )
>          {
>              xfree(hwdom_free_mem);
>              return false;
> diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
> index 00c37be101..61721d22a2 100644
> --- a/xen/include/xen/fdt-kernel.h
> +++ b/xen/include/xen/fdt-kernel.h
> @@ -93,6 +93,20 @@ kernel_info_get_mem_const(const struct kernel_info *kinfo)
>      return container_of(&kinfo->mem.common, const struct membanks, common);
>  }
>  
> +/*
> + * Return whether the proposed hardware-domain first RAM bank can contain the
To `contain a placement` reads weird. I think `satisfy` would be a better word
that clearly denotes the purpose i.e. check if the bank satsifies the placement
requirements (we can also add `requirements` word to the end of the comment).

Can be done on commit (it looks like there are some ECLAIR issues, so we need to
wait a bit to merge the series).

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


