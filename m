Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F62C4D6457
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 16:10:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289139.490545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSgty-0003LR-Q8; Fri, 11 Mar 2022 15:09:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289139.490545; Fri, 11 Mar 2022 15:09:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSgty-0003JW-Mm; Fri, 11 Mar 2022 15:09:58 +0000
Received: by outflank-mailman (input) for mailman id 289139;
 Fri, 11 Mar 2022 15:09:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3p0I=TW=citrix.com=prvs=06245b39f=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nSgtx-0003JE-21
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 15:09:57 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e5aac9f-a14d-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 16:09:55 +0100 (CET)
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
X-Inumbo-ID: 4e5aac9f-a14d-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647011395;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=5QfmejG/hFxU6elea9FKxA+jplT5zSanP1PZrhU7IKg=;
  b=acIvprps86UatS70fyvUTOfeDvccSL4dZief0p9Ihd5WQf7sdMdSpioz
   e8zRTB1rzbg1ChM2qHf+zOZ+UoyqqjN2L9Sc/VN9KEfKs11ZZ8Z5cQqyW
   +jwF+BAHgotgFLi/cytkvDIHKVro7KAleq3TVFRVvNwaksF6b8tXRCRk3
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68379949
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6vvL86s17RBF+c86pLIlpEkB9ufnVOdeMUV32f8akzHdYApBsoF/q
 tZmKW6OP6nbYWfyKd4la9yyoEJTsMPQzNc3GgFv/ChhQ3tH+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jU4
 IuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8pEaaLtc4aSSJqDn1DNvMb47XAGGKG5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllCxDfUS9MvRZnHSqPHzdRZwC0xloZFGvO2i
 88xN2o0M0WRP0wn1lE/LJkcoPeOrXXFTGcBhE/Ji7ds6krv01kkuFTqGIWMIYHbLSlPpW6mo
 WbB83X8EwstHtWVwjqY8VqhnubK2yj8Xeo6D6ak//RnhFmSwG07CxAMU1a/5/6jhSaWUd9FN
 1Yd/CZoqKEo7VGqVfH0RRj+q3mB1jYfVsRRFasm6QiL4qvS/wudQGMDS1ZpasEg8sk/RjUo1
 1qAt9LvGTFr9raSTBq16bO8vT60fy8PIgcqdSICCAcI/dTniIUylQ7UCMZuFravid/4Ei22x
 CqFxAA8iK8UltUjzLig8BbMhDfEjprUSg844C3HU2Tj6Rl2DKanbYG17VnQ7d5bMZ2UCFKGu
 RA5d9O2tb5US8vXzWrUHbtLTOrBC+u53CP0gXFkWLQL8C6WyWP/QIsOvSp0I35zC5NREdP2W
 3P7tQRU7Z5VGXKla65rfo68Y/gXIbjc+cfNDa6NMIcXCnRlXErepXw1OxbMt4z4uBV0yckC1
 YGnndFA5JrwIYBu13KISugUytfHLQhulDqIFfgXI/lKuIdyhUJ5q59ZYTNijchjtctoRTk5F
 f4GZqNmLD0FDIXDjtH/q9J7ELzzBSFT6WrKg8JWbPWfBQFtBXssDfTcqZt4JdA7zv8KybeQp
 ijjMqO99LYZrSSWQeltQio+AI4DoL4l9S5rVcDSFQrAN4cfjXaHs/5EKspfkUgP/+1/1/9kJ
 8TpiO3basmjvg/vomxHBbGk9dQKXE3y2WqmYnr0CBBiLsUIb1GYpbfZkv7HqXBm4tyf7pBl/
 dVNF2rzHPI+euiVJJ2POaz1kA/p4yR1dSAbdxKgH+S/sX7EqeBCAyfwkuU2M4cLLxDCzSGdz
 AGYHVETouylnmP/2IOhaXysx2txL9ZDIw==
IronPort-HdrOrdr: A9a23:cdCYLaxmgXhLNn4eGnwLKrPxgeskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9IYgBcpTiBUJPwJE81bfZOkMYs1MSZLXXbUQyTXc9fBOrZsnHd8kjFmNK1up
 0QCpSWZOeAbmSSyPyKmjVQcOxQgeVvkprY/ds2pk0FJWoBCsFdBkVCe32m+yVNNVJ77PECZf
 6hD7981lydkAMsH6OG7xc+Lor+juyOsKijTQ8NBhYh5gXLpyiv8qTGHx+R2Qpbey9TwJ85mF
 K10zDR1+GGibWW2xXc32jc49B9g9360OZOA8SKl4w8NijssAC1f45sMofy/wzd4dvfqmrCou
 O85yvIDP4DrE85uVvF5ycF7jOQlQrGLUWSkGNwz0GT+fARDwhKdPapzbgpDCcxrXBQ5u2UmZ
 g7rl6xpt5ZCwjNkz/64MWNXxZ2llCsqX5niuILiWdDOLFuI4O5ArZviX+9Pa1wVR4S0rpXWN
 WGzfuskMp+YBefdTTUr2NvyNujUjA6GQqHWFELvoiQ3yJNlH50wkMEzIhH901wua4VWt1B/a
 DJI65onLZBQosfar98Hv4IRY+yBnbWSRzBPWqOKRDsFb0BOXjKt5nriY9Frt2CadgN1t8/iZ
 7BWFRXuSo7fF/vE9SH2NlR/hXEUAyGLELQIwFllu9EU5HHNcnW2He4OSATeuOb0ociPvE=
X-IronPort-AV: E=Sophos;i="5.90,174,1643691600"; 
   d="scan'208";a="68379949"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fohVDD1BeulLuQhIZcDJ2RWGmdnqiYa1TKD3BByarW8X9mpdedKEdtdgrlM6QDABVhhi3XtBX0km7i8/dKPZEAHxkjeyBXQHTNLp/fS9cVdNmP0bISl57u5hs0QHWwq2jrpYMRuQSEmSmt3bHZm3gssnNhlD3GBRbnJgzpXdGuMdti7adI0csq2VB0y60EhsNZfC4+0jS4zw/zYQvkSBeL2IbjoeiBgOkYtRMAxBWORs8LcM0T4KoGLOa0heY8+zNFkp8JE+zmwDIvrQ2XQWp8mHe7PELZksmS/OYu/k6vO4U9grmiExxolOakOJjPjz6XhRpdj5qqyMotLlOq8lVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5QfmejG/hFxU6elea9FKxA+jplT5zSanP1PZrhU7IKg=;
 b=Qi/P0Qm5siX1KW18kwxOVk2Z63vgKilIur8J8fCiY7hs7jMlt1xqH2DNAhtZOUKGhixP7QnF7mMfC+fZehMnXXWCUiydyAFkhjW6tmGzZj9NFaPKyewKXUCPzhCcsAUAOjaXBcK9Pz9MdgmLCeAL9q446E76Ubx0/IYTouTxl6aj15r1/7XwtNabXng84BAK4ftyK01CByL4TW1Z6BPMhnMBUQ0JMRLjp8kGQ5SzS4Bknrs/kQu0JAyi9IcC7bnf2InSU77Vqvyiwrbhn+M24alq0UkFgvXlexpgl7K+UrakVkE/40/Ivo76kdbwH+Csv5OZ/MnroYJLmWXkRhrxSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5QfmejG/hFxU6elea9FKxA+jplT5zSanP1PZrhU7IKg=;
 b=YStvbN/5WvVSRf4VWRVpTSjHd2togAfOYM9r92rv32zuI6s8g8wVRyB2tLm3RcNPZ0diZsjMiSY6JE/yte4XxtM7mDEBnFthGKEJPSSdW2vEUDKgIq6IRrjL5tHjOsSqOsYfwzTj41NbQKE5qdCuZMR5z6PZZYnzvF1mfWEuBSo=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Anthony
 Perard" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>
Subject: Re: [PATCH v6 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Topic: [PATCH v6 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Index: AQHYMxKO2Blwl2qLLkWflNBa6+BEmqy23N6AgANxEQA=
Date: Fri, 11 Mar 2022 15:09:48 +0000
Message-ID: <c1f51c0f-b15a-d715-16f7-50abdbbcb5f2@citrix.com>
References: <20220307150609.10662-2-jane.malalane@citrix.com>
 <20220308173118.31490-1-jane.malalane@citrix.com>
 <YiiDIQY11N4hmmhv@Air-de-Roger>
In-Reply-To: <YiiDIQY11N4hmmhv@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cab4c000-96bd-4ff2-7df7-08da03712f41
x-ms-traffictypediagnostic: PH0PR03MB6573:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-microsoft-antispam-prvs: <PH0PR03MB65736A5004642D9B5129D34F810C9@PH0PR03MB6573.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WoRXA4LDe/mJFDXifYRP/qvc1m55zjPVTg3O4g1MyHdfcK8BC3sbMz0AH/VJBZ0rKcAgcuZQ/EKwBtNklbmVzvh8aZgDZUatbZN+3LnzB4W70OH53CneSgpYdBQeeWnYZJP5+fpM/B4ySXH5mOCdGcPQSxg/JtwtShBxAZ4/o4GtdkQU/1IxFmhvzUJfPrjBjKB0Hle2Whv5+KAvIIWdDx/Zw+DRaptuXruyaU+i96zWi9U/ZOvrK+VxCzEQmov2K7/4AqQF4xibo9YkdcC8KIYlLetUdaiUxkygl1TjZ15gNEsnLEgbgHYYgGbg4L3Cbr8BVa6LlwmYFEVXMWr213R6OY7eCEIYxj83ZBSXVpFq9kwnzOX4li11CVP5f8+5tvfqFQw4dWmie7PYumtBa3QVlBQxa64fWaI1V6TTBtja2xab7NKbWl1/dNkztTUU0+neurlL6/d3OWLMk9j2XWgxPvsu7l9gfbl9qTnzsOFxygRAIu2cRF7KbZPbKBQlIwWKCWc3Qd2CSB59VEQcb5riMnGqoFMS6NlH8HZPcGHCS6hCCSU4bIJc9kdOtZwH2dfvGb5zIRsCKYjOaxJowUCvZwgyREq7l6T+bOF01fbyIWfYpbkK9ZJTX4lx23ExjIB96AVOcivaqPVfgleD57J98d4+lhRTdPC288FmnDA6BrtSXzKxWFv4JWzb5qB0Oc6AEoV3gpXSaxVHz6tymQEfWexreaBjo1P7IpKo49p+iSi/0THHR2RG8I7hY6zj
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(54906003)(508600001)(37006003)(316002)(38070700005)(6636002)(38100700002)(31696002)(8676002)(66446008)(82960400001)(64756008)(6862004)(4326008)(66476007)(66556008)(122000001)(86362001)(91956017)(66946007)(76116006)(71200400001)(6486002)(6512007)(31686004)(2906002)(6506007)(53546011)(8936002)(36756003)(26005)(186003)(5660300002)(2616005)(83380400001)(7416002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L2RzNHFuYVpiR0lGSDRVSU5iTTRUeXVvTEE2cndyeCthZVllNGRBdEFic25V?=
 =?utf-8?B?V3Npb09vWGVkbnhVL2ZOSEsvZUZGeXlwVVc5SHJsRDhnMkRnQmkxMVlEcStV?=
 =?utf-8?B?VkZ3TnhSRHV5N0dwVVVOaGVtUmRlVGhjaW1xRUhLNFdRcEE2ZThzSEp6SytD?=
 =?utf-8?B?QVFWQ091eWdWZGhmQWdwRkVxZFUyQXZpaUp5cEZoSHh1bCtRVGpMeC9IbmFG?=
 =?utf-8?B?Y0hYYlBzYTVTYklaUzRIVlpkblBKNXdSWWZNZXZSR2xQQ0libDF6V3o0bk5E?=
 =?utf-8?B?Y2R1RjFMVDlXa0hqRHN3SU1sbFJEWnF4dFBEN1Q5a0NQTWMrK3RZcHg2L1Ny?=
 =?utf-8?B?cXJESlRidGZUZEZYQXVRSmxzbVRxanBGTWIxNGtYN25jbjU4V1liVnF6VXZF?=
 =?utf-8?B?ekQzNUcwOEZORjhITzlGUWZVYkRHZ041YjFlZVN6VFRuU0hhRnY0d296a0pj?=
 =?utf-8?B?TDh0OTNtL09LMHZsVFNkLzY1SUVzOXFwbkozOVV0NU83eTAzMWdoeHJXRWF0?=
 =?utf-8?B?UkZKMnpCMnFKS1pIM0pxNlFHTlMxQmkxa0RyZno0QVZXUFhOdHVRZENlRVQ4?=
 =?utf-8?B?V3FxL3dKTVVsemlTK3JaeWtFNTBPV2JBc2FFeVUzQWF1cE5zZDlYUTNuUW0r?=
 =?utf-8?B?Q3U3am91RTd4WTlOOFFYTmZ5V1N5M0ZCdFI1QlhXaE8vOUd4Q3hHWE9rQmNP?=
 =?utf-8?B?aXdyZzVFcWFKYmlRL3BZckd0dGsyc3RTQ0tDdHFQUUhrQzgxME1EN1kwdUIz?=
 =?utf-8?B?dUhIYWN2czVUMGVDQzRXb2Q4SXlYbzJuK1ZpYktreGxQT1NrZ0JkeUpieGla?=
 =?utf-8?B?SmdHU3BWWmFrcS9pWWRhRUxHZHZtanR3M3kvUkJ2NWxaT3d4anZWVmRrbmRn?=
 =?utf-8?B?TzNrK0VGWWNNcnZNYmZ3N1Z3Wi9OTXZVWHkyN0pudFpkbHo0NXppR3hHdkl5?=
 =?utf-8?B?a1VPdEZtWE1RM0I0OVkyd1ZRQmJPeS9kNUFxMXR5Qy9WV0FMWEhVT25LamdU?=
 =?utf-8?B?akp5cnRhLzE1UFI1TW9iR3lUV1ZLQm8raWZSM2dLUUltcU1SeUdxamNYK0U5?=
 =?utf-8?B?S0ZWb2NHNmNBOEpYd1hIS0krRWszUGoyWWo1dHlUZHYrSTlodGpIZ3ByR0Fj?=
 =?utf-8?B?OFFqdEZKVFNRWUtXUXRUMVRtaHpmSnlHWi9hb3c4enBwMGlzM2pDSHp5alMr?=
 =?utf-8?B?TWJsKzBIVlgrdzV1OGFFU0JLb1lnT3VLZnRRUXpMZUIyVlNUSmxrUlYvL21E?=
 =?utf-8?B?bytReEdBSW1yTHR6amt6cmxndnRNSzdMdEtSMU9vdmhDY0M1d0VwdnN1QkJU?=
 =?utf-8?B?RGg1bGI5OUlOUWV0RzhJN3ZRQWRxWEZ1Y28zR0JaYUdTNXFjdi9DUnpoeTky?=
 =?utf-8?B?RWtPV3A2Vk91dHFxQ1NiQ0NoalF0RVprKzBEZTRtdEVPSWh4TVZWN2pUZTFJ?=
 =?utf-8?B?dHRNTUZVQzhZaHptTlpSRFo1eVFGU1k1aHd1OGllTlc3ZW54YjAwMy84aVhr?=
 =?utf-8?B?UVNpTDJtV2tqNDdsZ3I2UjJpcHZ2RWVNT1hEN3RaWXlpd2VZY01qSzhKKytr?=
 =?utf-8?B?Y3lxdXJTVjJmVFN4d3ZLRVJSd29MWjhTbVNsUTQ0RzRncmRiUTR5dHU3WlZN?=
 =?utf-8?B?WDU0RnllK0hTc3dDV2E2YWJTeVFySnVrZVUwb0RRVUFoUzFvN3JtaXRwVjBW?=
 =?utf-8?B?dXZROXdOUUhRcUdzUHlBWm9hOWFCWFpDSHIzWHJES3FxcCtsNXladWZ0SVcx?=
 =?utf-8?B?dXYrTGFlVkhKNHhmRzJYQlVoTjFIRzRVM0JUUzd2aWhKM1ZxaTNicmFrNnh4?=
 =?utf-8?B?U3JKSjFkRWlOMHh3SzluaUtuTjZyQ2paV3prb3B1em9iN2xOemg2STBoc0hk?=
 =?utf-8?B?b0NCRks5TlBEZlVLa2dZZHd0SzVMVVhrZ1VXd29Za0tNanpuNWVUZ3NtMi9r?=
 =?utf-8?B?V0hjdFFoQ29aSHdncGhRQVNwY2NxR09pbEpBUFVaVHdIdXpwK0tXaElMMktF?=
 =?utf-8?B?ZlAvS3RqTFl3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD30B3878408694588733855211FA44E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cab4c000-96bd-4ff2-7df7-08da03712f41
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2022 15:09:48.3793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QJ/sjtSa/CRx/77lvr8Z4LaIpBpga8eZIvy3/zLPtvRgqZSY+T5erA/AnwaierDzh9CVYw4siJpxarGVu0LN7zBlfrXuCLLhgTsqAS6dnsA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6573
X-OriginatorOrg: citrix.com

T24gMDkvMDMvMjAyMiAxMDozNiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gVHVlLCBN
YXIgMDgsIDIwMjIgYXQgMDU6MzE6MTdQTSArMDAwMCwgSmFuZSBNYWxhbGFuZSB3cm90ZToNCj4+
IEFkZCBYRU5fU1lTQ1RMX1BIWVNDQVBfWDg2X0FTU0lTVEVEX1hBUElDIGFuZA0KPj4gWEVOX1NZ
U0NUTF9QSFlTQ0FQX1g4Nl9BU1NJU1RFRF9YMkFQSUMgdG8gcmVwb3J0IGFjY2VsZXJhdGVkIHhh
cGljDQo+PiBhbmQgeDJhcGljLCBvbiB4ODYgaGFyZHdhcmUuDQo+PiBObyBzdWNoIGZlYXR1cmVz
IGFyZSBjdXJyZW50bHkgaW1wbGVtZW50ZWQgb24gQU1EIGhhcmR3YXJlLg0KPj4NCj4+IEhXIGFz
c2lzdGVkIHhBUElDIHZpcnR1YWxpemF0aW9uIHdpbGwgYmUgcmVwb3J0ZWQgaWYgSFcsIGF0IHRo
ZQ0KPj4gbWluaW11bSwgc3VwcG9ydHMgdmlydHVhbGl6ZV9hcGljX2FjY2Vzc2VzIGFzIHRoaXMg
ZmVhdHVyZSBhbG9uZSBtZWFucw0KPj4gdGhhdCBhbiBhY2Nlc3MgdG8gdGhlIEFQSUMgcGFnZSB3
aWxsIGNhdXNlIGFuIEFQSUMtYWNjZXNzIFZNIGV4aXQuIEFuDQo+PiBBUElDLWFjY2VzcyBWTSBl
eGl0IHByb3ZpZGVzIGEgVk1NIHdpdGggaW5mb3JtYXRpb24gYWJvdXQgdGhlIGFjY2Vzcw0KPj4g
Y2F1c2luZyB0aGUgVk0gZXhpdCwgdW5saWtlIGEgcmVndWxhciBFUFQgZmF1bHQsIHRodXMgc2lt
cGxpZnlpbmcgc29tZQ0KPj4gaW50ZXJuYWwgaGFuZGxpbmcuDQo+Pg0KPj4gSFcgYXNzaXN0ZWQg
eDJBUElDIHZpcnR1YWxpemF0aW9uIHdpbGwgYmUgcmVwb3J0ZWQgaWYgSFcgc3VwcG9ydHMNCj4+
IHZpcnR1YWxpemVfeDJhcGljX21vZGUgYW5kLCBhdCBsZWFzdCwgZWl0aGVyIGFwaWNfcmVnX3Zp
cnQgb3INCj4+IHZpcnR1YWxfaW50cl9kZWxpdmVyeS4gVGhpcyBhbHNvIG1lYW5zIHRoYXQNCj4+
IHN5c2N0bCBmb2xsb3dzIHRoZSBjb25kaXRpb25hbHMgaW4gdm14X3ZsYXBpY19tc3JfY2hhbmdl
ZCgpLg0KPj4NCj4+IEZvciB0aGF0IHB1cnBvc2UsIGFsc28gYWRkIGFuIGFyY2gtc3BlY2lmaWMg
ImNhcGFiaWxpdGllcyIgcGFyYW1ldGVyDQo+PiB0byBzdHJ1Y3QgeGVuX3N5c2N0bF9waHlzaW5m
by4NCj4+DQo+PiBOb3RlIHRoYXQgdGhpcyBpbnRlcmZhY2UgaXMgaW50ZW5kZWQgdG8gYmUgY29t
cGF0aWJsZSB3aXRoIEFNRCBzbyB0aGF0DQo+PiBBVklDIHN1cHBvcnQgY2FuIGJlIGludHJvZHVj
ZWQgaW4gYSBmdXR1cmUgcGF0Y2guIFVubGlrZSBJbnRlbCB0aGF0DQo+PiBoYXMgbXVsdGlwbGUg
Y29udHJvbHMgZm9yIEFQSUMgVmlydHVhbGl6YXRpb24sIEFNRCBoYXMgb25lIGdsb2JhbA0KPj4g
J0FWSUMgRW5hYmxlJyBjb250cm9sIGJpdCwgc28gZmluZS1ncmFpbmluZyBvZiBBUElDIHZpcnR1
YWxpemF0aW9uDQo+PiBjb250cm9sIGNhbm5vdCBiZSBkb25lIG9uIGEgY29tbW9uIGludGVyZmFj
ZS4NCj4+DQo+PiBTdWdnZXN0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKYW5lIE1hbGFsYW5lIDxqYW5lLm1hbGFsYW5l
QGNpdHJpeC5jb20+DQo+IA0KPiBPdmVyYWxsIExHVE0sIGp1c3Qgb25lIHF1ZXN0aW9uIGFuZCBv
bmUgbml0Lg0KPiANCj4+IGRpZmYgLS1naXQgYS90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxf
c3R1YnMuYyBiL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybF9zdHVicy5jDQo+PiBpbmRleCA1
YjRmZTcyYzhkLi43ZTljMzJhZDFiIDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMvb2NhbWwvbGlicy94
Yy94ZW5jdHJsX3N0dWJzLmMNCj4+ICsrKyBiL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybF9z
dHVicy5jDQo+PiBAQCAtNzEyLDcgKzcxMiw3IEBAIENBTUxwcmltIHZhbHVlIHN0dWJfeGNfc2Vu
ZF9kZWJ1Z19rZXlzKHZhbHVlIHhjaCwgdmFsdWUga2V5cykNCj4+ICAgQ0FNTHByaW0gdmFsdWUg
c3R1Yl94Y19waHlzaW5mbyh2YWx1ZSB4Y2gpDQo+PiAgIHsNCj4+ICAgCUNBTUxwYXJhbTEoeGNo
KTsNCj4+IC0JQ0FNTGxvY2FsMihwaHlzaW5mbywgY2FwX2xpc3QpOw0KPj4gKwlDQU1MbG9jYWwz
KHBoeXNpbmZvLCBjYXBfbGlzdCwgYXJjaF9jYXBfbGlzdCk7DQo+PiAgIAl4Y19waHlzaW5mb190
IGNfcGh5c2luZm87DQo+PiAgIAlpbnQgcjsNCj4+ICAgDQo+PiBAQCAtNzMxLDcgKzczMSw3IEBA
IENBTUxwcmltIHZhbHVlIHN0dWJfeGNfcGh5c2luZm8odmFsdWUgeGNoKQ0KPj4gICAJCS8qICEg
WEVOX1NZU0NUTF9QSFlTQ0FQXyBYRU5fU1lTQ1RMX1BIWVNDQVBfTUFYIG1heCAqLw0KPj4gICAJ
CShjX3BoeXNpbmZvLmNhcGFiaWxpdGllcyk7DQo+PiAgIA0KPj4gLQlwaHlzaW5mbyA9IGNhbWxf
YWxsb2NfdHVwbGUoMTApOw0KPj4gKwlwaHlzaW5mbyA9IGNhbWxfYWxsb2NfdHVwbGUoMTEpOw0K
Pj4gICAJU3RvcmVfZmllbGQocGh5c2luZm8sIDAsIFZhbF9pbnQoY19waHlzaW5mby50aHJlYWRz
X3Blcl9jb3JlKSk7DQo+PiAgIAlTdG9yZV9maWVsZChwaHlzaW5mbywgMSwgVmFsX2ludChjX3Bo
eXNpbmZvLmNvcmVzX3Blcl9zb2NrZXQpKTsNCj4+ICAgCVN0b3JlX2ZpZWxkKHBoeXNpbmZvLCAy
LCBWYWxfaW50KGNfcGh5c2luZm8ubnJfY3B1cykpOw0KPj4gQEAgLTc0Myw2ICs3NDMsMTcgQEAg
Q0FNTHByaW0gdmFsdWUgc3R1Yl94Y19waHlzaW5mbyh2YWx1ZSB4Y2gpDQo+PiAgIAlTdG9yZV9m
aWVsZChwaHlzaW5mbywgOCwgY2FwX2xpc3QpOw0KPj4gICAJU3RvcmVfZmllbGQocGh5c2luZm8s
IDksIFZhbF9pbnQoY19waHlzaW5mby5tYXhfY3B1X2lkICsgMSkpOw0KPj4gICANCj4+ICsjaWYg
ZGVmaW5lZChfX2kzODZfXykgfHwgZGVmaW5lZChfX3g4Nl82NF9fKQ0KPj4gKwkvKg0KPj4gKwkg
KiBhcmNoX2NhcGFiaWxpdGllczogcGh5c2luZm9fYXJjaF9jYXBfZmxhZyBsaXN0Ow0KPj4gKwkg
Ki8NCj4+ICsJYXJjaF9jYXBfbGlzdCA9IGNfYml0bWFwX3RvX29jYW1sX2xpc3QNCj4+ICsJCS8q
ICEgcGh5c2luZm9fYXJjaF9jYXBfZmxhZyBDQVBfIG5vbmUgKi8NCj4+ICsJCS8qICEgWEVOX1NZ
U0NUTF9QSFlTQ0FQXyBYRU5fU1lTQ1RMX1BIWVNDQVBfWDg2X01BWCBtYXggKi8NCj4+ICsJCShj
X3BoeXNpbmZvLmFyY2hfY2FwYWJpbGl0aWVzKTsNCj4+ICsJU3RvcmVfZmllbGQocGh5c2luZm8s
IDEwLCBhcmNoX2NhcF9saXN0KTsNCj4+ICsjZW5kaWYNCj4gDQo+IEhhdmUgeW91IHRyaWVkIHRv
IGJ1aWxkIHRoaXMgb24gQXJtPyBJIHdvbmRlciB3aGV0aGVyIHRoZSBjb21waWxlcg0KPiB3aWxs
IGNvbXBsYWluIGFib3V0IGFyY2hfY2FwX2xpc3QgYmVpbmcgdW51c2VkIHRoZXJlPw0KQnVpbHQg
aXQgLSBubyBlcnJvci4NCg0KVGhhbmsgeW91LA0KDQpKYW5lLg==

