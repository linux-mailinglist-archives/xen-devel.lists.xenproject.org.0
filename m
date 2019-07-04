Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 957A45F8EF
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 15:14:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj1Vl-0002YX-Qh; Thu, 04 Jul 2019 13:10:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E3Ia=VB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hj1Vj-0002YS-Pw
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 13:10:51 +0000
X-Inumbo-ID: 24323e52-9e5d-11e9-a093-03ad5d92c6a3
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24323e52-9e5d-11e9-a093-03ad5d92c6a3;
 Thu, 04 Jul 2019 13:10:49 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: dTxhAdyblZ+qmTUAFYxFLu1pyFEKx3Wult6S4jNVHBz7LTzngmbya7wWkx81jHwJ330g22Zwi9
 Up2ldAFIwC0TQPqumJV/Fn8eT7AxFQXyapTde/AQYUzFGgOp033YYEWyZtPXf2kcBYrT2fRUgR
 c+WfQVmA8mblAuB2Wlfw9usJ23hOiQw4s6V6yL3rcNvRgCWP+lWmUHG/AYFuArYhJMD9mziIvZ
 l7yGes2j0gqoWkt11AQ3bUltJ4ijjNoYMUks2gS/BxrK0yGm5oHREyamscOtEENg3/p3cDdCwh
 MsM=
X-SBRS: 2.7
X-MesageID: 2647695
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,451,1557201600"; 
   d="scan'208";a="2647695"
To: Jan Beulich <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <ac7a20e8-9e5e-f664-1d7f-d59105f90223@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <c083eb95-7751-50d7-c33b-8de63f22dc39@citrix.com>
Date: Thu, 4 Jul 2019 14:10:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <ac7a20e8-9e5e-f664-1d7f-d59105f90223@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3] IOMMU/x86: make page type checks
 consistent when mapping pages
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMvMDcvMjAxOSAxMzoxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlcmUgYXJlIGN1cnJl
bnRseSB0aHJlZSBtb3JlIG9yIGxlc3MgZGlmZmVyZW50IGNoZWNrczoKPiAtIF9nZXRfcGFnZV90
eXBlKCkgYWRqdXN0cyB0aGUgSU9NTVUgbWFwcGluZ3MgYWNjb3JkaW5nIHRvIHRoZSBuZXcgdHlw
ZQo+ICAgIGFsb25lLAo+IC0gYXJjaF9pb21tdV9wb3B1bGF0ZV9wYWdlX3RhYmxlKCkgd2FudHMg
anVzdCB0aGUgdHlwZSB0byBiZQo+ICAgIFBHVF93cml0YWJsZV9wYWdlLAo+IC0gaW9tbXVfaHdk
b21faW5pdCgpIGFkZGl0aW9uYWxseSBwZXJtaXRzIGFsbCBvdGhlciB0eXBlcyB3aXRoIGEgdHlw
ZQo+ICAgIHJlZmNvdW50IG9mIHplcm8uCj4gVGhlIGNhbm9uaWNhbCBvbmUgaXMgaW4gX2dldF9w
YWdlX3R5cGUoKSwgYW5kIGFzIG9mIFhTQS0yODgKPiBhcmNoX2lvbW11X3BvcHVsYXRlX3BhZ2Vf
dGFibGUoKSBhbHNvIGhhcyBubyBuZWVkIGFueW1vcmUgdG8gZGVhbCB3aXRoCj4gUEdUX25vbmUg
cGFnZXMuIEluIHRoZSBQViBEb20wIGNhc2UsIGhvd2V2ZXIsIFBHVF9ub25lIHBhZ2VzIGFyZSBz
dGlsbAo+IG5lY2Vzc2FyeSB0byBjb25zaWRlciwgc2luY2UgaW4gdGhhdCBjYXNlIHBhZ2VzIGRv
bid0IGdldCBoYW5kZWQgdG8KPiBndWVzdF9waHlzbWFwX2FkZF9lbnRyeSgpLiBGdXJ0aGVybW9y
ZSwgdGhlIGZ1bmN0aW9uIHNvIGZhciBhbHNvCj4gZXN0YWJsaXNoZWQgci9vIG1hcHBpbmdzLCB3
aGljaCBpcyBub3QgaW4gbGluZSB3aXRoIHRoZSBydWxlcyBzZXQgZm9ydGgKPiBieSB0aGUgWFNB
LTI4OCBjaGFuZ2UuCj4KPiBGb3IgYXJjaF9pb21tdV9wb3B1bGF0ZV9wYWdlX3RhYmxlKCkgdG8g
bm90IGVuY291bnRlciBQR1Rfbm9uZSBwYWdlcwo+IGFueW1vcmUgZXZlbiBpbiBjYXNlcyB3aGVy
ZSB0aGUgSU9NTVUgZ2V0cyBlbmFibGVkIGZvciBhIGRvbWFpbiBvbmx5Cj4gd2hlbiBpdCBpcyBh
bHJlYWR5IHJ1bm5pbmcsIHJlcGxhY2UgdGhlIElPTU1VIGRlcGVuZGVuY3kgaW4KPiBndWVzdF9w
aHlzbWFwX2FkZF9lbnRyeSgpJ3MgaGFuZGxpbmcgb2YgUFYgZ3Vlc3RzIHRvIGNoZWNrIGp1c3Qg
dGhlCj4gc3lzdGVtIHdpZGUgc3RhdGUgaW5zdGVhZCBvZiB0aGUgZG9tYWluIHByb3BlcnR5LgoK
QW5kIHRoaXMgaXMgdGhlIHByb2JsZW0uwqAgV2UgaGF2ZSBhbiBlbm9ybW91cyBhbW91bnQgb2Yg
Y29tcGxleGl0eSwgYW5kCmEgaHlwZXJjYWxsIHdoaWNoIGV2ZW4gYWZ0ZXIgYW4gWFNBLCB3ZSBj
b3VsZCBvbmx5IHJlZHVjZSB0byAid2lsbApsaXZlbG9jayB1bmRlciBhZHZlcnNhcmlhbCBjb25k
aXRpb25zIChpbmMuIHRoZSB0b29sc3RhY2sgdGhyZWFkIHdoaWNoCnN0YXJ0ZWQgaXQpIiwgc28g
c3VwcG9ydCBhIGNvcm5lciBjYXNlIHdoaWNoIGRvZXNuJ3QgKEFGQUNJVCkgbG9vayBsaWtlCml0
IGNhbiB3b3JrIGNvcnJlY3RseSwgYW5kIHN1cmVseSBpc24ndCB1c2VkIGluIHByYWN0aWNlLgoK
SU1PLCB0aGUgb25seSBzYW5lIHRoaW5nIHRvIGRvIGlzIHRvIGhhdmUgYSAiY3JlYXRlIGFuIElP
TU1VIGNvbnRleHQiCmZsYWcgaW4gZG9tYWluY3JlYXRlIChhbmQgYSBzaGFyZWQgdnMgc3BsaXQg
d2hpbGUgd2UncmUgYXQgaXQsIGZvciB0aGUKRVBUIGNhc2UpLCBhbmQgaGF2ZSB0aGUgSU9NTVUg
Y29udGV4dCBwcm9wZXJseSBrbm93biBmcm9tIHRoZSB2ZXJ5IHN0YXJ0Cm9mIHRoZSBkb21haW4u
CgpFdmVuIGlmIHRoaXMgZG9lcyBlbmQgdXAgcmVzdHJpY3RpbmcgYSBjb3JuZXIgY2FzZSB3aGlj
aCBpcyBiZWxpZXZlZCB0bwp3b3JrLCBJIGRvIG5vdCBzZWUgaXQgYXMgYW4gaW5jb252ZW5pZW5j
ZSBvciBwcm9ibGVtIHRvIHJlcXVpcmUgYSBkb21haW4KY29uZmlnIGZpbGUgdG8gc3BlY2lmeSB3
aGV0aGVyIGl0IHdhbnRzIGFuIElPTU1VIGNvbnRleHQgKGRpcmVjdGx5LCBvcgppbmRpcmVjdGx5
IHZpYSB0aGluZ3MgbGlrZSBQQ0k9KSwgYW5kIHRoZSByZWR1Y3Rpb24gaW4gY29tcGxleGl0eSBp
biBYZW4Kd291bGQgYmUgbWFzc2l2ZS4KCkhvdyBtYW55IHNlY3VyaXR5IGJ1Z3MgaGF2ZSB3ZSBh
bHJlYWR5IGZvdW5kIGhlcmU/wqAgSG93IG1heSBhcmUgc3RpbGwKbHVya2luZywgb3IgbGlhYmxl
IHRvIGJlIHJlLWludHJvZHVjZWQgYmVjYXVzZSB0aGlzIGNvZGUgaXMganVzdCB0b28KZGFtbiBj
b21wbGljYXRlZCBmb3IgeW91LCBtZSBhbmQgR2VvcmdlIHRvIHJldmlldyBzZW5zaWJseT/CoCBS
ZWR1Y2luZwp0aGUgY29tcGxleGl0eSBpcyB0aGUgcmVzcG9uc2libGUgdGhpbmcgdG8gZG8uCgpJ
J20gYWZyYWlkIHRoYXQgSSBkb24ndCB2aWV3IGFueXRoaW5nIG90aGVyIHRoYW4gbW92aW5nIHRv
d2FyZHMgYW4KdXAtZnJvbnQgZGVjbGFyYXRpb24gYXMgbWFraW5nIHRoZSBzaXR1YXRpb24gYmV0
dGVyLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
