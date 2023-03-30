Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B0B6D0390
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 13:41:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516666.801166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqeA-00073O-Hn; Thu, 30 Mar 2023 11:40:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516666.801166; Thu, 30 Mar 2023 11:40:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqeA-00070M-Ec; Thu, 30 Mar 2023 11:40:50 +0000
Received: by outflank-mailman (input) for mailman id 516666;
 Thu, 30 Mar 2023 11:40:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phqe8-00070G-Vr
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 11:40:49 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe12::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b63689fd-ceef-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 13:40:47 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7477.eurprd04.prod.outlook.com (2603:10a6:10:1a9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.21; Thu, 30 Mar
 2023 11:40:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 11:40:44 +0000
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
X-Inumbo-ID: b63689fd-ceef-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJmlXXLfOM30AySkICluADyfMbqi67YpvHEhOS9gnbFSQIH2oalttE73RCG5tnbkhPSoqOmKz3Prb8aS3RxJlWOeHKWBzaeEjTyNVvMaClkgspXLza5AUpUGNMm6dj/xLZZn4qf1PkmGK2MASSYW4AIVmD9NjdQAHmyg0SLBzJIX7LR0C37EY4nuk6ovTeQbqw0F32FCZhUcqOkfOOwkmOHf9pAx/X7W8mQhxwueDMgCNHdjQ+nTv3/QrVdxrJCVmlQOpXZXFDran0EtxTP9AsEboERPsM575pnd3dpBCH13kDqFDGOdcEObRfKuIP5Re4R5GYgeNlmsyTPW8bz+6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljr+TGhT/bVsusV+ATUJbeFDluaa1XdB6hxCHA2v6vc=;
 b=fURidG+TTaAMj+HRKoTI4e/4j+SS80tIEX+Czc/cGLYpplZNhOe0NM6YcZS6ZNRsSwV9bpjHknQnXa+dRk1S8XgdQ0ItiEGfQGkn+MyJb2/QLReX1QoA4Drcr3xl7fVdfbUwRHyd91vZOnHjwuckMdi4jiO76wHPASi1opBjDK/eewMlWFAi7J2vRQBZh78CpKxBRbbGTgd4I4CMu2K4wz2tOkW2Ouxp38rYngtWgA8BrdzpjiLyhVPrsbvIYYsnfePP6azFklFa+h56EIe/AS17/pkczN8qX7iU+0FlG//5UM3zBYBcbQ1fSbhmrPg07wti+fB37t61VcpDLl5Hgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljr+TGhT/bVsusV+ATUJbeFDluaa1XdB6hxCHA2v6vc=;
 b=ANSkSaVUklkGiFoQ6Ja+KlGmGAeD0zDrRjEwclJ9aZYPIuiuWbze9F8aOJZUQbhCzc/n2mjqo/5znk2RSjQ0/PN+GPYsYKRCxaJmt+g2br2Xht1Jgi8jYSHgL49/D85IJrq28kBqgbS7yHQyJd1yJ4PJ3JOvsJ9s74kGh395/j+RrRMYv2y4pbI7b0Avzcvs3z3C5U+QUxwQZMiZQYC3WNfclsqnIROP6eryW2wm20kGLB8RWyxtDAZGHhywtFjglQ4pmiOcYxAfacGqHhrjTJgCMLx8IFbjqeZVFcVtWFHMY75RtAUPuCI5/T0n9dlTksQmEnQRnQnpPGDHEr7AGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6591a671-a71e-f669-749f-c36dcd593cde@suse.com>
Date: Thu, 30 Mar 2023 13:40:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 0/8] x86emul: a few small steps towards disintegration
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <7f5287ad-8442-6c53-d513-f9a8345c4857@suse.com>
 <ZCL3W/HrwLANuE/0@Air-de-Roger>
 <40d58ac1-d0bb-afed-c0ae-c545c7bff30c@suse.com>
 <ZCRIbKcfi8hn1m8Z@Air-de-Roger>
 <600f8643-fddb-e9f8-3d73-41eead3d7cfa@suse.com>
 <ZCVcPQNBS3bjVF+W@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZCVcPQNBS3bjVF+W@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7477:EE_
X-MS-Office365-Filtering-Correlation-Id: 419a96fa-a30d-47ec-1937-08db311398f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Zz2bsVszE6srmSj8XbGY+rxRo2o+w9fdZcY55BwWTWQq9TlbAgMuubXZDb8tZf38R/Gaikc7Mz72OG2A+NiSPxsQdVxqLvNqG9bq/up0iO1Ja9QU3ZPulamYEBlAVcsXQW/2bEZoN29ZEDmRoSISdAit8HNLmTGTtiPmCra8sxC1YT1NTomgg3+KNS8tbYlac4HDjukTghXlCGE3Zi1+abFvRKAMapUFBUEAShcgP/zzTyb3FzWflWyn5QeU6FMDPqPnsjDRnfffBe2avQJbKH3qmBrrvS/lFVpJ+l/O4VXgaUmK5vhLo9mtOpHd37PQgWTekTsWc4K7gqOjaJ+EEAa65f1ZTdXq/u8nhfIhk6/9Ldtk0pdCYLN6QP0kaG8W782i9U3tLhBjc2xbavgvfButYkkd77B1mKP1VxsE1scU17NNSOK45oIVjVWqhb738vJdCYIT0Pb2X4ng1EG0Op0yFUkaNpSl1CWEWCpt1LHA+TK0+MJ7UguzgopkVhk+PEVvPDY/drgg/IOVE0mG9nVWEajNW9moliilr/HQS3kMtMLNWCXqzNwtcFgdv4UUPZbLoVsd1+gpb+/xnrjOJh1JLbNpWy028VjTsmDxtcnUNFmIbQ9sNvaW3tEiD9VNK8tEhChPQQ8HRWTOK5VuQQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(136003)(346002)(376002)(396003)(366004)(451199021)(2616005)(36756003)(31696002)(86362001)(66899021)(31686004)(2906002)(6486002)(478600001)(186003)(83380400001)(53546011)(6506007)(26005)(6512007)(66556008)(6916009)(66476007)(66946007)(316002)(8676002)(8936002)(41300700001)(38100700002)(54906003)(4326008)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGtOTnhYUkIzNjdmQzZBcmtoTjE2bThhc0dSS3dWditqR244KytzMTRhc3JQ?=
 =?utf-8?B?UWJaaHBhcisyQlkvQjNTVTNGcVJNekM4cG9zUVE3dy9XeTZlRHpUNkpzbndi?=
 =?utf-8?B?Wkh3RlI0MjNoamFvTXozSDBUOGpUNXk2Y1NlTkt5UDI1U1I2TXZOT1h3Qm1K?=
 =?utf-8?B?bHFYbW51NUpGT1EyWUMxdEhHYU9HazRPdi9jU3hsM1I3MlcyQ1NUS0ZlQll3?=
 =?utf-8?B?RUtsTTVtSDJvR3BESUVSZGg5LytWVHB6UmFENjlVWkI0YndWUkY0SkIrRldZ?=
 =?utf-8?B?YmhMTjRWajRmdFYyNnh3TmJCV1NJRk54L1g2QzM4a080UzVMMlhXeFA2d2pa?=
 =?utf-8?B?dUlPalY3aXVqYUM1NGQ1S25BREd4bksram1mTnQ5UkV2V21oMFg5S3pCdnNt?=
 =?utf-8?B?UWpqZGwxeTNvSVlBREIzTVZTU1YrTnJUNlF3NFpITjNWLzJyVDEwOVNHeUph?=
 =?utf-8?B?dWtVYllCL1lrMGNxR2Zzd0wvaGZ0d3dXdWkwUHQyOVJ1ZGhBTGtFcWp6ZTZj?=
 =?utf-8?B?REkrUEpxLzh6UUdnMGdMYndZUW12cm1PVFNvNVVtOHByUSs1bmNGSWU0TVBU?=
 =?utf-8?B?OUdBZElRYXNXVmd3T0xpb1ZQTElsUWQ4SS9za3VTTHhOWjB3ekNhVXZLRk5a?=
 =?utf-8?B?ckxGVit2ZFEyZHNMWFE5WHBsbzVUOG95RE1IVW5HcW5ERkE5MmdrWGNQWm81?=
 =?utf-8?B?ZFMvY3FRSTNRLzgvR2s1bC9YOURZZndsVVdVcFJRTUYvMXNYS2xvaTFPSXho?=
 =?utf-8?B?aFVmbDk4dkhydFJ1aW9Ec1E3VHJlbG43NURTQTZrL0pRdXBkMTN2UGh3VitK?=
 =?utf-8?B?T2t4YXBsWkZmL0dxcnlyTmsxcDdXNjRVemo4Mjh3REo2U0R4U1hzNTVFUlpm?=
 =?utf-8?B?TXJ5bUx2Q1NGdTFKUTNQcW04OTYvNXlRa0ZVUE0xa1hSbDZQdTNIUzFac0Jt?=
 =?utf-8?B?emhLM1F4bGY0UDJ5NXp6UzdzbThhb1RpTkhENk1RWXZqUEZHSFVtZlR4Slho?=
 =?utf-8?B?VlZxbmM2bWtZODBseUg5QnRrNEtBWFArU3hpL2Q2ZXp5UnljUHU0eTFHQ2hY?=
 =?utf-8?B?a2F4bmg3bC9FWG00NEgxWEJWZ0pVdFkyQXdkVXkvcDFpK2FyUlFRemFuM1pF?=
 =?utf-8?B?L0ptaU1CVzI5aWRKNGNSWmtKazB1VnNIWHdLT3BsUHVEWWdhTlRPM3NRVDJi?=
 =?utf-8?B?U0tObU1RTC9iL1BaTWdJekJTR283MG1aU1ZZYVp3VFQ3Z1A4S2xCNHQwbVlV?=
 =?utf-8?B?ZExKVUZRYk5vQ0tWbEc3VjhCUWtXdUc2cklSVXl3SUh1MEplZ214MHhraVlk?=
 =?utf-8?B?ZXhCY05XNWJaT0EzMmY0dVNoMGUxaW5kYTNXaER1Zy84aG9RYnVaREpXcFdt?=
 =?utf-8?B?cUVIVXN1c3M1SGJLTldnZTBON2lOTkFOMTZ6alpyMW1kMlp0Y29mdWNWS1VU?=
 =?utf-8?B?U0hJMDk0U0tPTXpqN1RZZE9mZjFISTBhM3RRYW1sSG9mWXdYOGlqZlhmSmZ4?=
 =?utf-8?B?MUZPYUJXcy9ibzBpeDFsNjhzRkFiMU1UZTB4UWUzQk9rVTA3c1EzWVp1UlZw?=
 =?utf-8?B?Y1hkd0lDY3ZFWUlpT0hyZlpha3ZCZG82SmJqbGVzd3Jza3VxTDExZTBkQWpW?=
 =?utf-8?B?RTA2L2FVVlBmbEdSdmNsbXdPWHo1TWoxb3FXd0hJWXNxUktKVDNzWnpKWTBC?=
 =?utf-8?B?MTk0SjZ6R3I3QytSWmNSTjBBWUc3bHJiQk1nOGwybURJamJjdWZmaVd5OHNV?=
 =?utf-8?B?UC9IWHNSQzVQQWIxdDFWL0FWUks0YktsS3YvQTRRL3NTY24wbjJUSEtGVHl5?=
 =?utf-8?B?UFRXd2I5V2U5WWloOHR5bnpkSXEra2ppNS9NTWw5c0dBbW1IVnJTdGJiM2Vj?=
 =?utf-8?B?amx3emlYZlpmTXhBN0E3MVBVMnRzR1JWRXJ4Q0d3TjVpZ3RyaG9LbW1TcHFZ?=
 =?utf-8?B?ekNSYm8zalhvYk9telZnVXVQS0IraUFTdGRiZGNaYXRpcEp0SHZmbjFMSUlm?=
 =?utf-8?B?M3N2eThmTHpSdldacHdTT3dBbmV3ckU0b2oyMFBEVTF6ODU4Q1F4NEU5dGtB?=
 =?utf-8?B?OXpTZ0hGWTBLV1d5VEl1cy90cThkUTV2SkxTc1E3cnR3OHc3L1N6RW94ZHFM?=
 =?utf-8?Q?HPVo2HL+C3Y/knXJKKWoIXgsE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 419a96fa-a30d-47ec-1937-08db311398f3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 11:40:44.4615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q0nZIKCjkBQC0HS/hZhWgXGf96ne+0PhxPxWNktswO1beGhBpdH0ULYjgePkTgXx0Nvoq3jdTzVzI0W2dzLaKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7477

On 30.03.2023 11:54, Roger Pau Monné wrote:
> On Thu, Mar 30, 2023 at 09:53:23AM +0200, Jan Beulich wrote:
>> On 29.03.2023 16:17, Roger Pau Monné wrote:
>>> Do we expect to be able to split other opcode handling into separate
>>> files?
>>
>> As per above, "expect" is perhaps too optimistic. I'd say "hope", in
>> particular for SIMD code (which I guess is now the main part of the
>> ISA as well as the sources, at least number-of-insns-wise). One
>> possible (likely intermediate) approach might be to move all SIMD code
>> from the huge switch() statement to its own file/function, invoked
>> from that huge switch()'s default: case. It may then still be a big
>> switch() statement in (e.g.) simd.c, but we'd then at least have two
>> of them, each about half the size of what we have right now. Plus it
>> may allow some (most?) of the X86EMUL_NO_SIMD #ifdef-ary to be dropped,
>> as the new file - like fpu.c - could then itself be built only
>> conditionally.
> 
> I don't like the handling of SIMD from a default case in the global
> switch much, as we then could end up chaining all kind of random
> handling in the default case.  It's IMO clearer if we can detect and
> forward insn to the SIMD code when we know it's a SIMD instruction.

Avoiding of which would require ...

>>> I wonder how tied together are the remaining cases, and whether we
>>> will be able to split more of them into separate units?
>>
>> That's the big open question indeed. As per above - with some effort
>> I expect all SIMD code could collectively be moved out; further
>> splitting would likely end up more involved.
>>
>>> Overall I don't think the disintegration makes the code harder, as the split
>>> cases seems to be fully isolated, I do however wonder whether further splits
>>> might not be so isolated?
>>
>> And again - indeed. This series, while already a lot of code churn, is
>> only collecting some of the very low hanging fruit. But at least I
>> hope that the pieces now separated out won't need a lot of touching
>> later on, except of course to add support for new insns.
> 
> OK, I'm a bit concerned that we end up growing duplicated switch
> cases, in the sense that we will have the following:
> 
> switch ( insn )
> {
> case 0x100:
> case 0x1f0:
> case 0x200:
> 	x86emul_foo();
> ...
> }
> 
> x86emul_foo()
> {
>     switch (insn )
>     {
>     case 0x100:
>         /* Handle. */
> 	break;
> 
>     case 0x1f0:
>         /* Handle. */
> 	break;
> 
>     case 0x200:
>         ...
>     }
> }
> 
> So that we would end up having to add the opcodes twice, once in the
> generic switch, and then again at place the insn are actually handled.

... doing exactly this, which looks like we a agree we'd like to avoid.
I'm also not really concerned of "chaining all kind of random handling
in the default case" - where things are terminated with an error code
doesn't really matter. As first step here I'm literally thinking of
splitting the huge switch() into two. The only thing that I can see may
get in the way is the resulting SIMD function requiring like 20
parameters.

> So far the introduced splits seems fine in that they deal with a
> contiguous range of opcodes.
> 
> For patches 1-7:
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks!

> Patch 8 I'm unsure, I guess it should be up to the user to decide
> whether to use -Os or some other optimization?
> 
> I expect introspection users likely care way more about the speed
> rather than the size of the generated x86 emulator code?

Perhaps. But do we want to introduce another Kconfig control just
for that? And wouldn't there likely be other performance concerns,
if performance really mattered in the introspection case?

Jan

