Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF74C10A146
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 16:35:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZcow-00081j-Pv; Tue, 26 Nov 2019 15:32:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EMZS=ZS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZcov-00081e-Pv
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 15:32:05 +0000
X-Inumbo-ID: e576a140-1061-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e576a140-1061-11ea-a55d-bc764e2007e4;
 Tue, 26 Nov 2019 15:32:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 27EA8BDFF;
 Tue, 26 Nov 2019 15:32:03 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191126120357.13398-1-andrew.cooper3@citrix.com>
 <20191126120357.13398-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <93e3dd69-698e-17ee-5eef-a932b1989786@suse.com>
Date: Tue, 26 Nov 2019 16:32:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191126120357.13398-3-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/3] x86/svm: Always intercept ICEBP
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
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMTEuMjAxOSAxMzowMywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBJQ0VCUCBpc24ndCBo
YW5kbGVkIHdlbGwgYnkgU1ZNLgo+IAo+IFRoZSBWTWV4aXQgc3RhdGUgZm9yIGEgI0RCLXZlY3Rv
cmVkIFRBU0tfU1dJVENIIGhhcyAlcmlwIHBvaW50aW5nIHRvIHRoZQo+IGFwcHJvcHJpYXRlIGlu
c3RydWN0aW9uIGJvdW5kYXJ5IChmYXVsdCBvciB0cmFwLCBhcyBhcHByb3ByaWF0ZSksIGV4Y2Vw
dCBmb3IKPiBhbiBJQ0VCUC1pbmR1Y2VkICNEQiBUQVNLX1NXSVRDSCwgd2hlcmUgJXJpcCBwb2lu
dHMgYXQgdGhlIElDRUJQIGluc3RydWN0aW9uCj4gcmF0aGVyIHRoYW4gYWZ0ZXIgaXQuICBBcyBJ
Q0VCUCBpc24ndCBkaXN0aW5ndWlzaGVkIGluIHRoZSB2ZWN0b3JpbmcgZXZlbnQKPiB0eXBlLCB0
aGUgc3RhdGUgaXMgYW1iaWd1b3VzLgo+IAo+IFRvIGFkZCB0byB0aGUgY29uZnVzaW9uLCBhbiBJ
Q0VCUCB3aGljaCBvY2N1cnMgZHVlIHRvIEludHJvc3BlY3Rpb24KPiBpbnRlcmNlcHRpbmcgdGhl
IGluc3RydWN0aW9uLCBvciBmcm9tIHg4Nl9lbXVsYXRlKCkgd2lsbCBoYXZlICVyaXAgdXBkYXRl
ZCBhcwo+IGEgY29uc2VxdWVuY2Ugb2YgcGFydGlhbCBlbXVsYXRpb24gcmVxdWlyZWQgdG8gaW5q
ZWN0IGFuIElDRUJQIGV2ZW50IGluIHRoZQo+IGZpcnN0IHBsYWNlLgo+IAo+IFdlIGNvdWxkIGlu
IHByaW5jaXBsZSBzcG90IHRoZSBub24taW5qZWN0ZWQgY2FzZSBpbiB0aGUgVEFTS19TV0lUQ0gg
aGFuZGxlciwKPiBidXQgdGhpcyBzdGlsbCByZXN1bHRzIGluIGNvbXBsZXhpdHkgaWYgdGhlIElD
RUJQIGluc3RydWN0aW9uIGFsc28gaGFzIGFuCj4gSW5zdHJ1Y3Rpb24gQnJlYWtwb2ludCBhY3Rp
dmUgb24gaXQgKHdoaWNoIGdlbnVpbmVseSBoYXMgZmF1bHQgc2VtYW50aWNzKS4KPiAKPiBVbmNv
bmRpdGlvbmFsbHkgaW50ZXJjZXB0IElDRUJQLiAgVGhpcyBkb2VzIGhhdmUgYSB0cmFwIHNlbWFu
dGljcyBmb3IgdGhlCj4gaW50ZXJjZXB0LCBhbmQgYWxsb3dzIHVzIHRvIG1vdmUgJXJpcCBmb3J3
YXJkcyBhcHByb3ByaWF0ZWx5IGJlZm9yZSB0aGUKPiBUQVNLX1NXSVRDSCBpbnRlcmNlcHQgaXMg
aGl0LgoKQm90aCBiZWNhdXNlIG9mIHlvdSBtZW50aW9uaW5nIHRoZSBtb3ZpbmcgZm9yd2FyZHMg
b2YgJXJpcCBhbmQgd2l0aCB0aGUKaXJjIGRpc2N1c3Npb24gaW4gbWluZCB0aGF0IHdlIGhhZCBu
byBpcmMsIGRvbid0IHlvdSBtZWFuICJmYXVsdApzZW1hbnRpY3MiIGhlcmU/IElmIHNvClJldmll
d2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ck90aGVyd2lzZSBJIGd1ZXNz
IEknbSBzdGlsbCBtaXNzaW5nIHNvbWV0aGluZy4KCj4gLS0tCj4gIHhlbi9hcmNoL3g4Ni9odm0v
c3ZtL3N2bS5jICAgIHwgMTkgLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICB4ZW4vYXJjaC94ODYvaHZt
L3N2bS92bWNiLmMgICB8ICAyICstCj4gIHhlbi9hcmNoL3g4Ni9tb25pdG9yLmMgICAgICAgIHwg
IDMgLS0tCj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2bS5oIHwgMTEgLS0tLS0tLS0tLS0K
PiAgNCBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMzQgZGVsZXRpb25zKC0pCgpUaGlz
LCBvZiBjb3Vyc2UsIGlzIHByZXR0eSBuaWNlIGluIGFueSBldmVudC4KCkphbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
