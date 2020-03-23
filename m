Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAA618F359
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 12:05:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGKr1-0004Kg-F2; Mon, 23 Mar 2020 11:02:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ykN7=5I=ffwll.ch=daniel@srs-us1.protection.inumbo.net>)
 id 1jGKqz-0004Kb-0w
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 11:02:45 +0000
X-Inumbo-ID: d22f9092-6cf5-11ea-bec1-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d22f9092-6cf5-11ea-bec1-bc764e2007e4;
 Mon, 23 Mar 2020 11:02:44 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id 31so10452935wrs.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2020 04:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IUrL6RT5B4au/jksoZX0NvHn1tjMEl4mdR//1cfnuhA=;
 b=BJqg6wGqEYi2vq9LBm3GGh8QTcAziBEgeO9Y4/yGVVpWm552u5YTBb8PiLGHEgVO0o
 +qdpthaoxDWCkfgQEUW8aiKGMIBWWohVQUMjuKMXh9uCtQITIGF9zkdSue/JuFwAfdsn
 k8N36o7qKyuCGp/BaxpVGD6nIVH28uQCDnlpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IUrL6RT5B4au/jksoZX0NvHn1tjMEl4mdR//1cfnuhA=;
 b=kTFOoa/Iko6eBsmzqGGbLJcgrIB0r0iJ/DyInIF0DA8qsdgvPoHjc++HviA/jxTTCt
 a+90W7hD99c2s71jMCdoTm59IvIJ9lENM4xJFQ9PO7sTsWi0ygtYyDYHpNXNKTYRyJLE
 +LFkj8qR4hgX6q50hQFsCUb/Q6tkwvAdp5LrEILqddZZreyUOkxkNpZaRGr5RmW4Jgls
 Cbel320QryKqVxbae9fpAoR0M4+5cJECWMdsUHu+TweyZu3QdAhvaTcZcX4hKjqb3dl7
 DtAWBjAcGSTYZg8yM3kbTLRdamXG8jpG21eFevqtMA4IvF4iCVQV3K/LWpfjS6Z694K9
 36Bg==
X-Gm-Message-State: ANhLgQ1yRabOWL8YZwOYeFoktbKKI6GCvk+PV2UUnVMFZoV6Y3uYNEXE
 TOo5SUoOB3TooWxzQ0BPHpA+fw==
X-Google-Smtp-Source: ADFU+vuy0yy7F87SXdslP+hL3OUGRcJkiAjDgnRZdw8bLWbYBBR26u6l7P0EKvVeSOp7GNEcIv3Gig==
X-Received: by 2002:a05:6000:1251:: with SMTP id
 j17mr12786883wrx.228.1584961363305; 
 Mon, 23 Mar 2020 04:02:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t5sm20829173wmi.34.2020.03.23.04.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 04:02:41 -0700 (PDT)
Date: Mon, 23 Mar 2020 12:02:38 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Message-ID: <20200323110238.GI2363188@phenom.ffwll.local>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-5-daniel.vetter@ffwll.ch>
 <20200307080608.GA28810@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200307080608.GA28810@ravnborg.org>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Subject: Re: [Xen-devel] [PATCH 04/51] drm: Set final_kfree in drm_dev_alloc
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
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU2F0LCBNYXIgMDcsIDIwMjAgYXQgMDk6MDY6MDhBTSArMDEwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IE9uIE1vbiwgTWFyIDAyLCAyMDIwIGF0IDExOjI1OjQ0UE0gKzAxMDAsIERhbmllbCBW
ZXR0ZXIgd3JvdGU6Cj4gPiBJIGFsc28gZGlkIGEgZnVsbCByZXZpZXcgb2YgYWxsIGNhbGxlcnMs
IGFuZCBvbmx5IHRoZSB4ZW4gZHJpdmVyCj4gPiBmb3Jnb3QgdG8gY2FsbCBkcm1fZGV2X3B1dCBp
biB0aGUgZmFpbHVyZSBwYXRoLiBGaXggdGhhdCB1cCB0b28uCj4gCj4gU28gfjQwIGNhbGxlcnMg
LSBwaGV3Li4KPiAKPiA+IAo+ID4gdjI6IEkgbm90aWNlZCB0aGF0IHhlbiBoYXMgYSBkcm1fZHJp
dmVyLnJlbGVhc2UgaG9vaywgYW5kIHVzZXMKPiA+IGRybV9kZXZfYWxsb2MoKS4gV2UgbmVlZCB0
byByZW1vdmUgdGhlIGtmcmVlIGZyb20KPiA+IHhlbl9kcm1fZHJ2X3JlbGVhc2UoKS4KPiA+IAo+
ID4gYm9jaHMgYWxzbyBoYXMgYSByZWxlYXNlIGhvb2ssIGJ1dCBsZWFrZWQgdGhlIGRybV9kZXZp
Y2UgZXZlciBzaW5jZQo+ID4gCj4gPiBjb21taXQgMGE2NjU5YmRjNWU4MjIxZGE5OWVlYmIxNzZm
ZDk1OTE0MzVlMzhkZQo+ID4gQXV0aG9yOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNv
bT4KPiA+IERhdGU6ICAgVHVlIERlYyAxNyAxODowNDo0NiAyMDEzICswMTAwCj4gPiAKPiA+ICAg
ICBkcm0vYm9jaHM6IG5ldyBkcml2ZXIKPiA+IAo+ID4gVGhpcyBwYXRjaCBoZXJlIGZpeGVzIHRo
YXQgbGVhay4KPiA+IAo+ID4gU2FtZSBmb3IgdmlydGlvLCBzdGFydGVkIGxlYWtpbmcgd2l0aAo+
ID4gCj4gPiBjb21taXQgYjFkZjNhMmIyNGE5MTdmODg1M2Q0M2ZlOTY4M2MwZTM2MGQyYzMzYQo+
ID4gQXV0aG9yOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiA+IERhdGU6ICAg
VHVlIEZlYiAxMSAxNDo1ODowNCAyMDIwICswMTAwCj4gPiAKPiA+ICAgICBkcm0vdmlydGlvOiBh
ZGQgZHJtX2RyaXZlci5yZWxlYXNlIGNhbGxiYWNrLgo+ID4gCj4gPiBDYzogR2VyZCBIb2ZmbWFu
biA8a3JheGVsQHJlZGhhdC5jb20+Cj4gPiBDYzogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9s
ZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgo+ID4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwo+IAo+IFRoZSBhYm92ZSB3aWxsIGJlIHBpY2tlZCB1cCBieSB0b29scyBh
cyByZWd1bGFyIENjOiBsaW5lcy4KPiBCdXQgSSBndWVzcyBpdCBpcyBmaW5lLgoKVGhhdCB3YXMg
dGhlIGlkZWEsIEkndmUgZGVsZXRlZCB0aGUgc3B1cmlvdXMgYmxhbmsgbGluZSB0byBtYWtlIHRo
aXMgbGVzcwpjb25mdXNpbmcuCi1EYW5pZWwKCj4gCj4gPiAKPiA+IFJldmlld2VkLWJ5OiBPbGVr
c2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4K
PiA+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwu
Y29tPgo+ID4gQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KPiA+IENjOiBU
aG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiA+IENjOiBEYXZpZCBBaXJs
aWUgPGFpcmxpZWRAbGludXguaWU+Cj4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xs
LmNoPgo+ID4gQ2M6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNo
ZW5rb0BlcGFtLmNvbT4KPiA+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiAK
PiBGb3IgdGhlIGRyaXZlcnMgSSBsb29rZWQgYXQgZXZlcnl0aGluZyBsb29rZWQgZmluZS4KPiAK
PiBBY2tlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IAo+ID4gLS0tCj4g
PiAgZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYyAgICAgICAgICAgfCAzICsrKwo+ID4gIGRyaXZl
cnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jIHwgMiArLQo+ID4gIDIgZmlsZXMgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYwo+ID4g
aW5kZXggMTUzMDUwZmM5MjZjLi43Yjg0ZWU4YTVlYjUgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2Rydi5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jCj4g
PiBAQCAtMzksNiArMzksNyBAQAo+ID4gICNpbmNsdWRlIDxkcm0vZHJtX2NvbG9yX21nbXQuaD4K
PiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4KPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9maWxl
Lmg+Cj4gPiArI2luY2x1ZGUgPGRybS9kcm1fbWFuYWdlZC5oPgo+ID4gICNpbmNsdWRlIDxkcm0v
ZHJtX21vZGVfb2JqZWN0Lmg+Cj4gPiAgI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4KPiA+ICAK
PiA+IEBAIC04MTksNiArODIwLDggQEAgc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXZfYWxsb2Mo
c3RydWN0IGRybV9kcml2ZXIgKmRyaXZlciwKPiA+ICAJCXJldHVybiBFUlJfUFRSKHJldCk7Cj4g
PiAgCX0KPiA+ICAKPiA+ICsJZHJtbV9hZGRfZmluYWxfa2ZyZWUoZGV2LCBkZXYpOwo+ID4gKwo+
ID4gIAlyZXR1cm4gZGV2Owo+ID4gIH0KPiA+ICBFWFBPUlRfU1lNQk9MKGRybV9kZXZfYWxsb2Mp
Owo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jIGIv
ZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250LmMKPiA+IGluZGV4IDRiZTQ5YzFhZWY1
MS4uZDIyYjVkYTM4OTM1IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5f
ZHJtX2Zyb250LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5j
Cj4gPiBAQCAtNDYxLDcgKzQ2MSw2IEBAIHN0YXRpYyB2b2lkIHhlbl9kcm1fZHJ2X3JlbGVhc2Uo
c3RydWN0IGRybV9kZXZpY2UgKmRldikKPiA+ICAJZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZGV2
KTsKPiA+ICAKPiA+ICAJZHJtX2Rldl9maW5pKGRldik7Cj4gPiAtCWtmcmVlKGRldik7Cj4gPiAg
Cj4gPiAgCWlmIChmcm9udF9pbmZvLT5jZmcuYmVfYWxsb2MpCj4gPiAgCQl4ZW5idXNfc3dpdGNo
X3N0YXRlKGZyb250X2luZm8tPnhiX2RldiwKPiA+IEBAIC01NjEsNiArNTYwLDcgQEAgc3RhdGlj
IGludCB4ZW5fZHJtX2Rydl9pbml0KHN0cnVjdCB4ZW5fZHJtX2Zyb250X2luZm8gKmZyb250X2lu
Zm8pCj4gPiAgZmFpbF9tb2Rlc2V0Ogo+ID4gIAlkcm1fa21zX2hlbHBlcl9wb2xsX2ZpbmkoZHJt
X2Rldik7Cj4gPiAgCWRybV9tb2RlX2NvbmZpZ19jbGVhbnVwKGRybV9kZXYpOwo+ID4gKwlkcm1f
ZGV2X3B1dChkcm1fZGV2KTsKPiA+ICBmYWlsOgo+ID4gIAlrZnJlZShkcm1faW5mbyk7Cj4gPiAg
CXJldHVybiByZXQ7Cj4gPiAtLSAKPiA+IDIuMjQuMQo+ID4gCj4gPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gZHJpLWRldmVsIG1haWxpbmcgbGlz
dAo+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApEYW5pZWwgVmV0
dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZnds
bC5jaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
