Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7690114A575
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 14:52:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw4kI-0005E5-3F; Mon, 27 Jan 2020 13:48:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X640=3Q=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iw4kG-0005Dy-Lo
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 13:48:04 +0000
X-Inumbo-ID: a3cda92a-410b-11ea-9fd7-bc764e2007e4
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3cda92a-410b-11ea-9fd7-bc764e2007e4;
 Mon, 27 Jan 2020 13:48:04 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id s10so3306319wmh.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2020 05:48:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=NP0Q7xGFN+U3S+w3O1piz8kR6YlhwbCyBmfMQBTHh2o=;
 b=IL9M6WUEkMISDDLnwtByZtbXDU6LxxlKoLekFg8WU6knUYs/VbGmBPUHb1kEJYhmwv
 sbYCCBuP83NlowW3msNROEU76FPW1X1+9VIOik+kSTNd/TctButv8chjnrLIPBs9O2H0
 7EHma8wIn77hzhiiSn8rAcDLfRio6amp9/BN1TzLxKajYjUIb9nZqX+riHNjXmGMcP5F
 AZqLBM6JPJ9fMyOifufygqL3tF50yz9xu2cnlV/5NkZ57HHNCbpi/AepZnEncbVtOX1X
 2+Dxukom91wpLKbiWHnyxCLWbT8RHcAOJAkFhjnYBIoUgW6Gck6eT9tgm4EjjCJ9F2uB
 L6wQ==
X-Gm-Message-State: APjAAAWVbX+K6+sglfc7UrAuW/XF5AY4tqOjdxrOqRYd68HN09yFPt+d
 bjsvr7gQtYXpVgwPqeYTwCx7sdL59emIXQ==
X-Google-Smtp-Source: APXvYqwyD4WvqQj84Fcdy+bMa8Wlm8Tj9p5IKs1kL8xFmxMERINwp4/Ra23dC8jfD+YzZMQb/zG3XQ==
X-Received: by 2002:a05:600c:d7:: with SMTP id
 u23mr14259214wmm.145.1580132883087; 
 Mon, 27 Jan 2020 05:48:03 -0800 (PST)
Received: from ufe34d9ed68d054.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id i204sm18149610wma.44.2020.01.27.05.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 05:48:02 -0800 (PST)
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 27 Jan 2020 13:48:00 +0000
Message-Id: <20200127134800.15078-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH] xen/x86: domctl: Don't leak data via
 XEN_DOMCTL_gethvmcontext
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KClRoZSBIVk0gY29udGV4dCBt
YXkgbm90IGZpbGwgdXAgdGhlIGZ1bGwgYnVmZmVyIHBhc3NlZCBieSB0aGUgY2FsbGVyLgpXaGls
ZSB3ZSByZXBvcnQgY29yZWN0bHkgdGhlIHNpemUgb2YgdGhlIGNvbnRleHQsIHdlIHdpbGwgc3Rp
bGwgYmUKY29weWluZyBiYWNrIHRoZSBmdWxsIHNpemUgb2YgdGhlIGJ1ZmZlci4KCkFzIHRoZSBi
dWZmZXIgaXMgYWxsb2NhdGVkIHRocm91Z2ggeG1hbGxvYygpLCB3ZSB3aWxsIGJlIGNvcHlpbmcg
c29tZQpiaXRzIGZyb20gdGhlIHByZXZpb3VzIGFsbG9jYXRpb24uCgpPbmx5IGNvcHkgYmFjayB0
aGUgcGFydCBvZiB0aGUgYnVmZmVyIHVzZWQgYnkgdGhlIEhWTSBjb250ZXh0IHRvIHByZXZlbnQK
YW55IGxlYWsuCgpOb3RlIHRoYXQgcGVyIFhTQS03MiwgdGhpcyBpcyBub3QgYSBzZWN1cml0eSBp
c3N1ZS4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+Ci0t
LQogeGVuL2FyY2gveDg2L2RvbWN0bC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2RvbWN0bC5j
IGIveGVuL2FyY2gveDg2L2RvbWN0bC5jCmluZGV4IDVlZDYzYWMxMGEuLjRmYTljOTExNDAgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9kb21jdGwuYworKysgYi94ZW4vYXJjaC94ODYvZG9tY3Rs
LmMKQEAgLTU0MCw3ICs1NDAsNyBAQCBsb25nIGFyY2hfZG9fZG9tY3RsKAogICAgICAgICBkb21h
aW5fdW5wYXVzZShkKTsKIAogICAgICAgICBkb21jdGwtPnUuaHZtY29udGV4dC5zaXplID0gYy5j
dXI7Ci0gICAgICAgIGlmICggY29weV90b19ndWVzdChkb21jdGwtPnUuaHZtY29udGV4dC5idWZm
ZXIsIGMuZGF0YSwgYy5zaXplKSAhPSAwICkKKyAgICAgICAgaWYgKCBjb3B5X3RvX2d1ZXN0KGRv
bWN0bC0+dS5odm1jb250ZXh0LmJ1ZmZlciwgYy5kYXRhLCBjLmN1cikgIT0gMCApCiAgICAgICAg
ICAgICByZXQgPSAtRUZBVUxUOwogCiAgICAgZ2V0aHZtY29udGV4dF9vdXQ6Ci0tIAoyLjE3LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
