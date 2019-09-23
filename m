Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFAEBB7BA
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 17:20:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCQ6V-00030h-IW; Mon, 23 Sep 2019 15:18:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=naYO=XS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iCQ6U-00030c-AH
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 15:18:18 +0000
X-Inumbo-ID: 5e49c892-de15-11e9-9600-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by localhost (Halon) with ESMTPS
 id 5e49c892-de15-11e9-9600-12813bfff9fa;
 Mon, 23 Sep 2019 15:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569251897;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DI1FABS6DG2BIHeQYdtpDWmSNjWm7U3U+lppQZf4FMA=;
 b=c/Lx2Uaj5weJfD/Dnpe6u0U3qfVerFWR55KbqZyWLPLMmr4fgpSKXXKc
 Ypal4pM5HAq5c44sVPDUyhx153U6EFRTRIYXUepSWjU3JzJcOEM7XXfPy
 tE8SNxPWdT7oDhL5HKVj+fkM4hiyrmqcNMzh5q1s4+8daOg7c42dejpI0 M=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: f1WN+e2D+ZV5Z5F7hgeXpxFNez8PnjHs/Gxwe9+lcmteYVKzXGFIenycwfazk3iQFDa7tOjTLj
 zAbhzx806CHtf17bpuuKKtzq5L7Gk7pDFMpuBFAoyth/rFosY6lf+eMKaNzYwYgE98vm2/dJI7
 F5aIDCgfry0wL+Ne+JFDkP9MjiJrQH8ILIw5A7qLRuDcRPI3ou1av7asaNu2aYKx7ATxD4aQ2u
 6kLiTd0VoqcYwT6W6vJaCtgzcv3xXi2a3seKs9TMSdZGtoTIUtdPuz3ddxvNnUx/JYTpesvS9A
 12w=
X-SBRS: 2.7
X-MesageID: 6151598
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,540,1559534400"; 
   d="scan'208";a="6151598"
Date: Mon, 23 Sep 2019 17:18:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190923151810.x2mxtbxr7hqmstns@Air-de-Roger>
References: <aa62726c-5aa4-8bcd-dc35-61eb8dfeaee3@suse.com>
 <14624609-019f-2993-261c-d4f45ce78cbe@suse.com>
 <20190923142253.dqvbg2tsfke3mmtc@Air-de-Roger>
 <db9b21f5-108b-eee4-692b-199d25c02b10@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <db9b21f5-108b-eee4-692b-199d25c02b10@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v6 3/8] x86/PCI: read maximum MSI vector
 count early
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMDQ6NDE6MDFQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjMuMDkuMjAxOSAxNjoyMiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBUaHUsIFNlcCAxOSwgMjAxOSBhdCAwMzoyMjo1NFBNICswMjAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiBSYXRoZXIgdGhhbiBkb2luZyB0aGlzIGV2ZXJ5IHRpbWUgd2Ugc2V0IHVwIGludGVy
cnVwdHMgZm9yIGEgZGV2aWNlCj4gPj4gYW5ldyAoYW5kIHRoZW4gaW4gc2V2ZXJhbCBwbGFjZXMp
IGZpbGwgdGhpcyBpbnZhcmlhbnQgZmllbGQgcmlnaHQgYWZ0ZXIKPiA+PiBhbGxvY2F0aW5nIHN0
cnVjdCBwY2lfZGV2Lgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgo+ID4gCj4gPiBMR1RNOgo+ID4gCj4gPiBSZXZpZXdlZC1ieTogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gCj4gVGhhbmtzLgo+IAo+ID4gSnVz
dCBvbmUgbml0IGJlbG93Lgo+ID4gCj4gPj4gQEAgLTcxMSw3ICs3MTAsNyBAQCBzdGF0aWMgaW50
IG1zaV9jYXBhYmlsaXR5X2luaXQoc3RydWN0IHBjCj4gPj4gIAo+ID4+ICAgICAgICAgIC8qIEFs
bCBNU0lzIGFyZSB1bm1hc2tlZCBieSBkZWZhdWx0LCBNYXNrIHRoZW0gYWxsICovCj4gPj4gICAg
ICAgICAgbWFza2JpdHMgPSBwY2lfY29uZl9yZWFkMzIoZGV2LT5zYmRmLCBtcG9zKTsKPiA+PiAt
ICAgICAgICBtYXNrYml0cyB8PSB+KHUzMikwID4+ICgzMiAtIG1heHZlYyk7Cj4gPj4gKyAgICAg
ICAgbWFza2JpdHMgfD0gfih1MzIpMCA+PiAoMzIgLSBkZXYtPm1zaV9tYXh2ZWMpOwo+ID4gCj4g
PiBHRU5NQVNLIHdvdWxkIGJlIHNsaWdodGx5IGVhc2llciB0byBwYXJzZSBJTU8gKGhlcmUgYW5k
IGJlbG93KS4KPiAKPiBCZXNpZGVzIHRoaXMgYmVpbmcgYW4gdW5yZWxhdGVkIGNoYW5nZSwgSSdt
IGFmcmFpZCBJJ20gZ29pbmcgdG8KPiBvYmplY3QgdG8gdXNlIG9mIGEgbWFjcm8gd2hlcmUgaXQn
cyB1bmNsZWFyIHdoYXQgaXRzIHBhcmFtZXRlcnMKPiBtZWFuOiBFdmVuIHRoZSBleGFtcGxlIGlu
IHhlbi9iaXRvcHMuaCBpcyBzbyBjb25mdXNpbmcgdGhhdCBJCj4gY2FuJ3QgdGVsbCB3aGV0aGVy
ICJoIiBpcyBtZWFudCB0byBiZSBleGNsdXNpdmUgb3IgaW5jbHVzaXZlCj4gKGxvb2tzIGxpa2Ug
dGhlIGxhdHRlciBpcyBpbnRlbmRlZCkuIFRvIG1lIHRoZSB0d28gcGFyYW1ldGVycwo+IGFsc28g
bG9vayByZXZlcnNlZCAtIEknZCBleHBlY3QgImxvdyIgZmlyc3QgYW5kICJoaWdoIiBzZWNvbmQu
Cj4gKElTVFIgaGF2aW5nIHZvaWNlZCByZXNlcnZhdGlvbnMgYWdhaW5zdCBpdHMgaW50cm9kdWN0
aW9uLCBhbmQKPiBJJ20gaGFwcHkgdG8gc2VlIHRoYXQgaXQncyB1c2VkIGluIEFybSBjb2RlIG9u
bHkuKQoKSSdtIG5vdCBzcGVjaWFsbHkgdHJpbGxlZCB0byBzd2l0Y2ggdG8gR0VOTUFTSywgYnV0
IHdvdWxkIHlvdSBiZQp3aWxsaW5nIHRvIGNoYW5nZSB1MzIgdG8gdWludDMyX3Q/CgpUaGFua3Ms
IFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
