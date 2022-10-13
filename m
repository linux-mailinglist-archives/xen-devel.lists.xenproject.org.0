Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C8E5FE010
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 20:04:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422358.668325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oj2Xy-0006lM-0k; Thu, 13 Oct 2022 18:03:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422358.668325; Thu, 13 Oct 2022 18:03:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oj2Xx-0006is-TW; Thu, 13 Oct 2022 18:03:05 +0000
Received: by outflank-mailman (input) for mailman id 422358;
 Thu, 13 Oct 2022 18:03:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xhTA=2O=citrix.com=prvs=278783dfc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oj2Xw-0006im-LE
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 18:03:04 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44c42913-4b21-11ed-8fd0-01056ac49cbb;
 Thu, 13 Oct 2022 20:03:01 +0200 (CEST)
Received: from mail-bn8nam04lp2047.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Oct 2022 14:02:44 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5623.namprd03.prod.outlook.com (2603:10b6:5:2cf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Thu, 13 Oct
 2022 18:02:37 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 18:02:37 +0000
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
X-Inumbo-ID: 44c42913-4b21-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665684182;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4pUbOcAIP7fshJ+9IZXMnaZaYwUzC/2SnfYUgMXbHmc=;
  b=fDFJdUw30au/4xIbzr+tLeN46uwURLkW7eLnWV32tIkkXpe+K9aORyOO
   fmYK/4OXmW/mNXqv7MFhUQZLmdOmsE5wahOWTgabkTO583T/6UDLdfXKI
   WXyx/wwWBdufiQz2oyf7XSSWpaO4db8nnqCqiKIsIOuIMkhv+h5Mg6T0h
   Y=;
X-IronPort-RemoteIP: 104.47.74.47
X-IronPort-MID: 85208381
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2D3DBKpWUIBAnOhqbDWiAKayx+teBmIKZBIvgKrLsJaIsI4StFCzt
 garIBmPb/qIM2D0fdt0b97noE9UusTdmoJgGQc6qSpkQSJH9JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYGYpLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4ZwehBtC5gZkPKgS5weE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m/
 tgDFhsSUSy5h/OKh4DqFLMwnc0pFZy+VG8fkikIITDxK98DGcyGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6MkEotj9ABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCN9ITO3jpqcCbFu7+zUZIyYQcGuCvMKlkRSve/1hJ
 kcE9X97xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnO87QyY7k
 GCAmdzBDCZq9raSTBqgGqy8qDqzPW0fKz8EbCpcEQ8duYG//8c0kw7FSctlHOitlNrpFDrsw
 jeM6i8jm7EUis1N3KK+lbzavw+RSlHyZlZdzm3qsqiNt2uVuKbNi1SU1GXm
IronPort-HdrOrdr: A9a23:jQDPda67NRrIBobjiwPXwWuBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qeu1z+853WBjB8bZYOCAghrlEGgC1/qp/9SEIUHDH4FmpM
 BdmsRFaeEYSGIK9foSgzPIXOrIouP3lpxA7N22pxgCcegpUdAY0+4TMHf4LqQCfngjOXNPLu
 v42iMonVqdUEVSSv7+KmgOXuDFqdGOvonhewQ6Cxku7xTLpS+06ZbheiLonys2Yndq+/MP4G
 LFmwv26uGIqPeg0CLR0GfV8tB/hMbh8N1eH8aB4/JlagkEyzzYJ7iJaYfy+Qzdk9vfrGrCV+
 O85CvICv4DqU85uFvF5ycFlTOQiQrGoEWStGNwyUGT3fARAghKRfapzLgpDCcwoSAbza5B+b
 MO0GSDu5VNCxTc2Cz7+tjTThlv0lG5uHw4jIco/jViuKYlGchsRLYkjTVoOYZFGDi/5JEsEe
 FoAs2Z7PFKcUmCZ3ScumV02tSjUnk6Ax/DGyE5y4eo+ikTmGo8w1oTxcQZkHtF/JUhS4Nc7+
 CBNqhzjrlBQsIfcKo4DuYcRsm8DHDLXHv3QSqvCEWiELtCN2PGqpbx7rlw7Oa2eIYQxJ93g5
 jFWEMwjx9HR6svM7z64HRmyGG/fIzmZ0Wd9ih33ekIhpTsALz2LCaEVFci18O9vvR3OLyoZ8
 qO
X-IronPort-AV: E=Sophos;i="5.95,182,1661832000"; 
   d="scan'208";a="85208381"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JKEq5K2F50HKVdob4llxP1660bhKj9isnRRwQXiFCLOkpWwO2BE89WJVOL/DnS2YB5I9ByS5Pktmr0ErrcNAl4Me4Cka/MnMtpg54f4qua4blZFFeeOvPFqg3kfiOYCSgNbyBpFKr4wDBUCe6ozCJX6Tf5e8stew3kkbA0akLNZR94I1FvikfX2w3bYlsJTkzD1d9bmmksN2U/xb9gydSDokSCqA9lQUogLkGb9oFH1AOkTh5mExI5rjHS+XagT98xRkmjkUjmXku+9nvnqwd/Di7tn5F5b9jLkzhqIQm8X5jqNQuW6O7lVUbHqLfYI18pfBA4f5X5RAgl8XvPABqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4pUbOcAIP7fshJ+9IZXMnaZaYwUzC/2SnfYUgMXbHmc=;
 b=e3QmtQmPSDzUESBgbmfbBfmC4VaOUITa/tWSAn0IyAfzv6/5sC9oV6YBOv0ZAYbDFCFkLhcmjGudXxI87iXtCSVMEdiynluyzAeoCVC7ypLYSt1mS/8xnyj4qBHHQ/1gOvyWMAq2H7U6Rrxh9jxav7uP0Jha7ijIylHTwpxwMFkl7oswVaH4tUXz92bgybXY72N80P1weG18rwnYyfdEfMVGBjW5Ro7tQGQ7u3I9dA9Kg4UK6vRsi+jeMrYDwElXbv6NhPAyr/+OompIxgicbfuF9fhvIvjwN9sP3gmHAhREIpHMfRFPXJcu1QA8SjmLgT640ESyTg4ofobTZx5Wig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4pUbOcAIP7fshJ+9IZXMnaZaYwUzC/2SnfYUgMXbHmc=;
 b=w9zJwbawvcD3w9KnHYWygqrNZXOzoNYxirwKMku/xLfGrTQ34pYD59942e6GHHXjRfpH0N31+FUKm5bbAkCL55FQEvo6dZ9dwB0K1qB/kasjYtrMVaQpEhYz6QqBLmNCZY0EGUfR6xGWo4Ht115Zb5oKT6zQIndQMG//gNpj4vw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>
Subject: Re: [XEN PATCH for-4.17 v5 00/17] Toolstack build system improvement,
 toward non-recursive makefiles
Thread-Topic: [XEN PATCH for-4.17 v5 00/17] Toolstack build system
 improvement, toward non-recursive makefiles
Thread-Index: AQHY3wR19l5fPoXHX0uqLO79kk12za4MneoA
Date: Thu, 13 Oct 2022 18:02:37 +0000
Message-ID: <381f1ae6-d539-ad52-79da-e44e9dfd5066@citrix.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
In-Reply-To: <20221013130513.52440-1-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DS7PR03MB5623:EE_
x-ms-office365-filtering-correlation-id: ee30d404-9a94-4fc8-2454-08daad451cc4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 nVvQALgPOjBTKwwyQGMELT4YrSldLLY6MeZCx9v9sSxTbAi8UpmiAAvOoD0ak+AfL29VjtnRmOr2GltH+iJhzvadHjG3ovpMHeVarIZbDi58x6pUf1eQXJ7tO0C/8wndHJObSebDaSVV5MtZQ9wJDaozW//mf/wq470DNDMSNtl9EeD5avp6qWermaxGl9PiMvVx2ZwawMtBN8gefowh4v4Xa6EVSZX4sOprOhdiOilKdGCH5yWRMBxuF89WAQJdcy4/NpY712uWdEyaG5bnNqFs4GHuLe01NdiRymqh2xUdoa4r5oVAEMU69euGz4YQfvQBepNbsA30ZvsZQ4JVXekF5TC03qll5biHwuFgv7mk+PI0tb+bnYC670/8dTo700StbukmC1ByKRMntc9yyxvSgI2HarwcnK36t3ry+bxHWZ3fjcjU9MyAcdUp5Yyr0FcPiHsoq2ptsKyPQJZY3XaBhkERz2sRiJUKAlvta7F9zsHJczj2x4RXTvWGMXwT+38Lc8LlNAfO7bVbv4CR/AmAnSi5kwQ2p7W1+v7puk0+haRVNL16dIWkhvdQ+y3rF/xggp5pogCjPEfqNujVZZDOiBreIde6jB/imgbfn0bvN2zADxLCVxC6a1kaV9ZRDHSoDqwq4CxSwkJ8BJ6cbLkxDNDx4je6nv50PjJorkk+oX/jhdFblPpF3ooUxNj3QZGqa2jvxjojuW6wBLVz2kkkOXSFma0ZpmpkOlTlowydDewma243xXWTo8cTj2gUSx0n3F7KcE7LNJWLxPdmFoK/7s6xzOKTdiTl/OFJUlEFfCEUQwbPXB6xtwzFECmIKUwYhbabFUxZuScbfbO+GOXtkobCDA2JElVK9FpDVn8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(451199015)(31686004)(36756003)(83380400001)(6506007)(6486002)(26005)(6512007)(186003)(122000001)(2616005)(53546011)(82960400001)(2906002)(478600001)(110136005)(66946007)(76116006)(66556008)(38100700002)(966005)(41300700001)(4326008)(38070700005)(4744005)(31696002)(66476007)(86362001)(66446008)(91956017)(8936002)(71200400001)(316002)(5660300002)(64756008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OGpyRUZKQ2JSWmxsRlNiK2ovdE43SCtjSHJBZ0k5L1BnaDNGY1JuUU1CTXBa?=
 =?utf-8?B?SmowWGhSZlNrQ0FTMldXS1NCbUlDWjdSOXZnV0NIcXZwcm9LTFlaOFNucWNU?=
 =?utf-8?B?dS84Wlc0djZnTUlnTzFOZlJvcHVvU2FNRTE1b3R1eC9YcFd4Wmo1anZ3UXdE?=
 =?utf-8?B?WC8yT1hQMk9ER2FEb0gyc3VQdjhPVG5EdFBNRGpzSVNaOEhKQUJTZHZsK1Nx?=
 =?utf-8?B?UFBkNy90SGVOU0NEVnJKdU8yeGtDWWRtZ2lZQ1F4YlM3ZEtjczBCaVM3MVhC?=
 =?utf-8?B?UWE2Ulg0Qzd6VXVlN1hpZWJHNlp5RkMwR2NhRXNGWTJzSDZ6OUpUZmVTVmNQ?=
 =?utf-8?B?M20vUlpWQWwrWU1IN1h4b1Mrclh1cGdFaG1GbTUzb3hIVm5MeG8vKzFhQVNo?=
 =?utf-8?B?VEpQc2dJRzBGNmlITTEzSjVEdFNYRDcyK1RyT1dLTmc5Q3dPRVFGbHpWM1g5?=
 =?utf-8?B?QUtxNHVmemdlZXBxdFVIQWswbVRveVppZHpJa1ZRQUlRS3hVeFM5aURlWUo2?=
 =?utf-8?B?Z0JvRVliTy9LZXVaYXhCc3Jub3BTY0RCR1lJRHJZSC9seWI5U0dWcnVkZnp1?=
 =?utf-8?B?RDAwV2FZWkw1eDdOb3dka2M5ZG9SNXdBY2VXMW5mb2M3anVtbTlEWEFBSnhT?=
 =?utf-8?B?b2Eyd2E2cHo0Sk82b214TzlYcmo0YkxMQjNPcE4wTHBHYWhyTmc1eGl6Z3JF?=
 =?utf-8?B?NXBhMTNhcllGN1Z6L0l1dnNNdyt6dGNteFV6R2RaUE1tbFZOWTl3SmQxbmFI?=
 =?utf-8?B?U3hRRUxaalNjcTMxc1IwRStrbWRWMENsSDdqS3VYcFlZNEJVWENkdzRSbG9S?=
 =?utf-8?B?Nm9WM0tNRHNQWUFRQ2taUVhNSGJ1cWVsV1hoK1Rnb05JVys4RkdmK2RuWGxV?=
 =?utf-8?B?dXlEMzJycTNYWTZoekwxakxrU2Y3YzREYzlDZi8vazY1dURSNEhhejVKak41?=
 =?utf-8?B?RGZCZEhrMEhBT3ZQVUlHb2hrTytCNU9qRXpoQXhuUnRqNVNMNXc0UzltTm1H?=
 =?utf-8?B?cVJXNWwybS85SzNFcEc3ZWVEVVNxNFYyMlFPc0dsU2R2a1lRSmJ4UHJtOEVL?=
 =?utf-8?B?d2hmdENrcGd3RWVLTkZBWW9KaUsySUZjNEJlcTVRS1BQQ3RIekM3eitrRlo1?=
 =?utf-8?B?NW5SVjlsOHF2MkY2bE85aDZIOHdoODhiSVVIMlljdWx2bjJ5eTZwYjlESlBS?=
 =?utf-8?B?Y3RJNWlkY01vditrTEQ0NUVsUkNwQ2pQN2FzSGpGaUFZSmU1cFJNVUl6R2Z3?=
 =?utf-8?B?Q0RyTHNPTFBudmhkdzAySTJpUzBRcTRPaFErWXBHWHFpRW9rTGZOVXowTWRF?=
 =?utf-8?B?bzJKU3R6VElObHdIVXhUc1dYMEU1YWY1a3pyOFBsSEdOVkVTNkxhb01xZkFy?=
 =?utf-8?B?Q2pNT2VOb0R1UGdNMDAwVFVNc3JWSlJPT09IRlBYblJWU0RRWUpvQUdZU1Zz?=
 =?utf-8?B?ck92Y2VmRSs5UFgxQ1lLNUl0R0c3WVducW9wYS8wZlNxanhHSjNubFlRckJS?=
 =?utf-8?B?WThLc0JQSkJYZHZWaHBjemYvczBsUS9KVXlxNEtwZ1FCMng4VUpXUTJJeTh5?=
 =?utf-8?B?TTFmdm5CRjFveE5HRldBSTV2MG4zYng5SmROZTl5d2x6azhrMndNZlVGVTVn?=
 =?utf-8?B?dTcwdlYrTUlLY2xvVlc5aUdkMW9PZGlsR0FVYzhKdm5RMXZBRHJoMCtCVHZs?=
 =?utf-8?B?UHQvb2xZTVZ4cXNrSjY2bjU3MlAxSGprWGIwZy9aQWxzODJHdmZ4cy9uency?=
 =?utf-8?B?cVFUN2lNZ0tBM0U5V204OGhNLy9URGhjZGVqT1RiRWtNZCs0SHF3cjd1clRM?=
 =?utf-8?B?MGdvTVlLOGJWeDIzKzErSXFZekZ4K3BTTm42K0pQWmh0dGpsOTg5OFBad0pL?=
 =?utf-8?B?NVJsOEhBQkdmNE1IYitrZUZiaW5qMFB4M29lUlhBeGRlTHdVaGZRWGcvQTRm?=
 =?utf-8?B?dHJFOE1Hd1VwMUVYQTJHMDMrck56MXlIL0ZYdjRua2xKcURpc3lESXFrQXIz?=
 =?utf-8?B?L0huRlFsdW5kYkVEcXZabUV6ejZzQk50aG5RdVhsaS95dkFUeC9YUm40d1No?=
 =?utf-8?B?aUc5elNLYndET29wOXh1eGRxaUY4TTBZelp0MzFaalJtVHdjRzZ2ZTAxQ0xW?=
 =?utf-8?Q?9OU3oXLj37helyzVDluBDGaK6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F9F22E6CE3AA14C88398E47F85CDA6A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee30d404-9a94-4fc8-2454-08daad451cc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2022 18:02:37.3155
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c51vPWsQG9kRIAIEv70zXn1+1tAYPN5gaKw5PAVhOJl+ljkZ2AAlEan3twUKtEA0Uni3lm+4dPYSUc9eaD74119xHS1ET31xmBc7PJD7O0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5623

T24gMTMvMTAvMjAyMiAxNDowNCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+IFBhdGNoIHNlcmll
cyBhdmFpbGFibGUgaW4gdGhpcyBnaXQgYnJhbmNoOg0KPiBodHRwczovL3hlbmJpdHMueGVuLm9y
Zy9naXQtaHR0cC9wZW9wbGUvYXBlcmFyZC94ZW4tdW5zdGFibGUuZ2l0IGJyLnRvb2xzdGFjay1i
dWlsZC1zeXN0ZW0tdjUNCg0KSSd2ZSBkb25lIGEgZnVsbCByZWJ1aWxkIG9mIHRoaXMgKHdpdGgg
dGhlIDIgbm90ZWQgZml4ZXMpIHdpdGggWGFwaSwgYW5kDQppdCBkb2VzIHJlc29sdmUgdGhlIE9j
YW1sIGxpYnJhcnkgbGlua2luZyBpc3N1ZXMuwqAgVGhhbmtzLg0KDQpTbyBULWJ5LsKgIElmIGFu
IGFsbG93YW5jZSBmb3IgNC4xNyBhcHBlYXJzLCBJIGNhbiBzZWUgYWJvdXQgZ2V0dGluZyBzb21l
DQpvZiB0aGUgbW9yZSBvYnZpb3VzbHktdHJpdmlhbCBhcmVhcyByZXZpZXdlZCBhbmQgY29tbWl0
dGVkLg0KDQp+QW5kcmV3DQo=

