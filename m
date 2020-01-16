Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5571C13D483
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 07:45:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iryqG-0000N8-Ah; Thu, 16 Jan 2020 06:41:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1xV+=3F=ffwll.ch=daniel@srs-us1.protection.inumbo.net>)
 id 1iryqE-0000N3-Pg
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 06:41:18 +0000
X-Inumbo-ID: 32984ed8-382b-11ea-a985-bc764e2007e4
Received: from mail-pg1-x542.google.com (unknown [2607:f8b0:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32984ed8-382b-11ea-a985-bc764e2007e4;
 Thu, 16 Jan 2020 06:41:17 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id k3so9402296pgc.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2020 22:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=f+3QqTgKD7g/KMqBuMVdD0S0/jS8wXuOx0d2mRo05wM=;
 b=HWyZ3sMXGypZPNNMnZ852l+iVVKgncaqVj3flIFUoNqtIfd60EyelDa3m2LZrvRnBr
 h0l7o9f8UC4fo6HCkftcKVspCowdS+e6L/ybziqj3RV6Rrr6GakIosK/u3nobSMoK8hX
 lSxCdkVTZryN2yp+LCBmbzoysuD5mrcoDIeEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f+3QqTgKD7g/KMqBuMVdD0S0/jS8wXuOx0d2mRo05wM=;
 b=fClW1vVfPd6agJzD0/Z5CIZANODFHriotPQy4+6z+5SQ/yyxGZ2JHo/4L01staANnq
 ecBMTMSXfWzACKyffFC2sIN3YruFfa6H+zh4SiAiyQkVPa5nyEN4sATs9ZvT1j8xYiIM
 0S4DedZsF3dKgiX+XebarWQaSeYFTrWRQvZ6U8dJWH0/AASzc0we7vcHVJ6WqfKLLZZT
 Olj6Ibl25AS9nCj62JshUjrPDnCpr1d7jaLi4094ik3/S77mSQ4epgGjQgAClTsot6Cw
 vtj/IIjAg7clCPbhgfzaGUZbKEQFsGRjHBjBWqBFeUJeUIMP4GYRXc7levu3hgJNIvgS
 Pi3w==
X-Gm-Message-State: APjAAAUmQoFObE3WT+gTIxV2sXc4hTzPtWT2Ntavu42BcUjsjzIVm6Nn
 Knsxv/3WIyUUeDSKRdK4YsUWqQ==
X-Google-Smtp-Source: APXvYqwZqouniRGqLdIbpa7A320WvTTDLYRevXEYwIJDywXZPmI0KIu4Kbc7bxX/PQE5dglAyvziBw==
X-Received: by 2002:a63:e0c:: with SMTP id d12mr36249068pgl.3.1579156876764;
 Wed, 15 Jan 2020 22:41:16 -0800 (PST)
Received: from dvetter-linux.ger.corp.intel.com ([138.44.248.126])
 by smtp.gmail.com with ESMTPSA id a1sm23642333pfo.68.2020.01.15.22.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 22:41:16 -0800 (PST)
Date: Thu, 16 Jan 2020 07:41:07 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <20200116064107.GB8400@dvetter-linux.ger.corp.intel.com>
References: <20200115125226.13843-1-tzimmermann@suse.de>
 <20200115125226.13843-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200115125226.13843-5-tzimmermann@suse.de>
X-Operating-System: Linux dvetter-linux.ger.corp.intel.com
 5.2.11-200.fc30.x86_64 
Subject: Re: [Xen-devel] [PATCH v2 4/4] drm/simple-kms: Let DRM core send
 VBLANK events by default
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
Cc: david@lechnology.com, oleksandr_andrushchenko@epam.com, airlied@linux.ie,
 sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 noralf@tronnes.org, kraxel@redhat.com, daniel@ffwll.ch,
 xen-devel@lists.xenproject.org, emil.velikov@collabora.com, sean@poorly.run,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMTUsIDIwMjAgYXQgMDE6NTI6MjZQTSArMDEwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gSW4gZHJtX2F0b21pY19oZWxwZXJfZmFrZV92YmxhbmsoKSB0aGUgRFJNIGNv
cmUgc2VuZHMgb3V0IFZCTEFOSyBldmVudHMKPiBpZiBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUubm9f
dmJsYW5rIGlzIGVuYWJsZWQgaW4gdGhlIGNoZWNrKCkgY2FsbGJhY2tzLgo+IAo+IEZvciBkcml2
ZXJzIHRoYXQgaGF2ZSBuZWl0aGVyIGFuIGVuYWJsZV92YmxhbmsoKSBjYWxsYmFjayBub3IgYSBj
aGVjaygpCj4gY2FsbGJhY2ssIHRoZSBzaW1wbGUtS01TIGhlbHBlcnMgZW5hYmxlIFZCTEFOSyBn
ZW5lcmF0aW9uIGJ5IGRlZmF1bHQuIFRoaXMKPiBzaW1wbGlmaWVzIGJvY2hzLCB1ZGwsIHNldmVy
YWwgdGlueSBkcml2ZXJzLCBhbmQgZHJpdmVycyBiYXNlZCB1cG9uIE1JUEkKPiBEUEkgaGVscGVy
cy4gVGhlIGRyaXZlciBmb3IgWGVuIGV4cGxpY2l0bHkgZGlzYWJsZXMgbm9fdmJsYW5rLCBhcyBp
dCBoYXMKPiBpdHMgb3duIGxvZ2ljIGZvciBzZW5kaW5nIHRoZXNlIGV2ZW50cy4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc2ltcGxlX2ttc19oZWxwZXIuYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fc2ltcGxlX2ttc19oZWxwZXIuYwo+IGluZGV4IDE1ZmI1MTZhZTJkOC4u
NDQxNGM3YTViMmNlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc2ltcGxlX2tt
c19oZWxwZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc2ltcGxlX2ttc19oZWxwZXIu
Ywo+IEBAIC0xNDYsMTAgKzE0NiwyMSBAQCBzdGF0aWMgaW50IGRybV9zaW1wbGVfa21zX3BsYW5l
X2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKPiAgCWlmICghcGxhbmVfc3Rh
dGUtPnZpc2libGUpCj4gIAkJcmV0dXJuIDA7Cj4gIAo+IC0JaWYgKCFwaXBlLT5mdW5jcyB8fCAh
cGlwZS0+ZnVuY3MtPmNoZWNrKQo+IC0JCXJldHVybiAwOwo+IC0KPiAtCXJldHVybiBwaXBlLT5m
dW5jcy0+Y2hlY2socGlwZSwgcGxhbmVfc3RhdGUsIGNydGNfc3RhdGUpOwo+ICsJaWYgKHBpcGUt
PmZ1bmNzKSB7Cj4gKwkJaWYgKHBpcGUtPmZ1bmNzLT5jaGVjaykKPiArCQkJcmV0dXJuIHBpcGUt
PmZ1bmNzLT5jaGVjayhwaXBlLCBwbGFuZV9zdGF0ZSwKPiArCQkJCQkJICBjcnRjX3N0YXRlKTsK
PiArCQlpZiAocGlwZS0+ZnVuY3MtPmVuYWJsZV92YmxhbmspCj4gKwkJCXJldHVybiAwOwo+ICsJ
fQo+ICsKPiArCS8qIERyaXZlcnMgd2l0aG91dCBWQkxBTksgc3VwcG9ydCBoYXZlIHRvIGZha2Ug
VkJMQU5LIGV2ZW50cy4gQXMKPiArCSAqIHRoZXJlJ3Mgbm8gY2hlY2soKSBjYWxsYmFjayB0byBl
bmFibGUgdGhpcywgc2V0IHRoZSBub192YmxhbmsKPiArCSAqIGZpZWxkIGJ5IGRlZmF1bHQuCj4g
KwkgKi8KClRoZSAtPmNoZWNrIGNhbGxiYWNrIGlzIHJpZ2h0IGFib3ZlIHRoaXMgY29tbWVudCAu
Li4gSSdtIGNvbmZ1c2VkLgoKPiArCWNydGNfc3RhdGUtPm5vX3ZibGFuayA9IHRydWU7CgpUaGF0
J3Mga2luZGEgbm90IHdoYXQgSSBtZWFudCB3aXRoIGhhbmRsaW5nIHRoaXMgYXV0b21hdGljYWxs
eS4gSW5zdGVhZApzb21ldGhpbmcgbGlrZSB0aGlzOgoKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2F0b21pY19zdGF0ZV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRv
bWljX3N0YXRlX2hlbHBlci5jCmluZGV4IDdjZjNjZjkzNjU0Ny4uMjNkMmY1MWZjMWQ0IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19zdGF0ZV9oZWxwZXIuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19zdGF0ZV9oZWxwZXIuYwpAQCAtMTQ5LDYgKzE0OSwx
MSBAQCB2b2lkIF9fZHJtX2F0b21pY19oZWxwZXJfY3J0Y19kdXBsaWNhdGVfc3RhdGUoc3RydWN0
IGRybV9jcnRjICpjcnRjLAogCS8qIFNlbGYgcmVmcmVzaCBzaG91bGQgYmUgY2FuY2VsZWQgd2hl
biBhIG5ldyB1cGRhdGUgaXMgYXZhaWxhYmxlICovCiAJc3RhdGUtPmFjdGl2ZSA9IGRybV9hdG9t
aWNfY3J0Y19lZmZlY3RpdmVseV9hY3RpdmUoc3RhdGUpOwogCXN0YXRlLT5zZWxmX3JlZnJlc2hf
YWN0aXZlID0gZmFsc2U7CisKKwlpZiAoZHJtX2Rldl9oYXNfdmJsYW5rKGNydGMtPmRldikpCisJ
CXN0YXRlLT5ub192YmxhbmsgPSB0cnVlOworCWVsc2UKKwkJc3RhdGUtPm5vX3ZibGFuayA9IGZh
bHNlOwogfQogRVhQT1JUX1NZTUJPTChfX2RybV9hdG9taWNfaGVscGVyX2NydGNfZHVwbGljYXRl
X3N0YXRlKTsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKaW5kZXggMTY1OWIxM2IxNzhjLi4zMmNhYjNkM2M4
NzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV92YmxhbmsuYwpAQCAtODEsNiArODEsMTIgQEAKICAqLwogI2RlZmluZSBE
Uk1fUkVEVU5EQU5UX1ZCTElSUV9USFJFU0hfTlMgMTAwMDAwMAogCisvKiBGSVhNRSByb2xsIHRo
aXMgb3V0IGhlcmUgaW4gdGhpcyBmaWxlICovCitib29sIGRybV9kZXZfaGFzX3ZibGFuayhkZXYp
Cit7CisJcmV0dXJuIGRldi0+bnVtX2NydGNzOworfQorCiBzdGF0aWMgYm9vbAogZHJtX2dldF9s
YXN0X3ZibHRpbWVzdGFtcChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgcGlw
ZSwKIAkJCSAga3RpbWVfdCAqdHZibGFuaywgYm9vbCBpbl92YmxhbmtfaXJxKTsKCgpCdXQgbWF5
YmUgbW92ZSB0aGUgZGVmYXVsdCB2YWx1ZSB0byBzb21lIG90aGVyL2JldHRlciBwbGFjZSBpbiB0
aGUgYXRvbWljCmhlbHBlcnMsIG5vdCBzdXJlIHdoYXQgdGhlIGJlc3Qgb25lIGlzLgoKUGx1cyB0
aGVuIGluIHRoZSBkb2N1bWVudGF0aW9uIHBhdGNoIGFsc28gaGlnaGxpZ2h0IHRoZSBsaW5rIGJl
dHdlZW4KY3J0Y19zdGF0ZS0+bm9fdmJsYW5rIGFuZCBkcm1fZGV2X2hhc192YmxhbmsgcmVzcGVj
dGl2ZWx5CmRybV9kZXZpY2UubnVtX2NydGNzLgoKVGhhdCBzaG91bGQgcGx1ZyB0aGlzIGlzc3Vl
IG9uY2UgZm9yIGFsbCBhY3Jvc3MgdGhlIGJvYXJkLgoKVGhlcmUncyBzdGlsbCB0aGUgZnVuIGJl
dHdlZW4gaGF2aW5nIHRoZSB2YmxhbmsgY2FsbGJhY2tzIGFuZCB0aGUKZHJtX3ZibGFuayBzZXR1
cCwgYnV0IHRoYXQncyBhIG11Y2ggb2xkZXIgY2FuIG9mIHdvcm1zIC4uLgotRGFuaWVsCi0tIApE
YW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8v
YmxvZy5mZndsbC5jaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
