Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 319E069A647
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 08:53:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496902.767851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSvYQ-0005cq-Vh; Fri, 17 Feb 2023 07:53:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496902.767851; Fri, 17 Feb 2023 07:53:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSvYQ-0005b4-SQ; Fri, 17 Feb 2023 07:53:14 +0000
Received: by outflank-mailman (input) for mailman id 496902;
 Fri, 17 Feb 2023 07:53:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yqvu=6N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSvYP-0005av-0V
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 07:53:13 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061e.outbound.protection.outlook.com
 [2a01:111:f400:fe13::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1fd11e3c-ae98-11ed-933c-83870f6b2ba8;
 Fri, 17 Feb 2023 08:53:11 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8603.eurprd04.prod.outlook.com (2603:10a6:20b:43a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.15; Fri, 17 Feb
 2023 07:53:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 07:53:09 +0000
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
X-Inumbo-ID: 1fd11e3c-ae98-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQoOhhLbqxEwsD5/5NX3ZNGUuFBUs5ZyXrgME132Vs1Zk0KBh0LmI2f6wPFSRS3VsrkaPz3ro1n7jyXA/wJ8lMkmDhP2z0K5CMdV7uLafzQkyZDDm6gvVQqYFxS/fx86zge4bewObfQa1OT4e7rbGWGufOxm6yt3A/zjYP2K7qOpX7Ho24beIRUelm2jwVLtsZH6nCEkgs+uKy9ti04efcUh/YElCVtuvRrAKmZZH3AOEq1Xyn/pGwsf/zpvJJKxg/Z7AfKvXblYsAFFHUnyaur9iScF7B4aquPP7XtcNkdtpHQ+6xKj+0n1wABA7jzq+G0wayrnzi+2IgnbYikiTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arogZoH9g4HsyoAMGee3yi/Weu0VkkttF4C+Sr9ylgs=;
 b=mYu0aT5tI+hVs9Frs8HjEv6n6I9F8rz/RaoLU2sCFFMJiTWX6VqgrSLBm2nDlu6rZjLHUa7XugxXxvoBpKiu2SgXIzkYFKxLEpbboGmN/JtKhcdIBD5tL0uPjp4hfKXFE980nZlov/lJ+PH4oNJkmdsyV7XEVkYEkFeoltx4UtmDveHgMMOqf3TNiZvlpUevPB+uXPcvNEa1DGV6aZyFCdApfYq0Bbh5Oa3FxYpmM+EqJDpOOnhjPEuDmM3jUDzZpeVSN6Jr++iOV2aPrWdu6P8e4p6I1XYO+4Vl0wL9exTla1GjowoDjsjbyl8m+WWRECvzXsyO+AXgeR9Ta6b0CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arogZoH9g4HsyoAMGee3yi/Weu0VkkttF4C+Sr9ylgs=;
 b=ipBQFZ4kH2hiuMUMHCrplkumDzzsH0c3YGSWZnvXrujHnuFx6OOkDmoTy2xuI31nuI1VUumh0tc36VrB9w05ZdEYPkmKArenGdNWZa5kRvPiBEWndBOojM2OcE/sUFX0h2/KPd6gL9PBsw8DOqKXnPcCShP7b+VsWn9Sny1XLBRCfetZ2G6aKQQjGREy3lhUV6u+9q65HVMCMOinXwQRlwQobcK3W5wsz/YuQxWFhsQ5xzfg/gLXTI7xqFT2EOe7cVZPy49RXGPiky9hD3Z6UvuXwSuu+hNpZ1KoMyPqs/1yu/x3maKDZiFYAkbCF6i2i+k77mEdBByWo3UmxT6wQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0bbbb1c7-bc05-a28e-6573-6bfc5bb0ad28@suse.com>
Date: Fri, 17 Feb 2023 08:53:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RFC PATCH 04/10] xen: add reference counter support
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
 <20220831141040.13231-5-volodymyr_babchuk@epam.com>
 <a89db71d-dc4d-5b17-1528-4b8a4243addc@suse.com> <87sff512d2.fsf@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <87sff512d2.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8603:EE_
X-MS-Office365-Filtering-Correlation-Id: cb5bcbcb-2dc9-4482-abd8-08db10bc030d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7+qQC3QfyrthFBnT2qyCxQxLBDcsLcr7U5BLa13GJpxdFo1IfRo+uhermYw0B8LV8MIj9s7VvCLpzqpL0LajwMHdGrF4wRi3pzMgN5wzuxF/Hnu3DsE9ORoO+r4XnS+gDrhRFslV2LSko9nbC/khMzf5tOAJwQ5/pP+jybbf5d72tRpg5z9g307vkOVSBaW8GX7qy4TmurI5UKRLaq/m6r+let7oikC27oHhteHIWD21WtjUCpcFbQWwXetBgyvAgFwjdy3E38YBKrCIkzOFkbTQ0tdByuR+KkJcXite5oIbnn9/Tl8yDX/YAIJTIMURBgkLk3lKbpJ2xdfNJp6IG+rZLDnMUSPNNAlhcekqjXl/6Or0aDqfdvyNcw0j20dWUJNi3vqXpz2LtG5sdnT+f+UCf54fpJgbvKrzlvTeuXODQmvLkx7rInNPTmbI4BmP/XKu6sg6ssnNUghDpM2pyWZ9HnyEGzcgWlZDIeL5RqhSWD3NjeXg8uesi2JsRkc/pZry1B06HMubkHVI3Zb6tatAhZLgPTZbQW4eps2epyhbqXu5wOSUDIyb3pVdUMDmlpz38Tsu+veGRUPpZhcHi/8QH+mxz8LE38WYy980xw/K0crXU0WDCM70yFjbVMZNmBiqrZhTsYQjsP7DAyKB4mxnEQjH7UczqIqvR/iixQ4j/9l6zYuzQTHtEyVYqrL8k4rMLP4zwCyZHXYnw63hh8vVVCUo0caZMd7fIDbAGPw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(396003)(136003)(376002)(346002)(39860400002)(451199018)(66899018)(31686004)(36756003)(6916009)(66476007)(8676002)(2906002)(8936002)(66946007)(66556008)(5660300002)(4326008)(38100700002)(86362001)(31696002)(6506007)(478600001)(6486002)(316002)(54906003)(41300700001)(83380400001)(26005)(186003)(53546011)(6512007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1B0cjF5ckd4clN6SlpjUGthSTdUTFlIU0VvY3lhRmh5czhFQlNmdjZZNm12?=
 =?utf-8?B?NFp4d3A2UGYzM20zZitwQnlxUjkvbjMvVjhmaWxBNW40NEc5UEp6Ni9ZUU5n?=
 =?utf-8?B?aGgyRElndTdhVXo4OVFNRkJxWWpFNU1HcExQMnc4a2lNQkJPVnR6Ri9uUHls?=
 =?utf-8?B?OWUxY0x0UjBBZ1NTbEdmRUMwU3lCQnQrZU5DNmszR3YveFNmQlFsMVRZbHN4?=
 =?utf-8?B?R2twMHdtbk1STW5YZ2dzUy9QclZzSDlMSndJekpkMWdubHU4eWFLN3JlVi8y?=
 =?utf-8?B?ZDAyeEQ4bGpaOHhRSlUyaVBhbWRmU29xM2VQZjJhUVN6dDBTTUxyMXBwTnAw?=
 =?utf-8?B?RHV1K1NpekhEcXdkeWdWWTgwRlZ6K0h4R1Q3K3p4TXlUMDhOdkhWQmZZOTcw?=
 =?utf-8?B?QzE3YkVzVmVzZW14M055Ukx6NFlqaTVjZ3FSaFlVSjlaQ2RjNnF4VVJQZHcz?=
 =?utf-8?B?NmU2MnpyZ2tscXNYYzhQcWNPQXJYWEVQMEtQUTRTMmFNbXVNZExkZDRYb3lo?=
 =?utf-8?B?VG0rV0JtSGpLRGl4Q1RHNWdVbjdCdnAzeTlDdEFyMlN3WFNiY1R5QmtLcjhY?=
 =?utf-8?B?bjRtN3hBQUlqQ3kwVEtMelh3NElzRVBLOXFYOTNtNDFPcmk0MmRzWkduNGZX?=
 =?utf-8?B?SWR2UkZyaDVGV3ZBcEZkMHE2THZrVjkzcW10VW9EMHdSRmdmS3l2UStRa0pR?=
 =?utf-8?B?QjJJclZsUmNCdFlDbnZ5R1cyMlBLRTZsMHdpVUM3VC9PbXVrWXNGWlltaWpq?=
 =?utf-8?B?Y1NyR1QrMWZ1V0lZUTk0NTdyMXNqQ1dDU1p5eWJzWWVDVGt2c3A1Ly8yVFFQ?=
 =?utf-8?B?b2ErcUl4NnBzdGxBZjlzekQyT2pITzFTSm1xV0w5VG53TitBMHdpc0E2aytn?=
 =?utf-8?B?czYzS1dodE5pUy83VFVXSi9WOHNnWmd1RytUT2x4UDFpampNTlJFODNaWWUw?=
 =?utf-8?B?KzFOOTRtTVpSWWhEVThQaVhERFVwT3JCK0dVMGFURkFva3kvcFEwdThYMVd0?=
 =?utf-8?B?RGNJTW1VZVpDMXZiN0xxME5lYUVCWDFxZUhlQlJ4bjY3VURLeGE5S1ZZRHZD?=
 =?utf-8?B?MCtsVVFOY05VUURxOUxXbkh3Y0dHdWl0VXBKMlh1R012cFViMVZiTmVoUFZM?=
 =?utf-8?B?WXFFL0w5OXBLMGcrdHB4Nmp5b0xGTWlCMzJNYkRZa2FoaFZkcWZQdEliN3Bh?=
 =?utf-8?B?SzQ1MXF6c2o1S2lSb1BVVjBuVFd3QVRaL2NYVFJ6RGFuTmgwdTBFT01SeFYx?=
 =?utf-8?B?T05hRG5zRlBLeHVvenhqK2FTSExMWUtML1REU3lWSU1wRi9keFdzTlQ5VjBN?=
 =?utf-8?B?cnRyK2hlYWo5cDdVNkk2bGJGZUJLVzR6V1N6ak1CZnNzWXg4bUIrREExRGFX?=
 =?utf-8?B?ZHp6eTVpdXlmajZCeE9YZnA3RDBIbFhvam9zMUEweE5ORk4ybytremxPL0pz?=
 =?utf-8?B?dkpSY09rc09VZVZJcVpNT3lrMEFCNkZ5RDIxNndneDJUVVZPVC9sbmQyREU5?=
 =?utf-8?B?MTRqSnp5UGJSTjNXUUM5UFkxVXRTK1ppeTRVdlZTZDRqdWVudVhXdDN2VS9o?=
 =?utf-8?B?dzBjNysweFdSYkZpUDl0STJBN0NsYXhoWDljblBOOEhHRW9nTWpqTE9EVEZk?=
 =?utf-8?B?bkIybXdPU01mZDl5NmI3UzR6VlJGN3hNaE1yV2pQcUlkNDRBTThEWEg1L0VR?=
 =?utf-8?B?ci9Ua3lKVXhtaWh4N2Z2ZmREa0FuYWY4OE5HSW54U1ZtcDY5N0VqRnlqWjFM?=
 =?utf-8?B?OGV2K0dHZVpDUGlVMlJGZnY5dXlJdSs2S2xOTTVBeWc4QTlLbXV0aERCN0Z4?=
 =?utf-8?B?aVNWQkVjU1czeklONElhbCs0WHdTenlpR2hoOHFSZUxCMEhmYjh5YUNNVi9C?=
 =?utf-8?B?QmVHTllDQytDYXkrU2tCam9jZ0Z6UHZlcjJVY1VuaEJ2N3BaajRiV1lTSDZ1?=
 =?utf-8?B?RXcrVFlMMWE1a2ZYL1ZRYTcwU2x4SXpDd0FOT3FJa1dENUg0TFJ6a0hFMlNh?=
 =?utf-8?B?ZjBrb2o1THBWVEtEbUdPNzFXbDFyNFBiSEhuRFQrVk1vcjZTVDZ6MlFWTG5s?=
 =?utf-8?B?dVVMK3EvV3JvOHd0clowOUM3Y1VxaGVZNktsdTJuTXRZbzVxaDB4djBWZFdL?=
 =?utf-8?Q?y+6uMberU7DUqcE1/7s9Au3z7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb5bcbcb-2dc9-4482-abd8-08db10bc030d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 07:53:09.5430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JRK2VoNMGoOF+7Los39vLiARyLuVuIX/XjI3w3SpVgOGMahsAGURCl+o0YO+hUkhMLlc2reD0+N5vT5yfTmgHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8603

On 17.02.2023 02:56, Volodymyr Babchuk wrote:
> Jan Beulich <jbeulich@suse.com> writes:
>> On 31.08.2022 16:10, Volodymyr Babchuk wrote:
>>> --- /dev/null
>>> +++ b/xen/include/xen/refcnt.h
>>> @@ -0,0 +1,28 @@
>>> +#ifndef __XEN_REFCNT_H__
>>> +#define __XEN_REFCNT_H__
>>> +
>>> +#include <asm/atomic.h>
>>> +
>>> +typedef atomic_t refcnt_t;
>>
>> Like Linux has it, I think this would better be a separate struct. At
>> least in debug builds, i.e. it could certainly use typesafe.h if that
>> ended up to be a good fit (which I'm not sure it would, so this is
>> merely a thought).
> 
> Sadly, TYPE_SAFE does not support pointers. e.g I can't get pointer to
> an encapsulated value which is also passed as a pointer. I can expand
> TYPE_SAFE with $FOO_x_ptr():
> 
>     static inline _type *_name##_x_ptr(_name##_t *n) { &return n->_name; }
> 
> or make custom encapsulation in refcnt.h. Which one you prefer?

First of all, as said - typesafe.h may not be a good fit. And then the
helper you suggest looks to be UB if the passed in pointer was to an
array rather than a singular object, so having something like that in
a very generic piece of infrastructure is inappropriate anyway.

>>> +static inline void refcnt_init(refcnt_t *refcnt)
>>> +{
>>> +	atomic_set(refcnt, 1);
>>> +}
>>> +
>>> +static inline void refcnt_get(refcnt_t *refcnt)
>>> +{
>>> +#ifndef NDEBUG
>>> +	ASSERT(atomic_add_unless(refcnt, 1, 0) > 0);
>>> +#else
>>> +	atomic_add_unless(refcnt, 1, 0);
>>> +#endif
>>> +}
> 
>> I think this wants doing without any #ifdef-ary, e.g.
>>
>> static inline void refcnt_get(refcnt_t *refcnt)
>> {
>>     int ret = atomic_add_unless(refcnt, 1, 0);
>>
>>     ASSERT(ret > 0);
>> }
>>
> 
> Thanks, did as you suggested. I was afraid that compiler would complain
> about unused ret in non-debug builds.
> 
>> I wonder though whether certain callers may not want to instead know
>> whether a refcount was successfully obtained, i.e. whether instead of
>> asserting here you don't want to return a boolean success indicator,
>> which callers then would deal with (either by asserting or by suitably
>> handling the case). See get_page() and page_get_owner_and_reference()
>> for similar behavior we have (and use) already.
> 
> For now there are no such callers, so I don't want to implement unused
> functionality. But, if you prefer this way, I'll do this.

Well, I can see your point about unused functionality. That needs to be
weighed against this being a pretty basic piece of infrastructure, which
may want using elsewhere as well. Such re-use would then better not
trigger touching all the code which already uses it (in principle the
domain ref counting might be able to re-use it, for example, but there's
that DOMAIN_DESTROYED special case which may require it to continue to
have a custom implementation).

What you may want to do is check Linux'es equivalent. Depending on how
close ours is going to be, using the same naming may also want considering.

Jan

