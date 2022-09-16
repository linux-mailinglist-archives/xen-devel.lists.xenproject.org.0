Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8B75BAD9D
	for <lists+xen-devel@lfdr.de>; Fri, 16 Sep 2022 14:54:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407974.650666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZAqB-0004F6-0A; Fri, 16 Sep 2022 12:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407974.650666; Fri, 16 Sep 2022 12:53:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZAqA-0004Cr-Tc; Fri, 16 Sep 2022 12:53:06 +0000
Received: by outflank-mailman (input) for mailman id 407974;
 Fri, 16 Sep 2022 12:53:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCzl=ZT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oZAq8-0004Cl-LH
 for xen-devel@lists.xenproject.org; Fri, 16 Sep 2022 12:53:04 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2077.outbound.protection.outlook.com [40.107.20.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7edb0a7d-35be-11ed-9761-273f2230c3a0;
 Fri, 16 Sep 2022 14:53:03 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7042.eurprd04.prod.outlook.com (2603:10a6:208:1a2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.14; Fri, 16 Sep
 2022 12:52:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5632.016; Fri, 16 Sep 2022
 12:52:59 +0000
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
X-Inumbo-ID: 7edb0a7d-35be-11ed-9761-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=agOuRW/9IhIFQSevEYdRVuKVYvTj4wl1OwUgCSDxQKELbiHmoTQcOyO3QTpTnI0kKx3f6b4tCYl8X/RWaUmI8FwAVDktJetzJ0VPAacacf9fYnVCsVLfH+yIbR6p+tbKO3GxBRr8L+CZM4WMieEHdSiU4fqXEAzGiOSajt+/sc8N9SSGNgi6mEnarasoZilOcSGv1FGKjR7HdqFNyhdpGPvhT9QGI9hjrQ0boRJF7Nl3thwzxaA01o8+jz/pbP8oAg1vKwjDc65f5S5/8ie7J9fa5nnkYveWPGk5FbDbZXB8SxzsEcL9vWHNI0O+bg+RaGK8U5FE1imM+cnij86nbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPA0VsTyaym7mRLLFMQiZ3Dvj3gi9SUOgJRwrtmv2jY=;
 b=ZOTFGqkwHwnduhyx0DFL5I6RyQMxSpwzMvF16MNgkoRgXt4KASono+v7kcUWYihEUc2JVBBNqwtNQTBF/mtkP++5VoAbeV5M8f0tYmZAvR+25VIkADFc4kJ+S/Sf8HpJuP+9HTkzDIYLgmUx3+6xd/DYX9+wMwfggC57HlyLs97utSQdUUcxsb7brWuCwMBqMEC/UBEdA8VkqMpDCCBa6FQvQTJ5BKRzJjsoF1lPRZtfPYrk4W59YUXTwsXGzY7mD5VaF2TtIHWKiBXRugF5R0lCmtu0e41NUbGTe2ErTqV7siwEatj4zKg+E/AZzIueUBwv+6SU+dD2G9YTJ3V4gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPA0VsTyaym7mRLLFMQiZ3Dvj3gi9SUOgJRwrtmv2jY=;
 b=JvBG0QoAPa2SQCx/ETFWdvcWneGS7pwOCPM0OQntYewhzmVaN9wVSUFW6sxnrdtQ7unDAONy93BfpTeK0Cs6eo0S+6B7yGebVtMLYBk0N8bnPotRqTmaG3n+LMsZ5QVB0iQhix524b3Waap5LLtNc7kehrYg7VuxpNpaMyXUs4RyqVeeN1AYiJ36UmJCxgT5yqp4M6YhfpdT0Ek8b/B5GMOBaP2VbhuVxnNOe24pwYLJg8ON34iLaUpNrGRCOku9IfgU/j3I1Rn+AZeeonIwSUXXGxXnFOKop1natQIYsEwU7UBbiEMldpsbFm3WSMA83I5dsZswN3b59kpPqkT12Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9fa4a72f-8b38-fbf0-40c7-8fcd6b34cf10@suse.com>
Date: Fri, 16 Sep 2022 14:52:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] x86/vpmu: fix race-condition in vpmu_load
Content-Language: en-US
To: Tamas K Lengyel <tamas.lengyel@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <8294476a707d7f20799a40479cc0bf9a1cf07673.1663249988.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8294476a707d7f20799a40479cc0bf9a1cf07673.1663249988.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0415.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7042:EE_
X-MS-Office365-Filtering-Correlation-Id: a36387d7-9d5f-4885-5836-08da97e261a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1c6Qb4k+hKh5+T4G5+HPeARP/aWND8qZWmP0qPhLoWexKJ3vWw88LZQWOia2uBJvYExgIvACu0c/RADQe0YasYAd+qlfdToKK8OSohOw58UGl78ldALk0U4xj6QCjkqbDMchCyTCYf3LMky1EqN1TOxZFCDTkH7gspmchbw66WPQZAIn6FReYvBpt7P9Oj/HavBr9UkaBFAy/5BILKLFKW6einwE+uGC2pOFuJQODdAdfQjlHhjYYmT52LrgBYJ0Nx5FsqMIdiLf/vnYY0SGDX//xn2BSVRBnO7Qn7mc7pvX22KoRA8cNqNx1boMN8w9vzXOrgEMIMpNAbWcRYbcyCxtK4kEDOUY2bZ9E/mAukhgTgFS/ceFNjledzA4rzqSoPAUnIwgBhVnGT+ETpmTRlRSv5aoOgNU9+c6srwi1WFQBuizVaOPXvcsdOiwMLXQSs/DdVwL6l4wKbH364d++f0nydtM0nxXWAUXdYAY6T8DOW79om9p3Z7NIPKKeA3BVfyhvhMKMTMqZ1cbh8KPIt1OOlr/2DFleeVoJJfCliRVCBktiUX9oG9FIPiamUdLjb/smlP4Kc4kAzZgAZF2BgLhVNPbaCnE253YzCNRm4Mk7jccI1BX+weaVB+8oenhlyeBZ1X99HmDXdyLZB8Nju8mT8jxL4ZPN96sKO7lwXZfrpWJfsvDW8i7lGmaM+zgLfwEUiAEogC8B4bsHvgAc9GxcaRMM6XoGkuK7KOQUt0oXh6IhIIdc+J+12BMCvzziA6uRnYUB6H+mfiJFmDOcN4Im8isbHh++Q61PNYb2aw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(39860400002)(396003)(346002)(366004)(451199015)(53546011)(6506007)(110136005)(54906003)(38100700002)(6666004)(41300700001)(478600001)(6486002)(2906002)(36756003)(86362001)(66946007)(31696002)(66476007)(4326008)(66556008)(316002)(8676002)(5660300002)(8936002)(31686004)(186003)(83380400001)(26005)(6512007)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzdNOFYwc0pUMTFKdElSaTZhbWtGZzFDREpHR2Y5SlFSTmxZSWlPMFltV2RG?=
 =?utf-8?B?dzFwekxBVDlHWjRxOXRaNE1yMzEzOFRsbzlPSE1vUXJ5VHo3WGRVRi95U2dJ?=
 =?utf-8?B?ZmpiekxpWWRPS2p0WTc2RlpHcVZ0UGR5Qm01cUlSNHJzTGpXbEtvVnd3Q2NF?=
 =?utf-8?B?WWl4WEV3V213VStTbWxUV2pXM3UwY0d4Vzd0SDdTWGhFakVZVEJNYzA0Rk5I?=
 =?utf-8?B?VS9lRkxGZjdvM2NZNHVORmsxWGY2TFhzUzNVVHJSdzBqeUNVN0UyMHNIbjRj?=
 =?utf-8?B?bjBlcnJtaFU5VGdyQ0JmRjZEWUdmL0xLL2g2SFNWWFZrSGIwUFRiaUtXcitO?=
 =?utf-8?B?VUpmaGYwQlBWWXBTN1lINExyMTBxV2pXKzhrSWZ6UWFvMklBRG9HWE4yUWpi?=
 =?utf-8?B?Ry91UDkzWDZBb1FDKzBtYkF5bFVEa0RKcldyaGZoSnFPMVUxUUxLd3Qyc3hW?=
 =?utf-8?B?bmFyMlo5ZVRCeXJ6N2VZUzNZM3JYVGhweVRJMnNwQm5kZjZZNXNhMlJjaGRw?=
 =?utf-8?B?dmo3M3l3SXhGM3RxZ1FaVVh5TXZaWk45NmlvU0hLQjFnUm1Da2tQRXJLdmZr?=
 =?utf-8?B?cG1EYTNjVVc0STRNdk1ZM3ltU3RxaWFHcFFpSy9mYnV0K3lqQWZGc3pQY3lm?=
 =?utf-8?B?NldIVHZHN0Z4QzNvWnVwZjNDSWtRVlFGTnI4QVNoWGF2NXFoYU5xNzBkY2Vh?=
 =?utf-8?B?TUNMVHQvSHhSZkFLc1NnNVlNU0lpbXp2NnFGTE53cC9pU1RUSDlqV1lFVER5?=
 =?utf-8?B?cWNlaTFOTHhyK0Jzb0x1NmliVldaaVFFSXJSdUpjOEdwalNZdWRqMHpXTTk0?=
 =?utf-8?B?TmhyMk5YSHQ0SUpiVHQvbnhhK1N5UCtSOFVnNDJVWTVFbXRvUmtlU0kzTFdJ?=
 =?utf-8?B?RFBQQnlOaFZVbmx2bU12ZDVyZ0FvQldvbW94OVBzTGJlWWNFc3JjcW44Z1M5?=
 =?utf-8?B?bW9zS0RLS3FvTjFzczJqMGRETVJ5ZjZEaHZUTytlZkxxK0FLQ3ZUMlBsS1Ri?=
 =?utf-8?B?ZHo5bTJIZlpPbVJHaU9nRWlXaExEVWNWU2tUbXk3M3B2OWk4aDNWTFFVSnly?=
 =?utf-8?B?VlpRMW0vN250T0VvMHZTelVxWkhyTDQycVVQdFhYdXIxcHpXQ1hobHdQVWl2?=
 =?utf-8?B?ZjV4STNmMVdZTnFUYkxwOTdidjNqMnh1Zis4cnNMUzlnUkh1RThJa3B6UURT?=
 =?utf-8?B?T1AwTWlTQzI2aEh0UFNqSjIvS1lJZHFKUmhCNkJCa09LWTB4eTNleWJ5K1Rx?=
 =?utf-8?B?RFY3aE5iNXJXalNFWnExS0UvNGdudVV6Q0JtY3FvTWZwWkR5YkxjRVQ5Z3pZ?=
 =?utf-8?B?Q283R3ArTmxnc2d6YUdGZEczczZsMEh1NUFEcDZqaTBPT0ZZc1hGREJwc1Rw?=
 =?utf-8?B?L3kvcG1Xc05EM0ZXTDlrUjlOQ2lBcWJEMm9DbHZVNFNXQmJGcVV0WGJmdi83?=
 =?utf-8?B?N0VBSEhYV2JGWVZtT2Y0TS81MXloc0tpRVlYVnY5NjJ3cUFUN29tTnZvUEdu?=
 =?utf-8?B?dkVFaU0xL0ZQUzJXcCs4d1QrdGZvYmZMemIweldQYXVhS0o1L2NkN0pGTnQ2?=
 =?utf-8?B?TjZoWXlYSTh2THIrdWRaRjU4NTFya0FSL0ZVc294U3FMdnA1TGRXNllrOTNm?=
 =?utf-8?B?emFVeWc4OVR0SGhnaEc0WDhqb0wzUXBXZVNaZ3NMem5ZazNEc1NtL0ovUEZS?=
 =?utf-8?B?RHdFYTRza3c3TFV4MExXT2RFNTFCbVpqbzZnMHpKL29uSW5iSmRIcWxCUVc3?=
 =?utf-8?B?OHlxUzNmS1MxZHZpMW9jemowbERKa2xpMjgzNTZtaGxzWTRld0pzRUtIbWNz?=
 =?utf-8?B?d2RMOUI5UVRYMll5L1dVV0VYcnAvQ1FQOHZHK1BRK2JYUlB0bHM3VmlxS21F?=
 =?utf-8?B?TjFZS1FvWnB3K3B4R1BZNFFMMXlnYXdGU0pkM2pYcWtRaFJVR04wMXh1M3d2?=
 =?utf-8?B?K1pPYmR6dFNaWHBhY1RVUHRzZitXckdjTTlUbTFnZjJzaGRlK09FWDJqYVI3?=
 =?utf-8?B?N3Y1NmJxNlUzVndoRmh5a1NzQU05K3A1Zm5ScEt2bFVyRnFQb2FKaDlOV0Rh?=
 =?utf-8?B?Z2tPMmRXQWdab0x6K1NVUjMwSlFHczZSR25XQ1JJZHRFSXQ3QUZFRUVHUGJN?=
 =?utf-8?Q?rbdcCwSOoFhj0MpNpSlEJmJMW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a36387d7-9d5f-4885-5836-08da97e261a7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 12:52:59.2324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3htMQFTLWOZvHYXqLS/1obwc0X/vq0sZGfBAwd14nJoJSO8r4wB5TlH+t/IUk3CJlTVzGLwlViBoEP+Zio77aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7042

On 15.09.2022 16:01, Tamas K Lengyel wrote:
> While experimenting with the vPMU subsystem an ASSERT failure was
> observed in vmx_find_msr because the vcpu_runnable state was true.
> 
> The root cause of the bug appears to be the fact that the vPMU subsystem
> doesn't save its state on context_switch. The vpmu_load function will attempt
> to gather the PMU state if its still loaded two different ways:
>     1. if the current pcpu is not where the vcpu ran before doing a remote save
>     2. if the current pcpu had another vcpu active before doing a local save
> 
> However, in case the prev vcpu is being rescheduled on another pcpu its state
> has already changed and vcpu_runnable is returning true, thus #2 will trip the
> ASSERT. The only way to avoid this race condition is to make sure the
> prev vcpu is paused while being checked and its context saved. Once the prev
> vcpu is resumed and does #1 it will find its state already saved.

While I consider this explanation plausible, I'm worried:

> --- a/xen/arch/x86/cpu/vpmu.c
> +++ b/xen/arch/x86/cpu/vpmu.c
> @@ -419,8 +419,10 @@ int vpmu_load(struct vcpu *v, bool_t from_guest)
>          vpmu = vcpu_vpmu(prev);
>  
>          /* Someone ran here before us */
> +        vcpu_pause(prev);
>          vpmu_save_force(prev);
>          vpmu_reset(vpmu, VPMU_CONTEXT_LOADED);
> +        vcpu_unpause(prev);
>  
>          vpmu = vcpu_vpmu(v);
>      }

We're running with IRQs off here, yet vcpu_pause() waits for the vcpu
to actually be de-scheduled. Even with IRQs on this is already a
relatively heavy operation (also including its impact on the remote
side). Additionally the function is called from context_switch(), and
I'm unsure of the usability of vcpu_pause() on such a path. In
particular: Is there a risk of two CPUs doing this mutually to one
another? If so, is deadlocking excluded?

Hence at the very least I think the description wants extending, to
discuss the safety of the change.

Boris - any chance you could comment here? Iirc that's code you did
introduce.

Jan

