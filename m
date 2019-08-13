Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AA08B003
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 08:39:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxQOr-0007av-Ri; Tue, 13 Aug 2019 06:35:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YLpA=WJ=gmail.com=nishkadg.linux@srs-us1.protection.inumbo.net>)
 id 1hxQHF-0006o2-2y
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 06:27:25 +0000
X-Inumbo-ID: 697f1553-bd93-11e9-8980-bc764e045a96
Received: from mail-pg1-x541.google.com (unknown [2607:f8b0:4864:20::541])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 697f1553-bd93-11e9-8980-bc764e045a96;
 Tue, 13 Aug 2019 06:27:24 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id l21so50706803pgm.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Aug 2019 23:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ibx8hLmGfI0HFnEN8rgDtTXlnoeKgOQ33MgGH/Cf62I=;
 b=IB3/UXaOwvdhrmNh27ty8Ii+onuD4FzDOyTyM8xWewA1ARXozSYH8FizkWFoHs3lz8
 1xWID5z3zlfc/InMLKBHSiUDesIxfimN2XwfHgkxRHhUJGDz49gGZR/5zQDCLyZmH+PR
 Hvj5h0P0U6tOWgFaVydWgXurfgnd5o/hOrDAN19NwJDHcW9PDrBxlIMq2ijTBNo9MxO9
 p/nl1M4CnO6LqHQYMtVjGH7p/51YYuhCiwiHreHj7NdgA8B0dvDbbWJz1FtsG936N1Ug
 Oaglbgo8IYsZSV+CkC7bnlXbf1VrX7XZ1Ufr+U+bAM0kvuBJ7/GeJD63JMjD2X+H/fg7
 Bu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ibx8hLmGfI0HFnEN8rgDtTXlnoeKgOQ33MgGH/Cf62I=;
 b=HwUFGa1E6Lk/uEWUGZZg8KSfRKWud4X0Joswcfu1UFBJa7ssPfk/EkOwFm08RNqR37
 tIREpjTYB9V/r1riXuXpt2WiiAuyw8x3LJkFn948m9Q1wV5UeJhvxm5efZ68MEbeyBwi
 ZiTSzt26ShFkanR96cvbe2TUf1+7mi2lhxTsPOzlWqxmQ+LQYUCFXa4kLi1a9177afK2
 l4WTmVci9C/8XmRnW/5EJiEigTHU/KAkX0l5dKf9wLJ1Xfh7cSKw91yOdWm0OZgJzrrI
 wlddJ1MK4wCi3X0/rmVVgc8FnSIEORrdv1JRmdhj62l6lbI0Ui1+eg2JOArE3fF9/Bb3
 159g==
X-Gm-Message-State: APjAAAXo3HEUZTIYlrl88Ts96gzL6ZK8+gBu18Q9No+dg2IPJ3MeE1IC
 Iyh+ZG5UTRzy7vQ0nwHB4B8=
X-Google-Smtp-Source: APXvYqxWKZdKuodrVWJAzbb9UMkztll3+RJHZbGwG7ibw+vZcY0oXPoxi0ofJEMVzTAm98Zer5Elmg==
X-Received: by 2002:a63:b20f:: with SMTP id x15mr34234519pge.453.1565677643586; 
 Mon, 12 Aug 2019 23:27:23 -0700 (PDT)
Received: from localhost.localdomain ([122.163.110.75])
 by smtp.gmail.com with ESMTPSA id f7sm104857165pfd.43.2019.08.12.23.27.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 23:27:23 -0700 (PDT)
From: Nishka Dasgupta <nishkadg.linux@gmail.com>
To: oleksandr_andrushchenko@epam.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org
Date: Tue, 13 Aug 2019 11:57:11 +0530
Message-Id: <20190813062712.24993-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 13 Aug 2019 06:35:16 +0000
Subject: [Xen-devel] [PATCH] drm/xen-front: Make structure fb_funcs constant
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
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3RhdGljIHN0cnVjdHVyZSBmYl9mdW5jcywgb2YgdHlwZSBkcm1fZnJhbWVidWZmZXJfZnVuY3Ms
IGlzIHVzZWQgb25seQp3aGVuIGl0IGlzIHBhc3NlZCB0byBkcm1fZ2VtX2ZiX2NyZWF0ZV93aXRo
X2Z1bmNzKCkgYXMgaXRzIGxhc3QKYXJndW1lbnQuIGRybV9nZW1fZmJfY3JlYXRlX3dpdGhfZnVu
Y3MgZG9lcyBub3QgbW9kaWZ5IGl0cyBsc3QgYXJndW1lbnQKKGZiX2Z1bmNzKSBhbmQgaGVuY2Ug
ZmJfZnVuY3MgaXMgbmV2ZXIgbW9kaWZpZWQuIFRoZXJlZm9yZSBtYWtlIGZiX2Z1bmNzCmNvbnN0
YW50IHRvIHByb3RlY3QgaXQgZnJvbSBmdXJ0aGVyIG1vZGlmaWNhdGlvbi4KSXNzdWUgZm91bmQg
d2l0aCBDb2NjaW5lbGxlLgoKU2lnbmVkLW9mZi1ieTogTmlzaGthIERhc2d1cHRhIDxuaXNoa2Fk
Zy5saW51eEBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250
X2ttcy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2ttcy5j
IGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2ttcy5jCmluZGV4IGMyOTU1ZDM3
NTM5NC4uNGE5ODRmNDU1NTVlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9k
cm1fZnJvbnRfa21zLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2tt
cy5jCkBAIC00NSw3ICs0NSw3IEBAIHN0YXRpYyB2b2lkIGZiX2Rlc3Ryb3koc3RydWN0IGRybV9m
cmFtZWJ1ZmZlciAqZmIpCiAJZHJtX2dlbV9mYl9kZXN0cm95KGZiKTsKIH0KIAotc3RhdGljIHN0
cnVjdCBkcm1fZnJhbWVidWZmZXJfZnVuY3MgZmJfZnVuY3MgPSB7CitzdGF0aWMgY29uc3Qgc3Ry
dWN0IGRybV9mcmFtZWJ1ZmZlcl9mdW5jcyBmYl9mdW5jcyA9IHsKIAkuZGVzdHJveSA9IGZiX2Rl
c3Ryb3ksCiB9OwogCi0tIAoyLjE5LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
