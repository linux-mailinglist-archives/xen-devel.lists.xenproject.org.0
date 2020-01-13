Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9115D138F69
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 11:41:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iqx7r-0007be-IT; Mon, 13 Jan 2020 10:39:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gBiX=3C=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iqx7F-0007ZZ-Hi
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 10:38:37 +0000
X-Inumbo-ID: d74f4252-35f0-11ea-8249-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d74f4252-35f0-11ea-8249-12813bfff9fa;
 Mon, 13 Jan 2020 10:38:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BC786B15A;
 Mon, 13 Jan 2020 10:38:29 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Mon, 13 Jan 2020 11:38:18 +0100
Message-Id: <20200113103822.24473-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 13 Jan 2020 10:39:14 +0000
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
Cc: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.or,
 Thomas Zimmermann <tzimmermann@suse.de>,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW5zdGVhZCBvZiBmYWtpbmcgVkJMQU5LIGV2ZW50cyBieSB0aGVtc2VsdmVzLCBkcml2ZXJzIHdp
dGhvdXQgVkJMQU5LCnN1cHBvcnQgY2FuIGVuYWJsZSBkcm1fY3J0Y192Ymxhbmsubm9fdmJsYW5r
IGFuZCBsZXQgRFJNIGRvIHRoZSByZXN0LgpUaGUgcGF0Y2hzZXQgbWFrZXMgdGhpcyBvZmZpY2lh
bCBhbmQgY29udmVydHMgb3ZlciBzZXZlcmFsIGRyaXZlcnMuCgpBc3QgYWxyZWFkeSB1c2VzIHRo
ZSBmdW5jdGlvbmFsaXR5IGFuZCBqdXN0IG5lZWRzIGEgY2xlYW51cC4gQ2lycnVzIGNhbgpiZSBj
b252ZXJ0ZWQgZWFzaWx5IGJ5IHNldHRpbmcgdGhlIGZpZWxkIGluIHRoZSBjaGVjaygpIGNhbGxi
YWNrIGFuZApyZW1vdmluZyB0aGUgZXhpc3RpbmcgVkJMQU5LIGNvZGUuIEZvciBtb3N0IG90aGVy
IHNpbXBsZS1LTVMgZHJpdmVycwp3aXRob3V0IGVuYWJsZV92YmxhbmsoKSBhbmQgY2hlY2soKSwg
c2ltcGxlLUtNUyBoZWxwZXJzIGNhbiBlbmFibGUgdGhlCmZha2VkIFZCTEFOSyBieSBkZWZhdWx0
LiBUaGUgb25seSBleGNlcHRpb24gaXMgWGVuLCB3aGljaCBjb21lcyB3aXRoCml0cyBvd24gVkJM
QU5LIGxvZ2ljIGFuZCBzaG91bGQgcmF0aGVyIHRvIGRpc2FibGUgbm9fdmJsYW5rLgoKdjI6Cgkq
IGRvY3VtZW50IGZ1bmN0aW9uYWxpdHkgKERhbmllbCkKCSogY2xlYW51cCBhc3QgKERhbmllbCkK
CSogbGV0IHNpbXBsZS1rbXMgaGFuZGxlIG5vX3ZibGFuayB3aGVyZSBwb3NzaWJsZQoKVGhvbWFz
IFppbW1lcm1hbm4gKDQpOgogIGRybTogRG9jdW1lbnQgc3RydWN0IGRybV9jcnRjX3N0YXRlLm5v
X3ZibGFuayBmb3IgZmFraW5nIFZCTEFOSyBldmVudHMKICBkcm0vYXN0OiBTZXQgc3RydWN0IGRy
bV9jcnRjX3N0YXRlLm5vX3ZibGFuayBpbiBhdG9taWNfY2hlY2soKQogIGRybS9jaXJydXM6IExl
dCBEUk0gY29yZSBzZW5kIFZCTEFOSyBldmVudHMKICBkcm0vc2ltcGxlLWttczogTGV0IERSTSBj
b3JlIHNlbmQgVkJMQU5LIGV2ZW50cyBieSBkZWZhdWx0CgogZHJpdmVycy9ncHUvZHJtL2FzdC9h
c3RfbW9kZS5jICAgICAgICAgIHwgIDQgKystLQogZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hz
X2ttcy5jICAgICAgIHwgIDkgLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1
cy5jICAgICAgICAgfCAxMCArKy0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19o
ZWxwZXIuYyAgICAgfCAgNCArKystCiBkcml2ZXJzL2dwdS9kcm0vZHJtX21pcGlfZGJpLmMgICAg
ICAgICAgfCAgOSAtLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fc2ltcGxlX2ttc19oZWxw
ZXIuYyB8IDE5ICsrKysrKysrKysrKysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS90aW55L2dtMTJ1
MzIwLmMgICAgICAgICB8ICA5IC0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3RpbnkvaWxpOTIy
NS5jICAgICAgICAgIHwgIDkgLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdGlueS9yZXBhcGVy
LmMgICAgICAgICAgfCAgOSAtLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS90aW55L3N0NzU4Ni5j
ICAgICAgICAgICB8ICA5IC0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNl
dC5jICAgICAgIHwgMTEgLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9m
cm9udF9rbXMuYyB8IDEzICsrKysrKysrKysrKysKIGluY2x1ZGUvZHJtL2RybV9jcnRjLmggICAg
ICAgICAgICAgICAgICB8ICA5ICsrKysrKystLQogaW5jbHVkZS9kcm0vZHJtX3NpbXBsZV9rbXNf
aGVscGVyLmggICAgIHwgIDcgKysrKystLQogMTQgZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9u
cygrKSwgODQgZGVsZXRpb25zKC0pCgotLQoyLjI0LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
