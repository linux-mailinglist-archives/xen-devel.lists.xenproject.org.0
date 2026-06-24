Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nkDVLzmIO2pbZQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 09:33:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F21676BC31C
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 09:33:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=K1WZWdxM;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1344593.1603652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcI6E-0005ty-AH; Wed, 24 Jun 2026 07:32:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344593.1603652; Wed, 24 Jun 2026 07:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcI6E-0005rB-7T; Wed, 24 Jun 2026 07:32:42 +0000
Received: by outflank-mailman (input) for mailman id 1344593;
 Wed, 24 Jun 2026 07:32:40 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wcI6C-0005r5-8J
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 07:32:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcI6B-00EVY1-0h
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 09:32:39 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a3b880e-bab6-0a2a0a5309dd-0a2a45089cb2-48
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 09:32:38 +0200
Received: from [40.107.209.43]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a3b8814-9ee7-0a2a45080019-286bd12b2cab-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 09:32:38 +0200
Received: from CH2PR20CA0001.namprd20.prod.outlook.com (2603:10b6:610:58::11)
 by CH3PR12MB7763.namprd12.prod.outlook.com (2603:10b6:610:145::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 07:32:28 +0000
Received: from CH2PEPF0000009A.namprd02.prod.outlook.com
 (2603:10b6:610:58:cafe::a4) by CH2PR20CA0001.outlook.office365.com
 (2603:10b6:610:58::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.13 via Frontend Transport; Wed,
 24 Jun 2026 07:32:28 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000009A.mail.protection.outlook.com (10.167.244.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 07:32:28 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 24 Jun
 2026 02:32:28 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 24 Jun 2026 02:32:26 -0500
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
 b=t8ENUh9YFsLdinOKZunjy1jpO9+pIlvuT8ObaAiGBDE+PPcjwrtmoHBcoCAkb9TG568J9kzhHmJklUhCZK3XwccZ8CMh1FbE6TRWA8Zqsg6bdAA1bIJ1jhZdBMm/Wm5SkAhDoXzFE+qA1TpEMzZemp/AZOJh26TSZDMCCg5k73Vk/8U+yjm13LZ/77rAIR8uVBnbUAc33YAPHqaghxwGxKpqFVHuX8vvTTF3KaBcF8zp7zpjLSKjgmlNuhrnDlah94SYzcbyqBI20VQvM3cZU1bSRZzBwF9NbCCHhpjEAtunTJfEmf478IFkaVYYEmiivorAqkCHD6nQXe5qdmaG/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6weFsPdByucGL0R6eiDIgRHPYDNcyCA+OBVs4eXQNYY=;
 b=hkqgC2oaF8zf2cb+aZ4g8dEvPjMcvfmp13IsM8K5NhNrBOikkH2ko+gsIr4jz+zrwIOgSW0pn1tDvI/lkLiwqKdO/gz4jyRlEC/tn9OC5RUJxsJxAHk7TEdy5uC/1nyEkCeZxA57EAspTbmKJwtKzlWPuR8/SuQPW6m6fIHePUrXRg/2mGJqyrRCAxYZx0q7ydrDBMWrt1cqTLADHlGkRwgDIZdawa3CzPiBM7XoZ0ojC/rm9PFydLLUFXy8naTZUgwqlE6fm1EppMS9KS+aG8+s3hCi7+RORzQ7nqIjFtHcySinnMax6sVGKVHg7dF6ld5jv49LHP24N8S7rbu9Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6weFsPdByucGL0R6eiDIgRHPYDNcyCA+OBVs4eXQNYY=;
 b=K1WZWdxMgRoj+9FrfBXRJgIkHmg+NzDML2jEHbH5uuAwOSwR0YeIrSgdK2ifugjgv0OIsMQaWC5iuALNEez512OcZEce4UqguT9gRSYYk1UIR0ImBXBV4T0+jhT9exQm3at8DawVow6bVVVKJtOdIwy0Y1chz9NyiT8eECtszEE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <073c5ff2-5244-4e11-a9e3-e5ecd3ce31d2@amd.com>
Date: Wed, 24 Jun 2026 09:32:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/23] xen: arm: update p2m_set_allocation() prototype
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Romain Caritey <Romain.Caritey@microchip.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <a63794ac32e157ea44c3450fc5fb6f2842e00680.1781693963.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <a63794ac32e157ea44c3450fc5fb6f2842e00680.1781693963.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009A:EE_|CH3PR12MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: e3dfaa62-dd70-4f91-d470-08ded1c2bedc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|376014|7416014|82310400026|18002099003|22082099003|11063799006|5023799004|4143699003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	/AVgeasVvJfH3xUI7lDiaEGaplqYsSnXVF5amSZq09NYvnSKdme1oyBit0sED8fsH6Yc62TTJxi8NRIw14PwnnniASCUGg6C0LgIZ053P5u8ivze7rKq2BjzZrCjV8KZTYFxno3m7Hgprg6BksnrFoulfVEtg77MadxNH4Mq+dmFrIyuYuPSiubdnCLTIBBmfbneUTsHblds5ruFQ19xdachY5igYFw9mSgI8cFnYhp84o5TCaRoi3fY22pX0tNdn9g+0zFhn95YxbFNM2T7pXTSiOTtYsDRT+NTTDzr2seSDNCu4xx/iCATEXI5fUBKgaHbCFRpl4Sg4GmLvszQPbny6cMIqPTGy/18IO5ZLTBCfPxksaYI/fXbPo9Q+ZyLcr3nFhYkcKBmMdnOvZ7YI/y22MxTMRHjENBobK6x47VFo7YzOTyfsUledaUr0c8uTXFhrd7AztufvmpR9kP0qFmN/SxMGp1RS976UXmsD1DU1hyYIqxRObCqHzs3TW/eGubcOY8+WC/LPzOEQKy5LFjNTh90YaTvLjVBE3xnN6apalGzTdjKGiKLIS90UB/+91smS/pcdcBpCZ+s5AuiJ/tGui8Api4VmlpG7d1zTyMQWlgIIyJble2rYd72oD7DN6AMycYH+1BPRbPxkZnuXFVgYA14sRwsgXDzkl+YM/yiG6MNXEOYjEKmCj6LlMbY3cO95XNwJCzkb0occInIvA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(376014)(7416014)(82310400026)(18002099003)(22082099003)(11063799006)(5023799004)(4143699003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yOpklT3E4jA8Sk4ylEcWCUm+iArRIp2YrF4ZdkIQcExFohRWHro6EupdTfWQJAZ0eexZQahet4C0AosrcHydZ6R+WT4nXKNq8Rvny9tsIi5RoFKZFGdO0PAWkfd71wkavNpz4FSfjgnBo7h7MUC0WOyz+MXi51rH72pxlcoL6krJU5WQVl9lQ+cMmVn2t2J6vYmHbxoVyHZGI1JmqdTT07wwn2bEzD+TnPXD73JijrqhrUYO3ZNgzLswgsv6Clkf/8lP3CtmtJKkgTMBsb6eizPpHGE9JZPuyIYUvOu7EuXgFu3rWwlaWlH6FSJuHydhNTx9rNFIm4ECsHk/mPOE6KQPix05TvqannZF5gMJFBnDdoPjMYvEHa3VNh+knGenifF03fWseOoz9VT9Wox5/Re5pilQfj4C71xj0+SwxlUk3xAGnKnSaF1fm61AEhik
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 07:32:28.8884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3dfaa62-dd70-4f91-d470-08ded1c2bedc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7763
X-purgate-ID: tlsNG-c1860d/1782286358-5DBF30FA-3E41250A/10/73395122804
X-purgate-type: spam
X-purgate-size: 8784
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
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[microchip.com,kernel.org,xen.org,arm.com,epam.com,citrix.com,vates.tech,suse.com,wdc.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,amd.com:dkim,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F21676BC31C



On 17-Jun-26 13:17, Oleksii Kurochko wrote:
> p2m_set_allocation() signals preemption redundantly: via a bool *preempted
> out-argument (set to true) and via -ERESTART return code, both at the same
> time. This led to the caller-side ASSERT(preempted == (rc == -ERESTART))
> added solely to document their agreement.
> 
> Drop the out-argument entirely. The return code alone is sufficient to
> distinguish preemption (-ERESTART) from success (0) or other failures.
> Replace the pointer with a plain bool can_preempt that controls whether
> the preemption check is performed at all, making the previous
> NULL-to-suppress-preemption calling convention explicit and type-safe.
As Andrew said, this paragraph contradicts the first one i.e. we still need to
pass whether to perform the check or not, so it's not redundant.

> 
> Since p2m_set_allocation() is called by the common dom0less build code,
> move its declaration from the ARM-specific asm/p2m.h to xen/p2m-common.h.
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v3:
>  - Nothing changed. Only rebase.
> ---
> Changes in v2:
>  - new patch
> ---
> ---
>  xen/arch/arm/include/asm/p2m.h          |  1 -
>  xen/arch/arm/mmu/p2m.c                  | 22 ++++++++--------------
>  xen/arch/riscv/include/asm/paging.h     |  2 +-
>  xen/arch/riscv/p2m.c                    |  7 ++++---
>  xen/arch/riscv/paging.c                 |  7 ++-----
>  xen/common/device-tree/dom0less-build.c |  2 +-
>  xen/include/xen/p2m-common.h            |  2 ++
>  7 files changed, 18 insertions(+), 25 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
> index 4a4913716bdd..737da60dcf58 100644
> --- a/xen/arch/arm/include/asm/p2m.h
> +++ b/xen/arch/arm/include/asm/p2m.h
> @@ -238,7 +238,6 @@ void p2m_restore_state(struct vcpu *n);
>  /* Print debugging/statistial info about a domain's p2m */
>  void p2m_dump_info(struct domain *d);
>  
> -int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted);
>  int p2m_teardown_allocation(struct domain *d);
>  
>  static inline void p2m_write_lock(struct p2m_domain *p2m)
> diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
> index 51abf3504fcf..e5c6be7c0890 100644
> --- a/xen/arch/arm/mmu/p2m.c
> +++ b/xen/arch/arm/mmu/p2m.c
> @@ -67,10 +67,11 @@ int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
>  
>  /*
>   * Set the pool of pages to the required number of pages.
> - * Returns 0 for success, non-zero for failure.
> + * Returns 0 for success, -ERESTART if preempted, or a negative error code on
It returns -ERESTART if preempted *AND* preemption is allowed - please clarify
in the description.

> + * failure.
>   * Call with d->arch.paging.lock held.
>   */
> -int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
> +int p2m_set_allocation(struct domain *d, unsigned long pages, bool can_preempt)
>  {
>      struct page_info *pg;
>  
> @@ -112,11 +113,8 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>              break;
>  
>          /* Check to see if we need to yield and try again */
> -        if ( preempted && general_preempt_check() )
> -        {
> -            *preempted = true;
> +        if ( can_preempt && general_preempt_check() )
>              return -ERESTART;
> -        }
>      }
>  
>      return 0;
> @@ -125,7 +123,6 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>  int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
>  {
>      unsigned long pages = size >> PAGE_SHIFT;
> -    bool preempted = false;
>      int rc;
>  
>      if ( (size & ~PAGE_MASK) ||          /* Non page-sized request? */
> @@ -133,27 +130,24 @@ int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
>          return -EINVAL;
>  
>      spin_lock(&d->arch.paging.lock);
> -    rc = p2m_set_allocation(d, pages, &preempted);
> +    rc = p2m_set_allocation(d, pages, true);
>      spin_unlock(&d->arch.paging.lock);
>  
> -    ASSERT(preempted == (rc == -ERESTART));
> -
>      return rc;
>  }
>  
>  int p2m_teardown_allocation(struct domain *d)
>  {
>      int ret = 0;
> -    bool preempted = false;
>  
>      spin_lock(&d->arch.paging.lock);
>      if ( d->arch.paging.p2m_total_pages != 0 )
>      {
> -        ret = p2m_set_allocation(d, 0, &preempted);
> -        if ( preempted )
> +        ret = p2m_set_allocation(d, 0, true);
> +        if ( ret == -ERESTART )
>          {
>              spin_unlock(&d->arch.paging.lock);
> -            return -ERESTART;
> +            return ret;
>          }
>          ASSERT(d->arch.paging.p2m_total_pages == 0);
>      }
> diff --git a/xen/arch/riscv/include/asm/paging.h b/xen/arch/riscv/include/asm/paging.h
> index e487c89a4ccd..103384723dc5 100644
> --- a/xen/arch/riscv/include/asm/paging.h
> +++ b/xen/arch/riscv/include/asm/paging.h
> @@ -9,7 +9,7 @@ struct page_info;
>  int paging_domain_init(struct domain *d);
>  
>  int paging_freelist_adjust(struct domain *d, unsigned long pages,
> -                           bool *preempted);
> +                           bool can_preempt);
>  
>  int paging_ret_to_domheap(struct domain *d, unsigned int nr_pages);
>  int paging_refill_from_domheap(struct domain *d, unsigned int nr_pages);
> diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
> index 703b9f4d2540..41d6d3d5e699 100644
> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -430,15 +430,16 @@ int p2m_init(struct domain *d, const struct xen_domctl_createdomain *config)
>  
>  /*
>   * Set the pool of pages to the required number of pages.
> - * Returns 0 for success, non-zero for failure.
> + * Returns 0 for success, -ERESTART if preempted, or a negative error code on
> + * failure.
>   * Call with d->arch.paging.lock held.
>   */
Move the description where a prototype lives. This way you will avoid adding one
at each definition (remove from here and Arm then).

> -int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
> +int p2m_set_allocation(struct domain *d, unsigned long pages, bool can_preempt)
>  {
>      struct p2m_domain *p2m = p2m_get_hostp2m(d);
>      int rc;
>  
> -    if ( (rc = paging_freelist_adjust(d, pages, preempted)) )
> +    if ( (rc = paging_freelist_adjust(d, pages, can_preempt)) )
>          return rc;
>  
>      /*
> diff --git a/xen/arch/riscv/paging.c b/xen/arch/riscv/paging.c
> index 76a203edbb0c..35f572689a7c 100644
> --- a/xen/arch/riscv/paging.c
> +++ b/xen/arch/riscv/paging.c
> @@ -47,7 +47,7 @@ static int _paging_add_to_freelist(struct domain *d)
>  }
>  
>  int paging_freelist_adjust(struct domain *d, unsigned long pages,
> -                           bool *preempted)
> +                           bool can_preempt)
>  {
>      ASSERT(spin_is_locked(&d->arch.paging.lock));
>  
> @@ -66,11 +66,8 @@ int paging_freelist_adjust(struct domain *d, unsigned long pages,
>              return rc;
>  
>          /* Check to see if we need to yield and try again */
> -        if ( preempted && general_preempt_check() )
> -        {
> -            *preempted = true;
> +        if ( can_preempt && general_preempt_check() )
>              return -ERESTART;
> -        }
>      }
>  
>      return 0;
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index eacfd93087ae..c3818ffed45f 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -747,7 +747,7 @@ static int __init domain_p2m_set_allocation(struct domain *d, uint64_t mem,
>                  domain_p2m_pages(mem, d->max_vcpus);
>  
>      spin_lock(&d->arch.paging.lock);
> -    rc = p2m_set_allocation(d, p2m_pages, NULL);
> +    rc = p2m_set_allocation(d, p2m_pages, false);
>      spin_unlock(&d->arch.paging.lock);
>  
>      return rc;
> diff --git a/xen/include/xen/p2m-common.h b/xen/include/xen/p2m-common.h
> index f0bd9a6b9896..1b44ec8ce36c 100644
> --- a/xen/include/xen/p2m-common.h
> +++ b/xen/include/xen/p2m-common.h
> @@ -43,5 +43,7 @@ int __must_check check_get_page_from_gfn(struct domain *d, gfn_t gfn,
>                                           bool readonly, p2m_type_t *p2mt_p,
>                                           struct page_info **page_p);
>  
> +int p2m_set_allocation(struct domain *d, unsigned long pages,
I think it's worth adding __must_check given that rc is now the only preemption
status checker.

~Michal


