Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F955719A5D
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 12:58:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542403.846221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4g0J-0003WU-6C; Thu, 01 Jun 2023 10:58:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542403.846221; Thu, 01 Jun 2023 10:58:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4g0J-0003Uf-2g; Thu, 01 Jun 2023 10:58:03 +0000
Received: by outflank-mailman (input) for mailman id 542403;
 Thu, 01 Jun 2023 10:58:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mTbf=BV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q4g0H-0003UZ-KZ
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 10:58:01 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20630.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c38f91d-006b-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 12:58:00 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAWPR04MB9957.eurprd04.prod.outlook.com (2603:10a6:102:385::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Thu, 1 Jun
 2023 10:57:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 10:57:57 +0000
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
X-Inumbo-ID: 2c38f91d-006b-11ee-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kE6cDovx27a+yXTkOBkf0xfI14zLEkP1S4DeFUVlCCwUUQpK7l3FGEDfllYq9WCQd3qnVz61/ogU5TpYjyBNCuPDi4auU/NPRZ4ClQEMhoEVs81ib3D880CUD/DuWCDBHBPiP5j0zZxuomdRXvzRwnNkyRv4L2tsQ1VzA5s6Ji6xI+oclvR08/beUOOvJgUGkNA9zaY8d6B7+QxBvin2FhmS9FSQBW8IqsAwJ9t7LrLncPMdD4aKKDRskoAZsgmdhGyRKi8rkkjbpkoPVLzrb5Gzo8HVQw2PG01OWMprB8Lqe4Y/stAy74fO+PHHfseckzsfRyr/RWwrvQNGddtmaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hMhALOEjyfOey7mcVHlpBF5AEhNg87lIyB9OgzmwrFw=;
 b=gkFwS3JR2heiTGhbCtr8993daZB/j7tKooJl867Fewta8+zybXIVgVo+nQbQ0fOBWrnPoiv6dRqQBlhvfpTu3Jw7vSZxNN+bd+lIP1qEkpZEWm/C4SDkxpiXoC30v9LRF4EBcrTTjjY/yK6hycu999nnaFZcsjzs536T6pDBx6T50bTr284NHzHEqhiSXKpjrWMrKYM/Q2Kgfn1c/iHHIZCA65wt5dXV2l/lSDgwqkVxFuSHnC1Y97Irjg/MvtJsB/gRoMs+HXK7vGWEri5gTKAT15LqQ37iS1I5caNw9qWvv3D4jiYMT+Qww5kWKBs5JUm9JcrrlSG4qm3BXUlm7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMhALOEjyfOey7mcVHlpBF5AEhNg87lIyB9OgzmwrFw=;
 b=l9qyXrfT+L1MvAFeFY3q0zw7WtMFvClDgErB+6SRvFt0jbuFHryVYjIWnFjpetpvpcOsI9mkh9H5sZfg0Ik+Bg2OqXtTsyT+ASS86WmbOimTRYExDHKEQKhTxYu8ARGePSSWcvdK9UzE9ORZzagPUbCoLRclbMQmWIWx9nKcqanpbE516cWjrkzCuOzyRm173tSt+MwMMOq2Lx+kkyiqSTF1tr7ed/yK6TtSt6/sxfj+8s3nlJi6h1Y7zw3/jHQSo6JpqLZiRvTCtyRMnh23DyQ4aNNW3Tx11Pz/8zJd9mLLAGBODBXyY9HTFS4VANF26xQYxiE0hPeuyIHtzMu77g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c4d68b28-94ff-9edf-02df-58537d109372@suse.com>
Date: Thu, 1 Jun 2023 12:57:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] MAINTAINERS: remove xenstore related files from LIBS
Content-Language: en-US
To: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>
References: <20230522160008.27779-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230522160008.27779-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAWPR04MB9957:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a2e0a5e-d22a-4b1d-2d49-08db628f0f06
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s0GJHwW13QiYd7KDom3H/dljzbhFRVNxJZPhf2SiIrHZJEhAViFFqeA3JTPYU+jhXget79sCI+pnx2kqOEJ5FU5vjo5KykPLru9RuGXda0OQA6u0SNezxTTr0uITn1IaMyHXHlBsX3Nni7pxkoJAKPRqhsiLcv8XwSEFiY/0jgAiB7GosV/9RDqgJQxQZfihcdHyWLP8RRFnzRBJaykfBqL9ZOzPbc/NsNgqnxOPjljapzq0YBkj8SxZ2yDczh09JBWJOcWJtb8/0iSTy+DfkwgPzGGJQcMw6lZ5uyH9Jp6N5DrSaUW8GLZV6jbwY4PUrJeZfm5KHGloNatVcXICfaD63w/DgPryXV9EWx26zYW9HFD5u+K3O7U5yC8HfrPp4yjp2GnbVpSixlaCmzDI8sR3TF6FRXZJq2IWUV/dpEb6aX37p6DNrY+8tq0wjrhHQn8Pd9DlukJoSqUbP6IxiDsIL/s/EE3/MGwMfiekApAGp1CmhDGkBk5CjoVPafqs5bY1lLizLH17HiI6UFId2+iSeRqwgSbhXnrluWPbpcvEmeWueyYgx+uzmAiNhPevPtZhEZmnlbuTf4Iyz9Ibo1gz9/duqXaYI8AlMh3LPhhAICFbPrLS/ZBhlQSnYkru5ZZzWcDhg2bZE5zt3Qov+Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199021)(6486002)(316002)(5660300002)(2616005)(41300700001)(8936002)(31696002)(86362001)(8676002)(478600001)(107886003)(38100700002)(186003)(6512007)(6506007)(26005)(36756003)(53546011)(54906003)(31686004)(110136005)(4326008)(4744005)(66946007)(66556008)(66476007)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEFGOGNkR1pHT2JMS0VOaVJ0RHJIVmtmRlFHMGJ1Nmc5cGowT0s1RllOQ3gx?=
 =?utf-8?B?VWJtTW9zdEh4VENQa01vMHQvcytWaFlacVpDZk5KY3RqTzFhTmxEM2VuVXdN?=
 =?utf-8?B?am1LUmtHYnlMZXpQaDkvUUNxc1BDSlUvZ2ZRMytLWlFIV1RaSVFiWnRJdGVM?=
 =?utf-8?B?Rkp1NEp5SERoMXFTaXlQd1ZBVUVyOHJTOXpXS01jZE5xNTBhWFVDL0V0WXZq?=
 =?utf-8?B?WWpkVm9KY3pKM0NjRTZTNkxVRDZJLzlnNWNUNTNycVBOUnl2UzJWWTlnek4z?=
 =?utf-8?B?Tzc0ZHY0cWZkZUpaNVBHbEhpbzl5VjB0dWlBSHJlelBXLzBYN1RwU1crOFNM?=
 =?utf-8?B?QkZoVkhpNnRNa1E4dXpGLzllcEt6d1lLUHNOTHNRbDkrdktVK0NwZEl3eVIx?=
 =?utf-8?B?YnZFUkdDZDBtUkp6aGcxcG10Rk03bDlMNjA2QU1iV3lrdmg4WFJ4QTIvZlVL?=
 =?utf-8?B?TXE3RmlCeDNWR3V2K0xOempnd3p1ZlN6TGExeDBwQ2dudnJWZllOVzg4L2pG?=
 =?utf-8?B?RGxEcHZ5VTF3c2lZYUQ1ejdBbDk0eGlYSUFnZHBLYmVBL3lyQ0NrYXZvSDVV?=
 =?utf-8?B?OXcyb1lVcnV1WGh0U2E2OHN1UHhoVlpWUHF0OVJzTHF0dnpDSXI1Zzhtakg3?=
 =?utf-8?B?Zk8xbmlQanhZVFZFaVkyejdBbXFOWER6SFYyODQwSFRObnEyWUFQeS9iN29Q?=
 =?utf-8?B?TjA1bHNJamFlck0ydHdCZzcxaHpsVDk0L0taNWhSUTRRRXRqNktnSmI5R0Yz?=
 =?utf-8?B?RWhyNUE0aU9wbTU2NFpnYVYzU1Q1ZlVYSFhoc3BiOGhWamhlc3l2cW52WGNW?=
 =?utf-8?B?blZ1ZFRGRWNtRUJvZERCTmw4MjA5QkhSMEdCNFlhZmpyOVozSnNMOXloc3hi?=
 =?utf-8?B?NmdSSllubGpqaXpwMzRleHduMkJNWjdvUTlBYS9iRldianNnTnkvS2s2dm13?=
 =?utf-8?B?VjNvWFEwclprR3VjemhvZE5UOGRVeGNBOE82WG94VzhPVWM1T3QvVkFJVGhi?=
 =?utf-8?B?b1NvZ2U5bUZkUWZQRiswM3YvNkNOWEZ4MndncW1xYyszdElqcDBlU29hS3Y0?=
 =?utf-8?B?UjE1L3pYTEpzUG9tNVFYWHZORnN2clZ4dGZ3TWM0RDRSL3VRUUppdlE3Sk05?=
 =?utf-8?B?UUpEZXRTNU5EeklSQjJsY0pQOVNXOWdWdnFWVzF5SlFHR0NkQndlY0J3UWpP?=
 =?utf-8?B?eFVoaUJpTVVNMTI4em45K2VWUmF4RExFZVI0dmM3d2UxZUFJUy9rMzNqWDNF?=
 =?utf-8?B?MlF4S0hEUFdHRG5RZFFRMGM5QW1EZExLeWFqZWRRMlFTdUlaNTBzWWJ0S2sw?=
 =?utf-8?B?S09PT0JkUDZmTDNuOWdnYTdjT3d1a0tOMFZ2RkFrQktUd1lGcURyWXVFK1Zk?=
 =?utf-8?B?ck9xS0NOZFRJdWNqT2dkSlZHOVM3QzhIZFkvR1FaeWZDR3o3cE5laVllcUpL?=
 =?utf-8?B?VmhuSllHTWNRbzBnM1J1UHZSZGZSNmF1RXlWbFZYYWVKY2F5SGZ1YndYSDVw?=
 =?utf-8?B?RWdMWGh2OU9reFRNSTZUdDZ5N1ZPaCtRaXJSdUI4VGpCMzZYQnFLZHNRQlBK?=
 =?utf-8?B?MFI1TWpFOGFDdWxkWGRKU25saHdrQjJDNGlDd3hScDlCMFprcnRJRUk2aEhM?=
 =?utf-8?B?ZEhwV0tPVjc5eUJhSDg5TlBtclNpMzFQSEJ4S2VEdy9pMTZ2Uk0vQVVnSGZX?=
 =?utf-8?B?TGZhZ1QyeWV0aXNLVjJmR0tFUThiS0lSZzBiMzd4UWkzZkdzS0xtODFJSm9O?=
 =?utf-8?B?bCtLanpnbXljbklYRWxRVUJYNnYyVmIzd0M0aGIxR0lZQUZZT3NEZDVwdVRh?=
 =?utf-8?B?dVkxZTdITUwwKy80WWdyYmdjZ2I3cXNwOW1mZ1hHVDZOUjNXMEY0aG1aRWRO?=
 =?utf-8?B?bHZGMjV0aStUR3hNTDkvVk1rMnpqQksvbDVDNzc5VHpkTkxyeXpOWURyQU40?=
 =?utf-8?B?eWJOZWxYWTc5cXNWQi9ITVZsbFZXMzhoRFVDamF5bTl0WmF5WDUxWE5IcTYw?=
 =?utf-8?B?Vkh5NlJPQXBKYTRrazNKU21Ta2M4aGpNRjVYcUIrVkJmOEpaUFhnZ0RNWFd5?=
 =?utf-8?B?QlUwZnJPKzBXdzNmaEx6S1NYUVRZMlA2NTJUaEFRL0FMRjNwZ0NNMnBUSmd3?=
 =?utf-8?Q?aBSm4zuCEVoI7OFym9+3TXzvp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a2e0a5e-d22a-4b1d-2d49-08db628f0f06
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 10:57:57.7003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aq91BGgf+AbSNnzUekaFYi13UjzxJ4eNHzBHz+UTvzjrBRtwyTa9c4p3qGmjuSVOpHuUK2+bqV1UywyNSyPpmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9957

On 22.05.2023 18:00, Juergen Gross wrote:
> There is no need to have the Xenstore headers listed in the LIBS
> section now that they have been added to the XENSTORE section.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Anthony, Wei,

since this is taking away things from an area you're the maintainers for,
I think it would best be acked by you.

Jan

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -411,8 +411,6 @@ F:	tools/include/xengnttab.h
>  F:	tools/include/xenguest.h
>  F:	tools/include/xenhypfs.h
>  F:	tools/include/xenstat.h
> -F:	tools/include/xenstore*.h
> -F:	tools/include/xenstore-compat/*.h
>  F:	tools/include/xentoolcore*.h
>  F:	tools/include/xentoollog.h
>  F:	tools/libs/


