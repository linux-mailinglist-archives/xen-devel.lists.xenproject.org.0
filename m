Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8131C6ABB94
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 11:17:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506862.780058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ7uQ-0000XC-AI; Mon, 06 Mar 2023 10:17:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506862.780058; Mon, 06 Mar 2023 10:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ7uQ-0000VT-7F; Mon, 06 Mar 2023 10:17:34 +0000
Received: by outflank-mailman (input) for mailman id 506862;
 Mon, 06 Mar 2023 10:17:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MPo4=66=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pZ7uN-0000VN-Np
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 10:17:31 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18aef401-bc08-11ed-a550-8520e6686977;
 Mon, 06 Mar 2023 11:17:29 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9518.eurprd04.prod.outlook.com (2603:10a6:102:22d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 10:17:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 10:17:25 +0000
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
X-Inumbo-ID: 18aef401-bc08-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3+dCYi04uyUma8F8RmlEGLiKbVVbX1e3QqQCL/8e0D0Ow+lhbEp8IUfC10KDxavc1xF+9oYbN2PCwLi2l3SxDv7T5wfOOrcRuB8QoC1lCfOgjT60ZjfnegtwVC4MeqFS7u9CfFPwR42vm847eYM4l9UjiqRCaeaDsm0ddcsUpsBfz+tfcoNhv/p0tlsqVYmzKqucu34rsNOBP6uUrW0zEpjT9/arkWXzEZ62CMWjOBpm5NQnymcqXPP5Zjco4Q0LqZ3ewuwF7yMc3H4IQ2/B1q9Iey615ZjWFgVhWv18LCz8flz1nxWPlqZ5BmagTneGTU0zhrs8F5MIVFdYrJSyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TjtnZ2xHk7ZxpsWpR4IHQgPoO3yyJn1irokzDwuEQbk=;
 b=fN6H9YJb8dIegiYQiEqL5Y/h5ciunW69udi2xcdAcopFREMRR+gWMuEk5E+KLdfd4r0P47jHzBIqjRropHT/p4nttrx11GYTP/wGoz72CnWWCb5GqttD36Rg1hr/vlD2iVHZR3AlaxzTjUZKuXhgEmtMXcyUGcx1aZMFAW9esFOUCwB0X2SweTE3oVMklAxDSvK3Pv/z9tqA5sexElG5MFPXbC3bzHa4R8MYlF7lQdsVksobG0nP6RtYFX4/JKnScSchDP4BKiVzvHFji/zm6SOS6e2pUinE7ZrdmeDphoMyhG7FTOVpq1bNmkyQmi7BwYNN1heGyz+O5zU/O5iGyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TjtnZ2xHk7ZxpsWpR4IHQgPoO3yyJn1irokzDwuEQbk=;
 b=mc4NUL2I0q5W6FG4YV4mCN1W+2NGFATy8Y7RZmsdgIV3FRZFQbVtk4gt2R8pZQ3uZFncxUd06b30A/rUyxJyXizl+Mlhsfi4pqpWVla5d4jcy+qaHgcpxGniyZl1waPJ7QMj0y28/OgMuqNrNWLEfU/b/p1eIFDmXV5NbnNivsJWFQzTr+93VNOs4GvvPkg3rbWyAKWTVYzVmI8nwspbq2HkuUkzRzWWei+0cC8+0nSktIEcAEEeYRKR/6w506OBkp5oNI8FDNqsp5LfP2nsZmHbRimBQb2ItmVABjYw3nScOxSOnsPeU5KaJ6tAfYrRO/SWiPNIz61ZDgvXa1D3Ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <91343570-3532-521f-9bfe-3a68902426d0@suse.com>
Date: Mon, 6 Mar 2023 11:17:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1677839409.git.oleksii.kurochko@gmail.com>
 <5cd3dd5233cf41ad54ce1cd98b706085b95bfcee.1677839409.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5cd3dd5233cf41ad54ce1cd98b706085b95bfcee.1677839409.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9518:EE_
X-MS-Office365-Filtering-Correlation-Id: 82fa0a02-273e-421c-0935-08db1e2bfb3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TXsp3ZpgmEyJloU5pEfyvwLn5rDN66QYilrarr3zO16adcfhDSu3n0waZd/zRIT6dBzI3hx/NRTcEqU/f+O0C2YcNBgrgDLUvKtxFVsRkzwLK0k+0WztNCSJCZ1q1xCGkajzlUTlvOOu+Lf4yD2cE1PScNSPvGK8vftTTDa/6g0TPBdtSQhcLIr44Y8PZkL44bQE4kJQWJc9lbDRNc5XkHQtfhHJQV8bRPl21fO5auPnKysh/eRLvu2R5G+GjTv3owAdEhpIwPhXhhg1Z/lRS03kzaZ+EU5dL4uXdLi/aNNqpljBEsKIEdGSbnzig+QMHAlT99E8h3AaG6JZudyOIs3pD2xrdjbAF+Nm37lmk+yP+EFbaFOjv2sOiVhwoUWTQylba19opcfXY3nf3Tdw7uGKy3xtsYTMvcr0vyqV0FTS7/+5tcpEC/u/x57+Fj7ZA90Mg+ZpvScdGK/zqeL9zg+xt9yvmromtLJH61oOliA2NpzabVoSgf8jKxr/LVE1w5B+ZRdz9cyfbuT+V9IDlDDnHwYn2P4I7Imxw4BhKEdzerm8be8ucHNWsZzQzaLibz9zdM/Fz580PLS99rFMeN93Vq97n/vbeYTsqf3XCn1BCl1yGRsoOKagepWe4WwRdTqN8Ax2sCH12CacGOEFPBrbBOj8huH5sojk/Na9DvfaXi68nqdbScIg84bH9izktKBm1gUoCL9uztXIso+I3p1ty8XxlSCfebEwGLkTw3qHUKORJ2mPEmZn03tzcYUzlhKQtjbXg4L3nCTXDEuxMrffoVOGuCa5iwvfsf8u4Hc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(346002)(376002)(136003)(366004)(396003)(451199018)(66899018)(54906003)(36756003)(6486002)(316002)(83380400001)(86362001)(31696002)(31686004)(186003)(2906002)(5660300002)(66556008)(8936002)(6916009)(66946007)(41300700001)(66476007)(4326008)(8676002)(478600001)(53546011)(6512007)(6506007)(26005)(2616005)(38100700002)(41533002)(69594002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0ZiaHlCRnYxZ01FbFpyWThPR2J0b29kUC9hZlNtNENQUUZscDJwckZ4a2U3?=
 =?utf-8?B?NGd1ZDZZbHVnejYxVnhCWktUcHlLYVdRUEl3b0dmN2lQckR3Q1lUTWhxbFpl?=
 =?utf-8?B?RWpQNnFNN2NZZ21BamFNT0lLTFczSFo1NFFOVFR3b3dhRnNSVEpPWWY0dEtT?=
 =?utf-8?B?VmpmL0w1RXFOM3ZUWkFqRVFkdlBpakd0OFN3T0JQZ2hUb2YvVkRoK0haRFBa?=
 =?utf-8?B?MVE4MGEzQkFYQ2JnYSs4d283SDUxLzlydGhCbGJHbGwvWVRXN09JczVMbHFU?=
 =?utf-8?B?MHRpdDg4TWY1SFVNOGQwZ1piWWcxSmRMalVicUNMZkhwdXZhMzFOT0ZubnEv?=
 =?utf-8?B?WStkamQvVGNiSElIaXpOTFNQVW9EYXdWYXZybmZkVnJ0eGFMTzFpQURPVDFQ?=
 =?utf-8?B?V0s2QU03WFpjYzFSSGNUcTZGNFg3blA0ZmdBSUc2cnVURUpJT3BaMW41TzNj?=
 =?utf-8?B?N2l6K1U1S2FEUlhiV3lpejhzZVRtcEZyUXFncFVXL0QzYjZRZHhFdytsbG1J?=
 =?utf-8?B?cWlsc21YQ1pMdDY3U1BFWWZiVDlMVU9wWlA5Y0RjS0kySHJnUDkxdmpxRUFs?=
 =?utf-8?B?Vzh2eWFmbWxjYmpNK2xUUVpMbmI4WnNhanQ2RXRxbThEUUpENzRobk0wWHZS?=
 =?utf-8?B?ZDcwUnQvSW10U3BJT3p6aGhYU0Z6RXkwT3VVMVZxWmRGb1hlR3FFcHFNd0dZ?=
 =?utf-8?B?Z1lkdnlvVlBqRFJMc3ExZ0VqbnRFWi9Hdlc0YXQwSmRvRWMrYVhVMzJpRUlp?=
 =?utf-8?B?RkpwNFMwbVhIVG4zK2JsaDRKTHkzVkxlaTJzY29sVjlVcGZjSmp2T0VSWjdP?=
 =?utf-8?B?VzU4bmdlQmZiU2pDc29KZ05xQ3RzdmJPaHljNHhMWXdHUllSSGR5SUNaeTEw?=
 =?utf-8?B?ci9nTGllZVZaN09wVjQyU2k1UmlWYTZvUkZIOGlydHAvbGlZZVdacVRhR0dE?=
 =?utf-8?B?ZnlhMEJtREkzOU9jVmZUdmVyYjRQNlViSUNqODNBcHdqQlZrRTRWcEtwQW05?=
 =?utf-8?B?R2FxN2FUQlpzNi9JSE4yWS9jMFhFckhKVE5qZ1ZwK2owSzRObTF4aWFxdXFi?=
 =?utf-8?B?WmNuZWVaU2hyT214WmxHKzh2NGxxNE1oL2wyck5uc1JZcDR3TTdJWGlodjc2?=
 =?utf-8?B?NndSTldTbmMxdEs2M0RNZzlheUE3NUJoRE5XQmsxSU96VkFOdFVhVjZHVTdP?=
 =?utf-8?B?QWJPK2lMVzliYVBCWmFDaHpxL0lOY0N4Z1RlRGplQjNEVmVsaitvNjhjOGVa?=
 =?utf-8?B?OE1sVzEwdjBDTzNlaUh1ekszYkZ1Tld0QkxoSm5CMFE1Y0V2QjJiRnJUK2p1?=
 =?utf-8?B?UHhWWWI2aWhtNHI1RGxkV0NiQXFGNngva0xGUWU2SkEvQW5sZFUxcEUxTjNs?=
 =?utf-8?B?UEtVVXoyTk56RWErUDJST2I0c0d3Q1NoaEMrU3Q2VlNkZm5Wd21qdVR6eVBi?=
 =?utf-8?B?RkVlSEZtZkdrYy96bXJreE85TjBURHR2WnV6ODVJNG1STWtsNklST3haeHBO?=
 =?utf-8?B?TVZrWWMwQXRJckg3NmZVMkEwWmdDYWl0aWxQa3l6NXYyQi9YL05FcFdlSGln?=
 =?utf-8?B?dmlVbGw4VTRTTUlZZUlDNjBtVEJDOGU0TkkzZklPQkppZVdsV0NScTd6aEtM?=
 =?utf-8?B?ci8yK1FJNXQvQlRYT2dUWjJNUGtvYWRHc1lTbHo5SSt5SE1nWWZ6cVBESVB6?=
 =?utf-8?B?ekFoY0FKOEdUSFVHMFNmSWxST003Z2o4bk5obTBRaXBzNDg3WkZDQWJOOVJS?=
 =?utf-8?B?VDRaYjNNTkc1VUZ5aGFFUzVVQTEvT0JDdncrcnk2alhNVmhFeUZrMjJjL0xL?=
 =?utf-8?B?Wm9qaW1pRVllVVkzRFA2OUFWQ3VSWkRuRnFqalhQcnVKK2NPb0dxb1F6cjYv?=
 =?utf-8?B?cVhPa0dkeHcrV2xKR0R1ZW1sQjV3NnRObnEvaG5jQ3k3bmhod1RSZHVUaVNp?=
 =?utf-8?B?MzZUK0tLQnc4NHF0KzFlazBkUzFoaCt6bVFkYjVFR2FjRmYyRVErZ1ZkSkU0?=
 =?utf-8?B?dHl3OG1pejhXcHpiaCtUQlR6aVpWNi96ZzcwVlJ5SG9LczJSdHpKN1JZdW9O?=
 =?utf-8?B?dlV6M0Vja0FrUmd1TEJQK3B5MjV1M1lpcWxPWVFSaVRROHRMODNYNjFpTnBS?=
 =?utf-8?Q?MG4KJEA+uOG+mC7wf+lkAPvv2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82fa0a02-273e-421c-0935-08db1e2bfb3e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 10:17:25.2193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HlpPem/daZEwEHKv7OGoH+niWO37sBGyHHcbJO6EgPh36Qa0v03cBoJ5SNZszYYyUCSFikRNtoO/8GlznBPSTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9518

On 03.03.2023 11:38, Oleksii Kurochko wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -28,6 +28,9 @@ config ALTERNATIVE_CALL
>  config ARCH_MAP_DOMAIN_PAGE
>  	bool
>  
> +config GENERIC_BUG_FRAME
> +	bool

With Arm now also going to use the generic logic, do we actually need this
control anymore (provided things have been proven to work on Arm for the
compiler range we support there)? It looks like because of the way the
series is partitioned it may be necessary transiently, but it should be
possible to drop it again in a new 5th patch.

> --- /dev/null
> +++ b/xen/common/bug.c
> @@ -0,0 +1,103 @@
> +#include <xen/bug.h>
> +#include <xen/debugger.h>
> +#include <xen/errno.h>
> +#include <xen/kernel.h>
> +#include <xen/livepatch.h>
> +#include <xen/string.h>
> +#include <xen/types.h>
> +#include <xen/virtual_region.h>
> +
> +#include <asm/processor.h>
> +
> +/*
> + * Returns a negative value in case of an error otherwise the bug type.
> + */

Nit: Style (this is a single line comment). But see also below related
comment on the function's declaration.

> +int do_bug_frame(struct cpu_user_regs *regs, unsigned long pc)
> +{
> +    const struct bug_frame *bug = NULL;
> +    const struct virtual_region *region;
> +    const char *prefix = "", *filename, *predicate;
> +    unsigned long fixup;
> +    unsigned int id = BUGFRAME_NR, lineno;
> +
> +    region = find_text_region(pc);
> +    if ( !region )
> +        return -EINVAL;
> +
> +    for ( id = 0; id < BUGFRAME_NR; id++ )
> +    {
> +        const struct bug_frame *b;
> +        size_t i;
> +
> +        for ( i = 0, b = region->frame[id].bugs;
> +                i < region->frame[id].n_bugs; b++, i++ )

Nit: Indentation (the "i" on the 2nd line wants to align with that
on the 1st one).

> +        {
> +            if ( bug_loc(b) == pc )
> +            {
> +                bug = b;
> +                goto found;
> +            }
> +        }
> +    }
> +
> + found:
> +    if ( !bug )
> +        return -EINVAL;

While I'm generally unhappy with many uses of -EINVAL (it's used to
indicate way too many different kinds of errors), can we at least
consider using -ENOENT here instead? (I'm sorry, I should have asked
for this earlier on.)

> --- /dev/null
> +++ b/xen/include/xen/bug.h
> @@ -0,0 +1,158 @@
> +#ifndef __XEN_BUG_H__
> +#define __XEN_BUG_H__
> +
> +#define BUGFRAME_run_fn 0
> +#define BUGFRAME_warn   1
> +#define BUGFRAME_bug    2
> +#define BUGFRAME_assert 3
> +
> +#define BUGFRAME_NR     4
> +
> +#ifndef BUG_FRAME_STRUCT

This check won't help when it comes ahead of ...

> +#define BUG_DISP_WIDTH    24
> +#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
> +#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
> +#endif
> +
> +#include <asm/bug.h>

... this. But is the #ifdef actually necessary? Or can the #define-s
be moved ...

> +#ifndef BUG_DEBUGGER_TRAP_FATAL
> +#define BUG_DEBUGGER_TRAP_FATAL(regs) 0
> +#endif
> +
> +#ifndef __ASSEMBLY__
> +
> +#include <xen/lib.h>
> +
> +#ifndef BUG_FRAME_STRUCT

... here? (I guess having them defined early, but unconditionally is
better. If an arch wants to override them, they can #undef and then
#define.)

Above from here the "#ifndef __ASSEMBLY__" also wants to move up, to
further enclose BUG_DEBUGGER_TRAP_FATAL (which is useless in assembly
code).

> +struct bug_frame {
> +    signed int loc_disp:BUG_DISP_WIDTH;
> +    unsigned int line_hi:BUG_LINE_HI_WIDTH;
> +    signed int ptr_disp:BUG_DISP_WIDTH;
> +    unsigned int line_lo:BUG_LINE_LO_WIDTH;
> +    signed int msg_disp[];
> +};
> +
> +#define bug_loc(b) ((unsigned long)(b) + (b)->loc_disp)
> +
> +#define bug_ptr(b) ((const void *)(b) + (b)->ptr_disp)
> +
> +#define bug_line(b) (((((b)->line_hi + ((b)->loc_disp < 0)) &                \
> +                       ((1 << BUG_LINE_HI_WIDTH) - 1)) <<                    \
> +                      BUG_LINE_LO_WIDTH) +                                   \
> +                     (((b)->line_lo + ((b)->ptr_disp < 0)) &                 \
> +                      ((1 << BUG_LINE_LO_WIDTH) - 1)))
> +
> +#define bug_msg(b) ((const char *)(b) + (b)->msg_disp[1])
> +
> +#endif /* BUG_FRAME_STRUCT */
> +
> +/*
> + * Generic implementation has been based on x86 implementation where
> + * '%c' to deal with punctation sign ($, # depending on architecture)
> + * before immediate.
> + *
> + * Not all architecture's compilers have full support of '%c' and not for all
> + * assemblers punctation sign is used before immediate.
> + * Thereby it was decided to introduce BUG_ASM_CONST.
> + */

I have to admit that I'm not really happy with this comment. At the very
least the last sentence imo doesn't belong there. But overall how about
something like

"Some architectures mark immediate instruction operands in a special way.
 In such cases the special marking may need omitting when specifying
 directive operands. Allow architectures to specify a suitable modifier."

> +#ifndef BUG_ASM_CONST
> +#define BUG_ASM_CONST ""
> +#endif
> +
> +#if !defined(_ASM_BUGFRAME_TEXT) || !defined(_ASM_BUGFRAME_INFO)

Please don't make the conditional more complicated than necessary:
Checking for just _ASM_BUGFRAME_TEXT is enough here.

> +#define _ASM_BUGFRAME_TEXT(second_frame)                                            \
> +    ".Lbug%=:"BUG_INSTR"\n"                                                         \
> +    "   .pushsection .bug_frames.%"BUG_ASM_CONST"[bf_type], \"a\", %%progbits\n"    \
> +    "   .p2align 2\n"                                                               \
> +    ".Lfrm%=:\n"                                                                    \
> +    "   .long (.Lbug%= - .Lfrm%=) + %"BUG_ASM_CONST"[bf_line_hi]\n"                 \
> +    "   .long (%"BUG_ASM_CONST"[bf_ptr] - .Lfrm%=) + %"BUG_ASM_CONST"[bf_line_lo]\n"\
> +    "   .if " #second_frame "\n"                                                    \
> +    "   .long 0, %"BUG_ASM_CONST"[bf_msg] - .Lfrm%=\n"                              \
> +    "   .endif\n"                                                                   \
> +    "   .popsection\n"
> +
> +#define _ASM_BUGFRAME_INFO(type, line, ptr, msg)                             \
> +    [bf_type]    "i" (type),                                                 \
> +    [bf_ptr]     "i" (ptr),                                                  \
> +    [bf_msg]     "i" (msg),                                                  \
> +    [bf_line_lo] "i" ((line & ((1 << BUG_LINE_LO_WIDTH) - 1))                \
> +                      << BUG_DISP_WIDTH),                                    \
> +    [bf_line_hi] "i" (((line) >> BUG_LINE_LO_WIDTH) << BUG_DISP_WIDTH)
> +
> +#endif /* _ASM_BUGFRAME_TEXT || _ASM_BUGFRAME_INFO */
> +
> +#ifndef BUG_FRAME
> +
> +#define BUG_FRAME(type, line, ptr, second_frame, msg) do {                   \
> +    BUILD_BUG_ON((line) >> (BUG_LINE_LO_WIDTH + BUG_LINE_HI_WIDTH));         \
> +    BUILD_BUG_ON((type) >= BUGFRAME_NR);                                     \
> +    asm volatile ( _ASM_BUGFRAME_TEXT(second_frame)                          \
> +                   :: _ASM_BUGFRAME_INFO(type, line, ptr, msg) );            \
> +} while (0)

Isn't this tied to BUG_FRAME_STRUCT being defined (or not)? At least
the 1st BUILD_BUG_ON() looks problematic if an arch wasn't to use
the generic struct: With how you have things right now
BUG_LINE_{LO,HI}_WIDTH may not be defined, and the check would also
be at risk of causing false positives. Perhaps it's appropriate to
have a separate #ifdef (incl the distinct identifier used), but that
first BUILD_BUG_ON() needs abstracting out.

Also nit: Style (see ...

> +#endif
> +
> +#ifndef run_in_exception_handler
> +
> +/*
> + * TODO: untangle header dependences, break BUILD_BUG_ON() out of xen/lib.h,
> + * and use a real static inline here to get proper type checking of fn().
> + */
> +#define run_in_exception_handler(fn)                            \
> +    do {                                                        \
> +        (void)((fn) == (void (*)(struct cpu_user_regs *))NULL); \
> +        BUG_FRAME(BUGFRAME_run_fn, 0, fn, 0, NULL);             \
> +    } while ( 0 )

... here). Also, considering the boolean nature, I guess we're in the
process of moving such to be "} while ( false );".

Also please be consistent with formatting of the two adjacent macros,
both indentation-wise and where "do {" is placed. Which of the two
forms you use is secondary.

> +#endif /* run_in_exception_handler */
> +
> +#ifndef WARN
> +#define WARN() BUG_FRAME(BUGFRAME_warn, __LINE__, __FILE__, 0, NULL)
> +#endif
> +
> +#ifndef BUG
> +#define BUG() do {                                              \
> +    BUG_FRAME(BUGFRAME_bug,  __LINE__, __FILE__, 0, NULL);      \
> +    unreachable();                                              \
> +} while (0)
> +#endif
> +
> +#ifndef assert_failed
> +#define assert_failed(msg) do {                                 \
> +    BUG_FRAME(BUGFRAME_assert, __LINE__, __FILE__, 1, msg);     \
> +    unreachable();                                              \
> +} while (0)
> +#endif
> +
> +#ifdef CONFIG_GENERIC_BUG_FRAME
> +
> +struct cpu_user_regs;
> +
> +/*
> + * Returns a negative value in case of an error otherwise the bug type.
> + */

Perhaps add "(BUGFRAME_*)", which would then also make this a properly
multi-line comment (right now it's a style violation, as is the case
for the function definition as pointed out above)?

Jan

