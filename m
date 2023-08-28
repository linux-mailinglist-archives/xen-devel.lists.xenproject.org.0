Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3B278B20E
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 15:33:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591526.923923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qacMg-00047k-Gi; Mon, 28 Aug 2023 13:33:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591526.923923; Mon, 28 Aug 2023 13:33:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qacMg-00044a-Dw; Mon, 28 Aug 2023 13:33:10 +0000
Received: by outflank-mailman (input) for mailman id 591526;
 Mon, 28 Aug 2023 13:33:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UdW+=EN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qacMe-00044U-E2
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 13:33:08 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20614.outbound.protection.outlook.com
 [2a01:111:f400:fe13::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c0b9482-45a7-11ee-8783-cb3800f73035;
 Mon, 28 Aug 2023 15:33:07 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8609.eurprd04.prod.outlook.com (2603:10a6:20b:424::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 13:33:05 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 13:33:05 +0000
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
X-Inumbo-ID: 6c0b9482-45a7-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EB9XN8ntfqJ+tSrZZEjSakRKOMxF+4YEDFP7/3LecWqCXChNKzhRelX62NkExnp0bG49AiuxqGEJKs8p3kZHS0XTLYAsfYSqbnyPw5myA2tvXPs1c42L2IIJL/wJcb8myCcXaVcFFeuq8NPRozF845TFf5RwXRl2tfvYXkrzd12liGQew6JKC0zSl2ctmv1IDCS1v3eYYexp9W1iJHBwoJ4y3+XNGItc55hR3/Rr2FLO86PAQrR509MctWgSEnVq70r9nVGAZsfZ/PMm8kHsdAA9N2KhCV3LDNfIY1/Rtng08r8B9clGarQMNDOlbA9YHAdNFfAmw/cXFLjatjNqFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8Ffg7uF2AeIb+zrm9PCa0hMtNsBaI8A4cPGIgk5UHQ=;
 b=jvSLxKqGb98jwQbHKqFPRaAJr3KN8Zu4ECbQZ71EAReL6qHyNJoET0wyRdG1kEqInpFC19LQqIi9ivir0yipcfaCyrA2rx3VrioT/NuD1LQsdFr87HpCH/T1P801TE72im02mLPKy7/KZsx9cPZygM04VhL/lVPpDACX2esXsBaQwLQwr6N6uwsipi6qkG1O2zKrOzRkYnKN43U/T7YNj4Ki03ijqq7cuCiUytjsgrEv47/KlSiKtyQg28kape2Y56f9l3i9Av102MjAAbheYEUDVAt41+ZBG0AG8JaTXEHxZszhUghWFotZHEUngNz7397pUijbEo3r8s++B9K6Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8Ffg7uF2AeIb+zrm9PCa0hMtNsBaI8A4cPGIgk5UHQ=;
 b=B53h1ngBTnlPQAQbdG5fR2MYp6PyGVGVBRRhXtaZYhYkDr6MOVC1hEvJK+gubsqkttjlER6VPEdd/QTGEDOwHbPDffonM8vePvuf1JNrB2L9ZxJlkpAb4cN2mzv4tRFAiqW3s2G1O9Vb48xmJ7lya8suSHYHdP/1FxMKhee+Kq5n+hWJJ7qaNsQcbxN3BztopPnWLmCiFratPaHjxVIvFYM0Cu+UsSM4QlqPQdsipv7kWRjbLnS4AtZIZMhobj0b+cTRQ1pTmkwdsRAw7++AavJvnndrqc/txYNZ8Mu5Y2MveE0Utwso0NOsi75B9bwAev3/DB459Qx1gQeR/6y9Ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f310eb6b-8f8b-246e-60c0-2eeb15168ca8@suse.com>
Date: Mon, 28 Aug 2023 15:33:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 00/13] xen: address violations of MISRA C:2012 Rule
 7.3
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: xen-devel@lists.xenproject.org
References: <cover.1691053438.git.simone.ballarin@bugseng.com>
 <fd594b48-365e-0bee-aaa6-f413fc93267f@suse.com>
 <1aa50466-cad9-088d-a5d0-05396d866dbf@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1aa50466-cad9-088d-a5d0-05396d866dbf@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8609:EE_
X-MS-Office365-Filtering-Correlation-Id: 51e3d7e2-4c34-4f98-fcce-08dba7cb4f09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xtgkvwKoUrIHrGA9geo0IC9F4IKf6+RYN36qPUTiHb5DRMxxvyDP5USdDkNStxr29Yc4bjwHcUYBspfdCVons/iXWAzaYpJNtz2pdXx0IYeRSzrssAapsBJLmKJilkTCR9AV/XajR+iQ3PCT0gWwTZCMjpYRMdL1dzcrCnQ2Xna4lBB8qpqdqsmkj4krQSqn+d3yZf2WSFgxx1VhulQYw6oDFyo8x0/haTjpe0wysmwEgOWto9w1r4MUMMfhV73hx+CuNXiNqtyO7jRGVlib8pd2NlMGh3ZJK3TGrlFAoTzARpJCgW6A5ERLwt8Fo0WcS3qdya5nXKtvE6QFgSbfnVxz5mP9+MhtZmT8J1HbDR7OInUImf61auUkPxb/3PY18g9CB0B9/Zs+PbDXlVKjnS1sB5luXnx3kUVOSYjQxHMB5TupSPkgiFz4ZfSKyHtxjDrjgSE1rRMc/sz7fP2WJJXUgHROWnDiOAouj5AAcTrJA4NQiqKC1oKjUJxquLw1cVGs50buS5nlOetbUOyFvUYFuY4NTghicmZIUwhj10hP0y379b6162IJFR/5cI3OSibEZTACgNopx2Lmekwza9hso5HNtfTzP/ibAn5pj0O8M2qSFySogQyBy92ekRyOzU5hmpZn7fsRAhif1T0ApQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(136003)(366004)(39860400002)(376002)(451199024)(1800799009)(186009)(83380400001)(478600001)(26005)(31686004)(2616005)(6486002)(53546011)(6506007)(6512007)(31696002)(86362001)(2906002)(316002)(38100700002)(4326008)(6916009)(8676002)(41300700001)(66476007)(8936002)(36756003)(66556008)(66946007)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0hWY1JGMCt1TFF3OUFBMFAzV1pHNTZ6SVZCa1lMb3l4cWttYjJPSXVZTThE?=
 =?utf-8?B?TjJBNTA1YVFta0Fza0NTeWlURHRLUXRPb0V1WU9tNjRNZURRWXAxSUZnaUk2?=
 =?utf-8?B?R3dkdTZMR0ZSKzk3S1RlVCtKR2tlcmVValRZcTJwUU12a3pHdUVMNEJFTmRl?=
 =?utf-8?B?Y0dFZ01LQmdPNVFYV0piVVpEOEZFRjA5WUNEZGVtTDV2bVN6eDF0OXNOTktv?=
 =?utf-8?B?MDdlajNhdStuQ2xZalZqcGVtUm9zWTZQeFFTbndoakErSXFSOEJFVXNQUy9P?=
 =?utf-8?B?WmRHTng4SlRRM1U0TzFlSld6VzVjRWs3dlZKM05QbklWMm5OekRNREFoSEx5?=
 =?utf-8?B?VGNzQWQxdnpEei9nTzh1ejVWRVZUbUNTQmxWSU9BemNEZVRqd0IyWUs5dnpI?=
 =?utf-8?B?MDhXRlJ5b0Z0eEFVb2RhSXZrakJSZlJVNmtOclFVTjlNRldzNk00TWVVR0px?=
 =?utf-8?B?NThkdFlPb2NoaU9MNVkxMmZJU2hWaEhDaXR1THdmakZUMFZxMmN0czNEZjJT?=
 =?utf-8?B?Zm90WDBETGhJdUZ1cUl0c3V1Z0RyOHJKelN3a0FsWGVpNHFjM3FuTlp2YVNO?=
 =?utf-8?B?NDFPbCtJdUMvNS92Mmw5ZnVqTjhoeUQ0cmpVTWNWRDg5NXlyKyt5bU9LdVVt?=
 =?utf-8?B?ZjlsM1lIK3hwK25qZGRJUlRVOVprN2hzZ1BxelU0a1M3MUZSV2FwbC8rM0ZJ?=
 =?utf-8?B?T0NTSnhvTjFzUDRIME1ISTUzdkluVnJuVnZ4UkNJK3k0WGJ0dk5xMisxc1M4?=
 =?utf-8?B?NnpvVUV5RzNoeFZiOHFtRU5Md044WUFKeHFnMjVtSG1JaEpXR3g4ejgzbkt1?=
 =?utf-8?B?cnhjK3RiSFJBdlNFcU4zSEd2SXl0MmYzcEhwWXBIZEEvcmpnUDFEMFNRRWxo?=
 =?utf-8?B?anVjK3FtNTBYM3RhYmdPNFUxV2FpVzI5Q3F3YzBndElnRjNEaFlYb2JBTE5E?=
 =?utf-8?B?Z1ZTRWUwamRiKytKcjN3ckgyNEEweExmbmVNamJkRDUzTmN2SnFTbHBOZUVN?=
 =?utf-8?B?L1grWHhPa3RocGRaU2VUbnFGT1BLR3BhdFNFZ3lZT2p1U3lBSUpKMHhNQllv?=
 =?utf-8?B?NjFueEdKSUNpNFFmcHBEbEpUOHQvd1RBZGVjcHdEdVVDZWpWTU1UdVJ3cnlk?=
 =?utf-8?B?TjFIUWdTdndvR1VXbERLZzQrZTFaQnhzV0tHaEd3VW9MNnY5bDc1a0s1RmdW?=
 =?utf-8?B?bjVSNHFYZDBrS1JnN1pMSnNldW0venJtOG1ZdHk1YW1QZnF0bEhHdjdkWTFI?=
 =?utf-8?B?cVhwUk5CWHVLbi9DVDJ5ejhVVVJBWDJNWmtmMmJ5SG9obDlPTEl0VVYxMDUw?=
 =?utf-8?B?a2F2Rnkvc3hUamVONHJPaDlwRUYvY3A5SGl2Nk5PeHJTOExVVmhXamhpYnBT?=
 =?utf-8?B?NXZTdG9IdEFjRkZoa3l4Z3VkTDNTdkQ0ekFEcm5teUliRzZDaFB0b2VGSGhj?=
 =?utf-8?B?ejhxK1I4MENFWlY5OHRIQS9WQ3JDaWlqU2pVN05jOHRzMksrVTBWVjVnV0pz?=
 =?utf-8?B?ZTlXbEZ0TGhRYjNaT1N6LzNKMGRENjhLRmt1b29BM1JEcE5oMW55RmM1anl4?=
 =?utf-8?B?QjlOaDVkenNIbzROa2RWenNrQ1M2TnNjamlONUlBZlRBS1c2Y2pnZXFDNS9J?=
 =?utf-8?B?VTZXRlBLKzgvbW42c2dqODVkTFVSNFFCSW92c3F5TlpmSmNCRDRsQlBKWFJE?=
 =?utf-8?B?YlUzUVJpNkduVnZ3SVhuZ3BQaHJ3dkt3b3lhWDhJZW1jS0pXdXV1ZUQ4N3dI?=
 =?utf-8?B?aTR1RnAxVW15UWYzaUlwdTlIUXltN0lzN2YxUjFBeTFxS1A0VGdPalBDMEox?=
 =?utf-8?B?VmRrMk1Yc0E0RUdWNk1hWGtld1ZFUE5xcXJzV0Vjenh0V2M5V0dMT3ZySnZM?=
 =?utf-8?B?RVhoNGJVbUpRdytuSFo2aHFGQ08yLzZKTVBKNWFkaGg1VGRjd1UzaFpSWVVX?=
 =?utf-8?B?bDcxME1YMWxSVVJ6N0QvM2M5YXpCdHhYVXcwZzBqZkJlTGNzYjVnOHgxclRE?=
 =?utf-8?B?YTg4UW9KSU81VFRMQjJYbEEwOHpJampybG8wcW4wTmJudmZiZUQxc2dkR1Rx?=
 =?utf-8?B?YldmdTFady8zTzFYN05tQ1ZST2YwNjhmSldoODIyTHBneDgzQkpSWFg5dVB4?=
 =?utf-8?Q?Gpr//bqN4YAmlWjtVYgawptuj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51e3d7e2-4c34-4f98-fcce-08dba7cb4f09
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 13:33:05.1510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cHnFCo5k9xoBeMy2NlfrJ4p8trqCHrSrTwxArg3xyg2ztS37fKj1+OodTdHOdMwUQ/OsXzZTfZjmFJvYs7M4BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8609

(reducing Cc list)

On 28.08.2023 14:41, Simone Ballarin wrote:
> On 23/08/23 10:15, Jan Beulich wrote:
>> On 03.08.2023 12:22, Simone Ballarin wrote:
>>> This series aims to address some violations ofMISRA C:2012 Rule 7.3:
>>> "The lowercase character 'l' shall not be used in a literal suffix".
>>>
>>> This patch replaces "l" suffixes with "L", to comply with the rule.
>>> If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.
>>>
>>> Gianluca Luparini (13):
>>>    AMD/IOMMU: address violations of MISRA C:2012 Rule 7.3
>>>    x86/svm: address violations of MISRA C:2012 Rule 7.3
>>>    xen/arm: address violations of MISRA C:2012 Rule 7.3
>>>    x86/IOMMU: address violations of MISRA C:2012 Rule 7.3
>>>    xen/ioreq: address violations of MISRA C:2012 Rule 7.3
>>>    xen/mem_access: address violations of MISRA C:2012 Rule 7.3
>>>    xen/vpci: address violations of MISRA C:2012 Rule 7.3
>>>    xen/hvm: address violations of MISRA C:2012 Rule 7.3
>>>    x86/mm: address violations of MISRA C:2012 Rule 7.3
>>>    x86/viridian: address violations of MISRA C:2012 Rule 7.3
>>>    xen/x86: address violations of MISRA C:2012 Rule 7.3
>>>    xen/common: address violations of MISRA C:2012 Rule 7.3
>>>    xen: address violations of MISRA C:2012 Rule 7.3
>>
>> Since about half the patches are still pending due to missing acks,
>> just to mention it: It's normally the submitter who is to chase them.
> 
> This is the list of the pending patches:
> - 10/13 x86/viridian: address violations of MISRA C:2012 Rule 7.3
> - 08/13 xen/hvm: address violations of MISRA C:2012 Rule 7.3
> - 05/13 xen/ioreq: address violations of MISRA C:2012 Rule 7.3
> 
> The maintainer for that files are Paul Durrant and Wei Liu.

I'm aware of that, so it's unclear to me what you're trying to tell me.

Jan

