Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCA063C1A3
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 15:03:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449389.706074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p01CA-0005jW-TP; Tue, 29 Nov 2022 14:02:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449389.706074; Tue, 29 Nov 2022 14:02:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p01CA-0005gp-Pn; Tue, 29 Nov 2022 14:02:46 +0000
Received: by outflank-mailman (input) for mailman id 449389;
 Tue, 29 Nov 2022 14:02:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EGMg=35=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p01C9-0005gj-NR
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 14:02:45 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7eeea099-6fee-11ed-91b6-6bf2151ebd3b;
 Tue, 29 Nov 2022 15:02:44 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7225.eurprd04.prod.outlook.com (2603:10a6:102:83::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.22; Tue, 29 Nov
 2022 14:02:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 14:02:42 +0000
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
X-Inumbo-ID: 7eeea099-6fee-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oI80ImFgkzBlxGmhYwB21GpfUp3QIDEMHMQbPyUwytxw1IJMea6PnFBAinEOYO3nTCAA6JUXiUxKxz2eC5uE/h25mpJH4Ox8Nw63RTAUEPzPuuwCThYUJtkk4eDGra3gcncho47gJPWHmw+G0bAXBERzSA9eWTFd9TtJoXxCRtWFn8tzH4Vrrtb2SUYklBzGMX44teg2kRyN0YUiy1cAujNvvqiVqyVU2R1t/Z4/o3pmwbgI4JfyXC4FjP+zjAD5KuS35wSjkUomVTUUww1y5E0BYDE1iUwx/l8ejexs5gbCLUvYjFjdrpIWPJywhR5kKPhAsMAiMfgRwSimR/OY8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1JBDnqPUsTvbGHcqnR6za63c3nkQNslXxmMYUdoqv6c=;
 b=dLfF7PlVTo9XASWMKdOxywfDi5AQ7YiOfaEPSUQfmDFhCs+MImE9mkmylO5Yat/qBq3zVRZkMcY6VgP4eI4Gpgr1aZVWuFVMIEe/DCMryo/zRQy2dfKSF2ayzLuv8+cSFKfNx5wQKD11We0UxEnaixN+oO1pLSYFSof8ftMMHW7v0FA3AnUYWUUmNnwO5Wbe7MA2fjyOhPMDJAntNILZqRvgQP/mZoW6yyL/CU4n8lsoDHJkoDKl/2h0i/OMUUt10u4vbRtR8Xj00p/jQitpAfk2w119rp+MSFW7k8zyZDWg0EebErVBGByqjckwDa1N2QSq0ghHU6xJBFdfUfscDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JBDnqPUsTvbGHcqnR6za63c3nkQNslXxmMYUdoqv6c=;
 b=46pXnte26TPdokThZUtAOcfa1MQOtnkRft+UN12LQlKttrCe2UjLULsYsJE5FW5F8VlgWMWB4Oc2i/s2rQj814xI1PX8JGbBDBOrcH/C/BrXq+loM/xv+EE+g+IdMK9KrBUSb0ThfKrv42DLuGnMef1983rY/eXkmJxHnJxOpX9W1tODSJUWQNol83KWw6OMzzg10Vy5p7ZfRWcU5mHEirzcjcssf9gNbPfXbk8Fi5Ew/IE1WcOSIcEiWTIfjAH9WS2OccAIX71apq7YKEsQXT6e5L5XHGsNQ1eA/R5BH+Xp4pkeGoX6G4/i0zyiRsmWZP0yBnkQIVobSB6KhgSZHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d8ba56a3-3b3f-788c-620e-823d4e2e38ea@suse.com>
Date: Tue, 29 Nov 2022 15:02:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH RFC 07/10] domain: map/unmap GADDR based shared guest
 areas
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
 <5a571fd9-b0c2-216e-a444-102397a22ca0@suse.com>
 <f1229a27-f92c-a0dc-928e-1d78b928fdd0@xen.org>
 <c8f79867-42b3-a23f-6fe0-de8b698c6b0c@suse.com>
 <ceb28c2f-d4c6-3190-ea84-d6f7c9acb4ad@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ceb28c2f-d4c6-3190-ea84-d6f7c9acb4ad@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7225:EE_
X-MS-Office365-Filtering-Correlation-Id: c1191dd2-a366-4d42-a969-08dad212620f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QGxoXp+s1LfW6rmtDGsb66sUhj9UbK+gZBGWeVcO2bIFuMBGgFXGcXxVX19yKbvLGHrGAdX/2cGwcu07xMNZi+S0D/1ft6zdDXiIxibb9xJIZr/QUSb2kl4G/2U16Hl+LvdW/r1lxCZN+/DTLbHNj2f+6TIEpg0UJqm0KcN6otriM/g5z3gNHnw+K9wwJVkVEdkIgekYof2L07YX81aM8NgFbZ0H73Ut0Cq8yk+DaiCGsK7+js8dEzgxWLyEPyQDBz/Dg9t/o3sVBfiFmQCrWiRm/tKJHTLlivNuJy6Y6XNPJjcA/UFbGJVU6kBkxwxQ2H5GQlc7GBXMGGgSdq/6pfUvRSwVE+1cvZxbKvEFxyjmikCFUHmMYFr/RuebrbuNLasnv2yN2uMgds0jzBVAlaXLUX0VmjJEVZU770RAM5iymzBep3X/ZSpK/XQua1XRNl9h06ooB4+vAKH4e35UfVpVfff/C8bueseauUV25cm5l0wIvUxKZFY95rZ9ngp3YgrB+ty+AjXIB4rRqjKJfuhb7KMk3VxvnOLAx15UFdAmVjMFsXiJ1P+a7xaz+ZkJQG1tqYdiV2ttFI+WaHoaBmpCCf3Wkp3gtCueQadtwC/elnwlFfNMRGQfKSUjE9WObu6AOCL9M9hEZnCv9rsd7YbG4/qcNokg2cLvmJhv9c0KBmN92n+Uv1Vy0YnM0iG/yY8S+Q7eDoyCUTXEpdw5zxiscgcdezFXdwoIntANEq0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(136003)(39860400002)(376002)(396003)(451199015)(186003)(6506007)(86362001)(54906003)(26005)(41300700001)(53546011)(66556008)(4326008)(66946007)(8936002)(31696002)(6486002)(478600001)(8676002)(2616005)(31686004)(6916009)(316002)(38100700002)(5660300002)(6512007)(2906002)(83380400001)(66476007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUtyNjFQRS9mVE9aT1RKb0syUmlrQm1nRnpBbnZndXRRYXlScmdZaHl6UlFw?=
 =?utf-8?B?R1RSRTBRS21yMVhaUWxOOE0rbmRMVHpNYlZXZUk3cGpFczZmWjJHQlc2d1Nq?=
 =?utf-8?B?L3lEellNQXBxeFJ1L3hBUis1ZUpFbnhPRGI4NjBZRmY0RnhPMW55V2xVMTZW?=
 =?utf-8?B?Szh1d1J0MHdDUlovbTRoYUJNRTMvRmlSQWpYdHZOVW0rcVRPUDNHVmQ1WmNp?=
 =?utf-8?B?RklXOXJFWW9SNC9tQVdDWUVCZjZtbm04NkQ4OW9BRGF0Z1lHL2ZIQkU0QU11?=
 =?utf-8?B?cmllTUc4RHhheFpoMENBUldYSjRVczdFaFoxeHV5T0JFR3dOZ0FDZWpDS0tj?=
 =?utf-8?B?UEs2TGEyWlZ2TC9SNmRSRXFuZnBUc3hLVXZwc2xUWkNIelBuRUt2UUcxai9t?=
 =?utf-8?B?SDJGd0NJVGdCR0dPT1VZSzJnZ1I1OGhvY29Uc3dmOXN5V21EbDVRS1EzaXh0?=
 =?utf-8?B?VDBBc1d6cEhRNjAyUmxOajlhUHJ1WXlHWTB4SVJHc0hvRGZMY2d4WEh6bVZE?=
 =?utf-8?B?c3pIZVh0cEFkKzMrWCszR0NmOG1PUXhRUDk0azBRdSs1QjFhYmZtcUdkT29V?=
 =?utf-8?B?Q3dmWnN6Rm8rN3d4YkNSYmpycHQ0QzJNdldwOCtwTzA2ZVEvMk9GSVZBSnY0?=
 =?utf-8?B?cnlESHpuWGx2aGhoYmNhRVBFbnB4ejY1RitlNk9LV25oTTRQcTB4RmRjOE9C?=
 =?utf-8?B?dTBCdVhNRXVqU0djeGZFOXAvdHFkQmQ1K2VpMlBaZUhQUHhTeStWR3lMRmZK?=
 =?utf-8?B?Y2xaSVRJb1ZybWJmbDJDYjIrSFlhRmh6aGRSeHBYRzVLblhTeW1ucTNJa09Q?=
 =?utf-8?B?eWd3bjFiN3FuQWpabm1kQzgrWWkzWUtMcndKUi9NR3kraCtGVzVOZzNnYmEv?=
 =?utf-8?B?SllNWmQ1dFI4bGdSSzh3UUFOcG45T3dvWjJzcWcwZWtTckE5Wnp1ZDZ2eEJ0?=
 =?utf-8?B?MThSL1FSTzdlSmN3dm8vMGlGZUZUcjdjTVpoWERicXpJQ0RSRzZjWWd6Vmow?=
 =?utf-8?B?OEpOUUdvTlZzNCs3MXRqZ2VJQ3dNYTRwSDlCWFV5L3lSRFpwSXoyZ0JQLzM1?=
 =?utf-8?B?UG9BbHU2aU1UczZZYitYNVZwU2RmOUhKNDY0L3B1NzZ4ZUVISkRIV2hoaG0x?=
 =?utf-8?B?L2w5VHQzR0xTaHBBVzF1UG5oM1I4OXBVbCsxczdVNGhZb3ZaTmNPdExzRVI0?=
 =?utf-8?B?Um9Qcm5NYzJYWnR3TE9GcHk1UTZ6bW9jWnpRSmJ6Y0tFS25QalNSQ2l0dzFO?=
 =?utf-8?B?MDNOcnB6YlkrbEgybnFmcU05dzY5OGVheEs4VmgySE5ibS9penRXaUVTTzAz?=
 =?utf-8?B?ZGVZSXBGak52a24wc29nUG5xMU5YRGNURHpudmxOeWNnWmZkaDFxbE9qc2Fj?=
 =?utf-8?B?eEtCUDlSazZvcmlCZ0JrWUpucFJ5TndVUHpZTzV6SkNRT3ZkWi9TeEpMakQv?=
 =?utf-8?B?SzJCTzZpTXU5NzVENWI5OGUxSDVHZTROM0NhNmJMNCt1NW1WbUIzc1NiWVZ3?=
 =?utf-8?B?QWhhMjVhUGxlUGRqWlJWZ1kweC9oRk91WTVTZndoK2FhMjNGRFNTc1FCNENT?=
 =?utf-8?B?Q0sweWJ1dGlJcEorbjkzMGdqYXpaWjZqVTJpME5STVh0cUorYlVlMlR0UVg4?=
 =?utf-8?B?NVh2OXBNNEZrRVVZTG8xUU01K3BLaE9IMHdZT0tPZU1qZmcwc284aFlqbmVh?=
 =?utf-8?B?Y2NJamVPOFBtVGt0UW9icGJXWHBOOGw5QVdqOWRaT3QwTk5MSCtqWTBJWVhI?=
 =?utf-8?B?bkpRTzA3NitZSEE3SEtFelptU1FCdEJYNVlPcGRBdnQxeWxjQzVlQUFRTlVl?=
 =?utf-8?B?eVh4WXR0SmhEd3JpemNKRGM4VW5vQUE0bE9seG9mdEVtMGZSa29mSlZMOUsz?=
 =?utf-8?B?UWRuRWp4SE9PZEdGKytNaW9VSHdJdDliRU56Skh5Z2YyUVV3VDh5V2JZYjE5?=
 =?utf-8?B?UkQ0UUM0WXdiTldEbXpJdDBudE9lektYMVF6R29GbTg4VUJVSHJiOG8vcTd4?=
 =?utf-8?B?T1JOVHFXY2w0SDVyN0xVM2VROHlnUGxVVG9BYXlJb245aTl1eVNocE9TU250?=
 =?utf-8?B?dC81d0grT1lGQk1mWnk3b1BwWWVCcjV4Y2lnWURDUmlYY2ZhRitUclNWN1Ew?=
 =?utf-8?Q?Y4zh5YOjdilxYN6t0znDoUc1I?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1191dd2-a366-4d42-a969-08dad212620f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 14:02:42.4815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tu1zYhyScgTs4hGeKKEiNZ88rcZ7yyyUE0ZLYizoSX38nj41wlrrANPvipqXsx9Re92T6B+jfV5YXTNZ7IHjRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7225

On 29.11.2022 09:40, Julien Grall wrote:
> On 28/11/2022 10:01, Jan Beulich wrote:
>> On 24.11.2022 22:29, Julien Grall wrote:
>>> On 19/10/2022 09:43, Jan Beulich wrote:
>>>> --- a/xen/common/domain.c
>>>> +++ b/xen/common/domain.c
>>>> @@ -1563,7 +1563,82 @@ int map_guest_area(struct vcpu *v, paddr
>>>>                       struct guest_area *area,
>>>>                       void (*populate)(void *dst, struct vcpu *v))
>>>>    {
>>>> -    return -EOPNOTSUPP;
>>>> +    struct domain *currd = v->domain;
>>>> +    void *map = NULL;
>>>> +    struct page_info *pg = NULL;
>>>> +    int rc = 0;
>>>> +
>>>> +    if ( gaddr )
>>>
>>> 0 is technically a valid (guest) physical address on Arm.
>>
>> I guess it is everywhere; it certainly also is on x86. While perhaps a
>> little unfortunate in ordering, the public header changes coming only
>> in the following patches was the best way I could think of to split
>> this work into reasonable size pieces. There the special meaning of 0
>> is clearly documented. And I don't really see it as a meaningful
>> limitation to not allow guests to register such areas at address zero.
> I would expect an OS to allocate the region using the generic physical 
> allocator. This allocator may decide that '0' is a valid address and 
> return it.
> 
> So I think your approach could potentially complicate the OS 
> implementation. I think it would be better to use an all Fs value as 
> this cannot be valid for this hypercall (we require at least 4-byte 
> alignment).

Valid point, yet my avoiding of an all-Fs value was specifically with
compat callers in mind - the values would be different for these and
native ones, which would make the check more clumsy (otherwise it
could simply be "if ( ~gaddr )").

>>>> @@ -1573,6 +1648,22 @@ int map_guest_area(struct vcpu *v, paddr
>>>>     */
>>>>    void unmap_guest_area(struct vcpu *v, struct guest_area *area)
>>>>    {
>>>> +    struct domain *d = v->domain;
>>>> +    void *map;
>>>> +    struct page_info *pg;
>>>
>>> AFAIU, the assumption is the vCPU should be paused here.
>>
>> Yes, as the comment ahead of the function (introduced by an earlier
>> patch) says.
> 
> Ah, I missed that. Thanks!
> 
>>
>>> Should we add an ASSERT()?
>>
>> I was going from unmap_vcpu_info(), which had the same requirement,
>> while also only recording it by way of a comment. I certainly could
>> add an ASSERT(), but besides this being questionable as to the rules
>> set forth in ./CODING_STYLE I also view assertions of "paused" state
>> as being of limited use - the entity in question may become unpaused
>> on the clock cycle after the check was done. 
> 
> That's correct. However, that race you mention is unlikely to happen 
> *every* time. So there are a very high chance the ASSERT() will hit if 
> miscalled.
> 
>> (But yes, such are no
>> different from e.g. the fair number of spin_is_locked() checks we
>> have scattered around, which don't really provide guarantees either.)
> And that's fine to not provide the full guarantee. You are still 
> probably going to catch 95% (if not more) of the callers that forgot to 
> call it with the spin lock held.
> 
> At least for me, those ASSERTs() were super helpful during development 
> in more than a few cases.

Okay, I'll add one then, but in the earlier patch, matching the comment
that's introduced there.

Jan

