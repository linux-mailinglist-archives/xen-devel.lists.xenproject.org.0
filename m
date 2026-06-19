Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wW97G/HXNGpniQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 07:47:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B124B6A3F9C
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 07:47:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b="TMEDRX/m";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341679.1601938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waS3Q-0008CW-Qk; Fri, 19 Jun 2026 05:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341679.1601938; Fri, 19 Jun 2026 05:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waS3Q-00089n-KJ; Fri, 19 Jun 2026 05:46:12 +0000
Received: by outflank-mailman (input) for mailman id 1341679;
 Fri, 19 Jun 2026 05:46:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1waS3O-00089h-Ky
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 05:46:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waS3N-00BEP3-A8
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 07:46:09 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a34d795-e002-0a2a0a5209dd-0a2a4508b500-20
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 07:46:09 +0200
Received: from [52.101.72.73]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a34d7a0-9ee7-0a2a45080019-3465484967d3-4
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 07:46:09 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by DB8PR03MB6266.eurprd03.prod.outlook.com (2603:10a6:10:137::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Fri, 19 Jun
 2026 05:46:06 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%4]) with mapi id 15.21.0139.009; Fri, 19 Jun 2026
 05:46:06 +0000
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
 b=gLsTRnnf8QGnzbeDwYomztBmRYl8i9qW3cq/ajF1oCXzvrxaDIFfidWsU7n8bzhLcQKl3/nuE6NeqvVzE+pCMa42vvNW/vGZYziEw9u7JUPpGqdMDqZZ6FnxRqLPZ/4HG0l08wYZ4qXjdipll7/gk0ZyNhx0XpxdVcSJEb8ws/477uVmVKjWoKxbEQCiOoRsJyLcWDUr1HxVtEY2+P1djqDzTuZeIMmSMroGiNpSfsfGlCgkRuNKhLLo3iGI85KV71PUOxHYy8/85JJlBTb8+C7eInXGZ8N4lIRBEdK4Bx6+2A5psYjmciSIUjmA3blX25rf+BC5Bl9vCcUsnZcFHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEHoiDLKH9yyQT8ttaqQSBZWLwAtBQLeySpUAj2AFW0=;
 b=XwzrADuv5+jZzvChzmp4E2Yo55Aa2SXl8O4PHgOg1uAWFO44RjFZHUjPWPFotKLNn/ipZOkwIIbTcAjFplKXg3JjeCmGVpOVxFhR/L/y8Fs62wd2+rr2pD5ZVZC8oGJ8NlfPe6A3Zq6zcvbFIn8Ks43qWhR+JiAtiv3cV+MRkEsWb96wstC3uocZ1BHVrBkloJXvDKxIsc6A/k+DZhg1z2xbqMs89CAeLbQSE3wDtlnNBZN5h+azK0pC43z4xa5S5GmgTDSObnnPPjAg7RVLEhYoWuAtaunuPpdxGeBMybwwCY+pH6jjX4OrSNrsQNLUUdaabhqOAEnA90vfsrMtPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEHoiDLKH9yyQT8ttaqQSBZWLwAtBQLeySpUAj2AFW0=;
 b=TMEDRX/mSkblDUli4xxIx3rWQEGEthp8bDuKR+nytMfD4VbnSbw8KaXYQtIKDvAZrvVdcCNepLdjU6MJI9q9uoyw61pS3nrAJixVd/egT8pgpAxu44lIZgmIh2aHQ4q9RkzvmsEzNz51iuwYDFrbMErMnPvSkR3UjpC9WVYyJkcdE9rkPIDVQT2SMRZLoVs+aedWQqSKNugs5zA0UO3GG1OCGK+keXUNX6fZNEX999l0jTZ+M2wWu7/9SDD5CCH0IGm5an4W03zyf4E+RkL/zN9xeDFAe9ObDhk28sgBukt2mX9oa7sYGQvvsORANVfuFJm8lUeayePCSnUpVeyFsw==
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH for-4.22 v2.5] xen/arm: gic: defer host LPI allocation until after ITS init
Date: Fri, 19 Jun 2026 08:45:52 +0300
Message-ID: <341edd8de63dcd84ccc6e7b6c03e9e8fc7105184.1781847061.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <112419d3ea48ca328849c8f6647909d3eb667b40.1779922874.git.mykola_kvach@epam.com>
References: <112419d3ea48ca328849c8f6647909d3eb667b40.1779922874.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::18) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|DB8PR03MB6266:EE_
X-MS-Office365-Filtering-Correlation-Id: 32b6fe1f-5a87-4f30-6941-08decdc60e21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|56012099006|11063799006|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	+YxC1hNi2UYVNSFPs+wHnrbC9ikbflraRs/hvjwQeNZ4YpCz4g51i6T4DAhqddEOGDyrc0mqIz/+Gir9J4e+h1t2Y4OOPsWreFjtTzvEQauAnMRWZDzjl8Q5AvHLNMJ185xS8U/3t202c+/ShY8lsxtfe+rPYzhyiy2kAHUPnHf/4BXfwiPsPi7HTPqphfApLcGWqQIjzwKpIpuMR0vTyObj3310lNragwn+M/44n//nW8swWD2C5GuGSSxudHOjm+P5OP/0N3vs44KfgLIgrGrynRK1qStZxubZIjESQyPN4fNRlne0PQx4I3Hu7feIkshuEA957YrenHLniSwJEr2wcD3Ld7ZbF4OmwUWZu8j5rhMcWsbxOaAKQzjcM9gETblXBa9lD5Al4y7GfohQ2mWaubDOV87Vg+hejuwYHXeXUS7+MDrgEGs7h5umxhYaw0cZF9BlEVGQlGdXIHaULgsH/OJWQt8BKcdyYnzcPALGi3zr5/z4wn91knew9uHjadyyBzo5ckeTzDWAxOXtyo81+E56jdlVp9K2QOYmgbr4pyyNcKD0HoA5jQr9qcL1wDxrexlhEhVA1lc7IAVS7jDDNtLvzHlaUW/B34RuNZ8mdE3hg/hBPyHgOxrxFGrVt8Jdf/ecZUxp7K4BMDbceHMuYKl9JbGjHQ7fy9t04oM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dgHpWQlU0Ih3OTIcrzkBKgi02efj9fZmqF+DN839pB2AbG53vDHt04vGY2Sk?=
 =?us-ascii?Q?SKkJn7+wilvRFRUZfE/zpPDv/kCENvIGJbY/sc28ssZkZuZkE816CmV8Qj8R?=
 =?us-ascii?Q?o5OK8u/MjgZIV++zq58xxwHZdVywBzdUMbKdME+dX3j3a4cxZA4+N+bNjQu4?=
 =?us-ascii?Q?KFLc3mIwsobjbEprVtXRz0XTeOf5TTeyoPBS71S/XyR3cEkyvqrXL6fV4YRn?=
 =?us-ascii?Q?husmyDxZzyoHtfXgwAXBSyPCPJ8X4d8vRFSha6PtoYaAynksooXMo+dM471S?=
 =?us-ascii?Q?6/QAwffqSVLT6GRZ3sRlWXjpIJ475tPgiTf4APmB+pZWqrlYb4waDiY12Vyr?=
 =?us-ascii?Q?n2xajr+W761KJEnsRYN7fPNVXj8JA0Y3VQSRTm24Lppq1MEnV6qtrcvvIlJp?=
 =?us-ascii?Q?0dFEi3D1cTlv3z/U9JW6ngqdClOQHbx0nGVkxDOlq+T7Fg1e/IstG3xvzsIn?=
 =?us-ascii?Q?8k5Fwgq2ig4arGbMXz7Q14tWMgK5akgjUHOSinNUT3GVc8p71rdtB+0goJQ+?=
 =?us-ascii?Q?dzApMNDPcagZkhu939ODVgGi0HWoQ0TJA6zI1150K9+IQYOLWSiGUS5CRpPK?=
 =?us-ascii?Q?dy3JZmC3hHr/8BNDTssRtNsmATx2UU69UFpO+gk1/c4DcyDWVhaCib2rB+Cf?=
 =?us-ascii?Q?0WNtDiYMJHCrsv/vBEyHkZrJ0r2SDH4m5kHC27AxEdXKlhEBLqy+0ooHXUcM?=
 =?us-ascii?Q?1HuvRRnELfajLX7JdhsgDrABr493NVQkMAZ6nV5Q7rY1Clc0YEIhepl1StbQ?=
 =?us-ascii?Q?rXp9sQ+34ry+La2dAxtGs5tX+C0ieLj6GqLyzRj7cPfbIkUCj2dzi3nSm+ve?=
 =?us-ascii?Q?jMV3+5kohnajzlaQl3rdsOJAygfbdojad8cPSJPBjw9MMkGQcBSrLSMI75g/?=
 =?us-ascii?Q?RpmDqUDZCuPE/j7lGTa3ydZkmIjiy0ayqGVF5jdO+G7SBC2dji8/qy/T1HOH?=
 =?us-ascii?Q?nuoP7UwbwFi4luU2H+tg674zQ56kiSuhORwzRIVBSWl1cmTtkXeBHslaIpxi?=
 =?us-ascii?Q?OliVjD3UNFifbwEGNBq8WXARxmyYQekEqUozZLcHrn6VgV6mQxxe7baL4nYV?=
 =?us-ascii?Q?tdhuFlYHtao+3sTvrfHdfp4A0va5FV9vwXub3jYEkyFLWOpOVAOAHl71C3pZ?=
 =?us-ascii?Q?h23dzaBabkI6bUKBOE4jUuFQeWlF2sR39CqGt7L8ud+hakOD7D3KnWpoiqkD?=
 =?us-ascii?Q?ySVNIb9Wiw/Odgoqd3mPf4lfC4ruM7mO3og+vxy7Fz8p11LJZGkikCGsQOv0?=
 =?us-ascii?Q?8Z/n1Phjm3uNI3minWrmifey9EGekTkssfXxxk4oIaZcn3vnA1M2NsMMuhtL?=
 =?us-ascii?Q?BXyAnCuS784w1h/Q927xwvPf5KOHlVeDAN6vFxxbOyNhampXCdFgbRfl1WGr?=
 =?us-ascii?Q?zjlLbTvnNv8OOrepTxmem6tnxtwDeJYFh2DELzFt+4Pbe8OWYAVgKC+ewOHF?=
 =?us-ascii?Q?lzFjQYuO9RWvfhjL9MWDnTpyloPKcsetZk8DpOt4VXdW6ytaZUcCM+tP1oqu?=
 =?us-ascii?Q?SbRjmDZdD3JCD1ztG4jo+1ZUdJJ+4lkqzA3e68ReeF8DMjEHbB8iWcryZg81?=
 =?us-ascii?Q?lr/M95V8GbSGBsLHIyCztQOB1uxRESG9IYXPPSW9NMs1OUbb/dG5RGT+Imeo?=
 =?us-ascii?Q?w6Po/exMnVuOkAhhtIjjxmRBfqtxqlFlhp0XodrYYNFLLrIgUdPi2BQMqfT3?=
 =?us-ascii?Q?1aS7EzElhTakyEIl9tNclmFN2zcG7B+yTWgQ7PL4jtCc4C/wBKG1mO3bd1z2?=
 =?us-ascii?Q?afzH7OwYGQ=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32b6fe1f-5a87-4f30-6941-08decdc60e21
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 05:46:05.9347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +6ogyV98xQiFVXSfr9QujjgtRAfnCHmrG0briwRZj5Jatctgmta63ZhuNPf0B02ShRwX7wPiZEcjkw6Q2x1ahg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6266
X-purgate-ID: tlsNG-c1860d/1781847969-5F9E20FA-2618B11A/0/0
X-purgate-type: clean
X-purgate-size: 3519
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,amd.com,epam.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:oleksii.kurochko@gmail.com,m:luca.fancellu@arm.com,m:xakep.amatop@gmail.com,m:oleksandr_tyshchenko@epam.com,m:oleksiikurochko@gmail.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:dkim,epam.com:email,epam.com:mid,epam.com:from_mime];
	FROM_NEQ_ENVFROM(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B124B6A3F9C

gicv3_lpi_init_host_lpis() allocates host LPI state, including the
host LPI lookup table, CPU notifier state and the boot CPU pending table.
Those allocations use gicv3_its_get_memflags().

ITS quirks are discovered by gicv3_its_init(), so allocating host LPI
state from gicv3_dist_init() can happen before the memory restrictions
required by the ITS are known. On affected systems this can leave
Redistributor LPI state allocated and programmed with the default memory
policy.

Move host LPI initialization after gicv3_its_init(), and only run it when
a host ITS was found. The old call ignored the return value. Now that the
call is made from gicv3_init(), check it and panic on failure because
Redistributor LPI initialization relies on that state being available.

This also narrows the condition for host LPI initialization from
"GICD advertises LPIs" to "a host ITS was discovered". This is
intentional: Xen currently has no supported LPI path without a host ITS,
and gicv3_lpi_init_rdist() already rejects that case with -ENODEV.
Therefore, on systems where GICD_TYPE_LPIS is set but no host ITS is
present, skipping gicv3_lpi_init_host_lpis() only avoids allocating host
LPI state that cannot be used by a supported Xen LPI path.

Fixes: dcb6cb263689 ("ARM: GICv3 ITS: introduce host LPI array")
Fixes: 751ec850ec1d ("ARM: ITS: implement quirks and add support for Renesas Gen4 ITS")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Changes in v2.5:
- Rework the commit message to explain why host LPI initialization is now
  tied to the presence of a host ITS.
- Document the intentional behavior change from checking GICD_TYPE_LPIS to
  checking whether a host ITS was discovered.
- Add Fixes tags for the host LPI allocation and ITS quirks ordering issues.
- No code changes.

Changes in v2:
- Replace the v1 ITS pre-initialization hook with the less invasive
  approach suggested during review: move the existing host LPI
  initialization after gicv3_its_init().
- Check gicv3_lpi_init_host_lpis() and panic on failure, matching the fatal
  nature of host LPI setup once ITS initialization succeeded.
---
 xen/arch/arm/gic-v3.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 17ff85ef5d..acdac22953 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -764,9 +764,6 @@ static void __init gicv3_dist_init(void)
     type = readl_relaxed(GICD + GICD_TYPER);
     nr_lines = 32 * ((type & GICD_TYPE_LINES) + 1);
 
-    if ( type & GICD_TYPE_LPIS )
-        gicv3_lpi_init_host_lpis(GICD_TYPE_ID_BITS(type));
-
     /* Only 1020 interrupts are supported */
     nr_lines = min(1020U, nr_lines);
     gicv3_info.nr_lines = nr_lines;
@@ -1990,6 +1987,17 @@ static int __init gicv3_init(void)
         res = gicv3_its_init();
         if ( res )
             panic("GICv3: ITS: initialization failed: %d\n", res);
+
+        /*
+         * Host LPI allocation uses ITS-derived memory attributes, so defer it
+         * until after gicv3_its_init() has discovered ITS workarounds.
+         */
+        if ( gicv3_its_host_has_its() )
+        {
+            res = gicv3_lpi_init_host_lpis(intid_bits);
+            if ( res )
+                panic("GICv3: LPI initialization failed: %d\n", res);
+        }
     }
 
     res = gicv3_cpu_init();
-- 
2.43.0


