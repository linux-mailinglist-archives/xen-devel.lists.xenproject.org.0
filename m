Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED242981A
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 14:34:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hU9Lk-0002wL-7t; Fri, 24 May 2019 12:31:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IEXw=TY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hU9Li-0002wG-Eg
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 12:31:02 +0000
X-Inumbo-ID: c9b7ab5a-7e1f-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c9b7ab5a-7e1f-11e9-8980-bc764e045a96;
 Fri, 24 May 2019 12:31:00 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: 0E4D3yCe61GvB6C0SG3ZYPUIzu4qIJD/QiTaD8F4E3XM4OjNOiC22bKincsSNvc5Y1wFGZNh9L
 K+zvNkLENOWiNd1vCcwPPUxY+LQlmw75I8jY39tTdQ75viSrkwZgeA0TipePxB8omBeBjFBUcj
 tvWLXts9SnaCfjZvlOZK4CWaGe465Ayd+khYbodVoGAbU0IlVXPZwLZWG1WP8VTJGirqJMmlRX
 faaOCsaSawIF0eAj6pZNu0ONii9OK4wtotDWtgPs8eIccIZ/Ujeclp5zgjUYYRztNMB9cqNrUk
 bfc=
X-SBRS: 2.7
X-MesageID: 857233
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,507,1549947600"; 
   d="scan'208";a="857233"
To: Jan Beulich <JBeulich@suse.com>, Juergen Gross <jgross@suse.com>
References: <20190522094549.28397-1-jgross@suse.com>
 <20190522094549.28397-2-jgross@suse.com>
 <5CE52014020000780023147E@prv1-mh.provo.novell.com>
 <316af0ff-904b-4cf7-1cb4-08c4ae69c4bd@suse.com>
 <5CE791650200007800231DEA@prv1-mh.provo.novell.com>
 <2a816b64-ae01-23e6-d287-1622e55bc295@suse.com>
 <5CE7ADCA0200007800231E77@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <7b83d3ab-238a-5262-d67c-4da9c4e4a283@citrix.com>
Date: Fri, 24 May 2019 13:30:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CE7ADCA0200007800231E77@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/3] xen: drop in_atomic()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQvMDUvMjAxOSAwOTozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjQuMDUuMTkg
YXQgMTA6MzQsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBPbiAyNC8wNS8yMDE5IDA4OjM4
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDI0LjA1LjE5IGF0IDA3OjQxLCA8amdyb3Nz
QHN1c2UuY29tPiB3cm90ZToKPj4+PiBPbiAyMi8wNS8yMDE5IDEyOjEwLCBKYW4gQmV1bGljaCB3
cm90ZToKPj4+Pj4+Pj4gT24gMjIuMDUuMTkgYXQgMTE6NDUsIDxqZ3Jvc3NAc3VzZS5jb20+IHdy
b3RlOgo+Pj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+Pj4+Pj4gKysrIGIveGVu
L2FyY2gveDg2L2h2bS9odm0uYwo+Pj4+Pj4gQEAgLTMxODUsMjIgKzMxODUsNiBAQCBzdGF0aWMg
ZW51bSBodm1fdHJhbnNsYXRpb25fcmVzdWx0IF9faHZtX2NvcHkoCj4+Pj4+PiAgCj4+Pj4+PiAg
ICAgIEFTU0VSVChpc19odm1fdmNwdSh2KSk7Cj4+Pj4+PiAgCj4+Pj4+PiAtICAgIC8qCj4+Pj4+
PiAtICAgICAqIFhYWCBEaXNhYmxlIGZvciA0LjEuMDogUFYtb24tSFZNIGRyaXZlcnMgd2lsbCBk
byBncmFudC10YWJsZSBvcHMKPj4+Pj4+IC0gICAgICogc3VjaCBhcyBxdWVyeV9zaXplLiBHcmFu
dC10YWJsZSBjb2RlIGN1cnJlbnRseSBkb2VzIGNvcHlfdG8vZnJvbV9ndWVzdAo+Pj4+Pj4gLSAg
ICAgKiBhY2Nlc3NlcyB1bmRlciB0aGUgYmlnIHBlci1kb21haW4gbG9jaywgd2hpY2ggdGhpcyB0
ZXN0IHdvdWxkIGRpc2FsbG93Lgo+Pj4+Pj4gLSAgICAgKiBUaGUgdGVzdCBpcyBub3QgbmVlZGVk
IHVudGlsIHdlIGltcGxlbWVudCBzbGVlcGluZy1vbi13YWl0cXVldWUgd2hlbgo+Pj4+Pj4gLSAg
ICAgKiB3ZSBhY2Nlc3MgYSBwYWdlZC1vdXQgZnJhbWUsIGFuZCB0aGF0J3MgcG9zdCA0LjEuMCBu
b3cuCj4+Pj4+PiAtICAgICAqLwo+Pj4+Pj4gLSNpZiAwCj4+Pj4+PiAtICAgIC8qCj4+Pj4+PiAt
ICAgICAqIElmIHRoZSByZXF1aXJlZCBndWVzdCBtZW1vcnkgaXMgcGFnZWQgb3V0LCB0aGlzIGZ1
bmN0aW9uIG1heSBzbGVlcC4KPj4+Pj4+IC0gICAgICogSGVuY2Ugd2UgYmFpbCBpbW1lZGlhdGVs
eSBpZiBjYWxsZWQgZnJvbSBhdG9taWMgY29udGV4dC4KPj4+Pj4+IC0gICAgICovCj4+Pj4+PiAt
ICAgIGlmICggaW5fYXRvbWljKCkgKQo+Pj4+Pj4gLSAgICAgICAgcmV0dXJuIEhWTVRSQU5TX3Vu
aGFuZGxlYWJsZTsKPj4+Pj4+IC0jZW5kaWYKPj4+Pj4gRGVhbGluZyB3aXRoIHRoaXMgVE9ETyBp
dGVtIGlzIG9mIGNvdXJzZSBtdWNoIGFwcHJlY2lhdGVkLCBidXQKPj4+Pj4gc2hvdWxkIGl0IHJl
YWxseSBiZSBkZWxldGVkIGFsdG9nZXRoZXI/IFRoZSBiaWctZG9tYWluLWxvY2sgaXNzdWUKPj4+
Pj4gaXMgZ29uZSBhZmFpciwgaW4gd2hpY2ggY2FzZSBkcm9wcGluZyB0aGUgI2lmIDAgd291bGQg
c2VlbQo+Pj4+PiBwb3NzaWJsZSB0byBtZSwgZXZlbiBpZiBpdCdzIG5vdCBzdHJpY3RseSBuZWVk
ZWQgd2l0aG91dCB0aGUgc2xlZXAtCj4+Pj4+IG9uLXdhaXRxdWV1ZSBiZWhhdmlvciBtZW50aW9u
ZWQuCj4+Pj4gSSBqdXN0IGhhZCBhIGxvb2sgYW5kIGZvdW5kIHRoZSBmb2xsb3dpbmcgcGF0aDoK
Pj4+Pgo+Pj4+IGRvX2RvbWN0bCgpICh0YWtlcyBkb21jdGxfbG9jayBhbmQgaHlwZXJjYWxsX2Rl
YWRsb2NrX211dGV4KQo+Pj4+ICAgYXJjaF9kb19kb21jdGwoKQo+Pj4+ICAgICByYXdfY29weV9m
cm9tX2d1ZXN0KCkKPj4+PiAgICAgICBjb3B5X2Zyb21fdXNlcl9odm0oKQo+Pj4+ICAgICAgICAg
aHZtX2NvcHlfZnJvbV9ndWVzdF9saW5lYXIoKQo+Pj4+ICAgICAgICAgICBfX2h2bV9jb3B5KCkK
Pj4+Pgo+Pj4+IFNvIG5vLCB3ZSBjYW4ndCBkbyB0aGUgaW5fYXRvbWljKCkgdGVzdCBJTU8uCj4+
PiBPaCwgcmlnaHQgLSB0aGF0J3MgYSBQVkggY29uc3RyYWludCB0aGF0IGNvdWxkIHByb2JhYmx5
IG5vdCBldmVuCj4+PiBiZSB0aG91Z2h0IG9mIHRoYXQgdGhlIHRpbWUgdGhlIGNvbW1lbnQgd2Fz
IHdyaXR0ZW4uIEknbSBzdGlsbAo+Pj4gb2YgdGhlIG9waW5pb24gdGhvdWdoIHRoYXQgYXQgbGVh
c3QgdGhlIHN0aWxsIGFwcGxpY2FibGUgcGFydCBvZgo+Pj4gdGhlIGNvbW1lbnQgc2hvdWxkIGJl
IGtlcHQgaW4gcGxhY2UuIFdoZXRoZXIgdGhpcyBtZWFucyBhbHNvCj4+PiBrZWVwaW5nIGluX2F0
b21pYygpIGl0c2VsZiBpcyB0aGVuIGFuIGluZGVwZW5kZW50IHF1ZXN0aW9uLCBpLmUuCj4+PiBJ
IHdvdWxkbid0IGNvbnNpZGVyIGl0IG92ZXJseSBiYWQgaWYgdGhlcmUgd2FzIG5vIGltcGxlbWVu
dGF0aW9uCj4+PiBpbiB0aGUgdHJlZSwgYnV0IHRoZSBhYm92ZSBzdGlsbCBzZXJ2ZWQgYXMgZG9j
dW1lbnRhdGlvbiBvZiB3aGF0Cj4+PiB3b3VsZCBuZWVkIHRvIGJlIHJlLWFkZGVkLiBTdGlsbCBt
eSBwcmVmZXJlbmNlIHdvdWxkIGJlIGZvciBpdAo+Pj4gdG8gYmUga2VwdC4KPj4gV291bGQgeW91
IGJlIG9rYXkgd2l0aCByZXBsYWNpbmcgdGhlIHJlbW92ZWQgc3R1ZmYgYWJvdmUgd2l0aDoKPj4K
Pj4gLyoKPj4gICogSWYgdGhlIHJlcXVpcmVkIGd1ZXN0IG1lbW9yeSBpcyBwYWdlZCBvdXQgdGhp
cyBmdW5jdGlvbiBtYXkgc2xlZXAuCj4+ICAqIFNvIGluIHRoZW9yeSB3ZSBzaG91bGQgYmFpbCBv
dXQgaWYgY2FsbGVkIGluIGF0b21pYyBjb250ZXh0Lgo+PiAgKiBVbmZvcnR1bmF0ZWx5IHRoaXMg
aXMgdHJ1ZSBmb3IgUFZIIGRvbTAgZG9pbmcgZG9tY3RsIGNhbGxzIHdoaWNoCj4gLi4uIHRoaXMg
aXMgdHJ1ZSBhdCBsZWFzdCBmb3IgLi4uCj4KPj4gICogaG9sZHMgdGhlIGRvbWN0bCBsb2NrIHdo
ZW4gYWNjZXNzaW5nIGRvbTAgbWVtb3J5LiBPVE9IIGRvbTAgbWVtb3J5Cj4+ICAqIHNob3VsZCBu
ZXZlciBiZSBwYWdlZCBvdXQsIHNvIHdlIGFyZSBmaW5lIHdpdGhvdXQgdGVzdGluZyBmb3IKPj4g
ICogYXRvbWljIGNvbnRleHQuCj4+ICAqLwo+IE5vdCBzdXJlIGFib3V0IHRoaXMgRG9tMC1zcGVj
aWZpYyByZW1hcms6IEFyZSB3ZSBjZXJ0YWluIHRoZXJlIGFyZQo+IG5vIG90aGVyIHBhdGhzLCBz
aW1pbGFyIHRvIHRoZSBnbnR0YWIgb25lIGhhdmluZyBiZWVuIG1lbnRpb25lZCB0aWxsCj4gbm93
PwoKV2h5IGlzIF9faHZtX2NvcHkoKSBzbyBzcGVjaWFsP8KgIEl0IGlzIGp1c3Qgb25lIG9mIG1h
bnkgcGxhY2VzIHdoaWNoIGNhbgplbmQgdXAgdG91Y2hpbmcgZ3Vlc3QgbWVtb3J5LgoKQSBjb21t
ZW50IGhlcmUgaXNuJ3QgZ29pbmcgdG8gaGVscCBhbnlvbmUgd2hvIG1pZ2h0IGZpbmQgdGhlbXNl
bHZlcyB3aXRoCnByb2JsZW1zLgoKR2l2ZW4gdGhhdCB0aGUgdGVzdCBoYXMgbmV2ZXIgYmVlbiB1
c2VkLCBhbmQgbm8gaXNzdWVzIGhhdmUgYmVlbiByYWlzZWQsCmFuZCB0aGlzIHBhdGggaXNuJ3Qg
QUZBSUNUIHNwZWNpYWwsIEkgZG9uJ3Qgc2VlIHdoeSBpdCBzaG91bGQgYmUKc3BlY2lhbC1jYXNl
ZC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
