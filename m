Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4F4VEDfTqGmlxgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 01:49:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B2F2099D0
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 01:49:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246135.1545410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxwtk-00029K-ST; Thu, 05 Mar 2026 00:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246135.1545410; Thu, 05 Mar 2026 00:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxwtk-000273-Pf; Thu, 05 Mar 2026 00:49:04 +0000
Received: by outflank-mailman (input) for mailman id 1246135;
 Thu, 05 Mar 2026 00:49:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2CHB=BF=amd.com=Edgar.Iglesias@srs-se1.protection.inumbo.net>)
 id 1vxwtj-00026v-Ab
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 00:49:03 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17252ede-182d-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Mar 2026 01:48:57 +0100 (CET)
Received: from MW4P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::16)
 by MW4PR12MB7360.namprd12.prod.outlook.com (2603:10b6:303:21a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Thu, 5 Mar
 2026 00:48:51 +0000
Received: from CO1PEPF00012E84.namprd03.prod.outlook.com
 (2603:10b6:303:115:cafe::ab) by MW4P220CA0011.outlook.office365.com
 (2603:10b6:303:115::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Thu,
 5 Mar 2026 00:48:32 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E84.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 00:48:51 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 4 Mar
 2026 18:48:51 -0600
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
X-Inumbo-ID: 17252ede-182d-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vet7qkzyVwXzNX0dFVcKbHFYfbXwG4ehSYVmAcWkU+9buyuTE3Wqp2vNNvBGJSGZkF/JwCDDuCdKJ9B1pW4lbSl2LSRBTO1Vnncgj9ZXt1EazMBxF4Zba42bHEo3+FNdWfMCBqyr+iFYrZZUHS2cwt252kyLKrCIvbNOXNM6Et3SuGcfAw2Z/Gps7XZ4VECR/xsOsvwsSdAUmxMkqDPIKsS+SSqAbIu49z+mzMFO+TK1Ivk7MylHvyW5my1bZyQcDt0jhJLxLOAPpvU47fygze30UgdObDzzqiYZPrsHfTW5UvxsPZYwIZuDKHh+6AHD2TDOxjTPHZ26G8k6iB//jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JIRQPm886RSi0wUulemYEN6mW0bQtLHWBDnqeSXByvM=;
 b=CeeKE67Y2w1tV/7VUi1/u/oW0hG0j8lufPdIXJNSrCu6vv5JYqYJqiSU+yuRflPglUtUDMi8cAKir+/IcZWpNYy+S+u3zYEGMUzvVIT8cMFEMWpJWnIL1ZsT6pVYoK9LIE00t+dH/9Q6B0/1UFatizVL3VexF6mGkr54TINvDw7xCQpZDdtLIUxMXmtJhV+spQcW2bM7LMTQZxOjJQtKdB9O07ButoT6vdLGzxaf6YRo5yww6UcCeMZ9oi0+FsAsuu/VNAwwGx+CWRNV8LXmBIAPTwT9E8w+R17xYrPEmW8Lut7e0oDTGWxBFKi0kmZvXwzEZG4WVrf3xhMqQeSgKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIRQPm886RSi0wUulemYEN6mW0bQtLHWBDnqeSXByvM=;
 b=DzJQBUsNCccr2eTfDj6O4Bst3yQixDU3jWTLjr5krU2jQwT8cha/1oXPHZ1fB66Pw/zby5Fd0Jqi8z0OXCXFalinKMa8SspCb/PBskSlGtcUaK+tVyMGThiptsqaRmk+Fz2DD6J7PrTmHbux7HCxOakiZZV+5C6rnjocLqcyFYo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Date: Thu, 5 Mar 2026 01:48:49 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, <qemu-devel@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, Philippe
 =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	<anthony@xenproject.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 3/5] physmem: xen: Conditionalize use of the mapcache
Message-ID: <aajS8ahPOaE_g5q1@zapote>
References: <20260304015222.979224-1-edgar.iglesias@gmail.com>
 <20260304015222.979224-4-edgar.iglesias@gmail.com>
 <alpine.DEB.2.22.394.2603041606480.250016@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2603041606480.250016@ubuntu-linux-20-04-desktop>
User-Agent: Mutt/2.2.14+84 (2efcabc4) (2026-01-25)
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E84:EE_|MW4PR12MB7360:EE_
X-MS-Office365-Filtering-Correlation-Id: 0530a134-e785-4650-3aec-08de7a50f870
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	aSrjvPGButsZ6z+3LAFs0fUt93q7c7LKl2Oqb9IfDHPbPOHPMb1/ZRa/2N/AfZtY9RNLgpfhop9RmUa75iIMZcvFuulRQJv6+XCfPC85eBVwbFC+1ZixclHldjripAAodUid9ku1mgXnIWahkQ14w/8rZ2itCTnQiX1AiV51PHTBxyXXR8yTFop5rTlV9IqF+tqpeJHRQBN7H5pTNk5Lbt96kjh6HTgp/GlNoptG5u1+9gp/5DQ7j/QNgGmssNfE6XfuEL3Y4AraHLwzZLt5WZk6t7OVyEOxTisMJA8mJlR4mM9d4DDB/Marz/mIzyREoCG5mDVdH/yjtHwT/CazaKV6r5oB6gniUprVhX2qvKX8yghNTqtsim0bQXcxwuF0TNVGVnAuI0yCxQy8RKjP9aEFFTWnhQFM0b/uJMhi/hncHzhSJJMXHgcEh3kCILANc6ItS3KCWdtPw2m/ZcxVHgYO+9wL+dxTuGnQFtF0KdBHXexchIjSyz8AoQzXRaUtB8zreNybdrsYMUMpcuvk+AnMY4vL0dQc+GDaM7X371sxiiTBXBoOmWuiE3HZW17WPrk+qyDALsTbwRNBnSRY1JrIDAS9o1R2fllWWcRpWU4qE13eUuqAUUpgUdXwO48cZF1T4z18Jxtb4J/ZpnL1WtJFeNKz72+eEeb0BysNdlOVhSYI6ZUHWc0THo4tbaJbEBX5ts5BxV0afKwNxiWo9z+kcjuEHou0czbBZX0gHUrGbJFAHLE/S+yoNJMwFvcZSf4HEaoibpH+xU2QRiLjMQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	txNWR7aYI+raqgKNKqS7mD7AT6urrqvmst5MvXsT6fATdPzWPCxssEkmkAPqoy3qjMWzJthY06ngIyifu/0tthYQfHEoI3pqlFL00r5dGU6rpP2vvM7F+yxqiBSckHh/MGQ1TN/n5wcL9dm0AQME55kiOcbTvL8XOt0nsakxWSHwvKE2dUaAVtk/doO4UiekFVW1ChtRN9O8JZkN3nkfnULGz8acaI6y0G269D16QwbeZv2xwco0U2nwfsIg1lfKS9kA8P4Iik8+j1tCkhJe+jOgT/eKC8+Dlh0WCg+nGgZHP6EiO9fIbQtwT0bA8vfaF0b4NcyJawLXKbox6KmI5Ng0WwAxcENDCLf5knaZXFEhFOIUoBHh94fCTTphypYDkbF6ljefH8oHPOVqzpxIsLejmB1JwrTpFOKo5oEYvZUVjvfVXkDUzhYZ1NvJfpVQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 00:48:51.6454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0530a134-e785-4650-3aec-08de7a50f870
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E84.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7360
X-Rspamd-Queue-Id: A3B2F2099D0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:edgar.iglesias@gmail.com,m:qemu-devel@nongnu.org,m:pbonzini@redhat.com,m:peterx@redhat.com,m:philmd@linaro.org,m:anthony@xenproject.org,m:xen-devel@lists.xenproject.org,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[edgar.iglesias@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,nongnu.org,redhat.com,linaro.org,xenproject.org,lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edgar.iglesias@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 04:07:23PM -0800, Stefano Stabellini wrote:
> On Wed, 4 Mar 2026, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> > 
> > Conditionalize use of the mapcache. This is in preparation
> > to optionally disable the mapcache at runtime.
> > 
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > ---
> >  system/physmem.c | 13 +++++++------
> >  1 file changed, 7 insertions(+), 6 deletions(-)
> > 
> > diff --git a/system/physmem.c b/system/physmem.c
> > index e5ff26acec..64e6d50f8f 100644
> > --- a/system/physmem.c
> > +++ b/system/physmem.c
> > @@ -578,7 +578,8 @@ MemoryRegion *flatview_translate(FlatView *fv, hwaddr addr, hwaddr *xlat,
> >                                      is_write, true, &as, attrs);
> >      mr = section.mr;
> >  
> > -    if (xen_enabled() && memory_access_is_direct(mr, is_write, attrs)) {
> > +    if (xen_map_cache_enabled() &&
> > +        memory_access_is_direct(mr, is_write, attrs)) {
> >          hwaddr page = ((addr & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE) - addr;
> >          *plen = MIN(page, *plen);
> >      }
> 
> All the other changes make sense. For this one, the code inside the if
> check is not strictly related to the mapcache. Are you sure it should be
> changed?

Hi, yes, when the mapcache is on, we limit translations to the current page
because the next page might not be mapped/locked or could be in a different
mapcache bucket with a different virtual address. When mapcache is off, guest
RAM is fully mapped (same as non‑Xen), so we can skip capping plen and allow a
larger mapping.

Perhaps we should add a comment to clarify?

Cheers,
Edgar

> 
> 
> > @@ -2577,7 +2578,7 @@ static void reclaim_ramblock(RAMBlock *block)
> >  {
> >      if (block->flags & RAM_PREALLOC) {
> >          ;
> > -    } else if (xen_enabled()) {
> > +    } else if (xen_map_cache_enabled()) {
> >          xen_invalidate_map_cache_entry(block->host);
> >  #if !defined(_WIN32) && !defined(EMSCRIPTEN)
> >      } else if (block->fd >= 0) {
> > @@ -2736,7 +2737,7 @@ static void *qemu_ram_ptr_length(RAMBlock *block, ram_addr_t addr,
> >          len = *size;
> >      }
> >  
> > -    if (xen_enabled() && block->host == NULL) {
> > +    if (xen_map_cache_enabled() && block->host == NULL) {
> >          /* We need to check if the requested address is in the RAM
> >           * because we don't want to map the entire memory in QEMU.
> >           * In that case just map the requested area.
> > @@ -2785,7 +2786,7 @@ RAMBlock *qemu_ram_block_from_host(void *ptr, bool round_offset,
> >      RAMBlock *block;
> >      uint8_t *host = ptr;
> >  
> > -    if (xen_enabled()) {
> > +    if (xen_map_cache_enabled()) {
> >          ram_addr_t ram_addr;
> >          RCU_READ_LOCK_GUARD();
> >          ram_addr = xen_ram_addr_from_mapcache(ptr);
> > @@ -3787,7 +3788,7 @@ void address_space_unmap(AddressSpace *as, void *buffer, hwaddr len,
> >          if (is_write) {
> >              invalidate_and_set_dirty(mr, addr1, access_len);
> >          }
> > -        if (xen_enabled()) {
> > +        if (xen_map_cache_enabled()) {
> >              xen_invalidate_map_cache_entry(buffer);
> >          }
> >          memory_region_unref(mr);
> > @@ -3898,7 +3899,7 @@ void address_space_cache_destroy(MemoryRegionCache *cache)
> >          return;
> >      }
> >  
> > -    if (xen_enabled()) {
> > +    if (xen_map_cache_enabled()) {
> >          xen_invalidate_map_cache_entry(cache->ptr);
> >      }
> >      memory_region_unref(cache->mrs.mr);
> > -- 
> > 2.43.0
> > 

