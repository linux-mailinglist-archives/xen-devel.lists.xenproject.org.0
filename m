Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC813A9BE0
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 15:23:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143218.264025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVV5-0001Q4-7i; Wed, 16 Jun 2021 13:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143218.264025; Wed, 16 Jun 2021 13:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVV5-0001NF-30; Wed, 16 Jun 2021 13:22:35 +0000
Received: by outflank-mailman (input) for mailman id 143218;
 Wed, 16 Jun 2021 13:22:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vOo1=LK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ltVV3-0001N9-Lo
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 13:22:33 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4df12387-e410-4910-bd0d-db673c6242ab;
 Wed, 16 Jun 2021 13:22:32 +0000 (UTC)
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
X-Inumbo-ID: 4df12387-e410-4910-bd0d-db673c6242ab
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623849752;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6Fo3+4g4wS1IddXThWliLT0nnG6znJt9+wfwAw+Cf94=;
  b=Pl8coqkck+57zN4ymgssyaPCeiZ4NBYmS8ls1BCarmNGrSMFULV1q5za
   qe4kJRmabMNn48XFcH6ZBMwxKKccq6U88gW7vVsT3/Mekz+r8KDRfcOxR
   4u2VFmMAgLznMzb+oQ+4D0MshMU1JfPYbEcosH68QGhtoqlFdTFgVKrTK
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: SWT2nxb+TGHzuw8JlO0gbLyqtF5DrsRqhjSnMFHyv1DEb/4GB866O2O5AiegrwOJ39YeiYeDE7
 pDmyM3AxPlcAKYTTTccigshraPpDA02sF4Cc0z9DggrxmqZWpDUegdUxp4Z6cEOIH9jlwnlk4o
 u1CUokmswqyq8GkQuKGbqWmv/bq6rVGljg6ZGTf/VGlt901tIky0+8abPffjNFV1kztXjOQS1p
 HD/3YIDcFRYv099fZDaDerhlbUQYucofnEaNLoOYGW2ooT3r+FHNS/q0p9zCNnWgPKLULcv99x
 jkQ=
X-SBRS: 5.1
X-MesageID: 46240753
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:MEciTK21SQ8p29rzM9reegqjBVByeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJE80hqQFnrX5Wo3SIDUO2VHYUb2KiLGN/9SOIVyHygcw79
 YGT0E6MqyLMbEYt7eI3ODbKadY/DDvysnB7o2/vhQdOD2CKZsQizuRYjzrYnGeLzM2Y6bReq
 DshPav6wDQAkj+Oa+Adwg4tqX41pL2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbdz9U278t/U
 XMjgS8v8yYwrCG4y6Z81WWw4VdmdPnxNcGLMuQivINIjGprgqzfoxuV5CLoThwiuCy71QBls
 XKvn4bTopOwkKUWlvwjQrm2gHm3jprwWTl00WkjXzqptG8bC4mCuJa7LgpMCfx2g4FhpVRwa
 hL12WWu958FhXbhhnw4NDOSlVDile0m3w/iuQe5kYvErf2UIUh6bD3wXklV6vpREnBmcYa+a
 hVfYHhDc9tABanhyuzhBg3/DTENU5DbCtvQSA5y4aoOnZt7ShEJ+Zx/r1Xop46zuNLd3Bz3Z
 WODk1ZrsA7ciYoV9MKOA4ge7r7NoWfe2OBDIqtSW6XXJ3vbEi91aIfpo9Fv92XRA==
X-IronPort-AV: E=Sophos;i="5.83,278,1616472000"; 
   d="scan'208";a="46240753"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MNrtK6gRuF+f7aGCQS+evzCeFANo8RXmopOhWYx8useNVWjCSHGQo9ybZvVhWYOSbX1nqTD2eYc002zG6ANf3MaW0NAEmFpla+HNzFLVmIMghdnZy+KwY2OPKcNDq63F/oCYFZIYnvpqgLcIw7KGkra8cmx4u648JYFXieALEXvy8Wh/L63HQhKbry9LS1cQYqTquM9sfrnrE42MrlLxRIsQkzqFVGbm3nSbr1XJFg23N5MthSJOgxTPI7AiHjaAZExjizhNo89SjtzNhR8mjFMmjn4axgoSAlwXLOYyN5BJ4eSZ4IxL6D+aSSn05azoDzRLlcqShSQJqeC9HeaSlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQeKuo84mnXecHW3LWCCXtrgaV/RyUvoutWimsrj0d4=;
 b=gvCWHiDkgF4MyzVXryeOFHQA41EPzByi0RsmSTzqqhCsKGpf7ppfhaQaE1hyCIm4NUzv827fiy9JaYFqNWbNBAIO+1QGDK+8GohY+rILGBszpFPSPL2bZ5f4JX86mShBOnmnRFFscvyJWKVBDWBPvxRXLnSj/cuBW1OFRApVExK5WX5baAktpHqaRDFEPcWpn85bnWAOEnz14bBUNnlXerFPZ0QG/w2y9On+mWAf5t7OGbGwXe1mOmWj8nWGllTiQx6GZi+E2HQXGO1pnS8jm8C83oG6xcqsfvPTEbKhSnPQMWQB9prLPhdBeYeKbl5+nuEDvcMI6bjz9X4/zd31aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQeKuo84mnXecHW3LWCCXtrgaV/RyUvoutWimsrj0d4=;
 b=opau1BXzHrs4cRyxHgBZz1LygmJ9Q3GGcMGJwby2eZGmuTU9bMh5BWoNFGpr1mdgiZAqx4Fyct+ekqd5JA8Nkgg0AJFRbODcUa2tf2/HyACb0JyYnh9PYv24Xt7JsFOCeWo0UXa6OEKqRi+vfZ0aDpSzF3sN92J3f4Z/Tl1POMk=
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Juergen Gross
	<jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210615161905.9831-1-andrew.cooper3@citrix.com>
 <5b0de61c-0276-cf06-4eeb-cda9ca990940@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 0/5] tools/tests: More cleanup for automation improvements
Message-ID: <5f786fa7-80eb-ea66-3fbc-2b556c1d3a73@citrix.com>
Date: Wed, 16 Jun 2021 14:22:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <5b0de61c-0276-cf06-4eeb-cda9ca990940@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0514.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46dc6cc5-90cc-4346-ccea-08d930c9c964
X-MS-TrafficTypeDiagnostic: BYAPR03MB4806:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB48067801DDB6E6E1B0D0D641BA0F9@BYAPR03MB4806.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lQZHHMb+PLZNadWal7tp0RK895h0BRF2ozHvL/1D9xLztTHUubQj9gY9NSzPnssuwwS0cW4hhUlDbrZJkMJjfZfKQZkPk3WkQ3Htc9v0b4njiAe+kXz3+MqVK7sWN4FVqFXnnBJXzZ4AnRe24PsKAOnKXy0o0vJrFkQ+OcOLnByDlGbBH4iHXH5nv+CMu5ymoDrzKKZHlcOEwyTsxAdCfO3TLj5xfC0ndDAwQcL6QxVo7qafzqo39zCQ5HGyhC3sivA2NyRrMxulPhLSDOKdQFtYNSrENH5JniXO9dvYPR/+hHC70xJUh8Zy7rWtZQL8YvSO1Wi/PdcZUEn7atOqq1LNjhN4fcR7yKrBnWwqzNMzNvmqyoXkerb4xKTTukmYIPwNSLlZ0kxT+ZPERFNlPoCaE4j65uakUfiKh7GHOP/1ftG05BO+fNL677N3tCq5lNVwlmGKByHjViwDADkMleaUrZwHfzjVjympt4C7UYMDvRDEGzIPeSZo2gzfHKdcNjpjJtBiZjJOogwibP3zcagUsgP/0yEYiz1S8TQzvclhf8qn8gGpB2FI7kbIZwvWQZ247JXsNd+zSE+RTpQ1aph/yqLvkHqN7jOO4/LSKdF0YMZDUEZ3HkK9dI5yzyZS/pVdyNB/lgeXK0CPjoeqxhJj+vsBoVkZlbWEIza+gIh/0T5g/t2mBr94OdjFyT0B
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(136003)(376002)(366004)(31696002)(86362001)(38100700002)(83380400001)(478600001)(36756003)(66946007)(316002)(16576012)(6666004)(186003)(31686004)(956004)(6486002)(6916009)(54906003)(66556008)(2906002)(16526019)(8676002)(66476007)(5660300002)(53546011)(26005)(8936002)(2616005)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RU1ZU2V0OFZJMFlpdHprcWRwVStJS0sxcENDY1JMRTRiU3N2dDFBanJsYmpZ?=
 =?utf-8?B?S202Wlo1dGFidVl6NlhOUCtSU1cwV2xpY1Vua0ViNXk4ZDY4L2FJclhlNEQw?=
 =?utf-8?B?WlRYQWtoTjN2Q2hjVy9FVllndUljWVdXZkV5R241RnU0QjlsUDlOck80VWI0?=
 =?utf-8?B?aUJSL0F2dkpqWTNNeGJjcU5GRmYwNEJBaGUxOFNUOFhkSjgrQ1lnc0J2NDV2?=
 =?utf-8?B?ZmZuamVtc09MU1hsK3kwdUJTajFIdjF4OUtwRCsxdGY2OVVKbm1PcFAzV2Vr?=
 =?utf-8?B?OGk3ZVFIblBUQTN2b0VWU3RIZmhSS2JkZ0pvVlFySXo1NjRjdmlpTHhZcGlK?=
 =?utf-8?B?ZGJNMXZCdGxHekZlWFZPMnBmWiszREQ2a1hFQjhld1lYUjZITWVjemlTcVhx?=
 =?utf-8?B?WDNpQkdDamFaallzejM5WjlNdUprZ1lnVFJINHBMNFlPK2ZVSTBzRS9SSjZ3?=
 =?utf-8?B?T1pLSHZ3MDB3N0ZjdFppQ2FMaGc2L1J2c01qd2J1ZkNSeEExWHc5U3hKVHpv?=
 =?utf-8?B?OVEySCt6SWNuNWt3SEtQTnJWb0o5WW5QL1R3MTVMbm13RExjTUoyYXl1VzBF?=
 =?utf-8?B?VUFJK3FLVFgrSGYwenZMbURjNm4wSzRNTjIwMEMvckIwNHZweHorZlFFWlhm?=
 =?utf-8?B?VUY0WS92cWN5K05yanRkNURaSUpLckhwMG1kUHFKeDF3RlNDdEZRbkU3R3pJ?=
 =?utf-8?B?dHJhem91czRZOC9FcEZhOWNQQkRsa0tTb2xha1U2SGlJQWdwSnBaVkVUblI0?=
 =?utf-8?B?TUpBaW5jamZWMEU0WjdIekM0QUJqbWZxRDhSL0NNMGsxMkRVbEQrN2Y1aGl2?=
 =?utf-8?B?V3RkVDFqdSsrTjZkaUt2YkpzbEh4MUFFWG1YMzBwSkhzSDNnbGcxY0hBcXo0?=
 =?utf-8?B?bnl0WjhUQkRHR2VPZkdkcUFSa05CYnVJR1daK2RWbzcyU3VxYVpwOHRGaTRx?=
 =?utf-8?B?QWoyVCtRemJSYWxZTXpDMmVna0VKUlpQUFhid0ZlbmhGZGszTkZYaC9BSTJG?=
 =?utf-8?B?VjczZlRXcU1tZlI5RXpadTlyMmxET3JyYTByMnNMMkkrU2RyOXZZbGRVWmFZ?=
 =?utf-8?B?dHR4RDk5ZDNwQytMUjVUMUVIUjNVNElOUFlwK1RPdjVqVFN2NkdUUmVpa0Zh?=
 =?utf-8?B?eS9xdGYweE42WjZhM0t3dEFMNTgwWHVUV092SUhtMjRPelJlVWRReWxwaW9Q?=
 =?utf-8?B?Umd6cllnU3g2QXFHZ2RmSGFCNTYzTXNYa2lycGtFT3ZFczJ4M1hiNCsrVkUr?=
 =?utf-8?B?WmpMZ3VqWUJpZEpReG5BeGhyUW5TTGpDcGhuQnZUbTdxMDV6VFVhQ0htQXJR?=
 =?utf-8?B?RDZ6YkQ2VlA2T0hHZGpqZUQ0SzhuK0x2K053UlZYKzN4NkZRUEY2YmtmUVYx?=
 =?utf-8?B?Q3haR04vNFg0UFdqWU5hM1B1TmJGTUVtZ3VVVzJ2U1lWalJDWW81Qk9PMm9k?=
 =?utf-8?B?Zkh5bURxZG1LakNscHRtMFZieXphbkJXNjd2VVJvWTNpKzVaODNKNHl1MGlO?=
 =?utf-8?B?a1poL0N3NWI2SE53MGo4citJc2JyTjVLLzJQY0tWVzBwaHRPUmFiOGozS05s?=
 =?utf-8?B?MUNqTUJTcS9SZnBoZi9Ibkpqa1pZMnVRYStZMUlUUFJYVnpyV2dqaXBZcXdy?=
 =?utf-8?B?ZEQ1S1RBb0lBS25OYjlTOU1RZzlsTkJtVFBrdTNqYlAwZEVNVGd1M3JYbUEx?=
 =?utf-8?B?bXJsWVdaVEVoYnZjNDNBSlRuZWN3b0xwUWo1RXJ2WDl4cUo4SldSd3JTUko3?=
 =?utf-8?Q?m6wCEvvRVmQMSyf2OQQWDaZqaaMmVW939vXFZ7q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46dc6cc5-90cc-4346-ccea-08d930c9c964
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 13:22:27.6910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: igradOD6KFIqiJ1Csk3OTJPXOEpamRaJtP1i5VSG1wyiY6ZVgQwNG1XW1rp5cSPHev6gjoRpmwMaCh/gS9yblaWA7eXsXMi0icVqBMFjzv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4806
X-OriginatorOrg: citrix.com

On 16/06/2021 07:38, Jan Beulich wrote:
> On 15.06.2021 18:19, Andrew Cooper wrote:
>> Jan/Roger: x86_emulator and vpci use $(HOSTCC) not $(CC).  While they ar=
e unit
>> tests, we still potentially want to run them in dom0 rather than the bui=
ld
>> environment - particularly for x86_emulator which is heavily CPUID based=
 and
>> wants to run on a wide set of hardware.  Any issues moving them off $(HO=
STCC)?
> Well, yes, I'm afraid: If anything, we may need to build two binaries,
> or build the one binary two different ways: The "run" (and "run32" for
> the emulator harness) target wants a binary built with HOSTCC. The
> install target (which prior to your series does nothing) indeed wants
> building with CC. So maybe we want something like
>
> install: HOSTCC:=3D$(CC)
>
> plus suitable detection of whether the opposite set of objects are
> presently in the build area, requiring a full rebuild? (Of course this
> will work only as long as HOSTCC isn't used for any build time helper
> binaries. See "x86emul: test AMX insns" for when this starts not to be
> the case anymore for the emulator harness. So we'd need yet another
> variable to express this detail.)

Having slept on the problem overnight, I'm going to argue that HOSTCC is
conceptually wrong to use here in the first place.

In an arm64 environment, cross-compiling x86_64, this will explode
everywhere, and the fault is with using HOSTCC rather than CC.

HOSTCC is specifically for compiling utilities executed as part of the
build.=C2=A0 Tests, and particularly arch-specific ones like x86_emulate, a=
re
not in this category.=C2=A0 Whether you happen to be able to run
test_x86_emulator in the build environment is a property of whether
you're cross-compiling.

For a non-cross-compiled builds, HOSTCC and CC are largely
interchangeable, and won't impact the ability to run the binary in the
build environment.

~Andrew


