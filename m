Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGI3ORRUvWlr8gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 15:05:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F19A2DB8DE
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 15:05:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1258059.1552233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3aSm-00017F-7g; Fri, 20 Mar 2026 14:04:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1258059.1552233; Fri, 20 Mar 2026 14:04:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3aSm-00015j-3n; Fri, 20 Mar 2026 14:04:32 +0000
Received: by outflank-mailman (input) for mailman id 1258059;
 Fri, 20 Mar 2026 14:04:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lc/M=BU=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1w3aSk-00015d-4R
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2026 14:04:30 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011021.outbound.protection.outlook.com [52.101.52.21])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b445306e-2465-11f1-b164-2bf370ae4941;
 Fri, 20 Mar 2026 15:04:26 +0100 (CET)
Received: from SJ0PR03CA0201.namprd03.prod.outlook.com (2603:10b6:a03:2ef::26)
 by BN7PPFA42F4F89B.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6dd) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 20 Mar
 2026 14:04:22 +0000
Received: from MWH0EPF000C618E.namprd02.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::47) by SJ0PR03CA0201.outlook.office365.com
 (2603:10b6:a03:2ef::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Fri,
 20 Mar 2026 14:04:21 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C618E.mail.protection.outlook.com (10.167.249.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 14:04:21 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 20 Mar
 2026 09:04:19 -0500
Received: from [172.18.105.61] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 20 Mar 2026 09:04:18 -0500
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
X-Inumbo-ID: b445306e-2465-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cvo42goeuLtQiuSt59iWCi2a/U51UGFHeX4Y/DHwJNN0b7gxU7zoLJDXeBC+BzImbegtXYVxt6oGHUIJL897fKW1fhQcXqu83x45X/tlrKSh3njaovwi/nBD0ljt8VJp1IZeGfCdTfd+iMALY0gWqpfxpkq4qD82bXL1hyRCKgC9Qi3eaxdr5xs5y9ZC57OBDbepmugYdKnZG5hr37ho85k5Xh8Z7yJhbE7mV7Jv+BsFHVw/bJcJjabwsdk92XXn+YTXoUjomDfd3UvZRBW7HlaxG/SQei4GZBjctkdxpED1oYXowtryEfTD3d3vhlvDiVdDFdrFLPQI+Qnfyxh86Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yynQ/Qm0Pqs20e8Rw/eeG0S9kKqL5d+CMvs0W75a+8o=;
 b=JAMPCu4S6UFcvhbPdN5LnWim+NgEYzSy+z2v6Rn0/P9H2JKvIvx+vxShERWXW/WEEXb+OTxtZVSd/sAp1br0XLpwFfLjkrgK2eNIAmXrzb+TS8TfEJ5qQWsPrlD1eG51xPOzUFLJYTsqtW3ahrCLKyXspf8ekG2ozpEegu+ZuPRdtoMWiOzAiAels85NudVHh6oEcnR1Ri7oy3BJNsnj3Z4gSW7OBMnt5iKw+W9Okl+2WyGcOK4yyFwqYC0KlFcg9ZapNMNeEA7Rvoo8MV1cF96IicO47sfiK49i2Zcbq4iOndA+gVCWH2X63t1v5mT5M6smtj1fdVNI1STmlz99JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yynQ/Qm0Pqs20e8Rw/eeG0S9kKqL5d+CMvs0W75a+8o=;
 b=NxC4uGWzsWeOSHHHNGRcLo2QBzEEDvKkw+vYCIdTwsvmbL5XcQXvuRszqJF+7xXqy0OaCvTbyp2Wcl4fRy3PWW5LkfKe60rMEdrHe+1BvmtijOtyFoOY0MPW9tKizIMLwsPeMi4YWWupES7+zGkej36thiqfohQugVVjNp7vBnA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <c64842e7-9b13-4549-a57c-1a642d7e1803@amd.com>
Date: Fri, 20 Mar 2026 10:04:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] install.sh: Preserve symlinks in destination file
 system
To: Thierry Escande <thierry.escande@vates.tech>,
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich
	<jbeulich@suse.com>
References: <20260319165047.900047-1-thierry.escande@vates.tech>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260319165047.900047-1-thierry.escande@vates.tech>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618E:EE_|BN7PPFA42F4F89B:EE_
X-MS-Office365-Filtering-Correlation-Id: 824617ab-4b5f-4741-c2c4-08de868995d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|56012099003|22082099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	A05FuuB0OhPvkdFA2T0FhzTAKUSbFoB8bMXeOr8Rjdz+d1W21vmviQlEVgONSnO3jv3LqopZYTCLdtBuOoc7GNUAsyWrKZypiFMFF8f7Jylu7mbqyFVtavdMm17dhnTtCNaqriztJnbdeQN07GOZZ03WWTwmhoIwto8nOFg7DHntTVecZEGHdHMzjGQaB5LO+M/Gq3AYD+7zRAA5knvueNABHadJxsiJyKcfZKkyqXgQFIs7eBsRLptfyqvRnEs5rJQAupncOgDF1HGjt20FWFfSK2oUZKruwGwqOxHKgVa+rt/IjhWDGgG09AnljWmHW86r49136e2QjVfdxZBQQmnlb2OsoSClbpuptIaKq0RBdusiWeZPaqivui9HPT19NTVsrVGJOO8OrWbw7NVXAcMGxhvBIJQ+PSK11ZWN368+D97Nz2IYgMX2fK4t9lQKtGVb4CAkSQiFeZwdHSosjavjL/8w3t9uMnrznzfJ40b+7Qv/MroUAG9k3+2IGjdomRd5PT/yeUVPpzvPfJU1I33JuM5oARPWSLC3S5NFLPwPIQ13kh2G/EhNiy+ZV898rhOPCgP7MMMp1JpIrnt6pFHWrItnpxXIBWnXbjknzk118e61bQvVNJHVjhh7ZyIz799/moUfehjzQTsQyAnk0KXNddzFXong9sIVRS1Pn+VySuGeZ7sZssnoNkcXnDBKnF/mrRzXKHehifU6WvPiPVV1tuH3vbA7E6jJGlNBZq/1fQL5qVj6qqenLS/WvfG2Bd4ePFRDEL5dF3iHVltr/A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(56012099003)(22082099003)(18002099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gXgb13u9+yfTlT8yr2ExMaS76QMWWi8yGUIvoHhdvvBI6+i5PhsIKxPV6C2KuEg2oGhE215hPiOdrlzhYTjoHrUSHrkQtt2knKNJhv3lUvaCXCEGsbyYmjPRnVour8uaXl5H4AbGqpVRHjZCG0UDXtln+S/SRJRdAtK8P5seVfCNo7px/3CBhgyNvX2YbqH/1J8nemEMUFJjYS8I8X0yBa9nuAcNg2t1mY0knMX6wo/vZAuWakoFn7tu3hXOvgEG7s8iS/JK+07cCFZJYTXYYORrogvMyChTml4nXj9np72Z7l8mzjPy0acNXTQ5r7SI1UgEHFeJznaHxvX3FsvY1tkDQm007XkoC+p4VbERwuXvRkTGiVfDFHB4lL8rfXZAmXjdSTMX1eD+BKRKy/9UfIGL5xwsZuG6zTX505a7qeqOjUvMdWrkFRUa7mcz/xti
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 14:04:21.4424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 824617ab-4b5f-4741-c2c4-08de868995d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFA42F4F89B
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,install.sh:url];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 1F19A2DB8DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-19 12:50, Thierry Escande wrote:
> In various distros (i.e. Debian), /lib is a symbolic link. The tar
> command in install.sh replaces the /lib symlink with a directory and
> results in a non-functioning system. This has been introduced by the
> installation of the systemd watchdog sleep script in /lib/systemd.
> 
> This patch adds the tar option --dereference (-h for short) to preserve
> symlinks when extracting the dist archive.
> 
> Fixes: e54a6cd6a1f3 ("systemd: Add hooks to stop/start xen-watchdog on suspend/resume")
> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Tested-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

