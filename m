Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCJOCz20b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2CA482A0
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208736.1520888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi9oo-0008KY-Sp; Tue, 20 Jan 2026 11:22:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208736.1520888; Tue, 20 Jan 2026 11:22:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi9oo-0008J7-Pd; Tue, 20 Jan 2026 11:22:42 +0000
Received: by outflank-mailman (input) for mailman id 1208736;
 Tue, 20 Jan 2026 11:22:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwra=7Z=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vi9on-0008Iv-1W
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 11:22:41 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 529b3efc-f5f2-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 12:22:38 +0100 (CET)
Received: from BLAPR03CA0012.namprd03.prod.outlook.com (2603:10b6:208:32b::17)
 by DS7PR12MB6237.namprd12.prod.outlook.com (2603:10b6:8:97::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 11:22:31 +0000
Received: from BL6PEPF00020E60.namprd04.prod.outlook.com
 (2603:10b6:208:32b:cafe::99) by BLAPR03CA0012.outlook.office365.com
 (2603:10b6:208:32b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Tue,
 20 Jan 2026 11:22:31 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E60.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 11:22:31 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 20 Jan
 2026 05:22:29 -0600
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
X-Inumbo-ID: 529b3efc-f5f2-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hsYMsRGOUF1vsyroJtsTgcq74HGrP5ePvvOCrXvROCGgOIIrAX6WieewMXlGDv9LKrZrRXwW0o6UqIBseKUwCGO6maDGkWwUE6z1dSYwaQlsIQ6dkEyAEv1NC8/Fb1Zd9P9QZf8g2ZgHzw0yNijCo3nTSxvV7YOuk76JfgU80W5WD0ZnQ+3aJBdw1jRlsH/yLFc1An4pPvx9HLm5ERi32dGC5H/E2y5Jf50JwEMZ3faYuUBSvXsBaNvctqK+LeaVejaz+V6tnPLvz0SMH7qWvyJ83Cd8+X7promdnXOqTT0+ltZI4lybCJ32GYyXC1OHYQ+NF32uygRsa3vEItYKGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=msUwpqeTDCH8hB32ESc6Q5VfBQUh3YmEqMuWl9Z9c10=;
 b=qoO8O96Neb8OuvZU8Hk+waKusED9IChpiJIEafiejn9n0pzPoffJJkHMleexGYHu7H9VRyE2aMharZcA/r9HtHXDW0Q2oUoKg8hjzPrMy6zMysW5KqpDzg4ScskeuHYxyTrJ7/sM7KZt8hzjG+xYPZMH0PhaInPX2tdVKNpeJLlx0K+zxART4TawbhTdVK3xO7JCRINvXogYbsgB7wJXoIVG5NlONh8Q6o3rWZSoidaUO9EzQNF1HIdSmprrYFaU51kyaR+hSVyRey3wIbktOIWLLHuhjgL6LW4wWGLVS91rBqCrhtqAAN7X6d/cXD8bz+VfaOKdbFlpaKYiRmCiGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msUwpqeTDCH8hB32ESc6Q5VfBQUh3YmEqMuWl9Z9c10=;
 b=VpW+AZ6TFbaH4QjbcZ7iGXFeQtFjj4DCgma7GRFf2v+8X9lhQAQ+fNnYVYTwLDlU6i1ub2gyh781hremlM1bcETVY0UsfNs3G4qoT8qqbPPtr44KkmRL9x41SpUb75ui4pQvCV77ZrdPdyohgqcREyKBa8pjHmpKgQNu9mDIyj0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 20 Jan 2026 12:22:27 +0100
Message-ID: <DFTDLSLZPN6F.3UC4R81DBXYR8@amd.com>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: Re: [PATCH 0/2] x86/svm: Add support for Bus Lock Threshold
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20260120095353.2778-1-alejandro.garciavallejo@amd.com>
In-Reply-To: <20260120095353.2778-1-alejandro.garciavallejo@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E60:EE_|DS7PR12MB6237:EE_
X-MS-Office365-Filtering-Correlation-Id: ef982f27-128e-4869-2617-08de581633ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cTRtRmJGK054VjE0cVRrbjE2YTMvQXdCTVN5TEo4bkxqaVBrYzRWZGczb1lp?=
 =?utf-8?B?K0hEd0RYcmg1U0lIMlUydlpValFLRXQwb1E2ZlNvcmR6bWVRN3RkQjhlVGFE?=
 =?utf-8?B?bTRYaGsxRnJWNlE0UXlGRVQvQXZrWnU5T1E5WGlUZmtOc3dHWGU2ckQxeHE0?=
 =?utf-8?B?M2VrVnNEaThJYTg2anJLQWFCeHhUTStqM09ITzcxTmc5SktzMTkrM2IzVlBJ?=
 =?utf-8?B?M3dXclZ2MW5LZnlYOVVOcFJ4WUYxaGxKMm43emV5L0VKSmQvS2ZwZjlEOWVT?=
 =?utf-8?B?bVFNdFZITktzRGM1TDlvUEk3MXJmSnMvUEoydnFoZWdnZEVGakFBL1ZUWHpP?=
 =?utf-8?B?T2Z4SVExeXlIbzI1QmlJT1Y2T25NZkNMZnlrK2syZEg5VE5IUjFaMXpzM2ww?=
 =?utf-8?B?OEVDWFdlNk9QM1BqTkhHSC82TEZ2Y3NnWTNKaHpqM0FMQU1RdEo2eEtBQkhq?=
 =?utf-8?B?NEYvSjBXR2IxSGd5L1F4Y3RwK1A0aTBXczJrUmV0OTFTV3I5elJldTBIdVE2?=
 =?utf-8?B?RnBPYXh6U1RESk1meHNvY1owd01PSGdUZlFRc0JqQ0ZsOTVJOGlaeFhoSFVI?=
 =?utf-8?B?SjR0b1hYbk9MT3pRTGxLYktQSkJlajY4YUc3TVgrT1RZbUN0NWhhQ284UXZk?=
 =?utf-8?B?dG1pUVZLL2NnWXNyWjRmYWJWY0UxY0FPQnRZdVRhaXVWOUY2ME8wUnhObEgw?=
 =?utf-8?B?QW1QTmh0WGJvQjV4d01YYUhvV1E0L3l6TVNCek5yNkhtL1RBNEMyMnFSdnNa?=
 =?utf-8?B?VTRSaGJlNS9HbVI4UGJ0MFlnMDgrbDZBenJGZVNNUDEyNlhGZ2ZZdmdIRyt0?=
 =?utf-8?B?MVJ5VzVXcldoalUySUxZV29FWCtUYTR2aHBSWEdRVWhRWE5IMHZzVDdTazhN?=
 =?utf-8?B?dUtac096ZEpYeW10RXFmRytBSWMySEo5NXZpV3M0YUxaenNXcThKRXRzaEpv?=
 =?utf-8?B?QWYxRTVHRFY1TkhNdlM1T0RpZ0tQdGFYNk9PdnVRamw2L3pkbW5rcHVLb3ly?=
 =?utf-8?B?d0xONERrVU5qcXBRaW1PaENoZG5sK0RkY2hyWVV0QlZIdlZENnB1Y1FkMEhO?=
 =?utf-8?B?TUdDaTRPaE03VnJOZFJxQTlUdVQwbGJMQzF6UzZZOERVTHJEbk94YXB2MGFk?=
 =?utf-8?B?U0N0elIvSWhSdWQ2d2dZU0NIZVUvZUo0UjJDbWlyM2E4b2s4Ni9aVlBmWnY4?=
 =?utf-8?B?amNZV3ZJajFrZG9FN2NzREtyUWVhSkRYSytuSXZlSkRLSlhYYkN1T2NYelQw?=
 =?utf-8?B?VzBIdkQ0WHNuRXAzODZzVnYzVDdJOHpEQ3JEWUIrN2dUd2c1RWE0T1RqVHFm?=
 =?utf-8?B?Y08rQVJDWXlQTkswMTU3SGtRUStBb2txOGFUZG1CRldPVmpRVksyZDhkeFA3?=
 =?utf-8?B?cUNXR3J4TlpTN2Vmek1BTUFoYWRyYi93cDU0RXA0QXNMSVZMM1I0b3FISWJh?=
 =?utf-8?B?RzFpOXFWbjl2dlN1ako1VXhlb2V5MDREMVA0UmdZNlE3WWFqa1JaaWlYaTdU?=
 =?utf-8?B?NEk4TEJqcEdLelg5UFViVkphdlQzZVRCdUNrUjRzdEw4Q3JIZW5FdERNNFFs?=
 =?utf-8?B?Q2d2bDJNZVRNNDNZUm1GWmVUcFRsM2VpSElhZVllVjlEcTlVcmNVK3NsM3pl?=
 =?utf-8?B?WFQ2NlRmc29KL0VDRWJnTnRwendlTlpSZWxrSE1vbEhib2dhdElrZnZEZnJ6?=
 =?utf-8?B?NHZUaXNoVHJVSmdxaTlCT0lZNzZyLzBSMWIyOGsxbFV0Y0NaMmhMSEd4MUpr?=
 =?utf-8?B?Y0g3QzlGQVhVZUpOK1RiZTRtR211U0s3MTgyR0I1aFhoY0dQTHM2L3prd2ti?=
 =?utf-8?B?NE1mTUZWalZRSXdqUkx5NHFMR1lyRW9INXJuOEltWU5kK3R0bGRTdFVlWUJy?=
 =?utf-8?B?a3lKdmlTdHdzeWNMa1NXZlpNY2lrQzdGS2d3VDcxM0hBRWowUUNYM20zQ3VV?=
 =?utf-8?B?VzRsV01DQnhNZXg5OUJmYnJpZXVQNnRoME1hQktnVHl4S0VtRnhXejRjUStP?=
 =?utf-8?B?TTBISzFBVHREb3RhTDFTa2tTV3M1bFdEaHhOZHN1dWN0RmRxYVdGaXQ1b2pF?=
 =?utf-8?B?UnZ3cTZ2T2krVVdKWmFISWt5L0QrT2dJcFVraldBa0lXRGQ4SVNOSjZSdmlp?=
 =?utf-8?B?NUlpYVpNcDNQTlV4MmRwN3JpeVA2VzhYa21LbWIyTlpqUHhXRDVVVDNBR3R0?=
 =?utf-8?B?ZVJSWUR0ZEtFRmp6Y2h5M3RCNlE2RmtOaTZFVEtKeFJ3M0tFSmRkZnV0MmVl?=
 =?utf-8?B?YVJRMGVaN2JmQ3I4a3JVcWVpMmZ3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 11:22:31.6523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef982f27-128e-4869-2617-08de581633ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E60.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6237
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:sstabellini@kernel.org,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CE2CA482A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Jan 20, 2026 at 10:53 AM CET, Alejandro Vallejo wrote:
> Bus Locks are very costly and a VM left unchecked spamming instructions t=
hat
> lock the memory bus (e.g: unaligned atomic CAS) makes system perf take a
> nosedive. This patch is similar to BLD of VMX, but for SVM. It configures=
 all
> VMRUNs so they automatically exit at the first encounter of a buslock eve=
nt,
> effectively rate-limiting them.

Does this warrant an entry in the CHANGELOG?

Cheers,
Alejandro

>
> Cheers,
> Alejandro
>
> Alejandro Vallejo (2):
>   x86/svm: Add infrastructure for Bus Lock Threshold
>   x86/svm: Intercept Bus Locks for HVM guests
>
>  xen/arch/x86/hvm/svm/svm.c            |  5 +++++
>  xen/arch/x86/hvm/svm/vmcb.c           |  6 ++++++
>  xen/arch/x86/hvm/svm/vmcb.h           | 15 +++++++++++++--
>  xen/arch/x86/include/asm/hvm/svm.h    |  2 ++
>  xen/arch/x86/include/asm/perfc_defn.h |  2 +-
>  5 files changed, 27 insertions(+), 3 deletions(-)
>
>
> base-commit: 7b3e1b4e848d34c9a5b6634009959a7b9dd42104


