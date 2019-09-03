Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E92A6AAA
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 16:02:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i59Jv-0005SZ-U9; Tue, 03 Sep 2019 13:58:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CRa/=W6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i59Ju-0005SP-M2
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 13:58:06 +0000
X-Inumbo-ID: d9e2ba68-ce52-11e9-ab94-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9e2ba68-ce52-11e9-ab94-12813bfff9fa;
 Tue, 03 Sep 2019 13:58:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 517E2ADB3;
 Tue,  3 Sep 2019 13:58:04 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <88d6b97e-1f19-56ff-1a35-901ce3102e78@suse.com>
Date: Tue, 3 Sep 2019 15:58:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] ns16550: make PCI device hiding uniform
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBwY2lfaGlkZV9kZXZpY2UoKSBhbmQgcGNpX3JvX2Rldmlj
ZSgpIGlzIHRoYXQKdGhlIGZvcm1lciBvbmx5IHByZXZlbnRzIGEgZGV2aWNlIGZyb20gZ2V0dGlu
ZyBhc3NpZ25lZCB0byBhIGd1ZXN0LAp3aGlsZSB0aGUgbGF0dGVyIGFkZGl0aW9uYWxseSBhcnJh
bmdlcyBmb3IgRG9tMCB3cml0ZSBhdHRlbXB0cyB0byB0aGUKZGV2aWNlJ3MgY29uZmlnIHNwYWNl
IHRvIGJlIGlnbm9yZWQvZGlzY2FyZGVkLiBXaGV0aGVyIHdlIHdhbnQgb25lIG9yCnRoZSBvdGhl
ciBjZXJ0YWlubHkgZG9lc24ndCBkZXBlbmQgb24gd2hldGhlciB0aGUgZGV2aWNlIGlzIGluIG91
ciBzZXQKb2Yga25vd24gZGV2aWNlcy4gQWxsIHRoYXQgbWF0dGVycyBpcyB3aGV0aGVyIHdlIHVz
ZSBhIFBDSSBkZXZpY2U6IENhbGwKcGNpX3JvX2RldmljZSgpIGluIGFueSBzdWNoIGNhc2UuCgpT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQpSZXNlbmQg
d2l0aCBUby9DYyBjb3JyZWN0ZWQ7IHRoYW5rcyB0byBBbmRyZXcgZm9yIHBvaW50aW5nIG91dC4K
Ci0tLSBhL3hlbi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5jCisrKyBiL3hlbi9kcml2ZXJzL2NoYXIv
bnMxNjU1MC5jCkBAIC03NjMsMjMgKzc2MywxNiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgbnMxNjU1
MF9pbml0X3Bvc3RpcnEoCiAjaWZkZWYgQ09ORklHX0hBU19QQ0kKICAgICBpZiAoIHVhcnQtPmJh
ciB8fCB1YXJ0LT5wc19iZGZfZW5hYmxlICkKICAgICB7Ci0gICAgICAgIGlmICggIXVhcnQtPnBh
cmFtICkKLSAgICAgICAgICAgIHBjaV9oaWRlX2RldmljZSgwLCB1YXJ0LT5wc19iZGZbMF0sIFBD
SV9ERVZGTih1YXJ0LT5wc19iZGZbMV0sCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgdWFy
dC0+cHNfYmRmWzJdKSk7Ci0gICAgICAgIGVsc2UKLSAgICAgICAgewotICAgICAgICAgICAgaWYg
KCB1YXJ0LT5wYXJhbS0+bW1pbyAmJgotICAgICAgICAgICAgICAgICByYW5nZXNldF9hZGRfcmFu
Z2UobW1pb19yb19yYW5nZXMsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
YXJ0LT5pb19iYXNlLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWFydC0+
aW9fYmFzZSArIHVhcnQtPmlvX3NpemUgLSAxKSApCi0gICAgICAgICAgICAgICAgcHJpbnRrKFhF
TkxPR19JTkZPICJFcnJvciB3aGlsZSBhZGRpbmcgTU1JTyByYW5nZSBvZiBkZXZpY2UgdG8gbW1p
b19yb19yYW5nZXNcbiIpOworICAgICAgICBpZiAoIHVhcnQtPnBhcmFtICYmIHVhcnQtPnBhcmFt
LT5tbWlvICYmCisgICAgICAgICAgICAgcmFuZ2VzZXRfYWRkX3JhbmdlKG1taW9fcm9fcmFuZ2Vz
LCB1YXJ0LT5pb19iYXNlLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1YXJ0LT5p
b19iYXNlICsgdWFydC0+aW9fc2l6ZSAtIDEpICkKKyAgICAgICAgICAgIHByaW50ayhYRU5MT0df
SU5GTyAiRXJyb3Igd2hpbGUgYWRkaW5nIE1NSU8gcmFuZ2Ugb2YgZGV2aWNlIHRvIG1taW9fcm9f
cmFuZ2VzXG4iKTsKIAotICAgICAgICAgICAgaWYgKCBwY2lfcm9fZGV2aWNlKDAsIHVhcnQtPnBz
X2JkZlswXSwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQ0lfREVWRk4odWFydC0+
cHNfYmRmWzFdLCB1YXJ0LT5wc19iZGZbMl0pKSApCi0gICAgICAgICAgICAgICAgcHJpbnRrKFhF
TkxPR19JTkZPICJDb3VsZCBub3QgbWFyayBjb25maWcgc3BhY2Ugb2YgJTAyeDolMDJ4LiV1IHJl
YWQtb25seS5cbiIsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1YXJ0LT5w
c19iZGZbMF0sIHVhcnQtPnBzX2JkZlsxXSwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVhcnQtPnBzX2JkZlsyXSk7Ci0gICAgICAgIH0KKyAgICAgICAgaWYgKCBwY2lfcm9f
ZGV2aWNlKDAsIHVhcnQtPnBzX2JkZlswXSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgIFBD
SV9ERVZGTih1YXJ0LT5wc19iZGZbMV0sIHVhcnQtPnBzX2JkZlsyXSkpICkKKyAgICAgICAgICAg
IHByaW50ayhYRU5MT0dfSU5GTyAiQ291bGQgbm90IG1hcmsgY29uZmlnIHNwYWNlIG9mICUwMng6
JTAyeC4ldSByZWFkLW9ubHkuXG4iLAorICAgICAgICAgICAgICAgICAgIHVhcnQtPnBzX2JkZlsw
XSwgdWFydC0+cHNfYmRmWzFdLAorICAgICAgICAgICAgICAgICAgIHVhcnQtPnBzX2JkZlsyXSk7
CiAKICAgICAgICAgaWYgKCB1YXJ0LT5tc2kgKQogICAgICAgICB7CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
