Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F10E5EB3
	for <lists+xen-devel@lfdr.de>; Sat, 26 Oct 2019 20:47:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iOR2y-0001wN-86; Sat, 26 Oct 2019 18:44:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2VW7=YT=eikelenboom.it=sander@srs-us1.protection.inumbo.net>)
 id 1iOR2w-0001wB-7A
 for xen-devel@lists.xenproject.org; Sat, 26 Oct 2019 18:44:18 +0000
X-Inumbo-ID: 9cde004e-f820-11e9-bbab-bc764e2007e4
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9cde004e-f820-11e9-bbab-bc764e2007e4;
 Sat, 26 Oct 2019 18:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GFt4Pg6CmGCeQPMhX1IQWdF3w+YLAnpRosu4Pp9QLw0=; b=hF+r4YbpAX5n4YpKZI0z6A3hyH
 C77QBNrS0DYJnDXgVwKk83Y0hUX6uHhVZR7yRTmkwEVQKdnBpMmqq6S47/3bKtuCIMNnhHX/CQQ4T
 Hw67L7nlrh1bbXXaDBA3fY74n6iKtDsyVLBM0moTZzjkscZ0ltFhIhYMaVeb4zCimjkM=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:45652
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <sander@eikelenboom.it>)
 id 1iOR3d-0002pJ-D7; Sat, 26 Oct 2019 20:45:01 +0200
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20191025170505.2834957-1-anthony.perard@citrix.com>
From: Sander Eikelenboom <sander@eikelenboom.it>
Openpgp: preference=signencrypt
Autocrypt: addr=sander@eikelenboom.it; prefer-encrypt=mutual; keydata=
 mQMuBFNFDU0RCACWtSq295Y0xaUP3k7jub63jXIfXgGJ+LUbLJeS0mOeRC+xftv3qk9U2aTi
 z0Glopirh/6aRXb+rcxQ9hOVNfRHKvnHPyb1yC5zNadDAj+E+fO/iW0Yco5OnwUhNfEMkKT9
 WKRW4oWD/uv9CkHRaPNZbX3Sd1u1ns0LUML3ayws/kUb7FPrh1CZVhgvfJuD85Kj1YpbHUyU
 v2nWBT+hoYEfT8y4SfhDPy9UMXrPlUGPFACvWfBy76mxpdTtzfuDk8r1s4hbvVKty29VBEcH
 0fFKZmqsywhDWTP9ILibk0azXRvA+6ZD6D9WUBZ0TfC8vy1eG0zEDF7yOThatoYuWlqHAQC1
 OFOG97B+zbc1R1HTYZUreUt28VQ1v+2pG/sZj0Mcgwf+N1UdiyS96pFYXUD9z0lQztCETF+I
 P/tiDapjhlQld6LGfHO3Qk3/tMtgh32TMxOjCTNrP1fn3eOdDRwyn7ZSzcIMZ0j55DXp5ut9
 NJ0UxXMGnOWm/Lcz81EhR6QxR6EdgL5iCsJjqSq8DMaBz+dswanOksPrGzJ+IHFYYesRRzdE
 Z9dQpARCry4c0vX3wX4BG+vRdYHKfM4tHvr+wdM7U3F1ta8C0HU+lFfAH7/nhpxLB9/Ibin8
 9+KItaujo4XJhOx8QLNnJiU1bPOvUHGqX2WUn8yb1eLgCx9nZ4YUrP1YDiilrMx9hGMdl0hk
 gKKoMWh8B2/qChSuKMI2Kwu+uwgAlqz0QuQkWFTLbXLpyHcnayT7TVKsAMgn7i0kl8CaeW9i
 /r62k2l2yZIXtJuLBEJ1qVZ1P1sXUYuFqIlOjW0VKyJ3IZa6cTLQfRxVN+ETGtAUGJvUpaNa
 n84nG3vAnmSmCnHDWBxr66wF4+UnIj0sHPlYclJGy/mrxs+OhhCog5NvbpzWAiLeZ1MeyNs+
 JwWzW7I4o7PcHAt74PpVDiwhuPUZJs2fXi4u73lPxVfTKJHEHJrxbfgQP/qeWebIwADj1X4q
 s5njcvNBE+ier8EVwbyTBL7Fzf39Grw/9Kf4CiUCu7kxQTRyHyT/nJWuaMdR00yqEVGctv2n
 e3qrNqGambQqU2FuZGVyIEVpa2VsZW5ib29tIDxzYW5kZXJAZWlrZWxlbmJvb20uaXQ+iIEE
 ExEIACkFAlNFDU0CGwMFCQfIF1MHCwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRChIPzf
 fJPzZO3KAP9VcRwYdaETTC4+s3gscTMGFDUT+WYcNqpIIn/BLGKuFAD/eglObB2QxiXV4t1T
 ++6WKsvKtNlmrssnOqOmZyqPZQ8=
Message-ID: <737aff0c-5e8a-4c6c-2e96-fe50169911cc@eikelenboom.it>
Date: Sat, 26 Oct 2019 20:45:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191025170505.2834957-1-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC XEN PATCH for-4.13 0/4] Fix: libxl workaround,
 multiple connection to single QMP socket
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUvMTAvMjAxOSAxOTowNSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gUGF0Y2ggc2VyaWVz
IGF2YWlsYWJsZSBpbiB0aGlzIGdpdCBicmFuY2g6Cj4gaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcv
Z2l0LWh0dHAvcGVvcGxlL2FwZXJhcmQveGVuLXVuc3RhYmxlLmdpdCBici5maXgtZXZfcW1wLW11
bHRpLWNvbm5lY3QtdjEKPiAKPiBIaSwKPiAKPiBRRU1VJ3MgUU1QIHNvY2tldCBkb2Vzbid0IGFs
bG93IG11bHRpcGxlIGNvbmN1cnJlbnQgY29ubmVjdGlvbi4gQWxzbywgaXQKPiBsaXN0ZW4oKSBv
biB0aGUgc29ja2V0IHdpdGggYSBgYmFja2xvZycgb2Ygb25seSAxLiBPbiBMaW51eCBhdCBsZWFz
dCwgb25jZSB0aGF0Cj4gYmFja2xvZyBpcyBmaWxsZWQgY29ubmVjdCgpIHdpbGwgcmV0dXJuIEVB
R0FJTiBpZiB0aGUgc29ja2V0IGZkIGlzCj4gbm9uLWJsb2NraW5nLiBsaWJ4bCBtYXkgYXR0ZW1w
dCBtYW55IGNvbmN1cnJlbnQgY29ubmVjdCgpIGF0dGVtcHQgaWYgZm9yCj4gZXhhbXBsZSBhIGd1
ZXN0IGlzIHN0YXJ0ZWQgd2l0aCBzZXZlcmFsIFBDSSBwYXNzdGhyb3VnaCBkZXZpY2VzLCBhbmQg
YQo+IGNvbm5lY3QoKSBmYWlsdXJlIGxlYWQgdG8gYSBmYWlsdXJlIHRvIHN0YXJ0IHRoZSBndWVz
dC4KCkhpIEFudGhvbnksCgpKdXN0IHRlc3RlZCB3aXRoIHRoZSBwYXRjaCBzZXJpZXMgYW5kIGl0
IGZpeGVzIG15IGlzc3VlIHdpdGggc3RhcnRpbmcgYQpndWVzdCB3aXRoIHNldmVyYWwgUENJIHBh
c3N0aHJvdWdoIGRldmljZXMuCgpUaGFua3MsCgpTYW5kZXIKCgo+IFNpbmNlIHdlIGNhbid0IGNo
YW5nZSB0aGUgbGlzdGVuKCkncyBgYmFja2xvZycgdGhhdCBRRU1VIHVzZSwgd2UgbmVlZCBvdGhl
cgo+IHdheXMgdG8gd29ya2Fyb3VuZCB0aGUgaXNzdWUuIFRoaXMgcGF0Y2ggc2VyaWVzIGludHJv
ZHVjZSBhIGxvY2sgdG8gYWNxdWlyZQo+IGJlZm9yZSBhdHRlbXB0aW5nIHRvIGNvbm5lY3QoKSB0
byB0aGUgUU1QIHNvY2tldC4gU2luY2UgdGhlIGxvY2sgbWlnaHQgYmUgaGVsZAo+IGZvciB0byBs
b25nLCB0aGUgc2VyaWVzIGFsc28gaW50cm9kdWNlIGEgd2F5IHRvIGNhbmNlbCB0aGUgYWNxdWlz
aXRpb24gb2YgdGhlCj4gbG9jaywgdGhpcyBtZWFucyBraWxsaW5nIHRoZSBwcm9jZXNzIHRoYXQg
dHJpZXMgdG8gZ2V0IHRoZSBsb2NrLgo+IAo+IEFsdGVybmF0aXZlbHkgdG8gdGhpcyBjcmF6aW5l
c3MsIGl0IG1pZ2h0IGJlIHBvc3NpYmxlIHRvIGluY3JlYXNlIHRoZSBgYmFja2xvZycKPiB2YWx1
ZSBieSBoYXZpbmcgbGlieGwgb3BlbmluZyB0aGUgUU1QIHNvY2tldCBvbiBiZWhhbGYgb2YgUUVN
VS4gQnV0IHRoaXMgaXMKPiBvbmx5IHBvc3NpYmxlIHdpdGggYSByZWNlbnQgdmVyc2lvbiBvZiBR
RU1VICgyLjEyIG9yIG5ld2VyLCByZWxlYXNlZCBpbiBBcHIKPiAyMDE4LCBvciBxZW11LXhlbi00
LjEyIG9yIG5ld2VyKS4gSXQgd291bGQgaW52b2x2ZSB0byBkaXNjb3ZlciBRRU1VJ3MKPiBjYXBh
YmlsaXR5IGJlZm9yZSB3ZSBzdGFydCB0aGUgRE0sIHdoaWNoIGxpYnhsIGlzbid0IGNhcGFibGUg
eWV0Lgo+IAo+IENoZWVycywKPiAKPiBBbnRob255IFBFUkFSRCAoNCk6Cj4gICBsaWJ4bDogSW50
cm9kdWNlIGxpYnhsX19ldl9jaGlsZF9raWxsCj4gICBsaWJ4bDogSW50cm9kdWNlIGxpYnhsX19l
dl9xbXBsb2NrCj4gICBsaWJ4bDogbGlieGxfX2V2X3FtcF9zZW5kIG5vdyB0YWtlcyBhbiBlZ2MK
PiAgIGxpYnhsX3FtcDogSGF2ZSBhIGxvY2sgZm9yIFFNUCBzb2NrZXQgYWNjZXNzCj4gCj4gIHRv
b2xzL2xpYnhsL2xpYnhsX2Rpc2suYyAgICAgICAgfCAgNiArLS0KPiAgdG9vbHMvbGlieGwvbGli
eGxfZG0uYyAgICAgICAgICB8ICA4ICsrLS0KPiAgdG9vbHMvbGlieGwvbGlieGxfZG9tX3NhdmUu
YyAgICB8ICAyICstCj4gIHRvb2xzL2xpYnhsL2xpYnhsX2RvbV9zdXNwZW5kLmMgfCAgMiArLQo+
ICB0b29scy9saWJ4bC9saWJ4bF9kb21haW4uYyAgICAgIHwgIDggKystLQo+ICB0b29scy9saWJ4
bC9saWJ4bF9ldmVudC5jICAgICAgIHwgIDMgKy0KPiAgdG9vbHMvbGlieGwvbGlieGxfZm9yay5j
ICAgICAgICB8IDU1ICsrKysrKysrKysrKysrKysrKysrKysrKwo+ICB0b29scy9saWJ4bC9saWJ4
bF9pbnRlcm5hbC5jICAgIHwgMzEgKysrKysrKysrKysrKy0KPiAgdG9vbHMvbGlieGwvbGlieGxf
aW50ZXJuYWwuaCAgICB8IDUzICsrKysrKysrKysrKysrKysrLS0tLS0tCj4gIHRvb2xzL2xpYnhs
L2xpYnhsX3BjaS5jICAgICAgICAgfCAgOCArKy0tCj4gIHRvb2xzL2xpYnhsL2xpYnhsX3FtcC5j
ICAgICAgICAgfCA3NSArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KPiAgdG9vbHMv
bGlieGwvbGlieGxfdXNiLmMgICAgICAgICB8IDI4ICsrKysrKy0tLS0tLQo+ICAxMiBmaWxlcyBj
aGFuZ2VkLCAyMTkgaW5zZXJ0aW9ucygrKSwgNjAgZGVsZXRpb25zKC0pCj4gCgoKLS0gCgpNZXQg
dnJpZW5kZWxpamtlIGdyb2V0LAoKU2FuZGVyIEVpa2VsZW5ib29tCm1haWx0bzpTYW5kZXJARWlr
ZWxlbmJvb20uSVQKCkVpa2VsZW5ib29tIElUIFNlcnZpY2VzCkthYXBzZXdlZyA3MAo1NjQyIEhL
IEVpbmRob3ZlbgpNOiAwNi0xNDM4NzQ4NAoKUEdQIHB1YmxpYyBrZXkgZm9yIHNhbmRlckBlaWtl
bGVuYm9vbS5pdDoKa2V5IGlkOiAweEM0Qjk5RUVERUNGMkFFNjkKZmluZ2VycHJpbnQ6IDA3QkIg
QjgxOSBGRjkzIEU1NEQgNUY1QyAgMEJERSBDNEI5IDlFRUQgRUNGMiBBRTY5CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
