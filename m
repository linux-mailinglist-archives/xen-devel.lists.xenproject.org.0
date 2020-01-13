Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E84A2138F63
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 11:41:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iqx7r-0007bY-8W; Mon, 13 Jan 2020 10:39:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gBiX=3C=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iqx7A-0007Z6-JM
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 10:38:32 +0000
X-Inumbo-ID: d74f3e4c-35f0-11ea-8249-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d74f3e4c-35f0-11ea-8249-12813bfff9fa;
 Mon, 13 Jan 2020 10:38:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BC65CAD5C;
 Mon, 13 Jan 2020 10:38:29 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Mon, 13 Jan 2020 11:38:20 +0100
Message-Id: <20200113103822.24473-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200113103822.24473-1-tzimmermann@suse.de>
References: <20200113103822.24473-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 13 Jan 2020 10:39:14 +0000
Subject: [Xen-devel] [PATCH v2 2/4] drm/ast: Set struct
 drm_crtc_state.no_vblank in atomic_check()
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
Cc: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.or,
 Thomas Zimmermann <tzimmermann@suse.de>,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q1JUQyBzdGF0ZSBwcm9wZXJ0aWVzIHNob3VsZCBiZSBjb21wdXRlZCBpbiBhdG9taWNfY2hlY2so
KS4gRG8gc28gZm9yCnRoZSBub192YmxhbmsgZmllbGQuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMg
WmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYXN0
L2FzdF9tb2RlLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jCmluZGV4IDM0NjA4ZjA0OTllYi4uZWY3
YTBiMDhjYzA1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jCkBAIC04MDAsNiArODAwLDggQEAgc3Rh
dGljIGludCBhc3RfY3J0Y19oZWxwZXJfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fY3J0YyAqY3J0
YywKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCisJc3RhdGUtPm5vX3ZibGFuayA9IHRydWU7CisK
IAlhc3Rfc3RhdGUgPSB0b19hc3RfY3J0Y19zdGF0ZShzdGF0ZSk7CiAKIAlmb3JtYXQgPSBhc3Rf
c3RhdGUtPmZvcm1hdDsKQEAgLTgzMyw4ICs4MzUsNiBAQCBzdGF0aWMgdm9pZCBhc3RfY3J0Y19o
ZWxwZXJfYXRvbWljX2ZsdXNoKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAlzdHJ1Y3QgYXN0X3Zi
aW9zX21vZGVfaW5mbyAqdmJpb3NfbW9kZV9pbmZvOwogCXN0cnVjdCBkcm1fZGlzcGxheV9tb2Rl
ICphZGp1c3RlZF9tb2RlOwogCi0JY3J0Yy0+c3RhdGUtPm5vX3ZibGFuayA9IHRydWU7Ci0KIAlh
c3Rfc3RhdGUgPSB0b19hc3RfY3J0Y19zdGF0ZShjcnRjLT5zdGF0ZSk7CiAKIAlmb3JtYXQgPSBh
c3Rfc3RhdGUtPmZvcm1hdDsKLS0gCjIuMjQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
