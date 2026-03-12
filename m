Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OICEJybFsmmvPAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 14:52:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 166BD272F16
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 14:52:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252419.1549112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0gSg-0006cD-EY; Thu, 12 Mar 2026 13:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252419.1549112; Thu, 12 Mar 2026 13:52:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0gSg-0006Zc-Br; Thu, 12 Mar 2026 13:52:26 +0000
Received: by outflank-mailman (input) for mailman id 1252419;
 Thu, 12 Mar 2026 13:52:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=17Qz=BM=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1w0gSf-0006ZF-FA
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 13:52:25 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae098a05-1e1a-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Mar 2026 14:52:17 +0100 (CET)
Received: from BYAPR11CA0065.namprd11.prod.outlook.com (2603:10b6:a03:80::42)
 by CH3PR12MB7642.namprd12.prod.outlook.com (2603:10b6:610:14a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Thu, 12 Mar
 2026 13:52:08 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:80:cafe::ef) by BYAPR11CA0065.outlook.office365.com
 (2603:10b6:a03:80::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Thu,
 12 Mar 2026 13:52:08 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 13:52:08 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Mar
 2026 08:46:59 -0500
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
X-Inumbo-ID: ae098a05-1e1a-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P8Bt0CGDWKMjjaSrupmh8BYS+xeRs4IVAPQSsRsgWCYbknwUrUlmIgl4nWbguG+srs9gs0SFjPlt61bDoRLtcVlEOj7Z740j67qTYuaX+aHJQzjfngAHy3myXyEK0tNjJtCBmaOHKuW6dAb3WaB6yOWej2EWsVFYzUagVACYjc3Hnk6q4sQLpflhPIS/UZMMEYFd/qTEzqf/AKJCu5Ry32gn+V1cHbJrcP0O++9/36SVpIhSw8Eag4xDUQPm8IseYKaoCkszhpr/UUcwUVLtlwvSqxY9cClRIevhAIyk/l/AsfHFvi1xqudNIjmjeo6YJj+Wev15cfeWQ8bI9EZe9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5c78gyJyjJPVki7MSV5aMA7te6tXb/lJRa6LnCuKiyg=;
 b=ZAKtSVXcQtKHPlppMSSoWsgmSAo55w+0swVQN3tpAm54fNbdBwdIb9eNpcTmwpQh13v0SjTwWwFp808Q/F9Nxq03NGxjG+y4egK0il4LqATR2yD61e6dQUfi2nmq0t4f/QEveXoJ9dyDWf8MnEMQy32NNq8MRSBRdnfEMaZtFBo4YdvGM/k0JlKNXN+WaUZo+Mr73B+WH5Srk2+llIe3ddMGPz0qB5A9rNeI+G4AcDuLpsusIHXwGRqGnJsgHSP+uUy5dHpTxrQqYbM+HuKkBdV98/3LdjXRC8mIu4sAMPDx87Xiop3tDVZO919lINo/n6j2dLLR7ofN4UN35Y5WwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5c78gyJyjJPVki7MSV5aMA7te6tXb/lJRa6LnCuKiyg=;
 b=aQal+vDRoSK3uXyoeiJAGW2ZgSigzR2Gbkw5y9TR2af8dlGSoDxLtlZ1fM50QChCjvkJNpY2Cne3gJaB1cjoeUfM9Ro3EqHdrjyTT3mRN7Klhq9BuQkj6ojNTSsGC3C8YWEszLoqMT6Kw6dUNApstra04drdm0UmA300RrwcvYQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 Mar 2026 14:46:59 +0100
Message-ID: <DH0UM8GB3R1O.3N6FZA0BKY3E1@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jason
 Andryuk" <jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 0/5] x86: Drop cross-vendor support
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
X-Mailer: aerc 0.20.1
References: <20260312112116.22563-1-alejandro.garciavallejo@amd.com>
 <18fbb44c-92b8-4298-9931-6db1c252b043@suse.com>
In-Reply-To: <18fbb44c-92b8-4298-9931-6db1c252b043@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|CH3PR12MB7642:EE_
X-MS-Office365-Filtering-Correlation-Id: 12a6ae4c-bc3b-4a41-ce4c-08de803e8da5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xOqoKFC8yWJ5vITbKf/UEYleWk8f95aXomPfOMwnSpcxY7RV+z156J0L0dmBqRnJPP2PDA2HlrspzV83TT6qS0M/oFNOchCIHbIhuPE7HdZRNl1GoeND9FmnQhOqaAyk8SBN6drUSHFvxMxrz6AYQxUBW3XHgNpBxEZSeWA5RPTHirntV7or6sd54EhBS9AzbQ08inOqKp+5CMBGsWmkGFmQ3VrQW4X03aSgRYjf8/SJcNd568SpZBBCs9SRU4wI4eL1hA8y/kOchfmaPnbbkiSzgVkkVTmqV5lCYtnjvUZwF+Xs09zfbvr/JR8ax3tSQyV6rcNbZhv6VwSiAvXOR3kxl+07zG2URfUcvNSEP94R8L9Wyn0GpzSQRD7VkwQUFYq6OooYDHZEXNOuhEWaeX2T1aSum0wS+a2SNnn73FFbzD1D+tMEOf4us1qghxCzF85T6jg+GgwoggByv8q2lV5eq0c/TNSh97M1AT3jJTtP36wjyaS1eEkP7nx0LYcMNFqIQbAS8t7N7a9qZ7w+FctwKIxoppS+iPdNxwpv++uaxcGsrPtN3Ucm6Emvk+ZFDib2w3Sklp8J1nOko+NR1IwF/qsEx4oQdYeiZwztpH+9aXYm8zX8TiWJAApXlh0FKS3PfthUjNiooyiXiOwoJWraX/qlNJzbCUcJ5LTNWgt1zDic8THD7BEOL+uwmLp3VuH1l7LMf+f3PPa6YPaNdhLTaWQSkX/DI1c579wxVl6Sj0ix01wrtlabTZVEK0OG1vetzhOm5cVujw4RQfZ68Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0uwAtiBxFBSX2a7xcxIHtsEfHsK5FfN42uPut5HcxsbIgd4DnV4zE7zIre7Xq+cyA5oEIqwnkbji42st1cu4vuVTPvWvPs8XmFgAn98jGXk9Rbl8JK+Kq4q1qs+yCcDKwKtr3Q2m5xTTfxjROKFV4bSPUvMWpJiFmOjEChejg1IZDvgkSFnFFO4+ekGnBajfJmoKUMiaFqvTCNvn+EiFFo0T4wqJlNhTISFNUX+ZszDJ82N+mF3XYnd5YXclmCuiUHgoslwu5BK952mZx1k5T0SOr00WduJQXmO+2hAuuihvj097z1/A6ho3vgB4RvXLHI37kCilW1Dh4IxiA7qS4DAh3u5ibFePGTIv3wDwHorvpSdDWl+plCly4MBoEWpP4A5L6XH/wx+zKL5iqajHujsXSrp0HuD40rvqbI6EHbOUtOxW9Xt1HWtOtCM18qFT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 13:52:08.4570
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a6ae4c-bc3b-4a41-ce4c-08de803e8da5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7642
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,xenproject.org,citrix.com,vates.tech,amd.com,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 166BD272F16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu Mar 12, 2026 at 12:35 PM CET, Jan Beulich wrote:
> On 12.03.2026 12:21, Alejandro Vallejo wrote:
>> Patches 2, 4 and 5 missing acks.
>
> What's missing for patch 4?
>
> Jan

Ah, nothing. Just off by one patch. That's meant to be 2, 5 and 6.
There's a sixth patch missing.

Incoming...

Cheers,
Alejandro

