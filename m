Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C87026523A3
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 16:25:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467147.726167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7eUr-0008DK-RP; Tue, 20 Dec 2022 15:25:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467147.726167; Tue, 20 Dec 2022 15:25:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7eUr-0008At-NH; Tue, 20 Dec 2022 15:25:37 +0000
Received: by outflank-mailman (input) for mailman id 467147;
 Tue, 20 Dec 2022 15:25:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7eUq-0007ag-KH
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 15:25:36 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2087.outbound.protection.outlook.com [40.107.22.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c9ee1a3-807a-11ed-91b6-6bf2151ebd3b;
 Tue, 20 Dec 2022 16:25:35 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7625.eurprd04.prod.outlook.com (2603:10a6:10:202::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 15:25:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 15:25:33 +0000
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
X-Inumbo-ID: 8c9ee1a3-807a-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bi0cYmDekGsVY1GZWxmaJGzY37jMMBHtAv+vfDTaz7avmZioia+T05bYIlr6RRtMYvTftVowjArF6n0jW5uGpY82HZlTKmTWv9h82w/Fc8Gu4E0HdMlr4bfybdea8dtcFqsWkrFtfmPQL6uqIQP42IDYpqGuYFgbdjZOXgCCYZN9mrzdrGtTWKeWUv0xqRRqUF2i0M0wgMfP4Uv1SLJCTWWqO/FSUVFs9s2mxIOvcvZ5tEs4zM7gQVLrogj50rPtoIEv+1ecmbfv/cr7SpW/Rh6+nbZxMaRRVPObPSiGNj9UiF2n/2DWeKowFY7REEgz2ze9qAyPbSls810hm+48Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9lBWF8t2CEwhyzo6gGlJGOj0vvWlIpLrhjHvCAleW80=;
 b=ZBo/bq60oeqk3Mp9LNl1BjirkjEmuwGoLJzG8M8ZMGXtfuiwU0/Kj61N0wLt0ns9XXhjG+HHV9M72D0FT3LqqN1c53W+YrYGqeLzqIEEKJ5u7I/jkTpdcNsoo2RucokxwDQKDy43xJTm2FBQyJ4aRT/KAACOVTnHk3SzySpdFXxKuota2Jk8UxRoZ31JnaSx9aechzfxLAZg3oDutCGhCZX3HrZIChJWcKdsUtzldPV+ADvXZYvVteP5nOOF2LFV/JR4Qc3duulMglYwOa8MzzN2krQJMYlWdwHNMi+cbkiaGwPknbLcaZequawqGiMpdqZUFtQk6tI3m2wIkTizaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9lBWF8t2CEwhyzo6gGlJGOj0vvWlIpLrhjHvCAleW80=;
 b=fWzzdvTkLBdPFzLDXQpTITjc4dP6N9Tjxelelm7LO3QokfQyHp/ZYmjlX/sMzwbluh+SygkgUIYU+J0HSmBrsTYItwCDBDMHG0emaN+fhXTUUSvSOi5cagkSKIGXZ7p71jzbL13afKoPAPFSsviCdgindBqO+1f3jesz4cp4bA4a8zaU3lsJWE3/xfUx1F04Lmbq80EWSjA8ElvTuLk0r/knYO6cemp8hCPFp2zGyGbXsGVZ1Oncjz3prkZo9ZossCovcAt42upw7bra/8coapjn4PEecTTkBG2a9KkVYV7O6JQoNgOZXTCuRhO6jH8Dg1dA6xAqVqRXCccvWcc0nA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8d1ef02e-37ca-3a75-aa16-ad32395c9815@suse.com>
Date: Tue, 20 Dec 2022 16:25:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 04/22] xen/numa: vmap the pages for memnodemap
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-5-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221216114853.8227-5-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7625:EE_
X-MS-Office365-Filtering-Correlation-Id: 95d68ed0-8429-429e-2162-08dae29e6fc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D7VTmYVZtQecnb96RRvuZtMV9C/E7R+f4abqtqQ49guD/xgS7x2p7a2fA2fjDGRwA7VTkbEggE1I/RDh5X75/uBJyt/8gMhB+RPULfWWx5pVyBN4XjizatiF4b8GvOZB3hNFV3L0WthPOV1AHBcPeyZaA12mVWG/oJHEX0UB4kMTSpoRXaJqFrNq14mSICaL6u1QblqNi2QYvq7/m+D3gnwlSKRWZVbB9prX6m7eemhHox+eGE5GcvINgWJlA8QMhq/IJK1LQC4j8olK4PG7uC+nHdIrpO4MaAp1PMzcVXmR+ujii7XYD0/JDTAfoto/Ok/BZfUpnEM1QcIzNjXvnCoZNP5SxsFnozIjry8klBK/wdqbG1iC9yPjRasejpHaQ5+b0uFs2B9WG7Dt+27silx3C4DGUHDaD42/9cQ/3irLU24Nwz5ETfDGIGEKJqdzNoz4xG42ddhJhvhaJOLIpAAVmyIdDyohozVFEw9m95XlXhN4m5PtS/mEIoh66eUm7SsmvvCCdJEHAuK8OXlt+TAzsnm+LH0DO/Ew/DY13hqmXiwCQHX5kBNUVZH3W+VMYZqrKkVzw/KaFIUCiUKnX1l7XbEBBoqj9MhxdeM9I9lHm7NzPxpshmDTRO19QXAacVOgkpiZoFwVoASq0JpkXChZhbzHy2B3S6bB3pbWenCLMBfsWIQFpYvFyj4vUdMNDVX/9+m9T9x0pfBI7EGCzUK0BTEzhKkpIokQhdP9s14=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199015)(41300700001)(66476007)(2616005)(66556008)(66946007)(8676002)(2906002)(478600001)(6486002)(36756003)(4326008)(53546011)(54906003)(6916009)(6506007)(8936002)(86362001)(186003)(316002)(38100700002)(31686004)(26005)(6512007)(31696002)(4744005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVBVMnFZS1R6eWd0cWRTbXI2UHNvanJQa2UvWmpOV2xmem00Q2tJL1F0Qktw?=
 =?utf-8?B?VVVUbDVkak1xcHNWdms1S24yemhHSGQvdzRzLzJiMHduc3BkZ0Q4V3U0bTJI?=
 =?utf-8?B?WWNiMm52WXlPVjE3MFhHQUNYamdSTWRzZXkyalhnQnY1dERXVGluek1WOEE5?=
 =?utf-8?B?YXZ4Vm12VFVRUitCU3ZBYmVHTVdkWURTN0wxdDFzYjBrODZhZ0VtVzJyeVM3?=
 =?utf-8?B?RWczTmVvVVJKRUpOOHJZS2NUWjhRK0F6c0ZOSkNtTHNnd1hhUVBrRUF2SG9R?=
 =?utf-8?B?c1dMK3RPNmJQcVIwQUwyM3NPWnlhV3hxUDZXdGtmR0J0MENONGZBczRDYkln?=
 =?utf-8?B?SDJTQmNiOUJuVnYrQXVMSjJVNE02bWo3UlhzUFAzL0RTTFU0c1RyVXVudndG?=
 =?utf-8?B?c0ZkY1BLNVVMWXpsRmN6WjFwb3lNT1ZTbjF5RDZQV095R3JrMmJpTnZvaFIw?=
 =?utf-8?B?WXM4OEdQeWVBVkYzY0FCVUVlNTlXdGpCdUw5RHNGTVpDRTEzS0hwTmQ5Z3Rj?=
 =?utf-8?B?R2kxTnFKcTJhZHBmSUk5T2cxWVpIM0sxTjFUNm50N3BsamNaUzBQYW1mNDIy?=
 =?utf-8?B?UUFMaUQvTWl5dmNnM3F0ZnhpaG5QOUtPNjZBakhBYjlQdVVZNTBUczdETVRo?=
 =?utf-8?B?TUhnQk13Y3hUWFdxdzVXaHRlbWNmRlloUFJoMFB0ck53amU1V2VKUUxzRW9p?=
 =?utf-8?B?TmdXWWNhMEJyTXVVYnJ1U3VLY3ZqMDkvYk5YMkV2a1lrMzMzZXRicFJpTXpQ?=
 =?utf-8?B?aVhxaEE4YUZVT25KdVlzMmROclYyMWxONEZuQ2w0c3FTZ2ZtbnUxbnhTSXp0?=
 =?utf-8?B?Mlh6Y09MWHpuekxabU9UYzhKZXBCNTRkL0JlL2VZcXZnUVgwWHNHNE0wS1Yy?=
 =?utf-8?B?WjlTRWFOTjN5YXVjdkV6Nzc1M0FiZWtHazNJRGZ6dGZyZGJYN21yMVZSVExV?=
 =?utf-8?B?M2dvVVVCRWJaVVV6RWtXZ1B5eHR0alRqM1ZnZ2dPck43VUtySE9wY1JQM0pp?=
 =?utf-8?B?Wk9nZTZyM0R2VHVxbk5EQ0hLT3FJY29NazdvcHUxakV4OFNDV1MydnBtdGN1?=
 =?utf-8?B?WHpJUHZ0S1FvemFzblhxRFVVUk12UndabU8yeFFaUElONlg3eUVsOXJHMnVy?=
 =?utf-8?B?OUN2TWRaTDI2bElOT0h6NllGRWkzYS9hdG9HVCtGUHNaMEN6cUFQWHN6ZGVO?=
 =?utf-8?B?MHEyWnM5ZW1GWFJPWWRoUEFscFFuaXc5RjVEaDMrSmFWa2JxeUtQU3c1dWk3?=
 =?utf-8?B?bUpCNERHZC9TUUdTcHM3Mnl6S1V5bk5tTmd1Qlh2Z09kZndYaGtaMmVaSnQr?=
 =?utf-8?B?dUpLWmlMR0ZXam5nZExGazVLMWw4MjJSb1BIWnBiTElUekkxMmxCWDRxNWFi?=
 =?utf-8?B?SnBsUUdvWGgybllTMzltM092bjJtcy84SzZ0TTkxYjJWS2JXeTZoWUorb1F4?=
 =?utf-8?B?Z1JoQ3lUakNxekJGQS8vNGJRQzRkR3d4TWtVdEZnUjJ5UlpvOTVCbGJkUXBj?=
 =?utf-8?B?VkFYRnM1TlNWeU8zdjZMT0pjN0pmR2pwQ1BmSjVlSDFRWXUwcWpaOEM4SVBk?=
 =?utf-8?B?MTU2NFBDVkFGRG1uam1KWm9FTXdGQzg3NWVIZjhFMTBNbjN6TzUzS25PUERJ?=
 =?utf-8?B?aWRpK0pvZUk0eEN1ZTFpMmthRGk2b3cyN1JmMzlhKzI5RUpaTWFveHppeUlt?=
 =?utf-8?B?L0swZFlkeng0alZJZkZMcGpZVDJ0UjJQalA4amRvdHNacXlCSUZRb2tMSnRi?=
 =?utf-8?B?UEZqekpXT2s5SXNvTjQwT0poektWYWxKVHdHdW56Mm9HaDBmOVY2TnBLMEs5?=
 =?utf-8?B?MG9PQllnUC8yYmxRakxqRklycHcrL0Q4MzVXN1lZM2ozaUJiYkFkNWFpUDFC?=
 =?utf-8?B?c05ubVJNN1FIR0tUeENoZS9JZVFUcGs2OUI3d3RabHVITVhPMUxSY2xKQmdh?=
 =?utf-8?B?R3R3eTJWallWc0paQjlDQXI4a1NxOTNJMU5QOWJEV2JqVlAxalFSdzZkOU15?=
 =?utf-8?B?Nk52YkFHakJCdkVCWkZFSVk5a2MyRzhhN2VPY1BwVGZIaldSeFRqVVJrYWRD?=
 =?utf-8?B?cWFCbmR4UHNKY2Q0MVZ3Wm9pV3MvdUkyVVV2SGNuV3UvWkpNZ2NNSVBTbjZB?=
 =?utf-8?Q?xI6CtMIaw18elwwumR51EOJiR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d68ed0-8429-429e-2162-08dae29e6fc7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 15:25:33.7033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FBF5DcQJtWs5xlOogWm7sbAWdEnYU/c5vh4N8a4zHFrJssETfkr7D9BNwx3UCZ383TfXf5s8SDLlfziFAa9NbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7625

On 16.12.2022 12:48, Julien Grall wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> This avoids the assumption that there is a direct map and boot pages
> fall inside the direct map.
> 
> Clean up the variables so that mfn actually stores a type-safe mfn.
> 
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
(obviously remains valid across ...

> --- a/xen/common/numa.c
> +++ b/xen/common/numa.c
> @@ -424,13 +424,13 @@ static int __init populate_memnodemap(const struct node *nodes,
>  static int __init allocate_cachealigned_memnodemap(void)
>  {
>      unsigned long size = PFN_UP(memnodemapsize * sizeof(*memnodemap));
> -    unsigned long mfn = mfn_x(alloc_boot_pages(size, 1));
> +    mfn_t mfn = alloc_boot_pages(size, 1);
>  
> -    memnodemap = mfn_to_virt(mfn);
> -    mfn <<= PAGE_SHIFT;
> +    memnodemap = vmap_contig_pages(mfn, size);

... a possible rename of this function)

Jan

