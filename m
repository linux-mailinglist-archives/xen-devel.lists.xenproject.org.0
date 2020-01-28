Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE98214BCAC
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 16:17:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwSZk-0007d4-EL; Tue, 28 Jan 2020 15:14:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WTSn=3R=ffwll.ch=daniel@srs-us1.protection.inumbo.net>)
 id 1iwSZj-0007cy-De
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 15:14:47 +0000
X-Inumbo-ID: eb240758-41e0-11ea-b211-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb240758-41e0-11ea-b211-bc764e2007e4;
 Tue, 28 Jan 2020 15:14:46 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f129so2962846wmf.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2020 07:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=wC9C/BsYUjVeK8G1BQ+TqjG6d+uume0GDrnY6oFsX1Q=;
 b=KluDkgOvTVrXsbcZm8SJITVRRmj+jRnR+xflcCbz62cZyc2ZJ+ugUGupwazQ0fjHxW
 39Vw9tHePuIm1zNNWior0QOUaBEnJcIxqu7mu/+IvsSrPgitaJ8WtPT1R2iNmZhH34yI
 m1FMT8KUzzdw0/e9AG8rnXc3Ll8bMaiSQmlu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wC9C/BsYUjVeK8G1BQ+TqjG6d+uume0GDrnY6oFsX1Q=;
 b=LUo9C/j/Z2A0GqOzh6UNLPM6DGlmBw0/+QXET8I/v2PcsQPF4zuVcZkNjKu5SNsfQF
 hpBBmK5C1pas6KAAvvpK25NNpmdvPgx2XyqDCIw1tr7oXIQFSbvl7pq5A6DRJcwmwS+8
 RiUJi0SCH1XwcfP3WVfU145+JOXrACt3yAtZcrdi7lXkWlYFqlAfcnKxt1I/aa9/7896
 8lMtBkV7bHPtB0NhskSSR5Uqtk+SKD/SsphqkdJP4huAAf5bjYcV/aksPzrVGlchPB3y
 1E4PrvslZ0EjU/60q43Xb5dVTRqqoc2MIFs61ZOd9gEPPUUflYnawvBt+AwAFZoVEe5w
 SYSA==
X-Gm-Message-State: APjAAAXEqinknOfVI1YDMNnsyMR1g+fnfpLgl54M6/z5bpdn3zpm9jID
 oC1Go34q6ULlFiwXTZniiEq0VA==
X-Google-Smtp-Source: APXvYqwV0uyfdAheNbO9WR0r52FgmbieTRfSTGc5nqZhx6ndvBa2n8MA+ZWkciky+Z/HdaS4N8i+DQ==
X-Received: by 2002:a1c:8095:: with SMTP id b143mr5431868wmd.7.1580224485772; 
 Tue, 28 Jan 2020 07:14:45 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d14sm27670784wru.9.2020.01.28.07.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2020 07:14:44 -0800 (PST)
Date: Tue, 28 Jan 2020 16:14:42 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <20200128151442.GH43062@phenom.ffwll.local>
References: <20200123092123.28368-1-tzimmermann@suse.de>
 <20200123092123.28368-2-tzimmermann@suse.de>
 <CACvgo53YvKjPNNshZoTjJehHyOX6e05kJ5gAXtjwxs+oLLv7vw@mail.gmail.com>
 <183782e6-164c-bae8-90e0-906edb059a1d@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <183782e6-164c-bae8-90e0-906edb059a1d@suse.de>
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
Cc: david@lechnology.com, Sam Ravnborg <sam@ravnborg.org>,
 oleksandr_andrushchenko@epam.com, Dave Airlie <airlied@linux.ie>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 xen-devel@lists.xenproject.org, Emil Velikov <emil.velikov@collabora.com>,
 Sean Paul <sean@poorly.run>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMjcsIDIwMjAgYXQgMDc6NDI6MjdQTSArMDEwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gSGkgRW1pbAo+IAo+IEFtIDI3LjAxLjIwIHVtIDE5OjEyIHNjaHJpZWIgRW1p
bCBWZWxpa292Ogo+ID4gSGkgVGhvbWFzLAo+ID4gCj4gPiBPbiBUaHUsIDIzIEphbiAyMDIwIGF0
IDA5OjIxLCBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6Cj4g
PiAKPiA+PiBAQCAtMTc0LDEyICsxNzQsMjIgQEAgc3RydWN0IGRybV9jcnRjX3N0YXRlIHsKPiA+
PiAgICAgICAgICAqIEBub192Ymxhbms6Cj4gPj4gICAgICAgICAgKgo+ID4+ICAgICAgICAgICog
UmVmbGVjdHMgdGhlIGFiaWxpdHkgb2YgYSBDUlRDIHRvIHNlbmQgVkJMQU5LIGV2ZW50cy4gVGhp
cyBzdGF0ZQo+ID4+IC0gICAgICAgICogdXN1YWxseSBkZXBlbmRzIG9uIHRoZSBwaXBlbGluZSBj
b25maWd1cmF0aW9uLCBhbmQgdGhlIG1haW4gdXN1YWdlCj4gPj4gLSAgICAgICAgKiBpcyBDUlRD
cyBmZWVkaW5nIGEgd3JpdGViYWNrIGNvbm5lY3RvciBvcGVyYXRpbmcgaW4gb25lc2hvdCBtb2Rl
Lgo+ID4+IC0gICAgICAgICogSW4gdGhpcyBjYXNlIHRoZSBWQkxBTksgZXZlbnQgaXMgb25seSBn
ZW5lcmF0ZWQgd2hlbiBhIGpvYiBpcyBxdWV1ZWQKPiA+PiAtICAgICAgICAqIHRvIHRoZSB3cml0
ZWJhY2sgY29ubmVjdG9yLCBhbmQgd2Ugd2FudCB0aGUgY29yZSB0byBmYWtlIFZCTEFOSwo+ID4+
IC0gICAgICAgICogZXZlbnRzIHdoZW4gdGhpcyBwYXJ0IG9mIHRoZSBwaXBlbGluZSBoYXNuJ3Qg
Y2hhbmdlZCBidXQgb3RoZXJzIGhhZAo+ID4+IC0gICAgICAgICogb3Igd2hlbiB0aGUgQ1JUQyBh
bmQgY29ubmVjdG9ycyBhcmUgYmVpbmcgZGlzYWJsZWQuCj4gPj4gKyAgICAgICAgKiB1c3VhbGx5
IGRlcGVuZHMgb24gdGhlIHBpcGVsaW5lIGNvbmZpZ3VyYXRpb24uIElmIHNldCB0byB0cnVlLCBE
Uk0KPiA+PiArICAgICAgICAqIGF0b21pYyBoZWxwZXJzIHdpbGwgc2VuZG91dCBhIGZha2UgVkJM
QU5LIGV2ZW50IGR1cmluZyBkaXNwbGF5Cj4gPj4gKyAgICAgICAgKiB1cGRhdGVzLgo+ID4+ICsg
ICAgICAgICoKPiA+PiArICAgICAgICAqIE9uZSB1c2FnZSBpcyBmb3IgZHJpdmVycyBhbmQvb3Ig
aGFyZHdhcmUgd2l0aG91dCBzdXBwb3J0IGZvciBWQkxBTksKPiA+PiArICAgICAgICAqIGludGVy
cnVwdHMuIFN1Y2ggZHJpdmVycyB0eXBpY2FsbHkgZG8gbm90IGluaXRpYWxpemUgdmJsYW5raW5n
Cj4gPj4gKyAgICAgICAgKiAoaS5lLiwgY2FsbCBkcm1fdmJsYW5rX2luaXQoKSB3aXQgdGhlIG51
bWJlciBvZiBDUlRDcykuIEZvciBDUlRDcwo+ID4+ICsgICAgICAgICogd2l0aG91dCBpbml0aWFs
aXplZCB2YmxhbmtpbmcsIHRoZSBmaWVsZCBpcyBpbml0aWFsaXplZCB0byB0cnVlIGFuZAo+ID4+
ICsgICAgICAgICogYSBWQkxBTksgZXZlbnQgd2lsbCBiZSBzZW5kIG91dCBvbiBlYWNoIHVwZGF0
ZSBvZiB0aGUgZGlzcGxheQo+ID4+ICsgICAgICAgICogcGlwZWxpbmUuCj4gPj4gKyAgICAgICAg
Kgo+ID4+ICsgICAgICAgICogQW5vdGhlciB1c2FnZSBpcyBDUlRDcyBmZWVkaW5nIGEgd3JpdGVi
YWNrIGNvbm5lY3RvciBvcGVyYXRpbmcgaW4KPiA+PiArICAgICAgICAqIG9uZXNob3QgbW9kZS4g
SW4gdGhpcyBjYXNlIHRoZSBWQkxBTksgZXZlbnQgaXMgb25seSBnZW5lcmF0ZWQgd2hlbgo+ID4+
ICsgICAgICAgICogYSBqb2IgaXMgcXVldWVkIHRvIHRoZSB3cml0ZWJhY2sgY29ubmVjdG9yLCBh
bmQgd2Ugd2FudCB0aGUgY29yZQo+ID4+ICsgICAgICAgICogdG8gZmFrZSBWQkxBTksgZXZlbnRz
IHdoZW4gdGhpcyBwYXJ0IG9mIHRoZSBwaXBlbGluZSBoYXNuJ3QgY2hhbmdlZAo+ID4+ICsgICAg
ICAgICogYnV0IG90aGVycyBoYWQgb3Igd2hlbiB0aGUgQ1JUQyBhbmQgY29ubmVjdG9ycyBhcmUg
YmVpbmcgZGlzYWJsZWQuCj4gPj4gICAgICAgICAgKgo+ID4gCj4gPiBQZXJoYXBzIGl0J3MganVz
dCBtZSwgeWV0IHRoZSBmb2xsb3dpbmcgaWRlYXMgd291bGQgbWFrZSB0aGUgdG9waWMKPiA+IHNp
Z25pZmljYW50bHkgZWFzaWVyIGFuZCBjbGVhcmVyLgo+ID4gCj4gPiAgLSBhZGRpbmcgZXhwbGlj
aXQgImZha2UiIHdoZW4gdGFsa2luZyBhYm91dCBkcm0vYXRvbWljIF9oZWxwZXJzXwo+ID4gZ2Vu
ZXJhdGluZy9zZW5kaW5nIGEgVkJMQU5LIGV2ZW50Lgo+ID4gRm9yIGV4YW1wbGUsIGluIDE1LzE1
IHRoZSBjb21taXQgbWVzc2FnZSBzYXlzICJmYWtlIiwgd2hpbGUgaW5saW5lCj4gPiBjb21tZW50
IG9taXRzIGl0Li4uIExlYWRpbmcgdG8gdGhlIGNvbmZ1c2lvbiBwb2ludGVkIG91dC4KPiAKPiBO
byBwcm9ibGVtIG9uIGJlaW5nIG1vcmUgcHJlY2lzZSBoZXJlLiBJJ2xsIHVwZGF0ZSB0aGUgZG9j
cyBhY2NvcmRpbmdseS4KPiAKPiA+IAo+ID4gLSBzL25vX3ZibGFuay9mYWtlX3ZibGFuay9nIG9y
IHMvbm9fdmJsYW5rL25vX2h3X3ZibGFuay9nCj4gPiBTaW1wbGUgYW5kIGNvbmNpc2UuIFdpdGgg
c2xpZ2h0IGluY2xpbmF0aW9uIHRvd2FyZHMgdGhlIGZvcm1lciB3b3JkaW5nIDotKQo+IAo+IEkn
ZCBwcmVmZXIgdG8gbm90IGNoYW5nZSB0aGUgZmllbGQncyBuYW1lLiBUaGUgY3VycmVudCBuYW1l
ICdub192YmxhbmsnCj4gaW5kaWNhdGVzIHN0YXRlIGFuZCBsZXRzIGhlbHBlcnMgZGVjaWRlIHdo
YXQgdG8gZG8gd2l0aCBpdC4gVGhlIG5hbWUKPiAnZmFrZV92YmxhbmsnIGluZGljYXRlcyBhbiBp
bnN0cnVjdGlvbiB0byB0aGUgaGVscGVycywgdGVsbGluZyB0aGVtIHdoYXQKPiB0byBkby4gSXQg
ZG9lcyBuZWl0aGVyIHNlZW0gdG8gZml0IGludG8gZHJtX2NydGNfc3RhdGUsIG5vciBpbnRvIHRo
ZQo+IG92ZXJhbGwgY29uY2VwdC4KClllYWggZS5nLiB4ZW4gaGFzIG5vIGh3IHZibGFuaywgYnV0
IHN0aWxsIGhhcyBzcGVjaWFsIHByb2Nlc3Npbmcgb2YKZXZlbnRzLCB3aGljaCBhcmUga2luZGEg
dHJpZ2dlcmVkIGJ5IHRoZSAiaHciIChpdCdzIGFuIGV2ZW50IGZyb20gdGhlCmNvbXBvc2l0b3Ip
LgoKTWF5YmUgdGhlIGNvbmZ1c2lvbiBpcyB3aXRoIHRoZSBoZWxwZXIgZnVuY3Rpb24gdGhhdCBn
ZW5lcmF0ZXMgdGhlCmZha2VfdmJsYW5rLCBzaW5jZSBpdCdzIG5vdCByZWFsbHkgYSBmYWtlIHZi
bGFuayBhdCBhbGwsIGl0J3MganVzdCAic2VuZApvdXQgdGhpcyBhdG9taWMgY29tcGxldGlvbiBl
dmVudCBub3csIEknbSBub3QgZ29pbmcgdG8gZG8gaXQgYXMgcGFydCBvZgp0aGUgdmJsYW5rIHBy
b2Nlc3Npbmcgc2luY2Ugbm8gdmJsYW5rIi4gU28gbWF5YmUgdGhhdCBmdW5jdGlvbiBzaG91bGQg
YmUKY2FsbGVkIF9zZW5kX2V2ZW50c19pX2hhdmVfbm9faHdfdmJsYW5rLCB3aGljaCB5ZWFoIGlz
IG5vdCBhIGdyZWF0IG5hbWUKOi0pIEJ1dCBtYXliZSB5b3UgaGF2ZSBhbiBpZGVhIGZvciB0aGF0
IG9uZT8KLURhbmllbAoKPiAKPiBCZXN0IHJlZ2FyZHMKPiBUaG9tYXMKPiAKPiA+IAo+ID4gSWYg
eW91IGFuZCBEYW5pZWwgYWdyZWUgd2l0aCB0aGUgcmVuYW1lLCB0aGVuIHRoZSBmaXJzdCBzZW50
ZW5jZSBvZgo+ID4gdGhlIGRlc2NyaXB0aW9uIHNob3VsZCBwcm9iYWJseSBiZSB0d2Vha2VkLgo+
ID4gCj4gPiBIVEgKPiA+IEVtaWwKPiA+IAo+IAo+IC0tIAo+IFRob21hcyBaaW1tZXJtYW5uCj4g
R3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcgo+IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1h
bnkgR21iSAo+IE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQo+IChIUkIg
MzY4MDksIEFHIE7DvHJuYmVyZykKPiBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJm
ZmVyCj4gCgoKCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29y
cG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
