Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDT8EPZ6e2kQFAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 16:21:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E58B1658
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 16:21:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216709.1526649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlTou-0007Xy-8b; Thu, 29 Jan 2026 15:20:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216709.1526649; Thu, 29 Jan 2026 15:20:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlTou-0007Vy-5u; Thu, 29 Jan 2026 15:20:32 +0000
Received: by outflank-mailman (input) for mailman id 1216709;
 Thu, 29 Jan 2026 15:20:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UMcd=AC=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vlTot-0007Vs-Bg
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 15:20:31 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ad1d34b-fd26-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 16:20:28 +0100 (CET)
Received: from SJ2PR07CA0007.namprd07.prod.outlook.com (2603:10b6:a03:505::12)
 by BL1PR12MB5924.namprd12.prod.outlook.com (2603:10b6:208:39b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 15:20:21 +0000
Received: from SJ5PEPF000001F1.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::87) by SJ2PR07CA0007.outlook.office365.com
 (2603:10b6:a03:505::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.11 via Frontend Transport; Thu,
 29 Jan 2026 15:20:18 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001F1.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 15:20:20 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 29 Jan
 2026 09:20:20 -0600
Received: from [172.23.55.58] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 29 Jan 2026 09:20:19 -0600
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
X-Inumbo-ID: 0ad1d34b-fd26-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t4iPywzyyozOTBTdmgsu4CCVOLI9o2NGezJX28rqCfJMT608Wt/5ve+4FSReVcGPHsfeqc16uadkwwL7P8abMiPxYtOcbkkrwl8v6G0UcM/RcqlPVI2T/k3uGsfcUoEhNgp5Buq3d+sL8fsrFGQi1jcFy3iHX+UFEa/HeV121h7kBgfzH3VXBFPSpTMhC1K88baSiLepa/SBtma24BbvglUL+J8YfZv6slskqsekTItWG8s1m1ELr835O2z6/j3P1SvJDFOOMj2hpvpySNA6pqj+Gw4H555K6+5VoDXPgyuaPt2LsKv1SKtlEVJNGZ7boNiiG3NqWnAHveMHcpC26w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4wVsQMcWky+6nPVQj5ljwRn38RHzT86zi9CQAuM6Ns=;
 b=hGmxXne0rUrfKWob6Xc91ZG3V+IyNQaiUE7UBtZgw8p4Of+h1dgZ3X0ogCzX7HWu37I2vyWC3u3flTrNR9U7wsvb0wgcqeEkOFqImHOeHoCQFOWgU9S3mtyWmSt/ktXW1HMIq8A0Tum9wDLVlDeLZ8a0sEYVxnSMPRqW4kfCZCHZUYxGnfp5HBgn8A7qm5lBNr61BipqiqrhD5wSDMQWPT0wflkoUkEagHkHontG9RW9o18P9gLbJ3u/N1lc/WYZkY5jkFTjmAsjs6ExjyYogNSZEWI1AuL0DGJXBIwuHvDFaPk4uWLYCPhoGjUPxjPXrhjbjORjoILaUeOj52LApA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4wVsQMcWky+6nPVQj5ljwRn38RHzT86zi9CQAuM6Ns=;
 b=niBgLjrtm3NRa9A05DWm9wvLlj7sSJ81KL2dUiRwrDnTMERyCONYxWdE1Gn0hillqeGcVwG2Zj/2s3pp/qU8iTJceFzOBywfv45oB4emWSyQg8+e3NzIK7DcUqXfM7PGv114oyOxE5JOb9wdpFnMAHqyi+6CswY0ISO3mHlIs50=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <5cef7401-7b48-4ecd-9bb6-d92950678a08@amd.com>
Date: Thu, 29 Jan 2026 10:20:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: allow ->write_msr() to distinguish origins of
 writes
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <7987f1fc-5b5e-40c6-866e-ac332097c635@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <7987f1fc-5b5e-40c6-866e-ac332097c635@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F1:EE_|BL1PR12MB5924:EE_
X-MS-Office365-Filtering-Correlation-Id: 734ab816-1504-4b0e-748b-08de5f49eab9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VlJray9YVlBRSVEzUDhJUjFDRlBDS0lNS1YyWmp0V0FnbENxMDNxUHlnWG10?=
 =?utf-8?B?QVhNcE90VGg1V2NqdjNHK3pPeXdlZ01uYTFoNWJzWlh6YlE5TVdNYXBvSnVI?=
 =?utf-8?B?NWxRcHlOaXgyaHRNT21ZZWxxanFCSkdsQzNuK1R1Q04ySFpQN0RHcWczN0lt?=
 =?utf-8?B?QjFpN21uaVN5RUpPc085RkQvK0g2SDh2cm5tQ3YyUHF4U2pyc0JpTTNqbHZE?=
 =?utf-8?B?aUdRMTZqOHg5R1Zvbk5QTTRDVFBoQis1dzF0NW9LUW1TTjNFMjZEVE1IbHYv?=
 =?utf-8?B?QmREVXdBeW43QmxhOUhaNk1NeFV4QmJkWi9GWG52RjNKTHRpSUxacDFhbVdN?=
 =?utf-8?B?S2E1NVpOeWtKRTB4RWRvbTZBcThjZzhQazZQczA0R2kzUUllUC9yRHZ2cjR0?=
 =?utf-8?B?eHVBVVl6NnhyRHllM0hmbVRhTWJ0Um9WV1pBMC85Z2o0NjRoSEtBWERVWTMr?=
 =?utf-8?B?YXdMbGNENy9ZTkhEWmh0VHhidDR2VlM1a1JpMFNaa3lSRXltbkRBSEdMcDBh?=
 =?utf-8?B?bVZsNzlmc3F1TXZyYUxTQUxXT2ZkOXVOOVhrZ1pDZUdTM2F2Y2tWcVBTdW50?=
 =?utf-8?B?WEZoRWZWcWZQTEtmZEtKeEFrcTZWNDNjUlY4VXBVYzdXc1dEYWI3czFTektT?=
 =?utf-8?B?VDdFS1lsN2k3V0x3TklpbE9JLzQ2SmIxL0hjaFo0aUc4Z083bnhpbVpITi90?=
 =?utf-8?B?TVVSQ2lOOVE2UExUSFBxeXRaaG1lRWpXQVZ2eTJrYkdFRHRuL2dyQlRyTjVl?=
 =?utf-8?B?N011TEVlSW4xUWYrUGFTd3J5WmlyRGdTNW5OSm9xTkFQcVA3RmxYQ2F5OUEw?=
 =?utf-8?B?L0dyelVJRS9CNTNOV3IrcDMvQ01NeTMzcGtTSU5DTmNySVMxanZDbFlLMXFs?=
 =?utf-8?B?dUllaUlFckdlK2R4WGhYdHVXMGJwS3FHajZ5UDBjWWpULzE1R3VnblNXeE5r?=
 =?utf-8?B?STlyN2MvODJGaDBPRGxhY2VoYm94dmQvdjc4RjhuYkFDOXJDeFJpN25kSmFV?=
 =?utf-8?B?T0ZDYkJmaDQ2Z3RJSnZsYndYSE0waFNIejl6aDFGSmwwLzc3bVMzcVNseUY3?=
 =?utf-8?B?QW1WVTJVcVVzWVZXTHhQYkxuSDdxTUFwNVhTTms3eWVmMHVMOWdVNFdlbjJr?=
 =?utf-8?B?S2RBNXJnYXF1Uk9IdjhrczJaTC80bm5xdHJTMWFXVjdyaEw2ZnA5ZUV5ZUhj?=
 =?utf-8?B?ZVdvUHdRck1PcDBUVUplakFKSTFXTVAyZDFONnBGZnpHR0NwdjhhSVQxVTVt?=
 =?utf-8?B?RXo4RnBranM3bHF0MjRYV2gwT0loZlBGU016SjVHMzkyNlpoaUt2cS9GVXdE?=
 =?utf-8?B?YjdaNFk4QkFqRUgzSEJOVzZvc1orOE50UUdRUTYzTkpCczlmaUF2bXgwUzlY?=
 =?utf-8?B?VGFRd0dWdi9Ndnk3TXVZUXBBbXoxeGtXYmlyL3MyZmdjZ01tczVDTk84TWhO?=
 =?utf-8?B?R1lhZlFBTXJNaG1kdERMTnV0YUVGT1pscklzN3N4YzJVMEJ4dSszNyt3Z0Vz?=
 =?utf-8?B?QkZBNGNteFZxMUh4SWw1VkcwcU5QUWEyTnlRaWZJdVAwNW9WdnpTRTR1aURv?=
 =?utf-8?B?SnpNLzl6WWdkOWYydGVxMkU5RXJBRFRjRWFrZmMyR3FKRy9BQnM1Y1Fmdmhv?=
 =?utf-8?B?b0FhdDZVZVdXREduYS90cGhlWmxuc25NM2NQT3ZDcXdkSkovMXplVm5FK3N5?=
 =?utf-8?B?L0JLd2hYSXVlT1MrdmxJY01kMnVhRTRhSG9IWDhnMkJqa2lNZElkdFZtR3JL?=
 =?utf-8?B?UDF0OGdLTlpmZHNKcTBKQnYxZ25PbWljRG5PajFBeDE0NllyOHNCbUlzeVMx?=
 =?utf-8?B?cHNNNTlIMlVTYjNFaU8rbFJuNG9IT1ZIYWFLeTlVOXJvR3lYK201Rm5maEFP?=
 =?utf-8?B?WjRjeE5KUzFueDFId1ZiRC9kR3lsY1ByTnhsdlljNnpXc0VFK1pVZ1Z5MEhD?=
 =?utf-8?B?K0FYODBJN0EwSVNMbmFiSTIrMC9DdmdIdlpPODFVT0RHamVMQzA5cXMzSmM1?=
 =?utf-8?B?L0dhOEFXbVg3TDIxSGFjWStiWjB3RUJhZnFQV0V6Ri9SRVFyMFprQXlDVEhK?=
 =?utf-8?B?V0RrVGlNZ3JTR3hzMUhURjJhVFZHVU5wY3dJUVpyWUZWb3luRXBra28zN0xE?=
 =?utf-8?B?aUVyZDNFYnl3RkQ1eVp1Q2dsbXpWWEg0V1p2eUlKNUFUa21lM0ZwSHZOSkY4?=
 =?utf-8?B?Z0lteUE4Vk8wa2lVbFJqR2pvMzJ0UW1HQmlPeVJOTi9sMXpYZzBReXJwd3dr?=
 =?utf-8?B?aEhGSHh4Skczb2kwTk5hTndzYUtRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 15:20:20.7123
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 734ab816-1504-4b0e-748b-08de5f49eab9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5924
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,amd.com:email,amd.com:dkim,amd.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: A1E58B1658
X-Rspamd-Action: no action

On 2026-01-27 05:21, Jan Beulich wrote:
> Only explicit writes are subject to e.g. the checking of the MSR intercept
> bitmap, which extends to VM-event's hvm_monitor_msr(). Indicate, by way of
> a new boolean parameter, to the hook functions which variant it is.
> 
> Fixes: 6eb43fcf8a0b ("x86emul: support SWAPGS")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

