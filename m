Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAFF68C0D1
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 15:58:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490535.759288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP2wu-0007bj-Ng; Mon, 06 Feb 2023 14:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490535.759288; Mon, 06 Feb 2023 14:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP2wu-0007YF-K7; Mon, 06 Feb 2023 14:58:28 +0000
Received: by outflank-mailman (input) for mailman id 490535;
 Mon, 06 Feb 2023 14:58:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pP2wt-0007AJ-IK
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 14:58:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4fa34ee-a62e-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 15:58:25 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9191.eurprd04.prod.outlook.com (2603:10a6:20b:44e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.28; Mon, 6 Feb
 2023 14:58:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%6]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 14:58:23 +0000
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
X-Inumbo-ID: b4fa34ee-a62e-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJkPzIc6wIH6C/6f2KgzgIrpD2sOHMcsrDwUmI2Q8CTQpcT182vkUZCWbpyvFPx/C8t3NvOys0WwDqAsYxY7vG7wRqmsUJbdu/3AvsED9xqy1LTXSzh0vQc5CxpujVFJjys3psNFUfIuiXMvh0oXifJeFV43UemcZEd+Hww1BMpsEQm8Gqi+f3SDIZybP78NjqmEBr8uG1f5Oq3PfkPd3RSZ2UDaYbJUz8I9yRaEtU0B+UtxqWByodLSoC8M482NWGjluga5z4B9mpvsdYLNvLfH89bQMlqqw/UF4mpJjqOFN8iPiTVWGKNALkQhwDJL/TC8zilqn2XRoh8YkorCgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qzu6Mi2Qn6keAXqnf3Zaw1uvfZrsjJe08f7O55lzQdI=;
 b=cUXJ/YiUTQ1oRnXEzadBCdGbQlnndY62Wz8UCn0piAaoUTuq9VgtmuXi35LTAxGbVSdjHksCTGuZQcQ8xj28ji+ntBU9q0yu1H1zCWJ0e1fVMS1D+7lucJK7QOKaYF7XQHg2S0ejCQfogclUuARJ6IUOnoWQE1Jh+sTEd9T3shP5rj1h23J8yxKmorZzkERkVBJjilkr7M7ghdZRV5OaqD7nepO2dYs5a+w4YAvBALefUdkrwL90n77/5Hj6dY5B7MxGeAME4Jr736qpoZXECMqgkJudibkr7DVTzVQKGbuA1Y1IlQ7x/9GOyBWhR9fIdIh6dZQnUVONDr+NUdZEgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qzu6Mi2Qn6keAXqnf3Zaw1uvfZrsjJe08f7O55lzQdI=;
 b=202WebaB6x/Xn/ZSd5+1+EFn561LlEDoTYCU+26s91ACeny6JNes2S+V1uJtdomL5QaOoQr6W8eRNQKvtJAOUDmHx53IU3b2eXBnCxPl7saVUFM7HRPTYxdfC8OQbQIk9jDp1hWwoINsgjuLEo3Zd1adbNKKoWxfeyRWhoQhrMeIBztmk5QiFB3AVNrd7/AYgOihAhcMeiYX8xIM9lASNsGEM8J+w0aYV2JU7KjaKr60gwdAoWFad7Z1FEi2gwADSFL3gssy2cNNoiLwnfxph6OeAS4fRN/AeYXj93CDZ0/jV8rxcb2bV2KD7L5TpcSba/Wz5FuECo4kIROYkhvL+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a5cfa9b3-82d7-942f-f71b-80826e93ff03@suse.com>
Date: Mon, 6 Feb 2023 15:58:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 3/4] x86: limit issuing of IBPB during context switch
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <930254a6-d0c8-4910-982a-bfd227187240@suse.com>
 <c39faba2-1ab6-71da-f748-1545aac8290b@suse.com>
 <d0a0960a-f110-c065-753d-9f000ca379a9@srcf.net>
 <0acfa717-8711-599f-4d29-d92a1466a1db@suse.com>
 <ef52740c-7352-84d3-248a-5aed6f076d6d@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ef52740c-7352-84d3-248a-5aed6f076d6d@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9191:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dbbd568-9f83-43cd-209d-08db085297be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tnVuyJjsR//9KmlS9SHtFIt7wzI8q2NbACX0Svqc46QhN3jAQVDmoj+KAzgzFKbkwZ5+yXUOJX3cLt+jURGUijuSdOHA/1c8zSqyTCb5AMOsYs7ZVb4k8DwxFK5nkTL45MO23RQzM607LuIUbk323HgDfbJ7330B8vOAdVtdGsmMjGFHSivCviLks0gxt3ujGGVNKsGnLiCnk8o4ak+/Y2q84Qmy/foAt7eq0AGAOvaITIHi4RMeOUEbL+Ro03srbv4oNLX2pHkNYkhdyrrMim42QjRveZbr44zILBkRVXD1pwwLbdCh3NgVBFvLpDbndXN6uq8aYfouJPvOgQ73t4JxpPbNkIwV1c5CY0+yISSQDqxZb7IkWR+DJngwJBJFrsD6uL8TAzb9PHyU2TgoWhRfXLnIa4Fcoc4WibKayhswUiMlSfhWWt/bMVn2hcXSH/Cu4nHziHdSRxAV8EP3BwDCySTu7jJ7uKLUSEpRvQ2dY85BhUloadsqgMoMIzAmoDb0Z7hbxr1Doh7CA0q9WdeXRNaKzCF/IEqBqfaIZ6vQP+laEBYmNN2TcmUr2nhb2wNETxyKkY/H6NEKr1Q4+eQ6QgbOoJBbK1iuQ33DYAEzurmPmguDlCQZED1tTlhAr+AxtXXgdPlnJuxltgV089T41VPcwHTOw9MsSFn5C6oL9f/+1fBfpmMCyq2RLaqaBWpaeoRteJO1KucvJUbXqid/QMLril3gtXLsLCKhZH4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(346002)(396003)(376002)(366004)(136003)(451199018)(6512007)(2616005)(6666004)(36756003)(53546011)(83380400001)(26005)(186003)(54906003)(6506007)(478600001)(86362001)(2906002)(6486002)(8936002)(41300700001)(5660300002)(316002)(31686004)(66946007)(66476007)(8676002)(66556008)(6916009)(4326008)(38100700002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTNobVcxREx0dlB4U1NmUjRoNXJWMVIvOHVDMCtqSnVtWFhWcGtxVXhKdVNJ?=
 =?utf-8?B?U1VuNko3cVgvWU8wVG9nZ0VHcmZHcUZrSTQzZFM0ZkJkMHBiRk5sQ21VWHU1?=
 =?utf-8?B?REg5eDF4N1JGd0x3ZVRPUVhpQi9jbjVWK3JLTnAyRit1SzNtUjlBanlsa3N1?=
 =?utf-8?B?Qy9sUk9uaHpWR0dqSWdmUnJ6cGZyaC9WR3BGeFY3bWJ5ZGFsREYyelpoRkg0?=
 =?utf-8?B?MEw0UzlpdnVkNkpKb3lxQldZaW5ZR1FFSDIvblVmTEhFcDZIcTF2TDZBRGxE?=
 =?utf-8?B?RGczMXo0R0syWDhBbjZTQUZmaXl0M0tlUkVJckVpTG5UN0ltdmQyek53Yks3?=
 =?utf-8?B?ckxwSjBxUmxCMDlKOWJIRXluWHE0RFg4VWhhYVY0WDcwTGNSSEVaZTRsM3dy?=
 =?utf-8?B?NW01UlpoMEVReGlybEkwbW1maWN0VjIyejYyQnNmUGFJdU1KRTg4WThSbGhE?=
 =?utf-8?B?d1Iwa0VKU3ZZaXhFT01QUDM2SThQaU9iQnQ0OW4weXdDbmRyTEVtTmdBNVFT?=
 =?utf-8?B?NXBYNnZSd20vTGkrbjFUbzFWWUJ2Q3hBaWZmZEVXZWJOOStkMUVmdExaNDhQ?=
 =?utf-8?B?OXUyaTRRWjRjWWNJMHBINTdQd2RBOG9udXo5bzRxRldoQ1dMcDdXNlI5WFEv?=
 =?utf-8?B?TWlBWThQMTVwSitFS0ZHdkczTmRLU2dLVnJqVTlvNC9udzZLMWVWVlNoQ0l3?=
 =?utf-8?B?bDlsNDdTTGFXdDZCRHRzRVVBTm9VeE1CQTZFeE5MRUdpRGFwZmNLSmhHaElV?=
 =?utf-8?B?NC9PMWNacjNwZXc1aHVtbkYvOSsxcWZQaUlUV2JMb3hGbUkzQWFlU2hCVGRS?=
 =?utf-8?B?Qnk0cmFXMSszeVd5MnJWblBsL0RmaUJHOFBVa2pldW5ZdENKZjJzbkU4QXVj?=
 =?utf-8?B?eVpPYkJ3aUZwOE16TkkwZ2NMQldKcHRjRkV0U0t5c1NzMFdXMnVjM3kwT2NU?=
 =?utf-8?B?a3Z2RllZa1dQMXp3dDYvVTZGVFN0RVUyRzVMbnNjY3lEMXRzYStGWWtOQ2Q1?=
 =?utf-8?B?aktXTUh5aEtuVXdQU1hpNmF2ZVRFRnRUMGY5amx4bFVqZ2k2RW0ya1NwQi92?=
 =?utf-8?B?anI5QWt2MzlRa2paYWlaNFhaaWlHMVp2bStWSkg0ZUViOXVaT1NtWVlSZy96?=
 =?utf-8?B?OUZtd3YxaXhkTno5dDNzNGpjL0dNWVMrNXBRcWt5akV3b29STjlNZXlXUEI5?=
 =?utf-8?B?NWM0TVJtNlJnTkRVaE41K2N4SHRSanhDelUrZ3JMMHZPVUlVcUJsMEFpaGJq?=
 =?utf-8?B?QnAwYWU3enlkQjZsV0Nuc1ZWaCszbVhCZ2xKaVhwZkFnSWhnWWVWZS9NZjFQ?=
 =?utf-8?B?aXYrVEQ2cmtEcUpEZWwzaWFzclA1a0NPUE84T0sxblJvWkJudHpTSENnR1V3?=
 =?utf-8?B?Nm5jTmV2YjM4N2lLQThwM09FR3BIbG9BT0VVc0xpSmVlckVjS3UvSGg1RWJk?=
 =?utf-8?B?aHBLR1NGWjZVZzlNM04zRU1vMW5zbVpLejg4a1l1aVk3MU5EeVE5SFc3RXRY?=
 =?utf-8?B?K0hnT0k3cUZDT1BUb1VxYTQ1dWlkb3RSM3dGV1pvcjJIckF6S21nc2hzemxh?=
 =?utf-8?B?NEJnYVFiYjZUTUVJNU1hTXVYYlNDQWdkVEdOYlY4SGhBSGFvcTF4cndRazlp?=
 =?utf-8?B?WUgrVzhLTTFCVzRJaWdtVVliNGZzQXIvRmlZRW85aHZlY3UxZEVVeWd5VkQ3?=
 =?utf-8?B?dkllblJsWHBDNmlwVkRIdDJ3S0hsWG5qSEd5N3ZKZmRtWGZGbnN4eDNhSStC?=
 =?utf-8?B?UmJDUG9CWjVHQmVNQWR5R1lpejgrN0QxTGM1U3RtSm1IR2hHazZxci9RejdK?=
 =?utf-8?B?cVVpTTd1NmtUS2NuZ25hcklsRVdJNE1ZYmN3UUFWWi9PVTFWQVAyVnhJYU9K?=
 =?utf-8?B?Z2VpaEhpOTBWakhzTmxjZFI3eElPYm03ODU0V3ZWU2VSRmd0R1hoNTQvSUVy?=
 =?utf-8?B?ZFlBeW9VSEVBL01mL3UzUDVDekw1bGRDeEErN2lsdDc2RjRRQ0tpRDlGc2JQ?=
 =?utf-8?B?enZyWlhqN1dad1EvZkpiTTllVVI4K3gvd2xlNitkSnJjSHVCSXR0c1ROVFlK?=
 =?utf-8?B?MThacDhWSk1GV3lRN2xSSWRhKy9paTlqa0t2Q09NeGs5NnRqb2JlQ3dxMzZx?=
 =?utf-8?Q?NczwxEnMgXLJLGqEQLinr7Itk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dbbd568-9f83-43cd-209d-08db085297be
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 14:58:23.1404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FVKog18ANDY4LBRO0CWYhgfBhaLOx/b0Nk8FEUnmJOd8fDWs+ZXCpFHQYwh5PVfhv9uk1hLhevZZoh5BmmpkAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9191

On 27.01.2023 18:47, Andrew Cooper wrote:
> On 27/01/2023 7:51 am, Jan Beulich wrote:
>> On 26.01.2023 21:49, Andrew Cooper wrote:
>>> On 25/01/2023 3:26 pm, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/domain.c
>>>> +++ b/xen/arch/x86/domain.c
>>>> @@ -2015,7 +2015,8 @@ void context_switch(struct vcpu *prev, s
>>>>  
>>>>          ctxt_switch_levelling(next);
>>>>  
>>>> -        if ( opt_ibpb_ctxt_switch && !is_idle_domain(nextd) )
>>>> +        if ( opt_ibpb_ctxt_switch && !is_idle_domain(nextd) &&
>>>> +             !(prevd->arch.spec_ctrl_flags & SCF_entry_ibpb) )
>>>>          {
>>>>              static DEFINE_PER_CPU(unsigned int, last);
>>>>              unsigned int *last_id = &this_cpu(last);
>>>>
>>>>
>>> The aforementioned naming change makes the (marginal) security hole here
>>> more obvious.
>>>
>>> When we use entry-IBPB to protect Xen, we only care about the branch
>>> types in the BTB.  We don't flush the RSB when using the SMEP optimisation.
>>>
>>> Therefore, entry-IBPB is not something which lets us safely skip
>>> exit-new-pred-context.
>> Yet what's to be my takeaway? You may be suggesting to drop the patch,
>> or you may be suggesting to tighten the condition. (My guess would be
>> the former.)
> 
> Well - the patch can't be committed in this form.
> 
> I haven't figured out if there is a nice way to solve this, so I'm
> afraid I don't have a helpful answer to your question.  I think it is
> reasonable to wait a bit and see if a solution comes to mind.
> 
> I'm not aversed in principle to having this optimisation (well - a
> working version of it), but honestly, its marginal right now and it has
> to be weighed against whatever extra complexity is required to not open
> the security hole.

Well, the condition can be extended accordingly (see patch fragment at
the end), but the question is going to be whether the more complex
logic is going to be worth the savings (especially in case it needs
further extending, i.e. if I still have overlooked something).

> And FYI, this (general issue) was precisely why ended up not trying to
> do this rearranging in XSA-407/422.  I almost missed this security hole
> and acked the patch.

I appreciate you having forced us to be cautious at that time.

Jan

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2067,17 +2067,26 @@ void context_switch(struct vcpu *prev, s
     }
     else
     {
+        unsigned int feat_sc_rsb = X86_FEATURE_SC_RSB_HVM;
+
         __context_switch();
 
         /* Re-enable interrupts before restoring state which may fault. */
         local_irq_enable();
 
         if ( is_pv_domain(nextd) )
+        {
             load_segments(next);
 
+            feat_sc_rsb = X86_FEATURE_SC_RSB_PV;
+        }
+
         ctxt_switch_levelling(next);
 
-        if ( opt_ibpb_ctxt_switch && !is_idle_domain(nextd) )
+        if ( opt_ibpb_ctxt_switch && !is_idle_domain(nextd) &&
+             (!(prevd->arch.spec_ctrl_flags & SCF_entry_ibpb) ||
+              /* is_idle_domain(prevd) || */
+              !boot_cpu_has(feat_sc_rsb)) )
         {
             static DEFINE_PER_CPU(unsigned int, last);
             unsigned int *last_id = &this_cpu(last);


