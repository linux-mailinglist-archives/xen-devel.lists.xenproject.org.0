Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A4164B84D
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 16:22:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460701.718657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5763-00041C-9I; Tue, 13 Dec 2022 15:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460701.718657; Tue, 13 Dec 2022 15:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5763-0003zJ-48; Tue, 13 Dec 2022 15:21:31 +0000
Received: by outflank-mailman (input) for mailman id 460701;
 Tue, 13 Dec 2022 15:21:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+6Gs=4L=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1p5761-0003zD-5g
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 15:21:29 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce8cf001-7af9-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 16:21:26 +0100 (CET)
Received: from DM6PR03CA0011.namprd03.prod.outlook.com (2603:10b6:5:40::24) by
 IA0PR12MB8302.namprd12.prod.outlook.com (2603:10b6:208:40f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 15:21:22 +0000
Received: from DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:40:cafe::5) by DM6PR03CA0011.outlook.office365.com
 (2603:10b6:5:40::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19 via Frontend
 Transport; Tue, 13 Dec 2022 15:21:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT068.mail.protection.outlook.com (10.13.173.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.21 via Frontend Transport; Tue, 13 Dec 2022 15:21:22 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 13 Dec
 2022 09:21:22 -0600
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 13 Dec 2022 09:21:20 -0600
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
X-Inumbo-ID: ce8cf001-7af9-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O2QfCnCsQ8g/KxvRy7Qnjjiyy/2gjkaqLhSGvPgIeMyVH6hnpbGqWKP+2b5O7KI2OKObUxGPXa3wfV7SosUIKJFOHQo8amJB7W/Jgzd4sy/N3gyt75PZZ8hJY1OLP5CqXtGPFjj6Daq1p4FMRZmeVvvucfyjd/FaKDsvg5aluk81qh2UAPiEGsOqNH+s/Prx9jUOSASkt/SiycQ4viKXmBCykgc077RipJIwiBOdBx+Sv01g5TZgw90j7CHNEg0CU+AhoFqsGtJ8jrlwDXYbABEgBioQ+CNfp7GzJg8Y7crkeoU9MBUmU27xv3IIC4E8Y6eXyoKhaJNTiYSmxNgxLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3//X6CAvaR9OwunMNpIuRV2EDPy+55g+1ib5pvktsew=;
 b=Cn7Q5EBVL6Vlwq/Ql8fS9lWLx9c6kDdzL2yCIc4qp00XJhWDnSJQn6Mfr8ThmPOyaHI5R7ynZpuVWjB3VXr5+gYFNWlfCSJTKJ9ahIfgzvNM6CjHs6S8DcVUsvG+eDTQlraKLjNNvnDr8v+Bf50aHuO2UNK4Woew0Ja+dqKqymqnsBkV2sQ5hKQO+JdUIJTM1y3drfwR86qrhk1NIlLpklUWZ7B3hQCRfcZpVYoAWZ9f5THkPAfzArlYUGon+0vrvGuVxxjdzDI8RUZM0iqSH63gc1y5BuN6w+i4PDwHqOOOeVwsAaM3JOdPjMJUjvfRVj1rKrEZ+ifuiDwCNuutXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3//X6CAvaR9OwunMNpIuRV2EDPy+55g+1ib5pvktsew=;
 b=aIFxOug0EVA83YG4vtY33KFp9l/FcPJLvxcNQd5mhPueaOK9ohusNgSvA6NeTvDay934OZtqdHdBotLOBPA4aYIXymQx9BOAMz5JMfQ6XVPhdWEDwt4py6bVzDtIR6U3lyE+HPJqZptfhc+VjtlC/yrZA2f8lNY9FU02l9XrE0g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a16836f1-8758-1276-8378-cb7a4af1a36e@amd.com>
Date: Tue, 13 Dec 2022 10:21:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] xen/arm: smmuv3: remove unused function
Content-Language: en-US
To: Rahul Singh <Rahul.Singh@arm.com>, Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221212160031.31590-1-stewart.hildebrand@amd.com>
 <19f2def6-89ac-4cb3-9cfc-78351e9b5bde@xen.org>
 <32990D42-8944-4438-ACE6-A4884ED5E74B@arm.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <32990D42-8944-4438-ACE6-A4884ED5E74B@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT068:EE_|IA0PR12MB8302:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f033633-36a8-4d01-b94b-08dadd1db149
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ra5a/IGYUqCOXih5rn+NFThusD2B1SyR22ekHrgGUd6B/qH1f6gu/N+d7IS0yElqLMrLnoIZbkQY1AhRjEa7ROLBpKIOKCUC0O9ma0KjzlVfSdCdSUYFzJQih0dETjwiED6caVFI1u09leq/lrnPyz5YJ2qOEvJ/nl9zF7zGW6zkOlgB2JrAEN+fETU6VqNVJWJ9KRqHLc8CAwx5YfvXXVf3+xmLLWRDNCh2wpN5LiPzSC5Yxc7yqMCcNaUaqGEMLfqqGax7NtgiqO2tVBQ5kfnWORrXI23vmzNJ5q2yf5Rzd4CPsfnX2PHi5v8Qkr/B3/0px0Qxzqkw7sNCayltB8o/B6YpXxQzmv09F4wXNtoMOWbPuoDlU7I00JgVhBIc8xmjnP0gzfSetRTk5GUcRFQN1Uq7skFcC8NmibdL29awOLjHv0OMEnqo/sT4QQuXyU+d+xOegWgyExwluZeGQU7WT0cu6LxMyn402kVBLy5qoO3CzEUdGiy9fbf3qAQ+XZzo4aKsRcKyGvVYeAV5ydxVY0Z+ni8wutpanLv+rIwIJcLMhEXiuoN+3xoeZzVH3afjQILQqRwzNm4HaeMIZmj35Vs1RNeCdMqmTfea3EZIG7l0lH1s3GpVDGleS4shK7Cl97rq+ctmefKN4wS5ejmYRh2+FoXJJzsMt4qFn56H1JByiCWf9kXeSpuIJXrrWeWMlZ//Hfr8bQhVYE5PInp2JWyeBg2ZfBLysFdzyBrU+NqWz9OUDZFtV1B1VTf3TfUEXIsyCUmDgnfcOW+kpg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199015)(46966006)(40470700004)(36840700001)(356005)(36756003)(70586007)(70206006)(2616005)(36860700001)(4326008)(8676002)(40480700001)(478600001)(186003)(26005)(110136005)(82310400005)(31696002)(54906003)(86362001)(53546011)(316002)(16576012)(81166007)(82740400003)(5660300002)(31686004)(2906002)(40460700003)(44832011)(336012)(426003)(47076005)(8936002)(41300700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 15:21:22.3754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f033633-36a8-4d01-b94b-08dadd1db149
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8302

On 12/12/22 11:24, Rahul Singh wrote:
> Hi Julien,
> 
>> On 12 Dec 2022, at 4:07 pm, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Stewart,
>>
>> On 12/12/2022 16:00, Stewart Hildebrand wrote:
>>> When building with clang 12 and CONFIG_ARM_SMMU_V3=y, we observe the
>>> following build error:
>>> drivers/passthrough/arm/smmu-v3.c:1408:20: error: unused function 'arm_smmu_disable_pasid' [-Werror,-Wunused-function]
>>> static inline void arm_smmu_disable_pasid(struct arm_smmu_master *master) { }
>>>                    ^
>>> Remove the function.
>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>> ---
>>> There is also a definition of arm_smmu_disable_pasid() just above,
>>> guarded by #ifdef CONFIG_PCI_ATS. Should this one be removed too? It
>>> might be nice to keep this definition for ease of backporting patches
>>> from Linux, but if we ever plan on supporting PCI_ATS in Xen this may
>>> need to be re-visited.
>>
>> Given the function is not called at all, I think this is a bit odd to remove the stub but leave the implementation when CONFIG_PCI_ATS is defined.
>>
>> Rahul, do you plan to use it in the PCI passthrough code? If yes, then I would consider to use __maybe_unused.
> 
> No, this function will not be used in PCI passthrough code, but when we merged the SMMUv3 code from Linux at that time we
> decided to have this code and gate with CONFIG_PCI_ATS so that in the future if someone wants to implement the PASID feature
> will use these functions.
> 
> I also agree with Julien we would consider using __maybe_unused.

OK, I will send a v2 with the __maybe_unused attribute (in both locations), in case PASID is to be implemented in the future.

