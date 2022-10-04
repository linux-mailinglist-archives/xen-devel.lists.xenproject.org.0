Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 802285F40F6
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 12:44:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415396.659961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1offPS-00070V-Lr; Tue, 04 Oct 2022 10:44:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415396.659961; Tue, 04 Oct 2022 10:44:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1offPS-0006yK-JA; Tue, 04 Oct 2022 10:44:22 +0000
Received: by outflank-mailman (input) for mailman id 415396;
 Tue, 04 Oct 2022 10:44:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1offPR-0006yE-Lw
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 10:44:21 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150089.outbound.protection.outlook.com [40.107.15.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8089e659-43d1-11ed-9377-c1cf23e5d27e;
 Tue, 04 Oct 2022 12:44:20 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7707.eurprd04.prod.outlook.com (2603:10a6:10:1f4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.31; Tue, 4 Oct
 2022 10:44:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 10:44:18 +0000
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
X-Inumbo-ID: 8089e659-43d1-11ed-9377-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mewwoihf5zDBteWoJ9g0jYcuULYKfr/fdmQNB/fPc4Xua5f8dWZS8zPZj7FkW6FDvYAu/HqCBnwdvJ6r9jFZI7Ob5hxl+MsDMUMwJrIgjIj1U84DFjOMO0xUIFORtHayjmfQh6+clsthQ1kZPvSgIhB0IhQ9hDcWHTN8+DFpUjXLzxXF154FVMJYIwGxBTviuqztbxhrrrZkg3Ehmusawb5vjvbb8E52sCus52ka8XlwjhRoRbkpQkmRuDp69b1LuZyK9qrPV8cqzVJjjKjOobNhP23GCtydCq6RoYlBnIp964CbKqofbyEvxkdND//nnengWINHiIl0m8iGjpu0qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4YBV0PSm3u2tu9a6DxVobOOdTzsoMYWl/RRPvnN0sI=;
 b=RQWBaYLybo6OZtc7VT/oIC35nxdL7cap+fGN6yVnhJHNAoFNOKklEshlkuhVtt1WtwU1t1ZMGF9GTvGg0vT8QlgnIEzeghTDXsrmBbrc8AImDzc3K6L7yevl51+zOAToxsWHt0ycgGCpa9Vtu44vVIT6BC5Bb0xe00ZSq5CbHy7bD0k5u3EcR5sG3L5SW3Fc2aIkOshXQr52ITc4gs4dnxN5Gpz7kWqLCzOFx9PNysT2J+voi17T+IchitOvOnEWS2dY06/VOFE8sb5/CyVo8uXQaqR9tHxzxAgBHGUVa98FSMfGCe1RFTNH73Xl0ocFUXDXVD6bUAQIiVOjAKqkeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4YBV0PSm3u2tu9a6DxVobOOdTzsoMYWl/RRPvnN0sI=;
 b=hVRIPJl1tZatmswVtxhtmGpqu4RAA1t8FyRtxnusEap90d94W9O9qEQ0n0/7imsusI5G2Rv7xyT1hH4s27iPWRWEHvDvtxv/XxBSZZn5c+VFo65orZzX7DtNnpOCML2zuY7pAbmPYdrx7XSF8BQhS5rqUODI+1XPBeEsbOLnCJH/iTfya3QYzQfCZd2Y25ErJO/zL7EVFfH9N0XpZiRIa0f/sCvJENEqQUvDU0g0BbEO/KeJvp6UIP2Dv8W/LJtrtaN0CISrtdoJN+YRh62HBQnW8R/XzcFm3A+427HF54UfHP37NukhtinvUteNws6EoYrCySnxjUT7SueDlLepPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <db9856f9-1777-8fe5-5b5a-ef3f132193dc@suse.com>
Date: Tue, 4 Oct 2022 12:44:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH][4.17] EFI: don't convert memory marked for runtime use to
 ordinary RAM
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Henry Wang <Henry.Wang@arm.com>
References: <cc0fbcb4-5ea3-178c-e691-9acb7cc9a3a7@suse.com>
 <Yzb9BDGc45OshRZN@MacBook-Air-de-Roger.local>
 <df0dc3e1-da12-9d42-b652-e33419134d38@suse.com>
 <Yzv92zTdfG748MXO@MacBook-Air-de-Roger.local>
 <19befbce-ac16-19fe-25a0-73678ce440c0@suse.com>
 <YzwNGd0wiAbhDR9e@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YzwNGd0wiAbhDR9e@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0333.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7707:EE_
X-MS-Office365-Filtering-Correlation-Id: fc781da6-23ce-4d55-ff09-08daa5f563c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bJyrXp+4vcjF00zlbMQUm7OT6lf/SKNEcszB9AP08YjvplmZLet+HxkhvxXU7SqJjXB4DiyX3o1hxc/RkKcYF7csbHIIbuX0BnM/rLMfmejCwGeuOR/VQOHB/Q4IiNDf/rtoKAcjw2w4rdXkFOo+GOX+odeCGE6lZMpeeYiOQ7jMseDlAobKM0QdT2aOMj3D133w9mmLDPT75NZ6o2NqlXTHbXplpNs1yps9IbiFHo0KO7NL+awg3MxKaNQWDH1Usz5h42eSHPKMuthJgmp0UTtk/hLwc5grK6PKQd/Td/oSnKfr8SrstsQXR+ASLLQ+BBSVhxvEc3CI42bqom7YkxoDurl2rtq8lKnnu/MFeiGFipqdu70nOl6HWn44sOqXjTZ5lLHb0hbW1dx0yfZNtyNl06NwgeIQVZvRaxC+GUq9YDFJ/V8XchkwKLhDfLfWO2YeIR4Fk8kMpZNUaVou30/bBU1Rhae/LpN68C5Y9QROSaUiEasXLhTGWI6C9cLROemQrgkAOcTEOevFYuVyVhhQhEaLwBSy5mt1XM4Gq2FYRGc4uNO5gwlBKmf1FfyMfJB7yjYjho7XXZrCkG+drYvGd1KJwFSYdIiTZzSZXg1e9p5EL1zSSYkcqN2XTp7SMuRFWGj2IrM4ZVS47NZZi7CKVqsFRXAyfLhZf66meO22ut2CklN0nqnmukLenJNGtVAvw/Etn58QvvEHOid5VCe2wIdzgwwtkyoGzyZENPQ+7pGEVVvXghwK1tnTN6Mf2/R4YzGdgeXMQ57n8MqB8UiQF8LwfV6dpMVd/ETS/0s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(376002)(346002)(136003)(39860400002)(451199015)(31686004)(6486002)(478600001)(36756003)(316002)(2616005)(186003)(8936002)(2906002)(5660300002)(4326008)(8676002)(66476007)(66946007)(66556008)(53546011)(54906003)(6916009)(26005)(38100700002)(6506007)(83380400001)(6512007)(86362001)(41300700001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z09TMVQwaVNsMWxmVDkySEVlaGpCSG5aVW9scno4WVltMm4xMmdhc2VkMC9p?=
 =?utf-8?B?UVZoOFJjZHBxK1gzazlPLzUveEJmT3kwZ3hTL2xONy9KOVF2ZW1mUThML3U2?=
 =?utf-8?B?VDlDU2xwUjN4dVpvai9CQ2dGRG8yK1Nsa1Y0WldiREMzVkxURUl0NWFmdXhE?=
 =?utf-8?B?MFk3WmVqZC9aQ3Arbmt3YjBVOTN4bjNFdi8xMkVkbi9qM0ZkeVlPUVQ2TFg4?=
 =?utf-8?B?ZTQ4QUU0VXpnSkZ6ZkF5MGxCU2Y4UFdWTmNnTG8zYXdiK0RoVG5Ra3crNVNZ?=
 =?utf-8?B?MFZLM0gzRkxRR1lvSTRmU0NONld6WkJFOHFPRXJhclkvOEFaRHJIUWlWRHpa?=
 =?utf-8?B?N3o5ZjM2UHRRM0hNdWRkMlZyZjEvcVBCclZ3YlFGV0pOZ016RG5KNDljK3Qr?=
 =?utf-8?B?MHQydVNLZVlMM0ZFVVBCaTJvWWxwdlhHVURPRndtcDhSYnZIaGRrcUQ5d0FS?=
 =?utf-8?B?KzBDVHZDOXJ0SDdwMXZoRDZYUzBjVTNsMkJHcDlrWjFWTkM5NURJanIzVmN0?=
 =?utf-8?B?SEVQd004dlFlSnhIRmlXcy8rSjNjN0pIQ3BURW1aRGZXMk42TkxnekZTSFkz?=
 =?utf-8?B?YXMxeTd5eDFSMEd0d3llVTBwbkRkM0hzOTl4MDdBdHdGc2NrV2p1N1lCdmRm?=
 =?utf-8?B?ZFh1TjI3NHhOWWdjU25rUnBhdjhkRksyajdGdmFVOHVDRTBONmhESENCL2tn?=
 =?utf-8?B?TEFsNEZrWndWY3pRWEJpWDVBK2pvNE4yOFhLaHVxWEdaODlzNHd2NnVhWlAw?=
 =?utf-8?B?R1MvUG9DS01tVDRQVUk2MUNDa1JlWGFXdyt4TkxicWJUY3ozM29qNDhGOG5D?=
 =?utf-8?B?Z3l2S3RjRWlXaHF6a1htTVlMTnViMXpkZzdSdHBzRkZwWk40WjNLR1luUFBE?=
 =?utf-8?B?Ui9DL1hYdmEySmNBSUMzUjA0ZUdFTDBidUNQbkZLZHdEeTJMeFdDLzgyVUwy?=
 =?utf-8?B?alBYTnVzUG93blhxcXFqMkNHVHMxSW9sWkhEdmtVSm8rNmdYam1sMTlhcE4z?=
 =?utf-8?B?S2IyVzFpVXltUER3NXc3U1ZYTzJtS3lrL3NjK0FKOTdQUlpoQndKcWVPcHZJ?=
 =?utf-8?B?ejBHWWxMWHZqUU5INkpFMmdsdEl5VVdvN2EzMzlBMUFEeFRjRXRYVExCbU1l?=
 =?utf-8?B?b3J3ZjY4aS9NSDA5cmx0dGV0MnNBRjNQelVNYjBzR2FTQnZSS0hvb2VUd3lx?=
 =?utf-8?B?VmtxaGVJeDJUN3d2aFZOR0VkTWoxTTljNWhMYVRMWFJhT3FvR251N1lBRDRW?=
 =?utf-8?B?SHlzN2pXOE55S1hna3YvWUZOUTZ5eWdweHhyK0dNUGFscG5qbkEralAyelpS?=
 =?utf-8?B?RHZsWW1XYmsweWVYdEF2N2RCek1MY0x6cWtoWGhhbnVPbzdxOVZwMTRnMEdn?=
 =?utf-8?B?MEMzQWNqa1h3WkdvOUg4Y3M3U2dlQ1A4ZFk3WjE1cTU3QVByVU9GMSt2ZGxS?=
 =?utf-8?B?dWpnbXpJcDJTQzFFc2Z3N3F0QjNHS0VQREFHbCsyR2kzOUVUcTZGaGtyYmp2?=
 =?utf-8?B?TmtwOXgxM0puSUpOL3ZVS0pLd3hLellGZXA2YjgwK3VWeForY0Q3dkkrZHRm?=
 =?utf-8?B?WlZrUml0ZjNST1pyY0dIWjlzVWhVdmFRS2p3RGlGSXpzbWJxT3FNL09yaDFP?=
 =?utf-8?B?SHUyTnE5Z0p1blBmM3BxeVl3TXE3U1VhTDVEMFFnZTNBaGFqblFpTUZMQjVj?=
 =?utf-8?B?ZVI4OVlaNEcrYlplbUpta1Iwc002amlzWDlMMU0ybFpJY0NDWUdwZ0xacnFa?=
 =?utf-8?B?eEo0V2dYa3BDcWZ5WksyYXZmbUIxeUdob1R0UU1vYzNLc3UweFBXdzZNSU9o?=
 =?utf-8?B?bU81bTdBMVA3SEdPOE5INm1jZmR1ZFA2bDdFOE9pNnV5Z3BMdkRIRTAvdStM?=
 =?utf-8?B?Z0xJUVNPOUpaNk1mU0JmanZwdUVtcGdJZGxWTzg5L25oVEJZajNLMWRwNzUw?=
 =?utf-8?B?OGVBVjI0TTlsWkVNRHVsb0diQ0hCMExNdkZtd3kxRzZmZEt3Ym5YN3Baa290?=
 =?utf-8?B?TVkwT3ZZejFUMm83TDhhTHlXU0t6UjRSV2cxM0ZaUlppQXplSmFtNjJjZWYx?=
 =?utf-8?B?SWR6OVBxdFE5N2E1QzFvMUg4L09ha1d5aXhWVlNndVdNT3VlRWJOcXowVno3?=
 =?utf-8?Q?x+kkLynoiupe/t3EZAPIYunDs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc781da6-23ce-4d55-ff09-08daa5f563c2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 10:44:18.7359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s4qwCjzumPU7Ou0N6DFQ9E2UsGXXmTVYF03JkwZqlAA9NugpgSgvGQf2QARuRWgN9f8q+IJRr6INGIVTchf8Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7707

On 04.10.2022 12:38, Roger Pau Monné wrote:
> On Tue, Oct 04, 2022 at 12:23:23PM +0200, Jan Beulich wrote:
>> On 04.10.2022 11:33, Roger Pau Monné wrote:
>>> On Tue, Oct 04, 2022 at 10:06:36AM +0200, Jan Beulich wrote:
>>>> On 30.09.2022 16:28, Roger Pau Monné wrote:
>>>>> On Fri, Sep 30, 2022 at 09:50:40AM +0200, Jan Beulich wrote:
>>>>>> efi_init_memory() in both relevant places is treating EFI_MEMORY_RUNTIME
>>>>>> higher priority than the type of the range. To avoid accessing memory at
>>>>>> runtime which was re-used for other purposes, make
>>>>>> efi_arch_process_memory_map() follow suit. While on x86 in theory the
>>>>>> same would apply to EfiACPIReclaimMemory, we don't actually "reclaim"
>>>>>> E820_ACPI memory there and hence that type's handling can be left alone.
>>>>>
>>>>> What about dom0?  Should it be translated to E820_RESERVED so that
>>>>> dom0 doesn't try to use it either?
>>>>
>>>> I'm afraid I don't understand the questions. Not the least because I
>>>> think "it" can't really mean "dom0" from the earlier sentence.
>>>
>>> Sorry, let me try again:
>>>
>>> The memory map provided to dom0 will contain E820_ACPI entries for
>>> memory ranges with the EFI_MEMORY_RUNTIME attributes in the EFI memory
>>> map.  Is there a risk from dom0 reclaiming such E820_ACPI ranges,
>>> overwriting the data needed for runtime services?
>>
>> How would Dom0 go about doing so? It has no control over what we hand
>> to the page allocator - it can only free pages which were actually
>> allocated to it. E820_ACPI and E820_RESERVED pages are assigned to
>> DomIO - Dom0 can map and access them, but it cannot free them.
> 
> Maybe I'm very confused, but what about dom0 overwriting the data
> there, won't it cause issues to runtime services?

If it overwrites it, of course there are going to be issues. Just like
there are going to be problems from anything else Dom0 does wrong.

> If the memory is reported in the memory map provided to dom0 as
> E820_ACPI dom0 is free to reclaim the region for it's own usage.

Could you outline to me how such a "reclaim" process would look like?
For the range to become ordinary RAM, Xen needs to be involved. But
there's no hypercall allowing Dom0 to free a page which wasn't
allocated to it. And the Dom0 kernel simply re-using the range as if
it was RAM is flawed - it would break the latest once Dom0 would try
to balloon out such a page.

Jan

