Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3DF25D578
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 11:54:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kE8Q3-0006UE-43; Fri, 04 Sep 2020 09:54:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V0SP=CN=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kE8Q1-0006U9-3j
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 09:54:05 +0000
X-Inumbo-ID: fd93b48e-24f2-4534-a7c0-956973d1b269
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd93b48e-24f2-4534-a7c0-956973d1b269;
 Fri, 04 Sep 2020 09:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599213244;
 h=from:to:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=KTq+jWYju0ycs2BrVwLWRkAMyFei9I+NZ0v+8Az1+Eg=;
 b=NZodBow7IK+jszrj4sAml06pp0Pyk0O9Jp16Iaqy4UC1eWxtIHXZ9JuN
 gbeVVaOLYRcstB+nin10ZNkjs8hSKRn/9OA4ZgKa9cqbpOpA9kcCUTJ/A
 FJnLg28WA3Knu38y24W7OIUPr9F5EGoXHBMK5OssGX6x1ny1ZctM8w56B I=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=pass (signature verified)
 header.i=@citrix.onmicrosoft.com
IronPort-SDR: +2EajEvOJxQXN5k7uui/zC7hxr2upEPZOlooLsiPd9twsn1NJi/PCx61cBysNrqZqEpDEPHHlz
 1Nl9cd6UKfTBLaAz5IALRv2iGBOQIYepPg6+pDpvvSyMEYeY/m39AH/srDY5TRKpntFyHxa2Eh
 iUTKcHftQiyfkGcgssVySsg6QwTrFwyrU7wJsxHLfFL3VtVHnIkLGLY5iZEA4cHnoLhnd1M6Ua
 iUXY895vPbZEQb1kte+nLRaQSZJDT8XOIvm93neAbx07C47ZvCygdbn8vnfEzUpqDdIiLeyBvD
 H4Q=
X-SBRS: 2.7
X-MesageID: 26005261
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,389,1592884800"; d="scan'208";a="26005261"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G04AQp3wXEoG/U06EolAZ1lC+Azhh/oakSTkYJeS5MFLKwLJTPs3FYYJzufa1A5YKYa3qhHtWtke6rmOqz1NCwoUYAuYIv9g3j9igLAsfFzkbmDnuQx82RV1KSQM4URb7mb3yiNNzg24gXcos/gFhaj7+RSzb/bjfIrEtf7lBHbxI5NciDDEp1GcPWjYmq/xNDwGa9WDpoeRSkvHv8uB6mMSMCGmbWit9qnGzhZiNhc9+rpZ5u52Zp9gnGJccX3/QbKLCekqDf07GFvplu11GmqSj8eIsspQBj67qFgNE7wiuk2/PfL4FUj0a20el8zP77dPsi44k5FQ4ybK3cwAYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTq+jWYju0ycs2BrVwLWRkAMyFei9I+NZ0v+8Az1+Eg=;
 b=NixG6egl7tEjNdU3ACZwMSg7hEr2fgktMe0LN/TVIzfoYxddiLf+u4BimNZPlptJjobqZBOeDy5H2Jcc9TPqv4qupKTsiBfRypj98KliqjwimJyP9bRqfN1KT/BOjvhI9DiFigj1PUSTrUShQzOSL3yQq8kWd7atkn2fULgrNufi1/pfq+uM+sdX+yTja5LqUspzOU07ylJyCLEiXos+dW4sERhQ9XZCdxhGtalW0mnRRTtdYZxyKRhwBSPJawyXRtb3KEbq6H0cceRQWWXGndJqxhbv/fyuteEhrHr0OMoWrwlnDA68DrFGtB4IUxB+tjDNm5mPVi1xNbSHse/eAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTq+jWYju0ycs2BrVwLWRkAMyFei9I+NZ0v+8Az1+Eg=;
 b=vf2+/Tn1EJ+D99ERIwEWjJnyQLYjS6D1wa6aT4pt34+VOXyvTemzc1AYQoV44H6Ja34hSzyVdUEieX4D/eZTYGMnfwRnzWgzzLsRmN3IZ1INEDVuMK7SSqiqsgIK8ILJm3QelFwJd7S5NPlpfybNKetoUQtcJ7v7/Gp425NI0SM=
From: George Dunlap <George.Dunlap@citrix.com>
To: "open list:X86" <xen-devel@lists.xenproject.org>
Subject: Continuing the Gitlab experiment: Single-patch PRs for gitlab
Thread-Topic: Continuing the Gitlab experiment: Single-patch PRs for gitlab
Thread-Index: AQHWgqFQIv5YQfrx8UWhPeAs1v6hhg==
Date: Fri, 4 Sep 2020 09:54:00 +0000
Message-ID: <78D90C74-945A-4B2C-9A7C-78EC0B623C04@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: efb2610c-3580-4b03-681e-08d850b872cb
x-ms-traffictypediagnostic: BYAPR03MB3637:
x-microsoft-antispam-prvs: <BYAPR03MB363715BBE205466DEC9BECD2992D0@BYAPR03MB3637.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MO7yj3YFEuBKAPE0EjM+Fg2Nu1jMZALV9A3IasJM8AAKKTQ9Um7G/AlnnNRdySXMGHfCAFjAfN3fDpVk2RUKxGqCiN22qw5W1WEQjKTVI5Df36i6TmZcrWJCgYP4Nx5B5erm5Vd9WK5I6Z2CKOPr+YCdM73dvqytgPK93YA7GBAMoNWyB3dHBEQ0MWGmhXzxxK54+sLtEwMdzH7RvO5Tz4hg1UpKESn/LE6bu94oVz0u002lA28qQzagVRZjxYR0yVBKT6Pxf9MZQrBvue8LB9h3uDlVpyVd8lQs/IdmQUv2z5h0c48YDF9IA6RLCCLkUCG+pYcAuJf6lSL0Q43Dc5jVK71IY7h7kB/lNV1gfDGgD0LuBQmhvjgDDtiS1SRiHjgpMcUOH4sUu6dyX/3U5w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR03MB4229.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(366004)(346002)(39860400002)(71200400001)(5660300002)(66476007)(76116006)(33656002)(2906002)(83380400001)(66946007)(86362001)(64756008)(6512007)(6486002)(66556008)(91956017)(66446008)(55236004)(966005)(8936002)(2616005)(36756003)(478600001)(8676002)(6506007)(26005)(316002)(6916009)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 0BcNQ8g/UPkdlwWlULvzy2XoEt2Llcxcu6tjHo/3O3Edduk1IwUUE6NejpzqmgFyIkrMiO5EsoCCgZg4driX3ra9sulXYSuCs5/beOIGep+5i3yC9aVmbJKECblawKnuQlXjPEjNoissHMjD3+rNTJOpvNbos3USoZy5S2LNM8B0NlHfADmBId40OGiI3AzkQwG3oEDegc+pFwHVPCQ/ILlg7TMa9zD6BvlE0Ir21gwqwlvlfTuNnsCyPxaK5afSEHKmX5moEXFVESbrc3eE7z6opRvtwll6ff6Lij+tnCsIr4OBMEna/1qA/10buvU+e4RimfZTOclQjhGTl9J0Zc5729ahGqYM/AC37uzDmeTdbFL4IFpW7zYGGWKLtLhqY6s4B2Pq0QDvyP9C+ZEd94BRGiG5nAhnB9tGuIwcSKJaMlAASfAfMp1vfXP1L+ZZNktCuo30L93y98jJvNbuATSz7+lg+ww9HsuR8lSeG3GZVZ8SSc6532qLNCgO5Fpbvg0bo9bp026G+3/MpB9vubOFf0vT1iXWE3kU/7BI5xod2HUve9U29FHZ9ZBSVzyfaPHLZ3UUEG0v+iP5E/KtQC3EODGiH3Q3WOlpSAY0lKhrcBjjc5om/+JLnRBsKZcE6b+1H1Q3SOFGh9biW0YV8A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <F4B10673BBA27A4E8ABD122106802836@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efb2610c-3580-4b03-681e-08d850b872cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2020 09:54:00.2283 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fSKA29rvZnRz2z2PnRsjgI1dm0OlxkoRl2iiHwntEJtLp62NV1O+tJ1l1aCszOYZRjtI17cLSdLCo2fcNCWWB2F5xkSicktULh6JM3kWvqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3637
X-OriginatorOrg: citrix.com
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXQgdGhlIGNvbW11bml0eSBjYWxsIGxhc3QgbW9udGggYXMgd2VsbCBhcyB0aGlzLCB3ZSBkaXNj
dXNzZWQgd2hldGhlciB0byBjb250aW51ZSB0aGUg4oCcR2l0bGFiIGV4cGVyaW1lbnTigJ0uICBJ
dCB3YXMgZ2VuZXJhbGx5IGFncmVlZCB0aGF0IHJldmlld2luZyBKdWVyZ2Vu4oCZcyBsb25nIHNl
cmllcyB3YXMgZmFpcmx5IHN1Yi1vcHRpbWFsLCBhbmQgdGhhdCBlbWFpbCB3YXMgbW9yZSBzdWl0
ZWQgdG8gdGhhdCBzb3J0IG9mIHNlcmllcy4NCg0KVGhhdCBzYWlkLCB0aGVyZSB3YXMgZ2VuZXJh
bCBhZ3JlZW1lbnQgdGhhdCByZXF1aXJpbmcgYWxsIHBhdGNoZXMgdG8gZ28gdGhyb3VnaCBlbWFp
bCB3YXMgZ29pbmcgdG8gbGltaXQgY29udHJpYnV0aW9uLCBwYXJ0aWN1bGFybHkgb2Ygb25lLW9m
ZiDigJxkcml2ZS1ieeKAnSBjb250cmlidXRpb25zLiAgQXMgc3VjaCwgaXQgd2FzIHByb3Bvc2Vk
IHRoYXQgd2UgY29uc2lkZXIgYWxsb3dpbmcgYm90aCBHaXRsYWIgUFJzLCBhbmQgZW1haWw6IHRo
YXQgZm9yIG9uZS1vZmYgb3Igc2hvcnQgc2VyaWVzLCBHaXRsYWIgUFJzIHdvdWxkIGJlIGFjY2Vw
dGVkLCBidXQgdGhhdCBmb3IgbG9uZ2VyIHNlcmllcyBhbmQvb3IgbG9uZ2VyIHRlcm0gY29udHJp
YnV0b3JzLCB3ZSB3b3VsZCBlbmNvdXJhZ2UgcGVvcGxlIHRvIHN3aXRjaCB0byBwYXRjaGJvbWJp
bmcgdGhlIG1haWxpbmcgbGlzdC4NCg0KV2UgZGVjaWRlZCB0byBjb250aW51ZSB0aGUg4oCcR2l0
bGFiIEV4cGVyaW1lbnTigJ0sIGJ1dCB3aXRoIHNob3J0IFBScy4gIEFzIHN1Y2gsIEFuZHkgQ29v
cGVyIGhhcyBwb3N0ZWQgdHdvIFBSczoNCg0KaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0
L3hlbi8tL21lcmdlX3JlcXVlc3RzLzINCg0KaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0
L3hlbi8tL21lcmdlX3JlcXVlc3RzLzMNCg0KQW5kIEnigJlkIGVuY291cmFnZSBvdGhlcnMgdG8g
dHJ5IHN1Ym1pdHRpbmcgc2ltcGxlIG9uZS1vci10d28tcGF0Y2ggc2VyaWVzIGFzIFBScyB0byBH
aXRsYWIgaW5zdGVhZCwgYXMgd2UgY29udGludWUgdGhlIGV4cGVyaW1lbnQuDQoNCiAtR2Vvcmdl

