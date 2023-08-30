Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B9D78D488
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 11:18:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592802.925634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbHKa-0002jY-WD; Wed, 30 Aug 2023 09:17:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592802.925634; Wed, 30 Aug 2023 09:17:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbHKa-0002hs-TZ; Wed, 30 Aug 2023 09:17:44 +0000
Received: by outflank-mailman (input) for mailman id 592802;
 Wed, 30 Aug 2023 09:17:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A9QQ=EP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qbHKZ-0002hm-Ki
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 09:17:43 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f1fe64e-4716-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 11:17:36 +0200 (CEST)
Received: from SA9PR11CA0014.namprd11.prod.outlook.com (2603:10b6:806:6e::19)
 by DM4PR12MB7672.namprd12.prod.outlook.com (2603:10b6:8:103::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18; Wed, 30 Aug
 2023 09:17:34 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:806:6e:cafe::e8) by SA9PR11CA0014.outlook.office365.com
 (2603:10b6:806:6e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.36 via Frontend
 Transport; Wed, 30 Aug 2023 09:17:34 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Wed, 30 Aug 2023 09:17:34 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 30 Aug
 2023 04:17:33 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 30 Aug
 2023 02:17:33 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 30 Aug 2023 04:17:31 -0500
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
X-Inumbo-ID: 0f1fe64e-4716-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igKX57G4txnMs+fj2fY3qzrsJkecmFtU0N9BCvNr5401yRHmYks0ccWevduhGLqAl5cKNhpRsmQOrIzPc1xWDSg1Ijz4QnbYJ/1iInC0Vro2B8QTg4uELH90aikH3bb6MJ6HmXZ2lcYB5CJ7NhB+8YPQHmJ5Nx13xMGTDrY+IplTUyZO1uBxre0P5BPE0M1S0/msGhx16VWTqb4HO2VAx54cHKZDJwTrpJy6t0BeGeXF+GlmnPdtdj8o3Yg76RmduObqwuUQqOgw5PiKx39mr2u2qt+mj3Rx9R+C7xQF4Wjkl8YUj9kPKOjjEPQRxHSBLi0Lr7/JFtpJF/oy3Dwh6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPWfjUTCVBW710LysYyH8ZsWqYJ2yZfZW8lzgdHph2A=;
 b=LRFrPb2vAtE1lYXwiWR4LYhPAfJ/4lON6FB3oFmRQmHITxuAdrArq3DEHezIiHnJx1UJcwcMWr5TjQFryao/lbeTLPAX0ECJ5PmBu0a9WqmB3xRCGUkB3E70iatGkvd+aBjT++BZmy7ypW+nwueKb3fBphjb7cRlLmg07gXrQrAiiPpmUTTmoZhR8KwtMT7O8AWNWIGvhT+EePgz3VnlmP/JuCpOwg5EgyjJCmqDVe00qED8TXxrMAFR9hbv/qzjyg6CeQuzHYgdDKZtgcxTRVJXX8eeuQ5Ge/7lT0NF3A27UsETedXce9S1ezkzdglTBHf9HFW4HuegdY1LtJ3crQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPWfjUTCVBW710LysYyH8ZsWqYJ2yZfZW8lzgdHph2A=;
 b=O4iSvOG48WEZvsQz+lZ8JhfATENkw3qunonhzdP1wKB3II9ge/Y6wFicMynceGagAo8ItayjIcvJehl1koIjA2pnW1+5i9cU/5layfpAogY2g1UNsbDBBPKkVokBFK5I67twuUVPAVl+BbYTxHTCLax0VARFPxYwYWb/jWnYPgg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <753b4259-e867-4c79-55fd-afb0d87d1f3c@amd.com>
Date: Wed, 30 Aug 2023 11:17:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN][PATCH v10 12/20] xen/smmu: Add remove_device callback for
 smmu_iommu ops
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>,
	<julien@xen.org>, Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
 <20230825080222.14247-13-vikram.garhwal@amd.com>
 <32922c58-b9b4-26a1-42ef-426fb9a4b8af@amd.com>
 <alpine.DEB.2.22.394.2308291543430.6458@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2308291543430.6458@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|DM4PR12MB7672:EE_
X-MS-Office365-Filtering-Correlation-Id: 5db1aa73-70a6-48a4-96ff-08dba939f256
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	05UborZGfqbVFfar+fLO1fQl9TFwkRJdTl9B4YXhxoC/gOEg9MTwtBupvfO2ysXX2Cg5B50kzKl/pzzlZXIzS9uta9NiWFPlKYrvNYzGanR+5WZ4lDFk5ShH9kSisGn9gDk48eXJLoPFFHVmJga3+KqsA92QLJO5NPXx/loQR7ReT+KuR9ND2DcjQrXOpNxLZI5Hr9FXUC4YlP4PqcVwxs4kf/cqvDiIttkvfUjaefSACYjP5Mvd9UVqKC4nCDKbnHycC5JVKr+N986/KwsHPjVOPPTEdctD6+2ls6+OZEkUQ7+tVeEAA2DLZsZtt0aV25/dTpTbZSa6BzSGxjlPtEFvZa/3Z87Q2jwY0545gQviahaxROfi0LjtYtQ8EWwtaB1WKyZHDg61nbgR3wb1pmlWZORi9RkIC9OqXM37Ma/eOMmPg99zcH+8XwetGBXCdq7n1ot5i2V0dpI2XGkmqHCg6i9YamjuxnlzHACVk6JIW+AF4fzTvV+hX9tn9VzAJ0ofnxjKvzrp5xN1kUAecW8zkrxVdZSXWycARt55JgcnN6XO7SlMqb1qeYWyMJeUgEeJ/hA6EzmNIDXP6tZ1+4GL7JBTnszKJlV2Y9lwUb3ubyYBRBPEnYKvCAR98mRO669HK0aHQ4frb20fO9shIAde0CNw0Sxb7ufkpWf3FVSYUyxBEh+7JYjnVcx3+DlK8C+/Iuyu+sE77FU7PWSL3vVhQCoyFAFS/nyrOUoGxp4NMAavN9qHjCwG03kgzvtIdvg7l21Ln4o8Np6scK2Vd74HFnoUDwVeoowI+6ypUioq610v0NSeclYHURTI7DxM
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(376002)(396003)(39860400002)(1800799009)(186009)(451199024)(82310400011)(36840700001)(46966006)(40470700004)(356005)(81166007)(82740400003)(8936002)(53546011)(70206006)(478600001)(70586007)(31686004)(54906003)(6916009)(16576012)(316002)(41300700001)(40460700003)(26005)(44832011)(5660300002)(8676002)(36756003)(83380400001)(2906002)(31696002)(2616005)(86362001)(47076005)(36860700001)(40480700001)(336012)(426003)(4326008)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 09:17:34.6266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db1aa73-70a6-48a4-96ff-08dba939f256
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7672



On 30/08/2023 00:45, Stefano Stabellini wrote:
> 
> 
> On Tue, 29 Aug 2023, Michal Orzel wrote:
>> On 25/08/2023 10:02, Vikram Garhwal wrote:
>>> Add remove_device callback for removing the device entry from smmu-master using
>>> following steps:
>>> 1. Find if SMMU master exists for the device node.
>>> 2. Check if device is currently in use.
>> Since you removed a call to iommu_dt_device_is_assigned_locked(), you do not check it from SMMU, right?
>> You are relying on a check done in iommu_remove_dt_device().
>> This wants to be mentioned. However, Julien suggested to do the check for internal SMMU state.
>> Looking at the code, when the device is assigned, we do:
>> dev_iommu_domain(dev) = domain;
>> and when de-assigned:
>> dev_iommu_domain(dev) = NULL;
>>
>> This means that before calling remove_smmu_master() you could do:
>>
>> /* Make sure device is not assigned */
>> if (dev_iommu_domain(dev))
>>     return -EBUSY;
>>
>> @Julien, @Stefano?
> 
> I think it is OK without it, as we have a call to
> iommu_dt_device_is_assigned_locked(np) already in
> iommu_remove_dt_device?

Yes, but this would add an extra layer of protection by checking for IOMMU domain for this device.

~Michal

