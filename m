Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E015EF7FB
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 16:47:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413825.657738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oduoF-0007F4-Ny; Thu, 29 Sep 2022 14:46:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413825.657738; Thu, 29 Sep 2022 14:46:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oduoF-0007Cf-LI; Thu, 29 Sep 2022 14:46:43 +0000
Received: by outflank-mailman (input) for mailman id 413825;
 Thu, 29 Sep 2022 14:46:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1mH3=2A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oduoE-0007CZ-6D
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 14:46:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 873f4adc-4005-11ed-9374-c1cf23e5d27e;
 Thu, 29 Sep 2022 16:46:40 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8753.eurprd04.prod.outlook.com (2603:10a6:20b:42c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 14:46:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 14:46:38 +0000
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
X-Inumbo-ID: 873f4adc-4005-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TsEruHbi4XeZVVhxGWzAZFXmu7HScyErAl+KylPl2f/09DoVFHSFEWDBVGncrKeprfbY7n6OuAegc+8HVIE5AvQ+3VGf2tLj+Kj7pDR956EaocINwPKh4wwYcAk+Odb7xE5GXDbMzjnG8k7J+8Ng9l1xnvbEqIGHN8NVMWzKiJDTlakeybntbq2oYKNO/fiocuHhzRnTeoT9hxlhJb2/uv68WWBDFbO5aA1/lvApc8HfNKUOCk3x+QSrbm0ntsiRJ1WSHPjdcMmkBomWvopZ53zaeTGI6E5PgSL8lQ4Ej2U1XuzrajS2sF5B7ulwHZc3q/blh5SMIS4uVlkcgtb01A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opqA64Q+nuXWr4AFVA5z2MJl0UtnOwe+MyWlPkxBOEw=;
 b=JaTnEBFdpuzvj3nMvR8a2pS05tgOHOZuBT9WmsCaqToiZ1i6r+/FkR4UGwcbn8GKWuCkfsBWHBNCebIJN4BBf/QL6fo5t9qfQdKP873lxqecmYu8N1ZTXckeqbtnRmI2D5GnYDgWWXzUZ10bnqwuwLygkZ3IFFBFKxNiWN3O7Qyj46Ll630rgjqjHaP6eEpFgIk9DThsO0DZ1VTNaOtxvEcLqQETh8ArwYw1fLHf9iBWrgtIvhv6ufF/ZhsMrhhyRidbMFwWILStUkxagqcOCZUa88x4gqXzjn+K8MkPdAIxfI4PDw2Rjnj0brgL33cTChqMClRs9YhGynRv7Z4O8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opqA64Q+nuXWr4AFVA5z2MJl0UtnOwe+MyWlPkxBOEw=;
 b=HhW0GsFLRuTddAggDlAOaCrvn4wsYuedPaNU9/DFFtVFSX0ZJ+xe7IevT9Pr1uVUrZ9MpKtZaivgVkvjXJudBOKoJFS5XkPqGW/oR3Rm+TgdlZN+0cbxq2z7ovbld+Ig+vdZubeFoD0lglKIj6Uqf6+bAQ7b08ytY9nDjh+axT3Lua2rLrtH00z7vc4ZEHYQb4StID/iUmqSByxm58cQ2iofL4kDpgnGOJtDnKOWiWij7EAYNnkR/zHXY0YdTwjHkAYU31hG4fsBwOZhN8H5F434Ns04boEurBhnoXwn6H2WNkFBeoQE/tip1guQG871Wf2D1HdbDuNUpZWwZWtyew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <38f7cc1c-59ed-dead-8623-2eabcae4607e@suse.com>
Date: Thu, 29 Sep 2022 16:46:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2] x86/vpmu: Fix race-condition in vpmu_load
Content-Language: en-US
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <86f8a095ff18e4dc41ecb9cef5153438158b91ce.1663878942.git.tamas.lengyel@intel.com>
 <7a469ef7-5ad7-5abf-2c1f-fa29496fa2a5@suse.com>
 <CABfawhkJ1KSxmV=usLh9mKSyT+-_=PgQrhkGe8G0J_ZjqZ9siw@mail.gmail.com>
 <1e9f75e3-c59c-e3a4-f26d-59a440d366aa@suse.com>
 <CABfawhkT8PHOkNS_9+uXjN=6UANkayMf4UC0OuCr6Na-BOFdQw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhkT8PHOkNS_9+uXjN=6UANkayMf4UC0OuCr6Na-BOFdQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8753:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a693a8e-c6a7-427a-1ecf-08daa22969f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vj/BPdhT+FJMs1nEmneh92HGEyvfvawdDKGNUuvLD2CVhL5CJFPX5JDLNhXDt1EcIcH38LXKhmqNWY/BtsMYN9ECRy3Dt9ZkyaS9d7OpijjctjxERBw3J3UL+DORtZ29yaYi9A5tF1FIv6dva6KV9TfMaoyItnDTUWrvo7bpmYJU1Xe5gpwHqYrSpjLoZURovI8+iuS10iq5QLOt9ftIicMBjZ7iZppVs2jQfdv9RYW9qxd/Uj3UYKpfARdPcGyd96GXc1xyFD3SUIAJr7gsipGGGHZYXfpd2LHMVft8U2Nied3kwnzczrBpplGATT+y+2NM2vkYZ8mWuPA1CmU6EYo7YKfbBB5w3Rm9LGHp4hyNFT8plUKyF/XRpm28AUx+JfOpVxUeMLEHanWYn3a5VhOYlik/j+/9vBqfEb5K08iu15Yd/F862u/JgR3NMLSi5DRwvBWspK6BuSdwkRz2hgWhmhwsTAFTVSQwxsOoDh+mdxcsmOF129ivl1OnnqPG9G8JXCkqxkGpGMYr/EcQCuB3SBsZV5ezQjV5JG52itKGrDClgCrIHpXjP4zgKect7STtWRjbrQw5tNoXJ24p4ryoahctsVIM5z7CFRLpduVamxZCWiqHtwBlu11Q59/metiGhO2tne/6MDotZgsHl1xSm2V7N15Mo655RKXrUHvq+kGNDkX19i7cqMYOIVt8ROT2LCwmvjdnOwZlHhHABFvfOdlizYmq48VChLL7KMMnCNK65fRvD8sIcI1dXXJa3vFoQrF9zJuYraDop3iP9wL5aNmOwnBjJJcAmyy0Ji4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(396003)(376002)(366004)(136003)(451199015)(6486002)(478600001)(31686004)(53546011)(66899015)(6506007)(8936002)(316002)(2616005)(54906003)(2906002)(6916009)(38100700002)(66556008)(26005)(6512007)(36756003)(83380400001)(41300700001)(8676002)(4326008)(66946007)(86362001)(31696002)(5660300002)(66476007)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUdWTERXdFpzQmxReEJoTHFjd3NjNERtalJ2QzR2bnlrU0N5VzlUWndhcDBD?=
 =?utf-8?B?RE1QUSsyRExOOFJIeFovWmpMdlpHTHB0b0tObXNHYjJKVWtCa3UvdUpEa0NX?=
 =?utf-8?B?NnFkOWYyRVJhTEhSMVhMNERydVU2V001MXRLVG5SOGdYck5lbVZHK0pRS2tl?=
 =?utf-8?B?UGxSNjdBQllDNTlBVmdZZ3FnU2lxMlEva2ZubUJXOVAybjI2aGZvcnlVOG5T?=
 =?utf-8?B?OWZJRnkrREEvdzBhdTgxdHZnNndOWGc0c0syZXJaU1pzRnd5UlRNcm11TXdF?=
 =?utf-8?B?SEhPMWFFYmxNT2FGNjVGK0Y2V2tqS1dyRkZEWTNzZ1kyaDNtbGNaR2dUL0cy?=
 =?utf-8?B?YUZKdzNQMmxVbC8xVmtZYVJIQ3kyVVlreHZqemc4Z1g2MFlnYUNZSWN6REpB?=
 =?utf-8?B?Q3BQdW93T1pOZEtycWIzV0JWb2gvL1BON2p0NHpRcTc0NUNRM2I4eXErL3c0?=
 =?utf-8?B?ZDdmamx3ZHFNVnVNMU5OZnBLRDR3SE9raExIejBzRzRjaFgwR3VHV2w2aEFi?=
 =?utf-8?B?ZjlIZU9pL3gvSXRqcmFmSkQrR2ZCL0tjcy9PT0NZZFhqWFgrMitaNkRyVEIx?=
 =?utf-8?B?SnVkb05ISmQyMm5lejMvQlhqQU53cTFNRUxZYVZnQU95ZU1GcEg1TFhNMVoz?=
 =?utf-8?B?azNtUDZiOUlBZG1kVkJPNGQ3QXpnZjg0VlAyY2JSUG1BQmNhalBjbnVMMXpw?=
 =?utf-8?B?RWRIdEFxcVEyZjZsQnhRdDBTWUpQSjJuN3g2THgrZnJodjF6djFaQUorUVoz?=
 =?utf-8?B?WHU0eHBPVGlNY0tUV1Fxb29MbDU4SWFLTTFHNUtlc2swQVVoVFFSd3NQNVJ4?=
 =?utf-8?B?UDJBZG03RlZTTlR5a0l3cmpkQ2NmV1pkeDNQSzJwR1AzMDAwK2p0Q3AySmwr?=
 =?utf-8?B?OTlraTgraGZJRStrYkZWT2tDS2Q0aEhxVHJTTU9FenhScnhudWRZUi9mbXJ6?=
 =?utf-8?B?ci9TZk5GUUp1WG5UejhWVlR4YXozZnpzMkRQV2lOOHZUMk1rQlZ6OVo0b2kw?=
 =?utf-8?B?MFlMM3ZWaEhDTGgxeGhjZjZXVU1qTFVNNURoa1NqeDFwYWd5VXp5RFp2Q0Vj?=
 =?utf-8?B?dGE2MDlWdEZDTjJqOVJRMXppNVJISWJ2ZnJwKzBZSkQwT2JlNmN6YTlIeW9M?=
 =?utf-8?B?MVJUc21rMG0zazVCckMzWm91T0hUU09zbFUyekZhTzVSaklQWmhmNnlaUWR5?=
 =?utf-8?B?QzNVS0pZUkU4ZjNLVlE3eGxoSi84a2hqaFdjL1dZL0tTNXI2NXNvWWtWUjRv?=
 =?utf-8?B?NnMrL3U5VWJjcU12QVBsYmlTMjBlSmlKY1ZrNm9OWmFHK3d6NGlmckplZVRy?=
 =?utf-8?B?WjZIbGJYdCs0VzVtU0w5WlZTazU5b1puMm1IMytnUDJnZ0JMOThXeDJ4Zk42?=
 =?utf-8?B?LzN5RmRsMmZNbjArNGM2aGVlOVdFa1ZxNzBjTDNWdmN5U1ZrYTZpQ1N1b05Y?=
 =?utf-8?B?Z2UzQm8xa0tmN2prMG50OHJrdGRJV3pnVXJFSWs1dk9Pd3k2UVZzWFNjbk1W?=
 =?utf-8?B?bDgzS2E4L3FkSDlmNTAzbHJlQitnTmpVMm4rZmFCcmFWM3NmdXdyTXRxbkoy?=
 =?utf-8?B?MjNBWEZwa0hHaS9NRHZXSTJXUU1FZ1hZZEdkcHhrb0MyV1ZPN0pQVllzL3FG?=
 =?utf-8?B?V2Uzb2xybEs3d0RqZm5SMCtGZFMxYSt5eVJDdTZOdkNRaHJhRzZQYWtJVGd5?=
 =?utf-8?B?QTVGTVIwaDlESVA2U1J4RGE2dmwwRjZIeVNmRmxJc3pOczdtcm0xdXBJWUIr?=
 =?utf-8?B?ZVVDVVkxQUN3YVl3Qkk3WldDeTI5am9JcVYyTEFxTG1nbytoMEQxNkl0bDZz?=
 =?utf-8?B?Wk4rak9ndWczdmJnVUE1UGNLNnVkcTBSTmowYytGdFNWRE4wVUJJRTBBa0pY?=
 =?utf-8?B?dnJWMFllN2oxRGpSMzBZUEZmMFZUc1RWQ1ArYlk4WUgxeGtHNmwyS1M4VHFH?=
 =?utf-8?B?TXVXdWQ4eldRdUpHTW9IRElwYXhhZFdzTWVISHAvRE5hTHJuZDRQaHllRWcr?=
 =?utf-8?B?Ryt0VWRNRkNTbGh2b2l5SXg4Z0Y0UVpWNHBJRWp4a3RUKzFnNTh4a3ZHODdS?=
 =?utf-8?B?TEExNnFNSy9KS0gzdktRbmlMYW94MDB5VStkcXFQbkpabFBnemlUdG9velg1?=
 =?utf-8?Q?io30QQiLprkv0JXoT10H25Chi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a693a8e-c6a7-427a-1ecf-08daa22969f4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 14:46:38.3967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2a6ke1cu+dYMemWaub1T8UMFonLdyhDUGlhXrWExXWRs01YcOeSSkH4INd/pgo4u6QNKHkg1VgtRzx5VViMBtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8753

On 29.09.2022 16:28, Tamas K Lengyel wrote:
> On Thu, Sep 29, 2022 at 9:07 AM Jan Beulich <jbeulich@suse.com> wrote:
> 
>> On 26.09.2022 16:22, Tamas K Lengyel wrote:
>>> On Mon, Sep 26, 2022 at 10:12 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 22.09.2022 22:48, Tamas K Lengyel wrote:
>>>>> --- a/xen/arch/x86/cpu/vpmu.c
>>>>> +++ b/xen/arch/x86/cpu/vpmu.c
>>>>> @@ -376,57 +376,24 @@ void vpmu_save(struct vcpu *v)
>>>>>      vpmu->last_pcpu = pcpu;
>>>>>      per_cpu(last_vcpu, pcpu) = v;
>>>>>
>>>>> +    vpmu_set(vpmu, VPMU_CONTEXT_SAVE);
>>>>> +
>>>>>      if ( alternative_call(vpmu_ops.arch_vpmu_save, v, 0) )
>>>>>          vpmu_reset(vpmu, VPMU_CONTEXT_LOADED);
>>>>>
>>>>> +    vpmu_reset(vpmu, VPMU_CONTEXT_SAVE);
>>>>> +
>>>>>      apic_write(APIC_LVTPC, PMU_APIC_VECTOR | APIC_LVT_MASKED);
>>>>>  }
>>>>>
>>>>>  int vpmu_load(struct vcpu *v, bool_t from_guest)
>>>>>  {
>>>>>      struct vpmu_struct *vpmu = vcpu_vpmu(v);
>>>>> -    int pcpu = smp_processor_id(), ret;
>>>>> -    struct vcpu *prev = NULL;
>>>>> +    int ret;
>>>>>
>>>>>      if ( !vpmu_is_set(vpmu, VPMU_CONTEXT_ALLOCATED) )
>>>>>          return 0;
>>>>>
>>>>> -    /* First time this VCPU is running here */
>>>>> -    if ( vpmu->last_pcpu != pcpu )
>>>>> -    {
>>>>> -        /*
>>>>> -         * Get the context from last pcpu that we ran on. Note that if
>>>> another
>>>>> -         * VCPU is running there it must have saved this VPCU's
>> context
>>>> before
>>>>> -         * startig to run (see below).
>>>>> -         * There should be no race since remote pcpu will disable
>>>> interrupts
>>>>> -         * before saving the context.
>>>>> -         */
>>>>> -        if ( vpmu_is_set(vpmu, VPMU_CONTEXT_LOADED) )
>>>>> -        {
>>>>> -            on_selected_cpus(cpumask_of(vpmu->last_pcpu),
>>>>> -                             vpmu_save_force, (void *)v, 1);
>>>>> -            vpmu_reset(vpmu, VPMU_CONTEXT_LOADED);
>>>>> -        }
>>>>> -    }
>>>>> -
>>>>> -    /* Prevent forced context save from remote CPU */
>>>>> -    local_irq_disable();
>>>>> -
>>>>> -    prev = per_cpu(last_vcpu, pcpu);
>>>>> -
>>>>> -    if ( prev != v && prev )
>>>>> -    {
>>>>> -        vpmu = vcpu_vpmu(prev);
>>>>> -
>>>>> -        /* Someone ran here before us */
>>>>> -        vpmu_save_force(prev);
>>>>> -        vpmu_reset(vpmu, VPMU_CONTEXT_LOADED);
>>>>> -
>>>>> -        vpmu = vcpu_vpmu(v);
>>>>> -    }
>>>>> -
>>>>> -    local_irq_enable();
>>>>> -
>>>>>      /* Only when PMU is counting, we load PMU context immediately. */
>>>>>      if ( !vpmu_is_set(vpmu, VPMU_RUNNING) ||
>>>>>           (!has_vlapic(vpmu_vcpu(vpmu)->domain) &&
>>>>
>>>> What about the other two uses of vpmu_save_force() in this file? I looks
>>>> to me as if only the use in mem_sharing.c needs to be retained.
>>>
>>> I don't know, maybe. I rather focus this patch only on the issue and its
>>> fix as I don't want to introduce unintended side effects by doing a
>>> cleanup/consolidation at other code-paths when not strictly necessary.
>>
>> While I see your point, I'm afraid I don't think I can ack this
>> change without knowing whether the other uses don't expose a similar
>> issue. It would feel wrong to fix only one half of a problem. I may,
>> somewhat hesitantly, give an ack if e.g. Boris offered his R-b.
>> Else the only other option I see is that some other maintainer give
>> their ack.
>>
> 
> I may have misunderstood what you are asking. I thought you were asking if
> the other two remaining users of vpmu_save_force could be switched over to
> vpmu_save as a generic cleanup, to which my answer is still maybe. From the
> perspective of this particular bug those use-cases are safe. On is acting
> on the current vcpu and doesn't try to run vpmu_save_force on a remote
> vcpu, the other one is being called when the domain is being shut down so
> the vcpu cannot be in a runnable state.

Hmm, yes - I can accept that. Thanks for the clarification.

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

