Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7F4BCA89
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 16:46:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCm1q-0001hH-M5; Tue, 24 Sep 2019 14:42:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wx4c=XT=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iCm1p-0001gl-7l
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 14:42:57 +0000
X-Inumbo-ID: 963b4978-ded9-11e9-961f-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id 963b4978-ded9-11e9-961f-12813bfff9fa;
 Tue, 24 Sep 2019 14:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569336172;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=zVxeOHGmNCl8yX/E+5lo3nHHzWkmgYjK/1jpJg7goTk=;
 b=TIw/dgRsLIVsPpQqbIflISxasEN0iLX1Faan4emwrF2CcWO/i6Nr3tK+
 bjx89jHjKoV6dFej0CIsVyAuoe+6F99qrO766dmnBDjc8WKDnt01C/owt
 +5U0aFXZwBk7Diar0OgbzggZSl4WRZg+h9jp757sbuYabNGQUy+VAAr8K Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: t7Hpmahe/49sUkWJdt7OLSRVZ4zQrREB+GmqYah8/B9878gCEdrB8SQXNEhJOgU2nv+jpYOLYP
 Ki1VkWbgfCQvgSakFPWxoNgHY/1hV3o68pK/Y2WoyPnHeT6GVjnnXr9fF3Lww08uVa7xeFdOJn
 lxiIYkK86qNLeetiWElQU9/OaVSsC8frTVRSTmmg9D1yQP5Lrp8+UesCLhpFpNcXrm6uoGuFh1
 fFQAfnBm2XuR50F2UvT4qmknag+28dJehk9DpnFgr2ftH2br2KIwf6GTOX1HZC7wPfRVSNZP0H
 9Iw=
X-SBRS: 2.7
X-MesageID: 6059109
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,544,1559534400"; 
   d="scan'208";a="6059109"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 24 Sep 2019 15:42:42 +0100
Message-ID: <20190924144244.7940-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190924144244.7940-1-ian.jackson@eu.citrix.com>
References: <20190924144244.7940-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 2/4] TestSupport: Provide
 target_getfile_stash
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm8gY2FsbGVycyB5ZXQuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4KLS0tCiBPc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtIHwgNiArKysrKy0KIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtIGIvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQppbmRleCA4
OTZlMjc1ZS4uNjkzN2I2NWQgMTAwNjQ0Ci0tLSBhL09zc3Rlc3QvVGVzdFN1cHBvcnQucG0KKysr
IGIvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQpAQCAtNjEsNyArNjEsNyBAQCBCRUdJTiB7CiAgICAg
ICAgICAgICAgICAgICAgICAgdGFyZ2V0X2NtZF9pbnB1dGZoX3Jvb3Qgc3NodWhvCiAgICAgICAg
ICAgICAgICAgICAgICAgdGFyZ2V0X2dldGZpbGUgdGFyZ2V0X2dldGZpbGVfcm9vdAogICAgICAg
ICAgICAgICAgICAgICAgIHRhcmdldF9wdXRmaWxlIHRhcmdldF9wdXRmaWxlX3Jvb3QKLQkJICAg
ICAgdGFyZ2V0X2dldGZpbGVfcm9vdF9zdGFzaAorCQkgICAgICB0YXJnZXRfZ2V0ZmlsZV9zdGFz
aCB0YXJnZXRfZ2V0ZmlsZV9yb290X3N0YXNoCiAgICAgICAgICAgICAgICAgICAgICAgdGFyZ2V0
X3B1dGZpbGVjb250ZW50c19zdGFzaAogCQkgICAgICB0YXJnZXRfcHV0ZmlsZWNvbnRlbnRzX3Jv
b3Rfc3Rhc2gKICAgICAgICAgICAgICAgICAgICAgICB0YXJnZXRfcHV0X2d1ZXN0X2ltYWdlIHRh
cmdldF9lZGl0ZmlsZQpAQCAtNTczLDYgKzU3MywxMCBAQCBzdWIgdGFyZ2V0X2dldGZpbGVfc29t
ZXRoaW5nX3N0YXNoICgkJCQkOyQpIHsKICAgICAkdGdmLT4oJGhvLCR0aW1lb3V0LCRyc3JjLCRs
ZmlsZSk7CiAgICAgcmV0dXJuICRsZmlsZTsKIH0gICAgCitzdWIgdGFyZ2V0X2dldGZpbGVfc3Rh
c2ggKCQkJDskKSB7CisgICAgbXkgKCRobywkdGltZW91dCwkcnNyYywgJGxsZWFmKSA9IEBfOyAj
ID0+IGZ1bGwgcGF0aCBvZiBsb2NhbCBmaWxlCisgICAgJnRhcmdldF9nZXRmaWxlX3NvbWV0aGlu
Z19zdGFzaChcJnRhcmdldF9nZXRmaWxlLCBAXyk7Cit9CiBzdWIgdGFyZ2V0X2dldGZpbGVfcm9v
dF9zdGFzaCAoJCQkOyQpIHsKICAgICBteSAoJGhvLCR0aW1lb3V0LCRyc3JjLCAkbGxlYWYpID0g
QF87ICMgPT4gZnVsbCBwYXRoIG9mIGxvY2FsIGZpbGUKICAgICAmdGFyZ2V0X2dldGZpbGVfc29t
ZXRoaW5nX3N0YXNoKFwmdGFyZ2V0X2dldGZpbGVfcm9vdCwgQF8pOwotLSAKMi4xMS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
