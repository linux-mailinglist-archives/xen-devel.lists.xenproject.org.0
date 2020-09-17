Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 147E726DEDE
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 16:57:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIvLZ-0007Cd-2u; Thu, 17 Sep 2020 14:57:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qtsM=C2=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1kIvLX-0007CY-Ew
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 14:57:15 +0000
X-Inumbo-ID: 26e9449f-50b9-40db-b53a-81e31785966a
Received: from USG02-CY1-obe.outbound.protection.office365.us (unknown
 [23.103.209.59]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26e9449f-50b9-40db-b53a-81e31785966a;
 Thu, 17 Sep 2020 14:57:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=cTYATzgwxNTT7BOQ2wi9NuLHSLvskvPEsQTZFDcUCNIAOg48vxAo/nJrC8ng08kaLtVjSXK6IzIIYC9NkQbCiNcFwGiyg5RlXA/wbWy6SwAyBw6BMzr3KMxNKBzedD/NhVDwq1qZtTR6D47MpB8ZcuMpmy7QFZRfdxTTfh0HJddZIML++F8OaF7xTxHvQrhJM8I+Kc62ZJBC+WSd2bcSNYAh2ppmutsY9Bm0U3PjTgN5YPyvVC5LindJVB9la6x2w1q1mee6e0cBpfSRWJVmcFLZUGqV9logX9u7MiUa03DRz6iH+tOHUbkM0ZZa+r9KAebMWKP/767owwHjvO+rDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgvPIBKTA1q9TYRrRuAx0tr4kSYnYsZKfYeOqQAkcn0=;
 b=dxs26SgnmKZXn6vMNAsJBrj0YfCwHrIDwrc3Gxw/7qvGy5yILE6D3eIOy1F7+eWyfqr5oS3pspfcDlnyaOrcchRtgrkn5EANHLR/KABng9LbNHIab97iywyyo/2jViUCK3m2I/NM/GS9jbVnKWhaWn/z/mOFQORtke4LojPU3RJ9usmCgKYkqHCaTpubgV57NoW4krFuvzPWrgAGKvs/F6ws4podRK5FRfWJx2FjQkc1StvvURHuxFcuZ0Uxsptl5vq/o/cP5ou2iPhcrZYQxR/Xp5HO5F+36Dc1beZzDQj081wwvb1gJmsL6UIReU526cPnsHU/6t88B0PTHDtqWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dornerworks.com; dmarc=pass action=none
 header.from=dornerworks.com; dkim=pass header.d=dornerworks.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dornerworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgvPIBKTA1q9TYRrRuAx0tr4kSYnYsZKfYeOqQAkcn0=;
 b=mG9irVEDiKoffBUWGhL0yOoAYTQ8xHbk5qNJpPeeR+TSUoNaWVgzrxo/jlSPb4xUAB5HRFhgZfUGgcB8Nm08WIzR2p39gHCeMYErJDjvZYumz7hFBKu7KX9RrMNNfIAS/7Ej8F1yriVFd/BopX7JTVSgpKa3XxzwDgj3Ogu4krnZaOXhf/NdjD3RtDg/NizuFRGqRr2vHrMHenENftqkQT3iBlKk7bHX///zJSgSf5nkd384Q8tLqKqQxnMZPpzUw28zCoEZ1AehVvF8LCXoK7OoTKYZPjjZeT35BbftQuIUcPpXGVQpQVA8eFGoo7/3D2wR10t+Fr3WZWjKxGw6ow==
Received: from CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:404::14)
 by CY1P110MB0328.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:401::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Thu, 17 Sep
 2020 14:57:08 +0000
Received: from CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM
 ([fe80::75b8:922a:1a45:32c0]) by CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM
 ([fe80::75b8:922a:1a45:32c0%10]) with mapi id 15.20.3391.015; Thu, 17 Sep
 2020 14:57:08 +0000
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
Thread-Index: AQHWjFXo8LfVF1vuZEGd+q7v79upsqls6PEAgAAAqMA=
Date: Thu, 17 Sep 2020 14:57:08 +0000
Message-ID: <CY1P110MB05519EEB1C9F879D54ECF6F58C3E0@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
References: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
 <20200916181854.75563-6-jeff.kubascik@dornerworks.com>
 <36f7ed35-039c-482b-c04b-0f2348de37f6@citrix.com>
In-Reply-To: <36f7ed35-039c-482b-c04b-0f2348de37f6@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none; citrix.com; dmarc=none action=none header.from=dornerworks.com; 
x-originating-ip: [207.242.234.14]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4559dd5-6fdd-44fe-4016-08d85b19f348
x-ms-traffictypediagnostic: CY1P110MB0328:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1P110MB03283460286B85F883A6E0CF8C3E0@CY1P110MB0328.NAMP110.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(2906002)(5660300002)(8676002)(186003)(86362001)(53546011)(6506007)(52536014)(26005)(71200400001)(7696005)(508600001)(8936002)(966005)(76116006)(4326008)(33656002)(66946007)(54906003)(9686003)(66476007)(66556008)(64756008)(66446008)(110136005)(55016002);
 DIR:OUT; SFP:1101; 
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c4559dd5-6fdd-44fe-4016-08d85b19f348
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2020 14:57:08.5444 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1P110MB0328
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

T24gVGh1cnNkYXksIFNlcHRlbWJlciAxNywgMjAyMCAxMDo0MyBBTSwgQW5kcmV3IENvb3BlciB3
cm90ZToNCj5PbiAxNi8wOS8yMDIwIDE5OjE4LCBKZWZmIEt1YmFzY2lrIHdyb3RlOg0KPj4gKy8q
DQo+PiArICogQSBoYW5kbGUgd2l0aCBhbGwgemVyb3MgcmVwcmVzZW50cyBkb21haW4gMCBpZiBw
cmVzZW50LCBvdGhlcndpc2UgaWRsZSBVTklUDQo+PiArICovDQo+PiArI2RlZmluZSBET00wX0hB
TkRMRSAoKGNvbnN0IHhlbl9kb21haW5faGFuZGxlX3QpezB9KQ0KPg0KPlRoaXMgaXNuJ3QgYWNj
dXJhdGUuDQo+DQo+VGhlcmUgYXJlIHN5c3RlbXMgd2hlcmUgZG9tMCBkb2Vzbid0IGhhdmUgYSB6
ZXJvIFVVSUQgKFhlblNlcnZlciBmb3INCj5vbmUpLCBhbmQgaXRzIGVhc3kgdG8gY3JlYXRlIGRv
bVUncyB3aGljaCBoYXZlIGEgemVybyBVVUlELiAgVGhleSBhcmUNCj5ub3QgdW5pcXVlLCBhbmQg
Y2FuIGJlIGNoYW5nZWQgYXQgYW55IHRpbWUgZHVyaW5nIHRoZSBydW5uaW5nIG9mIHRoZSBWTS4N
Cj4NCj5JZiB5b3UgbmVlZCBhIHVuaXF1ZSBpZGVudGlmaWVyLCB0aGVuIHVzZSBkb21pZCdzLg0K
Pg0KPkkgY2FuJ3Qgc2VlIGFueSBsZWdpdGltYXRlIG5lZWQgZm9yIHRoZSBzY2hlZHVsZXIgdG8g
aGFuZGxlIHRoZSBVVUlEIGF0IGFsbC4NCg0KV2UgdHJpZWQgc3dpdGNoaW5nIGl0IHRvIGRvbWlk
IGF0IG9uZSBwb2ludCBpbiB0aGUgcGFzdCwgYnV0IHRoZSBwcm9ibGVtIHdhcyB0aGF0IHdoZW4g
YSBkb21VIHJlYm9vdHMgKGRlc3Ryb3kvY3JlYXRlKSB0aGUgZG9taWQgaW5jcmVtZW50cywgc28g
dGhlIHNjaGVkdWxlIHdvdWxkIGhhdmUgdG8gYmUgcmVpbnN0YW50aWF0ZWQuIEF0IGxlYXN0IHRo
YXQgd2FzIHRoZSBjYXNlIGJlZm9yZSBhIHJlY2VudCBwYXRjaCBzZXJpZXMgYWxsb3dpbmcgdG8g
c3BlY2lmeSBkb21pZCBbMV0sIGJ1dCBKZWZmIGRldmVsb3BlZCB0aGlzIENBU1QtMzJBIHNlcmll
cyBwcmlvciB0byB0aGF0LiBUaGUgVVVJRCBjYW4gYmUgc3BlY2lmaWVkIGluIHRoZSAuY2ZnIGZp
bGUsIGFsbG93aW5nIGRvbVVzIHRvIHJlYm9vdCBhbmQgY29tZSBiYWNrIHVwIHdpdGggdGhlIHNh
bWUgVVVJRC4NCg0KU3Rldw0KDQpbMV0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNo
aXZlcy9odG1sL3hlbi1kZXZlbC8yMDIwLTAyL21zZzAxNTc0Lmh0bWwNCg0KPn5BbmRyZXcNCg==

