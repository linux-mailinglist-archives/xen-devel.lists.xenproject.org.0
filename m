Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE420ADB42
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 16:34:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7Khg-0001Ni-AG; Mon, 09 Sep 2019 14:31:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=m/oR=XE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i7Khe-0001NW-Sq
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 14:31:38 +0000
X-Inumbo-ID: 87735a62-d30e-11e9-ac0d-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87735a62-d30e-11e9-ac0d-12813bfff9fa;
 Mon, 09 Sep 2019 14:31:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 45CD0B65B;
 Mon,  9 Sep 2019 14:31:37 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  9 Sep 2019 16:31:31 +0200
Message-Id: <20190909143134.15379-3-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190909143134.15379-1-jgross@suse.com>
References: <20190909143134.15379-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v4 2/5] xen: add new CONFIG_DEBUG_LOCKS option
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
PgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KVjI6Ci0g
cmVuYW1lIHRvIENPTkZJR19ERUJVR19MT0NLUyAoSmFuIEJldWxpY2gpCi0tLQogeGVuL0tjb25m
aWcuZGVidWcgICAgICAgICAgfCA3ICsrKysrKysKIHhlbi9jb21tb24vc3BpbmxvY2suYyAgICAg
IHwgNCArKy0tCiB4ZW4vaW5jbHVkZS94ZW4vc3BpbmxvY2suaCB8IDIgKy0KIDMgZmlsZXMgY2hh
bmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4v
S2NvbmZpZy5kZWJ1ZyBiL3hlbi9LY29uZmlnLmRlYnVnCmluZGV4IGUxMGUzMTRlMjUuLjFmYWFh
M2JhNmEgMTAwNjQ0Ci0tLSBhL3hlbi9LY29uZmlnLmRlYnVnCisrKyBiL3hlbi9LY29uZmlnLmRl
YnVnCkBAIC01MSw2ICs1MSwxMyBAQCBjb25maWcgTE9DS19QUk9GSUxFCiAJICBZb3UgY2FuIHVz
ZSBzZXJpYWwgY29uc29sZSB0byBwcmludCAoYW5kIHJlc2V0KSB1c2luZyAnbCcgYW5kICdMJwog
CSAgcmVzcGVjdGl2ZWx5LCBvciB0aGUgJ3hlbmxvY2twcm9mJyB0b29sLgogCitjb25maWcgREVC
VUdfTE9DS1MKKwlib29sICJMb2NrIGRlYnVnZ2luZyIKKwlkZWZhdWx0IERFQlVHCisJLS0taGVs
cC0tLQorCSAgRW5hYmxlIGRlYnVnZ2luZyBmZWF0dXJlcyBvZiBsb2NrIGhhbmRsaW5nLiAgU29t
ZSBhZGRpdGlvbmFsCisJICBjaGVja3Mgd2lsbCBiZSBwZXJmb3JtZWQgd2hlbiBhY3F1aXJpbmcg
YW5kIHJlbGVhc2luZyBsb2Nrcy4KKwogY29uZmlnIFBFUkZfQ09VTlRFUlMKIAlib29sICJQZXJm
b3JtYW5jZSBDb3VudGVycyIKIAktLS1oZWxwLS0tCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3Nw
aW5sb2NrLmMgYi94ZW4vY29tbW9uL3NwaW5sb2NrLmMKaW5kZXggMWJlMWI1ZWJlNi4uNzllNzBh
OTk0NyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zcGlubG9jay5jCisrKyBiL3hlbi9jb21tb24v
c3BpbmxvY2suYwpAQCAtOSw3ICs5LDcgQEAKICNpbmNsdWRlIDxhc20vcHJvY2Vzc29yLmg+CiAj
aW5jbHVkZSA8YXNtL2F0b21pYy5oPgogCi0jaWZuZGVmIE5ERUJVRworI2lmZGVmIENPTkZJR19E
RUJVR19MT0NLUwogCiBzdGF0aWMgYXRvbWljX3Qgc3Bpbl9kZWJ1ZyBfX3JlYWRfbW9zdGx5ID0g
QVRPTUlDX0lOSVQoMCk7CiAKQEAgLTk3LDcgKzk3LDcgQEAgdm9pZCBzcGluX2RlYnVnX2Rpc2Fi
bGUodm9pZCkKICAgICBhdG9taWNfZGVjKCZzcGluX2RlYnVnKTsKIH0KIAotI2Vsc2UgLyogZGVm
aW5lZChOREVCVUcpICovCisjZWxzZSAvKiBDT05GSUdfREVCVUdfTE9DS1MgKi8KIAogI2RlZmlu
ZSBjaGVja19sb2NrKGwpICgodm9pZCkwKQogI2RlZmluZSBjaGVja19iYXJyaWVyKGwpICgodm9p
ZCkwKQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3NwaW5sb2NrLmggYi94ZW4vaW5jbHVk
ZS94ZW4vc3BpbmxvY2suaAppbmRleCAyNDQwNTM4NmE3Li42ZGE1NWU3NGEyIDEwMDY0NAotLS0g
YS94ZW4vaW5jbHVkZS94ZW4vc3BpbmxvY2suaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vc3Bpbmxv
Y2suaApAQCAtNyw3ICs3LDcgQEAKIAogI2RlZmluZSBTUElOTE9DS19DUFVfQklUUyAgMTIKIAot
I2lmbmRlZiBOREVCVUcKKyNpZmRlZiBDT05GSUdfREVCVUdfTE9DS1MKIHVuaW9uIGxvY2tfZGVi
dWcgewogICAgIHVpbnQxNl90IHZhbDsKICNkZWZpbmUgTE9DS19ERUJVR19JTklUVkFMIDB4ZmZm
ZgotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
