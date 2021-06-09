Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D33D23A1A08
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 17:46:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139457.257849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lr0Oq-0003IX-Fx; Wed, 09 Jun 2021 15:45:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139457.257849; Wed, 09 Jun 2021 15:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lr0Oq-0003Gg-Ca; Wed, 09 Jun 2021 15:45:48 +0000
Received: by outflank-mailman (input) for mailman id 139457;
 Wed, 09 Jun 2021 15:45:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YCjx=LD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lr0Oo-0003Ga-Gq
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 15:45:46 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ed710c9e-f1f3-4bb4-9310-d0d98b163f65;
 Wed, 09 Jun 2021 15:45:44 +0000 (UTC)
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
X-Inumbo-ID: ed710c9e-f1f3-4bb4-9310-d0d98b163f65
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623253544;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DrCUoRFFTMoSoL1c19ehNZDOPYbBMFwcnbIx69FHGaM=;
  b=VvwFewidmOrpHegReps8qZyv5wEFNRjO+OZXiIENsvt2yy+F6uxzFiuN
   5HU/9doJjrKlVOTqQzLKmKGXn+Gn/tUWnLh8cgYZhAY0xGEWrknkx6HC+
   nTdnH0iV9ENrtakISuDb4ht4LojfQz11NVN7nTXMxPLby8W30QmqxrX0C
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: po6olZMhaetWr2bPU34eipGkfyr0+QjVc+p6mOzHWdh1EO85ICQI5ehw4Wlho5M4WvnTegj8wI
 f81DhVmqrMhByh29rTlhuKIf8TUsBONol5tjhlLCRIYAVzEoQtZdXyRzUOxAp9fMHhHUjNLYUt
 Bpazg/18ar5vhtW1Jsx36j0cMkllYZ8J1MTfXn7TBVWjeNgPg1YQQKbnC3QfjZcGTMruebL3m5
 AtphcXizao5jSZ/LUEuax7dvN7vV9DY3nfe3WMjO7S6JBahBk/au1d64GcZguYkJ7saYfoPqPF
 5Ms=
X-SBRS: 5.1
X-MesageID: 45738211
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:97T5U6PcmuDiIsBcTyX155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN4QMEtQ/uxoS5PwP080kqQFnrX5XI3SIDUO3VHIEGgM1/qY/9SNIVyGygcZ79
 YcT0EcMqyDMbEZt7eD3ODQKb9Jq7PrgcPY55ar854ud3ANV0gJ1XYLNu/xKDwSeOApP+tcKH
 PR3Ls8m9L2Ek5nHvhTS0N1EdTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJppmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O84isIDoBW0Tf8b2u1qRzi103LyzA18ULvzleenD/KvdH5bChSMbsFuatpNj/ir2YwttB116
 xGm0iDsYBMMB/GlCPho/DVShBRkFauq3ZKq59Qs5Vma/pYVFZtl/1YwKsMe61wRR4SqbpXU9
 WGNfusoMq/KjihHijkVgAF+q3YYpwxdi32D3Tq9PbliAS/MRhCvgMlLfck7wE9HaQGOtN5Dt
 T/Q9NVfY51P4YrhIJGdas8qJiMeyPwqSylChPYHb2xLtB3B5uKke+s3IkI
X-IronPort-AV: E=Sophos;i="5.83,261,1616472000"; 
   d="scan'208";a="45738211"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDAMUrzHekTsOcT0g3zDN752elSMy++1zJ8ZEsvuxGsqoRFq18DA4asWGkL5OLdwOtT71j/KJ0B+x7OxOXZHCyODCgQFCuRNFAjGmnkisLRELaKum4zeRIFsOIXlTqRgweBVJ8Vnf8+bS1/rOPhSnjPlCFFRpnFNZKg/D1hXu1unrbzvgxB8bQbTOnGJExrq5MqIeITUKpvPLoqtJcUIsSc0TdsSNupG0vCm3p9/KKaocMhZgDhtMOeAcoVx7la4Z92h1nkxT2cBwCQIPPgTRHIgv+8fZ6t/64Vb8k/kC/z6+vtQjk5pRL9sUKD7P99JBGs58GI3W/Q6RpKjZi5IyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZC5QUXtQ/wDtkBplkxLxp2aU0VAZlci8WoSyD5pw8uo=;
 b=c8m+RvOajKmQ3iBrZahA+zJIXE7+svok3D7kKqWhb3xRPlbft0fR0XvyxrHFa7862hOLAgyKliZJXcQeaz/SF2W+mOzxewI+CS1sEmk0qY4rEgde3mJeFrlwWHoaajAuN1KR4Fd04LXLAZX/x6Vr+v0IHQ0T4oIKmCvdMFtseKrgIllzsQk36gE1jVauj+AZx7/osSyQN8F16zd/jm7R3pkytf66InQGDh7dvdQgneIYFjTofi6mUh+kpHr4JSneZd2E0wgVYwglew5JzjXKIAXUEUjFB8wtcPIxk8EnYfQwMNvnGSudCcUAeVFea9c7v6KoiWqcK1ACfvwXm/gV3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZC5QUXtQ/wDtkBplkxLxp2aU0VAZlci8WoSyD5pw8uo=;
 b=A5Ht7RCNpFkfA4hOVd/dPTXofNZmfTxjs5QWH75ISuG24QCPMemG7DO73Xm90PHSsgVsT1S+oWuC72po228LXrsJXr3ISJLgoP7gGLi0W6YZFKcUF4qOiNvXpiOPMFigKyxKxze5+ZBuVeyXHbMWdGERjRbLyD22g8+i2vpFNSQ=
Subject: Re: [PATCH] x86: please Clang in arch_set_info_guest()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <c758de2b-c453-4dba-ddc0-0c9548172c6e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c032362e-51cb-00fe-dfe9-782bd4600163@citrix.com>
Date: Wed, 9 Jun 2021 16:45:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <c758de2b-c453-4dba-ddc0-0c9548172c6e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0294.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15bd4da3-a576-4ebf-de89-08d92b5da1e1
X-MS-TrafficTypeDiagnostic: BY5PR03MB5080:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB50801ED461E398F8C24A9794BA369@BY5PR03MB5080.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J4hQWQoDluaF//nPCwXpYAMXghZzPtcP9s665LhCEQKSHhPXoldp8NHaKAuE8ZSchg3YboH1WMEnBIYupHy5LAFbowSHS/MZ3g6rk2DzkJWm7kgnyNo6E3jGQAWGZj87l0AiVU5zEfWyda0wwsf3djxY5b6xLHqRTriLyHt/DdFJcxK8e1OYMLHIqwluC8pOq+nKit/kILVbNKL0LHf4E4SZ441kpNkkWR5EgD8finZSHXxlY3zigJ+7tvu1m2H23sh4n8jFs7LoZFHgwJo3Jzz7eymWRxJg0l/ebCRVrElCX/oWZUePMHbR4VHOzFf8U/BEIedrL01LuLycO5LrW3NovITmwKbRADrPQ3XAi98ExaHpxTeLK55yjWnsTBVApPXJq+hZ3+eFFVNcYrwdjp+ygPGBjqzvyj0a1M3cYcrJ0hlEP85mCPXw4L7ecIxNSsrzOJOmzeDI4NdoDi0XO2WXJvrQZzM03UJZpNzZiaCFyVwgim7NNh7DEiHcafkVLq/Uljo3lZCPoziMo1c1aVrrNwNzoovwf+sZ5Bj8ykiAXbeC/25rko7v0KIM16yGfznggzbsBbu5wBIBUSFb/6aVYG6jmsdFTxiikL3Me6msQKlcSLuP85oZzAIK22Ehk3MhTp85C+EBwak5lTzybQ7g22w2WT4IF6qAssSQZrGrAbJsFjrGTMm30H2R8NJAHMSyxN98BSqjIroAhdhr6kwZ/sFQNn75p24f6v40KnlVSxd1QFfG66/a/mmX1HE4VHd9fHROn2rmi3jhq4lntCZs6LKQMes829Y43YszxTxnUgYawIz/U6edR21tbCgR
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(186003)(16526019)(86362001)(53546011)(4326008)(966005)(54906003)(316002)(2616005)(16576012)(36756003)(8676002)(31696002)(31686004)(2906002)(8936002)(6486002)(6666004)(66556008)(66476007)(5660300002)(83380400001)(26005)(478600001)(107886003)(38100700002)(956004)(110136005)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkdpQ2JsT2laQ1luRWRxK2xNUDdBWEN4eXdOVmxEam84eVRIcVZPYTROMHFS?=
 =?utf-8?B?VE0xbVZhZlRja2RmZHBxK093Nnp4ZVBhWEQ5NUhtK0xENmM4YVBIRndYb2Mv?=
 =?utf-8?B?dUUrRzVNeE03SmtpK3g2QXlENEUySHVoQVFZSjhkdUcyYXNrempRNnczbU96?=
 =?utf-8?B?dE5tSVp4MkxZM2dkQTh5ZjNjdnV5eEFZdzNYK1dkTVN6MHViY1RZanhWbVVJ?=
 =?utf-8?B?bWxoNldOaG5lWmVFaGZ4T3BLRWtwdjFzVDlCakNzMDhabWJhRVlnbFdiOVZt?=
 =?utf-8?B?WUNXRnk0ZC83Tm5jK3VBR0ErcVRUeGZZWEgxV21pVXpadFBJc0gxYmlQaFJj?=
 =?utf-8?B?N1luQk1RWm5zYUNVbnFRU1FZRDl2dmpMWDk1RDZ2WVBnV0I3V2VlQ2ZqV1ZB?=
 =?utf-8?B?dStaK2NqRi9WRERIUXVpQ3dRQzhicmloNXBvMnlTNjN2NUQrQzM4SmJPTFRo?=
 =?utf-8?B?RkdhTWhxZ0dabHNBWUt2eDA2UyswSXVzOGJKTXg1eG5EekdEcDdqQlJEN0Vy?=
 =?utf-8?B?NEFsd2JYTlhKYjhlNGNyVEdoL2Z1MnFsSWk2N3ZvUUpyQlppV09QOGVNd2xs?=
 =?utf-8?B?TWhjS2dieUZHN1JPd2RZOTNTZzRPSHhoTE11YjQzZ0ltYmVNWDdLU0l1UFlH?=
 =?utf-8?B?SkNEOXFaQnUrYW8ra3dHT3p2Qm1vcGliL0tIcTBYeUM5UWVId2ZTN0t6ZWkz?=
 =?utf-8?B?VlowZlUvVmh0YXcrM1BmdUV1dUY0VDVBS2NpSDlUTFR4NHpISDY0clBFVTFu?=
 =?utf-8?B?TkJoR2NPZytYcHl3UXJJek9XbXJiZm5tM3dSWjVzRFBPSEZ3MEs0QUxNZjJi?=
 =?utf-8?B?ZUxocUhCOWVWbSs2azY2bXhXS2h4N21Oa01kc3ZpWGU2ZzFKQjhlZmg5MS9B?=
 =?utf-8?B?VjdNRVBaWGNOMjBUeTFLeStOY3k4bVF2bjNFVHl5VWVGdkVqbXdRTWJJczVU?=
 =?utf-8?B?UUpSaHIzeXBvTFN3bEwwdElhbkdhY2thbVBiYXJtdmZIcmpXdHpaZFR3SFpn?=
 =?utf-8?B?WHlCMmdpRFdmSlpBOWVmOEVURXFvNllsM1JHWms0WUhGOTJIVjdJTEFoVXBr?=
 =?utf-8?B?cTZBTVBwdnV5NnZOYXc4MW8xL1B6TVdnMmNRWTZVSzFnRnZhOGk0QkdkY2l0?=
 =?utf-8?B?Z2RWVUJTT1ZLZnNBbGRlS25ZQ3dLbjVkYy9UQVpVd3kxWkZWVC8rSGxZN2Rw?=
 =?utf-8?B?cmE5c0xjNSs3bk41VThQc1pGZGRGZVd4enIxU3dMV2c4NG0vMkowOEZhcXlX?=
 =?utf-8?B?YStyOUlvWEtRVEd2MWtrY1FnSU5GOUh6cS9Vai9QTnlXSCtES3UzazdlQjZY?=
 =?utf-8?B?R2hXWlJmelJibVZaSVNxV1U1VkRCcCtpVW1FUnpUUWE4NklJZnJoeGdZRGp1?=
 =?utf-8?B?SGIzWWhxeVhTZzlLZ1hGV2h0UkJuYVhuRGVFWUpUNFRZMlZCdU1KSFoxR3dC?=
 =?utf-8?B?OFBJOGQ1TW9sRjBDUVFXSVNwS2t6L0I1dXNKQS9kRGxFWjNwbHFmRU1rVklh?=
 =?utf-8?B?OVp4aEl0WVhmUGZpdVpMUEdpa0VNVjdTQ1RWekpIaXN0NFNCRWttTUg0SHpL?=
 =?utf-8?B?QTV1MXY3Vkh3Tk8xVkI1K1hvZG5wTFRHaXlKaks3Z3Q4M1RROHVNYjRaWVZJ?=
 =?utf-8?B?S3VpOWc0NDNPMXlEL001V2VRWmNSaFpYVVNLRnpNTGVSNm1VYVp5c2VWZmdk?=
 =?utf-8?B?QWJiQ2V5eUliR04yNUtZZjFEVkdZcWJRQ2t2UVdtRjlySGtxRkRleFBzTGRa?=
 =?utf-8?Q?O7VH17WTKmNKlN/wBxfCNh/wg6A74Ur45xmEVIy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15bd4da3-a576-4ebf-de89-08d92b5da1e1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 15:45:40.0581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YgJTK3q7Z5ws6tL7ZNI4VOg2FhSMVk//5SHaIQLvozbKtAKbtVpJycJxQnFIYSYAdoWtITXxLCYdB3KdtiNvIhHrfCludLJ6JWAw0V7jpP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5080
X-OriginatorOrg: citrix.com

On 09/06/2021 14:14, Jan Beulich wrote:
> Clang 10 reports
>
> domain.c:1328:10: error: variable 'cr3_mfn' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>     if ( !compat )
>          ^~~~~~~
> domain.c:1334:34: note: uninitialized use occurs here
>     cr3_page = get_page_from_mfn(cr3_mfn, d);
>                                  ^~~~~~~
> domain.c:1328:5: note: remove the 'if' if its condition is always true
>     if ( !compat )
>     ^~~~~~~~~~~~~~
> domain.c:1042:18: note: initialize the variable 'cr3_mfn' to silence this warning
>     mfn_t cr3_mfn;
>                  ^
>                   = 0
> domain.c:1189:14: error: variable 'fail' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>         if ( !compat )
>              ^~~~~~~
> domain.c:1211:9: note: uninitialized use occurs here
>         fail |= v->arch.pv.gdt_ents != c(gdt_ents);
>         ^~~~
> domain.c:1189:9: note: remove the 'if' if its condition is always true
>         if ( !compat )
>         ^~~~~~~~~~~~~~
> domain.c:1187:18: note: initialize the variable 'fail' to silence this warning
>         bool fail;
>                  ^
>                   = false
>
> despite this being a build with -O2 in effect, and despite "compat"
> being constant "false" when CONFIG_COMPAT (and hence CONFIG_PV32) is not
> defined, as it gets set at the top of the function from the result of
> is_pv_32bit_domain().
>
> Re-arrange the two "offending" if()s such that when COMPAT=n the
> respective variables will be seen as unconditionally initialized. The
> original aim was to have the !compat cases first, though.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I wonder how many more there are to come.

https://gitlab.com/xen-project/patchew/xen/-/pipelines/317744453

Everything seems ok now.  The failure is a known arm32 randconfig issue
which still hasn't been fixed, and is unrelated to this.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

