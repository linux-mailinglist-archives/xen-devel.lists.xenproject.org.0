Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEMTKNIR4mkg1AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 12:56:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EB541A77A
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 12:56:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1284140.1566032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDgqi-0006iQ-RD; Fri, 17 Apr 2026 10:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284140.1566032; Fri, 17 Apr 2026 10:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDgqi-0006fv-O3; Fri, 17 Apr 2026 10:55:00 +0000
Received: by outflank-mailman (input) for mailman id 1284140;
 Fri, 17 Apr 2026 10:54:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wDgqh-0006fp-6c
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 10:54:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDgqg-00HEuZ-Jg
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 12:54:58 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69e21178-e002-0a2a0a5209dd-0a2a450ac75c-18
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 12:54:58 +0200
Received: from [52.101.43.36]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69e21180-56b3-0a2a450a0019-34652b24c999-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 12:54:57 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by BN8PR03MB4977.namprd03.prod.outlook.com (2603:10b6:408:de::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 10:54:52 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 10:54:52 +0000
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
 b=QW33sK7jeTkZPUcfIerziAeFNX7W59m55/JQ4hrA38FvEHMHxr8JH1zF8cX6WykxYvQVWeZePbhi7V5O4xyuVk7nyniJ076lsnv7vU3IyEFAZqixBZtydZaR0EXPlnFIlpHe/Y3H5oVzLNAH02lH5mlYUaFIeItY6pE6fh0sNqRcVJVClkSbA34sCEfq/JqIECAUUqMy39yNBxdJCCS1noOveh5L1rqouAp8dCHqi0pLFPmoSzhl3P2zKsrMtQDlNIK8Lnu9+iyeU1rm/30upmUCfnIQMNDoVDxSqNEPM01dSBtaAtZLWstwpjLuDNSomxKAPKnKuit0sZVtZmZTFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qbv598KG+/Z+nmSjFRqOtp2uxNwXfJQuKAFY7O9Q7pg=;
 b=RyRw7l+I1TckJu52HF1HCaRHD73FVYUfb/KYjpHJ+St5594v6TwpZz3DONIqbMKSkMuhrXsho2bc5k98WVYoNN9G91EDRVXWxD1nYkt47x3hEMZda6gKhpGn4cBtYs/0ruG0BOJ9F5oaem7h/bs9PO87Llw+gK8jYJMzNASUyQNFmRYMlrN13gR+loMLkKX/NKto+0+RxSOsCmg1uQXq2cl5Bqzo6L25VUmg5C5/wnFehWtQg8NPvzzUUWn0Cnr+iENHSZt6ZAyjX/qveH12vxYxUqQdrzRT8qg1fiCrHJTa6x3RkyBMvnqdsCZkWgKwC7rJfCRU0sDda24Z8ZuOag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qbv598KG+/Z+nmSjFRqOtp2uxNwXfJQuKAFY7O9Q7pg=;
 b=Ak3cFohB/eaJ14HUFoPgJjuw3TUdoBKhhVmwsqz7IrNkWPdnjt1bIy8x6QLyZUbjne+aD6Cgm0x/yPgpskWnOypVepPAOxJMc8cpIeeLWnIHnO9omknsrIdI8ed60kxGXMoNUukii2RhJ+UswuG4VOx+KHwWgs5pCZMxnx+NPeE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/mkelf32: Actually pad load segment to 2 MiB boundary
Date: Fri, 17 Apr 2026 11:54:24 +0100
Message-ID: <20260417105425.1184232-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0006.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::10) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|BN8PR03MB4977:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d5272aa-f442-4096-96bb-08de9c6fc0ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1k6N74Xk3YdAhwlLxL4TLX2wkr1CQOFkUrT+wdzqB+sO5BFgJffTRIC4VYCnMKBPvqOXqG+c021CqNXgM0sv1H+Bwryts9j33jdMfUdUJFFsF3nSkjIeH5wS1tUuX174s9drbmOax9NSmvKGNQdWJxaVrqgZtT1Q4BtD0Th5Folb/G39rYZC2J1QMDVy2keKASkV34NSabQt4L+rTnUwPogtaFs9KycsZLJxQ8lsdbLXNij6M6AMLHYu3RmmjbZ8C7EGo7MA76htNb9kCCsRWapx9hOA9PUrWEwlRU0IkukZLTky0+ZaDhuG9YLuUQa4ktBQADz8/FsJyisENwPMHOrLWGvPPmASi1Ort7mjV3Ajg4adhhuuZrjmW3OGGVBwovGehD/Riqa7K3pF3g42Uv+Vh9ca2cNQbGOcFzyNZmvrf0mmyiYRL9833/jtMwOMfNXYrN5mhqfXFOfxQSw+l8kmxQk0Iq11M3XZltZ+lgwjtOOq+M+CyAw/c0LVhZpg6sC8gsA43l65t8gEoEQTzPsIJwqY7ev8evyIQ8Soekcy44tUAtnAXLbyR4hfiR5OxILOw7Lw5H1X3aTN+ba39ANBIM4o1t+Q+4U4MKTqvNHN9RH0H+ZutoPUiWk6kb6ag59HjZMSuVYfQBkSgrfS4NOdjtyLPRVzPESi8L+OunFJla+GGuRG5YQSbgf27ngyyo8gEQKozrmUcoN6ordx3FK6nZYeHDFa2uaFwENwRnI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9hYsL+cTHDR5vIdcUA7356X3rLa9oJeF9LN0vWAYWqVoZjeJLh9tT3eD9wkY?=
 =?us-ascii?Q?XNcRZQUwBlpdTBUHs32Aj9PjWo0rs1AunT51Vc0vph94ltsS3z8yykG8iJiN?=
 =?us-ascii?Q?VGgVZyRRPy59A1Vly8R/J+7w1n4ZgkjozpOPJaiIpd3kqrvXGrUKS/grg+hf?=
 =?us-ascii?Q?jsGy4u8NrRhjtVkncI/SytENJ6tckOQyexp0EmP2Q5QhJ/02UJwA042D3xmV?=
 =?us-ascii?Q?jVOOvb+CCd5EQGhDOODfg8bgYjAjgYieCP+upQ3zEasrBEU700Ml2fDqARuN?=
 =?us-ascii?Q?SExuLm/5KbMXBAtn1/c3+oJM/2TPKcLwl8u46mhZ3jG6QW0PWP0VXMi9FI6E?=
 =?us-ascii?Q?hbncsC9E0JPUjuXdEIUb2wRLWNnCisU9WlBfVMvAwlrxw8muw1mlfjnGdU5Y?=
 =?us-ascii?Q?5OCYCV3oIpxW2m/BznSRTgzOJJuZ/F04bTt3D9CSOpYEKX+VyzK734T8nPHv?=
 =?us-ascii?Q?2vqhV/WJsGC7CGrqVRCVCyM1qVypwWo0+5hDHRTnWI6ocsBPy2COysaBFheK?=
 =?us-ascii?Q?Q4dugBf8NE54qCvpozhXl3hGVhBcNzt963IbvmPcqnjd6uVfRfWYFJiyKvMA?=
 =?us-ascii?Q?DyMvDNJJL2+SA6W1fRCWQdhcM3lx53+ZD43olqkBawRf647n1o5Saqq/r7Ks?=
 =?us-ascii?Q?Q1CCLRajVd17hvt8fl4tVUtuSuiX1dV8NS99WrdS46BIHwrNV3TVZ9wBBDQC?=
 =?us-ascii?Q?3XTi9xb6mukQCYF1VREs2mGqZb39HxiN6NvcwJXzYYOE6HmnuuZ3ghX/kSds?=
 =?us-ascii?Q?rcaRKqDOsz0Qr3A3MF9d6ICXGv0ZJvdNgJlSY+jYnFPTgHG9J2OguKlLunzh?=
 =?us-ascii?Q?bLP5db+PwNHBsPkGTUsesPpivvnWiiRCYyDRnrDdxm+Cdahk/DS6N/ONp2Fw?=
 =?us-ascii?Q?WN/qjoV/cNfh+vgIqPXm4sgpzdclinbulsYOLDkpkUROUkloCF71wzk0nKk8?=
 =?us-ascii?Q?dY9LcZ2dkNSycZ/PtZlucZP3nLizui+hOkS7p4K2+Zp0PkSuSyaZ2UNYJtE4?=
 =?us-ascii?Q?Ndv43OPbBj2EYwpDhMT0GP7c+IpQTXkW2aLawC8VFmdL1H3S7TvyAdE6uPa/?=
 =?us-ascii?Q?YuaxwoW+/dptCXtpFJEQ79O5i+O7y6tWLNanu+0Vog3dg8+zxRH3CEWY7UDT?=
 =?us-ascii?Q?eCJEJpFlaV0PWJK1rB8N7xB8LH4bzC2pqoAFhPxknIk5I0uaSGziTvS4TgTo?=
 =?us-ascii?Q?hMoPdtdezfElZlxPICHz4A3A4bxaa85+99R2+6bXl0WJBsyIMgvazwt+okI4?=
 =?us-ascii?Q?rly1nUZjnR9F3EPvUtVG6k0Wy61PmDs4/7R8wMVvdODOB7p5ZdPj1n91cME4?=
 =?us-ascii?Q?o7bTpH6URAhRykicltKMgCDMMRfRQPWJq5e8xrC0whC3EqQilgPgLM4WaV5s?=
 =?us-ascii?Q?x0l+GFFjvGZKN3hAYVEVSEeZp5bn5jR6LEkL0q2lcxOr6NLFijBQwPJs+7gD?=
 =?us-ascii?Q?dDm9TurnDBaOTdO2sTPoqFOEqeBNJvSYZh1RqajrWLr0PETsZol1KiZxFX8p?=
 =?us-ascii?Q?9kzaePUlabBTjdyPpXSZ7Uk+UqbkQ1Joi2AohWyzlw/mD4G91A/UYFUi3Szw?=
 =?us-ascii?Q?iXqNc/4nbgxTuyNFREG0ZI8HARjMzDgDc6B1rx0BnuhcnGj1ll5TYntBB0wh?=
 =?us-ascii?Q?brfwJcCb+pI5zmClKg3WnYLU2cSogiI6Z3HkWg5NYazZ+x5dxPwBXRcllxMZ?=
 =?us-ascii?Q?4IgQPXFJ/C0KcKTat1EZhxKY9zU5Bcoe95qkcA3ycynrv/k3hUWTcu3VHAJF?=
 =?us-ascii?Q?51wN0S0cDYqcA2omg3zyJ6FvpAwiTqk=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d5272aa-f442-4096-96bb-08de9c6fc0ec
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 10:54:52.6326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5NVOplePFl8zhh5AZozwacrLnkZ93R/SVeP/GKMrkU16DhYcF70sldadcbams5nK2bQLcQkz+6024jtYZqIPMH4j5LtihLuB5dRDkYj4L74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4977
X-purgate-ID: tlsNG-4011c0/1776423298-471728B7-B6EBD3F6/0/0
X-purgate-type: clean
X-purgate-size: 1211
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 33EB541A77A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix the code which tries to pad the load segment to 2 MiB but only pads
it to a 1 MiB boundary.

This manifested itself as a page fault while scrubbing RAM during boot.
Xen failed to mark its location as reserved in the E820 because the last
2 MiB superpage overlapped a reserved region which meant the memory was
given to the allocator despite being RO.

Fixes: 4fb075201f54 ("x86/mkelf32: pad load segment to 2Mb boundary")
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/boot/mkelf32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/boot/mkelf32.c b/xen/arch/x86/boot/mkelf32.c
index 373ba4ddd593..469d1ba0af41 100644
--- a/xen/arch/x86/boot/mkelf32.c
+++ b/xen/arch/x86/boot/mkelf32.c
@@ -345,7 +345,7 @@ int main(int argc, char **argv)
      * the Xen image using 2M pages.  To avoid running into adjacent non-RAM
      * regions, pad the segment to the next 2M boundary.
      */
-    mem_siz = ((uint32_t)in64_phdr.p_memsz + (1U << 20) - 1) & (-1U << 20);
+    mem_siz = ((uint32_t)in64_phdr.p_memsz + (1U << 21) - 1) & (-1U << 21);
 
     note_sz = note_base = offset = 0;
     if ( num_phdrs > 1 )
-- 
2.53.0


