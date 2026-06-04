Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zChSMbTIIWrkNQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 20:49:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DD7642AEA
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 20:49:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=KkrRGtb2;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1328380.1592897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVD80-0001Zl-0z; Thu, 04 Jun 2026 18:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328380.1592897; Thu, 04 Jun 2026 18:49:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVD7z-0001Wx-U5; Thu, 04 Jun 2026 18:49:15 +0000
Received: by outflank-mailman (input) for mailman id 1328380;
 Thu, 04 Jun 2026 18:49:14 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wVD7y-0001Wf-Hu
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 18:49:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVD7x-00AzIv-Uo
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 20:49:13 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a21c8a4-5cb7-0a2a0a5109dd-0a2a4507d1ea-10
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 20:49:13 +0200
Received: from [40.107.200.44]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a21c8a8-229c-0a2a45070019-286bc82caaa4-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 20:49:13 +0200
Received: from BY1P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::11)
 by IA1PR12MB6091.namprd12.prod.outlook.com (2603:10b6:208:3ed::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 18:49:07 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:59d:cafe::4c) by BY1P220CA0011.outlook.office365.com
 (2603:10b6:a03:59d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 18:49:07 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 18:49:06 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 4 Jun
 2026 13:49:06 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 4 Jun
 2026 13:49:06 -0500
Received: from [172.18.181.126] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 4 Jun 2026 13:49:05 -0500
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
 b=RjezSdQK6BsVjAPFQmlxpfxKnXQkrWiCLzwdM40Ivs93YHHt1W25dJFhZVFh8w9G8SdBOthtd/kS5sHXVzSr0FhpdZINJdYfSlZVrzyWAx2Bwk78fhQ1Lkiod3jaBWmppV8CXVbj6g80aDRqXU/6uEXs1ck87YiyTjhjdb4KE4FLT+xaTetQWrDxlg9RMf8BlNA9kHkFPnjV0i6RwE+FydupBdE2us+RrJRNe/lRx8yZhm+iBazZS77DsVLJ0sZB5dl/LnzgcUU+aOPPWeGLwFHtPYJTJPBfZAJSm38PTUUrTtP1almdr0mG80IghsivbstoTYkaH9aomxFwZwxpow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfm8y+t3+gc+rC3VuwAhb2R7ocBat+46QllxiQmo2JU=;
 b=GwBzMO57xXmIbEyCQzjizpJfww6cSPcLCSiie3SOEFRdUxTZMM+4Spmye+dFpp27LE1wvHzpicuMYGUR7j0dtMVLI3i6gzXjZBRcFaJNy7BSX6u0e/op57NYGpJOC8BMJFyBhk+EXaEihWHNWx27RyjHhyjf4fU+Xbcm09P6zJci5AjipIDAy/0XrxOsEPw//wJ1Rd8IKeFe+IylGYT2fnLsrk7woNimQi9mQb8LwXRipjM41mt4pDIot3O0Y/SJk/a3Wauavx1oNdgf2klyLKP0LKdoTgXGjuMJWwszg9Q0PSt94hnn3KL2IZTqxRLHwvtA38TVmjT7Jv5CJ+sb0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ford.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wfm8y+t3+gc+rC3VuwAhb2R7ocBat+46QllxiQmo2JU=;
 b=KkrRGtb2ElnFsHjW0GM80ige9y7IfVPwv5estuHAbV2QLzzXGcwEA1kWNiFeJ5XdlOs3pe+7GhkwFmXRszIkJOhPv0brNLjjS/Yxzc8VvoBP6+Jb9DvgZFNt93NuHwt/RPfHxbcHSV8G220n0pGGrPbNJv2dP6sPrjAZc+XWVTo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <101d8354-3206-4295-8f7c-3cd897cec3ab@amd.com>
Date: Thu, 4 Jun 2026 14:49:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] argo: drop argo prefix from argo_dprintk() calls
To: <dmukhin@ford.com>, <xen-devel@lists.xenproject.org>
CC: <andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>,
	<jbeulich@suse.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<roger.pau@citrix.com>, <sstabellini@kernel.org>, Mykola Kvach
	<mykola_kvach@epam.com>
References: <20260603060539.1181809-1-dmukhin@ford.com>
 <20260603060539.1181809-4-dmukhin@ford.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260603060539.1181809-4-dmukhin@ford.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|IA1PR12MB6091:EE_
X-MS-Office365-Filtering-Correlation-Id: cb0459c3-348d-40bf-b0a5-08dec269f4f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	f4/dR9biQBy3ALNDHxHATi9gSPazw1lQ9a0h5VwA6ylhDx67leHJkdCL8fnCT3iUQdREtx9Bj0w/xr4M4FUL7MrUJoCRC/OuVOp0/Q7jDqAl3hvIyFBcVCeKBv8OFmz0l0z2xQqlhDgG4Bccap2nTT6qXD9PGZqgLmYODiAlwlg2j95TYa+LjoHmgtYuBrbsjW311mjaeUXzKdOK5eNTOMZVvjMbCB13C4lnzYwR5yWdGd3uHHkRSBfFYdSPUloseP1pFDqBh/4lcCiakQSNr0Kp9zM2To6POL3lRh116JQeuYtvQErsmNBNB4kOJVAdWzVLqT01kVmS2hl72tAY/Q+V3+NVLoNQ1rcUzWtk6QYW5sMjbZHi+rv9gLInTLB8VG5n+0R7SXaVlsGg9WEbEIoT7fLOz2+NzN+NVHYiUgavaz+AKy4+qtv42c8NWEdf3mqr9YkDmjhdem6BlQSAyJSRcQUabl+ZALYWcZAv9ylJo1jv7AQc71obHaCJ9a1nI6hYjd61VRYc2H39lPO8Znxydl6IHKE865xej4SFfv/drnSu+CpF2Z84XD8IDFQ6hzEoa6uR2PqKpzZQzaJJc2gBlY8Hiys03tiSbakeXtfG5tAPgBg2WukuF/l5muBALFtlydP3Q/NO0UBOMfXWrA6hw58C+1Ju71JMjliKdkPpM81Zqu08scquBV+WzETkwDYFf/5DXQgo/RX9IvTx952RBDUo2B588sDkBPpJ0Vw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	phGmcf+5vOWfcfmuzS5PmVAiunH6E0UCZIYNdm225i50pi6N154ilhdLEIcPRmHEgMdU0NcU1uB9mrSZVIRsOBXvVxsAfNTu4AfgNSE0d9GjV2tPPf4NakXH+uzKBU3IdvOX7hD3n8F/xcXIKXN0HKJ5twjroEhBkkYUIYUj+kJ1KydScQGVctpth8d/5KgH12ClYBB0sYmiRP4J8EC1a/+LwEpCvvDTsYOJ+JOZYguqLs0uXGN2Bi3Emj1SQXkqwlaHFiGc98v3WFdHf2bBnm58mO2QEw10U3rGS9A0QdMhKnhzy997r5B0Gl5SZQe7SIUKbWgAHunEiHlgbaynEB4jKbfAKMhsWUzn+6pnauRzbuJNV+bgHHp42ecCr+75zwtU4HGN0ZcnUhP+Do44oaHWAjHgH+nmHx53bBHkuvZQy2E2RdfBt0GE4upDjFEf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 18:49:06.9519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb0459c3-348d-40bf-b0a5-08dec269f4f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6091
X-purgate-ID: tlsNG-ef75cf/1780598953-0AD77C48-8BAE88B0/0/0
X-purgate-type: clean
X-purgate-size: 428
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
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:from_mime,amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,ford.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 32DD7642AEA

On 2026-06-03 02:05, dmukhin@ford.com wrote:
> argo_dprintk() prefixes all log lines with "argo: " automatically.
> 
> Remove duplicate prefixes from log messages in the Argo module where
> applicable.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

