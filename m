Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5FD6C0DAD
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 10:49:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511804.791066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peC8H-00077N-SB; Mon, 20 Mar 2023 09:48:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511804.791066; Mon, 20 Mar 2023 09:48:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peC8H-00075C-On; Mon, 20 Mar 2023 09:48:49 +0000
Received: by outflank-mailman (input) for mailman id 511804;
 Mon, 20 Mar 2023 09:48:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peC8H-000756-5b
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 09:48:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7d00::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68f7662f-c704-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 10:48:47 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8320.eurprd04.prod.outlook.com (2603:10a6:102:1cf::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 09:48:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 09:48:41 +0000
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
X-Inumbo-ID: 68f7662f-c704-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q2Ot3lkJIhnNDjsZjZWNkn5ExesCaU6jxYhNS1A4kQnkIDBeXD4/c66nald7TuiP3C7QX63q3+U4qgpcA/RGT/BgsG4QLhKlIDGitn10d0miYNcXk6h+0o2WofZ+DFS2hfIBqvWmvrHl9qf5KvYjtVCyihFiBT+iT9Q/UpHu4lLnKjaDJPJtywMmWL+E57R0TROnqLPXwrBJyV9DYDRaJxZXDkNXZRYn0Xpzyu006hzhdTTG5v5UKADqtXSAK1ZiAJCr129SMoAGE74XYTnEuRJDUgkzdQc/p3l+nabwLGW77JQUrgIDn6UR85k2qBNxNhdwPUF+FgoviBOQLDEZdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/Oi3f5aplyZFxzxgfBmIip96AOoH9kkRX7Hb04oFmI=;
 b=EW5pKMK2Gk8gc9iCXjv7g9eG9AoTL1yZ/IeO0SvZK+Xu6bnz+M8JVlqlShBC0da2UjQ6quFamZv1nBsMH/t5UPQSzleatXXx3uijppW+NPu2f9njyqMSoDHg1pGcV5S2pWpbL9woVCENT7UZhBUgt+bXq+GuwjOSUdiGLnZLfadKrBo4IlqvtjIxW99Eh9PQCNyc0acSwGI7JZydbkcyyHLCyeArUEH2mOSug82LmSJEzblJ/6UIl7nN6iKHufGSE7Z2l60sOv/XJCDpeDEqQ+N3DWshMnlXhLTHgoJqjmOFN5imEOlumu0YK1TefcXVA6aVF5IZjSgtxaQvS4dICg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/Oi3f5aplyZFxzxgfBmIip96AOoH9kkRX7Hb04oFmI=;
 b=SPnp7GUtTTDIQWl7ZZ8IPX+baOvbAT+UZT/VhrKnLajNxt7wfwhbM21kzcsTYu6wb/BhDmP5VHTTzAzhap0NwV4wnG59N16BScjT27AZXeIX/thj1CnZK/a5smmbwU27GPjta3jiri1lTBazgwfu+MSzmQ6eTp7EV6hBcY1eprUwUfbOUJsyGF9dTHIbfv1o+si4dYuT14ok05xPksyias8Btzl84RXGc2zLXfZZ2UXBUAMA+EWgJvQBzCGwPTrPkIxp7qg8PZ7UeJ1yYNjPZSdfRXGKE1IQEoBERQeS5zcwWtNQM+O9iEBaZVQgRPo4kdrvRVJvNlPgJ/rmVzjhRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f1b0e3be-cf23-6471-7a59-c130380be0f8@suse.com>
Date: Mon, 20 Mar 2023 10:48:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] x86: use POPCNT for hweight<N>() when available
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
References: <55a4a24d-7fac-527c-6bcf-8d689136bac2@suse.com>
 <ZBRNWhExetXH1OaS@Air-de-Roger>
 <011cb7d8-fb32-74b1-2b06-f57be67f5c6a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <011cb7d8-fb32-74b1-2b06-f57be67f5c6a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8320:EE_
X-MS-Office365-Filtering-Correlation-Id: fa02dd6d-6580-4428-ccf8-08db2928497c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UAJpuaes8yDb1R98mjuoUhXSVVuuxNdJFHtqLVlqyigvuWJQi4/Ub9j1ohs4ThYphbbpYuUSCNj83QxL1Q4lp2snEytQ5l5HQFoKhN+s79dRODIXaGPCeHaqJeSZ4feeHG99C4eMlBeZG1jF4uPyUZi7bkGGOIgIiV4pFWjbOl7v3GF8hGwcXwk15ukhUjccuKhpplEvldFQ6pLps+Rl6jhrAfSNVLUbTctOz73ygN5lEWNMm6+kSIV42HECvXdhAEBHqp64hk0q5NeNCRM0T/65yYQXZI925IwbRZFE8adawlZtifUNuazNxmRFVONKSEcWn5O0c6c52RbtB4HaLF0BUzKLX+uJFyzphH+Kd7CoHZXbc/ySuta+e76Dn3bHOvksldqeAMpeEs521jdlPfYWRE2huSJ9Mk/L2LUnNGsRr+Z8QW/Rc8qC4Pdvh2dLcVAjSUw66/LYst79uG8t1PF3efNt+X/Ts/+6DMB5CIVvIPKWSr4bR8C77aXyJPg6YmQWjEJPPfHFf1e5rdzqEEzSfoOFNIe9l/7xreIKlDy7lT4CJOh0hF6hjXMvAzV5vAXK4sApFRczZCcB7g47Bhgyg6nrFZGZyJBgA7cqGVb9hhD2/Di1drZFphTIhsKKzxdMiz0DzSTB+kmgwmVeW69cRbf54cOuNK3RsLJej29T6cLu9XH9y2eYwFdoEjBcdTyaQBmBiyoPXBJ7N3XMeJ8+vMNBw81Yl6Pkx7t6rhJpYQ+YK3e+pm+eqNkROYSUe+frp7Y7ycOJAeDRLnn61w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(136003)(366004)(39860400002)(376002)(396003)(451199018)(478600001)(83380400001)(2906002)(8936002)(38100700002)(5660300002)(86362001)(31696002)(4326008)(8676002)(66476007)(66556008)(66946007)(36756003)(41300700001)(316002)(110136005)(54906003)(26005)(2616005)(31686004)(53546011)(6506007)(6512007)(186003)(6486002)(16393002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OCs2T1R2Y1lvZ2F2WHlXWUlPejkwaHBibUMrTm5rMXFncUIvVy9IUUhHVElJ?=
 =?utf-8?B?N1l4MWM0TUtLcFlJU0RtZFdrSnpWQzJHdCt5bWhIeXRSNzNpYU9DVjVxVWNT?=
 =?utf-8?B?L0k1TllsNHg4WGNHcTBUVHBoUFJDV0V4WTF1UnliVnAwWFEvK3dPRzdTRmJN?=
 =?utf-8?B?WWpRdGlnd3NaUVlmdVRSVFBWaFlOWEM3eGIrbkZnT0toengvSWE4RC92Y0g0?=
 =?utf-8?B?MUdhK0RWd256eFRPbEpxMDdtVkFSWGtoVTM0djRYNnZDTlpVR0pJdjlDek1w?=
 =?utf-8?B?VEh6QllVYWd1MERMZnRpREk4S0xoaitlVjl3MWVOclg4a0FSNFh1NmZ3bll1?=
 =?utf-8?B?QkZHTjhKL3V2NjZUNCszdTJBRm5lVG9yQ0dacUlsYWt2Q0xxQnduUHNoSlNu?=
 =?utf-8?B?YllqYjkvYmZhVFhkUi9GSG55MkgvTklxZDNOYXE4d1pxQmZlZHFoUFJ6dUhj?=
 =?utf-8?B?T2NZQWFuWEZhanlRUmlHalBsWE9IQTRRaVdMTGhjaDE2S0lLVkVNenRaRitB?=
 =?utf-8?B?dWszWFd6aDIvRWgwZFAwclhHdVlyTVRsTmtrdG1ISGhOTU0yclpiTEEwSC9Y?=
 =?utf-8?B?cEVxeWk0VDl2VDhZenVuZU5kekplZ0F6akFPc3VNZGdjV3FESFVkbHdNTjMw?=
 =?utf-8?B?eGZuUGZUYk9rWVRQNWxEbHZSd3p6NkpZbW5MRFd5cDdhWDdzazVkenMxSlg0?=
 =?utf-8?B?djMvNnBlVEt6UzZzV0NUeWdXM2FBSnUwZnlGLzJyRzJEYml2Tnl6alk1Wkhm?=
 =?utf-8?B?U0VTRUpsMkJaVlp3dXkxM0hKL2FUcXJoVU5xYVA1TDBMSWE1anJyRFViMUdY?=
 =?utf-8?B?V3d6NHR4clBWSjZyenRobWdQSG01bXQyK2FuU1VXRlE5c2ZsK1ArUkJ2dXlz?=
 =?utf-8?B?eTBSQjZYa1p2RXJmRDlZN3ozamI4QTgzOVRyVFhsMmhFMTB0dVF0eHhnQW5V?=
 =?utf-8?B?TFdJSkMvcGRDWEJqVTdNVnhjSVhNRGZwazd3cWl1MHBUWmhJK1R0NVBmdGRC?=
 =?utf-8?B?dC9IcG1OWUtxMGJHMnRPT2M0UlJwcXpNMGM0eGIrMm5oOVpSVnQvemovanBU?=
 =?utf-8?B?dTBBdFArU01hcjNrZklhNkd3ZWZ1SHhMaE5MVGRraTJpcEJEVGhTS1VSeTR0?=
 =?utf-8?B?aG1URGEwbithdUtkWkY3NzE2YnQzN0ZQNk5UNEs3dDBLeTNlQUl5c1lJdmt2?=
 =?utf-8?B?bTRiNlMvUkNJMkFjVlFSYjhIWlpUUCtkVWZ3UStkYXQvN0lFTXVoMzI0TWhI?=
 =?utf-8?B?bjVLaDRzUUFCL0IrMHRSa1lUN0RJcE02OUVuRHpWZWFDOUlkTFpTd0QzZjJs?=
 =?utf-8?B?ZE5JTFFGNStFSU9meTI0TGtmSldLRURmQmhlclRReWNSUUJzanN6SGl4WG0x?=
 =?utf-8?B?RXVyM2tyTzJhdDRxbnlXdjZrSGNocDdUMjEwekd5ZXlVS0U3cFpPb1VQT096?=
 =?utf-8?B?ZUF6SE1KVkRqVjFPYnRpZVdzUmZZeU5zNHJ1RWhhcVp6a3NQeUpFZlVUM1BH?=
 =?utf-8?B?NC85MWlLaXd4OUpyWkxtZzQ3OC94V3diT1lxMFFXSUdzSmp2M295TTdMS1ND?=
 =?utf-8?B?cExKSTJtWDgrOFpnajRTQTZKUytnQTZqTklNUFpPUEFjNTdlU2Uza3Q2UUp5?=
 =?utf-8?B?emsxS08zRFFlM3gwOXdKOVNUR1ZyUHhKLzJlRXlQbi9FZVpGaEpiZkp3WjFK?=
 =?utf-8?B?dFVwUHo4ckVrMGd3Nk5jYW05emVVRDhGZGtNT2ZWQzdtaGhwUE5OV2VJSklz?=
 =?utf-8?B?dnRVVW11WCtSNWFiS1UxSEs4SlBlWmk1RVE0UGZodGxHVEZGalhEcmc3Ynp2?=
 =?utf-8?B?aFNubEw3OXJuczBTUmcrM1F3dDVGa1R6bmZzSXJZRTh3NU5NV0lHRDZhK3Zm?=
 =?utf-8?B?bnpweTJ1YUpVcDd1QTBBYW4zc3htVzdENitZUzU1aG41MFUxMjVJczFuRGJL?=
 =?utf-8?B?RmhaZ2xEUUdpcVhUbyt3SWRPQzBlN3ppMk5NZWExbWhEaldCZlVUejloOTN2?=
 =?utf-8?B?enMwdnhzSGgvSDM2eEEzUkVNbWw1eSs1eDY3NzRsRzU5WUV3LzlzamJpbzNL?=
 =?utf-8?B?M1pIZ25ROTFQU0dWVDJoNGVjT01YTTJ4eUdIYVY5algwY3VDUDFFTUk4aWpt?=
 =?utf-8?Q?g6V2UP7r2F4aW7JHLgVNyVFuD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa02dd6d-6580-4428-ccf8-08db2928497c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 09:48:41.2965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Flj8PQUxcEyLvO2lzpig67vfEZFjyy/rEtj5MEl0dzJs14URH5FiKOMCsuaR/3rTBqBwATMAN/10MlfLg/DL7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8320

On 17.03.2023 13:26, Andrew Cooper wrote:
> On 17/03/2023 11:22 am, Roger Pau Monné wrote:
>> On Mon, Jul 15, 2019 at 02:39:04PM +0000, Jan Beulich wrote:
>>> This is faster than using the software implementation, and the insn is
>>> available on all half-way recent hardware. Therefore convert
>>> generic_hweight<N>() to out-of-line functions (without affecting Arm)
>>> and use alternatives patching to replace the function calls.
>>>
>>> Note that the approach doesn#t work for clang, due to it not recognizing
>>> -ffixed-*.
>> I've been giving this a look, and I wonder if it would be fine to
>> simply push and pop the scratch registers in the 'call' path of the
>> alternative, as that won't require any specific compiler option.

Hmm, ...

> It's been a long while, and in that time I've learnt a lot more about
> performance, but my root objection to the approach taken here still
> stands - it is penalising the common case to optimise some pointless
> corner cases.
> 
> Yes - on the call path, an extra push/pop pair (or few) to get temp
> registers is basically free.

... what is "a few"? We'd need to push/pop all call-clobbered registers
except %rax, i.e. a total of eight. I consider this too much. Unless,
as you suggest further down, we wrote the fallback in assembly. Which I
have to admit I'm surprised you propose when we strive to reduce the
amount of assembly we have to maintain.

> Right now, the generic_hweight() helpers are static inline in
> xen/bitops.h and this is nonsense.  The absolute best they should be is
> extern inline in our new lib/ and I'll bet that the compilers stop
> inlining them there and then.

That would be an orthogonal move, wouldn't it? I'm also not really
willing to go as far as calling the present way of it working "nonsense".
I could be talked into doing such a transformation in a separate patch,
but only if it is halfway certain that this won't again be effort
invested just to then face further opposition (other maintainers may not
agree with the movement, as we've seen for other remotely similar
changes to "extern inline").

> Given new abi's like x86_64-v2 (which guarantees POPCNT as an available
> feature), it would be nice to arrange to use __builtin_popcnt() to let
> the compiler optimise to its hearts content, but outside of this case,
> it is actively damaging to try and optimise for memory operands or to
> inline the 8/16 case.
> 
> So, for x86 specifically, we want:
> 
> if ( CONFIG_POPCNT )
>     __builtin_popcnt()
> else
>     ALT( "popcnt D -> a",
>          "call arch_popcnt$N" )
> 
> and we can write arch_popcnt* in x86's lib/ and in assembly, because
> these are trivial enough and we do need to be careful with registers/etc.

How does x86_64-v2 matter here? And how does using __builtin_popcnt()
help, which would use the "popcnt" insn only if we passed -march=popcnt
(or any wider option implying this one) to the compiler?

As to the 8-/16-bit case - I've already accepted to drop that special
casing. The main reason I had it separate was because the generic code
also has them special cased. In any event I would like to make all
agreed upon changes in one go, hence why I didn't submit a new version
yet.

> I'm not sure if a "+D" vs "D" will matter at the top level.  Probably
> not, so it might be an easy way to get one tempt register.  Other temp
> registers can come from push/pop.
> 
> 
> While we're at it, we should split hweight out of bitops and write the
> common header in such a way that it defaults to the generic
> implementations in lib/, and that will subsume the ARM header and also
> make this work on RISC-V for free.

Yet another independent change you're asking for. I've taken note of
both of these separate requests, but without any guarantee (yet) that
I'm going to actually carry them out.

Jan

