Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F65D18EA2E
	for <lists+xen-devel@lfdr.de>; Sun, 22 Mar 2020 17:17:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jG3FT-0004kf-TN; Sun, 22 Mar 2020 16:14:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0EiK=5H=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jG3FS-0004jY-F9
 for xen-devel@lists.xenproject.org; Sun, 22 Mar 2020 16:14:50 +0000
X-Inumbo-ID: 3a7ed2a0-6c58-11ea-92cf-bc764e2007e4
Received: from mail-ed1-f65.google.com (unknown [209.85.208.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a7ed2a0-6c58-11ea-92cf-bc764e2007e4;
 Sun, 22 Mar 2020 16:14:38 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id n25so12545685eds.10
 for <xen-devel@lists.xenproject.org>; Sun, 22 Mar 2020 09:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9FdB03XeTb21IBXUeyCVMzkNzMUw0hNKTDFXHd2H3xg=;
 b=jYxQATlWHi1b9nXzJbJSLTE2uUupvg1lx/LoCQzKncFW8aE64z2DhaKuYsO59E5mP1
 R5SAXrzMsRnWiujPzSgRB271pDl5yFhAl+xr1RF11qoD9G8Zt63Rf2E1bkNA0A5aAP+j
 ypGP0zAhkiWRbAdNSEs7khPYgrusSh41x5IdAMPLpDUWsLXuPE8w9zN+RCDU4Q2DBGRO
 CTtx3k9cYq6VJfFYnrXnmj1qMg+Cv5/qFNxABGQ51s2dFoxt9LZPNbeeE9RXVmDGh1a4
 gZV69H+lStCio4YUTVXWq1Ad7tmLNMha8cwUkNdD+UwvHj//g/onHuTA8l2gBw568neD
 FU+w==
X-Gm-Message-State: ANhLgQ2AYEgwsTRC12vzDmj3kFeF7aVo7tff6ZQAUXv0EZ3wWb8H40XU
 KBd5WlnLQYERHWD1REpoZNOMb8L2mwQbFQ==
X-Google-Smtp-Source: ADFU+vsW1wr7I0nxWsGNMrzsFsK1KyQ6lfU4pzLU1Lj/etpEmfOvWxBWjc3BYZ/4qn1K7XCykTZxng==
X-Received: by 2002:aa7:c9cb:: with SMTP id i11mr18191799edt.320.1584893677659; 
 Sun, 22 Mar 2020 09:14:37 -0700 (PDT)
Received: from ufe34d9ed68d054.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id v13sm106693edj.62.2020.03.22.09.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 09:14:37 -0700 (PDT)
From: julien@xen.org
To: xen-devel@lists.xenproject.org
Date: Sun, 22 Mar 2020 16:14:14 +0000
Message-Id: <20200322161418.31606-14-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200322161418.31606-1-julien@xen.org>
References: <20200322161418.31606-1-julien@xen.org>
Subject: [Xen-devel] [PATCH 13/17] xen/x86: p2m: Reflow P2M_PRINTK()s in
 p2m_pt_audit_p2m()
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
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KCldlIHRlbmQgdG8gYXZvaWQg
c3BsaXR0aW5nIG1lc3NhZ2Ugb24gbXVsdGlwbGUgbGluZSwgc28gaXQgaXMgZWFzaWVyIHRvCmZp
bmQgaXQuCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPgot
LS0KIHhlbi9hcmNoL3g4Ni9tbS9wMm0tcHQuYyB8IDE0ICsrKysrKy0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9tbS9wMm0tcHQuYyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0tcHQuYwppbmRleCA3
NzQ1MGE5NDg0Li5lOWRhMzRkNjY4IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLXB0
LmMKKysrIGIveGVuL2FyY2gveDg2L21tL3AybS1wdC5jCkBAIC05OTQsOSArOTk0LDggQEAgbG9u
ZyBwMm1fcHRfYXVkaXRfcDJtKHN0cnVjdCBwMm1fZG9tYWluICpwMm0pCiAgICAgICAgICAgICAg
ICAgICAgICAgICBpZiAoIG0ycGZuICE9IChnZm4gKyBpMikgKQogICAgICAgICAgICAgICAgICAg
ICAgICAgewogICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBtYmFkKys7Ci0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgUDJNX1BSSU5USygibWlzbWF0Y2g6IGdmbiAlI2x4IC0+IG1mbiAl
I2x4IgotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiAtPiBnZm4gJSNs
eFxuIiwgZ2ZuK2kyLCBtZm4raTIsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBtMnBmbik7CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgUDJNX1BSSU5USygibWlz
bWF0Y2g6IGdmbiAlI2x4IC0+IG1mbiAlI2x4IC0+IGdmbiAlI2x4XG4iLAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2ZuICsgaTIsIG1mbiArIGkyLCBtMnBmbik7CiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgQlVHKCk7CiAgICAgICAgICAgICAgICAgICAgICAg
ICB9CiAgICAgICAgICAgICAgICAgICAgICAgICBnZm4gKz0gMSA8PCAoTDNfUEFHRVRBQkxFX1NI
SUZUIC0gUEFHRV9TSElGVCk7CkBAIC0xMDI5LDkgKzEwMjgsOCBAQCBsb25nIHAybV9wdF9hdWRp
dF9wMm0oc3RydWN0IHAybV9kb21haW4gKnAybSkKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBpZiAoIChtMnBmbiAhPSAoZ2ZuICsgaTEpKSAmJiAhU0hBUkVEX00yUChtMnBmbikgKQogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcG1iYWQrKzsKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUDJNX1BSSU5USygi
bWlzbWF0Y2g6IGdmbiAlI2x4IC0+IG1mbiAlI2x4IgotICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICIgLT4gZ2ZuICUjbHhcbiIsIGdmbitpMSwgbWZuK2kxLAotICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG0ycGZuKTsKKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgUDJNX1BSSU5USygibWlzbWF0Y2g6IGdmbiAlI2x4IC0+
IG1mbiAlI2x4IC0+IGdmbiAlI2x4XG4iLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGdmbiArIGkxLCBtZm4gKyBpMSwgbTJwZm4pOwogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBCVUcoKTsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9CiAg
ICAgICAgICAgICAgICAgICAgICAgICB9CkBAIC0xMDYxLDggKzEwNTksOCBAQCBsb25nIHAybV9w
dF9hdWRpdF9wMm0oc3RydWN0IHAybV9kb21haW4gKnAybSkKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIXAybV9pc19zaGFyZWQodHlwZSkgKQogICAgICAgICAgICAgICAgICAgICAgICAg
ewogICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBtYmFkKys7Ci0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgUDJNX1BSSU5USygibWlzbWF0Y2g6IGdmbiAlI2x4IC0+IG1mbiAlI2x4Igot
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiAtPiBnZm4gJSNseFxuIiwg
Z2ZuLCBtZm4sIG0ycGZuKTsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBQMk1fUFJJTlRL
KCJtaXNtYXRjaDogZ2ZuICUjbHggLT4gbWZuICUjbHggLT4gZ2ZuICUjbHhcbiIsCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnZm4sIG1mbiwgbTJwZm4pOwogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIEJVRygpOwogICAgICAgICAgICAgICAgICAgICAgICAgfQog
ICAgICAgICAgICAgICAgICAgICB9Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
