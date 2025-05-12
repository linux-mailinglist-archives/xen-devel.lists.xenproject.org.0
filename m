Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1954DAB447E
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 21:11:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982095.1368641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEYXY-0006st-GJ; Mon, 12 May 2025 19:10:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982095.1368641; Mon, 12 May 2025 19:10:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEYXY-0006qj-Db; Mon, 12 May 2025 19:10:16 +0000
Received: by outflank-mailman (input) for mailman id 982095;
 Mon, 12 May 2025 19:10:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QmOq=X4=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1uEYXW-0006qd-8L
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 19:10:14 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20604.outbound.protection.outlook.com
 [2a01:111:f403:2612::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b95f982f-2f64-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 21:10:10 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PA4PR03MB7327.eurprd03.prod.outlook.com
 (2603:10a6:102:108::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 19:10:08 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 19:10:08 +0000
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
X-Inumbo-ID: b95f982f-2f64-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o8xABaBBseaC1swSRRJ0PVBzPNxfSfXKilDAsICdzLiz54PnQdlG/Pl2FoLNZQqPiBC2EZElXG1y6pWReFdGLGrg+7V3ndR6CUAXu0Q4bi4B8YRGzmUHMh96Mj6JC5HTe3DowW9ikl4+NTv9mGdImHcws/XpeVzMnlghmjnRPa54jv+P405OzkhUHXqvDggLdY59Uj5uMFgw5FTGf88T3i3dWHkR3wBlJ4E+zEP1KLc4AXhM/MYqjyusMV3SYQQniFC8zIdbFS1ANmKHYJR97MRqfeMix5MBSH8jtypPjQKMgfEucjk3WJRXFFEo5jLGpGi53EED0jmCAD7W4+6UoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/YMPW7tJu+uzWqePJs8vFaT2grT4+YrvXbt7LpugvS0=;
 b=pCAwffDMVbyk6rO0gtsiyuGbfNSRqu2QLRVBxFXpO2pBUOhl5RMMztSrWkjGBSX/4uKjPxEybs/zXrqU/RcK1KupYO10Tagx9V/8h1lDnB7ZTTrZA/Vg4+6/03zS5umyGzl1HqWYg5iLWDUPETmUVmvF1aj3M5A4XAxtXjhlyBLPBz4xrYVa2FzSqGgGxT1AVw9Kw0pLfWcjabaM6hXGo0Ui5kLil9IFba1crxOa5otJ1GX/zFpkKkcLyctUcuadnMODT5H2mA+IskSLu3TrmLSAri6XyTHPcRQSQWP5t07Ja/4idPMGaxHSkO3fqcDY2CmTqIncPImUVIBlIYJMQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/YMPW7tJu+uzWqePJs8vFaT2grT4+YrvXbt7LpugvS0=;
 b=YShxrAQSCoKhlULwdZkvw/pL47ZWP3h6ejXZGagPeKX6FxjzfAYlla29e30mau//uhmDiLk82W2BvQUn0ZzrmaXPhb0GQFq9lPJ/k4ryW5Wit7ALAK/h6eP/OS7KB7h/UNxacwjOioejnqDQ7Yud49lSgpn93C2S/9MfXuNED/5dS3Y7J/sprUg77T1TzxfFRQGcIFtQ+6kp7j6v2TSv0cnvuPXIaEZqtZ1XujOiO+TppRqCUtUV3A6r6BVYrmJq9NE8BmB7hY7j8ts1OZEz4EoD6sfgEWs7ZoYqB4J7/rnpPwBiQRISpiBh4PWqp00prN7IQ6FGsJTiU/dcxLsVFQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>
Subject: Re: [RFC PATCH v3 2/2] ci: enable fuzzing for arm64
Thread-Topic: [RFC PATCH v3 2/2] ci: enable fuzzing for arm64
Thread-Index: AQHbvzX0DP4RwWsFtkCwrnnT9nV/Vg==
Date: Mon, 12 May 2025 19:10:07 +0000
Message-ID: <87plgdd4s1.fsf@epam.com>
References: <20250507095338.735228-1-volodymyr_babchuk@epam.com>
	<20250507095338.735228-3-volodymyr_babchuk@epam.com>
	<alpine.DEB.2.22.394.2505091445030.3879245@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2505091445030.3879245@ubuntu-linux-20-04-desktop>
	(Stefano Stabellini's message of "Fri, 9 May 2025 14:52:10 -0700	(PDT)")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PA4PR03MB7327:EE_
x-ms-office365-filtering-correlation-id: 3b749a04-a081-47bf-f09c-08dd91889c4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?2MOeF1SdvSuAU/DOFzvVuHrhpC2sYWd14wP+LCwkHhXe0Eh3He9WWe3v83?=
 =?iso-8859-1?Q?7q9ZliljVScM4t/FhWI0T17yXKAUmF3KtgkB1EeQ6OMkgBtPr10JW9g1yG?=
 =?iso-8859-1?Q?8fldLM3rJcQB5so1+fzqXX7hQh7aHec744sBBMDIDhFcUOL9nvbUioVboQ?=
 =?iso-8859-1?Q?zgNiJDTh60USDhVCDw7UeMmb79UyC9OVAcW+dBmkPSsX0iC1l1TzJB9nq7?=
 =?iso-8859-1?Q?lrZkdg0uyWmii7C6UNG2z8bGFNoYNiAj2KcTR4T6uObVPg8y06kFBwak4X?=
 =?iso-8859-1?Q?w9i3jlvz9jp4GLokXCmi89ADOIFFwHp/5uh1oCr6Tip10gTnQb/DZYygsE?=
 =?iso-8859-1?Q?8VHk+G2FN7iDiCfdyseqkTUmwrTFYxEog03LjXV1BSlOSHEhIXjQNnt6c7?=
 =?iso-8859-1?Q?B1dtbnvFwvDfGQtnCh7SaXFtiVFV0t40u9X4iCfY8ZUzw5fyPi/wwQ+7h2?=
 =?iso-8859-1?Q?3aEdUKFWwniOacvIjEgD1YH/2p9ckFRLo6voOLBQqzILcS+/jK6RZovppi?=
 =?iso-8859-1?Q?fcPwY7UdJCkHlnW823ehohUfmTbEKXyYmcUfNoTos3PFockO5sbpVLS0cX?=
 =?iso-8859-1?Q?SToiB6cFyfz2K444NeO/norHtbBECwQgADe+RB0dq1VccLKTxt/pGRD0rI?=
 =?iso-8859-1?Q?ysZGJASF7HtsP+xaLJxchsIaJcZDkYJG8VuZjgsA4eyAQUSjasKiLZIzH1?=
 =?iso-8859-1?Q?lXt3e2vinlEnzC+tY3rbkBQFyAknt8Cu1/5ltInoJlzykiYlq2SUCdlESd?=
 =?iso-8859-1?Q?PLzLmjm2+Ob37rKtV7MUsN8Spqk3R4m8EpOA6NI8U7IpIvLSoTq2UrULl2?=
 =?iso-8859-1?Q?NdKgCiZ1FNygC+835cODOYC8k3dcxrP6ttY82ZQzM87VXWYOQSwfI5Htb/?=
 =?iso-8859-1?Q?siLUaCKMivkze496mMWm3LMSjM7UG1h1UNga0HtIi6p7nAD0Ryy7C9+DqH?=
 =?iso-8859-1?Q?+0uhxUDnd9RANONaktMgD3hNB5ZREa56VkVull1634YCjHkmR2E6PWiJVg?=
 =?iso-8859-1?Q?e+2QjXRkCXoqDDD3LVklVLo0VWPzXkKE53Lf69JcheqYiMIrUv8I5dI0Gx?=
 =?iso-8859-1?Q?dqzbWA1euP6w8s7E2FbsWHk6LPy78d25EY3aqloB/HPUyKm3TE7Vpze0Ki?=
 =?iso-8859-1?Q?bzUIfbPnVcYm5c3v7YBSP1nVeqa+hv1iqs8TUU0hjdw8zlEEsd4zvsLceB?=
 =?iso-8859-1?Q?Nq7W3opoA7d0Vuql2B3q89eLwSWljMh6w3d4p3SGjBTEC3ZXTBMn2+MdpZ?=
 =?iso-8859-1?Q?oSqXNSkgcK9ehljPvxHp8NYdXkfh7kA3HSl+kswlJMJZSUCLsu7blfSFOr?=
 =?iso-8859-1?Q?9RkrqQ/j8AMAgdV7enSP9T5cq8GLf/ziHieQk/q/Iu2kSXvnmjsb6yC8bJ?=
 =?iso-8859-1?Q?dtMFaTQF7xp1UFrQUsuRw7l8kiTvRaLs4O5XjKQN1BqPvZ454+vsiLXPbp?=
 =?iso-8859-1?Q?Qj+dqkZYsqOw2wGi/XY/ftbhBfXL26JnbRXfojMy2+D9PzkpniR85hh2B+?=
 =?iso-8859-1?Q?JxWu7JUeImhSUmpXIljCWl/7Xag/Gqd4IqzFk/QDAkHQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?AneDgd8rWjFv1z+N2cIvL6jsjXchTRWatVQnUaJfbawkI4BzKn14Arqpqq?=
 =?iso-8859-1?Q?BFkkTjtFuDUgRVA7avfBDEy3kPrWEIzA4107I03Es2LYE/BWCMYyO2Z5/s?=
 =?iso-8859-1?Q?ZwoJQ4pBeNR/2acI7X/6b51+JUKnMO39mZ4l5FXvi5ToXMGVu2KB07MVFj?=
 =?iso-8859-1?Q?qX/lwDrm7BgJ2VkRWYc9NT+mVHjjvZmRUga4tlxlJ/4a7i7rDshlyl2wrq?=
 =?iso-8859-1?Q?Y1d5FnnwPXsET2x1ns+sZqTCsSS62IATpCYGPtcxS2fzlkKkIyYd70aNCD?=
 =?iso-8859-1?Q?wTgcbwtSxet6IaN75TZ3e/WDTrWPltsXD53Ldxu0NZUHvY9cPaonxWMJ/u?=
 =?iso-8859-1?Q?UqvKCFsYlkowPkf7SXnNeA+NC2g9UhEPd4k/2FT/JiAjhMsIzcjrV4Q6xj?=
 =?iso-8859-1?Q?pb46Yu50HbO1Xb/Pb1k7/hWijspYMkkU3Ry63QRTTsR4fLQHPBzk34MuxV?=
 =?iso-8859-1?Q?cSFNp7Jz0F87E13vV2p9C4IKBJyHekcU+6KRq20fDWqzHnZDxik3U32KCJ?=
 =?iso-8859-1?Q?J/R/V/+vT314fFGxTNcc6x8wdfWySGk3OPoxp1cwmoAfRkYMyxzmKTQKYd?=
 =?iso-8859-1?Q?0XvZPacsxc2RBv3mB1fFuQ1EqllONg4nnva6Gdp5pp2PwPF7yjA18rN1dr?=
 =?iso-8859-1?Q?j2Sdh60nVNjwvN5wObABMSrVFNpUYNEuVRCgabu/qGYbU+qtydxzwqee6q?=
 =?iso-8859-1?Q?4bjG9gHBSm2AFQgbNuQw+clCRZdw5TP509ZTe5LkRB4PUI54/JsbEiv9+7?=
 =?iso-8859-1?Q?ill8LOS0Rflw8iqiVo1/bAUXko+wYmP/JWkFGoxwTU1SYUuk1NKCB+OXXm?=
 =?iso-8859-1?Q?skxY3VwqNulc+sXbzVUzYGVgUwuH3qDcCkBk5hd9s6s9U2tcfaOtmF08BK?=
 =?iso-8859-1?Q?8VF3wLUjAX80+AnG25UVlHSnV39GvWDKfQZQ8u2HkIXPrY7GFlsHWv7RIG?=
 =?iso-8859-1?Q?9X4ebRlCqkQzowMQ5EtmSuetFBVOkPhSlaLjFmxJe/wmy15CW6727LouXU?=
 =?iso-8859-1?Q?+gGm3dnuOxHTNi8MDchNznPnCkZimYRiS1CoDTRKPLlopgK3txdsZWS6Nd?=
 =?iso-8859-1?Q?5N0RN2tvlDK6ygzzaJPAsOc43HS9t9QZkK+M2OEjjfvFiL/8F7ntPN6ueE?=
 =?iso-8859-1?Q?+bl2evBlmOt2w20hKSM2cPygqo1uJHp7gF71AiNwlS118aiXc6WhNMjZfD?=
 =?iso-8859-1?Q?LIiqX5BadLrk8ZONijDA/wdjs2grFLhSQSHiQWEqcUwsyiGmWuck+osrwY?=
 =?iso-8859-1?Q?QI1EyTDxNJGo8+YRXQn1vEgQT/nG0LUUV/pqGhJFh1H63qgYj7JecIHlCa?=
 =?iso-8859-1?Q?gH/0/HvRf5WfWfP9SocIL9J1VkFAea9FbF665dIAzEIF2EBbmyweP33X7k?=
 =?iso-8859-1?Q?6b4yrGzQgagFflIJ/2Dm+pXq4xQnesnsL7gH1fU1rCIk21AYsUPMdhVeID?=
 =?iso-8859-1?Q?1uIW0EnW7L0+7WhU6dKSu8pWmHf7fAgpBlwpILNLMKZo5aTWEaeZmknOdd?=
 =?iso-8859-1?Q?cLq0isIfpitVpuMdhZv7m+5I628F1Zi9k6hpFeQFX5Yy5xL6fJ4JT29Yyb?=
 =?iso-8859-1?Q?pLZ61dMleb91BtIRtdbkn8DOiLSxmH5BcVIxWHYuaXpJTcmbzTatP2PjoD?=
 =?iso-8859-1?Q?KcoytYCA+hxdr17nNmLjCARqdsrgSdt6Y9ISru3Dj+JPYEn35P/FD6Hw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b749a04-a081-47bf-f09c-08dd91889c4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2025 19:10:07.9854
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +IqsIN5O/osL3vlIkzUO6e61n1RsVF2gu+Jtlk6sPpee4zd6d6XTvRRoBcDF3/fuKBK7aqcS3R+ExJChQCrD9RQ4A2GroJy/mBq5VIs00ho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7327


Hi Stefano,


Stefano Stabellini <sstabellini@kernel.org> writes:

> On Wed, 7 May 2025, Volodymyr Babchuk wrote:

>>  alpine-3.18-gcc-debug-arm64:
>> +  extends: .gcc-arm64-build-debug
>> +  variables:
>> +    CONTAINER: alpine:3.18-arm64v8
>> +    EXTRA_XEN_CONFIG: |
>> +      CONFIG_UBSAN=3Dy
>> +      CONFIG_UBSAN_FATAL=3D
>
> The diff is strange and I might be wrong, but it looks like this should
> be CONFIG_UBSAN_FATAL=3Dy

Yes, looks like a mistake from my side.

>
>> +alpine-3.18-gcc-fuzzing-arm64:
>>    extends: .gcc-arm64-build-debug
>>    variables:
>>      CONTAINER: alpine:3.18-arm64v8
>>      EXTRA_XEN_CONFIG: |
>>        CONFIG_UBSAN=3Dy
>>        CONFIG_UBSAN_FATAL=3Dy
>> +      CONFIG_FUZZING=3Dy
>> +      CONFIG_FUZZER_LIBAFL_QEMU=3Dy
>> +      CONFIG_FUZZER_PASS_BLOCKING=3Dy
>> =20
>>  alpine-3.18-gcc-arm64-randconfig:
>>    extends: .gcc-arm64-build
>> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.=
yaml
>> index a603d4039a..bb8670026f 100644
>> --- a/automation/gitlab-ci/test.yaml
>> +++ b/automation/gitlab-ci/test.yaml
>> @@ -197,6 +197,30 @@
>>    tags:
>>      - qubes-hw11
>> =20
>> +.fuzzer-arm:
>> +  stage: test
>> +  image: xentroops/xen-fuzzer:v1
>> +  variables:
>> +    HARNESS: hypercall
>> +    FUZZING_TIME: 600
>> +  rules:
>> +  - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =3D~ $SELECTED_JOBS_ONLY
>> +  - if: $SELECTED_JOBS_ONLY
>> +    when: never
>> +  - when: on_success
>> +  script:
>> +    - cd /root/
>> +    - ./xen_fuzzer -t ${FUZZING_TIME} run ${CI_PROJECT_DIR}/binaries/xe=
n test-mmu64le-arm-${HARNESS}-fuzzer 2>&1 | tee ${CI_PROJECT_DIR}/fuzzer-${=
HARNESS}.log
>
> Can you run it from outside the directory, like this?
>
> /root/xen_fuzzer -t ...
>

Well, right now it is looking for some QEMU files, like firmware image,
relatively to ${CWD}. It is possible to provide the full QEMU
command line along with -L option and then we will be able to run
it from anywhere, but, IMO, it is easier to just change directory.


>> +  after_script:
>> +    - cd ${CI_PROJECT_DIR}
>> +    - mv /root/crashes .
>
> Also here you could probably do:
>
> mv /root/crashes ${CI_PROJECT_DIR}
>

Yes, agree.


--=20
WBR, Volodymyr=

