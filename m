Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D69FC8507E
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 18:00:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvOJq-00019m-ST; Wed, 07 Aug 2019 15:57:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=besu=WD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hvOJp-00019e-Ex
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 15:57:41 +0000
X-Inumbo-ID: 146de996-b92c-11e9-adab-a712c75ada60
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 146de996-b92c-11e9-adab-a712c75ada60;
 Wed, 07 Aug 2019 15:57:38 +0000 (UTC)
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
IronPort-SDR: 05QBrUWbA2OqIGsz7xkRlayz6Wn+EPoPaoB5dA1NsQ1YLl4y10+Ec/XoMjJYkQiP7l1mmmImnN
 D8zS2xXfAL5E92o1V1+yhnCIQb98oNBUhrv6SR2HZBmHmCx3j7MDkq5G551xjFkGTX0SQ4x0Sv
 Zy+FPQnxRGGVS1xS7oojSQ6E/PUL3TU5N0pOsdcmJJTKCRVgf9/h+yquJFko6gtNDdbmd74kvq
 24VnqGah6OOGuIyYt2bvfQ/bsIaWedPRUPL/qb3O6jVBcO0L2gRRMhF7HtbIkT08z2OReBzFgp
 /wo=
X-SBRS: 2.7
X-MesageID: 3996751
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,357,1559534400"; 
   d="scan'208";a="3996751"
To: Jan Beulich <jbeulich@suse.com>
References: <20190807112024.19480-1-elnikety@amazon.com>
 <33d6bbb5-cecd-a499-89f4-1592a3fb0eac@citrix.com>
 <d0c34b24-697e-fbc1-3d7d-741e0f37c768@suse.com>
 <83a583e2-f4f2-8519-ce58-b200987dcab5@citrix.com>
 <057d72ef-bbec-0e91-b79b-3ebe6da35ba9@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <d2ff9dcf-233b-ac02-1034-310f97e2c215@citrix.com>
Date: Wed, 7 Aug 2019 16:57:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <057d72ef-bbec-0e91-b79b-3ebe6da35ba9@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] evtchn: make support for different ABIs
 tunable
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Eslam Elnikety <elnikety@amazon.com>, Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMDgvMjAxOSAxNjowOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDcuMDguMjAxOSAx
NzowMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDcvMDgvMjAxOSAxNTozMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAwNy4wOC4yMDE5IDE1OjQxLCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IEZ1cnRoZXJtb3JlLCBpZiB0aGVyZSBpcyB0aGlzIHByb2JsZW0gZm9yIGV2ZW50IGNo
YW5uZWxzLCB0aGVuCj4+Pj4gdGhlcmUgaXMKPj4+PiBhbG1vc3QgY2VydGFpbmx5IGEgcmVsYXRl
ZCBwcm9ibGVtIGZvciBncmFudCB0YWJsZXMuCj4+Pj4KPj4+PiBUaGUgY29udHJvbCBpbiBYZW4g
c2hvdWxkIGJlIGV4cHJlc3NlZCBpbiBhIHBvc2l0aXZlIGZvcm0sIG9yIHRoZQo+Pj4+IGxvZ2lj
Cj4+Pj4gd2lsbCBiZWNvbWUgYSB0YW5nbGUuwqAgSXQgc2hvdWxkIGJlIGEgYml0IHBlcm1pdHRp
bmcgdGhlIHVzZSBvZiB0aGUKPj4+PiBGSUZPCj4+Pj4gQUJJLCByYXRoZXIgdGhhbiBhIGJpdCBz
YXlpbmcgIm9oIGFjdHVhbGx5LCB5b3UgY2FuJ3QgdXNlIHRoYXQiLgo+Pj4+Cj4+Pj4gVGhhdCBz
YWlkLCBpdCBtaWdodCBiZSBlYXNpZXIgdG8gZGVjbGFyZSBGSUZPIHRvIGJlICJldmVudCBjaGFu
bmVsCj4+Pj4gdjIiLAo+Pj4+IGFuZCBzcGVjaWZ5IG1heF97Z3JhbnQsZXZudGNobn1fdmVyIGlu
c3RlYWQuCj4+Pgo+Pj4gSSdtIG5vdCBzdXJlIGFzc3VtaW5nIGxpbmVhciAob3IgYWN0dWFsbHkg
YW55KSBvcmRlcmluZyBiZXR3ZWVuCj4+PiB2YXJpYW50cyBpcyBhIGdvb2QgdGhpbmcuIFllcywg
cmlnaHQgbm93IHdlIG9ubHkgaGF2ZSBnbnR0YWIKPj4+IHYxIGFuZCB2MiBhbmQgZXZ0Y2huIDJs
IGFuZCBmaWZvLCB3aGljaCBjb3VsZCBiZSBjb25zaWRlcmVkIHYxCj4+PiBhbmQgdjIgYXMgeW91
IHN1Z2dlc3QuIEhvd2V2ZXIsIGFzc3VtaW5nIGEgM3JkIHZhcmlhbnQgc3VyZmFjZXMsCj4+PiB3
aHkgd291bGQgaXQgYmUgdGhhdCBvbmUgaGFzIHRvIGV4cG9zZSB2MiBqdXN0IHRvIG1ha2UgdjMK
Pj4+IHVzYWJsZT8gSW4gcGFydGljdWxhciBnbnR0YWIgdjIgaGFzIHZhcmlvdXMgaXNzdWVzICh3
aGljaCBpcyB3aHkKPj4+IHlvdSBpbnRyb2R1Y2VkIGEgd2F5IHRvIGRpc2FibGUgaXRzIHVzZSBp
biB0aGUgZmlyc3QgcGxhY2UpLCB5ZXQKPj4+IEknZCBob3BlIHdlJ2QgZW5kIHVwIHdpdGggYSBs
ZXNzIHF1aXJreSB2MyBpZiBvbmUgZXZlciBiZWNvbWVzCj4+PiBuZWNlc3NhcnkuIEFuZCBpbiB0
dXJuIEknZCBob3BlIHdlIGNvdWxkIGhpZGUgdjIgZnJvbSBhbnkgdjMKPj4+IHVzZXJzLgo+Pj4K
Pj4+IElPVyBJIHRoaW5rIGEgYml0bWFwIHRvIHBlcm1pdCB1c2Ugb2YgImFkdmFuY2VkIiB2ZXJz
aW9ucyBpcwo+Pj4gbW9yZSBmdXR1cmUgcHJvb2YuIChBcyBhIHNpZGUgbm90ZSwgSSBkb24ndCB0
aGluayB3ZSB3YW50IHRvCj4+PiBpbnRyb2R1Y2UgYSBkaXNhYmxlIGZvciB0aGUgcmVzcGVjdGl2
ZSB2MSBpbnRlcmZhY2VzLikKPj4KPj4gV2UgYWJzb2x1dGVseSBkbyB3YW50IGEgd2F5IHRvIHR1
cm4gZXZlcnl0aGluZyBvZmYuCj4+Cj4+IFRoZSBpbmFiaWxpdHkgdG8gdHVybiB0aGUgWGVuIGV4
dGVuc2lvbnMgb2ZmIGZvciBIVk0gZ3Vlc3RzIChldmVuIGlmCj4+IG9ubHkgZm9yIGRlYnVnZ2lu
ZyBwdXJwb3NlcykgaXMgYSBzZXZlcmVseSBzaG9ydCBzaWdodGVkIGRlY2lzaW9uLgo+Cj4gRm9y
IEhWTSBwZXJoYXBzLCBidXQgbm90IGZvciBQVi4KClJpZ2h0Li4uCgpJJ20gY29uZnVzZWQgYXMg
dG8gd2hhdCBpbiBteSBzZW50ZW5jZSBpcyBpbiBhbnkgd2F5IHVuY2xlYXIuCgo+Cj4+IEl0IGlz
IGFsc28gYSBmZWF0dXJlIHdoaWNoIGhhcyBiZWVuIHJlcXVlc3RlZCByZXBlYXRlZGx5IGJ5IHVz
ZXJzIGluIHRoZQo+PiBwYXN0LCBhbmQgSSBhbSB2ZXJ5IGRlbGliZXJhdGVseSBidWlsZGluZyBh
IHdheSB0byBkbyB0aGlzIGludG8gdGhlCj4+IENQVUlEIHdvcmsuCj4+Cj4+IEhvd2V2ZXIsIGl0
IGlzIGFuIHVucmVhc29uYWJsZSByZXF1ZXN0IHRvIGJ1bmRsZSBpbnRvIHRoaXMgYnVnZml4LCBo
ZW5jZQo+PiB3aHkgSSBkaWRuJ3Qgc3VnZ2VzdCBpdC4KPgo+IFRoZXJlJ3Mgbm8gYnVnIGZpeCBo
ZXJlLCBhcyB0aGVyZSdzIG5vIGJ1ZyAoaW4gWGVuKS4KCj/CoCBJIGRpZG4ndCBzYXkgaXQgd2Fz
IGEgYnVnIGluIFhlbiwgYnV0IHRoZSBjaGFuZ2UgaXMgc3BlY2lmaWNhbGx5IHRvCmZpeCBhIGJ1
Zy4KCj4KPj4gTm93IEkgdGhpbmsgYWJvdXQgaXQsIHRoaW5ncyBsaWtlIGF2YWlsYWJsZSBBQklz
IHJlYWxseSBzaG91bGQgYmUgaW4gdGhlCj4+IFhlbiBoeXBlcnZpc29yIENQVUlEIGxlYXZlcywg
YnV0IGFnYWluLCB0aGF0IHNoaXAgc2FpbGVkIGEgZGVjYWRlIGFnby4KPgo+IEZvciBjb21wYXJp
c29uLCBkbyB5b3Uga25vdyBvZiBhbnkgQ1BVIGFyY2hpdGVjdHVyZSBtYWtpbmcgX2FsbF8KPiBv
ZiBpdHMgYmFzaWMgaW5zbnMgYW5kIG90aGVyIGZ1bmN0aW9uYWxpdHkgYXZhaWxhYmxlIGNvbmRp
dGlvbmFsbHkKPiBvbmx5PwoKTm8sIGJ1dCB0aGF0J3MgYWxzbyBub3Qgd2hhdCBJJ20gc3VnZ2Vz
dGluZy4KCkZvciBhbiBIVk0gZ3Vlc3QsIGxpdGVyYWxseSBldmVyeXRoaW5nIFhlbi1zcGVjaWZp
YywgZnJvbSBoeXBlcmNhbGxzIHRvCkNQVUlEIGxlYXZlcyB0byB4ZW5zdG9yZWQgYW5kIFBWIGRy
aXZlcnMsIGlzIGFuIGV4dGVuc2lvbiBvbiBhIGJhc2UKSUJNLWNvbXBhdGlibGUgUEMuCgpUaGVy
ZSBzaG91bGQgYWx3YXlzIGhhdmUgYmVlbiBhIHdheSBvZiBvZiBydW5uaW5nIGFuIEhWTSBndWVz
dCB3aXRob3V0CmFueSBvZiB0aGlzLCBhbmQgd2UgKHRoZSBYZW4gY29tbXVuaXR5KSByZWFsbHkg
ZG8gaGF2ZSB1c2VycyB3aGljaCB3YW50CnRvIGJlIGFibGUgdG8gZG8gdGhpcy4KCn5BbmRyZXcK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
