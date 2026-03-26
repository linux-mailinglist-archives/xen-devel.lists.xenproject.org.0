Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFVvET0NxWkI6AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 11:41:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFCA3339D0
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 11:41:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263688.1555556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5i8t-0007F2-Ga; Thu, 26 Mar 2026 10:40:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263688.1555556; Thu, 26 Mar 2026 10:40:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5i8t-0007CW-DO; Thu, 26 Mar 2026 10:40:47 +0000
Received: by outflank-mailman (input) for mailman id 1263688;
 Thu, 26 Mar 2026 10:40:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1w5i8r-0007CQ-Hu
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 10:40:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5i8q-00D867-UJ
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 11:40:44 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69c50d28-bab6-0a2a0a5309dd-0a2a4504ae0a-28
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 11:40:44 +0100
Received: from [40.93.198.63]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69c50d2b-c823-0a2a45040019-285dc63fb76b-4
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 11:40:44 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SA1PR03MB6628.namprd03.prod.outlook.com (2603:10b6:806:1cb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Thu, 26 Mar
 2026 10:40:41 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 10:40:41 +0000
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
 b=FMRC+Vf/SlWGhk12S4+K3IE09EPu6MrqBkVzqWcOEy1BEW38t40kLembagumzO+rRYs2E6EbZc+uPiZf/glx2pRMqKDIrxelpK2sKJMYrjmoF5p40q1jprVOZmj417bWCkBNSHPAO+auhnUYXzHp4a+ens6wZzJNQc0PeCXeWEuEfzobo69s4LfVO6qz0gdAeX33SMFKotTsTVOYX6nl6D5JNeHyybp6pb97pZfvqKoAHe+pnoh/VpzQaaFjkBa5iydd321h4Qsdhv8YRLYchFM58+RzZR4OizGi11N11nxmx6ZCU7nNrbUfyMtum4gl40jbqqLh+p0Tnav7Y2VSKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+RCVkYHkOSgKiFDNbPFC2F9keZnpzFORnrBOnLlYrhI=;
 b=iLV9HEzJcf8ktUwZmdMrSqn7p+iPAUMZAPEEuZ+/v5Lr+/JuT7+9UZcqkbTNXprylITduuzz4C3dADqBPwOIKWwAMdssRjB16AcZ5mI55TRhyl2NBre95ujlbPFHk/bJaEWJiJu7AkLLVV2F6tkEAajJSqPeaOq/ehBIjJM7yo8hpjR2RaWBbRaFh+nN8MWWlSRjwZrD8Fug/LxJMzQT0C6c5xykJ6RNnXynre+qKi4ElCW1spf2iiaVTwH7rb8oihlCgEh7W/6v0cGQRR/6SboC8MWWiHKInbVaI2/S+NHdCLzd5AN16bR+SCO3SjtydKzyI75h0eV98RNT0vBtOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+RCVkYHkOSgKiFDNbPFC2F9keZnpzFORnrBOnLlYrhI=;
 b=y/AbZpJH7mNu96AOdPJRZAHc2s5ZBokdtiUH/EVPv3ZnrkDmk7XGIGhFkvgyjL1Z4SDg2aKO1WxmuKEQQRK4DkfyzG1LdEkKAB30j2e/JE54/GNv1VukFybTPtYS9MwDrFt//+56I9ZVO3Ye34KOLUL1zeQE+vOZfL2NhF+oIng=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH] libacpi: Pass missing --dm_version to mk_dsdt
Date: Thu, 26 Mar 2026 10:40:12 +0000
Message-ID: <20260326104012.2649454-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0200.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::15) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SA1PR03MB6628:EE_
X-MS-Office365-Filtering-Correlation-Id: de44f627-8874-4a41-d92f-08de8b242080
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jiDgHAiQKTmDoASWuW90HWC+wv8I8AJAAj1i72+PBKIrOYHjwLknjD+aiOzPv0QPuNpqUw3ALQbOJi/K/4YF3yTm6MLfFxSbfKazm2fef6ehDr9M4hJuEIz8gleLXSZOR3p2MCOQD9W2UO2W3RFOGusVmr0Sm81pCWH6LLhg2X9OGdp4Ok02LyLRN+yc6aUTK3/T0gv+yAHP6+DrSyQnFdIUdXhbak66sRF01rb6QFZucrRI/SobjFSn2QrIz+QARttaMmMw4KGEaiEmCMTYppHhCPDdqepqvbfWV+lOB7rfzoign+nwVcLRAU6mEHFusmaDG+GMnZmP3chu5N8QqnTwNnBpEeXMMcAfATyo9zxBH7MJzHNckqI/LbHDdhfhFgrpw188oVR06VKGnaVehZ3way85wJIT1V9LhlxvLkfzT0PVH/Pa1QGI3llFsulaGrVWHoGi+766KA1V/8FCv6tXp8Z5jBj0NCHJE6AhHKnL2ObTiHL6RUObmwJoAM05B6+97SVi//FA2jCFk9cI1Ru3TmfeFY2h5fZ8TLNEibca3h4Ytv6A61NtQWGPbw3KXdd254YaueuQREh6FnPy8B5smXzEStAlOnIJNhfHRq/DHDAL2pCLO1qRliwSLXGSeeJXNjnOCQd9Iqfej4IlYqIbKRIibU7MuHPm+kgNuYCjM++Ie6HkCWysTCI6gSSpNNB7bexAOPLf/jTzMru/WnsXqWk+XJBwv5b5a2zDbHU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Re6CXY9uy/koxopYN5Ygv2PPg8KLu/xPL6SkOY6HqmsVWeGLotHXQLwXnR7s?=
 =?us-ascii?Q?l1b0/H+9SgPobY5Vf6j3pwQ/r6W2+x/Q5uIY8PxwjeoPVwh1UwDfBWrzGMhb?=
 =?us-ascii?Q?4iAX0ocmW4H42b/UYmkcIbBYKQFRoJsakd0QMcw/tgHUQxOYOEPhWOfqk+aZ?=
 =?us-ascii?Q?zCS8E107p6GRL2FbBi2HsaLd9kskjsWz8iVDxhWKSgOniLiYF9BtkLmJTUPA?=
 =?us-ascii?Q?3ul96zkInJN9oFwSLcNW2h+UhRTRH30w3eu86jWG1m/LzXWZjXdWttfN2JVP?=
 =?us-ascii?Q?RE78K0TsZ8SrUytIJflDiqOEshNeTP+DK4khaizH/5HY3JdMslvZNGI6NMQM?=
 =?us-ascii?Q?eB8sn++xl9XF4KKo6ckxX/AnWYz8QYoNZTlJYSj7KnU8T1+PFMPszq3VPalM?=
 =?us-ascii?Q?9IBCNQBqekesidYpWdrcc8wchE6NRc/j26NeI6ISbf5oYO80t/nZTlvv9Nnz?=
 =?us-ascii?Q?9sDO1ZY2tDwCjJBL/swSuP+ql68jkzignrJmmKZSuKcjDPe4Lb4HOvPIbB1G?=
 =?us-ascii?Q?1W9LfrxX5Zv+4nsxckd2yEFQgeiCqLzlwbiM8PX6ZHewNhZvzfVhX9doyuLh?=
 =?us-ascii?Q?ySwc41PN0bPIXtBdNPoDOH2UZNNStq+lhQkYg2tQa4DopMgNmoOvCTfBiMSu?=
 =?us-ascii?Q?O4qnjdCYZeQ2xkZrhnzhaZl3/aQjzNvoZ5mcEvsXPFJV4E6WtJsZTj3mugPy?=
 =?us-ascii?Q?TOB+1256SwE0d5/0bP0PX5DDL4MRryW9L1UjDgMl/5TnBIxuX/P0Sf4X/D4r?=
 =?us-ascii?Q?J4dMB89uQSH3zivgJ8+yspzgI4TtNBNfAaJP6/mywFAnbBZHsGIIGMSrQ8DW?=
 =?us-ascii?Q?yTP6LzEWqTepJhGd4TxZQR+5W9OhiVMotTGnezkIPWnaO9G2NSJOzZ5RNEnV?=
 =?us-ascii?Q?54oK4EK7JY3/oknegzhZfF/5S1pZaXuyEw+TOWJuOJQ/jq+c0MsxhemK7i8M?=
 =?us-ascii?Q?dFkC95RzRc931BCfTszB0T19R5dGR3HSZMD3ULuX3AW7yF8/w+c6lqafMoQ2?=
 =?us-ascii?Q?4r0Mbbh8j/8ngbFbpydZDhxRHROcXl7vwvCXVyYndri0zll3qi7CeN073ZQv?=
 =?us-ascii?Q?9FzOT3qatu00oFt2GvoHhrSpPhnYlzJmVw8xdvMf2Db0w57gfHeUgnz+DY4Z?=
 =?us-ascii?Q?3HfCBHVVF8TXRDOQ2N6EOm6In4nadMEAyQ8CAKxLWkwTCLh1g/QKRA9i6pGy?=
 =?us-ascii?Q?+X565aWE4xAf7Nm7zjCb8dRaCMhuVqSsPnLOwFBVm/WMhlo3Xcttb5cTyNSh?=
 =?us-ascii?Q?DjPRzKEfdcLbOF/ve51C5DBnfjHXy0pXczRUI5ruKDDk48WYe/CVe3LPCE2J?=
 =?us-ascii?Q?dWCvhEURyP2DlA1CxTa3S4jz+1KDCesC2lg63lqYT2evENQ0fdCNXSt+dmYk?=
 =?us-ascii?Q?dV47dnDlzZkA0aXsOeGW0y/2uGiM2XUgkbX/ExSp4atCdvSjXnW8t4xS/FmJ?=
 =?us-ascii?Q?wLnNQ5AAjFdwnj155wKRnvh4CZG2LMbCg7ws3mu6zd69kzv/Ne2VjoCzMPnw?=
 =?us-ascii?Q?BIBOdqggTN2ysmBvVFlM7mPJ9wjEHZvTXxRhp0Z9WBKFPEmdzE2wPU7VXQCK?=
 =?us-ascii?Q?l7Nc33Z2QfuvgQOUozOCRM+n4BbUBBVaYVKpk3euz0vOncFxAYcjsaL5zXVV?=
 =?us-ascii?Q?nVIQSZpt5z4Pfi20MRQIoer38RzsJEPOrbxZX7tzgHZIuLq2Vplwk/pT2qxY?=
 =?us-ascii?Q?eGBIT/qJZJ9DHsIJ+Fkvp2ZuAIUbnzCkST6mSWSoWUQ70EhK8crkP0HDJ0CL?=
 =?us-ascii?Q?NJnVGKiRUqtu8CEn8lRr3BoVOw8aekE=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de44f627-8874-4a41-d92f-08de8b242080
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 10:40:41.4330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Su5y5KfR4qcTVx8zonfRRv5UhrN6k2B/WJ/yLnhH4OyxyZ5cBGDAarEnfEcXtcML5cXdf5UaJO2gYlekbc46joFOlbla5PHVEp2AQBv+kd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6628
X-purgate-ID: tlsNG-ebf023/1774521644-B9E809D1-A33D0B0F/0/0
X-purgate-type: clean
X-purgate-size: 1269
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
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:jbeulich@suse.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AAFCA3339D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit 19ab8356abe4 ("tools: remove support for running a guest with
qemu-traditional") made passing --dm_version to mk_dsdt mandatory on
x86 but didn't fix all the invocations of it.

The previous default was qemu-xen-traditional so with that removed set
the dm_version to qemu-xen for this invocation.

Without this change, Xen fails to build on x86 when using
--enable-rombios.

Fixes: 19ab8356abe4 ("tools: remove support for running a guest with qemu-traditional")
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 tools/libacpi/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libacpi/Makefile b/tools/libacpi/Makefile
index b21a64c6b441..193ec786723f 100644
--- a/tools/libacpi/Makefile
+++ b/tools/libacpi/Makefile
@@ -51,7 +51,7 @@ $(ACPI_BUILD_DIR)/dsdt_%cpu.asl: dsdt.asl dsdt_acpi_info.asl  $(MK_DSDT)
 	# Remove last bracket
 	awk 'NR > 1 {print s} {s=$$0}' $< > $@.$(TMP_SUFFIX)
 	cat dsdt_acpi_info.asl >> $@.$(TMP_SUFFIX)
-	$(MK_DSDT) --debug=$(debug) --maxcpu $*  >> $@.$(TMP_SUFFIX)
+	$(MK_DSDT) --debug=$(debug) --maxcpu $* --dm-version qemu-xen >> $@.$(TMP_SUFFIX)
 	mv -f $@.$(TMP_SUFFIX) $@
 
 $(ACPI_BUILD_DIR)/dsdt_pvh.asl: dsdt_acpi_info.asl $(MK_DSDT)
-- 
2.53.0


