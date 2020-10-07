Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F806285CBB
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 12:20:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3406.9789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ6Xr-0002iI-Tl; Wed, 07 Oct 2020 10:19:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3406.9789; Wed, 07 Oct 2020 10:19:39 +0000
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
	id 1kQ6Xr-0002ht-Q4; Wed, 07 Oct 2020 10:19:39 +0000
Received: by outflank-mailman (input) for mailman id 3406;
 Wed, 07 Oct 2020 10:19:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gnuf=DO=epam.com=prvs=8549453b04=anastasiia_lukianenko@srs-us1.protection.inumbo.net>)
 id 1kQ6Xp-0002hm-Lt
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 10:19:38 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d634b51a-06e7-4bc7-bfc0-5f78cd237088;
 Wed, 07 Oct 2020 10:19:35 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 097AFbpJ013258; Wed, 7 Oct 2020 10:19:33 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57])
 by mx0b-0039f301.pphosted.com with ESMTP id 3417ue8tjq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 10:19:33 +0000
Received: from DBAPR03MB6534.eurprd03.prod.outlook.com (2603:10a6:10:19b::13)
 by DB7PR03MB3739.eurprd03.prod.outlook.com (2603:10a6:5:1::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23; Wed, 7 Oct 2020 10:19:27 +0000
Received: from DBAPR03MB6534.eurprd03.prod.outlook.com
 ([fe80::fdb7:8815:74cf:ab61]) by DBAPR03MB6534.eurprd03.prod.outlook.com
 ([fe80::fdb7:8815:74cf:ab61%7]) with mapi id 15.20.3455.022; Wed, 7 Oct 2020
 10:19:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gnuf=DO=epam.com=prvs=8549453b04=anastasiia_lukianenko@srs-us1.protection.inumbo.net>)
	id 1kQ6Xp-0002hm-Lt
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 10:19:38 +0000
X-Inumbo-ID: d634b51a-06e7-4bc7-bfc0-5f78cd237088
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d634b51a-06e7-4bc7-bfc0-5f78cd237088;
	Wed, 07 Oct 2020 10:19:35 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
	by mx0b-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 097AFbpJ013258;
	Wed, 7 Oct 2020 10:19:33 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57])
	by mx0b-0039f301.pphosted.com with ESMTP id 3417ue8tjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2020 10:19:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z1k+dLSVORM29cbVFmlAIfzncYnQSAL8be+ogAQgXpKEYy3Bo4m+Chq6FJK+3YaoeFCHsaVwPKxRbiq5HoKWzqaPV2149OzMLyWHaeuHkZzOLn3rTMyUT5jCtkcBUIqsfW6+9k0mXjVEJmC12H0vwZCdt3cA6hcG8lTtjgyO+fEg9+8dAwt6bAQgNVrZ7u/d+IXFGwKRbhzH0/C+fo0StnIqLXjNojDtr+1tIoAWbSwgvqI90DhtDtQ9vyUfpgEfurnj1bh2j727+qCNlscuSRXiXm3wNe8tiX5YYU9igfMDdR8P/mdz3Aj3Kd1XgegwkEtl74lYx9KAN7IFu0lCBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dghLAKmeiot64G2UkCyE6qRfMS9Ocom2Zlln7n4lg1Y=;
 b=e5IoToIOtRvK1Kj6R2/K2tfmvObnQJ6h7MdcuouTsxMZ9x7sNxZGzzoLgQLuxmJKz/iPI7yijDSpMY24Ru2X1oJLhDlyMXaxkcH7wyPF398UhTTFqdFJN5Ow93c/LKXm9kvgwKv0uivISOHzEj368EejTcLSeDGvXfCUt7aSmzxL8/tvbs9OfJ/IbT5cykHeI+a6ZclyLrYC65vr2dZs6c4GPuZl1lD9wL7k+hZ8+k6V8h9juuQ44znRxKlk7zhiau+PfirDNmfrgHWAIESmGroAcxlTuHKRPEijHxeEiRphro0BFrvwz64d01bu3kVgwY10WJv1YE1wtvgqkKPxhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dghLAKmeiot64G2UkCyE6qRfMS9Ocom2Zlln7n4lg1Y=;
 b=BEmF40xama3UopZyKKn+qq5zWjyNXbLtu/zJteFpQBjRNhRk7Vo3ZVgl5Kp074xjkJ39K5X54M7sG2/tpJ4fuD33ECqv/Xl2b8QvUvT2dywS4MddY55mF2u6IFfAfku9QZxofHRiwIKJ/4fe+wK3FefLaSa+BK5x/YfYT5sQaRyhk8hxiFUAt+Zz+YNzvlr89XzhOCTYoUYpfV6W81NnkafhjX0RYz4KjeBqAnQXmOJutXT/o+oTp4ivmdjrSfgBbBHBKV0ltu3soWQlNQJAXyTVvfRcXVWjvwRlYh9HwLYFRxtNLzh2xhSRLs92TfF2Lv4fjd6H0TI0pvzR5JEV4g==
Received: from DBAPR03MB6534.eurprd03.prod.outlook.com (2603:10a6:10:19b::13)
 by DB7PR03MB3739.eurprd03.prod.outlook.com (2603:10a6:5:1::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23; Wed, 7 Oct 2020 10:19:27 +0000
Received: from DBAPR03MB6534.eurprd03.prod.outlook.com
 ([fe80::fdb7:8815:74cf:ab61]) by DBAPR03MB6534.eurprd03.prod.outlook.com
 ([fe80::fdb7:8815:74cf:ab61%7]) with mapi id 15.20.3455.022; Wed, 7 Oct 2020
 10:19:27 +0000
From: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>
To: "George.Dunlap@citrix.com" <George.Dunlap@citrix.com>
CC: "viktor.mitin.19@gmail.com" <viktor.mitin.19@gmail.com>,
        "vicooodin@gmail.com" <vicooodin@gmail.com>,
        "julien@xen.org"
	<julien@xen.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Artem
 Mygaiev <Artem_Mygaiev@epam.com>,
        "committers@xenproject.org"
	<committers@xenproject.org>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Xen Coding style and clang-format
Thread-Topic: Xen Coding style and clang-format
Thread-Index: AQHWlwq4nKYEhMN38U+xmvwRsutq+amA8joAgAAHUgCAAXyKAIAAENkAgAlxpgA=
Date: Wed, 7 Oct 2020 10:19:27 +0000
Message-ID: <3ff3f7d16cdab692178ce638da1a6b880817fb7e.camel@epam.com>
References: <300923eb27aea4d19bff3c21bc51d749c315f8e3.camel@epam.com>
	 <4238269c-3bf4-3acb-7464-3d753f377eef@suse.com>
	 <E068C671-8009-4976-87B8-0709F6A5C3BF@citrix.com>
	 <b16dfb26e0916166180d5cbbe95278dc99277330.camel@epam.com>
	 <B64C5E67-7BEA-4C31-9089-AB8CC1F1E80F@citrix.com>
In-Reply-To: <B64C5E67-7BEA-4C31-9089-AB8CC1F1E80F@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.213.80]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f21fb7ab-ee62-4a85-78fb-08d86aaa78b7
x-ms-traffictypediagnostic: DB7PR03MB3739:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <DB7PR03MB37392F37266B20B97936F4CFF20A0@DB7PR03MB3739.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 R96to3Mlk0wNN5ucj7duMmbiRqJdTXqrXvoPOOi+3QWdwiSHP5FfLtrmppojzEnVv1eQd8I4+0PVhlvGFap1M/1YbyYHblIOiAbHBeTvbuPwP4IKnOLeIQIcOLJxah5PhZix5YOHayvK0I1HTcEExo1a2tIZIAVC6WFMEQ+gzR6MIE0kXsWXVRS2LK6Xx6XPFd39REXkjKtr4tgjjP5LtLxlOpLdoZFd6Nl1yM6p6i6OlfSJCDIgWDMsOQyY1udsGEfWON7za/9BoL0lkuum8YDfAfJtgM9TpO03iwrbUvVw2OfsHOjvKWH7+DcZfbjW
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR03MB6534.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(6916009)(4326008)(71200400001)(6486002)(66446008)(66476007)(64756008)(76116006)(66946007)(91956017)(66556008)(6512007)(5660300002)(8936002)(8676002)(2616005)(26005)(2906002)(316002)(53546011)(6506007)(86362001)(55236004)(186003)(36756003)(478600001)(83380400001)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 PkBb/BUAQFKmDf91lUJJl+vHvw7Hj65VnQsy3V/gsxQlC9HST1/IrA+IYLCLnHlF8ZSDeyYzk6TvmoPxjSes8cbOIfWDbvzOhscGMhro2FTS1oTNG9bGsF6+Rtak9d/tDMda9cg6ymmoMdKaXt0IF7f5D/4xp4xXpBrFfcsUbO3X1QlDeeZxsCtwHjOXjAVh7wSojNfnmvPZV0ZDeGeKkPY+yV6aBU/s+4aZZGcCY+KSvsOb+2gxnKt2Tb2K/5HFpLl+nRZ94S20Dq6cQy3BsK3APXKBgFRpBmmHFpiyslOVB0kNjxhZhrrw4a2a1jcJ0z9ntztNVwUrmLaxSV3wz+XNnWmOUecS8iiii076Uz/pO1XzV/Q0fpncMD1RUWhVSRJ7166cqMFcTSTUHqTjEFnHYxruhh8iu2RTpJgl5u4410btktu4aBalEMm25dOa6yZJoyNCCMplLM2hxPL5g1U5Jals9x2kD4WhX8Q9UG9vrrKCKNGzoJpGjfCBuL2GIXxrwyvQinhapj6k2mMxnstT6uPeWPYBJtL15hBgzQV7C5lVWbwN9H5TIn+YF8vcduXYwh/1dsaSC3Hv8F9dVydjgQYgWNJT4i4S82XDkhQMIxSpCOWueOm092KxM+MFVG0cejAqn/q7mx2OTvlUWA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <461C695B008DB2478AF6C32C5E32780F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBAPR03MB6534.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f21fb7ab-ee62-4a85-78fb-08d86aaa78b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2020 10:19:27.3118
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: txRrEYFb/vNRowylqGUCfUIRloxt7lwnK6S+XHeUvOgQd0KGHIkU74BeIHvrit2Kg4XQRjk5MxWvwGFQUaeoTtrHY/KhonVNlF9TDldO5UQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB3739
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-07_05:2020-10-06,2020-10-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 mlxscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010070068

SGkgYWxsLA0KDQpPbiBUaHUsIDIwMjAtMTAtMDEgYXQgMTA6MDYgKzAwMDAsIEdlb3JnZSBEdW5s
YXAgd3JvdGU6DQo+ID4gT24gT2N0IDEsIDIwMjAsIGF0IDEwOjA2IEFNLCBBbmFzdGFzaWlhIEx1
a2lhbmVua28gPA0KPiA+IEFuYXN0YXNpaWFfTHVraWFuZW5rb0BlcGFtLmNvbT4gd3JvdGU6DQo+
ID4gDQo+ID4gSGksDQo+ID4gDQo+ID4gT24gV2VkLCAyMDIwLTA5LTMwIGF0IDEwOjI0ICswMDAw
LCBHZW9yZ2UgRHVubGFwIHdyb3RlOg0KPiA+ID4gPiBPbiBTZXAgMzAsIDIwMjAsIGF0IDEwOjU3
IEFNLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4gPiA+IHdyb3RlOg0KPiA+
ID4gPiANCj4gPiA+ID4gT24gMzAuMDkuMjAyMCAxMToxOCwgQW5hc3Rhc2lpYSBMdWtpYW5lbmtv
IHdyb3RlOg0KPiA+ID4gPiA+IEkgd291bGQgbGlrZSB0byBrbm93IHlvdXIgb3BpbmlvbiBvbiB0
aGUgZm9sbG93aW5nIGNvZGluZw0KPiA+ID4gPiA+IHN0eWxlDQo+ID4gPiA+ID4gY2FzZXMuDQo+
ID4gPiA+ID4gV2hpY2ggb3B0aW9uIGRvIHlvdSB0aGluayBpcyBjb3JyZWN0Pw0KPiA+ID4gPiA+
IDEpIEZ1bmN0aW9uIHByb3RvdHlwZSB3aGVuIHRoZSBzdHJpbmcgbGVuZ3RoIGlzIGxvbmdlciB0
aGFuDQo+ID4gPiA+ID4gdGhlDQo+ID4gPiA+ID4gYWxsb3dlZA0KPiA+ID4gPiA+IG9uZQ0KPiA+
ID4gPiA+IC1zdGF0aWMgaW50IF9faW5pdA0KPiA+ID4gPiA+IC1hY3BpX3BhcnNlX2dpY19jcHVf
aW50ZXJmYWNlKHN0cnVjdCBhY3BpX3N1YnRhYmxlX2hlYWRlcg0KPiA+ID4gPiA+ICpoZWFkZXIs
DQo+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgdW5zaWduZWQg
bG9uZyBlbmQpDQo+ID4gPiA+ID4gK3N0YXRpYyBpbnQgX19pbml0IGFjcGlfcGFyc2VfZ2ljX2Nw
dV9pbnRlcmZhY2UoDQo+ID4gPiA+ID4gKyAgICBzdHJ1Y3QgYWNwaV9zdWJ0YWJsZV9oZWFkZXIg
KmhlYWRlciwgY29uc3QgdW5zaWduZWQgbG9uZw0KPiA+ID4gPiA+IGVuZCkNCj4gPiA+ID4gDQo+
ID4gPiA+IEJvdGggdmFyaWFudHMgYXJlIGRlZW1lZCB2YWxpZCBzdHlsZSwgSSB0aGluayAoc2Ft
ZSBhbHNvIGdvZXMNCj4gPiA+ID4gZm9yDQo+ID4gPiA+IGZ1bmN0aW9uIGNhbGxzIHdpdGggdGhp
cyBzYW1lIHByb2JsZW0pLiBJbiBmYWN0IHlvdSBtaXggdHdvDQo+ID4gPiA+IGRpZmZlcmVudCBz
dHlsZSBhc3BlY3RzIHRvZ2V0aGVyIChwbGFjZW1lbnQgb2YgcGFyYW1ldGVyDQo+ID4gPiA+IGRl
Y2xhcmF0aW9ucyBhbmQgcGxhY2VtZW50IG9mIHJldHVybiB0eXBlIGV0YykgLSBmb3IgZWFjaA0K
PiA+ID4gPiBpbmRpdmlkdWFsbHkgYm90aCBmb3JtcyBhcmUgZGVlbWVkIGFjY2VwdGFibGUsIEkg
dGhpbmsuDQo+ID4gPiANCj4gPiA+IElmIHdl4oCZcmUgZ29pbmcgdG8gaGF2ZSBhIHRvb2wgZ28g
dGhyb3VnaCBhbmQgcmVwb3J0IChjb3JyZWN0PykNCj4gPiA+IGFsbA0KPiA+ID4gdGhlc2UgY29k
aW5nIHN0eWxlIHRoaW5ncywgaXTigJlzIGFuIG9wcG9ydHVuaXR5IHRvIHRoaW5rIGlmIHdlDQo+
ID4gPiB3YW50IHRvDQo+ID4gPiBhZGQgbmV3IGNvZGluZyBzdHlsZSByZXF1aXJlbWVudHMgKG9y
IGNoYW5nZSBleGlzdGluZw0KPiA+ID4gcmVxdWlyZW1lbnRzKS4NCj4gPiA+IA0KPiA+IA0KPiA+
IEkgYW0gcmVhZHkgdG8gZGlzY3VzcyBuZXcgcmVxdWlyZW1lbnRzIGFuZCBpbXBsZW1lbnQgdGhl
bSBpbiBydWxlcw0KPiA+IG9mDQo+ID4gdGhlIFhlbiBDb2Rpbmcgc3R5bGUgY2hlY2tlci4NCj4g
DQo+IFRoYW5rIHlvdS4gOi0pICBCdXQgd2hhdCBJIG1lYW50IHdhczogUmlnaHQgbm93IHdlIGRv
buKAmXQgcmVxdWlyZSBvbmUNCj4gYXBwcm9hY2ggb3IgdGhlIG90aGVyIGZvciB0aGlzIHNwZWNp
ZmljIGluc3RhbmNlLiAgRG8gd2Ugd2FudCB0bw0KPiBjaG9vc2Ugb25lPw0KPiANCj4gSSB0aGlu
ayBpbiB0aGlzIGNhc2UgaXQgbWFrZXMgc2Vuc2UgdG8gZG8gdGhlIGVhc2llc3QgdGhpbmcuICBJ
ZiBpdOKAmXMNCj4gZWFzeSB0byBtYWtlIHRoZSBjdXJyZW50IHRvb2wgYWNjZXB0IGJvdGggc3R5
bGVzLCBsZXTigJlzIGp1c3QgZG8gdGhhdA0KPiBmb3Igbm93LiAgSWYgdGhlIHRvb2wgY3VycmVu
dGx5IGZvcmNlcyB5b3UgdG8gY2hvb3NlIG9uZSBvZiB0aGUgdHdvDQo+IHN0eWxlcywgbGV04oCZ
cyBjaG9vc2Ugb25lLg0KPiANCj4gIC1HZW9yZ2UNCg0KRHVyaW5nIHRoZSBkZXRhaWxlZCBzdHVk
eSBvZiB0aGUgWGVuIGNoZWNrZXIgYW5kIHRoZSBDbGFuZy1Gb3JtYXQgU3R5bGUNCk9wdGlvbnMs
IGl0IHdhcyBmb3VuZCB0aGF0IHRoaXMgdG9vbCwgdW5mb3J0dW5hdGVseSwgaXMgbm90IHNvIGZs
ZXhpYmxlDQp0byBhbGxvdyB0aGUgYXV0aG9yIHRvIGluZGVwZW5kZW50bHkgY2hvb3NlIHRoZSBm
b3JtYXR0aW5nIHN0eWxlIGluDQpzaXR1YXRpb25zIHRoYXQgSSBkZXNjcmliZWQgaW4gdGhlIGxh
c3QgbGV0dGVyLiBGb3IgZXhhbXBsZSBkZWZpbmUgY29kZQ0Kc3R5bGU6DQotI2RlZmluZSBBTExS
RUdTIFwNCi0gICAgQyhyMCwgcjBfdXNyKTsgICBDKHIxLCByMV91c3IpOyAgIEMocjIsIHIyX3Vz
cik7ICAgQyhyMywNCnIzX3Vzcik7ICAgXA0KLSAgICBDKGNwc3IsIGNwc3IpDQorI2RlZmluZSBB
TExSRUdTICAgICAgICAgICAgXA0KKyAgICBDKHIwLCByMF91c3IpOyAgICAgICAgIFwNCisgICAg
QyhyMSwgcjFfdXNyKTsgICAgICAgICBcDQorICAgIEMocjIsIHIyX3Vzcik7ICAgICAgICAgXA0K
VGhlcmUgYXJlIGFsc28gc29tZSBpbmNvbnNpc3RlbmNpZXMgaW4gdGhlIGZvcm1hdHRpbmcgb2Yg
dGhlIHRvb2wgYW5kDQp3aGF0IGlzIHdyaXR0ZW4gaW4gdGhlIGh5dW5nIGNvZGluZyBzdHlsZSBy
dWxlcy4gRm9yIGV4YW1wbGUsIHRoZQ0KY29tbWVudCBmb3JtYXQ6DQotICAgIC8qIFBDIHNob3Vs
ZCBiZSBhbHdheXMgYSBtdWx0aXBsZSBvZiA0LCBhcyBYZW4gaXMgdXNpbmcgQVJNDQppbnN0cnVj
dGlvbiBzZXQgKi8NCisgICAgLyogUEMgc2hvdWxkIGJlIGFsd2F5cyBhIG11bHRpcGxlIG9mIDQs
IGFzIFhlbiBpcyB1c2luZyBBUk0NCmluc3RydWN0aW9uIHNldA0KKyAgICAgKi8NCkkgd291bGQg
bGlrZSB0byBkcmF3IHlvdXIgYXR0ZW50aW9uIHRvIHRoZSBmYWN0IHRoYXQgdGhlIGNvbW1lbnQN
CmJlaGF2ZXMgaW4gdGhpcyB3YXksIHNpbmNlIHRoZSBsaW5lIGxlbmd0aCBleGNlZWRzIHRoZSBh
bGxvd2FibGUgb25lLg0KVGhlIFJlZmxvd0NvbW1lbnRzIG9wdGlvbiBpcyByZXNwb25zaWJsZSBm
b3IgdGhpcyBmb3JtYXQuIEl0IGNhbiBiZQ0KdHVybmVkIG9mZiwgYnV0IHRoZW4gdGhlIHJlc3Vs
dCB3aWxsIGJlOg0KUmVmbG93Q29tbWVudHM9ZmFsc2U6DQovKiBzZWNvbmQgdmVyeVZlcnlWZXJ5
VmVyeVZlcnlWZXJ5VmVyeVZlcnlWZXJ5VmVyeVZlcnlMb25nQ29tbWVudCB3aXRoDQpwbGVudHkg
b2YgaW5mb3JtYXRpb24gKi8NCg0KUmVmbG93Q29tbWVudHM9dHJ1ZToNCi8qIHNlY29uZCB2ZXJ5
VmVyeVZlcnlWZXJ5VmVyeVZlcnlWZXJ5VmVyeVZlcnlWZXJ5VmVyeUxvbmdDb21tZW50IHdpdGgN
CnBsZW50eSBvZg0KICogaW5mb3JtYXRpb24gKi8NCg0KU28gSSB3YW50IHRvIGtub3cgaWYgdGhl
IGNvbW11bml0eSBpcyByZWFkeSB0byBhZGQgbmV3IGZvcm1hdHRpbmcNCm9wdGlvbnMgYW5kIGVk
aXQgb2xkIG9uZXMuIEJlbG93IEkgd2lsbCBnaXZlIGV4YW1wbGVzIG9mIHdoYXQNCmNvcnJlY3Rp
b25zIHRoZSBjaGVja2VyIGlzIGN1cnJlbnRseSBtYWtpbmcgKHRoZSBmaXJzdCB2YXJpYW50IGlu
IGVhY2gNCmNhc2UgaXMgZXhpc3RpbmcgY29kZSBhbmQgdGhlIHNlY29uZCB2YXJpYW50IGlzIGZv
cm1hdHRlZCBieSBjaGVja2VyKS4NCklmIHRoZXkgZml0IHRoZSBzdGFuZGFyZHMsIHRoZW4gSSBj
YW4gZG9jdW1lbnQgdGhlbSBpbiB0aGUgY29kaW5nDQpzdHlsZS4gSWYgbm90LCB0aGVuIEkgdHJ5
IHRvIGNvbmZpZ3VyZSB0aGUgY2hlY2tlci4gQnV0IHRoZSBpZGVhIGlzDQp0aGF0IHdlIG5lZWQg
dG8gY2hvb3NlIG9uZSBvcHRpb24gdGhhdCB3aWxsIGJlIGNvbnNpZGVyZWQgY29ycmVjdC4NCjEp
IEZ1bmN0aW9uIHByb3RvdHlwZSB3aGVuIHRoZSBzdHJpbmcgbGVuZ3RoIGlzIGxvbmdlciB0aGFu
IHRoZSBhbGxvd2VkDQotc3RhdGljIGludCBfX2luaXQNCi1hY3BpX3BhcnNlX2dpY19jcHVfaW50
ZXJmYWNlKHN0cnVjdCBhY3BpX3N1YnRhYmxlX2hlYWRlciAqaGVhZGVyLA0KLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29uc3QgdW5zaWduZWQgbG9uZyBlbmQpDQorc3RhdGljIGludCBf
X2luaXQgYWNwaV9wYXJzZV9naWNfY3B1X2ludGVyZmFjZSgNCisgICAgc3RydWN0IGFjcGlfc3Vi
dGFibGVfaGVhZGVyICpoZWFkZXIsIGNvbnN0IHVuc2lnbmVkIGxvbmcgZW5kKQ0KMikgV3JhcHBp
bmcgYW4gb3BlcmF0aW9uIHRvIGEgbmV3IGxpbmUgd2hlbiB0aGUgc3RyaW5nIGxlbmd0aCBpcyBs
b25nZXINCnRoYW4gdGhlIGFsbG93ZWQNCi0gICAgc3RhdHVzID0gYWNwaV9nZXRfdGFibGUoQUNQ
SV9TSUdfU1BDUiwgMCwNCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgKHN0cnVjdCBhY3Bp
X3RhYmxlX2hlYWRlciAqKikmc3Bjcik7DQorICAgIHN0YXR1cyA9DQorICAgICAgICBhY3BpX2dl
dF90YWJsZShBQ1BJX1NJR19TUENSLCAwLCAoc3RydWN0IGFjcGlfdGFibGVfaGVhZGVyDQoqKikm
c3Bjcik7DQozKSBTcGFjZSBhZnRlciBicmFja2V0cw0KLSAgICByZXR1cm4gKChjaGFyICopIGJh
c2UgKyBvZmZzZXQpOw0KKyAgICByZXR1cm4gKChjaGFyICopYmFzZSArIG9mZnNldCk7DQo0KSBT
cGFjZXMgaW4gYnJhY2tldHMgaW4gc3dpdGNoIGNvbmRpdGlvbg0KLSAgICBzd2l0Y2ggKCBkb21j
dGwtPmNtZCApDQorICAgIHN3aXRjaCAoZG9tY3RsLT5jbWQpDQo1KSBTcGFjZXMgaW4gYnJhY2tl
dHMgaW4gb3BlcmF0aW9uDQotICAgIGltbSA9ICggaW5zbiA+PiBCUkFOQ0hfSU5TTl9JTU1fU0hJ
RlQgKSAmIEJSQU5DSF9JTlNOX0lNTV9NQVNLOw0KKyAgICBpbW0gPSAoaW5zbiA+PiBCUkFOQ0hf
SU5TTl9JTU1fU0hJRlQpICYgQlJBTkNIX0lOU05fSU1NX01BU0s7DQo2KSBTcGFjZXMgaW4gYnJh
Y2tldHMgaW4gcmV0dXJuDQotICAgICAgICByZXR1cm4gKCAhc3ltLT5uYW1lWzJdIHx8IHN5bS0+
bmFtZVsyXSA9PSAnLicgKTsNCisgICAgICAgIHJldHVybiAoIXN5bS0+bmFtZVsyXSB8fCBzeW0t
Pm5hbWVbMl0gPT0gJy4nKTsNCjcpIFNwYWNlIGFmdGVyIHNpemVvZg0KLSAgICBjbGVhbl9hbmRf
aW52YWxpZGF0ZV9kY2FjaGVfdmFfcmFuZ2UobmV3X3B0ciwgc2l6ZW9mICgqbmV3X3B0cikgKg0K
bGVuKTsNCisgICAgY2xlYW5fYW5kX2ludmFsaWRhdGVfZGNhY2hlX3ZhX3JhbmdlKG5ld19wdHIs
IHNpemVvZigqbmV3X3B0cikgKg0KbGVuKTsNCjgpIFNwYWNlcyBiZWZvcmUgY29tbWVudCBpZiBp
dOKAmXMgb24gdGhlIHNhbWUgbGluZQ0KLSAgICBjYXNlIFJfQVJNX01PVlRfQUJTOiAvKiBTICsg
QSAqLw0KKyAgICBjYXNlIFJfQVJNX01PVlRfQUJTOiAgICAvKiBTICsgQSAqLw0KDQotICAgIGlm
ICggdG1wID09IDBVTCApICAgICAgIC8qIEFyZSBhbnkgYml0cyBzZXQ/ICovDQotICAgICAgICBy
ZXR1cm4gcmVzdWx0ICsgc2l6ZTsgICAvKiBOb3BlLiAqLw0KKyAgICBpZiAoIHRtcCA9PSAwVUwg
KSAgICAgICAgIC8qIEFyZSBhbnkgYml0cyBzZXQ/ICovDQorICAgICAgICByZXR1cm4gcmVzdWx0
ICsgc2l6ZTsgLyogTm9wZS4gKi8NCg0KOSkgU3BhY2UgYWZ0ZXIgZm9yX2VhY2hfdmNwdQ0KLSAg
ICAgICAgZm9yX2VhY2hfdmNwdShkLCB2KQ0KKyAgICAgICAgZm9yX2VhY2hfdmNwdSAoZCwgdikN
CjEwKSBTcGFjZXMgaW4gZGVjbGFyYXRpb24NCi0gICAgdW5pb24gaHNyIGhzciA9IHsgLmJpdHMg
PSByZWdzLT5oc3IgfTsNCisgICAgdW5pb24gaHNyIGhzciA9IHsuYml0cyA9IHJlZ3MtPmhzcn07
DQoNClJlZ2FyZHMsDQpBbmFzdGFzaWlhDQo=

