Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A741C1181C4
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 09:09:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieaXi-0002Qj-Mv; Tue, 10 Dec 2019 08:06:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DUzY=2A=gmail.com=sj38.park@srs-us1.protection.inumbo.net>)
 id 1ieaXh-0002QV-Ai
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 08:06:49 +0000
X-Inumbo-ID: 016881da-1b24-11ea-a914-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 016881da-1b24-11ea-a914-bc764e2007e4;
 Tue, 10 Dec 2019 08:06:44 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c14so18874842wrn.7
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2019 00:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QwGsEms4piE9a2DBjMxlpqS/fTzaKgAUBvTe2FzVG7A=;
 b=lPza1JEHlTNKLzFDCDRnVo7HF92gkuhkIa1h7FjUOXfSbg8cJNbwj22lMhzGmLWQM9
 EuWz/6RijlKpCghZcVe3rWIOXVZ+A9aqVJpF6BsEL2ih8fTyYXlYEfgwFVcxcG+UZh0b
 In2tw6g7OqQrdDqrIU2uDeX8GfA7NdmDamY7upGqhCceTUDRnF0kmdlKLR3NJx75Co12
 CMcB9hXFxUxJer4fTd1qBw5yf9v4G/6MTQPWhgB+sRzuVRo/hUuVXnquQbiWhxJixdCw
 1ambSMWkD03j7VE0keCQ0T8J0Bl0P7Q38teIHMQNLfq/p+ufiRsQ8xEwzGBeKIMMBmRP
 bhMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QwGsEms4piE9a2DBjMxlpqS/fTzaKgAUBvTe2FzVG7A=;
 b=FJamT2937Rz3dIy1JDdJAbzBq1kIvz2nMYb8JRvKBg8SjQN+F8Uo42Y3LF+dJD8R61
 sPhzcEy4+/k4sq/ONvvg7I0Rl10yLwGVP46yQb/7Yz6PhGOhCT33vo95333dGnzR2Rc5
 TNcqZk5WGcATnnDCEWeB3l2eyT8bbxewfmE8sDQV+25SCKMrUczvUYqxL5kBLsele04i
 LKI+3Lxc8qORNCViRg7Y1iiLWo109OClKplLAxttAmuWTzCwI/HEfDjy9DkQntL8WC5J
 D4NfPfbHykzMfJDtJkO3Z/IOYs7BIHmKOlTMhx/R2LPvPG9UHOj4NIW6ZX+9QwiVyven
 2Teg==
X-Gm-Message-State: APjAAAUArQhDXYIpw45CjDReVeasAk+TSaii9oldhwF8gME2btJDbz08
 AmiMpkpGPJ7TJCLm+aJYF5g=
X-Google-Smtp-Source: APXvYqyeW1Ot1SkJg8uOlMtOudbd9EEcZEGOP8qLc0yzxcBnOs2OKqXQe5RAMyAarTVhuIvkXVwDXw==
X-Received: by 2002:adf:e812:: with SMTP id o18mr1543550wrm.127.1575965204034; 
 Tue, 10 Dec 2019 00:06:44 -0800 (PST)
Received: from localhost.localdomain (x2f7fae7.dyn.telefonica.de.
 [2.247.250.231])
 by smtp.gmail.com with ESMTPSA id a16sm2342587wrt.37.2019.12.10.00.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 00:06:43 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
X-Google-Original-From: SeongJae Park <sjpark@amazon.de>
To: sjpark@amazon.com
Date: Tue, 10 Dec 2019 08:06:27 +0000
Message-Id: <20191210080628.5264-2-sjpark@amazon.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191210080628.5264-1-sjpark@amazon.de>
References: <20191210080628.5264-1-sjpark@amazon.de>
Subject: [Xen-devel] [PATCH v5 1/2] xenbus/backend: Add memory pressure
 handler callback
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
Cc: axboe@kernel.dk, sj38.park@gmail.com, konrad.wilk@oracle.com,
 pdurrant@amazon.com, SeongJae Park <sjpark@amazon.de>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org, roger.pau@citrix.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R3JhbnRpbmcgcGFnZXMgY29uc3VtZXMgYmFja2VuZCBzeXN0ZW0gbWVtb3J5LiAgSW4gc3lzdGVt
cyBjb25maWd1cmVkCndpdGggaW5zdWZmaWNpZW50IHNwYXJlIG1lbW9yeSBmb3IgdGhvc2UgcGFn
ZXMsIGl0IGNhbiBjYXVzZSBhIG1lbW9yeQpwcmVzc3VyZSBzaXR1YXRpb24uICBIb3dldmVyLCBm
aW5kaW5nIHRoZSBvcHRpbWFsIGFtb3VudCBvZiB0aGUgc3BhcmUKbWVtb3J5IGlzIGNoYWxsZW5n
aW5nIGZvciBsYXJnZSBzeXN0ZW1zIGhhdmluZyBkeW5hbWljIHJlc291cmNlCnV0aWxpemF0aW9u
IHBhdHRlcm5zLiAgQWxzbywgc3VjaCBhIHN0YXRpYyBjb25maWd1cmF0aW9uIG1pZ2h0IGxhY2sg
YQpmbGV4aWJpbGl0eS4KClRvIG1pdGlnYXRlIHN1Y2ggcHJvYmxlbXMsIHRoaXMgY29tbWl0IGFk
ZHMgYSBtZW1vcnkgcmVjbGFpbSBjYWxsYmFjayB0bwoneGVuYnVzX2RyaXZlcicuICBVc2luZyB0
aGlzIGZhY2lsaXR5LCAneGVuYnVzJyB3b3VsZCBiZSBhYmxlIHRvIG1vbml0b3IKYSBtZW1vcnkg
cHJlc3N1cmUgYW5kIHJlcXVlc3Qgc3BlY2lmaWMgZGV2aWNlcyBvZiBzcGVjaWZpYyBiYWNrZW5k
CmRyaXZlcnMgd2hpY2ggY2F1c2luZyB0aGUgZ2l2ZW4gcHJlc3N1cmUgdG8gdm9sdW50YXJpbHkg
cmVsZWFzZSBpdHMKbWVtb3J5LgoKVGhhdCBzYWlkLCB0aGlzIGNvbW1pdCBzaW1wbHkgcmVxdWVz
dHMgZXZlcnkgY2FsbGJhY2sgcmVnaXN0ZXJlZCBkcml2ZXIKdG8gcmVsZWFzZSBpdHMgbWVtb3J5
IGZvciBldmVyeSBkb21haW4sIHJhdGhlciB0aGFuIGlzc3VlaW5nIHRoZQpyZXF1ZXN0cyB0byB0
aGUgZHJpdmVycyBhbmQgdGhlIGRvbWFpbiBpbiBjaGFyZ2UuICBTdWNoIHRoaW5ncyB3aWxsIGJl
CmRvbmUgaW4gYSBmdXR1ci4gIEFsc28sIHRoaXMgY29tbWl0IGZvY3VzZXMgb24gbWVtb3J5IG9u
bHkuICBIb3dldmVyLCBpdAp3b3VsZCBiZSBhYmx0IHRvIGJlIGV4dGVuZGVkIGZvciBnZW5lcmFs
IHJlc291cmNlcy4KClNpZ25lZC1vZmYtYnk6IFNlb25nSmFlIFBhcmsgPHNqcGFya0BhbWF6b24u
ZGU+Ci0tLQogZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZV9iYWNrZW5kLmMgfCAzMSAr
KysrKysrKysrKysrKysrKysrKysrKwogaW5jbHVkZS94ZW4veGVuYnVzLmggICAgICAgICAgICAg
ICAgICAgICAgfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2JhY2tlbmQuYyBiL2RyaXZl
cnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmVfYmFja2VuZC5jCmluZGV4IGIwYmVkNGZhZjQ0Yy4u
NWE1YmEyOWUzOWRmIDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2Jl
X2JhY2tlbmQuYworKysgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2JhY2tlbmQu
YwpAQCAtMjQ4LDYgKzI0OCwzNCBAQCBzdGF0aWMgaW50IGJhY2tlbmRfcHJvYmVfYW5kX3dhdGNo
KHN0cnVjdCBub3RpZmllcl9ibG9jayAqbm90aWZpZXIsCiAJcmV0dXJuIE5PVElGWV9ET05FOwog
fQogCitzdGF0aWMgaW50IHhlbmJ1c19iYWNrZW5kX3JlY2xhaW0oc3RydWN0IGRldmljZSAqZGV2
LCB2b2lkICpkYXRhKQoreworCXN0cnVjdCB4ZW5idXNfZHJpdmVyICpkcnY7CisJaWYgKCFkZXYt
PmRyaXZlcikKKwkJcmV0dXJuIC1FTk9FTlQ7CisJZHJ2ID0gdG9feGVuYnVzX2RyaXZlcihkZXYt
PmRyaXZlcik7CisJaWYgKGRydiAmJiBkcnYtPnJlY2xhaW0pCisJCWRydi0+cmVjbGFpbSh0b194
ZW5idXNfZGV2aWNlKGRldikpOworCXJldHVybiAwOworfQorCisvKgorICogUmV0dXJucyAwIGFs
d2F5cyBiZWNhdXNlIHdlIGFyZSB1c2luZyBzaHJpbmtlciB0byBvbmx5IGRldGVjdCBtZW1vcnkK
KyAqIHByZXNzdXJlLgorICovCitzdGF0aWMgdW5zaWduZWQgbG9uZyB4ZW5idXNfYmFja2VuZF9z
aHJpbmtfY291bnQoc3RydWN0IHNocmlua2VyICpzaHJpbmtlciwKKwkJCQlzdHJ1Y3Qgc2hyaW5r
X2NvbnRyb2wgKnNjKQoreworCWJ1c19mb3JfZWFjaF9kZXYoJnhlbmJ1c19iYWNrZW5kLmJ1cywg
TlVMTCwgTlVMTCwKKwkJCXhlbmJ1c19iYWNrZW5kX3JlY2xhaW0pOworCXJldHVybiAwOworfQor
CitzdGF0aWMgc3RydWN0IHNocmlua2VyIHhlbmJ1c19iYWNrZW5kX3Nocmlua2VyID0geworCS5j
b3VudF9vYmplY3RzID0geGVuYnVzX2JhY2tlbmRfc2hyaW5rX2NvdW50LAorCS5zZWVrcyA9IERF
RkFVTFRfU0VFS1MsCit9OworCiBzdGF0aWMgaW50IF9faW5pdCB4ZW5idXNfcHJvYmVfYmFja2Vu
ZF9pbml0KHZvaWQpCiB7CiAJc3RhdGljIHN0cnVjdCBub3RpZmllcl9ibG9jayB4ZW5zdG9yZV9u
b3RpZmllciA9IHsKQEAgLTI2NCw2ICsyOTIsOSBAQCBzdGF0aWMgaW50IF9faW5pdCB4ZW5idXNf
cHJvYmVfYmFja2VuZF9pbml0KHZvaWQpCiAKIAlyZWdpc3Rlcl94ZW5zdG9yZV9ub3RpZmllcigm
eGVuc3RvcmVfbm90aWZpZXIpOwogCisJaWYgKHJlZ2lzdGVyX3Nocmlua2VyKCZ4ZW5idXNfYmFj
a2VuZF9zaHJpbmtlcikpCisJCXByX3dhcm4oInNocmlua2VyIHJlZ2lzdHJhdGlvbiBmYWlsZWRc
biIpOworCiAJcmV0dXJuIDA7CiB9CiBzdWJzeXNfaW5pdGNhbGwoeGVuYnVzX3Byb2JlX2JhY2tl
bmRfaW5pdCk7CmRpZmYgLS1naXQgYS9pbmNsdWRlL3hlbi94ZW5idXMuaCBiL2luY2x1ZGUveGVu
L3hlbmJ1cy5oCmluZGV4IDg2OWM4MTZkNWY4Yy4uY2RiMDc1ZTQxODJmIDEwMDY0NAotLS0gYS9p
bmNsdWRlL3hlbi94ZW5idXMuaAorKysgYi9pbmNsdWRlL3hlbi94ZW5idXMuaApAQCAtMTA0LDYg
KzEwNCw3IEBAIHN0cnVjdCB4ZW5idXNfZHJpdmVyIHsKIAlzdHJ1Y3QgZGV2aWNlX2RyaXZlciBk
cml2ZXI7CiAJaW50ICgqcmVhZF9vdGhlcmVuZF9kZXRhaWxzKShzdHJ1Y3QgeGVuYnVzX2Rldmlj
ZSAqZGV2KTsKIAlpbnQgKCppc19yZWFkeSkoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldik7CisJ
dW5zaWduZWQgKCpyZWNsYWltKShzdHJ1Y3QgeGVuYnVzX2RldmljZSAqZGV2KTsKIH07CiAKIHN0
YXRpYyBpbmxpbmUgc3RydWN0IHhlbmJ1c19kcml2ZXIgKnRvX3hlbmJ1c19kcml2ZXIoc3RydWN0
IGRldmljZV9kcml2ZXIgKmRydikKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
