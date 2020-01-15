Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDB113C244
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 14:07:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iriMH-0002ic-Kq; Wed, 15 Jan 2020 13:05:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=n3we=3E=redhat.com=hdegoede@srs-us1.protection.inumbo.net>)
 id 1iriLN-0002hj-Ha
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 13:04:21 +0000
X-Inumbo-ID: 85c85bc8-3797-11ea-a2eb-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 85c85bc8-3797-11ea-a2eb-bc764e2007e4;
 Wed, 15 Jan 2020 13:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579093451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mpyInUgk4xmThkqKcuu8EEK88ntJNtXCgXJQyiJXbs4=;
 b=FaBN1ugfG4EWeTiDepxqSo+UKXJc+rQ9BrFrzIfioy5+qepZqv6jIic4TcoxTeSyYGsQAn
 0lJzPsZ3IdonzqHtyBAvUm7YUnqSPyRPDInVoAqAnqvQWU1WQktG+9r+jEOtaKUPc4gNNS
 GOhzkgcZsRiHHHam4vwkMaAnVCBJZNk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-Kn1_riBgOq6hbOscq8XJrw-1; Wed, 15 Jan 2020 08:04:09 -0500
Received: by mail-wm1-f71.google.com with SMTP id p2so4568456wma.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2020 05:04:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mpyInUgk4xmThkqKcuu8EEK88ntJNtXCgXJQyiJXbs4=;
 b=os98G1mGyqvudis95bPm/kVsJimuunmid63MU38uJzQg/wmyG8N5svuQ+kaEilkscu
 s9/jlVmHL7UiA7gFYz8JNNdZiwLQ9PXCKOVerIMdQOa/yY+P4tWFJD3gFc4OixzrtR3q
 b1+qEnRvlN7TZDbEhYWZcjHKUD605BhO+2MwRK/7ODBI0QIchnSxRU7wo91fsA3G0Zki
 aqxucxJ/yn6Z7tmaajDy7su43274h/qjew4IQvF95vFEsAlkE55WRZVt2FlJM5nX0k53
 6W7epdALgQfepmyVSlFVD2DeJBkyN+KHCKRdb+K8QhOg9Ckd4m816Z/rciWardujcreV
 /htA==
X-Gm-Message-State: APjAAAX3olpaGXXhjsJXY4MoLIODLyIm9tLomtpagF6oN5vTV4aSui9Y
 xxZ+/BEsSGojIzZ3eqybaF6yYgUBM2fMK4UAWz0y7SJms4hbGRLGE4ItZgRkS+WpVOlfLuEqhcX
 6AlH8k0Li4lFG+3qcZZm36oPbtrQ=
X-Received: by 2002:a7b:c7d4:: with SMTP id z20mr35642419wmk.42.1579093448407; 
 Wed, 15 Jan 2020 05:04:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqzNc3UH/JZrFdOQ0n0slHlGFi13fSa9Le8xaSC3jQ78spxTvbop6nGuqW1/hkGMIAJTiMuYcw==
X-Received: by 2002:a7b:c7d4:: with SMTP id z20mr35642387wmk.42.1579093448204; 
 Wed, 15 Jan 2020 05:04:08 -0800 (PST)
Received: from shalem.localdomain
 (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
 by smtp.gmail.com with ESMTPSA id n1sm23434301wrw.52.2020.01.15.05.04.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2020 05:04:07 -0800 (PST)
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, kraxel@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, david@lechnology.com, noralf@tronnes.org,
 sean@poorly.run, oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
References: <20200115125226.13843-1-tzimmermann@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <91623f34-cc25-5045-0214-db18ecf29c61@redhat.com>
Date: Wed, 15 Jan 2020 14:04:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200115125226.13843-1-tzimmermann@suse.de>
Content-Language: en-US
X-MC-Unique: Kn1_riBgOq6hbOscq8XJrw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Approved-At: Wed, 15 Jan 2020 13:05:15 +0000
Subject: Re: [Xen-devel] [PATCH v2 0/4] Use no_vblank property for drivers
 without VBLANK
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
Cc: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxNS0wMS0yMDIwIDEzOjUyLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToKPiAoUmVz
ZW5kaW5nIGJlY2F1c2UgSSBkaWQgbm90IGNjIGRyaS1kZXZlbCBwcm9wZXJseS4pCj4gCj4gSW5z
dGVhZCBvZiBmYWtpbmcgVkJMQU5LIGV2ZW50cyBieSB0aGVtc2VsdmVzLCBkcml2ZXJzIHdpdGhv
dXQgVkJMQU5LCj4gc3VwcG9ydCBjYW4gZW5hYmxlIGRybV9jcnRjX3ZibGFuay5ub192Ymxhbmsg
YW5kIGxldCBEUk0gZG8gdGhlIHJlc3QuCj4gVGhlIHBhdGNoc2V0IG1ha2VzIHRoaXMgb2ZmaWNp
YWwgYW5kIGNvbnZlcnRzIG92ZXIgc2V2ZXJhbCBkcml2ZXJzLgo+IAo+IEFzdCBhbHJlYWR5IHVz
ZXMgdGhlIGZ1bmN0aW9uYWxpdHkgYW5kIGp1c3QgbmVlZHMgYSBjbGVhbnVwLiBDaXJydXMgY2Fu
Cj4gYmUgY29udmVydGVkIGVhc2lseSBieSBzZXR0aW5nIHRoZSBmaWVsZCBpbiB0aGUgY2hlY2so
KSBjYWxsYmFjayBhbmQKPiByZW1vdmluZyB0aGUgZXhpc3RpbmcgVkJMQU5LIGNvZGUuIEZvciBt
b3N0IG90aGVyIHNpbXBsZS1LTVMgZHJpdmVycwo+IHdpdGhvdXQgZW5hYmxlX3ZibGFuaygpIGFu
ZCBjaGVjaygpLCBzaW1wbGUtS01TIGhlbHBlcnMgY2FuIGVuYWJsZSB0aGUKPiBmYWtlZCBWQkxB
TksgYnkgZGVmYXVsdC4gVGhlIG9ubHkgZXhjZXB0aW9uIGlzIFhlbiwgd2hpY2ggY29tZXMgd2l0
aAo+IGl0cyBvd24gVkJMQU5LIGxvZ2ljIGFuZCBzaG91bGQgcmF0aGVyIHRvIGRpc2FibGUgbm9f
dmJsYW5rLgo+IAo+IHYyOgo+IAkqIGRvY3VtZW50IGZ1bmN0aW9uYWxpdHkgKERhbmllbCkKPiAJ
KiBjbGVhbnVwIGFzdCAoRGFuaWVsKQo+IAkqIGxldCBzaW1wbGUta21zIGhhbmRsZSBub192Ymxh
bmsgd2hlcmUgcG9zc2libGUKCkVudGlyZSBzZXJpZXMgbG9va3MgZ29vZCB0byBtZToKClJldmll
d2VkLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgoKUmVnYXJkcywKCkhh
bnMKCgoKCj4gVGhvbWFzIFppbW1lcm1hbm4gKDQpOgo+ICAgIGRybTogRG9jdW1lbnQgc3RydWN0
IGRybV9jcnRjX3N0YXRlLm5vX3ZibGFuayBmb3IgZmFraW5nIFZCTEFOSyBldmVudHMKPiAgICBk
cm0vYXN0OiBTZXQgc3RydWN0IGRybV9jcnRjX3N0YXRlLm5vX3ZibGFuayBpbiBhdG9taWNfY2hl
Y2soKQo+ICAgIGRybS9jaXJydXM6IExldCBEUk0gY29yZSBzZW5kIFZCTEFOSyBldmVudHMKPiAg
ICBkcm0vc2ltcGxlLWttczogTGV0IERSTSBjb3JlIHNlbmQgVkJMQU5LIGV2ZW50cyBieSBkZWZh
dWx0Cj4gCj4gICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgICAgICAgICAgfCAgNCAr
Ky0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfa21zLmMgICAgICAgfCAgOSAtLS0t
LS0tLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMgICAgICAgICB8IDEwICsr
LS0tLS0tLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jICAgICB8ICA0
ICsrKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fbWlwaV9kYmkuYyAgICAgICAgICB8ICA5IC0t
LS0tLS0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9zaW1wbGVfa21zX2hlbHBlci5jIHwgMTkg
KysrKysrKysrKysrKysrLS0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3RpbnkvZ20xMnUzMjAuYyAg
ICAgICAgIHwgIDkgLS0tLS0tLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vdGlueS9pbGk5MjI1LmMg
ICAgICAgICAgfCAgOSAtLS0tLS0tLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS90aW55L3JlcGFwZXIu
YyAgICAgICAgICB8ICA5IC0tLS0tLS0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3Rpbnkvc3Q3NTg2
LmMgICAgICAgICAgIHwgIDkgLS0tLS0tLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9t
b2Rlc2V0LmMgICAgICAgfCAxMSAtLS0tLS0tLS0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3hlbi94
ZW5fZHJtX2Zyb250X2ttcy5jIHwgMTMgKysrKysrKysrKysrKwo+ICAgaW5jbHVkZS9kcm0vZHJt
X2NydGMuaCAgICAgICAgICAgICAgICAgIHwgIDkgKysrKysrKy0tCj4gICBpbmNsdWRlL2RybS9k
cm1fc2ltcGxlX2ttc19oZWxwZXIuaCAgICAgfCAgNyArKysrKy0tCj4gICAxNCBmaWxlcyBjaGFu
Z2VkLCA0NyBpbnNlcnRpb25zKCspLCA4NCBkZWxldGlvbnMoLSkKPiAKPiAtLQo+IDIuMjQuMQo+
IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
