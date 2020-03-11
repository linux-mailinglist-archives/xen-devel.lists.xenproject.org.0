Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E89F6181C74
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 16:37:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC3Ng-0000Td-GG; Wed, 11 Mar 2020 15:34:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V419=44=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jC3Ne-0000TX-KK
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 15:34:46 +0000
X-Inumbo-ID: d51d1c94-63ad-11ea-afeb-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d51d1c94-63ad-11ea-afeb-12813bfff9fa;
 Wed, 11 Mar 2020 15:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583940884;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=hsVGWREX53IK8i6oAIuaQOfmozxh4uKyd6GHC3tr1NQ=;
 b=GpB63+uIFErw+NgO0GqP4Y8StmTelF0TxWkiBZdYCOl3+iQxzwLUx/KD
 uwkDGd5RnhVReGsjPMxOpr/uj8lPD5tJfBFTVv3heUvlkUPx15KHs3kc0
 8ya9eZZdS/r0PzmPqEH6JXORumDY2oqVuiKbRvgqVFMT1strgCw75BwLJ Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: MddIhxuNTX0gHLJSy4EF1CA1foSxzfD4tIB1vDXK11S19kRWjErH9U9Ud+WvnpC+f5awWtFyTI
 m1q/YCS99pZyozCQ6q/0k6hr0t5a1RWPmWtzlWLJ+VNHlZCpZjtIg5FzVNqg5VZqahkT3qD2X8
 a8KcKodM5oTgjoFmaYkZIvKkz0UUaACozRgAJkAi2D6VuH9zezqiUXsg/q31PusYeyZikzD03M
 TGt/jQZW5gLap+CyWA0D4PTyzWZ0BMkfQwdeREhg8dK2J5xEDHhbWE/Zfi/nCJOeQ1o3WAWkIf
 K9k=
X-SBRS: 2.7
X-MesageID: 14196784
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,541,1574139600"; d="scan'208";a="14196784"
Date: Wed, 11 Mar 2020 16:34:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200311153437.GC24458@Air-de-Roger.citrite.net>
References: <20200228120753.38036-1-roger.pau@citrix.com>
 <20200228120753.38036-3-roger.pau@citrix.com>
 <6a031b3f-5807-572d-682b-9a0b05f0703d@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6a031b3f-5807-572d-682b-9a0b05f0703d@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v5 2/2] x86: add accessors for scratch cpu
 mask
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjgsIDIwMjAgYXQgMDE6NDI6NThQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjguMDIuMjAyMCAxMzowNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gQ3Vy
cmVudCB1c2FnZSBvZiB0aGUgcGVyLUNQVSBzY3JhdGNoIGNwdW1hc2sgaXMgZGFuZ2Vyb3VzIHNp
bmNlCj4gPiB0aGVyZSdzIG5vIHdheSB0byBmaWd1cmUgb3V0IGlmIHRoZSBtYXNrIGlzIGFscmVh
ZHkgYmVpbmcgdXNlZCBleGNlcHQKPiA+IGZvciBtYW51YWwgY29kZSBpbnNwZWN0aW9uIG9mIGFs
bCB0aGUgY2FsbGVycyBhbmQgcG9zc2libGUgY2FsbCBwYXRocy4KPiA+IAo+ID4gVGhpcyBpcyB1
bnNhZmUgYW5kIG5vdCByZWxpYWJsZSwgc28gaW50cm9kdWNlIGEgbWluaW1hbCBnZXQvcHV0Cj4g
PiBpbmZyYXN0cnVjdHVyZSB0byBwcmV2ZW50IG5lc3RlZCB1c2FnZSBvZiB0aGUgc2NyYXRjaCBt
YXNrIGFuZCB1c2FnZQo+ID4gaW4gaW50ZXJydXB0IGNvbnRleHQuCj4gPiAKPiA+IE1vdmUgdGhl
IGRlY2xhcmF0aW9uIG9mIHNjcmF0Y2hfY3B1bWFzayB0byBzbXAuYyBpbiBvcmRlciB0byBwbGFj
ZSB0aGUKPiA+IGRlY2xhcmF0aW9uIGFuZCB0aGUgYWNjZXNzb3JzIGFzIGNsb3NlIGFzIHBvc3Np
YmxlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgoKUGluZz8gVGhpcyBzZWVtcyB0byBoYXZlIHRoZSByZXF1aXJlZCBSQiwgYnV0IGhhc24n
dCBiZWVuIGNvbW1pdHRlZC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
