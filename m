Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6834BBA26
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 14:35:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275427.471290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL3Q5-0005cl-KJ; Fri, 18 Feb 2022 13:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275427.471290; Fri, 18 Feb 2022 13:35:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL3Q5-0005au-H1; Fri, 18 Feb 2022 13:35:33 +0000
Received: by outflank-mailman (input) for mailman id 275427;
 Fri, 18 Feb 2022 13:35:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Z2s=TB=citrix.com=prvs=041b9fbab=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nL3Q4-0005am-Bw
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 13:35:32 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a367ff42-90bf-11ec-8eb8-a37418f5ba1a;
 Fri, 18 Feb 2022 14:35:31 +0100 (CET)
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
X-Inumbo-ID: a367ff42-90bf-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645191331;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=kk0nfI1i0Buabsci0U6735eKzw3N17e6WbCZSRdQMnQ=;
  b=RgT0aLdLg3W06rqF8AXp4un0kQfc1JZpqqjHRG1jBHxs2XY6fAWMsrPy
   WOmWNZUY0EvI/SLgW7i9HLXQQxAHhahX6YgYmjigLUX8oULrQMKugtwu4
   CMuuSjiExELr9YwgWT0Fb5arJwK6a7VT3PGow4UjJZUOC3YEKaO+dIH22
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66761053
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:BeBIlat4wX1Q/nAaeoxHYjHGH+fnVEReMUV32f8akzHdYApBsoF/q
 tZmKWGGOPyOY2f3etElaorjp0kCuMPUxtdhQQFl/HtmFykQ+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQzy4bVvqYy2YLjW1nU6
 YuryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8GPp/Co8QWCSVDOBhZGqgd+5/pel6W5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllJyz3DAOlgapfEW6jQvvdT3Ssqh9AIFvHbD
 yYcQWQxM0qZO0AUUrsRIJQnw/ap1nbASGdJsAzWiq0x+2f20hMkhdABN/KKI4fXFK25hH2wu
 Wbu72n/RBYAO7S32TeDt36hmOLLtSf6Q54JUq218OZwh1+ezXBVDwcZPXO5q/Skjk+1W/pEN
 lcZvCEpqMAPGFeDF4enGUfi+Tjd40BaC4E4//AGBB+l5arm7T25DTI4VRV4T/sj78wWa2cM/
 wrc9z/2PgBHvLqQQHOb076bqzKuJCQYRVM/iT84oRgtuIe6/txq5v7bZpM6SfPu0IWpcd3l6
 23S9EADa6MvYdnnPklR1XTOmHqSq5fAVWbZDS2HDzv+vmuViGNIDrFECGQ3D94cfe51rXHb5
 RDofvRyCshXXPlhcwTXHY0w8EmBvartDdElqQcH82Md3zqs4WW/Wotb/StzIkxkWu5dJ2O0O
 RWP4VINusYJVJdPUUORS9vgYyjN5fK9fekJq9iONoYeCnSPXFTvEN5Sib64gDm2zRlEfVAXM
 paHa8e8ZUv2+ow8pAdas9w1iOdxrghnnDu7bcmik3yPjOrPDFbIGOxtGAbfMYgEAFas/Vy9H
 yB3bJDRlX2ykYTWP0HqzGLkBQpUdSNiXciu8aS6tIere2JbJY3oMNeIqZsJcI15haVF0ODO+
 3C2QEhDz1Tjw3bALG23hrpLMdsDgb4XQaoHABER
IronPort-HdrOrdr: A9a23:vxNLyarrwj6hKyPog75Sy40aV5uNL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossSkb6Ky90KnpewK5yXbsibNhfItKLzOWx1dAS7sSrbcKogeQVREWk9Q96U
 4OSdkHNDSdNykZsS++2njELz9C+qjFzEnLv5ak854Fd2gDAMsMj3YbNu/YKDwNeOAvP+tlKH
 P23Lshm9PUQwVvUi3NPAhiYwGsnayvqLvWJTo9QzI34giHij2lrJTgFQKD4xsYWzRThZ8/7G
 nsiWXCl+eemsD+7iWZ+37Y7pxQltek4MBEHtawhs8cLSipohq0Zb5mR6aJsFkO0aSSARcR4Z
 3xSiUbToJOAkDqDziISNzWqlHdOQMVmjjfIJmj8CDeSILCNWgH4oF69Pxkm1PimjsdVZdHof
 52Niuixulq5VmrplWM2/HYEx5tjUa6unwkjKoaiGFeS5IXbPtLoZUY5149KuZMIMvW0vFtLA
 BVNrCX2B+WSyLsU1nJ+m10hNC8VHU6GRmLBkAEp8yOyjBT2HR01VERysATlmoJsMtVcegK28
 3UdqBz0L1eRM4faqxwQO8HXMusE2TIBRbBKnibL1jrHLwOf3jNt5n06rMo4/zCQu1F8LIi3J
 DaFF9Iv287fEzjTcWIwZ1Q6xjIBH6wWDz8o/sur6SReoeMDYYDHRfzPWzGovHQ1cn3WPerKc
 pbEKgmd8PeEQ==
X-IronPort-AV: E=Sophos;i="5.88,378,1635220800"; 
   d="scan'208";a="66761053"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JEhQjOqxU4+UfsYo/+M3Y5MUQIC93ljjr+ExvOyqp29xsS+usqXMwfj9fbd567LB18W2hsYQJkpvqx6iGfCxO8lolFoVkGKMHGoKo3ixYNNqAoAsgkXy1H0tZm5aIGY3V5LDWNRQRLXLmq94y8JJowCUfzstTd0WnUktPpjeT34Ed6r6Oa73bF6DSCNRof0hvXiM07Nv1cGlBlG8jEP5S/QvBXIGQAhKwWu2bWs6kPN1j3LejdwqkBw7yL2dTzv2+UdRZ6vUIJfU6Vznl3dy59kqxUgUsVp5JwzQ8hgrZ3FdHeKxGvnBOicVX6LjYGTbsuK+GqOQ2WTZ1EsPLZOgJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kk0nfI1i0Buabsci0U6735eKzw3N17e6WbCZSRdQMnQ=;
 b=RmXYH6mJUkCR5BooqlLOeE4Drdnk+ID+HjRmMyr7apBwwWTy+zf3RwK9MdxOXLbfdQ8SizFoQFKjXBRORaTyUKGg1cPbzg5+rDF+EdtGjybzHCYDM5Zo5uuaZKAfMixClKx2t6CTPofQJBNuhSNc8vMmDfi4tLu/lJ8IuKIUR+nwm6xGeVRnBv6w+1u4ZW+ICMxlEXHII54VChsHR8f7NklafZMfEFA2qii2zf4Ct/KsbbaluXeGMqAxk3BnYv7WvRG+z4Pf39faI4SMwIsSpWWZ8KgeEpS8tCK91Z7g3BY7IUxVDm24IAYhswDzK67luuLMWIesKL/4Q9X0LOL2Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kk0nfI1i0Buabsci0U6735eKzw3N17e6WbCZSRdQMnQ=;
 b=IP/n/n4V+AEOIzTYdIOzIPsROItU6q2NToqylK5BWreHVDE/uAqkbc5/hLyZrxkf4sxhSCM2ctD8m3i9RnE54uUjz+zmip9GupQJdLl++1h28m24znwAMCRiCJ+gvc/NjWNKKGSzDx+wYMAGw+L9GOea9PjE70kke9gSS0kuXL4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH v2 11/12] video/vesa: drop "vesa-remap" command line
 option
Thread-Topic: [PATCH v2 11/12] video/vesa: drop "vesa-remap" command line
 option
Thread-Index: AQHXUvTpAmL8laVK/kuChxpnAZopaqya8tcA
Date: Fri, 18 Feb 2022 13:35:22 +0000
Message-ID: <cf92c886-fb0f-3763-d46f-3c0004eb5537@citrix.com>
References: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
 <bc1411cc-f920-a002-d64d-84ce1ebd080e@suse.com>
In-Reply-To: <bc1411cc-f920-a002-d64d-84ce1ebd080e@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ef0be4c-bce6-454b-560d-08d9f2e383aa
x-ms-traffictypediagnostic: BYAPR03MB4837:EE_
x-microsoft-antispam-prvs: <BYAPR03MB48378F6FCB49D528944B093DBA379@BYAPR03MB4837.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NuKBiTiyLSFS9TGB11Dwj/l6hGTpcPzDAAwdi49OSNgrxRyWf4hk3rfhRXauPEFLk61q1ngNkvb0BgfEUKOaR8m5ycUzbJirERvraT8/sQ9z++98+CmUyaK7eXMC1o/+kx0Kek+fSeA6mkqRGs6QI/jtOloBxHTO7M1OJmapMfbKPRpUWq3cTwWcF0z0qlH+K6d2ymkCE57zTpbhq+k0989gTzFyMh2lh0rPcq6rnjDV7fTdXQH9Kj4KGwEa0hc0U91IbRgy5SDg0P/ChhpHeGoI0/sHKwHsoDt1qtDlRNFMWTBr1Po7wdxTNcxAxmVsui7CqySTa7etkPqmo+h3pXk58/2L4Rsqks3k0aHvO1GOx0LlJvq9w0PFxod1HGSFbEGvRaL+d8d1m1moOpDHF37a++knZ69l0L8Vs3ojby2jDBEWIybtCepZAac9ENOE1b6drrsiWaPCIPm4yxMfpClUozziOuP5uiuKjqFIFvfICgUE2rpGuW+3nP0tstFvkcNhHfs4oloEWDId4vChfC/vM/EPAc9s4DEVVVPvNO8LQj2oN/MpJRFcTqeeiR4KvLFQJ9khGzsyd2qFhoahnWpLuM1ByPkpYeLWFkb6+wpo90YaXEvrvBX+4hWLX+VKjICs68S3L/5usYjspqbvP/pzoxtAEgD+Jdy62ln/OAMqMINAGywuzighd2v8EErrxACQBcTUGafIU2c2q1OXZH/PpoJAAMvLrASIsmX6aD41CUWciXHmipY6b/9n563kRbgwLkE/OcvwUK0iVxP7Dw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(107886003)(71200400001)(8936002)(26005)(31686004)(6512007)(508600001)(2616005)(53546011)(83380400001)(110136005)(316002)(36756003)(64756008)(5660300002)(38070700005)(54906003)(91956017)(4326008)(186003)(31696002)(2906002)(38100700002)(82960400001)(122000001)(4744005)(66446008)(66556008)(66946007)(86362001)(66476007)(6486002)(76116006)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cllWQ083RUpKeDRueVMvL0JWK1JiMFNrM3JpNjV6aVNQSmVHT1J6cUh4Umxn?=
 =?utf-8?B?UFZjcEVWdE5JNENWN3RraDk3YUttbUc1RnNoVUJjZHRHZzlVdG1yaG43RXZJ?=
 =?utf-8?B?RXNWNzFIc0JwZUVkUzdZejZJWUM4TWVIb05nQVJOaUZmZXJTTGRkZUliR0cy?=
 =?utf-8?B?ZHBHVXdIVTBKZlJWWit2OWxmQUQ1ZHdDc3l2TDVNSkxLeWhrSUEzMUlZNXlH?=
 =?utf-8?B?ZGhGSjdHUGlLN2VxRzYrVVhIeDRoVjBiWVJ6THk4TmMvSGwyNkRDQnZGcmdp?=
 =?utf-8?B?SkdUZmVDZWdqZmd6Qkt0VnIzWjNsaGo0cTlHc3o2WVhCaDNGaG5HdzlwaFp5?=
 =?utf-8?B?UWNjd3dGUndvMldXT2h2b0RrNGwrQnZ2RmR2dzJZS0ZKbVNvODJHdldyQ3ZN?=
 =?utf-8?B?ODN5R1FvYjkzVkdnR0M2dkdWM1dBSFVtYzROTFlYbWpnK1c4YjY0OGc5S1Jq?=
 =?utf-8?B?Q0xCNVZyVjNJY0ExSUdYVXlUb21FUmttSWlML1BLcjNEQ3RYNVVoejNqdG1K?=
 =?utf-8?B?dUxaZnpDZllCZExtc1dWQWljc1JKN0cvVjhlR29nV3lMNXRlSXlLRmNuOHpR?=
 =?utf-8?B?aktQQ3dGWHZMVXJ1SkJ1OWxtY2ltZmFjYUU4VkZTSnpNQkdmM0ZEU002d1lh?=
 =?utf-8?B?Mmtiek9KcWduaEc2YU9YTy9xS0kxcnE5c3JobllKdjczUmw3VG1UampUYUlh?=
 =?utf-8?B?dUUyTDBpRnZqV1VBd0pHZURMbG9mY1J2dDVMRjRVeTBmSVR0YTNXZjRTK3Bk?=
 =?utf-8?B?WkxwK1FaNWs2Uk9mQXM5eXJmQTVPSXByYi80TTVFdWNaclVjZjE2Y0tyMVJx?=
 =?utf-8?B?VWlKR1Avdi9ZWUxwc2kvRk04Q3BDNTBPS3BHdWpNTGZvd1dLOHFDVkVQQzNN?=
 =?utf-8?B?UWI4RU5hZTRrS1FvaVV4a3M0NjNjbXprSHZzemZrUWF1K29tYThRdzMrZ0k4?=
 =?utf-8?B?OGJEdFJsU1hRc1FINFVrMG1LSE5NSkNFcENac3k4ZHlpeDBNSXZ1bzZEbTVJ?=
 =?utf-8?B?U3k4RlJvdGs2RlMxN1VhNXZvTEMvd2l2eXREOTMzc3JHUnY1NWxHV21paXp5?=
 =?utf-8?B?SUpIbWFVczVrT0l6N0NSV2Vwc3NBNXZ2V2hsb1hUUkJPSTBpVDFpbHhhdTlY?=
 =?utf-8?B?MUh3bUZ2R3FETmdTYU5wNWYvaUFteVhqcWxPak5XQ3FvK1ZFN1ZYY3oxeWM4?=
 =?utf-8?B?MWJsdTdZS2FsYW5ZbWFHbWxOQmF1NVI3aktZSkl3UEgvZXoyRE1YM0VUK0ky?=
 =?utf-8?B?SHhabUt6bm0vM0l6VUNLOUd4VlNPMFBsYzlMQlhibndEbDdOcGZTS2U5TUdW?=
 =?utf-8?B?YTF3UjVvbG5OQjU2cytRRE83MHN4d0k5Mnl3bjAvM2h3bkRCdUtxR0ppWGVm?=
 =?utf-8?B?cWxmNDFqeEpIeGI1a05YNVRJN3FSLzFVeTg0M2hpaDFxaG1TbjVkdXlwNU1x?=
 =?utf-8?B?K1AyRlVWQUtOM3k1eGh0MlRHVXlnc2RPYkFpUkdaWnNKWWdTWGtIbnQ5UFZD?=
 =?utf-8?B?M282NEYrOVVCU1RQeHlXaHFiUGcrOGlpeDIwdUYzWFJWb0U1MUhwQzN1Y1dm?=
 =?utf-8?B?L3lIWCtURnBpUTFTam5MUFlNUGRuOGFXUE5VY1pBMzhXZ1dEb1Y3UWZ2Njcw?=
 =?utf-8?B?QmNqOGZIUUMrZ2JNblBsaU5BYnNFVkk5TkZzT3l2by9TdFZSeUZRRHdnVVoy?=
 =?utf-8?B?Vlo2aml0WnR4QXdIclRnaWljbEs3K1Q2MFRsbU5tSU45Q0hiU2YvdENkWnI2?=
 =?utf-8?B?N29RVXg3UE8yTmRSRXYzbXZSVjJtQWJMaUlvY3RaNzM5VFlrODB0TWZBTDll?=
 =?utf-8?B?YUo2NFcwRUM1bVlIbEFLdVN5S2dLMnlMMFVGKytDbTJKWG5JTUIxQXcveVFQ?=
 =?utf-8?B?MjVKc1NUMGE1WU0vYUVBYzB0dE1Pdm9HbzBFK2dYNzZIcC9VZlI3dHRFWnlh?=
 =?utf-8?B?L0FlWDgybDZFUEMxYURHZU5hNXhZVEVZZ2FreWJyZWk4WTYydmxHUEVEN1JK?=
 =?utf-8?B?blc2L0U1TjhZWGVFTnNKL1dJZHY5M3cxNVRiVWpSNEFUYTVBZUlHc2xEMUdK?=
 =?utf-8?B?YjZmWW1zb2Y5WEFPc1B0VFRSRC9WWDJFeVZUTVF5QllsQUJrSzVOY3lSdC9z?=
 =?utf-8?B?eVZIakVicmZnclN2VUhNYTNoZjdUZUJzcGdNMFBPWnFsb1NoL2c3cWhwVlFG?=
 =?utf-8?B?NHhYdVpEck9uTDRpdGJrVG9EMHhiNjZBaG9OeWxTbjFubFFkeHJsUndyRkpG?=
 =?utf-8?B?MVFhUklBaXFTdWpGUFRxUTNHbndBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F41F7F5C8EAF0B429F2931BD0BBA7CCE@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef0be4c-bce6-454b-560d-08d9f2e383aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2022 13:35:22.8706
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HB/VpOOJ1JWhzV6fPNjytQ8vjxhSk1OFaGI/tkWqAjFbxfvYAtP18m9TKYkyLlGkNymUFfGzvENAGQgvMpjlOv0s0ZU2NqDHhY9Sl5JY0TI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4837
X-OriginatorOrg: citrix.com

T24gMjcvMDUvMjAyMSAxMzozNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IElmIHdlIGdldCBtb2Rl
IGRpbWVuc2lvbnMgd3JvbmcsIGhhdmluZyB0aGUgcmVtYXBwaW5nIHNpemUgY29udHJvbGxhYmxl
DQo+IHZpYSBjb21tYW5kIGxpbmUgb3B0aW9uIGlzbid0IGdvaW5nIHRvIGhlbHAgbXVjaC4gRHJv
cCB0aGUgb3B0aW9uLg0KPg0KPiBXaGlsZSBhZGp1c3RpbmcgdGhpcyBhbHNvDQo+IC0gYWRkIF9f
aW5pdGRhdGEgdG8gdGhlIHZhcmlhYmxlLA0KPiAtIHVzZSBST1VORFVQKCkgaW5zdGVhZCBvZiBv
cGVuLWNvZGluZyBpdC4NCj4NCj4gUmVxdWVzdGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQoNCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPg0K

