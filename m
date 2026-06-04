Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zI7RLqTIIWreNQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 20:49:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB8C642AD0
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 20:49:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=oyVByhTD;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1328376.1592888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVD7i-0001Bo-Pi; Thu, 04 Jun 2026 18:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328376.1592888; Thu, 04 Jun 2026 18:48:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVD7i-00018p-MX; Thu, 04 Jun 2026 18:48:58 +0000
Received: by outflank-mailman (input) for mailman id 1328376;
 Thu, 04 Jun 2026 18:48:57 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wVD7h-00018W-21
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 18:48:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVD7g-005Hbh-7q
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 20:48:56 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a21c87c-2eae-0a2a0a5409dd-0a2a4504b3e2-16
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 20:48:55 +0200
Received: from [52.101.61.29]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a21c896-1dec-0a2a45040019-34653d1d5509-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 20:48:55 +0200
Received: from SA9PR13CA0136.namprd13.prod.outlook.com (2603:10b6:806:27::21)
 by SJ0PR12MB6688.namprd12.prod.outlook.com (2603:10b6:a03:47d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 18:48:48 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:806:27:cafe::84) by SA9PR13CA0136.outlook.office365.com
 (2603:10b6:806:27::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Thu, 4
 Jun 2026 18:48:48 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 18:48:48 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 4 Jun
 2026 13:48:46 -0500
Received: from [172.18.181.126] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 4 Jun 2026 13:48:45 -0500
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
 b=A6uAByp2cvm7mlC+C+vECTt+ZdvGulqD6SdzEOCTjo7boNieU89M6jR/HM6K//fm9hWSVid/Glh31wmr7MAWMLJkMc5Lv1bvt+v2Lh2RZkmKDgJF6uQRliU1qkjUz1o61HpU62v5OcE6i55Ds6gS8n7B2usk9me8edouD6ZYuJ3rfacCqO4rUGw6gsXaXJl8pnJQ+sduYA47f3qZIQcr8oG8/srJjl76J88+PUoH/UcNGynv28hYV8IYNOQotCl4CeOzdqdh7MpwPUelGrj2L3CVCc326H/A5NG4roZHXVl0wYJWtJx4ywVYU+iOriM3dTcULZUI3IPvP3zQIdpO6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+nXwt5j300HvPYptDMgGIZU8F/Rgx+EbrH7MKnlN4M=;
 b=ByJ7rv8QpUolUJYN29UipZtpy4ozzr3faLafmwRqKO2eqEshx1u9pmESzfidun3dnP1OdCIYHg+3Mm5pmJGTm4gJd0gcymeiLSkOw3NQJTwveN/Dcj/hPdxftSfcqyJHoGJA44gupzNfUyFS4sUhCFrBLNV4IOSD5E0EVz9URlxMB7PmNssGOwlyOngvfhkRsKc5c3CEU65aNoQ55vu0Yat+vEjdcVkWkh3lKX4HLzCP4XFjot7XDvuC0WHkpW73IWjscoQlJh3XGxYsh3Xsb2+JXumrCuqICjcWThf1hkUezCbpSbqQvYy517d0IhWcu4RHtN8J2C3c8ZRQsdo7yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ford.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+nXwt5j300HvPYptDMgGIZU8F/Rgx+EbrH7MKnlN4M=;
 b=oyVByhTD9ddmM69s8ot28BryMdPEO4YYJQquHH5YevCD8EA5gTo9L1Nh6R8cbkhgjzRCYdq3ky1hhb+0QI0bHIpgpsA7tatd5G0EPwuzSrJhmFJ3g8vsGvXUThttQ/W+teLKJFppYHXmx3N6pwRcecZCNoBOU4fYpVzdqjInl5c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <76124bf4-eebc-46cd-8154-782e9874bf1b@amd.com>
Date: Thu, 4 Jun 2026 14:48:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] argo: correct logline in ring_unmap()
To: <dmukhin@ford.com>, <xen-devel@lists.xenproject.org>
CC: <andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>,
	<jbeulich@suse.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<roger.pau@citrix.com>, <sstabellini@kernel.org>, Mykola Kvach
	<mykola_kvach@epam.com>
References: <20260603060539.1181809-1-dmukhin@ford.com>
 <20260603060539.1181809-3-dmukhin@ford.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260603060539.1181809-3-dmukhin@ford.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|SJ0PR12MB6688:EE_
X-MS-Office365-Filtering-Correlation-Id: 65e24aa7-4f4e-42a4-93ce-08dec269e9b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Fa1E4m5aZGUnHlmT5bccsqW/om0d698rOQXV1kvi0vQ+sk1ShwvRtFmeiYn43CLRkzb05rQEpH/e07OMOG/C50XCw/fwjQuYs1INB7qiETZCr4F4Icajh7535bXBfu4eW1Y1LgiS8uvuvn1xThgBW3z4GKIKsoEUgztPsRdVeaoGKSJx1dBzN/HdqQ8SsfwftXxCPyIz/eRLfa6ud5W8VEaCCbA7m/RMgKjeec/rrDBty1+/S2rH1eAr6Mf/YtTzKkbtisiIAlVMBX3gwTWY4xRe1+4KwL121F7EJnyvADAXHg7iDc+OhiCar8lBJo9LEOQ64KBRm5K2vXuc4YhLVn8c6mXGo/LbOYlWuzpvBjo19rJtL3SkEiR2blt69pa4yD5n4wtNcibH6EOLoLaWgaYc+I6ICrdRSfPEyXMqti/9h0Da2kiNdKUeSQTDQCyc90Rel0Ti75fVifqRpkyd4NVeuwgzCXOueTUNiBhYCbyPAygEv33AER7pl75v3xxUHY/6H4O8n8aJH7wvjSis8nbwb+gMlZaeojih+RrttwtYoWnL3nPJTdHj2kjnH8Pm/Jlf3aNqrgr0pdmQa2bXTX5rvEzg+rOoDFVhIV8FlqY1YOsvVpN4A5aiPgzVQT2YEhDeDpomrXhKzfknb5bV+V2GDtn8+hVi6u5lFMab9oWuQjy/0l5cFdstiMzYmq6vSP2IA331rMhwoC3ytcO3jNDtIs4DhELBA/sdcrfYBms=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	M9UjMpPRdS3UBzdVKP4GC7Ro9xR7wq4HDGQqxYg6ZZPSV+UhyApVtYZpIGlf/mR7nIxrDJwk+IYv7zo8Au1w3TWm+uTYHQkHJVhDLAFkdyc1rifQ+ovGMK1tkbfm0AA0PoKJ1MRa1cDtwthxpFpZ271bkHlIx30L5RESrvkVOvN/Hesu6uIQxpOmOLkWKEsc7VNcAGvr3Zx5QZWzk1FpHGYDC3SjfVsABemGJnajOPaRt+ovWrD7FGrl5YetGaYAm2Vk2g3SYtgZfT4fyKGvUYMEUGQfoTTd/gmXgPwDtvD6lhLNrnoM+RiGJ9vreOuLVTrkXN7duPPJa9zD8/iAji+bZ4PJWNkbA1y3GjxVn50sw6WfekASnngmaHIeTrNAOo33ZXXJMQXGSLR9z70KbyNFYk0EOXobL98JoDFFl0Ljc/VlIjy15EXvxsRXNKNp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 18:48:48.0550
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e24aa7-4f4e-42a4-93ce-08dec269e9b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6688
X-purgate-ID: tlsNG-ebf023/1780598935-417793FF-9CDC4B32/0/0
X-purgate-type: clean
X-purgate-size: 454
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
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:mykola_kvach@epam.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:email,amd.com:mid,amd.com:dkim,amd.com:from_mime,amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2BB8C642AD0

On 2026-06-03 02:05, dmukhin@ford.com wrote:
> Drop XENLOG_ERR from the logline since argo_dprintk() already injects
> the proper log level indicator.
> 
> Also, drop "argo: " prefix, since it is also injected by argo_dprintk()
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

