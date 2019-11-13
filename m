Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE59FB1AE
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 14:48:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUswZ-0001qT-2X; Wed, 13 Nov 2019 13:44:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZSCI=ZF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iUswX-0001qM-Mq
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 13:44:21 +0000
X-Inumbo-ID: b1d22c7e-061b-11ea-984a-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b1d22c7e-061b-11ea-984a-bc764e2007e4;
 Wed, 13 Nov 2019 13:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573652661;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=qvjnWXqrNb6E8MyyEYq6Wm+eVVinttLQzACNDaVyaVA=;
 b=fQGXKxytQr8BGsIU+fh+AYOD8ze9bVVsuiOk40a9p6HnSZTu4XBx83RH
 0kk7j5BjupeNEULqGW8EJLov6puRqQstsBDfT35HR2Dqjx0Vpwyt7Yl7E
 7vXLzqlLA5VFdMqkAqcrjBwjrjraaCV+/UWHJxCcdJE6bQsLNTC4VIIYW s=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OZOT9Vr632rejoKtP0EYXExMV0tnqCOr1zjOHLBG2UsQq3+tqwBHRQgUfYwqoYKoqFL1b/XQjK
 6Y+6VXNvwcL40Z0XEvNRwf+Aw+xvf7cqpOPcIJQlEJ1NZEOscqq1z/rttzePRVZZS+n/QosuFU
 4J9hP3VYcmOwVz0JNopjdJngTnrr5GDYWJnLALGtdGR5A/i4t8DRqGy1p/xb3Vr+htGQsxQSc9
 fy8Xvo1CyxBSq9lKjP4t1hwPN8Rc2cqI+JNKxlFzn2ldfFlx8N9AWBEvENzNBWoSMpQaYvP/My
 dTw=
X-SBRS: 2.7
X-MesageID: 8259991
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,300,1569297600"; 
   d="scan'208";a="8259991"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 13 Nov 2019 13:44:17 +0000
Message-ID: <20191113134417.17299-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13] xen/passthrough: Render domains with
 %pd in the 'Q' debug handler
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
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SU9NTVVzIGFyZSBvd25lZCBieSBET01fWEVOLCBhbmQgd2l0aCBYU0EtMzAyLCBET01fSU8gaXMg
dXNlZCBmb3IKcXVhcmFudGluZWQgZG9tYWlucy4gIFVzZSAlcGQgaW4gdGhlIHByaW50ayB0byBy
ZW5kZXIgdGhlIHN5c3RlbQpkb21haW5zIG1vcmUgaW50ZWxsaWdlbnRseS4KCkJlZm9yZToKICAo
WEVOKSAwMDAwOjAwOjAxLjAgLSBkb20gMCAgIC0gbm9kZSAwICAgLSBNU0lzIDwgPgogIChYRU4p
IDAwMDA6MDA6MDAuMCAtIGRvbSAwICAgLSBub2RlIDAgICAtIE1TSXMgPCA+CiAgKFhFTikgMDAw
MDo4MDowMC4yIC0gZG9tIDMyNzU0IC0gbm9kZSAxICAgLSBNU0lzIDwgPgogIChYRU4pIDAwMDA6
YTA6MDAuMiAtIGRvbSAzMjc1NCAtIG5vZGUgMSAgIC0gTVNJcyA8ID4KICAoWEVOKSAwMDAwOmMw
OjAwLjIgLSBkb20gMzI3NTQgLSBub2RlIDEgICAtIE1TSXMgPCA+CiAgKFhFTikgMDAwMDplMDow
MC4yIC0gZG9tIDMyNzU0IC0gbm9kZSAxICAgLSBNU0lzIDwgPgogIChYRU4pIDAwMDA6MDA6MDAu
MiAtIGRvbSAzMjc1NCAtIG5vZGUgMCAgIC0gTVNJcyA8ID4KICAoWEVOKSAwMDAwOjIwOjAwLjIg
LSBkb20gMzI3NTQgLSBub2RlIDAgICAtIE1TSXMgPCA+CiAgKFhFTikgMDAwMDo0MDowMC4yIC0g
ZG9tIDMyNzU0IC0gbm9kZSAwICAgLSBNU0lzIDwgPgogIChYRU4pIDAwMDA6NjA6MDAuMiAtIGRv
bSAzMjc1NCAtIG5vZGUgMCAgIC0gTVNJcyA8ID4KCkFmdGVyOgogIChYRU4pIDAwMDA6MDA6MDEu
MCAtIGQwIC0gbm9kZSAwICAgLSBNU0lzIDwgPgogIChYRU4pIDAwMDA6MDA6MDAuMCAtIGQwIC0g
bm9kZSAwICAgLSBNU0lzIDwgPgogIChYRU4pIDAwMDA6ODA6MDAuMiAtIGRbWEVOXSAtIG5vZGUg
MSAgIC0gTVNJcyA8ID4KICAoWEVOKSAwMDAwOmEwOjAwLjIgLSBkW1hFTl0gLSBub2RlIDEgICAt
IE1TSXMgPCA+CiAgKFhFTikgMDAwMDpjMDowMC4yIC0gZFtYRU5dIC0gbm9kZSAxICAgLSBNU0lz
IDwgPgogIChYRU4pIDAwMDA6ZTA6MDAuMiAtIGRbWEVOXSAtIG5vZGUgMSAgIC0gTVNJcyA8ID4K
ICAoWEVOKSAwMDAwOjAwOjAwLjIgLSBkW1hFTl0gLSBub2RlIDAgICAtIE1TSXMgPCA+CiAgKFhF
TikgMDAwMDoyMDowMC4yIC0gZFtYRU5dIC0gbm9kZSAwICAgLSBNU0lzIDwgPgogIChYRU4pIDAw
MDA6NDA6MDAuMiAtIGRbWEVOXSAtIG5vZGUgMCAgIC0gTVNJcyA8ID4KICAoWEVOKSAwMDAwOjYw
OjAwLjIgLSBkW1hFTl0gLSBub2RlIDAgICAtIE1TSXMgPCA+CgpTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNo
IDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4K
CjQuMTMgbmljZS10by1oYXZlLiAgTm90IHN0cmljdGx5IHJlcXVpcmVkLCBidXQgaXQgaXMgYSBs
b3cgcmlzayBjaGFuZ2Ugd2hpY2gKaW1wcm92ZXMgZGlhZ25vc3RpY3MuCi0tLQogeGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvcGNpLmMgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL3BjaS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKaW5kZXggMThhN2RjNzIy
NC4uOGU1MDFhNzlhOCAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMK
KysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKQEAgLTEzNDksMTAgKzEzNDksOSBA
QCBzdGF0aWMgaW50IF9kdW1wX3BjaV9kZXZpY2VzKHN0cnVjdCBwY2lfc2VnICpwc2VnLCB2b2lk
ICphcmcpCiAKICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5ICggcGRldiwgJnBzZWctPmFsbGRldnNf
bGlzdCwgYWxsZGV2c19saXN0ICkKICAgICB7Ci0gICAgICAgIHByaW50aygiJTA0eDolMDJ4OiUw
MnguJXUgLSBkb20gJS0zZCAtIG5vZGUgJS0zZCAtIE1TSXMgPCAiLAorICAgICAgICBwcmludGso
IiUwNHg6JTAyeDolMDJ4LiV1IC0gJXBkIC0gbm9kZSAlLTNkIC0gTVNJcyA8ICIsCiAgICAgICAg
ICAgICAgICBwc2VnLT5uciwgcGRldi0+YnVzLAotICAgICAgICAgICAgICAgUENJX1NMT1QocGRl
di0+ZGV2Zm4pLCBQQ0lfRlVOQyhwZGV2LT5kZXZmbiksCi0gICAgICAgICAgICAgICBwZGV2LT5k
b21haW4gPyBwZGV2LT5kb21haW4tPmRvbWFpbl9pZCA6IC0xLAorICAgICAgICAgICAgICAgUENJ
X1NMT1QocGRldi0+ZGV2Zm4pLCBQQ0lfRlVOQyhwZGV2LT5kZXZmbiksIHBkZXYtPmRvbWFpbiwK
ICAgICAgICAgICAgICAgIChwZGV2LT5ub2RlICE9IE5VTUFfTk9fTk9ERSkgPyBwZGV2LT5ub2Rl
IDogLTEpOwogICAgICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5ICggbXNpLCAmcGRldi0+bXNpX2xp
c3QsIGxpc3QgKQogICAgICAgICAgICAgICAgcHJpbnRrKCIlZCAiLCBtc2ktPmlycSk7Ci0tIAoy
LjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
