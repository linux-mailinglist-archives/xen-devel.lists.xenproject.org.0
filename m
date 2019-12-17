Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4337B12381D
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 21:57:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihJr9-0000hI-8T; Tue, 17 Dec 2019 20:54:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NvIJ=2H=umn.edu=pakki001@srs-us1.protection.inumbo.net>)
 id 1ihJr7-0000hD-Mx
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 20:54:09 +0000
X-Inumbo-ID: 59b3d9ca-210f-11ea-a1e1-bc764e2007e4
Received: from mta-p7.oit.umn.edu (unknown [134.84.196.207])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59b3d9ca-210f-11ea-a1e1-bc764e2007e4;
 Tue, 17 Dec 2019 20:54:00 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p7.oit.umn.edu (Postfix) with ESMTP id 47cr3D091Nz9vLGV
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2019 20:54:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jBcfM2gpgR21 for <xen-devel@lists.xenproject.org>;
 Tue, 17 Dec 2019 14:53:59 -0600 (CST)
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 47cr3C61SPz9vLGj
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2019 14:53:59 -0600 (CST)
Received: by mail-yb1-f198.google.com with SMTP id y204so7986663yby.18
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2019 12:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=knhSf+eyCdoX1uYdgnl9DAzGqM/zDzsAxGOMt75GOeY=;
 b=KW9uxdKVEE1cGboEmFPtl1bF+X0FhEtizkUnApethUm/LhLaZszjO3xBtQCAIuI1Ar
 2SK9l6JiGdphs8PEFxbVTQKAQwDAMzijOfUw5x+JwRfDC0O2cl0a5F8oG6ejZ1SW6zSp
 wabutn9GBBX35Wf0/fzS8xQx0FrLU4eRhy+S6/sd4As/7jaNgpHp6v8+h0eXo0fjxpXK
 h3TNpQsiC5U2tXb6B6bNEe1uKsFyO+HSBQSNyaaHaU5ZfeItF9bnUV/KcT4LyRMoueDM
 TK41NghYcTzCTo3hT5T68vg3M/V55K02wE8nLdtdqfhBmNvgBcObaDY+P8lfgJ4ITY2D
 3FIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=knhSf+eyCdoX1uYdgnl9DAzGqM/zDzsAxGOMt75GOeY=;
 b=OGGHVKk6Z3FoN3kZe+2QIEgCCeJKB9IWSYAz8WoRh12Z2OGoXgnmRRLys10sgxzn2L
 yLery2pY03+GHUkEiNmhZZB/LMVi+CDIewFMsjei0qAIvvdtQFtYMMSm5WpmaZXC3umU
 7sLcv2ouU5xPSMnPnjhocw8MiYXoVQVghIdC/jNEJVsT4biZgjSKSUtSmn9qa8HnRgUy
 Ikj6j89ZLfWg5jdiZpipSaFt8nXhKYnjn0mozqld3tAx+E3tdvLA3aBs+Z+Y7mQKt04J
 sxiE54D+SE3+ln9V5tDwD2/fALHmM6xpDEttjeaWEZlMH3PGjy5ulaFKJq37MJbA7sFA
 8Wuw==
X-Gm-Message-State: APjAAAXHeXKkj1/9Eu1QujWa0wKfOHqOsMv1DdU1kt2baAk9jc2P4q0g
 J93ziYMWDU0rlf7y3EZrYC8r7bUArAKvGOGGpmi2a1ks+kOIxaK6u7aI+qN/iDojbRPks3+8LF2
 0ggCixtJTXXK1fzJraQHuyrG78fj4wnc=
X-Received: by 2002:a25:dd04:: with SMTP id u4mr21884ybg.419.1576616039238;
 Tue, 17 Dec 2019 12:53:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqzgA5SI4ho9qhM2qkA9c0wLxK4/wVAABvXhm0AgOJCd5pQ/kuKS89YzxeQKtfbjs+EEsNCSGQ==
X-Received: by 2002:a25:dd04:: with SMTP id u4mr21862ybg.419.1576616039020;
 Tue, 17 Dec 2019 12:53:59 -0800 (PST)
Received: from cs-u-syssec1.dtc.umn.edu (cs-u-syssec1.cs.umn.edu.
 [128.101.106.66])
 by smtp.gmail.com with ESMTPSA id d143sm8500294ywb.51.2019.12.17.12.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 12:53:58 -0800 (PST)
From: Aditya Pakki <pakki001@umn.edu>
To: pakki001@umn.edu
Date: Tue, 17 Dec 2019 14:53:56 -0600
Message-Id: <20191217205356.29172-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] xen/grant-table: remove multiple BUG_ON on
 gnttab_interface
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
 Stefano Stabellini <sstabellini@kernel.org>, kjlu@umn.edu,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Z250dGFiX3JlcXVlc3RfdmVyc2lvbigpIGFsd2F5cyBzZXRzIHRoZSBnbnR0YWJfaW50ZXJmYWNl
IHZhcmlhYmxlCmFuZCB0aGUgYXNzZXJ0aW9ucyB0byBjaGVjayBmb3IgZW1wdHkgZ250dGFiX2lu
dGVyZmFjZSBpcyB1bm5lY2Vzc2FyeS4KVGhlIHBhdGNoIGVsaW1pbmF0ZXMgbXVsdGlwbGUgc3Vj
aCBhc3NlcnRpb25zLgoKU2lnbmVkLW9mZi1ieTogQWRpdHlhIFBha2tpIDxwYWtraTAwMUB1bW4u
ZWR1PgotLS0KdjE6IEVsaW1pbmF0ZSBtb3JlIEJVR19PTiBjYWxscywgYXMgc3VnZ2VzdGVkIGJ5
IEp1ZXJnZW4gR3Jvc3MuCi0tLQogZHJpdmVycy94ZW4vZ3JhbnQtdGFibGUuYyB8IDQgLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4v
Z3JhbnQtdGFibGUuYyBiL2RyaXZlcnMveGVuL2dyYW50LXRhYmxlLmMKaW5kZXggNDliMzgxZTEw
NGVmLi43YjM2YjUxY2RiOWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL2dyYW50LXRhYmxlLmMK
KysrIGIvZHJpdmVycy94ZW4vZ3JhbnQtdGFibGUuYwpAQCAtNjY0LDcgKzY2NCw2IEBAIHN0YXRp
YyBpbnQgZ3Jvd19nbnR0YWJfbGlzdCh1bnNpZ25lZCBpbnQgbW9yZV9mcmFtZXMpCiAJdW5zaWdu
ZWQgaW50IG5yX2dsaXN0X2ZyYW1lcywgbmV3X25yX2dsaXN0X2ZyYW1lczsKIAl1bnNpZ25lZCBp
bnQgZ3JlZnNfcGVyX2ZyYW1lOwogCi0JQlVHX09OKGdudHRhYl9pbnRlcmZhY2UgPT0gTlVMTCk7
CiAJZ3JlZnNfcGVyX2ZyYW1lID0gZ250dGFiX2ludGVyZmFjZS0+Z3JlZnNfcGVyX2dyYW50X2Zy
YW1lOwogCiAJbmV3X25yX2dyYW50X2ZyYW1lcyA9IG5yX2dyYW50X2ZyYW1lcyArIG1vcmVfZnJh
bWVzOwpAQCAtMTE2MCw3ICsxMTU5LDYgQEAgRVhQT1JUX1NZTUJPTF9HUEwoZ250dGFiX3VubWFw
X3JlZnNfc3luYyk7CiAKIHN0YXRpYyB1bnNpZ25lZCBpbnQgbnJfc3RhdHVzX2ZyYW1lcyh1bnNp
Z25lZCBpbnQgbnJfZ3JhbnRfZnJhbWVzKQogewotCUJVR19PTihnbnR0YWJfaW50ZXJmYWNlID09
IE5VTEwpOwogCXJldHVybiBnbnR0YWJfZnJhbWVzKG5yX2dyYW50X2ZyYW1lcywgU1BQKTsKIH0K
IApAQCAtMTM4OCw3ICsxMzg2LDYgQEAgc3RhdGljIGludCBnbnR0YWJfZXhwYW5kKHVuc2lnbmVk
IGludCByZXFfZW50cmllcykKIAlpbnQgcmM7CiAJdW5zaWduZWQgaW50IGN1ciwgZXh0cmE7CiAK
LQlCVUdfT04oZ250dGFiX2ludGVyZmFjZSA9PSBOVUxMKTsKIAljdXIgPSBucl9ncmFudF9mcmFt
ZXM7CiAJZXh0cmEgPSAoKHJlcV9lbnRyaWVzICsgZ250dGFiX2ludGVyZmFjZS0+Z3JlZnNfcGVy
X2dyYW50X2ZyYW1lIC0gMSkgLwogCQkgZ250dGFiX2ludGVyZmFjZS0+Z3JlZnNfcGVyX2dyYW50
X2ZyYW1lKTsKQEAgLTE0MjMsNyArMTQyMCw2IEBAIGludCBnbnR0YWJfaW5pdCh2b2lkKQogCS8q
IERldGVybWluZSB0aGUgbWF4aW11bSBudW1iZXIgb2YgZnJhbWVzIHJlcXVpcmVkIGZvciB0aGUK
IAkgKiBncmFudCByZWZlcmVuY2UgZnJlZSBsaXN0IG9uIHRoZSBjdXJyZW50IGh5cGVydmlzb3Iu
CiAJICovCi0JQlVHX09OKGdudHRhYl9pbnRlcmZhY2UgPT0gTlVMTCk7CiAJbWF4X25yX2dsaXN0
X2ZyYW1lcyA9IChtYXhfbnJfZ3JhbnRfZnJhbWVzICoKIAkJCSAgICAgICBnbnR0YWJfaW50ZXJm
YWNlLT5ncmVmc19wZXJfZ3JhbnRfZnJhbWUgLyBSUFApOwogCi0tIAoyLjIwLjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
