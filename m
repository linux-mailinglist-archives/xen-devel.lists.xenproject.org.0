Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B206FF366
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 15:50:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533389.830013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px6gB-0002MX-T1; Thu, 11 May 2023 13:49:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533389.830013; Thu, 11 May 2023 13:49:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px6gB-0002Kf-Q1; Thu, 11 May 2023 13:49:59 +0000
Received: by outflank-mailman (input) for mailman id 533389;
 Thu, 11 May 2023 13:49:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qWxp=BA=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1px6gA-0002KZ-2G
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 13:49:58 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7eab::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4dacc47-f002-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 15:49:54 +0200 (CEST)
Received: from BN9PR03CA0376.namprd03.prod.outlook.com (2603:10b6:408:f7::21)
 by CH3PR12MB8075.namprd12.prod.outlook.com (2603:10b6:610:122::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Thu, 11 May
 2023 13:49:36 +0000
Received: from BN8NAM11FT071.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::b6) by BN9PR03CA0376.outlook.office365.com
 (2603:10b6:408:f7::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.22 via Frontend
 Transport; Thu, 11 May 2023 13:49:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT071.mail.protection.outlook.com (10.13.177.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.22 via Frontend Transport; Thu, 11 May 2023 13:49:36 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 11 May
 2023 08:49:35 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 11 May
 2023 08:49:35 -0500
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 11 May 2023 08:49:34 -0500
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
X-Inumbo-ID: b4dacc47-f002-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ANU9ngaayjkuMcLpE7Y6r/4X0GMKzDGCk/2XAbOab313QD4wnuURGscmXQWnCVu588rHfJdLdl3xQ9lMl7vFX+/cY2yfWyYvpQrVQZ7//FZDJu06MHrPYLeR2qmC1SdDBuwHrHPA3TKd5I7r/gkFiUcpgthWOWI8BCKvLVLa1sFIS1/4YbdSpAn8QJTlPPHJ3nh3y1r/SICNbo0NpgHy16K7alTev8JlrW4O4zzi56talld9SZPJUyMxg3a5DEHpuycnrMxVNNt3iLW7C9zRjkvtSfrAIxSzNh9YyfQ7sVSBEymQg1YnzThnWtDeKoZwp1b851WmKrFVQBvGC4o6BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiKpn8nacWb/SqFV+/0oYlmZUWF/hJmp22PWlXeblk0=;
 b=hE4CgNnKH+ciCMcSj/WLHXaywWoE/6ILCvF3KYMMlLuvYu/x+hYIQpsiAyD8Ma1yv6mtMe0XvpcYkl5NLyrbaE/BpVlOXrdWJ1cnuF+mobV2zoL25jCuuTRlOm/mCJYRkz4pyuC668mOaPYclLGw1lR3/N3EUDZDkeCYoy51QU9OyglVEIk57t851iQyMrEov5b3oUHlCLmc8PuTUQosvKuVhvfArz9PJZknr+Yp2tb3X2wl/h8AxT4V9UE8sCd+gAfiUQWUxx6WIUV7GVcfhLXaA3lEFpTW4KCOu8yxvaOTnC1WdyZMccpscxk5qwgGDqWZ8jzn36Vo6ETUZD5OYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aiKpn8nacWb/SqFV+/0oYlmZUWF/hJmp22PWlXeblk0=;
 b=0jb30b7mWkei3J5q7t5icbOPLE2joK6P5pxjjcI/0RPUTx7AUwlwVSN1PDrCcDzjXnqyWhHxSSxWtu6gn26/GL7VbcoNB1ta0iPSjno1+v0r0P4FfL8/XqxgHq1+La/cw4ytvLStBLqwE0CkdU5xmIwUBkwmoVAg/u42mSkpq+g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <03fa79ed-2b24-8329-36fd-dd8edc14fa72@amd.com>
Date: Thu, 11 May 2023 09:49:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 4/6] pci/arm: Use iommu_add_dt_pci_device() instead of
 arch hook
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Paul Durrant
	<paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20230501200305.168058-1-stewart.hildebrand@amd.com>
 <20230501200305.168058-5-stewart.hildebrand@amd.com>
 <ced11c6e-caf7-3a19-92c8-5c11b18952b6@suse.com>
 <8591236e-5dc2-7da7-fe3a-7cb2ae1ed7d0@amd.com>
 <462657d4-72e7-6266-6ea5-2b9e443f9813@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <462657d4-72e7-6266-6ea5-2b9e443f9813@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT071:EE_|CH3PR12MB8075:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d46e0f5-a9c2-4513-996b-08db52268ef6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PlzIOZzGKhNmD+KuQHlGmKB242hIazUJvjntDpZlpN8IKbQTRrPjj82WDXF/6pDUFRj0euJBJPPdoQxMyQNnLLI17Y6DOYHJv5Wn0nCi48EA6Z+UPCF1ZkHQlxKSbUiA4/Y+UBkAKzHiqGlz2wI75vXloA79h+r4mAeyy+k/nr5Qbza+C+DgN+lc7a6kljyOqYj2GNyUoRibqPTlti2NdUNqyb0KUePBzpbboTugIVlipuCLem3LiJBltR7uxUUVBGvG3qaQpdjEnHvLvlTZ1hOhFjqL1hxl8zCz45Xo2CIbI/yDNUPfMzC0VR1ZpT6SaIbsGv6ewLKrvCDGsJexLnxzUHcOYuIeTJsmsL8q9yB42i5/rqkh87tMGrkkGryrUkx8mAleZfexbmWoK/tqJD/S0+2GzBY8zfDd3GSeyH/Vp1Xg93lCNZs8jU9bvG377tiCKY6K++38LznYN3uqhjANXJ8oe0vpAzXdpxQ7LncRzt4P23zLhCCSix3tP2Ob771gna+8NOfOtlI1I372yx40IdZ0/YZsZQGPC83v1523WqsS0Rs55lswYdJelVQ0NyzIL45AikrdNezAL2Ya2UKgJhCdDarvTOInXvDhSevz6D33da5z8T6cwAPC+segCNUg4EwmcpXwXxjZ43AdLIPNBsUvoGq9bhDMemmAg94Q66Tp2rtDKv3Mjdnk7+sYylstPIbhUF9s7PoljJc/T2sPxLrytnGvZNBdMXD6U6AFoBXHDtGjmV4Y67qdufkmgnlZegALdCFMFCmAN3UU4w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199021)(46966006)(36840700001)(40470700004)(4326008)(6916009)(8676002)(82310400005)(478600001)(70586007)(41300700001)(70206006)(31686004)(82740400003)(8936002)(31696002)(44832011)(316002)(86362001)(5660300002)(54906003)(16576012)(26005)(53546011)(40460700003)(2906002)(186003)(81166007)(47076005)(356005)(2616005)(83380400001)(336012)(36756003)(40480700001)(426003)(36860700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 13:49:36.3349
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d46e0f5-a9c2-4513-996b-08db52268ef6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT071.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8075

On 5/8/23 10:51, Jan Beulich wrote:
> On 08.05.2023 16:16, Stewart Hildebrand wrote:
>> On 5/2/23 03:50, Jan Beulich wrote:
>>> On 01.05.2023 22:03, Stewart Hildebrand wrote:
>>>> --- a/xen/drivers/passthrough/pci.c
>>>> +++ b/xen/drivers/passthrough/pci.c
>>>> @@ -1305,7 +1305,7 @@ __initcall(setup_dump_pcidevs);
>>>>
>>>>  static int iommu_add_device(struct pci_dev *pdev)
>>>>  {
>>>> -    const struct domain_iommu *hd;
>>>> +    const struct domain_iommu *hd __maybe_unused;
>>>>      int rc;
>>>>      unsigned int devfn = pdev->devfn;
>>>>
>>>> @@ -1318,17 +1318,30 @@ static int iommu_add_device(struct pci_dev *pdev)
>>>>      if ( !is_iommu_enabled(pdev->domain) )
>>>>          return 0;
>>>>
>>>> +#ifdef CONFIG_HAS_DEVICE_TREE
>>>> +    rc = iommu_add_dt_pci_device(devfn, pdev);
>>>> +#else
>>>>      rc = iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev));
>>>> -    if ( rc || !pdev->phantom_stride )
>>>> +#endif
>>>> +    if ( rc < 0 || !pdev->phantom_stride )
>>>> +    {
>>>> +        if ( rc < 0 )
>>>> +            printk(XENLOG_WARNING "IOMMU: add %pp failed (%d)\n",
>>>> +                   &pdev->sbdf, rc);
>>>>          return rc;
>>>> +    }
>>>>
>>>>      for ( ; ; )
>>>>      {
>>>>          devfn += pdev->phantom_stride;
>>>>          if ( PCI_SLOT(devfn) != PCI_SLOT(pdev->devfn) )
>>>>              return 0;
>>>> +#ifdef CONFIG_HAS_DEVICE_TREE
>>>> +        rc = iommu_add_dt_pci_device(devfn, pdev);
>>>> +#else
>>>>          rc = iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev));
>>>> -        if ( rc )
>>>> +#endif
>>>> +        if ( rc < 0 )
>>>>              printk(XENLOG_WARNING "IOMMU: add %pp failed (%d)\n",
>>>>                     &PCI_SBDF(pdev->seg, pdev->bus, devfn), rc);
>>>>      }
>>>
>>> Such #ifdef-ary may be okay at the call site(s), but replacing a per-
>>> IOMMU hook with a system-wide DT function here looks wrong to me.
>>
>> Perhaps a better approach would be to rely on the existing iommu add_device call.
>>
>> This might look something like:
>>
>> #ifdef CONFIG_HAS_DEVICE_TREE
>>     rc = iommu_add_dt_pci_device(pdev);
>>     if ( !rc ) /* or rc >= 0, or something... */
>> #endif
>>         rc = iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev));
>>
>> There would be no need to call iommu_add_dt_pci_device() in the loop iterating over phantom functions, as I will handle those inside iommu_add_dt_pci_device() in v2.
> 
> But that still leaves #ifdef-ary inside the function. If for whatever reason
> the hd->platform_ops hook isn't suitable (which I still don't understand),

There's nothing wrong with the existing hd->platform_ops hook. We just need to ensure we've translated RID to AXI stream ID sometime before it.

> then - as said - I'd view such #ifdef as possibly okay at the call site of
> iommu_add_device(), but not inside.

I'll move the #ifdef-ary.

