Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B33A10D3EB
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 11:25:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iadQR-0000nz-4h; Fri, 29 Nov 2019 10:22:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UeaM=ZV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iadQP-0000no-VJ
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 10:22:58 +0000
X-Inumbo-ID: 35dc0918-1292-11ea-a3e0-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35dc0918-1292-11ea-a3e0-12813bfff9fa;
 Fri, 29 Nov 2019 10:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575022977;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ELIEheQbJ6T5xPJ05JJHtQrRbxGjwwKsQeIDhFUbZp8=;
 b=Hxb8ulfx+IRj2+wpU4a0V5touiN7d6gCvtfQ+r0EWIMiHYyHbMBONki0
 ww5r7N+OwQUlcDY4irGptTYBSkCRs3+8emqxrx4MPOiuF+h/Y6DjkkHRc
 j+YYV/+mLSUsQXvnkR+DEunryZNXqMCrSLOg2QmLZukiQeqFX6qfk0k6h o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OQuGsSFko/Si33+6GJ9oe5cU0Wqh5JNxKxh8o4/tG8Y7doVELP/wwTNe7R9WxxyehPZIptoxew
 op9vh8YOLzrprCV7m1ieaZue5Q6G70kLKu8Eh17VkFBKm+eZKR/7JxZz3zwUP4I26bx3ivVoAY
 00qT12MFZ4mIs42iuKZmNDseunQnohpV5AHg+sLidfIqYtK6PduyBIZACkURefPYz3s36ZhXyW
 rMuiyXOYG3hjjh0PcAXtJebi5Z9QTMqPjnOuOqzjbFUpYDe9XgLIowL2qhOh1wnvTPDhorWzoJ
 M9M=
X-SBRS: 2.7
X-MesageID: 9392019
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="9392019"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <5766dd2b-2aa7-bafe-56ad-3ea33ddf4591@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <78b1df38-864c-768e-b306-2db75f3b76e0@citrix.com>
Date: Fri, 29 Nov 2019 10:22:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5766dd2b-2aa7-bafe-56ad-3ea33ddf4591@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] console: avoid buffer overflow in
 guest_console_write()
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ilja Van Sprundel <ivansprundel@ioactive.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkvMTEvMjAxOSAxMDoxMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlIHN3aXRjaCBvZiBn
dWVzdF9jb25zb2xlX3dyaXRlKCkncyBzZWNvbmQgcGFyYW1ldGVyIGZyb20gcGxhaW4gdG8KPiB1
bnNpZ25lZCBpbnQgaGFzIGNhdXNlZCB0aGUgZnVuY3Rpb24ncyBtYWluIGxvb3AgaGVhZGVyIHRv
IG5vIGxvbmdlcgo+IGd1YXJkIHRoZSBtaW5fdCgpIHVzZSB3aXRoaW4gdGhlIGZ1bmN0aW9uIGFn
YWluc3QgZWZmZWN0aXZlbHkgbmVnYXRpdmUKPiB2YWx1ZXMsIGR1ZSB0byB0aGUgY2FzdHMgaGlk
ZGVuIGluc2lkZSB0aGUgbWFjcm8uIFJlcGxhY2UgYnkgYSBwbGFpbgo+IG1pbigpLCBjb252ZXJ0
aW5nIG9uZSBvZiB0aGUgYXJndW1lbnRzIHN1aXRhYmx5IHdpdGhvdXQgaW52b2x2aW5nIGFueQo+
IGNhc3QuCj4KPiBGaXhlczogZWE2MDFlYzk5OTViICgieGVuL2NvbnNvbGU6IFJld29yayBIWVBF
UkNBTExfY29uc29sZV9pbyBpbnRlcmZhY2UiKQo+IFJlcG9ydGVkLWJ5OiBJbGphIFZhbiBTcHJ1
bmRlbCA8aXZhbnNwcnVuZGVsQGlvYWN0aXZlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4KPiAtLS0gYS94ZW4vZHJpdmVycy9jaGFyL2NvbnNv
bGUuYwo+ICsrKyBiL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jCj4gQEAgLTUzOCw3ICs1Mzgs
NyBAQCBzdGF0aWMgbG9uZyBndWVzdF9jb25zb2xlX3dyaXRlKFhFTl9HVUVTCj4gICAgICAgICAg
ICAgICAgICBfX0hZUEVSVklTT1JfY29uc29sZV9pbywgImlpaCIsCj4gICAgICAgICAgICAgICAg
ICBDT05TT0xFSU9fd3JpdGUsIGNvdW50LCBidWZmZXIpOwo+ICAKPiAtICAgICAgICBrY291bnQg
PSBtaW5fdChpbnQsIGNvdW50LCBzaXplb2Yoa2J1ZiktMSk7Cj4gKyAgICAgICAga2NvdW50ID0g
bWluKGNvdW50ICsgc2l6ZW9mKGNoYXJbMF0pLCBzaXplb2Yoa2J1ZikgLSAxKTsKCklzIHNpemVv
ZihhcnJheVswXSkgYWx3YXlzIDAsIG9yIGlzIHRoaXMganVzdCBhIEdDQy1pc20gP8KgIEdvZGJv
bHQKc3VnZ2VzdHMgaXMgMCBvbiBhbGwgY29tcGlsZXIgd2Ugc3VwcG9ydC4KCkVpdGhlciB3YXks
IGlzbid0IHRoZSBtb3JlIGNvbW1vbiBpZGlvbSArIDB1bCA/wqAgUGVyc29uYWxseSwgSSBmZWVs
IHRoYXQKaXMgY2xlYXJlciB0byBmb2xsb3cuCgpUaGF0IHNhaWQsIGdpdmVuIHRoZSBzZXZlcml0
eSBhbmQgdXJnZW5jeSBvZiB0aGlzCmV4dHJlbWVseS1sdWNreS1pdHMtbm90LWFuLVhTQSwgUmV2
aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIKPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+LCBidXQg
aWRlYWxseSB1c2luZyB0aGUgKzB1bCBmb3JtLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
