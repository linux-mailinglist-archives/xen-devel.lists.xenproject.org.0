Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D60B142A84
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 13:23:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itW3S-0001Fc-65; Mon, 20 Jan 2020 12:21:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nhcu=3J=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1itW3P-0001Ek-Qo
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 12:21:15 +0000
X-Inumbo-ID: 4eff4ea9-3b7f-11ea-b95e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4eff4ea9-3b7f-11ea-b95e-12813bfff9fa;
 Mon, 20 Jan 2020 12:20:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9CA52ADB5;
 Mon, 20 Jan 2020 12:20:55 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Mon, 20 Jan 2020 13:20:51 +0100
Message-Id: <20200120122051.25178-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200120122051.25178-1-tzimmermann@suse.de>
References: <20200120122051.25178-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 4/4] drm/udl: Don't set struct
 drm_crtc_state.no_vblank explictly
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

QXMgdWRsIGRvZXMgbm90IGluaXRpYWxpemUgdmJsYW5raW5nLCBhdG9taWMgaGVscGVycyBpbml0
aWFsaXplIHRoZQp2YWx1ZSBvZiBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUubm9fdmJsYW5rIHRvIGJl
IHRydWUuIE5vIG5lZWQgdG8gc2V0Cml0IGZyb20gd2l0aGluIHRoZSBkcml2ZXIuCgpTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vdWRsL3VkbF9tb2Rlc2V0LmMgfCAxMSAtLS0tLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS91ZGwv
dWRsX21vZGVzZXQuYyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21vZGVzZXQuYwppbmRleCAy
MmFmMTc5NTkwNTMuLmQ1OWViYWM3MGIxNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Vk
bC91ZGxfbW9kZXNldC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21vZGVzZXQuYwpA
QCAtMzc1LDggKzM3NSw2IEBAIHVkbF9zaW1wbGVfZGlzcGxheV9waXBlX2VuYWJsZShzdHJ1Y3Qg
ZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUsCiAJY2hhciAqd3JwdHI7CiAJaW50IGNvbG9y
X2RlcHRoID0gVURMX0NPTE9SX0RFUFRIXzE2QlBQOwogCi0JY3J0Y19zdGF0ZS0+bm9fdmJsYW5r
ID0gdHJ1ZTsKLQogCWJ1ZiA9IChjaGFyICopdWRsLT5tb2RlX2J1ZjsKIAogCS8qIFRoaXMgZmly
c3Qgc2VjdGlvbiBoYXMgdG8gZG8gd2l0aCBzZXR0aW5nIHRoZSBiYXNlIGFkZHJlc3Mgb24gdGhl
CkBAIC00MjgsMTQgKzQyNiw2IEBAIHVkbF9zaW1wbGVfZGlzcGxheV9waXBlX2Rpc2FibGUoc3Ry
dWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlICpwaXBlKQogCXVkbF9zdWJtaXRfdXJiKGRldiwg
dXJiLCBidWYgLSAoY2hhciAqKXVyYi0+dHJhbnNmZXJfYnVmZmVyKTsKIH0KIAotc3RhdGljIGlu
dAotdWRsX3NpbXBsZV9kaXNwbGF5X3BpcGVfY2hlY2soc3RydWN0IGRybV9zaW1wbGVfZGlzcGxh
eV9waXBlICpwaXBlLAotCQkJICAgICAgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqcGxhbmVfc3Rh
dGUsCi0JCQkgICAgICBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3RhdGUpCi17Ci0JcmV0
dXJuIDA7Ci19Ci0KIHN0YXRpYyB2b2lkCiB1ZGxfc2ltcGxlX2Rpc3BsYXlfcGlwZV91cGRhdGUo
c3RydWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlICpwaXBlLAogCQkJICAgICAgIHN0cnVjdCBk
cm1fcGxhbmVfc3RhdGUgKm9sZF9wbGFuZV9zdGF0ZSkKQEAgLTQ1Nyw3ICs0NDcsNiBAQCBzdHJ1
Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGVfZnVuY3MgdWRsX3NpbXBsZV9kaXNwbGF5X3BpcGVf
ZnVuY3MgPSB7CiAJLm1vZGVfdmFsaWQgPSB1ZGxfc2ltcGxlX2Rpc3BsYXlfcGlwZV9tb2RlX3Zh
bGlkLAogCS5lbmFibGUgPSB1ZGxfc2ltcGxlX2Rpc3BsYXlfcGlwZV9lbmFibGUsCiAJLmRpc2Fi
bGUgPSB1ZGxfc2ltcGxlX2Rpc3BsYXlfcGlwZV9kaXNhYmxlLAotCS5jaGVjayA9IHVkbF9zaW1w
bGVfZGlzcGxheV9waXBlX2NoZWNrLAogCS51cGRhdGUgPSB1ZGxfc2ltcGxlX2Rpc3BsYXlfcGlw
ZV91cGRhdGUsCiAJLnByZXBhcmVfZmIgPSBkcm1fZ2VtX2ZiX3NpbXBsZV9kaXNwbGF5X3BpcGVf
cHJlcGFyZV9mYiwKIH07Ci0tIAoyLjI0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
