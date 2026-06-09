Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MnqMFtlZJ2o8vAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 02:10:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A87D65B485
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 02:10:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=0r++qOH5;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1332155.1594808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWk1t-0003Zt-O0; Tue, 09 Jun 2026 00:09:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332155.1594808; Tue, 09 Jun 2026 00:09:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWk1t-0003XA-LL; Tue, 09 Jun 2026 00:09:17 +0000
Received: by outflank-mailman (input) for mailman id 1332155;
 Tue, 09 Jun 2026 00:09:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wWk1s-0003ND-TQ
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 00:09:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWk1s-002NXg-2P
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 02:09:16 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a2759ab-bab6-0a2a0a5309dd-0a2a4502da1c-0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 02:09:15 +0200
Received: from [40.93.196.70]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a2759aa-af86-0a2a45020019-285dc44694b0-4
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 02:09:15 +0200
Received: from SJ0PR03CA0278.namprd03.prod.outlook.com (2603:10b6:a03:39e::13)
 by IA1PR12MB6234.namprd12.prod.outlook.com (2603:10b6:208:3e6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 00:09:10 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:a03:39e:cafe::24) by SJ0PR03CA0278.outlook.office365.com
 (2603:10b6:a03:39e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.14 via Frontend Transport; Tue, 9
 Jun 2026 00:09:10 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 00:09:09 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 8 Jun
 2026 19:09:09 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 8 Jun
 2026 19:09:09 -0500
Received: from fedora.mshome.net (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 8 Jun 2026 19:09:08 -0500
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
 b=GcCUSv5WBrwk8MjikeVDPMwe3Z4dI9k9Cildit95pqZxcNMUMg3bFgvgJFfXOCPdJHqD7uyJbzHWtaSbEmm2AdJjvNgA1lUTuW3L3oKVd+PfEg8ZEK1fGLZ159JzIcLlAkKYzdzT90x3r0tOzEXP22vOmQHKFyfmMpF15Xp1DTAgsr0WT1z/pC6ERy0rSE9Ry8LpTgNnEfwCz/5gHpihF9wLut1j/gZODqOO1Wd00y7OLAizVd6uaax6XDLfhAx/WjhfxRjDc35DTi/eNvnQPMjhOzzABmenDOraJYAzb0Chp8CK7zeWqhYiFlKNgFMgLeczs5KO0v+Q+ojAQHaEtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h69F0/HRgHoEeubvo+fbrRYs/KCcGjkSw3JqSU3qEyg=;
 b=mQYBQ9EAEhx4QpUR/a2oLmdEgGaNpjG0xEXdaq7QnAii8OX6S6hcT+3/Nrvd4rMlyBYS57oVUWk0swhTjtInMsavIBS/l7Z4nZJk7w6v1NkuTrg1HkG1z7hdwmU/UYK5x7IoCpY/JMPuNBblp7hkQ3dc3m8y00yhpFDtg8El4ZWYfnxVfMJI58x5TmzvDm6FjmQVlha6t7+Z0T8gwM5E+3OK+n7JxdBeKbmC/D689JMxIkuv+g2eQA0nXrePFf9bAschcARiiMC3IV0ojip7cNzPxRjuqdDcrbrqqf54dPo4c+9sxJMrgvqzsczVaokv4rd6NwaPc7dEOBaI5p0faQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h69F0/HRgHoEeubvo+fbrRYs/KCcGjkSw3JqSU3qEyg=;
 b=0r++qOH5ulIlD4JI9esDNRtQn1B2p65xfldio2xDD7JwxIMI6mSAjSWnhwfYwm8XmKZUtrFD5jCrsMMGfGKNQAxyXDQ4xtnEdj/jFKzuvRLG3t99IjyiC50jlVdYieW7Wp/FM4wPZD7/2iaGkp6in16QzFhitW0HDnPQ/KUEpDg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: [PATCH v3 1/2] xen/x86: Return virtual address from alloc_stub_page()
Date: Mon, 8 Jun 2026 20:06:37 -0400
Message-ID: <20260609000638.121027-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609000638.121027-1-jason.andryuk@amd.com>
References: <20260609000638.121027-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|IA1PR12MB6234:EE_
X-MS-Office365-Filtering-Correlation-Id: ac84d4e8-94ef-4071-0080-08dec5bb5464
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Gl5xzHopvMHxUSd7/zlcohws4IjshTajQNZKIKdHeeWj4IObcW/H261GWB8+KN2g1btlmLWskksJlAFgxZvLXLZa/cya+Z1p1xIl/jdcMiMiv2adcZaIGR1xYSfe3LwBsz/+/6sNBvwfanKDUnYUsN3/OiPlGpvim4UQLqIf6443VSr6ppj2Rt9r1vJA5in1FdY95xwFO1EbZVdsUv8xufh1vs+ePj5sNDMz0XH6CfJbqZahQYnMXCM2y0wmYLlQuEb9VWM5m4is4f0GyTtjBPCwovNh1CvPQGxcuYi8Py4mefMgZZeGsqIEG7+oMjvIhG6zYoSSlm2j7NgqEycz9AOznXJu75ztMAzl3Iz7SoXJwKf1W3ney7G4HwBq8xgEpaBnRUmjV6B2BNmEuZppvjQj6sRns9xC8Zca9E5nod3NdvkSYainjuVP50KBvM6yvcmrDwOukaDZS3zhwbR4c9by2TciaB/YJu2jQAwikk+iWsGckJgjUFDfZLLRAxaVaECHwz1ui8suvZ8f44otjSD0erFMwRk+inofD9+ciIuq+mStUcVuF8AeWRizp1iqJgLwwPnXcx8deMXKZT1OVxJkaNTOmFDHShhtB359STf2eIB9zq9C9rH032hu/ADIly8CHQkb8yNXRRxfILF75erViMDzDdMdeu26JUN8zddMY3dsnR2qT8mq1LSkTUGDzQ54suGWwW05XGNZzAF0NzFN97iggM/eLK0cmOj8JXg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ejt5EeMU/qHSFPCBCyROXVV5/y0npbmDMKMzT4wZxmXk9AR/MXW44y7QNMGCjmEo5RVWcKtgaqejZUb6oKG6WjuWS5K9S1zY3n9ROtbDLLAe6pMVfD43FPzNu7HKYfUhhMu1AavgM2sOHi2xfp+6ywr9LRwB5lqCpe2yRZj5/imy+Tb15KmnXtVg5ReehOvsGNUd3Y3HmmB+UNGatXJKpJr3KXvnWOSYmHqq07TngykIuTNfS6+ZGvOzEVATOJs9cnVUTvACJEAhE/DG7LeJCws+V1AAOTL2mQpSw2FPKkyOWefqB/K7CPDLZXD7F6PV8x+Vu28gcpX0uKpJWZUXG/JEAzhUrDpqiNz1yRhfF6+w4NGcClGtJvLWzAmdX2bJZkfVZShlZJ5v0jJz3asawkO83yTSRZ6hJK3xx6rlzXVuYkYv5LZ1AG6/bXe5XOaF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 00:09:09.7908
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac84d4e8-94ef-4071-0080-08dec5bb5464
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6234
X-purgate-ID: tlsNG-720697/1780963755-7BF66161-117588A9/0/0
X-purgate-type: clean
X-purgate-size: 1869
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jason.andryuk@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A87D65B485

Currently alloc_stub_page() returns the virtual address of the mapped
stubs page, and the caller adds the per-CPU offset.  Make
alloc_stub_page() return the final address.  This is in preparation for
changing the stubs allocation where the offset will not be tied to the
CPU number.

The call to alloc_stub_page() in setup.c:start_xen() did not add the
offset as it is assumed to run on CPU0.

Change the local variable stub_page to stub_va to reflect the value.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/x86/smpboot.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index ff05955bae..d7619f534b 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -675,7 +675,7 @@ unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn)
     else if ( !*mfn )
         *mfn = mfn_x(page_to_mfn(pg));
 
-    return stub_va;
+    return stub_va ? stub_va + STUB_BUF_CPU_OFFS(cpu) : 0;
 }
 
 void cpu_exit_clear(unsigned int cpu)
@@ -1044,7 +1044,7 @@ static int cpu_smpboot_alloc(unsigned int cpu)
     unsigned int i, memflags = 0;
     nodeid_t node = cpu_to_node(cpu);
     seg_desc_t *gdt;
-    unsigned long stub_page;
+    unsigned long stub_va;
     int rc = -ENOMEM;
 
     if ( node != NUMA_NO_NODE )
@@ -1099,10 +1099,10 @@ static int cpu_smpboot_alloc(unsigned int cpu)
             break;
         }
     BUG_ON(i == cpu);
-    stub_page = alloc_stub_page(cpu, &per_cpu(stubs.mfn, cpu));
-    if ( !stub_page )
+    stub_va = alloc_stub_page(cpu, &per_cpu(stubs.mfn, cpu));
+    if ( !stub_va )
         goto out;
-    per_cpu(stubs.addr, cpu) = stub_page + STUB_BUF_CPU_OFFS(cpu);
+    per_cpu(stubs.addr, cpu) = stub_va;
 
     rc = setup_cpu_root_pgt(cpu);
     if ( rc )
-- 
2.54.0


