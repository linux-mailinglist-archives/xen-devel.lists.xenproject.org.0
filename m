Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE956AB74A
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 08:53:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506719.779848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ5eC-0006H6-Sk; Mon, 06 Mar 2023 07:52:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506719.779848; Mon, 06 Mar 2023 07:52:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ5eC-0006EU-OY; Mon, 06 Mar 2023 07:52:40 +0000
Received: by outflank-mailman (input) for mailman id 506719;
 Mon, 06 Mar 2023 07:52:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MPo4=66=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pZ5eA-0006EO-MN
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 07:52:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2075.outbound.protection.outlook.com [40.107.7.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dccb18e0-bbf3-11ed-96b4-2f268f93b82a;
 Mon, 06 Mar 2023 08:52:37 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8276.eurprd04.prod.outlook.com (2603:10a6:20b:3e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 07:52:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 07:52:08 +0000
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
X-Inumbo-ID: dccb18e0-bbf3-11ed-96b4-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KThnHuubOUXrYxgmSioywnujgAlTBm1Vx45MXgSmyNpDZ8uphpM91XGp462r6J/tqeEl0OilqCqWpYri5nhGcdRDKdUbrmbBxP2X1vfNgHy0jY09dL/aiqkwtmvsimSS+PSj2YBR7sQJKmpkrYaOQKPcktOrI30rPLjE8t9TSQBzOjNZGzzQtexLxTf6+wZcE49WHZygVRBplwdJFJDeg3aGQwWQkG+RXCk9TLc4ZUu1PsWcYpdfBxGRslBpZvyHxpWUwQ2j2OKqLzblCLh683XlN/o9BFujzfc77fJ3hacHiwEY7nM0c7PPda+xm7bVYB0VNO24OoE0cmbzMthl5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXiHBFC03vjmnJP/fGDU1GJSvwRPTe1uDKumwaogx6w=;
 b=jP9/YvpwcXUquQSWfGPnJNkniaQD3lE5Lda4y/KqxTLQioE8Gm3YoyHBNpM1YOGy9Kl0EEl1/BBlDhGsOIAv8WSzccf/viJ1aOkauZUAcxC0YscEt4L5Vkt5i4htq+tZHTVu4QhzqY7HNZ9ZJtXUn9iltKYp1hj92NfqN03A/60n5zNk6R8eNm8WmnrUyCk+d5EuNHdiESIyX4NqCLfe3pSt3un9uS2sgPLC2amxCVDlAFeTXJtnpbDAfAaR8V35dPcHxgkB+ScLkB5gtBAh5uEgXQJoE13tbcHEaMnjCxdmwhHu2aCzX0IXIPYpym6MFQm78JZQ6tOziI90ew+2WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXiHBFC03vjmnJP/fGDU1GJSvwRPTe1uDKumwaogx6w=;
 b=PRQ7SYbj1TnBIw/CNf5A4anZ6C8wWDSOT7M1Gf61/Y8qM0DZdAIjg44MiwsInfe23dYILa+qWBYDqHKQx8fiJkid0aycmnuR4m5BKAyi2gNojXxOKcLhuLVSnZ0mTNqnWgjgXJtoDSNUIjIoXK57FzHX7rG8OCYaa7ARU8Oo5UAaTDB+F01jO+qolhEow+X1swTBv00i6BpfRZAs4j7Wl03ZAA2/fvkYc3J9Aq56zOJdLeEhmELo0x6QM1Ruis7vkoDVDpYlW1nBg++bZWhO0kaRHoc7UFB8dhwZefp8QwSFQIycHnu9lXXiLpIj9OJ9znXnfEd13D6f5hcsKYzA2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <40bb78bc-c406-f18d-f1a5-ce3a0a448a67@suse.com>
Date: Mon, 6 Mar 2023 08:52:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/4] tools: rename xen-tools/libs.h file to
 common-macros.h
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Julien Grall <julien@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Christian Lindig <christian.lindig@cloud.com>,
 Juergen Gross <jgross@suse.com>
References: <20230306072140.28402-1-jgross@suse.com>
 <20230306072140.28402-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230306072140.28402-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8276:EE_
X-MS-Office365-Filtering-Correlation-Id: 32a5de93-da92-47eb-ce47-08db1e17af8b
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y4P35knwSpOJ6HUdjUzRlNQm+kSnTo83BTFvwmruWrSmicDOD+/cIivPoGSsVQSLrp/sZgyDSDZNCmWs2DN6HUed34Dj+lUJX/eza3cm5wjsduc51gsBHbK6h/IHNn/d80nPl1aMMlgstuCuV6TJQNN43QV49uDSht+Rh3tarGj4sf1tKP7ukAJ5Ho1p7LDGtW58vNoaooiaVybCdVyL4J4uWnA/wLoKyc3Qx0lGSqR7wVVxd3Mk0wTuqLJ5WR81bw5mzEhz7WP/heQ0AN0ZZIOvM1bHzACmd9GZBOQoIOzbMESHo/Hvrd+mJs96ZlKkmjqVg344A7+lqHsAx3KsEPgINeZrXpIjQ5b89GGVp26jrg2yhCXGRSxZHKH2HgLxu4skWWedeF7yrCABM/pIJPffnhsss4zal892KsFuLUphse1WdwXN5X+FnpXB8oRJHow1d7SMsOgvhPLdW1J8BVlm3OKXpWT9w4b3cAw5dDzBaIs+iUe1LcG1qsaptem+2P4x4AWlyTdYWn/Bs/85rnW4BlmvnUOIdR6R7dOHiFsgvQp6G2UlKJenybWgJQBayPBPJs7OZBMxn9W4iqj/KIl4vCNDfsS4F2/krGHgMK6z1U5OoE+0skzAvweXQq3ykx8G1Ei5NPdwvWk0v01/y9AwdyMYDQuKJgzh8qp4LbHkajJNnV7msaRSMjUvlWV5sjjcAr/BO/3dY1UadMyv+YJ6//tFtJNWVv93+5hGf8s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199018)(86362001)(31696002)(36756003)(8676002)(66946007)(66476007)(6916009)(5660300002)(4326008)(41300700001)(6486002)(478600001)(54906003)(316002)(66556008)(2906002)(8936002)(7416002)(38100700002)(53546011)(107886003)(6512007)(6506007)(186003)(26005)(83380400001)(2616005)(66574015)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlJ6VC9vUW5pR2NnZ0N5U1ZRS0hNZHlJT21WZDErMlVrZk5yWklET3BmaXpa?=
 =?utf-8?B?eUJMekUrYWs0V0F5czNpZ1hhLzc2eDhGRnFWeWhBaFVWN2RPSk1pWkVQYlMz?=
 =?utf-8?B?ZXJIN1RUSTdQTlEza3hYZTUwcmoxSjdMZEtjbGt3K011Y3g1eDlidmxrc29i?=
 =?utf-8?B?RExHK0JNVVBsSnBGN2lPYk5VbGhvUmVTV1phYjNrdnpwYnExTldRZHRlRDhw?=
 =?utf-8?B?RVFOY093TW9tejJycU1rQjdpSUc4WTFhd2txVTR0YmlqYlRFeXI0STBURGxH?=
 =?utf-8?B?ZEo3L2wvVnNCTWRWTUxCb2g1akJZc2xESGx1Vkt1N1NxelpYWkZTbkxicmlu?=
 =?utf-8?B?UnoveUpjdDcwU3B0RFdqZERMaTMwUFhmSzhkSTE4aThCdW1ISXJ1NjlLZEpV?=
 =?utf-8?B?UVR6ZGhIbTZjRXhEYktvOE80K1IyS3Raa1Y5K0hsQVBVZjE1Yzlucm03ekNT?=
 =?utf-8?B?R3pVSlNwdWF5Q1hQdFJIeWhabWJPaTBkSXN6b1IyUENvNWJCM2VmSkFlN3VW?=
 =?utf-8?B?SUZWbVAxU09JdlJ5VEV5SFB5SUVWZVRub3g5dUgwVndxOTViWjkrWUNFQ3A0?=
 =?utf-8?B?dCtTSzlZUE1XSFdiNEkzTnpjbDFNTS9lUS9PaDgwSkdESTh3YTdRbUpBNlF3?=
 =?utf-8?B?eHBtazBZbUhpbERDRmR1RXNZdElJbHhiZ2xyQXhHMFRhTUxYaWZUZHdPcExP?=
 =?utf-8?B?S2dYdm1ObFhYcGtuRlpxU3RURzd5RnNjVkdJMVB0NEQ5V3d1cFpXV1BXNkpZ?=
 =?utf-8?B?eFdFWHprNlVHRUFreENoVDVidXJyZXlpN2tQSGJlLzFGWjB3ZzJETm1nRGQv?=
 =?utf-8?B?RzdPS3RTY0FzVlkwRjJBUWxiUk45SGZ5N1pyT0Q2dXdieGtBKzc4TzEycXIr?=
 =?utf-8?B?U0NQYXdZakg1NFBkYmw1amJnam5YbzlmNk11WldLQk44eGRoa01JN0NybWZB?=
 =?utf-8?B?bStLMWExelEvTVVBbXgrNGN4eldxNEk0d1FFNnBwMkE5aU91QmFCRlRKdmNv?=
 =?utf-8?B?YSs1UFRRSSswWVJJK1d6VGJaUkhuZTgrKzljZFpDakFkVzVXREdoMWZOS1k0?=
 =?utf-8?B?a0ZYT1FidXpzTlRDaGgyQy9sem14VDZINlF4NmtmRlRFcFpDdTB5cXNVY0xj?=
 =?utf-8?B?KzZpVEYraXUzd3hBZ1BqeXY4SXFLNS8vTi9oMUd0REw4ZUdjc2hKRThIZ2JQ?=
 =?utf-8?B?SzdXRGpWOVFDL3d1b2VhcGszK0JCTHIvd3FUMzFPL3JRQkpiL1FJeDRsSElq?=
 =?utf-8?B?Z3FhZmRsdXpQY005MndzNTBQTWFYL0FZYkdHWXk5NmcxeTVKY3krbmk2RWNB?=
 =?utf-8?B?enVEeWdKa0xwU1ExdW1EM0tWek5QNS9PY0piM3BsUDFqN1ZrTmlJVFZBVmpn?=
 =?utf-8?B?VDFocWp5OEJSOEpHc0FkaEdxNkhCWElFaUpMYkptN0J0V3N0OFRSbXN2dktv?=
 =?utf-8?B?NnlvWWdRUEIzMVNpN2J2UThaUU1KU0JMSWJqdHYvK1VsdWlLckJheVd5VGk1?=
 =?utf-8?B?VEp3ZVZ4QnA5RFEzY2pZY3E0R1QzSnRHaDF0czJiZXp5VmtZblJvQjlpN3Bh?=
 =?utf-8?B?TCt5U3BHcDh4Y0Mwei9jVGhhblNtTW5yMDg1QWxRc0NQaW9TOHdQMFNMcEhL?=
 =?utf-8?B?Zk9mY0I4R3g1RWFMR1NJbkhLaDAyMFNLUUhVQjAwNGhlR1JrSytaZENKY05M?=
 =?utf-8?B?VFdEMGNuckI4Y0dVM09PYjdiMi8zbkNFN3lOa1kvQ2hxNEN0cmZjSkkvdUtT?=
 =?utf-8?B?dDZBSHFCRkthOEZXMUtLQncvaENyVUdLMDlWSkljTVJ2dXBIcWozWHR3Rkc1?=
 =?utf-8?B?dWx5SFRDQzk4WktNQjNzMGRHZU9sSEZNSWI4NjQ0WGEvZDg3cXdOZ0NFem84?=
 =?utf-8?B?b3VONFBFRWNXOWJ2KzIrdFV5Q1NtaitnSW5pK1cyYStTZUFsbGR2cllqNE9y?=
 =?utf-8?B?UzZHeStyeFBLTDlzV2w3WXgxQXdjNzg5UENRZ1BYKy9sRUM5eXg5R1hkM0Ji?=
 =?utf-8?B?b0ZWWVEvdm03UDRleEZwVUxTSEw4d3hOMnJOdUNtYVUyUkxOYWQzNTlkck9Y?=
 =?utf-8?B?R21QYk1pNFFaYlBNeG9ROHcxeWszU3d3eGZlMkpQZ0g2MnZETUh2a2tNbGpa?=
 =?utf-8?Q?IREv0QOkpyW9uX/enKjzuIt2l?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a5de93-da92-47eb-ce47-08db1e17af8b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 07:52:08.2563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ckZR+wr5QyqZ3ORJ7IjRNI63qfeY2dCPwuz/0xRVay/w1fUVRTTQmS8A8dDdSVjjIPq+fl8av3VWKAstZgT/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8276

On 06.03.2023 08:21, Juergen Gross wrote:
> In order to better reflect the contents of the header and to make it
> more appropriate to use it for different runtime environments like
> programs, libraries, and firmware, rename the libs.h include file to
> common-macros.h. Additionally add a comment pointing out the need to be
> self-contained.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com> # tools/python/xen/lowlevel/xc/xc.c

Just as a general remark: I think it would be nice to strive to keep
such scope restriction identifiers short as possible without becoming
ambiguous. With this ...

> ---
>  tools/console/daemon/io.c                         |  2 +-
>  tools/fuzz/cpu-policy/afl-policy-fuzzer.c         |  2 +-
>  .../include/xen-tools/{libs.h => common-macros.h} | 15 ++++++++++++---
>  tools/libs/call/buffer.c                          |  2 +-
>  tools/libs/ctrl/xc_pm.c                           |  2 +-
>  tools/libs/ctrl/xc_private.h                      |  2 +-
>  tools/libs/foreignmemory/linux.c                  |  2 +-
>  tools/libs/gnttab/freebsd.c                       |  2 +-
>  tools/libs/gnttab/linux.c                         |  2 +-
>  tools/libs/guest/xg_core_arm.c                    |  2 +-
>  tools/libs/guest/xg_cpuid_x86.c                   |  2 +-
>  tools/libs/guest/xg_dom_arm.c                     |  2 +-
>  tools/libs/guest/xg_dom_bzimageloader.c           |  2 +-
>  tools/libs/guest/xg_dom_x86.c                     |  2 +-
>  tools/libs/guest/xg_sr_common.c                   |  2 +-
>  tools/libs/light/libxl_internal.h                 |  2 +-
>  tools/libs/light/libxl_psr.c                      |  2 +-
>  tools/libs/stat/xenstat_linux.c                   |  2 +-
>  tools/misc/xen-access.c                           |  2 +-
>  tools/misc/xen-cpuid.c                            |  2 +-
>  tools/misc/xen-diag.c                             |  2 +-
>  tools/misc/xen-hptool.c                           |  2 +-
>  tools/misc/xen-livepatch.c                        |  2 +-
>  tools/misc/xen-mfndump.c                          |  2 +-
>  tools/misc/xenpm.c                                |  2 +-
>  tools/ocaml/libs/mmap/xenmmap_stubs.c             |  2 +-
>  tools/ocaml/libs/xc/xenctrl_stubs.c               |  2 +-
>  tools/python/xen/lowlevel/xc/xc.c                 |  2 +-
>  tools/tests/cpu-policy/test-cpu-policy.c          |  2 +-
>  tools/tests/paging-mempool/test-paging-mempool.c  |  2 +-
>  tools/tests/resource/test-resource.c              |  2 +-
>  tools/tests/tsx/test-tsx.c                        |  2 +-
>  tools/tests/vhpet/emul.h                          |  2 +-
>  tools/tests/x86_emulator/x86-emulate.h            |  2 +-
>  tools/tests/xenstore/test-xenstore.c              |  2 +-
>  tools/xenstore/utils.h                            |  2 +-
>  tools/xentrace/analyze.h                          |  2 +-
>  tools/xl/xl_cmdtable.c                            |  2 +-
>  xen/lib/x86/private.h                             |  2 +-
>  39 files changed, 50 insertions(+), 41 deletions(-)
>  rename tools/include/xen-tools/{libs.h => common-macros.h} (82%)

... diffstat, tools/python/ would be sufficient here imo. (As noted
earlier, I consider the marker unnecessary here, just like
Christian's isn't scope restricted to tools/ocaml/. While I accept
that views may differ here, I think it would be helpful if within a
patch optional scope restrictions were all present or all absent;
ones truly restricting scope are different of course.)

Jan

