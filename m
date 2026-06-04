Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fzKzIJzJIWo6NgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 20:53:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E02E4642B7F
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 20:53:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=o20ckOOA;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1328397.1592915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVDBh-00044a-R8; Thu, 04 Jun 2026 18:53:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328397.1592915; Thu, 04 Jun 2026 18:53:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVDBh-00041k-O9; Thu, 04 Jun 2026 18:53:05 +0000
Received: by outflank-mailman (input) for mailman id 1328397;
 Thu, 04 Jun 2026 18:53:04 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wVDBg-00041a-2T
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 18:53:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVDBf-005I6k-FX
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 20:53:03 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a21c979-2eae-0a2a0a5409dd-0a2a4504ba6c-12
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 20:53:03 +0200
Received: from [40.93.195.16]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a21c98d-1dec-0a2a45040019-285dc310aa0c-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 20:53:02 +0200
Received: from CH0PR03CA0420.namprd03.prod.outlook.com (2603:10b6:610:11b::25)
 by DS7PR12MB6072.namprd12.prod.outlook.com (2603:10b6:8:9c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 18:52:57 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:11b:cafe::8a) by CH0PR03CA0420.outlook.office365.com
 (2603:10b6:610:11b::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 18:52:57 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 18:52:57 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 4 Jun
 2026 13:52:56 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 4 Jun
 2026 13:52:56 -0500
Received: from [172.18.181.126] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 4 Jun 2026 13:52:56 -0500
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
 b=wmYcFrWqNhwwr3qmsv/gqkFuGxdDzseRCWwugsZaxXJLzq+1njMZl5Ss41RTFUL7KrHbnX/XUxZjz2bbI01rOdUf8NkmVDKmuzkO589fX8kom5umGXXr0WRkC7PjZtBhl49O+eLOG+CPIGqqtDbSF3OqkZhPFUxV7eQLaqyuKbJi3ST4WbobQHq3ijcRIhZeqcpaaEnFzbeBe/yCDuCNAoOa9/972lf/J64WxrlRS2vEWy9mbW98rtdnS1Q2LuTZXRYlqpJD2IZPTae7/9wH6aDW5hUSGNQCYeu0XvqQseCA/0qrJsypuQHfo0SQpwtUYbhA79uS7HrUnbvGh0yd4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fGRd8gJV6vuRs7Y4iZ6npCIBh3/9cndPA+A/QSp/A0M=;
 b=fDMESzXEDyV6mvPyaRgKpqzeUyxUWw48yZYuti+nQmuLse6Ea6GDJAGizlV7YJKLHoAxjaHbVbc+2pSSXQmDFsYoXFyG+nz07v5PaLPvyBosTgHe8Uk3PL3ea0Fpywx08O6SUTaPvbouAsCRYlVWU63mq2ud9W6RyCLVu7uDFGoHFCSb89Ir4tMdhJlY/+a6L/hq/3ujG3I3Y6c6bOdi1k5vkzRyP56dQEgbX4inxHWb31aG+OA4/GbtL0QlXMr3kOy6NlzSt6WChg3OSrTqaRMEyiB0xUwPddKJD7R5jAEToWXoIhlBLCrBiFlZMeVgY/mfn9y9Xj+rsHBmT5I22Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fGRd8gJV6vuRs7Y4iZ6npCIBh3/9cndPA+A/QSp/A0M=;
 b=o20ckOOAV3Ld+OKIdxBKO1FWz4befRaIJMwTYGBMnFVBZlzseO7mqwzYEtbYVpEDgTXolXNpCa7YPepNAir1A4r3tEUu3PKO6UYNwcgif7qO3/fS9HmbxSzbvfdVNKsIbwuD2I5o8eyNgG3WUtI4k/IVvXV7iM2G0NKths39240=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <51167652-548d-48b9-a10b-872f31ea9e2b@amd.com>
Date: Thu, 4 Jun 2026 14:52:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] argo: introduce CONFIG_ARGO_DEBUG
To: Jan Beulich <jbeulich@suse.com>, <dmukhin@ford.com>
CC: <andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>,
	<julien@xen.org>, <michal.orzel@amd.com>, <roger.pau@citrix.com>,
	<sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
References: <20260603194131.1468654-1-dmukhin@ford.com>
 <20260603194131.1468654-6-dmukhin@ford.com>
 <34ddb2d2-d3ec-4042-a57c-7095513c099c@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <34ddb2d2-d3ec-4042-a57c-7095513c099c@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|DS7PR12MB6072:EE_
X-MS-Office365-Filtering-Correlation-Id: 37e4e321-857a-43d9-65df-08dec26a7e32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jDuu1pebZKq4Af6PI2FB4p4c76L1o1hjbHO+DrQ1riCZ6cFPSsmVEh2cUx/Qb+zNfp6Hco4ki1oeA+xubOKtV4TXYnBmJbwmg+kI+BEytt+NrcrK6SjICZPinYU6NVdR0Hj5Tt10EGllXn1I5/THk9f1GzsYugLjMmGM6s2kEQWh6Dve3pw/LV7XD+KajhhbZLAWN3wT/3uKSCplRirTLzkeTeKGrv7wvY2BFh5sEdOdVCV4Cf36ejkucw5ixiSXNbMfJNUVc1CCY4V4sAXY8Q4ti+hV/RgTh7CJ5kqCJKJTPaAVZbdj+Fy7hNatjEj2D7ndpvM18k+iEB8cc9p5xgMfZ1pxGSmANBZ1Rxvul88JM6UvVezWLwq31zIWld+yPB2c3HtTlSmEuTrDOaKhW4figqLn8Umy5mxt6yESI220RFaaa9Ai87BPLKnLuSvBgAhNtWfwON9/oq5G4QptvuisiyCarLMA416B+z5vikXbOlOFKfW3MXnGv6Ja4SrQNdoL7hNBqpl3syzTmUGx3xRGYBSOtFvy2OPLTq+1ygS+FAEp3c4rGKbcoGdWoeCr25Yey9q2TD6RxGRQd0TYk+4YTENsGMU3ekXsoui4Ae14fI9qNm1Cj0ggwZ7GpS8JFO51/z0kisdyugQBzZolpVDCgNLQq/voahFHJu9hWxkW2XEPAGQkZLvTGkUCnr/HilkC3WnHtu5IWUiOSida8SrMR2JH04uBl6RXt3Tpb+c=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GTvfyUvy0eesfrUk5+RBC7oVQOOsqTORlTmwcP5JacOy72hOxXAwhfeE7+rmE+2WH8UjDbM0t1bRp6vnQYklFiryCiE/GGT/MiVINYNjTQq8ioP6cLl2KSH7wb/Ky8cEtAUKWPSUTrnh1v7OQrnsu63fAeP/ftH/zfPeoL35Qy7OQb1Qn7w9Xt07nXZLnzrE3CqI3dOX2EWIwm47DKjiZ5k6adq16BNPUEsz8nuqGyNUkfiM9t5myTMkDlNIDx8PUuz0jO94CIFljyPR4fbdI3M95GV0QIc44D0cb1ok3ooF6bhP6XowHucc4bf3bn4lAdalpiUqRWjm0WFGHOVOZaYHZh99YBj+RSpYgOuu9MA9wxvk4hh57OhtIWHDyRoaXhNQTBF0IBfOK2MGvYxfVMUECSh5e21YpuPNvYynr+h/Dgf040nyxV0oD7rHxGTJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 18:52:57.2118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e4e321-857a-43d9-65df-08dec26a7e32
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6072
X-purgate-ID: tlsNG-ebf023/1780599182-41F7D3FF-0392589E/0/0
X-purgate-type: clean
X-purgate-size: 1210
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:dmukhin@ford.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,ford.com:email,amd.com:mid,amd.com:dkim,amd.com:from_mime,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E02E4642B7F

On 2026-06-04 13:37, Jan Beulich wrote:
> On 03.06.2026 21:41, dmukhin@ford.com wrote:
>> Add Kconfig knob to enable traces for Argo debugging.
>>
>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>> ---
>> Changes since v4:
>> - fixed dependency on a new Kconfig knob on ARGO
>>
>> Changes since v3:
>> - dropped uneeded "If unsure, say N." from new Kconfig description
>> ---
>>   xen/common/Kconfig | 6 ++++++
>>   xen/common/argo.c  | 3 +--
>>   2 files changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
>> index 5ff71480eebe..7676a78dca71 100644
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -491,6 +491,12 @@ config ARGO
>>   
>>   	  If unsure, say N.
>>   
>> +config ARGO_DEBUG
>> +	bool "Argo: enable debug traces (UNSUPPORTED)" if ARGO
> 
> Why is the "if ARGO" still there? That's fully redundant with ...
> 
>> +	depends on ARGO
> 
> ... this. I said the v4 issue could be fixed while committing. Now you've
> posted another version (adding to overall mail volume) and an adjustment
> still needs doing.

With the if ARGO removed:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

-Jason

