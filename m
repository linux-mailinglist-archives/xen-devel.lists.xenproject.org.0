Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5560111E443
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 14:04:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifkaj-0003VR-0W; Fri, 13 Dec 2019 13:02:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tyHa=2D=gmail.com=sj38.park@srs-us1.protection.inumbo.net>)
 id 1ifkah-0003VB-EK
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 13:02:43 +0000
X-Inumbo-ID: d9469836-1da8-11ea-b6f1-bc764e2007e4
Received: from mail-pj1-x1042.google.com (unknown [2607:f8b0:4864:20::1042])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9469836-1da8-11ea-b6f1-bc764e2007e4;
 Fri, 13 Dec 2019 13:02:42 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id ca19so1177848pjb.8
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2019 05:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pxUD+VmkH1xxeAkPK92Cf10G5edui36/X8Za7R/dfvU=;
 b=GPQHCu78Xrr1/A8JC4eIZflNvkPhPoIpyCbA1lUi7KEIi1tX/nXbPhKYzB1/tgT5dg
 hF7my/P3XQxI4B5TBnhiJeW5kYzjZlYY7dIHuGFzSFNT/IS6D0q51CCfCPROtMjzqoTw
 lHMCvZizgR+oxSHhMS0mu3DDiScOWpHwCevJ8qafgtsvOtf3+vACj5c7CCDNSWXjagSa
 bGJPMaGjJcjpupr9TXJEIJIReyOD6rY06JeczCa4RahX6gyimSg+H6+1fjLbhQJ2QQNd
 cRKEhUDEpDnW0ii97I+uPvLdgbvF74dwb6iQj83dofqtrbEfQ2IeiFzS9EwxANNEdNJa
 PsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pxUD+VmkH1xxeAkPK92Cf10G5edui36/X8Za7R/dfvU=;
 b=m89tiM4mqhC68VdrumkWgGkBfU/TSKSplc3/IZPFogZq4RpQ1NprfsdWqO8OI2IvUs
 BXEKg4ohw1Vkn3whDEIk0RBaMrQ9DV7Y+o0OYnI5ckb3bKR0B9CcFua/nrLdAjxYPOvV
 P0vJgXLNJCbeW/bGHePmwUw71pHmtH/XRA2JUn85hKj2EcFcugYmXewJUj75DB6cKxs6
 bT7PKeynaY2GDtk36hUzpEIniLafCIYqlLmbpTz7w+JeZbJ57EpVXascpfWEdBmZKqeT
 X29W6H+QOzwEbxZ0N6cSeFgwfplU27d9UJ0tu0aFPy1wYq7m9BkurS7KAMxEoLXBN6RL
 0Z5A==
X-Gm-Message-State: APjAAAWQVqE8O2uFIuRqNOh3mB6hIldYy12d4IEHGqUS43wIn/qT8n/2
 FTl9/uj2NI/CzVePH/VspZs=
X-Google-Smtp-Source: APXvYqxE/Ac2824bFf20oZ8b1DfKFM1E4WD0jgI8CVJA/sd5exSlCoqpGrIsLq6AGBPaXEwcjeHpxw==
X-Received: by 2002:a17:902:bd98:: with SMTP id
 q24mr13563102pls.78.1576242161936; 
 Fri, 13 Dec 2019 05:02:41 -0800 (PST)
Received: from localhost.localdomain ([12.176.148.120])
 by smtp.gmail.com with ESMTPSA id k3sm10872278pgc.3.2019.12.13.05.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 05:02:41 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
X-Google-Original-From: SeongJae Park <sjpark@amazon.de>
To: jgross@suse.com, axboe@kernel.dk, konrad.wilk@oracle.com,
 roger.pau@citrix.com
Date: Fri, 13 Dec 2019 13:02:09 +0000
Message-Id: <20191213130211.24011-2-sjpark@amazon.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213130211.24011-1-sjpark@amazon.de>
References: <20191213130211.24011-1-sjpark@amazon.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v8 1/3] xenbus/backend: Add memory pressure
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
Cc: linux-block@vger.kernel.org, sjpark@amazon.com, pdurrant@amazon.com,
 SeongJae Park <sjpark@amazon.de>, linux-kernel@vger.kernel.org,
 sj38.park@gmail.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R3JhbnRpbmcgcGFnZXMgY29uc3VtZXMgYmFja2VuZCBzeXN0ZW0gbWVtb3J5LiAgSW4gc3lzdGVt
cyBjb25maWd1cmVkCndpdGggaW5zdWZmaWNpZW50IHNwYXJlIG1lbW9yeSBmb3IgdGhvc2UgcGFn
ZXMsIGl0IGNhbiBjYXVzZSBhIG1lbW9yeQpwcmVzc3VyZSBzaXR1YXRpb24uICBIb3dldmVyLCBm
aW5kaW5nIHRoZSBvcHRpbWFsIGFtb3VudCBvZiB0aGUgc3BhcmUKbWVtb3J5IGlzIGNoYWxsZW5n
aW5nIGZvciBsYXJnZSBzeXN0ZW1zIGhhdmluZyBkeW5hbWljIHJlc291cmNlCnV0aWxpemF0aW9u
IHBhdHRlcm5zLiAgQWxzbywgc3VjaCBhIHN0YXRpYyBjb25maWd1cmF0aW9uIG1pZ2h0IGxhY2sK
ZmxleGliaWxpdHkuCgpUbyBtaXRpZ2F0ZSBzdWNoIHByb2JsZW1zLCB0aGlzIGNvbW1pdCBhZGRz
IGEgbWVtb3J5IHJlY2xhaW0gY2FsbGJhY2sgdG8KJ3hlbmJ1c19kcml2ZXInLiAgSWYgYSBtZW1v
cnkgcHJlc3N1cmUgaXMgZGV0ZWN0ZWQsICd4ZW5idXMnIHJlcXVlc3RzCmV2ZXJ5IGJhY2tlbmQg
ZHJpdmVyIHRvIHZvbHVuYXJpbHkgcmVsZWFzZSBpdHMgbWVtb3J5LgoKTm90ZSB0aGF0IGl0IHdv
dWxkIGJlIGFibGUgdG8gaW1wcm92ZSB0aGUgY2FsbGJhY2sgZmFjaWxpdHkgZm9yIG1vcmUKc29w
aGlzdGljYXRlZCBoYW5kbGluZ3Mgb2YgZ2VuZXJhbCBwcmVzc3VyZXMuICBGb3IgZXhhbXBsZSwg
aXQgd291bGQgYmUKcG9zc2libGUgdG8gbW9uaXRvciB0aGUgbWVtb3J5IGNvbnN1bXB0aW9uIG9m
IGVhY2ggZGV2aWNlIGFuZCBpc3N1ZSB0aGUKcmVsZWFzZSByZXF1ZXN0cyB0byBvbmx5IGRldmlj
ZXMgd2hpY2ggY2F1c2luZyB0aGUgcHJlc3N1cmUuICBBbHNvLCB0aGUKY2FsbGJhY2sgY291bGQg
YmUgZXh0ZW5kZWQgdG8gaGFuZGxlIG5vdCBvbmx5IG1lbW9yeSwgYnV0IGdlbmVyYWwKcmVzb3Vy
Y2VzLiAgTmV2ZXJ0aGVsZXNzLCB0aGlzIHZlcnNpb24gb2YgdGhlIGltcGxlbWVudGF0aW9uIGRl
ZmVycyBzdWNoCnNvcGhpc3RpY2F0ZWQgZ29hbHMgYXMgYSBmdXR1cmUgd29yay4KClJldmlld2Vk
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+ClJldmlld2VkLWJ5OiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KU2lnbmVkLW9mZi1ieTogU2VvbmdKYWUg
UGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KLS0tCiBkcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3By
b2JlX2JhY2tlbmQuYyB8IDMyICsrKysrKysrKysrKysrKysrKysrKysrCiBpbmNsdWRlL3hlbi94
ZW5idXMuaCAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMzMg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJv
YmVfYmFja2VuZC5jIGIvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZV9iYWNrZW5kLmMK
aW5kZXggYjBiZWQ0ZmFmNDRjLi43ZTc4ZWJlZjdjNTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVu
L3hlbmJ1cy94ZW5idXNfcHJvYmVfYmFja2VuZC5jCisrKyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94
ZW5idXNfcHJvYmVfYmFja2VuZC5jCkBAIC0yNDgsNiArMjQ4LDM1IEBAIHN0YXRpYyBpbnQgYmFj
a2VuZF9wcm9iZV9hbmRfd2F0Y2goc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpub3RpZmllciwKIAly
ZXR1cm4gTk9USUZZX0RPTkU7CiB9CiAKK3N0YXRpYyBpbnQgYmFja2VuZF9yZWNsYWltX21lbW9y
eShzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEpCit7CisJY29uc3Qgc3RydWN0IHhlbmJ1
c19kcml2ZXIgKmRydjsKKworCWlmICghZGV2LT5kcml2ZXIpCisJCXJldHVybiAwOworCWRydiA9
IHRvX3hlbmJ1c19kcml2ZXIoZGV2LT5kcml2ZXIpOworCWlmIChkcnYgJiYgZHJ2LT5yZWNsYWlt
X21lbW9yeSkKKwkJZHJ2LT5yZWNsYWltX21lbW9yeSh0b194ZW5idXNfZGV2aWNlKGRldikpOwor
CXJldHVybiAwOworfQorCisvKgorICogUmV0dXJucyAwIGFsd2F5cyBiZWNhdXNlIHdlIGFyZSB1
c2luZyBzaHJpbmtlciB0byBvbmx5IGRldGVjdCBtZW1vcnkKKyAqIHByZXNzdXJlLgorICovCitz
dGF0aWMgdW5zaWduZWQgbG9uZyBiYWNrZW5kX3Nocmlua19tZW1vcnlfY291bnQoc3RydWN0IHNo
cmlua2VyICpzaHJpbmtlciwKKwkJCQlzdHJ1Y3Qgc2hyaW5rX2NvbnRyb2wgKnNjKQoreworCWJ1
c19mb3JfZWFjaF9kZXYoJnhlbmJ1c19iYWNrZW5kLmJ1cywgTlVMTCwgTlVMTCwKKwkJCWJhY2tl
bmRfcmVjbGFpbV9tZW1vcnkpOworCXJldHVybiAwOworfQorCitzdGF0aWMgc3RydWN0IHNocmlu
a2VyIGJhY2tlbmRfbWVtb3J5X3Nocmlua2VyID0geworCS5jb3VudF9vYmplY3RzID0gYmFja2Vu
ZF9zaHJpbmtfbWVtb3J5X2NvdW50LAorCS5zZWVrcyA9IERFRkFVTFRfU0VFS1MsCit9OworCiBz
dGF0aWMgaW50IF9faW5pdCB4ZW5idXNfcHJvYmVfYmFja2VuZF9pbml0KHZvaWQpCiB7CiAJc3Rh
dGljIHN0cnVjdCBub3RpZmllcl9ibG9jayB4ZW5zdG9yZV9ub3RpZmllciA9IHsKQEAgLTI2NCw2
ICsyOTMsOSBAQCBzdGF0aWMgaW50IF9faW5pdCB4ZW5idXNfcHJvYmVfYmFja2VuZF9pbml0KHZv
aWQpCiAKIAlyZWdpc3Rlcl94ZW5zdG9yZV9ub3RpZmllcigmeGVuc3RvcmVfbm90aWZpZXIpOwog
CisJaWYgKHJlZ2lzdGVyX3Nocmlua2VyKCZiYWNrZW5kX21lbW9yeV9zaHJpbmtlcikpCisJCXBy
X3dhcm4oInNocmlua2VyIHJlZ2lzdHJhdGlvbiBmYWlsZWRcbiIpOworCiAJcmV0dXJuIDA7CiB9
CiBzdWJzeXNfaW5pdGNhbGwoeGVuYnVzX3Byb2JlX2JhY2tlbmRfaW5pdCk7CmRpZmYgLS1naXQg
YS9pbmNsdWRlL3hlbi94ZW5idXMuaCBiL2luY2x1ZGUveGVuL3hlbmJ1cy5oCmluZGV4IDg2OWM4
MTZkNWY4Yy4uYzg2MWNmYjZmNzIwIDEwMDY0NAotLS0gYS9pbmNsdWRlL3hlbi94ZW5idXMuaAor
KysgYi9pbmNsdWRlL3hlbi94ZW5idXMuaApAQCAtMTA0LDYgKzEwNCw3IEBAIHN0cnVjdCB4ZW5i
dXNfZHJpdmVyIHsKIAlzdHJ1Y3QgZGV2aWNlX2RyaXZlciBkcml2ZXI7CiAJaW50ICgqcmVhZF9v
dGhlcmVuZF9kZXRhaWxzKShzdHJ1Y3QgeGVuYnVzX2RldmljZSAqZGV2KTsKIAlpbnQgKCppc19y
ZWFkeSkoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldik7CisJdm9pZCAoKnJlY2xhaW1fbWVtb3J5
KShzdHJ1Y3QgeGVuYnVzX2RldmljZSAqZGV2KTsKIH07CiAKIHN0YXRpYyBpbmxpbmUgc3RydWN0
IHhlbmJ1c19kcml2ZXIgKnRvX3hlbmJ1c19kcml2ZXIoc3RydWN0IGRldmljZV9kcml2ZXIgKmRy
dikKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
