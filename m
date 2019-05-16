Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E594206D0
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 14:23:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRFNp-0008Pj-MO; Thu, 16 May 2019 12:21:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BGuO=TQ=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hRFNn-0008Pd-PM
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 12:21:11 +0000
X-Inumbo-ID: 16d2186d-77d5-11e9-8980-bc764e045a96
Received: from mail-it1-x142.google.com (unknown [2607:f8b0:4864:20::142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 16d2186d-77d5-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 12:21:10 +0000 (UTC)
Received: by mail-it1-x142.google.com with SMTP id e184so5865855ite.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2019 05:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qGxyd/nE0/VvhT+qFI3F4O5aqdmk2AkSn2qE7fU8J5w=;
 b=WZdGdfpB/ziZg1BfUyjWblXiaX2IIK7LufvSLZNCtO+/LGfro6eUpnvNUMPH+X4jHY
 H9cvaJY9aJMcSb7Pci08zzuGIxr7jKahsVTekWvQMUb9rJJDRQNP+A+ZU3NatGKCsOKC
 L9JNa12Voe0yz9M5+JFDfH/JruA+eBQSoCiXiALRIRVHCw4o16c6Nhy9fzA8hb/sIoy2
 8UTIlxPI45qb00oiG6kfT3C44rZcbM4rB3ZdCS8GKu7+rNupgRpEad9D7oQB2lILSzPi
 7fpr3OtFX0CXZ6G3HwGXFRj3KvGvJnYnrNnRBmoNwUTG7BnRMdxmVzQAX11BB8fyU3aO
 Oi3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qGxyd/nE0/VvhT+qFI3F4O5aqdmk2AkSn2qE7fU8J5w=;
 b=b/7rnAlOX+89c2VO8YMmKi9axl8hYFrdKHpyXSNGrxIFAsZaqyj9zDmUSjGmpDGwcj
 qPO6S7sDmADFHthLxy1j3XHopZziLeyZVo9H2UVdl+8Z5VnApMvJDOboh8EXC4Izu9GU
 WpoDSQQfXNwwlmtvkB6LXaI06vuZe1tKdfH/Ac6GUNWaFqbnmruCjKrrPTCFr165UcVY
 9CRpqweID+0u7RwM6CiCk0mDBhv+hL5kxdik1tM+QRKGr99KyV2oVcUPWSVyhyZ22uyO
 b4m8S/PpOOHGzCwiqrB6L8muPE9h6KiOfwaTzZEscf8NHBANZTzYFpJtK4jqIYRyWDkh
 wneQ==
X-Gm-Message-State: APjAAAWxafgdGiVTmoOFwJ2v5NY7gjy+kId8phjReovcHpH63t2xY3I2
 MTB0UoaWXPwWuZRHOXHEWX4eEsXHvUKJp7k+F7E=
X-Google-Smtp-Source: APXvYqwHEv2Ja9mgE532zu3CHn0um/ETaQTuNfVBjHm1o5+jAYvDrAyD0/EGiLDz+a3/iU+FJ7hXqMmassGOclL2H/I=
X-Received: by 2002:a24:3943:: with SMTP id l64mr12239360ita.92.1558009270240; 
 Thu, 16 May 2019 05:21:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190516111354.15195-1-viktor.mitin.19@gmail.com>
 <20190516112638.GX2798@zion.uk.xensource.com>
 <611b22f7-8125-15e0-6154-93638c2a14ad@arm.com>
 <20190516113958.GA2798@zion.uk.xensource.com>
In-Reply-To: <20190516113958.GA2798@zion.uk.xensource.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Thu, 16 May 2019 15:20:59 +0300
Message-ID: <CAOcoXZYrgKthNokf61ZWNQDeav_LpTQjz-XA-uzXSDowPQL8=w@mail.gmail.com>
To: Wei Liu <wei.liu2@citrix.com>, Julien Grall <Julien.Grall@arm.com>,
 nd <nd@arm.com>
Subject: Re: [Xen-devel] [PATCH] coverage: GCC coverage libfdt Makefile fix
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQWxsLAoKVGhhbmsgeW91IGZvciByZXBsaWVzLiBXaWxsIGRvIGFsbCB0aGUgbWVudGlvbmVk
IHVwZGF0ZXMgYW5kIHdpbGwgc2VuZApwYXRjaCB2MiBhZnRlciByZXRlc3RpbmcgaXQgb24gdGFy
Z2V0IGJvYXJkICh3aXRoIGxpYmVsZiBNYWtlZmlsZQp1cGRhdGUpLgoKVGhhbmtzCgpPbiBUaHUs
IE1heSAxNiwgMjAxOSBhdCAyOjQwIFBNIFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+Cj4gT24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMTE6Mzc6MzNBTSArMDAwMCwgSnVsaWVu
IEdyYWxsIHdyb3RlOgo+ID4KPiA+Cj4gPiBPbiAxNi8wNS8yMDE5IDEyOjI2LCBXZWkgTGl1IHdy
b3RlOgo+ID4gPiBPbiBUaHUsIE1heSAxNiwgMjAxOSBhdCAwMjoxMzo1NFBNICswMzAwLCBWaWt0
b3IgTWl0aW4gd3JvdGU6Cj4gPiA+PiBUaGUgcGF0Y2ggcmVzb2x2ZXMgJ3hlbmNvdicgY3Jhc2hl
cyBpbiBjYXNlIG9mIEFhcmNoNjQuCj4gPiA+Pgo+ID4gPj4gQWxsIHRoZSAuaW5pdC4qIHNlY3Rp
b25zIGFyZSBzdHJpcHBlZCBhZnRlciBib290LAo+ID4gPj4gaXQgbWVhbnMgdGhhdCBhbnl0aGlu
ZyBpbiAuaW5pdC5kYXRhIGNhbm5vdCBiZSBhY2Nlc3NlZCBhbnltb3JlLgo+ID4gPj4gVGhlIGJ1
aWxkIHN5c3RlbSBleHBsaWNpdGx5IGNvbXBpbGVzIGFueSAuaW5pdCBiaW5hcnkgd2l0aG91dCBn
Y292IG9wdGlvbi4KPiA+ID4+IFRoZSBwcm9ibGVtIGlzIGNvbWluZyBmcm9tIGxpYmZkdC4KPiA+
ID4+IFRoZSBlbnRpcmUgbGlicmFyeSBpcyBtb3ZlZCB0byAuaW5pdCB1c2luZzoKPiA+ID4+ICQo
T0JKQ09QWSkgJChmb3JlYWNoIHMsJChTRUNUSU9OUyksLS1yZW5hbWUtc2VjdGlvbiAuJChzKT0u
aW5pdC4kKHMpKSAkPCAkQAo+ID4gPj4gU28gd2UgbmVlZCB0byB0ZWxsIHRoZSB0b3AgTWFrZWZp
bGUgdG8gZmlsdGVyIG91dCBsaWJmZHQuCj4gPiA+Pgo+ID4gPj4gUmVwb3J0ZWQtYnk6IFZpa3Rv
ciBNaXRpbiA8dmlrdG9yLm1pdGluLjE5QGdtYWlsLmNvbT4KPiA+ID4+IFNpZ25lZC1vZmYtYnk6
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gPiA+PiBUZXN0ZWQtYnk6IFZp
a3RvciBNaXRpbiA8dmlrdG9yLm1pdGluLjE5QGdtYWlsLmNvbT4KPiA+ID4KPiA+ID4gUmV2aWV3
ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gPiA+Cj4gPiA+IEFsdGhvdWdo
IEkgd291bGQgbGlrZSB0byBhc2sgeW91IHRvIGFkanVzdCB0aGUgc3ViamVjdCB0byBiZSBtb3Jl
Cj4gPiA+IHNwZWNpZmljOgo+ID4gPgo+ID4gPiAgICBjb3ZlcmFnZTogZmlsdGVyIG91dCBsaWJm
ZHQubwo+ID4gPgo+ID4gPiBpZiB5b3UgYWdyZWUsIHRoaXMgY2FuIGJlIGRvbmUgd2hpbGUgY29t
bWl0dGluZy4KPiA+Cj4gPiBUaGVyZSBhcmUgbW9yZSB0aGFuIHRoYXQgdGhlIHRpdGxlIHRvIGZp
eCBvbiBjb21taXQuIFRoZSBTaWduZWQtb2ZmLWJ5Cj4gPiBhbmQgZG9lcyBub3QgbWF0Y2ggdGhl
IEZyb20gZm9yIGluc3RhbmNlLgo+ID4KPiA+IEkgaW5pdGlhbGx5IHN1Z2dlc3RlZCB0aGUgY2hh
bmdlLCBzbyBTdWdnZXN0ZWQtYnkgd291bGQgYmUgbW9yZQo+ID4gc3VpdGFibGUuIEFuZCB0aGVu
IFZpa3RvciBuZWVkcyB0byBhZGQgaGlzIHNpZ25lZC1vZmYtYnkuCj4gPgo+ID4gQWxzbywgY291
bGQgd2UgYWxzbyBmaXggbGliZWxmIGF0IHRoZSBzYW1lIHRpbWU/Cj4KPiArMS4gVmlrdG9yPwo+
Cj4gV2VpLgo+Cj4gPgo+ID4gQ2hlZXJzLAo+ID4KPiA+IC0tCj4gPiBKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
