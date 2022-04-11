Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE8A4FBFD4
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 17:07:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303097.517099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndvcA-00033w-1q; Mon, 11 Apr 2022 15:06:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303097.517099; Mon, 11 Apr 2022 15:06:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndvc9-00031H-UU; Mon, 11 Apr 2022 15:06:01 +0000
Received: by outflank-mailman (input) for mailman id 303097;
 Mon, 11 Apr 2022 15:06:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GlEk=UV=citrix.com=prvs=093d95784=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1ndvc8-00031B-3M
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 15:06:00 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e309dc65-b9a8-11ec-a405-831a346695d4;
 Mon, 11 Apr 2022 17:05:57 +0200 (CEST)
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
X-Inumbo-ID: e309dc65-b9a8-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649689557;
  h=from:to:subject:date:message-id:mime-version;
  bh=tX4LrDZf9URSNHgMCuu0Ch2bal4s8kfhZMu1XyNujho=;
  b=T3VtuZFbHF/9NIbgWRYBKrzzhb+IaZo761a6LMwqXlESvfcZ20JW8QyD
   epiuGTv96Ewy7CZxM4namPTg2kbopnH6p9QJHXzTG59v/0pOEBkEjsiH7
   1v+lYOie3k3M9ccp0WDKiSjBoHhOQxp6WhgBX3fI+Bv0aZJmiAfhnl9ff
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67970421
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:yDdGn6AKGt/8NhVW//bjw5YqxClBgxIJ4kV8jC+esDiIYAhSlGxQk
 DNbHCvTJK7JMVJBSKklb4Xn/UkB6sDSnNY3TABtqXpnES8X8JPLXNjJIEuqNimYI8edQBM8t
 ZUXM4OedJxlFSWBqkr9beO7oXNw2avULlaQ5JYoHwgoLeMzYHtx2XqP4tIEv7OEoeRVIivV4
 9qq/ZyCaQX00WZ6Ym8etK/Y8Us/7P2psmsU5QNlaaEXsAfSmUdOAcNEL8ldDZdZrqq4vAKeb
 7yepF1s1jqBp3/BMvv8zvCjNBdirof6ZWBisFIPM0SZqkUE93RaPpoTbqJGMx8L0mzRxbid9
 f0W3XCOYVZxVkHzsLx1vylwS0mS6oUfpdcriVDm2SCi5xWun0nEmp2CP2lvVWEswc5lAHkmy
 BAtAGtlgiZvJQ6B6OnTpuFE3qzPJSRwVW8VkikIITrxVZ7KTX1fKkljCBAxMDoY36hz8fjii
 8UxRR1+dzfyRg11O15QB40fu96Zi1nESmgNwL6VjfJfD2n7yQVw1P7mMcbPe8zMTsJQ9qqaj
 juYpSKjWEhcbYHBj2remp6vrrancSfTd48VDrK1sNJ3hlma3kQYCQEMVEv9qv684qK7c4wAe
 hNMpnB3xUQ03BORRNf/QFqEnGXagQUhXJlSLLEDyB7Yn8I45C7GXzNZH1atcucOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRVLufgddE1FDuYO65thu0FSfFb6PDZJZkPXZPiDr4
 AKvvBI/jvIcku8s7pS23Wv+1mfESofyciY54QDeX2SA5wx/ZZK4a4HA1WU3/cqsP67CEADf4
 SFsd9y2qblXUMrTzHDlrPAlRunB2hqTDNHLbbeD9bEF/i/lxXOsdJs4DNpWdBYwaZZsldMEj
 SbuVeJtCH17YSDCgUxfOdvZ5yEWIU/IT4mNaxwsRoASCqWdjSfelM2UWWae3nr2jG8nmrwlN
 JGQfK6EVChGWPo+kmHrHrhMi9fHIxzSIkuJG/jGI+mPi+LCNBZ5t59YWLdxUgzJxPzd+1iEm
 zquH8CL1w9eQIXDjtr/quYuwaQxBSFjX/je8pUPHsbae1YOMDxxWpf5nOJ6E6Q4zvs9qws91
 izkMqOu4AGk3iOvxMTjQi0LVY4Dqr4j9SlrYnF2ZQ/ANrpKSd/H0ZrzvqAfINEP3Odi0eR1X
 78CfcCBCe5IUTPJ53IWapyVkWCoXE7Dad6mV8Z9XAUCQg==
IronPort-HdrOrdr: A9a23:glst1q5Zv60YkZ3rwgPXwMzXdLJyesId70hD6qkXc20zTiX4rb
 HLoB1/73TJYVkqNE3I9eruBEDiexPhHPxOj7X5VI3KNGOKhILCFuBfxLqn7zr8GzDvss5xvJ
 0QFpSW0eeAbmSSW/yKgjWFLw==
X-IronPort-AV: E=Sophos;i="5.90,252,1643691600"; 
   d="asc'?scan'208";a="67970421"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b7R8C3HYJk9QJdOu94WVT9Fmh704GOM7p+XzXTZYRDd538txSBLcJjPzBejLOBj0NNKVLHICC7j/LencSOCrz6VAutMi6pcsWuoERe5nJQGILv7qN0cG7gpHWZFl47LciTaXePGbOmMLAVG4uMhSV16p20a9Eukr/Itmp0c3vhc+hiv4Rek9J+SNIOlNWuyqfh5cx3A9SsK6eaO3yoaRheHBZK4pUWZwweTaaem7t2V1CjzRi3KEnvwQ8MGFpWxAQsr1k2uYNo86a8bBTpWCvGCH7x8kkEAy8xEmOdVgRmTdvxpE2XLYI6wk7BxoqV80iICaCwcJRHGA6fLIW+v8wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u2zAjHPIXAfdv6ROPQaLV/ElIIHhLZtWGtwgkdBv1fQ=;
 b=P5ChPWoREWKNUBxGQ06PxYEExxVLp+TLqI2t5gh4C8h1VNkACb+9BkXLN0464uT6bbX+ny0mGQ4dQMZ3eNsARionF3Y0xhI9zxSMkVi05mQuxwUCMQd3Bds0ifAHD4GzeOQMS4j2p1+oDPG90To1Kt2gWvKrG3JgponqAnzP1d7WvxwlYoq/bW0CnLiL+ZpaOecitsVf/UHpPNmuTDsswyEKnGNbScnV+DconR56AaxTcE+ZwUAtnuhZA1RrUlO/8ZSt5NGLrIUNOsPdyUPs6pJh1e+tD/rO540tCWYznaIvz54fh1gV89aQuEOzDD2EbAGntHILwHiPPvWShfBRvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u2zAjHPIXAfdv6ROPQaLV/ElIIHhLZtWGtwgkdBv1fQ=;
 b=GA4jCuwM6goSvhGvSjWQKdb8+lO6IUnYtJ3p7h8B9R4wKQwzkD/nR/k3MC63gmN7pYbRJIREX007qu6iVWmY0zQoTqf26wQjvc3oTgDDlbB0X9zyh3gifLZ/UawPRe2JMEKyQ6VdWt/SR191HVDMRLMvfU6oDhCRt4UQecoUiqg=
From: George Dunlap <George.Dunlap@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: POLL: Would you attend a Xen Summit in Cambridge UK in September?
Thread-Topic: POLL: Would you attend a Xen Summit in Cambridge UK in
 September?
Thread-Index: AQHYTbWggfwIEBqtTEiM1SeiAv50KA==
Date: Mon, 11 Apr 2022 15:05:48 +0000
Message-ID: <E5C4E167-B471-4E0D-A042-CE90CA432A9D@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 92437120-c7ff-4c6c-34d7-08da1bccc30e
x-ms-traffictypediagnostic: BYAPR03MB4824:EE_
x-microsoft-antispam-prvs: <BYAPR03MB48243A7E565753A1BC02703999EA9@BYAPR03MB4824.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +/mRYFB3gxbCd0B88+1ASgT+dhp72wJft32Ice1zJEvDPQL7yADsU/BB2AaKByrwp4G67dAptLW70fWQ2aDfdwOQU9ZuvBUbdk9CuWkbA5dO9loeJ1AeTwQ3J2QWSjdgZEIwWsbVDeAk2/Q4lgfYnOjW3XiiITQ+JTGKnDhx+I13uBZ/Q8HvgpeH8zppdp8n2TvCkPwdcQuHWYzhrr2myHEaBsg37z6PjJ4sLTDprVNm/nYpQGEA41P5RsH7EVZNz7wj9SOZoSfQCyZRJqdKNpm20oy1+JHYBGt9R6wpbk+aU4NO8QNWk2NeXeq0pv2izyUqWt5G9v/fPnpUAJWiQsFwH5ZBBE0FOH1trLLBuYbFvaKr85pf16HBwJHHxDm/pGPdR9x7yvQHW+LtMWKgg8JB98gPQ/gQlCvBTu3SzqqfZDawoaaJRmfTO3ywlYQVmMOYHnkRFsaN09t/BxSQCsWkCS8/3+OJzgfydpzQ2azEIpK/zau15Gmc2JHCGm4lG4UlnqxRhuel80BZ8O9kdWKiXRwM1dd1M8TC8TCEumNIn4aYsqDM4LASl8kdUNYlY2oIdZVQ6FiGyz6eaHBCJYRg1RGFH6ybavcB5U7GTFgEiucFWoH702HQcN9LeM1ZrPiLpjW4m2La73U+QyA5DYy75uPa/9Qa4oFp8NLmas1Jq6L+s9JS/jFe2KS+OO0Yy8PaVvGuAXSrb3CKcSe//3z4mk3aJfkazg4SAaqINKq70MqPfFZUQsGcghL5OIQroXf509DK8NtnmM5pGYfCU4BMqxTj+uGyczNrYg4kX1qdgGhP6GUtIaj+w+eNZAqf
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(5660300002)(8936002)(91956017)(76116006)(66946007)(66556008)(38070700005)(122000001)(6486002)(66476007)(6512007)(2616005)(186003)(26005)(33656002)(6506007)(36756003)(38100700002)(966005)(2906002)(86362001)(64756008)(66446008)(99936003)(8676002)(82960400001)(6916009)(316002)(508600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDlpelIwUHcwaUxzbTdFZlhPVnpLRXJVRW9TK05QOXVyQzUvNjZYZHhiYUI2?=
 =?utf-8?B?VkN5K0tCeE10QTA0b2VYWjFGeXZWaEdNWUtkcXNUc2tmSkNoeHBqRWZNek9z?=
 =?utf-8?B?VVNFUFF2emhiWVdWVU05dkxHNTloZlFkNjJXbVVkOFlmOU1WWFN2bDVwNXRC?=
 =?utf-8?B?SGZSQ25lSElJbTQ4cmZnOHZhYXF0UndWMjZKL25YQktTQTk2azYyR1U4Yzht?=
 =?utf-8?B?MHBST2VpKzBsMUFOZlAzelBpRWtDZ0E1QVFVcDVCeE5lMDhZNllaSTJpS2Vp?=
 =?utf-8?B?eTgxVDBHeEVFSk1qK3dmdUYvek1keWM3ZzFoQUlYSzI1OHhLSS9qZk4vOHp6?=
 =?utf-8?B?QUU2QnZyMnB6ejF2ZDVnTzU0TmduT09hd0pmMitVMjNaNlNBQTNsMGc1NWlX?=
 =?utf-8?B?dG45STBjSWloNWVUcWR1QmU5cWJTbGFsYmt2OGc5eXFscmJVbzFyR0xNbzlu?=
 =?utf-8?B?VVowbUFKSnBtQnN6bzB2eTBuUGRuOVphWkRUclJ1RzhxV3c1VXFiMGNndzds?=
 =?utf-8?B?Z3EycjVsNERKUjdUVzNYSzQ5dGVXLzl5cFlQMXVjYXQ4U0I3STViakU2bDlP?=
 =?utf-8?B?NUNoS3Q0REgrRXFQZ1gwS3V6WCtUSUNoV3YyaU9md0J0cWZ6MkZZNk1EdVV4?=
 =?utf-8?B?RVdvMFMzWkh1emtMTnBWNldjSkszbzJEQmNBVloyeGpYWDBZTDgyY0hrVmZM?=
 =?utf-8?B?Qi9MT3JEWjY3YVNmc2MxN0FYMXExd0N3cGRkSU1jVW15MkYwOG9PY2h0OXJo?=
 =?utf-8?B?UjBXblJMMEhYdTJVV05sYXM0L0pZWDhTWFF3WS9LZzFwM1RqRktNcFo2NG4w?=
 =?utf-8?B?czEyTkdsbVpqK3VkUlhSYjlQcWp6K1FITlZaNzZMMkdhTkgzeG5VckxZbVdP?=
 =?utf-8?B?ZzkyUmVWWmlGY0RMK1l0LzNJSXlMV2xvczhCVVU0dGFQSGE2MUVJRXcvNkpW?=
 =?utf-8?B?ZUdJVWtGRFFVakJieS8wcFA5RWUvbFB0VXcwaVpVYXJIV0c5QmNjRnpFRUd6?=
 =?utf-8?B?S1NlOExoUHEyampDMEI3VkgwbVRGbFVUWEhSaFAwazd6b3U0cEJtZFRuQzFZ?=
 =?utf-8?B?MlBZQmsvZGNhQXFXU3ZBSWI4Y2JuOUdEd3EyeW5hUEhBczE1YUtEM0pXM1do?=
 =?utf-8?B?bHZUYmRLNEtjOStRYUd3VW9nSHpGMW11RGYyY0M0U1VVWEtrRFVEa0xSczFR?=
 =?utf-8?B?a2hhRmhYVEpmOS9HQjJ3ZWpFWktjR0hJRU83TGR2VERCUG81UTlCSFcrNXFU?=
 =?utf-8?B?UU8rZVNWVXJEUFByNkl2b1RtMm0rdFhMTHdOTzZ5R2NwSGgxRDJ0MzZLeldN?=
 =?utf-8?B?NXJCVWFqU0ZtVWprSGFwVmxXMU03anpuZkRqYVNXMlZyTE14MlJ0dHZkYkpK?=
 =?utf-8?B?ODBsYUhaTGhheVR0SXFWbmcyWEVIZmdaM1NYd09odUpMbUFpQ1R0eGF4d2xL?=
 =?utf-8?B?QzNsY1hVSkZlSUJ3SG1NMmxIVkFYMXprVk1xOFpEM2RMdEZKaVloSkFHSDZz?=
 =?utf-8?B?REp2aXQyaGZlaXJJQ3g5Q3FLM3VMak1zYVNUNHhzUklKUkF6b1pYdldmY09k?=
 =?utf-8?B?Z0lvMHl4MnF2MzVWNUNIZ0o3RVJQOVhDelhIdUtMZzNLNllRRXp3Z0ZGSE5N?=
 =?utf-8?B?VU1ncVpxSTZVSXE0V1pGNnRCQkJLeWpzRVpUSkxOZzRaRDBFRCtqRTJxSjlU?=
 =?utf-8?B?UEVNa09HeUZQRWI5TEFTY3JpQ2NoZHA1R3BMNmZFMjJLR3dwY1JudXFSRVIx?=
 =?utf-8?B?WThJV0pNK3JENldFWjdncUt4U3JHUXRnUndiZ3o2WmFZU2wrUzJCNE1xUHZU?=
 =?utf-8?B?Q0JtQURjdkVRbCtFY21uN3MvU0x6NERxRHpoUmtRQnRJVHRNenhyZytmc2hj?=
 =?utf-8?B?YWtTRXJvc2JSNlpwQVBseHhMTENYR0R2UHNWRzhYNkN2SGg2M2hla3JFV0tT?=
 =?utf-8?B?Q3h5NE5GLzZFZDROTFZrT2lKQ3ZWYloyKzdVWVB4VmxUVVRCZWRtLzNYVFp5?=
 =?utf-8?B?NUUvS0NUU0p0MGg5amxyWDFlOE53NDdCNW8rWkFlN3RGUGNlVU13SVZyZ2dM?=
 =?utf-8?B?UHpwVlllZkpYM1FnRGsxcFhhemlRWnpKTExnNngweHc0dVBKaXNvQlJMcnVJ?=
 =?utf-8?B?enlmYnpYd0taQk13aVdZZm0reFN0dVBVVFdrNTdlUXF4UG9xQ3R6d3lLMTBz?=
 =?utf-8?B?MzRKVmNPYUdQblNxbmYyc09Gakp6UW5HLzRUN0VPbXh4LzlQYTlUV3pQVTV6?=
 =?utf-8?B?cWVMZkQwSWNqbmpzSFRkM3pjUjVpVFNseFpOYU1CdnRjQW1Ha2VzQU9tSEwv?=
 =?utf-8?B?NFVPeE1sbFIzc1MwbHlONjYyeU1UNGw3S1k0b2pWaDRxNlpqcHdYdzQ3UkVE?=
 =?utf-8?Q?iTnz501g3R5H++0k=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0A438884-E377-4976-8AA7-AA98F887DE73";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92437120-c7ff-4c6c-34d7-08da1bccc30e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2022 15:05:48.5175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GxlIqeyc+EJy5V5sXXHItd1waMAARA68ZOz2DKvN/3ruscHF3QtoGBxcZlhgsyortIG65XBy0PtPgj3JRnORJvV4VnFgfwJHmCLeoc91Pqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4824
X-OriginatorOrg: citrix.com

--Apple-Mail=_0A438884-E377-4976-8AA7-AA98F887DE73
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hello all,

EXECUTIVE SUMMARY

The current form of the Xen Summit this year we=E2=80=99re considering =
is as follows:

1. Two days of =E2=80=9Cprimarily virtual=E2=80=9D talks, with a =
physical add-on for those in the Cambridge UK area, or willing to fly =
there.  This would be relatively low-key, probably hosted on a company =
premesis; listening to the talks in some conference rooms, with catered =
food / coffee provided, and pub / meal sessions in the evening.

2. Two days of =E2=80=9Cprimarily physical=E2=80=9D discussion sessions, =
at the same location.

To help with location planning, please fill out the following survey:

=
https://cryptpad.fr/form/#/2/form/view/93hTkvOnhFQhmzydZ4fONMTr8AABMPAEEou=
-SIS1hww/

BACKGROUND

We had initially planned to have a =E2=80=9Cprimarily physical summit =
with a virtual add-on=E2=80=9D, similar to the summits we=E2=80=99ve had =
in the past, in Romania this year.  We have decided to do something else =
this year for a number of reasons:

1. Difficulties in scheduling with the originally intended venue

2. A war going on in the neighboring country

3. One of the important contributor companies (based in Cambridge) =
unlikely to be able to send anyone outside the country this year.

My original idea was to flip from =E2=80=9Cprimarily physical with a =
virtual add-on=E2=80=9D to =E2=80=9Cprimarily virtual with a physical =
add-on=E2=80=9D: have the talks primarily on Big Blue Button as with the =
last two years, but have some locations where people could watch the =
talks together in some conference rooms, and have evening pub sessions / =
meals for those on-site. This would allow people living within driving =
distance of Cambridge =E2=80=94 and anyone willing to come to Cambridge =
for a few days =E2=80=94 to get the face-to-face interaction which is so =
helpful for a project like ours, while not requiring us to find and pay =
for a full-blown conference venue.

At the last community call, however, it was pointed out that the design =
sessions are significantly reduced in effectiveness when they aren=E2=80=99=
t being done in person with a whiteboard.  Hence the proposal to make =
the design sessions primarily physical, and somewhat separate from the =
virtual part of the summit.

It=E2=80=99s still a work in progress; feedback is welcome.  But your =
response regarding the probability that you=E2=80=99ll be able to =
participate will help us plan.

Thanks,
 -George Dunlap

--Apple-Mail=_0A438884-E377-4976-8AA7-AA98F887DE73
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmJUQ8QACgkQshXHp8eE
G+06yQf/UbiwUcLPWCVqksaed10Nh1nOGhwg1jBmZKarQ6D4zNu1P/zmusYQw4Er
LYn0+dYsTy+vNOzW+6K24KWzVXYGE9J3vrwkH2qn5ejTLGuL3yD8WUqOUVjJM/kZ
3p47+AJvcfoblb0nuoGM+3QwhQPf8nHtC9su1aSnFho6S9gUtC0HDWbJqTayXHZT
irJV+ZFzfnrBB+Kjdd/tEgcjwWEyjJ1UxNKXK0i3tde9rNb4jMeBp91JlmRI9kFO
fEFY69VmcE1h/Jl+Wf1fZ4wAnO/YzJ+xZO8Y06NCI71YXahGdq2AWCzpc7oH75XP
oW8/PMAKtic7DlfkGhff1gIWvO6xRA==
=4HUC
-----END PGP SIGNATURE-----

--Apple-Mail=_0A438884-E377-4976-8AA7-AA98F887DE73--

