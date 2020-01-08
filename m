Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF447133E64
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 10:38:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ip7l2-0002Oj-GS; Wed, 08 Jan 2020 09:36:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/T+N=25=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ip7l1-0002Ob-74
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 09:36:07 +0000
X-Inumbo-ID: 4af5386a-31fa-11ea-ad6c-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4af5386a-31fa-11ea-ad6c-12813bfff9fa;
 Wed, 08 Jan 2020 09:36:06 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c9so2568587wrw.8
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2020 01:36:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iH7WYuCoPvIczMQ/qvLituZ93Fiedt+NPRJvkV4gvFg=;
 b=GSP5FanQkr9GnBkpGPAHWTyHjeloRawfNGUCqUrZpgn9/cy17QbOObKX30jkwSe7Vu
 oUspyfiprkm3DDz8vSN29zcuvjnITmx0KFDGisLNtBJbGy+Hbo68YHLnE7OLMpFmVRFC
 RFy1IZCLKTqQSPKA2gYRa3xekLjQQ4l52nTlRr2FNpzN6Z6I4EOu/NLE9z4YQ14KNV+B
 ljlsxqyKMj9P9NvQnXaP/iKmP7AxFJ6vQX/fFe25wyHZWHzJPtDBOU9ftCMi1nSXHOct
 I/J4gsZeBwJ608giyVdc7FmAKMxQk61+Urif8WMf/XvHsg0m/H2KaUVafevyT5RJc/fc
 FUIQ==
X-Gm-Message-State: APjAAAU29FvHjD4wTXuim+AmeXbXnUVVYmJhoFceF1e1xdLxA6G2heo3
 wx4Jfv2SGk1aOS+sLziHJAw=
X-Google-Smtp-Source: APXvYqwIrHeyzBbCRaLkE8UrT7/I2ZYZvizMqLY+75AkrZrmUsRScy2Y9LQ8zIn7sjHOGykt4x+xcw==
X-Received: by 2002:adf:82a7:: with SMTP id 36mr3587499wrc.203.1578476165239; 
 Wed, 08 Jan 2020 01:36:05 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id x11sm3702271wre.68.2020.01.08.01.36.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2020 01:36:04 -0800 (PST)
From: Julien Grall <julien@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191217201550.15864-1-andrew.cooper3@citrix.com>
 <20191217201550.15864-5-andrew.cooper3@citrix.com>
 <ccafa7fc-5cd2-2d3f-a62f-0185ff8ca5e1@xen.org>
 <4fbaff27-eb58-481e-77d0-c6d948004ab0@citrix.com>
 <6039608a-d1e6-d164-7291-e0af5e65c30c@xen.org>
Message-ID: <63969cff-3c3c-6410-ed91-52521830ccca@xen.org>
Date: Wed, 8 Jan 2020 09:36:02 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <6039608a-d1e6-d164-7291-e0af5e65c30c@xen.org>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 4/4] tools/dombuilder: Don't allocate
 dom->p2m_host[] for translated domains
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>, Varad Gautam <vrd@amazon.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwMy8wMS8yMDIwIDEwOjQ0LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgQW5kcmV3
LAo+IAo+IE9uIDAyLzAxLzIwMjAgMTc6NDksIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9uIDIz
LzEyLzIwMTkgMTg6MjMsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+IEhpLAo+Pj4KPj4+IE9uIDE3
LzEyLzIwMTkgMjE6MTUsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4geGNfZG9tX3AybSgpIGFu
ZCBkb20tPnAybV9ob3N0W10gaW1wbGVtZW50IGEgbGluZWFyIHRyYW5zZm9ybSBmb3IKPj4+PiB0
cmFuc2xhdGVkCj4+Pj4gZG9tYWlucywgYnV0IHdhc3RlIGEgc3Vic3RhbnRpYWwgY2h1bmsgb2Yg
UkFNIGRvaW5nIHNvLgo+Pj4+Cj4+Pj4gQVJNIGxpdGVyYWxseSBuZXZlciByZWFkcyBkb20tPnAy
bV9ob3N0W10gKGJlY2F1c2Ugb2YgdGhlCj4+Pj4geGNfZG9tX3RyYW5zbGF0ZWQoKQo+Pj4+IHNo
b3J0IGNpcmN1aXQgaW4geGNfZG9tX3AybSgpKS7CoCBEcm9wIGl0IGFsbC4KPj4+Pgo+Pj4+IHg4
NiBIVk0gZG9lcyB1c2UgZG9tLT5wMm1faG9zdFtdIGZvcgo+Pj4+IHhjX2RvbWFpbl9wb3B1bGF0
ZV9waHlzbWFwX2V4YWN0KCkgY2FsbHMKPj4+PiB3aGVuIHBvcHVsYXRpbmcgNGsgcGFnZXMuwqAg
UmV1c2UgdGhlIHNhbWUgdGFjdGljIGZyb20gMk0vMUcgcmFuZ2VzCj4+Pj4gYW5kIHVzZSBhbgo+
Pj4+IG9uLXN0YWNrIGFycmF5IGluc3RlYWQuwqAgRHJvcCB0aGUgbWVtb3J5IGFsbG9jYXRpb24u
Cj4+Pj4KPj4+PiB4ODYgUFYgZ3Vlc3RzIGRvIHVzZSBkb20tPnAybV9ob3N0W10gYXMgYSBub24t
aWRlbnRpdHkgdHJhbnNmb3JtLgo+Pj4+IFJlbmFtZSB0aGUKPj4+PiBmaWVsZCB0byBwdl9wMm0g
dG8gbWFrZSBpdCBjbGVhciBpdCBpcyBQVi1vbmx5Lgo+Pj4KPj4+IE5pY2UgY2xlYW51cCEgVGhp
cyB3aWxsIHByb2JhYmx5IG1ha2Ugc2xpZ2h0bHkgZmFzdGVyIGd1ZXN0IGJvb3QgOikuCj4+Pgo+
Pj4+IEBAIC0zNTksNyArMzU2LDYgQEAgc3RhdGljIGludCBwb3B1bGF0ZV9ndWVzdF9tZW1vcnko
c3RydWN0Cj4+Pj4geGNfZG9tX2ltYWdlICpkb20sCj4+Pj4gwqDCoCBzdGF0aWMgaW50IG1lbWlu
aXQoc3RydWN0IHhjX2RvbV9pbWFnZSAqZG9tKQo+Pj4+IMKgwqAgewo+Pj4+IMKgwqDCoMKgwqDC
oCBpbnQgaSwgcmM7Cj4+Pj4gLcKgwqDCoCB4ZW5fcGZuX3QgcGZuOwo+Pj4+IMKgwqDCoMKgwqDC
oCB1aW50NjRfdCBtb2RiYXNlOwo+Pj4+IMKgwqAgwqDCoMKgwqDCoCB1aW50NjRfdCByYW1zaXpl
ID0gKHVpbnQ2NF90KWRvbS0+dG90YWxfcGFnZXMgPDwgCj4+Pj4gWENfUEFHRV9TSElGVDsKPj4+
PiBAQCAtNDIzLDExICs0MTksNiBAQCBzdGF0aWMgaW50IG1lbWluaXQoc3RydWN0IHhjX2RvbV9p
bWFnZSAqZG9tKQo+Pj4+IMKgwqDCoMKgwqDCoCBhc3NlcnQocmFtc2l6ZSA9PSAwKTsgLyogVG9v
IG11Y2ggUkFNIGlzIHJlamVjdGVkIGFib3ZlICovCj4+Pj4gwqDCoCDCoMKgwqDCoMKgIGRvbS0+
cDJtX3NpemUgPSBwMm1fc2l6ZTsKPj4+Cj4+PiBEbyB3ZSBuZWVkIHRvIGtlZXAgcDJtX3NpemU/
Cj4+Cj4+IFllcywgSSB0aGluayBzby4KPj4KPj4gVGhlcmUgYXJlIHNvbWUgY29tbW9uIGNoZWNr
cyB3aGljaCB3b3VsZCBmYWlsIGlmIGl0IGJlY29tZXMgMCwgYW5kCj4+IGltcG9ydGFudGx5LCBp
dCBpcyB1c2VkIHRvIGxvY2F0ZSBzYWZlIGdmbnMgZm9yIHRlbXBvcmFyeSBwaHlzbWFwIAo+PiBt
YXBwaW5ncy4KPiAKPiBEbyB5b3UgbWVhbiB0aGUgc2NyYXRjaCBwYWdlPyBJZiBzbywgb24gQXJt
IHdlIHVzZSBhIGZpeCBhZGRyZXNzIGluIHRoZSAKPiBtZW1vcnkgbWFwIHJhdGhlciB0aGFuIHAy
bV9zaXplLgo+IAo+IEkgaGF2ZSBsb29rZWQgYXQgdGhlIHVzYWdlIG9mIHRoZSBwMm1fc2l6ZSBp
biB0aGUgY29tbW9uIGNvZGUgYW5kIEkgCj4gZGlkbid0IHNwb3QgYW55IHBhdGggdGhhdCBjYW4g
YmUgdXNlZCBieSBBcm0gYW5kIHVzaW5nIHAybV9zaXplLgo+IAo+IEFsc28sIEkgZG9uJ3QgdGhp
bmsgcDJtX3NpemUgaXMgY2FsY3VsYXRlZCBjb3JyZWN0bHkgb24gQXJtLiBJdCBvbmx5IAo+IGVu
Z2xvYmUgdGhlIFJBTSBhbmQgZG9lc24ndCB0YWtlIGludG8gYWNjb3VudCB0aGUgcmVzdCBvZiB0
aGUgbWFwcGluZ3MgCj4gKGUuZyBNTUlPLi4uKS4gU28gSSBhbSBub3Qgc3VyZSBob3cgdGhpcyBj
b3VsZCBiZSB1c2VkIGluIGNvbW1vbiBjb2RlLgoKVGhpbmtpbmcgYSBiaXQgbW9yZSBvZiB0aGlz
LiBBcyB0aGUgcDJtX3NpemUgd2FzIElITU8gYWxyZWFkeSBidWdneSwgaXQgCnNob3VsZCBub3Qg
bWFrZSBhbnkgZGlmZmVyZW5jZSBhZnRlciB0aGlzIHNlcmllcy4gVGhlcmVmb3JlIHJlbW92aW5n
IApwMm1fc2l6ZSBjYW4gYmUgcHJvYmFibHkgZG9uZSBvbiBhIGZvbGxvdy11cCBwYXRjaC4KClNv
IEkgYW0gaGFwcHkgd2l0aCB0aGUgcGF0Y2ggYXMtaXM6CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxs
IDxqdWxpZW5AeGVuLm9yZz4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
