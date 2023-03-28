Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D63E6CC73F
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 17:58:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515974.799413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phBi1-0004Fu-Mf; Tue, 28 Mar 2023 15:58:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515974.799413; Tue, 28 Mar 2023 15:58:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phBi1-0004Cw-JX; Tue, 28 Mar 2023 15:58:05 +0000
Received: by outflank-mailman (input) for mailman id 515974;
 Tue, 28 Mar 2023 15:58:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phBhz-0004Cq-OC
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 15:58:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 514f058c-cd81-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 17:58:02 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DU0PR04MB9588.eurprd04.prod.outlook.com (2603:10a6:10:31d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 15:57:58 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965%3]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 15:57:58 +0000
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
X-Inumbo-ID: 514f058c-cd81-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpSgjM35aEa6ng/dspZzllYeaDsGm+bRZfVyjyB3+2kR5BUy3KdfDN25QuVqqhkOz4tq27NIGz3BO2BrXyjkxQ/3QCl6EqS3tU5fFSNa5z5/WkqdVUvkXPsKvokZIaIA763aL0BUHuy5W1hhsvEQD2SNPZNG6cG9RdrydX0vSc2q5n5HPBApPV07KC3kWc7pFOxGFzH1hNxwaiyitQw9lwaCRUPc1TI7+pbnyQkT3Daqhvzr/RHQO3tQ/SNNCg5+oQ0YdcERC5evIdogJy7PIP8mf5CA8uEVuviMtYUdxmxy9CMnaXdAk9b60WUBdaYWzZGYEujBzC9regZ/PI2PvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCD2K3neQwvO8bvUE58hygQIvMlA3llqM1UPaKgUxdU=;
 b=Z3rEM1T1YEefAlcSr7bydmtrEmKR1HHJVVdk/zo/MWCP2FNcZA5752S4pZLztUd4sgpQ5PO8DIuh9fwpShQfRJDJEwHbxvD8ihS/nUhU6DRlrhb2QujeHQmU2wy9ZVAEP21rzrVS+X6JLN0yduAeNa1DbhNmB5dvA+JR0Ovv1SRqaWA0hYcNr+GJlLg8DtskxO/oQi0h2QRHuoH2/He3GcRAuTfJ2/ozQFx8TDgwy8vD+bubFx87f6ReZZb9cskaOeD9nXHMmJWLBZ/QZPGCDXdRCQHWqi7ugwKayy9WV1jSjZw3W0Aqn1xLaZcOY01OIyJNsT3wfQ5ajN4HkQOVUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCD2K3neQwvO8bvUE58hygQIvMlA3llqM1UPaKgUxdU=;
 b=nNV1bwwwm4slLSsTEZPVIZlnhs7si4OexmPzB0x/DtLB3p34kfzmQ0dPMvG7SK2nqjip1azo2QOKxt+VKv1/npjMxh7+XA2GXpVgzBtaOo5b7E3q0FEU9EXwgWk/p60W1lpVPpG1u4WDS8bRLV7VKLYfnnP1I7a+tPT4xyCVQgUsKAjykjneIlh8Weuj0dsmIu1efFsZvRiOGFAH6lyVZxQ2pXtzme3nGxhq7K5PCwlxHymclAShhS5Zl4MgSs1so2ebIgyC3SJ+WrRkq7byuJkdwZu+8tWVBXsZeF8AItLWmfbAW6WvEtPbrhm9t+I7sCvxuM0LP4YpO1gF/sqm8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8ca9ddb1-d94a-7010-ab42-e6d0f0670aa3@suse.com>
Date: Tue, 28 Mar 2023 17:57:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/5] x86/ucode: Fold early_update_cache() into
 microcode_init_cache()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230327194126.3573997-1-andrew.cooper3@citrix.com>
 <20230327194126.3573997-3-andrew.cooper3@citrix.com>
 <6b6b7da5-dd1a-1b17-b1ce-1b1adb687807@suse.com>
 <c6661fc2-bdc2-b953-88fb-7250eb2fce1b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c6661fc2-bdc2-b953-88fb-7250eb2fce1b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::18) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|DU0PR04MB9588:EE_
X-MS-Office365-Filtering-Correlation-Id: 428f1a2a-9d7d-4e4d-154b-08db2fa533aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vorP74EzWy4hW3+YR57pqo1hoKjzqjMk2LFegw54WDNI/U67X/5X7+57l41giJHTO+iDGw8puGRuoQgjiW8ioyPgV5zB1Qs27AlyY3mHTTK0cY3Q7Jn4O4ESmJSvN7NQ+8NnRDEtgOZBtj2eoQGKyfMQU91m0ruJWpD0y+H7zPHhMI0inBuquGJ5UWCPUB6fDdw1e143sf2gknx3FNdJMOBx728TLf8pN7Jd7fb/AjRmBNAUtQuDYg6YDFXalDUGM+ufdkBifjYfc6qPfTQNwZjjjRZUvU43Q6Ftr/Y2urJp7aunnEmUXJLiJipv7nEi4B6M/STV+EsbmhGISkinqpbPureQMmtK77D8PoTIvRhKwprqeLaDlQyOw9RtkMGj2y+Vks7crrgagHAMMWbPmI+lmmtcFlvPslN1PwZx0kYz8/R99n4RYi//bxDKDmmTGNBszcurNhPVkzPTA6EY7ZYV3cBYRRJyv7MTOOIr6M/p6x7WTt77KADMOYG4BznaE9VtdRllGqTvZ2iebTUWe4V6p4Vi9He8SVnb1AclSncVterMRCa7G6cfUge+mQj+WbbkGJmz6g/w/8p1eQSNygI/lDCFV2gKfDu5b5/MnEp9UN7WJXL+wYmP+eG6qtll04ioavEGLVntahaCv0Pinw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(346002)(376002)(39860400002)(396003)(451199021)(2616005)(6486002)(6506007)(53546011)(36756003)(26005)(186003)(6512007)(31696002)(86362001)(41300700001)(66946007)(6916009)(8676002)(66556008)(66476007)(4326008)(8936002)(316002)(5660300002)(54906003)(38100700002)(478600001)(31686004)(83380400001)(2906002)(66899021)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVR6RlZodHZEYmdtdkNEQ3BnSU1BVUtoL2xkS2E2WU83ajdma29xbUlQSEFU?=
 =?utf-8?B?UDhYS3BBZnIxOVZLWUNvWFgvNUFrR2V4UCs2WktUYkUzQkw3c000WCtqUGQ2?=
 =?utf-8?B?QS8xVEFZaEw2MStCNFVURFYvY0s5VTAya2hwbGVmeS8xR1pycnQzaFdGdXc4?=
 =?utf-8?B?OHM2aHhTa05NSERuV1FyUGV1b0NxWlR0OFFkWUpKTUhITUJMZStOTWR5VnZH?=
 =?utf-8?B?Q3ZMVlVwcUhYNzNYc3RWbkRKcnFKZThaRmFsMCs1ekp1a29SSVdSUFJuWURz?=
 =?utf-8?B?RnRaT0cxcDVnTmxNL2RualVxUlZmeDJGM1l4SkQveHl2dXFlemJBcmFQOVhw?=
 =?utf-8?B?VVhIaFFXOHFrRy8yY1g1MWZ6RHMwVDBxSzZiR0RrR2o5cDJ4Z1p3RUZnVTVB?=
 =?utf-8?B?TDdveFh3ckNxc2lETlgxOWhQWTE3Qy8rQVphWUZUOFdxTk54T0F5NlozZWlo?=
 =?utf-8?B?ak9SbnNQR0gwODAzblN3SFhqTXJrcm1aL3F1d2tkVzhoUGhvVmJXK0c1NnVk?=
 =?utf-8?B?Q1ZQQlZWUTYyM0hta0xCaHNFOTBqczYxdUZHUWU4RWlNK0d5Q01qZ2pnWlRH?=
 =?utf-8?B?d29qNDEvdWhmK1FINVdtYm1WR09JTWkrUjU2Ui9NdFZ1QTdZSlRVcEVVdXVl?=
 =?utf-8?B?eFBEZHY0dDhhV1BQTUdwQ1YraUR6VUxoQWVjQXhvNVNyZVpGbVZOM2JYUysz?=
 =?utf-8?B?a2lQb3FDaUYrZkg1MHVwOW02WmJ4M0NvSVRIK0RRK3l4U05hYlJZS3MrVFFX?=
 =?utf-8?B?UDEwTTlrR0VpN0F5d0t0RFFucmlYZmFVVkkwSTRjSURPNC9Xd3R6WWZmT3lD?=
 =?utf-8?B?SXpRZy8xSVp5K2FyNTJQdDNMVTdVSFRQd2tySTdoUDVQRlpPaDdQdnR2SGt1?=
 =?utf-8?B?aUxISDZMemRRY1IwSjVXdEcwNWxjcnNOR2xQdlY5UjZrankyMFdIbTBVbEJx?=
 =?utf-8?B?ZjZJRGRXQ01teXJ3blRvQU9LcDVtZm91OFZSLzdrYzJKanJYZU5TMzNrdTl2?=
 =?utf-8?B?Rjhzc3E4Vkp0K2xvaW1qUFRYSDd3MVZ6Vk5YbVZXU1ZIbkJqKzcyQm5neGd1?=
 =?utf-8?B?M2QwWnlSMGhMSFNVcnN6U1RzdldINUVId2hHMXhIMzk1SEczU3A4SDdpM1Fp?=
 =?utf-8?B?UGNCcjk5VlZ0OFVEd05sWFZQV2ZCcVhxdnlpRVo4b3pRUzAwTFhsNzlTN2hn?=
 =?utf-8?B?OFFOc3NZZjczSUVDK3FoYnpzemlMNCtESTliODUrK0JIT3N3OTI0WTlMeWxF?=
 =?utf-8?B?Wk93QlVSdlRZWGhQNDJ2R0tzVm5xRFdpWjlqVWhxRHZuc1kxTUI4eHU5WXBj?=
 =?utf-8?B?dVFxNkw1YU1SRWVEMC84RkVGcWw5QWJPL3NubTBkNHBGYkoweExZL1ZwL3RS?=
 =?utf-8?B?NlNjbDIxdVVOOW5ULzJSelJlWHVQSmRjNzN5azh2cnVUMGM2Y2JsTUxkU3Nk?=
 =?utf-8?B?dE92WlREOExnWWtnSFRNVjB4Qk1WbHhUR0JsMit2SlQ4L1BHd0F0QTI4em1i?=
 =?utf-8?B?cWZVMzhZcVlEaFFoSW84ZEFpeUM1YXc2MmRMRHBBQW5HeUM3WXI3eHdxcENr?=
 =?utf-8?B?UExUbnNyQlcvQnYzQlpTWlBqT3MxSVBjb215WXRZVW1IWGh1aXNFUEk3UFVy?=
 =?utf-8?B?K1NoZDJPcm83NUZ4MnhSWm1MaVc5SXBkdW1IQ3NURjNLUHZKSkJLSXpCaURy?=
 =?utf-8?B?S042SUdQZGlKbHIrT1VKTjVaelFBWVphdmNlbmZFT3IzU3UrMENtYXJDUGJZ?=
 =?utf-8?B?RGFPMldDS0NSMnJkaWZzS3g5V054MVlmcFdCTC9LWjZlc2R3VEFUR0o4Qmtt?=
 =?utf-8?B?U29MbGRESzVRQkl0aUZEWWRGNEJrcnRYT1VROHBmVHYxRTVhbU1ocHM3dGVY?=
 =?utf-8?B?NWpPOTM2RmJSSXYwR2FTaHNQbUJhQkR6SG1ZTWkrcitNd2VGMER1MHg5T255?=
 =?utf-8?B?Nk9Sc1BkUzZ6UFIrTzJoLzkvMzUwNGRoaHUyYmVlamR4bSsweHBoSjgvek16?=
 =?utf-8?B?Wm12VFBqWnUrd1VFN2xIR0RGck1JelJBcGgwQzdhdE1VeFBxSUpmRk9lK2Y4?=
 =?utf-8?B?ZDN2bFdlaCs4NjNzMEVIREJIUnMzUmo1aUpmWHk0QlBFL0grVkxmaGhNMklz?=
 =?utf-8?Q?ka0gRkOoplORdlss6gAmN6CXJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 428f1a2a-9d7d-4e4d-154b-08db2fa533aa
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 15:57:58.7557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2vSCEm7vemWjBb/0NjmXLGRzYNqPHKOkD4UJMVKFX2zGCw4I0h/+ikv/eT9vswwMdqVeNwp54xVEHQ8r+0j5qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9588

On 28.03.2023 17:07, Andrew Cooper wrote:
> On 28/03/2023 2:51 pm, Jan Beulich wrote:
>> On 27.03.2023 21:41, Andrew Cooper wrote:
>>> It is not valid to retain a bootstrap_map() across returning back to
>>> __start_xen(), but various pointers get stashed across calls.
>> It's error prone, yes, but "not valid" isn't really true imo: As long as
>> nothing calls bootstrap_map(NULL) all mappings will remain as they are.
> 
> And how is this code supposed to know whether it's stashed pointer is
> any good or not?
> 
> This is precisely "not valid" means.  It doesn't mean "it definitely
> doesn't work", but very much does mean "can't rely on it working".

Hmm, not my understanding of "not valid".

> c/s dc380df12ac which introduced microcode_init_cache() demonstrates the
> problem by having to call scan module a second time to refresh the
> cached pointer in ucode_blob.data.
> 
> The code we have today really is buggy, and is having to go out of its
> way to not trip over.

Right - the code is fragile. And it's okay calling it so.

>>> --- a/xen/arch/x86/cpu/microcode/core.c
>>> +++ b/xen/arch/x86/cpu/microcode/core.c
>>> @@ -755,47 +755,51 @@ int microcode_update_one(void)
>>>      return microcode_update_cpu(NULL);
>>>  }
>>>  
>>> -static int __init early_update_cache(const void *data, size_t len)
>>> +int __init microcode_init_cache(unsigned long *module_map,
>>> +                                const struct multiboot_info *mbi)
>>>  {
>>>      int rc = 0;
>>>      struct microcode_patch *patch;
>>> +    struct ucode_mod_blob blob = {};
>>>  
>>> -    if ( !data )
>>> -        return -ENOMEM;
>> This is lost afaict. To be in sync with earlier code ) think you want to ...
>>
>>> +    if ( ucode_scan )
>>> +        /* Need to rescan the modules because they might have been relocated */
>>> +        microcode_scan_module(module_map, mbi);
>>> +
>>> +    if ( ucode_mod.mod_end )
>>> +    {
>>> +        blob.data = bootstrap_map(&ucode_mod);
>> ... check here instead of ...
>>
>>> +        blob.size = ucode_mod.mod_end;
>>> +    }
>>> +    else if ( ucode_blob.size )
>>> +    {
>>> +        blob = ucode_blob;
>>> +    }
>> (nit: unnecessary braces)
>>
>>> -    patch = parse_blob(data, len);
>>> +    if ( !blob.data )
>>> +        return 0;
>> ... here, making the "return 0" the "else" to the earlier if/else-if.
>>
>> Alternatively, if you think the -ENOMEM isn't sensible, I'm happy to
>> consider respective justification for its removal.
> 
> I'm a little on the fence here.  Nothing checks the return value at all,
> and nothing printed a failure previously either.
> 
> Right now, the early boostrap map limit is 1G-16M, so this really does
> fail with a large enough initrd to scan.  There is a corner case where
> the second pass can succeed where the first one failed, but this is also
> fixed in the general case when thread 1 loads microcode (and updates the
> BSP too.)

As said - with the removal justified in the description (e.g. by an
abridged version of the above), I'm okay.

> I'm also not convinced that early bootstrap mapping is safe if the
> bootloader places Xen in [16M, 1G) but if that goes wrong, it will go
> wrong before we get to microcode loading.

Hmm, yes, this could be a concern on systems with very little memory
below 4G.

Jan

> Overall, I think that bootstrap_map() itself should warn (and ideally
> provide a backtrace) if it fails to map, because one way or another it's
> an issue wanting fixing.  Individual callers can't really do anything
> useful.
> 
> ~Andrew


