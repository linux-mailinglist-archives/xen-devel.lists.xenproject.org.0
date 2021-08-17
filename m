Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B988C3EEB01
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 12:31:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167723.306186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFwNF-0006NR-DW; Tue, 17 Aug 2021 10:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167723.306186; Tue, 17 Aug 2021 10:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFwNF-0006LZ-8g; Tue, 17 Aug 2021 10:31:13 +0000
Received: by outflank-mailman (input) for mailman id 167723;
 Tue, 17 Aug 2021 10:31:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSHW=NI=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mFwND-0006LO-66
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 10:31:11 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3be9fa66-ff46-11eb-a49c-12813bfff9fa;
 Tue, 17 Aug 2021 10:31:09 +0000 (UTC)
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
X-Inumbo-ID: 3be9fa66-ff46-11eb-a49c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629196269;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EH6JEad78mPas8t098GfOAoDqcT20ZM76FjUEhmCGaM=;
  b=P632sJK+j/uYHVdPKL2IK4+tNehFjTS+wn+pKFwngoauBUP8ea/hcXBw
   OGbNr3b/qhYZznt3NnuHDrlj7GXAjd3Nf+/TZMKpp46MeLjjjiRSaQ4EM
   HoY5OYNn9Ek1hTGrnNhZv99VU62Ugr8ULmVXqmeu6ATR0NrDSCgoZXiVs
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: y4Wc/yA+s+qKDbxyNmHXHhvul/tAEdUziDdNEuHmfVQ01LxeLxyDMjeJmYsGzoDjoRFz+1rhel
 iacecm3YnSscfXa6qMiQPTyL/4T+sKSTLTzINAgwLy8e88xoVmKD1XxE6KrBgCzU4HYrjVep1r
 9YVKEIUoUCYhFB0AodCuBRil4+hPzkSrhI4JifKEoX/ijlzVFyXUDSHchkrCXSZZPn3madV6L1
 HUUH+PCbsy/5W+Ic0uAWbSM0LNpEeURnBWxZ8PD1g/6/g2NFhlULs4ju3qCA0+kZ1YfSMSUBem
 hBSptAz9NG1cNaiQpPhr9f+G
X-SBRS: 5.1
X-MesageID: 51010205
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ERPZlqBLvD5NRTzlHejssceALOsnbusQ8zAXPhhKOGVom7+j5r
 iTdZUgpGPJYVMqMk3I9urwXZVoLUmzyXcx2/h2AV7AZniYhILLFvAH0WKK+VSJcECTmdK1l5
 0QFJSWY+eRMbEOt7eZ3ODOKadC/DDoysGVbKzlvgxQpElRGttdxjY8LgOVVmBNaE14CYEiFJ
 yaj/A32QaISDAya8v+Kn4bU+3EvtGOu4nhZXc9dm0awTjLqTamrJv7GRSexBt2aUI7/Z4StU
 zBnEjD+qCuqbWFxgTH12nVhq4m6efJ+59mAcPJsMwcMSjqhhvtW4h7Qb2Fu1kO0ZGSwWdvtN
 zC5ysmP9xu51PdF1vF1SfF6k3F1Tlr1HP401+fhhLY0L7ErRwBerd8ub4=
X-IronPort-AV: E=Sophos;i="5.84,328,1620705600"; 
   d="scan'208";a="51010205"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VL2jNV6Um5SZwHK74oknahHIeDRQTflQ2gd3gQq5FHuEY5dEq3ypgOgKXguwd/43B0fpEtZ2akW5dXdd656NnmnU1MiwdeQiwtoavCsF+JUvBuBgPNxtvZSyzoV/TXk9ilHbZlcm8+8s5k2KT9+9ksMvTa4HMq+6L+2+O8yhHhGnoAcGFXVb5l7e8rr3m0VZeEvuO/0jY0cbeDmy88p1h8jIDCRiFLQfRpwQW2hxDKMha8I2RE2bpicEGG3F3W6PreIWBnh0Dt7zWSiEvF24bt3hfN4t0bSM7YpWHE+x1KauPttRib+h+TZ8o2vGEtmQak0rA8r6g3Ad7sFOVWO1zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2JEO6iOFuxODv7ul/SyrfjtIyD7oZ+Z+zvWXec/sw0=;
 b=g5LxNC9x+go9+v5nNA9m2W9nkoRr6rv+QRhYybDUXFCF9vR/8a0PECqHUA4WuiQs03NAEweK3lyI5fNbCPcfWX1hvbb6FFK1HAidxfHxfGqpdpj9T+2+cdpPh14IPcSW0wMGQI9VjpkBHB1ttf8ne+3LKR5whHtR8gmJ4mJMP0t0bady5ALtEeOGNtcRQlZRawPs6Y4N5Yj7PZ20aCeS6vjEjVcXFO7a/5RuE6R8F8IKPu8D5qzo1UCWvV5n8wuqkPOSGSM0qFfCiMfwRffDXTfxjE13O8YQLpxqU3+vug56suQKnn2ZlCJWPjv9VWp0yuHYwdER/qsJCS294zehDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2JEO6iOFuxODv7ul/SyrfjtIyD7oZ+Z+zvWXec/sw0=;
 b=dtLpG1K0ZlyznKT1K0e+wsqHEgMdr+rrow4tKtEfb65fpZm3MMpy475KOHKTRNLJ8krN8a74tl7QcuAYY6PdvNpHDRXBc3DUjLRPFvdpSulhi4NLOgZjo+S0KtKMX+XZyQWexIPxTX3AOjB5aPDn5kYuZbnE6bGvgn0QPs6h8H8=
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <cbe46564-74ab-af38-7e31-2f0a3f46ab41@suse.com>
 <d72d072f-d785-f90b-4e91-5ef7e8f17862@citrix.com>
 <14de6486-a1be-156e-f2e8-e82dd35d231c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/PV: assert page state in mark_pv_pt_pages_rdonly()
Message-ID: <876bd7e8-d472-0f81-63b8-b57169cd87a9@citrix.com>
Date: Tue, 17 Aug 2021 11:30:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <14de6486-a1be-156e-f2e8-e82dd35d231c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0057.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9749113-6837-4f31-8063-08d9616a1515
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5837:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB58378CC432C6CA4A8EA78A6BBAFE9@SJ0PR03MB5837.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GNWL/eL2TMsDWphQ3EFe68Dfr9EUl/gJEUE7Sf49Raqiz4WaVSmqYrfxr+OrbTH2Uae9KSsEr0yiIwwRdPX1bg/Pzi+0mQgy6B+B/JBE9fwDPFcwGN9vLZ//f0fUAJvyEYz1k+bciqRtNBbxAGgVz/JVmfT3vUBNfRz+T1g2Bt48KyUZFCPeyE80832tsbJajkebzRlEh+QfL6zvz9br9oeXVKfZF9FC1gdgqIyKRbBgmNAQjf4otPQV4c0KHepUE4ZxZGV0mRMnV8Y21eEyk7745rNDj1AA873xMCuoBk2KtYF6Ne9/nkVTrI6P1hnwc5wnZNZiNoINNtQhbDrBSvUYxMDQwOrlYwxW7T4FU7xvgPFy7FqP3aYuV+27elV31q2aQH2C4sgDby9sBHQFNzq6bDI0jo7UH/Bm5VVYz5EoVU4R5VCStmbV9RX235SwAqxG+YzFYx5M1qIsHJ4nZCfupDA650ZMK4Dp3MpKZncAzsy/pQxQ9UkR77t+aUFiTX7uyF+tVuwwSC0O9A4wOPKVTeZbn/i/2Hj76TYWBu1EOr5GKd2rL34eovCgKDkH89FgaaGMUi9B/Ba5sHUkTTZAYs31e0jWPDWqRg7aEMdqTL4zWaL8uWmRS4yhqi4AMTw3g74tzyZ9oGSxbljVJskGIWOOwWiqx+o2q7N/GuO977tj2OGHHprQEur/jnYoJaxdTULfoGg5O1fepAIG3ViNXsvl//sw9AkZ5QKrSbOdBHQmDB5lL0PuK3/8DT3U
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(8936002)(5660300002)(38100700002)(478600001)(316002)(36756003)(31686004)(16576012)(31696002)(54906003)(6916009)(2906002)(66946007)(86362001)(83380400001)(2616005)(8676002)(956004)(66476007)(26005)(66556008)(53546011)(4326008)(186003)(6486002)(6666004)(45980500001)(43740500002)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzlyTzJpSGVmOTlIR01JcjVIQmFxT3o0a0orTlJzZEo1RmFsT0lkeGNqY3lm?=
 =?utf-8?B?bGdMdzBOVDdQWE5PcTd4R2Vmdks3RkNjS0cyR3Q5UWZRRmwyU0FMMmtVTzFy?=
 =?utf-8?B?c3BzL1VXbVJhU0U3K29vT2VxM0lmR1BnME5CU3N0MVBSY3dNV0c3WnNvbVo3?=
 =?utf-8?B?clRaREJzR0ZWQlJwTUg0Uyt3UWRxME5ocTRpUDdxTEFEMDVtd0FUVlNwQk5v?=
 =?utf-8?B?UVVTY1lTTFI3Q0lqNnJyOFQzaE9zcWlwMFFxMFRMN0RCYkxmNTRnekNuWnp5?=
 =?utf-8?B?bmtuT3o1YUU5eEQ2NEprTUN2RkE5Zmd0SXFYRkxTWktSWWkxYXltTm9ZMEor?=
 =?utf-8?B?UWUybjBrQXNudzF0QXFJYllHY2VMaU5CT2V5Tlg1YnhRU2RoaGdMZ09PSUFO?=
 =?utf-8?B?cTlPOEppUGZSK01XQzNNRFR1MDdoTXBweFBoUUJsd09jM3lnYTRscHN6S3A1?=
 =?utf-8?B?SWZUU01pMzVhUDZKa3FTd040Uk51ZHJWd1R3TFJEdW1sSnhxU05CWE81RVpD?=
 =?utf-8?B?RlVaOXh0SFZRWHYwZ3R0aDlSOFJ2Q3NZdXJ4cmloMUZtT2l5dWh6emgvc21F?=
 =?utf-8?B?TnRnRnFiRzE3eWtDZ00zMFFZL0RZTmM4RHVROFp2WGxqcHE1OElUN3RDempz?=
 =?utf-8?B?RUgyV0s4N05OUzVwZ01ZbHFSYXkyNm5XUExGOVV1blp5ejZCY1pBUXBBTGRZ?=
 =?utf-8?B?aHJGK0tjMU1yVkF0N1Nxa2gvaThsNFh0Wlp1TEZ1cHhLZGoxUjE2V2Y0V2VW?=
 =?utf-8?B?WER1NFFJYmRTWTZGL1ltZWxHcXkwK2lpdU5TRkR4U1l6VDBBeXkyL0FtZkRK?=
 =?utf-8?B?ZUJQdjliTnRkZFVwZGdRaVFNV3RRY0tvc3VBRXlmNzNheDZKUll2c2lwbHU2?=
 =?utf-8?B?a3hwbDAvYVgySVdkTDZiUktON3hEaGVEb0k2QTE5WnA5ZXhrUGFIcmh0ZHBr?=
 =?utf-8?B?UDNCNG8rV3ZvNGJReEVnRG5uTmJXNkRYV3NCbkNwRVNTYUcvZUROMzNUSEZO?=
 =?utf-8?B?RzB5OG9tVmZoV0U2ZDd4TmFKVDg1WmdsM3gxSWhlWUNCQUJXek4vd2lnODAw?=
 =?utf-8?B?TmRId1duS3Ivc0tKVGZMTEdobkhlakxxZFFmRlBKdnFodjJMcllVWGN5ZGVi?=
 =?utf-8?B?Vlh4ZU5zblVGYm5kN3BkNEFjY3RNT1hCZEJ3QjVYT08ySUEyVnJ2QVdrSUN5?=
 =?utf-8?B?OTJTSGVvQjNMOWtYMXdpV1hnUlc2dFdhRDRwYmoxc2tScU9FQkJpckhTdFFU?=
 =?utf-8?B?b1ZZT2FwNklTekRBTFZqT0tEa0VocFVMMkUvUlBQeGJTSzI1UGFYVENTc0lq?=
 =?utf-8?B?ZFJlWTFqRE5ON1oyaHV5Q0xVdGJxd2FNdEkwd045U0JsVkZFK2J3S3RuZS9y?=
 =?utf-8?B?ZTQyL3JwcmRsSmNpQnVPNVVUdXlINFBGMjk5RDBXVVdKOW4xOG1ERDhHZkxn?=
 =?utf-8?B?RTJLNStRaFJ6eEwxUGlZR045RHdCVGFCUUErUldXS3BnQUlKNFJEN0c2TWdY?=
 =?utf-8?B?WTdlZEVDSzNjSGdtMUM2UlFEYzM0WjhyRlZtcm5RcUxvTWNjN2lPUjYzTUpS?=
 =?utf-8?B?c1hwajBjRExnbE4wVzdlQVNKbFVMdHI5aDVQaklqbmNYR1ZpWnhVWFhuMC9J?=
 =?utf-8?B?Q2l5OFpBYmhoQmpTeFhCRGhQRlAzcHJZVklYZ2Z0Z1RLQ3g0STV1cVBsc2dP?=
 =?utf-8?B?c2p6YklmN0czRDJwcGZ6VjFKeHk5NnlYQldlRWJIdUpyV3hHUkVrdXpZYUwx?=
 =?utf-8?Q?Rj6vqM2MOv62s96ElRyMlRIxX3QC8a8s9jINi2y?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9749113-6837-4f31-8063-08d9616a1515
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 10:30:49.9003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IKm4U7s0Gf9shUdKVFy6YhY8RZErpYKrjJwU5Xn0zRJs7bZeW/SEzm+Usem2vGigh5TElaJBtj9Q0cS03TWb8EyiZ+zO/xydl6/hDvq0hj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5837
X-OriginatorOrg: citrix.com

On 17/08/2021 09:54, Jan Beulich wrote:
> On 16.08.2021 21:25, Andrew Cooper wrote:
>> On 16/08/2021 16:29, Jan Beulich wrote:
>>> About every time I look at dom0_construct_pv()'s "calculation" of
>>> nr_pt_pages I question (myself) whether the result is precise or merely
>>> an upper bound. I think it is meant to be precise, but I think we would
>>> be better off having some checking in place. Hence add ASSERT()s to
>>> verify that
>>> - all pages have a valid L1...Ln (currently L4) page table type and
>>> - no other bits are set, in particular the type refcount is still zero.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> There are (at least) two factors supporting my uncertainty about the
>>> "calculation" being precise: The loop starting from 2 (which clearly is
>>> too small for a possible result)
>> 2 was the correct absolute minimum for 2-level guests.
> Which has been history for how many years?

Yeah, but I'd expect to phrase that as "a remnant of 32bit non-PAE guests".

> The minimum for the current implementation is 4 afaict,

I'm not sure the monitor table for PV32 is intended to count.

>  and ...
>
>> XTF kernels don't exceed the 2M boundary (at least, not currently), so
>> they can be mapped with only 3 or 4 pagetables, except:
>>
>> * 3-level guests are created with 4 L2's for no obvious reason.=C2=A0 Th=
is is
>> nothing to do with legacy PAE paging, nor with how a typical Linux/BSD
>> kernel works.=C2=A0 The requirement to make 3-level guests work (and eve=
n
>> then, only under 32bit Xen) is to create a PGT_pae_xen_l2 if not already
>> covered by the other mappings.=C2=A0 Any non-toy kernel discards these
>> pagetables in favour of its own idea of pagetables.
> ... could be 3 for 32-bit Dom0.

Right, and starting from (compat ? 6 : 4) is probably a good move, along
with an explanation of these totally magic numbers.


And now I've thought about this some more, I'm pretty certain we do
better than an "start at 2, inc 1 and retry" loop.=C2=A0 We can calculate t=
he
pagetables needed for the virtual layout statically, possibly even
including the default 6/4, and use that for a lower bound.=C2=A0 At most, w=
e
need to loop once per possibly-unpopulated pagetable level (so 1 for
32bit, 3 for 64bit) to cover the cases of extra pagetables tipping over
a page size boundary.

>
>> * v_end is rounded up to 4MB.
>>
>> Most XTF guests will operate entirely happily in a few hundred kb of
>> space, and the same will be true of other microservices.=C2=A0 The round=
ing
>> up of memory might be helpful for the traditional big VMs case, but it
>> isn't correct or useful for other usecases.
>>
>>> and an apparently wrong comment stating
>>> that not only v_end but also v_start would be superpage aligned
>> Which comment?=C2=A0 The only one I see about 4M has nothing to do with
>> superpages.
> The one immediately ahead of the related variable declarations:
>
>     /*
>      * This fully describes the memory layout of the initial domain. All
>      * *_start address are page-aligned, except v_start (and v_end) which=
 are
>      * superpage-aligned.
>      */
>
> I see nothing forcing v_start to be superpage-aligned, while I
> do suspect that the "calculation" of the number of page tables
> will be wrong when it isn't.

This is an XTF test booting as dom0

(d2) (XEN) *** Building a PV Dom0 ***
(d2) (XEN) ELF: phdr: paddr=3D0x100000 memsz=3D0x12000
(d2) (XEN) ELF: memory: 0x100000 -> 0x112000
(d2) (XEN) ELF: note: GUEST_OS =3D "XTF"
(d2) (XEN) ELF: note: GUEST_VERSION =3D "0"
(d2) (XEN) ELF: note: LOADER =3D "generic"
(d2) (XEN) ELF: note: HYPERCALL_PAGE =3D 0x106000
(d2) (XEN) ELF: note: XEN_VERSION =3D "xen-3.0"
(d2) (XEN) ELF: note: FEATURES =3D "!writable_page_tables|pae_pgdir_above_4=
gb"
(d2) (XEN) ELF: note: PAE_MODE =3D "yes"
(d2) (XEN) ELF: using notes from SHT_NOTE section
(d2) (XEN) ELF: VIRT_BASE unset, using 0
(d2) (XEN) ELF_PADDR_OFFSET unset, using 0
(d2) (XEN) ELF: addresses:
(d2) (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 virt_base=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =3D 0x0
(d2) (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 elf_paddr_offset =3D 0x0
(d2) (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 virt_offset=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D 0x0
(d2) (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 virt_kstart=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D 0x100000
(d2) (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 virt_kend=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =3D 0x112000
(d2) (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 virt_entry=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D 0x100000
(d2) (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 p2m_base=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =3D 0xffffffffffffffff
(d2) (XEN)=C2=A0 Xen=C2=A0 kernel: 64-bit, lsb, compat32
(d2) (XEN)=C2=A0 Dom0 kernel: 64-bit, PAE, lsb, paddr 0x100000 -> 0x112000
(d2) (XEN) PHYSICAL MEMORY ARRANGEMENT:
(d2) (XEN)=C2=A0 Dom0 alloc.:=C2=A0=C2=A0 000000003e800000->000000003ec0000=
0 (240731
pages to be allocated)
(d2) (XEN) VIRTUAL MEMORY ARRANGEMENT:
(d2) (XEN)=C2=A0 Loaded kernel: 0000000000100000->0000000000112000
(d2) (XEN)=C2=A0 Init. ramdisk: 0000000000112000->0000000000112000
(d2) (XEN)=C2=A0 Phys-Mach map: 0000000000112000->00000000002ea2d8
(d2) (XEN)=C2=A0 Start info:=C2=A0=C2=A0=C2=A0 00000000002eb000->0000000000=
2eb4b8
(d2) (XEN)=C2=A0 Xenstore ring: 0000000000000000->0000000000000000
(d2) (XEN)=C2=A0 Console ring:=C2=A0 0000000000000000->0000000000000000
(d2) (XEN)=C2=A0 Page tables:=C2=A0=C2=A0 00000000002ec000->00000000002f100=
0
(d2) (XEN)=C2=A0 Boot stack:=C2=A0=C2=A0=C2=A0 00000000002f1000->0000000000=
2f2000
(d2) (XEN)=C2=A0 TOTAL:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 000=
0000000000000->0000000000400000
(d2) (XEN)=C2=A0 ENTRY ADDRESS: 0000000000100000

It would appear that v_start comes directly and unmodified from the
VIRT_BASE ELF note.

Other observations:=C2=A0 The ramdisk start/end aren't zero despite one bei=
ng
absent, and the M2P and start info ends aren't aligned.

>>>  (in fact
>>> v_end is 4MiB aligned, which is the superpage size only on long
>>> abandoned [by us] non-PAE x86-32).
>> Tangentially, that code needs some serious work to use ROUNDUP/DOWN
>> macros for clarity.
> Agreed.
>
>>> --- a/xen/arch/x86/pv/dom0_build.c
>>> +++ b/xen/arch/x86/pv/dom0_build.c
>>> @@ -59,6 +59,10 @@ static __init void mark_pv_pt_pages_rdon
>>>          l1e_remove_flags(*pl1e, _PAGE_RW);
>>>          page =3D mfn_to_page(l1e_get_mfn(*pl1e));
>>> =20
>>> +        ASSERT(page->u.inuse.type_info & PGT_type_mask);
>>> +        ASSERT((page->u.inuse.type_info & PGT_type_mask) <=3D PGT_root=
_page_table);
>> This is an obfuscated
>>
>> ASSERT((page->u.inuse.type_info & PGT_type_mask) >=3D PGT_l1_page_table =
&&
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (page->u.inuse.type_info & PGT_type=
_mask) <=3D PGT_root_page_table);
> I can certainly switch to this yet longer piece of code,

Improved clarity is substantially more important than conciseness.

>  and ...
>
>> and
>>
>>> +        ASSERT(!(page->u.inuse.type_info & ~PGT_type_mask));
>> this has no context.
>>
>> At a bare minimum, you need a comment stating what properties we're
>> looking for, so anyone suffering an assertion failure has some clue as
>> to what may have gone wrong.
> ... I can certainly transform the respective parts of the
> description into a code comment.

Thanks.=C2=A0 It doesn't need to be much, but it does need to be something.

~Andrew


