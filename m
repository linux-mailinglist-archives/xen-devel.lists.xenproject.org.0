Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8763CE89E7
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 14:49:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPRpi-00041B-Ma; Tue, 29 Oct 2019 13:46:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lo1b=YW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iPRph-000416-Np
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 13:46:49 +0000
X-Inumbo-ID: 8d858cf0-fa52-11e9-bbab-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d858cf0-fa52-11e9-bbab-bc764e2007e4;
 Tue, 29 Oct 2019 13:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572356808;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Wgq48QiizSbk5YcgvffYhEIEhAgihW6bcLx9cb2qc2k=;
 b=Wm92NabFeweznccNgwl0+c77PKSUcHGi6Ge6DnUdnH3b1fxoY8tlvSkH
 FBOEB4VPx42PT0HMHEPDd90dwwOJSq2E62rutnROGreVQyjEERoGoBcy4
 qL3raTn+aKzaoe7RVQXUUH6BvYx65/llT+x8o1Nr8ArQdCRS29SLQAaXt g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: v/fZ3+UOGLhbbBLIZNzk+u1yaSlqzbQUBV53ZeY99v7bWdqvTxBii4tr8qmhnEbqfaO1lywZgj
 14XIkB02SL31vJ5TAKMX1kZmNY7Z0zX6+rEXIQBhAsyA0NnlVmZv8gQq/QEj2+G9wRv46kCFG8
 3SCzZma2tpyNB4wQPxhq29kWVk2JYIWHM7zlJxtE9kNsp1QU/VBQCDeKuyTZ00p0gGKzEgxv/c
 y0Z9rbRsl8PlCfmSJPsUtzc5x24gMebHGCsYpyE573x6C4T8N2ABPgrFdXVyagg1pphM9uJWwJ
 8o4=
X-SBRS: 2.7
X-MesageID: 7558495
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,244,1569297600"; 
   d="scan'208";a="7558495"
To: Norbert Manthey <nmanthey@amazon.de>, Jan Beulich <jbeulich@suse.com>
References: <20191023135812.21348-1-andrew.cooper3@citrix.com>
 <20191023135812.21348-3-andrew.cooper3@citrix.com>
 <9a76e252-b9a3-4454-6ca8-ab521276fc31@suse.com>
 <782089aa-7994-f471-3c52-2afb30f95812@citrix.com>
 <c12afdd1-c561-bc79-5c36-22ac2e994953@suse.com>
 <6d7c899e-81ab-bc61-a589-043b327b3137@citrix.com>
 <477a6513-0caf-fc4a-21cf-a3a101b6c5ca@suse.com>
 <5b6b2cd3-b8a5-7697-e6f4-f7c337242276@amazon.de>
 <5d075fd9-acbe-0fcd-8f22-9f49c61f657f@citrix.com>
 <15ce3d44-0eaf-c01b-8c80-b0067de9e249@amazon.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <1924da4a-b2d7-456e-5276-6c33338ec86b@citrix.com>
Date: Tue, 29 Oct 2019 13:46:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <15ce3d44-0eaf-c01b-8c80-b0067de9e249@amazon.de>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 2/7] xen/nospec: Use always_inline to fix
 code gen for evaluate_nospec
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkvMTAvMjAxOSAwODoyNSwgTm9yYmVydCBNYW50aGV5IHdyb3RlOgo+IE9uIDEwLzI4LzE5
IDE4OjA1LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAyNS8xMC8yMDE5IDIyOjU2LCBOb3Ji
ZXJ0IE1hbnRoZXkgd3JvdGU6Cj4+PiBPbiAxMC8yNS8xOSAxNzo0MCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+Pj4gT24gMjUuMTAuMjAxOSAxNzoyNywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+Pj4g
T24gMjUvMTAvMjAxOSAxMzozNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAyNS4xMC4y
MDE5IDE0OjEwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4+Pj4+IFRoZSB0d28gY2hvaWNlcyB0
byB1bmJsb2NrIDQuMTMgYXJlIHRoaXMgcGF0Y2gsIG9yIHRoZSBwcmV2aW91cyB2ZXJzaW9uCj4+
Pj4+Pj4gd2hpY2ggbWFkZSBDT05GSUdfSEFSREVOX0JSQU5DSCBkZXBlbmQgb24gQlJPS0VOLCB3
aGljaCB3YXMgZXZlbiBtb3JlCj4+Pj4+Pj4gZGlzbGlrZWQuCj4+Pj4+PiBPcHRpb24gMyBpcyB0
byBoYXZlIGp1c3QgdGhlIGNvbmZpZyBvcHRpb24sIGZvciBwZW9wbGUgdG8gdHVybiB0aGlzCj4+
Pj4+PiBvZmYgaWYgdGhleSBmZWVsIGxpa2UgZG9pbmcgc28uCj4+Pj4+IFllcywgYnV0IG5vLsKg
IEEgZmFjYWRlIG9mIHNlY3VyaXR5IGlzIHdvcnNlIHRoYW4gbm8gc2VjdXJpdHksIGFuZCBJCj4+
Pj4+IGRvbid0IGNvbnNpZGVyIGRvaW5nIHRoYXQgYW4gYWNjZXB0YWJsZSBzb2x1dGlvbiBpbiB0
aGlzIGNhc2UuCj4+Pj4gQnV0IEkgdGhvdWdodCB3ZSBhbGwgYWdyZWUgdGhhdCB0aGlzIGlzIHNv
bWV0aGluZyB0aGF0J3MgcHJlc3VtYWJseQo+Pj4+IGdvaW5nIHRvIHJlbWFpbiBpbmNvbXBsZXRl
IChhcyBpbiBub3QgcHJvdmFibHkgY29tcGxldGUpIGFsdG9nZXRoZXIKPj4+PiBhbnl3YXkuIEl0
J3MganVzdCB0aGF0IHdpdGhvdXQgdGhlIGNoYW5nZSBoZXJlIGl0J3MgZmFyIG1vcmUKPj4+PiBp
bmNvbXBsZXRlIHRoZW4gd2l0aCBpdC4KPj4gVGhpcyBpcyBpbmhlcmVudGx5IGEgYmVzdC1lZmZv
cnQgYXBwcm9hY2gsIGJ1dCB3aXRob3V0IHRoZQo+PiBhbHdheXNfaW5saW5lLCBpdCBpcyB0YW50
YW1vdW50IHRvIHVzZWxlc3MuCj4+Cj4+IE9ubHkgdGhlIGdyYW50IHRhYmxlIG9wZXJhdGlvbnMs
IGFuZCBfX21mbl92YWxpZCgpIGFyZSBjb3JyZWN0bHkKPj4gcHJvdGVjdGVkIHdpdGggdGhlIGNv
ZGUgaW4gaXRzIGN1cnJlbnQgZm9ybSwgd2hlcmUgYXMgdGhlIGxhcmdlIGNoYW5nZXMKPj4gKGlu
IHRlcm1zIG9mIGFic29sdXRlIG51bWJlciBvZiBwcm90ZWN0ZWQgcGF0aHMpIGNvbWVzIGZyb20g
dGhlIHByZWRpY2F0ZXMuCj4+Cj4+Pj4gSW4gYW55IGV2ZW50IEkgdGhpbmsgd2Ugc2hvdWxkIChh
bHNvKSBoYXZlIGFuIG9waW5pb24gZnJvbSB0aGUgcGVvcGxlCj4+Pj4gd2hvIGhhZCBvcmlnaW5h
bGx5IGNvbnRyaWJ1dGVkIHRoaXMgbG9naWMuIFlvdSBkaWRuJ3QgQ2MgYW55b25lIG9mCj4+Pj4g
dGhlbTsgSSd2ZSBhZGRlZCBhdCBsZWFzdCBOb3JiZXJ0IG5vdy4KPj4+IFRoYW5rcyBmb3IgYWRk
aW5nIG1lLiBJIGhhZCBhIHF1aWNrIGxvb2sgaW50byB0aGUgZGlzY3Vzc2lvbi4gT25seQo+Pj4g
bWFraW5nIGFkZGluZyBsZmVuY2Ugc3RhdGVtZW50cyBhcm91bmQgY29uZGl0aW9uYWxzIGRlcGVu
ZGluZyBvbiBjb25maWcKPj4+IEJST0tFTiBkb2VzIG5vdCBoZWxwLCBhcyBpdCB3b3VsZCBzdGls
bCBuZWVkIHRvIGJlIGFsd2F5c19pbmxpbmUgdG8gd29yawo+Pj4gYXMgZXhwZWN0ZWQsIGNvcnJl
Y3Q/Cj4+ICJkZXBlbmRzIG9uIEJST0tFTiIgaXMgYSB3YXkgdG8gdW5jb25kaXRpb25hbGx5IGNv
bXBpbGUgb3V0Cj4+IGZ1bmN0aW9uYWxpdHksIHdoaWNoIHdhcyBvbmUgb3B0aW9uIGNvbnNpZGVy
ZWQgdG8gdGhpcyBwcm9ibGVtLgo+Pgo+Pj4gSGVuY2UsIGluIG15IG9waW5pb24sIHRoaXMgcGF0
Y2ggZG9lcyB0aGUgcmlnaHQKPj4+IHRoaW5nIHRvIGJlbmVmaXQgZnJvbSB0aGUgbGZlbmNlcyB0
aGF0IGFyZSBwbGFjZWQgYWZ0ZXIgZXZhbHVhdGlvbgo+Pj4gY29uZGl0aW9uYWxzLgo+PiBUaGlz
IHBhdGNoIGlzIHRoZSBhbHRlcm5hdGl2ZSB0byBjb21waWxpbmcgZXZlcnl0aGluZyBvdXQuCj4+
Cj4+IEknbSBzdGlsbCBob2xkaW5nIG91dCBob3BlIHRoYXQgd2UnbGwgZmluZCBhIGJldHRlciBj
b21waWxlciBiYXNlZAo+PiBtaXRpZ2F0aW9uIGluIHRoZSBsb25nZXIgdGVybSwgYmVjYXVzZSBJ
IGRvbid0IHNlZSBlaXRoZXIgb2YgdGhlc2UKPj4gb3B0aW9ucyBiZWluZyB2aWFibGUgc3RyYXRl
Z2llcyBsb25ndGVybS4KPiBJIGZ1bGx5IGFncmVlIHRoYXQgaW4gdGhlIGxvbmcgcnVuLCB3ZSBz
aG91bGQgaGF2ZSBjb21waWxlciBzdXBwb3J0LCB0bwo+IGUuZy4gbm90IG1vdmUgbGZlbmNlIHN0
YXRlbWVudHMgYXJvdW5kLgo+Cj4gSG93ZXZlciwgdW50aWwgd2UgaGF2ZSB0aGF0LCB3ZSBzaG91
bGQgYWxsb3cgdXNlcnMgb2YgWGVuIHRvIGdldCB0aGUKPiBsZmVuY2Ugc3RhdGVtZW50cyBhdCB0
aGUgY29ycmVjdCBwb3NpdGlvbnMgYXMgYSBiZXN0IGVmZm9ydCBwcmFjdGljZS4KPiBIZW5jZSwg
dGhlIGFsd2F5c19pbmxpbmUgbW9kaWZpY2F0aW9uIHNob3VsZCBiZSB0aGVyZS4gSW4gY2FzZSB5
b3Ugc3RpbGwKPiB3YW50IHRvIGNvbXBpbGUgb3V0IHRoaXMgZnVuY3Rpb25hbGl0eSwgeW91IGNv
dWxkIGV2ZW4gYWRkIGEgZGVwZW5kZW5jeQo+IG9uIEJST0tFTiBvbiB0b3AsIGFuZCB0aGVuIHVz
ZXJzIGNhbiBjaG9zZSB0byBjb21waWxlIGl0IGluLCBidXQgYXQKPiBsZWFzdCBnZXQgYSB2ZXJz
aW9uIHdoZXJlIHRoZSBsZmVuY2VzIGFyZSBwbGFjZWQgYXQgdGhlIHJpZ2h0IHBvc2l0aW9uLgoK
VGhpcyBpcyBnb2luZyBhcm91bmQgaW4gY2lyY2xlcy4KClRoZSBmb2xsb3dpbmcgcGF0Y2ggaW4g
dGhpcyBzZXJpZXMgaXMgYSBmdWxseSB1c2VyLXNlbGVjdGFibGUgS2NvbmZpZwpvcHRpb24gZm9y
IHdoZXRoZXIgdGhleSB3YW50IHRvIHVzZSBicmFuY2ggaGFyZGVuaW5nLCBhbmQgaXMgaW4gcGxh
Y2UKb25jZSB0aGVyZSBpcyBhIHBsYXVzaWJsZSBleHBlY3RhdGlvbiB0aGF0IHRoZSBsZmVuY2Vz
IGFyZSBpbiBzdWl0YWJsZQpwb3NpdGlvbnMuCgpJZiB0aGlzIHBhdGNoIHNlcmllcyBkb2VzIG5v
dCBhZ3JlZW1lbnQsIEkgd2lsbCB1bmJsb2NrIGxpdmVwYXRjaGluZyBvbgo0LjEzIGJ5IGNvbW1p
dHRpbmcgdGhlIHYyIHBhdGNoIHdoaWNoIGNhdXNlcyBCUkFOQ0hfSEFSREVOIHRvIGRlcGVuZCBv
bgpCUk9LRU4gYW5kIGZvcmNlIGl0IHRvIGJlIGNvbXBpbGVkIG91dCB3aXRoIG5vIHVzZXIgY2hv
aWNlIGF0IGFsbC4KClVuYnJlYWtpbmcgbGl2ZXBhdGNoaW5nIGlzIHN0cmljdGx5IG1vcmUgaW1w
b3J0YW50IHRoYW4ga2VlcGluZyBhIGJyYW5kCm5ldyBmZWF0dXJlIGluIDQuMTMgaW4gYSBicm9r
ZW4gZm9ybS7CoCBJJ3ZlIHByb3ZpZGVkIHR3byBhbHRlcm5hdGl2ZQpzdHJhdGVnaWVzIHRvIGZp
eCB0aGUgNC4xMyBibG9ja2VycywgYnV0IGlmIG5vb25lIGNhbiBhZ3JlZSBvbiB3aGljaAphcHBy
b2FjaCB0byB1c2UsIEkgd2lsbCBjb21taXQgdGhlIHNpbXBsZXIgZml4LgoKfkFuZHJldwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
