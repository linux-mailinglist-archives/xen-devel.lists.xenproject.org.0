Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B69C413C206
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 13:55:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iriAO-00017g-SB; Wed, 15 Jan 2020 12:53:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NEZB=3E=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iriAN-00017L-G8
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 12:52:59 +0000
X-Inumbo-ID: e734a8e6-3795-11ea-a985-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e734a8e6-3795-11ea-a985-bc764e2007e4;
 Wed, 15 Jan 2020 12:52:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7BA3BAFE0;
 Wed, 15 Jan 2020 12:52:34 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Wed, 15 Jan 2020 13:52:22 +0100
Message-Id: <20200115125226.13843-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/4] Use no_vblank property for drivers
 without VBLANK
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
Cc: xen-devel@lists.xenproject.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KFJlc2VuZGluZyBiZWNhdXNlIEkgZGlkIG5vdCBjYyBkcmktZGV2ZWwgcHJvcGVybHkuKQoKSW5z
dGVhZCBvZiBmYWtpbmcgVkJMQU5LIGV2ZW50cyBieSB0aGVtc2VsdmVzLCBkcml2ZXJzIHdpdGhv
dXQgVkJMQU5LCnN1cHBvcnQgY2FuIGVuYWJsZSBkcm1fY3J0Y192Ymxhbmsubm9fdmJsYW5rIGFu
ZCBsZXQgRFJNIGRvIHRoZSByZXN0LgpUaGUgcGF0Y2hzZXQgbWFrZXMgdGhpcyBvZmZpY2lhbCBh
bmQgY29udmVydHMgb3ZlciBzZXZlcmFsIGRyaXZlcnMuCgpBc3QgYWxyZWFkeSB1c2VzIHRoZSBm
dW5jdGlvbmFsaXR5IGFuZCBqdXN0IG5lZWRzIGEgY2xlYW51cC4gQ2lycnVzIGNhbgpiZSBjb252
ZXJ0ZWQgZWFzaWx5IGJ5IHNldHRpbmcgdGhlIGZpZWxkIGluIHRoZSBjaGVjaygpIGNhbGxiYWNr
IGFuZApyZW1vdmluZyB0aGUgZXhpc3RpbmcgVkJMQU5LIGNvZGUuIEZvciBtb3N0IG90aGVyIHNp
bXBsZS1LTVMgZHJpdmVycwp3aXRob3V0IGVuYWJsZV92YmxhbmsoKSBhbmQgY2hlY2soKSwgc2lt
cGxlLUtNUyBoZWxwZXJzIGNhbiBlbmFibGUgdGhlCmZha2VkIFZCTEFOSyBieSBkZWZhdWx0LiBU
aGUgb25seSBleGNlcHRpb24gaXMgWGVuLCB3aGljaCBjb21lcyB3aXRoCml0cyBvd24gVkJMQU5L
IGxvZ2ljIGFuZCBzaG91bGQgcmF0aGVyIHRvIGRpc2FibGUgbm9fdmJsYW5rLgoKdjI6CgkqIGRv
Y3VtZW50IGZ1bmN0aW9uYWxpdHkgKERhbmllbCkKCSogY2xlYW51cCBhc3QgKERhbmllbCkKCSog
bGV0IHNpbXBsZS1rbXMgaGFuZGxlIG5vX3ZibGFuayB3aGVyZSBwb3NzaWJsZQoKVGhvbWFzIFpp
bW1lcm1hbm4gKDQpOgogIGRybTogRG9jdW1lbnQgc3RydWN0IGRybV9jcnRjX3N0YXRlLm5vX3Zi
bGFuayBmb3IgZmFraW5nIFZCTEFOSyBldmVudHMKICBkcm0vYXN0OiBTZXQgc3RydWN0IGRybV9j
cnRjX3N0YXRlLm5vX3ZibGFuayBpbiBhdG9taWNfY2hlY2soKQogIGRybS9jaXJydXM6IExldCBE
Uk0gY29yZSBzZW5kIFZCTEFOSyBldmVudHMKICBkcm0vc2ltcGxlLWttczogTGV0IERSTSBjb3Jl
IHNlbmQgVkJMQU5LIGV2ZW50cyBieSBkZWZhdWx0CgogZHJpdmVycy9ncHUvZHJtL2FzdC9hc3Rf
bW9kZS5jICAgICAgICAgIHwgIDQgKystLQogZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2tt
cy5jICAgICAgIHwgIDkgLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1cy5j
ICAgICAgICAgfCAxMCArKy0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxw
ZXIuYyAgICAgfCAgNCArKystCiBkcml2ZXJzL2dwdS9kcm0vZHJtX21pcGlfZGJpLmMgICAgICAg
ICAgfCAgOSAtLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fc2ltcGxlX2ttc19oZWxwZXIu
YyB8IDE5ICsrKysrKysrKysrKysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS90aW55L2dtMTJ1MzIw
LmMgICAgICAgICB8ICA5IC0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3RpbnkvaWxpOTIyNS5j
ICAgICAgICAgIHwgIDkgLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdGlueS9yZXBhcGVyLmMg
ICAgICAgICAgfCAgOSAtLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS90aW55L3N0NzU4Ni5jICAg
ICAgICAgICB8ICA5IC0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5j
ICAgICAgIHwgMTEgLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9u
dF9rbXMuYyB8IDEzICsrKysrKysrKysrKysKIGluY2x1ZGUvZHJtL2RybV9jcnRjLmggICAgICAg
ICAgICAgICAgICB8ICA5ICsrKysrKystLQogaW5jbHVkZS9kcm0vZHJtX3NpbXBsZV9rbXNfaGVs
cGVyLmggICAgIHwgIDcgKysrKystLQogMTQgZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygr
KSwgODQgZGVsZXRpb25zKC0pCgotLQoyLjI0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
