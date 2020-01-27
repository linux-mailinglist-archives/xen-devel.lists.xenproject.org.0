Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3033B14A12E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 10:50:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw0zj-0000fr-Ce; Mon, 27 Jan 2020 09:47:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=X4q5=3Q=ffwll.ch=daniel@srs-us1.protection.inumbo.net>)
 id 1iw0zh-0000fm-Oa
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 09:47:45 +0000
X-Inumbo-ID: 11420aea-40ea-11ea-b833-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11420aea-40ea-11ea-b833-bc764e2007e4;
 Mon, 27 Jan 2020 09:47:44 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c84so6287547wme.4
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2020 01:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=H6zmf5XzCvSMH9uJ4yak9/j0gn5TwDDcpXp+N0GvNHo=;
 b=NCVXrrNnL4lyVfhwYABdKDq/2VD10nrlZBZBe3FObKCZRT96shMvVvzOJki+O6QtFg
 EKMM/rhgc7ZN20P1bLv7MEUldvDF0nYx4fyp8ccghH1u5knbG0v2iyAdYmGsO25VEy0S
 RJq/xEMeFTyMCmxFJhlZ+YoWpubcwcOCzrldM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H6zmf5XzCvSMH9uJ4yak9/j0gn5TwDDcpXp+N0GvNHo=;
 b=tnZbs/Ke5O4xbvmRPtWX14JpLCy/qn72I9rkC4Pcq2iTZzl2hDNRbR3wiu+3u8QpBv
 coIlb48AZVvFONxMYoyxx+uaCAU9CAc2wLFZ0jYaGlt2RyhCWEXAqJ+jt67chXhgHgCg
 RL2vIlALj1nyKdJBDvQe/uuPyTDXtxKnQ/kKAp1OX/1KDWzPfCAX7i9g3Myo3Q9woRHT
 RgqU6g5hST9IZWJ4C6SzdWoPzrjkhcRmB5IkmsD+KdQ2NRkAFE/rS6/m+v1O4uJbk+dh
 JrNJeo84iNhuXBOAVfZYWzJD1d8YU0IYDv8OHWLYx8HmkubP3NKIwg6xNZWaQTPHCbBK
 t1Eg==
X-Gm-Message-State: APjAAAUO8XyL+co4+iQ0N4xVk7dHenDLeuJfnN03fzP9FgCioquv2Qvc
 LzFtZHmijlJLSXX/TM/EMB7xGw==
X-Google-Smtp-Source: APXvYqxiuy6Py0Q5jzlpt7uYzU5B7HYSxIB1lnaCN0G0+kt5/J1oUyOyFtRJvmBLfiSE5JdJs4h2WA==
X-Received: by 2002:a1c:a1c1:: with SMTP id k184mr5128572wme.129.1580118464074; 
 Mon, 27 Jan 2020 01:47:44 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x10sm19636740wrv.60.2020.01.27.01.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 01:47:43 -0800 (PST)
Date: Mon, 27 Jan 2020 10:47:41 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <20200127094741.GA43062@phenom.ffwll.local>
References: <20200123092123.28368-1-tzimmermann@suse.de>
 <20200123092123.28368-16-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200123092123.28368-16-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Subject: Re: [Xen-devel] [PATCH v4 15/15] drm/xen: Explicitly disable
 automatic sending of vblank event
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

T24gVGh1LCBKYW4gMjMsIDIwMjAgYXQgMTA6MjE6MjNBTSArMDEwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gVGhlIGF0b21pYyBoZWxwZXJzIGF1dG9tYXRpY2FsbHkgc2VuZCBvdXQgZmFr
ZSBWQkxBTksgZXZlbnRzIGlmIG5vCj4gdmJsYW5raW5nIGhhcyBiZWVuIGluaXRpYWxpemVkLiBU
aGlzIHdvdWxkIGFwcGx5IHRvIHhlbiwgYnV0IHhlbiBoYXMKPiBpdHMgb3duIHZibGFuayBsb2dp
Yy4gVG8gYXZvaWQgaW50ZXJmZXJpbmcgd2l0aCB0aGUgYXRvbWljIGhlbHBlcnMsCj4gZGlzYWJs
ZSBhdXRvbWF0aWMgdmJsYW5rIGV2ZW50cyBleHBsaWN0bHkuCj4gCj4gdjQ6Cj4gCSogc2VwYXJh
dGUgY29tbWl0IGZyb20gY29yZSB2YmxhbmsgY2hhbmdlcwo+IAo+IFNpZ25lZC1vZmYtYnk6IFRo
b21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+IEFja2VkLWJ5OiBHZXJkIEhv
ZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KCk9uIGFsbCB0aGUgZHJpdmVyIHBhdGNoZXM6CgpS
ZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KCj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMuYyB8IDEzICsrKysrKysr
KysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2ttcy5jIGIvZHJpdmVycy9ncHUv
ZHJtL3hlbi94ZW5fZHJtX2Zyb250X2ttcy5jCj4gaW5kZXggNGYzNGM1MjA4MTgwLi5lZmRlNDU2
MTgzNmYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2tt
cy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2ttcy5jCj4gQEAg
LTIyMCw2ICsyMjAsMTggQEAgc3RhdGljIGJvb2wgZGlzcGxheV9zZW5kX3BhZ2VfZmxpcChzdHJ1
Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUsCj4gIAlyZXR1cm4gZmFsc2U7Cj4gIH0K
PiAgCj4gK3N0YXRpYyBpbnQgZGlzcGxheV9jaGVjayhzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5
X3BpcGUgKnBpcGUsCj4gKwkJCSBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZSwK
PiArCQkJIHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSkKPiArewo+ICsJLyogTWFr
ZSBzdXJlIHRoYXQgRFJNIGhlbHBlcnMgZG9uJ3Qgc2VuZCBWQkxBTksgZXZlbnRzCj4gKwkgKiBh
dXRvbWF0aWNhbGx5LiBYZW4gaGFzIGl0J3Mgb3duIGxvZ2ljIHRvIGRvIHNvLgo+ICsJICovCj4g
KwljcnRjX3N0YXRlLT5ub192YmxhbmsgPSBmYWxzZTsKClNvIHRoaXMgaGVyZSBpcyBzdHJpY3Rs
eSBzcGVha2luZyBkZWFkIGNvZGUsIGJlY2F1c2UgdGhlIGZha2VfdmJsYW5rCmhlbHBlciBtYWtl
cyBzdXJlIHRvIG9ubHkgc2VuZCBvdXQgdGhlIGV2ZW50IGlmIGl0IGhhc24ndCBiZWVuIHByb2Nl
c3NlZAp5ZXQuCgpXaGljaCBpcyBhIGJpdCBhd2t3YXJkLCBzaW5jZSBpdCBkb2VzIHRoaXMgc2ls
ZW50bHksIHBvdGVudGlhbGx5IGhpZGluZwpidWdzLiBXZSBhbHJlYWR5IGhhdmUgYSB3YXJuaW5n
IHRoYXQgY29tcGxhaW5zIGlmIGEgY3J0Y19zdGF0ZS0+ZXZlbnQKaGFzbid0IGJlZW4gcHJvY2Vz
c2VkIGF0IGFsbC4gQnV0IHdpdGggdGhlIGF1dG8tdmJsYW5rIHN0dWZmIGhlcmUgd2Uga2luZGEK
ZGVmZWF0IHRoYXQgYSBiaXQgLi4uIEkgdGhpbmsgYWRkaW5nIGEgV0FSTl9PTiBpbiBmYWtlX3Zi
bGFuayB0aGF0IGZpcmVzCmlmIG5vX3ZibGFuayBpcyBzZXQsIGJ1dCB0aGUgZXZlbnQgaXMgc29t
ZWhvdyBnb25lLCB3b3VsZCBiZSByZWFsbHkKdXNlZnVsLiBUaGF0IHdvdWxkIHBvaW50IGF0IHNv
bWUgc2VyaW91cyBkcml2ZXIgc25hZnUgLi4uCgpDYXJlIHRvIHRocm93IHRoYXQgb24gdG9wPwot
RGFuaWVsCgo+ICsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+ICBzdGF0aWMgdm9pZCBkaXNwbGF5
X3VwZGF0ZShzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUsCj4gIAkJCSAgIHN0
cnVjdCBkcm1fcGxhbmVfc3RhdGUgKm9sZF9wbGFuZV9zdGF0ZSkKPiAgewo+IEBAIC0yODQsNiAr
Mjk2LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZV9mdW5j
cyBkaXNwbGF5X2Z1bmNzID0gewo+ICAJLmVuYWJsZSA9IGRpc3BsYXlfZW5hYmxlLAo+ICAJLmRp
c2FibGUgPSBkaXNwbGF5X2Rpc2FibGUsCj4gIAkucHJlcGFyZV9mYiA9IGRybV9nZW1fZmJfc2lt
cGxlX2Rpc3BsYXlfcGlwZV9wcmVwYXJlX2ZiLAo+ICsJLmNoZWNrID0gZGlzcGxheV9jaGVjaywK
PiAgCS51cGRhdGUgPSBkaXNwbGF5X3VwZGF0ZSwKPiAgfTsKPiAgCj4gLS0gCj4gMi4yNC4xCj4g
CgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24K
aHR0cDovL2Jsb2cuZmZ3bGwuY2gKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
