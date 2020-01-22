Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F207F144E27
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 10:01:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuBq1-0002Db-9N; Wed, 22 Jan 2020 08:58:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ntgM=3L=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iuBpz-0002DW-BO
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 08:58:11 +0000
X-Inumbo-ID: 4b9515dc-3cf5-11ea-aecd-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b9515dc-3cf5-11ea-aecd-bc764e2007e4;
 Wed, 22 Jan 2020 08:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579683482;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=gLoWh7rsoAaRg3jva0cACqg9V0q1IH/LNEeMNHw1ukg=;
 b=EhcKeU77W2WdmzffEJ4ZtqY5QSLigAQ+NZn33f4M1EPs53D2ozYkRxiE
 ZIMtd8hYK1rCltIv4KC0kmWPR3aOskI+8ICp3K0vMquaIa7I+Ip3r+C+N
 3V4ixN7luA1pXK1EW2ocVsp3IrJe135KO+r4ChdpwTT6kPGXgdtJxc+Mx Y=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1VPduzNi3QqY2nQFR/ggu7Y2qBlwSslr61qdzn0TxArP2DMe5/8S9R4e0TVvgCvS7mqDUGwtDR
 HeqBctAdwmv9UNWONy3+jAty7S0Kk+jL0lru5PR99X7tIKR6l0o7+xiBvQAtPtxYpqmu6Z7ydk
 EKHLVWHE3iRGbyMGtoxZupnGTqbYVn7ek9nUuY5+PIMh7dZUNYEA2o1l01QhZPM4zykjS5AIw3
 OuucTAYaXpxciN6y4RFDYwTIdobIo5ig4fWoKJL+1RqGndrT/hEv+b4vuHjvSPbbL6JMgw0qEM
 tZ8=
X-SBRS: 2.7
X-MesageID: 11624157
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,348,1574139600"; d="scan'208";a="11624157"
From: Lars Kurth <lars.kurth@citrix.com>
To: Rich Persaud <persaur@gmail.com>,
 =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v4 13/16] Regenerate autotools files
Thread-Index: AQHV0KHLVBxyzGGIXUWxHLgbCJzCJqf2Ug4A
Date: Wed, 22 Jan 2020 08:57:58 +0000
Message-ID: <409BEC3E-0460-4B34-9C36-1471171792D8@citrix.com>
References: <20200121205642.GN1314@mail-itl>
 <33984318-FCDC-4B2A-843C-A90D663F647D@gmail.com>
In-Reply-To: <33984318-FCDC-4B2A-843C-A90D663F647D@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.12.200112
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <A060FBF6B84F574AA9EAB8918A3489EC@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 13/16] Regenerate autotools files
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>,
 Wei Liu <wl@xen.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDIxLzAxLzIwMjAsIDIxOjI5LCAiUmljaCBQZXJzYXVkIiA8cGVyc2F1ckBnbWFp
bC5jb20+IHdyb3RlOg0KDQogICAgT24gSmFuIDIxLCAyMDIwLCBhdCAxNTo1OCwgTWFyZWsgTWFy
Y3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPiB3cm90
ZToNCiAgICA+IA0KICAgID4gT24gV2VkLCBKYW4gMTUsIDIwMjAgYXQgMDQ6NTc6MjlQTSAtMDUw
MCwgUmljaCBQZXJzYXVkIHdyb3RlOg0KICAgID4+Pj4gT24gSmFuIDE0LCAyMDIwLCBhdCAyMTo0
MiwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3Ns
YWIuY29tPiB3cm90ZToNCiAgICA+Pj4gU2luY2Ugd2UgaGF2ZSB0aG9zZSBnZW5lcmF0ZWQgZmls
ZXMgY29tbWl0dGVkIHRvIHRoZSByZXBvICh3aHk/ISksDQogICAgPj4+IHVwZGF0ZSB0aGVtIGFm
dGVyIGNoYW5naW5nIGNvbmZpZ3VyZS5hYy4NCiAgICA+PiANCiAgICA+PiBJcyB0aGVyZSBhbnkg
cmVhc29uIG5vdCB0byByZW1vdmUgdGhlIGdlbmVyYXRlZCBjb25maWd1cmUgZmlsZXM/ICBBIGRl
dmVsb3BlciB1c2luZyBnZW5lcmF0ZWQgZmlsZXMgb24gc3lzdGVtIEIgd291bGQgYmUgaW5jb3Jw
b3JhdGluZyBjb25maWd1cmF0aW9uIGFzc3VtcHRpb25zIGZyb20gc3lzdGVtIEEgd2hlcmUgdGhl
IGNvbmZpZ3VyZSBzY3JpcHQgd2FzIGdlbmVyYXRlZC4gIElmIHdlIGFyZSBnb2luZyB0byBzaGlw
IGNvbmZpZ3VyZSBzY3JpcHRzLCBkbyB3ZSBuZWVkIHRvIGRvY3VtZW50IGEgInN5c3RlbSBBIiBy
ZWZlcmVuY2UgZGlzdHJvL2Vudmlyb25tZW50IHdoZXJlIGFsbCBjb25maWd1cmUgc2NyaXB0cyBm
cm9tIFhlbiB3aWxsIGJlIGdlbmVyYXRlZD8NCiAgICA+PiANCiAgICA+PiANCiAgICA+PiBPdGhl
ciBub3RlczoNCiAgICA+PiANCiAgICA+PiAxLiAgRGViaWFuIGF1dG9yZWNvbmYgd29ya3MgaW4g
dGhlIFhlbiByb290IGRpcmVjdG9yeSwgYnV0IHRoZSBkZWZhdWx0IE9wZW5FbWJlZGRlZCBhdXRv
cmVjb25mIHVzZXMgR251IGxpYnRvb2xpemUgYW5kIGZhaWxzIGJlY2F1c2Ugc29tZSBYZW4gYnVp
bGQgc3ViZGlyZWN0b3JpZXMgZG9uJ3QgaGF2ZSBjb25maWd1cmUuYWMvLmluLiAgIA0KICAgID4+
IA0KICAgID4+IDIuICBJZiBPcGVuRW1iZWRkZWQgYXV0b3JlY29uZiBpcyBydW4gb25seSBpbiB0
aGUgdG9vbHMgZGlyZWN0b3J5ICh3aGVyZSBpdCB3b3JrcyBhbmQgZ2VuZXJhdGVzIGEgbmV3IHRv
b2xzIGNvbmZpZ3VyZSksIHRoZW4gcm9vdCBjb25maWd1cmUgKGdlbmVyYXRlZCBmcm9tIG9sZGVy
IGNvbmZpZ3VyZS5hYykgd2lsbCBzaWxlbnRseSBpZ25vcmUgdGhlIG5ld2VyIHRvb2xzIGNvbmZp
Z3VyZSBhbmQgd3JpdGUgY29uZmlnLmggX3dpdGhvdXRfIHRvb2xzLXNwZWNpZmljIGNvbmZpZywg
c3VjaCBhcyB0aGUgdmNoYW4gUU1QIHByb3h5Lg0KICAgID4+IA0KICAgID4+IDMuIElmIGF1dG9y
ZWNvbmYgcnVucyBzdWNjZXNzZnVsbHkgaW4gdGhlIHJvb3QgZGlyZWN0b3J5LCB0aGVuIHRvb2xz
LXNwZWNpZmljIGNvbmZpZ3VyZSBpcyBjb3JyZWN0bHkgZ2VuZXJhdGVkIGFuZCBldmVyeXRoaW5n
IHdvcmtzIGFzIGV4cGVjdGVkLg0KICAgID4+IA0KICAgID4+IFRoaXMgc2lsZW50IGZhaWx1cmUg
Y291bGQgYmUgYXZvaWRlZCBieSBkZWxldGluZyB0aGUgZ2VuZXJhdGVkIGNvbmZpZ3VyZSBzY3Jp
cHRzLiAgVGhlcmUgbWF5IGJlIG90aGVyIGZhaWx1cmUgbW9kZXMgZm9yIHVzaW5nIFN5c3RlbSBB
IGdlbmVyYXRlZCBzY3JpcHRzIG9uIGRvd25zdHJlYW0gYnVpbGQgc3lzdGVtIEIuDQogICAgPiAN
CiAgICA+IFllcywgSSB0aGluayBnZW5lcmFsIGdvb2QgcHJhY3RpY2VzIGFyZToNCiAgICA+IDEu
IGRvbid0IGtlZXAgZ2VuZXJhdGVkIGF1dG90b29scyBmaWxlcyBpbiB2ZXJzaW9uIGNvbnRyb2wg
c3lzdGVtDQogICAgPiAyLiBnZW5lcmF0ZSB0aGVtIGludG8gcmVsZWFzZSB0YXJiYWxscw0KICAg
IA0KICAgIEEgcG90ZW50aWFsIHRvcGljIGZvciB0aGUgbmV4dCBYZW4gY29tbXVuaXR5IGNhbGw6
ICBjYW4gd2UgZGVsZXRlIGdlbmVyYXRlZCBhdXRvdG9vbHMgZmlsZXMgZnJvbSB0aGUgWGVuIHRy
ZWUgYW5kIHVwZGF0ZSB0aGUgcmVsZWFzZSBwcm9jZXNzIHRvIGdlbmVyYXRlK2J1bmRsZSB0aGVt
IHdpdGggcmVsZWFzZSB0YXJiYWxscz8NCiAgICANCkkgYW0gaGFwcHkgdG8gcHV0IHRoaXMgb24g
dGhlIGFnZW5kYSwgaWYgc29tZW9uZSByZW1pbmRzIG1lIGNsb3NlciB0byB0aGUgdGltZQ0KTGFy
cw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
