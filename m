Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC56714A103
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 10:43:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw0tF-0000SC-Ey; Mon, 27 Jan 2020 09:41:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=X4q5=3Q=ffwll.ch=daniel@srs-us1.protection.inumbo.net>)
 id 1iw0tD-0000S6-NT
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 09:41:03 +0000
X-Inumbo-ID: 215b33c6-40e9-11ea-b833-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 215b33c6-40e9-11ea-b833-bc764e2007e4;
 Mon, 27 Jan 2020 09:41:02 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a9so1312247wmj.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2020 01:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wUiJeP3sb9FoVRey/J/jF1e4AeTkT556St8bvwvM930=;
 b=hLP8zzWNbQctE3j265ZDAN8Mj+AJBc80NKO08gNpWs0VlbcJQGjAsnUmAkivYyNk9q
 ofuqeePo6IJYMe1SFbsBFoYcfFZiXDQ4Ws09Cxjoes6hgCwzPLUenMfU6D8o7h9FR/IX
 099X6fDqBW5eBxGAKMmtjvgR3IlKnzA/laUuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wUiJeP3sb9FoVRey/J/jF1e4AeTkT556St8bvwvM930=;
 b=f06G+WJx0BeRo3/ondq5KRD7E1s3grx61DuWXQ/9lKr2ImblkOpt10qwdGI8Hr3ISY
 OrDe2bvHQammZCXSXkJJ1B23XYsCItU8y/DpTXx7iT179S/Du+3mtfsPcBwWk05Ob84e
 3aOE3SCXfAUiPZM8CAFZ4SovlH+DbTQcCdcpuHEGcWC92WcsYEK6B+5BsQFaRwDcphRO
 0Vnp9MJXB8F8uLkP54B1ztiaB1j3u0pt3o+4IbRCcZ5L8ipAL+y33riZwsvObYukA3hq
 f1IzjyQtfxcYNK0aObZC6oxMRG+j5qWocBM7i+CNoFZCfbJTU7W8Xj1jdVEobpB0eAPO
 tOdg==
X-Gm-Message-State: APjAAAURSR13TKHeINJ80k0m/uGeLbaMnFiOfdVvu464PCsCKC4K6get
 /rrtfGp6ZbYE5CW/sudaaTCsBA==
X-Google-Smtp-Source: APXvYqwu7+yyryOWJcgA1WBQbyexBCEfeuqqS7AjAG5uVqU0OZiWWlyYOdULux7tc3u8UTN8Nx3JvA==
X-Received: by 2002:a05:600c:2409:: with SMTP id
 9mr12691722wmp.109.1580118061332; 
 Mon, 27 Jan 2020 01:41:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n8sm19746656wrx.42.2020.01.27.01.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 01:41:00 -0800 (PST)
Date: Mon, 27 Jan 2020 10:40:58 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <20200127094058.GZ43062@phenom.ffwll.local>
References: <20200123092123.28368-1-tzimmermann@suse.de>
 <20200123092123.28368-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200123092123.28368-2-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Subject: Re: [Xen-devel] [PATCH v4 01/15] drm: Initialize struct
 drm_crtc_state.no_vblank from device settings
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

T24gVGh1LCBKYW4gMjMsIDIwMjAgYXQgMTA6MjE6MDlBTSArMDEwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gQXQgdGhlIGVuZCBvZiBhIGNvbW1pdCwgYXRvbWljIGhlbHBlcnMgY2FuIGdl
bmVyYXRlIGEgVkJMQU5LIGV2ZW50Cj4gYXV0b21hdGljYWxseS4gT3JpZ2luYWxseSBpbXBsZW1l
bnRlZCBmb3Igd3JpdGViYWNrIGNvbm5lY3RvcnMsIHRoZQo+IGZ1bmN0aW9uYWxpdHkgY2FuIGJl
IHVzZWQgYnkgYW55IGRyaXZlciBhbmQvb3IgaGFyZHdhcmUgd2l0aG91dCBwcm9wZXIKPiBWQkxB
TksgaW50ZXJydXB0Lgo+IAo+IFRoZSBwYXRjaCB1cGRhdGVzIHRoZSBkb2N1bWVudGF0aW9uIHRv
IG1ha2UgdGhpcyBiZWhhdmlvdXIgb2ZmaWNpYWw6Cj4gc2V0dGluZ3Mgc3RydWN0IGRybV9jcnRj
X3N0YXRlLm5vX3ZibGFuayB0byB0cnVlIGVuYWJsZXMgYXV0b21hdGljCj4gVkJMQU5LIGdlbmVy
YXRpb24uCj4gCj4gVGhlIG5ldyBpbnRlcmZhY2UgZHJtX2Rldl9oYXNfdmJsYW5rKCkgcmV0dXJu
cyB0cnVlIGlmIHZibGFua2luZyBoYXMKPiBiZWVuIGluaXRpYWxpemVkIGZvciBhIGRldmljZSwg
b3IgZmFsc2Ugb3RoZXJ3aXNlLiBUaGlzIGZ1bmN0aW9uIHdpbGwKPiBiZSB1c2VmdWwgd2hlbiBp
bml0aWFsaXppbmcgbm9fdmJsYW5rIGluIHRoZSBDUlRDIHN0YXRlLgo+IAo+IEF0b21pYyBtb2Rl
c2V0dGluZyBoZWxwZXIgc2V0IHRoZSBpbml0aWFsIHZhbHVlIG9mIG5vX3ZibGFuayBpbgo+IGRy
bV9hdG9taWNfaGVscGVyX2NoZWNrX21vZGVzZXQoKS4gSWYgdmJsYW5raW5nIGhhcyBiZWVuIGlu
aXRpYWxpemVkCj4gZm9yIGEgZGV2aWNlLCBub19ibGFuayBpcyBkaXNhYmxlZC4gT3RoZXJ3aXNl
IGl0J3MgZW5hYmxlZC4gSGVuY2UsCj4gYXRvbWljIGhlbHBlcnMgd2lsbCBhdXRvbWF0aWNhbGx5
IHNlbmQgb3V0IFZCTEFOSyBldmVudHMgd2l0aCBhbnkKPiBkcml2ZXIgdGhhdCBkaWQgbm90IGlu
aXRpYWxpemUgdmJsYW5raW5nLgo+IAo+IHY0Ogo+IAkqIHJlcGxhY2UgZHJtX2NydGNfaGFzX3Zi
bGFuaygpIHdpdGggZHJtX2Rldl9oYXNfdmJsYW5rKCkKPiAJKiBhZGQgZHJtX2Rldl9jcnRjX2hh
c192YmxhbmsoKSBpbiB0aGlzIHBhdGNoCgpkcm1fZGV2X2hhc192YmxhbmsgSSBndWVzcz8KCj4g
CSogbW92ZSBkcml2ZXIgY2hhbmdlcyBpbnRvIHNlcGFyYXRlIHBhdGNoZXMKPiB2MzoKPiAJKiBz
cXVhc2ggYWxsIHJlbGF0ZWQgY2hhbmdlcyBwYXRjaGVzIGludG8gdGhpcyBwYXRjaAo+IAo+IFNp
Z25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+IEFj
a2VkLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMgfCAxMCArKysrKysrKystCj4gIGRyaXZlcnMv
Z3B1L2RybS9kcm1fdmJsYW5rLmMgICAgICAgIHwgMjggKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ICBpbmNsdWRlL2RybS9kcm1fY3J0Yy5oICAgICAgICAgICAgICB8IDI3ICsrKysrKysr
KysrKysrKysrKysrLS0tLS0tLQo+ICBpbmNsdWRlL2RybS9kcm1fc2ltcGxlX2ttc19oZWxwZXIu
aCB8ICA3ICsrKysrLS0KPiAgaW5jbHVkZS9kcm0vZHJtX3ZibGFuay5oICAgICAgICAgICAgfCAg
MSArCj4gIDUgZmlsZXMgY2hhbmdlZCwgNjMgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMKPiBpbmRleCA0NTExYzJlMDdiYjku
LmQ3YjczY2Q4OWI3OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19o
ZWxwZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jCj4gQEAg
LTU4Myw2ICs1ODMsNyBAQCBtb2RlX3ZhbGlkKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0
ZSkKPiAgICogJmRybV9jcnRjX3N0YXRlLmNvbm5lY3RvcnNfY2hhbmdlZCBpcyBzZXQgd2hlbiBh
IGNvbm5lY3RvciBpcyBhZGRlZCBvcgo+ICAgKiByZW1vdmVkIGZyb20gdGhlIENSVEMuICAmZHJt
X2NydGNfc3RhdGUuYWN0aXZlX2NoYW5nZWQgaXMgc2V0IHdoZW4KPiAgICogJmRybV9jcnRjX3N0
YXRlLmFjdGl2ZSBjaGFuZ2VzLCB3aGljaCBpcyB1c2VkIGZvciBEUE1TLgo+ICsgKiAmZHJtX2Ny
dGNfc3RhdGUubm9fdmJsYW5rIGlzIHNldCBmcm9tIHRoZSByZXN1bHQgb2YgZHJtX2Rldl9oYXNf
dmJsYW5rKCkuCj4gICAqIFNlZSBhbHNvOiBkcm1fYXRvbWljX2NydGNfbmVlZHNfbW9kZXNldCgp
Cj4gICAqCj4gICAqIElNUE9SVEFOVDoKPiBAQCAtNjQ5LDYgKzY1MCwxMSBAQCBkcm1fYXRvbWlj
X2hlbHBlcl9jaGVja19tb2Rlc2V0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gIAo+ICAJCQly
ZXR1cm4gLUVJTlZBTDsKPiAgCQl9Cj4gKwo+ICsJCWlmIChkcm1fZGV2X2hhc192YmxhbmsoZGV2
KSkKPiArCQkJbmV3X2NydGNfc3RhdGUtPm5vX3ZibGFuayA9IGZhbHNlOwo+ICsJCWVsc2UKPiAr
CQkJbmV3X2NydGNfc3RhdGUtPm5vX3ZibGFuayA9IHRydWU7Cj4gIAl9Cj4gIAo+ICAJcmV0ID0g
aGFuZGxlX2NvbmZsaWN0aW5nX2VuY29kZXJzKHN0YXRlLCBmYWxzZSk7Cj4gQEAgLTIyMTUsNyAr
MjIyMSw5IEBAIEVYUE9SVF9TWU1CT0woZHJtX2F0b21pY19oZWxwZXJfd2FpdF9mb3JfZGVwZW5k
ZW5jaWVzKTsKPiAgICogd2hlbiBhIGpvYiBpcyBxdWV1ZWQsIGFuZCBhbnkgY2hhbmdlIHRvIHRo
ZSBwaXBlbGluZSB0aGF0IGRvZXMgbm90IHRvdWNoIHRoZQo+ICAgKiBjb25uZWN0b3IgaXMgbGVh
ZGluZyB0byB0aW1lb3V0cyB3aGVuIGNhbGxpbmcKPiAgICogZHJtX2F0b21pY19oZWxwZXJfd2Fp
dF9mb3JfdmJsYW5rcygpIG9yCj4gLSAqIGRybV9hdG9taWNfaGVscGVyX3dhaXRfZm9yX2ZsaXBf
ZG9uZSgpLgo+ICsgKiBkcm1fYXRvbWljX2hlbHBlcl93YWl0X2Zvcl9mbGlwX2RvbmUoKS4gSW4g
YWRkaXRpb24gdG8gd3JpdGViYWNrCj4gKyAqIGNvbm5lY3RvcnMsIHRoaXMgZnVuY3Rpb24gY2Fu
IGFsc28gZmFrZSBWQkxBTksgZXZlbnRzIGZvciBDUlRDcyB3aXRob3V0Cj4gKyAqIFZCTEFOSyBp
bnRlcnJ1cHQuCj4gICAqCj4gICAqIFRoaXMgaXMgcGFydCBvZiB0aGUgYXRvbWljIGhlbHBlciBz
dXBwb3J0IGZvciBub25ibG9ja2luZyBjb21taXRzLCBzZWUKPiAgICogZHJtX2F0b21pY19oZWxw
ZXJfc2V0dXBfY29tbWl0KCkgZm9yIGFuIG92ZXJ2aWV3Lgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX3ZibGFuay5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwo+IGlu
ZGV4IDE2NTliMTNiMTc4Yy4uNDMzZGVjNjIzMGIxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fdmJsYW5rLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jCj4g
QEAgLTY5LDYgKzY5LDEyIEBACj4gICAqICZkcm1fZHJpdmVyLm1heF92YmxhbmtfY291bnQuIElu
IHRoYXQgY2FzZSB0aGUgdmJsYW5rIGNvcmUgb25seSBkaXNhYmxlcyB0aGUKPiAgICogdmJsYW5r
cyBhZnRlciBhIHRpbWVyIGhhcyBleHBpcmVkLCB3aGljaCBjYW4gYmUgY29uZmlndXJlZCB0aHJv
dWdoIHRoZQo+ICAgKiBgYHZibGFua29mZmRlbGF5YGAgbW9kdWxlIHBhcmFtZXRlci4KPiArICoK
PiArICogRHJpdmVycyBmb3IgaGFyZHdhcmUgd2l0aG91dCBzdXBwb3J0IGZvciB2ZXJ0aWNhbC1i
bGFua2luZyBpbnRlcnJ1cHRzCj4gKyAqIG11c3Qgbm90IGNhbGwgZHJtX3ZibGFua19pbml0KCku
IEZvciBzdWNoIGRyaXZlcnMsIGF0b21pYyBoZWxwZXJzIHdpbGwKPiArICogYXV0b21hdGljYWxs
eSBnZW5lcmF0ZSB2YmxhbmsgZXZlbnRzIGFzIHBhcnQgb2YgdGhlIGRpc3BsYXkgdXBkYXRlLiBU
aGlzCj4gKyAqIGZ1bmN0aW9uYWxpdHkgYWxzbyBjYW4gYmUgY29udHJvbGxlZCBieSB0aGUgZHJp
dmVyIGJ5IGVuYWJsaW5nIGFuZCBkaXNhYmxpbmcKPiArICogc3RydWN0IGRybV9jcnRjX3N0YXRl
Lm5vX3ZibGFuay4KPiAgICovCj4gIAo+ICAvKiBSZXRyeSB0aW1lc3RhbXAgY2FsY3VsYXRpb24g
dXAgdG8gMyB0aW1lcyB0byBzYXRpc2Z5Cj4gQEAgLTUwMSw2ICs1MDcsMjggQEAgaW50IGRybV92
YmxhbmtfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgbnVtX2NydGNz
KQo+ICB9Cj4gIEVYUE9SVF9TWU1CT0woZHJtX3ZibGFua19pbml0KTsKPiAgCj4gKy8qKgo+ICsg
KiBkcm1fZGV2X2hhc192YmxhbmsgLSB0ZXN0IGlmIHZibGFua2luZyBoYXMgYmVlbiBpbml0aWFs
aXplZCBmb3IKPiArICogICAgICAgICAgICAgICAgICAgICAgYSBkZXZpY2UKPiArICogQGRldjog
dGhlIGRldmljZQo+ICsgKgo+ICsgKiBEcml2ZXJzIG1heSBjYWxsIHRoaXMgZnVuY3Rpb24gdG8g
dGVzdCBpZiB2Ymxhbmsgc3VwcG9ydCBpcwo+ICsgKiBpbml0aWFsaXplZCBmb3IgYSBkZXZpY2Uu
IEZvciBtb3N0IGhhcmR3YXJlIHRoaXMgbWVhbnMgdGhhdCB2YmxhbmtpbmcKPiArICogY2FuIGFs
c28gYmUgZW5hYmxlZC4KPiArICoKPiArICogQXRvbWljIGhlbHBlcnMgdXNlIHRoaXMgZnVuY3Rp
b24gdG8gaW5pdGlhbGl6ZQo+ICsgKiAmZHJtX2NydGNfc3RhdGUubm9fdmJsYW5rLiBTZWUgYWxz
byBkcm1fYXRvbWljX2hlbHBlcl9jaGVja19tb2Rlc2V0KCkuCj4gKyAqCj4gKyAqIFJldHVybnM6
Cj4gKyAqIFRydWUgaWYgdmJsYW5raW5nIGhhcyBiZWVuIGluaXRpYWxpemVkIGZvciB0aGUgZ2l2
ZW4gZGV2aWNlLCBmYWxzZQo+ICsgKiBvdGhlcndpc2UuCj4gKyAqLwo+ICtib29sIGRybV9kZXZf
aGFzX3ZibGFuayhjb25zdCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQo+ICt7Cj4gKwlyZXR1cm4g
ZGV2LT5udW1fY3J0Y3MgIT0gMDsKPiArfQo+ICtFWFBPUlRfU1lNQk9MKGRybV9kZXZfaGFzX3Zi
bGFuayk7Cj4gKwo+ICAvKioKPiAgICogZHJtX2NydGNfdmJsYW5rX3dhaXRxdWV1ZSAtIGdldCB2
Ymxhbmsgd2FpdHF1ZXVlIGZvciB0aGUgQ1JUQwo+ICAgKiBAY3J0Yzogd2hpY2ggQ1JUQydzIHZi
bGFuayB3YWl0cXVldWUgdG8gcmV0cmlldmUKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJt
X2NydGMuaCBiL2luY2x1ZGUvZHJtL2RybV9jcnRjLmgKPiBpbmRleCA1ZTliMTVhMGU4YzUuLjUz
NjNlMzFjOWFiZSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fY3J0Yy5oCj4gKysrIGIv
aW5jbHVkZS9kcm0vZHJtX2NydGMuaAo+IEBAIC0xNzQsMTIgKzE3NCwyMiBAQCBzdHJ1Y3QgZHJt
X2NydGNfc3RhdGUgewo+ICAJICogQG5vX3ZibGFuazoKPiAgCSAqCj4gIAkgKiBSZWZsZWN0cyB0
aGUgYWJpbGl0eSBvZiBhIENSVEMgdG8gc2VuZCBWQkxBTksgZXZlbnRzLiBUaGlzIHN0YXRlCj4g
LQkgKiB1c3VhbGx5IGRlcGVuZHMgb24gdGhlIHBpcGVsaW5lIGNvbmZpZ3VyYXRpb24sIGFuZCB0
aGUgbWFpbiB1c3VhZ2UKPiAtCSAqIGlzIENSVENzIGZlZWRpbmcgYSB3cml0ZWJhY2sgY29ubmVj
dG9yIG9wZXJhdGluZyBpbiBvbmVzaG90IG1vZGUuCj4gLQkgKiBJbiB0aGlzIGNhc2UgdGhlIFZC
TEFOSyBldmVudCBpcyBvbmx5IGdlbmVyYXRlZCB3aGVuIGEgam9iIGlzIHF1ZXVlZAo+IC0JICog
dG8gdGhlIHdyaXRlYmFjayBjb25uZWN0b3IsIGFuZCB3ZSB3YW50IHRoZSBjb3JlIHRvIGZha2Ug
VkJMQU5LCj4gLQkgKiBldmVudHMgd2hlbiB0aGlzIHBhcnQgb2YgdGhlIHBpcGVsaW5lIGhhc24n
dCBjaGFuZ2VkIGJ1dCBvdGhlcnMgaGFkCj4gLQkgKiBvciB3aGVuIHRoZSBDUlRDIGFuZCBjb25u
ZWN0b3JzIGFyZSBiZWluZyBkaXNhYmxlZC4KPiArCSAqIHVzdWFsbHkgZGVwZW5kcyBvbiB0aGUg
cGlwZWxpbmUgY29uZmlndXJhdGlvbi4gSWYgc2V0IHRvIHRydWUsIERSTQo+ICsJICogYXRvbWlj
IGhlbHBlcnMgd2lsbCBzZW5kb3V0IGEgZmFrZSBWQkxBTksgZXZlbnQgZHVyaW5nIGRpc3BsYXkK
CnMvc2VuZG91dC8gc2VuZCBvdXQvCgo+ICsJICogdXBkYXRlcy4KCm1hYnkgYWRkICIuLi4gdXBk
YXRlcywgYWZ0ZXIgYWxsIGhhcmR3YXJlIGNoYW5nZXMgaGF2ZSBiZWVuIGNvbW1pdHRlZC4KVGhp
cyBpcyBpbXBsZW1lbnRlZCBpbiBkcm1fYXRvbWljX2hlbHBlcl9mYWtlX3ZibGFuaygpLiIKClRo
YXQgYXQgbGVhc3QgcmVmbGVjdHMgdGhlIGRlZmF1bHQgYmVoYXZpb3VyLgoKPiArCSAqCj4gKwkg
KiBPbmUgdXNhZ2UgaXMgZm9yIGRyaXZlcnMgYW5kL29yIGhhcmR3YXJlIHdpdGhvdXQgc3VwcG9y
dCBmb3IgVkJMQU5LCj4gKwkgKiBpbnRlcnJ1cHRzLiBTdWNoIGRyaXZlcnMgdHlwaWNhbGx5IGRv
IG5vdCBpbml0aWFsaXplIHZibGFua2luZwo+ICsJICogKGkuZS4sIGNhbGwgZHJtX3ZibGFua19p
bml0KCkgd2l0IHRoZSBudW1iZXIgb2YgQ1JUQ3MpLiBGb3IgQ1JUQ3MKCnMvd2l0L3dpdGgvCgo+
ICsJICogd2l0aG91dCBpbml0aWFsaXplZCB2YmxhbmtpbmcsIHRoZSBmaWVsZCBpcyBpbml0aWFs
aXplZCB0byB0cnVlIGFuZAoKImluaXRpYWxpemVkIHRvIHRydWUiIGlzIGEgYml0IGEgc3RyZXRj
aCwgc2luY2UgdGhpcyBpcyBkb25lIGluIHRoZQpoZWxwZXJzLiBNYXliZSBpbnN0ZWFkICIuLi4g
dGhpcyBmaWVsZCBpcyBzZXQgdG8gdHJ1ZSBpbgpkcm1fYXRvbWljX2hlbHBlcl9jaGVja19tb2Rl
c2V0KCkgYW5kIC4uLiIKCj4gKwkgKiBhIFZCTEFOSyBldmVudCB3aWxsIGJlIHNlbmQgb3V0IG9u
IGVhY2ggdXBkYXRlIG9mIHRoZSBkaXNwbGF5Cj4gKwkgKiBwaXBlbGluZS4KCk1heWJlIGFsc28g
cmVpdGVyYXRlIHRoYXQgdGhpcyBpcyBkb25lIHRocm91Z2gKZHJtX2F0b21pY19oZWxwZXJfZmFr
ZV92YmxhbmsoKSBhZ2Fpbj8gSW1vIGZvciBzdHVmZiBkb25lIGJ5IGhlbHBlcnMgaXQncwppbXBv
cnRhbnQgdG8gaGlnaGxpZ2ggd2hlcmUgdGhhdCdzIGRvbmUsIHNpbmNlIGl0J3MgYWxsIG9wdC1p
biAoZXZlbiBpZgptb3N0IGRyaXZlcnMgd2lsbCBvcHQtaW4gYXV0b21hdGljYWxseSkuCgo+ICsJ
ICoKPiArCSAqIEFub3RoZXIgdXNhZ2UgaXMgQ1JUQ3MgZmVlZGluZyBhIHdyaXRlYmFjayBjb25u
ZWN0b3Igb3BlcmF0aW5nIGluCj4gKwkgKiBvbmVzaG90IG1vZGUuIEluIHRoaXMgY2FzZSB0aGUg
VkJMQU5LIGV2ZW50IGlzIG9ubHkgZ2VuZXJhdGVkIHdoZW4KPiArCSAqIGEgam9iIGlzIHF1ZXVl
ZCB0byB0aGUgd3JpdGViYWNrIGNvbm5lY3RvciwgYW5kIHdlIHdhbnQgdGhlIGNvcmUKPiArCSAq
IHRvIGZha2UgVkJMQU5LIGV2ZW50cyB3aGVuIHRoaXMgcGFydCBvZiB0aGUgcGlwZWxpbmUgaGFz
bid0IGNoYW5nZWQKPiArCSAqIGJ1dCBvdGhlcnMgaGFkIG9yIHdoZW4gdGhlIENSVEMgYW5kIGNv
bm5lY3RvcnMgYXJlIGJlaW5nIGRpc2FibGVkLgo+ICAJICoKPiAgCSAqIF9fZHJtX2F0b21pY19o
ZWxwZXJfY3J0Y19kdXBsaWNhdGVfc3RhdGUoKSB3aWxsIG5vdCByZXNldCB0aGUgdmFsdWUKPiAg
CSAqIGZyb20gdGhlIGN1cnJlbnQgc3RhdGUsIHRoZSBDUlRDIGRyaXZlciBpcyB0aGVuIHJlc3Bv
bnNpYmxlIGZvcgo+IEBAIC0zMzUsNyArMzQ1LDEwIEBAIHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSB7
Cj4gIAkgKiAgLSBFdmVudHMgZm9yIGRpc2FibGVkIENSVENzIGFyZSBub3QgYWxsb3dlZCwgYW5k
IGRyaXZlcnMgY2FuIGlnbm9yZQo+ICAJICogICAgdGhhdCBjYXNlLgo+ICAJICoKPiAtCSAqIFRo
aXMgY2FuIGJlIGhhbmRsZWQgYnkgdGhlIGRybV9jcnRjX3NlbmRfdmJsYW5rX2V2ZW50KCkgZnVu
Y3Rpb24sCj4gKwkgKiBGb3IgdmVyeSBzaW1wbGUgaGFyZHdhcmUgd2l0aG91dCBWQkxBTksgaW50
ZXJydXB0LCBlbmFibGluZwo+ICsJICogJnN0cnVjdCBkcm1fY3J0Y19zdGF0ZS5ub192Ymxhbmsg
bWFrZXMgRFJNJ3MgYXRvbWljIGNvbW1pdCBoZWxwZXJzCj4gKwkgKiBzZW5kIHRoZSBldmVudCBh
dCBhbiBhcHByb3ByaWF0ZSB0aW1lLiBGb3IgbW9yZSBjb21wbGV4IGhhcmR3YXJlIHRoaXMKPiAr
CSAqIGNhbiBiZSBoYW5kbGVkIGJ5IHRoZSBkcm1fY3J0Y19zZW5kX3ZibGFua19ldmVudCgpIGZ1
bmN0aW9uLAo+ICAJICogd2hpY2ggdGhlIGRyaXZlciBzaG91bGQgY2FsbCBvbiB0aGUgcHJvdmlk
ZWQgZXZlbnQgdXBvbiBjb21wbGV0aW9uIG9mCj4gIAkgKiB0aGUgYXRvbWljIGNvbW1pdC4gTm90
ZSB0aGF0IGlmIHRoZSBkcml2ZXIgc3VwcG9ydHMgdmJsYW5rIHNpZ25hbGxpbmcKPiAgCSAqIGFu
ZCB0aW1lc3RhbXBpbmcgdGhlIHZibGFuayBjb3VudGVycyBhbmQgdGltZXN0YW1wcyBtdXN0IGFn
cmVlIHdpdGgKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX3NpbXBsZV9rbXNfaGVscGVy
LmggYi9pbmNsdWRlL2RybS9kcm1fc2ltcGxlX2ttc19oZWxwZXIuaAo+IGluZGV4IDE1YWZlZTlj
ZjA0OS4uZTI1M2JhN2JlYTlkIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9zaW1wbGVf
a21zX2hlbHBlci5oCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX3NpbXBsZV9rbXNfaGVscGVyLmgK
PiBAQCAtMTAwLDggKzEwMCwxMSBAQCBzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGVfZnVu
Y3Mgewo+ICAJICogVGhpcyBpcyB0aGUgZnVuY3Rpb24gZHJpdmVycyBzaG91bGQgc3VibWl0IHRo
ZQo+ICAJICogJmRybV9wZW5kaW5nX3ZibGFua19ldmVudCBmcm9tLiBVc2luZyBlaXRoZXIKPiAg
CSAqIGRybV9jcnRjX2FybV92YmxhbmtfZXZlbnQoKSwgd2hlbiB0aGUgZHJpdmVyIHN1cHBvcnRz
IHZibGFuawo+IC0JICogaW50ZXJydXB0IGhhbmRsaW5nLCBvciBkcm1fY3J0Y19zZW5kX3ZibGFu
a19ldmVudCgpIGRpcmVjdGx5IGluIGNhc2UKPiAtCSAqIHRoZSBoYXJkd2FyZSBsYWNrcyB2Ymxh
bmsgc3VwcG9ydCBlbnRpcmVseS4KPiArCSAqIGludGVycnVwdCBoYW5kbGluZywgb3IgZHJtX2Ny
dGNfc2VuZF92YmxhbmtfZXZlbnQoKSBmb3IgbW9yZQo+ICsJICogY29tcGxleCBjYXNlLiBJbiBj
YXNlIHRoZSBoYXJkd2FyZSBsYWNrcyB2Ymxhbmsgc3VwcG9ydCBlbnRpcmVseSwKPiArCSAqIGRy
aXZlcnMgY2FuIHNldCAmc3RydWN0IGRybV9jcnRjX3N0YXRlLm5vX3ZibGFuayBpbgo+ICsJICog
JnN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZV9mdW5jcy5jaGVjayBhbmQgbGV0IERSTSdz
Cj4gKwkgKiBhdG9taWMgaGVscGVyIGZha2UgYSB2YmxhbmsgZXZlbnQuCj4gIAkgKi8KPiAgCXZv
aWQgKCp1cGRhdGUpKHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSwKPiAgCQkg
ICAgICAgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqb2xkX3BsYW5lX3N0YXRlKTsKPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9kcm0vZHJtX3ZibGFuay5oIGIvaW5jbHVkZS9kcm0vZHJtX3ZibGFuay5o
Cj4gaW5kZXggYzE2YzQ0MDUyYjNkLi45NDI3NWU5M2ZkMjcgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVk
ZS9kcm0vZHJtX3ZibGFuay5oCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX3ZibGFuay5oCj4gQEAg
LTIwNiw2ICsyMDYsNyBAQCBzdHJ1Y3QgZHJtX3ZibGFua19jcnRjIHsKPiAgfTsKPiAgCj4gIGlu
dCBkcm1fdmJsYW5rX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IG51
bV9jcnRjcyk7Cj4gK2Jvb2wgZHJtX2Rldl9oYXNfdmJsYW5rKGNvbnN0IHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYpOwo+ICB1NjQgZHJtX2NydGNfdmJsYW5rX2NvdW50KHN0cnVjdCBkcm1fY3J0YyAq
Y3J0Yyk7Cj4gIHU2NCBkcm1fY3J0Y192YmxhbmtfY291bnRfYW5kX3RpbWUoc3RydWN0IGRybV9j
cnRjICpjcnRjLAo+ICAJCQkJICAga3RpbWVfdCAqdmJsYW5rdGltZSk7CgpXaXRoIHRoZSBkb2Mg
bml0cyBhZGRyZXNzZWQ6CgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRl
ckBmZndsbC5jaD4KCj4gLS0gCj4gMi4yNC4xCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2Fy
ZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
