Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KH5uO131cGmgbAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 16:48:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 863975972F
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 16:48:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209948.1521822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viaRU-0003pn-T7; Wed, 21 Jan 2026 15:48:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209948.1521822; Wed, 21 Jan 2026 15:48:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viaRU-0003me-N1; Wed, 21 Jan 2026 15:48:24 +0000
Received: by outflank-mailman (input) for mailman id 1209948;
 Wed, 21 Jan 2026 15:48:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6Gw=72=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1viaRS-0003mT-I0
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 15:48:22 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b34a977-f6e0-11f0-9ccf-f158ae23cfc8;
 Wed, 21 Jan 2026 16:48:19 +0100 (CET)
Received: from BN9PR03CA0495.namprd03.prod.outlook.com (2603:10b6:408:130::20)
 by DS0PR12MB8367.namprd12.prod.outlook.com (2603:10b6:8:fd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 21 Jan
 2026 15:48:14 +0000
Received: from BN1PEPF00004683.namprd03.prod.outlook.com
 (2603:10b6:408:130:cafe::c4) by BN9PR03CA0495.outlook.office365.com
 (2603:10b6:408:130::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 15:48:11 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004683.mail.protection.outlook.com (10.167.243.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 15:48:13 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 21 Jan
 2026 09:48:09 -0600
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
X-Inumbo-ID: 9b34a977-f6e0-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hu9OdlCnb5K0yJdWCQLLhUZJGLdXrebvwSBS8fKk3Gssrb4MMgGaj58KvKNm8DEctJeKXugz+jXvxiYRCw2KSEaGJQvRSsVUhqSo92NoBeN6lXH2XMG1+Dtb9d7rZCSIVWq9hdn8yxUULx+DZEXvTmHYy49lDKU8gPXKVIcaSQORmiwdBJdgvN75thaPnsC+VTtgXavN8YCbagJDEPJ/BhROS2khbNDymw5xexKnoayaNEUAU0IUB4q9JqoR+92vjFGMlB4EuuPhMjZn5XHVIOZ6D8bbIJQkxZh8n9F4n4qxTT4HQ/NvvqM8XXxMaKiBqPlx7+miEWd8AnJnsDixow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqFMrGJ4uCXNp+b6CIgI8rhPMQFYCHwkDp5xmNbYZYk=;
 b=W/sfOjxmvLNMJaabt/BFqmXw2KMBF1sLq+O+mKb8msVczxxKZgYuLEqsIizThmHZxG4S5EYQ22SZg2ODfbLMZdWZ79ZzYFIKb/lTtg4fxUXHt1yB6+QCBU9Cbv5SWsmyvhY/opulYvoxANNlWqwYUKuO97mrXikoWAI7r9MlbSjmyHpbYufkAeIbapBDQ0PL5dNAaA+nR0dJF/UAoLHFHxE5J/rr29WSHDSkdpWVr8K/0OLi5I5BDf+oF/pyibsgqtf/gpOatZoL2A3ChJ6lE+cOryqINggIrwFsTBuSNgNMPU26MIQYIqimNwPqRUM72QjqvFs6UWcYSeHVDW3Twg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqFMrGJ4uCXNp+b6CIgI8rhPMQFYCHwkDp5xmNbYZYk=;
 b=DOTp6yz7T9b7rD5pWLTbzLFGA+rj5DJKWS3Rbd8r9E2hHtuQPZEtsKFTL5RfUxt8qgWyvf4GLDzyb5Rmx3swfpmQ+Ry6e67BI9JnJRgfIZYbjtDGOGBjbtsGEqZkz4Q1cWR51/NmXGLg4VuZ42ge1rf74T/P/v5oGnuwCUBanZM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 0/2] 
Date: Wed, 21 Jan 2026 16:47:53 +0100
Message-ID: <20260121154757.44350-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004683:EE_|DS0PR12MB8367:EE_
X-MS-Office365-Filtering-Correlation-Id: 097453d9-c1f0-4f27-e31f-08de59047ca3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TI6Oz+WLBZKOxn1PNztzj1sa2F15CNv1rqvn/6EJ90FJz5Irlk1sSwqfi8ON?=
 =?us-ascii?Q?0vdMZJY6UcLlmennMw0Tjdvwc7I9KS0f/AN1v7VKv4/Iqjaz3F+C5hKBlosf?=
 =?us-ascii?Q?yzfggmChZP+JKkUI+hkiW1chx07dZEj2NOMGqrj+KmFf9A8pCEEvDAhKtyEX?=
 =?us-ascii?Q?pOjDPkfNP3u3iEK7MPuVHrMxYk02zDfviOVqN7igcbYA327l8jKQemNHBiqh?=
 =?us-ascii?Q?XVBG2AjPk4dJ27BcRbKTlztY9wQtF5RU+t3slHcertpsdFLYb1heEVwMyUDu?=
 =?us-ascii?Q?vnQQJ7gsiXT1BhEDEmbYaPKLbCFZPq9ENOSoRm4i7que5bmCY+v1EzQpv9uH?=
 =?us-ascii?Q?VydpPcYOrWmXHWUv7AGEkeAkSg58cbcUY7GYyPop720Tvw+MtVUWxCuluGK9?=
 =?us-ascii?Q?BHALzgfxvN6HYB4FNXXOAoj0gumEf6FzQW6BfnH2p6/sruQ2nBkDxYr8Zd4g?=
 =?us-ascii?Q?GJOpwbSgN3ZWuoQbSkWbTXZlYWhbI93iOYE5FFO98M/Nby1mBQoyoeNS/BNF?=
 =?us-ascii?Q?7Mpi8kjR9LW7zsggk1WZ4ezK17nlEncY/vmAe6enl709Mt1LyY7IU+pMY+0A?=
 =?us-ascii?Q?kSQqJVvR5BK5eivwC520fy5rpgW/uA8q54XMNPDpI+BPT0k5Yqodp7O3w9bQ?=
 =?us-ascii?Q?v71TajTcr4nq7gqC6aunM/yspU3X0cs6hsH4HcdWNuX1t8plfDompWokKtGC?=
 =?us-ascii?Q?4by+PE+vTyXB7Xxyuhrr19ZBauvd7ijH8NKWsirCP88ngh4rXsP6zJRdajgC?=
 =?us-ascii?Q?LfsiIFokCyuCP0LI0NSGqyfKA51RjaHgrZGSHhJtH7LqSWbLrMj0tFgwE1Uh?=
 =?us-ascii?Q?kGFHtvlAcXoTERRwZaLfwoOLa7g+cWw34UdcQbM0FPj3j4S9HONyCDk/WmLx?=
 =?us-ascii?Q?8wpVgU0bk+cvkvYsK/wVNm08mWLlSGlQTmqYnG8BD1zzRaGSVgLPJNOFK3xh?=
 =?us-ascii?Q?ruIQi6q3glcZMPuwUIpv5ghXDLymHzl5VWQlQ2WhVUy7ztRJCDZwgIADjnJE?=
 =?us-ascii?Q?3hTtnwn69vCOmiDUXFHjt7zLdWuOhZQocnQlMStpXFT9x1FxTeqfDGRTLiyF?=
 =?us-ascii?Q?WgHUOggN/+D3MxzMS/QFEbgbNHNMQeZk020V/9HswHmgjG+WEv/wzzkGOyRb?=
 =?us-ascii?Q?y5yI92TfiOMCYbE4+4J2hRu4hFsMOox3bMBfPH1tVzezunz9BfG/+umLGVC7?=
 =?us-ascii?Q?moXQ95AqlfAwnIFLdga/HAAa9PGDR13RpN8dMW+CBqgjbP/6mLQ8NbuUNYpl?=
 =?us-ascii?Q?0z7lulx0r1BD9w7bN4ebrzSFJW0L3Vlp8ZdI1xeY4oNLpRnvehgV8jEXcb9K?=
 =?us-ascii?Q?P69oGiOONdHKWqul9A3iED9SfuoOe5tpRBJX0Q0dRZg04gPx5nQmv20ShLhv?=
 =?us-ascii?Q?cOOgYeYnt+AuvaV0NDOSVQaPrtDbawiuCj0MFsFEMDiiR7IaTml2HE+zc3OI?=
 =?us-ascii?Q?LGWz631UKgOYe1s+OD1OEKa4Vnc7aQ4UTnD4OEUEO07bZ+ScExpq8LZYRXHM?=
 =?us-ascii?Q?3i6l8uFx1m5hfEnEjpquZzvciqB2xhtwSbqkC4Xf6SkytH9/ddLrN9RaZEqC?=
 =?us-ascii?Q?dhSUKM0Ztqn2vTTu3GjdeHoZUhBalSH+/Xtwpuiq0UNzXAeSzTqo4T7bkur1?=
 =?us-ascii?Q?R+p6YU+pTziARp5nRTnkPf2qlYjNuyTXA7KWnfEghDMWcHtBCxhRStPWVcAZ?=
 =?us-ascii?Q?3ClfgfFo8pxrs2z8pESp/Mk3a8M=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 15:48:13.8613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 097453d9-c1f0-4f27-e31f-08de59047ca3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004683.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8367
X-Spamd-Result: default: False [-0.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	SUBJECT_ENDS_SPACES(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 863975972F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Not very related to microcode anymore, but this was part of the microcode
series, so...

v1: https://lore.kernel.org/xen-devel/20251112162219.226075-1-alejandro.garciavallejo@amd.com/
v2: https://lore.kernel.org/xen-devel/20260112150259.74535-1-alejandro.garciavallejo@amd.com/
v3: https://lore.kernel.org/xen-devel/20260113122109.62399-1-alejandro.garciavallejo@amd.com/
v4: https://lore.kernel.org/xen-devel/20260120093852.2380-1-alejandro.garciavallejo@amd.com/

Alejandro Vallejo (2):
  xen: Allow lib-y targets to also be .init.o
  earlycpio: lib-ify earlycpio.c

 docs/misra/exclude-list.json    |  4 ----
 xen/Rules.mk                    | 10 +++++-----
 xen/common/Makefile             |  2 +-
 xen/lib/Makefile                |  1 +
 xen/{common => lib}/earlycpio.c |  0
 5 files changed, 7 insertions(+), 10 deletions(-)
 rename xen/{common => lib}/earlycpio.c (100%)


base-commit: 61204ed24ba4537d6eff56594faa5d23cacb8310
-- 
2.43.0


