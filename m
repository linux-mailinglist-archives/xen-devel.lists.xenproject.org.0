Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E6187D9C
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 17:03:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw6MG-00073w-0j; Fri, 09 Aug 2019 14:59:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yG4W=WF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hw6M2-0006cU-RU
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 14:58:54 +0000
X-Inumbo-ID: 2f3ddd4a-bab6-11e9-b5aa-0fc1553e8ba5
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2f3ddd4a-bab6-11e9-b5aa-0fc1553e8ba5;
 Fri, 09 Aug 2019 14:58:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6DDF5AFCE;
 Fri,  9 Aug 2019 14:58:44 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri,  9 Aug 2019 16:58:04 +0200
Message-Id: <20190809145833.1020-20-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190809145833.1020-1-jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v2 19/48] xen: add sched_unit_pause_nosync() and
 sched_unit_unpause()
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
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGNyZWRpdCBzY2hlZHVsZXIgY2FsbHMgdmNwdV9wYXVzZV9ub3N5bmMoKSBhbmQgdmNwdV91
bnBhdXNlKCkKdG9kYXkuIEFkZCBzY2hlZF91bml0X3BhdXNlX25vc3luYygpIGFuZCBzY2hlZF91
bml0X3VucGF1c2UoKSB0bwpwZXJmb3JtIHRoZSBzYW1lIG9wZXJhdGlvbnMgb24gc2NoZWR1bGVy
IHVuaXRzIGluc3RlYWQuCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+Ci0tLQogeGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQuYyAgfCAgNiArKystLS0KIHhlbi9p
bmNsdWRlL3hlbi9zY2hlZC1pZi5oIHwgMTAgKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAx
MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24v
c2NoZWRfY3JlZGl0LmMgYi94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdC5jCmluZGV4IDYwZWI0ZDMy
NDQuLjRjZTBmNzY2OGEgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWRfY3JlZGl0LmMKKysr
IGIveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQuYwpAQCAtMTA2NSw3ICsxMDY1LDcgQEAgY3NjaGVk
X3VuaXRfcmVtb3ZlKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgc3RydWN0IHNjaGVkX3Vu
aXQgKnVuaXQpCiAgICAgaWYgKCB0ZXN0X2FuZF9jbGVhcl9iaXQoQ1NDSEVEX0ZMQUdfVU5JVF9Q
QVJLRUQsICZzdmMtPmZsYWdzKSApCiAgICAgewogICAgICAgICBTQ0hFRF9TVEFUX0NSQU5LKHVu
aXRfdW5wYXJrKTsKLSAgICAgICAgdmNwdV91bnBhdXNlKHN2Yy0+dW5pdC0+dmNwdV9saXN0KTsK
KyAgICAgICAgc2NoZWRfdW5pdF91bnBhdXNlKHN2Yy0+dW5pdCk7CiAgICAgfQogCiAgICAgc3Bp
bl9sb2NrX2lycSgmcHJ2LT5sb2NrKTsKQEAgLTE1MTUsNyArMTUxNSw3IEBAIGNzY2hlZF9hY2N0
KHZvaWQqIGR1bW15KQogICAgICAgICAgICAgICAgICAgICAgIXRlc3RfYW5kX3NldF9iaXQoQ1ND
SEVEX0ZMQUdfVU5JVF9QQVJLRUQsICZzdmMtPmZsYWdzKSApCiAgICAgICAgICAgICAgICAgewog
ICAgICAgICAgICAgICAgICAgICBTQ0hFRF9TVEFUX0NSQU5LKHVuaXRfcGFyayk7Ci0gICAgICAg
ICAgICAgICAgICAgIHZjcHVfcGF1c2Vfbm9zeW5jKHN2Yy0+dW5pdC0+dmNwdV9saXN0KTsKKyAg
ICAgICAgICAgICAgICAgICAgc2NoZWRfdW5pdF9wYXVzZV9ub3N5bmMoc3ZjLT51bml0KTsKICAg
ICAgICAgICAgICAgICB9CiAKICAgICAgICAgICAgICAgICAvKiBMb3dlciBib3VuZCBvbiBjcmVk
aXRzICovCkBAIC0xNTM5LDcgKzE1MzksNyBAQCBjc2NoZWRfYWNjdCh2b2lkKiBkdW1teSkKICAg
ICAgICAgICAgICAgICAgICAgICogaWYgaXQgaXMgd29rZW4gdXAgaGVyZS4KICAgICAgICAgICAg
ICAgICAgICAgICovCiAgICAgICAgICAgICAgICAgICAgIFNDSEVEX1NUQVRfQ1JBTksodW5pdF91
bnBhcmspOwotICAgICAgICAgICAgICAgICAgICB2Y3B1X3VucGF1c2Uoc3ZjLT51bml0LT52Y3B1
X2xpc3QpOworICAgICAgICAgICAgICAgICAgICBzY2hlZF91bml0X3VucGF1c2Uoc3ZjLT51bml0
KTsKICAgICAgICAgICAgICAgICAgICAgY2xlYXJfYml0KENTQ0hFRF9GTEFHX1VOSVRfUEFSS0VE
LCAmc3ZjLT5mbGFncyk7CiAgICAgICAgICAgICAgICAgfQogCmRpZmYgLS1naXQgYS94ZW4vaW5j
bHVkZS94ZW4vc2NoZWQtaWYuaCBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oCmluZGV4IDY1
ZmE4NTNlOTAuLmE5NDVmYzc0OGQgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1p
Zi5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oCkBAIC00MzEsNiArNDMxLDE2IEBA
IHN0YXRpYyBpbmxpbmUgaW50IHNjaGVkX2FkanVzdF9jcHVwb29sKGNvbnN0IHN0cnVjdCBzY2hl
ZHVsZXIgKnMsCiAgICAgcmV0dXJuIHMtPmFkanVzdF9nbG9iYWwgPyBzLT5hZGp1c3RfZ2xvYmFs
KHMsIG9wKSA6IDA7CiB9CiAKK3N0YXRpYyBpbmxpbmUgdm9pZCBzY2hlZF91bml0X3BhdXNlX25v
c3luYyhzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCkKK3sKKyAgICB2Y3B1X3BhdXNlX25vc3luYyh1
bml0LT52Y3B1X2xpc3QpOworfQorCitzdGF0aWMgaW5saW5lIHZvaWQgc2NoZWRfdW5pdF91bnBh
dXNlKHN0cnVjdCBzY2hlZF91bml0ICp1bml0KQoreworICAgIHZjcHVfdW5wYXVzZSh1bml0LT52
Y3B1X2xpc3QpOworfQorCiAjZGVmaW5lIFJFR0lTVEVSX1NDSEVEVUxFUih4KSBzdGF0aWMgY29u
c3Qgc3RydWN0IHNjaGVkdWxlciAqeCMjX2VudHJ5IFwKICAgX191c2VkX3NlY3Rpb24oIi5kYXRh
LnNjaGVkdWxlcnMiKSA9ICZ4OwogCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
