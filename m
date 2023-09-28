Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFEF7B1850
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 12:35:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609473.948575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qloMn-0008Nn-Up; Thu, 28 Sep 2023 10:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609473.948575; Thu, 28 Sep 2023 10:35:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qloMn-0008Kx-S7; Thu, 28 Sep 2023 10:35:33 +0000
Received: by outflank-mailman (input) for mailman id 609473;
 Thu, 28 Sep 2023 10:35:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ur7q=FM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qloMm-0008Kr-EH
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 10:35:32 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060f.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be6c7906-5dea-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 12:35:30 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8605.eurprd04.prod.outlook.com (2603:10a6:102:218::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 10:35:26 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a%6]) with mapi id 15.20.6838.016; Thu, 28 Sep 2023
 10:35:26 +0000
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
X-Inumbo-ID: be6c7906-5dea-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0IXcu1+5/GDkmAiY86YLuhYs/0fC6FreuPdhZj8a0GKdnKBq0lMKunV8h4C5lqTZJWi0P3rTcrvALXz7z9eJmgICON0l6V4fRyNGxPOiaYMvlvC3a0WUWhFUQcSrMNWMkG9csXIoGF3yeyATzXNiG+nxDoPqrJuLwbDNDRGCAXEHII1um/7ixaebq69WAjsJa2lwjB5GqETWMAsqO5uwog+uYMVQetui9qDU5nDOUjeVBzPcybdOe+8MWhX+/cNVziHvYzB0AuHOkjsO9JDVZ6yuhzJgPgMBMH/gnRIrG9NiYzxIselMAhwPoxJBPLI122W81zYgGqLJjQMkgG0wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YT9W8O8m7Nv7Wwb3IuBS8EovbbqgaRxMuwFkXh7YO0=;
 b=a2zTp/YuwKobsi6SObWUC7hqNpow/SByny0xnFJMDf1gfH4sxf7GHWfL/5Mrl55VTUFQSDz0B3w/Wk2VnwhsoFFsriG+IukT7egynljSnxw8E49AiJJqjLcbIMZM3t1pHAxHXSC4AFa+ZG4flT7NnIZsM4FylgJrY7Suvajqn0r33yXOcVLIXhtxhrJ0gGavZBfCGr6Il0DHedB2mdFt/C/8dmhJobTQmw1lqzwC+YFXMqw3KujVJgEN3DbNhwifC0WZEeAUD1dj+6C8DW68xBNlkV1ojwwSn03pBFAD3JGbGnbUm+9qX0xKS4GvoQC2OBc4NOkDtTREo1PO8D08Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YT9W8O8m7Nv7Wwb3IuBS8EovbbqgaRxMuwFkXh7YO0=;
 b=Ou2w/w29SL8cK2SAgKt0gwQQjpMz7pNd9nPNMwrUD9zyN8xquUs5xojg99tFRBT1BSdqFHLZSXjKm01bwTC5ZFQyfEuzPZ720xAQX5Tc/qrC4TgHYc+UigUqRIdneXoXkpCum8kqjg/pgc23zTSmucucYtiG2vy114IWis3I4DZyVGdNqLlo4EDcHEEScKNXCAfNdQpYYSmTJvkrSp2qQJTgOFlmnFMGJKNBedh6OWrcElUDesIdITrX5A0wCmwSpH07bNluM1w0qHTp8js4fTr6GoG7e1YUNVYI/WIL21DIt0dLKOBJwY1B1CAesf3I0aBAe3eIKhwY/c/tG3o7og==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cc175a33-0e04-4731-3bc2-ed15eb62525e@suse.com>
Date: Thu, 28 Sep 2023 12:35:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 8/8] common: convert vCPU info area registration
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
 <ada41793-629b-3864-c2fc-412bd8d0047d@suse.com>
 <ZRU4QQcFL5Le5cFz@MacBookPdeRoger>
 <c82494b6-d6c9-8252-4eac-5c50fdf7e477@suse.com>
 <ZRVSOi-nPTagCWq9@MacBookPdeRoger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZRVSOi-nPTagCWq9@MacBookPdeRoger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0223.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8605:EE_
X-MS-Office365-Filtering-Correlation-Id: 55bce2fb-fdb0-4a57-1161-08dbc00ea0e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9K0DlG7FMBk+1dxGInTa4TDO1ljeJMOKN1X2fHRQbrV1HoNRgd1uabDYZq5v/F6RcmXb2qcA1RMz/rV/DpcIEjZKoAoT2xTK56f5zJJY5TGUaWTmj0WUUub23KgtdNI9WU2C2s9yyd3rnUafvlqSTvioBw24xaDAqqr/p/VjlrVSRGe2oJoAYL83wfNCJpkuR/I0Dq+3aDlXjxnlXjNIhSmfUhQaQUDmdwTHuCZeVXEqzsgb8yQ4VVHHE2kNJNGJCH+TC9M31FsISy2L10nNL18nIVXMFGvw6AvtVPgHdqz8LXYdWwJ/Kp51QxZ3JqQ0M8YYdQXNQBg6fhEUfcRDBhRtHVce+jEkTG5rCh1N7nAKlmKygRSU2Dy4R9W5nfq9VSyCkXN6f4e8nujqe0DY6qhWt3lYvOP3G8lWqxgOzPYI3Ts1awZ3l4b3LfqcfikYyrvTrbME1PjxCNggo1rfFDHW7mwKVBNbR+/T6KE8wkg7dpbFyjSdCD8dCZKyonvE6DWiXZH7cY3X11s788N376g7eogOoJG8s+z1hdttuJF1vrSwUNhF60IUO+d5JmBJmqRDvtklF6YSrHUB781WClrRANOGt5Kk1DDZo7GC9kz0Ni3kV0a/o+rmSQ9qgDQzCZVJgkzvf7jMlVYmbBjnog==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(39860400002)(136003)(396003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(316002)(41300700001)(26005)(2906002)(8676002)(66556008)(478600001)(54906003)(5660300002)(66476007)(6916009)(66946007)(4326008)(31686004)(8936002)(6486002)(6666004)(6506007)(6512007)(53546011)(2616005)(36756003)(83380400001)(86362001)(31696002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXJ6dE1XMEJwNXZrVkRNQ003eER3ZjJ0UGtWWjR4M0pIWkwzZ29ENnQ0cTZL?=
 =?utf-8?B?UWNacG1MWVNBMFlhWDhuenRKTWUzZFh0VlRCL0JMK2J2eHkwdCtoc2k1NnZR?=
 =?utf-8?B?MiswcnFXTmErNmpXbThOaitNSHdoMmVDMzVqTTB1ZmZXUFZsSk1DTExNSjVp?=
 =?utf-8?B?MERGWGNhU1pmQS8wYmZSMDY4RVlpeHlmQTlCbFE5dFh2S2E4cHdvU3BYUElk?=
 =?utf-8?B?YkZIaEhJOVJnWi85cUtqWWhkWlp3aGdOZDFyQTZDTWpsM0ZYWXZyZmhzd0R6?=
 =?utf-8?B?UUxhZE1lR09wWFVCSkFmRUxsakR4Zlh0VWF6dEl6TUFHaU5IRVlqVXJtLzNr?=
 =?utf-8?B?b2UremRSbGJNaHpwaEdDeG80b0h3OS92MWpqaFJwOWtnbU5GeWZ6MTkvcXlB?=
 =?utf-8?B?dXJJMFY2Q1VjK2RqdUp5Q2FjU1hCTVNpZWdiOThieDhyUC84OTBBWmt3bnRD?=
 =?utf-8?B?bmJVbDlrRzhjTGgraWY0NnZtemJuamhjOUVsRGNTdGYyVW8xQ292WEdjZ2hZ?=
 =?utf-8?B?OHhDTjhqNFdyWXZSRzJTQ1QyY1FLQ21xaWsxVnNRTE1CSWFPdjVLU1c4TjRs?=
 =?utf-8?B?RzZJQ2RWaStaSnNuYnAwT2Q5VmM2V0FHOE5ZYWlUUldjLytuU1RjdXZWSW9h?=
 =?utf-8?B?djJGeDF2NUZHV0tGUnI4NWhpQmE0Y2RVckFyS1I4UU1zSndLTHVtdm9URHpl?=
 =?utf-8?B?bk02QjlyRzR5c2NiMEJGNHZRaldBTUhJTkhBSjRkWTZ3bHkvTWxHYWtTeE5N?=
 =?utf-8?B?Q3J6ZFdyeUFlWS9EQUxTdU1LU2VIaldyTk9ZSXFYTHV3U0lyWndmelAwbzZo?=
 =?utf-8?B?OTA2aDB0aHc2Mlhqb3FZS2s5YWRGMUVMRFQwWkR6NnlZZ3h6QVdDakVybjlt?=
 =?utf-8?B?UVJUOGVDWXdiODhqai8zdnRQWDdZaTdFaDFqSk85cGc2RTRrOW5CSFQxYkFz?=
 =?utf-8?B?VFM2SHJHOUZmUlB0QkpXMnd1RCt6TjQwaXJzZ2NpK3RGMjBQTEp4VkQ1aXNt?=
 =?utf-8?B?cjZEV0NpV1ZKWitmNkllb1pZLzY4eCt4cG5KZnFGc2xTMGZPU3o2WFJTOHZC?=
 =?utf-8?B?RG1ibnZsV0I2UldqSXFmd3U3eHBHOXZGQXVxZDI5K1BLMytBbnJuVndRNm81?=
 =?utf-8?B?WmRSb2ZodUsxb2o2MTlleStRUlB6U1d2bW5hK3ZkY1JRUWxSZGFabHlFTmth?=
 =?utf-8?B?T25CcGVHQkExeE1EWm1NbXZJMzlSOFRTampZdWxkR3l3cUM3WTQxcTI3NzNU?=
 =?utf-8?B?dmpQdkE2N1FqbDQxOEl6WGxGTHp6L29qZEV6M1R4VHZzbnAxeUhNZ0xqYUsr?=
 =?utf-8?B?NHQwMGZlNUM2RkxGVGxoWXVOYTJpcVFaT2lOTzJxMTJwSFJlUkdLRXBJbi9a?=
 =?utf-8?B?Wnp3T1l1dS9DRWpIMTNOQVVqUTBmSTgwUGJtZGRLZThuV3BsZjVFZGkxYnh6?=
 =?utf-8?B?ZDY4cm1GN084T3ZuRzg4UzBReGZXSlVtV3BhSzdaR0Z4alJWZHlPUUFXSFBM?=
 =?utf-8?B?bXU5Vk5tTFhJM1hDK0ZvSEZzK1UyM3hoRXE1VXJIN000TkFHdGZENEl5NEov?=
 =?utf-8?B?bmpjRXpweVV1TVhseml1Q0hycU9VVWIrWnhIVkp6RlRsbjJ2YUdscEgwRmQ1?=
 =?utf-8?B?SVRMVkZUcUtvVFl1STdFMEx2ajFGTHBmZVBoQ1JLRnZQeW5OWUJvQUcyMStK?=
 =?utf-8?B?Nm00YUtRLzRHQmZyNGtGTHd5Z3NiY2JIS3g4eEZBUFhHd2ZYby9OUVN1d3dt?=
 =?utf-8?B?OHY4TFE0NHliQjl6dC90NWVLZEw0NHplWlJKQkoyUFQvelBUZW55RVVpTFhV?=
 =?utf-8?B?L1VrazVnRFJkYzFaVm4xVklYTzYzTENid0xwTkJSVDhlTzZTdDI2VVRVRnk1?=
 =?utf-8?B?ZUFQVkUzQnFMaTBqTmZyYmN4ZHVQcmJzUW55MkhqVDF4YW9EbWwwMXB6eENZ?=
 =?utf-8?B?aTJZbHVMekxBM1YvWERyRHFKSHZFZFpTbnBPNTRLL3dub2V0cmE4Nk8xUFFv?=
 =?utf-8?B?VWhtcU5INFVBRTJwaitmYithRDhHVStPdmc0M2xCWVU3T2tiaWZ3ZGcwajE3?=
 =?utf-8?B?QUJrbUNBWFJnSFpmUXA2bVp4SzBmNnJlbENicHdXRWl2TWluQndtMmo5NWRY?=
 =?utf-8?Q?ty/pSU8MLrqUVXX3BO1w8Z0IJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55bce2fb-fdb0-4a57-1161-08dbc00ea0e7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 10:35:26.5731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V4JLgI+pgWWHN23Tjb3RkyOt544OtLpbX9LOmOcpm+kK4HmKP9FjlyYhzefCwCeBIxIv6Xp6uQ4pWx9io4OCNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8605

On 28.09.2023 12:15, Roger Pau Monné wrote:
> On Thu, Sep 28, 2023 at 11:53:36AM +0200, Jan Beulich wrote:
>> On 28.09.2023 10:24, Roger Pau Monné wrote:
>>> On Wed, May 03, 2023 at 05:58:30PM +0200, Jan Beulich wrote:
>>>> @@ -1633,14 +1528,44 @@ int map_guest_area(struct vcpu *v, paddr
>>>>  
>>>>      domain_lock(d);
>>>>  
>>>> -    if ( map )
>>>> -        populate(map, v);
>>>> +    /* No re-registration of the vCPU info area. */
>>>> +    if ( area != &v->vcpu_info_area || !area->pg )
>>>
>>> It would be nice if this check could be done earlier, as to avoid
>>> having to fetch and map the page just to discard it.  That would
>>> however require taking the domain lock earlier.
>>
>> In order to kind of balance the conflicting goals, there is an unlocked
>> early check in the caller. See also the related RFC remark; I might
>> interpret your remark as "yes, keep the early check".
> 
> Oh, yes, do keep the check.
> 
>>>> +    {
>>>> +        if ( map )
>>>> +            populate(map, v);
>>>>  
>>>> -    SWAP(area->pg, pg);
>>>> -    SWAP(area->map, map);
>>>> +        SWAP(area->pg, pg);
>>>> +        SWAP(area->map, map);
>>>> +    }
>>>> +    else
>>>> +        rc = -EBUSY;
>>>>  
>>>>      domain_unlock(d);
>>>>  
>>>> +    /* Set pending flags /after/ new vcpu_info pointer was set. */
>>>> +    if ( area == &v->vcpu_info_area && !rc )
>>>> +    {
>>>> +        /*
>>>> +         * Mark everything as being pending just to make sure nothing gets
>>>> +         * lost.  The domain will get a spurious event, but it can cope.
>>>> +         */
>>>> +#ifdef CONFIG_COMPAT
>>>> +        if ( !has_32bit_shinfo(d) )
>>>> +        {
>>>> +            vcpu_info_t *info = area->map;
>>>> +
>>>> +            /* For VCPUOP_register_vcpu_info handling in common_vcpu_op(). */
>>>> +            BUILD_BUG_ON(sizeof(*info) != sizeof(info->compat));
>>>> +            write_atomic(&info->native.evtchn_pending_sel, ~0);
>>>> +        }
>>>> +        else
>>>> +#endif
>>>> +            write_atomic(&vcpu_info(v, evtchn_pending_sel), ~0);
>>>
>>> Can't the setting of evtchn_pending_sel be done in
>>> vcpu_info_populate()?
>>
>> No, see the comment ahead of the outer if(). populate() needs calling
>> ahead of updating the pointer.
> 
> I'm afraid I don't obviously see why evtchn_pending_sel can't be set
> before v->vcpu_info is updated.  It will end up being ~0 anyway,
> regardless of the order of operations, and we do force an event
> channel injection.  There's something I'm clearly missing.

Considering the target vCPU is paused (or is current), doing so may be
possible (albeit I fear I'm overlooking something). But re-ordering of
operations shouldn't be done as a side effect of this change; if the
original ordering constraints were too strict, then imo relaxing should
either be a separate earlier change, or a separate follow-on one.

Jan

