Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EF85AF748
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:50:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400348.642057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgSG-0007xY-Hq; Tue, 06 Sep 2022 21:50:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400348.642057; Tue, 06 Sep 2022 21:50:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgSG-0007uS-E1; Tue, 06 Sep 2022 21:50:00 +0000
Received: by outflank-mailman (input) for mailman id 400348;
 Tue, 06 Sep 2022 21:49:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVgIJ-0000Cs-GS
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:39:43 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140083.outbound.protection.outlook.com [40.107.14.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d2ff0d9-2dcf-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 12:32:16 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7134.eurprd04.prod.outlook.com (2603:10a6:800:12e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Tue, 6 Sep
 2022 10:32:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 10:32:16 +0000
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
X-Inumbo-ID: 2d2ff0d9-2dcf-11ed-af93-0125da4c0113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nyuEAr3yxqu33u5aujl4OtenHRyY3sX5YejnBtXQjN74LrCedYyCFz1oASJDjQdbhOF0WJmPpHMR07QvICq4znv1WK42N/nZIr+PvZvCn7g2spbKFyRkRIGu/1YlmuMqgHQlu+M/5yK65DaQN71FikMHmPPq19oN0vDH41TDbQ3xcPa+eVWS9gd+YAc6yIOxkc8uNGUXxgKf6bER/bdUgDcBVLkM7qaIWp4Q8iq7Vs7vjW3Nqf2MA5OxmP6HyX/SWdlcDrYW/oF0t6DZWKQX2mn+s/KoJVPw514UH6wQyOxBUd+9VaWDqOUZ8RcTpUCfLtAmAt1JXp37W201cUQ2LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Ux+tUw5q0jp5KZY1D27e/BBjcFYHXCAZ+7fbJZGQ2A=;
 b=MV9BzyGvocQG4Txxq05kJgfZ6qDoOxmSXnrhDtM0lmskwYHsQZ9q2raG7nqkUIGPQK0tnJlWQ//Bzdl6AF3F4lKdq1rPjUnqjxMFk7FA80lGiouHktBDIIDANPP4HreOY2OWqH5Cz9q+NkNCmvNuQ28CVcfGj3Dp6hStmTdGUZFVWxV/Z0t+rQG8+5xKG/kxrJtPTDBdCz/bHK17G6mziX3WcNHaIB6p23CxsM71JoOgAFcW54D6UlYHCp0ZXC0u6f+M7qsSs+8CyweNWUIT5wJZq6Ze63yX00W69kdXDjaB0/zio/xAaI/Vy0DbsBdBEYVawiEQgpQUCSNaPACXPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Ux+tUw5q0jp5KZY1D27e/BBjcFYHXCAZ+7fbJZGQ2A=;
 b=m1l90+HDYozS8hhKh7ZQM93eC+bLHUit7Kt50sLo8f2/taH++om1k6HBieZsRnGG9Rj/hcg8rMVXAxpFKm9mxOCv9YnXsOS5nJuxK6UY/u9RWWoBBaXIaj6o7oZAXoD4cn9+RsjN4pdFuVUV9RiKBaOydy90MNWi4jqfWFmx33w3c6/oeCz/FpbTVOl/3ZkkUhDb7+R2LKhmJVLcnknwNlcv9fywkOy3gTsmBfAeVriu1zl76ANh6a1YVVMpL+8X/NIdUbwvrG9PY7C31TMV5Jl5VPA7tH0PXjmTZGpErTESrO1Zot2d5yLjZd7ENd8bTJCo3BQ3AnORvW1z56hQYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9a98a83a-32e5-67fe-431d-7bc5f070674e@suse.com>
Date: Tue, 6 Sep 2022 12:32:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [RFC PATCH 00/10] Rework PCI locking
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8859c1b6-4198-41b0-8e4f-08da8ff311ac
X-MS-TrafficTypeDiagnostic: VI1PR04MB7134:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k0mWRJrU0D5Di/xsU/AT8AP/br6NGAdZrIXUN4zrdepa8py5Szrqv4KxxEyHkZx8G7HgE+g2iM/oyYGDxLXS/93H2rHoqR9TDiEimzg/H0HlXhKRw9NUH7DZXcPdgjf/o5U7d+Fu4ol92t51h2Q4ezM6Hi6+GXTrKthh0AS3+hrEUF2zoBkvUjkgNeZ4YwSsvMya6V7GzsIx5FwvuHGnBgAGDrHDAHRhB4+WOscJSHykW6TlE3/H33Pc62nrgUNTz52ILix1z4M9FJbBBkvTKZy9HqD0nLK590TaAv88Nwh5j3mfvzK9edXGRGA/YBWwLbWkZrs9uuz4OAjaK1IkjiyiphuCnbEzFw/uEmEdxaDYh4/ZBab8EsRycFfKUbSEisM4XtTdFSuH4Zi4N6F42DBVowv440ezwaJhOITpk+D4OxoAKYkECH+b93FkUzxe32G78GWWcAUzJVfGE5eWG2ozsDaOCOpYDioKQWtm8X/xu/O1jfDR0lEX6EPVX4CB/Lzwo1VqIBCanczPq9XPJd1ECBJ5QQF400BkG2r4wdwZwNrVLcgY9jsI915CKrQ7Unnt9zO6qeww8Zy2NA/f2bdwwVL80pb78z4Y1z3Vvpz1rHrywZrJJMXX8u4fLIkCHHzwbPahVz33osUJOkLHOxE6VOMsbPIINCUPH2ppnWJ1CQn+FWNHAY6oBNJToHTqdJeYbKBlMqxTYbbfLykM0XQSHqbWHGuGuPV1oETNYqqmwJW2pxutSGZM+qOunSPG00wUsYLTZV5g4GZJxJhbhKRDClkUl2mQiGiCZXwnhCo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(346002)(136003)(39860400002)(366004)(38100700002)(66476007)(66946007)(4326008)(54906003)(6916009)(66556008)(316002)(8676002)(2906002)(7416002)(5660300002)(2616005)(8936002)(186003)(6512007)(83380400001)(6506007)(6486002)(26005)(478600001)(31696002)(41300700001)(31686004)(53546011)(6666004)(36756003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVJ2K3h2SEFIcWtZcC83aExtTUJmcGZrcXlzNkdXTTlod29iRXlCRlY1ZEN1?=
 =?utf-8?B?LzNQcG43SnJlM0U3ZXFOV3p4VmI3Mld3SHVVci9RYVNRdWpZbTgxSHVPWEZs?=
 =?utf-8?B?dEgrZ2VScU5saUZuN21RbkRNU0dqWWZKUTEzU2VWaEZxQkh5Sm9BK1B0L2U5?=
 =?utf-8?B?UkVHVzhGWm5DWFRDbHBSSVBUNVZ5bElVRTR5Q2x3Ymljd3JVVVVKaDZvdFB5?=
 =?utf-8?B?V1M1ZDdtVUtUSTFtNkdVT2p5TS9nYmUvcHRsNWROR1d0VjZGU09IdkRzVzdr?=
 =?utf-8?B?QW94RTczSnBjdnRONmNkeDVrekJEemFDVGd4T3hZN0xsUDVIZnlvbUs1eFd4?=
 =?utf-8?B?YWtZdG5OZlN0SXBBeE1CMkI0cFRmaENhZmlQTzcrZ20xMzZsSGRyU2piSUcy?=
 =?utf-8?B?VXhEeFdrc05janE5U1pJekcyd3JoWUJnV0JPb3VTSGhxb3dhWndRQ1NWc2dX?=
 =?utf-8?B?TURDeEVYMWFJdlpwOFRjYVY3LzBXbk93T3BtTGQ3SkEwcjY0Z1kwemtRb2dw?=
 =?utf-8?B?RXZvQUtHclh1MHR6VkZTMStKN3p3N09SS3FwL1ozSVRGWUJrMk12Uld6a3Fy?=
 =?utf-8?B?OEJIeGw5TEp2dGpMUTlGVHRLMSthRG11eTZWMkkyM2ZSaVR1cTA3L09rRDlX?=
 =?utf-8?B?ZGlYTVFjTXRnTUs2ditobzVkQXBOTGR3cVRwcG54R1IvRDVNRXhsS2R6eVky?=
 =?utf-8?B?V2h3L3JTOTRXZC90bmlrVUVja1NBN0RCZHJhQTJPelNsSzBTa1AwUmZUc2lV?=
 =?utf-8?B?WnFmaGRFRyt3L3ZTKzRyZmZETkhSaUtVMTI0K2RmcGJQaENiUGh3aGowemdk?=
 =?utf-8?B?Ly9xSjMwcVZEZjhGQm9idEFvNXlGeVdyYWpwN2VLSWJRamxYWmFOVGNlUkZw?=
 =?utf-8?B?c1pqNUIzS3Z0d0pCZVhjRllVQW5oTWNWOFZ4eXUzQVJPNmN6VU1aZmwxRWtl?=
 =?utf-8?B?MnFhQm1OUEhsdW8xSnBMZ3dKbStBOWdaTFRGKysxNUI0WnJvV0hKNnBQMXl3?=
 =?utf-8?B?UFJhU3Urek9JdUU3YWREY0VKR1RTQUJTN3NwbWtxZFZjbm50NU1zRG1QYnlo?=
 =?utf-8?B?d1BPakJ1RjRhSnVNajc5dVZWSWN5d1BZLzZoN0p2Q0xaZkNqVjA3eFdVZGY4?=
 =?utf-8?B?S1hpQzRnT3k4WjQyUnVXY2N0ZG90NytHYkI2OUkrNmFzUlpBQVpwTEtvSElB?=
 =?utf-8?B?bldWL1FxeDZyS3F3VkNpeG1CZWgxZ3hZVGpUd0JNcVRsSWFlZHk4OTV5SmZC?=
 =?utf-8?B?L2FoTEJwV1lKV3loV0xqSlA3Z2M3WWVwY2lmQnpMYkJiNHlZaU41amY0VzFv?=
 =?utf-8?B?emxSYUFSemVmdFBFNzE4YXNubEtBdllBQ1luQXpPZUtMRkhualFEMkc2OWc1?=
 =?utf-8?B?K2IwdXQzOGFDYlAvajlYSHFITTEvMmMxdDVuWVMyUCt6eFRQZjBjNzVvM3NU?=
 =?utf-8?B?NTZoRG80cURyYVRyZVYyb2YyeWRUVUFkelhla2hwZ1EwZ0dxaVFaWlcvQjRF?=
 =?utf-8?B?UUNWNGNndVcwZEhFYjljeGY3TFJNNjBPRUN0ZCtpaWtlUFVzcktUWXF4SW00?=
 =?utf-8?B?UmxrN3llSzVlTnFUdFZlTzhCZ3RlQmE2S2h4RDlDWThQVWxHS2dLZVNNd2Ji?=
 =?utf-8?B?bFpnQUV6MEFwamIyaEhhLzQzSjR5Z3Zva3FodDdzY3ZzdUFjUzJvRFRKRk82?=
 =?utf-8?B?QVRkdktNb3g3dkwxK3EwMWloa0VDckdRMEJyeTFpNlg4T3JIWWw4dUJnamgr?=
 =?utf-8?B?am1lRmVlVTBEamxEb3E2TStCVEcyeEVHQmNMd1p0d0FnOHlXOU9zdnlaWThy?=
 =?utf-8?B?bWxaN1VlSXRxbWdXOG1ZQUNDN0dmUXIvV0k5alJLaWFBc29lalZmSzM1bC9w?=
 =?utf-8?B?cStIc0F2Wk5TWDljbGoveGc3c2ZYb0xnRkFvNDVFSjNPR3huMGh2ZGl2T1lX?=
 =?utf-8?B?UHlMRjJJZTg1Vjl4Tlo5TjA2blh2Q2hhNiswWjVqUTVFclBablNMc3dXRkwz?=
 =?utf-8?B?OFpEajB1VHNUb29kT0gxTnpGWFJ0WU1iaExmR0dicTNiYlhJeDJoUXBRQi9h?=
 =?utf-8?B?YnhjeWdTUVVwUmU4M0sveUhxVlQvQXNkdHBuOXN4dFZvc3VHSFUvTDU4MVd0?=
 =?utf-8?Q?HZRs0fZml/e6aLY/buipweBcr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8859c1b6-4198-41b0-8e4f-08da8ff311ac
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 10:32:16.3942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0YL16EhstA25N4s8LdjxfTE0phqaRniry1MWNpeTDG3naFxTliKwaE8IkA4SZZDb3+Guh/jrp4ZnTG0Bme0yQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7134

On 31.08.2022 16:10, Volodymyr Babchuk wrote:
> Hello,
> 
> This is yet another take to a PCI locking rework. This approach
> was suggest by Jan Beulich who proposed to use a reference
> counter to control lifetime of pci_dev objects.
> 
> When I started added reference counting it quickly became clear
> that this approach can provide more granular locking insted of
> huge pcidevs_lock() which is used right now. I studied how this
> lock used and what it protects. And found the following:
> 
> 0. Comment in pci.h states the following:
> 
>  153 /*
>  154  * The pcidevs_lock protect alldevs_list, and the assignment for the
>  155  * devices, it also sync the access to the msi capability that is not
>  156  * interrupt handling related (the mask bit register).
>  157  */
> 
> But in reality it does much more. Here is what I found:
> 
> 1. Lifetime of pci_dev struct
> 
> 2. Access to pseg->alldevs_list
> 
> 3. Access to domain->pdev_list
> 
> 4. Access to iommu->ats_list
> 
> 5. Access to MSI capability
> 
> 6. Some obsucure stuff in IOMMU drivers: there are places that
> are guarded by pcidevs_lock() but it seems that nothing
> PCI-related happens there.

Right - the lock being held was (ab)used in IOMMU code in a number of
places. This likely needs to change in the course of this re-work;
patch titles don't suggest this is currently part of the series.

> 7. Something that I probably overlooked

And this is the main risk here. The huge scope of the original lock
means that many things are serialized now but won't be anymore once
the lock is gone.

But yes - thanks for the work. To be honest I don't expect to be able
to look at this series in detail until after the Xen Summit. And even
then it may take a while ...

Jan

