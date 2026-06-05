Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NC1IOVeBImrUZAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:57:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB5A646319
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:57:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=2El8IEqj;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1329144.1593355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVPQJ-00044t-ME; Fri, 05 Jun 2026 07:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329144.1593355; Fri, 05 Jun 2026 07:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVPQJ-00042J-J2; Fri, 05 Jun 2026 07:56:59 +0000
Received: by outflank-mailman (input) for mailman id 1329144;
 Fri, 05 Jun 2026 07:56:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wVPQI-00042B-MM
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 07:56:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVPQH-00D1Pa-Kz
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 09:56:57 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a228138-2eae-0a2a0a5409dd-0a2a4507952a-22
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:56:57 +0200
Received: from [40.107.200.31]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a228147-229c-0a2a45070019-286bc81f0c65-4
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:56:56 +0200
Received: from DS7PR03CA0018.namprd03.prod.outlook.com (2603:10b6:5:3b8::23)
 by SJ1PR12MB6315.namprd12.prod.outlook.com (2603:10b6:a03:456::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Fri, 5 Jun 2026
 07:56:49 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:5:3b8:cafe::4) by DS7PR03CA0018.outlook.office365.com
 (2603:10b6:5:3b8::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Fri, 5
 Jun 2026 07:56:48 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 5 Jun 2026 07:56:48 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 5 Jun
 2026 02:56:47 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 5 Jun
 2026 02:56:47 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 5 Jun 2026 02:56:45 -0500
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
 b=J3maC6EL3Hntau8hVZMdaiucmLfoFRZpemSKUU4u1l2WAge9Z1DtDOWxwQ+CceWz/B9W/5yQovoH8Zvp8Mjd/4EyHFOdlOKbhLD+6v4MswMPMAdtDf47ubj6K2i3AzkkuOPoPgXI6ytVzASkCneo3Dun8RftbR0nFCJ19p/4WNeSIVfF6/hEkO+W3moActA3A4c/VzjHoRn2wdvelCSFO96sXfhKiInmGkLELyFJeJmxpv6Xic2AusRXiwTxPNOMNhBJaQTGnVtT9AotAwgGgNcUQluG9GJ0+pIa8zhCLhW8psGL8MZtaFMw5i61y1szKPc/0pdyzP4Z6ose7Xe7cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQcV+P1ejzC8u8T+voQc03sY1/oaEoTHIFElxOM54vU=;
 b=JR2fNFfJirqxWdq0KH8e7LnUG3a+T8Rz9eVSOdtikN/DwmxPVdJNkySQU8aDWgMdyxwFiaRnoFjzZdyogGX+DXXDENPT9WLJnaKHAis1EX+/qUSmeJ6GNTB5OjZHluLnWEhCryl8t/LoYL5SAtQN8bzqNEvYiY+QKX+U5cr3Ttto2ReT0gsFp+K4k+wnv3r2C/EqHGQnMt2t4oWnJNstau54cAI2mcSO9iKYbTQg0Vm+in7teoplLC1bbSDFXqYUkTFtgA6uDK/PUb3R+P0cCvaRMjCRNy8FwB6rG5IH6gUaNLenf1qojAjo1Aryo3iulo95+bNSaz4Sp5NhcRZwag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQcV+P1ejzC8u8T+voQc03sY1/oaEoTHIFElxOM54vU=;
 b=2El8IEqjinySTBQI5yWrEDv2HVToWnNMZF+ijYXHt71gpCQFOok01yPpW51BA9vitQc8Nly4Jg9OOEmtmAImVJUfo2yyS1oRIZeowBoQVV+dXEspX9/sibVIoRZwcZgnM/2KjKaQwbZhRF+JgnMNNXn6V6bmtSafJNTwA20B7CA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <f4ec4ef1-9051-4dea-a1ae-0966ec46296e@amd.com>
Date: Fri, 5 Jun 2026 09:56:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2 2/2] device-tree: validate hwdom bank 0 boot
 placement
To: Mykola Kvach <xakep.amatop@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
References: <cover.1780602987.git.mykola_kvach@epam.com>
 <e21cd3c7274eac76607b551134f3f23665a31d7c.1780602987.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <e21cd3c7274eac76607b551134f3f23665a31d7c.1780602987.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|SJ1PR12MB6315:EE_
X-MS-Office365-Filtering-Correlation-Id: e79bc4ae-072c-47ba-d901-08dec2d7ff3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|82310400026|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NIZ3SJ8xauPCzF3mVmnjunR8lU2FXzijTqRFEWXBa5zDh9RCZo29+iFFAC5u3I6/zIjsJJd7J9HcCBU2cfh5XpEtM7N2dBfZnsQanoLiXz//3eR6vb8QnWTWpb4IxfK5AOsOHpEQPdciQYN4LcE8u0Z3efQyMfPd4DqKkgdmukCi1R5ZyGRtyW9cEiDxgHIHmNZgp2iy2pfXm14RL8LlbGC+RdAjJgYu518yNM/m11sIR8aWZlHdMbohQTYvYwk9hzjfVfaA5KlPCh1CSUtIMVXtClaLxXVqRZ3CmWD/dYVinV0UO4DSWhZOFT3XMDIaalLCh4/JFLJBvyVQvsKtYqmP2+SHKApCJ5+46iXCuwH9o7PWPWh7rmIoeNgnG5aY2Cot5NxFP63WZLH+9/DO/etjDVhR8B9wTAJ9ZDt5CTWLlsqGZeLYrKPgfyIQ37hWtilZg04fX+CmAmNFkI1+Xri+C2i+hs7+TDzHc+WFMXIIMdXLHjgWCffoiVgkErfGzcr18gzyIrWPdhmH0+2ny6Zv/0aHbII/L1JrjPjtBWAfKLLrTWqJpFxSWHlISzxh74a+Hq5OLNzgSa/ZDBYLO5VZt7/5IcnCMuoKJkeKzmPNXC7TNoIvMXtHGudj6IoqZMaRLWPWr87xQBiEsYU7TL0qdYY/UtY4pXdahKKc4DzQ8UtSmJLLK8Xa7jzTxUbX
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(82310400026)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iilBAEJviaIxzAyW7Dqf4VEjb0SoMcwElddDKwbEZMCtF3c/xYUd1r1WbMgEwQcNZ5WRHK85IgcMZr6I9Yp4zTHF43ZmyY0SzD5nfvne/8ogaJ1Za0deUkjLifBdLEu333O+nY5b6M3qtnDAKIIs+piGPmOJyOUlKiHTCkzdQnKsbXGrQA7jVvv/LInQpxs6C1IFUVjMcH7eZCPtu2aUKcMrTpfQNdrtflgdNQ9keirmqx2LQe1+tXmmxUC+KBffhZp0gOUJlH2ZNl16UkN0FJ9RDoCVqVhz88R+SsWPpSjnwmF6k25jyFQsS5nWt7zAdcCehmcriBJSAhgUPhMAdP4+nHTsteN2KDJ5KYKsZQK97C6GxxSa5GKUS7GGEKHwAVzNVd/0WzmulcK8IqTo8erFDnu53rFcTKpSBpBtLCJJPFNJWziqAY3IkZzDkpoR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 07:56:48.8500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e79bc4ae-072c-47ba-d901-08dec2d7ff3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6315
X-purgate-ID: tlsNG-ef75cf/1780646217-0B57BC48-1EAF5F57/0/0
X-purgate-type: clean
X-purgate-size: 12672
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:xakepamatop@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[epam.com,kernel.org,xen.org,arm.com,citrix.com,vates.tech,suse.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,amd.com:mid,amd.com:from_mime,amd.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,patchew.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2FB5A646319



On 05-Jun-26 07:19, Mykola Kvach wrote:
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
> ---
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
>  xen/arch/arm/include/asm/kernel.h       |  9 ++++
>  xen/arch/arm/kernel.c                   | 57 ++++++++++++++++++++++++-
>  xen/common/device-tree/domain-build.c   | 24 ++++++++---
>  xen/include/xen/fdt-kernel.h            |  9 ++++
>  7 files changed, 102 insertions(+), 11 deletions(-)
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
> index 21f4273fa1..bf14fb208a 100644
> --- a/xen/arch/arm/include/asm/kernel.h
> +++ b/xen/arch/arm/include/asm/kernel.h
> @@ -8,12 +8,21 @@
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
> +#define arch_hwdom_first_bank_ok arch_hwdom_first_bank_ok
> +bool arch_hwdom_first_bank_ok(const struct kernel_info *info,
> +                              paddr_t bank_start,
> +                              paddr_t bank_size);
> +
>  #endif /* #ifdef __ARCH_ARM_KERNEL_H__ */
>  
>  /*
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index d1be4d8074..ecea2822a1 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -64,9 +64,15 @@ kernel_zimage_place_in_bank(const struct kernel_info *info,
>          load_end = bank_start + bank_size;
>          load_end = MIN(bank_start + MB(128), load_end);
>  
> +        if ( load_end - bank_start < info->image.len )
> +            return INVALID_PADDR;
> +
>          load_addr = load_end - info->image.len;
>          /* Align to 2MB */
>          load_addr &= ~(MB(2) - 1);
> +
> +        if ( load_addr < bank_start )
> +            return INVALID_PADDR;
>      }
>      else
>          load_addr = info->image.start;
> @@ -164,9 +170,56 @@ static void __init place_dtb_initrd(struct kernel_info *info,
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
> +bool __init arch_hwdom_first_bank_ok(const struct kernel_info *info,
> +                                     paddr_t bank_start,
> +                                     paddr_t bank_size)
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
> +    if ( kernbase == INVALID_PADDR ||
> +         info->image.len > INVALID_PADDR - kernbase )
Max IPA is 48bit, far from 64bit, where the arch max is 52bit and image.len is a
kernel image size, so kernbase + image.len cannot wrap a 64-bit paddr_t, so this
check is dead. Drop it.

> +        return false;
> +
> +    kernend = kernbase + info->image.len;
> +
> +    if ( kernbase < rambase || kernend > ramend )
Please add braces around individual expressions.

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
> index f3ba496f1e..2e806c1b09 100644
> --- a/xen/common/device-tree/domain-build.c
> +++ b/xen/common/device-tree/domain-build.c
> @@ -299,20 +299,30 @@ static bool __init allocate_hwdom_memory(struct kernel_info *kinfo)
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
> +            if ( !arch_hwdom_first_bank_ok(kinfo, bank_start, bank_size) )
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
> index 00c37be101..71e2344b97 100644
> --- a/xen/include/xen/fdt-kernel.h
> +++ b/xen/include/xen/fdt-kernel.h
> @@ -93,6 +93,15 @@ kernel_info_get_mem_const(const struct kernel_info *kinfo)
>      return container_of(&kinfo->mem.common, const struct membanks, common);
>  }
>  
> +#ifndef arch_hwdom_first_bank_ok
> +static inline bool arch_hwdom_first_bank_ok(const struct kernel_info *info,
This should deserve a comment describing its contract.
Also, the name is not very descriptive: how about
arch_hwdom_first_bank_can_fit_modules() similar to generic Arm's
first_bank_can_fit_modules()?

Rest is ok.

~Michal


