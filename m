Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE1718EA33
	for <lists+xen-devel@lfdr.de>; Sun, 22 Mar 2020 17:17:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jG3FY-0004pn-LM; Sun, 22 Mar 2020 16:14:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0EiK=5H=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jG3FX-0004oq-Fx
 for xen-devel@lists.xenproject.org; Sun, 22 Mar 2020 16:14:55 +0000
X-Inumbo-ID: 3b2d69e6-6c58-11ea-b34e-bc764e2007e4
Received: from mail-ed1-f65.google.com (unknown [209.85.208.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b2d69e6-6c58-11ea-b34e-bc764e2007e4;
 Sun, 22 Mar 2020 16:14:39 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id z65so13537431ede.0
 for <xen-devel@lists.xenproject.org>; Sun, 22 Mar 2020 09:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=klK9FdE2K1lUNI+mLYUEqRnbc1iAOenHTFOoesGJIXc=;
 b=bnY3Mp3NCu8lRY4LGX0L31v31DBOnTr+m4DsfJxqr2bKryyG57nZ43jLaiclNSGM90
 gXhtKja6NQF/6F6694TpEfIISOjLTcWUVRuxul/JWUCTmaeATVxczQggEHlH5Of6+Fsv
 fQOXdvecnD0DQwNvoOa7CW75IMcxgQeh/zOy4UYKYCkt2GI6WHyqQjPk77n9b7SAeDcU
 B8U5NPI/3YwCTH8n1AjdzXXZqcfQs4qvgnTj0bothvE+7wIqhf74ev/4u2HACiCoFMet
 Bi2Am0Egfn4rI5JpRVcer2vwaObRQOZOj87KMxpt3+o00kuAJDzmXJeSuyjbK/wnSlV8
 kDsg==
X-Gm-Message-State: ANhLgQ2EYWwNrtr7F3E6uXw0PFawSxli7BdLjg0kr/wV+awyoUynZg4B
 c8sCtvkKZlNIkIKnDfcKNu93cEprCzhebA==
X-Google-Smtp-Source: ADFU+vuUpOX1gSnROav2FUOZMUb+kId6Pc0sBLXjVopEjrCPInAdWcNh/jQ+8rbjIHyOA9qDj3UleA==
X-Received: by 2002:a17:906:32d8:: with SMTP id k24mr92782ejk.2.1584893678743; 
 Sun, 22 Mar 2020 09:14:38 -0700 (PDT)
Received: from ufe34d9ed68d054.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id v13sm106693edj.62.2020.03.22.09.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 09:14:38 -0700 (PDT)
From: julien@xen.org
To: xen-devel@lists.xenproject.org
Date: Sun, 22 Mar 2020 16:14:15 +0000
Message-Id: <20200322161418.31606-15-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200322161418.31606-1-julien@xen.org>
References: <20200322161418.31606-1-julien@xen.org>
Subject: [Xen-devel] [PATCH 14/17] xen/x86: mm: Re-implement
 set_gpfn_from_mfn() as a static inline function
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCnNldF9ncGZuX2Zyb21f
bWZuKCkgaXMgY3VycmVudGx5IGltcGxlbWVudCBpbiBhIDIgcGFydCBtYWNyb3MuIFRoZQpzZWNv
bmQgbWFjcm8gaXMgb25seSBjYWxsZWQgd2l0aGluIHRoZSBmaXJzdCBtYWNybywgc28gdGhleSBj
YW4gYmUKZm9sZGVkIHRvZ2V0aGVyLgoKRnVydGhlcm1vcmUsIHRoaXMgaXMgbm93IGNvbnZlcnRl
ZCB0byBhIHN0YXRpYyBpbmxpbmUgbWFraW5nIHRoZSBjb2RlCm1vcmUgcmVhZGFibGUgYW5kIHNh
ZmVyLgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4K
Ci0tLQoKICAgIFRoaXMgd2FzIG9yaWdpbmFsbHkgc2VudCBhcyBwYXJ0IG9mICJ4ZW4vYXJtOiBQ
cm9wZXJseSBkaXNhYmxlIE0yUAogICAgb24gQXJtIiBbMV0uCgogICAgQ2hhbmdlcyBzaW5jZSB0
aGUgb3JpZ2luYWwgdmVyc2lvbjoKICAgICAgICAtIFJlbW92ZSB0aGUgcGFyYWdyYXBoIGluIHRo
ZSBjb21tZW50IGFib3V0IGRvbV8qIGFzIHdlIGRvbid0CiAgICAgICAgICBuZWVkIHRvIG1vdmUg
dGhlbSBhbnltb3JlLgogICAgICAgIC0gQ29uc3RpZnkgJ2QnIGFzIGl0IGlzIG5ldmVyIG1vZGlm
aWVkIHdpdGhpbiB0aGUgZnVuY3Rpb24KCiAgICBbMV0gPDIwMTkwNjAzMTYwMzUwLjI5ODA2LTEt
anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oIHwgMjUg
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMo
KyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0u
aCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaAppbmRleCA4MzA1OGZiOGQxLi41M2YyZWQ3Yzdk
IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L21tLmgKKysrIGIveGVuL2luY2x1ZGUv
YXNtLXg4Ni9tbS5oCkBAIC00OTMsMjQgKzQ5MywyNSBAQCBleHRlcm4gcGFkZHJfdCBtZW1faG90
cGx1ZzsKICNkZWZpbmUgU0hBUkVEX00yUChfZSkgICAgICAgICAgICgoX2UpID09IFNIQVJFRF9N
MlBfRU5UUlkpCiAKICNkZWZpbmUgY29tcGF0X21hY2hpbmVfdG9fcGh5c19tYXBwaW5nICgodW5z
aWduZWQgaW50ICopUkRXUl9DT01QQVRfTVBUX1ZJUlRfU1RBUlQpCi0jZGVmaW5lIF9zZXRfZ3Bm
bl9mcm9tX21mbihtZm4sIHBmbikgKHsgICAgICAgICAgICAgICAgICAgICAgICBcCi0gICAgc3Ry
dWN0IGRvbWFpbiAqZCA9IHBhZ2VfZ2V0X293bmVyKG1mbl90b19wYWdlKF9tZm4obWZuKSkpOyBc
Ci0gICAgdW5zaWduZWQgbG9uZyBlbnRyeSA9IChkICYmIChkID09IGRvbV9jb3cpKSA/ICAgICAg
ICAgICAgICBcCi0gICAgICAgIFNIQVJFRF9NMlBfRU5UUlkgOiAocGZuKTsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCi0gICAgKCh2b2lkKSgobWZuKSA+PSAoUkRXUl9DT01QQVRfTVBU
X1ZJUlRfRU5EIC0gUkRXUl9DT01QQVRfTVBUX1ZJUlRfU1RBUlQpIC8gNCB8fCBcCi0gICAgICAg
ICAgICAoY29tcGF0X21hY2hpbmVfdG9fcGh5c19tYXBwaW5nWyhtZm4pXSA9ICh1bnNpZ25lZCBp
bnQpKGVudHJ5KSkpLCBcCi0gICAgIG1hY2hpbmVfdG9fcGh5c19tYXBwaW5nWyhtZm4pXSA9IChl
bnRyeSkpOyAgICAgICAgICAgICAgICBcCi0gICAgfSkKIAogLyoKICAqIERpc2FibGUgc29tZSB1
c2VycyBvZiBzZXRfZ3Bmbl9mcm9tX21mbigpIChlLmcuLCBmcmVlX2hlYXBfcGFnZXMoKSkgdW50
aWwKICAqIHRoZSBtYWNoaW5lX3RvX3BoeXNfbWFwcGluZyBpcyBhY3R1YWxseSBzZXQgdXAuCiAg
Ki8KIGV4dGVybiBib29sIG1hY2hpbmVfdG9fcGh5c19tYXBwaW5nX3ZhbGlkOwotI2RlZmluZSBz
ZXRfZ3Bmbl9mcm9tX21mbihtZm4sIHBmbikgZG8geyAgICAgICAgXAotICAgIGlmICggbWFjaGlu
ZV90b19waHlzX21hcHBpbmdfdmFsaWQgKSAgICAgICAgXAotICAgICAgICBfc2V0X2dwZm5fZnJv
bV9tZm4obWZuLCBwZm4pOyAgICAgICAgICAgXAotfSB3aGlsZSAoMCkKKworc3RhdGljIGlubGlu
ZSB2b2lkIHNldF9ncGZuX2Zyb21fbWZuKHVuc2lnbmVkIGxvbmcgbWZuLCB1bnNpZ25lZCBsb25n
IHBmbikKK3sKKyAgICBjb25zdCBzdHJ1Y3QgZG9tYWluICpkID0gcGFnZV9nZXRfb3duZXIobWZu
X3RvX3BhZ2UoX21mbihtZm4pKSk7CisgICAgdW5zaWduZWQgbG9uZyBlbnRyeSA9IChkICYmIChk
ID09IGRvbV9jb3cpKSA/IFNIQVJFRF9NMlBfRU5UUlkgOiBwZm47CisKKyAgICBpZiAoICFtYWNo
aW5lX3RvX3BoeXNfbWFwcGluZ192YWxpZCApCisgICAgICAgIHJldHVybjsKKworICAgIGlmICgg
bWZuIDwgKFJEV1JfQ09NUEFUX01QVF9WSVJUX0VORCAtIFJEV1JfQ09NUEFUX01QVF9WSVJUX1NU
QVJUKSAvIDQgKQorICAgICAgICBjb21wYXRfbWFjaGluZV90b19waHlzX21hcHBpbmdbbWZuXSA9
IGVudHJ5OworICAgIG1hY2hpbmVfdG9fcGh5c19tYXBwaW5nW21mbl0gPSBlbnRyeTsKK30KIAog
ZXh0ZXJuIHN0cnVjdCByYW5nZXNldCAqbW1pb19yb19yYW5nZXM7CiAKLS0gCjIuMTcuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
