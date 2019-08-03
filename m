Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0321C806CE
	for <lists+xen-devel@lfdr.de>; Sat,  3 Aug 2019 16:47:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htvGk-00020n-Lv; Sat, 03 Aug 2019 14:44:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LPa+=V7=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1htvGi-00020i-N8
 for xen-devel@lists.xenproject.org; Sat, 03 Aug 2019 14:44:24 +0000
X-Inumbo-ID: 2f380ac5-b5fd-11e9-8980-bc764e045a96
Received: from mail-yb1-xb41.google.com (unknown [2607:f8b0:4864:20::b41])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2f380ac5-b5fd-11e9-8980-bc764e045a96;
 Sat, 03 Aug 2019 14:44:23 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id q5so15688795ybp.1
 for <xen-devel@lists.xenproject.org>; Sat, 03 Aug 2019 07:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GGF0pGjmq5WZ4vQvLBOxVLb3ImbNOvZ62pStIVd1l+o=;
 b=IFfO4ChHHltVX/vi+KGXf7OiFMcSmCmoKB2jhIQmy+iGNPIEcWJPIExweDZv/qV+G1
 LfM+O6mlr/jsYDPu1O2Qfr1YdQS+HXfOnQQbk3dp1xGfA2QRIBiuq6aaVK0nZYDMXAQj
 eBL6g9Ox9hkFwuNFf4HhVZiRerdeYgeg1eGVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GGF0pGjmq5WZ4vQvLBOxVLb3ImbNOvZ62pStIVd1l+o=;
 b=gGpVt71W2pHBY0YgVf/xXRzYOAv7CUw5Og6FLSlHr/kqIgieY7Hj/W6NCEXAxgF2Ko
 cd5n6KmeHOxGue+jE8aYXClmkb5HHeQW9DKjBqEGI+oq9/6pq1wWbjjhLbmtvKNeXkVM
 2CFs6JSl/5QMsT+BWCkp3KDrtHkQ09TxQOIaKDM+xs3m6WJmvPtQKTjxs0soiuPXrfds
 ZZlbF2NLDYPzV7hmgNxotIG7zhGGWvCgVEk29wXNwNb3K6/GJ2+ayEqcftrTTVgutJkg
 ObtiiSXqW8fnZhIzs70MTuHwrTjrgEKmbrgioCh7YrPLzlE7nq532hPI+/3iga5PIdxg
 yDiw==
X-Gm-Message-State: APjAAAXaKvpVcIfHJc7qo7Kgq0AbyhNhEBu+F+/0HIR9caBnTObWmcXq
 DrQif63sscalQ4I0/HU9rR2SCB8h
X-Google-Smtp-Source: APXvYqwgTVTigxtoaja2PiJtRNLMYWKcNCL+I4W9p/mbWk8Ria8+242l5KIeDi/qNZ5kmAx1l2JrPA==
X-Received: by 2002:a25:c589:: with SMTP id v131mr5536261ybe.148.1564843463069; 
 Sat, 03 Aug 2019 07:44:23 -0700 (PDT)
Received: from MacBook-Pro.localdomain
 (104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
 by smtp.gmail.com with ESMTPSA id u6sm17938266ywl.10.2019.08.03.07.44.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 03 Aug 2019 07:44:22 -0700 (PDT)
From: Doug Goldstein <cardoe@cardoe.com>
To: xen-devel@lists.xenproject.org
Date: Sat,  3 Aug 2019 09:44:17 -0500
Message-Id: <20190803144417.60947-1-cardoe@cardoe.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] automation: add info about container pushes
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>, Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VG8gYmUgYWJsZSB0byBwdXNoIGEgY29udGFpbmVyLCB1c2VycyBtdXN0IGhhdmUgYWNjZXNzIGFu
ZCBoYXZlIGxvZ2dlZAppbnRvIHRoZSBjb250YWluZXIgcmVnaXN0cnkuIFRoZSBkb2NzIGRpZCBu
b3QgZXhwbGFpbiB0aGlzIGZ1bGx5IHNvIHRoaXMKZG9jdW1lbnRzIHRoZSBzdGVwcyBiZXR0ZXIu
CgpTaWduZWQtb2ZmLWJ5OiBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRvZS5jb20+Ci0tLQog
YXV0b21hdGlvbi9idWlsZC9SRUFETUUubWQgfCA2ICsrKysrLQogMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2F1dG9tYXRpb24vYnVp
bGQvUkVBRE1FLm1kIGIvYXV0b21hdGlvbi9idWlsZC9SRUFETUUubWQKaW5kZXggZDhjOGExOGUz
My4uNDc2ZjgyY2Y0NSAxMDA2NDQKLS0tIGEvYXV0b21hdGlvbi9idWlsZC9SRUFETUUubWQKKysr
IGIvYXV0b21hdGlvbi9idWlsZC9SRUFETUUubWQKQEAgLTY2LDYgKzY2LDEwIEBAIFRoZXJlIGlz
IGEgbWFrZWZpbGUgdG8gbWFrZSB0aGlzIHByb2Nlc3MgZWFzaWVyLiBZb3Ugc2hvdWxkIGJlCiBh
YmxlIHRvIHJ1biBgbWFrZSBESVNUUk8vVkVSU0lPTmAgdG8gaGF2ZSBEb2NrZXIgYnVpbGQgdGhl
IGNvbnRhaW5lcgogZm9yIHlvdS4gSWYgeW91IGRlZmluZSB0aGUgYFBVU0hgIGVudmlyb25tZW50
IHZhcmlhYmxlIHdoZW4gcnVubmluZyB0aGUKIGZvcm1lciBgbWFrZWAgY29tbWFuZCwgaXQgd2ls
bCBwdXNoIHRoZSBjb250YWluZXIgdG8gdGhlIFtyZWdpc3RyeV0gaWYKLXlvdSBoYXZlIGFjY2Vz
cyB0byBkbyBzby4KK3lvdSBoYXZlIGFjY2VzcyB0byBkbyBzbyBhbmQgaGF2ZSB5b3VyIERvY2tl
ciBsb2dnZWQgaW50byB0aGUgcmVnaXN0cnkuCisKK1RvIGxvZ2luIHlvdSBtdXN0IHJ1biBgZG9j
a2VyIGxvZ2luIHJlZ2lzdHJ5LmdpdGxhYi5jb21gLiBGb3IgbW9yZQoraW5mb3JtYXRpb24gc2Vl
IHRoZSBbcmVnaXN0cnkgaGVscF0uCiAKIFtyZWdpc3RyeV06IGh0dHBzOi8vZ2l0bGFiLmNvbS94
ZW4tcHJvamVjdC94ZW4vY29udGFpbmVyX3JlZ2lzdHJ5CitbcmVnaXN0cnkgaGVscF06IGh0dHBz
Oi8vZ2l0bGFiLmNvbS9oZWxwL3VzZXIvcHJvamVjdC9jb250YWluZXJfcmVnaXN0cnkKLS0gCjIu
MjAuMSAoQXBwbGUgR2l0LTExNykKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
