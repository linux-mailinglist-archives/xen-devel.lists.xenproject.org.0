Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 154F648658D
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 14:51:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254014.435490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5TA7-0002FT-KX; Thu, 06 Jan 2022 13:50:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254014.435490; Thu, 06 Jan 2022 13:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5TA7-0002Cb-Gz; Thu, 06 Jan 2022 13:50:39 +0000
Received: by outflank-mailman (input) for mailman id 254014;
 Thu, 06 Jan 2022 13:50:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a8QS=RW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n5TA5-0002CV-VB
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 13:50:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ff4f79c-6ef7-11ec-81c0-a30af7de8005;
 Thu, 06 Jan 2022 14:50:36 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2050.outbound.protection.outlook.com [104.47.5.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-l-2SYUgAPqucI6HBnOH3vQ-1; Thu, 06 Jan 2022 14:50:34 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2702.eurprd04.prod.outlook.com (2603:10a6:800:b4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Thu, 6 Jan
 2022 13:50:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.017; Thu, 6 Jan 2022
 13:50:33 +0000
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
X-Inumbo-ID: 9ff4f79c-6ef7-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641477036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Db0kgQfpWWuAlYXngeON3avL7XJQ6joT8eC3QnHYWiY=;
	b=nF5GlVkYPivgc/mRPLkPvJThF7ZSdWSt3XriuElGxhRLyGokJTLwNx0STfyc0ZIdS8snmv
	NQbep/yV06mc3tWxpKJw2h2zGvay9IuBpLCNGzNQbRmIRlFRyaRrFFmqRkaIkw4QB5JoBR
	EjZf/F+U2h0UkIxHvoOOatmKXDTc6ks=
X-MC-Unique: l-2SYUgAPqucI6HBnOH3vQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nfbxyrHprgUXTfS1HORKdAHU42eex8IV671x+B7QahMooYwEM/1VGnXRFUS8lvrxG0CDwLSWSOzQvlVC4TLcwKMpirTgs3CbhGPVAK/52hbx0GKgClCtMAd5oCOwabxpGYpZPxs/lKi3CBhbHozAUi9BC5+nmGNeRZcdnOxZS9mvKWWQotmSz57r/sHBTSrVwKAnzOloog0pZbvbBV6RmiBQIU+BjIhV4ixm0TnPx1rtJM6gnIGxvkGdzx/JG608QpJSUoYaXhlWk66XtqJj3jK/wXoZbYDx7kWo84OtIAPTmXZA3oNqZA6QVBMr6mjzsHQSttL8g9RNniB4Hu0qeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Db0kgQfpWWuAlYXngeON3avL7XJQ6joT8eC3QnHYWiY=;
 b=TZrm+7eP7Uc4y9pwxwAjMhdg6aKZWpICdlhBHOX6bDJ/bZ3vfc5msNryRXw/LEW4mryKtLibY2fjXbkju/xmZjPLN9q/9t68q/C9NCdXomGXKdS8UjqWkgDCjwmsfo9v5b4zCAFe8RpVn3nul+vBtuTzvNkTDi9wSSt5heQ+8riPfcGtUhdlCrgM+2x8RO0pJAM6ujs6TzC5pD14ONRJSY6nCxVyg0m/n3dkDUEjcAa5VjcMWjtjjFJjYWYCLw+ro2JcjVnaVSxxSx3GuNxmWPUIdW6HHTTpq30Wtq6GJGPT64LCX2NbZZHBKIM6soN7Zuf5cx6Q4mhxGwSA0l9pqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <35ed148d-c525-5fdb-ad83-d0a1c9432b11@suse.com>
Date: Thu, 6 Jan 2022 14:50:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH RFC v2 3/3] x86/altp2m: p2m_altp2m_propagate_change()
 should honor present page order
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
References: <e9257e96-ede9-2809-9a77-fd4dc206badc@suse.com>
 <d1b6aede-2c0a-df7a-7815-73ad4d795899@suse.com>
 <CABfawhmGxHBEC1M2=zo11K11Yr_TdWFkkVpDpVimy_uvD4nxyQ@mail.gmail.com>
 <f13f983f-9190-99d4-7a6d-c73be651896d@suse.com>
 <CABfawhnNv+KpSm+ZGaRFvkNrooU0_E0TEijs0_WBNtrZ0-y1Jg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhnNv+KpSm+ZGaRFvkNrooU0_E0TEijs0_WBNtrZ0-y1Jg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0174.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed6ac89c-2c10-4900-9079-08d9d11b8231
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2702:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB27024651E4768611DBC34DF6B34C9@VI1PR0402MB2702.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wPdTFb7Rd/ku5bAvMs64aeEYRi22s85S9pr8MYsp2g04zfyFi5YpR45YLEyRcTJNb4KZ86UWtEZqeeeG6LuNtzTh7otynNr2J2zPJdnVp7+hVQqOX7jaLDGQWvWk9I3ymlDbajv2g7sVEvJ5e6Z+lt4FZF5x+pE9h1Jr4WaY6U65zcxAKkfqRbvbHSoim6a0yieezwaWLap9ssB8gAEkSBGPcyNKfdFW3wF2N4sCHicGwomCqLxEToIh2LOz+LHVbt2RfqVrGxkuwhefHlOiH7vE32utD4AdLD/VhrAf1lucJO9zd29eFSI1pn906b/ODBKflTRPDGn8cDHeCVFY6LNpLuKKfj194fEnvIf4MoJpZ9bYn6h6s0JnMr6p3kHaZUEglt4SgU71sv1NxzRVCXRQ1LKqEM8D/T6Vndm/ntw5kCoA7pORffImKgrYO6W5WzAUzvEaEZG78r3HzsBhc+3F+UMbtlJhLWpYM5vOzJ4EUGBrrch7LNSFjE5WJ1D6h8M11U5Iv5RK1096VtmxCrw5F9jOjBfoKnpVSXYElrbu+3gEfTMc4slLhGrGJ9jQJHo84EWC4piYX/5AdJodM2Erd28PMQnyN/rnZQQky61PJijtyZ5PXVG4MRc2yLHtSPnF3b8RvGPk065fZoqFdiHKv+WVKxYPDRB7nXJetvUaZHtwHtMeVuNL8hDiDKUoVE5MBeagE8wCZSTVsK4s5Rh7W1ubLVzzvhUtkGoQ6cIxrOjV+5BkM18kd4VuBqH2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(53546011)(8936002)(2906002)(508600001)(186003)(6512007)(86362001)(54906003)(6506007)(4326008)(6916009)(5660300002)(83380400001)(31696002)(31686004)(8676002)(6486002)(36756003)(38100700002)(66476007)(66556008)(26005)(2616005)(66946007)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzhTYlNySWdHaFhXczJ0TTBROS9LMjdRN0NxTzJZMHVTV1VCU09od2o5WHZM?=
 =?utf-8?B?THhMQUdORzNDYTBlS2thN1ZDNEgrUUllT21NMW83S25aSDFYNU5VTGVibExD?=
 =?utf-8?B?WUNFYnVyNXlhbzZHNVVzc0ZPWEJPTUo4SUpCeVZrVElEbWJaMWZmMEZtb0dN?=
 =?utf-8?B?VWR3bDltcENWWk15NHg0SFFISWJoVXZwVDJIRHdjL1UyTTJkZUZOVjIzVkF0?=
 =?utf-8?B?ZjNpUFdYdnQ2SCt2WWZOenlTaUZ4SnR6alpnMFYrWWJOUkpBRmtJQ3FEWVBR?=
 =?utf-8?B?MFpWM3YvU05OR2J0MFluVE9td093cU9ObXMydVZETmEySm80OTZ0cUd5S20x?=
 =?utf-8?B?Zmd0dDF5WisxTERBYXBZTEJZczF0eFdJMTFLOGQ0dEtvOS9UVThkNjhVRWIy?=
 =?utf-8?B?SmJsRlJXWjE3bTdEOWJqZzhaY3lBWnljbUNkOGMzWmI3WnM4dTZTc1JmdTQ2?=
 =?utf-8?B?a2NBU3JONG9VSUtGbmtQOXA5S214aE5odVhXbnA3bEVnd0h1djM2N1U1aFFo?=
 =?utf-8?B?UGFhbjViVlBObUxCUEZBVXNobk8vMW9CdkZqeUZJRG83emc1Q1FPZmt0bXM2?=
 =?utf-8?B?RHJtOCswMWFMTVpQUnA2Kzg3WDV2T2c5ZmhtOW13L3FzNFhGTFJEZ3ZaS2Vv?=
 =?utf-8?B?bkxxSVVRdVhLdWVOUy8rZUszbXl2YWtqQjljM0hUcm1OV2I5a2N6blZTVFk1?=
 =?utf-8?B?bDlMSlVXSDIrdVo2T2F1SmhRSUkzdVR5eUlvSUFMMHRPVlJVZEFuMXBnVlRY?=
 =?utf-8?B?YWk4RUZTZ29JYzhIeDhxc015RERFdGFxMmtZM0ZqeThEa0xMRWtDaGh5cmJw?=
 =?utf-8?B?TGV4NGM1ejZkNG14NzNFMk1LRjQzNmV4WVdGSkxjYlcxMDAxUmUxdFVINkJj?=
 =?utf-8?B?UDdZOFc4VFp2V2Q0OHlVaitsNDZTNnc1U0licWtZc1Z1ei9QbmhRVkZwbGZE?=
 =?utf-8?B?NEk3WkxSTzREdmswZGpFZzBQZ3YvbEZnbjlWdVVGR0xDMkIvV3BaTE1Kc2sr?=
 =?utf-8?B?R1JjSDhZVnRLMFB4RkJOaExWUGZyMC9IcUhNL3NXSkk5ZHFhM0RQSzFYdVlr?=
 =?utf-8?B?QUVmQU5zSEF2akRVaEFyS2o5QUczalE0U0FpRFkrSi9CT2s5TFJlaDRZcnE4?=
 =?utf-8?B?bGMrRVN2dDRMKzBzRkRLM2hjSG00R1BQVjdYczRxL3pMMjNlNlFGMXdOSlBq?=
 =?utf-8?B?Mnl5SFN5WHpBRFhPTmpYL0xGN1A0ejN1aGJ6UTBDbG9oTlk3T0cwZXFla2g3?=
 =?utf-8?B?MThPWGRjK1JhQjAyRXhBQzRsZ2pxSlNPRGVmZTI5QklRSHdVOG1ELzNLMUd0?=
 =?utf-8?B?YS9CN01aM1VidnBTY3p1dU9lalV5RjhVNXhLVFhwOGg2aWdjcndSdi9DY21t?=
 =?utf-8?B?aW84M2lxcFRJZ0M3WHpiYXlMK2ZTZEVxbzB5R1UxOHE2cG00RW1NN3EvRFA1?=
 =?utf-8?B?YTBpR3Rja1d4bU9qQ3ZzWGlrbjVWcTl4VTBBcnhtS0pEbU02S1lJKzVYcjJD?=
 =?utf-8?B?dnlwWFRxOGFvNFU2bzdPYVJFMGNHdnBYTHU1b213UklTRWVESCtMMEU3d2o2?=
 =?utf-8?B?b1IwVzBnUHBTdlVwMExsZXhqL3M4WHZ1bGVXOVhZLzBlTkRWNXhKUDREeWVw?=
 =?utf-8?B?aEs4eC91N0lGTktxR0k2bmJKMkxFd29GbWI2UE5JY3ZKMitWVzJHd2Nwcjc3?=
 =?utf-8?B?MysyYkxLbUhKRVE2cVNjaGU3czRKMUVXOG1kV2tCNCtldldtb3pvYklzS21O?=
 =?utf-8?B?U0ZLK3FRaDYvSDYwK29JZnlCSk4yMUExVTFrZEY2VUZtdWw3VmorRVo4cGNv?=
 =?utf-8?B?YTM1YlRUcWt0UFIrbWRMRU5ISmNaSHVQeFZnWnd4NkZoTTYwbGpocDI3aGl4?=
 =?utf-8?B?WDFUVXhkTWliQUVDYVdqTzV0L2VHZVppWE9pNWtPVlkxZ09QcEF2eWVmQS9t?=
 =?utf-8?B?TDBITFZFWDNSSGZPb2ZPck5sbDZkZlBZTk8rN1JTZ0lIM3JWcXFhTTZMdFAr?=
 =?utf-8?B?ZVZSd1ZxTjdMcjFlei96MTI0RktKcXNhSkIxNGtHU3pGekdxUVBLVUdBaHNK?=
 =?utf-8?B?YStkb0RCemErbWgyMnNoM05KbEFyMmgyVStlVmxRWDBvWno3ZmRFUUpJc0d3?=
 =?utf-8?B?M2JJajFSM0Q3SnJPQzN3UmhjR3VkNVppQzhzVHEvR3ZWUHVHbm9FR2g1aVlP?=
 =?utf-8?Q?c6zjt/GGiF1lPAD1MnyL7Sg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed6ac89c-2c10-4900-9079-08d9d11b8231
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 13:50:32.9573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DnhUFzXFfO0A0UhYlJbEXTSH/YvEAsswvzDxNxsAyrVk4jiJLg3l2xCbd4SLIPMxb2AWlLIl8Zsbe8RFKYSSlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2702

On 05.01.2022 17:25, Tamas K Lengyel wrote:
> On Wed, Jan 5, 2022 at 3:59 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 04.01.2022 18:48, Tamas K Lengyel wrote:
>>>> I may be entirely wrong and hence that part of the change may also be
>>>> wrong, but I'm having trouble seeing why the original
>>>> "!mfn_eq(m, INVALID_MFN)" wasn't "mfn_eq(m, INVALID_MFN)". Isn't the
>>>> goal there to pre-fill entries that were previously invalid, instead of
>>>> undoing prior intentional divergence from the host P2M? (I have
>>>> intentionally not reflected this aspect in the description yet; I can't
>>>> really write a description of this without understanding what's going on
>>>> in case the original code was correct.)
>>>
>>> This function only gets called from p2m-ept when the hostp2m gets an
>>> update. In that case this check goes through all altp2m's to see if
>>> any of them has an entry for what just got changed in the host, and
>>> overwrites the altp2m with that from the host. If there is no entry in
>>> the altp2m it doesn't pre-populate. That should only happen if the
>>> altp2m actually needs it and runs into a pagefault. So it is correct
>>> as-is, albeit being a subtle (and undocumented) behavior of the
>>> hostp2m and its effect on the altp2m's. But that's why we never
>>> actually make any changes on the hostp2m, we always create an altp2m
>>> and apply changes (mem_access/remapping) there.
>>
>> Thanks for the explanation. Effectively this means that the call to
>> get_gfn_type_access() can simply be get_gfn_query(). For the patch
>> this means that I shouldn't check its return value and also continue
>> to pass the new order rather than the minimum of the two (as was the
>> case before), as all we're after is the locking of the GFN. It would
>> be nice if you could confirm this before I submit a non-RFC v3.
> 
> I'm a little lost here.

Let me start with simpler questions then:

What's the purpose of calling get_gfn_type_access()?

Independent of the answer to the previous question, why isn't it
get_gfn_query() that is called?

What's the purpose of the "a" local variable? (While "t" also is
otherwise unused, it can't be eliminated as even get_gfn_query()
requires its address to be taken.)

Why is p2m_set_entry() called only when the original entry didn't
resolve to INVALID_MFN?

>> What I still don't understand is why the function blindly replaces
>> any possible entry in the altp2m, i.e. any possible override
>> mapping, not even taking into account the original p2m_access_t.
> 
> I think the idea was that any changes to the hostp2m will just get
> reflected in the altp2m's as a short-cut. If you have many custom
> settings in different altp2ms, simply setting the entry in the hostp2m
> will ensure all altp2m's get synced to that same setting instead of
> having to do a hypercall for each altp2m. I don't see much use of it
> otherwise and if we wanted to switch it to leave the altp2m entries
> as-is I wouldn't object.

Hmm, I continue to be puzzled. Let's take the XSA-304 workaround as an
example. Suppose an introspection agent has removed X from a 4k page
in an altp2m of a guest. Suppose one of the vCPU-s of this guest runs
on the host p2m. If this vCPU hits the (presumably) 2M or 1G mapping
covering said 4k page for an insn fetch, the page will be shattered
and the removed X in one (or more) of the altp2m-s will, afaict, be
lost. This looks like a bug to me.

Jan


