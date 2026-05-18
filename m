Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAcYGNEQC2pN/gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 15:14:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D4856D6E6
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 15:14:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311844.1581986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOxng-00009j-5q; Mon, 18 May 2026 13:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311844.1581986; Mon, 18 May 2026 13:14:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOxng-00007V-2b; Mon, 18 May 2026 13:14:28 +0000
Received: by outflank-mailman (input) for mailman id 1311844;
 Mon, 18 May 2026 13:14:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wOxne-00006Q-Ev
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 13:14:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOxnd-003Jkw-Ra
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 15:14:25 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a0b10ad-2eae-0a2a0a5409dd-0a2a4509864e-12
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 15:14:25 +0200
Received: from [52.101.201.59]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a0b10ae-2497-0a2a45090019-3465c93bafe8-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 15:14:24 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by BY5PR03MB5111.namprd03.prod.outlook.com (2603:10b6:a03:1e2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Mon, 18 May
 2026 13:14:20 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 13:14:20 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jDFmTrjy7owN6gd0JBZmZDBZg7kverEU5ObP3EVcraemPxWE1g6bAILrNHfyqFTpjWnFgejMaKbGM+c8tUDwGgI+iDPMzIWgE+VqZ8wQAp2I6KfTNA+Qd5PgIFMm6bXkGoVRxolDpdxD2sLt3APKX87tdBqcMxfzGc1enPclHMWRhEiDvlQshkM2eIITc0a1lrGXnTyiM0bJhIRjYVrWPWAbUObrIXf9Li4/0x7ixrs/W+ewZHsCTq1LnXAO3x9E1h7e4Rft2GETsW8BHcVse2a+P/AfWmwVmio5LhvuthmtR4RXtGAnj+dKqAipfaIdhxNStC40d1f3UzuvvGaDKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFgETPH49yxWfA5mC3say2GUzcswnrvzxCdDMHgH7g8=;
 b=udxHn8CJtVnrqZ5tufSoVXYp8zYesPo59DuYSGb8hYL21pyp/XZs4YkSPn3/swfKGoVlICdvTVt7fzkA/ReRPj6DXKMVD2WxB0nosx2GVd3qDqXvJD/GCfNtMIQ4fZwmR37OzOmWPpk/ERYehCkhnFxQD3X7OUVu9EsCy0PoyFvAhhaihViEazkRPEfduMx+Kcq7kwkMt2AwhlSTZNnYgrRh+pcMugKJ8eOGSkx3gXThVKm+nOwG4Sbej+MNCAZVqZKRF35z5w0sbzr0YRcQOPPZZGPA2oqbPo/BEsD9xYNsKuMP+fEWIy9qI9/g2ArOFHXYMnVCbNCipkPaclY+hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFgETPH49yxWfA5mC3say2GUzcswnrvzxCdDMHgH7g8=;
 b=vNPWkeziUzv6kN9xIHUSDgDMFuF6UkixhAdziRpfrfv/Yuxrk0Rf2L/zt3FVkYyCikWymVSRrksuRRcgko//DA/euk3E2bfHjsxl3o+7yQaCucF2xDYaCBgv8gHDQSFlJYfyLCdkODkwZcOhiebaZV29zTTaGbuIQGczTVPNDIk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [RFC v1 2/7] x86/hvm: Introduce hvm_emulate_one_ctxt
Date: Mon, 18 May 2026 14:13:59 +0100
Message-ID: <20260518131404.3716969-3-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260518131404.3716969-1-ross.lagerwall@citrix.com>
References: <20260518131404.3716969-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO0P265CA0003.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::12) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|BY5PR03MB5111:EE_
X-MS-Office365-Filtering-Correlation-Id: ebfe7f42-f7bc-42d7-278c-08deb4df5f2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	FZ45hwJG6OYsQZrzeRBNo4iueIbngJj5suVPTM+/TuAYMnsWLP/pGTvGDPeQ770bboSdED3s+WNdnblov+qPcxAs1+NacUtqJVDW9D3b9AlJoFrl/IU5+CuXLMF2lRKWwRMgsa0Qtn5LgHdSKnPdO6tTQSYnH7nlqeTYOSgLoR+0AhFhllgjfHRlUXnJI0nkyNJf4+6aY5L6U68kxc30ZJEnSnhAXGBdqmBABUStysuBEm00TQP037l3wuEKK7dPOOwGW7zjfTHfU7cmIMMVtBYrE/hMl7NPW+HG/9H0Ig/MhiW9GEsZcMTpsnkR5j0loQSJkHHB5OKPWhp/Q/7ShCX3uQTU7y+NamY0qKnIJK3p4Pj4GcB+8EaTx/xFSgcuimIy0PGV2Ynbbzuil6BQpg2DLJbggBoVolLMzA+N0JBBPUTCP+4W4iFXCk1XsFaeQRtRpNcNVbgkE66kJ5/5Zcrp8dPwDdiI/27AjO2jLhGTp4pS8RtGgnrNTiOIQVc356En0bZWTB5et3WzQKmv/CGrRZPmvo4pMG2sXjQbbA07UR3xhOa0WmFDiKwITCPWrLUsgkV0uplZhJBdyunQ/veR8jfglPjJupLO7l/fO1A7UQJHW7CczGIwQhekuYQn+3KOW4alinHizVHDHLjmCQocqGYOXRemq3WYzl18VkLGw4j5bXJWYodSPwNRmotz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rmcuoXuEGay1YjauErUju+7F5CV/r51/TDEqCKEfQ/MzQnArV8ezD1sAqrHk?=
 =?us-ascii?Q?ACCZUnHetQ4b830KYIxx62PWNou28AxbTWqCc6PEKNEC7mtw1BLLhjOhGjfk?=
 =?us-ascii?Q?wKVSERZW1GMMa8vPHwzoX15cYZ8joeoQaS8AiJpa/cAqUya96lWKOJYzAwXM?=
 =?us-ascii?Q?Nn51X8F21yO9vlTTvCk1bZh7/kM1WMgmb1PJZS/Biy9XhcKFo9HieNN4ZTWa?=
 =?us-ascii?Q?U2jwQQsf1b8DiOH9tyuRl1N8lYIQjrkzSUoIVZJYHsqadb1KTBrn7OiI/f17?=
 =?us-ascii?Q?rCui8ub6sEDyyTECFUlKODU4rFlrFClpy0K6vRFZHZQqZsftIK8xrZcz/px6?=
 =?us-ascii?Q?lKEjGdaNQVQTLpQFzXP0ba887ua4TFuU6JVAGEHUvMFXsl8llpxtkRZbjmPA?=
 =?us-ascii?Q?oMjh6QaYy2sFwwwyQRK2UZI/zFLpKwKdLjblvW21DN2cFFujI9lYrL0a+A5B?=
 =?us-ascii?Q?3bXWG8LPcST+aiZiCY7tsb7zRtKekYGOtMaG5QPFR6PrybA+6y/3PL10rJCU?=
 =?us-ascii?Q?eIGEOl2wUzLQMSrbUTlDUDB5BwgBqo88BgWAMRn8kOYF9rlv5ZmbmJ8we73r?=
 =?us-ascii?Q?ov9QU5gncN+U9RUH11WnKho0jw9BBiEHk/7RZwwM3mL0Uayn7K9zJm2hdn/j?=
 =?us-ascii?Q?k6HBsvkShl1RvWgpoFeL6YCBIepGn+kJv8tN2tXSNdsANzj+1jouIF+h4mGt?=
 =?us-ascii?Q?LJnTl43HGyXaSXji/cZmkd5Xlku2qX2ezfif1O0x6IhvQZa57cK04DH3HOYT?=
 =?us-ascii?Q?osLXMN1a9EQL9b3rn+qTR8dTmpYGTXFpkeC5G5H3mQzR0DeUPQL5+9Zu5g1x?=
 =?us-ascii?Q?5LpSobY3ZVyYgnQqxRl9j01es7ss5vSqIUCujZZ4s7ktXq/H2qPAiYbEwjms?=
 =?us-ascii?Q?exq6PGTU+cuZcDBEy3DAgz6PjH2GQ4rr+YcR1ObQ5OW4TZm38vKP9LnYDhXB?=
 =?us-ascii?Q?cFh2yhkeUU1ISK86cvbd5ylMjaNXjlbdPDHlSWDq1wKIRLLABUSbLM98hNzQ?=
 =?us-ascii?Q?EZ2C1Tw2R+cV7q33JaNjV+hO+soW/qE5MFh2r02xylNBu57XYVchX+qdGCZV?=
 =?us-ascii?Q?5KofkoDuleKnoz3zznfk1jkIawdslCQeJPql5YOkQv8L6fHIgPqdlPxV6VwH?=
 =?us-ascii?Q?CqrRWh6qqNZ9nF+PlPCztApp4V6OLI6GT1nOPeuVcyfGwwKMykzREY/swS5j?=
 =?us-ascii?Q?6mgiAD0FOtcXEjheAY8dH04hycFeK2NBgA6w54d4VKzD8NW2ad1WHpRY0hbJ?=
 =?us-ascii?Q?jwNLzyxD9FV519NWskWka3nRPWPRe8wvmdm0SMcUJYvFYxYdnbV6Q+KoxC2a?=
 =?us-ascii?Q?NrNNDD3mf9A9X3mgBmi/KCJfW3c48tRjLiAxAH6K15neEuqpmaVNzjBiLech?=
 =?us-ascii?Q?R2HPC6qpNmYPs2nOdKxtwEMyR3iJrqX9iAvE7o1AqGmwnOk0mo+pkMa8+TX4?=
 =?us-ascii?Q?NaGFOZXcm3ndHVgqQWsQDs4dkT4YJYMPwqDXt4Pa2gV5LmabujztXxfzaej1?=
 =?us-ascii?Q?8w56NUDc/Q2ooz8s2PYFfOMVBH9XkvlJJd0SJsOGnXMTsLQ4Mba8bRAt0sDj?=
 =?us-ascii?Q?k9ZOKw0O5APpyYNcjqgfkAIZZTFM85Mvp7xVhw2lcdG6D0oh0asuekDuPMXe?=
 =?us-ascii?Q?dl12w0px3vAjfhbn7HLHAenQQXi5dS1d68/0/FNv7GJw+nBEynCv+XfuAXBa?=
 =?us-ascii?Q?EgWB4zW/dNQ8kRTH1EOOrjtzLlgLpp1gTkgWgwVTudR0aMWlRxrytmHtRi57?=
 =?us-ascii?Q?QdNbVW4+AWw7lCCgLIAelLR8GbRJJ/M=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebfe7f42-f7bc-42d7-278c-08deb4df5f2b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 13:14:20.2776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MCdI7ZZUbkvU3RjxAPl3lay6BeYWspfM6QiKQ7jb6nyl3Q13ngnkeWvN8W8Lbb+U5euvVBWYE/a2RB99J21KYHpcNKhe8AunM1/0MHsFMRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5111
X-purgate-ID: tlsNG-bad1c0/1779110065-8957AA53-EE0C1D5E/0/0
X-purgate-type: clean
X-purgate-size: 2398
X-Rspamd-Queue-Id: 18D4856D6E6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:mid,citrix.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

This is like hvm_emulate_one_insn() but takes an existing
hvm_emulate_ctxt as a parameter. This will be needed to merge the
instruction emulator and VMEXIT fast paths.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/io.c                  | 17 +++++++++++------
 xen/arch/x86/include/asm/hvm/emulate.h |  1 +
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
index d9838c36d330..7dc6f64b646e 100644
--- a/xen/arch/x86/hvm/io.c
+++ b/xen/arch/x86/hvm/io.c
@@ -53,27 +53,32 @@ void send_timeoffset_req(unsigned long timeoff)
 bool hvm_emulate_one_insn(hvm_emulate_validate_t *validate, const char *descr)
 {
     struct hvm_emulate_ctxt ctxt;
-    int rc;
 
     hvm_emulate_init_once(&ctxt, validate, descr, guest_cpu_user_regs());
+    return hvm_emulate_one_ctxt(&ctxt);
+}
 
-    switch ( rc = hvm_emulate_one(&ctxt, VIO_no_completion) )
+bool hvm_emulate_one_ctxt(struct hvm_emulate_ctxt *ctxt)
+{
+    int rc = hvm_emulate_one(ctxt, VIO_no_completion);
+
+    switch ( rc )
     {
     case X86EMUL_UNHANDLEABLE:
-        hvm_dump_emulation_state(XENLOG_G_WARNING, ctxt.descr, &ctxt, rc);
+        hvm_dump_emulation_state(XENLOG_G_WARNING, ctxt->descr, ctxt, rc);
         return false;
 
     case X86EMUL_UNRECOGNIZED:
-        hvm_dump_emulation_state(XENLOG_G_WARNING, ctxt.descr, &ctxt, rc);
+        hvm_dump_emulation_state(XENLOG_G_WARNING, ctxt->descr, ctxt, rc);
         hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
         break;
 
     case X86EMUL_EXCEPTION:
-        hvm_inject_event(&ctxt.ctxt.event);
+        hvm_inject_event(&ctxt->ctxt.event);
         break;
     }
 
-    hvm_emulate_writeback(&ctxt);
+    hvm_emulate_writeback(ctxt);
 
     return true;
 }
diff --git a/xen/arch/x86/include/asm/hvm/emulate.h b/xen/arch/x86/include/asm/hvm/emulate.h
index 2801d14d5455..084e2bd90588 100644
--- a/xen/arch/x86/include/asm/hvm/emulate.h
+++ b/xen/arch/x86/include/asm/hvm/emulate.h
@@ -65,6 +65,7 @@ enum emul_kind {
 bool __nonnull(1, 2) hvm_emulate_one_insn(
     hvm_emulate_validate_t *validate,
     const char *descr);
+bool hvm_emulate_one_ctxt(struct hvm_emulate_ctxt *ctxt);
 int hvm_emulate_one(
     struct hvm_emulate_ctxt *hvmemul_ctxt,
     enum vio_completion completion);
-- 
2.53.0


