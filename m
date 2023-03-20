Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0816C0E92
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 11:20:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511814.791076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peCbi-0002fn-Aq; Mon, 20 Mar 2023 10:19:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511814.791076; Mon, 20 Mar 2023 10:19:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peCbi-0002d0-65; Mon, 20 Mar 2023 10:19:14 +0000
Received: by outflank-mailman (input) for mailman id 511814;
 Mon, 20 Mar 2023 10:19:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peCbg-0002cu-Mr
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 10:19:13 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20621.outbound.protection.outlook.com
 [2a01:111:f400:fe16::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a671289d-c708-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 11:19:09 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9379.eurprd04.prod.outlook.com (2603:10a6:10:369::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 10:19:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 10:19:02 +0000
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
X-Inumbo-ID: a671289d-c708-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=agOFGMETjGnKA7hgPRDWHhi1E7nVK4Mk4ITWg46yBA7wRuCcQmCvVmMqnEjYswjH+YWGLZ5T/f7pNEXYyjMVFkho92hL92ZgAD+J7I2FkCZNYeHHbYf0NdyfghykNDnLlI74443kOsJyjllcY0HCn7/jtEVAN1GtZxWKBbqanKaPo69jmEb8enM/3iD5Bx8OffqvdhnEnZLNlLL7RS9AfNWDP5xjz+LXD5QXx9Zex26APAUfHIEp1MW00TrafuBMwTYiCWBuJaqkLv8Fcnd6c78IVvvg2Q3DtOnuW/3TflCywq0FQ6gJ3vyVUk8K4qp1/ITrH+W61HS/7rAIaC4Ltw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gSMiMBCNZkcRHfygtqNOxaKnpvxxpOkcyf14xor2uf8=;
 b=Lcb1XoFFqrX1FwVSiBKrC8vu1CJZ9N4bfVhH+G1XS8bAD11y+SG3lXvuXS/xdLMjXPI0ydVnfG5mcivij2kOYKuLw7Xp6Op8p2mWzfk2s44IKZvg4Blz8Vj2lFWXOhDaWsKPfGMQgC0vWwiGgvj4wl6cKVqaL6trJMsM6AMCszO0MmkWvjDKYKMllOzsgCW937Y32YsfGCok9qRGaGW0RCNQRkJU5zKufhsKKYbVuUtt+baPLBbY+crpo5J9TPXkW3KmAgA5EpyXDYSqJKoxAfmsOUWCRSvFwvTMR8aVrfKAxUl9me73rkgI8egyaCoR0XxWIkXSplnYXByqTEEFrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gSMiMBCNZkcRHfygtqNOxaKnpvxxpOkcyf14xor2uf8=;
 b=wyO+ZBWjhfc+jHqdq/78TLizu3oart09HZD2EJUHv946oS4FC3MLu1EGGn34KKl14v3QVyYdXmnLelEYab4mTcHi682zmLWtDZSonYwEx+v+gmie/zum8aLdfYck5s0PiSIWcMx492bgmYdquC4zZ1lXIkx941TJPVZF3gqgcse5yZjJ117lxKxiZOdtTjmfL7XOplV/ccsZTWLrWRl+dOAAwWtPIDnY1uoz2XHvyyR6N+at4NxfMq+Qcvyu3xP8V3nncfY7qGCCkqG3fvn0nvFRCqyGfVHANmv8knHqrb19uQogr+/6qXemeCSzkAuhvbnl9mnHxqCUg1+JsXONbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0834ffcb-978d-5c5b-4efc-64f3527e1038@suse.com>
Date: Mon, 20 Mar 2023 11:19:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] x86/Xen: make use of IBPB controlling VM assist
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <51ae9cad-3644-02cb-9cc7-28229987487d@suse.com>
 <c4d2641f-7a99-fd8a-53c5-faa277c572a2@oracle.com>
 <4e66865b-11ce-cbd1-d115-13e3743eed7b@oracle.com>
 <f4f8c6ff-8d3a-92aa-66a0-7978c989a42f@suse.com>
 <cf55f9d9-42c2-f5e3-ed91-f75cc4ee9641@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cf55f9d9-42c2-f5e3-ed91-f75cc4ee9641@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9379:EE_
X-MS-Office365-Filtering-Correlation-Id: a91ddaf7-e299-45f3-e28d-08db292c86af
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bPle38cpf05n6nDcy290k5PgphQi3BG6ICbixz5v7wnu4+WG9xbRvQd8Ps8Gej0eT6mdq3RJ+VBhCtS0LrOrSnxTM5AA9LUQ6DSGxS5jmZwERb17JgBmQ2+nkoNmPIQgATTOUQcS5clmxgQYaB3voShcZ0jnrc8KTtHVDK6vXc8DrvcN3zkLoe/jsOMS8rCbi8p66l7NEmzOSeeeuZumiT/r6UJaqUYq+36xLR3pLebSYln0GfUF9o7EAuftB8SnWIPdOJZTN0CSqd6EEuuope5Xv7lkh+UTW9uVOAMt7ikX5S5jykXGtK/FoYAJP5AxYMTVkDEaJILugnqVEe6p6U1nAsM1+7L7EfVEORa1dYTfhy5qUnIsiC2CvNZfXtbESZoQPEC+sdfxGVfMzWTUYfxiXNkbHJtCKUL+o4ElCdo02zrN7u81YxQDjrq/w6Ob8iw4bBsQbxYHrXv5Ooj6NHKvoZYcVQboSJwqJvaIqgOmK0+oW6YtX/D1QOUNKCiCJS9bgefgZaEfqyKAJaWaOxT508Dkzlek4DKWZZTYthKFIgQc9udXP1gB3dUyARP40PVcshDWU3lNrh8NFRUcu5TAXqDuteab2NhiJRKiQGck+J5AdY4hOISRt7Y4WIfyN5RUrgwpPgOL/M/PiR1Gvn7F9y1OWIfAlW1KH3Vt+lqVfGscDQTlFZNeOrFlHWF0Ch3+R9OAcJgEcmg0keKbijl+W2qoBxfdUrfsmhj/mBM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(136003)(396003)(346002)(376002)(451199018)(31686004)(2616005)(54906003)(83380400001)(37006003)(478600001)(316002)(6512007)(6506007)(6636002)(6486002)(186003)(5660300002)(53546011)(26005)(31696002)(38100700002)(86362001)(2906002)(8936002)(66946007)(6862004)(41300700001)(4326008)(8676002)(66476007)(36756003)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHV4WjRycUZEMnkwQU8xZWRRemhLQmw1aUdkTlU4ME42K1lrWDBGOEFoWGYv?=
 =?utf-8?B?b1VVRDQrNEF4bGpFQlNBVTRnMVFZWDJJOVluWlkwZlZnaThKZGY0QVVDbWlt?=
 =?utf-8?B?ak5OZXJtY3prN0Q2ekxUVi92L2phZmd3Nk5xa0gxYUJTVUdxdEc1SElUZlJp?=
 =?utf-8?B?QzZ4NWh5Q3dua2xqNTZWNzJxNElDQ2xiTFhyOHhwa1N5NjQzZmNib1VjZlFM?=
 =?utf-8?B?VSt0TGJhTUt0VzRSeklVeWlGVFNSeGNickVVeDF5VTh6RnN5TWNTa0c3djVW?=
 =?utf-8?B?ZExTQ25tZjQ4bVAxbU13VzgzcUczcXJTallpZWFqQ2U0R21zYVpBQVJ3QVhl?=
 =?utf-8?B?UDh6NkNEWEFieldrYjRRSzh0MmNHRGd1Nm1rbUtmNVFSN3ZVZ1VBdkdRTytR?=
 =?utf-8?B?UURJdXBwNUFVYXMxc2JlRlIwa0FZV2pzYnBNRlFpR2lMYTB5a1BUVDFpSVVE?=
 =?utf-8?B?OFpZMnBGV3FuL1c1eGwvdzlRQSswSGlza0k0ZUNXU3pnb1krQThTQVpmeUEx?=
 =?utf-8?B?aFp1bWFUMUprTDVldVFRSGF5OHRUeElVU1FHMEZGa2t2OVU4akZSOVdDNU5p?=
 =?utf-8?B?M1dUZU1QVmxEQ0NEcHZOeXJoOVZGdG1JNEJvMktHNS9HVy9lRnRxM3N6Q3o0?=
 =?utf-8?B?N2MwVmh6ajR6VkcvYW9KcTdNSFNXN2ZueDZuVGNBL3BYaEZ3M3JjbHVZSG11?=
 =?utf-8?B?ODR1UHNOdUY3bUF5NWloSUtnend2QkNUdXJ1SEcweUhjUTM1OFVOM241ajBU?=
 =?utf-8?B?QWo0djBNK2pxSjhtdEJqWFRlMDA0MU1lWVVnMmNaZHdGTC9ESk9hZE4waitX?=
 =?utf-8?B?VXZPMloySElDNXJLVVdJcW5ETEhkeFp4VGlGc0lWUmpZTCtZZUwwZkoycDA0?=
 =?utf-8?B?UVVUY3IvTXZXS0Y3eC9aRWxZQUxYeGtWNTFFbkZDeWY1U0c1T3Q1cEdidm5Q?=
 =?utf-8?B?dnJVakQ2emVLU0tiWDB2U0xWSXZFcUZsK3B5UnJoVWpTYkZDSnBGQTNDb3NT?=
 =?utf-8?B?VjJ3ZUYxZjRaUzF0eUJXRGlxTU9aVVR6QUkxMW50OU40aWZDR0p3VFk3bUc4?=
 =?utf-8?B?cmhuYldNNDRFMFpKbTVCSlVGMXVac1p2Z09BYWxZSWZRb3BodVFGbnNzc2V1?=
 =?utf-8?B?Z2lDa0ZjSTdxeWc0b1JSdi9uMEtlYTJ3dUFaMFlHaGlodDhONmxKRFZDdC9p?=
 =?utf-8?B?czlHdlMycUJrZjlpTnYyVDB2OVI0S3lDWmlxVnZ3SHdSM0hhVUMrUWVVbG1y?=
 =?utf-8?B?a05QMmdTVjNBQ2JZN3B3ZGI3Zit1OXRYS3ZBQ0NDU253aE5RaXozU2JLYkFY?=
 =?utf-8?B?VTg0LzVERWRVQXhHcmpzZ0x1Z09CZzU3Zks4dllMUTY2Z3JlTUhkWGIrNmVp?=
 =?utf-8?B?aEVEWDhmR1NZNE9mWERhQlBtT0o5QU1xVnNYSzZaNUkvdndPRGlMak9Tdkla?=
 =?utf-8?B?NkdoVVBWQlZOTG1XSGV4Qml0MFUzVkNsbzZlLzdQYnQrY2dMMmJRcFJLTDFH?=
 =?utf-8?B?NTBqbTJpWTRiV1ZLZ3NGNForNlF5VWdJLzlTN281cm1SV3pNc013dUgvdmlC?=
 =?utf-8?B?VTl1dDU3dGdLT3ZHSm9tOVMwM3pBdXFNTkNpWmxwUWxRbkxvak1xeU5vVFBm?=
 =?utf-8?B?OGVDSTFpbHUvTUdGS1RzMUp3U2xNR1hDRWZrYjVlRENYUWxhc3NQcnZvRnNr?=
 =?utf-8?B?WlNUOFEyS09RVDBLY0VBOGhYeHVFa2hqSUNlZktIekFlNkY3Um1ad3Y1OHpY?=
 =?utf-8?B?V05yMmRDNkcyVXk4K2lqa3VFMnUrUUw2VVdrWFpWcklRZDY5Yk1qcW1iQWhL?=
 =?utf-8?B?UDNYUWZaZjVnOVJraXEzN21sL0VkazNVM09yT3I1b2I3a2lzTU9QN294Z0dL?=
 =?utf-8?B?dkRISjM2L2RXRXVVQ0NQWlFhQ3lFcXhaOERUMnVXdlRSUGMyRm1mQmlSZmdG?=
 =?utf-8?B?cG1ST3N2cEJZcFk1MGZhWkRxSEx5Q0JIV2Z6cWUyVkpwakkvelBHQXFsbHpK?=
 =?utf-8?B?ZTlsWGpQMFBURTFyeUovSkZBMkp1NjFUVEZXcjIvVHYzczVKQlBLM25xSm51?=
 =?utf-8?B?akF5NzkzU0tsQU45NjdLenRaTjd3QkkwTUNDcDhlWHBwRWRLQzNxWTc0V2pZ?=
 =?utf-8?Q?r3suNlL16ub+YfkHqRqI7wu4W?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a91ddaf7-e299-45f3-e28d-08db292c86af
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 10:19:01.9593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1gwOgOF2V9LFpuPc4p7vZP4sNpWdaVW6dU2fSAbwreIvREZglQh2NmWGmW9i1dWNkcUCiN4rP1aKnf+gNTtd1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9379

On 17.03.2023 14:56, Juergen Gross wrote:
> On 15.02.23 09:31, Jan Beulich wrote:
>> Eventually yes. But I would prefer to sort the above question first
>> (which I'm sure would have been raised by them, in perhaps more
>> harsh a way), hence the initially limited exposure.
> 
> I'd rather add _one_ hook for Xen-PV in check_bugs() just before the call
> of arch_smt_update(). This can then correct any needed mitigation settings.

Doing this in single central place is what I was originally hoping I
could do. But that simply doesn't work (afaict): It is for a reason
that I apply the adjustment in the RETBLEED_MITIGATION_IBPB case, by
suppressing the setting of the feature bit. Not the least because ...

> So something like (note that due to using cpu_feature_enabled(X86_FEATURE_XENPV)
> DCE is happening in case CONFIG_XEN_PV isn't defined)":
> 
> --- a/arch/x86/include/asm/xen/hypervisor.h
> +++ b/arch/x86/include/asm/xen/hypervisor.h
> @@ -63,4 +63,7 @@ void __init xen_pvh_init(struct boot_params *boot_params);
>   void __init mem_map_via_hcall(struct boot_params *boot_params_p);
>   #endif
> 
> +int __init xen_vm_assist_ibpb(bool enable);
> +void __init xen_pv_fix_mitigations(void);
> +
>   #endif /* _ASM_X86_XEN_HYPERVISOR_H */
> --- a/arch/x86/kernel/cpu/bugs.c
> +++ b/arch/x86/kernel/cpu/bugs.c
> @@ -18,6 +18,8 @@
>   #include <linux/pgtable.h>
>   #include <linux/bpf.h>
> 
> +#include <xen/xen.h>
> +
>   #include <asm/spec-ctrl.h>
>   #include <asm/cmdline.h>
>   #include <asm/bugs.h>
> @@ -177,6 +179,9 @@ void __init check_bugs(void)
>          srbds_select_mitigation();
>          l1d_flush_select_mitigation();
> 
> +       if (cpu_feature_enabled(X86_FEATURE_XENPV))
> +               xen_pv_fix_mitigations();
> +
>          arch_smt_update();
> 
>   #ifdef CONFIG_X86_32
> --- a/arch/x86/xen/enlighten_pv.c
> +++ b/arch/x86/xen/enlighten_pv.c
> @@ -1476,6 +1476,23 @@ static uint32_t __init xen_platform_pv(void)
>          return 0;
>   }
> 
> +int __init xen_vm_assist_ibpb(bool enable)
> +{
> +       /*
> +        * Note that the VM-assist is a disable, so a request to enable IBPB
> +        * on our behalf needs to turn the functionality off (and vice versa).
> +        */
> +       return HYPERVISOR_vm_assist(enable ? VMASST_CMD_disable
> +                                          : VMASST_CMD_enable,
> +                                   VMASST_TYPE_mode_switch_no_ibpb);
> +}
> +
> +void __init xen_pv_fix_mitigations(void)
> +{
> +       if (!xen_vm_assist_ibpb(true))
> +               setup_clear_cpu_cap(X86_FEATURE_ENTRY_IBPB);

... using both setup_clear_cpu_cap() (here) and setup_force_cpu_cap()
(in retbleed_select_mitigation() won't work: The latter wins, due to
how apply_forced_caps() works.

But of course calling both functions for the same feature is bogus
anyway. In fact I think it is for a good reason that in Xen we log a
message in such an event.

A new helper could be introduced (and used in
retbleed_select_mitigation()) to check whether a feature was
previously cleared, but I did conclude that it's likely for a good
reason that such doesn't exist.

As to your use of cpu_feature_enabled(X86_FEATURE_XENPV) and DCE -
I can certainly switch to using that, which then ought allow to move
xen_vm_assist_ibpb() back to enlighten_pv.c (as you have it, and as
I first had it until noticing the build breakage with PVH=y and
PV=n).

Jan

