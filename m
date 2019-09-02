Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB78FA585D
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 15:49:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4meR-00088g-Hw; Mon, 02 Sep 2019 13:45:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kzGk=W5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i4meP-00088b-Sv
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 13:45:45 +0000
X-Inumbo-ID: f5b7d438-cd87-11e9-aea3-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5b7d438-cd87-11e9-aea3-12813bfff9fa;
 Mon, 02 Sep 2019 13:45:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 544F9AEAE;
 Mon,  2 Sep 2019 13:45:43 +0000 (UTC)
To: Paul Durrant <Paul.Durrant@citrix.com>
References: <20190830082953.2192-1-paul.durrant@citrix.com>
 <20190830082953.2192-2-paul.durrant@citrix.com>
 <38900772-c8ce-bbfd-6d92-fbfe7abc7558@suse.com>
 <6178c787fecf4d8e80967e2681937b0d@AMSPEX02CL03.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0b37db94-2051-4ea0-e518-6222346a82c1@suse.com>
Date: Mon, 2 Sep 2019 15:45:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6178c787fecf4d8e80967e2681937b0d@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 1/6] x86/domain: remove the 'oos_off' flag
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
Cc: WeiLiu <wl@xen.org>, AndrewCooper <Andrew.Cooper3@citrix.com>,
 "Tim \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDkuMjAxOSAxNTowNiwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IFNlbnQ6IDAyIFNlcHRlbWJlciAyMDE5IDEzOjM0
Cj4+Cj4+IE9uIDMwLjA4LjIwMTkgMTA6MjksIFBhdWwgRHVycmFudCB3cm90ZToKPj4+IC0tLSBh
L3hlbi9jb21tb24vZG9tYWluLmMKPj4+ICsrKyBiL3hlbi9jb21tb24vZG9tYWluLmMKPj4+IEBA
IC0zMTMsMTEgKzMxMywxOSBAQCBzdGF0aWMgaW50IHNhbml0aXNlX2RvbWFpbl9jb25maWcoc3Ry
dWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluICpjb25maWcpCj4+PiAgICAgICAgICByZXR1cm4g
LUVJTlZBTDsKPj4+ICAgICAgfQo+Pj4KPj4+IC0gICAgaWYgKCAhKGNvbmZpZy0+ZmxhZ3MgJiBY
RU5fRE9NQ1RMX0NERl9odm1fZ3Vlc3QpICYmCj4+PiAtICAgICAgICAgKGNvbmZpZy0+ZmxhZ3Mg
JiBYRU5fRE9NQ1RMX0NERl9oYXApICkKPj4+ICsgICAgaWYgKCAhKGNvbmZpZy0+ZmxhZ3MgJiBY
RU5fRE9NQ1RMX0NERl9odm1fZ3Vlc3QpICkKPj4+ICAgICAgewo+Pj4gLSAgICAgICAgZHByaW50
ayhYRU5MT0dfSU5GTywgIkhBUCByZXF1ZXN0ZWQgZm9yIG5vbi1IVk0gZ3Vlc3RcbiIpOwo+Pj4g
LSAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+PiArICAgICAgICBpZiAoIGNvbmZpZy0+ZmxhZ3Mg
JiBYRU5fRE9NQ1RMX0NERl9oYXAgKQo+Pj4gKyAgICAgICAgewo+Pj4gKyAgICAgICAgICAgIGRw
cmludGsoWEVOTE9HX0lORk8sICJIQVAgcmVxdWVzdGVkIGZvciBub24tSFZNIGd1ZXN0XG4iKTsK
Pj4+ICsgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+ICsgICAgICAgIH0KPj4+ICsKPj4+
ICsgICAgICAgIC8qCj4+PiArICAgICAgICAgKiBJdCBpcyBvbmx5IG1lYW5pbmdmdWwgZm9yIFhF
Tl9ET01DVExfQ0RGX29vc19vZmYgdG8gYmUgY2xlYXIKPj4+ICsgICAgICAgICAqIGZvciBIVk0g
Z3Vlc3RzLgo+Pj4gKyAgICAgICAgICovCj4+PiArICAgICAgICBjb25maWctPmZsYWdzIHw9IFhF
Tl9ET01DVExfQ0RGX29vc19vZmY7Cj4+Cj4+IC4uLiBJIHdvbmRlciB3aGV0aGVyIHRoaXMgbGFz
dCBwYXJ0IHdvdWxkbid0IGJldHRlciBiZWxvbmcgaW50bwo+PiB4ODYncyBhcmNoX3Nhbml0aXNl
X2RvbWFpbl9jb25maWcoKS4gQXJtLCB0byB0aGUgY29udHJhcnksIHNob3VsZAo+PiBmb3JjZS9y
ZXF1aXJlIHRoZSBiaXQgdG8gYmUgdW5pZm9ybWx5IG9mZi4KPj4KPiAKPiBJJ20gc3VyZSBJIGhh
ZCBhIHJlYXNvbiBmb3IgZG9pbmcgaXQgbGlrZSB0aGlzIGJ1dCBpdCdzIHN1ZmZpY2llbnRseSBs
b25nCj4gYWdvIG5vdyB0aGF0IEkndmUgZm9yZ290dGVuIHdoYXQgaXQgd2FzKi4gV291bGQgaXQg
YmUgb2sgdG8gdGFrZSB0aGUgY29kZQo+IGFzLWlzIGFuZCBJJ2xsIGludmVzdGlnYXRlIHdoZXRo
ZXIgdGhpcyBjYW4gYmUgdGlkaWVkIHVwPwoKV2VsbCwgd2l0aCB0aGlzIHBlbmRpbmcgcXVlc3Rp
b24gSSdtIGxlc3MgaW5jbGluZWQgdG8gc3RvcCB3YWl0aW5nIGZvcgp0aGUgb3V0c3RhbmRpbmcg
YWNrcy4KCj4gWyAqIEkgc3VzcGVjdCBpdCB3YXMgY29uY2VybiBvdmVyIGJyZWFraW5nIGV4aXN0
aW5nIHRvb2wtc3RhY2tzIGJ5Cj4gcmVxdWlyaW5nIHRoZW0gdG8gc2V0IGEgZmxhZyB0aGF0IHBy
ZXZpb3VzbHkgdGhleSBkaWQgbm90IG5lZWQgdG8sIGJ1dAo+IEknbSBub3Qgc3VyZSB0aGF0IHdh
cyB0aGUgb25seSByZWFzb24gXQoKU2VlbXMgcmF0aGVyIHVubGlrZWx5IHRvIG1lLCBhcyB0aGVy
ZSB3b3VsZG4ndCBiZSBhbnkgZGlmZmVyZW5jZSAoZnJvbQp0b29sIHN0YWNrIHBlcnNwZWN0aXZl
KSBpZiB0aGUgYWRqdXN0bWVudCB3YXMgZG9uZSBieSBwZXItYXJjaCBjb2RlLgoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
