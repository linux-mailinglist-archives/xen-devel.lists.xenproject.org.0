Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE5AB115A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 16:43:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8QGu-0005GK-Ut; Thu, 12 Sep 2019 14:40:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8QGt-0005GF-Oj
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 14:40:31 +0000
X-Inumbo-ID: 4400ddd4-d56b-11e9-959b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4400ddd4-d56b-11e9-959b-12813bfff9fa;
 Thu, 12 Sep 2019 14:40:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 44FAEB622;
 Thu, 12 Sep 2019 14:40:28 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-25-jgross@suse.com>
 <de1280ef-a2f0-b96c-8c7a-049027cf1b34@suse.com>
 <4fa2cb71-5b66-b344-6ab2-502008ba5f69@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7556923e-c32a-7ab2-4c53-43605a1d62db@suse.com>
Date: Thu, 12 Sep 2019 16:40:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <4fa2cb71-5b66-b344-6ab2-502008ba5f69@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 24/48] xen: switch from for_each_vcpu()
 to for_each_sched_unit()
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMjAxOSAxNjowMiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwOS4wOS4xOSAx
NzoxNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA5LjA4LjIwMTkgMTY6NTgsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBAQCAtMTAwMiwxNyArMTAzMiwxNyBAQCBpbnQgY3B1X2Rpc2FibGVf
c2NoZWR1bGVyKHVuc2lnbmVkIGludCBjcHUpCj4+PiAgICAgICAgICAgICAgICAqICAqIHRoZSBz
Y2hlZHVsZXIgd2lsbCBhbHdheXMgZmluZCBhIHN1aXRhYmxlIHNvbHV0aW9uLCBvcgo+Pj4gICAg
ICAgICAgICAgICAgKiAgICB0aGluZ3Mgd291bGQgaGF2ZSBmYWlsZWQgYmVmb3JlIGdldHRpbmcg
aW4gaGVyZS4KPj4+ICAgICAgICAgICAgICAgICovCj4+PiAtICAgICAgICAgICAgdmNwdV9taWdy
YXRlX3N0YXJ0KHYpOwo+Pj4gKyAgICAgICAgICAgIHZjcHVfbWlncmF0ZV9zdGFydCh1bml0LT52
Y3B1X2xpc3QpOwo+Pj4gICAgICAgICAgICAgICB1bml0X3NjaGVkdWxlX3VubG9ja19pcnFyZXN0
b3JlKGxvY2ssIGZsYWdzLCB1bml0KTsKPj4+ICAgCj4+PiAtICAgICAgICAgICAgdmNwdV9taWdy
YXRlX2ZpbmlzaCh2KTsKPj4+ICsgICAgICAgICAgICB2Y3B1X21pZ3JhdGVfZmluaXNoKHVuaXQt
PnZjcHVfbGlzdCk7Cj4+Cj4+IEFsbCB0aGUgLT52Y3B1X2xpc3QgcmVmZXJlbmNlcyBsb29rIGJv
Z3VzIGNvbnNpZGVyaW5nIHdoZXJlIHlvdSdyZQo+PiBtb3ZpbmcsIGJ1dCBJIGNhbiBvbmx5IGd1
ZXNzIHRoYXQgYWxsIG9mIHRoaXMgd2lsbCBuZWVkIHRvdWNoaW5nCj4+IGFnYWluIGxhdGVyIGlu
IHRoZSBzZXJpZXMuIEkgd29uZGVyIHRob3VnaCB3aGV0aGVyIHRoZXNlIHdvdWxkbid0Cj4+IGJl
dHRlciBjaGFuZ2UgaW50byBmb3ItZWFjaC12Q1BVLWluLXVuaXQgbG9vcHMgcmlnaHQgYXdheS4K
PiAKPiBFc3BlY2lhbGx5IHRoZSB2Y3B1X21pZ3JhdGUgcGFydCBpcyBtb3JlIGNvbXBsaWNhdGVk
LiBJIHRoaW5rIGl0IGlzCj4gbXVjaCBlYXNpZXIgdG8gcmV2aWV3IHdpdGggdGhlIG1vcmUgbWVj
aGFuaWNhbCBjaGFuZ2VzIHNwbGl0IGZyb20gdGhlCj4gbG9naWNhbCBjaGFuZ2VzLgoKWWVzLCBh
bmQgSSBhcHByZWNpYXRlIHlvdSBzZXBhcmF0aW5nIG1lY2hhbmljYWwgZnJvbSBsb2dpY2FsIGNo
YW5nZXMuCkhvd2V2ZXIsIGFzIGFscmVhZHkgcG9pbnRlZCBvdXQgaW4gdGhlIGNvbnRleHQgd2hl
cmUgSSBoYWQgY29udmluY2VkCnlvdSBvZiB1c2luZyAidmNwdV9saXN0IiBhcyBhIG5hbWUsIGlu
ZGl2aWR1YWwgYWN0aW9ucyBvbiB2Y3B1X2xpc3QKbm93IGxvb2sgYm9ndXMgdGhyb3VnaG91dCB0
aGUgc2VyaWVzLiBUaGV5IHNob3VsZCByZWFsbHkgKGFsbW9zdD8pCmFsbCBiZSBsb29wcyBvdmVy
IHRoZSBlbnRpcmUgbGlzdDsgSSBoYXZlIGEgaGFyZCB0aW1lIGltYWdpbmluZwpwb3NzaWJsZSBl
eGNlcHRpb25zLCBidXQgSSdtIG5vdCBnb2luZyB0byBleGNsdWRlIHRoZXJlIG1heSBiZSBvbmUK
b3IgYSBmZXcuIEludHJvZHVjaW5nIHN1Y2ggbG9vcHMgc2hvdWxkLCBhcyBsb25nIGFzIHRoZXJl
J3Mgb25seQpldmVyIG9uIHZDUFUgb24gc3VjaCBhIGxpc3QsIHRvbyBiZSBhIG1vc3RseSBtZWNo
YW5pY2FsIHN0ZXAsIHdoaWNoCmltbyBzaG91bGQgaGF2ZSBoYXBwZW5lZCBiZWZvcmUgKG9yIHdp
dGgpIGNoYW5nZXMgbGlrZSB0aGlzIG9uZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
