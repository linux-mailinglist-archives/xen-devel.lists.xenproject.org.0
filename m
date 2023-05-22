Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE71570BF4B
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 15:11:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537941.837600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q15Jb-0004yy-3J; Mon, 22 May 2023 13:11:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537941.837600; Mon, 22 May 2023 13:11:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q15Ja-0004vm-Vr; Mon, 22 May 2023 13:11:06 +0000
Received: by outflank-mailman (input) for mailman id 537941;
 Mon, 22 May 2023 13:11:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqCu=BL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q15JZ-0004vg-PA
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 13:11:05 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe12::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a7cddb5-f8a2-11ed-8611-37d641c3527e;
 Mon, 22 May 2023 15:11:03 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6769.eurprd04.prod.outlook.com (2603:10a6:208:17f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 13:11:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.027; Mon, 22 May 2023
 13:11:01 +0000
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
X-Inumbo-ID: 1a7cddb5-f8a2-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=llpcAnIOzgn7iq3tMHHVn56uxu9zgN0OCx0983ksPo/++Z/jW/eE8IDJFY9JvS1Ce0sC3sgXgJXp9rN8OQiiRBz7YBTwCp8rO8GdLYxdWl0qUdf5B2gYY5jvtegdFqp2kEaBQdRbGSqSTPfhohPoxkNIwoMKvBHre3W3qilxnH8GNfUjWGfmjKXLKHAtzEs1mGOc92I72MmlXt87zGjupfbFD2Zoi1NjQBNZvP8agZdLsNlkP7gjMOsmCRNf/7VQn5h/N3e1wIFLXQX4Iyjacw7k3uMe7OfZVZ6rIszv3AOBroDWcX9oxunj/f1kdmIX2k7DgsgoBpn38KAu8DCdYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQx7JbQDwx5VnhnNN4cvMrDCVnEY442MqhFugsFIxYk=;
 b=U0hgbQPUhSvLb44vtnFHRcodrZYaArlw6tT7KXLiE3TCOHhHfutpNp4fL8IJsH2hYB0wczVjwfuuW82ArUhDH2BDl9EX2/QsebP/w8seoVUvfakU/9L9fRR4hf3T23b5VLoS6IOk+GBKsheWqZguET77aEuSSQm929D3txoBGSlS8Z+GeMrug7r8sjeMSpZDgDBA16ctcBPtrmcwG0o0c5qyjF7Ek8SoBSHz2/iyGx+ft4W4z8dyiF6kUK5ZZYHmAOQjf1vxgUrZwVJTnnLYBbMumhnhTMex892u3Ol3OPYo/nHVcstlYzvw0STNZCLv9IMP+F/tF8p9XGD/pYhJXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQx7JbQDwx5VnhnNN4cvMrDCVnEY442MqhFugsFIxYk=;
 b=Lxa8LaNSZJJp2tvhtA9qfplXIFZ7lV93CYVL6sB8F+FX1Cah6+fTyyPeOReqopuRagA+bftd2iwH0IHn31ASMPqKAWyLU/+lEHZhDB4biC5BEcYmVfZ4uxEBZiUwXbiX7XYvkm7WgPGfIJYT6Bae5pK2XTXgJCZ2h4FDUgtWY09OET55foUPjhvaIBlGGN1vKPAalePKojFrex1Quqym/WvyVk9CmlckAAr2g12IjJif1XQkoAzS0I2LF27rO7yxrp14frZZu5j5bkLeOAspxXDw9RbBrUl+SNNU+boMOkZEQhs+juw/qwlwNZt7iMXoUfB4hBqNKhB6yC7Rxr8pkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <602ff9ef-e573-279e-441f-463ca7613fa6@suse.com>
Date: Mon, 22 May 2023 15:10:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 10/14 RESEND] xen: Add SET_CPUFREQ_HWP xen_sysctl_pm_op
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20230501193034.88575-1-jandryuk@gmail.com>
 <20230501193034.88575-11-jandryuk@gmail.com>
 <1166bdf1-4d54-30bb-bdf9-65dfaeb6b29e@suse.com>
 <CAKf6xpti23_fmwVWOafjUU+OPHPOA7EWOfkShGT9Qqr9=mR9zQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xpti23_fmwVWOafjUU+OPHPOA7EWOfkShGT9Qqr9=mR9zQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0188.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6769:EE_
X-MS-Office365-Filtering-Correlation-Id: 45b8a08c-5694-45c7-3911-08db5ac5fdbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IHBlSG2rrnA0zuINQtqEo+cpx01/7HJtiFCTmLRFSxSCF6/HPP41XG0/Cwf22VPtm/9dJhPiuXqzmGxCVkb4MW/4lGNdDxfbUZnrR9upAX2OrFLYiNRzyaql70kEpEj1r4sy2IusGJ0NDZ+Zb7Hj+thNg91ADVdo2iawBFFzcgpWcJ+98Y3oBGmX810xUHe0Gu7dBEHUeyJqB+h5K/N0sTBc85IQDjO6NZZiz7KEvawsdpY/MTFxThjbyJQq351xM/PafBqM4v1C+fpIroMsZ74aOI0fgdFxnf4ijWCJSPssdoSpeODe67kgSq3CF7fZ/twEHn3u7jxSAE5xdMC7khQOhymG/YxkjiQ+vJe1+GPdZJtZ3ujbtPKh7P35VatrRsmXyan3ORYobq2yNQ4ZxMN3283fEx1OLMiiF/42d3kuTtN0FOTgx03UdU1fKvHnvXZQ2Gvyn/OtxM0y9//OOligCUEIfUAg0fjBMm4mcXOrgO5oRUWaD/l7J7/BIqWco4pkT9tSDrkRSnYbpAVB8KhqhX/xcVQkGG0bCnke9kgtFiPaiER7NElID0xY45WunArbAsmxUaULjpYa0RAuolp0GW5CYcraoE2fdrbXpVPR7QwvPjidb8TX7gHz9F54bOVIgoULhorWvMSdOf5XVQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(366004)(376002)(396003)(39860400002)(451199021)(478600001)(186003)(31686004)(54906003)(41300700001)(5660300002)(26005)(6486002)(66476007)(316002)(4326008)(6916009)(6506007)(6512007)(8676002)(8936002)(53546011)(2906002)(2616005)(83380400001)(66946007)(66556008)(38100700002)(36756003)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVBjOHIzUkpkSHRDcTJLRE1Dcm1GZmNwMlUrQnNvZnpNVWVETU1wMHNmcjkw?=
 =?utf-8?B?cno0U0ZDQ1dLY29ZdkVFTk0yTWdLMTJRVjI3OXFkR3FhTWt4SW1jcjlMRGFS?=
 =?utf-8?B?SFA4ejZyVmpjNW9ZbEZoUUZUMC9VazQ5clhkWVlNRlFQU0lmcHhQQzhQaU50?=
 =?utf-8?B?Q1pnWkZDdTNleGtoS1NYcWE5a1oxS2VjSkQ4UnF6cGNiWUpUZGd0K0pWeExW?=
 =?utf-8?B?bVhlTFJxUGswV3NWUllYTFNtRTd6M3ZKQXdPN3JGL3RmTllCMHRBeTJzN25k?=
 =?utf-8?B?cEpDRzlXZEh6NVBZRWt3TGtVVndYc3E3ZExtMnpLOUdhcXdKVjlTSzZBTlBH?=
 =?utf-8?B?dkJ0R24yZGFUQW51ZlJBc25FWjV3Zjc3ZzJTTUR5ZkNuL1lvME1xbnhVS24v?=
 =?utf-8?B?b0dENTMwazhkN25pOXlnM01KVTlqWFB2Y2FNdndVMXBkaHJ0MUtHdmZ2Zk1u?=
 =?utf-8?B?djVIbWNtY1ptbTFRUmlnVko5S0Y0dzV4allBWStRcnJXY2ZIOGxvYVBQZGYr?=
 =?utf-8?B?cmcvRjNuV09JZDJxd2xoVWpqZTAycVR2azhKYXpPRzg4Zmo3N1VnaTQ1UEox?=
 =?utf-8?B?dUNJVk5ETnFiT3cveUo4QVd1NnRiMXlsVGVtNys3dDAvNHFRT0RxUTZDUXYr?=
 =?utf-8?B?NUlTWFQ3a0duYkJEdUp3QVhFSDI4cEpUNk9qZm1WUm5ENlRTcHY1anl2QnpL?=
 =?utf-8?B?cXVqTUVDcDROc2gyVlhTWHZrZW9WcGFrTW00QmdZZ0RaL211YU5CNGl0NlFu?=
 =?utf-8?B?UFFNaWhmZDFxcDFJWU90aTl0SjQ4enI3NS9yeFZvaU1kQUpQV2orbVFlOENX?=
 =?utf-8?B?bUFCcis3bndGWGtFbTlBZ1VMVTRQZy96eGN5ZWROSXVrNjJLOEpTOGdLeVpZ?=
 =?utf-8?B?WHdHZEd1K1dkT29FQ0phcGpCWDZVbVVXdVdTVmZWY2IycXBLN2ptMGhFVkFx?=
 =?utf-8?B?UkFkMXF1UHVwbjY4SFVYR0lIVnJ0ZkhCZTZHTFNMMVQrZ2s0UEtRK3hXcVdu?=
 =?utf-8?B?aHArVHNwaklSQmx2MmNXVTJnb1hUclNzWlAyY1BhQk5oeDVRa0VQSzMxTzBp?=
 =?utf-8?B?Yk5xcENRcU5LSzdENG82ejlzK1RZUW9jSzhpSDZLOXRGbmFwZmsxbHRjTFVW?=
 =?utf-8?B?VktRcGE4ajU2WEk1ZGMwdjZocFVwditEWnlaQTBkc1kzeXE5YjFZSWhwS1Rn?=
 =?utf-8?B?N1pLTllHYUJRV0hiQ0NJQVJkczBnSnJML1BoaHducHdPcmxQRDh6QmtxZ3ZN?=
 =?utf-8?B?VG51dTR0VTlxanlTNUtkYUc1RVVFaXFTRm41cng1L21PUHFmUlpCNWw3UVo1?=
 =?utf-8?B?OGFFMHRwNlBlV1h5OVlWdEwrMmZ0MExaOHduOS9mZVk2M3pLRmhzcTVwK1Z4?=
 =?utf-8?B?bUM0eFZoZTd0M2ZKMlE4Vkw1MDhtL3NOajUrTy95ZFVmL2w1T0lTZnFHZTh2?=
 =?utf-8?B?U3BEclJsTnN6QUMza0RDc0NNT2FVVUphNUdaN0k5TEZjSnBZM3AxNzdIZklT?=
 =?utf-8?B?bnRHZzBWWkROUWIyRDg3UzhNbnZ6WkFldk9MSzdRYUhSbEJYM2xoZ1NISXFU?=
 =?utf-8?B?dHJOTmMzOXJBNG94OWlhWkxaY2RSbEFlWmp5RnVqanNvenl2V1dvWGlRTnZB?=
 =?utf-8?B?enRhSit3TktPVUZiNUViakZYcTUweU1TYTUzeDAwdmF1TXV0NllsOTJjVnU3?=
 =?utf-8?B?UVgyVkFDYnlwZFZ5Rk5YRXhUWTRJcXB1V3FlWEt4ZEY4TXlQYnV3SDFOL1hV?=
 =?utf-8?B?RHVsZ0lHUDBkTWRhYld5b1RpQVJDbzdrbVhiSWRIdFo3QWpvMlMzd0ZCYXdN?=
 =?utf-8?B?T25RQzB0MEhkUEJISGM0REh4eFJpajJydWE2YVdnbmhTK0daS2xOR1ZPajFK?=
 =?utf-8?B?c293STBLQlBieXJKSm5MTGxmYTJLWWlaa3FFUS91elkzZjUyd0VBeFF3Y0xr?=
 =?utf-8?B?TmF5dXpSdnFvV1dLcjZadEQya3FUVm10YnRZZmJ4Z0hBanN3eHllZXAwMnVG?=
 =?utf-8?B?cXhnVXhwQVk2Y1pVcW9MRnJtank2emRHMG1LYmJBTFpFVWR0aFZ6UWJpZ2tC?=
 =?utf-8?B?QWRsQ2NLTWZUOWhCdVNwNGszeFFBOFUyL09xakE2RENBQVh1Q1JXalFtV0E0?=
 =?utf-8?Q?1P6fd2zUKmAw3PaOVTRZTDr/t?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b8a08c-5694-45c7-3911-08db5ac5fdbd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 13:11:01.8856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vTYsvS+wbON6SAR1rUC0zqlDg+VvUYzBA5r6pl4dYWSERzWmN8pH+H7FeDSKWaJsH+VY6NKBkYvqVvYovo6YKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6769

On 22.05.2023 14:45, Jason Andryuk wrote:
> On Mon, May 8, 2023 at 7:27 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 01.05.2023 21:30, Jason Andryuk wrote:
>>> @@ -531,6 +533,100 @@ int get_hwp_para(const struct cpufreq_policy *policy,
>>>      return 0;
>>>  }
>>>
>>> +int set_hwp_para(struct cpufreq_policy *policy,
>>> +                 struct xen_set_hwp_para *set_hwp)
>>
>> const?
> 
> set_hwp can be const.  policy is passed to hwp_cpufreq_target() &
> on_selected_cpus(), so it cannot readily be made const.

I was only meaning the 2nd parameter, yes.

>>> +{
>>> +    unsigned int cpu = policy->cpu;
>>> +    struct hwp_drv_data *data = per_cpu(hwp_drv_data, cpu);
>>> +
>>> +    if ( data == NULL )
>>> +        return -EINVAL;
>>> +
>>> +    /* Validate all parameters first */
>>> +    if ( set_hwp->set_params & ~XEN_SYSCTL_HWP_SET_PARAM_MASK )
>>> +        return -EINVAL;
>>> +
>>> +    if ( set_hwp->activity_window & ~XEN_SYSCTL_HWP_ACT_WINDOW_MASK )
>>> +        return -EINVAL;
>>
>> Below you limit checks to when the respective control bit is set. I
>> think you want the same here.
> 
> Not sure if you mean feature_hwp_activity_window or the bit in
> set_params as control bit.  But, yes, they can both use some
> additional checking.  IIRC, I wanted to always check
> ~XEN_SYSCTL_HWP_ACT_WINDOW_MASK, because bits should never be set
> whether or not the activity window is supported by hardware.

I took ...

>>> +    if ( !feature_hwp_energy_perf &&
>>> +         (set_hwp->set_params & XEN_SYSCTL_HWP_SET_ENERGY_PERF) &&
>>> +         set_hwp->energy_perf > IA32_ENERGY_BIAS_MAX_POWERSAVE )
>>> +        return -EINVAL;
>>> +
>>> +    if ( (set_hwp->set_params & XEN_SYSCTL_HWP_SET_DESIRED) &&
>>> +         set_hwp->desired != 0 &&
>>> +         (set_hwp->desired < data->hw.lowest ||
>>> +          set_hwp->desired > data->hw.highest) )
>>> +        return -EINVAL;

... e.g. this for comparison, where you apply the range check only when
the XEN_SYSCTL_HWP_* bit is set. I think you want to be consistent in
such checking: Either you always allow the caller to not care about
fields that aren't going to be consumed when their controlling bit is
off, or you always check validity. Both approaches have their pros and
cons, I think.

Jan

