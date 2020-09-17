Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A782C26DF2B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 17:10:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIvYW-0000RW-Qf; Thu, 17 Sep 2020 15:10:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qtsM=C2=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1kIvYV-0000RO-N6
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 15:10:39 +0000
X-Inumbo-ID: 78550092-e7de-4414-965e-1767d14df7de
Received: from USG02-BN3-obe.outbound.protection.office365.us (unknown
 [2001:489a:2202:c::619])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78550092-e7de-4414-965e-1767d14df7de;
 Thu, 17 Sep 2020 15:10:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=Z52sUic7V8KbfO+BXWtqVymVAKBa9B/t8yacQdRQIyL2nlN53wYr3Dn0YWh+uwBZjKHOr/J/s8sb2nZROia2vJyP5Pz28FrrQHcxf18lLNVJJSaETVwhGHLtlAD0h5lJWfAkr8cpXgE1UtsmUkxetqqxJB21lJ1GSWv0tiWL65Ajela+4El3QHJYiypDmepaxy13mhz+mF51sLGaaEsGYXw6OtqSKzbdmMfE7BfTSGRTk7Dy4FDcBJWt1Q9Db147JpUPibcJp8OAKvfvdZuYADhRhSOJMeyJzDrNCdLeWFNo7VVKPZHH0lRu6vBU4ykDGjLobOThUxK9heY8acdvUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBEegPga6rgqq3Uz3RWuzNUIfc8TH2ptDP7U3G6wdZA=;
 b=R7jMu2r9ctIB3X0RsJUxTGWL4SlnEu3vEGV381VrFiIt1A6HFOU6mM3n0U8ke1tylENbh0q5c9BEfH9MhbkecqiTSBDsl9w9M2xY0g44Pka4rUSrns6VryqP3cuOvylnmEKkoo0pkzRj9jbHE9XZ2eqQikaMjQkDJBInc68RHXjyUQyIFHGtM3FrsHytWrAq+NFcqKemoNVz35PJhxad0a2O6OvH55/2eDy3dfhqieyEylNrWivbmSSqz9kMLwMaxTWr5shBnK/GC7nW0phbU3nWqPHOf6hPBJMM+qQS8Tc3VQZAj0bDiUahJaPjUXD1ZbevwYKMulB+yNRRKnjYsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dornerworks.com; dmarc=pass action=none
 header.from=dornerworks.com; dkim=pass header.d=dornerworks.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dornerworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBEegPga6rgqq3Uz3RWuzNUIfc8TH2ptDP7U3G6wdZA=;
 b=iGyOzWlALg1Fp1xTcFRR7Fi4pTHEh9iy3uh4eQ+RIKggAXgD6IvcVLUklJHmfgqhFR1Ak6dy/Cx2srBujDdsooWHU6/oXs2uyIX8sI/fM1szjN6Kuh+qApf82ZVRafKl74GEfTXvAFcBSIFOX+5DV238/HejJsYyj5ZW1khXbrAvm/NtUJY8nedm3PqNoFTeKCYt70EMCLunfXGLOcPMIV6OjteLM/NoVts/Be5fxCaw0CpJcGT6qAEtoVSg+hIY9wx/nxWgQUk+U/8dWhn1MG1Xw1VHBCPhm5/SAcAHTyngZlsSdXKRr+nBfGq8WtDb7cMF2JeLr1NyFTiW89x7hg==
Received: from CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM (52.145.2.14) by
 CY1P110MB0117.NAMP110.PROD.OUTLOOK.COM (23.103.22.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.15; Thu, 17 Sep 2020 15:10:30 +0000
Received: from CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM
 ([fe80::75b8:922a:1a45:32c0]) by CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM
 ([fe80::75b8:922a:1a45:32c0%10]) with mapi id 15.20.3391.015; Thu, 17 Sep
 2020 15:10:30 +0000
From: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Jeff Kubascik
 <Jeff.Kubascik@dornerworks.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: xen-devel <xen-devel@dornerworks.com>, Josh Whitehead
 <Josh.Whitehead@dornerworks.com>, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Subject: RE: [PATCH 5/5] sched/arinc653: Implement CAST-32A multicore
 scheduling
Thread-Topic: [PATCH 5/5] sched/arinc653: Implement CAST-32A multicore
 scheduling
Thread-Index: AQHWjFXo8LfVF1vuZEGd+q7v79upsqlsik8AgABi9pA=
Date: Thu, 17 Sep 2020 15:10:30 +0000
Message-ID: <CY1P110MB055125447405A5DA2202BF028C3E0@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
References: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
 <20200916181854.75563-6-jeff.kubascik@dornerworks.com>
 <d2973002-86b5-17b7-cbfa-ba235af75ba3@suse.com>
In-Reply-To: <d2973002-86b5-17b7-cbfa-ba235af75ba3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=dornerworks.com;
x-originating-ip: [207.242.234.14]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6b143d22-f699-4e7b-9bd6-08d85b1bd14e
x-ms-traffictypediagnostic: CY1P110MB0117:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1P110MB01179DC00FED7C143885A3018C3E0@CY1P110MB0117.NAMP110.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(83380400001)(8676002)(4326008)(186003)(64756008)(26005)(5660300002)(33656002)(7696005)(6506007)(53546011)(52536014)(2906002)(76116006)(54906003)(4744005)(9686003)(66574015)(66556008)(110136005)(71200400001)(8936002)(508600001)(66446008)(66476007)(55016002)(66946007)(86362001);
 DIR:OUT; SFP:1101; 
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b143d22-f699-4e7b-9bd6-08d85b1bd14e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2020 15:10:30.6219 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1P110MB0117
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

T24gVGh1cnNkYXksIFNlcHRlbWJlciAxNywgMjAyMCA1OjA0IEFNLCBKw7xyZ2VuIEdyb8OfIHdy
b3RlOg0KPk9uIDE2LjA5LjIwIDIwOjE4LCBKZWZmIEt1YmFzY2lrIHdyb3RlOg0KPj4gVGhpcyBj
aGFuZ2UgaXMgYW4gb3ZlcmhhdWwgb2YgdGhlIEFSSU5DNjUzIHNjaGVkdWxlciB0byBlbmFibGUg
Q0FTVC0zMkENCj4+IG11bHRpY29yZSBzY2hlZHVsaW5nLiBDQVNULTMyQSBzcGVjaWZpZXMgdGhh
dCBvbmx5IG9uZSBwYXJ0aXRpb24NCj4+IChkb21haW4pIGNhbiBydW4gZHVyaW5nIGEgbWlub3Ig
ZnJhbWUsIGJ1dCB0aGF0IGRvbWFpbiBpcyBub3cgYWxsb3dlZCB0bw0KPj4gaGF2ZSBtb3JlIHRo
YW4gb25lIHZDUFUuDQo+DQo+SXQgbWlnaHQgYmUgd29ydGggdG8gY29uc2lkZXIgdXNpbmcganVz
dCB0aGUgY29yZSBzY2hlZHVsaW5nIGZyYW1ld29yaw0KPmluIG9yZGVyIHRvIGFjaGl2ZSB0aGlz
LiBVc2luZyBhIHNjaGVkX2dyYW51bGFyaXR5IHdpdGggdGhlIG51bWJlciBvZg0KPmNwdXMgaW4g
dGhlIGNwdXBvb2wgcnVubmluZyBBUklOQzY1MyBzY2hlZHVsZXIgc2hvdWxkIGFscmVhZHkgZG8g
dGhlDQo+dHJpY2suIFRoZXJlIHNob3VsZCBiZSBubyBmdXJ0aGVyIG1pZGlmaWNhdGlvbiBvZiBB
UklOQzY1MyBzY2hlZHVsZXINCj5yZXF1aXJlZC4NCj4NCg0KVGhpcyBDQVNULTMyQSBtdWx0aWNv
cmUgcGF0Y2ggc2VyaWVzIGFsbG93cyB5b3UgdG8gaGF2ZSBhIGRpZmZlcmVudCBudW1iZXIgb2Yg
dkNQVXMgKFVOSVRzLCBJIGd1ZXNzKSBhc3NpZ25lZCB0byBkb21Vcy4gRm9yIGV4YW1wbGUsIGRv
bTEgaGFzIGEgc2luZ2xlIHZDUFUsIGFuZCBkb20yIGhhcyA0IHZDUFVzLiBJIGRpZG4ndCB0aGlu
ayB0aGUgY29yZSBzY2hlZHVsaW5nIGZyYW1ld29yayBoYWQgdGhpcyBmbGV4aWJpbGl0eT8NCg0K
U3Rldw0KDQo+DQo+SnVlcmdlbg0K

