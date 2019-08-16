Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EFF90117
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 14:07:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyayl-0007xQ-48; Fri, 16 Aug 2019 12:05:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z4MO=WM=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hyayj-0007wj-9z
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 12:05:09 +0000
X-Inumbo-ID: 1709760e-c01e-11e9-aee9-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1709760e-c01e-11e9-aee9-bc764e2007e4;
 Fri, 16 Aug 2019 12:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565957109;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=fl7qS/uca2ykKZFX9ydb/X5p8RZox18b0flGn9b49a4=;
 b=QnPgTZw5PI/x1ElzstFMEAK3LZoie7QlOXqducoZ+6yzizPDINt7b1OR
 cVZoMzF6Qfe4ax0yI5uITkw9UlhwLm/jiwgRSQ36OEnzP1eBWFq6qQQxG
 8VXjCPGa9AY6Hxjog2bv+LIeLSwzUy2qYQEF0YxaMp2/UCFGnxCNdrq1o 4=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: s0Q2IkfThDOZd65PO2XPo3DmAUvrCirPQRfd70Y2YgzbAAjVL6XjfCGKMwYCifBKUB8v6iI8/H
 T0CAEKMQEKxqjfDwvZjg/OLXLEZcg5Emehw+zpk1RNkKBHCSbVIDqbP+Jq2skQxNZbpyJe/t3m
 iZJr/4xqPoqRXLRNdxrHexM56jKxQFL3FQbeg2hFU6l79Bl1YoYwIyab9UX1/wpG63E+LqK3w4
 GBJ5aUk0XFyX2qzTrcTCPDj+AdU+grmRtrJKwnZtXEbm5Jo+0wEh8tM3+QoHS6Zcw9hAcrEQtP
 lDE=
X-SBRS: 2.7
X-MesageID: 4393371
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,393,1559534400"; 
   d="scan'208";a="4393371"
From: Lars Kurth <lars.kurth@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>, Julien Grall
 <julien.grall@arm.com>
Thread-Topic: [Xen-devel] [PATCH] get_maintainers.pl: Enable running the
 script on unikraft repos
Thread-Index: AQHVVB9hME1wKi+b/kmlNBfEOZeOsKb9eGYAgAAGS4CAAB34gA==
Date: Fri, 16 Aug 2019 12:05:03 +0000
Message-ID: <BE4FC00F-77B6-492C-8BBA-C3105FAA44F4@citrix.com>
References: <4b535bb616f62ad685fef0f06d3b5138b1539688.1565951950.git.lars.kurth@citrix.com>
 <200d8505-6822-3d9f-98fe-e8d7e09d00b8@arm.com>
 <20190816111747.GB25409@perard.uk.xensource.com>
In-Reply-To: <20190816111747.GB25409@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.d.190811
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <4D133F87AEF7034580088ACFCEFC8DCF@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] get_maintainers.pl: Enable running the
 script on unikraft repos
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
Cc: Felipe
 Huici <felipe.huici@neclab.eu>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George
 Dunlap <George.Dunlap@citrix.com>, Florian Schmidt <florian.schmidt@neclab.eu>,
 Paul Durrant <Paul.Durrant@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Simon Kuenzer <simon.kuenzer@neclab.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkZWQgUGF1bCBEdXJyYW50DQoNCu+7v09uIDE2LzA4LzIwMTksIDEyOjE3LCAiQW50aG9ueSBQ
RVJBUkQiIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPiB3cm90ZToNCg0KICAgIE9uIEZyaSwg
QXVnIDE2LCAyMDE5IGF0IDExOjU1OjE2QU0gKzAxMDAsIEp1bGllbiBHcmFsbCB3cm90ZToNCiAg
ICA+IEhpIExhcnMsDQogICAgPiANCiAgICA+IE9uIDE2LzA4LzIwMTkgMTE6NDIsIExhcnMgS3Vy
dGggd3JvdGU6DQogICAgPiA+IFVuaWtyYWZ0IHJlcG9zIGZvbGxvdyB0aGUgc2FtZSBzeW50YXgg
YXMgeGVuLmdpdCB3aXRoIHRoZQ0KICAgID4gPiBmb2xsb3dpbmcgZXhjZXB0aW9uczoNCiAgICA+
ID4gKiBNQUlOVEFJTkVSUyBmaWxlcyBhcmUgY2FsbGVkIE1BSU5UQUlORVJTLm1kDQogICAgPiA+
ICogTTogLi4uIGV0YyBibG9ja3MgYXJlIHByZWNlZGVkIGJ5IHdoaXRlc3BhY2VzIGZvciByZW5k
ZXJpbmcgYXMNCiAgICA+ID4gICAgbWFya3VwIGZpbGVzDQogICAgPiANCiAgICA+IFRoZXJlIGlz
IGFuIG90aGVyIGRpZmZlcmVuY2UuIFRoZSAiZmFsbGJhY2siIGNhdGVnb3J5IGlzICJVTklLUkFG
VCBHRU5FUkFMIg0KICAgID4gYW5kIG5vdCAiVEhFIFJFU1QiLg0KICAgID4gDQogICAgPiA+IA0K
ICAgID4gPiBUaGlzIGNoYW5nZSB3aWxsDQogICAgPiA+IC0gbG9hZCBNQUlOVEFJTkVSUy5tZCBp
ZiBNQUlOVEFJTkVSUyBpcyBub3QgcHJlc2VudA0KICAgID4gPiAtIGRlYWwgd2l0aCBpbmRlbnRl
ZCBNOiAuLi4gYmxvY2tzDQogICAgPiANCiAgICA+IE9uZSBwcm9jZXNzIHF1ZXN0aW9uLiBEb2Vz
IGl0IG1lYW4gVW5pa3JhZnQgZm9sa3Mgd2lsbCBoYXZlIHRvIGNoZWNrb3V0IFhlbg0KICAgID4g
aW4gb3JkZXIgdG8gdXNlIHthZGQsIGdldH1fbWFpbnRhaW5lcnMucGw/IElmIHNvLCB3b3VsZCBp
dCBtYWtlIHNlbnNlIHRvDQogICAgPiBoYXZlIGFkZF9tYWludGFpbmVycy5wbCBhbmQgc2NyaXB0
X21haW50YWluZXJzLnBsIGluIGEgc2VwYXJhdGUgcmVwbyB0aGF0DQogICAgPiBjYW4gYmUgYWRk
ZWQgYXMgc3VibW9kdWxlPw0KICAgIA0KICAgIFNob3VsZG4ndCBpbnN0ZWFkIHRoZSBVbmlrcmFm
dCByZXBvIGhhdmUgaXQncyBvbmUgZ2V0X21haW50YWluZXJzDQogICAgc2NyaXB0PyB4ZW4uZ2l0
J3Mgc2NyaXB0IGRvZXNuJ3QgbmVlZHMgdG8gaGF2ZSBzdXBwb3J0IGZvciBldmVyeSBzaW5nbGUN
CiAgICByZXBvIGF2YWlsYWJsZSBvbiBlYXJ0aCBhbmQgVW5pa3JhZnQgaXMgYSBkaWZmZXJlbnQg
cHJvamVjdCBhbnl3YXkuDQogICAgDQogICAgVXN1YWxseSwgcHJvamVjdHMgd2l0aCBhIE1BSU5U
QUlORVJTIGZpbGUgaGF2ZSB0aGVyZSBvd24gZ2V0X21haW50YWluZXJzDQogICAgc2NyaXB0Lg0K
ICAgIA0KV2VsbDogVW5pa3JhZnQgaXMgcGFydCBvZiB0aGUgWGVuIFByb2plY3QuIA0KDQpXaGVu
IEkgc3RhcnRlZCB0byBjbGVhbiB1cCB0aGUgY29udHJpYnV0aW9uIGRvY3MgaXQgYmVjYW1lIGFw
cGFyZW50IHRoYXQNCnRoZXJlIGlzIGEgbG90IG9mIGluY29uc2lzdGVuY3kuIElkZWFsbHkgb3Vy
IGNvbnRyaWJ1dGlvbiBndWlkZSBbMF0gd291bGQgYXBwbHkgDQp0byBwcmV0dHkgbXVjaCAqYWxs
KiBzdWIgcHJvamVjdHMgd2hpY2ggdXNlIGEgbWFpbGluZyBsaXN0IGJhc2VkIHdvcmtmbG93cw0K
DQpDb25zaXN0ZW5jeSBtYWtlcyBsaWZlIGZvciBkZXZlbG9wZXJzIGFuZCBhbHNvIG5ld2NvbWVy
cyBtdWNoIGVhc2llci4gQW5kIHRoZSANCm51bWJlciBvZiBuZXcgZGV2cyB3aG8gc2VlbSB0byB0
cmlwIG92ZXIgaW5jb25zaXN0ZW5jaWVzIGJldHdlZW4gcHJvamVjdHMgYXJlIA0KcXVpdGUgbGFy
Z2UgKHdlIGhhZCAzICBjYXNlcyBpbiAzIHdlZWtzIHdoaWNoIEkgbm90aWNlZCkuDQoNCklmIHdl
IHN0YXJ0IGltcHJvdmluZyBvdXIgQ0kgaW5mcmFzdHJ1Y3R1cmUgKHdoaWNoIHdlIGFyZSksIGl0
IHdvdWxkIGJlIG5pY2UgaWYgb3RoZXIgDQpzdWIgcHJvamVjdHMgaGFkIHRoZSBwb3NzaWJpbGl0
eSB0byBlYXNpbHkgaG9vayBpbnRvIGl0IG9yIHJlcGxpY2F0ZSBpdC4gQnV0IHRoYXQgZG9lcyBy
ZXF1aXJlIA0Kc29tZSBjb25zaXN0ZW5jeS4NCg0KVGhhdCdzIHdoeSBJIHN1Ym1pdHRlZCBbMV0g
YW5kIFsyXQ0KDQpTdWItcHJvamVjdHMgd2l0aCBtYWlsIGJhc2VkIHdvcmtmbG93cw0KMTogSHlw
ZXJ2aXNvcg0KMjogSHlwZXJ2aXNvciByZWxhdGVkIHJlcG9zIChsaXZlcGF0Y2gtYnVpbGQtdG9v
bHMsIG1pbmktb3MsIHh0ZiwgLi4uKQ0KMzogV2luZG93cyBQViBEcml2ZXJzIC0gd2hpY2ggd2ls
bCByZXF1aXJlIGNoYW5nZXMgdG8gdGhlaXIgTUFJTlRBSU5FUlMgZmlsZSANCjQ6IFVuaWtyYWZ0
DQoNClN1cHBvcnRpbmcgMSAtIDMgc2hvdWxkIGJlIHN0cmFpZ2h0Zm9yd2FyZCBiZWNhdXNlIHlv
dSB3b3VsZCBhbG1vc3QgYWx3YXlzDQpoYXZlIHhlbi5naXQgY2hlY2tlZCBvdXQuIDQgaXMgbW9y
ZSBkaWZmZXJlbnQuDQoNCldoZW4gSSBkaWQgWzFdIHN1cHBvcnRpbmcgVW5pa3JhZnQgbG9va2Vk
IHF1aXRlIHN0cmFpZ2h0Zm9yd2FyZCwgd2hpY2ggaXMNCndoeSBJIHN1Ym1pdHRlZCB0aGlzIHBh
dGNoLiBCdXQsIGdpdmVuIHRoZSBpc3N1ZXMgSnVsaWVuIGhpZ2hsaWdodGVkIG1heWJlIHRoYXQg
DQppcyBub3QgdGhlIGNhc2UuIA0KDQpJIHRoaW5rIGZvciBub3csIG1heWJlIHdlIHNob3VsZCBm
b2N1cyBvbiAxIC0gMyBhbmQgbGV0IHRoZSBVbmlrcmFmdCBkZXZzIGRlY2lkZSANCmhvdyB0byBh
cHByb2FjaCB0aGlzLiBUaGVuIHdlIGNhbiByZXZpc2l0IHRoZSBxdWVzdGlvbiBvZiB3aGVyZSB0
byBzdG9yZSB0aGVzZQ0Kc2NyaXB0cy4gRm9yIG5vdywgSSB0aGluayByZXF1aXJpbmcgdG8gaGF2
ZSB4ZW4uZ2l0IGNoZWNrZWQgb3V0IGlzIE9LLg0KDQpSZWdhcmRzDQpMYXJzDQoNClswXSBodHRw
czovL3dpa2kueGVucHJvamVjdC5vcmcvd2lraS9TdWJtaXR0aW5nX1hlbl9Qcm9qZWN0X1BhdGNo
ZXMgICAgIA0KWzFdIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94
ZW4tZGV2ZWwvMjAxOS0wOC90aHJlYWRzLmh0bWwjMDE1NzUNClsyXSBodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDgvdGhyZWFkcy5odG1s
IzAxNTgxDQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
