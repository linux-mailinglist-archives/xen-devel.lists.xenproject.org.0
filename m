Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBE2976AC
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 12:08:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0NUc-0006IR-Cc; Wed, 21 Aug 2019 10:05:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BiIg=WR=amazon.de=prvs=129f3311c=wipawel@srs-us1.protection.inumbo.net>)
 id 1i0NUa-0006IH-QM
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 10:05:24 +0000
X-Inumbo-ID: 30d8ce28-c3fb-11e9-b95f-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30d8ce28-c3fb-11e9-b95f-bc764e2007e4;
 Wed, 21 Aug 2019 10:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566381923; x=1597917923;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=OdZUO+fIc8xzShugSxDSF405yhlTcqgXBGSxVdmKRdY=;
 b=nIWUxo7FfhWItD9cb0udnpaOnKV6TVpowJQF4vt1m+zX2tTqqUDjeK92
 gNuVw4o9t2T8pa/HCE2omCkDR7m0hWaeFixi3qVxT75p47zjFFeUMUH7T
 Ig28S+STCpnV0bBidMLXvdWgGD4Sb+4DZNY+X0/QZS7TIfHZA/RBvujvP 0=;
X-IronPort-AV: E=Sophos;i="5.64,412,1559520000"; d="scan'208";a="416616698"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-8549039f.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 21 Aug 2019 10:05:21 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-8549039f.us-west-2.amazon.com (Postfix) with ESMTPS
 id 26590A0605; Wed, 21 Aug 2019 10:05:21 +0000 (UTC)
Received: from EX13D05EUB001.ant.amazon.com (10.43.166.87) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 10:05:20 +0000
Received: from EX13MTAUEB001.ant.amazon.com (10.43.60.96) by
 EX13D05EUB001.ant.amazon.com (10.43.166.87) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 10:05:19 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.60.129) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 21 Aug 2019 10:05:18 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>, <xen-devel@lists.xenproject.org>
Date: Wed, 21 Aug 2019 10:04:30 +0000
Message-ID: <20190821100430.89909-1-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH] livepatch: always print XENLOG_ERR information
 (ARM, ELF)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: wipawel@amazon.com, Stefano Stabellini <sstabellini@kernel.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Pawel Wieczorkiewicz <wipawel@amazon.de>, Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBjb21wbGVtZW50cyBbMV0gY29tbWl0IGZvciBBUk0gYW5kIGxpdmVwYXRjaF9lbGYgZmls
ZXMuCgpbMV0gNDQ3MGVmZWFlNCBsaXZlcGF0Y2g6IGFsd2F5cyBwcmludCBYRU5MT0dfRVJSIGlu
Zm9ybWF0aW9uCgpTaWduZWQtb2ZmLWJ5OiBQYXdlbCBXaWVjem9ya2lld2ljeiA8d2lwYXdlbEBh
bWF6b24uZGU+Ci0tLQogeGVuL2FyY2gvYXJtL2FybTMyL2xpdmVwYXRjaC5jIHwgIDI4ICsrKysr
LS0tLS0tCiB4ZW4vYXJjaC9hcm0vYXJtNjQvbGl2ZXBhdGNoLmMgfCAgMjggKysrKystLS0tLS0K
IHhlbi9jb21tb24vbGl2ZXBhdGNoX2VsZi5jICAgICB8IDEwNCArKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCA4MCBpbnNlcnRpb25zKCsp
LCA4MCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtMzIvbGl2ZXBh
dGNoLmMgYi94ZW4vYXJjaC9hcm0vYXJtMzIvbGl2ZXBhdGNoLmMKaW5kZXggNDEzNzhhNTRhZS4u
NWEwNjQ2NzAwOCAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2FybTMyL2xpdmVwYXRjaC5jCisr
KyBiL3hlbi9hcmNoL2FybS9hcm0zMi9saXZlcGF0Y2guYwpAQCAtODQsMTUgKzg0LDE1IEBAIGlu
dCBhcmNoX2xpdmVwYXRjaF92ZXJpZnlfZWxmKGNvbnN0IHN0cnVjdCBsaXZlcGF0Y2hfZWxmICpl
bGYpCiAgICAgaWYgKCBoZHItPmVfbWFjaGluZSAhPSBFTV9BUk0gfHwKICAgICAgICAgIGhkci0+
ZV9pZGVudFtFSV9DTEFTU10gIT0gRUxGQ0xBU1MzMiApCiAgICAgewotICAgICAgICBkcHJpbnRr
KFhFTkxPR19FUlIsIExJVkVQQVRDSCAiJXM6IFVuc3VwcG9ydGVkIEVMRiBNYWNoaW5lIHR5cGUh
XG4iLAotICAgICAgICAgICAgICAgIGVsZi0+bmFtZSk7CisgICAgICAgIHByaW50ayhYRU5MT0df
RVJSIExJVkVQQVRDSCAiJXM6IFVuc3VwcG9ydGVkIEVMRiBNYWNoaW5lIHR5cGVcbiIsCisgICAg
ICAgICAgICAgICBlbGYtPm5hbWUpOwogICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7CiAgICAg
fQogCiAgICAgaWYgKCAoaGRyLT5lX2ZsYWdzICYgRUZfQVJNX0VBQklfTUFTSykgIT0gRUZfQVJN
X0VBQklfVkVSNSApCiAgICAgewotICAgICAgICBkcHJpbnRrKFhFTkxPR19FUlIsIExJVkVQQVRD
SCAiJXM6IFVuc3VwcG9ydGVkIEVMRiBFQUJJKCV4KSFcbiIsCi0gICAgICAgICAgICAgICAgZWxm
LT5uYW1lLCBoZHItPmVfZmxhZ3MpOworICAgICAgICBwcmludGsoWEVOTE9HX0VSUiBMSVZFUEFU
Q0ggIiVzOiBVbnN1cHBvcnRlZCBFTEYgRUFCSSgleClcbiIsCisgICAgICAgICAgICAgICBlbGYt
Pm5hbWUsIGhkci0+ZV9mbGFncyk7CiAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKICAgICB9
CiAKQEAgLTI1NiwyMCArMjU2LDIwIEBAIGludCBhcmNoX2xpdmVwYXRjaF9wZXJmb3JtKHN0cnVj
dCBsaXZlcGF0Y2hfZWxmICplbGYsCiAKICAgICAgICAgaWYgKCBzeW1uZHggPT0gU1ROX1VOREVG
ICkKICAgICAgICAgewotICAgICAgICAgICAgZHByaW50ayhYRU5MT0dfRVJSLCBMSVZFUEFUQ0gg
IiVzOiBFbmNvdW50ZXJlZCBTVE5fVU5ERUZcbiIsCi0gICAgICAgICAgICAgICAgICAgIGVsZi0+
bmFtZSk7CisgICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUiBMSVZFUEFUQ0ggIiVzOiBFbmNv
dW50ZXJlZCBTVE5fVU5ERUZcbiIsCisgICAgICAgICAgICAgICAgICAgZWxmLT5uYW1lKTsKICAg
ICAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKICAgICAgICAgfQogICAgICAgICBlbHNlIGlm
ICggc3ltbmR4ID49IGVsZi0+bnN5bSApCiAgICAgICAgIHsKLSAgICAgICAgICAgIGRwcmludGso
WEVOTE9HX0VSUiwgTElWRVBBVENIICIlczogUmVsYXRpdmUgc3ltYm9sIHdhbnRzIHN5bWJvbEAl
dSB3aGljaCBpcyBwYXN0IGVuZCFcbiIsCi0gICAgICAgICAgICAgICAgICAgIGVsZi0+bmFtZSwg
c3ltbmR4KTsKKyAgICAgICAgICAgIHByaW50ayhYRU5MT0dfRVJSIExJVkVQQVRDSCAiJXM6IFJl
bGF0aXZlIHN5bWJvbCB3YW50cyBzeW1ib2xAJXUgd2hpY2ggaXMgcGFzdCBlbmRcbiIsCisgICAg
ICAgICAgICAgICAgICAgZWxmLT5uYW1lLCBzeW1uZHgpOwogICAgICAgICAgICAgcmV0dXJuIC1F
SU5WQUw7CiAgICAgICAgIH0KICAgICAgICAgZWxzZSBpZiAoICFlbGYtPnN5bVtzeW1uZHhdLnN5
bSApCiAgICAgICAgIHsKLSAgICAgICAgICAgIGRwcmludGsoWEVOTE9HX0VSUiwgTElWRVBBVENI
ICIlczogTm8gcmVsYXRpdmUgc3ltYm9sQCV1XG4iLAotICAgICAgICAgICAgICAgICAgICBlbGYt
Pm5hbWUsIHN5bW5keCk7CisgICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUiBMSVZFUEFUQ0gg
IiVzOiBObyByZWxhdGl2ZSBzeW1ib2xAJXVcbiIsCisgICAgICAgICAgICAgICAgICAgZWxmLT5u
YW1lLCBzeW1uZHgpOwogICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CiAgICAgICAgIH0KIApA
QCAtMjc5LDEzICsyNzksMTMgQEAgaW50IGFyY2hfbGl2ZXBhdGNoX3BlcmZvcm0oc3RydWN0IGxp
dmVwYXRjaF9lbGYgKmVsZiwKICAgICAgICAgc3dpdGNoICggcmMgKQogICAgICAgICB7CiAgICAg
ICAgIGNhc2UgLUVPVkVSRkxPVzoKLSAgICAgICAgICAgIGRwcmludGsoWEVOTE9HX0VSUiwgTElW
RVBBVENIICIlczogT3ZlcmZsb3cgaW4gcmVsb2NhdGlvbiAldSBpbiAlcyBmb3IgJXMhXG4iLAot
ICAgICAgICAgICAgICAgICAgICBlbGYtPm5hbWUsIGksIHJlbGEtPm5hbWUsIGJhc2UtPm5hbWUp
OworICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgTElWRVBBVENIICIlczogT3ZlcmZsb3cg
aW4gcmVsb2NhdGlvbiAldSBpbiAlcyBmb3IgJXNcbiIsCisgICAgICAgICAgICAgICAgICAgZWxm
LT5uYW1lLCBpLCByZWxhLT5uYW1lLCBiYXNlLT5uYW1lKTsKICAgICAgICAgICAgIGJyZWFrOwog
CiAgICAgICAgIGNhc2UgLUVPUE5PVFNVUFA6Ci0gICAgICAgICAgICBkcHJpbnRrKFhFTkxPR19F
UlIsIExJVkVQQVRDSCAiJXM6IFVuaGFuZGxlZCByZWxvY2F0aW9uICMleFxuIiwKLSAgICAgICAg
ICAgICAgICAgICAgZWxmLT5uYW1lLCB0eXBlKTsKKyAgICAgICAgICAgIHByaW50ayhYRU5MT0df
RVJSIExJVkVQQVRDSCAiJXM6IFVuaGFuZGxlZCByZWxvY2F0aW9uICMleFxuIiwKKyAgICAgICAg
ICAgICAgICAgICBlbGYtPm5hbWUsIHR5cGUpOwogICAgICAgICAgICAgYnJlYWs7CiAgICAgICAg
IH0KIApkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2xpdmVwYXRjaC5jIGIveGVuL2Fy
Y2gvYXJtL2FybTY0L2xpdmVwYXRjaC5jCmluZGV4IDVjNzU3NzkyODQuLjZlYzhkYzYwZjAgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9saXZlcGF0Y2guYworKysgYi94ZW4vYXJjaC9h
cm0vYXJtNjQvbGl2ZXBhdGNoLmMKQEAgLTcxLDggKzcxLDggQEAgaW50IGFyY2hfbGl2ZXBhdGNo
X3ZlcmlmeV9lbGYoY29uc3Qgc3RydWN0IGxpdmVwYXRjaF9lbGYgKmVsZikKICAgICBpZiAoIGhk
ci0+ZV9tYWNoaW5lICE9IEVNX0FBUkNINjQgfHwKICAgICAgICAgIGhkci0+ZV9pZGVudFtFSV9D
TEFTU10gIT0gRUxGQ0xBU1M2NCApCiAgICAgewotICAgICAgICBkcHJpbnRrKFhFTkxPR19FUlIs
IExJVkVQQVRDSCAiJXM6IFVuc3VwcG9ydGVkIEVMRiBNYWNoaW5lIHR5cGUhXG4iLAotICAgICAg
ICAgICAgICAgIGVsZi0+bmFtZSk7CisgICAgICAgIHByaW50ayhYRU5MT0dfRVJSIExJVkVQQVRD
SCAiJXM6IFVuc3VwcG9ydGVkIEVMRiBNYWNoaW5lIHR5cGVcbiIsCisgICAgICAgICAgICAgICBl
bGYtPm5hbWUpOwogICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7CiAgICAgfQogCkBAIC0yNTQs
MjAgKzI1NCwyMCBAQCBpbnQgYXJjaF9saXZlcGF0Y2hfcGVyZm9ybV9yZWxhKHN0cnVjdCBsaXZl
cGF0Y2hfZWxmICplbGYsCiAKICAgICAgICAgaWYgKCBzeW1uZHggPT0gU1ROX1VOREVGICkKICAg
ICAgICAgewotICAgICAgICAgICAgZHByaW50ayhYRU5MT0dfRVJSLCBMSVZFUEFUQ0ggIiVzOiBF
bmNvdW50ZXJlZCBTVE5fVU5ERUZcbiIsCi0gICAgICAgICAgICAgICAgICAgIGVsZi0+bmFtZSk7
CisgICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUiBMSVZFUEFUQ0ggIiVzOiBFbmNvdW50ZXJl
ZCBTVE5fVU5ERUZcbiIsCisgICAgICAgICAgICAgICAgICAgZWxmLT5uYW1lKTsKICAgICAgICAg
ICAgIHJldHVybiAtRU9QTk9UU1VQUDsKICAgICAgICAgfQogICAgICAgICBlbHNlIGlmICggc3lt
bmR4ID49IGVsZi0+bnN5bSApCiAgICAgICAgIHsKLSAgICAgICAgICAgIGRwcmludGsoWEVOTE9H
X0VSUiwgTElWRVBBVENIICIlczogUmVsYXRpdmUgcmVsb2NhdGlvbiB3YW50cyBzeW1ib2xAJXUg
d2hpY2ggaXMgcGFzdCBlbmQhXG4iLAotICAgICAgICAgICAgICAgICAgICBlbGYtPm5hbWUsIHN5
bW5keCk7CisgICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUiBMSVZFUEFUQ0ggIiVzOiBSZWxh
dGl2ZSByZWxvY2F0aW9uIHdhbnRzIHN5bWJvbEAldSB3aGljaCBpcyBwYXN0IGVuZFxuIiwKKyAg
ICAgICAgICAgICAgICAgICBlbGYtPm5hbWUsIHN5bW5keCk7CiAgICAgICAgICAgICByZXR1cm4g
LUVJTlZBTDsKICAgICAgICAgfQogICAgICAgICBlbHNlIGlmICggIWVsZi0+c3ltW3N5bW5keF0u
c3ltICkKICAgICAgICAgewotICAgICAgICAgICAgZHByaW50ayhYRU5MT0dfRVJSLCBMSVZFUEFU
Q0ggIiVzOiBObyByZWxhdGl2ZSBzeW1ib2xAJXVcbiIsCi0gICAgICAgICAgICAgICAgICAgIGVs
Zi0+bmFtZSwgc3ltbmR4KTsKKyAgICAgICAgICAgIHByaW50ayhYRU5MT0dfRVJSIExJVkVQQVRD
SCAiJXM6IE5vIHJlbGF0aXZlIHN5bWJvbEAldVxuIiwKKyAgICAgICAgICAgICAgICAgICBlbGYt
Pm5hbWUsIHN5bW5keCk7CiAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKICAgICAgICAgfQog
CkBAIC00NjUsMjMgKzQ2NSwyMyBAQCBpbnQgYXJjaF9saXZlcGF0Y2hfcGVyZm9ybV9yZWxhKHN0
cnVjdCBsaXZlcGF0Y2hfZWxmICplbGYsCiAgICAgICAgICAgICBicmVhazsKIAogICAgICAgICBk
ZWZhdWx0OgotICAgICAgICAgICAgZHByaW50ayhYRU5MT0dfRVJSLCBMSVZFUEFUQ0ggIiVzOiBV
bmhhbmRsZWQgcmVsb2NhdGlvbiAlbHVcbiIsCi0gICAgICAgICAgICAgICAgICAgIGVsZi0+bmFt
ZSwgRUxGNjRfUl9UWVBFKHItPnJfaW5mbykpOworICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19F
UlIgTElWRVBBVENIICIlczogVW5oYW5kbGVkIHJlbG9jYXRpb24gJWx1XG4iLAorICAgICAgICAg
ICAgICAgICAgIGVsZi0+bmFtZSwgRUxGNjRfUl9UWVBFKHItPnJfaW5mbykpOwogICAgICAgICAg
ICAgcmV0dXJuIC1FT1BOT1RTVVBQOwogICAgICAgICB9CiAKICAgICAgICAgaWYgKCBvdmVyZmxv
d19jaGVjayAmJiBvdmYgPT0gLUVPVkVSRkxPVyApCiAgICAgICAgIHsKLSAgICAgICAgICAgIGRw
cmludGsoWEVOTE9HX0VSUiwgTElWRVBBVENIICIlczogT3ZlcmZsb3cgaW4gcmVsb2NhdGlvbiAl
dSBpbiAlcyBmb3IgJXMhXG4iLAotICAgICAgICAgICAgICAgICAgICBlbGYtPm5hbWUsIGksIHJl
bGEtPm5hbWUsIGJhc2UtPm5hbWUpOworICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgTElW
RVBBVENIICIlczogT3ZlcmZsb3cgaW4gcmVsb2NhdGlvbiAldSBpbiAlcyBmb3IgJXNcbiIsCisg
ICAgICAgICAgICAgICAgICAgZWxmLT5uYW1lLCBpLCByZWxhLT5uYW1lLCBiYXNlLT5uYW1lKTsK
ICAgICAgICAgICAgIHJldHVybiBvdmY7CiAgICAgICAgIH0KICAgICB9CiAgICAgcmV0dXJuIDA7
CiAKICBiYWRfb2Zmc2V0OgotICAgIGRwcmludGsoWEVOTE9HX0VSUiwgTElWRVBBVENIICIlczog
UmVsYXRpdmUgcmVsb2NhdGlvbiBvZmZzZXQgaXMgcGFzdCAlcyBzZWN0aW9uIVxuIiwKLSAgICAg
ICAgICAgIGVsZi0+bmFtZSwgYmFzZS0+bmFtZSk7CisgICAgcHJpbnRrKFhFTkxPR19FUlIgTElW
RVBBVENIICIlczogUmVsYXRpdmUgcmVsb2NhdGlvbiBvZmZzZXQgaXMgcGFzdCAlcyBzZWN0aW9u
XG4iLAorICAgICAgICAgICBlbGYtPm5hbWUsIGJhc2UtPm5hbWUpOwogICAgIHJldHVybiAtRUlO
VkFMOwogfQogCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2xpdmVwYXRjaF9lbGYuYyBiL3hlbi9j
b21tb24vbGl2ZXBhdGNoX2VsZi5jCmluZGV4IGRkOGI0N2ExZmEuLjE4Yjk2ODRhZWIgMTAwNjQ0
Ci0tLSBhL3hlbi9jb21tb24vbGl2ZXBhdGNoX2VsZi5jCisrKyBiL3hlbi9jb21tb24vbGl2ZXBh
dGNoX2VsZi5jCkBAIC01NSw3ICs1NSw3IEBAIHN0YXRpYyBpbnQgZWxmX3Jlc29sdmVfc2VjdGlv
bnMoc3RydWN0IGxpdmVwYXRjaF9lbGYgKmVsZiwgY29uc3Qgdm9pZCAqZGF0YSkKICAgICBzZWMg
PSB4emFsbG9jX2FycmF5KHN0cnVjdCBsaXZlcGF0Y2hfZWxmX3NlYywgZWxmLT5oZHItPmVfc2hu
dW0pOwogICAgIGlmICggIXNlYyApCiAgICAgewotICAgICAgICBkcHJpbnRrKFhFTkxPR19FUlIs
IExJVkVQQVRDSCIlczogQ291bGQgbm90IGFsbG9jYXRlIG1lbW9yeSBmb3Igc2VjdGlvbiB0YWJs
ZSFcbiIsCisgICAgICAgIHByaW50ayhYRU5MT0dfRVJSIExJVkVQQVRDSCIlczogQ291bGQgbm90
IGFsbG9jYXRlIG1lbW9yeSBmb3Igc2VjdGlvbiB0YWJsZVxuIiwKICAgICAgICAgICAgICAgIGVs
Zi0+bmFtZSk7CiAgICAgICAgIHJldHVybiAtRU5PTUVNOwogICAgIH0KQEAgLTgxLDIyICs4MSwy
MiBAQCBzdGF0aWMgaW50IGVsZl9yZXNvbHZlX3NlY3Rpb25zKHN0cnVjdCBsaXZlcGF0Y2hfZWxm
ICplbGYsIGNvbnN0IHZvaWQgKmRhdGEpCiAgICAgICAgICAgICAgKHNlY1tpXS5zZWMtPnNoX3R5
cGUgIT0gU0hUX05PQklUUyAmJiAvKiBTa2lwIFNIVF9OT0JJVFMgKi8KICAgICAgICAgICAgICAg
KGRlbHRhID4gZWxmLT5sZW4gfHwgKGRlbHRhICsgc2VjW2ldLnNlYy0+c2hfc2l6ZSA+IGVsZi0+
bGVuKSkpICkKICAgICAgICAgewotICAgICAgICAgICAgZHByaW50ayhYRU5MT0dfRVJSLCBMSVZF
UEFUQ0ggIiVzOiBTZWN0aW9uIFsldV0gZGF0YSAlcyBvZiBwYXlsb2FkIVxuIiwKLSAgICAgICAg
ICAgICAgICAgICAgZWxmLT5uYW1lLCBpLAorICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIg
TElWRVBBVENIICIlczogU2VjdGlvbiBbJXVdIGRhdGEgJXMgb2YgcGF5bG9hZFxuIiwKKyAgICAg
ICAgICAgICAgICAgICBlbGYtPm5hbWUsIGksCiAgICAgICAgICAgICAgICAgICAgIGRlbHRhIDwg
c2l6ZW9mKEVsZl9FaGRyKSA/ICJhdCBFTEYgaGVhZGVyIiA6ICJpcyBwYXN0IGVuZCIpOwogICAg
ICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CiAgICAgICAgIH0KICAgICAgICAgZWxzZSBpZiAoIHNl
Y1tpXS5zZWMtPnNoX2FkZHJhbGlnbiAmIChzZWNbaV0uc2VjLT5zaF9hZGRyYWxpZ24gLSAxKSAp
CiAgICAgICAgIHsKLSAgICAgICAgICAgIGRwcmludGsoWEVOTE9HX0VSUiwgTElWRVBBVENIICIl
czogU2VjdGlvbiBbJXVdIGFsaWdubWVudCAoJSMiUFJJeEVsZkFkZHIiKSBpcyBub3Qgc3VwcG9y
dGVkXG4iLAotICAgICAgICAgICAgICAgICAgICBlbGYtPm5hbWUsIGksIHNlY1tpXS5zZWMtPnNo
X2FkZHJhbGlnbik7CisgICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUiBMSVZFUEFUQ0ggIiVz
OiBTZWN0aW9uIFsldV0gYWxpZ25tZW50ICglIyJQUkl4RWxmQWRkciIpIGlzIG5vdCBzdXBwb3J0
ZWRcbiIsCisgICAgICAgICAgICAgICAgICAgZWxmLT5uYW1lLCBpLCBzZWNbaV0uc2VjLT5zaF9h
ZGRyYWxpZ24pOwogICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwogICAgICAgICB9CiAg
ICAgICAgIGVsc2UgaWYgKCBzZWNbaV0uc2VjLT5zaF9hZGRyYWxpZ24gJiYKICAgICAgICAgICAg
ICAgICAgIHNlY1tpXS5zZWMtPnNoX2FkZHIgJSBzZWNbaV0uc2VjLT5zaF9hZGRyYWxpZ24gKQog
ICAgICAgICB7Ci0gICAgICAgICAgICBkcHJpbnRrKFhFTkxPR19FUlIsIExJVkVQQVRDSCAiJXM6
IFNlY3Rpb24gWyV1XSBhZGRyICglIyJQUkl4RWxmQWRkciIpIGlzIG5vdCBhbGlnbmVkIHByb3Bl
cmx5ICglIyJQUkl4RWxmQWRkciIpXG4iLAotICAgICAgICAgICAgICAgICAgICBlbGYtPm5hbWUs
IGksIHNlY1tpXS5zZWMtPnNoX2FkZHIsIHNlY1tpXS5zZWMtPnNoX2FkZHJhbGlnbik7CisgICAg
ICAgICAgICBwcmludGsoWEVOTE9HX0VSUiBMSVZFUEFUQ0ggIiVzOiBTZWN0aW9uIFsldV0gYWRk
ciAoJSMiUFJJeEVsZkFkZHIiKSBpcyBub3QgYWxpZ25lZCBwcm9wZXJseSAoJSMiUFJJeEVsZkFk
ZHIiKVxuIiwKKyAgICAgICAgICAgICAgICAgICBlbGYtPm5hbWUsIGksIHNlY1tpXS5zZWMtPnNo
X2FkZHIsIHNlY1tpXS5zZWMtPnNoX2FkZHJhbGlnbik7CiAgICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsKICAgICAgICAgfQogICAgICAgICBlbHNlIGlmICggKHNlY1tpXS5zZWMtPnNoX2ZsYWdz
ICYgKFNIRl9XUklURSB8IFNIRl9BTExPQykpICYmCkBAIC0xMTIsOCArMTEyLDggQEAgc3RhdGlj
IGludCBlbGZfcmVzb2x2ZV9zZWN0aW9ucyhzdHJ1Y3QgbGl2ZXBhdGNoX2VsZiAqZWxmLCBjb25z
dCB2b2lkICpkYXRhKQogICAgICAgICB7CiAgICAgICAgICAgICBpZiAoIGVsZi0+c3ltdGFiICkK
ICAgICAgICAgICAgIHsKLSAgICAgICAgICAgICAgICBkcHJpbnRrKFhFTkxPR19FUlIsIExJVkVQ
QVRDSCAiJXM6IFVuc3VwcG9ydGVkIG11bHRpcGxlIHN5bWJvbCB0YWJsZXMhXG4iLAotICAgICAg
ICAgICAgICAgICAgICAgICAgZWxmLT5uYW1lKTsKKyAgICAgICAgICAgICAgICBwcmludGsoWEVO
TE9HX0VSUiBMSVZFUEFUQ0ggIiVzOiBVbnN1cHBvcnRlZCBtdWx0aXBsZSBzeW1ib2wgdGFibGVz
XG4iLAorICAgICAgICAgICAgICAgICAgICAgICBlbGYtPm5hbWUpOwogICAgICAgICAgICAgICAg
IHJldHVybiAtRU9QTk9UU1VQUDsKICAgICAgICAgICAgIH0KIApAQCAtMTI2LDEwICsxMjYsMTAg
QEAgc3RhdGljIGludCBlbGZfcmVzb2x2ZV9zZWN0aW9ucyhzdHJ1Y3QgbGl2ZXBhdGNoX2VsZiAq
ZWxmLCBjb25zdCB2b2lkICpkYXRhKQogICAgICAgICAgICAgICovCiAgICAgICAgICAgICBpZiAo
IGVsZi0+c3ltdGFiLT5zZWMtPnNoX2xpbmsgPj0gZWxmLT5oZHItPmVfc2hudW0gKQogICAgICAg
ICAgICAgewotICAgICAgICAgICAgICAgIGRwcmludGsoWEVOTE9HX0VSUiwgTElWRVBBVENICi0g
ICAgICAgICAgICAgICAgICAgICAgICAiJXM6IFN5bWJvbCB0YWJsZSBpZHggKCV1KSB0byBzdHJ0
YWIgcGFzdCBlbmQgKCV1KVxuIiwKLSAgICAgICAgICAgICAgICAgICAgICAgIGVsZi0+bmFtZSwg
ZWxmLT5zeW10YWItPnNlYy0+c2hfbGluaywKLSAgICAgICAgICAgICAgICAgICAgICAgIGVsZi0+
aGRyLT5lX3NobnVtKTsKKyAgICAgICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUiBMSVZFUEFU
Q0gKKyAgICAgICAgICAgICAgICAgICAgICAgIiVzOiBTeW1ib2wgdGFibGUgaWR4ICgldSkgdG8g
c3RydGFiIHBhc3QgZW5kICgldSlcbiIsCisgICAgICAgICAgICAgICAgICAgICAgIGVsZi0+bmFt
ZSwgZWxmLT5zeW10YWItPnNlYy0+c2hfbGluaywKKyAgICAgICAgICAgICAgICAgICAgICAgZWxm
LT5oZHItPmVfc2hudW0pOwogICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwogICAgICAg
ICAgICAgfQogICAgICAgICB9CkBAIC0xMzcsOCArMTM3LDggQEAgc3RhdGljIGludCBlbGZfcmVz
b2x2ZV9zZWN0aW9ucyhzdHJ1Y3QgbGl2ZXBhdGNoX2VsZiAqZWxmLCBjb25zdCB2b2lkICpkYXRh
KQogCiAgICAgaWYgKCAhZWxmLT5zeW10YWIgKQogICAgIHsKLSAgICAgICAgZHByaW50ayhYRU5M
T0dfRVJSLCBMSVZFUEFUQ0ggIiVzOiBObyBzeW1ib2wgdGFibGUgZm91bmQhXG4iLAotICAgICAg
ICAgICAgICAgIGVsZi0+bmFtZSk7CisgICAgICAgIHByaW50ayhYRU5MT0dfRVJSIExJVkVQQVRD
SCAiJXM6IE5vIHN5bWJvbCB0YWJsZSBmb3VuZFxuIiwKKyAgICAgICAgICAgICAgIGVsZi0+bmFt
ZSk7CiAgICAgICAgIHJldHVybiAtRUlOVkFMOwogICAgIH0KIApAQCAtMTQ2LDggKzE0Niw4IEBA
IHN0YXRpYyBpbnQgZWxmX3Jlc29sdmVfc2VjdGlvbnMoc3RydWN0IGxpdmVwYXRjaF9lbGYgKmVs
ZiwgY29uc3Qgdm9pZCAqZGF0YSkKICAgICAgICAgIGVsZi0+c3ltdGFiLT5zZWMtPnNoX2VudHNp
emUgPCBzaXplb2YoRWxmX1N5bSkgfHwKICAgICAgICAgIGVsZi0+c3ltdGFiLT5zZWMtPnNoX3Np
emUgJSBlbGYtPnN5bXRhYi0+c2VjLT5zaF9lbnRzaXplICkKICAgICB7Ci0gICAgICAgIGRwcmlu
dGsoWEVOTE9HX0VSUiwgTElWRVBBVENIICIlczogU3ltYm9sIHRhYmxlIGhlYWRlciBpcyBjb3Jy
dXB0ZWQhXG4iLAotICAgICAgICAgICAgICAgIGVsZi0+bmFtZSk7CisgICAgICAgIHByaW50ayhY
RU5MT0dfRVJSIExJVkVQQVRDSCAiJXM6IFN5bWJvbCB0YWJsZSBoZWFkZXIgaXMgY29ycnVwdGVk
XG4iLAorICAgICAgICAgICAgICAgZWxmLT5uYW1lKTsKICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
CiAgICAgfQogCkBAIC0xNjAsOCArMTYwLDggQEAgc3RhdGljIGludCBlbGZfcmVzb2x2ZV9zZWN0
aW9ucyhzdHJ1Y3QgbGl2ZXBhdGNoX2VsZiAqZWxmLCBjb25zdCB2b2lkICpkYXRhKQogICAgIHJj
ID0gZWxmX3ZlcmlmeV9zdHJ0YWIoZWxmLT5zdHJ0YWIpOwogICAgIGlmICggcmMgKQogICAgIHsK
LSAgICAgICAgZHByaW50ayhYRU5MT0dfRVJSLCBMSVZFUEFUQ0ggIiVzOiBTdHJpbmcgdGFibGUg
c2VjdGlvbiBpcyBjb3JydXB0ZWRcbiIsCi0gICAgICAgICAgICAgICAgZWxmLT5uYW1lKTsKKyAg
ICAgICAgcHJpbnRrKFhFTkxPR19FUlIgTElWRVBBVENIICIlczogU3RyaW5nIHRhYmxlIHNlY3Rp
b24gaXMgY29ycnVwdGVkXG4iLAorICAgICAgICAgICAgICAgZWxmLT5uYW1lKTsKICAgICB9CiAK
ICAgICByZXR1cm4gcmM7CkBAIC0xODUsOCArMTg1LDggQEAgc3RhdGljIGludCBlbGZfcmVzb2x2
ZV9zZWN0aW9uX25hbWVzKHN0cnVjdCBsaXZlcGF0Y2hfZWxmICplbGYsIGNvbnN0IHZvaWQgKmRh
dGEKICAgICByYyA9IGVsZl92ZXJpZnlfc3RydGFiKHNlYyk7CiAgICAgaWYgKCByYyApCiAgICAg
ewotICAgICAgICBkcHJpbnRrKFhFTkxPR19FUlIsIExJVkVQQVRDSCAiJXM6IFNlY3Rpb24gc3Ry
aW5nIHRhYmxlIGlzIGNvcnJ1cHRlZFxuIiwKLSAgICAgICAgICAgICAgICBlbGYtPm5hbWUpOwor
ICAgICAgICBwcmludGsoWEVOTE9HX0VSUiBMSVZFUEFUQ0ggIiVzOiBTZWN0aW9uIHN0cmluZyB0
YWJsZSBpcyBjb3JydXB0ZWRcbiIsCisgICAgICAgICAgICAgICBlbGYtPm5hbWUpOwogICAgICAg
ICByZXR1cm4gcmM7CiAgICAgfQogCkBAIC0yMDMsOCArMjAzLDggQEAgc3RhdGljIGludCBlbGZf
cmVzb2x2ZV9zZWN0aW9uX25hbWVzKHN0cnVjdCBsaXZlcGF0Y2hfZWxmICplbGYsIGNvbnN0IHZv
aWQgKmRhdGEKICAgICAgICAgLyogQm91bmRhcnkgY2hlY2sgb24gb2Zmc2V0IG9mIG5hbWUgd2l0
aGluIHRoZSAuc2hzdHJ0YWIuICovCiAgICAgICAgIGlmICggZGVsdGEgPj0gc2VjLT5zZWMtPnNo
X3NpemUgKQogICAgICAgICB7Ci0gICAgICAgICAgICBkcHJpbnRrKFhFTkxPR19FUlIsIExJVkVQ
QVRDSCAiJXM6IFNlY3Rpb24gJXUgbmFtZSBpcyBub3Qgd2l0aGluIC5zaHN0cnRhYiFcbiIsCi0g
ICAgICAgICAgICAgICAgICAgIGVsZi0+bmFtZSwgaSk7CisgICAgICAgICAgICBwcmludGsoWEVO
TE9HX0VSUiBMSVZFUEFUQ0ggIiVzOiBTZWN0aW9uICV1IG5hbWUgaXMgbm90IHdpdGhpbiAuc2hz
dHJ0YWJcbiIsCisgICAgICAgICAgICAgICAgICAgZWxmLT5uYW1lLCBpKTsKICAgICAgICAgICAg
IHJldHVybiAtRUlOVkFMOwogICAgICAgICB9CiAKQEAgLTI0MSw3ICsyNDEsNyBAQCBzdGF0aWMg
aW50IGVsZl9nZXRfc3ltKHN0cnVjdCBsaXZlcGF0Y2hfZWxmICplbGYsIGNvbnN0IHZvaWQgKmRh
dGEpCiAgICAgc3ltID0geHphbGxvY19hcnJheShzdHJ1Y3QgbGl2ZXBhdGNoX2VsZl9zeW0sIG5z
eW0pOwogICAgIGlmICggIXN5bSApCiAgICAgewotICAgICAgICBkcHJpbnRrKFhFTkxPR19FUlIs
IExJVkVQQVRDSCAiJXM6IENvdWxkIG5vdCBhbGxvY2F0ZSBtZW1vcnkgZm9yIHN5bWJvbHNcbiIs
CisgICAgICAgIHByaW50ayhYRU5MT0dfRVJSIExJVkVQQVRDSCAiJXM6IENvdWxkIG5vdCBhbGxv
Y2F0ZSBtZW1vcnkgZm9yIHN5bWJvbHNcbiIsCiAgICAgICAgICAgICAgICBlbGYtPm5hbWUpOwog
ICAgICAgICByZXR1cm4gLUVOT01FTTsKICAgICB9CkBAIC0yNTcsOCArMjU3LDggQEAgc3RhdGlj
IGludCBlbGZfZ2V0X3N5bShzdHJ1Y3QgbGl2ZXBhdGNoX2VsZiAqZWxmLCBjb25zdCB2b2lkICpk
YXRhKQogICAgICAgICAvKiBCb3VuZGFyeSBjaGVjayB3aXRoaW4gdGhlIC5zdHJ0YWIuICovCiAg
ICAgICAgIGlmICggZGVsdGEgPj0gc3RydGFiX3NlYy0+c2VjLT5zaF9zaXplICkKICAgICAgICAg
ewotICAgICAgICAgICAgZHByaW50ayhYRU5MT0dfRVJSLCBMSVZFUEFUQ0ggIiVzOiBTeW1ib2wg
WyV1XSBuYW1lIGlzIG5vdCB3aXRoaW4gLnN0cnRhYiFcbiIsCi0gICAgICAgICAgICAgICAgICAg
IGVsZi0+bmFtZSwgaSk7CisgICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUiBMSVZFUEFUQ0gg
IiVzOiBTeW1ib2wgWyV1XSBuYW1lIGlzIG5vdCB3aXRoaW4gLnN0cnRhYlxuIiwKKyAgICAgICAg
ICAgICAgICAgICBlbGYtPm5hbWUsIGkpOwogICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CiAg
ICAgICAgIH0KIApAQCAtMjY2LDggKzI2Niw4IEBAIHN0YXRpYyBpbnQgZWxmX2dldF9zeW0oc3Ry
dWN0IGxpdmVwYXRjaF9lbGYgKmVsZiwgY29uc3Qgdm9pZCAqZGF0YSkKICAgICAgICAgc3ltW2ld
Lm5hbWUgPSBzdHJ0YWJfc2VjLT5kYXRhICsgZGVsdGE7CiAgICAgICAgIGlmICggYXJjaF9saXZl
cGF0Y2hfc3ltYm9sX2RlbnkoZWxmLCAmc3ltW2ldKSApCiAgICAgICAgIHsKLSAgICAgICAgICAg
IGRwcmludGsoWEVOTE9HX0VSUiwgTElWRVBBVENIICIlczogU3ltYm9sICclcycgc2hvdWxkIG5v
dCBiZSBpbiBwYXlsb2FkIVxuIiwKLSAgICAgICAgICAgICAgICAgICAgZWxmLT5uYW1lLCBzeW1b
aV0ubmFtZSk7CisgICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUiBMSVZFUEFUQ0ggIiVzOiBT
eW1ib2wgJyVzJyBzaG91bGQgbm90IGJlIGluIHBheWxvYWRcbiIsCisgICAgICAgICAgICAgICAg
ICAgZWxmLT5uYW1lLCBzeW1baV0ubmFtZSk7CiAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsK
ICAgICAgICAgfQogICAgIH0KQEAgLTI5Miw4ICsyOTIsOCBAQCBpbnQgbGl2ZXBhdGNoX2VsZl9y
ZXNvbHZlX3N5bWJvbHMoc3RydWN0IGxpdmVwYXRjaF9lbGYgKmVsZikKICAgICAgICAgc3dpdGNo
ICggaWR4ICkKICAgICAgICAgewogICAgICAgICBjYXNlIFNITl9DT01NT046Ci0gICAgICAgICAg
ICBkcHJpbnRrKFhFTkxPR19FUlIsIExJVkVQQVRDSCAiJXM6IFVuZXhwZWN0ZWQgY29tbW9uIHN5
bWJvbDogJXNcbiIsCi0gICAgICAgICAgICAgICAgICAgIGVsZi0+bmFtZSwgZWxmLT5zeW1baV0u
bmFtZSk7CisgICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUiBMSVZFUEFUQ0ggIiVzOiBVbmV4
cGVjdGVkIGNvbW1vbiBzeW1ib2w6ICVzXG4iLAorICAgICAgICAgICAgICAgICAgIGVsZi0+bmFt
ZSwgZWxmLT5zeW1baV0ubmFtZSk7CiAgICAgICAgICAgICByYyA9IC1FSU5WQUw7CiAgICAgICAg
ICAgICBicmVhazsKIApAQCAtMzA0LDggKzMwNCw4IEBAIGludCBsaXZlcGF0Y2hfZWxmX3Jlc29s
dmVfc3ltYm9scyhzdHJ1Y3QgbGl2ZXBhdGNoX2VsZiAqZWxmKQogICAgICAgICAgICAgICAgIHN0
X3ZhbHVlID0gbGl2ZXBhdGNoX3N5bWJvbHNfbG9va3VwX2J5X25hbWUoZWxmLT5zeW1baV0ubmFt
ZSk7CiAgICAgICAgICAgICAgICAgaWYgKCAhc3RfdmFsdWUgKQogICAgICAgICAgICAgICAgIHsK
LSAgICAgICAgICAgICAgICAgICAgZHByaW50ayhYRU5MT0dfRVJSLCBMSVZFUEFUQ0ggIiVzOiBV
bmtub3duIHN5bWJvbDogJXNcbiIsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgZWxmLT5u
YW1lLCBlbGYtPnN5bVtpXS5uYW1lKTsKKyAgICAgICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxP
R19FUlIgTElWRVBBVENIICIlczogVW5rbm93biBzeW1ib2w6ICVzXG4iLAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZWxmLT5uYW1lLCBlbGYtPnN5bVtpXS5uYW1lKTsKICAgICAgICAgICAg
ICAgICAgICAgcmMgPSAtRU5PRU5UOwogICAgICAgICAgICAgICAgICAgICBicmVhazsKICAgICAg
ICAgICAgICAgICB9CkBAIC0zMjgsNyArMzI4LDcgQEAgaW50IGxpdmVwYXRjaF9lbGZfcmVzb2x2
ZV9zeW1ib2xzKHN0cnVjdCBsaXZlcGF0Y2hfZWxmICplbGYpCiAKICAgICAgICAgICAgIGlmICgg
cmMgKQogICAgICAgICAgICAgewotICAgICAgICAgICAgICAgIGRwcmludGsoWEVOTE9HX0VSUiwg
TElWRVBBVENIICIlczogT3V0IG9mIGJvdW5kcyBzeW1ib2wgc2VjdGlvbiAlI3hcbiIsCisgICAg
ICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgTElWRVBBVENIICIlczogT3V0IG9mIGJvdW5k
cyBzeW1ib2wgc2VjdGlvbiAlI3hcbiIsCiAgICAgICAgICAgICAgICAgICAgICAgICBlbGYtPm5h
bWUsIGlkeCk7CiAgICAgICAgICAgICAgICAgYnJlYWs7CiAgICAgICAgICAgICB9CkBAIC0zODEs
OCArMzgxLDggQEAgaW50IGxpdmVwYXRjaF9lbGZfcGVyZm9ybV9yZWxvY3Moc3RydWN0IGxpdmVw
YXRjaF9lbGYgKmVsZikKIAogICAgICAgICBpZiAoIHItPnNlYy0+c2hfbGluayAhPSBlbGYtPnN5
bXRhYl9pZHggKQogICAgICAgICB7Ci0gICAgICAgICAgICBkcHJpbnRrKFhFTkxPR19FUlIsIExJ
VkVQQVRDSCAiJXM6IFJlbGF0aXZlIGxpbmsgb2YgJXMgaXMgaW5jb3JyZWN0ICglZCwgZXhwZWN0
ZWQ9JWQpXG4iLAotICAgICAgICAgICAgICAgICAgICBlbGYtPm5hbWUsIHItPm5hbWUsIHItPnNl
Yy0+c2hfbGluaywgZWxmLT5zeW10YWJfaWR4KTsKKyAgICAgICAgICAgIHByaW50ayhYRU5MT0df
RVJSIExJVkVQQVRDSCAiJXM6IFJlbGF0aXZlIGxpbmsgb2YgJXMgaXMgaW5jb3JyZWN0ICglZCwg
ZXhwZWN0ZWQ9JWQpXG4iLAorICAgICAgICAgICAgICAgICAgIGVsZi0+bmFtZSwgci0+bmFtZSwg
ci0+c2VjLT5zaF9saW5rLCBlbGYtPnN5bXRhYl9pZHgpOwogICAgICAgICAgICAgcmMgPSAtRUlO
VkFMOwogICAgICAgICAgICAgYnJlYWs7CiAgICAgICAgIH0KQEAgLTM5Nyw4ICszOTcsOCBAQCBp
bnQgbGl2ZXBhdGNoX2VsZl9wZXJmb3JtX3JlbG9jcyhzdHJ1Y3QgbGl2ZXBhdGNoX2VsZiAqZWxm
KQogCiAgICAgICAgIGlmICggci0+c2VjLT5zaF9lbnRzaXplIDwgc3ogfHwgci0+c2VjLT5zaF9z
aXplICUgci0+c2VjLT5zaF9lbnRzaXplICkKICAgICAgICAgewotICAgICAgICAgICAgZHByaW50
ayhYRU5MT0dfRVJSLCBMSVZFUEFUQ0ggIiVzOiBTZWN0aW9uIHJlbGF0aXZlIGhlYWRlciBpcyBj
b3JydXB0ZWQhXG4iLAotICAgICAgICAgICAgICAgICAgICBlbGYtPm5hbWUpOworICAgICAgICAg
ICAgcHJpbnRrKFhFTkxPR19FUlIgTElWRVBBVENIICIlczogU2VjdGlvbiByZWxhdGl2ZSBoZWFk
ZXIgaXMgY29ycnVwdGVkXG4iLAorICAgICAgICAgICAgICAgICAgIGVsZi0+bmFtZSk7CiAgICAg
ICAgICAgICByYyA9IC1FSU5WQUw7CiAgICAgICAgICAgICBicmVhazsKICAgICAgICAgfQpAQCAt
NDIyLDE0ICs0MjIsMTQgQEAgc3RhdGljIGludCBsaXZlcGF0Y2hfaGVhZGVyX2NoZWNrKGNvbnN0
IHN0cnVjdCBsaXZlcGF0Y2hfZWxmICplbGYpCiAKICAgICBpZiAoIHNpemVvZigqZWxmLT5oZHIp
ID4gZWxmLT5sZW4gKQogICAgIHsKLSAgICAgICAgZHByaW50ayhYRU5MT0dfRVJSLCBMSVZFUEFU
Q0ggIiVzOiBTZWN0aW9uIGhlYWRlciBpcyBiaWdnZXIgdGhhbiBwYXlsb2FkIVxuIiwKLSAgICAg
ICAgICAgICAgICBlbGYtPm5hbWUpOworICAgICAgICBwcmludGsoWEVOTE9HX0VSUiBMSVZFUEFU
Q0ggIiVzOiBTZWN0aW9uIGhlYWRlciBpcyBiaWdnZXIgdGhhbiBwYXlsb2FkXG4iLAorICAgICAg
ICAgICAgICAgZWxmLT5uYW1lKTsKICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CiAgICAgfQogCiAg
ICAgaWYgKCAhSVNfRUxGKCpoZHIpICkKICAgICB7Ci0gICAgICAgIGRwcmludGsoWEVOTE9HX0VS
UiwgTElWRVBBVENIICIlczogTm90IGFuIEVMRiBwYXlsb2FkIVxuIiwgZWxmLT5uYW1lKTsKKyAg
ICAgICAgcHJpbnRrKFhFTkxPR19FUlIgTElWRVBBVENIICIlczogTm90IGFuIEVMRiBwYXlsb2Fk
XG4iLCBlbGYtPm5hbWUpOwogICAgICAgICByZXR1cm4gLUVJTlZBTDsKICAgICB9CiAKQEAgLTQ0
Miw3ICs0NDIsNyBAQCBzdGF0aWMgaW50IGxpdmVwYXRjaF9oZWFkZXJfY2hlY2soY29uc3Qgc3Ry
dWN0IGxpdmVwYXRjaF9lbGYgKmVsZikKICAgICAgICAgIGhkci0+ZV90eXBlICE9IEVUX1JFTCB8
fAogICAgICAgICAgaGRyLT5lX3BobnVtICE9IDAgKQogICAgIHsKLSAgICAgICAgZHByaW50ayhY
RU5MT0dfRVJSLCBMSVZFUEFUQ0ggIiVzOiBJbnZhbGlkIEVMRiBwYXlsb2FkIVxuIiwgZWxmLT5u
YW1lKTsKKyAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgTElWRVBBVENIICIlczogSW52YWxpZCBF
TEYgcGF5bG9hZFxuIiwgZWxmLT5uYW1lKTsKICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwog
ICAgIH0KIApAQCAtNDUyLDQ1ICs0NTIsNDUgQEAgc3RhdGljIGludCBsaXZlcGF0Y2hfaGVhZGVy
X2NoZWNrKGNvbnN0IHN0cnVjdCBsaXZlcGF0Y2hfZWxmICplbGYpCiAKICAgICBpZiAoIGVsZi0+
aGRyLT5lX3Noc3RybmR4ID09IFNITl9VTkRFRiApCiAgICAgewotICAgICAgICBkcHJpbnRrKFhF
TkxPR19FUlIsIExJVkVQQVRDSCAiJXM6IFNlY3Rpb24gbmFtZSBpZHggaXMgdW5kZWZpbmVkIT9c
biIsCi0gICAgICAgICAgICAgICAgZWxmLT5uYW1lKTsKKyAgICAgICAgcHJpbnRrKFhFTkxPR19F
UlIgTElWRVBBVENIICIlczogU2VjdGlvbiBuYW1lIGlkeCBpcyB1bmRlZmluZWRcbiIsCisgICAg
ICAgICAgICAgICBlbGYtPm5hbWUpOwogICAgICAgICByZXR1cm4gLUVJTlZBTDsKICAgICB9CiAK
ICAgICAvKiBBcmJpdHJhcnkgYm91bmRhcnkgbGltaXQuICovCiAgICAgaWYgKCBlbGYtPmhkci0+
ZV9zaG51bSA+PSAxMDI0ICkKICAgICB7Ci0gICAgICAgIGRwcmludGsoWEVOTE9HX0VSUiwgTElW
RVBBVENIICIlczogVG9vIG1hbnkgKCV1KSBzZWN0aW9ucyFcbiIsCi0gICAgICAgICAgICAgICAg
ZWxmLT5uYW1lLCBlbGYtPmhkci0+ZV9zaG51bSk7CisgICAgICAgIHByaW50ayhYRU5MT0dfRVJS
IExJVkVQQVRDSCAiJXM6IFRvbyBtYW55ICgldSkgc2VjdGlvbnNcbiIsCisgICAgICAgICAgICAg
ICBlbGYtPm5hbWUsIGVsZi0+aGRyLT5lX3NobnVtKTsKICAgICAgICAgcmV0dXJuIC1FT1BOT1RT
VVBQOwogICAgIH0KIAogICAgIC8qIENoZWNrIHRoYXQgc2VjdGlvbiBuYW1lIGluZGV4IGlzIHdp
dGhpbiB0aGUgc2VjdGlvbnMuICovCiAgICAgaWYgKCBlbGYtPmhkci0+ZV9zaHN0cm5keCA+PSBl
bGYtPmhkci0+ZV9zaG51bSApCiAgICAgewotICAgICAgICBkcHJpbnRrKFhFTkxPR19FUlIsIExJ
VkVQQVRDSCAiJXM6IFNlY3Rpb24gbmFtZSBpZHggKCV1KSBpcyBwYXN0IGVuZCBvZiBzZWN0aW9u
cyAoJXUpIVxuIiwKLSAgICAgICAgICAgICAgICBlbGYtPm5hbWUsIGVsZi0+aGRyLT5lX3Noc3Ry
bmR4LCBlbGYtPmhkci0+ZV9zaG51bSk7CisgICAgICAgIHByaW50ayhYRU5MT0dfRVJSIExJVkVQ
QVRDSCAiJXM6IFNlY3Rpb24gbmFtZSBpZHggKCV1KSBpcyBwYXN0IGVuZCBvZiBzZWN0aW9ucyAo
JXUpXG4iLAorICAgICAgICAgICAgICAgZWxmLT5uYW1lLCBlbGYtPmhkci0+ZV9zaHN0cm5keCwg
ZWxmLT5oZHItPmVfc2hudW0pOwogICAgICAgICByZXR1cm4gLUVJTlZBTDsKICAgICB9CiAKICAg
ICBpZiAoIGVsZi0+aGRyLT5lX3Nob2ZmID49IGVsZi0+bGVuICkKICAgICB7Ci0gICAgICAgIGRw
cmludGsoWEVOTE9HX0VSUiwgTElWRVBBVENIICIlczogQm9ndXMgZV9zaG9mZiFcbiIsIGVsZi0+
bmFtZSk7CisgICAgICAgIHByaW50ayhYRU5MT0dfRVJSIExJVkVQQVRDSCAiJXM6IEJvZ3VzIGVf
c2hvZmZcbiIsIGVsZi0+bmFtZSk7CiAgICAgICAgIHJldHVybiAtRUlOVkFMOwogICAgIH0KIAog
ICAgIGlmICggZWxmLT5oZHItPmVfc2hlbnRzaXplIDwgc2l6ZW9mKEVsZl9TaGRyKSApCiAgICAg
ewotICAgICAgICBkcHJpbnRrKFhFTkxPR19FUlIsIExJVkVQQVRDSCAiJXM6IFNlY3Rpb24gaGVh
ZGVyIHNpemUgaXMgJXUhIEV4cGVjdGVkICV6dSE/XG4iLAotICAgICAgICAgICAgICAgIGVsZi0+
bmFtZSwgZWxmLT5oZHItPmVfc2hlbnRzaXplLCBzaXplb2YoRWxmX1NoZHIpKTsKKyAgICAgICAg
cHJpbnRrKFhFTkxPR19FUlIgTElWRVBBVENIICIlczogU2VjdGlvbiBoZWFkZXIgc2l6ZSBpcyAl
dSEgRXhwZWN0ZWQgJXp1LlxuIiwKKyAgICAgICAgICAgICAgIGVsZi0+bmFtZSwgZWxmLT5oZHIt
PmVfc2hlbnRzaXplLCBzaXplb2YoRWxmX1NoZHIpKTsKICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
CiAgICAgfQogCiAgICAgaWYgKCAoKGVsZi0+bGVuIC0gZWxmLT5oZHItPmVfc2hvZmYpIC8gZWxm
LT5oZHItPmVfc2hlbnRzaXplKSA8CiAgICAgICAgICBlbGYtPmhkci0+ZV9zaG51bSApCiAgICAg
ewotICAgICAgICBkcHJpbnRrKFhFTkxPR19FUlIsIExJVkVQQVRDSCAiJXM6IFNlY3Rpb24gaGVh
ZGVyIHNpemUgaXMgY29ycnVwdGVkIVxuIiwKLSAgICAgICAgICAgICAgICBlbGYtPm5hbWUpOwor
ICAgICAgICBwcmludGsoWEVOTE9HX0VSUiBMSVZFUEFUQ0ggIiVzOiBTZWN0aW9uIGhlYWRlciBz
aXplIGlzIGNvcnJ1cHRlZFxuIiwKKyAgICAgICAgICAgICAgIGVsZi0+bmFtZSk7CiAgICAgICAg
IHJldHVybiAtRUlOVkFMOwogICAgIH0KIAotLSAKMi4xNi41CgoKCgpBbWF6b24gRGV2ZWxvcG1l
bnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hh
ZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoCkVpbmdldHJh
Z2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6
OiBCZXJsaW4KVXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
