Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9880F6278FE
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 10:28:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443199.697712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouVjJ-0001bz-Up; Mon, 14 Nov 2022 09:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443199.697712; Mon, 14 Nov 2022 09:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouVjJ-0001aG-NH; Mon, 14 Nov 2022 09:26:13 +0000
Received: by outflank-mailman (input) for mailman id 443199;
 Mon, 14 Nov 2022 09:26:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4jG=3O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ouVjI-0001aA-BO
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 09:26:12 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20043.outbound.protection.outlook.com [40.107.2.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c5dbe49-63fe-11ed-8fd2-01056ac49cbb;
 Mon, 14 Nov 2022 10:26:04 +0100 (CET)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM7PR04MB6949.eurprd04.prod.outlook.com (2603:10a6:20b:102::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Mon, 14 Nov
 2022 09:26:01 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::48df:9a8c:c706:36b5]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::48df:9a8c:c706:36b5%3]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 09:26:01 +0000
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
X-Inumbo-ID: 5c5dbe49-63fe-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tas0LWHppEWz14yazVTBgFK9wpYrXX8CSg5euVN938oWgHwW19UKNpXglxhoGKfO2vO6azSkt6+OFEHvi+XI2hd0ZuyLeV9AMSHMkE7H8xvv0S5XiKhw/TmzmjXVi/5S2kd8qwFg3p5Y8912hsS14QkLGI1Cj3eH/6XdiYWNTR433S7USnHe0v04tR4MREk/qjkK91D0Eo39P0ecVQbNsnW5pmNo7V0xVFrxCkD8+awkhub5QmCHM3J03OVvBDQuxf5Uri65Xc9ean4OKFZYb6sVplfcGi4/CBYP4RMtYiGJRyI+vDBRPxPJi8qoIk7X9dsYRmc6q3MW62pSrwKSxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UdAL1XpAjq4WoxGL5qA2Foa6E74MDjQhd1Bmh15UbTc=;
 b=XrjiQ+B3YASVixOI4jYJop//8gSLcyQLx0yyE+lUZQrq+SYKgXSTh9l5KqNli+IchJujCchX05YNkXvdsY32u+L7b8O5lHJtSOUApyURPUCbKP3Y2+BEkc1XnTrrITXSiAOTHu+L5CWi5UJEYRaHtntnS0dfgbizJG1FACjbaxzGGhApZTKbwN/38V4DXeqH8Zl/AYSZ5XkimCb5AoXdEHSBuOUARA26lGPeUwbYwlflcbHjVhFSEkLYjGus2ea68gqiLZXJfWp+zdRkSkqQl2eZhV176FJU7YmE5JN6REdIw+qHc5keNtNhdnWVE+HnFTOzJTSg3ogRz1fNitY1CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UdAL1XpAjq4WoxGL5qA2Foa6E74MDjQhd1Bmh15UbTc=;
 b=iZxBiNtJAih4OE5AvjMd4sDWyAitj3IqJGCPsKuW98X9UeOhQWwAoxI/4NU8G8aCFY7iWHUJxJqUGFc3fb5fHqtpWW+gjh6gwhSUJQx4zGv/6P54MyHeMGv1KcOgHxmrrg+mo+FPm/4hvMb9y6uCL2FzyoYr+ukOKoHR9Lg4kkuVmQ9vLDrOE5bzqukUXEz/BB5M55C+kzDXhTUivbe3PpvHJc73WkH+RVVg3i3l0zZgcosw/IDcU16Grmq37A2bnHjf2S6hYbagshLPl+5Bs9vX4bTiYgNZZ8inIyt1NhiVg0DaLZ2bDQU+cTeYSyayCvv1c5zzInX/IV9NR+7Qtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9ba6748c-ca72-a36a-05f7-dab0334e1a61@suse.com>
Date: Mon, 14 Nov 2022 10:26:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4] x86/xen: Add support for
 HVMOP_set_evtchn_upcall_vector
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20220729070416.23306-1-jane.malalane@citrix.com>
 <1918c63f-0065-b468-3691-de6e314f4374@suse.com>
 <e7341a89-208c-8845-fbab-cb0326cc0883@suse.com>
 <9ab99257-844b-de15-cd20-7cda61295186@suse.com>
 <2476e467-1c31-91f4-1e75-86723b8da486@suse.com>
 <3cd62b0b-a131-b709-4244-0ae694c3d022@suse.com>
 <a5342914-e9fd-60be-50c3-60f29ee27b99@suse.com>
 <7a7553b2-79c1-759d-b020-c75b3118661f@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7a7553b2-79c1-759d-b020-c75b3118661f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::7) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AM7PR04MB6949:EE_
X-MS-Office365-Filtering-Correlation-Id: 356affbd-f89b-4bda-f56b-08dac6223f15
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iAyfDQGRL4LpyqrCAuWebfaJHJ/hsWw9kV3rJj3ldYfWt9/IT5+5gE5HvaJitBV0erVeV7jQ8j7i2Rwj30yAeR9AivbcKVyxKsxeQfBxz0PP1eKuaJEXB+LvGJO3PzSV2rKlr4VjJmiZMTAIrqznBwKvBOCRMctnosWIhxQI9N8q+ljqDz4zHQ12h1L2ggKA2Fpy+NS43/bpKjBz+LEGtP83JoSFbRRjMvRF+MXWTNGk/Z+kkzkOsCDoSWkWodM6BZZUIfiPXopBRVvezkSuwOCqDCneAsoWV/CnmhIwIVlATiIbQRr+aR4E+OjgsisKvTWZo8F+AAlGdJHCXQA6nCxBykq0XTjNbQUeYfNafOpr8+lHSqUYatrgANrHS2K9P0MPVbEMIS2h3bPmkEXf4DACqX+uu2BC8usNToszczI/5CDL6NopCTUZi7hHnPamF0wopdBTw3/TY7sE9hqdLV9dCqP8UoSpgm8n3tsD+hrtp9FYIdvBO5yLrr3VBk/SNhtsQhoueAzYSGsPVxdrylsiep6yLVIcJKSQ0ftn1R3sQDh+AfkAwTycBG4jWU+7LhNyq4NFlQ1n/NUZx9oXutmvOEo/tOWhSTVOL2Lc5KMlg+hhHGdd6fyQpvulK0c5wufxa+qJcMwL2HU3F3S2RzVSB2i1QGCjbgc5ww8v9wHnaqA8pWljDNn7gJyr47wY6nAWcnc8pkWsIS49X15XQpR8kxCnfg4HV7oM1qfpLqScLAKlrr2Kjsv8goe+TdTnRtc/xQCql/vpBXFtvzAfwBrxF4sgBIxXOW1sEBADHLY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(366004)(376002)(346002)(136003)(396003)(451199015)(31686004)(6486002)(6506007)(478600001)(110136005)(53546011)(6512007)(66476007)(66946007)(26005)(66556008)(8676002)(36756003)(2616005)(8936002)(41300700001)(4326008)(2906002)(5660300002)(186003)(31696002)(316002)(38100700002)(83380400001)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjRTcUdVWUVnUjlyNjdEc0dXckx2c21jc2Z0RytIWTRma3JnSndqWVhkcCsr?=
 =?utf-8?B?K29ubmc4OHBUOUwzeHppaGUrbVRFMEY3UDQwM2RpTnpQaVlCUTRXVXRkQmhh?=
 =?utf-8?B?QzA5ekdGUkpKL1M1SzUzK0NPTUtxMzdkS1liUUUydjJwbzA2VWZYTmRzV0ha?=
 =?utf-8?B?cUlSZVdOOG9ldjZiOHZqK1lTT21vRVZlWEh0UlE4Wm9jMlNKR0FVL00vTnZn?=
 =?utf-8?B?eWI5MExHVW9GU2YvSmNHWG1NT2ZSNmFSUXU3UlNCTU5KaGZiSnJZL3p2QkEz?=
 =?utf-8?B?dGQweFdiVU1EU2FHQklJMDEzREdGN2trYUxqSU5BcDhnNFkyblc2eXMzSCt5?=
 =?utf-8?B?V2FrWjlFSkxSZGNPR2tUbUZKZnNXQ1JNTVo3ZjV6Z0VkS2o5d3B2cDR3K2Ji?=
 =?utf-8?B?VlVIKzNNY1htcVFpcjFOcXZ3ZkhWOTdwL2NrVy9TdTFNb2p1UGttWk5KVW9s?=
 =?utf-8?B?QTVobDJIZUdJYSs4bERkcXJFaTBhNHZLb1dMSTRpOTQ5SUIyUVNHWVd3bUJs?=
 =?utf-8?B?dUV6eDdQWEI2RHlaVXBDVFlXT1M2MmRqM05MYm03ZWxJd3ZNbzI1dUp0VXk0?=
 =?utf-8?B?NnNjNjlWZmVhMHkzSDBhaWxUSU9NeW1xSWgyZmhwNm5PaFhsc3JSOHh2VWZF?=
 =?utf-8?B?Y0tOZ1NqRkJRNWJrNnZqN250YUxqY2JWOUdEK0U2SUUzZnlYZ0xSWHFWMFlU?=
 =?utf-8?B?MVZ4c3RIN3dKdUZDTVRoTlduSGFpUlVpRHpxS1MyMmU3MHVkMjYyc1pWUEU4?=
 =?utf-8?B?NXliaWFKZDVuN0dveksvZTA2Wk12SGZJMmkyMDdpLzhkSU42aW5DaVQ3VVNK?=
 =?utf-8?B?bHI4N1I1cnVGekllM3ZiZWNOZytONW4yUGZNY3N0M1ZOeTRRYXM5VnhXekNh?=
 =?utf-8?B?QzNuL3BsYXNPWFcxSVB3WFp3UXVKNjV0Qkl3VEQrUFdEcnFQL1FIcTUzS1VW?=
 =?utf-8?B?bkJBSlJjcXBhQXlwVFEvWFZ5UWJueklRQUtZeXlJUHNyMUhFa2dzMGsrUnBF?=
 =?utf-8?B?ZFFCbzhpR09Lenh4WFRUbjJwTGlueHhXSSt0bXBFeW43ek4vUEhNSnYvVTJx?=
 =?utf-8?B?aUVveG1BK3g1anNZbEtrb1M2ZUlaMTZTUWpSODZmWWlsMkRCS3dXbVppV1hv?=
 =?utf-8?B?c0NKK042ZitiaUt3Tk5yVHNIdWVaVVJFZUxkQk95dloyVXlqZjhnMmdVMFFO?=
 =?utf-8?B?RENYWDQrZzEzY05ON1ljOUk4Szl5S3IzNjl1QVpKMWUvWjY2UE9Dck0vVjZI?=
 =?utf-8?B?SmR1cndNQ09CRzNzV3dXZWhlR1grQVF3aU04akVlanpLWmpaQ0JPMVFTV2Y5?=
 =?utf-8?B?WHp5SXpuQUdJY3NvRFlGR0R1bE9welhybm1PdHVaV0hDZlZ6SlhQTHQ1Nm13?=
 =?utf-8?B?YXdPN0t4YWp2R2pIN1hiTzZSc2Y1V2ZhejdlNHZYTFQ3cjViRXNsV3M2MTVn?=
 =?utf-8?B?MHUxQzlSREFPdnV5K1M5NXRjZW5lbUVNc0tMZXJyT0I5c1pXTDh3RURkZEdo?=
 =?utf-8?B?Ym13VUFqRnJwS0ZheUV6c0JZR3QyVnF1NmNXQ3p0d0NZNGpqYk9sU3hKOWph?=
 =?utf-8?B?NHl0U1h5NUVORk9TRHFBdHVWZ1pFZkNnSVNQVGxRcFBtSUlpbWh0ZWlCS002?=
 =?utf-8?B?V2psSlpQNk9IUlUycENjaFFlSUliUk54Mkl4cVJxN0EvSzF1NndJVDBPUWxU?=
 =?utf-8?B?a3FtMHdCWTQyWkdHd21FaGF6VzB6bDZkZS80SVVkUUdrd2JxUVFpMkZzMjQ4?=
 =?utf-8?B?elRRcjN2ZjFTMmovL2VhcGczZm96cDRWMTNhWWJrektDa2tRWDMzRlFvd0Rr?=
 =?utf-8?B?UEw3SHAxeEhVVU40bjB3eGNoY2c3ZEExK0MzTUFodnVwZGhOMWZ5Y015N09x?=
 =?utf-8?B?ZGRLL0NjcXBRRW5uRDVNaWtON1ZJaDJ3dTgzMzV6SWlNVjNDWlcxUzdma2E1?=
 =?utf-8?B?aHJ5aUplTmtka0dLSnZ4L0VzU3pnSjE4VHFTdWdVcWJTeEFOQVFBYXFaOEVZ?=
 =?utf-8?B?bU1QbHoza3RpcGFJbHJzdEpTNGxibnlkZTloT2ZEUzBDWWdvSGYvZk1tYnVY?=
 =?utf-8?B?dTNTL1VpWjZEY1BEQjU3R3BVTDVhQVNoOWhUTHcwMjA2M2JjZlNXY25Ob3ky?=
 =?utf-8?Q?mxyi4PctF5Tg7IDCqIHymD1Gw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 356affbd-f89b-4bda-f56b-08dac6223f15
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 09:26:01.7500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X5xgP2R+5ZQM7flswYsn6L3czrDL+aCu74SlKukyNt1lkgrMtxBvEAVHHScwB7qpmrLyUf2KVGgSpirkQ/Pxlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6949

(shrinking Cc list to just xen-devel@)

On 11.11.2022 15:50, Juergen Gross wrote:
> On 11.11.22 14:17, Jan Beulich wrote:
>> On 11.11.2022 13:44, Juergen Gross wrote:
>>> On 11.11.22 10:01, Juergen Gross wrote:
>>>> Writing a patch now ...
>>>
>>> For the APs this is working as expected.
>>>
>>> The boot processor seems to be harder to fix. The related message is being
>>> issued even with interrupts being on when setup_local_APIC() is called.
>>
>> Hmm, puzzling: I don't recall having seen the message for the BSP. Which
>> made me assume (without having actually checked) that ...
>>
>>> I've tried to register the callback only after the setup_local_APIC() call,
>>
>> ... it's already happening afterwards in that case.
>>
>>> but this results in a system hang when the APs are started.
>>>
>>> Any ideas?
>>
>> Not really, to be honest.
> 
> I might be wrong here, but is a bit set in IRR plus interrupts enabled
> enough to make the kernel happy?

If you add in PPR, then yes.

> The local APIC isn't enabled yet when
> apic_pending_intr_clear() is being called, so IMHO the hypervisor will
> never propagate the bit to ISR.

What would suffice is an interrupts-enabled window between the hypercall
and apic_pending_intr_clear(), like is occurring e.g. in
timer_irq_works() (which is what I was guessing might avoid the issue
on the BSP).

As an aside - it may be the hypervisor or hardware, depending on APIC
virtualization capabilities of the latter.

> I didn't find any specific information in the SDM regarding "accepting
> an interrupt" of a disabled local APIC, but maybe I didn't find the
> relevant part of the manual.

Indeed much needs to be inferred from how things have been written for
all the years, rather than being explicitly said. This specific aspect
is probably worse, because you can't really infer the behavior from
anything that's written anywhere (afaict; or maybe like you I haven't
been able to spot relevant text). The section that's looks to be
supposed to have this information is "Local APIC State After It Has
Been Software Disabled", but behavior as to IRR is only explicitly
described there for things already "in progress" when the enable bit
is cleared. I'm inclined to infer that no such processing would occur
afterwards anymore, until the enable bit was set again.

Which raises the question whether in the hypervisor a call to
vlapic_enabled() isn't actually missing from hvm_assert_evtchn_irq()
before calling vlapic_set_irq(). If so, a Linux side change would
likely be unnecessary. The problem then is that if an upcall was
already pending, it would never be delivered to the vCPU (since
vcpu_mark_events_pending() is a no-op when the pending flag is
already set, even subsequently arising causes would result in no
further signaling). IOW adding the check there would likely need to
be accompanied by a further change elsewhere - e.g. adding of a
(conditional) call to hvm_assert_evtchn_irq() (or directly to
vlapic_set_irq()) when the software-enable bit is set by the guest,
much like we already call pt_may_unmask_irq() there.

Andrew, Roger - do you have any thoughts here?

Similarly I wonder whether that call to hvm_assert_evtchn_irq() is
actually necessary when evtchn_upcall_pending is "false".

Jan

