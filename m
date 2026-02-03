Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPEKKdx/gmnAVQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 00:08:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B74DF8D8
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 00:08:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219743.1528619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnPV0-0008Ad-2G; Tue, 03 Feb 2026 23:07:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219743.1528619; Tue, 03 Feb 2026 23:07:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnPUz-00088L-V9; Tue, 03 Feb 2026 23:07:57 +0000
Received: by outflank-mailman (input) for mailman id 1219743;
 Tue, 03 Feb 2026 23:07:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aUNd=AH=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1vnPUy-00088F-D2
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 23:07:56 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b45834d-0155-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 00:07:54 +0100 (CET)
Received: from DS7PR03CA0201.namprd03.prod.outlook.com (2603:10b6:5:3b6::26)
 by SN7PR12MB7936.namprd12.prod.outlook.com (2603:10b6:806:347::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 23:07:50 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:5:3b6:cafe::9b) by DS7PR03CA0201.outlook.office365.com
 (2603:10b6:5:3b6::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Tue,
 3 Feb 2026 23:07:50 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 23:07:49 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 3 Feb
 2026 17:07:42 -0600
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 3 Feb 2026 17:07:41 -0600
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
X-Inumbo-ID: 2b45834d-0155-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GlilsBBY5F7gMzzBTPPGAe5I9o83IA1JQLWKfuG70pSvsRkrcBwhD5AGg21o6+Tg6JYqS4CxFdXN2KVP2NArCsl90+M4n19orzAB3dbqUafT+ac92CQLwxU+BjGGxKw8odYdLYPaSpL3AeSr4/85NU43RINVbVWok+JiXOa0cH2z53GdHmqhx3PhJcg4vKPjidtmndCUCxa2k3zi3f0vTfd0LkONJp/OsIYkbjVypZDceIiuuGoz5MQYAHhRYVyGLSeldVHjvZlsEZZR1EtNqD/E8ujcCLHh4dWDb3iNXxz0kLmo1JBCkBV6K1tCalR7bw0YQG+ZFSiJM+PsSnVf5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPcvXu5VCYMukLaN255k/MTEnsytblLlj+oHAvHnX7g=;
 b=c4l1xGzYLmndPvuEfGOk5BHu7AXiqu1y0xZe5AhgsUEJ9TBYzOBcXwp4PG+GIHlsxmo1zGRwCmJ7oWymKJn5NiO13eXpvDf8hIicXeb8K2X9ou1SUC8VQOYbT/fIYg27gYPwEVU4YKBpY0sqFx4CY866BPu7H4q+fS0PyiyGJ2sB26rtu+L6KjmjXs4bZZuL7ltBIs3VCWhLlufUuKxnjhwzbiYBFkm5YAbS0pIZBTQxoVfUKccFiboajaOmreATA8Vxq7BaHt0Mg3ZdqJLBf9jVcMhTmSJ9Sp18BkOsb7BCWI7LRFVWByE0w3KyVBQ0z+xxoL5pc2k9bk2bbgD4RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPcvXu5VCYMukLaN255k/MTEnsytblLlj+oHAvHnX7g=;
 b=pMlWOahj+udQv2oOkREOZWIhyGwUepgIda7J2uPLO7MPLHanY/JV4U37y1GMRzRGHOSchxFVHJoIUj+zn1/H/QSdbZSL0d9pPdaer0PGg99eZAx628eNKoi8Eh/qKB+oPIuOLcIccvb5NA6/avkYYpPBnB4WfTbwIaPpwtP1OEE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Date: Tue, 3 Feb 2026 15:07:40 -0800
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: <xen-devel@lists.xenproject.org>
CC: <grygorii_strashko@epam.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>,
	<andrew.cooper3@citrix.com>, <jbeulich@suse.com>, <sstabellini@kernel.org>
Subject: [PATCH v9 0/4] xen: console_io for dom0less guests
Message-ID: <alpine.DEB.2.22.394.2602031502240.3175371@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|SN7PR12MB7936:EE_
X-MS-Office365-Filtering-Correlation-Id: a6039749-3f85-40e0-9562-08de63790d5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d838xNr+JmklNyboedWiz7PSxIChy0e1iqRvGJRZ5pX8b9RcVAr2RBgie3ss?=
 =?us-ascii?Q?t/pdF3AU8yZJ7v+jo+Mj8T/bTwkB0KgsOiNDqJFZULAUs6rbXYna0Dc8iJMj?=
 =?us-ascii?Q?BQmXn2B20MZoMocY2EZpbWNEwffQyLSaBL84K3FssK6Mji3ilRduTkrPrffF?=
 =?us-ascii?Q?u8H+cqhtOmq7G+p4Dw1DQAWHo1IcFtIYAW+RxnjJQlJD2WRXsqQeH+XANY98?=
 =?us-ascii?Q?Szjjjk4U6P7jixHill8gIMD/TreszsV/O70HUYkc0qMHDqdy9iHTt0Wlozpq?=
 =?us-ascii?Q?kIxxp2i+7tuTz2hb68GiwL13GlbS82OKgpkkI76Vj8AJjgfzo/jgzeH1MJbn?=
 =?us-ascii?Q?5adD/XbqaiI0FugKjlesFWSfBXMB8+W2+kb7mFG07CGKaZT2+0nCOExCBKdt?=
 =?us-ascii?Q?PPM7QHuPKQEsQKp874gIrZkC98B+3uZRJ/u3UhHnH+z0qcO+c2NLzzaYgLPD?=
 =?us-ascii?Q?AYu/Zc5B7RwpKFvIzUo7/PC+jYjbG969MmxjtPdOiAMrhnNZJ8n58DU+oceH?=
 =?us-ascii?Q?dkxUiGxv9K5j75zrjPCaALbhmYLJIJlfgzo5sEKTHHNscGWj7WW7H4/csa+t?=
 =?us-ascii?Q?z9Nq1Q1PJE/sJpX/PORd34JoVgHHfUddGZ/QpRwD3VFipmJADlghUBkPaLk4?=
 =?us-ascii?Q?FeQ/k8ITXikuLKQhXm6peLc34iXLqG5Ry+S5h5cS4hpes4rjPvWnCuF2oTQT?=
 =?us-ascii?Q?WUcUF3XPv3rZe6aaVIWyEPr98rt5+wAjOavBNqPVblcOO539daGUwOFPPKTk?=
 =?us-ascii?Q?i/N56cOEOLclbgLtEcw55SH29XUQ8200YbEfCBIu/RH09MSAQ1xbx1W7k6xC?=
 =?us-ascii?Q?4CVHJexUB4mMEsMOLoRGGxTLAoqVqnxrlDgkyZk+xjYaLOHGr0WR+JuMyTWw?=
 =?us-ascii?Q?7cYGcuH9188thj86ZKhaW5SXIwKQnfrvEsUKIjWo7uWVqrLudjTFtyyOXEJy?=
 =?us-ascii?Q?KZeDwOiXKpCl48ss9pdzs5OBAdwGofpzTGeE6htskJ1vDlpnnYSCbHdesJ9O?=
 =?us-ascii?Q?lcJNEDlqfF50fGIaVsks1+vLBMRcNhdmcJloS35uiNSacUQoQZfhUQ2nfJpY?=
 =?us-ascii?Q?4OFOQwdBl+qFLJfmBU5Del6YRxX0jIKaTGgCoGh1W8HEfFqCLKO3o0qEMYD4?=
 =?us-ascii?Q?oWYCoS0Hs/YfYybKHWtJ8Xfnlp70Rz98wKjVmiI8Vzku2HVdRaIu23pa5XeK?=
 =?us-ascii?Q?hFC17r7G2s8OeNiOkFGAl2zoZEFF9ZD+zTiwTy9W7h3eZemz+Usg9pyASvRH?=
 =?us-ascii?Q?zDvdZMKFwOMNQt3/usqkNkqt5pP4OnDX0Iz6lujLkXc8yjj+YLYylV/lEexf?=
 =?us-ascii?Q?aiRQLu4+WPVGrD046DSno41z+9gCYP9sHWK6xu+Isfz4YkEpAbDpcnrOsu+R?=
 =?us-ascii?Q?tatL+JIDNlbQCZpFqcUlugb867qItr517SsHcMFtA8nBaqVWzTmXz1vrW3DM?=
 =?us-ascii?Q?EsUEgzxNTkre1WKO7TanDa4fIUzZwLASqY3rzKJBD36QpMQxx0XeR4VW0BrY?=
 =?us-ascii?Q?TUUjsp03YGfvehpL2jIwZwpiTew909YML5J1MaVzrYtWH+sdJqx5yLiOahNi?=
 =?us-ascii?Q?afY8uVfpIQU2gZJuFa/x4puwif9YTP3u9JRnGkw5ygbaJ4CukGN71orOsgby?=
 =?us-ascii?Q?vtgRd1sc3DU51xkZhu7agihswfIq21FRYaaBPDEkBjla1OcnrDGNhRV5Ow7B?=
 =?us-ascii?Q?95w6jQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xMU+8CxGkG6/KKka1qu98DZ1d8Tib7Hqr9Q3VEA1W3lTyA+98qQYp3KIwftGIO3NEa4BVJJi/UBQMUS525UiAjKdBZmlSDdcBR2fWbzy4heugppvAtOJPiLGBp4EtTEALokfgiLA/sM3BVHPtn6/R643VFnEpdCpR1iD/0xhK0PCqNBULGNNbrJE3oReWxFKF7obHT6tpEj/RpIaAiuGdAKpD1nv4PXVURtVfVBp2MaHVBxObz+7ODIzs0piu5NPi4CxJXGQptIRjcpiR970U7cpT/ircNXgyAje45E8GorDf+6xRT5vlN8/MS+FdKvRzLSgT23k9PebC9UIiw9YHz+8wV0DDvFkEvKXnxkD3yIeWFv6vwaooM6/nXoWlmsu3fvEnvOTK8MlK3jp1alb01hnXbfRWT36ssNYwPwBvgmPHnfy8QKLPTYluOR3yHb1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 23:07:49.9067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6039749-3f85-40e0-9562-08de63790d5f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7936
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 15B74DF8D8
X-Rspamd-Action: no action

Hi all,

This short patch series enable the usage of console_io hypercalls for
dom0less guests.

Cheers,

Stefano

