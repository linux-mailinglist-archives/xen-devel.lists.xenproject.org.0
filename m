Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPutBJya5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:29:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AECA8434111
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287712.1568099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwAk-0003mX-OR; Mon, 20 Apr 2026 21:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287712.1568099; Mon, 20 Apr 2026 21:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwAk-0003jI-LF; Mon, 20 Apr 2026 21:28:50 +0000
Received: by outflank-mailman (input) for mailman id 1287712;
 Mon, 20 Apr 2026 21:28:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wEwAj-0003hb-Ki
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:28:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwAj-001NCr-1Z
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:28:49 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69e69a1b-2eae-0a2a0a5409dd-0a2a450cb340-28
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:28:48 +0200
Received: from [52.101.53.10]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69e69a8f-62f1-0a2a450c0019-3465350a1fce-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:28:48 +0200
Received: from SJ0PR13CA0074.namprd13.prod.outlook.com (2603:10b6:a03:2c4::19)
 by PH0PR12MB8052.namprd12.prod.outlook.com (2603:10b6:510:28b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Mon, 20 Apr
 2026 21:28:44 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::9d) by SJ0PR13CA0074.outlook.office365.com
 (2603:10b6:a03:2c4::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:28:44 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:28:44 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 20 Apr
 2026 16:28:43 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 20 Apr
 2026 16:28:43 -0500
Received: from [172.28.123.27] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 20 Apr 2026 16:28:43 -0500
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
 b=ujxkHHrm4luJ5WeVpbxPJJMRKNKcKPl1it2rHrlj5rmDLpz544N0E2dbA+vtdcHyUT+DhhSfP7UPClnWARRyZOrvWARthhzp/Upt+skqzGuF5R5reOUe66x6YYomJiK/h5ZlnBamhi5+Mv0Io0IpPqKZQLrrrOwT1vYZor9FpSjHlIHFfGWO/01ZLyKfxPk8F4BJtLulVixAjr95c1+ySh+e/X11IGH5/tujXaHyuy0BGUPZJR6mJd1gmV5LrZU8xtr9sI/0cZ7Wc3+NZExp/50Ca46OLuA/CSm59S/Sl2iNvQapf+CnE/zpl0wWRrcnBCthwptGRy//aVRZInHdiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFviQzvH13Q1m7fXCqeWDpjZv4GT4Dg19hHWEY2R9k0=;
 b=KzJqzTh4kL8AtNWcCoLn+1YFotutiO7CzbuhW9ndHpSnLbG7/p6jahM/sdd5t9BA78zXiX8IjNAkbUutiZ/x20QJLYcGk8bFxJPXATuVQ/bjhv2qgyZbGCC8eIcRpJYUT8QZqZ1GVD8deWz1XWwy1KfrtSriw82YvqwD5k+i9RQ7LDLqP0iCxKDBQ1snWqTATP2fPwcvWhGiOSO952vAleYc/EtYLVc6yFf5MyiKWlceCG2SaojnMo43TQNEpodS6lLq01ERUjwpk0vMxb9wSVdUFzckYRY1nx01qzOsyqk0AN/xJ7RcivlYmvEf6R6SMA5jXS58g3Cib32dSbJwaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFviQzvH13Q1m7fXCqeWDpjZv4GT4Dg19hHWEY2R9k0=;
 b=TIJ4jfv/6/4UbPGKeRybDIWiRm+8BmzntvqN2q8yp+mV3JYXz1I+Rp/TTJ8IVqvL6NRoFi4cii1N2bhOvAJMeZAaaGdjsL4m+s2HIahcm1U3Hc0IzlmComlFhp9jEupewN9LU3OSjOrUCCm312e0YyORzFroxH5KrcO/agwAZzs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <29caaacb-6ec0-4a2a-b32d-b0cd4fc7df13@amd.com>
Date: Mon, 20 Apr 2026 17:28:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] docs: clarify Xenstore watch depth feature
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20260313074751.2904215-1-jgross@suse.com>
 <20260313074751.2904215-3-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260313074751.2904215-3-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D2:EE_|PH0PR12MB8052:EE_
X-MS-Office365-Filtering-Correlation-Id: ee9ef4de-434a-4806-1d3c-08de9f23cce7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	sI9054oefL+5JNGwIDzZeYEawGopZ+xXNp1TbbuIAqIiz6NCw1nWPs5QxCDvH+mC/wVkQCv86amO6oBmQIvm2p+HqKXqBkyUIMnhdhI4tYjzXEE4ob+cdX5tv88UnkvFXy7Woq9ssn0VS9vuKVUpQpEkc/7u8IHUCSwNU3SFlGMfG21VTVc+oWRTr5kupfx7lBg6DfOM6AHV/Bj3UA8RnqSLi1oWdCtyD70/r8pfrUHP6kkePJ+8boduAhd6rafQtT97epWvxylxoaj1wPdbaTaHBa+vbtx++8gMsEmu0OqugAc3S9hpkf95SW/uNL2NLWiv2WYY8tueF8PUW67KlnTMCarzaDwC0qNSudMpwRwHkoAeop4JQRk4q7nxINJKGB4nzAIbGnRg8NP5HCc+M8P2F8Df13t2kgAhfWlOU9KIbZrH2MXi5syfRRTt7FrJnDahguKTpGiTFpL/bK5yHOsrjYK7Wjgtl+s25JAswAEWWYHuhwtZSqkLbjPjNyr3JADbElFPzgMsRfmb6h/gMOnhj7yGZ3PisdkPRFD+I7cVCJjpueBOK9rUaQFSNXPS9MBQEaDFO2Zi2A8j6Bf3Ct5e03UjY2mZowZxhB9wHn3L862SMvcHFygcj4Qm9IVVnPF/sZef+XkrbnFlHLP6fnQoGugLD/0ox8pJBvAJHnMXlRoVFqiBb3UoxiavqBkCF0LfTdVLKW+IugVTrAqFjPkUka1g7WZMuxi0Bqr74pPZ2hDnD0nJpaMqDyI2f1u1Zy1e5DOdneLPpl/wAtIL4g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sQVcgROuM4xSoDlPElB/qgxDVWWDWZzM1S15w+2VIYRj/b2tHrAgJ5BxYcBaGr/lhqsZVL31J8TibXpFbDP6vu79lNrMY7qAkcH0ql9q2twt1xLOnIHGUY9itvYGRWaAmUumhvNSqEPArUipm+JPhVIPYvU/g6wxhZfiV01BnOGhveDW0O5rCKtrD2jQaK9TfJPZsWcM6H+DjuxFKCrwT4CkUF48LoulDTlTcciwI1msbvsugSDLfZDAuHUwoOnR4mIXtsrPgBwxJsrtDv7aj0W2fphX5pWPnGQ7Iy0s9rztxVWMzjbwcD8+E81zpNmo09ov/LgxLizIyTKp0+lTgtcZd0Kl5fz0wfyJ7NY2X7F1avibmNEXJt0DCgPqJVr984og9BYJFE4aEpbQ0Oi/ruse0JtAXLgdH0FjFIxdxgiG3J4ojYYzphF8F8q2/i1E
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:28:44.2745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee9ef4de-434a-4806-1d3c-08de9f23cce7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8052
X-purgate-ID: tlsNG-d25034/1776720528-6D76ECF5-7E808F65/0/0
X-purgate-type: clean
X-purgate-size: 283
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: AECA8434111
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-13 03:47, Juergen Gross wrote:
> Make it explicit that for watching the @releaseDomain/<domid> special
> node, the XENSTORE_SERVER_FEATURE_WATCHDEPTH is needed.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

