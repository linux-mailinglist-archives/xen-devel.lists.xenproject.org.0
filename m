Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D661710A185
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 16:52:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZd5j-00010F-L3; Tue, 26 Nov 2019 15:49:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5kHA=ZS=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iZd5i-00010A-EA
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 15:49:26 +0000
X-Inumbo-ID: 52381ece-1064-11ea-a55d-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 52381ece-1064-11ea-a55d-bc764e2007e4;
 Tue, 26 Nov 2019 15:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574783365;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WDHowXEBmaspeCxoFzjj6/PTlaqGrurxKFq110N1yYA=;
 b=QQvpzAZJwih2VeNurQDZwhnfRXsqpn8yE72qgfpNH34dpi+p82dn/HCz
 dUAtV2t3Wd1k2Yw1/MFjsHf6lOea5IYiiEGJR89z0CQ31PUBVoVva/nKe
 MU5p/l3MN04OOH4cnJGrlFvDM0hMSl6MZuDI49ei6C0mQq10RCJoM2naO w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1DjEAXIAg5sdG7CNgFV73mVHCqKcd7TJRlN8lp2+G0ilntRLiOxi4dNxiQmesVZkiDqzHzXne8
 DIrf6pZ6+pcruNbL6Tpra9I8RCluBEHtzdTjhHNb78ST18FPBErfleCEFzoDTcjqMQOB4rn95/
 dJwsjvlrpqUcuBSRg653+SKXu4jHBikuAkJU6mEPR5x86IkA9gOSvA0rROKhjBWyKQHPZd+CMN
 Cgz5dmVgR7Q/uAIlBBqriI2ArNXU/Qesxhbg92NfQ+Mtrb9WRmmYPXpIs2A/9uuL0J51iliRjV
 1Qs=
X-SBRS: 2.7
X-MesageID: 9403762
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,246,1571716800"; 
   d="scan'208";a="9403762"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 26 Nov 2019 15:49:20 +0000
Message-ID: <20191126154920.2950420-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 v2] docs/xl: Document pci-assignable
 state
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2hhbmdlc2V0cyAzMTlmOWEwYmE5ICgicGFzc3Rocm91Z2g6IHF1YXJhbnRpbmUgUENJIGRldmlj
ZXMiKSBhbmQKYmEyYWIwMGJiYiAoIklPTU1VOiBkZWZhdWx0IHRvIGFsd2F5cyBxdWFyYW50aW5p
bmcgUENJIGRldmljZXMiKQppbnRyb2R1Y2VkIFBDSSBkZXZpY2UgInF1YXJhbnRpbmUiIGJlaGF2
aW9yLCBidXQgZGlkIG5vdCBkb2N1bWVudCBob3cKdGhlIHBjaS1hc3NpZ25hYmxlLWFkZCBhbmQg
LXJlbW92ZSBmdW5jdGlvbnMgYWN0IGluIHJlZ2FyZCB0byB0aGlzLgpSZWN0aWZ5IHRoaXMuCgpT
aWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+ClJl
bGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tClJlbGVh
c2UganVzdGlmaWNhdGlvbjogVGhpcyBicmluZ3MgZG9jdW1lbnRhdGlvbiBpbnRvIGxpbmUgd2l0
aCB0aGUKYWN0dWFsIGNvZGUgdGhhdCB3aWxsIGJlIHJlbGVhc2VkLgoKQ0M6IElhbiBKYWNrc29u
IDxpYW4uamFja3NvbkBjaXRyaXguY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ0M6IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4u
b3JnPgpDQzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIGRvY3MvbWFuL3hs
LjEucG9kLmluIHwgMzEgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZG9j
cy9tYW4veGwuMS5wb2QuaW4gYi9kb2NzL21hbi94bC4xLnBvZC5pbgppbmRleCAyMzAzYjgxZTRm
Li5kNGI1ZThlMzYyIDEwMDY0NAotLS0gYS9kb2NzL21hbi94bC4xLnBvZC5pbgorKysgYi9kb2Nz
L21hbi94bC4xLnBvZC5pbgpAQCAtMTU4OSwxMCArMTU4OSwxMiBAQCBiYWNrZW5kIGRyaXZlciBp
biBkb21haW4gMCByYXRoZXIgdGhhbiBhIHJlYWwgZHJpdmVyLgogPWl0ZW0gQjxwY2ktYXNzaWdu
YWJsZS1hZGQ+IEk8QkRGPgogCiBNYWtlIHRoZSBkZXZpY2UgYXQgUENJIEJ1cy9EZXZpY2UvRnVu
Y3Rpb24gQkRGIGFzc2lnbmFibGUgdG8gZ3Vlc3RzLgotVGhpcyB3aWxsIGJpbmQgdGhlIGRldmlj
ZSB0byB0aGUgcGNpYmFjayBkcml2ZXIuICBJZiBpdCBpcyBhbHJlYWR5Ci1ib3VuZCB0byBhIGRy
aXZlciwgaXQgd2lsbCBmaXJzdCBiZSB1bmJvdW5kLCBhbmQgdGhlIG9yaWdpbmFsIGRyaXZlcgot
c3RvcmVkIHNvIHRoYXQgaXQgY2FuIGJlIHJlLWJvdW5kIHRvIHRoZSBzYW1lIGRyaXZlciBsYXRl
ciBpZiBkZXNpcmVkLgotSWYgdGhlIGRldmljZSBpcyBhbHJlYWR5IGJvdW5kLCBpdCB3aWxsIHJl
dHVybiBzdWNjZXNzLgorVGhpcyB3aWxsIGJpbmQgdGhlIGRldmljZSB0byB0aGUgcGNpYmFjayBk
cml2ZXIgYW5kIGFzc2lnbiBpdCB0byB0aGUKKyJxdWFyYW50aW5lIGRvbWFpbiIuICBJZiBpdCBp
cyBhbHJlYWR5IGJvdW5kIHRvIGEgZHJpdmVyLCBpdCB3aWxsCitmaXJzdCBiZSB1bmJvdW5kLCBh
bmQgdGhlIG9yaWdpbmFsIGRyaXZlciBzdG9yZWQgc28gdGhhdCBpdCBjYW4gYmUKK3JlLWJvdW5k
IHRvIHRoZSBzYW1lIGRyaXZlciBsYXRlciBpZiBkZXNpcmVkLiAgSWYgdGhlIGRldmljZSBpcwor
YWxyZWFkeSBib3VuZCwgaXQgd2lsbCBhc3NpZ24gaXQgdG8gdGhlIHF1YXJhbnRpbmUgZG9tYWlu
IGFuZCByZXR1cm4KK3N1Y2Nlc3MuCiAKIENBVVRJT046IFRoaXMgd2lsbCBtYWtlIHRoZSBkZXZp
Y2UgdW51c2FibGUgYnkgRG9tYWluIDAgdW50aWwgaXQgaXMKIHJldHVybmVkIHdpdGggcGNpLWFz
c2lnbmFibGUtcmVtb3ZlLiAgQ2FyZSBzaG91bGQgdGhlcmVmb3JlIGJlIHRha2VuCkBAIC0xNjAy
LDExICsxNjA0LDIyIEBAIGJlaW5nIHVzZWQuCiAKID1pdGVtIEI8cGNpLWFzc2lnbmFibGUtcmVt
b3ZlPiBbSTwtcj5dIEk8QkRGPgogCi1NYWtlIHRoZSBkZXZpY2UgYXQgUENJIEJ1cy9EZXZpY2Uv
RnVuY3Rpb24gQkRGIG5vdCBhc3NpZ25hYmxlIHRvIGd1ZXN0cy4gIFRoaXMKLXdpbGwgYXQgbGVh
c3QgdW5iaW5kIHRoZSBkZXZpY2UgZnJvbSBwY2liYWNrLiAgSWYgdGhlIC1yIG9wdGlvbiBpcyBz
cGVjaWZpZWQsCi1pdCB3aWxsIGFsc28gYXR0ZW1wdCB0byByZS1iaW5kIHRoZSBkZXZpY2UgdG8g
aXRzIG9yaWdpbmFsIGRyaXZlciwgbWFraW5nIGl0Ci11c2FibGUgYnkgRG9tYWluIDAgYWdhaW4u
ICBJZiB0aGUgZGV2aWNlIGlzIG5vdCBib3VuZCB0byBwY2liYWNrLCBpdCB3aWxsCi1yZXR1cm4g
c3VjY2Vzcy4KK01ha2UgdGhlIGRldmljZSBhdCBQQ0kgQnVzL0RldmljZS9GdW5jdGlvbiBCREYg
bm90IGFzc2lnbmFibGUgdG8KK2d1ZXN0cy4gIFRoaXMgd2lsbCBhdCBsZWFzdCB1bmJpbmQgdGhl
IGRldmljZSBmcm9tIHBjaWJhY2ssIGFuZAorcmUtYXNzaWduIGl0IGZyb20gdGhlICJxdWFyYW50
aW5lIGRvbWFpbiIgYmFjayB0byBkb21haW4gMC4gIElmIHRoZSAtcgorb3B0aW9uIGlzIHNwZWNp
ZmllZCwgaXQgd2lsbCBhbHNvIGF0dGVtcHQgdG8gcmUtYmluZCB0aGUgZGV2aWNlIHRvIGl0cwor
b3JpZ2luYWwgZHJpdmVyLCBtYWtpbmcgaXQgdXNhYmxlIGJ5IERvbWFpbiAwIGFnYWluLiAgSWYg
dGhlIGRldmljZSBpcworbm90IGJvdW5kIHRvIHBjaWJhY2ssIGl0IHdpbGwgcmV0dXJuIHN1Y2Nl
c3MuCisKK05vdGUgdGhhdCB0aGlzIGZ1bmN0aW9uYWxpdHkgd2lsbCB3b3JrIGV2ZW4gZm9yIGRl
dmljZXMgd2hpY2ggd2VyZSBub3QKK21hZGUgYXNzaWduYWJsZSBieSBCPHBjaS1hc3NpZ25hYmxl
LWFkZD4uICBUaGlzIGNhbiBiZSB1c2VkIHRvIGFsbG93Citkb20wIHRvIGFjY2VzcyBkZXZpY2Vz
IHdoaWNoIHdlcmUgYXV0b21hdGljYWxseSBxdWFyYW50aW5lZCBieSBYZW4KK2FmdGVyIGRvbWFp
biBkZXN0cnVjdGlvbiBhcyBhIHJlc3VsdCBvZiBYZW4ncyBCPGlvbW11PXF1YXJhbnRpbmU+Citj
b21tYW5kLWxpbmUgZGVmYXVsdC4KKworQXMgYWx3YXlzLCB0aGlzIHNob3VsZCBvbmx5IGJlIGRv
bmUgaWYgeW91IHRydXN0IHRoZSBndWVzdCwgb3IgYXJlCitjb25maWRlbnQgdGhhdCB0aGUgcGFy
dGljdWxhciBkZXZpY2UgeW91J3JlIHJlLWFzc2lnbmluZyB0byBkb20wIHdpbGwKK2NhbmNlbCBh
bGwgaW4tZmxpZ2h0IERNQSBvbiBGTFIuCiAKID1pdGVtIEI8cGNpLWF0dGFjaD4gSTxkb21haW4t
aWQ+IEk8QkRGPgogCi0tIAoyLjI0LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
