Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F786FB268
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 16:16:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531590.827357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw1ez-0005JS-77; Mon, 08 May 2023 14:16:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531590.827357; Mon, 08 May 2023 14:16:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw1ez-0005Hj-4N; Mon, 08 May 2023 14:16:17 +0000
Received: by outflank-mailman (input) for mailman id 531590;
 Mon, 08 May 2023 14:16:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CHwn=A5=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pw1ex-0005HZ-Ev
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 14:16:15 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060b.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0ceb653-edaa-11ed-8611-37d641c3527e;
 Mon, 08 May 2023 16:16:10 +0200 (CEST)
Received: from MW4PR04CA0310.namprd04.prod.outlook.com (2603:10b6:303:82::15)
 by PH7PR12MB8013.namprd12.prod.outlook.com (2603:10b6:510:27c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 14:16:06 +0000
Received: from CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::67) by MW4PR04CA0310.outlook.office365.com
 (2603:10b6:303:82::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32 via Frontend
 Transport; Mon, 8 May 2023 14:16:05 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT023.mail.protection.outlook.com (10.13.175.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.32 via Frontend Transport; Mon, 8 May 2023 14:16:05 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 8 May
 2023 09:16:04 -0500
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 8 May 2023 09:16:04 -0500
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
X-Inumbo-ID: e0ceb653-edaa-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQMT5htmryGeYazIRpQR41F4hFEmIRZ3+fgpR/huG7vdquIwh2SWUILEqNx0WJq3dqSea+wgdrYf393oA7AvC7QBW6k99gJWao4a1Z5MQWvBcxOB/lu28/64g0FAmBPduDRG6XAtku59m7e5GJOrYQq80XI98j3IKPnhmm26ZHf9LlGU7I5zfe+Jpl0wGqdAIbFdudlbWqXZk8LZtZR44xnnAOuTe12Olg3ci3mzds8ZjE9tZvUPoq9b1ud+T6dqWBs9Sj0l8SJQFwUlQsO/vLCww17bWnwxTRWwE+9UCzCM05rESCK8FzXo/Zc7DZM7pX5wCIx8MIBnkUpbMupUUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZxyRAMPyNArOT31T7QCsvLYjetxz3AUpOEcPbV16r98=;
 b=KXvyD6+41+XPNgDNNNciwTeWID18+Q7nMoGmWA8cxV3fyQEWQNTU902VMmr/Kj5fM+c33/MM5vx3UD4x9uwAhy+jxy0ityh+cYiRG7tv02bEDjr/B49wIsvoi+6g2OXDhJ55Q4fLg0psZ0voegv1xMbzLTQOFJfT0wK6c6V/WL1vdo3nDLUWbOxf5ws16FVv8cH4d5XRwRPEPfF50efNJW7IQ1EKIFdGJnMQnFUlAm/Eo7Ydfamj07PkQWjY7LcOZWi9Bvi+5F3nAC2cSndVMc//1+kENIbHjoACiSAYhafld7l4TQsmlqtM/qwm8H/gyZrjk0mFaeDbEVUw6WELgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxyRAMPyNArOT31T7QCsvLYjetxz3AUpOEcPbV16r98=;
 b=LLouR+ChQQE1xice0b9QgKYKdT/f9cKIM475uXls+1IebGx9O2WUBFGw4tAoDWBmSjxPF4FXJwgovvR083ftD7C7QaN6lMzXCrJNZGdPQX9hVaRuSIbR1yjBKiJThyIcx1PlONKWd5eq8r7QjU6KrCWJ5o6FugLa2qXg1c4l57g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <8591236e-5dc2-7da7-fe3a-7cb2ae1ed7d0@amd.com>
Date: Mon, 8 May 2023 10:16:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 4/6] pci/arm: Use iommu_add_dt_pci_device() instead of
 arch hook
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Paul Durrant
	<paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20230501200305.168058-1-stewart.hildebrand@amd.com>
 <20230501200305.168058-5-stewart.hildebrand@amd.com>
 <ced11c6e-caf7-3a19-92c8-5c11b18952b6@suse.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ced11c6e-caf7-3a19-92c8-5c11b18952b6@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT023:EE_|PH7PR12MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: 5af86cf0-4090-4b29-454c-08db4fcec31b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pOG1PcJYov8H5dMUKjYBRyneTA6SS0OQM8wdxbjTPsyOP2kpoKnhQWogvJt1xqg8+Vf593dMmd4ivQYWfiKALQRctFpiipXXLtV2cXO8St1IcD9Dem8kaJZIMyvD3k9oDph6WStGQXoIbDibf6NUmD/aXwB99elabRD8ny5TdDgX6J2FTvrFG2jIAcNOcz+rGX1UPDaW52AU2Bt0i4A9JZYiUvcxqiGcyKhY0FXt+K3I52EhOhlPVUE6YyauVi7RBofTvh4zRaZmwYcLBBkdsdKZXL7OnWn+YQv6c3qFhixU2OKtezK9g7vHY0os4FjtUN2iFTfjDRXHGxEguJqmencXoaZsw6Gjk+q73NvDe6PE0r8K5R+qKApLVUvSRGWNO+eFa7Fdpr4LQ93qoppfXWW7QqeiuHz/q8O3H7S6mXMFIXLeCYPFTqBFfVMXEr1ToyYh2mX0nVAyxZ1WTKy7aCJsXlLaNxUTSY1ue/r23zxHOXk68WPHukJPL5Fe0hArgqf1+7Kw4iZsE5XaVt92HwxmrmpI14Hb7k6Bp4AEbhh0gsReMBZ109fAKcUG8dGqaMfw5Pi3uCMNofKf48YmS8FS6P/5b+GTWni7rC4BK8IJ5rBDtsIsVJgS1k2iSxGTebGr/bCTvcmNqUXEcuG4kfVk9FcMbvBT9n2RulFTlvukN6c+o/5FXlCyuppzW+5A1nku7FmptCpdPPNVDksR3DETWslTOSIb3Q99h6+mDNerZCSDYJqxVEHsdlWcnh2TOhXBcS8/OoZwtha3kbbe/A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199021)(36840700001)(46966006)(40470700004)(40480700001)(81166007)(356005)(82740400003)(36860700001)(47076005)(2616005)(426003)(26005)(186003)(336012)(83380400001)(53546011)(70586007)(2906002)(8676002)(44832011)(8936002)(36756003)(478600001)(31696002)(40460700003)(54906003)(16576012)(86362001)(316002)(6916009)(5660300002)(4326008)(41300700001)(70206006)(82310400005)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 14:16:05.6540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af86cf0-4090-4b29-454c-08db4fcec31b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8013

On 5/2/23 03:50, Jan Beulich wrote:
> On 01.05.2023 22:03, Stewart Hildebrand wrote:
>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -1305,7 +1305,7 @@ __initcall(setup_dump_pcidevs);
>>
>>  static int iommu_add_device(struct pci_dev *pdev)
>>  {
>> -    const struct domain_iommu *hd;
>> +    const struct domain_iommu *hd __maybe_unused;
>>      int rc;
>>      unsigned int devfn = pdev->devfn;
>>
>> @@ -1318,17 +1318,30 @@ static int iommu_add_device(struct pci_dev *pdev)
>>      if ( !is_iommu_enabled(pdev->domain) )
>>          return 0;
>>
>> +#ifdef CONFIG_HAS_DEVICE_TREE
>> +    rc = iommu_add_dt_pci_device(devfn, pdev);
>> +#else
>>      rc = iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev));
>> -    if ( rc || !pdev->phantom_stride )
>> +#endif
>> +    if ( rc < 0 || !pdev->phantom_stride )
>> +    {
>> +        if ( rc < 0 )
>> +            printk(XENLOG_WARNING "IOMMU: add %pp failed (%d)\n",
>> +                   &pdev->sbdf, rc);
>>          return rc;
>> +    }
>>
>>      for ( ; ; )
>>      {
>>          devfn += pdev->phantom_stride;
>>          if ( PCI_SLOT(devfn) != PCI_SLOT(pdev->devfn) )
>>              return 0;
>> +#ifdef CONFIG_HAS_DEVICE_TREE
>> +        rc = iommu_add_dt_pci_device(devfn, pdev);
>> +#else
>>          rc = iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev));
>> -        if ( rc )
>> +#endif
>> +        if ( rc < 0 )
>>              printk(XENLOG_WARNING "IOMMU: add %pp failed (%d)\n",
>>                     &PCI_SBDF(pdev->seg, pdev->bus, devfn), rc);
>>      }
> 
> Such #ifdef-ary may be okay at the call site(s), but replacing a per-
> IOMMU hook with a system-wide DT function here looks wrong to me.

Perhaps a better approach would be to rely on the existing iommu add_device call.

This might look something like:

#ifdef CONFIG_HAS_DEVICE_TREE
    rc = iommu_add_dt_pci_device(pdev);
    if ( !rc ) /* or rc >= 0, or something... */
#endif
        rc = iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev));

There would be no need to call iommu_add_dt_pci_device() in the loop iterating over phantom functions, as I will handle those inside iommu_add_dt_pci_device() in v2.

> The != 0 => < 0 changes also would want, after respective auditing,
> clarifying that they're indeed no functional change to existing code.

Okay.

Stewart

