Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E0F87203
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 08:11:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvy4D-0006dv-3p; Fri, 09 Aug 2019 06:07:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yG4W=WF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hvy4C-0006dW-3r
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 06:07:56 +0000
X-Inumbo-ID: 0462a7b2-ba6c-11e9-8e86-576d79567877
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0462a7b2-ba6c-11e9-8e86-576d79567877;
 Fri, 09 Aug 2019 06:07:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CD806B07B;
 Fri,  9 Aug 2019 06:07:48 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri,  9 Aug 2019 08:07:41 +0200
Message-Id: <20190809060744.8985-3-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190809060744.8985-1-jgross@suse.com>
References: <20190809060744.8985-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v2 2/5] xen: add new CONFIG_DEBUG_LOCKS option
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

SW5zdGVhZCBvZiBlbmFibGluZyBkZWJ1Z2dpbmcgZm9yIGRlYnVnIGJ1aWxkcyBvbmx5IGFkZCBh
IGRlZGljYXRlZApLY29uZmlnIG9wdGlvbiBmb3IgdGhhdCBwdXJwb3NlIHdoaWNoIGRlZmF1bHRz
IHRvIERFQlVHLgoKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PgotLS0KVjI6Ci0gcmVuYW1lIHRvIENPTkZJR19ERUJVR19MT0NLUyAoSmFuIEJldWxpY2gpCi0t
LQogeGVuL0tjb25maWcuZGVidWcgICAgICAgICAgfCA3ICsrKysrKysKIHhlbi9jb21tb24vc3Bp
bmxvY2suYyAgICAgIHwgNCArKy0tCiB4ZW4vaW5jbHVkZS94ZW4vc3BpbmxvY2suaCB8IDIgKy0K
IDMgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS94ZW4vS2NvbmZpZy5kZWJ1ZyBiL3hlbi9LY29uZmlnLmRlYnVnCmluZGV4IGUxMGUz
MTRlMjUuLjFmYWFhM2JhNmEgMTAwNjQ0Ci0tLSBhL3hlbi9LY29uZmlnLmRlYnVnCisrKyBiL3hl
bi9LY29uZmlnLmRlYnVnCkBAIC01MSw2ICs1MSwxMyBAQCBjb25maWcgTE9DS19QUk9GSUxFCiAJ
ICBZb3UgY2FuIHVzZSBzZXJpYWwgY29uc29sZSB0byBwcmludCAoYW5kIHJlc2V0KSB1c2luZyAn
bCcgYW5kICdMJwogCSAgcmVzcGVjdGl2ZWx5LCBvciB0aGUgJ3hlbmxvY2twcm9mJyB0b29sLgog
Citjb25maWcgREVCVUdfTE9DS1MKKwlib29sICJMb2NrIGRlYnVnZ2luZyIKKwlkZWZhdWx0IERF
QlVHCisJLS0taGVscC0tLQorCSAgRW5hYmxlIGRlYnVnZ2luZyBmZWF0dXJlcyBvZiBsb2NrIGhh
bmRsaW5nLiAgU29tZSBhZGRpdGlvbmFsCisJICBjaGVja3Mgd2lsbCBiZSBwZXJmb3JtZWQgd2hl
biBhY3F1aXJpbmcgYW5kIHJlbGVhc2luZyBsb2Nrcy4KKwogY29uZmlnIFBFUkZfQ09VTlRFUlMK
IAlib29sICJQZXJmb3JtYW5jZSBDb3VudGVycyIKIAktLS1oZWxwLS0tCmRpZmYgLS1naXQgYS94
ZW4vY29tbW9uL3NwaW5sb2NrLmMgYi94ZW4vY29tbW9uL3NwaW5sb2NrLmMKaW5kZXggMWJlMWI1
ZWJlNi4uNzllNzBhOTk0NyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zcGlubG9jay5jCisrKyBi
L3hlbi9jb21tb24vc3BpbmxvY2suYwpAQCAtOSw3ICs5LDcgQEAKICNpbmNsdWRlIDxhc20vcHJv
Y2Vzc29yLmg+CiAjaW5jbHVkZSA8YXNtL2F0b21pYy5oPgogCi0jaWZuZGVmIE5ERUJVRworI2lm
ZGVmIENPTkZJR19ERUJVR19MT0NLUwogCiBzdGF0aWMgYXRvbWljX3Qgc3Bpbl9kZWJ1ZyBfX3Jl
YWRfbW9zdGx5ID0gQVRPTUlDX0lOSVQoMCk7CiAKQEAgLTk3LDcgKzk3LDcgQEAgdm9pZCBzcGlu
X2RlYnVnX2Rpc2FibGUodm9pZCkKICAgICBhdG9taWNfZGVjKCZzcGluX2RlYnVnKTsKIH0KIAot
I2Vsc2UgLyogZGVmaW5lZChOREVCVUcpICovCisjZWxzZSAvKiBDT05GSUdfREVCVUdfTE9DS1Mg
Ki8KIAogI2RlZmluZSBjaGVja19sb2NrKGwpICgodm9pZCkwKQogI2RlZmluZSBjaGVja19iYXJy
aWVyKGwpICgodm9pZCkwKQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3NwaW5sb2NrLmgg
Yi94ZW4vaW5jbHVkZS94ZW4vc3BpbmxvY2suaAppbmRleCA5N2I2MjAwYmY1Li5kZmEwYjcyZjhk
IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vc3BpbmxvY2suaAorKysgYi94ZW4vaW5jbHVk
ZS94ZW4vc3BpbmxvY2suaApAQCAtNiw3ICs2LDcgQEAKICNpbmNsdWRlIDxhc20vdHlwZXMuaD4K
ICNpbmNsdWRlIDx4ZW4vcGVyY3B1Lmg+CiAKLSNpZm5kZWYgTkRFQlVHCisjaWZkZWYgQ09ORklH
X0RFQlVHX0xPQ0tTCiB1bmlvbiBsb2NrX2RlYnVnIHsKICAgICB1aW50MTZfdCB2YWw7CiAjZGVm
aW5lIExPQ0tfREVCVUdfSU5JVFZBTCAweGZmZmYKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
