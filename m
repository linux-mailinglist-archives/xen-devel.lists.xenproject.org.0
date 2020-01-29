Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AB614CA53
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 13:07:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwm6o-0005zT-MW; Wed, 29 Jan 2020 12:06:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mEHh=3S=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iwm6m-0005ws-5G
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 12:06:12 +0000
X-Inumbo-ID: aba1f11c-428f-11ea-889e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aba1f11c-428f-11ea-889e-12813bfff9fa;
 Wed, 29 Jan 2020 12:05:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3B79FB1F1;
 Wed, 29 Jan 2020 12:05:41 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Wed, 29 Jan 2020 13:05:31 +0100
Message-Id: <20200129120531.6891-16-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129120531.6891-1-tzimmermann@suse.de>
References: <20200129120531.6891-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 15/15] drm/xen: Explicitly disable automatic
 sending of vblank event
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, xen-devel@lists.xenproject.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGF0b21pYyBoZWxwZXJzIGF1dG9tYXRpY2FsbHkgc2VuZCBvdXQgZmFrZSBWQkxBTksgZXZl
bnRzIGlmIG5vCnZibGFua2luZyBoYXMgYmVlbiBpbml0aWFsaXplZC4gVGhpcyB3b3VsZCBhcHBs
eSB0byB4ZW4sIGJ1dCB4ZW4gaGFzCml0cyBvd24gdmJsYW5rIGxvZ2ljLiBUbyBhdm9pZCBpbnRl
cmZlcmluZyB3aXRoIHRoZSBhdG9taWMgaGVscGVycywKZGlzYWJsZSBhdXRvbWF0aWMgdmJsYW5r
IGV2ZW50cyBleHBsaWNpdGx5LgoKdjU6CgkqIHVwZGF0ZSBjb21tZW50CnY0OgoJKiBzZXBhcmF0
ZSBjb21taXQgZnJvbSBjb3JlIHZibGFuayBjaGFuZ2VzCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMg
WmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQWNrZWQtYnk6IEdlcmQgSG9mZm1hbm4g
PGtyYXhlbEByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBmZndsbC5jaD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfa21z
LmMgfCAxOSArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMu
YyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMuYwppbmRleCA0ZjM0YzUy
MDgxODAuLjc4MDk2YmJjZDIyNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5f
ZHJtX2Zyb250X2ttcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9r
bXMuYwpAQCAtMjIwLDYgKzIyMCwyNCBAQCBzdGF0aWMgYm9vbCBkaXNwbGF5X3NlbmRfcGFnZV9m
bGlwKHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSwKIAlyZXR1cm4gZmFsc2U7
CiB9CiAKK3N0YXRpYyBpbnQgZGlzcGxheV9jaGVjayhzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5
X3BpcGUgKnBpcGUsCisJCQkgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGUsCisJ
CQkgc3RydWN0IGRybV9jcnRjX3N0YXRlICpjcnRjX3N0YXRlKQoreworCS8qCisJICogWGVuIGRv
ZXNuJ3QgaW5pdGlhbGl6ZSB2YmxhbmtpbmcgdmlhIGRybV92YmxhbmtfaW5pdCgpLCBzbworCSAq
IERSTSBoZWxwZXJzIGFzc3VtZSB0aGF0IGl0IGRvZXNuJ3QgaGFuZGxlIHZibGFua2luZyBhbmQg
c3RhcnQKKwkgKiBzZW5kaW5nIG91dCBmYWtlIFZCTEFOSyBldmVudHMgYXV0b21hdGljYWxseS4K
KwkgKgorCSAqIEFzIHhlbiBjb250YWlucyBpdCdzIG93biBsb2dpYyBmb3Igc2VuZGluZyBvdXQg
VkJMQU5LIGV2ZW50cworCSAqIGluIHNlbmRfcGVuZGluZ19ldmVudCgpLCBkaXNhYmxlIG5vX3Zi
bGFuayAoaS5lLiwgdGhlIHhlbgorCSAqIGRyaXZlciBoYXMgdmJsYW5raW5nIHN1cHBvcnQpLgor
CSAqLworCWNydGNfc3RhdGUtPm5vX3ZibGFuayA9IGZhbHNlOworCisJcmV0dXJuIDA7Cit9CisK
IHN0YXRpYyB2b2lkIGRpc3BsYXlfdXBkYXRlKHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlw
ZSAqcGlwZSwKIAkJCSAgIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKm9sZF9wbGFuZV9zdGF0ZSkK
IHsKQEAgLTI4NCw2ICszMDIsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9zaW1wbGVfZGlz
cGxheV9waXBlX2Z1bmNzIGRpc3BsYXlfZnVuY3MgPSB7CiAJLmVuYWJsZSA9IGRpc3BsYXlfZW5h
YmxlLAogCS5kaXNhYmxlID0gZGlzcGxheV9kaXNhYmxlLAogCS5wcmVwYXJlX2ZiID0gZHJtX2dl
bV9mYl9zaW1wbGVfZGlzcGxheV9waXBlX3ByZXBhcmVfZmIsCisJLmNoZWNrID0gZGlzcGxheV9j
aGVjaywKIAkudXBkYXRlID0gZGlzcGxheV91cGRhdGUsCiB9OwogCi0tIAoyLjI1LjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
