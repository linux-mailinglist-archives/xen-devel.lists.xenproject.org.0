Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC883BF33F
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 03:05:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152779.282234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1ITn-0002rw-MO; Thu, 08 Jul 2021 01:05:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152779.282234; Thu, 08 Jul 2021 01:05:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1ITn-0002on-Iz; Thu, 08 Jul 2021 01:05:27 +0000
Received: by outflank-mailman (input) for mailman id 152779;
 Thu, 08 Jul 2021 01:05:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qibP=MA=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m1ITm-0002oh-7i
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 01:05:26 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01c7be21-88cb-46bf-939e-b409fab3d219;
 Thu, 08 Jul 2021 01:05:25 +0000 (UTC)
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
X-Inumbo-ID: 01c7be21-88cb-46bf-939e-b409fab3d219
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625706324;
  h=to:references:from:subject:message-id:date:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=52G188GBr2yKCXgxyIQxTmZUqN+ykPYZAiKTx9XxRA4=;
  b=C/qbsxTmSvxZ6NW7Og8MoWOsDHrgzYF+sdYhUXtecFDLu6N7aNnJlprY
   sG2SS1jDHqKU9BKpSBFkDKebDr6UClKOiOoTweTPcKDNCFZ65prtBO/kp
   2LOryAHHlXsezS0KIYl4lIY64eyYENboPR5asMgJwh5mAFiPQC12UbaDN
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: tTtVbmUNyLWZPuxui+Em3dIygfFKCyjOPpIhJ9PdJZh0cBNIS5zry2xVBsUpYuJDQiXWkQBSGN
 5wn+nArLYCXazeJrPXnFA6DAoJAxmX5EjJs3MX/JKkqb7jfBw1Hs60OZt5wwdIzCHmO3fLwroa
 mq8RZ6nUI0w4fTcLTHv+kyGUOQl7YfHJvkT2t/XmotiwAWJsYhe16T5hvbYT26wC+Z7PL8jfa9
 A/kPVULy2aWHVIIBp+5JtK0r4T64S1vwGeOog9LHN+lI0QvI0AgxjjfZidIhORgdq2ovg6Aez0
 MEM=
X-SBRS: 5.1
X-MesageID: 47854002
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:T+kO2aPj3P0+98BcTz/155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN9jYgBdpTnmAtj8fZq8z+8O3WB1B9mftWbdyRKVxe1ZnO/fKnjbalbDH41mpN
 ZdmspFebvN5DFB5K6QimnIcKdS/DDEytHMuQ639QYScegAUdAG0+4WMHf4LqQ7fng/OXJvf6
 Dsmfav6gDQM0g/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/jYsKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF7d2H2RIPqp
 3hsh0gN8N85zf6ZWeuuybg3AHmzXIH92Li4UXwuwqjneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBL7mjjn7dSgbWAlqqONmwtgrQcvtQ0cbWNHA4Uh6LD3vXklX6voJRiKqLzOS4
 JVfYXhDJ88SyLrU5jb1lMfieBEEE5DWStueXJyz/B95QIm6kyR/3FotvD3oU1wgK7Va6M0r9
 gsYZ4Y342ncKctHNVA7aE6MI2KNlA=
X-IronPort-AV: E=Sophos;i="5.84,222,1620705600"; 
   d="scan'208";a="47854002"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LaFKKs5q2+NomCr8ao/Qikg9Ve8dectt9qvEz0p6JY4IeH79JDr4k7LhIF2wIBVF84Y9yfwyopFAnhqFJKeoznfYCJu2laJa3aG2+dbh2JQPeOTiNLrq3cwO/iq3VtVRZka8xYMEAJxhA0l2K3KtVsHr5twQMWCtGd/AEBf4kd6PS0ReHzFZpw3Mdl+pZXjqXS3BjAqgkGaiw+AABjCeouJ+b38bZnBeAG8BoXHyb87YKZNpM5zFvyx6ZTHtrDV10vyGHwsmHEEYmorbRvZAksNiiNhQJlrbEaKv4YUWKQ1PzYlGL0FnwjFhB7ntYH3HVLFGNqRG0s1njie06Cb6ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wb7jLni2KNiU7hydmZyfj7hBZw60vdSL31Fq0oTE5d0=;
 b=gCez03pZkDr5fm5VGdDrLO0+6a4igsSX9UGOn7iiZqQBVUxgLY5mrk/+HgCNyY7CHRG0RVZASU3p78FIKLaBeXol0qLUyoE5KT5IH2SzzasS1FEtwZg7QDeREE7/wBA8CbxEsaboLxXxUobtNU4KKa2IyV0RvBzZ1l9pmZaRxBx2TiUkPCf78OkhePs6ycoH3WTWXxeUdh/XeO6L+okwX5FOpnV0qotlSaSWXxCiZSaT9VQho0vY1QzgEBgdT30UrhMNeOSc+mO0fSRhrMvA01vHXUFrTrcmc90TXwuXMeGasbDpri7zNao3k2r2y+0QIMLmlrwuYG4YkPCKRRAFDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wb7jLni2KNiU7hydmZyfj7hBZw60vdSL31Fq0oTE5d0=;
 b=Ay+YQ0HDKyY1kaC2TyXmYBii7M2rF/gerU90xXjZ3LMx6gPYdf8BHSc5+72Xxem9KRbqlVQZvI/K9x6TMAaiW3aiaWg5Dryy2Y2tveCQrbscrw9Ad1qNaFtG+sDCtTyzTKTuB6ybXRwlRTO8NIWjviKVr0QoJ0e+FMJjYROiQrE=
To: Elliott Mitchell <ehem+xen@m5p.com>, <xen-devel@lists.xenproject.org>
References: <YOZHkGrrl694NrfZ@mattapan.m5p.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Xen/ARM API issue (page size)
Message-ID: <8c7d9d21-d8be-d33f-6d37-dfb54f74c179@citrix.com>
Date: Thu, 8 Jul 2021 02:05:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YOZHkGrrl694NrfZ@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LNXP123CA0002.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bda5f100-0285-4529-53dc-08d941ac7551
X-MS-TrafficTypeDiagnostic: BYAPR03MB3669:
X-Microsoft-Antispam-PRVS: <BYAPR03MB36693DB763F6CB498272D943BA199@BYAPR03MB3669.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c7H5pYghE6Lmh7T85+JwOglwtfjqeeXNJFWCkwiQ83hL5tIRkh9fjctBo3lE1XyQB7QdWRYCJjyvgK3+TKHKz5O6lYCp9KH/Q43NQAJK+A5jNWO8K7jhKQikZmzq0HCvbOK8/tw6hm6o4xeSuiFWqJCavZ7QGPELWztRFlFY2S3hZgyhlLbQxuiwOs2cG9f0WF+lLPL9UepVewWCeTLZ7WeERNJhNSfzYSTxfZfgDlwt3UjJzvVxKa9jQZ777WszaLD3B1GiuQO62EALmHIFRq6W/AggU113B3nAzAA+dIrrRvNywpYrav7HyZdt1AoZfNGcQaqTVJbFQczh6ctjmDXS6ueWlB1zoKil1CabZluNSRmMvq+06AN+lLS7AzMIvmyb+xXO9403LtdaR5XdNm5FcwKDL6J7vOR5cLt/LGSIe9k1jsB3OICbyEU9LEwDlk+bTg3yVdojP0/OD1hxrxqb6mwhG+HfeKP4Z0lWnCLho9GdE6mk35xrZT3icJ2mR1w3vom8N1+ixx0T4NTDbNWetgDy6X5hQS1xBQpGl4X73btvxUmSNtmaDCnwETP2TZkCSgY6EUS3IZNFG7cXUiajN3kzvRxx/J/7GUrazEdje2vVPc0DykX42opG7RAPfvJHTqfPLXZpEozf4XRGgPO5BCJsT3UAjOLh410LC6XsI/OM5ftc0CL63dPTBxL1PPfDNaDiDTxn/13BQVKTB8D6IvWK+Ylh98RNkoYGSXg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(316002)(8936002)(6486002)(2906002)(31686004)(31696002)(83380400001)(6666004)(5660300002)(86362001)(2616005)(16576012)(66556008)(26005)(66946007)(53546011)(8676002)(956004)(36756003)(478600001)(38100700002)(186003)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXp1alNKd1hkSXI3Z0hKbUt0Y0RJUWw2eUhNVzViN3pBRjhTankwZ3h5UXov?=
 =?utf-8?B?cHhvUWwwTUNYdkFLcG1PV2FITVpHUEJ6YzA1RiswUlYza3RzWTN3eGNCYTlN?=
 =?utf-8?B?UTEwdnU3cFNROW5rQSszcGVlYStwUFVNY1I0SVVKRHBVaFhuK2IrSjROUHlz?=
 =?utf-8?B?VHBPbzJHZkJUVHZ1NkgxV0tFdTFmVGxtQ0lSekVpWFpwMHBGeFJiOUZuRFN1?=
 =?utf-8?B?bTFYOFN5Y1pKWHNoWUZXOXQra2hzTHRyRkZ6TGRmUExUbUducEMrNDl5V1ZL?=
 =?utf-8?B?eWx0dkhTdTlvMi9ReEhUVUdVd0h5SGhLY1ByYlIzc1d3MllkSFMzRTViYTlz?=
 =?utf-8?B?OVdNeGNnaE5KWWgyOUY3WkNJOXc5MGRIcm5GRDE1Vzhjd2tCeWtmSUx0bkJZ?=
 =?utf-8?B?VktadVhzZUtseUdKUU80ZWNIdXZqN2Nla05sQUdIY2tjbHhuK0pVTkplSm05?=
 =?utf-8?B?V3JseUVVTkJCYXZqdnNhRkwzbG1MenA2ZzkwanhFNXphTEVKWHF2K0FGbjB1?=
 =?utf-8?B?NlI2MlR1NEJPZU54ZFdlNnk0RWhISm5weW8wdG1pNGRINHp6WG9CaVVVdkR3?=
 =?utf-8?B?ZXZlQ3M5cmpJWThsVEsxdzVuTVloc1NPcHlsS1NNa2s4bDhxSDY5ajhuSG0y?=
 =?utf-8?B?QjRxbTlSalJDZmo1aEdFZ0UzYmxEVWduNTZScHFJT0g1NW5pbkQxWXRqSExQ?=
 =?utf-8?B?Z0wwK2VWVWkzSWRNN2ErdDFTOEV4WjhSRXRkTGwvMVN1bHVqVEdRUllMYmcz?=
 =?utf-8?B?WVJ1eExONElWQnNlVFBKNmdrcVVxbVZOeGtQMGlKeElrNmZvSU5VbXYxZDBH?=
 =?utf-8?B?RFBLYkJMUVJrd2JEdEhXMjZkZ1B4cTVOTWpaS2FpVjJRQzZxbFFKdDYxaC9G?=
 =?utf-8?B?WktpdUo1OHN1dUdVYWVrODhYWGpvTlVZQmdod3ozbXpRYmMvdkdvQ1FZUzdI?=
 =?utf-8?B?M0wxTzJRWkREemFKdVJJTi9XZ2E4Qms5NXMyU1I2NTFoSm54Z3lRVVlHaUhy?=
 =?utf-8?B?cHVJQ0E1aTlRWjRkZXNvUGFwaHA1L21sUEdIMVdlOFBtZlRtNlJLUWh1RHow?=
 =?utf-8?B?NTZCb2dQN3hhQkF1cGZKbStxMU45aWhoRTh1UmpxU09jZldUWVlZNE4yNXlq?=
 =?utf-8?B?bFdCR2N3cVoyWmZwRGZCZTBoZEhkMUkrK0ZDOHNoOWlRV3JxWTdnWU50aFpZ?=
 =?utf-8?B?UzFwdHJGY3NKOEc5RW4yNk1mdDNURjU4b05pR0dmSGtveEhyc2oxaXpsYVkv?=
 =?utf-8?B?a0RsaHJCR0srbzVGTWNSTExyeVEzL2dVWG4xdS9HZFFhT1ozN3lOVGJYelU5?=
 =?utf-8?B?bzVDTm81cGFxZ1VhLzNqS2JmWTFXc3IxNXNRV21qby9pOGducU9ueHdGZTZG?=
 =?utf-8?B?dHkzdnNnNjFOdjAvN2dRancxTnNVVW5xNHlCS1kxcnhrWWlPN0VQY2RpdXNi?=
 =?utf-8?B?Ky9sTXVmWGJ0OTNLR1V5NCsxM3pRby91aUFST0V0bnlDdEdKbTRleHVQYktM?=
 =?utf-8?B?aTJYNm5zMWFqTUlpY3NzUFRpRnJ3anhleTdPTmhyU2Q1aEtmSmdaUTVLTmF1?=
 =?utf-8?B?MTdGb2NYUVhvMkgvSXpHYXZwVExzcUR2czI3N1h0bEtzRDMraTR2cFgwS1Zk?=
 =?utf-8?B?V3haM0VDUkRmbDFEYjlHZ1Y0TTk5SjlMU3Bjc2VpMkhJUFVZRWp1U1dqZWVL?=
 =?utf-8?B?dUNoQXl6MHVCeG5GS2VWSkI3K2dYQWk1cG44OVc5OG1HWUQ3TjlzVnNKR1My?=
 =?utf-8?Q?F0osMVUsR3eUH2InSTTpmNtDr6h/eokKCqJYHg3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bda5f100-0285-4529-53dc-08d941ac7551
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 01:05:21.0968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dZ7cT96aeglbqqkPQNXrocmfzMjHVunptmzDNJtTAjp24BUGIDnJiYlRDss9uSQl9jFp9UemiU5Gaxkra8ebV9jnKZjixI6pfurvyJGuJHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3669
X-OriginatorOrg: citrix.com

On 08/07/2021 01:32, Elliott Mitchell wrote:
> Hopefully I'm not about to show the limits of my knowledge...
>
> Quite a few values passed to Xen via hypercalls include a page number.
> This makes sense as that maps to the hardware.  Problem is, I cannot help
> but notice aarch64 allows for 4KB, 16KB and 64KB pages.

Yes - page size is a know error through the ABI, seeing as Xen started
on x86 and 4k is the only size considered at the time.

32bit frame numbers were all the rage between the Pentum 2 (1997) and
the advent of 64bit systems (~2006), because they let you efficiently
reference up to 16T of physical memory, rather than being limited at 4G
if you used byte addresses instead.

It will be addressed in ABIv2 design (if I ever get enough time to write
everything down and make a start).

> I don't know how flexible aarch64 is.  I don't know whether an aarch64
> core can support multiple page sizes.  My tentative reading of
> information seemed to suggest a typical aarch64 core /could/ allow
> multiple page sizes.
>
> What happens if a system (and Xen) is setup to support 64KB pages, but a
> particular domain has been built strictly with 4KB page support?
>
> What if a particular domain wanted to use 64KB pages (4KB being too
> granular), but Xen was set to use 4KB pages?
>
> What if a system had two domains which were set for different page sizes,
> but the two needed to interact?

I'm afraid I'll have to defer to the arm folk to answer this, but my
understanding is that it should be possible to support guests compiled
with, and using, different page sizes (given a suitable ABI).

> Then you have things like VCPUOP_register_vcpu_info.  The structure is
> setup as mfn and offset.  With the /actual/ page size being used there,
> it is troublesome.  Several places might work better if pure 64-bit
> addresses were used, but with alignment requirements specified.

The way to fix size problems is to mandate that all addresses in the ABI
are full byte addresses, not frame numbers.=C2=A0 When alignment is require=
d,
and it frequently is, it is fine to use the lower bits for metadata.

Critically, what his means is that you don't need separate API/ABI's
based on page size.=C2=A0 e.g. "please balloon out this page" operates "on
the alignment the guest is using", rather than needing separate ops for
4k/2M/1G (to list the x86 page sizes only).

> Then there is a question of what happens when we get a core which has
> more than 64 physical address bits (seems a few years off, but for a long
> time 32 seemed high).

riscv128 is already being discussed, and current generation x86 servers
already have 52 address bits and are using them all (partly NVDIMMs
which take up huge swathes of address space, and the various encrypted
RAM technologies which steal upper address bits for key-ids).

The only sensible way to address this is to introduce new ops mirroring
existing ones, using larger integers.=C2=A0 e.g. get_e820 and get_e820_2
where the latter returns __uint128_t's instead of uint64_t's (or whatever).

Whenever you're talking about systems like this, Xen has to be compiled
for the widest data type, and we know the datatype used by guest kernels
(based on its control settings).=C2=A0 All the compatibility layer needs to
do is zero extend 64bit addresses to form 128bit ones.

~Andrew


