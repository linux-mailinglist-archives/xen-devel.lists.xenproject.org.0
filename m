Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C97125B9D7C
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 16:40:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407452.649990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYq1g-0004TV-CK; Thu, 15 Sep 2022 14:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407452.649990; Thu, 15 Sep 2022 14:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYq1g-0004Rh-8t; Thu, 15 Sep 2022 14:39:36 +0000
Received: by outflank-mailman (input) for mailman id 407452;
 Thu, 15 Sep 2022 14:39:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EMZS=ZS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oYq1e-0004Rb-Po
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 14:39:34 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150040.outbound.protection.outlook.com [40.107.15.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36d3d0c0-3504-11ed-9761-273f2230c3a0;
 Thu, 15 Sep 2022 16:39:33 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8869.eurprd04.prod.outlook.com (2603:10a6:10:2e0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Thu, 15 Sep
 2022 14:39:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 14:39:30 +0000
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
X-Inumbo-ID: 36d3d0c0-3504-11ed-9761-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JTmCdjUTgbSPElaMUWTasffHGgQgLop1F+OL0Ap7oRju8sLLqStpHTiEcyXcnW6ZchEbBjeZGxiKse8QvIiVW2VFj7WPH+4E51TtfCZqXx/vb915g5hCl5h0Tb0MwaWjFgQrII/uTeC/GCZn8LAZOK1rI/5AbHjEt8thZNBqf7c4Hw2myl2goEUNyX/UaySimb6gYy0+2SLIPXaHfdasRpLf2bDoR6KkEizgJF7mo5XOlfsiuVIJ4yRQq7Tkd4ho6gM0JwFRmMN37WHcICe5muJhxqgutrGci1FM4Ips+9sGvQ5g9x0F7sXIRgFJmVGa7U/KJcy0BlvEUsD4+P47tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kl7CfccAFIRqJWKpcv86uiY+IlhyONP2g04JkSvjdZk=;
 b=MXh6/THH93Y8v7HFJ8oK/DW31rLE6kCLOWaLeb9taVFk0NiO+jMU1vOXaXGCl7dvD5uct6Mot0eYyvLBdLE8H88pdxPhj4KY3vXHbf1dq8MqPmJ1SCX1WNnz8hVsMk+EKHVdDEY/pnSWrNuWz3aLdjTZzEiWMoh5jgfM1wWqTkPVcwpnFM6Ca5n6h6FKvbGApZHjK/U9uDUVE3yJZQB1Ba3Ap1B/zmZbU6ek7PGyNF2ZxL7NvsGeHQqaiNbghLoZl8a0E57pslRsgRXgVAV4THIYLsI5KY13/4erTNWucRHGO8so4sFr6vEo/KSfbTeud1mTSb7rxjbd4p10IrEAIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kl7CfccAFIRqJWKpcv86uiY+IlhyONP2g04JkSvjdZk=;
 b=YexeUztDJ9inXyE+1B9jWfNTxDrynFLkfNy8i3dmtS+052mkNq257/GJME8ICmhOn3IdZXEhIuYCIXZ04p+0LJOWLAuATnl6cnDZzbPeMcNqQ7SwEA98UJWboZwKU3DrHDui0jBg8GEYzhv8JqfoTtHvZCagDxoxl4ZAZkRNV8Di5QIpBBBXLs7auNaKBMbrOLcRzFDC8tuFgwVWVb4f6NYeMaTj5JXK8L2RPhVp2q679Uw/5HHZYLiZY+lNUHa8zgKItu61hzJJLEjJ+219oSfp3I1aE9t4iOftZbRk8o2karh4kwoZxEF5IQGrtqi8KD9x1kQw0161XI6tWYelFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6bd99d37-f9e6-647a-6e2d-d774fcd597a3@suse.com>
Date: Thu, 15 Sep 2022 16:39:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Console output stops on dbgp=xhci
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <CABfawhmXWouFVRVrtX82Dh+8maaJqnDSDL=Me7_fzBGdM4oE2Q@mail.gmail.com>
 <YyJOWDWYVpShtAU9@mail-itl>
 <CABfawhnLzmBLjeVGAFVMy27MCGMrddaic_31FvuJ3sCevsvXww@mail.gmail.com>
 <32e97d9a-a5b6-05bb-5cb2-bf9a1461c851@suse.com>
 <CABfawhmdja_qkomOq=8HLGAW1MWA6rcG=Aqo+frM6eYrgUYkSw@mail.gmail.com>
 <7adee56c-607e-7d3f-8aa6-1ee5b2fdd133@suse.com>
 <CABfawh=y_ACt-YAOOxiLVQoHGJZ_K8Axt4TyXMAaRpT9cYmJyA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawh=y_ACt-YAOOxiLVQoHGJZ_K8Axt4TyXMAaRpT9cYmJyA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0324.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8869:EE_
X-MS-Office365-Filtering-Correlation-Id: e5b18618-cad4-4c6f-0cb9-08da97281937
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yqaFidAWl+1S3eAWNHwFt9QsbgeW4ZzNNnPKcQX2XpB7OIe2YCfYiSJgH13UIhuqksboKXj92hr7zuEyqt3B8YD3zayC/sh2MdzsRMQGyDK9WlsG0A9rrm/b1yWEiJuQjbvPAgbXh9jgT92G+6NKaWksVrzaaMuMnpdJcdZMoOIGypVv1Ip/fFP2Q0pkDlZPUv+xUPzZiB345GTgy6i58MmwC8SYmZizlYF7IzZC0kH4bP7frw9abznWtUXdL7au3287yzvrgh91BqsF/ZZWmJgHgEAzKPXJ80vlFA2ERglv+Zj7oo2r2fN0Ddxwsv7gNynJbAWMZMpgYk9xnRRPBzq4Lr2qMgHuiAlaJYQ/GN94qbhHWpWaKZUnZjLHzDhXeGarCHiXiqk/QnQXUfdVVD5A3zrGE9HYF0OO8EWE6zCf4hitu3D9Xhde1rmdOL35ctBnMBhEJgNMItOB3sN96rmjz4aAHHt2y51et9Ftii/3UqScVHF0F6kyJa0YkwV+AxoD+0+JK8EGUndQv3PgyKD+S0Q7E3EMtoGjewiHGn1O0VPHh4Obw9KiHv+YC6q0RfNe9bC8zmLT6u8Uf7s2q80NX36hq4xp9iXHLBToLDKNaTiTU4L8nIOd9h4icfyBE1LFLQFkS61WIZM97T3bhAE8zFWGPo6AcO63/riusLBT9pblDgP48OIOpv5X5uLHzkOtbMdRYNJBWUUHNO0XbccwI+IfsaCJ+EzCp1fXWyf6MLw64h6Jcu+7ngZ46fYxOAbPtibe4qRftYxRuvJr2vTtopRjLiI5og3B95Hmaa4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(366004)(346002)(39860400002)(376002)(451199015)(6486002)(6506007)(66476007)(2616005)(8676002)(31686004)(31696002)(36756003)(53546011)(2906002)(6512007)(186003)(54906003)(86362001)(83380400001)(38100700002)(8936002)(6916009)(66556008)(5660300002)(316002)(66946007)(26005)(478600001)(41300700001)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3NtdktiSnNvdnlQczdPb2E3bVFhdG10NENJWWdBbmk1MktNK3FjYVg4Tmo4?=
 =?utf-8?B?YWk2ZnpidDhNNGs4ZXV0VkQvSXN0V1FKZlN1NzZRZEs0UWg2U2Fha1liR0ZZ?=
 =?utf-8?B?eGh0RllzVnlhWEVRRVRJRER5QUJaK2NJa0RISStzbkdCalo4V3FYU2ttMlJ3?=
 =?utf-8?B?SHc1MCtleUN0R2RpdmZqc3p0cnpzd2E5cW9md0lBRy9UQ1ovdUxsOWhsWlpK?=
 =?utf-8?B?OVFYSFlLVW9hWmk1Q2NzU3VoaWdSakM3dXM3ekc4dVFyMmN2N2hVdUlUQldH?=
 =?utf-8?B?WnFna2xSdjFuR3VYMC9MM1JPbFIyeWtuR0tYU2hJelpLOHZ6a3RUSHhJTXpJ?=
 =?utf-8?B?a1JoR2p0MW1LRTBVTmhIL2VaT1BTTFltSmltcWJUMitlQWFpTkVBZWptSXVp?=
 =?utf-8?B?YTZnMFRIa2lNQi9VRFByWFNubDZJakdhMUw0TjVpVTFtOG03NjI5YlNYdUF6?=
 =?utf-8?B?bUFoWmRJWUJvME5LNE9IRTJrWlJqbVo1dnNZQzlYSjBIcFRFUklCcG95ZUpk?=
 =?utf-8?B?aVN5VE1VMzg5Y1NYRVBOWkNnZW8weHR5VkZMTXFDMDBRdGtpREJlYU9MR1Q1?=
 =?utf-8?B?TGROZE5aVUt1enl6QXlydmtxZk5vOGkyUTZmNFpycG1CdEU5ZFp4em5sVlJH?=
 =?utf-8?B?OW1wVEVhbURscldTNXk3SFN3ODZhMEkrNzNPenZPditEWFUyY2svdHhZRWpl?=
 =?utf-8?B?dGR6K1lPRXJGQU14bDU3UFF1M3R2V1JTRXNoTVdGdHNoSmw2Z2s0aGMwdHdW?=
 =?utf-8?B?YnNyNlBZZVRyUjNSYXRKdmhjUytoOHNqNi92U1dqUFQ3Y3prTjVwaVVKOFE4?=
 =?utf-8?B?WXNyUmhKMEQwc1QyYmtkYjAxOW5RT0xsRU9tTFl1SGMzcmgvZExmLzMyRVRt?=
 =?utf-8?B?QTVqUVhOSEIvb045NU04MTQ5TmM1VExaR1BndDg0alFQU05zZkQ5a2VYcEI0?=
 =?utf-8?B?SVkreDJ3aG1nTUxTZ21URjk2Q2g2SGYxSkg0WEl4VGdHM01CcGF2Qi9xeGU2?=
 =?utf-8?B?QTAya2pVY2ZIRUY3aHBrWHd2UTZ0QmFZWFB0NEE4Q3QxYnFnTmNrak9oVEU2?=
 =?utf-8?B?Rld1SGtIWVJ5d0hOdU9BVTZqR2xyRm55dEtQbGlCMUdQZ011ZjBQMEtFTWxV?=
 =?utf-8?B?T3hIUENxMnMza0cvdWozU1pjOW9RZkZodlBJTjZBQkJFVTJhYjgvUWRvd1l1?=
 =?utf-8?B?RkZZdnJXbHZYUmtUYWY5ejV6RHYzS1ppaThPMzU5UXdWckExeXFJWlpTYmZZ?=
 =?utf-8?B?U0xkaWY2eWw3S3RpOEgrZlNmbHlobVd2UXlTV0RyTHFRdWM0amhkK1VqVTJG?=
 =?utf-8?B?Q1FLWmcxbnVMbEgwZEVDQXRNTTBsVForTzV1RWdRZ1BRWms0NWsyTWlnWWZp?=
 =?utf-8?B?Z25sZ2h6eEQ2UHJET1BSUzVqREpQc1hIejRQdGJWenQ2UTZGMWg4Vms5bEFW?=
 =?utf-8?B?ZzM0VHl3TTBRWURkVlE2SkdyMGcxakJwZUZTR1pycCtNS1haOVRDWmJOQUl2?=
 =?utf-8?B?b0tDVUJTU0Nodk5zQ1UyekYwT0wxaERBd21sYng0UlNGZjRLMkh3MVFXeXgx?=
 =?utf-8?B?R1EyVzZQeFMyVUdyMWZyZmFmNFpEbjc1Sy84VmFGbGFhdWUxQVlpZXdpaDZv?=
 =?utf-8?B?NHNvU1ZINmo1bWRyT2JiWTIzbzgwdStkRVo0ZEdZTm5LdkxlRTAreGpZWjlP?=
 =?utf-8?B?RDR6emFiNmF3U2tZSVYwWTdYaXloQ0hBelpRdVZZQzVJLzRqODVOeXZ1TUh6?=
 =?utf-8?B?Z0JwY1hnUTd2UDZnamltR3BRNW9XU2hxWmtrblFaUnNOek5EYXVrT2QveXRj?=
 =?utf-8?B?RWJvMDFrMmVJbW9HWm55c3J5dloyUkp5anN2YTg1L0dGeVJsVnJQdW5aaHg4?=
 =?utf-8?B?WHNTZmNWd2dRajhzR2REMXhDOGpsZXh6cTNhc3RxTnc3eWdnL2ZRVkdOSWVy?=
 =?utf-8?B?MVlVczRwK0hlMDJLWmdWODJUalM5akZ1V0pJbS9NSjFlbHNualVqR0lqQ3Yz?=
 =?utf-8?B?WHpTZ3ZFNkNLdmdjZDZwb3NCaWxtMFZEODdKeFhuZ2kvQjJsTVJ4K0wvZTQv?=
 =?utf-8?B?MEF5UnBURUJJcmFzdGFKL0tYM2tnS1VkRjA3RW5tQ0ROZGVhRVo0S0w4R29T?=
 =?utf-8?Q?7JBkroBTbWJR596g3NRsyo2To?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b18618-cad4-4c6f-0cb9-08da97281937
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 14:39:30.5745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q0pmenFMFtpGxHjdaHs6VZqMpjwY96CZkXmk0kjRk7yWIj9bBrtrtiEEVxQKD81nI/3C9X/dDeTB37xNCc9s5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8869

On 15.09.2022 16:16, Tamas K Lengyel wrote:
> On Thu, Sep 15, 2022 at 10:10 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 15.09.2022 16:05, Tamas K Lengyel wrote:
>>> On Thu, Sep 15, 2022 at 3:56 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 15.09.2022 02:41, Tamas K Lengyel wrote:
>>>>>>> Do you have any idea what might be going on and preventing the output
>>>>>>> from showing over USB3 afterwards? The /dev/ttyUSB0 device is still
>>>>>>> present on the receiving side, just nothing is being received over it.
>>>>>>
>>>>>> There are few more patches in the series that are de facto required.
>>>>>> Especially those about IOMMU, otherwise it can only possibly work with
>>>>>> iommu=0 (which I'm not sure if even is enough).
>>>>>
>>>>> Unfortunately with iommu=0 Xen doesn't boot at all for me. I see this
>>>>> on the console:
>>>>>
>>>>> (XEN) Panic on CPU 0:
>>>>> (XEN) FATAL PAGE FAULT
>>>>> (XEN) [error_code=0011]
>>>>> (XEN) Faulting linear address: 00000000328b3a54
>>>>
>>>> Perhaps in another thread, could you post details about this? I guess
>>>> we want to address this independent of your XHCI issue. That's an
>>>> attempt to execute code outside of the Xen image - the only reason I
>>>> can think of for this would be an EFI boot services or runtime
>>>> services call, with (possibly but not necessarily) quirky EFI firmware.
>>>> Any other context this is appearing in would quite certainly require a
>>>> fix in Xen, and I don't see how "iommu=0" could affect the set of EFI
>>>> calls we make.
>>>
>>> This was indeed observed with a xen.efi booted directly from UEFI.
>>> Beside the limited boot log I get through xhci I don't have more
>>> insight but happy to send that (and anything else you think would be
>>> useful).
>>
>> And with "iommu=0" but no use of XHCI it doesn't crash? Or there you have
>> no way to collect the log then?
>>
>> In any event, from your description the interesting part might be the
>> EFI memory map. That ought to be pretty stable between boots, so you may
>> be able to collect that in full via "xl dmesg" in a run without "iommu=0".
> 
> I see the same crash with no xhci debug use. The EFI map is:
> 
> (XEN) EFI memory map:
>[...] 
> (XEN)  0000031f72000-0000032a95fff type=3 attr=000000000000000f

This is the entry covering the address, which is EfiBootServicesCode
with no unusual attributes. Assuming the crash was still during boot
(of Xen, not Dom0), do you also have at least the full stack walk
from the crash, to know where in Xen the call chain started?

Jan

