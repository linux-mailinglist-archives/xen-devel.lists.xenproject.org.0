Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9199813E74B
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 18:25:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is8qP-0000C5-M6; Thu, 16 Jan 2020 17:22:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nSNN=3F=gmail.com=emil.l.velikov@srs-us1.protection.inumbo.net>)
 id 1is8qO-0000C0-EI
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 17:22:08 +0000
X-Inumbo-ID: b8fec7fa-3884-11ea-a2eb-bc764e2007e4
Received: from mail-ua1-x943.google.com (unknown [2607:f8b0:4864:20::943])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b8fec7fa-3884-11ea-a2eb-bc764e2007e4;
 Thu, 16 Jan 2020 17:22:07 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id f7so7908876uaa.8
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2020 09:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hjlPO7BPZ/JlQoLqlUXvQTlJfTAbQfDZ8K8Uze8BU/s=;
 b=YKMxolQBt/5TtzXuM46+gh9+XoXFQUxQh/cVpqTPRL0MhbKQNmtAXQKA013/fyOecO
 w136SaOLrnBnJBQtcqo0CSjSuaDQjPv55UatHkkhtYeF88FMZL8rGhX9mMFc9grHdBXe
 9SuUZBrHr+8b/qwPkCSb4ftodkLJBP1DGWj0o28IQuMPz7nOqJ//eyp+S2oLV/hf1FkZ
 U6ayL/rVh/7ZtcFiYIHF6p1z9xQAcb+9jsVzlmo4YgRCaVHQ4ESCv1TfZvGT8NrH9sLu
 TrKfjOztyqm3R0nOU3nG9D/tKkM9/NO+NWzfV/+d2Pk0xorsvpuk5/1tENmSDHf+cGTy
 IG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hjlPO7BPZ/JlQoLqlUXvQTlJfTAbQfDZ8K8Uze8BU/s=;
 b=gD9qXmcQr3grdkTxM9VlQBoG1E0+LW+9F5ajilBhZO4fVR5iS69x1urXxOHvisR7xg
 ekCtmhHln5kxW0s844TJ+muOdUZb7J/1VpsM4IYRRfnkm4O/Vl9q+hbBtB+AH3gkQnoH
 rGX4WYJUPu2XrXe5Zm997qDWjCfOuEB76kmz2tr0d7ydamPME8GS3umDbvtRMpiFWtHZ
 Gqvx2pd2mwQ+zA0KLTap9CJvXC2U0sblliVM6GXTg4JZINPymY5CfcLFKW4ax0MfB+vD
 v+4OhzpYWdIXV6sy1ji+6J7EnLmytYevG+ddDQh30580bRcd34co+QLVAZtQ27/oHGT/
 iHcA==
X-Gm-Message-State: APjAAAXKqlh1I30niMRz6FsnVNqMFIf9opU9/OBdN13p1wTGDDndMZev
 2jA6P6Tuc8yGf0HdxUhSSuMYKbxQPqrroU77ei4=
X-Google-Smtp-Source: APXvYqyZHt1bqJYkRt6MbFegAzbw6GywWUBqaQuyP76aQnU4RRq0QOEI8YeE5E4qQi+Z4gewiSopIQgd5bPceS0uhj4=
X-Received: by 2002:ab0:14a2:: with SMTP id d31mr18349536uae.106.1579195327403; 
 Thu, 16 Jan 2020 09:22:07 -0800 (PST)
MIME-Version: 1.0
References: <20200115125226.13843-1-tzimmermann@suse.de>
 <20200115125226.13843-5-tzimmermann@suse.de>
 <20200116064107.GB8400@dvetter-linux.ger.corp.intel.com>
 <33fdd33f-ce8d-70d3-544e-fac727d2686b@suse.de>
In-Reply-To: <33fdd33f-ce8d-70d3-544e-fac727d2686b@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 16 Jan 2020 17:22:34 +0000
Message-ID: <CACvgo52gwC6U5HjnsQSUUDgE7Gp_EDb-QqCY8VDFjAX7cE0Lxg@mail.gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, david@lechnology.com,
 oleksandr_andrushchenko@epam.com, Dave Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Hans de Goede <hdegoede@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, xen-devel@lists.xenproject.org,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKT24gVGh1LCAxNiBKYW4gMjAyMCBhdCAwNzozNywgVGhvbWFzIFppbW1lcm1hbm4g
PHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgoKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2F0b21pY19zdGF0ZV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRv
bWljX3N0YXRlX2hlbHBlci5jCj4gPiBpbmRleCA3Y2YzY2Y5MzY1NDcuLjIzZDJmNTFmYzFkNCAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3N0YXRlX2hlbHBlci5j
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19zdGF0ZV9oZWxwZXIuYwo+ID4g
QEAgLTE0OSw2ICsxNDksMTEgQEAgdm9pZCBfX2RybV9hdG9taWNfaGVscGVyX2NydGNfZHVwbGlj
YXRlX3N0YXRlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiA+ICAgICAgIC8qIFNlbGYgcmVmcmVz
aCBzaG91bGQgYmUgY2FuY2VsZWQgd2hlbiBhIG5ldyB1cGRhdGUgaXMgYXZhaWxhYmxlICovCj4g
PiAgICAgICBzdGF0ZS0+YWN0aXZlID0gZHJtX2F0b21pY19jcnRjX2VmZmVjdGl2ZWx5X2FjdGl2
ZShzdGF0ZSk7Cj4gPiAgICAgICBzdGF0ZS0+c2VsZl9yZWZyZXNoX2FjdGl2ZSA9IGZhbHNlOwo+
ID4gKwo+ID4gKyAgICAgaWYgKGRybV9kZXZfaGFzX3ZibGFuayhjcnRjLT5kZXYpKQo+ID4gKyAg
ICAgICAgICAgICBzdGF0ZS0+bm9fdmJsYW5rID0gdHJ1ZTsKPiA+ICsgICAgIGVsc2UKPiA+ICsg
ICAgICAgICAgICAgc3RhdGUtPm5vX3ZibGFuayA9IGZhbHNlOwo+ID4gIH0KPiA+ICBFWFBPUlRf
U1lNQk9MKF9fZHJtX2F0b21pY19oZWxwZXJfY3J0Y19kdXBsaWNhdGVfc3RhdGUpOwo+Cj4gSSB0
aGluayB0aGUgaWYvZWxzZSBicmFuY2hlcyBhcmUgaW4gdGhlIHdyb25nIG9yZGVyLgo+Cj4gQnV0
IGdlbmVyYWxseSBzcGVha2luZywgaXMgaXQgcmVhbGx5IHRoYXQgZWFzeT8gVGhlIHhlbiBkcml2
ZXIgYWxyZWFkeQo+IGhhcyB0byB3b3JrIGFyb3VuZCBzaW1wbGUta21zJ3MgYXV0by1lbmFibGlu
ZyBvZiBub192YmxhbmsgKHNlZSBwYXRjaAo+IDQpLiBNYXliZSB0aGlzIHNldHRpbmdzIGludGVy
ZmVyZXMgd2l0aCBvdGhlciBkcml2ZXJzIGFzIHdlbGwuIEF0IGxlYXN0Cj4gdGhlIGNhbGxzIGZv
ciBzZW5kaW5nIGZha2UgdmJsYW5rcyBzaG91bGQgYmUgcmVtb3ZlZCBmcm9tIGFsbCBhZmZlY3Rl
ZAo+IGRyaXZlcnMuCj4KCkknbSBub3Qgc3VyZSBpZiBzZXR0aW5nIG5vX3ZibGFuayBiYXNlZCBv
biBkZXYtPm51bV9jcnRjcyBpcyB0aGUgY29ycmVjdCB0aGluZy4KRnJvbSB0aGUgb3JpZ2luYWwg
Y29tbWl0IGFuZCBhc3NvY2lhdGVkIGRlc2NyaXB0aW9uIGZvciBub192Ymxhbms6CgpJbiBzb21l
IGNhc2VzIENSVENzIGFyZSBhY3RpdmUgYnV0IGFyZSBub3QgYWJsZSB0byBnZW5lcmF0aW5nIGV2
ZW50cywgYXQKbGVhc3Qgbm90IGF0IGV2ZXJ5IGZyYW1lIGF0IGl0J3MgZXhwZWN0ZWQgdG8uClRo
aXMgaXMgdHlwaWNhbGx5IHRoZSBjYXNlIHdoZW4gdGhlIENSVEMgaXMgZmVlZGluZyBhIHdyaXRl
YmFjayBjb25uZWN0b3IuLi4KClJlZmxlY3RzIHRoZSBhYmlsaXR5IG9mIGEgQ1JUQyB0byBzZW5k
IFZCTEFOSyBldmVudHMuLi4uCgoKVGhlIHByb3Bvc2VkIGhhbmRsaW5nIG9mIG5vX3ZibGFuayBm
ZWVscyBhIGxpdHRsZSBkaXJ0eSwgYWx0aG91Z2gKbm90aGluZyBiZXR0ZXIgY29tZXMgdG8gbWlu
ZC4KTmV2ZXJ0aGVsZXNzIGNvZGUgc2VlbXMgcGVyZmVjdGx5IHJlYXNvbmFibGUsIHNvIGlmIGl0
IHdlcmUgbWUgSSdkIG1lcmdlIGl0LgoKSFRICkVtaWwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
