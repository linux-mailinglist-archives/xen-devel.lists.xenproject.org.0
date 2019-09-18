Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6076B6247
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 13:32:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAY7c-0001Mv-JY; Wed, 18 Sep 2019 11:27:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YCyf=XN=amazon.de=prvs=1574f1310=wipawel@srs-us1.protection.inumbo.net>)
 id 1iAY7a-0001Mq-Tz
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 11:27:43 +0000
X-Inumbo-ID: 545947a2-da07-11e9-962d-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 545947a2-da07-11e9-962d-12813bfff9fa;
 Wed, 18 Sep 2019 11:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1568806062; x=1600342062;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=G6Eh8tMPTzp8iQohz6K5vTb4VuPR1J2yMYxGJuVtjUs=;
 b=RgFb1cS7X66KJKg4hoXq3dUF1ZDHV8IyJckUDvTXYhCHnU9dmUqQL3gk
 jYlqrPWvZk5DvYolxG+iMrSk0OqJ7+/r3aseaICpN8yKrJyu9sNqzJ9XV
 lyIuFarmhNS09+wg+60KSjxch8X85DiIhLaWYI7UvlaDJ8huKuBpOijxL s=;
X-IronPort-AV: E=Sophos;i="5.64,520,1559520000"; d="scan'208";a="785575616"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 18 Sep 2019 11:27:41 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com (Postfix) with ESMTPS
 id DDCDDC1152; Wed, 18 Sep 2019 11:27:38 +0000 (UTC)
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Sep 2019 11:27:37 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB004.ant.amazon.com (10.43.166.115) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Sep 2019 11:27:37 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Wed, 18 Sep 2019 11:27:37 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH] create-diff-object: more precisely identify .rodata
 sections
Thread-Index: AQHVbfOz/MMBt+ID2EWJUuzwV092UacxMOkAgAAAuYCAAAoqAIAAA2sAgAAA4oCAAAnWAIAAAk0A
Date: Wed, 18 Sep 2019 11:27:36 +0000
Message-ID: <0DDE80F8-7E7A-4A2D-B2E3-E8E7C626A608@amazon.com>
References: <20190918073538.24707-1-wipawel@amazon.de>
 <9c5a2063-35ab-5590-a079-9f361d95f7ee@suse.com>
 <2FFA152B-47AB-4C0E-9747-66B2D9EDFCAA@amazon.com>
 <e14a8a90-0afa-ebdd-ce70-be7896e9b612@arm.com>
 <23938.2492.424579.175738@mariner.uk.xensource.com>
 <4134F5DE-6497-4F32-9A5F-866E4D6C0735@amazon.com>
 <f164b812-4b52-bf5b-d48a-57fcc1e824cf@arm.com>
In-Reply-To: <f164b812-4b52-bf5b-d48a-57fcc1e824cf@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.48]
Content-ID: <0FD2A0A804D8B344A5AD227EFA3D5B70@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] create-diff-object: more precisely identify
 .rodata sections
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, "Pohlack,
 Martin" <mpohlack@amazon.de>, "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDE4LiBTZXAgMjAxOSwgYXQgMTM6MTksIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+IHdyb3RlOgo+IAo+IEhpIFBhd2VsLAo+IAo+IE9uIDE4LzA5LzIwMTkgMTE6NDQs
IFdpZWN6b3JraWV3aWN6LCBQYXdlbCB3cm90ZToKPj4+IE9uIDE4LiBTZXAgMjAxOSwgYXQgMTI6
NDEsIElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBjaXRyaXguY29tPiB3cm90ZToKPj4+IAo+Pj4g
SnVsaWVuIEdyYWxsIHdyaXRlcyAoIlJlOiBbUEFUQ0hdIGNyZWF0ZS1kaWZmLW9iamVjdDogbW9y
ZSBwcmVjaXNlbHkgaWRlbnRpZnkgLnJvZGF0YSBzZWN0aW9ucyIpOgo+Pj4+IE9uIDE4LzA5LzIw
MTkgMTA6NTIsIFdpZWN6b3JraWV3aWN6LCBQYXdlbCB3cm90ZToKPj4+Pj4gJCBzY3JpcHRzLy4v
YWRkX21haW50YWluZXJzLnBsIC1kIH4vZ2l0L2xpdmVwYXRjaC1idWlsZC10b29scwo+Pj4+IAo+
Pj4+ICctZCcgb25seSB0ZWxscyB5b3Ugd2hlcmUgdGhlIHBhdGNoZXMgZmlsZXMgYXJlLiBUaGUg
c2NyaXB0IHdpbGwgbG9vayB1cCBmb3IgdGhlCj4+Pj4gTUFJTlRBSU5FUlMgZmlsZSBpbiB0aGUg
Y3VycmVudCBkaXJlY3RvcnkuCj4+PiAKPj4+IEhtbW0uICBJIHdvbmRlciBpZiB3ZSBjb3VsZCBk
ZXRlY3QgdGhpcyBzaXR1YXRpb24gc29tZWhvdy4gIFRoaXMgd2lsbAo+Pj4gYmUgYSBjb21tb24g
dXNlciBlcnJvciBJIHRoaW5rLgo+Pj4gCj4+IEkgc2hvdWxkIGhhdmUgbG9va2VkIHR3aWNlIGJl
Zm9yZSBzZW5kaW5nIHRoZSBwYXRjaCBvdXQuIEJ1dCwgd2hhdCB3b3VsZCBiZSB2ZXJ5IGhlbHBm
dWwgZm9yIG1lCj4+IGlzIGFkZGl0aW9uYWwgb3B0aW9uIHRvIHRoZSBhZGRfbWFpbnRhaW5lcnMu
cGwgc2NyaXB0IGxpa2U6IC1tIC4vTUFJTlRBSU5FUlMKPiAKPiBXZWxsIHRoZSBmaWxlbmFtZSB3
aWxsIGFsd2F5cyBiZSB0aGUgc2FtZSwgc28gYXQgYmVzdCB5b3Ugd2lsbCBwcm92aWRlIHJlZHVu
ZGFudCBpbmZvcm1hdGlvbi4KCk5vdCBpZiBJIGNyZWF0ZSBhIGdpdC1pZ25vcmVkIHN5bWxpbmsg
dG8gdGhlIG90aGVyIHJlcG8uCgo+IAo+IEhvd2V2ZXIsIGl0IGlzIG5vdCB1bmNvbW1vbiB0byBo
YXZlIHNjcmlwdCB0aGF0IG5lZWRzIHRvIGFwcGx5IG9uIHRoZSBjdXJyZW50IGRpcmVjdG9yeS4g
V2hhdCB3b3VsZCBhIG5ldyBvcHRpb24gYWRkPyBJcyBpdCBqdXN0IGF2b2lkIHRvIGRvIGEgImNk
IC4uLiIgYmVmb3JlPwo+IAoKTWFpbmx5IHRoZSBuZXcgb3B0aW9uIHdpbGwgYXZvaWQgdGhlICdj
ZCcsIGJ1dCBpdCB3aWxsIGFsc28gZm9yY2UgbWUgdG8gc3BlY2lmeSB0aGUgcmlnaHQgZmlsZS4K
ClRoZSBvcHRpb24gY2FuIGJlIHRvdGFsbHkgb3B0aW9uYWwgd2l0aCBhIENXRCBhcyBhIGRlZmF1
bHQgZmFsbGJhY2suCgo+IENoZWVycywKPiAKPiAtLSAKPiBKdWxpZW4gR3JhbGwKCkJlc3QgUmVn
YXJkcywKUGF3ZWwgV2llY3pvcmtpZXdpY3oKCgoKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRl
ciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVo
cnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmljaApFaW5nZXRyYWdlbiBhbSBB
bXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGlu
ClVzdC1JRDogREUgMjg5IDIzNyA4NzkKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
