Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CA864B3A6
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 11:58:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460475.718392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p52zA-0002Nm-G6; Tue, 13 Dec 2022 10:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460475.718392; Tue, 13 Dec 2022 10:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p52zA-0002Lm-CC; Tue, 13 Dec 2022 10:58:08 +0000
Received: by outflank-mailman (input) for mailman id 460475;
 Tue, 13 Dec 2022 10:58:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nvb8=4L=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p52z9-0002Lg-7o
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 10:58:07 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d15557c-7ad4-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 11:53:24 +0100 (CET)
Received: from DM5PR08CA0043.namprd08.prod.outlook.com (2603:10b6:4:60::32) by
 CH0PR12MB5041.namprd12.prod.outlook.com (2603:10b6:610:e0::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.19; Tue, 13 Dec 2022 10:58:02 +0000
Received: from DS1PEPF0000E64A.namprd02.prod.outlook.com
 (2603:10b6:4:60:cafe::ba) by DM5PR08CA0043.outlook.office365.com
 (2603:10b6:4:60::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19 via Frontend
 Transport; Tue, 13 Dec 2022 10:58:02 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000E64A.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.8 via Frontend Transport; Tue, 13 Dec 2022 10:58:02 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 13 Dec
 2022 04:58:01 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 13 Dec
 2022 02:58:01 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 13 Dec 2022 04:58:00 -0600
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
X-Inumbo-ID: 5d15557c-7ad4-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+GMCNOzABO8j/S4fwodduq9OcwkTErDb7Mz5C+fu+HnzCVLNN3gANnCBXKWVJOqqLFb7lWiDdZ+JTa1N0kgfZYHl/mZGJh2FtzM55+VTelzc+qIztNT2OHS7IwjKT1TIWRUqbHm2zAVEhGGs3Of+UKlhIk9eo1xqBApHO3X8GSPRTBH0C5XWMxMwsycU2z/T09+CcuTVm+9wn3tSW/t0SGkVpNaVOqDIkYs3d3JEhZLCmCsC1Xw8O/KIVtq+Cig6o1lzolKrgD+8de0THuy/WfoLmAlLGdf9y+VamKGu6YoCx17DmhXHGBbr89bwAuzCMWIpnHQEAd2FMemRGLq4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=emc+NLYHPqe93LSQzTkL3pqarCjQ3viBJpEdUhH4NeI=;
 b=XhWi8jiV6s2XQL3nf+SZm9t4D4GlaS4p9J7wQ+HBMlkRq8B7AeyuRU2EYpXVRlWiAm9YrDrwD29oiXYyA3NlKBNPjd/NhJ4fJuMKJEwV4p9d+5y6L4CeTYKCv+XA1EXcAzItLcP+6vfih2v57Rp6/Pl62yZLOMYxHmJ27noh61CDaCve0nD5HR9hJt06I0pgH3lXqfPU+OWZevyePRKrvG1Ebm2tBg4FyeugDAvEAyNsA6cTbtJFirg4LhB0iD2iSJhCNld8dfFy/7u2+89K/E1YXJF+VjWDcCPAHkI4AE2Vr7YorkPnHxGVJO7v4zybZRI3HBZ1nXIR7+RyS6Aw7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emc+NLYHPqe93LSQzTkL3pqarCjQ3viBJpEdUhH4NeI=;
 b=Nd1LqKRRBOCazVtUnL4MLLbARjVwFSDf9WMQHSCvxvJkzfC/HiwFKJuv/4QtqlXwo8D9VVTC4Jm//NjAHLpQHduBM8rC5fzUs4nPJLTdn/32YfcyaaN64yNheKKvGDzDww1xucRP2emilR82Hai7pL/ez8Ng1NTedOs1ReoY6YY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <876a32c3-7eab-6503-c58b-4d0aa2fd7621@amd.com>
Date: Tue, 13 Dec 2022 11:57:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 05/18] xen/arm: Clean-up the memory layout
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Julien Grall <jgrall@amazon.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221212095523.52683-1-julien@xen.org>
 <20221212095523.52683-6-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221212095523.52683-6-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E64A:EE_|CH0PR12MB5041:EE_
X-MS-Office365-Filtering-Correlation-Id: 35c5159e-8bd4-445c-bcd5-08dadcf8e78b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J27gq1SQczUzoXlCe21tAu8UUbanR+3iOtzoQGeUoxVUEhB6yUkY7vD+Re4WySC6uCS2kbBK3cBRn72HLVwJIyLvfRtSP5+E4znc0P81vyxrMbvp01MIqliPB1pbn2ayECcZpAvw0yZurqM9gukzDKV+9i61iHVSYNVWr/0PA76hkX+iUaD0dxtnaAs1yFMyzF+ydPCliVal55t2GKLtgjAgaBcuTcD8FoZofOy4fwhHyMHfsBSU3+dt5I9WI+08XQbTT6ZaqfORmi02s9dMHv/5zZMSGQbZOI6fqiWZnHF3lRDFRfH8j126+2pD613t7Qa11rItfLg9Xc+ko2TPfxA1fYazWUuvMO/bnhxxlzmGGNXYPiGOxfEAMuTppcP64VdBjZu2/srrL50hTaVRJfUVzGgordE2yKHaQ6Ufzjn0JB+SfyW5Vm1cV9eiPrDHGzXbtCtA3nFNeJb3VUcLciWp89Eg81xGfYm0n6yxVawG5E7qwNXwoEKqWpw0a7NbXfaogj+xVu3/r7ihwiSAwxiw+P/MiVwkUS6HcZbFHtkqycZWne7JKBuuxSukCcVDfg/5ZE4f4jeLl8757KWVmkcGe15peTaU9gu9MrDGmAudwJyzmvKpXP6taHEr7xv4QxWyqcD4Acn7sAS5ikRhv3cLzxN3zLIarou02zOHLnpBVX7gjRGm9LOgMl5YKBvLFBP7TzfkBHXQbvPHeMps71kuOWpjIg8iiD991n/2tRMFJfKZjsi+7UlIitdGb1ZQiot1faagEwou/o4JNWpDdg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199015)(46966006)(40470700004)(36840700001)(110136005)(16576012)(8936002)(36860700001)(5660300002)(316002)(26005)(8676002)(4326008)(70206006)(41300700001)(36756003)(47076005)(70586007)(82310400005)(53546011)(86362001)(54906003)(426003)(2616005)(186003)(40460700003)(478600001)(336012)(4744005)(2906002)(31686004)(31696002)(81166007)(356005)(40480700001)(44832011)(82740400003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 10:58:02.0259
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c5159e-8bd4-445c-bcd5-08dadcf8e78b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E64A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5041

Hi Julien,

On 12/12/2022 10:55, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> In a follow-up patch, the base address for the common mappings will
> vary between arm32 and arm64. To avoid any duplication, define
> every mapping in the common region from the previous one.
> 
> Take the opportunity to:
>     * add missing *_SIZE for FIXMAP_VIRT_* and XEN_VIRT_*
>     * switch to MB()/GB() to be avoid hexadecimal (easier to read)
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


