Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C41E1DA1
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 16:03:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNHAq-0005Jo-G7; Wed, 23 Oct 2019 13:59:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Og4R=YQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iNHAo-0005JD-NT
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 13:59:38 +0000
X-Inumbo-ID: 59accd26-f59d-11e9-a531-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59accd26-f59d-11e9-a531-bc764e2007e4;
 Wed, 23 Oct 2019 13:59:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1A147AD29;
 Wed, 23 Oct 2019 13:59:37 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 23 Oct 2019 15:59:35 +0200
Message-Id: <20191023135935.7692-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] xen/pvhsim: fix cpu onlining
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2luY2UgY29tbWl0IDhkM2MzMjZmNjc1NmQxICgieGVuOiBsZXQgdmNwdV9jcmVhdGUoKSBzZWxl
Y3QgcHJvY2Vzc29yIikKdGhlIGluaXRpYWwgcHJvY2Vzc29yIGZvciBhbGwgcHYtc2hpbSB2Y3B1
cyB3aWxsIGJlIDAsIGFzIG5vIG90aGVyIGNwdXMKYXJlIG9ubGluZSB3aGVuIHRoZSB2Y3B1cyBh
cmUgY3JlYXRlZC4gQmVmb3JlIHRoYXQgY29tbWl0IHRoZSB2Y3B1cwp3b3VsZCBoYXZlIHByb2Nl
c3NvcnMgc2V0IG5vdCBiZWluZyBvbmxpbmUgeWV0LCB3aGljaCB3b3JrZWQganVzdCBieQpjaGFu
Y2UuCgpXaGVuIHRoZSBwdi1zaGltIHZjcHUgYmVjb21lcyBhY3RpdmUgaXQgd2lsbCBoYXZlIGEg
aGFyZCBhZmZpbml0eQpub3QgbWF0Y2hpbmcgaXRzIGluaXRpYWwgcHJvY2Vzc29yIGFzc2lnbm1l
bnQgbGVhZGluZyB0byBmYWlsaW5nCkFTU0VSVCgpcyBvciBvdGhlciBwcm9ibGVtcyBkZXBlbmRp
bmcgb24gdGhlIHNlbGVjdGVkIHNjaGVkdWxlci4KCkZpeCB0aGF0IGJ5IGRvaW5nIHRoZSBhZmZp
bml0eSBzZXR0aW5nIGFmdGVyIG9ubGluaW5nIHRoZSBjcHUgYnV0CmJlZm9yZSB0YWtpbmcgdGhl
IHZjcHUgdXAuIEZvciB2Y3B1IDAgdGhpcyBpcyBzdGlsbCBpbgpzY2hlZF9zZXR1cF9kb20wX3Zj
cHVzKCksIGZvciB0aGUgb3RoZXIgdmNwdXMgc2V0dGluZyB0aGUgYWZmaW5pdHkKdGhlcmUgY2Fu
IGJlIGRyb3BwZWQuCgpGaXhlczogOGQzYzMyNmY2NzU2ZDEgKCJ4ZW46IGxldCB2Y3B1X2NyZWF0
ZSgpIHNlbGVjdCBwcm9jZXNzb3IiKQpSZXBvcnRlZC1ieTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5
LmR5YXNsaUBjaXRyaXguY29tPgpUZXN0ZWQtYnk6IFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFz
bGlAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpSZWxl
YXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+ClNpZ25lZC1vZmYt
Ynk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvcHYv
c2hpbS5jIHwgIDIgKysKIHhlbi9jb21tb24vc2NoZWR1bGUuYyAgfCAxNiArKysrKysrKysrLS0t
LS0tCiAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3B2L3NoaW0uYyBiL3hlbi9hcmNoL3g4Ni9wdi9zaGlt
LmMKaW5kZXggNWVkYmNkOWFjNS4uNDMyOWVhYWVmZSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2
L3B2L3NoaW0uYworKysgYi94ZW4vYXJjaC94ODYvcHYvc2hpbS5jCkBAIC04MzcsNiArODM3LDgg
QEAgbG9uZyBwdl9zaGltX2NwdV91cCh2b2lkICpkYXRhKQogICAgICAgICAgICAgICAgICAgICB2
LT52Y3B1X2lkLCByYyk7CiAgICAgICAgICAgICByZXR1cm4gcmM7CiAgICAgICAgIH0KKworICAg
ICAgICB2Y3B1X3NldF9oYXJkX2FmZmluaXR5KHYsIGNwdW1hc2tfb2Yodi0+dmNwdV9pZCkpOwog
ICAgIH0KIAogICAgIHdha2UgPSB0ZXN0X2FuZF9jbGVhcl9iaXQoX1ZQRl9kb3duLCAmdi0+cGF1
c2VfZmxhZ3MpOwpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jIGIveGVuL2NvbW1v
bi9zY2hlZHVsZS5jCmluZGV4IGMzMjdjNDBiOTIuLmU3MGNjNzBhNjUgMTAwNjQ0Ci0tLSBhL3hl
bi9jb21tb24vc2NoZWR1bGUuYworKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKQEAgLTMxMDIs
MTMgKzMxMDIsMTcgQEAgdm9pZCBfX2luaXQgc2NoZWRfc2V0dXBfZG9tMF92Y3B1cyhzdHJ1Y3Qg
ZG9tYWluICpkKQogICAgIGZvciAoIGkgPSAxOyBpIDwgZC0+bWF4X3ZjcHVzOyBpKysgKQogICAg
ICAgICB2Y3B1X2NyZWF0ZShkLCBpKTsKIAotICAgIGZvcl9lYWNoX3NjaGVkX3VuaXQgKCBkLCB1
bml0ICkKKyAgICAvKgorICAgICAqIFBWLXNoaW06IHZjcHVzIGFyZSBwaW5uZWQgMToxLgorICAg
ICAqIEluaXRpYWxseSBvbmx5IDEgY3B1IGlzIG9ubGluZSwgb3RoZXJzIHdpbGwgYmUgZGVhbHQg
d2l0aCB3aGVuCisgICAgICogb25saW5pbmcgdGhlbS4gVGhpcyBhdm9pZHMgcGlubmluZyBhIHZj
cHUgdG8gYSBub3QgeWV0IG9ubGluZSBjcHUgaGVyZS4KKyAgICAgKi8KKyAgICBpZiAoIHB2X3No
aW0gKQorICAgICAgICBzY2hlZF9zZXRfYWZmaW5pdHkoZC0+dmNwdVswXS0+c2NoZWRfdW5pdCwK
KyAgICAgICAgICAgICAgICAgICAgICAgICAgIGNwdW1hc2tfb2YoMCksIGNwdW1hc2tfb2YoMCkp
OworICAgIGVsc2UKICAgICB7Ci0gICAgICAgIHVuc2lnbmVkIGludCBpZCA9IHVuaXQtPnVuaXRf
aWQ7Ci0KLSAgICAgICAgaWYgKCBwdl9zaGltICkKLSAgICAgICAgICAgIHNjaGVkX3NldF9hZmZp
bml0eSh1bml0LCBjcHVtYXNrX29mKGlkKSwgY3B1bWFza19vZihpZCkpOwotICAgICAgICBlbHNl
CisgICAgICAgIGZvcl9lYWNoX3NjaGVkX3VuaXQgKCBkLCB1bml0ICkKICAgICAgICAgewogICAg
ICAgICAgICAgaWYgKCAhb3B0X2RvbTBfdmNwdXNfcGluICYmICFkb20wX2FmZmluaXR5X3JlbGF4
ZWQgKQogICAgICAgICAgICAgICAgIHNjaGVkX3NldF9hZmZpbml0eSh1bml0LCAmZG9tMF9jcHVz
LCBOVUxMKTsKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
