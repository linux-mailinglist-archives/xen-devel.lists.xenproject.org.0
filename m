Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D30FC1293D7
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2019 10:55:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijKOc-0004qW-OB; Mon, 23 Dec 2019 09:53:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zIvO=2N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ijKOa-0004qP-IX
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2019 09:53:00 +0000
X-Inumbo-ID: 00275df0-256a-11ea-96b7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00275df0-256a-11ea-96b7-12813bfff9fa;
 Mon, 23 Dec 2019 09:52:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 58969AD10;
 Mon, 23 Dec 2019 09:52:58 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20191221235049.4928-1-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <28ed98be-50ee-3b2c-2f9f-2805ee50089f@suse.com>
Date: Mon, 23 Dec 2019 10:53:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191221235049.4928-1-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/hyperv: change hv_tlb_flush_ex to fix
 clang build
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <liuwe@microsoft.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMTIuMjAxOSAwMDo1MCwgV2VpIExpdSB3cm90ZToKPiBDbGFuZyBjb21wbGFpbnM6Cj4g
Cj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIHN5bmljLmM6MTU6Cj4gL2J1aWxkcy94ZW4tcHJvamVj
dC94ZW4veGVuL2luY2x1ZGUvYXNtL2d1ZXN0L2h5cGVydi10bGZzLmg6OTAwOjE4OiBlcnJvcjog
ZmllbGQgJ2h2X3ZwX3NldCcgd2l0aCB2YXJpYWJsZSBzaXplZCB0eXBlICdzdHJ1Y3QgaHZfdnBz
ZXQnIG5vdCBhdCB0aGUgZW5kIG9mIGEgc3RydWN0IG9yIGNsYXNzIGlzIGEgR05VIGV4dGVuc2lv
biBbLVdlcnJvciwtV2dudS12YXJpYWJsZS1zaXplZC10eXBlLW5vdC1hdC1lbmRdCj4gICAgICAg
ICBzdHJ1Y3QgaHZfdnBzZXQgaHZfdnBfc2V0Owo+ICAgICAgICAgICAgICAgICAgICAgICAgIF4K
CkknbSBzdXJwcmlzZWQgZ2NjIGRvZXMgbm90IGNvbXBsYWluLgoKPiAxIGVycm9yIGdlbmVyYXRl
ZC4KPiAvYnVpbGRzL3hlbi1wcm9qZWN0L3hlbi94ZW4vUnVsZXMubWs6MTk4OiByZWNpcGUgZm9y
IHRhcmdldCAnc3luaWMubycgZmFpbGVkCj4gbWFrZVs2XTogKioqIFtzeW5pYy5vXSBFcnJvciAx
Cj4gCj4gRHJvcCB0aGUgbGFzdCB2YXJpYWJsZSBzaXplIGFycmF5IGZyb20gaHZfdGxiX2ZsdXNo
X2V4IGZvciBub3cgdG8gZml4Cj4gY2xhbmcgYnVpbGRzLgoKV2h5ICJmb3Igbm93Ij8gVGhlIGZp
ZWxkIGlzIGlsbGVnYWwgdGhlcmUsIGFuZCBJIGNhbid0IHNlZSBhIHdheSB0bwptYWtlIGl0IGxl
Z2FsLiBUbyBrbm93IGl0cyBhY3R1YWwgcGxhY2UgaW4gbWVtb3J5IHlvdSBuZWVkIHRvIGtub3cK
dGhlIG51bWJlciBvZiBlbGVtZW50cyBpbiBiYW5rX2NvbnRlbnRzW10sIGkuZS4gaGF2aW5nIHRo
ZSBmaWVsZAppZiB0aGUgY29tcGlsZXIgZXJyb25lb3VzbHkgYWNjZXB0ZWQgaXQgd291bGQgbWVh
biB3cm9uZyBjb2RlIHRvCmdldCBnZW5lcmF0ZWQgKHNpbGVudGx5KS4KCj4gLS0tIGEveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYtdGxmcy5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNt
LXg4Ni9ndWVzdC9oeXBlcnYtdGxmcy5oCj4gQEAgLTg5MywxMiArODkzLDExIEBAIHN0cnVjdCBo
dl90bGJfZmx1c2ggewo+ICAJdTY0IGd2YV9saXN0W107Cj4gIH0gX19wYWNrZWQ7Cj4gIAo+IC0v
KiBIdkZsdXNoVmlydHVhbEFkZHJlc3NTcGFjZUV4LCBIdkZsdXNoVmlydHVhbEFkZHJlc3NMaXN0
RXggaHlwZXJjYWxscyAqLwo+ICsvKiBIdkZsdXNoVmlydHVhbEFkZHJlc3NTcGFjZUV4IGh5cGVy
Y2FsbCAqLwo+ICBzdHJ1Y3QgaHZfdGxiX2ZsdXNoX2V4IHsKPiAgCXU2NCBhZGRyZXNzX3NwYWNl
Owo+ICAJdTY0IGZsYWdzOwo+ICAJc3RydWN0IGh2X3Zwc2V0IGh2X3ZwX3NldDsKPiAtCXU2NCBn
dmFfbGlzdFtdOwoKUmF0aGVyIHRoYW4gb3V0cmlnaHQgcmVtb3ZpbmcgdGhlIGxpbmUsIGtlZXAg
aXQgYXMgYSBjb21tZW50PwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
