Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1263D016A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 21:46:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHvMu-0000Wa-Ek; Tue, 08 Oct 2019 19:42:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tgZT=YB=gmail.com=robherring2@srs-us1.protection.inumbo.net>)
 id 1iHvMt-0000WU-1L
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 19:41:59 +0000
X-Inumbo-ID: b07fea66-ea03-11e9-96dc-bc764e2007e4
Received: from mail-ot1-f65.google.com (unknown [209.85.210.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b07fea66-ea03-11e9-96dc-bc764e2007e4;
 Tue, 08 Oct 2019 19:41:58 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id k32so15083562otc.4
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2019 12:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cM/iEPaCvfOjsvb7CWmfva5BP/wvMw5x+2gKptZwcOk=;
 b=MVPMNWWSkwso1IyPFFGk7KgyO9FBs9QN/n9ofRX1GIej3XDVDS3+euZkZKmjygOTIM
 HznV/OGCeecPn7pVQGiZDHkphYXHWeuSXBE+11o1iqa6hfW0jG8+M72vT611gq7c7zyG
 gmX9Qc5ysAPBDByn526C9hedpv0G+jlFo0CkuCr0CvsqYA7/yA4Ez3pDR5ISkddBhfDx
 rxNJq7aDv/sLQX95GR0Lj3kunpgYPQSqv1GPwGdJy3vnPu5HaRf2MEkDV9z7xxQcMSfS
 e3dXKmOSVZCAUhylGaAMKFDKH9rl/drS8BauY+j+7rl7NA1+Xpl8wxjxKs477JSNc+Tv
 mX5Q==
X-Gm-Message-State: APjAAAU3jbwlHA1u5qsysdRyaoLDjl9TQWhQ3rAKEiQ62ZqO52NATxDV
 pzlNRoiCJFASPjImJxJI7uHdAjs=
X-Google-Smtp-Source: APXvYqxBTulxVQeCUzNrniHc4WOTx+3wOd+GgT82xa9DGnUA1ysJ04S1+2IdRLJi/4rEbo0Ce1tAvg==
X-Received: by 2002:a9d:7418:: with SMTP id n24mr2934782otk.19.1570563717135; 
 Tue, 08 Oct 2019 12:41:57 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id z12sm5364645oth.71.2019.10.08.12.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 12:41:56 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Tue,  8 Oct 2019 14:41:55 -0500
Message-Id: <20191008194155.4810-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] xen: Stop abusing DT of_dma_configure API
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-kernel@vger.kernel.org, Julien Grall <julien.grall@arm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXMgdGhlIHJlbW92ZWQgY29tbWVudHMgc2F5LCB0aGVzZSBhcmVuJ3QgRFQgYmFzZWQgZGV2aWNl
cy4Kb2ZfZG1hX2NvbmZpZ3VyZSgpIGlzIGdvaW5nIHRvIHN0b3AgYWxsb3dpbmcgYSBOVUxMIERU
IG5vZGUgYW5kIGNhbGxpbmcKaXQgd2lsbCBubyBsb25nZXIgd29yay4KClRoZSBjb21tZW50IGlz
IGFsc28gbm93IG91dCBvZiBkYXRlIGFzIG9mIGNvbW1pdCA5YWI5MWU3YzVjNTEgKCJhcm02NDoK
ZGVmYXVsdCB0byB0aGUgZGlyZWN0IG1hcHBpbmcgaW4gZ2V0X2FyY2hfZG1hX29wcyIpLiBEaXJl
Y3QgbWFwcGluZwppcyBub3cgdGhlIGRlZmF1bHQgcmF0aGVyIHRoYW4gZG1hX2R1bW15X29wcy4K
CkFjY29yZGluZyB0byBTdGVmYW5vIGFuZCBPbGVrc2FuZHIsIHRoZSBvbmx5IG90aGVyIHBhcnQg
bmVlZGVkIGlzCnNldHRpbmcgdGhlIERNQSBtYXNrcyBhbmQgdGhlcmUncyBubyByZWFzb24gdG8g
cmVzdHJpY3QgdGhlIG1hc2tzIHRvCjMyLWJpdHMuIFNvIHNldCB0aGUgbWFza3MgdG8gNjQgYml0
cy4KCkNjOiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPgpDYzogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ2M6IE5pY29sYXMgU2FlbnogSnVsaWVubmUgPG5z
YWVuemp1bGllbm5lQHN1c2UuZGU+CkNjOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3Nh
bmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+CkNjOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9z
dHJvdnNreUBvcmFjbGUuY29tPgpDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpD
YzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDYzogQ2hyaXN0
b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+CkNjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KLS0tCnYyOgog
LSBTZXR1cCBkbWEgbWFza3MKIC0gQWxzbyBmaXggeGVuX2RybV9mcm9udC5jCiAKVGhpcyBjYW4g
bm93IGJlIGFwcGxpZWQgdG8gdGhlIFhlbiB0cmVlIGluZGVwZW5kZW50IG9mIHRoZSBjb21pbmcK
b2ZfZG1hX2NvbmZpZ3VyZSgpIGNoYW5nZXMuCgpSb2IKCiBkcml2ZXJzL2dwdS9kcm0veGVuL3hl
bl9kcm1fZnJvbnQuYyB8IDEyICsrLS0tLS0tLS0tLQogZHJpdmVycy94ZW4vZ250ZGV2LmMgICAg
ICAgICAgICAgICAgfCAxMyArKy0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
bi94ZW5fZHJtX2Zyb250LmMgYi9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnQuYwpp
bmRleCBiYTE4MjhhY2Q4YzkuLjRiZTQ5YzFhZWY1MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3hlbi94ZW5fZHJtX2Zyb250LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJt
X2Zyb250LmMKQEAgLTcxOCwxNyArNzE4LDkgQEAgc3RhdGljIGludCB4ZW5fZHJ2X3Byb2JlKHN0
cnVjdCB4ZW5idXNfZGV2aWNlICp4Yl9kZXYsCiAJc3RydWN0IGRldmljZSAqZGV2ID0gJnhiX2Rl
di0+ZGV2OwogCWludCByZXQ7CiAKLQkvKgotCSAqIFRoZSBkZXZpY2UgaXMgbm90IHNwYXduIGZy
b20gYSBkZXZpY2UgdHJlZSwgc28gYXJjaF9zZXR1cF9kbWFfb3BzCi0JICogaXMgbm90IGNhbGxl
ZCwgdGh1cyBsZWF2aW5nIHRoZSBkZXZpY2Ugd2l0aCBkdW1teSBETUEgb3BzLgotCSAqIFRoaXMg
bWFrZXMgdGhlIGRldmljZSByZXR1cm4gZXJyb3Igb24gUFJJTUUgYnVmZmVyIGltcG9ydCwgd2hp
Y2gKLQkgKiBpcyBub3QgY29ycmVjdDogdG8gZml4IHRoaXMgY2FsbCBvZl9kbWFfY29uZmlndXJl
KCkgd2l0aCBhIE5VTEwKLQkgKiBub2RlIHRvIHNldCBkZWZhdWx0IERNQSBvcHMuCi0JICovCi0J
ZGV2LT5jb2hlcmVudF9kbWFfbWFzayA9IERNQV9CSVRfTUFTSygzMik7Ci0JcmV0ID0gb2ZfZG1h
X2NvbmZpZ3VyZShkZXYsIE5VTEwsIHRydWUpOworCXJldCA9IGRtYV9jb2VyY2VfbWFza19hbmRf
Y29oZXJlbnQoZGV2LCBETUFfQklUX01BU0soNjQpKTsKIAlpZiAocmV0IDwgMCkgewotCQlEUk1f
RVJST1IoIkNhbm5vdCBzZXR1cCBETUEgb3BzLCByZXQgJWQiLCByZXQpOworCQlEUk1fRVJST1Io
IkNhbm5vdCBzZXR1cCBETUEgbWFzaywgcmV0ICVkIiwgcmV0KTsKIAkJcmV0dXJuIHJldDsKIAl9
CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL2dudGRldi5jIGIvZHJpdmVycy94ZW4vZ250ZGV2
LmMKaW5kZXggYTQ0NmE3MjIxZTEzLi44MTQwMWYzODZjOWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
eGVuL2dudGRldi5jCisrKyBiL2RyaXZlcnMveGVuL2dudGRldi5jCkBAIC0yMiw2ICsyMiw3IEBA
CiAKICNkZWZpbmUgcHJfZm10KGZtdCkgInhlbjoiIEtCVUlMRF9NT0ROQU1FICI6ICIgZm10CiAK
KyNpbmNsdWRlIDxsaW51eC9kbWEtbWFwcGluZy5oPgogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5o
PgogI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgogI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4KQEAg
LTM0LDkgKzM1LDYgQEAKICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CiAjaW5jbHVkZSA8bGludXgv
aGlnaG1lbS5oPgogI2luY2x1ZGUgPGxpbnV4L3JlZmNvdW50Lmg+Ci0jaWZkZWYgQ09ORklHX1hF
Tl9HUkFOVF9ETUFfQUxMT0MKLSNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4KLSNlbmRpZgog
CiAjaW5jbHVkZSA8eGVuL3hlbi5oPgogI2luY2x1ZGUgPHhlbi9ncmFudF90YWJsZS5oPgpAQCAt
NjI1LDE0ICs2MjMsNyBAQCBzdGF0aWMgaW50IGdudGRldl9vcGVuKHN0cnVjdCBpbm9kZSAqaW5v
ZGUsIHN0cnVjdCBmaWxlICpmbGlwKQogCWZsaXAtPnByaXZhdGVfZGF0YSA9IHByaXY7CiAjaWZk
ZWYgQ09ORklHX1hFTl9HUkFOVF9ETUFfQUxMT0MKIAlwcml2LT5kbWFfZGV2ID0gZ250ZGV2X21p
c2NkZXYudGhpc19kZXZpY2U7Ci0KLQkvKgotCSAqIFRoZSBkZXZpY2UgaXMgbm90IHNwYXduIGZy
b20gYSBkZXZpY2UgdHJlZSwgc28gYXJjaF9zZXR1cF9kbWFfb3BzCi0JICogaXMgbm90IGNhbGxl
ZCwgdGh1cyBsZWF2aW5nIHRoZSBkZXZpY2Ugd2l0aCBkdW1teSBETUEgb3BzLgotCSAqIEZpeCB0
aGlzIGJ5IGNhbGxpbmcgb2ZfZG1hX2NvbmZpZ3VyZSgpIHdpdGggYSBOVUxMIG5vZGUgdG8gc2V0
Ci0JICogZGVmYXVsdCBETUEgb3BzLgotCSAqLwotCW9mX2RtYV9jb25maWd1cmUocHJpdi0+ZG1h
X2RldiwgTlVMTCwgdHJ1ZSk7CisJZG1hX2NvZXJjZV9tYXNrX2FuZF9jb2hlcmVudChwcml2LT5k
bWFfZGV2LCBETUFfQklUX01BU0soNjQpKTsKICNlbmRpZgogCXByX2RlYnVnKCJwcml2ICVwXG4i
LCBwcml2KTsKIAotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
