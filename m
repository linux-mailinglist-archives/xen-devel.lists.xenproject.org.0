Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F87F11BB36
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 19:15:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if6Rk-0000BT-1q; Wed, 11 Dec 2019 18:10:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qa45=2B=gmail.com=sj38.park@srs-us1.protection.inumbo.net>)
 id 1if6Ri-0000BL-LI
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 18:10:46 +0000
X-Inumbo-ID: 8d376492-1c41-11ea-a914-bc764e2007e4
Received: from mail-pj1-x1043.google.com (unknown [2607:f8b0:4864:20::1043])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d376492-1c41-11ea-a914-bc764e2007e4;
 Wed, 11 Dec 2019 18:10:45 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id o11so9222492pjp.9
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2019 10:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=CBFLhKYtbh2VNxkOJ2giC+Rjy+sK84fG3vM0BZU3YDk=;
 b=QMcrM/a96I5Df0ev6kPioTowBPg7nQtSm25XTPzV65EE/zQ3OmHVEy0LDH1zwUwlEL
 WocnaZHNhWvI505kCWkRM7qEqPoSCuxqWy3L4IZTn/VBcOAE0s9oWz//mECw6uFQSqv7
 Vkg5IamM1U2zAwps7yvMkYYeY92CEHV/n0FqAfsU9bCe762GpCg1cnhPn2bTXCdoUz0X
 R/YEMYmM2MnLsL+akDxFpEOhsLzlzPFVL5pIUjmfzT+3xv12DgEKrQWVnW6RfDDltrhn
 U6Ifr4h64BP5I7iuey/Qnxead+Q+Gwh8m0qZddJNc543r4mdPM3cR6Hxq3P2AaRPx6CD
 +u+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=CBFLhKYtbh2VNxkOJ2giC+Rjy+sK84fG3vM0BZU3YDk=;
 b=YEhP2u6wEw5nvlWHJagwarY+UoxFO0stWW8E45ACYZu4n2gZh0TL6Nb4XYON9lryGr
 EA1WG+wRxRsjuZOhjlzOnXAO4adedP/iAPxR7tfScCQZlnVuR1MoxfZkYH2MamXDiWbo
 si3JcFV6ohA1V9J2lgdz5K0Ye5uAR4NjuXV42ii19OurXqmRyzaG7vVL5CeEZBEKNMB8
 blP+KjjEBRVLMcFXO6QeKkbOMMPw9Eiyj0ESlOtIjfn6XDik+D5JH9bTiOta2+ZOFlxA
 U46EpCAmxrYfqUFWCCOvz6v1a8kty7ZGUVT1p++KVDuXfNnAwOoQc7ExDPMUPEJjwlej
 Wlng==
X-Gm-Message-State: APjAAAUU9qZzq+ODUqrY8TR88YKJqCPofZ8PaB3bFY+oydcv2w09cf3A
 hPx1ZFOh8DQ5b9lXrxw4MsM=
X-Google-Smtp-Source: APXvYqz35OSt4NjHe0So4NySEyGwPj/l9mTgQdCNzqEjQgdPCD/iwfZ5caUyI2FonkHxWKhbHyr5Sw==
X-Received: by 2002:a17:902:d907:: with SMTP id
 c7mr4778687plz.40.1576087845001; 
 Wed, 11 Dec 2019 10:10:45 -0800 (PST)
Received: from localhost.localdomain (campus-094-212.ucdavis.edu.
 [168.150.94.212])
 by smtp.gmail.com with ESMTPSA id x33sm3552651pga.86.2019.12.11.10.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 10:10:44 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
X-Google-Original-From: SeongJae Park <sjpark@amazon.de>
To: jgross@suse.com,
	axboe@kernel.dk,
	konrad.wilk@oracle.com
Date: Wed, 11 Dec 2019 18:10:14 +0000
Message-Id: <20191211181016.14366-2-sjpark@amazon.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191211181016.14366-1-sjpark@amazon.de>
References: <20191211181016.14366-1-sjpark@amazon.de>
Subject: [Xen-devel] [PATCH v7 1/3] xenbus/backend: Add memory pressure
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
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+ClNpZ25lZC1vZmYtYnk6IFNlb25n
SmFlIFBhcmsgPHNqcGFya0BhbWF6b24uZGU+Ci0tLQogZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1
c19wcm9iZV9iYWNrZW5kLmMgfCAzMiArKysrKysrKysrKysrKysrKysrKysrKwogaW5jbHVkZS94
ZW4veGVuYnVzLmggICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQs
IDMzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVz
X3Byb2JlX2JhY2tlbmQuYyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmVfYmFja2Vu
ZC5jCmluZGV4IGIwYmVkNGZhZjQ0Yy4uN2U3OGViZWY3YzU0IDEwMDY0NAotLS0gYS9kcml2ZXJz
L3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2JhY2tlbmQuYworKysgYi9kcml2ZXJzL3hlbi94ZW5i
dXMveGVuYnVzX3Byb2JlX2JhY2tlbmQuYwpAQCAtMjQ4LDYgKzI0OCwzNSBAQCBzdGF0aWMgaW50
IGJhY2tlbmRfcHJvYmVfYW5kX3dhdGNoKHN0cnVjdCBub3RpZmllcl9ibG9jayAqbm90aWZpZXIs
CiAJcmV0dXJuIE5PVElGWV9ET05FOwogfQogCitzdGF0aWMgaW50IGJhY2tlbmRfcmVjbGFpbV9t
ZW1vcnkoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhKQoreworCWNvbnN0IHN0cnVjdCB4
ZW5idXNfZHJpdmVyICpkcnY7CisKKwlpZiAoIWRldi0+ZHJpdmVyKQorCQlyZXR1cm4gMDsKKwlk
cnYgPSB0b194ZW5idXNfZHJpdmVyKGRldi0+ZHJpdmVyKTsKKwlpZiAoZHJ2ICYmIGRydi0+cmVj
bGFpbV9tZW1vcnkpCisJCWRydi0+cmVjbGFpbV9tZW1vcnkodG9feGVuYnVzX2RldmljZShkZXYp
KTsKKwlyZXR1cm4gMDsKK30KKworLyoKKyAqIFJldHVybnMgMCBhbHdheXMgYmVjYXVzZSB3ZSBh
cmUgdXNpbmcgc2hyaW5rZXIgdG8gb25seSBkZXRlY3QgbWVtb3J5CisgKiBwcmVzc3VyZS4KKyAq
Lworc3RhdGljIHVuc2lnbmVkIGxvbmcgYmFja2VuZF9zaHJpbmtfbWVtb3J5X2NvdW50KHN0cnVj
dCBzaHJpbmtlciAqc2hyaW5rZXIsCisJCQkJc3RydWN0IHNocmlua19jb250cm9sICpzYykKK3sK
KwlidXNfZm9yX2VhY2hfZGV2KCZ4ZW5idXNfYmFja2VuZC5idXMsIE5VTEwsIE5VTEwsCisJCQli
YWNrZW5kX3JlY2xhaW1fbWVtb3J5KTsKKwlyZXR1cm4gMDsKK30KKworc3RhdGljIHN0cnVjdCBz
aHJpbmtlciBiYWNrZW5kX21lbW9yeV9zaHJpbmtlciA9IHsKKwkuY291bnRfb2JqZWN0cyA9IGJh
Y2tlbmRfc2hyaW5rX21lbW9yeV9jb3VudCwKKwkuc2Vla3MgPSBERUZBVUxUX1NFRUtTLAorfTsK
Kwogc3RhdGljIGludCBfX2luaXQgeGVuYnVzX3Byb2JlX2JhY2tlbmRfaW5pdCh2b2lkKQogewog
CXN0YXRpYyBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgeGVuc3RvcmVfbm90aWZpZXIgPSB7CkBAIC0y
NjQsNiArMjkzLDkgQEAgc3RhdGljIGludCBfX2luaXQgeGVuYnVzX3Byb2JlX2JhY2tlbmRfaW5p
dCh2b2lkKQogCiAJcmVnaXN0ZXJfeGVuc3RvcmVfbm90aWZpZXIoJnhlbnN0b3JlX25vdGlmaWVy
KTsKIAorCWlmIChyZWdpc3Rlcl9zaHJpbmtlcigmYmFja2VuZF9tZW1vcnlfc2hyaW5rZXIpKQor
CQlwcl93YXJuKCJzaHJpbmtlciByZWdpc3RyYXRpb24gZmFpbGVkXG4iKTsKKwogCXJldHVybiAw
OwogfQogc3Vic3lzX2luaXRjYWxsKHhlbmJ1c19wcm9iZV9iYWNrZW5kX2luaXQpOwpkaWZmIC0t
Z2l0IGEvaW5jbHVkZS94ZW4veGVuYnVzLmggYi9pbmNsdWRlL3hlbi94ZW5idXMuaAppbmRleCA4
NjljODE2ZDVmOGMuLmM4NjFjZmI2ZjcyMCAxMDA2NDQKLS0tIGEvaW5jbHVkZS94ZW4veGVuYnVz
LmgKKysrIGIvaW5jbHVkZS94ZW4veGVuYnVzLmgKQEAgLTEwNCw2ICsxMDQsNyBAQCBzdHJ1Y3Qg
eGVuYnVzX2RyaXZlciB7CiAJc3RydWN0IGRldmljZV9kcml2ZXIgZHJpdmVyOwogCWludCAoKnJl
YWRfb3RoZXJlbmRfZGV0YWlscykoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldik7CiAJaW50ICgq
aXNfcmVhZHkpKHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYpOworCXZvaWQgKCpyZWNsYWltX21l
bW9yeSkoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldik7CiB9OwogCiBzdGF0aWMgaW5saW5lIHN0
cnVjdCB4ZW5idXNfZHJpdmVyICp0b194ZW5idXNfZHJpdmVyKHN0cnVjdCBkZXZpY2VfZHJpdmVy
ICpkcnYpCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
