Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA487DCD84
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 14:06:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625688.975208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxoR1-0005Oy-AE; Tue, 31 Oct 2023 13:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625688.975208; Tue, 31 Oct 2023 13:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxoR1-0005MZ-75; Tue, 31 Oct 2023 13:05:31 +0000
Received: by outflank-mailman (input) for mailman id 625688;
 Tue, 31 Oct 2023 13:05:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=71U0=GN=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qxoR0-0005MP-1k
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 13:05:30 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20623.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 255214c7-77ee-11ee-98d6-6d05b1d4d9a1;
 Tue, 31 Oct 2023 14:05:21 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by SJ0PR12MB7081.namprd12.prod.outlook.com (2603:10b6:a03:4ae::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Tue, 31 Oct
 2023 13:05:17 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::517a:f65:688e:c4b1]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::517a:f65:688e:c4b1%6]) with mapi id 15.20.6933.028; Tue, 31 Oct 2023
 13:05:17 +0000
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
X-Inumbo-ID: 255214c7-77ee-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCDoAQ6j2oTMz64vKm8q5/UtcNVCXK8xUp7pfx4ZA07M9X27yDXGtsj9+WtGuUCYksu7CMFTpTgEXVYPhEbUiaCyhuiw/mzfao/BUApVtiidOWzyo8kCQX9K0v56MkP2QR1XHsgWoayEzllZBNgU97lnOjlNnh1VwqYWceJzN+b2aWBb4mnE8Od41rLKBXbexgAII3jwqpJ/HV4mDR50ocvwOzAjk/xRu2uqljV+pq4Trf0+yJSK1+9Y/WO8RDRl4yovNKtahiXu/QdDLr8bc3jSpitUtaZ1IVLB1gBci21yAtXQPfnElW/yBEMwj4/ZB7rgVW7F56k7aX+rBAJu3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BB50o92v7bq7Zn1Sf3JyQGnzGqQSJISpFZeL0/gW088=;
 b=IqybwRm6Gi9IC0cf9+8PD/dvOTZP5jHc4H8AbQ2kbmmD6pFVlLWo6myPboqVmZ3rVXFVaznuZJK1mi5dnonm3B21bjmxsGRmJEE45cGq01KF2v4FX9TNZ0mW05GfAHcVfVDPqWkDJIb+yGwm0oXxQ1EtTp91jZ01ap6eOcKBksWsTWR8+UpP0shHWi4PzzqmgWHQDarJ9c+U9UPR11RKM9OUxfdDVOgY94nwkACi5tHfkNFOAGf/kvhHoM175eqNCrWU+d/GLmATaqSDR/cUd+dVHxpdt7CVK2BTtTvDyK5cXXJwRObT+qIAa4L3xQtXq8w2TSLoDdi0RALpigt43Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BB50o92v7bq7Zn1Sf3JyQGnzGqQSJISpFZeL0/gW088=;
 b=T/GXIcEFnQ7DaB4IDd2e/yAXepJSdbMPGml392K308S0R8qrqsh0yt15Insph+bDFrj01Oi5isQCM40TYZBdFoAFhWrzr1IfJ0vHcoJhOrykOqeFeF6NELcD0JdZjXq3vY9nN0xUihFNalUcNwIXTIq1VB2eTMCVfPbFzdjVEUk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <03347742-c32d-4fc0-8ad3-f87cf71f20f1@amd.com>
Date: Tue, 31 Oct 2023 13:05:11 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: Cambridge University Talk - 9th November 2023
Content-Language: en-GB
To: xen-devel@lists.xenproject.org
References: <CAO-mL=xE=-8RjeAOKumLfcSf=wu0OWLK0X1Lz2JMCefBXbnTfA@mail.gmail.com>
Cc: Kelly Choi <kelly.choi@cloud.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Luca Fancellu <luca.fancellu@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <CAO-mL=xE=-8RjeAOKumLfcSf=wu0OWLK0X1Lz2JMCefBXbnTfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2PR09CA0006.eurprd09.prod.outlook.com
 (2603:10a6:101:16::18) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|SJ0PR12MB7081:EE_
X-MS-Office365-Filtering-Correlation-Id: d4fd0844-37fc-4711-d716-08dbda120766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JRVviyR9RlCedu91lLLU/hqRTmzYzjfdV8EAKrsfsTxuqeLCff+D6u06H5xwIkcM0RBhXZASfq/coja97MHJBIozQfWNZ29Aya/G82oDQW2gSyuLGcoFP+A7kLROxOSDq+vD8Sipjgg5ZWZlijna9KrQCb4FIYHOhhSINwADU6KbwHVjSO/ThUNU80WQDIFQtQ8+oMmTOGSM2bhZz0HTBHTPMoYXNIG27Ay6K3tuorfBdO/87CRhjJp/i0Lz8tT7vAJaXFLnYxwoKwqJOQkQP9MCQ3hCIFnJq8v8m7T2H5Jd619ALwpe/1aQWsoT1rDIMce8CT4CuM7XNPmV8HFAcUuozkdUCBuJ7idaxT9MdGt7ILg4J7zMop07HoojcGBBR0eggbA2fvNip5QKOnVY0YuFE6LehMO6CqSmGSk0/wdp/KxDZ855Q8KNwUAerUodYGwXUI9RBuwUhRnBphghH+/3/Ylzo9+ag2auNzhLnvhes7DdKTw3PcVD1Qsq1/CT0eLV6ppT9tJsV+J9R1WenNpWohl9rYb1K8ZWIXkiqtM36TlaxicC2ixHCq3R4V5fXB9U0Ne/BAob79St7YSb3YP/HkHI10cxqqfktIZ3gYRzsrXr6kqIFv/42AnX2Fy64/t8dbn5x8fryL7c3TNvNQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(136003)(376002)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(31686004)(66556008)(41300700001)(5660300002)(66476007)(54906003)(66946007)(316002)(6916009)(8676002)(4326008)(8936002)(66899024)(478600001)(2906002)(6486002)(6512007)(26005)(31696002)(36756003)(53546011)(6506007)(2616005)(966005)(38100700002)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REVJZUNvM3lRcXczWG1QbThJd1ozWXpGWVZ4dE1oRExRVUx4UHVyeEVLN3ZH?=
 =?utf-8?B?THBJYlBLbXdFQVBwcmM2VVJnNzdyeUJ6YngwSUxDekFZem9rYVNsOTBqN3lH?=
 =?utf-8?B?eDh4bnRseWVzMmJNUDJuOXdXNE1rTmVsRUdodGZob3hTc2ludUNVdHNvU3Uz?=
 =?utf-8?B?M2FTRmZpK2VsaUJQTXBxbFc5blZhYWpBbFVvbng3TURlV1NkODFtVVJmUEFG?=
 =?utf-8?B?V3h0NkpNVUt4YUptc3A1UG5DTHBZWkJmR2dUYTh0SXN0V3hVT3pmUzFRWEJD?=
 =?utf-8?B?dzRBWjh6Y2hsVEZnZURaWTI3L21BemxZTlQ0OTB1TWhaQ2k4cmpzZWdFOUMr?=
 =?utf-8?B?US9SVUZzcENKZG9Gd1RFUXRJVHF4LzJWRXZ2RVBnOFdPZHB5M096RWpQaDdF?=
 =?utf-8?B?RHlRaTBOWVFlUFg3ai9nUVcvUXlpUGVnV2hYQmEzYVRVaEpyRlhyWndCQy9r?=
 =?utf-8?B?UXV5dERuMWtxZnVUTkExdHZjL2FGc2c0dlFJdTFveGs0RmNjbytRMFV5b1lL?=
 =?utf-8?B?ajhGcjF3NzVudjFlNko3THZuWkVnM0N2LzltUW5RczNrcXkrek1YRzZ0RnRJ?=
 =?utf-8?B?cDE3NCtEV0o5QmxXNFVpaWtIY3NMT1lOUXhhKzJDaUJPWmpvdy9WdjlNNHJt?=
 =?utf-8?B?ODlOZDh6eWt4WEV3aUlwTkNpNEYySnk0RUJRYlZuVTJPcytvZmVwSUxac0hi?=
 =?utf-8?B?aDhqUHY2ZHFuaVBXZVFzUllvTk1EazBmZSt2bzZBU0c5NWl2cTA0Wk40YkFh?=
 =?utf-8?B?T3E3dWtob0U1cFRsbzE5dy9DLzRPYjB0djF1bWFzR0V4Q2R2WXRtc2NKRWhi?=
 =?utf-8?B?VkRiRmlhUjFNd0ZKVGVQeVorN2NNeDN4ZFRjWVMyL1gvSFZIZlVmc0Q3enRj?=
 =?utf-8?B?TmZpTnVCUkdJeUtUWk9IZ2Y3ZHdaZHdRV0Zrc2xHZUVpTUpRYUpKR29ub3Zm?=
 =?utf-8?B?cXRnMWNES05ZSk5NcnU5eGt2dG1UdmlPdEx3bE5hRGxMZkgwQmoxNlFON3NK?=
 =?utf-8?B?TUxlMkh2TThPQVo3YWR6dm1wK0s2dzU3dGdpYkF4c1pmUDBOY2QrU3c4bUtk?=
 =?utf-8?B?aTBPcHlvSWFYSkx3S2pPMEIvYmVybDlHV21jS01xcGZBQnZGNEJsdWZKd1FV?=
 =?utf-8?B?cDg0RnBMQWNHSnhPMTFFR3J3d1RsRjVRYW5XZjZJS3R5azhEUmVzSnBZckhT?=
 =?utf-8?B?M21USWlzK3hhcU5pTjBDRDkvd1l1bG9OQ2hIQjdxbGVZUVlvTEsrQjMyTnFw?=
 =?utf-8?B?VjdydnNFTnRUNGlabktvbWZaREUyNzlyOGsycjNrOTY0K3c5ZW13M2dpTkVX?=
 =?utf-8?B?WmRISGVMM1N5WU52aWhYcHlYSFBHcktYSDlkZ1JlK0NXTkJYNVV0MGNCV2gw?=
 =?utf-8?B?TXpWNE9SUExnazF6KzNSczhpV2EwT2pKNlVBK3lmSTVuaUQ3SnVhVWhPUmNy?=
 =?utf-8?B?WWtGSTZZVHBpVHlZT3FpNHB1eHdLVUNiRmZXRkNuQTA0Yi80dVNTWEUwR21Y?=
 =?utf-8?B?SUYwRGdSQThWblF6bEduMGhBWEo0TUh1WnorK2Z1V0d6SG5PWkhzQW85ZnJZ?=
 =?utf-8?B?N2IxaVZJN1V1MnkwQ1B1WmRQUVBPclZsdkFWTlE3OXFyYU5YQmNOSHoxRitG?=
 =?utf-8?B?enNyUWt1WVhTeGRyMHNpLzBET2p6YUZiZmpaaEVTMXNsT21tZXV4ZFlsVEhR?=
 =?utf-8?B?czYrS3RpNTNJWmxDUWU3Ky9QeUNDdlViUVA5akh6U3l5OXpZZzJNcTREMmtq?=
 =?utf-8?B?Q09jdkIxeTVEWkg2RmU4aVVCVUVvU1hrdzNSblVJMXh4V1ZvQjc1cUl3UWxC?=
 =?utf-8?B?RVJyTTZLMWlhVXdjbjBiZUxoRVZEaWVQWlRUVmVWQkE4aTFBVkluUkdvU3ly?=
 =?utf-8?B?RE5rTkw2Q01wY2o5RnFvSDFkOFBML3lLanlpZEVKMW10di92Ti84YkNmakhF?=
 =?utf-8?B?WU8wcWxJZ0ExeWZaZyt6NFlXelIybkRaRGpVY2RuckcwVjZETGdnU05QdkdP?=
 =?utf-8?B?MEdzU0FKNTVZYkx6c3dvelgzY2NDcmVkM1FYdTRzeGkreFhXQ2NxM1V6bjF2?=
 =?utf-8?B?Qm9VZXArZWJVTjZBUUdDdWdZWFFGdGdlTU1IMHNEOG02L0FmcXF2V1BnOVF0?=
 =?utf-8?Q?QZPT4vy6rcpUHld6wHDJ1/ZpR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4fd0844-37fc-4711-d716-08dbda120766
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 13:05:17.3993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wcEMmDKSLO5WGA0WLt5nB9aR5dSBcrwUSx0E91/C9G0EMDJX5Yqj7/mUNwrSNPsv36Mimit0HwSxsKISfsHfNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7081

Hi Xen Maintainers/developers,


As part of my talk, I wish to provide some examples of tasks that a 
newbie can easily pick up and contribute.

This need not be a dedicated project, but something that can be 
contributed on an ad-hoc basis.

The idea is to get more people interested in Xen project. :)


I found some examples of this :-

1. Misra C fixes - Refer "Misra rule 10.3 violations report script" . 
Luca has provided an awesome script to identify the MISRA violations. 
This can be used to provide fixes.

2. https://wiki.xenproject.org/wiki/Outreach_Program_Projects - I think 
this page provides some pointers, but I am not sure if this is up to date.


Please let me know if there are more of these examples.


Kind regards,

Ayan


On 30/10/2023 17:54, Kelly Choi wrote:
> Hello Xen Community!
>
> I'm excited to share that we will be presenting a talk at Cambridge 
> University!
> This is free and open to everyone, including students and the public.
>
> Make sure to add this to your calendars and come along.
>
> *Date: Thursday 9th November 2023*
> *Time: 3 - 4pm *
> *Location:
> *
> *Computer Laboratory
> William Gates Building
> 15 JJ Thomson Avenue*
> *Cambridge CB3 0FD
> https://www.cl.cam.ac.uk/directions/ *
>
> Title: Navigating the Open Source Landscape: Insights from Ayan Kumar 
> and Edwin Torok <https://talks.cam.ac.uk/talk/index/205825>
>
> Join us for an illuminating seminar featuring two distinguished 
> speakers, Ayan Kumar and Edwin Torok, who will delve into the 
> intricate world of open-source projects.
>
> Ayan Kumar: In his engaging presentation, Ayan Kumar will be your 
> guide through the inner workings of open-source projects, using the 
> Xen hypervisor as a compelling example. With a keen focus on 
> demystifying the nuances of open-source collaborations, Ayan will walk 
> you through the step-by-step workflow for contributions, shedding 
> light on the collaborative modes that fuel innovation. Get ready to be 
> inspired by the fascinating ongoing developments in the Xen 
> hypervisor. Ayan will also provide invaluable insights for newcomers, 
> outlining promising avenues for their initial contributions. The 
> session will culminate in a hands-on demonstration featuring a 
> selection of noteworthy open-source projects.
>
> Edwin Torok: Edwin Torok will offer invaluable wisdom on the unique 
> challenges of joining and maintaining a venerable, decade-old 
> codebase, drawing from his extensive experience with the XAPI project. 
> With a deep dive into the strategies and practices that sustain such a 
> longstanding project, Edwin will equip you with the insights needed to 
> navigate and contribute effectively to large-scale, established 
> codebases.
>
> Don't miss this opportunity to gain firsthand knowledge from these two 
> seasoned experts in the open-source arena. Join us for an enriching 
> seminar that promises to empower both beginners and seasoned 
> developers alike.
>
> Many thanks,
> Kelly Choi
>
> Open Source Community Manager
> XenServer, Cloud Software Group

