Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9125F59DAF5
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 13:36:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391921.629963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQSBv-00030B-9n; Tue, 23 Aug 2022 11:35:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391921.629963; Tue, 23 Aug 2022 11:35:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQSBv-0002xn-6Y; Tue, 23 Aug 2022 11:35:31 +0000
Received: by outflank-mailman (input) for mailman id 391921;
 Tue, 23 Aug 2022 11:35:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oQSBs-0002xh-Na
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 11:35:29 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80053.outbound.protection.outlook.com [40.107.8.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae2a16b2-22d7-11ed-9250-1f966e50362f;
 Tue, 23 Aug 2022 13:35:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9188.eurprd04.prod.outlook.com (2603:10a6:102:222::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Tue, 23 Aug
 2022 11:35:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5546.024; Tue, 23 Aug 2022
 11:35:24 +0000
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
X-Inumbo-ID: ae2a16b2-22d7-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/V9aL5BkDPFHifHNpdNMrZCzYjA7uruZmwyNqk+gBwHuO4I0b4ZQdttVzOeer4cGsxydBjzEdgX7JB6s4wxyZfIWt1MccyTI6EAQJwtdiRi3PNqsjM7M6jY9JUMw+qbkipW70lbxNaCDBCK14utjXer6WoP/oj44aWp8fg73SlHY7gPC85Yytv1YdW110yozbBcBkNMvY1isjlLEZER3pKaf4KicD3rNXfvqVy6WcKqyFdLWgUw3UbXtkGSr2sNH2EZRnaEKpZt/n4qIbPhKPpIIe70B3Jf9XeTDhdALcRC4lLunmV7+wofZnNYRzP9gQH+7Jqu8Y+LJTU6MyhiOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRIxb2/48cCqk/xXdZ1ffKRq9ZLvUJJIQ2MWXEsJ1Fw=;
 b=i/xgakgMWIOIidxT9qcPyzCZ1wS0GbsdknMiWNV1rpJqEzm53oZxh7IC7cFNcgwlgvG6qgKrMVEei5fYbDO1/W6nqslVPvIvn05I9lGK2sLkBpgvfpOd0QYHXctw0v6JvbWmORfQ9Iafs2mYTfWaSnXRe++ZNcB21G4VFysOID5o03oWLrpcHAD/GY8RC1Ktaoj/y3aHBDKZZMzcqnRaJH+pJVjDRiXgduN/YPaqEEUhCETD0j0Xyd8d6QI0o++2YkB6VDXj67qYTvQ3JsYrGIb2rn3iDK9v3eg4KMZRmCjg41OSr4WncoqVp56aMO8dE1rhN6aQz59k4GN8TcxrUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRIxb2/48cCqk/xXdZ1ffKRq9ZLvUJJIQ2MWXEsJ1Fw=;
 b=mSCfbFx0JOhXcaWqa0yyOOtQcixzC6ugOXNHoIbhcP+aQZLiRejn4UXdVNKyy/n9yEG3yaL0GQI+s37apGxh+JCgHvNtV8DKw3bNRMzpmQ4OMUiUrxJ504qs06mIrm1NpueDhTuSotQdzH/L2T5XGrWZgLwT6EPJBNedVJIoiVZsb6brfcVBBsYxqwaGhdtzKbZfJmu8nLppn9POIkjNCBSxc41hrtgGgAR51aBrmnB5SMiBSg2DzXJXiWCzz24ixckdFttMzP6uePxnIwVuw9z7IItkAfh0/iIIADwOXWx98CG+1xYWiZL+umzWTyQ/YPyKiaqhuxQLgrNXJhDhvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fdfe8a77-34a3-252f-6aab-1850cc30c7a3@suse.com>
Date: Tue, 23 Aug 2022 13:35:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 3/7] xen/evtchn: restrict the maximum number of evtchn
 supported for domUs
Content-Language: en-US
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Julien Grall <julien@xen.org>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1660902588.git.rahul.singh@arm.com>
 <1a8c49dcc237187cbb9fccaafe1e6533fe68381c.1660902588.git.rahul.singh@arm.com>
 <71c651a6-e8ad-78fc-efe5-2f20c332530a@suse.com>
 <96618b21-7cb5-d160-75b3-953ccdc75ac5@xen.org>
 <f8a3f7d6-1db9-cc74-5d60-8a0e22b80a3d@suse.com>
 <6A4EBDE0-60A0-46B9-A9BA-C689B9F8F129@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6A4EBDE0-60A0-46B9-A9BA-C689B9F8F129@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2711e71b-312d-48ba-ff16-08da84fb91a4
X-MS-TrafficTypeDiagnostic: PAXPR04MB9188:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jTvbPEKDnU5jDr4xLP7CuHHvLV0OErizHNTVzi+QNQDrknlTnbIHCWscwxB/5fv8XuavDdr1ZnSveEuN1C7y1eVp8MjK2b2sIqXhUF2l7dMAtPn2C70D6jvRwze1lae+r68DP1ye6VM9C4rzXsuwn/8r/ekCIIy5GJyEmPbu2le/H5Yy0U3kUKlkJc7XvwbYXINrDgx5QpmZwq3nxSNnxHyt5ROrATR4nmcQfPeIcReH/u6rIS5WWZZhzaC8eGGpFgitLL0Wpowp+R9pF1nv/Pdcb5sHg2ddDuGoKyFdWEomqwJpbafz0kvUcDPKd4KOCmLhDAwPfvy6hy1ubhI/L168ToOSseaAX+romf3XWIOOas5DYQ2lajCnFvUz3/G9Lcbg1yry2CnJ+HrSEOtjv6ehG66wMxanhWdYsCVCtjB4nq/MlmHi9BpCWDN1AYhDk0vs9En6mu1TgydyzmC4jB8Uo1TPFkQ31mgypNuGjMXs0EXP5rPABj+XQesKQND5k1YxK5G7kyCEnwpJ5P31STrs10I0k2DCbNqPc71A3EGGnb/uM5elaIfHwfHr0RhfNJDLuygjTDr+uqGTr7FLXLBRorWJprdxIYsrOFa5t4VzZMdETHD8YYu0VEJQB1nYLgTtnfJfWk8wG1oTvz+/H7bIukNmBNbNzrqO1tkvHMNRcFkeoliQrVRcTOUhoRnxRIX57QsU/BOFWIyvLfX4tISbssFDAzzWa+WacvlWPFU/lj/LMd49nzuG83RfgpAoa6r6NXO0+SqVaSqtN2cr4YHrjnU5Cr7I9Kqj/tRjWbs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(39860400002)(346002)(376002)(136003)(53546011)(66476007)(478600001)(26005)(6506007)(2906002)(41300700001)(6512007)(31686004)(83380400001)(6486002)(36756003)(316002)(6916009)(38100700002)(5660300002)(2616005)(66946007)(31696002)(186003)(8936002)(8676002)(4326008)(66556008)(86362001)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEhFQVMrRXR3SVc3M0pXdTZwQk8rVU5IUDhvempQeElVRlVsVmRlQlNKcU5v?=
 =?utf-8?B?RlV4Vk1NOTZ6enRlQXA5eW40NCtFOEl2WnRxWVMrWGp6YlBWYUI3QlJrUUly?=
 =?utf-8?B?UWU0T2N0TmFzTWN2c2c0dmEyVUJZOHRveVlodkdXWEZ4QTZ2L2VSNDZ5OVFa?=
 =?utf-8?B?cmZZSTZ0N2theEJEbkdRQW84NFhJdkVXbDdaSmMzRmNkUzIrVys5L3JDUXc4?=
 =?utf-8?B?SVVhVC9aVTA4M0FQOG5TSy9TSStHYTh2NlBGSmQ4RGcvZ1lQM1BOTWppVTRo?=
 =?utf-8?B?M2drOElhd3BLN3EwdkxGUE9qdDBRMTVRamxLYnJOOGFPU21Od3FTUWF5YUpx?=
 =?utf-8?B?L1dSb0tiWFRES3ovbEhHamhCWEx1QUJUaVRPWlhpUVBBM0EwWUU3MVVYTnZy?=
 =?utf-8?B?Sy9mWUxHSHhRRUNlb3cyWmhvcDdmSTQyenR6LzJkWmlPeUsyL09yS2ZjWkRW?=
 =?utf-8?B?anJhL1FHalBvb1p0UDRyREE5Q3hzNmJBaVovbTlOT3FLQSsyME9tYlJTTGl4?=
 =?utf-8?B?STBXMjlFNUpWdXI4RmJiRnpVeWlaU1JsSHJ5MDV3UWpsMlovYVFxeW5OUXNp?=
 =?utf-8?B?M3YyU3RHV2xOTWY4YzdBVENkOVdlZG9iU1Y5QU15QmNiUWxpYktJc0RtdVNj?=
 =?utf-8?B?bWIrdCtCVUlnQWFXcUkzQWx6bDJQc1BNZDNLcXBoSS9CMk9vOGd3NG5LbnUx?=
 =?utf-8?B?cU56bldUSk9CMlFkT0ZnWDd6eU1SOUlWWnFuZUhCU3hqNWVUU2JPSkViV2pi?=
 =?utf-8?B?aDBwYlBWUjBGd2NqZURXUk1Yd0JSNEJVMyttT1BqV2lsMlJHSmt3NklsQlA2?=
 =?utf-8?B?dHhWNDhYTmhVY3ViVjhxa0MvcUVSdytkVC9IeDlPUG1sL3Jibzg0ZWVPVERs?=
 =?utf-8?B?N1pzbTVKT1YweWpXSTY2WTBjdmV0ZFE1RGhIaUI1RG8vbEdwTHh5YmxNQ05q?=
 =?utf-8?B?UGlLZ3hSeGx3QzNCQU5HVEp5bFc3UldyOFlKRnY2bERpVlRmNWVueEhKU2Y5?=
 =?utf-8?B?aG5aOEJwb2F3dW04TWV4R0tLYS9RbGxKNEMwVC9KM2Z6Qml5SjFVa1JxR1RB?=
 =?utf-8?B?bU1ObDNpT1krZkYyN0l6V0lici9wUGN0cHROL2NEOUVGVy9YYnR2YkJyakM0?=
 =?utf-8?B?cVlMKzhFanpjMERjVzh3K1JVOThFR1dCR2h6c2gxdkxxaG5mUmZ0Y2RhZis0?=
 =?utf-8?B?V0dTQmwxQVdqQ09KU3YrODBIK3EwbWdPZm83OWpqMXdHL1ZsQUcybDBBYkx2?=
 =?utf-8?B?NEpkaHNjcGlBYnk0em9NclNBaEE4WW5TNGJzcTBBd1dPNWtoYVRrUWtYazZZ?=
 =?utf-8?B?TFFtTTBDeEFBeHVuMFcrS0RjZmt5bGd6cFZ6ZWxWMG1XaUVyb0JrT0tjZkZo?=
 =?utf-8?B?cU9DdllSd003cWVJdytoNkhIdzZ6ZnVPT2VjZy9CMVBHbmROdyttMkdCNEgy?=
 =?utf-8?B?Vk1hT1ErSUUvWkJlQTlQeUlNTkJUMThWa0UraHVCNDhYWWkrSUdRSjBaSHh6?=
 =?utf-8?B?V0VPYVJ6eWVQdjlqL1Vud0t0UnJ6TEU2ZlMrdWRPZTltSFU1bEFsejVWdkdj?=
 =?utf-8?B?OGZLazJ6MENheHo1OVhQeUlTbnVOczlQTGJMbjB4NXNZY0dCUzd2Z0xZN1Bj?=
 =?utf-8?B?Nk52UDRJOGNLRUV6K0V5alVmakRJd28yK3dWdlZOb3ZkeG5LV1hxYmwyM2t2?=
 =?utf-8?B?Uy9kVEtadGdIdTJFSmhoRkY3eVYwQXhjUHF1cXFMenlXZk5KQmtsNWxpbXMr?=
 =?utf-8?B?Y3AwSzF3YTlOUk40NExZcXhkeTJOeExJSCtOdVp6UkovUGpJT2lSUDJZVDFU?=
 =?utf-8?B?N3VWNXdmekE0RTJUWE56RExMemRaZUZ5RjllUjRPQXFQelo5UHZNZmsvRDhR?=
 =?utf-8?B?bVRTcmlOOElSWXFKZ1RlbyszZ0o2bDVUUkFBMzR2ajVNUXFtWGNHWlpvWHFw?=
 =?utf-8?B?MTJuWW9vS3ZSUzdIVW1LT0ticTJtemRQNFNXcFQxQkhjTGdLMFd3UVRZL3VB?=
 =?utf-8?B?Z1dwRk5jWmxjL3ZSNjQ3MzBmSjFJVkJwWDY1M0s2U2FORWhvNGpzU3JrYk1r?=
 =?utf-8?B?ODhWZEJGZ0psZDM5Wm45OWJ6M2RDOWFVaktTRCtFNlRrRXJSQ3BKR0lvakQv?=
 =?utf-8?Q?gBpNI+rbUNf1+DtcEf/wDMBy3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2711e71b-312d-48ba-ff16-08da84fb91a4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 11:35:24.2607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ID2YUH0IUMTPVnEYQYCzA9ppVatKViJ9FYB8srjTF5PCmrdymIfxACKF8E/Cp6L1WBPy4Bx6+GmRx2YV+n6rsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9188

On 23.08.2022 12:39, Rahul Singh wrote:
> Hi Jan,
> 
>> On 23 Aug 2022, at 9:29 am, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 23.08.2022 09:56, Julien Grall wrote:
>>> On 22/08/2022 14:49, Jan Beulich wrote:
>>>> On 19.08.2022 12:02, Rahul Singh wrote:
>>>>> --- a/xen/arch/arm/domain_build.c
>>>>> +++ b/xen/arch/arm/domain_build.c
>>>>> @@ -3277,7 +3277,7 @@ void __init create_domUs(void)
>>>>>          struct xen_domctl_createdomain d_cfg = {
>>>>>              .arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE,
>>>>>              .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
>>>>> -            .max_evtchn_port = -1,
>>>>> +            .max_evtchn_port = MAX_EVTCHNS_PORT,
>>>>>              .max_grant_frames = -1,
>>>>>              .max_maptrack_frames = -1,
>>>>>              .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
>>>>> --- a/xen/include/xen/sched.h
>>>>> +++ b/xen/include/xen/sched.h
>>>>> @@ -76,6 +76,9 @@ extern domid_t hardware_domid;
>>>>>  /* Maximum number of event channels for any ABI. */
>>>>>  #define MAX_NR_EVTCHNS MAX(EVTCHN_2L_NR_CHANNELS, EVTCHN_FIFO_NR_CHANNELS)
>>>>>
>>>>> +/* Maximum number of event channels supported for domUs. */
>>>>> +#define MAX_EVTCHNS_PORT 4096
>>>>
>>>> I'm afraid the variable name doesn't express its purpose, and the
>>>> comment also claims wider applicability than is actually the case.
>>>> It's also not clear whether the constant really needs to live in
>>>> the already heavily overloaded xen/sched.h.
>>>
>>> IMHO, I think the value would be better hardcoded with an explanation on 
>>> top how we chose the default value.
>>
>> Indeed that might be best, at least as long as no 2nd party appears.
>> What I was actually considering a valid reason for having a constant
>> in a header was the case of other arches also wanting to support
>> dom0less, at which point they likely ought to use the same value
>> without needing to duplicate any commentary or alike.
> 
> 
> If everyone is  okay I will modify the patch as below:

Well, I'm not an Arm maintainer, so my view might not matter, but
if this was a change to code I was a maintainer for, I'd object.
You enforce a limit here which you can't know whether it might
cause issues to anyone.

Jan

> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 3fd1186b53..fde133cd94 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3277,7 +3277,13 @@ void __init create_domUs(void)
>          struct xen_domctl_createdomain d_cfg = {
>              .arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE,
>              .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
> -            .max_evtchn_port = -1,
> +            /*
> +             * The default of 1023 should be sufficient for domUs guests
> +             * because on ARM we don't bind physical interrupts to event
> +             * channels. The only use of the evtchn port is inter-domain
> +             * communications.
> +             */
> +            .max_evtchn_port = 1023,
>              .max_grant_frames = -1,
>              .max_maptrack_frames = -1,
>              .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
> 
> Regards,
> Rahul
> 


