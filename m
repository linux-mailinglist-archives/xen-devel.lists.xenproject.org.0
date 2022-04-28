Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BDE513783
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 16:57:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316613.535581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk5Zm-0007E8-Pi; Thu, 28 Apr 2022 14:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316613.535581; Thu, 28 Apr 2022 14:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk5Zm-0007Bq-MW; Thu, 28 Apr 2022 14:57:02 +0000
Received: by outflank-mailman (input) for mailman id 316613;
 Thu, 28 Apr 2022 14:57:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8clo=VG=citrix.com=prvs=110d23c25=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nk5Zl-0007Bk-4c
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 14:57:01 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73203b94-c703-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 16:56:58 +0200 (CEST)
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 10:56:38 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL0PR03MB4210.namprd03.prod.outlook.com (2603:10b6:208:67::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Thu, 28 Apr
 2022 14:56:36 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.023; Thu, 28 Apr 2022
 14:56:36 +0000
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
X-Inumbo-ID: 73203b94-c703-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651157818;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=zQq7jPN4PSfooRiQESdK2XDAx4HJIEsTRtF8aJ8I+5I=;
  b=T+Dy9Q38D1FjQ6msUbk7fdJ0OJIjU6A45n35REadUPUl3O4fw/R3VSRM
   1p1op5S3VC23ALoxUbn1dEb7czXjI1s980q9NUKIIVLQvIFb9xKvSM3ay
   ffzR6abXZmS31XzOcyI10hNC70DMnUtbQ0+yvv6gVJWWfgjfhdOIvJocO
   U=;
X-IronPort-RemoteIP: 104.47.70.101
X-IronPort-MID: 72609497
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:9KPa7arZZAZmQjJDsmIWLys4wiFeBmICZBIvgKrLsJaIsI4StFCzt
 garIBnQM/uKMGTweNFxYI2/o0NQsJCGmtI2QVFppCg0EyxAp5uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrdRbrJA24DjWVvR4
 4Oq+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBP5H2mtsmayFjNxpBOLVcyZ/1Jn3vvpnGp6HGWyOEL/RGKmgTZNVd0MAoRGZE+
 LofNSwHaQ2Fi6Su2rWnR+Jwh8Mlas72IIcYvXImxjbcZRokacmbH+OWupkHhHFp3pkm8fX2P
 qL1bRJGahjabgIJEVAQEJ8kx8+jh2Xlci0eo1WQzUYyyzeJklQgjOmyWDbTUpuQZslavGO5m
 n/hwTnUKBQ9Efuh6RPQpxpAgceKx0sXQrk6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkgIsp6Uv8E2gTvHmQga15nWDu3Y0WcdUEuA8wBGAzOzT+QnxLnMfUjdLZdgitck3bT8nz
 FmEm5XuHzMHmKKRYWKQ8PGTtzzaBMQOBWoLZCtBRw1a5dDm+dk3lkiWFo8lF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9XzgbQHxZ6s9Lqkc2Q=
IronPort-HdrOrdr: A9a23:6Km52ak9XDQ3C3wRBwt6FrV354DpDfN1iWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WGIVY3SEDUOy1HYVr2KirGSjAEIeheOu9K1sJ
 0NT0EQMqyWMbEXt6fHCUyDYq4dKbq8ge6VbIXlvhFQpGhRAskOgTuRSDzra3GeLzM2Z6bRYa
 Dsgvav0ADQHEj/AP7aOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPcf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcdcsvy5zXIISdOUmRIXee
 r30lAd1gNImjXsl1SO0F7QMs/boW8TAjHZuAelaDDY0LHErXoBerZ8bMRiA1rkAgMbza9BOO
 gg5RPni7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4YkWUzxjIiLH47JlOy1GnnKp
 gdMOjMoPJNNV+KZXHQuWdihNSqQ3QoBx+DBkwPoNac3TRalG1wixJw/r1Uol4QsJYmD5VU7e
 XNNapl0LlIU88NdKp4QOMMW9G+BGDBSQ/FdGiSPVPkHqcaPG+lke+93JwloOWxPJAYxpo7n5
 rMFFteqG4pYkrrTdaD2ZVamyq9N1lVnQ6dvv22y6IJyoEUHoCbQBFrYGpe4PeIsrEYHtDRXe
 q1NdZfH+LjRFGebLp04w==
X-IronPort-AV: E=Sophos;i="5.91,295,1647316800"; 
   d="scan'208";a="72609497"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chx+E7hzjrQ7Gm6TjqWp+SMwgfp1qLTYwmpR5Qzewfq917qOaadX0A1EXJYPUd7UzARxvCfpriSCzvQY3nBSRW3lXJu+5RBGEgJMyXbebvlcV996NZl16cLGn/gVVnEKS0hAgHXxxI5Eizd9Vtb47t21o2yAmp4weSycvIYGMWDuZPn/2ZtzLuiIH1QffbM8TneTt1uFxDnKhhagim5fyYvrfKPts1tpsPANGzbJY3dogl8SuFYUDZ8DCyxnbtt3z3ygSz238CJFfq2I3+kVp8xdQAGpTqdgPx8Et8FWRnipXl+L7kPPaM+KCZu84L5B/IaBlBYYqQSVRLG1nIY+EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQq7jPN4PSfooRiQESdK2XDAx4HJIEsTRtF8aJ8I+5I=;
 b=Wi2f3+6u2jmdluUXzpI3m3iBefl/NkYnPkKsIYPBa8o1jOrAz/m4dI2YrLF5vv+acfq9FSXsGIcUrCDIadjYGQeBEt+s7+zJBZ/AHJCZ3rjeu3mmYJw/5wD1A9Hn1IPP5BC022iCG1E4vL3HZkj+wXf62wCkF15bktSt7d9LahuFNbo9WagSqk3HwndREZDLFKIa7L5fLvcugrOZSGz699UWN8/RjSKghZJw8L8SmdP/Cuw9/rzsM5kxI+uiRgV4AbDBz58v/Wa8NkvAlTFdz7KHo2zQXYGtduKqtRQM6i8b0bjzhlFwOayKzg2WvxCsRewmxAWwn8Fdcm4QGQd1Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQq7jPN4PSfooRiQESdK2XDAx4HJIEsTRtF8aJ8I+5I=;
 b=MYiHGf2lndQJlnqTKcZ8tHwLaDxYJJkrFtVNeOmHLboGchQE+Z5o0PLM6fQG81P77TAwaJK8lAWVVqJ2ifV0+HXe1/rQno0X/7MjSzMA0eZ5S9hijA5vDgWZwxbI35mCtEZuH12dpEs/p97R282+SJWr5fSNMeWreyQXBUFabWE=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] cirrus-ci: add myself as maintainer
Thread-Topic: [PATCH] cirrus-ci: add myself as maintainer
Thread-Index: AQHYWuYqOQefIDC6vUKpGhVltmZJKK0FaoKA
Date: Thu, 28 Apr 2022 14:56:36 +0000
Message-ID: <e140ff85-184a-e642-6850-3a14c9ff597f@citrix.com>
References: <20220428095549.91409-1-roger.pau@citrix.com>
In-Reply-To: <20220428095549.91409-1-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 819f18e9-6173-4d7e-cfb2-08da29274ad5
x-ms-traffictypediagnostic: BL0PR03MB4210:EE_
x-microsoft-antispam-prvs:
 <BL0PR03MB4210A0979B3D91D3F2850A4FBAFD9@BL0PR03MB4210.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 an/VvNGqkXf539i6AnkXVm4rqt/M0wz1M2poRfJojsq6KsIgeSeVhMLmIQu8cDAO5t/JW1UTfYyIMg6TA75v5Ddygg2cXc0UJZ2SRIIViYfnZyrF1Ijc4//1qzN/sLAIN+1mbp7VV+HV4Qb2xyOTMK5dguJR9Ubor2ix5FMzFnFKrqFobIaveWBeA1DpRBvFPTjFzLo/rC1yOCplBAezGRczOh74boRMag/HyiwHam3yaycrobWi5TpsPuGWhumUMc/pG7JHZB1oifuktWePxKLeS0SKuVkOLjaClH9D+CK43OUX7L+gBKxaHuFv7rRRGljA7gokAp9I57kc4lurcxeAsnQ3uIYhJKVD+rX/j6HM8OwDIfbzlrsfZAoRoeJ4g6sqUyvAKYYpLqc0u62iJBI07cP+1xZJfzn2gzRZ98izvP5lqxFnYe5uUX4Ie0HYl44fg6s7dKBamznI4JSi9U3OMEicO4neq6hVn7x+zJZQEbQxyPBtGcavxYO3tZ1EVD8hOyK1oCuhVeo1Bofh+0ZjEjakncTl7DPntNahPF7ygkVHOb98cOsrqWZxM+rh2Q3fBrOHNKKCY4ka7Toh1OJQABxc4poByW4Xh7AoA759qcZz+2fK4JtNOwbGQSAkdyVavXTTeC0GoEUpHoQc1lONt0LQnO/mPmHrRDwHlsssPtOvGmCMYENH38MQKrTQw1Kq8bOkrgBys8aaxCpsl6uAtH1SXCptCQPUs7i8BVQ8JI12XYWx3wZ8aZ8/QMrrI85muUKQLnUsB8oAsjjo0g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(36756003)(186003)(2616005)(110136005)(31686004)(86362001)(6512007)(2906002)(53546011)(6506007)(82960400001)(4744005)(508600001)(31696002)(8936002)(5660300002)(6486002)(83380400001)(26005)(38100700002)(122000001)(316002)(54906003)(71200400001)(8676002)(66446008)(66476007)(64756008)(66556008)(91956017)(66946007)(76116006)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b3NJZ2REdlNjdERqZlBtODhLYnhxNXdhNmZFQUk4ZWtlcGlyK1Ixam1oVWRq?=
 =?utf-8?B?cGhFQjNiMjNUaU5tV3o1YnBIZ0ZjNVlKa0lZVjZNTnljMnJ1QXljK3Zua3I0?=
 =?utf-8?B?SmhzOHBHNlIxWVNhSGt5dWJaeUJJSXpkdG0xbzRJcjgwVStRcFh2VFFENG1h?=
 =?utf-8?B?aTEwTEV5aGRHRHZEdFE4WXVFWU1ta3FZblBvQ3I2b3VYVi9mYzB0QVNYQzJD?=
 =?utf-8?B?My92V2IxNXJ3NGRWRVdPd0RHR2dQMmcxUG50TXNJS01Hb01wWjB1Ty9EcFov?=
 =?utf-8?B?VVpHM1ZNRVo2QnZvNE1EUmI3R2l5eDRmeWo4bG1KV1E2VDBnY2ZHZmlZWjZz?=
 =?utf-8?B?dWVSekhjZlVuZ0FzeFVWd3F2NnBCVWlVdEVuOWNIN2pQK1Q4ZWhpSjg5VjNG?=
 =?utf-8?B?ZkhrOENWb2lVandhQmZxZytCZTA4Z1FBdDdLWVgyR2wwSVFjL3VHR0VEWWZu?=
 =?utf-8?B?eFlBaGRYWmNnSVFvMXd4UDFZZ29hWm40Zzk2R0dyTnluaEZwUWlwTDEwN1hU?=
 =?utf-8?B?bTA1K0lYSDM3RVFlKzdqckhiZnZuaFg2Y2tJQzR0Wnpya2VHZE45L29OaExM?=
 =?utf-8?B?ZGpTVld1R3VZV0RxcklHK2hQM0pJTllEWS85di85ODFxVDlobDdyMUpzMGlD?=
 =?utf-8?B?S0JiTktPYThUaHlGMXlQU2FsWEFXRzdpR0hDcTA2L2FHbmR4YkdWd3p0MWVs?=
 =?utf-8?B?SE5lUzVoVlpFUG0xNGt3WkM4bzdEVFYxTjMxeEVTNTJJWlRDWXlGWFdWU3dO?=
 =?utf-8?B?aTVYM21tazh6Z3pMUjhkaEpqREZSbDd2WjFZTDJ1NlAvSlVIUHdzdVBGeTZF?=
 =?utf-8?B?ZmpiVCt1RkErNU9iV1VpZS9MRHBXYzJOdUpKazVPUUc4VlNlL1hFeDVBdFQy?=
 =?utf-8?B?RW5UQVpJU0xydDE3TmNJTThFR2pZWFFhTEVQaU4rWVVpQ1A5eEtJb3krTzNS?=
 =?utf-8?B?LzJmVkFBY2RldW1ab3ZMUHBydW9PK3c0T2NSSlF4OEMwQVJMbTd5Wmh3VU56?=
 =?utf-8?B?Mjd0M3FsN0lyYXROdldyWllMNE92WGtmRmxrOFp0VE5laEpuKzVhNHBGTmNE?=
 =?utf-8?B?NVlPOHZ1dVJ6UndXbW40ZUNoeE5adzFMYUhEZXcrK0s0UFRyMHoyZlVzaE9T?=
 =?utf-8?B?cUhkb281cXA1cjduQWxNSnBjeTQ3VVM2N2FjcC9VUG9IcVhzaGJSZDAwNUNi?=
 =?utf-8?B?R0JxZDA4V1ZDbkhVRkxjNDh0VTBhUTlHblpSUC9BMjFtMzFzTGZrUEY2M3RH?=
 =?utf-8?B?Zi90MTBKTWkyZ3RYTTlKakRHeUxXa0F4WHE1eStFWnAwT05wTDkwZDdnM2lP?=
 =?utf-8?B?RlFEYUl1TWUvTklSdk5mRmQvYXB4Z2RSK3Fsa1A4MGhwN1hGbzBVaFFkR1JQ?=
 =?utf-8?B?ZU1TVHljbjB6clR0MENaQ3h4Z0FiblliRVkxTnZ3RGRIYVFZRzc1VWJOd1d3?=
 =?utf-8?B?NkdFR3hSZCtLN3piNld1aEw0VVlNRWlZSUJxcmluT1R2RlZ4MXNpM2FuN0RE?=
 =?utf-8?B?K3FPNDNsSmlFR1dSanlvL2NjcEM3ODBmQWxidzlWQ1dMYlZuaXVXTGdyS1FO?=
 =?utf-8?B?OG9IblRrNUZFS2U1YXVPQ0dJM3NFbS9LZXlqc3lsUnlpbEt1SUdzcURtcE40?=
 =?utf-8?B?VlNaZFhrUjBDcWJhWHJjdWZERTNWajFBeEI0eWhtL0w2VEE1anUrVStuem1s?=
 =?utf-8?B?QXRlQ1czYzk3MXVMcU9JbXd3blJVd3gzWG13VUpTTzc2bDBnT054QVBsQURy?=
 =?utf-8?B?Qlk1V3NXZC9RNXVjdFcrTjNJMWkwUE8zVjdac0VFa3BsTFpPdUFwbTZDSDZi?=
 =?utf-8?B?TDVRWE9PV0dzaDJBaVZyMHJWWllWRk9pVFdMVU9vZTIxa0ovU3lveDhTMi8z?=
 =?utf-8?B?Zm1XYi8rRk9QQ2JTNjhnS3lGVW9OdDNjL2F2Q2hBTjZWR25UZVRNd2NTb2Vx?=
 =?utf-8?B?cWc3OUxyTmRHYXJaajVXM05MM001a1licnI3Q3pqUmpBQllMaHNYaGJYWXVN?=
 =?utf-8?B?dFZzYWRQNDl2em93cnVKYXJlNkVnMUQ1SUo3NXEyRm94TnJLeUpxV3dwS3Mz?=
 =?utf-8?B?KzYzcEZ5UEg3ekZMQWxoZU0rWDNhQ0ZML1FLYzVWRE9TYS9PQWg4TllQbTBa?=
 =?utf-8?B?T3E5Tlo4em1QWHhSOHNxcFFrUDVsVlljbzFRN1diWmhSZFgzcUdRRXorSy9W?=
 =?utf-8?B?bWI2clpIVXFxN0F6NExpczhiZmZ3RTBnZXdIMGlHeGh4dnpPWWFBYkJ6RFZX?=
 =?utf-8?B?L2crMC9hYkt6R2JJdDExQjJCVklFQ2JMajc0bkdzZmpIZHBlSW5PYkF1MW9H?=
 =?utf-8?B?N3N1aXVFaWQ2T3lLc2JLTGg0U1owQ0ROcURYbyt1azF4MW5KdHdBK3hEbC8v?=
 =?utf-8?Q?4fQS7go0G8godNC4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C466DC6DBE19E4E8A3929C637B0042B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 819f18e9-6173-4d7e-cfb2-08da29274ad5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2022 14:56:36.2023
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /3HuWMjI9Nol6Rfe/k2jgwicGWSrRJN20WzYtWdJECHi6FxN4NiC3cmLTmQG5l0xQwlKREg5MN0y5wg3NyLErvmr7KHXvpBT8njRZNf/eZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR03MB4210

T24gMjgvMDQvMjAyMiAxMDo1NSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBHaXZlbiB0aGUg
dGVzdGluZyBkb25lIGJ5IENpcnJ1cy1DSSBpcyBGcmVlQlNEIG9ubHkgaW50cm9kdWNlIGEgbmV3
DQo+IHNlY3Rpb24gaW4gdGhlIE1BSU5UQUlORVJTIGZpbGUgdG8gY292ZXIgaXQgYW5kIGFkZCBt
eXNlbGYgYXMgdGhlDQo+IG1haW50YWluZXIuDQo+DQo+IFJlcXVlc3RlZC1ieTogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gLS0tDQo+IEZXSVcsIEkgd291
bGRuJ3QgbWluZCBpdCBiZWluZyBwYXJ0IG9mIHRoZSAiQ29udGludW91cyBJbnRlZ3JhdGlvbg0K
PiAoQ0kpIiBzZWN0aW9uLCBidXQgSSB1bmRlcnN0YW5kIG1haW50YWluZXJzIHRoZXJlIGNvdWxk
IHByZWZlciBhDQo+IHNlcGFyYXRlIHNlY3Rpb24gc2luY2UgdGhpcyBpcyBBVE0gRnJlZUJTRCBv
bmx5IHRlc3RpbmcuDQoNCkkgZG9uJ3QgdGhpbmsgd2UgaGF2ZSBlbm91Z2ggcmV2aWV3IGJhbmR3
aWR0aCB0byBzZXBhcmF0ZSB0aGluZ3MgbGlrZQ0KdGhpcy7CoCBQbGVudHkgb2YgY2hhbmdlcyB0
byBDSSBhcmUgZGVwZW5kZW5jeSB0d2Vha3Mgd2hpY2ggY292ZXIgYWxsIENJDQpmaWxlcyBpbiBv
bmUgZ28sIHNvIHdvdWxkbid0IGJlIGRpcmVjdGx5IHJlbGV2YW50IHRvIGJlaW5nIEZyZWVCU0Qu
wqANCkFsc28gc29tZSBDSSBjaGFuZ2VzIG5lZWQgc3VwZXJwb3dlcnMgaW4gb3RoZXIgc3lzdGVt
cy4NCg0KSSdkIGp1c3QgYWRkIHlvdXJzZWxmIHRvIHRoZSBnZW5lcmFsIHNlY3Rpb24uwqAgSXQn
cyBub3QgYXMgaWYgeW91J3JlIGFuDQp1bmtub3duIHBlcnNvbiB0byB0aGUgcHJvamVjdC4uLsKg
IChhbmQgdGJoLCBJIHNob3VsZCBiZSBpbiB0aGVpciB0b28uKQ0KDQpUYW5nZW50aWFsbHksIHdl
IHNob3VsZCBwcnVuZSB0aGUgZmluYWwgYml0cyBvZiBUcmF2aXMsIGFuZCBhZGQgLmdpdGh1Yi8u
DQoNCn5BbmRyZXcNCg==

