Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E3617BF89
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 14:49:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jADKZ-00067C-AP; Fri, 06 Mar 2020 13:47:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jADKY-000674-8Q
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 13:47:58 +0000
X-Inumbo-ID: 16062e54-5fb1-11ea-8eb5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16062e54-5fb1-11ea-8eb5-bc764e2007e4;
 Fri, 06 Mar 2020 13:47:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6F653AE6F;
 Fri,  6 Mar 2020 13:47:56 +0000 (UTC)
To: Paul Durrant <xadimgnik@gmail.com>
References: <20200305124504.3564-1-pdurrant@amzn.com>
 <20200305124504.3564-4-pdurrant@amzn.com>
 <7d66a1b0-ca7b-500b-73c4-140ab32f0c4e@suse.com>
 <d49c47b701af4198bdb113dfe11ee08f@EX13D32EUC003.ant.amazon.com>
 <008c1b23-e347-2306-4ca7-e9b84aeabec6@suse.com>
 <001101d5f3bd$74b2c8a0$5e1859e0$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3d03da64-5414-d035-e4a6-46401a84175e@suse.com>
Date: Fri, 6 Mar 2020 14:47:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <001101d5f3bd$74b2c8a0$5e1859e0$@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 3/6] x86 / pv: do not treat PGC_extra
 pages as RAM when constructing dom0
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
Cc: 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 "'Durrant, Paul'" <pdurrant@amazon.co.uk>, xen-devel@lists.xenproject.org,
 pdurrant@amzn.com, =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDMuMjAyMCAxNDo0NSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3Rz
LnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFuIEJldWxpY2gKPj4gU2VudDogMDYgTWFy
Y2ggMjAyMCAxMzozOQo+PiBUbzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVr
Pgo+PiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47Cj4+IHBkdXJy
YW50QGFtem4uY29tOyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4g
U3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2MyAzLzZdIHg4NiAvIHB2OiBkbyBub3Qg
dHJlYXQgUEdDX2V4dHJhIHBhZ2VzIGFzIFJBTSB3aGVuCj4+IGNvbnN0cnVjdGluZyBkb20wCj4+
Cj4+IE9uIDA2LjAzLjIwMjAgMTM6MDMsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4+Pj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4+PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3Vu
Y2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFuIEJldWxpY2gKPj4+PiBT
ZW50OiAwNiBNYXJjaCAyMDIwIDExOjU2Cj4+Pj4gVG86IHBkdXJyYW50QGFtem4uY29tCj4+Pj4g
Q2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgRHVycmFudCwgUGF1bCA8cGR1cnJh
bnRAYW1hem9uLmNvLnVrPjsgUm9nZXIgUGF1IE1vbm7DqQo+Pj4+IDxyb2dlci5wYXVAY2l0cml4
LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgo+Pj4+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggdjMgMy82
XSB4ODYgLyBwdjogZG8gbm90IHRyZWF0IFBHQ19leHRyYSBwYWdlcyBhcyBSQU0gd2hlbgo+Pj4+
IGNvbnN0cnVjdGluZyBkb20wCj4+Pj4KPj4+PiBPbiAwNS4wMy4yMDIwIDEzOjQ1LCBwZHVycmFu
dEBhbXpuLmNvbSB3cm90ZToKPj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQu
Ywo+Pj4+PiArKysgYi94ZW4vYXJjaC94ODYvcHYvZG9tMF9idWlsZC5jCj4+Pj4+IEBAIC03OTIs
NiArNzkyLDEwIEBAIGludCBfX2luaXQgZG9tMF9jb25zdHJ1Y3RfcHYoc3RydWN0IGRvbWFpbiAq
ZCwKPj4+Pj4gICAgICB7Cj4+Pj4+ICAgICAgICAgIG1mbiA9IG1mbl94KHBhZ2VfdG9fbWZuKHBh
Z2UpKTsKPj4+Pj4gICAgICAgICAgQlVHX09OKFNIQVJFRF9NMlAoZ2V0X2dwZm5fZnJvbV9tZm4o
bWZuKSkpOwo+Pj4+PiArCj4+Pj4+ICsgICAgICAgIGlmICggcGFnZS0+Y291bnRfaW5mbyAmIFBH
Q19leHRyYSApCj4+Pj4+ICsgICAgICAgICAgICBjb250aW51ZTsKPj4+Pgo+Pj4+IFRoaXMgc3Vy
ZWx5IGlzIGEgcGF0dGVybiwgaS5lLiB0aGVyZSBhcmUgbW9yZSBzaW1pbGFyIGNoYW5nZXMgdG8K
Pj4+PiBtYWtlOiB0Ym9vdF9nZW5fZG9tYWluX2ludGVncml0eSgpIGUuZy4gaWdub3JlcyBkLT54
ZW5wYWdlX2xpc3QsCj4+Pj4gYW5kIGhlbmNlIHdpdGggdGhlIGdvYWwgb2YgY29udmVydGluZyB0
aGUgc2hhcmVkIGluZm8gcGFnZSB3b3VsZAo+Pj4+IGFsc28gd2FudCBhZGp1c3RtZW50LiBGb3Ig
ZHVtcF9udW1hKCkgaXQgbWF5IGJlIGxlc3MgaW1wb3J0YW50LAo+Pj4+IGJ1dCBpdCB3b3VsZCBz
dGlsbCBsb29rIG1vcmUgY29ycmVjdCBpZiBpdCB0b28gZ290IGNoYW5nZWQuCj4+Pj4gYXVkaXRf
cDJtKCkgbWlnaHQgYXBwYXJlbnRseSBjb21wbGFpbiBhYm91dCBzdWNoIHBhZ2VzIChhbmQKPj4+
PiBoZW5jZSBtaWdodCBiZSBhIHByb2JsZW0gd2l0aCB0aGUgb25lIFBHQ19leHRyYSBwYWdlIFZN
WCBkb21haW5zCj4+Pj4gbm93IGhhdmUpLiBBbmQgdGhpcyBpcyBvbmx5IGZyb20gbWUgbG9va2lu
ZyBhdAo+Pj4+IHBhZ2VfbGlzdF9mb3JfZWFjaCguLi4sICZkLT5wYWdlX2xpc3QpIGNvbnN0cnVj
dHM7IHdobyBrbm93cwo+Pj4+IHdoYXQgZWxzZSB0aGVyZSBpcy4KPj4+Pgo+Pj4KPj4+IFRob3Nl
IGFyZSBkZWFsdCB3aXRoIGJ5IHRoZSBpc19zcGVjaWFsX3BhZ2UoKSBwYXRjaCBsYXRlciBvbiBJ
IHRoaW5rLgo+Pgo+PiBIYXZpbmcgYWxyZWFkeSBsb29rZWQgYXQgdGhhdCBwYXRjaCBhcyB3ZWxs
IC0gSSBkb24ndCB0aGluayBzbywgbm8uCj4+IFRoYXQgb25lIG9ubHkgcmVwbGFjZXMgdXNlcyBv
ZiBpc194ZW5faGVhcF9wYWdlKCksIGJ1dCBkb2Vzbid0IGFkZAo+PiBhbnkgY2hlY2tzIHdoZXJl
IHN1Y2ggdXNlcyBzaW1wbHkgYXJlbid0IG5lZWRlZCBiZWNhdXNlIGNvZGUgaXMKPj4gbG9va2lu
ZyBhdCAtPnBhZ2VfbGlzdCBvbmx5Lgo+IAo+IFdlbGwsIEkgZGlkIHNheToKPiAKPiAiSXQgZGlk
bid0IHNlZW0gYXBwcm9wcmlhdGUgdG8gdXNlIHRoYXQgbWFjcm8gaGVyZSB0aG91Z2ggc2luY2Ug
d2UKPiBrbm93IHBhZ2VzIG9uIHRoZSBwYWdlIGxpc3QgY2Fubm90IGJlIHhlbmhlYXAgcGFnZXMu
IgoKQW5kIEkgYWdyZWUgYW5kIHVuZGVyc3RhbmQuCgo+IGkuZS4gYW4gb3BlbiBjb2RlZCBjaGVj
ayBoZXJlIHNlZW1zIGxpa2UgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvLgoKSW5kZWVkLgoKPiBJZiBJ
J3ZlIG1pc3NlZCBvdGhlciBwbGFjZXMgd2hlcmUgSSBuZWVkIHRvIGFjY291bnQgZm9yIHBhZ2Vz
IHdoaWNoCj4gYXJlIHNwZWNpZmljYWxseSBQR0NfZXh0cmEgcGFnZXMgdGhlbiBJJ2xsIG5lZWQg
dG8gZml4IHRoZW0gc2ltaWxhcmx5LgoKWWVzIHBsZWFzZS4gVGhhbmtzLgoKSmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
