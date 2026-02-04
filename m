Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAfdMfrXg2lbuwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 00:36:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17157ED4E5
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 00:36:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221245.1529512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnmPq-0001Pt-PT; Wed, 04 Feb 2026 23:36:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221245.1529512; Wed, 04 Feb 2026 23:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnmPq-0001OE-MN; Wed, 04 Feb 2026 23:36:10 +0000
Received: by outflank-mailman (input) for mailman id 1221245;
 Wed, 04 Feb 2026 23:36:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gU/K=AI=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1vnmPp-0001O8-GS
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 23:36:09 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46d61af7-0222-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 00:36:06 +0100 (CET)
Received: from BN9P221CA0028.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::10)
 by IA1PR12MB8518.namprd12.prod.outlook.com (2603:10b6:208:447::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 23:36:01 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:10a:cafe::43) by BN9P221CA0028.outlook.office365.com
 (2603:10b6:408:10a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Wed,
 4 Feb 2026 23:35:59 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 23:36:00 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 4 Feb
 2026 17:36:00 -0600
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 4 Feb 2026 17:35:59 -0600
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
X-Inumbo-ID: 46d61af7-0222-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SEDrOC5uboCEg3H5bgNf6bwFT3Wqo1CJUtOs7Cm/NRoDXj59s+uGHFl5U/WW0cNex+60NbYvJuK+4OiHQt7TvCk+DJt7vW78quXf9ZoIQ8vdxrj6nmefVCy59iJ1WhuAyxI6uJqO2GM27kguy/itFFg8EK6OE4B3lk4CUTvKdjtawLdkHmmr9n+AvJww7kMKoHMlMtaMJG4puf5gjc3HUVbn144KZwjQB6A0fRfXbYmBIopHGF3Jw6byLaw9MzXfW6X+GiERtcadAyGhIWI1yu8HzSTD/s1dp09Rw79jXnOVlAUV5kI2sLmRmxtyvhEIFXIAOR0h5QY/txX38LXJaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPcvXu5VCYMukLaN255k/MTEnsytblLlj+oHAvHnX7g=;
 b=RSCem+zR2I26Ll6bHeLoXpH7z/lT5BT26406f6HQiEljl84Fn5eMD9aetKiAa0YObpl5HGe9tOlqXuv+9o1s8m1u1BP95MVK53r9y4Lp5nAx61Yy5AKX1nHwK2K7HsJNBdVaRp0q4prRsG/Ak56uw42qWw2ZwYLlby/ezssJ+bdN1UIqGvzTyNnSyGKnkla0yzwboFr/YWm4lqzfVWwkknIH8S1pWqQB4DTtae26rm8rqpkJoeOyizbvbQfgirETIK/9n7qCcNWqgNIvPlR3RnFLqTntKxzyAutUXoqliTMT5wXjcCN8VnkWTVc79eYMBU9WGnUqOIEJc2uBbZuNuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPcvXu5VCYMukLaN255k/MTEnsytblLlj+oHAvHnX7g=;
 b=yTs8wfdgp9kvhq+v92Kug+S4aJpD25MNTsqOW/aEYYi0/cJxymWNFy8drF4tr+Ns5JPVWjIkhMqJXF0uu3j6k2BZbNIPg+xE8EMV7fHBWSXkIFCB+ku/CgCnk15B/2rArPQ2iwyURqcSciTWvBwToCqfzWoHgR/gMKVFlxHCuLA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Date: Wed, 4 Feb 2026 15:35:59 -0800
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: <xen-devel@lists.xenproject.org>
CC: <grygorii_strashko@epam.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>,
	<andrew.cooper3@citrix.com>, <jbeulich@suse.com>, <sstabellini@kernel.org>
Subject: [PATCH v10 0/5] xen: console_io for dom0less guests
Message-ID: <alpine.DEB.2.22.394.2602041533440.3175371@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|IA1PR12MB8518:EE_
X-MS-Office365-Filtering-Correlation-Id: b45763f3-2e12-4a42-3285-08de6446277f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IQ8e4kX8Pt9VDdeTeNPzriR5Q+ueRXiSxWN1XOKu5KVBdlp8Kqb8uvv7lDdG?=
 =?us-ascii?Q?64RWjN7NNRo0WVK0Ih7z2a8yBprh3iRUFWka4K3mVbyAPrF9hdz2BTCuXCJs?=
 =?us-ascii?Q?8I5sU+7rg6uq27TyZM806/lbWiAx/Q2dCXrVpfcP15dM3K0Ymx62Y08aTH3m?=
 =?us-ascii?Q?3/q4mS8SFCZwuFhygG3wlSwR4mqgZ8ucIXHjtkYF9oUGELHFk+LmLNGBVh8T?=
 =?us-ascii?Q?0r/HXKYY5tOKdSJrkpmUqxe2BppNrCq88PRDz0yfFQS1K7Un0+rE00TduEwS?=
 =?us-ascii?Q?mk603hdWhbyMberrRUnbHsisRbypqXtMeY7u3EkB9c4pNBEp4+45annfa0X6?=
 =?us-ascii?Q?hlzGhDOCma61njMOgS22RFQ542yBJR1KFUfp9uqxv+y8o5E+sslDVQeZP/4q?=
 =?us-ascii?Q?yLpub4B97nooAJTtFfIAy6eaNZH6nVHnpvCdw/0t/kPecKztojgZGUU88wel?=
 =?us-ascii?Q?z9A/DhfIZ140fo9aIBDwFJnkZkHum939h7Xv/AqhRMRqNdCOiEUs1DgC/ct4?=
 =?us-ascii?Q?i8vor8Ow0vvzREKlFNXmkXenbRYtLfelYdSxjnflGJ2/nUixZOKk2hp1AXVs?=
 =?us-ascii?Q?b6JlV/QoNPGggwe1vzS25NaC4KsxBOqSaK767BLPzti0zI+V4tXjFeWrfn9l?=
 =?us-ascii?Q?ZxeZ/n0IvkJHO4l49u01Ij6gbJHfbWLJSbbLT5kEoJI9jKPRs3QHNxCOyq8a?=
 =?us-ascii?Q?wkON+FSxr4YwnQBeNlJxT/dvj4yz6ERNj419XKuPJxuX89ZisYx2292VSJK0?=
 =?us-ascii?Q?JiBlU723DpUwqtPB9OurrvDA8pSw+r8HjYPt/kb4sxAgG+BAQXmayC3hcdDa?=
 =?us-ascii?Q?95gFxTvMqMv8x0vVAtAyh6cIedrKK4RvcGBLbNy/7uLXGss16Kpx8W5n1BPB?=
 =?us-ascii?Q?Usny/M0x07VnGbOBcbz5D9YL9K0uAY+kVgWAbmF6B//eXAi2JAFd62CYPPhd?=
 =?us-ascii?Q?qmr+57wvUcnfCKLKfzuCC3/FZDi2kQJzIViCLs3wCGA/xxziyDS1Q4B7uYcL?=
 =?us-ascii?Q?pP1NlnguVmmIG2MDCag/LddEIb7TgT8MM5B8GgIRYouMRsQ89uumqHf/kmfF?=
 =?us-ascii?Q?83UAtP9HTmPGbpr3FtcqN97k2dLEbCPt68Hf0tJrSTNTasZo49ljKp7OS/x1?=
 =?us-ascii?Q?5c0nnacBp4a9Avgj3U0/4x/AZ6jYrmJmVBjLCK7vvgKEp7mUXbRIrSLMFbmE?=
 =?us-ascii?Q?TTEnxPrlDTXssMHdK4UQTL7tYBmi9DP+7PvnEQRLTuehof4fkojd/rnlaFVm?=
 =?us-ascii?Q?J63WTcg0am3eqXguH2VFKuaQJ8NiD0MJTv5a/F3FwyP4z8smDnKmO35Bs+yW?=
 =?us-ascii?Q?MblCGcvPvL1k2I+8Kd6ngsp3fOo23BVZ4J5HFSddhlsn3a2gwr54APvlPqjW?=
 =?us-ascii?Q?ogl3rqwaE13F3Ff75gqLNuqhaBH911bgNXTSpV48sF6xvPwirnnkia37UWyR?=
 =?us-ascii?Q?eFCVs2SKUgxxRneB+S7hZSuIBMEHmkd0CA+innggPYsnkeHTtVXhsU5/z19H?=
 =?us-ascii?Q?cdxFPoLZffmev1F8zXtsV5Seg4XrWNxeP4k4qO9AhyTwTwk04IOlBnddF6U+?=
 =?us-ascii?Q?Wr5wsF8UiIiDSyD1AM9RrQ0KCmgL8JKMw+g5OlgU9rJ3PCRR759CrXNQzjjB?=
 =?us-ascii?Q?4NL8OFWa9WNGWI+vpb9J3hCklCaS0ZA8DcFyZ7rhya9xbKWZzWE1gmcV8ESe?=
 =?us-ascii?Q?NQ28pg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zqCSik53noERWm9W9ACJKWvB88HSl4fJO8ZxOdPsgmedDu1drjDoxidB+LOIfyBvKXHbvOggvwciSdxkC3CXIK+1MNSwQhKl0U64ZAwyu5gq3gLeki9H3PlHCbjzADAOqfHPACZLwXgjxPc/sDaZTb8kL77r5x5ozgajWGDlN7BvdY8CKKxi7nhdteG++FFhIkcdfS1uJ8+0WHlYBeKezsN4S6XL66eaxEbn/tRx4dKg0ZZ4lhqB5+TLtmYwST49Oxf7Iqcr2aYwbR0BnY7/HNrqFm1mLBWGepEISzppyGxThxZT/ddj/VFOsJrUjxBwloz6BpemZ0e5JkRceD9K8K9ZSvpv9PESYODHkPe0GFU3vXLEGXpfaRQCXeEQq6iD82TEfJEzetPhhOpWzFPXBBMIh62LdNyx+yDAAXTJdGagcnZdjUx1D3AcI4cIW6ZM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 23:36:00.5901
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b45763f3-2e12-4a42-3285-08de6446277f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8518
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 17157ED4E5
X-Rspamd-Action: no action

Hi all,

This short patch series enable the usage of console_io hypercalls for
dom0less guests.

Cheers,

Stefano

