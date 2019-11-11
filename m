Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D57E1F764A
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2019 15:22:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUAXH-0000Rc-Be; Mon, 11 Nov 2019 14:19:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mQsP=ZD=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iUAXG-0000RX-0k
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2019 14:19:18 +0000
X-Inumbo-ID: 3e1b30fc-048e-11ea-a210-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e1b30fc-048e-11ea-a210-12813bfff9fa;
 Mon, 11 Nov 2019 14:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573481957;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=D4S8yvPNIXkH+bR1ULFCYSYhL9O5YAkXbMneyAeZ3CE=;
 b=N0yr5rZq1FpsJkDa3QF9A7WVy9UwffOsBgLhUmtTQCEmO1JmZm81KVpI
 EDtQHq3Ln30KAKFmdgS4nCxZ3GUvRcmIcABMg9VuzJYha7/c/xbGPyIPF
 RR0SeAMew92Is9MCxPcmm3FJ0hWu0COxVj0AONbfYLB3Z6yE3tAnBBW2N 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: slf/V3y/TMnJCR9N1aFv6AegFSeDS9OXcYG1qQiSzCMqzRGHIQ61XWDl40yffohqNtGR3awsQk
 Aud5HwyAz1w7xKXWPnbyTLr1mi31vf99BHeh5bG0bCwBDYWgyoBdEr+NYHpElAwVEnh6yKCe0K
 l/apId5E3L8SzgmXDiBa2/Oz3xnLrqCjajDlDHHAfAmevuMcF+Yqs2IoYkqyf+o9a64nft51fz
 BKdWzzOfjcnMd3TyvvnSkQYyUa4hrQ4aO/CRAxHpr9LlpUnVeF+DIAFxIYiy5sfZXKzyxVGlH2
 qKE=
X-SBRS: 2.7
X-MesageID: 8251029
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,293,1569297600"; 
   d="scan'208";a="8251029"
From: Lars Kurth <lars.kurth@citrix.com>
To: George Dunlap <George.Dunlap@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] Introduce a description of a new optional tag for
 Backports
Thread-Index: AQHVlmgfiNV0BAuOmESFGDJkYFUlYaeF9p0A//+dM4A=
Date: Mon, 11 Nov 2019 14:19:12 +0000
Message-ID: <D214323D-A890-45D6-B07B-F975FF88FC4D@citrix.com>
References: <20191108190952.22163-1-sstabellini@kernel.org>
 <a161d23f-391d-3547-4949-ccb95fb09384@citrix.com>
In-Reply-To: <a161d23f-391d-3547-4949-ccb95fb09384@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.f.191014
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <837984070AAB9E41BEFAED8ABC22BD46@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] Introduce a description of a new optional
 tag for Backports
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
Cc: "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDExLzExLzIwMTksIDA4OjEyLCAiR2VvcmdlIER1bmxhcCIgPGdlb3JnZS5kdW5s
YXBAY2l0cml4LmNvbT4gd3JvdGU6DQoNCiAgICBPbiAxMS84LzE5IDc6MDkgUE0sIFN0ZWZhbm8g
U3RhYmVsbGluaSB3cm90ZToNCiAgICA+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3RlZmFuby5zdGFiZWxsaW5pQHhpbGlueC5jb20+DQogICAgPiBDQzogamJldWxpY2hAc3Vz
ZS5jb20NCiAgICA+IENDOiBnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20NCiAgICA+IENDOiBqdWxp
ZW5AeGVuLm9yZw0KICAgID4gQ0M6IGxhcnMua3VydGhAY2l0cml4LmNvbQ0KICAgID4gQ0M6IGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20NCiAgICA+IENDOiBpYW4uamFja3NvbkBldS5jaXRyaXgu
Y29tDQogICAgPiBDQzoga29ucmFkLndpbGtAb3JhY2xlLmNvbQ0KICAgID4gQ0M6IHdsQHhlbi5v
cmcNCiAgICA+IC0tLQ0KICAgID4gIGRvY3MvcHJvY2Vzcy9iYWNrcG9ydC10YWcucGFuZG9jIHwg
MjMgKysrKysrKysrKysrKysrKysrKysrKysNCiAgICA+ICAxIGZpbGUgY2hhbmdlZCwgMjMgaW5z
ZXJ0aW9ucygrKQ0KICAgID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkb2NzL3Byb2Nlc3MvYmFja3Bv
cnQtdGFnLnBhbmRvYw0KICAgID4gDQogICAgPiBkaWZmIC0tZ2l0IGEvZG9jcy9wcm9jZXNzL2Jh
Y2twb3J0LXRhZy5wYW5kb2MgYi9kb2NzL3Byb2Nlc3MvYmFja3BvcnQtdGFnLnBhbmRvYw0KICAg
ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCiAgICA+IGluZGV4IDAwMDAwMDAwMDAuLmU1NzBlZmRj
YzgNCiAgICA+IC0tLSAvZGV2L251bGwNCiAgICA+ICsrKyBiL2RvY3MvcHJvY2Vzcy9iYWNrcG9y
dC10YWcucGFuZG9jDQogICAgPiBAQCAtMCwwICsxLDIzIEBADQogICAgPiArQmFja3BvcnQgVGFn
DQogICAgPiArLS0tLS0tLS0tLS0tDQogICAgPiArDQogICAgPiArQSBiYWNrcG9ydCB0YWcgaXMg
YW4gb3B0aW9uYWwgdGFnIGluIHRoZSBjb21taXQgbWVzc2FnZSB0byByZXF1ZXN0IGENCiAgICA+
ICtnaXZlbiBjb21taXQgdG8gYmUgYmFja3BvcnRlZCB0byB0aGUgc3RhYmxlIHRyZWVzOg0KICAg
ID4gKw0KICAgID4gKyAgICBCYWNrcG9ydDogYWxsDQogICAgPiArDQogICAgPiArSXQgbWFya3Mg
YSBjb21taXQgZm9yIGJlaW5nIGEgY2FuZGlkYXRlIGZvciBiYWNrcG9ydHMgdG8gYWxsIHJlbGV2
YW50DQogICAgPiArdHJlZXMuDQogICAgPiArDQogICAgPiArICAgIEJhY2twb3J0OiA0LjkrDQog
ICAgPiArDQogICAgPiArSXQgbWFya3MgYSBjb21taXQgZm9yIGJlaW5nIGEgY2FuZGlkYXRlIGZv
ciBiYWNrcG9ydHMgdG8gYWxsIHN0YWJsZQ0KICAgID4gK3RyZWVzIGZyb20gNC45IG9ud2FyZC4N
CiAgICA+ICsNCiAgICA+ICtNYWludGFpbmVycyByZXF1ZXN0IHRoZSBCYWNrcG9ydCB0YWcgdG8g
YmUgYWRkZWQgb24gY29tbWl0Lg0KICAgID4gK0NvbnRyaWJ1dG9ycyBhcmUgYWxzbyB3ZWxjb21l
IHRvIG1hcmsgdGhlaXIgcGF0Y2hlcyB3aXRoIHRoZSBCYWNrcG9ydA0KICAgID4gK3RhZyB3aGVu
IHRoZXkgZGVlbSBhcHByb3ByaWF0ZS4gTWFpbnRhaW5lcnMgd2lsbCByZXF1ZXN0IGZvciBpdCB0
byBiZQ0KICAgID4gK3JlbW92ZWQgd2hlbiB0aGF0IGlzIG5vdCB0aGUgY2FzZS4NCiAgICA+ICsN
CiAgICA+ICtQbGVhc2Ugbm90ZSB0aGF0IHRoZSBCYWNrcG9ydCB0YWcgaXMgYSAqKnJlcXVlc3Qq
KiBmb3IgYmFja3BvcnQsIHdoaWNoDQogICAgPiArd2lsbCBzdGlsbCBuZWVkIHRvIGJlIGV2YWx1
YXRlZCBieSB0aGUgc3RhYmxlIHRyZWUgbWFpbnRhaW5lcnMuDQogICAgDQogICAgVGhlIHRleHQg
YW5kIHRoZSBpZGVhIGJvdGggbG9vayBnb29kIHRvIG1lLg0KICAgIA0KICAgIEJ1dCBpdCBzZWVt
cyBraW5kIG9mIGJhbGthbml6ZWQgdG8gcHV0IGl0IGluIGl0cyBvd24gZmlsZS4gIFdvdWxkIGl0
IGJlDQogICAgYmV0dGVyIHRvIHRyeSB0byBtYWtlIGEgc2xpZ2h0bHkgbW9yZSBnZW5lcmFsIGJp
dCBvZiBjb250ZW50PyAgRWl0aGVyDQogICAgYWJvdXQgdGhlIGJhY2twb3J0IHByb2Nlc3MsIG9y
IGFib3V0IHRhZ3MgaW4gZ2VuZXJhbD8NCiAgICANCkl0IHNob3VsZCBiZSBpbiBodHRwczovL3dp
a2kueGVucHJvamVjdC5vcmcvd2lraS9TdWJtaXR0aW5nX1hlbl9Qcm9qZWN0X1BhdGNoZXMjV2hh
dF9pc19pbl9hX3BhdGNoLjNGDQpXaGF0IGlzIGN1cnJlbnRseSBtaXNzaW5nIGlzDQotIFJlbGVh
c2UtQWNrZWQtYnkNCi0gVGhlIG5ldyBwcm9wb3NlZCB0YWcgDQoNCkJ1dCBtYXliZSB3ZSBzaG91
bGQgaGF2ZSBhIG1hc3RlciBkb2N1bWVudCBpbiB0cmVlLCB3aGljaCBkZWZpbmVzIHRoZSB0YWdz
IGluIHVzZQ0KQW5kIHRoZW4gSSBjYW4gcmVmZXIgdG8gaXQgZnJvbSBodHRwczovL3dpa2kueGVu
cHJvamVjdC5vcmcvd2lraS9TdWJtaXR0aW5nX1hlbl9Qcm9qZWN0X1BhdGNoZXMjV2hhdF9pc19p
bl9hX3BhdGNoLjNGIA0KDQpSZWdhcmRzDQpMYXJzDQoNCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
