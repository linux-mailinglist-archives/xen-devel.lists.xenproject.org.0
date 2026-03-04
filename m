Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OzMAIjHqGnLxAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 01:00:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F1A2094EF
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 01:00:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246087.1545371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxw8B-00011J-Mp; Wed, 04 Mar 2026 23:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246087.1545371; Wed, 04 Mar 2026 23:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxw8B-0000ya-Jd; Wed, 04 Mar 2026 23:59:55 +0000
Received: by outflank-mailman (input) for mailman id 1246087;
 Wed, 04 Mar 2026 23:59:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mFc0=BE=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1vxw8A-0000yQ-2n
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 23:59:54 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39e6047a-1826-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 00:59:49 +0100 (CET)
Received: from CH0PR04CA0105.namprd04.prod.outlook.com (2603:10b6:610:75::20)
 by LV3PR12MB9259.namprd12.prod.outlook.com (2603:10b6:408:1b0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 23:59:42 +0000
Received: from DS3PEPF0000C37D.namprd04.prod.outlook.com
 (2603:10b6:610:75:cafe::9e) by CH0PR04CA0105.outlook.office365.com
 (2603:10b6:610:75::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Wed,
 4 Mar 2026 23:59:38 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF0000C37D.mail.protection.outlook.com (10.167.23.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 4 Mar 2026 23:59:42 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 4 Mar
 2026 17:59:41 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 4 Mar
 2026 17:59:41 -0600
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 4 Mar 2026 17:59:41 -0600
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
X-Inumbo-ID: 39e6047a-1826-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRQVnpgc4hLT/7Ac1eUzku7lu+B9GfbNeX/oxzpcWUD7kRGtsKgg5J4UV1IRX7bap+o8YKP/9j31uBcqY3Prfk03Dms1eAzGiK5L1XADjvL9l5yNHOiXlJDpvV5UEyu+KdZC1JNOKa4N7CyHXSF1KwPKxs6mcYboOsGqbu2gNYPqDHVKXeVwPpOvQgvfwBraWzkUrgAChiD8ewfzPA0JfO6dWlCZXa+CSK2m05SVtXNUbYe2Wi+e8bwktZkF8x0FB5onqioavloKdBpwap9HCthWu6lbsjw9f62rIRZOMbaXP018PRVJKkY3NHFebXK23oFaqv/gqERUpAmR6mN92Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ch29dcSMJucCWbOaueIqD6MTsLWj7sStnHz2sZuGtI4=;
 b=TZ7cN/oMjc34/E8loK/1UnPtcCC8zh4VX3/0Ns6BsfmFTetx9+pkSWQZ0YkDkuZtK4dtWZ7ic3+m7vb1Tl+dypyfNNK5C9Bs/fNWWAL/ZIsCvuZc0Wra38exzZyR/xQmrTEKpzkEuXuwZHmN9v23biU0/VCr7UpTybq7AwBIl1juNxjDAh85VQkZodBPTALwwPVxdJUXhxuNGonHxCyuokpihKFUWntgw2WmN2a4wUR/tgIl+fJLSdCYUPsylqqlIRzXqwRoOStm2PBs1UmU3c2r4Riksts0RWi6eaVydJjct5iyfvJLLgrUWH6IOGBpVtpEO4cEjitscHhNs2+WWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ch29dcSMJucCWbOaueIqD6MTsLWj7sStnHz2sZuGtI4=;
 b=hFcSOHIuOdBMiwj3GB5ZfWHTCxFdjjB6ubY0dJYODFxvfnSd5dDygHr+dsKD5A0REbUmD55Wt++Rvn4CCeN3sg7ZP1NqHHrZba9JT9Yr7ZQ+kwZfJG33ybQVH/nnZcMSD+VpMfR0A9maG9ki3bDtNYCGZCSHoqSTp7ZMZLIgPGI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Date: Wed, 4 Mar 2026 15:59:35 -0800
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
CC: <qemu-devel@nongnu.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
	<edgar.iglesias@amd.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 2/5] xen: mapcache: Add function to check if the
 mapcache is enabled
In-Reply-To: <20260304015222.979224-3-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2603041559280.250016@ubuntu-linux-20-04-desktop>
References: <20260304015222.979224-1-edgar.iglesias@gmail.com> <20260304015222.979224-3-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37D:EE_|LV3PR12MB9259:EE_
X-MS-Office365-Filtering-Correlation-Id: 496567f6-e8ad-416c-ac81-08de7a4a1a5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016;
X-Microsoft-Antispam-Message-Info:
	sV8sZ+wqsVBoZhIsq3qxSEoqKvabd20wGRyiEOa3WQLZXGZv1khrRRmyxaIkKt0lYRhARVrvJ+4zWnAfKasw//yp6I//cDfauh+w2UdD2qW5uM++NdZIFlNlA95G31k5vpETDuNzbaaTAZ8s3s71FMwdvG4tZCSVQN69kbfqgxWWGEI2mdIEZDCxg5jwujymqT0XGTV5f5aSFi6LjDUVPKQD2AAEKM4MmOSrqIjpp7nNmlgjVIn8vk50ZpknJvRizq/21UFWLC3YN/MlA6s8T4vbr4rkIA8hxx0G9kDnU20PeBhx7WEECqOsZPTJMR5n2X6ZTpBm8PxiDP2HkKIiQznlgHEN30lPeBa0q7z4m/iFrRVdBAWZJbpkXAmgy1xaR4Jeh8N83Mh0eGj2upj0JxklMQ9yEzwfoiSKkFQinn4eIE5CiBdFC9vEpKy1Cydc4BNjq9jIcF157f8mQnmuEiT2RLs7iy+9Ytk2NHl9gOJmcMxdQNI+/qsZ9Boht/7z+7URO30/aWpvf7YJxuGTokrVD+Ek5u2cWh9i/x+oOGUCvvZgzqoOrX4Tib/vTxeN5XwoJ8EYLF97FcpeLzivw7PvPlLkWpspLQ8utze1TWGGBUyEmPnLU3fmh9kkjPJxcv1BUhi6WvLeJ9X5qCNborJ2rqNCkHpHK7kFpHy+4at4QtTIw7DHuZLvKD4qpwtiH19eqHmaSq1KAPJa2Dk3fydmf44fQW31SoVTMlaevLkZa0O7VxGrmPUpmY/kLBFvoJHxSIgGq87H6d+a0ZPaBg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Nict4oubIoCW7Ll+jOvGsrF9yj+lzfYC9R9PGLoBzATbHJ36Xi45aH3FB8uQf/CW7w0v0Rxmpb5eb5lgTeMCHHWv2gJAAFwMliKxVyZVjJJQYcB05rYq0FfwJqsROoCbwV5GhH1C0gvDy0G+fX3aUGudtf7HJGKtCmp7kR5ocx0LpcnjZ7zFuXVt+OIowBtd2L6h+TO7U6XYvjBf87sQl2ez2erNf2FqsjAMiKrYEONwGMRkhTYae67Loaa3TDGV/BlTCVWSmPbWfxBZID2Wg1Q0V6bIOn2dbi62d4dxF3/4hMsd5nsNkNY5Su3jE7vYiDsYQmp8wG79Zafyf9e2b5y0vVxdzH+KfdOtdJsczG343sXHX35uHHXsy8E2/4iUy6aDBH/zxHKlv5CLtqycdJXKUhNLfZ0O3Ub0FSMc70eTcamb5PBDCCIfH+IUfEQY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 23:59:42.1138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 496567f6-e8ad-416c-ac81-08de7a4a1a5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9259
X-Rspamd-Queue-Id: 69F1A2094EF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:edgar.iglesias@gmail.com,m:qemu-devel@nongnu.org,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:paul@xen.org,m:edgar.iglesias@amd.com,m:xen-devel@lists.xenproject.org,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Wed, 4 Mar 2026, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add function to check if the mapcache is enabled.
> No functional change.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


