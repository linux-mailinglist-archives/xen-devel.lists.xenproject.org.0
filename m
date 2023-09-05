Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ABB792439
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 17:55:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595780.929395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdYOF-0004oT-NC; Tue, 05 Sep 2023 15:54:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595780.929395; Tue, 05 Sep 2023 15:54:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdYOF-0004lO-KT; Tue, 05 Sep 2023 15:54:55 +0000
Received: by outflank-mailman (input) for mailman id 595780;
 Tue, 05 Sep 2023 15:54:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JoEh=EV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdYOD-0004lI-LB
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 15:54:53 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c46982f-4c04-11ee-9b0d-b553b5be7939;
 Tue, 05 Sep 2023 17:54:51 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7948.eurprd04.prod.outlook.com (2603:10a6:10:1e6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Tue, 5 Sep
 2023 15:54:49 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 15:54:49 +0000
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
X-Inumbo-ID: 8c46982f-4c04-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BU8s4yaaIeufEBWII02wgYOpCQytQIfHDr1j+kNdMtosApAYYNz7HGEjLSpu18l9FH4bfUEBfYOdjDIU5Cyd4EbSD08TIP54E3Vsl9qQtTOIsGUYj8YbUZNkmx3BCQfA5PEi5bi0jjhulVBvIZyy/yDezwr4xIj6bJ4nQ1mIamnb99T1bBFk+HX37aKIMI2bBGvdYuzjYzYwuxHyTbGc03eVW+QVf6K060I792MdqNIir0IX0a+bvRuryvnVn5YQKGc8GnZ4wqezUz2jQYa9Nc7DoLwOg6t2mG4ktGMfTuttiMDyNNLUXPS90TZLvfg/QNyV+CTjWpBhd+776WoxLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mAW8ffXMYnsUL/t8juwJ+T0e9mNjFfmdRiuiTpcgFVk=;
 b=DomS4rD27PhsZibcxnjYiA1ifbRIzYl1LMQLCXiaWFiJ96lQ/t7HWxL7dzYu3+mWaYvHt2k/iYkSSvKuKPniVPNotuswILmXnfsxY4q1Z4/wilr6hGEGqYCQSGhe2bLs5cY166qvE6EUYzR2xw7wpg0YiQNPwmqDRJZHFasXIWgf87QWaIDNUMh6kQGI3Hywsy8mNtjpsLN7H3AuEgyr7B9tRlxqvROT8Tj9j4AcWDNQSLQdhNLfc8AYcHlanl3kXjZcpJBC3xMHlx4csNMChpn1RNok18aAyWwDIQLvUb/zGSP9fWrtned5NP8OI1YPivF/MFKCN7T15xLuCJ8aDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mAW8ffXMYnsUL/t8juwJ+T0e9mNjFfmdRiuiTpcgFVk=;
 b=yAExpvoPEhypnbKCwFsR/ppgI8Fk8WIVbF7gCT+vEcCAxz9Lj3D45NmO9Ji+1/Ss3SUAXymc+dVsxNwGgOeVmMX19Jhan393Ueet5Tp7lqoHvLp697KCvI3qTPFo8/WZ47AWc7JcTmzs9hgN90CdobNuBSz2qIKwYNJpPS22Y3Lze+/xZL32ELtpAXaSNaRqMDJdgDB/kFhgfzUS0YE8o9Xhe4PoMg9ajmdLONbixFmDVUI7twC7GvmmPtiVXq4zgraXuRzZ1lXgO9OwPyqDywtyWjnsV3CCwBWFLJJ3lgUHoDcKeBauAKoR/hS3ybfO8xpNRm6hLokOdrgM1vuw/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <910a5e9c-eda7-86aa-2100-15fcd055c0b5@suse.com>
Date: Tue, 5 Sep 2023 17:54:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 1/5] xen/ppc: Implement atomic.h
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1693590982.git.sanastasio@raptorengineering.com>
 <917dc5517b69657b48e69c4100234383f5c70e0e.1693590982.git.sanastasio@raptorengineering.com>
 <692dae52-947b-5856-f1b8-5d9f03f78e6a@suse.com>
In-Reply-To: <692dae52-947b-5856-f1b8-5d9f03f78e6a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7948:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f802848-feeb-4099-5a4a-08dbae286f3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T5/i+/MmF8nqSUh2BX3+B+uLXrnIeUgvtlhCGM0RUszmUYAa7pwTEbEbt5aF99LkSRJzKsbbVHvNrevfu26XL19nr4sgiO9/s2hkprm3rTotgD2VAapedH+0dceE4c4R7zOa3avo+3RcuAuOKOdxMC2g8f9LFjjwLaA80QumooPXR6ZEgwao5fFU81kbGXUgc44SQdDH6LvB9lQXupuddcqmctdk7Mmx5X4zLOKB99zJNhp0eqGtEDZsHYII41FYzg8FnvUH1aYEg1a6Th4BN+IGwPG8byXXMn4GqiBTb3v98ngP7df/jtzrPxJz9LtIRp0M8ZEnH5HA3cO5uUkqQfWfV6mpemCe/DdUgevYW5Qb4q4X/0hFfDuCVBHZ9vG88jb9iwTqaLbjLpHEZS3KgjYorO2DDlpaswNAhCSqCJUh7EfS6Jl3LhF81kznH/XLuwua/QYxTGn8prh/+ZQ4IwXAsMNchtI/m8/UCyjn1d/QwS4anBUcwdjQGV/TyvEoOmEiEhuFtAWHjBJZVTOBMtS5nDwx8N7wCs3p1u0L9476A1tOKoc21nmSwyR2LzxkY+VOuWTJC+WRG8l7yBLbQ7R096/gK15eYqVj+eziPr5I4/Y5HprqumPKMWDGTrjW1aH0WZbEyhZslpYGPHwZTg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(376002)(346002)(136003)(186009)(1800799009)(451199024)(53546011)(6486002)(6506007)(41300700001)(478600001)(4744005)(2906002)(36756003)(6512007)(38100700002)(316002)(6916009)(31696002)(66476007)(66946007)(66556008)(86362001)(8936002)(8676002)(4326008)(31686004)(26005)(2616005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M29jVlI1SE1uZzJRdStVc1ZJQWlYbkRsSWJqVzgyUEpNeGVlUlhzSUd6cE5J?=
 =?utf-8?B?ZEl1OVZXUDRjUVMxRHJZZDFyN1Ivd3lXb21oWmR5eC95VE5IQk9lc3dKOHVX?=
 =?utf-8?B?Uy9KQk9NNDVXY0xDK2RSSXBINVlKUTZVcTl0ZVBaM2ppU3dQNTg5akhlakhN?=
 =?utf-8?B?dzRWN1VUbWpCdmVWZmdhb251UjdocFVRY0xCUmhPNXc3RWlPNlJhV1dpZnlp?=
 =?utf-8?B?QTc1MGNMM24vTTBjbnVyQkROYlhITUtheE5NQlgzU3NmZnlQVk5xWG9DRGZu?=
 =?utf-8?B?UC9ybS9ObGh3SGRtcUVBK2Iydjk0TzRJcGZqdEtWK2FoWFExTStJdDVuQ3I4?=
 =?utf-8?B?WGxFb2IzanJBa1dQbFVDZU9WOFk2UW5TNDBwTEhPK0xhbHpPYWdMZWM4S016?=
 =?utf-8?B?S3c5OExUY1NZZElEUVhSbTBGMExpNWRsaC9sUHEwaXBScjUrekxTYlNvMWho?=
 =?utf-8?B?VnZYd1dESzlpTVJpN1hnS2s1M2NNTW5HT2pBaSt5cVF0NVBRbHEwWmtGc3Jq?=
 =?utf-8?B?WWQzbG5LYnFvUkNPQU1ib2VTWWdDNWkyaFFnenEwSFZ2TmhvcWdaZDN1UEtX?=
 =?utf-8?B?Z1JKRDlUNUlja0xxZGc4ekhLRjJxVVorMS9WVVBRL1hRTXJDTW0vNldWb3dz?=
 =?utf-8?B?cUJYdTR5eDk4d1c4cE5zZUtlWEZza0lsUmpXVzdBc2J2ay8wdFBQaklHby90?=
 =?utf-8?B?cjFud2R5N0N4UkNBZEluT0lVUkhNZVgwclFXbGw2YmNLdEE4T0lUS0hqeTVI?=
 =?utf-8?B?QStubWdGSEtYZWNVc0M3KzMzdm5CQXZUdzlLcFVnRm9RaVhaUm1wRXd6bHRw?=
 =?utf-8?B?YUhZZzMyYnRvS1lHNy9iVUJLTGNZelBkcEFTbkVjR3lzYzI3dVJxQnpwWFk1?=
 =?utf-8?B?c1NKTjUxWWIxUEw1L3NOekIxbWhlUmtkaXdBbStZQ0VKYkxSV1F4R3UvWVpa?=
 =?utf-8?B?K0VZRTkvZERPQ052bW9UM3NVS2F6VmJIbXpjY2xVNmVSVjR1MCtWeUlGeGRR?=
 =?utf-8?B?bXpDUlJETlYxK01HU09XLzZtSVlxb2xVcmpmb05NY2FNeitJY1JNbXkwNzVs?=
 =?utf-8?B?dThDcHdQSUFRZG1nVy9vQTNxODRlYkxoYmRqVStNL0ZxUktUYXgweFRpbGNX?=
 =?utf-8?B?SUZqblZjcmVSTjJ6amI1MkFSTmtxUm9TK09sQUEzK05iNnlQMjRqdUVoYklU?=
 =?utf-8?B?dVZ4QUpWSTdCblVtaC9YK1RBd2g3MEtvSFprL28zaWo3cmduaXNFZ1FBK256?=
 =?utf-8?B?eTNpdDduU2RNWFlCYTNNdlVWN2JEWWdiMDhSUTRxaVdobEFUV1B4YjAzY0F5?=
 =?utf-8?B?YnJ3VjVpanlSMG1JUXMwMTlFOG5vUythenpZREQ1a21RbFJvc0ptK1lXa0Vl?=
 =?utf-8?B?aHlnZ3VESExoMmhwdkRWZ2hPUXZncjJCNHprZW5iR0tZWDRnL2U0aXBCY2lM?=
 =?utf-8?B?cjhDeG5COUhrSHhXUFRZczNkaXozTUNsWUhGNjd5UlIxL045anprVnMxbnV0?=
 =?utf-8?B?eTdiRHBDK3l6dnV6enVuYXNhTWJ6NGlmdGRDTXVnQTFGYWJGaElxSndqWDZi?=
 =?utf-8?B?OWhpd1lYZWNRdzNqTm1NQ0c1V1BXd0NzU0VxNm9vTlMvRmJjNTRka3VYeXhL?=
 =?utf-8?B?ZTJDNUl3Zy9lSFlwOUhUbVhQVGlWRnM1ZldwU1U0VmlsR0F6bm1EN0VHZ2Zz?=
 =?utf-8?B?UUVkc0ltKzdjbmFTZU1WeHF3U2FvbFZDWjI4Q0UwSjkyK2RFTHZMOCtYZE9p?=
 =?utf-8?B?eThPenh4SVUxVU9rRHVDODVEMmcyclljdUhaNGtDY3BZSzBvSG5vdnFNU1ds?=
 =?utf-8?B?Y2xreVRqbXRmSkVUWENIb25URklGSEtqL3ZuWkhuNGJyTFlUN2Z5NFQ3OFhQ?=
 =?utf-8?B?WGJhb2V1anE2T3FFdUhxVUNNSkNJdWhIOEJ6YzFDcmVYU042eDhTSkMvbXB2?=
 =?utf-8?B?dy9WeGVscklJRlgvMit1K3ZVcEtCZWZlUzBZVXdSbFVEUS93U2toMGdxZm55?=
 =?utf-8?B?ZGZpTWE5SEtQeDZyNXNuZzh2NmFBcUcxZXhvSHJoL3Y3cWhWSENVaTdUNHZV?=
 =?utf-8?B?T3RXYllDMW01Z2lyTWhhTTZXR0w5OERWUHRncWJ2S0NZSVROMmxDelYzZkJr?=
 =?utf-8?Q?3Q0ZbQKkF+9PgF2btdOf3sics?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f802848-feeb-4099-5a4a-08dbae286f3d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 15:54:49.2308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HNsAfUw0o/WgxJbI5iKm+/fv+Bn5GX4+REGQzoQc6ZnTz06DwxZHOYsJmNDKFw5xzHiPa8AtT7ujDwyy6JOa5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7948

On 05.09.2023 16:58, Jan Beulich wrote:
> On 01.09.2023 20:25, Shawn Anastasio wrote:
>> +static inline atomic_t atomic_compareandswap(atomic_t old, atomic_t new,
>> +                                             atomic_t *v)
>> +{
>> +    atomic_t rc;
>> +    rc.counter = __cmpxchg(&v->counter, old.counter, new.counter, sizeof(int));
> 
> I can't seem to be able to spot where __cmpxchg() is defined. (I really
> only wanted to check why it needs the 4th argument, which here rather
> would want to be e.g. sizeof(v->counter). If it can't be omitted.)

Found it in patch 3, which suggests an incorrect split of patches. May
not matter all that much of course if the headers aren't used before
enough of the machinery is in place. But then such broken connections
would be nice to mention in the description.

Jan

