Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FEA7B17E1
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 11:53:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609421.948514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlniL-0005Ym-3P; Thu, 28 Sep 2023 09:53:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609421.948514; Thu, 28 Sep 2023 09:53:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlniL-0005W2-0h; Thu, 28 Sep 2023 09:53:45 +0000
Received: by outflank-mailman (input) for mailman id 609421;
 Thu, 28 Sep 2023 09:53:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ur7q=FM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qlniJ-0005Rv-1l
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 09:53:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e753f609-5de4-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 11:53:41 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB8015.eurprd04.prod.outlook.com (2603:10a6:102:c6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 09:53:39 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a%6]) with mapi id 15.20.6838.016; Thu, 28 Sep 2023
 09:53:39 +0000
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
X-Inumbo-ID: e753f609-5de4-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MKavI3ewF4WLevuJEm8ZB+Z2/Z/KRfbDjfy9C40v40NEb2XLYJdwKB/T4Ljx0rNCYVE/VMFtNkonafURFJoBxcEEsBF6/Iymh5bh1XpTptWfEnj4jnPX8qEkvmV0MqqBTRjUNHye8r3wPCn2ZaTtF35uQArDUqribr02Q2Q6QRQXRAmh2k+CrJKlmtNQ0rb3EI1ygEio3PASSuMcTmz+TJlW4xIOLvSvtIAt3dONR6KqSP74+Mn89GG4XxifBiF1pHWZFhuITtFOK4j7snNv2bzx+NaO4wOBR2e554c4PQ3D82CrRRpsv5Yne+pO61hIVCWaP/qYo/dOhVQi2Fju3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWHiHjI85xQV1NOYpVZbE1Zb9wgZbEFDfLsTzhJ3dCo=;
 b=Jy0utQeW38SE1Ay8cx3Av/BHSvTGzGKjZ+YC5h11tIc3Oi4vO88q3t8evBRO+uo5AOvp/0JuBH+yW8GzIXr24Q2fJxDPus4MCImXljeqhFOszfBD6JRpaEUePrlFT6GiJJCFItdvelujF56ce5dXmHA/ZKzwacpcH65HWvhJ7nnZF4l+mvPMoTjaTKtmTWKF1yFGUidckkBnwPw8Vf7aPm96BZgqw/KU+f+E6OQRaXy1KmnfwKjTFkatTminm2E1scIHKCbA7bvszBjwVl5HjbnuGKEEPvD/RJWKAUs/Lo1wc9blyaGZvha6hsg5MVsaUcyZniurFN/7yWAbDJC6Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWHiHjI85xQV1NOYpVZbE1Zb9wgZbEFDfLsTzhJ3dCo=;
 b=5iVUiEKXkTNvf3kauBa7QxKWYFd0yLvN+lACJWW3skM3lo3onTiuDHegV4fQZHwtueWCLPcfVRRUxVL3M5st5z0npRFL+WvkcqjjSlAxqqOizWkHLZCsSf0xGtTjcWQ47mYrdKreVwLRFmOwDllmO0i1SWEPjidKwHIFhfuuE30boUI01eVvJW8hOWu+G7ll1bauW7icFx3Yzzz8q6kkjBEa19kHQMeaqd7sCXrgL3NLnov9NvVhtX7kLLJaMd3UAmiO90TU45Ov8Lmg6tNCtdOtrOlv/4m6safnEa42kIYRYw4rvufQslWwepj9TTyymOMs/K6qg0IIkaLeZaZdaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c82494b6-d6c9-8252-4eac-5c50fdf7e477@suse.com>
Date: Thu, 28 Sep 2023 11:53:36 +0200
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZRU4QQcFL5Le5cFz@MacBookPdeRoger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB8015:EE_
X-MS-Office365-Filtering-Correlation-Id: fd5139d8-80a4-48c7-ba24-08dbc008ca61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LGdXcXeJhbQLsltonEuiib8c6h+y3yCpIs/mudQa6lvkTVgKc60y1UG3xT6FyAM0jvAY+BlMg+QJ/d9bigsvpLVTPN1un7kF/AfwtaSNEUL3oDcJKydGOeFzJBHazp6UnCW7MW3MqkfyYJDua/bJTsDQoTW/r9aeLl22O3WE3iTkouGTIfV/xiwVTNIPv0Top/8Ztb3fiN2og9uXQnjn4oVrB9sKEU2df/MUROyrfkRILvHbBd4Vsrn15tDUH/qIIDfPhGqYiM6c0PWs6hpIj7bPG4ZhSfSYDX2W59X82Yws6dcKQII2H03a5Qk+sfmIv0nDghb8MdxgN5D2htEP176MTOK34cmVt+PsY5KgZDQEqWONKIf0r3fq9/RS8Dz82JnCbyPbLFjYZ7esypAk4mINuq7ITjMVllIeLVT0uVJq2dPin3btWK7jJW7NAZ/o//42lrhPGTk9Z4GYm7KQN0BDXwyY5bO57K3s8HWbJ3B+4E/0rWbpCs0BLsei0HzBxHr8jjtUaFGtuXqcYmmj25sYe82LZhU8qJhlgdYT08Tammx/COx/npAvUTU74skRnlrbi52o/yDJMFeKLtveXAZGZc2aqu70CCBqZEji1j88uj0zcBAelxYTyAcfOZg48gdafjEp+Kzl+yhS9wdvwQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(376002)(39860400002)(366004)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(316002)(41300700001)(26005)(2906002)(5660300002)(8676002)(66556008)(8936002)(66946007)(66476007)(6916009)(54906003)(4326008)(478600001)(31686004)(6486002)(6666004)(53546011)(6506007)(6512007)(2616005)(36756003)(83380400001)(31696002)(38100700002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cElUeUk1S0lhMDg3bWZoajRmejdrTkhFYnNWcDN0UUFzVTJMdDYxemFUVDQv?=
 =?utf-8?B?azVlSkV6Qk5ZMkhSdWkzaHdycWdoM29NODBlSDhGcGZhSWppbm53WlpQenFX?=
 =?utf-8?B?azJuN1AwZlUxTlNhUjRscTJlQ0J3RnhPd2o1dlB0bHBoUUN1NlZuK1BneFU0?=
 =?utf-8?B?MGFKK2tybzl5ZDN3N3UwVC80WXdvSUQwTzNxVkxvZHFXNFQ0ZUlza0p0NFM5?=
 =?utf-8?B?ais2bkdsTWtqWlF4RFdxdXFEKzdObXRtdG9qK1RxYVZ3RE1XM3JDdVJ0eWZS?=
 =?utf-8?B?ZnN3M1YwOUZIelg3MERmUFczdU0yd2VxUFNXNkVzVnFPMHI3Z1BVK1VWQTk3?=
 =?utf-8?B?eWJTb0xDc2lJWHpReEtYT00yTmFGM013bHZUSmRydUt3K3dIV2pTWVRDZTZL?=
 =?utf-8?B?ellXbUoxc1NnblZ1VUdBMUVzNmMrcWsvR25TRFZTbElYVzdnekxoL2FvMEFV?=
 =?utf-8?B?ZlJCVXU0VFM4VzFIcXluUm1ZblZrakhVVElTMUM3ZlNYQTNDbnoyYnBSZnkw?=
 =?utf-8?B?dzJ4bkF5ZWdHTXhqNXluRENxOVRIa2dyS29jTGQza1Yyai92OXRQRFJUZmxQ?=
 =?utf-8?B?a2IxUzZQMzV3enBXeHh3U0FOcWxYRFJCWEc5Z0FHYmc5OFlzMjdBQk92TFYx?=
 =?utf-8?B?cVdGSmovcVUvS2lDSWduZ0ptOVA5ZmhyTWs3WGphcU4rZTViZzZVQkFJUXdr?=
 =?utf-8?B?ZnhGZGJSUmc0YVhpZDdDMGl1cjhGODVicGpIUDRMNlMvNnRSZFJhSGs4Nmc2?=
 =?utf-8?B?aTNOb1BkWUZwN0xVZEtUenVPS1p3WHNZallaME1XS3pQSjhwQnduV3diSURU?=
 =?utf-8?B?b3IxZEMwWXAwSXd1aS9DNVpNTmpDdCtSR1k0Q2FzZFV4WmppdUNXc2xUVjQ4?=
 =?utf-8?B?T3JHazJrV3U5R0RjcWxmSVc2OGgvVlJXaFExNXhxSFY1dVRGY3Y5NzBEWFZK?=
 =?utf-8?B?ZmJhQS9OcjgwU0tQTks0djBmVzFoVVluZ1M2ZEY0TzBjQkI5VG5pN2xZVVc0?=
 =?utf-8?B?RnVLYjJVMi9ZRGNDM3BLM2NNVytuZ25QYXA0TzJWeWIyM3lySGx5MDdiY0VO?=
 =?utf-8?B?RG5wT0xTUjFWSlljT3NWWUdWZ3Y2QjI3cG9uVXVGWTEvYXE1NTFVeE10TnF2?=
 =?utf-8?B?dStOeHNUUXpTT2NHWEF4TG10UFVKSXdkMUxrVFk3dWVVaHM5NFB4WG9XNHo2?=
 =?utf-8?B?eHZCc1BpQWFpTEJibWlNRlN4ajJ0ZEQreEdudk9ROEVJMnhoZGVmTmw4R091?=
 =?utf-8?B?M2pBZ2UraUczV0hic05oWlhuTDdWMTh6WHFrTXVWcW16c1NQcVM2SHhpd2FL?=
 =?utf-8?B?OFBnZVdqOGxZekR6bngwRmh5S25xWkIyZHdFZ2J0bDE4NkJFeElqMWltZzBp?=
 =?utf-8?B?VGhIRmtQTUlyOWZBdUY5bUhiQ3ZFWW5STVlLQXBLbkRBNi9lYnJjUUFScW01?=
 =?utf-8?B?c2tMdWJ6WHdrbEFlZHJSNis0Tm9qajVzWm5hYXZ3NjFYbG5JRjJzaWVaSjRu?=
 =?utf-8?B?Rllnc1BCcTVVakxERE1VNUt4cnBXZ1RmY01kSU45Zzh1Z3JDR04raS9iK2I3?=
 =?utf-8?B?WmlIL0NmZnFpUTlUeW9pcnIzclhYUWJ4T0ZzOUtlS3JsSGZINTBNd1pFdGU3?=
 =?utf-8?B?c3c0TU5jTmJFUXNVd3preUFUT2dtZldsYzlUMnp4ZzlzVXRUZ1psSExGK0di?=
 =?utf-8?B?V1RkWkF2dk9wK1hWRWVCMC9wcms5cGxpNFBWQ3hqWm4yQmF5TnFYVlRZczJZ?=
 =?utf-8?B?OHhLMDM2WFMxS1F2OG4vYm1sZzNLcHlzMklkbWplTm5xVkRqR1g2VkpUek80?=
 =?utf-8?B?SzJTM1ZkUWt3QmMrb2w4djFJWHhPTTlVL3RTRmRiWWlCZjgxaEpmNnZZL3RM?=
 =?utf-8?B?QUJEd2tDeXdnZmoxYlBybU1aRUsyMUs0T0xmaHNPVUZIWkhHbENPZ29uR085?=
 =?utf-8?B?MTgrdzNMaUlDSWk4ZzB2MzdvQm4wT2lYWkM1bURFTWlwaWd0dVIrNi9YMDJE?=
 =?utf-8?B?UmhHbnRsNXA2RDZxSlFVZjNhekEyRHBOY0FCTWdMbkJMUC9xUnEwTTlVdGNV?=
 =?utf-8?B?S2JIbEtUVVhNL1ZvWGo0bXp0RVJTc1loWHJyaUI0UU9FTVdYaDQ2STVyU2tT?=
 =?utf-8?Q?Y5kUwP2v2YCTJGlBLGfKDd6gL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5139d8-80a4-48c7-ba24-08dbc008ca61
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 09:53:39.1738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r/Z9UsZcvZVvtBeVuNHlEl/0ieWErRARCY5Vp1nVcajXgoYQxs4/wiFYVH1Gp8Anc5jM8XfUwzRlmy7lhLgTnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8015

On 28.09.2023 10:24, Roger Pau Monné wrote:
> On Wed, May 03, 2023 at 05:58:30PM +0200, Jan Beulich wrote:
>> Switch to using map_guest_area(). Noteworthy differences from
>> map_vcpu_info():
>> - remote vCPU-s are paused rather than checked for being down (which in
>>   principle can change right after the check),
>> - the domain lock is taken for a much smaller region,
>> - the error code for an attempt to re-register the area is now -EBUSY,
>> - we could in principle permit de-registration when no area was
>>   previously registered (which would permit "probing", if necessary for
>>   anything).
>>
>> Note that this eliminates a bug in copy_vcpu_settings(): The function
>> did allocate a new page regardless of the GFN already having a mapping,
>> thus in particular breaking the case of two vCPU-s having their info
>> areas on the same page.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Some minor comments below:
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -127,10 +127,10 @@ static void vcpu_info_reset(struct vcpu
>>  {
>>      struct domain *d = v->domain;
> 
> d could likely be made const?

Probably, but this is just context here.

>> @@ -1633,14 +1528,44 @@ int map_guest_area(struct vcpu *v, paddr
>>  
>>      domain_lock(d);
>>  
>> -    if ( map )
>> -        populate(map, v);
>> +    /* No re-registration of the vCPU info area. */
>> +    if ( area != &v->vcpu_info_area || !area->pg )
> 
> It would be nice if this check could be done earlier, as to avoid
> having to fetch and map the page just to discard it.  That would
> however require taking the domain lock earlier.

In order to kind of balance the conflicting goals, there is an unlocked
early check in the caller. See also the related RFC remark; I might
interpret your remark as "yes, keep the early check".

>> +    {
>> +        if ( map )
>> +            populate(map, v);
>>  
>> -    SWAP(area->pg, pg);
>> -    SWAP(area->map, map);
>> +        SWAP(area->pg, pg);
>> +        SWAP(area->map, map);
>> +    }
>> +    else
>> +        rc = -EBUSY;
>>  
>>      domain_unlock(d);
>>  
>> +    /* Set pending flags /after/ new vcpu_info pointer was set. */
>> +    if ( area == &v->vcpu_info_area && !rc )
>> +    {
>> +        /*
>> +         * Mark everything as being pending just to make sure nothing gets
>> +         * lost.  The domain will get a spurious event, but it can cope.
>> +         */
>> +#ifdef CONFIG_COMPAT
>> +        if ( !has_32bit_shinfo(d) )
>> +        {
>> +            vcpu_info_t *info = area->map;
>> +
>> +            /* For VCPUOP_register_vcpu_info handling in common_vcpu_op(). */
>> +            BUILD_BUG_ON(sizeof(*info) != sizeof(info->compat));
>> +            write_atomic(&info->native.evtchn_pending_sel, ~0);
>> +        }
>> +        else
>> +#endif
>> +            write_atomic(&vcpu_info(v, evtchn_pending_sel), ~0);
> 
> Can't the setting of evtchn_pending_sel be done in
> vcpu_info_populate()?

No, see the comment ahead of the outer if(). populate() needs calling
ahead of updating the pointer.

>> @@ -1801,6 +1729,27 @@ bool update_runstate_area(struct vcpu *v
>>      return rc;
>>  }
>>  
>> +/*
>> + * This makes sure that the vcpu_info is always pointing at a valid piece of
>> + * memory, and it sets a pending event to make sure that a pending event
>> + * doesn't get missed.
>> + */
>> +static void cf_check
>> +vcpu_info_populate(void *map, struct vcpu *v)
>> +{
>> +    vcpu_info_t *info = map;
>> +
>> +    if ( v->vcpu_info_area.map == &dummy_vcpu_info )
>> +    {
>> +        memset(info, 0, sizeof(*info));
>> +#ifdef XEN_HAVE_PV_UPCALL_MASK
>> +        __vcpu_info(v, info, evtchn_upcall_mask) = 1;
>> +#endif
> 
> I'm not sure about the point of those guards, this will always be 1,
> as we always build the hypervisor with the headers in xen/public?

That's the case on x86, but this is common code, and hence the build would
break on other architectures if the guard wasn't there.

> Is it to make backports easier?

I'm afraid I don't see how backporting considerations could play into here.

Jan

