Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB292773A92
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 15:52:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579938.908148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTN8A-0005av-65; Tue, 08 Aug 2023 13:52:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579938.908148; Tue, 08 Aug 2023 13:52:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTN8A-0005YC-3E; Tue, 08 Aug 2023 13:52:14 +0000
Received: by outflank-mailman (input) for mailman id 579938;
 Tue, 08 Aug 2023 13:52:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTN88-0005Y6-Q5
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 13:52:12 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20631.outbound.protection.outlook.com
 [2a01:111:f400:7d00::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c573dc44-35f2-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 15:52:10 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB9884.eurprd04.prod.outlook.com (2603:10a6:800:1d0::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 13:52:09 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 13:52:09 +0000
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
X-Inumbo-ID: c573dc44-35f2-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DeyeqAqps5nXJzmEDroH6FpDAFEv2s06tmZ4fUbu0wa/TU30chMojI5ubWinO+yOo7vmpPFLFHtZ1K5KicFSes05xdXF/HjBhMrDLzqtIuHFcpdb7doGbfDtZkam3jGGMfUHLkblfO8cTTN03PqxmjlsJi7EClV8BMgGGuZ2uq5fKRxuz5ISlBhSyelGGu/cF6bEIH3EoFgzlfKPIlXPuDb3DVn/ipIkwOXIJWS6gEnpNynCiaav8ZqG13rxFXCrIyD5gVkwtwqQeywWZCEs1oFmuit6X/5hpgzcvhed/buVKVycGXqGYLEnaMfOlJY8Rsawmd7mkc7NuyGSFGnIKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GoCjWo1H3Dimg14cyPXEhhyFcvBL1Snduz8ZBJpjG5U=;
 b=N39+nOlYKqNRg/XSM0PscQZbhhjNievJEQTHFvdPZDm5b9aNvkOEPIprKbV1HGRvUdukj5+MZ/oyrS4bz+ounmPplNQRclgBd11YW+b1OQshdVKLDcyYcE61mZnh4jkXsNOyFER7R0AJI3lAspqVx2Q5YNdWqCXGiW7vpOBNH8kwUujcYycW+UKvBjOMmeZLDEeq9RkLyJiTTtHMsAP6fGYvmNiNGu3x+/MUJr3R7RgU0wB6BNSsK2RHa2hMaOu0nLYzxHgRTX9kFhKG/Nxnuh2jFfhz9VpU3C6LIRIsG+bwYeE9pVdHJB4uXU7KlgrfEYjGsmOHdFFe/toZpN44vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GoCjWo1H3Dimg14cyPXEhhyFcvBL1Snduz8ZBJpjG5U=;
 b=Zi3ZsZTfi4dNgn1rz3HinGh5jfz7EkQ6uyCbMmnbPlAarAYuVYqbp230Dp0HEUNDGqHk5n+Y7/l7fj76Uccv4VokZhek5XuOOxzHqPbvE95zOFgC1wRR2OdyKo1ZZGT7BMYmuffZJpeLrGjzkkqiQ7SqwZzytCDLHwXdyM4iOr2vg/jmHw1muD/FuDlA2bPkaqAjAc7MIxBHt/rr6DtlM2yFiVJ4HbGATZvAQuzTWZNUEqiyznIcadDaMT3dHfqIQmkS/HL/gKLUW1Ui3XN6WZAUKN54MnEOFZItNnk4YMOlZ1Ocub9POutUuAP0Wu7HlvRaAZYtUQJtVZArnYfDAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <250d3d77-9668-eac3-172d-5a0e50d33070@suse.com>
Date: Tue, 8 Aug 2023 15:52:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH v3 1/2] x86/vmsi: rename variables to address MISRA
 C:2012 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1691488505.git.nicola.vetrini@bugseng.com>
 <605687eff99db7181ef6c05bce671e20f194b46b.1691488505.git.nicola.vetrini@bugseng.com>
 <9e5f208e-7419-b16d-c705-592959dc0ea1@suse.com>
 <e86dc812f4e365d8f23a14f9edcc2852@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e86dc812f4e365d8f23a14f9edcc2852@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB9884:EE_
X-MS-Office365-Filtering-Correlation-Id: e3edd54b-36bb-4190-e99e-08db9816a8b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J7oE+aD4In7IsNmT3+zEWJTgSDpjCEQjIndUVauuakXx9uTPb2xW/BY0f7Jz6Mg+03olhv4mljTVNhe9MUKDjWrhLkbWj7Fbf/u5DnrJTX/KmFixiJ3ihpgjggnJJyavvgxahRr2c/MUfn2VrDULal2ecY+GlyhnQHKNqQ88wYQYInxnuWa0VVPfRbtiFQYrtz3g02suqR1fMY6yAEs5QfdgEK6AVfrG24nmtJoNxT9q3YIJJM74LsBVNwi2Pf9FweoaBBLXN/rRmYPKRw0fZ50jmNTBJg2Hsskex0dfOJplPD7MLJ4g+Qi/C4IS1Cri+VDtezgkGn6PUUdRRuJQcfzkrJL/xPpHo8Son3WykTB6QSreIqQLjKzjiwHhpa7f9JBbCSj8/8yTAlz8OElm1jdZj+vWmLEVRKjXEmbPSNFuBflGuEKV3e1KByTy2Udqh/mkjK4RyNkz9WYERZ+IWrqJV8psfwGBc1AW8vFCRjrMl2t6QUPj2tpdteV5qrdFA9u8bsyYCRIZXPHhzPk/y0MD6zYHebwdbyDF8BMFjxuMOuR+hqMIRN80XqSFEQRtebX20RmP0xuN0sRnVwpt22WwyWd3qdFk6mwGQnAtf17QrGCX6H1240ncLa+Xa2SViXv3krjjqwF9xuRNvZSFnw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(136003)(376002)(346002)(396003)(1800799003)(186006)(451199021)(478600001)(31686004)(6512007)(86362001)(6486002)(6506007)(66476007)(26005)(6916009)(66556008)(66946007)(53546011)(4326008)(38100700002)(54906003)(6666004)(316002)(2616005)(41300700001)(2906002)(83380400001)(36756003)(8936002)(7416002)(5660300002)(8676002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OE9RWGllaDF3NVFYdFFHbVpSdDNjRE5LRjZzT01ra2VzWTV6cXdJellkTElK?=
 =?utf-8?B?eGY4MGF0WFNSS2dQMmgzTGRkNDJyQ1Q1VHQ5dGNyTnU4bC9SeUdQTi9MeFJV?=
 =?utf-8?B?bkVCdmxyalQ3dDZaWUoxSXJ1T25VdXpKSVlDZXdXQXZTeWJ6WGhYVjdSYzhK?=
 =?utf-8?B?cVRYNXBpZzdyYm5wVk9mYldkUGtNNmV1OWV6dVlnTDUraUM3Q2JacjZveVpZ?=
 =?utf-8?B?aWJDeEZkOXYyYm9tYW5ORzd2Zkc1RW5FcExEL2JJdTUrdmNQQ3RXQ3JNTkY2?=
 =?utf-8?B?ZG14S2t3U0dKUGg4aGh6WCtVNFlvVEhjNlMxOW8vQXhza0VrTnphczZuVXJ3?=
 =?utf-8?B?dGRRcUdkRXp6RTRvdEVCOE13bE9QY1Y1bm9TclZFU2FCYlkrMmMrWDNjSE1r?=
 =?utf-8?B?S2ZaVGduT2J4NitPTnJsYzZKU1h0N3RGS3JKeVVVQ1l2aklNQTlBZ3Rrellt?=
 =?utf-8?B?QVZIZGdWZ3cvczV3dU1QT0tscWhuWDNBTm1HOWdqRldHcHAwM2EwR294MzRy?=
 =?utf-8?B?N0ZFTTY1SGhDQ00vdDlXZzkvbnlSRjJrUGloM0dBekFkYm1ONjdoOFF6U1F4?=
 =?utf-8?B?RVpVZG1sb0JjdFF2N0toc1BGYjhYUG9ZTElidGNOVE5Tck5jeWUrYVNtU1dk?=
 =?utf-8?B?dHF0OTRBbE9KYUNJSVFlUEFkamNkSFpuTzlNcFhZL2RMNm9SaENkd2tFdnFH?=
 =?utf-8?B?Wm4yWU9vUHZxaDVaT1RpTi9MUWljdW5PTnN4UzJuQ3hvaTU1T0E1RUFRTlZJ?=
 =?utf-8?B?SUlKYmx1WlpKTTRpbGxhc04yYlhCSVRVd3d1U1J5RHgvQ0lEVHlUWWJVL2g1?=
 =?utf-8?B?bWZqclNHdVlwNHVhbzQzaUNVMGIvZHF4anZ3cUQ5ZFUvMmJCWVVaVWU3OUky?=
 =?utf-8?B?K1hwY1dNY2lidmk0SDZ3R2djNWFhWXhjT1I4NTdONTg5WmxXclVORVBuMGVN?=
 =?utf-8?B?aEM1WXZlTW1YWWpKU1lvM2JuMGdnMHZIQldJS1dnSzJuNXNuc01oZno5cmlK?=
 =?utf-8?B?dm1wZ3c5VUJxNmpyY1AyUVVOOEI2VmNLWGVDT1pUOW1uV1RKNVhzcXdEMHN2?=
 =?utf-8?B?d1RGdVAxYTc4WTFLUklrODVHL0NtdnB2emdQT0FLVkNRZUQxMnE1NkYyem4y?=
 =?utf-8?B?bXIwU3BZRlYrNndnbVRqeENvbUFtdjlvSWhuUFVqbGZGTUhCbk43SHRGYTla?=
 =?utf-8?B?cjFOcXdieEM3Q3JtdkZ2em5kUmZuSHJZSHV4amhCMElBM3B2cDJNSXZKL29F?=
 =?utf-8?B?OUdOaTBFQWVkWmNobXgxWWJ1UXNhdU1VNU1GOFBObit4OHFzZVUwUStNV3pC?=
 =?utf-8?B?MXU2VFNYNDhoU3V6QmNWaUdIcjNFMFBHZGpPbEVnMHI0SS8wTTVUY1RvWE9t?=
 =?utf-8?B?a2FwOS8wU0kyQ1NjTmdweGtvY2NRc2p2RFlFNUoxT2dTbDZzQzFUWGFuL3c1?=
 =?utf-8?B?bmtCeFhEUGxIakU2K2hHMTdpMmpoODllZElmTHA3UytGUTlqazRmcG5Ldncx?=
 =?utf-8?B?MU5rOW9IQTZvVzJlaHF3REsxTWJJU0dnOFllV0pVVDNrM2FaNFBuTVRWRGFI?=
 =?utf-8?B?QjFRamdHZmJHVVNwN0tVdlFhTkJaQTdRbHlvUU9kakhQb2dRdmo3dWJKOEFC?=
 =?utf-8?B?bWN0WDE0bHhnUkEwRHJRc0pPREs0Ukx4U25jT3JmRkY3Vkl4NTNZNlN5Unpj?=
 =?utf-8?B?dzlrcVkxQktreDVmYTBDMitCSWFTSTJXNWw2Y3JZbzhXa0QxMW9TMGMvajJB?=
 =?utf-8?B?bExaWEhaTXczaGJGSEE1dUh1QjE2Q0g1NjZWaWtQMWdTRmN1NndtNDJrVGNu?=
 =?utf-8?B?VWNwZGd5MGFWYWFtZUo2d01oSXZrWVpVb1RiYmh5NDRuVlYxWTRaQWxQd1h2?=
 =?utf-8?B?dGZrZUlVd3Z1eWdkUlZsNXRtK2lLYnpscGREaWJQNHNnZXlzeXZaL0lyV3Iy?=
 =?utf-8?B?Q3hrTENGem5sWDlzZVZURE0rWnA3VEw5bDk2V1JZVjZwLytRelJpZ0Vzb1ZO?=
 =?utf-8?B?TTRXTzhzaHl2REpoNWp2ZHo3OENLaUZVbXlWR2FjVHcrK1haYnljRk5wSzlO?=
 =?utf-8?B?Wm96NXpOWS95RkZtRUVNNUdnTXo2WW42QUQwQ0lwY3lnbVIvWVUrZElmS3BS?=
 =?utf-8?Q?YTKoOFoxqYbZk8B/p3IgIRTbh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3edd54b-36bb-4190-e99e-08db9816a8b2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 13:52:09.1123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dQhKcY0WFCrx1c8oauLlMzHPCrmBuYRKEuAdIF+HnXYVJqTeKsz57WRUbXr2UV+RgbVxSMdMQ+XKTRnhvEnz5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9884

On 08.08.2023 15:38, Nicola Vetrini wrote:
> On 08/08/2023 15:22, Jan Beulich wrote:
>> On 08.08.2023 14:22, Nicola Vetrini wrote:
>>> The local variables 'irq_desc' shadow the homonymous global variable,
>>> declared in 'xen/arch/x86/include/asm/irq.h', therefore they are 
>>> renamed
>>> 'irqd' for consistency with ARM code. Other variables of the same type
>>> in the file are also renamed 'irqd' for consistency.
>>
>> I'm pretty sure I pointed out that Arm uses a mix of "desc" and "irqd".
>> So "consistency with ARM code" doesn't ...
>>
>>> --- a/xen/arch/x86/hvm/vmsi.c
>>> +++ b/xen/arch/x86/hvm/vmsi.c
>>> @@ -281,7 +281,7 @@ static int msixtbl_write(struct vcpu *v, unsigned 
>>> long address,
>>>      unsigned int nr_entry, index;
>>>      int r = X86EMUL_UNHANDLEABLE;
>>>      unsigned long flags;
>>> -    struct irq_desc *desc;
>>> +    struct irq_desc *irqd;
>>
>> ... require e.g. this rename. As mentioned before: Let's limit code
>> churn where possible, and where going beyond what's strictly necessary
>> isn't otherwise useful; there's already enough of it with all these not
>> really helpful Misra changes.
>>
>>> @@ -462,7 +462,7 @@ static void del_msixtbl_entry(struct msixtbl_entry 
>>> *entry)
>>>
>>>  int msixtbl_pt_register(struct domain *d, struct pirq *pirq, uint64_t 
>>> gtable)
>>>  {
>>> -    struct irq_desc *irq_desc;
>>> +    struct irq_desc *irqd;
>>
>> This one indeed wants renaming, but then - consistent within the file -
>> to "desc". At least that's my view.
> 
> Well, but having
> 
> struct irq_desc *desc;
> struct msi_desc *msi_desc;
> 
> and then using them both within the function doesn't seem that readable, 

You have a point there, yes. Still I'd then probably follow up with a
change to rename msi_desc -> msi (and I say this despite seeing that
farther down in the file "msi" is also used for another pointer type
variables/parameters). But with what you say in mind I'd also be okay
with you renaming to irqd where renaming is needed, but leaving "desc"
alone.

Jan

