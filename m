Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C16C586C665
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 11:08:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686923.1069539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfdJw-0002F6-6I; Thu, 29 Feb 2024 10:07:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686923.1069539; Thu, 29 Feb 2024 10:07:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfdJw-0002DH-36; Thu, 29 Feb 2024 10:07:20 +0000
Received: by outflank-mailman (input) for mailman id 686923;
 Thu, 29 Feb 2024 10:07:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aH8z=KG=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rfdJu-0002DB-LY
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 10:07:18 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 500a51e9-d6ea-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 11:07:16 +0100 (CET)
Received: from PR1P264CA0094.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:345::19)
 by CH2PR12MB4055.namprd12.prod.outlook.com (2603:10b6:610:78::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Thu, 29 Feb
 2024 10:07:10 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10a6:102:345:cafe::44) by PR1P264CA0094.outlook.office365.com
 (2603:10a6:102:345::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.31 via Frontend
 Transport; Thu, 29 Feb 2024 10:07:09 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 29 Feb 2024 10:07:08 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 29 Feb
 2024 04:07:07 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 29 Feb
 2024 04:07:07 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 29 Feb 2024 04:07:06 -0600
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
X-Inumbo-ID: 500a51e9-d6ea-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLHOJfkeThvy+wjs4tOSNKWnp5XJhKR5svN6Gm58zE3XbkTjTmo/MiG4vTe8cyRLF1xnTddxeH5sLGnKB0YRRJUF9w7+9mT8fwXW9npqDJciFI19BMPB4yaLCYrQ5sA2h9ckA9j3SPv0ZtkHp9b2JTN6yh8QSVg3xj8BarP3krhGCKGRYjpdWRsrH+Xaahaj/zlGLC0lXRXJ1k67aO/IQK6llXko2KbSS3/kO9b8rO+nVZXLZ+8vy8DaVXY48ELNofcdWTX48fksTQgGA0l2X1OUGEPbX/q2/P1HA6maYceXXjSo0cKj6hB8/WBFANa9CRgh7ZbZfILXpyrzMPW7bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aM7XNxdFsKX0tite25WaThEAVbSQuAhgx4TeZHguDqQ=;
 b=B0JiKpFaJZCbWpeQYgC1KfmOa5UeRzFDFjbezova2CnGSgIVhVUODrnvtqrEyS1qxZKt4UUtPe+ICMyAC+uT7RN3xXVs8P4MsALogTs10kO8GAPjlM3+f3gBko8NB35iVpEpn0BqSk0NCgrAHFHVPKLrhxnOxQIMOpuJc3BxftT6/78CGaZj+fkP2ldOAt428UL+6i2IxV35dsgd/goYJvGiPuohrNN0Agnh1nuwqlGoke4MJbS3YGAlbdehlJS7mV07hTXSHSV89QqdQvDyfu33X6crxFAFvZ9Bw0F2wqAK5CIAf/5l4sLo4Q0vcEXzOr+1LOcz0bPDVko/oRMcOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aM7XNxdFsKX0tite25WaThEAVbSQuAhgx4TeZHguDqQ=;
 b=Y2X0E3TQ0CTQB78boxTcLfJY5zsIQGGNfIWmfNecDGTuogxMK02pvF8H4N0rcLeGlm3tHNd8F1256rgeoW8sN95SBRFjWD1VuB77VbZwkLp44NCqoI2sCP2icM0Sd/OsFFRrOEi3I8ukZ8s6jTsCq42R9m7FLFV1ns66LFNmPSY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <8228a48f-566c-4931-9f24-27bdaa1f0f28@amd.com>
Date: Thu, 29 Feb 2024 11:07:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Fix arm32 build failure when early printk is
 enabled
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20240228103555.172101-1-michal.orzel@amd.com>
 <9201bdc5-2e4c-48b7-8c92-f5063fde90b6@xen.org>
 <af11620a-ec16-4677-b968-d8e36c4555d2@amd.com>
 <alpine.DEB.2.22.394.2402281425260.575685@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2402281425260.575685@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|CH2PR12MB4055:EE_
X-MS-Office365-Filtering-Correlation-Id: 81f105e1-e218-4d5c-feea-08dc390e304f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iAyQt6fZqSO2ZY/iEq3bmmjQcUBtZdvVkEUoEoucgN1W/D6xIXG8lASsAc8m+xGKCnhtlmlZKzoJGO5Ll9ldpwhUBiDMvF4BfJWE7KeDTEhIpOvRC/YEV5U0jPRlZAI4ovY6OLqbDkW8bYeq0vnADIFtqhqs1B88/8TPwbrKsax44/A8WJRAPD98xfz+LXnbfAPeBitDlPCRKwVxtHYYLIuOaLoFT42j2j9Ru2GiLqFi8vAqNeK7peH7atWiGCGIM8JhvDtniQ4qWmUGZwE6dOX2/e/fisbDWpvynkEsAOssc+IKdlaTj5o0Y1yBnL5hrgiXKfg5ST7ciAHsTUlwT8qhkXCHzl1pTawHeGjJIDZt4TxuL6GpB9XeQx5VOGMBN3sqyfiL7f2wsPt1cGVbP0xDYPerUpsmRWx4CPyeiw3+YjIChL9WKuoPZumVHRZJGF0xA/eNcOWjbGeZhQ1pfYxnTPLfBDV/dJSt/Wux+pimzCSaHVbC/T05lZgppMwloU2nz0a1OinJPcuifLall3/wPML6PCy/ayHmX9boAftusDeOsNa89LXwVOciVn4EyyqvvRRIm+OeqhZB/uhMpS/X2JRSkNO/IgcRII9Naehhye7kXhsEYQz70A3NZXkvgD5Mq64NfNHFxoCdo3lre7iwTgZ3ASHp8JJp0x/6FzWJPYLQ/DCxT9QCtRkGJNSeOrQDqZSUewirq1j3VXJxN1tQpnmLXjzgKnVfvyrTrpaHBtD5ybflirTZDSeUv/c8
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 10:07:08.2017
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f105e1-e218-4d5c-feea-08dc390e304f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4055



On 28/02/2024 23:27, Stefano Stabellini wrote:
> 
> 
> On Wed, 28 Feb 2024, Michal Orzel wrote:
>> Hi Julien,
>>
>> On 28/02/2024 12:42, Julien Grall wrote:
>>>
>>>
>>> Hi Michal,
>>>
>>> On 28/02/2024 10:35, Michal Orzel wrote:
>>>> Commit 0441c3acc7e9 forgot to rename FIXMAP_CONSOLE to FIX_CONSOLE in
>>>> TEMPORARY_EARLY_UART_VIRTUAL_ADDRESS macro. This results in a build
>>>> failure on arm32, when early printk is enabled:
>>>> arch/arm/arm32/mmu/head.S:311: Error: invalid operands (*UND* and *ABS* sections) for `*'
>>>
>>> Good catch! Somewhat related I wonder whether we should add earlyprintk
>>> testing in gitlab?
>> I thought about adding this and I think we should at least have build jobs (hypervisor only, no toolstack)
>> selecting early printk. When it comes to testing if early printk works, I'm not sure. It'd be nice
>> but FWIR we have limited bandwidth.
>>
>> @Stefano, what's your opinion?
> 
> I think it would be a good and quick test to have. To save testing
> bandwidth I think we should reduce the amount of debug/non-debug
> variations of the same tests that we have.
Yes, I suggested that some time ago. We could keep both versions for generic tests,
but remove the non-debug version (unless you prefer to do the opposite) for:
Arm64:
- staticmem
- staticheap
- shared-mem
- boot-cpupools
Arm32:
- gzip
- without-dom0

This would save us some bandwidth that we could use for testing other features (e.g. early printk).

~Michal


