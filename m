Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ru+1I6+eUGoN2gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 09:26:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB97738080
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 09:26:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=UxitRNyW;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1358809.1612708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi5d0-0008S3-3Y; Fri, 10 Jul 2026 07:26:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358809.1612708; Fri, 10 Jul 2026 07:26:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi5d0-0008QN-0S; Fri, 10 Jul 2026 07:26:30 +0000
Received: by outflank-mailman (input) for mailman id 1358809;
 Fri, 10 Jul 2026 07:26:28 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wi5cx-0008QA-Re
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 07:26:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wi5cx-005JIp-7s
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 09:26:27 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a509e99-e002-0a2a0a5209dd-0a2a450498b2-30
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 09:26:26 +0200
Received: from [52.101.57.70]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a509ea1-b1e5-0a2a45040019-34653946a207-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 09:26:26 +0200
Received: from MN0PR03CA0024.namprd03.prod.outlook.com (2603:10b6:208:52f::32)
 by PH7PR12MB8153.namprd12.prod.outlook.com (2603:10b6:510:2b0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 07:26:16 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:208:52f:cafe::1a) by MN0PR03CA0024.outlook.office365.com
 (2603:10b6:208:52f::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.12 via Frontend Transport; Fri,
 10 Jul 2026 07:26:16 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 07:26:15 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 02:26:10 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 02:24:58 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 10 Jul 2026 02:24:57 -0500
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
 b=cQEf1V3waEXwWJfJwk0caPAhIzdZsP7Pxw7ggT5JbzB5pm56G7NYnSHnsFoUKgnHjdW59K1BVPw1GOVF7/fQdYrZwFFv1chIL+TKSHKBSHR3MzTb11sKXJuNQu2Q+nZqHCs/wW5YZUDScl/70C1m9iaMlxHpRwKeiIlSeFg6szY0S8xpZss0bSqZ4rhwEuFQamA2Qq5pfD4291ioT5LvZjK4erkDEa+CodeLQcBZ92Mf263ky4vLyzkGZLuM92DkbPiJNn2mG/yONgIwc4FUb9BOopAlAbopGtLdt+vJQLB8avvQ4RWEf9GzsIn43SHQATgFBS4kVtR6ogB/56sCoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eflw+MGdw9pQ5ByhNSk/Haunwsumui+1sHwnBIWyVbY=;
 b=H9EnAe7VrUC8WFX5uBXfX2vYkraQRuP6fy4t9UuPaOVEI9DoOh5a1L61t5y0UOmplVUkN5UyjxcW7qcT6/pRdC+grEaNymMn8F4kI+2CvRhDSka112DGVpsEzhlLpSV41WRPUIuykgi6tPmvuC6ZFyMCRGUytKHJsV44k59eKaAXBDB+IVPOt0MCdZ6QDBxhUpQhsH78MUJAfXUP4byBpStg/Kb8LBXWIP2FdJA2wi9RTJmMQqKHnLo4gF09OgKrK4AgY9KSAUOeJnEXHye/nw8HmcxPoguM93pTnF78Ggw/r6YG7ANUuGnht+ahE3I5Zs6m88eBFlCxpVlDmcMsLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eflw+MGdw9pQ5ByhNSk/Haunwsumui+1sHwnBIWyVbY=;
 b=UxitRNyW5KhuZvWWdj5Pncf98pANvqx+XfJpfsfYNMRo1wqtieNuXiyYuCRz/e0RkC7GFA+GbFiqOBGekFJ1J07bqXYN21G1GupTmhAFrkmHuQ1U2RcZ5PQhuO7NHdR8aNOmq6zr0CsgeCiq53o2ZoDAg2eods9KlkxfTW5YtDc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <a257b466-ce41-4073-b9dc-826059b9750d@amd.com>
Date: Fri, 10 Jul 2026 09:24:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v5] dom0less: Prevent division by zero in
 handle_passthrough_prop()
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <7a146536c13431933899ffffc93c85724dfbaf87.1783599357.git.dmytro_prokopchuk1@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <7a146536c13431933899ffffc93c85724dfbaf87.1783599357.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|PH7PR12MB8153:EE_
X-MS-Office365-Filtering-Correlation-Id: c973ee08-7c3c-408b-74c5-08dede548734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|56012099006|11063799006|5023799004|18002099003|22082099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	7n80vIaRS4Nd5hxdcGIfrNdikPf1+ce1gKSuPGXMYnbwx+lKDa4ubbPVYZvm9CjXJh8e9d14EVckZEZvFjvU4dnqydE6lKquw8JQDoHT5MDVtgcdf5jDcoa0ZdBVxI05SQ/OwCY8a62Hnt3vYVrL3U3ZgHDy4CxJfBM8//0Z48dHwHMDC+vTSO3O3QonQk8tdDK1Agqltj8WGaCcQcudoxCz51ZnqnP+O3efQAR9oUD7B2cceDZK8ndF5ol7qQM9vrVwCm3fj1zoKaJPSDdaewUsRSstNVajQESSqMVnEdmwzGOOZGzcBK5vxBYzGReuQh85dND41WWGEYpm6WLVgSjqbJND9lNzKVdIDvWpV94brYj+vgJJt9FWIi1/99hG8RQZG8sBrAy0hA9anemdWfduIFbjLZy17LU5ojHuaqZL7m5BiLNtqLBdr5tAT+Bt4ALZ8OgLhzYd/W9Nhp/9IGjTOpovDfvhWMyJWsz+N+orTSKBXPgvHUPSL3U/HkKL3K58KgnSJH8ZoQAH1hSJP3fmqPuOYQ/r+Eyirti9CWmWc4YZTm93HRzpOktl0Pht7ib740xXr2PKxo45D8RVPyg4GsW8otFup9y+cFs11wANM+fB6LIEzogwIDC7TVZxbUXlQDPcFiFccbQL1N3/q0hRoNRVE874MEQM5RaajDJFIr+kLYJwWAIZ6JjTWEpYAgDRkzJqEwmsVIiwshO/Gw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(56012099006)(11063799006)(5023799004)(18002099003)(22082099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dNpmSesGUe6DdzXP2UPcn8O4OwIfOnlLQa8HEXg+NdTcy9TcDNSjCZiKiNCcLooqpY0PncIQmbW7kNSuXUWuJEilmugeMIVyHqCwNj+tLvlrc1PfkBGXBDjtNe2zc+gCNFetcgBVvTV90VXbV7RRzxwpUVty2m1cWWd2v0e2nSWFEkPoQupt9j9EKdrcWUPB6MyKd4hZQ1K5Zhw+OwPcA1AsDP8pkimMOTx/Z3EEv6Y36PIeeEKf0zk+Vauju1o7wZ0qvZXvAbw2s3F8mmMKm0tJZZ0C0ZY1W9XJnXLwJouBqdWVcWqkJBJwsvfnb8cPlRHXywiv9c2hY2Iczp5YMBtDEMCg6Bjl4BNENmFr169QDgbbUjIQai7kj5f1+UXFqEGq1Z+2ST67Zc1+NiTe3/2jt/2XM1NryvesAsvLr1gzBv+uVMUMsfCsqOnodNo4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 07:26:15.9821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c973ee08-7c3c-408b-74c5-08dede548734
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8153
X-purgate-ID: tlsNG-ebf023/1783668386-777AFFE7-437D425B/0/0
X-purgate-type: clean
X-purgate-size: 3105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:from_mime,amd.com:dkim,amd.com:mid,gitlab.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DDB97738080



On 09-Jul-26 14:31, Dmytro Prokopchuk1 wrote:
> A malformed partial DTB specifying both '#address-cells = <0>' and
> '#size-cells = <0>' causes '(address_cells * 2 + size_cells)' to
> evaluate to 0. This sum is subsequently used as a divisor when
> calculating the number of regions in the 'xen,reg' property inside
> handle_passthrough_prop():
> 
>     len = fdt32_to_cpu(xen_reg->len) / ((address_cells * 2 + size_cells) *
>                                         sizeof(uint32_t));
> 
> This leads to a division by zero exception in the Xen hypervisor during
> boot, causing a hypervisor panic/crash.
> 
> Fix this by validating that both 'address_cells' and 'size_cells'
> are within the valid range of [1, 2] at the read side in scan_pfdt_node()
> immediately after they are parsed. Any invalid cell size combination is
> safely rejected early with an error message and return -EINVAL.
> 
> Fixes: 9ce974c47588 ("xen/arm: assign devices to boot domains")
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
> Changes in v5:
> - fixed mistakes around dprintk()
> Test CI pipeline:
> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2664600678
> ---
>  xen/common/device-tree/dom0less-build.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index eacfd93087..c054ea4e2f 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -341,6 +341,14 @@ static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *pfdt,
>      size_cells = device_tree_get_u32(pfdt, nodeoff, "#size-cells",
>                                       DT_ROOT_NODE_SIZE_CELLS_DEFAULT);
>  
> +    if ( (address_cells < 1) || (address_cells > 2) ||
> +         (size_cells < 1) || (size_cells > 2) )
Too many discussions yesterday... Today, I looked at the complete flow once
again and I'm sorry to say that my previous comment to move the check right at
the read side was incorrect. #address/size-cells define the number of cells for
their children and these don't need to have xen,reg. Even our passthrough
example (docs/misc/arm/passthrough.txt) defines a ethernet node with #size-cells
= <0> for its PHY child with a 1 cell reg but no xen,reg. Here, for our sanity
check, we only care that number of cells for xen,reg is either 1 or 2. 0 is a
legitimate value for nodes without xen,reg (clock nodes, SPI, GPIO, etc.).
Values above 2 i.e. 3 is PCI only which does not go through this path but still,
we should only care about nodes with xen,reg.

Therefore, please move this check at the top of handle_passthrough_prop() with a
comment below (the number of discussions about this subject is a clear
indication that a comment is needed):

/*
 * xen,reg holds flat host/guest physical addresses and sizes, so the
 * inherited #address-cells/#size-cells must each be 1 or 2. This also
 * guards the len division below against a zero or wrapped divisor.
 */

~Michal


