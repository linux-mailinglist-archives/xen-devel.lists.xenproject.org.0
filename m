Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBBE18EA20
	for <lists+xen-devel@lfdr.de>; Sun, 22 Mar 2020 17:16:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jG3F6-0004V2-MF; Sun, 22 Mar 2020 16:14:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0EiK=5H=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jG3F5-0004UB-82
 for xen-devel@lists.xenproject.org; Sun, 22 Mar 2020 16:14:27 +0000
X-Inumbo-ID: 332b1cad-6c58-11ea-8134-12813bfff9fa
Received: from mail-ed1-f65.google.com (unknown [209.85.208.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 332b1cad-6c58-11ea-8134-12813bfff9fa;
 Sun, 22 Mar 2020 16:14:26 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id z3so13446365edq.11
 for <xen-devel@lists.xenproject.org>; Sun, 22 Mar 2020 09:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QU5H42/aI1bJSwJ4GskPiooVWk39PG871znlVQQSh0c=;
 b=PZxb9wn6BhRKZnPaUCHgRXACr+Rya7vdCizihBQOc+J2XbUhdShgN3AcDwKRQD48Ze
 C/Ma4UBWtGYMPXxnB/ePDUvn8Qt2GqGgQSLCEHUQ+N7zZjUiePaQbDqOOXsGC9ml4wTo
 EgETpdeD/IwlX32M05FQt6rGZZ4Azsxafc19PxDzGLp+Qx8NbixNi4NxUTUd+Fiak4rT
 CHh/CWvMHikAP8vYiiPPx1R8B44l28PC3+csqXqh/Tt1AAQS23UAx0qK+CboCbiHqeSb
 UVPGa7KVFAhJppI944F87rsFliOuHYaYFdE4izhK/o9slg7n4n4skv9xEt/J6LidjIxl
 g1Lg==
X-Gm-Message-State: ANhLgQ3CXfOvQBAqQqOBda8FvoyVLEs8rwjTy3IrUgvg7hSqvsLUsMBT
 5hs14jXXpaX19RU0h4//fbieZW/+XSfwoA==
X-Google-Smtp-Source: ADFU+vvnV1cmI//55J09x/ur/fQwaz5bz5rmowQkTLWcZD37tm9EqIKP+5hb6m2VzPeiUeTKURA38w==
X-Received: by 2002:a05:6402:4cd:: with SMTP id
 n13mr17844074edw.240.1584893665706; 
 Sun, 22 Mar 2020 09:14:25 -0700 (PDT)
Received: from ufe34d9ed68d054.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id v13sm106693edj.62.2020.03.22.09.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 09:14:25 -0700 (PDT)
From: julien@xen.org
To: xen-devel@lists.xenproject.org
Date: Sun, 22 Mar 2020 16:14:03 +0000
Message-Id: <20200322161418.31606-3-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200322161418.31606-1-julien@xen.org>
References: <20200322161418.31606-1-julien@xen.org>
Subject: [Xen-devel] [PATCH 02/17] xen/x86_64: Convert do_page_walk() to use
 typesafe MFN
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
Cc: julien@xen.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KCk5vIGZ1bmN0aW9uYWwgY2hh
bmdlcyBpbnRlbmRlZC4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpv
bi5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jIHwgMjYgKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveDg2XzY0L21tLmMgYi94ZW4vYXJjaC94
ODYveDg2XzY0L21tLmMKaW5kZXggYjdjZTgzM2ZmYy4uMzUxNjQyM2JiMCAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYwpA
QCAtNDYsNyArNDYsNyBAQCBsMl9wZ2VudHJ5X3QgKmNvbXBhdF9pZGxlX3BnX3RhYmxlX2wyOwog
CiB2b2lkICpkb19wYWdlX3dhbGsoc3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGxvbmcgYWRkcikK
IHsKLSAgICB1bnNpZ25lZCBsb25nIG1mbiA9IHBhZ2V0YWJsZV9nZXRfcGZuKHYtPmFyY2guZ3Vl
c3RfdGFibGUpOworICAgIG1mbl90IG1mbiA9IHBhZ2V0YWJsZV9nZXRfbWZuKHYtPmFyY2guZ3Vl
c3RfdGFibGUpOwogICAgIGw0X3BnZW50cnlfdCBsNGUsICpsNHQ7CiAgICAgbDNfcGdlbnRyeV90
IGwzZSwgKmwzdDsKICAgICBsMl9wZ2VudHJ5X3QgbDJlLCAqbDJ0OwpAQCAtNTUsNyArNTUsNyBA
QCB2b2lkICpkb19wYWdlX3dhbGsoc3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGxvbmcgYWRkcikK
ICAgICBpZiAoICFpc19wdl92Y3B1KHYpIHx8ICFpc19jYW5vbmljYWxfYWRkcmVzcyhhZGRyKSAp
CiAgICAgICAgIHJldHVybiBOVUxMOwogCi0gICAgbDR0ID0gbWFwX2RvbWFpbl9wYWdlKF9tZm4o
bWZuKSk7CisgICAgbDR0ID0gbWFwX2RvbWFpbl9wYWdlKG1mbik7CiAgICAgbDRlID0gbDR0W2w0
X3RhYmxlX29mZnNldChhZGRyKV07CiAgICAgdW5tYXBfZG9tYWluX3BhZ2UobDR0KTsKICAgICBp
ZiAoICEobDRlX2dldF9mbGFncyhsNGUpICYgX1BBR0VfUFJFU0VOVCkgKQpAQCAtNjQsMzYgKzY0
LDM2IEBAIHZvaWQgKmRvX3BhZ2Vfd2FsayhzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgbG9uZyBh
ZGRyKQogICAgIGwzdCA9IG1hcF9sM3RfZnJvbV9sNGUobDRlKTsKICAgICBsM2UgPSBsM3RbbDNf
dGFibGVfb2Zmc2V0KGFkZHIpXTsKICAgICB1bm1hcF9kb21haW5fcGFnZShsM3QpOwotICAgIG1m
biA9IGwzZV9nZXRfcGZuKGwzZSk7Ci0gICAgaWYgKCAhKGwzZV9nZXRfZmxhZ3MobDNlKSAmIF9Q
QUdFX1BSRVNFTlQpIHx8ICFtZm5fdmFsaWQoX21mbihtZm4pKSApCisgICAgbWZuID0gbDNlX2dl
dF9tZm4obDNlKTsKKyAgICBpZiAoICEobDNlX2dldF9mbGFncyhsM2UpICYgX1BBR0VfUFJFU0VO
VCkgfHwgIW1mbl92YWxpZChtZm4pICkKICAgICAgICAgcmV0dXJuIE5VTEw7CiAgICAgaWYgKCAo
bDNlX2dldF9mbGFncyhsM2UpICYgX1BBR0VfUFNFKSApCiAgICAgewotICAgICAgICBtZm4gKz0g
UEZOX0RPV04oYWRkciAmICgoMVVMIDw8IEwzX1BBR0VUQUJMRV9TSElGVCkgLSAxKSk7CisgICAg
ICAgIG1mbiA9IG1mbl9hZGQobWZuLCBQRk5fRE9XTihhZGRyICYgKCgxVUwgPDwgTDNfUEFHRVRB
QkxFX1NISUZUKSAtIDEpKSk7CiAgICAgICAgIGdvdG8gcmV0OwogICAgIH0KIAotICAgIGwydCA9
IG1hcF9kb21haW5fcGFnZShfbWZuKG1mbikpOworICAgIGwydCA9IG1hcF9kb21haW5fcGFnZSht
Zm4pOwogICAgIGwyZSA9IGwydFtsMl90YWJsZV9vZmZzZXQoYWRkcildOwogICAgIHVubWFwX2Rv
bWFpbl9wYWdlKGwydCk7Ci0gICAgbWZuID0gbDJlX2dldF9wZm4obDJlKTsKLSAgICBpZiAoICEo
bDJlX2dldF9mbGFncyhsMmUpICYgX1BBR0VfUFJFU0VOVCkgfHwgIW1mbl92YWxpZChfbWZuKG1m
bikpICkKKyAgICBtZm4gPSBsMmVfZ2V0X21mbihsMmUpOworICAgIGlmICggIShsMmVfZ2V0X2Zs
YWdzKGwyZSkgJiBfUEFHRV9QUkVTRU5UKSB8fCAhbWZuX3ZhbGlkKG1mbikgKQogICAgICAgICBy
ZXR1cm4gTlVMTDsKICAgICBpZiAoIChsMmVfZ2V0X2ZsYWdzKGwyZSkgJiBfUEFHRV9QU0UpICkK
ICAgICB7Ci0gICAgICAgIG1mbiArPSBQRk5fRE9XTihhZGRyICYgKCgxVUwgPDwgTDJfUEFHRVRB
QkxFX1NISUZUKSAtIDEpKTsKKyAgICAgICAgbWZuID0gbWZuX2FkZChtZm4sIFBGTl9ET1dOKGFk
ZHIgJiAoKDFVTCA8PCBMMl9QQUdFVEFCTEVfU0hJRlQpIC0gMSkpKTsKICAgICAgICAgZ290byBy
ZXQ7CiAgICAgfQogCi0gICAgbDF0ID0gbWFwX2RvbWFpbl9wYWdlKF9tZm4obWZuKSk7CisgICAg
bDF0ID0gbWFwX2RvbWFpbl9wYWdlKG1mbik7CiAgICAgbDFlID0gbDF0W2wxX3RhYmxlX29mZnNl
dChhZGRyKV07CiAgICAgdW5tYXBfZG9tYWluX3BhZ2UobDF0KTsKLSAgICBtZm4gPSBsMWVfZ2V0
X3BmbihsMWUpOwotICAgIGlmICggIShsMWVfZ2V0X2ZsYWdzKGwxZSkgJiBfUEFHRV9QUkVTRU5U
KSB8fCAhbWZuX3ZhbGlkKF9tZm4obWZuKSkgKQorICAgIG1mbiA9IGwxZV9nZXRfbWZuKGwxZSk7
CisgICAgaWYgKCAhKGwxZV9nZXRfZmxhZ3MobDFlKSAmIF9QQUdFX1BSRVNFTlQpIHx8ICFtZm5f
dmFsaWQobWZuKSApCiAgICAgICAgIHJldHVybiBOVUxMOwogCiAgcmV0OgotICAgIHJldHVybiBt
YXBfZG9tYWluX3BhZ2UoX21mbihtZm4pKSArIChhZGRyICYgflBBR0VfTUFTSyk7CisgICAgcmV0
dXJuIG1hcF9kb21haW5fcGFnZShtZm4pICsgKGFkZHIgJiB+UEFHRV9NQVNLKTsKIH0KIAogLyoK
LS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
