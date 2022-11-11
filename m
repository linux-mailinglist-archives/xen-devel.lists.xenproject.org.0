Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 751A062632C
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 21:47:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442706.697142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otavK-000701-QL; Fri, 11 Nov 2022 20:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442706.697142; Fri, 11 Nov 2022 20:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otavK-0006x1-Mj; Fri, 11 Nov 2022 20:46:50 +0000
Received: by outflank-mailman (input) for mailman id 442706;
 Fri, 11 Nov 2022 20:46:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=caZA=3L=citrix.com=prvs=307ecc5a5=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1otavI-0006wv-V6
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 20:46:49 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f42fb3b4-6201-11ed-91b6-6bf2151ebd3b;
 Fri, 11 Nov 2022 21:46:47 +0100 (CET)
Received: from mail-co1nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Nov 2022 15:46:36 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5634.namprd03.prod.outlook.com (2603:10b6:208:285::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 20:46:34 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 20:46:33 +0000
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
X-Inumbo-ID: f42fb3b4-6201-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668199606;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=LbQKZwwFb+48b2hZwngj2rcQlT1T0oyCgAu2QSPatl0=;
  b=Qq1IL/lWr9rHirhtI3T7S2sKvEPOOn9BM1r8TVZ6zByKWY53F17FpvLZ
   3C+GkmYd8L/ZUU0iZqzgoIiC58547cnTyY5Or9IK+01xNwaERAnGNhorR
   L7zA1269DI5arfIVtaLnfLyF3fKeOs9lP93nqsA9cp416QbbBJVzxkGYn
   I=;
X-IronPort-RemoteIP: 104.47.56.177
X-IronPort-MID: 83739244
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:YCG/nK3EklrggLk7xPbD5e9wkn2cJEfYwER7XKvMYLTBsI5bpzZTz
 zNLD2DTPK2OY2TzKI1/Ot+08UJX75GGytRhGwM6pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wVnPKgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfWnFvp
 PVFEyExNxm6n8mrmIOeb+lvmZF2RCXrFNt3VnBI6xj8VK9jareaBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvS6Kk1MZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXOgB9lDTuHknhJsqGO55U1NFhM5bgSE/9Wg1XLicdIPN
 1NBr0LCqoB3riRHVOLVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQGucksVHoV3
 1mGt9rzAHpkt7j9YX6U6Lq8tz65PikRa2gYakcsUg8t89Tl5oYpgXryos1LFae0ipj+Hmj2y
 jXT9Swm3exM0ogMyrmx+k3Bj3S0vJ/VQwUp5wLRGGW48gd+Y43jbIutgbTG0ct9wE+iZgHpl
 BA5dwK2tYji0bnlePSxfdgw
IronPort-HdrOrdr: A9a23:AK98DatHs7BD7etl35JuaRfd7skCXoAji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H6BEGBKUmslqKceeEqTPqftXrdyRGVxeZZnMffKlzbamfDH4tmuZ
 uIHJIOb+EYYWIasS++2njBLz9C+qjJzEnLv5a5854Fd2gDBM9dBkVCe3+m+yZNNWt77O8CZf
 6hD7181l+dkBosDviTNz0gZazuttfLnJXpbVovAAMm0hCHiXeF+aP3CB+R2zYZSndqza05+W
 bIvgTl7uH72svLiyP05iv21dB7idHhwtxMCIiljdUUECzljkKFdZlsQLqLuREyuaWK5EwxmN
 fBjh88N4BY6m/XfEuyvRzxsjOQngoG2jvH8xu1kHHjqcv2SHYREMxan79UdRPf9g4JoMx8+L
 gj5RPbi7NnSTf72Ajt7dnBUB9n0mCup2A5rOIVh3tDFaMDdb5qq5AF9k89KuZDIMu60vFjLA
 BdNrCa2B9kSyLdU5kfhBg3/DWYZAV2Iv5BeDlbhiXa6UkMoJkz9Tpk+CVWpAZ9yHt6cegF2w
 2MCNUXqFkFJPVmEp5VFaMPR9C6BXfKRg+JOGWOIU7/HKVCIH7VrYXriY9Frd1CVaZ4u6faoq
 6xJm9wpCo3YQbjGMeO1JpE/lTER3i8Ry3kzoVb64JisrPxSbL3OWnbIWpe2PeIsrEaGInWSv
 yzMJVZD7vqKnbvA59A20n7V4NJIXcTXcUJspIwWk6IoMjMNor239arOMr7Nf7oC3IpS2n/Cn
 wMUHz6I9hB9FmiXjvijB3YSxrWCzjCFFJLYd3nFsQoufsw39d3w3koYHyCl7G2ACwHtLAqd0
 1jJ76imr+npACNjBT101k=
X-IronPort-AV: E=Sophos;i="5.96,157,1665460800"; 
   d="scan'208";a="83739244"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKak4GeWZwSWTcqexCI3JtrTbXPIXgvIlfAzJZ9m5oblxH2zspH9vldoCft7QwxFuMqXUCmRDRQTfwhIhPq1DcbEc+8EvVIlh/Ag8+h6bxv2xQavjwX32aWtIcoAjvfiN1bPdhOHmvGpuc/4qu80We0qyJTTYHtBZykJ5bPVzDZBcnIUdpdR1Ry+eJ1V2L0avMpAe6PcfkuPxcltWu3+DQpiJni49xF4r2MSFDIOq6pg6jYC+zdMrDeDVh0WKsKp6WwTsSynQ/CN/6RBJWzE6n8237QiTKMIuKf8SVfUqPRxJb2P+na8TAGmayZs1KlgU/yjhw4ZOkmXUUeA0b4TfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LbQKZwwFb+48b2hZwngj2rcQlT1T0oyCgAu2QSPatl0=;
 b=MXyaniQTYZN+AmgGuVFNZah06bX6ZQBpvTykyK15gg1v3NqL8966sbUKO6ShEk/hvzFWLVAGFNe7m8+27IMxWHb73qJ20fsQntz/cnbvnfO+YhUHzlolkmKzTCZwrHeuDhyxAsx0ELrgocuv79QzC/sd654oCqH2mKBBorHeHwPRjflsaDCB6ht7E5Bo81tbWoHcK14FXs9PqTP6PTtR3MRzUoXAPMmJPXiHEt5SRbzKPk3x7x6ppkW+uRFleOwnHBdlUf0thVAiPQcAXHKD7+DXfHx6Z9k6yaZnnbpw+Idpg1i1DnhuSKurx6MPKAxdWrjpWpcvPNUsieOkd136AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LbQKZwwFb+48b2hZwngj2rcQlT1T0oyCgAu2QSPatl0=;
 b=XCUB3zQL0J9Wi+Yq5FNVoNfcPt9C9GG7sVU+x2jGacWGE4Y2nbg8ftPHaQSqEx7R6nQiuF9Yu1MQDLoXEpZzN8M8xEaGvvxiUqHlEfZGR4Ek0l18G681OagteDGounYZO7GX5GN9wprU8tn/PtstoPOYMFPYT43LaTr6UXgM0uY=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Summary: Re: [PATCH for-4.17 v3 00/15] OCaml fixes for Xen 4.17
Thread-Topic: Summary: Re: [PATCH for-4.17 v3 00/15] OCaml fixes for Xen 4.17
Thread-Index: AQHY84ewJ0jjWhTeBE61ayU/ec/VkK46Nk6A
Date: Fri, 11 Nov 2022 20:46:33 +0000
Message-ID: <75fef917-499d-ab02-9429-39ed59d87c97@citrix.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
In-Reply-To: <cover.1667920496.git.edvin.torok@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BLAPR03MB5634:EE_
x-ms-office365-filtering-correlation-id: b99dfc9a-2f9d-4cb8-37f7-08dac425d1d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 sXXK7sZMfaIRIb7ny2CX2bYopV8VEMAxAxxEtfMJbBDEEeFv7u3DazJJVx3gJGtKeWEWwWrkMZOfkaCFUUNiEsIsnv6oelAxHlVupCXE+iOLSSRMwTHfL3ctu0lt6GES7wOl0hJ7D//19ymIjZhkLSozJ4R0nPKc/zcSrEFI0CjXAhAH7ykNHDbJ2wNDw5i3wQ9hRmtaxe9iRmwg6PeSZ8vPXBLKQy0nCEUN3AVQHKE0X0MypvOoAFkgQo3Ip4EYQyWPL3XqLdjIKc7mCHOMZTXHHcm4XwvihpQ+kKZH5lk6GigtHdMNl3oqWN6vIkPwHH3T7csEZ5K/evfToAWNDFRTLLZUvS8dJ8l7nZND4FMTsob87AbBmlDrD2MPClP0d3dCvHaqKeoTUQIXAt9Z46GI83ZyKMNeX7fFFDPjZd5xO+/FuseS8dIYNJaWKa9UvalIUB2pA8t/BSr5+gjOoNoKxpBM145XZIs6bNZZdTR20zNwr+RzksNJCQm4Yg8zdH/tRYsfxMK0E9QgnBM7o77DN8nW/4aoEq9CbzafWuy44jPyKHTN506e6sHbhvTTUI1y6uzck25UncF7zakFQfFmXZ88l+m1I+5k8t6L+W/4PV713b0wy//uFyacg9WXEnwUtghNgi4HG/4AS8Upe/SCpBzPTeaT5VCulIKqAMsTXPQpuUKAMuuPQshJAaTaXzl8cDph+7IRSYgbbIynLp16GKiB29KUv+1Dm6ai+y7eCNIyIMuMbkyZNzgolnHVqrKDsMgWIhE9dtNrb78zb+NH5PKIXjhxn1yTqJnbQUHy+XKl9Pd6ApLKZjAvxc9DFEqub7QWUux65wLYuGmbPA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(39860400002)(376002)(366004)(451199015)(36756003)(38070700005)(31686004)(31696002)(86362001)(83380400001)(2906002)(5660300002)(2616005)(6506007)(26005)(6512007)(122000001)(38100700002)(186003)(82960400001)(110136005)(91956017)(71200400001)(76116006)(66899015)(107886003)(54906003)(6486002)(66476007)(316002)(66446008)(4326008)(8676002)(64756008)(66946007)(66556008)(8936002)(478600001)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cU01U3VicXM5OEx2bENTZmpidjdFSHdMTjRJcHMzUmJoQjJMZ1pqY3pDNk5p?=
 =?utf-8?B?eDdKaTVBUENQSGI1VTJrMnE1cVYvZDRBVis5Um81akx4QVlXUmxlSmhpYmZX?=
 =?utf-8?B?djYreDQ3a0xIWWxRKzkrUVd2Ynl2amY0dEVrc0poNHREWlJqZnZGU3h5cGc2?=
 =?utf-8?B?aHVDM2plemtzaTBtVjgxejhDV2tHd1EwQm1CeXlEZTZHQTdnNkNuQ0pOYVlW?=
 =?utf-8?B?ODQ0ZjFZUlVyRnhNbDdMQmlRaDc5ZVlvOHdJMkxHOTJYcHFpSkxOaG5OcS9I?=
 =?utf-8?B?UWNwSWY5THZoQ1VvSkNHQS9tU0llZWJYSWR5NkVNNnVocmtSbVQ5YTFEQ2hp?=
 =?utf-8?B?OHBwdm1LZ0pQZGZyb2hUNUdqbUV4SEZESUZCd0dER3JQYk8rWjJHVGt5NGxG?=
 =?utf-8?B?UDdWUEE4eVQxeTNpbmkvdDhJWGRHcnZqWFJHb0Mrb2QrUURBUnc2dmM1Yksx?=
 =?utf-8?B?WlpoZ05uVlZDcnNkS0ZTNTNRakQvWVJVS213Z3dxamJiV3lnVTAxeHg0dGs3?=
 =?utf-8?B?Q3UrMkIrUXpyL3NlZGFTUFF2M2dUcHdiTVZCSTdxZ05jSzdwQm1yYzNHYVdZ?=
 =?utf-8?B?NWJhem1FS1lsSWpjODhzMjByYU1EZkdtZmJTSXFpNkpPRll6dGc0WmVNV0Js?=
 =?utf-8?B?TzRvTG9jMTR3ajFKem9XdFliZHJVN2o2ZlkrQzVrVXZJaGl3RVVGZ1llOVA5?=
 =?utf-8?B?dTdvT0JXcUhvbTQ2VUVLeXhXM0IyUCtabWowcDZSa1ZqbTNIUm1UWldhL0o0?=
 =?utf-8?B?MjhkQWl6OG9LWUNlaTIvM01BZFhjZXJaQ0txRS9QV3pvdWNFOGVZTElYbklK?=
 =?utf-8?B?NWk3ZHZwdmdVSTJqTTdvb1Zka0R2VThmYVY4OWt2ZlpKT3B4SnJrTGdRSVNB?=
 =?utf-8?B?ZllMeUYrYmFNaUppK2daR3ZxZm5tNHdDajNaaHNVTk44VXZNV1gvdTZHZzRq?=
 =?utf-8?B?dzRQZzNoWjFqcmRWclJUSU9XdUZsY1pRclJaQmc2R05YSXlLUkJaQWU5UzY5?=
 =?utf-8?B?Y3RneHBqWEZUMllxZzY1TDNhUU9wenlEU1VKbnNKMEgwMUVhTVNmQlFzeGVj?=
 =?utf-8?B?c2ZrYUFIZ2FqMjJyM1poRDEwZW5VMSt1MTAyWW1WZ2NEak8xZnAxdEhmWmlZ?=
 =?utf-8?B?b3ZacHJjaTk4NjlTWEE5L0l3Q2ZUemxoNnFsdHVvdmlBSUYrR1A5djlyV2RU?=
 =?utf-8?B?bEtDOGpSU3BFbjVGbXpRd1ZUWTV6LzVFZ05DWWNLSlB4aytPWXR6SVJoendZ?=
 =?utf-8?B?Wk95Z25PYUpZSC9xOU1GV251SUxPYkZhY1dVelBRN3ZYenYyZTE0ZFJpQ3o5?=
 =?utf-8?B?cHpLY3hzMzZZTzFEcS9ibG5tQ29IQVdWaXRUVjhic1E2N2l5aUNhOENOZnBu?=
 =?utf-8?B?b0Y4dkJKUFRlRDdFbk1BdXRYbi9USlBHRytBdGhwc2lndi9Da0FVSllLRFU4?=
 =?utf-8?B?REhtOHlWTHc3Q0MwSU90cE9uSzJmWCtKRXVNbWdKdVhmQVZkTkVIajNHQTJO?=
 =?utf-8?B?em1ISU03WWRzUTBIVXV6eUJkTS84OEFqQ3NySTU1RUJneHBZU2V3Q29LeG5Y?=
 =?utf-8?B?UGNMQnZ3anI5cGM1cE9iNzZGckpreHh2SlZPZUxyc2x4aGlvSUNDS0FYcEUw?=
 =?utf-8?B?eGFubEFyUjRTejRLQTB2Ym1uREFPOWxSTFlvcDJvNnVUSkhzTHZnMnoraitU?=
 =?utf-8?B?WmhMNUxrVEdRbW9JS2hlcmUySSttbjY1NksrMWI0bTFEdGpIRGI2VTM1YnVl?=
 =?utf-8?B?dUZON1B4cllqUmx3RzliOWphUU1uRVpLNmlCWEpxWGVmM2Q4bVkxV0tSWUhw?=
 =?utf-8?B?WlBKSGpvb2ZuZkJ3d0hvN0g3bHhlR1ppbi91TFpjcU1peTM0SGdXR2gzNmdk?=
 =?utf-8?B?MzF5dmFtb2xvRmZUbFRzSVp6aVBGYXFJdEFKVXpoRjgvcXBJc0MvK1VHQTgw?=
 =?utf-8?B?WjRMY2M2ajcvMVVWcE9ZSmFYdlA4aEgwS1NwV3hxU3hUdnhwR21udnBoODhV?=
 =?utf-8?B?Znp1ZDQvMy85SWpwWDVLMTcxcGNWcTNBbkJWNERidHpXVDVKYVdMSWMrTWpx?=
 =?utf-8?B?QVgxNkVkQzdSSk9Tb2kyQktaNXBoVVI4Rnorb2hoTzNJUDVBb2pmNHpKbGdz?=
 =?utf-8?Q?h12q6XRKiaKZ+3BXXHVQLJH6i?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E7EA2D8D3841741A93DAC8F65169C76@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CyUQHMt698TG1ercIMdEA9DT8MdLTWW/t3h9A/rHFLWM9U9cH3POubhoNM4RaM0grK2vEh09X0/Xo0M8BNDc+iVcVUFkHnc17FbZun3Qpj4hfucyJjfgMhOf+kIhk6zCc8uFHbzQKA6+TlHCpxhCl5zcunRlP4HJiJXhdCJ/lXWcHFb18G16veSHcQI2D6vmpnbG1/lT/kXL+r4zjmk8cm7cgqRCaWwNcs9h0xSzK/Xt0Jj+rU+ITD2Ggc4gIWaOJ5ZLMWq43UooImNoC2w3jac6w6LkzDcdhPDs2pvS4eTP8UXT9R5F6TdESkM7XHIC+lWzcfO1bu+NdyhbJRcTUK/Zj9eGMDJbNWQQcdaotoqbg0SsFChIm35WFjvOEx4TOBpSZJ40G9va6GXSc0CS7KD6dpLsC18l80DJf6/hvh4vMo+dWCqDJ9U9c1QpbIEYSFkt8cvwSAXmLBQxCgBtR2h2PV5aJGlxg4DLQ/+p/gcVWcadcKH4EdyUggOAzYY6jJj91RdDFi6PHS926cVe5WYXILNDoQGwA1Iii3ljSPpuW33vvaTjTLKYznKnhLTcexVmu0Au04l7vCHKiII++rV2hWfweuvm4ZExRib9HFyT/XAoiKqv1KAkVaL4sIuVUa/kA1+HNAwxmPmyiITaqRqsTSG3tXoPKTwukwtSvCpYpjQ21AV5UjZsFtgWVtuUG2sJTVsooiZaDsmedXYfN5zTTdJuMGDQ5HaLczh4zsrL7Hl15M6TvypRBxz3m8opAE2kDYYrmON2BvI9cYGcaqQCz8qv01uN4IRu9+3N8yKgqYdMbpmqZ83x2KkyiCn9hoR30eIQOcbfNpb6pX6BwY71fRZ/NXIk8OZSaZ6DfQE=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b99dfc9a-2f9d-4cb8-37f7-08dac425d1d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2022 20:46:33.8795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6CHb9vJx8BbiyDbQNeg1gefSR0sxwfYwJrrBbuuFOw7g7K+IMsBw7JZLGZH5aO24bLQE4L/IK4vRj1GZFmUl3W4/DUGx8xk61c+y8omJMB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5634

Tm90aGluZyBoZXJlIGlzIGNyaXRpY2FsIGVub3VnaCB0byBnbyBpbnRvIDQuMTcgYXQgdGhpcyBq
dW5jdHVyZS4NCg0KVmFyaW91cyBub3Rlcy9vYnNlcnZhdGlvbnMgZnJvbSBoYXZpbmcgc3BlbnQg
YSBkYXkgdHJ5aW5nIHRvIHVudGFuZ2xlDQp0aGluZ3MuDQoNCjEpIFBhdGNoZXMgNS82IGFyZSBh
IHNpbmdsZSBidWdmaXggYW5kIG5lZWQgbWVyZ2luZy7CoCBFeGNlcHQgdGhlcmUgd2FzDQphbHNv
IGFuIGVycm9yIHdoZW4gdGFraW5nIGZlZWRiYWNrIGZyb20gdGhlIGxpc3QsIGFuZCB0aGUgbmV0
IHJlc3VsdA0KcmVncmVzc2VzIHRoZSBvcmlnaW5hbCBvcHRpbWlzYXRpb24uwqAgSSBoYXZlIGEg
Zml4IHNvcnRlZCBpbiBteSBsb2NhbCBxdWV1ZS4NCg0KMikgVGhlIGluZGVudGF0aW9uIGZpeCAo
bm90IGF0dGFjaGVkIHRvIHRoaXMgc2VyaWVzKSBzaG91bGQgc2NvcGUgdGhlDQpsb2dpYywgbm90
IGRlbGV0ZSBhIGRlYnVnIGxpbmUgd2hpY2ggd2FzIHByZXN1bWFibHkgYWRkZWQgZm9yIGEgZ29v
ZA0KcmVhc29uLsKgIEkndmUgZ290IGEgZml4IHRvIHRoaXMgZWZmZWN0IGluIG15IGxvY2FsIHF1
ZXVlLCBhbmQgd2UgY2FuDQpkaXNjdXNzIHRoZSBwcm9zL2NvbnMgb2YgdGhlIGFwcHJvYWNoIGlu
IGR1ZSBjb3Vyc2UuDQoNCjMpIFBhdGNoIDEsIGV2dGNobiBPY2FtbCA1LjAgY29tcGF0LCBpcyBz
dGlsbCBtaXNzaW5nIHNvbWUgY29ycmVjdGlvbnMNCndoaWNoIEkgZ2F2ZSBvbiBlYXJsaWVyIHBv
c3RpbmdzLsKgIEkndmUgZml4ZWQgaXQgdXAgbG9jYWxseSBpbiBteSBxdWV1ZS4NCg0KSSBhbHNv
IG5vdGljZSwgd2hpbGUgcmV2aWV3aW5nIHRoZSB3aG9sZSwgdGhhdCBzdHViX2V2ZW50Y2huX2lu
aXQoKQ0KcGFzc2VzIE5VTEwgYXMgYSBsb2dnZXIsIHdoaWNoIGhhcyB0aGUgc2lkZSBlZmZlY3Qg
b2YgbGlieGVuZXZ0Y2huDQppbnN0YW50aWF0aW5nIGEgZGVmYXVsdCBsb2dnZXIgd2hpY2ggdGFr
ZXMgY29udHJvbCBvZiBzdGRvdXQvc3RkZXJyLsKgDQpXaXRob3V0IHN0YXJ0aW5nIHRoZSBmaWdo
dCBvdmVyIHRveGljIGxpYnJhcnkgYmVoYXZpb3VyIHlldCBhZ2FpbiwgaXQNCm9jY3VycyB0byBt
ZSBpbiB0aGUgY29udGV4dCBvZiBQYXRjaCAxMywgdW5jYXVnaHQgZXhjZXB0aW9uIGhhbmRsZXIs
DQp0aGF0IGluIG94ZW5zdG9yZWQsIGFueSBsb2dnaW5nIGZyb20gdGhlIEMgbGV2ZWwgbmVlZHMg
dG8gZW5kIHVwIGVsc2V3aGVyZS4NCg0KV2hpbGUgd2UgZG8gaGF2ZSBvY2FtbCBiaW5kaW5ncyBm
b3IgeGVudG9vbGxvZywgbm90aGluZyB1c2VzIGl0LCBhbmQNCm5vbmUgb2YgdGhlIG90aGVyIGxp
YnJhcmllcyAoc2F2ZSB4bCwgd2hpY2ggaXNuJ3QgdXNlZCkgaGF2ZSBhIHdheSBvZg0KcGFzc2lu
ZyB0aGUgT2NhbWwgWGVudG9vbGxvZyBkb3duLsKgIFRoaXMgcHJvYmFibHkgd2FudHMgcmV0aGlu
a2luZywgb25lDQp3YXkgb3IgYW5vdGhlci4NCg0KNCkgUGF0Y2hlcyAyLzMuwqAgQWxsIHRoZXNl
IGxpYnJhcmllcyBoYXZlIGZhciB3b3JzZSBwcm9ibGVtcyB0aGFuDQpldnRjaG4sIGJlY2F1c2Ug
dGhleSBjYW4gZWFzaWx5IHVzZS1hZnRlci1mcmVlLsKgIFRoZXkgYWxsIG5lZWQgdG8gYmUNCkN1
c3RvbSB3aXRoIGEgZmluYWxpc2VyLg0KDQo1KSBQYXRjaCA0LsKgIFRoZSBjb21taXQgbWVzc2Fn
ZSBzYXlzICJBIGJldHRlciBzb2x1dGlvbiBpcyBiZWluZyB3b3JrZWQNCm9uIGZvciBtYXN0ZXIi
LCBidXQgdGhpcyBpcyBtYXN0ZXIuwqAgQWxzbywgaXQncyBub3QgYSBwcmVyZXF1aXNpdGUgZm9y
IGENCnNlY3VyaXR5IGZpeDsgbWVyZWx5IHNvbWV0aGluZyB0byBtYWtlIGEgZGV2ZWxvcGVycyBs
aWZlIGVhc2llci4NCg0KNikgVGhlIHJlLWluZGVudCBwYXRjaC7CoCBQb2xpY2llcyBvZiB3aGVu
IHRvIGRvIGl0IGFzaWRlLCBoYXZpbmcgdHJpZWQNCnVzaW5nIGl0LCB0aGUgZm9ybWF0IGFkanVz
dG1lbnQgaXMgaW5jb21wbGV0ZSAocnVubmluZyBvY3AtaW5kZW50IGdldHMNCm1lIGRlbHRhcyBp
biBmaWxlcyBJIGhhdmVuJ3QgdG91Y2hlZCksIGFuZCB0aGVyZSBuZWVkcyB0byBiZSBzb21lDQou
Z2l0aWdub3JlIGNoYW5nZXMuDQoNClRoYXQgc2FpZCwgaXQgaXMgdXN1YWxseSBmcm93bmVkIHVw
b24gdG8gaGF2ZSBsb2dpYyBkZXBlbmRpbmcgb24gYmVpbmcNCmluIGEgZ2l0IHRyZWUuwqAgVGhp
cyB3YXMgcGVyaGFwcyBhIGJpZ2dlciBkZWFsIGJhY2sgd2hlbiB3ZSB1c2VkIGhnIGJ5DQpkZWZh
dWx0IGFuZCBtaXJyb3JlZCBpbnRvIG11bHRpcGxlIFNDTXMsIGJ1dCBpdCdzIHN0aWxsIGV4cGVj
dGVkIG5vdCB0bw0KcmVseSBvbiB0aGlzLg0KDQo3KSBQYXRjaCA4LCBldnRjaG4gZmRvcGVuLCBp
cyB0d28gc2VwYXJhdGUgcGF0Y2hlcy7CoCBPbmUgYWRkaW5nIGZkb3BlbiwNCmFuZCBvbmUgYWRk
aW5nIGEgTk9DTE9FWEVDIGFyZ3VtZW50IHRvIHRoZSBleGlzdGluZyBpbml0Lg0KDQpUaGV5IHdh
bnQgc3BsaXR0aW5nIGluIHR3by7CoCBmZG9wZW4oKSBvdWdodCB0byBwYXNzIGZsYWdzIHNvIHdl
IGRvbid0DQpoYXZlIHRvIGJyZWFrIHRoZSBBQkkgYWdhaW4gd2hlbiB0aGVyZSBpcyBhIGZsYWcg
bmVlZGluZyBwYXNzaW5nLCBhbmQNCmNsb2V4ZWMgcHJvYmFibHkgc2hvdWxkbid0IGJlIGEgYm9v
bGVhbi7CoCBXZSBzaG91bGQgZWl0aGVyIHBhc3MgYSByYXcNCmludDMyLCBvciBhIGxpc3Qtb2Yt
ZW51bXMgbGlrZSB3ZSBkbyBpbiB0aGUgeGVuY3RybCBzdHVicy7CoCBBbHNvLCB0aGlzDQpwYXRj
aCBoYXMgaW5oZXJpdGVkIGVycm9ycyBmcm9tIHBhdGNoIDEuDQoNCjkpIFBhdGNoZXMgOCB0aHJ1
IDE1IG5lZWQgdG8gYmUgdGhlIG90aGVyIHNpZGUgb2YgdGhlIGludGVudCBwYXRjaCwNCmJlY2F1
c2UgdGhleSBuZWVkIGJhY2twb3J0aW5nIHRvIGJyYW5jaGVzIHdoaWNoIHdpbGwgbmV2ZXIgZ2V0
IGl0LsKgIFRoaXMNCmlzIHdoeSBidWdmaXhlcyBhbHdheXMgZ28gYXQgdGhlIGhlYWQgb2YgYSBw
YXRjaCBzZXJpZXMsIGFuZA0KaW1wcm92ZW1lbnRzIGF0IHRoZSB0YWlsLg0KDQoxMCkgUGF0Y2gg
MTIgdGFsa3MgYWJvdXQgZGVmYXVsdCBsb2cgbGV2ZWxzLCBidXQgdGhhdCdzIGJvZ3VzDQpyZWFz
b25pbmcuwqAgVGhlIG1lc3NhZ2VzIHNob3VsZCBiZSB3YXJuaW5ncyBiZWNhdXNlIHRoZXkgbm9u
LWZhdGFsDQpleGNlcHRpb25hbCBjYXNlcy4NCg0KMTEpIFBhdGNoIDE0IHRhbGtzIGFib3V0IHVz
aW5nIGNhbWxfc3RhdF9zdHJkdXAoKSwgYnV0IGRvZXNuJ3QuDQoNCn5BbmRyZXcNCg==

