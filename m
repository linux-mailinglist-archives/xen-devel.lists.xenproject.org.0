Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC95CBC6F1
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 13:35:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCj2K-00073m-S3; Tue, 24 Sep 2019 11:31:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LhKX=XT=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iCj2J-00073R-Ch
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 11:31:15 +0000
X-Inumbo-ID: d132c044-debe-11e9-ae5c-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by localhost (Halon) with ESMTPS
 id d132c044-debe-11e9-ae5c-bc764e2007e4;
 Tue, 24 Sep 2019 11:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569324675;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7rCPwSSKvk2M6jbJf0UE2gfEyhfV5C3cyXczS3Hzueg=;
 b=H6jWxO1UeddAoeqoDQRN1APQhVKL1Ch4BkKlRLSPELo/OXd1rzwfz3ui
 Un5jQguU6nil8iTJ3CEl1Inahfhwi0gNT3tQ29UPyypzCgXtSP65wLt+y
 c9FxliiVz4+tyf4wYY0Fb6ixMZxIFTA3rR/DU7j6tMFRuVmWoih+yzO7Y 8=;
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
IronPort-SDR: eke+LBUkvZytegB6Sk+0JJUvlo/bUFpBhM86B1VtATWVSmGFc0DWd02S5V02djPBdpugXIYvj7
 mQ8WePuGSqIX+ipGhOy0sXY2yrAnQ3bKQrzgyo0WJ8xfzJVbTFpDrwdMoARv1ArCQ2BiPlWpF2
 YeJwObf55Dial9bB+rrSxZPW3H5gEO3MpHf2UphdEz9v9Hrar8Wcw3lV5EXLtN33FU12aIVFLX
 vHMeE+u38d2jPfljIvdufQ0vLtgofIB/yV7ca3R1pxDbLsyciYwwPZYcfnZJ84fINrt8dQXpu5
 Udk=
X-SBRS: 2.7
X-MesageID: 5977595
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,543,1559534400"; 
   d="scan'208";a="5977595"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 24 Sep 2019 12:30:20 +0100
Message-ID: <20190924113026.255634-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190924113026.255634-1-anthony.perard@citrix.com>
References: <20190924113026.255634-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PULL 1/7] xen-bus: check whether the frontend is
 active during device reset...
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

RnJvbTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KCi4uLm5vdCB0aGUg
YmFja2VuZAoKQ29tbWl0IGNiMzIzMTQ2ICJ4ZW4tYnVzOiBGaXggYmFja2VuZCBzdGF0ZSB0cmFu
c2l0aW9uIG9uIGRldmljZSByZXNldCIKY29udGFpbmVkIGEgc3VidGxlIG1pc3Rha2UuIFRoZSBo
dW5rCgpAQCAtNTM5LDExICs1NTYsMTEgQEAgc3RhdGljIHZvaWQgeGVuX2RldmljZV9iYWNrZW5k
X2NoYW5nZWQodm9pZCAqb3BhcXVlKQoKICAgICAvKgogICAgICAqIElmIHRoZSB0b29sc3RhY2sg
KG9yIHVucGx1ZyByZXF1ZXN0IGNhbGxiYWNrKSBoYXMgc2V0IHRoZSBiYWNrZW5kCi0gICAgICog
c3RhdGUgdG8gQ2xvc2luZywgYnV0IHRoZXJlIGlzIG5vIGFjdGl2ZSBmcm9udGVuZCAoaS5lLiB0
aGUKLSAgICAgKiBzdGF0ZSBpcyBub3QgQ29ubmVjdGVkKSB0aGVuIHNldCB0aGUgYmFja2VuZCBz
dGF0ZSB0byBDbG9zZWQuCisgICAgICogc3RhdGUgdG8gQ2xvc2luZywgYnV0IHRoZXJlIGlzIG5v
IGFjdGl2ZSBmcm9udGVuZCB0aGVuIHNldCB0aGUKKyAgICAgKiBiYWNrZW5kIHN0YXRlIHRvIENs
b3NlZC4KICAgICAgKi8KICAgICBpZiAoeGVuZGV2LT5iYWNrZW5kX3N0YXRlID09IFhlbmJ1c1N0
YXRlQ2xvc2luZyAmJgotICAgICAgICB4ZW5kZXYtPmZyb250ZW5kX3N0YXRlICE9IFhlbmJ1c1N0
YXRlQ29ubmVjdGVkKSB7CisgICAgICAgICF4ZW5fZGV2aWNlX3N0YXRlX2lzX2FjdGl2ZShzdGF0
ZSkpIHsKICAgICAgICAgeGVuX2RldmljZV9iYWNrZW5kX3NldF9zdGF0ZSh4ZW5kZXYsIFhlbmJ1
c1N0YXRlQ2xvc2VkKTsKICAgICB9CgptaXN0YWtlbmx5IHJlcGxhY2VkIHRoZSBjaGVjayBvZiAn
eGVuZGV2LT5mcm9udGVuZF9zdGF0ZScgd2l0aCBhIGNoZWNrCihub3cgaW4gYSBoZWxwZXIgZnVu
Y3Rpb24pIG9mICdzdGF0ZScsIHdoaWNoIGFjdHVhbGx5IGVxdWF0ZXMgdG8KJ3hlbmRldi0+YmFj
a2VuZF9zdGF0ZScuCgpUaGlzIHBhdGNoIGZpeGVzIHRoZSBtaXN0YWtlLgoKRml4ZXM6IGNiMzIz
MTQ2MDc0NzU1MmQ3MGFmOWQ1NDZkYzUzZDgxOTViY2I3OTYKU2lnbmVkLW9mZi1ieTogUGF1bCBE
dXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEFudGhvbnkgUEVS
QVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgpNZXNzYWdlLUlkOiA8MjAxOTA5MTAxNzE3
NTMuMzc3NS0xLXBhdWwuZHVycmFudEBjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBBbnRob255
IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLS0tCiBody94ZW4veGVuLWJ1cy5j
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvaHcveGVuL3hlbi1idXMuYyBiL2h3L3hlbi94ZW4tYnVzLmMKaW5kZXggYTA0
NDc4YWQ0Zi4uMDI1ZGY1ZTU5ZiAxMDA2NDQKLS0tIGEvaHcveGVuL3hlbi1idXMuYworKysgYi9o
dy94ZW4veGVuLWJ1cy5jCkBAIC01NjAsNyArNTYwLDcgQEAgc3RhdGljIHZvaWQgeGVuX2Rldmlj
ZV9iYWNrZW5kX2NoYW5nZWQodm9pZCAqb3BhcXVlKQogICAgICAqIGJhY2tlbmQgc3RhdGUgdG8g
Q2xvc2VkLgogICAgICAqLwogICAgIGlmICh4ZW5kZXYtPmJhY2tlbmRfc3RhdGUgPT0gWGVuYnVz
U3RhdGVDbG9zaW5nICYmCi0gICAgICAgICF4ZW5fZGV2aWNlX3N0YXRlX2lzX2FjdGl2ZShzdGF0
ZSkpIHsKKyAgICAgICAgIXhlbl9kZXZpY2Vfc3RhdGVfaXNfYWN0aXZlKHhlbmRldi0+ZnJvbnRl
bmRfc3RhdGUpKSB7CiAgICAgICAgIHhlbl9kZXZpY2VfYmFja2VuZF9zZXRfc3RhdGUoeGVuZGV2
LCBYZW5idXNTdGF0ZUNsb3NlZCk7CiAgICAgfQogCi0tIApBbnRob255IFBFUkFSRAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
