Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCvzKDd8sWmACAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 15:29:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F01265624
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 15:29:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251212.1548452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0KYV-0002Dl-7e; Wed, 11 Mar 2026 14:28:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251212.1548452; Wed, 11 Mar 2026 14:28:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0KYV-0002BP-4z; Wed, 11 Mar 2026 14:28:59 +0000
Received: by outflank-mailman (input) for mailman id 1251212;
 Wed, 11 Mar 2026 14:28:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qrm0=BL=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1w0KYU-0002BH-Ad
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 14:28:58 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2930dc0-1d56-11f1-b164-2bf370ae4941;
 Wed, 11 Mar 2026 15:28:56 +0100 (CET)
Received: from SA9PR13CA0173.namprd13.prod.outlook.com (2603:10b6:806:28::28)
 by MN0PR12MB6053.namprd12.prod.outlook.com (2603:10b6:208:3cf::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 14:28:50 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:28:cafe::58) by SA9PR13CA0173.outlook.office365.com
 (2603:10b6:806:28::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.22 via Frontend Transport; Wed,
 11 Mar 2026 14:28:48 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 14:28:48 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 11 Mar
 2026 09:28:47 -0500
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 11 Mar 2026 09:28:46 -0500
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
X-Inumbo-ID: a2930dc0-1d56-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l8qgotWeY4JcGfaWTWkqNpf0tPh9GWygkuU0Y5fp4jcItiNM0lhISiDydHrMpQHmj/3MKDcioH+AIN7VHwcXtr1AU/Jm2rBGpBnY6LOOeL7mFk5DgcZd9VolB8zSfXn6w8Y1on0v2H/IdmEP3kmwnEdNRgyo31/A0CXEXdvhTtFbW3+UuT5UTcDsIpy4DqD+msuzYc47Wtoybx3PJhvllD6+BA/HcXxZMdIGW6H9ypjNoaCJwj+U3STxxQYZdswLxdv7/SjSaDiJt8LpouSfacZmPboygBmNvW5cxlP1Lz26Gb3rCdhlN0wWFA3xkUJHIpAu/bq8vGmsi+21MvAF5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2r0/8ej73WI0PEnvNExoigrPoI3S4hHyeVt31lA25I=;
 b=E10sITTDsFYcRe1UWhcyZTcNxVi3I5JFBi0yVGRoCZX1rw6DY+T+QHMMxZYW9zqIWUUB1gB7oJG4I6w2l97Inv8BUgZ5OONY3ucl6xUO+9EWvJarNtTNLCsrD39+ZEf36G01vPh2Cz3LbXQ+KqYNg8sqpxQtIv0niRK1tyT3BPdbcy0MULz/racnZ3CiK0AKi9RxA7L5jiFDEbCEhYdaARC/e/RWWER4SBvZRkDx8GOHVQG81+Oxjhko71qoGaVMrTqfcu3gYgVFIzBCh5HYNqBejLPnQvqHdIJohrXYm+EADUVwLq432zPlniL5xNh0PrDJiA4BDiPxggLgdJfdmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2r0/8ej73WI0PEnvNExoigrPoI3S4hHyeVt31lA25I=;
 b=5hb1Gdps4PCLXD6kh0GFcm8oTxiECEUcOkP9U9vgQU4gQ1fYN/q2ooHDBC5gnuOlz3MxMUArmE5pvNe0z7MEoGygpkGSr6nvpfIjfiFwJGmZmBcEPIA87EoTjQXC5cYbDDOJDDpoU3jiOYSKLpqC8zscYJEDjqrOIn4O5fLVEiU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <db36c55b-d9a1-448d-bc53-64a9d5254bc8@amd.com>
Date: Wed, 11 Mar 2026 15:28:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: fix unmapped access trapping on GICv2 hardware
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20260205190128.38716-1-stewart.hildebrand@amd.com>
 <f91e0f7e-9afe-40bd-8e44-4aadbdf8e4b0@amd.com>
 <1e8f9976-b0b6-47b1-88c0-690d4f1589ce@amd.com>
 <8ccde8eb-d8a4-411c-bd6e-9c3fcea1150f@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <8ccde8eb-d8a4-411c-bd6e-9c3fcea1150f@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|MN0PR12MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: 59e88267-9d35-4736-1cdb-08de7f7a8262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gzOod23MWwk/NllvNAIr5qa+/Wv6smM5H299p0Zql1OhCcQ5MhcWwj2tQxDQp2ump7TYFw2+PpHOFvnSL88uRceq6agKgFNu+LIvns1CCyYmZJJ3Nd5h7ftC2LXP49ERo8xw0Ak3x3OJVu3ke7vTXRZyxplalYpCSOvW0emeSomiNRxllaVPy1vbYCDuIC3E2f+y7x6FO94D04WnKVhk/nYlmf2KnWrkunEc6k5+nSej6OwMw7xsVuOxxZhTyL4xn+P7NSnl0nCGJ91KnDT6XtxntCoJbyagisLj7g8lFIKwCtdTxBH7dwWb5/MNkz9/g+eWaOXbNmTyAUhAe0woqcFV/mEPWqUvO21GG0s69lkmF1QD0OGMIAzgMX/fXxspGodls38rx6ZRqpo4UVbgJvVDNkVdCDdMgQgMI0PIplBUAuhx0SgRAlW5us7WQ1BlP38BgWHo1wofCK+2uqiS3veEbjvPdz4kjXoZlhgb3I1gqRYlDfkmMANaHeIJwPs8lj1GA1w4rNvp0RJ9dEiuq0GQAkMg9/X9VLcl/eztCjA5x0x317WxTRPVl9+C15OH9rvYBKoA2pUOimvBFj4tI0c8nHvAVf0D1Jg41p1nC+2Dc88gQgX057+HWvvQpritoqQaOQMBbUn8e9/RJjqqDJqA37JFAWyNgCRpKSycxpgak/Wg4PavP9BxUuWP+y5Gli7VEDyD3WxwoPIfbT14vs0/A53sxh2NngDpUSglwpI1lGpihp6gFGZthbUy49oxOwCTpZWXw16PrYg2/9uUPg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QkvT2UDnJ+Sh3D9iCfOKp+St4uGW6ExeFNcdokG6+hOCiQN8TNo3+SEkWQ5M0H0A2tzG4mhCwMF+rqvyULlPHju0KNEyTOXUInFfLpn0FPu+IgbeDDlo986VfQEq8FpNKqScCB/+HEQfjWoXwyfoyIOm/yJx5beJ8SX0mFrpoYkACpw7fHhSYw5lTl1W8Jgl5NajTumskydnbvIgcdK27pVMD4OZc20izv4+zyVkz++7eHgeIkUuVWEYsCcLJaMozWfDtn/CqA88PAv9RKQRlLpxybkC4/41gowKFqHK5LMn7kLJluE5nYvmORDOjyJOVnqTDepSSd7Lfr1zefKzM6R86MfPBSuahGzrKOJeNpFsS2CFcDIsO3UT/jH9eM7WGajjHFZkloxHzU2K0yCXZAqctPROfdOlw1Ok3NPImQreozZY4cTMNwYdqRCZjnHV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 14:28:48.3079
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59e88267-9d35-4736-1cdb-08de7f7a8262
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6053
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
	FORGED_RECIPIENTS(0.00)[m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[192.237.175.120:from];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RBL_SENDERSCORE_REPUT_BLOCKED(0.00)[192.237.175.120:from];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	DNSWL_BLOCKED(0.00)[159.253.27.254:received,10.181.42.216:received,165.204.84.17:received,2a01:111:f403:c100::f:received,2603:10b6:806:28::28:received,10.180.168.240:received,192.237.175.120:from,2603:10b6:806:28:cafe::58:received];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	DWL_DNSWL_BLOCKED(0.00)[amd.com:dkim];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[165.204.84.17:received,159.253.27.254:received,2603:10b6:806:28:cafe::58:received,2603:10b6:806:28::28:received];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 01F01265624
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 11/03/2026 15:09, Stewart Hildebrand wrote:
> On 2/18/26 12:16, Orzel, Michal wrote:
>>
>>
>> On 18/02/2026 15:21, Stewart Hildebrand wrote:
>>> Gentle ping.
>> Sorry, I'm quite busy these days.
>>
>>>
>>> To be clear, domU interrupts with vGICv2 are currently broken when
>>> XEN_DOMCTL_CDF_trap_unmapped_accesses is not set.
>>>
>>> On 2/5/26 14:01, Stewart Hildebrand wrote:
>>>> Since 4dbcb0653621, the vGICv2 CPU interface is mapped in a deferred
>>>> manner. On domains with XEN_DOMCTL_CDF_trap_unmapped_accesses unset on
>>>> GICv2 hardware, the vGICv2 CPU interface fails to be mapped. A visible
>>>> symptom is that a domU gets stuck at:
>>>>
>>>>   [    0.177983] smp: Bringing up secondary CPUs ...
>>>>
>>>> Move the 2nd check_p2m earlier so it's prioritized over try_handle_mmio.
>>>>
>>>> Fixes: 980aff4e8fcd ("xen/arm: Add way to disable traps on accesses to unmapped addresses")
>>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> I investigated whether the reordering is safe and it looks ok:
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> Thanks! Is there any other feedback? Is this ready for commit?
It's ready, will commit tomorrow.

~Michal



