Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95410638A9
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2019 17:31:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hks3A-0003gf-2D; Tue, 09 Jul 2019 15:29:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BVIN=VG=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hks38-0003gU-LC
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2019 15:28:58 +0000
X-Inumbo-ID: 43a55166-a25e-11e9-b546-637a9a85595a
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 43a55166-a25e-11e9-b546-637a9a85595a;
 Tue, 09 Jul 2019 15:28:55 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8QVR43kiQrVwW5qxCQzor9FRCUgeBrh8LOiTgZ+Mo5egKylf8mQrYYWXuzXpNWEo6lOS2dx4fg
 +xiQjAdxbzaIl8d7fnaa9MI2/pWvhfObyrxhYpATQR4kq/AJzBTVv6i980+LC6lLjU5Gq/Nxim
 PRtsuzfGZz3tJ9CN1so7Tz9lpnYl6Xsst8Tm37DpkyEA9PPHEJMh7BF5HXobgoYbYTpP7O6e0u
 8S090zoCE9f9hOUnVhAaMOdGJdfLP7RY6kWK+2gg0gWXk3XYG1Fx0rBi4MZsk1QG7CIUHtnc9j
 o/k=
X-SBRS: 2.7
X-MesageID: 2812809
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,470,1557201600"; 
   d="scan'208";a="2812809"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 9 Jul 2019 16:28:44 +0100
Message-ID: <20190709152845.18217-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190709152845.18217-1-andrew.cooper3@citrix.com>
References: <20190709152845.18217-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/2] tools/xenstored: Make gnttab interface
 mandatory
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

eGVuc3RvcmVkIGN1cnJlbnRseSByZXF1aXJlcyBhbiBsaWJ4YyBhbmQgZXZ0Y2huIGludGVyZmFj
ZSwgYnV0IGxlYXZlcwp0aGUgZ250dGFiIGludGVyZmFjZSBhcyBvcHRpb25hbC4KCmdudHRhYiBp
cyB1YmlxdWl0b3VzIHRoZXNlIGRheXMsIGFuZCBpbiBwcmFjdGljZSBtYW5kYXRvcnkgaW4gYWxs
IGNhc2VzCndoZXJlIHhlbnN0b3JlZCBpc24ndCBydW5uaW5nIGFzIHJvb3QgaW4gZG9tMCAoZHVl
IHRvIHRoZSBpbmFiaWxpdHkgdG8KZm9yZWlnbiBtYXAgYnkgTUZOKS4KClRoZSB0b29sc3RhY2sg
aGFzIHVuY29uZGl0aW9uYWxseSBzZXQgdXAgZ3JhbnQgZGV0YWlscyBmb3IgbWFueSB5ZWFycwpu
b3csIGFuZCBsb25ndGVybSBpdCB3b3VsZCBiZSBnb29kIHRvIHBoYXNlIG91dCB0aGUgdXNlIG9m
IGxpYnhjLiAgVGhpcwpyZXF1aXJlcyB0aGF0IHhlbnN0b3JlZCBtYXAgdGhlIHN0b3JlIHJpbmcg
YnkgZ3JhbnQgbWFwLCByYXRoZXIgdGhhbgpmb3JlaWduIG1hcC4KCk5vIHByYWN0aWNhbCBjaGFu
Z2UuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgotLS0KQ0M6IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBjaXRyaXguY29tPgpDQzogV2Vp
IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4KLS0tCiB0b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfZG9tYWluLmMgfCA2ICsrKy0tLQog
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfZG9tYWluLmMgYi90b29scy94ZW5zdG9yZS94
ZW5zdG9yZWRfZG9tYWluLmMKaW5kZXggZmE2NjU1MDMzYS4uNDYzZWJiYTY0MyAxMDA2NDQKLS0t
IGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2RvbWFpbi5jCisrKyBiL3Rvb2xzL3hlbnN0b3Jl
L3hlbnN0b3JlZF9kb21haW4uYwpAQCAtNjQxLDkgKzY0MSw5IEBAIHZvaWQgZG9tYWluX2luaXQo
dm9pZCkKIAogCSp4Z3RfaGFuZGxlID0geGVuZ250dGFiX29wZW4oTlVMTCwgMCk7CiAJaWYgKCp4
Z3RfaGFuZGxlID09IE5VTEwpCi0JCXhwcmludGYoIldBUk5JTkc6IEZhaWxlZCB0byBvcGVuIGNv
bm5lY3Rpb24gdG8gZ250dGFiXG4iKTsKLQllbHNlCi0JCXRhbGxvY19zZXRfZGVzdHJ1Y3Rvcih4
Z3RfaGFuZGxlLCBjbG9zZV94Z3RfaGFuZGxlKTsKKwkJYmFyZl9wZXJyb3IoIkZhaWxlZCB0byBv
cGVuIGNvbm5lY3Rpb24gdG8gZ250dGFiIik7CisKKwl0YWxsb2Nfc2V0X2Rlc3RydWN0b3IoeGd0
X2hhbmRsZSwgY2xvc2VfeGd0X2hhbmRsZSk7CiAKIAl4Y2VfaGFuZGxlID0geGVuZXZ0Y2huX29w
ZW4oTlVMTCwgMCk7CiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
