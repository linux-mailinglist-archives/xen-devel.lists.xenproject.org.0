Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADD81181BE
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 09:08:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieaXd-0002Ph-Dk; Tue, 10 Dec 2019 08:06:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DUzY=2A=gmail.com=sj38.park@srs-us1.protection.inumbo.net>)
 id 1ieaXc-0002Pa-EX
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 08:06:44 +0000
X-Inumbo-ID: 00b75f68-1b24-11ea-a914-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00b75f68-1b24-11ea-a914-bc764e2007e4;
 Tue, 10 Dec 2019 08:06:43 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c9so18888494wrw.8
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2019 00:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=TrPkwEXfKMcmBJRMNstq7uxjKx3WNx+bbydVyI6MWHE=;
 b=nWtyrFvDAYkYyZJFWyDb04U2iRVuCXLIWSsQVgMM5vtBaveIFSiKAZTL6II3BjWL/9
 Uuhx1xzzjRAmkyflJ9d5X1fHwm6+s+DnJqvbNCWUFhjLVOYjica5dgr2OHwnQHJuneIT
 9JpF05dCR+CcHLB1XhsCcYIITeIZWH2vSgx0KeUxqcOSg24KVR5nVx+ZZnFP3aLm9lkB
 dCdKYSznWWUsHPwyT7P6FRTyJ7sh7Ob+v7m+z0kh4s8feYBndiWNz6QvofqcfnI6LCnT
 LO4cZYp9ZGbyGVmxEy21FYfBEdDxSs197KtaSInF/iHLC2qPnc5hu2krrTf2Tz4w9Udk
 CSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=TrPkwEXfKMcmBJRMNstq7uxjKx3WNx+bbydVyI6MWHE=;
 b=o24kHuNzj89KCkU8hlVmsaqerCxLOLA80yXcVXMdF9onJFIKK0RJQCBRKPdYPhClJy
 5klCBUWb+s93iOAXd5lHxf54PhUPyHxD6eD2toA0bIJLfe9KjXnmUVKevtlTZASu37UN
 tFahXgijOrZbFNMy38FPw9WbH9AIXiIPhigdZy2apo8X5T3VvfxYShATep3WxxOeLq0t
 2nCSWpCAISmHMFxtcVx61wethx1hRTLRdPt1otE96C9i9ZjuLYHJmvW6XLFN856ZHqel
 zuXEOAh30SQGpdtxoZqfLfWzQqI+XdrVekqa6RvYsCpvdnEhkUqHVXa5LziKscStUqFO
 iTnw==
X-Gm-Message-State: APjAAAVWtRug8vOOXk0DwmKagqt/9uvmzm7YH9cWWbBtQWbcnXC0e2Zt
 WEstiOws+caOrEG/XOoiQXs=
X-Google-Smtp-Source: APXvYqwvF9vb1Pg/03dTB9bQnN2IbN1gpJnIMJTJQB2WBT2IvDLxvGQ+qQaE01Fk2ySzFRrDqJNniQ==
X-Received: by 2002:adf:ef92:: with SMTP id d18mr1570233wro.234.1575965202797; 
 Tue, 10 Dec 2019 00:06:42 -0800 (PST)
Received: from localhost.localdomain (x2f7fae7.dyn.telefonica.de.
 [2.247.250.231])
 by smtp.gmail.com with ESMTPSA id a16sm2342587wrt.37.2019.12.10.00.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 00:06:42 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
X-Google-Original-From: SeongJae Park <sjpark@amazon.de>
To: sjpark@amazon.com
Date: Tue, 10 Dec 2019 08:06:26 +0000
Message-Id: <20191210080628.5264-1-sjpark@amazon.de>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH v5 0/2] xenbus/backend: Add a memory pressure
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
Cc: axboe@kernel.dk, sj38.park@gmail.com, konrad.wilk@oracle.com,
 pdurrant@amazon.com, SeongJae Park <sjpark@amazon.de>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org, roger.pau@citrix.com
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
IHBhdHRlcm5zLiAgQWxzbywgc3VjaCBhIHN0YXRpYyBjb25maWd1cmF0aW9uIG1pZ2h0IGxhY2sg
YQpmbGV4aWJpbGl0eS4KClRvIG1pdGlnYXRlIHN1Y2ggcHJvYmxlbXMsIHRoaXMgcGF0Y2hzZXQg
YWRkcyBhIG1lbW9yeSByZWNsYWltIGNhbGxiYWNrCnRvICd4ZW5idXNfZHJpdmVyJyAocGF0Y2gg
MSkgYW5kIHVzZSBpdCB0byBtaXRpZ2F0ZSB0aGUgcHJvYmxlbSBpbgoneGVuLWJsa2JhY2snIChw
YXRjaCAyKS4KCkJhc2UgVmVyc2lvbgotLS0tLS0tLS0tLS0KClRoaXMgcGF0Y2ggaXMgYmFzZWQg
b24gdjUuNC4gIEEgY29tcGxldGUgdHJlZSBpcyBhbHNvIGF2YWlsYWJsZSBhdCBteQpwdWJsaWMg
Z2l0IHJlcG86Cmh0dHBzOi8vZ2l0aHViLmNvbS9zanAzOC9saW51eC90cmVlL2Jsa2JhY2tfc3F1
ZWV6aW5nX3Y1CgoKUGF0Y2ggSGlzdG9yeQotLS0tLS0tLS0tLS0tCgpDaGFuZ2VzIGZyb20gdjQK
KGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC8yMDE5MTIwOTE5NDMwNS4yMDgyOC0x
LXNqcGFya0BhbWF6b24uY29tLykKIC0gUmVtb3ZlIGRvbWFpbiBpZCBwYXJhbWV0ZXIgZnJvbSB0
aGUgY2FsbGJhY2sgKHN1Z2dlc3RlZCBieSBKZXJnZW4gR3Jvc3MpCgpDaGFuZ2VzIGZyb20gdjMK
KGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC8yMDE5MTIwOTA4NTgzOS4yMTIxNS0x
LXNqcGFya0BhbWF6b24uY29tLykKIC0gQWRkIGdlbmVyYWwgY2FsbGJhY2sgaW4geGVuX2RyaXZl
ciBhbmQgdXNlIGl0IChzdWdnZXN0ZWQgYnkgSnVlcmdlbgogICBHcm9zcykKCkNoYW5nZXMgZnJv
bSB2MgooaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYmxvY2svYWYxOTUwMzMtMjNkNS0z
OGVkLWI3M2ItZjZlMmUzYjM0NTQxQGFtYXpvbi5jb20pCiAtIFJlbmFtZSB0aGUgbW9kdWxlIHBh
cmFtZXRlciBhbmQgdmFyaWFibGVzIGZvciBicmV2aXR5IChhZ2dyZXNzaXZlCiAgIHNocmlua2lu
ZyAtPiBzcXVlZXppbmcpCgpDaGFuZ2VzIGZyb20gdjEKKGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3hlbi1kZXZlbC8yMDE5MTIwNDExMzQxOS4yMjk4LTEtc2pwYXJrQGFtYXpvbi5jb20vKQogLSBB
ZGp1c3QgdGhlIGRlc2NyaXB0aW9uIHRvIG5vdCB1c2UgdGhlIHRlcm0sIGBhcmJpdHJhcmlseWAg
KHN1Z2dlc3RlZAogICBieSBQYXVsIER1cnJhbnQpCiAtIFNwZWNpZnkgdGltZSB1bml0IG9mIHRo
ZSBkdXJhdGlvbiBpbiB0aGUgcGFyYW1ldGVyIGRlc2NyaXB0aW9uLAogICAoc3VnZ2VzdGVkIGJ5
IE1heGltaWxpYW4gSGV5bmUpCiAtIENoYW5nZSBkZWZhdWx0IGFnZ3Jlc3NpdmUgc2hyaW5raW5n
IGR1cmF0aW9uIGZyb20gMW1zIHRvIDEwbXMKIC0gTWVyZ2UgdHdvIHBhdGNoZXMgaW50byBvbmUg
c2luZ2xlIHBhdGNoCgpTZW9uZ0phZSBQYXJrICgyKToKICB4ZW5idXMvYmFja2VuZDogQWRkIG1l
bW9yeSBwcmVzc3VyZSBoYW5kbGVyIGNhbGxiYWNrCiAgeGVuL2Jsa2JhY2s6IFNxdWVlemUgcGFn
ZSBwb29scyBpZiBhIG1lbW9yeSBwcmVzc3VyZSBpcyBkZXRlY3RlZAoKIGRyaXZlcnMvYmxvY2sv
eGVuLWJsa2JhY2svYmxrYmFjay5jICAgICAgIHwgMjMgKysrKysrKysrKysrKysrLS0KIGRyaXZl
cnMvYmxvY2sveGVuLWJsa2JhY2svY29tbW9uLmggICAgICAgIHwgIDEgKwogZHJpdmVycy9ibG9j
ay94ZW4tYmxrYmFjay94ZW5idXMuYyAgICAgICAgfCAgMyArKy0KIGRyaXZlcnMveGVuL3hlbmJ1
cy94ZW5idXNfcHJvYmVfYmFja2VuZC5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysrKysKIGlu
Y2x1ZGUveGVuL3hlbmJ1cy5oICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogNSBmaWxlcyBj
aGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
