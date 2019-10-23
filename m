Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AADE1986
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 14:02:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNFIB-0008Rx-DJ; Wed, 23 Oct 2019 11:59:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JVcx=YQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iNFIA-0008Rs-Nf
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 11:59:06 +0000
X-Inumbo-ID: 8066d648-f58c-11e9-947c-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8066d648-f58c-11e9-947c-12813bfff9fa;
 Wed, 23 Oct 2019 11:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571831942;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=f3UD850zNOqVDjch/gZOYrJEFg4iwFksFcJlJ4RPpSQ=;
 b=cyIc+m7gP4n00dKnuEOh00A6hcW4Sw93st6LUaia1tfBnz3MnXTj4+f+
 Slgy7Og+tnU7i1j1hddNwSnCWUPDjpSgCDd4i2RqzBvM0TFrGL59AYTPh
 QV+omS9iKeDCrTNzsiBw3/FS3zn7qhu8GUt5ee94NOtzHdV7aV24KOIE0 I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YDTNIrMpM7eoikk19x66Nalnn+vZF4ZgymcWu2marG/HVy0u/qnpQYAbs4+E4CSEWqFiF6a0Mx
 T89VjoJo9wu5jyxYQUMjQ1EmLEseNuWb1fQdvSrasBz4KV8raf575GyUHxZFMyKfcqudnA5mSg
 +61kJ4CBp0avRO+7WcNha4YHX5CQvlTJh6bkuXZWRabkVH5p8uJ1jaU9wwJP6fp7mMie1gjFWN
 /YnwLA9jqrIkgt2HvVmQ5M7kylU+mDnwcEcONyq2+Nn0WKpezGzCQEJZ0TWO1Y428KQYY7JKSQ
 9WA=
X-SBRS: 2.7
X-MesageID: 7408332
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,220,1569297600"; 
   d="scan'208";a="7408332"
Date: Wed, 23 Oct 2019 13:58:53 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Message-ID: <20191023115715.GR17494@Air-de-Roger>
References: <20190902081118.31001-1-aisaila@bitdefender.com>
 <71f44ba3-b436-128e-8585-62c731feb7f3@suse.com>
 <CABfawhmYs4SBJZ6u4b7+ymdrTtLzLC+VMQwHovSVDNtw3c7vHg@mail.gmail.com>
 <41a47abf-ec6f-1b19-8803-099b7d54b5bd@bitdefender.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41a47abf-ec6f-1b19-8803-099b7d54b5bd@bitdefender.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v1] x86/altp2m: Add hypercall to create a
 new view and set sve bits
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
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "jun.nakajima@intel.com" <jun.nakajima@intel.com>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMDk6MTE6NTRBTSArMDAwMCwgQWxleGFuZHJ1IFN0ZWZh
biBJU0FJTEEgd3JvdGU6Cj4gCj4gCj4gT24gMDMuMDkuMjAxOSAyMDoyNCwgVGFtYXMgSyBMZW5n
eWVsIHdyb3RlOgo+ID4gT24gVHVlLCBTZXAgMywgMjAxOSBhdCA5OjUzIEFNIEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiBPbiAwMi4wOS4yMDE5IDEwOjEx
LCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToKPiA+Pj4gLS0tIGEveGVuL2luY2x1ZGUv
cHVibGljL2h2bS9odm1fb3AuaAo+ID4+PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL2h2
bV9vcC5oCj4gPj4+IEBAIC0yNDQsNiArMjQ0LDcgQEAgc3RydWN0IHhlbl9odm1fYWx0cDJtX3Zp
ZXcgewo+ID4+PiAgICAgICAvKiBDcmVhdGUgdmlldyBvbmx5OiBkZWZhdWx0IGFjY2VzcyB0eXBl
Cj4gPj4+ICAgICAgICAqIE5PVEU6IGN1cnJlbnRseSBpZ25vcmVkICovCj4gPj4+ICAgICAgIHVp
bnQxNl90IGh2bW1lbV9kZWZhdWx0X2FjY2VzczsgLyogeGVubWVtX2FjY2Vzc190ICovCj4gPj4+
ICsgICAgdWludDhfdCBzZXRfc3ZlOyAvKiBib29sIHZhbHVlICovCj4gPj4+ICAgfTsKPiA+Pgo+
ID4+IFRoaXMgaW50ZXJmYWNlIGlzLCBnaXZlbiB0aGUgcmlnaHQgY29uZmlndXJhdGlvbiwgYXZh
aWxhYmxlIHRvCj4gPj4gZ3Vlc3RzLiBIZW5jZSB5b3UgY2FuJ3Qgc2ltcGx5IGFkZCBhIGZpZWxk
IGhlcmUuIEp1c3QgY29uc2lkZXIKPiA+PiB3aGF0IGhhcHBlbnMgZm9yIGFuIGV4aXN0aW5nIGNh
bGxlciB3aGVuIHRoZXJlIGlzIHJhbmRvbSBkYXRhCj4gPj4gaW4gdGhlIGZpZWxkIHlvdSBub3cg
YXNzaWduIGEgbWVhbmluZy4KPiA+IAo+ID4gUGVyaGFwcyBpbnN0ZWFkIG9mIGV4dGVuZGluZyB0
aGUgSFZNT1AgaXQgd291bGQgbWFrZSBtb3JlIHNlbnNlIHRvCj4gPiBqdXN0IGFkZCBhIHhsIGNv
bmZpZyBvcHRpb24gdGhhdCBkZWZpbmVzIHRoZSAiZGVmYXVsdCIgc3ZlIGJpdCBmb3IKPiA+IGFs
dHAybSB2aWV3cyBpbiB0aGUgZG9tYWluPwo+ID4gCj4gCj4gQWRkaW5nIGEgeGwgY29uZmlnIG9w
dGlvbiB3aWxsIG5vdCB3b3JrIGZvciBzeXN0ZW1zIHRoYXQgZG8gdXNlIHhsLiAKPiBUaGVyZSBp
cyBhIG5lZWQgdGhhdCB0aGlzIHdpbGwgd29yayBpbiBhbGwgY2FzZXMuCgpJIGFzc3VtZSB0aGF0
IHN1Y2ggb3B0aW9uIHdvdWxkIGJlIGltcGxlbWVudGVkIHVzaW5nIGEgRE9NQ1RMLCB3aGljaApj
YW4gYWxzbyBiZSB1c2VkIGJ5IG90aGVyIHRvb2xzdGFja3MuIEkgaG93ZXZlciBoYXZlIG5vIGlk
ZWEgd2hldGhlcgp0aGlzIGlzIGEgc3VpdGFibGUgaW50ZXJmYWNlIG9yIG5vdCBmb3IgdGhpcyBm
ZWF0dXJlLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
