Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EA1142A88
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 13:23:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itW3M-0001DP-Q9; Mon, 20 Jan 2020 12:21:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nhcu=3J=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1itW3K-0001D2-QO
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 12:21:10 +0000
X-Inumbo-ID: 4effbb72-3b7f-11ea-b95e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4effbb72-3b7f-11ea-b95e-12813bfff9fa;
 Mon, 20 Jan 2020 12:20:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BE130AC7C;
 Mon, 20 Jan 2020 12:20:54 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Mon, 20 Jan 2020 13:20:47 +0100
Message-Id: <20200120122051.25178-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 0/4] Use no_vblank property for drivers
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
bG9va3MgYXQgdGhlIG51bWJlciBvZiBpbml0aWFsaXplZCBDUlRDcwp3cnQgdmJsYW5raW5nLiBJ
ZiB2YmxhbmtpbmcgaGFzIGJlZW4gaW5pdGlhbGl6ZWQgZm9yIGEgQ1JUQywgdGhlIGRyaXZlcgpp
cyByZXNwb25zaWJsZSBmb3Igc2VuZGluZyBvdXQgVkJMQU5LIGV2ZW50cy4gT3RoZXJ3aXNlLCBE
Uk0gd2lsbCBzZW5kCm91dCB0aGUgZXZlbnQuIFRoZSBiZWhhdmlvdXIgc2VsZWN0ZWQgYnkgaW5p
dGlhbGl6aW5nIG5vX3ZibGFuayBhcyBwYXJ0Cm9mIGRybV9hdG9taWNfaGVscGVyX2NoZWNrX21v
ZGVzZXQoKS4KCkkgd2VudCB0aHJvdWdoIGFsbCBkcml2ZXJzLCBsb29raW5nIGZvciB0aG9zZSB0
aGF0IGNhbGwgc2VuZCBvdXQgVkJMQU5LCmV2ZW50cyBidXQgZG8gbm90IGNhbGwgZHJtX3ZibGFu
a19pbml0KCkuIFRoZXNlIGFyZSBjb252ZXJ0ZWQgdG8gdGhlIG5ldwpzZW1hbnRpY3MuIFRoaXMg
YWZmZWN0cyB0aW55IGRyaXZlcnM7IGRyaXZlcnMgZm9yIHZpcnR1YWwgaGFyZHdhcmU7IGFuZAph
IGZldyBvdGhlcnMsIHdoaWNoIGRvIG5vdCBzdXBwb3J0IGludGVycnVwdHMuIFhlbiBjb21lcyB3
aXRoIGl0cwpvd24gVkJMQU5LIGxvZ2ljIGFuZCBkaXNhYmxlcyBub192YmxhbmsgZXhwbGljdGx5
LgoKRm9yIG5vdywgSSBsZWZ0IG91dCBIYW5zJyBSLWIgb24gdjIgb2YgdGhlIHNlcmllcywgYXMg
dGhlIHBhdGNoZXMgY2hhbmdlZApxdWl0ZSBhIGJpdC4KCnYzOgoJKiByZW9yZGVyIGFuZCBzcXVh
c2ggcGF0Y2hlcwoJKiBzZXQgbm9fdmJsYW5rIGluIGRybV9hdG9taWNfaGVscGVyX2NoZWNrX21v
ZGVzZXQoKSBmb3IgKmFsbCoKCSAgZHJpdmVycyAoRGFuaWVsKQoJKiBjb252ZXJ0IGFsbCBkcml2
ZXJzIHRvIG5ldyBzZW1uYXRpY3MgYXMgbmVjZXNzYXJ5CnYyOgoJKiBkb2N1bWVudCBmdW5jdGlv
bmFsaXR5IChEYW5pZWwpCgkqIGNsZWFudXAgYXN0IChEYW5pZWwpCgkqIGxldCBzaW1wbGUta21z
IGhhbmRsZSBub192Ymxhbmsgd2hlcmUgcG9zc2libGUKClRob21hcyBaaW1tZXJtYW5uICg0KToK
ICBkcm06IEFkZCBkcm1fY3J0Y19oYXNfdmJsYW5rKCkKICBkcm06IEluaXRpYWxpemUgc3RydWN0
IGRybV9jcnRjX3N0YXRlLm5vX3ZibGFuayBmcm9tIGRldmljZSBzZXR0aW5ncwogIGRybS9hc3Q6
IERvbid0IHNldCBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUubm9fdmJsYW5rIGV4cGxpY3RseQogIGRy
bS91ZGw6IERvbid0IHNldCBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUubm9fdmJsYW5rIGV4cGxpY3Rs
eQoKIGRyaXZlcnMvZ3B1L2RybS9hcmMvYXJjcGd1X2NydGMuYyAgICAgICAgfCAxNiAtLS0tLS0t
LS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgICAgICAgICAgIHwgIDIgLS0K
IGRyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19rbXMuYyAgICAgICAgfCAgOSAtLS0tLS0tCiBk
cml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1cy5jICAgICAgICAgIHwgIDggLS0tLS0tLQogZHJp
dmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMgICAgICB8IDEwICsrKysrKystCiBkcml2
ZXJzL2dwdS9kcm0vZHJtX21pcGlfZGJpLmMgICAgICAgICAgIHwgIDkgLS0tLS0tLQogZHJpdmVy
cy9ncHUvZHJtL2RybV92YmxhbmsuYyAgICAgICAgICAgICB8IDMwICsrKysrKysrKysrKysrKysr
KysrKysrKwogZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZGlzcGxheS5jICAgICAgICB8IDE0IC0t
LS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdGlueS9nbTEydTMyMC5jICAgICAgICAgIHwgIDkg
LS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3RpbnkvaWxpOTIyNS5jICAgICAgICAgICB8ICA5IC0t
LS0tLS0KIGRyaXZlcnMvZ3B1L2RybS90aW55L3JlcGFwZXIuYyAgICAgICAgICAgfCAgOSAtLS0t
LS0tCiBkcml2ZXJzL2dwdS9kcm0vdGlueS9zdDc1ODYuYyAgICAgICAgICAgIHwgIDkgLS0tLS0t
LQogZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5jICAgICAgICB8IDExIC0tLS0tLS0t
LQogZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby92Ym94X21vZGUuYyAgICB8IDEyIC0tLS0tLS0t
LS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kaXNwbGF5LmMgfCAgOCAtLS0tLS0t
CiBkcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfa21zLmMgIHwgMTMgKysrKysrKysr
KwogaW5jbHVkZS9kcm0vZHJtX2NydGMuaCAgICAgICAgICAgICAgICAgICB8IDI3ICsrKysrKysr
KysrKysrKy0tLS0tLQogaW5jbHVkZS9kcm0vZHJtX3NpbXBsZV9rbXNfaGVscGVyLmggICAgICB8
ICA3ICsrKystLQogaW5jbHVkZS9kcm0vZHJtX3ZibGFuay5oICAgICAgICAgICAgICAgICB8ICAx
ICsKIDE5IGZpbGVzIGNoYW5nZWQsIDc4IGluc2VydGlvbnMoKyksIDEzNSBkZWxldGlvbnMoLSkK
Ci0tCjIuMjQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
