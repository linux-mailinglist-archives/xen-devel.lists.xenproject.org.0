Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E50566515
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 10:34:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360676.590100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8e01-00080u-Cg; Tue, 05 Jul 2022 08:33:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360676.590100; Tue, 05 Jul 2022 08:33:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8e01-0007z3-9F; Tue, 05 Jul 2022 08:33:37 +0000
Received: by outflank-mailman (input) for mailman id 360676;
 Tue, 05 Jul 2022 08:33:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8dzz-0007yx-Cv
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 08:33:35 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60087.outbound.protection.outlook.com [40.107.6.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27a99e89-fc3d-11ec-a8e4-439420d8e422;
 Tue, 05 Jul 2022 10:33:34 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8633.eurprd04.prod.outlook.com (2603:10a6:20b:43c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 08:33:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 08:33:31 +0000
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
X-Inumbo-ID: 27a99e89-fc3d-11ec-a8e4-439420d8e422
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ay+gKhjyaAs+C0PWnKhss6PBWaa2TwQdRmpVzlTLfBwjHvy/bVRcLDdotqbooqAweyMDCAor36nP/0qeopDeujqjNoWYrBh5v06kmsYNq4yKi6L8hlIcUc0B+QiOPYppwi4AsXYrjmawbJbbikqZY7CFdgnXKU7kLj/ScpipgqPAbRdcKcLkcglcRfWL4G505YcuvmYJhAhByIjisq2D9uYSFy+asZ3K0BaiLBvGHOHFvrJBWMmRNgVD2mZmHgggnnCapXFwdNPpyfmTkgG+FrWiuRZqciOUxdxSJs6/lciyRRDMTVXfZTtyu4ois0pOo2FCRf9sOIWHzBtI4o402w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hd7SjqojnAvgXUt9V3Q1YihQSM+psdO9zlfh5i52V2I=;
 b=kDAQJYuAmtgyKxafOnqAWGdIoVJCkSisNk8WH7GpeGsB1V8N7DtziuqKfKUz+drbCYVfyV3R6uLiYBI0fHXyrh+1MEYiWWyP1UQ29z6o+EB1zij33NK/4yplJLO4Rdro+4mMeosvIff00GAmHI9plta6/oQKk+2mPD42opvoLr6Yu4abRL3xYzuRxPuevkUvFctmOEKI0608ws0b2Vkrly6o6tHvVJCdXOsoEGJ1F1OBVjadvSkxCmrutbrnG3TCBii5RkZNwePnBmgrbURdtgpgN2x+o5APLCjyWDb8nYhdHoHAS6MUld8cRVLiUokM7KCLEP7uByez1p8aGKQOjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hd7SjqojnAvgXUt9V3Q1YihQSM+psdO9zlfh5i52V2I=;
 b=SEAq48tt+sp3w8A/QoryITRcrqui8cxLDFVGn2K+vqFsetp9P7RTFzWOxolnSkCja4+FGjo2Jr+o5o/LQNIdeZHhR0ws6EpqMgg2SJqVYJLrceU0qmJ7ElxME/AHrpWKsiohkCZCT/AXOZjsXhS8uU0/naetBSIq8c3O1aHgOL1XQpATGSXf5K3ICEUO4GA7Qkn0arCeyDOc4G02G/9qUoHIu4vvZXgFaf400+6dqG34SgD0Eci7t09gLwsWL4ylam36da11VBXlrJENrw7G+vY0J7wHrgHJCg5GOcLFy/bIYeIpCV/YxFOYacHS/zFc1+5OMCmX0UwdgDmN1w5g0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <949332d6-7915-392d-26a6-f3aaeefefc4f@suse.com>
Date: Tue, 5 Jul 2022 10:33:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 01/12] IOMMU/x86: support freeing of pagetables
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <e873e30c-7a04-a8a3-2fe5-0dda30e654fe@suse.com>
 <24eb0b99-c2c4-08aa-740d-df94d2505599@suse.com>
 <Yrr2iUlG43xIsOpD@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yrr2iUlG43xIsOpD@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39204360-ed00-4bb0-0440-08da5e610ad6
X-MS-TrafficTypeDiagnostic: AM9PR04MB8633:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E3QUcgjYpscPmSDa5WUgeowoiFzofMk+aNi47hR52mKxggPOjtkxzsZurHjp5VgNnHDF2fLiDH0YDEdZeTPAHXbc5U62/bXMpwqFFBTXOZbFg6v3QrpU6MJah8wO1eYbzesYKzajodvwpuC4+3gS5LDuINhbUIqzWk0KvwlXFbUl+FdRs/AdxGfVQtUVt5xaguXK6pC6sAm0HAVBM8gmCLj4Lr8Dew6H6dMH9cRocvQK52jcMZa0GByWaeWsScXakv0r8FdXDlnJsydpFlMvJFhPIP/7KWW1u6mpD8xdtrlD0eACyz2ovwknoBuN1YGAgNi6/88Y6wG79LXbUatz0UF+tGB1XPgbh71hQbk2uZIh7Ch0eFVAZTtmwSTwind7WuUzPdId50iyDC1Uq0Ql3HaA++O33+6WnNAGp+7tdIK91UvOuftJSbEi1P+9rtDoNlj95Cl2cxL22p7sFhyQyrRRkQH+c+kR/VirLqrLPzuxwa2aBEPqeY8uaV2ICnQGLg6MGrRDEo+XiqqJRt3vzZeNCkgtf+waD6sihKBkgr2lRnyVhcc5hoZY90c71ZWyJWKGtRUx88dvn/7ss0LLg+s2t8labttWgYYmfP3PjakBS8pe2zTF+BH7W9d6wK6hDZEPX65yUcmGpEvvzG+b5+ICT1fBf6dphE9clycXuKe564VwxzdyyuZ52EnNegUdgy5/d2dIgyNf55D7jpsnlDNkBwtAcbYTGHCtG1wC2yiiAz5oAj4jShxUbosGMyXo5pT2vw+u/EMCykxKrOY/pqhcXRecIQxa4Khw89zv+ngoU/m+s3evO6LolIawkaxQwbggIHDfjnoAnrC9b+fG/zBde0FZenis98acuvfMjDXy88D1dxHoitM0MFqgqfWj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(346002)(136003)(366004)(39860400002)(6486002)(31696002)(8936002)(5660300002)(478600001)(53546011)(8676002)(6506007)(86362001)(2616005)(6512007)(26005)(41300700001)(2906002)(38100700002)(83380400001)(186003)(36756003)(6916009)(66476007)(66556008)(54906003)(4326008)(31686004)(316002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXNHd09PdStudThrU3o1TXU3V2J3VmkxWFJ2YUNaUVg2dXZIRXNpeUY4dHdt?=
 =?utf-8?B?eGVYYXhEMWgyU2xVbm1RYWVwNVR1M1hhS2w2Tzh5TTA0SURlbjRhY3l1bnVn?=
 =?utf-8?B?VkZqYjZzS3EwT29oem5YeGlmMnNXZFJSRjZMeW1Ddm1Vc1czbU93V3N4bDhZ?=
 =?utf-8?B?WjJqeGZEVzFBSHN1bnZlQmt5blE5SXEyazhTaHRkSFJvUUVtbStlaDFHb25l?=
 =?utf-8?B?eXdyZnJpODdCdjJXK0lvNnkyNEkxdld6VjBtN3RDVE5kOUw1YUVnQm5GSHFx?=
 =?utf-8?B?VEVqYUlrQW9LRFJzNDB0QzNrdDM4azBlZ1h1NjN3Z0lranp3TnJEZzUyenR0?=
 =?utf-8?B?ZGJJdHhHS0c1d0R4bVR1bG83NmQ3WGd5ckRwOW1JQ3lTbW1Qd3FiYmpYRmY5?=
 =?utf-8?B?OEFrM0wxM3MxU3NFb0ovcUIvdmpxZDU5L0pxZ2tRaDBwUW1hMTgyNHJnaUhl?=
 =?utf-8?B?ang5cGxxTzFpaEJZVTgvRm1HblZSODMyc3k0SkhqUmRRamE5QTQ0N3U1Tm9W?=
 =?utf-8?B?UTBEK29qaGJSbkxNN2JHTnVXVjU1SVh3eUsrN1NtRER0MWFIdjZ0dzNVMGpk?=
 =?utf-8?B?NWZxSlFxNTRSVGxDN2ZyNXZYOFFGWkc5V1VnRG1SMTQ2Zm9hK1prUHRkU3B4?=
 =?utf-8?B?VjRhQkp6L1YzNDJnWTFhbzBLN0tVS3BzQmlOdU5PWlRjUExDeU9qeHF1NXRZ?=
 =?utf-8?B?dDVwNEI5MFU2bnFnS1AxSU1ySUpzM2JUMndISm1YanZWY1N5enJkVFdHWXBK?=
 =?utf-8?B?c0FuRkRTam1ZUmdvNVBaRnptd0RPWmpxWlE4SjdMVy9PSTFqUHRucllqUHRL?=
 =?utf-8?B?R3dwaXBkUm9EbVFzR1YzcjZueGg1NkJFNk12cVRNN0VJL3oybTU2a2dCUmp5?=
 =?utf-8?B?emZCbWVadXNnTEdaOGdYQVN4U0VpNENYV0ZyYURvR2NYVlo2NnB2NXVaRTU4?=
 =?utf-8?B?V3lSR01jd0NGL3Bmekw1R0d3SitPM1NTVEFCN2l1SDVIdXdZTDlRMnRJY3lO?=
 =?utf-8?B?UGdsUWltQkJtOG9EK1h1YURPUTFaT0NyUGtZODE0NDlyN1VuV1hVOGRmeWhx?=
 =?utf-8?B?MzZCTHN4bVFKcEhMQXlRRW0xSkc4MUVia0VlVTZCRE5jcURCV0RObUNKN0pt?=
 =?utf-8?B?ZzdxTUN0dk5TZmNCNHVQaVhod0VwenMyMzJmZTF4Qm9DdEZZTGJPWXdjbzdM?=
 =?utf-8?B?SVMzOTFrU2h5QnY3c2I4UUY0SmNSem5ZRXUvd3h3UzRjczFteXkwckU4UmYz?=
 =?utf-8?B?UjlYZkxRR2k4R3J6cGRQS3VqekhPay9IZnpjWGNubkk5V3l2Q3dMOXZuTDZV?=
 =?utf-8?B?QVJIZWxTc3dVb2hBeFVSYzJhaGhoMVU1WDBId1BaZWg2SklwMFd2Nk1SN3BH?=
 =?utf-8?B?UlJIcDVoMUsyOXR6L0VBSWlkeGVPYURaSXM3YTQxcURXczRpY0Fqdm9IaDRP?=
 =?utf-8?B?eFpRNWw2OEVaVkQwNHBaanFKVXYrU2xabTNTcFNkRVBWL1AzWWJiaExEQ053?=
 =?utf-8?B?MlRQMXNkeHF4cjR1bUpBMG1ZWVk5VmxhOXhoOWZjY05KcHFvaTRZU09CdXBG?=
 =?utf-8?B?WDEva1hvTmx4NE1XYTlvRklQY2QrTm1GbWtPVVh0cnc4UUt0VkVIemV3R0Zn?=
 =?utf-8?B?SlVXTXNYQWtraFQvS241bGdlNWVmZzQyaTVTU3RMTkd5Nm9iT0ZpOWxhVDFR?=
 =?utf-8?B?dnF2QWdTc0pHQ1djRnRjL09hU091OFV6a3pZZnF0Q0NkZWZDOHFBUVJaelZN?=
 =?utf-8?B?WERuUE5pa3JYemxJbmF3Y2pRYmVzb3UxY0lnWTdEUmFwZDlabGlSQ2NOdnZF?=
 =?utf-8?B?V0JEQ0o4QlVxZGNzWkhYVEM4Y2F6TXpjM0syeXYvMU90dnNSS05UZU8zcHNF?=
 =?utf-8?B?M2VDUHVDZjZVa29RbGFocjUwRzRHNVB0Qy8yaW1nZDhucG1aTkxpU0Q1QTVO?=
 =?utf-8?B?OGthY2EyOUhnOExETTFuNzFPc3lxQ1VKK1pVY0JJdjd6OU1tOG1rZFZuZVNt?=
 =?utf-8?B?R1d4NERDODRNS2NDbDJ3YjdvSkhOTmJUMjlwNFpkdmUvVkFERjgzUCtGL0xu?=
 =?utf-8?B?VS9oV05WYlJLTWcxNmtIVUJTcVFwVTBXTHVGTG1tZW9CK0wrWlYyK3UzWnJu?=
 =?utf-8?Q?RaS14nmbiCQ1eceW8WnM9XneB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39204360-ed00-4bb0-0440-08da5e610ad6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 08:33:31.4389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UX25DETCcIAAmEI+d2SyO8cG4RWgzHOkA831Qe87tD0IP3I7J+mlFjZb7LgUgVPok66T7OMfk407Y6SH+Ka2vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8633

On 28.06.2022 14:39, Roger Pau Monné wrote:
> On Thu, Jun 09, 2022 at 12:16:38PM +0200, Jan Beulich wrote:
>> For vendor specific code to support superpages we need to be able to
>> deal with a superpage mapping replacing an intermediate page table (or
>> hierarchy thereof). Consequently an iommu_alloc_pgtable() counterpart is
>> needed to free individual page tables while a domain is still alive.
>> Since the freeing needs to be deferred until after a suitable IOTLB
>> flush was performed, released page tables get queued for processing by a
>> tasklet.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I was considering whether to use a softirq-tasklet instead. This would
>> have the benefit of avoiding extra scheduling operations, but come with
>> the risk of the freeing happening prematurely because of a
>> process_pending_softirqs() somewhere.
>> ---
>> v6: Extend comment on the use of process_pending_softirqs().
>> v5: Fix CPU_UP_PREPARE for BIGMEM. Schedule tasklet in CPU_DOWN_FAILED
>>     when list is not empty. Skip all processing in CPU_DEAD when list is
>>     empty.
>> v4: Change type of iommu_queue_free_pgtable()'s 1st parameter. Re-base.
>> v3: Call process_pending_softirqs() from free_queued_pgtables().
>>
>> --- a/xen/arch/x86/include/asm/iommu.h
>> +++ b/xen/arch/x86/include/asm/iommu.h
>> @@ -147,6 +147,7 @@ void iommu_free_domid(domid_t domid, uns
>>  int __must_check iommu_free_pgtables(struct domain *d);
>>  struct domain_iommu;
>>  struct page_info *__must_check iommu_alloc_pgtable(struct domain_iommu *hd);
>> +void iommu_queue_free_pgtable(struct domain_iommu *hd, struct page_info *pg);
>>  
>>  #endif /* !__ARCH_X86_IOMMU_H__ */
>>  /*
>> --- a/xen/drivers/passthrough/x86/iommu.c
>> +++ b/xen/drivers/passthrough/x86/iommu.c
>> @@ -12,6 +12,7 @@
>>   * this program; If not, see <http://www.gnu.org/licenses/>.
>>   */
>>  
>> +#include <xen/cpu.h>
>>  #include <xen/sched.h>
>>  #include <xen/iocap.h>
>>  #include <xen/iommu.h>
>> @@ -551,6 +552,103 @@ struct page_info *iommu_alloc_pgtable(st
>>      return pg;
>>  }
>>  
>> +/*
>> + * Intermediate page tables which get replaced by large pages may only be
>> + * freed after a suitable IOTLB flush. Hence such pages get queued on a
>> + * per-CPU list, with a per-CPU tasklet processing the list on the assumption
>> + * that the necessary IOTLB flush will have occurred by the time tasklets get
>> + * to run. (List and tasklet being per-CPU has the benefit of accesses not
>> + * requiring any locking.)
>> + */
>> +static DEFINE_PER_CPU(struct page_list_head, free_pgt_list);
>> +static DEFINE_PER_CPU(struct tasklet, free_pgt_tasklet);
>> +
>> +static void free_queued_pgtables(void *arg)
> 
> I think this is missing a cf_check attribute?

Oh, indeed - thanks for spotting. We're still lacking compiler detection
of such issues.

>> +{
>> +    struct page_list_head *list = arg;
>> +    struct page_info *pg;
>> +    unsigned int done = 0;
> 
> Might be worth adding an:
> 
> ASSERT(list == &this_cpu(free_pgt_list));
> 
> To make sure tasklets are never executed on the wrong CPU.

Sure, added.

> Apart form that:
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

Jan

