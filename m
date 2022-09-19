Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 953835BCFB6
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 16:57:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408794.651659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaICN-0005tf-0m; Mon, 19 Sep 2022 14:56:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408794.651659; Mon, 19 Sep 2022 14:56:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaICM-0005qC-T4; Mon, 19 Sep 2022 14:56:38 +0000
Received: by outflank-mailman (input) for mailman id 408794;
 Mon, 19 Sep 2022 14:56:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6dDj=ZW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oaICL-0005q6-D9
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 14:56:37 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00077.outbound.protection.outlook.com [40.107.0.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41d8fb73-382b-11ed-bad8-01ff208a15ba;
 Mon, 19 Sep 2022 16:56:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6838.eurprd04.prod.outlook.com (2603:10a6:20b:10a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 14:56:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 14:56:33 +0000
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
X-Inumbo-ID: 41d8fb73-382b-11ed-bad8-01ff208a15ba
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3EaANv2CHxoj4V2/3ffJF1W6d/GwfY2X9kLdoA0M7pGPoTGb3jhcnJXHBTW3LNGLduvUjIZ+yBNIL7MMiJnH8BnjSiF+BXSAeUyz3DN1x1ZyXI+nSmSsBv+SuACTqK3TPJlZFaUfbfcNVIKdU1F8o5sWgJC7Zu4D7Y7iOwGJQj064AvT1QPkIp+flM9VxZygXlDwz6nbMezKEuecLxYhYAFNHhkz9IAumDugiF1i6YsUOCBYflB2DJxYtosSrlQpxqvOXt3tM4u/qXr3J70Tek+Jt+W6htOWaRSby299rGALCAunDswnkO+2aThy9MwY+MS5l1NVF1t+8Np42worA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYa2cO6OR55n+mZdOPe8nbfglTyz7w+xNjEemBx/x1g=;
 b=KA1vl+I5AJD8fU9hDy9+3Fl5qhAFGGCjBqyycExp4OV6fFXTjMGk5VME6cs+sYhrc9dlsV4PPl2ldNJUftcIpzzB/tsKfntqtcMp11/iHsC6HNcUkcgOoPHjYHAgkpn+6/Y5OyfZts1UO0xw1xJbzPKU/5W3GP6fYytD/c4FQSutPGPcqLoeg2/Q+BELwZo9OOg/PzfFlc3uRRBdAc7REPYECdQrf0l7ug9c6e9bnv6q329TiWQy5XVZzFahCsYwapnmfPjGIzemP7YGxNzqU4oGkQG9FKotDNtXopxsAu3NU6DIPVkBkogLp8C40BeOq+sO+nzwR0cWvdKEhkfwXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYa2cO6OR55n+mZdOPe8nbfglTyz7w+xNjEemBx/x1g=;
 b=fKyPCnmOyo53ts3mbMldWqpfd0I71oD23dC4QcxZ3vk/a/iieaMSCQqw8tCIvdFNHnEc9/Y43ttt/lOcIVlbzPgqko3FGazPqouKdqO40x2TO33B4GIU7q+iqfhLFaS83aAloE81g5+Xwz893XNHDzx8RHDhNlMw4yXRhaW/5FUpQ8199D/JarZ5C8lzcwzjkrfqnWMcXmxrQYFxSYuW/Ab8XYKMH5/9TSskJPYC6aoHqGdFO5C42etW6zKQNes+b01KK79EHxuZp5w2BVhgKmRuVca9+MeWKbDTIFBdPqNrpgDTd9H9xGsiR7eR517dLNJQeLk46MPcSO21hx/lnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5d1b06f0-fc20-585e-9da0-fb24c5931ad3@suse.com>
Date: Mon, 19 Sep 2022 16:56:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] x86/vpmu: fix race-condition in vpmu_load
Content-Language: en-US
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org,
 Tamas K Lengyel <tamas.lengyel@intel.com>
References: <8294476a707d7f20799a40479cc0bf9a1cf07673.1663249988.git.tamas.lengyel@intel.com>
 <9fa4a72f-8b38-fbf0-40c7-8fcd6b34cf10@suse.com>
 <9e79155f-0836-1b18-b648-b6e5422e89c8@oracle.com>
 <737386d2-ceeb-ad97-39a1-42585b913b9d@suse.com>
 <CABfawhk+TByRwVvGjv-e6-2UFeO7g6xBz3-CR_QOtYM2_37U=Q@mail.gmail.com>
 <29d29f64-b799-d56c-1292-661fb5127728@suse.com>
 <CABfawhnRUhQAc0cRybz8sLLkxjuZCO6JVA5QYHBERG7gf0zpZQ@mail.gmail.com>
 <406b7f6e-d092-fb6a-d0dd-60a9743027f6@suse.com>
 <CABfawhmrnL1HGOWS1fkEv5X4CwfkrBj-+APJ=hM1GCzzgjW4zA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhmrnL1HGOWS1fkEv5X4CwfkrBj-+APJ=hM1GCzzgjW4zA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: e3b90610-96e9-4b96-7169-08da9a4f2476
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	73TDYTIa5xYn6gBElGCD+DgWzI8I0fGQtOUYgq7U+r+ff6eFAqUA6p/i5md6cYPToTKDWlqBBPyWuxpu5JsKHtuoNBkobTv+cOMVxOKp6tSqjZ+qcETZE//nPYGw4x+k7nT7B1xE9nDR4ze1rydHa/47XFc1wTQ7EV3az9nv/mKWXKkzsVnJ9prP6lOslk3bt66NQTCgtHJEPrk43yPCZED+tBiKGRYYvvA+QhGBDtXYw3MZ/5SSSuQHr5ynBuMimO+TPbVvtGDd75jS403s0yX9qdMQTE4u4DAlfvjfCvKhR9Pq4pPooJNTZRxUxjWPf6vWPtw8Hy0tXrI6xYfbehWrkSA9fhlQEARz93FqQGrMs3ncLMYUD5c9CkU+Eee2Gn9RhBliZDPW9K36JSYheLkRFyEAPOcmynD3Y6Lq9eC8n0KE7Bo2So2PcJQhbbSo59cDqnIaMigTBT4GKMg70bCc3GE12rGypiOaBFsGndq9ZdXShhEmg+EKppqv5GyfEnHBRS1o1PilT8o4VZrECgZMI/elyDH6NaQzSuaQKtoCssd0xa/jCqpR6FRIALu9mu3M6Dr1UB5LRvAJSKVdga7yVQC6ilxReJm/KZvLxDCt4/b75tYQQVDHVFSiNNFmN1yXLjeX+EF28+8a9JpAHlf/K99q4fh5ZREkgkO6525oEhMx9yzruO9FDWv4S4NzwONghg79UN35arP667I4zFQHqvv8QRcypYPJ8Q5fVSHPGOgjyQowUkwgNBKshxqhc8wG7aVAGv2FMmmkWHCqLQTEBjYDK1kvQypHnm8MDFmKyIwLCpbxEzooGThuVOO7mwbG3pNedHzANErMTpW0zg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(39850400004)(396003)(346002)(366004)(451199015)(66946007)(4326008)(5660300002)(8676002)(66556008)(66476007)(54906003)(31696002)(6916009)(86362001)(8936002)(316002)(66574015)(38100700002)(83380400001)(53546011)(41300700001)(6486002)(6506007)(478600001)(2616005)(186003)(26005)(6512007)(31686004)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTl4R09JVDIxZDhRRXQ3RVpZNGVuM1VrUU1qK3R0T1pyKzBoNnRoeXNPVEN2?=
 =?utf-8?B?QXo4RE9QRTlrclZpTUNtdHptVlJnaGVUQU1OT3BuMU1BZXBOSm5TbFptcUw3?=
 =?utf-8?B?VGNYc3djWFBPdnpZdE01QU8xVFNyeWtQdW1kWnNpQUt3SUlCUkhZNWJHU000?=
 =?utf-8?B?elZIZHBPS0k5Mmo0ejlHU3cvNUsrYS9YdE12TjdMUnBYcnMyOGUxcjVhMS9v?=
 =?utf-8?B?SmNSWElMZkNJREtMazZIZ1o0NWZnRmMxR1NJaFJ0MG4xUWVEbWFBVmRKenZD?=
 =?utf-8?B?N3ltTmpSVDlNZWxQeURpTnBCY2tLTlBhbnc5RzlVWS9nQlZLRmo4SkgxUEtS?=
 =?utf-8?B?L1JKYmw1S1pPaXZlRGpDZkdhWUdoRk8yTzNpNFJreGNtUzEwcTM2NVV3TGRS?=
 =?utf-8?B?SytFV0xzMEVSaVAzckNyN1NXZk0wQ01KSTc0by9adjhaNUhmRGpkN0tCTTVO?=
 =?utf-8?B?Sk52UXhiN1BDZ0VKRm9DekJ6MGhjSkhLd1lQbTFadkhiVC8wYnpKYUswWVVR?=
 =?utf-8?B?dTdpNG5mS0xQYkF5SHJkM3Q3bFNGaXdkWER3ckpWeUltT3FaVFU5THZxTW4w?=
 =?utf-8?B?OHhaenNsS2prKzNXUDE2YlFRTTc3cStXS250TzZETmF0TWZYVHBkeDhLaUFW?=
 =?utf-8?B?Wi9ySDRUN3dnektXZ0pucm9jRHZaVDdSc3NMTXVOMGMyQWMrUFJ4Y0svcFNz?=
 =?utf-8?B?ekI4WWRnMkpHeThOWWtsZ3dpV0taS2s1TUU1M3k0WVZ4S0tmV0JGRklBT2xa?=
 =?utf-8?B?dFdWTGVsd2dLeGs0SFZnOFBSbE9pUE5EdDlzT0dPeWdsYWtHSTluNis2d2J0?=
 =?utf-8?B?a1d3a1drTWZ2OVFlRHdQNGxsc3lRZ1hIazM5enVYdmY3T3ByaUhuMVFkVTJu?=
 =?utf-8?B?UkFWUG9wVW52bmc2Sk9MdDdXUCtiQzlMcUlJTG56VlRoSG00TllkOHRmRWxI?=
 =?utf-8?B?TnVQeTZhVy9peWIvZGZ2MTRjelMxdFpzYUJTQkNQQTlFQTYwNnRVSjNtcWxj?=
 =?utf-8?B?di8xR3FZSERnSXR2SWUzei9oSWQ4K2Vka0Nqb2FZV2Vld3pRN3JuNjlsb2ov?=
 =?utf-8?B?UWNqTkpqc0ZwdGoxakdpRzN5c0RFMnBZQVFqVWZtSjhIaVRpMWRldHpqejhF?=
 =?utf-8?B?eGhPaHgwcU90NGxlSVBYVU9STU9hajMvb0ZiOHBzaE5XT3FwVDZ0aUROYnNY?=
 =?utf-8?B?OFJmRHFmZ3ZvOHZzSWpQNG05c2J0ZERPOVZZVUlBNkdaZGdtSVl1RGptN05j?=
 =?utf-8?B?MVM0M1ozdmFzcEdqM3NyU3hZeUNkS1RVMGpQbnZxNC85eStJRXg0bDNvYjRa?=
 =?utf-8?B?aklFNC9POEdUZE1Xa0Y2RWdrUm12Y1Vyc2NhYUxrZ3E3MGlFbzR3YW0yLzlE?=
 =?utf-8?B?KzY3QW0wRXVqL041SDFNbWxQMmp0eVFlbGFENjQxaDR6L21tSHJFL1pHUW8w?=
 =?utf-8?B?NjRiRE5HVm5JbWtrekJwSHZvSEZTbTRNM3FHRHRvaERvamZJVGVITDcwWDF4?=
 =?utf-8?B?REtuU2pYMXRxVW1NK0Q5NnNSS3RyTG00MkY0WjI0VEJ2Q2t4ZHByVW9XcElI?=
 =?utf-8?B?K1p1SFUzN2VJL2pjSjVaT1h6VjdvTGwrVUJ1RWtRVFVCMnBFRGNQNFFJUUpl?=
 =?utf-8?B?RENYclNFTnFNSjBoMmpkU29YTFlXWmVzeENpNVduaGc1TUkxbFlZZW0zd0J0?=
 =?utf-8?B?azhwa1NtUVlmb2xmODNLejh0N01Gd2R3MlpBcmE0cllpSUlRK2VQSmVERThS?=
 =?utf-8?B?QlpXOUV1OUZXdUZPVWxXMnpQWTRTT2hZQzFERmtjaWNRYkZZNmk0RHZ3U0lt?=
 =?utf-8?B?R1hySHZHK29RQ00wVVVxbnpkcEZ0djFOckV0bkpWdFVQWUl1NUJDeDFOUVBa?=
 =?utf-8?B?MEdVZnZlZ2UvU0FlNjZGdC84Nno2cUNyM3Qvb3FucFEvS1luUjFyZTY4R20z?=
 =?utf-8?B?aHJOSERFQUxqV3VQcHNXVGIveVlaU2QxdklzOTVRazJCWXRsNmttM3k0QlY4?=
 =?utf-8?B?S1BCYmhpazY0TlR6aTk3N01UNExDT3QwdFhEd2ZVdVh2SFN3MEJIRmM0Nldp?=
 =?utf-8?B?Skd3MmJSaTRMNGYxVTNSVjNvS1VVSG9WOEdCNURDRGVOUTB4K0k3ZGNGT1F4?=
 =?utf-8?Q?swv99cwwEHnjgRZy3vN4200np?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3b90610-96e9-4b96-7169-08da9a4f2476
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 14:56:33.2901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zId2lAScBtBzt7hLBSuYcYhkCVlT8mK7cqfbg9AVoSmD2OYmLLlJzIGR8y0ijr5vWwC3If1MqsmWwXRba3aEUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6838

On 19.09.2022 16:11, Tamas K Lengyel wrote:
> On Mon, Sep 19, 2022 at 9:58 AM Jan Beulich <jbeulich@suse.com> wrote:
> 
>> On 19.09.2022 15:24, Tamas K Lengyel wrote:
>>> On Mon, Sep 19, 2022 at 9:21 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 19.09.2022 14:25, Tamas K Lengyel wrote:
>>>>> On Mon, Sep 19, 2022 at 5:28 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>
>>>>>> On 16.09.2022 23:35, Boris Ostrovsky wrote:
>>>>>>>
>>>>>>> On 9/16/22 8:52 AM, Jan Beulich wrote:
>>>>>>>> On 15.09.2022 16:01, Tamas K Lengyel wrote:
>>>>>>>>> While experimenting with the vPMU subsystem an ASSERT failure was
>>>>>>>>> observed in vmx_find_msr because the vcpu_runnable state was true.
>>>>>>>>>
>>>>>>>>> The root cause of the bug appears to be the fact that the vPMU
>> subsystem
>>>>>>>>> doesn't save its state on context_switch.
>>>>
>>>> For the further reply below - is this actually true? What is the
>>>> vpmu_switch_from() (resolving to vpmu_save()) doing then early
>>>> in context_switch()?
>>>>
>>>>>>>>> The vpmu_load function will attempt
>>>>>>>>> to gather the PMU state if its still loaded two different ways:
>>>>>>>>>      1. if the current pcpu is not where the vcpu ran before doing
>> a remote save
>>>>>>>>>      2. if the current pcpu had another vcpu active before doing a
>> local save
>>>>>>>>>
>>>>>>>>> However, in case the prev vcpu is being rescheduled on another
>> pcpu its state
>>>>>>>>> has already changed and vcpu_runnable is returning true, thus #2
>> will trip the
>>>>>>>>> ASSERT. The only way to avoid this race condition is to make sure
>> the
>>>>>>>>> prev vcpu is paused while being checked and its context saved.
>> Once the prev
>>>>>>>>> vcpu is resumed and does #1 it will find its state already saved.
>>>>>>>> While I consider this explanation plausible, I'm worried:
>>>>>>>>
>>>>>>>>> --- a/xen/arch/x86/cpu/vpmu.c
>>>>>>>>> +++ b/xen/arch/x86/cpu/vpmu.c
>>>>>>>>> @@ -419,8 +419,10 @@ int vpmu_load(struct vcpu *v, bool_t
>> from_guest)
>>>>>>>>>           vpmu = vcpu_vpmu(prev);
>>>>>>>>>
>>>>>>>>>           /* Someone ran here before us */
>>>>>>>>> +        vcpu_pause(prev);
>>>>>>>>>           vpmu_save_force(prev);
>>>>>>>>>           vpmu_reset(vpmu, VPMU_CONTEXT_LOADED);
>>>>>>>>> +        vcpu_unpause(prev);
>>>>>>>>>
>>>>>>>>>           vpmu = vcpu_vpmu(v);
>>>>>>>>>       }
>>>>>>>> We're running with IRQs off here, yet vcpu_pause() waits for the
>> vcpu
>>>>>>>> to actually be de-scheduled. Even with IRQs on this is already a
>>>>>>>> relatively heavy operation (also including its impact on the remote
>>>>>>>> side). Additionally the function is called from context_switch(),
>> and
>>>>>>>> I'm unsure of the usability of vcpu_pause() on such a path. In
>>>>>>>> particular: Is there a risk of two CPUs doing this mutually to one
>>>>>>>> another? If so, is deadlocking excluded?
>>>>>>>>
>>>>>>>> Hence at the very least I think the description wants extending, to
>>>>>>>> discuss the safety of the change.
>>>>>>>>
>>>>>>>> Boris - any chance you could comment here? Iirc that's code you did
>>>>>>>> introduce.
>>>>>>>
>>>>>>>
>>>>>>> Is the assertion in vmx_find_msr() really needs to be for runnable
>> vcpu or can it be a check on whether vcpu is actually running (e.g.
>> RUNSTATE_running)?
>>>>>>
>>>>>> You cannot safely check for "running", as "runnable" may transition
>>>>>> to/from "running" behind your back.
>>>>>
>>>>> The more I look at this the more I think the only sensible solution is
>>>>> to have the vPMU state be saved on vmexit for all vCPUs.
>>>>
>>>> Do you really mean vmexit? It would suffice if state was reliably
>>>> saved during context-switch-out, wouldn't it? At that point the
>>>> vCPU can't be resumed on another pCPU, yet.
>>>>
>>>>> That way all
>>>>> this having to figure out where and when a context needs saving during
>>>>> scheduling goes away. Yes, it adds a bit of overhead for cases where
>>>>> the vCPU will resume on the same pCPU and that context saved could
>>>>> have been skipped,
>>>>
>>>> If you really mean vmexit, then I'm inclined to say that's more
>>>> than just "a bit of overhead". I'd agree if you really meant
>>>> context-switch-out, but as said further up it looks to me as if
>>>> that was already occurring. Apparently I'm overlooking something
>>>> crucial ...
>>>
>>> Yes, the current setup is doing exactly that, saving the vPMU context
>>> on context-switch-out, and that's where the ASSERT failure occurs
>>> because the vCPU it needs to save the context for is already runnable
>>> on another pCPU.
>>
>> Well, if that's the scenario (sorry for not understanding it that
>> way earlier on), then the assertion is too strict: While in context
>> switch, the vCPU may be runnable, but certainly won't actually run
>> anywhere. Therefore I'd be inclined to suggest to relax the
>> condition just enough to cover this case, without actually going to
>> checking for "running".
>>
> 
> What ensures the vCPU won't actually run anywhere if it's in the runnable
> state?

The fact that the vCPU is the subject of context_switch().

> And how do I relax the condition just enough to cover just this case?

That's the more difficult question. The immediate solution, passing a
boolean or flag to vpmu_switch_from(), may not be practical, as it
would likely mean passing this through many layers.

Utilizing that I have Jürgen sitting next to me, I've discussed this
with him, and he suggested to simply check for v == current. And
indeed - set_current() in context_switch() happens a few lines after
vpmu_switch_from().

However, going back to vmx_find_msr() I find that the v == current
case is already included there. Which makes me wonder again - what
exactly is the scenario that you're observing the assertion
triggering? Would you mind spelling out the call chain, perhaps by
way of the call stack from the assertion?

Jan

