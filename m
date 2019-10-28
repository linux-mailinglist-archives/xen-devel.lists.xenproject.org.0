Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D58B8E79CA
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 21:15:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPBMH-0001fQ-Qg; Mon, 28 Oct 2019 20:11:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nBLR=YV=ziepe.ca=jgg@srs-us1.protection.inumbo.net>)
 id 1iPBMG-0001f0-Ov
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 20:11:20 +0000
X-Inumbo-ID: 074866c8-f9bf-11e9-a531-bc764e2007e4
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 074866c8-f9bf-11e9-a531-bc764e2007e4;
 Mon, 28 Oct 2019 20:10:46 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id l3so5993786qtp.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2019 13:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XfZfiXb3zJ195gWPi/l/D27toKL96PSF+DrXZsTvCKc=;
 b=Vc58TGVq1lmjMY4eOa7KbtL6DEqVXlgPnJsOzrFIA+Kq+VIv+n8OiCivi4cUtamTnT
 1KYSo7v2A3a+ickTwHSH38kA5tGy8OuuNpGMwWxeSjiIUwF3+ru9o9EbSpkLUVe4ONKL
 vwoevPFvTqW4AXdpTwIwYVfG1lCs2EgIFUFFard0RfJWd72B2i5FrekyEo9dDa85D8eS
 IgS1EDvxvQkqOsgxFumEvEuegOpwLnX2TxR9uWKcEKPRRgLoUO9yKB4vsfjdqKaXA3Zr
 0ht0Y4lwbn51FabpNrQPAmMzXA34J6VR9wDC/ZusGDpxulAVuNULgD/MF+Wf668IbxSy
 16vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XfZfiXb3zJ195gWPi/l/D27toKL96PSF+DrXZsTvCKc=;
 b=hP80OHRSWlFC7uWVbcD5bmeGg8XzzaTTJQ1mWHwXk6/Xyt/Sjqe93uYH7m8dsf7/hR
 hQP1svGt6989sBzCRl1bKMchaNsDyzVgtuSd6MFugp4GtwZ9Wpl+4h8QEqFfOxt+3r+u
 4sckbEg8lvboVP0IX2xy+ubscV21Gwhk1MHSlyB0H7CpAoD7HSAFE+0rdIkAhUVOv6hs
 ihva1QeXT1Zf666PW/mV5nsC7KJAegihOCixSMnhDdYW+uoV2qj0lXil7IYzyVDIAAP3
 sZS44Rn2Vo3l4LpadkG18oIa7Hvl44Mcs30kTeFfrvK0VXeGKhnUakMLKZcgfy7dP/Zo
 IHbQ==
X-Gm-Message-State: APjAAAUIPjmsYrEPzH2ObsTkQE6GsrKjPfIJOA0GroBZ+oAMpJ2Un5Cv
 aTqbdeqPpIg/nT2rersl55HTQg==
X-Google-Smtp-Source: APXvYqyzwQd88COzKjNYUtUi77xt5inAXAbC04JrmAuM/rVN/+ea+Lu0JHPIt/2aFSc9iA4BmT0l3w==
X-Received: by 2002:ac8:3f67:: with SMTP id w36mr271020qtk.99.1572293446378;
 Mon, 28 Oct 2019 13:10:46 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id r7sm6375208qkf.124.2019.10.28.13.10.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Oct 2019 13:10:43 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iPBLf-0001gM-77; Mon, 28 Oct 2019 17:10:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Felix.Kuehling@amd.com
Date: Mon, 28 Oct 2019 17:10:21 -0300
Message-Id: <20191028201032.6352-5-jgg@ziepe.ca>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028201032.6352-1-jgg@ziepe.ca>
References: <20191028201032.6352-1-jgg@ziepe.ca>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 04/15] mm/hmm: define the pre-processor
 related parts of hmm.h even if disabled
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
Cc: Juergen Gross <jgross@suse.com>, David Zhou <David1.Zhou@amd.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-rdma@vger.kernel.org, nouveau@lists.freedesktop.org,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKT25seSB0aGUgZnVuY3Rp
b24gY2FsbHMgYXJlIHN0dWJiZWQgb3V0IHdpdGggc3RhdGljIGlubGluZXMgdGhhdCBhbHdheXMK
ZmFpbC4gVGhpcyBpcyB0aGUgc3RhbmRhcmQgd2F5IHRvIHdyaXRlIGEgaGVhZGVyIGZvciBhbiBv
cHRpb25hbCBjb21wb25lbnQKYW5kIG1ha2VzIGl0IGVhc2llciBmb3IgZHJpdmVycyB0aGF0IG9u
bHkgb3B0aW9uYWxseSBuZWVkIEhNTV9NSVJST1IuCgpSZXZpZXdlZC1ieTogSsOpcsO0bWUgR2xp
c3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8
amdnQG1lbGxhbm94LmNvbT4KLS0tCiBpbmNsdWRlL2xpbnV4L2htbS5oIHwgNTkgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tCiBrZXJuZWwvZm9yay5jICAgICAg
IHwgIDEgLQogMiBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2htbS5oIGIvaW5jbHVkZS9saW51eC9obW0u
aAppbmRleCA4YWMxZmQ2YTgxYWY4Zi4uMjY2NmViMDhhNDA2MTUgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvbGludXgvaG1tLmgKKysrIGIvaW5jbHVkZS9saW51eC9obW0uaApAQCAtNjIsOCArNjIsNiBA
QAogI2luY2x1ZGUgPGxpbnV4L2tjb25maWcuaD4KICNpbmNsdWRlIDxhc20vcGd0YWJsZS5oPgog
Ci0jaWZkZWYgQ09ORklHX0hNTV9NSVJST1IKLQogI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgog
I2luY2x1ZGUgPGxpbnV4L21pZ3JhdGUuaD4KICNpbmNsdWRlIDxsaW51eC9tZW1yZW1hcC5oPgpA
QCAtMzc0LDYgKzM3MiwxNSBAQCBzdHJ1Y3QgaG1tX21pcnJvciB7CiAJc3RydWN0IGxpc3RfaGVh
ZAkJbGlzdDsKIH07CiAKKy8qCisgKiBSZXRyeSBmYXVsdCBpZiBub24tYmxvY2tpbmcsIGRyb3Ag
bW1hcF9zZW0gYW5kIHJldHVybiAtRUFHQUlOIGluIHRoYXQgY2FzZS4KKyAqLworI2RlZmluZSBI
TU1fRkFVTFRfQUxMT1dfUkVUUlkJCSgxIDw8IDApCisKKy8qIERvbid0IGZhdWx0IGluIG1pc3Np
bmcgUFRFcywganVzdCBzbmFwc2hvdCB0aGUgY3VycmVudCBzdGF0ZS4gKi8KKyNkZWZpbmUgSE1N
X0ZBVUxUX1NOQVBTSE9UCQkoMSA8PCAxKQorCisjaWZkZWYgQ09ORklHX0hNTV9NSVJST1IKIGlu
dCBobW1fbWlycm9yX3JlZ2lzdGVyKHN0cnVjdCBobW1fbWlycm9yICptaXJyb3IsIHN0cnVjdCBt
bV9zdHJ1Y3QgKm1tKTsKIHZvaWQgaG1tX21pcnJvcl91bnJlZ2lzdGVyKHN0cnVjdCBobW1fbWly
cm9yICptaXJyb3IpOwogCkBAIC0zODMsMTQgKzM5MCw2IEBAIHZvaWQgaG1tX21pcnJvcl91bnJl
Z2lzdGVyKHN0cnVjdCBobW1fbWlycm9yICptaXJyb3IpOwogaW50IGhtbV9yYW5nZV9yZWdpc3Rl
cihzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwgc3RydWN0IGhtbV9taXJyb3IgKm1pcnJvcik7CiB2
b2lkIGhtbV9yYW5nZV91bnJlZ2lzdGVyKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlKTsKIAotLyoK
LSAqIFJldHJ5IGZhdWx0IGlmIG5vbi1ibG9ja2luZywgZHJvcCBtbWFwX3NlbSBhbmQgcmV0dXJu
IC1FQUdBSU4gaW4gdGhhdCBjYXNlLgotICovCi0jZGVmaW5lIEhNTV9GQVVMVF9BTExPV19SRVRS
WQkJKDEgPDwgMCkKLQotLyogRG9uJ3QgZmF1bHQgaW4gbWlzc2luZyBQVEVzLCBqdXN0IHNuYXBz
aG90IHRoZSBjdXJyZW50IHN0YXRlLiAqLwotI2RlZmluZSBITU1fRkFVTFRfU05BUFNIT1QJCSgx
IDw8IDEpCi0KIGxvbmcgaG1tX3JhbmdlX2ZhdWx0KHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLCB1
bnNpZ25lZCBpbnQgZmxhZ3MpOwogCiBsb25nIGhtbV9yYW5nZV9kbWFfbWFwKHN0cnVjdCBobW1f
cmFuZ2UgKnJhbmdlLApAQCAtNDAxLDYgKzQwMCw0NCBAQCBsb25nIGhtbV9yYW5nZV9kbWFfdW5t
YXAoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsCiAJCQkgc3RydWN0IGRldmljZSAqZGV2aWNlLAog
CQkJIGRtYV9hZGRyX3QgKmRhZGRycywKIAkJCSBib29sIGRpcnR5KTsKKyNlbHNlCitpbnQgaG1t
X21pcnJvcl9yZWdpc3RlcihzdHJ1Y3QgaG1tX21pcnJvciAqbWlycm9yLCBzdHJ1Y3QgbW1fc3Ry
dWN0ICptbSkKK3sKKwlyZXR1cm4gLUVPUE5PVFNVUFA7Cit9CisKK3ZvaWQgaG1tX21pcnJvcl91
bnJlZ2lzdGVyKHN0cnVjdCBobW1fbWlycm9yICptaXJyb3IpCit7Cit9CisKK2ludCBobW1fcmFu
Z2VfcmVnaXN0ZXIoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsIHN0cnVjdCBobW1fbWlycm9yICpt
aXJyb3IpCit7CisJcmV0dXJuIC1FT1BOT1RTVVBQOworfQorCit2b2lkIGhtbV9yYW5nZV91bnJl
Z2lzdGVyKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlKQoreworfQorCitzdGF0aWMgaW5saW5lIGxv
bmcgaG1tX3JhbmdlX2ZhdWx0KHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLCB1bnNpZ25lZCBpbnQg
ZmxhZ3MpCit7CisJcmV0dXJuIC1FT1BOT1RTVVBQOworfQorCitzdGF0aWMgaW5saW5lIGxvbmcg
aG1tX3JhbmdlX2RtYV9tYXAoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsCisJCQkJICAgICBzdHJ1
Y3QgZGV2aWNlICpkZXZpY2UsIGRtYV9hZGRyX3QgKmRhZGRycywKKwkJCQkgICAgIHVuc2lnbmVk
IGludCBmbGFncykKK3sKKwlyZXR1cm4gLUVPUE5PVFNVUFA7Cit9CisKK3N0YXRpYyBpbmxpbmUg
bG9uZyBobW1fcmFuZ2VfZG1hX3VubWFwKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLAorCQkJCSAg
ICAgICBzdHJ1Y3QgZGV2aWNlICpkZXZpY2UsCisJCQkJICAgICAgIGRtYV9hZGRyX3QgKmRhZGRy
cywgYm9vbCBkaXJ0eSkKK3sKKwlyZXR1cm4gLUVPUE5PVFNVUFA7Cit9CisjZW5kaWYKIAogLyoK
ICAqIEhNTV9SQU5HRV9ERUZBVUxUX1RJTUVPVVQgLSBkZWZhdWx0IHRpbWVvdXQgKG1zKSB3aGVu
IHdhaXRpbmcgZm9yIGEgcmFuZ2UKQEAgLTQxMSw2ICs0NDgsNCBAQCBsb25nIGhtbV9yYW5nZV9k
bWFfdW5tYXAoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsCiAgKi8KICNkZWZpbmUgSE1NX1JBTkdF
X0RFRkFVTFRfVElNRU9VVCAxMDAwCiAKLSNlbmRpZiAvKiBJU19FTkFCTEVEKENPTkZJR19ITU1f
TUlSUk9SKSAqLwotCiAjZW5kaWYgLyogTElOVVhfSE1NX0ggKi8KZGlmZiAtLWdpdCBhL2tlcm5l
bC9mb3JrLmMgYi9rZXJuZWwvZm9yay5jCmluZGV4IGY5NTcyZjQxNjEyNjI4Li40NTYxYTY1ZDE5
ZGI4OCAxMDA2NDQKLS0tIGEva2VybmVsL2ZvcmsuYworKysgYi9rZXJuZWwvZm9yay5jCkBAIC00
MCw3ICs0MCw2IEBACiAjaW5jbHVkZSA8bGludXgvYmluZm10cy5oPgogI2luY2x1ZGUgPGxpbnV4
L21tYW4uaD4KICNpbmNsdWRlIDxsaW51eC9tbXVfbm90aWZpZXIuaD4KLSNpbmNsdWRlIDxsaW51
eC9obW0uaD4KICNpbmNsdWRlIDxsaW51eC9mcy5oPgogI2luY2x1ZGUgPGxpbnV4L21tLmg+CiAj
aW5jbHVkZSA8bGludXgvdm1hY2FjaGUuaD4KLS0gCjIuMjMuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
