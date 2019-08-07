Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F295784ECA
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 16:33:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvMyN-0000zK-87; Wed, 07 Aug 2019 14:31:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OTKn=WD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hvMyL-0000y6-0Z
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 14:31:25 +0000
X-Inumbo-ID: 075622f9-b920-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 075622f9-b920-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 14:31:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 29FDDAFE3;
 Wed,  7 Aug 2019 14:31:22 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  7 Aug 2019 16:31:16 +0200
Message-Id: <20190807143119.8360-2-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190807143119.8360-1-jgross@suse.com>
References: <20190807143119.8360-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 1/4] xen/spinlocks: in debug builds store cpu
 holding the lock
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIHRoZSBjcHUgY3VycmVudGx5IGhvbGRpbmcgdGhlIGxvY2sgdG8gc3RydWN0IGxvY2tfZGVi
dWcuIFRoaXMgbWFrZXMKYW5hbHlzaXMgb2YgbG9ja2luZyBlcnJvcnMgZWFzaWVyIGFuZCBpdCBj
YW4gYmUgdGVzdGVkIHdoZXRoZXIgdGhlCmNvcnJlY3QgY3B1IGlzIHJlbGVhc2luZyBhIGxvY2sg
YWdhaW4uCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0t
LQogeGVuL2NvbW1vbi9zcGlubG9jay5jICAgICAgfCAzMSArKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tCiB4ZW4vaW5jbHVkZS94ZW4vc3BpbmxvY2suaCB8IDE2ICsrKysrKysrKysrLS0t
LS0KIDIgZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zcGlubG9jay5jIGIveGVuL2NvbW1vbi9zcGlubG9jay5j
CmluZGV4IDZiYzUyZDcwYzAuLjRlNjgxY2M2NTEgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vc3Bp
bmxvY2suYworKysgYi94ZW4vY29tbW9uL3NwaW5sb2NrLmMKQEAgLTEzLDkgKzEzLDkgQEAKIAog
c3RhdGljIGF0b21pY190IHNwaW5fZGVidWcgX19yZWFkX21vc3RseSA9IEFUT01JQ19JTklUKDAp
OwogCi1zdGF0aWMgdm9pZCBjaGVja19sb2NrKHN0cnVjdCBsb2NrX2RlYnVnICpkZWJ1ZykKK3N0
YXRpYyB2b2lkIGNoZWNrX2xvY2sodW5pb24gbG9ja19kZWJ1ZyAqZGVidWcpCiB7Ci0gICAgaW50
IGlycV9zYWZlID0gIWxvY2FsX2lycV9pc19lbmFibGVkKCk7CisgICAgdW5zaWduZWQgc2hvcnQg
aXJxX3NhZmUgPSAhbG9jYWxfaXJxX2lzX2VuYWJsZWQoKTsKIAogICAgIGlmICggdW5saWtlbHko
YXRvbWljX3JlYWQoJnNwaW5fZGVidWcpIDw9IDApICkKICAgICAgICAgcmV0dXJuOwpAQCAtNDMs
MTggKzQzLDIxIEBAIHN0YXRpYyB2b2lkIGNoZWNrX2xvY2soc3RydWN0IGxvY2tfZGVidWcgKmRl
YnVnKQogICAgICAqLwogICAgIGlmICggdW5saWtlbHkoZGVidWctPmlycV9zYWZlICE9IGlycV9z
YWZlKSApCiAgICAgewotICAgICAgICBpbnQgc2VlbiA9IGNtcHhjaGcoJmRlYnVnLT5pcnFfc2Fm
ZSwgLTEsIGlycV9zYWZlKTsKKyAgICAgICAgdW5pb24gbG9ja19kZWJ1ZyBzZWVuLCBuZXcgPSB7
IDAgfTsKIAotICAgICAgICBpZiAoIHNlZW4gPT0gIWlycV9zYWZlICkKKyAgICAgICAgbmV3Lmly
cV9zYWZlID0gaXJxX3NhZmU7CisgICAgICAgIHNlZW4udmFsID0gY21weGNoZygmZGVidWctPnZh
bCwgMHhmZmZmLCBuZXcudmFsKTsKKworICAgICAgICBpZiAoICFzZWVuLnVudXNlZCAmJiBzZWVu
LmlycV9zYWZlID09ICFpcnFfc2FmZSApCiAgICAgICAgIHsKICAgICAgICAgICAgIHByaW50aygi
Q0hFQ0tMT0NLIEZBSUxVUkU6IHByZXYgaXJxc2FmZTogJWQsIGN1cnIgaXJxc2FmZSAlZFxuIiwK
LSAgICAgICAgICAgICAgICAgICBzZWVuLCBpcnFfc2FmZSk7CisgICAgICAgICAgICAgICAgICAg
c2Vlbi5pcnFfc2FmZSwgaXJxX3NhZmUpOwogICAgICAgICAgICAgQlVHKCk7CiAgICAgICAgIH0K
ICAgICB9CiB9CiAKLXN0YXRpYyB2b2lkIGNoZWNrX2JhcnJpZXIoc3RydWN0IGxvY2tfZGVidWcg
KmRlYnVnKQorc3RhdGljIHZvaWQgY2hlY2tfYmFycmllcih1bmlvbiBsb2NrX2RlYnVnICpkZWJ1
ZykKIHsKICAgICBpZiAoIHVubGlrZWx5KGF0b21pY19yZWFkKCZzcGluX2RlYnVnKSA8PSAwKSAp
CiAgICAgICAgIHJldHVybjsKQEAgLTczLDYgKzc2LDE3IEBAIHN0YXRpYyB2b2lkIGNoZWNrX2Jh
cnJpZXIoc3RydWN0IGxvY2tfZGVidWcgKmRlYnVnKQogICAgIEJVR19PTighbG9jYWxfaXJxX2lz
X2VuYWJsZWQoKSAmJiAoZGVidWctPmlycV9zYWZlID09IDApKTsKIH0KIAorc3RhdGljIHZvaWQg
Z290X2xvY2sodW5pb24gbG9ja19kZWJ1ZyAqZGVidWcpCit7CisgICAgZGVidWctPmNwdSA9IHNt
cF9wcm9jZXNzb3JfaWQoKTsKK30KKworc3RhdGljIHZvaWQgcmVsX2xvY2sodW5pb24gbG9ja19k
ZWJ1ZyAqZGVidWcpCit7CisgICAgQVNTRVJUKGRlYnVnLT5jcHUgPT0gc21wX3Byb2Nlc3Nvcl9p
ZCgpKTsKKyAgICBkZWJ1Zy0+Y3B1ID0gU1BJTkxPQ0tfTk9fQ1BVOworfQorCiB2b2lkIHNwaW5f
ZGVidWdfZW5hYmxlKHZvaWQpCiB7CiAgICAgYXRvbWljX2luYygmc3Bpbl9kZWJ1Zyk7CkBAIC04
Nyw2ICsxMDEsOCBAQCB2b2lkIHNwaW5fZGVidWdfZGlzYWJsZSh2b2lkKQogCiAjZGVmaW5lIGNo
ZWNrX2xvY2sobCkgKCh2b2lkKTApCiAjZGVmaW5lIGNoZWNrX2JhcnJpZXIobCkgKCh2b2lkKTAp
CisjZGVmaW5lIGdvdF9sb2NrKGwpICgodm9pZCkwKQorI2RlZmluZSByZWxfbG9jayhsKSAoKHZv
aWQpMCkKIAogI2VuZGlmCiAKQEAgLTE1MCw2ICsxNjYsNyBAQCB2b2lkIGlubGluZSBfc3Bpbl9s
b2NrX2NiKHNwaW5sb2NrX3QgKmxvY2ssIHZvaWQgKCpjYikodm9pZCAqKSwgdm9pZCAqZGF0YSkK
ICAgICAgICAgICAgIGNiKGRhdGEpOwogICAgICAgICBhcmNoX2xvY2tfcmVsYXgoKTsKICAgICB9
CisgICAgZ290X2xvY2soJmxvY2stPmRlYnVnKTsKICAgICBMT0NLX1BST0ZJTEVfR09UOwogICAg
IHByZWVtcHRfZGlzYWJsZSgpOwogICAgIGFyY2hfbG9ja19hY3F1aXJlX2JhcnJpZXIoKTsKQEAg
LTE4MSw2ICsxOTgsNyBAQCB2b2lkIF9zcGluX3VubG9jayhzcGlubG9ja190ICpsb2NrKQogICAg
IGFyY2hfbG9ja19yZWxlYXNlX2JhcnJpZXIoKTsKICAgICBwcmVlbXB0X2VuYWJsZSgpOwogICAg
IExPQ0tfUFJPRklMRV9SRUw7CisgICAgcmVsX2xvY2soJmxvY2stPmRlYnVnKTsKICAgICBhZGRf
c2l6ZWQoJmxvY2stPnRpY2tldHMuaGVhZCwgMSk7CiAgICAgYXJjaF9sb2NrX3NpZ25hbCgpOwog
fQpAQCAtMjI0LDYgKzI0Miw3IEBAIGludCBfc3Bpbl90cnlsb2NrKHNwaW5sb2NrX3QgKmxvY2sp
CiAgICAgaWYgKCBjbXB4Y2hnKCZsb2NrLT50aWNrZXRzLmhlYWRfdGFpbCwKICAgICAgICAgICAg
ICAgICAgb2xkLmhlYWRfdGFpbCwgbmV3LmhlYWRfdGFpbCkgIT0gb2xkLmhlYWRfdGFpbCApCiAg
ICAgICAgIHJldHVybiAwOworICAgIGdvdF9sb2NrKCZsb2NrLT5kZWJ1Zyk7CiAjaWZkZWYgQ09O
RklHX0xPQ0tfUFJPRklMRQogICAgIGlmIChsb2NrLT5wcm9maWxlKQogICAgICAgICBsb2NrLT5w
cm9maWxlLT50aW1lX2xvY2tlZCA9IE5PVygpOwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVu
L3NwaW5sb2NrLmggYi94ZW4vaW5jbHVkZS94ZW4vc3BpbmxvY2suaAppbmRleCBhODExYjczYmYz
Li5iNDg4MWFkNDMzIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vc3BpbmxvY2suaAorKysg
Yi94ZW4vaW5jbHVkZS94ZW4vc3BpbmxvY2suaApAQCAtNywxNCArNywyMCBAQAogI2luY2x1ZGUg
PHhlbi9wZXJjcHUuaD4KIAogI2lmbmRlZiBOREVCVUcKLXN0cnVjdCBsb2NrX2RlYnVnIHsKLSAg
ICBzMTYgaXJxX3NhZmU7IC8qICsxOiBJUlEtc2FmZTsgMDogbm90IElSUS1zYWZlOyAtMTogZG9u
J3Qga25vdyB5ZXQgKi8KK3VuaW9uIGxvY2tfZGVidWcgeworICAgIHVuc2lnbmVkIHNob3J0IHZh
bDsKKyAgICBzdHJ1Y3QgeworICAgICAgICB1bnNpZ25lZCBzaG9ydCB1bnVzZWQ6MTsKKyAgICAg
ICAgdW5zaWduZWQgc2hvcnQgaXJxX3NhZmU6MTsKKyAgICAgICAgdW5zaWduZWQgc2hvcnQgcGFk
OjI7CisgICAgICAgIHVuc2lnbmVkIHNob3J0IGNwdToxMjsKKyAgICB9OwogfTsKLSNkZWZpbmUg
X0xPQ0tfREVCVUcgeyAtMSB9CisjZGVmaW5lIF9MT0NLX0RFQlVHIHsgMHhmZmZmIH0KIHZvaWQg
c3Bpbl9kZWJ1Z19lbmFibGUodm9pZCk7CiB2b2lkIHNwaW5fZGVidWdfZGlzYWJsZSh2b2lkKTsK
ICNlbHNlCi1zdHJ1Y3QgbG9ja19kZWJ1ZyB7IH07Cit1bmlvbiBsb2NrX2RlYnVnIHsgfTsKICNk
ZWZpbmUgX0xPQ0tfREVCVUcgeyB9CiAjZGVmaW5lIHNwaW5fZGVidWdfZW5hYmxlKCkgKCh2b2lk
KTApCiAjZGVmaW5lIHNwaW5fZGVidWdfZGlzYWJsZSgpICgodm9pZCkwKQpAQCAtMTQzLDcgKzE0
OSw3IEBAIHR5cGVkZWYgc3RydWN0IHNwaW5sb2NrIHsKICNkZWZpbmUgU1BJTkxPQ0tfTk9fQ1BV
IDB4ZmZmdQogICAgIHUxNiByZWN1cnNlX2NudDo0OwogI2RlZmluZSBTUElOTE9DS19NQVhfUkVD
VVJTRSAweGZ1Ci0gICAgc3RydWN0IGxvY2tfZGVidWcgZGVidWc7CisgICAgdW5pb24gbG9ja19k
ZWJ1ZyBkZWJ1ZzsKICNpZmRlZiBDT05GSUdfTE9DS19QUk9GSUxFCiAgICAgc3RydWN0IGxvY2tf
cHJvZmlsZSAqcHJvZmlsZTsKICNlbmRpZgotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
