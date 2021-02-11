Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1946F3194B0
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 21:48:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84062.157565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAIrj-0007He-Lr; Thu, 11 Feb 2021 20:47:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84062.157565; Thu, 11 Feb 2021 20:47:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAIrj-0007HF-IM; Thu, 11 Feb 2021 20:47:07 +0000
Received: by outflank-mailman (input) for mailman id 84062;
 Thu, 11 Feb 2021 20:47:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZS85=HN=amazon.de=prvs=669fce943=nmanthey@srs-us1.protection.inumbo.net>)
 id 1lAIrh-0007HA-CL
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 20:47:05 +0000
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74546eaa-d682-41f2-9d06-66b45f8f8a19;
 Thu, 11 Feb 2021 20:47:04 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-c300ac87.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 11 Feb 2021 20:46:56 +0000
Received: from EX13D02EUB001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2b-c300ac87.us-west-2.amazon.com (Postfix) with ESMTPS
 id A2ABCA21E9; Thu, 11 Feb 2021 20:46:55 +0000 (UTC)
Received: from u6fc700a6f3c650.ant.amazon.com (10.43.160.146) by
 EX13D02EUB001.ant.amazon.com (10.43.166.150) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 11 Feb 2021 20:46:51 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 74546eaa-d682-41f2-9d06-66b45f8f8a19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1613076424; x=1644612424;
  h=to:cc:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding:subject;
  bh=qKTds+BDTK7/bjIL7gaXgqoG6yKodT76dFOIrx+0QP0=;
  b=c3GBimdUc2fVi+7ty4C886WeqpHUtwznlWlg51QsGhl7+p8icYt9FA0Y
   B13ZdKG6T2C9qdgilbqsWBUynIPsSedP7PwlVQzwEnM3Fq8eZgtTIp9oq
   f9ngS66Lhqk0c8m/ve71rQTXqD5PZp0dUN1B+8EVXdQG9dG8+wzYg6qMw
   I=;
X-IronPort-AV: E=Sophos;i="5.81,171,1610409600"; 
   d="scan'208";a="82252665"
Subject: Re: [PATCH HVM v2 1/1] hvm: refactor set param
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
	<xen-devel@lists.xenproject.org>
References: <20210205203905.8824-1-nmanthey@amazon.de>
 <edf1cd78-2192-2679-9a34-804c5d7b75c5@suse.com>
 <ba146cd6-fd5a-78d8-40bc-59885d265f5f@amazon.de>
 <b8529792-3d99-2e0d-7ebe-31c2c406145f@suse.com>
 <9f753ee9-73c5-aa2c-3c68-eed7e0c2608b@amazon.de>
 <a52cb2ac-fa85-73cd-0c53-3ee002d6b3ea@suse.com>
 <adee7548-0a60-d7d1-731f-474a585edf6c@amazon.de>
 <1a50a8c3-44f5-9ea9-7ff1-0d716bc05ebd@suse.com>
From: Norbert Manthey <nmanthey@amazon.de>
Autocrypt: addr=nmanthey@amazon.de; prefer-encrypt=mutual; keydata=
 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
 pEddsOqYwOs=
Message-ID: <d2a5c3a5-d163-3ee9-50ff-0083bd52c374@amazon.de>
Date: Thu, 11 Feb 2021 21:46:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1a50a8c3-44f5-9ea9-7ff1-0d716bc05ebd@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
X-Originating-IP: [10.43.160.146]
X-ClientProxiedBy: EX13D22UWC004.ant.amazon.com (10.43.162.198) To
 EX13D02EUB001.ant.amazon.com (10.43.166.150)
Precedence: Bulk
Content-Transfer-Encoding: base64

T24gMi85LzIxIDM6MjEgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA5LjAyLjIwMjEgMTQ6
NTYsIE5vcmJlcnQgTWFudGhleSB3cm90ZToKPj4gT24gMi85LzIxIDI6NDUgUE0sIEphbiBCZXVs
aWNoIHdyb3RlOgo+Pj4gT24gMDkuMDIuMjAyMSAxNDo0MSwgTm9yYmVydCBNYW50aGV5IHdyb3Rl
Ogo+Pj4+IE9uIDIvOS8yMSAxMDo0MCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDA4
LjAyLjIwMjEgMjA6NDcsIE5vcmJlcnQgTWFudGhleSB3cm90ZToKPj4+Pj4+IE9uIDIvOC8yMSAz
OjIxIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+PiBPbiAwNS4wMi4yMDIxIDIxOjM5LCBO
b3JiZXJ0IE1hbnRoZXkgd3JvdGU6Cj4+Pj4+Pj4+IEBAIC00MTA4LDYgKzQxMDgsMTMgQEAgc3Rh
dGljIGludCBodm1fYWxsb3dfc2V0X3BhcmFtKHN0cnVjdCBkb21haW4gKmQsCj4+Pj4+Pj4+ICAg
ICAgaWYgKCByYyApCj4+Pj4+Pj4+ICAgICAgICAgIHJldHVybiByYzsKPj4+Pj4+Pj4KPj4+Pj4+
Pj4gKyAgICBpZiAoIGluZGV4ID49IEhWTV9OUl9QQVJBTVMgKQo+Pj4+Pj4+PiArICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsKPj4+Pj4+Pj4gKwo+Pj4+Pj4+PiArICAgIC8qIE1ha2Ugc3VyZSB3ZSBl
dmFsdWF0ZSBwZXJtaXNzaW9ucyBiZWZvcmUgbG9hZGluZyBkYXRhIG9mIGRvbWFpbnMuICovCj4+
Pj4+Pj4+ICsgICAgYmxvY2tfc3BlY3VsYXRpb24oKTsKPj4+Pj4+Pj4gKwo+Pj4+Pj4+PiArICAg
IHZhbHVlID0gZC0+YXJjaC5odm0ucGFyYW1zW2luZGV4XTsKPj4+Pj4+Pj4gICAgICBzd2l0Y2gg
KCBpbmRleCApCj4+Pj4+Pj4+ICAgICAgewo+Pj4+Pj4+PiAgICAgIC8qIFRoZSBmb2xsb3dpbmcg
cGFyYW1ldGVycyBzaG91bGQgb25seSBiZSBjaGFuZ2VkIG9uY2UuICovCj4+Pj4+Pj4gSSBkb24n
dCBzZWUgdGhlIG5lZWQgZm9yIHRoZSBoZWF2aWVyIGJsb2NrX3NwZWN1bGF0aW9uKCkgaGVyZTsK
Pj4+Pj4+PiBhZmFpY3QgYXJyYXlfYWNjZXNzX25vc3BlYygpIHNob3VsZCBkbyBmaW5lLiBUaGUg
c3dpdGNoKCkgaW4KPj4+Pj4+PiBjb250ZXh0IGFib3ZlIGFzIHdlbGwgYXMgdGhlIHN3aXRjaCgp
IGZ1cnRoZXIgZG93biBpbiB0aGUKPj4+Pj4+PiBmdW5jdGlvbiBkb24ndCBoYXZlIGFueSBzcGVj
dWxhdGlvbiBzdXNjZXB0aWJsZSBjb2RlLgo+Pj4+Pj4gVGhlIHJlYXNvbiB0byBibG9jayBzcGVj
dWxhdGlvbiBpbnN0ZWFkIG9mIGp1c3QgdXNpbmcgdGhlIGhhcmRlbmVkIGluZGV4Cj4+Pj4+PiBh
Y2Nlc3MgaXMgdG8gbm90IGFsbG93IHRvIHNwZWN1bGF0aXZlbHkgbG9hZCBkYXRhIGZyb20gYW5v
dGhlciBkb21haW4uCj4+Pj4+IE9rYXksIGxvb2tzIGxpa2UgSSBnb3QgbWlzbGVhZCBieSB0aGUg
YWRkZWQgYm91bmRzIGNoZWNrLiBXaHkKPj4+Pj4gZG8geW91IGFkZCB0aGF0LCB3aGVuIHRoZSBz
b2xlIGNhbGxlciBhbHJlYWR5IGhhcyBvbmU/IEl0J2xsCj4+Pj4+IHN1ZmZpY2Ugc2luY2UgeW91
IG1vdmUgdGhlIGFycmF5IGFjY2VzcyBwYXN0IHRoZSBiYXJyaWVyLAo+Pj4+PiB3b24ndCBpdD8K
Pj4+PiBJIGNhbiBkcm9wIHRoYXQgYm91bmQgY2hlY2sgYWdhaW4uIFRoaXMgd2FzIGFkZGVkIHRv
IG1ha2Ugc3VyZSBvdGhlcgo+Pj4+IGNhbGxlcnMgd291bGQgYmUgc2F2ZSBhcyB3ZWxsLiBUaGlu
a2luZyBhYm91dCB0aGlzIGEgbGl0dGxlIG1vcmUsIHRoZQo+Pj4+IGNoZWNrIGNvdWxkIGFjdHVh
bGx5IGJlIG1vdmVkIGludG8gdGhlIGh2bV9hbGxvd19zZXRfcGFyYW0gZnVuY3Rpb24sCj4+Pj4g
YWJvdmUgdGhlIGZpcnN0IGluZGV4IGFjY2VzcyBpbiB0aGF0IGZ1bmN0aW9uLiBBcmUgdGhlcmUg
Z29vZCByZWFzb25zIHRvCj4+Pj4gbm90IG1vdmUgdGhlIGluZGV4IGNoZWNrIGludG8gdGhlIGFs
bG93IGZ1bmN0aW9uPwo+Pj4gSSBndWVzcyBJJ20gY29uZnVzZWQ6IFdlJ3JlIHRhbGtpbmcgYWJv
dXQgZHJvcHBpbmcgdGhlIGNoZWNrCj4+PiB5b3UgYWRkIHRvIGh2bV9hbGxvd19zZXRfcGFyYW0o
KSBhbmQgeW91IHN1Z2dlc3QgdG8gIm1vdmUiIGl0Cj4+PiByaWdodCB0aGVyZT8KPj4gWWVzLiBJ
IGNhbiBlaXRoZXIganVzdCBubyBpbnRyb2R1Y2UgdGhhdCBjaGVjayBpbiB0aGF0IGZ1bmN0aW9u
ICh3aGljaAo+PiBpcyB3aGF0IHlvdSBzdWdnZXN0ZWQpLiBBcyBhbiBhbHRlcm5hdGl2ZSwgdG8g
aGF2ZSBhbGwgY2hlY2tzIGluIG9uZQo+PiBmdW5jdGlvbiwgSSBwcm9wb3NlZCB0byBpbnN0ZWFk
IG1vdmUgaXQgaW50byBodm1fYWxsb3dfc2V0X3BhcmFtLgo+IE9oLCBJIHNlZS4gV2hhdCBJJ2Qg
bGlrZSB0byBiZSB0aGUgcmVzdWx0IG9mIHlvdXIgcmUtYXJyYW5nZW1lbnQgaXMKPiBzeW1tZXRy
eSBiZXR3ZWVuICJnZXQiIGFuZCAic2V0IiB3aGVyZSBwb3NzaWJsZSBpbiB0aGlzIHJlZ2FyZCwg
YW5kCj4gYXN5bW1ldHJ5IGhhdmluZyBhIGNsZWFyIHJlYXNvbi4gU2VlaW5nIHRoYXQgaHZtX3tn
ZXQsc2V0fV9wYXJhbSgpCj4gYXJlIHRoZSBub24tc3RhdGljIGZ1bmN0aW9ucyBoZXJlLCBJIHRo
aW5rIGl0IHdvdWxkIGJlIHF1aXRlCj4gZGVzaXJhYmxlIGZvciB0aGUgYm91bmRzIGNoZWNraW5n
IHRvIGxpdmUgdGhlcmUuIFNpbmNlCj4gaHZtX2FsbG93X3tnZXQsc2V0fV9wYXJhbSgpIGFyZSBz
cGVjaWZpY2FsbHkgaGVscGVycyBvZiB0aGUgdHdvCj4gZWFybGllciBuYW1lZCBmdW5jdGlvbnMs
IGNoZWNrcyBjb25zaXN0ZW50bHkgbGl2aW5nIHRoZXJlIHdvdWxkIGFzCj4gd2VsbCBiZSBmaW5l
IHdpdGggbWUuCgpJIGFncmVlIHdpdGggdGhlIHN5bW1ldHJ5IGZvciBnZXQgYW5kIHNldC4gVGhp
cyBpcyB3aGF0IEknZCBhaW0gZm9yOgoKwqAxLiBodm1vcF9zZXRfcGFyYW0gYW5kIGh2bW9wX2dl
dF9wYXJhbSAoc3RhdGljKSBib3RoIGNoZWNrIGZvciB0aGUKaW5kZXgsIGFuZCBhZnRlcndhcmRz
IHVzZSB0aGUgaXNfaHZtX2RvbWFpbihkKSBmdW5jdGlvbiB3aXRoIGl0cyBiYXJyaWVyCsKgMi4g
aHZtX3NldF9wYXJhbSAoc3RhdGljKSBhbmQgaHZtX2dldF9wYXJhbSBib3RoIGNhbGwgdGhlaXIg
YWxsb3cKaGVscGVyIGZ1bmN0aW9uLCBldmFsdWF0ZSB0aGUgcmV0dXJuIGNvZGUsIGFuZCBhZnRl
cndhcmRzIGJsb2NrIHNwZWN1bGF0aW9uLgrCoDIuMS4gaHZtX2dldF9wYXJhbSBpcyBkZWNsYXJl
ZCBpbiBhIHB1YmxpYyBoZWFkZXIsIGFuZCBjYW5ub3QgYmUgdHVybmVkCmludG8gYSBzdGF0aWMg
ZnVuY3Rpb24sIGhlbmNlIG5lZWRzIHRoZSBpbmRleCBjaGVjawrCoDIuMi4gaHZtX3NldF9wYXJh
bSBpcyBvbmx5IGNhbGxlZCBmcm9tIGh2bW9wX3NldF9wYXJhbSwgYW5kIGluZGV4IGlzCmFscmVh
ZHkgY2hlY2tlZCB0aGVyZSwgaGVuY2UsIGRvIG5vdCBhZGQgY2hlY2sKwqAzLiBodm1fYWxsb3df
c2V0X3BhcmFtIChzdGF0aWMpIGFuZCBodm1fYWxsb3dfZ2V0X3BhcmFtIChzdGF0aWMpIGRvIG5v
dAp2YWxpZGF0ZSB0aGUgaW5kZXggcGFyYW1ldGVyCsKgMy4xLiBodm1fYWxsb3dfc2V0X3BhcmFt
IGJsb2NrcyBzcGVjdWxhdGl2ZSBleGVjdXRpb24gd2l0aCBhIGJhcnJpZXIKYWZ0ZXIgZG9tYWlu
IHBlcm1pc3Npb25zIGhhdmUgYmVlbiBldmFsdWF0ZWQsIGJlZm9yZSBhY2Nlc3NpbmcgdGhlCnBh
cmFtZXRlcnMgb2YgdGhlIGRvbWFpbi4gaHZtX2FsbG93X2dldF9wYXJhbSBkb2VzIG5vdCBhY2Nl
c3MgdGhlIHBhcmFtcwptZW1iZXIgb2YgdGhlIGRvbWFpbiwgYW5kIGhlbmNlIGRvZXMgbm90IHJl
cXVpcmUgYWRkaXRpb25hbCBwcm90ZWN0aW9uLgoKVG8gc2ltcGxpZnkgdGhlIGNvZGUsIEkgcHJv
cG9zZSB0byBmdXJ0aGVybW9yZSBtYWtlIHRoZSBodm1vcF9zZXRfcGFyYW0KZnVuY3Rpb24gc3Rh
dGljIGFzIHdlbGwuCgpQbGVhc2UgbGV0IG1lIGtub3cgd2hldGhlciB0aGUgYWJvdmUgd291bGQg
aXMgYWNjZXB0YWJsZS4KCkJlc3QsCk5vcmJlcnQKCj4KPiBKYW4KCgoKCkFtYXpvbiBEZXZlbG9w
bWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNj
aGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIEpvbmF0aGFuIFdlaXNzCkVpbmdl
dHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpT
aXR6OiBCZXJsaW4KVXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCg==


