Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC1A103739
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 11:08:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXMsm-0002gE-0x; Wed, 20 Nov 2019 10:06:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TZAz=ZM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iXMsk-0002g4-My
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 10:06:42 +0000
X-Inumbo-ID: 7106cbe8-0b7d-11ea-a30c-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7106cbe8-0b7d-11ea-a30c-12813bfff9fa;
 Wed, 20 Nov 2019 10:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574244398;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9qYweiJiV7oN/WaP+lmUgH68ahDyCJsLBqNA/FFCjtk=;
 b=NYHU4dMnRM52qrtU463deZYSdLugHrmMalaRwtg6L0FbsgXksbYS9Eib
 UqeJWI5ULbA12n9XGOtx99Dvnpg9QAQtb8YJFWLTiPKVLNpD5kMMXQG4u
 wC33Y1mhW4VnSp7oIP3w5BG+tEOviIwceF+HwSGOWWaBAQ0PmiL2XY4c6 E=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: T/gc+UgqmJw7u33q8Arx7wVL2EvykPU5x+2FEzcvND4zaZ36hWtqqQgfigO2aO6T1EVvbhyBWT
 WEhucR87Qw+YQEuHn32T8h+eqYbTaGAHTx6iWZVQy/R6OkbtBgvadXZHUEjAe29dZkvd2ulT/S
 1iTMWS30fZKhZp9cgMIpm5eIBpefsda1AAgikGvHlqohR30seDnZsoPjMgTt3oUjSYBXeGEEGN
 nbLiU7K4xUfLOCyhshNaXPvqnNkS4J6KD0ABWKmagH5h0U0CoCZirFouZXKmlynnuItX5ZJK8X
 AfI=
X-SBRS: 2.7
X-MesageID: 8941086
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,221,1571716800"; 
   d="scan'208";a="8941086"
Date: Wed, 20 Nov 2019 11:06:27 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: "Durrant, Paul" <pdurrant@amazon.com>
Message-ID: <20191120100627.GP72134@Air-de-Roger>
References: <08f386b1d300432384c27ba9a97be697@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <08f386b1d300432384c27ba9a97be697@EX13D32EUC003.ant.amazon.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] grant table size
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMDk6NDM6NTlBTSArMDAwMCwgRHVycmFudCwgUGF1bCB3
cm90ZToKPiBJJ3ZlIGRlYWx0IHdpdGggYSBmZXcgcHJvYmxlbXMgb3ZlciB0aGUgeWVhcnMgd2hl
cmUgdGhlIHJvb3QgY2F1c2Ugd2FzIGEgZ3Vlc3QgcnVubmluZyBvdXQgb2YgZ3JhbnQgdGFibGUg
YW5kIHNvIEknbSB3b25kZXJpbmcgd2hldGhlciBpdCB3b3VsZCBiZSBhIGdvb2QgaWRlYSB0byBh
bGxvdyBhIHRvb2xzdGFjayB0byBpbmNyZWFzZSB0aGUgdGFibGUgc2l6ZSBvZiBhIHJ1bm5pbmcg
Z3Vlc3QsIGUuZy4gd2hlbiBwbHVnZ2luZyBpbiBhIG5ldyBQViBpbnRlcmZhY2UuCkkgd291bGQg
cmF0aGVyIGhhdmUgYSBuZXcgeGwgY29tbWFuZCB0aGF0IGRvZXMgdGhlIGdyYW50IHRhYmxlCmlu
Y3JlYXNlIChpZTogeGwgc2V0LW1heC1ncmFudC1mcmFtZXMpIGluc3RlYWQgb2YgZG9pbmcgaXQg
d2hlbgpwbHVnZ2luZyBuZXcgaW50ZXJmYWNlcy4KCj4gSXQgd291bGQgYXBwZWFyIHRoYXQgY3Vy
cmVudCBMaW51eCBndWVzdHMgd291bGQgbm90IGJlIGFibGUgdG8gbWFrZSB1c2Ugb2YgdGhpcyBh
cyBpdCBzdGFuZHMgKGJ1dCB0aGF0IGNvdWxkIGJlIGZpeGVkKSwgYnV0IGFzIGZhciBhcyBJIGNh
biB0ZWxsIGEgcHZvcHMga2VybmVsIHdvdWxkIG5vdCBtaXNiZWhhdmUgaWYgdGhlIG1heGltdW0g
dGFibGUgc2l6ZSB3ZXJlIHRvIGluY3JlYXNlLiBTaW1pbGFybHkgV2luZG93cyBQViBkcml2ZXJz
IHdvdWxkIG5lZWQgbW9kaWZpY2F0aW9uIHRvIG1ha2UgdXNlIG9mIGEgZHluYW1pYyBtYXhpbXVt
IHRhYmxlIHNpemUgYnV0IHdvdWxkIG5vdCBtaXNiZWhhdmUgYXMgaXMuCj4gRG9lcyBhbnlvbmUg
aGF2ZSBhbnkgb2JqZWN0aW9uIHRvIHRoZSBpZGVhPwoKRG8geW91IGhhdmUgaW4gbWluZCB0byBz
aWduYWwgdGhpcyBzb21laG93IHRvIGd1ZXN0cywgb3IgdGhlCmV4cGVjdGF0aW9uIGlzIHRoYXQg
dGhlIGd1ZXN0IHdpbGwgaGF2ZSB0byBwb2xsIEdOVFRBQk9QX3F1ZXJ5X3NpemUKYW5kIGF0IHNv
bWUgcG9pbnQgdGhlIHNpemUgd2lsbCBpbmNyZWFzZT8KClRoYW5rcywgUm9nZXIuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
