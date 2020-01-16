Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8039714006B
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 01:03:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isF3T-0000V3-QT; Fri, 17 Jan 2020 00:00:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IwY6=3G=ffwll.ch=daniel@srs-us1.protection.inumbo.net>)
 id 1isF3S-0000H8-AW
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 00:00:02 +0000
X-Inumbo-ID: 4e9e7378-38bc-11ea-a985-bc764e2007e4
Received: from mail-pj1-x1044.google.com (unknown [2607:f8b0:4864:20::1044])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e9e7378-38bc-11ea-a985-bc764e2007e4;
 Fri, 17 Jan 2020 00:00:01 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id n96so2327377pjc.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2020 16:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Gho4j8nrfzG7IIa/FHOMHSYrFD9fBFO6dW7IZ3T+oY4=;
 b=jbhk43HgBzxIo1ehyWHQ3muHVCKVicJMw4lGK9hDDoNneH25t7nrMv/E81aXUS90/s
 3tvwCtF0XAuQrXjsOwIjUXKjNYyVv6RXJn8sJTbf2LmSn7P6svL8hVeQ5WF1FFtipGyl
 /2ioKaex4roC/Vnvketgbv7xEvV/AMxjAEG4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Gho4j8nrfzG7IIa/FHOMHSYrFD9fBFO6dW7IZ3T+oY4=;
 b=MlsjE8ptDbj5FrYmbKWawDcCuv39pSAElpNDWP9fj3XBVcBrIshMeMFk3vKqZDf1b8
 peAA83C8CsfLT09FlpnfxRnPXeC69rUfTglCgAKXmG6DROz9oa2bpgIokoaXlWeD4gju
 qI/r5Y7G/6PBQ13wwvpCFhBxTGqduwWvZAgRhLP+qDMwCerqAIg/R2a/ieWx7Qr7eKH2
 j4jv7MXCLR19RTBWQs0HhcmUqmi1losMD4gZOENR/E1XapczCbDzM1fvwBMQ2d3p4Xse
 Irj1sqKXhQLbRJWfw5m6o7/09boN/uPEe+AtS99RTv0y6CrD5dT5I269or0SLcf1vii1
 TNnQ==
X-Gm-Message-State: APjAAAVDWzPbHdEf4SzGkedst+odccfbyQ8Kt5TOl9FGUDpsSvEMRO4l
 xzaFeCqVFQvejPPMYxW2Hpvp0w==
X-Google-Smtp-Source: APXvYqxP2Z2WaBH4UioHB+9TA8u7yA9J5IQZGxDpGRFn2bAKhkdPT8u9RWRLkISvPb3UIhMzZ3zSGA==
X-Received: by 2002:a17:902:8bc3:: with SMTP id
 r3mr28824480plo.220.1579219200714; 
 Thu, 16 Jan 2020 16:00:00 -0800 (PST)
Received: from dvetter-linux.ger.corp.intel.com ([138.44.248.126])
 by smtp.gmail.com with ESMTPSA id d26sm25172656pgv.66.2020.01.16.15.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 16:00:00 -0800 (PST)
Date: Fri, 17 Jan 2020 00:59:51 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Message-ID: <20200116235951.GD8400@dvetter-linux.ger.corp.intel.com>
References: <20200115125226.13843-1-tzimmermann@suse.de>
 <20200115125226.13843-5-tzimmermann@suse.de>
 <20200116064107.GB8400@dvetter-linux.ger.corp.intel.com>
 <33fdd33f-ce8d-70d3-544e-fac727d2686b@suse.de>
 <CACvgo52gwC6U5HjnsQSUUDgE7Gp_EDb-QqCY8VDFjAX7cE0Lxg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo52gwC6U5HjnsQSUUDgE7Gp_EDb-QqCY8VDFjAX7cE0Lxg@mail.gmail.com>
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, oleksandr_andrushchenko@epam.com,
 Dave Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Hans de Goede <hdegoede@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, xen-devel@lists.xenproject.org,
 Emil Velikov <emil.velikov@collabora.com>, Sam Ravnborg <sam@ravnborg.org>,
 david@lechnology.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMTYsIDIwMjAgYXQgMDU6MjI6MzRQTSArMDAwMCwgRW1pbCBWZWxpa292IHdy
b3RlOgo+IEhpIGFsbCwKPiAKPiBPbiBUaHUsIDE2IEphbiAyMDIwIGF0IDA3OjM3LCBUaG9tYXMg
WmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6Cj4gCj4gPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19zdGF0ZV9oZWxwZXIuYyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fYXRvbWljX3N0YXRlX2hlbHBlci5jCj4gPiA+IGluZGV4IDdjZjNjZjkzNjU0
Ny4uMjNkMmY1MWZjMWQ0IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0
b21pY19zdGF0ZV9oZWxwZXIuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21p
Y19zdGF0ZV9oZWxwZXIuYwo+ID4gPiBAQCAtMTQ5LDYgKzE0OSwxMSBAQCB2b2lkIF9fZHJtX2F0
b21pY19oZWxwZXJfY3J0Y19kdXBsaWNhdGVfc3RhdGUoc3RydWN0IGRybV9jcnRjICpjcnRjLAo+
ID4gPiAgICAgICAvKiBTZWxmIHJlZnJlc2ggc2hvdWxkIGJlIGNhbmNlbGVkIHdoZW4gYSBuZXcg
dXBkYXRlIGlzIGF2YWlsYWJsZSAqLwo+ID4gPiAgICAgICBzdGF0ZS0+YWN0aXZlID0gZHJtX2F0
b21pY19jcnRjX2VmZmVjdGl2ZWx5X2FjdGl2ZShzdGF0ZSk7Cj4gPiA+ICAgICAgIHN0YXRlLT5z
ZWxmX3JlZnJlc2hfYWN0aXZlID0gZmFsc2U7Cj4gPiA+ICsKPiA+ID4gKyAgICAgaWYgKGRybV9k
ZXZfaGFzX3ZibGFuayhjcnRjLT5kZXYpKQo+ID4gPiArICAgICAgICAgICAgIHN0YXRlLT5ub192
YmxhbmsgPSB0cnVlOwo+ID4gPiArICAgICBlbHNlCj4gPiA+ICsgICAgICAgICAgICAgc3RhdGUt
Pm5vX3ZibGFuayA9IGZhbHNlOwo+ID4gPiAgfQo+ID4gPiAgRVhQT1JUX1NZTUJPTChfX2RybV9h
dG9taWNfaGVscGVyX2NydGNfZHVwbGljYXRlX3N0YXRlKTsKPiA+Cj4gPiBJIHRoaW5rIHRoZSBp
Zi9lbHNlIGJyYW5jaGVzIGFyZSBpbiB0aGUgd3Jvbmcgb3JkZXIuCgpZZWFoIGZ1bWJsZWQgdGhh
dC4KCj4gPiBCdXQgZ2VuZXJhbGx5IHNwZWFraW5nLCBpcyBpdCByZWFsbHkgdGhhdCBlYXN5PyBU
aGUgeGVuIGRyaXZlciBhbHJlYWR5Cj4gPiBoYXMgdG8gd29yayBhcm91bmQgc2ltcGxlLWttcydz
IGF1dG8tZW5hYmxpbmcgb2Ygbm9fdmJsYW5rIChzZWUgcGF0Y2gKPiA+IDQpLiBNYXliZSB0aGlz
IHNldHRpbmdzIGludGVyZmVyZXMgd2l0aCBvdGhlciBkcml2ZXJzIGFzIHdlbGwuIEF0IGxlYXN0
Cj4gPiB0aGUgY2FsbHMgZm9yIHNlbmRpbmcgZmFrZSB2YmxhbmtzIHNob3VsZCBiZSByZW1vdmVk
IGZyb20gYWxsIGFmZmVjdGVkCj4gPiBkcml2ZXJzLgoKSG0geGVuIGlzIHJlYWxseSBzcGVjaWFs
LCBpbiB0aGF0IGl0IGhhcyBhIGZsaXAgY29tcGxldGUgZXZlbnQsIGJ1dCBub3QgYQp2Ymxhbmsu
IEkgdGhpbmsgZm9yY2luZyBkcml2ZXJzIHRvIG92ZXJ3cml0ZSBzdHVmZiBpbiB0aGF0IGNhc2Ug
bWFrZXMKc2Vuc2UuCgo+IEknbSBub3Qgc3VyZSBpZiBzZXR0aW5nIG5vX3ZibGFuayBiYXNlZCBv
biBkZXYtPm51bV9jcnRjcyBpcyB0aGUgY29ycmVjdCB0aGluZy4KPiBGcm9tIHRoZSBvcmlnaW5h
bCBjb21taXQgYW5kIGFzc29jaWF0ZWQgZGVzY3JpcHRpb24gZm9yIG5vX3ZibGFuazoKPiAKPiBJ
biBzb21lIGNhc2VzIENSVENzIGFyZSBhY3RpdmUgYnV0IGFyZSBub3QgYWJsZSB0byBnZW5lcmF0
aW5nIGV2ZW50cywgYXQKPiBsZWFzdCBub3QgYXQgZXZlcnkgZnJhbWUgYXQgaXQncyBleHBlY3Rl
ZCB0by4KPiBUaGlzIGlzIHR5cGljYWxseSB0aGUgY2FzZSB3aGVuIHRoZSBDUlRDIGlzIGZlZWRp
bmcgYSB3cml0ZWJhY2sgY29ubmVjdG9yLi4uCgpZZWFoLCBidXQgVGhvbWFzJyBzZXJpZXMgaGVy
ZSB3YW50cyB0byBleHRlbmQgdGhhdC4gQW5kIEkgdGhpbmsgaWYgd2Ugcm9sbAp0aGlzIG91dCB0
aGUgY29tbW9uIGNhc2Ugd2lsbCBiZSAibm8gaHcgdmJsYW5rIiwgYW5kIHRoZSB3cml0ZWJhY2sg
c3BlY2lhbApjYXNlIGlzIGdvaW5nIHRvIGJlIHRoZSBleGNlcHRpb24gdG8gdGhlIGV4Y2VwdGlv
bi4gWXVwLCBwYXRjaCAxIHRoYXQKdXBkYXRlcyB0aGUgZG9jcyBkb2Vzbid0IHJlZmxlY3QgdGhh
dCwgd2hpY2ggaXMgd2h5IEknbSBicmluZ2luZyB1cCBtb3JlCnN1Z2dlc3Rpb25zIGhlcmUgYXJv
dW5kIGNvZGUgJiBzZW1hbnRpY3Mgb2YgYWxsIHRoZXNlIHBpZWNlcyB0byBtYWtlIHRoZW0KZG8g
dGhlIG1vc3QgcmVhc29uYWJsZSB0aGluZyBmb3IgbW9zdCBvZiB0aGUgZHJpdmVycy4KCj4gUmVm
bGVjdHMgdGhlIGFiaWxpdHkgb2YgYSBDUlRDIHRvIHNlbmQgVkJMQU5LIGV2ZW50cy4uLi4KPiAK
PiAKPiBUaGUgcHJvcG9zZWQgaGFuZGxpbmcgb2Ygbm9fdmJsYW5rIGZlZWxzIGEgbGl0dGxlIGRp
cnR5LCBhbHRob3VnaAo+IG5vdGhpbmcgYmV0dGVyIGNvbWVzIHRvIG1pbmQuCj4gTmV2ZXJ0aGVs
ZXNzIGNvZGUgc2VlbXMgcGVyZmVjdGx5IHJlYXNvbmFibGUsIHNvIGlmIGl0IHdlcmUgbWUgSSdk
IG1lcmdlIGl0LgoKVGhlIGlkZWEgd2l0aCBzZXR0aW5nIGl0IHZlcnkgZWFybHkgaXMgdGhhdCBk
cml2ZXJzIGNhbiBvdmVyd3JpdGUgaXQgdmVyeQplYXNpbHkuIEZlZWxzIHNsaWdodGx5IGRpcnR5
LCBzbyBJIGd1ZXNzIHdlIGNvdWxkIGFsc28gc2V0IGl0IHNvbWV3aGVyZSBpbgp0aGUgYXRvbWlj
X2hlbHBlcl9jaGVjayBmdW5jdGlvbiAoc2ltaWxhciB0byBob3cgd2Ugc2V0IHRoZSB2YXJpb3Vz
CmNydGMtPipfY2hhbmdlZCBmbGFncywgYnV0IHdlJ3JlIG5vdCBlbnRpcmVseSBjb25zaXN0ZW50
IG9uIHRoZXNlIGVpdGhlcikuCgpGb3IgdGhlIG92ZXJhbGwgdGhpbmcgd2hhdCBmZWVscyBpcmt5
IHRvIG1lIGlzIG1ha2luZyB0aGlzIG5vX3ZibGFuawpkZWZhdWx0IGxvZ2ljIChob3dldmVyIHdl
IGVuZCB1cCBjb21wdXRpbmcgaXQgaW4gdGhlIGVuZCwgd2hldGhlciBsaWtlCnRoaXMgb3Igd2hh
dCBJIHN1Z2dlc3RlZCkgc3BlY2lmaWMgdG8gc2ltcGxlIHBpcGUgaGVscGVycyBmZWVscyBraW5k
YQp3cm9uZy4gU2ltcGxlIHBpcGUgdGVuZHMgdG8gaGF2ZSBhIGhpZ2hlciByYXRpbyBvZiBkcml2
ZXJzIGZvciBodyB3aXRob3V0CnZibGFuayBzdXBwb3J0LCBidXQgYnkgZmFyIG5vdCB0aGUgb25s
eSBvbmVzLiBIYXZpbmcgdGhhdCBzcGVjaWFsIGNhc2UKZmVlbHMgY29uZnVzaW5nIHRvIG1lIChh
bmQgbGlrZWx5IHdpbGwgdHJpcCB1cCBzb21lIHBlb3BsZSwgdmJsYW5rIGFuZApldmVudCBoYW5k
bGluZyBpcyBhbHJlYWR5IGEgaHVnZSBzb3VyY2Ugb2YgY29uZnVzaW9uIGluIGRybSkuCgpPbmUg
aWRlYSBiZWhpbmQgZHJtX2Rldl9oYXNfdmJsYW5rKCkgaXMgYWxzbyB0aGF0IHdlIGNvdWxkIGZv
cm1hbGl6ZSBhIGJpdAphbGwgdGhhdCwgYXQgbGVhc3QgZm9yIHRoZSB1c3VhbCBjYXNlIC0geGVu
IGFuZCBtYXliZSBvdGhlcnMgYmVpbmcgc29tZQpleGNlcHRpb25zIGFzIHVzdWFsIChoZW5jZSBk
ZWZpbml0ZWx5IG5vdCBzb21ldGhpbmcgdGhlIGNvcmUgY29kZSBzaG91bGQKaGFuZGxlKS4KCkNo
ZWVycywgRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBD
b3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
