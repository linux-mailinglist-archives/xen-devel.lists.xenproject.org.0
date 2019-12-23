Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A73712973F
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2019 15:23:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijOZb-00021K-72; Mon, 23 Dec 2019 14:20:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5EXw=2N=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ijOZa-00021F-0n
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2019 14:20:38 +0000
X-Inumbo-ID: 639c41e6-258f-11ea-88e7-bc764e2007e4
Received: from mail-pf1-x442.google.com (unknown [2607:f8b0:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 639c41e6-258f-11ea-88e7-bc764e2007e4;
 Mon, 23 Dec 2019 14:20:37 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id z16so9283112pfk.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Dec 2019 06:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+C/Bdfa1b0Vg7CxipuIyJpVp/fGC0qRFneFTSfrAEWY=;
 b=SgdtOIeIxSmMcMvSqQ8AK1TKi22tY6teIcRfegOwJIyNzRQ/8tQADWUeg1oUTIt+qH
 ufjjvj2Yrlrku/S6XJMzUxzWy73NxYRXbLqD2/lTOu9dUbCsgBINEDuhOaqvLnj+ZzTF
 4gJFeOryvCyFFGWGtzPFyT7JffyH2pEb3D8yXdbyOZIBDqWKxgP0sRrfNRQBcPd9knYT
 cGGSy/4UlIwy/jcZgrIOWQOMMupiuSXXhI8J/vWhpZ1Zd9wICzg8gU/CYa+OnYAhbKbL
 E9YcvtrJ4wIsCvYfp1ChfjYqz9AvODrXLOqMrgtrec2mOYl6IAybdsoaNcPbl6TZbgVg
 hxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+C/Bdfa1b0Vg7CxipuIyJpVp/fGC0qRFneFTSfrAEWY=;
 b=FPPR3HN0EsSP3dDipearLS/VPFkRZJ3PwQwAYj5svNqKwUWdpGsykoV+UuYpiQHIl8
 uJNaKPqBDUthGqLeKmUxtp5uicSbK4wgeFQlBFZITfqtJsx1hvpaLWR19JmHmQm8DQbE
 i66LDEH7mMLc+YEAJV5RtPz+j5ncd6xzb8AblJPxrErssXieF9w/d2oHourdrZoBWwIs
 WiKdRDFHBOkt4FORa2Z5qhzOHlDMEV9pFf0ntjfkYP58j2WkDUQMUP+523/scS6ulg/X
 G/ohOCKE5yuuw8GZfcIVyWtSh1OA0WWZ5CuveIBKh7mxby9FUs2nAfdxqlYhkn6Qp9BR
 BknQ==
X-Gm-Message-State: APjAAAXL+m5NKn4Hn7CcBbQSpxd/VA1sWYFDK5j/7I4CdXi3c9Zo7mmC
 MMuuC9A8e1l8adqAlYVnEQyT8PEbrTjtU1aAbMI=
X-Google-Smtp-Source: APXvYqwhtep5KRIT7v/v67y33P0pCcJeQMPf6/1zGu1iBg5wpCK+9RPg+VytOQZChkL1clOZdaajJgXa7CXcwHExn28=
X-Received: by 2002:aa7:86d4:: with SMTP id h20mr28998107pfo.232.1577110836602; 
 Mon, 23 Dec 2019 06:20:36 -0800 (PST)
MIME-Version: 1.0
References: <20191223110330.26883-1-liuwe@microsoft.com>
In-Reply-To: <20191223110330.26883-1-liuwe@microsoft.com>
From: Paul Durrant <pdurrant@gmail.com>
Date: Mon, 23 Dec 2019 14:20:25 +0000
Message-ID: <CACCGGhC=jksVoR8cy5XwYx=uSEq6Me4pz_JWaM-Ze5XaFhFidg@mail.gmail.com>
To: Wei Liu <wl@xen.org>
Subject: Re: [Xen-devel] [PATCH v2] x86/hyperv: change hv_tlb_flush_ex to
 fix clang build
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMyBEZWMgMjAxOSBhdCAxMTowMywgV2VpIExpdSA8d2xAeGVuLm9yZz4gd3JvdGU6
Cj4KPiBDbGFuZyBjb21wbGFpbnM6Cj4KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gc3luaWMuYzox
NToKPiAvYnVpbGRzL3hlbi1wcm9qZWN0L3hlbi94ZW4vaW5jbHVkZS9hc20vZ3Vlc3QvaHlwZXJ2
LXRsZnMuaDo5MDA6MTg6IGVycm9yOiBmaWVsZCAnaHZfdnBfc2V0JyB3aXRoIHZhcmlhYmxlIHNp
emVkIHR5cGUgJ3N0cnVjdCBodl92cHNldCcgbm90IGF0IHRoZSBlbmQgb2YgYSBzdHJ1Y3Qgb3Ig
Y2xhc3MgaXMgYSBHTlUgZXh0ZW5zaW9uIFstV2Vycm9yLC1XZ251LXZhcmlhYmxlLXNpemVkLXR5
cGUtbm90LWF0LWVuZF0KPiAgICAgICAgIHN0cnVjdCBodl92cHNldCBodl92cF9zZXQ7Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgXgo+IDEgZXJyb3IgZ2VuZXJhdGVkLgo+IC9idWlsZHMveGVu
LXByb2plY3QveGVuL3hlbi9SdWxlcy5tazoxOTg6IHJlY2lwZSBmb3IgdGFyZ2V0ICdzeW5pYy5v
JyBmYWlsZWQKPiBtYWtlWzZdOiAqKiogW3N5bmljLm9dIEVycm9yIDEKPgo+IENvbW1lbnQgb3V0
IHRoZSBsYXN0IHZhcmlhYmxlIHNpemUgYXJyYXkgZnJvbSBodl90bGJfZmx1c2hfZXggdG8gZml4
Cj4gY2xhbmcgYnVpbGRzLgo+Cj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9z
b2Z0LmNvbT4KPiBDYzogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+CgpSZXZpZXdlZC1ieTog
UGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+Cgo+IC0tLQo+ICB4ZW4vaW5jbHVkZS9hc20teDg2
L2d1ZXN0L2h5cGVydi10bGZzLmggfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20t
eDg2L2d1ZXN0L2h5cGVydi10bGZzLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVy
di10bGZzLmgKPiBpbmRleCBmZTlmYjIzMmQwLi41YjQzZjk5ZGU4IDEwMDY0NAo+IC0tLSBhL3hl
bi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LXRsZnMuaAo+ICsrKyBiL3hlbi9pbmNsdWRl
L2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LXRsZnMuaAo+IEBAIC05MDgsMTIgKzkwOCwxMiBAQCBzdHJ1
Y3QgaHZfdGxiX2ZsdXNoIHsKPiAgICAgICAgIHU2NCBndmFfbGlzdFtdOwo+ICB9IF9fcGFja2Vk
Owo+Cj4gLS8qIEh2Rmx1c2hWaXJ0dWFsQWRkcmVzc1NwYWNlRXgsIEh2Rmx1c2hWaXJ0dWFsQWRk
cmVzc0xpc3RFeCBoeXBlcmNhbGxzICovCj4gKy8qIEh2Rmx1c2hWaXJ0dWFsQWRkcmVzc1NwYWNl
RXggaHlwZXJjYWxsICovCj4gIHN0cnVjdCBodl90bGJfZmx1c2hfZXggewo+ICAgICAgICAgdTY0
IGFkZHJlc3Nfc3BhY2U7Cj4gICAgICAgICB1NjQgZmxhZ3M7Cj4gICAgICAgICBzdHJ1Y3QgaHZf
dnBzZXQgaHZfdnBfc2V0Owo+IC0gICAgICAgdTY0IGd2YV9saXN0W107Cj4gKyAgICAgICAvKiB1
NjQgZ3ZhX2xpc3RbXTsgKi8KPiAgfSBfX3BhY2tlZDsKPgo+ICBzdHJ1Y3QgaHZfcGFydGl0aW9u
X2Fzc2lzdF9wZyB7Cj4gLS0KPiAyLjIwLjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
