Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41472BCA8A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 16:46:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCm1l-0001fb-Vk; Tue, 24 Sep 2019 14:42:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wx4c=XT=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iCm1k-0001fN-9d
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 14:42:52 +0000
X-Inumbo-ID: 957576da-ded9-11e9-961f-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id 957576da-ded9-11e9-961f-12813bfff9fa;
 Tue, 24 Sep 2019 14:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569336171;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=w8e/5QnstS2C28IHKsjUjQg4FvjAqxAkYZoL0yOOAk4=;
 b=BhwAxj2a26qsxJY9N/DWGSS/Roq2muONNxa9ORpFP3Zw4T2XBIZZnzGs
 9ocoml9A++6YzA6rtHbVMObqIXbp4Spy1ZFp4N0oURzlzbc1u7szOQzlc
 ZNmnRWRCms6r/fh5QgznGYpKjtC0gZHRgqjDTAESnWPgJSgSPqm9zfRKU M=;
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
IronPort-SDR: 9J4vNkbfQ8fvVScciNmI39Q3B97MBd2x0IdLLDap+Ua3pY4wjbDkd+LgewIafWZPc1NG3k7dMd
 H67vGEZlNBEOPvQ2uqr4LKvjqhLgbuFMLqE5lul41sJvCoDjxQpZymVmmDu5l6OA2kWGGqtIXk
 Q0DCxXG4ZWub49TwmHTmy1RrEua9SIlQQ249281w7CDkOTBAJo8KmjqEdDeaxWNw/td5YaxWXB
 6jlgMQgqvAV0yNECcw0EDO0b2vTs9tTFOtZfk9rePfphxugcJqeYBXzTSHb+RYfwYuvZqXy94g
 Ems=
X-SBRS: 2.7
X-MesageID: 6059108
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,544,1559534400"; 
   d="scan'208";a="6059108"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 24 Sep 2019 15:42:41 +0100
Message-ID: <20190924144244.7940-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 1/4] TestSupport: Break out
 target_getfile_something_stash
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

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmph
Y2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBPc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtIHwgMTAgKysr
KysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtIGIvT3NzdGVzdC9UZXN0U3VwcG9y
dC5wbQppbmRleCBlNTU0YWYzOC4uODk2ZTI3NWUgMTAwNjQ0Ci0tLSBhL09zc3Rlc3QvVGVzdFN1
cHBvcnQucG0KKysrIGIvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQpAQCAtNTY1LDEzICs1NjUsMTcg
QEAgc3ViIHRhcmdldF9nZXRmaWxlX3Jvb3QgKCQkJCQpIHsKICAgICBteSAoJGhvLCR0aW1lb3V0
LCAkcnNyYywkbGRzdCkgPSBAXzsKICAgICB0Z2V0ZmlsZWV4KCdyb290JywgQF8pOwogfQotc3Vi
IHRhcmdldF9nZXRmaWxlX3Jvb3Rfc3Rhc2ggKCQkJDskKSB7Ci0gICAgbXkgKCRobywkdGltZW91
dCwkcnNyYywgJGxsZWFmKSA9IEBfOyAjID0+IGZ1bGwgcGF0aCBvZiBsb2NhbCBmaWxlCitzdWIg
dGFyZ2V0X2dldGZpbGVfc29tZXRoaW5nX3N0YXNoICgkJCQkOyQpIHsKKyAgICBteSAoJHRnZiwk
aG8sJHRpbWVvdXQsJHJzcmMsICRsbGVhZikgPSBAXzsgIyA9PiBmdWxsIHBhdGggb2YgbG9jYWwg
ZmlsZQogICAgIHRhcmdldF9zb21lZmlsZV9sZWFmKFwkbGxlYWYsICRyc3JjLCAkaG8pOwogICAg
IG9wZW5fdW5pcXVlX3N0YXNoZmlsZShcJGxsZWFmKTsgIyBkaXNjYXJkIGZpbGVoYW5kbGUsIGxl
YXZlIGZpbGUKICAgICBteSAkbGZpbGUgPSAiJHN0YXNoLyRsbGVhZiI7Ci0gICAgdGFyZ2V0X2dl
dGZpbGVfcm9vdCgkaG8sJHRpbWVvdXQsJHJzcmMsJGxmaWxlKTsKKyAgICAkdGdmLT4oJGhvLCR0
aW1lb3V0LCRyc3JjLCRsZmlsZSk7CiAgICAgcmV0dXJuICRsZmlsZTsKK30gICAgCitzdWIgdGFy
Z2V0X2dldGZpbGVfcm9vdF9zdGFzaCAoJCQkOyQpIHsKKyAgICBteSAoJGhvLCR0aW1lb3V0LCRy
c3JjLCAkbGxlYWYpID0gQF87ICMgPT4gZnVsbCBwYXRoIG9mIGxvY2FsIGZpbGUKKyAgICAmdGFy
Z2V0X2dldGZpbGVfc29tZXRoaW5nX3N0YXNoKFwmdGFyZ2V0X2dldGZpbGVfcm9vdCwgQF8pOwog
fQogCiBzdWIgdHB1dGZpbGVleCB7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
