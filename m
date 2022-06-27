Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7380955B9AE
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 15:10:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356593.584834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5oUl-0003px-V4; Mon, 27 Jun 2022 13:09:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356593.584834; Mon, 27 Jun 2022 13:09:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5oUl-0003nt-QS; Mon, 27 Jun 2022 13:09:39 +0000
Received: by outflank-mailman (input) for mailman id 356593;
 Mon, 27 Jun 2022 13:09:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o5oUj-0003nl-UA
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 13:09:38 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80080.outbound.protection.outlook.com [40.107.8.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64e07739-f61a-11ec-bd2d-47488cf2e6aa;
 Mon, 27 Jun 2022 15:09:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB6057.eurprd04.prod.outlook.com (2603:10a6:10:cd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 27 Jun
 2022 13:09:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 13:09:33 +0000
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
X-Inumbo-ID: 64e07739-f61a-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/eiX3N9aMqNivC5xHCemPFSORhzL5KUZQHdk7e3KrGu0QVeCI6t+u9PC63HlO6XoAiTuQPsioAcYZQdIMDQleme66wtWYkel0X5R91rhOup/w7m1OxMgYl/BSiDO8hcWMSa9vCvVvXyyWVHMSQv5KFWleZi9ZejgPzAmIVZSWK3/ufRDTs3wnzoF1nnp4rnGy4L7MjamHm7bFmGCcD4lBU9OzFt+BhsDFJWNs7CZ1sZC2KsKcnc2sVKywh/zsWVShpBKJr8h2yU1VcrtOaTEJgW8kSsOXHXPXAz1d3Bo0E39jv/IL1G045Qa4Ov2FHQzLu/YOO7UqaRzO6iw8I/HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFH4uodbb91hO2SaVLJxX3+sc8ovgRyMkIoKp+qXrYc=;
 b=cNLp+Djuwg2HSeVsqi9pp3YgSggdmwfckr/Vlrs9BelTRb6hCGxr8fgrv0EPk9xv0uPzAg+2MaUMwtG19EqkKHRVBV0yZYZNGj216Ma399HwcW2jtVhpFAHmDqCh8H3pWQhne3eXJAuCXtKM+tD1IJGhb7FthJt6MCYWprl/E3Dr/JISQC0F5exxr+ENawswAiaS3qP+YoOrZBTOr/9dq6Rn/MA9m5pXiPPLwieusUD/LYugiIrJCuLdZO8NQOE8xmSS9gGRUHix+58hbpe4exK55MMqL00DpltyGoyqvIJVFjHvJNap2TT7Wkkl+X/zSk2o6U8F0so7eWgvZO3CTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFH4uodbb91hO2SaVLJxX3+sc8ovgRyMkIoKp+qXrYc=;
 b=ZYZpkKOsKE/Q1hXSh0HuZ/KkhvOjavbmhnnZoxvx/Gb+sNgIwU2risGTl74Sdqa3rcCmqMP779FUrzjIE9T5tqq4VsJjpuA1Z5hPrZe7g6XM62NHKDPOfIIFAAjl4xWGFQbYkNIyoY/F0A9xX1+xSOJrcRZ48nsWj+WGIji+E7qG9M/w1STTbv8ZFIcfDWGsexFufK63iJhPaiUdaQZ2JzJnOao4E0+CwadSc/q2NH2J6+EEMRa1ZDBHzIOl3dIDEVUUID1ESjOcIW0me9dU5J76RkqIOGaW9AMlucE071+Y2IcBM/HCoq0uuTQHIVQodS6FRlcp6dU4Mo4xVuqZUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4239996a-c764-1d6c-dd36-81db5cd99c5f@suse.com>
Date: Mon, 27 Jun 2022 15:09:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v7 7/9] xen/arm: unpopulate memory when domain is static
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220620024408.203797-1-Penny.Zheng@arm.com>
 <20220620024408.203797-8-Penny.Zheng@arm.com>
 <5ac0e46d-2100-331e-b4d2-8fc715973b71@suse.com>
 <DU2PR08MB73255B2995B4692B5D46252FF7B99@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DU2PR08MB73255B2995B4692B5D46252FF7B99@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR03CA0002.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 681e67a9-3f9a-4353-788e-08da583e4761
X-MS-TrafficTypeDiagnostic: DBBPR04MB6057:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ues2XN8v12QWTGU+Zen8jh+Adl/mCFLsdWLXtnV+6tGAkhEtBYxm+ZHPR25/iFlh/EKLcnJ+FwCybSYZhRR7xwKMtOkZLqcyaC5ft2kbkppxAOSLc2bScBdjgoyqTHIKgDuoxAkomBkr6N/MG3Lhk39K043W5m0eOGFvJUw4UgU2vwMfVEj8pF1TOczrJNLQSlPbSxLcRggAIObxB7R7/lndMsqs9t6g+KDDmLGPC6jcsZsFSBzqKawX2CT28itPu5rvS3/LxBTCDp97dYOYAa6An+wRIJlKQqgRGsj+NQaRH+uYl8vt6vSBCb7b3zVaPoPVRGINsKLL5P6ypkX5TJQrfVfFoE4WPpQPOB1DnwGnjgXjXii8HtEeASDQO1KAiCI1qV4acGu9IedrJuhwbV+dSUX6jn4w6jQIkxx5/BkB32dsisrzyfZb1ZKLs6CrK8JABy7Bphn8VpfwB6t9KfeLO+p41SkBjdVgT8chYz8l5YXnNUKMBIAyQfwEFWD5v83o8d8rze778CPNlvb6+rLtHrhymSBC7+XRJ7rkgLUTJC8oYsywDbWvmhLEWLX/QedmAyAzt7JVlRAVbyccc1bTBDDhHErqUU47NAukfEYMqmMc+Yy5NFqXq2kg/4Oa2qm8OOjTdJxPY8/N/a6PhSmwIUPEGiWdQxsi8OglritbG9nbsr6+ig75IIkW8LzvJxIoSbAS5ConuLf3NyU+NJVWML+9Fi0Wzn2G/g5OcYOB4ZSgjQ8HpDzvAizqA5g7Mj3LccBvevK3etHYfR3iHCO28Tk06OkJihCN1F3qow5t4vin4t7elIyAGoQltqukj/AtF4exnEYFXWTAGrBUkw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(346002)(366004)(39860400002)(376002)(41300700001)(186003)(83380400001)(8936002)(5660300002)(6512007)(6486002)(26005)(54906003)(478600001)(2906002)(38100700002)(316002)(53546011)(2616005)(6506007)(6862004)(36756003)(8676002)(66476007)(31696002)(66946007)(66556008)(4326008)(31686004)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlhhaVRqeUFuU0szUTViMyt4ZVB2Q0E2akVNeFgzZDAzU2lKTS9Wc2s4VE1X?=
 =?utf-8?B?WmFtRGhmaHVZdWNWc2Q0NGNwc0hyRmg2TTByclIyVDBQMWJZL0R4dzhhS1hU?=
 =?utf-8?B?cE1wZEZONkVGU0FjRXJmU1Z1RUdMQi9pdWVMd245Vm5Zc1hNakZVQzFtNlQ3?=
 =?utf-8?B?SE1TM0hMZkRkOXF3aUd0bUtNa3pZN1IyYkIzei9EbXYrR29yMFhTU2J4VHRP?=
 =?utf-8?B?MSt0NmltUXByRlVWMFdOZGw3RHhDVlNQR1Zsbnc2b3V3UWJBSlZNY0VyTEpV?=
 =?utf-8?B?M2JteGg5R1JBZERxYWs1NmhtcEZTbmNZMkRjRkIzVktFRHB3YXNXN09WWXE2?=
 =?utf-8?B?aFdHV3FqSmdTSEFrOE4rNlBDUFpOTUJDN1ROVGs2KzdDR3NHYTViRUJCQVpF?=
 =?utf-8?B?b0dpOUlDcEVkR3gwc2xFbDcrZTAvM3JFdFp5YVlYcEJZcFdTRElkK1hTUGtk?=
 =?utf-8?B?cVJjb1FKUkJMakZ3VzJSUm5nWlhROEF4TUtCSFdKY09jckg3cTV0d3JTUFNu?=
 =?utf-8?B?QUM5bFVWVFMyRWRlOGN0UzhkdkI5R1JTdlVDWEREUTVGbXpSTk53NnVqdkox?=
 =?utf-8?B?NERjclhBUVBBZDdDL2dnaXk3bXgyNUVJQTJEVWZydHJ0dnp3ZkhCcGdORzBK?=
 =?utf-8?B?d0d4bExhd0Q3aHk0TnNvRktic0J2WmU2MVg5Z0dwaFNVa21KaERCMWlOMW9E?=
 =?utf-8?B?ZXBqbXdJWXkrYjBqMzkzR09sdzJBZCsrK05PL2xjYmIycGRPbWhDc1ZXWUVG?=
 =?utf-8?B?SSsyMnNHQXVXNWNDd0NsTkZFbVRLN3dmcHkvc3JmQ1BEOW9uZ0RDUDJtN24x?=
 =?utf-8?B?MlhqaDh1M0x0aVozZmZQeXE5SC9tbDkrTjhVQ201NGpudVM5d2NFQ1RHVTFO?=
 =?utf-8?B?T3VrYzlPWERvb3R0TkswbEl5WjN0ZGd2MWJCZ1pXc3ZsR1pPaGJia3E5ODRn?=
 =?utf-8?B?OGlXeUs1TW8rRkMwWEM5WDI3SDZoUUt0MFcrWEdVd2FXcER4bklFZnh4QWlP?=
 =?utf-8?B?alNKMDF2Y2pFYld1ZWJEQmRtM3NwUXU4cVFpVkdLektrbDhMc0VLdC8yb0Yy?=
 =?utf-8?B?OHNUamZWNlJ2cUtLWElqMjRhQ29pTnpMc3l2a1E2ek03djdTSkttUVVhVXpQ?=
 =?utf-8?B?UjQzZnd1YVlESXBZSmpBY09tYS94WmxZK1lVdWZxMExUdlpTc1NLRXFKYmw1?=
 =?utf-8?B?OGt6ciswV3ViUnhZellFczJMN1NNd3BLZlFVNUxhSDBsc3Y4aEIxYU1OR1ZR?=
 =?utf-8?B?TnFWTXY1RDVlb0xsVFpjd0VUSG9QMUYvbGgxcFY0dmhYZS9Xb243Vkg1bkVY?=
 =?utf-8?B?VUVnWmRkNVJFZ2NIdWJ1RG9UdEpiSytncWR0U214eHFxWHlVcG1WS3RVMTRk?=
 =?utf-8?B?eW5iblp2czY1d3JSR3EyZ3VEL2FVZldZbkxkSDNUdXlWRU1NY0szamRJMUVl?=
 =?utf-8?B?SUdqU0lwaUFGblNUMWVlZlJhOGJLNDB3MnJ1NHphSldHMEIxbE1qdEl3dFlE?=
 =?utf-8?B?bndoZXord2NHNittb1pLeGtDMW5FN2NpZlZ2Z3NwYncxRW1tRHVaQUpKZi84?=
 =?utf-8?B?TkR0OU1jSFpwYnhFNllBYnFYOWxXTXpoVmF1M3NXcjJaTjhHNTdHcWNPK3lJ?=
 =?utf-8?B?aVZvZWM5Rm5DNlB2WmZoa1NQeExZN2NMMDhTb0hxUXRhemRBQ2I5WnRGblBX?=
 =?utf-8?B?TG1HaXZaMUVPVy9ZV2kvTE1OSEZ4N0VQT0xPbU1OTmhwTlBaUUNRMk9KalJQ?=
 =?utf-8?B?SVMvUFVLbHY1ZWI0cWcvZFJSME8wVXArTFhnOEovZzhBSlhYcjlvbFhORlNH?=
 =?utf-8?B?ZzNnbkUzQUJNcjFDNVUxQlpYVnNzdlhLZzhjTTNqWm9aT3EyOE0zbUt1WnhX?=
 =?utf-8?B?VWQ2RGxqMjU5bjcwYmJ4K2ZyYVJibDdZdGJKOHFFOXVUMEs0K0Q3NUx0Qzdw?=
 =?utf-8?B?Z1gwWjN1cnp6UmtzWWU2NWVIQTcxSzJYNXFrQVp4Q3VVVWZDUXBOL0pVVC94?=
 =?utf-8?B?Rnk1NFhXNFIxOWVRZlNHand3Qys3RkFmZHlUWkFqOFJ6TVlZeGxKd0pXVDVD?=
 =?utf-8?B?TTZpUzJERHE1alh4RVM0U01pc0VVc1JMWEtBeUFIVVJrcUczVmFSYTd5aHdq?=
 =?utf-8?Q?GlEsx3iEPO7wV+y3x9VijVwBX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 681e67a9-3f9a-4353-788e-08da583e4761
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 13:09:33.6851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/JbYEBMEqQ37d93e4ckqfNIfNY+PW9UF9nD0YM2ZrGOoreVYDvKluJrQVub0CqkeTZmgibMWkzpXCvMubL+wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6057

On 27.06.2022 12:03, Penny Zheng wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Wednesday, June 22, 2022 5:24 PM
>>
>> Furthermore careful with the local variable name used here. Consider what
>> would happen with an invocation of
>>
>>     put_static_pages(d, page, i);
>>
>> To common approach is to suffix an underscore to the variable name.
>> Such names are not supposed to be used outside of macros definitions, and
>> hence there's then no potential for such a conflict.
>>
> 
> Understood!! I will change "unsigned int i" to "unsigned int _i";

Note how I said "suffix", not "prefix".

>> Finally I think you mean (1u << (order)) to be on the safe side against UB if
>> order could ever reach 31. Then again - is "order" as a parameter needed
>> here in the first place? Wasn't it that staticmem operations are limited to
>> order-0 regions?
> 
> Yes, right now, the actual usage is limited to order-0, how about I add assertion here
> and remove order parameter:
> 
>         /* Add page on the resv_page_list *after* it has been freed. */
>         if ( unlikely(pg->count_info & PGC_static) )
>         {
>             ASSERT(!order);
>             put_static_pages(d, pg);
>         }

I don't mind an ASSERT() as long as upper layers indeed guarantee this.
What I'm worried about is that you might assert on user controlled input.

Jan

