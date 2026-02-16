Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAPMEv37kmlx0gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 12:14:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3186142BE6
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 12:14:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234003.1537379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrwXy-00017t-GU; Mon, 16 Feb 2026 11:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234003.1537379; Mon, 16 Feb 2026 11:13:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrwXy-00014y-DC; Mon, 16 Feb 2026 11:13:46 +0000
Received: by outflank-mailman (input) for mailman id 1234003;
 Mon, 16 Feb 2026 11:13:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C5B6=AU=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vrwXw-00014s-TK
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 11:13:44 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c406fd3-0b28-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 12:13:41 +0100 (CET)
Received: from BYAPR01CA0067.prod.exchangelabs.com (2603:10b6:a03:94::44) by
 LV8PR12MB9360.namprd12.prod.outlook.com (2603:10b6:408:205::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Mon, 16 Feb
 2026 11:13:37 +0000
Received: from CO1PEPF00012E60.namprd05.prod.outlook.com
 (2603:10b6:a03:94:cafe::d3) by BYAPR01CA0067.outlook.office365.com
 (2603:10b6:a03:94::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Mon,
 16 Feb 2026 11:13:38 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E60.mail.protection.outlook.com (10.167.249.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 16 Feb 2026 11:13:36 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Feb
 2026 05:13:33 -0600
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
X-Inumbo-ID: 8c406fd3-0b28-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lsNRPUyPoGXFTWmhfMdskQU7qYiLj6dSJWnM8T6zHT+P7dxxNkXzRd4E28ot6/A7DcbdG78UTxDh7a/Mp8NLbWIey8G3SDm4s1Je6uQpgHW+7SbQlsublMalHe4x4eqiN4j4lrJ/egVBe/8FaoEq8h+DA9Z95hj/0ObaogMKXvfL7FiWhZP9H4LRSfUj5WfzQTrRB6R+FTp3jo49PRB57YH5paH5mqhKkS0ggdOd+eWnHWc7F3JKDDreZOysetPoXkgLd7VYdO+iJYTYcpvUFhQF4+a0lN/4s7cw5GccIxTn4BHCglCNnW4m3m8LHMlpWUFDr9R+MI9OsNzwV/qLxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJBlKMOhG9WZs9g/JRLbEW7LhpsQ/zQlhKqh/Y8/C94=;
 b=BLeCVA0fFH5nlChk8j9A37GkapNfH+M+w/aiZkdvbMm0RR8H7ATNRaXNPjU2WYTeDn/rix6omv+FzEFbFnuEVmm9MEjMniXszqazBK5yv41opE5OMGRAXRHoV24wkZKrmN74db8SAgQ24hg3RRtPdgZhAjgiH4NFKaE9ExIU1qQbHrLWCEGBt3MZiWrKn4fPk9Fj801Q4WHMybDnPDAEJfX+jgdIIqCvNPkoo2dAg3Zyr5ETVUgy7D7V7StTZvx4PUhodkoavLtNDV0ez44b7YeOTpxCPdP5619atHoqdGc9Kp35aLRWA0jOH0t/aND1LWamJIMufUfkz6pOn+onAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJBlKMOhG9WZs9g/JRLbEW7LhpsQ/zQlhKqh/Y8/C94=;
 b=XZgAcT3qOBTkWZF/nD1tab6Gjcfb9A2II6pmTWSrIV5YLdrBDGgMqq5M/5KDHa8CVdh55yM9kAo0lkalIGFqWoCA9m7QISh7CpfiJcGjBsCG07vAMBggE7rFp/eJ20FnCNny2eyTYHF2oTxZBSee3+11i9oBx5QQY5YvSj4nchA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 16 Feb 2026 12:13:26 +0100
Message-ID: <DGGCBLHJM961.2DZF87UWGWU1J@amd.com>
To: Stefano Stabellini <stefano.stabellini@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<jason.andryuk@amd.com>
Subject: Re: [PATCH v4] x86/cpufreq: Add Kconfig option for CPU frequency
 scaling
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
X-Mailer: aerc 0.20.1
References: <20260213235102.359472-1-stefano.stabellini@amd.com>
In-Reply-To: <20260213235102.359472-1-stefano.stabellini@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E60:EE_|LV8PR12MB9360:EE_
X-MS-Office365-Filtering-Correlation-Id: 9be49cdd-dbac-446d-4d29-08de6d4c6ded
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ejF4a1Z3NEhjSmppRVR4SG9tcVRDTlFJSFlnd21aTDgzWWd3UmdIZUZtZHl2?=
 =?utf-8?B?UW9tc0lieG9ybGtJSHQ4UUtTbngrSFQ3N1FLYWxhbnk3YmhJTnlLaG50K3oy?=
 =?utf-8?B?VzQ3aWFZTE8wdiswaldqSld5RkUySWJDOGgweGszcW9jeVkvaGY1dzV4aVk1?=
 =?utf-8?B?SGdiSEE4bzk5OVMxaWFmckErNmg0Q0syZytxSnA0NzJRV0RkVVpsTjhUT3JW?=
 =?utf-8?B?bTJqN1Q0NXE5QVcvVmJPdmNtT3QxS3EzdUNKZ3NXaG5KZ3V2eHlWSHZTOUs4?=
 =?utf-8?B?ZzdJTHVtSHdTeGFTMWVUc0dFTlVvdTZ4dnZHTS9veGZFaUdhdCtTclBZVmZI?=
 =?utf-8?B?M0VkT0hkZGhrQUF3bUxKdU1kcmdYaGhOTWR4Sk9nY1dYcWk1VzJpaVFUZ3Vy?=
 =?utf-8?B?dURDZDlrbFRaUVpwdGJGQXNXL0lreXh3V0J4ZHZoakFXcjk2Sk1FQThiVThN?=
 =?utf-8?B?dE5tY3duQ3IveVZoVUhxR21VWkNRNjI5VGMzYTBUMDNCd2hTZ29tV1UzKzBr?=
 =?utf-8?B?OGE4QlJEUFBRN292ZnJFc01hbVZUc0YvQ2haTitjUlhVd2RISVZLejhQeDlu?=
 =?utf-8?B?blZla3hBbytjVUFwQ0t3MWRHQVJnVDZUSXRyVGtZYWtwcVpha3NGWG1tTDRv?=
 =?utf-8?B?RDB2d0hvQ2YzQ2JJV2dVd24vUFFUQnJzQzBIenQrR3NWV2FrSXNjcG9vQ2lK?=
 =?utf-8?B?ZjU3d2NkWitQQWtxSTNFS1dVMUNhWkhFaFBxZHZpSnhNbkR3K29ybG9OUndh?=
 =?utf-8?B?V0ErZVljbDRwQ3QySGErNTFINGZ3cFZxR2tyMjkrMWUySW9Id0ttWTVaeVF2?=
 =?utf-8?B?R3IzUXZWUXNDTnkrOG9PMUR1NVFhQk5MSlhvYUVleEVGa3E0MUtISFhWbXh3?=
 =?utf-8?B?NVZjSXVaY3MxaHpXS1JlRWJLak91WWNhOW0xVVdZd0dqMDBLUFpxYks0R1kx?=
 =?utf-8?B?QTNtMzRVd1VlRGdhRU51MDloMHV1R1VmSzRMWThxRmZCdlY0aEtGelJXVVhz?=
 =?utf-8?B?dTZmYU5TbnhpOWRHbnZKYUE1MnBwUkdjaDZmT3ZMTzJNY255QVhiQ3lEbG9a?=
 =?utf-8?B?bDkrbklRWGI4VmRtWktjU3RJeTBQL3hKQ0k2TkdST1E0ZzNKTmNGekFtWVps?=
 =?utf-8?B?OVJIcU5URUxkOG9PQ3U0djhwU0R3bURkai9wcEVkL0F2Y1dPR0xDcjhvTk9j?=
 =?utf-8?B?NkcxNjlkcXh1QUErdGlzS3hzQ3lnUjUvekJCTmVncUVvUG9nNUtMWHdDQzJw?=
 =?utf-8?B?bUJKdWMrdWtGNHY3anFuQ2N5OFdOOVQ2aFo0Q1N0NEhka0VranMwU0ZtdkNq?=
 =?utf-8?B?RVhqYTdQdVE4UUJTYWlKbmltUW95WEpyZzI4Rk51S2RmUTJmZmZKdGNHclpN?=
 =?utf-8?B?bXN0VGl1REw1RXVsWDdPV3BXaVIzb1NVZDRxRXdpald3U0E1MUhEWlFIcm1l?=
 =?utf-8?B?NVBJK1NjVmhjODU1YUE1bTVhNHRHTDJycWZsNTcrci9pejVFT090WFRscG9k?=
 =?utf-8?B?Z2hLN1JZZ3JvbVh2Nkc0YUVkOXdDNWFNb0o5WXFlZE05Vkx4TTJiTWh2RFdD?=
 =?utf-8?B?NEw3UWRmNjk4VmVDTzBWSzg3U2g0TC9UeDdNWnFHTnR0Rk1kemNlcUR6Q0Q2?=
 =?utf-8?B?RzAvbTdCcjVmR2dTaUYzZHhzUStVdS9oaWtTNVEzemtGT3ZObEZBaVplRU8v?=
 =?utf-8?B?VEpYSjQ0NGlDYzdIUGZ6ei9naGQwVkY0SXcxS1NrOVAxWlFFMVVpVVpOMk9O?=
 =?utf-8?B?a3pTT1BQZTNUazBHT043ZkEwdGg1QUluV3BZWUNScEIrS0V5ZHROUm1mdW5j?=
 =?utf-8?B?TGEzRmR4QWU4V2dYaDJrMlVXWjlqSWR4ZGFoMVdheVBDNHdLQ3cyZ1FubjZY?=
 =?utf-8?B?T3NIcnIxRTJSNlFuTzY4blRNR0habXhmUGpRcXU3TjhJQ0hSeXlZaEkyYUVk?=
 =?utf-8?B?MzFVcFNhclhLSDQ3em8vbW95cVQveE1mMnhpbVdGeWpERDFjTkw3WWhpaWNq?=
 =?utf-8?B?SlFvOStvelNHbUg4NFRwT3JSM081ZTgyZmFCdXRSMFJEdmR6REJTWVIwb3du?=
 =?utf-8?B?NFRiRU90TlRmVWt0end3M2wxSGhITUJYcisxZC9FVTlmN1JyV2luNWJ3amVq?=
 =?utf-8?B?TlNpS1Q5MGlzaTY4YTZqaVkwdGw1NjhraEF3S0pHZ1l5RVVoWGh0Nk1MRUpy?=
 =?utf-8?B?ZU5lcDRxSHdrR2NzWkJyVEZ6dll0ZVM1QU9ObjdZT1RSZ1ZjWUdNZW1PdGVW?=
 =?utf-8?B?T0lmdjR1empMOS92L2tBSENZZDN3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6pUfhEAXHKwHcNpgTrAXEypXES2PlIGXB9RhKEBynj1hShDCI+CFQn8pzSSgifqtXz8p5KfemXMe80ALs/SXepsfUkiVP4v7b4Lmos7jSgxq2+l6bD+3JTZuB2+7pjY4sh4al/2ezaX27xQxuSKSfi+zd7AgYZ7XMSS9W7QRkKANWb3/djGGiISIJUwDBhw6j2V7iovjd0eVTr2sNwjPmPRIlqW80UAGrgwJJMFnzRgJ0KrzU2xk9/wvEv3VXWmQbvrosuu4U3QFwjYWW8NnGBBlkkB3R6GujAefFapo6KaKIr2pDZnK0qmuZpjVTUCmQaRi+ZHzU/fUYe+uOVnQGK/7qyUukmdOw/UUaaDjgVSEILWn626IIdfnQnRIW5QlJo5euxr2iFGBOsrDTbAhhpUuKQaTQP6VY6oD1zUWxE/nEz5f+f2hU4xwcAFcBKmC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 11:13:36.1066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9be49cdd-dbac-446d-4d29-08de6d4c6ded
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E60.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9360
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stefano.stabellini@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:mid,amd.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A3186142BE6
X-Rspamd-Action: no action

On Sat Feb 14, 2026 at 12:51 AM CET, Stefano Stabellini wrote:
 =20
> -    if ( op->cpuid >=3D nr_cpu_ids || !cpu_online(op->cpuid) )
> +    if ( op->cpuid >=3D nr_cpu_ids || !cpu_online(op->cpuid) ||
> +         !IS_ENABLED(CONFIG_CPUFREQ) )

Largely inconsequential here (and other places in the patch), but I think
IS_ENABLED(foo) should go first in all conditional chains so that any invok=
ed
function in the OR list is skipped. It's likely in this case it doesn't mat=
ter,
because cpu_onlin() is a macro that calls a static inline so the whole AST
is known to the compiler, but it's trickier when there's non-obvious extern
functions at play. In those cases the compiler will still make the calls be=
cause
it can't know the call won't have side effects.

Thus, as a matter of principle, I think IS_ENABLED() checks should always c=
ome
first.

Cheers,
Alejandro

