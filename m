Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8570B51B96A
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 09:46:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321618.542662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmWCA-0004ef-22; Thu, 05 May 2022 07:46:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321618.542662; Thu, 05 May 2022 07:46:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmWC9-0004bu-V7; Thu, 05 May 2022 07:46:41 +0000
Received: by outflank-mailman (input) for mailman id 321618;
 Thu, 05 May 2022 07:46:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmWC7-0004bo-Rb
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 07:46:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f00abef-cc47-11ec-8fc4-03012f2f19d4;
 Thu, 05 May 2022 09:46:38 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-RFj3uAbuM_O6JaWwrjvLaQ-1; Thu, 05 May 2022 09:46:37 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB5573.eurprd04.prod.outlook.com (2603:10a6:20b:94::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Thu, 5 May
 2022 07:46:35 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Thu, 5 May 2022
 07:46:35 +0000
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
X-Inumbo-ID: 7f00abef-cc47-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651736798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=59XdpUfHVbilsEhtfR5JO0+5vwDqmAsmmdN1OvKCsKc=;
	b=OW7kTQ4mcip2pqB+EE6opvNxCzeNa1v+p/DshNhE+QsCJjoySyzVWw1BZURbHJcqCMKLPa
	7sf2H80lR9CC/L1AURuseBvncsm9tG5LTWXhjqEwiWfW1PFGuCs7+TNVHr2fWvXcj3AUr0
	f5jLMc+sT/oerGIZhXJJojyt8EqCJV8=
X-MC-Unique: RFj3uAbuM_O6JaWwrjvLaQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lIwbPdvDXnVPnoBHj6k08AO8oR52B0pOrD4tELDaraa75/FCEBFPz7kPMy/9BVg60yk43uyOvNbam6qrTVKTSp+ulCRPdxgB/JqjAkU35k3sPx5vnw/3Tl/0f3sUzl9jb6Zo/hkTjxqAT3TWxtGonVHiyFpEeBYKv1Yp6JZeuJ/sSGFn7cWHV+kkU3NeX2t9T7w1ac3nX9efdD/3jBxuObfaF+0ydkSX95kqG2BTh0uw5RFNRl/rfJjsBJvyxYCRvxKf0UM0rlQwKqDNlvYCGL2BGiNbSpXZD/cjgyurKdEuLLIKlE0C4sEUv/AMEMlvulX+Jgypslc1mRQNPnUOsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59XdpUfHVbilsEhtfR5JO0+5vwDqmAsmmdN1OvKCsKc=;
 b=Vx3hnxL5ZWB1fyKeyglyrI2cM78xPJXpNFhvmg57Gn6SIGWu2MCktBteKFasDfwfrJTC26H4zyFgrOG6JI/34qct0m8yOKIiNWuBT1mXy7RHt5Ui7P07LXZ3n7aH8gng6uJO6U6p08qF5pg6/dxh8PaPMySoRG1V69o6baxSLqYdshG1Qrd5upSMkqrETjMKHanQJu48nYgIOu6cMIz5W/Z8m9ehOPNV4yScS3Y/udvAz0TjOgWdIjpet+yH5erGXBukh+nT80IfL95GS93M5qore488rl+dZhfK9Jl5MY1qWDn/q5BaR6+B9X4SkVKGxwTYznaoDGFl2Y4d2eqbIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a8fb813c-e976-0841-7c3e-96f4990a81d2@suse.com>
Date: Thu, 5 May 2022 09:46:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 6/6] xen: retrieve reserved pages on populate_physmap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Henry Wang <Henry.Wang@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220427092743.925563-1-Penny.Zheng@arm.com>
 <20220427092743.925563-7-Penny.Zheng@arm.com>
 <f75f174e-9a66-d2c4-53a5-22a50d0cf132@suse.com>
 <DU2PR08MB7325B823DD043304B3F7F1FDF7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DU2PR08MB7325B823DD043304B3F7F1FDF7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0003.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::29) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d864930b-c334-4cad-0770-08da2e6b60fb
X-MS-TrafficTypeDiagnostic: AM6PR04MB5573:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB557339AC64F30E2DBBB68E37B3C29@AM6PR04MB5573.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GYnpfA4pAjD75PDO0yoXutbuJDi79KjLda8M5tDjoycOqlMQALKdtpon4jZxY9z6vb+LEeUCpRI/qNed2a5CupUk43TAUlmvBEvFcoHtqzk2dhl2QiZ+rEjzG/m/TNOlrkGj9v+cDHHh2tMscMO8adCBx0EMzW8GDMAy5DRQhGaZZVfht5ihBaTxk3UW8IoCAdPPYxq+WbjyLAprCehAstd/UV/x5wWQJW7HJXNxdUaxec3sxZNuTCr/vZxzuExCRGjmvrLjoyxVqRKXXS+G0EsX3d3KStW4RrYO0QZk11XY1FX6Iz6XqJLz4/tljLDpVu9yBTfO7CoX3tn/NulnbHCedylawRlCIPS+rSogORRfmUuEGGOM/Dg0p3e/D3VP3aY9N6Qb+laD30X6eyFGKffEX5o+4+IMeaWZ3vkcE2e1b/qackbRUzEONzw1stWmoJFWGN+mIhxFwvfQGFoEcfV+zjI+gIQC7F5qZSPYrEEU+a9DA3E2JN9IPnP9BO/jh+z0QzXO74JWQV+Tv7nlEk8taH3VwzFn3d09LRys+up/J1DIM0gSA0o897KKcyqSbZ9pRNL9Ww3bUEX2txJGG7HcQ4si7Omct0msow+T1HC+9Q3a55f5hlSdN8rvKPGiKWBzBhMgGHG11BPbpG21HmcxdExqBQDvrQEK9NTHuSLpXzaVW5JO/RWi5EjdiEy3ZBe+SV0p50/AYx85iE4F0uIZtvdosD/WNsXcMqBUfjo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(53546011)(26005)(6512007)(8936002)(31696002)(86362001)(31686004)(186003)(2616005)(2906002)(83380400001)(36756003)(8676002)(4326008)(66946007)(508600001)(6486002)(66556008)(66476007)(5660300002)(54906003)(6916009)(316002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUpPR2syKzNUSmgzYlJWUXYreDIxMW9yb2xSbW1FYm9Nc1JVWENySzFaQ2o1?=
 =?utf-8?B?dHMxeDJueEtkQ0Vhc2tXZXQrVlcvd2RPWnVLdUQxNHFXZmFSWE1uV014c211?=
 =?utf-8?B?bWtKY1BpV2ZUUGZTL2tHNFdSSkJYd0xyeTVxbnZuTXdNdnU4ckRFdWVEc3FC?=
 =?utf-8?B?azJUUytYVGFudXVoT0gxcWR3OC9YdmNTQWdtSmhVNTZtZ1NvYkhub0xzRjBJ?=
 =?utf-8?B?aGlnemVuY3FiNVJ6dXRCMDNkNlhzT0dySGxOUkdWMzRRbGttVCtWazJiTzZB?=
 =?utf-8?B?ZnpkbWZUWUVKTlBpVXlKL0dWRkhyM3F0U1B3SGJPdjRCSGFmdW5TakVFVEt4?=
 =?utf-8?B?bXVJUG9FTUlTY0YxL1ZuampVM29yUzdFR1ZTVmIzbDZnaWt5REpSekxlZnRK?=
 =?utf-8?B?ZjRON2RKbldPV1NqREF6QTRlY2k3YjdRdXdrTzY5TnFTdk9JYUdxSjUyRkkv?=
 =?utf-8?B?Y1ZSMXI5M2tVQTE0OXEyTk0ycVpsZDJsc2YwQUtZY0p6cTFodzNpaXR2RnI1?=
 =?utf-8?B?OEl1OTduaHZCUndqN09KVGFaZGNVTEhmd1NFUjUvSFFiU2RscFRTbFE0WGpB?=
 =?utf-8?B?bmMzMkxHbHJFS3NVQ3ZwU0EwVWRKd0pWcS8xMlVWSXg5c2hkdExMendZUysx?=
 =?utf-8?B?RG45NmgzSE5iMGNYZnBseWRwTjNoRlpzc3ByT0pHWWpPQ1M1Y3RYd1NjMEJl?=
 =?utf-8?B?SzJwbFJuanZ6eitkaDd6QXJaU0hmWFluU21uYWxHaTI4blpRWkdxZFRBbXBj?=
 =?utf-8?B?aXhrc1I5a3pPT2FrTVNDMlZZWVdqaFFSSWpKV1lVMTBWRHFMUHZLd1ZubGVl?=
 =?utf-8?B?T0UydS9LekJ0SEMzR2wxMDBFaVJzYlNhOFkvWVhyMURqSW16ZFo1Q3ErdjZ0?=
 =?utf-8?B?eE96d28vMXQ2aERhSHJqd3ZTTXRoNktLcXBFanp1SkhKSzZnNlV6aG00U25N?=
 =?utf-8?B?SDUxMXRDc2NZWmY1U3RnWGFQSkRoUS9ydERaY29zd0NwM0gvdU95UndaYXZt?=
 =?utf-8?B?akVCNDBpRkswdlIvbFlub0hsMnlyUEh6dlBtRTJNWTRTOWRXZ0pMc0ltTy8y?=
 =?utf-8?B?REpFZ0hsWUpCTUV6OEdTWjRlUDVvRUttenlUTjFEaTdNTGdkb0crRzh4UHh4?=
 =?utf-8?B?cUMrNnNMZFZMQ1FOVzVhN2ZYbitIdWd6STVmcnR3d2dOeGxSalFjdzZHSlNL?=
 =?utf-8?B?TkdkVVJTR013ZU9SMVREOFZZc2pKTGcyTUxGcVNQQThnZTVIWFF4RWh0ZEx0?=
 =?utf-8?B?d2VreWFDQWZSYUpVVndTNzZMQmgwWERhQWNEVHp6ZGsvVXhjRXQxbmpQTDcw?=
 =?utf-8?B?bi9qUHFZck95Z0lBZVN1NmFOYlRZVUpZd0Q1Y29ka3pBRk9EVEVXeldOcjBE?=
 =?utf-8?B?UkNTSVYvOHhraEhnNlMxTXVlNE1aWXNnOThjN0RNQStoMUFHVVBlR0JBVUpo?=
 =?utf-8?B?aEM4RGxmcjZpMk1wbEVxVjRDOXhVeng3VCtlRE1kL0s0Wi8vL0k2QWIzRTFJ?=
 =?utf-8?B?UU83b2xhekhtTU8yUUxYQ3pXcE9PLzJXL250MU1TNllkMGJGV2N2SzgzWTl0?=
 =?utf-8?B?UjZRRVBxM1pid1grY0FBMlZnWm9OQTlFWEtuMzFFTUFtc0VvQ21mZ1RFcVVJ?=
 =?utf-8?B?UjdjY0tzVE1ld1ExZVU4MWR1MHdud2pZS3p5QlpCcmpVRnV4clNOWlFRR1hs?=
 =?utf-8?B?Ullid01EOExYSHFzMXhDN2pYRUdaaDFCS2pBdHBYSW5SaDZua2JsakNRRFVC?=
 =?utf-8?B?SG8velpSM0RRYlR5V205QzU0ZFNsam1OSWRFcno4elduRS9vVkhuR0didThJ?=
 =?utf-8?B?aUU1SDFrc0FuVEVMdGNrYVNCQzFOZWpwclRxNUUzVUtOZll6UFZSTUJYT1NW?=
 =?utf-8?B?U1pNd2ZoQytlaldCSmhEem5LbHhYZERWUlRLT3RxYk1qN0dUQlEzSE5ibzNm?=
 =?utf-8?B?cDhXSkl5TXR3Nlgrb1BnQm9YcVFTdmdWMGVROXpGd21hcTcxMTBsK3JQT3RP?=
 =?utf-8?B?VitXNU4zK0pvWE1GNndmblkySEFxVzloeU9HQ2w2NEUyUVVxeER4S3hXTHk0?=
 =?utf-8?B?Y3lPMlVtOHVZenNlTEZoTFI2MitRNllNWWh0YnhyU2VVOFYrbFNBK29ZQVpQ?=
 =?utf-8?B?L3QraVNaRS9GcnRlaHRVTUNUTytIYVpOVUhmb1poalB6R2l3ek1scmhSMmF5?=
 =?utf-8?B?SnRmeGQ5VVREUi9wc3V4cnVsNWZNelVkQ3YyeGpJd2ZrRldMU2RsMGNCRzYw?=
 =?utf-8?B?Y1BaY3hCNTVBK1I5QnB2VE9IRVp2M0xuWXVXMXE4aTNXTVZMdDdvR0ZBRG5Z?=
 =?utf-8?B?aGRZamtGZzRxODl4Y3lDYS9aN0RJRnhZNFA5dHVveUJsSEFBRldyZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d864930b-c334-4cad-0770-08da2e6b60fb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 07:46:35.1038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d9023CrxCsPZeXe5v6bWpl+0twGWcBsRYnol4Urrywi6ck11YGnlhhenV6oyn61FnJ2mO5JzIGzlYlxNX5w40A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5573

On 05.05.2022 08:24, Penny Zheng wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Wednesday, May 4, 2022 9:45 PM
>>
>> On 27.04.2022 11:27, Penny Zheng wrote:
>>>  #else
>>>  void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
>>>                            bool need_scrub)  {
>>>      ASSERT_UNREACHABLE();
>>>  }
>>> +
>>> +int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
>>> +                                   unsigned int nr_mfns, unsigned int
>>> +memflags) {
>>> +    ASSERT_UNREACHABLE();
>>> +}
>>
>> I can't spot a caller of this one outside of suitable #ifdef. Also the __init here
>> looks wrong and you look to have missed dropping it from the real function.
>>
>>> +mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags)
>>> +{
>>> +    ASSERT_UNREACHABLE();
>>> +}
>>>  #endif
>>
>> For this one I'd again expect CSE to leave no callers, just like in the earlier
>> patch. Or am I overlooking anything?
>>
> 
> In acquire_reserved_page, I've use a few CONFIG_STATIC_MEMORY-only variables, like
> d->resv_page_list, so I'd expect to let acquire_reserved_page guarded by CONFIG_STATIC_MEMORY
> too and provide the stub function here to avoid compilation error when !CONFIG_STATIC_MEMORY.

A compilation error should only result if there's no declaration of the
function. I didn't suggest to remove that. A missing definition would
only be noticed when linking, but CSE should result in no reference to
the function in the first place. Just like was suggested for the earlier
patch. And as opposed to the call site optimization the compiler can do,
with -ffunction-sections there's no way for the linker to eliminate the
dead stub function.

Jan


