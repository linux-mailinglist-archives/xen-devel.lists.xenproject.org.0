Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C09571FB56
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 09:48:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542984.847504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4zVx-0006mV-1k; Fri, 02 Jun 2023 07:48:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542984.847504; Fri, 02 Jun 2023 07:48:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4zVw-0006jy-VO; Fri, 02 Jun 2023 07:48:00 +0000
Received: by outflank-mailman (input) for mailman id 542984;
 Fri, 02 Jun 2023 07:48:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0i3i=BW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q4zVw-0006js-9N
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 07:48:00 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20609.outbound.protection.outlook.com
 [2a01:111:f400:7eab::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb384560-0119-11ee-b232-6b7b168915f2;
 Fri, 02 Jun 2023 09:47:59 +0200 (CEST)
Received: from MW4PR04CA0235.namprd04.prod.outlook.com (2603:10b6:303:87::30)
 by PH7PR12MB6610.namprd12.prod.outlook.com (2603:10b6:510:212::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Fri, 2 Jun
 2023 07:47:55 +0000
Received: from CO1PEPF000042AD.namprd03.prod.outlook.com
 (2603:10b6:303:87:cafe::7e) by MW4PR04CA0235.outlook.office365.com
 (2603:10b6:303:87::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.26 via Frontend
 Transport; Fri, 2 Jun 2023 07:47:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AD.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.18 via Frontend Transport; Fri, 2 Jun 2023 07:47:54 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 2 Jun
 2023 02:47:53 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 2 Jun 2023 02:47:51 -0500
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
X-Inumbo-ID: cb384560-0119-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0uLodyphPTM8NsQhS9SuzOYfKCRGOG568e0i8ezDbmNKmYprP3PgnPKKWvs1++0TT+Wg5EaJSRJppdTP1j2NlDK5IL6Hq9XwzlmS8BswG8tbNCLKxhquNYpOvw6JDlXhh+rhMnZ80fnXrnXe5JgdZxxpkAuDmvc+FpNVY/FZKyaWu1SgPwePyfHO69nYsOHzv5tB9mdh0rj8v/cfwBblYXyXW1sjavtoJxkUpjVNGYR8yEMYAbjOHhgQCHYarKYvPnMYBJqE8XslPq9gGYeE660hN56irhHMCXEvIWr2YmupKfWzTgcbbYQpoccYO8PhiRG1sZ5zCMA2A8vRs0Trg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6W3xd8aKCskwlf0gGkwrberJSoufyL1gBa5ylXYbY1k=;
 b=JBeS7qwWHmIeFJPWynK1XwfNPudLyWFKRAGm4iej+D7El7yYZNEGtXi+MasYeRPlHgDRrq6d1i9Wkmnv/FIPY3oBGA1YQaxoBMCk0ZkuvthzfZzZ9mPMHniSneOBeoJS6Y6IS96vtPW5K64krq3RNmhKugthOi9Fxn/3KbYkgJj/aWrVdfKz8HmZCIIEx7Mr7n92bo7Y8oHYDgoTwrNXpN9OeS8UZvUoXQhPm41qHpDvI0uKwebiIEYdxh8FhArcT/hodIs2mn+5jjSGCXgfAwKXVqe/KFV0Bju6axcDiNtZ8O9Tl/S9znEC02jlTN/Aw5+mcVIx9QKOXKOqy5H+XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6W3xd8aKCskwlf0gGkwrberJSoufyL1gBa5ylXYbY1k=;
 b=fvebDu+cvjJ9UzHvJzx1cPBo/QSm/0L5Vt9XwIFPWWHcdruDHTHAfy5UZNhe8omV8UFpZIM6HrpJELI9fMoZApdKxySkq/Xx1W+XOvzmWWeFayrHSJfsnEjR8jg8IBQFFqPRPx9/kk4kSW/mfMQwqIrgVI4o19VOr1va1IZX8Vs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <70fe2149-31a4-ba67-47f3-173873cad693@amd.com>
Date: Fri, 2 Jun 2023 09:47:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN][PATCH v7 12/19] xen/smmu: Add remove_device callback for
 smmu_iommu ops
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-13-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230602004824.20731-13-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AD:EE_|PH7PR12MB6610:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a0d5080-76aa-4205-32b9-08db633dac8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R1lQtHpaWCJrXjDr8UMmQyIezb6EH3wrZBHmb22GNDGmC4Ytf23peh+5B7Lw3s1s0myBWqvJSh+plDWHJeArSqD/b4hXHmPnPsMFcFjBXQlsDoeiQQtixeJ735S+rvrFyggSHsF7gu0YuMmwm7xexuyg6E5gYDoKAgQyVd4TwyUCXGSBIhKF2jZGVX1feV/GRV0xqCrI5Ysqk8lDuBx5mKtENR5SqoyT/oHO3rD2nQvy8//UkBH2MNyjpNcbrtfbtfI0CUXxj/Qf8pX9zlBA1Ml9uTbrOdRB2fwaFicHfZNbqXUbU8r/P7spmw90fjWFfPAbCP+ubGV9+7BTrV8wPtoN6ZcNFd7szVTHS9kzysWkIa6vq+YPBWuGWyxhtzkBBgES/MRRvjEg56qQJLYOw4repqWKNb5GUfUkZASEwUCUxIm4WSCaHugqkrBTwDjeRDIzzArVBtq0iJ2PfMVMx/tqzMqjCuGh4OrpufC6Mjt+yBzE/kSMHDZ+87yht7HIoQuedBKZROAdTkI1dfVZgpYrrAqlgvCVK4oyprUoQSMi1a2DaOOTaECHEpM4sA5sYvBwYZv82blgjH8Mh59mPX3hQ5Hmbtlx+OjbqRVWj/ROoALUqeu7xNP8ZpFaKWXFpOGXuyXVWQZuxEDxu9meseRyGEmraWm60wOkyKwvMTDKPehqTCyHDRPWVUeqHha8bZpCDqqdaN1IKl6GwxNLL4/I4TwJaXu1TtTfi7OkrU3Ox+LdVAj+KWKc+GzhQGXKYInNdrIgcHz1zJvkPOSDNYL3/xkcHApVeHVpkV2119zHbUm3TjXJb6VJaJq8eJtI
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(396003)(376002)(451199021)(40470700004)(36840700001)(46966006)(110136005)(36860700001)(4326008)(54906003)(31686004)(70586007)(16576012)(316002)(44832011)(70206006)(2616005)(26005)(336012)(426003)(4744005)(8676002)(8936002)(41300700001)(2906002)(5660300002)(6666004)(186003)(53546011)(83380400001)(47076005)(478600001)(82310400005)(81166007)(356005)(82740400003)(36756003)(40480700001)(86362001)(40460700003)(31696002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 07:47:54.0453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a0d5080-76aa-4205-32b9-08db633dac8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6610



On 02/06/2023 02:48, Vikram Garhwal wrote:
> Add remove_device callback for removing the device entry from smmu-master using
> following steps:
> 1. Find if SMMU master exists for the device node.
> 2. Check if device is currently in use.
> 3. Remove the SMMU master.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> ---
>  xen/drivers/passthrough/arm/smmu.c | 59 ++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index c37fa9af13..fdef6e7a7d 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -44,6 +44,7 @@
>  #include <xen/irq.h>
>  #include <xen/lib.h>
>  #include <xen/list.h>
> +#include <xen/iommu-private.h>
Please list the headers in alphabetical order ('i' before 'l').

~Michal


