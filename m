Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A87177058
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 08:49:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j92Ds-0003HX-Ng; Tue, 03 Mar 2020 07:44:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=V7QJ=4U=redhat.com=kraxel@srs-us1.protection.inumbo.net>)
 id 1j92Dr-0003HS-AC
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 07:44:11 +0000
X-Inumbo-ID: c3e4d818-5d22-11ea-a098-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c3e4d818-5d22-11ea-a098-12813bfff9fa;
 Tue, 03 Mar 2020 07:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583221448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=396rp1lUjwAwuzlXsp/iww2VoRLvmaxeWWTiZaWuL+g=;
 b=OGRno3RSCXHpO7adY5eNoM6OxNPBzdsOtGh7LC3xeFV+3WRg4gQ30AHY1Ss/jWwRfuSbSJ
 QVosVXCjdxfi5EYIlyaUXUwXcOLAfrrHp5+afXEAzdbD+mj09LuIGluDkhohjxcODJoQfB
 UwdkxDe39XRHT0Xy2jAmcB3olkLpCFI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-KzIT24rXOWCelZL0WLI-RA-1; Tue, 03 Mar 2020 02:44:06 -0500
X-MC-Unique: KzIT24rXOWCelZL0WLI-RA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BF72800D4E;
 Tue,  3 Mar 2020 07:44:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 001228D561;
 Tue,  3 Mar 2020 07:44:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 357E317449; Tue,  3 Mar 2020 08:44:02 +0100 (CET)
Date: Tue, 3 Mar 2020 08:44:02 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <20200303074402.wcb7a3lxjwnhqilo@sirius.home.kraxel.org>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-5-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20200302222631.3861340-5-daniel.vetter@ffwll.ch>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
Cc: Daniel Vetter <daniel@ffwll.ch>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 xen-devel@lists.xenproject.org, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXIgMDIsIDIwMjAgYXQgMTE6MjU6NDRQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBJIGFsc28gZGlkIGEgZnVsbCByZXZpZXcgb2YgYWxsIGNhbGxlcnMsIGFuZCBvbmx5
IHRoZSB4ZW4gZHJpdmVyCj4gZm9yZ290IHRvIGNhbGwgZHJtX2Rldl9wdXQgaW4gdGhlIGZhaWx1
cmUgcGF0aC4gRml4IHRoYXQgdXAgdG9vLgo+IAo+IHYyOiBJIG5vdGljZWQgdGhhdCB4ZW4gaGFz
IGEgZHJtX2RyaXZlci5yZWxlYXNlIGhvb2ssIGFuZCB1c2VzCj4gZHJtX2Rldl9hbGxvYygpLiBX
ZSBuZWVkIHRvIHJlbW92ZSB0aGUga2ZyZWUgZnJvbQo+IHhlbl9kcm1fZHJ2X3JlbGVhc2UoKS4K
PiAKPiBib2NocyBhbHNvIGhhcyBhIHJlbGVhc2UgaG9vaywgYnV0IGxlYWtlZCB0aGUgZHJtX2Rl
dmljZSBldmVyIHNpbmNlCj4gCj4gY29tbWl0IDBhNjY1OWJkYzVlODIyMWRhOTllZWJiMTc2ZmQ5
NTkxNDM1ZTM4ZGUKPiBBdXRob3I6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgo+
IERhdGU6ICAgVHVlIERlYyAxNyAxODowNDo0NiAyMDEzICswMTAwCj4gCj4gICAgIGRybS9ib2No
czogbmV3IGRyaXZlcgo+IAo+IFRoaXMgcGF0Y2ggaGVyZSBmaXhlcyB0aGF0IGxlYWsuCj4gCj4g
U2FtZSBmb3IgdmlydGlvLCBzdGFydGVkIGxlYWtpbmcgd2l0aAo+IAo+IGNvbW1pdCBiMWRmM2Ey
YjI0YTkxN2Y4ODUzZDQzZmU5NjgzYzBlMzYwZDJjMzNhCj4gQXV0aG9yOiBHZXJkIEhvZmZtYW5u
IDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiBEYXRlOiAgIFR1ZSBGZWIgMTEgMTQ6NTg6MDQgMjAyMCAr
MDEwMAo+IAo+ICAgICBkcm0vdmlydGlvOiBhZGQgZHJtX2RyaXZlci5yZWxlYXNlIGNhbGxiYWNr
LgoKQWNrZWQtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgoKPiAKPiBDYzog
R2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Cj4gQ2M6IE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KPiBDYzogeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCj4gCj4gUmV2aWV3ZWQtYnk6IE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KPiBTaWduZWQtb2ZmLWJ5
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiBDYzogTWFhcnRlbiBM
YW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiBDYzogTWF4aW1l
IFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgo+IENjOiBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+
IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IE9sZWtzYW5kciBBbmRy
dXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KPiBDYzogeGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2
LmMgICAgICAgICAgIHwgMyArKysKPiAgZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250
LmMgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2Rydi5jCj4gaW5kZXggMTUzMDUwZmM5MjZjLi43Yjg0ZWU4YTVlYjUgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZHJ2LmMKPiBAQCAtMzksNiArMzksNyBAQAo+ICAjaW5jbHVkZSA8ZHJtL2RybV9j
b2xvcl9tZ210Lmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX2Rydi5oPgo+ICAjaW5jbHVkZSA8ZHJt
L2RybV9maWxlLmg+Cj4gKyNpbmNsdWRlIDxkcm0vZHJtX21hbmFnZWQuaD4KPiAgI2luY2x1ZGUg
PGRybS9kcm1fbW9kZV9vYmplY3QuaD4KPiAgI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4KPiAg
Cj4gQEAgLTgxOSw2ICs4MjAsOCBAQCBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2Rldl9hbGxvYyhz
dHJ1Y3QgZHJtX2RyaXZlciAqZHJpdmVyLAo+ICAJCXJldHVybiBFUlJfUFRSKHJldCk7Cj4gIAl9
Cj4gIAo+ICsJZHJtbV9hZGRfZmluYWxfa2ZyZWUoZGV2LCBkZXYpOwo+ICsKPiAgCXJldHVybiBk
ZXY7Cj4gIH0KPiAgRVhQT1JUX1NZTUJPTChkcm1fZGV2X2FsbG9jKTsKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250LmMgYi9kcml2ZXJzL2dwdS9kcm0veGVu
L3hlbl9kcm1fZnJvbnQuYwo+IGluZGV4IDRiZTQ5YzFhZWY1MS4uZDIyYjVkYTM4OTM1IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250LmMKPiBAQCAtNDYxLDcgKzQ2MSw2IEBAIHN0
YXRpYyB2b2lkIHhlbl9kcm1fZHJ2X3JlbGVhc2Uoc3RydWN0IGRybV9kZXZpY2UgKmRldikKPiAg
CWRybV9tb2RlX2NvbmZpZ19jbGVhbnVwKGRldik7Cj4gIAo+ICAJZHJtX2Rldl9maW5pKGRldik7
Cj4gLQlrZnJlZShkZXYpOwo+ICAKPiAgCWlmIChmcm9udF9pbmZvLT5jZmcuYmVfYWxsb2MpCj4g
IAkJeGVuYnVzX3N3aXRjaF9zdGF0ZShmcm9udF9pbmZvLT54Yl9kZXYsCj4gQEAgLTU2MSw2ICs1
NjAsNyBAQCBzdGF0aWMgaW50IHhlbl9kcm1fZHJ2X2luaXQoc3RydWN0IHhlbl9kcm1fZnJvbnRf
aW5mbyAqZnJvbnRfaW5mbykKPiAgZmFpbF9tb2Rlc2V0Ogo+ICAJZHJtX2ttc19oZWxwZXJfcG9s
bF9maW5pKGRybV9kZXYpOwo+ICAJZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZHJtX2Rldik7Cj4g
Kwlkcm1fZGV2X3B1dChkcm1fZGV2KTsKPiAgZmFpbDoKPiAgCWtmcmVlKGRybV9pbmZvKTsKPiAg
CXJldHVybiByZXQ7Cj4gLS0gCj4gMi4yNC4xCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
