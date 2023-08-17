Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B390E77F76B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 15:13:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585428.916545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWcoM-0000aV-Mx; Thu, 17 Aug 2023 13:13:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585428.916545; Thu, 17 Aug 2023 13:13:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWcoM-0000YE-Jl; Thu, 17 Aug 2023 13:13:14 +0000
Received: by outflank-mailman (input) for mailman id 585428;
 Thu, 17 Aug 2023 13:13:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aH5n=EC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWcoL-0000Y8-1i
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 13:13:13 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cef19826-3cff-11ee-9b0c-b553b5be7939;
 Thu, 17 Aug 2023 15:13:08 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9437.eurprd04.prod.outlook.com (2603:10a6:102:2a9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Thu, 17 Aug
 2023 13:13:06 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 13:13:06 +0000
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
X-Inumbo-ID: cef19826-3cff-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XA+mQJiGfplw0D4DxmCLbB/WAhFcWu885xmUQgHlE+r/fK54i0gTifaYHQ0o3C3w/PxG6zwLuRH6AkaM9uMutxdbozQLw2uxp+0dQ14mfrgJfPi4KFoRjRE78DX7sdpqCvbKKzCzIrSoGg+BZAYWQNStAkD32EloQS8SSPl7L38DlNCrFEws8iwO6IewbRfF7efkwf6fNXAVbEn4FobUjn67o4cSZ9Mt9+hQsRUwY/Gr+h38KUdZkTHG7vkM3oQvgU/jPql6vgShwmQag+qOHsW15UYn93xDVtv/3oC9z53gt6W0AqfodRiJe1lMyn7sS3YdqhXCsDYBHD7RIZFdZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hHB1cTIJDHaNZRtlni1cNRYTRNLngJ1L39OUsObuyPw=;
 b=fnKZ4mxDz+dR4iJfoo4kg6TeoGxzLL9y07emq4a7kXDI0K8TjbiD0WpSd58MrJl9Os8v+Avj2XqE4p+o6WMInUOy0ACTLo+EFQqJlhUe5uE00X9JDKUybaGZaRBrYHL571aK+/hXv4V7aYVsIPsM8EthS8S5wQ9kRozK3Vpmpi0CxI3YjQu9iJhp/5u+Elrj+35kRKfltk90Qjwhn3eOkeTm6ymDVnmOuoB2t9n/EiA2PyLdw2Cr3TKjxTrlK9roxjbVU8niYKqo8cIl1CHSKtWu0UGIeek3MIJBp0ByBv6Iwy82QdWQeudbBLPG1j3FTWxhfLkpw7FQ9ZLFPRykpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHB1cTIJDHaNZRtlni1cNRYTRNLngJ1L39OUsObuyPw=;
 b=eBkB8/mBYTB0gz57vCzco7oeUxtytQmrkiMGSPLkQZOmRjkhp2B7/Ktn4L+pVHI0sqHhsishjxhJqR1yIq8+C4bi7b9+ENJeKfAHaGAG73c/1evewHcPiuP6nyY4aeMSwcbbp5BaK1cd2v2qkjrFGZ/aFxOj96lQhgPZk5drcA6bRYElJQUm5FCYNiTNyg3GUxlBmRY7SvgYu+yIDRiTD8RYZZkqzS2c+001nhlWd5aJ2l04kxYPhfkZBRlUhX8sv0IOhMGwe2GGwiEBGyhHNTauZN8pJF/QpTfqyHAfw07l3+NcAxUPMK/Ea6QJYAqogPgKPvO66oJ2iLfYFCdLWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e954ab9a-8319-1eb3-913e-738171148462@suse.com>
Date: Thu, 17 Aug 2023 15:13:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] x86emul: rework wrapping of libc functions in test and
 fuzzing harnesses
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a67c2fa3-ba1c-3783-c3ee-250aff6903d5@suse.com>
 <defbf6e0-28ee-4276-7535-0ed2e23ededa@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <defbf6e0-28ee-4276-7535-0ed2e23ededa@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9437:EE_
X-MS-Office365-Filtering-Correlation-Id: ed4f0f7a-3a5f-4cc3-ce11-08db9f23b1d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NgwRZsttCLoqBMHdHIj4iGnW2lrsuBXRine4mXcSGKrnHaNigyrRtcNYa01iW8Ytx6UlmRYHBn5jCLwAbwF00rQIpnZOr9T6ihoRkjAidS8K69BdWpXH6f+wuIER34SMdQykuijeuBtrhA8WTHbaMDyJkxqKMLbKlOlaPlDI2VaE5rjuau1/l4Dpy6DyDp/5vl4yR8WCRPvnCblCrXLYVZa7Pv9eNr9kVfSZ2uGBMXtZ/sFYNNigbIVUs7jQ5dF6S3HHds25p4SBLH1qk16ZEfRhzI+LztxH3xb5Guu+QZvKrhs3jJFd5BzwOdbQViNctTCzd3GEtumijmmJn53h937EboEuPs6qUsrX7t5rt11nn7M3aKKg/zUa7rvYgXL3qHgrEMNlvKt4rDWVgbyWlt1WXHLY4QgWiD2G2EQvd+ZOJ9a8e+C/eacfOv98oAzawrboBSYnKMenwqe/hg5Q+/g5NJZxnRZEVkFpn+NwsA0ZkmBpWswgwoJF/iJE/1X+mDoN4545YjsDhW5zXziFNGoX55AUAZCQVBouNLT4/kVy7kwtoeud7X9JnUY8PQgX5xpWrRfwq22ijq65kVlP8RymQuW/fc24+p3HZkP5ESldEIcrzLwYfiEIV2k15ycLEBjyy7w3Nw84+d1V19UeQg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(136003)(346002)(396003)(39860400002)(1800799009)(451199024)(186009)(31696002)(2906002)(83380400001)(26005)(86362001)(478600001)(6506007)(36756003)(2616005)(6666004)(6486002)(6512007)(53546011)(5660300002)(41300700001)(6916009)(54906003)(316002)(66946007)(66476007)(66556008)(31686004)(4326008)(8676002)(8936002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3VUYmQrSUU2anZaTDRzY2RZNzBJN1BLa0RKRG5oc0lYTDd1bE1sNkhxN0FM?=
 =?utf-8?B?M3R0NkdEK3FUOERKM1lNSWg5Q1ZHSi91NlZVMTVDaC9aVEZITHArajdiV2Jn?=
 =?utf-8?B?MkYydnh0OVQ4MUZDOUs3TUhiRmlWdUZIcDhzbU1GWjFkWkt6blVnMWxyN3Mx?=
 =?utf-8?B?UHV2THh4V0xRcGNaUnFid1pOTGxPZWd1MEpZQ1NXdUVSM2NuSUhjWWxtSDZY?=
 =?utf-8?B?ZTh3WWVja1VuUWo3QmdKVzdnMmlnbnN6b25EU3YyMzhOQnVNdyszU2tGWGZp?=
 =?utf-8?B?a1liY2cycC9vL2ZtMGFXb3VzcEZZL29FWEhWWERNTGxETEE5V0dnRkYzWmgr?=
 =?utf-8?B?RzBBZ3BDUGhrakFuNTdCWnJCRyt5SkZKWlVxZVpRbWErTTJIeDFvcWdSM3d0?=
 =?utf-8?B?RVU5dkhBOHdWTDFnQzZ6blZwUlE2ZnoyUWxpbFE2V3NXRmpzWFZRTCs3akI0?=
 =?utf-8?B?ZWU2WlB1UXB3MTMxWjZaVkFmdWVWUU1hUGNwNFpLeWxldEtUd0J0VG1ucnZC?=
 =?utf-8?B?NkZtbmJPWFdidXhrQVhzaFoxbXdLblkxT3B4TkU2cnVsVFc2dFBLOHlDbTZW?=
 =?utf-8?B?WngxOVlYYVVGVHNsdDI3R0sza2pFa054NGZLdVUzZTd5bTNkZitVQ28rcWJ5?=
 =?utf-8?B?b1lpSFZBK2Q2dnc4YURNRHpiMHpRNnFlbVIzaHBXMlZ1YW10L0lrUUl0WDhI?=
 =?utf-8?B?VWVXMkduYUpBcDdpVjBLbzlDeFlxRi9scEgxU1ZBd3RMQm9UR1RtL012OUdn?=
 =?utf-8?B?cW5SR2tFS1dqWmFoelJ1eW5yUEMrN3psQUc4anRGc3RvOHh5cmRUTmdhdHlQ?=
 =?utf-8?B?cWVIa1h0ZDZueWpaR0Q3bUM2SHloU29VUzE0MmhJMDdpUjAwYzU1S09Dcytj?=
 =?utf-8?B?VTFzZng1T2tjWGFZMHBaVTE3Y1B1VFdtam56ckZxSnZZbVFLaXZ5VDh1RGRC?=
 =?utf-8?B?Y0VSYXdTTm9RWC9jN3FKa0hyMFpHVzhwejR1aVRNM1VHeUFJczhPazR5RVln?=
 =?utf-8?B?ei9MNnNhZ043MkpRVU1tRkxFZG9WVGJNWlRrU0ZmSXlDdmQzUWN6SGVqeW5X?=
 =?utf-8?B?S0ZzYWVMdnQ2MXJzSUpaWmdxQXdldjkxK3FTS3NYZ1h2bXBJdFpoaE1tUUFq?=
 =?utf-8?B?OFFQeGl5dFNSdndvaFN5RnBJekJCWGpidlRhMkEyV1BRZ0MxYlNEd0tGcXdV?=
 =?utf-8?B?U2NWbWZJUm9QUkNrYlBFTU9EK0xLMVRCWWRSK3V0Rmc3QURyb1RBVzZrcWhD?=
 =?utf-8?B?VzFiN25TYmtKb2VzMWpDWjBHc01kdWdKRk03Ly9CWTZkNU85YlJ3WjhSayty?=
 =?utf-8?B?ZGR3QnRsQVFMM25MejhmYUtqMnJUQktKSFROaFZ3RkNEcENqcDQ2dVZTWk4z?=
 =?utf-8?B?TmNTNHJUd29EU2hGMjJhNTR5cEVzVkFod1FxTmV2MUZjVDFhMmNndU9FUjRU?=
 =?utf-8?B?TTd0TDY1eS83cmxPdmNxcDRIYUVGOFBKTnlNbW1VVmhCdjVxYjlQaEwxOThm?=
 =?utf-8?B?dmlaNDlOUUtXNEp2VjR0Y1ZlK0pWYndHa05hZjh5eXU0ek1td0dVUm5SNWFH?=
 =?utf-8?B?MWtGalJZNDZNUHIwS0I3blN6V0lRelM0UlM4QkxsMTVKVS9ZUTc0RDBSb3hO?=
 =?utf-8?B?dUFYdWE4MnFubVBnVERDYjZnOXdmL2Q2eW4xZ1gzSnhydGNqczZqelRMY0NT?=
 =?utf-8?B?dDhoeE05Ky82c1FFeFVkQ0hXVkVrVGx0VkN4Wm9MemNMaS9JRVZpbENQNXFG?=
 =?utf-8?B?enVDWUYwQnFvSHNwS1NBRFlGNHpUSzA3Rm1WeHRqMnBWelVxN1hXek04VXNw?=
 =?utf-8?B?SXQ0MzVDcmpKZ0VQeStsRmpKSVpZanI0ZXJ1RXNPbWp5WmFKRmZsYy90cjVP?=
 =?utf-8?B?UU9NWGhQeDcxVmJFeG5ZaDZaU3JKcE5vZFdOU2Z1dk5uWlF5Sms2VGZaUjhU?=
 =?utf-8?B?TGhaMkQ4dGc4NThMY010L21tUEFHSXRUV1lNZm9VWWI5Mml6Yk9RNFdiUS9V?=
 =?utf-8?B?T0sxUGw1WHBIajdBYlpKNkFBdUtTWWhGYURwbjJHWEt4YTR0RmhWRG9pUEh1?=
 =?utf-8?B?NWozKzh1anNpNlQ0aHA4ZzQzWlFDdmZTZkdmNU5KbzZmOGRRTWEvSHYvWE1R?=
 =?utf-8?Q?lf7NaRYhu5RqKM19XI08sakmc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed4f0f7a-3a5f-4cc3-ce11-08db9f23b1d1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 13:13:06.3292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJABJhrJJgquc0Kfk4yGD83fW6uY4+tUmMsf+ml83j+0an6gWfVEAV9PND9I7EEUs0NAnqOo4+Wn39fdIFQEfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9437

On 17.08.2023 14:58, Andrew Cooper wrote:
> On 17/08/2023 12:47 pm, Jan Beulich wrote:
>> Our present approach is working fully behind the compiler's back. This
>> was found to not work with LTO. Employ ld's --wrap= option instead. Note
>> that while this makes the build work at least with new enough gcc (it
>> doesn't with gcc7, for example, due to tool chain side issues afaict),
>> according to my testing things still won't work when building the
>> fuzzing harness with afl-cc: While with the gcc7 tool chain I see afl-as
>> getting invoked, this does not happen with gcc13. Yet without using that
>> assembler wrapper the resulting binary will look uninstrumented to
>> afl-fuzz.
>>
>> While checking the resulting binaries I noticed that we've gained uses
>> of snprintf() and strstr(), which only just so happen to not cause any
>> problems. Add a wrappers for them as well.
>>
>> Since we don't have any actual uses of v{,sn}printf(), no definitions of
>> their wrappers appear (just yet). But I think we want
>> __wrap_{,sn}printf() to properly use __real_v{,sn}printf() right away,
>> which means we need delarations of the latter.
>>
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> This does resolve the build issue.  I do get a binary out of the end, so
> Tested-by: Andrew Cooper <andrew.cooper3@citrix.com>.

Thanks.

>  I presume that you've smoke tested the resulting binary?

The fuzzer one? No. I didn't think it is of any use when not driven by afl.
I did a proper test of the test harness one, albeit not with LTO in use (I
focused on the fuzzer one with the LTO issue).

> However, I do see something else in the logs which is concerning. 
> Likely unrelated.
> 
> make[6]: Entering directory
> '/builddir/build/BUILD/xen-4.18.0/tools/tests/x86_emulator'
> gcc -m32 -march=i686 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall
> -Wstrict-prototypes -Wdeclaration-after-statement
> -Wno-unused-but-set-variable -Wno-unused-local-typedefs -g3 -Werror -Og
> -fno-omit-frame-pointer
> -D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -mno-tls-direct-seg-refs
> -fno-pie -fno-stack-protector -fno-exceptions
> -fno-asynchronous-unwind-tables -fno-builtin -g0 -D_64f2 -mavx512fp16
> -ffixed-xmm0 -Os -DVEC_SIZE=64 -DFLOAT_SIZE=2 -c avx512fp16.c
> make[6]: Leaving directory
> '/builddir/build/BUILD/xen-4.18.0/tools/tests/x86_emulator'
> /tmp/ccrznrqa.s: Assembler messages:
> /tmp/ccrznrqa.s:98: Error: no such instruction: `vmovw .LC0,%xmm3'
> /tmp/ccrznrqa.s:99: Error: no such instruction: `vmovw %xmm3,58(%esp)'
> /tmp/ccrznrqa.s:105: Error: no such instruction: `vcvtsi2shl
> %eax,%xmm1,%xmm1'
> /tmp/ccrznrqa.s:106: Error: no such instruction: `vmovw
> %xmm3,382(%esp,%eax,2)'
> /tmp/ccrznrqa.s:107: Error: no such instruction: `vmovw
> %xmm1,-2(%edx,%eax,2)'
> /tmp/ccrznrqa.s:108: Error: no such instruction: `vcvtsi2shl
> %ecx,%xmm1,%xmm1'
> /tmp/ccrznrqa.s:109: Error: no such instruction: `vmovw
> %xmm1,318(%esp,%eax,2)'
> /tmp/ccrznrqa.s:113: Error: no such instruction: `vaddph
> 256(%esp),%zmm7,%zmm5'
> <snip many>
> simd-fma.c:208: Error: no such instruction: `vfmaddsub231ph
> 60(%esp){1to32},%zmm6,%zmm5'
> simd-fma.c:209: Error: no such instruction: `vfmaddsub231ph
> 60(%esp){1to32},%zmm6,%zmm1'
> 
> GCC is 12.2.1, binutils is 2.37
> 
> AVX512_FP16 was added in bintuils 2.38 so I understand the simd-fma.c
> complains,

Right. I assume the gcc is not the system one, or else I'd find it
odd to have a compiler backed by a less capable assembler.

> but ccrznrqa.s suggest that there's a bad -m passed.  I
> haven't figured out which source file it logically associated with.

The source file is avx512fp16.c as per the compiler command line,
which in turn is a symlink to simd.c. We don't pass any naming
options from testcase.mk, so the compiler using a made up name is
expected.

Jan

