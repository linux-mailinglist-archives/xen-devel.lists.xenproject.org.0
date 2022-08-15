Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D09592EA8
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 14:05:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387383.623593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNYpp-00080k-LA; Mon, 15 Aug 2022 12:04:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387383.623593; Mon, 15 Aug 2022 12:04:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNYpp-0007yn-Hs; Mon, 15 Aug 2022 12:04:45 +0000
Received: by outflank-mailman (input) for mailman id 387383;
 Mon, 15 Aug 2022 12:04:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z+x6=YT=citrix.com=prvs=219f4dd15=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oNYpn-0007yg-1v
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 12:04:43 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e6cd660-1c92-11ed-bd2e-47488cf2e6aa;
 Mon, 15 Aug 2022 14:04:40 +0200 (CEST)
Received: from mail-dm6nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Aug 2022 08:03:59 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB6970.namprd03.prod.outlook.com (2603:10b6:510:12d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 12:03:56 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.027; Mon, 15 Aug 2022
 12:03:55 +0000
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
X-Inumbo-ID: 6e6cd660-1c92-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660565080;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=PHXbd9I4bpwki7VziroVs0NBFMLKoeesmeY69L63cTw=;
  b=TPGICifxytrge1DzEpq/EwrpQSGBp1Pb6UjKgoB5+88DUeG8SOTbc6tp
   qh+166xOQNyCzj/TyMaBK6w49eh2K5wGo8JallFne22Zgw2tB1AqBCC2Z
   Svzqhbb/eAYg3HeOzDbm22yvxVjbgh1aTkbbVIwTf1qdnSLkeu4WsspSP
   M=;
X-IronPort-RemoteIP: 104.47.57.175
X-IronPort-MID: 78544050
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:KZSrvqpyQt5Ud6DC4uabAKbvvwheBmIzZBIvgKrLsJaIsI4StFCzt
 garIBnSMv2JY2Wjfdx3bty3/EtQv8KGz9dlGgQ++SgzRSgU+JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNPg06/gEk35q6q6GpF5gVWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqVD1NluBzhf+
 cUCJSgzXjKuvOPq/em0H7wEasQLdKEHPas5k1Q5lHT1KKhjRprOBaLX+dVfwTE8wNhUGurTb
 NYYbjwpawncZxpIOREcD5dWcOWA3yGjNWEH7g/K4/NovgA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE2b+SwX+jBdp6+LuQ8O82nQWSnWspC0M4R32qpvKmiUnmYocKQ
 6AT0m90xUQoz2SnX930WRK1unKNug80Q8BXD+o87QiMzuzf5APxLmoOQyNFadcmnNQrXjFs3
 ViM9/v5CDoqvLCLRHa18raPsSj0KSUTNXUFZyIPUU0C+daLnW0ophfGT9ImHKvriNTwQGj02
 2rT83V4gKgPh8kW0an95UrAnz+nupnOSEgy+xnTWWWmqAh+YeZJerCV1LQS1t4YRK7xc7VLl
 CRV8yRCxIji1a2wqRE=
IronPort-HdrOrdr: A9a23:/winwqj/mnQwiFiYk88sM6EWK3BQX/J23DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQ5VpQRvnhP1ICRF4B8buYOCUghrTEGgE1/qv/9SAIVy1ygc578
 tdmsdFebrN5DRB7PoSpTPIa+rIo+P3v5xA592uqUuFJDsCA84P0+46MHfjLqQcfnglOXNNLu
 v52iMxnUvERZ14VKSGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftxK/mHwOe1hI+VSoK5bs562
 DKnyHw+63m6piAu17h/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtSJV9V6aEtDUVpvjqzFoxit
 HDrzopIsw2wXLMeWOepwfrxmDboXgTwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp9KZ/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wXh4SqbpXVd
 WGPvuso8q+QmnqKUwxeVMfmeBEa05DWituhHJy4vB9nQImx0yRhHFoufD31k1wiK7VDaM0p9
 gse54Y6o2nBKUtHN1ALfZETs2tBmPXRxXQdGqUPFT8DakCf2nAspjt/dwOlaiXkbEzvewPca
 76ISVlnH93f1irBdyF3ZVN/ByISGKhXS71wsUb45RioLXzSLfiLCXGETkV4oCdiuRaBteeV+
 e4OZpQDfOmJWzyGZxR1wm7X5VJM3ERXMAcp95+UVOTpcDALJHsq4XgAb7uDauoFSxhVnL0A3
 MFUjS2LMJc7lqzUnu9mxTVU2OFQD2KwXuxKtmuwwE+8vl8CmQXiHlltb2Q3LD5FRRS9qorYU
 B5PLTr1qumuGjexxe701lU
X-IronPort-AV: E=Sophos;i="5.93,238,1654574400"; 
   d="scan'208";a="78544050"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRBKQybkE5rTOiSlj1naf/1LchdKj+8yIOPmw7BHRD93yf2Y2c7hqLmJLwFgdc5eaWC3gfBjvA0qR+kLfsKzAFu8ZKKHZBAQZTFto0OQa7Yt4PThpUufVgX3e0wLx5HEblt19W7dIG7ilbbFjG//ZxV2AAEzMtNkGpCATYXNOYLPvkczQaWKjAKJqRm3qWUu67rx2/Qr1B3nJ4Yt6JSqjojrYgd+GZwSVKB0vh+MjKHIORLUQn045agQ2n1JzvzVHWKw5q0uTbcCDmw6tLo3rjMKQmUpHQQTvWUQ9rZ3OVApU6OtaiE1ZyrYdeJeze3jRAnQUSVSAJDbnqLvxW4MqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHXbd9I4bpwki7VziroVs0NBFMLKoeesmeY69L63cTw=;
 b=l1S/bJjJq+Q+ngpHRjSqHGwZXY4EvNV9wPFn1iS5XMqa0nxZghyXsnKhVcqRUJBeaREDtm0Z4KfhLJ5D8QMUpUSbTKjjWY1dO1g2fHzrrt9LPW758QVlwcTIVM40LJxbHvCtj2aQZtil80KucFuU7Gb3h8H8QJMSeirqN9euzmypWoLqcmM2r4azq1Ri5a8NdDqLfb38rSgFGXdoHFNTcrDBNjdHdiUbc1ZILr9K1lQRnh2cpICG6OkmoyU33Q3bM4FSYaKeUlo9Xsm/ZVlvPfeoOTid6EM08RssLz4Hsg5lxPoje9lpdDjNMFwqH9J0mDxYHGG5rGclEajZXu5X2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHXbd9I4bpwki7VziroVs0NBFMLKoeesmeY69L63cTw=;
 b=hLMkjJ+KXtBa+zLwiprcBvWg6PpX7ctHbH/u8alHunsy3t57GQWe/i1Zr1QS5yadtqCWWKr139K6U9IZnT6lnX2m1WNgLR8MFRh53M7T+o0Mk4n0rnEDqTY4TOhkWVKLF5L0uHBPKIGtnpoTG9fjKunI6zE2RERR2i5zw5388FI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Dylanger Daly <dylangerdaly@protonmail.com>, Jan Beulich
	<jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Ryzen 6000 (Mobile)
Thread-Topic: Ryzen 6000 (Mobile)
Thread-Index:
 AQHYmvrX1sLvM09bk02pTR45nk82162Fb4oAgAD7BwCAAIAsAIAAAHAAgCkNSwCAAA/BgA==
Date: Mon, 15 Aug 2022 12:03:55 +0000
Message-ID: <c24c469a-e0e9-6162-b8d3-07c1707fc2d8@citrix.com>
References:
 <wMV4okoInWxTqAaH6sxUug6my9BOlkurOWuCUILGFxoYe96U_-Z-KPjDdacRmuIksOMX-chaAN0lnGj5XevfNJKw6fIVhsSIqBCxGHweK-Q=@protonmail.com>
 <4c3976aa-dad4-2707-2852-9b26593692d0@citrix.com>
 <pDQL7BhwlO49buWymLE-VFEZJim7qNeMmAeThZgHF9qzcbNbQ6ZoSXktgD14I_HYpsdxqfCugrNoJ227u5DLCWEEXk_h9c7bf4iKdgoQbQ8=@protonmail.com>
 <b3e00f33-527e-e29c-87fb-0773344aa1f6@suse.com>
 <a485f128-6caf-4f4a-3d61-423e2ee67121@suse.com>
 <uGB9M0prJ1uFQ4e4SWvoe_jFXgjpBlNr1C8q90DWeR6CtiSzXBUQ1nGLD6tl1dTeYvqP6347vsu-MVKu7P17KH4QU8GFSkeuOCcQCyslSMY=@protonmail.com>
In-Reply-To:
 <uGB9M0prJ1uFQ4e4SWvoe_jFXgjpBlNr1C8q90DWeR6CtiSzXBUQ1nGLD6tl1dTeYvqP6347vsu-MVKu7P17KH4QU8GFSkeuOCcQCyslSMY=@protonmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ecb20483-1440-4cfa-d8c7-08da7eb63a80
x-ms-traffictypediagnostic: PH7PR03MB6970:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 34k8k8YnjQkLw7itJeha2hJbh7h22SgeA8Mt4gTg9k4ltzLTFX/5T56T9oF/yY+j9X5gRRY8m1lWp9Ag8IZni6PgoiDf9Sai2Br2163d2JDytawparqPvQPMS2dkamilgXhvz1+q0Ege19P+ayyC/7B9SBdRcKJqI2R2vXkVXa4clmpga4FYMCFWCU8OkKK6H6I9ZsqerB0cO1RRJixESXVtec+1/pDRkf5vNcAcFi+0zc1z6darhEhclpyAh2mMTCHsAFGgYMKTMIdGr7CtZnzjkCliSE4g0CD7kHIyvoyx6XME0OjnMSu4YEWezVvPv7Q7hjI1l0A2pL8tYRgeuGEYNjQADCkbtd4019IZkBNpEVv7q5axtncYNlEGynXL8Q5lq7h0fJ/RxphzrzyWRgTpTNwGxfh2RkLSK1W5FRuzabFAzdPaMbvxA5DhkBjQkBTJXSYzxCyzDQ/0llUWy1gFUrikL/uzWwWB5OF6MFdxrkfB5260k634RMVGpxSOdJwx06ozPSpcJHBwT+eWA9rfaTFPBy0Z7vs71LSfHr8tu+wPTzndCsOXDZHVzD1W4fQlNUDPs12URCBJSBZhsZl1sT9O38V11ZfktQHVLFCjKRtP9OHIVyEDV7eI/3e/0ELjetluoPjjPFh6gB3bVOTNgZo2XOIAi9pVW7wvWU/4GHdO/LlNx5f83VHF4XQkN74HUySWO3QbjWD3nhQWwjrKfQ0lejA3TvyapG8ICnnzDYdEcBc14ZTBtkw+aRlvkLHMXxdYSKf72EmAElr0Vfhdk6xL5YUu5BJDYMNpGM/XIeIVB9s0rDyJg/rp1vuVU0Mtq8tuWmRdS/ub+wcj5Z274A9huO+SLWaGyBis7nc511L7uUn3oATWGeSEtJ9oM3Hrap6akte9IDYN8pmF9Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(136003)(366004)(376002)(346002)(8676002)(186003)(83380400001)(82960400001)(66476007)(64756008)(122000001)(4326008)(38100700002)(316002)(66946007)(76116006)(5660300002)(38070700005)(66446008)(66556008)(91956017)(31696002)(53546011)(2906002)(6512007)(6506007)(2616005)(26005)(8936002)(41300700001)(31686004)(6486002)(478600001)(71200400001)(86362001)(110136005)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NUdCSHJ6SjVIZkxyS3NBOUhzaUsza3RkZ0VNWHhCM2M1dU9STnJrUnBvTHFZ?=
 =?utf-8?B?NVFYc0NVWCtEUXZneDNFeVhUZHk2TVF6L2JLR1dZSkdrM3VhNlloRDZTZmxj?=
 =?utf-8?B?cUhaWXduSlBJN2hHTk9tZ3hNeEhxVkhJVUlkQ2pGTE1qVGowTWFpbDcvUmJ5?=
 =?utf-8?B?Y2hYZTlyWFdnYXc1UVF6S240R0xoQ1M4elJJampQVGhlWnFnQWRneE42R2JY?=
 =?utf-8?B?M1dVRmFCakdrVE9jWjAwVTFKdyszUnd5bks3ME5lb1dQUDRDSU9ZMHNhUVlh?=
 =?utf-8?B?M2dEbXYvZ0h4ZmkrOEY5dTIzRmFzZ2lpNVBhbEd4cWNZMGROdW9pZCtsV0pK?=
 =?utf-8?B?Y1dkUkhkQU9mU2FkdmJnOWZ1NGV1L3B3ZnlGZis0SWRjaytrRlJ2TFRGWGdC?=
 =?utf-8?B?aC95NUEya0lwU2ZnYXNpdlZxMzV1Y0VMVENaVTg3Z0JvMWpDTVJVdURwdGtt?=
 =?utf-8?B?NXhQNE5zcm1laDRpR0M2WWlMSzBSbTc0a0dMV3E1YVBDNDNvWFd5Y0ZGRU9x?=
 =?utf-8?B?b1lRYmtJSjV5SkZPYWdoaU85VDlRYzUvd2xzVXZld3hicXNCRE5MeFpEazRY?=
 =?utf-8?B?U3ZJZUNKVTY5NlBlVlJLNzBkRFRTTDBhalFMUUhZSTVudHMzSDdIY0YyVVFj?=
 =?utf-8?B?dGRoNHVsNndOVlp4Si9KakhsM3VBbVVxVVpRNHd0b3JFQkE1UG9talc1TFZu?=
 =?utf-8?B?RjhBR2pHMGEzcnc2akRtcUlWVGl0QXU4UldQMnhGY3RYUlhDL2RSQ05FaDN5?=
 =?utf-8?B?NndmNlNYN3A5cnVodTRPWVNaUmI1VW1JZWQ2d3JwQ0RUa3VBeHJFdkZyREVF?=
 =?utf-8?B?MXI0WTdCSmw0UlNNWEJjN0o0UUxOaHZNTXlMMy9iTjdkRkpTZmpQUldzSDU3?=
 =?utf-8?B?VWlDT0pXVDRZNndod2hVc3E5RDJoUnZtZ3NOOW5odTNONUVrd3J4THRhaG5X?=
 =?utf-8?B?RSs0eFdaTisvWk9ITGRvTjdkR1RRdzgrRXlrbk1YbVd4QU1TL1hQeUdQZ1VK?=
 =?utf-8?B?YUxmYU5mcjJSTFJQNWxIcStFOGwyWEhRbEo3V1o0SVN5R3RENUZUY25DVFAy?=
 =?utf-8?B?Q3ErbDBxajZjbCtvODAvVThzZUZIcUxoU0dEaE43YUxBYkx6UWhzL040eExX?=
 =?utf-8?B?UDdPMk1pbTdkRFp2a0FzVHIyT3dwRnlnbEVCR2ZBZnBTL3Q5ZU9uRUxlSjda?=
 =?utf-8?B?cDZsK0w2cy9zbC82QnNzZDl6dHAydnFSSlVLdktKaHZaWE5qR01pNWpoUVZT?=
 =?utf-8?B?aGRqaEdyajYyUTY1ZE0zMngwOVljb1llTHBlMzlWcjY0aTlKK2RaZEFlNGRM?=
 =?utf-8?B?b0pGaEZuQVRsbXBjdTh0bTZUUHQ1bndzbkxJNDJBNjdnNVRrNWxtTE1Nbmg3?=
 =?utf-8?B?ZkM3MHpRZDliL1UrdWMwNEszZWlYMmF0Q0ttSkRHZDhQajJYUUthTkFBTnRG?=
 =?utf-8?B?UjJDRnh0emxZdHo2ZDNKVmdOd3g1Z1Y1ZDREM25zRE9JTHBzellSYWpjcEJL?=
 =?utf-8?B?clY1RkV3emw4SXBNT0VtTTB3dWU0WG0yd2NoZHJYWVpSTkJ1RFpSUEJYVGNZ?=
 =?utf-8?B?Q2NTQnhJSTQrdGlGTGVXTFdyYlh3dldDaXQ5dElpZUlNNWJ0bnBvU3hqaHZo?=
 =?utf-8?B?MXc4eDl3TnUwVEphUnlOZW8rekxwaWZQOE1kYUl3YjN6VVJiQVVrdS9wNE9D?=
 =?utf-8?B?T1R3OGRXVDRhblpmRTcyZjVqWFZ1Mm1CUmJjQ3F0N290Q3YxbzBOOTJIaVJ0?=
 =?utf-8?B?OXlsc2lwWXhEWlVnZEtQcS9OK25lbWhtcjdJVXlBKzA0K0tPVmpQYkJIYVFR?=
 =?utf-8?B?NEl5dVJScjMxWkpZNUFoWFpad1MzY1liN00reWRwVUxyZ3NRTm1IcS9FUk9y?=
 =?utf-8?B?WWFaekxaeDgyeWRyZnBhSUxUSVVCOTBwei9RN2U4ZjVPZHRMSGhrdWIyRm1Q?=
 =?utf-8?B?dG1zbWR2bll4TzVkdzJHZjdqYjY4VXNubGlDV1huV1ZjS3RabGhGMXVqU3FB?=
 =?utf-8?B?cDZWZDVGa0JNdkowdnhvTmF5ZVJmTmVSQ3d1SUc0cHlzMEF5c2k3dG9EN01S?=
 =?utf-8?B?VzVXa0QyS3VZczhyUnIvbXdDeUt5Tk1kVzFXMUdQUmNvUlI4bTlBajUyaXRP?=
 =?utf-8?Q?UqXrgkLaOocUgprT1gHB9/TGj?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF2D25C8186F5D4BB6C50E2250249F79@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	x3jpm86JF2rOcGIZqSdNI0GiE0M6YQl/U5qieSPwG8vZazTY/XTfp07FHFM05uxgyu6PvhyL02YByUMnFf3kF8V9zy2gRtnPIHAW5W7NY+gnIOyI8MDgQg5Jgegzdc/YFohRBRU7l8AIqJzxyAEq93Ggip3Li2hrZuQ2Jrhr2oWn8ZG8zd4TTtPIY6QFb9xMLvymZmjeBdbLr9GvZ/0CUqsDux3rx1OfKMU90hxR6oCUSuy7ypu/Dddf/8eU/jExQjxMBoxFzlVLSl8x9/oO0GhU/RUM0n5/3Xy/TObGlYImCmOceaHf9R933URS2Qu+Ovae1Htec5TJ03BTRzCGJLrwfXHtKZoaJWIDzrJX0TSMk8+6HqoqA/Pb6Mj2C7LIhrDX9eNr+fn5voTxEaQORD9GtIJHggEuQdTDBBtzTL78Zeoh/OyI6MMIR/ivu0S47Qq7QALGQcHx16y8EyNUcMI0MNjV+CUZhId1sJDFjN9B8D5xwMy6muawUXEFU1Vlc7Wx6+rn+/kd3YFviwpPpqAN7ju7Cv5qQEeLv9oxA9SAoCl6pJQl0SeF5QgLTZFCye4Hixbbbtxrbe9lZYN4RANVsXengCgsKSMShOsdWg3QdoGIZ95o5TC/uSN55rZLqlwMpN/+9YV1THVbDGd8IZ4v7ItcvK88WlO5ywtx1N7gcYZ4veEVPLq4IwED1vuHsXIO+tSFtMSYozwIjnckpyKBIYhzwXmDqne/QW8e4kAIm3TI2DvWPW6Sut4Ph82cZNMw5DEUfjF0DzPv4ykIFKmHKKlKjJgAg68Np8NwJVM6EH8A8coOj0aCm8Rn5LgvO6Zy8YEAqUIVhS+1MPqcyHBcxeM8vCF8qaNWjlVCzK8=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb20483-1440-4cfa-d8c7-08da7eb63a80
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2022 12:03:55.6860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RjM3aEhfj0h+oDjmTDTaEMtswtEQBdfxiCkED9kB/5eKZvjvhadyf9L99zO1ZGlmG9pF5Ud64Ns1AtM5zBSMq0PR5wVOUK0E1l4NLT14wf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6970

T24gMTUvMDgvMjAyMiAxMjowNywgRHlsYW5nZXIgRGFseSB3cm90ZToNCj4gSGkgQWxsLA0KPg0K
PiBJdCB3b3VsZCBhcHBlYXIgdGhpcyBpc3N1ZSBpc24ndCBzcGVjaWZpYyB0byB0aGUgTGVub3Zv
IFlvZ2EgU2xpbSA3IFByb1gsIHNvbWVvbmUgZWxzZSBpbiB0aGUgUXViZXMgY29tbXVuaXR5IGlz
IGhhdmluZyB0aGUgc2FtZSBpc3N1ZSAoaHR0cHM6Ly9naXRodWIuY29tL1F1YmVzT1MvcXViZXMt
aXNzdWVzL2lzc3Vlcy83NjIwI2lzc3VlY29tbWVudC0xMjA5MTE0ODEwKQ0KPg0KPiBDYW4gYW55
b25lIHNoZWQgc29tZSBsaWdodCBvbiB3aGF0IHBvc3NpYmx5IG1pZ2h0IGJlIG1ha2luZyBhIFhl
biA0LjE0IEh5cGVydmlzb3IgY3Jhc2ggYWZ0ZXIgYXR0ZW1wdGluZyB0byBzdGFydCBhIGRvbVU/
IERvbTAgc3RhcnQncyBqdXN0IGZpbmUsIGl0ICdmZWVscycgbGlrZSBhIG1lbW9yeSB2aW9sYXRp
b24gb3IgRE1BL0lPTU1VIGlzc3VlLCBiZWNhdXNlIHRoZSBWTSBkb2VzIHN1Y2Nlc3NmdWxseSBz
dGFydCwgaG93ZXZlciAxIG9yIDIgc2Vjb25kcyBhZnRlciBpdCBzdWNjZXNzZnVsbHkgYm9vdCB0
aGUgbW91c2UgKGluIGRvbTApIGxvY2tzIHVwIGZvciAyLTMgc2Vjb25kcyBhbmQgdGhlIGVudGly
ZSBkZXZpY2UgcmVzZXRzLg0KPg0KPiBJIGNhbid0IHNlZW0gdG8gZ2V0IGFueSBsb2dzIGF0IGFs
bCwgeGVuJ3MgY29uc29sZSwgZG9tMCBkbWVzZyBhbmQgZG9tVSdzIGRtZXNnIGFsbCBhcHBlYXIg
dG8gYmUgZmluZSBpbiB0aGUgbGVhZCB1cCB0byB0aGUgY3Jhc2guIEkgYXNzdW1lIG5vIG9uZSBo
YXMgaGFkIGEgY2hhbmNlIHRvIHVzZSBYZW4gb24gUnl6ZW4gNjAwMCAoUmVtYnJhbmR0KSB5ZXQg
ZHVlIHRvIHRoZSBmYWN0IGl0J3MgaGFyZCB0byBnZXQgeW91ciBoYW5kcyBvbiB3aXRoIHRoZSBj
aGlwIHNob3J0YWdlIGV0Yy4NCj4NCj4gSSdtIGhvcGluZyBpdCdzIHNvbWV0aGluZyB0aGF0IGNh
biBiZSBmaXhlZCB3aXRoIGEgY21kbGluZSBmbGFnLCBpdCdzIHZlcnkgZnJ1c3RyYXRpbmcgaGF2
aW5nIHRoaXMgc2hpbnkgbmV3IGxhcHRvcCBzaXR0aW5nIG9uIG15IGRlc2sgOlANCg0KQXBwZW5k
IGAsa2VlcGAgdG8geW91ciBleGlzdGluZyBgdmdhPWAgb3B0aW9uIGZvciBYZW4sIGFuZCBhZGQg
dGhlDQpgbm9yZWJvb3RgIG9wdGlvbiB0b28uDQoNClRoYXQgc2hvdWxkIGNhdXNlIFhlbiB0byB3
cml0ZSBpdHMgYmFja3RyYWNlIG91dCBvdmVyIHdoYXRldmVyIHdhcyBvbg0KdGhlIHNjcmVlbi4N
Cg0KfkFuZHJldw0K

