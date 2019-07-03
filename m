Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 862FC5E588
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 15:30:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hifIh-0006zG-2V; Wed, 03 Jul 2019 13:27:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZJKH=VA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hifIf-0006z8-C8
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 13:27:53 +0000
X-Inumbo-ID: 5b00cb14-9d96-11e9-b756-b34642fb93b0
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5b00cb14-9d96-11e9-b756-b34642fb93b0;
 Wed, 03 Jul 2019 13:27:51 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6blPwf3/8PTYBAr5+SRnZsWwIv0juXF1rYJY5A3QLH9bZDQ0rtMGc3bXO85cWAzKug9Wq/msOS
 AM71BkoF0HnHIIXqyszf6xgiqNIoiShmt0mhVQwNWSUrCrrpuTHbYBCQf6x5M4J8zq9ru76bpv
 CeVM53xu/QteoMQk4hIImw8kwi4fPi7np5l+X1RfHQHJICdq58Cb3RIVq8TGzOlr4+UIDDfDmJ
 inonHEdAxDv5Wmi7qkQ6cib4Qq4PSdp9C9wrH+QvoMVDkANN2s/B8vTvmCMDFLgYkqiGzF8/4v
 MHQ=
X-SBRS: 2.7
X-MesageID: 2555985
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,446,1557201600"; 
   d="scan'208";a="2555985"
To: Jan Beulich <JBeulich@suse.com>, Petre Ovidiu PIRCALABU
 <ppircalabu@bitdefender.com>, Paul Durrant <Paul.Durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <19d3bbfa82ffe542367c676d83db65e37d013544.camel@bitdefender.com>
 <e277e40ad1c54b209a6f6107cbfaf5a0@AMSPEX02CL03.citrite.net>
 <527abac0d7a9a25bb69c7af30afa8ab209c90737.camel@bitdefender.com>
 <f753b819-d5eb-f627-3520-38c36e6d48d2@citrix.com>
 <e76f8645-5963-3df6-320c-37cd16455372@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <b4c392f0-9ffb-05c5-ca54-dffca4dbebae@citrix.com>
Date: Wed, 3 Jul 2019 14:27:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <e76f8645-5963-3df6-320c-37cd16455372@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] vfree crash
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
Cc: Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEvMDcvMjAxOSAxMTo0NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDEuMDcuMjAxOSAx
MDo1NiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDEvMDcvMjAxOSAwOTo0NSwgUGV0cmUg
T3ZpZGl1IFBJUkNBTEFCVSB3cm90ZToKPj4+IFRoZSBwcm9ibGVtIGxpZXMgd2l0aCB2ZnJlZSBi
ZWNhdXNlIGl0IGNyZWF0ZXMgYSBuZXcgbGlzdCB3aXRoIHRoZQo+Pj4gcGFnZXMsIHVubWFwcyB0
aGUgdmEgcG9pbnRlciBhbmQgdGhlbiBmcmVlcyB0aGUgcGFnZXMuIElmIEkgZG8gdGhlc2UKPj4+
IHN0ZXBzIG1hbnVhbGx5ICh3aXRob3V0IGFkZGluZyB0aGVtIHRvIGEgbmV3IGxpc3QpIGl0IHdv
cmtzLgo+PiBUaGUgcHJvYmxlbSBoZXJlIGlzIHRoYXQgc3RydWN0IHBhZ2VfaW5mbyBvbmx5IGhh
cyBhIHNpbmdsZSBsaW5rZWQgbGlzdAo+PiBwb2ludGVyLCBhbmQgdmZyZWUoKSBibGluZGx5IGFz
c3VtZXMgaXQgaXMgYXZhaWxhYmxlIGZvciB1c2UsIHdoaWNoCj4+IGlzbid0IHRydWUgb25jZSB5
b3UndmUgY2FsbGVkIGFzc2lnbl9wYWdlcygpIG9uIHRoZSB2bWFwIGFyZWEuCj4+Cj4+IEF0IHRo
ZSBtb21lbnQsIGl0IGRvZXNuJ3QgbG9vayBsaWtlIGl0IGlzIHBvc3NpYmxlIHRvIHNldCB2KmFs
bG9jKCknZAo+PiBwYWdlcyB1cCBzdWl0YWJseSB0byBiZSBtYXBwZWQgYnkgYSBndWVzdC7CoCAo
U2ltaWxhciBjb3JydXB0aW9uIHdpbGwKPj4gb2NjdXIgdmlhIHNoYXJlX3hlbl9wYWdlX3dpdGhf
Z3Vlc3QoKSBhbmQgdGhlIHhlbmhlYXAgbGlzdCkuCj4gV2VsbCwgd2hvZXZlciBhc3NpZ25zIHBh
Z2VzIHRvIGEgZG9tYWluIGJlaGluZCB2bWFsbG9jKCkncyBiYWNrIGhhcyBnb3QKPiB0byBtYWtl
IHN1cmUgdG8gZGUtYXNzaWduIHRob3NlIHBhZ2VzIGJlZm9yZSBmcmVlaW5nIHRoZW0uCgpXaHk/
wqAgT3IgcGVyaGFwcyBtb3JlIGFjY3VyYXRlbHksIHdoZXJlIGlzIGFueSBvZiB0aGlzIHdyaXR0
ZW4gZG93bi4KCkFsbG9jYXRpb24gb2YgbWVtb3J5IHNlZW1zIGxvZ2ljYWxseSB1bnJlbGF0ZWQg
dG8gbWFraW5nIGl0IG1hcHBhYmxlIGJ5Cmd1ZXN0cywgc28gd2hlbiB2bWFsbG9jKCkgKmlzKiB0
aGUgY29ycmVjdCBhbGxvY2F0aW9uIGZ1bmN0aW9uIHRvIHVzZSwKdGhlIGZhY3QgdGhhdCBhc3Np
Z25fcGFnZXMoKSByZXN1bHRzIGluIHZmcmVlKCkgc2lsZW50bHkgY29ycnVwdGluZyB0aGUKZG9t
YWlucyBtZW1vcnkgbGlzdCBpcyB1bmV4cGVjdGVkIGJlaGF2aW91ci4KCj4gQW4gYWx0ZXJuYXRp
dmUKPiBfbWlnaHRfIGJlIHRvIGxlYXZlIGZyZWVpbmcgdG8gdGhlIG5vcm1hbCBjbGVhbnVwIHBy
b2Nlc3NlcyAod2hlbiB0aGUKPiBsYXN0IHBhZ2UgcmVmIGdldHMgcHV0KSwgYW5kIGp1c3QgdnVu
bWFwKCktaW5nIHRoZSByYW5nZSB3aGVuIHRoZSBtYXBwaW5nCj4gaXNuJ3QgbmVlZGVkIGFueW1v
cmUuCgpTbyB0aGlzIGlzIHdoYXQgSSBzdWdnZXN0ZWQgYXMgYW4gaW50ZXJpbSBzb2x1dGlvbiwg
YnV0IEknbSBub3Qgc3VyZSBpZgppdCBpcyBhIHNlbnNpYmxlIG9wdGlvbiBsb25ndGVybS4KClRo
ZSBzY2VuYXJpbyBoZXJlIGlzIGZvciB0aGUgInZtLWV2ZW50LW5nIiBpbnRlcmZhY2Ugd2hpY2gg
d2FzIHBvc3RlZCBhcwphbiBSRkMgZWFybGllci7CoCBTZXZlcmFsIGtleSBwdXJwb3NlcyBmb3Ig
dGhlIG5ldyBpbnRlcmZhY2UgaXMgdG8gYmUgYQpzbG90LXBlci12Y3B1LCBhbmQgdG8gYmUgdXNh
YmxlIHZpYSB0aGUgYWNxdWlyZV9yZXNvdXJjZSBpbmZyYXN0cnVjdHVyZS4KCnN0cnVjdCB2bV9l
dmVudF9zdCBpcyBjdXJyZW50bHkgMzg0IGJ5dGVzLCB3aGljaCBpcyBvbmx5IDEwIGZ1bGwgc3Ry
dWN0cwpwZXIgcGFnZS7CoCBUaGUgc2l6ZSBvZiB0aGUgc3RydWN0dXJlIGlzIGxpYWJsZSB0byBj
aGFuZ2Ugb3ZlciB0aW1lLCBhbmQKbW9zdCBsaWtlbHkgd29uJ3QgZXZlbmx5IGRpdmlkZSBhIHBh
Z2UsIHNvIHZtYWxsb2MoKSBpcyB0aGUgY29ycmVjdAphbGxvY2F0aW9uIGludGVyZmFjZSB3aXRo
aW4gWGVuLgoKVGhlIGFsbG9jIGFuZCBmcmVlIGluIHRoaXMgY2FzZSBpcyBiZWluZyBkb25lIGFz
IGEgc2lkZSBlZmZlY3Qgb2YgdGhlCnZtaSBlbmFibGUvZGlzYWJsZSBjYWxscy7CoCBUaGUgbGlm
ZXRpbWUgb2YgdGhlIFZNSSBpbnRlcmZhY2UgaXNuJ3QgdGhlCnNhbWUgYXMgdGhlIGxpZmV0aW1l
IG9mIHRoZSBWTS4KCldpdGggSFZJIHNwZWNpZmljYWxseSwgdGhlIFNWQSBWTSBjYW4gcmVib290
LCBhbmQgaXQgbmVlZHMgdG8gcmUtYXR0YWNoCnRvIHRoZSBwcm90ZWN0ZWQgVk1zLsKgIFRoZXJl
IGFyZSBvdGhlciBsb2FkIGJhbGFuY2luZyBzY2VuYXJpb3Mgd2hlcmUKdGhlIHByb3RlY3Rpb24g
b2YgYSBWTSBtaWdodCBsb2dpY2FsbHkgbW92ZSBiZXR3ZWVuIHR3byBkaWZmZXJlbnQgU1ZBcy4K
CkluIGVpdGhlciBjYXNlLCByZXRhaW5pbmcgdGhlIGZpcnN0IHZtYWxsb2MoKSB3aWxsIHJlc3Vs
dCBpbiBhIGZhaWx1cmUKdG8gcmVtYXAgdGhlIHJpbmcsIGFzIHRoZSBkb21haW4gYXNzaWdubWVu
dCB3aWxsIGJlIHRvIHRoZSBvbGQgZG9taWQuCgpUaGVyZWZvcmUsIEkgdGhpbmsgaXQgaXMgaW1w
b3J0YW50IHRvIGJlIGFibGUgdG8gZnVsbHkgZGlzYWJsZSBhbmQgY2xlYW4KdXAgdGhlIFZNSSBp
bnRlcmZhY2UgYXQgc29tZSBwb2ludCBiZWZvcmUgdGhlIHByb3RlY3RlZCBWTSBpcyBkZXN0cm95
ZWQuCgpBcyBhIHJlc3VsdCwgSSB0aGluayB0aGUgcHJvcGVyIGZpeCBoZXJlIGlzIHRvIG1vZGlm
eSB2ZnJlZSgpIG5vdCB0bwpjbG9iYmVyIHRoZSBwYWdlbGlzdC4KClRob3VnaHRzPwoKfkFuZHJl
dwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
