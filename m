Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDD475C6E
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 03:16:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqonq-0007Ar-RD; Fri, 26 Jul 2019 01:13:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RaF+=VX=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1hqonp-0007Am-B5
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 01:13:45 +0000
X-Inumbo-ID: 9cb6f6cb-af42-11e9-8980-bc764e045a96
Received: from mail-qk1-x735.google.com (unknown [2607:f8b0:4864:20::735])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9cb6f6cb-af42-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 01:13:44 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id m14so12246603qka.10
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jul 2019 18:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=crM7NDIG5gdUUupIeoE6MRwgLiB7XVMY4kKIMmVsxeM=;
 b=Z6iKPIWer5EvXXlMLsHe7YTYXFdpzztYdcocXZfWiYbWpXjwy12b5bmTqnLuk0wedU
 UzI25G7i8zp5V4j9Pgfo6WHyXtZo6D5lSkUHziz4Vx5U1qX/tUDLFFndzxjj9Cg6Qp4V
 j7iYN9TGvUzxeWqNqSyrX5eFY5ETUp2BkabMxARN0Uvxc2KRkyhUuv44B0CNWCQuhMB2
 X9mpsQoKGyPpIgPsVb7TA1URdrBpfHGntUEOcDg1YGfBDXi44IS7wGKvoRqwn2TkKGoU
 71eyjzuk+liw0ejUvXMbm27iUv1lSBejTTLXvVJNQI0zUWZRrSha6RtLR75wKXC4+TSz
 OWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=crM7NDIG5gdUUupIeoE6MRwgLiB7XVMY4kKIMmVsxeM=;
 b=KNL8ELkPRc87DoWCVsPon0IXQnwkt1AItqPlmZPARvnC77fEou+k/t4//HqhF6ovXl
 RbdZXGDHBWrQOihyvSooDwe46iF6SIFUQpO0S1EvprGhZ1kU0yxsWdT8xTalqKXTq8h+
 GHMqsewm+HLu8H84xvkJ1lxe+KLDuN7dBw8Y1/MyOADP2ks4a+WOPLlKcxpqP1O7CJmT
 bguEJghIOqO3SXPFC5AAn+IQVSfjW9L/58E6sv/kbVD0BkMnnMJDG1kLlpwMdmF/kxFo
 Jmm7CGs5aa1HmSkKBsdXudSkJZXXo3+NENhUIw/SfUk7Wjfd4KoTI+ZyPeFwiq3z+t6m
 ktpA==
X-Gm-Message-State: APjAAAX1urzW1nbYpZ7MfPI0tbdOuSoHnFmZDc8cYKyWArxjPGYfd8MH
 Su2PbFy2e9sSjAqJ1oRU2Iqq16R2zWI7UHMlgQCyXA==
X-Google-Smtp-Source: APXvYqzS0kLyuMZHP+jzyeHeSa8EZSSk//GawIyYoWAB3kN0oNfEarzCzifNsoIoIAa5vRrllfgq8hjnvig5hx86QUY=
X-Received: by 2002:a05:620a:247:: with SMTP id
 q7mr64452293qkn.265.1564103624002; 
 Thu, 25 Jul 2019 18:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy9g-QFHTXhpHK6=xDFiBDj4LpnJ=cXj405MMmA1rJaOUg@mail.gmail.com>
 <56D3EEF5-A08A-4894-B21F-9FDA1717B566@gmail.com>
In-Reply-To: <56D3EEF5-A08A-4894-B21F-9FDA1717B566@gmail.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Thu, 25 Jul 2019 18:13:32 -0700
Message-ID: <CAMmSBy_-EMjA5-MtDsE-ckrXJvmp8VT_=c-beYZt14+OzwxtDQ@mail.gmail.com>
To: Rich Persaud <persaur@gmail.com>
Subject: Re: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
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
Cc: Daniel Smith <dpsmith@apertussolutions.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMTA6NDIgQU0gUmljaCBQZXJzYXVkIDxwZXJzYXVyQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBKdWwgMTksIDIwMTksIGF0IDE1OjMxLCBSb21hbiBTaGFw
b3NobmlrIDxyb21hbkB6ZWRlZGEuY29tPiB3cm90ZToKPgo+IEhpIQo+Cj4gd2UncmUgdXNpbmcg
WGVuIG9uIEFkdmFudGVjaCBBUkstMjI1MCBFbWJlZGRlZCBCb3ggUEM6Cj4gICAgaHR0cHM6Ly93
d3cuZWxtYXJrLmNvbS5wbC93ZWIvdXBsb2FkZWQva2FydHlfcHJvZHVrdG93L2FkdmFudGVjaC9h
cmstMjI1MGwvYXJrLTIyNTBsX2luc3RydWtjamEtdXp5dGtvd25pa2EucGRmCj4KPgo+IFJvbWFu
LAo+Cj4gR29vZCB0byBzZWUgWGVuIGJlaW5nIHVzZWQgb24gZmFubGVzcyBkZXZpY2VzLgoKT2gs
IHRoZXJlJ3MgV0FZIG1vcmUgb2YgdGhvc2UgaW4gRVZFIHVuZGVyIFhlbiBtYW5hZ2VtZW50IDst
KQogICAgIGh0dHBzOi8vd2lraS5sZmVkZ2Uub3JnL2Rpc3BsYXkvRVZFL0hhcmR3YXJlK1BsYXRm
b3JtcytTdXBwb3J0aW5nK0VWRQoKPiBEb2VzIHRoZSBBTUkgQklPUyBmb3IgdGhlIGk3IDY2MDBV
IFNreWxha2UgQ1BVIFsxXSB2YXJpYW50IG9mIEFSSy0yMjUwIFsyXQo+IHN1cHBvcnQgSW50ZWwg
VFhUIERSVE0gYW5kIGRpc2NyZXRlIFRQTSwgd2hpY2ggd291bGQgZW5hYmxlIGJvb3QgaW50ZWdy
aXR5IFszXSBwcm90ZWN0aW9uIGZvciBYZW4sIHJlYWQtb25seSBkb20wIGFuZCBzdGF0ZWxlc3Mg
Vk1zPwo+IEJvb3QgaW50ZWdyaXR5IGlzIHZhbHVhYmxlIG9uIGVkZ2UgZGV2aWNlcy4KCkZ1bm55
IHlvdSBzaG91bGQgbWVudGlvbiB0aGlzIC0tIHRoYXQncyBleGFjdGx5IHdoYXQgd2UncmUgcGxh
eWluZwp3aXRoIHJpZ2h0IG5vdyBpbiBMRiBFZGdlIFByb2plY3QgRVZFLiBEbyB5b3Ugd2FudCB0
byBwb3AgdXAgb24gdGhlCm1haWxpbmcgbGlzdCBvciBzbGFjayBjaGFubmVsIHRoZXJlPyAobm90
IHN1cmUgdGhpcyBpcyB0aGUgcmlnaHQgdG9waWMKZm9yIFhlbi1kZXZlbCkuCgpBbmQganVzdCBz
byB0aGF0IHdlJ3JlIG9uIHRoZSBzYW1lIHBhZ2UsIGhlcmUncyB3aGF0IHdlIGFyZSBhZnRlciB3
aGVuCml0IGNvbWVzIHRvIHJvb3Qgb2YgdHJ1c3QgaW4gRVZFIChJIHJlYWxseSBuZWVkIHRvIGRv
IGEgd3JpdGUgdXAgb24KdGhpcyBzb29uKToKICAgKiBtZWFzdXJlZCBib290ICh3ZSdyZSByZWFs
bHkgbm90IGludGVyZXN0ZWQgc2VjdXJlIGJvb3QgdGhhdCBtdWNoKQogICAqIG1lYXN1cmVkIGJv
b3Qgb2YgdGhlIERvbVVzCiAgICogcHJveHkgVFBNIHRvIHRoZSBEb21VcwoKPiBbMV0gQ1BVIHNw
ZWM6IGh0dHBzOi8vYXJrLmludGVsLmNvbS9jb250ZW50L3d3dy91cy9lbi9hcmsvcHJvZHVjdHMv
ODgxOTIvaW50ZWwtY29yZS1pNy02NjAwdS1wcm9jZXNzb3ItNG0tY2FjaGUtdXAtdG8tMy00MC1n
aHouaHRtbAo+Cj4gWzJdIFBDIHNwZWM6IGh0dHBzOi8vd3d3LmFkdmFudGVjaC5jb20vcHJvZHVj
dHMvYXJrLTIwMDBfc2VyaWVzX2VtYmVkZGVkX2JveF9wY3MvYXJrLTIyNTBsL21vZF82NmViYzRl
MC05YTBjLTQ4OWMtOTZhNS03MGE4MDU0ZTkwMzcKPgo+IFszXSBUcmVuY2hCb290LCBYZW4gU3Vt
bWl0IDIwMTksIGh0dHBzOi8veW91dHViZS5jb20vd2F0Y2g/dj1mMExaRlNxNEFjawoKVGhhbmtz
IGZvciB0aGUgbm90ZXMhIE11Y2ggYXBwcmVjaWF0ZWQhCgpUaGFua3MsClJvbWFuLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
