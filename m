Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A1D2B1968
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 11:55:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26334.54627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdWjn-0005IG-FW; Fri, 13 Nov 2020 10:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26334.54627; Fri, 13 Nov 2020 10:55:27 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdWjn-0005Hv-CG; Fri, 13 Nov 2020 10:55:27 +0000
Received: by outflank-mailman (input) for mailman id 26334;
 Fri, 13 Nov 2020 10:55:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u7TF=ET=epam.com=prvs=9586b5424c=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kdWjm-0005Hq-9h
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 10:55:26 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e33e2f7-df27-42cf-86d9-e8e0efbbc1ed;
 Fri, 13 Nov 2020 10:55:24 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ADAoCkE030170; Fri, 13 Nov 2020 10:55:16 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58])
 by mx0a-0039f301.pphosted.com with ESMTP id 34rf80fh4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Nov 2020 10:55:16 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6884.eurprd03.prod.outlook.com (2603:10a6:20b:2de::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Fri, 13 Nov
 2020 10:55:13 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 10:55:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=u7TF=ET=epam.com=prvs=9586b5424c=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
	id 1kdWjm-0005Hq-9h
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 10:55:26 +0000
X-Inumbo-ID: 6e33e2f7-df27-42cf-86d9-e8e0efbbc1ed
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6e33e2f7-df27-42cf-86d9-e8e0efbbc1ed;
	Fri, 13 Nov 2020 10:55:24 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
	by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0ADAoCkE030170;
	Fri, 13 Nov 2020 10:55:16 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58])
	by mx0a-0039f301.pphosted.com with ESMTP id 34rf80fh4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2020 10:55:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENqQ47H8g+p3HT6+RUo+Enr48MEMiy4OVq5mCifgjwjJ20aGWrXHSqDVCkfzz35q9vrguJk4gIN+nbMDGet3KtTwr4aSOqkNzSN/LRDmZltQHfIMGYU3k1wxzZfV4V7rnWD4QSjc+1e57aCn9qdRH2QxSfHWZWSjLFTodDAbAiM2Eo2pwSumlSbXYRchn43yWEAd4zZdOBnGP0KUnwt4NgF9vNwrZ7M/s4MpOU06z3uiaxZsMEqO+QCWnnn+aWbNmV0g2SKfpehd/Jy/35SI7BGU410g3nr2XN4xWuAOyN8RbWdnLsj82qAQX2HEqaS5FFsI8Ti1oTWMOBFnGH7oww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTmf1xo1ri00lh5oQncPVVAvvL2RpcWSZY5ZC3IWaoE=;
 b=ZmcsllVJrTEcWvr+ZsoUoGrq6OlID4QMJjv8DembL3XX/j7UvdD62vku3SGwaUhyhWIKGOtMJxTA8RhXl+I08mhVWy2Wmlo3QCUiR/s4Qand8/suC2ejkOuUH4uqNlollRx552WJB3TFzbae4/FYl32W8HYoKEKVpYsTsBiakR1HcUKHG+lw5gvVn9ZmaPuDYCmCCEeLsGv16cF71SRsQUsWjTdVercRvLZKByADUdtACEmZHUechZpoahMwmjqHdCD2w3PIqHGfvR/jdP/yW14tY9LLCiqm9MOZ3lWv23hI+v/u9T9N5IaFyAqb+Q+yvRvuPmlykNP/6Tg7Zx38OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTmf1xo1ri00lh5oQncPVVAvvL2RpcWSZY5ZC3IWaoE=;
 b=TMJobHSvRqIFJdnGOvnMaz1kyL06ojAXgGWVlAJe67OH5jAzYNFwUKF9+ed5UYPJJRqFWbZJ8xQcRCkvY8PNUPiBCG2MKTSwZlUoDoIkaQAd4bjgVscCV4ODp8Pp6I2ZHZLa80Uh79XkZqZyh5HoSDlEuO6WUtT1oHewc5q62dNFjteA86yA2gjV3yoW+BYoq7g4if/+s9Wx1c2tYnBaG+aqr1pTqDwb1cEzA1HOMGai5cq/4hZCM6rztplnlTcAjQTAA780QjDk35HB9405oO9ICVRvuSFDLmTf85igE1zLgI1WqMeExIaijU3Ozm1eItfMsf0OqKZnauqhWXOuOA==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6884.eurprd03.prod.outlook.com (2603:10a6:20b:2de::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Fri, 13 Nov
 2020 10:55:13 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 10:55:13 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
CC: "iwj@xenproject.org" <iwj@xenproject.org>, "wl@xen.org" <wl@xen.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien.grall@arm.com" <julien.grall@arm.com>,
        "Bertrand.Marquis@arm.com"
	<Bertrand.Marquis@arm.com>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "Rahul.Singh@arm.com" <Rahul.Singh@arm.com>
Subject: Re: [PATCH 08/10] vpci/arm: Allow updating BAR's header for non-ECAM
 bridges
Thread-Topic: [PATCH 08/10] vpci/arm: Allow updating BAR's header for non-ECAM
 bridges
Thread-Index: AQHWtpbyYHzQ7b7gKkKm7jsDdoAEE6nF4pWAgAACsYCAAAJmAIAAAhEA
Date: Fri, 13 Nov 2020 10:55:13 +0000
Message-ID: <0b8803d9-1f83-1953-5225-96e3a9cf13ae@epam.com>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-9-andr2000@gmail.com>
 <ae66dddb-98e3-61fd-86c3-eab30ec33d18@suse.com>
 <1f0a3eb7-be20-95a0-0c1e-c7d45e3279f8@epam.com>
 <34e81e3e-7d65-432a-95a6-c8ef437b23dc@suse.com>
In-Reply-To: <34e81e3e-7d65-432a-95a6-c8ef437b23dc@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6dbcbbe2-9503-499d-d9e4-08d887c298ed
x-ms-traffictypediagnostic: AM9PR03MB6884:
x-microsoft-antispam-prvs: 
 <AM9PR03MB68843452562FDD39C033EBE6E7E60@AM9PR03MB6884.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kBVjcS3Fq5QWnHr88vfv1MVe/mNKyIkI091jM5bon+xX/hDhKclBdN/uHLOCEp5JUu/Y8lzPGDGFUuoqSNmdeqahyDhdg/6Ei7QUWjT90YjSiwY/7x9eBsulXOLNs8sr5qcd9YH0TjpnOa+tbi6IaP1PXqG2FFGMyBf5boj2npexR2fQUCK5uKPms457qShD4ReTLVEpDI0kyxXEEAnq42AbB52Z/fePIJkcZRc1pITj9tAb6A5G19q5ZwrmXrXniERMyFGhwZ26J1KmYH7yJGhIGe9/6f1AjSubjppTue5EHhYTMU9ISgsPabjm7MzS8Hk5gvPKejSrm7tODcGpDA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(376002)(39860400002)(366004)(316002)(6486002)(8676002)(71200400001)(5660300002)(54906003)(86362001)(2906002)(31696002)(110136005)(8936002)(2616005)(66446008)(66946007)(478600001)(64756008)(66476007)(66556008)(6512007)(36756003)(76116006)(7416002)(26005)(53546011)(186003)(6506007)(4326008)(83380400001)(31686004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 QWq9DTcgrhFeSuQwi94d+alXQX7h3JC/llv3cMi8as8SJGV9lTo/EhCMrOyS+1qMvtD2wVP/cGThq7hAdAoxIj9OSzA0LFC989m1XW3CWIPIkU0cRxnC1DZCFOu6B+YBdm7GxlQ2hBXB+EKCb6aCHVs/P7mQES9wWPRKO+nU37XXjD5tIe255mjmSpKw0EmGFTVGPXWdo90qlacQ5coknd3GLGbbTlnw7pwfndGfzGop3khXlYHv+LnjF265mEKOsnifj1s/IcW6nMZDQvN0bvPug1kZGsrLoekOeEwREynLkBHoNCkaOrTuSfEvDwp8OVNywt8WnCiJvtbPYGEf8UsEmhR9f+EXealTJriMAGa6ohPoVErBB1udU6Jbjq2mGn8hfI+GqnogRMSjusbp5nKBxgTjGXDTvaR/Qej41scVAq/u8iwYx/sIBJSE6uv8mu1PLbyJL6epOPfuoyoTj14rDFFxp01mxsUS//BjcBYj1O8Cx1QrlCddwD9W2HEOsR8Tgmvlm0stzZbNiv4GG0VdWXftpxZIjkosPHUMAnqqO8kFNOLbZroUvERSmcZmu58Swa+xvWAlGXsBdLPQEclfvqp2566ZOieDnexpCaeMwTbQkYzz43j1c8zKKsTNdkVV3ezmZnmEbySjRB7XVw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <6548DF3D13144D4299A060198360934A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dbcbbe2-9503-499d-d9e4-08d887c298ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 10:55:13.0750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NqydhwIp7BZUUr890KE+CmEzuvavt02YMkyd73kzzYo07Z3wZVB+oSmISmFfbrS+C7ltZ6Sq3NMLCWmN5oGSpLTm6tWlZFdxRRFWhdPX6l7vejaqRkMLYrtFfAKBrG20
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6884
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-13_07:2020-11-13,2020-11-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 spamscore=0 mlxlogscore=962 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 clxscore=1015 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011130066

DQpPbiAxMS8xMy8yMCAxMjo0NyBQTSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDEzLjExLjIw
MjAgMTE6MzksIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMTEvMTMvMjAg
MTI6MjkgUE0sIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA5LjExLjIwMjAgMTM6NTAsIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVz
aGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pj4+DQo+Pj4+IE5v
bi1FQ0FNIGhvc3QgYnJpZGdlcyBpbiBod2RvbSBnbyBkaXJlY3RseSB0byBQQ0kgY29uZmlnIHNw
YWNlLA0KPj4+PiBub3QgdGhyb3VnaCB2cGNpICh0aGV5IHVzZSB0aGVpciBzcGVjaWZpYyBtZXRo
b2QgZm9yIGFjY2Vzc2luZyBQQ0kNCj4+Pj4gY29uZmlndXJhdGlvbiwgZS5nLiBkZWRpY2F0ZWQg
cmVnaXN0ZXJzIGV0Yy4pLg0KPj4+IEFuZCBhY2Nlc3MgdG8gdGhlc2UgZGVkaWNhdGVkIHJlZ2lz
dGVycyBjYW4ndCBiZSBpbnRlcmNlcHRlZD8NCj4+IEl0IGNhbi4gQnV0IHRoZW4geW91IGhhdmUg
dG8gZnVsbHkgZW11bGF0ZSB0aGF0IGJyaWRnZSwgZS5nLg0KPj4NCj4+ICJpZiB3ZSB3cml0ZSBB
IHRvIHJlZ0IgYW5kIGFmdGVyIHRoYXQgd3JpdGUgQyB0byByZWdaIHRoZW4gaXQNCj4+DQo+PiBt
ZWFucyB3ZSBhcmUgYWNjZXNzaW5nIGNvbmZpZyBzcGFjZS4gSWYgd2Ugd3JpdGUuLi4uIg0KPiBT
b3VuZHMgcHJldHR5IG11Y2ggbGlrZSB0aGUgSS9PIHBvcnQgYmFzZWQgYWNjZXNzIG1lY2hhbmlz
bSBvbg0KPiB4ODYsIHdoaWNoIGFsc28gaGFzIHNvbWUgc29ydCBvZiAiZW5hYmxlIi4gT2YgY291
cnNlLCBJL08gcG9ydA0KPiBhY2Nlc3NlcyBhcmUgcGFydGljdWxhcmx5IGVhc3kgdG8gaW50ZXJj
ZXB0IGFuZCBoYW5kbGUuLi4NClllcywgaXQgaGFzIHNvbWV3aGF0IHNpbWlsYXIgaWRlYQ0KPg0K
Pj4gSSBtZWFuIHRoaXMgd291bGQgbmVlZCBsb3RzIG9mIGNvZGUgaW4gWGVuIHRvIGFjaGlldmUg
dGhhdA0KPiBQb3NzaWJseSwgYnV0IGxvb2sgYXQgdGhlIGFtb3VudCBvZiBjb2RlIHdlIGhhdmUg
aW4gWGVuIG9uIHRoZQ0KPiB4ODYgc2lkZSB0byBoYW5kbGUgTUNGRyB3cml0ZXMgYnkgRG9tMC4N
Cg0KQnV0IE1DRkcgaXMgaGFuZGxlZCB0aGUgc2FtZSB3YXkgZm9yIGFsbCB4ODYgbWFjaGluZXMs
IHJpZ2h0Pw0KDQpBbmQgaGVyZSBJJ2xsIGhhdmUgdG8gaGF2ZSBhIFNvQyBzcGVjaWZpYyBjb2Rl
LCBlLmcuIGEgc3BlY2lmaWMgZHJpdmVyDQoNCj4NCj4gSmFuDQoNClRoYW5rIHlvdSwNCg0KT2xl
a3NhbmRyDQo=

