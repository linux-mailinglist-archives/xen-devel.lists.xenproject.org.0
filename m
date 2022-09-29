Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE0B5EF606
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 15:07:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413769.657650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odtG8-0000tc-L1; Thu, 29 Sep 2022 13:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413769.657650; Thu, 29 Sep 2022 13:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odtG8-0000r0-Hp; Thu, 29 Sep 2022 13:07:24 +0000
Received: by outflank-mailman (input) for mailman id 413769;
 Thu, 29 Sep 2022 13:07:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1mH3=2A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odtG6-0000qu-WC
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 13:07:23 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2070.outbound.protection.outlook.com [40.107.20.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7461d9d-3ff7-11ed-9374-c1cf23e5d27e;
 Thu, 29 Sep 2022 15:07:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7727.eurprd04.prod.outlook.com (2603:10a6:102:e0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 13:07:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 13:07:19 +0000
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
X-Inumbo-ID: a7461d9d-3ff7-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iIGduCOaAG9+ABf0J0xeynLvK1ci1wVth51loXunr61/Chu214LyzbmUNhEejLbK/zJZlKfKzFMHTQK7HZY0Ki0eZKsuyMk/BUhG8EoaICbdxM79LyyVF4WAu6nLl8gDpKlm/1yzhGAiRy2xnXwv6G2egXOP7qlDuZZHKLpG6pxO7FwrxGlpZB4oda5H9yyFTxOJy4NSK9gTA5pbh9B1BAml0q6Hv6Mb08ZLft9eWgY3bzgeHW7ZqVm567CrneQJ4wPpgpEuhE/EjUZsk5lDZaK9QxdaBOlacWrIBa1pTLaixq0kbvXyknYPaNxjlbSrdrKr4pp671wM+8El75aXew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CbUiIJBfrFotvWwnCl6u8JrOebjzPe2CR3v7xnTIDoU=;
 b=RzI77qdvTT+3gcXTpyZq+vTcZHEi811I78dW2crgjm3dt/sKNsZFJydwhLpvDK7zKaxxzDImm6Yl9VO9Knd80QMNfXp9Dr5ejwfwo1aLY6xfR+64/TTfwkcx4ikKAbPbIU0LcZJSTdIQ4sWnyodHVKammCBd2x0jSKFWR8gd5RModiuWVvs8iV4BGEBb4ugpj0oJTdG8Co2c/nq6Dw79S/USNW6mHdMFR5GGpPHQ+IXXuAuNVNgc1OCTHyRRbUVtpVrEc5h1Sj+qga6K6ex3lSlHTKzpsMTRMx9dRdOd3Ps8fRKxBnVsWZVh65DvgWra/T8ZPvTAAsFgoOE3LolA3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CbUiIJBfrFotvWwnCl6u8JrOebjzPe2CR3v7xnTIDoU=;
 b=l3GoX17mBZ2DarvqK+hxN/B8J4A1diQL23QzDRXHa7Jv0MZqEMF9uLinbqPZLjJcCHITK3nhdYCnPGgCKS830xeH6C5IYPHWFe7n7Ln8DilJQiK58JLbzLoMNnhnXwfVP00EQcK/ilv/0WSVxQT9xqklny1TP/9AJCtpxqFjWMp+XLltgse3THD6BGGOu+OFw/Dqp+WuLsHq0x42WV2o0fzyxvQamS7mLmrXMrTS25rbgmvFdnd+z2EOZq4oBuFzfqsG/gpzbRIUWyagt8NQw6ny6hkWZYOKcgGorCeNZk9DmMV3qpqVHgRvonGvZra/Evjgn6S3q2tRxVhH8ptZMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1e9f75e3-c59c-e3a4-f26d-59a440d366aa@suse.com>
Date: Thu, 29 Sep 2022 15:07:18 +0200
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhkJ1KSxmV=usLh9mKSyT+-_=PgQrhkGe8G0J_ZjqZ9siw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7727:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ea5acf2-ae3f-432d-3047-08daa21b8a67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VzpqVv/R2+uVvEePXM7rO+ATwpRkOz8VJhTw5dkzPpcFPnKeH92zbHw383bXDuiS1RcC7Ft3LyFZEmTnEfpDKexPqqe73rqSocYKDVJd9SMW5vVe6eHNaLZNs2+TMVg4K2am+f82JQrfEQ3kaxtRhtrwgqg/SygiD0PC20bAe0I97GehXANGQ3daEPoxhplXObe4HD9ARkfe3fg9iWSeLTKZHs9vBEolT82yoNM6d+c1J0P2pKTymqeHmd84IeailON8tu38vmK3OKYmJc57N6ds5Jpv0MQ06Ol/JyCKhRFH3Zb4HEeqRCUAaUsqJNU1mh4Nr5JZqM2EQLLunl4M3X8rCtr46mvIfet5wmbJyheIFBpA8Y5Ew0ntiayMSKwQz1x0wUpl5hCLrzB61JGB4v7+H5e8i9yRwyI5+T9K/irx/BRzLX8/BlRaw6uFCLQ+IxbVwZ8CnKA1Yoag5jNOQvyp9Hju+iaz43NQG23l+IHMQuH8937Vx2zmwOOwpzDcSxV+gd/HI6DPF3LluYj/zHUfPssti7BJT0lGzgkGRUsV0pmLnbVQgItiVxR8K/Ba+6ZBrO15Ci9N5v8+VEn0q4xapmSEEYtosn8JbEyWK0h9cwAbRPNgUCj8Y864dij2zMHus+fuJHAYK8GylSoyxfEul5QzXKUacOPP+tYDGgYKWhhtSq6E7A/z2RyjrgO0LjO6oYRCiW72HV9qJeYQ1w8H0LAaYGIbcs8ddbgE5Iq3n8WzaQPk5Pc2JYX2coJQa3CVe4DbsFesIdr4nx9oN8TL37RefT0CDStTefuZobw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199015)(2616005)(186003)(26005)(83380400001)(38100700002)(6512007)(41300700001)(2906002)(8936002)(6486002)(478600001)(316002)(53546011)(6506007)(5660300002)(66556008)(66476007)(8676002)(66946007)(6916009)(54906003)(36756003)(4326008)(86362001)(31696002)(31686004)(66899015)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cE5ZVnlJa1pwWGwyaXl1NnplWTdwL0NaUHhDa3BtQ0dzUEJ2aFQ2VytqczUw?=
 =?utf-8?B?bDc1V3dNRDZsRUphUnR4L0hDOTN6SHg5ZzRzZXgrNHdIbndkVkc2S29IOGl2?=
 =?utf-8?B?S0dTVjVsN2oyNFMvOGZFSVNmYVJmbm1tU2hISUlraUVaRXhocXFyd3QwQlpm?=
 =?utf-8?B?RUtLMDczVk5lRG56S3BQKzhUUzFzNUtiWjJvVjVHSVNnQTFGWEEyTEFJMWZn?=
 =?utf-8?B?d0RqUGdLdjV4VnlqRlp5RkpMSWVkcWhvdEZZQnBoaVlkR1VvNE9QRkd1RVpG?=
 =?utf-8?B?WTc5WjJxMHlTUGxrTFJic3E4UU15VC9NUVVkVEFSTytlc0didGtxV1IreTZK?=
 =?utf-8?B?eFVwY1pUWXhHcTN3MXZqOGJ1b1lKQ1NmdXkvclkyV1IwVTUwK0t5aU5WSlc0?=
 =?utf-8?B?S0ZkVDZYWGJocHVoQUpkRWNMSFhmZUlCMjdVUlptSjdqckU4emJES1hBek5D?=
 =?utf-8?B?QUNVZzZUcVBhUFQ1MEhTR3RkSGhCWFZPeFJKa004LzlML2JRVFE0SmtuZUhI?=
 =?utf-8?B?MksvSTdjbWJzTUFES3pOUEYyUmxTY2FJM1g1ZG1CcS9ZRGJaRStJMFVVVWRp?=
 =?utf-8?B?eS9GUXgxUG1YdWZ5YVMvekhFWFlFOHJ6N2JLLzd6a1JxNlV3czZ3TkpsNjlv?=
 =?utf-8?B?Q1lSWWU2T3p3TXBUQlRPNG93WVdPd1l6OXMzYVNWQVJ0Z3RFeDh5ZGNSOVV0?=
 =?utf-8?B?NHp2Z3hXTFlsNllGMGk0UEV4MTdMeEVPbWpGV2ZmM2dGM1p0UnI4ajBNM2dv?=
 =?utf-8?B?bVllQ3JaOEZFNzhjU2N6cTdNbG1HVFJ3cXZYUEZGUjJnSXlBazhnMlNDalM0?=
 =?utf-8?B?VkFOV0NPMzVtOXZIcElIN0dYTG4yQzBvaWMrTEU5b3ZhcFQ3czZYN1ZjcnI5?=
 =?utf-8?B?WmFMcERSaU9Fb3JrejUzZDVzVjdZcktNRnJiWmZ5cUVIdXU0Mm14dTJKSGZE?=
 =?utf-8?B?RlRPekpQVkY5WXpMaTB2ZmxJMzQ3Y2Y4SVB5Z09HTXlFMTdMdWI2UjNYNUhH?=
 =?utf-8?B?eE9zYnlxWmZESWY0MzNDVkhuczE1SGVOUE5Rc2h1VkVMMGNCQWFpVEV0U3VX?=
 =?utf-8?B?TWNyd05sMjgzaVRkNG1RM3JRNVhxSTRMMTZIUkpXUGpQM0FSTnJxM0dFNlpD?=
 =?utf-8?B?cERrM2tqaHBselZoSitoY3ljYVd4WFNNcExuRFY3Tmhkd3RGd2kxUWFQakFU?=
 =?utf-8?B?M25mTU8xd3IwYTlZeGpTZEVCN01BZ0RZdFBpWU9XV2IwaGQxdStFZE0yOUcx?=
 =?utf-8?B?cUVhV0UwYmRvY1pHTlN4UXdGc1J5bjc4Qmo4QXZxSWlCUFJNdU9DVDlQSFUv?=
 =?utf-8?B?NGgrOFB4WjdKbEg5NDZTdDJFeU1mc1dzbGZnNU9OclJOb0QyM3J5eVJXT3py?=
 =?utf-8?B?bTFCajRLQlA1TTV0RUxkU3pZVThiby81akp1QjVRazAvSUt0Y1FLcEJFVmsr?=
 =?utf-8?B?VXc5cHhSdVlwYnk0bWRsS0NIWm4vU1FvSHNVWDRpaVYxbU9Ud3lDTXhPKzZW?=
 =?utf-8?B?MTFoOTMwRzh2OUxoU01PWTJ5VkpRSGVzRGFPZGtZS0x2TlNweEcrSkZpODBR?=
 =?utf-8?B?QWJnb2JqeTZ0WDRkUXREak9KRkJPQ3QxcWNkVSszeE9qcUtPYzh3eElSL2Vl?=
 =?utf-8?B?akJWQm1ZbE1qQ1FEWmtkRmZ6dmRoWGRLRzd1U1VnV09EY1NaTlFJcXhobFpZ?=
 =?utf-8?B?RE1YLzZDRHRWL1I0ZGVEWElsK0RTaWE1REtIelNJdXBlUUR1WnNLN1JMdnI0?=
 =?utf-8?B?S3dSb1ZMYWpCMm5tSlVCUHZVZTllRVo1aFpqWkxPS1AxbEhDN2g4UmpBTHoy?=
 =?utf-8?B?V1pCWTFDY3NPUUd0RW1rUnFaZUh1TnBkMWM0OFRSS0JMRmNnMENkRFpscUx6?=
 =?utf-8?B?KzdTbjdzMDdWZmJlT3BjWmgxL0RFc0tpSDl6U2R2a3pCN0NpZTh2bGc5OTZr?=
 =?utf-8?B?Z2ZKOFRYY2ZISE5IYmVrMTkycjdCT3VZZWsrTUJCM2NZeGUvODlkT1BLNk0x?=
 =?utf-8?B?azZhZG5TbW5tcHpsV1dpSnVOclA1a1JPam0xbHl3M0dPUG5HaFo5VzcyazAz?=
 =?utf-8?B?K0NqRDYxOUE0aERtdHUvbnJicUlhNmZRZzlMWk1yeERINXNEb2JMTWdYZjlX?=
 =?utf-8?Q?BoSsj+GeiBIDABzot+gs+XyDE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea5acf2-ae3f-432d-3047-08daa21b8a67
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 13:07:19.7587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FIDWHT4r+vFBBr/M690/bZy/RuuUxQQFyTgxWx+3pEmmAKejsdHvxKsww5lyS8qIEFpn40rjG+1OdHvSzGAFIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7727

On 26.09.2022 16:22, Tamas K Lengyel wrote:
> On Mon, Sep 26, 2022 at 10:12 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 22.09.2022 22:48, Tamas K Lengyel wrote:
>>> --- a/xen/arch/x86/cpu/vpmu.c
>>> +++ b/xen/arch/x86/cpu/vpmu.c
>>> @@ -376,57 +376,24 @@ void vpmu_save(struct vcpu *v)
>>>      vpmu->last_pcpu = pcpu;
>>>      per_cpu(last_vcpu, pcpu) = v;
>>>
>>> +    vpmu_set(vpmu, VPMU_CONTEXT_SAVE);
>>> +
>>>      if ( alternative_call(vpmu_ops.arch_vpmu_save, v, 0) )
>>>          vpmu_reset(vpmu, VPMU_CONTEXT_LOADED);
>>>
>>> +    vpmu_reset(vpmu, VPMU_CONTEXT_SAVE);
>>> +
>>>      apic_write(APIC_LVTPC, PMU_APIC_VECTOR | APIC_LVT_MASKED);
>>>  }
>>>
>>>  int vpmu_load(struct vcpu *v, bool_t from_guest)
>>>  {
>>>      struct vpmu_struct *vpmu = vcpu_vpmu(v);
>>> -    int pcpu = smp_processor_id(), ret;
>>> -    struct vcpu *prev = NULL;
>>> +    int ret;
>>>
>>>      if ( !vpmu_is_set(vpmu, VPMU_CONTEXT_ALLOCATED) )
>>>          return 0;
>>>
>>> -    /* First time this VCPU is running here */
>>> -    if ( vpmu->last_pcpu != pcpu )
>>> -    {
>>> -        /*
>>> -         * Get the context from last pcpu that we ran on. Note that if
>> another
>>> -         * VCPU is running there it must have saved this VPCU's context
>> before
>>> -         * startig to run (see below).
>>> -         * There should be no race since remote pcpu will disable
>> interrupts
>>> -         * before saving the context.
>>> -         */
>>> -        if ( vpmu_is_set(vpmu, VPMU_CONTEXT_LOADED) )
>>> -        {
>>> -            on_selected_cpus(cpumask_of(vpmu->last_pcpu),
>>> -                             vpmu_save_force, (void *)v, 1);
>>> -            vpmu_reset(vpmu, VPMU_CONTEXT_LOADED);
>>> -        }
>>> -    }
>>> -
>>> -    /* Prevent forced context save from remote CPU */
>>> -    local_irq_disable();
>>> -
>>> -    prev = per_cpu(last_vcpu, pcpu);
>>> -
>>> -    if ( prev != v && prev )
>>> -    {
>>> -        vpmu = vcpu_vpmu(prev);
>>> -
>>> -        /* Someone ran here before us */
>>> -        vpmu_save_force(prev);
>>> -        vpmu_reset(vpmu, VPMU_CONTEXT_LOADED);
>>> -
>>> -        vpmu = vcpu_vpmu(v);
>>> -    }
>>> -
>>> -    local_irq_enable();
>>> -
>>>      /* Only when PMU is counting, we load PMU context immediately. */
>>>      if ( !vpmu_is_set(vpmu, VPMU_RUNNING) ||
>>>           (!has_vlapic(vpmu_vcpu(vpmu)->domain) &&
>>
>> What about the other two uses of vpmu_save_force() in this file? I looks
>> to me as if only the use in mem_sharing.c needs to be retained.
> 
> I don't know, maybe. I rather focus this patch only on the issue and its
> fix as I don't want to introduce unintended side effects by doing a
> cleanup/consolidation at other code-paths when not strictly necessary.

While I see your point, I'm afraid I don't think I can ack this
change without knowing whether the other uses don't expose a similar
issue. It would feel wrong to fix only one half of a problem. I may,
somewhat hesitantly, give an ack if e.g. Boris offered his R-b.
Else the only other option I see is that some other maintainer give
their ack.

Jan

