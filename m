Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D19963BED5A
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 19:47:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152655.281992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Bcp-00041c-2s; Wed, 07 Jul 2021 17:46:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152655.281992; Wed, 07 Jul 2021 17:46:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Bco-0003zn-Vw; Wed, 07 Jul 2021 17:46:18 +0000
Received: by outflank-mailman (input) for mailman id 152655;
 Wed, 07 Jul 2021 17:46:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tWQe=L7=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m1Bcn-0003zh-NM
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 17:46:18 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab8a4a58-7762-40b7-b302-6035527587d9;
 Wed, 07 Jul 2021 17:46:16 +0000 (UTC)
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
X-Inumbo-ID: ab8a4a58-7762-40b7-b302-6035527587d9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625679976;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OP+Ck+UXDaOhq1d5xbPjjNdrHhZjC/f0SIYL7btGPYk=;
  b=NWg09Lx3wL2+oS34WDAc0mH5yraP8RI3wHS8A71ibtCqCn4xcpuLJKOV
   2lJ5717tgWpDWG6ChPwkzyjdIemeY65dnKmPSKMD18eEmb7kVKU6HNu2i
   YIyJ/UVhbTN0b1etsrv5wggvumNj9eOpWcVihhfu3LZoU/bHDXORWjjQB
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: nYUjmyaNFKlAXpTtekfpxvhq0jLU7BoeEKKXBN9fZ77sz7qGgtZpDJKGI6IBh2ghTuz9QWrjW7
 THCoix/FUCgMacgvCUEWm6NKcIQQsA1S5ezzVk5jl0zvc9Ehm+sLpTc0/3SDfeS/4Er8ZXv1qR
 EY4H2RlVX4cYXDLQA4kmTqxisG8Jh//vL1GiPz3aDeMJ3kIfE9JSc3rhGWJ4Jtfsx7KVzrf26Y
 PqDMe4rBFkzNxCUjtHq+SIcLxZNmpjrbVyAzjNMVq4lDbVWLqlWIUQwx4A0ybL6AEMXRK8NcxN
 Dv4=
X-SBRS: 5.1
X-MesageID: 48143336
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:VdnjMqFaS0vSAbyKpLqEEseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2KhbGI/9SKIVydygcy78
 Zdm6gVMqyMMbB55/yKnDVRxbwbsaa6GKPDv5ah8590JzsaDJ2Jd21Ce32m+ksdfnghObMJUK
 Cyy+BgvDSadXEefq2AdwM4t7iqnayzqHr+CyR2fyIa1A==
X-IronPort-AV: E=Sophos;i="5.84,221,1620705600"; 
   d="scan'208";a="48143336"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dk5WV6UvBFL3+UZBx6qVI1TXDP0PzdNpHMsOZncsm1fIUq+y7ys0eFflSZHsrT4MAEBh78xjRPZmX8Yq5YETQO8quSFXuNQVlDgSjhH7nH3mJufFXgL6GMsffIE4f+1C1LpjnMqwX14iNdZk6x6zciCRmKwQxQ46Uetk1194dm2fdvs6PZqElKYSREQn0BYE/Ila77HAqv+1oV+ymcnseBBeZJ7ITjAIl9STDzq644Ol1J8UoPJPeG/w9ohGwRYALXtv0HwU6XIo2WWiKPaiGAQ3bcfE1klqHo7udmd9BuuTHB7qmjZWdS9fvXg1ZKe5Ysdcd6lXrnfXd9Vr+Qtv/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLATigvkRbYi4kss/x6fuGy5EMt+6wsPiF87a9iagnc=;
 b=kyIOv/8+xf6pW+IFNJ3qrJPcXES70yikatRKz1MiUH1oQqJosJn0A9xkmBnbWxezBdM55hiTXVsk/rXJr3IvrSWbooOcvrdpxf2NoATRxLfUa4fAbGl1YABgejvJuhqKTrmK7YRbKNZFv7K/CVoZ514lQx+gztf7GF663jiSoxd+q9VscG30QlKArmHFSnbPzvQ0mOduflKMqenZH1Sp7riB7bQ0ZDKkrri7DNrpbk6yQj0TMKGaOqeVLonjDOgdtRZfNmahljqAwinEOpuDg1K9MZoDi16hFgcChejpBxuG5ktcIL5UWV2ZT/Yn1moQgA7G9TGqm7Rbe0Dp679Pzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLATigvkRbYi4kss/x6fuGy5EMt+6wsPiF87a9iagnc=;
 b=V6+gI7V3sv7abZGc28sMlr0tbVw4RzL51nppv7sVwvPoqx0KZ78TFRveTJPxIApw+ZZeI+DlDIIk+HeHofqnphkC0robGbduL8By8GSz/Q+ZFkI+cGqBJYHEgQOpGcLpQ+XxEqZHr4hsfmzJeHSIx35KDgvIbUEMIHpKXEo7l4s=
Subject: Re: [XEN PATCH 2/2] automation: Check if ninja is available before
 building QEMU
To: Anthony PERARD <anthony.perard@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>
References: <20210707164001.894805-1-anthony.perard@citrix.com>
 <20210707164001.894805-3-anthony.perard@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e775d987-939c-e7dc-077c-fc61a2883f6e@citrix.com>
Date: Wed, 7 Jul 2021 18:46:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210707164001.894805-3-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0016.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::28) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab8c904a-64a3-45af-1adf-08d9416f1ada
X-MS-TrafficTypeDiagnostic: BYAPR03MB4614:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4614A920E7E2438EEA9327A1BA1A9@BYAPR03MB4614.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q3iKM7cbPjK3+sZfi3bxj0XxNiCT4FZda3VVSynqNqLwviLGeiYzUgRUXF1r/Lri8O5yvpguzWsWQjzB00xpM1K3yjsn8pGFRyaOvDtaHQs2kPQv+v4qqIoQu/NqQMmTZYY/WTK2STlJL2+VIZYdF9ZPHCDJMfs0vz/Zf3O9KqBsLn9Cp1i+bBqKUFp1sRJTYXyhbORUsKHUbJf8/sMJlf+QHdOjCnAl5sUWOg+3VCBFKFg9RcTShp4qaQrP10lJmD5FNg3p7xnYlHXqcPEdhkOYAvMxWW5Nhx9SLxI45smL+zn1+vMkCx8hMpyEqMbdZQXozNK7Koa+NUrbJmgvk7RTGmGYXozgzKHUW8R7LOPwAGvxpWH0fF5O8hSb1l91pdIuq0zo5tEdFQ8G7DPjvnSWgKbCK7OJ0Ievju/m3NhMTSg0lXkAR9C+nblsVJMSlP1pUhczja/eWvRjtxZDvzw3wXpotVgxInrdA17Yq42plQu+hPJ0Q1s3SNJCN0Ao8E8zz8qyqI+AWXmbMXP7B5aqgeHlGkkxA+SJgmStFKWCcKJPXOmM6v2nDfMX8F32WnULHGeo91tdJDd2xWI04UJkiXSjxw6biq7zaCqiAg3F7jsygwq4tD6hF0i457+/VtFHlkAs0MLxGGOqg/bt5WWoHLYffRvfIq2gbd8jdZXKPgrq2zKS0A9whEz3uMzgrHugpzTvnxCqFJvByhDoFx3jkLGos7xC8ePhYZq3iTY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39850400004)(366004)(396003)(478600001)(16576012)(4326008)(316002)(36756003)(956004)(8676002)(2616005)(2906002)(5660300002)(186003)(8936002)(66476007)(66556008)(31686004)(66946007)(53546011)(86362001)(6666004)(31696002)(83380400001)(6486002)(26005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlBNbWVwWVVLUGpHSWNyQmljNVc2TVVEdTBYamU5d2R4MnJaWlQ1T1NOVCtR?=
 =?utf-8?B?MXlBM0FVaTFFb0RKQUs4TTZjY1g3eUgyM25qaUZXa0ZxK0ZGRjh1L3lWUUdD?=
 =?utf-8?B?Q1M0Mzl6TGVEL1o5L2RsRHp1OHRaMGNEL1lHOFJ2amN5VS9ReVQ4Yi9vSGRE?=
 =?utf-8?B?NTZ4bmF5SUExRTljbmI3NWdlT1JXYjExRVVlOFpkNGpodXppdTQ0eStyZVpM?=
 =?utf-8?B?LzZVK3dQM0pMM2owN01lYkdhSDc0Q2NGaHJjK2ZVazZSdFJUR1RtbHRjYlpR?=
 =?utf-8?B?MjNXTWtjeWFJU1R4ZzNIeFZYZVVISlVDQVZCV3VzNGU5d3NjUzMzRFl4cExM?=
 =?utf-8?B?bFBTUEkxTHl3a2QwczhPOXVEQ1RQOVozWk1jL2lVQ3hCazlNYmhYU1hXTlNz?=
 =?utf-8?B?Q0dmWTBseTEzMWhSbmJFOFVrVkJVKzlOM1p4bHIyS0dYMHZYU0IxdWRldmdS?=
 =?utf-8?B?Y1QydkFqd2l5VGF0cVVkVUtkZzJmTGpOZWVqaTNwWWhkTUE0NlQxaTBkUHU0?=
 =?utf-8?B?dzB0WDBIVk96aGwzMWk3TGdsZklhd0NqbGVjdUdZUW4yTSthdlBFYUpaSjBM?=
 =?utf-8?B?Y0pjS0tlUUVLMEgzOTdjVFF6TnJrd0xQR2d1QVRaN2VmdmMvazlUcTBseXNI?=
 =?utf-8?B?NGd1STJLL0dYWnN6aUdLeGlGdVpQbDF4QjlpaXBQTU5XZzYzTUFlV2o1NFJ0?=
 =?utf-8?B?RUpqUnBYTVh5N0ovUFFVSlpXb0xTZmFSK2xEQU8za0FQcmNPRUpldzBLKzd6?=
 =?utf-8?B?V3Z3QllWVFpZTVB5Z3NEOHNGVmdMUUpiekp5RkVUVThLdHhMbXA5THZPMDZP?=
 =?utf-8?B?b0NpeWZVdDV0aEs0OEJ4NE9IbWk5RHBCWnZDckJsRW1GL2R4bVYvay85U1I4?=
 =?utf-8?B?elRQQU9UMk1lWWkzVC94RTZQM0FjK0IzUTEra3F2eHg2bWpVRExCSEZoaTc0?=
 =?utf-8?B?R0M0WHNDOE9QSzFzRWNYd2dEblRqeHJXZTJFOGtWRGs1REpneWhNUlp2RElD?=
 =?utf-8?B?M20ydzY4bVc1a0h1MkVXcHBGNDd4TDlsK05LRUhJSlhVUkE5em5DNE9hZVZY?=
 =?utf-8?B?VFZ5MGFrTjVuMCtFY1RXK05IYUIxNEV5azFURjQzVWk1dkhsREJsN0VXeTY1?=
 =?utf-8?B?ZVc4T1RCVlFMdWQ0UnR1ZXpudkV6Nm8ySmxDd3d3WCs3T2FOb0gzSEdIMkJq?=
 =?utf-8?B?OC9Dd0Q0My9MNkRsdXIxa2ZYOHU4Y1RLMG0vSXJBV3VXTTdCOEVIZldKbkhT?=
 =?utf-8?B?ZEZzek03S1lpM0s4Y1U5aGlwVXVZbUtLb3B5Y0FCalhlcG0zaVRFZVNIQXJn?=
 =?utf-8?B?cCs4S1YwY3N4WHVMbDRWQ3B5STlwNXgwUlBTdGlMSndWSzgyVytSQ25QMlhs?=
 =?utf-8?B?c2RrZE1xSXkzY2lTMk0yeHUvRFRaMmo0K0ZldWNCK1lrYjRlcERTWGNmQ01v?=
 =?utf-8?B?aWptclJQUjk0RXJFeEcrUEVwWGNlem9zbnkraDJPQ0lBQzR1QTR6anFKUEox?=
 =?utf-8?B?Z1VTQ1JITlZKWFBxd0F5N3JEOUNqYlBmUGlYK2gwNHRRZGlnaHZoUEMyNFRm?=
 =?utf-8?B?ZWpzMUhUR2RPMlQ4K2tNaFllK2tWRitnVTFFSVEydEVsNC9JS0hQN2FOc2JP?=
 =?utf-8?B?VDl6V25YUm4wZmJ5dGo4dHpmR0pDV0hPamgweXI4RUdFVTkvWk40cXpaYTNj?=
 =?utf-8?B?R2txbDl3aFhZM1BBUmlJRUVxblFaMURlV2dLUld4RjRqdkNOV3FJVk5FQlU5?=
 =?utf-8?Q?HefTp8kMtihLRiKfi2XA7JlYeYBl5jboURab1A7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab8c904a-64a3-45af-1adf-08d9416f1ada
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 17:46:10.0600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zsVPXGatneTzEyrhxM264e4tiwQYut6IxmxUCni9x6NC7z88uGQSz/oShTBIK62A8C7QacjOrhaSNDeN82KetJ3N9ix2o55tV0wenSxfhl4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4614
X-OriginatorOrg: citrix.com

On 07/07/2021 17:40, Anthony PERARD wrote:
> ninja is now required to build the latest version of QEMU, some
> container still don't have ninja and attempting to add it breaks the
> build for different reasons, so QEMU will be skip on those containers.
>
> Failures:
> - ubuntu/xenial:
>     fatal: ninja version (1.5.1) incompatible with build file ninja_required_version version (1.7.1).
> - debian/unstable-i386: (debian-unstable-32)
>     /build/tools/flask/policy/Makefile.common:115: *** target pattern contains no '%'.  Stop.
> - suse/opensuse-tumbleweed:
>     failed to build iPXE
> - debian/unstable:
>     update of the container fails with:
>         The following packages have unmet dependencies:
>          clang-8 : Depends: libstdc++-8-dev but it is not installable
>                    Depends: libgcc-8-dev but it is not installable
>                    Depends: libobjc-8-dev but it is not installable
>                    Recommends: llvm-8-dev but it is not going to be installed
>                    Recommends: libomp-8-dev but it is not going to be installed

Only the first failure seems to be related to ninja.

The second is a known bug which still needs addressing.  Our build
system's logic to cope with `checkpolicy` being absent doesn't work.

Tumbleweed is generally broken and fails at ./configure due to missing
compression libraries.  It is quite possible that the iPXE failure is
related.

The final one is probably because unstable has dropped clang-8.  The
container hasn't been rebuilt in a while because we still haven't got
auto-rebuild sorted.

~Andrew

