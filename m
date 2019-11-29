Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9360A10D77A
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 15:52:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iahbT-00056M-7V; Fri, 29 Nov 2019 14:50:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UeaM=ZV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iahbS-00056H-G7
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 14:50:38 +0000
X-Inumbo-ID: 9ab9cb66-12b7-11ea-a3e7-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ab9cb66-12b7-11ea-a3e7-12813bfff9fa;
 Fri, 29 Nov 2019 14:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575039038;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=jHA3ZlxRtu6N8LPBo24Y96kz/P7xfGVYXa3VNI/wXaY=;
 b=b9xykaMaYNzHzzRrUhRBMUC6Yb0CcM1T99lCWq1vZIzLo5ixE2LbMdMN
 FDexpW4RyCOaqPT2uvePA382loV9U9RYbRI/ndy40aPJltGR+0RAb8tDq
 DbB7zO0sUZdU8Vg3ws99EF1DhuD7Rtib1hsaz+WUs6aej6xxrCv0ZRwST M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zA42NM1WFearfsgsJjFplU7iYBqTfzPv+fb8aiRzSiHCXgpoxs3dn9CosMgEKSfr0ZeFgll8PV
 rS7Vb6ocAK2RX4372qlCG9FHMw5EFyU4xR/SwY5ptE3VKrI7R4vpQe0CdHbOUWs0bTcu2wTtNl
 BRN6y8O+tFdbGfzgGuLGB/OlmaIh8cKMYsZgLPuDuHKK72I2vpn3Y6omaqP2y3ltP4k2U2WksK
 5NLOdzrpWz+UzsukgdYkZKlQxP7aw4MtQIGsUacdjyvtL/p0CX25Jiea/lY+vWAsbKJCcce6gR
 rhU=
X-SBRS: 2.7
X-MesageID: 8983437
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="8983437"
To: Jan Beulich <jbeulich@suse.com>
References: <5766dd2b-2aa7-bafe-56ad-3ea33ddf4591@suse.com>
 <20191129143509.26528-1-andrew.cooper3@citrix.com>
 <84fc3671-3cde-869b-495b-505c90544132@suse.com>
 <40eefd78-26f0-9294-0c61-26679b890533@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <126348d1-2a02-4d45-9bcb-a8cf54eaf6ed@citrix.com>
Date: Fri, 29 Nov 2019 14:50:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <40eefd78-26f0-9294-0c61-26679b890533@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH XTF] CONSOLEIO_write stack overflow PoC
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkvMTEvMjAxOSAxNDo0NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjkuMTEuMjAxOSAx
NTo0MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI5LjExLjIwMTkgMTU6MzUsIEFuZHJldyBD
b29wZXIgd3JvdGU6Cj4+PiBDbGFzc2lmeSBpdCBhcyBhbiBYU0EgdGVzdCAod2hpY2ggYXJndWFi
bHkgb3VnaHQgdG8gYmUgbmFtZWQgJ3NlY3VyaXR5JyksCj4+PiBkZXNwaXRlIG5vIFhTQSBiZWlu
ZyBpc3N1ZXMuCj4+IE5pdDogaXNzdWVkCgpXaWxsIGZpeC4KCj4+Cj4+PiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+PiBGV0lXCj4+IFJl
dmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IHdpdGggYSByZW1h
cmsgYW5kIGEgcXVlc3Rpb246Cj4+Cj4+PiAtLS0gYS9kb2NzL2FsbC10ZXN0cy5kb3gKPj4+ICsr
KyBiL2RvY3MvYWxsLXRlc3RzLmRveAo+Pj4gQEAgLTE0Myw2ICsxNDMsOCBAQCBYU0EtMjkzIC0g
U2VlIEByZWYgdGVzdC1wdi1mc2dzYmFzZS4KPj4+ICBAc3VicGFnZSB0ZXN0LXhzYS0yOTggLSBt
aXNzaW5nIGRlc2NyaXB0b3IgdGFibGUgbGltaXQgY2hlY2tpbmcgaW4geDg2IFBWCj4+PiAgZW11
bGF0aW9uLgo+Pj4gIAo+Pj4gK0BzdWJwYWdlIHRlc3QteHNhLWNvbnNvbGVpby13cml0ZSAtIENP
TlNPTEVJT193cml0ZSBzdGFjayBvdmVyZmxvdwo+Pj4gKwo+Pj4gIAo+Pj4gIEBzZWN0aW9uIGlu
ZGV4LXV0aWxpdHkgVXRpbGl0aWVzCj4+IERvIHlvdSByZWFsbHkgd2FudCB0d28gc3VjY2Vzc2l2
ZSBibGFuayBsaW5lcyB0aGVyZT8KClllcy7CoCBJdCBpcyBhbiBhd2t3YXJkIGNvbnNlcXVlbmNl
IG9mIHRoZSBkb3h5Z2VuIG1hcmt1cCBmb3Igc3VicGFnZSBhbmQKc2VjdGlvbiBsb29raW5nIHZl
cnkgc2ltaWxhciBhdCBhIGdsYW5jZS4KCkhhdmluZyBhIGRvdWJsZSBzcGFjZSBpcyB0aGUgb25s
eSB3YXkgdG8gZWFzaWx5IHNwb3QgcGFyYWdyYXBoCmJvdW5kYXJpZXMgd2hlbiBza2ltbWluZyB0
aHJvdWdoIHRoZSBmaWxlLgoKPj4KPj4+IC0tLSAvZGV2L251bGwKPj4+ICsrKyBiL3Rlc3RzL3hz
YS1jb25zb2xlaW8td3JpdGUvbWFpbi5jCj4+PiBAQCAtMCwwICsxLDY5IEBACj4+PiArLyoqCj4+
PiArICogQGZpbGUgdGVzdHMveHNhLWNvbnNvbGVpby13cml0ZS9tYWluLmMKPj4+ICsgKiBAcmVm
IHRlc3QteHNhLWNvbnNvbGVpby13cml0ZQo+Pj4gKyAqCj4+PiArICogVGhpcyBpc3N1ZSB3YXMg
ZGlzY292ZXJlZCBiZWZvcmUgaXQgbWFkZSBpdCBpbnRvIGFueSByZWxlYXNlZCB2ZXJzaW9uIG9m
Cj4+PiArICogWGVuLiAgVGhlcmVmb3JlLCBubyBYU0Egb3IgQ1ZFIHdhcyBpc3N1ZWQuCj4+PiAr
ICoKPj4+ICsgKiBBIGJ1Z2ZpeCBpbiBYZW4gNC4xMyBhbHRlcmVkIENPTlNPTEVJT193cml0ZSB0
byB0b2xlcmF0ZSBwYXNzaW5nIE5VTAo+Pj4gKyAqIGNoYXJhY3RlcnMgaW50YWN0LCBhcyB0aGlz
IGlzIGEgcmVxdWlyZW1lbnQgZm9yIHZhcmlvdXMgVFRZIHNldHVwcy4KPj4+ICsgKgo+Pj4gKyAq
IEEgc2lnbmVkLW5lc3MgaXNzdWUgd2l0aCB0aGUgbGVuZ3RoIGNhbGN1bGF0aW9uIGxlYWQgdG8g
YSBjYXNlIHdoZXJlIFhlbgo+Pj4gKyAqIHdpbGwgY29weSBiZXR3ZWVuIDIgYW5kIDRHIG9mIGd1
ZXN0IHByb3ZpZGVkIGRhdGEgaW50byBhIDEyOCBieXRlIG9iamVjdCBvbgo+Pj4gKyAqIHRoZSBz
dGFjay4KPj4+ICsgKgo+Pj4gKyAqIEBzZWUgdGVzdHMveHNhLWNvbnNvbGVpby13cml0ZS9tYWlu
LmMKPj4+ICsgKi8KPj4+ICsjaW5jbHVkZSA8eHRmLmg+Cj4+PiArCj4+PiArY29uc3QgY2hhciB0
ZXN0X3RpdGxlW10gPSAiQ09OU09MRUlPX3dyaXRlIHN0YWNrIG92ZXJmbG93IFBvQyI7Cj4+PiAr
Cj4+PiArdWludDhfdCB6ZXJvX3BhZ2VbUEFHRV9TSVpFXSBfX3BhZ2VfYWxpZ25lZF9ic3M7Cj4+
PiArCj4+PiArLyogSGF2ZSB0aGUgYXNzZW1ibGVyIGJ1aWxkIGFuIEwxL0wyIHBhaXIgbWFwcGlu
ZyB6ZXJvX3BhZ2VbXSBtYW55IHRpbWVzLiAqLwo+Pj4gK2FzbSAoIi5zZWN0aW9uIFwiLmRhdGEu
cGFnZV9hbGlnbmVkXCIsIFwiYXdcIjsiCj4+PiArICAgICAiLmFsaWduIDQwOTY7Igo+Pj4gKwo+
Pj4gKyAgICAgImwxdDoiCj4+PiArICAgICAiLnJlcHQgNTEyOyIKPj4+ICsgICAgICIubG9uZyB6
ZXJvX3BhZ2UgKyAiU1RSKFBGX1NZTShBRCwgUCkpIiwgMDsiCj4+IFRoZXJlIGJlaW5nIG5vIGZ1
cnRoZXIgKHJ1bnRpbWUpIGFkanVzdG1lbnQgdG8gdGhpcyBhbmQgLi4uCj4+Cj4+PiArICAgICAi
LmVuZHI7Igo+Pj4gKyAgICAgIi5zaXplIGwxdCwgLiAtIGwxdDsiCj4+PiArICAgICAiLnR5cGUg
bDF0LCBAb2JqZWN0OyIKPj4+ICsKPj4+ICsgICAgICJsMnQ6Igo+Pj4gKyAgICAgIi5yZXB0IDUx
MjsiCj4+PiArICAgICAiLmxvbmcgbDF0ICsgIlNUUihQRl9TWU0oQUQsIFApKSIsIDA7Igo+PiAu
Li4gdGhpcywgaXMgaXQgc2V0IGluIHN0b25lIHRoYXQgcGh5cyA9PSBsaW4gaW4gWFRGIHRlc3Rz
PyBPcgo+PiBkaWQgeW91IG1lYW4gdGhpcyB0byBiZSBodm0zMiwgbm90IGh2bTMycGFlPwo+IFdl
bGwsIHRoaXMgbGFzdCBwYXJ0IHdhcyBub25zZW5zZSAtIHRoZXJlIHdvdWxkbid0IGJlIGFueSBw
YWdlCj4gdGFibGVzIGlmIGl0IHdhcyBodm0zMi4gQnV0IHRoZSBxdWVzdGlvbiByZW1haW5zLgoK
WWVzLsKgIFhURiBoYXMgYW4gaWRlbnRpdHkgbGF5b3V0IChhbmQgdGhpcyBpcyBzdGF0ZWQgaW4g
bW0uaCksCnNwZWNpZmljYWxseSBmb3IgY29tcGF0aWJpbGl0eSBiZXR3ZWVuIHVucGFnZWQgYW5k
IHBhZ2VkIHRlc3RzLgoKQW55IHRlc3Qgd2FudGluZyB0byBkbyBzb21ldGhpbmcgbW9yZSBleGNp
dGluZyBpcyBmcmVlIHRvIGRvIHNvLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
