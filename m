Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A02DA144DC8
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 09:34:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuBQP-0007Ic-9l; Wed, 22 Jan 2020 08:31:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mC0S=3L=ffwll.ch=daniel@srs-us1.protection.inumbo.net>)
 id 1iuBQN-0007IX-Np
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 08:31:43 +0000
X-Inumbo-ID: 9e22d0cc-3cf1-11ea-8e9a-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e22d0cc-3cf1-11ea-8e9a-bc764e2007e4;
 Wed, 22 Jan 2020 08:31:43 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id m24so5855907wmc.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2020 00:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vETm/cqCDdvu8YgJ91D8ovTzZmiZ5bghni5xOlGJa50=;
 b=Sft5dCWICznPBdMLL1VP3xutOvmmI3zIZgFi/qdZISt6LRrNscYorefEQHLmYYRqKZ
 KWT4w5opqDO9q1wJ/VME8d/ENGgll01J2LRNIXjHL/OZHCcKtF46ZGASluDEo5y65SYF
 ATntM9icj+qqTQKmpkuGxqOEMJWaRDDP2qOnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vETm/cqCDdvu8YgJ91D8ovTzZmiZ5bghni5xOlGJa50=;
 b=V/LMXitkO6qdKOd4iFkl7pt0dXYh2+TxWvSXeymNR1kkJtWUw0KxRVinSDWhH0MHIZ
 NyawfH4q8hSnh5tSDrJg6go4fbJT2Zp5ec4+9T+YdF3yOCOdh5stwNs2/BZSo2JM/Kay
 phuYFUJBpZWl4apnkZfz/bLFOFmSgpAgh/lCD8nMeGjmLsr3RJUaKcSogW/QNnFeiFQy
 llJv0EG2/Zzi4Ae2fGuRt5mt5uu6hdQ0CV76mRZRVQvrvtYbSEWrUamGoCTdHSLSFD1v
 M0KmT9MxtCbrmIpm/tIfC7rSgGir5EtaxZUUSsdh6Qv1I8V/TikOsDENj0sODXEVmlIM
 D0QQ==
X-Gm-Message-State: APjAAAXpU2vWo0sqJlOLjzpskFAiYuXzk9WRB86sObKNx9IF+KxilPcc
 SmgNZrbRG1qbSrG9/fymHcpxSQ==
X-Google-Smtp-Source: APXvYqyGHGDtB9jvhm0wcfvsN8ff+Y7NBcqJOhea2NMz8SRwNiCQCQfPW7Aub5jBelErwtQJogOSOQ==
X-Received: by 2002:a1c:f218:: with SMTP id s24mr1749861wmc.128.1579681902143; 
 Wed, 22 Jan 2020 00:31:42 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g7sm55799243wrq.21.2020.01.22.00.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 00:31:41 -0800 (PST)
Date: Wed, 22 Jan 2020 09:31:39 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <20200122083139.GP43062@phenom.ffwll.local>
References: <20200120122051.25178-1-tzimmermann@suse.de>
 <20200120122051.25178-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200120122051.25178-2-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Subject: Re: [Xen-devel] [PATCH v3 1/4] drm: Add drm_crtc_has_vblank()
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

T24gTW9uLCBKYW4gMjAsIDIwMjAgYXQgMDE6MjA6NDhQTSArMDEwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gVGhlIG5ldyBpbnRlcmZhY2UgZHJtX2NydGNfaGFzX3ZibGFuaygpIHJldHVy
biB0cnVlIGlmIHZibGFua2luZyBoYXMKPiBiZWVuIGluaXRpYWxpemVkIGZvciBhIGNlcnRhaW4g
Q1JUQywgb3IgZmFsc2Ugb3RoZXJ3aXNlLiBUaGlzIGZ1bmN0aW9uCj4gd2lsbCBiZSB1c2VmdWwg
Zm9yIGluaXRpYWxpemluZyBDUlRDIHN0YXRlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBa
aW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
ZHJtX3ZibGFuay5jIHwgMjEgKysrKysrKysrKysrKysrKysrKysrCj4gIGluY2x1ZGUvZHJtL2Ry
bV92YmxhbmsuaCAgICAgfCAgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygr
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV92YmxhbmsuYwo+IGluZGV4IDE2NTliMTNiMTc4Yy4uYzIwMTAyODk5NDEx
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jCj4gQEAgLTUwMSw2ICs1MDEsMjcgQEAgaW50IGRybV92
YmxhbmtfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgbnVtX2NydGNz
KQo+ICB9Cj4gIEVYUE9SVF9TWU1CT0woZHJtX3ZibGFua19pbml0KTsKPiAgCj4gKy8qKgo+ICsg
KiBkcm1fY3J0Y19oYXNfdmJsYW5rIC0gdGVzdCBpZiB2YmxhbmtpbmcgaGFzIGJlZW4gaW5pdGlh
bGl6ZWQgZm9yCj4gKyAqICAgICAgICAgICAgICAgICAgICAgICBhIENSVEMKPiArICogQGNydGM6
IHRoZSBDUlRDCj4gKyAqCj4gKyAqIERyaXZlcnMgbWF5IGNhbGwgdGhpcyBmdW5jdGlvbiB0byB0
ZXN0IGlmIHZibGFuayBzdXBwb3J0IGlzCj4gKyAqIGluaXRpYWxpemVkIGZvciBhIENSVEMuIEZv
ciBtb3N0IGhhcmR3YXJlIHRoaXMgbWVhbnMgdGhhdCB2YmxhbmtpbmcKPiArICogY2FuIGFsc28g
YmUgZW5hYmxlZCBvbiB0aGUgQ1JUQy4KPiArICoKPiArICogUmV0dXJuczoKPiArICogVHJ1ZSBp
ZiB2YmxhbmtpbmcgaGFzIGJlZW4gaW5pdGlhbGl6ZWQgZm9yIHRoZSBnaXZlbiBDUlRDLCBmYWxz
ZQo+ICsgKiBvdGhlcndpc2UuCj4gKyAqLwo+ICtib29sIGRybV9jcnRjX2hhc192YmxhbmsoY29u
c3Qgc3RydWN0IGRybV9jcnRjICpjcnRjKQoKU28gbWFraW5nIHRoaXMgc3BlY2lmaWMgdG8gYSBD
UlRDIHNvdW5kcyBsaWtlIGEgZ29vZCBpZGVhLiBCdXQgaXQncyBub3QKdGhlIHJlYWxpdHksIGRy
bV92YmxhbmsuYyBhc3N1bWVzIHRoYXQgZWl0aGVyIGV2ZXJ5dGhpbmcgb3Igbm90aGluZwpzdXBw
b3J0cyB2YmxhbmtzLgoKVGhlIHJlYXNvbiBmb3IgZGV2LT5udW1fY3J0Y3MgaXMgaGlzdG9yaWNh
bCBiYWdnYWdlLCBpdCBwcmVkYXRlcyBrbXMgYnkgYQpmZXcgeWVhcnMuIEZvciBrbXMgZHJpdmVy
cyB0aGUgb25seSB0d28gdmFsaWQgdmFsdWVzIGFyZSBlaXRoZXIgMCBvcgpkZXYtPm1vZGVfY29u
ZmlnLm51bV9jcnRjcy4gWWVzIHRoYXQncyBhbiBlbnRpcmUgZGlmZmVyZW50IGNhbiBvZiB3b3Jt
cwp0aGF0J3MgYmVlbiBpcmtpbmcgbWUgc2luY2UgZm9yZXZlciAoaWRlYWxseSBkcm1fdmJsYW5r
X2luaXQgd291bGQgc29tZWhvdwpsb29zZSB0aGUgbnVtX2NydGNzIGFyZ3VtZW50IGZvciBrbXMg
ZHJpdmVycywgYnV0IHNvbWUgZHJpdmVycyBjYWxsIHRoaXMKYmVmb3JlIHRoZXkndmUgZG9uZSBh
bGwgdGhlIGRybV9jcnRjX2luaXQgY2FsbHMgc28gaXQncyBjb21wbGljYXRlZCkuCgpIZW5jZSBk
cm1fZGV2X2hhc192YmxhbmsgYXMgSSBzdWdnZXN0ZWQuIFRoYXQgd291bGQgYWxzbyBhbGxvdyB5
b3UgdG8KcmVwbGFjZSBhIGJ1bmNoIG9mIGlmIChkZXYtPm51bV9jcnRjcykgY2hlY2tzIGluIGRy
bV92YmxhbmsuYywgd2hpY2gKc2hvdWxkIGhlbHAgcXVpdGUgYSBiaXQgaW4gY29kZSByZWFkYWJp
bGl0eS4KCkNoZWVycywgRGFuaWVsCgo+ICt7Cj4gKwlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0g
Y3J0Yy0+ZGV2Owo+ICsKPiArCXJldHVybiBjcnRjLT5pbmRleCA8IGRldi0+bnVtX2NydGNzOwo+
ICt9Cj4gK0VYUE9SVF9TWU1CT0woZHJtX2NydGNfaGFzX3ZibGFuayk7Cj4gKwo+ICAvKioKPiAg
ICogZHJtX2NydGNfdmJsYW5rX3dhaXRxdWV1ZSAtIGdldCB2Ymxhbmsgd2FpdHF1ZXVlIGZvciB0
aGUgQ1JUQwo+ICAgKiBAY3J0Yzogd2hpY2ggQ1JUQydzIHZibGFuayB3YWl0cXVldWUgdG8gcmV0
cmlldmUKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX3ZibGFuay5oIGIvaW5jbHVkZS9k
cm0vZHJtX3ZibGFuay5oCj4gaW5kZXggYzE2YzQ0MDUyYjNkLi41MzFhNmJjMTJiN2UgMTAwNjQ0
Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX3ZibGFuay5oCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJt
X3ZibGFuay5oCj4gQEAgLTIwNiw2ICsyMDYsNyBAQCBzdHJ1Y3QgZHJtX3ZibGFua19jcnRjIHsK
PiAgfTsKPiAgCj4gIGludCBkcm1fdmJsYW5rX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwg
dW5zaWduZWQgaW50IG51bV9jcnRjcyk7Cj4gK2Jvb2wgZHJtX2NydGNfaGFzX3ZibGFuayhjb25z
dCBzdHJ1Y3QgZHJtX2NydGMgKmNydGMpOwo+ICB1NjQgZHJtX2NydGNfdmJsYW5rX2NvdW50KHN0
cnVjdCBkcm1fY3J0YyAqY3J0Yyk7Cj4gIHU2NCBkcm1fY3J0Y192YmxhbmtfY291bnRfYW5kX3Rp
bWUoc3RydWN0IGRybV9jcnRjICpjcnRjLAo+ICAJCQkJICAga3RpbWVfdCAqdmJsYW5rdGltZSk7
Cj4gLS0gCj4gMi4yNC4xCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwg
SW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
