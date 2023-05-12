Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3120E700084
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 08:30:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533689.830541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxMGq-0006ks-RY; Fri, 12 May 2023 06:28:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533689.830541; Fri, 12 May 2023 06:28:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxMGq-0006j7-OT; Fri, 12 May 2023 06:28:52 +0000
Received: by outflank-mailman (input) for mailman id 533689;
 Fri, 12 May 2023 06:28:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mY6V=BB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pxMGp-0006j0-9v
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 06:28:51 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20631.outbound.protection.outlook.com
 [2a01:111:f400:fe13::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40b8b2b1-f08e-11ed-b229-6b7b168915f2;
 Fri, 12 May 2023 08:28:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8779.eurprd04.prod.outlook.com (2603:10a6:20b:40a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.23; Fri, 12 May
 2023 06:28:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Fri, 12 May 2023
 06:28:46 +0000
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
X-Inumbo-ID: 40b8b2b1-f08e-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WuLJe5HgRCxDdpcsOZAwOuWsn8oNY694dqUH0jibLUVg4pR2NIGU+rfk+Lz/PerMFt3zcH6Z+D1/Gp4tMPLgwXvOC8aWV/00lkmktwxhj8aijmmlnD7pVKUqYtr02v9CuhfkEpZdR51t3tvaHSdts2P/YZdntNbL0w6K6qsTxOV6yto3ApIapfY65lLCjFQI9ngCdHscJBEtoAl+Gr5DYg5jAee8QYsLCWDCUe2HykYIkwjdA9LhaLPsQ/9MOxzXvNSWw+F37qDEuSRbO54PuDjmvuXS62anfZ/pFy1Me0emuMqvb9HbTH96S16/jtz72or07tlpsOtDCLh7bqdXWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHFhPSwrTcUXK8uA4161kdOyRt5H5iLkWrE/pxhUHzw=;
 b=U8AfVUnHBbIHS2e1mW3IL45iFPwKFPciPdQuUmvwqkov0Wfw6ZM6W1o/v6BtIzTJZ4SQD3Of7E2gNO9VAZ/x8znZ6rIwv4oGEje+YlEwMIPVFkXL2CpMKCsad7f3+X5T8tGF/y203cxPXicFn9jtRvPxzAsMWeAEb67DCleo5LY3mrPKint0VI8ughw+BTzYavzJRQRWdfzD2RbxeqR2GVBOo4eQmgRGd0QhvVum7pYBNfX+5bd/TA+exW04FEJH0biV1TwJCMxAbJfNkqq+FlN1AfixkZjIIrtOc+819NTTu/hTBgGIote27MJuXGQFq+1LEv3QsBBOxuWajzs2VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHFhPSwrTcUXK8uA4161kdOyRt5H5iLkWrE/pxhUHzw=;
 b=hEYtx8jlEI8Yj3ZTWstd07zVJnfBg1KOtaWvT44GiK5qpLfyIJCVsDjhxdF+jchAMnrQSCvZgJDP6y/izxrp42/g5q6qp8d53NFAlqzLL72fTj/6b6XvZoLS1xpAIkiM93YWJj68EG40Ye1ouMlnm86ELjikRawf75d326pzgfQt7k3HU80tfAIy64eqgEI3X9MmTOkbuyrLMEPEQjU4r29Lk60bEONWzg35Om5VM5EAle+teqfIYapZRDi/4SqP4+96U1tnp4LF9SEkH2reDK4YyYUf+WdfV2Pyowj8PrNvI3cni+1odHRwMHuD2Q5NBxifHZh7CxZfgSy9zKqIVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <11531470-89a5-5bf5-3c13-3cfd0d614e07@suse.com>
Date: Fri, 12 May 2023 08:28:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 04/14 RESEND] cpufreq: Add Hardware P-State (HWP)
 driver
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Jason Andryuk <jandryuk@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230501193034.88575-1-jandryuk@gmail.com>
 <20230501193034.88575-5-jandryuk@gmail.com>
 <43c519f7-577d-f657-a4b1-1a31bf7f093a@suse.com>
 <CAKf6xpuzk6vLjbNAHzEmVpq8sDAO8O-cRFVStQxNqyD5ERr+Yg@mail.gmail.com>
 <7921d24d-7d4d-8829-44bf-b8c2ecd001c8@suse.com>
 <CAKf6xpt0n2GO1PuqeaiWi6iOoeBt0ULoKJ4xgeiTZo2Rh67kVg@mail.gmail.com>
 <4bf60ae8-7757-7440-1a4c-95260c0f0578@suse.com>
 <CAKf6xpuZRgQSe7=ST1sa=_vNOvDeC+bnDG4deb9m=A2M5+X2Eg@mail.gmail.com>
 <e9dd85d3-0e97-cb96-561e-75b23386a7a3@suse.com> <ZF2QEBZz25Bi5R0l@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZF2QEBZz25Bi5R0l@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8779:EE_
X-MS-Office365-Filtering-Correlation-Id: 03c159d0-c73a-45bf-3bbc-08db52b22389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g5LVy2VgFgpH2otO9/zThewXEqN728TmpQCmME6WHjA19vdP3H0UFuoxx2E6iOhX1C98J5MX91SB52JD7DIboJStp460q71ujrJNDTzmrbNDf9iCfYrvKGI+5Rq5s6jY+NTcWmaIRDQOkcWUs4f5jOobQjAYYf4gYAgwOP1dWtC/9eq6fMNtpzYVjRCE5wytTVp1XGgTolXsqrwLxMDNh/CpimOcnCMUxZDARNNrd35qah8KJ0eOh+kLBkECuHvYiMca2ggl3NJhpOK+XZNsVzUdrYq6ntURsqCe5jKkpO7MIwzy+Mnc7HTS5/wxzEvoLC8zTA6lepPAYB/4P6tg/qn9S7QDfTy0lnhht4zvtAq7szsdcBUPGObGbZWC0uKLITHNHk3+DTfZjCGmrM7zq7B2lvLeXKbFF1ZQ4/iOtkJ2NLEy4kp+5nsNNmQ93sVpl+UGhdRR6MOUbS82YK0/QroU2C4EIPn6EHf+0wUoJk6xcW99O6k/Prz+iNWTS+Gjjk9DA3144BIEKT02DuF6S7HXhbKhOCyLo4iDhnsqe+gSL9oF+otJRTSMgOxH6/d4wWLgI6AKKunrptvEo+/0HDFTDG/txzGEz2N8JM7lk5Hk0yqv2WvIE3ouuEbPgrZ8/j+M7wMpvw6yx0clKE3clA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199021)(31686004)(83380400001)(4326008)(66946007)(66556008)(6916009)(66476007)(478600001)(316002)(54906003)(86362001)(6486002)(31696002)(36756003)(66574015)(26005)(186003)(2616005)(6506007)(53546011)(6512007)(8676002)(8936002)(5660300002)(6666004)(41300700001)(2906002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmZERzFrSm42ZDByV0JXMDFhbDNxRUFOWVB0SWhGYjJYOFh5MHpIb21tYkNh?=
 =?utf-8?B?Uk9nMHRocDhDNGxSYzhTem1EdnY0ZExVZXlsSDU2SDNTRDlVcE1KY0RpYUhq?=
 =?utf-8?B?dWYvV2NPQkpBTndXR04yTmVHekp3R25qZFE1SDRJWkhic1BxMG5MZXZpWEpC?=
 =?utf-8?B?WVJpOGlYRjhpNEhFQkdsMjhJejhTK1JIaUJFWWkveUptRk1rSWQ4dUVreDlY?=
 =?utf-8?B?SHkvSGNtRnBLR1NXMndlV3Y4NjNKVXJEeHQzWTkzS3ZIZkdNRnFwVEM0cEgw?=
 =?utf-8?B?K0d2blVFWUtWaXNVVFovclFVVnBRb2ZrVGZSNmxjVG1mTVFlM1pFZko2cEE0?=
 =?utf-8?B?NUxJdTI1ay8xOWxFYWt0cWI5MDhxbmlKOHlUQWM1NnpHQjlDbXZGbnNCOHpm?=
 =?utf-8?B?Sml4c3FxMlNDcVN1OHpHMjFDcmFncmdaZ2JpOUFVUkpOelVqdTZXNERkU3FM?=
 =?utf-8?B?U2JVdVlEQVh3Smg1akpQenlGTUlkd3ZINUNJbzdmNXQwek1YVkQ4ZW9SRkho?=
 =?utf-8?B?NXlOdVM4SmcxT0V2bzlxeE5Ea084cGRndDg0TXJaT3Q4eTkrN0hYVCtPMGZS?=
 =?utf-8?B?cEdSOUcvMlY1eDJtOEhQMjA0cDZ1WHJBV09VTmFMR1dzRFdlOTZRa3BlaTd6?=
 =?utf-8?B?aFV6OFB4T0VoaGxvNmhKZ1NCUXd1dng4N0Q5SXA4MlhBTGd0RGRqSXN4OWdC?=
 =?utf-8?B?WTBLcGJOOXNpMmhkWWoyYTkvTzRORVQ3N2d0bDRMcHRWSE5hclZaTjU3U2hI?=
 =?utf-8?B?Nng0Tm9hSFZuZFJ2VnZBaVYrdHJUMjBIYVNwM05hcHp5dWVLM2liQTE4a2tU?=
 =?utf-8?B?UVM5czNqMlJ4KzRqSEF2L0szeVk5STVmWXhiVFY5anI4MXlmSVF5bllvSEJY?=
 =?utf-8?B?SWwxVWxINitXVUtlVjVjQzNmN2VraGRpMjhNVU02amc3RkxnaHBHTGdjNmpO?=
 =?utf-8?B?UVBvNjVVWjFEVHFrWHJkU2JKek04Z0dQaVR5MC9vUWN0ZCtUdlB2TDdkSWE0?=
 =?utf-8?B?MmNRdjNoVXRJWHpaUkFBM1I3bVZJN3RlcC9VMEQ3dHdoVzd1eHd4clVoNlRO?=
 =?utf-8?B?dUlNRE1LWnAzRjZRdkJHWFNCby9WY1BUZDlwVXNRTkh1cElxbldrRTg5dmJT?=
 =?utf-8?B?MXBjVzJYZ2lwZmJDMTg5RnRxQUZjRHNHK0hGYldKTmJqQTFORzBtYS9KMkMz?=
 =?utf-8?B?ckxVV2xDOStGNFBUK2xqb0dHSVpOQ0VLYmxGK3lWNDZJamY2dDdHYnBKQ0FU?=
 =?utf-8?B?YmY0NUJRNDRLS1R5c2RuaC9ScVBrOUtoNkVrQXRYaVNldEtJNU9tVExKeFpn?=
 =?utf-8?B?ajR6dEJ1VjlLcjVPZHZrUXNzYmNSaUtNY0VOTFNYdDJpcXBOUXMzRTgvQ1lj?=
 =?utf-8?B?Q3BSeUZCSkN0TWR2cjcyWVJlcDRkMTlkMFpYZHk5MVV6RUNnd0EzT0hLdzM5?=
 =?utf-8?B?b2JBaE9MRExNcWZsb1NyKzYySHR5ZCtVN283WWVmQytqb0FPa3lNbWJZMmVy?=
 =?utf-8?B?blQ5TjA2QkVKVkJZZGZnZm9LZlJGRkcvUGhua1FyckFWWUN2UXFPRktqcm5U?=
 =?utf-8?B?M1Nhdy9JaGkxT1pvWmczKzQyVm5aNXJyc0c0SkNwRW50UzlFcyswcndNSmFi?=
 =?utf-8?B?QWRzRjk4T2IrK0U4anBkbktaQUk1OWgxWkl1dENtUVBTZE1oMGtMdDhVSXow?=
 =?utf-8?B?QjQ3bWpUaWxjSE9QZko5NG8rVkIyNjdLR2d4NEVHakRXVEpUQ2NXQlJjZGty?=
 =?utf-8?B?RlhKc1J6T2kxZ1VPeFVxZ0hNRXNhSGp3c2FuSGZXdUlqRWJzbkxwZENrMUlK?=
 =?utf-8?B?dW56RWpJK285bXF5VVI2WVkvTXQ0SmUzdlFMd3ZNVURkSlJTbXhkbWNKbnc5?=
 =?utf-8?B?QjBSMS9FVFBSUHpZQnluZFNwNjJXbWh5NFJYZDhsT1pEbG5QNVUxUGRUZkRv?=
 =?utf-8?B?enNrMmxEM0dyT2RpMnFBQU5PQ0ZrMlF4alNuTXMwZXY1eWQ2MS9Ld3h3WUJx?=
 =?utf-8?B?TnRIb21aV1MzZkFyaU43cGlGVWl2OU9oMENOR1pKUWljTFNMaUQyc2RwNkY2?=
 =?utf-8?B?cDBTdmxmd0dZWlpXOU4rbDVUcHpCRTJXU1pLUUNjS2tPb1RiYWNDVmpZN3Rl?=
 =?utf-8?Q?eM1CGzAG11yDly8ajdL/1XFZY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c159d0-c73a-45bf-3bbc-08db52b22389
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 06:28:46.0038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9X215zdK1Op6sk72I51VA1Tt/2InmWXss9g4tpVhjcbC5CI6XGpkingOWYsAs6aq1W9sknZO/WCtNOeKRZAKGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8779

On 12.05.2023 03:02, Marek Marczykowski-Górecki wrote:
> On Wed, May 10, 2023 at 04:19:57PM +0200, Jan Beulich wrote:
>> On 10.05.2023 15:54, Jason Andryuk wrote:
>>> On Mon, May 8, 2023 at 2:33 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 05.05.2023 17:35, Jason Andryuk wrote:
>>>>> On Fri, May 5, 2023 at 3:01 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>> The other issue is that if you select "hwp" as the governor, but HWP
>>>>> hardware support is not available, then hwp_available() needs to reset
>>>>> the governor back to the default.  This feels like a layering
>>>>> violation.
>>>>
>>>> Layering violation - yes. But why would the governor need resetting in
>>>> this case? If HWP was asked for but isn't available, I don't think any
>>>> other cpufreq handling (and hence governor) should be put in place.
>>>> And turning off cpufreq altogether (if necessary in the first place)
>>>> wouldn't, to me, feel as much like a layering violation.
>>>
>>> My goal was for Xen to use HWP if available and fallback to the acpi
>>> cpufreq driver if not.  That to me seems more user-friendly than
>>> disabling cpufreq.
>>>
>>>             if ( hwp_available() )
>>>                 ret = hwp_register_driver();
>>>             else
>>>                 ret = cpufreq_register_driver(&acpi_cpufreq_driver);
>>
>> That's fine as a (future) default, but for now using hwp requires a
>> command line option, and if that option says "hwp" then it ought to
>> be hwp imo.
> 
> As a downstrem distribution, I'd strongly prefer to have an option that
> would enable HWP when present and fallback to other driver otherwise,
> even if that isn't the default upstream. I can't possibly require large
> group of users (either HWP-having or HWP-not-having) to edit the Xen
> cmdline to get power management working well.
> 
> If the meaning for cpufreq=hwp absolutely must include "nothing if HWP
> is not available", then maybe it should be named cpufreq=try-hwp
> instead, or cpufreq=prefer-hwp or something else like this?

Any new sub-option needs to fit the existing ones in its meaning. I
could see e.g. "cpufreq=xen" alone to effect what you want (once hwp
becomes available for use by default). But (for now at least) I
continue to think that a request for "hwp" ought to mean HWP.

Jan

