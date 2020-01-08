Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8347113461D
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 16:25:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipDBY-0004WT-VT; Wed, 08 Jan 2020 15:23:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Mkji=25=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ipDBX-0004Vo-IE
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 15:23:51 +0000
X-Inumbo-ID: d45bd6d8-322a-11ea-a38f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d45bd6d8-322a-11ea-a38f-bc764e2007e4;
 Wed, 08 Jan 2020 15:23:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CB2D3B1E6;
 Wed,  8 Jan 2020 15:23:31 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  8 Jan 2020 16:23:22 +0100
Message-Id: <20200108152328.27194-4-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200108152328.27194-1-jgross@suse.com>
References: <20200108152328.27194-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v2 3/9] xen/sched: cleanup sched.h
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgYXJlIHNvbWUgaXRlbXMgaW4gaW5jbHVkZS94ZW4vc2NoZWQuaCB3aGljaCBjYW4gYmUg
bW92ZWQgdG8KcHJpdmF0ZS5oIGFzIHRoZXkgYXJlIHNjaGVkdWxlciBwcml2YXRlLgoKU2lnbmVk
LW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpSZXZpZXdlZC1ieTogRGFy
aW8gRmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNlLmNvbT4KLS0tCiB4ZW4vY29tbW9uL3NjaGVkL2Nv
cmUuYyAgICB8ICAyICstCiB4ZW4vY29tbW9uL3NjaGVkL3ByaXZhdGUuaCB8IDEzICsrKysrKysr
KysrKysKIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5oICAgIHwgMTcgLS0tLS0tLS0tLS0tLS0tLS0K
IDMgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMgYi94ZW4vY29tbW9uL3NjaGVkL2NvcmUu
YwppbmRleCAyZmFlOTU5ZTkwLi40MTUzZDExMGJlIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3Nj
aGVkL2NvcmUuYworKysgYi94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYwpAQCAtMTM0Niw3ICsxMzQ2
LDcgQEAgaW50IHZjcHVfc2V0X2hhcmRfYWZmaW5pdHkoc3RydWN0IHZjcHUgKnYsIGNvbnN0IGNw
dW1hc2tfdCAqYWZmaW5pdHkpCiAgICAgcmV0dXJuIHZjcHVfc2V0X2FmZmluaXR5KHYsIGFmZmlu
aXR5LCB2LT5zY2hlZF91bml0LT5jcHVfaGFyZF9hZmZpbml0eSk7CiB9CiAKLWludCB2Y3B1X3Nl
dF9zb2Z0X2FmZmluaXR5KHN0cnVjdCB2Y3B1ICp2LCBjb25zdCBjcHVtYXNrX3QgKmFmZmluaXR5
KQorc3RhdGljIGludCB2Y3B1X3NldF9zb2Z0X2FmZmluaXR5KHN0cnVjdCB2Y3B1ICp2LCBjb25z
dCBjcHVtYXNrX3QgKmFmZmluaXR5KQogewogICAgIHJldHVybiB2Y3B1X3NldF9hZmZpbml0eSh2
LCBhZmZpbml0eSwgdi0+c2NoZWRfdW5pdC0+Y3B1X3NvZnRfYWZmaW5pdHkpOwogfQpkaWZmIC0t
Z2l0IGEveGVuL2NvbW1vbi9zY2hlZC9wcml2YXRlLmggYi94ZW4vY29tbW9uL3NjaGVkL3ByaXZh
dGUuaAppbmRleCBhNzAyZmQyM2IxLi5lZGNlMzU0ZGM3IDEwMDY0NAotLS0gYS94ZW4vY29tbW9u
L3NjaGVkL3ByaXZhdGUuaAorKysgYi94ZW4vY29tbW9uL3NjaGVkL3ByaXZhdGUuaApAQCAtNTMz
LDYgKzUzMyw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBzY2hlZF91bml0X3VucGF1c2UoY29uc3Qg
c3RydWN0IHNjaGVkX3VuaXQgKnVuaXQpCiBzdHJ1Y3QgY3B1cG9vbAogewogICAgIGludCAgICAg
ICAgICAgICAgY3B1cG9vbF9pZDsKKyNkZWZpbmUgQ1BVUE9PTElEX05PTkUgICAgLTEKICAgICB1
bnNpZ25lZCBpbnQgICAgIG5fZG9tOwogICAgIGNwdW1hc2tfdmFyX3QgICAgY3B1X3ZhbGlkOyAg
ICAgIC8qIGFsbCBjcHVzIGFzc2lnbmVkIHRvIHBvb2wgKi8KICAgICBjcHVtYXNrX3Zhcl90ICAg
IHJlc192YWxpZDsgICAgICAvKiBhbGwgc2NoZWR1bGluZyByZXNvdXJjZXMgb2YgcG9vbCAqLwpA
QCAtNjE4LDUgKzYxOSwxNyBAQCBhZmZpbml0eV9iYWxhbmNlX2NwdW1hc2soY29uc3Qgc3RydWN0
IHNjaGVkX3VuaXQgKnVuaXQsIGludCBzdGVwLAogCiB2b2lkIHNjaGVkX3JtX2NwdSh1bnNpZ25l
ZCBpbnQgY3B1KTsKIGNvbnN0IGNwdW1hc2tfdCAqc2NoZWRfZ2V0X29wdF9jcHVtYXNrKGVudW0g
c2NoZWRfZ3JhbiBvcHQsIHVuc2lnbmVkIGludCBjcHUpOwordm9pZCBzY2hlZHVsZV9kdW1wKHN0
cnVjdCBjcHVwb29sICpjKTsKK3N0cnVjdCBzY2hlZHVsZXIgKnNjaGVkdWxlcl9nZXRfZGVmYXVs
dCh2b2lkKTsKK3N0cnVjdCBzY2hlZHVsZXIgKnNjaGVkdWxlcl9hbGxvYyh1bnNpZ25lZCBpbnQg
c2NoZWRfaWQsIGludCAqcGVycik7Cit2b2lkIHNjaGVkdWxlcl9mcmVlKHN0cnVjdCBzY2hlZHVs
ZXIgKnNjaGVkKTsKK2ludCBjcHVfZGlzYWJsZV9zY2hlZHVsZXIodW5zaWduZWQgaW50IGNwdSk7
CitpbnQgc2NoZWR1bGVfY3B1X2FkZCh1bnNpZ25lZCBpbnQgY3B1LCBzdHJ1Y3QgY3B1cG9vbCAq
Yyk7CitpbnQgc2NoZWR1bGVfY3B1X3JtKHVuc2lnbmVkIGludCBjcHUpOworaW50IHNjaGVkX21v
dmVfZG9tYWluKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBjcHVwb29sICpjKTsKK3N0cnVjdCBj
cHVwb29sICpjcHVwb29sX2dldF9ieV9pZChpbnQgcG9vbGlkKTsKK3ZvaWQgY3B1cG9vbF9wdXQo
c3RydWN0IGNwdXBvb2wgKnBvb2wpOworaW50IGNwdXBvb2xfYWRkX2RvbWFpbihzdHJ1Y3QgZG9t
YWluICpkLCBpbnQgcG9vbGlkKTsKK3ZvaWQgY3B1cG9vbF9ybV9kb21haW4oc3RydWN0IGRvbWFp
biAqZCk7CiAKICNlbmRpZiAvKiBfX1hFTl9TQ0hFRF9JRl9IX18gKi8KZGlmZiAtLWdpdCBhL3hl
bi9pbmNsdWRlL3hlbi9zY2hlZC5oIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKaW5kZXggZDNh
ZGM2OWFiOS4uYjRjMmU0ZjdjMiAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgK
KysrIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKQEAgLTY4Nyw3ICs2ODcsNiBAQCBpbnQgIHNj
aGVkX2luaXRfdmNwdShzdHJ1Y3QgdmNwdSAqdik7CiB2b2lkIHNjaGVkX2Rlc3Ryb3lfdmNwdShz
dHJ1Y3QgdmNwdSAqdik7CiBpbnQgIHNjaGVkX2luaXRfZG9tYWluKHN0cnVjdCBkb21haW4gKmQs
IGludCBwb29saWQpOwogdm9pZCBzY2hlZF9kZXN0cm95X2RvbWFpbihzdHJ1Y3QgZG9tYWluICpk
KTsKLWludCBzY2hlZF9tb3ZlX2RvbWFpbihzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgY3B1cG9v
bCAqYyk7CiBsb25nIHNjaGVkX2FkanVzdChzdHJ1Y3QgZG9tYWluICosIHN0cnVjdCB4ZW5fZG9t
Y3RsX3NjaGVkdWxlcl9vcCAqKTsKIGxvbmcgc2NoZWRfYWRqdXN0X2dsb2JhbChzdHJ1Y3QgeGVu
X3N5c2N0bF9zY2hlZHVsZXJfb3AgKik7CiBpbnQgIHNjaGVkX2lkKHZvaWQpOwpAQCAtOTIwLDE5
ICs5MTksMTAgQEAgc3RhdGljIGlubGluZSBib29sIHNjaGVkX2hhc191cmdlbnRfdmNwdSh2b2lk
KQogICAgIHJldHVybiBhdG9taWNfcmVhZCgmdGhpc19jcHUoc2NoZWRfdXJnZW50X2NvdW50KSk7
CiB9CiAKLXN0cnVjdCBzY2hlZHVsZXI7Ci0KLXN0cnVjdCBzY2hlZHVsZXIgKnNjaGVkdWxlcl9n
ZXRfZGVmYXVsdCh2b2lkKTsKLXN0cnVjdCBzY2hlZHVsZXIgKnNjaGVkdWxlcl9hbGxvYyh1bnNp
Z25lZCBpbnQgc2NoZWRfaWQsIGludCAqcGVycik7Ci12b2lkIHNjaGVkdWxlcl9mcmVlKHN0cnVj
dCBzY2hlZHVsZXIgKnNjaGVkKTsKLWludCBzY2hlZHVsZV9jcHVfYWRkKHVuc2lnbmVkIGludCBj
cHUsIHN0cnVjdCBjcHVwb29sICpjKTsKLWludCBzY2hlZHVsZV9jcHVfcm0odW5zaWduZWQgaW50
IGNwdSk7CiB2b2lkIHZjcHVfc2V0X3BlcmlvZGljX3RpbWVyKHN0cnVjdCB2Y3B1ICp2LCBzX3Rp
bWVfdCB2YWx1ZSk7Ci1pbnQgY3B1X2Rpc2FibGVfc2NoZWR1bGVyKHVuc2lnbmVkIGludCBjcHUp
Owogdm9pZCBzY2hlZF9zZXR1cF9kb20wX3ZjcHVzKHN0cnVjdCBkb21haW4gKmQpOwogaW50IHZj
cHVfdGVtcG9yYXJ5X2FmZmluaXR5KHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBpbnQgY3B1LCB1
aW50OF90IHJlYXNvbik7CiBpbnQgdmNwdV9zZXRfaGFyZF9hZmZpbml0eShzdHJ1Y3QgdmNwdSAq
diwgY29uc3QgY3B1bWFza190ICphZmZpbml0eSk7Ci1pbnQgdmNwdV9zZXRfc29mdF9hZmZpbml0
eShzdHJ1Y3QgdmNwdSAqdiwgY29uc3QgY3B1bWFza190ICphZmZpbml0eSk7CiB2b2lkIHJlc3Rv
cmVfdmNwdV9hZmZpbml0eShzdHJ1Y3QgZG9tYWluICpkKTsKIGludCB2Y3B1X2FmZmluaXR5X2Rv
bWN0bChzdHJ1Y3QgZG9tYWluICpkLCB1aW50MzJfdCBjbWQsCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgc3RydWN0IHhlbl9kb21jdGxfdmNwdWFmZmluaXR5ICp2Y3B1YWZmKTsKQEAgLTEwNjUs
MTcgKzEwNTUsMTAgQEAgZXh0ZXJuIGVudW0gY3B1ZnJlcV9jb250cm9sbGVyIHsKICAgICBGUkVR
Q1RMX25vbmUsIEZSRVFDVExfZG9tMF9rZXJuZWwsIEZSRVFDVExfeGVuCiB9IGNwdWZyZXFfY29u
dHJvbGxlcjsKIAotI2RlZmluZSBDUFVQT09MSURfTk9ORSAgICAtMQotCi1zdHJ1Y3QgY3B1cG9v
bCAqY3B1cG9vbF9nZXRfYnlfaWQoaW50IHBvb2xpZCk7Ci12b2lkIGNwdXBvb2xfcHV0KHN0cnVj
dCBjcHVwb29sICpwb29sKTsKLWludCBjcHVwb29sX2FkZF9kb21haW4oc3RydWN0IGRvbWFpbiAq
ZCwgaW50IHBvb2xpZCk7Ci12b2lkIGNwdXBvb2xfcm1fZG9tYWluKHN0cnVjdCBkb21haW4gKmQp
OwogaW50IGNwdXBvb2xfbW92ZV9kb21haW4oc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGNwdXBv
b2wgKmMpOwogaW50IGNwdXBvb2xfZG9fc3lzY3RsKHN0cnVjdCB4ZW5fc3lzY3RsX2NwdXBvb2xf
b3AgKm9wKTsKIGludCBjcHVwb29sX2dldF9pZChjb25zdCBzdHJ1Y3QgZG9tYWluICpkKTsKIGNw
dW1hc2tfdCAqY3B1cG9vbF92YWxpZF9jcHVzKHN0cnVjdCBjcHVwb29sICpwb29sKTsKLXZvaWQg
c2NoZWR1bGVfZHVtcChzdHJ1Y3QgY3B1cG9vbCAqYyk7CiBleHRlcm4gdm9pZCBkdW1wX3J1bnEo
dW5zaWduZWQgY2hhciBrZXkpOwogCiB2b2lkIGFyY2hfZG9fcGh5c2luZm8oc3RydWN0IHhlbl9z
eXNjdGxfcGh5c2luZm8gKnBpKTsKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
