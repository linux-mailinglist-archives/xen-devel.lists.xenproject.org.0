Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F6ucFYjIIWrZNQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 20:48:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4462642AC5
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 20:48:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=Ry+31Ekb;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1328372.1592879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVD7H-0000lv-HG; Thu, 04 Jun 2026 18:48:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328372.1592879; Thu, 04 Jun 2026 18:48:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVD7H-0000jm-EC; Thu, 04 Jun 2026 18:48:31 +0000
Received: by outflank-mailman (input) for mailman id 1328372;
 Thu, 04 Jun 2026 18:48:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wVD7F-0000jg-BU
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 18:48:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVD7E-00B034-HM
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 20:48:28 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a21c86d-e002-0a2a0a5209dd-0a2a4502c088-12
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 20:48:28 +0200
Received: from [52.101.46.55]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a21c879-af86-0a2a45020019-34652e375eb0-4
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 20:48:27 +0200
Received: from BL0PR0102CA0026.prod.exchangelabs.com (2603:10b6:207:18::39) by
 CY8PR12MB7097.namprd12.prod.outlook.com (2603:10b6:930:51::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.7; Thu, 4 Jun 2026 18:48:21 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:207:18:cafe::24) by BL0PR0102CA0026.outlook.office365.com
 (2603:10b6:207:18::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 18:48:19 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 18:48:19 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 4 Jun
 2026 13:48:14 -0500
Received: from [172.18.181.126] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 4 Jun 2026 13:48:13 -0500
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
 b=D1/inizJKZfeDT/JuF4IBRwupK8o0hXUmlGUC10dlFY+qpz7J7oLyakB23Rd4iz7oE2cIyHpEIdf+AVB5KSeumx/OyuyD6eaO+uhpF7pAudaGuFzYeW2Xi/LiM6yaGqAgSZPqY129wx9MKosvUflDeEBSW/qyZGTjLWk4nNNRGtsYjkDF5UXERKur2EHhd988M+6ivhFvrzn2EpbTOPV1Hk8JnbbN23UolEksBnK0JgBnIxVRhuPiGIZXUkDiQPt7SoxFIA+VwjtY7/BJdieB3C/TDBiGay0u98XzMn9/OjWqDnxeioMfDrCwp3dj69lKQf3vOZww9AX3yNrYxxwFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1zFpOqM9+eOSPJDt7W/rGDCzXqRj/mENuJ2i7bDt32c=;
 b=D2E4/RlzN8SEYHy6WClpHOWX4McYtHskpl8MDi3n0/WrCw32YHByx3VgJgfLE1Y7gluz/gtVZOGJ2QWlX+vD9YwjbwW0RCMjBRtXnn85VzYY6a3Aem9MTXiH81YyldcRQCf8ziqasGKGwNv6uW8ZqUJwCnXaNbtA1YgYDYT5inFdyA7NiVH786n7UCCndYUFQ9aEirnh/aDLCsTC3I1s2MDeS64DzuwXUNVI4bilI9CXclJrqHJ3vK1hgXK2pKKwiGXro6MZQBvxCLKtZfA8NvjdWtrW+YEU8Uh+KJeREhFjLKGOPHrMbUfb0gU9UMMc0xzdoUYOfGhN2ebnFNerTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ford.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zFpOqM9+eOSPJDt7W/rGDCzXqRj/mENuJ2i7bDt32c=;
 b=Ry+31EkbvFOWPjlvDpOr/Nc3/1YaDCxhZ4cdjltshLzp6S8xz8QmY/xcoKoAjjq3JEnzLRsB4fL/ioSYSm6TrImKhmeWQ2ZaPv4r0I5zibmYWvqaH3CjknvJTX3BS8KxRKIaF+7A11ggAV63L7xCU0gwbFnnnPbfKbO1syMaBfY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <c6979a2e-397c-4089-9790-503652a1ac2a@amd.com>
Date: Thu, 4 Jun 2026 14:48:08 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] argo: lower level of noisy connection-refused log
To: <dmukhin@ford.com>, <xen-devel@lists.xenproject.org>
CC: <andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>,
	<jbeulich@suse.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<roger.pau@citrix.com>, <sstabellini@kernel.org>, Mykola Kvach
	<mykola_kvach@epam.com>
References: <20260603060539.1181809-1-dmukhin@ford.com>
 <20260603060539.1181809-2-dmukhin@ford.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260603060539.1181809-2-dmukhin@ford.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|CY8PR12MB7097:EE_
X-MS-Office365-Filtering-Correlation-Id: 5704f7c1-a30a-4666-2f2b-08dec269d883
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|4143699003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	jCWLu3I6whzpPl/MrhGb/uHKfbiwULn4j/4RCUFpSFT9EcSxR7IKmYxvfjIBWy6bTOiR0zjPpiPROQoZ7z/vqotZ814TWtSGpEbeaCki+MByGlib2XbuvK2UtXhZzRtnvOIXTsULzeTzuiFdAxqOjKgYLV6BD9TxzfWthv1N27CvAd385bku966fOXSqHh9WVtX+dGjlRhBnnxRyFpftsI6vCK9kJjyVru2zsLmQY8G2GIPY0r1BYa08Dc/FNSceKL6AJsgVoxbfJXjH7ZxOLldqdUTEqEBpVv/1iq8112rHrMnKujnzl7c3FlQp9SayjRXhlCyJ43S95TwxlpSfn7B8m0J1GnhfNhXhcLvnLEhl7pmnTSyQ4XT7fQybuPo3d32zpt/Mzt5ZbVMPYMW6AF/ILG+K8WfsuzKCNRSYd9RYVyNhdNpn2fOX9bMT7cKnhy3+d/QdVLTlVMAtldannEyCgYADaqpJaiEyX151ul3VEXnQ7ZOprc7BnVPuffwhfXBO9RLdmcljyrW9+IvWpg2oO8/V2uYX6cqn4DML1A9qNCW9NA+se7RmZL1HHjvPNsDb6+11oO44WQIFPtjPFXmbjCFeTEpRShY8xvmgvKD2R0CK1Q6w99ik3mIcjl46hNjyml+vX6w20MXClR7cLH3PToZNec3GtZ+9xKrIpzY1LicYN1jywzNt2/XsbSGEpfjp83H7Ivc5yOb26vBB03geJFtItP2RPM4KfhBx774=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(4143699003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BP2bruDEAtn6G81xSzyHBa4QI1D/sU5EwJGkJXi1rMaGskrwwdqn+GCOycTq5YDiMMCegMeH62C9oE5UxPG3xqkXHFtkcG9PK/SpKVtgWEfB+Wo5aXjX+Zpq4ZfyqctA7K/sKRj2WGN9nkBg71QS0cDTH+3JxDAAyNagRNAw2G0hS8ByAmYpWLU7XEoE73gCYC7vqgoopyBqPCkVYnYamvU7QKspKudn31BPmU+3Ot5KWLyByavgmKl8pczjUkl3HCIAe9efaeWkWYDT2n5GAU9L27/D5uAvYG49lALO6h5v6vA9mLv8E6Rm4X9WXpFG6STnV3/5ypjcY4+BfToj0pafF6vDK4xHbZISRmnjpPZlbww5VQse7TKkQj3sHJRa5OJBKOSm06EHuI+lVr7IhrJbvmprfexkr0B2tTPyQLU4ScwF2WEaDlZkC/KLf4Kl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 18:48:19.2574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5704f7c1-a30a-4666-2f2b-08dec269d883
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7097
X-purgate-ID: tlsNG-720697/1780598908-8276A161-44902D2B/0/0
X-purgate-type: clean
X-purgate-size: 595
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:mykola_kvach@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:from_mime,amd.com:email,ford.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4462642AC5

On 2026-06-03 02:05, dmukhin@ford.com wrote:
> Switch the log line to argo_dprintk() so it is enabled only in debug
> environments, as it can spam the logs when a dom0 service using the Argo
> hypercall tries to communicate with a domain that is still starting up.
> 
> Note that this also lowers the log level to debug when the argo_dprintk()
> facility is enabled.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

