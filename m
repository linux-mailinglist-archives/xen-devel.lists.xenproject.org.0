Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB69BB77A0
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 12:42:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAtqm-00066x-Nv; Thu, 19 Sep 2019 10:39:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Kjlc=XO=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iAtql-00066L-8x
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 10:39:47 +0000
X-Inumbo-ID: cc1e6dae-dac9-11e9-b299-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc1e6dae-dac9-11e9-b299-bc764e2007e4;
 Thu, 19 Sep 2019 10:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568889586;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=b3C/g45hogfYJfGGr/4UHiE3/7xUXTQMcPxbo5jEeok=;
 b=QgfrjYRTJXBsnJ6Thdas5tVbo5BP+ez5+FzG5vLn8t9ZbXx9I254eoGO
 9IoVvJ+mIDcCH6uzcEX3OYbdRhi+6uYSVpKLOpELtBdjIQuuKlnKSXEZ1
 f9I4ZNvTk9vicW612BHyx3qcM1cgUFkWVqmuj3C8ji/n/erd927zbInqR 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1Ovz0xZ/fNx+23cCYxZyvDrGC8i2r1P74POWCRmHmZpyl15X3SPM/VR6KE6i4VX4ram3cX/a7+
 +zceB2CFHoDefah6C1Wis7GJVUUEFFfRpNQ8dM3Yn9MDHBQKJln7m9FHVmID7sikd//zfYkDmB
 gMP69SK4bVkppQ77xQqfD9RZvSRXQJO8B4KuA5/jjmRlZqkaC6ol16oOWg/P0dlYhZNhkhXFi8
 kOCFQ2vbJ3SFfLKRr49V8fcNrQ+ckzibJAdwNwbBqqrsBOFvbmNQWvpnRmcXQe8zm7LTG73yp4
 uDU=
X-SBRS: 2.7
X-MesageID: 6037283
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,523,1559534400"; 
   d="scan'208";a="6037283"
From: Lars Kurth <lars.kurth@citrix.com>
To: Julien Grall <julien.grall@arm.com>, Ian Jackson <Ian.Jackson@citrix.com>, 
 Doug Goldstein <cardoe@cardoe.com>, Ross Lagerwall
 <ross.lagerwall@citrix.com>
Thread-Topic: add_maintainers.pl issues / "canonical" subject prefixes for CI
 v2 (was Re: [PATCH] create-diff-object: more precisely identify
 .rodata sections)
Thread-Index: AQHVbtaLZC4GBrVpIE6gk1dgGDEv7w==
Date: Thu, 19 Sep 2019 10:39:41 +0000
Message-ID: <D5C1CEEA-00A1-45D2-8CC7-C985ECDDDD7F@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.e.190909
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <537A864C517A664D85746258970C91FC@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] add_maintainers.pl issues / "canonical" subject
 prefixes for CI v2 (was Re: [PATCH] create-diff-object: more precisely
 identify .rodata sections)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, "Pohlack,
 Martin" <mpohlack@amazon.de>, "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

K1Jvc3MgDQorIERvdWcNCg0K77u/T24gMTkvMDkvMjAxOSwgMTA6MzAsICJKdWxpZW4gR3JhbGwi
IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6DQoNCiAgICBIaSBMYXJzLA0KICAgIA0KICAg
IE9uIDE4LzA5LzIwMTkgMTM6MTQsIExhcnMgS3VydGggd3JvdGU6DQogICAgPiANCiAgICA+IA0K
ICAgID4gT24gMTgvMDkvMjAxOSwgMTI6MTUsICJKdWxpZW4gR3JhbGwiIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT4gd3JvdGU6DQogICAgPiANCiAgICA+ICAgICAgSGkgSWFuLA0KICAgID4gICAgICAN
CiAgICA+ICAgICAgT24gMTgvMDkvMjAxOSAxMTo0MSwgSWFuIEphY2tzb24gd3JvdGU6DQogICAg
PiAgICAgID4gSnVsaWVuIEdyYWxsIHdyaXRlcyAoIlJlOiBbUEFUQ0hdIGNyZWF0ZS1kaWZmLW9i
amVjdDogbW9yZSBwcmVjaXNlbHkgaWRlbnRpZnkgLnJvZGF0YSBzZWN0aW9ucyIpOg0KICAgID4g
ICAgICA+PiBPbiAxOC8wOS8yMDE5IDEwOjUyLCBXaWVjem9ya2lld2ljeiwgUGF3ZWwgd3JvdGU6
DQogICAgPiAgICAgID4+PiAkIHNjcmlwdHMvLi9hZGRfbWFpbnRhaW5lcnMucGwgLWQgfi9naXQv
bGl2ZXBhdGNoLWJ1aWxkLXRvb2xzDQogICAgPiAgICAgID4+DQogICAgPiAgICAgID4+ICctZCcg
b25seSB0ZWxscyB5b3Ugd2hlcmUgdGhlIHBhdGNoZXMgZmlsZXMgYXJlLiBUaGUgc2NyaXB0IHdp
bGwgbG9vayB1cCBmb3IgdGhlDQogICAgPiAgICAgID4+IE1BSU5UQUlORVJTIGZpbGUgaW4gdGhl
IGN1cnJlbnQgZGlyZWN0b3J5Lg0KICAgID4gICAgICA+DQogICAgPiAgICAgID4gSG1tbS4gIEkg
d29uZGVyIGlmIHdlIGNvdWxkIGRldGVjdCB0aGlzIHNpdHVhdGlvbiBzb21laG93LiAgVGhpcyB3
aWxsDQogICAgPiAgICAgID4gYmUgYSBjb21tb24gdXNlciBlcnJvciBJIHRoaW5rLg0KICAgID4g
ICAgICBJIHRoaW5rIGl0IHdvdWxkIGJlIHBvc3NpYmxlIGZvciBwYXRjaCBtb2RpZnlpbmcgZmls
ZS4gV2UgY291bGQgY2hlY2sgd2hldGhlcg0KICAgID4gICAgICB0aGUgZmlsZSBtb2RpZmllZCBl
eGlzdCBpbiB0aGUgcmVwby4gVGhvdWdoLCBJIGFtIG5vdCBzdXJlIGhvdyBkaWZmaWN1bHQgaXQN
CiAgICA+ICAgICAgd291bGQgYmUgdG8gaW1wbGVtZW50Lg0KICAgID4gICAgICANCiAgICA+IFRo
YXQgbWlnaHQgYmUgZG9hYmxlLCBidXQgd29uJ3QgYmUgZWFzeSBhcyBJIHdpbGwgZXNzZW50aWFs
bHkgbmVlZCB0byBwYXJzZSB0aGUgcGF0Y2gNCiAgICA+IEFuZCBpdCB3b24ndCBiZSByZWxpYWJs
ZS4NCiAgICA+IA0KICAgID4gVGhlIG9ubHkgd29ya2FibGUgd2F5IG9mIGRvaW5nIHRoaXMgbWF5
IGJlIHRvIGhhdmUgYSBzdHJvbmcgY29udmVudGlvbg0KICAgID4gdGhhdCByZXF1aXJlcyB0byB1
c2UgdGhlIFtSRVBPTkFNRSBQQVRDSF0gdmlhIC0tc3ViamVjdC1wcmVmaXggd2hlbiBnZW5lcmF0
aW5nIHRoZQ0KICAgID4gcGF0Y2ggYW5kIGZvciBhZGRfbWFpbnRhaW5lcnMucGwgdG8gdmVyaWZ5
IHRoaXMgc29tZWhvdyBiYXNlZCBvbiB0aGUgY3VycmVudA0KICAgID4gZGlyZWN0b3J5IGFuZCB0
aGUgcGF0Y2hlcy4NCiAgICA+IA0KICAgID4gV2UgYWxyZWFkeSBoYXZlIHN0cm9uZyBjb252ZW50
aW9ucyBpbiBzb21lIGNhc2VzLCBlLmcuIGZvciBPU1NURVNUIHdlIGFsd2F5cyB1c2UNCiAgICA+
IFtPU1NURVNUIFBBVENIXS4gVGhpcyB3b3VsZCBwb3RlbnRpYWxseSBiZSBoZWxwZnVsIGZvciB0
aGUgQ0kgbG9vcCBwbGFucyBhc28uDQogICAgPiANCiAgICA+IEFzc3VtaW5nIHRoZXJlIGlzIGEg
Z2l0IGNvbmZpZyBzZXR0aW5nIGZvciAtLXN1YmplY3QtcHJlZml4IHRoZW4gdGhpcyBjb3VsZCBi
ZSBtYWRlDQogICAgPiB0byB3b3JrLiBJIGNvdWxkIGFkZCBhIHNlY3Rpb24gdW5kZXIgWzFdIHRv
IGRvY3VtZW50IHRoZSBjb252ZW50aW9uIHdpdGggdGhlDQogICAgPiBhcHByb3ByaWF0ZSBnaXQg
Y29tbWFuZC4gV2UgY291bGQgaW5jbHVkZSBhIHNjcmlwdCAoZS5nLiB4ZW4uZ2l0OnNjcmlwcy9n
aXQtc2V0dXApDQogICAgPiB3aGljaCBkb2VzIHRoaXMgYmFzZWQgb24gdGhlIHJlcG8gbmFtZSBh
dXRvbWF0aWNhbGx5Lg0KICAgIA0KICAgIEkgc2F3IGEgY29udmVyc2F0aW9uIG9uIElSQyBhYm91
dCB0aGlzLiBCdXQgaXQgaXMgbm90IGNsZWFyIGlmIHRoZXJlIHdhcyBhbnkgDQogICAgY29uY2x1
c2lvbj8NCg0KSWFuIHdhcyBnb2luZyB0byB3cml0ZSBkb3duIHdoYXQgd2UgZGlzY3Vzc2VkDQog
ICAgDQogICAgTXkgb25seSBzbGlnaHQgY29uY2VybiBhYm91dCB0YWdnaW5nIGJ5IGRlZmF1bHQg
aXMgdGhlIGxlbmd0aCBvZiB0aGUgc3ViamVjdCwgDQogICAgd2hlbiBkaXJlY3RseSByZWNlaXZp
bmcgZnJvbSB4ZW4tZGV2ZWwgKGkuZS4gbm90IENDZWQpLCB0aGUgc3ViamVjdCBpcyBhbHJlYWR5
IA0KICAgIFt4ZW4tZGV2ZWxdW1BBVENIIFhYL1hYXS4gSSBhbSBhc3N1bWluZyB0aGUgdGFnIHdp
bGwgbm90IGJlIGRyb3BwZWQgc28gaXQgd2lsbCANCiAgICBhcHBlYXIgb24gdGhlIG1haWxpbmcg
bGlzdC4gRm9yIHJlcG8gc3VjaCBhcyBMSVZFUEFUQ0gtQlVJTEQsIHRoaXMgd291bGQgZW5kIHVw
IA0KICAgIHRvIGxlbmd0aHkgcHJlZml4Lg0KDQpUaGF0IGlzIHRydWU6IEkgdGhpbmsgd2UgZG8g
bmVlZCB0byBoYXZlIGEgZm9ybWFsIGRpc2N1c3Npb24gd2l0aCB2b3RlIGFib3V0IHRoaXMgYXQg
c29tZSBwb2ludC4gDQoNCkFuZCB3ZSBjYW4gY2VydGFpbmx5IHNob3J0ZW4gc29tZSBvZiB0aG9z
ZSAiY2Fub25pY2FsIiBzdWJqZWN0IHByZWZpeGVzLiANCkJ1dCBoYXZpbmcgZ29uZSBiYWNrIHRv
IHRoZSBlYXJseSBwYXRjaGVzIHBvc3RlZCBmb3IgTElWRVBBVENILUJVSUxEIGJ5IEtvbnJhZCBh
bmQgUm9zcywgdGhleSB3ZXJlIGVpdGhlcg0KW0xJVkVQQVRDSC1CVUlMRC1UT09MU10gb3IgW0xJ
VkVQQVRDSC1CVUlMRC1UT09MUyBQQVRDSF0NCg0KTXkgdmlldyBhdCB0aGlzIHN0YWdlLCBpcyB0
aGF0IEkgYW0gbWVyZWx5IGRvY3VtZW50aW5nIGV4aXN0aW5nIGNvbnZlbnRpb25zIA0KVGhlIGV4
Y2VwdGlvbiBpcyAiWEVOIFBBVENIIg0KDQpGb3IgcGVvcGxlIHdobyBhcmUganVzdCBzdGFydGlu
ZyB0byByZWFkIHRoaXMgY29udmVyc2F0aW9uLCBzZWUNCiogaHR0cHM6Ly93aWtpLnhlbnByb2pl
Y3Qub3JnL3dpa2kvU3VibWl0dGluZ19YZW5fUHJvamVjdF9QYXRjaGVzI1NldHRpbmdzX3RoYXRf
aGVscF9zYXZlX3lvdV90aW1lDQoqIGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL1N1
Ym1pdHRpbmdfWGVuX1Byb2plY3RfUGF0Y2hlcyNTdWJqZWN0X1ByZWZpeCANCndoaWNoIEkgYWRk
ZWQgeWVzdGVyZGF5DQoNCldlIGRvIG5lZWQgdG8gc29sdmUgdGhpcyBzb21laG93IGZvciB0d28g
cmVhc29uczoNCjEuIEZvb2wgcHJvb2ZpbmcgYWRkX21haW50YWluZXJzLnBsIHRvb2wgW2FsdGhv
dWdoIHRoaXMgaXMgcmVsYXRpdmVseSBtaW5vcl0NCjIuIE1vcmUgaW1wb3J0YW50bHkgd2UgbmVl
ZCB0byBzdXBwb3J0IHRoZSBDSSB2MiBjYXBhYmlsaXR5IChha2EgdHJpZ2dlcmluZyB0ZXN0cyBm
b3IgcGF0Y2hlcyBwb3N0ZWQgdG8geGVuLWRldmVsQCkNCg0KT24gMTogSWFuIGhhZCBhbiBpZGVh
LCB3aGljaCBJIHRoaW5rIEkgdW5kZXJzdG9vZCBjb3JyZWN0bHksIGJ1dCBhbSBub3QgMTAwJSBz
dXJlLiBTbyB3YWl0aW5nIGZvciBoaW0gdG8gd3JpdGUgaXQgZG93bg0KDQpPbiAyOiBXZSBuZWVk
IGEgd2F5IHRvIGlkZW50aWZ5IHdoaWNoIHRyZWUgYSBwYXRjaCBvciBwYXRjaCBzZXJpZXMgaXMg
Zm9yLCBzdWNoIHRoYXQgYW55IENJIGluZnJhIGNhbiBwZXJmb3JtIHRoZSByaWdodCBhY3Rpb24s
IGluIGxpZ2h0IG9mDQoqIFFFTVUsIExJTlVYLCAuLi4gcGF0Y2hlcyBhcmUgcG9zdGVkIHRvIHhl
bi1kZXZlbEAgdG9kYXkNCiogUGF0Y2hlcyBmb3IgbXVsdGlwbGUgeGVuLXJlcG9zIGFyZSBwb3N0
ZWQgdG8geGVuLWRldmVsQCB0b2RheQ0KDQpCdXQgbWF5YmUgd2Ugc2hvdWxkIG1vdmUgdGhpcyBp
bnRvIGEgbmV3IHRocmVhZC4gSW4gdGhlIG1lYW50aW1lIEkgY2hhbmdlZCB0aGUgc3ViamVjdCBs
aW5lDQoNCkxhcnMNCg0KICAgIA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
