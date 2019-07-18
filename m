Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C3E6D690
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 23:37:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoE1q-0006vr-B4; Thu, 18 Jul 2019 21:33:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y+p/=VP=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hoE1o-0006vm-5P
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 21:33:28 +0000
X-Inumbo-ID: ace65e75-a9a3-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ace65e75-a9a3-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 21:33:26 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: UpJpJM9TVJ3ubxxb0mCwMaOjnHMPhYroATuk2zdVbXurVUS3qllwAr8wo0CZL/ugRjhLJprkot
 f7CHVXnmQZ9Rv5I8KXTxdd9FYJV80EWppz+iRnK+/OIwUrowz0TtIWJKb2HKc0c8AEcazdVdxA
 NjT/uGo9rzL+1mKGO6fiLp2OHDtRtdXU0foc1XV0PCX+A0S+fDhp3UjjEjNMu4VWH5Maypp1l5
 KV6nmliYthdhJV9jeB3lQywZGrZaueKpcc/F3TRIjT1GsVGOr5XjDFGykyu/ZNaYn5ERYmCwRs
 PvM=
X-SBRS: 2.7
X-MesageID: 3149880
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,279,1559534400"; 
   d="scan'208";a="3149880"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 18 Jul 2019 22:33:19 +0100
Message-ID: <20190718213319.4036-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] golang/xenlight: Use the most generic pointer
 for xennoollog
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
Cc: Ian Jackson <ian.jackson@citrix.com>,
 Nicolas Belouin <nicolas.belouin@gandi.net>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogTmljb2xhcyBCZWxvdWluIDxuaWNvbGFzLmJlbG91aW5AZ2FuZGkubmV0PgoKSXQgbWFr
ZXMgbW9yZSBzZW5zZSBmb3IgQ3R4IHRvIGNvbnRhaW4gdGhlIGdlbmVyaWMgQy54ZW50b29sbG9n
X2xvZ2dlcgp0eXBlLCByYXRoZXIgdGhhbiB0aGUgc3BlY2lmaWMgdHlwZSB3ZSBlbmQgdXAgYXNz
aWduaW5nIHRvIGl0LiAgVGhpcwphbHNvIGFsbG93cyBvbmUgZmV3ZXIgY2FzdC4KClNpZ25lZC1v
ZmYtYnk6IE5pY29sYXMgQmVsb3VpbiA8bmljb2xhcy5iZWxvdWluQGdhbmRpLm5ldD4KU2lnbmVk
LW9mZi1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgotLS0KCk5p
Y29sYXMnIHN1Ym1pdHRlZCBhIHBhdGNoIGZpeGluZyBjYXN0cyBhcyB3ZWxsIGFzIG1ha2luZyB0
aGlzIGNoYW5nZSwKYXQgbXkgc3VnZ2VzdGlvbjsgYnV0IEkgZW5kZWQgdXAgY2hlY2tpbmcgaW4g
YW4gZWFybGllciBwYXRjaCB0aGF0CmZpeGVkIGNhc3RzIGJ1dCBkaWRuJ3QgbWFrZSB0aGlzIGNo
YW5nZS4KCkNDOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4KQ0M6IFdlaSBM
aXUgPHdsQHhlbi5vcmc+CkNDOiBOaWNvbGFzIEJlbG91aW4gPG5pY29sYXMuYmVsb3VpbkBnYW5k
aS5uZXQ+Ci0tLQogdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvIHwgOSArKysrKy0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvIGIvdG9vbHMvZ29sYW5n
L3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCmluZGV4IGY1ZDE3MWMyZDUuLmEyYWY2ZjZlZjkgMTAwNjQ0
Ci0tLSBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbworKysgYi90b29scy9nb2xh
bmcveGVubGlnaHQveGVubGlnaHQuZ28KQEAgLTEyMiw3ICsxMjIsNyBAQCB0eXBlIFV1aWQgQy5s
aWJ4bF91dWlkCiAKIHR5cGUgQ29udGV4dCBzdHJ1Y3QgewogCWN0eCAgICAqQy5saWJ4bF9jdHgK
LQlsb2dnZXIgKkMueGVudG9vbGxvZ19sb2dnZXJfc3RkaW9zdHJlYW0KKwlsb2dnZXIgKkMueGVu
dG9vbGxvZ19sb2dnZXIKIH0KIAogdHlwZSBId2NhcCBbXUMudWludDMyX3QKQEAgLTg0NywxNCAr
ODQ3LDE1IEBAIGZ1bmMgKEN0eCAqQ29udGV4dCkgT3BlbigpIChlcnIgZXJyb3IpIHsKIAkJcmV0
dXJuCiAJfQogCi0JQ3R4LmxvZ2dlciA9IEMueHRsX2NyZWF0ZWxvZ2dlcl9zdGRpb3N0cmVhbShD
LnN0ZGVyciwgQy5YVExfRVJST1IsIDApCisJQ3R4LmxvZ2dlciA9ICgqQy54ZW50b29sbG9nX2xv
Z2dlcikodW5zYWZlLlBvaW50ZXIoCisJCUMueHRsX2NyZWF0ZWxvZ2dlcl9zdGRpb3N0cmVhbShD
LnN0ZGVyciwgQy5YVExfRVJST1IsIDApKSkKIAlpZiBDdHgubG9nZ2VyID09IG5pbCB7CiAJCWVy
ciA9IGZtdC5FcnJvcmYoIkNhbm5vdCBvcGVuIHN0ZGlvc3RyZWFtIikKIAkJcmV0dXJuCiAJfQog
CiAJcmV0IDo9IEMubGlieGxfY3R4X2FsbG9jKCZDdHguY3R4LCBDLkxJQlhMX1ZFUlNJT04sCi0J
CTAsICgqQy54ZW50b29sbG9nX2xvZ2dlcikodW5zYWZlLlBvaW50ZXIoQ3R4LmxvZ2dlcikpKQor
CQkwLCBDdHgubG9nZ2VyKQogCiAJaWYgcmV0ICE9IDAgewogCQllcnIgPSBFcnJvcigtcmV0KQpA
QCAtODY5LDcgKzg3MCw3IEBAIGZ1bmMgKEN0eCAqQ29udGV4dCkgQ2xvc2UoKSAoZXJyIGVycm9y
KSB7CiAJaWYgcmV0ICE9IDAgewogCQllcnIgPSBFcnJvcigtcmV0KQogCX0KLQlDLnh0bF9sb2dn
ZXJfZGVzdHJveSgoKkMueGVudG9vbGxvZ19sb2dnZXIpKHVuc2FmZS5Qb2ludGVyKEN0eC5sb2dn
ZXIpKSkKKwlDLnh0bF9sb2dnZXJfZGVzdHJveShDdHgubG9nZ2VyKQogCXJldHVybgogfQogCi0t
IAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
