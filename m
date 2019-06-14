Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 885C946AE1
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 22:39:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbswf-0007FJ-ET; Fri, 14 Jun 2019 20:37:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QxfU=UN=ffwll.ch=daniel.vetter@srs-us1.protection.inumbo.net>)
 id 1hbswd-0007FC-UK
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 20:37:07 +0000
X-Inumbo-ID: 2c863d04-8ee4-11e9-8980-bc764e045a96
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2c863d04-8ee4-11e9-8980-bc764e045a96;
 Fri, 14 Jun 2019 20:37:06 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id d4so5186906edr.13
 for <xen-devel@lists.xenproject.org>; Fri, 14 Jun 2019 13:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=09V0MjekpLdHC852h4xPIU9vdb05vowz3v43PyqT5EE=;
 b=VYxfPxU3oxDnY3fO4EnZ5Z9V4K4fVsbdhYnR95Dk4yfQaSMGl1kLydyk/qu00S6Cwi
 5zEnobT1sJlWyjN0YG/38g77W/YvcXrqFGP7y8msd2MrdY/Y9qqBTOGoS2b4VeBnkkjk
 9IA4tSgO/NfNyyrNATIY0094hdnyMYG4GlbrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=09V0MjekpLdHC852h4xPIU9vdb05vowz3v43PyqT5EE=;
 b=RL7woDX63n5xRZ3L4vMDy7b0n9viATdQJ3fH0mr6CyaAgYOGThYZOnrElXdxe5r/A1
 rokHE2SNVjzaePdfyexyfGB0GL2hJPaiSmkmZUV3N6PalVMNz+iYwQlm4uXF9oS5sBq/
 9AsqUsRZ6vtg1qzt9SFYE7O05CgNlfzHnBrXN7CqPveAwmvHszlMwXXBY+LrEcJiGn2m
 0GP6T9+1r6GjoHAKxhzm+UiLGM7ehu+e92/SFszwhwFC6zpnlv0YxJietGfJQy+R6dU2
 qYsIqqCKjbgmYnwgzX1vSdMbAJDrJQFi9TR8HlfzZbA84LIufAhCBnRDRoTANvnCQArX
 J1+w==
X-Gm-Message-State: APjAAAV84EusYkyHrTaStZC8ZkIri0cRat+IDKNtiarMJzCpWJsoa9q7
 /VWBps5FtO/7dT4/QYOnB3pStg==
X-Google-Smtp-Source: APXvYqwsNY02FEfQHlqC+BZ6/bDUcOQBorUnJqWM1mr37hzvg/htxDkdTS91HtG3+fbjnKiW4M7RZw==
X-Received: by 2002:a50:8be8:: with SMTP id n37mr82216648edn.216.1560544625875; 
 Fri, 14 Jun 2019 13:37:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.37.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:37:05 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Fri, 14 Jun 2019 22:35:54 +0200
Message-Id: <20190614203615.12639-39-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 38/59] drm/xen: Drop drm_gem_prime_export/import
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhleSdyZSB0aGUgZGVmYXVsdC4KCkFzaWRlOiBXb3VsZCBiZSByZWFsbHkgbmljZSB0byBzd2l0
Y2ggdGhlIG90aGVycyBvdmVyIHRvCmRybV9nZW1fb2JqZWN0X2Z1bmNzLgoKU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBPbGVrc2FuZHIg
QW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+CkNjOiB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKLS0tCiBkcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9k
cm1fZnJvbnQuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jIGIvZHJpdmVycy9ncHUv
ZHJtL3hlbi94ZW5fZHJtX2Zyb250LmMKaW5kZXggYWVmZmVjODJhNWNlLi4wNTE4MjJlZTViMzYg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jCkBAIC00OTEsOCArNDkxLDYgQEAgc3Rh
dGljIHN0cnVjdCBkcm1fZHJpdmVyIHhlbl9kcm1fZHJpdmVyID0gewogCS5nZW1fZnJlZV9vYmpl
Y3RfdW5sb2NrZWQgID0geGVuX2RybV9kcnZfZnJlZV9vYmplY3RfdW5sb2NrZWQsCiAJLnByaW1l
X2hhbmRsZV90b19mZCAgICAgICAgPSBkcm1fZ2VtX3ByaW1lX2hhbmRsZV90b19mZCwKIAkucHJp
bWVfZmRfdG9faGFuZGxlICAgICAgICA9IGRybV9nZW1fcHJpbWVfZmRfdG9faGFuZGxlLAotCS5n
ZW1fcHJpbWVfaW1wb3J0ICAgICAgICAgID0gZHJtX2dlbV9wcmltZV9pbXBvcnQsCi0JLmdlbV9w
cmltZV9leHBvcnQgICAgICAgICAgPSBkcm1fZ2VtX3ByaW1lX2V4cG9ydCwKIAkuZ2VtX3ByaW1l
X2ltcG9ydF9zZ190YWJsZSA9IHhlbl9kcm1fZnJvbnRfZ2VtX2ltcG9ydF9zZ190YWJsZSwKIAku
Z2VtX3ByaW1lX2dldF9zZ190YWJsZSAgICA9IHhlbl9kcm1fZnJvbnRfZ2VtX2dldF9zZ190YWJs
ZSwKIAkuZ2VtX3ByaW1lX3ZtYXAgICAgICAgICAgICA9IHhlbl9kcm1fZnJvbnRfZ2VtX3ByaW1l
X3ZtYXAsCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
