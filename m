Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF45FBC6ED
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 13:34:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCj2M-00074T-QD; Tue, 24 Sep 2019 11:31:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LhKX=XT=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iCj2K-00073q-QH
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 11:31:16 +0000
X-Inumbo-ID: d2178e5e-debe-11e9-ae5c-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by localhost (Halon) with ESMTPS
 id d2178e5e-debe-11e9-ae5c-bc764e2007e4;
 Tue, 24 Sep 2019 11:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569324677;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cVm1E9SWn59HiRBpcK9hd5UAXK2JM4SVNjHe+W2XCbI=;
 b=INBoDTDBmfqp+z03s1DCgOrKz+D/pyGW6W0MrgjioFc7YmwIHUw2GNLX
 TeQyoEs2GOHKwqE4euMghvv+lQhn5Vj6q3NLrNmNnjts785zIPHnaAo8c
 Yq80av2tn1B8bQcNkFQLlxmT6P7A17jxc4hwTw4Ycqv3PxIjW/gvw67/x o=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: g1E08A7/TG9MA9xEBIV2QzhKpXyy+CjQC6yimgr4WuSbjTXUzfI/Mtcb+a5KWb/Vw/9sZFZyyN
 GhHZ5A8aPuFPV4BUW7qeE7qKf00OWceeburPZujocYAROIWca+9C+jVEZ0dbJYwG2qczAH/Ewp
 /ryEzvkUonppPXniep5zlonqRt5is266W+cHn/sRf9Eg1M4D8z0xb/o+hAhdzd6f/iiVOXg+w1
 AAkba9mtClJ0YcWWUX1w8SeIbdlUtZ7pfqPuo6HO9gT7TA9/kCgvVKKl09xNcM+vEJUSWsOkvt
 o+k=
X-SBRS: 2.7
X-MesageID: 5977601
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,543,1559534400"; 
   d="scan'208";a="5977601"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 24 Sep 2019 12:30:25 +0100
Message-ID: <20190924113026.255634-7-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190924113026.255634-1-anthony.perard@citrix.com>
References: <20190924113026.255634-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PULL 6/7] xen-block: treat XenbusStateUnknown the same
 as XenbusStateClosed
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KCldoZW4gYSBmcm9u
dGVuZCBncmFjZWZ1bGx5IGRpc2Nvbm5lY3RzIGZyb20gYW4gb2ZmbGluZSBiYWNrZW5kLCBpdCB3
aWxsCnNldCBpdHMgb3duIHN0YXRlIHRvIFhlbmJ1c1N0YXRlQ2xvc2VkLiBUaGUgY29kZSBpbiB4
ZW4tYmxvY2suYyBjb3JyZWN0bHkKZGVhbHMgd2l0aCB0aGlzIGFuZCBzZXRzIHRoZSBiYWNrZW5k
IGludG8gWGVuYnVzU3RhdGVDbG9zZWQuIFVuZm9ydHVuYXRlbHkKaXQgaXMgcG9zc2libGUgZm9y
IHRvb2xzdGFjayB0byBhY3R1YWxseSBkZWxldGUgdGhlIGZyb250ZW5kIGFyZWEKYmVmb3JlIHRo
ZSBzdGF0ZSBrZXkgaGFzIGJlZW4gcmVhZCwgbGVhZGluZyB0byBhbiBhcHBhcmVudCBmcm9udGVu
ZCBzdGF0ZQpvZiBYZW5idXNTdGF0ZVVua25vd24uIFRoaXMgcHJldmVudHMgdGhlIGJhY2tlbmQg
c3RhdGUgZnJvbSB0cmFuc2l0aW9uaW5nCnRvIFhlbmJ1c1N0YXRlQ2xvc2VkIGFuZCBoZW5jZSBs
ZWF2ZXMgaXQgbGltYm8uCgpUaGlzIHBhdGNoIHNpbXBseSB0cmVhdHMgYSBmcm9udGVuZCBzdGF0
ZSBvZiBYZW5idXNTdGF0ZVVua25vd24gdGhlIHNhbWUKYXMgWGVuYnVzU3RhdGVDbG9zZWQsIHdo
aWNoIHdpbGwgdW5ibG9jayB0aGUgYmFja2VuZCBpbiB0aGVzZSBjaXJjdW1zdGFuY2VzLgoKUmVw
b3J0ZWQtYnk6IE1hcmsgU3ltcyA8bWFyay5zeW1zQGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6
IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CkFja2VkLWJ5OiBBbnRob255
IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEpvaG4gU25v
dyA8anNub3dAcmVkaGF0LmNvbT4KTWVzc2FnZS1JZDogPDIwMTkwOTE4MTE1NzAyLjM4OTU5LTEt
cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxh
bnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KIGh3L2Jsb2NrL3hlbi1ibG9jay5jIHwgMSAr
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9ody9ibG9jay94
ZW4tYmxvY2suYyBiL2h3L2Jsb2NrL3hlbi1ibG9jay5jCmluZGV4IGY3NzM0M2RiNjAuLjg3OWZj
MzEwYTQgMTAwNjQ0Ci0tLSBhL2h3L2Jsb2NrL3hlbi1ibG9jay5jCisrKyBiL2h3L2Jsb2NrL3hl
bi1ibG9jay5jCkBAIC0zMTMsNiArMzEzLDcgQEAgc3RhdGljIHZvaWQgeGVuX2Jsb2NrX2Zyb250
ZW5kX2NoYW5nZWQoWGVuRGV2aWNlICp4ZW5kZXYsCiAgICAgICAgIGJyZWFrOwogCiAgICAgY2Fz
ZSBYZW5idXNTdGF0ZUNsb3NlZDoKKyAgICBjYXNlIFhlbmJ1c1N0YXRlVW5rbm93bjoKICAgICAg
ICAgeGVuX2Jsb2NrX2Rpc2Nvbm5lY3QoeGVuZGV2LCAmbG9jYWxfZXJyKTsKICAgICAgICAgaWYg
KGxvY2FsX2VycikgewogICAgICAgICAgICAgZXJyb3JfcHJvcGFnYXRlKGVycnAsIGxvY2FsX2Vy
cik7Ci0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
