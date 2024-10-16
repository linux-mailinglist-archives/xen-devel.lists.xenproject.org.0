Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8419A1017
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 18:51:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820206.1233669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t17Eg-000166-VW; Wed, 16 Oct 2024 16:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820206.1233669; Wed, 16 Oct 2024 16:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t17Eg-00014K-Sc; Wed, 16 Oct 2024 16:50:58 +0000
Received: by outflank-mailman (input) for mailman id 820206;
 Wed, 16 Oct 2024 16:50:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GkAW=RM=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1t17Ef-000149-Ru
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 16:50:58 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20619.outbound.protection.outlook.com
 [2a01:111:f403:2413::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf20b591-8bde-11ef-a0be-8be0dac302b0;
 Wed, 16 Oct 2024 18:50:55 +0200 (CEST)
Received: from SJ0PR03CA0222.namprd03.prod.outlook.com (2603:10b6:a03:39f::17)
 by SA1PR12MB6799.namprd12.prod.outlook.com (2603:10b6:806:25b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 16:50:50 +0000
Received: from SJ5PEPF000001F3.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::f2) by SJ0PR03CA0222.outlook.office365.com
 (2603:10b6:a03:39f::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17 via Frontend
 Transport; Wed, 16 Oct 2024 16:50:50 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001F3.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Wed, 16 Oct 2024 16:50:50 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Oct
 2024 11:50:49 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Oct
 2024 11:50:49 -0500
Received: from [192.168.122.223] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Oct 2024 11:50:48 -0500
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
X-Inumbo-ID: cf20b591-8bde-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+wYaKfKbMui2IHBN7ORnbeCu3RnrJvC3aPdp6iv0brN0QmIpVdPYc5tkF067iHMwZjqZTVCJxB/I6KuxKpW5Y4LKXqMhYtM9pDmEWfxnDOXxCHvC0CHevbLtmGlHwva0fsoUS3+D1m0zjfCygmnpOM59evyhR2UzPwm4GtuzHxveqO+W6e4H8Iznu8NKFXnMymFqOEkbf6CCYX9Lih4O+kdTTw6N/AdbEaabNQ6sAi2W6UFHKx02RUuFI+BZ9YwM4b57huIqHxaF/VA+3/s2QyxpHe924r5PRMx3uE0ZSl036lJmA3rTSo89rAcvctk/ihhKHtXDmcJrYnkV1ZeWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AI7nWlRNn4ew8lhTB9IFeLafBt7X7W9FtcQ6fobuRc4=;
 b=cWVJtTnEA7YYOObGRvZil6ZE0aDGZZ+rA2Z0BMfcSnhOOk/ksDpEgH3sHyBitLEMYwSWAfghDN48jctTSYNZpmbIE+6FPtbAPnaDHKL+HJ0iD1gFU/x3WzCqprb3qa1d6jp24bpmphqbtUw+hkmy2oxTwVk8bDAJ5nAD+fZh8w1C+xuCKFbIY9hV5d7pz94GtSHAkI2s/OwMD2DjyeW5VX/v4Vz3LtlbJVvX/i5TTzKpgiSnhgIc4T//i8vwR8dTFBStfztp+3Fkiym+iFIXtTRb+e2YY6nWYOYieKsoqi/yWOcxde8XpuFd5qa/4nEgqLZaqQrXVYsGmaNb3WXqOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AI7nWlRNn4ew8lhTB9IFeLafBt7X7W9FtcQ6fobuRc4=;
 b=aIisDn/pAXygyjrITYOeitD3YccdNXf7v/Nae5N5dqnXMvif4msRKRnNz8BK9DgOLo8msRnJkea/89heEpqTn3Qdud+hi801WfC6Y2te7UA6jraSDKLMZooR2lkq8uVOYF/imnCjk/R7EYErxTUUnelj/o8B/bZi5/n7YifoVOo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <881998fc-f239-4ddf-9730-eb3d151fbf16@amd.com>
Date: Wed, 16 Oct 2024 12:50:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] xen/pci: introduce PF<->VF links
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
References: <20241011152727.366770-1-stewart.hildebrand@amd.com>
 <20241011152727.366770-3-stewart.hildebrand@amd.com>
 <46e66868-6ddc-4037-8c3a-5a60b39d8b73@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <46e66868-6ddc-4037-8c3a-5a60b39d8b73@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F3:EE_|SA1PR12MB6799:EE_
X-MS-Office365-Filtering-Correlation-Id: e78fc79e-7899-4f79-5fcc-08dcee02b0d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?STB1cTgrWXZ5QWxTemxac1FndFJaYk10S0swbkdMUzBadkt1bnZ0c3RxVm1S?=
 =?utf-8?B?K3VVNkZjdlNBbGFjcGR3b0Uzb1VaTkZDWUZBUE1NeG1IazIxT2hjNU5HYUtn?=
 =?utf-8?B?dWhoV25zQWVPS2pPM0hNSXB2TWNKbkNIUHA2RjBQcTNHdHhoTWxXZCtrUHQy?=
 =?utf-8?B?a1M3bldoajFzV2djM0Q5djFLclNOT0crT045Mk55cjIvSGxxVzYyYTQxNkFk?=
 =?utf-8?B?dWJIZCt2SndlN090Uk5UMWlVMkRCSVZmMjdOSnNwb3JubjRpbFJ5cEtsZVg0?=
 =?utf-8?B?eU5pTXRER3hYNXhuQU5HN2xvVDVVNTlpdHpCdHRTWkRIbU0wTmZSTktWUHNT?=
 =?utf-8?B?S2FSYk05cHZWVFBaR0Y5Y21wMXJNY3prSFVDMkg0Z0F1R2hrM0FPSU9MOEZr?=
 =?utf-8?B?dWxjRkd0Z2hMZHFLem5XVHV2bTFCYkxZYVoxTWhNbG9rc3BmTDMzam5oUlZ6?=
 =?utf-8?B?WE1BV1E5UHk3M1gvTXNOU2l2U0VjYWpUNlRUTlFOcnZHS3FiMjRycVBlRTFO?=
 =?utf-8?B?UmkxOG1yTW0rMTNUalBjRGdlUTUvOHp0T3VJZkhJeXVCOWdpU1RWR1FUWk0y?=
 =?utf-8?B?QkU4RkNnNGNrTzhJNU5mMmE4SVF4OFp2NkxURXgxUGd4LytQb1FSbThuWXNB?=
 =?utf-8?B?MGJZd05JdENkais5RFpsY0FYQnhmcDVzaGtPZHBNQURSaWM5SnRROWtJbXVX?=
 =?utf-8?B?Z1QrUGRYU2JzQURKdXh1M1ovOWltSVMzM0laNk1BMnpMNURHYTdYcGw2S3pS?=
 =?utf-8?B?aHpiK0o0Qi92WHJ0b2UrZVdrWHVEMDlSV08xNm1TUEpJWXBCOGkrL1BxZE8y?=
 =?utf-8?B?SnpBUHlJRVJIRG10ZjlScGhpeW5UZXVJODd2M0xIUFo2TE5ncGEzQS9ncUNX?=
 =?utf-8?B?WmtDUWczMU9qM3duSG5vbytjRWFnekoyemhVenYvZC91RUdEd0NWZ3NISGs3?=
 =?utf-8?B?YlpJS1NvNW5CMXhpM1FFT29PQXVHUEF3SkJMWGNvbkIvYWNjSzU3TEtKdVY3?=
 =?utf-8?B?NFlDR1NzdVhuKzhwOHpvOW0yb1p1V1dSUnNzKzJRVUlCbk9sT0V5cVNNd3Rv?=
 =?utf-8?B?Vk1PMThodkhDRmswVUFsem0yTUo1VHJDa21IMDNjTkRwdXplMFk2VU4zTDl2?=
 =?utf-8?B?Y0VRNm1HdHdSRUdVOWFWU0phMGdVWjduc1EwMlV5TEFUMWpOVENUd3RVaWVB?=
 =?utf-8?B?U0VzTHdFblpkNGQ1bGtUaWM2ek8vYjZkV3E4UzhZNGZjY0VOWFY2RnlKWW5K?=
 =?utf-8?B?T0liOTZCTDBnRzRkU0t2QU44Uk1iM3JvNjA4YnVkS2xPREpxaGNMK3lqQUE1?=
 =?utf-8?B?Ulh5K3dIdmNWbEE4Zy9DcSt0bkdCbUNtZWt6WXpURTlkQnpPQW01eEM0c29D?=
 =?utf-8?B?UzIxZjcwYzdMY0NiYmZwcUljUTFSalM1cEVkMmZpQXQ2WmhpMHVURFZGQS9h?=
 =?utf-8?B?dWgvT0x5V2VJY1NRUlE5YjdSLzRXYXJmYm5raTBJVGt5Y2Y3UWZ5Tk94NkdJ?=
 =?utf-8?B?NmFKdkYxZUFVUnpJM0RzdEhSdkY2bjIyV3RPeW5uZy9FbjQyRzJiWEc0Ykpa?=
 =?utf-8?B?cFI0dkxURU1CSE4yeHB3QldBZVh2cVZlNmh2T1dYN0VOS2dET0YxeTN1ZDU4?=
 =?utf-8?B?cGdKYllxWEdxbnc3ZzFycUFzS0g1ODNaL1ZlNm1FQldUVUo1djRxQ05naFds?=
 =?utf-8?B?eHF4NC9Ya1NZY0NLa0FCOUVvTnFiQXVqbndCbVJTOGo2ajhscFdyaGE5TXc5?=
 =?utf-8?B?N0p3T1lGTGtvVGlIYmorZnBGNUs4SERTKzFXNStMeEdORnEvYnFSUlBPTkpl?=
 =?utf-8?B?dDRNV3ZPcFJ2VnJEWXBtZ3l5c2xXTTBxcFA2VmdvSHB1L2Njdzh2TjVINDZV?=
 =?utf-8?Q?XjWOaboN2Qw4h?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 16:50:50.2324
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e78fc79e-7899-4f79-5fcc-08dcee02b0d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6799

On 10/16/24 05:52, Jan Beulich wrote:
> On 11.10.2024 17:27, Stewart Hildebrand wrote:
>> Add links between a VF's struct pci_dev and its associated PF struct
>> pci_dev. Move the calls to pci_get_pdev()/pci_add_device() down to avoid
>> dropping and re-acquiring the pcidevs_lock().
>>
>> During PF removal, unlink VF from PF and mark the VF broken. As before,
>> VFs may exist without a corresponding PF, although now only with
>> pdev->broken = true. If the PF is removed and re-added, dom0 is expected
>> to also remove and re-add the VFs.
> 
> Right, or else the VF struct instance would remain orphaned the way you've
> implemented this. Question is whether it is a reasonable assumption that a
> Dom0 which failed to remove the VFs during PF removal might later
> "remember" that it still needs to report VFs removed. I for one doubt that.

This matches my observations: you're right, it most likely won't. I had
just written it in a misleading way in the commit message. Re-adding
should not occur until after VFs and PF have been removed in non-buggy
scenarios.

A PF driver that fails to disable SR-IOV (i.e remove VFs) during PF
removal is buggy, and would lead to issues inside dom0 as well due to
the orphaned/stale VF left behind in Linux dom0 itself. As mentioned in
patch #1, Linux warns about this:

[  100.000000]  0000:01:00.0: driver left SR-IOV enabled after remove

With the PF<->VF links in place, we now also have the ability to detect
and warn about this potentially buggy condition in Xen. I have so far
only observed VF-then-PF removal order in non-buggy scenarios. My only
hesitation with adding such a warning in Xen is that I don't know
whether removing in PF-then-VF order is legitimate.

In the previous rev I had Xen removing the VFs during PF removal. In
this rev, I chose to continue to rely on dom0 to remove VFs because:
  1. This is the expected behavior as far as I can tell.
  2. It more accurately mirrors the state of the VFs and PFs in dom0 and
     Xen.
  3. No need to consider special cases when xsm has different policies
     for PF and VF removal operations.

Perhaps the last sentence would be better written as:
"The hardware domain is expected to remove the associated VFs before
removing the PF. Print a warning in case a PF is removed with associated
VFs still present."

Or, not implying any removal order:
"If the PF is removed, the hardware domain is expected to also remove
the associated VFs."

I'm personally leaning toward not implying any removal order (i.e. same
situation as before this patch).

>> @@ -703,7 +696,44 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>           * extended function.
>>           */
>>          if ( pdev->info.is_virtfn )
>> -            pdev->info.is_extfn = pf_is_extfn;
>> +        {
>> +            struct pci_dev *pf_pdev;
>> +
>> +            pf_pdev = pci_get_pdev(NULL,
>> +                                   PCI_SBDF(seg, info->physfn.bus,
>> +                                            info->physfn.devfn));
>> +
>> +            if ( !pf_pdev )
>> +            {
>> +                ret = pci_add_device(seg, info->physfn.bus, info->physfn.devfn,
>> +                                     NULL, node);
>> +                if ( ret )
>> +                {
>> +                    printk(XENLOG_WARNING "Failed to add SR-IOV device PF %pp for VF %pp\n",
>> +                           &PCI_SBDF(seg, info->physfn.bus, info->physfn.devfn),
>> +                           &pdev->sbdf);
>> +                    free_pdev(pseg, pdev);
>> +                    goto out;
>> +                }
>> +                pf_pdev = pci_get_pdev(NULL,
>> +                                       PCI_SBDF(seg, info->physfn.bus,
>> +                                                info->physfn.devfn));
>> +                if ( !pf_pdev )
>> +                {
>> +                    ASSERT_UNREACHABLE();
>> +                    printk(XENLOG_ERR "Failed to find SR-IOV device PF %pp for VF %pp\n",
>> +                           &PCI_SBDF(seg, info->physfn.bus, info->physfn.devfn),
>> +                           &pdev->sbdf);
>> +                    free_pdev(pseg, pdev);
>> +                    ret = -EILSEQ;
>> +                    goto out;
> 
> Might be helpful to have the printk() ahead of the ASSERT_UNREACHABLE(), in the
> unlikely event that the assertion would actually trigger.

Agreed.

> Positioning doesn't
> make a difference for release builds anyway.
> 
> Jan


