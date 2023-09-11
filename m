Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9AB79A546
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 10:02:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599105.934371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfbs3-00051P-H3; Mon, 11 Sep 2023 08:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599105.934371; Mon, 11 Sep 2023 08:02:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfbs3-0004zc-CT; Mon, 11 Sep 2023 08:02:11 +0000
Received: by outflank-mailman (input) for mailman id 599105;
 Mon, 11 Sep 2023 08:02:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S94K=E3=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qfbs1-0004zW-UG
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 08:02:10 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20625.outbound.protection.outlook.com
 [2a01:111:f400:fe59::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80922f98-5079-11ee-8784-cb3800f73035;
 Mon, 11 Sep 2023 10:02:08 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by SA3PR12MB7831.namprd12.prod.outlook.com (2603:10b6:806:311::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 08:02:04 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9a2:f8ec:7c75:fe95]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9a2:f8ec:7c75:fe95%6]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 08:02:04 +0000
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
X-Inumbo-ID: 80922f98-5079-11ee-8784-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=csYRBZUwfCCGiur03VXX+aOc8HEpl3zMfX+RLHysL756C4F0GA48sQBv/xFyVxJiCn1A2aVt7q6BxqMHmYSHvbVKcnkqylv5TfrJsxl3MSJzk1jVdhTGVJG1Z9iDKTjPE1rAxhSgig9oVA5dx/1/UQZVIrKturBmHpOqIPsWuc5bTT5xaVUBF8XCtJA9SydeY74TvRv3trJTtOtp3tV98uOxCy3wWHRppiINPySrtJMH1zctWQWFaiF9BuF3xlyuOL6Xe85L4ig9+GonzgRx8j3j4D3+TGm9m5WkxgIo+pbB6IJ/q7RU4rkC+cQD9IbJSmCPUTpvyeJktdDmLTxEDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtKHm2qinFfsEuYofHDyysvKk6gtmsstZPJV13d+BOI=;
 b=GMiU/kdPDyjpmUsTWdbwXWJqNK+X83f7TIHf+olUAKpWyKd43Vo5wxNzScUdJwAyv5o5h9Q5dJ0vQfmWkwLzUBeV5k1cc6avZQM38MShAZ89VJGPjG9o32teFhpAxDSHE5PHRNJOcLBET6pL05piog0g9Yz8GRrGGFx4kVtUNwop6MleZgvzqqpbbsLI+XoPOiaXMgfOPqASQI7miUVCpsl4Z+3tUyqmrS/w420Jvxuy+6i19SncJiwjsyEbFbMsWzg1o8S4IHytCSR96Ia+hUrg7wzp523Z1NgBaR0WIXE0xdttFq7TLxPkKlmoU1PDhm+nDCSBRT2btaalhYFo0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtKHm2qinFfsEuYofHDyysvKk6gtmsstZPJV13d+BOI=;
 b=p1PuwkKrxLLy5W9dJ1COV6mLAp1LB+ewgPnOJR3GcEbKdE2y0GE52SxLemeErhfhggNgTlujLE1YevbWhPFvDdf+pcW7a/oGgESB32MRtbqWTs2sfsIbFyMHZzEOuA7ZY/TX5FSlo/9deHh91HP8NsPlEBzERmBXlcjM4NqcNXw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <3dc0a9b2-d690-b9c7-321f-008ba1fbf084@amd.com>
Date: Mon, 11 Sep 2023 09:01:57 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: Xen 4.18 release: Reminder about feature/code freeze
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, "jgross@suse.com" <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>
References: <AS8PR08MB79918D6EE559A2807DC6D56792F2A@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <AS8PR08MB79918D6EE559A2807DC6D56792F2A@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0061.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::12) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|SA3PR12MB7831:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a51b572-76fd-45fc-7853-08dbb29d62e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7cZ3QUAnMD3Qhexv/fiHMyEbFy+SKgaLyzEiDXSfPyFDUP0xmL5Cc9N2XPAFriDkRS98402N1JkXfMDiYZg1/G6HjpAx4cBd6FbUnizzn+PAlxCaJPEfSncwN0rQhHOC5XVgNexiwl12fwsAvuQlSSlpEcYTRm6scKF1nyzzhzB+jFreUKkvAxldOwEMP4sgofJEAsqRZGG7aMhmm9YYPR2pCJJhQ383GcAuEzCV+zT2dfNt8pIHo7peFEANFK6WJzfcQHBW/22E+dAM/aR6SKZI+3tl6GnYoaIRQuYUwZakXXHq4adbqGyPhBg+ZTmBBHoed11wmmXmpyq6Yry/XpDVeZyw/sm5En/P1lj2N9FT+RACDHn4IZZEbhNLLylfLeAxJK+nPhjXKNOUkSDUk+QC5adazpWSx9N7bS7mzP6wv4JRgwdPmbtrf6+nW+kQVTPps/Cmp3PFGv7QB86M6wLH/HxXsgXV1UJzfZDdHMT97ykIEHhH9K0bc6Eu/fCvbQTJfqy7Er9SXt4Kql65jo83VKrU9J9LY7X2T3UzMEpVtW4F9l5yXH5k4OGMjCYNxozg6up+zMQHdekiQH02UpDKsa5SsPg+H7nMC9vfzIU/Pn9ssfbG+INX5lTu/FGRuyYGtMYS1rcvRKPBChI54jlICDF2+zaXSD0zw+AKJ10=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(136003)(39860400002)(366004)(186009)(451199024)(1800799009)(6486002)(6506007)(53546011)(6512007)(6666004)(83380400001)(31696002)(38100700002)(36756003)(2616005)(26005)(31686004)(316002)(7416002)(41300700001)(8676002)(8936002)(54906003)(66476007)(2906002)(66556008)(4326008)(66946007)(110136005)(478600001)(966005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0pVN2phTGRJcy8ybTBpaXBhM29vMTl2aCtuVGt2Z1I0NTJKb1VHMEFNL2My?=
 =?utf-8?B?ei9vZ2tVQ1IzYU1JUmdpUnM3TURQa0JtQmlKeUJoYkNhMnZHdzBHdElMdUN6?=
 =?utf-8?B?QkloeGNvaDdXZkluRUlyanVQRFoxRDRucnB6RGhua1VpdTJGZVZyZzY0ZDZ1?=
 =?utf-8?B?clA2WDZjZkJsTjFicXJWVVlySWw4d0Y5Y0RkckVVbmFsSWR6dXU1M3FOa0JQ?=
 =?utf-8?B?aTcwem42dVVLRStDdUwwamRQUXZaRExaR0lLMTU3bERDKzgweTBsTUZxc3Mv?=
 =?utf-8?B?OEozZUJxK3JXNG15dFJwclhwZ1FtOG04Y3UzbVFhcG4vaGIvZThlTnEvS0cr?=
 =?utf-8?B?Q2tCdlNsbXpNT0JTK0N3NllWNS9tUzlJc1pya3dreVBmeFA4MUFNSGJjcElL?=
 =?utf-8?B?WUN4cWJRN2ZKY0NaQW5CQk5TZGpKQStHU1E0eXpBUmJET2wxSGU3QU9aK085?=
 =?utf-8?B?VEg2VVFYcitqUENHYU84ekM2dnFNa1BYbEt1cnAwOHhaODMzdjBDdGFCbkZ1?=
 =?utf-8?B?WjBKMEYvRlY0TUIyUHRUVzluRkp6am1ldFpQdVY2WHY0TnBBRWtjREltc1A0?=
 =?utf-8?B?c3N6TXV3VHFjeTFNZXhJWld1dmt1Nlc1VDFvcERtSWpPY3BFbFlGL1FBcmlq?=
 =?utf-8?B?ajJpdFp6dXNUdi9vclM5eXEvQXd4c2x3dDBJU2p1N0lDN2tGV1BNdWFoQ05O?=
 =?utf-8?B?YU1IZ3F6UU9vclFHY0hCSE5lUGFJTXNSNW1mc3ZEMktsWHR5VURSVisxWENk?=
 =?utf-8?B?WG5yalRaOGx2aUlwSER3aW9RK3JpTVZ6RnNHYmxUNTZXcDJ1aHRhQS9KTTlJ?=
 =?utf-8?B?WS9TOWwyOUIrMmZ4Y3NkQnJXbjBSamFKMGllQXEzSlFWYlh0OU4zVVR3bjZP?=
 =?utf-8?B?enlwU2VTbDlDYzNEQWpXZzhTZGxsWjFhOUdGZ25OTS8zMEJBa0UzMGF5YS9o?=
 =?utf-8?B?Tmhsa2pOcVY3d0d2SzNnVGRyY0xzR0loZG0wdFVxMUMwOFlhS29RQmxqTDZp?=
 =?utf-8?B?NDBVL0VBMnJKeW4wRlAzVHBjRzdMZG1BRXAxTEJnY2ozSXQ2cUJXdFhJbk00?=
 =?utf-8?B?dE9rNVF4R3ZzMkk5aWQyck9BS0dJTnJMQ21ZakNzYVdsdWNBUGVKWDJnU091?=
 =?utf-8?B?cmNnZTZic29oYnJrQnZWV3pvczdrc2h5RFU1VUxUcnpTTmZVbWI2YU5YK1ZG?=
 =?utf-8?B?T3Y3OE41RXUrRGNlRzNwdnFlUjJjczBPY3luRjhDUWg3cE1EYXVrbjd2WktQ?=
 =?utf-8?B?L2VuN1drZ09HNTZSb0lFMUJzK2V6Z01ia2dPV21xczF4RURMR0pRajc4QW1z?=
 =?utf-8?B?dTZhSThyVE15RHMvUStyYlZFTTl6U3c2dmZiN0dpbStkZ0QwbkxweEFmeFd4?=
 =?utf-8?B?MmtpM3FHc3AyT3c4T0ZhbEY4V1VUUmp2WkJDdFYxZVJteVgwNWV2eGo1L29M?=
 =?utf-8?B?QVRtUERxSi9MNFUrMXFuUEVsbG56N1ZDVVdjeCtvM0t6a0crZGhQc3RTYVdC?=
 =?utf-8?B?VnNic2RqKzZKNFlaYmQ1d2ZhRDJTSENnTWxRWm9vRkVWdFQ4MDhwLzZxdC9D?=
 =?utf-8?B?MlI0anpQQ25ka0kzZUV4RDF4eXJ3dmtBdkVWVzRPYnQrT3dIdmpRWHhXWWY0?=
 =?utf-8?B?KzJDTU9XNE1WOUwzc2JCN0x5MTJUMjNIVy9RZ1pBTW92djc1MVZLR1AzL2Jw?=
 =?utf-8?B?Rm5WZ2lGbEdlUTFNb2xXMnJOWnBCMmtzTldFOW1SSlp2cCsxUmNtR2gwZHkr?=
 =?utf-8?B?dzdPT3dZdi9ad0NYbjlLN0lYVjE3WExhSWhIdEppTVZ1L1pwMjYyS0JoWDJM?=
 =?utf-8?B?TTY3N1hQaTNNd0FiUjdQV2VOQTh5b2pPUS94L2ZZckowYm1JRFRGTGtEWnph?=
 =?utf-8?B?THh0UVgzcXU5ckZqN2tqaFNIdmgyQ0tHRGpZbjBSRWhBd1p6YU1seCtkTzky?=
 =?utf-8?B?QVd2bHdmWnlxSEE2Tk5BYWZpNU5RdFM1MW4rU2JNaXpGNXg0NTZEV1ZjWXV5?=
 =?utf-8?B?Z1M5c3NINVRzWGpPcDJVN3BaaVl6MUVrUXNwZzFTMU9UdHF5OFJRdjQvMm5T?=
 =?utf-8?B?cTllTGhFcis4S0d1MjFmQ2trMUVDSEpjaWVuQytpdjFXYnF2TzRhR3o2ZHQ4?=
 =?utf-8?Q?SziSE3ckHcPIEKJLPF8RawuI6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a51b572-76fd-45fc-7853-08dbb29d62e1
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 08:02:04.3597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TtlvU353Hyxwsk8TGepeMKY4rdmfHGJjH2E/4GqEStedaIu+Sr5efWJXfDk2n5v+HRhkoK7clT/7FdPHyZBxFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7831

Hi Henry,

On 11/09/2023 02:08, Henry Wang wrote:
> CAUTION: This message has originated from an External Source. Please 
> use proper judgment and caution when opening attachments, clicking 
> links, or responding to this email.
>
> Hi everyone,
>
> This is the reminder that we are currently in the feature freeze. I 
> apologise
>
> for the delay.
>
> I decided to make the code freeze date on Fri Sep 22, 2023, to give 
> people more
>
> time to react because of my late reminder about feature freeze. The 
> hard code
>
> freeze date will remain unchanged, i.e. Fri Oct 6, 2023. So currently 
> we have 2
>
> weeks before code freeze and another 4 weeks before hard code freeze. If
>
> everything goes well, we can cut 4.18 rc1 at Fri Sep 29, 2023.
>
> Also, below is the critical items on my list for 4.18 release:
>
> 1. [PATCH 0/7] tools: More Python 3 fixes (part 1 of N)
>
> https://gitlab.com/xen-project/xen/-/issues/114
>
> 2. tools: Switch to non-truncating XENVER_* ops
>
> https://lore.kernel.org/xen-devel/20230117135336.11662-1-andrew.cooper3@citrix.com/
>
> 3. dom0less vs xenstored setup race Was: xen | Failed pipeline for 
> staging | 6a47ba2f
>
> https://marc.info/?l=xen-devel&m=168312468808977 
> <https://marc.info/?l=xen-devel&m=168312468808977>
>
> https://marc.info/?l=xen-devel&m=168312687610283 
> <https://marc.info/?l=xen-devel&m=168312687610283>
>
> 4. The proper eIBRS support for x86
>
> https://lore.kernel.org/xen-devel/ec8e75da-743b-50dc-4665-854c446c974e@citrix.com/
>
> 5. [PATCH 1/2] credit: Limit load balancing to once per millisecond
>
> https://lore.kernel.org/xen-devel/20230630113756.672607-1-george.dunlap@cloud.com/
>
> 6. [PATCH 0/2]  Revoke IOMEM/IO port/IRQ permissions on PCI detach for 
> HVM guest
>
> https://lore.kernel.org/xen-devel/20230809103305.30561-1-julien@xen.org/
>
> 7. [PATCH v2 0/8] Fixes to debugging facilities
>
> https://lore.kernel.org/xen-devel/21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com/
>

Did you miss "[PATCH v6 00/13] xen/arm: Split MMU code as the prepration 
of MPU work" ?

It see that patches from [PATCH v6 06/13] xen/arm: Split page table 
related code to mmu/pt.c ... are yet to be reviewed and committed.

- Ayan

> Kind regards,
>
> Henry
>

