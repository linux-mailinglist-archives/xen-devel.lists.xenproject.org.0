Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B9E6E4B0E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 16:13:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522192.811412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poPbD-0000gM-30; Mon, 17 Apr 2023 14:12:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522192.811412; Mon, 17 Apr 2023 14:12:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poPbC-0000db-Vt; Mon, 17 Apr 2023 14:12:54 +0000
Received: by outflank-mailman (input) for mailman id 522192;
 Mon, 17 Apr 2023 14:12:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nDUx=AI=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1poPbB-0000VI-HQ
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 14:12:53 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e89::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef9b6938-dd29-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 16:12:52 +0200 (CEST)
Received: from MW3PR05CA0009.namprd05.prod.outlook.com (2603:10b6:303:2b::14)
 by IA0PR12MB8929.namprd12.prod.outlook.com (2603:10b6:208:484::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Mon, 17 Apr
 2023 14:12:47 +0000
Received: from CO1PEPF00001A61.namprd05.prod.outlook.com
 (2603:10b6:303:2b:cafe::67) by MW3PR05CA0009.outlook.office365.com
 (2603:10b6:303:2b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.19 via Frontend
 Transport; Mon, 17 Apr 2023 14:12:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF00001A61.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.17 via Frontend Transport; Mon, 17 Apr 2023 14:12:47 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 17 Apr
 2023 09:12:46 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 17 Apr
 2023 09:12:45 -0500
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 17 Apr 2023 09:12:45 -0500
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
X-Inumbo-ID: ef9b6938-dd29-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlY4dTigtg+XEouTXwfVx12y5p/xqAdKQx8zJTvt8lg/KwOC35PYaZxH9GQO8oLuG7OxCtN/Uauwf5/K0NC/ufPEtlw5ypaSpUOa76WLJ5j3QOJ6LSB7/a4suLRqfFlXJfIGEWiA0me8AGkX2Nz3oysGv2nGQcWqbfJHac9MP+LDQz0GdDRc59PMEaIRKw60JS0e5Di/odNrRASkWQqp42J3QCOxUHdaeMM2nw/7KSgRuPl/LbPHAi02BN2cpnHRKGu8FN0RVW16Bv8FAZvlVuwVVTeYKujmVhv06X0zgp2Ov0OepvQQva1FDfSIFQVyeS3xGGd0h7+PxgFy0wTuKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibMEOXHgyM91Y55EGpty08iDY8dRjzTXs1I1Jn2SKIA=;
 b=nbEYzjaCq/E0t/pvW/A2rotep0dLdXLcgoYR3yYKjCC5FFRN2lQKVaFTSPA7UCIup1m6X266mXbRSvSbUQTRnSzhvlXhPeb1jlgXoNXSmXpH90w8WzI4anRMr/e0Uiw79TDiXZiOPBsACN0XxoC/DfRxEv+Bz+/NW97easN6snmwi7lVnG82gWgV/EAH/hn0sH5jJnwKJCLrIPvEjel5hH5bKYi2BhdBz72ZB1VUQHoCuki144sDwbOq1zH7MZmZyeCLM3CLhTCy0eN4KQV0PNbbKc2Jo0+HaQ7GaL268FBrx7zCWPVxAl9SkWpEfP1d7bxBWWenOZu3f5gwcyQ/UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibMEOXHgyM91Y55EGpty08iDY8dRjzTXs1I1Jn2SKIA=;
 b=RZi5RAIfjXAMESQe6gq0nmFg2N4+h9i7HxP6lU+MApb2PLrB/JA7APQBOsiI783VMhtv2Hz3TIsTtnqLqnPweJpBJAo630CAw/MMyxExSQIQ5JIE9ZUEXpFDq1MoAHH6S/lajn+CRhpeK06lFkqHZtDikACOmylExq2THIN4W1Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <cf4922ce-6394-268a-7aa6-76aa8ca6d863@amd.com>
Date: Mon, 17 Apr 2023 10:12:44 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] xen/vpci: initialize msix->next
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>, Rahul Singh <Rahul.Singh@arm.com>
References: <20230414202932.293688-1-stewart.hildebrand@amd.com>
 <110951c5-4dc6-5fa5-1722-a86ba28f1789@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <110951c5-4dc6-5fa5-1722-a86ba28f1789@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00001A61:EE_|IA0PR12MB8929:EE_
X-MS-Office365-Filtering-Correlation-Id: 9093822a-5f73-474b-b603-08db3f4dd218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	otolui9TlQDsqfSwA0jTwIYrH3s6VM5xhsG8k/jIjgZzUx+ncqnolfyOcOSWD1S4DgGLIFOnP0eRXFTSGbjRSi9hbhAYHvfbvYiZ+JJleYFXhv0Vx1h9Fb7aLPBrOKaqk2aEPwj1sP8EOlZ2pvF+fSMxh/HuubiIXocyAZOttFuiMjVyeMzp3wjqdgsNuA2yzVG1Bsc1oSZe9wu3QRgP/cBgO6Ggw3h3utev5UmYkA+jilsA95peQ4mCsAthLTGiEYrr9WhE06lqt/P5VzyFRyiSyPZ/xfRY3Cqgs8YItEFFBxppccYAGEe4kq0hmLMLFURKSrCi6e7fk+RHrOBP2E6qVAIifNmaLLH/DPxyC/0p4UuvAVAJXVNFuX6PVvCmyNnl7/AZ363YdzjdV80O7QgesAeMnh/9RuiGRdZ02gE/CXlSaTnti1paP/hmvVUTY+YVO0L2uDXg/VsWodwmujsF37TuPz0F3RAMrnovJZnLeTYoYT0h6kr4dWQEAcuptOrboIpiPrghReYvduZ0HdfJ6DmL0jMhFvR/0+tkUtltDhyYsgwjFylVvnPWn0FcneZ3bocB1vviYdSHk/PWHVQqk5NQGO8FniId6tqYELAm7e/xbdYEQelGkoNrDHcDd8WvWQ1dRR3fEiTnpvzosFtIjWfjue7itCg/LBPS54DhtlOH90XjxGQyGmHLOXv2HfcQfxyUPTXdL1WNNCzfEFA9trH3VV5HMAdwxzEXojigqvtXnpK1jX64fxGgY9oE
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(376002)(136003)(451199021)(46966006)(36840700001)(40470700004)(2906002)(31686004)(8936002)(8676002)(70206006)(5660300002)(44832011)(70586007)(478600001)(41300700001)(40460700003)(316002)(40480700001)(82740400003)(426003)(36756003)(16576012)(54906003)(336012)(4326008)(6916009)(86362001)(186003)(53546011)(26005)(81166007)(2616005)(36860700001)(356005)(966005)(47076005)(31696002)(82310400005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 14:12:47.1360
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9093822a-5f73-474b-b603-08db3f4dd218
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00001A61.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8929

On 4/17/23 05:09, Jan Beulich wrote:
> On 14.04.2023 22:29, Stewart Hildebrand wrote:
>> The list was not being initialized, which could result in a crash in
>> vpci_remove_device if no list items were added.
> 
> Can you please point out the code path which may lead to such a crash?

It would be
xen/drivers/vpci/vpci.c:59:        list_del(&pdev->vpci->msix->next);

The crash was observed when msix->next had not been initialized (nor added to a list_head). It was uninitialized because ...

>> --- a/xen/drivers/vpci/msix.c
>> +++ b/xen/drivers/vpci/msix.c
>> @@ -678,6 +678,8 @@ static int cf_check init_msix(struct pci_dev *pdev)
>>      if ( !msix )
>>          return -ENOMEM;
>>
>> +    INIT_LIST_HEAD(&msix->next);
>> +
>>      rc = vpci_add_register(pdev->vpci, control_read, control_write,
>>                             msix_control_reg(msix_offset), 2, msix);
>>      if ( rc )
> 
> The error path below here frees msix again, so can't be a problem. The
> only other return path from the function is after a suitable list_add().

... when I wrote this I had applied patch that removed the list_add() in question (on ARM). See [1].

> "... if no list items were added" is misleading too - this isn't a list
> head, but a list element. The list head is d->arch.hvm.msix_tables.

I can see now that the crash should more appropriately be resolved in the referenced patch where the crash was actually observed [1]. In the current vpci on ARM work-in-progress, there's no equivalent struct list_head msix_tables...

Sorry for the noise.

[1] https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/commit/9f36d1b1dffcca1ae3fcb2dfcac4709c39d1b3bc

