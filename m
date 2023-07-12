Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA1774FFD6
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 09:02:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561960.878515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJTqf-0002nH-Vz; Wed, 12 Jul 2023 07:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561960.878515; Wed, 12 Jul 2023 07:01:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJTqf-0002kd-TA; Wed, 12 Jul 2023 07:01:17 +0000
Received: by outflank-mailman (input) for mailman id 561960;
 Wed, 12 Jul 2023 07:01:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gKGC=C6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qJTqf-0002kX-4p
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 07:01:17 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e397729f-2081-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 09:01:13 +0200 (CEST)
Received: from BN9PR03CA0594.namprd03.prod.outlook.com (2603:10b6:408:10d::29)
 by PH8PR12MB7448.namprd12.prod.outlook.com (2603:10b6:510:214::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 07:01:10 +0000
Received: from BN8NAM11FT102.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10d:cafe::e2) by BN9PR03CA0594.outlook.office365.com
 (2603:10b6:408:10d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22 via Frontend
 Transport; Wed, 12 Jul 2023 07:01:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT102.mail.protection.outlook.com (10.13.177.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.20 via Frontend Transport; Wed, 12 Jul 2023 07:01:09 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 12 Jul
 2023 02:01:08 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Wed, 12 Jul 2023 02:01:07 -0500
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
X-Inumbo-ID: e397729f-2081-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HGitMiXkQpr+6WMzuHAZc3X9whUKLFGZ8nydRTbfPDBRenppNQQuzCtPmOKtmtWfEE0YXeXvmy3rpwW49AcpxUtOq7X7euWzEHg1rPpmViMjjAnYuXvzmXfycBlgVIhHZ88Zgi0qCE2F9+0cX+wZG/WRMUb6pAbITg80dpD4IXpf6Pn7PTtEOlxsDo9epjJPPJqN8d7V7O3E3bZXpIPzIA50uaNPpT+rUijQTbvkicjgFsF8z0hsaKYfBmdowCfRqgY1R7ZFv8ojwZEIl9RSzN8DqL7baWL6v5IzTI/smaqaKX2GswaHTwDqa7yW0TNPYse5/+bLun0DoF7wcaYyJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHHZezyovWasCDgNKi6aRPkoRqWOzpdBcBdB+sV3az0=;
 b=lTVs1u6KDoysGajyoGuhLQbkBbCib6+IMZ3/we2ccymKO+dWbiOWaKkYQ6hfA+VZ6Ru4ux1sjhTAi52GCnwtHgwf33tTOB0FVuBhAyBJb/7/I6WMUIHanJEN66kRFpkHo+Wer8FMq9H+BFtL8gyyk7jol6sps8v/2kSI2WlI1bOjjwo53k2pCw/Q9TWPPmZEUteo+L/vZWHBeoCVIhzOg8ZYMMy4pgr3BZTzVYOUR+d5X8F+Okoa5MR30Qd/rrJM5AmVfGjLr3rKRPpNPF9UBFrrxee6+W0bJ8L/7F18pWAAo4UcJ/edUSD3OjqzgFECbeQgDLjanK4aDHM4xfSCFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHHZezyovWasCDgNKi6aRPkoRqWOzpdBcBdB+sV3az0=;
 b=Axl4VRBs7ND7n0yQFdwr28hoVlJUosqDhdaKJhIYf+cQUo466m45WvAI2FMsWZGs58P9aEZRA4oS/NtEiR4T66idYyGEMaU3f2whSFOCHvxdOr1XwUrYL1fJglC74erJhNlEnFmcVPA2a1i+NIUOCkpCoWm2veEcAWFfG+7tY8Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b39b19a4-9649-173b-bb05-518702d05873@amd.com>
Date: Wed, 12 Jul 2023 09:01:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] xen/arm: Account for domU dtb bootmodule size
 separately
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230711082931.5402-1-michal.orzel@amd.com>
 <20230711082931.5402-3-michal.orzel@amd.com>
 <8bc1ed0e-3ad6-2243-4dd6-a88dd0ee00f8@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <8bc1ed0e-3ad6-2243-4dd6-a88dd0ee00f8@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT102:EE_|PH8PR12MB7448:EE_
X-MS-Office365-Filtering-Correlation-Id: cdc82743-4116-43b1-d913-08db82a5c570
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iraFMMky+TKr0uKnS7fcUyDD9k5HTd9kn+ZEYauySURooJlAw83BqWsyq8ChWZwzDytTY/i8hJWNDe3FalMqW0XO79CMUdyQhHd1u8XvGxXai7uF7FT6Rjv+OqIExC0I1F2bpPlczQfYf6+ICFbKq3WSl+NZpsDDZnouT9jkiK8Mg2VjPK+q5UNJQ550wYtE1QPYTWlY4hbmW9iiZrMG/E+i91/7YNyvFgi6OeYFPFUQRaVBH+dJm4zIGt+j/WUvWxV9Fqpz8nnBEf/PDFdHCD+v5bxSWaYGOpQ0czzwxdNk3KFVUS3v1QKbX3pEzm1i+gtocyKiBdvcD/Rr5MxOmHOTzR8fCfNn+gcMvyaiZqlGPJzln0jbXgEROSbvMDMz8EpSozwBdgtpoIbj0PQ46MZcU7uxL5VXCBdYtV6B+GgtjsjP+nN/J0AVRSGXI1lnAoCv5ecvqG4qmcsprmmwQmFKMvHfQOxadO4JX/Y6lv/+YOxrQW6L/MShYkn8pZIGSKBnwvoIYKr2YifZoTj/EbavGrjnnpFbAJTeVTSkaQjn9KJAYt6mHHBW49G++pDHx9CNLpCj5AJ8nTufbhpPdLt3iJ3bmZVbWY5pXEhLVjCLCYlPwTluKdOtjI79XdFohz4Hl1gQBDc+GoRoH4fbotBuNb0ZQbFj3F3v4csSiJarSUcn8ZqVhP613QGHnEhkXiRb3rLvCe75CGcMotGHF70aQKy00UDpDte8yv2/lA7cntJi/qxJfQH1xPUUVIdiH67w9fDYpuVGQTDWHK5UfLkz0m4csa8wPKLactLKV8RGmM2fXSaQbBLQEeBvN/C7
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(396003)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(40460700003)(82740400003)(81166007)(478600001)(110136005)(16576012)(54906003)(356005)(5660300002)(8676002)(36756003)(2906002)(86362001)(15650500001)(8936002)(82310400005)(44832011)(4326008)(316002)(70206006)(40480700001)(70586007)(41300700001)(36860700001)(26005)(53546011)(31696002)(336012)(426003)(47076005)(31686004)(83380400001)(186003)(2616005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 07:01:09.6310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdc82743-4116-43b1-d913-08db82a5c570
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT102.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7448

Hi Julien,

On 11/07/2023 18:07, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 11/07/2023 09:29, Michal Orzel wrote:
>> At the moment, we limit the allocation size when creating a domU dtb to
>> 4KB, which is not enough when using a passthrough dtb with several nodes.
>> Improve the handling by accounting for a dtb bootmodule (if present)
>> size separately, while keeping 4KB for the Xen generated nodes (still
>> plenty of space for new nodes). Also, cap the allocation size to 2MB,
>> which is the max dtb size allowed.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> Note for the future:
>> As discussed with Julien, really the best way would be to generate dtb directly
>> in the guest memory, where no allocation would be necessary. This of course
>> requires some rework. The solution in this patch is good enough for now and
>> can be treated as an intermediated step to support dtb creation of various
>> sizes.
> 
> Thanks for summarizing our discussion :).
> 
>> ---
>>   xen/arch/arm/domain_build.c | 18 +++++++++++++-----
>>   1 file changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index f2134f24b971..1dc0eca37bd6 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -3257,14 +3257,15 @@ static int __init domain_handle_dtb_bootmodule(struct domain *d,
>>   }
>>
>>   /*
>> - * The max size for DT is 2MB. However, the generated DT is small, 4KB
>> - * are enough for now, but we might have to increase it in the future.
>> + * The max size for DT is 2MB. However, the generated DT is small (not including
>> + * domU passthrough DT nodes whose size we account separately), 4KB are enough
>> + * for now, but we might have to increase it in the future.
>>    */
>>   #define DOMU_DTB_SIZE 4096
>>   static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>>   {
>>       int addrcells, sizecells;
>> -    int ret;
>> +    int ret, fdt_size = DOMU_DTB_SIZE;
> 
> Can fdt_size be unsigned?
I used int because by looking at all the fdt_create() calls in our codebase
we seem to use int and not unsigned. Also, I used min() that does strict type checking
and SZ_2M is int. So if you want, I can use unsigned int but will also have to use
MIN() macro instead not to do type checking (I cannot use MB(2) as it has ULL type
and do not want to use min() with cast).

Also, are you OK with the rest of the code?

~Michal


