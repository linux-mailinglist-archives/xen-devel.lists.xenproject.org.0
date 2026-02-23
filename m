Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCvdHqQVnGkq/gMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 09:53:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D435C173526
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 09:53:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1238509.1540116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuRhI-0000xu-4O; Mon, 23 Feb 2026 08:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1238509.1540116; Mon, 23 Feb 2026 08:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuRhI-0000v7-0z; Mon, 23 Feb 2026 08:53:44 +0000
Received: by outflank-mailman (input) for mailman id 1238509;
 Mon, 23 Feb 2026 08:53:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r2fJ=A3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vuRhG-0000v1-CG
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 08:53:42 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d3cca1e-1095-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 09:53:26 +0100 (CET)
Received: from CH5PR03CA0011.namprd03.prod.outlook.com (2603:10b6:610:1f1::23)
 by DS0PR12MB8479.namprd12.prod.outlook.com (2603:10b6:8:155::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 08:53:20 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::52) by CH5PR03CA0011.outlook.office365.com
 (2603:10b6:610:1f1::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 08:53:16 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 08:53:19 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Feb
 2026 02:53:18 -0600
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 23 Feb 2026 02:53:17 -0600
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
X-Inumbo-ID: 1d3cca1e-1095-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xM4rAWjyzg/hYiWhpqQawn6uElunWJGWWM8X1b3pVM74lmIxqe4hLIFbIbL6mn+5AuWP/EZcpzmDocRlQ7DHx3fkGp7ZCbWEMFQuaTDLAEJtnL3algf+HKuoof/T0HJClBkH9hstSSt8XBGOPzv/3heV2BfRMVQXVlDCczaN5Oo+WmMwCJHXIxxbkhYDW9gmumpe1EgZa+ZvyZw6UO+JqThzjtxXrmpQBCuGrnb13c7Z1oOMM52RbdBBi8fz0u5QP9+WwxnXXMEbM2sAYVni9ciyeKgd6oSlvYFKL8MQsqhpZotiHQqRC1F+yyiUy7dKw40zpbdrGd0UkUT0cmDawg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWedpK6BFANGgNTE3ogKCtlwM+2RdWk/+oJ5O2aiYEY=;
 b=vxhww8E3PpQuIXsOQA4qFGRFIsuZbt6nvEmVS6hbOjslAp2ukq8f72+tpMfFRVx3iih++BLG4jLk5QxsKndFRBDJ9e1rymLr70pEPrn9QIHY1UjUZdfVyCSHbfftXuGyFZEPhAIyjf6IPnkGO1VN7VCztS8WbQQq54Vlf6In1Q95BCG3DWTM6CLFwnr67Y10ACGzanazHi0PqMMsiv7lDXzUmfHg+HYZIdqTM2IGAB6sIXgnt3aa2dUAdqmaKN/XygVsz2N4cqJHBseu3jOLWf8rnXN/QUbSlt3ujUcyCve2zgX5qqHH84z/Vg5XVwxn04kN0oRGauSKPcB6Y6QwwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dWedpK6BFANGgNTE3ogKCtlwM+2RdWk/+oJ5O2aiYEY=;
 b=n844x5b4aiSeooPd0GkDWZ27FHhxSewm8SR34kqpf4eiAwcpvhqOHx1AYlwSK0rmvM2Kun78wedY/A1+PxfhtypOmCoT8Nmi4b2EHHLcNj2W4BDRjOMNR+j6nXnuik6uaaj36LA0uyg0GZGuJrNHdYOgDqC9Le+njonQCrNm6Ug=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <1c2f4d04-234d-4422-8abd-eb189aadcbcc@amd.com>
Date: Mon, 23 Feb 2026 09:53:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Arm: tighten translate_get_page()
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1d898900-1072-4ea6-ac4c-1262905cab29@suse.com>
 <abd54c11-28fc-4487-a2f8-733007d361ae@amd.com>
 <9163d0b9-f77e-4c13-b986-2d890bdf8ccd@suse.com>
 <526d338e-8648-4f90-8006-35c639bfa6bd@amd.com>
 <8e5e351d-47fe-4a68-a611-df72e3c5f246@xen.org>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <8e5e351d-47fe-4a68-a611-df72e3c5f246@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|DS0PR12MB8479:EE_
X-MS-Office365-Filtering-Correlation-Id: d6eb8702-f4b3-4868-3051-08de72b8fdfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bEYvVEYvVThZRFVCK2VUdTErQUdvU1dyak9qWUxWYUpES3JsbjhEK2NjNWpi?=
 =?utf-8?B?TGh1dUNydkc4eHFHbUFVaTJxOHRqSEVFeXJkNzUzWkRiejREdFh2Z1hHVmVa?=
 =?utf-8?B?dWFmTGwxejlQNnhlcEdrbmdCczIrNnpWaW15ajJIY0RrLzlFZFRUWWFrWG5I?=
 =?utf-8?B?SXRPd1YvMG1CVUswYlA2OHJZZDFXckoxRWcrSWh1U3hETklBckI4d05rWHUv?=
 =?utf-8?B?V1o4bHdmVFJBUFVTRkpCUEVwMnhieGhxNURiRXNjY2R0T3p3YkFyd2xmYkJ4?=
 =?utf-8?B?T1J5VjdVazYzYllBbTA5THo1allLc1B1SUZMZGVFR0RQOXZCWnB1NVYvVFFn?=
 =?utf-8?B?a3dRWmt0c1pLdDBheWMrZlNKQ2MzUGJJV0JGTy9hRVc1bEJJRXBBOVhIclpa?=
 =?utf-8?B?SERrU0VEemNJWE5sT1V0SXBxL3cxOXJEQVpmYWRlZGQvVlBySllSQXZSRTkw?=
 =?utf-8?B?bjFRSjJ2N0JwN3IvWHZQa2RXRTJWVXhIOCt4ZExXQVptZlYvTm5jMGZITWEv?=
 =?utf-8?B?VCt5a0h4YVIvRkRwdkV1Q1I3STIwU3BYRjJzVkRzb0xublFOL2ZPNXNmSnV6?=
 =?utf-8?B?bzNkaTFiZjlJdXl5NWRSUHlGVy81ZTZUL091WWx4bkMwRmsrNjN6YlhuRTFB?=
 =?utf-8?B?WW9ZZTNKT3cxUnE3ZHNOTGVueCsreGJ4Y01zWExxOHlybDA3L0dNSjIyMFJo?=
 =?utf-8?B?SXV0ZVdSZnQ4S3lZVGc3K0wwM0xBNmFjVzlvaXZvQ2QrQ0hIcWpLR09yNWJB?=
 =?utf-8?B?N0F5anU1VldadysrcUVzVyt6TU03YndBY3MzWGQ0eVBiQm9jK0xaekgyZk41?=
 =?utf-8?B?TXk0MWZxK01oNDRxQnVRZWVjUkJiZVpIaTdOSW0vSHMvc1BPYW90ZXFkSTlr?=
 =?utf-8?B?azltVUNoK1lkcytYU0hJNFhGZGIvNzVTTzZyK3BDN21HRlZXTFZjWVNNaGV1?=
 =?utf-8?B?TGFScTVMbGs2VVF0d0ZGdzNnQUZNNEhWZUJORWpRbGdlNStyeW5wTDRqYm1G?=
 =?utf-8?B?NllVM1dyblBLN3hYTmloaklENE1CbHdhMXVnLzhOUHpPUGRqSis3L1BsOE8x?=
 =?utf-8?B?K0t4RFZwSGdkSWV4VTRoVXlOQWZrRUcxc2VuazhmdnBUN2ZSSHpsQTkrQ1VK?=
 =?utf-8?B?ZGt3NzVtZzV0U3Jyd2M5dU5xdkNvMjN4TE9MM0FkQStUSmJmZitaQTZxaG5Q?=
 =?utf-8?B?QmswSXYxN2F2SE5lVThzeStUY05pOEt6cmlZbGpldkRlc1Q0bGtES2k5aGpD?=
 =?utf-8?B?QkxXdTlmT2lsbGF2K3l6Y3BnSnFJbmd1MUFvRnQ3Qk5HL29VZ05qSzB6YlJj?=
 =?utf-8?B?ZWxucG50NmxtaDFpcHhRVWdscXdBMXZPRnFadVQyMHlWQ1RxSTlVMXhMcWQz?=
 =?utf-8?B?OGp2UFFFVCs0aHUvV1ZBUGplVkIvQ1NyZythSXJIeVZkUXdkdGJSTnF6Z3F5?=
 =?utf-8?B?dVovSm1lWUdXSE03Ny8vS05FUVhKeFh3TWR4NEJPQVkwR2ZKbHJqeDBKWUFX?=
 =?utf-8?B?eFNCTC9tdG0vb2ZLanJsdjk2VXpUWGRZMDkxWWJVMjlRQjRySFcvWFZicW53?=
 =?utf-8?B?UjFtUXRnQjcxTGxIMUNqdFphUmRxRGJRU0o0TGFsSmh1azVUdWFiWHlxdTl5?=
 =?utf-8?B?RzFGOEZzVE4xaTFRd0JGc3lMZXdGd1oxTStuUUYyYjBZNEdjSXIwSnVXdFU1?=
 =?utf-8?B?UDB6TzFCU3JZNXRSRTVTS2xBeitsbUtOODNEVFlmNjVEQWNZUWI2Z0xBdDRC?=
 =?utf-8?B?YkQ3UGxnODd4L0hpd2tQVk1aK2ErdFdLOW0xcDVjVHRDRmxPcnZuVE51aVV5?=
 =?utf-8?B?S1F0SjBCNVQ0K1I5NjNSWk9Ic05aUGpNcnR4U1IveG02RW1rK0dZUnU1R1FQ?=
 =?utf-8?B?QU04VnYrZmhEZjU2QS9UV0JzUFJuVkxoMi9JY09EbUhjLytTWTZJTjAwbWJy?=
 =?utf-8?B?UnpSTVFWRm8rWnJEcWppL0J0Q1ljTFY3SWxUdUJlWFBKMXROV1BYNHJMV1FE?=
 =?utf-8?B?MURmN1piWHBUMklSaGpsYXI2V1VpeUV1TGZPRWlwMmdYOG4vS0JHUHhLcWlo?=
 =?utf-8?B?VWlXRFR2aU1RZ2paVDBVWnRwTm9MRjlqV0Jrd3UwMExEOGhzWkZrZm5YL3dB?=
 =?utf-8?B?WUUrSGJZWkZycXlFMTVDUmUvNHpMbVJHU3cxRUFLSG5CNFVzRHZmb0l2VFlm?=
 =?utf-8?B?cTB1WlQ0dThVS2VwWFUrQXBWSzJqQU5ZR05aQ05vOTg2VUNTUC9hMm9EZG9q?=
 =?utf-8?B?TlVPL2NNSXJ1ZTU1N2hyR2IzaG1nPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	u4yW92uGRxGfXggWZGdgTh+idM4A/9VFcJbUiDW87dLwazsDaDO5s+Hpg51f0YURQYu+ifPX9XsGN9QOkQX87dliAECXJi9PP7guI/292V3tqnFf4sU/ip80Yj1aJPKFcYhUiknnlvV+Li4MN2D1DgTD/5SDQ7coAKY3sToryLIgr/D39jce2/ivXK/GDDZK5qu5a6lwwNC647+EHdzszOsUZH05pKGmy+Hpmt3/b3P6AAFuTgGG4g229WY72KxBuNTup1oRkF7zFEzIiIKZJ5ytsqcm9MrSORAVjM5ulkj6ZoPnkG+tlCgPTb13D1zCFcH0aZPN6brDSUhwTNQtC+ioLjeG7jxdEZRPEYUWfOi8p7sWePaS59KJzUHELLAeEWlyBsGZ/BLt/fGTigVoRW9R9+iFCHs9KtzNVMsjSOUB3U/DxZan0BrRDFDYiRg2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 08:53:19.3232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6eb8702-f4b3-4868-3051-08de72b8fdfa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8479
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,epam.com,arm.com,gmail.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:jbeulich@suse.com,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: D435C173526
X-Rspamd-Action: no action

Hi Julien,

On 21/02/2026 12:26, Julien Grall wrote:
> Hi Michal,
> 
> On 18/02/2026 08:36, Orzel, Michal wrote:
>>> But that's not correct for cases where share_xen_page_with_privileged_guest()
>>> is passed SHARE_ro. XENMAPSPACE_gmfn_foreign requests have to result in r/o
>>> mappings in that case.
>> Yes. Therefore, on Arm:
>> - p2m_ram_ro is never stored in P2M tables for normal domains
> 
> p2m_set_permission() is able to deal with p2m_ram_ro. So this could in 
> theory happen.
Only in theory. As of today, this is the unreachable code. In fact I checked our
coverage reports for safety and indeed it shows up as an unreachable code. There
is no path in Xen that can lead to that point.

> 
>> - it's only used by get_page_from_gfn() for DOMID_XEN pages
>> - it's used as a signal to install p2m_map_foreign_ro mappings
>>
>> The code should stay as is then and we could modify the comment to say:
>  > /* Read-only RAM; only used for DOMID_XEN */
> 
> With what I wrote above, I don't think we should add such comment.
I think the goal here is to make the comment reflect the current situation (and
as of now it's only used for DOMID_XEN). Taking what I wrote above, do you still
think we should not update it? Once we have a use for RO for normal domains, we
could then update the comment to reflect a new reality.

~Michal


