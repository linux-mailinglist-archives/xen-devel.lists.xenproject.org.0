Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A36625A0B24
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 10:15:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393151.631921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR80f-0003k4-NG; Thu, 25 Aug 2022 08:14:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393151.631921; Thu, 25 Aug 2022 08:14:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR80f-0003i6-Jt; Thu, 25 Aug 2022 08:14:41 +0000
Received: by outflank-mailman (input) for mailman id 393151;
 Thu, 25 Aug 2022 08:14:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2f78=Y5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oR80d-0003i0-Ne
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 08:14:39 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20089.outbound.protection.outlook.com [40.107.2.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6449419-244d-11ed-bd2e-47488cf2e6aa;
 Thu, 25 Aug 2022 10:14:38 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB6107.eurprd04.prod.outlook.com (2603:10a6:10:cf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 08:14:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 08:14:35 +0000
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
X-Inumbo-ID: f6449419-244d-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lghoL2N8hnMOkcRQ5R54XsMiX+aaqXOtheDkhUBAgACDn6cuwwWMTLxgxMK84Zqi+ur4uqPqd2e++bi8oLOVeIgtVFWlWn5CFbUBYAGOSk/bvLHvXZIlzhqZFQU3ro7P3p31eyGPc/SLIkO69L2HbahPvdGtomKqxGnt0ei/3rv4sfR8Tej4G1vT5W85dqWSve3QldvEdSdhoSaFGGG4jKoqS9t5R+4OWd8bjanwJXrgYcFc4RFuI06UyFJ6sTRFzbLGqREwTaFkjSJ5vK6gzkIK+R0jpdKH+HG7y8kRtwpKZwMKlEL5VcwufVbf6oM8lWP7RUHdE/8coanK3ZmJTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2laNYOefkGXFCHtfdxjEd+AXI4VePAMxNeB9REsqUno=;
 b=KZrskn3FNr9+ZK/O0bLO0+SIXVXF0nzB+FA+QBLIE3/WGOKvm4jXgra/P7o9ONHjKDq42rypEv5GVsD+SlsseBU+pnhmz9lWfqdwL978eGgOPmi+Tl9afsFTcQ71ltIUAndWXM99rziy+K2pp3hB+qKoO5Hoyr/z/bulyCoct+qjiW8SWGxl0OtlIkQ5KX5E2rnnkB4YMuiJL/XUl+PfuAVwfJoowVH7ud8zgj2im2tC83xph6ZpTdcNem0Be6ikv06+thXicdwOhf9Kz3NGYOVSsRolfZYVoqI3GQzGC63KCU8tsRYzIDBUxvQ0QL+BFMq44AB6s2IExVDWlQFakg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2laNYOefkGXFCHtfdxjEd+AXI4VePAMxNeB9REsqUno=;
 b=ssXdRBBw32XDrN1/bWlA+G1R88Lm3fYqiEb0BybtX2DZlp1NZzzt4waOaKqwXhOk9PX0FurX5rXyd+CYiTMfUzsPbAICRmDiF3PUE7C+QAeQySNXoLvO1Ol1D3+uopfxI688rEdpt49TM/Aojh9zfubMVuhhXQlBJbvtorqk+Iut+OW3UJpZJp8BTgBkXEsdVfW758kXedJcQKa4eCSkmsV3PqtSRII0vKb7LCFM+cSn3pyvJO0VHcizUzg8k2CsjTZBH3kAcv04GRMnMGogTxJdHUPFWlr4EscaHJyhi+zRsOU7ejyLYwxQ3d/+yEfSi0RatoWp1rdiTd4Y0n7NMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <481a93ea-fddc-2a76-0833-2d6f07495313@suse.com>
Date: Thu, 25 Aug 2022 10:14:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 4/4] x86/hvmloader: Move various helpers to being static
 inlines
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220824105915.32127-1-andrew.cooper3@citrix.com>
 <20220824105915.32127-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220824105915.32127-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63781705-d85d-4035-e430-08da8671d8c7
X-MS-TrafficTypeDiagnostic: DBBPR04MB6107:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nUki57TAbQwtOxA3FmhT4FXEIh9zfyPs+tAfSM8sVqOQX9DHEibeCLM3QQiGEEiPbz1b3EE8J857+d0BO3A0M6AyfVl/+dBqhqHJYrqCgCSDb1TNsKuGLYR9sZh87alvFiLfOnJGM3D9ucazDO6VeabNQGT2wSUwAFRXjaK4hm+49B4eecg8zia1Gx87IKRSCq12mbndf4/786/eoRmzJ7V+RgqE8gjD2eR4fgjPetP4yiRmBSeRVkQeJUxhZR4tKha2m0wUjXpXYNKdxNTnabfRiDOzZomk033aloUb02RDvyNV524QMCcG213sdqsdXQL/N1RnBk6GlaT5yW5hrhDdVYwYxagT+ZgKL20yo9P/Jv5oi1vo4ad0gideNpDhR0p6qX1V/WHHsQ8/cm5CLG+PbtXfp+lILdZQ788/X1lXgG/6sTGRzdNWKrqCaO8CCM0D88dJpUcEqIwoD5g94L6YyEIhu/Dy8YxOTfBBsSfrjRw1oQeDRWaPSE7AMK1Oq/e+9WbDzAVLTvx158VQsTuskUSF8QYLIO/y5zzJM5hdHJ92gaXh/YXBsTrp5kYrnK6PhEYUWfLaNvvfIlP1Ifpczm70E9xZV3nJWoH52YQ3eVHyR1oFKowZopVr89Y2jwBzZSpQ7a+PsQgY+gvUf2/VYVunKr+2q1bpilhmPMbp5QbPh+52QPKOlO/bH3qjln1FQ3Cm2JWdOQ3wfNUv6wnDw+OHsn4s2OEQVMscblVf6pNOJNLHmzaVRdzFF3Hy7Bjf0VJ54hozmUeGMCdWeBRaB5gLMJm9ub87O0ju0ks=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(136003)(376002)(346002)(366004)(2616005)(38100700002)(186003)(4326008)(8936002)(83380400001)(66476007)(66556008)(5660300002)(66946007)(8676002)(41300700001)(2906002)(6506007)(53546011)(26005)(6916009)(6512007)(54906003)(316002)(6486002)(478600001)(36756003)(31696002)(31686004)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MC9tRk83UTVMMDJvWTlWSVJmQmVCVUFya1YycHVPRDhHSzRlZkxHOE5mNllT?=
 =?utf-8?B?SSsvSzd2YVFIWmtMUHliNWptaUpyQTBpZjY0ME55bk1CcDVRZ2dPS29HN2ZW?=
 =?utf-8?B?RzNVYnFiYXlSYjlGZmF4U2w0SU16TE1XWUF5RGJtV3lZaTVGUXRvQ1FOMFZn?=
 =?utf-8?B?aUR3Y3BwV3V5NldlTVdDUG1TcWpCbTV5NG04R1ZIRi9SRXZiemZscnp1NGR2?=
 =?utf-8?B?ZThNTXhnS0FzYzVYeW9jTDlmU1dMb0k5Mk9tZVdVaU1kN09XNmJCSGpYcUdi?=
 =?utf-8?B?MUF2Kzg5c3FuWlNJU05hQ2NKYnBEVmlqMEEzdFBKOVZIK3NOaDVZa0ZTSWxt?=
 =?utf-8?B?YTRBY25jV3ZmZkFEZ1B4am9tUGtrVXlIUXZCblJjQ0o2ZktoMks1eUpkQUw1?=
 =?utf-8?B?VXlwYjJqaER4eWRXNzBCRHNoQUxUMGxCODN2QXBMTHlSdlV0WTBxUUJYTUFQ?=
 =?utf-8?B?bGZRalhUL0h0SzIxMnpWNlVrczl6cTRQZzJ6d0htb3BBR2JsUHczSjhMS2F5?=
 =?utf-8?B?MXljaEdTQnhmdEZtRGhJRmo5d0JOQkoxMWZHeEF5VjZ4c2RneEsrWXFjdlNS?=
 =?utf-8?B?WExISDJuQ0ZDTXE3cVgybGd3UlVGRHBBNkFScXZJMGpPT1JUd2s2Vy9pSkRi?=
 =?utf-8?B?VnVOSGdsTFJrZkhhWXNLMU5abUp4WC9aRnhOdHlHRGpCYjAxOUdKSDFJZlYw?=
 =?utf-8?B?YkYzc0hYeStIcDh0aXBkSTYxdy9pRnpVR2RVanc0a0JwODdTcVRqNEVGYUR6?=
 =?utf-8?B?dUdrbG9hQnM0dGNaZUxzSVd4aHdNSVdLYnRmTjBvZkN0YVdVemM3SzdwSEtF?=
 =?utf-8?B?Mkw2eUFCbzNveTJ6WGt1TjRmbjRqUldJaFM2YVkrVFQyVjNQOGxvaXgxUzVR?=
 =?utf-8?B?eE9BRzh5SWx2ZFJ3eWVWQkN2MHpqYUFmWGtuQlczT0RTT0lnOFAveTZJZ1dq?=
 =?utf-8?B?NW9zQU8zbktIczZqRVoxWnFKOUVwOHNIY2ZqMHVXRk9UVWFETXcvOXc4RjJa?=
 =?utf-8?B?SjNhSFhoYkpQOEx1Zi84TUU1bnJtZGx6a1hnelVxUi9hSGxISC9VQWxvRVlZ?=
 =?utf-8?B?VTJHalIrRWxuc3FwcmFMYmNwTUZ3ZGtsYjZFTzYyUXE0Yk1WYzFPdmJkM2Ni?=
 =?utf-8?B?ZlNvV3BvT25sV3k1aTVrUSszdHFOUFo3biswcXNxNFAybzJsY216NmdGaVo3?=
 =?utf-8?B?bkNvNlFNKzA1U1BPdnJENVV5dHZhZDQ1c2VBNTdpR2g2WDZWOGlnOGdjTVBx?=
 =?utf-8?B?ZWVuNVEyUFQrdlJTSlZ1cmlPL1hJODk0c1EvZVFyWUl3OWZydFBLd3dsN1lw?=
 =?utf-8?B?UHFGbC96US93a3l5S1RXb3hOTFlPcytjeGpVbEtiZHFoY0lQQUptTWluc2Fi?=
 =?utf-8?B?R0pnKzJNVDB3NkhnT3hrNXhscUdCK2c1M214QU1KaVBmWGhCMWYrTUZsT0px?=
 =?utf-8?B?S1JyM1Uza3M3S1Z0UnlwbTFtUWU3V09EM2FCVGRMdURjTDV1MURNblZSVVdE?=
 =?utf-8?B?bngyT2l1WUtEdzdhcVZqNHN6djhYU1pURUhTcUNhNm14M3Q0Ykk1d01FYlBQ?=
 =?utf-8?B?SkliRnJROTlkQk1tZmZHL3VyekdrdEo3S2RxSng1QWt6OXVzWFVVMWtObHJh?=
 =?utf-8?B?bHF1N3RwSktCYmM2RU00M0VzaTFWVFo5ZjVOM1dVaVRsazhMZlpmSnZxWDBI?=
 =?utf-8?B?b0JnVk9jNlRzRDVnOCtMcHBnaVhKZTZwdVQ1VmxaL1hVam9BY0xPb0taSldY?=
 =?utf-8?B?a3lVV0FOMXlObGp0UlZTbTJZdnBXeXFXd0YzUWk5SjVMV0ZoTXdkTWlBeUo0?=
 =?utf-8?B?QysrZGFPS2hjd29ySUpta0F0bWEreDc3UGZhUDBNd1VoeFM4YWpUNnBVZUUv?=
 =?utf-8?B?WlV3blBBMk44NTF2aGlJNWZ3VUc1UGZDV3h6SFlzbnR5ZTJzQWlLbzR2cHhC?=
 =?utf-8?B?QmcwKzJldWVYVlJ3QzZibHNtbkFMTG4yMVhGK3ZNbTlsWTdVTnEyY1ZBTUJw?=
 =?utf-8?B?QXBmdFRSVDl5RnY2MkI0QUZwRVVFR0h0d0c0V2MzM2w1eHk2enVuazRsa3FD?=
 =?utf-8?B?QUVjSjBjaENTZzdwTGhJUWpjNnVXVFNtTm9HSEsxQzAvTlBHd1Z1aXR1UWcw?=
 =?utf-8?Q?pMAmfquVdwN1EMJeZtXw5fQ1S?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63781705-d85d-4035-e430-08da8671d8c7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 08:14:35.4001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LOg9kVSBYCFz1Z/c8TaW0m8mwLRhbi91IAIXwrPNmoGky7Tm4g2cwWKi8tT02CmqZULmyW1SUj8EpNqJSATaAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6107

On 24.08.2022 12:59, Andrew Cooper wrote:
> The IO port, MSR, IO-APIC and LAPIC accessors compile typically to single or
> pairs of instructions, which is less overhead than even the stack manipulation
> to call the helpers.
> 
> Move the implementations from util.c to being static inlines in util.h
> 
> In addition, turn ioapic_base_address into a constant as it is never modified
> from 0xfec00000 (substantially shrinks the IO-APIC logic), and make use of the
> "A" constraint for WRMSR/RDMSR like we already do for RDSTC.

Nit: RDTSC

> Bloat-o-meter reports a net:
>   add/remove: 0/13 grow/shrink: 1/19 up/down: 6/-743 (-737)
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit with several further nits/suggestions:

> --- a/tools/firmware/hvmloader/util.h
> +++ b/tools/firmware/hvmloader/util.h
> @@ -7,6 +7,7 @@
>  #include <stdbool.h>
>  #include <xen/xen.h>
>  #include <xen/hvm/hvm_info_table.h>
> +#include "config.h"
>  #include "e820.h"
>  
>  /* Request un-prefixed values from errno.h. */
> @@ -61,28 +62,91 @@ static inline int test_and_clear_bit(int nr, volatile void *addr)
>  }
>  
>  /* MSR access */
> -void wrmsr(uint32_t idx, uint64_t v);
> -uint64_t rdmsr(uint32_t idx);
> +static inline void wrmsr(uint32_t idx, uint64_t v)
> +{
> +    asm volatile ( "wrmsr" :: "c" (idx), "A" (v) : "memory" );

The addition of the "memory" clobber imo wants mentioning in the
description, so it's clear that it's intentional (and why).

> +}
> +
> +static inline uint64_t rdmsr(uint32_t idx)
> +{
> +    uint64_t res;
> +
> +    asm volatile ( "rdmsr" : "=A" (res) : "c" (idx) );
> +
> +    return res;
> +}
>  
>  /* I/O output */
> -void outb(uint16_t addr, uint8_t  val);
> -void outw(uint16_t addr, uint16_t val);
> -void outl(uint16_t addr, uint32_t val);
> +static inline void outb(uint16_t addr, uint8_t val)
> +{
> +    asm volatile ( "outb %%al, %%dx" :: "d" (addr), "a" (val) );

I'm inclined to ask to use "outb %1, %0" here (and similarly below).
I also wonder whether at least all the OUTs shouldn't also gain a
"memory" clobber.

> +}
> +
> +static inline void outw(uint16_t addr, uint16_t val)
> +{
> +    asm volatile ( "outw %%ax, %%dx" :: "d" (addr), "a" (val) );
> +}
> +
> +static inline void outl(uint16_t addr, uint32_t val)
> +{
> +    asm volatile ( "outl %%eax, %%dx" :: "d" (addr), "a" (val) );
> +}
>  
>  /* I/O input */
> -uint8_t  inb(uint16_t addr);
> -uint16_t inw(uint16_t addr);
> -uint32_t inl(uint16_t addr);
> +static inline uint8_t inb(uint16_t addr)
> +{
> +    uint8_t val;
> +
> +    asm volatile ( "inb %%dx,%%al" : "=a" (val) : "d" (addr) );

Would you mind adding blanks after the comma here and below?

> +
> +    return val;
> +}
> +
> +static inline uint16_t inw(uint16_t addr)
> +{
> +    uint16_t val;
> +
> +    asm volatile ( "inw %%dx,%%ax" : "=a" (val) : "d" (addr) );
> +
> +    return val;
> +}
> +
> +static inline uint32_t inl(uint16_t addr)
> +{
> +    uint32_t val;
> +
> +    asm volatile ( "inl %%dx,%%eax" : "=a" (val) : "d" (addr) );
> +
> +    return val;
> +}
>  
>  /* CMOS access */
>  uint8_t cmos_inb(uint8_t idx);
>  void cmos_outb(uint8_t idx, uint8_t val);
>  
>  /* APIC access */
> -uint32_t ioapic_read(uint32_t reg);
> -void ioapic_write(uint32_t reg, uint32_t val);
> -uint32_t lapic_read(uint32_t reg);
> -void lapic_write(uint32_t reg, uint32_t val);
> +static inline uint32_t ioapic_read(uint32_t reg)
> +{
> +    *(volatile uint32_t *)(IOAPIC_BASE_ADDRESS + 0x00) = reg;
> +    return *(volatile uint32_t *)(IOAPIC_BASE_ADDRESS + 0x10);
> +}
> +
> +static inline void ioapic_write(uint32_t reg, uint32_t val)
> +{
> +    *(volatile uint32_t *)(IOAPIC_BASE_ADDRESS + 0x00) = reg;
> +    *(volatile uint32_t *)(IOAPIC_BASE_ADDRESS + 0x10) = val;
> +}
> +
> +#define LAPIC_BASE_ADDRESS  0xfee00000

Seeing this #define here, does there anything stand in the way of
putting IOAPIC_BASE_ADDRESS next to the inline functions as well?

Jan

> +static inline uint32_t lapic_read(uint32_t reg)
> +{
> +    return *(volatile uint32_t *)(LAPIC_BASE_ADDRESS + reg);
> +}
> +
> +static inline void lapic_write(uint32_t reg, uint32_t val)
> +{
> +    *(volatile uint32_t *)(LAPIC_BASE_ADDRESS + reg) = val;
> +}
>  
>  /* PCI access */
>  uint32_t pci_read(uint32_t devfn, uint32_t reg, uint32_t len);


