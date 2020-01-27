Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A27E014A99A
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 19:15:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw8s2-0008L7-Eu; Mon, 27 Jan 2020 18:12:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GGMs=3Q=gmail.com=emil.l.velikov@srs-us1.protection.inumbo.net>)
 id 1iw8s0-0008Kf-JF
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 18:12:20 +0000
X-Inumbo-ID: 8ef039ee-4130-11ea-acc1-bc764e2007e4
Received: from mail-ua1-x943.google.com (unknown [2607:f8b0:4864:20::943])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ef039ee-4130-11ea-acc1-bc764e2007e4;
 Mon, 27 Jan 2020 18:12:20 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id y23so3797735ual.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2020 10:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/uvHN7A7OT+bEIM3tP943o1xbsY41GvLCup21iM4/gc=;
 b=tuE4ZEtAUqVx1srhsqnBxX27/n+WfSn6yY0qv6+hFjaKzBiF11NctF8Ez5JX/QETBj
 YVG7g2BPSkjCgd7vjENxbjT6CmhjJ81Lj+0ob5J+dmCSW/wRQ0973iuV7+2Vz2k7MarM
 1LfWu6KQM1WCdoEPTG8Fw5NIlpFTl1eGA71roQvJnyUg9VDPzH5jKYreYybYwb5Gamgp
 DpH4+S3LJDHUrQhN1Uu0+6SnV0kw6Py/blMYwlWCk322fANsSBpURdIfR6QeKa3CK2a8
 jDTRFEjd9Ub7Q2l2DdVPqZEA52BOzCbSrr85zHR81/vuCE8Pq6PiBEkWp1iat+Ocg03L
 D4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/uvHN7A7OT+bEIM3tP943o1xbsY41GvLCup21iM4/gc=;
 b=fZqpMqtZknWTSLLvW9CMDrcxkndPx3wLEnNUWBUdINAwk6BaIyTzc7NLbGUTp/cSfG
 VmhfmUBmfgP5CfxX6zMR686ckunvg8BzQ139x3kC9w+teIAdtu/1MEX9FTwR1k0wNb1Y
 x5pq5ikvqh8mkeDgK8RgIfLDNGK4gUZaauUg/Sv3oZs0CX/yZTsNviiRwDyXzCm6L2N8
 xb7Adc708m1SJbmlUhO6si6Sv4eQpjAAU8m4PchuQyYukahg+cK++XAeIdMM4ncvWSzs
 M4STy3gum/SUb0k9+ujJDVg5twJumuQMCAr0gV04xAad6nEjmPtfg1zS0DxbMTIt6ELX
 H8KA==
X-Gm-Message-State: APjAAAXMAHIAP7NmRoIBxrG3WAXWAlAXP6NMr+mqX6QUDuURnLEZMAtu
 aE13z++Qx6a4kgvG7aEErP/KYkwwmRzelGtFJQQ=
X-Google-Smtp-Source: APXvYqwK5KmxifcPjLSjf5c8jkZHQcHzkH16GHhUeR4MCzx5Gy8Rt6ekqTRLSWMH36hOxYwaCgiqGLWChyi8dbuYFdA=
X-Received: by 2002:ab0:5bc6:: with SMTP id z6mr10702811uae.46.1580148739730; 
 Mon, 27 Jan 2020 10:12:19 -0800 (PST)
MIME-Version: 1.0
References: <20200123092123.28368-1-tzimmermann@suse.de>
 <20200123092123.28368-2-tzimmermann@suse.de>
In-Reply-To: <20200123092123.28368-2-tzimmermann@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 27 Jan 2020 18:12:54 +0000
Message-ID: <CACvgo53YvKjPNNshZoTjJehHyOX6e05kJ5gAXtjwxs+oLLv7vw@mail.gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: david@lechnology.com, oleksandr_andrushchenko@epam.com,
 Dave Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 xen-devel@lists.xenproject.org, Emil Velikov <emil.velikov@collabora.com>,
 Sean Paul <sean@poorly.run>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVGhvbWFzLAoKT24gVGh1LCAyMyBKYW4gMjAyMCBhdCAwOToyMSwgVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgoKPiBAQCAtMTc0LDEyICsxNzQsMjIgQEAg
c3RydWN0IGRybV9jcnRjX3N0YXRlIHsKPiAgICAgICAgICAqIEBub192Ymxhbms6Cj4gICAgICAg
ICAgKgo+ICAgICAgICAgICogUmVmbGVjdHMgdGhlIGFiaWxpdHkgb2YgYSBDUlRDIHRvIHNlbmQg
VkJMQU5LIGV2ZW50cy4gVGhpcyBzdGF0ZQo+IC0gICAgICAgICogdXN1YWxseSBkZXBlbmRzIG9u
IHRoZSBwaXBlbGluZSBjb25maWd1cmF0aW9uLCBhbmQgdGhlIG1haW4gdXN1YWdlCj4gLSAgICAg
ICAgKiBpcyBDUlRDcyBmZWVkaW5nIGEgd3JpdGViYWNrIGNvbm5lY3RvciBvcGVyYXRpbmcgaW4g
b25lc2hvdCBtb2RlLgo+IC0gICAgICAgICogSW4gdGhpcyBjYXNlIHRoZSBWQkxBTksgZXZlbnQg
aXMgb25seSBnZW5lcmF0ZWQgd2hlbiBhIGpvYiBpcyBxdWV1ZWQKPiAtICAgICAgICAqIHRvIHRo
ZSB3cml0ZWJhY2sgY29ubmVjdG9yLCBhbmQgd2Ugd2FudCB0aGUgY29yZSB0byBmYWtlIFZCTEFO
Swo+IC0gICAgICAgICogZXZlbnRzIHdoZW4gdGhpcyBwYXJ0IG9mIHRoZSBwaXBlbGluZSBoYXNu
J3QgY2hhbmdlZCBidXQgb3RoZXJzIGhhZAo+IC0gICAgICAgICogb3Igd2hlbiB0aGUgQ1JUQyBh
bmQgY29ubmVjdG9ycyBhcmUgYmVpbmcgZGlzYWJsZWQuCj4gKyAgICAgICAgKiB1c3VhbGx5IGRl
cGVuZHMgb24gdGhlIHBpcGVsaW5lIGNvbmZpZ3VyYXRpb24uIElmIHNldCB0byB0cnVlLCBEUk0K
PiArICAgICAgICAqIGF0b21pYyBoZWxwZXJzIHdpbGwgc2VuZG91dCBhIGZha2UgVkJMQU5LIGV2
ZW50IGR1cmluZyBkaXNwbGF5Cj4gKyAgICAgICAgKiB1cGRhdGVzLgo+ICsgICAgICAgICoKPiAr
ICAgICAgICAqIE9uZSB1c2FnZSBpcyBmb3IgZHJpdmVycyBhbmQvb3IgaGFyZHdhcmUgd2l0aG91
dCBzdXBwb3J0IGZvciBWQkxBTksKPiArICAgICAgICAqIGludGVycnVwdHMuIFN1Y2ggZHJpdmVy
cyB0eXBpY2FsbHkgZG8gbm90IGluaXRpYWxpemUgdmJsYW5raW5nCj4gKyAgICAgICAgKiAoaS5l
LiwgY2FsbCBkcm1fdmJsYW5rX2luaXQoKSB3aXQgdGhlIG51bWJlciBvZiBDUlRDcykuIEZvciBD
UlRDcwo+ICsgICAgICAgICogd2l0aG91dCBpbml0aWFsaXplZCB2YmxhbmtpbmcsIHRoZSBmaWVs
ZCBpcyBpbml0aWFsaXplZCB0byB0cnVlIGFuZAo+ICsgICAgICAgICogYSBWQkxBTksgZXZlbnQg
d2lsbCBiZSBzZW5kIG91dCBvbiBlYWNoIHVwZGF0ZSBvZiB0aGUgZGlzcGxheQo+ICsgICAgICAg
ICogcGlwZWxpbmUuCj4gKyAgICAgICAgKgo+ICsgICAgICAgICogQW5vdGhlciB1c2FnZSBpcyBD
UlRDcyBmZWVkaW5nIGEgd3JpdGViYWNrIGNvbm5lY3RvciBvcGVyYXRpbmcgaW4KPiArICAgICAg
ICAqIG9uZXNob3QgbW9kZS4gSW4gdGhpcyBjYXNlIHRoZSBWQkxBTksgZXZlbnQgaXMgb25seSBn
ZW5lcmF0ZWQgd2hlbgo+ICsgICAgICAgICogYSBqb2IgaXMgcXVldWVkIHRvIHRoZSB3cml0ZWJh
Y2sgY29ubmVjdG9yLCBhbmQgd2Ugd2FudCB0aGUgY29yZQo+ICsgICAgICAgICogdG8gZmFrZSBW
QkxBTksgZXZlbnRzIHdoZW4gdGhpcyBwYXJ0IG9mIHRoZSBwaXBlbGluZSBoYXNuJ3QgY2hhbmdl
ZAo+ICsgICAgICAgICogYnV0IG90aGVycyBoYWQgb3Igd2hlbiB0aGUgQ1JUQyBhbmQgY29ubmVj
dG9ycyBhcmUgYmVpbmcgZGlzYWJsZWQuCj4gICAgICAgICAgKgoKUGVyaGFwcyBpdCdzIGp1c3Qg
bWUsIHlldCB0aGUgZm9sbG93aW5nIGlkZWFzIHdvdWxkIG1ha2UgdGhlIHRvcGljCnNpZ25pZmlj
YW50bHkgZWFzaWVyIGFuZCBjbGVhcmVyLgoKIC0gYWRkaW5nIGV4cGxpY2l0ICJmYWtlIiB3aGVu
IHRhbGtpbmcgYWJvdXQgZHJtL2F0b21pYyBfaGVscGVyc18KZ2VuZXJhdGluZy9zZW5kaW5nIGEg
VkJMQU5LIGV2ZW50LgpGb3IgZXhhbXBsZSwgaW4gMTUvMTUgdGhlIGNvbW1pdCBtZXNzYWdlIHNh
eXMgImZha2UiLCB3aGlsZSBpbmxpbmUKY29tbWVudCBvbWl0cyBpdC4uLiBMZWFkaW5nIHRvIHRo
ZSBjb25mdXNpb24gcG9pbnRlZCBvdXQuCgotIHMvbm9fdmJsYW5rL2Zha2VfdmJsYW5rL2cgb3Ig
cy9ub192Ymxhbmsvbm9faHdfdmJsYW5rL2cKU2ltcGxlIGFuZCBjb25jaXNlLiBXaXRoIHNsaWdo
dCBpbmNsaW5hdGlvbiB0b3dhcmRzIHRoZSBmb3JtZXIgd29yZGluZyA6LSkKCklmIHlvdSBhbmQg
RGFuaWVsIGFncmVlIHdpdGggdGhlIHJlbmFtZSwgdGhlbiB0aGUgZmlyc3Qgc2VudGVuY2Ugb2YK
dGhlIGRlc2NyaXB0aW9uIHNob3VsZCBwcm9iYWJseSBiZSB0d2Vha2VkLgoKSFRICkVtaWwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
