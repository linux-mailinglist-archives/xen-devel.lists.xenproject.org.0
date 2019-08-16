Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7849D9014A
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 14:22:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hybDd-0001i9-Sj; Fri, 16 Aug 2019 12:20:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z4MO=WM=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hybDc-0001i4-57
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 12:20:32 +0000
X-Inumbo-ID: 3c86100c-c020-11e9-8bb5-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c86100c-c020-11e9-8bb5-12813bfff9fa;
 Fri, 16 Aug 2019 12:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565958030;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=BKWlm09TnCb1+kZBFHdZJkX2L5dlFm1AGNR1Uhc3zgk=;
 b=GLpyi3iI9cPfzAuwog1QhJjc5PutbLI9qfcmyxyCNlxUYJ4g1mXgIxFP
 NsjDEguXReY1h+Legp3iq/FpOkDirizb+PPCPmvW5+5xcp/oZZUDCazxW
 PSQKRZohGgxar18VPeA/xmUOYCTYzPZ9wJWropjm6Dfdep5g4Z6e6Wt9W 8=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vjrBrom7hGhA28IE8bjaC3YxB2GmfJkcazsHWnNYGnIiHyTxEFeqDnzYcTiVp/biCMLglN+D1x
 YNZPY9x15w21tOl/3vnvn/Zf320XNf7DNTX8ruR1FkohwZ0IDdWtKJGwC+nhsX13ggReKgDof5
 EHkhy2ik3s8GRSmnTPq3NwYFeBdRrDUUE0XsisJRbLfeQ5ro9eSXn3FErT/99etG2qneci0djo
 GOZm+hIW1Fwbov1n5fhvIFxALJJbhbYEghY619IIem4tiWb5lFffd6emu8sehgJNJW2LZk2uv+
 f5k=
X-SBRS: 2.7
X-MesageID: 4515521
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,393,1559534400"; 
   d="scan'208";a="4515521"
From: Lars Kurth <lars.kurth@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>, Anthony Perard
 <anthony.perard@citrix.com>, Julien Grall <julien.grall@arm.com>
Thread-Topic: [Xen-devel] [PATCH] get_maintainers.pl: Enable running the
 script on unikraft repos
Thread-Index: AQHVVB9hME1wKi+b/kmlNBfEOZeOsKb9eGYAgAAGS4CAAB34gP//8F+AgAAT7IA=
Date: Fri, 16 Aug 2019 12:20:26 +0000
Message-ID: <6DD1365F-7869-484E-B746-23EF8DA89270@citrix.com>
References: <4b535bb616f62ad685fef0f06d3b5138b1539688.1565951950.git.lars.kurth@citrix.com>
 <200d8505-6822-3d9f-98fe-e8d7e09d00b8@arm.com>
 <20190816111747.GB25409@perard.uk.xensource.com>
 <BE4FC00F-77B6-492C-8BBA-C3105FAA44F4@citrix.com>
 <3044b1da5b3442aea10d46f5d232cf0d@AMSPEX02CL03.citrite.net>
In-Reply-To: <3044b1da5b3442aea10d46f5d232cf0d@AMSPEX02CL03.citrite.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.d.190811
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <B807244F2DB6A44AA323472CE0FE0E67@citrix.com>
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
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Simon Kuenzer <simon.kuenzer@neclab.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDE2LzA4LzIwMTksIDEzOjA5LCAiUGF1bCBEdXJyYW50IiA8UGF1bC5EdXJyYW50
QGNpdHJpeC5jb20+IHdyb3RlOg0KDQogICAgPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
ICAgID4gRnJvbTogTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPg0KICAgID4gU2Vu
dDogMTYgQXVndXN0IDIwMTkgMTM6MDUNCiAgICA+IFRvOiBBbnRob255IFBlcmFyZCA8YW50aG9u
eS5wZXJhcmRAY2l0cml4LmNvbT47IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+
DQogICAgPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBGZWxpcGUgSHVpY2kg
PGZlbGlwZS5odWljaUBuZWNsYWIuZXU+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCiAgICA+IDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEtvbnJhZCBSemVzenV0
ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IEdlb3JnZQ0KICAgID4gRHVubGFwIDxH
ZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0Bj
aXRyaXguY29tPjsgSWFuIEphY2tzb24NCiAgICA+IDxJYW4uSmFja3NvbkBjaXRyaXguY29tPjsg
VGltIChYZW4ub3JnKSA8dGltQHhlbi5vcmc+OyBGbG9yaWFuIFNjaG1pZHQgPGZsb3JpYW4uc2No
bWlkdEBuZWNsYWIuZXU+Ow0KICAgID4gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsg
U2ltb24gS3VlbnplciA8c2ltb24ua3VlbnplckBuZWNsYWIuZXU+OyBQYXVsIER1cnJhbnQNCiAg
ICA+IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCiAgICA+IFN1YmplY3Q6IFJlOiBbWGVuLWRl
dmVsXSBbUEFUQ0hdIGdldF9tYWludGFpbmVycy5wbDogRW5hYmxlIHJ1bm5pbmcgdGhlIHNjcmlw
dCBvbiB1bmlrcmFmdCByZXBvcw0KICAgID4gDQogICAgPiBBZGRlZCBQYXVsIER1cnJhbnQNCiAg
ICA+IA0KICAgID4gT24gMTYvMDgvMjAxOSwgMTI6MTcsICJBbnRob255IFBFUkFSRCIgPGFudGhv
bnkucGVyYXJkQGNpdHJpeC5jb20+IHdyb3RlOg0KICAgID4gDQogICAgPiAgICAgT24gRnJpLCBB
dWcgMTYsIDIwMTkgYXQgMTE6NTU6MTZBTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KICAg
ID4gICAgID4gSGkgTGFycywNCiAgICA+ICAgICA+DQogICAgPiAgICAgPiBPbiAxNi8wOC8yMDE5
IDExOjQyLCBMYXJzIEt1cnRoIHdyb3RlOg0KICAgID4gICAgID4gPiBVbmlrcmFmdCByZXBvcyBm
b2xsb3cgdGhlIHNhbWUgc3ludGF4IGFzIHhlbi5naXQgd2l0aCB0aGUNCiAgICA+ICAgICA+ID4g
Zm9sbG93aW5nIGV4Y2VwdGlvbnM6DQogICAgPiAgICAgPiA+ICogTUFJTlRBSU5FUlMgZmlsZXMg
YXJlIGNhbGxlZCBNQUlOVEFJTkVSUy5tZA0KICAgID4gICAgID4gPiAqIE06IC4uLiBldGMgYmxv
Y2tzIGFyZSBwcmVjZWRlZCBieSB3aGl0ZXNwYWNlcyBmb3IgcmVuZGVyaW5nIGFzDQogICAgPiAg
ICAgPiA+ICAgIG1hcmt1cCBmaWxlcw0KICAgID4gICAgID4NCiAgICA+ICAgICA+IFRoZXJlIGlz
IGFuIG90aGVyIGRpZmZlcmVuY2UuIFRoZSAiZmFsbGJhY2siIGNhdGVnb3J5IGlzICJVTklLUkFG
VCBHRU5FUkFMIg0KICAgID4gICAgID4gYW5kIG5vdCAiVEhFIFJFU1QiLg0KICAgID4gICAgID4N
CiAgICA+ICAgICA+ID4NCiAgICA+ICAgICA+ID4gVGhpcyBjaGFuZ2Ugd2lsbA0KICAgID4gICAg
ID4gPiAtIGxvYWQgTUFJTlRBSU5FUlMubWQgaWYgTUFJTlRBSU5FUlMgaXMgbm90IHByZXNlbnQN
CiAgICA+ICAgICA+ID4gLSBkZWFsIHdpdGggaW5kZW50ZWQgTTogLi4uIGJsb2Nrcw0KICAgID4g
ICAgID4NCiAgICA+ICAgICA+IE9uZSBwcm9jZXNzIHF1ZXN0aW9uLiBEb2VzIGl0IG1lYW4gVW5p
a3JhZnQgZm9sa3Mgd2lsbCBoYXZlIHRvIGNoZWNrb3V0IFhlbg0KICAgID4gICAgID4gaW4gb3Jk
ZXIgdG8gdXNlIHthZGQsIGdldH1fbWFpbnRhaW5lcnMucGw/IElmIHNvLCB3b3VsZCBpdCBtYWtl
IHNlbnNlIHRvDQogICAgPiAgICAgPiBoYXZlIGFkZF9tYWludGFpbmVycy5wbCBhbmQgc2NyaXB0
X21haW50YWluZXJzLnBsIGluIGEgc2VwYXJhdGUgcmVwbyB0aGF0DQogICAgPiAgICAgPiBjYW4g
YmUgYWRkZWQgYXMgc3VibW9kdWxlPw0KICAgID4gDQogICAgPiAgICAgU2hvdWxkbid0IGluc3Rl
YWQgdGhlIFVuaWtyYWZ0IHJlcG8gaGF2ZSBpdCdzIG9uZSBnZXRfbWFpbnRhaW5lcnMNCiAgICA+
ICAgICBzY3JpcHQ/IHhlbi5naXQncyBzY3JpcHQgZG9lc24ndCBuZWVkcyB0byBoYXZlIHN1cHBv
cnQgZm9yIGV2ZXJ5IHNpbmdsZQ0KICAgID4gICAgIHJlcG8gYXZhaWxhYmxlIG9uIGVhcnRoIGFu
ZCBVbmlrcmFmdCBpcyBhIGRpZmZlcmVudCBwcm9qZWN0IGFueXdheS4NCiAgICA+IA0KICAgID4g
ICAgIFVzdWFsbHksIHByb2plY3RzIHdpdGggYSBNQUlOVEFJTkVSUyBmaWxlIGhhdmUgdGhlcmUg
b3duIGdldF9tYWludGFpbmVycw0KICAgID4gICAgIHNjcmlwdC4NCiAgICA+IA0KICAgID4gV2Vs
bDogVW5pa3JhZnQgaXMgcGFydCBvZiB0aGUgWGVuIFByb2plY3QuDQogICAgPiANCiAgICA+IFdo
ZW4gSSBzdGFydGVkIHRvIGNsZWFuIHVwIHRoZSBjb250cmlidXRpb24gZG9jcyBpdCBiZWNhbWUg
YXBwYXJlbnQgdGhhdA0KICAgID4gdGhlcmUgaXMgYSBsb3Qgb2YgaW5jb25zaXN0ZW5jeS4gSWRl
YWxseSBvdXIgY29udHJpYnV0aW9uIGd1aWRlIFswXSB3b3VsZCBhcHBseQ0KICAgID4gdG8gcHJl
dHR5IG11Y2ggKmFsbCogc3ViIHByb2plY3RzIHdoaWNoIHVzZSBhIG1haWxpbmcgbGlzdCBiYXNl
ZCB3b3JrZmxvd3MNCiAgICA+IA0KICAgID4gQ29uc2lzdGVuY3kgbWFrZXMgbGlmZSBmb3IgZGV2
ZWxvcGVycyBhbmQgYWxzbyBuZXdjb21lcnMgbXVjaCBlYXNpZXIuIEFuZCB0aGUNCiAgICA+IG51
bWJlciBvZiBuZXcgZGV2cyB3aG8gc2VlbSB0byB0cmlwIG92ZXIgaW5jb25zaXN0ZW5jaWVzIGJl
dHdlZW4gcHJvamVjdHMgYXJlDQogICAgPiBxdWl0ZSBsYXJnZSAod2UgaGFkIDMgIGNhc2VzIGlu
IDMgd2Vla3Mgd2hpY2ggSSBub3RpY2VkKS4NCiAgICA+IA0KICAgID4gSWYgd2Ugc3RhcnQgaW1w
cm92aW5nIG91ciBDSSBpbmZyYXN0cnVjdHVyZSAod2hpY2ggd2UgYXJlKSwgaXQgd291bGQgYmUg
bmljZSBpZiBvdGhlcg0KICAgID4gc3ViIHByb2plY3RzIGhhZCB0aGUgcG9zc2liaWxpdHkgdG8g
ZWFzaWx5IGhvb2sgaW50byBpdCBvciByZXBsaWNhdGUgaXQuIEJ1dCB0aGF0IGRvZXMgcmVxdWly
ZQ0KICAgID4gc29tZSBjb25zaXN0ZW5jeS4NCiAgICA+IA0KICAgID4gVGhhdCdzIHdoeSBJIHN1
Ym1pdHRlZCBbMV0gYW5kIFsyXQ0KICAgID4gDQogICAgPiBTdWItcHJvamVjdHMgd2l0aCBtYWls
IGJhc2VkIHdvcmtmbG93cw0KICAgID4gMTogSHlwZXJ2aXNvcg0KICAgID4gMjogSHlwZXJ2aXNv
ciByZWxhdGVkIHJlcG9zIChsaXZlcGF0Y2gtYnVpbGQtdG9vbHMsIG1pbmktb3MsIHh0ZiwgLi4u
KQ0KICAgID4gMzogV2luZG93cyBQViBEcml2ZXJzIC0gd2hpY2ggd2lsbCByZXF1aXJlIGNoYW5n
ZXMgdG8gdGhlaXIgTUFJTlRBSU5FUlMgZmlsZQ0KICAgID4gNDogVW5pa3JhZnQNCiAgICA+IA0K
ICAgID4gU3VwcG9ydGluZyAxIC0gMyBzaG91bGQgYmUgc3RyYWlnaHRmb3J3YXJkIGJlY2F1c2Ug
eW91IHdvdWxkIGFsbW9zdCBhbHdheXMNCiAgICA+IGhhdmUgeGVuLmdpdCBjaGVja2VkIG91dC4g
NCBpcyBtb3JlIGRpZmZlcmVudC4NCiAgICANCiAgICBJJ2Qgc2F5IHRoYXQgZm9sa3MgYnVpbGRp
bmcgMyBhcmUgdW5saWtlbHkgdG8gaGF2ZSB4ZW4uZ2l0IGNoZWNrZWQgb3V0Lg0KICAgIA0KR29v
ZCB0byBrbm93DQoNCklmIHRoZXJlIHdhcyB0b29saW5nIGF2YWlsYWJsZSB0aGF0IHNpbXBsaWZp
ZXMgeW91ciB3b3JrZmxvdywgd291bGQgDQptZW1iZXJzIG9mIHRoZSBXaW5kb3dzIFBWIERyaXZl
cnMgc3ViLXByb2plY3QgYmUgd2lsbGluZyB0byB1c2UgdGhlbT8NCg0KSXQgbWF5YmUgdGhhdCBm
b3IgV2luZG93cyBQViBEcml2ZXJzIHRoZSB3b3JrZmxvdyBpcyBub3QgYXQgYWxsIGNvbW1hbmQN
CmxpbmUgYmFzZWQgYW5kIHBlb3BsZSB0ZW5kIHRvIHVzZSBhbiBJREUgaW5zdGVhZC4NCg0KTGFy
cw0KICAgIA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
