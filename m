Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE8595D4D7
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 20:02:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782574.1192080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shYcU-00034B-Ga; Fri, 23 Aug 2024 18:02:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782574.1192080; Fri, 23 Aug 2024 18:02:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shYcU-00030x-D5; Fri, 23 Aug 2024 18:02:42 +0000
Received: by outflank-mailman (input) for mailman id 782574;
 Fri, 23 Aug 2024 18:02:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S9BN=PW=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1shYcT-00030p-5l
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 18:02:41 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2417::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1c406d5-6179-11ef-8776-851b0ebba9a2;
 Fri, 23 Aug 2024 20:02:39 +0200 (CEST)
Received: from CH0PR04CA0049.namprd04.prod.outlook.com (2603:10b6:610:77::24)
 by SN7PR12MB8028.namprd12.prod.outlook.com (2603:10b6:806:341::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 18:02:33 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::48) by CH0PR04CA0049.outlook.office365.com
 (2603:10b6:610:77::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19 via Frontend
 Transport; Fri, 23 Aug 2024 18:02:33 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 18:02:33 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 13:02:32 -0500
Received: from [172.20.142.25] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 23 Aug 2024 13:02:31 -0500
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
X-Inumbo-ID: e1c406d5-6179-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GK8rCIA2VuON1aBW4iZhomC0nD6WFRYxBGmH294rNbm+SPTJX5keYkBvzXR4Ch/TroA9qpmgihTDhmm2HciEsDZ6Qb8qqkj/dw2EHMlmdEJd/D+jwjJG/Emkm20pDBK3HivRnwWMtJHz5T0khlMItctZs1idslZCau3LMg5f5n7vIhvfLPqsMMqPF0vJsAoxJOVXWUcEBSycdBFohUfQVvK1DdJ6HZ4hNPkCb4Q0GR/buxFtx4DZQJrdFN44WMvQHKsGYpo9Mp3O4o4Wbq9xDoRVyJ9BDD7nQ94dAm32HaTm4r7EiqtY69iZMnMjSBQqiAD+yFXAqQ3WMTW6uoH6xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=101NKS/q49Y8PycYuNb81Md7WzKTjF3oRWtqwfWxQkQ=;
 b=vruaWaljg21/w5L/0+TNcGXHUQa6+oPjqgd9LsA/CEQYD5P7VwAHvHBkLFhDnFfTdngTXjXD8VCQGV9Yjxvq0k2IfZalitD+QrtHgEDRVgy8OvW4loTmIuEheh9vgTnK8fEFOCDZsGmyWGrzeBJXW1Ud1CC0eJeO2LPmz8RIzug8G2aVhLDiCV2BoXoWL5V3Xh+vej3phQfcvnzz+7eUk+3uSBn6QXzaknvdJjgFeA+8HmM1TY8x9TzVvrDQ9q3QCV9SF3PFTXsKewXD8Qtnv6bbjQ8ZuHeXviFaSA8+m/O89hPIlIHOJXVMzSfcKmSwFd9DFF1bTvgnyj+tbTHomw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=101NKS/q49Y8PycYuNb81Md7WzKTjF3oRWtqwfWxQkQ=;
 b=1YhFwP+/AnfrJP9ASuw9nhRxCo9aUI0OodcBZCqnLlWk2OlI2SBIf0iAe6cwc6uxtFlBCqqQaSj9sG6s5U9vXukcXV2Izb+6f1wdZOb47L2jgFC3pjvBXxDoZnHxYVKpyEzdoH5VKewuvXp31JI7Y8XO2lmQY1h2UDfFkxizHaE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <cad62469-aae0-4725-bfc9-1229ae6c7c9f@amd.com>
Date: Fri, 23 Aug 2024 14:02:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/msi: fix locking for SR-IOV devices
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Teddy Astie
	<teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
References: <20240812203938.981588-1-stewart.hildebrand@amd.com>
 <74f88a45-a632-4ca6-9cee-95f52370b397@suse.com>
 <c05c9312-e729-48fb-942f-fbb378cd097a@amd.com>
 <8c0d428f-5122-4ec7-ab3b-3f61f6322211@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <8c0d428f-5122-4ec7-ab3b-3f61f6322211@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|SN7PR12MB8028:EE_
X-MS-Office365-Filtering-Correlation-Id: cca38f01-9732-4d88-cc8c-08dcc39dc345
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bjJ6d2lqYjdvREIvSjhzNjRhYnRVYlUvT3VaMXZFQ2RwajRIc2UxSG44endM?=
 =?utf-8?B?MDVoWkMxbWdvcm5qUFQ3aHNhMFlQdUxHdTdqMEZRejJGc2NYN0grWjgySlJL?=
 =?utf-8?B?eFdsMVIwS0VmYkhqY2pSZTNobmpMckFSYWpMTksrWElZZmNLRm9oM3ZYbkps?=
 =?utf-8?B?OFhuRTNScjZNWHhEN2RTa1hmM1dxKzg5VWhWc0dzYi9CZmcyS3ZXQlRnVHFs?=
 =?utf-8?B?T1B3N1Z5aWh5Y0d1dllob1pvcTZJN1lOUFFoWTJMUFRXS1g3Ymc4WVEzN0J4?=
 =?utf-8?B?c1Y3SCtNdk9DOXo3eTJrMGN2REpWOUkvNUUxMUtrSk44RlFPdG1xakdPSXRw?=
 =?utf-8?B?RXFrNlN4b1d4QUFadHc5QVIyNWIyYU1wOEVJRmFmc2lrUUUwd0ZXc3lVR0Nn?=
 =?utf-8?B?ZmpTTU9Nb1VMajNPZy9rY3FGZjY0c2RUQ1EwZ01hejRnNkpvTjIzTXYrWWp6?=
 =?utf-8?B?QytLUG5abGZiYy9qTFNwVlNsK21xRVBBR05sc1JOUXNLRmdRckpBUERVTkRH?=
 =?utf-8?B?L2JZek9ERFhvRXZZWDN4b001c2tMRitucFdLLzlJOFBQRjZoR001UzB1L2J2?=
 =?utf-8?B?SWQ0MzYvTEI1Vm5HVXcwMnhIK09wNTArNkdsSDB3U2FocTh5d3Noa1JFcUFm?=
 =?utf-8?B?VGNGZGVqMjVjbDRuZHkveGYvU1FsSkZKSjU4ZjlBbXJNWTVsNXBVdm0xOW42?=
 =?utf-8?B?NnNlOWJiM3VLVUoyZmt5a2dxV2tqRjNvRmhUa2sxZ2gwMWkzcnF0QlJDVmUy?=
 =?utf-8?B?aUNKaXMvNTdzVTM4L2xLOFR4NHJnaW93RnA3TUJlRFdOMjNBZVN1V21DZERu?=
 =?utf-8?B?NHVOaUF4bVZhLytRUTdsWkFkRE91QW52aEd5Z25qbkxrOTNuNVAyMUlOanh3?=
 =?utf-8?B?enBWbEVKb1hDTTdlQ05acDVCK3k2ZjZsVjhxMUVnV202N1Z4dzl4VUJodEdX?=
 =?utf-8?B?ZVFHOGRFL28zNGFhVlArTnN5SDlRZGQ2aVYzQ2dOZU1aTFBSVDZzd1BGV2k3?=
 =?utf-8?B?bjFCbUJlYjBpNnJvVkR3bmsxWk9Id1NuUlpVOVRCdyt6R0VlYzgvNnpxYnFG?=
 =?utf-8?B?VkJIZE8yaUVPaEZXbkFHNmQvYkhtaldQMTlwaHJyZ0JxMHhqUzBuTnFtbDFm?=
 =?utf-8?B?SzJoVVJ1cEYrQVZCUExsZWp4NTZPNDJxc3ZINVZqNlJHYUlFMDI4ZFoyYnRF?=
 =?utf-8?B?dXJzTFFrM3ZOWnRSRlJLY0dUcG9JNlM2eGNxckluYzJtWmRSZDY2SlRDZGd5?=
 =?utf-8?B?WGtXMHU2NW9kY1diTmpQeU5INlNtRGpGcEl6WVVvSEw5T2NWcERyODhsV0dF?=
 =?utf-8?B?U1VRWHgzcjNHOTErMFlCUFVwTFowb25qUnJPTkpuM0hhcEIwTVluOUFzOFdT?=
 =?utf-8?B?Uk16YVY3aElaM2cvTGdTVEJ1TFRvMkFmYmhUbklHckFHYkJaRVNNNW1yOFhu?=
 =?utf-8?B?MFlDc2hpU2tEREdvU3gwNmtjVDY4eHdJc1ZCUlVsZmZheDZGL2xXS2RuaFZ1?=
 =?utf-8?B?QlNpYjM2RTBESjFNREw1aklwTDk0V0FUT1VoOCtXZTVnNmEyc2pEbEphd3Ew?=
 =?utf-8?B?cGVGazVvUkJZRVo3ZEJWNEs4ZWhVT01YWExYVVRHMHU0QkJldzdYSzBDZWt2?=
 =?utf-8?B?ZVBCdkZldmpvbzIvQzlCMFNpN3RMRXFlYnBseUlZMHlQLzdjR2Z2RGNGbS8r?=
 =?utf-8?B?S1U4NTRHdm9tUmpqSGNvVmxyWFNwcXVSQUR1K0RGTTR5eHdGVnpheGV2cW9w?=
 =?utf-8?B?dXZabTNNYXhRcXdEakdsaFB5NnhGcTduWWJBYUoyK2RwdkJ0MVI5TlpXbVg4?=
 =?utf-8?B?Q0JUVTlmZkZCWlkvWnFEUUR3dCt2VXBVdXo4ZGRZREFEdGV2RnRxRG1xa2FM?=
 =?utf-8?B?N1psRXU3MU1jTHp0MGFyVDBINzg0MnZvWTNzd1V5eFcwREhETVA5SFY4SUFj?=
 =?utf-8?Q?b0PhIZE6m1QAKDwB/46hnseLivX0TAal?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 18:02:33.2399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cca38f01-9732-4d88-cc8c-08dcc39dc345
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8028

On 8/15/24 04:36, Jan Beulich wrote:
> On 15.08.2024 03:28, Stewart Hildebrand wrote:
>> On 8/13/24 10:01, Jan Beulich wrote:
>>> On 12.08.2024 22:39, Stewart Hildebrand wrote:
>>>> @@ -446,7 +448,27 @@ static void free_pdev(struct pci_seg *pseg, struct pci_dev *pdev)
>>>>  
>>>>      list_del(&pdev->alldevs_list);
>>>>      pdev_msi_deinit(pdev);
>>>> -    xfree(pdev);
>>>> +
>>>> +    if ( pdev->info.is_virtfn )
>>>> +    {
>>>> +        struct pci_dev *pf_pdev = pdev->virtfn.pf_pdev;
>>>> +
>>>> +        if ( pf_pdev )
>>>> +        {
>>>> +            list_del(&pdev->virtfn.next);
>>>> +            if ( pf_pdev->physfn.dealloc_pending &&
>>>> +                 list_empty(&pf_pdev->physfn.vf_list) )
>>>> +                xfree(pf_pdev);
>>>> +        }
>>>> +        xfree(pdev);
>>>> +    }
>>>> +    else
>>>> +    {
>>>> +        if ( list_empty(&pdev->physfn.vf_list) )
>>>> +            xfree(pdev);
>>>> +        else
>>>> +            pdev->physfn.dealloc_pending = true;
>>>> +    }
>>>
>>> Could I talk you into un-indenting the last if/else by a level, by making
>>> the earlier else and "else if()"?
>>>
>>> One aspect I didn't properly consider when making the suggestion: What if,
>>> without all VFs having gone away, the PF is re-added? In that case we
>>> would better recycle the existing structure. That's getting a little
>>> complicated, so maybe a better approach is to refuse the request (in
>>> pci_remove_device()) when the list isn't empty?
>>
>> Hm. Right. The growing complexity of maintaining these PF<->VF links
>> (introduced on a hunch that they may be useful in the future) is making
>> me favor the previous approach from v2 of simply copying the vf_len
>> array. So unless there are any objections I'll go back to that approach
>> for v4.
> 
> I continue to consider the earlier approach at least undesirable. The
> vf_len[] array shouldn't be copied around, risking for it to be / go
> stale. There should be one central place for every bit of information,
> unless there are very good reasons to duplicate something.

OK, I'll continue to refine the PF<->VF link approach for v4.

