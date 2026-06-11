Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qDD1GgXwKmrBzgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 19:27:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA262673F5F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 19:27:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=jvjvxLjr;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1335957.1598045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXjAb-0000Jy-Ea; Thu, 11 Jun 2026 17:26:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335957.1598045; Thu, 11 Jun 2026 17:26:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXjAb-0000HM-Bf; Thu, 11 Jun 2026 17:26:21 +0000
Received: by outflank-mailman (input) for mailman id 1335957;
 Thu, 11 Jun 2026 17:26:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wXjAZ-0000HG-Eh
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 17:26:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXjAY-00DSDh-4j
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 19:26:18 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a2aefa3-e002-0a2a0a5209dd-0a2a4502d1c8-38
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 19:26:17 +0200
Received: from [40.93.198.51]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a2aefb7-af86-0a2a45020019-285dc633c599-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 19:26:17 +0200
Received: from SJ0PR03CA0106.namprd03.prod.outlook.com (2603:10b6:a03:333::21)
 by MW4PR12MB5665.namprd12.prod.outlook.com (2603:10b6:303:187::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Thu, 11 Jun 2026
 17:26:12 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::8) by SJ0PR03CA0106.outlook.office365.com
 (2603:10b6:a03:333::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.14 via Frontend Transport; Thu,
 11 Jun 2026 17:26:12 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 17:26:12 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 12:26:08 -0500
Received: from [172.22.220.35] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 11 Jun 2026 12:26:07 -0500
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
 b=ExtNQ8AU7l/lOwY5MtMquu7RK6X0c2+xvQETbMMDmr+IJPYl6+Dyun3WmeRpYla/7T1kLPT0ZZbILsJ936011j0lYOYbQ4bnRgm+e+QAIj9wAn/P/kW2aNkmS0VIG+rEfCjLRpg9OADqZ1JOcSj0wIajhKf1080h48PztKxmxKvpIOlpZu+70H+6Z/Tu3v2tX16IVsTrYa7AccGmdek9PY3Gn0SqGxGavQg04rngGyXwW1TYNeImAWkcYy0D6XV6F45vj5ZmthU6DFtD+FaQ/yvCDDTJpt8+HNrNeF+6oo/GEadJWy1/5SpRpH9x4ooY5f/nAVxtIraLtnTYjbfdkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u8o3963NWYw7wPzD0qV1mgDhdlJGqg9Gy/ZYe9bblvg=;
 b=bgQldTb0k7QX6mjad0kQDYLaoc4RL1q6mBue2M//XV4Uf6BvoJcmLkA5If4BKULJIbafaG6XcKo8biIj38PtTw62bxJnPDpUKRDDyLNyHckWoGZGrvsRvyDuIctGR59O6WD8MCH0FwGY4ITXxXKGmz5jMTBuHKnXVkig33IIRWg7CjxBlIO3kzecSh85v233xBEZw9+uQEsUGvbkc0SAlEtMMw87Xg8v1Gx7m5re7D8JaLTADZDaxkF0pF6RQGYFKkcnbX2dgdIZTIO1d/agTdadapmVWiHrqfiwtnfGYrQN1awuFgq8AlCYHlY4oIlhjosyzYJfTAIR93e3Jna3xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u8o3963NWYw7wPzD0qV1mgDhdlJGqg9Gy/ZYe9bblvg=;
 b=jvjvxLjrnnR/ptvQxyjYyRBoSPaXUG4H6sFOYkz+VXoEdOhZWZMTiTqYUsYHH8s+ASyH3ZrUaM3P/BThlamRdKzPxC+93FeoOoCz14xprZC2Q753Ayj+VpTLbqprDOZk2HEPhwckguVDHHw8rpj1txaEMo0lxrqdepDJohqatBw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <4b92c85b-b40c-43d8-91c9-eeac64e597b1@amd.com>
Date: Thu, 11 Jun 2026 13:26:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2] xen/x86: Change stub page allocation/free
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>
References: <20260611142154.64525-1-roger.pau@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260611142154.64525-1-roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|MW4PR12MB5665:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f162a97-3727-49ea-4a25-08dec7de88b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|11063799006|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	XNrqMj8c01UTimKGzioYJuHgWzKc0W5m1rwTBiVQt4RbPFCVPGRCuCb9tMazUmz7KGxX/VxQoSNxugwxiK/JoVdBJVmIaAwxmEtN2KAlG02M/SrPTa9GOUqfM9odp0C89yNmWOEUy6Cm+y02xgwLxYk6b6I4LiMLj0VmjPvVIB8CTu/bZcXPNQ5/anlMQiiZzL4GsELyW2TnY59i87N2g+KHknCASYA0yMTjhRW/an8xveAduHeyQLIF+2pWB4L57ip9BfuNySyOW8kpWcvV88Lr7+BDEyP8KiB1aJPcHzroKzPL4FnEbnEkWcjemVDR/G/ABIdrqXkBh8x19Ja1/NC5VVFBMn6LxYuzCAPDLnhEkFm9sVzOw4PmPtn7IpJstlYyT8eJC+wtkCopLhtlFT0R+MXdYnH6lvgW7zgdc1BR8V2F+TyaeM1IB4PJkNZ/l73001h8iauSQoOEM9nYMnUVrVSUW0t7qdvc9aDQqZqAtoQI0Q2XJmRhrwjl1g9s7kIFHfZ9IwMEkWXN+i+nxvtQzPH5w8YSupyOf6Fk6UR2LIzlKxlXEMtqI4lgWQ46l2WZlm5ARq2V4pAT0i+h/KCQ9Bxg1NYBZBWWgqw69Tdp5qhztoQPfm00QFI5Zdg3m4DWn20C7qSDv2F2ODhOHcA8OMXWnpW2pr2H22ZBcBQBAN/DZDIoQ+RJ+SDNTWREGUA2CPm+mYrOB5YQ3bDWCns1RTPR1/LLF7HQhh+zFxs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(11063799006)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zmGQ09V6iRpU5z6D0AiLzgfogwbx0GOoZSLtEa/4OFYFSXgvbZ2P/y61tG8xSWOKoEcZ//huJA0XSWsFjrzTlLndAZUaV4rOndaYH3LdQnB3RCjQfkdnYtffxHlT/pRLsk5XyQ7nqUIn6J60gMtFzeegIGOGDM0CNJyqjLerO5R06m/B96PnH5Y7cHqYj6cI/1MV4EeOXlQ02MW+ppkZ3zIA8izcsWJrH0dw5edATo4O48/bEVlGhGu7KBUE78OZO56MECV/kStvWDS/+EOD9Pmmij00yJGq435EiSsNCN8YKfnW3Yl2MJOhwjzWPn1BICNtfvSvCorj33BMZNyXZR8VDPe9Y1erIuvgoNzcaFoj9rHS7BYrhVHWBXspEo74l2+jdwKb7f4WwY//vUQpSGtXrtM+qusAEbzuCkH7QDd1IwiKVhh1/IDXN14Fl/Uo
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 17:26:12.1951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f162a97-3727-49ea-4a25-08dec7de88b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5665
X-purgate-ID: tlsNG-720697/1781198777-AA374161-EA24B37D/0/0
X-purgate-type: clean
X-purgate-size: 2458
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
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[gmail.com,suse.com,citrix.com,vates.tech];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,citrix.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA262673F5F

On 2026-06-11 10:21, Roger Pau Monne wrote:
> From: Jason Andryuk <jason.andryuk@amd.com>
> 
> Today the inline tracking of the stub page is problematic.  0xcc is used to
> indicate unused, but it is also a "clear value."  A !CONFIG_PV build with
> smt=0 will bring up CPU0, bring up CPU1, bring down CPU1, and free the
> in-use stub page.  CPU0 or subsequent onlined CPUs can write to the re-used
> page.
> 
> The new approach uses a global, CPU-indexed dynamically allocated array of
> stub addresses.  However, to handle NUMA aware allocations, we cannot
> allocate all the memory in advance because of the NUMA dependency.  Take
> advantage of the fact that Xen will attempt to contiguously pack CPUs on
> the same NUMA node (see normalise_cpu_order()), and on CPU bringup use the
> same stubs page the previous CPU did if suitable.  Note the code would
> still function properly even if CPUs from NUMA nodes are not contiguously
> packed, it just consumes more memory.
> 
> stub pages are no longer freed.  They remain referenced in the global
> CPU-indexed array and are re-used if the CPU is re-onlined.
> 
> The stubs array doesn't have an explicit lock.  During boot it's accessed
> single threaded.  During runtime, &cpu_add_remove_lock serializes access.
> 
> Fixes: 7a66ac8d1633 ("x86: move syscall trampolines off the stack")
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.


> -        nodeid_t node = cpu_to_node(cpu);
> -        unsigned int memflags = node != NUMA_NO_NODE ? MEMF_node(node) : 0;
> +        nodeid_t nid = cpu_to_node(cpu);

...

> +            struct page_info *pg = alloc_domheap_page(NULL, MEMF_node(nid));

I agree that MEMF_node(NUMA_NO_NODE) -> 0, so this is okay.  I looked 
around, and there is a mix of places that special case NUMA_NO_NODE or 
don't, which makes it a little confusing.

>   
> -        unmap_domain_page(memset(__map_domain_page(pg), 0xcc, PAGE_SIZE));
> +            if ( !pg )
> +                return false;

Newline here?

> +            unmap_domain_page(memset(__map_domain_page(pg), 0xcc, PAGE_SIZE));
> +            addr = page_to_maddr(pg);
> +        }
> +        stubs[cpu] = addr;

!CONFIG_PV && smt=0 boots (doesn't blow up).

Tested-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

