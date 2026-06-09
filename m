Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AjUfHCsuKGrA/gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 17:15:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D59B26619E2
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 17:15:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=vV0OHvGO;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1333492.1596517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWyB3-0007Qg-S3; Tue, 09 Jun 2026 15:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333492.1596517; Tue, 09 Jun 2026 15:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWyB3-0007NR-No; Tue, 09 Jun 2026 15:15:41 +0000
Received: by outflank-mailman (input) for mailman id 1333492;
 Tue, 09 Jun 2026 15:15:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wWyB2-0007Km-Rs
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 15:15:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWyB2-00DzIb-8b
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 17:15:40 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a282e19-2eae-0a2a0a5409dd-0a2a4506a610-16
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 17:15:40 +0200
Received: from [52.101.201.26]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a282e19-7371-0a2a45060019-3465c91a129a-4
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 17:15:39 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by LV3PR03MB7523.namprd03.prod.outlook.com (2603:10b6:408:196::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 15:15:37 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 15:15:37 +0000
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
 b=TVIPmI21Kgdk+ljPvBlSvT+0ax1gmDfqrQ5jA24cf5vZ7g9wkcK0ZA4hmkEsfcy/MMN8V1/mjiGitWS1HKWvfvrUikeeiC2+UNh943O+pMTe9ScFRWH7yUs9sphN0EFoWSz0nkLYFjNg2OrS8yqtiIQ1sBflTrDk2wUocqlBleQctvI1jYYRYbG4IVduBGLGmQ9TI+/rAM4UpntF1OsO0K5mIlU6ypLeqZ1ghnwOKWFTa3YDYDVk0dXotUXT20CD7WwECsPBEvCvnv/tSrmd8eDcH6C83A9Xy9GeOmATipd0YadPB3k4s/J7RQco0ofCJYF/MmMA0fy+RvtuU6uQfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCiYcjADFgsxAz71CoNGnpjlgnb+QtefvZ3g0STi4ko=;
 b=A7U6pjT4YvKJvMeMH/5Nyh8kQVEcZ7OpLlwX/xBIGTTRG3FfyiFPttl2qrx1Oos4DD2ZjE6ptppZi8FCas8CWuSg7GIxK21d4ExQMNQskzUcYT+plciSLi3F3WzmER7pMOMxLUtRKmk7e8coavJEzYyGXhQ8hDwbrMMPuHk7YmM5hOY6YPuG9Lp35NghjG380rwf3OlurvwuMgmVqnU9eDkydDym/lhKG66Wy49T3YEC4DjCsmhTEKITqLpYgRNLSQ1ogXdlDnipvhhFY6mPLxU4xBFLyS07epzEJeeaeAkNQOUQABKYrQcwPfn5LT3il5YZ6P/bxwXZ4aY18uLPAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCiYcjADFgsxAz71CoNGnpjlgnb+QtefvZ3g0STi4ko=;
 b=vV0OHvGOg7CbHqYBTnbcaYKJtkhe9A2p/6Bc9VibowbBIEyivI4sreI7OdF03CwLfwtbbjhNyF5W0O55mUQKw0rRwyzG1doiCuTF9MS7J7IDo94yRizrJxP7A5VKQFounaqpF0XuDuxHXdcKtm/l5BNdzHnmKsnFFiAgkGT9QeU=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v1 1/2] domctl: Handle XEN_DOMCTL_getpageframeinfo3 without the domctl lock
Date: Tue,  9 Jun 2026 16:15:27 +0100
Message-ID: <20260609151528.2426788-2-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609151528.2426788-1-ross.lagerwall@citrix.com>
References: <20260609151528.2426788-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0363.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::8) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|LV3PR03MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: 60a4eb8c-e0cd-40a7-3a10-08dec639f5f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	o4/Cfk7w8PzUDPiroYZIqJMdZPomDNix0bHdNMSdHUQFjWC+mR2+4oKYZ5S/VC1zQSXuW18cB65Qvjc65zVOoggBNrowjU1JyXOzkcf0Hj2CeiKMd9BLXW3JWymzP3584aBWgMNTWU64tdBvU+ZVK51JMmvV+gYf4I27Rrl/kUvchO79Cuhpr0ttEFY5jYEk6GT/2aADRoPEUNwbuuA8Q3ZDWOF3fYoUcv5OxOwWDBVbYC55L70pt4xMwxQCj7k0cNeKo7lu2FLzABecNtDT8D5ApGPLgCTekZL8/UrTF5swwdbQIZrvb69Zy6ifO9Cos1NsVRoCwG4KHgoFKtntUWyvrDkxjkteqfME6jXiu0KN2XqxcrveqoHgvW1CIBKn5S3ssNgW3rGD74V1bnD/uZndcHxK/ppyUjoNEAbVJrbrHAaGVLIfxYjNgknJoLQMHK6XgYIyplhG9L9n6yVldZGQSInsIFZcvFuiULPRAzQb/CvE4Dj7yzTMooF8ypqKrqBEboFYGy85HbwIKdXl3mWtANYvGjvIM4s3fJTYDqcGeSQIKovy0uKI15vBx9+LG7hfAbiGfWtMBPoGloAwsGEZiEN/vSL2eKTtJ+kKA0MLGoiz4JDjmEuvJcedmLgAClZaSj8vguwGMRbDVj4bx2bwFVj590+2kFVRQhImznPs9KadZCjoLENr8GQsLehW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?APaIZmEvoTTJTZbNQv/czeNiz7H5nQFBjXuBBSBKgcmB16W0GK7whoYASU6R?=
 =?us-ascii?Q?mSWfpygBVNALJyud2Djlg6f3m0HiVGTieLgLdaY0nd2CztET4LY/KA3SveFi?=
 =?us-ascii?Q?7LUlPoLV1a1QP/WcH/NtrKfUASxAGj7F6e9tnq6vm6z2JR/Is+r8G2LRk1LH?=
 =?us-ascii?Q?Xrc78g0tW0rjsL3kv56EnDjRCA4Qfn3DKiNPzkXEXqnt0jtxXa+ukLxkXMKs?=
 =?us-ascii?Q?nbw0h8pMGeBSlAGm+Zd8ruTnS8SBqTYFpFyBgoKxQ9e4WnW1PZ5tNLL3Gl03?=
 =?us-ascii?Q?nG3bgRqmpt0xBpV5JMVbhnr6Jj2DMwLWRQ9/aQPUO7U3Y8+t7cf1Mr7zcqnx?=
 =?us-ascii?Q?DJUtCCIwH2be4H9V4OowSMc84/Gl6BEZE9bzAALEdAeU8lqDdioMcVFvW99Y?=
 =?us-ascii?Q?NS8UBwDGDMecm2ftRzdEec62aoVz1wZgDTc7Rb8iqFGYDEDWnUyBIMCVn4qN?=
 =?us-ascii?Q?9FNUOC3v+kDCnjY99ht3IjwyDlnGJ1o1q1eevj2GGZ74mBxSAnZP2bLGXO1F?=
 =?us-ascii?Q?5MX+pyZjhhcmsPIYJ8FWdqd2Y13Syde5Q5s9H8xIvC95GML8fm1OJTwVVc73?=
 =?us-ascii?Q?nxfMYPhSxJP2S9STSJkFFKgTLOAxwVrEAtQJYOIPJcDe1o3ZJ0O6U8aAFr2a?=
 =?us-ascii?Q?RFdBZCxcNWWaun6osoAiTIU8RoYvlJrVIGBQkCwjU0SVn7SzCuFqbzmgbEG/?=
 =?us-ascii?Q?+zhZEUiyJgb1Xo5PDA6vhJrhCwfoWpicTL8jC9C6Wh3mpxVYiuftk82bfKfD?=
 =?us-ascii?Q?RhPq8cJRkqeJLSDUwpe0OdCtL6PFjxWTJ8ZvQvp/Pw9VQzCe8qrriCnrigla?=
 =?us-ascii?Q?Hh2QFdGMbAx4ZhhJmsM6ZX2XPSEvzYAx4J8OZv027EWnq23tbyA9kQhcLKQE?=
 =?us-ascii?Q?cB1/Q5/IAq93wFtH1+28R4XBM4eejZXgfYQKMQG0mxBXcNsvX8T1KjYmpCSD?=
 =?us-ascii?Q?jIgqDeTJM5ZPjHVEs3Acs+FMEq0p7IrxjthjwBKbZNIvh00xtwCTV/p7Y3pN?=
 =?us-ascii?Q?RHI+Z6NhFdbfu3cIBkAP3BHuff9XBTFa4SNf2uW7fOhLiHgl+Y90gMKyjuxi?=
 =?us-ascii?Q?DiDHPU87F1eOIrHugW9NBWbloB9/mst9YTsyTTBMWiex7tVhAFNPOcrzSV99?=
 =?us-ascii?Q?Bu1l96WqABApR+5GtwhlgashTcwbvJmP1eiv3Vv0Spxqhds1JcFFKckKZx8d?=
 =?us-ascii?Q?RYtoPNsxxpDB1xj2vywf+kXDxOuDIrCde5ErSrRAshdV8RVRLssxX+Y5Zaqo?=
 =?us-ascii?Q?c9Bk7WBJJVLiqzTvAX4UGA3Cz1MfH7nQXI4mRerIZGfswgupiDsCc+8CHxDo?=
 =?us-ascii?Q?6hIVzTi64KSPJk+oWPiSJ1lNw1Cg698jcMsaIH8Ih0K1bBDhSi2WK6c/fnmC?=
 =?us-ascii?Q?6GrZDueRLvdwyoTctbEk8xY2N+kfgiIp/gwWfBfRH4a538h10O/FGkKrrH/v?=
 =?us-ascii?Q?alFhdXC3KeE9/Bo/A4rFAOjpVWOdpNU20AWEvf9szrt6zCIDwD9SApfDh+nI?=
 =?us-ascii?Q?OBUgkD6k0kEcnsjHS7ZG/yno4+3mfN4P5GxfcfJbQLXRePy6ZZhKq4uekNgi?=
 =?us-ascii?Q?wHeNu9iqyv3PvDPuEMkXIMYlhOxb3cKVs2o+Q5Y1ywkTPYOt3P8uxdhOMGQW?=
 =?us-ascii?Q?KhGZdv4qMhj2cmeYXxdoHz50Eacertk4KDJjlai/LdNmsin6uS/8oy+Baepe?=
 =?us-ascii?Q?LmjtIPeyCbq91XlZhV2w6IZyyvGmpsO5+BNrgwdWy1ZPlrc5Js9gV/VG1CCP?=
 =?us-ascii?Q?oNoZWvfa41fSwzYmXsU1iAIxDB6E2uw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a4eb8c-e0cd-40a7-3a10-08dec639f5f6
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 15:15:37.6724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OsnLsqLI9L/SdLq5/ebs1Jna+DaB6yzfeVXVcFhAX5/bUvVGfXgQIVpQB+pP3e0aHoyd3iLrIVG+lpye3eRf4QcfUlnrXUgffE3bGJJ96OQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7523
X-purgate-ID: tlsNG-16d1c6/1781018140-8FD7AD75-06035F2D/0/0
X-purgate-type: clean
X-purgate-size: 1358
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D59B26619E2

It does not have side effects and is protected from concurrent changes
by the P2M read lock therefore skip taking the domctl lock.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/domctl.c | 4 ++++
 xen/common/domctl.c   | 1 +
 2 files changed, 5 insertions(+)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 83bf51e498df..0e9a2532887e 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -301,6 +301,10 @@ long arch_do_domctl(
         /* Games to allow this code block to handle a compat guest. */
         void __user *guest_handle = domctl->u.getpageframeinfo3.array.p;
 
+        ret = xsm_domctl(XSM_OTHER, d, domctl);
+        if ( ret )
+            break;
+
         if ( unlikely(num > 1024) ||
              unlikely(num != domctl->u.getpageframeinfo3.num) )
         {
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 3efa5b9d55b9..35144d95b808 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -555,6 +555,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
     case XEN_DOMCTL_gsi_permission:
     case XEN_DOMCTL_bind_pt_irq:
     case XEN_DOMCTL_unbind_pt_irq:
+    case XEN_DOMCTL_getpageframeinfo3:
         ret = arch_do_domctl(op, d, u_domctl);
         goto domctl_out_unlock_domonly;
 
-- 
2.53.0


