Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A97107A68BF
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 18:21:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604946.942507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qidSz-0007dc-St; Tue, 19 Sep 2023 16:20:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604946.942507; Tue, 19 Sep 2023 16:20:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qidSz-0007az-Q8; Tue, 19 Sep 2023 16:20:49 +0000
Received: by outflank-mailman (input) for mailman id 604946;
 Tue, 19 Sep 2023 16:20:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iEDo=FD=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qidSx-0007at-Kj
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 16:20:47 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060b.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7bc430b7-5708-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 18:20:45 +0200 (CEST)
Received: from BL1PR13CA0300.namprd13.prod.outlook.com (2603:10b6:208:2bc::35)
 by MN2PR12MB4157.namprd12.prod.outlook.com (2603:10b6:208:1db::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 16:20:42 +0000
Received: from BL6PEPF0001AB57.namprd02.prod.outlook.com
 (2603:10b6:208:2bc:cafe::9) by BL1PR13CA0300.outlook.office365.com
 (2603:10b6:208:2bc::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28 via Frontend
 Transport; Tue, 19 Sep 2023 16:20:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB57.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Tue, 19 Sep 2023 16:20:41 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 19 Sep
 2023 11:20:41 -0500
Received: from [172.20.57.36] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 19 Sep 2023 11:20:40 -0500
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
X-Inumbo-ID: 7bc430b7-5708-11ee-8789-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RqfLgmJJF2mw2I9RWxXYeNV1inCX/TxBXfbW4VychdQp9xuGsCpDI7bXi2kU2mkXphITpgAIL3kBVSZDOcTGkRhvFJAsTbOtK+n0izE3/C9lJ5/okS9lGwmzgjhAwK/vfDJSxXOg0TegsUh5IxWqZO8vkWI+bRjLxyAbQokqxFlCfZEGfrK9xcCtPCOxf5SkpTrXMAU1smO/hAc1ezu46pEaSO+iTQ9RzWUHPmjoEe/b+qC00Ly3AnHK39sJ1Q/R2hAjKB9YlWaVPpr/nNZJv1xfI4iK4vdcS84gAPwbJqurrwIBjvf6qfSxfKSTm0yTwZo7wpX8iH7+xmBMA2DjZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCFtHw+l00lMpqOWl4dOGG1vK2c6cExOe765SyYgVIM=;
 b=AjzOg9YVEhy9SOk5D1CPmMfpsg3NEmOpfprUEF1S02eU4RH/d079KyWlRxw5dtuCvtRd7uipMRWsl2kWvMOf+tCvxl5qmIWTSHUuk70amsqqr81BQkUhz28KMxTtXDOGklAk6vkoFWSnYZ2zXigshnJw0lHS2/Sv7rmxyWUib8tdvizWRGaiKdOekjjCneV5YA32IdDXFlxJa/uISRCst5N2qLmuUlmElbk/PdJhvjmnylqbPoqONhIgonWAvRySqS7MA9bKdZDCzIN2GFuihtUlWK6yN9+dQkpGwE2bhji8fSCRJrDA2EIc/pSMSmstEkB8aQoOa93hl1pKhDa72w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCFtHw+l00lMpqOWl4dOGG1vK2c6cExOe765SyYgVIM=;
 b=EqeQ25lY0kggJ+yQu/gl0JU4xNXs8CGhqmAYikO+cuaqIqDXcZW589alUiUjJpfGRFEbME5/gCmax4WrkXUTZCXdUpfUa1/LkC8714PFpMDbAVuGG4l1FVs2sWrLkFTfWBeopVLKVMQSvum+yONjWTR/hCT376E8Rb01C/bNDes=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <98b8c131-b0b9-f46c-5f46-c2136f2e3b4e@amd.com>
Date: Tue, 19 Sep 2023 12:20:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v9 02/16] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-3-volodymyr_babchuk@epam.com>
 <ZQnAvNSDn0WB13Gn@MacBookPdeRoger>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ZQnAvNSDn0WB13Gn@MacBookPdeRoger>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB57:EE_|MN2PR12MB4157:EE_
X-MS-Office365-Filtering-Correlation-Id: 333c0733-536b-4dae-249f-08dbb92c5e85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dmFaa5N3usYbCwSU6yjO6kIpCNd4BCdZPA+hNHAqYeTXVk+5DCY5f4MjUIfLrJ26NKMfrDE3sNKWVGPTV1E0PAR7GXHP6XDK8MNJ28BYqPUhp0LSbuEjF950ORmARYqIZlioEzb2xaaj0C1sW33s9diyb3v5UtVXeyaOwMTIfjlKT+TKCiovACgudvtYAcnmCmY1DhtTInT197aCOlDMf484WDpc9LZRpD72kYKXZY47lUKfHvFUhIsObdRBxQOt3Q1MQhQ40Q0m/DjaAsZzHuZJB/HGrCbNoFLQsAG2Ae9gpT7yQExeKBJKBwPGS7v+4on1ckjso0EBY+GxVm5U0wqR8vbx/JTOTg3O3TDw29uYGTdQZQhRTxjdtJ4cpPObH99AHLz94BXJmbu+dlSElpYxrB+Nwz3QU2fkPwxqkJKQ+McPHVv4vkmzgqx+k/qGtJ8dgql1oKS0knqKs6rJxNHxVLRDSeg4OA9ML7StHcI8LQ997tosLuOofeAKKCJGWfQMS50u6XBLu2E9xEymCr37buHuV/cl00eu4C2mYqzHaom2VbdMJ8dphFGkGFLAmZrtCP/lM+oqY6NcAPz0dhoO2QbXJyUnsAGYFInGew6mky5dos0cg7PUQV3L2ZFPnIYvWs/Y7SF1IM6kPwhNsdoj9LS5Y9nOavzO7MFLZ7s3toSLInFQKrnUGGPw+n4oGVfkVA0Jj9jynyEZz69LJ0/Cwck8f5Unud3p2rSNGG90SOpQ8S09DLeEPjVnnz+lTlLXcIffprG92Urln5LmYWQMTVyYJiVqgm9Xj9RFWhM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(136003)(376002)(82310400011)(186009)(1800799009)(451199024)(46966006)(40470700004)(36840700001)(53546011)(40460700003)(83380400001)(82740400003)(81166007)(356005)(86362001)(31696002)(36860700001)(47076005)(36756003)(2616005)(426003)(40480700001)(26005)(336012)(31686004)(4326008)(16576012)(7416002)(41300700001)(316002)(8936002)(8676002)(2906002)(70586007)(70206006)(54906003)(110136005)(478600001)(5660300002)(44832011)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 16:20:41.8071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 333c0733-536b-4dae-249f-08dbb92c5e85
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB57.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4157

On 9/19/23 11:39, Roger Pau Monné wrote:
> On Tue, Aug 29, 2023 at 11:19:42PM +0000, Volodymyr Babchuk wrote:
>> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
>> index 8f2b59e61a..a0733bb2cb 100644
>> --- a/xen/drivers/vpci/msi.c
>> +++ b/xen/drivers/vpci/msi.c
>> @@ -318,15 +321,28 @@ void vpci_dump_msi(void)
>>                       * holding the lock.
>>                       */
>>                      printk("unable to print all MSI-X entries: %d\n", rc);
>> -                    process_pending_softirqs();
>> -                    continue;
>> +                    goto pdev_done;
>>                  }
>>              }
>>
>>              spin_unlock(&pdev->vpci->lock);
>> + pdev_done:
>> +            /*
>> +             * Unlock lock to process pending softirqs. This is
>> +             * potentially unsafe, as d->pdev_list can be changed in
>> +             * meantime.
>> +             */
>> +            read_unlock(&d->pci_lock);
>>              process_pending_softirqs();
>> +            if ( !read_trylock(&d->pci_lock) )
>> +            {
>> +                printk("unable to access other devices for the domain\n");
>> +                goto domain_done;
> 
> Shouldn't the domain_done label be after the read_unlock(), so that we
> can proceed to try to dump the devices for the next domain?  With the
> proposed code a failure to acquire one of the domains pci_lock
> terminates the dump.
> 
>> +            }
>>          }
>> +        read_unlock(&d->pci_lock);
>>      }
>> + domain_done:
>>      rcu_read_unlock(&domlist_read_lock);
>>  }
>>

With the label moved, a no-op expression after the label is needed to make the compiler happy:

            }
        }
        read_unlock(&d->pci_lock);
 domain_done:
        (void)0;
    }
    rcu_read_unlock(&domlist_read_lock);
}


If the no-op is omitted, the compiler may complain (gcc 9.4.0):

drivers/vpci/msi.c: In function ‘vpci_dump_msi’:
drivers/vpci/msi.c:351:2: error: label at end of compound statement
  351 |  domain_done:
      |  ^~~~~~~~~~~

