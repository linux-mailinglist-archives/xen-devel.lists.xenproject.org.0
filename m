Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4E74EF21F
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 16:52:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297481.506787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naIdW-00039V-TC; Fri, 01 Apr 2022 14:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297481.506787; Fri, 01 Apr 2022 14:52:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naIdW-00036z-PP; Fri, 01 Apr 2022 14:52:26 +0000
Received: by outflank-mailman (input) for mailman id 297481;
 Fri, 01 Apr 2022 14:52:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FwaM=UL=citrix.com=prvs=08375ea47=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1naIdU-00036s-VJ
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 14:52:24 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55caf67d-b1cb-11ec-a405-831a346695d4;
 Fri, 01 Apr 2022 16:52:23 +0200 (CEST)
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
X-Inumbo-ID: 55caf67d-b1cb-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648824743;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=pezlonkQC37kwAxQaulXOLSG8IWcHk2dOo+beOFVOw8=;
  b=DyM4tRQvS7ECW3pjKcZnGqJ5iS60j7soOJcdY+MV3WIxBDhzBLKYUv2q
   sfp/kVHgC2FFFKC1YqeV1d4vFivff8gM0ouAaaiGvxaYXlJ/3j3E7Lg1h
   JzsG8FuUsi3kF975HpEiGPz3rwcpQex9cvmlMUWUeJrB0V2zzrxeg35NY
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68178260
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:seXO66jj2y2GFpyqqpyqI2JgX161WhAKZh0ujC45NGQN5FlHY01je
 htvXGGPbv7cYWOkKowkO4vn9hsBv5bUm4BkSQZk/3g3Q3gb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhX1vU4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YToyJ4nXiL84aTNBFzlmL4l8oobgGFHq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bklhmwSvUErANRpfbTr+RzdRZwC0xloZFGvO2i
 88xN2o2M0SaPUUn1lE/BLcdtbmqpyfGchIblXSuq6wX8Tnp5VkkuFTqGIWMIYHbLSlPpW6Dv
 X7P9Wn9BhAcNfScxCCD/3bqgfXA9QvkXKoCGbv+8eRl6HWR22gSBRs+RVa95/6jhSaWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8U44gyQzqvf4y6CG3MJCDVGbbQbWNQeHGJwk
 AXTxpWwWGIp4Ob9pW+hGqm8kCirHTMFdko4TzYAVRMXx+O5maYKp0eaJjp8K5KdgtrwEDD25
 jmFqikimrke5fI2O7WHEUPv2Gz1+MWQJuIhzkCOBz/+sFslDGKwT9bwgWU3+8qsO2pworOpm
 HEf0/aT4+kVZX1mvHzcGb5ddF1FChvsDdE9vbKNN8R5n9hO0yT6FWy13N2YDB02WirjUWW1C
 HI/QSsLuPdu0IKCNMebmb6ZBcUw1rTHHt/4TP3SZdcmSsEvKF/YoXs0PR/Bgj2FfK0QfUcXY
 8jznSGEVytyNEia5GDuG7d1PUEDmEjSOl8/tbiklk/6gNJylVaeSKsfMUvmUwzKxPjsnekhy
 P4Gb5Hi40wGCIXWO3CLmaZOfQFiBSVqXvje9p0IHtNv1yI7QQnN/deKmuh/E2Gk9owI/tr1E
 oaVAREAkgOl1SyacW1nqBlLMdvSYHq2llpiVQQENle0wXkzJ4Gp6aYUbZwserc7sudkyJZJo
 zMtIK1s3twnpuz7xgkg
IronPort-HdrOrdr: A9a23:gtCgKqBmKpGGrdblHemo55DYdb4zR+YMi2TDsHoBLiC9E/bo8/
 xG+c5x6faaslossR0b9uxoW5PhfZq/z/BICOAqVN/JMTUO01HIEKhSqafk3j38C2nf24dmpM
 JdmnFFeb7N5I5B/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.90,227,1643691600"; 
   d="scan'208";a="68178260"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVfn4Vr4+blFLRU/l8YUMLqx6nAPvKe9URBwPpoY7Wu0FnVo4mLMtTHSqQ5HcKWsNs+YH8OlWwMewwEhGa+4WgVFjPzyKYZWKx+lkcL4pngxYU5aChRVvq4jUBUVN2YPbYS3JoIMC6EwUTinY18OZdqg6h9msPAgPpzQGNkdXoS78RUEIl5pU009AaQNPjOXWMVjubgj3//FhERf+HVsMuLqjS1Plk4bB39qVflwoTzTtRMTy/QGJwpWrpsZ1N6rasmMkpVxa3SoIPnPLq+Pvuyj+vW4J/XqCNqyOWi4qSgx2aOaRe1VcsTWMC5BvBOPJhxpLHXZUMKZnqxZUa+BBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pezlonkQC37kwAxQaulXOLSG8IWcHk2dOo+beOFVOw8=;
 b=KgGIteFmTaDWCf+bDh1nD9YV4o1dTtRlZwXIfyMVIWTizzOZlc849E7mglRUy3xcsj7EjY98N9Pwx/mSpPdvuTj/rrQNnJuyLxzMikR/VP8A01KIf9lTEx0AzWP7aKDUSfQOHdqJoD1XVoYej7/YcGzrNUyFxjNS1DqqPmvmi0OPPpyNB85NLxlSb2D3SSXawPmcoVxIPD8RgPWJlzrbtO7Q/0ocPrg0UqTk5i5S3fxUSSfP7AXCUlQvIoSKKy+B2u/F1uItrA0wSmUJbjJVtN9ZpEj8+E1x7U8WD5BrGuWaXBkhriSJwu/1RVZtwgQdT65vGmIfFiirPabjCWFSdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pezlonkQC37kwAxQaulXOLSG8IWcHk2dOo+beOFVOw8=;
 b=BWWA3uCwy8JReKkR+qjn3dPJrIh9Jb4oi1zuMb17BCgkHpIljqVv7gsB5IdpfHi2E/XTXIA9c+29o4wChN5Xy+yjFMBnSE4fx2w3u03MyaP9TNpS9Giz6MBrJ8HJm1a/gZ6E+tOHGG0/yzKlRU9DgNHkhSIIZDrKZVAUUdGEwWM=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH 2/2] tools/firmware: do not add a .note.gnu.property
 section
Thread-Topic: [PATCH 2/2] tools/firmware: do not add a .note.gnu.property
 section
Thread-Index: AQHYRdYPmZpfvGUBfkGAVUMDs/atUazbJFgA
Date: Fri, 1 Apr 2022 14:51:46 +0000
Message-ID: <e8e6c813-bcb8-e017-aece-e1315ba305b2@citrix.com>
References: <20220401143720.23160-1-roger.pau@citrix.com>
 <20220401143720.23160-3-roger.pau@citrix.com>
In-Reply-To: <20220401143720.23160-3-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 24ad8ade-6e2d-4d53-6d5f-08da13ef2509
x-ms-traffictypediagnostic: DM6PR03MB4409:EE_
x-microsoft-antispam-prvs: <DM6PR03MB4409568234442FDE76295281BAE09@DM6PR03MB4409.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nRGc9YJoYWy5VAJ2K02rOeU7cFQ01PZCIY6qK7BD4HfBv8IqG8ssHQr8QbpGgO+h/+2/4JXFhzcngERjEcAhyoYZCZqLr/9ECuE8HpQzinjCWD6Rojt2UL+Q7wpB3RSutnz0g9ybrqmXhAp4dnaYrfzlE+ZR1Em8QHDuLy5QgcSTH+J1Cx4MPe9m2kKhvcXLidPywDwsIM0gcegCWHZNbdjxeKSq5GLcbdsVmSPqLYLdJwuFAVLmvA+qG3r3Swu7DZR8Va8neZYL5DtywCDCrpqdp7mPRtSwr/Ykqm5F5GdQsGTzBEUEemqF0tDZzJF8HN0ZGP75QRS+34MhQy59NgX98xlNDwTMI3/vMBorgwMeEyZ3WYhxJDdOBXo808H5qBNWZKLqbEY6W3BtL8hRlYzspQLOZSKniT73czSTh1mW7HpOg9kgyOCil5l53vVzYzCB9gBqBXJbvNaswE4ruh17WWwSCu/msWvddOhsO3n9XmsHaPOL8YndDRtyj85NFmL/C8aIgpRrJTgfIm9C8tcTzp/Rt8yDSKO/4nu8T6hF6PgrCVYLPT5nNsGrz3E4X9/jTw3tPPqi4kyzhMUhm12zpDNQB6L9mW88PEP9WuKY/t29i3ea4DoQYsUR8C43sRFlGR66XK0hA7VErchK/tl3foeaobM2qnxKhhK5Sxej2WWVOWkXOcuhaD5ne4g2x7usuJVc9SrtL5S+69Zhn9jl76oTudQ9mzOSqC+Zle2EFtTw4cOT/gCRRzylnEx7jwNFcD+dtyK24zdl8GcgDCHAQWrAIfEpmJTbbxkbjxg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(38100700002)(38070700005)(82960400001)(5660300002)(6486002)(110136005)(54906003)(71200400001)(508600001)(6506007)(76116006)(4744005)(66556008)(8676002)(66446008)(66476007)(316002)(8936002)(64756008)(4326008)(26005)(186003)(2616005)(107886003)(91956017)(66946007)(2906002)(86362001)(55236004)(53546011)(6512007)(31686004)(31696002)(36756003)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NHExTWNBaStuRFNHcmp2dTh1UmpjY3ZUNE9YbWdEUGd6ZUc5VG93dy9jdVVB?=
 =?utf-8?B?Wml0TmMva0xLWWYyK0QyeXczc2RLSVB1d05Femc0bkFoWkF6UFp4R2ZKZnhN?=
 =?utf-8?B?QzcyQ3BuWlZtTmZoMldXRXR2V3M1clZRdi8zTk1PTjFseVBhb0h6cTJBWVZC?=
 =?utf-8?B?M3laY0dJVnFYZ0JuR2pRUXV2QkkwVWNvanUrTFd1ZkRJL251UnZhZmxPemF5?=
 =?utf-8?B?WDd4L0hYSnJCemwwTFJ2TzlWMmhhN0E2NTg4ZVBmaXFlWXlXWU5NOVFJRTNT?=
 =?utf-8?B?MVdIc09EVTRlcVQ3a1JycndqbVYrVncwRWtCKzZ5M3BFQzhkVFJzTGNPR3Vv?=
 =?utf-8?B?SmhjZU9UODMrb0g3bVpQUmRBTExFNTRTeUt6TjJwZGVLdUQ2K3Q0cTIxNGsw?=
 =?utf-8?B?eUFPQUpNSWNtVXNlZko0dDF3YVhodzUwbm56YkEvNFVKYVFEekdCMkF6WFJ0?=
 =?utf-8?B?emJSVjgzdTczMnp6clVOK1Q5TkdtdndMbDk2QnQ4bmpOOVlVY3IvK05JNHFk?=
 =?utf-8?B?UlRJWjVsS3YxVy9rUEo0NGtaNVR3WXlYYlYySWQ2OW1KOTh3em1uMU50ZHN2?=
 =?utf-8?B?bm5NUnBxczIzdEVpb1Q4R2w5b0lBNlJvMi9DbzBaazlUQmpSdmFJSGViRW82?=
 =?utf-8?B?Zk04anVOWnNGUDVQOStua2V5OWVGZUs5ZW9kNlVGZHVwVi9iM3U5S0hmV0RG?=
 =?utf-8?B?aUh4Y1ZNVzN5M1lQUUZCemtVblFibzM1Ni9RRnVKbXZPeE01dzNhYlYvOExR?=
 =?utf-8?B?YkpMam5XVnFVcy8vQ296dExWd25CWVV2Q1J4ME5DZXRHMVU3TGVrWXZaSUtG?=
 =?utf-8?B?L2NiRlZoTXNtdlBHRmNSeGVyVDZLZW9obmR6d1dOQitxVDlsVVg1OWZPdFNu?=
 =?utf-8?B?WUk5dUxoTk4wUHA4c3Q2UVZGbWpSUjhxWkt4dkkzVWU5Qm1YS3V2YW5CcXNp?=
 =?utf-8?B?ZlpFQUIrVU84RU9uZjZGY3I1bDkzRW5qUFVDaHd0eFVVNlY3cHVMd2RPZzZ2?=
 =?utf-8?B?M0J3blFndWpjeTFVczJvd09SK08vVEM3TXNTUEpncXhNS2ZGaUtLR2h3VEdV?=
 =?utf-8?B?SERUOS9hQzE4ZDBPeEx2L2NBa2hvcVpWbmRWK0k4WEZ0cW0ycklhQzJMclkx?=
 =?utf-8?B?Y0hpeFZNNVVCem5Rd0NiQzNvUmNJWnFWdlVhN0xRbUdqdWFubmlaN2U0VHdZ?=
 =?utf-8?B?RXBIUU4vUldaTzNjSGNDbXFIU3g5VzlwQ2QwVmd5TG5CN1k3VkFLTFJRdW1i?=
 =?utf-8?B?RkQxZ01KSmNWK0k2YklJMmtIK3Z0MUI4MFNaMTlESWNVbTMvVW15RkdERHRQ?=
 =?utf-8?B?ZU9Hekc3S1ZGNkZJU2JMZmsxdnBadlpabmczaDBxZnNqbTJqbUd1R2FmVGtW?=
 =?utf-8?B?NzRDaDZCSW5oeWhWWm8vOEpENmMwSys0VzBuK0NtVXZqbGxTTUNsRGtMOVkz?=
 =?utf-8?B?WjhEbUJJMnQ1VWlRM3I5MTI1b1p5TFBGSTJoSk9MeGdFZ0RxSGdqL1h0SkJ5?=
 =?utf-8?B?U2hNazZ3bm1tanM2UWFBMVF3MEZaa1N4SzBzUEswL0Y2TFpyM0RrRDBJVU9G?=
 =?utf-8?B?MS9hYXBaK2JRZ3FkekZFYjRkNjgxYXBHejlVRy9Iczk2dWR5d1FGUkpGU1pt?=
 =?utf-8?B?Y3VuL01MQUNpTlVNYnk4V0ZvNjFEaVp3Y2JJQVBXM09FZ0pQdDFFODVmeWV4?=
 =?utf-8?B?NHp4ZThmMTgxS1VCSlRVY1FaWmdrcTNRZDNjMmhlK2JIczJ1bDhMSGVFZEVU?=
 =?utf-8?B?dGgyU0xqTEhmS1dVR3ZubThXb0tlRnduNW1zdzJpeEpuTThiQ1R3VDB2Zzhj?=
 =?utf-8?B?TE5JZVIxODIyL2pMeEdkZU1YTldCY0FnKzdmQ1B6ZVJZc1F1Y3A4UjNFbDk0?=
 =?utf-8?B?Nko1K2ZhRWFBeTFERnRQbHpQUjlld3FGQVdpdksrSWtQK2RIY2NCN21Ca3dD?=
 =?utf-8?B?YlhqQlNyczlBY1Fmc2lCUThMaG9OeDc1SnV2L0J5OFZtZU9Yc1lKZWgrcW5t?=
 =?utf-8?B?UlZEWkhjUzNwNDlNalgxbWFTb1lVRGNCNmtjWi82V1R4Z2ZTNGRFSWRpZzQ4?=
 =?utf-8?B?a2VOVnRUaVVOVTJFMVdJa2w2aUF2eVB1TldXK3M2eDUxMkxzYVI5a0F5S0Jk?=
 =?utf-8?B?REhjeHk3WUpGOXpITmVqYURUZHVCUjJRNll2aExRY1B6UzF4bWlDRkJSU2xt?=
 =?utf-8?B?SlM5MDYwY1FOaTBuQ3ZRU2tlN0h2TkZ0T1hFLzRCUE5PVmwxREJnNTRNUFpD?=
 =?utf-8?B?bzk2RE5lVFVYVlhzYVNoeWpkdGk0WU5VS1M3RTlLcG93Zi9CWThnWmhnK3Zo?=
 =?utf-8?B?UjF6NEVjVTdHZVozWXZSZmx6VTI1eHBNc1RsQlpWZmJCMmU3akRrQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <923E6168D3BE694085BED634D05D52AA@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ad8ade-6e2d-4d53-6d5f-08da13ef2509
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2022 14:51:46.4426
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T8fVHDaGGGrEW/457FN1uAW+kIgjlXgqUeNTf5Ae2mZ57nY/EIDMMrtB3tNlBwVpKpT2qQ3UxzJtv6GUhvSqnymVohiASpv0B8X2lb8uano=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4409
X-OriginatorOrg: citrix.com

T24gMDEvMDQvMjAyMiAxNTozNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBQcmV2ZW50IHRo
ZSBhc3NlbWJsZXIgZnJvbSBjcmVhdGluZyBhIC5ub3RlLmdudS5wcm9wZXJ0eSBzZWN0aW9uIG9u
DQo+IHRoZSBvdXRwdXQgb2JqZWN0cywgYXMgaXQncyBub3QgdXNlZnVsIGZvciBmaXJtd2FyZSBy
ZWxhdGVkIGJpbmFyaWVzLA0KPiBhbmQgYnJlYWtzIHRoZSByZXN1bHRpbmcgcm9tYmlvcyBpbWFn
ZS4NCj4NCj4gVGhpcyByZXF1aXJlcyBtb2RpZnlpbmcgdGhlIGNjLW9wdGlvbiBNYWtlZmlsZSBt
YWNybyBzbyBpdCBjYW4gdGVzdA0KPiBhc3NlbWJsZXIgb3B0aW9ucyAoYnkgcmVwbGFjaW5nIHRo
ZSB1c2FnZSBvZiB0aGUgLVMgZmxhZyB3aXRoIC1jKSBhbmQNCj4gYWxzbyBzdHJpcHBpbmcgdGhl
IC1XYSwgcHJlZml4IGlmIHByZXNlbnQgd2hlbiBjaGVja2luZyBmb3IgdGhlIHRlc3QNCj4gb3V0
cHV0Lg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4NCg0KQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+DQoNCkl0J3Mgd29ydGggc2F5aW5nIHRoYXQgdGhpcyB3YXMgZm91bmQgZnJvbSBYZW5T
ZXJ2ZXIncyB0ZXN0aW5nLCBidXQNCnRoZXJlJ3Mgbm8gb2J2aW91cyBGaXhlczogdGFnIHRvIHVz
ZS4NCg==

