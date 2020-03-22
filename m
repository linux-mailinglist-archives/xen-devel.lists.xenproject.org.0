Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E2618EA34
	for <lists+xen-devel@lfdr.de>; Sun, 22 Mar 2020 17:17:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jG3Fe-0004xM-Eh; Sun, 22 Mar 2020 16:15:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0EiK=5H=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jG3Fc-0004vS-FR
 for xen-devel@lists.xenproject.org; Sun, 22 Mar 2020 16:15:00 +0000
X-Inumbo-ID: 3bb2274e-6c58-11ea-a6c1-bc764e2007e4
Received: from mail-ed1-f68.google.com (unknown [209.85.208.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3bb2274e-6c58-11ea-a6c1-bc764e2007e4;
 Sun, 22 Mar 2020 16:14:40 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id i24so13538858eds.1
 for <xen-devel@lists.xenproject.org>; Sun, 22 Mar 2020 09:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=04zURAfP8Ele6NFckM2pfjn7bHXwVWe5JFmHviPQRzA=;
 b=YuXL4O7cxjvKSrL+wseiHk0fcxblsITDIi7JsvZLUGRnrgypZRSXRn7xEDQjGFrwRb
 YuCparMg+GiytwGidSK8YdtD/CLDMjUREB4j5hxi2p6DLZ9mh0RM5lIByrJ4eU1tsFv+
 UGFpZ+qNjwihrmGvvNImlYYjCVTPGBkS3bPPC2PSEHUMfQ7FAkwGKKwQc5vBTQ/dJ5pB
 8PLA8Dsux3LDvaunkeROg9Ar+3jIXBGzF5kxGTqX6WARxu9dnVQPwbGbJl3gIENibLRw
 H1A/Ww7RPMw9xpFC+KZalNovNOMvKOR74w3BWNZKsIkG4GS4RZV78ZeMVSkYUCV6xu1A
 0DGw==
X-Gm-Message-State: ANhLgQ1//LX0Pd/6mPh95QqTMQuw5ePqtY0d6va85sX1GjmgFTZX8emC
 86SSFXgpCgvIAsRDFw8BotsRSbkZPH+3qw==
X-Google-Smtp-Source: ADFU+vvn+ke5XLNEvi5vuNP8y5JT938xk3czZJWOTQaI95FgPxHJKvvqUt7hHf4YKPx8OMD1MIKJRQ==
X-Received: by 2002:a05:6402:343:: with SMTP id
 r3mr17421186edw.85.1584893679752; 
 Sun, 22 Mar 2020 09:14:39 -0700 (PDT)
Received: from ufe34d9ed68d054.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id v13sm106693edj.62.2020.03.22.09.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 09:14:39 -0700 (PDT)
From: julien@xen.org
To: xen-devel@lists.xenproject.org
Date: Sun, 22 Mar 2020 16:14:16 +0000
Message-Id: <20200322161418.31606-16-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200322161418.31606-1-julien@xen.org>
References: <20200322161418.31606-1-julien@xen.org>
Subject: [Xen-devel] [PATCH 15/17] xen/x86: p2m: Rework printk format in
 audit_p2m()
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCk9uZSBvZiB0aGUgcHJp
bnRrIGZvcm1hdCBpbiBhdWRpdF9wMm0oKSBtYXkgYmUgZGlmZmljdWx0IHRvIHJlYWQgYXMgaXQK
aXMgbm90IGNsZWFyIHdoYXQgaXMgdGhlIGZpcnN0IG51bWJlci4KCkZ1cnRoZXJtb3JlLCB0aGUg
Zm9ybWF0IGNhbiBub3cgdGFrZSBhZHZhbnRhZ2Ugb2YgJXBkLgoKU2lnbmVkLW9mZi1ieTogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCi0tLQogICAgVGhpcyB3YXMgb3JpZ2lu
YWxseSBzZW50IGFzIHBhcnQgb2YgInhlbi9hcm06IFByb3Blcmx5IGRpc2FibGUgTTJQCiAgICBv
biBBcm0iIFsxXS4KCiAgICBbMV0gPDIwMTkwNjAzMTYwMzUwLjI5ODA2LTEtanVsaWVuLmdyYWxs
QGFybS5jb20+Ci0tLQogeGVuL2FyY2gveDg2L21tL3AybS5jIHwgMyArLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvbW0vcDJtLmMgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMKaW5kZXggNDViNGI3ODRkMy4u
YjZiMDFhNzFjOCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jCisrKyBiL3hlbi9h
cmNoL3g4Ni9tbS9wMm0uYwpAQCAtMjg1MSw4ICsyODUxLDcgQEAgdm9pZCBhdWRpdF9wMm0oc3Ry
dWN0IGRvbWFpbiAqZCwKIAogICAgICAgICBpZiAoIG9kICE9IGQgKQogICAgICAgICB7Ci0gICAg
ICAgICAgICBQMk1fUFJJTlRLKCJ3cm9uZyBvd25lciAlI2x4IC0+ICVwKCV1KSAhPSAlcCgldSlc
biIsCi0gICAgICAgICAgICAgICAgICAgICAgIG1mbiwgb2QsIChvZD9vZC0+ZG9tYWluX2lkOi0x
KSwgZCwgZC0+ZG9tYWluX2lkKTsKKyAgICAgICAgICAgIFAyTV9QUklOVEsoIm1mbiAlIlBSSV9t
Zm4iIG93bmVyICVwZCAhPSAlcGRcbiIsIG1mbiwgb2QsIGQpOwogICAgICAgICAgICAgY29udGlu
dWU7CiAgICAgICAgIH0KIAotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
