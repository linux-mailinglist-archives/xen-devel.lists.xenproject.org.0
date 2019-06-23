Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3C44FBB3
	for <lists+xen-devel@lfdr.de>; Sun, 23 Jun 2019 15:01:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hf23F-000672-9g; Sun, 23 Jun 2019 12:56:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+fKu=UW=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1hf23D-00066x-Pf
 for xen-devel@lists.xenproject.org; Sun, 23 Jun 2019 12:56:55 +0000
X-Inumbo-ID: 601f9eca-95b6-11e9-8980-bc764e045a96
Received: from mail-pf1-x444.google.com (unknown [2607:f8b0:4864:20::444])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 601f9eca-95b6-11e9-8980-bc764e045a96;
 Sun, 23 Jun 2019 12:56:54 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id r7so5961484pfl.3
 for <xen-devel@lists.xenproject.org>; Sun, 23 Jun 2019 05:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ZCeGcahujoVd3nyx1OqtQFGH4qBrJPCeRTzcnpoiFsk=;
 b=V/0QkVRKLV6YjT2NtDJ1q6NHWLekYdG4jLtVhBoxc66TeVMhshd+T1q5Tr8KD6HQ/O
 tkdvYHLTfydhWHy0RN4ruRlHUOQhMMlkSIZcYmYTrYfnGwigVZ7ds6Gydgo/+wk/0wa1
 aFJYblPzwODCFAjjs/g6hs02V/bK18Sr4MyIED/88Kc8YK+D8dS/B5OdUCleS8EwDKCR
 mVgvCcPGfEmWJUPbdyf++R53CSWNycmJcAszzok7/5/PnwMHpHfKHUCDQxKHuaj3jjUv
 khHLpMLLNfr/OeYV2md+ErNxAPK6+lXgZd5i3ch7pR0bsskrPHu05JacU+UbpTpkOyLm
 T+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ZCeGcahujoVd3nyx1OqtQFGH4qBrJPCeRTzcnpoiFsk=;
 b=QNHZbjDAceXgt9glz0YD/GhvXgLJLX/de+OKUOJDrDJw3pTjBDzSKEqE8pI8XXBKZZ
 fPd2RTfUY3e4NTV+ihNrDGcRODqew5XYUpmYqluof2idNdSJbPYEYDwZ2/4M9mwZt2MF
 qmn/MY5Xxfk5Ox2/sXZ9FK9h5GagPyBKrYy7t8GopPLhyDXBAuU9Sx0h/i48h5yZnGJj
 87WIxyGVS/eyVYlYdXJ2/qM15dZaUEi9/yBFs8YGyGCkXCrbYXMZuzeMIjN8wppcicZG
 4P/wxfPTO3xvDFpjF6PQdiF9cAfXarxvkZUF8RlW0nt44n1KSRa+We9w1JppZ6OuTcV0
 TBJQ==
X-Gm-Message-State: APjAAAWtIL8Sqr9X9RmaH6eYZvfg1dRWV4hTiwAnbuJfGyFYcyVQgE2r
 rIYHeo+EBM2prMcBInKOAQBlLJjF
X-Google-Smtp-Source: APXvYqwafA1QKByFAENVOhPoviKCwhk7XBXXxSENeaFi/pjny8iHwoxW66pt8M6d6Buwvuaw5GMTvw==
X-Received: by 2002:a17:90a:2385:: with SMTP id
 g5mr19078234pje.12.1561294613183; 
 Sun, 23 Jun 2019 05:56:53 -0700 (PDT)
Received: from localhost.localdomain ([223.179.152.0])
 by smtp.gmail.com with ESMTPSA id k3sm7712338pgo.81.2019.06.23.05.56.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 23 Jun 2019 05:56:52 -0700 (PDT)
From: Amit Singh Tomar <amittomer25@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Sun, 23 Jun 2019 18:26:31 +0530
Message-Id: <1561294591-14867-1-git-send-email-amittomer25@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [PATCH v3] xen/arm: domain_build: Black list devices
 using PPIs
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
Cc: andre.przywara@arm.com, julien.grall@arm.com, sstabellini@kernel.org,
 Amit Singh Tomar <amittomer25@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudGx5LCB0aGUgdkdJQyBpcyBub3QgYWJsZSB0byBjb3BlIHdpdGggaGFyZHdhcmUgUFBJ
cyByb3V0ZWQgdG8gZ3Vlc3RzLgpPbmUgb2YgdGhlIHNvbHV0aW9ucyB0byB0aGlzIHByb2JsZW0g
aXMgdG8gc2tpcCBhbnkgZGV2aWNlIHRoYXQgdXNlcyBQUEkKc291cmNlIGNvbXBsZXRlbHkgd2hp
bGUgYnVpbGRpbmcgdGhlIGRvbWFpbiBpdHNlbGYuCgpUaGlzIHBhdGNoIGdvZXMgdGhyb3VnaCBh
bGwgdGhlIGludGVycnVwdCBzb3VyY2VzIG9mIGEgZGV2aWNlIGFuZCBza2lwIGl0CmlmIG9uZSBv
ZiB0aGUgaW50ZXJydXB0cyBzb3VyY2VzIGlzIGEgUFBJLiBJdCBmaXhlcyBYRU4gYm9vdCBvbiBp
Lk1YOE1RIGJ5CnNraXBwaW5nIHRoZSBQTVUgbm9kZS4KClN1Z2dlc3RlZC1ieTogIEp1bGllbiBH
cmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+ClNpZ25lZC1vZmYtYnk6IEFtaXQgU2luZ2ggVG9t
YXIgPGFtaXR0b21lcjI1QGdtYWlsLmNvbT4KLS0tCkNoYW5nZXMgc2luY2UgdjI6CiAgICAqIFVw
ZGF0ZSBzdWJqZWN0LWxpbmUgZm9yIHRoZSBwYXRjaC4KICAgICogRml4IGNvbW1pdCBtZXNzYWdl
LgogICAgKiBBZGQgcHJvcGVyIGNvbW1lbnRzIGZvciBjaGFuZ2VzLgoKQ2hhbmdlcyBzaW5jZSB2
MToKICAgICogQWRkZWQgY29tbWVudCBmb3IgUFBJcyByYW5nZS4KLS0tCiB4ZW4vYXJjaC9hcm0v
ZG9tYWluX2J1aWxkLmMgfCAyMCArKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQs
IDE5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9h
cm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKaW5kZXggZDk4
MzY3Ny4uNTM5MzVmOCAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCisr
KyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwpAQCAtMTM1Myw3ICsxMzUzLDcgQEAgc3Rh
dGljIGludCBfX2luaXQgaGFuZGxlX25vZGUoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGtlcm5l
bF9pbmZvICpraW5mbywKICAgICAgICAgeyAvKiBzZW50aW5lbCAqLyB9LAogICAgIH07CiAgICAg
c3RydWN0IGR0X2RldmljZV9ub2RlICpjaGlsZDsKLSAgICBpbnQgcmVzOworICAgIGludCByZXMs
IGksIG5pcnEsIGlycV9pZDsKICAgICBjb25zdCBjaGFyICpuYW1lOwogICAgIGNvbnN0IGNoYXIg
KnBhdGg7CiAKQEAgLTE0MDAsNiArMTQwMCwyNCBAQCBzdGF0aWMgaW50IF9faW5pdCBoYW5kbGVf
bm9kZShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLAogICAgIH0K
IAogICAgIC8qCisgICAgICogVGhlIHZHSUMgZG9lcyBub3Qgc3VwcG9ydCByb3V0aW5nIGhhcmR3
YXJlIFBQSXMgdG8gZ3Vlc3QuIFNvCisgICAgICogd2UgbmVlZCB0byBza2lwIGFueSBub2RlIHVz
aW5nIFBQSXMuCisgICAgICovCisgICAgbmlycSA9IGR0X251bWJlcl9vZl9pcnEobm9kZSk7CisK
KyAgICBmb3IgKCBpID0gMCA7IGkgPCBuaXJxIDsgaSsrICkKKyAgICB7CisgICAgICAgIGlycV9p
ZCA9IHBsYXRmb3JtX2dldF9pcnEobm9kZSwgaSk7CisKKyAgICAgICAgLyogUFBJcyByYW5nZXMg
ZnJvbSBJRCAxNiB0byAzMSAqLworICAgICAgICBpZiAoIGlycV9pZCA+PSAxNiAmJiBpcnFfaWQg
PCAzMiApCisgICAgICAgIHsKKyAgICAgICAgICAgIGR0X2RwcmludGsoIiBTa2lwIGl0KHVzaW5n
IFBQSXMpXG4iKTsKKyAgICAgICAgICAgIHJldHVybiAwOworICAgICAgICB9CisgICAgfQorCisg
ICAgLyoKICAgICAgKiBYZW4gaXMgdXNpbmcgc29tZSBwYXRoIGZvciBpdHMgb3duIHB1cnBvc2Uu
IFdhcm4gaWYgYSBub2RlCiAgICAgICogYWxyZWFkeSBleGlzdHMgd2l0aCB0aGUgc2FtZSBwYXRo
LgogICAgICAqLwotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
