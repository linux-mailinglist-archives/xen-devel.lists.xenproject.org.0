Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E42FA118D04
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 16:51:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iehkg-0003GR-L7; Tue, 10 Dec 2019 15:48:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A1/D=2A=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iehke-0003FW-SL
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 15:48:40 +0000
X-Inumbo-ID: 72e21ea8-1b64-11ea-88e7-bc764e2007e4
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72e21ea8-1b64-11ea-88e7-bc764e2007e4;
 Tue, 10 Dec 2019 15:48:02 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id d71so8822149qkc.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2019 07:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zeqavew/vY6f4t63gmA+rSSNtPJ2y+B2UxfgLhzHhUY=;
 b=EygbGrdkLsTEk84mPqLcTv0ZRFwnCJfn950cmfQS7JbKzUn/9cHW+fppSCNGF7xek0
 Bb9gDYey8ithsZAYGYV55EeJQcipgmee+ugZGBP9jZvd3+6wv98oa7FPdS25EKHhi02e
 Uyeq0Jvt216T8Lsd3RM2XWf/QnI+14Ehu0lDfTndkG1obPM0SBtHQCGtVEIF8NPT/ary
 AqSVSQMjp5sl7t2fghySRJV++bgtJxyBYA/m6uBWDVt3Uth7+qQVZrw4RdWQG9AHrFrN
 5SRlKp2028GvIrso/6mOqCY8CcTMNfkC16t/ZxE3DMxFv76rS51djEY2aFhN2wNw2VUN
 mHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zeqavew/vY6f4t63gmA+rSSNtPJ2y+B2UxfgLhzHhUY=;
 b=SjRndx2HH8hHOSJHoAP/LE+b+fBaLthYVfw6ykFYjJMdgGBOpWhrg5CmA2Pm8ZLD9o
 SOkf+NjQqCH5qd1tSOqIQEgXD0aLuMki5RmU7m92Cgr7yEclpL42UN0hH9YN/nb+Moyq
 D0KyR8TwMvCHXzHhg1IWX1jUei7y9Dwh0Q5e+hV93P/xXJy47OwCk0GDcKF3vZU1hrHz
 VwVqV5HGLGp2+dSEBGCkT6gz7GQgzKDMLZjQgjZwxstc8nZLaypBwrb46EU9Z1LFpUw/
 8XPeRodlkbkc6Rb3xAvluOpTtWzCOLSq3++LueBHu0qjPnuBMayYJ2mtDOQ1+lW6KQtj
 RBgw==
X-Gm-Message-State: APjAAAU/wE2M0xg3NtpkYVnFHtrs/Sce6h2WSCFn6CerHu1ndUau7mje
 hmKVvO1fFqAqfVnvRlbnXjlnH9d8
X-Google-Smtp-Source: APXvYqwh9aTRRUDRv9wyWdtg/YUET9v/Hyw7FI8XTve/UavWp824/kDuEMYqZ+I6Uj7wSJRabYz+TA==
X-Received: by 2002:a05:620a:12ab:: with SMTP id
 x11mr33769828qki.149.1575992881771; 
 Tue, 10 Dec 2019 07:48:01 -0800 (PST)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id m29sm1247848qtf.1.2019.12.10.07.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 07:48:00 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 10 Dec 2019 10:47:25 -0500
Message-Id: <7e9e0c548291406c980e9496a7f09d081682d3c7.1575990937.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1575990937.git.rosbrookn@ainfosec.com>
References: <cover.1575990937.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 10/22] golang/xenlight: define
 CpuidPolicyList builtin type
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, kerriganb@ainfosec.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KCkRlZmluZSBDcHVp
ZFBvbGljeUxpc3QgYXMgYSBzdHJpbmcgc28gdGhhdCBsaWJ4bF9jcHVpZF9wYXJzZV9jb25maWcg
Y2FuCmJlIHVzZWQgaW4gdGhlIHRvQyBmdW5jdGlvbi4KCkZvciBub3csIGZyb21DIGlzIGEgbm8t
b3Agc2luY2UgbGlieGwgZG9lcyBub3Qgc3VwcG9ydCBhIHdheSB0byByZWFkIGEKcG9saWN5LCBt
b2RpZnkgaXQsYW5kIHRoZW4gZ2l2ZSBpdCBiYWNrIHRvIGxpYnhsLgoKU2lnbmVkLW9mZi1ieTog
TmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KUmV2aWV3ZWQtYnk6IEdlb3Jn
ZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6Ci0g
UmUtZGVmaW5lIENwdWlkUG9saWN5TGlzdCBhcyBzdHJpbmcuCi0gTWFrZSBmcm9tQyBhIG5vLW9w
LgotIFVzZSBsaWJ4bF9jcHVpZF9wYXJzZV9jb25maWcgaW4gdG9DIGZ1bmN0aW9uLgotLS0KIHRv
b2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbyB8IDI1ICsrKysrKysrKysrKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdG9v
bHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvIGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hl
bmxpZ2h0LmdvCmluZGV4IGMxZDlmZTg1ZmQuLjZiODdiZjg1N2QgMTAwNjQ0Ci0tLSBhL3Rvb2xz
L2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbworKysgYi90b29scy9nb2xhbmcveGVubGlnaHQv
eGVubGlnaHQuZ28KQEAgLTI0NSw2ICsyNDUsMzEgQEAgdHlwZSBFdkxpbmsgc3RydWN0e30KIGZ1
bmMgKGVsICpFdkxpbmspIGZyb21DKGNlbCAqQy5saWJ4bF9ldl9saW5rKSBlcnJvciAgICAgIHsg
cmV0dXJuIG5pbCB9CiBmdW5jIChlbCAqRXZMaW5rKSB0b0MoKSAoY2VsIEMubGlieGxfZXZfbGlu
aywgZXJyIGVycm9yKSB7IHJldHVybiB9CiAKKy8vIENwdWlkUG9saWN5TGlzdCByZXByZXNlbnRz
IGEgbGlieGxfY3B1aWRfcG9saWN5X2xpc3QuCisvLworLy8gVGhlIHZhbHVlIG9mIENwdWlkUG9s
aWN5TGlzdCBpcyBob25vcmVkIHdoZW4gdXNlZCBhcyBpbnB1dCB0byBsaWJ4bC4gSWYKKy8vIGEg
c3RydWN0IGNvbnRhaW5zIGEgZmllbGQgb2YgdHlwZSBDcHVpZFBvbGljeUxpc3QsIHRoYXQgZmll
bGQgd2lsbCBiZSBsZWZ0CisvLyBlbXB0eSB3aGVuIGl0IGlzIHJldHVybmVkIGZyb20gbGlieGwu
Cit0eXBlIENwdWlkUG9saWN5TGlzdCBzdHJpbmcKKworZnVuYyAoY3BsIENwdWlkUG9saWN5TGlz
dCkgZnJvbUMoY2NwbCAqQy5saWJ4bF9jcHVpZF9wb2xpY3lfbGlzdCkgZXJyb3IgeyByZXR1cm4g
bmlsIH0KKworZnVuYyAoY3BsIENwdWlkUG9saWN5TGlzdCkgdG9DKCkgKEMubGlieGxfY3B1aWRf
cG9saWN5X2xpc3QsIGVycm9yKSB7CisJdmFyIGNjcGwgQy5saWJ4bF9jcHVpZF9wb2xpY3lfbGlz
dAorCisJcyA6PSBDLkNTdHJpbmcoc3RyaW5nKGNwbCkpCisJZGVmZXIgQy5mcmVlKHVuc2FmZS5Q
b2ludGVyKHMpKQorCisJcmV0IDo9IEMubGlieGxfY3B1aWRfcGFyc2VfY29uZmlnKCZjY3BsLCBz
KQorCWlmIHJldCAhPSAwIHsKKwkJQy5saWJ4bF9jcHVpZF9kaXNwb3NlKCZjY3BsKQorCisJCXJl
dHVybiBjY3BsLCBFcnJvcigtcmV0KQorCX0KKworCXJldHVybiBjY3BsLCBuaWwKK30KKwogdHlw
ZSBDb250ZXh0IHN0cnVjdCB7CiAJY3R4ICAgICpDLmxpYnhsX2N0eAogCWxvZ2dlciAqQy54ZW50
b29sbG9nX2xvZ2dlcl9zdGRpb3N0cmVhbQotLSAKMi4xOS4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
