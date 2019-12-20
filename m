Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 959A8127C6C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 15:21:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiJ7F-0003iJ-Ck; Fri, 20 Dec 2019 14:18:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiJ7E-0003iD-7X
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 14:18:52 +0000
X-Inumbo-ID: a06b8888-2333-11ea-a1e1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a06b8888-2333-11ea-a1e1-bc764e2007e4;
 Fri, 20 Dec 2019 14:18:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9F810B2CF;
 Fri, 20 Dec 2019 14:18:42 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <aa264d92-2545-f2e7-5225-4f870e3ec8f9@suse.com>
Message-ID: <8be5ebf6-c710-e1de-12af-f87137b69c44@suse.com>
Date: Fri, 20 Dec 2019 15:19:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <aa264d92-2545-f2e7-5225-4f870e3ec8f9@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 1/4] x86/mm: mod_l<N>_entry() have no need to
 use __copy_from_user()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

bW9kX2wxX2VudHJ5KCkncyBuZWVkIHRvIGRvIHNvIHdlbnQgYXdheSB3aXRoIGNvbW1pdCAyZDA1
NTdjNWNiICgieDg2OgpGb2xkIHBhZ2VfaW5mbyBsb2NrIGludG8gdHlwZV9pbmZvIiksIGFuZCB0
aGUgb3RoZXIgdGhyZWUgbmV2ZXIgaGFkIHN1Y2gKYSBuZWVkLCBhdCBsZWFzdCBnb2luZyBiYWNr
IGFzIGZhciBhcyAzLjIuMC4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS5j
CkBAIC0yMTI0LDEzICsyMTI0LDEwIEBAIHN0YXRpYyBpbnQgbW9kX2wxX2VudHJ5KGwxX3BnZW50
cnlfdCAqcGwKICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2Y3B1ICpwdF92Y3B1LCBz
dHJ1Y3QgZG9tYWluICpwZ19kb20pCiB7CiAgICAgYm9vbCBwcmVzZXJ2ZV9hZCA9IChjbWQgPT0g
TU1VX1BUX1VQREFURV9QUkVTRVJWRV9BRCk7Ci0gICAgbDFfcGdlbnRyeV90IG9sMWU7CisgICAg
bDFfcGdlbnRyeV90IG9sMWUgPSAqcGwxZTsKICAgICBzdHJ1Y3QgZG9tYWluICpwdF9kb20gPSBw
dF92Y3B1LT5kb21haW47CiAgICAgaW50IHJjID0gMDsKIAotICAgIGlmICggdW5saWtlbHkoX19j
b3B5X2Zyb21fdXNlcigmb2wxZSwgcGwxZSwgc2l6ZW9mKG9sMWUpKSAhPSAwKSApCi0gICAgICAg
IHJldHVybiAtRUZBVUxUOwotCiAgICAgQVNTRVJUKCFwYWdpbmdfbW9kZV9yZWZjb3VudHMocHRf
ZG9tKSk7CiAKICAgICBpZiAoIGwxZV9nZXRfZmxhZ3MobmwxZSkgJiBfUEFHRV9QUkVTRU5UICkK
QEAgLTIyNDgsOCArMjI0NSw3IEBAIHN0YXRpYyBpbnQgbW9kX2wyX2VudHJ5KGwyX3BnZW50cnlf
dCAqcGwKICAgICAgICAgcmV0dXJuIC1FUEVSTTsKICAgICB9CiAKLSAgICBpZiAoIHVubGlrZWx5
KF9fY29weV9mcm9tX3VzZXIoJm9sMmUsIHBsMmUsIHNpemVvZihvbDJlKSkgIT0gMCkgKQotICAg
ICAgICByZXR1cm4gLUVGQVVMVDsKKyAgICBvbDJlID0gKnBsMmU7CiAKICAgICBpZiAoIGwyZV9n
ZXRfZmxhZ3MobmwyZSkgJiBfUEFHRV9QUkVTRU5UICkKICAgICB7CkBAIC0yMzExLDggKzIzMDcs
NyBAQCBzdGF0aWMgaW50IG1vZF9sM19lbnRyeShsM19wZ2VudHJ5X3QgKnBsCiAgICAgaWYgKCBp
c19wdl8zMmJpdF9kb21haW4oZCkgJiYgKHBnZW50cnlfcHRyX3RvX3Nsb3QocGwzZSkgPj0gMykg
KQogICAgICAgICByZXR1cm4gLUVJTlZBTDsKIAotICAgIGlmICggdW5saWtlbHkoX19jb3B5X2Zy
b21fdXNlcigmb2wzZSwgcGwzZSwgc2l6ZW9mKG9sM2UpKSAhPSAwKSApCi0gICAgICAgIHJldHVy
biAtRUZBVUxUOworICAgIG9sM2UgPSAqcGwzZTsKIAogICAgIGlmICggbDNlX2dldF9mbGFncyhu
bDNlKSAmIF9QQUdFX1BSRVNFTlQgKQogICAgIHsKQEAgLTIzNzgsOCArMjM3Myw3IEBAIHN0YXRp
YyBpbnQgbW9kX2w0X2VudHJ5KGw0X3BnZW50cnlfdCAqcGwKICAgICAgICAgcmV0dXJuIC1FSU5W
QUw7CiAgICAgfQogCi0gICAgaWYgKCB1bmxpa2VseShfX2NvcHlfZnJvbV91c2VyKCZvbDRlLCBw
bDRlLCBzaXplb2Yob2w0ZSkpICE9IDApICkKLSAgICAgICAgcmV0dXJuIC1FRkFVTFQ7CisgICAg
b2w0ZSA9ICpwbDRlOwogCiAgICAgaWYgKCBsNGVfZ2V0X2ZsYWdzKG5sNGUpICYgX1BBR0VfUFJF
U0VOVCApCiAgICAgewoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
