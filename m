Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7BB36CA94
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 19:47:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118778.225027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbRo6-0000JS-Hf; Tue, 27 Apr 2021 17:47:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118778.225027; Tue, 27 Apr 2021 17:47:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbRo6-0000J3-ER; Tue, 27 Apr 2021 17:47:34 +0000
Received: by outflank-mailman (input) for mailman id 118778;
 Tue, 27 Apr 2021 17:47:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vdCB=JY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lbRo5-0000Iy-5B
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 17:47:33 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 33e55958-2512-4f6f-a31b-725bf9e543c8;
 Tue, 27 Apr 2021 17:47:31 +0000 (UTC)
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
X-Inumbo-ID: 33e55958-2512-4f6f-a31b-725bf9e543c8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619545651;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DjqTqISuw+hjifpu84C9J+eBP5RoPrrsnkQs06FNqNg=;
  b=gScOeJzEPSTqYNNJMDURgZA6bH0ZQ34YtAaMuoYVlBtxzpTBonawfIDw
   4EGsd2JrRShN6+OX4iSYqNW5sjLi5mUxnhOtk0vYcpdY4EviePb1/E93o
   xk2kRQh5rRn5n+SidtLwx4bgWDWj1GB5kTMY9WDetmBolgCACyQuyTCO/
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: eQWpx9yKZs+oAEUfvha+3vAKYGADwl22yZgUZ+aTZREtuvqWUJ4RXFdWY5oqIhQ/Ak3SxQOm20
 w+d9lfWznHhGnCBlw4H6zRocwu7aHSEX9vqZVP5nYTxhkodcPAww1lDls12Lh6Y9n/Wf/4qfSn
 rZz9qR26FIjjeAxKt4l36Xpc/OAGmoPobxyGgbB2I68CbCN5W1g06vdO2BiTaO8XHT76NvEhG6
 tq+Ey0ulNKQXEdvVbElUCqR3ZVET0gHpiL7tj8PsxdZJl2OJ1uIYfIriPLm5SRxnOedpZ2PGgn
 bJI=
X-SBRS: 5.1
X-MesageID: 42921496
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:XwddWawYPc54YaS2DdbMKrPxmeskLtp033Aq2lEZdDV8Sebdv9
 yynfgdyB//gCsQXnZlotybJKycWxrnhOdIyKErF/OHUBP9sGWlaLtj44zr3iH6F0TFh4hg/I
 9aWexFBNX0ZGIK6vrSyBWkEtom3dmM+L2pg+Cb9Ht2UQR2cchbnn1EIyycFVB7QxQDOIEwE4
 CS6tECiz2rf3kWacrTPAhyY8HoodrXmJX6JSMXHhJP0nj4sRqE4KP3eiLoqys2fChIxd4ZgB
 v4uijYwonmjP2h0B/b0AbonuRrsf/s0MFKCsDJquV9EESSti+SaI5sW6KPsVkOyYnFhzhK8K
 i10modFv9+4X/QYW255SHV9GDboU0TwkTv1EOChj/bqdH5LQhXN+N6mYlbfhHFgnBQyO1U7a
 Qj5RPqi7NnSTvdgSX6/NjUR1VDkUKwsWAji4co4kB3YM81TJd86aAZ409RFo4NdRiKoLwPIa
 1BCIX56OxNeV2XK0rFtnRiqebcPUgbL1OpRE4Nv8DQ6TxKhTRCyVcCzsB3pAZkyLsND71/w+
 zFN+BQj7FJVc8KfctGdZY8aPryM3fMRwnNLXL6GyWYKIg3f0nAoZL2/7k5jdvaGu1t8LIC3K
 nMVU9D8UYvZkPjBKS1tuw2zjn9BFa8WT/3woVw4YNmsqbwSLeDC1zLdGwT
X-IronPort-AV: E=Sophos;i="5.82,255,1613451600"; 
   d="scan'208";a="42921496"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JcfA5dalPDn+Di/pcsI5BkCQIVzqwoYaJxN0EO5HJlzatd6wMXuuG4n1XwquaO06aKX1okYbLhlw69jANz6VH8jnxQp8AYazHO1vNQIt2g6k/SYoxGemOiQ2VODtdVP7n6c6dVmurA3srDLNViujO8OR0ulIvFy+ROL27hCGkBX03q9e+b3NiiMFe0q0Qk5ffSoRia8niXXlUWjvv5ona0k2M1z7ORqkDmSeHFqjg/Rh7f2X1+Slcv0aEZl+2KVl0NQgfNON3UIYYeacERzaxwz4rQYR90S2plJtcGLmLus51B1sXrsLM7lgn6HBQOHiwEyrstb1FcUyOXMJTycuZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkG2IVGWhESiBgy59AutGh86vukv+s9IkC45h/sU0NU=;
 b=G0ncjQnUbNzEUOXEn4v3EhCFNKDkpjhGU7pxQL/qic64IEpH9flJxPE3YLrmXb/8hBITfheZyzNXuF5/b2W0u4zYEV+A9pMdqMenUHIPW/EFxhpUIFlnN0kqSlBEG/Jt6sfeKZJkor5uyjLwgqbSJzAxpJS0ULm2yfb+AfrMe1IjpSZTWotA+YrXDymyNQCB9EVvMCxy8wSZoCmbYjNG8PQ4sqs5RFnftoD3aZuvThanVeFu3u3AGNWzSxgkvQcXOsIBLijYP+y+bPt81YWEQmKfdzrQwI7wsCVDhgb811mq+YfK9KdYwIGI/Webhg9I11VZqNI3D9J6d0MVDLQO2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkG2IVGWhESiBgy59AutGh86vukv+s9IkC45h/sU0NU=;
 b=rR/4sqAp2hbqyUNcCjhsi4Az/wnaW6C5A7eGF1jnnuDEWwfSqzdMyK7xjhzqe5MuSpK3CcuS0Up5rW+FVqnVO5rSl5u6VhkmYoeF/+x8mCq4mUXhTxE+uYviyjN9MuEvK3dG7aiAhu7bVIcomGHF18BaAaFhc93+6XNs0aZc83M=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210426175421.30497-1-andrew.cooper3@citrix.com>
 <20210426175421.30497-3-andrew.cooper3@citrix.com>
 <a5d73b34-8200-ae0c-6c91-252ad2812f3d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] x86/svm: Enumeration for CET
Message-ID: <f50d2a46-ef8b-d867-4773-aa291586e26c@citrix.com>
Date: Tue, 27 Apr 2021 18:47:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <a5d73b34-8200-ae0c-6c91-252ad2812f3d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0351.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24aae070-1e35-4410-64a6-08d909a4864d
X-MS-TrafficTypeDiagnostic: BYAPR03MB4805:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB48052340D7C919B31E7CD293BA419@BYAPR03MB4805.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yaqpPGcYDo5ynzMHFlUQGgPWRZBBlENYDr5uHDkIQ4ELNHfIKA+/5wZ+GsxMk82nIlg8aIPV9petzIU2MP2g/vfhSwgV1BqSEzJKvKgv6uiKyRjwjoovxZ8XIklIih8YnRPm1RdW+eA+wBkuV3Q7f4G8cFZAr1GsJ5f/LSD5YFn468+y2Qs9DC++KoTKoNAw8FC1ZRLjHilgZUuHcipKNfwzqQJWLQX90GgJ+1NCa11YKV+qh7BvLbY7gxszgCCvHxzkHa2MPqM8p4FGdtWVZxBLyfUJi2AE2U3eJVuqJJTT8QV5VsUoPSx2vb/d6TEACR98XHJCapjT0HIoMy73wFF3/xVBMwcg2d5JsFlq4DmVrSe+7eF51ziLvfpauQM2oHALhP6KlT5Yssi3CWvtmUOqjqyJ9AnONdQ6++ntQifSCnCDZYDHLSLA/q39474TAKR/s6h02m3YUTg6EvaCgXD2aJP/EuWV3pQSP152ppZiKTpnCMJjwnXpQofurmlgmhBEQ0dtCtm43EOGeCtGjJrvvPeMcD/FiZaxhuvpj7Et7BrckWZaFTDXl/ZMTaEmV/PhPkpt9dfnYf16c+djFErUBbuwFDH4PXhJd+3PreaMSps9ALazqw92DpwJ7pbDWJIp5nqK/+puscAs0hpbFahRp1VfjnhIbM8qyrI5RC75fj0pHA01GrLokyruFPXu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(53546011)(4326008)(66476007)(54906003)(38100700002)(36756003)(186003)(6916009)(86362001)(2906002)(16526019)(316002)(26005)(16576012)(6666004)(2616005)(956004)(6486002)(31686004)(83380400001)(8936002)(5660300002)(66946007)(8676002)(478600001)(31696002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UnpoTFREeDEyRnZEeTcwc3dDYVlYdEdhMzY1aWZmOFkrbDNLVi9vQlRINVdS?=
 =?utf-8?B?UDhKdDJ6N3p5SlRCWmw3VnZNclBTVkJ2bW1GOWQxcDJQRjE3TTA3a1ZucnVn?=
 =?utf-8?B?THh2NlVCS0xISmVPQ0ZmSEtNOHpwall1VkFBaThmcENRQzNxOGd1WnUyNjdI?=
 =?utf-8?B?dnV2Zk0vb2xxTE9RQS9vYTRiMVo3amh1dHdxYW5DeEVrNjFMcGFIK1NOTTF0?=
 =?utf-8?B?Wnl2clBFWk1yTUhNSFpDMnZ6YkRwR0prSnBGdTJFWXJTZEwybHYzRU1zUVhC?=
 =?utf-8?B?cE92Szc5c3BFUXJDOFlCamh4RmxNYjdQOUVWSCthMVp3M3M5UURKcm11d3Ba?=
 =?utf-8?B?Si9NZkphT2ZBM0NkMFZDUlMwWG9abWE3eWkxZmwyZzlDcGhTVCthaU9nMGpL?=
 =?utf-8?B?NjZyYzJROE1GWkJwTUNtaG1pY3NZaUtsR3BGaWM2eHcvRHNOSFRrQ2x5Szdz?=
 =?utf-8?B?eG5PeU5GK1dFVm1WM2N0MkhDaVdBWWswY0ZFbk9JdTkvaEw3ZnRkdEE4S0Iy?=
 =?utf-8?B?azQ4VTRCeVJGWHFLaFd4RGRFVHpEWWtrd1hJVHVoMVBBNTB3TEk3b0VtdWhL?=
 =?utf-8?B?VjJXTVdpdDNCRmVYNmF4MDhaSE5VY2pEaGt3a3NrT3AwZ2NsREV4bFdsTjli?=
 =?utf-8?B?aVpkdXpvcjhUM2EvWEUxbndBQjErZVZZQXRSUVVBZUNCSEZZd3pKOWxvcnpD?=
 =?utf-8?B?T3F0UGZma2d3SkdSUzllWVZ5ak1DTUJXeGNnSkJYaTJEUGVzeEUvTERucW92?=
 =?utf-8?B?OWl6SGVqYnZiOHVhU0ZLOVFaUW14SEFhbi9BRWM0M0E2L0U4MWNZTEszWWF2?=
 =?utf-8?B?MUJjTHdpc0M3eWlYL3Bra1REYXBFaVV2NmtFbFVqV0x2RGxxN0Q2VVUyelhJ?=
 =?utf-8?B?bUp6a0FIcG5JekdJRUltWU1hQzZYZGYwdWZUOHc3My96SVJuSHNuTkRTQm11?=
 =?utf-8?B?czFHVE8yUHhITXUvQU5pS2R6OHNtZ0FqK2tkNWc5VnlIUENTZTFFTE9VR255?=
 =?utf-8?B?anhmTEpjTHBPK2Q3YmFLTE1zWW9hclFpKzJoSjlGeU0weTlIdGdiVlh3blBP?=
 =?utf-8?B?RnJxSkF6eGoxcW90UmdqVjVhYTZXRHVjRm1CNlVENVhBMWhKT0NYcXBva01l?=
 =?utf-8?B?WHQ0dGg4RnQ5UG5YY0ZPQWcrN1k1UkFyUllreSs1d0VWTmN3a1VrQWwvNkcx?=
 =?utf-8?B?TmFEKzRXUzh3S0VHeFY0d3hwcDdldHlVelBvVlErbVY0M1lUNmJZRXFoYjZU?=
 =?utf-8?B?YmsyMzlPejRTaktacDdVelVuSHJ1dmhxYVh1cCtaQSs2YUhYT292cXZTL0dr?=
 =?utf-8?B?NTJyNThTVTREU0FVODBMV1JUaGEvUWxPcEw3bUp3MEpnV0RlSVBjVFA0QTN3?=
 =?utf-8?B?TTZ2RzBCWm43T0VySURnMUFTSlVkQUNjbHJEQ2RadW5RVTdHL2FSeXlaZGFC?=
 =?utf-8?B?REtYY2NtT0xqK1ZTbVdyYTNENExDbUlhbG1IT29QVGpXc2tOU082VjRmSkRt?=
 =?utf-8?B?VzR3MGJnUUg5SVk4QkZRZE5OczhqZ0JrdWtUVW9RQ01GdHBiM3QvellqNE1P?=
 =?utf-8?B?N3BKYVpML1RYY3Q1TzdzTTUyWDMvaVhZOXZ5MEtteVg4YWp2ZFNIWnJQcTl5?=
 =?utf-8?B?YzAxcEg1OHVxeTJHenZPTWZTQ1NZbmtsbXpCWG1zRlVKSm04d28wT0N2Qjdt?=
 =?utf-8?B?TW56Y3daVVVMODM1Unl1bnZhSU4vZmppaURialA0SG1TSUowcXRrM1UvUVhE?=
 =?utf-8?Q?9XA4dcLJ0hZC6s7KB984O7H9YQ4s1e6aAgjV/We?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24aae070-1e35-4410-64a6-08d909a4864d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 17:47:28.3180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FmWvnEYM76KFAIwFYeOG+Gfaj3NMbdt8NT61nH8L5Z93NKhKqEBrPetB/MPbhU6JyAWTR2L35RFbQ4DGQsT6BDTWNzZ8JC8aFDZjJdOSKLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4805
X-OriginatorOrg: citrix.com

On 27/04/2021 16:53, Jan Beulich wrote:
> On 26.04.2021 19:54, Andrew Cooper wrote:
>> On CET-capable hardware, VMRUN/EXIT unconditionally swaps S_SET, SSP and
> Nit: S_CET?

Ah yes.

>
>> ISST (subject to cleanbits) without further settings.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> with one question:
>
>> @@ -497,7 +501,9 @@ struct vmcb_struct {
>>      u64 rip;
>>      u64 res14[11];
>>      u64 rsp;
>> -    u64 res15[3];
>> +    u64 _msr_s_cet;             /* offset 0x400 + 0x1E0 - cleanbit 12 *=
/
>> +    u64 _ssp;                   /* offset 0x400 + 0x1E8   | */
>> +    u64 _msr_isst;              /* offset 0x400 + 0x1F0   v */
>>      u64 rax;
>>      u64 star;
>>      u64 lstar;
> Any reason for the leading underscores, when none of the neighboring
> fields have such?

Yes - they're covered by a cleanbit, and for better or worse, this is
our style.

> Did you perhaps mean to add VMCB_ACCESSORS()
> instances for them?

TBH, I opencoded the cleanbit handling because I thoroughly hate that
entire infrastructure.

I ought to add lines, but I'm still very tempted to rip it all up and
implement something which is less obfuscating.

~Andrew


