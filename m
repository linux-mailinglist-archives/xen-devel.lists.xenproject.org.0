Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A241687BCC
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 12:12:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488697.756968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNXVq-0001zk-Mq; Thu, 02 Feb 2023 11:12:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488697.756968; Thu, 02 Feb 2023 11:12:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNXVq-0001xY-It; Thu, 02 Feb 2023 11:12:18 +0000
Received: by outflank-mailman (input) for mailman id 488697;
 Thu, 02 Feb 2023 11:12:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8a/s=56=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pNXVo-0001vc-Oc
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 11:12:17 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20624.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 721e1f12-a2ea-11ed-933c-83870f6b2ba8;
 Thu, 02 Feb 2023 12:12:14 +0100 (CET)
Received: from BN8PR15CA0056.namprd15.prod.outlook.com (2603:10b6:408:80::33)
 by CH0PR12MB5218.namprd12.prod.outlook.com (2603:10b6:610:d1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Thu, 2 Feb
 2023 11:12:12 +0000
Received: from BN8NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:80:cafe::ce) by BN8PR15CA0056.outlook.office365.com
 (2603:10b6:408:80::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27 via Frontend
 Transport; Thu, 2 Feb 2023 11:12:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT052.mail.protection.outlook.com (10.13.177.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.27 via Frontend Transport; Thu, 2 Feb 2023 11:12:12 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 2 Feb
 2023 05:12:12 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 2 Feb 2023 05:12:10 -0600
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
X-Inumbo-ID: 721e1f12-a2ea-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhTMi5YTZZPnRDDb9CFv5S/T5HkXiFknjQeZKtRA+I4lkQG/dtTuSTdGczb58NtleOJvWJm/EoXYgdU0iZqqWkk1KhPG/BhEs8U2yS/dQu1rBTMc2uInsMkbOvcpgVpG2PFiy78xcASGDkAWV0MWMACyZgGtdUW/Ls9oUtUX3amatsbpxOz01GgP8NmxZjEiztfprKI8Z+o8SbrekMIyXTkcGlxq4giglW8QnXzCbwiZ+OPXPsigNqkg4UrWzTFBQokBsm09LGUk7u1EyeD1JG/7lat44l6JBfDbv6HUcYjBVF/lL745pstb8SmYv/zdghliSB0xy1EF0HUfZmHiJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOOdZC2Gys58TDEiEBfUnSIl8yoQUjGHUk8cDgdbzVQ=;
 b=Y/DWlRiGct0VcyqKaJKL8eNPQfewKe1PHk98HEHwfc/46hPhbmoS/4NFFitu/URwFuX/wk50mZUe1LO7rWySaKBQy1spYqiCgxCZpbtVT6Hfvy87XmtyYatDZ9Tw4yDAdX0jYFze8M0JkZymT1daDbW5Q1OYXlS05HRLemSenuHz7UBF3fDsFRBpMFjEDSmg+slYeYUa4VttLTQpSuVmt+NHLJZon1RBHjAJSIFywscs/JLwJe2WXQrKZxEPhKjoQtY3MKwUvn6wrvkC1JctFru8ktXFjA6gQXZYgQoSAjY09uw2e3GmH6m1swsrgVs5L4KzhDIxIKWJVcpT+6lNqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOOdZC2Gys58TDEiEBfUnSIl8yoQUjGHUk8cDgdbzVQ=;
 b=gjjTDTA98daZ/YVez2aGaKS+Dhng9YQ6C7ChFiPwqx5EcgOgaGIc9Sg5F7aqbbF0qO4p2XRwTLbvYjcY+IWRDP/CtW6ILnZf3DMhtfoZ7igeYAV7eFoz4yl1HLKmSEEaOdhXrAUC4mttwo893PBAC9V/mP0zRooxd98qw7TYPeQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f3312bfc-f02d-f8e1-3a88-3b0570b745c0@amd.com>
Date: Thu, 2 Feb 2023 12:12:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/2] xen/arm: Add support for booting gzip compressed
 uImages
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<ayankuma@amd.com>
References: <20230202084905.6950-1-michal.orzel@amd.com>
 <20230202084905.6950-3-michal.orzel@amd.com>
 <3ef695c9-9b5e-3323-a901-d6daf030e07d@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <3ef695c9-9b5e-3323-a901-d6daf030e07d@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT052:EE_|CH0PR12MB5218:EE_
X-MS-Office365-Filtering-Correlation-Id: 914353b0-b120-4cc7-0f76-08db050e5581
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bD9hjCGuY/g44DHVHhM0x5KS1nTr1urAAac9z2NTakcEVDw/WttbHCdWg++8M58FNAbvAxK/wrlxlMhHxgTlTNFRtYRJ92ajO6lLFZRVhf8OJgoV3CvgP3pYYC9PgzH4vnyOOPORh863H5MfAAdHfY+2aas/vYZfETwDrOhxWa/3QgItWG88MDhsbbU9Z/VMLtSNLDVEqXgxpVfJ+7PnCtRguQyYr2yW0W8Ah5suMuG+wgyvMfy0c0shR1DJCBdPlgfW4cR9jFDSwgClT8EHPzX4h4UsmPmprSZuvAUnIzS+/ptGRBWIaAR168ZIeJU7l/YEGaeiEZNLot0Y/zMKE1ugEi89I28fHzJM1fAR7/ZfkOECTSBwBasuD5JsrhRPQRqXoaGnox3XksfYejXnBXYaM8Q4i5WaLl75kEVwCFqBTprS8AoJw2x9qYKrP6OmB47PTuv+9780I9ZMXv6XGPtL6JA6obnMQOd79s72R6yslmbF7dmqdQ2waG2QFd78HO3aNfEAFtlOMvffmuQxlSy4EVFQeXI8/zXM/9EJ3Ws2nkYSttmdh575xxy3ZcTO6TZi6Ls848DtNX2ytScndW2wyk5AaYb+IerJbXzZNt+geaKGAsfixvy8s5tr9v7zN7Rr1jN60GRbZ68EtPasAWQe2zJVs+6ttufubtjhkyI5E09H5tUlDZdhN/wG16KcyCQy82DJ5qbUGnMbdsiEnH7c8+4Q2nD/F8qai4Sebq+BcVSLwsF39966GjHT6D3mNftm53cjZNE4Q2GwDkd2tQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199018)(40470700004)(36840700001)(46966006)(31686004)(47076005)(26005)(31696002)(82310400005)(86362001)(478600001)(2616005)(186003)(336012)(40460700003)(4326008)(70206006)(41300700001)(70586007)(44832011)(36860700001)(8936002)(82740400003)(53546011)(426003)(36756003)(40480700001)(8676002)(316002)(356005)(2906002)(16576012)(81166007)(110136005)(54906003)(5660300002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 11:12:12.4790
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 914353b0-b120-4cc7-0f76-08db050e5581
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5218

Hi Julien,

On 02/02/2023 12:01, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 02/02/2023 08:49, Michal Orzel wrote:
>> @@ -265,11 +284,14 @@ static __init int kernel_decompress(struct bootmodule *mod)
>>   #define IH_ARCH_ARM             2       /* ARM          */
>>   #define IH_ARCH_ARM64           22      /* ARM64        */
>>
>> +/* uImage Compression Types */
>> +#define IH_COMP_GZIP            1
>> +
>>   /*
>>    * Check if the image is a uImage and setup kernel_info
>>    */
>>   static int __init kernel_uimage_probe(struct kernel_info *info,
>> -                                      paddr_t addr, paddr_t size)
>> +                                      struct bootmodule *mod)
>>   {
>>       struct {
>>           __be32 magic;   /* Image Header Magic Number */
>> @@ -287,6 +309,8 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
>>       } uimage;
>>
>>       uint32_t len;
>> +    paddr_t addr = mod->start;
>> +    paddr_t size = mod->size;
>>
>>       if ( size < sizeof(uimage) )
>>           return -EINVAL;
> 
> Shouldn't we return -ENOENT here?
Frankly speaking, I do not want to fall through in such a case.
If a kernel size is less than 64B, something is wrong, isn't it?
I am not sure if Xen would handle a kernel whose size is less than a page.

I do not like the whole falling through in kernel_probe even in case of obvious violations.
But this is something not related to this series so I added to my TODO to properly handle
the return types from kernel_probe path. If you really think, we should return -ENOENT here,
then ok (although I do not like it). Could this be done on commit if you insist on that?

> 
> The rest look good to me.
Thanks,

> 
> Cheers,
> 
> --
> Julien Grall

~Michal

