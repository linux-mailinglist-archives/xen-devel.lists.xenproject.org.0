Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 100F16C3731
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 17:42:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512866.793192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pef3f-0006WF-UU; Tue, 21 Mar 2023 16:41:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512866.793192; Tue, 21 Mar 2023 16:41:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pef3f-0006UD-Rg; Tue, 21 Mar 2023 16:41:59 +0000
Received: by outflank-mailman (input) for mailman id 512866;
 Tue, 21 Mar 2023 16:41:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pef3d-0006TJ-Kd
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 16:41:57 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ac40e13-c807-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 17:41:56 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8285.eurprd04.prod.outlook.com (2603:10a6:102:1ca::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 16:41:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 16:41:54 +0000
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
X-Inumbo-ID: 4ac40e13-c807-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKTe0Kocyr9SuhErSVn+lOjnqM/IbQ1GSabJDs1fjQm+mgEGmxoMlmv9EUhVBGJ3mazATajvzXDjqx0eqHiOURfmezDaRw9jcNVGx2Uz7xOaA3xGuK1eH6YI+pjh6/M7GvPm+DaR94+5dzjfhNvtKdI7BIPbn0BkxdX09DAZkd1G9+iShZLufV5mnjiLkMGC4pxvMwevPZR5UkxgXLPlqb95ZyNnYnpvMgtBoUmKIGhlKzJWUeCrZrD+oNoyu5jVhbMAjMKaSwlxNSWSA2gRH1ev6CmUkqwSf0PwqnHwzSXbCJsXdKmnbftcpDDrh3SSDTZmDF1Fy8wYMselkAK4Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/Vou/ms3DNalNmyKcATd53uigoc2UDDML55OSJfa2I=;
 b=F7IAZGbzz2t0A5GyKELPgM2rijtsVsI1gUGcKUiqY2jo6oeh65zLmTirYXfoDbN59Wg1mzRB1cC+NHhOdySKrvQVSHTPvWNO7f2Ox1HQ8IT/vHRUGc5znYkrtqBiAX8/115Y82GsRLx4HSi1dVQBz2rUSGleKGbz4LhT61HlkqJsuCK0ewguzaEPy29qBEOjGHcJJQ+Lfcs3mj8LwQ3ZBhJTvx9PNqKnSfvlFI8zlid973RAcw9oqxqvVMGNiEnd/rOAzfdrZwCb3RdFheWuzSppDepzMRznUdv6nSuz6EHq3iEttgK35QG4VGb+gPvY+b/zH7WaXSsGKW6Yz1ZN8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/Vou/ms3DNalNmyKcATd53uigoc2UDDML55OSJfa2I=;
 b=XzgsSSG5IkL2pKEWT/AT0ttT10G7nIKT4IB7LyciLnNEs79vzKdX7/SOZEqYDOyYK+FYMgcWITVZ9asMwWsePjpUHS+UFrZ605Hn2qeuF8osYWM0O+KFx3uB0A/D7ltDgEXRWS93SXzg506oV3sLmYLx+feW1EpaD3CQHutEQ0Pl7llxbeFIocmUNEZdC6rTgwyiqddpL9rTEn+Wo06NfM7Fohgx7xMeTxil3ypej1EFiOGU1x7rT3EuL2HgKyYInMOID5HPwmVjEciAUh5hfys3iR7nm99JcyyPj3Ckx1tq9YS3d2/3MS4RJhyjBABTkcx1C4GWiiIsyTEC7AsYeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3d866810-f33e-fc37-abbd-daf7aacc053a@suse.com>
Date: Tue, 21 Mar 2023 17:41:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] x86: use POPCNT for hweight<N>() when available
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
References: <55a4a24d-7fac-527c-6bcf-8d689136bac2@suse.com>
 <ZBRNWhExetXH1OaS@Air-de-Roger>
 <011cb7d8-fb32-74b1-2b06-f57be67f5c6a@citrix.com>
 <f1b0e3be-cf23-6471-7a59-c130380be0f8@suse.com>
 <ZBnF2oTLQjJtfZiK@Air-de-Roger>
 <e18b997f-48ba-4090-0c0e-67475f5b3329@suse.com>
 <ZBnb8Dv08XZm+a3t@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBnb8Dv08XZm+a3t@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8285:EE_
X-MS-Office365-Filtering-Correlation-Id: 149fce9e-6925-42b0-75ef-08db2a2b2dee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Egl8HnyYHfgHroS1s0wj+miD3dJMh2nKUJOn4BSLE0NM3N/BL3jeOmNmbpJfbyAfjfXDtbXVi88WMA95sDNXbGAtOc6i5x6QctDyYV9REsn3Cda+BVLE0exGEEMedfpk8pqMgyTFgKXOHh/KtHJZYkWe9Fk4kp3UlPa/h0aB0QkJLSj1U/GvOJXCFLDuphPNaR4GBWmHlNFV5ZiYwM6vQ4yhL7vawrueXKkPt0BYBdFoyTP2Bik9O8ez2MecROOfFasyJCH0RXyYOQRERoScFw7kqOoHWsVuUPhpIxtutOnuYvfKeAKhK4/PpQ0Vp6oX9Tp71KZ1toXpqKmkS1lUMa6jr2njyqKQudDPIrAP25Xe270aDLxKPyjKJXfayLrlHdruTuhpd3tj7SkBzj47gnR0wpr7XQ+M1SW8PW2YXbIIMNW75+01Dawmelyt0tJTtbg+1VISfBI5R81tCFdrPcurgebavgX5m8ZmjgbtMatTJPW/zTrdD++JcT5IBDQUfD6HUAaoWJUJqgVKPy4+Bx+ORZnOpqCulilkC4ieBsgqBnArtX5rg5XuJhoR9Y0kfTmFjH6nLybkSd7eHUI7/BbL/fDmDT+w0gdMSbjLStaySDx/I8/4Prnw9zaVW5I3YYl77HqhMNdT2QVvBpcRfoNXdWvqkx6P73/hGEulsOyEkYPWHkm+f6DoQ/ZPQ53QBaIElRigiY44xowu7G+zQXneDeEp6wy6PXpOmpQ0UuImG0PmPyQ4F7tZiHoIU0CLYwHOHM5NGgKwsmsEGOGB4g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(136003)(39860400002)(346002)(376002)(451199018)(8936002)(41300700001)(5660300002)(31696002)(36756003)(86362001)(4326008)(2906002)(38100700002)(54906003)(83380400001)(6506007)(31686004)(53546011)(6512007)(478600001)(186003)(26005)(6486002)(8676002)(66476007)(66556008)(6916009)(66946007)(2616005)(316002)(16393002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0JiT25yazNmNlBVaDhwTHQzYWZBSzVMTmw1WFQ1cU5SREhER20zdkNlNmZX?=
 =?utf-8?B?UWpwa2xRSGpLWnZCZlJZUi9FY1NpcStMdGlpOTVDT1N0M3BHOU40S3dpUmVE?=
 =?utf-8?B?bHdEa1ZLSitYRWpnUTVySU11YkRzenllTVl0ZmVMUU9KaUVNZnVta1V4bDMw?=
 =?utf-8?B?RXI4MmNjSmJqREp5Qk0zTE91MXZrU2QyY3VqSFZiYWg2V0dxYmh4QmJZN2px?=
 =?utf-8?B?aHdGWjBsUGZEQjRzaUZIeGVWaVVMNlhJd0lUMkdvc3NJUnUxMktvQXByYU9I?=
 =?utf-8?B?d3dZUjNUcFZscUZwRUsrd3l5VkdROGtPWURwZUE3Z3NJVEtMNU1XMkhaWFht?=
 =?utf-8?B?WE5vS08yOFptM3E3NlNGRDQ0QlJhVHIzcHVTSm9aYXhqckNORVNaTHk1emtS?=
 =?utf-8?B?ZXdJU0VodlR3aW92aXlPaU5FMGZiZTBUTlY5WlJNVEtKZS95ME11WWNRQW8w?=
 =?utf-8?B?dG9OWGk4MXFHd285MVJNZlpmVDNKdm5ZRDVua05IOS9KUDEraU9wbWFTMmVY?=
 =?utf-8?B?OHR4cVVhaktrdWxZdlczL0d1T0NGY0E0QzFpSEV5c0lzRWhWT0w4MEFlSEw1?=
 =?utf-8?B?V3dSSUFYbmpJallhcGR2VVJUY1A3VTlsdEt2bjdNRjJuK1R2SGEvYzlSU3V1?=
 =?utf-8?B?U1FhcFBQUDJqN0pTWkphbmplTC9mSC9CeG5UTlVac3JxQ0JPZ3cwRXVIcnh1?=
 =?utf-8?B?ZEs4SFRaazJjd0tTNFl3Ty9JeVU5Zy9NWW5PYmM4ak9sYU9IUVRwV1Y5cjdG?=
 =?utf-8?B?dXRIcnhqUXV4NEtSRFMyMHR6TWhYV2RpdU9IRWpWTFBGcElvT0U0WHhxK1RN?=
 =?utf-8?B?bVZFNjVtUy8wL0VyampiaTh2SEJsMUN3QmpDYlNSUWpVRFh6Mm5acitzTWkz?=
 =?utf-8?B?YjFaVzllb1l1dUZvOGIwMGtNNHlDVDR3TTRXT29WK0lWWjZaS1hFV0llbDN4?=
 =?utf-8?B?VU05TXRPMHlJNlVjaHBRekYxTWhWQVFneWZGeEp3U29BaGpSaXNoekdCaDV0?=
 =?utf-8?B?bVUyTE1pR0Y5TFNSMFpXZmR1TGx1aitxTzhqSHpEU212U3lxVUV3TUNMa1Ns?=
 =?utf-8?B?cDV5OE92N3FaaG0vR1p3aU5VaG84OVFnU0kzSU1RZmk4aVJzVGs5SDhPdmNa?=
 =?utf-8?B?dWR6a1c1NzhKbmlnWHpqZU44bmxPRDhQdDZFT0xaanQweVg0RDYwa09FMVNK?=
 =?utf-8?B?emtWaGp0Y0JPVTYvNnk0MnlLSSt0YlZVdmxKbi8za2ZvYnNZU1l6NzMwQUJh?=
 =?utf-8?B?NVlGT0NQY3lJQTZaalVLSTFVZlZRMyttdXJ5R1VYRmFMVC9oS2pUU3pJU2Fq?=
 =?utf-8?B?WnErTmlvZXFsMTlnTnl4ejFldzRNRGJpREdCVDhyUllMeWdaa01TYkh3bGNu?=
 =?utf-8?B?QXBWZm11cmJwZW5WVHBYVUU5aFh0MTB0WjIySUs5UzR5UXhYQjhTZGt3c2Mv?=
 =?utf-8?B?N0FWL1ZZYjAzUFYwTmpKMC9PRVdEbVRtWS8yYW5ITWxYaWJ1VC9VY1dORm4x?=
 =?utf-8?B?RUVhVnprQjJmL1oyVVlnMExjRURKR1RjbWVjUklBVUswWXkxZXI0bmNwdXdV?=
 =?utf-8?B?bThNNklBOTJhUjlRSHB6UDRpaXFPTkdFRHB1dU44VlBoUkhqekRDUHJVcmhq?=
 =?utf-8?B?TGZtOURHUWlaNnhWRzhHSnk4dU91QWpucE9ydkhLVElDQURlU0tzUkpIMEdL?=
 =?utf-8?B?WnV3UzlSTDF5OW5KS0pjdXQ2cnBFSnVTMFJnTkpZOTl0dTFrSmhTZVVUV2g4?=
 =?utf-8?B?dU81Q05oaWszOCttRUFpeVhzSFk3REo5S3IzMzdZUTM3NG1WckZ6a0RaVGxD?=
 =?utf-8?B?T2l4TXhlakVWLzlLV2twc1ZSd3hxeVJydUlLWDR0Y0FXUFdOZ21TZFJyY2FE?=
 =?utf-8?B?RG1XdzBZRUtvK1NPQStCNUJ0S3pmdmZDTnNEdTl1Zm02M29GVDhWVUZFSGV2?=
 =?utf-8?B?aGduUkV2dUozQ2hCSmRza2VwdEROaStrdUxnK0ZQcHo3Q2UrU3k5NnRRaG1w?=
 =?utf-8?B?Q3YwTnRoc0FxZUlrcHN4MUVsemVJcWpCaEk3Zkt1RGk2U1lYSUJocGltaVk1?=
 =?utf-8?B?ZzVOR01JU3BXSHBRYmVSdDFHd09YckpjZXJxanlEWnFLZmt1U1VraWQrUnA5?=
 =?utf-8?Q?PiZO4EeyJmP/OydXW8tXBoW7O?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 149fce9e-6925-42b0-75ef-08db2a2b2dee
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 16:41:54.7651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xjC35K31DE3l5aTo4yjitr/50lti9pymfKjwn7MjlLXNDzCY8jKjAlSDuFpdZisUr+ySefHbwptSqzwujYelSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8285

On 21.03.2023 17:31, Roger Pau Monné wrote:
> On Tue, Mar 21, 2023 at 04:35:54PM +0100, Jan Beulich wrote:
>> On 21.03.2023 15:57, Roger Pau Monné wrote:
>>> On Mon, Mar 20, 2023 at 10:48:45AM +0100, Jan Beulich wrote:
>>>> On 17.03.2023 13:26, Andrew Cooper wrote:
>>>>> On 17/03/2023 11:22 am, Roger Pau Monné wrote:
>>>>>> On Mon, Jul 15, 2019 at 02:39:04PM +0000, Jan Beulich wrote:
>>>>>>> This is faster than using the software implementation, and the insn is
>>>>>>> available on all half-way recent hardware. Therefore convert
>>>>>>> generic_hweight<N>() to out-of-line functions (without affecting Arm)
>>>>>>> and use alternatives patching to replace the function calls.
>>>>>>>
>>>>>>> Note that the approach doesn#t work for clang, due to it not recognizing
>>>>>>> -ffixed-*.
>>>>>> I've been giving this a look, and I wonder if it would be fine to
>>>>>> simply push and pop the scratch registers in the 'call' path of the
>>>>>> alternative, as that won't require any specific compiler option.
>>>>
>>>> Hmm, ...
>>>>
>>>>> It's been a long while, and in that time I've learnt a lot more about
>>>>> performance, but my root objection to the approach taken here still
>>>>> stands - it is penalising the common case to optimise some pointless
>>>>> corner cases.
>>>>>
>>>>> Yes - on the call path, an extra push/pop pair (or few) to get temp
>>>>> registers is basically free.
>>>>
>>>> ... what is "a few"? We'd need to push/pop all call-clobbered registers
>>>> except %rax, i.e. a total of eight. I consider this too much. Unless,
>>>> as you suggest further down, we wrote the fallback in assembly. Which I
>>>> have to admit I'm surprised you propose when we strive to reduce the
>>>> amount of assembly we have to maintain.
>>>
>>> AMD added popcnt in 2007 and Intel in 2008.  While we shouldn't
>>> mandate popcnt support, I think we also shouldn't overly worry about
>>> the non-popcnt path.
>>
>> We agree here.
>>
>>> Also, how can you assert that the code generated without the scratch
>>> registers being usable won't be worse than the penalty of pushing and
>>> popping such registers on the stack and letting the routines use all
>>> registers freely?
>>
>> Irrespective of the -ffixed-* the compiler can make itself sufficiently
>> many registers available to use, by preserving just the ones it actually
>> uses. So that's pretty certainly not more PUSH/POP than when we would
>> blindly preserve all which may need preserving (no matter whether
>> they're actually used).
>>
>> Yet then both this question and ...
>>
>>> I very much prefer to have a non-optimal non-popcnt path, but have
>>> popcnt support for both gcc and clang, and without requiring any
>>> compiler options.
>>
>> ... this makes me wonder whether we're thinking of fundamentally
>> different generated code that we would end up with. Since the
>> (apparently agreed upon) goal is to optimize for the "popcnt
>> available" case, mainline code should be not significantly longer that
>> what's needed for the single instruction itself, or alternatively a
>> CALL insn. Adding pushes/pops of all call clobbered registers around
>> the CALL would grow mainline code too much (for my taste), i.e.
>> irrespective of these PUSH/POP all getting NOP-ed out by alternatives
>> patching. (As an aside I consider fiddling with the stack pointer in
>> inline asm() risky, and hence I would prefer to avoid such whenever
>> possible.
> 
> Is this because we are likely to not end up with a proper trace if we
> mess up with the stack pointer before a function call?

That's a related issue, but not what I was thinking about.

>  I would like
> to better understand your concerns with the stack pointer and inline
> asm().

You can't use local variables anymore with "m" or "rm" constraints, as
they might be accessed via %rsp.

> Other options would be using no_caller_saved_registers, but that's not
> available in all supported gcc versions, likely the same with clang,
> but I wouldn't mind upping the minimal clang version.

Right, you did suggest using this attribute before. But we continue to
support older gcc.

> What about allocating the size of the registers that need saving as an
> on-stack variable visible to the compiler and then moving to/from
> there in the inline asm()?

That would address the fiddling-with-%rsp concern, but would further
grow mainline code size.

>> Yes, it can be written so it's independent of what the
>> compiler thinks the stack pointer points at, but such constructs are
>> fragile as soon as one wants to change them a little later on.)
>>
>> Are you perhaps thinking of indeed having the PUSH/POP in mainline
>> code? Or some entirely different model?
>>
>> What I could see us doing to accommodate Clang is to have wrappers
>> around the actual functions which do as you suggest and preserve all
>> relevant registers, no matter whether they're used. That'll still be
>> assembly code to maintain, but imo less of a concern than in Andrew's
>> model of writing hweight<N>() themselves in assembly (provided I
>> understood him correctly), for being purely mechanical operations.
> 
> If possible I would prefer to use the same model for both gcc and
> clang, or else things tend to get more complicated than strictly
> needed.

We can always decide to accept the extra overhead even with gcc.

> I also wonder whether we could also get away without disabling of
> coverage and ubsan for the hweight object file.  But I assume as long
> ass we do the function call in inline asm() (and thus kind of hidden
> from the compiler) we need to disable any instrumentation because the
> changed function context.  I don't think there's anyway we can
> manually add the function call prefix/suffix in the inline asm()?

I don't know whether that would be possible (and portable across
versions). But what I'm more concerned about is that such functions
may also end up clobbering certain call-clobbered registers. (Note
that when writing these in assembly, as suggested by Andrew, no such
hooks would be used either.)

Jan

