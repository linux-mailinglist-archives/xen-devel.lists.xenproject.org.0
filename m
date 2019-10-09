Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75903D0CBA
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 12:22:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iI95C-0001S0-FI; Wed, 09 Oct 2019 10:20:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LyQK=YC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iI95B-0001Rt-7C
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 10:20:37 +0000
X-Inumbo-ID: 6e954514-ea7e-11e9-97e6-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e954514-ea7e-11e9-97e6-12813bfff9fa;
 Wed, 09 Oct 2019 10:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570616436;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=56l5YyXS+MGJsSxMntPcnxwKowN5C1rQ26aLD0oqPs0=;
 b=BcgFO2T+LcVhl6NZZaWKW29vltf9OEuSiBTMv5cLzWlrue4auKBA9q+q
 0DT/gkj00h5KyVmwPwQkeNhgbCg4wzx98zclwCEqPjSCm4AOC8aPncQ9b
 o8gXzpELaYF4ev4uAZogy+tUQwCHNCmIP0fyri935ZjZat9nB39RSKh+l 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ZumYsTxa1C9lulHP0tjGh6GjWdW7wLbBSW5MO9lTSz4Gdc64MExBm1A3DaADnERmRABraPEma4
 IW4DvefCEh7BC6z5nBM0PWGquWZd2TqfS81MNU4yDPzHgQS0tthiS6KmO86F02kQ8QuLGrOHZz
 wgMMUWd3LRxSmTKD00knp7+cHls+JLFZScWorw1citprUTsXzl4RUQMLkQKK0Qma2Pwdkmvrev
 CAYBfpyxmIC2zjx3FR1oclUgXk4y2rmdNttMchl56Lmf8vzv192UayBwNwEXj1n0o5YkJtFCIl
 Lwk=
X-SBRS: 2.7
X-MesageID: 6651965
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,273,1566878400"; 
   d="scan'208";a="6651965"
Date: Wed, 9 Oct 2019 12:20:28 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191009102028.GB1389@Air-de-Roger.citrite.net>
References: <20191009090539.2141-1-roger.pau@citrix.com>
 <41262e54-44ac-4a31-21d4-83ed8a63eb8f@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41262e54-44ac-4a31-21d4-83ed8a63eb8f@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/passthrough: fix migration of
 MSI when using posted interrupts
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Joe Jin <joe.jin@oracle.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBPY3QgMDksIDIwMTkgYXQgMTI6MDg6NTBQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDkuMTAuMjAxOSAxMTowNSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gQEAg
LTQxMSw2ICs0MTEsNyBAQCBpbnQgcHRfaXJxX2NyZWF0ZV9iaW5kKAo+ID4gIAo+ID4gICAgICAg
ICAgICAgICAgICBwaXJxX2RwY2ktPmdtc2kuZ3ZlYyA9IHB0X2lycV9iaW5kLT51Lm1zaS5ndmVj
Owo+ID4gICAgICAgICAgICAgICAgICBwaXJxX2RwY2ktPmdtc2kuZ2ZsYWdzID0gZ2ZsYWdzOwo+
ID4gKyAgICAgICAgICAgICAgICBwcmV2X3ZjcHVfaWQgPSBwaXJxX2RwY2ktPmdtc2kuZGVzdF92
Y3B1X2lkOwo+IAo+IElmIHRoaXMgYW5kIC4uLgo+IAo+ID4gQEAgLTQ0MCw3ICs0NDEsOCBAQCBp
bnQgcHRfaXJxX2NyZWF0ZV9iaW5kKAo+ID4gICAgICAgICAgLyogVXNlIGludGVycnVwdCBwb3N0
aW5nIGlmIGl0IGlzIHN1cHBvcnRlZC4gKi8KPiA+ICAgICAgICAgIGlmICggaW9tbXVfaW50cG9z
dCApCj4gPiAgICAgICAgICAgICAgcGlfdXBkYXRlX2lydGUodmNwdSA/ICZ2Y3B1LT5hcmNoLmh2
bS52bXgucGlfZGVzYyA6IE5VTEwsCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5m
bywgcGlycV9kcGNpLT5nbXNpLmd2ZWMpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
IGluZm8sIHBpcnFfZHBjaS0+Z21zaS5ndmVjLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHByZXZfdmNwdV9pZCA+PSAwID8gZC0+dmNwdVtwcmV2X3ZjcHVfaWRdIDogTlVMTCk7Cj4g
Cj4gLi4uIHRoaXMgYXJlIHRvIGJlIHJlbGlhYmxlLCB0aGVuIC0gYXMgZXhwbGFpbmVkIHRvIEpv
ZSBhbHJlYWR5Cj4gaW4gdGhlIGVhcmxpZXIgZGlzY3Vzc2lvbiAtIEkgdGhpbmsgeW91IG5lZWQg
dG8gdXBkYXRlCj4gcGlycV9kcGNpLT5nbXNpLmRlc3RfdmNwdV9pZCBpbiBhIGNvZGUgc2VjdGlv
biBhIGZldyBsaW5lcyB1cAo+IGZyb20gaGVyZSAoc3VjaCB0aGF0IGl0IHdvdWxkIGJlIHJlbGlh
YmxlIHRoZSBuZXh0IHRpbWUgd2UgY29tZQo+IGhlcmUpIGxpa2UgdGhpczoKPiAKPiBAQCAteHh4
LDcgK3l5eSwxMCBAQAo+ICAgICAgICAgICAgICAgICAgdmNwdSA9IHZlY3Rvcl9oYXNoaW5nX2Rl
c3QoZCwgZGVzdCwgZGVzdF9tb2RlLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGlycV9kcGNpLT5nbXNpLmd2ZWMpOwo+ICAgICAgICAgICAgICBpZiAoIHZj
cHUgKQo+ICsgICAgICAgICAgICB7Cj4gICAgICAgICAgICAgICAgICBwaXJxX2RwY2ktPmdtc2ku
cG9zdGVkID0gdHJ1ZTsKPiArICAgICAgICAgICAgICAgIHBpcnFfZHBjaS0+Z21zaS5kZXN0X3Zj
cHVfaWQgPSB2Y3B1LT52Y3B1X2lkOwo+ICsgICAgICAgICAgICB9Cj4gICAgICAgICAgfQo+ICAg
ICAgICAgIGlmICggdmNwdSAmJiBpc19pb21tdV9lbmFibGVkKGQpICkKPiAgICAgICAgICAgICAg
aHZtX21pZ3JhdGVfcGlycShwaXJxX2RwY2ksIHZjcHUpOwo+IAo+IFRoaXMgb3VnaHQgdG8gYmUg
ZmluZSBiZWNhdXNlIHNvIGZhciAuZGVzdF92Y3B1X2lkIGhhcyBhIGNvbnN1bWVyCj4gb25seSBp
biB0aGUgbm9uLXBvc3RlZCBjYXNlIChpbiBodm1fbWlncmF0ZV9waXJxKCkpLgoKT2gsIEkgc2Vl
LiBkZXN0X3ZjcHVfaWQgaXMgb25seSB2YWxpZCBmb3Igbm9uLW11bHRpZGVzdCwgYnV0IHdoZW4K
dXNpbmcgcG9zdGVkIGludGVycnVwdHMgWGVuIHNlbGVjdHMgYSBmaXhlZCBkZXN0aW5hdGlvbiB2
Y3B1IGV2ZW4gaW4KbXVsdGlkZXN0LCBzbyB3ZSBjYW4gdGFrZSBhZHZhbnRhZ2Ugb2YgcG9zdGVk
IGludGVycnVwdHMgYXQgdGhlIHByaWNlCm9mIGFsd2F5cyBkZWxpdmVyaW5nIHRvIHRoZSBzYW1l
IHZjcHUuCgo+IAo+IENvbnNpZGVyaW5nIHRoYXQgaHZtX2dpcnFfZGVzdF8yX3ZjcHVfaWQoKSBp
c24ndCByZWFsbHkgaW5leHBlbnNpdmUsCj4gc3Vic2VxdWVudCBjbGVhbnVwIG1heSB0aGVuIGlu
dm9sdmUgYXZvaWRpbmcgdG8gY2FsbCB0aGlzIGZ1bmN0aW9uCj4gaWYgd2UnZCBvdmVyd3JpdGUg
LmRlc3RfdmNwdV9pZCBhcyBwZXIgYWJvdmUgYW55d2F5LgoKSG0sIEkgc2VlLiBJIHdvdWxkIGxl
YXZlIHRoYXQgZm9yIGEgZnVydGhlciBvcHRpbWl6YXRpb24uCgpUaGFua3MsIFJvZ2VyLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
