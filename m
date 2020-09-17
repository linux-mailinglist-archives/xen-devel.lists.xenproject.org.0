Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7097D26E308
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 19:57:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIy9q-0007gY-4c; Thu, 17 Sep 2020 17:57:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qtsM=C2=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1kIy9o-0007gS-D9
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 17:57:20 +0000
X-Inumbo-ID: 071f32ad-4e96-48ae-8684-381a33358035
Received: from USG02-CY1-obe.outbound.protection.office365.us (unknown
 [2001:489a:2202:d::622])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 071f32ad-4e96-48ae-8684-381a33358035;
 Thu, 17 Sep 2020 17:57:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=rHRA/STP0ttpNEPXIOIBxoOPvSgiZFS2NsR4zDhVj4OQx7jjlSgeAaduabolsjgWVIJdL+tNAJl4UhTcTMXJ9M92I0tHPItItqS29WlXKLilo6X2K5v77d50DHUkYnM8RYRQdkpLiyuArLxm1cVp8CelysMuKvi6M+WbbOEOxhza2EpSnZM7hGGsTn4C1SP9SMSuW0VO6QtglAOJFGIJdLZolBKBtxSJ2+/2lUuCPCLV9l/kvjEwid6s7p/AjCjgCIEmoVHQLbr27Rudlm2+7Y5vlS45+a4RiutGYciuE5icDTP0FSaONZoPD5883qGLJMLF693jrSvTLXEEpZta+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6oNzpyhfTiwBZe7n1uKbu01SWMXnE3U4+E7WpS9DmaI=;
 b=HCJkiDAyt/mJSxJqwOi84o54qBcVXNdPFURUjBydSzv3D7qsEpHWQ8BIUZPG+fqrzDImEUfHg4Eu4K7odZUS7IawTBYjaiUyva2XLMozkX0B2qGGgOkUJMS9SxVslwXQXqKVALGmqaUFWqvbFD3TCmY1ybBycA3gY2P+cEkOGkG6gmy7t7VamdagOPKFftiQ9YRzIMeKSBR+aS3kK4vbNlYRXqyKcECZQBhFLba/NRvToEOIVZ3vak/k78kJJSxF7NDRrh8y7jfwprF12lfmBM67pA0KPDNOJIer+uk4tHQAVFovkvauSVCv3Fk0c98D0xXv9hdR2NJI1hH8HZDj+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dornerworks.com; dmarc=pass action=none
 header.from=dornerworks.com; dkim=pass header.d=dornerworks.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dornerworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6oNzpyhfTiwBZe7n1uKbu01SWMXnE3U4+E7WpS9DmaI=;
 b=lOeej0ZGSH/aIFWS7lYENUXJFZIXuv8pPyiV6ZpOne4AmH+pFMWgRce/GnScHTV2X/tw/NQo4xNhDFMpQSYSCJSi6mK9TIMRtkvkuwJf/8H/FvvJmjifTICGuo87krKTQowXZF3zEv/kTArgPLgixWha0CWQz6c6anwBopTjrVfggI17fNHTNQiZ+fBRpgwbsNR4hNcW9SoLTO0XeoLktFONocJPlB2d5NyXdFYtOwYxMWG2zeRFaGBC9Dwjp6NdZPyNYFvPL1poOdFHqLeuVu35va8mwz9LgDV5RVgn6IkqI7t3OW82EZ8m7G8025/43I7GLYXLPw+2VdiXN01gkA==
Received: from CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:404::14)
 by CY1P110MB0535.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:404::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Thu, 17 Sep
 2020 17:57:13 +0000
Received: from CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM
 ([fe80::75b8:922a:1a45:32c0]) by CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM
 ([fe80::75b8:922a:1a45:32c0%10]) with mapi id 15.20.3391.015; Thu, 17 Sep
 2020 17:57:13 +0000
From: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jeff Kubascik
 <Jeff.Kubascik@dornerworks.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: xen-devel <xen-devel@dornerworks.com>, Josh Whitehead
 <Josh.Whitehead@dornerworks.com>, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Subject: RE: [PATCH 5/5] sched/arinc653: Implement CAST-32A multicore
 scheduling
Thread-Topic: [PATCH 5/5] sched/arinc653: Implement CAST-32A multicore
 scheduling
Thread-Index: AQHWjFXo8LfVF1vuZEGd+q7v79upsqls6PEAgAAAqMCAABomAIAAA8CA
Date: Thu, 17 Sep 2020 17:57:13 +0000
Message-ID: <CY1P110MB05510EEDEF3E1AB5967496398C3E0@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
References: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
 <20200916181854.75563-6-jeff.kubascik@dornerworks.com>
 <36f7ed35-039c-482b-c04b-0f2348de37f6@citrix.com>
 <CY1P110MB05519EEB1C9F879D54ECF6F58C3E0@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
 <f8345a86-1a00-9ec9-036b-853a15484777@citrix.com>
In-Reply-To: <f8345a86-1a00-9ec9-036b-853a15484777@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none; citrix.com; dmarc=none action=none header.from=dornerworks.com; 
x-originating-ip: [207.242.234.14]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a023368-ecf4-4dce-4e23-08d85b331b62
x-ms-traffictypediagnostic: CY1P110MB0535:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1P110MB0535061EF8D218A1CE2AF9448C3E0@CY1P110MB0535.NAMP110.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(86362001)(26005)(966005)(8936002)(186003)(4326008)(6506007)(53546011)(2906002)(8676002)(33656002)(54906003)(110136005)(7696005)(66446008)(64756008)(66556008)(66476007)(66946007)(76116006)(5660300002)(52536014)(508600001)(55016002)(9686003)(71200400001);
 DIR:OUT; SFP:1101; 
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a023368-ecf4-4dce-4e23-08d85b331b62
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2020 17:57:13.2232 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1P110MB0535
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

T24gVGh1cnNkYXksIFNlcHRlbWJlciAxNywgMjAyMCAxMjoxOSBQTSwgQW5kcmV3IENvb3BlciB3
cm90ZToNCj5PbiAxNy8wOS8yMDIwIDE1OjU3LCBTdGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6DQo+
PiBPbiBUaHVyc2RheSwgU2VwdGVtYmVyIDE3LCAyMDIwIDEwOjQzIEFNLCBBbmRyZXcgQ29vcGVy
IHdyb3RlOg0KPj4+IE9uIDE2LzA5LzIwMjAgMTk6MTgsIEplZmYgS3ViYXNjaWsgd3JvdGU6DQo+
Pj4+ICsvKg0KPj4+PiArICogQSBoYW5kbGUgd2l0aCBhbGwgemVyb3MgcmVwcmVzZW50cyBkb21h
aW4gMCBpZiBwcmVzZW50LCBvdGhlcndpc2UgaWRsZSBVTklUDQo+Pj4+ICsgKi8NCj4+Pj4gKyNk
ZWZpbmUgRE9NMF9IQU5ETEUgKChjb25zdCB4ZW5fZG9tYWluX2hhbmRsZV90KXswfSkNCj4+PiBU
aGlzIGlzbid0IGFjY3VyYXRlLg0KPj4+DQo+Pj4gVGhlcmUgYXJlIHN5c3RlbXMgd2hlcmUgZG9t
MCBkb2Vzbid0IGhhdmUgYSB6ZXJvIFVVSUQgKFhlblNlcnZlciBmb3INCj4+PiBvbmUpLCBhbmQg
aXRzIGVhc3kgdG8gY3JlYXRlIGRvbVUncyB3aGljaCBoYXZlIGEgemVybyBVVUlELiAgVGhleSBh
cmUNCj4+PiBub3QgdW5pcXVlLCBhbmQgY2FuIGJlIGNoYW5nZWQgYXQgYW55IHRpbWUgZHVyaW5n
IHRoZSBydW5uaW5nIG9mIHRoZSBWTS4NCj4+Pg0KPj4+IElmIHlvdSBuZWVkIGEgdW5pcXVlIGlk
ZW50aWZpZXIsIHRoZW4gdXNlIGRvbWlkJ3MuDQo+Pj4NCj4+PiBJIGNhbid0IHNlZSBhbnkgbGVn
aXRpbWF0ZSBuZWVkIGZvciB0aGUgc2NoZWR1bGVyIHRvIGhhbmRsZSB0aGUgVVVJRCBhdCBhbGwu
DQo+PiBXZSB0cmllZCBzd2l0Y2hpbmcgaXQgdG8gZG9taWQgYXQgb25lIHBvaW50IGluIHRoZSBw
YXN0LCBidXQgdGhlIHByb2JsZW0gd2FzIHRoYXQgd2hlbiBhIGRvbVUgcmVib290cyAoZGVzdHJv
eS9jcmVhdGUpIHRoZSBkb21pZA0KPmluY3JlbWVudHMsIHNvIHRoZSBzY2hlZHVsZSB3b3VsZCBo
YXZlIHRvIGJlIHJlaW5zdGFudGlhdGVkLg0KPg0KPkhvdyBhcmUgc2V0dGluZ3Mgc3BlY2lmaWVk
PyAgSWYgdGhleSdyZSBtYW51YWxseSB3aGlsZSB0aGUgZG9tYWluIGlzDQo+cnVubmluZywgdGhl
biBJJ2QgYXJndWUgdGhhdCBpcyBhIHVzZXIgYnVnLg0KDQpJdCBjb3VsZCBiZSBlaXRoZXIgcHJp
b3IgdG8gZG9tYWluIGNyZWF0aW9uIG9yIGFmdGVyLiBUaGUgdXNlciBuZWVkcyB0byBrbm93IHRo
ZSBVVUlEIChvciBkb21pZCwgaWYgd2Ugd2VyZSB0byBzd2l0Y2ggdG8gZG9taWQpIG9mIHRoZSBk
b21haW4ocykgdG8gYmUgc2NoZWR1bGVkLg0KDQpXZSB0eXBpY2FsbHkgdXNlIHRoaXMgdXRpbGl0
eSBbMl0gd2hpY2ggcmVsaWVzIG9uIHRvb2xzL2xpYnhjL3hjX2FyaW5jNjUzLmMNCg0KWzJdIGh0
dHBzOi8vZ2l0aHViLmNvbS9kb3JuZXJ3b3Jrcy9hNjUzX3NjaGVkDQoNCj4NCj5JZiB0aGUgc2V0
dGluZ3MgYXJlIHNwZWNpZmllZCBpbiB0aGUgVk0ncyBjb25maWd1cmF0aW9uIGZpbGUsIGFuZCB0
aGV5DQo+YXJlbid0IHJlYXBwbGllZCBvbiByZWJvb3QsIHRoZW4gdGhhdCBpcyBhIHRvb2xzdGFj
ayBidWcuDQo+DQo+PiBBdCBsZWFzdCB0aGF0IHdhcyB0aGUgY2FzZSBiZWZvcmUgYSByZWNlbnQg
cGF0Y2ggc2VyaWVzIGFsbG93aW5nIHRvIHNwZWNpZnkgZG9taWQgWzFdLCBidXQgSmVmZiBkZXZl
bG9wZWQgdGhpcyBDQVNULTMyQSBzZXJpZXMgcHJpb3IgdG8NCj50aGF0LiBUaGUgVVVJRCBjYW4g
YmUgc3BlY2lmaWVkIGluIHRoZSAuY2ZnIGZpbGUsIGFsbG93aW5nIGRvbVVzIHRvIHJlYm9vdCBh
bmQgY29tZSBiYWNrIHVwIHdpdGggdGhlIHNhbWUgVVVJRC4NCj4NCj5UaGUgVVVJRCBjYW4gYW5k
IGRvZXMgY2hhbmdlIGF0IHJ1bnRpbWUgaW4gc29tZSBjYXNlcywgd2hlbiB5b3UgZ2V0IGludG8N
Cj5tb3JlIGNvbXBsaWNhdGVkIGxpZmVjeWNsZSBzY2VuYXJpb3Mgc3VjaCBhcyBsb2NhbGhvc3Qg
bGl2ZSBtaWdyYXRpb24sDQo+YW5kL29yIFZNIEZvcmsvQ29XLg0KPg0KPg0KPkhhdmluZyBzY2hl
ZHVsZXIgc2V0dGluZ3MgcmVtZW1iZXJlZCBieSBVVUlELCBpbiB0aGUgbG93ZXIgbGF5ZXJzIG9m
IHRoZQ0KPmh5cGVydmlzb3IsIGZlZWxzIGxpa2UgYSBsYXllcmluZyB2aW9sYXRpb24uICBJdCBt
aWdodCB3b3JrIGZvciB5b3VyDQo+c3BlY2lmaWMgdXNlY2FzZSwgYnV0IGl0IGZlZWxzIGxpa2Ug
aXQgaXMgcGFwZXJpbmcgb3ZlciB0aGUgdW5kZXJseWluZw0KPmJ1ZywgYW5kIGl0IGlzIGluY29t
cGF0aWJsZSB3aXRoIG90aGVyIHVzYWdlIHNjZW5hcmlvcyB3aXRoaW4gWGVuLg0KDQpUaGVzZSBh
cmUgYWxsIGdvb2QgcG9pbnRzLiBJJ2Qgd2VsY29tZSBhIHN3aXRjaCB0byBkb21pZCwgYnV0IEkg
ZmVlbCBpdCBzaG91bGQgYmUgYSBzZXBhcmF0ZSBwYXRjaCBvciBzZXJpZXMuDQoNClN0ZXcNCg==

