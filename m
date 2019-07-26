Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 830FE7618D
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 11:11:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqwDI-0007YY-TR; Fri, 26 Jul 2019 09:08:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOBC=VX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hqwDH-0007YT-U1
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 09:08:31 +0000
X-Inumbo-ID: eeb3c488-af84-11e9-b4bb-274c6ab99066
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eeb3c488-af84-11e9-b4bb-274c6ab99066;
 Fri, 26 Jul 2019 09:08:29 +0000 (UTC)
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
IronPort-SDR: uhxQF3SS8on+OoXij2iiZzR8EnsjFK6WzQZwzb+ok8oIsEiv1jvi8YDfklhWaxnd94sJSZkcat
 8mPvATpDS7voS84FybKTm8niBgWRlO4M+fIGSjM5ZvQzGk1/g/MVJTqTmQub7RnzBZ0ZjFd79M
 cVzAct1/eowXXNXisEfX+xxPziYi8bzD+33uh2Y0F7VR6BR8Ze7AHrg+T+RDhclcgMy4r/CdYY
 S7Q3KhGXQoguLd+kvSoJBYtPfczhR9P3VuO3wbPnIR6nk87Uo+6YszVM+t/XvN1zLOE3RNDfvs
 miE=
X-SBRS: 2.7
X-MesageID: 3481225
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,310,1559534400"; 
   d="scan'208";a="3481225"
To: Jan Beulich <JBeulich@suse.com>, "christopher.w.clark@gmail.com"
 <christopher.w.clark@gmail.com>
References: <20190725005326.3553-1-christopher.w.clark@gmail.com>
 <8e756470-0209-deec-4f4d-17147586b144@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <f0ea3251-069f-3a6d-a8c4-6433ff7c7ebd@citrix.com>
Date: Fri, 26 Jul 2019 10:08:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8e756470-0209-deec-4f4d-17147586b144@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] tests/cpu-policy: fix format-overflow
 warning by null terminating strings
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>, Roger
 Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUvMDcvMjAxOSAxMTowMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjUuMDcuMjAxOSAw
Mjo1MywgY2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20gd3JvdGU6Cj4+IGdjYyA5LjEuMCBy
ZXBvcnRzOgo+Pgo+PiB8IHRlc3QtY3B1LXBvbGljeS5jOjY0OjE4OiBlcnJvcjogJyUuMTJzJyBk
aXJlY3RpdmUgYXJndW1lbnQgaXMgbm90IGEgbnVsLXRlcm1pbmF0ZWQgc3RyaW5nIFstV2Vycm9y
PWZvcm1hdC1vdmVyZmxvdz1dCj4+IHwgICAgNjQgfCAgICAgICAgICAgICBmYWlsKCIgIFRlc3Qg
JyUuMTJzJywgZXhwZWN0ZWQgdmVuZG9yICV1LCBnb3QgJXVcbiIsCj4+IHwgICAgICAgfCAgICAg
ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn4KPj4gfCB0ZXN0LWNwdS1wb2xpY3kuYzoyMDoxMjogbm90ZTogaW4gZGVmaW5pdGlvbiBvZiBt
YWNybyAnZmFpbCcKPj4gfCAgICAyMCB8ICAgICBwcmludGYoZm10LCAjI19fVkFfQVJHU19fKTsg
ICAgICAgICAgICAgICAgIFwKPj4gfCAgICAgICB8ICAgICAgICAgICAgXn5+Cj4+IHwgdGVzdC1j
cHUtcG9saWN5LmM6NjQ6Mjc6IG5vdGU6IGZvcm1hdCBzdHJpbmcgaXMgZGVmaW5lZCBoZXJlCj4+
IHwgICAgNjQgfCAgICAgICAgICAgICBmYWlsKCIgIFRlc3QgJyUuMTJzJywgZXhwZWN0ZWQgdmVu
ZG9yICV1LCBnb3QgJXVcbiIsCj4+IHwgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAg
IF5+fn5+Cj4+IHwgdGVzdC1jcHUtcG9saWN5LmM6NDQ6Nzogbm90ZTogcmVmZXJlbmNlZCBhcmd1
bWVudCBkZWNsYXJlZCBoZXJlCj4+IHwgICAgNDQgfCAgICAgfSB0ZXN0c1tdID0gewo+PiB8ICAg
ICAgIHwgICAgICAgXn5+fn4KPiBJIG11c3QgYmUgbWlzc2luZyBzb21ldGhpbmcgaGVyZTogJS4x
MnMgc2F5cyB0aGF0IG5vIG1vcmUgdGhhbiAxMgo+IGJ5dGVzIGFyZSB0byBiZSByZWFkIGZyb20g
dGhlIHN0cmluZy4gVGhlcmUncyBudWwgdGVybWluYXRvcgo+IHJlcXVpcmVkLiBUaGlzIGlzIHdo
YXQgdGhlIHN0YW5kYXJkIHNheXMKPgo+ICJDaGFyYWN0ZXJzIGZyb20gdGhlIGFycmF5IGFyZSB3
cml0dGVuIHVwIHRvIChidXQgbm90IGluY2x1ZGluZykKPiAgIHRoZSB0ZXJtaW5hdGluZyBudWxs
IGNoYXJhY3Rlci4gSWYgdGhlIHByZWNpc2lvbiBpcyBzcGVjaWZpZWQsIG5vCj4gICBtb3JlIHRo
YW4gdGhhdCBtYW55IGJ5dGVzIGFyZSB3cml0dGVuLiBJZiB0aGUgcHJlY2lzaW9uIGlzIG5vdAo+
ICAgc3BlY2lmaWVkIG9yIGlzIGdyZWF0ZXIgdGhhbiB0aGUgc2l6ZSBvZiB0aGUgYXJyYXksIHRo
ZSBhcnJheQo+ICAgc2hhbGwgY29udGFpbiBhIG51bGwgY2hhcmFjdGVyLiIKPgo+IEZvciB0aGUg
bW9tZW50IGl0IGxvb2tzIHRvIG1lIGFzIGlmIHRoZSBjb21waWxlciB3YXMgd3JvbmcgdG8KPiBj
b21wbGFpbi4KClRoYXQgaXMgbXkgYXNzZXNzbWVudCBhcyB3ZWxsLCBidXQgSSBoYXZlbid0IGhh
ZCB0aW1lIHRvIGZpbGUgYSBHQ0MgYnVnIHlldC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
