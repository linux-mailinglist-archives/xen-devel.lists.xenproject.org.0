Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA152725FCE
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 14:45:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544745.850717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6sXH-0006nX-QB; Wed, 07 Jun 2023 12:45:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544745.850717; Wed, 07 Jun 2023 12:45:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6sXH-0006ke-Mp; Wed, 07 Jun 2023 12:45:11 +0000
Received: by outflank-mailman (input) for mailman id 544745;
 Wed, 07 Jun 2023 12:45:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rfoE=B3=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1q6sXF-0006kY-LM
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 12:45:09 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20612.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21093d05-0531-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 14:45:06 +0200 (CEST)
Received: from DM6PR18CA0001.namprd18.prod.outlook.com (2603:10b6:5:15b::14)
 by LV3PR12MB9188.namprd12.prod.outlook.com (2603:10b6:408:19b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 12:45:03 +0000
Received: from DM6NAM11FT082.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:15b:cafe::f1) by DM6PR18CA0001.outlook.office365.com
 (2603:10b6:5:15b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Wed, 7 Jun 2023 12:45:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT082.mail.protection.outlook.com (10.13.173.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.23 via Frontend Transport; Wed, 7 Jun 2023 12:45:03 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 07:45:02 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 05:45:02 -0700
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Jun 2023 07:45:00 -0500
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
X-Inumbo-ID: 21093d05-0531-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kx5+lDXf3BOu0sWhUd/0EiZOi7u70OR4ffCT4ezayVCQKfthLstGuxc6v8Y+ucnbo63U5kVcLABucPHnd44JjeJe26XF71ffaqrluG8Xtgg3NCbiM0xHKLyuhmAsMCUXdzGxWILS5aD79QAxbQpBkiHK3IzFhtKINXnI6IUgr1Nh/Zev/CHIFvNdEA+k5PeI8pjY+c5FM8iLpm/rilradQ1oy+hNAkrPWQHh0cFJMF8/zsyf5xVcppj6461mdTKswM3psz/FuMSdMeM3azqOiEGaVpGVm1sllCMlQwW/kXn/0fw8I3RdHtD82+NcDa71NC+G8llcM3ehdXXzxEenUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WsGl4ktTBObDoB/1wlaqLnmqeysCIlQV0YUZkEaCR84=;
 b=BZK7WBVDkRmuNpeODEZlQcsZu1Rh0qsvf78cKFTGZJwILArbS6UDa5q3z2Ev2kb3+imj+tW+M1Wq1h6e5rRhBt5+4uAxQQuHMyUp++hoKPHwIuTpGI4v/zwVfPSIm2WgrAg0bOgh3tmc6N04aOz1R5wKcFgEc7jgWgCsQeFPrNYOr8ejYP99Iqk003DehdnFf+HF4q9pLsFPQVHZRlcgzHk0OLvHbBnobMTcYx5INSoPhh3iXB6YT5IgGZNUgFhBe9HgBm/e/Dwi+XEei+mABrIE7+hCxF/V1TYllYiiiqKelEKpS6xMWKex0iXLuabBqc+T5o+5fB1jrowBnseDcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsGl4ktTBObDoB/1wlaqLnmqeysCIlQV0YUZkEaCR84=;
 b=14D7NPq2Xkef2AIyI/AsHZZ3suYZzvHh1OGTwSLfNCaQiPxHyW26qd9iVSeL5pXuekX/mx66hubWlh0yPBO3SLNh7cR+E7crJHjVbg0wviKL9h+gCSEWxBsy/wOb5V449V1lMc/2uuJzr1+2WXW7gf7fFXq2FrUnKSeWAJVnOD8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f34437de-6c79-c960-21f4-b18c19387539@amd.com>
Date: Wed, 7 Jun 2023 08:45:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 4/7] iommu/arm: Introduce iommu_add_dt_pci_sideband_ids
 API
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Paul Durrant
	<paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, <xen-devel@lists.xenproject.org>
References: <20230607030220.22698-1-stewart.hildebrand@amd.com>
 <20230607030220.22698-5-stewart.hildebrand@amd.com>
 <74765c0b-f463-896d-8f69-ecb1cf55cee0@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <74765c0b-f463-896d-8f69-ecb1cf55cee0@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT082:EE_|LV3PR12MB9188:EE_
X-MS-Office365-Filtering-Correlation-Id: ca2edc8a-b3c8-4d37-6a4f-08db67550391
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WwGjIvG8yt9JkCGCxBGZUjrmMc5pToHk7pkG2emHAhABNboNeka3/5olUVjN/umwmaS72oxcDDuXxe2uOeWf3bsLVmkf4ebwwNjTPKJ/2oW593ww/WF2nzrdouafkZDmSeJIV6Plngy+JHj3b+G1wznBwAhrOiZnhd2nY+s6XeyQfrArJ6K21rjUfImbv9gGQvmuep1yscMfibmtEnEHFr4bqcNLTxnYRXkYaeXRnJSmww6zTM88PdhZ+7W6uYu7OgzFTWCApInigSQobGpYd1CYKBaXknvj9sDTjtQ4eGA2KufsDtHWRWK7lM+gYE9Qgpngkzr+5wPDjroLMVe2nSHxNJ+35gV/DfhtuUTXa/bZv4qTCNN4Ugv6fu1IwjjwgMfScHi6Zn7tLMxkcnQZIAp21QhdPcNtOifWEVb3Q4xI1yVxjaM14fCCSeo5sh23vTpowwcQw9I6BK+cYZrChYVBlpEejfMuQh6UuTXsCst1z1lO2Y+WfNPALjbE3pTsR4cdyYxxGIVQQ0jnQj6EKPUtifPFzqkAOlpJKJahH9dFNWXs57ifCmoyazgVE7bEWetSST9FBeSHfRs0mUQjPyhkivZiZo89RKNAgpu+yxvEQtRd2wkp1vKPdcoXRi4DYZccW7nBEWJyRbUtmk9T/8RAvxxQPDqWl6IhUmHUofdOD6JAoUZ5vWyazHFccHXAbLcfRbmb/R4eoURT0sSpsvTVJqI+F4Dn97U6OCwmVtFfv3lfTespRJOverfFqouH3QjJ2etEBGHtzYQ2IbgOWYM8gXriBlj0NUAOm6J0bgU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199021)(36840700001)(46966006)(40470700004)(40480700001)(54906003)(70586007)(16576012)(82740400003)(478600001)(81166007)(356005)(316002)(6916009)(47076005)(8676002)(8936002)(41300700001)(4326008)(70206006)(2616005)(186003)(426003)(336012)(36860700001)(966005)(83380400001)(40460700003)(26005)(53546011)(31696002)(86362001)(44832011)(5660300002)(2906002)(82310400005)(36756003)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 12:45:03.2018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca2edc8a-b3c8-4d37-6a4f-08db67550391
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT082.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9188

On 6/7/23 03:59, Jan Beulich wrote:
> On 07.06.2023 05:02, Stewart Hildebrand wrote:
>> --- a/xen/include/xen/iommu.h
>> +++ b/xen/include/xen/iommu.h
>> @@ -26,6 +26,9 @@
>>  #include <xen/spinlock.h>
>>  #include <public/domctl.h>
>>  #include <public/hvm/ioreq.h>
>> +#ifdef CONFIG_ACPI
>> +#include <asm/acpi.h>
>> +#endif
> 
> This header is supposed to be usable without #ifdef, and then ...

You suggested adding the #ifdef

https://lists.xenproject.org/archives/html/xen-devel/2023-05/msg01409.html

Please clarify

>> @@ -228,12 +232,28 @@ int iommu_release_dt_devices(struct domain *d);
>>   *      (IOMMU is not enabled/present or device is not connected to it).
>>   */
>>  int iommu_add_dt_device(struct dt_device_node *np);
>> +int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev);
>>
>>  int iommu_do_dt_domctl(struct xen_domctl *, struct domain *,
>>                         XEN_GUEST_HANDLE_PARAM(xen_domctl_t));
>>
>> +#else /* !HAS_DEVICE_TREE */
>> +static inline int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
>> +{
>> +    return 0;
>> +}
>>  #endif /* HAS_DEVICE_TREE */
>>
>> +static inline int iommu_add_pci_sideband_ids(struct pci_dev *pdev)
>> +{
>> +    int ret = 0;
>> +#ifdef CONFIG_ACPI
>> +    if ( acpi_disabled )
>> +#endif
> 
> ... you don't need #ifdef here either.
> 
>> +        ret = iommu_add_dt_pci_sideband_ids(pdev);
>> +    return ret;
>> +}
> 
> Also (nit) please follow (partly unwritten, I admit) style guidelines:
> A blank line between declaration(s) and statement(s), and another one
> ahead of a function's main "return".

OK

