Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E8E60CFCD
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 17:01:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429912.681255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onLQP-0001qJ-72; Tue, 25 Oct 2022 15:01:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429912.681255; Tue, 25 Oct 2022 15:01:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onLQP-0001nt-30; Tue, 25 Oct 2022 15:01:05 +0000
Received: by outflank-mailman (input) for mailman id 429912;
 Tue, 25 Oct 2022 15:01:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1onLQN-0001nn-Ar
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 15:01:03 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2079.outbound.protection.outlook.com [40.107.105.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d77b7d81-5475-11ed-8fd0-01056ac49cbb;
 Tue, 25 Oct 2022 17:01:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8602.eurprd04.prod.outlook.com (2603:10a6:20b:439::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Tue, 25 Oct
 2022 15:01:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Tue, 25 Oct 2022
 15:01:01 +0000
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
X-Inumbo-ID: d77b7d81-5475-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=imcGzbroxK+xi92ssHWMbffZEtI0J87e//k7155LYZr5h87N5F/tq9Q+mS0qnALNQwhn4rbTxcFk5PcitIOjpikNCqUYjZfaG4qEkNax7O4ROwFEczGrudzf6cuXl0xGopNL5t1vC38jL2D0pumJv6vQukkKdNoG9M54PNRNQB5N9m980ZIO8ofpVdsxvtuArfAi5gmj/pJtiKg0CFnvCgYoiiuebUTVeNAtAN0cF15cRcIwn5U7CnhFPhs23QhplJ+1Rka/O7j2zgk8tbCnwB1F9VlcgRqn1zwH6zOFfnkWLLPb0qsFW39IpFREEh/8UHCL9B7OlaaLbEOjqDvZ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kt41+vpkLFHaiCgHytIXFHsNCAAi8d9QQTEDw3EnB7k=;
 b=HHLzo+/1aiL+aJ2qtaNCpovlF3awQzqN9iFLFHquSKnD2YeWOGOeb4gArgdGn12p2bXzgWPFtkJ+OkdSZ7fVLQIXshJG9t+/q3TuUs0h80vZmeUybI1/VzlukxS8qMRyAUAoHfETvxETZnOlAB833LutPGAfS0bzYiv+p1YjliZresOhB8Hb545lTzJ79t1XYjqiYTgdvIiAxnXB3lDDhZrZMCtPvlBT37bldAEqb0G2zzF9B0PyfjkbUb2JGlW+9DYgIMm5yhh1q3R83GhCmLvSWnH81cQNazj15hutq/9rOzhgaTfxf4tLfWZEMc+Utfzs668ADR3H4ueDi16MrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kt41+vpkLFHaiCgHytIXFHsNCAAi8d9QQTEDw3EnB7k=;
 b=VYQhN/6LBgkVR+l6KeRwB/RvOGcZdqtU9BLfCt/bvSxC6S5wAJzmkN7QutpPtz8mxXwXhqJBnQdGb7POHLox9Oms5UcsFH8NqHzvQALxm/VLH3YfrTNzJKmG2Hut3BJZOGas62Ojw187wY9Jv75a1nrs4kZmOvwkp/JZ0bKDd0SoJrk6gxn0lxtN/U0/HBXsmKnKu0q1W61qpHAnMxnx7eUP/28SqkZDxJTdmCcqXpPOd/ENYfpoK4gkIXgeLghu9iPSkWHT+LzhrIa0Shkp2p7ugQQOo4vWZVoIj1wn6lmCabMx5IcMUlTkFQmwQFdHIwYzx4Vmw65OCPy+Y3YJ9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <05920ede-87b5-7b93-a115-27751c94d437@suse.com>
Date: Tue, 25 Oct 2022 17:00:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH for-4.17 v2 4/5] pci: do not disable memory decoding for
 devices
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "Henry.Wang@arm.com" <Henry.Wang@arm.com>, Paul Durrant <paul@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221025144418.66800-1-roger.pau@citrix.com>
 <20221025144418.66800-5-roger.pau@citrix.com>
 <46a361ba-121e-a054-da59-512e0fb6eb70@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <46a361ba-121e-a054-da59-512e0fb6eb70@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: 808cf51a-848e-4747-d53f-08dab699baf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tDAVLNDFiFMatQQyUtbASxnr8ZJLIMJXzUZMvKSPaLNHbOA+9SjtOvTwAYiQMq3nNBtw5L9sVCrd2Wnok0PdiE+zCk9QpEE4ZDvQIXkSbIE0dyQmwlZw4P137CT7GdjfTOAKQv//6NgEi2dosOEvyH4BXMIdFDagZkXG8tNeN8JEirsVnfeNcdaO5CVcI6ay0bJ/f/3kKcLBpbD1QblbSa5HeQ9CAGwTCgUwXFWxjp01/eUgFEKw9jhNult86Ea3AJYRzx3KvuJJB7Qbs6d7S3b788uA0oql32nffwzAVb8Zq6F8lLaR7g/EkYQMsatDNFzyyT9ktEsQRmpthjdc0UvMO4zr+741dW62c35QLRwCBpAIRcOJPffsJyWGLA95RyP/ldAzDzscVnyY5KTOMR/1JeQ4DYYEF4g1HMxeLpp5IfWtaJ++/68V2roITX3Lpn5tS6xfjXUSOfPnyyRJh4VKDl9NB34roYt0YTA1Y11l/XWkLZiNCexwElyYIWGUBsWGWRSD7Vxt2xlY0AmaSAPUYHMYuz4dcfhzLYWGMYWwh4mNUrPvqaEccCTt8gwoUgOGXyix1DLi/bxOIdijLmGaTXiYv4y1lU0bYTFFlGuOsSpR1WYVfmGBGh1/85BWg7wjiXtUJxtoi4UteGPtJG5EPNvmVkYYbf7IC1ynZ1t9vmIyq03COuw3DSZ90VUQ2Oo0aIaLdJPVNL2QdNDTXA+hQxNvbJaQ0RHCU19Xgvt8W/dW76ujYDEW3IxS/+uv3h+/ZgZF/1uI+jelO4Ii15p2vc4AZu6LAX+ZJUNIixY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(39860400002)(346002)(366004)(396003)(451199015)(478600001)(6486002)(41300700001)(8936002)(4326008)(5660300002)(6916009)(54906003)(66556008)(316002)(8676002)(66946007)(36756003)(66476007)(83380400001)(38100700002)(86362001)(6506007)(53546011)(31696002)(26005)(2616005)(6512007)(186003)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmRWTUp0elIrbzdPSjJXdVAxaFJEYW4reWw4Nk95N3RhaTJOQzhlTkt0bjd4?=
 =?utf-8?B?VXMxNWtZK3BONUdYWnhGaUpMMHo1VGY2bG1DZ2dkU2YyM1J3SlJHTFpEMVU5?=
 =?utf-8?B?STQzT3d5Y0N2dFNFV0FOeUNRNnNWclEyQzB4cW5BSzlIMU44RHdQT2FkRjFL?=
 =?utf-8?B?VlRvM2tLSHBxaEs2THovN090ZkxSU3dKMkNvQWFWcU1uc1ZBT0g3a2U4RGg4?=
 =?utf-8?B?bCtMYUorc3IrNnJBT2VkUUhMZHROcXVJM3hZWnFWSEo2NVVLWllkWDlFWThJ?=
 =?utf-8?B?NmJWazVWQXZTL3A0MHI4RXhiU0gyOWE3cGlzbml6UUR2cWZGMTRUMkZ2S3VW?=
 =?utf-8?B?Rk5BNCtKU1J3UC84RzZRdXorUXpWWDhBRVI0NFZ3VnJ3NUpiTmwxeC96UDkr?=
 =?utf-8?B?SjIrUDVoRFFMYlMyUDVoRTkzZVNNOXhXQVg3a0RpcUNOdU1JcDNOUzQvMkpn?=
 =?utf-8?B?MDZTeTRacDVjTHc3Q1RucjFLd1kzQmEyL1FqK09wbGduNmpMVGt4V0pKc1hz?=
 =?utf-8?B?MS8vaDdRTkZyNjkxQUhwbko4UmtFNlFFNG1JWU1NbDZmckt5SFAwdUFsTUtY?=
 =?utf-8?B?YURrMm9nUEdQWmdWeHRzZ3VBS1J1ZFNOa2w2RFFtekRjSWtoVTBGak95Tkwr?=
 =?utf-8?B?cmZ0N0xVV1dQNnNyQmdXOTF2bm1QdkVMUjZKY2FYTjN3cGx5TzFyMW05ZEhS?=
 =?utf-8?B?TTh1ZCtkUS9Eajc4K2tINi9objdiRG9aQjc2NWUveEgwclRvKzlDUGJlT2ZP?=
 =?utf-8?B?UzNiNmc2VHR4bXErRGJhdWErNU0vWUQyU2lrL2ZhV0V6VWQyZ1NFNGJ4a3Rh?=
 =?utf-8?B?ZmhnTm5vNnFZVzBLT1Q5Tm9sd053RC93a0Vydm1lbWsxN2VqT1BjcGlrVmpi?=
 =?utf-8?B?cFlhSzloOTdqUGlKM3lsZTl2Rk9KM29KcVhsZDh1bjVTTndheFU4RzV5OFF1?=
 =?utf-8?B?aVQrdDJJNnY1YWs1VWxNOXZrUTZNa1ozaDJ3MllrQWJ5blBvbmppdkpZeUVz?=
 =?utf-8?B?enhqSU5xR2tLS0YrbjVCelVpR0hVdmRSU2R5dzBiYlBOZHgyYlZUUlBqSVZV?=
 =?utf-8?B?MGZWbDFkcFRoSTl2cmdQMjY2UlBpc2hZSGJoMU9PWCtEVEdza20vMTZUTUlm?=
 =?utf-8?B?NjhlWkRuWGJkVC9yOVdxSGx2ZHNCcWtpZE11cjB6Mnc0Q0dHK0p2cnRNUy9E?=
 =?utf-8?B?dGhObzVBV0w3d1I0UlFLbllxbVg0QXBJdS9ubExPdnJ4NW9xeExwY0IzdzRR?=
 =?utf-8?B?ZkRJd0orNURXUGsrK0dZazVzMHJjTFA5U0J4NEZIQXhrNFdjWXliWlpySmJq?=
 =?utf-8?B?elJSbUE5bXJoYUtheVFrdHV4ZjhkSUxJTVNtUjRzTU1pdW1Ibk5DODF1Nk5M?=
 =?utf-8?B?eTJobVZ0dmF2WEh5cmJuWGRsblNiTHQyS2owSmh4bXB5S3JqQmRtSGRJdjFV?=
 =?utf-8?B?NlMrR3ZFUGtxQW5SamZFZEQ0KzgvcGhDRFdTZzh0aDB3Vy9nK0phZFNtdzhQ?=
 =?utf-8?B?K3RaVm5SM0RseVY2NHBURmlTaUpxQWFIWkZaQmxBWS9zMXN5a1FCbjN0UTNY?=
 =?utf-8?B?U0ttejJZL05lNUtJdUcwQWZmZGZMNUhobDEwQXNTbldDRWFNNG4vOVJyMEJZ?=
 =?utf-8?B?ZUltR0k2M3poYytXRllHUWNYMmpQUko4Q05mR3ljeGplcVFYbnMyZnNwSy9x?=
 =?utf-8?B?bnkxYUJVQnpZZEg4bmNRY0JYWjlMcytFajRITnE3Tm5ZTHF1SGtaYzVvUWJl?=
 =?utf-8?B?MlFLNFJZb2lpRjlDbkJwQk1lbFYrRDRzeE5pUytrcUFjb3NWdkVBTExQVGh3?=
 =?utf-8?B?NkxPOFZQallqZVZIcXQvcEt4NEowZEdMbkdWQzlLVXNMQ3piWDVUeDFNNjIr?=
 =?utf-8?B?MFZtVklVWWI5eWt3OWRkNmFXM3hLKytjWTVWSFd0c3NuMFlvNFZpdHphdFhU?=
 =?utf-8?B?djd2R3h2L3dkb2I4Sk1VN1NsL0tXNW9CRDRnTjh3cWJYa0ZNNUE1aHErdzVK?=
 =?utf-8?B?ZHh4UVdKNVJ4bk05d1BBQWQ4eFBna0tnemlMMDBERmN2LzF5anhEM3lDWVEw?=
 =?utf-8?B?S1E5eThCZ3FEaUxnRDZ2aFJkcDBSZFJZYmdzWThUUUR3OFJNcitGWThhUUdv?=
 =?utf-8?Q?xVanH7tcmTlso2VvQy5zUVvO1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 808cf51a-848e-4747-d53f-08dab699baf2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 15:01:01.0168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jhrN6rsJtxiRHmDqoz5PFZh+Nx1cj77y+vlAOIGRbdgAXtbAx63Fu7VGqZRPMXUQw3DJX+WwC7DsbX7VQ2hMDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8602

On 25.10.2022 16:57, Andrew Cooper wrote:
> On 25/10/2022 15:44, Roger Pau Monne wrote:
>> Commit 75cc460a1b added checks to ensure the position of the BARs from
>> PCI devices don't overlap with regions defined on the memory map.
>> When there's a collision memory decoding is left disabled for the
>> device, assuming that dom0 will reposition the BAR if necessary and
>> enable memory decoding.
>>
>> While this would be the case for devices being used by dom0, devices
>> being used by the firmware itself that have no driver would usually be
>> left with memory decoding disabled by dom0 if that's the state dom0
>> found them in, and thus firmware trying to make use of them will not
>> function correctly.
>>
>> The initial intent of 75cc460a1b was to prevent vPCI from creating
>> MMIO mappings on the dom0 p2m over regions that would otherwise
>> already have mappings established.  It's my view now that we likely
>> went too far with 75cc460a1b, and Xen disabling memory decoding of
>> devices (as buggy as they might be) is harmful, and reduces the set of
>> hardware on which Xen works.
>>
>> This commits reverts most of 75cc460a1b, and instead adds checks to
>> vPCI in order to prevent misplaced BARs from being added to the
>> hardware domain p2m.  Signaling on whether BARs are mapped is tracked
>> in the vpci structure, so that misplaced BARs are not mapped, and thus
>> Xen won't attempt to unmap them when memory decoding is disabled.
>>
>> This restores the behavior of Xen for PV dom0 to the state it was
>> previous to 75cc460a1b, while also introducing a more contained fix
>> for the vPCI BAR mapping issues.
>>
>> Fixes: 75cc460a1b ('xen/pci: detect when BARs are not suitably positioned')
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>> AT Citrix we have a system with a device with the following BARs:
>>
>> BAR [0xfe010, 0xfe010] -> in a EfiMemoryMappedIO region
>> BAR [0, 0x1fff] -> not positioned, outside host bridge window
> 
> This needs a bit more explanation (even if only in the email thread). 
> The first item here is permitted under the UEFI spec, and exists on
> production systems.  We've got several examples.

Afaict it is at best unclear whether this is really permitted. Generally
BARs are not supposed to be covered by memory map entries, be it E820 or
EFI.

Jan

> The second has only been seen on an SDP, and is hopefully a firmware bug
> that doesn't get out to production, but we should boot nevertheless.
> 
> ~Andrew


