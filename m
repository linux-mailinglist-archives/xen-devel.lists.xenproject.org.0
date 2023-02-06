Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0792468BF04
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 14:58:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490465.759171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP20j-0004Ch-Kk; Mon, 06 Feb 2023 13:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490465.759171; Mon, 06 Feb 2023 13:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP20j-0004Ao-HC; Mon, 06 Feb 2023 13:58:21 +0000
Received: by outflank-mailman (input) for mailman id 490465;
 Mon, 06 Feb 2023 13:58:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pP20h-00049B-EW
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 13:58:19 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7d00::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e080ebb-a626-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 14:58:17 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8637.eurprd04.prod.outlook.com (2603:10a6:102:21c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 13:58:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%6]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 13:58:14 +0000
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
X-Inumbo-ID: 4e080ebb-a626-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJrYRecOtZJvyTJivxTgmhGSDLbZcp58THSjLaashuLadpwWBD+Df7cBHp2b/Zfk4vsdcnUesBVsq06eGYId5lZLvj6EPof9y5KP15sfinhRCP0KltY4rZ0knejX5KbikkefbtIkhlLcKkEgtToCV8/1XJQ0oTnn2EvoCgwoFeENe1MG0pWTiS2DXB9K+5grBEhHEwQZNGz5ERQPJS9uMCTyLjV3uA63+J/Sf3c/s8pxV99Y/Q+no8pP0XQLnL0bSiTkoiUgPZr1gzKfQO2d7LbdXYdirNEwZ+wIP0iTm/TINS8oVGoJV5YrihsMzEdd2ypF5q0KfzEuBK+V0Alc0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GzqF5368DTaBhVCL2nvfUNDbe9atO/rOWGiNiaI0vb0=;
 b=gzTscLW3kly2BHwwjyrRlNv3g6pVirKiPPOrajkeOj1BgHZXPGu6APs1zuvgpkSZHhPVKNDLd17mY3UB5HziqcF+hKh5HhEL5llWiQBxc0y/fntlzY8LiHaUMe9+JNMQKlpNX2/pFIkOy9QrFpwrApNSIQIXlN3NqUCNQiyUvhgcLyii1fBNOcqIB8Io4LSeayVmTHN4EoaibZSfw6mtVyP8eIBMnRZnnbSeCYFAhg09uS0AKJKrwcEadGXbn8nDF44vMyF13zGw4m+N2voFZfPn9qAKyHzf1lo921NImep1md0est6K3tKyTYjP8DAtSIfVGfbRrWMyiuqZzvdOmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GzqF5368DTaBhVCL2nvfUNDbe9atO/rOWGiNiaI0vb0=;
 b=juECzp8pRzgHBBaGhhBGNEAbA1FAFDYO+80rJtKpxVOuyVlUx4INpbYShYiTLXbUfFESO37mfhhDGUUa4ZwcvoS0EcZ3BVJQ0rJJU/xy+wkSsJm8z+5IfbafiMg52fVwnf53Jttl3u2tOAB/8eGjq8eH4xWbTPIjpFYHLqDoBBiYmNLxdpYW+4K0IJqNKAkeONXrMx1QtCldOxI9fD34Wpe3fJ4qIsR+mSRIaULEPdRJso4X4P1mA2Fyf8j0qgUthV8KoBvv0IP+RTbp6xxY284408pzA80t8hWgiMnLzvBayowS5oXEdXGubzAk6ftt+6pAqyGMOcn8K/r1I33jkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <38621f02-83a3-d1dc-560f-905dd0d963b0@suse.com>
Date: Mon, 6 Feb 2023 14:58:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/4] x86/spec-ctrl: add logic to issue IBPB on exit to
 guest
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <930254a6-d0c8-4910-982a-bfd227187240@suse.com>
 <8ee98cc0-21d3-100a-ffcc-37cd466e7761@suse.com>
 <718f6fd0-cb96-6f72-87ff-7382582d89f9@srcf.net>
 <fa38f305-df29-4178-2279-17a084fdf2cd@suse.com>
 <df86e0a6-1415-3fd3-5202-faff5edfc271@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <df86e0a6-1415-3fd3-5202-faff5edfc271@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8637:EE_
X-MS-Office365-Filtering-Correlation-Id: c850fbc3-9ee6-4df2-473d-08db084a30cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y9Q8jRmq05yNYV9DnsWMa9ePViobilfTF+I03/e0H2MwcTcgWeRkcz5KkCt2gUyzJm849Sby2QnzYfBFmSRpJ07AYWtuPnGC/tcXg8Qv8Tuc5kH571a1nxUMoRYicn1UCNBTNntLBPBhC6zEsZxKSP+BnlT54qU5/1WCFNxmcFA91LJrTB2c6oJ9oHfdO7kQ6IHALgoHlZiToktkPCLfs/G6ziYcAa8QVxO2vaXyIoIDraq58Ccr2gZNR3aECpwqZ2eAXho0tzX0n6Nby5sNNJkrweNVXtaMa97I8AK/XVaVTXMhfQzglbj1sxySHO6+EG9mc5v+Ml2JBWVzWttNgNHeRFc+GzXENmWbP51Pfnj1+HbHaZjqNQUkkmz45hI0AgU9U0OXgNbiyNR7Hq66OIrIPoZde6VzGmxdnsrwx3NHHBTaLX04EGX1/d/gcoaDyOONdUrXKq94aOMlWeuvhyYbfXD/9VYMhMtzcyS+pJ2suovsW2pr7pm2XlAbHJ/b95Io5KRgLtwRW8fH3fqk/3dVK4TGFxT8Ui5S22xOZube0lL/MkqjbymVZH9iRortWKDKvT/cusncHS84lsflfDI0qzdiN7SeybgfACiE0NVefnuoRTzhD08oaEVZh71Y96rrJR3+d1LI92UZ4m4OZESYGGXJbQR0AatQXjTN54CZjpPnlQ+iehgMU1Pe3K094tJ0VY5lMpeV3maGuYL53laNBb00Ll/vh6og2ZRI/TQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(346002)(396003)(39860400002)(366004)(136003)(451199018)(66946007)(83380400001)(38100700002)(66556008)(66476007)(41300700001)(8936002)(6916009)(4326008)(8676002)(2906002)(30864003)(6506007)(53546011)(6512007)(26005)(186003)(6666004)(2616005)(54906003)(478600001)(316002)(6486002)(36756003)(86362001)(5660300002)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkpNclJYby94TUtWSkUvM3BKY0ZGSGRDZG8rV2M0ZmQ3ejBqcnc5M3g4Wlhj?=
 =?utf-8?B?SmpidjBNWGVzS2N6SC9WenM1VzAvZDUzMXNWSTg4a01uTFdLVDdqTHVaRVFB?=
 =?utf-8?B?MUMzRU82WlJqdHFhQkpPQmxFOENUWS9aUytZdVJ5UTNRQ2tRSHBTTUVySG1T?=
 =?utf-8?B?aDZKWm1wUFd0RWUwNS92ams2bEx5TXhzWXpSbm40Y0l5NHdyVjBUUHQvY0Q0?=
 =?utf-8?B?VEhxMTdGc29NVlJuMW1Ua3BNYnE0Zy9nMVRmMFBPS1hvMTNJNFlkNm5Wd0M1?=
 =?utf-8?B?WVlQV0kxa09XNTdLeTNuVmdpaGlSVHA3WkFPdU91U0VickVMMHU3WEllWEtt?=
 =?utf-8?B?NDNVaHdCL09hSXNPUXl6WkNVN2tRbXJRNnJEbzVnc3pLWWFUZWljSXQzNUR5?=
 =?utf-8?B?THdsUW02ek1ONWNFN3NXRkl0Wjk0VmZzemlEa0FmczJFQzRoY1NRQy82TGF5?=
 =?utf-8?B?bzhHRkZlSEt4dFBBK3JVZXdpaTZaS0U0cGJwZEdac0U0d3orZlJKWVhrcW1p?=
 =?utf-8?B?MHJzYmNJQjUvNEhYOVRLZWtPcFZxRVU2Z3hBWjRzVTF0WWdMQTNqMnNzb2Nv?=
 =?utf-8?B?ZXN1UGQ1QWl1QTdOUGlrczAvNHdBWVYwazBWcWFDNlJ3Y2d4S0J1VEM3cm96?=
 =?utf-8?B?dy9GaWhSQVhLeVlWYThXRjRIQkxoUlhqSUsyVWQ4Tmc0YnNBVkJhY0pZUi9B?=
 =?utf-8?B?dlZ2ODdyTlRlbUd0ZjNiZjdPTW13Nk9kS2x6b001N0QrdkJjdFhnNTJiV1V2?=
 =?utf-8?B?QmNhS3ZrYXhqWnhsVXowQ3FHeXJwbVBKdTZqRzBIbkRQY2xkVGtyb2dwc1Vj?=
 =?utf-8?B?dkpDd1laSGVGZHhRNUpVMmx2M2h2c3JhS3NBa3BJRE04b0F4czBWNDNwZlFp?=
 =?utf-8?B?bVVSVEpnU0FjRkRkWXdoOU1pMGdDRmVhN1c4UjhKekJxcElqbnFLZUh4Y01u?=
 =?utf-8?B?T2RwU2VEcjNOenZHUUwvajhaaC9CenBlQm1SN2JxelU2REZ1aDdtQXRMczFN?=
 =?utf-8?B?Z2FtRUc2YzlDN1VWd1dHRVZxMFNGSmxiZU1qNmZ4L3ZoMzR3a2xIV3ZzdGUx?=
 =?utf-8?B?Z3ZiQWYyMWhYNFFqM2hHTjFMdjk1YWNLUERzYjkza0RqM2JKZkI1d2VhTFhi?=
 =?utf-8?B?V214cno2c2k0bnlVcUJzUDJqNUhIeXRYSTFMWEkzSXp3OTdKQ08rbG9DeGtE?=
 =?utf-8?B?TzJaN3RJV285TS9rYmVhTHpBQ3ZNOEZWL0dvSGJRRVZQZ0lsc2MwOFdPdys0?=
 =?utf-8?B?RUFraGRhdnVGRitNV29CT1h2Z3JkM1g2UVl0ay9jODhEYUNzSEdnZEdKdldj?=
 =?utf-8?B?N3FNOVgzaSs5dklTNlI4cGdVOUNRNldzUzdDYjlYc0lNOTlaWStMK2V6bzEv?=
 =?utf-8?B?TmVZMG5RU0hVNkFicnNrK2s1WkY1VVRuWkdXVUdPVDFpcU96emtHUGIzMVky?=
 =?utf-8?B?cFgvSzZLTDJ4bGVFWlJIRlkwUlBqNUFjSkh4STBWQlgrZEVJaVJtRHVpdW50?=
 =?utf-8?B?SnFFejdDN0pDamhuL1ZCVlNDMXI0MWtqWGRoaVRoS1N0c0Q4SjNLRVNFc3Aw?=
 =?utf-8?B?Yll3L2VWV3dwUEhOVUZvZXZicWEzM2VJUEovZnZQQ2Flb3FDbm0vQTN1K0U3?=
 =?utf-8?B?TVQ5elptdTcwelpTamFIZ1p0OXg1RWNBbENuSHpkZkhEeDdwNExLZTZneFRO?=
 =?utf-8?B?RGs2dGRFa0xmQkRkQzJqRWVQc1dBOWUweThTVFQzbmhaTEFyd2d1S2IzY0l4?=
 =?utf-8?B?UHlSa01CSlBWRWxsbFhCeGZIbEFGYVlSd3gyTExaUkpaTWpKMWpMeDM3TXg1?=
 =?utf-8?B?S2lGVEwrblJISzdBQllsRWJvRWlRYWN0SFQyWWExQWZqL1NRcVpKdSs2aW1s?=
 =?utf-8?B?OGwyNzlWN3h1aXQzbi9uQi9odkVCV09zR3M3eDRKMEdvd2tpQlczd1VENEU1?=
 =?utf-8?B?a1RybGFCUElXYzhxY05UbENwWEM0NXF4OEFITGM0TjFPamlPQ0RLNTJUUllr?=
 =?utf-8?B?anVvTzIwcEo5OFovc0YydWZKNEZWWTEzand2NEhwRHFENThwQTdwTjBaTVdp?=
 =?utf-8?B?aVRjL2lvM1JWUER4U21YNU92aUZoQ2U5a2Z6eWI2alR2T0tGRzRMN2hEVVgw?=
 =?utf-8?Q?vql+aeSc4EItmzNqlvkv6Z5tI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c850fbc3-9ee6-4df2-473d-08db084a30cb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 13:58:14.4318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: scZ1d2F6CCQQy5aM1vZ4HvgWjeLt+LfIsDKqOFfd+Q3Mksgki/thkoZor4EnlrXA7F67VSfutQebX7jUq6kzIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8637

On 26.01.2023 21:27, Andrew Cooper wrote:
> On 26/01/2023 8:02 am, Jan Beulich wrote:
>> On 25.01.2023 22:10, Andrew Cooper wrote:
>>> On 25/01/2023 3:25 pm, Jan Beulich wrote:
>>>> In order to be able to defer the context switch IBPB to the last
>>>> possible point, add logic to the exit-to-guest paths to issue the
>>>> barrier there, including the "IBPB doesn't flush the RSB/RAS"
>>>> workaround. Since alternatives, for now at least, can't nest, emit JMP
>>>> to skip past both constructs where both are needed. This may be more
>>>> efficient anyway, as the sequence of NOPs is pretty long.
>>> It is very uarch specific as to when a jump is less overhead than a line
>>> of nops.
>>>
>>> In all CPUs liable to be running Xen, even unconditional jumps take up
>>> branch prediction resource, because all branch prediction is pre-decode
>>> these days, so branch locations/types/destinations all need deriving
>>> from %rip and "history" alone.
>>>
>>> So whether a branch or a line of nops is better is a tradeoff between
>>> how much competition there is for branch prediction resource, and how
>>> efficiently the CPU can brute-force its way through a long line of nops.
>>>
>>> But a very interesting datapoint.  It turns out that AMD Zen4 CPUs
>>> macrofuse adjacent nops, including longnops, because it reduces the
>>> amount of execute/retire resources required.  And a lot of
>>> kernel/hypervisor fastpaths have a lot of nops these days.
>>>
>>>
>>> For us, the "can't nest" is singularly more important than any worry
>>> about uarch behaviour.  We've frankly got much lower hanging fruit than
>>> worring about one branch vs a few nops.
>>>
>>>> LFENCEs are omitted - for HVM a VM entry is immanent, which already
>>>> elsewhere we deem sufficiently serializing an event. For 32-bit PV
>>>> we're going through IRET, which ought to be good enough as well. While
>>>> 64-bit PV may use SYSRET, there are several more conditional branches
>>>> there which are all unprotected.
>>> Privilege changes are serialsing-ish, and this behaviour has been
>>> guaranteed moving forwards, although not documented coherently.
>>>
>>> CPL (well - privilege, which includes SMM, root/non-root, etc) is not
>>> written speculatively.  So any logic which needs to modify privilege has
>>> to block until it is known to be an architectural execution path.
>>>
>>> This gets us "lfence-like" or "dispatch serialising" behaviour, which is
>>> also the reason why INT3 is our go-to speculation halting instruction. 
>>> Microcode has to be entirely certain we are going to deliver an
>>> interrupt/exception/etc before it can start reading the IDT/etc.
>>>
>>> Either way, we've been promised that all instructions like IRET,
>>> SYS{CALL,RET,ENTER,EXIT}, VM{RUN,LAUNCH,RESUME} (and ERET{U,S} in the
>>> future FRED world) do, and shall continue to not execute speculatively.
>>>
>>> Which in practice means we don't need to worry about Spectre-v1 attack
>>> against codepaths which hit an exit-from-xen path, in terms of skipping
>>> protections.
>>>
>>> We do need to be careful about memory accesses and potential double
>>> dereferences, but all the data is on the top of the stack for XPTI
>>> reasons.  About the only concern is v->arch.msrs->* in the HVM path, and
>>> we're fine with the current layout (AFAICT).
>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> I have to admit that I'm not really certain about the placement of the
>>>> IBPB wrt the MSR_SPEC_CTRL writes. For now I've simply used "opposite of
>>>> entry".
>>> It really doesn't matter.  They're independent operations that both need
>>> doing, and are fully serialising so can't parallelise.
>>>
>>> But on this note, WRMSRNS and WRMSRLIST are on the horizon.  The CPUs
>>> which implement these instructions are the ones which also ought not to
>>> need any adjustments in the exit paths.  So I think it is specifically
>>> not worth trying to make any effort to turn *these* WRMSR's into more
>>> optimised forms.
>>>
>>> But WRMSRLIST was designed specifically for this kind of usecase
>>> (actually, more for the main context switch path) where you can prepare
>>> the list of MSRs in memory, including the ability to conditionally skip
>>> certain entries by adjusting the index field.
>>>
>>>
>>> It occurs to me, having written this out, is that what we actually want
>>> to do is have slightly custom not-quite-alternative blocks.  We have a
>>> sequence of independent code blocks, and a small block at the end that
>>> happens to contain an IRET.
>>>
>>> We could remove the nops at boot time if we treated it as one large
>>> region, with the IRET at the end also able to have a variable position,
>>> and assembles the "active" blocks tightly from the start.  Complications
>>> would include adjusting the IRET extable entry, but this isn't
>>> insurmountable.  Entrypoints are a bit more tricky but could be done by
>>> packing from the back forward, and adjusting the entry position.
>>>
>>> Either way, something to ponder.  (It's also possible that it doesn't
>>> make a measurable difference until we get to FRED, at which point we
>>> have a set of fresh entry-points to write anyway, and a slight glimmer
>>> of hope of not needing to pollute them with speculation workarounds...)
>>>
>>>> Since we're going to run out of SCF_* bits soon and since the new flag
>>>> is meaningful only in struct cpu_info's spec_ctrl_flags, we could choose
>>>> to widen that field to 16 bits right away and then use bit 8 (or higher)
>>>> for the purpose here.
>>> I really don't think it matters.  We've got plenty of room, and the
>>> flexibility to shuffle, in both structures.  It's absolutely not worth
>>> trying to introduce asymmetries to save 1 bit.
>> Thanks for all the comments up to here. Just to clarify - I've not spotted
>> anything there that would result in me being expected to take any action.
> 
> I'm tempted to suggest dropping the sentence about "might be more
> efficient".  It's not necessary at all IMO, and it's probably not
> correct if you were to compare an atom microserver vs a big Xeon.

Hmm - "might" still isn't "will". ISTR us actually discussing to limit
how long a sequence of NOPs we'd tolerate before switching to JMP.

>>>> --- a/xen/arch/x86/include/asm/spec_ctrl.h
>>>> +++ b/xen/arch/x86/include/asm/spec_ctrl.h
>>>> @@ -36,6 +36,8 @@
>>>>  #define SCF_verw       (1 << 3)
>>>>  #define SCF_ist_ibpb   (1 << 4)
>>>>  #define SCF_entry_ibpb (1 << 5)
>>>> +#define SCF_exit_ibpb_bit 6
>>>> +#define SCF_exit_ibpb  (1 << SCF_exit_ibpb_bit)
>>> One option to avoid the second define is to use ILOG2() with btrl.
>> Specifically not. The assembler doesn't know the conditional operator,
>> and the pre-processor won't collapse the expression resulting from
>> expanding ilog2().
> 
> Oh that's dull.
> 
> I suspect we could construct equivalent logic with an .if/.else chain,
> but I have no idea if the order of evaluation would be conducive to
> doing so as part of evaluating an immediate operand.  We would
> specifically not want something that ended looking like `ilog2 const
> "btrl $" ",%eax"`, even though I could see how to make that work.
> 
> It would be nice if we could make something suitable here, but if not we
> can live with the second _bit constant.

How would .if/.else be able to go inside an expression? You can't even
put this in a .macro, as that can't be invoked as part of an expression
either.

>>>> @@ -272,6 +293,14 @@
>>>>  #define SPEC_CTRL_EXIT_TO_PV                                            \
>>>>      ALTERNATIVE "",                                                     \
>>>>          DO_SPEC_CTRL_EXIT_TO_GUEST, X86_FEATURE_SC_MSR_PV;              \
>>>> +    ALTERNATIVE __stringify(jmp PASTE(.Lscexitpv_done, __LINE__)),      \
>>>> +        __stringify(DO_SPEC_CTRL_EXIT_IBPB                              \
>>>> +                    disp=(PASTE(.Lscexitpv_done, __LINE__) -            \
>>>> +                          PASTE(.Lscexitpv_rsb, __LINE__))),            \
>>>> +        X86_FEATURE_IBPB_EXIT_PV;                                       \
>>>> +PASTE(.Lscexitpv_rsb, __LINE__):                                        \
>>>> +    ALTERNATIVE "", DO_OVERWRITE_RSB, X86_BUG_IBPB_NO_RET;              \
>>>> +PASTE(.Lscexitpv_done, __LINE__):                                       \
>>>>      DO_SPEC_CTRL_COND_VERW
>>> What's wrong with the normal %= trick?
>> We're in a C macro here which is then used in assembly code. %= only
>> works in asm(), though. If we were in an assembler macro, I'd have
>> used \@. Yet wrapping the whole thing in an assembler macro would, for
>> my taste, hide too much information from the use sites (in particular
>> the X86_{FEATURE,BUG}_* which are imo relevant to be visible there).
>>
>>>   The use of __LINE__ makes this
>>> hard to subsequently livepatch, so I'd prefer to avoid it if possible.
>> Yes, I was certainly aware this would be a concern. I couldn't think of
>> a (forward looking) clean solution, though: Right now we have only one
>> use per source file (the native and compat PV entry.S), so we could use
>> a context-independent label name. But as you say above, for FRED we're
>> likely to get new entry points, and they're likely better placed in the
>> same files.
> 
> I was going to suggest using __COUNTER__ but I've just realised why that
> wont work.
> 
> But on further consideration, this might be ok for livepatching, so long
> as __LINE__ is only ever used with a local label name.  By the time it
> has been compiled to a binary, the label name wont survive; only the
> resulting displacement will.
> 
> I think we probably want to merge this with TEMP_NAME() (perhaps as
> UNIQ_NAME(), as it will have to move elsewhere to become common with
> this) to avoid proliferating our livepatching reasoning.

Even if I had recalled that we have TEMP_NAME() somewhere, I'd be very
hesitant to make anything like that into more generally accessible
infrastructure. I consider TEMP_NAME() itself already a too widely
exposed. The problem with it is that you can easily end up with two uses
as the result of expanding something that's all contained on a single
source line. Hence I very specifically want to have uses of __LINE__
only in places where either it is the top level source line, or where
- as is the case here - it is clear that no two instance of the same or
a similar macro will ever sensibly be put on one line. (Even then there's
still the risk of using the C macro inside an assembler macro, where two
instances would cause problems. But if such appeared, making the
assembler macro suitably use \@ instead shouldn't be overly difficult.)

Jan

