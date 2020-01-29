Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C33E14CA57
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 13:08:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwm6K-0005Zw-Rn; Wed, 29 Jan 2020 12:05:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mEHh=3S=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iwm6I-0005Za-79
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 12:05:42 +0000
X-Inumbo-ID: a8409f5a-428f-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8409f5a-428f-11ea-b211-bc764e2007e4;
 Wed, 29 Jan 2020 12:05:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B145AAFAC;
 Wed, 29 Jan 2020 12:05:34 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Wed, 29 Jan 2020 13:05:16 +0100
Message-Id: <20200129120531.6891-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 00/15] Use no_vblank property for drivers
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

SW5zdGVhZCBvZiBmYWtpbmcgVkJMQU5LIGV2ZW50cyBieSB0aGVtc2VsdmVzLCBkcml2ZXJzIHdp
dGhvdXQgVkJMQU5LCnN1cHBvcnQgY2FuIGVuYWJsZSBkcm1fY3J0Y192Ymxhbmsubm9fdmJsYW5r
IGFuZCBsZXQgRFJNIGRvIHRoZSByZXN0LgpUaGUgcGF0Y2hzZXQgbWFrZXMgdGhpcyBvZmZpY2lh
bCBhbmQgY29udmVydHMgb3ZlciBkcml2ZXJzLgoKVGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24g
bG9va3MgYXQgc3RhdGUgb2YgYSBkZXZpY2Ugd3J0IHZibGFua2luZy4gSWYKdmJsYW5raW5nIGhh
cyBiZWVuIGluaXRpYWxpemVkIGZvciB0aGUgZGV2aWNlLCB0aGUgZHJpdmVyIGlzIHJlc3BvbnNp
YmxlCmZvciBzZW5kaW5nIG91dCBWQkxBTksgZXZlbnRzLiBPdGhlcndpc2UsIERSTSB3aWxsIHNl
bmQgb3V0IHRoZSBldmVudC4KVGhlIGJlaGF2aW91ciBpcyBzZWxlY3RlZCBieSBpbml0aWFsaXpp
bmcgbm9fdmJsYW5rIGFzIHBhcnQgb2YKZHJtX2F0b21pY19oZWxwZXJfY2hlY2tfbW9kZXNldCgp
LgoKSSB3ZW50IHRocm91Z2ggYWxsIGRyaXZlcnMsIGxvb2tpbmcgZm9yIHRob3NlIHRoYXQgY2Fs
bCBzZW5kIG91dCBWQkxBTksKZXZlbnRzIGJ1dCBkbyBub3QgY2FsbCBkcm1fdmJsYW5rX2luaXQo
KS4gVGhlc2UgYXJlIGNvbnZlcnRlZCB0byB0aGUgbmV3CnNlbWFudGljcy4gVGhpcyBhZmZlY3Rz
IHRpbnkgZHJpdmVyczsgZHJpdmVycyBmb3IgdmlydHVhbCBoYXJkd2FyZTsgYW5kCmEgZmV3IG90
aGVycywgd2hpY2ggZG8gbm90IHN1cHBvcnQgaW50ZXJydXB0cy4gWGVuIGNvbWVzIHdpdGggaXRz
Cm93biBWQkxBTksgbG9naWMgYW5kIG5vdyBkaXNhYmxlcyBub192YmxhbmsgZXhwbGljaXRseS4K
CnY1OgoJKiBkb2N1bWVudGF0aW9uIHVwZGF0ZXMgaW4gRFJNIGNvcmUgYW5kIHhlbiAoRGFuaWVs
LCBFbWlsLCBPbGVrc2FuZHIpCnY0OgoJKiByZXBsYWNlZCBkcm1fY3J0Y19oYXNfdmJsYW5rKCkg
d2l0aCBkcm1fZGV2X2hhc192YmxhbmsoKSAoRGFuaWVsKQoJKiBzcXVhc2hlZCBwYXRjaGVzIDEg
YW5kIDIKCSogbW92ZWQgZHJpdmVyIHVwZGF0ZXMgaW50byBzZXBhcmF0ZSBwYXRjaGVzCnYzOgoJ
KiByZW9yZGVyIGFuZCBzcXVhc2ggcGF0Y2hlcwoJKiBzZXQgbm9fdmJsYW5rIGluIGRybV9hdG9t
aWNfaGVscGVyX2NoZWNrX21vZGVzZXQoKSBmb3IgKmFsbCoKCSAgZHJpdmVycyAoRGFuaWVsKQoJ
KiBjb252ZXJ0IGFsbCBkcml2ZXJzIHRvIG5ldyBzZW1uYXRpY3MgYXMgbmVjZXNzYXJ5CnYyOgoJ
KiBkb2N1bWVudCBmdW5jdGlvbmFsaXR5IChEYW5pZWwpCgkqIGNsZWFudXAgYXN0IChEYW5pZWwp
CgkqIGxldCBzaW1wbGUta21zIGhhbmRsZSBub192Ymxhbmsgd2hlcmUgcG9zc2libGUKClRob21h
cyBaaW1tZXJtYW5uICgxNSk6CiAgZHJtOiBJbml0aWFsaXplIHN0cnVjdCBkcm1fY3J0Y19zdGF0
ZS5ub192YmxhbmsgZnJvbSBkZXZpY2Ugc2V0dGluZ3MKICBkcm0vYXJjOiBSZW1vdmUgc2VuZGlu
ZyBvZiB2YmxhbmsgZXZlbnQKICBkcm0vYXN0OiBEb24ndCBzZXQgc3RydWN0IGRybV9jcnRjX3N0
YXRlLm5vX3ZibGFuayBleHBsaWN0bHkKICBkcm0vYm9jaHM6IFJlbW92ZSBzZW5kaW5nIG9mIHZi
bGFuayBldmVudAogIGRybS9jaXJydXM6IFJlbW92ZSBzZW5kaW5nIG9mIHZibGFuayBldmVudAog
IGRybS9nbTEydTMyMDogUmVtb3ZlIHNlbmRpbmcgb2YgdmJsYW5rIGV2ZW50CiAgZHJtL2lsaTky
MjU6IFJlbW92ZSBzZW5kaW5nIG9mIHZibGFuayBldmVudAogIGRybS9taXBpLWRiaTogUmVtb3Zl
IHNlbmRpbmcgb2YgdmJsYW5rIGV2ZW50CiAgZHJtL3F4bDogUmVtb3ZlIHNlbmRpbmcgb2YgdmJs
YW5rIGV2ZW50CiAgZHJtL3JlcGFwZXI6IFJlbW92ZSBzZW5kaW5nIG9mIHZibGFuayBldmVudAog
IGRybS9zdDc1ODY6IFJlbW92ZSBzZW5kaW5nIG9mIHZibGFuayBldmVudAogIGRybS91ZGw6IERv
bid0IHNldCBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUubm9fdmJsYW5rIGV4cGxpY3RseQogIGRybS92
Ym94dmlkZW86IFJlbW92ZSBzZW5kaW5nIG9mIHZibGFuayBldmVudAogIGRybS92aXJ0aW86IFJl
bW92ZSBzZW5kaW5nIG9mIHZibGFuayBldmVudAogIGRybS94ZW46IEV4cGxpY2l0bHkgZGlzYWJs
ZSBhdXRvbWF0aWMgc2VuZGluZyBvZiB2YmxhbmsgZXZlbnQKCiBkcml2ZXJzL2dwdS9kcm0vYXJj
L2FyY3BndV9jcnRjLmMgICAgICAgIHwgMTYgLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9h
c3QvYXN0X21vZGUuYyAgICAgICAgICAgfCAgMiAtLQogZHJpdmVycy9ncHUvZHJtL2JvY2hzL2Jv
Y2hzX2ttcy5jICAgICAgICB8ICA5IC0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2ly
cnVzLmMgICAgICAgICAgfCAgOCAtLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hl
bHBlci5jICAgICAgfCAxMCArKysrKystCiBkcml2ZXJzL2dwdS9kcm0vZHJtX21pcGlfZGJpLmMg
ICAgICAgICAgIHwgIDkgLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYyAgICAg
ICAgICAgICB8IDI4ICsrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9xeGwvcXhs
X2Rpc3BsYXkuYyAgICAgICAgfCAxNCAtLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdGlueS9n
bTEydTMyMC5jICAgICAgICAgIHwgIDkgLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3RpbnkvaWxp
OTIyNS5jICAgICAgICAgICB8ICA5IC0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS90aW55L3JlcGFw
ZXIuYyAgICAgICAgICAgfCAgOSAtLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdGlueS9zdDc1ODYu
YyAgICAgICAgICAgIHwgIDkgLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNl
dC5jICAgICAgICB8IDExIC0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL3Zib3hf
bW9kZS5jICAgIHwgMTIgLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVf
ZGlzcGxheS5jIHwgIDggLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRf
a21zLmMgIHwgMTkgKysrKysrKysrKysrKwogaW5jbHVkZS9kcm0vZHJtX2NydGMuaCAgICAgICAg
ICAgICAgICAgICB8IDM0ICsrKysrKysrKysrKysrKysrKystLS0tLQogaW5jbHVkZS9kcm0vZHJt
X3NpbXBsZV9rbXNfaGVscGVyLmggICAgICB8ICA3ICsrKy0tCiBpbmNsdWRlL2RybS9kcm1fdmJs
YW5rLmggICAgICAgICAgICAgICAgIHwgIDEgKwogMTkgZmlsZXMgY2hhbmdlZCwgODkgaW5zZXJ0
aW9ucygrKSwgMTM1IGRlbGV0aW9ucygtKQoKLS0KMi4yNS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
