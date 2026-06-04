Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5JYeH2bJIWocNgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 20:52:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD649642B43
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 20:52:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=N0j7ozTv;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1328391.1592905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVDAe-0003Ug-Hb; Thu, 04 Jun 2026 18:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328391.1592905; Thu, 04 Jun 2026 18:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVDAe-0003TJ-ER; Thu, 04 Jun 2026 18:52:00 +0000
Received: by outflank-mailman (input) for mailman id 1328391;
 Thu, 04 Jun 2026 18:51:59 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wVDAd-0003Ol-FO
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 18:51:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVDAc-00BcqA-SV
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 20:51:58 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a21c941-e002-0a2a0a5209dd-0a2a450cbeb6-12
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 20:51:58 +0200
Received: from [52.101.61.35]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a21c94d-62f1-0a2a450c0019-34653d2347b3-4
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 20:51:58 +0200
Received: from SA1PR03CA0012.namprd03.prod.outlook.com (2603:10b6:806:2d3::15)
 by SA3PR12MB7860.namprd12.prod.outlook.com (2603:10b6:806:307::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 18:51:52 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:806:2d3:cafe::97) by SA1PR03CA0012.outlook.office365.com
 (2603:10b6:806:2d3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 18:51:52 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 18:51:51 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 4 Jun
 2026 13:51:51 -0500
Received: from [172.18.181.126] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 4 Jun 2026 13:51:50 -0500
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
 b=keuKY2KwcEm5PCkiXvSXUKf/mk5vAjuMPc/shSH6mEEzSRKO2ioas/SkS9y/2piiiKXlRDegEIO8Zm1JVJJtANbgjepllLJ/bFg+o1hINT3xBgxe71XCwJafKqgrORiXFBjso+fDXmmWPNO9PiWx8ShOzZ0klFc1PXcDKgsLGmpjv1tzCj8QrtRaSI3qMPfPh0MaLt8UXT4yyv9c6HbPbMfz3IngdlzDiCScWc0llA6j+hYzAlkIYH2EWhlfwXinidzx7p4ViRNlbPmK+BzIwMoDr87ijxZwBblTJf2AWX7/lqAVWQxHVAWu72TC9TqNMXPYQhrMiGmCKpoaCbyGiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6dPmMKyUE0fo+zbJ6EfyUiCSXn9uFq/qxg96SNk5ntI=;
 b=mWuBZB/TAZ2/3Wv/dPiKh4IRUdB2z9A5B4TkVCgdnLPOg6UHBeht+M2sNcKIRB0BI6Csn1Jbaib1mBu6uiIURaZ8YK8028Z+ct5Yorl4cwz/WJcYKUKdMlPHIVS5Gxz/9OwTtkzL317MPXRGMR1kkZPw4W8tkqmiMXaFj8oSe2hsV+GgPtJkdKaSFxDYD7dt2PauUKnXTLtc+yOLiD6KfOFb6BszxRMw1iXmEaq8o0ZPY8xvFb/L21QSWbxeYQ9vJ9EdLSK3feSRRRw0qxG3Ir/CipeZOw1++ACUGv2EIrhSmkBQyPaTnVQErFvmTBnzYDbnZ3Fz5GovnDsXeaUhHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ford.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dPmMKyUE0fo+zbJ6EfyUiCSXn9uFq/qxg96SNk5ntI=;
 b=N0j7ozTvr4IK43kNaqlpgFgMVG2RrLCnIsRWlOIxTyfakyQf3eIWw3i4hBRn5gsGAUt0xzFWFMVkIBWMYAJJgIdWizmcP1ADAWT/Tyj039WZK7PPV384sXTDNNY0rBUHBJH+aNvLZuIUuBNcflUCcjxGvMY80Qf51PfSSUlqJpo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <f2007ab7-05a0-4163-b5b9-9300453fe653@amd.com>
Date: Thu, 4 Jun 2026 14:51:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] argo: fixup argo_dprintk()
To: <dmukhin@ford.com>, <xen-devel@lists.xenproject.org>
CC: <andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>,
	<jbeulich@suse.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<roger.pau@citrix.com>, <sstabellini@kernel.org>
References: <20260603194131.1468654-1-dmukhin@ford.com>
 <20260603194131.1468654-5-dmukhin@ford.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260603194131.1468654-5-dmukhin@ford.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|SA3PR12MB7860:EE_
X-MS-Office365-Filtering-Correlation-Id: 78a57924-ce1c-4479-ea2f-08dec26a572c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|22082099003|4143699003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	ZFa1yl28A5ej6bgqvbU5+TMD4dK53LUu6hCscQIrtdyHmDgzA50UUhczcQ6zSjBRQTOUX8/798H/KYhYONTi2P1dka30xzaOHwUMgYlQ1ZQnWwzc9MnZERSFuEZQ78udkXOTZZdghzJOl4QqbjFXSZUdkW8rZdpymtKAPCH7l2bAftRqX5/KWtnNhd9iBbiMMYFmbhPmrDXq5Pu+1IrbdE3VSiiH8Xximk4XAgVjPBtJghOFB19ZkInfMW3uEju1efpBb/B8zkx4Z5tKCXFeOjS4vXjqRBrI+MYiK/SDiZsIKua0LASVodcW/Uvz1tVeFLSgrS07WUAUfXlTDK5HkBJF7CNa3R896q6Dx1xkTikXW3djqGOKXWaBYcdmKlwyk+8EgOz7lmiqpNsSw7UYhNxDpumrmcOeJlAnKn8HI1tASN18CXFBb5vksB6apZIN7S2yc4ykDJ6cdaMuOuF9ToDiQSTJPN1rCIjPcsmRaK/qWkPclTsKrABhUMHs+aG1739/hPavKfDMiZO+ETLhPtnSLuWlQiu9l3PLz5p7PHoMD+AH0hCcpnZ92HzOkUGKIsvRT/sC/L8GmH2MHx1T3amkImO5kwZj9UvKCwFgGfeypbRuxz3jjF2GFQhcXEJlnSlJb3KraTY0uXHNYj+tBVliPNMx6LeQU+cbkr+Ql1cBARmC6J108x4BvKuTPyPVVaiAKm4t94PsDiuN8OFVF4iVKYeoBv0+YZWWaPb+9YM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(22082099003)(4143699003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0s8q+NcHCNJw7kmECiUm16fFB04hfcWXReSaNiJxY1ddlZEGFN6CVkwzLPtEndTQw+8Rgu5PGuTmwZu3KmQXSgh6Wbt/PT/DWVw6y547AYxIfdTw8IHXXWS7sv3cAzmC4QSqBsUhWu3ySLsF1iDLVzylhee3KXEVJoCFkKwRD4CVvLY4hqG1Cg/4XvWxazEieHmGWQ8xeVYJfYjxOBxLibFePSJVE3dg1bAOvW/EckW4DYzdhfUWO4U7T2JshVadgnF2bZVfT40g+WcmouCkBCa0UlFDRQV/o3f51p8wdRnLEx9mK74ndeCyEJsSU67DVJ/P+L7f6URpyYkvaXCuTiL98KVrzIubDWNId5yHheemsQvHR7Ci/mlELYOy3aG00dWxkrLtPgrU4Gay+PM/9HVI/SQZoEAdn5a/5NAGVhpaGwpQwkNnkauEAGfX59Vi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 18:51:51.7692
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a57924-ce1c-4479-ea2f-08dec26a572c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7860
X-purgate-ID: tlsNG-d25034/1780599118-DBD7BCF5-92BDABE3/0/0
X-purgate-type: clean
X-purgate-size: 560
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:from_mime,amd.com:email,ford.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD649642B43

On 2026-06-03 15:41, dmukhin@ford.com wrote:
> Current argo_dprintk() implementation is a wrapper around raw printk().
> 
> Rewire it through gprintk() to allow for better debugging context
> (such as domain ID).
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

> Changes since v4:

Oops, sorry for replying to the v4 patches.  I'm in the correct thread 
now.  All the patches are unchanged, so the R-b stands.

Regards,
Jason

