Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3193AE568C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 00:21:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022834.1398697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTpXU-0007Jk-A8; Mon, 23 Jun 2025 22:21:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022834.1398697; Mon, 23 Jun 2025 22:21:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTpXU-0007Gj-6N; Mon, 23 Jun 2025 22:21:20 +0000
Received: by outflank-mailman (input) for mailman id 1022834;
 Mon, 23 Jun 2025 22:21:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w0jg=ZG=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uTpXS-00077v-Ob
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 22:21:18 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20621.outbound.protection.outlook.com
 [2a01:111:f403:2408::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60aacdb5-5080-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 00:21:16 +0200 (CEST)
Received: from CH2PR15CA0014.namprd15.prod.outlook.com (2603:10b6:610:51::24)
 by SA1PR12MB6896.namprd12.prod.outlook.com (2603:10b6:806:24f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 22:21:10 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:610:51:cafe::f0) by CH2PR15CA0014.outlook.office365.com
 (2603:10b6:610:51::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.28 via Frontend Transport; Mon,
 23 Jun 2025 22:21:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Mon, 23 Jun 2025 22:21:09 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 17:21:03 -0500
Received: from [172.29.43.193] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 23 Jun 2025 17:21:03 -0500
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
X-Inumbo-ID: 60aacdb5-5080-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/v6yYXMESkN0ConGFWF8vreuyCv3Zdnz7TaDdKHUkm2VYWmQOJQ9m/m+sYJ1oaHvd0gdeL3OBFgiZ04kXsWd+Y1nVu/tCEyFWlhsjQuE7+6elSEqDCPHwMpsvx9pW2xyDqyHnRwBRzV1dIzWc6Go8Y6CQht8MK0JL1R+0ti5lRP0OJ9jBBdwZaSW5UG+SkJU1mgbo0icWBDRF/ACVZCR7Zx1EQ4iRDOWYZXb5k9so0duhz/oXV4RNqqo+ilrSQzfQ0uIJOkqwIZFG6w45B8BsV9MzRo2FUSLI20kf6QdiO5fGOHJ5NnnRY5oYBV1V8g0EtXwojmkgN2IEPymAaQpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mB6Vy5XF5HQ0c+7yK3aoA/i6dYI0TsGVFvh/gqBdrpc=;
 b=YlO4SUqQ01eVLn4BB3QhpPx1JwscoGUZLUctenSAQAvA5v5VMKRDpvD3sEQosxTNkmm1sJM9kdJoxmRGknQglSiYgT9lY53PN0HCF/nXV6s5LIKRda0kTAOGRWXwpjQMXr23/9fEZXrnIyiUTgDe6Q6QEeJ2v4Q13/zgr2V/SPBIfLVMafT2VDDIIJh7ZEdoniSHG0ptE7Q3g/2LZ6Ok8esmGg8W/viah6cADks3n4cfdCzwpndxFd4sYtQnn5QOYVTAJyVXIUjUWd000y2ztRcxQAGWHF9HOvFXFoL7xW24ckIoBHuCtLpMtTmtICGVu3WRS4wbKTnHyeQh6U6RBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mB6Vy5XF5HQ0c+7yK3aoA/i6dYI0TsGVFvh/gqBdrpc=;
 b=MEJf2FDUbIv99DqHIr13hSt81z6tzAHTLtnN0HssrIloT9eY8Hj6vfSQCnhhHPQPuaFPyjoqyziPuWXyJ0QFX+w+IviNQLn0Iq7kpyj9FulzIsE3UthzWmll2vRu+IV7dJW8E5t0Eo3K8ZOl+7bhXNp9HLhfYajHbkCIEldcE4Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <5d64794a-2e2d-439e-8067-b0edf2c3f0f9@amd.com>
Date: Mon, 23 Jun 2025 18:18:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/7] x86: re-work memset()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <c5e1e7e0-a295-4028-b003-152b861ee14f@suse.com>
 <f8bbc74d-aad4-4e4c-8680-009a21f11da1@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <f8bbc74d-aad4-4e4c-8680-009a21f11da1@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|SA1PR12MB6896:EE_
X-MS-Office365-Filtering-Correlation-Id: 7867c7a2-07be-497e-2842-08ddb2a4414c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZktlWHo3d2JiU2JDcDdIMHZSY1JYODRlOXBsTERSL0g5UXZMQ1pSK1hqbmF3?=
 =?utf-8?B?eUxyRzVrL1NFenpwL3FFL1h0KzNUZnkwYkxPT2FzbmV4am9PTnFJa0o1L3cr?=
 =?utf-8?B?NDg1Zyt6T3pnbndMWkJBWTR5c1pXT1hEWm5sS2MwaVBQMmFOWEE1U1Q5QmVs?=
 =?utf-8?B?Sk1NeUVkUEVTSEcweGk1Q2w5L0V0anpUOElyc0dTZitLUEM0QVdGaWNhTDhJ?=
 =?utf-8?B?a2tLYUduZnl1NUdXOEJ6Nm5PTjFNQjBkVkZHZENUZ3l5SGZ6SG1yMjk0eHNT?=
 =?utf-8?B?S3pPVFJ3dWhod25MK3RSMitxS1JuSUJYUEdhTVpTY28vM0RnY2JTbUNkT1A4?=
 =?utf-8?B?M0tjSXEvNXRyRDlEUDZ4UTNjclg4RTBIa20veDl5ZGZmLzlMMXlua1czMm5t?=
 =?utf-8?B?eHdRYnlRbGVHNDVnalFLQlBYTkxEelFIU2J3dVFCZnZoUjlKSUhxOEZzZ2FT?=
 =?utf-8?B?dHJOZnQyVFNpL1pjYUsyZTgrMlpSOGU0YXIxbnBNbHA1UnZ6ODRncFhLYjYr?=
 =?utf-8?B?bXQ0Z0NlUEx6S1FkUitKcXI4cTViWWNTU2tWLzJWeG9oak9tSWhveWN4cUdP?=
 =?utf-8?B?YnRqMzFQNnl6WkJOQlZVL0RlWGlkUjQ3akxNeE5aQ1UzMzB2ZXdIYVNBVWFn?=
 =?utf-8?B?WnRiVnBRdFNzdGQybXprZngzUnBlUjlCczZxbDh1Z2Y3c1YyL29nV3pnclh0?=
 =?utf-8?B?Q1h1K0UrMHZBTDFqT3ZEYld5WUliOFkyT3hQSE5WVTJGVUJoS0UxTFdjOEFZ?=
 =?utf-8?B?ZzZaSkpwWXVlTElScDJ2Sy9ZL0ppNklPTVlvM0xlcFZxbEpPait4SmlualQv?=
 =?utf-8?B?NExnU1dlb0pFTzZ0Qzk5L3pWenMxTU5Tbis0MnBZd0NUajZBQmNDV0piV1VI?=
 =?utf-8?B?bXBKRjVUSDA4aStWaTB1SnN6SU1LWDZFQXZFWFhrZXF2OHRQaTRSc1lhSjdL?=
 =?utf-8?B?c3ArblF2S3pXblFmS1N0Nzllb0RxWUd0WWVYNnJlbStzOWZ2ZmFtWjBhZU9E?=
 =?utf-8?B?Mmh6SzNLS3U5RTRrT1NDTXZmQ25yWW9SQVBWTWEwYk1aUWJXOTg4TnZTRENV?=
 =?utf-8?B?ODkzbXArdjZDT0g5TnlFU3Z0ZUpFbXdHNFZWZzNrNGlsS0l4c05ZRmQvcG5a?=
 =?utf-8?B?c0hKa21vSmNWQ3NNajk3VE1MRHVJUHNuRjZyR0ZzOVlQMHo4SEw0UnlPaW90?=
 =?utf-8?B?djQvTkE4Y3pXaUc5bGplZnZQdkpGMTJCK3ZwcTZrV2kyTit1M2FoaThlNFZo?=
 =?utf-8?B?WjZaZ3d0TGU5ZzJlczVBby9xQzQyTVVQV0hxK3o0NW5yVjZVU3lnUkZSNWhn?=
 =?utf-8?B?bldualBjaWxWckQzWnVOKzlSWlZtY2ZTMU9XMWdHQloxdDF6UWlVTHlSUjdV?=
 =?utf-8?B?VnZRWXNuU2w0M0tZU1hPMFU2QmxPdWtpdG5zamJpclBlbFhnTi95Q2h3WTMw?=
 =?utf-8?B?c0hzTUlBRXdJQ0NuTTEzNEt4dStXWjdadFRVWmJxMmllaEFac3VWb3drUkZ3?=
 =?utf-8?B?amVjcWxBWXQrblMzdS9ZY0hnN1lVQjlaanhGV2FGdEZGM25INjVjWDA0WEp4?=
 =?utf-8?B?ODhNbmJzaldPajg2K2JISFNER0xPYlEwWlRFb0dzdGN1MmcxdkYydWtaYUhI?=
 =?utf-8?B?U3FiTjUrSFJrY0NkZGRER3VKVVZ3dUZoYzF0N2UzQzRvd3BIR3VidXFheXA5?=
 =?utf-8?B?MlduVlh6d1ZpbHlpclRuNURhTEtzSlBvU2V3U3oxN3pIR0xmL0ppWW5WcXdX?=
 =?utf-8?B?RkM2c3dXTTcxcExlblB0bmNVNjB5OGFSRDh5Y2VzQ2wxT0NYQzJ0OFVYcTht?=
 =?utf-8?B?RWttSy9id0gwWGlFdnFVK0ptOFYxemNTcys1UjFLd3FLNk5EU0RpNnNlYk9j?=
 =?utf-8?B?c1VoYWh1S3ZjTlY2VGMrVy9NOVBhNTdZTGJDS0VhbCtzWi9TaTEydVVQa3hQ?=
 =?utf-8?B?eXhSR0h2UUFWcXFaZ1NvQTBkVkVKcHlXUGtGM3AvSmplZkZJYkpWQkNmU0ZK?=
 =?utf-8?B?Q1pSSi9GV1ZYSjlXd3JKemo1Q2FFT1g4SnFxQUwyUG4xa044b3FGajFFZGs4?=
 =?utf-8?Q?4VWLUX?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 22:21:09.5573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7867c7a2-07be-497e-2842-08ddb2a4414c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6896

On 2025-06-16 09:00, Jan Beulich wrote:
> Move the function to its own assembly file. Having it in C just for the
> entire body to be an asm() isn't really helpful. Then have two flavors:
> A "basic" version using qword steps for the bulk of the operation, and an
> ERMS version for modern hardware, to be substituted in via alternatives
> patching.
> 
> For RET to be usable in an alternative's replacement code, extend the
> CALL/JMP patching to cover the case of "JMP __x86_return_thunk" coming
> last in replacement code.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

